#!/usr/bin/env python3
"""Minimal strict-cycle schema audit for the zero X-row domain.

The continuation proves that the fixed robust prefix plus any admissible X
row is Kalmanson-inconsistent.  This script separates candidates already dead
under the old pairwise/pair-capacity gates from the 70 candidates for which
the new strict consumer is load-bearing, then minimizes the set of named rows
needed by each contradiction.
"""

from __future__ import annotations

import argparse
from collections import Counter, defaultdict, deque
import importlib.util
import itertools
import json
from pathlib import Path
import sys
from typing import Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
ROBUST_SEARCH = ROOT / "scratch/atail-force/robust-all-center-cegar/search.py"
DEFAULT_OUTPUT = HERE / "x_domain_schema_results.json"

if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))
from verify_artifacts import independent_has_cycle  # noqa: E402


def load_robust() -> object:
    spec = importlib.util.spec_from_file_location("p97_x_schema_robust", ROBUST_SEARCH)
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load robust search")
    module = importlib.util.module_from_spec(spec)
    sys.modules["p97_x_schema_robust"] = module
    spec.loader.exec_module(module)
    return module


def shortest_cycle_length(
    order: Sequence[object], rows: Iterable[tuple[object, Iterable[object]]]
) -> int | None:
    positions = {label: index for index, label in enumerate(order)}
    edges = tuple(itertools.combinations(order, 2))
    edge_index = {edge: index for index, edge in enumerate(edges)}

    def edge_id(left: object, right: object) -> int:
        edge = (left, right) if positions[left] < positions[right] else (right, left)
        return edge_index[edge]

    parent = list(range(len(edges)))

    def find(value: int) -> int:
        if parent[value] != value:
            parent[value] = find(parent[value])
        return parent[value]

    def union(left: int, right: int) -> None:
        left = find(left)
        right = find(right)
        if left != right:
            parent[right] = left

    for center, support in rows:
        selected = [edge_id(center, point) for point in support]
        for edge in selected[1:]:
            union(selected[0], edge)
    roots = sorted({find(index) for index in range(len(edges))})
    class_id = {root: index for index, root in enumerate(roots)}
    classes = [class_id[find(index)] for index in range(len(edges))]
    adjacency: dict[int, set[int]] = defaultdict(set)
    for indices in itertools.combinations(range(len(order)), 4):
        a, b, c, d = (order[index] for index in indices)
        for terms in (
            ((a, c), (b, d), (a, b), (c, d)),
            ((a, c), (b, d), (a, d), (b, c)),
        ):
            values = [classes[edge_id(*edge)] for edge in terms]
            for left_index in (0, 1):
                for right_index in (0, 1):
                    if values[left_index] != values[2 + right_index]:
                        continue
                    smaller = values[2 + (1 - right_index)]
                    larger = values[1 - left_index]
                    if smaller == larger:
                        return 1
                    adjacency[smaller].add(larger)
    best: int | None = None
    for start in range(len(roots)):
        distance = {start: 0}
        pending: deque[int] = deque([start])
        while pending:
            current = pending.popleft()
            for target in adjacency[current]:
                if target == start:
                    candidate = distance[current] + 1
                    best = candidate if best is None else min(best, candidate)
                    pending.clear()
                    break
                if target not in distance:
                    distance[target] = distance[current] + 1
                    pending.append(target)
    return best


def minimal_subsets(
    order: Sequence[object], rows: Mapping[str, object]
) -> tuple[tuple[str, ...], ...]:
    names = tuple(rows)
    for size in range(1, len(names) + 1):
        found = tuple(
            subset
            for subset in itertools.combinations(names, size)
            if independent_has_cycle(
                order,
                ((rows[name].center, rows[name].support) for name in subset),
            )
        )
        if found:
            return found
    raise AssertionError("known-dead X candidate has no strict cycle")


def audit() -> dict[str, object]:
    robust = load_robust()
    surface = robust.Surface()
    shadow = robust.shadow
    order = tuple(shadow.hull_order(surface.frame))
    o = surface.by_name[robust.FIRST_APEX]
    q = surface.by_name[robust.Q]
    w = surface.by_name[robust.W]
    x = surface.by_name["X"]
    ambient = surface.ambient_first_apex_row()
    fixed_rows = []
    named_minimal_rows = {"ambientO": ambient}
    for name in ("O", "A", "D", "t1"):
        center = surface.by_name[name]
        row = shadow.ClassRow(
            name, center, surface.candidates[center][0], exact=False
        )
        fixed_rows.append(row)
        if name != "O":
            named_minimal_rows[name] = row

    pair_centers: dict[tuple[int, int], set[int]] = defaultdict(set)
    for row in fixed_rows:
        for pair in itertools.combinations(sorted(row.support), 2):
            pair_centers[pair].add(row.center)

    def pair_bound_ok(row: object) -> bool:
        return all(
            row.center in pair_centers[pair] or len(pair_centers[pair]) < 2
            for pair in itertools.combinations(sorted(row.support), 2)
        )

    raw_candidates = []
    for support in surface.candidates[x]:
        if {q, w} <= set(support):
            continue
        row = shadow.ClassRow("X", x, support, exact=False)
        if shadow.rows_compatible(surface.frame, ambient, row):
            raw_candidates.append(row)

    raw_histogram: Counter[tuple[str, ...]] = Counter()
    raw_alternative_histogram: Counter[int] = Counter()
    viable_histogram: Counter[tuple[tuple[str, ...], int]] = Counter()
    viable_alternative_histogram: Counter[int] = Counter()
    representatives: dict[tuple[tuple[str, ...], int], list[list[str]]] = defaultdict(list)
    viable_count = 0
    for row in raw_candidates:
        rows = {**named_minimal_rows, "X": row}
        minimal = minimal_subsets(order, rows)
        chosen = minimal[0]
        raw_histogram[chosen] += 1
        raw_alternative_histogram[len(minimal)] += 1

        old_gates_pass = pair_bound_ok(row) and all(
            shadow.rows_compatible(surface.frame, row, fixed)
            for fixed in fixed_rows
        )
        if not old_gates_pass:
            continue
        viable_count += 1
        viable_alternative_histogram[len(minimal)] += 1
        length = shortest_cycle_length(
            order,
            ((rows[name].center, rows[name].support) for name in chosen),
        )
        assert length is not None
        key = (chosen, length)
        viable_histogram[key] += 1
        if len(representatives[key]) < 3:
            representatives[key].append(
                sorted(
                    (surface.by_label[label] for label in row.support),
                    key=lambda label: robust.HULL_NAMES.index(label),
                )
            )

    if len(raw_candidates) != 401 or viable_count != 70:
        raise AssertionError("X-domain count drift")
    if sum(raw_histogram.values()) != 401:
        raise AssertionError("raw X schema coverage drift")
    if sum(viable_histogram.values()) != 70:
        raise AssertionError("viable X schema coverage drift")

    def subset_key(subset: tuple[str, ...]) -> str:
        return "+".join(subset)

    viable_records = []
    for (subset, length), count in sorted(
        viable_histogram.items(), key=lambda item: (item[0][0], item[0][1])
    ):
        viable_records.append({
            "minimal_named_rows": list(subset),
            "shortest_strict_cycle_length": length,
            "candidate_count": count,
            "representative_X_supports": representatives[(subset, length)],
        })
    return {
        "schema": "p97-atail-kalmanson-x-domain-schema-audit-v1",
        "epistemic_status": "EXACT_WITHIN_FIXED_14_ROLE_CANDIDATE_DOMAIN",
        "raw_X_domain": {
            "candidate_count": len(raw_candidates),
            "ordinal_killed": 401,
            "minimal_named_row_subset_histogram": {
                subset_key(subset): count
                for subset, count in sorted(raw_histogram.items())
            },
            "number_of_minimal_subset_alternatives_histogram": {
                str(number): count
                for number, count in sorted(raw_alternative_histogram.items())
            },
        },
        "after_existing_fixed_row_gates": {
            "candidate_count": viable_count,
            "ordinal_killed": viable_count,
            "candidate_count_removed_by_old_gates": len(raw_candidates) - viable_count,
            "number_of_minimal_subset_alternatives_histogram": {
                str(number): count
                for number, count in sorted(viable_alternative_histogram.items())
            },
            "minimal_certificate_schemas": viable_records,
        },
        "interpretation": {
            "literal_schema_count": len(viable_records),
            "one_literal_certificate": False,
            "generic_consumer": (
                "one equality-quotient plus strict-Kalmanson-cycle theorem covers "
                "all schemas"
            ),
            "closed_form_producer_status": (
                "four named-row footprints remain after old gates; exact orbit "
                "quotienting of their step signatures is the next compression task"
            ),
        },
        "restart_note": (
            "For each of the 70 old-gate-viable X supports, emit the actual shortest "
            "cycle steps and quotient them under the cap-profile automorphisms. Then "
            "choose between four small geometric lemmas and one executable generic "
            "strict-cycle certificate checker. Do not resume the unconstrained 101-"
            "prefix miner; the universal prefix filter already makes this fixed "
            "surface exhaustive-UNSAT."
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--summary", action="store_true")
    args = parser.parse_args()
    result = audit()
    if args.check:
        assert result["raw_X_domain"]["candidate_count"] == 401
        assert result["after_existing_fixed_row_gates"]["candidate_count"] == 70
        assert result["after_existing_fixed_row_gates"]["ordinal_killed"] == 70
        assert len(result["after_existing_fixed_row_gates"]["minimal_certificate_schemas"]) == 5
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    args.output.write_text(rendered, encoding="utf-8")
    if args.summary:
        result = {key: value for key, value in result.items() if key != "restart_note"}
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
