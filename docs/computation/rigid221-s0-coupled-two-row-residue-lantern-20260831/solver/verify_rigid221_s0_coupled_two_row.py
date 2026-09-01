# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Independent exact verifier for the prior-seed MEC obstruction artifacts."""

from __future__ import annotations

import argparse
import json
from collections import Counter
from collections.abc import Mapping
from fractions import Fraction
from pathlib import Path
from typing import Any

F = Fraction
Point = tuple[F, F]

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


class VerificationError(ValueError):
    """Artifact or exact replay failure."""


def require(condition: bool, message: str) -> None:
    if not condition:
        raise VerificationError(message)


def parse_fraction(value: object) -> F:
    require(isinstance(value, str), "fraction is not a string")
    numerator, separator, denominator = value.partition("/")
    require(separator == "/" and numerator and denominator, "invalid fraction syntax")
    return F(int(numerator), int(denominator))


def parse_point(value: object) -> Point:
    require(isinstance(value, list) and len(value) == 2, "invalid point")
    return parse_fraction(value[0]), parse_fraction(value[1])


def fraction_json(value: F) -> str:
    return f"{value.numerator}/{value.denominator}"


def point_json(point: Point) -> list[str]:
    return [fraction_json(point[0]), fraction_json(point[1])]


def dist2(first: Point, second: Point) -> F:
    return (first[0] - second[0]) ** 2 + (first[1] - second[1]) ** 2


def orient(first: Point, second: Point, third: Point) -> F:
    return (second[0] - first[0]) * (third[1] - first[1]) - (
        second[1] - first[1]
    ) * (third[0] - first[0])


def midpoint(first: Point, second: Point) -> Point:
    return (first[0] + second[0]) / 2, (first[1] + second[1]) / 2


def fiber(points: Mapping[str, Point], center: str, radius2: F) -> frozenset[str]:
    return frozenset(
        role for role, point in points.items() if dist2(points[center], point) == radius2
    )


def deletion_profile(points: Mapping[str, Point], center: str, deleted: str) -> list[int]:
    multiplicities = Counter(
        dist2(points[center], point)
        for role, point in points.items()
        if role != deleted and dist2(points[center], point) > 0
    )
    return sorted(multiplicities.values(), reverse=True)


def verify_hull(points: Mapping[str, Point], row_core: Mapping[str, Any]) -> None:
    values: list[tuple[F, tuple[str, str, str]]] = []
    for index, first in enumerate(ORDER):
        second = ORDER[(index + 1) % len(ORDER)]
        for third in ORDER:
            if third in (first, second):
                continue
            value = orient(points[first], points[second], points[third])
            require(value > 0, f"non-strict hull edge {first}->{second} at {third}")
            values.append((value, (first, second, third)))
    minimum, roles = min(values)
    require(len(values) == row_core["orientation_checks"], "orientation count mismatch")
    require(
        fraction_json(minimum) == row_core["minimum_orientation"],
        "minimum orientation mismatch",
    )
    require(list(roles) == row_core["minimum_orientation_roles"], "minimum roles mismatch")


def verify_mec(
    points: Mapping[str, Point], roles: frozenset[str], document: Mapping[str, Any]
) -> None:
    center = midpoint(points["v"], points["xv"])
    radius2 = dist2(points["v"], points["xv"]) / 4
    slacks = {role: radius2 - dist2(points[role], center) for role in roles}
    require(all(value >= 0 for value in slacks.values()), "diameter disk misses a role")
    boundary = frozenset(role for role, value in slacks.items() if value == 0)
    require(boundary == {"v", "xv"}, "MEC boundary is not exactly the diameter pair")
    require(
        all(value > 0 for role, value in slacks.items() if role not in boundary),
        "a non-diameter role is not strictly interior",
    )
    require(point_json(center) == document["center"], "MEC center mismatch")
    require(fraction_json(radius2) == document["radius_squared"], "MEC radius mismatch")
    require(sorted(boundary) == document["boundary_roles"], "MEC boundary mismatch")
    require(document["boundary_cardinality"] == 2, "MEC boundary cardinality mismatch")
    expected_slacks = {
        role: fraction_json(slacks[role]) for role in ORDER if role in roles - boundary
    }
    require(
        expected_slacks == document["strict_interior_slacks"],
        "MEC interior slack mismatch",
    )


def verify_documents(row_document: object, mec_document: object) -> dict[str, Any]:
    require(isinstance(row_document, dict), "row document is not an object")
    require(isinstance(mec_document, dict), "MEC document is not an object")
    row = row_document
    mec = mec_document
    require(row.get("schema") == "rigid221-s0-prior-seed-obstruction/v1", "bad schema")
    require(mec.get("schema") == row.get("schema"), "schema mismatch")
    require(row.get("status") == "ROW_CORE_POSITIVE_CONTROL", "bad row status")
    require(row.get("source_status") == "SOURCE_INVALID", "bad row source status")
    require(mec.get("status") == "SOURCE_INVALID", "bad MEC status")
    require(
        mec.get("row_core_status") == "ROW_CORE_POSITIVE_CONTROL",
        "bad MEC row-core status",
    )
    require(row.get("cyclic_order") == list(ORDER), "cyclic order mismatch")
    raw_points = row.get("points")
    require(isinstance(raw_points, dict) and set(raw_points) == set(ORDER), "role mismatch")
    points = {role: parse_point(raw_points[role]) for role in ORDER}
    require(len(frozenset(points.values())) == len(ORDER), "duplicate coordinates")

    row_core = row.get("row_core")
    require(isinstance(row_core, dict), "missing row core")
    physical_radius2 = parse_fraction(row_core["physical_radius_squared"])
    ku_radius2 = parse_fraction(row_core["ku_radius_squared"])
    kv_radius2 = parse_fraction(row_core["kv_radius_squared"])
    require(physical_radius2 > 0 and ku_radius2 > 0 and kv_radius2 > 0, "nonpositive radius")
    require(fiber(points, "O", physical_radius2) == PHYSICAL, "wrong physical fiber")
    require(fiber(points, "cu", ku_radius2) == KU, "wrong Ku fiber")
    require(fiber(points, "cv", kv_radius2) == KV, "wrong Kv fiber")
    require(KU & PHYSICAL == {"u", "xu"}, "wrong Ku physical trace")
    require(KV & PHYSICAL == {"v", "xv"}, "wrong Kv physical trace")
    require(not ((KU & PHYSICAL) & (KV & PHYSICAL)), "physical traces overlap")
    require(PHYSICAL == (KU & PHYSICAL) | (KV & PHYSICAL) | {"delta"}, "not 2+2+1")
    post_u = deletion_profile(points, "cu", "u")
    post_v = deletion_profile(points, "cv", "v")
    require(post_u == row_core["post_u_profile"], "post-u profile mismatch")
    require(post_v == row_core["post_v_profile"], "post-v profile mismatch")
    require(max(post_u, default=0) <= 3 and max(post_v, default=0) <= 3, "K4 survives")
    verify_hull(points, row_core)

    prior_mec = mec.get("prior_single_row_mec")
    coupled_mec = mec.get("coupled_row_mec")
    require(isinstance(prior_mec, dict) and isinstance(coupled_mec, dict), "missing MEC data")
    verify_mec(points, PRIOR_SEED_ROLES, prior_mec)
    verify_mec(points, frozenset(ORDER), coupled_mec)
    obstruction = mec.get("source_obstruction")
    require(isinstance(obstruction, dict), "missing source obstruction")
    require(obstruction.get("required_boundary_cardinality") == 3, "wrong requirement")
    require(obstruction.get("actual_boundary_cardinality") == 2, "wrong boundary count")
    require(obstruction.get("required_source_field") == "SurplusCapPacket.hCirc", "wrong field")

    return {
        "status": "VERIFIED",
        "row_core_exact": True,
        "mec_boundary_roles": ["v", "xv"],
        "mec_boundary_cardinality": 2,
        "surplus_cap_packet_available": False,
        "l1_s0_i_decided": False,
        "l1_s0_n_decided": False,
    }


def load_json(path: Path) -> object:
    return json.loads(path.read_text(encoding="utf-8"))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("row_core", type=Path)
    parser.add_argument("mec_obstruction", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = verify_documents(load_json(args.row_core), load_json(args.mec_obstruction))
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")


if __name__ == "__main__":
    main()
