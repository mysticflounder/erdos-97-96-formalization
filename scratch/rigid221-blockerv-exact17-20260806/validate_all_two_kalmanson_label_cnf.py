#!/usr/bin/env python3
"""Independently replay the exhaustive direct two-Kalmanson label layer."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from collections.abc import Iterator
from itertools import combinations, combinations_with_replacement, permutations
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
LEAN_SOURCE = REPO / "lean/Erdos9796Proof/P97/ATail/TwoKalmansonLabelCut.lean"
GENERIC_SOURCE = (
    REPO
    / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "GenericRowNogoodCertificate.lean"
)
APPENDER = HERE / "append_all_two_kalmanson_label_cuts.py"
SOURCE_FILES = (
    APPENDER,
    HERE / "append_weighted_kalmanson_cuts.py",
    HERE / "export_source_faithful_boolean_cnf.py",
    LEAN_SOURCE,
    GENERIC_SOURCE,
    REPO / "lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean",
)
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
    "exact17_all_two_k_label_validator_base",
    HERE / "append_weighted_kalmanson_cuts.py",
)
export = base.export


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def expected_source_hashes() -> dict[str, str]:
    return {str(path.relative_to(REPO)): sha256(path) for path in SOURCE_FILES}


def require_lean_consumer() -> None:
    text = LEAN_SOURCE.read_text()
    required = (
        "structure TwoKalmansonLabelCancellationData",
        "theorem false_of_twoKalmansonLabelCancellationData",
        "data.firstQuad.kalmanson_lt",
        "data.secondQuad.kalmanson_lt",
        "data.permutation.sum_comp_eq_of_check",
    )
    missing = [token for token in required if token not in text]
    if missing:
        raise RuntimeError(f"missing direct-label Lean consumer tokens: {missing}")


def edge(left: int, right: int) -> tuple[int, int]:
    return min(left, right), max(left, right)


def strict_inequalities(order: tuple[int, ...]):
    for positions in combinations(range(len(order)), 4):
        a, b, c, d = (order[position] for position in positions)
        right = (edge(a, c), edge(b, d))
        yield ((edge(a, b), edge(c, d)), right)
        yield ((edge(b, c), edge(a, d)), right)


def comparison_variables(total_variables: int):
    next_variable = max(export.selected_variables().values()) + 1
    next_variable += len(export.source.FIFTH_CENTER_CANDIDATES)
    carrier_edges = tuple(combinations(export.source.POINTS, 2))
    next_variable += len(carrier_edges) * BITS
    result = {}
    for pair in combinations(carrier_edges, 2):
        result[pair] = tuple(range(next_variable, next_variable + BITS))
        next_variable += BITS
    if next_variable - 1 != total_variables or len(result) != 9_180:
        raise ValueError("independent XOR-variable reconstruction mismatch")
    return result


def pair_clauses(first, second, comparisons) -> tuple[tuple[int, ...], ...]:
    left = (*first[0], *second[0])
    right = (*first[1], *second[1])
    clauses = set()
    for permutation in permutations(range(4)):
        literals = set()
        for source, target in enumerate(permutation):
            if left[source] != right[target]:
                pair = tuple(sorted((left[source], right[target])))
                literals.update(comparisons[pair])
        if not literals:
            raise ValueError("strict inequalities admit an identity cancellation")
        clauses.add(tuple(sorted(literals)))
    return tuple(sorted(clauses))


def replayed_clauses(order, comparisons) -> Iterator[tuple[int, ...]]:
    inequalities = tuple(strict_inequalities(order))
    if len(inequalities) != 4_760:
        raise ValueError("expected 4,760 strict Kalmanson inequalities")
    for first, second in combinations_with_replacement(inequalities, 2):
        yield from pair_clauses(first, second, comparisons)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    require_lean_consumer()
    manifest_path = args.manifest.resolve()
    manifest = json.loads(manifest_path.read_text())
    if manifest.get("schema") != "p97-rigid221-exact17-all-two-kalmanson-label-cnf-v1":
        raise ValueError("unexpected derived schema")
    if manifest.get("all_two_kalmanson_label_lean_consumer") != LEAN_CONSUMER:
        raise ValueError("Lean consumer mismatch")
    sources = manifest.get("all_two_kalmanson_label_generation_source_hashes")
    if sources != expected_source_hashes():
        raise ValueError("generation source hashes do not replay")

    base_record = manifest.get("all_two_kalmanson_label_base")
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

    derived_cnf = base.resolve_repo_path(manifest["cnf"])
    if sha256(derived_cnf) != manifest.get("cnf_sha256"):
        raise ValueError("derived CNF hash mismatch")
    variables, derived_count = base.dimacs_header(derived_cnf)
    base_variables, base_count = base.dimacs_header(base_cnf)
    if variables != base_variables or variables != manifest.get("variables"):
        raise ValueError("derived variable count mismatch")

    order_index = int(manifest["order_index"])
    positions = tuple(int(value) for value in manifest["anonymous_positions"])
    order = export.source.normalized_order(order_index, positions)
    if tuple(manifest.get("order", ())) != order:
        raise ValueError("derived manifest has inconsistent cyclic order")
    comparisons = comparison_variables(variables)
    clauses = replayed_clauses(order, comparisons)

    digest = hashlib.sha256()
    appended = 0
    shortest = 10**9
    longest = 0
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
            line = (" ".join(map(str, clause)) + " 0\n").encode()
            if derived.readline() != line:
                raise ValueError("derived suffix differs from independent replay")
            digest.update(line)
            appended += 1
            shortest = min(shortest, len(clause))
            longest = max(longest, len(clause))
        if derived.read(1):
            raise ValueError("derived CNF has trailing data")

    dimensions = manifest.get("all_two_kalmanson_label_dimensions")
    expected_dimensions = {
        "inequalities": 4_760,
        "inequality_pairs_with_replacement": 11_331_180,
        "appended_clauses": appended,
        "shortest_clause": shortest,
        "longest_clause": longest,
    }
    if dimensions != expected_dimensions:
        raise ValueError("dimension manifest does not replay")
    if digest.hexdigest() != manifest.get("all_two_kalmanson_label_clause_sha256"):
        raise ValueError("appended clause digest mismatch")
    if derived_count != base_count + appended or derived_count != manifest.get("clauses"):
        raise ValueError("derived clause count mismatch")
    if manifest.get("clause_blocks", {}).get("all_two_kalmanson_label") != appended:
        raise ValueError("clause-block count mismatch")

    report = {
        "schema": "p97-rigid221-exact17-all-two-kalmanson-label-cnf-validation-v1",
        "status": "PASS",
        "manifest": str(manifest_path.relative_to(REPO)),
        "manifest_sha256": sha256(manifest_path),
        "cnf": str(derived_cnf.relative_to(REPO)),
        "cnf_sha256": manifest["cnf_sha256"],
        "base_prefix_byte_exact": True,
        "appended_clauses": appended,
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
