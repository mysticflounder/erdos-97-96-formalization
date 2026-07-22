#!/usr/bin/env python3
"""Run the audited whole-carrier CNF outer with exact planar bank cuts."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
BASE_PATH = HERE.parent / "generic-biapex-kalmanson-cnf" / "exact_outer_cnf.py"
SPEC = importlib.util.spec_from_file_location("whole_carrier_exact_outer", BASE_PATH)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError("cannot load the audited direct-CNF outer")
BASE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(BASE)


Membership = tuple[int, int]


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_planar_bank(path: Path) -> tuple[list[dict[str, Any]], dict[str, object]]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    expected = "p97-whole-carrier-planar-membership-schema-bank-v1"
    if payload.get("schema") != expected:
        raise ValueError("unexpected planar schema bank")
    records = payload.get("schemas")
    if not isinstance(records, list) or int(payload.get("schema_count", -1)) != len(records):
        raise ValueError("planar schema bank count mismatch")
    checked: list[dict[str, Any]] = []
    seen: set[tuple[int, tuple[Membership, ...]]] = set()
    for index, record in enumerate(records):
        k = int(record["active_role_count"])
        memberships = tuple(
            sorted(tuple(map(int, membership)) for membership in record["memberships"])
        )
        if k < 2 or len(set(memberships)) != len(memberships):
            raise ValueError(f"malformed planar schema {index}")
        if any(center == point or not (0 <= center < k and 0 <= point < k)
               for center, point in memberships):
            raise ValueError(f"invalid membership in planar schema {index}")
        if set(range(k)) != {role for membership in memberships for role in membership}:
            raise ValueError(f"planar schema {index} has an inactive declared role")
        if record.get("transport") != "all_injective_role_maps":
            raise ValueError(f"planar schema {index} has an unsound transport mode")
        key = (k, memberships)
        if key in seen:
            raise ValueError(f"duplicate planar schema {index}")
        seen.add(key)
        checked.append({**record, "active_role_count": k, "memberships": memberships})
    return checked, {
        "planar_bank": str(path),
        "planar_bank_sha256": sha256(path),
        "planar_bank_schema": expected,
        "planar_bank_schema_count": len(checked),
        "planar_bank_epistemic_status": payload.get("epistemic_status"),
    }


def automorphisms(k: int, memberships: tuple[Membership, ...]) -> list[tuple[int, ...]]:
    source = set(memberships)
    result = []
    for permutation in itertools.permutations(range(k)):
        transformed = {(permutation[center], permutation[point]) for center, point in source}
        if transformed == source:
            result.append(permutation)
    if not result:
        raise AssertionError("identity must be a schema automorphism")
    return result


def add_planar_cuts(cnf: Any, n: int, records: list[dict[str, Any]]) -> dict[str, object]:
    embedded_schema_count = 0
    skipped_schema_count = 0
    raw_injection_count = 0
    clause_count = 0
    schema_details = []
    for record in records:
        k = int(record["active_role_count"])
        memberships = tuple(record["memberships"])
        if k > n:
            skipped_schema_count += 1
            continue
        embedded_schema_count += 1
        group = automorphisms(k, memberships)
        schema_raw = 0
        schema_clauses = 0
        for targets in itertools.permutations(range(n), k):
            schema_raw += 1
            canonical = min(tuple(targets[permutation[role]] for role in range(k))
                            for permutation in group)
            if targets != canonical:
                continue
            transformed = tuple(
                sorted((targets[center], targets[point]) for center, point in memberships)
            )
            cnf.add(
                "preloaded_planar_schema_cut",
                [-cnf.ids[f"m_{center}_{point}"] for center, point in transformed],
            )
            schema_clauses += 1
        raw_injection_count += schema_raw
        clause_count += schema_clauses
        schema_details.append(
            {
                "active_role_count": k,
                "membership_count": len(memberships),
                "automorphism_group_size": len(group),
                "raw_injection_count": schema_raw,
                "unique_clause_count": schema_clauses,
                "consumer": record.get("consumer"),
            }
        )
    return {
        "embedded_planar_schema_count": embedded_schema_count,
        "skipped_planar_schema_count_core_larger_than_n": skipped_schema_count,
        "planar_raw_injection_count": raw_injection_count,
        "planar_schema_clause_count": clause_count,
        "planar_schema_details": schema_details,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", required=True, type=int)
    parser.add_argument("--second-apex", required=True, type=int)
    parser.add_argument("--preload-bank", required=True, type=Path)
    parser.add_argument("--planar-bank", required=True, type=Path)
    parser.add_argument("--cnf", required=True, type=Path)
    parser.add_argument("--result", required=True, type=Path)
    parser.add_argument("--solver-log", type=Path)
    parser.add_argument("--proof", type=Path)
    parser.add_argument("--timeout-seconds", type=int, default=300)
    parser.add_argument("--cadical", default="cadical")
    parser.add_argument("--encode-only", action="store_true")
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()
    if args.timeout_seconds <= 0:
        parser.error("--timeout-seconds must be positive")
    if args.self_test:
        BASE.self_test()

    cnf, metadata = BASE.encode(args.n, args.second_apex, args.preload_bank)
    records, planar_metadata = load_planar_bank(args.planar_bank)
    planar_counts = add_planar_cuts(cnf, args.n, records)
    metadata = {
        **metadata,
        **planar_metadata,
        **planar_counts,
        "encoding_schema": "p97-biapex-structural-outer-direct-cnf-plus-planar-bank-v1",
        "variable_count": len(cnf.names) - 1,
        "clause_count": len(cnf.clauses),
        "clause_block_counts": dict(sorted(cnf.block_counts.items())),
    }
    cnf.write_dimacs(args.cnf, metadata)
    result: dict[str, object] = {**metadata, "cnf_path": str(args.cnf)}
    if args.encode_only:
        result["solver_status"] = "NOT_RUN"
    else:
        solved, stdout, stderr = BASE.solve(
            cnf, args.cnf, metadata, args.proof, args.timeout_seconds, args.cadical
        )
        result.update(solved)
        if args.solver_log is not None:
            args.solver_log.parent.mkdir(parents=True, exist_ok=True)
            args.solver_log.write_text(stdout + stderr, encoding="utf-8")
    args.result.parent.mkdir(parents=True, exist_ok=True)
    args.result.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
