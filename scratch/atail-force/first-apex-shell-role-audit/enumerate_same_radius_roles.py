#!/usr/bin/env python3
"""Enumerate the source-faithful cap-role counts in the rho = radius arm.

Roles are:

* I: strict interior of oppCap1;
* S: surplusCap (one hit at most); and
* O: oppCap2 (one hit at most).

The frontier sources q,w are off surplus and cannot both use O.  The four
points of the double-deletion row are distinct from q,w.  This script records
all aggregate role-count vectors; it deliberately does not assign slots or a
within-cap boundary order.
"""

from itertools import product


def enumerate_cases() -> list[dict[str, object]]:
    cases: list[dict[str, object]] = []
    for q_role, w_role in product("IO", repeat=2):
        if q_role == w_role == "O":
            continue
        for row_roles in product("ISO", repeat=4):
            all_roles = (q_role, w_role, *row_roles)
            if all_roles.count("S") > 1 or all_roles.count("O") > 1:
                continue
            cases.append(
                {
                    "frontier_roles": q_role + w_role,
                    "row_roles": "".join(row_roles),
                    "row_counts": {
                        role: row_roles.count(role) for role in "ISO"
                    },
                    "six_counts": {
                        role: all_roles.count(role) for role in "ISO"
                    },
                }
            )
    return cases


def summarize(cases: list[dict[str, object]]) -> None:
    print(f"labelled row assignments: {len(cases)}")
    for frontier_roles in ("II", "IO", "OI"):
        family = [
            case for case in cases
            if case["frontier_roles"] == frontier_roles
        ]
        row_vectors = sorted(
            {
                tuple(case["row_counts"][role] for role in "ISO")
                for case in family
            }
        )
        six_vectors = sorted(
            {
                tuple(case["six_counts"][role] for role in "ISO")
                for case in family
            }
        )
        print(f"{frontier_roles}: row(I,S,O)={row_vectors}")
        print(f"{frontier_roles}: six(I,S,O)={six_vectors}")
        print(
            f"{frontier_roles}: minimum row-I="
            f"{min(vector[0] for vector in row_vectors)}"
        )

    assert all(case["six_counts"]["I"] >= 4 for case in cases)
    assert min(case["row_counts"]["I"] for case in cases) == 2
    cross = [
        case for case in cases if case["frontier_roles"] in {"IO", "OI"}
    ]
    assert min(case["row_counts"]["I"] for case in cross) == 3


if __name__ == "__main__":
    summarize(enumerate_cases())
