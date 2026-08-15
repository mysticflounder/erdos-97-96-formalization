#!/usr/bin/env python3
"""Append every direct two-Kalmanson distance-label cancellation cut.

The source-faithful exact-17 CNF already assigns an eight-bit label to each
carrier edge and defines XOR variables for every pair of edge labels.  This
compiler adds the complete finite family saying that no permutation can match
the four left edges of two strict Kalmanson inequalities with their four right
edges.  The cuts are justified by the cardinality-generic Lean theorem named
in ``LEAN_CONSUMER``; they do not depend on previously observed CEGAR models.
"""

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
LEAN_SOURCE = (
    REPO
    / "lean/Erdos9796Proof/P97/ATail/TwoKalmansonLabelCut.lean"
)
GENERIC_SOURCE = (
    REPO
    / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "GenericRowNogoodCertificate.lean"
)
LEAN_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "false_of_twoKalmansonLabelCancellationData"
)
DISTANCE_LABEL_BITS = 8
FORMS = ("adjacentSides", "innerOuter")


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


base_append = load_module(
    "exact17_all_two_k_label_base_append",
    HERE / "append_weighted_kalmanson_cuts.py",
)
export = base_append.export

SOURCE_FILES = (
    Path(__file__).resolve(),
    HERE / "append_weighted_kalmanson_cuts.py",
    HERE / "export_source_faithful_boolean_cnf.py",
    LEAN_SOURCE,
    GENERIC_SOURCE,
    REPO / "lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean",
)


def source_hashes() -> dict[str, str]:
    return {
        str(path.relative_to(REPO)): base_append.sha256(path)
        for path in SOURCE_FILES
    }


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
    return (left, right) if left < right else (right, left)


def inequality_edges(
    labels: tuple[int, int, int, int], form: str
) -> tuple[tuple[tuple[int, int], tuple[int, int]], tuple[tuple[int, int], tuple[int, int]]]:
    a, b, c, d = labels
    if form == "adjacentSides":
        left = (edge(a, b), edge(c, d))
    elif form == "innerOuter":
        left = (edge(b, c), edge(a, d))
    else:
        raise ValueError(f"unknown Kalmanson form: {form}")
    return left, (edge(a, c), edge(b, d))


def inequalities(
    order: tuple[int, ...],
) -> tuple[
    tuple[
        tuple[tuple[int, int], tuple[int, int]],
        tuple[tuple[int, int], tuple[int, int]],
    ],
    ...,
]:
    result = []
    for positions in combinations(range(len(order)), 4):
        labels = tuple(order[position] for position in positions)
        for form in FORMS:
            result.append(inequality_edges(labels, form))
    expected = 2 * len(tuple(combinations(range(len(order)), 4)))
    if len(result) != expected:
        raise AssertionError("incomplete Kalmanson inequality enumeration")
    return tuple(result)


def comparison_variables(
    total_variables: int,
) -> dict[tuple[tuple[int, int], tuple[int, int]], tuple[int, ...]]:
    selected = export.selected_variables()
    next_variable = max(selected.values()) + 1
    next_variable += len(export.source.FIFTH_CENTER_CANDIDATES)
    carrier_edges = tuple(combinations(export.source.POINTS, 2))
    next_variable += len(carrier_edges) * DISTANCE_LABEL_BITS
    result = {}
    for comparison in combinations(carrier_edges, 2):
        result[comparison] = tuple(
            range(next_variable, next_variable + DISTANCE_LABEL_BITS)
        )
        next_variable += DISTANCE_LABEL_BITS
    if next_variable - 1 != total_variables:
        raise ValueError(
            "distance-label variable reconstruction mismatch: "
            f"expected max {total_variables}, reconstructed {next_variable - 1}"
        )
    if len(result) != 9_180:
        raise AssertionError("unexpected edge-comparison count")
    return result


def clauses_for_pair(
    first,
    second,
    comparisons: dict[
        tuple[tuple[int, int], tuple[int, int]], tuple[int, ...]
    ],
) -> tuple[tuple[int, ...], ...]:
    left_edges = (*first[0], *second[0])
    right_edges = (*first[1], *second[1])
    clauses: set[tuple[int, ...]] = set()
    for permutation in permutations(range(4)):
        literals: set[int] = set()
        for index, target in enumerate(permutation):
            left = left_edges[index]
            right = right_edges[target]
            if left == right:
                continue
            comparison = tuple(sorted((left, right)))
            literals.update(comparisons[comparison])
        if not literals:
            raise ValueError(
                "two strict Kalmanson inequalities cancel without any label "
                "equalities"
            )
        clauses.add(tuple(sorted(literals)))
    return tuple(sorted(clauses))


def all_clauses(
    order: tuple[int, ...],
    comparisons: dict[
        tuple[tuple[int, int], tuple[int, int]], tuple[int, ...]
    ],
) -> Iterator[tuple[int, ...]]:
    bank = inequalities(order)
    for first, second in combinations_with_replacement(bank, 2):
        yield from clauses_for_pair(first, second, comparisons)


def clause_statistics(order, comparisons) -> tuple[int, str, int, int]:
    count = 0
    shortest = 10**9
    longest = 0
    digest = hashlib.sha256()
    for clause in all_clauses(order, comparisons):
        count += 1
        shortest = min(shortest, len(clause))
        longest = max(longest, len(clause))
        digest.update((" ".join(map(str, clause)) + " 0\n").encode())
    return count, digest.hexdigest(), shortest, longest


def write_derived_cnf(
    base: Path,
    output: Path,
    variables: int,
    base_clauses: int,
    appended_count: int,
    clauses: Iterator[tuple[int, ...]],
) -> str:
    output.parent.mkdir(parents=True, exist_ok=True)
    digest = hashlib.sha256()
    header_seen = False
    written = 0
    with base.open("rb") as source, output.open("wb") as target:
        for line in source:
            if line.startswith(b"p cnf "):
                if header_seen:
                    raise ValueError(f"multiple DIMACS headers: {base}")
                header_seen = True
                line = f"p cnf {variables} {base_clauses + appended_count}\n".encode()
            target.write(line)
            digest.update(line)
        if not header_seen:
            raise ValueError(f"missing DIMACS header: {base}")
        for clause in clauses:
            line = (" ".join(map(str, clause)) + " 0\n").encode()
            target.write(line)
            digest.update(line)
            written += 1
    if written != appended_count:
        raise ValueError(
            f"clause stream changed between passes: {written} != {appended_count}"
        )
    return digest.hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base-manifest", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--count-only", action="store_true")
    args = parser.parse_args()

    require_lean_consumer()
    frozen_sources = source_hashes()
    base_manifest_path = args.base_manifest.resolve()
    base_manifest = json.loads(base_manifest_path.read_text())
    base_cnf = base_append.resolve_repo_path(base_manifest["cnf"])
    if base_append.sha256(base_cnf) != base_manifest.get("cnf_sha256"):
        raise ValueError("base CNF hash mismatch")
    variables, base_clause_count = base_append.dimacs_header(base_cnf)
    if (variables, base_clause_count) != (
        base_manifest.get("variables"),
        base_manifest.get("clauses"),
    ):
        raise ValueError("base DIMACS header disagrees with manifest")
    blocks = base_manifest.get("clause_blocks", {})
    if blocks.get("transitive_label_xor_definition") != 293_760:
        raise ValueError("base CNF lacks the authenticated full XOR label layer")

    order_index = int(base_manifest["order_index"])
    positions = tuple(int(value) for value in base_manifest["anonymous_positions"])
    order = export.source.normalized_order(order_index, positions)
    if tuple(base_manifest.get("order", ())) != order:
        raise ValueError("base manifest has inconsistent cyclic order")
    comparisons = comparison_variables(variables)
    count, clause_sha, shortest, longest = clause_statistics(order, comparisons)
    dimensions = {
        "inequalities": len(inequalities(order)),
        "inequality_pairs_with_replacement": (
            len(inequalities(order)) * (len(inequalities(order)) + 1) // 2
        ),
        "appended_clauses": count,
        "shortest_clause": shortest,
        "longest_clause": longest,
    }
    if args.count_only:
        print(json.dumps({**dimensions, "clause_sha256": clause_sha}, sort_keys=True))
        return 0
    if source_hashes() != frozen_sources:
        raise RuntimeError("two-Kalmanson label-cut sources changed during generation")

    output = args.output.resolve()
    cnf_sha = write_derived_cnf(
        base_cnf,
        output,
        variables,
        base_clause_count,
        count,
        all_clauses(order, comparisons),
    )
    manifest = dict(base_manifest)
    manifest.update({
        "schema": "p97-rigid221-exact17-all-two-kalmanson-label-cnf-v1",
        "cnf": str(output.relative_to(REPO)),
        "cnf_sha256": cnf_sha,
        "clauses": base_clause_count + count,
        "all_two_kalmanson_label_base": {
            "manifest": str(base_manifest_path.relative_to(REPO)),
            "manifest_sha256": base_append.sha256(base_manifest_path),
            "cnf": str(base_cnf.relative_to(REPO)),
            "cnf_sha256": base_append.sha256(base_cnf),
            "clauses": base_clause_count,
        },
        "all_two_kalmanson_label_dimensions": dimensions,
        "all_two_kalmanson_label_clause_sha256": clause_sha,
        "all_two_kalmanson_label_lean_consumer": LEAN_CONSUMER,
        "all_two_kalmanson_label_generation_source_hashes": frozen_sources,
    })
    clause_blocks = dict(blocks)
    clause_blocks["all_two_kalmanson_label"] = count
    manifest["clause_blocks"] = clause_blocks
    kinds = dict(base_manifest.get("learned_record_kinds", {}))
    kinds["all-two-kalmanson-label"] = count
    manifest["learned_record_kinds"] = kinds
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        **dimensions,
        "cnf_sha256": cnf_sha,
        "manifest": str(args.manifest.resolve().relative_to(REPO)),
        "variables": variables,
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
