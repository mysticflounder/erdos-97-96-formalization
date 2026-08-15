#!/usr/bin/env python3
"""Independently replay a weighted-Kalmanson dihedral CNF successor."""

from __future__ import annotations

import argparse
from collections import Counter
import importlib.util
import json
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


base_append = load_module(
    "exact17_dihedral_validation_base", HERE / "append_weighted_kalmanson_cuts.py"
)
export = base_append.export
producer_bank = export.legacy.producer_bank


def edge(left: int, right: int) -> tuple[int, int]:
    return (left, right) if left < right else (right, left)


def normalized_pairs(pairs: tuple[tuple[int, int], tuple[int, int]]) -> Counter:
    return Counter(edge(left, right) for left, right in pairs)


def transform_term(
    term: dict[str, Any], mapping: dict[int, int], positions: dict[int, int]
) -> dict[str, Any]:
    quad = tuple(int(label) for label in term["quad"])
    source_left, source_right = producer_bank._kalmanson_edges(quad, term["form"])
    wanted_left = Counter(edge(mapping[a], mapping[b]) for a, b in source_left)
    wanted_right = Counter(edge(mapping[a], mapping[b]) for a, b in source_right)
    image_quad = tuple(sorted((mapping[label] for label in quad), key=positions.get))
    matching_forms = []
    for form in ("adjacentSides", "innerOuter"):
        candidate_left, candidate_right = producer_bank._kalmanson_edges(image_quad, form)
        if normalized_pairs(candidate_left) == wanted_left and normalized_pairs(candidate_right) == wanted_right:
            matching_forms.append(form)
    if len(matching_forms) != 1:
        raise ValueError("transformed term is not a unique Kalmanson form")
    return {
        "quad": list(image_quad),
        "form": matching_forms[0],
        "weight": int(term["weight"]),
    }


def replay_orbit(
    path: Path,
    order: tuple[int, ...],
    variables: dict[tuple[int, int], int],
) -> set[tuple[int, ...]]:
    payload = json.loads(path.read_text())
    if tuple(int(label) for label in payload["order"]) != order:
        raise ValueError(f"cyclic-order mismatch: {path}")
    source_rows_payload = payload["rows"]
    source_rows = export.legacy.rows_from_payload(source_rows_payload)
    weighted_terms = payload.get("weighted_terms")
    if weighted_terms is None:
        weighted_terms = payload["weighted_certificate"]["core"]["terms"]
    source_replay = producer_bank.certify_weighted_kalmanson_cancellation(
        source_rows, len(order), order, weighted_terms
    )
    if source_replay != payload["weighted_certificate"]:
        raise ValueError(f"source certificate drift: {path}")

    positions = {label: index for index, label in enumerate(order)}
    clauses: set[tuple[int, ...]] = set()
    for reflected in (False, True):
        direction = -1 if reflected else 1
        for rotation in range(len(order)):
            mapping = {
                order[index]: order[(rotation + direction * index) % len(order)]
                for index in range(len(order))
            }
            rows_payload = [
                {
                    "center": mapping[int(row["center"])],
                    "support": sorted(mapping[int(point)] for point in row["support"]),
                    "exact": bool(row.get("exact", False)),
                }
                for row in source_rows_payload
            ]
            rows = export.legacy.rows_from_payload(rows_payload)
            terms = [
                transform_term(term, mapping, positions)
                for term in weighted_terms
            ]
            producer_bank.certify_weighted_kalmanson_cancellation(
                rows, len(order), order, terms
            )
            clauses.add(
                tuple(
                    sorted(
                        {
                            -variables[row.center, point]
                            for row in rows
                            for point in row.support
                        }
                    )
                )
            )
    return clauses


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    manifest_path = args.manifest.resolve()
    manifest = json.loads(manifest_path.read_text())
    generation_sources = manifest.get("dihedral_generation_source_hashes")
    if not isinstance(generation_sources, dict) or not generation_sources:
        raise ValueError("derived manifest has no generation source freeze")
    for raw_path, expected_sha in generation_sources.items():
        source_path = base_append.resolve_repo_path(raw_path)
        if base_append.sha256(source_path) != expected_sha:
            raise ValueError(f"generation source hash mismatch: {source_path}")
    if manifest.get("schema") != "p97-rigid221-exact17-weighted-dihedral-cnf-v1":
        raise ValueError("derived manifest schema mismatch")
    base_record = manifest.get("dihedral_weighted_base")
    if not isinstance(base_record, dict):
        raise ValueError("derived manifest has no authenticated base")
    base_manifest_path = base_append.resolve_repo_path(base_record["manifest"])
    if base_append.sha256(base_manifest_path) != base_record.get("manifest_sha256"):
        raise ValueError("base manifest hash mismatch")
    base_manifest = json.loads(base_manifest_path.read_text())
    base_cnf = base_append.resolve_repo_path(base_record["cnf"])
    if base_append.sha256(base_cnf) != base_record.get("cnf_sha256"):
        raise ValueError("base CNF hash mismatch")
    if base_record.get("cnf_sha256") != base_manifest.get("cnf_sha256"):
        raise ValueError("base manifest and derived provenance disagree")

    order_index = int(manifest["order_index"])
    positions = tuple(int(value) for value in manifest["anonymous_positions"])
    order = export.source.normalized_order(order_index, positions)
    if tuple(manifest.get("order", ())) != order:
        raise ValueError("derived manifest has inconsistent cyclic order")
    certificate_records = manifest.get("dihedral_weighted_certificates")
    if not isinstance(certificate_records, list) or not certificate_records:
        raise ValueError("derived manifest has no dihedral certificates")
    variables_map = export.selected_variables()
    clauses: set[tuple[int, ...]] = set()
    for record in certificate_records:
        path = base_append.resolve_repo_path(record["path"])
        if base_append.sha256(path) != record.get("sha256"):
            raise ValueError(f"certificate hash mismatch: {path}")
        orbit = replay_orbit(path, order, variables_map)
        if len(orbit) != record.get("unique_orbit_clauses"):
            raise ValueError(f"orbit cardinality mismatch: {path}")
        clauses.update(orbit)
    ordered_clauses = sorted(clauses)
    if [list(clause) for clause in ordered_clauses] != manifest.get("dihedral_weighted_clauses"):
        raise ValueError("manifest clauses do not match independent orbit replay")
    if manifest.get("dihedral_checked_images") != 2 * len(order) * len(certificate_records):
        raise ValueError("checked-image count mismatch")

    derived_cnf = base_append.resolve_repo_path(manifest["cnf"])
    if base_append.sha256(derived_cnf) != manifest.get("cnf_sha256"):
        raise ValueError("derived CNF hash mismatch")
    variables, clause_count = base_append.dimacs_header(derived_cnf)
    base_variables, base_clause_count = base_append.dimacs_header(base_cnf)
    if variables != base_variables or variables != manifest.get("variables"):
        raise ValueError("derived variable count mismatch")
    if clause_count != base_clause_count + len(ordered_clauses):
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
        expected_suffix = [
            (" ".join(str(literal) for literal in clause) + " 0\n").encode()
            for clause in ordered_clauses
        ]
        if list(derived) != expected_suffix:
            raise ValueError("derived CNF suffix does not match replayed clauses")

    report = {
        "schema": "p97-rigid221-exact17-weighted-dihedral-cnf-validation-v1",
        "status": "PASS",
        "manifest": str(manifest_path.relative_to(REPO)),
        "manifest_sha256": base_append.sha256(manifest_path),
        "cnf": str(derived_cnf.relative_to(REPO)),
        "cnf_sha256": manifest["cnf_sha256"],
        "base_prefix_byte_exact": True,
        "certificates_exactly_replayed": len(certificate_records),
        "checked_images": manifest["dihedral_checked_images"],
        "generation_sources_rechecked": len(generation_sources),
        "validator_sha256": base_append.sha256(Path(__file__).resolve()),
        "appended_clauses": len(ordered_clauses),
        "variables": variables,
        "clauses": clause_count,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps(report, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
