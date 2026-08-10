#!/usr/bin/env python3
"""Append one exact-17 instance of the cardinality-generic sparse six-point cut.

The Lean consumer needs six increasingly ordered boundary points.  The selected
row at positions 0 and 2 contains respectively positions (1,3,5) and (1,3,4).
This script recognizes that source-level pattern in a fully authenticated model
and appends the negation of its six incidence atoms.  It proves neither exact-17
coverage nor the universal P97 residual.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import os
import sys
from collections import Counter
from pathlib import Path
from types import ModuleType

REPO = Path(__file__).resolve().parents[2]
EXPORTER_SOURCE = REPO / (
    "scratch/rigid221-blockerv-exact17-20260806/export_source_faithful_boolean_cnf.py"
)
LEAN_SOURCE = REPO / (
    "lean/Erdos9796Proof/P97/ATail/SixPointSparseEuclideanObstruction.lean"
)
LEAN_CONSUMER = (
    "Problem97.SixPointSparseEuclideanObstruction."
    "false_of_six_ccw_two_selected_rows"
)
Clause = tuple[int, ...]


def load_module(name: str, path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def atomic_json(path: Path, payload: object) -> None:
    temporary = path.with_suffix(path.suffix + ".tmp")
    with temporary.open("w", encoding="utf-8") as handle:
        json.dump(payload, handle, indent=2, sort_keys=True)
        handle.write("\n")
        handle.flush()
        os.fsync(handle.fileno())
    temporary.replace(path)


def model_assignment(path: Path, variables: int) -> dict[int, bool]:
    payload = json.loads(path.read_text())
    if int(payload["vars"]) != variables:
        raise ValueError("model variable count does not match the root")
    literals = tuple(int(value) for value in payload["model"])
    counts = Counter(abs(value) for value in literals)
    if (
        any(value == 0 or abs(value) > variables for value in literals)
        or set(counts) != set(range(1, variables + 1))
        or set(counts.values()) != {1}
    ):
        raise ValueError("model is not a total one-literal-per-variable assignment")
    return {abs(value): value > 0 for value in literals}


def clause_is_false(clause: Clause, assignment: dict[int, bool]) -> bool:
    return all(assignment[abs(literal)] == (literal < 0) for literal in clause)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--root-receipt", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--gate-report", type=Path, required=True)
    parser.add_argument("--output-root", type=Path, required=True)
    parser.add_argument("--fragment", type=Path, required=True)
    parser.add_argument("--receipt", type=Path, required=True)
    args = parser.parse_args()

    exporter = load_module("sparse_six_point_exporter", EXPORTER_SOURCE)
    manifest = json.loads(args.manifest.read_text())
    root_receipt = json.loads(args.root_receipt.read_text())
    gate = json.loads(args.gate_report.read_text())
    if gate.get("schema") != "p97-exact17-piqd-postwave-family-gate/v2":
        raise ValueError("unexpected theorem-gate schema")
    if gate.get("status") not in {
        "fresh-model-missed-by-accumulated-family",
        "fresh-model-hit-by-accumulated-family",
    }:
        raise ValueError("gate did not classify the accumulated family")

    root_hash = sha256(args.root)
    if gate["inputs"]["cnf_sha256"] != root_hash:
        raise ValueError("gate report does not bind the input root")
    if root_receipt["output_root_sha256"] != root_hash:
        raise ValueError("root receipt does not bind the input root")
    if gate["inputs"]["root_receipt_sha256"] != sha256(args.root_receipt):
        raise ValueError("gate report does not bind the root receipt")
    if gate["inputs"]["manifest_sha256"] != sha256(args.manifest):
        raise ValueError("gate report does not bind the source manifest")

    source = gate["source_analysis"]
    required_checks = (
        gate.get("piqd_model_total") is True,
        gate.get("cnf_assignment_verified") is True,
        source.get("source_independent_model_checker_verified") is True,
        source.get("source_z3_assignment_verified") is True,
        source.get("static_bank_assignment_verified_via_direct_cnf") is True,
        source.get("linear_status") == "unsat",
    )
    if not all(required_checks):
        raise ValueError("gate report lacks a required source check")

    order = tuple(int(value) for value in manifest["cyclic_order"])
    if order != tuple(int(value) for value in source["order"]):
        raise ValueError("source analysis and manifest cyclic orders disagree")
    if len(order) != 17 or set(order) != set(range(17)):
        raise ValueError("invalid exact-17 cyclic order")

    rows = {
        int(row["center"]): frozenset(int(point) for point in row["support"])
        for row in source["rows"]
    }
    if set(rows) != set(range(17)) or any(len(support) != 4 for support in rows.values()):
        raise ValueError("gate report does not contain one selected four-row per center")

    occurrences: list[tuple[int, int, int, int, int, int]] = []
    for points in itertools.combinations(order, 6):
        i0, i1, i2, i3, i4, i5 = points
        if {i1, i3, i5} <= rows[i0] and {i1, i3, i4} <= rows[i2]:
            occurrences.append(points)
    if not occurrences:
        raise RuntimeError("model has no increasing sparse six-point two-row pattern")
    chosen = min(occurrences)
    i0, i1, i2, i3, i4, i5 = chosen
    atoms = (
        (i0, i1),
        (i0, i3),
        (i0, i5),
        (i2, i1),
        (i2, i3),
        (i2, i4),
    )

    selected_variables = exporter.selected_variables()
    if len(selected_variables) != 17 * 16 or set(selected_variables.values()) != set(range(1, 273)):
        raise ValueError("unexpected exact-17 selected-row variable map")
    clause = tuple(sorted(-selected_variables[atom] for atom in atoms))

    root_variables = int(root_receipt["output_variables"])
    root_clauses = int(root_receipt["output_clauses"])
    model_path = REPO / gate["inputs"]["model"]
    if gate["inputs"]["model_sha256"] != sha256(model_path):
        raise ValueError("gate report model hash mismatch")
    assignment = model_assignment(model_path, root_variables)
    if not clause_is_false(clause, assignment):
        raise RuntimeError("sparse six-point clause does not block the fresh model")

    line = (" ".join(map(str, clause)) + " 0\n").encode("ascii")
    observed = 0
    novel = True
    with args.root.open("rb") as source_handle:
        expected_header = f"p cnf {root_variables} {root_clauses}\n".encode()
        if source_handle.readline() != expected_header:
            raise ValueError("root DIMACS header mismatch")
        for existing in source_handle:
            if not existing.startswith(b"c") and existing.strip():
                observed += 1
                novel = novel and existing != line
    if observed != root_clauses:
        raise ValueError("root DIMACS body count mismatch")
    if not novel:
        raise RuntimeError("sparse six-point clause is already present")

    fragment_tmp = args.fragment.with_suffix(args.fragment.suffix + ".tmp")
    with fragment_tmp.open("wb") as handle:
        handle.write(line)
        handle.flush()
        os.fsync(handle.fileno())
    fragment_tmp.replace(args.fragment)

    output_clauses = root_clauses + 1
    output_tmp = args.output_root.with_suffix(args.output_root.suffix + ".tmp")
    with args.root.open("rb") as source_handle, output_tmp.open("wb") as target:
        source_handle.readline()
        target.write(f"p cnf {root_variables} {output_clauses}\n".encode())
        for block in iter(lambda: source_handle.read(1 << 20), b""):
            target.write(block)
        target.write(line)
        target.flush()
        os.fsync(target.fileno())
    output_tmp.replace(args.output_root)

    lean_text = LEAN_SOURCE.read_text()
    if "theorem false_of_six_ccw_two_selected_rows" not in lean_text:
        raise RuntimeError("expected Lean consumer is absent")
    receipt = {
        "schema": "p97-exact17-sparse-six-point-two-row-witness/v1",
        "status": "checked-source-backed-witness-instance-refinement",
        "warning": (
            "This appends one exact-17 instance of a cardinality-generic Lean "
            "theorem; it is not exact-17 coverage or universal P97 closure."
        ),
        "lean_consumer": LEAN_CONSUMER,
        "inputs": {
            "root": str(args.root),
            "root_sha256": root_hash,
            "root_receipt": str(args.root_receipt),
            "root_receipt_sha256": sha256(args.root_receipt),
            "manifest": str(args.manifest),
            "manifest_sha256": sha256(args.manifest),
            "gate_report": str(args.gate_report),
            "gate_report_sha256": sha256(args.gate_report),
            "model": str(model_path.relative_to(REPO)),
            "model_sha256": sha256(model_path),
        },
        "source_checks": {
            "piqd_model_total": True,
            "cnf_assignment_verified": True,
            "source_independent_model_checker_verified": True,
            "source_z3_assignment_verified": True,
            "static_bank_assignment_verified_via_direct_cnf": True,
            "linear_status": "unsat",
            "selected_row_count": len(rows),
        },
        "pattern": {
            "increasing_occurrence_count": len(occurrences),
            "chosen_points": list(chosen),
            "required_atoms": [list(atom) for atom in atoms],
            "clause": list(clause),
        },
        "fragment": str(args.fragment),
        "fragment_sha256": sha256(args.fragment),
        "output_root": str(args.output_root),
        "output_root_sha256": sha256(args.output_root),
        "output_variables": root_variables,
        "output_clauses": output_clauses,
        "source_hashes": {
            str(path.relative_to(REPO)): sha256(path)
            for path in (Path(__file__).resolve(), EXPORTER_SOURCE, LEAN_SOURCE)
        },
    }
    atomic_json(args.receipt, receipt)
    print(json.dumps({
        "chosen_points": list(chosen),
        "clause": list(clause),
        "occurrences": len(occurrences),
        "output_clauses": output_clauses,
        "output_sha256": receipt["output_root_sha256"],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
