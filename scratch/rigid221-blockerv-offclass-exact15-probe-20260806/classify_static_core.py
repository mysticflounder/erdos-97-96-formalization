"""Classify a trimmed exact-15 CNF core by semantic clause family.

This sidecar intentionally leaves the authenticated encoder sources unchanged.
It reconstructs one static instance, records the append-only clause provenance,
and matches the clauses emitted by ``drat-trim -c`` back to that provenance.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter, defaultdict, deque
from itertools import combinations
from pathlib import Path

import alternation_static_probe
import kalmanson_probe
import probe
import three_pair_static_probe


def read_dimacs(path: Path) -> list[tuple[int, ...]]:
    clauses: list[tuple[int, ...]] = []
    pending: list[int] = []
    for line in path.read_text(encoding="utf-8").splitlines():
        if not line or line[0] in "cp":
            continue
        for token in map(int, line.split()):
            if token == 0:
                clauses.append(tuple(pending))
                pending.clear()
            else:
                pending.append(token)
    if pending:
        raise ValueError("unterminated DIMACS clause")
    return clauses


def normalized(clause: tuple[int, ...]) -> tuple[int, ...]:
    """Match drat-trim's literal ordering without changing clause meaning."""

    return tuple(sorted(clause, key=lambda literal: (abs(literal), literal < 0)))


def sinz_clause_count(count: int, bound: int) -> int:
    if count <= bound:
        return 0
    if bound == 1:
        return 1 + 3 * (count - 1)
    if bound == 2:
        return 1 + 5 * (count - 1)
    raise ValueError("only the CoverInstance bounds are supported")


def build_with_ledger(long_order_index: int, order_variant: int):
    long_order = probe.ORDERS[long_order_index]
    complete_order = tuple(kalmanson_probe.compatible_orders(long_order))[order_variant]
    model = probe.build_model(probe.N, probe.PROFILE)
    instance = probe.CoverInstance(model)

    labels: list[tuple[str, str]] = []
    for center, rows in instance.candidates.items():
        count = 1 + sinz_clause_count(len(rows), 1)
        labels.extend(("cover", f"one_hot:{center}") for _ in range(count))
    for first, second in combinations(range(probe.N), 2):
        count = sum(
            len(set(first_row) & set(second_row)) > 2
            for first_row in instance.candidates[first]
            for second_row in instance.candidates[second]
        )
        labels.extend(
            ("cover", f"pair_intersection_c2:{first},{second}")
            for _ in range(count)
        )
    for pair in combinations(range(probe.N), 2):
        count = sum(
            set(pair) <= set(row)
            for rows in instance.candidates.values()
            for row in rows
        )
        labels.extend(
            ("cover", f"pair_center_capacity_c4:{pair[0]},{pair[1]}")
            for _ in range(sinz_clause_count(count, 2))
        )
    if len(labels) != len(instance.cnf.clauses):
        raise RuntimeError("base CoverInstance clause accounting drifted")

    def record(primary: str, detail: str, before: int) -> None:
        labels.extend(
            (primary, detail) for _ in range(len(instance.cnf.clauses) - before)
        )

    for source in range(probe.N):
        before = len(instance.cnf.clauses)
        probe.require_some(
            instance,
            [
                instance.choice_variables[(center, index)]
                for center in range(probe.N)
                if center != probe.PHYS
                for index, row in enumerate(instance.candidates[center])
                if source in row
            ],
            f"deletion cover for source {source}",
        )
        record("probe", f"deletion_cover:{source}", before)

    before = len(instance.cnf.clauses)
    probe.require_some(
        instance,
        probe.choices(instance, probe.PHYS, lambda row: row <= probe.CLASS),
        "physical-apex four-subclass",
    )
    record("probe", "physical_four_subclass", before)

    for center in range(probe.N):
        if center == probe.PHYS:
            continue
        before = len(instance.cnf.clauses)
        for index, row in enumerate(instance.candidates[center]):
            if len(set(row) & probe.CLASS) > 2:
                instance.cnf.add_clause((-instance.choice_variables[(center, index)],))
        record("probe", f"physical_class_at_most_two:{center}", before)

    for pair in combinations(sorted(probe.CLASS), 2):
        before = len(instance.cnf.clauses)
        required = set(pair)
        hits = [
            variable
            for center in range(probe.N)
            if center != probe.PHYS
            for variable in probe.choices(
                instance, center, lambda row, required=required: required <= row
            )
        ]
        instance.cnf.at_most_sinz(hits, 1)
        record("probe", f"physical_pair_capacity:{pair[0]},{pair[1]}", before)

    full_order = (probe.LEFT_ENDPOINT, *long_order, probe.RIGHT_ENDPOINT)
    for cap_index, cap in enumerate(model.caps):
        for center in cap:
            before = len(instance.cnf.clauses)
            for index, row in enumerate(instance.candidates[center]):
                if len(set(row) & cap) > 2:
                    instance.cnf.add_clause((-instance.choice_variables[(center, index)],))
            record("probe", f"cap_at_most_two:{cap_index}:{center}", before)

    for center in probe.CAP:
        before = len(instance.cnf.clauses)
        for index, row in enumerate(instance.candidates[center]):
            hits = tuple(sorted(set(row) & probe.CAP, key=full_order.index))
            if len(hits) == 2 and not probe.between(
                full_order, center, hits[0], hits[1]
            ):
                instance.cnf.add_clause((-instance.choice_variables[(center, index)],))
        record("probe", f"ordered_two_hit_localization:{center}", before)

    traces = {
        probe.U: {probe.U, probe.XU},
        probe.XV: {probe.U, probe.XV},
        probe.V: {probe.V, probe.XV},
        probe.XU: {probe.XU, probe.DELETED},
        probe.DELETED: {probe.DELETED, probe.V},
        probe.C: None,
    }
    blocker: dict[tuple[int, int], int] = {}
    for source in traces:
        before = len(instance.cnf.clauses)
        variables: list[int] = []
        for center in range(probe.N):
            if center in (source, probe.PHYS):
                continue
            variable = instance.cnf.new_variable()
            blocker[(source, center)] = variable
            variables.append(variable)
            rows = probe.choices(instance, center, lambda row, source=source: source in row)
            instance.cnf.add_clause((-variable, *rows) if rows else (-variable,))
        probe.require_one(instance, variables, f"blocker of source {source}")
        record("probe", f"blocker_choice:{source}", before)

    fixed = (
        (probe.U, probe.XV),
        (probe.XV, probe.V),
        (probe.V, probe.DELETED),
        (probe.DELETED, probe.C),
        (probe.XU, probe.E),
    )
    for source, center in fixed:
        before = len(instance.cnf.clauses)
        instance.cnf.add_clause((blocker[(source, center)],))
        record("probe", f"fixed_blocker:{source},{center}", before)

    for source, wanted in traces.items():
        before = len(instance.cnf.clauses)
        for center in range(probe.N):
            variable = blocker.get((source, center))
            if variable is None:
                continue
            for index, row in enumerate(instance.candidates[center]):
                class_hits = set(row) & probe.CLASS
                trace_ok = len(class_hits) <= 1 if wanted is None else class_hits == wanted
                if source not in row or not trace_ok:
                    instance.cnf.add_clause(
                        (-variable, -instance.choice_variables[(center, index)])
                    )
        record("probe", f"blocker_trace:{source}", before)

    before = len(instance.cnf.clauses)
    for choice in probe.choices(instance, 2, lambda row: bool(row & probe.CLASS)):
        instance.cnf.add_clause((-choice,))
    record("probe", "first_apex_disjoint_physical_class", before)

    for p, q in combinations(range(probe.N), 2):
        required = {p, q}
        for side_index, side in enumerate(
            alternation_static_probe.arc_sides(complete_order, p, q)
        ):
            before = len(instance.cnf.clauses)
            variables = [
                instance.choice_variables[(center, index)]
                for center in side
                for index, row in enumerate(instance.candidates[center])
                if required <= set(row)
            ]
            instance.cnf.at_most_sinz(variables, 1)
            record("alternation", f"pair_side:{p},{q}:{side_index}", before)

    hit_variables: dict[tuple[int, tuple[int, int]], int] = {}
    for center in range(probe.N):
        others = [point for point in range(probe.N) if point != center]
        for pair in combinations(others, 2):
            before = len(instance.cnf.clauses)
            variable = instance.cnf.new_variable()
            hit_variables[(center, pair)] = variable
            required = set(pair)
            for index, row in enumerate(instance.candidates[center]):
                if required <= set(row):
                    choice = instance.choice_variables[(center, index)]
                    instance.cnf.add_clause((-choice, variable))
            record("hit_implication", f"center_pair:{center}:{pair[0]},{pair[1]}", before)

    schema_keys: dict[tuple[int, ...], set[str]] = defaultdict(set)
    schema_witnesses: dict[tuple[int, ...], set[str]] = defaultdict(set)
    clauses: set[tuple[int, int, int]] = set()
    for key in three_pair_static_probe.FORBIDDEN_KEYS:
        templates = three_pair_static_probe.local_templates(key)
        size = 1 + max(
            value for center, pair in json.loads(key) for value in (center, *pair)
        )
        for actual in combinations(complete_order, size):
            for template in templates:
                clause = tuple(
                    sorted(
                        -hit_variables[
                            (
                                actual[center],
                                tuple(sorted(actual[point] for point in pair)),
                            )
                        ]
                        for center, pair in template
                    )
                )
                clauses.add(clause)
                schema_keys[clause].add(key)
                witness = [
                    [
                        actual[center],
                        sorted(actual[point] for point in pair),
                    ]
                    for center, pair in template
                ]
                schema_witnesses[clause].add(
                    json.dumps(witness, separators=(",", ":"))
                )
    for clause in sorted(clauses):
        before = len(instance.cnf.clauses)
        instance.cnf.add_clause(clause)
        witnesses = ";".join(sorted(schema_witnesses[clause]))
        record("three_pair_schema", f"instance:{witnesses}", before)

    if len(labels) != len(instance.cnf.clauses):
        raise RuntimeError("semantic clause accounting drifted")
    return instance, labels, schema_keys


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("long_order_index", type=int)
    parser.add_argument("order_variant", type=int)
    parser.add_argument("--core-suffix", default="core.cnf")
    args = parser.parse_args()
    directory = Path(__file__).parent
    stem = f"three-pair-static-o{args.long_order_index}-v{args.order_variant}"
    core = read_dimacs(directory / f"{stem}.{args.core_suffix}")
    instance, labels, schema_keys = build_with_ledger(
        args.long_order_index, args.order_variant
    )
    original = list(map(tuple, instance.cnf.clauses))
    positions: dict[tuple[int, ...], deque[int]] = defaultdict(deque)
    for index, clause in enumerate(original):
        positions[normalized(clause)].append(index)

    primary_counts: Counter[str] = Counter()
    detail_counts: Counter[str] = Counter()
    schema_counts: Counter[str] = Counter()
    unmatched: list[tuple[int, ...]] = []
    for clause in core:
        key = normalized(clause)
        if not positions[key]:
            unmatched.append(clause)
            continue
        index = positions[key].popleft()
        primary, detail = labels[index]
        primary_counts[primary] += 1
        detail_counts[f"{primary}/{detail}"] += 1
        if primary == "three_pair_schema":
            schema_counts.update(schema_keys[tuple(sorted(clause))] or {"UNCLASSIFIED"})

    active_details = {key: value for key, value in sorted(detail_counts.items()) if value}
    output = {
        "stem": stem,
        "original_clause_count": len(original),
        "core_clause_count": len(core),
        "unmatched_count": len(unmatched),
        "core_primary_counts": dict(sorted(primary_counts.items())),
        "core_detail_counts": active_details,
        "active_semantic_constraint_count": len(active_details),
        "core_schema_counts": dict(sorted(schema_counts.items())),
    }
    label = args.core_suffix.removesuffix(".cnf")
    target = directory / f"{stem}.{label}-classification.json"
    target.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    summary = dict(output)
    summary["core_detail_counts"] = {
        "count": len(active_details),
        "top20": Counter(active_details).most_common(20),
    }
    print(json.dumps(summary, sort_keys=True))
    return 0 if not unmatched else 1


if __name__ == "__main__":
    raise SystemExit(main())
