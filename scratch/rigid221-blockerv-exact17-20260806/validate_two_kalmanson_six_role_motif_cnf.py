#!/usr/bin/env python3
"""Independently replay the six-role generic two-Kalmanson motif CNF layer."""

from __future__ import annotations

import argparse
import json
from itertools import combinations
from pathlib import Path

HERE = Path(__file__).resolve().parent


def load_appender():
    import importlib.util

    path = HERE / "append_two_kalmanson_six_role_motif_cuts.py"
    spec = importlib.util.spec_from_file_location("two_k_six_role_appender", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


app = load_appender()
REPO = app.REPO
base_append = app.base_append
EXPECTED_ATOMS = (
    (1, 2), (1, 4),
    (4, 0), (4, 2),
    (3, 4), (3, 5),
    (2, 5), (2, 0),
)


def reflected_atoms() -> tuple[tuple[int, int], ...]:
    return tuple((5 - center, 5 - point) for center, point in EXPECTED_ATOMS)


def rows_for_atoms(atoms: tuple[tuple[int, int], ...]):
    supports: dict[int, set[int]] = {}
    for center, point in atoms:
        supports.setdefault(center, set()).add(point)
    return tuple(
        app.producer_bank.MetricRow(center, tuple(sorted(points)), exact=False)
        for center, points in sorted(supports.items())
    )


def reconstruct(
    order: tuple[int, ...], variables: dict[tuple[int, int], int]
) -> set[tuple[int, ...]]:
    clauses: set[tuple[int, ...]] = set()
    for oriented_order in (order, tuple(reversed(order))):
        for start in range(len(order)):
            rotated = oriented_order[start:] + oriented_order[:start]
            for positions in combinations(range(len(order)), 6):
                roles = tuple(rotated[position] for position in positions)
                clauses.add(tuple(sorted(
                    -variables[roles[center], roles[point]]
                    for center, point in EXPECTED_ATOMS
                )))
    return clauses


def replay_templates(manifest: dict) -> int:
    templates = manifest.get("two_kalmanson_six_role_motif_checked_templates")
    if not isinstance(templates, dict) or set(templates) != {"forward", "reverse"}:
        raise ValueError("checked template set mismatch")
    checks = 0
    for name, atoms in (
        ("forward", EXPECTED_ATOMS),
        ("reverse", reflected_atoms()),
    ):
        proposed = templates[name]
        checked = app.producer_bank.certify_two_kalmanson_cancellation(
            rows_for_atoms(atoms), 6, tuple(range(6)), proposed["core"]
        )
        if checked != proposed:
            raise ValueError(f"{name} template does not replay canonically")
        if checked.get("lean_consumer") != app.support.LEAN_CONSUMER:
            raise ValueError(f"{name} template consumer mismatch")
        used = sorted({
            (step["center"], point)
            for path in checked["core"]["paths"]
            for step in path["steps"]
            if step["kind"] == "row"
            for point in (step["first"], step["second"])
        })
        if used != sorted(atoms):
            raise ValueError(f"{name} template uses a different atom set")
        checks += 1
    return checks


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    manifest_path = args.manifest.resolve()
    manifest = json.loads(manifest_path.read_text())
    expected_schema = (
        "p97-rigid221-exact17-two-kalmanson-six-role-motif-cnf-v1"
    )
    if manifest.get("schema") != expected_schema:
        raise ValueError("unexpected derived schema")
    if manifest.get("two_kalmanson_six_role_motif_atoms") != [
        list(pair) for pair in EXPECTED_ATOMS
    ]:
        raise ValueError("motif atom declaration mismatch")
    generation_sources = manifest.get(
        "two_kalmanson_six_role_motif_generation_source_hashes"
    )
    if generation_sources != app.source_hashes():
        raise ValueError("generation source hashes do not replay")

    base_record = manifest.get("two_kalmanson_six_role_motif_base")
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
    order = app.support.support.support.export.source.normalized_order(
        order_index, positions
    )
    if tuple(manifest.get("order", ())) != order:
        raise ValueError("derived manifest has inconsistent cyclic order")
    variables_map = app.support.support.support.export.selected_variables()
    clauses = sorted(reconstruct(order, variables_map))
    if manifest.get("two_kalmanson_six_role_motif_clauses") != len(clauses):
        raise ValueError("motif clause count mismatch")
    if manifest.get("two_kalmanson_six_role_motif_clause_sha256") != app.clauses_digest(clauses):
        raise ValueError("motif clause digest mismatch")
    template_checks = replay_templates(manifest)

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
        "schema": "p97-rigid221-exact17-two-kalmanson-six-role-motif-cnf-validation-v1",
        "status": "PASS",
        "manifest": str(manifest_path.relative_to(REPO)),
        "manifest_sha256": base_append.sha256(manifest_path),
        "cnf": str(derived_cnf.relative_to(REPO)),
        "cnf_sha256": manifest["cnf_sha256"],
        "base_prefix_byte_exact": True,
        "appended_clauses": len(clauses),
        "generation_sources_rechecked": len(generation_sources),
        "generic_template_replays": template_checks,
        "variables": variables,
        "clauses": clause_count,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps(report, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
