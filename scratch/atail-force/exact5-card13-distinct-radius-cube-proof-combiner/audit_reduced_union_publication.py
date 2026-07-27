#!/usr/bin/env python3
"""Fail-closed audit of one repo-relative reduced-union publication tree."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
GENERATOR = HERE / "generate_verified_reduced_union_split.py"
CHUNKER = HERE / "chunk_verified_reduced_union_lrat.py"
spec = importlib.util.spec_from_file_location(
    "verified_distinct_reduced_union_generator", GENERATOR
)
if spec is None or spec.loader is None:
    raise RuntimeError(f"cannot load {GENERATOR}")
generator = importlib.util.module_from_spec(spec)
spec.loader.exec_module(generator)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def load_json(path: Path) -> dict[str, object]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(payload, dict):
        raise ValueError(f"expected JSON object: {path}")
    return payload


def require_equal(label: str, actual: object, expected: object) -> None:
    if actual != expected:
        raise ValueError(f"{label} mismatch: actual={actual!r}, expected={expected!r}")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orientation", choices=("direct", "mirror"), required=True)
    parser.add_argument("--publication-root", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    root = args.publication_root.resolve()
    mapping_path = root / "map.json"
    mapping = load_json(mapping_path)
    require_equal("orientation", mapping.get("orientation"), args.orientation)
    prefix = generator.module_prefix(args.orientation)
    require_equal("module prefix", mapping.get("module_prefix"), prefix)
    module_dir = root / prefix
    certificate_dir = module_dir / "certificates"
    certificate_manifest_path = certificate_dir / "manifest.json"
    certificate_manifest = load_json(certificate_manifest_path)
    require_equal(
        "certificate orientation",
        certificate_manifest.get("orientation"),
        args.orientation,
    )
    require_equal(
        "certificate status",
        certificate_manifest.get("epistemic_status"),
        "BYTE_EXACT_SPLIT_OF_KERNEL_CHECKED_LRAT",
    )

    require_equal("union generator hash", sha256(GENERATOR), mapping["generator_sha256"])
    require_equal(
        "shared generator hash",
        sha256(generator.SHARED_GENERATOR),
        mapping["shared_generator_sha256"],
    )
    require_equal(
        "aggregate surface hash",
        sha256(Path(generator.shared.surface.__file__)),
        mapping["aggregate_surface_sha256"],
    )
    recorded_modules = mapping.get("modules_sha256")
    if not isinstance(recorded_modules, dict):
        raise ValueError("map has no module-hash object")
    require_equal("recorded module count", len(recorded_modules), mapping["module_count"])
    for relative, expected_hash in recorded_modules.items():
        if not isinstance(relative, str) or not isinstance(expected_hash, str):
            raise ValueError("malformed module-hash record")
        path = root / relative
        if not path.is_file():
            raise FileNotFoundError(path)
        require_equal(f"module hash ({relative})", sha256(path), expected_hash)

    certificate_info = certificate_manifest.get("certificate_module")
    if not isinstance(certificate_info, dict):
        raise ValueError("certificate manifest has no certificate module")
    certificate_path = (certificate_dir / str(certificate_info["path"])).resolve()
    require_equal("certificate path", certificate_path, (module_dir / "Certificate.lean").resolve())
    require_equal("certificate bytes", certificate_path.stat().st_size, certificate_info["bytes"])
    require_equal("certificate hash", sha256(certificate_path), certificate_info["sha256"])

    parts = certificate_manifest.get("parts")
    if not isinstance(parts, list) or not parts:
        raise ValueError("certificate manifest has no LRAT parts")
    digest = hashlib.sha256()
    whole_bytes = 0
    for part in parts:
        if not isinstance(part, dict):
            raise ValueError("malformed LRAT part record")
        path = certificate_dir / str(part["path"])
        require_equal(f"part bytes ({path.name})", path.stat().st_size, part["bytes"])
        require_equal(f"part hash ({path.name})", sha256(path), part["sha256"])
        if path.stat().st_size > int(certificate_manifest["max_part_bytes"]):
            raise ValueError(f"LRAT part exceeds bound: {path}")
        with path.open("rb") as stream:
            while block := stream.read(1024 * 1024):
                digest.update(block)
                whole_bytes += len(block)
    whole = certificate_manifest.get("whole")
    if not isinstance(whole, dict):
        raise ValueError("certificate manifest has no whole-file record")
    require_equal("reassembled bytes", whole_bytes, whole["bytes"])
    require_equal("reassembled hash", digest.hexdigest(), whole["sha256"])

    forbidden = ("/tmp/", "/private/tmp/")
    for path in module_dir.glob("*.lean"):
        text = path.read_text(encoding="utf-8")
        if any(item in text for item in forbidden):
            raise ValueError(f"non-portable absolute path in {path}")

    audit = {
        "schema": "p97-exact5-distinct-reduced-union-publication-audit-v1",
        "epistemic_status": "REPO_RELATIVE_PUBLICATION_TREE_HASHES_MATCH",
        "orientation": args.orientation,
        "module_prefix": prefix,
        "source_assertions": mapping["reduced_union_size"],
        "source_chunks": mapping["chunk_count"],
        "generated_modules": mapping["module_count"],
        "certificate_parts": len(parts),
        "certificate_bytes": whole_bytes,
        "certificate_sha256": digest.hexdigest(),
        "map_sha256": sha256(mapping_path),
        "certificate_manifest_sha256": sha256(certificate_manifest_path),
        "generator_sha256": sha256(GENERATOR),
        "chunker_sha256": sha256(CHUNKER),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(audit, indent=2, sort_keys=True) + "\n")
    print(json.dumps(audit, sort_keys=True), flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
