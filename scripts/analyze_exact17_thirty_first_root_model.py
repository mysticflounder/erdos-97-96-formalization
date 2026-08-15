"""Authenticate and decode the exact-17 child-31 SAT model.

The older C--G analyzer emitted ``PASS`` after checking only a CNF hash.  This
entry point keeps the decoded fields used by the historical bank, but binds a
production result to the complete SAT response identity (CNF, model bytes,
and PIQD job id).  An ingress manifest is a pre-solve artifact: it authenticates
the immutable CNF and daemon lane, but does not claim ownership of the later
SAT response.  A terminal artifact can be supplied to bind that response too.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import uuid
from pathlib import Path
from typing import Any

AUTHORIZED_CNF_SHA256 = "3c847c1ebcacf85256b65d54563584a8b89eb50f427fe268e2f916d4cdafa204"
AUTHORIZED_MODEL_SHA256 = "21b1ff04c42920daf9db259dda3ce966b82164ef64d3e2f1d3fa90538f280791"
AUTHORIZED_JOB_ID = "53044c24-da6c-4fdd-9f50-f4f539891383"
AUTHORIZED_DAEMON_SHA256 = "aa47e2ff3000890d11da79296721f0f51c3a228d4ef8446af3c3d2a73d969107"
PROJECT = "erdos-97-96-formalization"
VARIABLE_COUNT = 308
CLAUSE_COUNT = 5_846_904
POINT_COUNT = 17


def expected_identity_hash(
    *, cnf_sha256: str, manifest_sha256: str, backend: str, solver_profile: str
) -> str:
    """Recompute piqd's raw-DIMACS identity from its bound fields."""

    return hashlib.sha256(
        f"raw-dimacs/v1\n{backend}\n{solver_profile}\n{cnf_sha256}\n{manifest_sha256}".encode()
    ).hexdigest()


def reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def load_json_bytes(data: bytes, *, source: str) -> dict[str, Any]:
    value = json.loads(data.decode("utf-8"), object_pairs_hook=reject_duplicate_keys)
    if not isinstance(value, dict):
        raise TypeError(f"expected a JSON object in {source}")
    return value


def read_json(path: Path) -> tuple[dict[str, Any], str]:
    data = path.read_bytes()
    return load_json_bytes(data, source=str(path)), hashlib.sha256(data).hexdigest()


def load_assignment(
    path: Path,
    *,
    expected_sha256: str | None = None,
    expected_job_id: str | None = None,
) -> tuple[dict[int, bool], str, str]:
    """Read and authenticate one complete PIQD signed-literal model."""

    payload, model_sha256 = read_json(path)
    if expected_sha256 is not None and model_sha256 != expected_sha256:
        raise ValueError(f"unauthorized model SHA-256: {model_sha256}")
    if set(payload) != {"assignment", "job_id", "num_assigned", "result"}:
        raise ValueError("model schema must contain exactly the PIQD SAT fields")
    if payload["result"] != "SAT":
        raise ValueError(f"expected SAT model, got {payload['result']!r}")
    job_id = payload["job_id"]
    if not isinstance(job_id, str):
        raise TypeError("model job_id must be a string")
    try:
        uuid.UUID(job_id)
    except ValueError as exc:
        raise ValueError("model job_id is not a UUID") from exc
    if expected_job_id is not None and job_id != expected_job_id:
        raise ValueError(f"unexpected model job_id: {job_id}")
    if type(payload["num_assigned"]) is not int or payload["num_assigned"] != VARIABLE_COUNT:
        raise ValueError("model num_assigned does not match the exact SAT schema")
    raw = payload["assignment"]
    if not isinstance(raw, list) or len(raw) != VARIABLE_COUNT:
        raise ValueError("model assignment is not a complete 308-literal list")
    assignment: dict[int, bool] = {}
    for literal in raw:
        if type(literal) is not int or literal == 0:
            raise ValueError(f"invalid assignment literal: {literal!r}")
        variable = abs(literal)
        if not 1 <= variable <= VARIABLE_COUNT or variable in assignment:
            raise ValueError(f"assignment is not unique and in range: {literal!r}")
        assignment[variable] = literal > 0
    if set(assignment) != set(range(1, VARIABLE_COUNT + 1)):
        raise ValueError("assignment is not total")
    return assignment, model_sha256, job_id


def replay_cnf(
    path: Path,
    assignment: dict[int, bool],
    *,
    authorized_sha256: str = AUTHORIZED_CNF_SHA256,
    clause_count: int = CLAUSE_COUNT,
) -> tuple[str, int, int]:
    """Hash and replay the exact same immutable byte buffer."""

    data = path.read_bytes()
    actual_sha = hashlib.sha256(data).hexdigest()
    if actual_sha != authorized_sha256:
        raise ValueError(f"unauthorized CNF SHA-256: {actual_sha}")
    variables: int | None = None
    declared_clauses: int | None = None
    observed_clauses = 0
    pending: list[int] = []
    for line_number, raw_line in enumerate(data.splitlines(), start=1):
        line = raw_line.decode("ascii").strip()
        if not line or line.startswith("c"):
            continue
        if line.startswith("p"):
            parts = line.split()
            if parts[:2] != ["p", "cnf"] or len(parts) != 4 or variables is not None:
                raise ValueError(f"invalid DIMACS header at line {line_number}")
            variables, declared_clauses = int(parts[2]), int(parts[3])
            continue
        if variables is None:
            raise ValueError(f"clause before DIMACS header at line {line_number}")
        for token in line.split():
            literal = int(token)
            if literal == 0:
                if not pending:
                    raise ValueError(f"empty clause at line {line_number}")
                if not any(assignment[abs(item)] == (item > 0) for item in pending):
                    raise ValueError(f"assignment falsifies clause {observed_clauses + 1}")
                observed_clauses += 1
                pending.clear()
            else:
                if abs(literal) > variables or literal == 0:
                    raise ValueError(f"literal out of range at line {line_number}")
                pending.append(literal)
    if pending:
        raise ValueError("unterminated final clause")
    if variables != VARIABLE_COUNT or declared_clauses != clause_count:
        raise ValueError(f"unexpected header: variables={variables}, clauses={declared_clauses}")
    if observed_clauses != declared_clauses:
        raise ValueError("DIMACS clause count mismatch")
    return actual_sha, variables, observed_clauses


def validate_ingress_manifest(
    manifest: dict[str, Any],
    *,
    manifest_sha256: str,
    cnf_sha256: str,
    variables: int,
    clauses: int,
    model_sha256: str,
) -> dict[str, Any]:
    """Authenticate pre-solve custody without misbinding its validation model.

    ``validation.model_sha256`` in the historical ingress manifest identifies
    the producer's motivating/parent model, not the later PIQD response.  Only
    an explicit top-level (or ``piqd``-level) ``model_sha256`` is a declaration
    about this response and is therefore compared here.
    """

    dimacs = manifest.get("dimacs")
    if not isinstance(dimacs, dict) or dimacs.get("sha256") != cnf_sha256:
        raise ValueError("manifest is not pinned to the replayed CNF")
    if dimacs.get("variables") != variables or dimacs.get("clauses") != clauses:
        raise ValueError("manifest dimensions do not match replay")
    piqd = manifest.get("piqd")
    if not isinstance(piqd, dict):
        raise TypeError("manifest has no PIQD ingress identity")
    if piqd.get("daemon_protocol_version") != 1:
        raise ValueError("manifest daemon protocol is not pinned")
    if piqd.get("daemon_sha256") != AUTHORIZED_DAEMON_SHA256:
        raise ValueError("manifest daemon identity is not pinned")
    if piqd.get("ingress") != "raw-dimacs/v1":
        raise ValueError("manifest is not a raw-DIMACS ingress")
    if piqd.get("backend") != "cadical" or piqd.get("solver_profile") != "sat":
        raise ValueError("manifest solver lane is not pinned")

    declared_model = manifest.get("model_sha256", piqd.get("model_sha256"))
    if declared_model is not None and declared_model != model_sha256:
        raise ValueError("manifest model declaration does not match response")
    return {
        "manifest_sha256": manifest_sha256,
        "cnf_sha256": cnf_sha256,
        "daemon_sha256": piqd["daemon_sha256"],
        "model_declaration": declared_model is not None,
    }


def validate_terminal_artifact(
    terminal: dict[str, Any],
    *,
    terminal_sha256: str,
    manifest_sha256: str | None,
    cnf_sha256: str,
    model_sha256: str,
    job_id: str,
) -> dict[str, Any]:
    """Bind a post-solve final artifact to every available identity field."""

    if terminal.get("artifact_kind") != "p97-exact17-thirty-first-root-piqd-final/v1":
        raise ValueError("unexpected terminal artifact kind")
    if terminal.get("job_id") != job_id or terminal.get("result") != "SAT":
        raise ValueError("terminal artifact job/result mismatch")
    if terminal.get("model_sha256") != model_sha256:
        raise ValueError("terminal artifact model hash mismatch")
    root = terminal.get("root")
    status = terminal.get("status")
    if not isinstance(root, dict) or not isinstance(status, dict):
        raise TypeError("terminal artifact lacks root/status identity")
    if (
        root.get("sha256") != cnf_sha256
        or root.get("variables") != VARIABLE_COUNT
        or root.get("clauses") != CLAUSE_COUNT
    ):
        raise ValueError("terminal artifact CNF identity mismatch")
    if status.get("id") != job_id or status.get("cnf_blob_hash") != cnf_sha256:
        raise ValueError("terminal status identity mismatch")
    if status.get("result") != "SAT" or status.get("backend") != "cadical":
        raise ValueError("terminal status solver lane mismatch")
    if status.get("project") != PROJECT:
        raise ValueError("terminal status project mismatch")
    producer_manifest_hash = status.get("producer_manifest_hash")
    if not isinstance(producer_manifest_hash, str) or len(producer_manifest_hash) != 64:
        raise ValueError("terminal producer manifest hash is missing")
    if root.get("manifest_sha256") != producer_manifest_hash:
        raise ValueError("terminal root manifest hash mismatch")
    if manifest_sha256 is not None and producer_manifest_hash != manifest_sha256:
        raise ValueError("terminal status manifest hash mismatch")
    if status.get("producer_manifest_blob_hash") != producer_manifest_hash:
        raise ValueError("terminal producer manifest blob hash mismatch")
    if not isinstance(status.get("identity_hash"), str) or not status["identity_hash"]:
        raise ValueError("terminal status identity hash is missing")
    daemon = terminal.get("daemon")
    daemon_info = daemon.get("daemon") if isinstance(daemon, dict) else None
    if not isinstance(daemon_info, dict) or daemon_info.get("sha256") != AUTHORIZED_DAEMON_SHA256:
        raise ValueError("terminal daemon identity mismatch")

    # The terminal status does not carry a separate solver_profile field.  The
    # current terminal schema exposes enough equivalent data in the solver
    # object (solver/backend and lane/profile), so recompute the identity from
    # those bound fields.  Older terminal records may omit that object; they
    # remain structurally useful diagnostics but cannot claim this identity.
    solver = terminal.get("solver")
    if solver is None:
        identity_authenticated = False
        identity_limitation = (
            "terminal schema omits solver backend/profile fields; "
            "identity_hash was not independently recomputed"
        )
    elif not isinstance(solver, dict):
        raise TypeError("terminal solver identity is malformed")
    else:
        if solver.get("solver") != status.get("backend") or solver.get("lane") != "sat":
            raise ValueError("terminal solver identity does not match status")
        expected_identity = expected_identity_hash(
            cnf_sha256=cnf_sha256,
            manifest_sha256=producer_manifest_hash,
            backend=status["backend"],
            solver_profile=solver["lane"],
        )
        if status["identity_hash"] != expected_identity:
            raise ValueError("terminal identity hash mismatch")
        identity_authenticated = True
        identity_limitation = None
    return {
        "terminal_artifact_sha256": terminal_sha256,
        "identity_hash": status["identity_hash"],
        "producer_manifest_hash": producer_manifest_hash,
        "daemon_sha256": daemon_info["sha256"],
        "identity_authenticated": identity_authenticated,
        "identity_limitation": identity_limitation,
    }


def production_authentication_status(
    terminal_auth: dict[str, Any] | None,
) -> bool:
    """Return true only for a terminal artifact with a checked solver identity."""
    return terminal_auth is not None and terminal_auth.get("identity_authenticated") is True


def decode(assignment: dict[int, bool]) -> dict[str, Any]:
    rows = {
        str(center): [point for point in range(POINT_COUNT) if assignment[1 + POINT_COUNT * center + point]]
        for center in range(POINT_COUNT)
    }
    return {
        "rows": rows,
        "row_sizes": {center: len(points) for center, points in rows.items()},
        "diagonal_hits": [center for center in range(POINT_COUNT) if center in rows[str(center)]],
        "next_centers": [center for center in range(POINT_COUNT) if assignment[290 + center]],
        "named_orders": [order for order in range(2) if assignment[307 + order]],
    }


def atomic_write(path: Path, content: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.tmp.{os.getpid()}.{uuid.uuid4().hex}")
    fd = os.open(temporary, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o600)
    try:
        with os.fdopen(fd, "wb") as stream:
            stream.write(content)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, path)
        directory = os.open(path.parent, os.O_RDONLY)
        try:
            os.fsync(directory)
        finally:
            os.close(directory)
    finally:
        temporary.unlink(missing_ok=True)


def validate_production_anchors(args: argparse.Namespace) -> None:
    """Reject CLI substitutions that would relabel a non-production run."""

    expected = {
        "authorized-sha256": (args.authorized_sha256, AUTHORIZED_CNF_SHA256),
        "authorized-model-sha256": (args.authorized_model_sha256, AUTHORIZED_MODEL_SHA256),
        "authorized-job-id": (args.authorized_job_id, AUTHORIZED_JOB_ID),
        "clause-count": (args.clause_count, CLAUSE_COUNT),
    }
    changed = [name for name, (actual, pinned) in expected.items() if actual != pinned]
    if changed:
        raise ValueError(
            "production anchor override rejected: " + ", ".join(changed)
        )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--model", type=Path, required=True)
    parser.add_argument("--authorized-sha256", default=AUTHORIZED_CNF_SHA256)
    parser.add_argument("--authorized-model-sha256", default=AUTHORIZED_MODEL_SHA256)
    parser.add_argument("--authorized-job-id", default=AUTHORIZED_JOB_ID)
    parser.add_argument("--clause-count", type=int, default=CLAUSE_COUNT)
    parser.add_argument("--manifest", type=Path)
    parser.add_argument("--terminal-artifact", type=Path)
    parser.add_argument("--output", type=Path)
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    validate_production_anchors(args)
    assignment, model_sha256, job_id = load_assignment(
        args.model,
        expected_sha256=args.authorized_model_sha256,
        expected_job_id=args.authorized_job_id,
    )
    cnf_sha256, variables, clauses = replay_cnf(
        args.cnf,
        assignment,
        authorized_sha256=args.authorized_sha256,
        clause_count=args.clause_count,
    )
    manifest_auth: dict[str, Any] | None = None
    manifest_sha256: str | None = None
    if args.manifest is not None:
        manifest, manifest_sha256 = read_json(args.manifest)
        manifest_auth = validate_ingress_manifest(
            manifest,
            manifest_sha256=manifest_sha256,
            cnf_sha256=cnf_sha256,
            variables=variables,
            clauses=clauses,
            model_sha256=model_sha256,
        )
    terminal_auth: dict[str, Any] | None = None
    terminal_sha256: str | None = None
    if args.terminal_artifact is not None:
        terminal, terminal_sha256 = read_json(args.terminal_artifact)
        terminal_auth = validate_terminal_artifact(
            terminal,
            terminal_sha256=terminal_sha256,
            manifest_sha256=manifest_sha256,
            cnf_sha256=cnf_sha256,
            model_sha256=model_sha256,
            job_id=job_id,
        )
    model_binding = "terminal-artifact" if terminal_auth is not None else "explicit-model-sha256"
    terminal_identity_authenticated = (
        terminal_auth["identity_authenticated"] if terminal_auth is not None else None
    )
    terminal_identity_limitation = (
        terminal_auth["identity_limitation"] if terminal_auth is not None else
        "terminal artifact was not supplied; terminal identity was not independently recomputed"
    )
    result = {
        "status": "PASS",
        "diagnostic_status": "PASS",
        # A model hash/job id proves only the response bytes.  Production use
        # additionally requires the independently authenticated terminal
        # completion identity; without it this report is diagnostic-only.
        "production_authenticated": production_authentication_status(terminal_auth),
        "authentication": {
            "scheme": "piqd-sat-response+ingress/v1",
            "cnf_sha256": cnf_sha256,
            "model_sha256": model_sha256,
            "job_id": job_id,
            "manifest": str(args.manifest) if args.manifest is not None else None,
            "manifest_sha256": manifest_sha256,
            "manifest_identity": manifest_auth,
            "terminal_artifact": str(args.terminal_artifact) if args.terminal_artifact is not None else None,
            "terminal_artifact_sha256": terminal_sha256,
            "model_binding": model_binding,
            "terminal_identity_authenticated": terminal_identity_authenticated,
            "terminal_identity_limitation": terminal_identity_limitation,
        },
        "cnf_sha256": cnf_sha256,
        "model_sha256": model_sha256,
        "job_id": job_id,
        "variables": variables,
        "clauses": clauses,
        **decode(assignment),
    }
    rendered = (json.dumps(result, indent=2, sort_keys=True) + "\n").encode("utf-8")
    if args.output is None:
        print(rendered.decode("utf-8"), end="")
    else:
        atomic_write(args.output, rendered)
        print(json.dumps({"status": result["status"], "output": str(args.output)}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
