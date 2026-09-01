# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Produce exact finite L2 source-context geometry for the two S0 cells.

The L1 coordinate formulas are the only inherited evidence.  This module adds
the prescribed retained-pair points and independently replays every finite
geometric predicate with :class:`fractions.Fraction`.  It deliberately stops
before the subtype-indexed Lean structures and global counterexample surface.
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

import rigid221_s0_true_cap_witnesses as l1_input

F = Fraction
Point = tuple[F, F]

SCHEMA = "rigid221-s0-l2-source-context-geometric-witnesses/v1"
STATUS = "SAT_EXACT_L2_SOURCE_CONTEXT_GEOMETRIC_CORE"
L1_SOURCE = Path(__file__).with_name("rigid221_s0_true_cap_witnesses.py")
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
    "cap_interior_by_index": ("lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:496"),
    "opp_index1": "lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:543",
    "opp_index2": "lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:550",
    "opp_apex2": "lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:305",
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
        "retained_parameters": {"fq": F(1, 1000), "fw": F(1, 500)},
        "extra_parameters": {"fp": F(3, 1000)},
        "Ku": frozenset({"u", "xu", "q1", "q2"}),
        "Kv": frozenset({"v", "xv", "r1", "r2"}),
        "expected_cap_cards": {"C1": 5, "C2": 7, "C3": 7},
        "expected_J1": frozenset({"fp", "fq", "fw", "r1", "r2"}),
        "expected_J2": frozenset({"cu", "cv", "u", "v", "xu"}),
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
        "retained_parameters": {"fq": F(-3, 1000), "fw": F(-1, 500)},
        "extra_parameters": {"fp": F(-1, 1000)},
        "Ku": frozenset({"u", "xu", "qu1", "qu2"}),
        "Kv": frozenset({"v", "xv", "qv1", "qv2"}),
        "expected_cap_cards": {"C1": 5, "C2": 6, "C3": 7},
        "expected_J1": frozenset({"fp", "fq", "fw", "qv1"}),
        "expected_J2": frozenset({"cu", "cv", "u", "v", "xv"}),
    },
}


def add(first: Point, second: Point) -> Point:
    return first[0] + second[0], first[1] + second[1]


def sub(first: Point, second: Point) -> Point:
    return first[0] - second[0], first[1] - second[1]


def dot(first: Point, second: Point) -> F:
    return first[0] * second[0] + first[1] * second[1]


def dist2(first: Point, second: Point) -> F:
    return dot(sub(first, second), sub(first, second))


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


def build_branch_points(branch: str) -> dict[str, Point]:
    spec = BRANCH_SPECS[branch]
    points = dict(l1_input.build_branch_points(branch))
    center = points[spec["first_center"]]
    for role, parameter in {
        **spec["retained_parameters"],
        **spec["extra_parameters"],
    }.items():
        points[role] = rotate_rational(center, points["O"], parameter)
    return points


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


def modeled_blocker_centers(points: Mapping[str, Point], branch: str) -> dict[str, str]:
    """A total finite center map used only to replay ``actualBlockerFiber``.

    The four first-class sources share ``oppApex1``.  The two source-context
    roles retain their L1 blockers.  Remaining sources are assigned an existing
    distinct carrier center without claiming a selected row at that source.
    """

    first_center: str = BRANCH_SPECS[branch]["first_center"]
    first_class = frozenset({"O", "fp", "fq", "fw"})
    assignments: dict[str, str] = {}
    for source in points:
        if source in first_class:
            blocker = first_center
        elif source == "u":
            blocker = "cu"
        elif source == "v" or source == "cu":
            blocker = "cv"
        else:
            blocker = "cu"
        if blocker == source or blocker not in points:
            raise ValueError("modeled blocker center is not in carrier erase source")
        assignments[source] = blocker
    return assignments


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


def mec_certificate(
    points: Mapping[str, Point], order: Sequence[str], triple: Sequence[str]
) -> dict[str, Any]:
    center = (F(137, 210), F(0))
    radius = F(137, 210)
    radius2 = radius * radius
    slacks = {role: radius2 - dist2(center, points[role]) for role in order}
    boundary = frozenset(role for role, slack in slacks.items() if slack == 0)
    if any(slack < 0 for slack in slacks.values()) or boundary != frozenset(triple):
        raise ValueError("the old exact MEC packet fails after L2 extension")
    weights = {triple[0]: radius2, triple[1]: radius2, triple[2]: 1 - 2 * radius2}
    barycenter = (
        sum((weights[role] * points[role][0] for role in weights), start=F(0)),
        sum((weights[role] * points[role][1] for role in weights), start=F(0)),
    )
    if (
        sum(weights.values(), start=F(0)) != 1
        or any(weight <= 0 for weight in weights.values())
        or barycenter != center
    ):
        raise ValueError("MEC minimality witness fails")
    return {
        "center": point_json(center),
        "radius": fraction_json(radius),
        "radius_squared": fraction_json(radius2),
        "all_carrier_points_enclosed": True,
        "enclosure_slacks": {
            role: fraction_json(slack) for role, slack in slacks.items()
        },
        "boundary_roles": sorted(boundary),
        "boundary_exactly_stated_triple": True,
        "strict_interior_roles": sorted(set(points) - boundary),
        "minimality_witness": {
            "positive_weights": {
                role: fraction_json(weight) for role, weight in weights.items()
            },
            "weight_sum": "1/1",
            "weighted_boundary_barycenter": point_json(barycenter),
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
    if any(value <= 0 for value in pair_distances.values()) or any(
        value < 0 for value in dots.values()
    ):
        raise ValueError("the inherited non-obtuse Moser triangle fails")
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
    caps = cap_sets(points, triple)
    names = ("C1", "C2", "C3")
    frames = (
        (triple[0], triple[1], triple[2]),
        (triple[1], triple[2], triple[0]),
        (triple[2], triple[0], triple[1]),
    )
    endpoint_indices = ((1, 2), (2, 0), (0, 1))
    interiors = tuple(
        cap - frozenset(triple[index] for index in endpoint_indices[cap_index])
        for cap_index, cap in enumerate(caps)
    )
    counts = {role: sum(role in cap for cap in caps) for role in order}
    moser = frozenset(triple)
    if any(counts[role] != (2 if role in moser else 1) for role in order):
        raise ValueError("CapTriple membership multiplicity fails")
    cards = {name: len(cap) for name, cap in zip(names, caps, strict=True)}
    spec = BRANCH_SPECS[branch]
    if (
        cards != spec["expected_cap_cards"]
        or interiors[1] != spec["expected_J1"]
        or interiors[2] != spec["expected_J2"]
    ):
        raise ValueError("supplied L2 cap cards or strict interiors disagree")
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
        vertex_name: {cap_name: truth[cap_name][role] for cap_name in names}
        for vertex_name, role in zip(("v1", "v2", "v3"), triple, strict=True)
    }
    expected_endpoint_pattern = {
        "v1": {"C1": False, "C2": True, "C3": True},
        "v2": {"C1": True, "C2": False, "C3": True},
        "v3": {"C1": True, "C2": True, "C3": False},
    }
    if endpoint_pattern != expected_endpoint_pattern:
        raise ValueError("replayed CapTriple endpoint membership pattern fails")
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
    spec = BRANCH_SPECS[branch]
    physical = frozenset({"u", "xu", "delta", "v", "xv"})
    ku: frozenset[str] = spec["Ku"]
    kv: frozenset[str] = spec["Kv"]
    ku_radius2 = dist2(points["cu"], points["u"])
    kv_radius2 = dist2(points["cv"], points["v"])
    fibers = {
        "physical": complete_fiber(points, "O", F(1)),
        "Ku": complete_fiber(points, "cu", ku_radius2),
        "Kv": complete_fiber(points, "cv", kv_radius2),
    }
    if fibers != {"physical": physical, "Ku": ku, "Kv": kv}:
        raise ValueError("an inherited exact row gained or lost a point")
    trace_u = ku & physical
    trace_v = kv & physical
    singleton = physical - trace_u - trace_v
    if (trace_u, trace_v, singleton) != (
        frozenset({"u", "xu"}),
        frozenset({"v", "xv"}),
        frozenset({"delta"}),
    ):
        raise ValueError("the inherited rigid 2+2+1 trace fails")
    post_u_max, post_u = radial_profile(points, "cu", frozenset({"u"}))
    post_v_max, post_v = radial_profile(points, "cv", frozenset({"v"}))
    if post_u_max > 3 or post_v_max > 3:
        raise ValueError("singleton blocking fails after L2 extension")
    modeled_deleted = frozenset({"u"})
    modeled_restored_deleted = modeled_deleted - frozenset({"u"})
    modeled_global_deletion_predicates = {
        "modeled_rigid_2_plus_2_plus_1": (
            len(trace_u) == 2
            and len(trace_v) == 2
            and trace_u.isdisjoint(trace_v)
            and physical == singleton | trace_u | trace_v
        ),
        "modeled_center_role": "cu",
        "modeled_deleted_roles": sorted(modeled_deleted),
        "modeled_center_in_carrier_outside_physical_class": (
            "cu" in points and "cu" not in physical
        ),
        "modeled_deleted_nonempty": bool(modeled_deleted),
        "modeled_deleted_subset_physical_class": modeled_deleted <= physical,
        "modeled_deleted_cardinality": len(modeled_deleted),
        "modeled_deleted_cardinality_le_five": len(modeled_deleted) <= 5,
        "modeled_blocked_after_delete_u": post_u_max <= 3,
        "modeled_restored_deleted_roles": sorted(modeled_restored_deleted),
        "modeled_restores_four_class_at_cu": len(
            complete_fiber(points, "cu", ku_radius2, modeled_restored_deleted)
        )
        >= 4,
    }
    modeled_boolean_predicates = [
        value
        for key, value in modeled_global_deletion_predicates.items()
        if key.startswith("modeled_") and isinstance(value, bool)
    ]
    if not all(modeled_boolean_predicates):
        raise ValueError("a modeled singleton global-deletion set predicate fails")
    return {
        "physical_selected_class": {
            "center_role": "O",
            "radius_squared": "1/1",
            "roles": sorted(physical),
            "cardinality": 5,
            "complete_ambient_fiber": sorted(fibers["physical"]),
        },
        "Ku": {
            "center_role": "cu",
            "source_role": "u",
            "radius_squared": fraction_json(ku_radius2),
            "roles": sorted(ku),
            "complete_ambient_fiber": sorted(fibers["Ku"]),
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
            "complete_ambient_fiber": sorted(fibers["Kv"]),
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
            and "cu" not in physical,
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
            **modeled_global_deletion_predicates,
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
    spec = BRANCH_SPECS[branch]
    center: str = spec["first_center"]
    first_class = frozenset({"O", "fp", "fq", "fw"})
    fiber = complete_fiber(points, center, F(1))
    if fiber != first_class:
        raise ValueError(
            "the first-apex class is not exactly the prescribed four points"
        )
    full_max, full_profile = radial_profile(points, center)
    large_classes = [entry for entry in full_profile if entry["multiplicity"] >= 4]
    if large_classes != [
        {"radius_squared": "1/1", "roles": sorted(first_class), "multiplicity": 4}
    ]:
        raise ValueError(
            "the first apex has another modeled class of multiplicity at least four"
        )
    deletion_checks: dict[str, Any] = {}
    for deleted in sorted(first_class):
        maximum, profile = radial_profile(points, center, frozenset({deleted}))
        if maximum > 3:
            raise ValueError(f"deleting {deleted} leaves a first-apex four-class")
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
    if not all(check["implication_holds"] for check in localization.values()):
        raise ValueError("retained-pair localization fails on the modeled carrier")

    physical = frozenset({"u", "xu", "delta", "v", "xv"})
    physical_after = {
        deleted: complete_fiber(points, "O", F(1), frozenset({deleted}))
        for deleted in ("fq", "fw")
    }
    if any(value != physical for value in physical_after.values()):
        raise ValueError("a retained deletion changes the physical five-class")
    blocker_centers = modeled_blocker_centers(points, branch)
    blocker_fiber = frozenset(
        role
        for role, blocker in blocker_centers.items()
        if blocker == blocker_centers["fq"]
    )
    if blocker_fiber != first_class:
        raise ValueError(
            "the modeled actual blocker fiber at fq is not the first class"
        )
    return {
        "oppApex1": center,
        "radius_squared": "1/1",
        "roles": sorted(first_class),
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
            "actual_blocker_center_by_source": blocker_centers,
            "anchor_blocker_center": blocker_centers["fq"],
            "roles": sorted(blocker_fiber),
            "exactly_first_apex_selected_class": blocker_fiber == first_class,
            "every_assigned_center_in_carrier_erase_source": True,
            "selected_rows_at_non_u_non_v_sources_instantiated": False,
        },
        "original_unique_four_residual_finite_geometry": {
            "carrier_card_gt_nine": len(points) > 9,
            "class_card_eq_four": len(fiber) == 4,
            "unique_modeled_K4_radius": len(large_classes) == 1,
            "every_first_class_member_blocks_after_deletion": all(
                check["no_modeled_four_class"] for check in deletion_checks.values()
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
    points: Mapping[str, Point],
    branch: str,
    j2: frozenset[str],
    first_class: frozenset[str],
) -> dict[str, Any]:
    spec = BRANCH_SPECS[branch]
    ku: frozenset[str] = spec["Ku"]
    physical = frozenset({"u", "xu", "delta", "v", "xv"})
    cross = ku & (physical & j2)
    ku_radius2 = dist2(points["cu"], points["u"])
    survive_q = complete_fiber(points, "cu", ku_radius2, frozenset({"fq"}))
    survive_w = complete_fiber(points, "cu", ku_radius2, frozenset({"fw"}))
    blocker_centers = modeled_blocker_centers(points, branch)
    blocker_fiber = frozenset(
        role
        for role, blocker in blocker_centers.items()
        if blocker == blocker_centers["fq"]
    )
    checks = {
        "source_mem_class": "u" in physical,
        "source_mem_interior": "u" in j2,
        "modeled_source_outside_first_apex_blocker_fiber_proxy": (
            "u" not in blocker_fiber
        ),
        "source_cross_card_le_two": len(cross) <= 2,
        "other_ne_source": points["v"] != points["u"],
        "other_mem_class": "v" in physical,
        "other_mem_interior": "v" in j2,
        "other_not_mem_source_row": "v" not in ku,
        "source_other_blockers_ne": points["cu"] != points["cv"],
        "source_survives_q_or_w": len(survive_q) >= 4 or len(survive_w) >= 4,
        "source_mem_u_row": "u" in ku,
        "v_not_mem_source_row": "v" not in ku,
        "u_eq_source_or_not_mem_source_row": True,
    }
    if not all(checks.values()):
        raise ValueError("a finite ExactFourMutualOmissionSourceContext field fails")
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
        "modeled_first_apex_blocker_fiber_roles": sorted(first_class),
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
        "all_finite_source_context_geometry_holds": all(checks.values()),
        "lean_subtype_and_system_fields_instantiated": False,
    }


def global_k4_census(
    points: Mapping[str, Point], order: Sequence[str]
) -> dict[str, Any]:
    maxima = {role: radial_profile(points, role)[0] for role in order}
    all_centers = all(value >= 4 for value in maxima.values())
    return {
        "maximum_positive_radius_multiplicity_by_modeled_center": maxima,
        "centers_with_a_modeled_four_class": sorted(
            role for role, value in maxima.items() if value >= 4
        ),
        "centers_without_a_modeled_four_class": sorted(
            role for role, value in maxima.items() if value < 4
        ),
        "global_K4_holds_on_modeled_carrier": all_centers,
    }


def build_branch(branch: str) -> dict[str, Any]:
    spec = BRANCH_SPECS[branch]
    points = build_branch_points(branch)
    order: tuple[str, ...] = spec["order"]
    triple: tuple[str, str, str] = spec["triple"]
    if set(order) != set(points) or len(order) != len(points):
        raise ValueError("the prescribed order is not an exact carrier enumeration")
    caps_report, caps, j1, j2 = caps_certificate(points, order, triple, branch)
    rows = rows_certificate(points, branch, j2)
    first_apex = first_apex_certificate(points, branch, caps, j1)
    first_class = frozenset(first_apex["roles"])
    source_context = source_context_certificate(points, branch, j2, first_class)
    k4_census = global_k4_census(points, order)
    if k4_census["global_K4_holds_on_modeled_carrier"]:
        raise ValueError("the finite carrier unexpectedly satisfies global K4")
    surplus_idx = caps_report["surplus_idx"]
    triangle_v3 = triple[2]
    computed_opp_index1 = 1 if surplus_idx == 0 else None
    computed_opp_index2 = 2 if surplus_idx == 0 else None
    computed_opp_apex2 = triangle_v3 if surplus_idx == 0 else None
    conditional_opp2_premises_hold = surplus_idx == 0 and triangle_v3 == "O"
    conditional_opp2_conclusion_holds = (
        computed_opp_index2 == 2 and computed_opp_apex2 == "O"
    )
    if not conditional_opp2_premises_hold or not conditional_opp2_conclusion_holds:
        raise ValueError("surplusIdx=0 opposite-index/apex mapping fails")
    return {
        "branch_condition": "xu in J2" if branch == "S0-I" else "xu not in J2",
        "input_and_extension_formulas": {
            "l1_formula": l1_input.raw_formula(branch),
            "l2_rotations": {
                role: {
                    "center": spec["first_center"],
                    "point": "O",
                    "t": fraction_json(parameter),
                }
                for role, parameter in {
                    **spec["retained_parameters"],
                    **spec["extra_parameters"],
                }.items()
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
                "premises_hold": conditional_opp2_premises_hold,
                "conclusion_holds": conditional_opp2_conclusion_holds,
            },
            "J1": sorted(j1),
            "J2": sorted(j2),
            "u_in_J2": "u" in j2,
            "v_in_J2": "v" in j2,
            "xu_in_J2": "xu" in j2,
        },
        "rows": rows,
        "first_apex": first_apex,
        "source_context": source_context,
        "global_K4_census": k4_census,
    }


def build_report() -> dict[str, Any]:
    return {
        "schema": SCHEMA,
        "status": STATUS,
        "solver_invoked": False,
        "arithmetic": "fractions.Fraction only",
        "input_provenance": {
            "kind": "L1 formula source only",
            "path": L1_SOURCE_REPO_PATH,
            "sha256": hashlib.sha256(L1_SOURCE.read_bytes()).hexdigest(),
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
