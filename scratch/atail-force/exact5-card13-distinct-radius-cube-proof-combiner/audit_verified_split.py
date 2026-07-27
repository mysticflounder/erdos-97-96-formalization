#!/usr/bin/env python3
"""Fail-closed audit tying a compiled root to its current split generator."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SPLIT_GENERATOR = HERE / "generate_verified_distinct_aggregate_split.py"
SHARED_GENERATOR = HERE / "generate_verified_distinct_aggregate_bvexpr.py"
AGGREGATE_SURFACE = (
    ROOT
    / "scratch/atail-force/exact5-card13-distinct-radius-aggregate/surface.py"
)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def load_json(path: Path) -> dict[str, object]:
    value = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(value, dict):
        raise ValueError(f"expected JSON object: {path}")
    return value


def require_equal(label: str, actual: object, expected: object) -> None:
    if actual != expected:
        raise ValueError(f"{label} mismatch: actual={actual!r}, expected={expected!r}")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--module-root", type=Path, required=True)
    parser.add_argument("--map", dest="mapping_path", type=Path, required=True)
    parser.add_argument("--compile-result", type=Path, required=True)
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    module_root = args.module_root.resolve()
    mapping = load_json(args.mapping_path)
    result = load_json(args.compile_result)
    module_prefix = str(mapping["module_prefix"])
    require_equal("compiled module prefix", result["module_prefix"], module_prefix)
    require_equal(
        "compiled module root", Path(str(result["module_root"])).resolve(), module_root
    )

    require_equal(
        "split generator SHA-256",
        sha256(SPLIT_GENERATOR),
        mapping["generator_sha256"],
    )
    require_equal(
        "shared generator SHA-256",
        sha256(SHARED_GENERATOR),
        mapping["shared_generator_sha256"],
    )
    require_equal(
        "aggregate surface SHA-256",
        sha256(AGGREGATE_SURFACE),
        mapping["aggregate_surface_sha256"],
    )

    recorded_modules = mapping["modules_sha256"]
    if not isinstance(recorded_modules, dict):
        raise ValueError("modules_sha256 is not a JSON object")
    actual_modules = sorted((module_root / module_prefix).glob("*.lean"))
    require_equal("module count", len(actual_modules), mapping["module_count"])
    require_equal("module hash count", len(recorded_modules), len(actual_modules))
    for module in actual_modules:
        relative = str(module.relative_to(module_root))
        if relative not in recorded_modules:
            raise ValueError(f"unrecorded generated module: {relative}")
        require_equal(
            f"generated module SHA-256 ({relative})",
            sha256(module),
            recorded_modules[relative],
        )

    cnf = args.cnf.resolve()
    require_equal("CNF bytes", cnf.stat().st_size, result["cnf_bytes"])
    require_equal("CNF SHA-256", sha256(cnf), result["cnf_sha256"])
    with cnf.open("rt", encoding="utf-8") as stream:
        header = stream.readline().strip().split()
        clauses = sum(1 for _ in stream)
    if len(header) != 4 or header[:2] != ["p", "cnf"]:
        raise ValueError("invalid DIMACS header")
    require_equal("CNF variables", int(header[2]), result["variables"])
    require_equal("CNF clauses", int(header[3]), result["clauses"])
    require_equal("CNF physical clause lines", clauses, result["clauses"])

    audit = {
        "schema": "p97-exact5-distinct-aggregate-verified-split-audit-v1",
        "epistemic_status": "CURRENT_GENERATOR_AND_COMPILED_ROOT_HASHES_MATCH",
        "orientation": mapping["orientation"],
        "source_expression_sha256": mapping["source_expression_sha256"],
        "generator_sha256": mapping["generator_sha256"],
        "shared_generator_sha256": mapping["shared_generator_sha256"],
        "aggregate_surface_sha256": mapping["aggregate_surface_sha256"],
        "mapping_sha256": sha256(args.mapping_path),
        "compile_result_sha256": sha256(args.compile_result),
        "cnf_sha256": result["cnf_sha256"],
        "cnf_bytes": result["cnf_bytes"],
        "variables": result["variables"],
        "clauses": result["clauses"],
        "module_count": mapping["module_count"],
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(audit, indent=2, sort_keys=True) + "\n")
    print(json.dumps(audit, sort_keys=True), flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
