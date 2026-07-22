#!/usr/bin/env python3
"""Enumerate local strict-Kalmanson shadows of the distinct cross residue.

Unlike ``decision.py``, this intentionally omits carrier-wide selected rows,
the global deletion cover, and connectivity.  Its purpose is to decide
whether the local complete apex classes plus the asymmetric cross-color row
already contradict cyclic metric inequalities.
"""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path

import z3


VERTICES = tuple(range(13))
FIRST_APEX = 4
SECOND_APEX = 8
PHYSICAL = frozenset({1, 2, 3})
STRICT_FIRST = frozenset({9, 10, 11, 12})
SURPLUS_SIDE = frozenset({4, 5, 6, 7})
FIRST_SIDE = frozenset({0, 9, 10, 11, 12})


def edge(left: int, right: int) -> tuple[int, int]:
    return (left, right) if left < right else (right, left)


class LocalMetric:
    def __init__(self, timeout_ms: int) -> None:
        self.distances = {
            pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
            for pair in itertools.combinations(VERTICES, 2)
        }
        self.solver = z3.SolverFor("QF_LRA")
        self.solver.set(timeout=timeout_ms)
        for value in self.distances.values():
            self.solver.add(value >= 1)
        for a, b, c in itertools.combinations(VERTICES, 3):
            self.solver.add(self.d(a, b) + self.d(b, c) >= self.d(a, c) + 1)
            self.solver.add(self.d(a, c) + self.d(b, c) >= self.d(a, b) + 1)
            self.solver.add(self.d(a, b) + self.d(a, c) >= self.d(b, c) + 1)
        for a, b, c, d in itertools.combinations(VERTICES, 4):
            diagonal = self.d(a, c) + self.d(b, d)
            self.solver.add(diagonal >= self.d(a, b) + self.d(c, d) + 1)
            self.solver.add(diagonal >= self.d(a, d) + self.d(b, c) + 1)

    def d(self, left: int, right: int) -> z3.ArithRef:
        if left == right:
            return z3.RealVal(0)
        return self.distances[edge(left, right)]

    def row(self, center: int, support: frozenset[int]) -> None:
        reference = min(support)
        for point in support - {reference}:
            self.solver.add(self.d(center, reference) == self.d(center, point))


def check(
    metric: LocalMetric,
    retained: frozenset[int],
    double: frozenset[int],
    second: frozenset[int],
    outside: frozenset[int],
    orientation: str,
) -> tuple[str, dict[str, str] | None]:
    metric.solver.push()
    metric.row(FIRST_APEX, retained)
    metric.row(FIRST_APEX, double)
    metric.row(SECOND_APEX, second)
    metric.row(2, frozenset({1, 3}) | outside)
    retained_radius = metric.d(FIRST_APEX, min(retained))
    double_radius = metric.d(FIRST_APEX, min(double))
    if orientation == "retained_lt_double":
        metric.solver.add(retained_radius + 1 <= double_radius)
    else:
        metric.solver.add(double_radius + 1 <= retained_radius)
    status = metric.solver.check()
    if status == z3.sat:
        model = metric.solver.model()
        result = {
            f"{left}-{right}": str(model.eval(value, model_completion=True))
            for (left, right), value in metric.distances.items()
        }
        metric.solver.pop()
        return "SAT", result
    if status == z3.unsat:
        metric.solver.pop()
        return "UNSAT", None
    result = {"reason": metric.solver.reason_unknown()}
    metric.solver.pop()
    return "UNKNOWN", result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    checked = 0
    unknown = 0
    metric = LocalMetric(args.timeout_ms)
    # The two exact O1 classes partition the four strict points.  Quotient by
    # swapping the class names by requiring 9 in the retained pair.
    for retained_strict_tuple in itertools.combinations(STRICT_FIRST, 2):
        retained_strict = frozenset(retained_strict_tuple)
        if 9 not in retained_strict:
            continue
        double_strict = STRICT_FIRST - retained_strict
        for retained_physical, double_physical in itertools.permutations(PHYSICAL, 2):
            for retained_side, double_side in itertools.permutations(SURPLUS_SIDE, 2):
                retained = retained_strict | {retained_physical, retained_side}
                double = double_strict | {double_physical, double_side}
                if FIRST_APEX in retained or FIRST_APEX in double:
                    continue
                for second_surplus in SURPLUS_SIDE:
                    for second_first in FIRST_SIDE:
                        second = PHYSICAL | {second_surplus, second_first}
                        if SECOND_APEX in second:
                            continue
                        for retained_outside in retained_strict:
                            for double_outside in double_strict:
                                outside = frozenset({retained_outside, double_outside})
                                # q is the retained outside point and w is the
                                # retained physical point.  The q-deleted O2
                                # row must retain four members of its complete
                                # five-class, and its overlap with parent B1
                                # (the double class) is at most two.
                                q = retained_outside
                                available = second - {q}
                                if len(available) < 4:
                                    continue
                                parent_second = next((
                                    frozenset(selected)
                                    for selected in itertools.combinations(available, 4)
                                    if len(frozenset(selected) & double) <= 2
                                ), None)
                                if parent_second is None:
                                    continue
                                for orientation in (
                                    "retained_lt_double",
                                    "double_lt_retained",
                                ):
                                    checked += 1
                                    status, distances = check(
                                        metric,
                                        retained,
                                        double,
                                        second,
                                        outside,
                                        orientation,
                                    )
                                    if status == "UNKNOWN":
                                        unknown += 1
                                        continue
                                    if status == "SAT":
                                        payload = {
                                            "status": "SAT",
                                            "epistemic_scope": (
                                                "exact rational triangle plus strict-Kalmanson "
                                                "shadow of the local distinct-cross packet"
                                            ),
                                            "checked": checked,
                                            "unknown": unknown,
                                            "retained": sorted(retained),
                                            "double": sorted(double),
                                            "second": sorted(second),
                                            "outside": sorted(outside),
                                            "q": q,
                                            "w": retained_physical,
                                            "parent_first": sorted(double),
                                            "parent_second": sorted(parent_second),
                                            "orientation": orientation,
                                            "distances": distances,
                                            "omitted": [
                                                "rank-two Euclidean realization",
                                                "MEC containment and cap semantics beyond order",
                                                "carrier-wide K4 and total critical system",
                                                "minimality and full deletion cover",
                                            ],
                                        }
                                        text = json.dumps(payload, indent=2, sort_keys=True)
                                        if args.output is not None:
                                            args.output.write_text(text + "\n")
                                        print(text)
                                        return
    payload = {
        "status": "UNKNOWN" if unknown else "UNSAT",
        "checked": checked,
        "unknown": unknown,
        "certificate": "none; exhaustive solver verdict only",
    }
    text = json.dumps(payload, indent=2, sort_keys=True)
    if args.output is not None:
        args.output.write_text(text + "\n")
    print(text)


if __name__ == "__main__":
    main()
