# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Exact replay of the known Rigid221 S0 row seed and its coupled-row extension.

This is deliberately solver-free. It verifies the finite row core over
``fractions.Fraction`` and then identifies the source-ingress obstruction: the
minimum enclosing circle has only two carrier points on its boundary, while a
``SurplusCapPacket`` requires a circumscribed Moser triple with three distinct
boundary vertices.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter
from collections.abc import Iterable, Mapping
from fractions import Fraction
from pathlib import Path
from typing import Any

F = Fraction
Point = tuple[F, F]

LANE_STATUS = "OPEN"
ROW_CORE_STATUS = "ROW_CORE_POSITIVE_CONTROL"
SOURCE_STATUS = "SOURCE_INVALID"
ORDER = (
    "O",
    "au",
    "av",
    "v",
    "delta",
    "u",
    "cv",
    "cu",
    "xu",
    "xv",
    "bv",
    "bu",
)
PRIOR_SEED_ROLES = frozenset({"O", "u", "xu", "delta", "v", "xv", "cu", "au", "bu"})
PHYSICAL = frozenset({"u", "xu", "delta", "v", "xv"})
KU = frozenset({"u", "xu", "au", "bu"})
KV = frozenset({"v", "xv", "av", "bv"})

POINTS: dict[str, Point] = {
    "O": (F(0), F(0)),
    "au": (F(1, 25), F(-8, 25)),
    "av": (F(237, 2050), F(-2599, 4100)),
    "v": (F(8, 17), F(-15, 17)),
    "delta": (F(33, 65), F(-56, 65)),
    "u": (F(3, 5), F(-4, 5)),
    "cv": (F(79, 100), F(-79, 1640)),
    "cu": (F(4, 5), F(0)),
    "xu": (F(3, 5), F(4, 5)),
    "xv": (F(228, 397), F(325, 397)),
    "bv": (F(13557, 26650), F(2131, 2665)),
    "bu": (F(12, 25), F(19, 25)),
}


def add(first: Point, second: Point) -> Point:
    return first[0] + second[0], first[1] + second[1]


def scale(value: F, point: Point) -> Point:
    return value * point[0], value * point[1]


def dist2(first: Point, second: Point) -> F:
    return (first[0] - second[0]) ** 2 + (first[1] - second[1]) ** 2


def orient(first: Point, second: Point, third: Point) -> F:
    return (second[0] - first[0]) * (third[1] - first[1]) - (
        second[1] - first[1]
    ) * (third[0] - first[0])


def fraction_json(value: F) -> str:
    return f"{value.numerator}/{value.denominator}"


def point_json(point: Point) -> list[str]:
    return [fraction_json(point[0]), fraction_json(point[1])]


def exact_fiber(
    points: Mapping[str, Point], center: str, radius2: F, roles: Iterable[str]
) -> frozenset[str]:
    role_set = frozenset(roles)
    return frozenset(
        role for role in role_set if dist2(points[center], points[role]) == radius2
    )


def complete_fiber(points: Mapping[str, Point], center: str, radius2: F) -> frozenset[str]:
    return frozenset(
        role for role, point in points.items() if dist2(points[center], point) == radius2
    )


def post_deletion_profile(
    points: Mapping[str, Point], center: str, deleted: str
) -> tuple[int, list[int]]:
    multiplicities = Counter(
        dist2(points[center], point)
        for role, point in points.items()
        if role != deleted and dist2(points[center], point) > 0
    )
    profile = sorted(multiplicities.values(), reverse=True)
    return max(profile, default=0), profile


def orientation_report(points: Mapping[str, Point]) -> tuple[F, tuple[str, str, str], int]:
    values: list[tuple[F, tuple[str, str, str]]] = []
    for index, first in enumerate(ORDER):
        second = ORDER[(index + 1) % len(ORDER)]
        for third in ORDER:
            if third in (first, second):
                continue
            value = orient(points[first], points[second], points[third])
            if value <= 0:
                raise ValueError(
                    f"non-strict hull edge {first}->{second} at {third}: {value}"
                )
            values.append((value, (first, second, third)))
    minimum, roles = min(values)
    return minimum, roles, len(values)


def diameter_mec_report(points: Mapping[str, Point], roles: Iterable[str]) -> dict[str, Any]:
    selected = tuple(role for role in ORDER if role in frozenset(roles))
    center = scale(F(1, 2), add(points["v"], points["xv"]))
    radius2 = dist2(points["v"], points["xv"]) / 4
    slacks = {role: radius2 - dist2(points[role], center) for role in selected}
    if any(value < 0 for value in slacks.values()):
        raise ValueError("diameter disk does not enclose the carrier")
    boundary = frozenset(role for role, value in slacks.items() if value == 0)
    if boundary != {"v", "xv"}:
        raise ValueError(f"unexpected MEC boundary: {sorted(boundary)}")
    if any(value <= 0 for role, value in slacks.items() if role not in boundary):
        raise ValueError("a non-diameter carrier role is not strictly inside the disk")
    return {
        "diameter_pair": ["v", "xv"],
        "center": point_json(center),
        "radius_squared": fraction_json(radius2),
        "boundary_roles": sorted(boundary),
        "boundary_cardinality": len(boundary),
        "strict_interior_slacks": {
            role: fraction_json(slacks[role])
            for role in selected
            if role not in boundary
        },
        "minimality_argument": (
            "Every enclosing disk has radius at least dist(v,xv)/2 by the triangle "
            "inequality; the displayed midpoint disk has that radius and encloses every role."
        ),
    }


def build_report() -> dict[str, Any]:
    if tuple(POINTS) != ORDER:
        raise ValueError("coordinate order differs from the declared cyclic order")
    if len(frozenset(POINTS.values())) != len(POINTS):
        raise ValueError("two roles share coordinates")

    minimum, minimum_roles, orientation_count = orientation_report(POINTS)
    physical_radius2 = dist2(POINTS["O"], POINTS["u"])
    ku_radius2 = dist2(POINTS["cu"], POINTS["u"])
    kv_radius2 = dist2(POINTS["cv"], POINTS["v"])
    if physical_radius2 != 1:
        raise ValueError(f"unexpected physical radius squared: {physical_radius2}")
    if complete_fiber(POINTS, "O", physical_radius2) != PHYSICAL:
        raise ValueError("physical fiber is not exact in the closed carrier")
    if exact_fiber(POINTS, "cu", ku_radius2, KU) != KU:
        raise ValueError("Ku members do not share the claimed radius")
    if complete_fiber(POINTS, "cu", ku_radius2) != KU:
        raise ValueError("Ku is not the complete closed-carrier fiber")
    if exact_fiber(POINTS, "cv", kv_radius2, KV) != KV:
        raise ValueError("Kv members do not share the claimed radius")
    if complete_fiber(POINTS, "cv", kv_radius2) != KV:
        raise ValueError("Kv is not the complete closed-carrier fiber")
    post_u_max, post_u_profile = post_deletion_profile(POINTS, "cu", "u")
    post_v_max, post_v_profile = post_deletion_profile(POINTS, "cv", "v")
    if post_u_max > 3 or post_v_max > 3:
        raise ValueError("a designated post-deletion four-fiber remains")

    prior_mec = diameter_mec_report(POINTS, PRIOR_SEED_ROLES)
    coupled_mec = diameter_mec_report(POINTS, ORDER)
    if prior_mec["center"] != coupled_mec["center"]:
        raise ValueError("the opposite-row extension changed the certified MEC center")
    if prior_mec["radius_squared"] != coupled_mec["radius_squared"]:
        raise ValueError("the opposite-row extension changed the certified MEC radius")

    return {
        "schema": "rigid221-s0-prior-seed-obstruction/v1",
        "status": LANE_STATUS,
        "row_core_status": ROW_CORE_STATUS,
        "source_status": SOURCE_STATUS,
        "claim_scope": {
            "row_core_exact": True,
            "seed_source_valid": False,
            "l1_s0_i_decided": False,
            "l1_s0_n_decided": False,
            "source_universal_claim": False,
            "lean_claim": False,
            "promotion_claim": False,
        },
        "points": {role: point_json(POINTS[role]) for role in ORDER},
        "cyclic_order": list(ORDER),
        "row_core": {
            "physical_roles": sorted(PHYSICAL),
            "ku_roles": sorted(KU),
            "kv_roles": sorted(KV),
            "physical_radius_squared": fraction_json(physical_radius2),
            "ku_radius_squared": fraction_json(ku_radius2),
            "kv_radius_squared": fraction_json(kv_radius2),
            "orientation_checks": orientation_count,
            "minimum_orientation": fraction_json(minimum),
            "minimum_orientation_roles": list(minimum_roles),
            "post_u_max_positive_multiplicity": post_u_max,
            "post_u_profile": post_u_profile,
            "post_v_max_positive_multiplicity": post_v_max,
            "post_v_profile": post_v_profile,
        },
        "prior_single_row_mec": prior_mec,
        "coupled_row_mec": coupled_mec,
        "source_obstruction": {
            "required_boundary_cardinality": 3,
            "actual_boundary_cardinality": coupled_mec["boundary_cardinality"],
            "required_source_field": "SurplusCapPacket.hCirc",
            "conclusion": (
                "The prior seed and its known coupled-row extension are in the MEC "
                "diameter branch, so neither supplies the source SurplusCapPacket needed "
                "to define the actual S0 cap J."
            ),
        },
        "remaining_gap": (
            "Construct different coordinates with three distinct non-obtuse MEC-boundary "
            "vertices, a surplus cap different from the O-opposite cap, and exact S0-I or "
            "S0-N membership while preserving both ambient exact four-fibers."
        ),
    }


def write_json(path: Path, value: Mapping[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path)
    parser.add_argument("--row-core-output", type=Path)
    parser.add_argument("--mec-output", type=Path)
    args = parser.parse_args()

    report = build_report()
    if args.output is not None:
        write_json(args.output, report)
    if args.row_core_output is not None:
        write_json(
            args.row_core_output,
            {
                "schema": report["schema"],
                "status": ROW_CORE_STATUS,
                "source_status": SOURCE_STATUS,
                "points": report["points"],
                "cyclic_order": report["cyclic_order"],
                "row_core": report["row_core"],
                "claim_scope": report["claim_scope"],
            },
        )
    if args.mec_output is not None:
        write_json(
            args.mec_output,
            {
                "schema": report["schema"],
                "status": SOURCE_STATUS,
                "row_core_status": ROW_CORE_STATUS,
                "prior_single_row_mec": report["prior_single_row_mec"],
                "coupled_row_mec": report["coupled_row_mec"],
                "source_obstruction": report["source_obstruction"],
                "remaining_gap": report["remaining_gap"],
            },
        )
    if args.output is None and args.row_core_output is None and args.mec_output is None:
        print(json.dumps(report, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
