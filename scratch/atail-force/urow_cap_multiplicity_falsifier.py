#!/usr/bin/env python3
"""Bounded falsifier audit for ``URowCapMultiplicityFields``.

The live proposition asks for one indexed cap containing both ``p`` and the
chosen critical ``u``-row center, with at least two dangerous row-support
points outside that same cap.  This checker evaluates that literal finite-set
predicate in already-saved artifacts.  It does not solve for a new model and
does not promote any relaxed artifact to a live ``CounterexampleData`` model.

Two small serialization gaps are repaired without adding hypotheses:

* the current common-system CEGAR checkpoint omits its fixed case labels and
  cap sets, so they are recovered from the checked-in ``CASE_SEEDS`` and the
  canonical profile frame; and
* the W16/W20 result files store cap sizes rather than memberships, so cap
  memberships are rematched to the exact witness source coordinates.

Every reported witness is then substituted into the pre-encoding set
predicate.  No SAT/SMT/CAS engine is invoked by this script.
"""

from __future__ import annotations

import argparse
import ast
import hashlib
import importlib.util
import json
import math
from collections import Counter
from pathlib import Path
from typing import Any, Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
OUTPUT = HERE / "urow_cap_multiplicity_falsifier.json"

COMMON_CHECKPOINT = HERE / "common_system_metric_probe.json"
QUERY_SOURCE = HERE / "second_center_query" / "query.py"
EXACT_RESIDUAL = HERE / "residual_456_exact_witness.json"
GLOBAL_SHADOWS = HERE / "global_count_boundary" / "shadows.json"
GLOBAL_MANIFEST = HERE / "global_count_boundary" / "manifest.json"

RING_CASES = (
    {
        "name": "W16a",
        "source": ROOT / "scratch/d3-formulation/t9_wit_m8_1.4534.json",
        "results": ROOT / "scratch/d3-formulation/candidateB/results_W16a.json",
    },
    {
        "name": "W16b",
        "source": ROOT / "scratch/d3-formulation/t9_wit_m8_2.2853.json",
        "results": ROOT / "scratch/d3-formulation/candidateB/results_W16b.json",
    },
    {
        "name": "W20",
        "source": ROOT / "scratch/d3-formulation/t9_wit_m10_0.6180.json",
        "results": ROOT / "scratch/d3-formulation/candidateB/results_W20.json",
    },
)


class AuditError(AssertionError):
    """Fail-closed rejection of malformed or overclaimed saved data."""


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AuditError(message)


def load_json(path: Path) -> Any:
    with path.open(encoding="utf-8") as handle:
        return json.load(handle)


def sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def parse_metric_rows(encoded: Sequence[str]) -> dict[int, frozenset[int]]:
    rows: dict[int, frozenset[int]] = {}
    for item in encoded:
        center_text, support_text = item.split(":", maxsplit=1)
        center = int(center_text)
        support = frozenset(int(label) for label in support_text.split(","))
        require(center not in rows, f"duplicate metric row at center {center}")
        require(len(support) == 4, f"row {center} is not a four-set")
        require(center not in support, f"row {center} contains its center")
        rows[center] = support
    return rows


def canonical_caps(profile: Sequence[int]) -> dict[str, frozenset[int]]:
    """Reconstruct the fixed ``0,1,2`` Moser-frame cap labeling.

    This is the frame used by ``census.multi_center.multi_center_census``:
    ``S`` has endpoints 1,2; ``O1`` has endpoints 0,2; and ``O2`` has
    endpoints 0,1.  Interior labels are consecutive and disjoint.
    """

    s_size, o1_size, o2_size = (int(value) for value in profile)
    next_label = 3
    s_interior = range(next_label, next_label + s_size - 2)
    next_label += s_size - 2
    o1_interior = range(next_label, next_label + o1_size - 2)
    next_label += o1_size - 2
    o2_interior = range(next_label, next_label + o2_size - 2)
    next_label += o2_size - 2
    require(next_label == sum(profile) - 3, "profile does not define a card-n cap frame")
    caps = {
        "S": frozenset({1, 2, *s_interior}),
        "O1": frozenset({0, 2, *o1_interior}),
        "O2": frozenset({0, 1, *o2_interior}),
    }
    validate_cap_sets(caps, next_label, sorted(map(int, profile)))
    require(caps["S"] & caps["O1"] == {2}, "canonical S/O1 endpoint mismatch")
    require(caps["S"] & caps["O2"] == {1}, "canonical S/O2 endpoint mismatch")
    require(caps["O1"] & caps["O2"] == {0}, "canonical O1/O2 endpoint mismatch")
    return caps


def validate_cap_sets(
    caps: Mapping[str, frozenset[int]], n: int, expected_sizes: Sequence[int]
) -> None:
    require(set(caps) == {"S", "O1", "O2"}, "cap names are not S/O1/O2")
    require(sorted(map(len, caps.values())) == list(expected_sizes), "cap profile mismatch")
    require(set().union(*caps.values()) == set(range(n)), "caps do not cover the carrier")
    require(len(caps["S"] & caps["O1"]) == 1, "S/O1 endpoint mismatch")
    require(len(caps["S"] & caps["O2"]) == 1, "S/O2 endpoint mismatch")
    require(len(caps["O1"] & caps["O2"]) == 1, "O1/O2 endpoint mismatch")
    require(not (caps["S"] & caps["O1"] & caps["O2"]), "triple cap intersection")


def evaluate_fields(
    *,
    caps: Mapping[str, frozenset[int]],
    p: int,
    center: int,
    support: frozenset[int],
    dangerous: frozenset[int],
) -> dict[str, Any]:
    require(len(support) == 4, "u-row support is not a four-set")
    require(len(dangerous) == 4, "dangerous support is not a four-set")
    cap_reports: list[dict[str, Any]] = []
    for name in ("S", "O1", "O2"):
        cap = caps[name]
        dangerous_outside = dangerous - cap
        row_dangerous_outside = support & dangerous_outside
        cap_reports.append(
            {
                "cap": name,
                "contains_p": p in cap,
                "contains_urow_center": center in cap,
                "is_common_cap": p in cap and center in cap,
                "dangerous_outside": sorted(dangerous_outside),
                "urow_dangerous_outside": sorted(row_dangerous_outside),
                "multiplicity": len(row_dangerous_outside),
            }
        )
    common = [report for report in cap_reports if report["is_common_cap"]]
    center_cap_support_counts = {
        name: len(support & cap) for name, cap in caps.items() if center in cap
    }
    holds = any(report["multiplicity"] >= 2 for report in common)
    direct = any(
        p in cap
        and center in cap
        and len(support & (dangerous - cap)) >= 2
        for cap in caps.values()
    )
    require(holds == direct, "independent literal predicate cross-check failed")
    if holds:
        failure_kind = None
    elif not common:
        failure_kind = "NO_COMMON_CAP"
    else:
        failure_kind = "DANGEROUS_MULTIPLICITY_LT_TWO_IN_EVERY_COMMON_CAP"
    return {
        "p": p,
        "urow_center": center,
        "urow_support": sorted(support),
        "dangerous": sorted(dangerous),
        "cap_reports": cap_reports,
        "common_cap_count": len(common),
        "first_conjunct_common_cap": bool(common),
        "second_conjunct_multiplicity_in_a_common_cap": any(
            report["multiplicity"] >= 2 for report in common
        ),
        "center_cap_support_counts": center_cap_support_counts,
        "generic_selected_row_center_cap_le_two": all(
            count <= 2 for count in center_cap_support_counts.values()
        ),
        "large_caps": [name for name, cap in caps.items() if len(cap) >= 5],
        "no_M44_cardinality_consequence_two_large_caps": sum(
            len(cap) >= 5 for cap in caps.values()
        )
        >= 2,
        "holds": holds,
        "failure_kind": failure_kind,
    }


def evaluator_smoke_tests() -> int:
    caps = {
        "S": frozenset({0, 1, 2}),
        "O1": frozenset({0, 3, 4}),
        "O2": frozenset({2, 4, 5}),
    }
    support = frozenset({1, 3, 4, 5})
    dangerous = frozenset({1, 2, 3, 5})
    true_case = evaluate_fields(
        caps=caps, p=0, center=1, support=support, dangerous=dangerous
    )
    no_common = evaluate_fields(
        caps=caps, p=1, center=4, support=support, dangerous=dangerous
    )
    low_multiplicity = evaluate_fields(
        caps=caps,
        p=0,
        center=3,
        support=frozenset({0, 1, 4, 6}),
        dangerous=dangerous,
    )
    require(true_case["holds"], "positive evaluator smoke case failed")
    require(no_common["failure_kind"] == "NO_COMMON_CAP", "no-common smoke failed")
    require(
        low_multiplicity["failure_kind"]
        == "DANGEROUS_MULTIPLICITY_LT_TWO_IN_EVERY_COMMON_CAP",
        "low-multiplicity smoke failed",
    )
    return 3


def read_query_case_seeds() -> list[dict[str, Any]]:
    tree = ast.parse(QUERY_SOURCE.read_text(encoding="utf-8"), filename=str(QUERY_SOURCE))
    for node in tree.body:
        if isinstance(node, ast.Assign) and any(
            isinstance(target, ast.Name) and target.id == "CASE_SEEDS"
            for target in node.targets
        ):
            value = ast.literal_eval(node.value)
            seeds = [dict(seed) for seed in value]
            require(len(seeds) == 2, "expected two fixed query seeds")
            return seeds
    raise AuditError("CASE_SEEDS was not found")


def seed_by_profile(seeds: Sequence[Mapping[str, Any]], profile: Sequence[int]) -> Mapping[str, Any]:
    matches = [seed for seed in seeds if tuple(seed["profile"]) == tuple(profile)]
    require(len(matches) == 1, f"profile {tuple(profile)} does not select one seed")
    return matches[0]


def validate_labels(raw: Mapping[str, Any], n: int) -> dict[str, int]:
    require(set(raw) == {"p", "q", "t1", "t2", "t3", "u"}, "label names drifted")
    labels = {str(name): int(value) for name, value in raw.items()}
    require(len(set(labels.values())) == 6, "named labels are not pairwise distinct")
    require(all(0 <= value < n for value in labels.values()), "named label leaves carrier")
    return labels


def dangerous_of(labels: Mapping[str, int]) -> frozenset[int]:
    return frozenset(labels[name] for name in ("q", "t1", "t2", "t3"))


def audit_common_checkpoint(seeds: Sequence[Mapping[str, Any]]) -> list[dict[str, Any]]:
    document = load_json(COMMON_CHECKPOINT)
    require(
        document["schema"] == "p97-atail-common-critical-system-metric-cegar-v2",
        "common checkpoint schema drifted",
    )
    reports: list[dict[str, Any]] = []
    for case in document["cases"]:
        profile = tuple(int(value) for value in case["profile"])
        seed = seed_by_profile(seeds, profile)
        n = sum(profile) - 3
        labels = validate_labels(seed["labels"], n)
        dangerous = dangerous_of(labels)
        caps = canonical_caps(profile)
        require(case["rounds"], "common checkpoint has no saved rounds")
        final_round = case["rounds"][-1]
        assignment = {row["name"]: row for row in final_round["assignment"]}
        require(len(assignment) == len(final_round["assignment"]), "duplicate row name")
        system_names = {f"system:{source}" for source in range(n)}
        require(system_names <= set(assignment), "common system omits a source row")
        supports_at_center: dict[int, frozenset[int]] = {}
        for source in range(n):
            row = assignment[f"system:{source}"]
            center = int(row["center"])
            support = frozenset(int(value) for value in row["support"])
            require(row["exact"] is True, "system row is not marked exact")
            require(len(support) == 4 and center not in support, "malformed exact row")
            require(source in support and center != source, "system source/blocker incidence fails")
            if center in supports_at_center:
                require(supports_at_center[center] == support, "same-center support coupling fails")
            supports_at_center[center] = support
        t2_row = assignment["supplied:t2"]
        require(int(t2_row["center"]) == labels["p"], "supplied t2 center is not p")
        require(
            frozenset(map(int, t2_row["support"])) == dangerous,
            "supplied t2 support is not dangerous",
        )
        urow = assignment[f"system:{labels['u']}"]
        supplied_u = assignment["supplied:u"]
        require(
            int(urow["center"]) == int(supplied_u["center"])
            and frozenset(map(int, urow["support"]))
            == frozenset(map(int, supplied_u["support"])),
            "saved supplied/system u-row provenance disagrees",
        )
        evaluation = evaluate_fields(
            caps=caps,
            p=labels["p"],
            center=int(urow["center"]),
            support=frozenset(map(int, urow["support"])),
            dangerous=dangerous,
        )
        reports.append(
            {
                "profile": list(profile),
                "round": int(final_round["round"]),
                "assignment_sha256": final_round["assignment_sha256"],
                "labels_recovered_from": str(QUERY_SOURCE.relative_to(ROOT)),
                "caps_materialized": {name: sorted(cap) for name, cap in caps.items()},
                "evaluation": evaluation,
                "epistemic_status": "EMPIRICALLY_VERIFIED_EXACT_WITHIN_FINITE_NECESSARY_CONDITION_SHADOW",
                "target_faithful": False,
                "fidelity_boundary": dict(document["scope"]),
            }
        )
    return reports


def audit_exact_residual(seeds: Sequence[Mapping[str, Any]]) -> dict[str, Any]:
    document = load_json(EXACT_RESIDUAL)
    require(document["schema"] == "p97-atail-residual-456-exact-witness-v1", "residual schema")
    profile = tuple(int(value) for value in document["source"]["profile"])
    seed = seed_by_profile(seeds, profile)
    labels = validate_labels(seed["labels"], sum(profile) - 3)
    dangerous = dangerous_of(labels)
    caps = {
        name: frozenset(map(int, document["cap_arc_audit"]["cap_labels"][name]))
        for name in ("S", "O1", "O2")
    }
    validate_cap_sets(caps, 12, sorted(profile))
    require(caps == canonical_caps(profile), "residual cap labels differ from fixed frame")
    rows = parse_metric_rows(document["source"]["metric_rows"])
    require(rows[labels["p"]] == dangerous, "exact residual p-row is not dangerous")
    blocker = {
        int(source): int(center)
        for source, center in document["critical_shell_audit"]["blocker_of_source"].items()
    }
    require(set(blocker) == set(range(12)), "residual blocker map is not total")
    for source, center in blocker.items():
        require(center in rows, f"residual blocker center {center} has no exact row")
        require(center != source and source in rows[center], "residual blocker incidence fails")
    ucenter = blocker[labels["u"]]
    evaluation = evaluate_fields(
        caps=caps,
        p=labels["p"],
        center=ucenter,
        support=rows[ucenter],
        dangerous=dangerous,
    )
    source_path = ROOT / document["source"]["path"]
    require(sha256_file(source_path) == document["source"]["sha256"], "residual source SHA drifted")
    require(
        document["exact_row_and_convex_verification"]["support_distances_squared_equal_one"] == 16,
        "residual exact-row certificate count drifted",
    )
    require(
        document["mec_audit"]["outside_labels"],
        "residual unexpectedly became a valid MEC frame",
    )
    return {
        "profile": list(profile),
        "residual_round": document["source"]["residual_round"],
        "source_assignment_sha256": document["source"]["assignment_sha256"],
        "labels_recovered_from": str(QUERY_SOURCE.relative_to(ROOT)),
        "caps": {name: sorted(cap) for name, cap in caps.items()},
        "evaluation": evaluation,
        "epistemic_status": "EMPIRICALLY_VERIFIED_BY_EXACT_BIQUADRATIC_AND_RATIONAL_INTERVAL_CHECKER",
        "target_faithful": False,
        "strongest_realized_fields": [
            "strict convex independent carrier",
            "three ordered cap memberships",
            "four exact Euclidean four-point rows",
            "source-indexed deletion-critical blocker map",
            "nonobtuse named Moser triangle",
        ],
        "missing_live_fields": [
            "minimum-enclosing-circle disk containment",
            "K4 or FaithfulCarrierPattern at every carrier center",
            "the full live dangerous/full-filter/no-M44 package",
        ],
        "mec_outside_labels": document["mec_audit"]["outside_labels"],
        "scope": document["scope"],
    }


def audit_global_shadows() -> list[dict[str, Any]]:
    shadows = load_json(GLOBAL_SHADOWS)
    manifest = load_json(GLOBAL_MANIFEST)
    require(shadows["schema"] == "p97-atail-global-count-boundary-shadows-v1", "shadow schema")
    require(manifest["scope"]["target_faithful"] is False, "manifest overclaims fidelity")
    reports: list[dict[str, Any]] = []
    for case in shadows["cases"]:
        order = tuple(map(int, case["cyclic_order"]))
        n = len(order)
        require(n == 12 and set(order) == set(range(n)), "invalid card-12 order")
        profile = tuple(map(int, case["profile"]))
        caps = {
            name: frozenset(map(int, raw))
            for name, raw in zip(("S", "O1", "O2"), case["caps"], strict=True)
        }
        # The global-count files use positional cap names, not the canonical
        # multi-center labels.  Only the sets and their intersections matter.
        require(sorted(map(len, caps.values())) == sorted(profile), "global cap profile")
        require(set().union(*caps.values()) == set(range(n)), "global caps do not cover")
        require(
            sorted(len(caps[a] & caps[b]) for a, b in (("S", "O1"), ("S", "O2"), ("O1", "O2")))
            == [1, 1, 1],
            "global cap endpoint intersections fail",
        )
        rows = {
            int(center): frozenset(map(int, support))
            for center, support in case["rows"].items()
        }
        require(set(rows) == set(range(n)), "global row map is not total")
        require(all(len(row) == 4 and center not in row for center, row in rows.items()), "bad row")
        labels = validate_labels(case["labels"], n)
        dangerous = dangerous_of(labels)
        require(rows[labels["p"]] == dangerous, "global p-row is not dangerous")
        blocker = {
            int(source): int(center)
            for source, center in case["critical_shell_blocker_map"].items()
        }
        require(set(blocker) == set(range(n)), "global blocker map is not total")
        for source, center in blocker.items():
            require(center != source and source in rows[center], "global blocker incidence fails")
        ucenter = blocker[labels["u"]]
        evaluation = evaluate_fields(
            caps=caps,
            p=labels["p"],
            center=ucenter,
            support=rows[ucenter],
            dangerous=dangerous,
        )
        reports.append(
            {
                "name": case["name"],
                "profile": list(profile),
                "case_sha256": canonical_sha256(case),
                "evaluation": evaluation,
                "epistemic_status": "EMPIRICALLY_VERIFIED_EXACT_WITHIN_STRENGTHENED_FINITE_SHADOW",
                "target_faithful": False,
                "encoded": manifest["encoded"],
                "missing_live_fields": manifest["unimplemented_fail_closed"],
            }
        )
    return reports


def ring_points(m: int, radius: float) -> list[tuple[float, float]]:
    outer = [
        (math.cos(2 * math.pi * k / m), math.sin(2 * math.pi * k / m))
        for k in range(m)
    ]
    inner = [
        (
            radius * math.cos((2 * k + 1) * math.pi / m),
            radius * math.sin((2 * k + 1) * math.pi / m),
        )
        for k in range(m)
    ]
    return outer + inner


def point_index(points: Sequence[tuple[float, float]], raw: Sequence[float]) -> int:
    x, y = map(float, raw)
    distances = [math.hypot(px - x, py - y) for px, py in points]
    least = min(distances)
    matches = [index for index, distance in enumerate(distances) if distance < 1e-8]
    require(least < 1e-10, f"ring point rematch gap is {least}")
    require(len(matches) == 1, "ring point rematch is not unique")
    return matches[0]


def circumcircle_outside_count(
    points: Sequence[tuple[float, float]], triangle: Sequence[int]
) -> int:
    (ax, ay), (bx, by), (cx, cy) = (points[index] for index in triangle)
    denominator = 2 * (ax * (by - cy) + bx * (cy - ay) + cx * (ay - by))
    require(abs(denominator) > 1e-9, "Moser labels are collinear")
    a2, b2, c2 = ax * ax + ay * ay, bx * bx + by * by, cx * cx + cy * cy
    ux = (a2 * (by - cy) + b2 * (cy - ay) + c2 * (ay - by)) / denominator
    uy = (a2 * (cx - bx) + b2 * (ax - cx) + c2 * (bx - ax)) / denominator
    radius2 = (ax - ux) ** 2 + (ay - uy) ** 2
    return sum((x - ux) ** 2 + (y - uy) ** 2 > radius2 + 1e-8 for x, y in points)


def audit_ring_case(spec: Mapping[str, Any]) -> dict[str, Any]:
    source = load_json(spec["source"])
    results = load_json(spec["results"])
    m = int(source["m"])
    radius = float(source["b"])
    points = ring_points(m, radius)
    n = 2 * m
    require(int(results["n"]) == n, "ring result cardinality drifted")
    require(results["names"] == [*(f"O{k}" for k in range(m)), *(f"I{k}" for k in range(m))], "names drifted")
    witness = source["witness"]
    caps = {
        name: frozenset(point_index(points, raw) for raw in witness[name])
        for name in ("S", "O1", "O2")
    }
    validate_cap_sets(caps, n, sorted(map(int, witness["profile"])))
    committed: dict[int, frozenset[int]] = {}
    for center_text, raw_support in witness["classes"].items():
        center_raw = ast.literal_eval(center_text)
        center = point_index(points, center_raw)
        support = frozenset(point_index(points, raw) for raw in raw_support)
        require(center not in committed, "duplicate committed ring center")
        require(len(support) == 4 and center not in support, "malformed committed ring class")
        committed[center] = support
    require(set(committed) == set(range(n)), "ring witness lacks an exact class at a center")
    require(results["k4_all"] is True and results["gamma_ok"] is True, "ring K4/coverage drifted")
    require(not results["committed_class_mismatches"], "ring committed classes no longer match")

    counts: Counter[str] = Counter()
    first_by_kind: dict[str, dict[str, Any]] = {}
    for index, solution in enumerate(results["solutions"]):
        p = int(solution["p"])
        q = int(solution["q"])
        dangerous = frozenset({q, *map(int, solution["T"])})
        u = int(solution["u"])
        center = int(solution["u_shell_center"])
        support = frozenset(map(int, solution["u_shell_members"]))
        require(committed[p] == dangerous, "saved dangerous row is not the committed p-class")
        require(committed[center] == support, "saved u shell is not the committed center class")
        require(u in support and center != u, "saved u shell source/blocker incidence fails")
        require(u != p and u not in dangerous, "saved selected u is not outside dangerous class")
        evaluation = evaluate_fields(
            caps=caps, p=p, center=center, support=support, dangerous=dangerous
        )
        kind = "HOLDS" if evaluation["holds"] else str(evaluation["failure_kind"])
        counts[kind] += 1
        first_by_kind.setdefault(
            kind,
            {
                "saved_solution_index": index,
                "solution": solution,
                "evaluation": evaluation,
            },
        )
    require(results["solutions"], "ring result serialized no solutions")
    require(sum(counts.values()) == len(results["solutions"]), "ring count mismatch")
    require(any(kind != "HOLDS" for kind in counts), "ring bank contains no saved falsifier")

    smaller_radius, larger_radius = sorted((1.0, radius))
    inside_margin = larger_radius * math.cos(math.pi / m) - smaller_radius
    require(inside_margin > 1e-8, "two-ring non-convex-independence witness disappeared")
    moser = [
        point_index(points, witness[name]) for name in ("U", "V", "W")
    ]
    mec_outside = circumcircle_outside_count(points, moser)
    return {
        "name": spec["name"],
        "source": str(spec["source"].relative_to(ROOT)),
        "results": str(spec["results"].relative_to(ROOT)),
        "source_sha256": sha256_file(spec["source"]),
        "results_sha256": sha256_file(spec["results"]),
        "total_source_solutions": int(results["n_solutions"]),
        "serialized_solution_limit": len(results["solutions"]),
        "evaluation_counts": dict(sorted(counts.items())),
        "first_by_kind": first_by_kind,
        "caps_materialized": {name: sorted(cap) for name, cap in caps.items()},
        "epistemic_status": "EMPIRICALLY_VERIFIED_ON_SERIALIZED_EXACT_ROW_EMBEDDINGS",
        "target_faithful": False,
        "preencoding_checks": {
            "committed_exact_class_at_every_center": True,
            "dangerous_row_matches_committed_p_class": True,
            "urow_matches_committed_center_class": True,
            "source_membership_and_center_separation": True,
            "cap_membership_rematched_to_source_coordinates": True,
        },
        "fidelity_boundary": {
            "exact_Euclidean_row_identites": "source bank; independently sympy-verified elsewhere",
            "K4_at_every_center": True,
            "critical_exact_shell_coverage": True,
            "convex_independent": False,
            "nonconvex_two_ring_inside_margin": inside_margin,
            "minimum_enclosing_circle_frame": (
                "not fully audited here; disk containment is recorded separately"
            ),
            "points_outside_named_Moser_circumcircle": mec_outside,
            "named_Moser_circumcircle_contains_carrier": mec_outside == 0,
            "full_live_no_M44_and_selected_packet": False,
        },
    }


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    require(spec is not None and spec.loader is not None, f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def audit_blocker_models() -> list[dict[str, Any]]:
    specs = (
        ("abstract-blocker-graph", HERE / "blocker_graph/countermodel.py"),
        ("euclidean-blocker-graph", HERE / "blocker_graph/euclidean_countermodel.py"),
    )
    reports = []
    for index, (name, path) in enumerate(specs):
        module = load_module(path, f"urow_blocker_audit_{index}")
        source_report = module.check()
        require(source_report["status"] == "PASS", f"{name} checker failed")
        reports.append(
            {
                "name": name,
                "source": str(path.relative_to(ROOT)),
                "source_sha256": sha256_file(path),
                "source_status": source_report,
                "evaluable": False,
                "missing_fields": [
                    "a SurplusCapPacket or three indexed cap memberships",
                    "named p,q,t1,t2,t3,u live placement",
                    "the designated u-source row relative to those caps and dangerous labels",
                ],
                "epistemic_status": "PROVEN_UNEVALUABLE_FROM_SERIALIZED_MODEL_FIELDS",
                "target_faithful": False,
            }
        )
    return reports


def build_report() -> dict[str, Any]:
    smoke_count = evaluator_smoke_tests()
    seeds = read_query_case_seeds()
    common = audit_common_checkpoint(seeds)
    exact_residual = audit_exact_residual(seeds)
    global_shadows = audit_global_shadows()
    rings = [audit_ring_case(spec) for spec in RING_CASES]
    blocker_models = audit_blocker_models()

    evaluated = [
        *(case["evaluation"] for case in common),
        exact_residual["evaluation"],
        *(case["evaluation"] for case in global_shadows),
    ]
    evaluated.extend(
        record["evaluation"]
        for ring in rings
        for kind, record in ring["first_by_kind"].items()
        if kind != "HOLDS"
    )
    require(any(not evaluation["holds"] for evaluation in evaluated), "no falsifier recorded")
    require(all(not case["evaluation"]["holds"] for case in common), "common shadow changed")
    require(not exact_residual["evaluation"]["holds"], "exact residual changed")
    require(all(not case["evaluation"]["holds"] for case in global_shadows), "global shadow changed")

    source_paths = [
        COMMON_CHECKPOINT,
        QUERY_SOURCE,
        EXACT_RESIDUAL,
        GLOBAL_SHADOWS,
        GLOBAL_MANIFEST,
        *(spec["source"] for spec in RING_CASES),
        *(spec["results"] for spec in RING_CASES),
        HERE / "blocker_graph/countermodel.py",
        HERE / "blocker_graph/euclidean_countermodel.py",
    ]
    return {
        "schema": "p97-atail-urow-cap-multiplicity-falsifier-v1",
        "epistemic_status": {
            "literal_artifact_evaluations": "EMPIRICALLY_VERIFIED_EXACT_WITHIN_EACH_STATED_FINITE_ARTIFACT",
            "blocker_model_unevaluability": "PROVEN_FROM_MISSING_SERIALIZED_FIELDS",
            "live_implication": "CONJECTURED_AND_UNDECIDED",
        },
        "scope": {
            "claim": "audit URowCapMultiplicityFields, not K-A-PAIR or the live theorem",
            "target_faithful_counterexample_found": False,
            "new_solver_search": False,
            "solver_timeout_seconds": None,
            "reason_no_timeout": "pure bounded replay; no subprocess or solver is invoked",
            "smoke_test_count": smoke_count,
            "w_ring_records_checked": sum(ring["serialized_solution_limit"] for ring in rings),
        },
        "source_sha256": {
            str(path.relative_to(ROOT)): sha256_file(path) for path in source_paths
        },
        "results": {
            "common_system_current_survivors": common,
            "exact_456_residual": exact_residual,
            "global_count_shadows": global_shadows,
            "w16_w20_saved_embeddings": rings,
            "blocker_graph_models": blocker_models,
        },
        "conclusions": [
            "The exact (4,5,6) convex residual falsifies the literal fields: its only common p/u-row-center cap contains only one dangerous u-row point outside the cap.",
            "That exact residual is a genuine Euclidean counterexample to the weaker implication using strict convexity, exact rows, the saved blocker map, cap-arc membership, and only the two-large-cap cardinality consequence; it is not merely a finite incidence shadow.",
            "Both current common-system survivors and both strengthened global-count shadows also falsify the literal fields inside their weaker finite abstractions.",
            "The serialized W16/W20 embeddings contain many literal falsifiers after cap memberships are rematerialized, but all fail convex-independence; named-Moser circumdisk containment varies and is reported without promotion to a full MEC audit.",
            "The blocker-graph artifacts cannot evaluate the proposition because they name neither a cap packet nor the live dangerous/u placement.",
            "No target-faithful counterexample was found. Whether the full live hypotheses imply URowCapMultiplicityFields remains conjectural; any proof must visibly use a field missing from the exact residual, especially MEC disk containment, all-center K4, or stronger live no-M44/full-filter coupling.",
        ],
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if args.write and args.check:
        parser.error("--write and --check are mutually exclusive")
    report = build_report()
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.write:
        OUTPUT.write_text(rendered, encoding="utf-8")
    elif args.check:
        require(OUTPUT.exists(), f"missing output: {OUTPUT}")
        require(OUTPUT.read_text(encoding="utf-8") == rendered, "saved output is stale")
    else:
        print(rendered, end="")
    summary = {
        "output": str(OUTPUT.relative_to(ROOT)),
        "exact_residual_holds": report["results"]["exact_456_residual"]["evaluation"]["holds"],
        "common_holds": [
            case["evaluation"]["holds"]
            for case in report["results"]["common_system_current_survivors"]
        ],
        "global_shadow_holds": [
            case["evaluation"]["holds"]
            for case in report["results"]["global_count_shadows"]
        ],
        "target_faithful_counterexample_found": report["scope"]["target_faithful_counterexample_found"],
    }
    if args.write or args.check:
        print(json.dumps(summary, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
