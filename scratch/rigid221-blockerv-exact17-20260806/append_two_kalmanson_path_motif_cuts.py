#!/usr/bin/env python3
"""Compile one checked generic two-Kalmanson path motif into exact-17 CNF."""

from __future__ import annotations

import argparse
import json
from collections.abc import Iterable
from itertools import combinations
from pathlib import Path

HERE = Path(__file__).resolve().parent


def load_support():
    import importlib.util

    path = HERE / "append_ordered_row_schema_cuts.py"
    spec = importlib.util.spec_from_file_location("two_k_path_support", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


support = load_support()
REPO = support.REPO
base_append = support.base_append
producer_bank = support.producer_bank
GENERIC_LEAN_SOURCE = REPO / (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "GenericRowNogoodCertificate.lean"
)
PRODUCER_SOURCE = REPO / "census/atail_force/producer_bank.py"
SOURCE_FILES = (
    Path(__file__).resolve(),
    HERE / "append_ordered_row_schema_cuts.py",
    HERE / "append_weighted_kalmanson_dihedral_orbits.py",
    GENERIC_LEAN_SOURCE,
    PRODUCER_SOURCE,
)

# The five positive source rows used by all four primitive equality paths in
# the post-schema-M survivor's checked generic two-Kalmanson certificate.
# Roles occur in cyclic order; the reverse pattern is checked independently.
MOTIF_ATOMS = (
    (0, 4), (0, 5),
    (5, 0), (5, 4),
    (1, 6), (1, 0),
    (4, 2), (4, 6),
    (3, 5), (3, 2),
)
LEAN_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "false_of_twoKalmansonCancellationData_of_check"
)


def source_hashes() -> dict[str, str]:
    return {
        str(path.relative_to(REPO)): base_append.sha256(path)
        for path in SOURCE_FILES
    }


def reflected_atoms() -> tuple[tuple[int, int], ...]:
    return tuple((6 - center, 6 - point) for center, point in MOTIF_ATOMS)


def rows_for_atoms(atoms: Iterable[tuple[int, int]]):
    supports: dict[int, set[int]] = {}
    for center, point in atoms:
        supports.setdefault(center, set()).add(point)
    return tuple(
        producer_bank.MetricRow(center, tuple(sorted(points)), exact=False)
        for center, points in sorted(supports.items())
    )


def checked_template(atoms: tuple[tuple[int, int], ...]) -> dict:
    hits = producer_bank.enumerate_two_kalmanson_cancellations(
        rows_for_atoms(atoms), 7, tuple(range(7))
    )
    if len(hits) != 1:
        raise RuntimeError(f"expected one checked two-Kalmanson core, got {len(hits)}")
    hit = hits[0]
    if hit.get("lean_consumer") != LEAN_CONSUMER:
        raise RuntimeError("generic two-Kalmanson consumer mismatch")
    used = sorted(
        {
            (step["center"], point)
            for path in hit["core"]["paths"]
            for step in path["steps"]
            if step["kind"] == "row"
            for point in (step["first"], step["second"])
        }
    )
    if used != sorted(atoms):
        raise RuntimeError("checked core does not use exactly the declared motif atoms")
    return hit


def motif_clauses(
    order: tuple[int, ...], variables: dict[tuple[int, int], int]
) -> set[tuple[int, ...]]:
    clauses: set[tuple[int, ...]] = set()
    for oriented_order in (order, tuple(reversed(order))):
        for start in range(len(order)):
            rotated = oriented_order[start:] + oriented_order[:start]
            for positions in combinations(range(len(order)), 7):
                roles = tuple(rotated[position] for position in positions)
                clauses.add(
                    tuple(
                        sorted(
                            -variables[roles[center], roles[point]]
                            for center, point in MOTIF_ATOMS
                        )
                    )
                )
    return clauses


def clauses_digest(clauses: Iterable[tuple[int, ...]]) -> str:
    import hashlib

    digest = hashlib.sha256()
    for clause in clauses:
        digest.update((" ".join(map(str, clause)) + " 0\n").encode())
    return digest.hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base-manifest", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    args = parser.parse_args()

    frozen_sources = source_hashes()
    templates = {
        "forward": checked_template(MOTIF_ATOMS),
        "reverse": checked_template(reflected_atoms()),
    }
    base_manifest_path = args.base_manifest.resolve()
    base_manifest = json.loads(base_manifest_path.read_text())
    order_index = int(base_manifest["order_index"])
    positions = tuple(int(value) for value in base_manifest["anonymous_positions"])
    order = support.support.export.source.normalized_order(order_index, positions)
    if tuple(base_manifest.get("order", ())) != order:
        raise ValueError("base manifest has inconsistent cyclic order")
    base_cnf = base_append.resolve_repo_path(base_manifest["cnf"])
    base_cnf_sha = base_append.sha256(base_cnf)
    if base_cnf_sha != base_manifest.get("cnf_sha256"):
        raise ValueError("base CNF hash mismatch")
    variables, base_clause_count = base_append.dimacs_header(base_cnf)
    if (variables, base_clause_count) != (
        base_manifest.get("variables"), base_manifest.get("clauses")
    ):
        raise ValueError("base DIMACS header disagrees with manifest")

    clauses = sorted(
        motif_clauses(order, support.support.export.selected_variables())
    )
    if source_hashes() != frozen_sources:
        raise RuntimeError("two-Kalmanson motif sources changed during generation")
    output = args.output.resolve()
    cnf_sha = base_append.write_derived_cnf(
        base_cnf, output, variables, base_clause_count, clauses
    )
    manifest = dict(base_manifest)
    manifest.update(
        {
            "schema": "p97-rigid221-exact17-two-kalmanson-path-motif-cnf-v1",
            "cnf": str(output.relative_to(REPO)),
            "cnf_sha256": cnf_sha,
            "clauses": base_clause_count + len(clauses),
            "two_kalmanson_path_motif_base": {
                "manifest": str(base_manifest_path.relative_to(REPO)),
                "manifest_sha256": base_append.sha256(base_manifest_path),
                "cnf": str(base_cnf.relative_to(REPO)),
                "cnf_sha256": base_cnf_sha,
                "clauses": base_clause_count,
            },
            "two_kalmanson_path_motif_atoms": [list(pair) for pair in MOTIF_ATOMS],
            "two_kalmanson_path_motif_clauses": len(clauses),
            "two_kalmanson_path_motif_clause_sha256": clauses_digest(clauses),
            "two_kalmanson_path_motif_checked_templates": templates,
            "two_kalmanson_path_motif_lean_consumer": LEAN_CONSUMER,
            "two_kalmanson_path_motif_generation_source_hashes": frozen_sources,
        }
    )
    blocks = dict(base_manifest.get("clause_blocks", {}))
    blocks["learned_nogoods"] = int(blocks.get("learned_nogoods", 0)) + len(clauses)
    blocks["two_kalmanson_path_motif"] = len(clauses)
    manifest["clause_blocks"] = blocks
    kinds = dict(base_manifest.get("learned_record_kinds", {}))
    kinds["two-kalmanson-path-motif"] = len(clauses)
    manifest["learned_record_kinds"] = kinds
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "appended_clauses": len(clauses),
        "clauses": manifest["clauses"],
        "cnf_sha256": cnf_sha,
        "manifest": str(args.manifest.resolve().relative_to(REPO)),
        "variables": variables,
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
