#!/usr/bin/env python3
"""Append every exact dihedral image of weighted-Kalmanson certificates."""

from __future__ import annotations

import argparse
from collections import Counter
import importlib.util
import json
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
SOURCE_FILES = (
    Path(__file__).resolve(),
    HERE / "append_weighted_kalmanson_cuts.py",
    HERE / "export_source_faithful_boolean_cnf.py",
    HERE / "exact17_source_faithful_cegar.py",
    HERE / "exact17_fullcover_cegar.py",
    HERE / "exact17_kalmanson.py",
    HERE / "export_exact17_boolean_cnf.py",
    HERE / "exact17_two_rows_shared_late_pair.py",
    HERE / "exact17_committed_direct_row_consumers.py",
    REPO / "census/atail_force/producer_bank.py",
    REPO / "lean/Erdos9796Proof/P97/ATail/KalmansonFourEqualitySchemas.lean",
)


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


base_append = load_module(
    "exact17_dihedral_base_append", HERE / "append_weighted_kalmanson_cuts.py"
)
export = base_append.export
producer_bank = export.legacy.producer_bank


def source_hashes() -> dict[str, str]:
    return {
        str(path.relative_to(REPO)): base_append.sha256(path)
        for path in SOURCE_FILES
    }


def require_source_freeze(expected: dict[str, str]) -> None:
    if source_hashes() != expected:
        raise RuntimeError("dihedral appender source changed during generation")


def edge(left: int, right: int) -> tuple[int, int]:
    return (left, right) if left < right else (right, left)


def edge_multiset(
    pairs: tuple[tuple[int, int], tuple[int, int]],
) -> Counter[tuple[int, int]]:
    return Counter(edge(*pair) for pair in pairs)


def mapped_term(
    term: dict[str, Any], mapping: dict[int, int], position: dict[int, int]
) -> dict[str, Any]:
    original_quad = tuple(int(label) for label in term["quad"])
    original_left, original_right = producer_bank._kalmanson_edges(
        original_quad, str(term["form"])
    )
    image_left = Counter(edge(mapping[a], mapping[b]) for a, b in original_left)
    image_right = Counter(edge(mapping[a], mapping[b]) for a, b in original_right)
    image_quad = tuple(
        sorted((mapping[label] for label in original_quad), key=position.get)
    )
    forms = []
    for form in ("adjacentSides", "innerOuter"):
        left, right = producer_bank._kalmanson_edges(image_quad, form)
        if edge_multiset(left) == image_left and edge_multiset(right) == image_right:
            forms.append(form)
    if len(forms) != 1:
        raise ValueError(f"dihedral term image has {len(forms)} forms")
    return {"quad": list(image_quad), "form": forms[0], "weight": int(term["weight"])}


def certificate_orbit_clauses(
    path: Path,
    order: tuple[int, ...],
    variables: dict[tuple[int, int], int],
) -> set[tuple[int, ...]]:
    payload = json.loads(path.read_text())
    if tuple(int(label) for label in payload["order"]) != order:
        raise ValueError(f"cyclic-order mismatch: {path}")
    rows_payload = payload["rows"]
    terms = payload.get("weighted_terms")
    if terms is None:
        terms = payload["weighted_certificate"]["core"]["terms"]
    source_rows = export.legacy.rows_from_payload(rows_payload)
    source_record = producer_bank.certify_weighted_kalmanson_cancellation(
        source_rows, len(order), order, terms
    )
    if source_record != payload["weighted_certificate"]:
        raise ValueError(f"source certificate drift: {path}")

    position = {label: index for index, label in enumerate(order)}
    clauses: set[tuple[int, ...]] = set()
    for orientation in (1, -1):
        for shift in range(len(order)):
            mapping = {
                order[index]: order[(shift + orientation * index) % len(order)]
                for index in range(len(order))
            }
            image_payload = [
                {
                    "center": mapping[int(row["center"])],
                    "support": sorted(mapping[int(point)] for point in row["support"]),
                    "exact": bool(row.get("exact", False)),
                }
                for row in rows_payload
            ]
            image_rows = export.legacy.rows_from_payload(image_payload)
            image_terms = [mapped_term(term, mapping, position) for term in terms]
            producer_bank.certify_weighted_kalmanson_cancellation(
                image_rows, len(order), order, image_terms
            )
            clauses.add(
                tuple(
                    sorted(
                        {
                            -variables[row.center, point]
                            for row in image_rows
                            for point in row.support
                        }
                    )
                )
            )
    if not clauses:
        raise ValueError(f"empty dihedral orbit: {path}")
    return clauses


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base-manifest", type=Path, required=True)
    parser.add_argument("--weighted-certificate", type=Path, action="append", required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    args = parser.parse_args()

    base_manifest_path = args.base_manifest.resolve()
    frozen_sources = source_hashes()
    base_manifest = json.loads(base_manifest_path.read_text())
    if base_manifest.get("learned_replay") != "verified":
        raise ValueError("base CNF did not replay its learned certificates")
    order_index = int(base_manifest["order_index"])
    positions = tuple(int(value) for value in base_manifest["anonymous_positions"])
    order = export.source.normalized_order(order_index, positions)
    if tuple(base_manifest.get("order", ())) != order:
        raise ValueError("base manifest has inconsistent cyclic order")
    base_cnf = base_append.resolve_repo_path(base_manifest["cnf"])
    base_cnf_sha = base_append.sha256(base_cnf)
    if base_cnf_sha != base_manifest.get("cnf_sha256"):
        raise ValueError("base CNF hash mismatch")
    variables, base_clause_count = base_append.dimacs_header(base_cnf)
    if variables != base_manifest.get("variables") or base_clause_count != base_manifest.get("clauses"):
        raise ValueError("base DIMACS header disagrees with manifest")

    selected_variables = export.selected_variables()
    clauses: set[tuple[int, ...]] = set()
    certificate_records = []
    for certificate in args.weighted_certificate:
        path = certificate.resolve()
        orbit = certificate_orbit_clauses(path, order, selected_variables)
        clauses.update(orbit)
        certificate_records.append(
            {
                "path": str(path.relative_to(REPO)),
                "sha256": base_append.sha256(path),
                "unique_orbit_clauses": len(orbit),
            }
        )
    ordered_clauses = sorted(clauses)
    if not ordered_clauses:
        raise ValueError("no dihedral weighted-Kalmanson clauses were produced")
    require_source_freeze(frozen_sources)

    output = args.output.resolve()
    cnf_sha = base_append.write_derived_cnf(
        base_cnf, output, variables, base_clause_count, ordered_clauses
    )
    manifest = dict(base_manifest)
    manifest.update(
        {
            "schema": "p97-rigid221-exact17-weighted-dihedral-cnf-v1",
            "cnf": str(output.relative_to(REPO)),
            "cnf_sha256": cnf_sha,
            "clauses": base_clause_count + len(ordered_clauses),
            "dihedral_weighted_base": {
                "manifest": str(base_manifest_path.relative_to(REPO)),
                "manifest_sha256": base_append.sha256(base_manifest_path),
                "cnf": str(base_cnf.relative_to(REPO)),
                "cnf_sha256": base_cnf_sha,
                "clauses": base_clause_count,
            },
            "dihedral_weighted_certificates": certificate_records,
            "dihedral_weighted_clauses": [list(clause) for clause in ordered_clauses],
            "dihedral_checked_images": 2 * len(order) * len(certificate_records),
            "dihedral_generation_source_hashes": frozen_sources,
        }
    )
    blocks = dict(base_manifest.get("clause_blocks", {}))
    blocks["learned_nogoods"] = int(blocks.get("learned_nogoods", 0)) + len(ordered_clauses)
    blocks["weighted_kalmanson_dihedral"] = len(ordered_clauses)
    manifest["clause_blocks"] = blocks
    kinds = dict(base_manifest.get("learned_record_kinds", {}))
    kinds["weighted-kalmanson-dihedral-images"] = len(ordered_clauses)
    manifest["learned_record_kinds"] = kinds
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "appended_clauses": len(ordered_clauses),
                "base_clauses": base_clause_count,
                "certificates": len(certificate_records),
                "checked_images": manifest["dihedral_checked_images"],
                "clauses": manifest["clauses"],
                "cnf_sha256": cnf_sha,
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
