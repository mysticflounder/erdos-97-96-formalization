#!/usr/bin/env python3
"""Exact rational realizations of every acyclic different-pair order type."""

from __future__ import annotations

from fractions import Fraction as F
import importlib.util
import itertools
import json
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ORDINAL_AUDIT = ROOT / "scratch/atail-force/robust-second-apex-bank-audit/audit.py"


CASES = (
    (("O", "J", "X", "C", "A", "K"), F(329, 59), F(528, 41), F(236, 57), F(17, 31)),
    (("O", "J", "C", "X", "A", "K"), F(-68, 89), F(-1305, 74), F(39, 4), F(17, 26)),
    (("O", "C", "A", "J", "X", "K"), F(-76, 31), F(23, 88), F(8, 13), F(106, 41)),
    (("O", "C", "A", "K", "X", "J"), F(-399, 85), F(-49, 71), F(23, 43), F(33, 37)),
    (("O", "C", "J", "A", "X", "K"), F(3, 17), F(-271, 95), F(413, 94), F(786, 91)),
)


def load_ordinal() -> Any:
    spec = importlib.util.spec_from_file_location("rational_survivor_ordinal", ORDINAL_AUDIT)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {ORDINAL_AUDIT}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def unit(t: F) -> tuple[F, F]:
    return ((1 - t * t) / (1 + t * t), 2 * t / (1 + t * t))


def add(left: tuple[F, F], right: tuple[F, F]) -> tuple[F, F]:
    return (left[0] + right[0], left[1] + right[1])


def scale(value: F, point: tuple[F, F]) -> tuple[F, F]:
    return (value * point[0], value * point[1])


def squared_distance(left: tuple[F, F], right: tuple[F, F]) -> F:
    return (left[0] - right[0]) ** 2 + (left[1] - right[1]) ** 2


def signed_area(
    first: tuple[F, F], second: tuple[F, F], third: tuple[F, F]
) -> F:
    return (second[0] - first[0]) * (third[1] - first[1]) - (
        second[1] - first[1]
    ) * (third[0] - first[0])


def alternates(order: tuple[str, ...], a: str, b: str, x: str, y: str) -> bool:
    positions = {point: index for index, point in enumerate(order)}
    n = len(order)

    def between(start: int, end: int, point: int) -> bool:
        return 0 < (point - start) % n < (end - start) % n

    return between(positions[a], positions[b], positions[x]) != between(
        positions[a], positions[b], positions[y]
    )


def main() -> int:
    ordinal = load_ordinal()
    rows = (
        ("O", frozenset(("J", "C", "K"))),
        ("A", frozenset(("C", "K"))),
        ("X", frozenset(("J", "K"))),
    )
    results = []
    for order, c_parameter, k_parameter, x_scale, a_scale in CASES:
        points = {
            "O": (F(0), F(0)),
            "J": (F(1), F(0)),
            "C": unit(c_parameter),
            "K": unit(k_parameter),
        }
        points["X"] = scale(x_scale, add(points["J"], points["K"]))
        points["A"] = scale(a_scale, add(points["C"], points["K"]))

        assert squared_distance(points["O"], points["J"]) == squared_distance(
            points["O"], points["C"]
        ) == squared_distance(points["O"], points["K"])
        assert squared_distance(points["A"], points["C"]) == squared_distance(
            points["A"], points["K"]
        )
        assert squared_distance(points["X"], points["J"]) == squared_distance(
            points["X"], points["K"]
        )
        assert alternates(order, "O", "A", "C", "K")
        assert alternates(order, "O", "X", "J", "K")

        ordered_points = tuple(points[label] for label in order)
        areas = tuple(
            signed_area(ordered_points[i], ordered_points[j], ordered_points[k])
            for i, j, k in itertools.combinations(range(6), 3)
        )
        assert all(area > 0 for area in areas) or all(area < 0 for area in areas)
        assert ordinal.shortest_cycle_length(order, rows) is None
        results.append(
            {
                "order": list(order),
                "orientation": "positive" if areas[0] > 0 else "negative",
                "parameters": {
                    "c": str(c_parameter),
                    "k": str(k_parameter),
                    "x_scale": str(x_scale),
                    "a_scale": str(a_scale),
                },
            }
        )

    print(
        json.dumps(
            {
                "status": "EXACT_RATIONAL_LOCAL_GEOMETRIC_REALIZATIONS",
                "realized_acyclic_order_count": len(results),
                "results": results,
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
