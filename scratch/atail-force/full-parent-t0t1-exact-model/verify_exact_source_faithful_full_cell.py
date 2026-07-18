#!/usr/bin/env python3
"""Independent exact-rational replay of the source-faithful local cell.

All trigonometric parameters are replaced by rational tangent-half-angle
parameters.  The verifier imports neither SciPy nor the search module.
"""

from __future__ import annotations

import argparse
from collections import Counter
from fractions import Fraction as F
import hashlib
import json
import math
from pathlib import Path
from typing import Iterable


Point = tuple[F, F]
T0 = ("t0i0", "t0i1", "t0o", "t0s")
T1 = ("t1i0", "t1i1", "t1o", "t1s")
UNUSED_SOURCE = "c1"
UNUSED_ROW = (UNUSED_SOURCE, "uI", "uS0", "uS1")
PHYSICAL_FIVE = ("left", "q0", "q1", "q2", "right")
REVERSE_ROWS = (
    ("c0", ("q0", "q1", "x00", "x01")),
    ("c1", ("q1", "q2", "x10", "x11")),
    ("c2", ("q2", "q0", "x20", "x21")),
)
CRITICAL_SOURCE_BY_CENTER = {"c0": "q1", "c1": "q2", "c2": "q0"}


def add(first: Point, second: Point) -> Point:
    return first[0] + second[0], first[1] + second[1]


def sub(first: Point, second: Point) -> Point:
    return first[0] - second[0], first[1] - second[1]


def scale(coefficient: F, point: Point) -> Point:
    return coefficient * point[0], coefficient * point[1]


def unit(tangent_half: F) -> Point:
    denominator = 1 + tangent_half * tangent_half
    return (
        (1 - tangent_half * tangent_half) / denominator,
        2 * tangent_half / denominator,
    )


def rotate(point: Point, tangent_half: F) -> Point:
    cosine, sine = unit(tangent_half)
    return (
        cosine * point[0] - sine * point[1],
        sine * point[0] + cosine * point[1],
    )


def dot(first: Point, second: Point) -> F:
    return first[0] * second[0] + first[1] * second[1]


def sqdist(first: Point, second: Point) -> F:
    delta = sub(first, second)
    return dot(delta, delta)


def cross(first: Point, second: Point, point: Point) -> F:
    u, v = sub(second, first), sub(point, first)
    return u[0] * v[1] - u[1] * v[0]


def rational(value: float, denominator: int) -> F:
    return F(str(value)).limit_denominator(denominator)


def angle_parameter(value: float, denominator: int) -> F:
    return F(str(math.tan(value / 2))).limit_denominator(denominator)


def load_numeric(path: Path) -> tuple[list[float], list[float], list[str]]:
    payload = json.loads(path.read_text())
    result = payload["result"]
    return payload["base_parameters"], result["parameters"], result["cyclic_order"]


def rational_parameters(
    base_parameters: list[float],
    extension_parameters: list[float],
    denominator: int,
) -> dict[str, list[F]]:
    base_angles = [
        angle_parameter(value, denominator)
        for value in (*base_parameters[:4], *base_parameters[7:])
    ]
    base_scalars = [rational(value, denominator) for value in base_parameters[4:7]]
    extension_scalars = [
        rational(value, denominator) for value in extension_parameters[:2]
    ]
    extension_angles = [
        angle_parameter(value, denominator) for value in extension_parameters[2:]
    ]
    return {
        "base_angles": base_angles,
        "base_scalars": base_scalars,
        "extension_scalars": extension_scalars,
        "extension_angles": extension_angles,
    }


def construct(parameters: dict[str, list[F]]) -> dict[str, Point]:
    base_angles = parameters["base_angles"]
    apex_t, q0_t, q1_t, q2_t, *target_t = base_angles
    lambda0, lambda1, lambda2 = parameters["base_scalars"]
    r0, r1 = parameters["extension_scalars"]
    *t_angles, uI_t, uS0_t, uS1_t = parameters["extension_angles"]
    o = (F(0), F(0))
    left = (F(1), F(0))
    right = unit(apex_t)
    sources = [unit(q0_t), unit(q1_t), unit(q2_t)]
    blockers = [
        scale(lambda0, add(sources[0], sources[1])),
        scale(lambda1, add(sources[1], sources[2])),
        scale(lambda2, add(sources[2], sources[0])),
    ]
    points: dict[str, Point] = {
        "o": o,
        "left": left,
        "right": right,
        "q0": sources[0],
        "q1": sources[1],
        "q2": sources[2],
        "c0": blockers[0],
        "c1": blockers[1],
        "c2": blockers[2],
    }
    row_pairs = ((0, 1), (1, 2), (2, 0))
    for row, (source, _successor) in enumerate(row_pairs):
        vector = sub(sources[source], blockers[row])
        for slot in range(2):
            points[f"x{row}{slot}"] = add(
                blockers[row], rotate(vector, target_t[2 * row + slot]))
    for name, angle in zip((*T0, *T1), t_angles, strict=True):
        radius = r0 if name.startswith("t0") else r1
        points[name] = add(right, scale(radius, unit(angle)))
    unused_vector = sub(points[UNUSED_SOURCE], left)
    for name, angle in (("uI", uI_t), ("uS0", uS0_t), ("uS1", uS1_t)):
        points[name] = add(left, rotate(unused_vector, angle))
    return points


def exact_class(points: dict[str, Point], center: str, witness: str) -> set[str]:
    radius = sqdist(points[center], points[witness])
    return {
        name for name, point in points.items()
        if name != center and sqdist(points[center], point) == radius
    }


def radius_multiplicities(
    points: dict[str, Point], center: str, deleted: Iterable[str] = (),
) -> Counter[F]:
    deleted_set = set(deleted)
    return Counter(
        sqdist(points[center], point)
        for name, point in points.items()
        if name != center and name not in deleted_set
    )


def fraction_json(value: F) -> str:
    return f"{value.numerator}/{value.denominator}"


def verify(
    points: dict[str, Point],
    parameters: dict[str, list[F]],
    order: list[str],
) -> dict[str, object]:
    assert set(order) == set(points)
    assert len(order) == len(points)
    hull_margins = [
        cross(points[order[index]], points[order[(index + 1) % len(order)]], points[name])
        for index in range(len(order))
        for name in order
        if name not in (order[index], order[(index + 1) % len(order)])
    ]
    assert min(hull_margins) > 0

    pairwise = [
        sqdist(points[first], points[second])
        for index, first in enumerate(order)
        for second in order[:index]
    ]
    assert min(pairwise) > 0

    right = points["right"]
    mec_center = (F(1, 2), (1 - right[0]) / (2 * right[1]))
    mec_radius_sq = sqdist(mec_center, points["o"])
    assert sqdist(mec_center, points["left"]) == mec_radius_sq
    assert sqdist(mec_center, right) == mec_radius_sq
    mec_slacks = [
        mec_radius_sq - sqdist(mec_center, point)
        for name, point in points.items()
        if name not in ("o", "left", "right")
    ]
    assert min(mec_slacks) > 0

    triangle = ("o", "left", "right")
    for index, vertex in enumerate(triangle):
        other0 = triangle[(index + 1) % 3]
        other1 = triangle[(index + 2) % 3]
        assert sqdist(points[other0], points[other1]) <= (
            sqdist(points[vertex], points[other0]) +
            sqdist(points[vertex], points[other1]))

    def cap_margin(endpoint0: str, endpoint1: str, opposite: str, name: str) -> F:
        return -cross(points[endpoint0], points[endpoint1], points[opposite]) * \
            cross(points[endpoint0], points[endpoint1], points[name])

    cap_margins = []
    for name in ("t0i0", "t0i1", "t1i0", "t1i1", "uI"):
        cap_margins.append(cap_margin("o", "left", "right", name))
    for name in ("t0o", "t1o"):
        cap_margins.append(cap_margin("left", "right", "o", name))
    for name in ("t0s", "t1s", "uS0", "uS1"):
        cap_margins.append(cap_margin("right", "o", "left", name))
    assert min(cap_margins) > 0

    assert exact_class(points, "o", "left") == set(PHYSICAL_FIVE)
    physical_counts = radius_multiplicities(points, "o")
    assert physical_counts[F(1)] == 5
    assert max(count for radius, count in physical_counts.items() if radius != 1) < 4

    for center, support_tuple in REVERSE_ROWS:
        support = set(support_tuple)
        assert exact_class(points, center, support_tuple[0]) == support
        deleted = CRITICAL_SOURCE_BY_CENTER[center]
        assert max(radius_multiplicities(points, center, (deleted,)).values()) < 4

    assert exact_class(points, "right", T0[0]) == set(T0)
    assert exact_class(points, "right", T1[0]) == set(T1)
    r0, r1 = parameters["extension_scalars"]
    assert 0 < r0
    assert 0 < r1
    assert sqdist(points["right"], points[T0[0]]) != \
        sqdist(points["right"], points[T1[0]])
    assert set(T0).isdisjoint(T1)
    assert sqdist(points["o"], points["t0i0"]) != \
        sqdist(points["o"], points["t0i1"])

    assert exact_class(points, "left", UNUSED_SOURCE) == set(UNUSED_ROW)
    assert max(radius_multiplicities(points, "left", (UNUSED_SOURCE,)).values()) < 4
    assert UNUSED_SOURCE not in PHYSICAL_FIVE
    assert sqdist(points["o"], points[UNUSED_SOURCE]) != 1
    assert set(UNUSED_ROW).isdisjoint({"q0", "q1", "q2"})

    # Frontier deletion and the two continuation deletions retain named K4 rows.
    for frontier_source in ("t0i0", "t0i1"):
        assert frontier_source not in T1
        assert frontier_source not in PHYSICAL_FIVE
    for continuation_source in ("q0", "q1"):
        assert continuation_source not in UNUSED_ROW
        assert len(set(PHYSICAL_FIVE) - {continuation_source}) == 4

    reverse_return_gaps = [
        abs(sqdist(points["right"], points[first]) -
            sqdist(points["right"], points[second]))
        for first, second in (("x00", "x01"), ("x10", "x11"), ("x20", "x21"))
    ]
    assert min(reverse_return_gaps) > 0

    positions = {name: order.index(name) for name in order}
    # Closed support-triangle cap sizes from the certified common order.
    def cyclic_interval(start: str, finish: str) -> list[str]:
        index = positions[start]
        result = [start]
        while result[-1] != finish:
            index = (index + 1) % len(order)
            result.append(order[index])
        return result

    first_cap = cyclic_interval("o", "left")
    physical_cap = cyclic_interval("left", "right")
    surplus_cap = cyclic_interval("right", "o")
    assert "right" not in first_cap[1:-1]
    assert "o" not in physical_cap[1:-1]
    assert "left" not in surplus_cap[1:-1]
    assert len(first_cap) >= 6
    assert len(physical_cap) >= 6
    assert len(surplus_cap) >= 5

    parameter_text = json.dumps({
        name: [fraction_json(value) for value in values]
        for name, values in parameters.items()
    }, sort_keys=True, separators=(",", ":"))
    coordinate_text = json.dumps({
        name: [fraction_json(point[0]), fraction_json(point[1])]
        for name, point in sorted(points.items())
    }, sort_keys=True, separators=(",", ":"))
    return {
        "status": "EXACT_RATIONAL_REPLAY_PASS",
        "coordinate_digest": hashlib.sha256(coordinate_text.encode()).hexdigest(),
        "parameter_digest": hashlib.sha256(parameter_text.encode()).hexdigest(),
        "point_count": len(points),
        "cyclic_order": order,
        "cap_sizes": {
            "firstOpposite": len(first_cap),
            "physicalOpposite": len(physical_cap),
            "surplus": len(surplus_cap),
        },
        "minimum_hull_margin": fraction_json(min(hull_margins)),
        "minimum_mec_slack": fraction_json(min(mec_slacks)),
        "minimum_pairwise_sqdist": fraction_json(min(pairwise)),
        "minimum_cap_role_margin": fraction_json(min(cap_margins)),
        "minimum_reverse_return_gap": fraction_json(min(reverse_return_gaps)),
        "mapping": {
            "physicalApex": "o",
            "firstApex": "right",
            "surplusApex": "left",
            "frontier": ["t0i0", "t0i1"],
            "retainedRow": list(T0),
            "doubleDeletionRow": list(T1),
            "unused": UNUSED_SOURCE,
            "actualBlocker": "left",
            "unusedCriticalRow": list(UNUSED_ROW),
            "continuation": ["q0", "q1"],
            "unusedRowPhysicalStrictHits": [],
        },
        "parameters": {
            name: [fraction_json(value) for value in values]
            for name, values in parameters.items()
        },
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--input", type=Path,
        default=Path(__file__).with_name("full-source-faithful-search.json"))
    parser.add_argument("--denominator", type=int, default=10_000)
    parser.add_argument("--certificate", type=Path)
    args = parser.parse_args()
    base_parameters, extension_parameters, order = load_numeric(args.input)
    parameters = rational_parameters(
        base_parameters, extension_parameters, args.denominator)
    points = construct(parameters)
    payload = {
        "schema": "exact-source-faithful-full-parent-local-cell-v1",
        "epistemic_status": "EXACT_RATIONAL_FINITE_LOCAL_MODEL",
        "source_numeric_artifact": str(args.input),
        "rationalization_denominator_bound": args.denominator,
        "result": verify(points, parameters, order),
    }
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.certificate is not None:
        args.certificate.write_text(rendered)
    print(rendered, end="")


if __name__ == "__main__":
    main()
