#!/usr/bin/env python3
"""Fail-closed validator for a streamed lazy weighted-Kalmanson successor."""

from __future__ import annotations

import argparse
import importlib.util
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


append = load_module(
    "exact17_lazy_weighted_append_validation",
    HERE / "append_weighted_kalmanson_cuts.py",
)
export = append.export


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    manifest_path = args.manifest.resolve()
    manifest = json.loads(manifest_path.read_text())
    if manifest.get("schema") != "p97-rigid221-exact17-lazy-weighted-cnf-v1":
        raise ValueError("derived manifest schema mismatch")
    base_record = manifest.get("lazy_weighted_base")
    if not isinstance(base_record, dict):
        raise ValueError("derived manifest has no authenticated base")
    base_manifest_path = append.resolve_repo_path(base_record["manifest"])
    if append.sha256(base_manifest_path) != base_record.get("manifest_sha256"):
        raise ValueError("base manifest hash mismatch")
    base_manifest = json.loads(base_manifest_path.read_text())
    base_cnf = append.resolve_repo_path(base_record["cnf"])
    if append.sha256(base_cnf) != base_record.get("cnf_sha256"):
        raise ValueError("base CNF hash mismatch")
    if base_record.get("cnf_sha256") != base_manifest.get("cnf_sha256"):
        raise ValueError("base manifest and derived provenance disagree")

    order_index = int(manifest["order_index"])
    positions = tuple(int(value) for value in manifest["anonymous_positions"])
    order = export.source.normalized_order(order_index, positions)
    certificate_records = manifest.get("lazy_weighted_certificates")
    if not isinstance(certificate_records, list) or not certificate_records:
        raise ValueError("derived manifest has no weighted certificates")
    payloads = []
    for record in certificate_records:
        path = append.resolve_repo_path(record["path"])
        if append.sha256(path) != record.get("sha256"):
            raise ValueError(f"weighted-certificate hash mismatch: {path}")
        payloads.append(
            export.read_weighted_certificate(
                path, order_index, positions  # type: ignore[arg-type]
            )
        )
    clauses, equality_clauses, _kinds = export.learned_clauses(
        payloads,
        export.selected_variables(),
        order,
        120_000,
        replay=True,
    )
    if equality_clauses:
        raise AssertionError("weighted validation unexpectedly emitted equality cuts")
    clauses = sorted(set(clauses))
    if [list(clause) for clause in clauses] != manifest.get(
        "lazy_weighted_clauses"
    ):
        raise ValueError("derived manifest clauses do not match exact certificates")

    derived_cnf = append.resolve_repo_path(manifest["cnf"])
    if append.sha256(derived_cnf) != manifest.get("cnf_sha256"):
        raise ValueError("derived CNF hash mismatch")
    variables, derived_clause_count = append.dimacs_header(derived_cnf)
    base_variables, base_clause_count = append.dimacs_header(base_cnf)
    if variables != base_variables or variables != manifest.get("variables"):
        raise ValueError("derived variable count mismatch")
    if derived_clause_count != base_clause_count + len(clauses):
        raise ValueError("derived clause count mismatch")

    with base_cnf.open("rb") as base, derived_cnf.open("rb") as derived:
        for base_line in base:
            derived_line = derived.readline()
            if not derived_line:
                raise ValueError("derived CNF truncated inside base prefix")
            if base_line.startswith(b"p cnf "):
                expected = f"p cnf {variables} {derived_clause_count}\n".encode()
                if derived_line != expected:
                    raise ValueError("derived DIMACS header mismatch")
            elif derived_line != base_line:
                raise ValueError("derived CNF changed an authenticated base line")
        expected_suffix = [
            (" ".join(str(literal) for literal in clause) + " 0\n").encode()
            for clause in clauses
        ]
        actual_suffix = list(derived)
        if actual_suffix != expected_suffix:
            raise ValueError("derived CNF suffix does not match certificate clauses")

    report = {
        "schema": "p97-rigid221-exact17-lazy-weighted-cnf-validation-v1",
        "manifest": str(manifest_path.relative_to(REPO)),
        "manifest_sha256": append.sha256(manifest_path),
        "cnf": str(derived_cnf.relative_to(REPO)),
        "cnf_sha256": manifest["cnf_sha256"],
        "base_prefix_byte_exact": True,
        "certificates_exactly_replayed": len(certificate_records),
        "appended_clauses": len(clauses),
        "variables": variables,
        "clauses": derived_clause_count,
        "status": "PASS",
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps(report, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
