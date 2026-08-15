#!/usr/bin/env python3
"""Qualify PIQD on the exact size of the ninth exact-17 proof root.

The ``start`` phase is deliberately fail closed.  It validates both the
throwaway SAT canary and the immutable proof-root dimensions, pins the daemon
and session-worker identities, submits the canary without confirming it,
rereads the stored bytes, and replays them through a seeded SAT session.  Only
after all of those checks pass does it confirm the raw proof-producing job.

The ``finalize`` phase is separate so this script never polls PIQD.  Run it
once the confirmed raw job has reached a terminal state.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import subprocess
import tempfile
from datetime import UTC, datetime
from pathlib import Path
from time import monotonic
from typing import Any

PROJECT_ROOT = Path(__file__).resolve().parents[1]
SCRATCH = PROJECT_ROOT / "scratch" / "exact17-lean-to-sat"
CANARY = SCRATCH / "piqd-large-cnf-capacity-preflight.cnf"
CANARY_VALIDATOR = PROJECT_ROOT / "scripts" / "validate_piqd_large_cnf_capacity_preflight.py"
PROOF_ROOT = SCRATCH / (
    "extended-cdefg-equal-k4-two-circle-three-row-hijk-interleaved-"
    "equality-chain-perp-bisector-chain-two-kalmanson-swapped-de.cnf"
)
STATE = SCRATCH / "piqd-large-cnf-capacity-preflight-live-state.json"
FINAL_REPORT = SCRATCH / "piqd-large-cnf-capacity-preflight-live-final.json"
MANIFEST = SCRATCH / "piqd-large-cnf-capacity-preflight-manifest.json"

VARIABLE_COUNT = 308
CLAUSE_COUNT = 5_846_076
BYTE_COUNT = 291_567_840
CANARY_SHA256 = "b795edd93a4a222232e2b8128f6e2596eb153b9fd182788b93e0ef7a4f97e5a5"
PROOF_ROOT_SHA256 = "759507d020a02253e85b59ce12e344451bbe66889dce221884f1b2a6aa3fac28"
OLD_DAEMON_SHA256 = "fd1cacee52677a555f8b3d24c6052c71022e4dfd6ccc9037f165d1d22ec384eb"
SOLVER_NAME = "piqd-satworker-cadical-3.0.0"
SOLVER_SHA256 = "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965"
SOLVER_SIGNATURE = "cadical-3.0.0"
SOLVER_PROFILE = "sat"
CONFIRMATION_RE = re.compile(r"CONFIRMATION CODE:\s*([0-9]+)")
RUN_LABEL_RE = re.compile(r"[a-z0-9][a-z0-9._-]{0,63}")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="command", required=True)
    subparsers.add_parser("static-check", help="validate both local CNF artifacts")
    start_parser = subparsers.add_parser("start")
    start_parser.add_argument(
        "--expected-daemon-sha256",
        required=True,
        help="SHA-256 of the newly installed PIQD daemon binary",
    )
    start_parser.add_argument(
        "--run-label",
        required=True,
        help="audited disposable-run discriminator; it grants no proof entitlement",
    )
    finalize_parser = subparsers.add_parser("finalize")
    finalize_parser.add_argument(
        "--expected-daemon-sha256",
        required=True,
        help="SHA-256 of the newly installed PIQD daemon binary",
    )
    return parser.parse_args()


def require(condition: bool, message: str) -> None:
    if not condition:
        raise SystemExit(message)


def require_complete_model(assignment: object, width: int, context: str) -> list[int]:
    require(isinstance(assignment, list), f"{context} model is not a list")
    literals = assignment
    require(
        all(isinstance(literal, int) and not isinstance(literal, bool) for literal in literals),
        f"{context} model contains a non-integer literal",
    )
    require(len(literals) == width, f"{context} model has {len(literals)} literals, expected {width}")
    require(
        {abs(literal) for literal in literals} == set(range(1, width + 1)),
        f"{context} model is not a complete assignment of variables 1 through {width}",
    )
    return literals


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        while chunk := handle.read(1024 * 1024):
            digest.update(chunk)
    return digest.hexdigest()


def atomic_json_write(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile(
        mode="w",
        encoding="utf-8",
        dir=path.parent,
        prefix=f".{path.name}.",
        suffix=".tmp",
        delete=False,
    ) as handle:
        temporary = Path(handle.name)
        json.dump(payload, handle, indent=2, sort_keys=True)
        handle.write("\n")
        handle.flush()
        os.fsync(handle.fileno())
    os.replace(temporary, path)


def run(command: list[str], *, timeout: int = 900) -> subprocess.CompletedProcess[str]:
    completed = subprocess.run(
        command,
        cwd=PROJECT_ROOT,
        check=False,
        capture_output=True,
        text=True,
        timeout=timeout,
    )
    if completed.returncode != 0:
        stdout = completed.stdout[-2000:]
        stderr = completed.stderr[-2000:]
        raise SystemExit(
            f"command failed ({completed.returncode}): {' '.join(command)}\n"
            f"stdout tail:\n{stdout}\nstderr tail:\n{stderr}"
        )
    return completed


def run_json(command: list[str], *, timeout: int = 900) -> dict[str, Any]:
    completed = run(command, timeout=timeout)
    try:
        value = json.loads(completed.stdout)
    except json.JSONDecodeError as error:
        raise SystemExit(f"non-JSON output from {' '.join(command)}: {error}") from error
    require(isinstance(value, dict), f"expected JSON object from {' '.join(command)}")
    return value


def validate_cnf_shape(path: Path, expected_sha256: str) -> dict[str, Any]:
    require(path.is_file(), f"missing CNF: {path}")
    require(path.stat().st_size == BYTE_COUNT, f"wrong byte count for {path}")
    with path.open("rb") as handle:
        header = handle.readline()
    expected_header = f"p cnf {VARIABLE_COUNT} {CLAUSE_COUNT}\n".encode()
    require(header == expected_header, f"wrong header for {path}: {header!r}")
    actual_sha256 = sha256_file(path)
    require(actual_sha256 == expected_sha256, f"wrong SHA-256 for {path}: {actual_sha256}")
    return {
        "path": str(path),
        "sha256": actual_sha256,
        "bytes": path.stat().st_size,
        "variables": VARIABLE_COUNT,
        "clauses": CLAUSE_COUNT,
    }


def session_journal_fingerprint(path: Path) -> dict[str, Any]:
    """Hash the headerless canonical clause journal PIQD receipts name."""
    digest = hashlib.sha256()
    byte_count = 0
    with path.open("rb") as handle:
        header = handle.readline()
        expected_header = f"p cnf {VARIABLE_COUNT} {CLAUSE_COUNT}\n".encode()
        require(header == expected_header, f"wrong header for {path}: {header!r}")
        while chunk := handle.read(1024 * 1024):
            digest.update(chunk)
            byte_count += len(chunk)
    return {"bytes": byte_count, "sha256": digest.hexdigest()}


def static_check() -> dict[str, Any]:
    canary_report = SCRATCH / ".piqd-large-cnf-capacity-preflight-live-validation.json"
    validator = run_json(
        [
            "uv",
            "run",
            "python",
            str(CANARY_VALIDATOR),
            str(CANARY),
            "--report",
            str(canary_report),
            "--expected-sha256",
            CANARY_SHA256,
            "--force",
        ]
    )
    require(validator.get("valid") is True, "independent canary validation failed")
    return {
        "canary": validate_cnf_shape(CANARY, CANARY_SHA256),
        "canary_session_journal": session_journal_fingerprint(CANARY),
        "canary_validator": validator,
        "proof_root": validate_cnf_shape(PROOF_ROOT, PROOF_ROOT_SHA256),
        "same_scale": True,
    }


def live_identity(expected_daemon_sha256: str) -> dict[str, Any]:
    expected = expected_daemon_sha256.lower()
    require(len(expected) == 64 and all(c in "0123456789abcdef" for c in expected), "bad daemon SHA-256")
    require(expected != OLD_DAEMON_SHA256, "refusing the pre-capacity PIQD daemon")
    require(
        SOLVER_PROFILE in {"default", "plain", "sat", "unsat"},
        "solver profile is outside PIQD's admitted CaDiCaL profile vocabulary",
    )

    version = run_json(["piqc", "version"])
    daemon = version.get("daemon")
    require(isinstance(daemon, dict), "piqc version omitted daemon identity")
    require(daemon.get("sha256") == expected, "live PIQD daemon does not match expected SHA-256")
    limits = version.get("limits")
    require(isinstance(limits, dict), "piqc version omitted limits")
    require(limits.get("max_var") == 1_000_000, "unexpected PIQD max_var policy")
    require(VARIABLE_COUNT <= 1_000_000, "proof root exceeds PIQD max_var policy")

    registry = run_json(["piqc", "solvers"])
    require(registry.get("daemon") == daemon, "solver registry came from a different daemon")
    solvers = registry.get("solvers")
    require(isinstance(solvers, list), "PIQD solver registry is malformed")
    matches = [entry for entry in solvers if isinstance(entry, dict) and entry.get("name") == SOLVER_NAME]
    require(len(matches) == 1, f"expected exactly one {SOLVER_NAME} registry entry")
    solver = matches[0]
    require(solver.get("usable") is True, "pinned PIQD SAT worker is not usable")
    require(solver.get("lane") == "sat", "pinned PIQD worker is not a SAT worker")
    require(solver.get("sha256") == SOLVER_SHA256, "pinned PIQD SAT worker SHA-256 changed")
    require(solver.get("solver_signature") == SOLVER_SIGNATURE, "pinned CaDiCaL signature changed")
    return {"version": version, "solver": solver}


def retrieve_and_hash(job_id: str, destination: Path) -> dict[str, Any]:
    try:
        run(["piqc", "job", "cnf", job_id, "--out", str(destination)])
        return validate_cnf_shape(destination, CANARY_SHA256)
    finally:
        destination.unlink(missing_ok=True)


def parse_confirmation_code(stderr: str) -> str:
    matches = CONFIRMATION_RE.findall(stderr)
    require(len(matches) == 1, "submission did not emit exactly one confirmation code")
    return matches[0]


def run_session_gate(job_id: str, expected_journal: dict[str, Any]) -> dict[str, Any]:
    timings: dict[str, float] = {}
    started = monotonic()
    created = run_json(
        [
            "piqc",
            "session",
            "new",
            "--solver",
            SOLVER_NAME,
            "--lane",
            "sat",
            "--label",
            "p97-exact17-large-cnf-capacity-preflight",
            "--seed-from-job",
            job_id,
        ],
        timeout=900,
    )
    timings["create_seconds"] = monotonic() - started
    session_id = created.get("id")
    require(isinstance(session_id, str) and session_id, "session create omitted id")
    try:
        require(created.get("lane") == "sat", "seeded session has wrong lane")
        require(created.get("state") == "live", "seeded session is not live")
        require(created.get("solver_name") == SOLVER_NAME, "seeded session has wrong solver")
        require(created.get("solver_sha256") == SOLVER_SHA256, "seeded session has wrong solver SHA-256")
        require(created.get("solver_signature") == SOLVER_SIGNATURE, "seeded session has wrong solver signature")
        require(created.get("clauses") == CLAUSE_COUNT, "seeded session has wrong clause count")
        require(created.get("max_var") == 1, "canary should use only variable 1 in clauses")
        require(created.get("declared_num_vars") == VARIABLE_COUNT, "seeded session lost declared variable count")

        exported = SCRATCH / ".piqd-large-cnf-capacity-preflight-session-export.cnf"
        try:
            started = monotonic()
            run(["piqc", "session", "export", session_id, "--out", str(exported)])
            exported_shape = validate_cnf_shape(exported, CANARY_SHA256)
            timings["export_and_hash_seconds"] = monotonic() - started
        finally:
            exported.unlink(missing_ok=True)

        started = monotonic()
        solved = run_json(
            ["piqc", "session", "solve", session_id, "--timeout-ms", "300000"],
            timeout=360,
        )
        timings["solve_seconds"] = monotonic() - started
        require(solved.get("status") == "SAT", "seeded session did not return SAT")
        model = solved.get("model")
        require(isinstance(model, list) and 1 in model, "session SAT model does not satisfy unit literal 1")
        require(solved.get("solve_index") == 1, "unexpected seeded-session solve index")

        started = monotonic()
        receipts = run_json(["piqc", "session", "receipts", session_id])
        timings["receipts_seconds"] = monotonic() - started
        require(receipts.get("count") == 1, "seeded session should have one receipt")
        records = receipts.get("receipts")
        require(isinstance(records, list) and len(records) == 1, "malformed seeded-session receipts")
        receipt = records[0]
        require(isinstance(receipt, dict), "malformed seeded-session receipt")
        require(
            receipt.get("base_bytes") == expected_journal.get("bytes"),
            "receipt has wrong canonical-journal byte count",
        )
        require(
            receipt.get("base_sha256") == expected_journal.get("sha256"),
            "receipt has wrong canonical-journal SHA-256",
        )
        require(receipt.get("base_clauses") == CLAUSE_COUNT, "receipt has wrong base clause count")
        require(receipt.get("status") == "SAT", "receipt did not record SAT")
        return {
            "created": created,
            "exported": exported_shape,
            "solve": solved,
            "receipts": receipts,
            "timings": timings,
        }
    finally:
        started = monotonic()
        closed = run_json(["piqc", "session", "close", session_id])
        timings["close_seconds"] = monotonic() - started
        require(closed.get("state") == "closed", "PIQD session did not close cleanly")


def start(expected_daemon_sha256: str, run_label: str) -> None:
    require(not STATE.exists(), f"refusing to replace existing live state: {STATE}")
    require(not FINAL_REPORT.exists(), f"preflight already finalized: {FINAL_REPORT}")
    require(
        RUN_LABEL_RE.fullmatch(run_label) is not None,
        "run label must match [a-z0-9][a-z0-9._-]{0,63}",
    )
    timings: dict[str, float] = {}
    started = monotonic()
    local = static_check()
    timings["static_check_seconds"] = monotonic() - started
    started = monotonic()
    identity = live_identity(expected_daemon_sha256)
    timings["live_identity_seconds"] = monotonic() - started
    manifest_payload: dict[str, Any] = {
        "artifact_kind": "piqd-large-cnf-capacity-preflight-manifest",
        "canary": local["canary"],
        "expected_daemon_sha256": expected_daemon_sha256.lower(),
        "proof_root": local["proof_root"],
        "purpose": "qualify PIQD custody and SAT handoff before an exact-17 immutable-root submission",
        "run_label": run_label,
        "runner_path": str(Path(__file__).resolve()),
        "runner_sha256": sha256_file(Path(__file__)),
        "solver_name": SOLVER_NAME,
        "solver_profile": SOLVER_PROFILE,
        "solver_sha256": SOLVER_SHA256,
        "solver_signature": SOLVER_SIGNATURE,
    }
    atomic_json_write(MANIFEST, manifest_payload)

    started = monotonic()
    submitted = run(
        [
            "piqc",
            "job",
            "submit-cnf",
            str(CANARY),
            "--backend",
            "cadical",
            "--project",
            "p97-exact17-cap9-capacity-preflight",
            "--solver-profile",
            SOLVER_PROFILE,
            "--timeout",
            "300",
            "--manifest",
            str(MANIFEST),
        ],
        timeout=900,
    )
    timings["prepare_seconds"] = monotonic() - started
    try:
        prepare = json.loads(submitted.stdout)
    except json.JSONDecodeError as error:
        raise SystemExit(f"non-JSON PIQD prepare response: {error}") from error
    require(isinstance(prepare, dict), "PIQD prepare response is not an object")
    require(prepare.get("existing") is False, "canary job identity already existed")
    require(prepare.get("cnf_blob_hash") == CANARY_SHA256, "PIQD stored the wrong canary blob")
    require(prepare.get("num_vars") == VARIABLE_COUNT, "PIQD parsed the wrong variable count")
    require(prepare.get("num_clauses") == CLAUSE_COUNT, "PIQD parsed the wrong clause count")
    job_id = prepare.get("job_id")
    require(isinstance(job_id, str) and job_id, "PIQD prepare response omitted job id")
    confirmation_code = parse_confirmation_code(submitted.stderr)

    started = monotonic()
    stored_preconfirm = retrieve_and_hash(
        job_id,
        SCRATCH / ".piqd-large-cnf-capacity-preflight-stored-preconfirm.cnf",
    )
    timings["stored_reread_and_hash_seconds"] = monotonic() - started
    started = monotonic()
    session = run_session_gate(job_id, local["canary_session_journal"])
    timings["session_gate_seconds"] = monotonic() - started
    started = monotonic()
    confirmed = run_json(["piqc", "confirm", confirmation_code])
    timings["confirm_seconds"] = monotonic() - started
    require(confirmed.get("job_id") == job_id, "PIQD confirmed a different job")
    require(confirmed.get("blob_hash") == CANARY_SHA256, "PIQD confirmed a different blob")
    require(confirmed.get("status") == "confirmed", "PIQD did not confirm the canary job")

    payload: dict[str, Any] = {
        "artifact_kind": "piqd-large-cnf-capacity-preflight-live-state",
        "canary": local["canary"],
        "confirmed": confirmed,
        "daemon": identity["version"],
        "job_id": job_id,
        "manifest_path": str(MANIFEST),
        "manifest_sha256": sha256_file(MANIFEST),
        "prepare": prepare,
        "proof_root": local["proof_root"],
        "session_gate": session,
        "solver": identity["solver"],
        "started_at_utc": datetime.now(UTC).isoformat(),
        "stored_preconfirm": stored_preconfirm,
        "timings": timings,
    }
    atomic_json_write(STATE, payload)
    print(json.dumps({"job_id": job_id, "state": str(STATE), "status": "confirmed"}, sort_keys=True))


def finalize(expected_daemon_sha256: str) -> None:
    require(STATE.is_file(), f"missing live state: {STATE}")
    require(not FINAL_REPORT.exists(), f"refusing to replace final report: {FINAL_REPORT}")
    timings: dict[str, float] = {}
    started = monotonic()
    local = static_check()
    timings["static_check_seconds"] = monotonic() - started
    started = monotonic()
    identity = live_identity(expected_daemon_sha256)
    timings["live_identity_seconds"] = monotonic() - started
    state = json.loads(STATE.read_text())
    require(isinstance(state, dict), "malformed live state")
    require(state.get("daemon") == identity["version"], "daemon changed after preflight start")
    require(state.get("solver") == identity["solver"], "solver changed after preflight start")
    require(state.get("canary") == local["canary"], "canary changed after preflight start")
    require(state.get("proof_root") == local["proof_root"], "proof root changed after preflight start")
    job_id = state.get("job_id")
    require(isinstance(job_id, str) and job_id, "live state omitted job id")

    started = monotonic()
    status = run_json(["piqc", "status", job_id])
    timings["status_seconds"] = monotonic() - started
    require(status.get("status") == "completed", f"raw canary job is not completed: {status.get('status')}")
    require(status.get("result") == "SAT", f"raw canary job is not SAT: {status.get('result')}")
    require(status.get("cnf_blob_hash") == CANARY_SHA256, "raw canary status names the wrong blob")
    started = monotonic()
    stored_final = retrieve_and_hash(
        job_id,
        SCRATCH / ".piqd-large-cnf-capacity-preflight-stored-final.cnf",
    )
    timings["stored_reread_and_hash_seconds"] = monotonic() - started
    started = monotonic()
    model = run_json(["piqc", "job", "model", job_id])
    timings["model_seconds"] = monotonic() - started
    require(model.get("result") == "SAT", "raw canary model endpoint did not report SAT")
    assignment = require_complete_model(model.get("assignment"), VARIABLE_COUNT, "raw canary")
    require(1 in assignment, "raw canary model violates unit literal 1")
    require(model.get("num_assigned") == VARIABLE_COUNT, "raw canary model has wrong declared width")

    report: dict[str, Any] = {
        "artifact_kind": "piqd-large-cnf-capacity-preflight-live-final",
        "canary": local["canary"],
        "daemon": identity["version"],
        "finalized_at_utc": datetime.now(UTC).isoformat(),
        "job_id": job_id,
        "model": model,
        "proof_root": local["proof_root"],
        "solver": identity["solver"],
        "status": status,
        "stored_final": stored_final,
        "timings": timings,
        "valid": True,
    }
    atomic_json_write(FINAL_REPORT, report)
    print(json.dumps({"job_id": job_id, "report": str(FINAL_REPORT), "valid": True}, sort_keys=True))


def main() -> None:
    args = parse_args()
    if args.command == "static-check":
        print(json.dumps(static_check(), sort_keys=True))
    elif args.command == "start":
        start(args.expected_daemon_sha256, args.run_label)
    else:
        finalize(args.expected_daemon_sha256)


if __name__ == "__main__":
    main()
