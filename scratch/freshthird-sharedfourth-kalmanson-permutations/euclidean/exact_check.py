#!/usr/bin/env python3
"""Independent Fraction check of every convexity and row assertion."""

from fractions import Fraction as F
from itertools import combinations
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent
M = {
    "m012": [(F(0), F(0)), (F(1), F(0)), (F(25, 12), F(1, 4)), (F(4), F(1)), (F(1), F(2)), (F(-2), F(1))],
    "m210": [(F(0), F(0)), (F(1), F(0)), (F(7, 4), F(1, 4)), (F(2), F(1)), (F(1), F(2)), (F(0), F(1))],
}
OM = {"m012": (0, 1, 2), "m210": (2, 1, 0)}


def cr(a, b, c):
    ax, ay = M[NAME][a]; bx, by = M[NAME][b]; cx, cy = M[NAME][c]
    return (bx - ax) * (cy - ay) - (by - ay) * (cx - ax)


def d2(a, b):
    ax, ay = M[NAME][a]; bx, by = M[NAME][b]
    return (ax - bx) ** 2 + (ay - by) ** 2


out = {}
for NAME in M:
    turns = [cr(i, (i + 1) % 6, k) for i in range(6) for k in range(6) if k not in (i, (i + 1) % 6)]
    sep = [d2(i, j) for i, j in combinations(range(6), 2)]
    m = OM[NAME]
    rows = []
    for i, omitted in enumerate(m):
        kept = [3 + t for t in range(3) if t != omitted]
        rows.append(d2(i, kept[0]) - d2(i, kept[1]))
    out[NAME] = {
        "min_cross": str(min(turns)), "min_pairwise_d2": str(min(sep)),
        "row_residuals": [str(v) for v in rows], "all_exact_checks_pass": min(turns) > 0 and min(sep) > 0 and all(v == 0 for v in rows),
    }
(ROOT / "exact_check.json").write_text(json.dumps(out, indent=2) + "\n")
print(json.dumps(out, indent=2))
