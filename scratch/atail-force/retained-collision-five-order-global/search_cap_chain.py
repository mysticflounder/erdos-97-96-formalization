#!/usr/bin/env python3
"""Search the five retained-collision orders with the full cap-chain inequalities.

The parameterization enforces the three exact equality rows:

* OJ = OC = OK, with O = (0, 0) and J = (1, 0);
* AC = AK, by putting A on the perpendicular bisector of C,K; and
* XJ = XK, by putting X on the perpendicular bisector of J,K.

The objective then tests strict convexity in the displayed six-point order and
the nonacute-chain inequality at every ordered triple of the five proposed cap
points.  A small objective is discovery evidence only, not a certificate.
"""

from __future__ import annotations

import itertools
import math
from fractions import Fraction

import numpy as np
from scipy.optimize import differential_evolution


ORDERS = (
    ("O", "J", "X", "C", "A", "K"),
    ("O", "J", "C", "X", "A", "K"),
    ("O", "C", "A", "J", "X", "K"),
    ("O", "C", "A", "K", "X", "J"),
    ("O", "C", "J", "A", "X", "K"),
)


def point(angle: float) -> np.ndarray:
    return np.array((math.cos(angle), math.sin(angle)))


def area(a: np.ndarray, b: np.ndarray, c: np.ndarray) -> float:
    left = b - a
    right = c - a
    return float(left[0] * right[1] - left[1] * right[0])


def data(values: np.ndarray) -> dict[str, np.ndarray]:
    c_angle, k_angle, x_scale, a_scale = values
    points = {
        "O": np.zeros(2),
        "J": np.array((1.0, 0.0)),
        "C": point(c_angle),
        "K": point(k_angle),
    }
    points["X"] = x_scale * (points["J"] + points["K"])
    points["A"] = a_scale * (points["C"] + points["K"])
    return points


def violations(values: np.ndarray, order: tuple[str, ...], sign: float) -> list[float]:
    points = data(values)
    ordered = tuple(points[label] for label in order)
    result: list[float] = []

    # Strict convexity: every increasing triple has one orientation.
    for i, j, k in itertools.combinations(range(6), 3):
        result.append(1.0e-4 - sign * area(ordered[i], ordered[j], ordered[k]))

    # Every increasing cap triple has a nonacute angle at its middle point.
    cap_order = order[1:]
    for i, j, k in itertools.combinations(range(5), 3):
        left = points[cap_order[i]] - points[cap_order[j]]
        right = points[cap_order[k]] - points[cap_order[j]]
        result.append(float(np.dot(left, right)))

    # Keep all six named points separated.
    for left, right in itertools.combinations(order, 2):
        result.append(1.0e-4 - float(np.dot(points[left] - points[right], points[left] - points[right])))
    return result


def objective(values: np.ndarray, order: tuple[str, ...], sign: float) -> float:
    return max(0.0, *violations(values, order, sign))


def rational_unit(t: Fraction) -> tuple[Fraction, Fraction]:
    return ((1 - t * t) / (1 + t * t), 2 * t / (1 + t * t))


def rational_data(values: np.ndarray) -> tuple[dict[str, tuple[Fraction, Fraction]], tuple[Fraction, ...]]:
    c_angle, k_angle, x_scale, a_scale = values
    parameters = (
        Fraction(math.tan(c_angle / 2)).limit_denominator(2000),
        Fraction(math.tan(k_angle / 2)).limit_denominator(2000),
        Fraction(float(x_scale)).limit_denominator(2000),
        Fraction(float(a_scale)).limit_denominator(2000),
    )
    c_parameter, k_parameter, x_factor, a_factor = parameters
    points = {
        "O": (Fraction(0), Fraction(0)),
        "J": (Fraction(1), Fraction(0)),
        "C": rational_unit(c_parameter),
        "K": rational_unit(k_parameter),
    }
    points["X"] = tuple(x_factor * (points["J"][i] + points["K"][i]) for i in range(2))
    points["A"] = tuple(a_factor * (points["C"][i] + points["K"][i]) for i in range(2))
    return points, parameters


def rational_margins(
    values: np.ndarray, order: tuple[str, ...], sign: float
) -> tuple[Fraction, Fraction, Fraction]:
    points, _ = rational_data(values)

    def subtract(left: tuple[Fraction, Fraction], right: tuple[Fraction, Fraction]) -> tuple[Fraction, Fraction]:
        return (left[0] - right[0], left[1] - right[1])

    def determinant(left: tuple[Fraction, Fraction], right: tuple[Fraction, Fraction]) -> Fraction:
        return left[0] * right[1] - left[1] * right[0]

    def dot(left: tuple[Fraction, Fraction], right: tuple[Fraction, Fraction]) -> Fraction:
        return left[0] * right[0] + left[1] * right[1]

    orientation_margins = []
    for i, j, k in itertools.combinations(range(6), 3):
        a, b, c = (points[order[index]] for index in (i, j, k))
        orientation_margins.append(Fraction(int(sign)) * determinant(subtract(b, a), subtract(c, a)))
    nonacute_margins = []
    cap_order = order[1:]
    for i, j, k in itertools.combinations(range(5), 3):
        a, b, c = (points[cap_order[index]] for index in (i, j, k))
        nonacute_margins.append(-dot(subtract(a, b), subtract(c, b)))
    separation_margins = []
    for left, right in itertools.combinations(order, 2):
        delta = subtract(points[left], points[right])
        separation_margins.append(dot(delta, delta))
    return min(orientation_margins), min(nonacute_margins), min(separation_margins)


def main() -> int:
    bounds = ((-math.pi, math.pi), (-math.pi, math.pi), (-8.0, 8.0), (-8.0, 8.0))
    for order in ORDERS:
        best = None
        for sign in (-1.0, 1.0):
            result = differential_evolution(
                objective,
                bounds,
                args=(order, sign),
                seed=20260717,
                maxiter=1800,
                popsize=30,
                polish=True,
                workers=1,
                updating="immediate",
            )
            candidate = (result.fun, sign, result.x)
            if best is None or candidate[0] < best[0]:
                best = candidate
        assert best is not None
        value, sign, values = best
        rational_points, rational_parameters = rational_data(values)
        margins = rational_margins(values, order, sign)
        print(",".join(order))
        print(f"  minimum_max_violation={value:.12g} orientation={sign:+.0f}")
        print(f"  parameters={values.tolist()}")
        print(f"  rational_parameters={[str(value) for value in rational_parameters]}")
        print(f"  exact_min_margins={[str(value) for value in margins]}")
        print(f"  rational_points={{{', '.join(f'{key!r}: ({value[0]}, {value[1]})' for key, value in rational_points.items())}}}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
