#!/usr/bin/env python3
"""Add all-center selected K4 to the four corrected fixed QF_LRA fixtures."""

from __future__ import annotations

from z3 import sat, unsat

from audit_two_by_two_outcomes_lra import (
    add_global_selected_k4,
    add_selected_k4_at_center,
    add_selected_four,
    add_unique_exact_four,
    base_solver,
)


FIRST = (1, 5, 6, 8)
SECOND = (0, 5, 9, 10)
Z1 = 9
Z2 = 10

# name -> (row at Z1, row at Z2, ingress center, ingress support)
FIXTURES = {
    "common_delete_5": (
        (0, 2, 3, 6),
        (2, 4, 7, 8),
        2,
        (1, 3, 7, 10),
    ),
    "common_delete_6": (
        (0, 2, 3, 5),
        (2, 4, 7, 8),
        2,
        (1, 3, 7, 10),
    ),
    "cross_5_at_9_6_at_8": (
        (0, 2, 6, 7),
        (3, 4, 5, 7),
        5,
        (2, 4, 6, 10),
    ),
    "cross_6_at_9_5_at_8": (
        (0, 2, 3, 5),
        (0, 4, 6, 7),
        9,
        (0, 2, 3, 5),
    ),
}


def main() -> None:
    verdicts: dict[str, str] = {}
    single_center_unsat: dict[str, list[int]] = {}
    for name, fixture in FIXTURES.items():
        solver, d = solver_for_fixture(fixture)
        solver.set(timeout=120_000)
        add_global_selected_k4(solver, d)
        result = solver.check()
        if result == sat:
            verdict = "SAT"
        elif result == unsat:
            verdict = "UNSAT"
        else:
            verdict = f"UNKNOWN:{solver.reason_unknown()}"
        verdicts[name] = verdict
        print(name, verdict)
        single_unsat = []
        for center in range(11):
            local, local_d = solver_for_fixture(fixture)
            add_selected_k4_at_center(local, local_d, center)
            if local.check() == unsat:
                single_unsat.append(center)
        single_center_unsat[name] = single_unsat
        print(name, "single_center_K4_UNSAT", single_unsat)
    print("FIXED_GLOBAL_K4_VERDICTS", verdicts)
    if set(verdicts.values()) != {"UNSAT"}:
        raise AssertionError(f"expected all fixed fixtures UNSAT, got {verdicts}")
    if any(not centers for centers in single_center_unsat.values()):
        raise AssertionError(
            "expected every fixed fixture to have a single-center K4 obstruction"
        )
    print("PASS_FIXED_FIXTURES_GLOBAL_K4_UNSAT")


def solver_for_fixture(fixture):
    row1, row2, ingress_center, ingress_support = fixture
    solver, d = base_solver()
    add_unique_exact_four(solver, d, 0, FIRST)
    add_unique_exact_four(solver, d, 4, SECOND)
    add_unique_exact_four(solver, d, Z1, row1)
    add_unique_exact_four(solver, d, Z2, row2)
    add_selected_four(solver, d, ingress_center, ingress_support)
    return solver, d


if __name__ == "__main__":
    main()
