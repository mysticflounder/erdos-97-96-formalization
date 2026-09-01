# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Independent exact verifier for the two retained S0 L1 true-cap witnesses.

The producer is deliberately not imported.  The two rational configurations
are reconstructed below from their defining ``P`` and ``Rot`` formulas, then
every retained certificate field is replayed with ``fractions.Fraction``.
The verified scope is only the finite L1 cap/two-row core: it is not a full
theorem, a ``CounterexampleData``, or an L2/L3 packet.
"""

from __future__ import annotations

import argparse
import json
from collections.abc import Mapping, Sequence
from fractions import Fraction
from itertools import combinations
from pathlib import Path
from typing import Any

F = Fraction
Point = tuple[F, F]

SCHEMA = "rigid221-s0-true-cap-witnesses/v1"
INPUT_STATUS = "SAT_EXACT_L1_CAP_TWO_ROW_CORE"
VERIFIED_STATUS = "VERIFIED_SAT_EXACT_L1_CAP_TWO_ROW_CORE"
BRANCHES = ("S0-I", "S0-N")
MEC_CENTER = (F(137, 210), F(0))
MEC_RADIUS2 = F(18769, 44100)
PHYSICAL = frozenset({"u", "xu", "delta", "v", "xv"})

ORDERS = {
    "S0-I": (
        "O",
        "r1",
        "r2",
        "delta",
        "v",
        "u",
        "cu",
        "cv",
        "xu",
        "xv",
        "q1",
        "q2",
        "s",
    ),
    "S0-N": (
        "O",
        "qu2",
        "qu1",
        "qv2",
        "delta",
        "v",
        "u",
        "cv",
        "cu",
        "xv",
        "xu",
        "qv1",
    ),
}

ROW_ROLES = {
    "S0-I": {
        "Ku": frozenset({"u", "xu", "q1", "q2"}),
        "Kv": frozenset({"v", "xv", "r1", "r2"}),
    },
    "S0-N": {
        "Ku": frozenset({"u", "xu", "qu1", "qu2"}),
        "Kv": frozenset({"v", "xv", "qv1", "qv2"}),
    },
}

MOSER_ROLES = {
    "S0-I": ("delta", "xv", "O"),
    "S0-N": ("xu", "delta", "O"),
}

EXPECTED_CAP_CARDS = {"S0-I": [5, 4, 7], "S0-N": [5, 3, 7]}
EXPECTED_HULL_MINIMUM = {
    "S0-I": F(17677329, 639750612500),
    "S0-N": F(3840, 51180049),
}
EXPECTED_NON_OBTUSE_DOTS = [F(3281, 18769), F(15488, 18769), F(15488, 18769)]

SOURCE_ANCHORS = {
    "on_arc_opposite": "lean/Erdos9796Proof/P97/Foundation.lean:83",
    "moser_triangle": "lean/Erdos9796Proof/P97/Moser/Triangle.lean:59",
    "non_obtuse_moser": "lean/Erdos9796Proof/P97/Moser/TriangleNonObtuse.lean:667",
    "cap_triple": "lean/Erdos9796Proof/P97/Cap/Structure.lean:161",
    "surplus_cap_packet": "lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:332",
    "cap_interior_by_index": "lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:496",
    "opp_index2": "lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:550",
    "opp_apex2": "lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:305",
    "indexed_rotation": "lean/Erdos9796Proof/P97/SurplusM44Packet/Shard01.lean:240",
}


class VerificationError(ValueError):
    """The retained document is malformed or its exact replay fails."""


def require(condition: bool, message: str) -> None:
    if not condition:
        raise VerificationError(message)


def require_mapping(value: object, message: str) -> Mapping[str, Any]:
    require(isinstance(value, dict), message)
    return value


def require_exact_keys(value: Mapping[str, Any], keys: set[str], message: str) -> None:
    require(set(value) == keys, message)


def fraction_json(value: F) -> str:
    return f"{value.numerator}/{value.denominator}"


def point_json(point: Point) -> list[str]:
    return [fraction_json(point[0]), fraction_json(point[1])]


def parse_fraction(value: object) -> F:
    require(isinstance(value, str), "fraction is not a string")
    numerator, separator, denominator = value.partition("/")
    require(separator == "/" and numerator and denominator, "invalid fraction syntax")
    try:
        parsed = F(int(numerator), int(denominator))
    except (ValueError, ZeroDivisionError) as error:
        raise VerificationError("invalid fraction value") from error
    require(fraction_json(parsed) == value, "fraction is not in canonical form")
    return parsed


def parse_point(value: object) -> Point:
    require(isinstance(value, list) and len(value) == 2, "invalid point")
    return parse_fraction(value[0]), parse_fraction(value[1])


def add(first: Point, second: Point) -> Point:
    return first[0] + second[0], first[1] + second[1]


def sub(first: Point, second: Point) -> Point:
    return first[0] - second[0], first[1] - second[1]


def scale(value: F, point: Point) -> Point:
    return value * point[0], value * point[1]


def dot(first: Point, second: Point) -> F:
    return first[0] * second[0] + first[1] * second[1]


def dist2(first: Point, second: Point) -> F:
    difference = sub(first, second)
    return dot(difference, difference)


def orient(first: Point, second: Point, third: Point) -> F:
    ab = sub(second, first)
    ac = sub(third, first)
    return ab[0] * ac[1] - ab[1] * ac[0]


def p(parameter: F) -> Point:
    denominator = 1 + parameter**2
    return (1 - parameter**2) / denominator, 2 * parameter / denominator


def rotate(center: Point, point: Point, parameter: F) -> Point:
    denominator = 1 + parameter**2
    cosine = (1 - parameter**2) / denominator
    sine = 2 * parameter / denominator
    relative = sub(point, center)
    quarter_turn = (-relative[1], relative[0])
    return add(center, add(scale(cosine, relative), scale(sine, quarter_turn)))


def raw_formula(branch: str) -> dict[str, Any]:
    common: dict[str, Any] = {
        "O": ["0/1", "0/1"],
        "P": "((1-t^2)/(1+t^2), 2*t/(1+t^2))",
        "Rot": "c + A*(p-c) + B*J(p-c)",
        "A": "(1-t^2)/(1+t^2)",
        "B": "2*t/(1+t^2)",
        "J": "J(x,y)=(-y,x)",
        "common_P_parameters": {
            "delta": "-4/11",
            "v": "-10/29",
            "u": "-6/19",
        },
        "mec_center": ["137/210", "0/1"],
    }
    if branch == "S0-I":
        common.update(
            {
                "branch_P_parameters": {"xu": "6/19", "xv": "4/11"},
                "center_formulas": {"cu": "(83/100,0)", "cv": "267/500*(v+xv)"},
                "rotation_formulas": {
                    "q1": {"center": "cu", "point": "u", "t": "-15/4"},
                    "q2": {"center": "cu", "point": "u", "t": "-2/1"},
                    "r1": {"center": "cv", "point": "v", "t": "-5/12"},
                    "r2": {"center": "cv", "point": "v", "t": "-7/20"},
                },
                "fixed_points": {"s": ["1/10", "1/10"]},
            }
        )
    else:
        require(branch == "S0-N", "unknown branch")
        common.update(
            {
                "branch_P_parameters": {"xv": "6/19", "xu": "4/11"},
                "center_formulas": {"cu": "157/300*(u+xu)", "cv": "31/60*(v+xv)"},
                "rotation_formulas": {
                    "qu1": {"center": "cu", "point": "u", "t": "-3/10"},
                    "qu2": {"center": "cu", "point": "u", "t": "-2/5"},
                    "qv1": {"center": "cv", "point": "v", "t": "-31/20"},
                    "qv2": {"center": "cv", "point": "v", "t": "-1/9"},
                },
                "fixed_points": {},
            }
        )
    return common


def formula_points(branch: str) -> dict[str, Point]:
    points: dict[str, Point] = {
        "O": (F(0), F(0)),
        "delta": p(F(-4, 11)),
        "v": p(F(-10, 29)),
        "u": p(F(-6, 19)),
    }
    if branch == "S0-I":
        points.update(
            {
                "xu": p(F(6, 19)),
                "xv": p(F(4, 11)),
                "cu": (F(83, 100), F(0)),
                "s": (F(1, 10), F(1, 10)),
            }
        )
        points["cv"] = scale(F(267, 500), add(points["v"], points["xv"]))
        points["q1"] = rotate(points["cu"], points["u"], F(-15, 4))
        points["q2"] = rotate(points["cu"], points["u"], F(-2))
        points["r1"] = rotate(points["cv"], points["v"], F(-5, 12))
        points["r2"] = rotate(points["cv"], points["v"], F(-7, 20))
    else:
        require(branch == "S0-N", "unknown branch")
        points.update({"xv": p(F(6, 19)), "xu": p(F(4, 11))})
        points["cu"] = scale(F(157, 300), add(points["u"], points["xu"]))
        points["cv"] = scale(F(31, 60), add(points["v"], points["xv"]))
        points["qu1"] = rotate(points["cu"], points["u"], F(-3, 10))
        points["qu2"] = rotate(points["cu"], points["u"], F(-2, 5))
        points["qv1"] = rotate(points["cv"], points["v"], F(-31, 20))
        points["qv2"] = rotate(points["cv"], points["v"], F(-1, 9))
    require(set(points) == set(ORDERS[branch]), "internal formula role mismatch")
    return points


def ordered_roles(order: Sequence[str], roles: set[str] | frozenset[str]) -> list[str]:
    return [role for role in order if role in roles]


def hull_certificate(branch: str, points: Mapping[str, Point]) -> dict[str, Any]:
    order = ORDERS[branch]
    checks: dict[str, dict[str, str]] = {}
    values: list[tuple[F, str, str, str]] = []
    for index, first in enumerate(order):
        second = order[(index + 1) % len(order)]
        edge = f"{first}->{second}"
        checks[edge] = {}
        for third in order:
            if third in (first, second):
                continue
            value = orient(points[first], points[second], points[third])
            require(
                value > 0, f"{branch} non-strict hull edge {first}->{second} at {third}"
            )
            checks[edge][third] = fraction_json(value)
            values.append((value, first, second, third))
    minimum = min(values)
    require(
        minimum[0] == EXPECTED_HULL_MINIMUM[branch], f"{branch} unexpected hull minimum"
    )
    return {
        "all_edge_nonincident_orientations_strictly_positive": True,
        "check_count": len(values),
        "minimum_orientation": fraction_json(minimum[0]),
        "minimum_roles": list(minimum[1:]),
        "edge_nonincident_orientations": checks,
    }


def distinctness_certificate(
    branch: str, points: Mapping[str, Point]
) -> dict[str, Any]:
    order = ORDERS[branch]
    distances = {
        f"{first}|{second}": fraction_json(dist2(points[first], points[second]))
        for first, second in combinations(order, 2)
    }
    require(
        all(parse_fraction(value) > 0 for value in distances.values()),
        "duplicate roles",
    )
    return {
        "all_roles_pairwise_distinct": True,
        "pair_count": len(distances),
        "pairwise_squared_distances": distances,
    }


def barycentric_weights(point: Point, triangle: Sequence[Point]) -> list[F]:
    first, second, third = triangle
    denominator = orient(first, second, third)
    require(denominator != 0, "MEC boundary triangle is collinear")
    weights = [
        orient(point, second, third) / denominator,
        orient(first, point, third) / denominator,
        orient(first, second, point) / denominator,
    ]
    require(sum(weights, F(0)) == 1, "bad MEC barycentric sum")
    reconstructed = (
        sum((weight * vertex[0] for weight, vertex in zip(weights, triangle)), F(0)),
        sum((weight * vertex[1] for weight, vertex in zip(weights, triangle)), F(0)),
    )
    require(reconstructed == point, "bad MEC barycentric reconstruction")
    require(
        all(weight >= 0 for weight in weights), "MEC center is outside boundary hull"
    )
    return weights


def mec_certificate(branch: str, points: Mapping[str, Point]) -> dict[str, Any]:
    order = ORDERS[branch]
    slacks = {role: MEC_RADIUS2 - dist2(points[role], MEC_CENTER) for role in order}
    require(
        all(slack >= 0 for slack in slacks.values()), "MEC disk misses a carrier role"
    )
    boundary = frozenset(role for role, slack in slacks.items() if slack == 0)
    expected_boundary = frozenset(MOSER_ROLES[branch])
    require(boundary == expected_boundary, f"{branch} MEC boundary mismatch")
    require(
        all(slacks[role] > 0 for role in set(order) - boundary),
        "non-boundary MEC slack",
    )
    triangle = [points[role] for role in MOSER_ROLES[branch]]
    weights = barycentric_weights(MEC_CENTER, triangle)
    weighted_boundary_distance2 = sum(
        (
            weight * dist2(points[role], MEC_CENTER)
            for role, weight in zip(MOSER_ROLES[branch], weights)
        ),
        F(0),
    )
    require(weighted_boundary_distance2 == MEC_RADIUS2, "bad MEC weighted distance")
    weight_map = {
        role: fraction_json(weight)
        for role, weight in zip(MOSER_ROLES[branch], weights)
    }
    return {
        "center": point_json(MEC_CENTER),
        "radius": "137/210",
        "radius_squared": fraction_json(MEC_RADIUS2),
        "enclosure_slacks": {role: fraction_json(slacks[role]) for role in order},
        "all_carrier_points_enclosed": True,
        "boundary_roles": sorted(boundary),
        "ordered_boundary_triple": list(MOSER_ROLES[branch]),
        "boundary_exactly_stated_triple": True,
        "strict_interior_roles": sorted(set(order) - boundary),
        "minimality_witness": {
            "kind": "positive boundary barycentric weights",
            "weights": weight_map,
            "weight_sum": "1/1",
            "weighted_boundary_barycenter": point_json(MEC_CENTER),
            "weighted_boundary_squared_distance_at_center": fraction_json(
                weighted_boundary_distance2
            ),
            "variance_identity": (
                "sum_b weight(b)*dist2(b,c) = radius_squared + dist2(center,c)"
            ),
            "conclusion": (
                "every disk enclosing the boundary triple has squared radius at least "
                "18769/44100"
            ),
        },
    }


def moser_certificate(branch: str, points: Mapping[str, Point]) -> dict[str, Any]:
    roles = MOSER_ROLES[branch]
    first, second, third = (points[role] for role in roles)
    dots = [
        dot(sub(second, first), sub(third, first)),
        dot(sub(third, second), sub(first, second)),
        dot(sub(first, third), sub(second, third)),
    ]
    require(
        sorted(dots) == sorted(EXPECTED_NON_OBTUSE_DOTS),
        f"{branch} non-obtuse dot mismatch",
    )
    distances_to_center = {role: dist2(points[role], MEC_CENTER) for role in roles}
    require(
        all(value == MEC_RADIUS2 for value in distances_to_center.values()),
        f"{branch} Moser role is not on the MEC boundary",
    )
    return {
        "vertices": {"v1": roles[0], "v2": roles[1], "v3": roles[2]},
        "pairwise_distinct": len(set(roles)) == 3 and len({first, second, third}) == 3,
        "boundary_distance_squared_equalities": {
            role: fraction_json(value) for role, value in distances_to_center.items()
        },
        "pairwise_squared_distances": {
            "v1-v2": fraction_json(dist2(first, second)),
            "v1-v3": fraction_json(dist2(first, third)),
            "v2-v3": fraction_json(dist2(second, third)),
        },
        "non_obtuse_dot_products": {
            "at_v1": fraction_json(dots[0]),
            "at_v2": fraction_json(dots[1]),
            "at_v3": fraction_json(dots[2]),
        },
        "source_extra_pair_distance_conditions": [],
    }


def on_arc_product(apex: Point, left: Point, right: Point, point: Point) -> F:
    return orient(point, left, right) * orient(apex, left, right)


def cap_certificate(
    branch: str, points: Mapping[str, Point]
) -> tuple[dict[str, Any], list[frozenset[str]]]:
    order = ORDERS[branch]
    v1, v2, v3 = (points[role] for role in MOSER_ROLES[branch])
    triples = ((v1, v2, v3), (v2, v3, v1), (v3, v1, v2))
    products: list[dict[str, F]] = []
    caps: list[frozenset[str]] = []
    for apex, left, right in triples:
        row = {role: on_arc_product(apex, left, right, points[role]) for role in order}
        products.append(row)
        caps.append(frozenset(role for role, value in row.items() if value <= 0))
    cards = [len(cap) for cap in caps]
    require(cards == EXPECTED_CAP_CARDS[branch], f"{branch} cap-card mismatch")
    moser = frozenset(MOSER_ROLES[branch])
    counts = {role: sum(role in cap for cap in caps) for role in order}
    require(
        all(counts[role] == 2 for role in moser), "Moser cap membership count mismatch"
    )
    require(
        all(counts[role] == 1 for role in set(order) - moser),
        "non-Moser cap membership count mismatch",
    )
    names = ("C1", "C2", "C3")
    frames = (
        (MOSER_ROLES[branch][0], MOSER_ROLES[branch][1], MOSER_ROLES[branch][2]),
        (MOSER_ROLES[branch][1], MOSER_ROLES[branch][2], MOSER_ROLES[branch][0]),
        (MOSER_ROLES[branch][2], MOSER_ROLES[branch][0], MOSER_ROLES[branch][1]),
    )
    expected_endpoint_pattern = {
        "v1": {"C1": False, "C2": True, "C3": True},
        "v2": {"C1": True, "C2": False, "C3": True},
        "v3": {"C1": True, "C2": True, "C3": False},
    }
    endpoint_pattern = {
        vertex_name: {
            cap_name: role in caps[index] for index, cap_name in enumerate(names)
        }
        for vertex_name, role in zip(("v1", "v2", "v3"), MOSER_ROLES[branch])
    }
    require(
        endpoint_pattern == expected_endpoint_pattern,
        f"{branch} CapTriple endpoint membership pattern mismatch",
    )
    return (
        {
            "frames": {
                name: {"apex": frame[0], "endpoint1": frame[1], "endpoint2": frame[2]}
                for name, frame in zip(names, frames)
            },
            "on_arc_opposite_truth_table": {
                name: {role: products[index][role] <= 0 for role in order}
                for index, name in enumerate(names)
            },
            "members": {name: sorted(caps[index]) for index, name in enumerate(names)},
            "cardinalities": {name: cards[index] for index, name in enumerate(names)},
            "membership_count_by_role": counts,
            "cap_triple_axioms": {
                "all_caps_subsets_of_carrier": True,
                "endpoint_pattern": endpoint_pattern,
                "every_non_moser_role_in_exactly_one_cap": True,
                "every_moser_role_in_exactly_two_caps": True,
                "arc_membership_replayed_for_every_carrier_role": True,
            },
            "surplus_idx": 0,
            "surplus_cap": "C1",
            "surplus_cardinality_strictly_greater_than_four": cards[0] > 4,
        },
        caps,
    )


def fiber(points: Mapping[str, Point], center: str, radius2: F) -> frozenset[str]:
    return frozenset(
        role
        for role, point in points.items()
        if dist2(points[center], point) == radius2
    )


def deletion_data(
    points: Mapping[str, Point], center: str, deleted: str
) -> dict[str, Any]:
    by_radius: dict[F, list[str]] = {}
    for role, point in points.items():
        if role == deleted:
            continue
        radius2 = dist2(points[center], point)
        if radius2 > 0:
            by_radius.setdefault(radius2, []).append(role)
    rows = [
        {
            "radius_squared": fraction_json(radius2),
            "roles": sorted(roles),
            "multiplicity": len(roles),
        }
        for radius2, roles in sorted(by_radius.items())
    ]
    maximum = max((row["multiplicity"] for row in rows), default=0)
    require(maximum == 3, "unexpected deletion multiplicity maximum")
    return {
        "maximum_positive_radius_multiplicity": maximum,
        "radius_classes": rows,
    }


def row_certificate(
    branch: str, points: Mapping[str, Point], j_roles: frozenset[str]
) -> dict[str, Any]:
    ku = ROW_ROLES[branch]["Ku"]
    kv = ROW_ROLES[branch]["Kv"]
    ku_radius2 = dist2(points["cu"], points["u"])
    kv_radius2 = dist2(points["cv"], points["v"])
    actual_ku = fiber(points, "cu", ku_radius2)
    actual_kv = fiber(points, "cv", kv_radius2)
    physical_fiber = fiber(points, "O", F(1))
    require(physical_fiber == PHYSICAL, f"{branch} physical fiber mismatch")
    require(actual_ku == ku, f"{branch} complete Ku mismatch")
    require(actual_kv == kv, f"{branch} complete Kv mismatch")
    ku_trace = ku & PHYSICAL
    kv_trace = kv & PHYSICAL
    require(ku_trace == {"u", "xu"} and kv_trace == {"v", "xv"}, "bad physical traces")
    require(not (ku_trace & kv_trace), "physical row traces overlap")
    require(PHYSICAL == ku_trace | kv_trace | {"delta"}, "2+2+1 partition failure")
    require(not (ku & kv), "Ku and Kv overlap")
    require("v" not in ku and "u" not in kv, "mutual omission failure")
    require("delta" not in ku and "delta" not in kv, "deletion omission failure")
    require("u" in j_roles and "v" in j_roles, "source roles are not both in J")
    require(
        "cu" not in PHYSICAL and points["cu"] not in {points[x] for x in PHYSICAL},
        "cu in physical",
    )
    require(
        "cv" not in PHYSICAL and points["cv"] not in {points[x] for x in PHYSICAL},
        "cv in physical",
    )
    require(points["cu"] != points["cv"], "row centers coincide")
    other_checks = {
        "other_ne_source": points["v"] != points["u"],
        "other_mem_physical_class": "v" in PHYSICAL,
        "other_mem_J": "v" in j_roles,
        "other_not_mem_source_row": "v" not in ku,
        "source_other_centers_distinct": points["cu"] != points["cv"],
    }
    require(all(other_checks.values()), "other := v compatibility failure")
    return {
        "physical_selected_class": {
            "center_role": "O",
            "rho": "1/1",
            "rho_squared": "1/1",
            "roles": sorted(PHYSICAL),
            "cardinality": len(physical_fiber),
            "complete_ambient_fiber": sorted(physical_fiber),
        },
        "Ku": {
            "center_role": "cu",
            "source_role": "u",
            "radius_squared": fraction_json(ku_radius2),
            "roles": sorted(ku),
            "complete_ambient_fiber": sorted(actual_ku),
        },
        "Kv": {
            "center_role": "cv",
            "source_role": "v",
            "radius_squared": fraction_json(kv_radius2),
            "roles": sorted(kv),
            "complete_ambient_fiber": sorted(actual_kv),
        },
        "physical_traces": {
            "Ku_inter_physical": sorted(ku_trace),
            "Kv_inter_physical": sorted(kv_trace),
            "singleton_residue": ["delta"],
            "disjoint_2_plus_2_plus_1": True,
        },
        "omissions": {
            "v_not_in_Ku": True,
            "u_not_in_Kv": True,
            "delta_not_in_Ku": True,
            "delta_not_in_Kv": True,
        },
        "source": {
            "role": "u",
            "u_equals_source": True,
            "source_in_Ku": True,
            "source_in_J": True,
        },
        "other_assignment_for_later_layers": {
            "role": "v",
            "checks": other_checks,
            "checked_compatibility_only_not_an_L2_claim": True,
        },
        "centers": {
            "cu": point_json(points["cu"]),
            "cv": point_json(points["cv"]),
            "cu_outside_physical_class": True,
            "cu_ne_cv": True,
        },
        "deletion_multiplicity": {
            "delete_u_at_cu": deletion_data(points, "cu", "u"),
            "delete_v_at_cv": deletion_data(points, "cv", "v"),
        },
    }


def packet_certificate(
    branch: str, points: Mapping[str, Point], caps: Sequence[frozenset[str]]
) -> tuple[dict[str, Any], frozenset[str]]:
    surplus_idx = 0
    opp_index2 = 2
    endpoints = frozenset(MOSER_ROLES[branch][0:2])
    j_roles = caps[opp_index2] - endpoints
    expected_j = (
        frozenset({"cu", "cv", "u", "v", "xu"})
        if branch == "S0-I"
        else frozenset({"cu", "cv", "u", "v", "xv"})
    )
    require(j_roles == expected_j, f"{branch} J mismatch")
    xu_in_j = "xu" in j_roles
    require(xu_in_j == (branch == "S0-I"), f"{branch} branch condition mismatch")
    triple = MOSER_ROLES[branch]
    triangle_by_index = tuple(triple[(opp_index2 + offset) % 3] for offset in range(3))
    cap_frame = (triangle_by_index[1], triangle_by_index[2], triangle_by_index[0])
    return (
        {
            "surplus_idx": surplus_idx,
            "opp_index2": opp_index2,
            "oppApex2": "O",
            "physical_O_equals_oppApex2": points["O"] == points[triple[2]],
            "triangle_by_opp_index2": list(triangle_by_index),
            "cap_frame_by_opp_index2": list(cap_frame),
            "cap_endpoints": list(triple[0:2]),
            "J": sorted(j_roles),
            "J_is_C3_with_endpoints_erased": True,
            "u_in_J": "u" in j_roles,
            "v_in_J": "v" in j_roles,
            "xu_in_J": xu_in_j,
        },
        j_roles,
    )


BRANCH_KEYS = {
    "branch_condition",
    "raw_formula",
    "role_count",
    "cyclic_order",
    "points",
    "role_distinctness",
    "strict_convexity",
    "mec",
    "moser",
    "caps",
    "packet",
    "rows",
}


def derive_branch(branch: str, points: Mapping[str, Point]) -> dict[str, Any]:
    order = ORDERS[branch]
    require(set(points) == set(order), f"{branch} role set mismatch")
    require(len(set(points.values())) == len(order), f"{branch} duplicate coordinates")
    cap_data, caps = cap_certificate(branch, points)
    packet_data, j_roles = packet_certificate(branch, points, caps)
    return {
        "branch_condition": "xu in J" if branch == "S0-I" else "xu not in J",
        "raw_formula": raw_formula(branch),
        "role_count": len(points),
        "cyclic_order": list(order),
        "points": {role: point_json(points[role]) for role in order},
        "role_distinctness": distinctness_certificate(branch, points),
        "strict_convexity": hull_certificate(branch, points),
        "mec": mec_certificate(branch, points),
        "moser": moser_certificate(branch, points),
        "caps": cap_data,
        "packet": packet_data,
        "rows": row_certificate(branch, points, j_roles),
    }


def build_expected_document() -> dict[str, Any]:
    return {
        "schema": SCHEMA,
        "status": INPUT_STATUS,
        "arithmetic": "fractions.Fraction only",
        "solver_invoked": False,
        "source_anchors": SOURCE_ANCHORS,
        "branches": {
            branch: derive_branch(branch, formula_points(branch)) for branch in BRANCHES
        },
        "claim_scope": {
            "l1_cap_two_row_core": True,
            "full_theorem": False,
            "counterexample_data": False,
            "l2": False,
            "l3": False,
            "lean_claim": False,
            "promotion_claim": False,
        },
        "l1_vs_later_scope": {
            "certified_here": (
                "the two displayed finite rational carriers satisfy the explicitly "
                "replayed L1 cap/two-row fields"
            ),
            "not_certified_here": (
                "full source ingress, CounterexampleData, L2 outside-fiber/cross-card/"
                "survival fields, L3 packet/core fields, or the source theorem"
            ),
            "other_assignment_note": (
                "other := v is checked only against the listed later-layer compatibility "
                "conditions and does not create an L2 claim"
            ),
        },
        "supplied_value_discrepancies": [
            {
                "field": "ordered non-obtuse dot products at (v1,v2,v3)",
                "supplied_order": ["3281/18769", "15488/18769", "15488/18769"],
                "exact_replay_order": ["15488/18769", "15488/18769", "3281/18769"],
                "assessment": (
                    "the multiset agrees, but the supplied order does not follow the "
                    "source v1/v2/v3 dot-product order"
                ),
            }
        ],
    }


def verify_branch(branch: str, value: object) -> None:
    document = require_mapping(value, f"{branch} certificate is not an object")
    require("status" not in document, f"{branch} status upgrade or mismatch")
    require_exact_keys(document, BRANCH_KEYS, f"{branch} certificate fields mismatch")
    expected_formula = raw_formula(branch)
    require(
        document.get("raw_formula") == expected_formula,
        f"{branch} raw formula mismatch",
    )
    require(
        document.get("cyclic_order") == list(ORDERS[branch]),
        f"{branch} cyclic order mismatch",
    )
    raw_points = require_mapping(document.get("points"), f"{branch} points missing")
    require(set(raw_points) == set(ORDERS[branch]), f"{branch} point roles mismatch")
    parsed = {role: parse_point(raw_points[role]) for role in ORDERS[branch]}
    expected_points = formula_points(branch)
    require(parsed == expected_points, f"{branch} coordinates do not match formulas")
    replay = derive_branch(branch, parsed)
    for key, label in (
        ("branch_condition", "branch condition"),
        ("role_count", "role count"),
        ("role_distinctness", "distinctness"),
        ("strict_convexity", "strict convexity"),
        ("mec", "MEC"),
        ("moser", "MoserTriangle"),
        ("caps", "CapTriple"),
        ("packet", "surplus/oppIndex2/J"),
        ("rows", "fiber/row/deletion"),
    ):
        require(
            document.get(key) == replay[key], f"{branch} {label} certificate mismatch"
        )


TOP_LEVEL_KEYS = {
    "schema",
    "status",
    "arithmetic",
    "solver_invoked",
    "source_anchors",
    "branches",
    "claim_scope",
    "l1_vs_later_scope",
    "supplied_value_discrepancies",
}


def verify_document(value: object) -> dict[str, Any]:
    document = require_mapping(value, "witness document is not an object")
    require_exact_keys(
        document, TOP_LEVEL_KEYS, "top-level certificate fields mismatch"
    )
    require(document.get("schema") == SCHEMA, "witness schema mismatch")
    require(document.get("status") == INPUT_STATUS, "status upgrade or mismatch")
    require(
        document.get("arithmetic") == "fractions.Fraction only",
        "arithmetic claim mismatch",
    )
    require(document.get("solver_invoked") is False, "unexpected solver claim")
    expected = build_expected_document()
    require(document.get("source_anchors") == SOURCE_ANCHORS, "source-anchor mismatch")
    require(
        document.get("l1_vs_later_scope") == expected["l1_vs_later_scope"],
        "L1/later scope mismatch",
    )
    require(
        document.get("supplied_value_discrepancies")
        == expected["supplied_value_discrepancies"],
        "supplied-value discrepancy record mismatch",
    )
    branches = require_mapping(document.get("branches"), "branches missing")
    require(
        set(branches) == set(BRANCHES), "S0-I and S0-N are not separate and complete"
    )
    for branch in BRANCHES:
        verify_branch(branch, branches[branch])
    expected_scope = {
        "l1_cap_two_row_core": True,
        "full_theorem": False,
        "counterexample_data": False,
        "l2": False,
        "l3": False,
        "lean_claim": False,
        "promotion_claim": False,
    }
    require(
        document.get("claim_scope") == expected_scope, "claim-scope upgrade or mismatch"
    )
    return {
        "status": VERIFIED_STATUS,
        "l1_cap_two_row_core": True,
        "full_theorem": False,
        "counterexample_data": False,
        "l2": False,
        "l3": False,
    }


def load_json(path: Path) -> object:
    return json.loads(path.read_text(encoding="utf-8"))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("witnesses", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = verify_document(load_json(args.witnesses))
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")


if __name__ == "__main__":
    main()
