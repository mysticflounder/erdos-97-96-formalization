#!/usr/bin/env python3
"""Independent exact replay of the minimized learned metric schema bank."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from pathlib import Path

import z3

from verify import (
    VERTICES,
    canonical_core_schema,
    generalized_application_count,
    named_formula,
)


EXPECTED = "p97-exact6-allcenter-minimized-metric-schema-bank-v1"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def exact_status(core: tuple[str, ...]) -> z3.CheckSatResult:
    table = {
        (left, right): z3.Real(f"d_{left}_{right}")
        for left, right in itertools.combinations(VERTICES, 2)
    }
    solver = z3.Solver()
    solver.add(*(named_formula(name, table) for name in core))
    status = solver.check()
    if status == z3.unknown:
        raise AssertionError(f"exact replay unknown: {solver.reason_unknown()}")
    return status


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bank", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    bank = json.loads(args.bank.read_text(encoding="utf-8"))
    if bank.get("schema") != EXPECTED:
        raise AssertionError("unexpected learned bank schema")
    source_cores = {}
    for source in bank["sources"]:
        path = Path(source["path"])
        if sha256(path) != source["sha256"]:
            raise AssertionError("source result hash drift")
        result = json.loads(path.read_text(encoding="utf-8"))
        source_cores[str(path)] = {
            tuple(record["core"]) for record in result["metric_core_cuts"]
        }

    seen = set()
    provenance_count = 0
    compact_count = 0
    for record in bank["schemas"]:
        vertex_count = int(record["core_vertex_count"])
        schema = tuple(sorted(tuple(item) for item in record["order_schema"]))
        key = (vertex_count, schema)
        if key in seen:
            raise AssertionError("duplicate learned schema")
        seen.add(key)
        if vertex_count <= 8:
            compact_count += 1
        if generalized_application_count(record) != int(record["complete_application_count"]):
            raise AssertionError("learned application count drift")
        for provenance in record["provenance"]:
            source_core = tuple(provenance["source_core"])
            minimal_core = tuple(provenance["minimal_core"])
            if source_core not in source_cores[provenance["result"]]:
                raise AssertionError("provenance source core absent")
            if not set(minimal_core) <= set(source_core):
                raise AssertionError("minimal core is not a source-core subset")
            if exact_status(minimal_core) != z3.unsat:
                raise AssertionError("minimal core is not exact-LRA UNSAT")
            for name in minimal_core:
                deletion = tuple(item for item in minimal_core if item != name)
                if exact_status(deletion) != z3.sat:
                    raise AssertionError("minimal core deletion is not exact-LRA SAT")
            canonical = canonical_core_schema(minimal_core)
            if canonical is None:
                raise AssertionError("learned core is not transportable")
            if canonical["core_vertex_count"] != vertex_count:
                raise AssertionError("learned core vertex count drift")
            if canonical["order_schema"] != schema:
                raise AssertionError("learned canonical schema drift")
            provenance_count += 1

    if len(seen) != int(bank["unique_schema_count"]):
        raise AssertionError("unique learned schema count drift")
    if provenance_count != int(bank["minimal_core_count"]):
        raise AssertionError("learned provenance count drift")
    if compact_count != int(bank["compact_schema_count_k_le_8"]):
        raise AssertionError("compact learned schema count drift")
    output = {
        "schema": "p97-exact6-allcenter-minimized-schema-independent-replay-v1",
        "status": "VERIFIED",
        "bank_sha256": sha256(args.bank),
        "source_count": len(source_cores),
        "unique_schema_count": len(seen),
        "compact_schema_count_k_le_8": compact_count,
        "minimal_core_count": provenance_count,
        "all_source_hashes_replayed": True,
        "all_minimal_cores_exact_lra_unsat": True,
        "all_single_deletions_exact_lra_sat": True,
        "all_canonical_transports_reconstructed": True,
    }
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(output, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
