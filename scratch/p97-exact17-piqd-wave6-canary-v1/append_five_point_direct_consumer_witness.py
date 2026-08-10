#!/usr/bin/env python3
"""Append one authenticated exact-17 instance of a direct five-point theorem.

The cardinality-generic Lean consumer says that five increasing boundary
vertices ``a < b < c < d < e`` are impossible when the selected row at ``b``
contains ``a,e`` and the selected row at ``c`` contains ``a,b,d``.  This
script reconstructs those antecedents from the authenticated PIQD gate model,
checks the exact selected-row variable map, and appends one violated instance.

The emitted clause is only a lazy exact-17 refinement.  It is neither
exact-17 coverage nor a universal P97 closure.
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
    "scratch/rigid221-blockerv-exact17-20260806/"
    "export_source_faithful_boolean_cnf.py"
)
LEAN_SOURCE = REPO / (
    "lean/Erdos9796Proof/P97/ATail/FivePointEuclideanObstruction.lean"
)
LEAN_CONSUMER = (
    "Problem97.FivePointEuclideanObstruction."
    "false_of_five_ccw_two_selected_rows"
)

Atom = tuple[int, int]
Clause = tuple[int, ...]
Occurrence = tuple[tuple[int, int, int, int, int], tuple[Atom, ...]]


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
    payload = json.loads(path.read_text(encoding="utf-8"))
    if int(payload["vars"]) != variables:
        raise ValueError("model variable count does not match the root")
    literals = tuple(int(value) for value in payload["model"])
    if any(value == 0 or abs(value) > variables for value in literals):
        raise ValueError("model contains an invalid literal")
    counts = Counter(abs(value) for value in literals)
    if set(counts) != set(range(1, variables + 1)) or set(counts.values()) != {1}:
        raise ValueError("model is not a total one-literal-per-variable assignment")
    return {abs(value): value > 0 for value in literals}


def clause_is_false(clause: Clause, assignment: dict[int, bool]) -> bool:
    return all(assignment[abs(literal)] == (literal < 0) for literal in clause)


def find_occurrences(
    order: tuple[int, ...], rows: dict[int, frozenset[int]]
) -> tuple[Occurrence, ...]:
    found: list[Occurrence] = []
    for a, b, c, d, e in itertools.combinations(order, 5):
        atoms = ((b, a), (b, e), (c, a), (c, b), (c, d))
        if all(point in rows[center] for center, point in atoms):
            found.append(((a, b, c, d, e), atoms))
    return tuple(found)


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

    exporter = load_module("exact17_direct_exporter", EXPORTER_SOURCE)
    gate = json.loads(args.gate_report.read_text(encoding="utf-8"))
    root_receipt = json.loads(args.root_receipt.read_text(encoding="utf-8"))
    manifest = json.loads(args.manifest.read_text(encoding="utf-8"))

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
    bank_hits = source.get("bank_hits")
    if not isinstance(bank_hits, list):
        raise TypeError("gate report does not expose the static bank-hit list")
    bank_replay_ok = not bank_hits or source.get("first_bank_hit_replayed") is True
    required_checks = (
        gate.get("piqd_model_total") is True,
        gate.get("cnf_assignment_verified") is True,
        source.get("source_independent_model_checker_verified") is True,
        source.get("source_z3_assignment_verified") is True,
        source.get("static_bank_assignment_verified_via_direct_cnf") is True,
        source.get("linear_status") == "unsat",
        bank_replay_ok,
        source.get("unreplayed_bank_hit_proposals") == [],
    )
    if not all(required_checks):
        raise ValueError("gate report lacks a required source or theorem check")

    order = tuple(int(value) for value in manifest["cyclic_order"])
    if order != tuple(int(value) for value in source["order"]):
        raise ValueError("source analysis and manifest cyclic orders disagree")
    if len(order) != 17 or set(order) != set(range(17)):
        raise ValueError("invalid exact-17 increasing boundary order")

    row_payloads = source.get("rows")
    if not isinstance(row_payloads, list) or len(row_payloads) != 17:
        raise ValueError("gate report does not expose all seventeen selected rows")
    rows: dict[int, frozenset[int]] = {}
    for row in row_payloads:
        center = int(row["center"])
        support = frozenset(int(point) for point in row["support"])
        if center in rows or len(support) != 4 or center in support:
            raise ValueError("malformed selected four-point row")
        rows[center] = support
    if set(rows) != set(range(17)):
        raise ValueError("selected rows do not cover every exact-17 center")

    occurrences = find_occurrences(order, rows)
    if not occurrences:
        raise RuntimeError("fresh model has no direct five-point theorem occurrence")

    variables = exporter.selected_variables()
    if len(variables) != 17 * 16 or set(variables.values()) != set(range(1, 273)):
        raise ValueError("unexpected exact-17 selected-row variable map")
    root_variables = int(root_receipt["output_variables"])
    root_clauses = int(root_receipt["output_clauses"])
    model_path = REPO / gate["inputs"]["model"]
    if gate["inputs"]["model_sha256"] != sha256(model_path):
        raise ValueError("gate report model hash mismatch")
    assignment = model_assignment(model_path, root_variables)

    candidates: list[tuple[Occurrence, Clause]] = []
    for occurrence in occurrences:
        clause = tuple(-variables[atom] for atom in occurrence[1])
        if clause_is_false(clause, assignment):
            candidates.append((occurrence, clause))
    if not candidates:
        raise RuntimeError("direct theorem occurrences do not block the fresh model")
    chosen, chosen_clause = min(candidates, key=lambda item: (item[0][0], item[1]))

    chosen_normalized = tuple(sorted(chosen_clause))
    chosen_present = False
    observed_root_clauses = 0
    with args.root.open("rb") as source_handle:
        expected_header = f"p cnf {root_variables} {root_clauses}\n".encode()
        if source_handle.readline() != expected_header:
            raise ValueError("root DIMACS header mismatch")
        for line in source_handle:
            if line.startswith(b"c") or not line.strip():
                continue
            observed_root_clauses += 1
            literals = tuple(int(token) for token in line.split())
            if not literals or literals[-1] != 0:
                raise ValueError("malformed DIMACS clause")
            if tuple(sorted(literals[:-1])) == chosen_normalized:
                chosen_present = True
    if observed_root_clauses != root_clauses:
        raise ValueError("root DIMACS body count mismatch")
    if chosen_present:
        raise RuntimeError("chosen direct theorem clause is already present")

    clause_line = (" ".join(map(str, chosen_clause)) + " 0\n").encode("ascii")
    fragment_tmp = args.fragment.with_suffix(args.fragment.suffix + ".tmp")
    with fragment_tmp.open("wb") as handle:
        handle.write(clause_line)
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
        target.write(clause_line)
        target.flush()
        os.fsync(target.fileno())
    output_tmp.replace(args.output_root)

    occurrence_payloads = [
        {
            "points": list(points),
            "atoms": [list(atom) for atom in atoms],
            "clause": [-variables[atom] for atom in atoms],
        }
        for points, atoms in occurrences
    ]
    receipt = {
        "schema": "p97-exact17-five-point-direct-consumer-witness/v1",
        "status": "checked-source-backed-witness-instance-refinement",
        "warning": (
            "This appends one exact-17 instance of a cardinality-generic Lean "
            "consumer; it is not exact-17 coverage or universal P97 closure."
        ),
        "selection_policy": "lexicographically-first-violated-anchored-occurrence",
        "emission_mode": "one-fresh-model-witness",
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
            "static_bank_hit_count": len(bank_hits),
            "first_bank_hit_replayed": source.get("first_bank_hit_replayed"),
            "bank_replay_required": bool(bank_hits),
            "bank_replay_ok": bank_replay_ok,
            "row_source": "complete-authenticated-model-rows",
            "selected_row_count": len(rows),
        },
        "candidate_inventory": occurrence_payloads,
        "chosen": {
            "points": list(chosen[0]),
            "atoms": [list(atom) for atom in chosen[1]],
            "clause": list(chosen_clause),
            "clause_length": len(chosen_clause),
            "fresh_model_blocking": True,
            "previously_present": False,
        },
        "novel_clause_count": 1,
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
    print(
        json.dumps(
            {
                "occurrences": len(occurrences),
                "chosen_points": list(chosen[0]),
                "chosen_clause": list(chosen_clause),
                "output_clauses": output_clauses,
                "output_sha256": receipt["output_root_sha256"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
