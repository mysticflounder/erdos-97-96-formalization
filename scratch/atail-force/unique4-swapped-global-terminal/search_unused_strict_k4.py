#!/usr/bin/env python3
"""Search the corrected outcomes after adding K4 at the third strict C2 role."""

from __future__ import annotations

from audit_two_by_two_outcomes_lra import solve_outcome


OUTCOMES = {
    "common_delete_5": ("common", 5),
    "common_delete_6": ("common", 6),
    "cross_5_at_9_6_at_8": ("cross", 6, 5),
    "cross_6_at_9_5_at_8": ("cross", 5, 6),
}


def main() -> None:
    witnesses = {}
    for name, specification in OUTCOMES.items():
        witness = solve_outcome(
            specification,
            require_unused_second_strict_k4=True,
        )
        if witness is not None:
            witnesses[name] = witness
        print(name, "SAT" if witness is not None else "UNSAT", witness)
    if len(witnesses) != len(OUTCOMES):
        raise AssertionError(
            f"expected {len(OUTCOMES)} SAT outcomes, found {len(witnesses)}"
        )
    print("PASS_EXACT_QF_LRA_ALL_FOUR_OUTCOMES_WITH_UNUSED_STRICT_K4")


if __name__ == "__main__":
    main()
