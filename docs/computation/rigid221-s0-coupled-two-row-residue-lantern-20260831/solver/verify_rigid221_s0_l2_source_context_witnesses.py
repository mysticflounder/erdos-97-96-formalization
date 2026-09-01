# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Independent Fraction verifier for the two finite S0 L2 extensions.

Neither the L1 nor L2 producer is imported.  Both carriers are reconstructed
from the stated rational ``P`` and ``Rot`` formulas, and every retained JSON
field is recomputed.  The accepted claim is only the displayed finite L2
source-context geometric core; all Lean-bound and global interfaces remain
explicitly false.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections.abc import Mapping, Sequence
from fractions import Fraction
from itertools import combinations
from pathlib import Path
from typing import Any

F = Fraction
Point = tuple[F, F]

SCHEMA = "rigid221-s0-l2-source-context-geometric-witnesses/v1"
INPUT_STATUS = "SAT_EXACT_L2_SOURCE_CONTEXT_GEOMETRIC_CORE"
VERIFIED_STATUS = "VERIFIED_SAT_EXACT_L2_SOURCE_CONTEXT_GEOMETRIC_CORE"
BRANCHES = ("S0-I", "S0-N")
MEC_CENTER = (F(137, 210), F(0))
MEC_RADIUS = F(137, 210)
MEC_RADIUS2 = MEC_RADIUS**2
PHYSICAL = frozenset({"u", "xu", "delta", "v", "xv"})
FIRST_CLASS = frozenset({"O", "fp", "fq", "fw"})
L1_SOURCE_REPO_PATH = (
    "docs/computation/rigid221-s0-coupled-two-row-residue-lantern-20260831/"
    "solver/rigid221_s0_true_cap_witnesses.py"
)

SOURCE_ANCHORS = {
    "source_context": (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/JointDeletion/Types.lean:75"
    ),
    "outside_first_apex_fiber": (
        "lean/Erdos9796Proof/P97/ATail/ExactFourPhysicalConsumer.lean:79"
    ),
    "actual_blocker_fiber": "lean/Erdos9796Proof/P97/ATail/SurvivalCover.lean:40",
    "original_unique_four_residual": (
        "lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/"
        "UniqueArmRouteAudit/OriginalUniqueResidualDispatch.lean:43"
    ),
    "global_deletion": (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean:52"
    ),
    "cap_interior_by_index": "lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:496",
    "opp_index1": "lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:543",
    "opp_index2": "lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:550",
    "opp_apex2": "lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:305",
}

SPECS: dict[str, dict[str, Any]] = {
    "S0-I": {
        "order": (
            "O",
            "fq",
            "fw",
            "fp",
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
        "triple": ("delta", "xv", "O"),
        "first_center": "xv",
        "l2_parameters": {"fq": F(1, 1000), "fw": F(1, 500), "fp": F(3, 1000)},
        "Ku": frozenset({"u", "xu", "q1", "q2"}),
        "Kv": frozenset({"v", "xv", "r1", "r2"}),
        "cap_cards": {"C1": 5, "C2": 7, "C3": 7},
        "J1": frozenset({"fp", "fq", "fw", "r1", "r2"}),
        "J2": frozenset({"cu", "cv", "u", "v", "xu"}),
    },
    "S0-N": {
        "order": (
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
            "fq",
            "fw",
            "fp",
        ),
        "triple": ("xu", "delta", "O"),
        "first_center": "delta",
        "l2_parameters": {"fq": F(-3, 1000), "fw": F(-1, 500), "fp": F(-1, 1000)},
        "Ku": frozenset({"u", "xu", "qu1", "qu2"}),
        "Kv": frozenset({"v", "xv", "qv1", "qv2"}),
        "cap_cards": {"C1": 5, "C2": 6, "C3": 7},
        "J1": frozenset({"fp", "fq", "fw", "qv1"}),
        "J2": frozenset({"cu", "cv", "u", "v", "xv"}),
    },
}


class VerificationError(ValueError):
    """The document is malformed or its exact geometric replay fails."""


def require(condition: bool, message: str) -> None:
    if not condition:
        raise VerificationError(message)


def require_mapping(value: object, message: str) -> Mapping[str, Any]:
    require(isinstance(value, dict), message)
    return value


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
    require(fraction_json(parsed) == value, "fraction is not canonical")
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
    return add(
        center,
        (
            cosine * relative[0] - sine * relative[1],
            sine * relative[0] + cosine * relative[1],
        ),
    )


def on_arc_opposite(apex: Point, left: Point, right: Point, point: Point) -> bool:
    return orient(point, left, right) * orient(apex, left, right) <= 0


def l1_raw_formula(branch: str) -> dict[str, Any]:
    common: dict[str, Any] = {
        "P": "((1-t^2)/(1+t^2), 2*t/(1+t^2))",
        "Rot": "c + A*(p-c) + B*J(p-c)",
        "A": "(1-t^2)/(1+t^2)",
        "B": "2*t/(1+t^2)",
        "J": "J(x,y)=(-y,x)",
        "common_P_parameters": {"delta": "-4/11", "v": "-10/29", "u": "-6/19"},
        "O": ["0/1", "0/1"],
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


def l1_points(branch: str) -> dict[str, Point]:
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
        points.update({"xv": p(F(6, 19)), "xu": p(F(4, 11))})
        points["cu"] = scale(F(157, 300), add(points["u"], points["xu"]))
        points["cv"] = scale(F(31, 60), add(points["v"], points["xv"]))
        points["qu1"] = rotate(points["cu"], points["u"], F(-3, 10))
        points["qu2"] = rotate(points["cu"], points["u"], F(-2, 5))
        points["qv1"] = rotate(points["cv"], points["v"], F(-31, 20))
        points["qv2"] = rotate(points["cv"], points["v"], F(-1, 9))
    return points


def formula_points(branch: str) -> dict[str, Point]:
    points = l1_points(branch)
    spec = SPECS[branch]
    center = points[spec["first_center"]]
    for role, parameter in spec["l2_parameters"].items():
        points[role] = rotate(center, points["O"], parameter)
    require(set(points) == set(spec["order"]), f"{branch} formula role mismatch")
    return points


def complete_fiber(
    points: Mapping[str, Point],
    center: str,
    radius2: F,
    deleted: frozenset[str] = frozenset(),
) -> frozenset[str]:
    return frozenset(
        role
        for role, point in points.items()
        if role not in deleted and dist2(points[center], point) == radius2
    )


def radial_profile(
    points: Mapping[str, Point], center: str, deleted: frozenset[str] = frozenset()
) -> tuple[int, list[dict[str, Any]]]:
    classes: dict[F, list[str]] = {}
    for role, point in points.items():
        if role in deleted:
            continue
        radius2 = dist2(points[center], point)
        if radius2 > 0:
            classes.setdefault(radius2, []).append(role)
    entries = [
        {
            "radius_squared": fraction_json(radius2),
            "roles": sorted(roles),
            "multiplicity": len(roles),
        }
        for radius2, roles in sorted(classes.items())
    ]
    return max((entry["multiplicity"] for entry in entries), default=0), entries


def blocker_centers(points: Mapping[str, Point], branch: str) -> dict[str, str]:
    first_center = SPECS[branch]["first_center"]
    result: dict[str, str] = {}
    for source in points:
        if source in FIRST_CLASS:
            center = first_center
        elif source == "u":
            center = "cu"
        elif source in {"v", "cu"}:
            center = "cv"
        else:
            center = "cu"
        require(
            center in points and center != source,
            "blocker center is not in carrier erase",
        )
        result[source] = center
    return result


def distinctness_certificate(
    points: Mapping[str, Point], order: Sequence[str]
) -> dict[str, Any]:
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
            if other in {first, second}:
                continue
            value = orient(points[first], points[second], points[other])
            require(value > 0, f"non-strict hull edge {edge} at {other}")
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


def barycentric_weights(center: Point, vertices: Sequence[Point]) -> list[F]:
    first, second, third = vertices
    denominator = orient(first, second, third)
    require(denominator != 0, "MEC boundary triple collinear")
    weights = [
        orient(center, second, third) / denominator,
        orient(first, center, third) / denominator,
        orient(first, second, center) / denominator,
    ]
    require(
        sum(weights, F(0)) == 1 and all(value > 0 for value in weights),
        "bad MEC weights",
    )
    reconstruction = (
        sum((weight * vertex[0] for weight, vertex in zip(weights, vertices)), F(0)),
        sum((weight * vertex[1] for weight, vertex in zip(weights, vertices)), F(0)),
    )
    require(reconstruction == center, "MEC weights do not reconstruct center")
    return weights


def mec_certificate(
    points: Mapping[str, Point], order: Sequence[str], triple: Sequence[str]
) -> dict[str, Any]:
    slacks = {role: MEC_RADIUS2 - dist2(MEC_CENTER, points[role]) for role in order}
    require(all(value >= 0 for value in slacks.values()), "MEC misses carrier role")
    boundary = frozenset(role for role, value in slacks.items() if value == 0)
    require(boundary == frozenset(triple), "MEC boundary mismatch")
    weights = barycentric_weights(MEC_CENTER, [points[role] for role in triple])
    return {
        "center": point_json(MEC_CENTER),
        "radius": fraction_json(MEC_RADIUS),
        "radius_squared": fraction_json(MEC_RADIUS2),
        "all_carrier_points_enclosed": True,
        "enclosure_slacks": {
            role: fraction_json(value) for role, value in slacks.items()
        },
        "boundary_roles": sorted(boundary),
        "boundary_exactly_stated_triple": True,
        "strict_interior_roles": sorted(set(points) - boundary),
        "minimality_witness": {
            "positive_weights": {
                role: fraction_json(weight) for role, weight in zip(triple, weights)
            },
            "weight_sum": "1/1",
            "weighted_boundary_barycenter": point_json(MEC_CENTER),
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
    require(all(value > 0 for value in pair_distances.values()), "Moser roles collide")
    require(all(value >= 0 for value in dots.values()), "Moser triangle is obtuse")
    require(
        all(dist2(points[role], MEC_CENTER) == MEC_RADIUS2 for role in triple),
        "Moser boundary",
    )
    return {
        "vertices": {"v1": v1, "v2": v2, "v3": v3},
        "pairwise_distinct": True,
        "pairwise_squared_distances": {
            key: fraction_json(value) for key, value in pair_distances.items()
        },
        "non_obtuse_dot_products": {
            key: fraction_json(value) for key, value in dots.items()
        },
    }


def caps_certificate(
    points: Mapping[str, Point],
    order: Sequence[str],
    triple: Sequence[str],
    branch: str,
) -> tuple[dict[str, Any], tuple[frozenset[str], ...], frozenset[str], frozenset[str]]:
    frames = (
        (triple[0], triple[1], triple[2]),
        (triple[1], triple[2], triple[0]),
        (triple[2], triple[0], triple[1]),
    )
    caps = tuple(
        frozenset(
            role
            for role in order
            if on_arc_opposite(
                points[frame[0]], points[frame[1]], points[frame[2]], points[role]
            )
        )
        for frame in frames
    )
    endpoint_indices = ((1, 2), (2, 0), (0, 1))
    interiors = tuple(
        cap - frozenset(triple[index] for index in endpoint_indices[cap_index])
        for cap_index, cap in enumerate(caps)
    )
    names = ("C1", "C2", "C3")
    counts = {role: sum(role in cap for cap in caps) for role in order}
    moser = frozenset(triple)
    require(
        all(counts[role] == (2 if role in moser else 1) for role in order),
        "CapTriple membership multiplicity failure",
    )
    cards = {name: len(cap) for name, cap in zip(names, caps)}
    spec = SPECS[branch]
    require(cards == spec["cap_cards"], "cap-card mismatch")
    require(interiors[1] == spec["J1"] and interiors[2] == spec["J2"], "J mismatch")
    truth = {
        name: {
            role: on_arc_opposite(
                points[frame[0]], points[frame[1]], points[frame[2]], points[role]
            )
            for role in order
        }
        for name, frame in zip(names, frames)
    }
    expected_endpoint_pattern = {
        "v1": {"C1": False, "C2": True, "C3": True},
        "v2": {"C1": True, "C2": False, "C3": True},
        "v3": {"C1": True, "C2": True, "C3": False},
    }
    endpoint_pattern = {
        vertex_name: {
            cap_name: role in caps[index] for index, cap_name in enumerate(names)
        }
        for vertex_name, role in zip(("v1", "v2", "v3"), triple)
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
            "on_arc_opposite_truth_table": truth,
            "members": {name: sorted(cap) for name, cap in zip(names, caps)},
            "cardinalities": cards,
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
            "J1": sorted(interiors[1]),
            "J2": sorted(interiors[2]),
        },
        caps,
        interiors[1],
        interiors[2],
    )


def rows_certificate(
    points: Mapping[str, Point], branch: str, j2: frozenset[str]
) -> dict[str, Any]:
    spec = SPECS[branch]
    ku = spec["Ku"]
    kv = spec["Kv"]
    ku_radius2 = dist2(points["cu"], points["u"])
    kv_radius2 = dist2(points["cv"], points["v"])
    physical_fiber = complete_fiber(points, "O", F(1))
    actual_ku = complete_fiber(points, "cu", ku_radius2)
    actual_kv = complete_fiber(points, "cv", kv_radius2)
    require(
        (physical_fiber, actual_ku, actual_kv) == (PHYSICAL, ku, kv),
        "row fiber mismatch",
    )
    trace_u = ku & PHYSICAL
    trace_v = kv & PHYSICAL
    singleton = PHYSICAL - trace_u - trace_v
    require(
        (trace_u, trace_v, singleton)
        == (frozenset({"u", "xu"}), frozenset({"v", "xv"}), frozenset({"delta"})),
        "2+2+1 trace mismatch",
    )
    post_u_max, post_u = radial_profile(points, "cu", frozenset({"u"}))
    post_v_max, post_v = radial_profile(points, "cv", frozenset({"v"}))
    require(post_u_max <= 3 and post_v_max <= 3, "singleton blocking failure")
    modeled_deleted = frozenset({"u"})
    modeled_restored_deleted = modeled_deleted - frozenset({"u"})
    modeled_global_deletion = {
        "modeled_rigid_2_plus_2_plus_1": (
            len(trace_u) == 2
            and len(trace_v) == 2
            and trace_u.isdisjoint(trace_v)
            and PHYSICAL == singleton | trace_u | trace_v
        ),
        "modeled_center_role": "cu",
        "modeled_deleted_roles": sorted(modeled_deleted),
        "modeled_center_in_carrier_outside_physical_class": (
            "cu" in points and "cu" not in PHYSICAL
        ),
        "modeled_deleted_nonempty": bool(modeled_deleted),
        "modeled_deleted_subset_physical_class": modeled_deleted <= PHYSICAL,
        "modeled_deleted_cardinality": len(modeled_deleted),
        "modeled_deleted_cardinality_le_five": len(modeled_deleted) <= 5,
        "modeled_blocked_after_delete_u": post_u_max <= 3,
        "modeled_restored_deleted_roles": sorted(modeled_restored_deleted),
        "modeled_restores_four_class_at_cu": len(
            complete_fiber(points, "cu", ku_radius2, modeled_restored_deleted)
        )
        >= 4,
    }
    require(
        all(
            value
            for key, value in modeled_global_deletion.items()
            if key.startswith("modeled_") and isinstance(value, bool)
        ),
        "modeled global-deletion finite-set predicate failure",
    )
    return {
        "physical_selected_class": {
            "center_role": "O",
            "radius_squared": "1/1",
            "roles": sorted(PHYSICAL),
            "cardinality": 5,
            "complete_ambient_fiber": sorted(physical_fiber),
        },
        "Ku": {
            "center_role": "cu",
            "source_role": "u",
            "radius_squared": fraction_json(ku_radius2),
            "roles": sorted(ku),
            "complete_ambient_fiber": sorted(actual_ku),
            "critical_four_shell_finite_fields": {
                "radius_positive": ku_radius2 > 0,
                "center_in_carrier_erase_source": "cu" in points
                and points["cu"] != points["u"],
                "support_card_four": len(ku) == 4,
                "source_mem_support": "u" in ku,
            },
        },
        "Kv": {
            "center_role": "cv",
            "source_role": "v",
            "radius_squared": fraction_json(kv_radius2),
            "roles": sorted(kv),
            "complete_ambient_fiber": sorted(actual_kv),
            "critical_four_shell_finite_fields": {
                "radius_positive": kv_radius2 > 0,
                "center_in_carrier_erase_source": "cv" in points
                and points["cv"] != points["v"],
                "support_card_four": len(kv) == 4,
                "source_mem_support": "v" in kv,
            },
        },
        "physical_traces": {
            "Ku_inter_physical": sorted(trace_u),
            "Kv_inter_physical": sorted(trace_v),
            "singleton_residue": sorted(singleton),
            "disjoint_2_plus_2_plus_1": trace_u.isdisjoint(trace_v),
        },
        "omissions": {
            "v_not_in_Ku": "v" not in ku,
            "u_not_in_Kv": "u" not in kv,
            "delta_not_in_Ku": "delta" not in ku,
            "delta_not_in_Kv": "delta" not in kv,
        },
        "centers": {
            "cu": point_json(points["cu"]),
            "cv": point_json(points["cv"]),
            "cu_in_carrier_outside_physical_class": "cu" in points
            and "cu" not in PHYSICAL,
            "cu_ne_O": points["cu"] != points["O"],
            "cu_ne_cv": points["cu"] != points["cv"],
        },
        "singleton_blocking": {
            "delete_u_at_cu": {
                "maximum_positive_radius_multiplicity": post_u_max,
                "no_modeled_four_class": post_u_max <= 3,
                "radius_classes": post_u,
            },
            "delete_v_at_cv": {
                "maximum_positive_radius_multiplicity": post_v_max,
                "no_modeled_four_class": post_v_max <= 3,
                "radius_classes": post_v,
            },
        },
        "global_deletion_modeled_finite_set_predicates": {
            **modeled_global_deletion,
            "actual_Lean_global_deletion_fields_instantiated": {
                "rigid": False,
                "center": False,
                "deleted": False,
                "center_mem_remaining": False,
                "deleted_nonempty": False,
                "deleted_subset_class": False,
                "deleted_card_le_five": False,
                "blocked": False,
                "restores": False,
                "geometry": False,
            },
            "theorem_level_MinimalDeletionCore_instantiated": False,
        },
        "source_in_J2": "u" in j2,
    }


def first_apex_certificate(
    points: Mapping[str, Point],
    branch: str,
    caps: tuple[frozenset[str], ...],
    j1: frozenset[str],
) -> dict[str, Any]:
    spec = SPECS[branch]
    center = spec["first_center"]
    fiber = complete_fiber(points, center, F(1))
    require(fiber == FIRST_CLASS, "first-apex fiber mismatch")
    full_max, full_profile = radial_profile(points, center)
    large_classes = [entry for entry in full_profile if entry["multiplicity"] >= 4]
    require(
        large_classes
        == [{"radius_squared": "1/1", "roles": sorted(FIRST_CLASS), "multiplicity": 4}],
        "first-apex uniqueness failure",
    )
    deletion_checks: dict[str, Any] = {}
    for deleted in sorted(FIRST_CLASS):
        maximum, profile = radial_profile(points, center, frozenset({deleted}))
        require(maximum <= 3, "first-apex deletion leaves a four-class")
        deletion_checks[deleted] = {
            "maximum_positive_radius_multiplicity": maximum,
            "no_modeled_four_class": maximum <= 3,
            "radius_classes": profile,
        }
    localization: dict[str, Any] = {}
    for role in spec["order"]:
        q_distance2 = dist2(points[role], points["fq"])
        w_distance2 = dist2(points[role], points["fw"])
        antecedent = role != center and q_distance2 == w_distance2
        conclusion = role in j1
        localization[role] = {
            "dist2_to_fq": fraction_json(q_distance2),
            "dist2_to_fw": fraction_json(w_distance2),
            "center_ne_oppApex1_and_equidistant": antecedent,
            "in_J1": conclusion,
            "implication_holds": (not antecedent) or conclusion,
        }
    require(
        all(row["implication_holds"] for row in localization.values()), "localization"
    )
    physical_after = {
        deleted: complete_fiber(points, "O", F(1), frozenset({deleted}))
        for deleted in ("fq", "fw")
    }
    require(
        all(value == PHYSICAL for value in physical_after.values()), "physical deletion"
    )
    centers = blocker_centers(points, branch)
    blocker_fiber = frozenset(
        role for role, assigned in centers.items() if assigned == centers["fq"]
    )
    require(blocker_fiber == FIRST_CLASS, "actual blocker fiber mismatch")
    return {
        "oppApex1": center,
        "radius_squared": "1/1",
        "roles": sorted(FIRST_CLASS),
        "complete_ambient_fiber": sorted(fiber),
        "only_modeled_positive_radius_class_with_multiplicity_at_least_four": True,
        "maximum_positive_radius_multiplicity": full_max,
        "positive_radius_classes": full_profile,
        "each_first_class_deletion_blocks": deletion_checks,
        "retained_pair": {
            "q": "fq",
            "w": "fw",
            "extra_first_class_point": "fp",
            "fq_ne_fw": points["fq"] != points["fw"],
            "fq_in_first_class": "fq" in fiber,
            "fw_in_first_class": "fw" in fiber,
            "fq_in_strict_first_cap_J1": "fq" in j1,
            "fw_in_strict_first_cap_J1": "fw" in j1,
            "fq_outside_surplus_C1": "fq" not in caps[0],
            "fw_outside_surplus_C1": "fw" not in caps[0],
        },
        "retained_pair_localization_over_every_modeled_carrier_role": {
            "quantified_roles": list(spec["order"]),
            "check_count": len(spec["order"]),
            "all_implications_hold": True,
            "checks": localization,
        },
        "retained_deletions_leave_physical_class": {
            deleted: sorted(value) for deleted, value in physical_after.items()
        },
        "modeled_first_apex_blocker_fiber": {
            "anchor": "fq",
            "actual_blocker_center_by_source": centers,
            "anchor_blocker_center": centers["fq"],
            "roles": sorted(blocker_fiber),
            "exactly_first_apex_selected_class": True,
            "every_assigned_center_in_carrier_erase_source": True,
            "selected_rows_at_non_u_non_v_sources_instantiated": False,
        },
        "original_unique_four_residual_finite_geometry": {
            "carrier_card_gt_nine": len(points) > 9,
            "class_card_eq_four": len(fiber) == 4,
            "unique_modeled_K4_radius": len(large_classes) == 1,
            "every_first_class_member_blocks_after_deletion": all(
                row["no_modeled_four_class"] for row in deletion_checks.values()
            ),
            "interior_q": "fq",
            "interior_w": "fw",
            "interior_q_mem": "fq" in fiber and "fq" in j1,
            "interior_w_mem": "fw" in fiber and "fw" in j1,
            "interior_q_ne_w": points["fq"] != points["fw"],
            "bisector_center_mem_interior_quantified_on_modeled_carrier": True,
        },
    }


def source_context_certificate(
    points: Mapping[str, Point], branch: str, j2: frozenset[str]
) -> dict[str, Any]:
    spec = SPECS[branch]
    ku = spec["Ku"]
    cross = ku & (PHYSICAL & j2)
    ku_radius2 = dist2(points["cu"], points["u"])
    survive_q = complete_fiber(points, "cu", ku_radius2, frozenset({"fq"}))
    survive_w = complete_fiber(points, "cu", ku_radius2, frozenset({"fw"}))
    centers = blocker_centers(points, branch)
    blocker_fiber = frozenset(
        role for role, assigned in centers.items() if assigned == centers["fq"]
    )
    checks = {
        "source_mem_class": "u" in PHYSICAL,
        "source_mem_interior": "u" in j2,
        "modeled_source_outside_first_apex_blocker_fiber_proxy": (
            "u" not in blocker_fiber
        ),
        "source_cross_card_le_two": len(cross) <= 2,
        "other_ne_source": points["v"] != points["u"],
        "other_mem_class": "v" in PHYSICAL,
        "other_mem_interior": "v" in j2,
        "other_not_mem_source_row": "v" not in ku,
        "source_other_blockers_ne": points["cu"] != points["cv"],
        "source_survives_q_or_w": len(survive_q) >= 4 or len(survive_w) >= 4,
        "source_mem_u_row": "u" in ku,
        "v_not_mem_source_row": "v" not in ku,
        "u_eq_source_or_not_mem_source_row": True,
    }
    require(all(checks.values()), "source-context finite geometry failure")
    return {
        "assignments": {
            "source": "u",
            "other": "v",
            "q": "fq",
            "w": "fw",
            "source_blocker": "cu",
            "other_blocker": "cv",
            "selected_S0_arm": "u = source",
        },
        "modeled_first_apex_blocker_fiber_roles": sorted(FIRST_CLASS),
        "modeled_first_apex_blocker_fiber_at_fq_roles": sorted(blocker_fiber),
        "source_outside_modeled_first_apex_blocker_fiber": "u" not in blocker_fiber,
        "source_cross": {
            "Ksource_inter_physical_inter_J2": sorted(cross),
            "cardinality": len(cross),
            "cardinality_le_two": len(cross) <= 2,
        },
        "retained_pair_omission_and_survival": {
            "fq_not_in_Ku": "fq" not in ku,
            "fw_not_in_Ku": "fw" not in ku,
            "survival_disjunction": "fq deletion or fw deletion",
            "delete_fq_complete_source_fiber": sorted(survive_q),
            "delete_fw_complete_source_fiber": sorted(survive_w),
            "source_survives_delete_fq": len(survive_q) >= 4,
            "source_survives_delete_fw": len(survive_w) >= 4,
        },
        "modeled_source_context_geometry_checks": checks,
        "modeled_geometry_check_count": len(checks),
        "Lean_source_context_field_count": 13,
        "Lean_source_context_fields_instantiated_count": 0,
        "all_finite_source_context_geometry_holds": True,
        "lean_subtype_and_system_fields_instantiated": False,
    }


def global_k4_census(
    points: Mapping[str, Point], order: Sequence[str]
) -> dict[str, Any]:
    maxima = {role: radial_profile(points, role)[0] for role in order}
    all_centers = all(value >= 4 for value in maxima.values())
    require(not all_centers, "modeled carrier unexpectedly has global K4")
    return {
        "maximum_positive_radius_multiplicity_by_modeled_center": maxima,
        "centers_with_a_modeled_four_class": sorted(
            role for role, value in maxima.items() if value >= 4
        ),
        "centers_without_a_modeled_four_class": sorted(
            role for role, value in maxima.items() if value < 4
        ),
        "global_K4_holds_on_modeled_carrier": False,
    }


def build_branch(branch: str, points: Mapping[str, Point]) -> dict[str, Any]:
    spec = SPECS[branch]
    order = spec["order"]
    triple = spec["triple"]
    require(
        set(points) == set(order) and len(set(points.values())) == len(order),
        "role mismatch",
    )
    caps_report, caps, j1, j2 = caps_certificate(points, order, triple, branch)
    first_apex = first_apex_certificate(points, branch, caps, j1)
    surplus_idx = caps_report["surplus_idx"]
    triangle_v3 = triple[2]
    computed_opp_index1 = 1 if surplus_idx == 0 else None
    computed_opp_index2 = 2 if surplus_idx == 0 else None
    computed_opp_apex2 = triangle_v3 if surplus_idx == 0 else None
    premises_hold = surplus_idx == 0 and triangle_v3 == "O"
    conclusion_holds = computed_opp_index2 == 2 and computed_opp_apex2 == "O"
    require(
        premises_hold and conclusion_holds, "conditional opposite-index/apex mapping"
    )
    return {
        "branch_condition": "xu in J2" if branch == "S0-I" else "xu not in J2",
        "input_and_extension_formulas": {
            "l1_formula": l1_raw_formula(branch),
            "l2_rotations": {
                role: {
                    "center": spec["first_center"],
                    "point": "O",
                    "t": fraction_json(parameter),
                }
                for role, parameter in spec["l2_parameters"].items()
            },
        },
        "role_count": len(points),
        "cyclic_order": list(order),
        "points": {role: point_json(points[role]) for role in order},
        "role_distinctness": distinctness_certificate(points, order),
        "strict_convexity": convexity_certificate(points, order),
        "mec": mec_certificate(points, order, triple),
        "moser": moser_certificate(points, triple),
        "caps": caps_report,
        "packet": {
            "surplus_idx": surplus_idx,
            "oppIndex1": computed_opp_index1,
            "oppIndex2": computed_opp_index2,
            "oppApex1": spec["first_center"],
            "oppApex2": computed_opp_apex2,
            "conditional_surplus_index_zero_mapping": {
                "statement": (
                    "surplusIdx=0 and triangle.v3=O imply oppIndex2=2 and oppApex2=O"
                ),
                "surplusIdx_eq_zero": surplus_idx == 0,
                "triangle_v3_role": triangle_v3,
                "triangle_v3_eq_O": triangle_v3 == "O",
                "computed_oppIndex1": computed_opp_index1,
                "computed_oppIndex2": computed_opp_index2,
                "computed_oppApex2": computed_opp_apex2,
                "premises_hold": premises_hold,
                "conclusion_holds": conclusion_holds,
            },
            "J1": sorted(j1),
            "J2": sorted(j2),
            "u_in_J2": "u" in j2,
            "v_in_J2": "v" in j2,
            "xu_in_J2": "xu" in j2,
        },
        "rows": rows_certificate(points, branch, j2),
        "first_apex": first_apex,
        "source_context": source_context_certificate(points, branch, j2),
        "global_K4_census": global_k4_census(points, order),
    }


def build_expected_document() -> dict[str, Any]:
    here = Path(__file__).resolve()
    repo_root = here.parents[4]
    l1_source = repo_root / L1_SOURCE_REPO_PATH
    return {
        "schema": SCHEMA,
        "status": INPUT_STATUS,
        "solver_invoked": False,
        "arithmetic": "fractions.Fraction only",
        "input_provenance": {
            "kind": "L1 formula source only",
            "path": L1_SOURCE_REPO_PATH,
            "sha256": hashlib.sha256(l1_source.read_bytes()).hexdigest(),
            "retained_L1_JSON_used": False,
        },
        "source_anchors": SOURCE_ANCHORS,
        "claim_scope": {
            "l1_cap_two_row_geometric_core": True,
            "l2_source_context_finite_geometry": True,
            "full_field_level_Lean_source_context": False,
            "CounterexampleData": False,
            "CriticalShellSystem": False,
            "OriginalUniqueFourResidual": False,
            "Minimal": False,
            "JointDeletion": False,
            "CommonDeletion": False,
            "robust_surface": False,
            "global_K4": False,
            "full_theorem": False,
            "lean_claim": False,
            "promotion_claim": False,
        },
        "first_unmodeled_next_interface": {
            "name": "Lean-bound source-indexed CriticalShellSystem ingress",
            "exact_requirement": (
                "construct CounterexampleData D and a total CriticalShellSystem D.A whose "
                "subtype-indexed centerAt/selectedAt rows realize the modeled cu/Ku and cv/Kv; "
                "then construct CriticalPairFrontier and OriginalUniqueFourResidual provenance "
                "so actualBlockerFiber anchored at interior_q=fq is definitionally available"
            ),
            "why_first": (
                "without that total subtype-indexed system, the finite blocker-fiber role set "
                "cannot instantiate source_mem_outside, even though every displayed geometric "
                "membership and survival predicate has been replayed"
            ),
        },
        "omission_ledger": {
            "globalDeletion.geometry": "not instantiated",
            "theorem_level_MinimalDeletionCore": "not instantiated",
            "jointDeletion_uPacket": "not instantiated",
            "jointDeletion_vPacket": "not instantiated",
            "ExactFourPostCardElevenRobustSurface": "not instantiated",
            "CounterexampleData.K4": "false on the modeled carrier and not instantiated globally",
        },
        "supplied_value_discrepancies": [],
        "branches": {
            branch: build_branch(branch, formula_points(branch)) for branch in BRANCHES
        },
    }


TOP_KEYS = {
    "schema",
    "status",
    "solver_invoked",
    "arithmetic",
    "input_provenance",
    "source_anchors",
    "claim_scope",
    "first_unmodeled_next_interface",
    "omission_ledger",
    "supplied_value_discrepancies",
    "branches",
}
BRANCH_KEYS = {
    "branch_condition",
    "input_and_extension_formulas",
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
    "first_apex",
    "source_context",
    "global_K4_census",
}


def verify_branch(branch: str, value: object) -> None:
    document = require_mapping(value, f"{branch} branch is not an object")
    require("status" not in document, f"{branch} status upgrade or mismatch")
    require(set(document) == BRANCH_KEYS, f"{branch} certificate fields mismatch")
    require(
        document.get("cyclic_order") == list(SPECS[branch]["order"]), "cyclic order"
    )
    expected_formulas = build_branch(branch, formula_points(branch))[
        "input_and_extension_formulas"
    ]
    require(
        document.get("input_and_extension_formulas") == expected_formulas,
        "raw formula mismatch",
    )
    raw_points = require_mapping(document.get("points"), f"{branch} points missing")
    require(
        set(raw_points) == set(SPECS[branch]["order"]), f"{branch} point roles mismatch"
    )
    parsed = {role: parse_point(raw_points[role]) for role in SPECS[branch]["order"]}
    require(
        parsed == formula_points(branch), f"{branch} coordinates do not match formulas"
    )
    replay = build_branch(branch, parsed)
    for key, label in (
        ("branch_condition", "branch condition"),
        ("role_count", "role count"),
        ("role_distinctness", "distinctness"),
        ("strict_convexity", "convexity"),
        ("mec", "MEC"),
        ("moser", "Moser"),
        ("caps", "caps/J"),
        ("packet", "packet"),
        ("rows", "rows/centers"),
        ("first_apex", "first-apex"),
        ("source_context", "source-context"),
        ("global_K4_census", "global-K4 census"),
    ):
        require(document.get(key) == replay[key], f"{branch} {label} mismatch")


def verify_document(value: object) -> dict[str, Any]:
    document = require_mapping(value, "witness document is not an object")
    require(set(document) == TOP_KEYS, "top-level certificate fields mismatch")
    require(document.get("schema") == SCHEMA, "schema mismatch")
    require(document.get("status") == INPUT_STATUS, "status upgrade or mismatch")
    require(document.get("solver_invoked") is False, "unexpected solver claim")
    require(
        document.get("arithmetic") == "fractions.Fraction only", "arithmetic mismatch"
    )
    expected = build_expected_document()
    for key, label in (
        ("input_provenance", "input provenance"),
        ("source_anchors", "source anchors"),
        ("claim_scope", "claim-scope upgrade or"),
        ("first_unmodeled_next_interface", "next-interface"),
        ("omission_ledger", "omission ledger"),
        ("supplied_value_discrepancies", "discrepancy ledger"),
    ):
        require(document.get(key) == expected[key], f"{label} mismatch")
    branches = require_mapping(document.get("branches"), "branches missing")
    require(set(branches) == set(BRANCHES), "S0 branches are not separate and complete")
    for branch in BRANCHES:
        verify_branch(branch, branches[branch])
    return {
        "status": VERIFIED_STATUS,
        "l2_source_context_geometric_core": True,
        "CounterexampleData": False,
        "CriticalShellSystem": False,
        "OriginalUniqueFourResidual": False,
        "Minimal": False,
        "JointDeletion": False,
        "CommonDeletion": False,
        "robust_surface": False,
        "global_K4": False,
        "full_theorem": False,
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
