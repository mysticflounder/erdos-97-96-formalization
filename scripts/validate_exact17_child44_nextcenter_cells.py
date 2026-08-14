# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Validate the design-only Child44 next-center cell partition.

This validator is deliberately read-only.  It authenticates the cell design
against the already provisioned Child44 DIMACS root and its producer manifest;
it never contacts PIQD, submits a cell, or interprets a solver result.
"""

from __future__ import annotations

import argparse
import base64
import hashlib
import json
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
CELLS_PATH = ROOT / "census/p97_search/exact17_child44_nextcenter_cells_v1.json"
PARENT_PATH = ROOT / (
    "scratch/exact17-lean-to-sat/"
    "exact17-forty-fourth-root-forty-third-model-refinements.cnf"
)
PRODUCER_INTENT_PATH = ROOT / (
    "scratch/exact17-lean-to-sat/piqd-child44-core1-custody-intent.json"
)

SCHEMA = "p97-exact17-child44-nextcenter-cells/v1"
STATUS = "DESIGN_ONLY_NOT_SUBMITTED"
PARENT_SHA256 = "17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9"
PRODUCER_MANIFEST_SHA256 = "152570011046aee180b6d385f731fa13911dc9800bfc393dc87ad386cd031048"
PARENT_VARIABLES = 308
PARENT_CLAUSES = 5_848_820
PARENT_BYTES = 291_704_790
SOLVER_NAME = "piqd-satworker-cadical-3.0.0"
SOLVER_SHA256 = "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965"
PROTOCOL_VERSION = 1
LANE = "sat"
CONFLICT_LIMIT = 3000
NEXT_CENTERS = (0, 1, 2, 3, 4, 5, 6, 7, 12, 13, 14, 15, 16)
OLD_CENTERS = (8, 9, 10, 11)
NEXT_VARS = tuple(290 + label for label in range(17))

TOP_KEYS = {
    "schema",
    "status",
    "evidence_scope",
    "parent",
    "solver",
    "variable_map",
    "identity_fields",
    "coverage",
    "cells",
    "result_contract",
    "first_canary",
}


def strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def load_json(path: Path) -> dict[str, Any]:
    value = json.loads(
        path.read_text(encoding="utf-8"), object_pairs_hook=strict_object
    )
    if not isinstance(value, dict):
        raise TypeError(f"expected JSON object: {path}")
    return value


def _exact_keys(value: object, expected: set[str], label: str) -> dict[str, Any]:
    if not isinstance(value, dict) or set(value) != expected:
        raise ValueError(f"{label} schema drifted")
    return value


def _int(value: object, label: str) -> int:
    if type(value) is not int:
        raise ValueError(f"{label} must be an integer")
    return value


def _str(value: object, label: str) -> str:
    if type(value) is not str:
        raise ValueError(f"{label} must be a string")
    return value


def _bool(value: object, label: str) -> bool:
    if type(value) is not bool:
        raise ValueError(f"{label} must be a boolean")
    return value


def validate_payload(payload: dict[str, Any]) -> None:
    """Validate the exact design contract without touching the parent CNF."""

    _exact_keys(payload, TOP_KEYS, "top-level")
    if payload["schema"] != SCHEMA or payload["status"] != STATUS:
        raise ValueError("design schema/status drifted")
    if payload["evidence_scope"] != (
        "source-total exact-17 finite placement partition; "
        "no cell verdicts or closure claim"
    ):
        raise ValueError("evidence scope drifted")

    parent = _exact_keys(
        payload["parent"],
        {"job_id", "root_sha256", "producer_manifest_sha256", "variables", "clauses", "bytes"},
        "parent",
    )
    if _str(parent["job_id"], "parent.job_id") != "f717c352-2456-412a-ae45-d910f47d3e94":
        raise ValueError("parent job identity drifted")
    if parent["root_sha256"] != PARENT_SHA256:
        raise ValueError("parent root hash drifted")
    if parent["producer_manifest_sha256"] != PRODUCER_MANIFEST_SHA256:
        raise ValueError("parent producer manifest hash drifted")
    if (_int(parent["variables"], "parent.variables"), _int(parent["clauses"], "parent.clauses"), _int(parent["bytes"], "parent.bytes")) != (PARENT_VARIABLES, PARENT_CLAUSES, PARENT_BYTES):
        raise ValueError("parent DIMACS dimensions drifted")

    solver = _exact_keys(
        payload["solver"],
        {"name", "sha256", "protocol_version", "lane", "conflict_limit", "timeout_ms"},
        "solver",
    )
    _str(solver["name"], "solver.name")
    _str(solver["sha256"], "solver.sha256")
    _int(solver["protocol_version"], "solver.protocol_version")
    _str(solver["lane"], "solver.lane")
    _int(solver["conflict_limit"], "solver.conflict_limit")
    if solver != {
        "name": SOLVER_NAME,
        "sha256": SOLVER_SHA256,
        "protocol_version": PROTOCOL_VERSION,
        "lane": LANE,
        "conflict_limit": CONFLICT_LIMIT,
        "timeout_ms": None,
    }:
        raise ValueError("solver/profile contract drifted")

    variable_map = _exact_keys(
        payload["variable_map"],
        {"next_center_formula", "named_order_formula", "named_order_is_not_fixed_by_cell"},
        "variable_map",
    )
    if variable_map != {
        "next_center_formula": "290 + center",
        "named_order_formula": "307 + order",
        "named_order_is_not_fixed_by_cell": True,
    }:
        raise ValueError("variable map drifted")
    _bool(variable_map["named_order_is_not_fixed_by_cell"], "variable map named-order flag")

    if payload["identity_fields"] != [
        "schema",
        "parent.root_sha256",
        "parent.producer_manifest_sha256",
        "cell.id",
        "cell.assumptions",
        "solver.name",
        "solver.sha256",
        "solver.protocol_version",
        "solver.conflict_limit",
    ]:
        raise ValueError("identity field list drifted")

    coverage = _exact_keys(
        payload["coverage"],
        {"legal_next_centers", "excluded_old_centers", "lean_antecedent", "lean_ingress_candidate", "coverage_required_before_promotion"},
        "coverage",
    )
    if coverage != {
        "legal_next_centers": list(NEXT_CENTERS),
        "excluded_old_centers": list(OLD_CENTERS),
        "lean_antecedent": "Problem97.ATailBlockerVExactSeventeenSourceNormalForm.SourceModel.nextCenter_not_old",
        "lean_ingress_candidate": "Problem97.ATailBlockerVExactSeventeenSourceNormalForm.SourceModel.nextCenter_mem_legalNextCenterLabels",
        "coverage_required_before_promotion": True,
    }:
        raise ValueError("coverage contract drifted")
    for label in coverage["legal_next_centers"]:
        _int(label, "coverage legal next center")
    for label in coverage["excluded_old_centers"]:
        _int(label, "coverage excluded old center")
    _bool(coverage["coverage_required_before_promotion"], "coverage promotion flag")

    cells = payload["cells"]
    if type(cells) is not list or len(cells) != len(NEXT_CENTERS):
        raise ValueError("cell count drifted")
    expected_cells = []
    for label in NEXT_CENTERS:
        expected_cells.append(
            {"id": f"next-center-{label:02d}", "next_center": label, "assumptions": [290 + label]}
        )
    for cell in cells:
        if isinstance(cell, dict) and "result" in cell:
            raise ValueError("cell result claims are forbidden")
        cell_value = _exact_keys(cell, {"id", "next_center", "assumptions"}, "cell")
        _str(cell_value["id"], "cell.id")
        _int(cell_value["next_center"], "cell.next_center")
        if type(cell_value["assumptions"]) is not list:
            raise ValueError("cell assumptions must be a list")
        for assumption in cell_value["assumptions"]:
            _int(assumption, "cell assumption")
    if cells != expected_cells:
        raise ValueError("next-center cell mapping drifted")

    result_contract = _exact_keys(
        payload["result_contract"],
        {"sat", "unsat", "unknown", "linearly_infeasible", "kalmanson_feasible"},
        "result_contract",
    )
    expected_contract = {
        "sat": "complete model replay against the authenticated session journal, signed assumptions, raw parent CNF, and source-semantic decoder; then complete exact Kalmanson replay",
        "unsat": "discovery only until static handoff materializes parent plus unit clause and an independent proof replay succeeds",
        "unknown": "cell remains open; receipt must bind deterministic conflict limit and session continuity",
        "linearly_infeasible": "extract and independently replay a minimal positive weighted Kalmanson certificate before any learned clause is admitted",
        "kalmanson_feasible": "retire Kalmanson refinement for that model and route to Euclidean EDM/Ptolemy realizability",
    }
    if result_contract != expected_contract:
        raise ValueError("result contract drifted")

    canary = _exact_keys(
        payload["first_canary"],
        {"session_id", "assumptions", "status", "timeout_ms", "result_sha256", "note"},
        "first_canary",
    )
    if canary != {
        "session_id": "8d9b5463-5ebf-4707-bdc7-3367af9cb530",
        "assumptions": [290, 307],
        "status": "UNKNOWN",
        "timeout_ms": 1_200_000,
        "result_sha256": "f763a1b8406f6d1a48536ce7882683b1ed25af6f0c7ef98bc0e7fc2c680414cc",
        "note": "two-literal plumbing canary only; it is a strict subcell and not one of the thirteen production cells",
    }:
        raise ValueError("first canary metadata drifted")
    _int(canary["timeout_ms"], "first canary timeout")
    if type(canary["assumptions"]) is not list or any(
        type(value) is not int for value in canary["assumptions"]
    ):
        raise ValueError("first canary assumptions are malformed")


def _load_producer_manifest(path: Path, parent_path: Path) -> None:
    intent = load_json(path)
    _exact_keys(
        intent,
        {"attempt_id", "binding", "daemon", "manifest_base64", "manifest_bytes", "phase", "root", "schema", "solver"},
        "producer intent",
    )
    encoded = intent["manifest_base64"]
    if type(encoded) is not str:
        raise ValueError("producer manifest payload is not text")
    try:
        raw = base64.b64decode(encoded, validate=True)
    except (ValueError, base64.binascii.Error) as error:
        raise ValueError("producer manifest payload is malformed") from error
    if _int(intent["manifest_bytes"], "producer manifest bytes") != len(raw):
        raise ValueError("producer manifest byte count drifted")
    if hashlib.sha256(raw).hexdigest() != PRODUCER_MANIFEST_SHA256:
        raise ValueError("producer manifest hash drifted")
    manifest = json.loads(raw.decode("utf-8"), object_pairs_hook=strict_object)
    if not isinstance(manifest, dict):
        raise TypeError("producer manifest is not an object")
    dimacs = _exact_keys(
        manifest.get("dimacs"),
        {"bytes", "checked_new_clauses", "clauses", "parent_prefix_clauses", "path", "sha256", "variables"},
        "producer DIMACS",
    )
    if dimacs != {
        "bytes": PARENT_BYTES,
        "checked_new_clauses": 228,
        "clauses": PARENT_CLAUSES,
        "parent_prefix_clauses": 5_848_592,
        "path": str(parent_path.resolve()),
        "sha256": PARENT_SHA256,
        "variables": PARENT_VARIABLES,
    }:
        raise ValueError("producer DIMACS identity drifted")
    piqd = _exact_keys(manifest.get("piqd"), {
        "backend", "daemon_build_receipt", "daemon_protocol_version", "daemon_sha256", "daemon_source_commit", "immutable_root_only", "ingress", "python_authored_successor_clause_allowed", "solver_name", "solver_profile", "solver_sha256", "solver_signature", "stale_job_reuse_allowed", "unsat_requires_proof_replay",
    }, "producer solver profile")
    if piqd["solver_name"] != SOLVER_NAME or piqd["solver_profile"] != LANE or piqd["solver_sha256"] != SOLVER_SHA256 or piqd["daemon_protocol_version"] != PROTOCOL_VERSION:
        raise ValueError("producer solver identity drifted")


def validate_parent_cnf(path: Path = PARENT_PATH) -> dict[str, Any]:
    if path.resolve() != PARENT_PATH.resolve():
        raise ValueError("parent CNF path drifted")
    digest = hashlib.sha256()
    byte_count = 0
    clause_count = 0
    pure: dict[tuple[int, ...], int] = {}
    expected_header = f"p cnf {PARENT_VARIABLES} {PARENT_CLAUSES}\n".encode("ascii")
    with path.open("rb") as handle:
        header = handle.readline()
        digest.update(header)
        byte_count += len(header)
        if header != expected_header:
            raise ValueError("parent CNF header drifted")
        for raw in handle:
            digest.update(raw)
            byte_count += len(raw)
            if not raw.endswith(b"\n"):
                raise ValueError("parent CNF has unterminated clause")
            try:
                values = tuple(int(token) for token in raw[:-1].split())
            except ValueError as error:
                raise ValueError("parent CNF has non-integer clause text") from error
            if len(values) < 2 or values[-1] != 0 or any(value == 0 or abs(value) > PARENT_VARIABLES for value in values[:-1]):
                raise ValueError("parent CNF clause is malformed")
            clause = values[:-1]
            clause_count += 1
            if clause and all(290 <= abs(value) <= 306 for value in clause):
                pure[clause] = pure.get(clause, 0) + 1
    if (clause_count, byte_count, digest.hexdigest()) != (PARENT_CLAUSES, PARENT_BYTES, PARENT_SHA256):
        raise ValueError("parent CNF identity drifted")
    expected = {tuple(range(290, 307)): 1}
    expected.update({(-left, -right): 1 for left in NEXT_VARS for right in NEXT_VARS if left < right})
    expected.update({(-290 - label,): 1 for label in OLD_CENTERS})
    if pure != expected:
        raise ValueError("next-center clauses drifted")
    return {"path": str(path.resolve()), "sha256": PARENT_SHA256, "variables": PARENT_VARIABLES, "clauses": PARENT_CLAUSES, "bytes": PARENT_BYTES, "pure_nextcenter_clauses": len(pure)}


def validate_design(
    path: Path = CELLS_PATH,
    *,
    parent_path: Path = PARENT_PATH,
    producer_manifest_path: Path = PRODUCER_INTENT_PATH,
) -> dict[str, Any]:
    payload = load_json(path)
    validate_payload(payload)
    if parent_path.resolve() != PARENT_PATH.resolve():
        raise ValueError("parent path is not the authenticated Child44 root")
    _load_producer_manifest(producer_manifest_path, parent_path)
    parent = validate_parent_cnf(parent_path)
    return {"schema": SCHEMA, "status": STATUS, "cells_checked": len(NEXT_CENTERS), "parent": parent}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cells", type=Path, default=CELLS_PATH)
    args = parser.parse_args()
    report = validate_design(args.cells)
    print(json.dumps(report, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
