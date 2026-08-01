#!/usr/bin/env python3
"""Audit the tempting one-axis-reversal extension of Figure 4.

The output records hit counts for the two printed Figure-5 6x8 maximizers and
the SAT 19-one matrix.  It also maps the first P2 and P3 hits of the latter
from reversed coordinates back to native coordinates.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter
from pathlib import Path
from typing import Callable, Sequence

from verify_table2 import direct_pattern_hits


CONTROLS = {
    "fig5-left-6x8": (
        "00011011",
        "00100101",
        "01000110",
        "00101000",
        "01001000",
        "11110000",
    ),
    "fig5-right-6x8": (
        "00000111",
        "00011001",
        "01100001",
        "10000001",
        "10101010",
        "01010100",
    ),
    "candidate-19": (
        "00011011",
        "01100101",
        "10000001",
        "10000110",
        "10101000",
        "11010000",
    ),
}


def summarize(matrix: Sequence[Sequence[int]]) -> dict:
    alpha, beta = len(matrix), len(matrix[0])
    transforms: dict[
        str,
        tuple[
            Sequence[Sequence[int]],
            Callable[[tuple[int, int]], tuple[int, int]],
        ],
    ] = {
        "native": (matrix, lambda cell: cell),
        "row-reversal": (
            matrix[::-1],
            lambda cell: (alpha - 1 - cell[0], cell[1]),
        ),
        "column-reversal": (
            [row[::-1] for row in matrix],
            lambda cell: (cell[0], beta - 1 - cell[1]),
        ),
        "both-reversals": (
            [row[::-1] for row in matrix[::-1]],
            lambda cell: (alpha - 1 - cell[0], beta - 1 - cell[1]),
        ),
    }
    output = {}
    for name, (transformed, to_native) in transforms.items():
        hits = direct_pattern_hits(transformed)
        counts = Counter(tag for tag, _ in hits)
        first = {}
        for tag in ("P2", "P3"):
            match = next((cells for found, cells in hits if found == tag), None)
            if match is not None:
                first[tag] = {
                    "transformed_coordinates": sorted(match),
                    "native_coordinates": sorted(to_native(cell) for cell in match),
                }
        output[name] = {
            "total_hits": len(hits),
            "hits_by_pattern": dict(sorted(counts.items())),
            "first_P2_P3": first,
        }
    return output


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--json", type=Path)
    args = parser.parse_args()
    results = {}
    for name, rows in CONTROLS.items():
        matrix = [[int(bit) for bit in row] for row in rows]
        results[name] = {
            "ones": sum(map(sum, matrix)),
            "rows": rows,
            "audit": summarize(matrix),
        }
    text = json.dumps(results, indent=2) + "\n"
    if args.json:
        args.json.write_text(text)
    print(text, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
