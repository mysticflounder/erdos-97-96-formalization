# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Produce exact finite L3 field-packet geometry for the two rigid221 S0 cells.

The checked L2 JSON is treated as coordinate-formula input.  All geometry
after adding the delta-source row is recomputed with ``Fraction``.  The output
expands the finite predicates corresponding to the joint-deletion, robust-
surface, and singleton global-deletion structures, while keeping every actual
typed Lean/global-system construction explicitly out of scope.
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

import rigid221_s0_l2_source_context_witnesses as l2_input

F = Fraction
Point = tuple[F, F]

SCHEMA = "rigid221-s0-l3-field-level-geometric-packet/v1"
STATUS = "SAT_EXACT_L3_FIELD_LEVEL_GEOMETRIC_PACKET"
SOLVER_DIR = Path(__file__).resolve().parent
REPOSITORY = Path(__file__).resolve().parents[4]
L2_JSON = SOLVER_DIR / "s0-true-cap-wave2-l2-witnesses.json"
L2_JSON_REPO_PATH = (
    "docs/computation/rigid221-s0-coupled-two-row-residue-lantern-20260831/"
    "solver/s0-true-cap-wave2-l2-witnesses.json"
)

SOURCE_ANCHORS = {
    "joint_deletion": (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/JointDeletion/Types.lean:42"
    ),
    "common_deletion_two_center_packet": (
        "lean/Erdos9796Proof/P97/ATail/CommonDeletionTwoCenter.lean:30"
    ),
    "u5_q_deleted_k4_class": (
        "lean/Erdos9796Proof/P97/U5GlobalIncidenceBasic.lean:243"
    ),
    "robust_surface": (
        "lean/Erdos9796Proof/P97/ATail/ExactFourRobustCapExpansion.lean:280"
    ),
    "robust_ingress": (
        "lean/Erdos9796Proof/P97/ATail/ExactFourPhysicalConsumer.lean:421"
    ),
    "fully_deletion_robust": (
        "lean/Erdos9796Proof/P97/ATail/DeletionRobustness.lean:27"
    ),
    "radius_classification": (
        "lean/Erdos9796Proof/P97/ATail/ExactFourRobustCapExpansion.lean:123"
    ),
    "cap_growth": (
        "lean/Erdos9796Proof/P97/ATail/ExactFourRobustCapExpansion.lean:266"
    ),
    "global_deletion": (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean:52"
    ),
    "minimal_deletion_core": (
        "lean/Erdos9796Proof/P97/ATail/MinimalDeletionCore.lean:34"
    ),
    "critical_selected_four_class": (
        "lean/Erdos9796Proof/P97/U1CarrierInjection.lean:736"
    ),
    "global_card_minimal_blocking_subdeletion": (
        "lean/Erdos9796Proof/P97/ATail/GlobalMinimalDeletion.lean:190"
    ),
    "critical_shell_system_totality": (
        "lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1116"
    ),
    "coordinator_critical_shell_cover": (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Coordinator.lean:102"
    ),
    "cross_deletion_survival_bridge": (
        "lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean:781"
    ),
}

BRANCH_SPECS: dict[str, dict[str, Any]] = {
    "S0-I": {
        "order": (
            "O",
            "fq",
            "fw",
            "fp",
            "r1",
            "r2",
            "d3",
            "d2",
            "d1",
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
        "cdelta": "xu",
        "Ku": frozenset({"u", "xu", "q1", "q2"}),
        "Kv": frozenset({"v", "xv", "r1", "r2"}),
        "expected_card": 19,
        "expected_caps": {"C1": 5, "C2": 10, "C3": 7},
        "expected_cap_growth": "firstOpposite",
    },
    "S0-N": {
        "order": (
            "O",
            "qu2",
            "qu1",
            "qv2",
            "d3",
            "d2",
            "d1",
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
        "cdelta": "xv",
        "Ku": frozenset({"u", "xu", "qu1", "qu2"}),
        "Kv": frozenset({"v", "xv", "qv1", "qv2"}),
        "expected_card": 18,
        "expected_caps": {"C1": 8, "C2": 6, "C3": 7},
        "expected_cap_growth": "surplus",
    },
}

DELTA_PARAMETERS = {"d1": F(-1, 1000), "d2": F(-1, 500), "d3": F(-3, 1000)}
EXPECTED_DELTA_RADIUS2 = F(80656, 54389)


def add(first: Point, second: Point) -> Point:
    return first[0] + second[0], first[1] + second[1]


def sub(first: Point, second: Point) -> Point:
    return first[0] - second[0], first[1] - second[1]


def dot(first: Point, second: Point) -> F:
    return first[0] * second[0] + first[1] * second[1]


def dist2(first: Point, second: Point) -> F:
    difference = sub(first, second)
    return dot(difference, difference)


def orient(first: Point, second: Point, third: Point) -> F:
    return (second[0] - first[0]) * (third[1] - first[1]) - (second[1] - first[1]) * (
        third[0] - first[0]
    )


def rotate_rational(center: Point, point: Point, parameter: F) -> Point:
    denominator = 1 + parameter * parameter
    a = (1 - parameter * parameter) / denominator
    b = 2 * parameter / denominator
    x, y = sub(point, center)
    return add(center, (a * x - b * y, b * x + a * y))


def on_arc_opposite(vi: Point, vj: Point, vk: Point, point: Point) -> bool:
    return orient(point, vj, vk) * orient(vi, vj, vk) <= 0


def fraction_json(value: F) -> str:
    return f"{value.numerator}/{value.denominator}"


def point_json(point: Point) -> list[str]:
    return [fraction_json(point[0]), fraction_json(point[1])]


def parse_point(value: Sequence[str]) -> Point:
    return F(value[0]), F(value[1])


def load_l2_certificate() -> tuple[dict[str, Any], bytes]:
    raw = L2_JSON.read_bytes()
    report = json.loads(raw)
    if report.get("status") != l2_input.STATUS:
        raise ValueError(
            "the retained L2 input does not carry the required exact status"
        )
    expected = json.dumps(l2_input.build_report(), indent=2, sort_keys=True) + "\n"
    if raw != expected.encode():
        raise ValueError(
            "the retained L2 input is not the deterministic current certificate"
        )
    return report, raw


def build_branch_points(branch: str) -> dict[str, Point]:
    points = dict(l2_input.build_branch_points(branch))
    cdelta = BRANCH_SPECS[branch]["cdelta"]
    for role, parameter in DELTA_PARAMETERS.items():
        points[role] = rotate_rational(points[cdelta], points["delta"], parameter)
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


def convexity_certificate(
    points: Mapping[str, Point], order: Sequence[str]
) -> dict[str, Any]:
    values: list[tuple[F, str, str, str]] = []
    checks: dict[str, dict[str, str]] = {}
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
    center = (F(137, 210), F(0))
    radius2 = F(18769, 44100)
    slacks = {role: radius2 - dist2(center, points[role]) for role in order}
    boundary = frozenset(role for role, slack in slacks.items() if slack == 0)
    if any(slack < 0 for slack in slacks.values()) or boundary != frozenset(triple):
        raise ValueError("the exact MEC packet fails after the L3 extension")
    weights = {triple[0]: radius2, triple[1]: radius2, triple[2]: 1 - 2 * radius2}
    barycenter = (
        sum((weights[role] * points[role][0] for role in weights), start=F(0)),
        sum((weights[role] * points[role][1] for role in weights), start=F(0)),
    )
    if barycenter != center or any(weight <= 0 for weight in weights.values()):
        raise ValueError("MEC positive barycentric witness fails")
    return {
        "center": point_json(center),
        "radius_squared": fraction_json(radius2),
        "all_carrier_points_enclosed": True,
        "enclosure_slacks": {
            role: fraction_json(slack) for role, slack in slacks.items()
        },
        "boundary_roles": sorted(boundary),
        "boundary_exactly_stated_triple": True,
        "positive_boundary_weights": {
            role: fraction_json(weight) for role, weight in weights.items()
        },
        "weighted_boundary_barycenter": point_json(barycenter),
    }


def caps_certificate(
    points: Mapping[str, Point], order: Sequence[str], triple: Sequence[str]
) -> tuple[dict[str, Any], tuple[frozenset[str], ...], tuple[frozenset[str], ...]]:
    names = ("C1", "C2", "C3")
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
    counts = {role: sum(role in cap for cap in caps) for role in order}
    if any(counts[role] != (2 if role in triple else 1) for role in order):
        raise ValueError("CapTriple membership multiplicity fails")
    truth = {
        name: {
            role: on_arc_opposite(
                points[frame[0]], points[frame[1]], points[frame[2]], points[role]
            )
            for role in order
        }
        for name, frame in zip(names, frames, strict=True)
    }
    endpoint_pattern = {
        vertex_name: {name: truth[name][role] for name in names}
        for vertex_name, role in zip(("v1", "v2", "v3"), triple, strict=True)
    }
    expected_endpoint_pattern = {
        "v1": {"C1": False, "C2": True, "C3": True},
        "v2": {"C1": True, "C2": False, "C3": True},
        "v3": {"C1": True, "C2": True, "C3": False},
    }
    if endpoint_pattern != expected_endpoint_pattern:
        raise ValueError("CapTriple endpoint pattern fails")
    return (
        {
            "frames": {
                name: {
                    "apex": frame[0],
                    "endpoint1": frame[1],
                    "endpoint2": frame[2],
                }
                for name, frame in zip(names, frames, strict=True)
            },
            "on_arc_opposite_truth_table": truth,
            "members": {
                name: sorted(cap) for name, cap in zip(names, caps, strict=True)
            },
            "cardinalities": {
                name: len(cap) for name, cap in zip(names, caps, strict=True)
            },
            "membership_count_by_role": counts,
            "endpoint_pattern": endpoint_pattern,
            "J1": sorted(interiors[1]),
            "J2": sorted(interiors[2]),
        },
        caps,
        interiors,
    )


def modeled_blocker_centers(points: Mapping[str, Point], branch: str) -> dict[str, str]:
    first_center = l2_input.BRANCH_SPECS[branch]["first_center"]
    cdelta = BRANCH_SPECS[branch]["cdelta"]
    first_class = frozenset({"O", "fp", "fq", "fw"})
    assignments: dict[str, str] = {}
    for source in points:
        if source in first_class:
            blocker = first_center
        elif source == "u":
            blocker = "cu"
        elif source == "v":
            blocker = "cv"
        elif source == "delta":
            blocker = cdelta
        elif source == "cu":
            blocker = "cv"
        else:
            blocker = "cu"
        if blocker == source or blocker not in points:
            raise ValueError("modeled blocker center is not in carrier erase source")
        assignments[source] = blocker
    return assignments


def u5_row_certificate(
    points: Mapping[str, Point], q: str, center: str, support: frozenset[str]
) -> dict[str, Any]:
    if not support or q in support or center in support or not support <= points.keys():
        raise ValueError("modeled U5QDeletedK4Class subset/omission fields fail")
    radius2 = dist2(points[center], points[next(iter(sorted(support)))])
    equalities = {
        role: fraction_json(dist2(points[center], points[role]))
        for role in sorted(support)
    }
    if radius2 <= 0 or any(F(value) != radius2 for value in equalities.values()):
        raise ValueError("modeled U5QDeletedK4Class equal-radius fields fail")
    return {
        "modeled_support_roles": sorted(support),
        "modeled_subset_of_carrier_erase_q_erase_center": (
            support <= points.keys() and q not in support and center not in support
        ),
        "modeled_cardinality": len(support),
        "modeled_cardinality_ge_four": len(support) >= 4,
        "modeled_q_not_mem": q not in support,
        "modeled_radius_squared": fraction_json(radius2),
        "modeled_radius_squared_positive": radius2 > 0,
        "modeled_same_squared_radius": equalities,
        "actual_typed_U5QDeletedK4Class_instantiated": False,
    }


def critical_selected_four_certificate(
    points: Mapping[str, Point], source: str, center: str, support: frozenset[str]
) -> dict[str, Any]:
    radius2 = dist2(points[center], points[source])
    complete = complete_fiber(points, center, radius2)
    labels = sorted(support)
    pairwise_distinct = all(
        points[first] != points[second] for first, second in combinations(labels, 2)
    )
    checks = {
        "modeled_radius_squared_positive": radius2 > 0,
        "modeled_support_eq_complete_ambient_fiber": support == complete,
        "modeled_support_card_eq_four": len(support) == 4,
        "modeled_source_mem_support": source in support,
        "modeled_center_mem_carrier_erase_source": (
            center in points and points[center] != points[source]
        ),
        "modeled_four_labels_pairwise_distinct": pairwise_distinct,
        "modeled_support_eq_four_named_labels": frozenset(labels) == support,
    }
    if not all(checks.values()):
        raise ValueError("modeled CriticalSelectedFourClass geometry fails")
    return {
        "assignments": {
            "source": source,
            "center": center,
            "support": labels,
            "labels": labels,
        },
        "modeled_radius_squared": fraction_json(radius2),
        "modeled_field_checks": checks,
        "actual_typed_CriticalSelectedFourClass_instantiated": False,
    }


def common_packet_certificate(
    points: Mapping[str, Point],
    q: str,
    center1: str,
    center2: str,
    support1: frozenset[str],
    support2: frozenset[str],
    actual_blocker: str,
) -> dict[str, Any]:
    row1 = u5_row_certificate(points, q, center1, support1)
    row2 = u5_row_certificate(points, q, center2, support2)
    radius1 = F(row1["modeled_radius_squared"])
    radius2 = F(row2["modeled_radius_squared"])
    survives1 = len(complete_fiber(points, center1, radius1, frozenset({q}))) >= 4
    survives2 = len(complete_fiber(points, center2, radius2, frozenset({q}))) >= 4
    overlap = support1 & support2
    checks = {
        "modeled_q_mem_carrier": q in points,
        "modeled_center1_mem_carrier": center1 in points,
        "modeled_center2_mem_carrier": center2 in points,
        "modeled_centers_ne": points[center1] != points[center2],
        "modeled_survives1": survives1,
        "modeled_survives2": survives2,
        "modeled_actual_blocker_ne_center1": points[actual_blocker] != points[center1],
        "modeled_actual_blocker_ne_center2": points[actual_blocker] != points[center2],
        "modeled_B1_card_eq_four": len(support1) == 4,
        "modeled_B2_card_eq_four": len(support2) == 4,
        "modeled_overlap_card_le_two": len(overlap) <= 2,
    }
    if not all(checks.values()):
        raise ValueError("a modeled CommonDeletionTwoCenterPacket field fails")
    return {
        "assignments": {
            "q": q,
            "center1": center1,
            "center2": center2,
            "actual_blocker_of_q": actual_blocker,
            "B1": sorted(support1),
            "B2": sorted(support2),
        },
        "modeled_outer_field_checks": checks,
        "modeled_row1": row1,
        "modeled_row2": row2,
        "modeled_overlap_roles": sorted(overlap),
        "modeled_overlap_cardinality": len(overlap),
        "actual_typed_CommonDeletionTwoCenterPacket_instantiated": False,
    }


def finite_core_certificate(
    points: Mapping[str, Point], branch: str, j2: frozenset[str]
) -> dict[str, Any]:
    spec = BRANCH_SPECS[branch]
    ku: frozenset[str] = spec["Ku"]
    kv: frozenset[str] = spec["Kv"]
    physical = frozenset({"u", "xu", "delta", "v", "xv"})
    first_class = frozenset({"O", "fp", "fq", "fw"})
    kdelta = frozenset({"delta", "d1", "d2", "d3"})
    cdelta = spec["cdelta"]
    radii = {
        "physical": F(1),
        "Ku": dist2(points["cu"], points["u"]),
        "Kv": dist2(points["cv"], points["v"]),
        "first": F(1),
        "Kdelta": dist2(points[cdelta], points["delta"]),
    }
    fibers = {
        "physical": complete_fiber(points, "O", radii["physical"]),
        "Ku": complete_fiber(points, "cu", radii["Ku"]),
        "Kv": complete_fiber(points, "cv", radii["Kv"]),
        "first": complete_fiber(
            points, l2_input.BRANCH_SPECS[branch]["first_center"], radii["first"]
        ),
        "Kdelta": complete_fiber(points, cdelta, radii["Kdelta"]),
    }
    expected_fibers = {
        "physical": physical,
        "Ku": ku,
        "Kv": kv,
        "first": first_class,
        "Kdelta": kdelta,
    }
    if fibers != expected_fibers:
        raise ValueError("an exact L1/L2/delta selected fiber gained or lost a role")
    deletion_profiles: dict[str, Any] = {}
    for center, deleted in (("cu", "u"), ("cv", "v"), (cdelta, "delta")):
        maximum, profile = radial_profile(points, center, frozenset({deleted}))
        if maximum > 3:
            raise ValueError(f"critical deletion at {center}/{deleted} does not block")
        deletion_profiles[f"delete_{deleted}_at_{center}"] = {
            "maximum_positive_radius_multiplicity": maximum,
            "no_modeled_four_class": maximum <= 3,
            "radius_classes": profile,
        }
    cross = ku & (physical & j2)
    blocker_centers = modeled_blocker_centers(points, branch)
    blocker_fiber = frozenset(
        role
        for role, blocker in blocker_centers.items()
        if blocker == blocker_centers["fq"]
    )
    if blocker_fiber != first_class:
        raise ValueError("modeled first-apex blocker fiber changed at L3")
    source_checks = {
        "modeled_source_mem_physical_class": "u" in physical,
        "modeled_source_mem_J2": "u" in j2,
        "modeled_source_outside_first_apex_blocker_fiber_proxy": "u"
        not in blocker_fiber,
        "modeled_source_cross_card_le_two": len(cross) <= 2,
        "modeled_other_ne_source": points["v"] != points["u"],
        "modeled_other_mem_physical_class": "v" in physical,
        "modeled_other_mem_J2": "v" in j2,
        "modeled_other_not_mem_Ku": "v" not in ku,
        "modeled_source_other_blockers_ne": points["cu"] != points["cv"],
        "modeled_source_survives_fq_or_fw": (
            len(complete_fiber(points, "cu", radii["Ku"], frozenset({"fq"}))) >= 4
            or len(complete_fiber(points, "cu", radii["Ku"], frozenset({"fw"}))) >= 4
        ),
        "modeled_source_mem_Ku": "u" in ku,
        "modeled_v_not_mem_Ku": "v" not in ku,
        "modeled_u_eq_source_arm": True,
    }
    if not all(source_checks.values()):
        raise ValueError("an inherited finite L2 source-context check fails")
    return {
        "fibers": {
            name: {
                "center": {
                    "physical": "O",
                    "Ku": "cu",
                    "Kv": "cv",
                    "first": l2_input.BRANCH_SPECS[branch]["first_center"],
                    "Kdelta": cdelta,
                }[name],
                "radius_squared": fraction_json(radii[name]),
                "roles": sorted(fibers[name]),
                "complete_modeled_carrier_fiber": True,
            }
            for name in fibers
        },
        "delta_row": {
            "source": "delta",
            "actual_blocker_proxy": cdelta,
            "roles": sorted(kdelta),
            "radius_squared": fraction_json(radii["Kdelta"]),
            "source_mem_support": "delta" in kdelta,
            "center_in_carrier_erase_source": cdelta in points and cdelta != "delta",
            "complete_exact_four_fiber": fibers["Kdelta"] == kdelta,
        },
        "critical_deletion_profiles": deletion_profiles,
        "physical_traces": {
            "Ku_inter_physical": sorted(ku & physical),
            "Kv_inter_physical": sorted(kv & physical),
            "singleton_residue": sorted(physical - ku - kv),
            "disjoint_2_plus_2_plus_1": (ku & physical).isdisjoint(kv & physical),
        },
        "modeled_blocker_center_by_source": blocker_centers,
        "modeled_first_apex_blocker_fiber_at_fq": sorted(blocker_fiber),
        "modeled_source_context_geometry_checks": source_checks,
        "actual_typed_CriticalShellSystem_instantiated": False,
        "actual_typed_OriginalUniqueFourResidual_instantiated": False,
    }


def joint_deletion_certificate(
    points: Mapping[str, Point], branch: str
) -> dict[str, Any]:
    spec = BRANCH_SPECS[branch]
    physical = frozenset({"u", "xu", "delta", "v", "xv"})
    physical_without_delta = physical - frozenset({"delta"})
    cdelta = spec["cdelta"]
    outer_checks = {
        "modeled_deleted_mem_physical_class": "delta" in physical,
        "modeled_deleted_ne_u": points["delta"] != points["u"],
        "modeled_deleted_ne_v": points["delta"] != points["v"],
        "modeled_deleted_not_mem_Ku": "delta" not in spec["Ku"],
        "modeled_deleted_not_mem_Kv": "delta" not in spec["Kv"],
        "modeled_blockers_cu_ne_cv": points["cu"] != points["cv"],
    }
    if not all(outer_checks.values()):
        raise ValueError("a modeled joint-deletion outer field fails")
    u_packet = common_packet_certificate(
        points,
        "delta",
        "cu",
        "O",
        spec["Ku"],
        physical_without_delta,
        cdelta,
    )
    v_packet = common_packet_certificate(
        points,
        "delta",
        "cv",
        "O",
        spec["Kv"],
        physical_without_delta,
        cdelta,
    )
    return {
        "assignments": {
            "deleted": "delta",
            "actual_blocker_of_deleted_proxy": cdelta,
        },
        "modeled_outer_field_checks": outer_checks,
        "modeled_uPacket": u_packet,
        "modeled_vPacket": v_packet,
        "actual_typed_ExactFourMutualOmissionJointDeletion_instantiated": False,
    }


def robust_surface_certificate(
    points: Mapping[str, Point],
    branch: str,
    caps: tuple[frozenset[str], ...],
) -> dict[str, Any]:
    spec = BRANCH_SPECS[branch]
    physical = frozenset({"u", "xu", "delta", "v", "xv"})
    physical_without_delta = physical - frozenset({"delta"})
    blocker_centers = modeled_blocker_centers(points, branch)
    source_mem_good_proxy = (
        blocker_centers["u"] != blocker_centers["fq"]
        and len(
            complete_fiber(
                points,
                "cu",
                dist2(points["cu"], points["u"]),
                frozenset({"fq"}),
            )
        )
        >= 4
    )
    ingress_packet = common_packet_certificate(
        points,
        "fq",
        "cu",
        "O",
        spec["Ku"],
        physical_without_delta,
        blocker_centers["fq"],
    )
    robust_deletions: dict[str, Any] = {}
    for deleted in spec["order"]:
        remaining = complete_fiber(points, "O", F(1), frozenset({deleted}))
        robust_deletions[deleted] = {
            "remaining_physical_fiber": sorted(remaining),
            "remaining_cardinality": len(remaining),
            "survives": len(remaining) >= 4,
        }
    if not all(check["survives"] for check in robust_deletions.values()):
        raise ValueError("modeled second-apex full deletion robustness fails")
    cap_cards = tuple(map(len, caps))
    if cap_cards[0] >= 6:
        cap_growth = {
            "constructor": "surplus",
            "modeled_surplusCap_card_ge_six": cap_cards[0] >= 6,
        }
    elif cap_cards[0] == 5 and cap_cards[1] >= 5:
        cap_growth = {
            "constructor": "firstOpposite",
            "modeled_surplusCap_card_eq_five": cap_cards[0] == 5,
            "modeled_firstOppCap_card_ge_five": cap_cards[1] >= 5,
            "modeled_oppositeCaps_card_add_two_eq_carrier": (
                cap_cards[1] + cap_cards[2] + 2 == len(points)
            ),
        }
    elif cap_cards[0] == 5 and cap_cards[1] == 4 and cap_cards[2] >= 6:
        cap_growth = {
            "constructor": "secondOpposite",
            "modeled_surplusCap_card_eq_five": True,
            "modeled_firstOppCap_card_eq_four": True,
            "modeled_secondOppCap_card_ge_six": True,
            "modeled_secondOppCap_card_add_six_eq_carrier": (
                cap_cards[2] + 6 == len(points)
            ),
        }
    else:
        raise ValueError("no modeled ExactFourRobustCapGrowth constructor applies")
    growth_checks = [value for value in cap_growth.values() if isinstance(value, bool)]
    if not all(growth_checks):
        raise ValueError("the selected modeled cap-growth profile fails")
    surface_checks = {
        "modeled_ingress_deleted_is_retained_pair_member": "fq" in {"fq", "fw"},
        "modeled_ingress_source_mem_carrier": "u" in points,
        "modeled_ingress_source_mem_good_proxy": source_mem_good_proxy,
        "modeled_ingress_source_outside_first_blocker_fiber": (
            blocker_centers["u"] != blocker_centers["fq"]
        ),
        "modeled_ingress_blocker_ne_secondApex": points["cu"] != points["O"],
        "modeled_secondApex_fully_deletion_robust": all(
            check["survives"] for check in robust_deletions.values()
        ),
        "modeled_firstOppCap_card_ge_four": cap_cards[1] >= 4,
        "modeled_secondOppCap_card_ge_five": cap_cards[2] >= 5,
        "modeled_radiusClassification_fivePointRadius": len(
            complete_fiber(points, "O", F(1))
        )
        >= 5,
    }
    if not all(surface_checks.values()):
        raise ValueError("a modeled robust-surface field fails")
    return {
        "modeled_ingress": {
            "assignments": {"deleted": "fq", "source": "u", "blocker": "cu"},
            "modeled_deleted_is_pair": "fq" in {"fq", "fw"},
            "modeled_source_mem_good_proxy": source_mem_good_proxy,
            "modeled_packet": ingress_packet,
            "actual_typed_ExactFourPhysicalCommonDeletionIngress_instantiated": False,
        },
        "modeled_secondApex_robust_deletion_checks": robust_deletions,
        "modeled_radiusClassification": {
            "constructor": "fivePointRadius",
            "center": "O",
            "radius_squared": "1/1",
            "class_roles": sorted(complete_fiber(points, "O", F(1))),
            "class_cardinality": len(complete_fiber(points, "O", F(1))),
            "class_cardinality_ge_five": len(complete_fiber(points, "O", F(1))) >= 5,
            "actual_typed_DeletionRobustRadiusClassification_instantiated": False,
        },
        "modeled_capGrowth": cap_growth,
        "modeled_outer_field_checks": surface_checks,
        "actual_typed_ExactFourPostCardElevenRobustSurface_instantiated": False,
    }


def global_deletion_certificate(
    points: Mapping[str, Point], branch: str
) -> dict[str, Any]:
    spec = BRANCH_SPECS[branch]
    ku: frozenset[str] = spec["Ku"]
    kv: frozenset[str] = spec["Kv"]
    physical = frozenset({"u", "xu", "delta", "v", "xv"})
    deleted = frozenset({"u"})
    trace_u = ku & physical
    trace_v = kv & physical
    ku_radius2 = dist2(points["cu"], points["u"])
    post_max, post_profile = radial_profile(points, "cu", deleted)
    restored_deleted = deleted - frozenset({"u"})
    shell = critical_selected_four_certificate(points, "u", "cu", ku)
    minimal_core_checks = {
        "modeled_shellAt_index_roles": ["u"],
        "modeled_shellAt_support": sorted(ku),
        "modeled_shellAt_source_mem_support": "u" in ku,
        "modeled_shellAt_complete_ambient_fiber": complete_fiber(
            points, "cu", ku_radius2
        )
        == ku,
        "modeled_shellAt_four_named_labels_pairwise_distinct": shell[
            "modeled_field_checks"
        ]["modeled_four_labels_pairwise_distinct"],
        "modeled_supports_pairwise_disjoint_vacuous_for_singleton": True,
        "modeled_pairwise_disjoint_quantified_pairs": [
            {
                "s": "u",
                "t": "u",
                "s_ne_t": False,
                "implication_holds": True,
            }
        ],
    }
    if not all(
        value for value in minimal_core_checks.values() if isinstance(value, bool)
    ):
        raise ValueError("modeled singleton MinimalDeletionCore geometry fails")
    field_checks = {
        "modeled_rigid": (
            len(trace_u) == 2
            and len(trace_v) == 2
            and trace_u.isdisjoint(trace_v)
            and physical == frozenset({"delta"}) | trace_u | trace_v
        ),
        "modeled_center_is_cu": True,
        "modeled_deleted_is_singleton_u": deleted == {"u"},
        "modeled_center_mem_carrier_outside_physical_class": (
            "cu" in points and "cu" not in physical
        ),
        "modeled_deleted_nonempty": bool(deleted),
        "modeled_deleted_subset_physical_class": deleted <= physical,
        "modeled_deleted_card_le_five": len(deleted) <= 5,
        "modeled_blocked": post_max <= 3,
        "modeled_restores": len(
            complete_fiber(points, "cu", ku_radius2, restored_deleted)
        )
        >= 4,
        "modeled_geometry_MinimalDeletionCore_branch": all(
            value for value in minimal_core_checks.values() if isinstance(value, bool)
        ),
        "modeled_center_ne_O": points["cu"] != points["O"],
    }
    if not all(field_checks.values()):
        raise ValueError("a modeled global-deletion field fails")
    return {
        "assignments": {"center": "cu", "deleted": ["u"]},
        "modeled_field_checks": field_checks,
        "modeled_blocked_radius_classes": post_profile,
        "modeled_restores_quantified_over_deleted": [
            {
                "s": "u",
                "s_mem_deleted": "u" in deleted,
                "deleted_erase_s": sorted(restored_deleted),
                "restored_K4_support": sorted(ku),
                "restored_K4_holds": field_checks["modeled_restores"],
            }
        ],
        "modeled_geometry_branch": {
            "constructor": "MinimalDeletionCore",
            "modeled_distinct_equal_radius_deleted_pair_exists": False,
            "modeled_MinimalDeletionCore_nonempty": True,
            "modeled_geometry_disjunction_holds": True,
            "modeled_singleton_core": minimal_core_checks,
            "modeled_shell": shell,
            "actual_typed_MinimalDeletionCore_instantiated": False,
        },
        "actual_typed_ExactFourMutualOmissionRigid221GlobalDeletion_instantiated": False,
    }


def global_k4_census(
    points: Mapping[str, Point], order: Sequence[str]
) -> dict[str, Any]:
    maxima = {role: radial_profile(points, role)[0] for role in order}
    global_k4 = all(value >= 4 for value in maxima.values())
    return {
        "maximum_positive_radius_multiplicity_by_modeled_center": maxima,
        "centers_with_a_modeled_four_class": sorted(
            role for role, value in maxima.items() if value >= 4
        ),
        "centers_without_a_modeled_four_class": sorted(
            role for role, value in maxima.items() if value < 4
        ),
        "global_K4_holds_on_modeled_carrier": global_k4,
    }


def certify_branch(
    branch: str, points: Mapping[str, Point] | None = None
) -> tuple[dict[str, Any], list[dict[str, Any]]]:
    spec = BRANCH_SPECS[branch]
    carrier = dict(build_branch_points(branch) if points is None else points)
    order: tuple[str, ...] = spec["order"]
    triple: tuple[str, str, str] = spec["triple"]
    if set(order) != set(carrier) or len(order) != len(carrier):
        raise ValueError("the prescribed order is not an exact carrier enumeration")
    distinctness = distinctness_certificate(carrier, order)
    convexity = convexity_certificate(carrier, order)
    mec = mec_certificate(carrier, order, triple)
    caps_report, caps, interiors = caps_certificate(carrier, order, triple)
    finite_core = finite_core_certificate(carrier, branch, interiors[2])
    joint = joint_deletion_certificate(carrier, branch)
    robust = robust_surface_certificate(carrier, branch, caps)
    global_deletion = global_deletion_certificate(carrier, branch)
    k4 = global_k4_census(carrier, order)
    discrepancies: list[dict[str, Any]] = []

    observed_card = len(carrier)
    observed_caps = caps_report["cardinalities"]
    observed_delta_radius2 = F(finite_core["delta_row"]["radius_squared"])
    observed_growth = robust["modeled_capGrowth"]["constructor"]
    comparisons = (
        ("carrier cardinality", spec["expected_card"], observed_card),
        ("cap cardinalities", spec["expected_caps"], observed_caps),
        (
            "delta selected radius squared",
            fraction_json(EXPECTED_DELTA_RADIUS2),
            fraction_json(observed_delta_radius2),
        ),
        ("capGrowth constructor", spec["expected_cap_growth"], observed_growth),
    )
    for field, expected, observed in comparisons:
        if expected != observed:
            discrepancies.append(
                {
                    "branch": branch,
                    "field": field,
                    "expected": expected,
                    "observed": observed,
                }
            )

    all_named_finite_packet_geometry_replayed = not discrepancies
    if k4["global_K4_holds_on_modeled_carrier"]:
        raise ValueError("the finite carrier unexpectedly satisfies global K4")
    return (
        {
            "role_count": observed_card,
            "cyclic_order": list(order),
            "points": {role: point_json(carrier[role]) for role in order},
            "role_distinctness": distinctness,
            "strict_convexity": convexity,
            "mec": mec,
            "caps": caps_report,
            "packet_indices": {
                "surplusIdx": 0,
                "oppIndex1": 1,
                "oppIndex2": 2,
                "oppApex1": l2_input.BRANCH_SPECS[branch]["first_center"],
                "oppApex2": "O",
                "J1": sorted(interiors[1]),
                "J2": sorted(interiors[2]),
            },
            "finite_core": finite_core,
            "joint_deletion": joint,
            "robust_surface": robust,
            "global_deletion": global_deletion,
            "global_K4_census": k4,
            "all_named_finite_packet_geometry_replayed": (
                all_named_finite_packet_geometry_replayed
            ),
        },
        discrepancies,
    )


def build_report() -> dict[str, Any]:
    l2_report, l2_raw = load_l2_certificate()
    branches: dict[str, Any] = {}
    discrepancies: list[dict[str, Any]] = []
    for branch in ("S0-I", "S0-N"):
        branch_report, branch_discrepancies = certify_branch(branch)
        branches[branch] = branch_report
        discrepancies.extend(branch_discrepancies)
    if discrepancies:
        raise ValueError(
            f"supplied-value discrepancies prevent exact L3 status: {discrepancies}"
        )
    return {
        "schema": SCHEMA,
        "status": STATUS,
        "solver_invoked": False,
        "arithmetic": "fractions.Fraction only",
        "input_provenance": {
            "kind": "deterministically replayed exact L2 certificate",
            "path": L2_JSON_REPO_PATH,
            "sha256": hashlib.sha256(l2_raw).hexdigest(),
            "schema": l2_report["schema"],
            "status": l2_report["status"],
        },
        "source_anchors": SOURCE_ANCHORS,
        "claim_scope": {
            "l3_named_field_level_finite_geometry": True,
            "full_typed_Lean_packets": False,
            "CounterexampleData": False,
            "CriticalShellSystem": False,
            "OriginalUniqueFourResidual": False,
            "global_K4": False,
            "full_theorem": False,
            "lean_claim": False,
            "promotion_claim": False,
        },
        "first_unmodeled_next_interface": {
            "name": "conditional downstream R.minimal : D.Minimal ingress",
            "exact_requirement": (
                "supply R.minimal : D.Minimal to "
                "exists_global_cardMinimal_blocking_subdeletion; its construction invokes "
                "D.K4, then bind the finite rows through a total CriticalShellSystem whose "
                "source-indexed centerAt/selectedAt family covers every carrier source"
            ),
            "why_first": (
                "absolute prerequisites D.K4 and a total CriticalShellSystem are absent; "
                "after granting an abstract L3 packet over genuine D/H/F/R, the first still-"
                "missing downstream field is R.minimal : D.Minimal"
            ),
        },
        "supplied_value_discrepancies": discrepancies,
        "branches": branches,
    }


def render_markdown(report: Mapping[str, Any]) -> str:
    rows = []
    for branch, data in report["branches"].items():
        cards = data["caps"]["cardinalities"]
        rows.append(
            f"| {branch} | {data['role_count']} | "
            f"`({cards['C1']}, {cards['C2']}, {cards['C3']})` | "
            f"`{data['robust_surface']['modeled_capGrowth']['constructor']}` | "
            f"`{data['finite_core']['delta_row']['radius_squared']}` |"
        )
    return (
        "# Rigid221 S0 exact L3 field-level geometric packet\n\n"
        f"**Status:** `{report['status']}`\n\n"
        "**Arithmetic:** exact `fractions.Fraction`; no solver invoked\n\n"
        "**Claim boundary:** exact only for the displayed finite geometric abstraction\n\n"
        "## Exact cells\n\n"
        "| Cell | Carrier | Cap cards `(surplus, firstOpp, secondOpp)` | capGrowth | δ radius² |\n"
        "|---|---:|---:|---|---:|\n"
        + "\n".join(rows)
        + "\n\n## Replayed finite packet fields\n\n"
        "The artifact expands every named finite geometric predicate of "
        "`ExactFourMutualOmissionJointDeletion`, both nested "
        "`CommonDeletionTwoCenterPacket` values and their `U5QDeletedK4Class` rows, "
        "`ExactFourPostCardElevenRobustSurface`, and "
        "`ExactFourMutualOmissionRigid221GlobalDeletion`. The singleton geometry arm "
        "uses the exact `Ku` shell and records the pairwise-disjoint obligation as "
        "vacuous over the singleton deletion index.\n\n"
        "## Claim boundary\n\n"
        "No typed Lean packet is constructed. `CounterexampleData`, the total "
        "`CriticalShellSystem`, `OriginalUniqueFourResidual`, global K4, and the full "
        "theorem remain false in the claim scope. The absolute missing prerequisites "
        "are `D.K4` and a total source-indexed `CriticalShellSystem`. After granting "
        "an abstract L3 packet over genuine `D/H/F/R`, the first still-missing "
        "downstream field is `R.minimal : D.Minimal`, consumed by the global "
        "card-minimal blocking-subdeletion producer.\n\n"
        "## Focused global-boundary source audit\n\n"
        "There is no existing theorem that reindexes a "
        "`CriticalSelectedFourClass A q center` to an arbitrary member of its support. "
        "`CriticalShellSystem.overrideAt` (`U1CarrierInjection.lean:1354-1373`) "
        "requires an already typed replacement shell and its no-qfree proof. The latter "
        "can be derived under an explicit `IsUniqueFourCenter A center` premise by "
        "combining `selectedFourClass_support_eq_uniqueFourClass` and "
        "`not_hasNEquidistantPointsAt_erase_of_mem_uniqueFourClass` "
        "(`MinimalUniqueFourCover.lean:97-143`). Support membership alone is not enough.\n\n"
        "`RetainedInteriorBlockerCollision` "
        "(`RetainedStrictInteriorPairSelector.lean:68-89`) requires two sources in one "
        "selected strict-interior class whose dependent `H.centerAt` values are equal. "
        "The displayed row geometry does not by itself construct the genuine "
        "`D/S/H/F/R` inputs or those dependent center equalities. The existing "
        "two-collision consumer "
        "`exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions` "
        "(`TwoSourceAlignedLowHits.lean:433-462`) additionally needs two genuine "
        "collision packets at distinct radii, exact class/interior cardinalities, and "
        "the robust residual chain `B/L/N/T`; it does not consume two bare pairs from "
        "one physical five-class.\n\n"
        "`CriticalSystemRebase` transports critical-pair/frontier data only. Changing "
        "`H` changes the dependent type of `F` and does not transport "
        "`OriginalUniqueFourResidual`, the robust surface, source context, joint "
        "deletion, or global-deletion data. The minimum missing wrapper consists of a "
        "unique-center support-member no-qfree lemma, an "
        "`overrideAtSupportMember` constructor using it, and reconstruction—not mere "
        "transport—of the dependent residual packets. The Coordinator also retains an "
        "all-source unique-four cover and actual selected-support deletion facts, so the "
        "L3 finite packet does not exhaust its global hypotheses.\n\n"
        "## Supplied-value discrepancies\n\n"
        + (
            "None.\n"
            if not report["supplied_value_discrepancies"]
            else json.dumps(report["supplied_value_discrepancies"], indent=2) + "\n"
        )
    )


def write_json(path: Path, value: Mapping[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(
        json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path)
    parser.add_argument("--report-output", type=Path)
    parser.add_argument("--markdown-output", type=Path)
    args = parser.parse_args()
    report = build_report()
    if (
        args.output is None
        and args.report_output is None
        and args.markdown_output is None
    ):
        print(json.dumps(report, indent=2, sort_keys=True))
        return
    for output in (args.output, args.report_output):
        if output is not None:
            write_json(output, report)
    if args.markdown_output is not None:
        args.markdown_output.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_output.write_text(render_markdown(report), encoding="utf-8")


if __name__ == "__main__":
    main()
