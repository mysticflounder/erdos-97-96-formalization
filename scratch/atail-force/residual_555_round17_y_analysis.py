#!/usr/bin/env python3
"""Finite-branch sign audit for the round-17 Y=8 obstruction.

Discovery only.  The exact equalities on `(O,A,D,E,C,Y)=(0,1,3,4,2,8)`
leave eight normalized branches for `C,E,D` and at most two circle
intersections for `Y`.  We enumerate those branches and minimize the positive
signed-area facts implied by the displayed cyclic order.
"""

from __future__ import annotations

from itertools import combinations
from math import cos, pi, sin, sqrt

import numpy as np


NAMES = ("O", "A", "D", "E", "C", "Y")
TRIPLES = tuple(combinations(NAMES, 3))


def point(angle: float) -> np.ndarray:
    return np.array((cos(angle), sin(angle)))


def cross(left: np.ndarray, right: np.ndarray) -> float:
    return float(left[0] * right[1] - left[1] * right[0])


def area(a: np.ndarray, b: np.ndarray, c: np.ndarray) -> float:
    return cross(b - a, c - a)


def circle_intersections(
    first: np.ndarray, first_radius: float,
    second: np.ndarray, second_radius: float,
) -> tuple[np.ndarray, ...]:
    delta = second - first
    distance = float(np.linalg.norm(delta))
    if distance < 1e-12:
        return ()
    axial = (
        first_radius * first_radius
        - second_radius * second_radius
        + distance * distance
    ) / (2 * distance)
    height_sq = first_radius * first_radius - axial * axial
    if height_sq < -1e-10:
        return ()
    unit = delta / distance
    base = first + axial * unit
    if abs(height_sq) < 1e-10:
        return (base,)
    normal = np.array((-unit[1], unit[0]))
    height = sqrt(max(0.0, height_sq))
    return (base + height * normal, base - height * normal)


def exact_branches() -> list[dict[str, np.ndarray]]:
    out = []
    for c_angle in (pi / 3, -pi / 3):
        for e_angle in (c_angle / 2, c_angle / 2 + pi):
            for d_angle in (e_angle / 2, e_angle / 2 + pi):
                branch = {
                    "O": np.zeros(2),
                    "A": point(0),
                    "C": point(c_angle),
                    "E": point(e_angle),
                    "D": point(d_angle),
                }
                e_radius = float(np.linalg.norm(branch["E"] - branch["A"]))
                c_radius = float(np.linalg.norm(branch["C"] - branch["D"]))
                for y in circle_intersections(
                    branch["E"], e_radius, branch["C"], c_radius
                ):
                    out.append({**branch, "Y": y})
    return out


def main() -> None:
    branches = exact_branches()
    truth_sets = {
        frozenset(
            triple
            for triple in TRIPLES
            if area(*(branch[name] for name in triple)) > 1e-10
        )
        for branch in branches
    }
    print(f"normalized branches: {len(branches)}")
    print(f"truth sets: {len(truth_sets)}")
    for index, branch in enumerate(branches):
        chosen = all(
            area(*(branch[name] for name in triple)) > 0
            for triple in (("O", "A", "C"), ("O", "A", "E"),
                           ("O", "A", "D"))
        )
        if chosen:
            print(
                "selected branch",
                index,
                "CYO=",
                area(branch["C"], branch["Y"], branch["O"]),
                "Y=",
                branch["Y"].tolist(),
            )
    for size in range(1, len(TRIPLES) + 1):
        hits = [
            subset
            for subset in combinations(TRIPLES, size)
            if not any(set(subset).issubset(truth) for truth in truth_sets)
        ]
        if hits:
            print(f"minimum sign count: {size}")
            for subset in hits[:50]:
                print(" ".join("".join(triple) for triple in subset))
            break


if __name__ == "__main__":
    main()
