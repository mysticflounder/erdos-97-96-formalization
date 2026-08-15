#!/usr/bin/env python3
"""Independently replay an exact-17 ordered-row-schema derived CNF."""

from __future__ import annotations

import argparse
import json
from itertools import combinations
from pathlib import Path

HERE = Path(__file__).resolve().parent


def load_appender():
    import importlib.util

    path = HERE / "append_ordered_row_schema_cuts.py"
    spec = importlib.util.spec_from_file_location("ordered_schema_appender", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


app = load_appender()
REPO = app.REPO
base_append = app.base_append

# Deliberately duplicated from the generator so validation does not call its
# clause-construction routine.
EXPECTED_ATOMS = {
    "K": ((4, 3), (4, 1), (4, 5), (3, 0), (3, 2),
          (0, 4), (0, 1), (0, 2), (1, 0), (1, 5)),
    "L": ((6, 3), (6, 0), (2, 4), (2, 1), (4, 6),
          (4, 1), (4, 3), (5, 4), (5, 0)),
    "M": ((0, 3), (0, 1), (0, 7), (6, 0), (6, 1),
          (3, 2), (3, 7), (4, 2), (4, 5), (1, 0), (1, 5)),
}


def reconstruct(
    atoms: tuple[tuple[int, int], ...],
    order: tuple[int, ...],
    variables: dict[tuple[int, int], int],
) -> set[tuple[int, ...]]:
    arity = max(max(pair) for pair in atoms) + 1
    clauses: set[tuple[int, ...]] = set()
    for oriented_order in (order, tuple(reversed(order))):
        for start in range(len(order)):
            rotated = oriented_order[start:] + oriented_order[:start]
            for positions in combinations(range(len(order)), arity):
                roles = tuple(rotated[position] for position in positions)
                clauses.add(tuple(sorted(-variables[roles[c], roles[p]] for c, p in atoms)))
    return clauses


def validate_producer_matchers(
    order: tuple[int, ...],
    variables: dict[tuple[int, int], int],
    families: dict[str, set[tuple[int, ...]]],
) -> int:
    checks = 0
    for schema, atoms in EXPECTED_ATOMS.items():
        arity = max(max(pair) for pair in atoms) + 1
        for oriented_order in (order, tuple(reversed(order))):
            roles = oriented_order[:arity]
            supports: dict[int, set[int]] = {}
            for center_role, point_role in atoms:
                supports.setdefault(roles[center_role], set()).add(roles[point_role])
            rows = tuple(
                app.producer_bank.MetricRow(center, tuple(sorted(points)), exact=False)
                for center, points in sorted(supports.items())
            )
            if schema == "K":
                match = (
                    app.producer_bank._direct_six_point_four_selected_row_kalmanson_core(
                        rows, oriented_order, schema="k"
                    )
                )
            elif schema == "L":
                match = (
                    app.producer_bank._direct_seven_point_four_selected_row_kalmanson_l_core(
                        rows, oriented_order
                    )
                )
            else:
                match = (
                    app.producer_bank._direct_eight_point_five_selected_row_kalmanson_m_core(
                        rows, oriented_order
                    )
                )
            if match is None:
                raise ValueError(f"producer bank did not recognize schema {schema}")
            clause = tuple(
                sorted(-variables[roles[center], roles[point]] for center, point in atoms)
            )
            if clause not in families[schema]:
                raise ValueError(f"schema-{schema} representative clause is absent")
            checks += 1
    return checks


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    manifest_path = args.manifest.resolve()
    manifest = json.loads(manifest_path.read_text())
    if manifest.get("schema") != "p97-rigid221-exact17-ordered-row-schema-cnf-v1":
        raise ValueError("derived manifest schema mismatch")
    generation_sources = manifest.get("ordered_row_schema_generation_source_hashes")
    if not isinstance(generation_sources, dict) or not generation_sources:
        raise ValueError("derived manifest has no generation source freeze")
    for raw_path, expected_sha in generation_sources.items():
        path = base_append.resolve_repo_path(raw_path)
        if base_append.sha256(path) != expected_sha:
            raise ValueError(f"generation source hash mismatch: {path}")

    base_record = manifest.get("ordered_row_schema_base")
    if not isinstance(base_record, dict):
        raise TypeError("derived manifest has no authenticated base")
    base_manifest_path = base_append.resolve_repo_path(base_record["manifest"])
    if base_append.sha256(base_manifest_path) != base_record["manifest_sha256"]:
        raise ValueError("base manifest hash mismatch")
    base_manifest = json.loads(base_manifest_path.read_text())
    base_cnf = base_append.resolve_repo_path(base_record["cnf"])
    if base_append.sha256(base_cnf) != base_record["cnf_sha256"]:
        raise ValueError("base CNF hash mismatch")
    if base_manifest.get("cnf_sha256") != base_record["cnf_sha256"]:
        raise ValueError("base manifest and derived provenance disagree")

    order_index = int(manifest["order_index"])
    positions = tuple(int(value) for value in manifest["anonymous_positions"])
    order = app.support.export.source.normalized_order(order_index, positions)
    if tuple(manifest.get("order", ())) != order:
        raise ValueError("derived manifest has inconsistent cyclic order")
    variables_map = app.support.export.selected_variables()
    families = {
        schema: reconstruct(atoms, order, variables_map)
        for schema, atoms in EXPECTED_ATOMS.items()
    }
    clauses = sorted(set().union(*families.values()))
    if sum(map(len, families.values())) != len(clauses):
        raise ValueError("K/L/M clause families unexpectedly overlap")
    records = manifest.get("ordered_row_schema_families")
    if not isinstance(records, dict) or set(records) != set(EXPECTED_ATOMS):
        raise ValueError("schema-family manifest mismatch")
    for schema, family in families.items():
        record = records[schema]
        if record.get("atoms") != [list(pair) for pair in EXPECTED_ATOMS[schema]]:
            raise ValueError(f"schema-{schema} atoms mismatch")
        if record.get("clauses") != len(family):
            raise ValueError(f"schema-{schema} count mismatch")
    if manifest.get("ordered_row_schema_clauses") != len(clauses):
        raise ValueError("combined clause count mismatch")
    if manifest.get("ordered_row_schema_clause_sha256") != app.clauses_digest(clauses):
        raise ValueError("combined clause digest mismatch")

    app.require_consumers()
    producer_matcher_checks = validate_producer_matchers(
        order, variables_map, families
    )
    derived_cnf = base_append.resolve_repo_path(manifest["cnf"])
    if base_append.sha256(derived_cnf) != manifest.get("cnf_sha256"):
        raise ValueError("derived CNF hash mismatch")
    variables, clause_count = base_append.dimacs_header(derived_cnf)
    base_variables, base_clause_count = base_append.dimacs_header(base_cnf)
    if variables != base_variables or variables != manifest.get("variables"):
        raise ValueError("derived variable count mismatch")
    if clause_count != base_clause_count + len(clauses):
        raise ValueError("derived clause count mismatch")

    with base_cnf.open("rb") as base, derived_cnf.open("rb") as derived:
        for base_line in base:
            derived_line = derived.readline()
            if base_line.startswith(b"p cnf "):
                expected = f"p cnf {variables} {clause_count}\n".encode()
                if derived_line != expected:
                    raise ValueError("derived DIMACS header mismatch")
            elif derived_line != base_line:
                raise ValueError("derived CNF changed an authenticated base line")
        for clause in clauses:
            expected = (" ".join(map(str, clause)) + " 0\n").encode()
            if derived.readline() != expected:
                raise ValueError("derived CNF suffix does not match replayed clauses")
        if derived.read(1):
            raise ValueError("derived CNF has trailing data")

    report = {
        "schema": "p97-rigid221-exact17-ordered-row-schema-cnf-validation-v1",
        "status": "PASS",
        "manifest": str(manifest_path.relative_to(REPO)),
        "manifest_sha256": base_append.sha256(manifest_path),
        "cnf": str(derived_cnf.relative_to(REPO)),
        "cnf_sha256": manifest["cnf_sha256"],
        "base_prefix_byte_exact": True,
        "appended_clauses": len(clauses),
        "by_schema": {key: len(value) for key, value in families.items()},
        "generation_sources_rechecked": len(generation_sources),
        "producer_matcher_checks": producer_matcher_checks,
        "variables": variables,
        "clauses": clause_count,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps(report, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
