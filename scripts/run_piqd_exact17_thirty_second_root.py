"""Hash-pinned, crash-recoverable PIQD runner for exact-17 child32.

The Lean-owned export is provisioned, but the runner remains fail-closed until
the immutable ingress manifest is minted and its hash is pinned.  The client
boundary is injected in tests; importing or checking this module never starts
a solver.
"""

from __future__ import annotations

import argparse
import base64
import fcntl
import hashlib
import json
import os
import re
import secrets
import stat
import subprocess
import tempfile
import urllib.parse
import urllib.request
from collections.abc import Callable
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Protocol

from validate_exact17_thirty_first_model_refinements_export import (
    UnprovisionedError,
    sha256_file,
    strict_json_read,
)
from validate_exact17_thirty_first_model_refinements_ingress import (
    PRODUCTION_INGRESS_PATHS,
    PRODUCTION_INGRESS_SPEC,
    IngressPaths,
    IngressSpec,
    validate_ingress,
)

ROOT = Path(__file__).resolve().parents[1]
@dataclass(frozen=True)
class RunnerPaths:
    ingress: IngressPaths
    intent: Path
    prepared: Path
    state: Path
    final: Path
    model: Path
    lock: Path


@dataclass(frozen=True)
class RunnerSpec:
    ingress: IngressSpec
    manifest_sha256: str | None
    root_sha256: str | None
    root_bytes: int | None
    variables: int
    clauses: int
    project: str = "erdos-97-96-exact17-child32"
    daemon_name: str = "piqd"
    daemon_version: str = "0.1.0"

    @property
    def provisioned(self) -> bool:
        return (
            self.ingress.export.provisioned
            and self.manifest_sha256 is not None
            and self.root_sha256 is not None
            and self.root_bytes is not None
            and self.root_sha256 == self.ingress.export.child_sha256
            and self.root_bytes == self.ingress.export.child_bytes
        )


PRODUCTION_RUNNER_PATHS = RunnerPaths(
    ingress=PRODUCTION_INGRESS_PATHS,
    intent=ROOT / "scratch/exact17-lean-to-sat/piqd-child32-intent.json",
    prepared=ROOT / "scratch/exact17-lean-to-sat/piqd-child32-prepared.json",
    state=ROOT / "scratch/exact17-lean-to-sat/piqd-child32-live-state.json",
    final=ROOT / "scratch/exact17-lean-to-sat/piqd-child32-final.json",
    model=ROOT / "scratch/exact17-lean-to-sat/piqd-child32-model.json",
    lock=ROOT / "scratch/exact17-lean-to-sat/piqd-child32-runner.lock",
)
PRODUCTION_RUNNER_SPEC = RunnerSpec(
    ingress=PRODUCTION_INGRESS_SPEC,
    manifest_sha256="f5da5c5bb0c5cbb7f1f95dd3230aef848ae62623330e9fecb5c62d9b66cba82e",
    root_sha256="c325d3eedda8fe81e3d1c1d70645024f5b9ea8c36c20ca5cd1896f0934296a7d",
    root_bytes=291620182,
    variables=PRODUCTION_INGRESS_SPEC.export.variables,
    clauses=PRODUCTION_INGRESS_SPEC.export.child_clauses,
)


class PiqdClient(Protocol):
    def version(self) -> dict[str, Any]: ...

    def solvers(self) -> dict[str, Any]: ...

    def submit(
        self,
        cnf: Path,
        manifest: Path,
        *,
        backend: str,
        profile: str,
        project: str,
    ) -> dict[str, Any]: ...

    def status(self, job_id: str) -> dict[str, Any]: ...

    def retrieve_cnf(self, job_id: str, destination: Path) -> None: ...

    def retrieve_blob(self, job_id: str, blob_hash: str, destination: Path) -> None: ...

    def confirm(self, job_id: str) -> dict[str, Any]: ...

    def model(self, job_id: str) -> dict[str, Any]: ...


def _strict_json_text(text: str) -> dict[str, Any]:
    def unique(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        value: dict[str, Any] = {}
        for key, item in pairs:
            if key in value:
                raise ValueError(f"duplicate JSON key: {key}")
            value[key] = item
        return value

    payload = json.loads(text, object_pairs_hook=unique)
    if not isinstance(payload, dict):
        raise TypeError("PIQD response is not a JSON object")
    return payload


class SubprocessPiqdClient:
    """Thin ``piqc`` adapter; all trust checks remain in the runner."""

    @staticmethod
    def _run(
        command: list[str], *, pass_fds: tuple[int, ...] = ()
    ) -> subprocess.CompletedProcess[str]:
        completed = subprocess.run(
            command,
            cwd=ROOT,
            text=True,
            capture_output=True,
            timeout=900,
            check=False,
            pass_fds=pass_fds,
        )
        if completed.returncode != 0:
            raise RuntimeError(
                f"PIQD command failed ({completed.returncode}): {' '.join(command)}\n"
                f"stdout tail: {completed.stdout[-1000:]}\n"
                f"stderr tail: {completed.stderr[-1000:]}"
            )
        return completed

    def _json(self, command: list[str]) -> dict[str, Any]:
        return _strict_json_text(self._run(command).stdout)

    def version(self) -> dict[str, Any]:
        return self._json(["piqc", "version"])

    def solvers(self) -> dict[str, Any]:
        return self._json(["piqc", "solvers"])

    def submit(
        self,
        cnf: Path,
        manifest: Path,
        *,
        backend: str,
        profile: str,
        project: str,
    ) -> dict[str, Any]:
        pass_fds = tuple(
            fd
            for path in (cnf, manifest)
            if (fd := _dev_fd_number(path)) is not None
        )
        completed = self._run(
            [
                "piqc",
                "job",
                "submit-cnf",
                str(cnf),
                "--backend",
                backend,
                "--project",
                project,
                "--solver-profile",
                profile,
                "--timeout",
                "3600",
                "--manifest",
                str(manifest),
            ],
            pass_fds=pass_fds,
        )
        response = _strict_json_text(completed.stdout)
        existing = response.get("existing")
        if existing not in {True, False}:
            raise ValueError("PIQD prepare response omitted exact existing status")
        return response

    def status(self, job_id: str) -> dict[str, Any]:
        return self._json(["piqc", "status", job_id])

    def retrieve_cnf(self, job_id: str, destination: Path) -> None:
        fd = _dev_fd_number(destination)
        self._run(
            ["piqc", "job", "cnf", job_id, "--out", str(destination)],
            pass_fds=() if fd is None else (fd,),
        )

    def retrieve_blob(self, job_id: str, blob_hash: str, destination: Path) -> None:
        base = os.environ.get("PIQD_URL", "http://127.0.0.1:7272").rstrip("/")
        url = (
            f"{base}/jobs/{urllib.parse.quote(job_id, safe='')}"
            f"/blobs/{urllib.parse.quote(blob_hash, safe='')}"
        )
        request = urllib.request.Request(url, method="GET")
        fd = _dev_fd_number(destination)
        if fd is None:
            with urllib.request.urlopen(request, timeout=900) as response:
                destination.write_bytes(response.read())
            return
        with urllib.request.urlopen(request, timeout=900) as response:
            while chunk := response.read(1024 * 1024):
                _write_all(fd, chunk)

    def confirm(self, job_id: str) -> dict[str, Any]:
        base = os.environ.get("PIQD_URL", "http://127.0.0.1:7272").rstrip("/")
        query = urllib.parse.urlencode({"job_id": job_id})
        request = urllib.request.Request(
            f"{base}/jobs/confirm?{query}", data=b"", method="POST"
        )
        with urllib.request.urlopen(request, timeout=900) as response:
            return _strict_json_text(response.read().decode("utf-8"))

    def model(self, job_id: str) -> dict[str, Any]:
        return self._json(["piqc", "job", "model", job_id])


IngressValidator = Callable[..., dict[str, Any]]


class UnreconciledPrepareError(RuntimeError):
    """A prepare may have happened remotely but has no attributable response."""


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def _dev_fd_number(path: Path) -> int | None:
    match = re.fullmatch(r"/dev/fd/(\d+)", str(path))
    return None if match is None else int(match.group(1))


def _write_all(descriptor: int, data: bytes) -> None:
    offset = 0
    while offset < len(data):
        written = os.write(descriptor, data[offset:])
        if written <= 0:
            raise OSError("short write to held file descriptor")
        offset += written


@dataclass(frozen=True)
class HeldSnapshot:
    descriptor: int
    path: Path
    sha256: str
    size: int

    def read_bytes(self) -> bytes:
        chunks: list[bytes] = []
        offset = 0
        while offset < self.size:
            chunk = os.pread(self.descriptor, min(1024 * 1024, self.size - offset), offset)
            if not chunk:
                raise ValueError("held snapshot truncated while reading")
            chunks.append(chunk)
            offset += len(chunk)
        return b"".join(chunks)


@contextmanager
def _anonymous_file(directory: Path):
    directory.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(
        dir=directory, prefix=".child32-held-", suffix=".tmp"
    )
    os.fchmod(descriptor, 0o600)
    os.unlink(temporary_name)
    try:
        yield descriptor, Path(f"/dev/fd/{descriptor}")
    finally:
        os.close(descriptor)


@contextmanager
def _held_snapshot(
    source: Path,
    directory: Path,
    *,
    expected_sha256: str,
    expected_bytes: int | None = None,
    expected_header: bytes | None = None,
):
    flags = os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0)
    source_descriptor = os.open(source, flags)
    try:
        source_stat = os.fstat(source_descriptor)
        _require(stat.S_ISREG(source_stat.st_mode), f"not a regular file: {source}")
        with _anonymous_file(directory) as (snapshot_descriptor, snapshot_path):
            digest = hashlib.sha256()
            size = 0
            while chunk := os.read(source_descriptor, 1024 * 1024):
                digest.update(chunk)
                _write_all(snapshot_descriptor, chunk)
                size += len(chunk)
            os.fsync(snapshot_descriptor)
            actual_sha256 = digest.hexdigest()
            _require(actual_sha256 == expected_sha256, f"snapshot SHA-256 drifted: {source}")
            if expected_bytes is not None:
                _require(size == expected_bytes, f"snapshot byte count drifted: {source}")
            if expected_header is not None:
                _require(
                    os.pread(snapshot_descriptor, len(expected_header), 0) == expected_header,
                    f"snapshot header drifted: {source}",
                )
            os.lseek(snapshot_descriptor, 0, os.SEEK_SET)
            yield HeldSnapshot(
                descriptor=snapshot_descriptor,
                path=snapshot_path,
                sha256=actual_sha256,
                size=size,
            )
    finally:
        os.close(source_descriptor)


def _immutable_json(path: Path, payload: dict[str, Any]) -> None:
    """Atomically publish one private JSON record without overwriting."""
    path.parent.mkdir(parents=True, exist_ok=True)
    rendered = (json.dumps(payload, indent=2, sort_keys=True) + "\n").encode()
    descriptor, temporary_name = tempfile.mkstemp(
        dir=path.parent, prefix=f".{path.name}.", suffix=".tmp"
    )
    temporary = Path(temporary_name)
    try:
        os.fchmod(descriptor, 0o600)
        with os.fdopen(descriptor, "wb") as handle:
            handle.write(rendered)
            handle.flush()
            os.fsync(handle.fileno())
        os.link(temporary, path)
        directory = os.open(path.parent, os.O_RDONLY)
        try:
            os.fsync(directory)
        finally:
            os.close(directory)
    finally:
        temporary.unlink(missing_ok=True)


@contextmanager
def _transaction_lock(path: Path):
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor = os.open(path, os.O_CREAT | os.O_RDWR, 0o600)
    try:
        fcntl.flock(descriptor, fcntl.LOCK_EX)
        yield
    finally:
        fcntl.flock(descriptor, fcntl.LOCK_UN)
        os.close(descriptor)


def expected_identity_hash(spec: RunnerSpec) -> str:
    if not spec.provisioned:
        raise UnprovisionedError("child32 PIQD runner is UNPROVISIONED")
    return hashlib.sha256(
        (
            "raw-dimacs/v1\n"
            f"{spec.ingress.backend}\n{spec.ingress.solver_profile}\n"
            f"{spec.root_sha256}\n{spec.manifest_sha256}"
        ).encode()
    ).hexdigest()


def validate_local(
    paths: RunnerPaths,
    spec: RunnerSpec,
    *,
    ingress_validator: IngressValidator = validate_ingress,
) -> dict[str, Any]:
    if not spec.provisioned:
        raise UnprovisionedError("child32 PIQD runner is UNPROVISIONED")
    report = ingress_validator(
        paths.ingress,
        spec=spec.ingress,
        expected_manifest_sha256=spec.manifest_sha256,
    )
    _require(report.get("status") == "PASS", "child32 ingress is not validated")
    root = paths.ingress.export.child
    manifest = paths.ingress.manifest
    _require(root.is_file(), "child32 root is missing")
    _require(manifest.is_file(), "child32 producer manifest is missing")
    _require(sha256_file(root) == spec.root_sha256, "child32 root SHA-256 drifted")
    _require(root.stat().st_size == spec.root_bytes, "child32 root byte count drifted")
    _require(
        sha256_file(manifest) == spec.manifest_sha256,
        "child32 producer manifest SHA-256 drifted",
    )
    with root.open("rb") as handle:
        header = handle.readline()
    _require(
        header == f"p cnf {spec.variables} {spec.clauses}\n".encode(),
        "child32 root header drifted",
    )
    return {
        "status": "PASS",
        "root_sha256": spec.root_sha256,
        "root_bytes": spec.root_bytes,
        "variables": spec.variables,
        "clauses": spec.clauses,
        "manifest_sha256": spec.manifest_sha256,
        "manifest_bytes": manifest.stat().st_size,
        "ingress_validation": report,
    }


def live_identity(client: PiqdClient, spec: RunnerSpec) -> dict[str, Any]:
    version = client.version()
    daemon = version.get("daemon")
    expected_daemon = {
        "name": spec.daemon_name,
        "version": spec.daemon_version,
        "protocol_version": spec.ingress.daemon_protocol_version,
        "sha256": spec.ingress.daemon_sha256,
    }
    _require(daemon == expected_daemon, "live PIQD daemon build/protocol drifted")
    registry = client.solvers()
    _require(registry.get("daemon") == daemon, "solver registry daemon mismatch")
    solvers = registry.get("solvers")
    _require(isinstance(solvers, list), "malformed solver registry")
    matches = [
        item
        for item in solvers
        if isinstance(item, dict) and item.get("name") == spec.ingress.solver_name
    ]
    _require(len(matches) == 1, "pinned PIQD solver is not unique")
    solver = matches[0]
    _require(solver.get("sha256") == spec.ingress.solver_sha256, "solver hash drifted")
    _require(
        solver.get("solver_signature") == spec.ingress.solver_signature,
        "solver signature drifted",
    )
    _require(
        solver.get("protocol_version") == spec.ingress.daemon_protocol_version,
        "solver protocol drifted",
    )
    registry_backend = solver.get("solver", solver.get("backend"))
    _require(registry_backend == spec.ingress.backend, "solver backend drifted")
    if "backend" in solver:
        _require(
            solver.get("backend") == spec.ingress.backend,
            "solver backend drifted",
        )
    _require(solver.get("lane") == "sat" and solver.get("usable") is True, "solver unusable")
    return {"version": version, "solver": solver}


def _check_job(
    status: dict[str, Any],
    job_id: str,
    spec: RunnerSpec,
    expected_status: str | frozenset[str],
) -> str:
    expected = {
        "id": job_id,
        "identity_hash": expected_identity_hash(spec),
        "cnf_blob_hash": spec.root_sha256,
        "producer_manifest_hash": spec.manifest_sha256,
        "producer_manifest_blob_hash": spec.manifest_sha256,
        "project": spec.project,
        "backend": spec.ingress.backend,
        "solver_profile": spec.ingress.solver_profile,
    }
    for key, value in expected.items():
        _require(status.get(key) == value, f"PIQD {key} crossed child32 identity")
    allowed = (
        frozenset({expected_status})
        if isinstance(expected_status, str)
        else expected_status
    )
    actual = status.get("status")
    _require(actual in allowed, "PIQD status crossed child32 lifecycle")
    assert isinstance(actual, str)
    return actual


def _check_prepare_response(
    response: dict[str, Any],
    job_id: str,
    spec: RunnerSpec,
    *,
    expected_existing: bool | None = None,
) -> None:
    expected = {
        "job_id": job_id,
        "cnf_blob_hash": spec.root_sha256,
        "identity_hash": expected_identity_hash(spec),
        "backend": spec.ingress.backend,
        "solver_profile": spec.ingress.solver_profile,
        "num_vars": spec.variables,
        "num_clauses": spec.clauses,
    }
    for key, value in expected.items():
        _require(response.get(key) == value, f"PIQD prepare {key} crossed child32 identity")
    existing = response.get("existing")
    _require(type(existing) is bool, "PIQD prepare omitted exact existing flag")
    if expected_existing is not None:
        _require(existing is expected_existing, "PIQD prepare existing flag drifted")


def _expected_binding(spec: RunnerSpec) -> dict[str, Any]:
    return {
        "identity_hash": expected_identity_hash(spec),
        "cnf_sha256": spec.root_sha256,
        "manifest_sha256": spec.manifest_sha256,
        "project": spec.project,
        "backend": spec.ingress.backend,
        "solver_profile": spec.ingress.solver_profile,
    }


def _expected_remote_report(spec: RunnerSpec, local: dict[str, Any]) -> dict[str, Any]:
    return {
        "cnf": {"bytes": spec.root_bytes, "sha256": spec.root_sha256},
        "producer_manifest": {
            "bytes": local["manifest_bytes"],
            "sha256": spec.manifest_sha256,
        },
    }


def _make_intent(
    spec: RunnerSpec,
    local: dict[str, Any],
    identity: dict[str, Any],
    manifest: HeldSnapshot,
) -> dict[str, Any]:
    return {
        "schema": "p97-exact17-child32-piqd-intent/v1",
        "phase": "submission_intent",
        "attempt_id": secrets.token_hex(32),
        "root": local,
        "daemon": identity["version"],
        "solver": identity["solver"],
        "binding": _expected_binding(spec),
        "manifest_bytes": manifest.size,
        "manifest_base64": base64.b64encode(manifest.read_bytes()).decode("ascii"),
    }


def _check_intent_record(
    intent: dict[str, Any],
    spec: RunnerSpec,
    local: dict[str, Any],
    identity: dict[str, Any],
) -> None:
    _require(
        intent.get("schema") == "p97-exact17-child32-piqd-intent/v1",
        "submission intent schema drifted",
    )
    _require(intent.get("phase") == "submission_intent", "submission intent phase drifted")
    attempt_id = intent.get("attempt_id")
    _require(
        isinstance(attempt_id, str) and re.fullmatch(r"[0-9a-f]{64}", attempt_id) is not None,
        "submission intent attempt ID drifted",
    )
    _require(intent.get("root") == local, "submission intent root identity drifted")
    _require(intent.get("daemon") == identity["version"], "submission intent daemon drifted")
    _require(intent.get("solver") == identity["solver"], "submission intent solver drifted")
    _require(intent.get("binding") == _expected_binding(spec), "submission intent binding drifted")
    encoded = intent.get("manifest_base64")
    _require(isinstance(encoded, str), "submission intent omitted producer manifest bytes")
    try:
        manifest = base64.b64decode(encoded, validate=True)
    except ValueError as error:
        raise ValueError("submission intent producer manifest is not canonical base64") from error
    _require(len(manifest) == intent.get("manifest_bytes"), "submission intent manifest size drifted")
    _require(
        hashlib.sha256(manifest).hexdigest() == spec.manifest_sha256,
        "submission intent manifest hash drifted",
    )


def _intent_manifest_bytes(intent: dict[str, Any]) -> bytes:
    encoded = intent.get("manifest_base64")
    _require(isinstance(encoded, str), "submission intent omitted producer manifest bytes")
    manifest = base64.b64decode(encoded, validate=True)
    _require(
        base64.b64encode(manifest).decode("ascii") == encoded,
        "submission intent producer manifest base64 is noncanonical",
    )
    return manifest


def _check_prepared_record(
    prepared: dict[str, Any],
    spec: RunnerSpec,
    local: dict[str, Any],
    identity: dict[str, Any],
    intent: dict[str, Any],
    intent_sha256: str,
) -> str:
    _require(
        prepared.get("schema") == "p97-exact17-child32-piqd-prepared/v3",
        "prepared custody schema drifted",
    )
    _require(prepared.get("phase") == "prepared", "prepared custody phase drifted")
    _require(prepared.get("root") == local, "prepared child32 root identity drifted")
    _require(prepared.get("daemon") == identity["version"], "prepared daemon drifted")
    _require(prepared.get("solver") == identity["solver"], "prepared solver drifted")
    _require(prepared.get("binding") == _expected_binding(spec), "prepared binding drifted")
    _require(prepared.get("intent") == intent, "prepared submission intent drifted")
    _require(
        prepared.get("intent_sha256") == intent_sha256,
        "prepared submission intent hash drifted",
    )
    job_id = prepared.get("job_id")
    _require(isinstance(job_id, str) and bool(job_id), "prepared record omitted job ID")
    submission_mode = prepared.get("submission_mode")
    submitted = prepared.get("submitted")
    if submission_mode == "created":
        _require(isinstance(submitted, dict), "prepared record omitted submit response")
        _check_prepare_response(submitted, job_id, spec, expected_existing=False)
    elif submission_mode == "reconciled_after_prepare_response_failure":
        _require(submitted is None, "reconciled prepared record invented a submit response")
    else:
        raise ValueError("prepared submission mode drifted")
    prepared_status = prepared.get("prepared_status")
    _require(isinstance(prepared_status, dict), "prepared record omitted PIQD status")
    _check_job(prepared_status, job_id, spec, "prepared")
    _check_optional_protocol_bindings(prepared_status, spec, identity)
    _require(
        prepared.get("stored_preconfirm") == _expected_remote_report(spec, local),
        "prepared stored input identity drifted",
    )
    return job_id


def _check_state_records(
    state: dict[str, Any],
    prepared: dict[str, Any],
    prepared_sha256: str,
    job_id: str,
    spec: RunnerSpec,
    identity: dict[str, Any],
    intent_sha256: str,
    local: dict[str, Any],
) -> None:
    _require(
        state.get("prepared_sha256") == prepared_sha256,
        "confirmed state no longer binds prepared custody bytes",
    )
    _require(state.get("prepared_record") == prepared, "confirmed state prepared record drifted")
    _require(
        state.get("intent_sha256") == intent_sha256,
        "confirmed state submission intent hash drifted",
    )
    _require(
        state.get("stored_recovery") == _expected_remote_report(spec, local),
        "confirmed state stored input identity drifted",
    )
    confirmation = state.get("confirmation")
    _require(isinstance(confirmation, dict), "state omitted confirmation evidence")
    method = confirmation.get("method")
    _require(method in {"direct", "status_recovery"}, "unknown confirmation method")
    if method == "direct":
        _require(
            confirmation.get("response")
            == {"job_id": job_id, "blob_hash": spec.root_sha256, "status": "confirmed"},
            "state confirmation identity drifted",
        )
    else:
        _require(
            confirmation.get("recovered_from") in {"confirmed", "running", "completed"},
            "state recovery did not witness a post-confirm status",
        )
    post_status = state.get("post_confirm_status")
    _require(isinstance(post_status, dict), "state omitted post-confirm PIQD status")
    actual = _check_job(
        post_status, job_id, spec, frozenset({"confirmed", "running", "completed"})
    )
    if method == "status_recovery":
        _require(
            confirmation.get("recovered_from") == actual,
            "state recovery status drifted",
        )
    _check_optional_protocol_bindings(post_status, spec, identity)


def _check_optional_protocol_bindings(
    payload: dict[str, Any], spec: RunnerSpec, identity: dict[str, Any] | None = None
) -> None:
    """Check identity/completion fields when a PIQD endpoint supplies them."""
    expected = {
        "cnf_sha256": spec.root_sha256,
        "manifest_sha256": spec.manifest_sha256,
        "project": spec.project,
        "backend": spec.ingress.backend,
        "profile": spec.ingress.solver_profile,
        "solver_profile": spec.ingress.solver_profile,
        "daemon_sha256": spec.ingress.daemon_sha256,
        "solver_sha256": spec.ingress.solver_sha256,
        "solver_signature": spec.ingress.solver_signature,
        "completion_identity_hash": expected_identity_hash(spec),
        "completion_status": "completed",
        "job_status": "completed",
    }
    if identity is not None:
        expected["daemon"] = identity["version"].get("daemon")
        expected["solver"] = identity["solver"]
    for key, value in expected.items():
        if key in payload:
            _require(payload.get(key) == value, f"PIQD {key} crossed child32 identity")


def _sha256_descriptor(descriptor: int, size: int) -> str:
    digest = hashlib.sha256()
    offset = 0
    while offset < size:
        chunk = os.pread(descriptor, min(1024 * 1024, size - offset), offset)
        if not chunk:
            raise ValueError("held artifact truncated while hashing")
        digest.update(chunk)
        offset += len(chunk)
    return digest.hexdigest()


@contextmanager
def _retrieved_snapshot(
    directory: Path,
    retrieve: Callable[[Path], None],
    *,
    expected_sha256: str,
    expected_bytes: int | None = None,
):
    with _anonymous_file(directory) as (descriptor, path):
        retrieve(path)
        os.fsync(descriptor)
        size = os.fstat(descriptor).st_size
        if expected_bytes is not None:
            _require(size == expected_bytes, "stored artifact byte count drifted")
        digest = _sha256_descriptor(descriptor, size)
        _require(digest == expected_sha256, "stored artifact hash drifted")
        os.lseek(descriptor, 0, os.SEEK_SET)
        yield HeldSnapshot(descriptor=descriptor, path=path, sha256=digest, size=size)


@contextmanager
def _remote_inputs(
    client: PiqdClient,
    job_id: str,
    spec: RunnerSpec,
    directory: Path,
):
    with _retrieved_snapshot(
        directory,
        lambda destination: client.retrieve_cnf(job_id, destination),
        expected_sha256=spec.root_sha256,
        expected_bytes=spec.root_bytes,
    ) as cnf, _retrieved_snapshot(
        directory,
        lambda destination: client.retrieve_blob(
            job_id, str(spec.manifest_sha256), destination
        ),
        expected_sha256=str(spec.manifest_sha256),
    ) as manifest:
        yield cnf, manifest


def _remote_report(cnf: HeldSnapshot, manifest: HeldSnapshot) -> dict[str, Any]:
    return {
        "cnf": {"bytes": cnf.size, "sha256": cnf.sha256},
        "producer_manifest": {
            "bytes": manifest.size,
            "sha256": manifest.sha256,
        },
    }


def _snapshot_matches_bytes(snapshot: HeldSnapshot, expected: bytes) -> bool:
    return snapshot.size == len(expected) and snapshot.read_bytes() == expected


def _snapshot_equals(left: HeldSnapshot, right: HeldSnapshot) -> bool:
    if left.size != right.size or left.sha256 != right.sha256:
        return False
    offset = 0
    while offset < left.size:
        width = min(1024 * 1024, left.size - offset)
        if os.pread(left.descriptor, width, offset) != os.pread(
            right.descriptor, width, offset
        ):
            return False
        offset += width
    return True


POST_CONFIRM_STATUSES = frozenset({"confirmed", "running", "completed"})


def _finish_prepared(
    client: PiqdClient,
    paths: RunnerPaths,
    spec: RunnerSpec,
    local: dict[str, Any],
    identity: dict[str, Any],
    prepared: dict[str, Any],
    intent: dict[str, Any],
    intent_sha256: str,
    *,
    stored_current: dict[str, Any] | None = None,
) -> dict[str, Any]:
    job_id = _check_prepared_record(
        prepared, spec, local, identity, intent, intent_sha256
    )
    current_status = client.status(job_id)
    lifecycle = _check_job(
        current_status,
        job_id,
        spec,
        frozenset({"prepared"}) | POST_CONFIRM_STATUSES,
    )
    _check_optional_protocol_bindings(current_status, spec, identity)
    if stored_current is None:
        with _remote_inputs(client, job_id, spec, paths.state.parent) as (
            remote_cnf,
            remote_manifest,
        ):
            _require(
                _snapshot_matches_bytes(remote_manifest, _intent_manifest_bytes(intent)),
                "resumed PIQD producer manifest bytes drifted",
            )
            stored = _remote_report(remote_cnf, remote_manifest)
    else:
        stored = stored_current
    _require(
        stored == _expected_remote_report(spec, local),
        "resumed PIQD job no longer stores the child32 inputs",
    )
    if lifecycle == "prepared":
        confirmed = client.confirm(job_id)
        _require(
            confirmed
            == {"job_id": job_id, "blob_hash": spec.root_sha256, "status": "confirmed"},
            "PIQD confirmed the wrong child32 job/root",
        )
        confirmation = {"method": "direct", "response": confirmed}
        post_status = client.status(job_id)
        _check_job(post_status, job_id, spec, POST_CONFIRM_STATUSES)
        _check_optional_protocol_bindings(post_status, spec, identity)
    else:
        confirmation = {"method": "status_recovery", "recovered_from": lifecycle}
        post_status = current_status
    state = {
        "schema": "p97-exact17-child32-piqd-state/v3",
        "phase": "confirmed",
        "job_id": job_id,
        "root": local,
        "daemon": identity["version"],
        "solver": identity["solver"],
        "binding": _expected_binding(spec),
        "intent_sha256": intent_sha256,
        "prepared_sha256": sha256_file(paths.prepared),
        "prepared_record": prepared,
        "stored_recovery": stored,
        "confirmation": confirmation,
        "post_confirm_status": post_status,
    }
    _immutable_json(paths.state, state)
    return state


def start(
    client: PiqdClient,
    paths: RunnerPaths = PRODUCTION_RUNNER_PATHS,
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
    *,
    ingress_validator: IngressValidator = validate_ingress,
) -> dict[str, Any]:
    with _transaction_lock(paths.lock):
        if paths.state.exists() or paths.final.exists() or paths.model.exists():
            raise FileExistsError("refusing stale child32 confirmed/final artifact reuse")
        local = validate_local(paths, spec, ingress_validator=ingress_validator)
        identity = live_identity(client, spec)
        if paths.prepared.exists():
            _require(paths.intent.is_file(), "prepared custody omitted submission intent")
            intent = strict_json_read(paths.intent)
            _check_intent_record(intent, spec, local, identity)
            prepared = strict_json_read(paths.prepared)
            return _finish_prepared(
                client,
                paths,
                spec,
                local,
                identity,
                prepared,
                intent,
                sha256_file(paths.intent),
            )
        if paths.intent.exists():
            intent = strict_json_read(paths.intent)
            _check_intent_record(intent, spec, local, identity)
            raise UnreconciledPrepareError(
                "submission intent exists without an attributable PIQD response; "
                "refusing resubmit until an intent-token reconciliation contract exists"
            )
        header = f"p cnf {spec.variables} {spec.clauses}\n".encode()
        with _held_snapshot(  # noqa: SIM117 -- keep both submission snapshots scoped
            paths.ingress.export.child,
            paths.intent.parent,
            expected_sha256=str(spec.root_sha256),
            expected_bytes=spec.root_bytes,
            expected_header=header,
        ) as root_snapshot:
            with _held_snapshot(
                paths.ingress.manifest,
                paths.intent.parent,
                expected_sha256=str(spec.manifest_sha256),
                expected_bytes=local["manifest_bytes"],
            ) as manifest_snapshot:
                intent = _make_intent(spec, local, identity, manifest_snapshot)
                _immutable_json(paths.intent, intent)
                intent_sha256 = sha256_file(paths.intent)
                response = client.submit(
                    root_snapshot.path,
                    manifest_snapshot.path,
                    backend=spec.ingress.backend,
                    profile=spec.ingress.solver_profile,
                    project=spec.project,
                )
                _require(isinstance(response, dict), "malformed PIQD prepare response")
                job_id = response.get("job_id")
                _require(isinstance(job_id, str) and bool(job_id), "PIQD omitted job ID")
                _check_prepare_response(response, job_id, spec, expected_existing=False)
                prepared_status = client.status(job_id)
                _check_job(prepared_status, job_id, spec, "prepared")
                _check_optional_protocol_bindings(prepared_status, spec, identity)
                with _remote_inputs(client, job_id, spec, paths.state.parent) as (
                    remote_cnf,
                    remote_manifest,
                ):
                    _require(
                        _snapshot_equals(remote_cnf, root_snapshot),
                        "PIQD stored CNF bytes differ from the submitted snapshot",
                    )
                    _require(
                        _snapshot_equals(remote_manifest, manifest_snapshot),
                        "PIQD stored producer manifest differs from the submitted snapshot",
                    )
                    stored = _remote_report(remote_cnf, remote_manifest)
                prepared = {
                    "schema": "p97-exact17-child32-piqd-prepared/v3",
                    "phase": "prepared",
                    "job_id": job_id,
                    "root": local,
                    "daemon": identity["version"],
                    "solver": identity["solver"],
                    "binding": _expected_binding(spec),
                    "intent_sha256": intent_sha256,
                    "intent": intent,
                    "submission_mode": "created",
                    "submitted": response,
                    "prepared_status": prepared_status,
                    "stored_preconfirm": stored,
                }
                _immutable_json(paths.prepared, prepared)
                return _finish_prepared(
                    client,
                    paths,
                    spec,
                    local,
                    identity,
                    prepared,
                    intent,
                    intent_sha256,
                    stored_current=stored,
                )


def reconcile_prepared_job(
    client: PiqdClient,
    job_id: str,
    paths: RunnerPaths = PRODUCTION_RUNNER_PATHS,
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
    *,
    ingress_validator: IngressValidator = validate_ingress,
) -> dict[str, Any]:
    """Recover one known prepare whose response was lost after intent persistence."""
    with _transaction_lock(paths.lock):
        _require(bool(job_id), "reconciliation omitted PIQD job ID")
        if paths.prepared.exists() or paths.state.exists() or paths.final.exists() or paths.model.exists():
            raise FileExistsError("refusing reconciliation over existing child32 custody")
        _require(paths.intent.is_file(), "reconciliation requires persisted submission intent")
        local = validate_local(paths, spec, ingress_validator=ingress_validator)
        identity = live_identity(client, spec)
        intent = strict_json_read(paths.intent)
        _check_intent_record(intent, spec, local, identity)
        intent_sha256 = sha256_file(paths.intent)
        prepared_status = client.status(job_id)
        _check_job(prepared_status, job_id, spec, "prepared")
        _check_optional_protocol_bindings(prepared_status, spec, identity)

        header = f"p cnf {spec.variables} {spec.clauses}\n".encode()
        with _held_snapshot(  # noqa: SIM117 -- compare both immutable inputs together
            paths.ingress.export.child,
            paths.intent.parent,
            expected_sha256=str(spec.root_sha256),
            expected_bytes=spec.root_bytes,
            expected_header=header,
        ) as root_snapshot:
            with _held_snapshot(
                paths.ingress.manifest,
                paths.intent.parent,
                expected_sha256=str(spec.manifest_sha256),
                expected_bytes=local["manifest_bytes"],
            ) as manifest_snapshot:
                _require(
                    _snapshot_matches_bytes(manifest_snapshot, _intent_manifest_bytes(intent)),
                    "current producer manifest differs from persisted intent bytes",
                )
                with _remote_inputs(client, job_id, spec, paths.state.parent) as (
                    remote_cnf,
                    remote_manifest,
                ):
                    _require(
                        _snapshot_equals(remote_cnf, root_snapshot),
                        "reconciled PIQD CNF differs from intended child32 snapshot",
                    )
                    _require(
                        _snapshot_equals(remote_manifest, manifest_snapshot),
                        "reconciled PIQD manifest differs from intended child32 snapshot",
                    )
                    stored = _remote_report(remote_cnf, remote_manifest)

        prepared = {
            "schema": "p97-exact17-child32-piqd-prepared/v3",
            "phase": "prepared",
            "job_id": job_id,
            "root": local,
            "daemon": identity["version"],
            "solver": identity["solver"],
            "binding": _expected_binding(spec),
            "intent_sha256": intent_sha256,
            "intent": intent,
            "submission_mode": "reconciled_after_prepare_response_failure",
            "submitted": None,
            "prepared_status": prepared_status,
            "stored_preconfirm": stored,
        }
        _immutable_json(paths.prepared, prepared)
        return _finish_prepared(
            client,
            paths,
            spec,
            local,
            identity,
            prepared,
            intent,
            intent_sha256,
            stored_current=stored,
        )


def replay_model(path: Path, assignment: object, spec: RunnerSpec) -> dict[str, Any]:
    _require(isinstance(assignment, list), "SAT assignment is not a list")
    _require(
        len(assignment) == spec.variables
        and all(type(literal) is int and literal != 0 for literal in assignment),
        "SAT assignment has wrong width or literals",
    )
    _require(
        {abs(literal) for literal in assignment} == set(range(1, spec.variables + 1)),
        "SAT assignment does not bind every variable exactly once",
    )
    true_literals = set(assignment)
    checked = 0
    with path.open("r", encoding="ascii") as handle:
        _require(
            handle.readline() == f"p cnf {spec.variables} {spec.clauses}\n",
            "CNF changed before model replay",
        )
        for line in handle:
            literals = [int(token) for token in line.split()]
            _require(literals and literals[-1] == 0, "malformed replay clause")
            _require(any(item in true_literals for item in literals[:-1]), "model falsifies root")
            checked += 1
    _require(checked == spec.clauses, "model replay clause count drifted")
    return {"clauses_checked": checked, "satisfies_all": True}


def finalize(
    client: PiqdClient,
    paths: RunnerPaths = PRODUCTION_RUNNER_PATHS,
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
    *,
    ingress_validator: IngressValidator = validate_ingress,
) -> dict[str, Any]:
    with _transaction_lock(paths.lock):
        if not paths.state.is_file():
            raise FileNotFoundError("missing confirmed child32 state")
        if not paths.prepared.is_file():
            raise FileNotFoundError("missing prepared child32 custody record")
        if not paths.intent.is_file():
            raise FileNotFoundError("missing child32 submission intent")
        if paths.final.exists() or paths.model.exists():
            raise FileExistsError("refusing stale child32 final/model reuse")
        local = validate_local(paths, spec, ingress_validator=ingress_validator)
        identity = live_identity(client, spec)
        intent = strict_json_read(paths.intent)
        _check_intent_record(intent, spec, local, identity)
        intent_sha256 = sha256_file(paths.intent)
        prepared = strict_json_read(paths.prepared)
        prepared_job_id = _check_prepared_record(
            prepared, spec, local, identity, intent, intent_sha256
        )
        prepared_sha256 = sha256_file(paths.prepared)
        state = strict_json_read(paths.state)
        _require(
            state.get("schema") == "p97-exact17-child32-piqd-state/v3",
            "confirmed child32 state schema drifted",
        )
        _require(state.get("phase") == "confirmed", "child32 job was not confirmed")
        _require(state.get("root") == local, "confirmed child32 root identity drifted")
        _require(state.get("daemon") == identity["version"], "daemon changed after confirmation")
        _require(state.get("solver") == identity["solver"], "solver changed after confirmation")
        binding = state.get("binding")
        expected_binding = _expected_binding(spec)
        _require(binding == expected_binding, "confirmed child32 binding drifted")
        job_id = state.get("job_id")
        _require(isinstance(job_id, str) and bool(job_id), "state omitted child32 job ID")
        _require(job_id == prepared_job_id, "prepared and confirmed job IDs crossed")
        _check_state_records(
            state,
            prepared,
            prepared_sha256,
            job_id,
            spec,
            identity,
            intent_sha256,
            local,
        )
        status = client.status(job_id)
        _check_job(status, job_id, spec, "completed")
        _check_optional_protocol_bindings(status, spec, identity)
        _require(
            status.get("daemon_sha256") == spec.ingress.daemon_sha256,
            "completed job omitted or crossed the deciding daemon build",
        )
        result = status.get("result")
        with _remote_inputs(client, job_id, spec, paths.final.parent) as (
            remote_cnf,
            remote_manifest,
        ):
            _require(
                _snapshot_matches_bytes(remote_manifest, _intent_manifest_bytes(intent)),
                "final PIQD producer manifest bytes drifted",
            )
            stored = _remote_report(remote_cnf, remote_manifest)
            report: dict[str, Any] = {
                "schema": "p97-exact17-child32-piqd-final/v2",
                "job_id": job_id,
                "result": result,
                "binding": expected_binding,
                "completion_status": status,
                "stored_final": stored,
                "daemon": identity["version"],
                "deciding_daemon_sha256": status["daemon_sha256"],
                "solver": identity["solver"],
            }
            if result == "SAT":
                model = client.model(job_id)
                _require(model.get("job_id") == job_id, "model crossed child32 job identity")
                _require(model.get("result") == "SAT", "model endpoint is not SAT")
                _require(model.get("num_assigned") == spec.variables, "model width drifted")
                expected_model_binding = {
                    "cnf_blob_hash": spec.root_sha256,
                    "producer_manifest_hash": spec.manifest_sha256,
                    "identity_hash": expected_identity_hash(spec),
                }
                for key, value in expected_model_binding.items():
                    _require(model.get(key) == value, f"model {key} crossed child32 identity")
                _check_optional_protocol_bindings(model, spec, identity)
                replay = replay_model(remote_cnf.path, model.get("assignment"), spec)
                model_record = {
                    "schema": "p97-exact17-child32-piqd-model/v2",
                    "job_id": job_id,
                    "cnf_sha256": spec.root_sha256,
                    "manifest_sha256": spec.manifest_sha256,
                    "completion_identity_hash": status.get("identity_hash"),
                    "model": model,
                    "replay": replay,
                }
                _immutable_json(paths.model, model_record)
                report.update(
                    {
                        "model_sha256": sha256_file(paths.model),
                        "model_replay": replay,
                        "next_gate": "mandatory_general_theorem_search",
                    }
                )
            elif result == "UNSAT":
                report.update(
                    {
                        "proof_replay_complete": False,
                        "next_gate": "retrieve_clause_map_and_proof_then_independently_replay",
                    }
                )
            else:
                raise ValueError("completed PIQD job has no proof-relevant result")
        _immutable_json(paths.final, report)
        return report


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "command", choices=("static-check", "start", "reconcile", "finalize")
    )
    parser.add_argument("--job-id")
    args = parser.parse_args()
    client = SubprocessPiqdClient()
    if args.command == "static-check":
        payload = {
            "root": validate_local(PRODUCTION_RUNNER_PATHS, PRODUCTION_RUNNER_SPEC),
            "identity": live_identity(client, PRODUCTION_RUNNER_SPEC),
        }
    elif args.command == "start":
        payload = start(client)
    elif args.command == "reconcile":
        if not args.job_id:
            parser.error("reconcile requires --job-id")
        payload = reconcile_prepared_job(client, args.job_id)
    else:
        payload = finalize(client)
    print(json.dumps(payload, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
