#!/usr/bin/env python3
"""Exact replay and deletion-minimality checks for the two common cores.

The Farkas replay uses integer coefficient dictionaries, independently of an
SMT engine. Z3 is used only to check that the displayed raw-constraint cores
are UNSAT and that deleting any one raw constraint restores SAT.
"""

from __future__ import annotations

import json
from collections import defaultdict
from pathlib import Path

from z3 import Real, Solver


def vector(**terms: int) -> dict[str, int]:
    return {name: value for name, value in terms.items() if value}


def add_vectors(vectors: list[dict[str, int]]) -> dict[str, int]:
    total: dict[str, int] = defaultdict(int)
    for item in vectors:
        for name, coefficient in item.items():
            total[name] += coefficient
    return {name: coefficient for name, coefficient in total.items() if coefficient}


def z3_check(names: list[str], formulas: list[object]):
    solver = Solver()
    solver.add(*formulas)
    result = solver.check()
    deletion_results = {}
    for index, name in enumerate(names):
        trial = Solver()
        trial.add(*[formula for j, formula in enumerate(formulas) if j != index])
        deletion_results[name] = str(trial.check())
    return str(result), deletion_results


def single_row_core():
    d0u, d0v, d1u, d1v = map(Real, ("d0u", "d0v", "d1u", "d1v"))
    r, physical = map(Real, ("r", "physical"))
    names = ["K2", "T0:u", "T0:v", "physical:u", "physical:v"]
    formulas = [
        d0u + d1v >= d0v + d1u + 1,
        d0u == r,
        d0v == r,
        d1u == physical,
        d1v == physical,
    ]
    vectors = [
        vector(d0u=1, d1v=1, d0v=-1, d1u=-1),
        vector(d0v=1, r=-1),
        vector(r=1, d0u=-1),
        vector(d1u=1, physical=-1),
        vector(physical=1, d1v=-1),
    ]
    verdict, deletions = z3_check(names, formulas)
    return {
        "name": "single_T0_physical_shared_late_pair",
        "raw_constraints": names,
        "farkas_sum": add_vectors(vectors),
        "z3_verdict": verdict,
        "single_deletion_verdicts": deletions,
        "deletion_minimal": verdict == "unsat" and set(deletions.values()) == {"sat"},
    }


def overlap_chain_core():
    d0u, d0m, d0v, d1u, d1v = map(
        Real, ("d0u", "d0m", "d0v", "d1u", "d1v")
    )
    r, rho, physical = map(Real, ("r", "rho", "physical"))
    names = [
        "K2",
        "T0:u",
        "T0:middle",
        "T1:middle",
        "T1:v",
        "physical:u",
        "physical:v",
    ]
    formulas = [
        d0u + d1v >= d0v + d1u + 1,
        d0u == r,
        d0m == r,
        d0m == rho,
        d0v == rho,
        d1u == physical,
        d1v == physical,
    ]
    vectors = [
        vector(d0u=1, d1v=1, d0v=-1, d1u=-1),
        vector(r=1, d0u=-1),
        vector(d0m=1, r=-1),
        vector(rho=1, d0m=-1),
        vector(d0v=1, rho=-1),
        vector(d1u=1, physical=-1),
        vector(physical=1, d1v=-1),
    ]
    verdict, deletions = z3_check(names, formulas)
    return {
        "name": "T0_T1_overlap_chain_physical_shared_late_pair",
        "raw_constraints": names,
        "farkas_sum": add_vectors(vectors),
        "z3_verdict": verdict,
        "single_deletion_verdicts": deletions,
        "deletion_minimal": verdict == "unsat" and set(deletions.values()) == {"sat"},
    }


def main() -> None:
    records = [single_row_core(), overlap_chain_core()]
    payload = {
        "status": "EXACT_INTEGER_FARKAS_REPLAY_AND_DELETION_MINIMALITY_PASS",
        "records": records,
    }
    assert all(record["farkas_sum"] == {} for record in records)
    assert all(record["deletion_minimal"] for record in records)
    output = Path(__file__).with_name("farkas_core_verification.json")
    output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps(payload, sort_keys=True))


if __name__ == "__main__":
    main()
