#!/usr/bin/env python3
"""Append every exact-17 cyclic occurrence of ordered row schemas K, L, and M."""

from __future__ import annotations

import argparse
import json
from collections.abc import Iterable
from itertools import combinations
from pathlib import Path

HERE = Path(__file__).resolve().parent


def load_support() -> tuple[object, object, object]:
    import importlib.util

    path = HERE / "append_weighted_kalmanson_dihedral_orbits.py"
    spec = importlib.util.spec_from_file_location("ordered_schema_support", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module, module.base_append, module.producer_bank


support, base_append, producer_bank = load_support()
REPO = support.REPO
LEAN_SOURCE = REPO / "lean/Erdos9796Proof/P97/ATail/KalmansonFourEqualitySchemas.lean"
PRODUCER_SOURCE = REPO / "census/atail_force/producer_bank.py"
SOURCE_FILES = (
    Path(__file__).resolve(),
    HERE / "append_weighted_kalmanson_dihedral_orbits.py",
    HERE / "append_weighted_kalmanson_cuts.py",
    LEAN_SOURCE,
    PRODUCER_SOURCE,
)

# Each pair is (center role, support role).  Roles are assigned in cyclic order.
SCHEMA_ATOMS: dict[str, tuple[tuple[int, int], ...]] = {
    "K": (
        (4, 3), (4, 1), (4, 5),
        (3, 0), (3, 2),
        (0, 4), (0, 1), (0, 2),
        (1, 0), (1, 5),
    ),
    "L": (
        (6, 3), (6, 0),
        (2, 4), (2, 1),
        (4, 6), (4, 1), (4, 3),
        (5, 4), (5, 0),
    ),
    "M": (
        (0, 3), (0, 1), (0, 7),
        (6, 0), (6, 1),
        (3, 2), (3, 7),
        (4, 2), (4, 5),
        (1, 0), (1, 5),
    ),
}
LEAN_CONSUMERS = {
    "K": (
        "false_of_four_selected_rows_in_six_ccw_order_K",
        "false_of_four_selected_rows_in_six_ccw_order_K_of_decreasing",
    ),
    "L": (
        "false_of_four_selected_rows_in_seven_ccw_order_L",
        "false_of_four_selected_rows_in_seven_ccw_order_L_of_decreasing",
    ),
    "M": (
        "false_of_five_selected_rows_in_eight_ccw_order_M",
        "false_of_five_selected_rows_in_eight_ccw_order_M_of_decreasing",
    ),
}


def source_hashes() -> dict[str, str]:
    return {
        str(path.relative_to(REPO)): base_append.sha256(path)
        for path in SOURCE_FILES
    }


def require_consumers() -> None:
    source = LEAN_SOURCE.read_text(encoding="utf-8")
    for names in LEAN_CONSUMERS.values():
        for name in names:
            if f"theorem {name}" not in source:
                raise RuntimeError(f"missing Lean consumer {name}")


def schema_clauses(
    schema: str,
    order: tuple[int, ...],
    variables: dict[tuple[int, int], int],
) -> set[tuple[int, ...]]:
    atoms = SCHEMA_ATOMS[schema]
    arity = max(max(pair) for pair in atoms) + 1
    clauses: set[tuple[int, ...]] = set()
    for oriented_order in (order, tuple(reversed(order))):
        for start in range(len(order)):
            rotated = oriented_order[start:] + oriented_order[:start]
            for positions in combinations(range(len(order)), arity):
                roles = tuple(rotated[position] for position in positions)
                clauses.add(
                    tuple(sorted(-variables[roles[c], roles[p]] for c, p in atoms))
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
    require_consumers()
    base_manifest_path = args.base_manifest.resolve()
    base_manifest = json.loads(base_manifest_path.read_text())
    if base_manifest.get("learned_replay") != "verified":
        raise ValueError("base CNF did not replay its learned certificates")
    order_index = int(base_manifest["order_index"])
    positions = tuple(int(value) for value in base_manifest["anonymous_positions"])
    order = support.export.source.normalized_order(order_index, positions)
    if tuple(base_manifest.get("order", ())) != order:
        raise ValueError("base manifest has inconsistent cyclic order")
    base_cnf = base_append.resolve_repo_path(base_manifest["cnf"])
    base_cnf_sha = base_append.sha256(base_cnf)
    if base_cnf_sha != base_manifest.get("cnf_sha256"):
        raise ValueError("base CNF hash mismatch")
    variables, base_clause_count = base_append.dimacs_header(base_cnf)
    if (variables, base_clause_count) != (
        base_manifest.get("variables"),
        base_manifest.get("clauses"),
    ):
        raise ValueError("base DIMACS header disagrees with manifest")

    variable_map = support.export.selected_variables()
    by_schema = {
        schema: schema_clauses(schema, order, variable_map)
        for schema in sorted(SCHEMA_ATOMS)
    }
    clauses = sorted(set().union(*by_schema.values()))
    if sum(map(len, by_schema.values())) != len(clauses):
        raise ValueError("K/L/M clause families unexpectedly overlap")
    if source_hashes() != frozen_sources:
        raise RuntimeError("ordered-schema sources changed during generation")

    output = args.output.resolve()
    cnf_sha = base_append.write_derived_cnf(
        base_cnf, output, variables, base_clause_count, clauses
    )
    manifest = dict(base_manifest)
    manifest.update(
        {
            "schema": "p97-rigid221-exact17-ordered-row-schema-cnf-v1",
            "cnf": str(output.relative_to(REPO)),
            "cnf_sha256": cnf_sha,
            "clauses": base_clause_count + len(clauses),
            "ordered_row_schema_base": {
                "manifest": str(base_manifest_path.relative_to(REPO)),
                "manifest_sha256": base_append.sha256(base_manifest_path),
                "cnf": str(base_cnf.relative_to(REPO)),
                "cnf_sha256": base_cnf_sha,
                "clauses": base_clause_count,
            },
            "ordered_row_schema_families": {
                schema: {
                    "arity": max(max(pair) for pair in SCHEMA_ATOMS[schema]) + 1,
                    "atoms": [list(pair) for pair in SCHEMA_ATOMS[schema]],
                    "clauses": len(family_clauses),
                    "lean_consumers": list(LEAN_CONSUMERS[schema]),
                }
                for schema, family_clauses in by_schema.items()
            },
            "ordered_row_schema_clauses": len(clauses),
            "ordered_row_schema_clause_sha256": clauses_digest(clauses),
            "ordered_row_schema_generation_source_hashes": frozen_sources,
        }
    )
    blocks = dict(base_manifest.get("clause_blocks", {}))
    blocks["learned_nogoods"] = int(blocks.get("learned_nogoods", 0)) + len(clauses)
    blocks["ordered_row_schemas_k_l_m"] = len(clauses)
    manifest["clause_blocks"] = blocks
    kinds = dict(base_manifest.get("learned_record_kinds", {}))
    for schema, family_clauses in by_schema.items():
        kinds[f"ordered-row-schema-{schema.lower()}"] = len(family_clauses)
    manifest["learned_record_kinds"] = kinds
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "appended_clauses": len(clauses),
                "by_schema": {key: len(value) for key, value in by_schema.items()},
                "clauses": manifest["clauses"],
                "cnf_sha256": cnf_sha,
                "manifest": str(args.manifest.resolve().relative_to(REPO)),
                "variables": variables,
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
