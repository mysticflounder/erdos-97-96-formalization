# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Independent exact verifier for the two finite rigid221 S0 L3 packets.

No witness producer is imported.  Coordinates are rebuilt directly from the
stated rational ``P`` and ``Rot`` formulas, then every retained Fraction,
finite set, cap, fiber, deletion profile, and modeled named-packet premise is
recomputed.  Actual Lean packets and all global/theorem claims must stay false.
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

SCHEMA = "rigid221-s0-l3-field-level-geometric-packet/v1"
INPUT_STATUS = "SAT_EXACT_L3_FIELD_LEVEL_GEOMETRIC_PACKET"
VERIFIED_STATUS = "VERIFIED_SAT_EXACT_L3_FIELD_LEVEL_GEOMETRIC_PACKET"
BRANCHES = ("S0-I", "S0-N")
MEC_CENTER = (F(137, 210), F(0))
MEC_RADIUS2 = F(18769, 44100)
PHYSICAL = frozenset({"u", "xu", "delta", "v", "xv"})
FIRST_CLASS = frozenset({"O", "fp", "fq", "fw"})
DELTA_CLASS = frozenset({"delta", "d1", "d2", "d3"})
DELTA_PARAMETERS = {"d1": F(-1, 1000), "d2": F(-1, 500), "d3": F(-3, 1000)}
EXPECTED_DELTA_RADIUS2 = F(80656, 54389)
L2_REPO_PATH = (
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

CLAIM_SCOPE = {
    "l3_named_field_level_finite_geometry": True,
    "full_typed_Lean_packets": False,
    "CounterexampleData": False,
    "CriticalShellSystem": False,
    "OriginalUniqueFourResidual": False,
    "global_K4": False,
    "full_theorem": False,
    "lean_claim": False,
    "promotion_claim": False,
}

FIRST_UNMODELED = {
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
        "first_center": "xv",
        "first_parameters": {"fq": F(1, 1000), "fw": F(1, 500), "fp": F(3, 1000)},
        "cdelta": "xu",
        "Ku": frozenset({"u", "xu", "q1", "q2"}),
        "Kv": frozenset({"v", "xv", "r1", "r2"}),
        "card": 19,
        "cap_cards": {"C1": 5, "C2": 10, "C3": 7},
        "cap_growth": "firstOpposite",
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
        "first_center": "delta",
        "first_parameters": {"fq": F(-3, 1000), "fw": F(-1, 500), "fp": F(-1, 1000)},
        "cdelta": "xv",
        "Ku": frozenset({"u", "xu", "qu1", "qu2"}),
        "Kv": frozenset({"v", "xv", "qv1", "qv2"}),
        "card": 18,
        "cap_cards": {"C1": 8, "C2": 6, "C3": 7},
        "cap_growth": "surplus",
    },
}


class VerificationError(ValueError):
    """The document is malformed or fails exact independent replay."""


def require(condition: bool, message: str) -> None:
    if not condition:
        raise VerificationError(message)


def fjson(value: F) -> str:
    return f"{value.numerator}/{value.denominator}"


def pjson(point: Point) -> list[str]:
    return [fjson(point[0]), fjson(point[1])]


def add(a: Point, b: Point) -> Point:
    return a[0] + b[0], a[1] + b[1]


def sub(a: Point, b: Point) -> Point:
    return a[0] - b[0], a[1] - b[1]


def scale(k: F, a: Point) -> Point:
    return k * a[0], k * a[1]


def dot(a: Point, b: Point) -> F:
    return a[0] * b[0] + a[1] * b[1]


def dist2(a: Point, b: Point) -> F:
    return dot(sub(a, b), sub(a, b))


def orient(a: Point, b: Point, c: Point) -> F:
    ab, ac = sub(b, a), sub(c, a)
    return ab[0] * ac[1] - ab[1] * ac[0]


def p(parameter: F) -> Point:
    denominator = 1 + parameter**2
    return (1 - parameter**2) / denominator, 2 * parameter / denominator


def rotate(center: Point, point: Point, parameter: F) -> Point:
    denominator = 1 + parameter**2
    cosine = (1 - parameter**2) / denominator
    sine = 2 * parameter / denominator
    x, y = sub(point, center)
    return add(center, (cosine * x - sine * y, sine * x + cosine * y))


def on_arc_opposite(apex: Point, endpoint1: Point, endpoint2: Point, q: Point) -> bool:
    return orient(q, endpoint1, endpoint2) * orient(apex, endpoint1, endpoint2) <= 0


def branch_points(branch: str) -> dict[str, Point]:
    o = (F(0), F(0))
    delta, v, u = p(F(-4, 11)), p(F(-10, 29)), p(F(-6, 19))
    if branch == "S0-I":
        xu, xv = p(F(6, 19)), p(F(4, 11))
        cu = (F(83, 100), F(0))
        cv = scale(F(267, 500), add(v, xv))
        points = {
            "O": o,
            "delta": delta,
            "v": v,
            "u": u,
            "xu": xu,
            "xv": xv,
            "cu": cu,
            "cv": cv,
            "q1": rotate(cu, u, F(-15, 4)),
            "q2": rotate(cu, u, F(-2)),
            "r1": rotate(cv, v, F(-5, 12)),
            "r2": rotate(cv, v, F(-7, 20)),
            "s": (F(1, 10), F(1, 10)),
        }
    elif branch == "S0-N":
        xv, xu = p(F(6, 19)), p(F(4, 11))
        cu = scale(F(157, 300), add(u, xu))
        cv = scale(F(31, 60), add(v, xv))
        points = {
            "O": o,
            "delta": delta,
            "v": v,
            "u": u,
            "xu": xu,
            "xv": xv,
            "cu": cu,
            "cv": cv,
            "qu1": rotate(cu, u, F(-3, 10)),
            "qu2": rotate(cu, u, F(-2, 5)),
            "qv1": rotate(cv, v, F(-31, 20)),
            "qv2": rotate(cv, v, F(-1, 9)),
        }
    else:
        raise VerificationError(f"unknown branch {branch}")
    spec = SPECS[branch]
    for role, parameter in spec["first_parameters"].items():
        points[role] = rotate(points[spec["first_center"]], o, parameter)
    for role, parameter in DELTA_PARAMETERS.items():
        points[role] = rotate(points[spec["cdelta"]], delta, parameter)
    require(set(points) == set(spec["order"]), f"{branch} formula carrier mismatch")
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
    points: Mapping[str, Point],
    center: str,
    deleted: frozenset[str] = frozenset(),
) -> tuple[int, list[dict[str, Any]]]:
    classes: dict[F, list[str]] = {}
    for role, point in points.items():
        if role not in deleted:
            radius2 = dist2(points[center], point)
            if radius2 > 0:
                classes.setdefault(radius2, []).append(role)
    entries = [
        {
            "radius_squared": fjson(radius2),
            "roles": sorted(roles),
            "multiplicity": len(roles),
        }
        for radius2, roles in sorted(classes.items())
    ]
    return max((entry["multiplicity"] for entry in entries), default=0), entries


def distinctness(points: Mapping[str, Point], order: Sequence[str]) -> dict[str, Any]:
    distances = {
        f"{a}|{b}": fjson(dist2(points[a], points[b]))
        for a, b in combinations(order, 2)
    }
    require(
        all(F(value) > 0 for value in distances.values()), "role distinctness fails"
    )
    return {
        "all_roles_pairwise_distinct": True,
        "pair_count": len(distances),
        "pairwise_squared_distances": distances,
    }


def convexity(points: Mapping[str, Point], order: Sequence[str]) -> dict[str, Any]:
    values: list[tuple[F, str, str, str]] = []
    checks: dict[str, dict[str, str]] = {}
    for index, first in enumerate(order):
        second = order[(index + 1) % len(order)]
        edge = f"{first}->{second}"
        checks[edge] = {}
        for other in order:
            if other not in (first, second):
                value = orient(points[first], points[second], points[other])
                require(value > 0, f"strict convexity fails at {edge}/{other}")
                checks[edge][other] = fjson(value)
                values.append((value, first, second, other))
    minimum = min(values)
    return {
        "all_edge_nonincident_orientations_strictly_positive": True,
        "check_count": len(values),
        "minimum_orientation": fjson(minimum[0]),
        "minimum_roles": list(minimum[1:]),
        "edge_nonincident_orientations": checks,
    }


def mec(
    points: Mapping[str, Point], order: Sequence[str], triple: Sequence[str]
) -> dict[str, Any]:
    slacks = {role: MEC_RADIUS2 - dist2(MEC_CENTER, points[role]) for role in order}
    boundary = frozenset(role for role, slack in slacks.items() if slack == 0)
    require(all(slack >= 0 for slack in slacks.values()), "MEC enclosure fails")
    require(boundary == frozenset(triple), "MEC boundary fails")
    weights = {
        triple[0]: MEC_RADIUS2,
        triple[1]: MEC_RADIUS2,
        triple[2]: 1 - 2 * MEC_RADIUS2,
    }
    barycenter = (
        sum((weights[role] * points[role][0] for role in weights), start=F(0)),
        sum((weights[role] * points[role][1] for role in weights), start=F(0)),
    )
    require(
        barycenter == MEC_CENTER and all(value > 0 for value in weights.values()),
        "MEC minimality witness fails",
    )
    return {
        "center": pjson(MEC_CENTER),
        "radius_squared": fjson(MEC_RADIUS2),
        "all_carrier_points_enclosed": True,
        "enclosure_slacks": {role: fjson(slack) for role, slack in slacks.items()},
        "boundary_roles": sorted(boundary),
        "boundary_exactly_stated_triple": True,
        "positive_boundary_weights": {
            role: fjson(value) for role, value in weights.items()
        },
        "weighted_boundary_barycenter": pjson(barycenter),
    }


def caps(
    points: Mapping[str, Point],
    order: Sequence[str],
    triple: Sequence[str],
) -> tuple[dict[str, Any], tuple[frozenset[str], ...], tuple[frozenset[str], ...]]:
    names = ("C1", "C2", "C3")
    frames = (
        (triple[0], triple[1], triple[2]),
        (triple[1], triple[2], triple[0]),
        (triple[2], triple[0], triple[1]),
    )
    truth = {
        name: {
            role: on_arc_opposite(points[a], points[b], points[c], points[role])
            for role in order
        }
        for name, (a, b, c) in zip(names, frames, strict=True)
    }
    cap_sets = tuple(
        frozenset(role for role in order if truth[name][role]) for name in names
    )
    interiors = tuple(
        cap - frozenset(triple[index] for index in endpoints)
        for cap, endpoints in zip(cap_sets, ((1, 2), (2, 0), (0, 1)), strict=True)
    )
    counts = {role: sum(role in cap for cap in cap_sets) for role in order}
    require(
        all(counts[role] == (2 if role in triple else 1) for role in order),
        "CapTriple multiplicity fails",
    )
    endpoint_pattern = {
        vertex: {name: truth[name][role] for name in names}
        for vertex, role in zip(("v1", "v2", "v3"), triple, strict=True)
    }
    require(
        endpoint_pattern
        == {
            "v1": {"C1": False, "C2": True, "C3": True},
            "v2": {"C1": True, "C2": False, "C3": True},
            "v3": {"C1": True, "C2": True, "C3": False},
        },
        "CapTriple endpoint membership fails",
    )
    return (
        {
            "frames": {
                name: {"apex": a, "endpoint1": b, "endpoint2": c}
                for name, (a, b, c) in zip(names, frames, strict=True)
            },
            "on_arc_opposite_truth_table": truth,
            "members": {
                name: sorted(cap) for name, cap in zip(names, cap_sets, strict=True)
            },
            "cardinalities": {
                name: len(cap) for name, cap in zip(names, cap_sets, strict=True)
            },
            "membership_count_by_role": counts,
            "endpoint_pattern": endpoint_pattern,
            "J1": sorted(interiors[1]),
            "J2": sorted(interiors[2]),
        },
        cap_sets,
        interiors,
    )


def blocker_centers(points: Mapping[str, Point], branch: str) -> dict[str, str]:
    spec = SPECS[branch]
    result: dict[str, str] = {}
    for source in points:
        if source in FIRST_CLASS:
            blocker = spec["first_center"]
        elif source == "u":
            blocker = "cu"
        elif source == "v":
            blocker = "cv"
        elif source == "delta":
            blocker = spec["cdelta"]
        elif source == "cu":
            blocker = "cv"
        else:
            blocker = "cu"
        require(
            blocker in points and blocker != source, "blocker-center assignment fails"
        )
        result[source] = blocker
    return result


def u5_row(
    points: Mapping[str, Point],
    q: str,
    center: str,
    support: frozenset[str],
) -> dict[str, Any]:
    require(
        bool(support)
        and q not in support
        and center not in support
        and support <= points.keys(),
        "U5 row omission/subset fails",
    )
    radius2 = dist2(points[center], points[min(support)])
    equalities = {
        role: fjson(dist2(points[center], points[role])) for role in sorted(support)
    }
    require(
        radius2 > 0 and all(F(value) == radius2 for value in equalities.values()),
        "U5 row equal-radius check fails",
    )
    return {
        "modeled_support_roles": sorted(support),
        "modeled_subset_of_carrier_erase_q_erase_center": True,
        "modeled_cardinality": len(support),
        "modeled_cardinality_ge_four": len(support) >= 4,
        "modeled_q_not_mem": True,
        "modeled_radius_squared": fjson(radius2),
        "modeled_radius_squared_positive": True,
        "modeled_same_squared_radius": equalities,
        "actual_typed_U5QDeletedK4Class_instantiated": False,
    }


def selected_four(
    points: Mapping[str, Point],
    source: str,
    center: str,
    support: frozenset[str],
) -> dict[str, Any]:
    radius2 = dist2(points[center], points[source])
    labels = sorted(support)
    checks = {
        "modeled_radius_squared_positive": radius2 > 0,
        "modeled_support_eq_complete_ambient_fiber": complete_fiber(
            points, center, radius2
        )
        == support,
        "modeled_support_card_eq_four": len(support) == 4,
        "modeled_source_mem_support": source in support,
        "modeled_center_mem_carrier_erase_source": center in points
        and points[center] != points[source],
        "modeled_four_labels_pairwise_distinct": all(
            points[a] != points[b] for a, b in combinations(labels, 2)
        ),
        "modeled_support_eq_four_named_labels": frozenset(labels) == support,
    }
    require(all(checks.values()), "CriticalSelectedFourClass fields fail")
    return {
        "assignments": {
            "source": source,
            "center": center,
            "support": labels,
            "labels": labels,
        },
        "modeled_radius_squared": fjson(radius2),
        "modeled_field_checks": checks,
        "actual_typed_CriticalSelectedFourClass_instantiated": False,
    }


def common_packet(
    points: Mapping[str, Point],
    q: str,
    center1: str,
    center2: str,
    support1: frozenset[str],
    support2: frozenset[str],
    actual_blocker: str,
) -> dict[str, Any]:
    row1, row2 = (
        u5_row(points, q, center1, support1),
        u5_row(points, q, center2, support2),
    )
    radius1, radius2 = (
        F(row1["modeled_radius_squared"]),
        F(row2["modeled_radius_squared"]),
    )
    overlap = support1 & support2
    checks = {
        "modeled_q_mem_carrier": q in points,
        "modeled_center1_mem_carrier": center1 in points,
        "modeled_center2_mem_carrier": center2 in points,
        "modeled_centers_ne": points[center1] != points[center2],
        "modeled_survives1": len(
            complete_fiber(points, center1, radius1, frozenset({q}))
        )
        >= 4,
        "modeled_survives2": len(
            complete_fiber(points, center2, radius2, frozenset({q}))
        )
        >= 4,
        "modeled_actual_blocker_ne_center1": points[actual_blocker] != points[center1],
        "modeled_actual_blocker_ne_center2": points[actual_blocker] != points[center2],
        "modeled_B1_card_eq_four": len(support1) == 4,
        "modeled_B2_card_eq_four": len(support2) == 4,
        "modeled_overlap_card_le_two": len(overlap) <= 2,
    }
    require(all(checks.values()), "CommonDeletionTwoCenterPacket fields fail")
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


def finite_core(
    points: Mapping[str, Point], branch: str, j2: frozenset[str]
) -> dict[str, Any]:
    spec = SPECS[branch]
    radii = {
        "physical": F(1),
        "Ku": dist2(points["cu"], points["u"]),
        "Kv": dist2(points["cv"], points["v"]),
        "first": F(1),
        "Kdelta": dist2(points[spec["cdelta"]], points["delta"]),
    }
    fibers = {
        "physical": complete_fiber(points, "O", radii["physical"]),
        "Ku": complete_fiber(points, "cu", radii["Ku"]),
        "Kv": complete_fiber(points, "cv", radii["Kv"]),
        "first": complete_fiber(points, spec["first_center"], radii["first"]),
        "Kdelta": complete_fiber(points, spec["cdelta"], radii["Kdelta"]),
    }
    require(
        fibers
        == {
            "physical": PHYSICAL,
            "Ku": spec["Ku"],
            "Kv": spec["Kv"],
            "first": FIRST_CLASS,
            "Kdelta": DELTA_CLASS,
        },
        "complete selected fibers fail",
    )
    require(radii["Kdelta"] == EXPECTED_DELTA_RADIUS2, "delta row radius fails")
    profiles: dict[str, Any] = {}
    for center, deleted in (("cu", "u"), ("cv", "v"), (spec["cdelta"], "delta")):
        maximum, profile = radial_profile(points, center, frozenset({deleted}))
        require(maximum <= 3, "critical deletion blocking fails")
        profiles[f"delete_{deleted}_at_{center}"] = {
            "maximum_positive_radius_multiplicity": maximum,
            "no_modeled_four_class": True,
            "radius_classes": profile,
        }
    blockers = blocker_centers(points, branch)
    blocker_fiber = frozenset(
        role for role, blocker in blockers.items() if blocker == blockers["fq"]
    )
    require(blocker_fiber == FIRST_CLASS, "first-apex blocker fiber fails")
    cross = spec["Ku"] & (PHYSICAL & j2)
    source_checks = {
        "modeled_source_mem_physical_class": "u" in PHYSICAL,
        "modeled_source_mem_J2": "u" in j2,
        "modeled_source_outside_first_apex_blocker_fiber_proxy": "u"
        not in blocker_fiber,
        "modeled_source_cross_card_le_two": len(cross) <= 2,
        "modeled_other_ne_source": points["v"] != points["u"],
        "modeled_other_mem_physical_class": "v" in PHYSICAL,
        "modeled_other_mem_J2": "v" in j2,
        "modeled_other_not_mem_Ku": "v" not in spec["Ku"],
        "modeled_source_other_blockers_ne": points["cu"] != points["cv"],
        "modeled_source_survives_fq_or_fw": (
            len(complete_fiber(points, "cu", radii["Ku"], frozenset({"fq"}))) >= 4
            or len(complete_fiber(points, "cu", radii["Ku"], frozenset({"fw"}))) >= 4
        ),
        "modeled_source_mem_Ku": "u" in spec["Ku"],
        "modeled_v_not_mem_Ku": "v" not in spec["Ku"],
        "modeled_u_eq_source_arm": True,
    }
    require(all(source_checks.values()), "inherited source-context fields fail")
    centers = {
        "physical": "O",
        "Ku": "cu",
        "Kv": "cv",
        "first": spec["first_center"],
        "Kdelta": spec["cdelta"],
    }
    return {
        "fibers": {
            name: {
                "center": centers[name],
                "radius_squared": fjson(radii[name]),
                "roles": sorted(fibers[name]),
                "complete_modeled_carrier_fiber": True,
            }
            for name in fibers
        },
        "delta_row": {
            "source": "delta",
            "actual_blocker_proxy": spec["cdelta"],
            "roles": sorted(DELTA_CLASS),
            "radius_squared": fjson(radii["Kdelta"]),
            "source_mem_support": True,
            "center_in_carrier_erase_source": True,
            "complete_exact_four_fiber": True,
        },
        "critical_deletion_profiles": profiles,
        "physical_traces": {
            "Ku_inter_physical": sorted(spec["Ku"] & PHYSICAL),
            "Kv_inter_physical": sorted(spec["Kv"] & PHYSICAL),
            "singleton_residue": sorted(PHYSICAL - spec["Ku"] - spec["Kv"]),
            "disjoint_2_plus_2_plus_1": (spec["Ku"] & PHYSICAL).isdisjoint(
                spec["Kv"] & PHYSICAL
            ),
        },
        "modeled_blocker_center_by_source": blockers,
        "modeled_first_apex_blocker_fiber_at_fq": sorted(blocker_fiber),
        "modeled_source_context_geometry_checks": source_checks,
        "actual_typed_CriticalShellSystem_instantiated": False,
        "actual_typed_OriginalUniqueFourResidual_instantiated": False,
    }


def joint_deletion(points: Mapping[str, Point], branch: str) -> dict[str, Any]:
    spec = SPECS[branch]
    physical_without_delta = PHYSICAL - {"delta"}
    checks = {
        "modeled_deleted_mem_physical_class": "delta" in PHYSICAL,
        "modeled_deleted_ne_u": points["delta"] != points["u"],
        "modeled_deleted_ne_v": points["delta"] != points["v"],
        "modeled_deleted_not_mem_Ku": "delta" not in spec["Ku"],
        "modeled_deleted_not_mem_Kv": "delta" not in spec["Kv"],
        "modeled_blockers_cu_ne_cv": points["cu"] != points["cv"],
    }
    require(all(checks.values()), "JointDeletion outer fields fail")
    return {
        "assignments": {
            "deleted": "delta",
            "actual_blocker_of_deleted_proxy": spec["cdelta"],
        },
        "modeled_outer_field_checks": checks,
        "modeled_uPacket": common_packet(
            points,
            "delta",
            "cu",
            "O",
            spec["Ku"],
            physical_without_delta,
            spec["cdelta"],
        ),
        "modeled_vPacket": common_packet(
            points,
            "delta",
            "cv",
            "O",
            spec["Kv"],
            physical_without_delta,
            spec["cdelta"],
        ),
        "actual_typed_ExactFourMutualOmissionJointDeletion_instantiated": False,
    }


def robust_surface(
    points: Mapping[str, Point],
    branch: str,
    cap_sets: tuple[frozenset[str], ...],
) -> dict[str, Any]:
    spec, blockers = SPECS[branch], blocker_centers(points, branch)
    physical_without_delta = PHYSICAL - {"delta"}
    ku_radius2 = dist2(points["cu"], points["u"])
    source_good = (
        blockers["u"] != blockers["fq"]
        and len(complete_fiber(points, "cu", ku_radius2, frozenset({"fq"}))) >= 4
    )
    ingress = common_packet(
        points, "fq", "cu", "O", spec["Ku"], physical_without_delta, blockers["fq"]
    )
    robust_deletions: dict[str, Any] = {}
    for deleted in spec["order"]:
        remaining = complete_fiber(points, "O", F(1), frozenset({deleted}))
        robust_deletions[deleted] = {
            "remaining_physical_fiber": sorted(remaining),
            "remaining_cardinality": len(remaining),
            "survives": len(remaining) >= 4,
        }
    require(
        all(entry["survives"] for entry in robust_deletions.values()),
        "robust deletion survival fails",
    )
    cards = tuple(map(len, cap_sets))
    if cards[0] >= 6:
        growth = {"constructor": "surplus", "modeled_surplusCap_card_ge_six": True}
    elif cards[0] == 5 and cards[1] >= 5:
        growth = {
            "constructor": "firstOpposite",
            "modeled_surplusCap_card_eq_five": True,
            "modeled_firstOppCap_card_ge_five": True,
            "modeled_oppositeCaps_card_add_two_eq_carrier": cards[1] + cards[2] + 2
            == len(points),
        }
    elif cards[0] == 5 and cards[1] == 4 and cards[2] >= 6:
        growth = {
            "constructor": "secondOpposite",
            "modeled_surplusCap_card_eq_five": True,
            "modeled_firstOppCap_card_eq_four": True,
            "modeled_secondOppCap_card_ge_six": True,
            "modeled_secondOppCap_card_add_six_eq_carrier": cards[2] + 6 == len(points),
        }
    else:
        raise VerificationError("no cap-growth constructor applies")
    require(
        all(value for value in growth.values() if isinstance(value, bool)),
        "cap growth arithmetic fails",
    )
    surface_checks = {
        "modeled_ingress_deleted_is_retained_pair_member": "fq" in {"fq", "fw"},
        "modeled_ingress_source_mem_carrier": "u" in points,
        "modeled_ingress_source_mem_good_proxy": source_good,
        "modeled_ingress_source_outside_first_blocker_fiber": blockers["u"]
        != blockers["fq"],
        "modeled_ingress_blocker_ne_secondApex": points["cu"] != points["O"],
        "modeled_secondApex_fully_deletion_robust": all(
            entry["survives"] for entry in robust_deletions.values()
        ),
        "modeled_firstOppCap_card_ge_four": cards[1] >= 4,
        "modeled_secondOppCap_card_ge_five": cards[2] >= 5,
        "modeled_radiusClassification_fivePointRadius": len(
            complete_fiber(points, "O", F(1))
        )
        >= 5,
    }
    require(all(surface_checks.values()), "RobustSurface fields fail")
    physical_fiber = complete_fiber(points, "O", F(1))
    return {
        "modeled_ingress": {
            "assignments": {"deleted": "fq", "source": "u", "blocker": "cu"},
            "modeled_deleted_is_pair": True,
            "modeled_source_mem_good_proxy": source_good,
            "modeled_packet": ingress,
            "actual_typed_ExactFourPhysicalCommonDeletionIngress_instantiated": False,
        },
        "modeled_secondApex_robust_deletion_checks": robust_deletions,
        "modeled_radiusClassification": {
            "constructor": "fivePointRadius",
            "center": "O",
            "radius_squared": "1/1",
            "class_roles": sorted(physical_fiber),
            "class_cardinality": len(physical_fiber),
            "class_cardinality_ge_five": len(physical_fiber) >= 5,
            "actual_typed_DeletionRobustRadiusClassification_instantiated": False,
        },
        "modeled_capGrowth": growth,
        "modeled_outer_field_checks": surface_checks,
        "actual_typed_ExactFourPostCardElevenRobustSurface_instantiated": False,
    }


def global_deletion(points: Mapping[str, Point], branch: str) -> dict[str, Any]:
    spec, deleted = SPECS[branch], frozenset({"u"})
    trace_u, trace_v = spec["Ku"] & PHYSICAL, spec["Kv"] & PHYSICAL
    radius2 = dist2(points["cu"], points["u"])
    post_max, post_profile = radial_profile(points, "cu", deleted)
    shell = selected_four(points, "u", "cu", spec["Ku"])
    core_checks = {
        "modeled_shellAt_index_roles": ["u"],
        "modeled_shellAt_support": sorted(spec["Ku"]),
        "modeled_shellAt_source_mem_support": "u" in spec["Ku"],
        "modeled_shellAt_complete_ambient_fiber": complete_fiber(points, "cu", radius2)
        == spec["Ku"],
        "modeled_shellAt_four_named_labels_pairwise_distinct": shell[
            "modeled_field_checks"
        ]["modeled_four_labels_pairwise_distinct"],
        "modeled_supports_pairwise_disjoint_vacuous_for_singleton": True,
        "modeled_pairwise_disjoint_quantified_pairs": [
            {"s": "u", "t": "u", "s_ne_t": False, "implication_holds": True}
        ],
    }
    field_checks = {
        "modeled_rigid": (
            len(trace_u) == 2
            and len(trace_v) == 2
            and trace_u.isdisjoint(trace_v)
            and PHYSICAL == frozenset({"delta"}) | trace_u | trace_v
        ),
        "modeled_center_is_cu": True,
        "modeled_deleted_is_singleton_u": deleted == {"u"},
        "modeled_center_mem_carrier_outside_physical_class": "cu" in points
        and "cu" not in PHYSICAL,
        "modeled_deleted_nonempty": bool(deleted),
        "modeled_deleted_subset_physical_class": deleted <= PHYSICAL,
        "modeled_deleted_card_le_five": len(deleted) <= 5,
        "modeled_blocked": post_max <= 3,
        "modeled_restores": len(complete_fiber(points, "cu", radius2, frozenset()))
        >= 4,
        "modeled_geometry_MinimalDeletionCore_branch": all(
            value for value in core_checks.values() if isinstance(value, bool)
        ),
        "modeled_center_ne_O": points["cu"] != points["O"],
    }
    require(all(field_checks.values()), "Rigid221GlobalDeletion fields fail")
    return {
        "assignments": {"center": "cu", "deleted": ["u"]},
        "modeled_field_checks": field_checks,
        "modeled_blocked_radius_classes": post_profile,
        "modeled_restores_quantified_over_deleted": [
            {
                "s": "u",
                "s_mem_deleted": True,
                "deleted_erase_s": [],
                "restored_K4_support": sorted(spec["Ku"]),
                "restored_K4_holds": True,
            }
        ],
        "modeled_geometry_branch": {
            "constructor": "MinimalDeletionCore",
            "modeled_distinct_equal_radius_deleted_pair_exists": False,
            "modeled_MinimalDeletionCore_nonempty": True,
            "modeled_geometry_disjunction_holds": True,
            "modeled_singleton_core": core_checks,
            "modeled_shell": shell,
            "actual_typed_MinimalDeletionCore_instantiated": False,
        },
        "actual_typed_ExactFourMutualOmissionRigid221GlobalDeletion_instantiated": False,
    }


def k4_census(points: Mapping[str, Point], order: Sequence[str]) -> dict[str, Any]:
    maxima = {role: radial_profile(points, role)[0] for role in order}
    holds = all(value >= 4 for value in maxima.values())
    require(not holds, "finite carrier unexpectedly has global K4")
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


def expected_branch(branch: str) -> tuple[dict[str, Any], list[dict[str, Any]]]:
    spec, points = SPECS[branch], branch_points(branch)
    order, triple = spec["order"], spec["triple"]
    caps_report, cap_sets, interiors = caps(points, order, triple)
    core = finite_core(points, branch, interiors[2])
    robust = robust_surface(points, branch, cap_sets)
    discrepancies: list[dict[str, Any]] = []
    comparisons = (
        ("carrier cardinality", spec["card"], len(points)),
        ("cap cardinalities", spec["cap_cards"], caps_report["cardinalities"]),
        (
            "delta selected radius squared",
            fjson(EXPECTED_DELTA_RADIUS2),
            core["delta_row"]["radius_squared"],
        ),
        (
            "capGrowth constructor",
            spec["cap_growth"],
            robust["modeled_capGrowth"]["constructor"],
        ),
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
    return (
        {
            "role_count": len(points),
            "cyclic_order": list(order),
            "points": {role: pjson(points[role]) for role in order},
            "role_distinctness": distinctness(points, order),
            "strict_convexity": convexity(points, order),
            "mec": mec(points, order, triple),
            "caps": caps_report,
            "packet_indices": {
                "surplusIdx": 0,
                "oppIndex1": 1,
                "oppIndex2": 2,
                "oppApex1": spec["first_center"],
                "oppApex2": "O",
                "J1": sorted(interiors[1]),
                "J2": sorted(interiors[2]),
            },
            "finite_core": core,
            "joint_deletion": joint_deletion(points, branch),
            "robust_surface": robust,
            "global_deletion": global_deletion(points, branch),
            "global_K4_census": k4_census(points, order),
            "all_named_finite_packet_geometry_replayed": not discrepancies,
        },
        discrepancies,
    )


def require_equal(actual: object, expected: object, label: str) -> None:
    require(actual == expected, f"{label} mismatch")


def verify_document(
    document: object, *, certificate_path: Path | None = None
) -> dict[str, Any]:
    require(isinstance(document, dict), "certificate is not an object")
    required_top = {
        "schema",
        "status",
        "solver_invoked",
        "arithmetic",
        "input_provenance",
        "source_anchors",
        "claim_scope",
        "first_unmodeled_next_interface",
        "supplied_value_discrepancies",
        "branches",
    }
    require(set(document) == required_top, "top-level keys/status injection mismatch")
    require_equal(document["schema"], SCHEMA, "schema")
    require(document["status"] == INPUT_STATUS, "status upgrade or mutation")
    require(document["solver_invoked"] is False, "solver invocation claim mutation")
    require_equal(document["arithmetic"], "fractions.Fraction only", "arithmetic")
    require_equal(document["source_anchors"], SOURCE_ANCHORS, "source anchors")
    require_equal(document["claim_scope"], CLAIM_SCOPE, "claim-scope upgrade")
    require_equal(
        document["first_unmodeled_next_interface"],
        FIRST_UNMODELED,
        "D.Minimal/D.K4 boundary",
    )
    require_equal(
        document["supplied_value_discrepancies"], [], "recorded discrepancies"
    )

    if certificate_path is None:
        certificate_path = Path(__file__).with_name(
            "s0-true-cap-wave2-l3-witnesses.json"
        )
    l2_path = certificate_path.with_name("s0-true-cap-wave2-l2-witnesses.json")
    require(l2_path.is_file(), "retained L2 input is missing")
    l2_raw = l2_path.read_bytes()
    l2_document = json.loads(l2_raw)
    provenance = {
        "kind": "deterministically replayed exact L2 certificate",
        "path": L2_REPO_PATH,
        "sha256": hashlib.sha256(l2_raw).hexdigest(),
        "schema": "rigid221-s0-l2-source-context-geometric-witnesses/v1",
        "status": "SAT_EXACT_L2_SOURCE_CONTEXT_GEOMETRIC_CORE",
    }
    require(
        isinstance(l2_document, dict)
        and l2_document.get("schema") == provenance["schema"]
        and l2_document.get("status") == provenance["status"],
        "retained L2 input status/schema mismatch",
    )
    require_equal(document["input_provenance"], provenance, "input provenance")

    branches = document["branches"]
    require(
        isinstance(branches, dict) and set(branches) == set(BRANCHES),
        "branch keys/status injection mismatch",
    )
    computed_discrepancies: list[dict[str, Any]] = []
    for branch in BRANCHES:
        expected, discrepancies = expected_branch(branch)
        computed_discrepancies.extend(discrepancies)
        require_equal(branches[branch], expected, f"{branch} exact field packet")
    require_equal(
        computed_discrepancies,
        document["supplied_value_discrepancies"],
        "computed supplied-value discrepancies",
    )
    return {
        "status": VERIFIED_STATUS,
        "l3_named_field_level_finite_geometry": True,
        "full_typed_Lean_packets": False,
        "CounterexampleData": False,
        "CriticalShellSystem": False,
        "OriginalUniqueFourResidual": False,
        "K4": False,
        "Minimal": False,
        "JointDeletion": False,
        "RobustSurface": False,
        "Rigid221GlobalDeletion": False,
        "full_theorem": False,
    }


def load_and_verify(path: Path) -> dict[str, Any]:
    try:
        document = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as error:
        raise VerificationError(f"cannot read certificate: {error}") from error
    return verify_document(document, certificate_path=path)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "certificate",
        nargs="?",
        type=Path,
        default=Path(__file__).with_name("s0-true-cap-wave2-l3-witnesses.json"),
    )
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = load_and_verify(args.certificate)
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    print(VERIFIED_STATUS)


if __name__ == "__main__":
    main()
