"""Durable production driver for the P97 raw-DIMACS piqd boundary.

The one-shot client owns protocol validation.  This module owns bounded retries,
polling, artifact archiving, and the authoritative hash-chained wave journal.
No solver verdict emitted here is a theorem-closure claim.
"""

from __future__ import annotations

import argparse
import fcntl
import json
import math
import os
import sys
import time
import uuid
from collections.abc import Callable, Iterator, Mapping
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Protocol

from census.p97_search.phase3_cegar_wave import (
    CERTIFIED_UNSAT,
    CHECKPOINT,
    DISCOVERY_UNSAT,
    ERROR,
    STRUCTURAL_SAT,
    canonical_json_bytes,
    make_attempt_record,
    sha256_bytes,
    sha256_json,
    validate_attempt_journal,
    validate_wave_manifest,
    wave_manifest_sha256,
)
from census.p97_search.phase3_piqd_oracle import (
    MAX_REQUESTED_CORE_LIMIT,
    MIN_REQUESTED_CORE_LIMIT,
    CheckedModel,
    PiqdOracleError,
    PiqdProofUnavailable,
    PiqdRawDimacsClient,
    PreparedJob,
)
from census.p97_search.phase3_piqd_replay import (
    LeanLratReplayer,
    LratReplayError,
    LratReplayResult,
    validate_replay_result,
)

EVENT_SCHEMA = "p97-cegar-piqd-event/v1"
SEAL_SCHEMA = "p97-cegar-wave-journal-seal/v1"
_STATES = frozenset({"prepared", "confirmed", "running", "completed", "failed"})
_RESULTS = frozenset({"SAT", "UNSAT", "UNKNOWN"})
_EVENT_KEYS = frozenset(
    {
        "schema",
        "phase",
        "disposition",
        "retry_index",
        "poll_index",
        "job_id",
        "status",
        "result",
        "detail",
        "response",
    }
)
_SEAL_KEYS = frozenset(
    {
        "schema",
        "wave_manifest_sha256",
        "record_count",
        "terminal_attempt_sha256",
        "journal_sha256",
        "seal_sha256",
    }
)
_HEX_DIGITS = frozenset("0123456789abcdef")
_ARTIFACT_KEYS = (
    "cnf_sha256",
    "model_sha256",
    "metric_witness_sha256",
    "metric_validation_sha256",
    "solver_log_sha256",
    "proof_sha256",
    "proof_checker_sha256",
    "proof_replay_sha256",
    "checkpoint_sha256",
)


class PiqdDriverError(RuntimeError):
    """The driver or its durable journal failed closed."""


class JournalAppendError(PiqdDriverError):
    """A pending record could not be proven durable."""

    def __init__(self, message: str, *, pending_record: Mapping[str, Any]) -> None:
        super().__init__(message)
        self.pending_record = dict(pending_record)


@dataclass(frozen=True)
class DriverPolicy:
    max_prepare_attempts: int = 3
    max_confirm_attempts: int = 3
    max_polls: int = 300
    max_result_attempts: int = 3
    poll_interval_s: float = 2.0
    solver_timeout_s: int = 900
    march_timeout_s: int = 900
    project: str = "erdos-97-96-formalization"
    requested_core_limit: int | None = None

    def __post_init__(self) -> None:
        for field in (
            "max_prepare_attempts",
            "max_confirm_attempts",
            "max_polls",
            "max_result_attempts",
        ):
            value = getattr(self, field)
            if isinstance(value, bool) or not isinstance(value, int) or value <= 0:
                raise PiqdDriverError(f"{field} must be a positive integer")
        for field in ("solver_timeout_s", "march_timeout_s"):
            value = getattr(self, field)
            if isinstance(value, bool) or not isinstance(value, int) or value < 0:
                raise PiqdDriverError(f"{field} must be a non-negative integer")
        if (
            isinstance(self.poll_interval_s, bool)
            or not isinstance(self.poll_interval_s, (int, float))
            or not math.isfinite(self.poll_interval_s)
            or self.poll_interval_s < 0
        ):
            raise PiqdDriverError("poll_interval_s must be finite and non-negative")
        if not isinstance(self.project, str) or not self.project.strip():
            raise PiqdDriverError("project must be a non-empty string")
        if self.requested_core_limit is not None and (
            type(self.requested_core_limit) is not int
            or not MIN_REQUESTED_CORE_LIMIT
            <= self.requested_core_limit
            <= MAX_REQUESTED_CORE_LIMIT
        ):
            raise PiqdDriverError(
                "requested_core_limit must be a positive builtin int in range 1..1024"
            )

    def as_dict(self) -> dict[str, Any]:
        value = {
            "max_prepare_attempts": self.max_prepare_attempts,
            "max_confirm_attempts": self.max_confirm_attempts,
            "max_polls": self.max_polls,
            "max_result_attempts": self.max_result_attempts,
            "poll_interval_s": self.poll_interval_s,
            "solver_timeout_s": self.solver_timeout_s,
            "march_timeout_s": self.march_timeout_s,
            "project": self.project,
        }
        if self.requested_core_limit is not None:
            value["requested_core_limit"] = self.requested_core_limit
        return value


@dataclass(frozen=True)
class DriverResult:
    job_id: str | None
    outcome: str
    terminal_record_sha256: str
    journal_record_count: int
    seal_sha256: str


class PiqdClient(Protocol):
    def prepare_cnf(
        self,
        *,
        wave_manifest: Mapping[str, Any],
        cnf: bytes,
        producer_manifest: bytes,
        timeout_s: int,
        march_timeout_s: int,
        project: str,
        requested_core_limit: int | None,
    ) -> PreparedJob: ...

    def confirm(self, job: PreparedJob, *, expected_cnf: bytes) -> str: ...

    def status(self, job_id: str) -> Mapping[str, Any]: ...

    def checked_model(self, job: PreparedJob, *, cnf: bytes) -> CheckedModel: ...

    def log(self, job: PreparedJob) -> tuple[bytes, str]: ...

    def proof(self, job: PreparedJob) -> tuple[bytes, str]: ...


class ProofReplayer(Protocol):
    def replay(
        self,
        *,
        job: PreparedJob,
        wave_manifest: Mapping[str, Any],
        cnf: bytes,
        proof: bytes,
        proof_sha256: str,
    ) -> LratReplayResult: ...


def _strict_json(raw: bytes, *, source: str) -> Mapping[str, Any]:
    def reject_constant(value: str) -> None:
        raise ValueError(f"nonstandard JSON constant: {value}")

    try:
        value = json.loads(raw, parse_constant=reject_constant)
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise PiqdDriverError(f"{source} is not strict JSON") from exc
    if not isinstance(value, Mapping):
        raise PiqdDriverError(f"{source} must contain a JSON object")
    return value


def _write_all(descriptor: int, data: bytes) -> None:
    offset = 0
    while offset < len(data):
        written = os.write(descriptor, data[offset:])
        if written <= 0:
            raise OSError("write made no progress")
        offset += written


def _sync_directory(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _atomic_write(path: Path, data: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.{uuid.uuid4().hex}.tmp")
    try:
        descriptor = os.open(temporary, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o600)
        try:
            _write_all(descriptor, data)
            os.fsync(descriptor)
        finally:
            os.close(descriptor)
        os.replace(temporary, path)
        _sync_directory(path.parent)
    finally:
        temporary.unlink(missing_ok=True)


def _validate_event(event: Mapping[str, Any]) -> None:
    keys = frozenset(event)
    missing = sorted(_EVENT_KEYS - keys)
    extra = sorted(keys - _EVENT_KEYS)
    if missing or extra:
        raise PiqdDriverError(
            f"piqd event keys mismatch: missing={missing}, extra={extra}"
        )
    if event["schema"] != EVENT_SCHEMA:
        raise PiqdDriverError(f"piqd event schema must be {EVENT_SCHEMA!r}")
    for field in ("phase", "disposition"):
        if not isinstance(event[field], str) or not event[field].strip():
            raise PiqdDriverError(f"piqd event {field} must be a non-empty string")
    if event["disposition"] not in {"SUCCESS", "ERROR"}:
        raise PiqdDriverError("piqd event disposition must be SUCCESS or ERROR")
    for field in ("retry_index", "poll_index"):
        value = event[field]
        if value is not None and (
            isinstance(value, bool) or not isinstance(value, int) or value < 0
        ):
            raise PiqdDriverError(
                f"piqd event {field} must be null or a non-negative integer"
            )
    for field in ("job_id", "status", "result", "detail"):
        value = event[field]
        if value is not None and (not isinstance(value, str) or not value.strip()):
            raise PiqdDriverError(
                f"piqd event {field} must be null or a non-empty string"
            )
    if event["status"] is not None and event["status"] not in _STATES:
        raise PiqdDriverError("piqd event status is not a lifecycle state")
    if event["result"] is not None and event["result"] not in _RESULTS:
        raise PiqdDriverError("piqd event result is not a solver result")
    if event["response"] is not None and not isinstance(event["response"], Mapping):
        raise PiqdDriverError("piqd event response must be null or an object")


class DurableAttemptJournal:
    """Durable JSONL journal plus content-addressed event/artifact archive."""

    def __init__(self, path: Path, *, manifest: Mapping[str, Any]) -> None:
        validate_wave_manifest(manifest)
        self.path = path
        self.manifest = dict(manifest)
        self.artifact_dir = path.with_name(f"{path.name}.artifacts")
        self.seal_path = path.with_name(f"{path.name}.seal.json")
        self.lock_path = path.with_name(f"{path.name}.lock")
        self._raw = path.read_bytes() if path.exists() else b""
        self.records = self._decode_records(self._raw)
        self._validate_archived_artifacts()
        self._seal = self._load_existing_seal()

    @contextmanager
    def _exclusive_lock(self) -> Iterator[None]:
        self.path.parent.mkdir(parents=True, exist_ok=True)
        descriptor = os.open(self.lock_path, os.O_RDWR | os.O_CREAT, 0o600)
        try:
            fcntl.flock(descriptor, fcntl.LOCK_EX)
            yield
        finally:
            try:
                fcntl.flock(descriptor, fcntl.LOCK_UN)
            finally:
                os.close(descriptor)

    def _decode_records(self, raw: bytes) -> list[dict[str, Any]]:
        if raw and not raw.endswith(b"\n"):
            raise PiqdDriverError("attempt journal ends inside a JSONL record")
        records: list[dict[str, Any]] = []
        for index, line in enumerate(raw.splitlines(keepends=True), start=1):
            payload = line[:-1]
            if not payload:
                raise PiqdDriverError(f"attempt journal line {index} is blank")
            value = dict(_strict_json(payload, source=f"attempt journal line {index}"))
            if canonical_json_bytes(value) != payload:
                raise PiqdDriverError(
                    f"attempt journal line {index} is not canonical JSON"
                )
            records.append(value)
        validate_attempt_journal(records, manifest=self.manifest)
        return records

    @staticmethod
    def _validate_digest(digest: Any, *, source: str) -> str:
        if (
            not isinstance(digest, str)
            or len(digest) != 64
            or any(char not in _HEX_DIGITS for char in digest)
        ):
            raise PiqdDriverError(f"{source} is not a lowercase SHA-256 digest")
        return digest

    def _require_artifact(self, digest: Any, *, source: str) -> str:
        value = self._validate_digest(digest, source=source)
        target = self.artifact_dir / value
        if not target.is_file():
            raise PiqdDriverError(f"{source} artifact is missing: {target}")
        if sha256_bytes(target.read_bytes()) != value:
            raise PiqdDriverError(f"{source} artifact hash mismatch: {target}")
        return value

    def _validate_archived_artifacts(self) -> None:
        if not self.records:
            return
        for source, digest in (
            ("manifest CNF", self.manifest["encoding"]["cnf_sha256"]),
            (
                "manifest producer",
                self.manifest["encoding"]["producer_manifest_sha256"],
            ),
        ):
            self._require_artifact(digest, source=source)
        for index, record in enumerate(self.records):
            for key, digest in record["artifacts"].items():
                if digest is not None:
                    self._require_artifact(
                        digest, source=f"attempt {index} artifact {key}"
                    )

    def _load_existing_seal(self) -> dict[str, Any] | None:
        if not self.seal_path.exists():
            return None
        raw = self.seal_path.read_bytes()
        if not raw.endswith(b"\n"):
            raise PiqdDriverError("journal seal is not newline-terminated")
        payload = raw[:-1]
        seal = dict(_strict_json(payload, source=str(self.seal_path)))
        if canonical_json_bytes(seal) != payload:
            raise PiqdDriverError("journal seal is not canonical JSON")
        keys = frozenset(seal)
        missing = sorted(_SEAL_KEYS - keys)
        extra = sorted(keys - _SEAL_KEYS)
        if missing or extra:
            raise PiqdDriverError(
                f"journal seal keys mismatch: missing={missing}, extra={extra}"
            )
        if seal["schema"] != SEAL_SCHEMA:
            raise PiqdDriverError(f"journal seal schema must be {SEAL_SCHEMA!r}")
        record_count = seal["record_count"]
        if (
            isinstance(record_count, bool)
            or not isinstance(record_count, int)
            or record_count < 0
        ):
            raise PiqdDriverError(
                "journal seal record_count must be a non-negative integer"
            )
        unsigned = dict(seal)
        claimed_seal = unsigned.pop("seal_sha256")
        if claimed_seal != sha256_json(unsigned):
            raise PiqdDriverError("journal seal hash mismatch")
        expected_terminal = self.records[-1]["record_sha256"] if self.records else None
        expected = {
            "wave_manifest_sha256": wave_manifest_sha256(self.manifest),
            "record_count": len(self.records),
            "terminal_attempt_sha256": expected_terminal,
            "journal_sha256": sha256_bytes(self._raw),
        }
        for field, value in expected.items():
            if seal[field] != value:
                raise PiqdDriverError(f"journal seal {field} mismatch")
        return seal

    def store_artifact(self, payload: bytes) -> str:
        digest = sha256_bytes(payload)
        target = self.artifact_dir / digest
        if target.exists():
            if target.read_bytes() != payload:
                raise PiqdDriverError(f"artifact digest collision at {target}")
            return digest
        _atomic_write(target, payload)
        return digest

    def append_event(
        self,
        *,
        event: Mapping[str, Any],
        outcome: str,
        detail: str | None,
        artifact_overrides: Mapping[str, str | None] | None = None,
    ) -> dict[str, Any]:
        _validate_event(event)
        try:
            event_bytes = canonical_json_bytes(event)
        except (TypeError, ValueError) as exc:
            raise PiqdDriverError("piqd event is not canonical JSON data") from exc
        with self._exclusive_lock():
            if self._seal is not None or self.seal_path.exists():
                raise PiqdDriverError("a sealed attempt journal cannot be extended")
            return self._append_event_locked(
                event_bytes=event_bytes,
                outcome=outcome,
                detail=detail,
                artifact_overrides=artifact_overrides,
            )

    def _append_event_locked(
        self,
        *,
        event_bytes: bytes,
        outcome: str,
        detail: str | None,
        artifact_overrides: Mapping[str, str | None] | None,
    ) -> dict[str, Any]:
        checkpoint_sha256 = self.store_artifact(event_bytes)
        artifacts: dict[str, str | None] = {key: None for key in _ARTIFACT_KEYS}
        artifacts["cnf_sha256"] = self.manifest["encoding"]["cnf_sha256"]
        artifacts["checkpoint_sha256"] = checkpoint_sha256
        for key, value in (artifact_overrides or {}).items():
            if key not in artifacts:
                raise PiqdDriverError(f"unknown attempt artifact field: {key}")
            if key in {"cnf_sha256", "checkpoint_sha256"}:
                raise PiqdDriverError(f"attempt artifact field is driver-owned: {key}")
            if value is not None:
                self._require_artifact(value, source=f"attempt artifact {key}")
            artifacts[key] = value
        index = len(self.records)
        previous = self.records[-1]["record_sha256"] if self.records else None
        record = make_attempt_record(
            manifest=self.manifest,
            attempt_id=(
                f"{self.manifest['wave_id']}:{index:06d}:{checkpoint_sha256[:16]}"
            ),
            attempt_index=index,
            previous_attempt_sha256=previous,
            outcome=outcome,
            artifacts=artifacts,
            detail=detail,
        )
        serialized = canonical_json_bytes(record) + b"\n"
        self._append_serialized(record, serialized)
        return record

    def _append_serialized(self, record: Mapping[str, Any], serialized: bytes) -> None:
        self.path.parent.mkdir(parents=True, exist_ok=True)
        created = not self.path.exists()
        descriptor = os.open(self.path, os.O_RDWR | os.O_CREAT | os.O_APPEND, 0o600)
        try:
            fcntl.flock(descriptor, fcntl.LOCK_EX)
            os.lseek(descriptor, 0, os.SEEK_SET)
            chunks: list[bytes] = []
            while True:
                chunk = os.read(descriptor, 1024 * 1024)
                if not chunk:
                    break
                chunks.append(chunk)
            if b"".join(chunks) != self._raw:
                raise PiqdDriverError("attempt journal changed since it was opened")
            _write_all(descriptor, serialized)
            os.fsync(descriptor)
        except Exception as exc:
            raise JournalAppendError(
                f"attempt record could not be proven durable: {exc}",
                pending_record=record,
            ) from exc
        finally:
            try:
                fcntl.flock(descriptor, fcntl.LOCK_UN)
            finally:
                os.close(descriptor)
        if created:
            try:
                _sync_directory(self.path.parent)
            except OSError as exc:
                raise JournalAppendError(
                    f"attempt journal directory sync failed: {exc}",
                    pending_record=record,
                ) from exc
        self._raw += serialized
        self.records.append(dict(record))

    def seal(self) -> dict[str, Any]:
        with self._exclusive_lock():
            current_raw = self.path.read_bytes() if self.path.exists() else b""
            if current_raw != self._raw:
                raise PiqdDriverError("attempt journal changed before sealing")
            self._validate_archived_artifacts()
            current_seal = self._load_existing_seal()
            if self._seal is not None:
                if current_seal is None:
                    raise PiqdDriverError("journal seal disappeared after validation")
                if current_seal != self._seal:
                    raise PiqdDriverError("journal seal changed after validation")
                return dict(self._seal)
            if current_seal is not None:
                self._seal = current_seal
                return dict(current_seal)
            terminal = validate_attempt_journal(
                self.records,
                manifest=self.manifest,
                expected_record_count=len(self.records),
                expected_terminal_sha256=(
                    self.records[-1]["record_sha256"] if self.records else None
                ),
            )
            unsigned = {
                "schema": SEAL_SCHEMA,
                "wave_manifest_sha256": wave_manifest_sha256(self.manifest),
                "record_count": len(self.records),
                "terminal_attempt_sha256": terminal,
                "journal_sha256": sha256_bytes(self._raw),
            }
            seal = {**unsigned, "seal_sha256": sha256_json(unsigned)}
            _atomic_write(self.seal_path, canonical_json_bytes(seal) + b"\n")
            self._seal = seal
            return seal


def _event(
    *,
    phase: str,
    disposition: str,
    retry_index: int | None = None,
    poll_index: int | None = None,
    job_id: str | None = None,
    status: str | None = None,
    result: str | None = None,
    detail: str | None = None,
    response: Mapping[str, Any] | None = None,
) -> dict[str, Any]:
    return {
        "schema": EVENT_SCHEMA,
        "phase": phase,
        "disposition": disposition,
        "retry_index": retry_index,
        "poll_index": poll_index,
        "job_id": job_id,
        "status": status,
        "result": result,
        "detail": detail,
        "response": dict(response) if response is not None else None,
    }


def _status_state(payload: Mapping[str, Any]) -> tuple[str, str | None]:
    state = payload.get("status")
    result = payload.get("result")
    if state not in _STATES:
        raise PiqdOracleError(f"piqd status has invalid lifecycle state {state!r}")
    if result is not None and result not in _RESULTS:
        raise PiqdOracleError(f"piqd status has invalid solver result {result!r}")
    if state == "completed" and result is None:
        raise PiqdOracleError("piqd completed status is missing a solver result")
    if state in {"prepared", "confirmed", "running"} and result is not None:
        raise PiqdOracleError(
            f"piqd nonterminal status {state!r} unexpectedly has result {result!r}"
        )
    return str(state), str(result) if result is not None else None


class PiqdCegarDriver:
    def __init__(
        self,
        *,
        client: PiqdClient,
        journal: DurableAttemptJournal,
        policy: DriverPolicy | None = None,
        proof_replayer: ProofReplayer | None = None,
        sleep: Callable[[float], None] = time.sleep,
    ) -> None:
        self.client = client
        self.journal = journal
        self.policy = policy or DriverPolicy()
        self.proof_replayer = proof_replayer
        self.sleep = sleep

    def _append(
        self,
        *,
        event: Mapping[str, Any],
        outcome: str,
        detail: str | None,
        artifacts: Mapping[str, str | None] | None = None,
    ) -> dict[str, Any]:
        return self.journal.append_event(
            event=event,
            outcome=outcome,
            detail=detail,
            artifact_overrides=artifacts,
        )

    def _finish(self, record: Mapping[str, Any], *, job_id: str | None) -> DriverResult:
        seal = self.journal.seal()
        return DriverResult(
            job_id=job_id,
            outcome=str(record["outcome"]),
            terminal_record_sha256=str(record["record_sha256"]),
            journal_record_count=int(seal["record_count"]),
            seal_sha256=str(seal["seal_sha256"]),
        )

    def _record_error(
        self,
        *,
        phase: str,
        detail: str,
        retry_index: int | None = None,
        poll_index: int | None = None,
        job_id: str | None = None,
        status: str | None = None,
        result: str | None = None,
        response: Mapping[str, Any] | None = None,
        artifacts: Mapping[str, str | None] | None = None,
    ) -> dict[str, Any]:
        return self._append(
            event=_event(
                phase=phase,
                disposition="ERROR",
                retry_index=retry_index,
                poll_index=poll_index,
                job_id=job_id,
                status=status,
                result=result,
                detail=detail,
                response=response,
            ),
            outcome=ERROR,
            detail=f"{phase}: {detail}",
            artifacts=artifacts,
        )

    def run(
        self,
        *,
        wave_manifest: Mapping[str, Any],
        cnf: bytes,
        producer_manifest: bytes,
    ) -> DriverResult:
        validate_wave_manifest(wave_manifest)
        if wave_manifest_sha256(wave_manifest) != wave_manifest_sha256(
            self.journal.manifest
        ):
            raise PiqdDriverError("driver manifest does not match its journal")
        archived_cnf = self.journal.store_artifact(cnf)
        if archived_cnf != wave_manifest["encoding"]["cnf_sha256"]:
            raise PiqdDriverError("CNF bytes do not match the wave manifest")
        archived_producer = self.journal.store_artifact(producer_manifest)
        if archived_producer != wave_manifest["encoding"]["producer_manifest_sha256"]:
            raise PiqdDriverError("producer bytes do not match the wave manifest")
        self._append(
            event=_event(
                phase="DRIVER_START",
                disposition="SUCCESS",
                detail="bounded piqd lifecycle started",
                response=self.policy.as_dict(),
            ),
            outcome=CHECKPOINT,
            detail="DRIVER_START: bounded piqd lifecycle started",
        )

        job: PreparedJob | None = None
        for retry_index in range(self.policy.max_prepare_attempts):
            try:
                job = self.client.prepare_cnf(
                    wave_manifest=wave_manifest,
                    cnf=cnf,
                    producer_manifest=producer_manifest,
                    timeout_s=self.policy.solver_timeout_s,
                    march_timeout_s=self.policy.march_timeout_s,
                    project=self.policy.project,
                    requested_core_limit=self.policy.requested_core_limit,
                )
            except PiqdOracleError as exc:
                record = self._record_error(
                    phase="PREPARE",
                    detail=str(exc),
                    retry_index=retry_index,
                )
                if (
                    not exc.retryable
                    or retry_index + 1 == self.policy.max_prepare_attempts
                ):
                    return self._finish(record, job_id=None)
                continue
            self._append(
                event=_event(
                    phase="PREPARE",
                    disposition="SUCCESS",
                    retry_index=retry_index,
                    job_id=job.job_id,
                    status="prepared",
                    detail="existing raw identity"
                    if job.existing
                    else "new raw identity",
                    response={
                        "backend": job.backend,
                        "solver_profile": job.solver_profile,
                        "cnf_blob_hash": job.cnf_blob_hash,
                        "identity_hash": job.identity_hash,
                        "num_vars": job.num_vars,
                        "num_clauses": job.num_clauses,
                        "existing": job.existing,
                    },
                ),
                outcome=CHECKPOINT,
                detail=f"PREPARE: accepted job {job.job_id}",
            )
            break
        if job is None:
            raise PiqdDriverError("prepare loop ended without a job or terminal record")

        confirmed = False
        for retry_index in range(self.policy.max_confirm_attempts):
            try:
                confirm_state = self.client.confirm(job, expected_cnf=cnf)
            except PiqdOracleError as exc:
                record = self._record_error(
                    phase="CONFIRM",
                    detail=str(exc),
                    retry_index=retry_index,
                    job_id=job.job_id,
                )
                if (
                    not exc.retryable
                    or retry_index + 1 == self.policy.max_confirm_attempts
                ):
                    return self._finish(record, job_id=job.job_id)
                continue
            if confirm_state == "failed":
                record = self._record_error(
                    phase="DAEMON_FAILED",
                    detail="piqd confirm reconciliation found a failed job",
                    retry_index=retry_index,
                    job_id=job.job_id,
                    status=confirm_state,
                )
                return self._finish(record, job_id=job.job_id)
            if confirm_state not in {"confirmed", "running", "completed"}:
                record = self._record_error(
                    phase="CONFIRM",
                    detail=f"piqd returned invalid confirm state {confirm_state!r}",
                    retry_index=retry_index,
                    job_id=job.job_id,
                    status=(confirm_state if confirm_state in _STATES else None),
                )
                return self._finish(record, job_id=job.job_id)
            self._append(
                event=_event(
                    phase="CONFIRM",
                    disposition="SUCCESS",
                    retry_index=retry_index,
                    job_id=job.job_id,
                    status=confirm_state,
                    detail="stored CNF verified before confirmation",
                ),
                outcome=CHECKPOINT,
                detail=f"CONFIRM: job {job.job_id} is {confirm_state}",
            )
            confirmed = True
            break
        if not confirmed:
            raise PiqdDriverError("confirm loop ended without a terminal record")

        for poll_index in range(self.policy.max_polls):
            try:
                payload = self.client.status(job.job_id)
                state, result = _status_state(payload)
            except PiqdOracleError as exc:
                record = self._record_error(
                    phase="POLL",
                    detail=str(exc),
                    poll_index=poll_index,
                    job_id=job.job_id,
                )
                if not exc.retryable or poll_index + 1 == self.policy.max_polls:
                    return self._finish(record, job_id=job.job_id)
                self.sleep(self.policy.poll_interval_s)
                continue

            if state in {"prepared", "confirmed", "running"}:
                self._append(
                    event=_event(
                        phase="POLL",
                        disposition="SUCCESS",
                        poll_index=poll_index,
                        job_id=job.job_id,
                        status=state,
                        result=result,
                        detail="job remains nonterminal",
                        response=payload,
                    ),
                    outcome=CHECKPOINT,
                    detail=f"POLL: job {job.job_id} is {state}",
                )
                if poll_index + 1 == self.policy.max_polls:
                    record = self._record_error(
                        phase="POLL_TIMEOUT",
                        detail=f"job remained {state} after {self.policy.max_polls} polls",
                        poll_index=poll_index,
                        job_id=job.job_id,
                        status=state,
                    )
                    return self._finish(record, job_id=job.job_id)
                self.sleep(self.policy.poll_interval_s)
                continue

            if state == "failed":
                record = self._record_error(
                    phase="DAEMON_FAILED",
                    detail=f"piqd job entered failed state with result {result!r}",
                    poll_index=poll_index,
                    job_id=job.job_id,
                    status=state,
                    result=result,
                    response=payload,
                )
                return self._finish(record, job_id=job.job_id)

            self._append(
                event=_event(
                    phase="POLL",
                    disposition="SUCCESS",
                    poll_index=poll_index,
                    job_id=job.job_id,
                    status=state,
                    result=result,
                    detail="terminal solver result observed",
                    response=payload,
                ),
                outcome=CHECKPOINT,
                detail=f"POLL: job {job.job_id} completed {result}",
            )
            if result == "UNKNOWN":
                solver_log_hash, _, log_error = self._archive_solver_log(
                    job=job,
                    result="UNKNOWN",
                )
                if log_error is not None:
                    return self._finish(log_error, job_id=job.job_id)
                record = self._record_error(
                    phase="SOLVER_UNKNOWN",
                    detail="piqd completed with solver result UNKNOWN",
                    poll_index=poll_index,
                    job_id=job.job_id,
                    status=state,
                    result=result,
                    artifacts={"solver_log_sha256": solver_log_hash},
                )
                return self._finish(record, job_id=job.job_id)
            if result == "SAT":
                return self._finish_sat(job=job, cnf=cnf)
            if result == "UNSAT":
                return self._finish_unsat(
                    job=job,
                    cnf=cnf,
                    wave_manifest=wave_manifest,
                )
            raise PiqdDriverError(f"unhandled terminal solver result {result!r}")

        raise PiqdDriverError("poll loop ended without a terminal record")

    def _archive_solver_log(
        self,
        *,
        job: PreparedJob,
        result: str,
        artifacts: Mapping[str, str | None] | None = None,
    ) -> tuple[str | None, int, dict[str, Any] | None]:
        for retry_index in range(self.policy.max_result_attempts):
            try:
                solver_log, reported_hash = self.client.log(job)
                if type(solver_log) is not bytes or not solver_log:
                    raise PiqdOracleError(
                        "solver log must be a nonempty built-in bytes value"
                    )
                if (
                    type(reported_hash) is not str
                    or len(reported_hash) != 64
                    or any(char not in _HEX_DIGITS for char in reported_hash)
                ):
                    raise PiqdOracleError(
                        "solver log reported hash is not a lowercase SHA-256 digest"
                    )
                actual_hash = sha256_bytes(solver_log)
                if actual_hash != reported_hash:
                    raise PiqdOracleError(
                        "solver log hash disagrees with retrieved response bytes"
                    )
                archived_hash = self.journal.store_artifact(solver_log)
                if archived_hash != reported_hash:
                    raise PiqdOracleError(
                        "solver log hash disagrees with archived response bytes"
                    )
            except PiqdOracleError as exc:
                record = self._record_error(
                    phase="SOLVER_LOG",
                    detail=str(exc),
                    retry_index=retry_index,
                    job_id=job.job_id,
                    status="completed",
                    result=result,
                    artifacts=artifacts,
                )
                if (
                    not exc.retryable
                    or retry_index + 1 == self.policy.max_result_attempts
                ):
                    return None, retry_index, record
                continue
            return reported_hash, retry_index, None
        raise PiqdDriverError("solver-log loop ended without a terminal record")

    def _finish_sat(self, *, job: PreparedJob, cnf: bytes) -> DriverResult:
        model_hash: str | None = None
        for retry_index in range(self.policy.max_result_attempts):
            try:
                model = self.client.checked_model(job, cnf=cnf)
                archived_hash = self.journal.store_artifact(model.response_body)
                if archived_hash != model.response_sha256:
                    raise PiqdOracleError(
                        "checked model hash disagrees with archived response bytes"
                    )
            except PiqdOracleError as exc:
                if exc.retryable and retry_index + 1 < self.policy.max_result_attempts:
                    self._record_error(
                        phase="MODEL",
                        detail=str(exc),
                        retry_index=retry_index,
                        job_id=job.job_id,
                        status="completed",
                        result="SAT",
                    )
                    continue
                solver_log_hash, _, log_error = self._archive_solver_log(
                    job=job,
                    result="SAT",
                )
                if log_error is not None:
                    return self._finish(log_error, job_id=job.job_id)
                record = self._record_error(
                    phase="MODEL",
                    detail=str(exc),
                    retry_index=retry_index,
                    job_id=job.job_id,
                    status="completed",
                    result="SAT",
                    artifacts={"solver_log_sha256": solver_log_hash},
                )
                return self._finish(record, job_id=job.job_id)
            model_hash = model.response_sha256
            break
        if model_hash is None:
            raise PiqdDriverError("model loop ended without a terminal record")

        solver_log_hash, _, log_error = self._archive_solver_log(
            job=job,
            result="SAT",
            artifacts={"model_sha256": model_hash},
        )
        if log_error is not None:
            return self._finish(log_error, job_id=job.job_id)
        record = self._append(
            event=_event(
                phase="MODEL",
                disposition="SUCCESS",
                retry_index=retry_index,
                job_id=job.job_id,
                status="completed",
                result="SAT",
                detail=(
                    "complete assignment independently satisfies submitted CNF; "
                    "solver log archived"
                ),
                response={"num_assigned": len(model.assignment)},
            ),
            outcome=STRUCTURAL_SAT,
            detail=f"MODEL: checked SAT assignment for job {job.job_id}",
            artifacts={
                "model_sha256": model_hash,
                "solver_log_sha256": solver_log_hash,
            },
        )
        return self._finish(record, job_id=job.job_id)

    def _finish_unsat(
        self,
        *,
        job: PreparedJob,
        cnf: bytes,
        wave_manifest: Mapping[str, Any],
    ) -> DriverResult:
        solver_log_hash, retry_index, log_error = self._archive_solver_log(
            job=job,
            result="UNSAT",
        )
        if log_error is not None:
            return self._finish(log_error, job_id=job.job_id)

        if self.proof_replayer is None:
            record = self._append(
                event=_event(
                    phase="SOLVER_LOG",
                    disposition="SUCCESS",
                    retry_index=retry_index,
                    job_id=job.job_id,
                    status="completed",
                    result="UNSAT",
                    detail="solver log archived; no proof checker or replay receipt",
                ),
                outcome=DISCOVERY_UNSAT,
                detail=(
                    f"SOLVER_LOG: job {job.job_id} is discovery-only UNSAT; "
                    "independent proof checking remains"
                ),
                artifacts={"solver_log_sha256": solver_log_hash},
            )
            return self._finish(record, job_id=job.job_id)

        self._append(
            event=_event(
                phase="SOLVER_LOG",
                disposition="SUCCESS",
                job_id=job.job_id,
                status="completed",
                result="UNSAT",
                detail="solver log archived; independent proof replay follows",
            ),
            outcome=CHECKPOINT,
            detail=f"SOLVER_LOG: archived terminal log for job {job.job_id}",
            artifacts={"solver_log_sha256": solver_log_hash},
        )

        proof: bytes | None = None
        proof_hash: str | None = None
        for retry_index in range(self.policy.max_result_attempts):
            try:
                proof, reported_proof_hash = self.client.proof(job)
                archived_proof_hash = self.journal.store_artifact(proof)
                if archived_proof_hash != reported_proof_hash:
                    raise PiqdOracleError(
                        "proof hash disagrees with archived response bytes"
                    )
                proof_hash = reported_proof_hash
            except PiqdProofUnavailable as exc:
                record = self._append(
                    event=_event(
                        phase="PROOF",
                        disposition="ERROR",
                        retry_index=retry_index,
                        job_id=job.job_id,
                        status="completed",
                        result="UNSAT",
                        detail=str(exc),
                    ),
                    outcome=DISCOVERY_UNSAT,
                    detail=(
                        f"PROOF: job {job.job_id} remains discovery-only; "
                        "no proof artifact is available"
                    ),
                    artifacts={"solver_log_sha256": solver_log_hash},
                )
                return self._finish(record, job_id=job.job_id)
            except PiqdOracleError as exc:
                record = self._record_error(
                    phase="PROOF",
                    detail=str(exc),
                    retry_index=retry_index,
                    job_id=job.job_id,
                    status="completed",
                    result="UNSAT",
                    artifacts={"solver_log_sha256": solver_log_hash},
                )
                if (
                    not exc.retryable
                    or retry_index + 1 == self.policy.max_result_attempts
                ):
                    return self._finish(record, job_id=job.job_id)
                continue
            break
        if proof is None or proof_hash is None:
            raise PiqdDriverError("proof loop ended without a terminal record")

        try:
            replay = self.proof_replayer.replay(
                job=job,
                wave_manifest=wave_manifest,
                cnf=cnf,
                proof=proof,
                proof_sha256=proof_hash,
            )
            validate_replay_result(
                result=replay,
                job=job,
                wave_manifest=wave_manifest,
                cnf=cnf,
                proof=proof,
                proof_sha256=proof_hash,
            )
            if replay.verified and type(self.proof_replayer) is not LeanLratReplayer:
                raise LratReplayError(
                    "only the concrete Lean LRAT replayer may certify UNSAT"
                )
            checker_hash = self.journal.store_artifact(replay.checker_source)
            replay_hash = self.journal.store_artifact(replay.receipt)
        except LratReplayError as exc:
            record = self._record_error(
                phase="PROOF_REPLAY",
                detail=str(exc),
                job_id=job.job_id,
                status="completed",
                result="UNSAT",
                artifacts={
                    "solver_log_sha256": solver_log_hash,
                    "proof_sha256": proof_hash,
                },
            )
            return self._finish(record, job_id=job.job_id)

        artifacts = {
            "solver_log_sha256": solver_log_hash,
            "proof_sha256": proof_hash,
            "proof_checker_sha256": checker_hash,
            "proof_replay_sha256": replay_hash,
        }
        if not replay.verified:
            record = self._record_error(
                phase="PROOF_REPLAY",
                detail="Lean rejected the compact LRAT against the canonical kept CNF",
                job_id=job.job_id,
                status="completed",
                result="UNSAT",
                artifacts=artifacts,
            )
            return self._finish(record, job_id=job.job_id)

        record = self._append(
            event=_event(
                phase="PROOF_REPLAY",
                disposition="SUCCESS",
                job_id=job.job_id,
                status="completed",
                result="UNSAT",
                detail=(
                    "independent Lean verifyCert_correct replay accepted the "
                    "downloaded compact LRAT"
                ),
                response={
                    "proof_sha256": proof_hash,
                    "proof_checker_sha256": checker_hash,
                    "proof_replay_sha256": replay_hash,
                },
            ),
            outcome=CERTIFIED_UNSAT,
            detail=(
                f"PROOF_REPLAY: finite CNF for job {job.job_id} is certified UNSAT; "
                "this is not theorem closure"
            ),
            artifacts=artifacts,
        )
        return self._finish(record, job_id=job.job_id)


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base-url", required=True)
    parser.add_argument("--wave-manifest", type=Path, required=True)
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--producer-manifest", type=Path, required=True)
    parser.add_argument("--journal", type=Path, required=True)
    parser.add_argument("--max-prepare-attempts", type=int, default=3)
    parser.add_argument("--max-confirm-attempts", type=int, default=3)
    parser.add_argument("--max-polls", type=int, default=300)
    parser.add_argument("--max-result-attempts", type=int, default=3)
    parser.add_argument("--poll-interval-s", type=float, default=2.0)
    parser.add_argument("--solver-timeout-s", type=int, default=900)
    parser.add_argument("--march-timeout-s", type=int, default=900)
    parser.add_argument("--project", default="erdos-97-96-formalization")
    parser.add_argument("--requested-core-limit", type=int)
    parser.add_argument("--replay-work-dir", type=Path)
    parser.add_argument("--replay-timeout-s", type=int, default=300)
    return parser


def _result_exit_code(outcome: str) -> int:
    if outcome == STRUCTURAL_SAT:
        return 0
    if outcome == DISCOVERY_UNSAT:
        return 3
    if outcome == CERTIFIED_UNSAT:
        return 4
    return 2


def main(argv: list[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        manifest = _strict_json(
            args.wave_manifest.read_bytes(), source=str(args.wave_manifest)
        )
        policy = DriverPolicy(
            max_prepare_attempts=args.max_prepare_attempts,
            max_confirm_attempts=args.max_confirm_attempts,
            max_polls=args.max_polls,
            max_result_attempts=args.max_result_attempts,
            poll_interval_s=args.poll_interval_s,
            solver_timeout_s=args.solver_timeout_s,
            march_timeout_s=args.march_timeout_s,
            project=args.project,
            requested_core_limit=args.requested_core_limit,
        )
        journal = DurableAttemptJournal(args.journal, manifest=manifest)
        result = PiqdCegarDriver(
            client=PiqdRawDimacsClient(args.base_url),
            journal=journal,
            policy=policy,
            proof_replayer=LeanLratReplayer(
                lean_root=Path(__file__).resolve().parents[2] / "lean",
                work_dir=(
                    args.replay_work_dir
                    or args.journal.with_name(f"{args.journal.name}.replay-work")
                ),
                timeout_s=args.replay_timeout_s,
            ),
        ).run(
            wave_manifest=manifest,
            cnf=args.cnf.read_bytes(),
            producer_manifest=args.producer_manifest.read_bytes(),
        )
    except (OSError, PiqdDriverError, PiqdOracleError, LratReplayError) as exc:
        print(f"phase3_piqd_driver: {exc}", file=sys.stderr)
        return 2
    print(canonical_json_bytes(result.__dict__).decode())
    return _result_exit_code(result.outcome)


if __name__ == "__main__":
    raise SystemExit(main())
