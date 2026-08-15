#!/usr/bin/env python3
"""Independently replay one lazy direct two-Kalmanson label refinement."""

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
APPENDER = HERE / "append_violated_two_kalmanson_label_cuts.py"
STATIC_APPENDER = HERE / "append_all_two_kalmanson_label_cuts.py"
LEAN_SOURCE = REPO / "lean/Erdos9796Proof/P97/ATail/TwoKalmansonLabelCut.lean"
LEAN_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "false_of_twoKalmansonLabelCancellationData"
)
BITS = 8


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


base = load_module(
    "exact17_lazy_two_k_label_validator_base",
    HERE / "append_weighted_kalmanson_cuts.py",
)
export = base.export
STATIC_SOURCE_FILES = (
    STATIC_APPENDER,
    HERE / "append_weighted_kalmanson_cuts.py",
    HERE / "export_source_faithful_boolean_cnf.py",
    LEAN_SOURCE,
    REPO
    / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "GenericRowNogoodCertificate.lean",
    REPO / "lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean",
)
SOURCE_FILES = (*STATIC_SOURCE_FILES, APPENDER)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def expected_source_hashes() -> dict[str, str]:
    return {str(path.relative_to(REPO)): sha256(path) for path in SOURCE_FILES}


def edge(left: int, right: int) -> tuple[int, int]:
    return min(left, right), max(left, right)


def inequalities(order: tuple[int, ...]):
    result = []
    for positions in combinations(range(len(order)), 4):
        a, b, c, d = (order[position] for position in positions)
        right = (edge(a, c), edge(b, d))
        result.append(((edge(a, b), edge(c, d)), right))
        result.append(((edge(b, c), edge(a, d)), right))
    if len(result) != 4_760:
        raise ValueError("incomplete strict-Kalmanson enumeration")
    return tuple(result)


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
            if variable in assignment:
                raise ValueError(f"SAT model repeated variable {variable}")
            assignment[variable] = value > 0
    if len(assignment) != variables or set(assignment) != set(range(1, variables + 1)):
        raise ValueError("SAT model is not a complete assignment")
    return assignment


def verify_model_satisfies_cnf(path: Path, assignment: dict[int, bool]) -> int:
    checked = 0
    with path.open() as handle:
        for line_number, raw_line in enumerate(handle, 1):
            line = raw_line.strip()
            if not line or line.startswith(("c", "p")):
                continue
            values = [int(token) for token in line.split()]
            if not values or values[-1] != 0:
                raise ValueError(f"unterminated clause at {path}:{line_number}")
            literals = values[:-1]
            if not any(assignment[abs(literal)] == (literal > 0) for literal in literals):
                raise ValueError(f"SAT model falsifies base clause {checked + 1}")
            checked += 1
    return checked


def variable_layers(total_variables: int):
    next_variable = max(export.selected_variables().values()) + 1
    next_variable += len(export.source.FIFTH_CENTER_CANDIDATES)
    carrier_edges = tuple(combinations(export.source.POINTS, 2))
    labels = {}
    for carrier_edge in carrier_edges:
        labels[carrier_edge] = tuple(range(next_variable, next_variable + BITS))
        next_variable += BITS
    comparisons = {}
    for pair in combinations(carrier_edges, 2):
        comparisons[pair] = tuple(range(next_variable, next_variable + BITS))
        next_variable += BITS
    if next_variable - 1 != total_variables or len(comparisons) != 9_180:
        raise ValueError("independent label-variable reconstruction mismatch")
    return labels, comparisons


def label_value(bits, assignment) -> int:
    return sum((1 << index) for index, variable in enumerate(bits) if assignment[variable])


def signature(inequality, labels):
    counts = Counter(labels[carrier_edge] for carrier_edge in inequality[0])
    counts.subtract(labels[carrier_edge] for carrier_edge in inequality[1])
    return tuple(sorted((label, count) for label, count in counts.items() if count))


def negate(value):
    return tuple((label, -count) for label, count in value)


def clause_for(first, second, labels, comparisons):
    left_edges = (*first[0], *second[0])
    right_edges = (*first[1], *second[1])
    queues = defaultdict(deque)
    for carrier_edge in right_edges:
        queues[labels[carrier_edge]].append(carrier_edge)
    literals = set()
    for left_edge in left_edges:
        right_edge = queues[labels[left_edge]].popleft()
        if left_edge != right_edge:
            literals.update(comparisons[tuple(sorted((left_edge, right_edge)))])
    if not literals:
        raise ValueError("independent replay produced an empty cut")
    return tuple(sorted(literals))


def replay(order, assignment, total_variables):
    label_variables, comparisons = variable_layers(total_variables)
    labels = {
        carrier_edge: label_value(bits, assignment)
        for carrier_edge, bits in label_variables.items()
    }
    bank = inequalities(order)
    groups = defaultdict(list)
    for index, inequality in enumerate(bank):
        groups[signature(inequality, labels)].append(index)
    clauses = set()
    pair_count = 0
    for value in sorted(groups):
        opposite = negate(value)
        if opposite not in groups or value > opposite:
            continue
        if value == opposite:
            pairs = combinations_with_replacement(groups[value], 2)
        else:
            pairs = (
                (first, second)
                for first in groups[value]
                for second in groups[opposite]
            )
        for first, second in pairs:
            pair_count += 1
            clause = clause_for(bank[first], bank[second], labels, comparisons)
            if any(assignment[literal] for literal in clause):
                raise ValueError("replayed clause is not violated by the bound model")
            clauses.add(clause)
    return tuple(sorted(clauses)), len(groups), pair_count


def clauses_digest(clauses) -> str:
    digest = hashlib.sha256()
    for clause in clauses:
        digest.update((" ".join(map(str, clause)) + " 0\n").encode())
    return digest.hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    manifest_path = args.manifest.resolve()
    manifest = json.loads(manifest_path.read_text())
    if manifest.get("schema") != "p97-rigid221-exact17-lazy-two-kalmanson-label-cnf-v1":
        raise ValueError("unexpected derived schema")
    if manifest.get("lazy_two_kalmanson_label_lean_consumer") != LEAN_CONSUMER:
        raise ValueError("Lean consumer mismatch")
    sources = manifest.get("lazy_two_kalmanson_label_generation_source_hashes")
    if sources != expected_source_hashes():
        raise ValueError("generation source hashes do not replay")
    lean_text = LEAN_SOURCE.read_text()
    if "theorem false_of_twoKalmansonLabelCancellationData" not in lean_text:
        raise ValueError("direct-label Lean consumer is absent")

    base_record = manifest.get("lazy_two_kalmanson_label_base")
    if not isinstance(base_record, dict):
        raise TypeError("derived manifest has no authenticated base")
    base_manifest_path = base.resolve_repo_path(base_record["manifest"])
    base_cnf = base.resolve_repo_path(base_record["cnf"])
    if sha256(base_manifest_path) != base_record["manifest_sha256"]:
        raise ValueError("base manifest hash mismatch")
    if sha256(base_cnf) != base_record["cnf_sha256"]:
        raise ValueError("base CNF hash mismatch")
    base_manifest = json.loads(base_manifest_path.read_text())
    if base_manifest.get("cnf_sha256") != base_record["cnf_sha256"]:
        raise ValueError("base provenance disagreement")

    model_record = manifest.get("lazy_two_kalmanson_label_model")
    if not isinstance(model_record, dict):
        raise TypeError("derived manifest has no authenticated SAT model")
    model_path = base.resolve_repo_path(model_record["path"])
    if sha256(model_path) != model_record["sha256"]:
        raise ValueError("SAT model hash mismatch")

    derived_cnf = base.resolve_repo_path(manifest["cnf"])
    if sha256(derived_cnf) != manifest.get("cnf_sha256"):
        raise ValueError("derived CNF hash mismatch")
    variables, derived_count = base.dimacs_header(derived_cnf)
    base_variables, base_count = base.dimacs_header(base_cnf)
    if variables != base_variables or variables != manifest.get("variables"):
        raise ValueError("variable count mismatch")
    assignment = parse_model(model_path, variables)
    checked_base_clauses = verify_model_satisfies_cnf(base_cnf, assignment)
    if checked_base_clauses != base_count:
        raise ValueError("base CNF clause count does not replay")

    order_index = int(manifest["order_index"])
    positions = tuple(int(value) for value in manifest["anonymous_positions"])
    order = export.source.normalized_order(order_index, positions)
    if tuple(manifest.get("order", ())) != order:
        raise ValueError("derived manifest has inconsistent cyclic order")
    clauses, group_count, pair_count = replay(order, assignment, variables)
    dimensions = {
        "inequalities": 4_760,
        "delta_groups": group_count,
        "cancelling_inequality_pairs": pair_count,
        "appended_clauses": len(clauses),
    }
    if manifest.get("lazy_two_kalmanson_label_dimensions") != dimensions:
        raise ValueError("lazy-cut dimensions do not replay")
    if manifest.get("lazy_two_kalmanson_label_clause_sha256") != clauses_digest(clauses):
        raise ValueError("lazy-cut clause digest mismatch")

    with base_cnf.open("rb") as base_handle, derived_cnf.open("rb") as derived:
        for base_line in base_handle:
            derived_line = derived.readline()
            if base_line.startswith(b"p cnf "):
                expected = f"p cnf {variables} {derived_count}\n".encode()
                if derived_line != expected:
                    raise ValueError("derived DIMACS header mismatch")
            elif derived_line != base_line:
                raise ValueError("derived CNF changed an authenticated base line")
        for clause in clauses:
            expected = (" ".join(map(str, clause)) + " 0\n").encode()
            if derived.readline() != expected:
                raise ValueError("derived suffix differs from independent replay")
        if derived.read(1):
            raise ValueError("derived CNF has trailing data")
    if derived_count != base_count + len(clauses) or derived_count != manifest["clauses"]:
        raise ValueError("derived clause count mismatch")
    blocks = manifest.get("clause_blocks", {})
    base_blocks = base_manifest.get("clause_blocks", {})
    expected_lazy_block = base_blocks.get("lazy_two_kalmanson_label", 0) + len(clauses)
    if blocks.get("lazy_two_kalmanson_label") != expected_lazy_block:
        raise ValueError("accumulated lazy clause-block count mismatch")

    report = {
        "schema": "p97-rigid221-exact17-lazy-two-kalmanson-label-cnf-validation-v1",
        "status": "PASS",
        "manifest": str(manifest_path.relative_to(REPO)),
        "manifest_sha256": sha256(manifest_path),
        "cnf": str(derived_cnf.relative_to(REPO)),
        "cnf_sha256": manifest["cnf_sha256"],
        "base_prefix_byte_exact": True,
        "model_bound_and_replayed": True,
        "base_model_satisfies_cnf": True,
        "base_model_checked_clauses": checked_base_clauses,
        "appended_clauses": len(clauses),
        "generation_sources_rechecked": len(sources),
        "variables": variables,
        "clauses": derived_count,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps(report, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
