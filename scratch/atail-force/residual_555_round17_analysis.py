#!/usr/bin/env python3
"""Finite-branch sign minimizer for the round-17 `(5,5,5)` residual.

Discovery only.  The exact equalities on labels `(O,A,D,E,X,C)=(0,1,3,4,5,2)`
reduce, after fixing `O=(0,0)` and `A=(1,0)`, to eight branches for `C,E,D`
and one angular parameter for `X` on the circle centered at `D`.  This script
enumerates every truth region of the strict signed-area inequalities implied by
the cyclic order `O,A,D,E,X,C`, then finds the smallest sign subsets that remove
all branches.
"""

from __future__ import annotations

from itertools import combinations
from math import cos, pi, sin

import numpy as np


NAMES = ("O", "A", "D", "E", "X", "C")
TRIPLES = tuple(combinations(NAMES, 3))


def point(angle: float) -> np.ndarray:
    return np.array((cos(angle), sin(angle)))


def cross(left: np.ndarray, right: np.ndarray) -> float:
    return float(left[0] * right[1] - left[1] * right[0])


def area(a: np.ndarray, b: np.ndarray, c: np.ndarray) -> float:
    return cross(b - a, c - a)


def branches() -> list[dict[str, np.ndarray]]:
    out = []
    for c_angle in (pi / 3, -pi / 3):
        # Unit points equidistant from A and C: the normalized sum and its antipode.
        for e_angle in (c_angle / 2, c_angle / 2 + pi):
            # Unit points equidistant from A and E: both angular bisectors.
            for d_angle in (e_angle / 2, e_angle / 2 + pi):
                out.append(
                    {
                        "O": np.zeros(2),
                        "A": point(0),
                        "C": point(c_angle),
                        "E": point(e_angle),
                        "D": point(d_angle),
                    }
                )
    return out


def truth_regions(branch: dict[str, np.ndarray]) -> set[frozenset[tuple[str, ...]]]:
    d = branch["D"]
    radius = float(np.linalg.norm(branch["A"] - d))
    # Every sign involving X is affine in (cos t, sin t), hence changes truth only
    # at at most two angular roots.  A dense sample is enough for discovery and is
    # followed by an exact algebraic proof before production use.
    regions = set()
    for t in np.linspace(0.0, 2 * pi, 20001, endpoint=False):
        points = {**branch, "X": d + radius * point(float(t))}
        regions.add(
            frozenset(
                triple
                for triple in TRIPLES
                if area(*(points[name] for name in triple)) > 1e-10
            )
        )
    return regions


def main() -> None:
    regions = set().union(*(truth_regions(branch) for branch in branches()))
    print(f"truth regions: {len(regions)}")
    for size in range(1, len(TRIPLES) + 1):
        hits = [
            subset
            for subset in combinations(TRIPLES, size)
            if not any(set(subset).issubset(region) for region in regions)
        ]
        if hits:
            print(f"minimum sign count: {size}")
            for subset in hits[:40]:
                print(" ".join("".join(triple) for triple in subset))
            break


if __name__ == "__main__":
    main()
