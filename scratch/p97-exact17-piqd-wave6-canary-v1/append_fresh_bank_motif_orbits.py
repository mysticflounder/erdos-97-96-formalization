#!/usr/bin/env python3
"""Bank the smallest generic two-Kalmanson motif in a missed gate model.

This is the mandatory general-theorem gate for a model that is rejected by the
existing cardinality-generic Lean consumer but missed by the accumulated motif
family.  It independently reconstructs all generic two-Kalmanson motifs from
the source analysis, chooses the smallest point/atom pattern, checks every
dihedral image against the Lean consumer, verifies that the pattern blocks the
fresh model, and appends only novel exact-17 orbit clauses.

The resulting refinement is reusable at arbitrary cardinality as a theorem
pattern, but the emitted clauses are only its exact-17 instances.  This script
does not establish exact-17 coverage or close the production P97 residual.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
import sys
from collections import Counter
from pathlib import Path
from types import ModuleType

REPO = Path(__file__).resolve().parents[2]
ROUND = REPO / "scratch/p97-exact17-piqd-refinement-round3-v1"
COMPILER_SOURCE = ROUND / "compile_accumulated_two_kalmanson_motif_family.py"
EXPORTER_SOURCE = REPO / (
    "scratch/rigid221-blockerv-exact17-20260806/export_source_faithful_boolean_cnf.py"
)
PRODUCER_SOURCE = REPO / "census/atail_force/producer_bank.py"
LEAN_SOURCE = REPO / (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/GenericRowNogoodCertificate.lean"
)
LEAN_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "false_of_twoKalmansonCancellationData_of_check"
)

Motif = tuple[tuple[int, int], ...]
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


def canonical_json(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def clause_bytes(clause: Clause) -> bytes:
    return (" ".join(map(str, clause)) + " 0\n").encode("ascii")


def atomic_json(path: Path, payload: object) -> None:
    temporary = path.with_suffix(path.suffix + ".tmp")
    with temporary.open("w", encoding="utf-8") as handle:
        json.dump(payload, handle, indent=2, sort_keys=True)
        handle.write("\n")
        handle.flush()
        os.fsync(handle.fileno())
    temporary.replace(path)


def point_count(motif: Motif) -> int:
    return 1 + max(label for atom in motif for label in atom)


def model_assignment(path: Path, variables: int) -> dict[int, bool]:
    payload = json.loads(path.read_text())
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


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--root-receipt", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--gate-report", type=Path, required=True)
    parser.add_argument("--output-root", type=Path, required=True)
    parser.add_argument("--fragment", type=Path, required=True)
    parser.add_argument("--receipt", type=Path, required=True)
    parser.add_argument(
        "--witness-only",
        action="store_true",
        help=(
            "append only the chosen motif instances falsified by the fresh model; "
            "the receipt still authenticates the complete generic orbit"
        ),
    )
    parser.add_argument(
        "--complete-model-rows",
        action="store_true",
        help=(
            "enumerate generic motifs from the complete authenticated model rows "
            "instead of the minimized witness for the first bank hit"
        ),
    )
    args = parser.parse_args()

    compiler = load_module("fresh_bank_motif_compiler", COMPILER_SOURCE)
    exporter = load_module("fresh_bank_motif_exporter", EXPORTER_SOURCE)
    producer = load_module("fresh_bank_motif_producer", PRODUCER_SOURCE)

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
    bank_hits = source.get("bank_hits")
    if not isinstance(bank_hits, list):
        raise TypeError("gate report does not expose the static bank-hit list")
    if not bank_hits:
        raise ValueError("gate report has no bank hit to compile")
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
        raise ValueError("invalid exact-17 cyclic order")

    minimized_rows = source.get("minimized_first_bank_rows")
    if args.complete_model_rows or minimized_rows is None:
        row_payloads = source.get("rows")
        row_source = "complete-authenticated-model-rows"
    else:
        row_payloads = minimized_rows
        row_source = "minimized-first-bank-witness"
    if not isinstance(row_payloads, list) or not row_payloads:
        raise ValueError("gate report has no usable selected-row payload")

    rows = tuple(
        producer.MetricRow(
            int(row["center"]),
            tuple(int(point) for point in row["support"]),
            exact=bool(row["exact"]),
        )
        for row in row_payloads
    )
    records = producer.enumerate_two_kalmanson_cancellations(rows, 17, order)
    target_records = [
        record for record in records if record.get("lean_consumer") == LEAN_CONSUMER
    ]
    if not target_records:
        raise RuntimeError("source analysis has no generic two-Kalmanson record")

    occurrences: Counter[Motif] = Counter(
        compiler.cyclic_normal_form(compiler.primitive_atoms(record), order)
        for record in target_records
    )
    motifs = sorted(
        occurrences,
        key=lambda motif: (point_count(motif), len(motif), canonical_json(motif)),
    )
    chosen = motifs[0]
    theorem_check = compiler.check_motif(producer, chosen)
    variables = exporter.selected_variables()
    if len(variables) != 17 * 16 or set(variables.values()) != set(range(1, 273)):
        raise ValueError("unexpected exact-17 selected-row variable map")
    clauses = compiler.motif_clauses(chosen, order, variables)
    if len(clauses) != int(theorem_check["expected_exact17_clause_count"]):
        raise RuntimeError("theorem replay and clause compiler disagree")

    root_variables = int(root_receipt["output_variables"])
    root_clauses = int(root_receipt["output_clauses"])
    model_path = REPO / gate["inputs"]["model"]
    if gate["inputs"]["model_sha256"] != sha256(model_path):
        raise ValueError("gate report model hash mismatch")
    assignment = model_assignment(model_path, root_variables)
    blocking_clauses = tuple(
        clause for clause in clauses if clause_is_false(clause, assignment)
    )
    if not blocking_clauses:
        raise RuntimeError("chosen generic motif does not block the fresh model")

    emitted_clauses = blocking_clauses[:1] if args.witness_only else clauses
    candidate_lines = {clause_bytes(clause) for clause in emitted_clauses}
    novel_lines = set(candidate_lines)
    observed_root_clauses = 0
    with args.root.open("rb") as source_handle:
        expected_header = f"p cnf {root_variables} {root_clauses}\n".encode()
        if source_handle.readline() != expected_header:
            raise ValueError("root DIMACS header mismatch")
        for line in source_handle:
            if not line.startswith(b"c") and line.strip():
                observed_root_clauses += 1
                novel_lines.discard(line)
    if observed_root_clauses != root_clauses:
        raise ValueError("root DIMACS body count mismatch")

    ordered_novel = sorted(novel_lines)
    fragment_tmp = args.fragment.with_suffix(args.fragment.suffix + ".tmp")
    with fragment_tmp.open("wb") as handle:
        for line in ordered_novel:
            handle.write(line)
        handle.flush()
        os.fsync(handle.fileno())
    fragment_tmp.replace(args.fragment)

    output_clauses = root_clauses + len(ordered_novel)
    output_tmp = args.output_root.with_suffix(args.output_root.suffix + ".tmp")
    with args.root.open("rb") as source_handle, output_tmp.open("wb") as target:
        source_handle.readline()
        target.write(f"p cnf {root_variables} {output_clauses}\n".encode())
        for block in iter(lambda: source_handle.read(1 << 20), b""):
            target.write(block)
        for line in ordered_novel:
            target.write(line)
        target.flush()
        os.fsync(target.fileno())
    output_tmp.replace(args.output_root)

    inventory = [
        {
            "motif": [list(atom) for atom in motif],
            "point_count": point_count(motif),
            "atom_count": len(motif),
            "occurrence_count": occurrences[motif],
        }
        for motif in motifs
    ]
    receipt = {
        "schema": "p97-exact17-fresh-bank-motif-orbits/v2",
        "status": (
            "checked-source-backed-witness-instance-refinement"
            if args.witness_only
            else "checked-source-backed-general-theorem-refinement"
        ),
        "warning": (
            "This authenticates a cardinality-generic theorem motif and appends "
            + (
                "only its fresh-model-blocking exact-17 instances; "
                if args.witness_only
                else "all of its exact-17 instances; "
            )
            + "it is not exact-17 coverage or universal P97 closure."
        ),
        "selection_policy": (
            "minimum-(point-count,atom-count,canonical-motif);"
            + ("fresh-model-witnesses-only" if args.witness_only else "full-orbit")
        ),
        "emission_mode": "witness-only" if args.witness_only else "full-orbit",
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
            "row_source": row_source,
            "selected_row_count": len(rows),
        },
        "candidate_inventory": inventory,
        "chosen": {
            **theorem_check,
            "occurrence_count": occurrences[chosen],
            "candidate_clause_count": len(clauses),
            "candidate_clause_sha256": compiler.clauses_digest(clauses),
            "fresh_model_blocking_clause_count": len(blocking_clauses),
            "fresh_model_blocking_clause_sha256": compiler.clauses_digest(
                blocking_clauses
            ),
            "emitted_clause_count": len(emitted_clauses),
            "emitted_clause_sha256": compiler.clauses_digest(emitted_clauses),
        },
        "already_present_clause_count": len(candidate_lines) - len(ordered_novel),
        "novel_clause_count": len(ordered_novel),
        "fragment": str(args.fragment),
        "fragment_sha256": sha256(args.fragment),
        "output_root": str(args.output_root),
        "output_root_sha256": sha256(args.output_root),
        "output_variables": root_variables,
        "output_clauses": output_clauses,
        "source_hashes": {
            str(path.relative_to(REPO)): sha256(path)
            for path in (
                Path(__file__).resolve(),
                COMPILER_SOURCE,
                EXPORTER_SOURCE,
                PRODUCER_SOURCE,
                LEAN_SOURCE,
            )
        },
    }
    atomic_json(args.receipt, receipt)
    print(
        json.dumps(
            {
                "candidate_motifs": len(inventory),
                "chosen_points": point_count(chosen),
                "chosen_atoms": len(chosen),
                "blocking_clauses": len(blocking_clauses),
                "novel_clauses": len(ordered_novel),
                "output_clauses": output_clauses,
                "output_sha256": receipt["output_root_sha256"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
