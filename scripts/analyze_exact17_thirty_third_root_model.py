"""Authenticate, replay, and inventory the exact-17 child-33 SAT model.

This is a post-wave diagnostic only.  The child-33 custody response is bound
to the immutable export, manifest, job, terminal epoch, model/log bytes, and
the complete DIMACS replay before the existing Lean theorem-bank scanner is
called.  No clauses are emitted or promoted here.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Any

REPO = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(REPO))

from census.atail_force import producer_bank

CNF_SHA256 = "775eb42db7bdac52eb7e5609a1cf33111c953d26f4cee9c8d95bde3b468563b9"
MANIFEST_SHA256 = "1f802e69fc382ba262cb54a9b21bee3b62b4c53cf6cbfaff837181cd9444fcfd"
FINAL_SHA256 = "4941ae6dddef71a9276c6cdbc7cc6026f46b5122bf6848c5620b6538cd745356"
MODEL_SHA256 = "d625b8df54a163c95a8402e36541d30b6c8218aa869ee90d9507a42557a43710"
MODEL_RESPONSE_SHA256 = "38129e0526b361cd346a2d7ea11f2a70aead4d8abebb994d21f776c4a62f89a3"
LOG_SHA256 = "eb4ba5f1c9d4170b484cf15de1b3c78c9a5d9b389ce2a888fe0d688bd9764a57"
JOB_ID = "6304e936-8ef3-4b92-a153-062263a4aa01"
IDENTITY_HASH = "031ddc62b4d41ef0cfc1767cc43f4be2d9a9a7d0cf85784d72c9bfa5eb9c367f"
DAEMON_SHA256 = "680764249cbeb9ca4b8478ffb26e517c7427adddb1114a2ca6c46a3a88038dec"
VARIABLE_COUNT = 308
CLAUSE_COUNT = 5_847_248
POINT_COUNT = 17

ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)

FINAL_KEYS = {
    "binding", "completion_status", "daemon", "deciding_daemon_sha256",
    "job_id", "model_check", "model_replay", "model_sha256", "next_gate",
    "result", "schema", "solver", "solver_log", "stored_final",
}
MODEL_KEYS = {"cnf_sha256", "completion_identity_hash", "job_id", "manifest_sha256", "model", "replay", "schema"}
INNER_MODEL_KEYS = {"assignment", "backend", "job_id", "num_assigned", "result", "solver_profile"}


@dataclass(frozen=True)
class Binding:
    cnf_sha256: str = CNF_SHA256
    manifest_sha256: str = MANIFEST_SHA256
    final_sha256: str = FINAL_SHA256
    model_sha256: str = MODEL_SHA256
    response_model_sha256: str = MODEL_RESPONSE_SHA256
    log_sha256: str = LOG_SHA256
    job_id: str = JOB_ID
    identity_hash: str = IDENTITY_HASH
    daemon_sha256: str = DAEMON_SHA256
    variables: int = VARIABLE_COUNT
    clauses: int = CLAUSE_COUNT


PRODUCTION = Binding()
DEFAULT_ROOT = REPO / "scratch/exact17-lean-to-sat"
DEFAULT_CNF = DEFAULT_ROOT / "exact17-thirty-third-root-thirty-second-model-refinements.cnf"
DEFAULT_MANIFEST = DEFAULT_ROOT / "piqd-ingress-manifest-thirty-second-model-refinements-core1.json"
DEFAULT_FINAL = DEFAULT_ROOT / "piqd-child33-core1-custody-final.json"
DEFAULT_MODEL = DEFAULT_ROOT / "piqd-child33-core1-custody-model.json"
DEFAULT_LOG = DEFAULT_ROOT / "piqd-child33-core1-custody-solver.log"


def _no_dupes(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    value: dict[str, Any] = {}
    for key, item in pairs:
        if key in value:
            raise ValueError(f"duplicate JSON key: {key}")
        value[key] = item
    return value


def read_json(path: Path) -> tuple[dict[str, Any], str]:
    data = path.read_bytes()
    value = json.loads(data.decode("utf-8"), object_pairs_hook=_no_dupes)
    if not isinstance(value, dict):
        raise TypeError(f"{path} is not a JSON object")
    return value, hashlib.sha256(data).hexdigest()


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def load_model(path: Path, binding: Binding) -> tuple[dict[int, bool], str]:
    payload, digest = read_json(path)
    _require(digest == binding.model_sha256, f"model wrapper SHA mismatch: {digest}")
    _require(set(payload) == MODEL_KEYS, "child33 model schema drifted")
    _require(payload["schema"] == "p97-exact17-child33-piqd-model/v3", "wrong model schema")
    _require(payload["job_id"] == binding.job_id, "model job mismatch")
    _require(payload["cnf_sha256"] == binding.cnf_sha256, "model CNF mismatch")
    _require(payload["manifest_sha256"] == binding.manifest_sha256, "model manifest mismatch")
    _require(payload["completion_identity_hash"] == binding.identity_hash, "model identity mismatch")
    replay = payload["replay"]
    _require(replay == {"clauses_checked": binding.clauses, "satisfies_all": True}, "model replay evidence is incomplete")
    raw = payload["model"]
    _require(isinstance(raw, dict) and set(raw) == INNER_MODEL_KEYS, "inner SAT model schema drifted")
    _require(raw["job_id"] == binding.job_id and raw["result"] == "SAT", "inner SAT model identity/result mismatch")
    _require(raw["backend"] == "cadical" and raw["solver_profile"] == "sat", "inner SAT solver lane mismatch")
    _require(type(raw["num_assigned"]) is int and raw["num_assigned"] == binding.variables, "inner assignment count mismatch")
    literals = raw["assignment"]
    _require(isinstance(literals, list) and len(literals) == binding.variables, "assignment is not complete")
    assignment: dict[int, bool] = {}
    for literal in literals:
        _require(type(literal) is int and literal != 0, f"invalid assignment literal: {literal!r}")
        variable = abs(literal)
        _require(1 <= variable <= binding.variables and variable not in assignment, "assignment is not unique/in range")
        assignment[variable] = literal > 0
    _require(set(assignment) == set(range(1, binding.variables + 1)), "assignment is not total")
    return assignment, digest


def validate_manifest(path: Path, binding: Binding) -> tuple[dict[str, Any], str]:
    manifest, digest = read_json(path)
    _require(digest == binding.manifest_sha256, f"manifest SHA mismatch: {digest}")
    _require(manifest.get("schema") == "p97-exact17-thirty-second-model-refinements-piqd-ingress/v2", "wrong ingress schema")
    _require(manifest.get("status") == "PASS", "ingress manifest is not PASS")
    dimacs = manifest.get("dimacs")
    _require(isinstance(dimacs, dict), "manifest DIMACS binding missing")
    _require(dimacs.get("sha256") == binding.cnf_sha256 and dimacs.get("variables") == binding.variables and dimacs.get("clauses") == binding.clauses, "manifest DIMACS binding mismatch")
    piqd = manifest.get("piqd")
    _require(isinstance(piqd, dict), "manifest PIQD binding missing")
    _require(piqd.get("daemon_sha256") == binding.daemon_sha256 and piqd.get("ingress") == "raw-dimacs/v1", "manifest daemon/ingress mismatch")
    _require(piqd.get("backend") == "cadical" and piqd.get("solver_profile") == "sat", "manifest solver lane mismatch")
    return manifest, digest


def validate_final(path: Path, log_path: Path, binding: Binding) -> tuple[dict[str, Any], str]:
    final, digest = read_json(path)
    _require(digest == binding.final_sha256, f"final SHA mismatch: {digest}")
    _require(set(final) == FINAL_KEYS, "child33 final schema drifted")
    _require(final["schema"] == "p97-exact17-child33-piqd-final/v2", "wrong final schema")
    _require(final["job_id"] == binding.job_id and final["result"] == "SAT", "final job/result mismatch")
    _require(final["model_sha256"] == binding.model_sha256, "final model binding mismatch")
    _require(final["binding"].get("cnf_sha256") == binding.cnf_sha256 and final["binding"].get("manifest_sha256") == binding.manifest_sha256, "final CNF/manifest binding mismatch")
    _require(final["next_gate"] == "mandatory_general_theorem_search", "final next gate drifted")
    _require(final["model_replay"] == {"clauses_checked": binding.clauses, "satisfies_all": True}, "final replay evidence incomplete")
    check = final["model_check"]
    _require(isinstance(check, dict), "final model check missing")
    for key, expected in (("job_id", binding.job_id), ("cnf_blob_hash", binding.cnf_sha256), ("model_sha256", binding.response_model_sha256), ("num_vars", binding.variables), ("num_clauses", binding.clauses), ("num_assigned", binding.variables), ("outcome", "SATISFIED")):
        _require(check.get(key) == expected, f"final model-check field {key} mismatch")
    status = final["completion_status"]
    _require(isinstance(status, dict), "completion status missing")
    for key, expected in (("id", binding.job_id), ("status", "completed"), ("result", "SAT"), ("run_epoch", 1), ("recovery_action", None), ("cnf_blob_hash", binding.cnf_sha256), ("producer_manifest_hash", binding.manifest_sha256), ("identity_hash", binding.identity_hash), ("log_sha256", binding.log_sha256), ("daemon_sha256", binding.daemon_sha256), ("backend", "cadical"), ("solver_profile", "sat")):
        _require(status.get(key) == expected, f"completion-status field {key} mismatch")
    _require(final["binding"].get("identity_hash") == binding.identity_hash, "final binding identity mismatch")
    _require(final["deciding_daemon_sha256"] == binding.daemon_sha256, "final daemon mismatch")
    log = log_path.read_bytes()
    log_digest = hashlib.sha256(log).hexdigest()
    _require(log_digest == binding.log_sha256, f"solver log SHA mismatch: {log_digest}")
    _require(final["solver_log"] == {"bytes": len(log), "sha256": binding.log_sha256, "terminal_attestation": binding.log_sha256}, "solver log attestation mismatch")
    return final, digest


def replay_cnf(path: Path, assignment: dict[int, bool], binding: Binding) -> tuple[int, int, str]:
    """Hash and replay the exact CNF stream; mining is downstream of this."""
    digest = hashlib.sha256()
    variables = clauses = None
    observed = 0
    pending: list[int] = []
    with path.open("rb") as stream:
        for line_number, raw in enumerate(stream, 1):
            digest.update(raw)
            line = raw.decode("ascii").strip()
            if not line or line.startswith("c"):
                continue
            if line.startswith("p"):
                parts = line.split()
                _require(parts[:2] == ["p", "cnf"] and len(parts) == 4 and variables is None, f"invalid DIMACS header at line {line_number}")
                variables, clauses = int(parts[2]), int(parts[3])
                continue
            _require(variables is not None, f"clause before header at line {line_number}")
            for token in line.split():
                literal = int(token)
                if literal == 0:
                    _require(bool(pending), f"empty clause at line {line_number}")
                    _require(any(assignment[abs(item)] == (item > 0) for item in pending), f"assignment falsifies clause {observed + 1}")
                    observed += 1
                    pending.clear()
                else:
                    _require(abs(literal) <= variables, f"literal out of range at line {line_number}")
                    pending.append(literal)
    _require(not pending, "unterminated DIMACS clause")
    actual = digest.hexdigest()
    _require(actual == binding.cnf_sha256, f"CNF SHA mismatch: {actual}")
    _require((variables, clauses, observed) == (binding.variables, binding.clauses, binding.clauses), "DIMACS dimensions/replay count mismatch")
    return variables, observed, actual


def decode(assignment: dict[int, bool]) -> dict[str, Any]:
    rows = {str(center): [point for point in range(POINT_COUNT) if assignment[1 + POINT_COUNT * center + point]] for center in range(POINT_COUNT)}
    return {"rows": rows, "row_sizes": {center: len(points) for center, points in rows.items()}, "diagonal_hits": [center for center in range(POINT_COUNT) if center in rows[str(center)]], "next_centers": [center for center in range(POINT_COUNT) if assignment[290 + center]], "named_orders": [order for order in range(2) if assignment[307 + order]]}


def inventory(decoded: dict[str, Any]) -> dict[str, Any]:
    orders = decoded["named_orders"]
    _require(isinstance(orders, list) and len(orders) == 1 and orders[0] in (0, 1), "expected exactly one named order")
    rows = [producer_bank.MetricRow(int(center), tuple(points), exact=False) for center, points in sorted(decoded["rows"].items(), key=lambda pair: int(pair[0]))]
    order = ORDERS[orders[0]]
    candidates = list(producer_bank.scan_all_formalized_cores(rows, POINT_COUNT, order))
    by_stage: dict[str, int] = {}
    by_consumer: dict[str, int] = {}
    for candidate in candidates:
        by_stage[candidate["stage"]] = by_stage.get(candidate["stage"], 0) + 1
        by_consumer[candidate["lean_consumer"]] = by_consumer.get(candidate["lean_consumer"], 0) + 1
    return {
        "schema": "p97-exact17-child33-model-motif-inventory/v2",
        "status": "REPLAY_COMPLETE",
        "classification": "DIAGNOSTIC_CANDIDATES",
        "antecedent_validation": "NOT_REPLAYED",
        "order": list(order),
        "bank_scan": "all-formalized-cores",
        "candidate_count": len(candidates),
        "candidates": candidates,
        "candidate_counts_by_stage": dict(sorted(by_stage.items())),
        "candidate_counts_by_lean_consumer": dict(sorted(by_consumer.items())),
    }


def analyze(cnf: Path, manifest: Path, final: Path, model: Path, log: Path, binding: Binding = PRODUCTION) -> tuple[dict[str, Any], dict[str, Any]]:
    _manifest_payload, manifest_digest = validate_manifest(manifest, binding)
    _final_payload, final_digest = validate_final(final, log, binding)
    assignment, model_digest = load_model(model, binding)
    variables, clauses, cnf_digest = replay_cnf(cnf, assignment, binding)
    decoded = decode(assignment)
    motif = inventory(decoded)
    analysis = {"schema": "p97-exact17-child33-model-analysis/v1", "status": "REPLAY_COMPLETE", "production_authenticated": binding == PRODUCTION, "job_id": binding.job_id, "cnf_sha256": cnf_digest, "manifest_sha256": manifest_digest, "final_sha256": final_digest, "model_sha256": model_digest, "solver_log_sha256": binding.log_sha256, "variables": variables, "clauses": clauses, "replay": {"clauses_checked": clauses, "satisfies_all": True}, "authentication": {"completion_identity_hash": binding.identity_hash, "daemon_sha256": binding.daemon_sha256, "run_epoch": 1, "recovery_action": None}, **decoded}
    motif["source_analysis"] = {"schema": analysis["schema"], "job_id": binding.job_id, "cnf_sha256": cnf_digest, "model_sha256": model_digest}
    return analysis, motif


def write_json(path: Path, value: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    data = (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()
    fd = os.open(path, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o600)
    try:
        with os.fdopen(fd, "wb") as stream:
            stream.write(data)
            stream.flush()
            os.fsync(stream.fileno())
    except BaseException:
        path.unlink(missing_ok=True)
        raise


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--cnf", type=Path, default=DEFAULT_CNF)
    parser.add_argument("--manifest", type=Path, default=DEFAULT_MANIFEST)
    parser.add_argument("--final", type=Path, default=DEFAULT_FINAL)
    parser.add_argument("--model", type=Path, default=DEFAULT_MODEL)
    parser.add_argument("--log", type=Path, default=DEFAULT_LOG)
    parser.add_argument("--analysis-output", type=Path, default=DEFAULT_ROOT / "piqd-child33-core1-custody-model-analysis.json")
    parser.add_argument("--inventory-output", type=Path, default=DEFAULT_ROOT / "piqd-child33-core1-custody-model-motif-inventory.json")
    args = parser.parse_args()
    analysis, motif = analyze(args.cnf, args.manifest, args.final, args.model, args.log)
    write_json(args.analysis_output, analysis)
    write_json(args.inventory_output, motif)
    print(json.dumps({"status": "REPLAY_COMPLETE", "analysis": str(args.analysis_output), "inventory": str(args.inventory_output), "candidate_count": motif["candidate_count"]}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
