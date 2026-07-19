#!/usr/bin/env python3
"""Smoke gates for the cap-aware structural extension."""

from __future__ import annotations

import importlib.util
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location("n14_capaware_search", HERE / "search.py")
if SPEC is None or SPEC.loader is None:
    raise RuntimeError("cannot load cap-aware search module")
SEARCH = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(SEARCH)


def check_status(solver: z3.Solver, expected: z3.CheckSatResult, label: str) -> None:
    status = solver.check()
    if status != expected:
        reason = solver.reason_unknown() if status == z3.unknown else ""
        raise AssertionError(f"{label}: expected {expected}, got {status} {reason}")


def expect_cap_rejection(
    rows: dict[int, tuple[int, ...]], center: int, support: tuple[int, ...]
) -> None:
    bad_rows = dict(rows)
    bad_rows[center] = support
    try:
        SEARCH.VERIFY.verify_cap_rows(bad_rows)
    except RuntimeError:
        return
    raise AssertionError(
        f"independent cap-row verifier accepted row {center}={support}"
    )


def main() -> int:
    solver, member, blocker, counts = SEARCH.build_capaware_structural(10_000, 0)
    check_status(solver, z3.sat, "base cap-aware structural surface")
    model = solver.model()
    rows = SEARCH.CEGAR.selected_rows(model, member, SEARCH.N)
    SEARCH.VERIFY.verify_cap_rows(rows)
    expect_cap_rejection(rows, 1, (0, 2, 3, 4))
    expect_cap_rejection(rows, 0, (1, 2, 5, 6))
    blockers = SEARCH.CEGAR.blocker_values(model, blocker, SEARCH.N)
    if set(blockers.values()) & {SEARCH.FIRST_APEX, SEARCH.SECOND_APEX}:
        raise AssertionError("decoded blocker image contains an omitted apex")

    # Interior center 1 lies only in C1.  Three forced C1 members must violate
    # the production-proved <=2 cap-row consequence.
    interior, interior_points = 1, (0, 2, 3)
    solver.push()
    solver.add(*(member[interior, point] for point in interior_points))
    check_status(solver, z3.unsat, "interior same-cap triple rejection")
    solver.pop()

    # Endpoint center 0 is incident to C1.  Two forced C1 members must violate
    # the sharper production-proved <=1 endpoint-cap consequence.
    endpoint, endpoint_points = 0, (1, 2)
    solver.push()
    solver.add(*(member[endpoint, point] for point in endpoint_points))
    check_status(solver, z3.unsat, "endpoint same-cap pair rejection")
    solver.pop()

    if counts != {
        "cap_center_card_le_two": 17,
        "cap_endpoint_card_le_one": 6,
    }:
        raise AssertionError(f"unexpected cap constraint counts: {counts}")

    print("PASS: n=14 cap-aware structural smoke gates")
    print("base=SAT; decoded row/blocker semantics replayed")
    print("interior same-cap triple=UNSAT; endpoint same-cap pair=UNSAT")
    print(f"cap_constraint_counts={counts}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
