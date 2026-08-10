#!/usr/bin/env python3
"""Append one authenticated weighted-Kalmanson witness cut to a PIQD root.

The weighted certificate is cardinality-generic mathematics.  This adapter
replays it exactly, verifies that its exact-17 row nogood rejects the supplied
total PIQD model, and appends only that witnessed clause.  It does not claim
exact-17 coverage or universal P97 closure.
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
EXPORTER_SOURCE = REPO / (
    "scratch/rigid221-blockerv-exact17-20260806/export_source_faithful_boolean_cnf.py"
)
PRODUCER_SOURCE = REPO / "census/atail_force/producer_bank.py"
LEAN_SOURCE = REPO / (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/GenericRowNogoodCertificate.lean"
)
LEAN_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "false_of_weightedKalmansonCancellationData_of_check"
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


def total_assignment(path: Path, variables: int) -> dict[int, bool]:
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
    parser.add_argument("--analysis", type=Path, required=True)
    parser.add_argument("--certificate", type=Path, required=True)
    parser.add_argument("--output-root", type=Path, required=True)
    parser.add_argument("--fragment", type=Path, required=True)
    parser.add_argument("--receipt", type=Path, required=True)
    args = parser.parse_args()

    exporter = load_module("weighted_witness_exporter", EXPORTER_SOURCE)
    manifest = json.loads(args.manifest.read_text())
    root_receipt = json.loads(args.root_receipt.read_text())
    gate = json.loads(args.gate_report.read_text())
    analysis = json.loads(args.analysis.read_text())
    certificate = json.loads(args.certificate.read_text())

    if gate.get("schema") != "p97-exact17-piqd-postwave-family-gate/v2":
        raise ValueError("unexpected theorem-gate schema")
    if gate.get("status") != "fresh-model-missed-by-accumulated-family":
        raise ValueError("gate did not stop on an accumulated-family miss")

    root_hash = sha256(args.root)
    if gate["inputs"]["cnf_sha256"] != root_hash:
        raise ValueError("gate report does not bind the input root")
    if root_receipt["output_root_sha256"] != root_hash:
        raise ValueError("root receipt does not bind the input root")
    if gate["inputs"]["root_receipt_sha256"] != sha256(args.root_receipt):
        raise ValueError("gate report does not bind the root receipt")
    if gate["inputs"]["manifest_sha256"] != sha256(args.manifest):
        raise ValueError("gate report does not bind the source manifest")

    root_variables = int(root_receipt["output_variables"])
    root_clauses = int(root_receipt["output_clauses"])
    order = tuple(int(value) for value in manifest["cyclic_order"])
    if order != tuple(int(value) for value in gate["source_analysis"]["order"]):
        raise ValueError("gate source order and manifest order disagree")
    if order != tuple(int(value) for value in analysis["order"]):
        raise ValueError("weighted analysis and manifest order disagree")
    if analysis.get("linear_status") != "unsat":
        raise ValueError("weighted analysis is not exact-linearly UNSAT")
    required_analysis_checks = (
        analysis.get("cnf_assignment_verified") is True,
        analysis.get("source_independent_model_checker_verified") is True,
        analysis.get("source_z3_assignment_verified") is True,
        analysis.get("static_bank_assignment_verified_via_direct_cnf") is True,
        analysis.get("variables") == root_variables,
        analysis.get("clauses") == root_clauses,
        (REPO / analysis["cnf"]).resolve() == args.root.resolve(),
    )
    if not all(required_analysis_checks):
        raise ValueError("weighted analysis lacks a required source check")

    if certificate.get("verdict") != "unsat":
        raise ValueError("weighted certificate is not UNSAT")
    if tuple(certificate.get("order", ())) != order:
        raise ValueError("weighted certificate order disagrees with the manifest")
    if Path(certificate["source_report"]).resolve() != args.analysis.resolve():
        raise ValueError("weighted certificate does not name the supplied analysis")
    if certificate.get("rows") != analysis.get("linear_core_rows"):
        raise ValueError("weighted certificate rows differ from the extracted core")
    recorded_consumer = certificate.get("weighted_certificate", {}).get("lean_consumer")
    if recorded_consumer != LEAN_CONSUMER:
        raise ValueError("weighted certificate names the wrong Lean consumer")

    payload = exporter.read_weighted_certificate(args.certificate.resolve(), 0, (0, 1))
    clauses, equality_clauses, kinds = exporter.learned_clauses(
        [payload], exporter.selected_variables(), order, 120_000, replay=True
    )
    if equality_clauses or kinds != {"weighted-kalmanson": 1}:
        raise RuntimeError("weighted certificate replay emitted unexpected records")
    if len(clauses) != 1:
        raise RuntimeError("one weighted certificate did not emit exactly one nogood")

    model_path = REPO / gate["inputs"]["model"]
    if gate["inputs"]["model_sha256"] != sha256(model_path):
        raise ValueError("gate report model hash mismatch")
    assignment = total_assignment(model_path, root_variables)
    clause = clauses[0]
    if not clause_is_false(clause, assignment):
        raise RuntimeError("weighted nogood does not reject the fresh model")

    line = clause_bytes(clause)
    observed_root_clauses = 0
    already_present = False
    with args.root.open("rb") as source_handle:
        expected_header = f"p cnf {root_variables} {root_clauses}\n".encode()
        if source_handle.readline() != expected_header:
            raise ValueError("root DIMACS header mismatch")
        for existing in source_handle:
            if not existing.startswith(b"c") and existing.strip():
                observed_root_clauses += 1
                already_present = already_present or existing == line
    if observed_root_clauses != root_clauses:
        raise ValueError("root DIMACS body count mismatch")
    if already_present:
        raise RuntimeError("weighted witness clause is already present in the root")

    args.fragment.parent.mkdir(parents=True, exist_ok=True)
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

    receipt = {
        "schema": "p97-exact17-weighted-kalmanson-witness/v1",
        "status": "checked-source-backed-witness-instance-refinement",
        "warning": (
            "This authenticates a cardinality-generic weighted-Kalmanson theorem "
            "and appends one fresh-model-blocking exact-17 instance; it is not "
            "exact-17 coverage or universal P97 closure."
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
            "analysis": str(args.analysis),
            "analysis_sha256": sha256(args.analysis),
            "certificate": str(args.certificate),
            "certificate_sha256": sha256(args.certificate),
            "model": str(model_path.relative_to(REPO)),
            "model_sha256": sha256(model_path),
        },
        "source_checks": {
            "total_model": True,
            "cnf_assignment_verified": True,
            "source_independent_model_checker_verified": True,
            "source_z3_assignment_verified": True,
            "static_bank_assignment_verified_via_direct_cnf": True,
            "exact_weighted_certificate_replayed": True,
            "fresh_model_rejected": True,
        },
        "certificate_summary": {
            "rows": len(certificate["rows"]),
            "weighted_terms": len(certificate["weighted_terms"]),
            "weight_sum": sum(
                int(term["weight"]) for term in certificate["weighted_terms"]
            ),
            "weight_max": max(
                int(term["weight"]) for term in certificate["weighted_terms"]
            ),
        },
        "fragment": str(args.fragment),
        "fragment_sha256": sha256(args.fragment),
        "emitted_clause": list(clause),
        "output_root": str(args.output_root),
        "output_root_sha256": sha256(args.output_root),
        "output_variables": root_variables,
        "output_clauses": output_clauses,
        "source_hashes": {
            str(path.relative_to(REPO)): sha256(path)
            for path in (
                Path(__file__).resolve(),
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
                "appended_clauses": 1,
                "certificate_rows": len(certificate["rows"]),
                "weighted_terms": len(certificate["weighted_terms"]),
                "output_clauses": output_clauses,
                "output_sha256": receipt["output_root_sha256"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
