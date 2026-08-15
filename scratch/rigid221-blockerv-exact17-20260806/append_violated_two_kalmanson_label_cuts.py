#!/usr/bin/env python3
"""Append every direct two-Kalmanson label cut violated by one SAT model."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from collections import Counter, defaultdict, deque
from itertools import combinations, combinations_with_replacement
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
STATIC_APPENDER = HERE / "append_all_two_kalmanson_label_cuts.py"
LEAN_SOURCE = REPO / "lean/Erdos9796Proof/P97/ATail/TwoKalmansonLabelCut.lean"
LEAN_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "false_of_twoKalmansonLabelCancellationData"
)


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


static = load_module("exact17_lazy_two_k_label_static", STATIC_APPENDER)
base = static.base_append
export = static.export
SOURCE_FILES = (*static.SOURCE_FILES, Path(__file__).resolve())


def source_hashes() -> dict[str, str]:
    return {str(path.relative_to(REPO)): base.sha256(path) for path in SOURCE_FILES}


def parse_model(path: Path, variables: int) -> dict[int, bool]:
    lines = path.read_text().splitlines()
    statuses = [line.strip() for line in lines if line.startswith("s ")]
    if statuses != ["s SATISFIABLE"]:
        raise ValueError(f"expected one SATISFIABLE status, got {statuses!r}")
    assignment = {}
    for line in lines:
        if not line.startswith("v "):
            continue
        for token in line.split()[1:]:
            value = int(token)
            if value == 0:
                continue
            variable = abs(value)
            if not 1 <= variable <= variables:
                raise ValueError(f"SAT model variable {variable} is out of range")
            truth = value > 0
            if variable in assignment:
                raise ValueError(f"SAT model repeated variable {variable}")
            assignment[variable] = truth
    expected = set(range(1, variables + 1))
    if set(assignment) != expected:
        raise ValueError("SAT model is not a complete assignment")
    return assignment


def label_variables() -> dict[tuple[int, int], tuple[int, ...]]:
    next_variable = max(export.selected_variables().values()) + 1
    next_variable += len(export.source.FIFTH_CENTER_CANDIDATES)
    result = {}
    for carrier_edge in combinations(export.source.POINTS, 2):
        result[carrier_edge] = tuple(
            range(next_variable, next_variable + static.DISTANCE_LABEL_BITS)
        )
        next_variable += static.DISTANCE_LABEL_BITS
    return result


def label_value(bits: tuple[int, ...], assignment: dict[int, bool]) -> int:
    return sum((1 << index) for index, variable in enumerate(bits) if assignment[variable])


def delta_signature(left_labels: tuple[int, int], right_labels: tuple[int, int]):
    counts = Counter(left_labels)
    counts.subtract(right_labels)
    return tuple(sorted((label, count) for label, count in counts.items() if count))


def negate_signature(signature):
    return tuple((label, -count) for label, count in signature)


def matched_clause(first, second, labels, comparisons) -> tuple[int, ...]:
    left_edges = (*first[0], *second[0])
    right_edges = (*first[1], *second[1])
    queues: dict[int, deque[tuple[int, int]]] = defaultdict(deque)
    for right_edge in right_edges:
        queues[labels[right_edge]].append(right_edge)
    literals = set()
    for left_edge in left_edges:
        label = labels[left_edge]
        if not queues[label]:
            raise AssertionError("opposite delta signatures did not cancel")
        right_edge = queues[label].popleft()
        if left_edge != right_edge:
            key = tuple(sorted((left_edge, right_edge)))
            literals.update(comparisons[key])
    if not literals:
        raise ValueError("strict inequalities yielded an empty direct-label cut")
    return tuple(sorted(literals))


def violated_clauses(order, assignment, variables):
    inequalities = static.inequalities(order)
    label_vars = label_variables()
    labels = {
        carrier_edge: label_value(bits, assignment)
        for carrier_edge, bits in label_vars.items()
    }
    comparisons = static.comparison_variables(variables)
    groups = defaultdict(list)
    for index, inequality in enumerate(inequalities):
        signature = delta_signature(
            tuple(labels[edge] for edge in inequality[0]),
            tuple(labels[edge] for edge in inequality[1]),
        )
        groups[signature].append(index)

    clauses = set()
    paired_inequalities = 0
    for signature in sorted(groups):
        opposite = negate_signature(signature)
        if opposite not in groups or signature > opposite:
            continue
        left_indices = groups[signature]
        right_indices = groups[opposite]
        if signature == opposite:
            index_pairs = combinations_with_replacement(left_indices, 2)
        else:
            index_pairs = (
                (left_index, right_index)
                for left_index in left_indices
                for right_index in right_indices
            )
        for left_index, right_index in index_pairs:
            paired_inequalities += 1
            clause = matched_clause(
                inequalities[left_index], inequalities[right_index], labels, comparisons
            )
            if any(assignment[literal] for literal in clause):
                raise AssertionError("generated direct-label cut is not model-violated")
            clauses.add(clause)
    return tuple(sorted(clauses)), len(groups), paired_inequalities


def clauses_digest(clauses) -> str:
    digest = hashlib.sha256()
    for clause in clauses:
        digest.update((" ".join(map(str, clause)) + " 0\n").encode())
    return digest.hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base-manifest", type=Path, required=True)
    parser.add_argument("--sat-model", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    args = parser.parse_args()

    static.require_lean_consumer()
    frozen_sources = source_hashes()
    base_manifest_path = args.base_manifest.resolve()
    base_manifest = json.loads(base_manifest_path.read_text())
    base_cnf = base.resolve_repo_path(base_manifest["cnf"])
    if base.sha256(base_cnf) != base_manifest.get("cnf_sha256"):
        raise ValueError("base CNF hash mismatch")
    variables, base_count = base.dimacs_header(base_cnf)
    if (variables, base_count) != (
        base_manifest.get("variables"),
        base_manifest.get("clauses"),
    ):
        raise ValueError("base DIMACS header disagrees with manifest")

    order_index = int(base_manifest["order_index"])
    positions = tuple(int(value) for value in base_manifest["anonymous_positions"])
    order = export.source.normalized_order(order_index, positions)
    if tuple(base_manifest.get("order", ())) != order:
        raise ValueError("base manifest has inconsistent cyclic order")
    model_path = args.sat_model.resolve()
    assignment = parse_model(model_path, variables)
    clauses, delta_groups, paired_inequalities = violated_clauses(
        order, assignment, variables
    )
    if not clauses:
        print(json.dumps({"status": "NO_DIRECT_TWO_KALMANSON_LABEL_CUT"}))
        return 3
    if source_hashes() != frozen_sources:
        raise RuntimeError("lazy two-Kalmanson sources changed during generation")

    output = args.output.resolve()
    cnf_sha = static.write_derived_cnf(
        base_cnf, output, variables, base_count, len(clauses), iter(clauses)
    )
    manifest = dict(base_manifest)
    manifest.update(
        {
            "schema": "p97-rigid221-exact17-lazy-two-kalmanson-label-cnf-v1",
            "cnf": str(output.relative_to(REPO)),
            "cnf_sha256": cnf_sha,
            "clauses": base_count + len(clauses),
            "lazy_two_kalmanson_label_base": {
                "manifest": str(base_manifest_path.relative_to(REPO)),
                "manifest_sha256": base.sha256(base_manifest_path),
                "cnf": str(base_cnf.relative_to(REPO)),
                "cnf_sha256": base.sha256(base_cnf),
                "clauses": base_count,
            },
            "lazy_two_kalmanson_label_model": {
                "path": str(model_path.relative_to(REPO)),
                "sha256": base.sha256(model_path),
            },
            "lazy_two_kalmanson_label_dimensions": {
                "inequalities": len(static.inequalities(order)),
                "delta_groups": delta_groups,
                "cancelling_inequality_pairs": paired_inequalities,
                "appended_clauses": len(clauses),
            },
            "lazy_two_kalmanson_label_clause_sha256": clauses_digest(clauses),
            "lazy_two_kalmanson_label_lean_consumer": LEAN_CONSUMER,
            "lazy_two_kalmanson_label_generation_source_hashes": frozen_sources,
        }
    )
    blocks = dict(base_manifest.get("clause_blocks", {}))
    blocks["lazy_two_kalmanson_label"] = (
        blocks.get("lazy_two_kalmanson_label", 0) + len(clauses)
    )
    manifest["clause_blocks"] = blocks
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                **manifest["lazy_two_kalmanson_label_dimensions"],
                "cnf_sha256": cnf_sha,
                "variables": variables,
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
