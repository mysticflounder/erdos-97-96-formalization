#!/usr/bin/env python3
"""Build a fail-closed checkpoint for the n=12/n=13 geometry regressions."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


def artifact(path: Path) -> dict[str, object]:
    return {
        "path": str(path),
        "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
        "bytes": path.stat().st_size,
    }


def load(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def record(root: Path, subdir: str, n: int) -> dict[str, object]:
    here = root / subdir if subdir else root
    carrier_path = here / "carrier.json"
    check_path = here / "check_results.json"
    cert_path = here / "minimal_two_cycle.json"
    verify_path = here / "minimal_two_cycle.verify.json"
    bank_check_path = here / "schema_bank_check.json"
    full_bank_check_path = here / "schema_full_bank_check.json"
    carrier, check, cert, verify = map(load, [carrier_path, check_path, cert_path, verify_path])
    if carrier.get("n") != n:
        raise AssertionError(f"wrong carrier n in {carrier_path}")
    if check.get("first_failed_layer") != "PLANAR_STRICT_CONVEX_CYCLIC_REALIZATION":
        raise AssertionError(f"layer-one failure is not decisive for n={n}")
    results = check["layer_1"]["solver_results"]
    if set(entry["verdict"] for entry in results.values()) != {"UNSAT"}:
        raise AssertionError(f"not all solver/encoding pairs are UNSAT for n={n}")
    if verify.get("status") != "VERIFIED" or verify.get("derived_contradiction") != "0 >= 2":
        raise AssertionError(f"exact two-cycle replay failed for n={n}")
    for bank_check in [load(bank_check_path), load(full_bank_check_path)]:
        if bank_check.get("status") != "VERIFIED_ABSENT":
            raise AssertionError(f"schema is unexpectedly present for n={n}")
    return {
        "n": n,
        "first_failed_layer": check["first_failed_layer"],
        "solver_verdicts": {name: entry["verdict"] for name, entry in sorted(results.items())},
        "core_vertex_count": cert["core_vertex_count"],
        "canonical_schema": cert["reflection_canonical_order_schema"],
        "exact_certificate_status": verify["status"],
        "source_outer_result_sha256": carrier["source_sha256"],
        "artifacts": {
            "carrier": artifact(carrier_path),
            "layer_check": artifact(check_path),
            "minimal_certificate": artifact(cert_path),
            "certificate_replay": artifact(verify_path),
            "active_bank_check": artifact(bank_check_path),
            "full_bank_check": artifact(full_bank_check_path),
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    n12 = record(args.root, "", 12)
    n13 = record(args.root, "n13", 13)
    n12_in_n13 = load(args.root / "n13" / "n12_schema_embedding.json")
    n13_in_n12 = load(args.root / "n13_schema_in_n12_embedding.json")
    if n12_in_n13.get("status") != "ABSENT" or n13_in_n12.get("status") != "ABSENT":
        raise AssertionError("the two extracted schemas are not carrier-distinct")
    payload = {
        "schema": "p97-higher-n-geometry-regression-checkpoint-v1",
        "status": "VERIFIED_PER_CARRIER_STRICT_CONVEX_FAILURES",
        "epistemic_status": "EXACT_QF_LRA_PLUS_INDEPENDENT_FARKAS_REPLAY",
        "conclusion": (
            "The saved n=12 and n=13 Boolean outer carriers each violate a necessary "
            "strict-convex Kalmanson system through distinct existing-consumer schemas."
        ),
        "scope_warning": (
            "Per-carrier elimination is regression evidence only. It does not prove "
            "uniform occurrence, arbitrary-cardinality coverage, or close a source sorry."
        ),
        "records": [n12, n13],
        "cross_embedding": {
            "n12_schema_in_n13": n12_in_n13["status"],
            "n13_schema_in_n12": n13_in_n12["status"],
        },
        "existing_lean_consumer": "Problem97.ATailOrdinalKalmansonCycle.false_of_two_cycle",
        "new_schema_count": 2,
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"status": payload["status"], "new_schema_count": 2}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
