#!/usr/bin/env python3
"""Cross-check one six-distinct SAT case with the independent cvc5 engine."""

from __future__ import annotations

import subprocess

import audit


def main() -> None:
    case = next(
        candidate
        for candidate in audit.enumerate_cases()
        if candidate.target_count == 6
        and audit.ordinal_closure(candidate)["status"] != "UNSAT_ORDINAL"
    )
    solver, _distance, counts = audit.build_full_lra(case, timeout_ms=20_000)
    # This pinned Z3 version's `to_smt2` already includes `(check-sat)`.
    payload = "(set-logic QF_LRA)\n" + solver.to_smt2()
    completed = subprocess.run(
        ["cvc5", "--lang", "smt2"],
        input=payload,
        text=True,
        capture_output=True,
        timeout=30,
        check=False,
    )
    assert completed.returncode == 0, completed.stderr
    assert completed.stdout.strip() == "sat", completed.stdout
    print(
        f"PASS: cvc5 SAT representative={case.key} "
        f"points={counts['point_count']} variables={counts['distance_variable_count']} "
        f"triangles={counts['triangle_inequality_count']} "
        f"strict_kalmanson={counts['strict_kalmanson_count']}"
    )
    print("PASS: second-engine abstract QF_LRA cross-check; no Euclidean claim")


if __name__ == "__main__":
    main()
