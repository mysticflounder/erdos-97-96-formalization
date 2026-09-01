# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Independent Fraction verifier for the 28-role total critical-shell model.

No witness producer or earlier verifier is imported.  The S0-I base carrier
and all A/B/C extensions are reconstructed from raw P/Rot formulas.  Every
retained coordinate, convexity value, cap, complete fiber, source assignment,
deletion profile, blocker orbit, and center census is then regenerated.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from collections.abc import Mapping
from fractions import Fraction
from itertools import combinations
from pathlib import Path
from typing import Any

F = Fraction
Point = tuple[F, F]

SCHEMA = "rigid221-s0-total-critical-shell-system-geometric-model/v1"
INPUT_STATUS = "SAT_EXACT_TOTAL_CRITICAL_SHELL_SYSTEM_GEOMETRIC_MODEL"
VERIFIED_STATUS = "VERIFIED_SAT_EXACT_TOTAL_CRITICAL_SHELL_SYSTEM_GEOMETRIC_MODEL"
L3_SCHEMA = "rigid221-s0-l3-field-level-geometric-packet/v1"
L3_STATUS = "SAT_EXACT_L3_FIELD_LEVEL_GEOMETRIC_PACKET"
L3_REPO_PATH = (
    "docs/computation/rigid221-s0-coupled-two-row-residue-lantern-20260831/"
    "solver/s0-true-cap-wave2-l3-witnesses.json"
)
MEC_CENTER = (F(137, 210), F(0))
MEC_RADIUS2 = F(18769, 44100)
TRIPLE = ("delta", "xv", "O")

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
        "parameters": {"b1": F(-5, 200), "b2": F(-3, 200), "b3": F(-1, 200)},
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
    "Kdelta": {"center": "xu", "labels": ("delta", "d1", "d2", "d3")},
    "F1": {"center": "xv", "labels": ("O", "fp", "fq", "fw")},
}
EXPECTED_FOUR_CENTERS = frozenset({"O", "cu", "cv", "delta", "fp", "fw", "xu", "xv"})
EXPECTED_ORBIT = ("u", "cu", "fw", "xv", "cv", "fp", "xv")
SUPPLIED_CAPS = {"C1": 8, "C2": 7, "C3": 16}

CLAIM_SCOPE = {
    "total_finite_CriticalShellSystem_geometry": True,
    "actual_typed_Lean_CriticalShellSystem": False,
    "CounterexampleData": False,
    "D.K4": False,
    "D.Minimal": False,
    "full_theorem": False,
    "lean_claim": False,
    "promotion_claim": False,
}
FIRST_UNMODELED = {
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
}


class VerificationError(ValueError):
    """The retained model is malformed or fails independent exact replay."""


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


def scale(k: F, point: Point) -> Point:
    return k * point[0], k * point[1]


def dist2(a: Point, b: Point) -> F:
    x, y = sub(a, b)
    return x * x + y * y


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


def on_arc(apex: Point, endpoint1: Point, endpoint2: Point, q: Point) -> bool:
    return orient(q, endpoint1, endpoint2) * orient(apex, endpoint1, endpoint2) <= 0


def base_points() -> dict[str, Point]:
    o = (F(0), F(0))
    delta, v, u = p(F(-4, 11)), p(F(-10, 29)), p(F(-6, 19))
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
    for role, parameter in {
        "fq": F(1, 1000),
        "fw": F(1, 500),
        "fp": F(3, 1000),
    }.items():
        points[role] = rotate(xv, o, parameter)
    for role, parameter in {
        "d1": F(-1, 1000),
        "d2": F(-1, 500),
        "d3": F(-3, 1000),
    }.items():
        points[role] = rotate(xu, delta, parameter)
    require(set(points) == set(BASE_ORDER), "raw S0-I formula carrier mismatch")
    return points


def all_points() -> dict[str, Point]:
    points = base_points()
    for row in EXTENSION_ROWS.values():
        for role, parameter in row["parameters"].items():
            points[role] = rotate(
                points[row["center"]], points[row["anchor"]], parameter
            )
    require(
        set(points) == set(ORDER) and len(points) == 28,
        "28-role formula carrier mismatch",
    )
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
) -> dict[str, Any]:
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
    maximum = max((entry["multiplicity"] for entry in entries), default=0)
    histogram = Counter(entry["multiplicity"] for entry in entries)
    return {
        "positive_distance_role_count": sum(entry["multiplicity"] for entry in entries),
        "distinct_positive_radius_count": len(entries),
        "maximum_positive_distance_multiplicity": maximum,
        "multiplicity_histogram": {
            str(value): histogram[value] for value in sorted(histogram)
        },
        "radius_classes": entries,
        "HasNEquidistantPointsAt_4": maximum >= 4,
    }


def source_contract(repository: Path) -> dict[str, Any]:
    lean_path = repository / "lean/Erdos9796Proof/P97/U1CarrierInjection.lean"
    upstream_path = (
        repository / "lean/.lake/packages/formal_conjectures/"
        "FormalConjectures/ErdosProblems/97.lean"
    )
    try:
        lean_raw, upstream_raw = lean_path.read_bytes(), upstream_path.read_bytes()
    except OSError as error:
        raise VerificationError(f"cannot read Lean source contract: {error}") from error
    lean_text, upstream_text = lean_raw.decode(), upstream_raw.decode()
    fragments = (
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
    require(
        all(fragment in lean_text for fragment in fragments)
        and "def HasNEquidistantPointsAt (n : ℕ) (A : Finset ℝ²)" in upstream_text,
        "current Lean source contract changed",
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
        "source_validation_scope": "direct current-source byte scan; no Lean elaboration or theorem claim",
    }


def distinctness(points: Mapping[str, Point]) -> dict[str, Any]:
    distances = {
        f"{a}|{b}": fjson(dist2(points[a], points[b]))
        for a, b in combinations(ORDER, 2)
    }
    require(
        all(F(value) > 0 for value in distances.values()), "role distinctness fails"
    )
    return {
        "all_roles_pairwise_distinct": True,
        "pair_count": len(distances),
        "pairwise_squared_distances": distances,
    }


def convexity(points: Mapping[str, Point]) -> dict[str, Any]:
    values: list[tuple[F, str, str, str]] = []
    checks: dict[str, dict[str, str]] = {}
    for index, first in enumerate(ORDER):
        second = ORDER[(index + 1) % len(ORDER)]
        edge = f"{first}->{second}"
        checks[edge] = {}
        for other in ORDER:
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


def mec(points: Mapping[str, Point]) -> dict[str, Any]:
    slacks = {role: MEC_RADIUS2 - dist2(MEC_CENTER, points[role]) for role in ORDER}
    boundary = frozenset(role for role, slack in slacks.items() if slack == 0)
    require(all(value >= 0 for value in slacks.values()), "MEC enclosure fails")
    require(boundary == frozenset(TRIPLE), "MEC boundary fails")
    weights = {
        TRIPLE[0]: MEC_RADIUS2,
        TRIPLE[1]: MEC_RADIUS2,
        TRIPLE[2]: 1 - 2 * MEC_RADIUS2,
    }
    barycenter = (
        sum((weights[role] * points[role][0] for role in weights), start=F(0)),
        sum((weights[role] * points[role][1] for role in weights), start=F(0)),
    )
    require(
        barycenter == MEC_CENTER and all(value > 0 for value in weights.values()),
        "MEC minimality fails",
    )
    return {
        "center": pjson(MEC_CENTER),
        "radius_squared": fjson(MEC_RADIUS2),
        "all_carrier_points_enclosed": True,
        "enclosure_slacks": {role: fjson(value) for role, value in slacks.items()},
        "boundary_roles": sorted(boundary),
        "boundary_exactly_expected_triple": True,
        "positive_boundary_weights": {
            role: fjson(value) for role, value in weights.items()
        },
        "weighted_boundary_barycenter": pjson(barycenter),
    }


def caps(points: Mapping[str, Point]) -> dict[str, Any]:
    names = ("C1", "C2", "C3")
    frames = (
        (TRIPLE[0], TRIPLE[1], TRIPLE[2]),
        (TRIPLE[1], TRIPLE[2], TRIPLE[0]),
        (TRIPLE[2], TRIPLE[0], TRIPLE[1]),
    )
    truth = {
        name: {
            role: on_arc(points[a], points[b], points[c], points[role])
            for role in ORDER
        }
        for name, (a, b, c) in zip(names, frames, strict=True)
    }
    cap_sets = tuple(
        frozenset(role for role in ORDER if truth[name][role]) for name in names
    )
    counts = {role: sum(role in cap for cap in cap_sets) for role in ORDER}
    require(
        all(counts[role] == (2 if role in TRIPLE else 1) for role in ORDER),
        "CapTriple multiplicity fails",
    )
    endpoints = {
        vertex: {name: truth[name][role] for name in names}
        for vertex, role in zip(("v1", "v2", "v3"), TRIPLE, strict=True)
    }
    require(
        endpoints
        == {
            "v1": {"C1": False, "C2": True, "C3": True},
            "v2": {"C1": True, "C2": False, "C3": True},
            "v3": {"C1": True, "C2": True, "C3": False},
        },
        "CapTriple endpoints fail",
    )
    return {
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
        "endpoint_pattern": endpoints,
    }


def critical_row(points: Mapping[str, Point], name: str) -> dict[str, Any]:
    spec = ROW_SPECS[name]
    center, labels = spec["center"], tuple(spec["labels"])
    support = frozenset(labels)
    radius2 = dist2(points[center], points[labels[0]])
    distances = {role: fjson(dist2(points[center], points[role])) for role in labels}
    complete = complete_fiber(points, center, radius2)
    checks = {
        "modeled_center_mem_carrier_erase_every_source": all(
            center in points and center != q for q in support
        ),
        "modeled_squared_radius_positive": radius2 > 0,
        "modeled_positive_real_radius_exists": radius2 > 0,
        "modeled_support_eq_complete_ambient_radius_class": complete == support,
        "modeled_support_card_eq_four": len(support) == 4,
        "modeled_every_source_mem_support": all(q in support for q in support),
        "modeled_four_labels_pairwise_distinct": all(
            points[a] != points[b] for a, b in combinations(labels, 2)
        ),
        "modeled_support_eq_four_named_labels": frozenset(labels) == support,
        "modeled_all_four_squared_distances_equal": all(
            F(value) == radius2 for value in distances.values()
        ),
    }
    require(all(checks.values()), f"critical row {name} fails")
    return {
        "center": center,
        "labels": list(labels),
        "support_roles": sorted(support),
        "radius_squared": fjson(radius2),
        "squared_distances": distances,
        "complete_ambient_fiber_roles": sorted(complete),
        "modeled_field_checks": checks,
        "actual_typed_CriticalSelectedFourClass_instantiated": False,
    }


def partition_system(
    points: Mapping[str, Point],
    rows: Mapping[str, Mapping[str, Any]],
) -> tuple[dict[str, Any], dict[str, Any]]:
    supports = {name: frozenset(row["support_roles"]) for name, row in rows.items()}
    intersections = {
        f"{a}|{b}": sorted(supports[a] & supports[b])
        for a, b in combinations(supports, 2)
    }
    union = frozenset().union(*supports.values())
    partition_checks = {
        "modeled_seven_supports": len(supports) == 7,
        "modeled_each_support_card_eq_four": all(
            len(support) == 4 for support in supports.values()
        ),
        "modeled_supports_pairwise_disjoint": all(
            not value for value in intersections.values()
        ),
        "modeled_support_union_eq_carrier": union == points.keys(),
        "modeled_support_card_sum_eq_carrier_card": sum(map(len, supports.values()))
        == len(points),
        "modeled_seven_centers_pairwise_distinct": len(
            {row["center"] for row in rows.values()}
        )
        == 7,
    }
    require(all(partition_checks.values()), "seven-support partition fails")
    assignments: dict[str, dict[str, Any]] = {}
    for source in ORDER:
        containing = [name for name, support in supports.items() if source in support]
        require(
            len(containing) == 1, f"source assignment is not total/unique at {source}"
        )
        name, support = containing[0], supports[containing[0]]
        row, center = rows[name], rows[name]["center"]
        profile = radial_profile(points, center, frozenset({source}))
        checks = {
            "modeled_source_mem_carrier": source in points,
            "modeled_source_mem_selected_support": source in support,
            "modeled_center_mem_carrier_erase_source": center in points
            and center != source,
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
            "modeled_selected_shell_loses_exactly_source": len(support - {source}) == 3,
        }
        require(all(checks.values()), f"deletion no_qfree fails at {source}")
        assignments[source] = {
            "source": source,
            "row": name,
            "centerAt": center,
            "selectedAt_support_roles": sorted(support),
            "selectedAt_radius_squared": row["radius_squared"],
            "modeled_field_checks": checks,
            "modeled_A_erase_source_radial_profile": profile,
        }
    center_at = {source: row["centerAt"] for source, row in assignments.items()}
    orbit = [EXPECTED_ORBIT[0]]
    for _ in range(len(EXPECTED_ORBIT) - 1):
        orbit.append(center_at[orbit[-1]])
    cycle = [
        "xv",
        center_at["xv"],
        center_at[center_at["xv"]],
        center_at[center_at[center_at["xv"]]],
    ]
    require(tuple(orbit) == EXPECTED_ORBIT, "blocker orbit fails")
    require(cycle == ["xv", "cv", "fp", "xv"], "blocker cycle fails")
    return (
        {
            "supports": {name: sorted(support) for name, support in supports.items()},
            "support_union_roles": sorted(union),
            "pairwise_intersections": intersections,
            "modeled_partition_checks": partition_checks,
        },
        {
            "source_assignments": assignments,
            "modeled_total_source_count": len(assignments),
            "modeled_all_carrier_sources_assigned_once": set(assignments)
            == set(points),
            "modeled_shellAt_total_finite_table": True,
            "modeled_no_qfree_quantified_over_all_carrier_sources": True,
            "blocker_orbit": orbit,
            "blocker_cycle": cycle,
            "actual_dependent_Lean_CriticalShellSystem_instantiated": False,
        },
    )


def census(points: Mapping[str, Point]) -> dict[str, Any]:
    by_center = {center: radial_profile(points, center) for center in ORDER}
    positive = frozenset(
        center
        for center, profile in by_center.items()
        if profile["HasNEquidistantPointsAt_4"]
    )
    negative = frozenset(ORDER) - positive
    require(
        positive == EXPECTED_FOUR_CENTERS and (len(positive), len(negative)) == (8, 20),
        "8/20 centerwise K4 census fails",
    )
    return {
        "by_center": by_center,
        "centers_satisfying_modeled_HasNEquidistantPointsAt_4": sorted(positive),
        "centers_not_satisfying_modeled_HasNEquidistantPointsAt_4": sorted(negative),
        "satisfying_center_count": 8,
        "non_satisfying_center_count": 20,
        "expected_eight_twenty_split_replayed": True,
        "modeled_global_HasNEquidistantProperty_4": False,
        "actual_CounterexampleData_K4_instantiated": False,
    }


def discrepancy_records(
    cap_report: Mapping[str, Any], rows: Mapping[str, Mapping[str, Any]]
) -> list[dict[str, Any]]:
    records: list[dict[str, Any]] = []
    observed_caps = cap_report["cardinalities"]
    if observed_caps != SUPPLIED_CAPS:
        records.append(
            {
                "field": "cap cardinalities (C1,C2,C3)",
                "supplied": SUPPLIED_CAPS,
                "observed": observed_caps,
                "reason": (
                    "The retained L3 caps are (5,10,7); c1-c3 enter C1 and "
                    "a1-a3,b1-b3 enter C3, so the exact extension is (8,10,13)"
                ),
            }
        )
    if rows["Kdelta"]["center"] != "fq":
        records.append(
            {
                "field": "Kdelta complete-fiber center",
                "supplied": "fq",
                "observed": rows["Kdelta"]["center"],
                "reason": (
                    "d1,d2,d3 are retained as rotations of delta about xu; "
                    "their exact complete four-fiber is centered at xu, while fq "
                    "has maximum positive-distance multiplicity one"
                ),
            }
        )
    require(
        observed_caps == {"C1": 8, "C2": 10, "C3": 13}, "corrected cap hypothesis fails"
    )
    require(
        rows["Kdelta"]["center"] == "xu"
        and rows["Kdelta"]["radius_squared"] == "80656/54389"
        and radial_profile(all_points(), "fq")["maximum_positive_distance_multiplicity"]
        == 1,
        "corrected Kdelta hypothesis fails",
    )
    return records


def expected_model(repository: Path) -> dict[str, Any]:
    points = all_points()
    cap_report = caps(points)
    rows = {name: critical_row(points, name) for name in ROW_SPECS}
    partition, system = partition_system(points, rows)
    center_census = census(points)
    return {
        "source_anchors": SOURCE_ANCHORS,
        "current_source_contract": source_contract(repository),
        "construction": {
            "rotation_formula": "Rot(center,point,t) uses ((1-t^2)/(1+t^2), 2t/(1+t^2))",
            "extension_rows": {
                name: {
                    "center": row["center"],
                    "anchor": row["anchor"],
                    "parameters": {
                        role: fjson(value) for role, value in row["parameters"].items()
                    },
                }
                for name, row in EXTENSION_ROWS.items()
            },
        },
        "role_count": 28,
        "cyclic_order": list(ORDER),
        "points": {role: pjson(points[role]) for role in ORDER},
        "role_distinctness": distinctness(points),
        "strict_convexity": convexity(points),
        "mec": mec(points),
        "caps": cap_report,
        "critical_rows": rows,
        "support_partition": partition,
        "critical_shell_system_geometric_model": system,
        "centerwise_HasNEquidistantPointsAt_4_census": center_census,
        "all_named_finite_CriticalShellSystem_geometry_replayed": True,
        "supplied_value_discrepancies": discrepancy_records(cap_report, rows),
        "claim_scope": CLAIM_SCOPE,
        "first_unmodeled_next_interface": FIRST_UNMODELED,
    }


def require_equal(actual: object, expected: object, label: str) -> None:
    require(actual == expected, f"{label} mismatch")


def verify_document(
    document: object,
    *,
    certificate_path: Path | None = None,
    repository: Path | None = None,
) -> dict[str, Any]:
    require(isinstance(document, dict), "model is not an object")
    top_keys = {
        "schema",
        "status",
        "solver_invoked",
        "arithmetic",
        "input_provenance",
        "source_anchors",
        "current_source_contract",
        "construction",
        "role_count",
        "cyclic_order",
        "points",
        "role_distinctness",
        "strict_convexity",
        "mec",
        "caps",
        "critical_rows",
        "support_partition",
        "critical_shell_system_geometric_model",
        "centerwise_HasNEquidistantPointsAt_4_census",
        "all_named_finite_CriticalShellSystem_geometry_replayed",
        "supplied_value_discrepancies",
        "claim_scope",
        "first_unmodeled_next_interface",
    }
    require(set(document) == top_keys, "top-level keys/status injection mismatch")
    require_equal(document["schema"], SCHEMA, "schema")
    require(document["status"] == INPUT_STATUS, "status upgrade or mutation")
    require(document["solver_invoked"] is False, "solver invocation mutation")
    require_equal(
        document["arithmetic"],
        "exact fractions.Fraction squared-coordinate geometry",
        "arithmetic",
    )
    if certificate_path is None:
        certificate_path = Path(__file__).with_name(
            "s0-total-critical-system-wave1-model.json"
        )
    if repository is None:
        repository = Path(__file__).resolve().parents[4]
    l3_path = certificate_path.with_name("s0-true-cap-wave2-l3-witnesses.json")
    require(l3_path.is_file(), "retained L3 input is missing")
    l3_raw = l3_path.read_bytes()
    l3 = json.loads(l3_raw)
    require(
        isinstance(l3, dict)
        and l3.get("schema") == L3_SCHEMA
        and l3.get("status") == L3_STATUS,
        "retained L3 status/schema mismatch",
    )
    branch = l3.get("branches", {}).get("S0-I")
    require(
        isinstance(branch, dict)
        and branch.get("role_count") == 19
        and tuple(branch.get("cyclic_order", ())) == BASE_ORDER,
        "retained S0-I L3 inventory mismatch",
    )
    expected_base = {role: pjson(point) for role, point in base_points().items()}
    require_equal(
        branch.get("points"),
        {role: expected_base[role] for role in BASE_ORDER},
        "retained S0-I raw-formula coordinates",
    )
    provenance = {
        "kind": "retained exact S0-I L3 certificate",
        "path": L3_REPO_PATH,
        "schema": L3_SCHEMA,
        "status": L3_STATUS,
        "sha256": hashlib.sha256(l3_raw).hexdigest(),
        "base_branch": "S0-I",
        "base_role_count": 19,
    }
    require_equal(document["input_provenance"], provenance, "input provenance")
    expected = expected_model(repository)
    for key, value in expected.items():
        label = {
            "points": "coordinates",
            "support_partition": "support partition",
            "critical_shell_system_geometric_model": "total assignments/deletion blockers/orbit",
            "centerwise_HasNEquidistantPointsAt_4_census": "8/20 centerwise census",
            "supplied_value_discrepancies": "corrected discrepancy records",
            "claim_scope": "claim-scope upgrade",
        }.get(key, key)
        require_equal(document[key], value, label)
    return {
        "status": VERIFIED_STATUS,
        "total_finite_CriticalShellSystem_geometry": True,
        "actual_typed_Lean_CriticalShellSystem": False,
        "CounterexampleData": False,
        "K4": False,
        "Minimal": False,
        "full_theorem": False,
        "promotion_claim": False,
    }


def load_and_verify(path: Path) -> dict[str, Any]:
    try:
        document = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as error:
        raise VerificationError(f"cannot read model: {error}") from error
    return verify_document(document, certificate_path=path)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "certificate",
        nargs="?",
        type=Path,
        default=Path(__file__).with_name("s0-total-critical-system-wave1-model.json"),
    )
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = load_and_verify(args.certificate)
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(
            json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
    print(VERIFIED_STATUS)


if __name__ == "__main__":
    main()
