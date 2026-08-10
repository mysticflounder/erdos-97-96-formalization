"""One-shot custody for a theorem-authorized, already-appended PIQD successor.

This adapter is intentionally narrower than ``PiqdIncrementalDiscoveryRunner``.
It does not claim ownership of a legacy session or reconstruct a local history.
Instead it authenticates the daemon's present CNF export, verifies that the
latest durable solve receipt names the exact byte prefix before the pending
clauses, captures the complete pre-solve state, and performs exactly one solve.

The result is discovery evidence only.  It is neither a proof certificate nor
a Lean closure claim.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
import urllib.error
import urllib.request
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.p97_search.phase3_piqd_incremental_discovery import (
    RECEIPT_OPTIONAL,
    RECEIPT_REQUIRED,
    RESPONSE_KEYS,
    SESSION_KEYS,
    HttpResponse,
    Transport,
    _boolean,
    _hex64,
    _integer,
    _json_bytes,
    _result_digest,
    _strict_value,
    _string,
    _uuid,
)
from census.p97_search.phase3_piqd_postwave_gate import (
    PostwaveGateError,
    _iter_dimacs_clauses,
)
from census.p97_search.phase3_piqd_theorem_gated_discovery import (
    run_authorized_preappended_successor,
)

SCHEMA = "p97-piqd-preappended-snapshot-v1"
CAPTURE_SCHEMA = "p97-piqd-sat-session-model-capture-v1"
MODEL_SCHEMA = "p97-piqd-captured-model-v1"


class PiqdPreappendedSnapshotError(RuntimeError):
    """The present PIQD snapshot or its one-shot transition is not trustworthy."""


ExportDigest = Callable[[str], str]


@dataclass(frozen=True)
class RootIdentity:
    variables: int
    clauses: int
    bytes: int
    sha256: str
    body_bytes: int
    body_sha256: str
    header_bytes: int
    device: int
    inode: int
    mtime_ns: int


@dataclass(frozen=True)
class SnapshotSolveResult:
    status: str
    assignment: tuple[int, ...]
    solve_index: int
    result_sha256: str
    receipt: Mapping[str, Any]
    root_clauses: int
    root_sha256: str
    proof_verified: bool = False
    closure_claim: bool = False


def _hash_stream(stream: Any) -> str:
    digest = hashlib.sha256()
    for chunk in iter(lambda: stream.read(1024 * 1024), b""):
        if type(chunk) is not bytes:
            raise PiqdPreappendedSnapshotError("stream returned non-byte content")
        digest.update(chunk)
    return digest.hexdigest()


def _default_export_digest(url: str) -> str:
    request = urllib.request.Request(url, method="GET")
    try:
        with urllib.request.urlopen(request, timeout=120) as response:
            status = getattr(response, "status", None)
            if type(status) is not int or not 200 <= status < 300:
                raise PiqdPreappendedSnapshotError(
                    f"PIQD export returned HTTP {status}"
                )
            return _hash_stream(response)
    except (OSError, urllib.error.URLError) as exc:
        raise PiqdPreappendedSnapshotError("PIQD export could not be streamed") from exc


def _open_stable_regular(path: Path) -> tuple[int, os.stat_result]:
    """Open ``path`` without following its final component and bind its inode."""

    path = Path(path)
    before = os.lstat(path)
    if not stat.S_ISREG(before.st_mode) or stat.S_ISLNK(before.st_mode):
        raise PiqdPreappendedSnapshotError("root must be a regular non-symlink file")
    descriptor = os.open(path, os.O_RDONLY | os.O_CLOEXEC | os.O_NOFOLLOW)
    opened = os.fstat(descriptor)
    if not stat.S_ISREG(opened.st_mode) or (
        opened.st_dev,
        opened.st_ino,
    ) != (before.st_dev, before.st_ino):
        os.close(descriptor)
        raise PiqdPreappendedSnapshotError("root changed while it was opened")
    return descriptor, opened


def _root_identity(path: Path) -> RootIdentity:
    path = Path(path)
    descriptor, opened = _open_stable_regular(path)
    full = hashlib.sha256()
    body = hashlib.sha256()
    body_bytes = 0
    with os.fdopen(descriptor, "rb", closefd=True) as stream:
        header = stream.readline()
        full.update(header)
        try:
            fields = header.decode("ascii").strip().split()
            if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
                raise ValueError
            variables = int(fields[2])
            clauses = int(fields[3])
        except (UnicodeDecodeError, ValueError) as exc:
            raise PiqdPreappendedSnapshotError(
                "root must begin with an exact DIMACS header"
            ) from exc
        if variables < 1 or clauses < 1:
            raise PiqdPreappendedSnapshotError(
                "root DIMACS dimensions must be positive"
            )
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            full.update(chunk)
            body.update(chunk)
            body_bytes += len(chunk)
        finished = os.fstat(stream.fileno())
    after = os.lstat(path)
    stable_fields = ("st_dev", "st_ino", "st_size", "st_mtime_ns")
    if any(
        getattr(opened, key) != getattr(finished, key) for key in stable_fields
    ) or any(getattr(opened, key) != getattr(after, key) for key in stable_fields):
        raise PiqdPreappendedSnapshotError("root changed while it was hashed")
    return RootIdentity(
        variables=variables,
        clauses=clauses,
        bytes=len(header) + body_bytes,
        sha256=full.hexdigest(),
        body_bytes=body_bytes,
        body_sha256=body.hexdigest(),
        header_bytes=len(header),
        device=opened.st_dev,
        inode=opened.st_ino,
        mtime_ns=opened.st_mtime_ns,
    )


def _body_prefix_sha256(path: Path, *, header_bytes: int, prefix_bytes: int) -> str:
    if type(prefix_bytes) is not int or prefix_bytes < 0:
        raise PiqdPreappendedSnapshotError("receipt base byte count is invalid")
    digest = hashlib.sha256()
    remaining = prefix_bytes
    descriptor, opened = _open_stable_regular(Path(path))
    with os.fdopen(descriptor, "rb", closefd=True) as stream:
        if len(stream.read(header_bytes)) != header_bytes:
            raise PiqdPreappendedSnapshotError("root header became unreadable")
        while remaining:
            chunk = stream.read(min(1024 * 1024, remaining))
            if not chunk:
                raise PiqdPreappendedSnapshotError(
                    "receipt base exceeds the current journal body"
                )
            digest.update(chunk)
            remaining -= len(chunk)
        finished = os.fstat(stream.fileno())
    after = os.lstat(path)
    stable_fields = ("st_dev", "st_ino", "st_size", "st_mtime_ns")
    if any(
        getattr(opened, key) != getattr(finished, key) for key in stable_fields
    ) or any(getattr(opened, key) != getattr(after, key) for key in stable_fields):
        raise PiqdPreappendedSnapshotError("root changed during prefix authentication")
    return digest.hexdigest()


def _safe_output_path(path: Path) -> Path:
    """Require an existing, symlink-free custody directory."""

    path = Path(path).absolute()
    parent = path.parent
    if not parent.is_dir():
        raise PiqdPreappendedSnapshotError(
            f"custody output directory does not exist: {parent}"
        )
    for component in (parent, *parent.parents):
        info = os.lstat(component)
        if stat.S_ISLNK(info.st_mode):
            raise PiqdPreappendedSnapshotError(
                f"custody output directory is symlinked: {component}"
            )
    return path


def _exclusive_atomic_write(path: Path, data: bytes) -> None:
    """Publish complete custody evidence without replacing an existing artifact."""

    path = _safe_output_path(path)
    if path.exists() or path.is_symlink():
        raise PiqdPreappendedSnapshotError(f"refusing to overwrite {path}")
    temporary = path.with_name(f".{path.name}.{os.getpid()}.tmp")
    descriptor = os.open(
        temporary,
        os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_CLOEXEC | os.O_NOFOLLOW,
        0o600,
    )
    try:
        with os.fdopen(descriptor, "wb", closefd=True) as stream:
            stream.write(data)
            stream.flush()
            os.fsync(stream.fileno())
        os.link(temporary, path, follow_symlinks=False)
        temporary.unlink()
    except BaseException:
        try:
            temporary.unlink()
        except FileNotFoundError:
            pass
        raise


def _require_exact_keys(
    value: Mapping[str, Any], expected: set[str], label: str
) -> None:
    if set(value) != expected:
        raise PiqdPreappendedSnapshotError(f"{label} has an inexact schema")


def _literal_list(value: Any, *, label: str) -> list[int]:
    if type(value) is not list or any(
        type(literal) is not int or literal == 0 for literal in value
    ):
        raise PiqdPreappendedSnapshotError(
            f"{label} must be a list of nonzero integers"
        )
    return value


class PiqdPreappendedSnapshotRunner:
    """Authenticate and consume exactly one pending PIQD successor."""

    def __init__(
        self,
        base_url: str,
        session_id: str,
        root_path: Path,
        *,
        expected_solve_count: int,
        expected_solver_sha256: str,
        expected_pending_clauses: int,
        snapshot_path: Path,
        raw_response_path: Path,
        capture_path: Path,
        model_path: Path,
        transport: Transport | None = None,
        export_digest: ExportDigest | None = None,
    ) -> None:
        self.base_url = _string(base_url, label="base_url").rstrip("/")
        self._session_id = _uuid(session_id, label="session_id")
        self.root_path = Path(root_path).absolute()
        self._solve_count = _integer(
            expected_solve_count, label="expected_solve_count", minimum=1
        )
        self._solver_sha256 = _hex64(
            expected_solver_sha256, label="expected_solver_sha256"
        )
        self.expected_pending_clauses = _integer(
            expected_pending_clauses,
            label="expected_pending_clauses",
            minimum=1,
        )
        self.snapshot_path = _safe_output_path(snapshot_path)
        self.raw_response_path = _safe_output_path(raw_response_path)
        self.capture_path = _safe_output_path(capture_path)
        self.model_path = _safe_output_path(model_path)
        if (
            len(
                {
                    self.snapshot_path,
                    self.raw_response_path,
                    self.capture_path,
                    self.model_path,
                }
            )
            != 4
        ):
            raise PiqdPreappendedSnapshotError("capture paths must be distinct")
        self._require_vacant_outputs()
        if transport is None:
            from census.p97_search.phase3_piqd_oracle import _stdlib_transport

            transport = _stdlib_transport
        self._transport = transport
        self._export_digest = export_digest or _default_export_digest
        self._root = _root_identity(self.root_path)
        self._consumed = False
        session, receipts = self._authenticate_present_snapshot()
        self._authenticate_dimacs_receipt_history(receipts)
        self._session_before = session
        self._receipts_before = receipts

    def _require_vacant_outputs(self) -> None:
        for path in (
            self.snapshot_path,
            self.raw_response_path,
            self.capture_path,
            self.model_path,
        ):
            if path.exists() or path.is_symlink():
                raise PiqdPreappendedSnapshotError(
                    f"refusing to reuse existing custody artifact {path}"
                )

    @property
    def session_id(self) -> str:
        return self._session_id

    @property
    def solve_count(self) -> int:
        return self._solve_count

    @property
    def solver_sha256(self) -> str:
        return self._solver_sha256

    @property
    def exported_cnf_sha256(self) -> str:
        return self._root.sha256

    def append_clauses(self, clauses: Sequence[Sequence[int]]) -> int:
        del clauses
        raise PiqdPreappendedSnapshotError(
            "snapshot custody cannot append; the successor must already exist"
        )

    def close(self) -> None:
        raise PiqdPreappendedSnapshotError(
            "snapshot custody never closes a legacy shared session"
        )

    def _request_any_status(
        self, method: str, path: str, body: bytes | None = None
    ) -> HttpResponse:
        response = self._transport(
            method,
            self.base_url + path,
            body,
            {"content-type": "application/json"} if body is not None else {},
        )
        if type(response.status) is not int or type(response.body) is not bytes:
            raise PiqdPreappendedSnapshotError(
                f"PIQD {method} {path} returned an invalid response"
            )
        return response

    def _request(
        self, method: str, path: str, body: bytes | None = None
    ) -> HttpResponse:
        response = self._request_any_status(method, path, body)
        if not 200 <= response.status < 300:
            raise PiqdPreappendedSnapshotError(
                f"PIQD {method} {path} returned HTTP {response.status}"
            )
        return response

    def _json(
        self, method: str, path: str, body: Mapping[str, Any] | None = None
    ) -> dict[str, Any]:
        raw = self._request(
            method, path, None if body is None else _json_bytes(body)
        ).body
        try:
            value = _strict_value(raw, label=f"PIQD {method} {path}")
        except Exception as exc:
            raise PiqdPreappendedSnapshotError(
                f"PIQD {method} {path} did not return strict JSON"
            ) from exc
        if type(value) is not dict:
            raise PiqdPreappendedSnapshotError("PIQD JSON response must be an object")
        return value

    def _check_receipts(self, payload: Mapping[str, Any]) -> list[dict[str, Any]]:
        _require_exact_keys(
            payload,
            {
                "session_id",
                "lane",
                "journal_path",
                "receipts_path",
                "count",
                "receipts",
            },
            "PIQD receipt list",
        )
        if payload["session_id"] != self._session_id or payload["lane"] != "sat":
            raise PiqdPreappendedSnapshotError("PIQD receipt identity/lane mismatch")
        _uuid(payload["session_id"], label="receipts.session_id")
        _string(payload["journal_path"], label="receipts.journal_path", nonempty=True)
        _string(payload["receipts_path"], label="receipts.receipts_path", nonempty=True)
        count = _integer(payload["count"], label="receipts.count", minimum=1)
        raw_receipts = payload["receipts"]
        if type(raw_receipts) is not list or count != len(raw_receipts):
            raise PiqdPreappendedSnapshotError(
                "PIQD receipt list count is inconsistent"
            )
        receipts: list[dict[str, Any]] = []
        for index, raw in enumerate(raw_receipts, start=1):
            if (
                type(raw) is not dict
                or set(raw) - (RECEIPT_REQUIRED | RECEIPT_OPTIONAL)
                or not RECEIPT_REQUIRED <= set(raw)
            ):
                raise PiqdPreappendedSnapshotError("PIQD receipt has an inexact schema")
            if (
                _integer(raw["solve_index"], label="receipt.solve_index", minimum=1)
                != index
            ):
                raise PiqdPreappendedSnapshotError("PIQD receipt indices are not dense")
            if raw["assumptions"] != [] or type(raw["assumptions"]) is not list:
                raise PiqdPreappendedSnapshotError(
                    "PIQD receipt is not assumption-free"
                )
            base_clauses = _integer(
                raw["base_clauses"], label="receipt.base_clauses", minimum=1
            )
            base_bytes = _integer(
                raw["base_bytes"], label="receipt.base_bytes", minimum=1
            )
            if receipts and (
                base_clauses < receipts[-1]["base_clauses"]
                or base_bytes < receipts[-1]["base_bytes"]
            ):
                raise PiqdPreappendedSnapshotError(
                    "PIQD receipt frontier is not append-only"
                )
            _hex64(raw["base_sha256"], label="receipt.base_sha256")
            _hex64(raw["result_sha256"], label="receipt.result_sha256")
            if raw["status"] not in {"SAT", "UNSAT", "UNKNOWN"}:
                raise PiqdPreappendedSnapshotError("PIQD receipt status is invalid")
            if type(raw["model_recorded"]) is not bool:
                raise PiqdPreappendedSnapshotError("receipt.model_recorded is invalid")
            if raw["model_recorded"] is not (raw["status"] == "SAT"):
                raise PiqdPreappendedSnapshotError(
                    "receipt model-recording flag is inconsistent with status"
                )
            _integer(raw["at"], label="receipt.at", minimum=0)
            if "timeout_ms" in raw:
                _integer(raw["timeout_ms"], label="receipt.timeout_ms", minimum=0)
            if "conflict_limit" in raw:
                _integer(
                    raw["conflict_limit"],
                    label="receipt.conflict_limit",
                    minimum=1,
                )
            if "interrupted_by" in raw:
                _string(
                    raw["interrupted_by"],
                    label="receipt.interrupted_by",
                    nonempty=True,
                )
            if "core" in raw:
                _literal_list(raw["core"], label="receipt.core")
            batch_keys = {
                "batch_key",
                "batch_position",
                "batch_size",
                "batch_request_sha256",
            }
            present_batch_keys = batch_keys & set(raw)
            if present_batch_keys and present_batch_keys != batch_keys:
                raise PiqdPreappendedSnapshotError(
                    "receipt batch metadata must be complete"
                )
            if "batch_key" in raw:
                _string(raw["batch_key"], label="receipt.batch_key", nonempty=True)
                _integer(
                    raw["batch_position"],
                    label="receipt.batch_position",
                    minimum=0,
                )
                _integer(raw["batch_size"], label="receipt.batch_size", minimum=1)
            if "batch_request_sha256" in raw:
                _hex64(
                    raw["batch_request_sha256"],
                    label="receipt.batch_request_sha256",
                )
            receipts.append(raw)
        return receipts

    def _authenticate_dimacs_receipt_history(self, payload: Mapping[str, Any]) -> None:
        """Validate every clause and every historical receipt prefix in one pass."""

        receipts = self._check_receipts(payload)
        by_boundary: dict[int, list[Mapping[str, Any]]] = {}
        for receipt in receipts:
            by_boundary.setdefault(receipt["base_bytes"], []).append(receipt)
        pending_boundaries = sorted(by_boundary)
        boundary_index = 0
        body_digest = hashlib.sha256()
        body_bytes = 0
        clause_count = 0
        max_var = 0
        descriptor, opened = _open_stable_regular(self.root_path)
        with os.fdopen(descriptor, "rb", closefd=True) as stream:
            header = stream.readline()
            if len(header) != self._root.header_bytes:
                raise PiqdPreappendedSnapshotError(
                    "root header changed during history authentication"
                )
            for raw_line in stream:
                if not raw_line.endswith(b"\n"):
                    raise PiqdPreappendedSnapshotError(
                        "PIQD journal clause lacks a newline boundary"
                    )
                body_digest.update(raw_line)
                body_bytes += len(raw_line)
                try:
                    tokens = [int(token) for token in raw_line.decode("ascii").split()]
                except (UnicodeDecodeError, ValueError) as exc:
                    raise PiqdPreappendedSnapshotError(
                        "PIQD journal contains a malformed clause"
                    ) from exc
                if not tokens or tokens[-1] != 0 or 0 in tokens[:-1]:
                    raise PiqdPreappendedSnapshotError(
                        "PIQD journal is not one terminated clause per line"
                    )
                literals = tokens[:-1]
                if not literals:
                    raise PiqdPreappendedSnapshotError(
                        "PIQD journal contains an empty clause"
                    )
                max_var = max(max_var, *(abs(literal) for literal in literals))
                if max_var > self._root.variables:
                    raise PiqdPreappendedSnapshotError(
                        "PIQD journal literal exceeds the declared variable range"
                    )
                clause_count += 1
                if (
                    boundary_index < len(pending_boundaries)
                    and pending_boundaries[boundary_index] < body_bytes
                ):
                    raise PiqdPreappendedSnapshotError(
                        "historical receipt does not end at a clause boundary"
                    )
                while (
                    boundary_index < len(pending_boundaries)
                    and pending_boundaries[boundary_index] == body_bytes
                ):
                    for receipt in by_boundary[body_bytes]:
                        if (
                            receipt["base_clauses"] != clause_count
                            or receipt["base_sha256"] != body_digest.hexdigest()
                        ):
                            raise PiqdPreappendedSnapshotError(
                                "historical receipt does not authenticate its root prefix"
                            )
                    boundary_index += 1
            finished = os.fstat(stream.fileno())
        after = os.lstat(self.root_path)
        stable_fields = ("st_dev", "st_ino", "st_size", "st_mtime_ns")
        if any(
            getattr(opened, key) != getattr(finished, key) for key in stable_fields
        ) or any(getattr(opened, key) != getattr(after, key) for key in stable_fields):
            raise PiqdPreappendedSnapshotError(
                "root changed during history authentication"
            )
        if boundary_index != len(pending_boundaries):
            raise PiqdPreappendedSnapshotError(
                "historical receipt exceeds the current journal body"
            )
        if (
            body_bytes != self._root.body_bytes
            or body_digest.hexdigest() != self._root.body_sha256
            or clause_count != self._root.clauses
        ):
            raise PiqdPreappendedSnapshotError(
                "root DIMACS body does not match its authenticated dimensions"
            )

    def _check_session(
        self, payload: Mapping[str, Any], *, solve_count: int, latest: Mapping[str, Any]
    ) -> None:
        allowed = SESSION_KEYS | {"solver_stats"}
        if set(payload) - allowed or set(payload) & SESSION_KEYS != SESSION_KEYS:
            raise PiqdPreappendedSnapshotError("PIQD session has an inexact schema")
        if (
            payload["id"] != self._session_id
            or payload["lane"] != "sat"
            or payload["state"] != "live"
        ):
            raise PiqdPreappendedSnapshotError("PIQD session identity/state mismatch")
        if payload["solver_sha256"] != self._solver_sha256:
            raise PiqdPreappendedSnapshotError("PIQD solver binary identity changed")
        _string(payload["solver_name"], label="session.solver_name", nonempty=True)
        _hex64(payload["solver_sha256"], label="session.solver_sha256")
        _string(
            payload["solver_signature"],
            label="session.solver_signature",
            nonempty=True,
        )
        _integer(
            payload["protocol_version"], label="session.protocol_version", minimum=1
        )
        _string(payload["journal_path"], label="session.journal_path", nonempty=True)
        _integer(payload["created_at"], label="session.created_at", minimum=0)
        _integer(payload["updated_at"], label="session.updated_at", minimum=0)
        clauses = _integer(payload["clauses"], label="session.clauses", minimum=0)
        max_var = _integer(payload["max_var"], label="session.max_var", minimum=0)
        solves = _integer(payload["solves"], label="session.solves", minimum=0)
        declared = payload["declared_num_vars"]
        if declared is not None:
            declared = _integer(declared, label="session.declared_num_vars", minimum=0)
        if payload["last_status"] not in {"SAT", "UNSAT", "UNKNOWN"}:
            raise PiqdPreappendedSnapshotError("session.last_status is invalid")
        last_index = _integer(
            payload["last_solve_index"],
            label="session.last_solve_index",
            minimum=1,
        )
        _boolean(
            payload["last_assumption_free"],
            label="session.last_assumption_free",
        )
        expected_terminal = (
            True if latest["status"] == "UNSAT" and latest.get("core") == [] else None
        )
        if payload["last_terminal_unsat"] != expected_terminal:
            raise PiqdPreappendedSnapshotError(
                "session.last_terminal_unsat is inconsistent"
            )
        if payload["label"] is not None:
            _string(payload["label"], label="session.label")
        if "solver_stats" in payload and type(payload["solver_stats"]) is not dict:
            raise PiqdPreappendedSnapshotError("session.solver_stats is invalid")
        if (
            clauses != self._root.clauses
            or max(max_var, declared or 0) != self._root.variables
            or solves != solve_count
        ):
            raise PiqdPreappendedSnapshotError("PIQD session/root dimensions mismatch")
        if (
            payload["last_status"] != latest["status"]
            or last_index != latest["solve_index"]
            or payload["last_assumption_free"] is not True
        ):
            raise PiqdPreappendedSnapshotError(
                "PIQD latest solve state is inconsistent"
            )

    def _authenticate_present_snapshot(self) -> tuple[dict[str, Any], dict[str, Any]]:
        if _root_identity(self.root_path) != self._root:
            raise PiqdPreappendedSnapshotError("local root changed during custody")
        session = self._json("GET", f"/sessions/{self._session_id}")
        receipt_payload = self._json("GET", f"/sessions/{self._session_id}/receipts")
        receipts = self._check_receipts(receipt_payload)
        if len(receipts) != self._solve_count:
            raise PiqdPreappendedSnapshotError("PIQD solve frontier changed")
        latest = receipts[-1]
        self._check_session(session, solve_count=self._solve_count, latest=latest)
        if (
            self._root.clauses - latest["base_clauses"] != self.expected_pending_clauses
            or latest["base_bytes"] >= self._root.body_bytes
        ):
            raise PiqdPreappendedSnapshotError(
                "pending clause count does not reconcile with the latest solve receipt"
            )
        if (
            _body_prefix_sha256(
                self.root_path,
                header_bytes=self._root.header_bytes,
                prefix_bytes=latest["base_bytes"],
            )
            != latest["base_sha256"]
        ):
            raise PiqdPreappendedSnapshotError(
                "latest solve receipt does not authenticate the root body prefix"
            )
        remote_sha = self._export_digest(
            f"{self.base_url}/sessions/{self._session_id}/cnf"
        )
        if remote_sha != self._root.sha256:
            raise PiqdPreappendedSnapshotError(
                "PIQD export differs from the local root"
            )
        return session, receipt_payload

    def _validate_model(self, model: Any) -> tuple[int, ...]:
        if type(model) is not list or len(model) != self._root.variables:
            raise PiqdPreappendedSnapshotError("PIQD SAT model is not total")
        for index, literal in enumerate(model, start=1):
            if type(literal) is not int or abs(literal) != index:
                raise PiqdPreappendedSnapshotError(
                    "PIQD SAT model is not in canonical variable order"
                )
        try:
            signs = tuple(literal > 0 for literal in model)
            for index, clause in enumerate(
                _iter_dimacs_clauses(self.root_path), start=1
            ):
                if not any(
                    signs[abs(literal) - 1] is (literal > 0) for literal in clause
                ):
                    raise PiqdPreappendedSnapshotError(
                        f"PIQD SAT model fails root clause {index}"
                    )
        except PostwaveGateError as exc:
            raise PiqdPreappendedSnapshotError("local DIMACS replay failed") from exc
        return tuple(model)

    def solve(
        self, *, timeout_ms: int | None = None, conflict_limit: int | None = None
    ) -> SnapshotSolveResult:
        if self._consumed:
            raise PiqdPreappendedSnapshotError("snapshot successor is one-shot")
        self._require_vacant_outputs()
        if timeout_ms is not None and (type(timeout_ms) is not int or timeout_ms < 0):
            raise PiqdPreappendedSnapshotError("timeout_ms must be non-negative")
        if conflict_limit is not None and (
            type(conflict_limit) is not int or conflict_limit <= 0
        ):
            raise PiqdPreappendedSnapshotError("conflict_limit must be positive")

        session_before, receipts_before = self._authenticate_present_snapshot()
        if (
            session_before != self._session_before
            or receipts_before != self._receipts_before
        ):
            raise PiqdPreappendedSnapshotError(
                "PIQD source snapshot changed before the authorized solve"
            )
        snapshot = {
            "schema": SCHEMA,
            "session_before": session_before,
            "receipts_before": receipts_before,
            "root": {
                "path": str(self.root_path),
                "sha256": self._root.sha256,
                "bytes": self._root.bytes,
                "variables": self._root.variables,
                "clauses": self._root.clauses,
                "journal_sha256": self._root.body_sha256,
                "journal_bytes": self._root.body_bytes,
                "pending_clauses": self.expected_pending_clauses,
            },
            "proof_verified": False,
            "closure_claim": False,
        }
        _exclusive_atomic_write(self.snapshot_path, _json_bytes(snapshot) + b"\n")

        request: dict[str, Any] = {"assumptions": [], "include_model": True}
        if timeout_ms is not None:
            request["timeout_ms"] = timeout_ms
        if conflict_limit is not None:
            request["conflict_limit"] = conflict_limit
        http_response = self._request_any_status(
            "POST",
            f"/sessions/{self._session_id}/solve",
            _json_bytes(request),
        )
        raw_response = http_response.body
        _exclusive_atomic_write(self.raw_response_path, raw_response + b"\n")
        if _root_identity(self.root_path) != self._root:
            raise PiqdPreappendedSnapshotError("local root changed during solve")
        if not 200 <= http_response.status < 300:
            raise PiqdPreappendedSnapshotError(
                "PIQD POST "
                f"/sessions/{self._session_id}/solve returned HTTP "
                f"{http_response.status}; raw response preserved at "
                f"{self.raw_response_path}"
            )
        try:
            response = _strict_value(raw_response, label="PIQD solve response")
        except Exception as exc:
            raise PiqdPreappendedSnapshotError(
                "PIQD solve response is not strict JSON"
            ) from exc
        if (
            type(response) is not dict
            or set(response) - RESPONSE_KEYS
            or not {
                "status",
                "solve_ms",
                "solve_index",
                "result_sha256",
            }
            <= set(response)
        ):
            raise PiqdPreappendedSnapshotError(
                "PIQD solve response has an inexact schema"
            )
        status = response["status"]
        if status not in {"SAT", "UNSAT", "UNKNOWN"}:
            raise PiqdPreappendedSnapshotError("PIQD solve status is invalid")
        _integer(response["solve_ms"], label="solve_ms")
        solve_index = _integer(response["solve_index"], label="solve_index", minimum=1)
        result_sha256 = _hex64(response["result_sha256"], label="result_sha256")
        if solve_index != self._solve_count + 1:
            raise PiqdPreappendedSnapshotError("PIQD solve index is not the successor")

        model = response.get("model")
        core = response.get("core")
        interrupted = response.get("interrupted_by")
        terminal = response.get("terminal_unsat")
        if interrupted is not None:
            interrupted = _string(interrupted, label="interrupted_by", nonempty=True)
        if core is not None:
            core = _literal_list(core, label="core")
        if terminal is not None:
            terminal = _boolean(terminal, label="terminal_unsat")
        if status == "SAT":
            if core is not None or interrupted is not None or terminal is not None:
                raise PiqdPreappendedSnapshotError("SAT response fields are malformed")
            assignment = self._validate_model(model)
            digest_model: Sequence[int] | None = assignment
            digest_core = None
        elif status == "UNSAT":
            if (
                model is not None
                or interrupted is not None
                or core != []
                or terminal is not True
            ):
                raise PiqdPreappendedSnapshotError(
                    "UNSAT is not assumption-free terminal UNSAT"
                )
            assignment = ()
            digest_model = None
            digest_core = core
        else:
            if model is not None or core is not None or terminal is not None:
                raise PiqdPreappendedSnapshotError(
                    "UNKNOWN response fields are malformed"
                )
            assignment = ()
            digest_model = None
            digest_core = None
        if (
            _result_digest(status, interrupted, digest_core, digest_model)
            != result_sha256
        ):
            raise PiqdPreappendedSnapshotError("PIQD result digest is inconsistent")

        receipts_after_payload = self._json(
            "GET", f"/sessions/{self._session_id}/receipts"
        )
        receipts_after = self._check_receipts(receipts_after_payload)
        prior = self._check_receipts(receipts_before)
        if len(receipts_after) != self._solve_count + 1 or receipts_after[:-1] != prior:
            raise PiqdPreappendedSnapshotError(
                "PIQD receipt history changed around solve"
            )
        receipt = receipts_after[-1]
        if (
            receipt["solve_index"] != solve_index
            or receipt["status"] != status
            or receipt["result_sha256"] != result_sha256
            or receipt["base_clauses"] != self._root.clauses
            or receipt["base_bytes"] != self._root.body_bytes
            or receipt["base_sha256"] != self._root.body_sha256
            or receipt["assumptions"] != []
            or receipt["model_recorded"] is not (status == "SAT")
            or receipt.get("timeout_ms") != timeout_ms
            or receipt.get("conflict_limit") != conflict_limit
            or receipt.get("interrupted_by") != interrupted
            or receipt.get("core") != core
        ):
            raise PiqdPreappendedSnapshotError(
                "new receipt does not authenticate the preappended root"
            )
        session_after = self._json("GET", f"/sessions/{self._session_id}")
        self._check_session(
            session_after, solve_count=self._solve_count + 1, latest=receipt
        )
        if (
            self._export_digest(f"{self.base_url}/sessions/{self._session_id}/cnf")
            != self._root.sha256
        ):
            raise PiqdPreappendedSnapshotError("PIQD root changed during solve")
        if _root_identity(self.root_path) != self._root:
            raise PiqdPreappendedSnapshotError("local root changed during solve")

        if status == "SAT":
            _exclusive_atomic_write(
                self.model_path,
                _json_bytes({"vars": self._root.variables, "model": list(assignment)})
                + b"\n",
            )
        capture_response = dict(response)
        capture_response.pop("model", None)
        capture = {
            "schema": CAPTURE_SCHEMA,
            "session_before": session_before,
            "solve_response": capture_response,
            "model_literals": len(assignment),
        }
        _exclusive_atomic_write(self.capture_path, _json_bytes(capture) + b"\n")
        self._solve_count += 1
        self._consumed = True
        return SnapshotSolveResult(
            status=status,
            assignment=assignment,
            solve_index=solve_index,
            result_sha256=result_sha256,
            receipt=receipt,
            root_clauses=self._root.clauses,
            root_sha256=self._root.sha256,
        )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    parser.add_argument("--session-id", required=True)
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--source-solve-count", type=int, required=True)
    parser.add_argument("--solver-sha256", required=True)
    parser.add_argument("--pending-clauses", type=int, default=1)
    parser.add_argument("--snapshot", type=Path, required=True)
    parser.add_argument("--raw-response", type=Path, required=True)
    parser.add_argument("--capture", type=Path, required=True)
    parser.add_argument("--model", type=Path, required=True)
    parser.add_argument("--postwave-receipt", type=Path, required=True)
    parser.add_argument("--repo-root", type=Path, required=True)
    parser.add_argument("--timeout-ms", type=int)
    parser.add_argument("--conflict-limit", type=int)
    args = parser.parse_args()

    runner = PiqdPreappendedSnapshotRunner(
        args.base_url,
        args.session_id,
        args.root,
        expected_solve_count=args.source_solve_count,
        expected_solver_sha256=args.solver_sha256,
        expected_pending_clauses=args.pending_clauses,
        snapshot_path=args.snapshot,
        raw_response_path=args.raw_response,
        capture_path=args.capture,
        model_path=args.model,
    )
    authorization, result = run_authorized_preappended_successor(
        runner,
        postwave_receipt=args.postwave_receipt,
        repo_root=args.repo_root.resolve(strict=True),
        timeout_ms=args.timeout_ms,
        conflict_limit=args.conflict_limit,
    )
    print(
        json.dumps(
            {
                "schema": SCHEMA,
                "session_id": runner.session_id,
                "source_solve_index": authorization.source_solve_index,
                "solve_index": result.solve_index,
                "status": result.status,
                "root_sha256": result.root_sha256,
                "root_clauses": result.root_clauses,
                "proof_verified": False,
                "closure_claim": False,
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())


__all__ = [
    "PiqdPreappendedSnapshotError",
    "PiqdPreappendedSnapshotRunner",
    "RootIdentity",
    "SnapshotSolveResult",
]
