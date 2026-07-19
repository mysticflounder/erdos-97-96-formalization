#!/usr/bin/env python3
"""Mine recurring combinatorial motifs across every current source-indexed core.

This is theorem-discovery support, not a realizability or coverage proof.  It
uses the saved source-indexed row hypergraphs, separates scanner-admitted from
queued cores, checks injective-relabel embeddings with the scanner's own
matcher, and reports recurring low-dimensional incidence motifs.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
import re
import statistics
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any, Iterable

from census.global_confinement.metric_realizability_probe import MetricRow
from card_five_source_indexed_target_probe import (
    LOCAL_EXACT_QQ_NOGOODS,
    has_exact_qq_core_up_to_relabeling,
)
from probe_saved_source_indexed_patterns import PATTERNS


CORE_PREFIX = "source-indexed-unit-core-654-"
CORE_NUMBER = re.compile(
    r"^source-indexed-unit-core-654-(\d+)(?:-([A-Za-z0-9_-]+))?$"
)
GENERATOR_NAME = re.compile(r"ROW_(\d+)_(\d+)_(\d+)")


def core_number(name: str) -> int:
    match = CORE_NUMBER.fullmatch(name)
    if match is None:
        raise ValueError(f"malformed core name: {name}")
    return int(match.group(1))


def core_sort_key(name: str) -> tuple[int, str]:
    return core_number(name), name


def stable_name_sort_key(name: str) -> tuple[int, int, str]:
    match = CORE_NUMBER.fullmatch(name)
    if match is None:
        return (1, 0, name)
    return (0, int(match.group(1)), name)


def is_variant(name: str) -> bool:
    match = CORE_NUMBER.fullmatch(name)
    if match is None:
        raise ValueError(f"malformed core name: {name}")
    return match.group(2) is not None


def all_core_rows() -> dict[str, dict[int, tuple[int, ...]]]:
    result: dict[str, dict[int, tuple[int, ...]]] = {
        name: {center: tuple(support) for center, support in core}
        for name, core in LOCAL_EXACT_QQ_NOGOODS.items()
        if name.startswith(CORE_PREFIX)
    }
    for name, rows in PATTERNS.items():
        if not name.startswith(CORE_PREFIX):
            continue
        normalized = {center: tuple(support) for center, support in rows.items()}
        if name in result and result[name] != normalized:
            raise AssertionError(f"scanner/saved-pattern row drift for {name}")
        result[name] = normalized
    return result


def points_of(rows: dict[int, tuple[int, ...]]) -> set[int]:
    points = set(rows)
    for support in rows.values():
        points.update(support)
    return points


def histogram(values: Iterable[int]) -> dict[str, int]:
    return {
        str(value): count
        for value, count in sorted(Counter(values).items())
    }


def row_pair_motif(
    left: tuple[int, tuple[int, ...]],
    right: tuple[int, tuple[int, ...]],
) -> tuple[int, int, int, int, int]:
    left_center, left_support_raw = left
    right_center, right_support_raw = right
    left_support = frozenset(left_support_raw)
    right_support = frozenset(right_support_raw)
    left_size = len(left_support)
    right_size = len(right_support)
    left_to_right = int(right_center in left_support)
    right_to_left = int(left_center in right_support)
    intersection = len(left_support & right_support)
    if left_size < right_size:
        return (
            right_size,
            left_size,
            right_to_left,
            left_to_right,
            intersection,
        )
    if left_size == right_size and (left_to_right, right_to_left) > (
        right_to_left,
        left_to_right,
    ):
        left_to_right, right_to_left = right_to_left, left_to_right
    return (
        left_size,
        right_size,
        left_to_right,
        right_to_left,
        intersection,
    )


def canonical_center_digraph_signature(
    selected: tuple[int, int, int],
    supports: dict[int, frozenset[int]],
) -> str:
    """Canonical directed-incidence graph on three selected row centers."""

    candidates: list[str] = []
    for order in itertools.permutations(selected):
        candidates.append("".join(
            str(int(order[j] in supports[order[i]]))
            for i in range(3)
            for j in range(3)
            if i != j
        ))
    return min(candidates)


def canonical_three_row_signature(
    selected: tuple[int, int, int],
    supports: dict[int, frozenset[int]],
) -> str:
    """Canonical full incidence type of three rows.

    The selected centers remain distinguished row/point labels. Every other
    point is quotiented only by the subset of the three supports containing it.
    Thus the signature is complete for the three-row equality hypergraph up to
    row permutation and relabeling of all non-center points.
    """

    selected_set = frozenset(selected)
    candidates: list[tuple[tuple[int, ...], tuple[int, ...], tuple[int, ...]]] = []
    for order in itertools.permutations(selected):
        support_sizes = tuple(len(supports[center]) for center in order)
        center_membership = tuple(
            int(order[j] in supports[order[i]])
            for i in range(3)
            for j in range(3)
        )
        external_counts = [0] * 8
        external_points = set().union(*(supports[center] for center in order))
        external_points.difference_update(selected_set)
        for point in external_points:
            mask = sum(
                (1 << i) for i, center in enumerate(order)
                if point in supports[center]
            )
            external_counts[mask] += 1
        candidates.append((
            support_sizes,
            center_membership,
            tuple(external_counts[1:]),
        ))
    sizes, center_bits, external = min(candidates)
    return (
        "s=" + ",".join(map(str, sizes))
        + ";c=" + "".join(map(str, center_bits))
        + ";e=" + ",".join(map(str, external))
    )


def triple_has_directed_cycle(
    selected: tuple[int, int, int],
    arcs: set[tuple[int, int]],
) -> bool:
    first, second, third = selected
    return (
        all(edge in arcs for edge in ((first, second), (second, third), (third, first)))
        or all(
            edge in arcs
            for edge in ((first, third), (third, second), (second, first))
        )
    )


def triple_has_mutual_pair(
    selected: tuple[int, int, int],
    arcs: set[tuple[int, int]],
) -> bool:
    return any(
        (left, right) in arcs and (right, left) in arcs
        for left, right in itertools.combinations(selected, 2)
    )


def overlap_components(
    rows: dict[int, tuple[int, ...]], minimum_intersection: int
) -> list[int]:
    centers = sorted(rows)
    adjacency = {center: set() for center in centers}
    for left, right in itertools.combinations(centers, 2):
        if len(set(rows[left]) & set(rows[right])) >= minimum_intersection:
            adjacency[left].add(right)
            adjacency[right].add(left)
    components: list[int] = []
    unseen = set(centers)
    while unseen:
        seed = min(unseen)
        stack = [seed]
        unseen.remove(seed)
        size = 0
        while stack:
            current = stack.pop()
            size += 1
            for neighbor in adjacency[current]:
                if neighbor in unseen:
                    unseen.remove(neighbor)
                    stack.append(neighbor)
        components.append(size)
    return sorted(components, reverse=True)


def analyze_core(name: str, rows: dict[int, tuple[int, ...]]) -> dict[str, Any]:
    centers = set(rows)
    points = points_of(rows)
    supports = {center: frozenset(support) for center, support in rows.items()}
    arcs = {
        (center, other)
        for center, support in supports.items()
        for other in centers
        if other != center and other in support
    }
    mutual_pairs = {
        tuple(sorted((left, right)))
        for left, right in arcs
        if (right, left) in arcs
    }
    directed_three_cycles = 0
    center_digraph_motifs: Counter[str] = Counter()
    three_row_motifs: Counter[str] = Counter()
    directed_cycle_triple_count = 0
    mutual_pair_triple_count = 0
    cycle_and_mutual_triple_count = 0
    for selected in itertools.combinations(sorted(centers), 3):
        forward_cycle = all(
            edge in arcs
            for edge in (
                (selected[0], selected[1]),
                (selected[1], selected[2]),
                (selected[2], selected[0]),
            )
        )
        reverse_cycle = all(
            edge in arcs
            for edge in (
                (selected[0], selected[2]),
                (selected[2], selected[1]),
                (selected[1], selected[0]),
            )
        )
        directed_three_cycles += int(forward_cycle) + int(reverse_cycle)
        has_cycle = forward_cycle or reverse_cycle
        has_mutual = triple_has_mutual_pair(selected, arcs)
        directed_cycle_triple_count += int(has_cycle)
        mutual_pair_triple_count += int(has_mutual)
        cycle_and_mutual_triple_count += int(has_cycle and has_mutual)
        center_digraph_motifs[
            canonical_center_digraph_signature(selected, supports)
        ] += 1
        three_row_motifs[
            canonical_three_row_signature(selected, supports)
        ] += 1

    intersections = [
        len(supports[left] & supports[right])
        for left, right in itertools.combinations(sorted(centers), 2)
    ]
    support_pair_multiplicity: Counter[tuple[int, int]] = Counter()
    support_point_multiplicity: Counter[int] = Counter()
    for support in supports.values():
        support_point_multiplicity.update(support)
        support_pair_multiplicity.update(itertools.combinations(sorted(support), 2))
    repeated_pair_multiplicities = [
        multiplicity
        for multiplicity in support_pair_multiplicity.values()
        if multiplicity >= 2
    ]
    pair_motifs = Counter(
        row_pair_motif(left, right)
        for left, right in itertools.combinations(sorted(rows.items()), 2)
    )
    out_degrees = [sum((center, other) in arcs for other in centers) for center in centers]
    in_degrees = [sum((other, center) in arcs for other in centers) for center in centers]
    tags: list[str] = []
    if mutual_pairs:
        tags.append("mutual-center-incidence")
    if directed_three_cycles:
        tags.append("directed-center-3-cycle")
    if max(intersections, default=0) >= 3:
        tags.append("three-point-row-overlap")
    if max(repeated_pair_multiplicities, default=0) >= 3:
        tags.append("support-pair-used-by-3+-rows")
    if max(support_point_multiplicity.values(), default=0) >= 4:
        tags.append("support-point-used-by-4+-rows")
    if any(len(support) == 5 for support in supports.values()):
        tags.append("five-point-radius-row")
    if overlap_components(rows, 2) == [len(rows)]:
        tags.append("shared-pair-row-network-connected")

    support_sizes = sorted((len(support) for support in supports.values()), reverse=True)
    return {
        "name": name,
        "core_number": core_number(name),
        "status": "admitted" if name in LOCAL_EXACT_QQ_NOGOODS else "queued",
        "row_count": len(rows),
        "equality_count": sum(len(support) - 1 for support in supports.values()),
        "label_count": len(points),
        "support_sizes": support_sizes,
        "center_arc_count": len(arcs),
        "center_out_degrees": sorted(out_degrees, reverse=True),
        "center_in_degrees": sorted(in_degrees, reverse=True),
        "mutual_center_pair_count": len(mutual_pairs),
        "directed_center_three_cycle_count": directed_three_cycles,
        "directed_cycle_triple_count": directed_cycle_triple_count,
        "mutual_pair_triple_count": mutual_pair_triple_count,
        "cycle_and_mutual_triple_count": cycle_and_mutual_triple_count,
        "support_intersection_histogram": histogram(intersections),
        "max_support_intersection": max(intersections, default=0),
        "repeated_support_pair_multiplicity_histogram": histogram(
            repeated_pair_multiplicities
        ),
        "max_support_pair_row_multiplicity": max(
            repeated_pair_multiplicities, default=1
        ),
        "support_point_row_multiplicity_histogram": histogram(
            support_point_multiplicity.values()
        ),
        "max_support_point_row_multiplicity": max(
            support_point_multiplicity.values(), default=0
        ),
        "overlap_components_intersection_ge_2": overlap_components(rows, 2),
        "pair_motifs": {
            "/".join(map(str, motif)): count
            for motif, count in sorted(pair_motifs.items())
        },
        "center_digraph_three_row_motifs": dict(sorted(center_digraph_motifs.items())),
        "full_three_row_motifs": dict(sorted(three_row_motifs.items())),
        "tags": tags,
        "rows": [
            {"center": center, "support": list(support)}
            for center, support in sorted(rows.items())
        ],
    }


def as_metric_rows(rows: dict[int, tuple[int, ...]]) -> tuple[MetricRow, ...]:
    return tuple(
        MetricRow(center=center, support=support, exact=False)
        for center, support in sorted(rows.items())
    )


def possible_embedding(
    pattern: dict[str, Any], candidate: dict[str, Any]
) -> bool:
    if pattern["row_count"] > candidate["row_count"]:
        return False
    if pattern["label_count"] > candidate["label_count"]:
        return False
    pattern_sizes = pattern["support_sizes"]
    candidate_sizes = candidate["support_sizes"]
    return all(
        pattern_size <= candidate_size
        for pattern_size, candidate_size in zip(pattern_sizes, candidate_sizes)
    )


def cluster(
    records: list[dict[str, Any]], fields: tuple[str, ...]
) -> list[dict[str, Any]]:
    groups: dict[str, list[str]] = defaultdict(list)
    values: dict[str, dict[str, Any]] = {}
    for record in records:
        payload = {field: record[field] for field in fields}
        key = json.dumps(payload, sort_keys=True, separators=(",", ":"))
        groups[key].append(record["name"])
        values[key] = payload
    return sorted(
        (
            {"size": len(names), "members": names, "signature": values[key]}
            for key, names in groups.items()
            if len(names) >= 2
        ),
        key=lambda item: (
            -item["size"],
            [core_sort_key(name) for name in item["members"]],
        ),
    )


def attach_certificate_statistics(
    record: dict[str, Any], artifact_directory: Path
) -> None:
    artifact_suffix = record["name"].removeprefix(CORE_PREFIX).replace("-", "_")
    verification_path = artifact_directory / (
        f"unit_core_source_indexed_654_{artifact_suffix}_verification.json"
    )
    if not verification_path.exists():
        return
    verification = json.loads(verification_path.read_text(encoding="utf-8"))
    if not verification.get("verified_exact_identity", False):
        raise AssertionError(f"unverified certificate statistics: {verification_path}")
    statistics_payload = dict(verification["statistics"])
    statistics_payload["verification_file"] = verification_path.name
    record["certificate_statistics"] = statistics_payload

    certificate_path = artifact_directory / (
        f"unit_core_source_indexed_654_{artifact_suffix}_certificate.json"
    )
    generator_names, active_generator_names = stream_active_generator_names(
        certificate_path
    )
    if len(generator_names) != statistics_payload["generator_count"]:
        raise AssertionError(f"generator-count drift: {certificate_path}")
    if len(active_generator_names) != statistics_payload["nonzero_multiplier_count"]:
        raise AssertionError(f"active-generator-count drift: {certificate_path}")
    active_rows = effective_rows_from_generators(active_generator_names)
    record["certificate_active_kernel"] = {
        "generator_names": active_generator_names,
        "row_count": len(active_rows),
        "equality_count": len(active_generator_names),
        "label_count": len(points_of(active_rows)),
        "support_sizes": sorted(
            (len(support) for support in active_rows.values()), reverse=True
        ),
        "rows": [
            {"center": center, "support": list(support)}
            for center, support in sorted(active_rows.items())
        ],
    }


def stream_active_generator_names(certificate_path: Path) -> tuple[list[str], list[str]]:
    """Extract generator names and nonzero-cofactor positions without loading
    hundreds of megabytes of polynomial text into memory.

    Certificate emitters place each JSON string on one physical line; the
    polynomial language itself contains no quotes or newlines. We still derive
    names with a strict regular expression and cross-check counts against the
    independently generated verification artifact.
    """

    generator_names: list[str] = []
    active_flags: list[bool] = []
    section: str | None = None
    with certificate_path.open(encoding="utf-8") as handle:
        for line in handle:
            if '"generator_names": [' in line:
                section = "generator_names"
            elif section == "generator_names" and '"generators": [' in line:
                section = None
            elif '"multipliers": [' in line:
                section = "multipliers"
            elif section == "multipliers" and '"nonzero_multiplier_count":' in line:
                section = None

            if section == "generator_names":
                generator_names.extend(GENERATOR_NAME.findall(line))
            elif section == "multipliers":
                payload = line
                if '"multipliers": [' in payload:
                    payload = payload.split('"multipliers": [', 1)[1]
                stripped = payload.strip()
                if not stripped:
                    continue
                if stripped == "],":
                    section = None
                    continue
                if stripped.endswith(","):
                    stripped = stripped[:-1]
                if stripped == "]":
                    continue
                if not (stripped.startswith('"') and stripped.endswith('"')):
                    raise AssertionError(
                        f"unexpected multiplier serialization in {certificate_path}"
                    )
                active_flags.append(stripped != '"0"')

    normalized_names = ["ROW_" + "_".join(parts) for parts in generator_names]
    if len(normalized_names) != len(active_flags):
        raise AssertionError(f"generator/multiplier drift: {certificate_path}")
    return normalized_names, [
        name for name, active in zip(normalized_names, active_flags) if active
    ]


def effective_rows_from_generators(
    generator_names: Iterable[str],
) -> dict[int, tuple[int, ...]]:
    anchors: dict[int, int] = {}
    supports: dict[int, set[int]] = defaultdict(set)
    for name in generator_names:
        match = GENERATOR_NAME.fullmatch(name)
        if match is None:
            raise AssertionError(f"malformed generator name: {name}")
        center, anchor, other = map(int, match.groups())
        if center in anchors and anchors[center] != anchor:
            raise AssertionError(f"multiple row anchors for center {center}")
        anchors[center] = anchor
        supports[center].update((anchor, other))
    return {
        center: tuple(sorted(support))
        for center, support in sorted(supports.items())
    }


def numeric_summary(values: Iterable[int]) -> dict[str, int | float]:
    data = sorted(values)
    if not data:
        return {}
    return {
        "minimum": data[0],
        "median": statistics.median(data),
        "maximum": data[-1],
    }


def pearson_correlation(
    records: Iterable[dict[str, Any]], left: str, right: str
) -> float | None:
    pairs = [
        (float(record[left]), float(record["certificate_statistics"][right]))
        for record in records
        if "certificate_statistics" in record
    ]
    if len(pairs) < 2:
        return None
    left_values = [pair[0] for pair in pairs]
    right_values = [pair[1] for pair in pairs]
    left_mean = statistics.fmean(left_values)
    right_mean = statistics.fmean(right_values)
    numerator = sum(
        (left_value - left_mean) * (right_value - right_mean)
        for left_value, right_value in pairs
    )
    left_norm = math.sqrt(sum((value - left_mean) ** 2 for value in left_values))
    right_norm = math.sqrt(sum((value - right_mean) ** 2 for value in right_values))
    if left_norm == 0 or right_norm == 0:
        return None
    return numerator / (left_norm * right_norm)


def certificate_profile_groups(
    records: Iterable[dict[str, Any]],
) -> list[dict[str, Any]]:
    groups: dict[tuple[int, int, tuple[int, ...]], list[dict[str, Any]]] = defaultdict(list)
    for record in records:
        if "certificate_statistics" not in record:
            continue
        key = (
            record["row_count"],
            record["equality_count"],
            tuple(record["support_sizes"]),
        )
        groups[key].append(record)
    result = []
    for (row_count, equality_count, support_sizes), members in groups.items():
        result.append({
            "row_count": row_count,
            "equality_count": equality_count,
            "support_sizes": list(support_sizes),
            "certificate_count": len(members),
            "total_multiplier_terms": numeric_summary(
                member["certificate_statistics"]["total_multiplier_terms"]
                for member in members
            ),
            "max_multiplier_degree": numeric_summary(
                member["certificate_statistics"]["max_multiplier_degree"]
                for member in members
            ),
            "nonzero_multiplier_count": numeric_summary(
                member["certificate_statistics"]["nonzero_multiplier_count"]
                for member in members
            ),
            "members": [member["name"] for member in members],
        })
    return sorted(
        result,
        key=lambda group: (
            -group["certificate_count"],
            group["row_count"],
            group["support_sizes"],
        ),
    )


def row_system_profile(rows: dict[int, tuple[int, ...]]) -> dict[str, Any]:
    return {
        "row_count": len(rows),
        "label_count": len(points_of(rows)),
        "support_sizes": sorted(
            (len(support) for support in rows.values()), reverse=True
        ),
    }


def row_system_embeddings(
    pattern_rows: dict[str, dict[int, tuple[int, ...]]],
    candidate_rows: dict[str, dict[int, tuple[int, ...]]],
    *,
    omit_identity_names: bool,
) -> set[tuple[str, str]]:
    pattern_profiles = {
        name: row_system_profile(rows) for name, rows in pattern_rows.items()
    }
    candidate_profiles = {
        name: row_system_profile(rows) for name, rows in candidate_rows.items()
    }
    metric_candidates = {
        name: as_metric_rows(rows) for name, rows in candidate_rows.items()
    }
    core_patterns = {
        name: frozenset(rows.items()) for name, rows in pattern_rows.items()
    }
    result: set[tuple[str, str]] = set()
    for pattern_name, pattern_profile in pattern_profiles.items():
        for candidate_name, candidate_profile in candidate_profiles.items():
            if omit_identity_names and pattern_name == candidate_name:
                continue
            if not possible_embedding(pattern_profile, candidate_profile):
                continue
            if has_exact_qq_core_up_to_relabeling(
                metric_candidates[candidate_name], core_patterns[pattern_name]
            ):
                result.add((pattern_name, candidate_name))
    return result


def isomorphism_classes_from_embeddings(
    names: Iterable[str], embeddings: set[tuple[str, str]]
) -> list[list[str]]:
    names = list(names)
    union_find = UnionFind(names)
    for left, right in embeddings:
        if (right, left) in embeddings:
            union_find.union(left, right)
    classes: dict[str, list[str]] = defaultdict(list)
    for name in names:
        classes[union_find.find(name)].append(name)
    result = [
        sorted(group, key=core_sort_key)
        for group in classes.values()
        if len(group) >= 2
    ]
    return sorted(result, key=lambda group: core_sort_key(group[0]))


def direct_embedding_covers(
    names: Iterable[str], embeddings: set[tuple[str, str]]
) -> list[dict[str, str]]:
    names = list(names)
    strict_embeddings = {
        edge for edge in embeddings if (edge[1], edge[0]) not in embeddings
    }
    result = []
    for pattern_name, candidate_name in sorted(
        strict_embeddings,
        key=lambda edge: (core_sort_key(edge[0]), core_sort_key(edge[1])),
    ):
        if any(
            intermediate not in {pattern_name, candidate_name}
            and (pattern_name, intermediate) in strict_embeddings
            and (intermediate, candidate_name) in strict_embeddings
            for intermediate in names
        ):
            continue
        result.append({"pattern": pattern_name, "candidate": candidate_name})
    return result


def minimum_set_cover(
    universe: Iterable[str],
    coverage: dict[str, set[str]],
    tie_break_weights: dict[str, int],
) -> dict[str, Any]:
    """Solve and independently verify an exact minimum-cardinality set cover."""

    import numpy as np
    from scipy.optimize import Bounds, LinearConstraint, milp

    universe = sorted(set(universe), key=stable_name_sort_key)
    candidates = sorted(
        (name for name, covered in coverage.items() if covered),
        key=stable_name_sort_key,
    )
    uncovered = [
        item for item in universe
        if not any(item in coverage[candidate] for candidate in candidates)
    ]
    if uncovered:
        return {
            "status": "UNCOVERED",
            "uncovered": uncovered,
            "selected": [],
        }
    matrix = np.array([
        [int(item in coverage[candidate]) for candidate in candidates]
        for item in universe
    ], dtype=float)
    bounds = Bounds(np.zeros(len(candidates)), np.ones(len(candidates)))
    integrality = np.ones(len(candidates))
    coverage_constraint = LinearConstraint(
        matrix, np.ones(len(universe)), np.full(len(universe), np.inf)
    )
    first = milp(
        np.ones(len(candidates)),
        integrality=integrality,
        bounds=bounds,
        constraints=coverage_constraint,
    )
    if not first.success or first.x is None:
        raise AssertionError(f"set-cover cardinality solve failed: {first.message}")
    minimum_cardinality = int(round(first.fun))
    cardinality_constraint = LinearConstraint(
        np.ones((1, len(candidates))),
        np.array([minimum_cardinality], dtype=float),
        np.array([minimum_cardinality], dtype=float),
    )
    second = milp(
        np.array([tie_break_weights[name] for name in candidates], dtype=float),
        integrality=integrality,
        bounds=bounds,
        constraints=(coverage_constraint, cardinality_constraint),
    )
    if not second.success or second.x is None:
        raise AssertionError(f"set-cover tie-break solve failed: {second.message}")
    selected = [
        name for name, value in zip(candidates, second.x) if value > 0.5
    ]
    covered = set().union(*(coverage[name] for name in selected))
    if len(selected) != minimum_cardinality or not set(universe) <= covered:
        raise AssertionError("set-cover replay failed")
    return {
        "status": "OPTIMAL",
        "minimum_cardinality": minimum_cardinality,
        "selected": selected,
        "selected_coverages": {
            name: sorted(coverage[name], key=stable_name_sort_key)
            for name in selected
        },
        "tie_break_weight_sum": sum(tie_break_weights[name] for name in selected),
        "solver": "scipy.optimize.milp/HiGHS; exact 0/1 replay of selected cover",
    }


class UnionFind:
    def __init__(self, names: Iterable[str]) -> None:
        self.parent = {name: name for name in names}

    def find(self, name: str) -> str:
        parent = self.parent[name]
        if parent != name:
            self.parent[name] = self.find(parent)
        return self.parent[name]

    def union(self, left: str, right: str) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            if core_sort_key(left_root) <= core_sort_key(right_root):
                self.parent[right_root] = left_root
            else:
                self.parent[left_root] = right_root


def markdown_report(payload: dict[str, Any]) -> str:
    summary = payload["summary"]
    lines = [
        "# Source-indexed core data pattern mining",
        "",
        "This report mines the current fixed equality-row hypergraphs for theorem",
        "discovery. It is not a Euclidean realizability theorem, a coverage proof,",
        "or evidence that any empirical core is forced by `CriticalPairFrontier`.",
        "",
        "## Inventory",
        "",
        f"- Current core candidates: {summary['core_count']}",
        f"- Numbered certificate targets: {summary['numbered_core_count']}",
        f"- Saved alternate variants: {summary['variant_count']}",
        f"- Scanner-admitted exact cores: {summary['admitted_count']}",
        f"- Queued/unadmitted cores: {summary['queued_count']}",
        f"- Replayed exact certificates with statistics: {summary['exact_certificate_statistics_count']}",
        f"- Injective-relabel embeddings between distinct cores: {summary['embedding_count']}",
        f"- Nontrivial exact relabeling classes: {summary['nontrivial_isomorphism_class_count']}",
        "",
        "## Exact relabeling classes",
        "",
    ]
    classes = payload["nontrivial_exact_isomorphism_classes"]
    if classes:
        for group in classes:
            lines.append("- " + ", ".join(group))
    else:
        lines.append("- None: every current core is distinct under exact point relabeling.")

    lines.extend(("", "## Direct subcore-cover relations", ""))
    covers = payload["direct_subcore_cover_relations"]
    if covers:
        lines.extend(
            f"- `{edge['pattern']}` embeds in `{edge['candidate']}`"
            for edge in covers
        )
    else:
        lines.append("- None among distinct exact-isomorphism classes.")

    lines.extend(("", "## Repeated coarse profiles", ""))
    for group in payload["clusters"]["row_profile"][:20]:
        signature = group["signature"]
        lines.append(
            f"- {group['size']} cores: rows={signature['row_count']}, "
            f"equalities={signature['equality_count']}, "
            f"supports={signature['support_sizes']} — "
            + ", ".join(group["members"])
        )

    lines.extend(("", "## Repeated incidence-motif profiles", ""))
    for group in payload["clusters"]["incidence_motif"][:20]:
        signature = group["signature"]
        lines.append(
            f"- {group['size']} cores: arcs={signature['center_arc_count']}, "
            f"mutual={signature['mutual_center_pair_count']}, "
            f"3-cycles={signature['directed_center_three_cycle_count']}, "
            f"intersection histogram={signature['support_intersection_histogram']} — "
            + ", ".join(group["members"])
        )

    lines.extend(("", "## Most frequent two-row motifs", ""))
    lines.extend((
        "The motif key is `larger support size / smaller support size /",
        "larger-center-to-smaller-center incidence / reverse incidence /",
        "support intersection size`.",
        "",
        "| Motif | Occurrences | Cores |",
        "|---|---:|---:|",
    ))
    for motif in payload["global_pair_motifs"][:20]:
        lines.append(
            f"| `{motif['motif']}` | {motif['occurrences']} | {motif['core_count']} |"
        )

    records = payload["cores"]
    core_count = len(records)
    mutual_and_cycle_count = sum(
        record["mutual_center_pair_count"] > 0
        and record["directed_center_three_cycle_count"] > 0
        for record in records
    )
    same_triple_count = sum(
        record["cycle_and_mutual_triple_count"] > 0 for record in records
    )
    intersection_cap_count = sum(
        record["max_support_intersection"] <= 2 for record in records
    )
    pair_multiplicity_cap_count = sum(
        record["max_support_pair_row_multiplicity"] <= 2 for record in records
    )
    lines.extend((
        "",
        "## Universal and near-universal skeleton",
        "",
        f"- {mutual_and_cycle_count}/{core_count} cores contain both a mutual",
        "  center-incidence pair and a directed center 3-cycle somewhere.",
        f"- {same_triple_count}/{core_count} cores contain a single three-row",
        "  subsystem having both features.",
        f"- {intersection_cap_count}/{core_count} cores have pairwise support",
        "  intersections of size at most two.",
        f"- {pair_multiplicity_cap_count}/{core_count} cores use every support-point",
        "  pair in at most two rows.",
        "",
        "These are data invariants of the saved cores, not standalone",
        "infeasibility statements.",
    ))

    lines.extend((
        "",
        "## Three-row center-digraph motifs",
        "",
        "The six-bit key records the directed incidences among three row centers",
        "after canonical row permutation. The table is sorted by core coverage.",
        "",
        "| Motif | Occurrences | Cores |",
        "|---|---:|---:|",
    ))
    for motif in payload["global_center_digraph_three_row_motifs"][:20]:
        lines.append(
            f"| `{motif['motif']}` | {motif['occurrences']} | {motif['core_count']} |"
        )

    lines.extend((
        "",
        "## Full three-row equality motifs",
        "",
        "These signatures retain support sizes, incidences of the three centers,",
        "and the multiplicity of every non-center support-membership mask. They",
        "are complete for a three-row subsystem up to row permutation and",
        "relabeling of non-center points.",
        "",
        "| Cores | Occurrences | Signature |",
        "|---:|---:|---|",
    ))
    for motif in payload["global_full_three_row_motifs"][:20]:
        lines.append(
            f"| {motif['core_count']} | {motif['occurrences']} | `{motif['motif']}` |"
        )

    triple_cover = payload["minimum_full_three_row_motif_cover"]
    lines.extend((
        "",
        "### Exact cover by full three-row motifs",
        "",
        f"An exact 0/1 set-cover solve needs {triple_cover.get('minimum_cardinality', 'no')}",
        "complete three-row types to hit every current full core. The selected",
        "minimum-cardinality cover is:",
        "",
    ))
    for motif in triple_cover.get("selected", []):
        lines.append(
            f"- `{motif}` — covers "
            f"{len(triple_cover['selected_coverages'][motif])} cores"
        )
    lines.extend((
        "",
        "Every selected type is a proper subsystem of a row-minimal exact core,",
        "so this five-way cover is a case-packaging opportunity, not five local",
        "contradiction theorems.",
    ))

    certificate_analysis = payload["certificate_analysis"]
    lines.extend((
        "",
        "## Exact-certificate complexity",
        "",
        f"Statistics are available for {certificate_analysis['count']} independently",
        "replayed exact identities. They measure the generated coordinate",
        "certificate, so gauge and generator order can affect them.",
        "",
        "- Total multiplier terms: "
        + str(certificate_analysis["total_multiplier_terms"]),
        "- Maximum multiplier-degree histogram: "
        + str(certificate_analysis["max_multiplier_degree_histogram"]),
        "- Nonzero-multiplier-count histogram: "
        + str(certificate_analysis["nonzero_multiplier_count_histogram"]),
        "",
        "### Smallest exact identities by total multiplier terms",
        "",
        "| Core | Terms | Degree | Active/equalities |",
        "|---|---:|---:|---:|",
    ))
    for item in certificate_analysis["smallest_by_total_terms"]:
        lines.append(
            f"| `{item['name']}` | {item['total_multiplier_terms']} | "
            f"{item['max_multiplier_degree']} | {item['nonzero_multiplier_count']}/"
            f"{item['generator_count']} |"
        )

    lines.extend((
        "",
        "### Largest exact identities by total multiplier terms",
        "",
        "| Core | Terms | Degree | Active/equalities |",
        "|---|---:|---:|---:|",
    ))
    for item in certificate_analysis["largest_by_total_terms"]:
        lines.append(
            f"| `{item['name']}` | {item['total_multiplier_terms']} | "
            f"{item['max_multiplier_degree']} | {item['nonzero_multiplier_count']}/"
            f"{item['generator_count']} |"
        )

    active = payload["certificate_active_kernel_analysis"]
    active_summary = active["summary_invariants"]
    lines.extend((
        "",
        "## Certificate-active equality kernels",
        "",
        "Zero cofactors were removed from all replayed identities, leaving the",
        "smallest equality systems actually used by those fixed certificates.",
        "This is a certificate-supported strengthening of each nominal cut; it",
        "does not claim globally minimal polynomial support.",
        "",
        f"- Active kernels analyzed: {active['kernel_count']}",
        "- Embeddings between distinct active kernels: "
        + str(active["embedding_count_between_distinct_kernels"]),
        "- Active-kernel embeddings into the 55 full cores: "
        + str(active["active_to_full_embedding_count"]),
        "- Queued full cores covered by an existing active kernel: "
        + str(len(active["queued_full_cores_covered_by_existing_active_kernels"])),
        f"- Minimum active kernels needed for the {len(payload['admitted_cores'])} "
        "admitted full cores: "
        + str(active["minimum_active_kernel_cover_admitted_full_cores"].get(
            "minimum_cardinality", "unavailable"
        )),
        "- Minimum complete three-row motif types covering all active kernels: "
        + str(active["minimum_full_three_row_motif_cover"].get(
            "minimum_cardinality", "unavailable"
        )),
        f"- Mutual pair plus directed cycle: "
        f"{active_summary['mutual_and_directed_cycle_core_count']}/"
        f"{active['kernel_count']}",
        f"- Same triple contains both: "
        f"{active_summary['same_triple_mutual_and_directed_cycle_core_count']}/"
        f"{active['kernel_count']}",
        "",
        "The only nontrivial exact relabeling class is:",
        "",
    ))
    for group in active["nontrivial_exact_isomorphism_classes"]:
        lines.append("- " + ", ".join(f"`{name}`" for name in group))
    lines.extend((
        "",
        "Those two certificates share one six-label, five-row, nine-equality",
        "kernel with support sizes `[4, 3, 3, 2, 2]`. Core 54 has the same coarse",
        "profile but is not isomorphic. No active kernel covers any of the "
        + str(len(payload["queued_cores"])),
        "queued cores, so their exact-certificate gates remain real.",
        "",
        "### Repeated active-kernel row profiles",
        "",
    ))
    for group in active["clusters"]["row_profile"][:20]:
        signature = group["signature"]
        lines.append(
            f"- {group['size']} kernels: rows={signature['row_count']}, "
            f"equalities={signature['equality_count']}, "
            f"supports={signature['support_sizes']} — "
            + ", ".join(group["members"])
        )

    active_motif_cover = active["minimum_full_three_row_motif_cover"]
    lines.extend((
        "",
        "### Active-kernel three-row motif cover",
        "",
        "The exact minimum complete-three-row motif cover selects:",
        "",
    ))
    for motif in active_motif_cover.get("selected", []):
        covered = active_motif_cover["selected_coverages"][motif]
        lines.append(f"- `{motif}` covers {len(covered)} active kernels")
    lines.extend((
        "",
        "As with the full-core cover, these are proper subsystems of certified",
        "kernels and therefore organize cases; they are not local contradictions.",
    ))

    lines.extend(("", "## Motif-tag families", ""))
    for group in payload["clusters"]["tag_family"]:
        lines.append(
            f"- {group['size']} cores, tags={group['signature']['tags']}: "
            + ", ".join(group["members"])
        )

    lines.extend((
        "",
        "## Generalization reading",
        "",
        "- No two current cores can share a wrapper merely by exact relabeling or",
        "  direct subcore containment; the observed proliferation is genuine.",
        "- Repeated two-row and shared-pair motifs are candidates for small geometric",
        "  lemmas, but frequency alone does not prove a common contradiction theorem.",
        "- The center-cycle plus reciprocal-edge skeleton is the strongest universal",
        "  incidence pattern, but it has elementary realizations and therefore is",
        "  only a preprocessing shape, not a contradiction target.",
        "- The first concrete shared lift is the six-label, nine-equality active",
        "  kernel common to cores 07 and 08. Other current active kernels remain",
        "  distinct under the tested exact/subkernel relation.",
        "- The fully uniform lift remains a finite-type `EqualityCore`/Gram-certificate",
        "  checker: it abstracts all row and label counts without asserting coverage.",
        "- Any producer theorem still has to derive one of these row hypergraphs from",
        "  the concrete frontier; the data analysis cannot supply that implication.",
        "",
    ))
    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--json-output", type=Path, required=True)
    parser.add_argument("--markdown-output", type=Path, required=True)
    args = parser.parse_args()

    all_rows = all_core_rows()
    names = sorted(all_rows, key=core_sort_key)
    records = [analyze_core(name, all_rows[name]) for name in names]
    artifact_directory = args.json_output.resolve().parent
    for record in records:
        attach_certificate_statistics(record, artifact_directory)
    by_name = {record["name"]: record for record in records}
    metric_rows = {name: as_metric_rows(all_rows[name]) for name in names}
    cores = {name: frozenset(all_rows[name].items()) for name in names}

    active_rows: dict[str, dict[int, tuple[int, ...]]] = {}
    for record in records:
        kernel = record.get("certificate_active_kernel")
        if kernel is None:
            continue
        active_rows[record["name"]] = {
            row["center"]: tuple(row["support"])
            for row in kernel["rows"]
        }
    active_names = sorted(active_rows, key=core_sort_key)
    active_records = [
        analyze_core(name, active_rows[name]) for name in active_names
    ]
    active_record_by_name = {
        record["name"]: record for record in active_records
    }
    active_kernel_embeddings = row_system_embeddings(
        active_rows, active_rows, omit_identity_names=True
    )
    active_kernel_isomorphism_classes = isomorphism_classes_from_embeddings(
        active_names, active_kernel_embeddings
    )
    active_kernel_direct_covers = direct_embedding_covers(
        active_names, active_kernel_embeddings
    )
    active_global_three_row_motifs: Counter[str] = Counter()
    active_three_row_motif_kernels: dict[str, set[str]] = defaultdict(set)
    for record in active_records:
        for motif, count in record["full_three_row_motifs"].items():
            active_global_three_row_motifs[motif] += count
            active_three_row_motif_kernels[motif].add(record["name"])
    active_three_row_cover_weights = {
        motif: (len(active_records) - len(covered)) * 1000 + index
        for index, (motif, covered) in enumerate(
            sorted(active_three_row_motif_kernels.items())
        )
    }
    minimum_active_three_row_motif_cover = minimum_set_cover(
        active_names,
        active_three_row_motif_kernels,
        active_three_row_cover_weights,
    )
    active_to_full_embeddings = row_system_embeddings(
        active_rows, all_rows, omit_identity_names=False
    )
    full_coverage_by_active: dict[str, set[str]] = {
        name: set() for name in active_names
    }
    active_coverers_by_full: dict[str, set[str]] = {
        name: set() for name in names
    }
    for active_name, full_name in active_to_full_embeddings:
        full_coverage_by_active[active_name].add(full_name)
        active_coverers_by_full[full_name].add(active_name)
    active_tie_break_weights = {
        name: (
            by_name[name]["certificate_active_kernel"]["equality_count"] * 1000
            + core_number(name)
        )
        for name in active_names
    }
    admitted_names = [
        record["name"] for record in records if record["status"] == "admitted"
    ]
    queued_names = [
        record["name"] for record in records if record["status"] == "queued"
    ]
    active_cover_all = minimum_set_cover(
        names, full_coverage_by_active, active_tie_break_weights
    )
    active_cover_admitted = minimum_set_cover(
        admitted_names, full_coverage_by_active, active_tie_break_weights
    )

    embeddings: set[tuple[str, str]] = set()
    for pattern_name in names:
        pattern_record = by_name[pattern_name]
        for candidate_name in names:
            if pattern_name == candidate_name:
                continue
            candidate_record = by_name[candidate_name]
            if not possible_embedding(pattern_record, candidate_record):
                continue
            if has_exact_qq_core_up_to_relabeling(
                metric_rows[candidate_name], cores[pattern_name]
            ):
                embeddings.add((pattern_name, candidate_name))

    union_find = UnionFind(names)
    for left, right in embeddings:
        if (right, left) in embeddings:
            union_find.union(left, right)
    exact_classes: dict[str, list[str]] = defaultdict(list)
    for name in names:
        exact_classes[union_find.find(name)].append(name)
    nontrivial_classes = [
        sorted(group, key=core_sort_key)
        for group in exact_classes.values()
        if len(group) >= 2
    ]
    nontrivial_classes.sort(key=lambda group: core_sort_key(group[0]))

    strict_embeddings = {
        edge for edge in embeddings if (edge[1], edge[0]) not in embeddings
    }
    direct_covers = []
    for pattern_name, candidate_name in sorted(
        strict_embeddings,
        key=lambda edge: (core_sort_key(edge[0]), core_sort_key(edge[1])),
    ):
        if any(
            intermediate not in {pattern_name, candidate_name}
            and (pattern_name, intermediate) in strict_embeddings
            and (intermediate, candidate_name) in strict_embeddings
            for intermediate in names
        ):
            continue
        direct_covers.append({
            "pattern": pattern_name,
            "candidate": candidate_name,
            "pattern_status": by_name[pattern_name]["status"],
            "candidate_status": by_name[candidate_name]["status"],
        })

    global_pair_motifs: Counter[str] = Counter()
    pair_motif_cores: dict[str, set[str]] = defaultdict(set)
    global_center_digraph_motifs: Counter[str] = Counter()
    center_digraph_motif_cores: dict[str, set[str]] = defaultdict(set)
    global_three_row_motifs: Counter[str] = Counter()
    three_row_motif_cores: dict[str, set[str]] = defaultdict(set)
    for record in records:
        for motif, count in record["pair_motifs"].items():
            global_pair_motifs[motif] += count
            pair_motif_cores[motif].add(record["name"])
        for motif, count in record["center_digraph_three_row_motifs"].items():
            global_center_digraph_motifs[motif] += count
            center_digraph_motif_cores[motif].add(record["name"])
        for motif, count in record["full_three_row_motifs"].items():
            global_three_row_motifs[motif] += count
            three_row_motif_cores[motif].add(record["name"])

    full_three_row_cover_weights = {
        motif: (len(records) - len(covered)) * 1000 + index
        for index, (motif, covered) in enumerate(
            sorted(three_row_motif_cores.items())
        )
    }
    minimum_full_three_row_motif_cover = minimum_set_cover(
        names, three_row_motif_cores, full_three_row_cover_weights
    )

    certificate_records = [
        record for record in records if "certificate_statistics" in record
    ]
    structural_fields = (
        "row_count",
        "equality_count",
        "center_arc_count",
        "mutual_center_pair_count",
        "directed_center_three_cycle_count",
        "max_support_point_row_multiplicity",
    )
    certificate_fields = (
        "nonzero_multiplier_count",
        "total_multiplier_terms",
        "max_multiplier_degree",
    )
    certificate_correlations = []
    for structural_field in structural_fields:
        for certificate_field in certificate_fields:
            correlation = pearson_correlation(
                certificate_records, structural_field, certificate_field
            )
            if correlation is not None:
                certificate_correlations.append({
                    "structural_field": structural_field,
                    "certificate_field": certificate_field,
                    "pearson": correlation,
                })

    payload: dict[str, Any] = {
        "schema": "p97-source-indexed-core-pattern-mining-v1",
        "trust_boundary": (
            "fixed equality-row hypergraphs only; no Euclidean realizability, "
            "frontier production, or finite-shadow coverage claim"
        ),
        "summary": {
            "core_count": len(records),
            "numbered_core_count": sum(not is_variant(name) for name in names),
            "variant_count": sum(is_variant(name) for name in names),
            "admitted_count": sum(record["status"] == "admitted" for record in records),
            "queued_count": sum(record["status"] == "queued" for record in records),
            "exact_certificate_statistics_count": len(certificate_records),
            "embedding_count": len(embeddings),
            "strict_embedding_count": len(strict_embeddings),
            "direct_subcore_cover_count": len(direct_covers),
            "nontrivial_isomorphism_class_count": len(nontrivial_classes),
        },
        "admitted_cores": [
            record["name"] for record in records if record["status"] == "admitted"
        ],
        "queued_cores": [
            record["name"] for record in records if record["status"] == "queued"
        ],
        "nontrivial_exact_isomorphism_classes": nontrivial_classes,
        "all_embeddings": [
            {
                "pattern": left,
                "candidate": right,
                "mutual": (right, left) in embeddings,
            }
            for left, right in sorted(
                embeddings,
                key=lambda edge: (core_sort_key(edge[0]), core_sort_key(edge[1])),
            )
        ],
        "direct_subcore_cover_relations": direct_covers,
        "certificate_active_kernel_analysis": {
            "kernel_count": len(active_names),
            "embedding_count_between_distinct_kernels": len(
                active_kernel_embeddings
            ),
            "nontrivial_exact_isomorphism_classes": (
                active_kernel_isomorphism_classes
            ),
            "direct_subkernel_cover_relations": active_kernel_direct_covers,
            "active_to_full_embedding_count": len(active_to_full_embeddings),
            "queued_full_cores_covered_by_existing_active_kernels": [
                {
                    "core": name,
                    "covering_kernels": sorted(
                        active_coverers_by_full[name], key=core_sort_key
                    ),
                }
                for name in queued_names
                if active_coverers_by_full[name]
            ],
            "queued_full_cores_not_covered": [
                name for name in queued_names if not active_coverers_by_full[name]
            ],
            "full_coverage_by_active_kernel": [
                {
                    "kernel": name,
                    "active_equality_count": by_name[name][
                        "certificate_active_kernel"
                    ]["equality_count"],
                    "active_row_count": by_name[name][
                        "certificate_active_kernel"
                    ]["row_count"],
                    "covered_full_core_count": len(full_coverage_by_active[name]),
                    "covered_full_cores": sorted(
                        full_coverage_by_active[name], key=core_sort_key
                    ),
                }
                for name in sorted(
                    active_names,
                    key=lambda item: (
                        -len(full_coverage_by_active[item]),
                        core_sort_key(item),
                    ),
                )
            ],
            "minimum_active_kernel_cover_all_current_full_cores": active_cover_all,
            "minimum_active_kernel_cover_admitted_full_cores": (
                active_cover_admitted
            ),
            "global_full_three_row_motifs": [
                {
                    "motif": motif,
                    "occurrences": count,
                    "kernel_count": len(active_three_row_motif_kernels[motif]),
                    "kernels": sorted(
                        active_three_row_motif_kernels[motif], key=core_sort_key
                    ),
                }
                for motif, count in sorted(
                    active_global_three_row_motifs.items(),
                    key=lambda item: (
                        -len(active_three_row_motif_kernels[item[0]]),
                        -item[1],
                        item[0],
                    ),
                )
            ],
            "minimum_full_three_row_motif_cover": (
                minimum_active_three_row_motif_cover
            ),
            "summary_invariants": {
                "mutual_and_directed_cycle_core_count": sum(
                    record["mutual_center_pair_count"] > 0
                    and record["directed_center_three_cycle_count"] > 0
                    for record in active_records
                ),
                "same_triple_mutual_and_directed_cycle_core_count": sum(
                    record["cycle_and_mutual_triple_count"] > 0
                    for record in active_records
                ),
                "max_support_intersection_at_most_two_core_count": sum(
                    record["max_support_intersection"] <= 2
                    for record in active_records
                ),
                "max_support_pair_row_multiplicity_at_most_two_core_count": sum(
                    record["max_support_pair_row_multiplicity"] <= 2
                    for record in active_records
                ),
            },
            "clusters": {
                "row_profile": cluster(
                    active_records,
                    ("row_count", "equality_count", "support_sizes"),
                ),
                "incidence_motif": cluster(
                    active_records,
                    (
                        "row_count",
                        "support_sizes",
                        "center_arc_count",
                        "center_out_degrees",
                        "center_in_degrees",
                        "mutual_center_pair_count",
                        "directed_center_three_cycle_count",
                        "support_intersection_histogram",
                    ),
                ),
                "tag_family": cluster(active_records, ("tags",)),
            },
            "kernels": [
                {
                    **active_record,
                    "certificate_statistics": by_name[active_record["name"]][
                        "certificate_statistics"
                    ],
                }
                for active_record in active_records
            ],
        },
        "clusters": {
            "row_profile": cluster(
                records, ("row_count", "equality_count", "support_sizes")
            ),
            "incidence_motif": cluster(
                records,
                (
                    "row_count",
                    "support_sizes",
                    "center_arc_count",
                    "center_out_degrees",
                    "center_in_degrees",
                    "mutual_center_pair_count",
                    "directed_center_three_cycle_count",
                    "support_intersection_histogram",
                    "repeated_support_pair_multiplicity_histogram",
                ),
            ),
            "tag_family": cluster(records, ("tags",)),
        },
        "global_pair_motifs": [
            {
                "motif": motif,
                "occurrences": count,
                "core_count": len(pair_motif_cores[motif]),
                "cores": sorted(pair_motif_cores[motif], key=core_sort_key),
            }
            for motif, count in sorted(
                global_pair_motifs.items(),
                key=lambda item: (-item[1], item[0]),
            )
        ],
        "global_center_digraph_three_row_motifs": [
            {
                "motif": motif,
                "occurrences": count,
                "core_count": len(center_digraph_motif_cores[motif]),
                "cores": sorted(
                    center_digraph_motif_cores[motif], key=core_sort_key
                ),
            }
            for motif, count in sorted(
                global_center_digraph_motifs.items(),
                key=lambda item: (
                    -len(center_digraph_motif_cores[item[0]]),
                    -item[1],
                    item[0],
                ),
            )
        ],
        "global_full_three_row_motifs": [
            {
                "motif": motif,
                "occurrences": count,
                "core_count": len(three_row_motif_cores[motif]),
                "cores": sorted(three_row_motif_cores[motif], key=core_sort_key),
            }
            for motif, count in sorted(
                global_three_row_motifs.items(),
                key=lambda item: (
                    -len(three_row_motif_cores[item[0]]),
                    -item[1],
                    item[0],
                ),
            )
        ],
        "minimum_full_three_row_motif_cover": minimum_full_three_row_motif_cover,
        "certificate_analysis": {
            "count": len(certificate_records),
            "total_multiplier_terms": numeric_summary(
                record["certificate_statistics"]["total_multiplier_terms"]
                for record in certificate_records
            ),
            "max_multiplier_degree_histogram": histogram(
                record["certificate_statistics"]["max_multiplier_degree"]
                for record in certificate_records
            ),
            "nonzero_multiplier_count_histogram": histogram(
                record["certificate_statistics"]["nonzero_multiplier_count"]
                for record in certificate_records
            ),
            "smallest_by_total_terms": [
                {
                    "name": record["name"],
                    **record["certificate_statistics"],
                }
                for record in sorted(
                    certificate_records,
                    key=lambda record: (
                        record["certificate_statistics"]["total_multiplier_terms"],
                        core_sort_key(record["name"]),
                    ),
                )[:10]
            ],
            "largest_by_total_terms": [
                {
                    "name": record["name"],
                    **record["certificate_statistics"],
                }
                for record in sorted(
                    certificate_records,
                    key=lambda record: (
                        -record["certificate_statistics"]["total_multiplier_terms"],
                        core_sort_key(record["name"]),
                    ),
                )[:10]
            ],
            "row_profile_groups": certificate_profile_groups(certificate_records),
            "structural_correlations": sorted(
                certificate_correlations,
                key=lambda item: -abs(item["pearson"]),
            ),
        },
        "cores": records,
    }
    args.json_output.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    args.markdown_output.write_text(markdown_report(payload), encoding="utf-8")
    print(json.dumps({
        "json_output": str(args.json_output),
        "markdown_output": str(args.markdown_output),
        **payload["summary"],
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
