#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Authors: Adam McKenna
"""Regenerate the data products for the 2026-08-26 Rigid221 risk audit.

The script deliberately mines only existing, bounded artifacts.  It does not
invoke Lean, a SAT solver, or a metric oracle.  Canonicalization is the identity
on semantic labels: the available artifacts do not authenticate any larger
role-preserving symmetry group.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import itertools
import json
from collections import Counter, defaultdict
from collections.abc import Iterable, Sequence
from pathlib import Path
from typing import Any

SCRIPT = Path(__file__).resolve()
REPO = SCRIPT.parents[4]
BUNDLE = SCRIPT.parents[1]
SCRATCH = REPO / "scratch"
EX17_ROOT = SCRATCH / "rigid221-blockerv-exact17-20260806"
EX12_MODEL = SCRATCH / "pentagon-offclass-exact12-v2" / "model.json"
N16_MODEL = SCRATCH / "rigid221-blockerv-offclass-probe-20260806" / "probe.json"
EX17_DECODED_MODELS = [
    SCRATCH / "runs/exact17-cocircular-pentagon-order-20260819/terminal-v1/events/decoded-model.json",
    SCRATCH / "runs/exact17-cocircular-pentagon-order-20260819/terminal-v1/events/sat-refinement-decoded-model.json",
]

EX17_SCHEMA = "p97-rigid221-exact17-source-faithful-model-analysis-v1"


def rel(path: Path) -> str:
    return path.resolve().relative_to(REPO.resolve()).as_posix()


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def stable_json(value: Any) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"))


def write_csv(path: Path, rows: Sequence[dict[str, Any]], fields: Sequence[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, lineterminator="\n")
        writer.writeheader()
        for row in rows:
            writer.writerow({field: encode_cell(row.get(field)) for field in fields})


def encode_cell(value: Any) -> str:
    if value is None:
        return ""
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, (dict, list, tuple)):
        return stable_json(value)
    return str(value)


def load_json(path: Path) -> dict[str, Any]:
    with path.open(encoding="utf-8") as handle:
        value = json.load(handle)
    if not isinstance(value, dict):
        raise TypeError(f"expected JSON object: {path}")
    return value


def normalized_rows(rows: Iterable[dict[str, Any]]) -> list[dict[str, Any]]:
    result = []
    for row in rows:
        result.append(
            {
                "center": int(row["center"]),
                "support": sorted(int(x) for x in row["support"]),
                "exact": row.get("exact"),
            }
        )
    return sorted(result, key=lambda row: row["center"])


def mapping_rows(mapping: dict[str, Any]) -> list[dict[str, Any]]:
    return normalized_rows(
        {"center": int(center), "support": support, "exact": True}
        for center, support in mapping.items()
    )


def ex17_analysis_paths() -> list[Path]:
    """Return authenticated row/order analysis objects, excluding quarantine."""
    paths: set[Path] = set()
    if EX17_ROOT.exists():
        paths.update(EX17_ROOT.rglob("*.json"))
    runs = SCRATCH / "runs"
    if runs.exists():
        for child in runs.iterdir():
            if child.is_dir() and "exact17" in child.name.lower():
                paths.update(
                    p for p in child.rglob("*.json")
                    if "analysis" in p.name.lower() or "model" in p.name.lower()
                )
    selected = []
    for path in sorted(paths):
        try:
            if load_json(path).get("schema") == EX17_SCHEMA:
                selected.append(path)
        except (OSError, UnicodeDecodeError, json.JSONDecodeError, TypeError):
            continue
    return selected


def ex17_signature(data: dict[str, Any]) -> str:
    assignment = {
        "order_index": data.get("order_index"),
        "anonymous_positions": data.get("anonymous_positions"),
        "order": data.get("order"),
        "fifth_center": data.get("fifth_center"),
        "rows": normalized_rows(data.get("rows", [])),
    }
    return stable_json(assignment)


def model_id(lane: str, assignment: dict[str, Any]) -> str:
    token = hashlib.sha256(stable_json(assignment).encode()).hexdigest()[:16]
    return f"{lane}-{token}"


def build_models() -> tuple[list[dict[str, Any]], list[dict[str, str]]]:
    models: list[dict[str, Any]] = []
    evidence: list[dict[str, str]] = []

    grouped: dict[str, list[tuple[Path, dict[str, Any]]]] = defaultdict(list)
    for path in ex17_analysis_paths():
        data = load_json(path)
        grouped[ex17_signature(data)].append((path, data))

    for signature in sorted(grouped):
        sources = grouped[signature]
        first = sources[0][1]
        assignment = {
            "carrier": list(range(17)),
            "canonical_label_order": first.get("order"),
            "order_index": first.get("order_index"),
            "anonymous_positions": first.get("anonymous_positions"),
            "fifth_center": first.get("fifth_center"),
            "physical_labels": [6, 7, 8, 9, 10],
            "second_cap_labels": [0, 2, 6, 7, 8, 9, 10, 11, 12],
            "outside_labels": [1, 3, 4, 5, 13, 14, 15, 16],
            "old_centers": [8, 9, 10, 11],
            "rows": normalized_rows(first.get("rows", [])),
            "source_to_actual_blocker": None,
            "prescribed_deletion": None,
            "radius_classes": None,
            "coordinates": None,
        }
        paths = [rel(path) for path, _ in sources]
        hashes = [sha256_file(path) for path, _ in sources]
        linear = Counter(str(data.get("linear_status") or "UNKNOWN") for _, data in sources)
        models.append(
            {
                "schema": "rigid221-cegar-risk-audit.canonical-model.v1",
                "model_id": model_id("ex17", assignment),
                "lane": "R221-EX17",
                "scope_n": 17,
                "constraint_level": "INCIDENCE_PLUS_ORDER",
                "semantic_level": "ROW_ORDER_SHADOW",
                "canonicalization_group": "IDENTITY_ON_ALL_STORED_LABELS",
                "raw_artifact_multiplicity": len(sources),
                "provenance_paths": paths,
                "provenance_sha256": hashes,
                "assignment": assignment,
                "metric_oracle_status_counts": dict(sorted(linear.items())),
                "validation": {
                    "source_independent_model_checker": all(
                        bool(data.get("source_independent_model_checker_verified"))
                        for _, data in sources
                    ),
                    "cnf_assignment": all(
                        bool(data.get("cnf_assignment_verified")) for _, data in sources
                    ),
                },
                "source_faithful_encoding": True,
                "full_source_faithful_model": False,
                "missing_for_full_assignment": [
                    "raw Boolean assignment",
                    "source-to-actual-blocker provenance",
                    "prescribed-deletion survival",
                    "radius equalities and coordinates",
                ],
            }
        )
        for path, _ in sources:
            evidence.append(evidence_row(path, "canonical EX17 row/order shadow"))

    order_zero = [0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14]
    for path in EX17_DECODED_MODELS:
        decoded_model = load_json(path)
        decoded = decoded_model["decoded"]
        assignment = {
            "carrier": list(range(17)),
            "canonical_label_order": order_zero,
            "order_index": int(decoded["named_orders"][0]),
            "anonymous_positions": None,
            "next_centers": decoded.get("next_centers"),
            "diagonal_hits": decoded.get("diagonal_hits"),
            "physical_labels": [6, 7, 8, 9, 10],
            "second_cap_labels": [0, 2, 6, 7, 8, 9, 10, 11, 12],
            "outside_labels": [1, 3, 4, 5, 13, 14, 15, 16],
            "old_centers": [8, 9, 10, 11],
            "rows": mapping_rows(decoded["rows"]),
            "source_to_actual_blocker": None,
            "prescribed_deletion": None,
            "radius_classes": None,
            "coordinates": None,
        }
        claims = decoded_model.get("claims", {})
        models.append(
            {
                "schema": "rigid221-cegar-risk-audit.canonical-model.v1",
                "model_id": model_id("ex17-decoded", assignment),
                "lane": "R221-EX17",
                "scope_n": 17,
                "constraint_level": "SOURCE_FAITHFUL_FINITE",
                "semantic_level": "DECODED_BOOLEAN_ROW_ASSIGNMENT",
                "canonicalization_group": "IDENTITY_ON_ALL_STORED_LABELS",
                "raw_artifact_multiplicity": 1,
                "provenance_paths": [rel(path)],
                "provenance_sha256": [sha256_file(path)],
                "recorded_model_sha256": decoded_model.get("model_sha256"),
                "recorded_cnf_sha256": decoded_model.get("cnf_sha256"),
                "assignment": assignment,
                "validation": claims,
                "source_faithful_encoding": True,
                "full_source_faithful_model": False,
                "missing_for_full_assignment": [
                    "source realizability (artifact explicitly records false)",
                    "source-to-actual-blocker provenance",
                    "prescribed-deletion survival",
                    "radius equalities and Euclidean coordinates",
                ],
            }
        )
        evidence.append(evidence_row(path, "decoded EX17 Boolean row assignment"))

    exact12 = load_json(EX12_MODEL)
    assignment12 = {
        "carrier": list(range(int(exact12["cardinality"]))),
        "roles": exact12.get("roles"),
        "caps": exact12.get("caps"),
        "interiors": exact12.get("interiors"),
        "physical_class": exact12.get("physical_class"),
        "rows": mapping_rows(exact12.get("cube", {})),
        "trace_edges": exact12.get("trace_edges"),
        "source_to_actual_blocker": exact12.get("blocker_map"),
        "prescribed_deletion": exact12.get("roles", {}).get("d"),
        "radius_classes": None,
        "cyclic_order": None,
        "coordinates": None,
    }
    models.append(
        {
            "schema": "rigid221-cegar-risk-audit.canonical-model.v1",
            "model_id": model_id("ex12", assignment12),
            "lane": "R221-EX12/A5",
            "scope_n": 12,
            "constraint_level": "INCIDENCE_ONLY",
            "semantic_level": "INCIDENCE_SHADOW",
            "canonicalization_group": "IDENTITY_ON_ALL_STORED_LABELS",
            "raw_artifact_multiplicity": 1,
            "provenance_paths": [rel(EX12_MODEL)],
            "provenance_sha256": [sha256_file(EX12_MODEL)],
            "assignment": assignment12,
            "source_faithful_encoding": False,
            "full_source_faithful_model": False,
            "missing_for_full_assignment": [
                "raw Boolean assignment (only its digest is retained)",
                "cyclic order",
                "metric data",
                "MEC/minimality/K4 hypotheses",
                "deletion-survival proof",
            ],
        }
    )
    evidence.append(evidence_row(EX12_MODEL, "canonical exact-12 incidence shadow"))

    n16 = load_json(N16_MODEL)
    assignment16 = {
        "carrier": list(range(int(n16["cardinality"]))),
        "roles": n16.get("roles"),
        "cap_profile": n16.get("profile"),
        "rows": mapping_rows(n16.get("rows", {})),
        "source_to_actual_blocker": n16.get("blockers"),
        "prescribed_deletion": n16.get("roles", {}).get("deleted"),
        "radius_classes": None,
        "cyclic_order": None,
        "coordinates": None,
    }
    models.append(
        {
            "schema": "rigid221-cegar-risk-audit.canonical-model.v1",
            "model_id": model_id("n16", assignment16),
            "lane": "R221-LARGE-RELAXATION",
            "scope_n": 16,
            "constraint_level": "INCIDENCE_ONLY",
            "semantic_level": "INCIDENCE_SHADOW",
            "canonicalization_group": "IDENTITY_ON_ALL_STORED_LABELS",
            "raw_artifact_multiplicity": 1,
            "provenance_paths": [rel(N16_MODEL)],
            "provenance_sha256": [sha256_file(N16_MODEL)],
            "assignment": assignment16,
            "source_faithful_encoding": False,
            "full_source_faithful_model": False,
            "missing_for_full_assignment": [
                "cyclic order",
                "metric data",
                "source identity for every row",
                "minimality/K4 and deletion-survival hypotheses",
            ],
        }
    )
    evidence.append(evidence_row(N16_MODEL, "canonical n=16 incidence relaxation"))

    return sorted(models, key=lambda model: model["model_id"]), dedup_evidence(evidence)


def evidence_row(path: Path, use: str) -> dict[str, str]:
    return {
        "artifact_path": rel(path),
        "sha256": sha256_file(path),
        "bytes": str(path.stat().st_size),
        "use": use,
    }


def dedup_evidence(rows: Iterable[dict[str, str]]) -> list[dict[str, str]]:
    by_path = {row["artifact_path"]: row for row in rows}
    return [by_path[path] for path in sorted(by_path)]


def histogram(values: Iterable[Any]) -> dict[str, int]:
    return dict(sorted(Counter(str(value) for value in values).items()))


def row_map(assignment: dict[str, Any]) -> dict[int, set[int]]:
    return {
        int(row["center"]): {int(point) for point in row["support"]}
        for row in assignment.get("rows", [])
    }


def cap_sets(model: dict[str, Any]) -> tuple[set[int], set[int], set[int]]:
    assignment = model["assignment"]
    carrier = {int(point) for point in assignment["carrier"]}
    if model["lane"] == "R221-EX17":
        physical = set(assignment["physical_labels"])
        adjacent = set(assignment["second_cap_labels"])
        outside = set(assignment["outside_labels"])
    elif model["lane"] == "R221-EX12/A5":
        physical = set(assignment.get("physical_class") or [])
        caps = assignment.get("caps") or []
        adjacent = set(caps[1]) if len(caps) > 1 else set()
        outside = carrier - adjacent
    else:
        # The n=16 probe records only the three cardinalities, not cap members.
        physical = set()
        adjacent = set()
        outside = set()
    return physical, adjacent, outside


def intersection_matrix(rows: dict[int, set[int]]) -> list[list[int]]:
    centers = sorted(rows)
    return [
        [left, right, len(rows[left] & rows[right])]
        for index, left in enumerate(centers)
        for right in centers[index + 1 :]
    ]


def pair_codegrees(rows: dict[int, set[int]]) -> Counter[tuple[int, int]]:
    result: Counter[tuple[int, int]] = Counter()
    for support in rows.values():
        for left, right in itertools.combinations(sorted(support), 2):
            result[(left, right)] += 1
    return result


def maximum_matching_deficiency(rows: dict[int, set[int]], outside: set[int]) -> int | None:
    if not outside:
        return None
    adjacency = {center: sorted(support & outside) for center, support in rows.items()}
    matched_to_row: dict[int, int] = {}

    def augment(center: int, seen: set[int]) -> bool:
        for point in adjacency[center]:
            if point in seen:
                continue
            seen.add(point)
            owner = matched_to_row.get(point)
            if owner is None or augment(owner, seen):
                matched_to_row[point] = center
                return True
        return False

    matched = sum(1 for center in sorted(adjacency) if augment(center, set()))
    return len(rows) - matched


def blocker_features(mapping: dict[str, Any] | None, roles: dict[str, Any] | None) -> dict[str, Any]:
    if not mapping:
        return {
            "indegree_distribution": None,
            "cycles": None,
            "cycle_lengths": None,
            "paths": None,
            "path_lengths": None,
            "max_fiber": None,
            "repeated_fibers": None,
            "center_source_coincidences": None,
            "center_source_coincidence_records": None,
        }
    graph = {int(source): int(target) for source, target in mapping.items()}
    indegrees = Counter(graph.values())
    cycles: list[list[int]] = []
    paths: list[list[int]] = []
    globally_seen: set[int] = set()
    for source in sorted(graph):
        if source in globally_seen:
            continue
        trail: list[int] = []
        location: dict[int, int] = {}
        cursor = source
        while cursor in graph and cursor not in location and cursor not in globally_seen:
            location[cursor] = len(trail)
            trail.append(cursor)
            cursor = graph[cursor]
        if cursor in location:
            cycles.append(trail[location[cursor] :])
        else:
            paths.append(trail)
        globally_seen.update(trail)
    role_points = {int(value) for value in (roles or {}).values() if isinstance(value, int)}
    coincidences = [
        {"source": source, "actual_blocker": target}
        for source, target in sorted(graph.items())
        if target in role_points
    ]
    return {
        "indegree_distribution": histogram(indegrees.values()),
        "cycles": sorted(cycles),
        "cycle_lengths": sorted(len(cycle) for cycle in cycles),
        "paths": sorted(paths),
        "path_lengths": sorted(len(path) for path in paths),
        "max_fiber": max(indegrees.values(), default=0),
        "repeated_fibers": sum(1 for degree in indegrees.values() if degree > 1),
        "center_source_coincidences": len(coincidences),
        "center_source_coincidence_records": coincidences,
    }


def interval_features(
    rows: dict[int, set[int]], outside: set[int], order: list[int] | None
) -> dict[str, Any]:
    if not order or not outside:
        return {
            "pair_records": None,
            "relations": None,
            "relation_records": None,
            "interlacing_count": None,
            "span_min": None,
            "span_max": None,
            "span_total": None,
        }
    position = {int(point): index for index, point in enumerate(order)}
    pairs: list[dict[str, Any]] = []
    spans: list[int] = []
    modulus = len(order)
    for center, support in sorted(rows.items()):
        outside_support = sorted(support & outside)
        for left, right in itertools.combinations(outside_support, 2):
            a, b = sorted((position[left], position[right]))
            span = min(b - a, modulus - (b - a))
            pairs.append(
                {
                    "center": center,
                    "pair": [left, right],
                    "positions": [a, b],
                    "span": span,
                }
            )
            spans.append(span)
    relations = Counter()
    relation_records: list[dict[str, Any]] = []
    for left, right in itertools.combinations(pairs, 2):
        center_a = left["center"]
        center_c = right["center"]
        if center_a == center_c:
            continue
        a, b = left["positions"]
        c, d = right["positions"]
        if len({a, b, c, d}) < 4:
            relation = "shared_endpoint"
        elif b < c or d < a:
            relation = "separated"
        elif (a < c < d < b) or (c < a < b < d):
            relation = "nested"
        else:
            relation = "interlacing"
        relations[relation] += 1
        relation_records.append(
            {
                "centers": [center_a, center_c],
                "pairs": [left["pair"], right["pair"]],
                "relation": relation,
            }
        )
    return {
        "pair_records": pairs,
        "relations": dict(sorted(relations.items())),
        "relation_records": relation_records,
        "interlacing_count": relations["interlacing"],
        "span_min": min(spans) if spans else None,
        "span_max": max(spans) if spans else None,
        "span_total": sum(spans) if spans else None,
    }


def unnamed_interval_counts(
    order: list[int] | None, named: set[int]
) -> list[dict[str, Any]] | None:
    if not order or not named:
        return None
    named_positions = sorted(
        (index, int(point)) for index, point in enumerate(order) if int(point) in named
    )
    if not named_positions:
        return None
    result = []
    modulus = len(order)
    for index, (start_position, start_label) in enumerate(named_positions):
        end_position, end_label = named_positions[(index + 1) % len(named_positions)]
        cursor = (start_position + 1) % modulus
        labels = []
        while cursor != end_position:
            labels.append(int(order[cursor]))
            cursor = (cursor + 1) % modulus
        result.append(
            {
                "after": start_label,
                "before": end_label,
                "free_labels": labels,
                "count": len(labels),
            }
        )
    return result


def feature_row(model: dict[str, Any]) -> dict[str, Any]:
    assignment = model["assignment"]
    carrier = {int(point) for point in assignment["carrier"]}
    rows = row_map(assignment)
    physical, adjacent, outside = cap_sets(model)
    multiplicity = Counter(point for support in rows.values() for point in support)
    codegrees = pair_codegrees(rows)
    repeated_pairs = [
        {"pair": [left, right], "codegree": degree,
         "centers": sorted(center for center, support in rows.items() if {left, right} <= support)}
        for (left, right), degree in sorted(codegrees.items()) if degree > 1
    ]
    order = assignment.get("canonical_label_order") or assignment.get("cyclic_order")
    intervals = interval_features(rows, outside, order)
    blocker = blocker_features(
        assignment.get("source_to_actual_blocker"), assignment.get("roles")
    )
    used_support = set().union(*rows.values()) if rows else set()
    named_positions = None
    unnamed_intervals = None
    if order:
        positions = {int(point): index for index, point in enumerate(order)}
        named_labels = (
            set(assignment.get("second_cap_labels", []))
            | set(assignment.get("old_centers", []))
            | {15, 16}
        )
        named_positions = {str(point): positions.get(point) for point in sorted(named_labels)}
        unnamed_intervals = unnamed_interval_counts(order, named_labels)
    exact_row_count = sum(
        1 for row in assignment.get("rows", []) if row.get("exact") is True
    )
    physical_hits = {str(center): len(support & physical) for center, support in rows.items()}
    outside_hits = {str(center): len(support & outside) for center, support in rows.items()}
    row_centers = set(rows)
    centers_in_other_support = sum(
        1 for center in row_centers
        if any(center in support for other, support in rows.items() if other != center)
    )
    centers_in_other_support_records = [
        {
            "center": center,
            "supporting_rows": sorted(
                other for other, support in rows.items()
                if other != center and center in support
            ),
        }
        for center in sorted(row_centers)
        if any(center in support for other, support in rows.items() if other != center)
    ]
    return {
        "model_id": model["model_id"],
        "lane": model["lane"],
        "scope_n": model["scope_n"],
        "constraint_level": model["constraint_level"],
        "semantic_level": model["semantic_level"],
        "raw_artifact_multiplicity": model["raw_artifact_multiplicity"],
        "physical_cap_size": len(physical) if physical else None,
        "adjacent_cap_size": len(adjacent) if adjacent else None,
        "outside_size": len(outside) if outside else None,
        "named_role_positions": named_positions,
        "unnamed_by_interval": unnamed_intervals,
        "row_count": len(rows),
        "exact_row_count": exact_row_count,
        "physical_hit_counts": physical_hits if physical else None,
        "outside_support_counts": outside_hits if outside else None,
        "row_intersection_matrix": intersection_matrix(rows),
        "support_multiplicity_distribution": histogram(multiplicity.values()),
        "pair_codegree_distribution": histogram(codegrees.values()),
        "repeated_support_pairs": repeated_pairs,
        "outside_pair_spans": intervals["pair_records"],
        "row_interval_relations": intervals["relations"],
        "row_interval_relation_records": intervals["relation_records"],
        "blocker_indegree_distribution": blocker["indegree_distribution"],
        "blocker_cycles": blocker["cycles"],
        "blocker_cycle_lengths": blocker["cycle_lengths"],
        "blocker_paths": blocker["paths"],
        "blocker_path_lengths": blocker["path_lengths"],
        "center_source_coincidences": blocker["center_source_coincidences"],
        "center_source_coincidence_records": blocker[
            "center_source_coincidence_records"
        ],
        "repeated_blocker_fibers": blocker["repeated_fibers"],
        "rows_center_is_other_support": centers_in_other_support,
        "rows_center_is_other_support_records": centers_in_other_support_records,
        "source_provenance_complete": assignment.get("source_to_actual_blocker") is not None,
        "prescribed_deletion_present": assignment.get("prescribed_deletion") is not None,
        "deletion_survival_predicates": False,
        "unused_points_not_removable": sorted(carrier - used_support),
        "radius_classes_present": assignment.get("radius_classes") is not None,
        "perpendicular_bisector_reuse": None,
        "equal_chord_chains": None,
        "chord_interlacing_count": intervals["interlacing_count"],
        "same_opposite_side_present": False,
        "convex_order_present": bool(order),
        "strict_convexity_present": False,
        "I_out": sum(outside_hits.values()) if outside else None,
        "P_repeat": sum(degree - 1 for degree in codegrees.values() if degree > 1),
        "X_cross": intervals["interlacing_count"],
        "F_max": blocker["max_fiber"],
        "H_def": maximum_matching_deficiency(rows, outside),
        "Span_min": intervals["span_min"],
        "Span_max": intervals["span_max"],
        "Span_total": intervals["span_total"],
        "metric_status": stable_json(model.get("metric_oracle_status_counts", {})),
        "full_source_faithful_model": model["full_source_faithful_model"],
    }


FEATURE_FIELDS = [
    "model_id", "lane", "scope_n", "constraint_level", "semantic_level",
    "raw_artifact_multiplicity", "physical_cap_size", "adjacent_cap_size",
    "outside_size", "named_role_positions", "unnamed_by_interval", "row_count",
    "exact_row_count", "physical_hit_counts", "outside_support_counts",
    "row_intersection_matrix", "support_multiplicity_distribution",
    "pair_codegree_distribution", "repeated_support_pairs", "outside_pair_spans",
    "row_interval_relations", "row_interval_relation_records",
    "blocker_indegree_distribution", "blocker_cycles", "blocker_cycle_lengths",
    "blocker_paths", "blocker_path_lengths", "center_source_coincidences",
    "center_source_coincidence_records", "repeated_blocker_fibers",
    "rows_center_is_other_support", "rows_center_is_other_support_records",
    "source_provenance_complete",
    "prescribed_deletion_present", "deletion_survival_predicates",
    "unused_points_not_removable", "radius_classes_present",
    "perpendicular_bisector_reuse", "equal_chord_chains", "chord_interlacing_count",
    "same_opposite_side_present", "convex_order_present", "strict_convexity_present",
    "I_out", "P_repeat", "X_cross", "F_max", "H_def", "Span_min", "Span_max",
    "Span_total", "metric_status", "full_source_faithful_model",
]


RUN_FIELDS = [
    "run_id", "lane", "source_head", "artifact_path", "encoding_version",
    "solver_and_version", "scope_n", "cap_profile", "fixed_named_roles",
    "constraint_level", "SAT_UNSAT_UNKNOWN_TIMEOUT", "raw_model_count",
    "canonical_model_count", "proof_or_core_available", "seed", "timeout",
    "elapsed", "input_sha256", "output_sha256", "notes",
]


RUN_ROWS: list[dict[str, Any]] = [
    {
        "run_id": "r221-large-offclass-incidence-probe-n16",
        "lane": "R221-LARGE-RELAXATION", "source_head": "UNKNOWN",
        "artifact_path": "scratch/rigid221-blockerv-offclass-probe-20260806/probe.json",
        "encoding_version": "offclass-probe-20260806", "solver_and_version": "UNKNOWN",
        "scope_n": 16, "cap_profile": [5, 5, 9],
        "fixed_named_roles": ["physical_apex", "u", "xu", "v", "xv", "deleted", "c"],
        "constraint_level": "INCIDENCE_ONLY", "SAT_UNSAT_UNKNOWN_TIMEOUT": "SAT",
        "raw_model_count": 1, "canonical_model_count": 1,
        "proof_or_core_available": "NO", "seed": "UNKNOWN", "timeout": "UNKNOWN",
        "elapsed": "UNKNOWN",
        "notes": "Incidence relaxation only; not a Lean-packet or Euclidean model.",
    },
    {
        "run_id": "firstnonhit-all-large-caps-v4/n17-one-shot-audit-approved",
        "lane": "OTHER-R221-FRESHTHIRD", "source_head": "UNKNOWN",
        "artifact_path": "scratch/runs/firstnonhit-all-large-caps-v4/n17-one-shot-audit-approved/terminal-receipt.json",
        "encoding_version": "freshthird-all-large-caps-v4", "solver_and_version": "CaDiCaL 3.0.0",
        "scope_n": 17, "cap_profile": [6, 8, 6], "fixed_named_roles": "FreshThird roles",
        "constraint_level": "INCIDENCE_ONLY", "SAT_UNSAT_UNKNOWN_TIMEOUT": "SAT",
        "raw_model_count": 1, "canonical_model_count": "NOT_COMPUTABLE_FROM_RETAINED_ARTIFACT",
        "proof_or_core_available": "NO; independent readback audit only", "seed": "UNKNOWN",
        "timeout": "manifest timeout_seconds", "elapsed": "UNKNOWN",
        "notes": "Omitted common-radius identity, aligned-two-delete, no-alternation, and tri-apex-rich predicates; run manifest still says RUNNING.",
    },
    {
        "run_id": "firstnonhit-overlap-v5/n17-one-shot-audit-approved",
        "lane": "OTHER-R221-FRESHTHIRD", "source_head": "UNKNOWN",
        "artifact_path": "scratch/runs/firstnonhit-overlap-v5/n17-one-shot-audit-approved/terminal-receipt.json",
        "encoding_version": "freshthird-overlap-v5", "solver_and_version": "CaDiCaL 3.0.0",
        "scope_n": 17, "cap_profile": [6, 8, 6], "fixed_named_roles": "FreshThird roles",
        "constraint_level": "INCIDENCE_ONLY", "SAT_UNSAT_UNKNOWN_TIMEOUT": "SAT",
        "raw_model_count": 1, "canonical_model_count": "NOT_COMPUTABLE_FROM_RETAINED_ARTIFACT",
        "proof_or_core_available": "NO; independent readback audit only", "seed": "UNKNOWN",
        "timeout": "manifest timeout_seconds", "elapsed": "UNKNOWN",
        "notes": "Overlap refinement; source_total=false and no lift.",
    },
    {
        "run_id": "offclass-exact16-full-kalmanson-14-cells",
        "lane": "R221-EX16-DIAGNOSTIC", "source_head": "UNKNOWN",
        "artifact_path": "scratch/rigid221-blockerv-offclass-exact16-probe-20260806/",
        "encoding_version": "full-kalmanson-o{0,1}-i{9..15}",
        "solver_and_version": "exact linear oracle; version unaudited", "scope_n": 16,
        "cap_profile": [9, "insertion 9..15"], "fixed_named_roles": "named cap roles fixed",
        "constraint_level": "INCIDENCE_PLUS_ORDER", "SAT_UNSAT_UNKNOWN_TIMEOUT": "UNSAT",
        "raw_model_count": 17640, "canonical_model_count": "NO FULL MODELS RETAINED",
        "proof_or_core_available": "summary examples only", "seed": "NONE",
        "timeout": "UNKNOWN", "elapsed": "UNKNOWN",
        "notes": "14 cells x 1,260 rejected row assignments; aggregate finite diagnostic, not a large-packet theorem.",
    },
    {
        "run_id": "ex17-v23t-seeds-3601-3609", "lane": "R221-EX17",
        "source_head": "UNKNOWN", "artifact_path": "scratch/rigid221-blockerv-exact17-20260806/",
        "encoding_version": "source-faithful-cap9-v23t", "solver_and_version": "CaDiCaL; exact version in run logs",
        "scope_n": 17, "cap_profile": [9, 8], "fixed_named_roles": "Fin 17 source-normal-form labels",
        "constraint_level": "SOURCE_FAITHFUL_FINITE", "SAT_UNSAT_UNKNOWN_TIMEOUT": "SAT",
        "raw_model_count": 9, "canonical_model_count": 9, "proof_or_core_available": "NO",
        "seed": "3601..3609", "timeout": "UNKNOWN", "elapsed": "UNKNOWN",
        "notes": "Nine distinct Boolean survivors; cardinality is definitionally fixed to 17.",
    },
    {
        "run_id": "ex17-v24t-v25t-seeds-3801-3818", "lane": "R221-EX17",
        "source_head": "UNKNOWN", "artifact_path": "scratch/rigid221-blockerv-exact17-20260806/",
        "encoding_version": "v24t-model-cuts+v25t", "solver_and_version": "CaDiCaL + exact strict-linear oracle",
        "scope_n": 17, "cap_profile": [9, 8], "fixed_named_roles": "Fin 17 source-normal-form labels",
        "constraint_level": "SOURCE_FAITHFUL_FINITE", "SAT_UNSAT_UNKNOWN_TIMEOUT": "SAT_BOOLEAN;UNSAT_LINEAR",
        "raw_model_count": 18, "canonical_model_count": "18 retained seeds; orbit census unavailable",
        "proof_or_core_available": "exact source certificates accumulated later", "seed": "3801..3818",
        "timeout": "UNKNOWN", "elapsed": "UNKNOWN",
        "notes": "Every Boolean model rejected by complete strict-linear oracle; Boolean CNF itself remains SAT.",
    },
    {
        "run_id": "ex17-source-frozen-seeds-3819-3850", "lane": "R221-EX17",
        "source_head": "UNKNOWN", "artifact_path": "scratch/rigid221-blockerv-exact17-20260806/",
        "encoding_version": "source-frozen-dihedral-bank", "solver_and_version": "CaDiCaL + exact strict-linear oracle",
        "scope_n": 17, "cap_profile": [9, 8], "fixed_named_roles": "Fin 17 source-normal-form labels",
        "constraint_level": "SOURCE_FAITHFUL_FINITE", "SAT_UNSAT_UNKNOWN_TIMEOUT": "ITERATION_LIMIT",
        "raw_model_count": 32, "canonical_model_count": "NOT ESTABLISHED",
        "proof_or_core_available": "60 exact certificates; 2,040 dihedral clauses", "seed": "3819..3850",
        "timeout": "iteration cap", "elapsed": "UNKNOWN",
        "notes": "Each continuation model remained Boolean SAT and linear UNSAT; no exhaustive closure.",
    },
    {
        "run_id": "ex17-order0-28-placement-core-bank-audit", "lane": "R221-EX17",
        "source_head": "UNKNOWN",
        "artifact_path": "scratch/rigid221-blockerv-exact17-20260806/SOURCE-FAITHFUL-CORE-BANK-AUDIT-2026-08-07.md",
        "encoding_version": "source-faithful-order0-all-placement", "solver_and_version": "CaDiCaL + strict-linear oracle",
        "scope_n": 17, "cap_profile": [9, 8], "fixed_named_roles": "28 anonymous placements",
        "constraint_level": "SOURCE_FAITHFUL_FINITE", "SAT_UNSAT_UNKNOWN_TIMEOUT": "SAT_BOOLEAN;UNSAT_OR_UNKNOWN_LINEAR",
        "raw_model_count": 8280, "canonical_model_count": "NOT RETAINED/NOT COMPUTABLE",
        "proof_or_core_available": "5,999 bank hits; 2,260 misses in dated audit",
        "seed": "multiple", "timeout": "7 cells hit 500-model cap", "elapsed": "UNKNOWN",
        "notes": "8,259 strict-linear contradictions and 21 metric unknown; stored analyses are shadows, not complete assignments.",
    },
    {
        "run_id": "ex17-current-root-two-kalmanson-piqd", "lane": "R221-EX17",
        "source_head": "UNKNOWN", "artifact_path": "scratch/runs/exact17-two-triple-row-piqd/current-root-v2/",
        "encoding_version": "two-kalmanson-piqd-current-root", "solver_and_version": "piqd/piqc; pinned in receipt",
        "scope_n": 17, "cap_profile": [9, 8], "fixed_named_roles": "Fin 17 source-normal-form labels",
        "constraint_level": "SOURCE_FAITHFUL_FINITE", "SAT_UNSAT_UNKNOWN_TIMEOUT": "SAT",
        "raw_model_count": 1, "canonical_model_count": 1,
        "proof_or_core_available": "CERT-001 structural replay; proof endpoint not called",
        "seed": "job 33126…", "timeout": "UNKNOWN", "elapsed": "UNKNOWN",
        "notes": "STRUCTURAL_SAT; closure/source entitlement/universal lift all false.",
    },
    {
        "run_id": "ex17-child32", "lane": "R221-EX17", "source_head": "UNKNOWN",
        "artifact_path": "scratch/exact17-lean-to-sat/piqd-child32-core1-status-terminal-quarantined.json",
        "encoding_version": "two-kalmanson-child32", "solver_and_version": "piqd/piqc",
        "scope_n": 17, "cap_profile": [9, 8], "fixed_named_roles": "one selected order/cell",
        "constraint_level": "SOURCE_FAITHFUL_FINITE", "SAT_UNSAT_UNKNOWN_TIMEOUT": "UNKNOWN",
        "raw_model_count": 0, "canonical_model_count": 0, "proof_or_core_available": "NO",
        "seed": "child32", "timeout": "terminal quarantined", "elapsed": "UNKNOWN",
        "notes": "Kept distinct from authenticated SAT children 33--44.",
    },
    {
        "run_id": "ex17-children33-44", "lane": "R221-EX17", "source_head": "UNKNOWN",
        "artifact_path": "scratch/exact17-lean-to-sat/", "encoding_version": "two-kalmanson-children33-44",
        "solver_and_version": "piqd/piqc", "scope_n": 17, "cap_profile": [9, 8],
        "fixed_named_roles": "one selected order/cell per child", "constraint_level": "SOURCE_FAITHFUL_FINITE",
        "SAT_UNSAT_UNKNOWN_TIMEOUT": "SAT", "raw_model_count": 12,
        "canonical_model_count": "one retained model per child; no orbit census",
        "proof_or_core_available": "authenticated structural SAT replay", "seed": "children33..44",
        "timeout": "UNKNOWN", "elapsed": "UNKNOWN",
        "notes": "Aggregate inventory row; diagnostic motif mines do not establish exhaustive survivor counts.",
    },
    {
        "run_id": "exact12-v4-direct-12-cell-wave", "lane": "R221-EX12/A5",
        "source_head": "UNKNOWN", "artifact_path": "docs/exact-twelve-rigid221-ordered-v4-replay-checkpoint-2026-08-08.md",
        "encoding_version": "exact12-ordered-v4", "solver_and_version": "CaDiCaL + CEGAR",
        "scope_n": 12, "cap_profile": [5, 4, 6], "fixed_named_roles": "12 named placement cells",
        "constraint_level": "INCIDENCE_PLUS_ORDER", "SAT_UNSAT_UNKNOWN_TIMEOUT": "ITERATION_LIMIT_OR_STRUCTURALLY_UNRESOLVED",
        "raw_model_count": 6896, "canonical_model_count": "NOT ESTABLISHED",
        "proof_or_core_available": "NO", "seed": "12 cells", "timeout": "per-cell iteration limits",
        "elapsed": "UNKNOWN", "notes": "No UNSAT cell; counts are retained CEGAR records, not exhaustive models.",
    },
    {
        "run_id": "exact12-model-all-42-placements", "lane": "R221-EX12/A5",
        "source_head": "UNKNOWN", "artifact_path": "scratch/pentagon-offclass-exact12-v2/model.json",
        "encoding_version": "pentagon-offclass-exact12-v2", "solver_and_version": "CaDiCaL 3.0.0 + Z3 4.17",
        "scope_n": 12, "cap_profile": [5, 4, 6],
        "fixed_named_roles": ["physical_apex", "d", "v", "u", "c", "xv", "xu"],
        "constraint_level": "INCIDENCE_ONLY", "SAT_UNSAT_UNKNOWN_TIMEOUT": "SAT",
        "raw_model_count": 42, "canonical_model_count": "one full row/blocker shadow retained",
        "proof_or_core_available": "independent model check; no UNSAT proof", "seed": "all placements",
        "timeout": "UNKNOWN", "elapsed": "UNKNOWN",
        "notes": "All 42 placements SAT; retained model omits Euclidean, minimality, and deletion-survival content.",
    },
    {
        "run_id": "a5-arm-static-cell6-v1-v21", "lane": "R221-EX12/A5",
        "source_head": "UNKNOWN",
        "artifact_path": "scratch/runs/exact12-rigid221-all-order-common-five/canary-v14-20260818/",
        "encoding_version": "arm-static-cell6-v1-v21", "solver_and_version": "CaDiCaL; version in receipts",
        "scope_n": 12, "cap_profile": [5, 4, 6], "fixed_named_roles": "named arm cell 6",
        "constraint_level": "SOURCE_FAITHFUL_FINITE", "SAT_UNSAT_UNKNOWN_TIMEOUT": "SAT",
        "raw_model_count": 21, "canonical_model_count": "one witness retained per canary",
        "proof_or_core_available": "SAT replay only; terminal proof unauthenticated",
        "seed": "v1..v21", "timeout": "UNKNOWN", "elapsed": "UNKNOWN",
        "notes": "Every canary SAT_WITNESS_REPLAYED; no aggregate/universal result.",
    },
    {
        "run_id": "a5-v17-fixed-selector-cell", "lane": "R221-EX12/A5",
        "source_head": "UNKNOWN", "artifact_path": "docs/computational-closure-plan-2026-07-28.md",
        "encoding_version": "A5-v17-fixed-xu-w-jd-v-d8", "solver_and_version": "CaDiCaL + DRAT/LRAT audit",
        "scope_n": 12, "cap_profile": [5, 4, 6],
        "fixed_named_roles": "xu/w fixed; (jd,v)=(0,2); d=8", "constraint_level": "SOURCE_FAITHFUL_FINITE",
        "SAT_UNSAT_UNKNOWN_TIMEOUT": "UNSAT", "raw_model_count": 0, "canonical_model_count": 0,
        "proof_or_core_available": "fresh DRAT verified; 472-clause core (467 inherited + 5 live)",
        "seed": "fixed cell", "timeout": "NONE REPORTED", "elapsed": "UNKNOWN",
        "notes": "Forces 9 in row 8 and 9 not in row 8; fixed selector/cell only.",
    },
    {
        "run_id": "exact12-next-row-arm-cells52-58-65-71", "lane": "R221-EX12/A5",
        "source_head": "UNKNOWN", "artifact_path": "docs/exact12-next-row-arm-terminal-promotion-2026-08-13.md",
        "encoding_version": "finite-pure-RUP-cells", "solver_and_version": "kernel-checked Lean replay",
        "scope_n": 12, "cap_profile": [5, 4, 6], "fixed_named_roles": "cells 52,58,65,71",
        "constraint_level": "SOURCE_FAITHFUL_FINITE", "SAT_UNSAT_UNKNOWN_TIMEOUT": "UNSAT",
        "raw_model_count": 0, "canonical_model_count": 0,
        "proof_or_core_available": "7 pure-RUP additions over 369,326-clause base",
        "seed": "cells52,58,65,71", "timeout": "NONE", "elapsed": "UNKNOWN",
        "notes": "Kernel-checked finite facts; no proof of selector coverage.",
    },
    {
        "run_id": "exact12-v26-projected-enumeration", "lane": "R221-EX12/A5",
        "source_head": "UNKNOWN", "artifact_path": "docs/exact12-v26-projected-model-space-2026-08-20.md",
        "encoding_version": "exact12-v26-projected-row-cubes", "solver_and_version": "CaDiCaL; version in report",
        "scope_n": 12, "cap_profile": [5, 4, 6], "fixed_named_roles": "v26 named roles",
        "constraint_level": "INCIDENCE_PLUS_ORDER", "SAT_UNSAT_UNKNOWN_TIMEOUT": "SAT_SAMPLING_LIMIT",
        "raw_model_count": 300, "canonical_model_count": 300,
        "proof_or_core_available": "NO", "seed": "projected enumeration",
        "timeout": "512s sample", "elapsed": "512s",
        "notes": "At least 300 projected cubes; 0/300 orientation-coverable; empirical sample only.",
    },
    {
        "run_id": "exact12-source-v3", "lane": "R221-EX12/A5", "source_head": "UNKNOWN",
        "artifact_path": "scratch/pentagon-offclass-exact12-v2/cegar-d0-v2-source-v3/summary.json",
        "encoding_version": "exact12-source-sensitive-v3", "solver_and_version": "CaDiCaL + Python CEGAR; version in campaign artifacts",
        "scope_n": 12, "cap_profile": [5, 4, 6], "fixed_named_roles": "d=0 source-sensitive blocker/fiber roles",
        "constraint_level": "INCIDENCE_ONLY", "SAT_UNSAT_UNKNOWN_TIMEOUT": "ITERATION_LIMIT",
        "raw_model_count": 5000, "canonical_model_count": "NOT ESTABLISHED",
        "proof_or_core_available": "NO", "seed": "single campaign", "timeout": "5,000 iterations",
        "elapsed": "UNKNOWN", "notes": "5,000 bootstrap records and 10,000 learned clauses; blocker/fiber diagnostics only.",
    },
    {
        "run_id": "exact12-source-constraints-v4", "lane": "R221-EX12/A5", "source_head": "UNKNOWN",
        "artifact_path": "scratch/pentagon-offclass-exact12-v2/cegar-d0-v2-source-constraints-v4/summary.json",
        "encoding_version": "exact12-source-constraints-v4", "solver_and_version": "CaDiCaL + Python CEGAR; version in campaign artifacts",
        "scope_n": 12, "cap_profile": [5, 4, 6], "fixed_named_roles": "d=0 source constraints",
        "constraint_level": "SOURCE_FAITHFUL_FINITE", "SAT_UNSAT_UNKNOWN_TIMEOUT": "ITERATION_LIMIT",
        "raw_model_count": 1250, "canonical_model_count": "NOT ESTABLISHED",
        "proof_or_core_available": "Lean producers checked; Python adapter not kernel-checked",
        "seed": "single campaign", "timeout": "1,000 new iterations", "elapsed": "UNKNOWN",
        "notes": "1,250 v4 records and 10,000 inherited clauses; no terminal proof.",
    },
    {
        "run_id": "exact12-source-role-deletion-v5", "lane": "R221-EX12/A5", "source_head": "UNKNOWN",
        "artifact_path": "scratch/pentagon-offclass-exact12-v2/cegar-d0-v2-source-role-deletion-v5-u-q/summary.json",
        "encoding_version": "exact12-source-role-deletion-v5-six-arms", "solver_and_version": "CaDiCaL + Python CEGAR; version in summaries",
        "scope_n": 12, "cap_profile": [5, 4, 6],
        "fixed_named_roles": ["u-q", "u-w", "xu-q", "xu-w", "xv-q", "xv-w"],
        "constraint_level": "SOURCE_FAITHFUL_FINITE", "SAT_UNSAT_UNKNOWN_TIMEOUT": "ITERATION_LIMIT",
        "raw_model_count": 606, "canonical_model_count": "NOT ESTABLISHED",
        "proof_or_core_available": "NO", "seed": "six role/deletion cells", "timeout": "100 new iterations per arm",
        "elapsed": "UNKNOWN", "notes": "All six arms end at iteration limit with 101 retained records each; one shared refinement wave.",
    },
    {
        "run_id": "exact12-dichotomy-v6-hit-u-q", "lane": "R221-EX12/A5", "source_head": "UNKNOWN",
        "artifact_path": "scratch/pentagon-offclass-exact12-v2/cegar-d0-v2-dichotomy-v6-hit-u-q-run/summary.json",
        "encoding_version": "exact12-dichotomy-v6-hit-u-q", "solver_and_version": "CaDiCaL + Python CEGAR; version in summary",
        "scope_n": 12, "cap_profile": [5, 4, 6], "fixed_named_roles": "v6 hit-u-q arm",
        "constraint_level": "SOURCE_FAITHFUL_FINITE", "SAT_UNSAT_UNKNOWN_TIMEOUT": "ITERATION_LIMIT",
        "raw_model_count": 10, "canonical_model_count": "NOT ESTABLISHED",
        "proof_or_core_available": "NO", "seed": "hit-u-q", "timeout": "10 iterations",
        "elapsed": "UNKNOWN", "notes": "Production wave only; smoke files are excluded from the wave count.",
    },
    {
        "run_id": "exact12-common-v7-u-q", "lane": "R221-EX12/A5", "source_head": "UNKNOWN",
        "artifact_path": "scratch/pentagon-offclass-exact12-v2/cegar-d0-v2-common-v7-u-q-mask-census-500/summary.json",
        "encoding_version": "exact12-common-v7-concrete-row-u-q", "solver_and_version": "CaDiCaL + Python CEGAR; version in summaries",
        "scope_n": 12, "cap_profile": [5, 4, 6], "fixed_named_roles": "v7 u-q concrete-row arm",
        "constraint_level": "SOURCE_FAITHFUL_FINITE", "SAT_UNSAT_UNKNOWN_TIMEOUT": "ITERATION_LIMIT",
        "raw_model_count": 11500, "canonical_model_count": "NOT ESTABLISHED",
        "proof_or_core_available": "NO", "seed": "50 and 500 budget variants", "timeout": "5,000-iteration continuation",
        "elapsed": "UNKNOWN", "notes": "Combined shared-encoding census/continuation; summaries declare 50 and 11,500 records.",
    },
    {
        "run_id": "ex17-schema-c-seeds1701-1717", "lane": "R221-EX17", "source_head": "UNKNOWN",
        "artifact_path": "scratch/rigid221-blockerv-exact17-20260806/schema-c-smoke-seed1701/checkpoint.json",
        "encoding_version": "schema-C-boolean-linear", "solver_and_version": "CaDiCaL + linear oracle; versions in checkpoints",
        "scope_n": 17, "cap_profile": [9, 8], "fixed_named_roles": "schema-C exact17 labels",
        "constraint_level": "INCIDENCE_PLUS_ORDER", "SAT_UNSAT_UNKNOWN_TIMEOUT": "ITERATION_LIMIT_OR_LINEAR_UNKNOWN",
        "raw_model_count": 1512, "canonical_model_count": 1509,
        "proof_or_core_available": "NO", "seed": "1701..1717", "timeout": "13 iteration-limit cells",
        "elapsed": "UNKNOWN", "notes": "Boolean SAT traces; 13 iteration-limit and 3 linear-unknown production cells.",
    },
    {
        "run_id": "ex17-schema-cde-wave2-seeds1801-1816", "lane": "R221-EX17", "source_head": "UNKNOWN",
        "artifact_path": "scratch/rigid221-blockerv-exact17-20260806/schema-cde-wave2-seed1801/checkpoint.json",
        "encoding_version": "schema-CDE-wave2", "solver_and_version": "CaDiCaL + linear oracle; versions in checkpoints",
        "scope_n": 17, "cap_profile": [9, 8], "fixed_named_roles": "schema-CDE exact17 labels",
        "constraint_level": "INCIDENCE_PLUS_ORDER", "SAT_UNSAT_UNKNOWN_TIMEOUT": "ITERATION_LIMIT_OR_LINEAR_UNKNOWN",
        "raw_model_count": 3082, "canonical_model_count": 3075,
        "proof_or_core_available": "NO", "seed": "1801..1816", "timeout": "9 iteration-limit cells",
        "elapsed": "UNKNOWN", "notes": "Nine iteration-limit and seven linear-unknown cells; no aggregate UNSAT.",
    },
    {
        "run_id": "ex17-schema-cdef-wave3-seeds1901-1908", "lane": "R221-EX17", "source_head": "UNKNOWN",
        "artifact_path": "scratch/rigid221-blockerv-exact17-20260806/schema-cdef-wave3-seed1901/checkpoint.json",
        "encoding_version": "schema-CDEF-wave3", "solver_and_version": "CaDiCaL + linear oracle; versions in checkpoints",
        "scope_n": 17, "cap_profile": [9, 8], "fixed_named_roles": "schema-CDEF exact17 labels",
        "constraint_level": "INCIDENCE_PLUS_ORDER", "SAT_UNSAT_UNKNOWN_TIMEOUT": "ITERATION_LIMIT_OR_LINEAR_UNKNOWN",
        "raw_model_count": 1722, "canonical_model_count": 1720,
        "proof_or_core_available": "NO", "seed": "1901..1908", "timeout": "6 iteration-limit cells",
        "elapsed": "UNKNOWN", "notes": "Six iteration-limit and two linear-unknown cells; no aggregate UNSAT.",
    },
    {
        "run_id": "ex17-historical-cg-children01-31", "lane": "R221-EX17", "source_head": "UNKNOWN",
        "artifact_path": "scratch/exact17-lean-to-sat/exact17-chain-reauth-20260812.json",
        "encoding_version": "cumulative-C-through-G-children1-31", "solver_and_version": "historical solver versions pinned by reauthentication records",
        "scope_n": 17, "cap_profile": [9, 8], "fixed_named_roles": "31 child roots",
        "constraint_level": "SOURCE_FAITHFUL_FINITE", "SAT_UNSAT_UNKNOWN_TIMEOUT": "SAT_REAUTHENTICATED",
        "raw_model_count": 31, "canonical_model_count": "31 model-bearing child roots",
        "proof_or_core_available": "SAT replay and lineage audit 31/31", "seed": "children1..31",
        "timeout": "historical", "elapsed": "UNKNOWN", "notes": "Reauthentication lineage, not a fresh run; no closure proof.",
    },
    {
        "run_id": "ex17-child45", "lane": "R221-EX17", "source_head": "UNKNOWN",
        "artifact_path": "scratch/exact17-lean-to-sat/child45-export-receipt.json",
        "encoding_version": "child45-next-center-assumptions", "solver_and_version": "solver versions in 13 cell receipts",
        "scope_n": 17, "cap_profile": [9, 8], "fixed_named_roles": "13 attempted child45 cells",
        "constraint_level": "SOURCE_FAITHFUL_FINITE", "SAT_UNSAT_UNKNOWN_TIMEOUT": "SAT",
        "raw_model_count": 13, "canonical_model_count": "13 retained cell models",
        "proof_or_core_available": "export/validation PASS; no UNSAT proof", "seed": "13 cells",
        "timeout": "UNKNOWN", "elapsed": "UNKNOWN", "notes": "All 13 attempted cells SAT at 308 variables and 5,848,824 clauses; no coverage theorem.",
    },
    {
        "run_id": "ex17-child46-export-unrun", "lane": "R221-EX17", "source_head": "UNKNOWN",
        "artifact_path": "scratch/exact17-lean-to-sat/child46-export-receipt.json",
        "encoding_version": "child46-nine-model-rejection-cuts", "solver_and_version": "NOT RUN",
        "scope_n": 17, "cap_profile": [9, 8], "fixed_named_roles": "child46 inherited root",
        "constraint_level": "SOURCE_FAITHFUL_FINITE", "SAT_UNSAT_UNKNOWN_TIMEOUT": "UNKNOWN_UNRUN",
        "raw_model_count": 0, "canonical_model_count": 0,
        "proof_or_core_available": "export/validation only", "seed": "NONE", "timeout": "NONE",
        "elapsed": "NONE", "notes": "36 new clauses and nine inherited-model rejection cuts; lineage metadata, not a solver terminal.",
    },
]


CROSSWALK_FIELDS = [
    "predicate_id", "formal_or_code_location", "plain_mathematical_statement",
    "encoded_direction", "current_Lean_field_or_theorem", "Lean_producer_path",
    "status", "soundness_notes", "used_in_runs",
]


CROSSWALK_ROWS: list[dict[str, Any]] = [
    {
        "predicate_id": "source_identity", "formal_or_code_location": "Rigid221SourceHeavy.lean:71-104",
        "plain_mathematical_statement": "The selected source, u, v, xu, xv, and deleted point retain their semantic identities.",
        "encoded_direction": "Exact in Lean; only selected finite lanes fix all labels.",
        "current_Lean_field_or_theorem": "P.source; packet.xu; packet.xv; packet.physical_class",
        "Lean_producer_path": "exactFourRigid221_sourceEqU_blockerVRowOther_sourceHeavyPacket",
        "status": "MISSING_FROM_ENCODING",
        "soundness_notes": "EX17 fixes canonical labels but retained analyses omit the complete source provenance; EX12/n16 labels are diagnostic.",
        "used_in_runs": "EX17 partial; EX12/n16 relaxed",
    },
    {
        "predicate_id": "actual_blocker_provenance", "formal_or_code_location": "Rigid221SourceHeavy.lean:96-101,3570-3577",
        "plain_mathematical_statement": "Each named transition uses the actual centerAt blocker, including blocker(xv)=v.",
        "encoded_direction": "Lean implies named equalities; generic finite blocker maps do not establish centerAt provenance.",
        "current_Lean_field_or_theorem": "packet.blocker_eq_xv; Q.hblockerEqV",
        "Lean_producer_path": "large residual constructor chain",
        "status": "WEAKER_THAN_LEAN",
        "soundness_notes": "EX12/n16 maps are complete combinatorial maps but are not tied to every Lean source; EX17 analyses retain no map.",
        "used_in_runs": "EX12 model; n16 probe; absent from retained EX17 analyses",
    },
    {
        "predicate_id": "canonical_row_identity", "formal_or_code_location": "BlockerVExactSeventeenSourceNormalForm.lean:27-65,269-290",
        "plain_mathematical_statement": "The four old rows and fifth row use the canonical Fin 17 labels and exact supports.",
        "encoded_direction": "Lean SourceRealization supplies the finite row identities used by the EX17 exporter.",
        "current_Lean_field_or_theorem": "oldCenter; SourceRealization.row_eq",
        "Lean_producer_path": "exists_exactSeventeenSourceRealization_of_secondCapNine",
        "status": "DERIVED_FROM_LEAN", "soundness_notes": "Finite and definitionally n=17; no ≥18 lift.",
        "used_in_runs": "EX17 source-faithful waves",
    },
    {
        "predicate_id": "radius_equality_classes", "formal_or_code_location": "CriticalShell/CriticalPairFrontier fields upstream",
        "plain_mathematical_statement": "Selected rows come from the required common-radius classes.",
        "encoded_direction": "No retained Boolean assignment or model artifact records the full equal-radius relation.",
        "current_Lean_field_or_theorem": "P.rho and selectedAt/centerAt upstream invariants",
        "Lean_producer_path": "CounterexampleData -> CriticalPairFrontier -> residual context",
        "status": "MISSING_FROM_ENCODING", "soundness_notes": "Kalmanson row rejection is not a substitute for source radius identity.",
        "used_in_runs": "omitted in n16/EX12; not retained in EX17 models",
    },
    {
        "predicate_id": "physical_class_exact_five", "formal_or_code_location": "Rigid221SourceHeavy.lean:91-95,3553-3556",
        "plain_mathematical_statement": "The selected physical radius class is exactly {deleted,u,xu,v,xv}.",
        "encoded_direction": "Lean exact set equality; EX12/n16 encode selected five-point sets only in relaxations.",
        "current_Lean_field_or_theorem": "packet.physical_class; Q.hclassFive",
        "Lean_producer_path": "rigid 2+2+1 globalDeletion producer",
        "status": "WEAKER_THAN_LEAN", "soundness_notes": "Finite membership alone lacks source/radius provenance.",
        "used_in_runs": "n16; EX12; EX17 canonical labels",
    },
    {
        "predicate_id": "cap_location", "formal_or_code_location": "Rigid221SourceHeavy.lean:99-103,3557-3563",
        "plain_mathematical_statement": "u,xu,xv and the named blocker occupy the prescribed cap interior.",
        "encoded_direction": "EX17 canonical cap membership is produced by its exact finite adapter; relaxed lanes encode only profiles/sets.",
        "current_Lean_field_or_theorem": "packet.source_pair_interior; Q.hxvInterior; Q.hblockerInterior",
        "Lean_producer_path": "source-heavy packet and large residual constructor",
        "status": "DERIVED_FROM_LEAN", "soundness_notes": "Status applies to EX17 source-normal-form labels only; n16/EX12 remain weaker.",
        "used_in_runs": "EX17; relaxed approximations in EX12/n16",
    },
    {
        "predicate_id": "cyclic_order", "formal_or_code_location": "BlockerVExactSeventeenSourceNormalForm.lean:67-128",
        "plain_mathematical_statement": "The 17 labels occur in one of the two source-forced cyclic orders and orientations.",
        "encoded_direction": "Lean exact-17 adapter implies the enumerated order; other lanes have no authenticated order.",
        "current_Lean_field_or_theorem": "position; labelAtPosition; SourceRealization.ccw",
        "Lean_producer_path": "exact-17 order promotion",
        "status": "DERIVED_FROM_LEAN", "soundness_notes": "Only exact 17; the stored order does not by itself prove strict convexity.",
        "used_in_runs": "EX17 order cells; absent from n16 and exact12 model.json",
    },
    {
        "predicate_id": "row_omissions", "formal_or_code_location": "Rigid221SourceHeavy.lean:3539-3552",
        "plain_mathematical_statement": "u,xu,xv are absent from the specified xu/deleted rows.",
        "encoded_direction": "Large residual gives named non-incidences; exact row tables can encode stronger complete supports.",
        "current_Lean_field_or_theorem": "Q.huNotXuRow; Q.hxvNotXuRow; Q.huNotDeletedRow; Q.hxuNotDeletedRow; Q.hxvNotDeletedRow",
        "Lean_producer_path": "large residual constructor",
        "status": "STRONGER_THAN_LEAN", "soundness_notes": "Complete finite support tables add omissions beyond the named Lean fields; UNSAT needs direction audit.",
        "used_in_runs": "EX17 exact rows; EX12/n16 cube rows",
    },
    {
        "predicate_id": "prescribed_deletion", "formal_or_code_location": "Rigid221SourceHeavy.lean:3545-3552",
        "plain_mathematical_statement": "The jointDeletion point is the prescribed deleted point in the named rows.",
        "encoded_direction": "Lean retains the dependent jointDeletion witness; EX12/n16 retain only an integer label; EX17 analyses omit it.",
        "current_Lean_field_or_theorem": "P.jointDeletion.deleted; Q.hdeletedXuRow; Q.hvDeletedRow",
        "Lean_producer_path": "OriginalUniqueFourResidual -> context P -> Q",
        "status": "WEAKER_THAN_LEAN", "soundness_notes": "A label named deleted is not proof of the dependent deletion provenance.",
        "used_in_runs": "EX12/n16 labels; absent from EX17 analyses",
    },
    {
        "predicate_id": "deletion_survival", "formal_or_code_location": "OriginalUniqueFourResidual/globalDeletion upstream fields",
        "plain_mathematical_statement": "Every row or critical structure used after deletion survives the prescribed deletion.",
        "encoded_direction": "Not represented in retained model records.",
        "current_Lean_field_or_theorem": "dependent upstream survival witnesses",
        "Lean_producer_path": "globalDeletion and selectedAt construction",
        "status": "MISSING_FROM_ENCODING", "soundness_notes": "An unused point is not thereby removable; arbitrary projection is invalid.",
        "used_in_runs": "none of the retained model corpus",
    },
    {
        "predicate_id": "center_not_in_support", "formal_or_code_location": "CriticalFourShell validity upstream; finite cube generators",
        "plain_mathematical_statement": "A row center is not one of its own four support points.",
        "encoded_direction": "Finite row generators enforce it; Lean selected shells provide it upstream.",
        "current_Lean_field_or_theorem": "CriticalFourShell center/support invariants",
        "Lean_producer_path": "selectedAt.toCriticalFourShell",
        "status": "DERIVED_FROM_LEAN", "soundness_notes": "Exact for the generic shell predicate, but does not authenticate which source selected the row.",
        "used_in_runs": "EX17; EX12; n16",
    },
    {
        "predicate_id": "strict_convexity_general_position", "formal_or_code_location": "BlockerVExactSeventeenSourceNormalForm.lean:269-290 and geometric parent packet",
        "plain_mathematical_statement": "The carrier is strictly convex/in general position with the required orientation signs.",
        "encoded_direction": "EX17 order is necessary but not sufficient; strict-linear oracle rejects most row shadows.",
        "current_Lean_field_or_theorem": "SourceRealization.convexIndep; SourceRealization.ccw",
        "Lean_producer_path": "exact-17 source realization adapter",
        "status": "MISSING_FROM_ENCODING", "soundness_notes": "8,259 linear contradictions and 21 unknowns are not stored Euclidean models.",
        "used_in_runs": "external oracle only in EX17; absent in EX12/n16",
    },
    {
        "predicate_id": "minimality_and_global_k4", "formal_or_code_location": "CounterexampleData and CriticalShellSystem upstream",
        "plain_mathematical_statement": "The carrier comes from the minimal P97 counterexample and every required four-point shell/global K4 condition holds.",
        "encoded_direction": "No audited finite lane carries the full upstream dependent packet.",
        "current_Lean_field_or_theorem": "CounterexampleData; CriticalShellSystem",
        "Lean_producer_path": "global theorem assumptions",
        "status": "MISSING_FROM_ENCODING", "soundness_notes": "K4/minimality is not hereditary under arbitrary subsets or deletion.",
        "used_in_runs": "none in full strength",
    },
    {
        "predicate_id": "exact_cardinality_17", "formal_or_code_location": "BlockerVExactSeventeenSourceNormalForm.lean:269-290",
        "plain_mathematical_statement": "The source carrier has exactly 17 points and is identified with Fin 17.",
        "encoded_direction": "Exact adapter and CNF both fix n=17.",
        "current_Lean_field_or_theorem": "SourceRealization.card_eq; position embedding",
        "Lean_producer_path": "exists_exactSeventeenSourceRealization_of_secondCapNine",
        "status": "EXACT", "soundness_notes": "This is precisely why EX17 data cannot establish the n≥18 leaf.",
        "used_in_runs": "all EX17 waves",
    },
    {
        "predicate_id": "two_kalmanson_cancellation", "formal_or_code_location": "EX17 theorem-bank clause generators and PIQD receipts",
        "plain_mathematical_statement": "Selected row pairs admit an exact Kalmanson cancellation contradiction for the fixed cyclic order.",
        "encoded_direction": "Source-entitled certificate clauses reject the current finite assignment when their hypotheses match.",
        "current_Lean_field_or_theorem": "exact-17 weighted/two-Kalmanson certificate ingress",
        "Lean_producer_path": "checked theorem-bank clause generator",
        "status": "DERIVED_FROM_LEAN", "soundness_notes": "Per-assignment finite rejection; neither Boolean closure nor a cardinality-independent occurrence theorem.",
        "used_in_runs": "EX17 v24t onward and PIQD",
    },
    {
        "predicate_id": "five_cross_centre_incidences", "formal_or_code_location": "Rigid221SourceHeavy.lean:15406,16021,16113",
        "plain_mathematical_statement": "Five named cross-centre incidences feed the existing tetrahedron terminal.",
        "encoded_direction": "Current large packet does not produce all five; no large CEGAR lane encodes the missing producer.",
        "current_Lean_field_or_theorem": "pentagonOffClassBlocker_fixedPhysicalPair_uDeletion_false_of_tetrahedron_incidences",
        "Lean_producer_path": "MISSING",
        "status": "NO_CURRENT_LEAN_PRODUCER", "soundness_notes": "This is the first load-bearing antecedent, not an empirical consequence of bounded row shadows.",
        "used_in_runs": "A5 fixed-cell core touches a bounded specialization only",
    },
]


DAG_FIELDS = [
    "edge_id", "from_population", "to_population", "operation",
    "role_preserving", "full_packet_preserving", "evidence", "status",
    "first_missing_predicate", "notes",
]


DAG_ROWS: list[dict[str, Any]] = [
    {
        "edge_id": "ex12-to-n16", "from_population": "R221-EX12/A5 n=12 incidence shadows",
        "to_population": "R221-LARGE-RELAXATION n=16 incidence shadow",
        "operation": "extension by four carrier labels", "role_preserving": "NOT ESTABLISHED",
        "full_packet_preserving": "NO", "evidence": "No common source-faithful schema or model map retained",
        "status": "NO_EDGE", "first_missing_predicate": "source identity and prescribed-deletion survival",
        "notes": "Similar role names do not define an extension.",
    },
    {
        "edge_id": "n16-to-ex17", "from_population": "n=16 offclass incidence probe",
        "to_population": "n=17 exact-cap-nine source-normal-form shadows",
        "operation": "add one unnamed point", "role_preserving": "NOT ESTABLISHED",
        "full_packet_preserving": "NO", "evidence": "Different packet schemas; no extension witness",
        "status": "NO_EDGE", "first_missing_predicate": "cyclic order, radius classes, and source row provenance",
        "notes": "The n=16 SAT probe is weaker than the n=17 finite adapter.",
    },
    {
        "edge_id": "ex17-projection-to-n16", "from_population": "R221-EX17 stored row/order shadows",
        "to_population": "n=16 carrier", "operation": "delete an unnamed label",
        "role_preserving": "UNTESTED", "full_packet_preserving": "NO",
        "evidence": "No retained proof that all selected rows, blockers, cap identities, and K4 data survive",
        "status": "INVALID_OPERATION", "first_missing_predicate": "deletion survival",
        "notes": "Unused by selected rows is explicitly not a removability certificate.",
    },
    {
        "edge_id": "ex17-to-large", "from_population": "exact-17 SourceRealization",
        "to_population": "cardinality at least 18 large residual", "operation": "lift finite terminal",
        "role_preserving": "NO", "full_packet_preserving": "NO",
        "evidence": "SourceRealization.card_eq fixes cardinality 17",
        "status": "TYPE_BOUNDARY_BLOCKS_EDGE", "first_missing_predicate": "cardinality-independent producer or carrier-at-most-17 theorem",
        "notes": "Exact-17 certificates cannot consume the ≥18 leaf.",
    },
    {
        "edge_id": "period45-extension", "from_population": "bounded period-4/5 order cells",
        "to_population": "larger incidence/order shadows", "operation": "repeat local order template",
        "role_preserving": "PARTIAL", "full_packet_preserving": "NO",
        "evidence": "scratch period45 shared-order extension reports 6 and 24 normalized cells",
        "status": "COMBINATORIAL_SHADOW_ONLY", "first_missing_predicate": "global period-3/source packet compatibility",
        "notes": "Local-extremum disjointness does not supply a large residual.",
    },
    {
        "edge_id": "one-row-extension", "from_population": "bounded exact rational period-three witness",
        "to_population": "one-row-extended shadow", "operation": "add a row/point",
        "role_preserving": "PARTIAL", "full_packet_preserving": "NO",
        "evidence": "scratch one-row-extension-countermodel/REPORT.md",
        "status": "COUNTERMODEL_TO_NAIVE_EXTENSION_ONLY", "first_missing_predicate": "full parent residual packet",
        "notes": "Useful regression against a naive invariant; not a P97 or large-residual model.",
    },
]


REFINEMENT_FIELDS = [
    "refinement_id", "lane", "predecessor", "added_predicate_or_rule",
    "derivation", "status_before", "status_after", "raw_survivors_before",
    "raw_survivors_after", "canonical_survivors_before", "canonical_survivors_after",
    "families_killed", "proof_status", "source_scope", "notes",
]


REFINEMENT_ROWS: list[dict[str, Any]] = [
    {
        "refinement_id": "freshthird-overlap-v5", "lane": "OTHER-R221-FRESHTHIRD",
        "predecessor": "all-large-caps-v4", "added_predicate_or_rule": "cap overlap bound",
        "derivation": "SOURCE-DERIVED FINITE RELAXATION", "status_before": "SAT", "status_after": "SAT",
        "raw_survivors_before": 1, "raw_survivors_after": 1,
        "canonical_survivors_before": "UNKNOWN", "canonical_survivors_after": "UNKNOWN",
        "families_killed": "not measurable from one retained witness", "proof_status": "independent SAT replay",
        "source_scope": "n=17 relaxation", "notes": "Still omits load-bearing FreshThird predicates and is unrelated to the live large packet.",
    },
    {
        "refinement_id": "ex17-v24t-model-cuts", "lane": "R221-EX17", "predecessor": "v23t seeds3601..3609",
        "added_predicate_or_rule": "nine assignment-specific model cuts", "derivation": "DIAGNOSTIC",
        "status_before": "SAT", "status_after": "SAT", "raw_survivors_before": 9,
        "raw_survivors_after": 18, "canonical_survivors_before": 9,
        "canonical_survivors_after": "at least 18 distinct retained seeds", "families_killed": "only the nine exact prior assignments",
        "proof_status": "no Boolean UNSAT", "source_scope": "exact 17 only",
        "notes": "Complete linear oracle rejected successor models, but the Boolean formula remained SAT.",
    },
    {
        "refinement_id": "ex17-dihedral-certificate-bank", "lane": "R221-EX17", "predecessor": "v24t/v25t",
        "added_predicate_or_rule": "60 exact certificates and 2,040 dihedral images", "derivation": "DERIVED_FROM_LEAN",
        "status_before": "SAT_BOOLEAN/UNSAT_LINEAR", "status_after": "ITERATION_LIMIT",
        "raw_survivors_before": 18, "raw_survivors_after": 32,
        "canonical_survivors_before": "at least 18", "canonical_survivors_after": "NOT ESTABLISHED",
        "families_killed": "certificate-matching exact assignments only", "proof_status": "certificate clauses checked; no coverage proof",
        "source_scope": "exact 17 fixed order/cells", "notes": "No cardinality-independent occurrence theorem.",
    },
    {
        "refinement_id": "ex17-two-kalmanson-piqd", "lane": "R221-EX17", "predecessor": "source-frozen root",
        "added_predicate_or_rule": "130,291 pair-closure clauses from 5,994 cancelling pairs", "derivation": "DERIVED_FROM_LEAN",
        "status_before": "SAT", "status_after": "SAT", "raw_survivors_before": 1,
        "raw_survivors_after": 1, "canonical_survivors_before": 1, "canonical_survivors_after": 1,
        "families_killed": "current cancelling-pair matches; successor uses 738 new disjoint pairs",
        "proof_status": "CERT-001 structural replay; proof endpoint not called", "source_scope": "exact 17 fixed CNF root",
        "notes": "Strong diagnostic churn without Boolean closure.",
    },
    {
        "refinement_id": "ex17-child41-mine", "lane": "R221-EX17", "predecessor": "authenticated child41 SAT",
        "added_predicate_or_rule": "mine two-Kalmanson occurrence supports", "derivation": "DIAGNOSTIC",
        "status_before": "SAT", "status_after": "SAT", "raw_survivors_before": 1, "raw_survivors_after": 1,
        "canonical_survivors_before": 1, "canonical_survivors_after": 1,
        "families_killed": "none (mining only)", "proof_status": "1282 records -> 433 supports -> 133 minimal",
        "source_scope": "one exact-17 selected cell", "notes": "Not an exhaustive motif census.",
    },
    {
        "refinement_id": "ex17-child43-mine", "lane": "R221-EX17", "predecessor": "authenticated child43 SAT",
        "added_predicate_or_rule": "mine two-Kalmanson occurrence supports", "derivation": "DIAGNOSTIC",
        "status_before": "SAT", "status_after": "SAT", "raw_survivors_before": 1, "raw_survivors_after": 1,
        "canonical_survivors_before": 1, "canonical_survivors_after": 1,
        "families_killed": "none (mining only)", "proof_status": "155 records -> 100 supports -> 57 minimal",
        "source_scope": "one exact-17 selected cell", "notes": "Not an exhaustive motif census.",
    },
    {
        "refinement_id": "ex17-child44-mine", "lane": "R221-EX17", "predecessor": "authenticated child44 SAT",
        "added_predicate_or_rule": "mine two-Kalmanson occurrence supports", "derivation": "DIAGNOSTIC",
        "status_before": "SAT", "status_after": "SAT", "raw_survivors_before": 1, "raw_survivors_after": 1,
        "canonical_survivors_before": 1, "canonical_survivors_after": 1,
        "families_killed": "none (mining only)", "proof_status": "500 records -> 212 supports -> 99 minimal",
        "source_scope": "one exact-17 selected cell", "notes": "Not an exhaustive motif census.",
    },
    {
        "refinement_id": "exact12-v4-direct-wave", "lane": "R221-EX12/A5", "predecessor": "exact12 ordered base",
        "added_predicate_or_rule": "per-model CEGAR row/order cuts across 12 cells", "derivation": "MIXED SOURCE/DIAGNOSTIC",
        "status_before": "SAT", "status_after": "ITERATION_LIMIT_OR_STRUCTURALLY_UNRESOLVED",
        "raw_survivors_before": "UNKNOWN", "raw_survivors_after": 6896,
        "canonical_survivors_before": "UNKNOWN", "canonical_survivors_after": "UNKNOWN",
        "families_killed": "not reconstructible from retained aggregate", "proof_status": "no UNSAT cell",
        "source_scope": "exact12 named cells", "notes": "Timeout/limit is not UNSAT.",
    },
    {
        "refinement_id": "a5-v17-fixed-missing-incidence", "lane": "R221-EX12/A5",
        "predecessor": "fixed xu/w,(jd,v)=(0,2),d=8 cell",
        "added_predicate_or_rule": "five live source clauses for the distinguished missing incidence",
        "derivation": "SOURCE-DERIVED FOR FIXED CELL", "status_before": "SAT/OPEN", "status_after": "UNSAT",
        "raw_survivors_before": "UNKNOWN", "raw_survivors_after": 0,
        "canonical_survivors_before": "UNKNOWN", "canonical_survivors_after": 0,
        "families_killed": "only the fixed selector cell", "proof_status": "fresh DRAT verified; 472-clause core; 4,362 resolution steps",
        "source_scope": "fixed exact12/A5 selector", "notes": "Five hard clauses force 9 in row 8 and 9 not in row 8; other selectors remain open.",
    },
    {
        "refinement_id": "exact12-v26-projection", "lane": "R221-EX12/A5", "predecessor": "v24/v25 projected cubes",
        "added_predicate_or_rule": "v26 projection and orientation test", "derivation": "DIAGNOSTIC",
        "status_before": "SAT", "status_after": "SAT_SAMPLING_LIMIT", "raw_survivors_before": 24,
        "raw_survivors_after": 300, "canonical_survivors_before": 24, "canonical_survivors_after": 300,
        "families_killed": "no aggregate family extinction; 0/300 orientation-coverable",
        "proof_status": "empirical sample", "source_scope": "exact12 finite projection",
        "notes": "Counts 68 -> 24 -> at least 300 across versions are not a monotone exhaustive census.",
    },
]


UNSAT_RECORDS: list[dict[str, Any]] = [
    {
        "schema": "rigid221-cegar-risk-audit.unsat-or-ablation.v1", "record_id": "a5-v17-fixed-cell-core",
        "lane": "R221-EX12/A5", "status": "UNSAT_DRAT_VERIFIED",
        "scope": "fixed xu/w, (jointDeletion,v)=(0,2), distinguished d=8 selector cell",
        "core_clauses": 472, "inherited_safe_cover_clauses": 467, "live_source_clauses": 5,
        "resolution_steps": 4362, "rat_steps": 0,
        "hard_semantics": "the five live clauses force label 9 both into and out of row 8",
        "source_available": True, "lift": "NONE; other selectors remain ITERATION_LIMIT",
        "evidence": "docs/computational-closure-plan-2026-07-28.md:4320-4425",
    },
    {
        "schema": "rigid221-cegar-risk-audit.unsat-or-ablation.v1", "record_id": "exact12-next-row-cells-52-58-65-71",
        "lane": "R221-EX12/A5", "status": "UNSAT_KERNEL_CHECKED_FINITE",
        "scope": "four finite named-deletion cells 52,58,65,71",
        "core_clauses": None, "inherited_safe_cover_clauses": 369326,
        "live_source_clauses": 7, "resolution_steps": None, "rat_steps": 0,
        "hard_semantics": "seven pure-RUP additions per promoted finite endpoint",
        "source_available": True, "lift": "NONE; selector coverage is not proved",
        "evidence": "docs/exact12-next-row-arm-terminal-promotion-2026-08-13.md",
    },
    {
        "schema": "rigid221-cegar-risk-audit.unsat-or-ablation.v1", "record_id": "ex17-order0-linear-rejections",
        "lane": "R221-EX17", "status": "LINEAR_ORACLE_UNSAT_AGGREGATE",
        "scope": "28 exact-17 anonymous placements, fixed order 0",
        "core_clauses": None, "raw_boolean_models": 8280, "linear_unsat": 8259,
        "metric_unknown": 21, "bank_hits": 5999, "bank_misses": 2260,
        "hard_semantics": "strict cyclic-order/Kalmanson incompatibility for each rejected row shadow",
        "source_available": "per-certificate only", "lift": "NONE; Boolean CNF and large branch remain open",
        "evidence": "scratch/rigid221-blockerv-exact17-20260806/SOURCE-FAITHFUL-CORE-BANK-AUDIT-2026-08-07.md",
    },
    {
        "schema": "rigid221-cegar-risk-audit.unsat-or-ablation.v1", "record_id": "ex16-full-kalmanson-14-cells",
        "lane": "R221-EX16-DIAGNOSTIC", "status": "LINEAR_ORACLE_UNSAT_AGGREGATE",
        "scope": "orders 0/1 and insertions 9..15", "core_clauses": None,
        "raw_boolean_models": 17640, "linear_unsat": 17640, "metric_unknown": 0,
        "hard_semantics": "finite Kalmanson row-order contradiction",
        "source_available": False, "lift": "NONE; full source packet not encoded",
        "evidence": "scratch/rigid221-blockerv-offclass-exact16-probe-20260806/full-kalmanson-o{0,1}-i{9..15}.json",
    },
]


STATIC_EVIDENCE = [
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceNormalForm.lean",
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean",
    "docs/specs/p97-card-ge-eighteen-coverage-route-v1.md",
    "docs/closure-plan-full-spec-2026-07-09.md",
    "docs/closure-matrix-2026-07-09.md",
    "docs/computational-closure-plan-2026-07-28.md",
    "docs/audits/p97-exact17-cegar-piqd-soundness-audit-2026-08-12.md",
    "docs/exact12-v26-projected-model-space-2026-08-20.md",
    "docs/exact12-v26-survivor-structural-analysis-2026-08-20.md",
    "docs/exact12-next-row-arm-terminal-promotion-2026-08-13.md",
    "docs/exact-twelve-rigid221-ordered-v4-replay-checkpoint-2026-08-08.md",
    "scratch/rigid221-blockerv-exact17-20260806/SOURCE-FAITHFUL-CORE-BANK-AUDIT-2026-08-07.md",
    "scratch/rigid221-blockerv-offclass-probe-20260806/REPORT.md",
    "scratch/pentagon-offclass-exact12-v2/REPORT.md",
    "scratch/freshthird-current-cegar-audit-20260803.md",
    "scratch/two-shell-partial-euclidean-model/REPORT.md",
    "scratch/atail-force/blocker_graph/euclidean_countermodel.py",
    "scratch/atail-force/residual_456_exact_witness.json",
    "scratch/atail-force/endpoint-continuation/finite_countermodel.lean",
    "scratch/period45-shared-order-extension/REPORT.md",
    "scratch/one-row-extension-countermodel/REPORT.md",
    "scratch/global-k4-extension/REPORT.md",
]

EXTRA_EVIDENCE_GLOBS = [
    "scratch/pentagon-offclass-exact12-v2/cegar-d0-v2-source-role-deletion-v5-*/summary.json",
    "scratch/pentagon-offclass-exact12-v2/cegar-d0-v2-common-v7-u-q-mask-census-*/summary.json",
    "scratch/rigid221-blockerv-exact17-20260806/schema-c-smoke-seed1701/checkpoint.json",
    "scratch/rigid221-blockerv-exact17-20260806/schema-c-wave-seed*/checkpoint.json",
    "scratch/rigid221-blockerv-exact17-20260806/schema-cde-wave2-seed*/checkpoint.json",
    "scratch/rigid221-blockerv-exact17-20260806/schema-cdef-wave3-seed*/checkpoint.json",
    "scratch/child45-cells-full-summary.json",
    "scratch/exact17-lean-to-sat/child45-export-receipt.json",
    "scratch/exact17-lean-to-sat/child46-export-receipt.json",
    "scratch/exact17-lean-to-sat/exact17-chain-reauth-20260812.json",
]


def enrich_run_rows() -> tuple[list[dict[str, Any]], list[dict[str, str]]]:
    rows: list[dict[str, Any]] = []
    evidence: list[dict[str, str]] = []
    for source in RUN_ROWS:
        row = dict(source)
        path_text = str(row["artifact_path"])
        path = REPO / path_text
        row.setdefault("input_sha256", "UNKNOWN")
        row.setdefault("output_sha256", "UNKNOWN")
        if path.is_file():
            row["output_sha256"] = sha256_file(path)
            evidence.append(evidence_row(path, f"run inventory: {row['run_id']}"))
            if path.suffix == ".json":
                try:
                    data = load_json(path)
                except (OSError, json.JSONDecodeError, TypeError):
                    data = {}
                for key in ("cnf_sha256", "input_sha256", "problem_sha256"):
                    if isinstance(data.get(key), str):
                        row["input_sha256"] = data[key]
                        break
                for key in ("assignment_sha256", "model_sha256", "output_sha256"):
                    if isinstance(data.get(key), str):
                        row["output_sha256"] = data[key]
                        break
        elif path.is_dir():
            row["output_sha256"] = "DIRECTORY_NOT_HASHED; see evidence_manifest.csv"
        else:
            row["output_sha256"] = "ARTIFACT_PATH_NOT_PRESENT_AT_AUDIT_HEAD"
        rows.append(row)
    return rows, evidence


def collect_static_evidence() -> list[dict[str, str]]:
    rows = []
    for relative in STATIC_EVIDENCE:
        path = REPO / relative
        if path.is_file():
            rows.append(evidence_row(path, "source-boundary or report evidence"))
    exact16 = SCRATCH / "rigid221-blockerv-offclass-exact16-probe-20260806"
    if exact16.exists():
        for path in sorted(exact16.glob("full-kalmanson-o*-i*.json")):
            rows.append(evidence_row(path, "EX16 aggregate cell summary"))
    for pattern in EXTRA_EVIDENCE_GLOBS:
        for path in sorted(REPO.glob(pattern)):
            if path.is_file():
                rows.append(evidence_row(path, "grouped run-wave evidence"))
    return rows


def write_jsonl(path: Path, records: Iterable[dict[str, Any]]) -> None:
    with path.open("w", encoding="utf-8") as handle:
        for record in records:
            handle.write(stable_json(record) + "\n")


def write_representative_cards(models: Sequence[dict[str, Any]]) -> None:
    directory = BUNDLE / "representative-models"
    directory.mkdir(parents=True, exist_ok=True)
    by_path = {
        model["provenance_paths"][0]: model for model in models
        if model.get("provenance_paths")
    }

    cards: list[tuple[str, str]] = []
    cards.append((
        "README.md",
        """# Representative-model regression suite

These cards form a deliberately adversarial suite. Each card states the exact
encoding or partial geometry that its artifact passes and the load-bearing
hypotheses it fails. No card is a full source-faithful Euclidean Rigid221
survivor, and `00-large-corpus-absence.md` records that the corpus contains no
model at `n >= 18` for the live residual.

The canonical machine records for in-scope row assignments are in
`../canonical_models.jsonl`; exact coordinate stress objects that lack the live
packet remain reference cards rather than being normalized into that schema.
""",
    ))
    cards.append((
        "00-large-corpus-absence.md",
        """# R221-LARGE: corpus absence card

**Classification:** PROVEN artifact-audit fact at the frozen source boundary.
**Population:** the live `card_ge_eighteen` leaf, not a finite relaxation.

No source-faithful model, survivor, UNSAT run, or cross-cardinality CEGAR wave
for `n >= 18` is retained in the repository. The current Lean leaf remains
open. This card is intentionally in the regression suite: any future report
must not silently relabel an exact-17 or incidence-only survivor as large-case
evidence.

**Passes:** absence/provenance audit only.
**Fails to provide:** an assignment, coordinates, a bounded extraction, an
invariant, or any reduction of the live risk.
""",
    ))

    for index, path_text in enumerate(
        (rel(path) for path in EX17_DECODED_MODELS), start=1
    ):
        model = by_path[path_text]
        cards.append((
            f"0{index}-ex17-decoded-boolean.md",
            f"""# EX17 decoded Boolean representative {index}

**Classification:** EMPIRICALLY VERIFIED finite structural SAT assignment.
**Model ID:** `{model['model_id']}`
**Artifact:** `{path_text}`
**Artifact SHA-256:** `{model['provenance_sha256'][0]}`
**Recorded model SHA-256:** `{model.get('recorded_model_sha256')}`

The record contains all 17 four-point row supports, fixed named order 0, and
the selected next center. It was replayed against its Boolean clauses.

**Passes:** retained exact-17 incidence/order CNF and row-size checks.
**Fails:** its own claim records `source_realizable=false`; it has no Euclidean
coordinates, radius classes, complete source-to-blocker provenance, or
prescribed-deletion survival. It is not a P97 counterexample and cannot consume
the `n >= 18` leaf.
""",
        ))

    exact12 = by_path[rel(EX12_MODEL)]
    cards.append((
        "03-ex12-blocker-map-shadow.md",
        f"""# EX12 complete blocker-map incidence shadow

**Classification:** EMPIRICALLY VERIFIED incidence-only SAT.
**Model ID:** `{exact12['model_id']}`
**Artifact:** `{rel(EX12_MODEL)}`
**Artifact SHA-256:** `{sha256_file(EX12_MODEL)}`

This is the richest retained EX12 assignment: all 12 row supports, the full
12-point blocker map, three cap sets, interiors, named roles, physical class,
and trace edges. CaDiCaL and Z3 independently checked the encoded assignment.

**Passes:** the finite incidence formula and recorded placement constraints.
**Fails:** cyclic order, Euclidean distances, strict convexity, MEC semantics,
minimality/global K4, complete `no_qfree`, and dependent deletion provenance.
It is a countermodel only to claims made from those weaker predicates.
""",
    ))

    n16 = by_path[rel(N16_MODEL)]
    cards.append((
        "04-n16-large-relaxation.md",
        f"""# n=16 off-class incidence relaxation

**Classification:** EMPIRICALLY VERIFIED SAT for a weaker encoding.
**Model ID:** `{n16['model_id']}`
**Artifact:** `{rel(N16_MODEL)}`
**Artifact SHA-256:** `{sha256_file(N16_MODEL)}`

The probe retains 16 four-point rows, a six-source blocker map, the named
`2+2+1` roles, and cap profile `(5,5,9)`.

**Passes:** the incidence-only probe.
**Fails:** the live residual's source identities, cyclic order, common-radius
classes, Euclidean realization, minimality/K4, and deletion survival. This is
the smallest stored warning against deriving the desired cross-centre
incidences from anonymous row incidence alone.
""",
    ))

    cards.extend([
        (
            "05-two-shell-partial-euclidean.md",
            f"""# Exact algebraic two-shell stress model

**Classification:** EMPIRICALLY VERIFIED partial metric witness.
**Artifact:** `scratch/two-shell-partial-euclidean-model/REPORT.md`
**Artifact SHA-256:** `{sha256_file(REPO / 'scratch/two-shell-partial-euclidean-model/REPORT.md')}`

The report gives exact algebraic parabola coordinates with radicals for an
`n=11` strictly convex configuration, two complete blocker shells, and cross
omissions. It is retained because it defeats purely local two-shell metric
intuition.

Exact coordinates are `P(t)=(t,t^2)` with:

```text
O=-21/10
g=-5/4-sqrt(59)/20
e=-1-sqrt(26)/10
h=-5/4+sqrt(59)/20
f=-1+sqrt(26)/10
a=1-sqrt(186)/10
u=5/4-sqrt(603)/20
c=8/5
d=17/10
b=1+sqrt(186)/10
v=5/4+sqrt(603)/20
```

**Fails:** the exact-four first-apex class, large residual, global source
packet, and a full P97 counterexample. Coordinates live in the report rather
than a standalone canonical model object.
""",
        ),
        (
            "06-residual456-exact-witness.md",
            f"""# Exact biquadratic residual-(4,5,6) witness

**Classification:** EMPIRICALLY VERIFIED exact-algebraic regression witness.
**Artifact:** `scratch/atail-force/residual_456_exact_witness.json`
**Artifact SHA-256:** `{sha256_file(REPO / 'scratch/atail-force/residual_456_exact_witness.json')}`

This strict-convex `n=12` model shows that a source/blocker row can land at a
cap endpoint while omitting both endpoints. It is the endpoint/unused-point
regression witness.

The exact field is `Q(sqrt(3),sqrt(K))`, where
`K=6709288214136987/738259314849316`. Coordinates in the basis
`(1,sqrt(3),sqrt(K),sqrt(3*K))` are:

```text
0  (0, 0)
1  (1, 0)
2  (8000000/15162281, 13364000/15162281)
3  (86332191/113667809, 73940000/113667809)
4  (83361759/116638241, 81580000/116638241)
5  (1/2, sqrt(3)/2)
6  (125000/932989, 466500/932989)
7  (2218335411287671/3446926521424658
      - 397957542336000/1723463260712329*sqrt(K),
    1320077828308000/1723463260712329
      - 399650467287671/1723463260712329*sqrt(K))
8  (821346826799671/4680835845200329,
    -255311400664000/4680835845200329)
9  (80260746401719/231315774098281,
    -23628829041000/231315774098281)
10 (18577799715470958/17280617942264521,
    -5156814462480000/17280617942264521)
11 (29872168159262/27034865360369,
    -7784691428800/27034865360369)
```

**Fails:** all-center K4, MEC, and the full source-dependent residual fields.
Therefore it refutes only the omitted-hypothesis inference, not the live route.
""",
        ),
        (
            "07-global-k4-integer-coordinate-stress.md",
            f"""# Integer-coordinate blocker-graph stress construction

**Classification:** EMPIRICALLY VERIFIED partial Euclidean construction.
**Artifact:** `scratch/atail-force/blocker_graph/euclidean_countermodel.py`
**Artifact SHA-256:** `{sha256_file(REPO / 'scratch/atail-force/blocker_graph/euclidean_countermodel.py')}`

The exact integer-coordinate `n=33` construction has global K4,
deletion-minimality, genuine blocker cycles, and an injective two-apex distance
map. It protects the audit against overclaiming from blocker-graph structure.

Exact coordinates (with apices `(3,4)` and `(5,1)`) are:

```text
(0,0) (0,1) (0,5) (0,6) (1,0) (1,1) (1,3) (1,4) (1,5) (1,6)
(2,2) (2,3) (2,4) (2,5) (3,1) (3,2) (3,3) (3,4) (3,5)
(4,1) (4,2) (4,3) (4,4) (5,0) (5,1) (5,2) (5,3) (5,5) (5,6)
(6,0) (6,1) (6,5) (6,6)
```

**Fails:** convexity and the Moser/cap/source packet. It is neither a large
Rigid221 residual nor a P97 counterexample.
""",
        ),
        (
            "08-unused-point-deletion-regression.md",
            f"""# Unused-point deletion regression

**Classification:** PROVEN finite incidence/order regression.
**Artifact:** `scratch/atail-force/endpoint-continuation/finite_countermodel.lean`
**Artifact SHA-256:** `{sha256_file(REPO / 'scratch/atail-force/endpoint-continuation/finite_countermodel.lean')}`

The kernel-checked `Fin 13` model has interior blocker-cycle rows that omit both
cap endpoints. It records the precise failure mode behind the rule: a point
unused by selected rows is not thereby removable.

**Fails:** metric realization and the full source packet. Its role is to reject
arbitrary-deletion edges in the containment DAG.
""",
        ),
    ])

    expected = {name for name, _ in cards}
    for path in directory.glob("*.md"):
        if path.name not in expected:
            raise RuntimeError(f"unexpected representative card: {path}")
    for name, body in cards:
        (directory / name).write_text(body, encoding="utf-8")


def write_sha256sums() -> None:
    output = BUNDLE / "SHA256SUMS"
    paths = sorted(
        path for path in BUNDLE.rglob("*")
        if path.is_file() and path != output
    )
    lines = [f"{sha256_file(path)}  {path.relative_to(BUNDLE).as_posix()}" for path in paths]
    output.write_text("\n".join(lines) + "\n", encoding="utf-8")


def small_coefficient_separator_count(
    models: Sequence[dict[str, Any]], features: Sequence[dict[str, Any]]
) -> tuple[int, int, int]:
    """Reproduce the diagnostic [-3,3]^6 separator search cited in the report."""
    status_by_id = {
        model["model_id"]: set(model.get("metric_oracle_status_counts", {}))
        for model in models
    }
    names = [
        "I_out", "P_repeat", "X_cross", "Span_min", "Span_max", "Span_total"
    ]
    linear_unsat = []
    linear_unknown = []
    for row in features:
        if row["semantic_level"] != "ROW_ORDER_SHADOW":
            continue
        vector = tuple(int(row[name]) for name in names)
        status = status_by_id[row["model_id"]]
        if status == {"unsat"}:
            linear_unsat.append(vector)
        elif status == {"UNKNOWN"}:
            linear_unknown.append(vector)
    separators = 0
    for coefficients in itertools.product(range(-3, 4), repeat=len(names)):
        if not any(coefficients):
            continue
        unsat_scores = [
            sum(coefficient * value for coefficient, value in zip(coefficients, vector))
            for vector in linear_unsat
        ]
        unknown_scores = [
            sum(coefficient * value for coefficient, value in zip(coefficients, vector))
            for vector in linear_unknown
        ]
        if (
            max(unsat_scores) < min(unknown_scores)
            or max(unknown_scores) < min(unsat_scores)
        ):
            separators += 1
    return separators, len(linear_unsat), len(linear_unknown)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--skip-checksums", action="store_true")
    parser.add_argument(
        "--check-small-coefficients",
        action="store_true",
        help="also reproduce the slower [-3,3]^6 diagnostic separator search",
    )
    args = parser.parse_args()

    models, model_evidence = build_models()
    features = [feature_row(model) for model in models]
    run_rows, run_evidence = enrich_run_rows()
    evidence = dedup_evidence(model_evidence + run_evidence + collect_static_evidence())

    write_jsonl(BUNDLE / "canonical_models.jsonl", models)
    write_csv(BUNDLE / "model_features.csv", features, FEATURE_FIELDS)
    write_csv(BUNDLE / "run_inventory.csv", run_rows, RUN_FIELDS)
    write_csv(BUNDLE / "predicate_crosswalk.csv", CROSSWALK_ROWS, CROSSWALK_FIELDS)
    write_csv(BUNDLE / "containment_extension_dag.csv", DAG_ROWS, DAG_FIELDS)
    write_csv(BUNDLE / "refinement_effects.csv", REFINEMENT_ROWS, REFINEMENT_FIELDS)
    write_jsonl(BUNDLE / "unsat_cores_or_ablations.jsonl", UNSAT_RECORDS)
    write_csv(
        BUNDLE / "evidence_manifest.csv", evidence,
        ["artifact_path", "sha256", "bytes", "use"],
    )
    write_representative_cards(models)
    if not args.skip_checksums:
        write_sha256sums()

    counts = Counter((model["scope_n"], model["semantic_level"]) for model in models)
    summary = ", ".join(
        f"n={n}/{level}:{count}" for (n, level), count in sorted(counts.items())
    )
    print(
        f"wrote {len(models)} canonical records, {len(run_rows)} run rows, "
        f"{len(evidence)} evidence hashes; {summary}"
    )
    if args.check_small_coefficients:
        separators, unsat_count, unknown_count = small_coefficient_separator_count(
            models, features
        )
        print(
            "small-coefficient search: "
            f"unsat-only={unsat_count}, unknown-only={unknown_count}, "
            f"strict-separators={separators}"
        )


if __name__ == "__main__":
    main()
