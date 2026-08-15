#!/usr/bin/env python3
"""Audit every O-first cyclic placement of the BlockerV-xu metric pattern.

The variables are the ten unsquared pair distances on O,U,X,V,Y.  We impose
the equalities forced by the four relevant circle rows and every strict
Kalmanson inequality for the proposed cyclic order.  Homogeneity lets us
normalize positivity and each strict margin to one.
"""

from itertools import combinations, permutations

import numpy as np
from scipy.optimize import linprog


POINTS = ("O", "U", "X", "V", "Y")
PAIRS = tuple(combinations(POINTS, 2))
PAIR_INDEX = {frozenset(pair): i for i, pair in enumerate(PAIRS)}


def idx(a: str, b: str) -> int:
    return PAIR_INDEX[frozenset((a, b))]


def equality(a: str, b: str, c: str, d: str) -> np.ndarray:
    row = np.zeros(len(PAIRS))
    row[idx(a, b)] += 1
    row[idx(c, d)] -= 1
    return row


EQUALITIES = np.array(
    [
        equality("O", "U", "O", "X"),
        equality("O", "U", "O", "V"),
        equality("O", "U", "O", "Y"),
        equality("Y", "U", "Y", "X"),
        equality("V", "Y", "V", "U"),
        equality("X", "V", "X", "Y"),
    ]
)


def inequality(*terms: tuple[int, str, str]) -> np.ndarray:
    row = np.zeros(len(PAIRS))
    for coefficient, a, b in terms:
        row[idx(a, b)] += coefficient
    return row


def kalmanson_rows(order: tuple[str, ...]) -> list[tuple[str, np.ndarray]]:
    rows = []
    for positions in combinations(range(5), 4):
        a, b, c, d = (order[i] for i in positions)
        rows.append(
            (
                f"{a}{b}+{c}{d}<{a}{c}+{b}{d}",
                inequality((1, a, b), (1, c, d), (-1, a, c), (-1, b, d)),
            )
        )
        rows.append(
            (
                f"{a}{d}+{b}{c}<{a}{c}+{b}{d}",
                inequality((1, a, d), (1, b, c), (-1, a, c), (-1, b, d)),
            )
        )
    return rows


def feasible(rows: list[np.ndarray]) -> bool:
    matrix = np.array(rows) if rows else np.empty((0, len(PAIRS)))
    result = linprog(
        np.zeros(len(PAIRS)),
        A_ub=matrix,
        b_ub=-np.ones(len(rows)),
        A_eq=EQUALITIES,
        b_eq=np.zeros(len(EQUALITIES)),
        bounds=[(1, None)] * len(PAIRS),
        method="highs",
    )
    return result.success


def minimal_unsat_core(named_rows: list[tuple[str, np.ndarray]]) -> list[str]:
    core = list(named_rows)
    changed = True
    while changed:
        changed = False
        for candidate in list(core):
            trial = [entry for entry in core if entry is not candidate]
            if not feasible([row for _, row in trial]):
                core = trial
                changed = True
                break
    return [name for name, _ in core]


def main() -> None:
    feasible_orders = []
    for tail in permutations(("U", "X", "V", "Y")):
        order = ("O",) + tail
        rows = kalmanson_rows(order)
        if feasible([row for _, row in rows]):
            feasible_orders.append("".join(order))
            print(f"SAT   {''.join(order)}")
        else:
            core = minimal_unsat_core(rows)
            print(f"UNSAT {''.join(order)}  core={'; '.join(core)}")
    print(f"SUMMARY total=24 unsat={24-len(feasible_orders)} sat={len(feasible_orders)}")
    if feasible_orders:
        print("FEASIBLE " + " ".join(feasible_orders))


if __name__ == "__main__":
    main()
