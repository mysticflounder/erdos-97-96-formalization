# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Build the exact 28-role S0-I total critical-shell geometric model.

The retained S0-I L3 JSON supplies the first nineteen exact rational points.
Nine more points are reconstructed with rational circle rotations.  Every
geometric predicate below is then recomputed with ``fractions.Fraction``.

The result models every finite field of ``CriticalShellSystem`` and its nested
``CriticalSelectedFourClass`` rows.  It does not construct the dependent Lean
structure, ``CounterexampleData``, or any downstream theorem input.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from collections.abc import Mapping, Sequence
from fractions import Fraction
from itertools import combinations
from pathlib import Path
from typing import Any

F = Fraction
Point = tuple[F, F]

SCHEMA = "rigid221-s0-total-critical-shell-system-geometric-model/v1"
STATUS = "SAT_EXACT_TOTAL_CRITICAL_SHELL_SYSTEM_GEOMETRIC_MODEL"
SOLVER_DIR = Path(__file__).resolve().parent
REPOSITORY = Path(__file__).resolve().parents[4]
L3_JSON = SOLVER_DIR / "s0-true-cap-wave2-l3-witnesses.json"
L3_JSON_REPO_PATH = (
    "docs/computation/rigid221-s0-coupled-two-row-residue-lantern-20260831/"
    "solver/s0-true-cap-wave2-l3-witnesses.json"
)
LEAN_SOURCE = REPOSITORY / "lean/Erdos9796Proof/P97/U1CarrierInjection.lean"
UPSTREAM_SOURCE = (
    REPOSITORY / "lean/.lake/packages/formal_conjectures/"
    "FormalConjectures/ErdosProblems/97.lean"
)

SOURCE_ANCHORS = {
    "critical_four_shell": "lean/Erdos9796Proof/P97/U1CarrierInjection.lean:632-652",
    "critical_selected_four_class": (
        "lean/Erdos9796Proof/P97/U1CarrierInjection.lean:736-753"
    ),
    "critical_shell_system": (
        "lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1116-1125"
    ),
    "centerAt": "lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1129-1132",
    "selectedAt": "lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1134-1138",
    "no_qfree_at": "lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1140-1145",
    "has_n_equidistant_points_at": (
        "lean/.lake/packages/formal_conjectures/"
        "FormalConjectures/ErdosProblems/97.lean:30-35"
    ),
}

BASE_ORDER = (
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
)

ORDER = (
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
    "b1",
    "b2",
    "a1",
    "a2",
    "a3",
    "cu",
    "b3",
    "cv",
    "xu",
    "xv",
    "q1",
    "q2",
    "s",
    "c1",
    "c2",
    "c3",
)

TRIPLE = ("delta", "xv", "O")
EXTENSION_ROWS: dict[str, dict[str, Any]] = {
    "A": {
        "center": "fw",
        "anchor": "cu",
        "parameters": {
            "a1": F(-3, 10_000_000),
            "a2": F(-2, 10_000_000),
            "a3": F(-1, 10_000_000),
        },
    },
    "B": {
        "center": "fp",
        "anchor": "cv",
        "parameters": {
            "b1": F(-5, 200),
            "b2": F(-3, 200),
            "b3": F(-1, 200),
        },
    },
    "C": {
        "center": "delta",
        "anchor": "s",
        "parameters": {"c1": F(1, 100), "c2": F(2, 100), "c3": F(3, 100)},
    },
}

ROW_SPECS: dict[str, dict[str, Any]] = {
    "A": {"center": "fw", "labels": ("cu", "a1", "a2", "a3")},
    "B": {"center": "fp", "labels": ("cv", "b1", "b2", "b3")},
    "C": {"center": "delta", "labels": ("s", "c1", "c2", "c3")},
    "Ku": {"center": "cu", "labels": ("u", "xu", "q1", "q2")},
    "Kv": {"center": "cv", "labels": ("v", "xv", "r1", "r2")},
    "Kdelta": {
        "center": "xu",
        "supplied_center": "fq",
        "labels": ("delta", "d1", "d2", "d3"),
    },
    "F1": {"center": "xv", "labels": ("O", "fp", "fq", "fw")},
}

EXPECTED_CAPS = {"C1": 8, "C2": 7, "C3": 16}
EXPECTED_MEC_BOUNDARY = frozenset(TRIPLE)
EXPECTED_HAS_FOUR_CENTERS = frozenset(
    {"O", "cu", "cv", "delta", "fp", "fw", "xu", "xv"}
)
EXPECTED_ORBIT = ("u", "cu", "fw", "xv", "cv", "fp", "xv")


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


def validate_source_contract() -> dict[str, Any]:
    lean_raw = LEAN_SOURCE.read_bytes()
    lean_text = lean_raw.decode()
    upstream_raw = UPSTREAM_SOURCE.read_bytes()
    upstream_text = upstream_raw.decode()
    required_lean_fragments = (
        "structure CriticalFourShell (A : Finset ℝ²) (q center : ℝ²) where",
        "support_eq : support = A.filter fun z => dist center z = radius",
        "support_card : support.card = 4",
        "q_mem_support : q ∈ support",
        "structure CriticalSelectedFourClass (A : Finset ℝ²) (q center : ℝ²) extends",
        "structure CriticalShellSystem (A : Finset ℝ²) where",
        "shellAt :",
        "CriticalSelectedFourClass A q center",
        "no_qfree :",
        "¬ HasNEquidistantPointsAt 4 (A.erase q) (shellAt q hq).1",
    )
    missing = [
        fragment for fragment in required_lean_fragments if fragment not in lean_text
    ]
    upstream_fragment = "def HasNEquidistantPointsAt (n : ℕ) (A : Finset ℝ²)"
    if missing or upstream_fragment not in upstream_text:
        raise ValueError(
            "current Lean CriticalShellSystem/HasNEquidistantPointsAt source contract changed"
        )
    return {
        "source_text_fragments_validated": True,
        "u1_carrier_injection_sha256": hashlib.sha256(lean_raw).hexdigest(),
        "upstream_erdos97_sha256": hashlib.sha256(upstream_raw).hexdigest(),
        "CriticalShellSystem_fields": ["shellAt", "no_qfree"],
        "nested_complete_shell_fields_modeled": [
            "center_mem",
            "radius_pos",
            "support_eq",
            "support_card",
            "q_mem_support",
            "l1_to_l4",
            "six_label_inequalities",
            "support_eq_labels",
        ],
        "source_validation_scope": (
            "direct current-source byte scan; no Lean elaboration or theorem claim"
        ),
    }


def load_l3_certificate() -> tuple[dict[str, Any], bytes]:
    raw = L3_JSON.read_bytes()
    report = json.loads(raw)
    if report.get("schema") != "rigid221-s0-l3-field-level-geometric-packet/v1":
        raise ValueError("retained input has the wrong L3 schema")
    if report.get("status") != "SAT_EXACT_L3_FIELD_LEVEL_GEOMETRIC_PACKET":
        raise ValueError("retained input does not carry exact L3 status")
    branch = report.get("branches", {}).get("S0-I")
    if not isinstance(branch, dict):
        raise TypeError("retained input omits S0-I")
    if tuple(branch.get("cyclic_order", ())) != BASE_ORDER:
        raise ValueError("retained S0-I cyclic order changed")
    if branch.get("role_count") != 19 or set(branch.get("points", {})) != set(
        BASE_ORDER
    ):
        raise ValueError(
            "retained S0-I carrier is not the required nineteen-role input"
        )
    return report, raw


def build_points(l3_report: Mapping[str, Any] | None = None) -> dict[str, Point]:
    if l3_report is None:
        l3_report, _ = load_l3_certificate()
    raw_points = l3_report["branches"]["S0-I"]["points"]
    points = {role: parse_point(raw_points[role]) for role in BASE_ORDER}
    for spec in EXTENSION_ROWS.values():
        center = points[spec["center"]]
        anchor = points[spec["anchor"]]
        for role, parameter in spec["parameters"].items():
            points[role] = rotate_rational(center, anchor, parameter)
    if set(points) != set(ORDER):
        raise ValueError("constructed carrier does not match the 28-role order")
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
) -> dict[str, Any]:
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
    maximum = max((entry["multiplicity"] for entry in entries), default=0)
    histogram = Counter(entry["multiplicity"] for entry in entries)
    return {
        "positive_distance_role_count": sum(entry["multiplicity"] for entry in entries),
        "distinct_positive_radius_count": len(entries),
        "maximum_positive_distance_multiplicity": maximum,
        "multiplicity_histogram": {
            str(multiplicity): histogram[multiplicity]
            for multiplicity in sorted(histogram)
        },
        "radius_classes": entries,
        "HasNEquidistantPointsAt_4": maximum >= 4,
    }


def distinctness_certificate(
    points: Mapping[str, Point], order: Sequence[str]
) -> dict[str, Any]:
    if set(order) != set(points) or len(order) != len(points):
        raise ValueError("cyclic order is not an exact carrier enumeration")
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
                raise ValueError(f"non-strict hull edge {edge} at {other}: {value}")
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
    points: Mapping[str, Point], order: Sequence[str]
) -> dict[str, Any]:
    center = (F(137, 210), F(0))
    radius2 = F(18769, 44100)
    slacks = {role: radius2 - dist2(center, points[role]) for role in order}
    boundary = frozenset(role for role, slack in slacks.items() if slack == 0)
    if any(slack < 0 for slack in slacks.values()):
        raise ValueError("a modeled carrier point lies outside the stated MEC")
    if boundary != EXPECTED_MEC_BOUNDARY:
        raise ValueError("the exact MEC boundary is not {O,delta,xv}")
    weights = {TRIPLE[0]: radius2, TRIPLE[1]: radius2, TRIPLE[2]: 1 - 2 * radius2}
    barycenter = (
        sum((weights[role] * points[role][0] for role in weights), start=F(0)),
        sum((weights[role] * points[role][1] for role in weights), start=F(0)),
    )
    if barycenter != center or any(weight <= 0 for weight in weights.values()):
        raise ValueError("positive MEC barycentric witness fails")
    return {
        "center": point_json(center),
        "radius_squared": fraction_json(radius2),
        "all_carrier_points_enclosed": True,
        "enclosure_slacks": {
            role: fraction_json(slack) for role, slack in slacks.items()
        },
        "boundary_roles": sorted(boundary),
        "boundary_exactly_expected_triple": True,
        "positive_boundary_weights": {
            role: fraction_json(weight) for role, weight in weights.items()
        },
        "weighted_boundary_barycenter": point_json(barycenter),
    }


def caps_certificate(
    points: Mapping[str, Point], order: Sequence[str]
) -> dict[str, Any]:
    names = ("C1", "C2", "C3")
    frames = (
        (TRIPLE[0], TRIPLE[1], TRIPLE[2]),
        (TRIPLE[1], TRIPLE[2], TRIPLE[0]),
        (TRIPLE[2], TRIPLE[0], TRIPLE[1]),
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
    truth = {
        name: {
            role: on_arc_opposite(
                points[frame[0]], points[frame[1]], points[frame[2]], points[role]
            )
            for role in order
        }
        for name, frame in zip(names, frames, strict=True)
    }
    counts = {role: sum(role in cap for cap in caps) for role in order}
    if any(counts[role] != (2 if role in TRIPLE else 1) for role in order):
        raise ValueError("CapTriple membership multiplicity fails")
    endpoint_pattern = {
        vertex: {name: truth[name][role] for name in names}
        for vertex, role in zip(("v1", "v2", "v3"), TRIPLE, strict=True)
    }
    required_pattern = {
        "v1": {"C1": False, "C2": True, "C3": True},
        "v2": {"C1": True, "C2": False, "C3": True},
        "v3": {"C1": True, "C2": True, "C3": False},
    }
    if endpoint_pattern != required_pattern:
        raise ValueError("CapTriple endpoint pattern fails")
    return {
        "frames": {
            name: {
                "apex": frame[0],
                "endpoint1": frame[1],
                "endpoint2": frame[2],
            }
            for name, frame in zip(names, frames, strict=True)
        },
        "on_arc_opposite_truth_table": truth,
        "members": {name: sorted(cap) for name, cap in zip(names, caps, strict=True)},
        "cardinalities": {
            name: len(cap) for name, cap in zip(names, caps, strict=True)
        },
        "membership_count_by_role": counts,
        "endpoint_pattern": endpoint_pattern,
    }


def critical_row_certificate(
    points: Mapping[str, Point], row_name: str, spec: Mapping[str, Any]
) -> dict[str, Any]:
    center: str = spec["center"]
    labels: tuple[str, ...] = tuple(spec["labels"])
    support = frozenset(labels)
    if center not in points or len(labels) != 4 or not support <= points.keys():
        raise ValueError(f"{row_name} has an invalid center/support inventory")
    if len(support) != 4 or center in support:
        raise ValueError(f"{row_name} labels are not four distinct off-center roles")
    radius2 = dist2(points[center], points[labels[0]])
    distances = {
        role: fraction_json(dist2(points[center], points[role])) for role in labels
    }
    complete = complete_fiber(points, center, radius2)
    pairwise_distinct = all(
        points[first] != points[second] for first, second in combinations(labels, 2)
    )
    checks = {
        "modeled_center_mem_carrier_erase_every_source": all(
            center in points and center != source for source in support
        ),
        "modeled_squared_radius_positive": radius2 > 0,
        "modeled_positive_real_radius_exists": radius2 > 0,
        "modeled_support_eq_complete_ambient_radius_class": complete == support,
        "modeled_support_card_eq_four": len(support) == 4,
        "modeled_every_source_mem_support": all(
            source in support for source in support
        ),
        "modeled_four_labels_pairwise_distinct": pairwise_distinct,
        "modeled_support_eq_four_named_labels": frozenset(labels) == support,
        "modeled_all_four_squared_distances_equal": all(
            F(value) == radius2 for value in distances.values()
        ),
    }
    if not all(checks.values()):
        raise ValueError(f"{row_name} is not an exact CriticalSelectedFourClass row")
    return {
        "center": center,
        "labels": list(labels),
        "support_roles": sorted(support),
        "radius_squared": fraction_json(radius2),
        "squared_distances": distances,
        "complete_ambient_fiber_roles": sorted(complete),
        "modeled_field_checks": checks,
        "actual_typed_CriticalSelectedFourClass_instantiated": False,
    }


def partition_and_system_certificate(
    points: Mapping[str, Point], rows: Mapping[str, Mapping[str, Any]]
) -> tuple[dict[str, Any], dict[str, Any]]:
    supports = {name: frozenset(row["support_roles"]) for name, row in rows.items()}
    pairwise_intersections = {
        f"{first}|{second}": sorted(supports[first] & supports[second])
        for first, second in combinations(supports, 2)
    }
    union = frozenset().union(*supports.values())
    partition_checks = {
        "modeled_seven_supports": len(supports) == 7,
        "modeled_each_support_card_eq_four": all(
            len(support) == 4 for support in supports.values()
        ),
        "modeled_supports_pairwise_disjoint": all(
            not overlap for overlap in pairwise_intersections.values()
        ),
        "modeled_support_union_eq_carrier": union == points.keys(),
        "modeled_support_card_sum_eq_carrier_card": (
            sum(map(len, supports.values())) == len(points)
        ),
        "modeled_seven_centers_pairwise_distinct": (
            len({row["center"] for row in rows.values()}) == 7
        ),
    }
    if not all(partition_checks.values()):
        raise ValueError("the seven critical supports do not partition the carrier")

    source_to_row: dict[str, str] = {}
    for source in ORDER:
        containing = [name for name, support in supports.items() if source in support]
        if len(containing) != 1:
            raise ValueError(f"source {source} does not lie in a unique support block")
        source_to_row[source] = containing[0]

    assignments: dict[str, dict[str, Any]] = {}
    for source in ORDER:
        row_name = source_to_row[source]
        row = rows[row_name]
        center = row["center"]
        profile = radial_profile(points, center, frozenset({source}))
        support = supports[row_name]
        checks = {
            "modeled_source_mem_carrier": source in points,
            "modeled_source_mem_selected_support": source in support,
            "modeled_center_mem_carrier_erase_source": (
                center in points and center != source
            ),
            "modeled_selectedAt_is_complete_named_four_class": (
                row["modeled_field_checks"][
                    "modeled_support_eq_complete_ambient_radius_class"
                ]
                and row["modeled_field_checks"]["modeled_support_card_eq_four"]
            ),
            "modeled_no_qfree_max_positive_distance_multiplicity_le_three": (
                profile["maximum_positive_distance_multiplicity"] <= 3
            ),
            "modeled_no_HasNEquidistantPointsAt_4_after_source_deletion": (
                not profile["HasNEquidistantPointsAt_4"]
            ),
            "modeled_selected_shell_loses_exactly_source": (
                len(support - {source}) == 3
            ),
        }
        if not all(checks.values()):
            raise ValueError(f"CriticalShellSystem field failure at source {source}")
        assignments[source] = {
            "source": source,
            "row": row_name,
            "centerAt": center,
            "selectedAt_support_roles": sorted(support),
            "selectedAt_radius_squared": row["radius_squared"],
            "modeled_field_checks": checks,
            "modeled_A_erase_source_radial_profile": profile,
        }

    center_at = {source: value["centerAt"] for source, value in assignments.items()}
    observed_orbit = [EXPECTED_ORBIT[0]]
    for _ in range(len(EXPECTED_ORBIT) - 1):
        observed_orbit.append(center_at[observed_orbit[-1]])
    if tuple(observed_orbit) != EXPECTED_ORBIT:
        raise ValueError("the supplied blocker orbit does not replay")
    cycle = [
        "xv",
        center_at["xv"],
        center_at[center_at["xv"]],
        center_at[center_at[center_at["xv"]]],
    ]
    if cycle != ["xv", "cv", "fp", "xv"]:
        raise ValueError("the xv-cv-fp blocker cycle does not replay")

    return (
        {
            "supports": {name: sorted(support) for name, support in supports.items()},
            "support_union_roles": sorted(union),
            "pairwise_intersections": pairwise_intersections,
            "modeled_partition_checks": partition_checks,
        },
        {
            "source_assignments": assignments,
            "modeled_total_source_count": len(assignments),
            "modeled_all_carrier_sources_assigned_once": set(assignments)
            == set(points),
            "modeled_shellAt_total_finite_table": True,
            "modeled_no_qfree_quantified_over_all_carrier_sources": True,
            "blocker_orbit": observed_orbit,
            "blocker_cycle": cycle,
            "actual_dependent_Lean_CriticalShellSystem_instantiated": False,
        },
    )


def centerwise_has_four_census(
    points: Mapping[str, Point], order: Sequence[str]
) -> dict[str, Any]:
    entries = {center: radial_profile(points, center) for center in order}
    positive = frozenset(
        center
        for center, profile in entries.items()
        if profile["HasNEquidistantPointsAt_4"]
    )
    negative = frozenset(order) - positive
    if positive != EXPECTED_HAS_FOUR_CENTERS:
        raise ValueError("centerwise HasNEquidistantPointsAt 4 census changed")
    return {
        "by_center": entries,
        "centers_satisfying_modeled_HasNEquidistantPointsAt_4": sorted(positive),
        "centers_not_satisfying_modeled_HasNEquidistantPointsAt_4": sorted(negative),
        "satisfying_center_count": len(positive),
        "non_satisfying_center_count": len(negative),
        "expected_eight_twenty_split_replayed": (len(positive), len(negative))
        == (8, 20),
        "modeled_global_HasNEquidistantProperty_4": len(positive) == len(points),
        "actual_CounterexampleData_K4_instantiated": False,
    }


def supplied_discrepancies(
    caps: Mapping[str, Any], rows: Mapping[str, Mapping[str, Any]]
) -> list[dict[str, Any]]:
    discrepancies: list[dict[str, Any]] = []
    observed_caps = caps["cardinalities"]
    if observed_caps != EXPECTED_CAPS:
        discrepancies.append(
            {
                "field": "cap cardinalities (C1,C2,C3)",
                "supplied": EXPECTED_CAPS,
                "observed": observed_caps,
                "reason": (
                    "The retained L3 caps are (5,10,7); c1-c3 enter C1 and "
                    "a1-a3,b1-b3 enter C3, so the exact extension is (8,10,13)"
                ),
            }
        )
    observed_center = rows["Kdelta"]["center"]
    supplied_center = ROW_SPECS["Kdelta"]["supplied_center"]
    if observed_center != supplied_center:
        discrepancies.append(
            {
                "field": "Kdelta complete-fiber center",
                "supplied": supplied_center,
                "observed": observed_center,
                "reason": (
                    "d1,d2,d3 are retained as rotations of delta about xu; "
                    "their exact complete four-fiber is centered at xu, while fq "
                    "has maximum positive-distance multiplicity one"
                ),
            }
        )
    return discrepancies


def certify_model(
    points: Mapping[str, Point] | None = None,
    l3_report: Mapping[str, Any] | None = None,
) -> dict[str, Any]:
    if l3_report is None:
        l3_report, l3_raw = load_l3_certificate()
    else:
        l3_raw = json.dumps(l3_report, indent=2, sort_keys=True).encode() + b"\n"
    carrier = dict(build_points(l3_report) if points is None else points)
    if set(carrier) != set(ORDER) or len(carrier) != 28:
        raise ValueError("the total-system carrier is not the required 28-role set")
    source_contract = validate_source_contract()
    distinctness = distinctness_certificate(carrier, ORDER)
    convexity = convexity_certificate(carrier, ORDER)
    mec = mec_certificate(carrier, ORDER)
    caps = caps_certificate(carrier, ORDER)
    rows = {
        name: critical_row_certificate(carrier, name, spec)
        for name, spec in ROW_SPECS.items()
    }
    partition, system = partition_and_system_certificate(carrier, rows)
    census = centerwise_has_four_census(carrier, ORDER)
    discrepancies = supplied_discrepancies(caps, rows)
    return {
        "schema": SCHEMA,
        "status": STATUS,
        "solver_invoked": False,
        "arithmetic": "exact fractions.Fraction squared-coordinate geometry",
        "input_provenance": {
            "kind": "retained exact S0-I L3 certificate",
            "path": L3_JSON_REPO_PATH,
            "schema": l3_report["schema"],
            "status": l3_report["status"],
            "sha256": hashlib.sha256(l3_raw).hexdigest(),
            "base_branch": "S0-I",
            "base_role_count": 19,
        },
        "source_anchors": SOURCE_ANCHORS,
        "current_source_contract": source_contract,
        "construction": {
            "rotation_formula": (
                "Rot(center,point,t) uses ((1-t^2)/(1+t^2), 2t/(1+t^2))"
            ),
            "extension_rows": {
                name: {
                    "center": spec["center"],
                    "anchor": spec["anchor"],
                    "parameters": {
                        role: fraction_json(parameter)
                        for role, parameter in spec["parameters"].items()
                    },
                }
                for name, spec in EXTENSION_ROWS.items()
            },
        },
        "role_count": len(carrier),
        "cyclic_order": list(ORDER),
        "points": {role: point_json(carrier[role]) for role in ORDER},
        "role_distinctness": distinctness,
        "strict_convexity": convexity,
        "mec": mec,
        "caps": caps,
        "critical_rows": rows,
        "support_partition": partition,
        "critical_shell_system_geometric_model": system,
        "centerwise_HasNEquidistantPointsAt_4_census": census,
        "all_named_finite_CriticalShellSystem_geometry_replayed": True,
        "supplied_value_discrepancies": discrepancies,
        "claim_scope": {
            "total_finite_CriticalShellSystem_geometry": True,
            "actual_typed_Lean_CriticalShellSystem": False,
            "CounterexampleData": False,
            "D.K4": False,
            "D.Minimal": False,
            "full_theorem": False,
            "lean_claim": False,
            "promotion_claim": False,
        },
        "first_unmodeled_next_interface": {
            "name": "typed Lean ingress and CounterexampleData.K4",
            "exact_requirement": (
                "construct the dependent CriticalShellSystem over a typed Finset; "
                "a CounterexampleData lift would additionally require D.K4 at every "
                "carrier center"
            ),
            "observed_obstruction": (
                "the finite total shell table is exact, but only 8 of 28 modeled "
                "carrier centers satisfy HasNEquidistantPointsAt 4, so D.K4 is false"
            ),
        },
    }


def build_report() -> dict[str, Any]:
    return certify_model()


def render_markdown(report: Mapping[str, Any]) -> str:
    rows = []
    for name, row in report["critical_rows"].items():
        rows.append(
            f"| {name} | `{row['center']}` | "
            f"`{{{','.join(row['support_roles'])}}}` | `{row['radius_squared']}` |"
        )
    caps = report["caps"]["cardinalities"]
    census = report["centerwise_HasNEquidistantPointsAt_4_census"]
    discrepancies = report["supplied_value_discrepancies"]
    discrepancy_text = (
        "None."
        if not discrepancies
        else "\n".join(
            f"- `{item['field']}`: supplied `{item['supplied']}`, observed "
            f"`{item['observed']}`. {item['reason']}"
            for item in discrepancies
        )
    )
    return (
        "# Rigid221 S0 total critical-shell-system geometric model\n\n"
        f"**Status:** `{report['status']}`\n\n"
        "**Arithmetic:** exact `fractions.Fraction`; no solver invoked\n\n"
        "**Claim boundary:** exhaustive only for the displayed 28-role finite geometry\n\n"
        "## Exact carrier geometry\n\n"
        f"The carrier has `{report['role_count']}` pairwise distinct strictly convex "
        "roles. The minimum edge/nonincident orientation is "
        f"`{report['strict_convexity']['minimum_orientation']}` at "
        f"`{report['strict_convexity']['minimum_roles']}`. Its exact MEC boundary is "
        f"`{report['mec']['boundary_roles']}` and the recomputed cap cards are "
        f"`({caps['C1']},{caps['C2']},{caps['C3']})`.\n\n"
        "## Seven complete critical rows\n\n"
        "| Row | Center | Complete support | Radius squared |\n"
        "|---|---|---|---:|\n"
        + "\n".join(rows)
        + "\n\nThe seven four-point supports are pairwise disjoint and partition all "
        "28 carrier roles. Every source is assigned to its unique support's center. "
        "Deleting that source leaves maximum positive-distance multiplicity at most "
        "three at the assigned center, replaying the finite `no_qfree` predicate.\n\n"
        "The blocker orbit is `u -> cu -> fw -> xv -> cv -> fp -> xv`, with cycle "
        "`xv -> cv -> fp -> xv`.\n\n"
        "## Centerwise four-point census\n\n"
        f"Exactly `{census['satisfying_center_count']}` centers satisfy the modeled "
        "`HasNEquidistantPointsAt 4` predicate: "
        f"`{census['centers_satisfying_modeled_HasNEquidistantPointsAt_4']}`. The "
        f"other `{census['non_satisfying_center_count']}` do not. Thus the modeled "
        "carrier does not satisfy global `D.K4`.\n\n"
        "## Supplied-value discrepancies\n\n"
        + discrepancy_text
        + "\n\n## Claim boundary\n\n"
        "The current Lean source contract was read directly: `CriticalShellSystem` "
        "has total dependent `shellAt` and `no_qfree` fields, with each selected row "
        "carrying a complete named four-point radius class. This artifact models all "
        "of those finite geometric predicates, but it does not elaborate or construct "
        "the typed Lean structure. `CounterexampleData`, `D.K4`, `D.Minimal`, the "
        "full theorem, and promotion remain false in the claim scope.\n"
    )


def write_json(path: Path, report: Mapping[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(
        json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
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
    if args.output is not None:
        write_json(args.output, report)
    if args.report_output is not None:
        write_json(args.report_output, report)
    if args.markdown_output is not None:
        args.markdown_output.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_output.write_text(render_markdown(report), encoding="utf-8")


if __name__ == "__main__":
    main()
