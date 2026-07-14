#!/usr/bin/env python3
"""Minimize the new formalized-core-clean equality-unit subsystems.

The row-level oracle retains whole four-point circle rows.  That is useful for
CEGAR cuts, but it can obscure the smaller distance-equality pattern that a
future Lean theorem should state.  This driver takes a cross-checked UNIT row
core, expands it into individually named squared-distance equalities, and
greedily removes an equality only when msolve proposes UNIT and Singular
independently confirms UNIT over QQ.

The inputs below are immutable outputs of
``formalized_core_metric_followup.py``.  They are still fixed-placement,
card-12-only, target-unfaithful shadows; minimization does not strengthen that
scope.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
import time
from pathlib import Path
from typing import Any, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
ROOT = HERE.parents[2]
for path in (str(ROOT), str(ORACLE_DIR)):
    if path not in sys.path:
        sys.path.insert(0, path)

import oracle  # noqa: E402


SCHEMA = "p97-atail-formalized-core-clean-equality-minimizer-v1"
CALL_TIMEOUT_S = 12.0
WALL_BUDGET_S = 240.0


# The (5,5,5) core was retained from source witness
# 1f463aa2527c3c7195fe1d20649014a86c991e4a9a8742ff163b0cf6bd501143.
# The complete 12-row source system and this five-row subset were each UNIT in
# Singular and in msolve under both declared variable orders.
CASES: dict[int, dict[str, Any]] = {
    0: {
        "profile": [4, 5, 6],
        "n": 12,
        "source_witness_sha256":
            "86c800c54fff8e965f0047ad881a1369d4fe9b0112429cf53a7fb2507c55da9d",
        "rows": [
            {"center": 1, "support": [0, 2, 5, 6]},
            {"center": 5, "support": [0, 1, 9, 10]},
            {"center": 7, "support": [0, 3, 6, 11]},
            {"center": 8, "support": [0, 3, 7, 9]},
            {"center": 9, "support": [0, 4, 8, 10]},
            {"center": 10, "support": [1, 6, 7, 8]},
            {"center": 11, "support": [2, 3, 8, 9]},
        ],
    },
    1: {
        "profile": [5, 5, 5],
        "n": 12,
        "source_witness_sha256":
            "1f463aa2527c3c7195fe1d20649014a86c991e4a9a8742ff163b0cf6bd501143",
        "rows": [
            {"center": 1, "support": [0, 2, 6, 7]},
            {"center": 2, "support": [0, 1, 9, 10]},
            {"center": 6, "support": [2, 7, 9, 11]},
            {"center": 9, "support": [0, 5, 10, 11]},
            {"center": 10, "support": [1, 6, 8, 9]},
        ],
    },
}


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def equality_records(
    n: int, rows: Sequence[oracle.MetricRow]
) -> tuple[dict[str, Any], ...]:
    records: list[dict[str, Any]] = []
    for row_index, row in enumerate(rows):
        pivot = row.support[0]
        polynomials = oracle.row_polynomials(n, row)
        for support_point, polynomial in zip(row.support[1:], polynomials):
            records.append(
                {
                    "row_index": row_index,
                    "center": row.center,
                    "left": pivot,
                    "right": support_point,
                    "polynomial": oracle.serialize_poly(polynomial),
                }
            )
    return tuple(records)


def verdict(result: oracle.OracleResult) -> dict[str, str]:
    answer = {"verdict": result.verdict}
    if result.detail is not None:
        answer["detail"] = result.detail
    return answer


def crosscheck(
    variables: Sequence[str], records: Sequence[Mapping[str, object]],
    *, timeout_s: float = CALL_TIMEOUT_S,
) -> dict[str, Any]:
    polynomials = tuple(str(record["polynomial"]) for record in records)
    singular = oracle.run_singular(variables, polynomials, timeout_s=timeout_s)
    msolve_forward = oracle.run_msolve(
        variables, polynomials, timeout_s=timeout_s
    )
    msolve_reverse = oracle.run_msolve(
        tuple(reversed(variables)), polynomials, timeout_s=timeout_s
    )
    values = (singular.verdict, msolve_forward.verdict, msolve_reverse.verdict)
    status = (
        f"CROSSCHECKED_{values[0]}"
        if len(set(values)) == 1 and values[0] in {"UNIT", "NONUNIT"}
        else "UNDECIDED_ORACLE_DISAGREEMENT_OR_TIMEOUT"
    )
    return {
        "status": status,
        "singular_qq": verdict(singular),
        "msolve_qq_forward_variables": verdict(msolve_forward),
        "msolve_qq_reverse_variables": verdict(msolve_reverse),
    }


def minimize(case: Mapping[str, object]) -> dict[str, Any]:
    n = int(case["n"])
    rows = tuple(oracle.row_from_dict(record) for record in case["rows"])
    records = equality_records(n, rows)
    variables = tuple(str(variable) for variable in oracle.variable_symbols(n))
    initial = crosscheck(variables, records)
    if initial["status"] != "CROSSCHECKED_UNIT":
        return {
            "status": "STOPPED_INPUT_NOT_CROSSCHECKED_UNIT",
            "initial_crosscheck": initial,
        }

    active = list(enumerate(records))
    attempts: list[dict[str, Any]] = []
    started = time.monotonic()
    pass_index = 0
    while time.monotonic() - started < WALL_BUDGET_S:
        removed_this_pass = 0
        for original_index, record in tuple(active):
            remaining = WALL_BUDGET_S - (time.monotonic() - started)
            if remaining <= 0.05:
                break
            candidate = tuple(
                candidate_record
                for index, candidate_record in active
                if index != original_index
            )
            polynomials = tuple(
                str(candidate_record["polynomial"])
                for candidate_record in candidate
            )
            timeout = min(CALL_TIMEOUT_S, remaining)
            proposal = oracle.run_msolve(
                variables, polynomials, timeout_s=timeout
            )
            confirmation: oracle.OracleResult | None = None
            if proposal.verdict == "UNIT":
                remaining = WALL_BUDGET_S - (time.monotonic() - started)
                if remaining > 0.05:
                    confirmation = oracle.run_singular(
                        variables,
                        polynomials,
                        timeout_s=min(CALL_TIMEOUT_S, remaining),
                    )
            removed = (
                proposal.verdict == "UNIT"
                and confirmation is not None
                and confirmation.verdict == "UNIT"
            )
            attempts.append(
                {
                    "pass": pass_index,
                    "original_index": original_index,
                    "equality": {
                        key: value
                        for key, value in record.items()
                        if key != "polynomial"
                    },
                    "proposal": proposal.verdict,
                    "confirmation": (
                        confirmation.verdict
                        if confirmation is not None
                        else "NOT_RUN"
                    ),
                    "removed": removed,
                }
            )
            if removed:
                active = [item for item in active if item[0] != original_index]
                removed_this_pass += 1
        if removed_this_pass == 0:
            break
        pass_index += 1

    retained = tuple(record for _, record in active)
    final = crosscheck(variables, retained)
    retained_public = [
        {key: value for key, value in record.items() if key != "polynomial"}
        for record in retained
    ]
    return {
        "status": (
            "CROSSCHECKED_UNIT_EQUALITY_SUBSYSTEM"
            if final["status"] == "CROSSCHECKED_UNIT"
            else "UNDECIDED_FINAL_CROSSCHECK"
        ),
        "strategy": "repeated-greedy-equality-deletion-msolve-proposal-singular-confirmation",
        "wall_budget_seconds": WALL_BUDGET_S,
        "initial_equality_count": len(records),
        "retained_equality_count": len(retained),
        "completed_passes": pass_index + 1,
        "budget_exhausted": time.monotonic() - started >= WALL_BUDGET_S,
        "initial_crosscheck": initial,
        "final_crosscheck": final,
        "retained_equalities": retained_public,
        "retained_equalities_sha256": canonical_sha256(retained_public),
        "attempts_sha256": canonical_sha256(attempts),
        "attempt_count": len(attempts),
    }


def document(profile_index: int) -> dict[str, Any]:
    case = CASES[profile_index]
    return {
        "schema": SCHEMA,
        "scope": {
            "target_faithful": False,
            "fixed_placement_only": True,
            "card_11_included": False,
            "formalized_metric_core_bank_clean": True,
            "trusted_exact_cas_computation": True,
            "nullstellensatz_certificate_replayed": False,
            "producer_proved": False,
        },
        "case": {
            "profile": case["profile"],
            "source_witness_sha256": case["source_witness_sha256"],
            "input_rows": case["rows"],
            "input_rows_sha256": canonical_sha256(case["rows"]),
            "minimization": minimize(case),
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--profile-index", type=int, choices=tuple(CASES), required=True)
    args = parser.parse_args()
    print(json.dumps(document(args.profile_index), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
