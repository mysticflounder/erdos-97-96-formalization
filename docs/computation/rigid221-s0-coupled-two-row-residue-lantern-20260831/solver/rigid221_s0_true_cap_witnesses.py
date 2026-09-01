# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Produce two exact rational witnesses for the finite L1 S0 cap/row core.

This module is deliberately solver-free.  It reconstructs both carriers from
their rational parametrizations and replays the retained finite predicates with
``fractions.Fraction``.  The resulting claim stops at the named L1 core: it is
not a source theorem, ``CounterexampleData``, or an L2/L3 packet.
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
STATUS = "SAT_EXACT_L1_CAP_TWO_ROW_CORE"

SOURCE_ANCHORS = {
    "on_arc_opposite": "lean/Erdos9796Proof/P97/Foundation.lean:83",
    "moser_triangle": "lean/Erdos9796Proof/P97/Moser/Triangle.lean:59",
    "non_obtuse_moser": ("lean/Erdos9796Proof/P97/Moser/TriangleNonObtuse.lean:667"),
    "cap_triple": "lean/Erdos9796Proof/P97/Cap/Structure.lean:161",
    "surplus_cap_packet": ("lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:332"),
    "cap_interior_by_index": ("lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:496"),
    "opp_index2": "lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:550",
    "opp_apex2": "lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:305",
    "indexed_rotation": ("lean/Erdos9796Proof/P97/SurplusM44Packet/Shard01.lean:240"),
}

COMMON_P_PARAMETERS = {
    "delta": F(-4, 11),
    "v": F(-10, 29),
    "u": F(-6, 19),
}
MEC_CENTER = (F(137, 210), F(0))


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
    return (second[0] - first[0]) * (third[1] - first[1]) - (second[1] - first[1]) * (
        third[0] - first[0]
    )


def unit_circle_point(parameter: F) -> Point:
    """The rational unit-circle parametrization P(parameter)."""

    denominator = 1 + parameter * parameter
    return (1 - parameter * parameter) / denominator, 2 * parameter / denominator


def rotate_rational(center: Point, point: Point, parameter: F) -> Point:
    """Rotate ``point`` about ``center`` by the rational P(parameter) matrix."""

    a = (1 - parameter * parameter) / (1 + parameter * parameter)
    b = 2 * parameter / (1 + parameter * parameter)
    x, y = sub(point, center)
    return add(center, (a * x - b * y, b * x + a * y))


def on_arc_opposite(vi: Point, vj: Point, vk: Point, point: Point) -> bool:
    """Exact transcription of ``Problem97.OnArcOpposite``."""

    return orient(point, vj, vk) * orient(vi, vj, vk) <= 0


def fraction_json(value: F) -> str:
    return f"{value.numerator}/{value.denominator}"


def point_json(point: Point) -> list[str]:
    return [fraction_json(point[0]), fraction_json(point[1])]


def weighted_point(points: Mapping[str, Point], weights: Mapping[str, F]) -> Point:
    return (
        sum((weights[role] * points[role][0] for role in weights), start=F(0)),
        sum((weights[role] * points[role][1] for role in weights), start=F(0)),
    )


def cap_sets(
    points: Mapping[str, Point], triple: Sequence[str]
) -> tuple[frozenset[str], frozenset[str], frozenset[str]]:
    v1, v2, v3 = triple
    frames = ((v1, v2, v3), (v2, v3, v1), (v3, v1, v2))
    return tuple(
        frozenset(
            role
            for role, point in points.items()
            if on_arc_opposite(points[apex], points[first], points[second], point)
        )
        for apex, first, second in frames
    )  # type: ignore[return-value]


def complete_fiber(
    points: Mapping[str, Point], center: str, radius2: F
) -> frozenset[str]:
    return frozenset(
        role
        for role, point in points.items()
        if dist2(points[center], point) == radius2
    )


def deletion_profile(
    points: Mapping[str, Point], center: str, deleted: str
) -> tuple[int, list[dict[str, Any]]]:
    by_radius: dict[F, list[str]] = {}
    for role, point in points.items():
        if role == deleted:
            continue
        radius2 = dist2(points[center], point)
        if radius2 > 0:
            by_radius.setdefault(radius2, []).append(role)
    entries = [
        {
            "radius_squared": fraction_json(radius2),
            "roles": sorted(roles),
            "multiplicity": len(roles),
        }
        for radius2, roles in sorted(by_radius.items())
    ]
    return max((entry["multiplicity"] for entry in entries), default=0), entries


def build_branch_points(branch: str) -> dict[str, Point]:
    points = {
        "O": (F(0), F(0)),
        **{
            role: unit_circle_point(parameter)
            for role, parameter in COMMON_P_PARAMETERS.items()
        },
    }
    if branch == "S0-I":
        points.update(
            {
                "xu": unit_circle_point(F(6, 19)),
                "xv": unit_circle_point(F(4, 11)),
                "cu": (F(83, 100), F(0)),
            }
        )
        points["cv"] = scale(F(267, 500), add(points["v"], points["xv"]))
        points.update(
            {
                "q1": rotate_rational(points["cu"], points["u"], F(-15, 4)),
                "q2": rotate_rational(points["cu"], points["u"], F(-2)),
                "r1": rotate_rational(points["cv"], points["v"], F(-5, 12)),
                "r2": rotate_rational(points["cv"], points["v"], F(-7, 20)),
                "s": (F(1, 10), F(1, 10)),
            }
        )
        return points
    if branch == "S0-N":
        points.update(
            {
                "xv": unit_circle_point(F(6, 19)),
                "xu": unit_circle_point(F(4, 11)),
            }
        )
        points["cu"] = scale(F(157, 300), add(points["u"], points["xu"]))
        points["cv"] = scale(F(31, 60), add(points["v"], points["xv"]))
        points.update(
            {
                "qu1": rotate_rational(points["cu"], points["u"], F(-3, 10)),
                "qu2": rotate_rational(points["cu"], points["u"], F(-2, 5)),
                "qv1": rotate_rational(points["cv"], points["v"], F(-31, 20)),
                "qv2": rotate_rational(points["cv"], points["v"], F(-1, 9)),
            }
        )
        return points
    raise ValueError(f"unknown branch: {branch}")


def raw_formula(branch: str) -> dict[str, Any]:
    common = {
        "P": "((1-t^2)/(1+t^2), 2*t/(1+t^2))",
        "Rot": "c + A*(p-c) + B*J(p-c)",
        "A": "(1-t^2)/(1+t^2)",
        "B": "2*t/(1+t^2)",
        "J": "J(x,y)=(-y,x)",
        "common_P_parameters": {
            role: fraction_json(value) for role, value in COMMON_P_PARAMETERS.items()
        },
        "O": ["0/1", "0/1"],
        "mec_center": point_json(MEC_CENTER),
    }
    if branch == "S0-I":
        return {
            **common,
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
    return {
        **common,
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


def convexity_certificate(
    points: Mapping[str, Point], order: Sequence[str]
) -> dict[str, Any]:
    checks: dict[str, dict[str, str]] = {}
    values: list[tuple[F, str, str, str]] = []
    for index, first in enumerate(order):
        second = order[(index + 1) % len(order)]
        edge = f"{first}->{second}"
        checks[edge] = {}
        for other in order:
            if other in (first, second):
                continue
            value = orient(points[first], points[second], points[other])
            if value <= 0:
                raise ValueError(f"non-strict hull check {edge} at {other}: {value}")
            checks[edge][other] = fraction_json(value)
            values.append((value, first, second, other))
    minimum = min(values)
    return {
        "all_edge_nonincident_orientations_strictly_positive": True,
        "check_count": len(values),
        "minimum_orientation": fraction_json(minimum[0]),
        "minimum_roles": list(minimum[1:]),
        "edge_nonincident_orientations": checks,
    }


def distinctness_certificate(
    points: Mapping[str, Point], order: Sequence[str]
) -> dict[str, Any]:
    distances = {
        f"{first}|{second}": fraction_json(dist2(points[first], points[second]))
        for first, second in combinations(order, 2)
    }
    if any(F(value) <= 0 for value in distances.values()):
        raise ValueError("carrier roles are not pairwise distinct")
    return {
        "all_roles_pairwise_distinct": True,
        "pair_count": len(distances),
        "pairwise_squared_distances": distances,
    }


def mec_certificate(
    points: Mapping[str, Point], order: Sequence[str], triple: Sequence[str]
) -> dict[str, Any]:
    radius = F(137, 210)
    radius2 = radius * radius
    slacks = {role: radius2 - dist2(MEC_CENTER, points[role]) for role in order}
    if any(value < 0 for value in slacks.values()):
        raise ValueError("MEC candidate does not enclose the carrier")
    boundary = frozenset(role for role, value in slacks.items() if value == 0)
    if boundary != frozenset(triple):
        raise ValueError("MEC boundary is not exactly the stated Moser triple")

    weights = {triple[0]: radius2, triple[1]: radius2, triple[2]: 1 - 2 * radius2}
    if sum(weights.values(), start=F(0)) != 1:
        raise ValueError("minimality weights do not sum to one")
    if any(value <= 0 for value in weights.values()):
        raise ValueError("minimality weights are not strictly positive")
    if weighted_point(points, weights) != MEC_CENTER:
        raise ValueError("minimality weights do not barycentrically recover the center")
    weighted_boundary_distance2 = sum(
        (weights[role] * dist2(points[role], MEC_CENTER) for role in weights),
        start=F(0),
    )
    if weighted_boundary_distance2 != radius2:
        raise ValueError("minimality weighted boundary distance is wrong")

    return {
        "center": point_json(MEC_CENTER),
        "radius": fraction_json(radius),
        "radius_squared": fraction_json(radius2),
        "enclosure_slacks": {
            role: fraction_json(value) for role, value in slacks.items()
        },
        "all_carrier_points_enclosed": True,
        "boundary_roles": sorted(boundary),
        "ordered_boundary_triple": list(triple),
        "boundary_exactly_stated_triple": True,
        "strict_interior_roles": sorted(set(points) - boundary),
        "minimality_witness": {
            "kind": "positive boundary barycentric weights",
            "weights": {role: fraction_json(value) for role, value in weights.items()},
            "weight_sum": "1/1",
            "weighted_boundary_barycenter": point_json(weighted_point(points, weights)),
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


def moser_certificate(
    points: Mapping[str, Point], triple: Sequence[str]
) -> dict[str, Any]:
    v1, v2, v3 = triple
    pair_distances = {
        "v1-v2": dist2(points[v1], points[v2]),
        "v1-v3": dist2(points[v1], points[v3]),
        "v2-v3": dist2(points[v2], points[v3]),
    }
    dots = {
        "at_v1": dot(sub(points[v2], points[v1]), sub(points[v3], points[v1])),
        "at_v2": dot(sub(points[v3], points[v2]), sub(points[v1], points[v2])),
        "at_v3": dot(sub(points[v1], points[v3]), sub(points[v2], points[v3])),
    }
    radius2 = dist2(MEC_CENTER, points["O"])
    boundary_distances = {role: dist2(MEC_CENTER, points[role]) for role in triple}
    if any(value <= 0 for value in pair_distances.values()):
        raise ValueError("Moser roles are not pairwise distinct")
    if any(value != radius2 for value in boundary_distances.values()):
        raise ValueError("a Moser role is not on the stated MEC boundary")
    if any(value < 0 for value in dots.values()):
        raise ValueError("Moser triple is not non-obtuse")
    return {
        "vertices": {"v1": v1, "v2": v2, "v3": v3},
        "pairwise_distinct": True,
        "pairwise_squared_distances": {
            key: fraction_json(value) for key, value in pair_distances.items()
        },
        "boundary_distance_squared_equalities": {
            role: fraction_json(value) for role, value in boundary_distances.items()
        },
        "source_extra_pair_distance_conditions": [],
        "non_obtuse_dot_products": {
            key: fraction_json(value) for key, value in dots.items()
        },
    }


def caps_certificate(
    points: Mapping[str, Point], order: Sequence[str], triple: Sequence[str]
) -> tuple[dict[str, Any], tuple[frozenset[str], ...]]:
    caps = cap_sets(points, triple)
    cap_names = ("C1", "C2", "C3")
    frames = (
        (triple[0], triple[1], triple[2]),
        (triple[1], triple[2], triple[0]),
        (triple[2], triple[0], triple[1]),
    )
    truth = {
        cap_name: {
            role: on_arc_opposite(
                points[frame[0]], points[frame[1]], points[frame[2]], points[role]
            )
            for role in order
        }
        for cap_name, frame in zip(cap_names, frames, strict=True)
    }
    counts = {role: sum(role in cap for cap in caps) for role in order}
    moser = frozenset(triple)
    if any(counts[role] != (2 if role in moser else 1) for role in order):
        raise ValueError("CapTriple membership counts fail")
    endpoint_pattern = {
        "v1": {"C1": False, "C2": True, "C3": True},
        "v2": {"C1": True, "C2": False, "C3": True},
        "v3": {"C1": True, "C2": True, "C3": False},
    }
    for vertex_name, role in zip(("v1", "v2", "v3"), triple, strict=True):
        actual = {
            cap_name: role in cap for cap_name, cap in zip(cap_names, caps, strict=True)
        }
        if actual != endpoint_pattern[vertex_name]:
            raise ValueError("CapTriple endpoint pattern fails")
    members = {
        cap_name: sorted(cap) for cap_name, cap in zip(cap_names, caps, strict=True)
    }
    for cap_name in cap_names:
        if {role for role, accepted in truth[cap_name].items() if accepted} != set(
            members[cap_name]
        ):
            raise ValueError("OnArcOpposite truth table does not define the stated cap")
    return (
        {
            "frames": {
                cap_name: {
                    "apex": frame[0],
                    "endpoint1": frame[1],
                    "endpoint2": frame[2],
                }
                for cap_name, frame in zip(cap_names, frames, strict=True)
            },
            "on_arc_opposite_truth_table": truth,
            "members": members,
            "cardinalities": {
                cap_name: len(cap)
                for cap_name, cap in zip(cap_names, caps, strict=True)
            },
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
            "surplus_cardinality_strictly_greater_than_four": len(caps[0]) > 4,
        },
        caps,
    )


def rows_certificate(
    points: Mapping[str, Point], branch: str, j: frozenset[str]
) -> dict[str, Any]:
    physical = frozenset({"u", "xu", "delta", "v", "xv"})
    if branch == "S0-I":
        ku = frozenset({"u", "xu", "q1", "q2"})
        kv = frozenset({"v", "xv", "r1", "r2"})
    else:
        ku = frozenset({"u", "xu", "qu1", "qu2"})
        kv = frozenset({"v", "xv", "qv1", "qv2"})
    physical_radius2 = F(1)
    ku_radius2 = dist2(points["cu"], points["u"])
    kv_radius2 = dist2(points["cv"], points["v"])
    fibers = {
        "physical": complete_fiber(points, "O", physical_radius2),
        "Ku": complete_fiber(points, "cu", ku_radius2),
        "Kv": complete_fiber(points, "cv", kv_radius2),
    }
    if fibers != {"physical": physical, "Ku": ku, "Kv": kv}:
        raise ValueError(
            "a selected radius fiber is incomplete or has an extra carrier role"
        )
    trace_u = ku & physical
    trace_v = kv & physical
    singleton = physical - trace_u - trace_v
    if (trace_u, trace_v, singleton) != (
        frozenset({"u", "xu"}),
        frozenset({"v", "xv"}),
        frozenset({"delta"}),
    ):
        raise ValueError("the physical residue is not the disjoint 2+2+1 trace")
    post_u_max, post_u = deletion_profile(points, "cu", "u")
    post_v_max, post_v = deletion_profile(points, "cv", "v")
    if post_u_max > 3 or post_v_max > 3:
        raise ValueError("a four-point positive-radius class survives deletion")
    other_checks = {
        "other_ne_source": points["v"] != points["u"],
        "other_mem_physical_class": "v" in physical,
        "other_mem_J": "v" in j,
        "other_not_mem_source_row": "v" not in ku,
        "source_other_centers_distinct": points["cu"] != points["cv"],
    }
    if not all(other_checks.values()):
        raise ValueError("other := v fails a checked later-layer admissibility field")
    if points["cu"] in (points[role] for role in physical):
        raise ValueError("cu lies in the physical selected class")

    return {
        "physical_selected_class": {
            "center_role": "O",
            "rho": "1/1",
            "rho_squared": "1/1",
            "roles": sorted(physical),
            "cardinality": len(physical),
            "complete_ambient_fiber": sorted(fibers["physical"]),
        },
        "Ku": {
            "center_role": "cu",
            "source_role": "u",
            "radius_squared": fraction_json(ku_radius2),
            "roles": sorted(ku),
            "complete_ambient_fiber": sorted(fibers["Ku"]),
        },
        "Kv": {
            "center_role": "cv",
            "source_role": "v",
            "radius_squared": fraction_json(kv_radius2),
            "roles": sorted(kv),
            "complete_ambient_fiber": sorted(fibers["Kv"]),
        },
        "physical_traces": {
            "Ku_inter_physical": sorted(trace_u),
            "Kv_inter_physical": sorted(trace_v),
            "singleton_residue": sorted(singleton),
            "disjoint_2_plus_2_plus_1": True,
        },
        "omissions": {
            "v_not_in_Ku": "v" not in ku,
            "u_not_in_Kv": "u" not in kv,
            "delta_not_in_Ku": "delta" not in ku,
            "delta_not_in_Kv": "delta" not in kv,
        },
        "source": {
            "role": "u",
            "u_equals_source": True,
            "source_in_Ku": "u" in ku,
            "source_in_J": "u" in j,
        },
        "other_assignment_for_later_layers": {
            "role": "v",
            "checks": other_checks,
            "checked_compatibility_only_not_an_L2_claim": True,
        },
        "centers": {
            "cu": point_json(points["cu"]),
            "cv": point_json(points["cv"]),
            "cu_outside_physical_class": points["cu"]
            not in (points[role] for role in physical),
            "cu_ne_cv": points["cu"] != points["cv"],
        },
        "deletion_multiplicity": {
            "delete_u_at_cu": {
                "maximum_positive_radius_multiplicity": post_u_max,
                "radius_classes": post_u,
            },
            "delete_v_at_cv": {
                "maximum_positive_radius_multiplicity": post_v_max,
                "radius_classes": post_v,
            },
        },
    }


def branch_spec(branch: str) -> tuple[tuple[str, ...], tuple[str, str, str]]:
    if branch == "S0-I":
        return (
            (
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
            ("delta", "xv", "O"),
        )
    return (
        ("O", "qu2", "qu1", "qv2", "delta", "v", "u", "cv", "cu", "xv", "xu", "qv1"),
        ("xu", "delta", "O"),
    )


def build_branch(branch: str) -> dict[str, Any]:
    points = build_branch_points(branch)
    order, triple = branch_spec(branch)
    if set(order) != set(points) or len(order) != len(points):
        raise ValueError("cyclic order is not an exact carrier enumeration")
    caps_report, caps = caps_certificate(points, order, triple)
    if caps_report["surplus_idx"] != 0 or len(caps[0]) <= 4:
        raise ValueError("surplusIdx=0 is not a surplus cap")
    opp_index2 = 2
    if triple[opp_index2] != "O":
        raise ValueError("physical O is not oppApex2")
    endpoint_indices = ((1, 2), (2, 0), (0, 1))
    endpoint_pair = tuple(triple[index] for index in endpoint_indices[opp_index2])
    j = caps[opp_index2] - frozenset(endpoint_pair)
    branch_holds = "xu" in j if branch == "S0-I" else "xu" not in j
    if not branch_holds or "u" not in j:
        raise ValueError("the requested S0 branch or source membership fails")
    triangle_by_index = tuple(triple[(opp_index2 + offset) % 3] for offset in range(3))
    cap_frame = (triangle_by_index[1], triangle_by_index[2], triangle_by_index[0])

    return {
        "branch_condition": "xu in J" if branch == "S0-I" else "xu not in J",
        "raw_formula": raw_formula(branch),
        "role_count": len(points),
        "cyclic_order": list(order),
        "points": {role: point_json(points[role]) for role in order},
        "role_distinctness": distinctness_certificate(points, order),
        "strict_convexity": convexity_certificate(points, order),
        "mec": mec_certificate(points, order, triple),
        "moser": moser_certificate(points, triple),
        "caps": caps_report,
        "packet": {
            "surplus_idx": 0,
            "opp_index2": opp_index2,
            "oppApex2": "O",
            "physical_O_equals_oppApex2": True,
            "triangle_by_opp_index2": list(triangle_by_index),
            "cap_frame_by_opp_index2": list(cap_frame),
            "cap_endpoints": list(endpoint_pair),
            "J": sorted(j),
            "J_is_C3_with_endpoints_erased": True,
            "u_in_J": "u" in j,
            "v_in_J": "v" in j,
            "xu_in_J": "xu" in j,
        },
        "rows": rows_certificate(points, branch, j),
    }


def build_report() -> dict[str, Any]:
    return {
        "schema": SCHEMA,
        "status": STATUS,
        "solver_invoked": False,
        "arithmetic": "fractions.Fraction only",
        "source_anchors": SOURCE_ANCHORS,
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
                "supplied_order": [
                    "3281/18769",
                    "15488/18769",
                    "15488/18769",
                ],
                "exact_replay_order": [
                    "15488/18769",
                    "15488/18769",
                    "3281/18769",
                ],
                "assessment": (
                    "the multiset agrees, but the supplied order does not follow the "
                    "source v1/v2/v3 dot-product order"
                ),
            }
        ],
        "branches": {branch: build_branch(branch) for branch in ("S0-I", "S0-N")},
    }


def write_json(path: Path, value: Mapping[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(
        json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path)
    parser.add_argument("--report-output", type=Path)
    args = parser.parse_args()
    report = build_report()
    if args.output is None and args.report_output is None:
        print(json.dumps(report, indent=2, sort_keys=True))
        return
    for output in (args.output, args.report_output):
        if output is not None:
            write_json(output, report)


if __name__ == "__main__":
    main()
