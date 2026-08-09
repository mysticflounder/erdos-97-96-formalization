#!/usr/bin/env python3
"""Measure static-per-pair amplification for authenticated PIQD SAT models."""

from __future__ import annotations

import argparse
import importlib.util
import json
from collections import defaultdict
from pathlib import Path

HERE = Path(__file__).resolve().parent
GENERATOR = HERE / "append_violated_two_kalmanson_label_cuts.py"


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


generator = load_module("two_kalmanson_pair_amplification_generator", GENERATOR)


def cancelling_pairs(order, assignment):
    inequalities = generator.static.inequalities(order)
    labels = {
        edge: generator.label_value(bits, assignment)
        for edge, bits in generator.label_variables().items()
    }
    groups = defaultdict(list)
    for index, inequality in enumerate(inequalities):
        signature = generator.delta_signature(
            tuple(labels[edge] for edge in inequality[0]),
            tuple(labels[edge] for edge in inequality[1]),
        )
        groups[signature].append(index)

    pairs = set()
    for signature, first_indices in groups.items():
        opposite = generator.negate_signature(signature)
        if opposite not in groups or signature > opposite:
            continue
        for first_index in first_indices:
            for second_index in groups[opposite]:
                pair = tuple(sorted((first_index, second_index)))
                if pair[0] != pair[1]:
                    pairs.add(pair)
    return pairs


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--receipt", type=Path, action="append", required=True)
    parser.add_argument("--variables", type=int, default=74813)
    args = parser.parse_args()

    order = None
    union = set()
    intersection = None
    per_model = []
    for receipt_path in args.receipt:
        receipt = json.loads(receipt_path.read_text())
        receipt_order = tuple(receipt["order"])
        if order is None:
            order = receipt_order
        elif order != receipt_order:
            raise ValueError("receipts disagree on cyclic order")
        model_path = generator.REPO / receipt["model_log"]
        assignment = generator.parse_model(model_path, args.variables)
        pairs = cancelling_pairs(order, assignment)
        new_pairs = pairs - union
        union.update(pairs)
        intersection = pairs if intersection is None else intersection & pairs
        per_model.append(
            {
                "receipt": str(receipt_path),
                "cancelling_pairs": len(pairs),
                "new_pairs": len(new_pairs),
            }
        )

    result = {
        "models": len(per_model),
        "inequalities": len(generator.static.inequalities(order)),
        "per_model": per_model,
        "unique_cancelling_pairs": len(union),
        "common_cancelling_pairs": len(intersection or ()),
        "all_permutations_clause_upper_bound": 24 * len(union),
    }
    comparisons = generator.static.comparison_variables(args.variables)
    inequalities = generator.static.inequalities(order)
    clauses = {
        clause
        for first_index, second_index in union
        for clause in generator.static.clauses_for_pair(
            inequalities[first_index], inequalities[second_index], comparisons
        )
    }
    result["unique_generalized_clauses"] = len(clauses)
    result["generalized_clause_length_min"] = min(map(len, clauses))
    result["generalized_clause_length_max"] = max(map(len, clauses))
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
