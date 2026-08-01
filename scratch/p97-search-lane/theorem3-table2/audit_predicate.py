#!/usr/bin/env python3
"""Independent template audit for the candidate Figure-4 transcription.

Unlike verify_table2.py, this checker does not use the letter-variable P3
generator.  It expands P3 into the six fixed order-type templates (R1/R2/R3
times C1/C2), adds their transposes, and scans selected submatrices directly.
This is a transcription cross-check, not an independent proof that the
transcription matches the printed diagrams.
"""

from __future__ import annotations

import argparse
import json
from itertools import combinations
from pathlib import Path
from typing import Iterable, Sequence


Cell = tuple[int, int]
Template = tuple[Cell, ...]

P1: Template = ((0, 0), (0, 1), (1, 0), (1, 1))
P2: tuple[Template, ...] = (
    ((0, 0), (0, 1), (1, 2), (2, 0), (2, 2)),
    ((0, 0), (0, 2), (1, 0), (2, 1), (2, 2)),
)
P3: tuple[tuple[int, int, Template], ...] = (
    (4, 4, ((0, 0), (0, 1), (1, 0), (2, 3), (3, 2), (3, 3))),  # R1C1
    (4, 3, ((0, 0), (0, 1), (1, 0), (2, 2), (3, 1), (3, 2))),  # R1C2
    (4, 4, ((0, 0), (0, 1), (2, 0), (1, 3), (3, 2), (3, 3))),  # R2C1
    (4, 3, ((0, 0), (0, 1), (2, 0), (1, 2), (3, 1), (3, 2))),  # R2C2
    (3, 4, ((0, 0), (0, 1), (1, 0), (1, 3), (2, 2), (2, 3))),  # R3C1
    (3, 3, ((0, 0), (0, 1), (1, 0), (1, 2), (2, 1), (2, 2))),  # R3C2
)


def transpose(template: Template) -> Template:
    return tuple((c, r) for r, c in template)


def instantiate(
    matrix: Sequence[Sequence[int]], nr: int, nc: int, template: Template
) -> Iterable[frozenset[Cell]]:
    for rows in combinations(range(len(matrix)), nr):
        for cols in combinations(range(len(matrix[0])), nc):
            cells = frozenset((rows[r], cols[c]) for r, c in template)
            if all(matrix[r][c] for r, c in cells):
                yield cells


def p4_template(k: int, variant: str) -> Template:
    if variant == "A":
        return tuple(
            cell
            for i in range(k - 1)
            for cell in ((i, k - 2 - i), (i, k - 1 - i))
        ) + ((k - 1, 0), (k - 1, k - 1))
    return ((0, 0), (0, k - 1)) + tuple(
        cell
        for i in range(1, k)
        for cell in ((i, k - 1 - i), (i, k - i))
    )


def scan(matrix: Sequence[Sequence[int]]) -> dict[str, int]:
    alpha, beta = len(matrix), len(matrix[0])
    hits: dict[str, set[frozenset[Cell]]] = {
        tag: set() for tag in ("P1", "P2", "P3", "P4")
    }
    hits["P1"].update(instantiate(matrix, 2, 2, P1))
    for template in P2:
        hits["P2"].update(instantiate(matrix, 3, 3, template))
    for nr, nc, template in P3:
        hits["P3"].update(instantiate(matrix, nr, nc, template))
        hits["P3"].update(instantiate(matrix, nc, nr, transpose(template)))
    for k in range(3, min(alpha, beta) + 1):
        for variant in ("A", "B"):
            hits["P4"].update(instantiate(matrix, k, k, p4_template(k, variant)))
    return {tag: len(cells) for tag, cells in hits.items()}


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


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--json", type=Path)
    args = parser.parse_args()
    results = []
    for name, rows in CONTROLS.items():
        matrix = [[int(bit) for bit in row] for row in rows]
        counts = scan(matrix)
        results.append(
            {
                "name": name,
                "rows": rows,
                "ones": sum(map(sum, matrix)),
                "row_degrees": [sum(row) for row in matrix],
                "column_degrees": [
                    sum(matrix[r][c] for r in range(len(matrix)))
                    for c in range(len(matrix[0]))
                ],
                "hits": counts,
                "candidate_pattern_feasible": not any(counts.values()),
            }
        )
    text = json.dumps(results, indent=2) + "\n"
    if args.json:
        args.json.write_text(text)
    print(text, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
