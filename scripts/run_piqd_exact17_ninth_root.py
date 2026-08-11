#!/usr/bin/env python3
"""Submit and finalize the ninth Lean-owned exact-17 PIQD root.

``start`` prepares the immutable root, persists the confirmation code before
doing any further work, rereads PIQD's stored bytes, exercises session custody
by exporting the seeded session byte-for-byte, and only then confirms the job.
It is resumable from the persisted prepared state but never resubmits.

``finalize`` is a one-shot terminal check.  For SAT it retrieves the complete
model and replays every submitted clause.  UNSAT is recorded as requiring the
separate submitted-to-certificate map and proof-replay gate.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
import tempfile
from datetime import UTC, datetime
from pathlib import Path
from time import monotonic
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
SCRATCH = ROOT / "scratch" / "exact17-lean-to-sat"
CNF = SCRATCH / (
    "extended-cdefg-equal-k4-two-circle-three-row-hijk-interleaved-"
    "equality-chain-perp-bisector-chain-two-kalmanson-swapped-de.cnf"
)
INGRESS_MANIFEST = SCRATCH / (
    "piqd-ingress-manifest-equal-k4-two-circle-three-row-hijk-interleaved-"
    "equality-chain-perp-bisector-chain-two-kalmanson-swapped-de.json"
)
INGRESS_REPORT = SCRATCH / (
    "piqd-ingress-equal-k4-two-circle-three-row-hijk-interleaved-"
    "equality-chain-perp-bisector-chain-two-kalmanson-swapped-de-validation-rerun.json"
)
STATE = SCRATCH / "piqd-ninth-root-live-state.json"
FINAL = SCRATCH / "piqd-ninth-root-final.json"

VARIABLES = 308
CLAUSES = 5_846_076
BYTES = 291_567_840
CNF_SHA256 = "759507d020a02253e85b59ce12e344451bbe66889dce221884f1b2a6aa3fac28"
MANIFEST_SHA256 = "8166b6da38fef5a04729b7df09c10bb5fecedc2e694e578e1c01f8b9681c2f57"
DAEMON_SHA256 = "0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360"
SOLVER_NAME = "piqd-satworker-cadical-3.0.0"
SOLVER_SHA256 = "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965"
SOLVER_SIGNATURE = "cadical-3.0.0"
CONFIRM_RE = re.compile(r"CONFIRMATION CODE:\s*([0-9]+)")


def require(condition: bool, message: str) -> None:
    if not condition:
        raise SystemExit(message)


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        while chunk := handle.read(1024 * 1024):
            digest.update(chunk)
    return digest.hexdigest()


def atomic_json(path: Path, payload: dict[str, Any]) -> None:
    with tempfile.NamedTemporaryFile(
        mode="w", encoding="utf-8", dir=path.parent, prefix=f".{path.name}.",
        suffix=".tmp", delete=False,
    ) as handle:
        temporary = Path(handle.name)
        json.dump(payload, handle, indent=2, sort_keys=True)
        handle.write("\n")
        handle.flush()
    temporary.replace(path)


def run(command: list[str], timeout: int = 900) -> subprocess.CompletedProcess[str]:
    completed = subprocess.run(
        command, cwd=ROOT, text=True, capture_output=True, check=False, timeout=timeout,
    )
    if completed.returncode != 0:
        raise SystemExit(
            f"command failed ({completed.returncode}): {' '.join(command)}\n"
            f"stdout tail:\n{completed.stdout[-1500:]}\n"
            f"stderr tail:\n{completed.stderr[-1500:]}"
        )
    return completed


def run_json(command: list[str], timeout: int = 900) -> dict[str, Any]:
    completed = run(command, timeout)
    try:
        payload = json.loads(completed.stdout)
    except json.JSONDecodeError as error:
        raise SystemExit(f"non-JSON output from {' '.join(command)}: {error}") from error
    require(isinstance(payload, dict), f"expected object from {' '.join(command)}")
    return payload


def validate_local() -> dict[str, Any]:
    require(CNF.is_file(), f"missing root: {CNF}")
    require(CNF.stat().st_size == BYTES, "ninth root byte count changed")
    with CNF.open("rb") as handle:
        require(handle.readline() == f"p cnf {VARIABLES} {CLAUSES}\n".encode(), "bad CNF header")
    require(sha256_file(CNF) == CNF_SHA256, "ninth root SHA-256 changed")
    require(sha256_file(INGRESS_MANIFEST) == MANIFEST_SHA256, "ingress manifest changed")
    report = json.loads(INGRESS_REPORT.read_text())
    require(report.get("status") == "PASS", "recursive ingress report is not PASS")
    require(report.get("dimacs_sha256") == CNF_SHA256, "ingress report names wrong root")
    require(report.get("manifest_sha256") == MANIFEST_SHA256, "ingress report names wrong manifest")
    require(report.get("piqd_daemon_sha256") == DAEMON_SHA256, "ingress report names wrong daemon")
    require(report.get("variables") == VARIABLES and report.get("clauses") == CLAUSES, "bad ingress dimensions")
    return {
        "path": str(CNF.relative_to(ROOT)), "sha256": CNF_SHA256,
        "bytes": BYTES, "variables": VARIABLES, "clauses": CLAUSES,
        "ingress_report": str(INGRESS_REPORT.relative_to(ROOT)),
        "ingress_report_sha256": sha256_file(INGRESS_REPORT),
        "manifest": str(INGRESS_MANIFEST.relative_to(ROOT)),
        "manifest_sha256": MANIFEST_SHA256,
    }


def live_identity() -> dict[str, Any]:
    version = run_json(["piqc", "version"])
    daemon = version.get("daemon")
    require(isinstance(daemon, dict) and daemon.get("sha256") == DAEMON_SHA256, "wrong live daemon")
    limits = version.get("limits")
    require(isinstance(limits, dict) and limits.get("max_var") == 1_000_000, "wrong live limits")
    registry = run_json(["piqc", "solvers"])
    require(registry.get("daemon") == daemon, "solver registry daemon mismatch")
    entries = registry.get("solvers")
    require(isinstance(entries, list), "malformed solver registry")
    matches = [entry for entry in entries if isinstance(entry, dict) and entry.get("name") == SOLVER_NAME]
    require(len(matches) == 1, "pinned solver is not unique")
    solver = matches[0]
    require(solver.get("usable") is True and solver.get("lane") == "sat", "pinned solver unusable")
    require(solver.get("sha256") == SOLVER_SHA256, "pinned solver SHA-256 changed")
    require(solver.get("solver_signature") == SOLVER_SIGNATURE, "pinned solver signature changed")
    return {"version": version, "solver": solver}


def retrieve_and_hash(job_id: str, suffix: str) -> dict[str, Any]:
    destination = SCRATCH / f".piqd-ninth-root-{suffix}.cnf"
    require(not destination.exists(), f"temporary retrieval already exists: {destination}")
    try:
        run(["piqc", "job", "cnf", job_id, "--out", str(destination)])
        require(destination.stat().st_size == BYTES, "stored CNF byte count changed")
        digest = sha256_file(destination)
        require(digest == CNF_SHA256, "stored CNF SHA-256 changed")
        return {"bytes": BYTES, "sha256": digest}
    finally:
        destination.unlink(missing_ok=True)


def custody_gate(job_id: str) -> dict[str, Any]:
    created = run_json([
        "piqc", "session", "new", "--solver", SOLVER_NAME, "--lane", "sat",
        "--label", "p97-exact17-cap9-ninth-root-custody", "--seed-from-job", job_id,
    ], timeout=900)
    session_id = created.get("id")
    require(isinstance(session_id, str) and session_id, "session creation omitted id")
    try:
        require(created.get("state") == "live" and created.get("lane") == "sat", "bad session state")
        require(created.get("solver_name") == SOLVER_NAME, "session solver name changed")
        require(created.get("solver_sha256") == SOLVER_SHA256, "session solver hash changed")
        require(created.get("solver_signature") == SOLVER_SIGNATURE, "session solver signature changed")
        require(created.get("clauses") == CLAUSES, "session clause count changed")
        require(created.get("max_var") == VARIABLES, "session max variable changed")
        require(created.get("declared_num_vars") == VARIABLES, "session declared variables changed")
        destination = SCRATCH / ".piqd-ninth-root-session-export.cnf"
        require(not destination.exists(), f"temporary export already exists: {destination}")
        try:
            run(["piqc", "session", "export", session_id, "--out", str(destination)])
            require(destination.stat().st_size == BYTES, "session export byte count changed")
            digest = sha256_file(destination)
            require(digest == CNF_SHA256, "session export SHA-256 changed")
            exported = {"bytes": BYTES, "sha256": digest}
        finally:
            destination.unlink(missing_ok=True)
        return {"created": created, "exported": exported}
    finally:
        closed = run_json(["piqc", "session", "close", session_id])
        require(closed.get("state") == "closed", "custody session did not close")


def prepare() -> dict[str, Any]:
    completed = run([
        "piqc", "job", "submit-cnf", str(CNF), "--backend", "cadical",
        "--project", "erdos-97-96-formalization", "--solver-profile", "sat",
        "--timeout", "3600", "--manifest", str(INGRESS_MANIFEST),
    ], timeout=900)
    try:
        response = json.loads(completed.stdout)
    except json.JSONDecodeError as error:
        raise SystemExit(f"non-JSON PIQD prepare response: {error}") from error
    require(isinstance(response, dict), "PIQD prepare response is not an object")
    require(response.get("existing") is False, "production job identity already exists")
    require(response.get("cnf_blob_hash") == CNF_SHA256, "PIQD stored wrong production root")
    require(response.get("num_vars") == VARIABLES and response.get("num_clauses") == CLAUSES, "PIQD parsed wrong dimensions")
    matches = CONFIRM_RE.findall(completed.stderr)
    require(len(matches) == 1, "PIQD did not emit exactly one confirmation code")
    return {"response": response, "confirmation_code": matches[0]}


def start() -> None:
    require(not FINAL.exists(), f"production job already finalized: {FINAL}")
    local = validate_local()
    identity = live_identity()
    if STATE.exists():
        state = json.loads(STATE.read_text())
        require(state.get("phase") == "prepared", "refusing to restart a non-prepared production state")
        require(state.get("root") == local, "prepared state root changed")
        require(state.get("daemon") == identity["version"], "daemon changed after prepare")
        require(state.get("solver") == identity["solver"], "solver changed after prepare")
    else:
        started = monotonic()
        prepared = prepare()
        state = {
            "artifact_kind": "p97-exact17-ninth-root-piqd-live-state/v1",
            "phase": "prepared", "prepared": prepared["response"],
            "confirmation_code": prepared["confirmation_code"],
            "root": local, "daemon": identity["version"], "solver": identity["solver"],
            "prepared_at_utc": datetime.now(UTC).isoformat(),
            "prepare_seconds": monotonic() - started,
        }
        atomic_json(STATE, state)

    job_id = state["prepared"].get("job_id")
    require(isinstance(job_id, str) and job_id, "prepared state omitted job id")
    stored = retrieve_and_hash(job_id, "stored-preconfirm")
    custody = custody_gate(job_id)
    confirmed = run_json(["piqc", "confirm", state["confirmation_code"]])
    require(confirmed.get("job_id") == job_id, "confirmed wrong job")
    require(confirmed.get("blob_hash") == CNF_SHA256, "confirmed wrong root")
    require(confirmed.get("status") == "confirmed", "PIQD did not confirm production job")
    state.update({
        "phase": "confirmed", "stored_preconfirm": stored, "custody_gate": custody,
        "confirmed": confirmed, "confirmed_at_utc": datetime.now(UTC).isoformat(),
    })
    state.pop("confirmation_code", None)
    atomic_json(STATE, state)
    print(json.dumps({"job_id": job_id, "root_sha256": CNF_SHA256, "status": "confirmed"}, sort_keys=True))


def complete_assignment(value: object) -> list[int]:
    require(isinstance(value, list), "SAT assignment is not a list")
    literals = value
    require(all(isinstance(literal, int) and not isinstance(literal, bool) for literal in literals), "bad SAT literal")
    require(len(literals) == VARIABLES, "SAT model is incomplete")
    require({abs(literal) for literal in literals} == set(range(1, VARIABLES + 1)), "SAT model has wrong variables")
    return literals


def replay_model(assignment: list[int]) -> dict[str, Any]:
    true_literals = set(assignment)
    checked = 0
    with CNF.open("r", encoding="ascii") as handle:
        header = handle.readline()
        require(header == f"p cnf {VARIABLES} {CLAUSES}\n", "CNF changed before model replay")
        for line_number, line in enumerate(handle, start=2):
            literals = [int(token) for token in line.split()]
            require(literals and literals[-1] == 0, f"bad clause line {line_number}")
            require(any(literal in true_literals for literal in literals[:-1]), f"model falsifies clause {checked + 1}")
            checked += 1
    require(checked == CLAUSES, f"replayed {checked} clauses, expected {CLAUSES}")
    return {"clauses_checked": checked, "satisfies_all": True}


def finalize() -> None:
    require(STATE.is_file(), f"missing production state: {STATE}")
    require(not FINAL.exists(), f"refusing to replace final report: {FINAL}")
    local = validate_local()
    identity = live_identity()
    state = json.loads(STATE.read_text())
    require(state.get("phase") == "confirmed", "production job is not confirmed")
    require(state.get("root") == local, "root changed after confirmation")
    require(state.get("daemon") == identity["version"], "daemon changed after confirmation")
    require(state.get("solver") == identity["solver"], "solver changed after confirmation")
    job_id = state["prepared"].get("job_id")
    require(isinstance(job_id, str) and job_id, "state omitted job id")
    status = run_json(["piqc", "status", job_id])
    require(status.get("status") == "completed", f"job is not terminal: {status.get('status')}")
    require(status.get("cnf_blob_hash") == CNF_SHA256, "terminal status names wrong root")
    stored = retrieve_and_hash(job_id, "stored-final")
    result = status.get("result")
    report: dict[str, Any] = {
        "artifact_kind": "p97-exact17-ninth-root-piqd-final/v1",
        "daemon": identity["version"], "solver": identity["solver"],
        "root": local, "job_id": job_id, "status": status, "stored_final": stored,
        "finalized_at_utc": datetime.now(UTC).isoformat(),
    }
    if result == "SAT":
        model = run_json(["piqc", "job", "model", job_id])
        require(model.get("result") == "SAT", "model endpoint is not SAT")
        assignment = complete_assignment(model.get("assignment"))
        require(model.get("num_assigned") == VARIABLES, "model endpoint declared wrong width")
        model_path = SCRATCH / "piqd-ninth-root-model.json"
        require(not model_path.exists(), f"refusing to replace model: {model_path}")
        atomic_json(model_path, model)
        report.update({
            "result": "SAT", "model_path": str(model_path.relative_to(ROOT)),
            "model_sha256": sha256_file(model_path), "model_replay": replay_model(assignment),
            "next_gate": "mandatory_general_theorem_search",
        })
    elif result == "UNSAT":
        report.update({
            "result": "UNSAT", "proof_replay_complete": False,
            "next_gate": "retrieve_clause_map_and_proof_then_independently_replay",
        })
    else:
        raise SystemExit(f"terminal job has non-proof result: {result}")
    atomic_json(FINAL, report)
    print(json.dumps({"job_id": job_id, "report": str(FINAL), "result": result}, sort_keys=True))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=("static-check", "start", "finalize"))
    args = parser.parse_args()
    if args.command == "static-check":
        print(json.dumps({"identity": live_identity(), "root": validate_local()}, sort_keys=True))
    elif args.command == "start":
        start()
    else:
        finalize()


if __name__ == "__main__":
    main()
