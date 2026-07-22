#!/usr/bin/env python3
"""Exact LRA audit of the natural first-cap ordered-terminal completion.

This is a theorem-discovery regression, not a Euclidean realization and not
a model of CounterexampleData.  It asks whether strict Kalmanson inequalities
and metric triangle inequalities alone contradict the equalities available
when the fresh critical row hits one original coincident-blocker source.

All satisfiable outputs are replayed using fractions outside Z3.  UNSAT is a
solver result only; this script does not emit a proof certificate for it.
"""

from __future__ import annotations

import argparse
from fractions import Fraction
import hashlib
import itertools
import json
from pathlib import Path

import z3


ROLES = ("O", "A", "X", "J", "q", "w")
FIRST_CAP_ROLES = frozenset({"A", "J", "q", "w"})


def edge(a: str, b: str) -> tuple[str, str]:
    assert a != b
    return tuple(sorted((a, b)))  # type: ignore[return-value]


EDGES = tuple(edge(a, b) for i, a in enumerate(ROLES) for b in ROLES[i + 1 :])


def q(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def outside_first_cap_block(order: tuple[str, ...]) -> bool:
    pos = {name: i for i, name in enumerate(order)}
    return pos["X"] < min(pos[x] for x in FIRST_CAP_ROLES) or pos["X"] > max(
        pos[x] for x in FIRST_CAP_ROLES
    )


def between(order: tuple[str, ...], middle: str, left: str, right: str) -> bool:
    pos = {name: i for i, name in enumerate(order)}
    return (pos[left] < pos[middle] < pos[right]) or (
        pos[right] < pos[middle] < pos[left]
    )


def source_orders() -> list[tuple[str, ...]]:
    """Enumerate cyclic orders modulo rotation and reflection.

    O is fixed first.  Reflection is fixed by q < A < w, matching one choice
    of orientation for the common blocker lying between q and w in the first
    cap.  The script explicitly audits this additional natural order
    completion; it does not claim the current Lean residual proves it.
    """

    result = []
    for tail in itertools.permutations(r for r in ROLES if r != "O"):
        order = ("O",) + tail
        pos = {name: i for i, name in enumerate(order)}
        if pos["q"] < pos["A"] < pos["w"]:
            result.append(order)
    return result


def solve(order: tuple[str, ...], hit: str) -> dict[str, object]:
    assert hit in {"q", "w"}
    distances = {e: z3.Real("d_" + "_".join(e)) for e in EDGES}

    def d(a: str, b: str) -> z3.ArithRef:
        return distances[edge(a, b)]

    solver = z3.Solver()
    for value in distances.values():
        solver.add(value >= 1)

    # The complete first-apex class contains J,q,w; the common blocker A is
    # equidistant from q,w; and the fresh blocker X has a selected-row hit at
    # J and one of q,w.
    solver.add(d("O", "J") == d("O", "q"))
    solver.add(d("O", "q") == d("O", "w"))
    solver.add(d("A", "q") == d("A", "w"))
    solver.add(d("X", "J") == d("X", hit))

    # Metric triangle inequalities.  They are non-strict because degenerate
    # abstract metric triples only make this relaxation stronger.
    for a, b, c in itertools.combinations(ROLES, 3):
        solver.add(d(a, b) + d(b, c) >= d(a, c))
        solver.add(d(a, b) + d(a, c) >= d(b, c))
        solver.add(d(a, c) + d(b, c) >= d(a, b))

    # Strict convex-quadrilateral inequalities, homogenously normalized to
    # have slack at least one.
    for i, j, k, ell in itertools.combinations(range(len(order)), 4):
        a, b, c, d_ = order[i], order[j], order[k], order[ell]
        solver.add(d(a, c) + d(b, d_) >= d(a, b) + d(c, d_) + 1)
        solver.add(d(a, c) + d(b, d_) >= d(a, d_) + d(b, c) + 1)

    verdict = solver.check()
    result: dict[str, object] = {
        "order": list(order),
        "hit": hit,
        "x_outside_first_cap_block": outside_first_cap_block(order),
        "x_between_j_and_hit": between(order, "X", "J", hit),
        "verdict": str(verdict),
    }
    if verdict != z3.sat:
        return result

    model = solver.model()
    values = {e: q(model.eval(var, model_completion=True)) for e, var in distances.items()}

    # Independent exact replay of every asserted constraint.
    assert all(value >= 1 for value in values.values())
    assert values[edge("O", "J")] == values[edge("O", "q")]
    assert values[edge("O", "q")] == values[edge("O", "w")]
    assert values[edge("A", "q")] == values[edge("A", "w")]
    assert values[edge("X", "J")] == values[edge("X", hit)]
    for a, b, c in itertools.combinations(ROLES, 3):
        assert values[edge(a, b)] + values[edge(b, c)] >= values[edge(a, c)]
        assert values[edge(a, b)] + values[edge(a, c)] >= values[edge(b, c)]
        assert values[edge(a, c)] + values[edge(b, c)] >= values[edge(a, b)]
    for i, j, k, ell in itertools.combinations(range(len(order)), 4):
        a, b, c, d_ = order[i], order[j], order[k], order[ell]
        assert (
            values[edge(a, c)] + values[edge(b, d_)]
            >= values[edge(a, b)] + values[edge(c, d_)] + 1
        )
        assert (
            values[edge(a, c)] + values[edge(b, d_)]
            >= values[edge(a, d_)] + values[edge(b, c)] + 1
        )
    result["rational_model"] = {
        "-".join(e): str(value) for e, value in sorted(values.items())
    }
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if not args.check:
        parser.error("pass --check")

    rows = [solve(order, hit) for order in source_orders() for hit in ("q", "w")]
    outside = [row for row in rows if row["x_outside_first_cap_block"]]
    first_hit = [
        row
        for row in rows
        if not row["x_outside_first_cap_block"] and row["x_between_j_and_hit"]
    ]
    result = {
        "scope": (
            "exact rational strict-Kalmanson plus metric LRA; not Euclidean, "
            "not a CounterexampleData model"
        ),
        "all_order_hit_pairs": len(rows),
        "outside_first_cap_block": {
            "cases": len(outside),
            "sat": sum(row["verdict"] == "sat" for row in outside),
            "unsat": sum(row["verdict"] == "unsat" for row in outside),
        },
        "first_cap_center_between_equal_points": {
            "cases": len(first_hit),
            "sat": sum(row["verdict"] == "sat" for row in first_hit),
            "unsat": sum(row["verdict"] == "unsat" for row in first_hit),
            "rows": first_hit,
        },
    }
    payload = json.dumps(result, sort_keys=True, separators=(",", ":"))
    digest = hashlib.sha256(payload.encode()).hexdigest()
    if args.output:
        args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(f"PASS: {digest}")
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
