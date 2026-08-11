"""Create-once, one-worker projected-static-v3 producer custody.

This module is intentionally a small adapter around the public raw-DIMACS
client.  It owns no solver, process, thread, shard, or theorem machinery.
"""

from __future__ import annotations

import json
import math
import os
import stat
import time
import urllib.parse
import uuid
from collections.abc import Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.p97_search import phase3_piqd_projected_v3_provisioning as provisioning
from census.p97_search import phase3_piqd_projected_v3_qualification as qualification
from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes
from census.p97_search.phase3_piqd_oracle import (
    HttpResponse,
    PiqdOracleError,
    PiqdRawDimacsClient,
    PreparedJob,
    Transport,
)

SCHEMA = "p97-piqd-projected-static-v3-producer-result/v1"
PREPARED_SCHEMA = "p97-piqd-projected-static-v3-prepared-artifact/v1"
CONFIRM_INTENT_SCHEMA = "p97-piqd-projected-static-v3-confirm-intent/v1"
CONFIRM_STATE_SCHEMA = "p97-piqd-projected-static-v3-confirm-state/v1"
CLAIMS = {
    "piqd_proof_verified": False,
    "piqd_closure": False,
    "proof_verified": False,
    "theorem_coverage": False,
    "global_obstruction": False,
    "universal_lift": False,
    "lean_closure": False,
    "source_entitlement": False,
    "one_process": False,
    "one_core": False,
    "session_one_core": False,
    "session_one_thread": False,
    "session_cpu_affinity": False,
}
RAW_NAMES = {
    "prepare": "prepare-response.raw",
    "cnf": "cnf-response.raw",
    "confirm": "confirm-response.raw",
    "version": "daemon-version.raw",
    "solvers": "solver-registry.raw",
}
STATIC_NAMES = frozenset(
    {
        provisioning.BASE_CNF_NAME,
        provisioning.VARIABLE_MAP_NAME,
        provisioning.SOURCE_BUNDLE_NAME,
        provisioning.ENCODING_CONFIGURATION_NAME,
        provisioning.SOURCE_MANIFEST_NAME,
        provisioning.PRODUCER_MANIFEST_NAME,
        provisioning.WAVE_MANIFEST_NAME,
    }
)
RESULT_KEYS = frozenset(
    {
        "schema",
        "job_id",
        "requested_core_limit",
        "poll_count",
        "poll_interval_s",
        "cnf_blob_sha256",
        "raw_dimacs_identity",
        "producer_manifest_sha256",
        "static_artifact_sha256",
        "prepared_artifact_sha256",
        "prepare_response_sha256",
        "cnf_response_sha256",
        "confirm_response_sha256",
        "status_response_sha256s",
        "status_files",
        "confirm_intent_sha256",
        "confirm_state_sha256",
        "confirm_response_status",
        "terminal_status_sha256",
        "daemon_version_sha256",
        "solver_registry_sha256",
        "solver_name",
        "attested_solver_processes",
        "attestation_basis",
        "claims",
        "result_sha256",
    }
)


class ProducerError(RuntimeError):
    """The producer contract or local custody is unsafe."""


@dataclass(frozen=True)
class ProducerPolicy:
    max_polls: int = 300
    poll_interval_s: float = 2.0

    def __post_init__(self) -> None:
        if type(self.max_polls) is not int or not 1 <= self.max_polls <= 10_000:
            raise ProducerError("max_polls must be a builtin integer in 1..10000")
        if (
            type(self.poll_interval_s) not in {int, float}
            or not math.isfinite(self.poll_interval_s)
            or self.poll_interval_s < 0
        ):
            raise ProducerError("poll_interval_s must be a nonnegative number")


@dataclass(frozen=True)
class ProducerResult:
    directory: Path
    result_path: Path
    job_id: str
    polls: int


def _json(raw: bytes, label: str) -> dict[str, Any]:
    try:
        value = json.loads(raw, object_pairs_hook=_reject_duplicates)
    except (UnicodeDecodeError, ValueError, RecursionError) as exc:
        raise ProducerError(f"{label} is not valid JSON") from exc
    if type(value) is not dict:
        raise ProducerError(f"{label} is not an exact JSON object")
    return value


def _canonical_json(raw: bytes, label: str) -> dict[str, Any]:
    value = _json(raw, label)
    try:
        canonical = canonical_json_bytes(value)
    except (TypeError, ValueError, OverflowError) as exc:
        raise ProducerError(f"{label} contains unsupported JSON values") from exc
    if canonical != raw:
        raise ProducerError(f"{label} is not canonical JSON bytes")
    return value


def _uuid(value: object, label: str) -> str:
    if type(value) is not str:
        raise ProducerError(f"{label} is not a strict UUID")
    try:
        parsed = uuid.UUID(value)
    except ValueError as exc:
        raise ProducerError(f"{label} is not a strict UUID") from exc
    if str(parsed) != value:
        raise ProducerError(f"{label} is not a canonical UUID")
    return value


def _digest(value: object, label: str) -> str:
    if type(value) is not str or len(value) != 64 or value != value.lower():
        raise ProducerError(f"{label} is not a SHA-256 digest")
    try:
        int(value, 16)
    except ValueError as exc:
        raise ProducerError(f"{label} is not a SHA-256 digest") from exc
    return value


def _reject_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    value: dict[str, Any] = {}
    for key, item in pairs:
        if key in value:
            raise ValueError(f"duplicate key {key}")
        value[key] = item
    return value


def _sha(raw: bytes) -> str:
    return sha256_bytes(raw)


def _read_local(
    path: Path, *, maximum: int = 1 << 30, dir_fd: int | None = None
) -> bytes:
    path = Path(os.path.abspath(os.fspath(path)))
    flags = os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0)
    try:
        name = path.name if dir_fd is not None else path
        fd = os.open(name, flags, dir_fd=dir_fd)
    except OSError as exc:
        raise ProducerError(f"cannot open custody file {path.name}") from exc
    try:
        before = os.fstat(fd)
        if (
            not stat.S_ISREG(before.st_mode)
            or before.st_nlink != 1
            or before.st_uid != os.getuid()
            or stat.S_IMODE(before.st_mode) != 0o600
        ):
            raise ProducerError(f"custody file {path.name} has unsafe identity or mode")
        if before.st_size < 0 or before.st_size > maximum:
            raise ProducerError(f"custody file {path.name} is too large")
        chunks: list[bytes] = []
        remaining = before.st_size + 1
        while remaining:
            chunk = os.read(fd, remaining)
            if not chunk:
                break
            chunks.append(chunk)
            remaining -= len(chunk)
        raw = b"".join(chunks)
        after = os.fstat(fd)
        visible = os.stat(name, dir_fd=dir_fd, follow_symlinks=False)
        if len(raw) != before.st_size or before.st_size != after.st_size:
            raise ProducerError(f"custody file {path.name} changed during read")
        if (
            after.st_nlink != 1
            or after.st_uid != os.getuid()
            or stat.S_IMODE(after.st_mode) != 0o600
            or visible.st_ino != before.st_ino
            or visible.st_nlink != 1
            or visible.st_uid != os.getuid()
            or stat.S_IMODE(visible.st_mode) != 0o600
        ):
            raise ProducerError(f"custody file {path.name} lost identity or mode")
        return raw
    finally:
        os.close(fd)


def _write_new_at(directory_fd: int, name: str, raw: bytes) -> None:
    if (
        type(name) is not str
        or not name
        or Path(name).name != name
        or type(raw) is not bytes
    ):
        raise ProducerError("custody name or payload is invalid")
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0)
    try:
        fd = os.open(name, flags, 0o600, dir_fd=directory_fd)
    except OSError as exc:
        raise ProducerError(f"cannot create custody file {name}") from exc
    try:
        before = os.fstat(fd)
        if (
            not stat.S_ISREG(before.st_mode)
            or before.st_nlink != 1
            or before.st_uid != os.getuid()
            or stat.S_IMODE(before.st_mode) != 0o600
        ):
            raise ProducerError(f"created custody file {name} is unsafe")
        view = memoryview(raw)
        while view:
            count = os.write(fd, view)
            if count <= 0:
                raise ProducerError("custody write made no progress")
            view = view[count:]
        os.fsync(fd)
        after = os.fstat(fd)
        visible = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        if (
            after.st_nlink != 1
            or after.st_uid != os.getuid()
            or stat.S_IMODE(after.st_mode) != 0o600
            or visible.st_ino != before.st_ino
            or visible.st_nlink != 1
            or visible.st_uid != os.getuid()
            or stat.S_IMODE(visible.st_mode) != 0o600
        ):
            raise ProducerError(f"created custody file {name} lost identity or mode")
    finally:
        os.close(fd)


def _write_new(path: Path, raw: bytes) -> None:
    """Create one file for small unit tests and bootstrap fixtures."""

    parent_fd = os.open(
        path.parent,
        os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0),
    )
    try:
        _write_new_at(parent_fd, path.name, raw)
    finally:
        os.close(parent_fd)


class _Custody:
    def __init__(self, path: Path, *, resume: bool) -> None:
        self.path = Path(os.path.abspath(os.fspath(path)))
        self._fd: int | None = None
        self._identity: tuple[int, int, int] | None = None
        if resume:
            flags = (
                os.O_RDONLY
                | getattr(os, "O_DIRECTORY", 0)
                | getattr(os, "O_NOFOLLOW", 0)
            )
            try:
                self._fd = os.open(self.path, flags)
            except OSError as exc:
                raise ProducerError(
                    "resume output directory cannot be opened safely"
                ) from exc
            info = os.fstat(self._fd)
            if (
                not stat.S_ISDIR(info.st_mode)
                or info.st_uid != os.getuid()
                or stat.S_IMODE(info.st_mode) != 0o700
            ):
                os.close(self._fd)
                raise ProducerError("resume output directory is unsafe")
            self._identity = (info.st_dev, info.st_ino, info.st_uid)
            self._revalidate()
            self._secure = None
        else:
            try:
                self._secure = provisioning._SecureOutput(self.path)
            except provisioning.ProvisioningError as exc:
                raise ProducerError(str(exc)) from exc

    def write(self, name: str, raw: bytes) -> None:
        if self._secure is not None:
            try:
                self._secure.write(name, raw)
            except provisioning.ProvisioningError as exc:
                raise ProducerError(str(exc)) from exc
        else:
            self._revalidate()
            assert self._fd is not None
            _write_new_at(self._fd, name, raw)
            self._revalidate()

    def read(self, name: str, maximum: int = 1 << 30) -> bytes:
        directory_fd = self._directory_fd()
        if directory_fd is None:
            return _read_local(self.path / name, maximum=maximum)
        return _read_local(Path(name), maximum=maximum, dir_fd=directory_fd)

    def close(self) -> None:
        if self._secure is not None:
            self._secure.close()
        elif self._fd is not None:
            try:
                self._revalidate()
                os.fsync(self._fd)
            finally:
                os.close(self._fd)
                self._fd = None

    def _revalidate(self) -> None:
        if self._fd is None or self._identity is None:
            return
        held = os.fstat(self._fd)
        visible = os.lstat(self.path)
        if (
            (held.st_dev, held.st_ino, held.st_uid) != self._identity
            or (visible.st_dev, visible.st_ino, visible.st_uid) != self._identity
            or not stat.S_ISDIR(held.st_mode)
            or held.st_uid != os.getuid()
            or stat.S_IMODE(held.st_mode) != 0o700
        ):
            raise ProducerError("resume output directory identity or mode changed")

    def _directory_fd(self) -> int | None:
        if self._fd is not None:
            self._revalidate()
            return self._fd
        if self._secure is not None:
            try:
                self._secure._revalidate()
            except provisioning.ProvisioningError as exc:
                raise ProducerError(str(exc)) from exc
            return self._secure.descriptor
        return None


def _optional_read(
    custody: _Custody, name: str, maximum: int = 1 << 30
) -> bytes | None:
    """Read a custody member, distinguishing only a genuine missing member."""

    try:
        directory_fd = custody._directory_fd()
        if directory_fd is None:
            os.stat(custody.path / name, follow_symlinks=False)
        else:
            os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
    except FileNotFoundError:
        return None
    except OSError as exc:
        raise ProducerError(f"cannot inspect custody file {name}") from exc
    return custody.read(name, maximum)


def _required_resume_prepare_custody(custody: _Custody) -> tuple[bytes, bytes]:
    """Require the authenticated post-prepare evidence before resume."""

    missing: list[str] = []
    prepare_raw = _optional_read(custody, RAW_NAMES["prepare"], 1 << 20)
    if prepare_raw is None:
        missing.append(RAW_NAMES["prepare"])
    prepared_raw = _optional_read(custody, provisioning.PREPARED_JOB_NAME, 1 << 20)
    if prepared_raw is None:
        missing.append(provisioning.PREPARED_JOB_NAME)
    if missing:
        raise ProducerError(
            "incomplete pre-prepare custody is not resumable; "
            f"missing {', '.join(missing)}; "
            "a fresh absent output directory is required"
        )
    assert prepare_raw is not None
    assert prepared_raw is not None
    return prepare_raw, prepared_raw


class _RecordingTransport:
    def __init__(self, inner: Transport, custody: _Custody) -> None:
        self.inner = inner
        self.custody = custody
        self.status_index = 0
        try:
            names = os.listdir(custody._directory_fd() or custody.path)
        except OSError as exc:
            raise ProducerError("cannot enumerate status custody") from exc
        indices = []
        for name in names:
            if name.startswith("status-") and name.endswith(".raw"):
                try:
                    indices.append(int(name[7:-4]))
                except ValueError as exc:
                    raise ProducerError(
                        "status custody has an invalid filename"
                    ) from exc
        if indices:
            self.status_index = max(indices) + 1
        self.confirm_posts = 0
        self.confirm_response_status: int | None = None

    def __call__(
        self, method: str, url: str, body: object, headers: Mapping[str, str]
    ) -> HttpResponse:
        if method == "POST" and "/jobs/confirm" in urllib.parse.urlsplit(url).path:
            self.confirm_posts += 1
            if self.confirm_posts != 1:
                raise ProducerError("confirm mutation was attempted more than once")
        response = self.inner(method, url, body, headers)
        if type(response) is not HttpResponse or type(response.body) is not bytes:
            raise ProducerError("transport did not return an exact HttpResponse")
        path = urllib.parse.urlsplit(url).path
        if method == "POST" and path == "/jobs/confirm":
            self.confirm_response_status = response.status
        name: str | None = None
        if method == "POST" and path == "/jobs/prepare-cnf":
            name = RAW_NAMES["prepare"]
        elif method == "GET" and path.endswith("/cnf"):
            name = RAW_NAMES["cnf"]
        elif method == "POST" and path == "/jobs/confirm":
            name = RAW_NAMES["confirm"]
        elif method == "GET" and path == "/version":
            name = RAW_NAMES["version"]
        elif method == "GET" and path == "/solvers":
            name = RAW_NAMES["solvers"]
        elif method == "GET" and path.startswith("/jobs/"):
            name = f"status-{self.status_index:03d}.raw"
            self.status_index += 1
        if name is not None:
            self.custody.write(name, response.body)
        return response


def _prepared_value(job: PreparedJob, *, preview: str) -> dict[str, Any]:
    value = {
        "schema": PREPARED_SCHEMA,
        "job_id": job.job_id,
        "backend": job.backend,
        "solver_profile": job.solver_profile,
        "cnf_blob_hash": job.cnf_blob_hash,
        "identity_hash": job.identity_hash,
        "num_vars": job.num_vars,
        "num_clauses": job.num_clauses,
        "existing": job.existing,
        "requested_core_limit": job.requested_core_limit,
        "preview": preview,
    }
    return value


def _check_prepared_artifact(value: Mapping[str, Any], *, bundle: Any) -> PreparedJob:
    expected = {
        "schema",
        "job_id",
        "backend",
        "solver_profile",
        "cnf_blob_hash",
        "identity_hash",
        "num_vars",
        "num_clauses",
        "existing",
        "requested_core_limit",
        "preview",
    }
    if set(value) != expected or value["schema"] != PREPARED_SCHEMA:
        raise ProducerError("prepared artifact schema is not exact")
    _check_prepare(
        {
            key: value[key]
            for key in (
                "job_id",
                "existing",
                "cnf_blob_hash",
                "identity_hash",
                "num_vars",
                "num_clauses",
                "preview",
                "requested_core_limit",
            )
        },
        bundle=bundle,
    )
    if type(value["backend"]) is not str or type(value["solver_profile"]) is not str:
        raise ProducerError("prepared artifact solver profile is malformed")
    if value["backend"] != "cadical" or value["solver_profile"] != "sat":
        raise ProducerError("prepared artifact solver profile is crossed")
    if type(value["num_vars"]) is not int or type(value["num_clauses"]) is not int:
        raise ProducerError("prepared artifact dimensions are not builtin integers")
    return PreparedJob(
        value["job_id"],
        value["backend"],
        value["solver_profile"],
        value["cnf_blob_hash"],
        value["identity_hash"],
        value["num_vars"],
        value["num_clauses"],
        value["existing"],
        value["requested_core_limit"],
    )


def _validate_static_custody(custody: _Custody, *, bundle: Any) -> None:
    expected = {
        provisioning.BASE_CNF_NAME: bundle.base_cnf,
        provisioning.VARIABLE_MAP_NAME: bundle.variable_map,
        provisioning.SOURCE_BUNDLE_NAME: bundle.source_bundle,
        provisioning.ENCODING_CONFIGURATION_NAME: bundle.encoding_configuration,
        provisioning.SOURCE_MANIFEST_NAME: bundle.source_manifest,
        provisioning.PRODUCER_MANIFEST_NAME: bundle.producer_manifest,
        provisioning.WAVE_MANIFEST_NAME: canonical_json_bytes(
            provisioning.build_current_unsharded_projected_v3_wave_manifest(bundle)
        ),
    }
    for name, raw in expected.items():
        if custody.read(name, 1 << 30) != raw:
            raise ProducerError(f"static artifact {name} is crossed")


def _check_prepare(
    value: Mapping[str, Any],
    *,
    bundle: Any,
) -> None:
    expected = {
        "job_id",
        "existing",
        "cnf_blob_hash",
        "identity_hash",
        "num_vars",
        "num_clauses",
        "preview",
        "requested_core_limit",
    }
    if set(value) != expected:
        raise ProducerError("prepare response schema is not exact")
    _uuid(value["job_id"], "prepare response UUID")
    if type(value["existing"]) is not bool:
        raise ProducerError("prepare response existing flag is invalid")
    if value["existing"]:
        raise ProducerError(
            "prepare response reports an existing job; refusing confirm"
        )
    if (
        type(value["requested_core_limit"]) is not int
        or value["requested_core_limit"] != 1
    ):
        raise ProducerError("prepare response is not the authenticated one-core job")
    if type(value["preview"]) is not str:
        raise ProducerError("prepare response preview is malformed")
    if type(value["num_vars"]) is not int or type(value["num_clauses"]) is not int:
        raise ProducerError("prepare response dimensions are malformed")
    preview = bundle.base_cnf[
        : qualification.PRODUCTION_V3_PREPARE_PREVIEW_BYTES
    ].decode("utf-8", errors="replace")
    if value["preview"] != preview or value["cnf_blob_hash"] != bundle.base_cnf_sha256:
        raise ProducerError("prepare response does not bind the current base")
    _digest(value["cnf_blob_hash"], "prepare CNF hash")
    _digest(value["identity_hash"], "prepare raw identity")
    if value["identity_hash"] != bundle.raw_dimacs_identity:
        raise ProducerError("prepare response raw identity is crossed")
    if (
        value["num_vars"] != bundle.num_variables
        or value["num_clauses"] != bundle.num_clauses
    ):
        raise ProducerError("prepare response dimensions are crossed")


def _terminal_status(
    value: dict[str, Any], *, job: dict[str, Any], bundle: Any
) -> None:
    try:
        provisioning._validate_job(
            value,
            job_id=job["job_id"],
            prepared=job,
            producer_manifest_hash=bundle.producer_manifest_sha256,
        )
    except provisioning.ProvisioningError as exc:
        raise ProducerError(str(exc)) from exc
    if (
        value["cnf_blob_hash"] != bundle.base_cnf_sha256
        or value["identity_hash"] != bundle.raw_dimacs_identity
    ):
        raise ProducerError("terminal status identity is crossed")


def _status_names(custody: _Custody) -> list[str]:
    try:
        names = os.listdir(custody._directory_fd() or custody.path)
    except OSError as exc:
        raise ProducerError("cannot enumerate status custody") from exc
    selected: list[tuple[int, str]] = []
    for name in names:
        if (
            name.startswith("status-")
            or name.endswith(".raw")
            and name not in RAW_NAMES.values()
        ):
            if not name.startswith("status-"):
                continue
            suffix = name[7:-4] if name.endswith(".raw") else ""
            if len(suffix) != 3 or not suffix.isdigit():
                raise ProducerError("status custody has an invalid filename")
            selected.append((int(suffix), name))
    selected.sort()
    if [index for index, _ in selected] != list(range(len(selected))):
        raise ProducerError("status custody poll sequence is not contiguous")
    return [name for _, name in selected]


def _validate_inventory(custody: _Custody, *, completed: bool = False) -> None:
    fixed = (
        set(STATIC_NAMES)
        | set(RAW_NAMES.values())
        | {
            provisioning.PREPARED_JOB_NAME,
            "confirm-intent.json",
            "confirm-state.json",
        }
    )
    if completed:
        fixed.add("producer-result.json")
    try:
        names = set(os.listdir(custody._directory_fd() or custody.path))
    except OSError as exc:
        raise ProducerError("cannot enumerate custody inventory") from exc
    unknown = names - fixed
    for name in list(unknown):
        if name.startswith("status-") and name.endswith(".raw"):
            unknown.remove(name)
    if unknown:
        raise ProducerError(
            f"custody inventory has unexpected entries: {sorted(unknown)!r}"
        )


def _check_confirm_intent(value: Mapping[str, Any], *, job_id: str) -> None:
    if set(value) != {"schema", "job_id"} or value["schema"] != CONFIRM_INTENT_SCHEMA:
        raise ProducerError("confirm intent schema is not exact")
    if value["job_id"] != _uuid(job_id, "confirm intent UUID"):
        raise ProducerError("confirm intent UUID is crossed")


def _check_confirm_state(value: Mapping[str, Any], *, job_id: str) -> None:
    if (
        set(value) != {"schema", "job_id", "state", "confirm_http_status"}
        or value["schema"] != CONFIRM_STATE_SCHEMA
    ):
        raise ProducerError("confirm state schema is not exact")
    if value["job_id"] != _uuid(job_id, "confirm state UUID"):
        raise ProducerError("confirm state UUID is crossed")
    if type(value["state"]) is not str or value["state"] not in {
        "confirmed",
        "running",
        "completed",
        "failed",
    }:
        raise ProducerError("confirm state is not authenticated")
    if type(value["confirm_http_status"]) is not int or value[
        "confirm_http_status"
    ] not in {200, 409}:
        raise ProducerError("confirm HTTP status is not authenticated")


def _check_confirm_response(value: Mapping[str, Any], *, job_id: str) -> None:
    if (
        set(value) != {"job_id", "status"}
        or value["job_id"] != job_id
        or value["status"] != "confirmed"
    ):
        raise ProducerError("confirm response is crossed")


def _check_confirm_evidence(raw: bytes, *, http_status: int, job_id: str) -> None:
    if http_status == 200:
        _check_confirm_response(_canonical_json(raw, "confirm response"), job_id=job_id)
    elif http_status == 409:
        if type(raw) is not bytes or not raw:
            raise ProducerError("HTTP 409 confirm evidence is empty")
    else:
        raise ProducerError("confirm HTTP status is not authenticated")


def _check_lifecycle_status(
    value: Mapping[str, Any], *, job_id: str, prepared: Mapping[str, Any], bundle: Any
) -> None:
    required = qualification.JOB_STATUS_KEYS | qualification.JOB_STATUS_V3_CUSTODY_KEYS
    allowed = required | qualification.JOB_STATUS_OPTIONAL_KEYS
    if set(value) - allowed or not required <= set(value):
        raise ProducerError("status response schema is not exact")
    if value["id"] != _uuid(job_id, "status UUID"):
        raise ProducerError("status response UUID is crossed")
    if type(value["status"]) is not str or value["status"] not in {
        "queued",
        "running",
        "confirmed",
        "completed",
        "failed",
    }:
        raise ProducerError("status response lifecycle state is invalid")
    if type(value["result"]) not in {str, type(None)}:
        raise ProducerError("status response result type is invalid")
    if value["result"] is not None and value["result"] not in {
        "SAT",
        "UNSAT",
        "UNKNOWN",
    }:
        raise ProducerError("status response result is invalid")
    if (
        value["status"] in {"queued", "running", "confirmed"}
        and value["result"] is not None
    ):
        raise ProducerError("nonterminal status has a terminal result")
    if value["status"] == "completed" and value["result"] is None:
        raise ProducerError("completed status has no result")
    for key in ("backend", "project", "wall_human", "attestation_basis"):
        if type(value[key]) is not str:
            raise ProducerError(f"status response {key} type is invalid")
    for key in (
        "timeout_s",
        "march_timeout_s",
        "wall_ms",
        "created_at",
        "confirmed_at",
        "started_at",
        "completed_at",
        "requested_core_limit",
        "attested_solver_processes",
    ):
        if type(value[key]) is not int or value[key] < 0:
            raise ProducerError(f"status response {key} type is invalid")
    if (
        value["timeout_s"] < 1
        or value["march_timeout_s"] < 1
        or value["requested_core_limit"] != 1
        or value["attested_solver_processes"] != 1
    ):
        raise ProducerError("status response one-core lifecycle contract is invalid")
    if value["attestation_basis"] != "SINGLE_PROCESS_NO_PARALLEL_FLAG":
        raise ProducerError("status response process attestation is invalid")
    if [
        value[key]
        for key in ("created_at", "confirmed_at", "started_at", "completed_at")
    ] != sorted(
        value[key]
        for key in ("created_at", "confirmed_at", "started_at", "completed_at")
    ):
        raise ProducerError("status response lifecycle timestamps are out of order")
    if value["running_for_s"] is not None and (
        type(value["running_for_s"]) is not int or value["running_for_s"] < 0
    ):
        raise ProducerError("status response running_for_s type is invalid")
    if value["model_blob_hash"] is not None:
        _digest(value["model_blob_hash"], "status model blob hash")
    if (
        value["status"] == "completed"
        and value["result"] == "SAT"
        and (value["running_for_s"] is not None or value["model_blob_hash"] is not None)
    ):
        raise ProducerError("completed SAT status has inconsistent terminal fields")
    for key, expected in (
        ("cnf_blob_hash", bundle.base_cnf_sha256),
        ("identity_hash", bundle.raw_dimacs_identity),
        ("producer_manifest_hash", bundle.producer_manifest_sha256),
    ):
        _digest(value[key], f"status {key}")
        if value[key] != expected:
            raise ProducerError(f"status {key} is crossed")
    for key in ("log_tail",):
        if key in value and type(value[key]) is not str:
            raise ProducerError(f"status response {key} type is invalid")
    if "log_size_bytes" in value and (
        type(value["log_size_bytes"]) is not int or value["log_size_bytes"] < 0
    ):
        raise ProducerError("status response log_size_bytes type is invalid")
    if "progress" in value:
        progress = value["progress"]
        if (
            type(progress) is not dict
            or set(progress) != qualification.JOB_PROGRESS_KEYS
        ):
            raise ProducerError("status response progress schema is not exact")
        if (
            progress["backend"] != value["backend"]
            or type(progress["solver_started"]) is not bool
        ):
            raise ProducerError("status response progress is crossed")
        if (
            progress["spawn_failure"] is not None
            and type(progress["spawn_failure"]) is not str
        ):
            raise ProducerError("status response spawn failure type is invalid")
        for key in ("last_line", "solver_version"):
            if progress[key] is not None and type(progress[key]) is not str:
                raise ProducerError(f"status response progress {key} type is invalid")
        for key in (
            "cubes_total",
            "cubes_done",
            "cubes_sat",
            "cubes_unsat",
            "cubes_unknown",
            "decisions",
            "conflicts",
            "restarts",
            "elapsed_s",
        ):
            if progress[key] is not None and (
                type(progress[key]) is not int or progress[key] < 0
            ):
                raise ProducerError(f"status response progress {key} type is invalid")
        if (
            value["status"] == "completed"
            and value["result"] == "SAT"
            and (
                progress["solver_started"] is not True
                or progress["spawn_failure"] is not None
            )
        ):
            raise ProducerError("completed SAT status process controls are invalid")
    if value["backend"] != prepared["backend"]:
        raise ProducerError("status response backend is crossed")


def _check_status_sequence(
    custody: _Custody, *, job_id: str, prepared: Mapping[str, Any], bundle: Any
) -> tuple[list[str], dict[str, Any]]:
    names = _status_names(custody)
    if not names:
        raise ProducerError("custody has no raw status")
    last: dict[str, Any] | None = None
    for name in names:
        value = _canonical_json(custody.read(name, 1 << 20), "status response")
        _check_lifecycle_status(value, job_id=job_id, prepared=prepared, bundle=bundle)
        last = value
    assert last is not None
    return names, last


def _current_bundle() -> Any:
    try:
        bundle = provisioning.build_current_unsharded_projected_v3_bundle()
        authenticated = provisioning.static.authenticate_static_manifests(
            source_manifest=bundle.source_manifest,
            producer_manifest=bundle.producer_manifest,
        )
        if (
            authenticated.source_bytes != bundle.source_manifest
            or authenticated.producer_bytes != bundle.producer_manifest
            or bundle.raw_dimacs_identity
            != provisioning.raw_dimacs_identity(
                backend=authenticated.producer["backend"],
                solver_profile=authenticated.producer["solver_profile"],
                cnf_sha256=bundle.base_cnf_sha256,
                producer_manifest_sha256=authenticated.producer_sha256,
                requested_core_limit=1,
            )
        ):
            raise ProducerError("current bundle manifest or raw identity is crossed")
    except (
        qualification.QualificationError,
        provisioning.ProvisioningError,
        provisioning.static.StaticPiqdRunnerError,
    ) as exc:
        raise ProducerError(
            f"current public bundle is not authenticated: {exc}"
        ) from exc
    return bundle


def produce_projected_v3(
    *,
    output_dir: Path,
    base_url: str,
    transport: Transport | None = None,
    policy: ProducerPolicy | None = None,
    resume: bool = False,
) -> ProducerResult:
    """Prepare once, confirm once, and poll one producer job sequentially."""

    policy = ProducerPolicy() if policy is None else policy
    bundle = _current_bundle()
    custody = _Custody(output_dir, resume=resume)
    recorder = _RecordingTransport(
        transport if transport is not None else provisioning.stdlib_http_transport,
        custody,
    )
    client = PiqdRawDimacsClient(
        base_url, transport=recorder, segmented_multipart=False
    )
    job_id: str | None = None
    primary_error: BaseException | None = None
    try:
        _validate_inventory(custody)
        if not resume:
            static_artifacts = {
                provisioning.BASE_CNF_NAME: bundle.base_cnf,
                provisioning.VARIABLE_MAP_NAME: bundle.variable_map,
                provisioning.SOURCE_BUNDLE_NAME: bundle.source_bundle,
                provisioning.ENCODING_CONFIGURATION_NAME: bundle.encoding_configuration,
                provisioning.SOURCE_MANIFEST_NAME: bundle.source_manifest,
                provisioning.PRODUCER_MANIFEST_NAME: bundle.producer_manifest,
                provisioning.WAVE_MANIFEST_NAME: canonical_json_bytes(
                    provisioning.build_current_unsharded_projected_v3_wave_manifest(
                        bundle
                    )
                ),
            }
            for name, raw in static_artifacts.items():
                custody.write(name, raw)
            try:
                prepared = client.prepare_cnf(
                    wave_manifest=_json(
                        static_artifacts[provisioning.WAVE_MANIFEST_NAME],
                        "wave manifest",
                    ),
                    cnf=bundle.base_cnf,
                    producer_manifest=bundle.producer_manifest,
                    requested_core_limit=1,
                )
            except PiqdOracleError as exc:
                raise ProducerError(f"prepare failed after raw custody: {exc}") from exc
            prepare_raw = custody.read(RAW_NAMES["prepare"], 1 << 20)
            prepare_value = _canonical_json(prepare_raw, "prepare response")
            _check_prepare(prepare_value, bundle=bundle)
            job_id = prepared.job_id
            custody.write(
                provisioning.PREPARED_JOB_NAME,
                canonical_json_bytes(
                    _prepared_value(
                        prepared,
                        preview=prepare_value["preview"],
                    )
                ),
            )
        else:
            prepare_raw, prepared_raw = _required_resume_prepare_custody(custody)
            _validate_static_custody(custody, bundle=bundle)
            prepare_value = _canonical_json(prepare_raw, "prepare response")
            _check_prepare(prepare_value, bundle=bundle)
            job_id = prepare_value["job_id"]
            prepared_raw = _canonical_json(prepared_raw, "prepared artifact")
            prepared = _check_prepared_artifact(prepared_raw, bundle=bundle)
            if prepared.job_id != job_id:
                raise ProducerError("prepared artifact UUID is crossed")

        assert job_id is not None
        intent_raw = _optional_read(custody, "confirm-intent.json", 1 << 20)
        state_raw = _optional_read(custody, "confirm-state.json", 1 << 20)
        confirm_raw = _optional_read(custody, RAW_NAMES["confirm"], 1 << 20)
        version_raw = _optional_read(custody, RAW_NAMES["version"], 1 << 20)
        registry_raw = _optional_read(custody, RAW_NAMES["solvers"], 1 << 20)
        status_names = _status_names(custody)
        intent = (
            None
            if intent_raw is None
            else _canonical_json(intent_raw, "confirm intent")
        )
        state = (
            None if state_raw is None else _canonical_json(state_raw, "confirm state")
        )
        confirm_http_status: int | None = None
        if state is not None:
            _check_confirm_state(state, job_id=job_id)
            confirm_http_status = state["confirm_http_status"]
            if intent is None:
                raise ProducerError("confirm state exists without authenticated intent")
            _check_confirm_intent(intent, job_id=job_id)
            if confirm_raw is None:
                raise ProducerError("confirm state exists without raw confirm response")
            _check_confirm_evidence(
                confirm_raw,
                http_status=state["confirm_http_status"],
                job_id=job_id,
            )
        elif (
            intent is not None
            or confirm_raw is not None
            or status_names
            or version_raw is not None
            or registry_raw is not None
        ):
            raise ProducerError(
                "existing confirm custody is ambiguous; refusing mutation"
            )
        else:
            intent = canonical_json_bytes(
                {"schema": CONFIRM_INTENT_SCHEMA, "job_id": job_id}
            )
            custody.write("confirm-intent.json", intent)
            try:
                state = client.confirm(prepared, expected_cnf=bundle.base_cnf)
            except BaseException as exc:
                raise ProducerError(
                    "confirm outcome is ambiguous; refusing mutation resume"
                ) from exc
            confirm_raw = _optional_read(custody, RAW_NAMES["confirm"], 1 << 20)
            if confirm_raw is None:
                raise ProducerError("confirm response custody is missing")
            confirm_http_status = recorder.confirm_response_status
            if type(confirm_http_status) is not int or confirm_http_status not in {
                200,
                409,
            }:
                raise ProducerError("confirm response HTTP status is unauthenticated")
            _check_confirm_evidence(
                confirm_raw,
                http_status=confirm_http_status,
                job_id=job_id,
            )
            if confirm_http_status == 409:
                # The oracle client reconciles once; this independent read is the
                # producer's authoritative rebind and is never a confirm retry.
                authoritative = dict(client.status(job_id))
                prepared_value = _canonical_json(
                    custody.read(provisioning.PREPARED_JOB_NAME), "prepared artifact"
                )
                _check_lifecycle_status(
                    authoritative,
                    job_id=job_id,
                    prepared=prepared_value,
                    bundle=bundle,
                )
                state = authoritative["status"]
            if type(state) is not str or state not in {
                "confirmed",
                "running",
                "completed",
                "failed",
            }:
                raise ProducerError("confirm client returned an unauthenticated state")
            state_value = {
                "schema": CONFIRM_STATE_SCHEMA,
                "job_id": job_id,
                "state": state,
                "confirm_http_status": confirm_http_status,
            }
            custody.write("confirm-state.json", canonical_json_bytes(state_value))

        status: dict[str, Any] | None = None
        polls = 0
        for polls in range(1, policy.max_polls + 1):
            try:
                status = dict(client.status(job_id))
            except PiqdOracleError as exc:
                raise ProducerError(
                    f"status read failed; no mutation retry is permitted: {exc}"
                ) from exc
            except Exception as exc:
                raise ProducerError(
                    "status read raised an unexpected exception; no mutation retry is permitted"
                ) from exc
            if status.get("status") == "completed":
                break
            if polls != policy.max_polls and policy.poll_interval_s:
                time.sleep(policy.poll_interval_s)
        if status is None or status.get("status") != "completed":
            raise ProducerError(
                "producer did not reach completed status within the poll bound"
            )
        prepared_value = _canonical_json(
            custody.read(provisioning.PREPARED_JOB_NAME), "prepared artifact"
        )
        _check_prepared_artifact(prepared_value, bundle=bundle)
        status_names, checked_last = _check_status_sequence(
            custody, job_id=job_id, prepared=prepared_value, bundle=bundle
        )
        if checked_last != status:
            raise ProducerError("terminal status custody is not the last poll")
        _terminal_status(status, job=prepared_value, bundle=bundle)

        if version_raw is not None:
            version_response = HttpResponse(
                200, version_raw, {"Content-Type": "application/json"}
            )
        else:
            version_response = recorder(
                "GET",
                f"{client.base_url}/version",
                None,
                {"Accept": "application/json"},
            )
        if registry_raw is not None:
            registry_response = HttpResponse(
                200, registry_raw, {"Content-Type": "application/json"}
            )
        else:
            registry_response = recorder(
                "GET",
                f"{client.base_url}/solvers",
                None,
                {"Accept": "application/json"},
            )
        version = _canonical_json(version_response.body, "daemon version")
        registry = _canonical_json(registry_response.body, "solver registry")
        try:
            daemon = provisioning._validate_version(version)
            solver = provisioning._validate_registry(
                registry,
                version_daemon=daemon,
                profile=provisioning.PRODUCTION_V3_PROFILE,
            )
        except provisioning.ProvisioningError as exc:
            raise ProducerError(str(exc)) from exc
        unsigned = {
            "schema": SCHEMA,
            "job_id": job_id,
            "requested_core_limit": 1,
            "poll_count": polls,
            "poll_interval_s": policy.poll_interval_s,
            "cnf_blob_sha256": _sha(bundle.base_cnf),
            "raw_dimacs_identity": bundle.raw_dimacs_identity,
            "producer_manifest_sha256": bundle.producer_manifest_sha256,
            "static_artifact_sha256": {
                name: _sha(custody.read(name, 1 << 30))
                for name in (
                    provisioning.BASE_CNF_NAME,
                    provisioning.VARIABLE_MAP_NAME,
                    provisioning.SOURCE_BUNDLE_NAME,
                    provisioning.ENCODING_CONFIGURATION_NAME,
                    provisioning.SOURCE_MANIFEST_NAME,
                    provisioning.PRODUCER_MANIFEST_NAME,
                    provisioning.WAVE_MANIFEST_NAME,
                )
            },
            "prepared_artifact_sha256": _sha(
                custody.read(provisioning.PREPARED_JOB_NAME)
            ),
            "prepare_response_sha256": _sha(custody.read(RAW_NAMES["prepare"])),
            "cnf_response_sha256": _sha(custody.read(RAW_NAMES["cnf"])),
            "confirm_response_sha256": _sha(custody.read(RAW_NAMES["confirm"])),
            "confirm_response_status": confirm_http_status,
            "confirm_intent_sha256": _sha(custody.read("confirm-intent.json")),
            "confirm_state_sha256": _sha(custody.read("confirm-state.json")),
            "status_files": list(status_names),
            "status_response_sha256s": [
                _sha(custody.read(name, 1 << 20)) for name in status_names
            ],
            "terminal_status_sha256": _sha(canonical_json_bytes(status)),
            "daemon_version_sha256": _sha(version_response.body),
            "solver_registry_sha256": _sha(registry_response.body),
            "solver_name": solver["name"],
            "attested_solver_processes": status["attested_solver_processes"],
            "attestation_basis": status["attestation_basis"],
            "claims": dict(CLAIMS),
        }
        result = {**unsigned, "result_sha256": _sha(canonical_json_bytes(unsigned))}
        result_path = custody.path / "producer-result.json"
        custody.write("producer-result.json", canonical_json_bytes(result))
        return ProducerResult(custody.path, result_path, job_id, polls)
    except BaseException as exc:
        primary_error = exc
        raise
    finally:
        try:
            custody.close()
        except BaseException:
            if primary_error is None:
                raise


def check_projected_v3_output(
    output_dir: Path,
    *,
    authority_path: Path | None = None,
) -> dict[str, Any]:
    """Offline-only validation of a completed producer result and raw custody."""

    custody = _Custody(output_dir, resume=True)
    primary_error: BaseException | None = None
    try:
        _validate_inventory(custody, completed=True)
        result = _canonical_json(
            custody.read("producer-result.json", 1 << 20), "producer result"
        )
        if set(result) != RESULT_KEYS or result.get("schema") != SCHEMA:
            raise ProducerError("producer result schema is not exact")
        _uuid(result.get("job_id"), "producer result UUID")
        if (
            type(result.get("requested_core_limit")) is not int
            or result["requested_core_limit"] != 1
            or type(result.get("poll_count")) is not int
            or result["poll_count"] < 1
            or type(result.get("poll_interval_s")) not in {int, float}
            or not math.isfinite(result["poll_interval_s"])
            or result["poll_interval_s"] < 0
            or type(result.get("attested_solver_processes")) is not int
            or result["attested_solver_processes"] != 1
            or result.get("attestation_basis") != "SINGLE_PROCESS_NO_PARALLEL_FLAG"
        ):
            raise ProducerError(
                "producer result types or one-process attestation are invalid"
            )
        for key in (
            "cnf_blob_sha256",
            "raw_dimacs_identity",
            "producer_manifest_sha256",
            "prepared_artifact_sha256",
            "prepare_response_sha256",
            "cnf_response_sha256",
            "confirm_response_sha256",
            "confirm_intent_sha256",
            "confirm_state_sha256",
            "terminal_status_sha256",
            "daemon_version_sha256",
            "solver_registry_sha256",
        ):
            _digest(result.get(key), f"producer result {key}")
        if type(result.get("status_response_sha256s")) is not list:
            raise ProducerError("producer result status hash sequence is malformed")
        for index, digest_value in enumerate(result["status_response_sha256s"]):
            _digest(digest_value, f"producer result status hash {index}")
        if type(result.get("confirm_response_status")) is not int or result[
            "confirm_response_status"
        ] not in {200, 409}:
            raise ProducerError("producer result confirm HTTP status is malformed")
        digest = result.get("result_sha256")
        unsigned = dict(result)
        unsigned.pop("result_sha256", None)
        if type(digest) is not str or _sha(canonical_json_bytes(unsigned)) != digest:
            raise ProducerError("producer result self-hash is invalid")
        bundle = provisioning.build_current_unsharded_projected_v3_bundle()
        if (
            result["cnf_blob_sha256"] != bundle.base_cnf_sha256
            or result["raw_dimacs_identity"] != bundle.raw_dimacs_identity
            or result["producer_manifest_sha256"] != bundle.producer_manifest_sha256
        ):
            raise ProducerError("offline result bundle identity is crossed")
        _validate_static_custody(custody, bundle=bundle)
        static_digests = {
            name: _sha(custody.read(name, 1 << 30))
            for name in (
                provisioning.BASE_CNF_NAME,
                provisioning.VARIABLE_MAP_NAME,
                provisioning.SOURCE_BUNDLE_NAME,
                provisioning.ENCODING_CONFIGURATION_NAME,
                provisioning.SOURCE_MANIFEST_NAME,
                provisioning.PRODUCER_MANIFEST_NAME,
                provisioning.WAVE_MANIFEST_NAME,
            )
        }
        if result.get("static_artifact_sha256") != static_digests:
            raise ProducerError("offline static artifact hashes are crossed")
        prepare_raw = custody.read(RAW_NAMES["prepare"], 1 << 20)
        prepare = _canonical_json(prepare_raw, "prepare response")
        _check_prepare(prepare, bundle=bundle)
        if prepare.get("job_id") != result.get("job_id"):
            raise ProducerError("offline prepare UUID is crossed")
        prepared_raw = custody.read(provisioning.PREPARED_JOB_NAME, 1 << 20)
        prepared = _canonical_json(prepared_raw, "prepared artifact")
        prepared_job = _check_prepared_artifact(prepared, bundle=bundle)
        if prepared_job.job_id != result.get("job_id"):
            raise ProducerError("offline prepared UUID is crossed")
        if result.get("prepared_artifact_sha256") != _sha(prepared_raw):
            raise ProducerError("offline prepared artifact hash is crossed")
        if result.get("prepare_response_sha256") != _sha(prepare_raw):
            raise ProducerError("offline prepare response hash is crossed")
        if custody.read(RAW_NAMES["cnf"], 1 << 30) != bundle.base_cnf:
            raise ProducerError("offline daemon CNF rebind is crossed")
        cnf_raw = custody.read(RAW_NAMES["cnf"], 1 << 30)
        confirm_raw = custody.read(RAW_NAMES["confirm"], 1 << 20)
        _check_confirm_evidence(
            confirm_raw,
            http_status=result["confirm_response_status"],
            job_id=result["job_id"],
        )
        if result.get("cnf_response_sha256") != _sha(cnf_raw):
            raise ProducerError("offline CNF response hash is crossed")
        if result.get("confirm_response_sha256") != _sha(confirm_raw):
            raise ProducerError("offline confirm response hash is crossed")
        intent = _canonical_json(
            custody.read("confirm-intent.json", 1 << 20), "confirm intent"
        )
        _check_confirm_intent(intent, job_id=result["job_id"])
        state = _canonical_json(
            custody.read("confirm-state.json", 1 << 20), "confirm state"
        )
        _check_confirm_state(state, job_id=result["job_id"])
        if state["confirm_http_status"] != result["confirm_response_status"]:
            raise ProducerError("offline confirm HTTP status is crossed")
        if result.get("confirm_intent_sha256") != _sha(
            custody.read("confirm-intent.json", 1 << 20)
        ):
            raise ProducerError("offline confirm intent hash is crossed")
        if result.get("confirm_state_sha256") != _sha(
            custody.read("confirm-state.json", 1 << 20)
        ):
            raise ProducerError("offline confirm state hash is crossed")
        raw_names, status = _check_status_sequence(
            custody, job_id=result["job_id"], prepared=prepared, bundle=bundle
        )
        if (
            type(result.get("status_files")) is not list
            or result["status_files"] != raw_names
        ):
            raise ProducerError("offline status file inventory is crossed")
        if result.get("poll_count") != len(raw_names):
            raise ProducerError("offline poll count is crossed")
        if result.get("status_response_sha256s") != [
            _sha(custody.read(name, 1 << 20)) for name in raw_names
        ]:
            raise ProducerError("offline status response hashes are crossed")
        _terminal_status(status, job=prepared, bundle=bundle)
        if _sha(canonical_json_bytes(status)) != result.get("terminal_status_sha256"):
            raise ProducerError("offline terminal status digest is crossed")
        version_raw = custody.read(RAW_NAMES["version"], 1 << 20)
        registry_raw = custody.read(RAW_NAMES["solvers"], 1 << 20)
        version = _canonical_json(version_raw, "daemon version")
        registry = _canonical_json(registry_raw, "solver registry")
        try:
            daemon = provisioning._validate_version(version)
            solver = provisioning._validate_registry(
                registry,
                version_daemon=daemon,
                profile=provisioning.PRODUCTION_V3_PROFILE,
            )
        except provisioning.ProvisioningError as exc:
            raise ProducerError(str(exc)) from exc
        if solver["name"] != result.get("solver_name"):
            raise ProducerError("offline solver identity is crossed")
        if _sha(version_raw) != result.get("daemon_version_sha256"):
            raise ProducerError("offline daemon version digest is crossed")
        if _sha(registry_raw) != result.get("solver_registry_sha256"):
            raise ProducerError("offline solver registry digest is crossed")
        if authority_path is not None:
            authority = qualification.load_production_authority_v3(authority_path)
            if (
                authority.value["producer_job_id"] != result.get("job_id")
                or authority.value["base_cnf_sha256"] != bundle.base_cnf_sha256
                or authority.value["raw_dimacs_identity"] != bundle.raw_dimacs_identity
            ):
                raise ProducerError("offline authority is crossed")
        if result.get("requested_core_limit") != 1 or result.get("claims") != CLAIMS:
            raise ProducerError("producer result contract claims are not exact")
        return result
    except BaseException as exc:
        primary_error = exc
        raise
    finally:
        try:
            custody.close()
        except BaseException:
            if primary_error is None:
                raise


__all__ = [
    "CLAIMS",
    "ProducerError",
    "ProducerPolicy",
    "ProducerResult",
    "check_projected_v3_output",
    "produce_projected_v3",
]
