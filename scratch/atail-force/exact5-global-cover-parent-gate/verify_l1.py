#!/usr/bin/env python3
"""Exact-rational verifier for asymmetric card-13 L1 survivors."""

from __future__ import annotations

import argparse
import itertools
import json
from fractions import Fraction
from pathlib import Path

from verify import (
    FIRST_APEX,
    ORBIT_ROLES,
    PHYSICAL_CAP,
    SECOND_APEX,
    VERTICES,
    verify_decoded,
)


SIGNS = ("outsideLowerIndexFarther", "outsideHigherIndexFarther")


def edge(left: int, right: int) -> tuple[int, int]:
    return (left, right) if left < right else (right, left)


def parse_distances(raw: dict[str, str]) -> dict[tuple[int, int], Fraction]:
    result = {}
    for key, value in raw.items():
        left, right = map(int, key.split(","))
        result[(left, right)] = Fraction(value)
    return result


def distance(table: dict[tuple[int, int], Fraction],
             left: int, right: int) -> Fraction:
    if left == right:
        return Fraction(0)
    return table[edge(left, right)]


def _check_equal_row(table: dict[tuple[int, int], Fraction], center: int,
                     support: set[int], label: str, errors: list[str]) -> None:
    reference = min(support)
    radius = distance(table, center, reference)
    for point in support:
        if distance(table, center, point) != radius:
            errors.append(f"{label} equality failed at {center},{point}")


def verify_l1_payload(decoded: dict[str, object], raw_distances: dict[str, str],
                      sign: str) -> list[str]:
    errors = verify_decoded(decoded)
    if sign not in SIGNS:
        return [*errors, f"unknown sign {sign}"]
    if not str(decoded["orbit"]).startswith("asymmetric"):
        return [*errors, "L1 verifier currently accepts asymmetric orbits only"]
    table = parse_distances(raw_distances)
    expected_edges = set(itertools.combinations(VERTICES, 2))
    if set(table) != expected_edges:
        return [*errors, "distance table domain mismatch"]
    for pair, value in table.items():
        if value < 1:
            errors.append(f"positivity failed at {pair}")
    for a, b, c in itertools.combinations(VERTICES, 3):
        if distance(table, a, b) + distance(table, b, c) < distance(table, a, c) + 1:
            errors.append(f"triangle 0 failed at {a,b,c}")
        if distance(table, a, c) + distance(table, b, c) < distance(table, a, b) + 1:
            errors.append(f"triangle 1 failed at {a,b,c}")
        if distance(table, a, b) + distance(table, a, c) < distance(table, b, c) + 1:
            errors.append(f"triangle 2 failed at {a,b,c}")
    for a, b, c, d in itertools.combinations(VERTICES, 4):
        diagonals = distance(table, a, c) + distance(table, b, d)
        if diagonals < distance(table, a, b) + distance(table, c, d) + 1:
            errors.append(f"Kalmanson 1 failed at {a,b,c,d}")
        if diagonals < distance(table, a, d) + distance(table, b, c) + 1:
            errors.append(f"Kalmanson 2 failed at {a,b,c,d}")

    rows = {int(c): set(s) for c, s in decoded["rows"].items()}
    covers = [
        {int(c): set(s) for c, s in raw.items()}
        for raw in decoded["cover_rows"]
    ]
    for name, family in (("m", rows), ("g0", covers[0]), ("g1", covers[1])):
        for center, support in family.items():
            _check_equal_row(table, center, support, name, errors)
    _check_equal_row(table, FIRST_APEX, set(decoded["b1"]), "b1", errors)
    _check_equal_row(table, SECOND_APEX, set(decoded["shell"]), "shell", errors)

    q = int(decoded["q"])
    w = int(decoded["w"])
    if distance(table, FIRST_APEX, q) != distance(table, FIRST_APEX, w):
        errors.append("frontier first-apex equality failed")
    if abs(distance(table, SECOND_APEX, q) -
           distance(table, SECOND_APEX, w)) < 1:
        errors.append("frontier second-apex separation failed")

    roles = ORBIT_ROLES[str(decoded["orbit"])]
    outside = sorted(rows[roles["hub"]] - PHYSICAL_CAP)
    if len(outside) != 2:
        errors.append("asymmetric outside pair missing")
        return errors
    lower, higher = outside
    lower_distance = distance(table, FIRST_APEX, lower)
    higher_distance = distance(table, FIRST_APEX, higher)
    if sign == "outsideLowerIndexFarther":
        if lower_distance < higher_distance + 1:
            errors.append("terminal-negation sign failed")
    elif higher_distance < lower_distance + 1:
        errors.append("terminal-negation sign failed")
    return errors


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("result", type=Path)
    args = parser.parse_args()
    result = json.loads(args.result.read_text())
    if result.get("status") != "SAT":
        raise SystemExit(f"not a SAT result: {result.get('status')}")
    errors = verify_l1_payload(
        result["decoded"], result["distances"], result["sign"]
    )
    if errors:
        for error in errors:
            print(error)
        raise SystemExit(1)
    print("VERIFIED card-13 asymmetric L1 exact-rational assignment")


if __name__ == "__main__":
    main()
