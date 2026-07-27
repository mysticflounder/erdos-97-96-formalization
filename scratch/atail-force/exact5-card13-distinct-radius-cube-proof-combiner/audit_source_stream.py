#!/usr/bin/env python3
"""Cross-check verified-source modules against source-core assertion indices."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SURFACE_PATH = (
    ROOT
    / "scratch/atail-force/exact5-card13-distinct-radius-aggregate/surface.py"
)
ORBIT = {
    "direct": "asymmetricSourceLeft",
    "mirror": "asymmetricSourceRight",
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_json(path: Path) -> dict[str, object]:
    value = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(value, dict):
        raise ValueError(f"expected JSON object: {path}")
    return value


def require_equal(label: str, actual: object, expected: object) -> None:
    if actual != expected:
        raise ValueError(f"{label} mismatch: actual={actual!r}, expected={expected!r}")


def load_surface():
    spec = importlib.util.spec_from_file_location(
        "exact5_distinct_verified_stream_audit_surface", SURFACE_PATH
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {SURFACE_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def newline_fingerprint(sexprs: list[str]) -> str:
    return hashlib.sha256(("\n".join(sexprs) + "\n").encode()).hexdigest()


def length_delimited_fingerprint(sexprs: list[str]) -> str:
    digest = hashlib.sha256()
    for sexpr in sexprs:
        encoded = sexpr.encode("utf-8")
        digest.update(len(encoded).to_bytes(8, "big"))
        digest.update(encoded)
    return digest.hexdigest()


def audit_core_manifest(
    manifest_path: Path,
    orbit: str,
    assertions: list[str],
    source_fingerprint: str,
) -> tuple[int, int]:
    manifest = load_json(manifest_path)
    require_equal("source-core manifest orbit", manifest["orbit"], orbit)
    manifest_fingerprint = manifest.get("source_assertions_sha256")
    if manifest_fingerprint is not None:
        require_equal(
            "source-core manifest fingerprint",
            manifest_fingerprint,
            source_fingerprint,
        )
    checked_leaves = 0
    checked_entries = 0
    leaves = manifest.get("leaves")
    if not isinstance(leaves, list):
        raise ValueError("source-core manifest leaves is not a list")
    for leaf in leaves:
        if not isinstance(leaf, dict) or not isinstance(leaf.get("path"), str):
            raise ValueError(f"malformed leaf manifest entry: {leaf!r}")
        leaf_path = manifest_path.parent / str(leaf["path"])
        payload = load_json(leaf_path)
        require_equal("leaf orbit", payload["orbit"], orbit)
        require_equal(
            "leaf source fingerprint",
            payload["source_assertions_sha256"],
            source_fingerprint,
        )
        core = payload.get("core")
        if core is None:
            continue
        if not isinstance(core, list):
            raise ValueError(f"malformed leaf core: {leaf_path}")
        for entry in core:
            if not isinstance(entry, dict):
                raise ValueError(f"malformed core entry: {entry!r}")
            index = entry.get("index")
            if not isinstance(index, int) or not 0 <= index < len(assertions):
                raise ValueError(f"core assertion index out of range: {entry!r}")
            require_equal(
                f"core assertion sexpr at index {index}",
                entry.get("assertion"),
                assertions[index],
            )
            checked_entries += 1
        checked_leaves += 1
    return checked_leaves, checked_entries


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orientation", choices=tuple(ORBIT), required=True)
    parser.add_argument("--map", dest="mapping_path", type=Path, required=True)
    parser.add_argument("--source-core-manifest", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    mapping = load_json(args.mapping_path)
    orbit = ORBIT[args.orientation]
    require_equal("mapping orientation", mapping["orientation"], args.orientation)
    require_equal("mapping orbit", mapping["orbit"], orbit)
    require_equal(
        "aggregate surface SHA-256",
        mapping["aggregate_surface_sha256"],
        sha256(SURFACE_PATH),
    )

    surface = load_surface()
    outer, _rank, counts = surface.build(orbit, 0)
    assertions = [assertion.sexpr() for assertion in outer.solver.assertions()]
    require_equal(
        "source assertion count", len(assertions), mapping["emitted_source_assertions"]
    )
    require_equal(
        "surface count metadata", counts["total_source_assertions"], len(assertions)
    )
    newline_sha = newline_fingerprint(assertions)
    require_equal(
        "ordered source-expression SHA-256",
        newline_sha,
        mapping["source_expression_sha256"],
    )
    core_sha = length_delimited_fingerprint(assertions)

    checked_leaves = 0
    checked_entries = 0
    if args.source_core_manifest is not None:
        checked_leaves, checked_entries = audit_core_manifest(
            args.source_core_manifest.resolve(), orbit, assertions, core_sha
        )

    audit = {
        "schema": "p97-exact5-distinct-source-stream-cross-audit-v1",
        "epistemic_status": (
            "VERIFIED_GENERATOR_AND_SOURCE_CORE_MANIFEST_STREAM_MATCH"
            if args.source_core_manifest is not None
            else "VERIFIED_GENERATOR_STREAM_AND_SOURCE_CORE_FINGERPRINT_COMPUTED"
        ),
        "orientation": args.orientation,
        "orbit": orbit,
        "source_assertion_count": len(assertions),
        "source_expression_sha256": newline_sha,
        "source_core_length_delimited_sha256": core_sha,
        "aggregate_surface_sha256": sha256(SURFACE_PATH),
        "source_core_manifest_checked": args.source_core_manifest is not None,
        "checked_core_leaves": checked_leaves,
        "checked_core_entries": checked_entries,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(audit, indent=2, sort_keys=True) + "\n")
    print(json.dumps(audit, sort_keys=True), flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
