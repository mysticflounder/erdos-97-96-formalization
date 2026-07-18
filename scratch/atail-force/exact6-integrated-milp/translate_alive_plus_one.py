#!/usr/bin/env python3
"""Translate a nonnegative exact ALIVE table by +1 and replay its linear profile."""

from __future__ import annotations

import argparse
import itertools
import json
from fractions import Fraction
from pathlib import Path


VERTICES = tuple(range(14))
SECOND_APEX = 9


def edge(left: int, right: int) -> tuple[int, int]:
    return tuple(sorted((left, right)))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    source = json.loads(args.input.read_text(encoding="utf-8"))
    raw = {
        tuple(map(int, name.split(","))): Fraction(value)
        for name, value in source["distance_table"].items()
    }
    distances = {pair: value + 1 for pair, value in raw.items()}

    def dist(left: int, right: int) -> Fraction:
        return distances[edge(left, right)]

    kalmanson = []
    for a, b, c, d in itertools.combinations(VERTICES, 4):
        diagonals = dist(a, c) + dist(b, d)
        kalmanson.extend((
            diagonals - dist(a, b) - dist(c, d),
            diagonals - dist(a, d) - dist(b, c),
        ))
    triangles = []
    for a, b, c in itertools.combinations(VERTICES, 3):
        triangles.extend((
            dist(a, b) + dist(b, c) - dist(a, c),
            dist(a, b) + dist(a, c) - dist(b, c),
            dist(a, c) + dist(b, c) - dist(a, b),
        ))
    rows = {int(center): support for center, support in source["rows"].items()}
    row_equalities = all(
        len({dist(center, point) for point in support}) == 1
        for center, support in rows.items()
    )
    shell = source["shell"]
    shell_equality = len({dist(SECOND_APEX, point) for point in shell}) == 1
    minimum_distance = min(distances.values())
    minimum_kalmanson = min(kalmanson)
    minimum_triangle = min(triangles)
    positive_kalmanson_valid = (
        minimum_distance >= 1
        and minimum_kalmanson >= 1
        and row_equalities
        and shell_equality
    )
    output = {
        "schema": "p97-exact6-integrated-plus-one-alive-replay-v1",
        "epistemic_status": (
            "EXACT_POSITIVE_FULL_LINEAR_SHADOW_ALIVE_NOT_EUCLIDEAN"
            if positive_kalmanson_valid and minimum_triangle >= 1
            else "EXACT_POSITIVE_KALMANSON_SHADOW_REPLAYED_FULL_LINEAR_NOT_REPLAYED"
        ),
        "source": str(args.input),
        "translation": "d_prime(i,j) = d(i,j) + 1 for every distinct pair",
        "orbit": source["orbit"],
        "rows": source["rows"],
        "shell": shell,
        "roles": source["roles"],
        "blockers": source["blockers"],
        "distance_table": {
            f"{left},{right}": str(value)
            for (left, right), value in sorted(distances.items())
        },
        "exact_replay": {
            "minimum_distance": str(minimum_distance),
            "minimum_kalmanson_slack": str(minimum_kalmanson),
            "minimum_triangle_slack": str(minimum_triangle),
            "selected_row_equalities": row_equalities,
            "exact_five_shell_equality": shell_equality,
            "positive_kalmanson_valid": positive_kalmanson_valid,
            "full_linear_valid": positive_kalmanson_valid and minimum_triangle >= 1,
        },
    }
    if not positive_kalmanson_valid:
        raise SystemExit("plus-one positive Kalmanson replay failed")
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(output["epistemic_status"])


if __name__ == "__main__":
    main()
