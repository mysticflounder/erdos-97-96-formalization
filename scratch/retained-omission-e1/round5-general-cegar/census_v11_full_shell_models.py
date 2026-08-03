#!/usr/bin/env python3
"""Bounded structural census of the sixteen saved v11 Boolean first models.

This is a read-only diagnostic.  It replays the saved Boolean SMT formulas,
reconstructs the corresponding v9 ``Encoding`` objects, and evaluates only
discrete consequences in the resulting models.  It does not run CEGAR or a
nonlinear/full solver.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import gzip
import hashlib
import itertools
import json
import re
import time
from collections import Counter, defaultdict
from datetime import datetime, timezone
from pathlib import Path
from typing import Iterable, Sequence

import z3

import round5_cegar_v9 as v9


HERE = Path(__file__).resolve().parent
DEFAULT_ROOT = (
    HERE
    / "artifacts-v11"
    / "20260802T093313.097282Z-retry-pid99343"
)
CASE_ID = re.compile(
    r"^(fresh|paired|secondcap_collision|secondcap_distinct)_"
    r"([SD]{3})_k(\d+)_d(\d+)(?:_f(\d+))?$"
)
BOOL_DECL = re.compile(r"^\(declare-fun ([^ ()]+) \(\) Bool\)$", re.MULTILINE)
CHECK_SAT = re.compile(r"^\(check-sat\)\s*$", re.MULTILINE)
MAX_WORKERS = 8
MAX_TIMEOUT_MS = 30_000


def sha256_bytes(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def file_sha256(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def parse_case(case_id: str) -> v9.Case:
    match = CASE_ID.match(case_id)
    if match is None:
        raise ValueError(f"bad case id: {case_id}")
    arm, profiles, kept, deleted, fresh = match.groups()
    return v9.Case(
        arm,
        profiles,
        int(kept),
        int(deleted),
        None if fresh is None else int(fresh),
    )


def truth(model: z3.ModelRef, value: z3.BoolRef) -> bool:
    return z3.is_true(model.eval(value, model_completion=True))


def point_zone(point: int) -> str:
    for index, interior in enumerate(v9.INTERIORS):
        if point in interior:
            return f"I{index}"
    return f"A{v9.APICES.index(point)}"


def support_mask(support: Iterable[int]) -> str:
    mask = sum(1 << point for point in support)
    return f"0x{mask:04x}"


def support_shape(support: Sequence[int]) -> dict[str, object]:
    values = set(support)
    return {
        "interior_counts": [len(values.intersection(cap)) for cap in v9.INTERIORS],
        "apex_bits": [int(apex in values) for apex in v9.APICES],
    }


def shell_role(name: str) -> str:
    if name.startswith("critical_"):
        return "critical"
    if name.startswith("globalK4_"):
        return "global_k4"
    if name.startswith("rich_"):
        return "rich"
    if name.endswith("_B1"):
        return "packet_b1"
    if name.endswith("_B2"):
        return "packet_b2"
    raise AssertionError(f"unknown circle role: {name}")


def full_shell_center(name: str) -> int:
    if name.startswith("critical_"):
        return int(name.removeprefix("critical_"))
    match = re.fullmatch(r"rich_(\d+)_(\d+)", name)
    if match is None:
        raise AssertionError(f"unknown licensed full shell: {name}")
    return v9.APICES[int(match.group(1))]


def maximum_matching(neighbors: dict[str, list[int]]) -> dict[str, object]:
    """Return a maximum row-to-point matching and a Hall witness."""
    match_right: dict[int, str] = {}

    def augment(left: str, seen: set[int]) -> bool:
        for right in neighbors[left]:
            if right in seen:
                continue
            seen.add(right)
            owner = match_right.get(right)
            if owner is None or augment(owner, seen):
                match_right[right] = left
                return True
        return False

    for left in sorted(neighbors, key=lambda item: (len(neighbors[item]), item)):
        augment(left, set())
    match_left = {left: right for right, left in match_right.items()}

    # Standard alternating-reachability witness from unmatched left vertices.
    reached_left = {left for left in neighbors if left not in match_left}
    reached_right: set[int] = set()
    frontier = list(sorted(reached_left))
    while frontier:
        left = frontier.pop()
        for right in neighbors[left]:
            if match_left.get(left) == right or right in reached_right:
                continue
            reached_right.add(right)
            owner = match_right.get(right)
            if owner is not None and owner not in reached_left:
                reached_left.add(owner)
                frontier.append(owner)
    hall_neighbors = sorted(
        {point for left in reached_left for point in neighbors[left]}
    )
    deficiency = len(neighbors) - len(match_left)
    if reached_left and len(reached_left) - len(hall_neighbors) != deficiency:
        raise AssertionError("alternating Hall witness has wrong deficiency")
    return {
        "row_count": len(neighbors),
        "matching_size": len(match_left),
        "deficiency": deficiency,
        "matching": dict(sorted(match_left.items())),
        "hall_witness_rows": sorted(reached_left),
        "hall_witness_points": hall_neighbors,
    }


def strongly_connected_components(adjacency: dict[int, set[int]]) -> list[list[int]]:
    index = 0
    indices: dict[int, int] = {}
    lowlink: dict[int, int] = {}
    stack: list[int] = []
    on_stack: set[int] = set()
    components: list[list[int]] = []

    def visit(node: int) -> None:
        nonlocal index
        indices[node] = index
        lowlink[node] = index
        index += 1
        stack.append(node)
        on_stack.add(node)
        for target in sorted(adjacency[node]):
            if target not in indices:
                visit(target)
                lowlink[node] = min(lowlink[node], lowlink[target])
            elif target in on_stack:
                lowlink[node] = min(lowlink[node], indices[target])
        if lowlink[node] == indices[node]:
            component: list[int] = []
            while True:
                target = stack.pop()
                on_stack.remove(target)
                component.append(target)
                if target == node:
                    break
            components.append(sorted(component))

    for node in sorted(adjacency):
        if node not in indices:
            visit(node)
    return sorted(components, key=lambda item: (-len(item), item))


def directed_cycle_lengths(adjacency: dict[int, set[int]]) -> tuple[list[int], int]:
    """Enumerate the exact set of simple directed-cycle lengths.

    There are at most fifteen center vertices.  Requiring the start to be the
    least vertex of a path avoids rotations and keeps this bounded.
    """
    nodes = sorted(adjacency)
    found: set[int] = set()
    states = 0
    all_lengths = set(range(2, len(nodes) + 1))
    for start in nodes:
        path = [start]
        visited = {start}

        def search(node: int) -> None:
            nonlocal states
            states += 1
            for target in sorted(adjacency[node]):
                if target == start and len(path) >= 2:
                    found.add(len(path))
                elif target > start and target not in visited:
                    visited.add(target)
                    path.append(target)
                    search(target)
                    path.pop()
                    visited.remove(target)

        search(start)
        if found == all_lengths:
            break
    return sorted(found), states


def cross_graphs(shells: list[dict[str, object]]) -> dict[str, object]:
    """Collapse duplicate shell names to centers and census cross-incidence."""
    rows_by_center: dict[int, list[dict[str, object]]] = defaultdict(list)
    for shell in shells:
        rows_by_center[int(shell["center"])].append(shell)
    nodes = sorted(rows_by_center)
    union_support = {
        center: {
            point
            for shell in rows
            for point in shell["support"]  # type: ignore[union-attr]
        }
        for center, rows in rows_by_center.items()
    }
    membership = {
        center: {target for target in nodes if target != center and target in union_support[center]}
        for center in nodes
    }
    nonmembership = {
        center: {target for target in nodes if target != center and target not in union_support[center]}
        for center in nodes
    }

    def record(adjacency: dict[int, set[int]]) -> dict[str, object]:
        components = strongly_connected_components(adjacency)
        lengths, states = directed_cycle_lengths(adjacency)
        return {
            "edge_count": sum(len(targets) for targets in adjacency.values()),
            "edges": [
                [source, target]
                for source in sorted(adjacency)
                for target in sorted(adjacency[source])
            ],
            "sccs": components,
            "scc_size_histogram": dict(
                sorted(Counter(map(len, components)).items())
            ),
            "cycle_lengths": lengths,
            "cycle_enumeration_states": states,
        }

    return {
        "definition": (
            "vertices are distinct licensed-shell centers; c->d is membership iff "
            "some licensed full shell centered at c supports d; nonmembership is "
            "the complement on ordered distinct center pairs"
        ),
        "centers": nodes,
        "rows_by_center": {
            str(center): [str(row["name"]) for row in rows]
            for center, rows in sorted(rows_by_center.items())
        },
        "membership": record(membership),
        "nonmembership": record(nonmembership),
    }


def overlap_census(shells: list[dict[str, object]]) -> dict[str, object]:
    histograms: dict[str, Counter[int]] = defaultdict(Counter)
    maxima: dict[str, tuple[int, str, str]] = {}
    for left, right in itertools.combinations(shells, 2):
        size = len(set(left["support"]).intersection(right["support"]))
        center_relation = (
            "same_center" if left["center"] == right["center"] else "distinct_center"
        )
        role_pair = "+".join(sorted((str(left["role"]), str(right["role"]))))
        keys = ("all", center_relation, f"{center_relation}:{role_pair}")
        for key in keys:
            histograms[key][size] += 1
            if key not in maxima or size > maxima[key][0]:
                maxima[key] = (size, str(left["name"]), str(right["name"]))
    return {
        "histograms": {
            key: dict(sorted(values.items())) for key, values in sorted(histograms.items())
        },
        "maxima": {
            key: {"overlap": value[0], "rows": [value[1], value[2]]}
            for key, value in sorted(maxima.items())
        },
    }


def center_capacity(
    supports_by_center: dict[int, list[set[int]]], size: int, bound: int
) -> dict[str, object]:
    histogram: Counter[int] = Counter()
    violations: list[dict[str, object]] = []
    for target in itertools.combinations(v9.POINTS, size):
        target_set = set(target)
        centers = sorted(
            center
            for center, supports in supports_by_center.items()
            if any(target_set.issubset(support) for support in supports)
        )
        histogram[len(centers)] += 1
        if len(centers) > bound:
            violations.append({"points": list(target), "centers": centers})
    return {
        "target_size": size,
        "distinct_center_bound": bound,
        "center_count_histogram": dict(sorted(histogram.items())),
        "max_distinct_centers": max(histogram) if histogram else 0,
        "violation_count": len(violations),
        "violations": violations,
        "cuts_current_model": bool(violations),
    }


def analyze(path_text: str, timeout_ms: int, seed: int, root_text: str) -> dict[str, object]:
    path = Path(path_text)
    root = Path(root_text)
    case = parse_case(path.parent.name)
    compressed = path.read_bytes()
    formula = gzip.decompress(compressed)
    smt = formula.decode("utf-8")
    assertions_text = CHECK_SAT.sub("", smt)

    solver = z3.Solver()
    solver.set(timeout=timeout_ms, random_seed=seed, threads=1)
    solver.add(z3.parse_smt2_string(assertions_text))
    check_started = time.monotonic()
    outcome = solver.check()
    check_seconds = time.monotonic() - check_started
    if outcome != z3.sat:
        return {
            "case": case.case_id,
            "error": f"saved Boolean replay returned {outcome}",
            "check_seconds": round(check_seconds, 6),
        }
    model = solver.model()

    result_path = path.parent / "result.json"
    result = json.loads(result_path.read_text())
    recorded_gzip = result.get("boolean_encoding_gzip_sha256")
    recorded_formula = result.get("boolean_prepass", {}).get("final_formula_sha256")
    computed_gzip = sha256_bytes(compressed)
    computed_formula = sha256_bytes(formula)

    bool_names = sorted(set(BOOL_DECL.findall(smt)))
    assignment_lines = [
        f"{name}={int(truth(model, z3.Bool(name)))}" for name in bool_names
    ]
    false_assertions = [
        index
        for index, assertion in enumerate(solver.assertions())
        if not truth(model, assertion)
    ]

    # Reconstruct the original named Boolean objects, as in the existing v11
    # diagnostic, rather than parsing symbol names into an ad-hoc schema.
    encoding = v9.Encoding(case, timeout_ms=timeout_ms, seed=seed)

    blockers: dict[int, list[int]] = {}
    for center in v9.CENTER_CANDIDATES:
        sources = [
            source
            for source in v9.POINTS
            if truth(model, encoding.block[source, center])
        ]
        if sources:
            blockers[center] = sources

    licensed: list[dict[str, object]] = []
    for shell in v9.active_full_shells(encoding, model):
        center = full_shell_center(shell.name)
        support = [
            point for point, bit in enumerate(shell.support) if truth(model, bit)
        ]
        role = "critical" if shell.kind == "critical_full_row" else "rich"
        expected = 4
        if role == "rich":
            apex_index = v9.APICES.index(center)
            expected = 6 if case.profiles[apex_index] == "S" else 4
        if len(support) != expected:
            raise AssertionError(f"{case.case_id} {shell.name} has size {len(support)}")
        licensed.append(
            {
                "name": shell.name,
                "role": role,
                "kind": shell.kind,
                "center": center,
                "center_zone": point_zone(center),
                "sources": blockers.get(center, []) if role == "critical" else [],
                "support": support,
                "support_mask": support_mask(support),
                "support_shape": support_shape(support),
            }
        )
    licensed.sort(key=lambda item: str(item["name"]))

    active_circles: list[dict[str, object]] = []
    for circle in encoding.circles:
        centers = [
            center
            for center, condition in circle.center_cases.items()
            if truth(model, condition)
        ]
        if not centers:
            continue
        if len(centers) != 1:
            raise AssertionError(f"{case.case_id} {circle.name} has centers {centers}")
        support = [
            point for point, bit in enumerate(circle.support) if truth(model, bit)
        ]
        active_circles.append(
            {
                "name": circle.name,
                "role": shell_role(circle.name),
                "center": centers[0],
                "center_zone": point_zone(centers[0]),
                "support": support,
                "support_mask": support_mask(support),
            }
        )
    active_circles.sort(key=lambda item: str(item["name"]))

    degree = Counter(
        point for shell in licensed for point in shell["support"]  # type: ignore[union-attr]
    )
    degree_by_role: dict[str, Counter[int]] = defaultdict(Counter)
    for shell in licensed:
        for point in shell["support"]:  # type: ignore[union-attr]
            degree_by_role[str(shell["role"])][point] += 1
    center_supports: dict[int, set[int]] = defaultdict(set)
    for shell in licensed:
        center_supports[int(shell["center"])].update(shell["support"])  # type: ignore[arg-type]

    support_neighbors = {
        str(shell["name"]): list(shell["support"]) for shell in licensed
    }
    private_points = {
        point for point in v9.POINTS if degree[point] == 1
    }
    private_neighbors = {
        row: [point for point in support if point in private_points]
        for row, support in support_neighbors.items()
    }

    circle_groups: dict[int, list[dict[str, object]]] = defaultdict(list)
    for circle in active_circles:
        circle_groups[int(circle["center"])].append(circle)
    duplicate_groups: list[dict[str, object]] = []
    same_center_name_pairs = 0
    same_center_equal_support_pairs = 0
    for center, circles in sorted(circle_groups.items()):
        same_center_name_pairs += len(circles) * (len(circles) - 1) // 2
        by_mask: dict[str, list[str]] = defaultdict(list)
        for circle in circles:
            by_mask[str(circle["support_mask"])].append(str(circle["name"]))
        exact_duplicates = [
            {"support_mask": mask, "names": sorted(names)}
            for mask, names in sorted(by_mask.items())
            if len(names) > 1
        ]
        same_center_equal_support_pairs += sum(
            len(item["names"]) * (len(item["names"]) - 1) // 2
            for item in exact_duplicates
        )
        if len(circles) > 1:
            duplicate_groups.append(
                {
                    "center": center,
                    "center_zone": point_zone(center),
                    "circle_names": sorted(str(circle["name"]) for circle in circles),
                    "distinct_support_count": len(by_mask),
                    "exact_support_duplicates": exact_duplicates,
                }
            )

    global_k4_by_center = {
        center: [
            {
                point
                for point in v9.POINTS
                if truth(model, encoding.k4[center, point])
            }
        ]
        for center in v9.CENTER_CANDIDATES
    }
    all_circle_by_center = {
        center: [set(circle["support"]) for circle in circles]
        for center, circles in circle_groups.items()
    }
    global_pair = center_capacity(global_k4_by_center, 2, 2)
    global_triple = center_capacity(global_k4_by_center, 3, 1)
    all_circle_pair = center_capacity(all_circle_by_center, 2, 2)
    all_circle_triple = center_capacity(all_circle_by_center, 3, 1)

    rich_supports: dict[int, list[set[int]]] = {}
    for apex_index, apex in enumerate(v9.APICES):
        class_count = 1 if case.profiles[apex_index] == "S" else 2
        rich_supports[apex] = [
            {
                point
                for point in v9.POINTS
                if truth(model, encoding.rich[apex_index, cls]["support"][point])
            }
            for cls in range(class_count)
        ]

    apex_ties: list[dict[str, object]] = []
    for circle in active_circles:
        center = int(circle["center"])
        role = str(circle["role"])
        if center not in v9.APICES or role not in {"global_k4", "packet_b1"}:
            continue
        support = set(circle["support"])
        if len(support) != 4:
            raise AssertionError("apex exact-four row does not have size four")
        apex_index = v9.APICES.index(center)
        profile = case.profiles[apex_index]
        references = rich_supports[center]
        allowed = (
            support.issubset(references[0])
            if profile == "S"
            else support in references
        )
        apex_ties.append(
            {
                "circle": circle["name"],
                "role": role,
                "center": center,
                "apex_index": apex_index,
                "profile": profile,
                "support": sorted(support),
                "rich_supports": [sorted(item) for item in references],
                "relation": "subset_of_unique_S_class" if profile == "S" else "equals_one_D_class",
                "satisfied": allowed,
            }
        )

    return {
        "case": case.case_id,
        "profiles": case.profiles,
        "input": {
            "path": str(path.relative_to(root.parent.parent.parent)),
            "compressed_bytes": len(compressed),
            "formula_bytes": len(formula),
            "gzip_sha256": computed_gzip,
            "formula_sha256": computed_formula,
            "recorded_gzip_sha256": recorded_gzip,
            "recorded_formula_sha256": recorded_formula,
            "gzip_hash_matches_result": computed_gzip == recorded_gzip,
            "formula_hash_matches_result": computed_formula == recorded_formula,
        },
        "replay": {
            "status": "sat",
            "seed": seed,
            "timeout_ms": timeout_ms,
            "check_seconds": round(check_seconds, 6),
            "assertion_count": len(solver.assertions()),
            "false_assertion_indices": false_assertions,
            "bool_symbol_count": len(bool_names),
            "bool_assignment_sha256": sha256_bytes(
                ("\n".join(assignment_lines) + "\n").encode()
            ),
        },
        "blocker_incidence": {
            "used_centers": sorted(blockers),
            "sources_by_center": {str(k): v for k, v in sorted(blockers.items())},
            "source_degrees": {str(k): len(v) for k, v in sorted(blockers.items())},
        },
        "licensed_full_shells": licensed,
        "active_circle_rows": active_circles,
        "full_shell_census": {
            "row_count": len(licensed),
            "role_counts": dict(sorted(Counter(str(x["role"]) for x in licensed).items())),
            "distinct_center_count": len(center_supports),
            "point_degrees": [degree[point] for point in v9.POINTS],
            "point_degrees_by_role": {
                role: [values[point] for point in v9.POINTS]
                for role, values in sorted(degree_by_role.items())
            },
            "point_distinct_center_degrees": [
                sum(point in support for support in center_supports.values())
                for point in v9.POINTS
            ],
            "private_points": sorted(private_points),
            "support_hall": maximum_matching(support_neighbors),
            "private_hall": maximum_matching(private_neighbors),
            "overlaps": overlap_census(licensed),
            "cross_graphs": cross_graphs(licensed),
        },
        "duplicate_circle_names": {
            "definition": "all active Encoding.circles, grouped by their evaluated distinct center",
            "active_circle_count": len(active_circles),
            "distinct_center_count": len(circle_groups),
            "same_center_name_pair_count": same_center_name_pairs,
            "same_center_equal_support_pair_count": same_center_equal_support_pairs,
            "groups": duplicate_groups,
        },
        "center_capacity": {
            "global_k4_pair": global_pair,
            "global_k4_triple": global_triple,
            "all_active_circles_collapsed_pair": all_circle_pair,
            "all_active_circles_collapsed_triple": all_circle_triple,
            "counting_rule": (
                "a carrier center is counted once even when several active circle names "
                "at that center contain the same target pair or triple"
            ),
        },
        "apex_exact_four_profile_ties": apex_ties,
        "candidate_cuts": {
            "global_k4_profile_tie": any(
                item["role"] == "global_k4" and not item["satisfied"]
                for item in apex_ties
            ),
            "all_apex_exact_four_profile_ties": any(
                not item["satisfied"] for item in apex_ties
            ),
            "global_k4_pair_capacity": global_pair["cuts_current_model"],
            "global_k4_triple_capacity": global_triple["cuts_current_model"],
        },
    }


def recurring_motifs(rows: list[dict[str, object]]) -> dict[str, object]:
    exact: Counter[str] = Counter()
    exact_cases: dict[str, set[str]] = defaultdict(set)
    shapes: Counter[str] = Counter()
    collections: Counter[str] = Counter()
    for row in rows:
        case = str(row["case"])
        collection: list[str] = []
        for shell in row["licensed_full_shells"]:  # type: ignore[union-attr]
            key = json.dumps(
                [shell["role"], shell["center_zone"], shell["support"]],
                separators=(",", ":"),
            )
            exact[key] += 1
            exact_cases[key].add(case)
            shape = json.dumps(
                [shell["role"], shell["center_zone"], shell["support_shape"]],
                sort_keys=True,
                separators=(",", ":"),
            )
            shapes[shape] += 1
            collection.append(key)
        fingerprint = sha256_bytes(
            ("\n".join(sorted(collection)) + "\n").encode()
        )
        collections[fingerprint] += 1

    recurring_exact = [
        {
            "motif": json.loads(key),
            "occurrences": count,
            "case_count": len(exact_cases[key]),
            "cases": sorted(exact_cases[key]),
        }
        for key, count in exact.most_common()
        if count >= 2
    ]
    recurring_shapes = [
        {"motif": json.loads(key), "occurrences": count}
        for key, count in shapes.most_common()
        if count >= 2
    ]
    return {
        "recurring_exact_supports": recurring_exact,
        "recurring_cap_shapes": recurring_shapes,
        "full_shell_collection_fingerprint_counts": dict(sorted(collections.items())),
    }


def aggregate(rows: list[dict[str, object]]) -> dict[str, object]:
    def values(path: Sequence[str]) -> list[object]:
        output: list[object] = []
        for row in rows:
            value: object = row
            for key in path:
                value = value[key]  # type: ignore[index]
            output.append(value)
        return output

    global_bad = [
        sum(
            item["role"] == "global_k4" and not item["satisfied"]
            for item in row["apex_exact_four_profile_ties"]  # type: ignore[union-attr]
        )
        for row in rows
    ]
    all_apex_bad = [
        sum(
            not item["satisfied"]
            for item in row["apex_exact_four_profile_ties"]  # type: ignore[union-attr]
        )
        for row in rows
    ]
    hall_support = [int(x) for x in values(("full_shell_census", "support_hall", "deficiency"))]
    hall_private = [int(x) for x in values(("full_shell_census", "private_hall", "deficiency"))]
    row_counts = [int(x) for x in values(("full_shell_census", "row_count"))]
    used_counts = [len(x) for x in values(("blocker_incidence", "used_centers"))]
    membership_cycles = [
        tuple(x)
        for x in values(("full_shell_census", "cross_graphs", "membership", "cycle_lengths"))
    ]
    nonmembership_cycles = [
        tuple(x)
        for x in values(("full_shell_census", "cross_graphs", "nonmembership", "cycle_lengths"))
    ]
    return {
        "model_count": len(rows),
        "all_replays_sat": all(row["replay"]["status"] == "sat" for row in rows),  # type: ignore[index]
        "all_replayed_assertions_true": all(
            not row["replay"]["false_assertion_indices"] for row in rows  # type: ignore[index]
        ),
        "all_input_hashes_match_result_records": all(
            row["input"]["gzip_hash_matches_result"]  # type: ignore[index]
            and row["input"]["formula_hash_matches_result"]  # type: ignore[index]
            for row in rows
        ),
        "licensed_full_shell_row_count_range": [min(row_counts), max(row_counts)],
        "used_critical_center_count_range": [min(used_counts), max(used_counts)],
        "support_hall_deficiency_histogram": dict(sorted(Counter(hall_support).items())),
        "private_hall_deficiency_histogram": dict(sorted(Counter(hall_private).items())),
        "membership_cycle_length_spectra": {
            ",".join(map(str, spectrum)): count
            for spectrum, count in sorted(Counter(membership_cycles).items())
        },
        "nonmembership_cycle_length_spectra": {
            ",".join(map(str, spectrum)): count
            for spectrum, count in sorted(Counter(nonmembership_cycles).items())
        },
        "global_k4_pair_capacity_violating_models": sum(
            bool(x) for x in values(("candidate_cuts", "global_k4_pair_capacity"))
        ),
        "global_k4_pair_capacity_violation_instances": sum(
            int(x)
            for x in values(("center_capacity", "global_k4_pair", "violation_count"))
        ),
        "global_k4_triple_capacity_violating_models": sum(
            bool(x) for x in values(("candidate_cuts", "global_k4_triple_capacity"))
        ),
        "global_k4_triple_capacity_violation_instances": sum(
            int(x)
            for x in values(("center_capacity", "global_k4_triple", "violation_count"))
        ),
        "all_circle_pair_capacity_violating_models": sum(
            int(x) > 0
            for x in values(
                ("center_capacity", "all_active_circles_collapsed_pair", "violation_count")
            )
        ),
        "all_circle_triple_capacity_violating_models": sum(
            int(x) > 0
            for x in values(
                ("center_capacity", "all_active_circles_collapsed_triple", "violation_count")
            )
        ),
        "global_k4_profile_tie_violating_models": sum(count > 0 for count in global_bad),
        "global_k4_profile_tie_bad_apex_instances": sum(global_bad),
        "global_k4_profile_tie_bad_instance_range": [min(global_bad), max(global_bad)],
        "all_apex_exact_four_tie_violating_models": sum(count > 0 for count in all_apex_bad),
        "all_apex_exact_four_tie_bad_instances": sum(all_apex_bad),
        "same_center_name_pairs_total": sum(
            int(x) for x in values(("duplicate_circle_names", "same_center_name_pair_count"))
        ),
        "same_center_equal_support_pairs_total": sum(
            int(x)
            for x in values(("duplicate_circle_names", "same_center_equal_support_pair_count"))
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=DEFAULT_ROOT)
    parser.add_argument("--workers", type=int, default=8)
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    parser.add_argument("--seed", type=int, default=97)
    parser.add_argument("--compact", action="store_true")
    parser.add_argument(
        "--output",
        type=Path,
        help="write the JSON census to this generated-artifact path instead of stdout",
    )
    args = parser.parse_args()
    if not 1 <= args.workers <= MAX_WORKERS:
        raise SystemExit(f"workers must be in 1..{MAX_WORKERS}")
    if not 1 <= args.timeout_ms <= MAX_TIMEOUT_MS:
        raise SystemExit(f"timeout-ms must be in 1..{MAX_TIMEOUT_MS}")
    root = args.root.resolve()
    paths = sorted(root.glob("*/boolean_encoding.smt2.gz"))
    if len(paths) != 16:
        raise SystemExit(f"expected exactly 16 saved formulas, found {len(paths)}")

    started = time.monotonic()
    with concurrent.futures.ProcessPoolExecutor(max_workers=args.workers) as pool:
        rows = list(
            pool.map(
                analyze,
                map(str, paths),
                itertools.repeat(args.timeout_ms),
                itertools.repeat(args.seed),
                itertools.repeat(str(root)),
            )
        )
    errors = [row for row in rows if "error" in row]
    if errors:
        raise RuntimeError(json.dumps(errors, sort_keys=True))
    rows.sort(key=lambda item: str(item["case"]))

    gzip_manifest = "".join(
        f"{row['input']['gzip_sha256']}  {row['input']['path']}\n"  # type: ignore[index]
        for row in rows
    )
    formula_manifest = "".join(
        f"{row['input']['formula_sha256']}  {row['input']['path']}\n"  # type: ignore[index]
        for row in rows
    )
    invocation_path = root / "invocation.json"
    invocation = json.loads(invocation_path.read_text())
    source_paths = {
        "round5_cegar_v8.py": HERE / "round5_cegar_v8.py",
        "round5_cegar_v9.py": HERE / "round5_cegar_v9.py",
        "round5_cegar_v11.py": HERE / "round5_cegar_v11.py",
        "round5_cegar_v12.py": HERE / "round5_cegar_v12.py",
        "schema_v11.json": HERE / "schema_v11.json",
        "schema_v12.json": HERE / "schema_v12.json",
        "diagnose_v11_boolean_models.py": HERE / "diagnose_v11_boolean_models.py",
        "uv.lock": HERE / "uv.lock",
    }
    source_hashes = {name: file_sha256(path) for name, path in source_paths.items()}
    output = {
        "scope": (
            "read-only first-model structural census; exact-n15 Boolean relaxation only; "
            "not CEGAR, nonlinear solving, universal closure, or a Lean proof"
        ),
        "generated_utc": datetime.now(timezone.utc).isoformat(),
        "runtime": {
            "elapsed_seconds": round(time.monotonic() - started, 6),
            "workers": args.workers,
            "per_formula_timeout_ms": args.timeout_ms,
            "seed": args.seed,
        },
        "authentication": {
            "root": str(root.relative_to(HERE)),
            "input_count": len(rows),
            "gzip_manifest_sha256": sha256_bytes(gzip_manifest.encode()),
            "formula_manifest_sha256": sha256_bytes(formula_manifest.encode()),
            "manifest_definition": "sorted lines '<sha256>  <relative-path>\\n'",
            "census_script_sha256": file_sha256(Path(__file__).resolve()),
            "invocation_json_sha256": file_sha256(invocation_path),
            "source_hashes": source_hashes,
            "recorded_v11_script_sha256": invocation["script_sha256"],
            "recorded_v11_schema_sha256": invocation["schema_sha256"],
            "recorded_v8_script_sha256": invocation["base_v8_script_sha256"],
            "recorded_v9_script_sha256": invocation["miner_v9_script_sha256"],
            "live_sources_match_recorded_v11_run": {
                "round5_cegar_v11.py": source_hashes["round5_cegar_v11.py"]
                == invocation["script_sha256"],
                "schema_v11.json": source_hashes["schema_v11.json"]
                == invocation["schema_sha256"],
                "round5_cegar_v8.py": source_hashes["round5_cegar_v8.py"]
                == invocation["base_v8_script_sha256"],
                "round5_cegar_v9.py": source_hashes["round5_cegar_v9.py"]
                == invocation["miner_v9_script_sha256"],
            },
            "z3_version": z3.get_version_string(),
        },
        "summary": aggregate(rows),
        "recurring_motifs": recurring_motifs(rows),
        "cases": rows,
    }
    rendered = json.dumps(
        output,
        sort_keys=True,
        separators=(",", ":") if args.compact else None,
        indent=None if args.compact else 2,
    )
    if args.output is None:
        print(rendered)
    else:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered + "\n")
        print(
            json.dumps(
                {
                    "output": str(args.output),
                    "case_count": len(rows),
                    "elapsed_seconds": output["runtime"]["elapsed_seconds"],
                },
                sort_keys=True,
            )
        )


if __name__ == "__main__":
    main()
