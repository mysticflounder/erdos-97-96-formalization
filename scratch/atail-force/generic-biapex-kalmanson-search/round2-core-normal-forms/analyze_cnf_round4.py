#!/usr/bin/env python3
"""Audit round-four fixed rows for exact two-Kalmanson/three-row terminals."""

from __future__ import annotations

import argparse
import itertools
import json
from collections import Counter, defaultdict
from pathlib import Path

from analyze import constraint_vector, deletion_minimize, farkas_multipliers, normalized_form
from analyze_cnf_round3 import (
    abstract_normal_form,
    all_kalmanson,
    all_row_equalities,
    best_single_kalmanson_path_core,
    classify,
    negate,
    add_vectors,
)


Vector = tuple[tuple[tuple[int, int], int], ...]


def two_kalmanson_sums(kalmanson: tuple[str, ...]):
    vectors = {name: constraint_vector(name)[1] for name in kalmanson}
    table: dict[Vector, tuple[str, str]] = {}
    for index, left in enumerate(kalmanson):
        for right in kalmanson[index + 1 :]:
            vector = add_vectors([(1, vectors[left]), (1, vectors[right])])
            coefficient_counts = Counter(coefficient for _edge, coefficient in vector)
            if len(vector) != 6 or coefficient_counts != Counter({-1: 3, 1: 3}):
                continue
            pair = (left, right)
            previous = table.get(vector)
            if previous is None or pair < previous:
                table[vector] = pair
    return table


def equality_edges(equalities: tuple[str, ...]):
    answer = {}
    for name in equalities:
        _kind, vector = constraint_vector(name)
        nodes = frozenset(vector)
        if len(nodes) != 2:
            raise AssertionError(name)
        answer[name] = (nodes, vector)
    return answer


def best_two_k_three_row_core(equalities: tuple[str, ...], ksum_table):
    edges = equality_edges(equalities)
    for first_index, first in enumerate(equalities):
        first_nodes, first_vector = edges[first]
        for second_index in range(first_index + 1, len(equalities)):
            second = equalities[second_index]
            second_nodes, second_vector = edges[second]
            if first_nodes & second_nodes:
                continue
            used = first_nodes | second_nodes
            for third in equalities[second_index + 1 :]:
                third_nodes, third_vector = edges[third]
                if used & third_nodes:
                    continue
                for first_sign, second_sign, third_sign in itertools.product(
                    (-1, 1), repeat=3
                ):
                    row_sum = add_vectors(
                        [
                            (first_sign, first_vector),
                            (second_sign, second_vector),
                            (third_sign, third_vector),
                        ]
                    )
                    pair = ksum_table.get(negate(row_sum))
                    if pair is None:
                        continue
                    return (*pair, first, second, third)
    return None


def core_payload(names: tuple[str, ...]):
    names = deletion_minimize(names)
    multipliers = farkas_multipliers(names)
    return {
        "shape": classify(names),
        "constraint_count": len(names),
        "inequality_count": sum(name.startswith("kal") for name in names),
        "row_equality_count": sum(name.startswith("row") for name in names),
        "constraints": list(names),
        "multipliers": {name: str(multiplier) for name, multiplier in multipliers.items()},
        "normal_form": [
            [name, coefficient] for name, coefficient in normalized_form(names, multipliers)
        ],
        "abstract_normal_form": [
            list(constraint) for constraint in abstract_normal_form(names, multipliers)
        ],
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input_dir", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--limit", type=int)
    args = parser.parse_args()

    outer_paths = []
    skipped_statuses = Counter()
    for path in sorted(args.input_dir.glob("iteration_*.outer.json")):
        payload = json.loads(path.read_text(encoding="utf-8"))
        if payload.get("solver_status") == "SAT":
            if not payload.get("cnf_model_checked"):
                raise AssertionError(f"unchecked CNF model: {path}")
            outer_paths.append(path)
        else:
            skipped_statuses[str(payload.get("solver_status"))] += 1
    if args.limit is not None:
        outer_paths = outer_paths[: args.limit]
    if not outer_paths:
        raise RuntimeError("no checked SAT outer models")

    first = json.loads(outer_paths[0].read_text(encoding="utf-8"))
    n = int(first["n"])
    kalmanson = all_kalmanson(n)
    ksum_table = two_kalmanson_sums(kalmanson)

    records = []
    order_counts = Counter()
    abstract_counts = Counter()
    type_counts = Counter()
    exceptions = []
    for path in outer_paths:
        payload = json.loads(path.read_text(encoding="utf-8"))
        if int(payload["n"]) != n:
            raise AssertionError("mixed cardinalities")
        iteration = int(path.name.split("_")[1].split(".")[0])
        verify_path = path.with_name(f"iteration_{iteration:03d}.outer.verify.json")
        farkas_path = path.with_name(f"iteration_{iteration:03d}.farkas.verify.json")
        lra_path = path.with_name(f"iteration_{iteration:03d}.full_lra.json")
        for required in (verify_path, farkas_path, lra_path):
            if not required.exists():
                raise AssertionError(f"missing verified companion: {required}")
        outer_verify = json.loads(verify_path.read_text(encoding="utf-8"))
        farkas_verify = json.loads(farkas_path.read_text(encoding="utf-8"))
        lra = json.loads(lra_path.read_text(encoding="utf-8"))
        if outer_verify.get("status") != "VERIFIED_SAT":
            raise AssertionError(f"outer verification failed: {verify_path}")
        if farkas_verify.get("status") != "VERIFIED_EXACT_FARKAS_CORE":
            raise AssertionError(f"Farkas verification failed: {farkas_path}")
        if lra.get("status") != "UNSAT_FULL_LRA_FIXED_ROWS":
            raise AssertionError(f"unexpected LRA status: {lra_path}")
        rows = {int(center): tuple(support) for center, support in payload["rows"].items()}
        equalities = all_row_equalities(rows)
        terminal = best_two_k_three_row_core(equalities, ksum_table)
        terminal_payload = core_payload(terminal) if terminal is not None else None
        exception_payload = None
        if terminal_payload is None:
            one_k = best_single_kalmanson_path_core(kalmanson, equalities)
            if one_k is not None:
                exception_payload = core_payload(one_k)
            else:
                exception_payload = {
                    "shape": "NO_2K3_OR_1K_PATH_ALTERNATE_FOUND",
                    "oracle_core": lra["metric_core"],
                    "oracle_constraint_count": len(lra["metric_core"]),
                }
            exceptions.append(iteration)
        else:
            order_form = tuple(tuple(item) for item in terminal_payload["normal_form"])
            abstract_form = tuple(
                tuple(item) for item in terminal_payload["abstract_normal_form"]
            )
            order_counts[order_form] += 1
            abstract_counts[abstract_form] += 1
            kinds = tuple(
                sorted(name.split("_")[0] for name in terminal_payload["constraints"][:2])
            )
            type_counts[kinds] += 1
        records.append(
            {
                "iteration": iteration,
                "source": path.name,
                "oracle_constraint_count": len(lra["metric_core"]),
                "two_kalmanson_three_row": terminal_payload,
                "exception_alternate": exception_payload,
            }
        )

    output = {
        "schema": "p97-cnf-round4-full-row-small-alternate-cores-v1",
        "checked_sat_model_count": len(records),
        "skipped_outer_statuses": dict(sorted(skipped_statuses.items())),
        "two_kalmanson_three_row_count": len(records) - len(exceptions),
        "exception_count": len(exceptions),
        "exception_iterations": exceptions,
        "type_counts": {"+".join(kinds): count for kinds, count in sorted(type_counts.items())},
        "order_normal_form_count": len(order_counts),
        "order_normal_form_frequencies": sorted(order_counts.values(), reverse=True),
        "abstract_normal_form_count": len(abstract_counts),
        "abstract_normal_form_frequencies": sorted(abstract_counts.values(), reverse=True),
        "records": records,
    }
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
