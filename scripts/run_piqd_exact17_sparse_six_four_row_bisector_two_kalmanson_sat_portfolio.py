# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Run the authenticated six-cell two-Kalmanson SAT-profile portfolio once.

``static-check`` is offline.  The three ``start*`` commands authenticate
``/version`` and ``/solvers`` and reserve their journals and locks create-once.
They run ordinary ``phase3_piqd_driver`` lifecycles with one core per job;
there is deliberately no recovery/finalize command. The imported preparer
rejects repository production commands while its source pins are provisional.
"""

from __future__ import annotations

import argparse
import fcntl
import hashlib
import http.client
import json
import os
import stat
import sys
import time
import urllib.parse
from collections.abc import Callable, Mapping
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path, PurePosixPath
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))
if str(ROOT / "scripts") not in sys.path:
    sys.path.insert(0, str(ROOT / "scripts"))

import prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio as preparation

from census.p97_search import phase3_piqd_driver as _driver
from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes
from census.p97_search.phase3_piqd_driver import (
    DriverPolicy,
    PiqdCegarDriver,
    PiqdDriverError,
)
from census.p97_search.phase3_piqd_oracle import PiqdOracleError, PiqdRawDimacsClient
from census.p97_search.phase3_piqd_replay import LeanLratReplayer, LratReplayError

RUN_ROOT = preparation.OUTPUT_ROOT
CAMPAIGN_PATH = RUN_ROOT / "artifacts/campaign-manifest.json"
RUN_MANIFEST_PATH = RUN_ROOT / "run_manifest.json"
LAUNCH_PATH = RUN_ROOT / "artifacts/launch-manifest.json"
RESULT_PATH = RUN_ROOT / "artifacts/portfolio-result.json"
LAUNCH_LOCK_NAME = "portfolio-launch.lock"
CANARY_LAUNCH_PATH = RUN_ROOT / "artifacts/canary-launch-manifest.json"
CANARY_RESULT_PATH = RUN_ROOT / "artifacts/canary-result.json"
CANARY_LOCK_NAME = "canary-launch.lock"
REST_LAUNCH_PATH = RUN_ROOT / "artifacts/rest-launch-manifest.json"
REST_RESULT_PATH = RUN_ROOT / "artifacts/rest-result.json"
REST_LOCK_NAME = "rest-launch.lock"
LAUNCH_SCHEMA = (
    "p97-exact17-sparse-six-four-row-bisector-two-kalmanson-sat-profile-launch/v1"
)
RESULT_SCHEMA = (
    "p97-exact17-sparse-six-four-row-bisector-two-kalmanson-sat-profile-result/v1"
)
PROJECT = (
    "erdos-97-96-exact17-sparse-six-four-row-bisector-two-kalmanson-center02-sat-v1"
)
DAEMON_IDENTITY = {
    "name": "piqd",
    "version": "0.1.0",
    "protocol_version": 1,
    "sha256": "f89994bc10fcad69a264d8efbd7d76b8203c94c08f22b4536d3b473a12cee089",
}
SOLVER_NAME = "piqd-satworker-cadical-3.0.0"
SOLVER_SHA256 = "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965"
SOLVER_SIGNATURE = "cadical-3.0.0"
MAX_HTTP_JSON_BYTES = 1 << 20
MAX_POLLS = 2_400
POLL_INTERVAL_S = 2.0
MAX_JOURNAL_BYTES = 64 * 1024 * 1024
MAX_RUNTIME_ARTIFACT_BYTES = 8 * 1024 * 1024 * 1024
FileIdentity = tuple[int, int, int, int]
TERMINAL_RESULT_KEYS = frozenset(
    {
        "portfolio_cell_id",
        "job_id",
        "outcome",
        "terminal_record_sha256",
        "journal_record_count",
        "seal_sha256",
    }
)


class PortfolioRunnerError(RuntimeError):
    """The prepared package or one-shot execution contract failed closed."""


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise PortfolioRunnerError(message)


class FreshOnlyPiqdClient:
    """Reject PIQD adoption: this lane owns only freshly prepared jobs."""

    def __init__(self, inner: Any) -> None:
        self.inner = inner
        self.rejected_existing = False

    def prepare_cnf(self, **kwargs: Any) -> Any:
        job = self.inner.prepare_cnf(**kwargs)
        if job.existing is not False:
            self.rejected_existing = True
            raise PiqdOracleError(
                "PIQD returned existing=true; no adoption or recovery owner is authorized"
            )
        return job

    def __getattr__(self, name: str) -> Any:
        return getattr(self.inner, name)


class DescriptorAttemptJournal:
    """Create-once attempt journal held entirely through no-follow descriptors."""

    def __init__(
        self,
        path: Path,
        *,
        manifest: Mapping[str, Any],
        root: Path,
        expected_journal_identity: FileIdentity | None = None,
        expected_lock_identity: FileIdentity | None = None,
    ) -> None:
        _driver.validate_wave_manifest(manifest)
        self.path = path
        self.manifest = dict(manifest)
        self._raw = b""
        self.records: list[dict[str, Any]] = []
        self._sealed: dict[str, Any] | None = None
        self._events_fd = _open_directory(
            root, preparation._relative(root, path.parent)
        )
        self._journal_name = path.name
        self._lock_name = f"{path.name}.lock"
        self._artifact_name = f"{path.name}.artifacts"
        self._seal_name = f"{path.name}.seal.json"
        self._journal_fd: int | None = None
        self._lock_fd: int | None = None
        self._artifact_fd: int | None = None
        self._artifact_identities: dict[str, FileIdentity] = {}
        self._seal_identity: FileIdentity | None = None
        self._virtual_artifacts = {
            str(self.manifest["encoding"]["cnf_sha256"]),
            str(self.manifest["encoding"]["producer_manifest_sha256"]),
        }
        try:
            self._journal_fd = self._open_private_regular(
                self._journal_name,
                os.O_RDWR | os.O_APPEND,
                expected_identity=expected_journal_identity,
            )
            self._lock_fd = self._open_private_regular(
                self._lock_name,
                os.O_RDWR,
                expected_identity=expected_lock_identity,
            )
            if os.fstat(self._journal_fd).st_size != 0:
                raise PiqdDriverError("create-once journal is not empty")
            if os.fstat(self._lock_fd).st_size != 0:
                raise PiqdDriverError("create-once journal lock is not empty")
            try:
                os.stat(self._seal_name, dir_fd=self._events_fd, follow_symlinks=False)
            except FileNotFoundError:
                pass
            else:
                raise PiqdDriverError("create-once journal seal already exists")
            try:
                os.mkdir(self._artifact_name, 0o700, dir_fd=self._events_fd)
            except OSError as exc:
                raise PiqdDriverError(
                    "journal artifact directory already exists or is unsafe"
                ) from exc
            self._artifact_fd = os.open(
                self._artifact_name,
                os.O_RDONLY
                | os.O_DIRECTORY
                | os.O_NOFOLLOW
                | getattr(os, "O_CLOEXEC", 0),
                dir_fd=self._events_fd,
            )
            self._assert_artifact_directory()
            self._assert_core_custody()
            os.fsync(self._events_fd)
        except BaseException:
            self.close()
            raise

    def close(self) -> None:
        for name in ("_artifact_fd", "_journal_fd", "_lock_fd", "_events_fd"):
            descriptor = getattr(self, name, None)
            if descriptor is not None:
                os.close(descriptor)
                setattr(self, name, None)

    @staticmethod
    def _file_identity(info: os.stat_result) -> FileIdentity:
        return (info.st_dev, info.st_ino, info.st_mode, info.st_nlink)

    def _open_private_regular(
        self,
        name: str,
        access: int,
        *,
        expected_identity: FileIdentity | None,
    ) -> int:
        try:
            descriptor = os.open(
                name,
                access | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
                dir_fd=self._events_fd,
            )
        except OSError as exc:
            raise PiqdDriverError(
                f"journal custody file is missing, linked, or unsafe: {name}"
            ) from exc
        try:
            held = self._assert_bound_regular(descriptor, name)
            if (
                expected_identity is not None
                and self._file_identity(held) != expected_identity
            ):
                raise PiqdDriverError(f"journal reservation identity changed: {name}")
        except BaseException:
            os.close(descriptor)
            raise
        return descriptor

    def _assert_bound_regular(self, descriptor: int, name: str) -> os.stat_result:
        try:
            held = os.fstat(descriptor)
            named = os.stat(name, dir_fd=self._events_fd, follow_symlinks=False)
        except OSError as exc:
            raise PiqdDriverError(f"journal custody path changed: {name}") from exc
        if (
            not stat.S_ISREG(held.st_mode)
            or held.st_nlink != 1
            or held.st_mode & 0o077
            or self._file_identity(held) != self._file_identity(named)
        ):
            raise PiqdDriverError(f"journal custody identity changed: {name}")
        return held

    def _assert_artifact_directory(self) -> None:
        if self._artifact_fd is None:
            raise PiqdDriverError("journal artifact directory is closed")
        try:
            held = os.fstat(self._artifact_fd)
            named = os.stat(
                self._artifact_name,
                dir_fd=self._events_fd,
                follow_symlinks=False,
            )
        except OSError as exc:
            raise PiqdDriverError("journal artifact directory changed") from exc
        if (
            not stat.S_ISDIR(held.st_mode)
            or not stat.S_ISDIR(named.st_mode)
            or held.st_mode & 0o077
            or held.st_nlink != named.st_nlink
            or (held.st_dev, held.st_ino) != (named.st_dev, named.st_ino)
        ):
            raise PiqdDriverError("journal artifact directory identity changed")

    @staticmethod
    def _read_descriptor(descriptor: int) -> bytes:
        os.lseek(descriptor, 0, os.SEEK_SET)
        chunks: list[bytes] = []
        while True:
            block = os.read(descriptor, 1 << 20)
            if not block:
                break
            chunks.append(block)
        return b"".join(chunks)

    @staticmethod
    def _write_all(descriptor: int, payload: bytes) -> None:
        offset = 0
        while offset < len(payload):
            written = os.write(descriptor, payload[offset:])
            if written <= 0:
                raise PiqdDriverError("journal write made no progress")
            offset += written

    @staticmethod
    def _digest(value: Any, source: str) -> str:
        if (
            type(value) is not str
            or len(value) != 64
            or any(character not in "0123456789abcdef" for character in value)
        ):
            raise PiqdDriverError(f"{source} is not a lowercase SHA-256 digest")
        return value

    def _read_artifact(self, digest: str) -> bytes:
        self._assert_artifact_directory()
        if self._artifact_fd is None:  # pragma: no cover - guarded above
            raise PiqdDriverError("journal artifact directory is closed")
        try:
            descriptor = os.open(
                digest,
                os.O_RDONLY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
                dir_fd=self._artifact_fd,
            )
        except OSError as exc:
            raise PiqdDriverError(
                f"journal artifact is missing or unsafe: {digest}"
            ) from exc
        try:
            held = os.fstat(descriptor)
            named = os.stat(digest, dir_fd=self._artifact_fd, follow_symlinks=False)
            if (
                not stat.S_ISREG(held.st_mode)
                or held.st_nlink != 1
                or held.st_mode & 0o077
                or self._file_identity(held) != self._file_identity(named)
                or (
                    digest in self._artifact_identities
                    and self._file_identity(held) != self._artifact_identities[digest]
                )
            ):
                raise PiqdDriverError(f"journal artifact identity changed: {digest}")
            if digest not in self._artifact_identities:
                raise PiqdDriverError(
                    f"journal artifact has no custody record: {digest}"
                )
            payload = self._read_descriptor(descriptor)
            after = os.fstat(descriptor)
            named_after = os.stat(
                digest, dir_fd=self._artifact_fd, follow_symlinks=False
            )
            if (
                self._file_identity(after) != self._file_identity(held)
                or self._file_identity(named_after) != self._file_identity(held)
                or after.st_size != len(payload)
            ):
                raise PiqdDriverError(f"journal artifact changed while read: {digest}")
            return payload
        finally:
            os.close(descriptor)

    def store_artifact(self, payload: bytes) -> str:
        if type(payload) is not bytes:
            raise PiqdDriverError("journal artifact must be built-in bytes")
        digest = sha256_bytes(payload)
        if digest in self._virtual_artifacts:
            return digest
        self._assert_artifact_directory()
        if self._artifact_fd is None:  # pragma: no cover - guarded above
            raise PiqdDriverError("journal artifact directory is closed")
        try:
            descriptor = os.open(
                digest,
                os.O_WRONLY
                | os.O_CREAT
                | os.O_EXCL
                | os.O_NOFOLLOW
                | getattr(os, "O_CLOEXEC", 0),
                0o600,
                dir_fd=self._artifact_fd,
            )
        except FileExistsError:
            if digest not in self._artifact_identities:
                raise PiqdDriverError(f"journal artifact appeared externally: {digest}")
            if self._read_artifact(digest) != payload:
                raise PiqdDriverError(f"journal artifact digest collision: {digest}")
            return digest
        except OSError as exc:
            raise PiqdDriverError(f"cannot create journal artifact: {digest}") from exc
        try:
            before = os.fstat(descriptor)
            named_before = os.stat(
                digest, dir_fd=self._artifact_fd, follow_symlinks=False
            )
            if (
                not stat.S_ISREG(before.st_mode)
                or before.st_nlink != 1
                or before.st_mode & 0o077
                or before.st_size != 0
                or self._file_identity(before) != self._file_identity(named_before)
            ):
                raise PiqdDriverError(f"new journal artifact is unsafe: {digest}")
            self._write_all(descriptor, payload)
            os.fsync(descriptor)
            held = os.fstat(descriptor)
            named = os.stat(digest, dir_fd=self._artifact_fd, follow_symlinks=False)
            if (
                not stat.S_ISREG(held.st_mode)
                or held.st_nlink != 1
                or held.st_size != len(payload)
                or (held.st_dev, held.st_ino) != (before.st_dev, before.st_ino)
                or self._file_identity(held) != self._file_identity(named)
            ):
                raise PiqdDriverError(f"new journal artifact is unsafe: {digest}")
            self._artifact_identities[digest] = self._file_identity(held)
            os.fsync(self._artifact_fd)
        finally:
            os.close(descriptor)
        return digest

    def _require_artifact(self, value: Any, source: str) -> str:
        digest = self._digest(value, source)
        if digest in self._virtual_artifacts:
            return digest
        payload = self._read_artifact(digest)
        if sha256_bytes(payload) != digest:
            raise PiqdDriverError(f"{source} artifact hash changed")
        return digest

    def _assert_core_custody(self) -> None:
        if self._journal_fd is None or self._lock_fd is None:
            raise PiqdDriverError("journal custody is closed")
        self._assert_bound_regular(self._journal_fd, self._journal_name)
        self._assert_bound_regular(self._lock_fd, self._lock_name)
        self._assert_artifact_directory()

    def _assert_seal_custody(self) -> None:
        if self._sealed is None or self._seal_identity is None:
            raise PiqdDriverError("journal seal custody is not established")
        try:
            descriptor = os.open(
                self._seal_name,
                os.O_RDONLY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
                dir_fd=self._events_fd,
            )
        except OSError as exc:
            raise PiqdDriverError("journal seal is missing, linked, or unsafe") from exc
        try:
            before = self._assert_bound_regular(descriptor, self._seal_name)
            if self._file_identity(before) != self._seal_identity:
                raise PiqdDriverError("journal seal identity changed")
            expected = canonical_json_bytes(self._sealed) + b"\n"
            if self._read_descriptor(descriptor) != expected:
                raise PiqdDriverError("journal seal bytes changed")
            after = self._assert_bound_regular(descriptor, self._seal_name)
            if self._file_identity(after) != self._seal_identity:
                raise PiqdDriverError("journal seal changed while read")
        finally:
            os.close(descriptor)

    def append_event(
        self,
        *,
        event: Mapping[str, Any],
        outcome: str,
        detail: str | None,
        artifact_overrides: Mapping[str, str | None] | None = None,
    ) -> dict[str, Any]:
        _driver._validate_event(event)
        event_bytes = canonical_json_bytes(event)
        self._assert_core_custody()
        if self._lock_fd is None or self._journal_fd is None:  # pragma: no cover
            raise PiqdDriverError("journal custody is closed")
        fcntl.flock(self._lock_fd, fcntl.LOCK_EX)
        try:
            self._assert_core_custody()
            try:
                os.stat(self._seal_name, dir_fd=self._events_fd, follow_symlinks=False)
            except FileNotFoundError:
                pass
            else:
                raise PiqdDriverError("sealed journal cannot be extended")
            checkpoint_sha256 = self.store_artifact(event_bytes)
            artifacts: dict[str, str | None] = {
                key: None for key in _driver._ARTIFACT_KEYS
            }
            artifacts["cnf_sha256"] = self.manifest["encoding"]["cnf_sha256"]
            artifacts["checkpoint_sha256"] = checkpoint_sha256
            for key, value in (artifact_overrides or {}).items():
                if key not in artifacts or key in {"cnf_sha256", "checkpoint_sha256"}:
                    raise PiqdDriverError(f"invalid driver artifact field: {key}")
                if value is not None:
                    self._require_artifact(value, f"attempt artifact {key}")
                artifacts[key] = value
            index = len(self.records)
            previous = self.records[-1]["record_sha256"] if self.records else None
            record = _driver.make_attempt_record(
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
            if self._read_descriptor(self._journal_fd) != self._raw:
                raise PiqdDriverError("journal bytes changed before append")
            os.lseek(self._journal_fd, 0, os.SEEK_END)
            self._write_all(self._journal_fd, serialized)
            os.fsync(self._journal_fd)
            self._raw += serialized
            if self._read_descriptor(self._journal_fd) != self._raw:
                raise PiqdDriverError("journal append was not durable")
            self._assert_core_custody()
            self.records.append(dict(record))
            return dict(record)
        finally:
            fcntl.flock(self._lock_fd, fcntl.LOCK_UN)

    def seal(self) -> dict[str, Any]:
        self._assert_core_custody()
        if self._lock_fd is None or self._journal_fd is None:  # pragma: no cover
            raise PiqdDriverError("journal custody is closed")
        fcntl.flock(self._lock_fd, fcntl.LOCK_EX)
        try:
            self._assert_core_custody()
            if self._read_descriptor(self._journal_fd) != self._raw:
                raise PiqdDriverError("journal bytes changed before sealing")
            if self._sealed is not None:
                self._assert_seal_custody()
                return dict(self._sealed)
            for index, record in enumerate(self.records):
                for key, digest in record["artifacts"].items():
                    if digest is not None:
                        self._require_artifact(
                            digest, f"attempt {index} artifact {key}"
                        )
            terminal = _driver.validate_attempt_journal(
                self.records,
                manifest=self.manifest,
                expected_record_count=len(self.records),
                expected_terminal_sha256=(
                    self.records[-1]["record_sha256"] if self.records else None
                ),
            )
            unsigned = {
                "schema": _driver.SEAL_SCHEMA,
                "wave_manifest_sha256": _driver.wave_manifest_sha256(self.manifest),
                "record_count": len(self.records),
                "terminal_attempt_sha256": terminal,
                "journal_sha256": sha256_bytes(self._raw),
            }
            seal = {**unsigned, "seal_sha256": _driver.sha256_json(unsigned)}
            payload = canonical_json_bytes(seal) + b"\n"
            try:
                descriptor = os.open(
                    self._seal_name,
                    os.O_WRONLY
                    | os.O_CREAT
                    | os.O_EXCL
                    | os.O_NOFOLLOW
                    | getattr(os, "O_CLOEXEC", 0),
                    0o600,
                    dir_fd=self._events_fd,
                )
            except OSError as exc:
                raise PiqdDriverError(
                    "cannot create journal seal exactly once"
                ) from exc
            try:
                before = self._assert_bound_regular(descriptor, self._seal_name)
                if before.st_size != 0:
                    raise PiqdDriverError("new journal seal is not empty")
                self._write_all(descriptor, payload)
                os.fsync(descriptor)
                held = self._assert_bound_regular(descriptor, self._seal_name)
                if held.st_size != len(payload) or (held.st_dev, held.st_ino) != (
                    before.st_dev,
                    before.st_ino,
                ):
                    raise PiqdDriverError("journal seal size changed")
                os.fsync(self._events_fd)
                final = self._assert_bound_regular(descriptor, self._seal_name)
                if self._file_identity(final) != self._file_identity(held):
                    raise PiqdDriverError("journal seal identity changed")
                self._seal_identity = self._file_identity(final)
            finally:
                os.close(descriptor)
            self._sealed = seal
            return dict(seal)
        finally:
            fcntl.flock(self._lock_fd, fcntl.LOCK_UN)


def _strict_json(raw: bytes, label: str) -> dict[str, Any]:
    def unique(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        value: dict[str, Any] = {}
        for key, item in pairs:
            if key in value:
                raise ValueError(f"duplicate key: {key}")
            value[key] = item
        return value

    try:
        value = json.loads(
            raw,
            object_pairs_hook=unique,
            parse_constant=lambda constant: (_ for _ in ()).throw(ValueError(constant)),
        )
        canonical = canonical_json_bytes(value)
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise PortfolioRunnerError(f"{label} is not strict JSON") from exc
    _require(type(value) is dict, f"{label} must be a JSON object")
    _require(canonical == raw, f"{label} is not canonical JSON")
    return value


def _http_json(base_url: str, target: str) -> dict[str, Any]:
    parsed = urllib.parse.urlsplit(base_url)
    _require(parsed.scheme == "http", "PIQD base URL must use http")
    _require(
        parsed.hostname in {"127.0.0.1", "localhost", "::1"}, "PIQD must be loopback"
    )
    _require(
        parsed.username is None and parsed.password is None,
        "PIQD URL must omit credentials",
    )
    _require(
        not parsed.query and not parsed.fragment,
        "PIQD URL must omit query and fragment",
    )
    connection = http.client.HTTPConnection(
        parsed.hostname, parsed.port or 80, timeout=30
    )
    try:
        connection.request("GET", f"{parsed.path.rstrip('/')}{target}")
        response = connection.getresponse()
        raw = response.read(MAX_HTTP_JSON_BYTES + 1)
        _require(
            response.status == 200, f"PIQD {target} returned HTTP {response.status}"
        )
        _require(
            len(raw) <= MAX_HTTP_JSON_BYTES, f"PIQD {target} response is oversized"
        )
        value = json.loads(raw)
        _require(type(value) is dict, f"PIQD {target} response is malformed")
        return value
    except (OSError, http.client.HTTPException, json.JSONDecodeError) as exc:
        raise PortfolioRunnerError(f"cannot fetch live PIQD {target}") from exc
    finally:
        connection.close()


def live_identity(
    base_url: str,
    *,
    fetch_json: Callable[[str, str], dict[str, Any]] = _http_json,
) -> dict[str, Any]:
    version = fetch_json(base_url, "/version")
    _require(
        version.get("daemon") == DAEMON_IDENTITY, "live PIQD daemon identity drifted"
    )
    registry = fetch_json(base_url, "/solvers")
    _require(
        registry.get("daemon") == DAEMON_IDENTITY,
        "solver registry daemon identity drifted",
    )
    solvers = registry.get("solvers")
    _require(type(solvers) is list, "solver registry is malformed")
    matches = [
        item
        for item in solvers
        if type(item) is dict and item.get("name") == SOLVER_NAME
    ]
    _require(len(matches) == 1, "pinned CaDiCaL solver is not unique")
    solver = matches[0]
    _require(solver.get("sha256") == SOLVER_SHA256, "live solver SHA-256 drifted")
    _require(
        solver.get("solver_signature") == SOLVER_SIGNATURE,
        "live solver signature drifted",
    )
    _require(
        solver.get("protocol_version") == DAEMON_IDENTITY["protocol_version"],
        "live solver protocol drifted",
    )
    _require(
        solver.get("solver", solver.get("backend")) == preparation.BACKEND,
        "live solver backend drifted",
    )
    _require(
        solver.get("lane") == "sat" and solver.get("usable") is True,
        "live solver is unusable",
    )
    return {
        "version": version,
        "solver": solver,
        "fetched_endpoints": ["/version", "/solvers"],
    }


def _read_output(
    root: Path, relative: str, *, maximum_bytes: int
) -> preparation.Snapshot:
    with preparation.DescriptorCustody(root) as custody:
        return custody.capture(relative, maximum_bytes=maximum_bytes)


def _validate_run_manifest(
    root: Path, run_root: Path, authenticated: dict[str, Any]
) -> dict[str, Any]:
    snapshot = _read_output(
        root,
        preparation._relative(root, run_root / "run_manifest.json"),
        maximum_bytes=preparation.MAX_JSON_BYTES,
    )
    manifest = _strict_json(snapshot.content or b"", "run manifest")
    expected = _strict_json(
        preparation._build_run_manifest(root, run_root, authenticated),
        "expected run manifest",
    )
    _require(manifest == expected, "run manifest identity drifted")
    return manifest


def _validate_layout(run_root: Path, launch_mode: str | None) -> None:
    _require(not run_root.is_symlink() and run_root.is_dir(), "run root is unsafe")
    _require(
        {entry.name for entry in os.scandir(run_root)}
        == {"run_manifest.json", "artifacts", "events", "tmp"},
        "run root inventory drifted",
    )
    for name in ("artifacts", "events", "tmp"):
        path = run_root / name
        info = os.lstat(path)
        _require(
            stat.S_ISDIR(info.st_mode) and not stat.S_ISLNK(info.st_mode),
            f"{name} directory is unsafe",
        )
    event_names = {entry.name for entry in os.scandir(run_root / "events")}
    tmp_names = {entry.name for entry in os.scandir(run_root / "tmp")}
    if launch_mode != "REMAINING_FIVE":
        _require(not event_names, "events directory is not launch-empty")
        _require(not tmp_names, "tmp directory is not launch-empty")
    else:
        canary = preparation.portfolio_cell_id("none")
        journal = f"{canary}.jsonl"
        expected_events = {
            journal,
            f"{journal}.lock",
            f"{journal}.artifacts",
            f"{journal}.seal.json",
        }
        _require(
            event_names == expected_events,
            "rest launch found foreign event custody",
        )
        allowed_tmp = {f"{canary}-replay-work"}
        _require(
            tmp_names <= allowed_tmp,
            "rest launch found foreign replay custody",
        )
        for name in tmp_names:
            info = os.lstat(run_root / "tmp" / name)
            _require(
                stat.S_ISDIR(info.st_mode) and not stat.S_ISLNK(info.st_mode),
                "rest launch found unsafe replay custody",
            )


def _mode_artifacts(launch_mode: str) -> tuple[str, str, str]:
    if launch_mode == "FULL_PORTFOLIO":
        return LAUNCH_PATH.name, RESULT_PATH.name, LAUNCH_LOCK_NAME
    if launch_mode == "SINGLE_CELL_CANARY":
        return CANARY_LAUNCH_PATH.name, CANARY_RESULT_PATH.name, CANARY_LOCK_NAME
    if launch_mode == "REMAINING_FIVE":
        return REST_LAUNCH_PATH.name, REST_RESULT_PATH.name, REST_LOCK_NAME
    raise PortfolioRunnerError("unknown launch mode")


def _inspect_private_regular_at(
    directory_fd: int,
    name: str,
    *,
    maximum_bytes: int,
    capture: bool,
) -> tuple[bytes | None, str, int]:
    try:
        descriptor = os.open(
            name,
            os.O_RDONLY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
            dir_fd=directory_fd,
        )
    except OSError as exc:
        raise PortfolioRunnerError(
            f"custody file is missing or unsafe: {name}"
        ) from exc
    try:
        before = _named_file_identity(directory_fd, name, descriptor)
        digest = hashlib.sha256()
        chunks: list[bytes] = []
        size = 0
        while True:
            block = os.read(descriptor, 1 << 20)
            if not block:
                break
            size += len(block)
            _require(size <= maximum_bytes, f"custody file is oversized: {name}")
            digest.update(block)
            if capture:
                chunks.append(block)
        after = _named_file_identity(directory_fd, name, descriptor, expected=before)
        _require(
            after == before and os.fstat(descriptor).st_size == size,
            f"custody file changed while read: {name}",
        )
        return (b"".join(chunks) if capture else None), digest.hexdigest(), size
    finally:
        os.close(descriptor)


def _open_private_directory_at(parent_fd: int, name: str) -> tuple[int, FileIdentity]:
    descriptor: int | None = None
    try:
        descriptor = os.open(
            name,
            os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
            dir_fd=parent_fd,
        )
        held = os.fstat(descriptor)
        named = os.stat(name, dir_fd=parent_fd, follow_symlinks=False)
    except OSError as exc:
        if descriptor is not None:
            os.close(descriptor)
        raise PortfolioRunnerError(
            f"custody directory is missing or unsafe: {name}"
        ) from exc
    identity = DescriptorAttemptJournal._file_identity(held)
    if (
        not stat.S_ISDIR(held.st_mode)
        or held.st_mode & 0o077
        or identity != DescriptorAttemptJournal._file_identity(named)
    ):
        os.close(descriptor)
        raise PortfolioRunnerError(f"custody directory identity changed: {name}")
    return descriptor, identity


def _require_private_directory_identity(
    parent_fd: int, name: str, descriptor: int, expected: FileIdentity
) -> None:
    try:
        held = os.fstat(descriptor)
        named = os.stat(name, dir_fd=parent_fd, follow_symlinks=False)
    except OSError as exc:
        raise PortfolioRunnerError(f"custody directory changed: {name}") from exc
    _require(
        stat.S_ISDIR(held.st_mode)
        and not held.st_mode & 0o077
        and DescriptorAttemptJournal._file_identity(held) == expected
        and DescriptorAttemptJournal._file_identity(named) == expected,
        f"custody directory identity changed: {name}",
    )


def _validate_canary_custody(
    root: Path, run_root: Path, canary_cell: Mapping[str, Any]
) -> dict[str, Any]:
    launch = _read_output(
        root,
        preparation._relative(root, run_root / "artifacts" / CANARY_LAUNCH_PATH.name),
        maximum_bytes=preparation.MAX_JSON_BYTES,
    )
    result = _read_output(
        root,
        preparation._relative(root, run_root / "artifacts" / CANARY_RESULT_PATH.name),
        maximum_bytes=preparation.MAX_JSON_BYTES,
    )
    lock = _read_output(
        root,
        preparation._relative(root, run_root / "artifacts" / CANARY_LOCK_NAME),
        maximum_bytes=0,
    )
    _require(lock.bytes == 0, "canary launch lock changed")
    launch_json = _strict_json(launch.content or b"", "canary launch manifest")
    result_json = _strict_json(result.content or b"", "canary result")
    canary = preparation.portfolio_cell_id("none")
    expected_journal = preparation._relative(
        root, run_root / "events" / f"{canary}.jsonl"
    )
    launch_cells = launch_json.get("cells")
    results = result_json.get("results")
    selected_results = result_json.get("selected_results")
    inherited_results = result_json.get("inherited_results")
    _require(
        launch_json.get("schema") == LAUNCH_SCHEMA
        and launch_json.get("status") == "LAUNCH_AUTHENTICATED"
        and launch_json.get("launch_mode") == "SINGLE_CELL_CANARY"
        and launch_json.get("portfolio_cell_count") == preparation.CELL_COUNT
        and launch_json.get("selected_cell_count") == 1
        and type(launch_cells) is list
        and len(launch_cells) == 1
        and type(launch_cells[0]) is dict
        and launch_cells[0]
        == {
            "portfolio_cell_id": canary,
            "expected_identity_hash": canary_cell["expected_identity_hash"],
            "journal": expected_journal,
        },
        "canary launch custody drifted",
    )
    _require(
        result_json.get("status") in {"COMPLETE", "COMPLETE_WITH_NON_SAT_RESULTS"}
        and result_json.get("launch_mode") == "SINGLE_CELL_CANARY"
        and result_json.get("launch_sha256") == launch.sha256
        and type(results) is list
        and len(results) == 1
        and type(results[0]) is dict
        and results[0].get("portfolio_cell_id") == canary,
        "canary result custody drifted",
    )
    _require(
        frozenset(result_json)
        == {
            "schema",
            "status",
            "launch_mode",
            "portfolio_cell_count",
            "launch_sha256",
            "selected_cell_count",
            "inherited_cell_count",
            "cell_count",
            "selected_results",
            "inherited_results",
            "results",
        }
        and result_json.get("schema") == RESULT_SCHEMA
        and result_json.get("portfolio_cell_count") == preparation.CELL_COUNT
        and result_json.get("selected_cell_count") == 1
        and result_json.get("inherited_cell_count") == 0
        and result_json.get("cell_count") == 1
        and selected_results == results
        and inherited_results == [],
        "canary result scope drifted",
    )
    terminal = results[0]
    _require(
        frozenset(terminal) == TERMINAL_RESULT_KEYS,
        "canary terminal fields drifted",
    )
    job_id = terminal.get("job_id")
    _require(
        job_id is None or (type(job_id) is str and bool(job_id.strip())),
        "canary terminal job_id is malformed",
    )
    outcome = terminal.get("outcome")
    _require(
        type(outcome) is str and bool(outcome.strip()),
        "canary terminal outcome is malformed",
    )
    terminal_sha256 = DescriptorAttemptJournal._digest(
        terminal.get("terminal_record_sha256"), "canary terminal record"
    )
    seal_sha256 = DescriptorAttemptJournal._digest(
        terminal.get("seal_sha256"), "canary seal"
    )
    record_count = terminal.get("journal_record_count")
    _require(
        type(record_count) is int and record_count > 0,
        "canary journal record count is malformed",
    )
    expected_status = (
        "COMPLETE" if outcome == "STRUCTURAL_SAT" else "COMPLETE_WITH_NON_SAT_RESULTS"
    )
    _require(
        result_json.get("status") == expected_status, "canary result status drifted"
    )

    events_fd = _open_directory(root, preparation._relative(root, run_root / "events"))
    artifact_fd: int | None = None
    try:
        _require_named_directory_identity(
            root, run_root / "events", events_fd, "canary events"
        )
        journal_name = f"{canary}.jsonl"
        journal_raw, journal_sha256, _ = _inspect_private_regular_at(
            events_fd,
            journal_name,
            maximum_bytes=MAX_JOURNAL_BYTES,
            capture=True,
        )
        lock_raw, _, lock_size = _inspect_private_regular_at(
            events_fd,
            f"{journal_name}.lock",
            maximum_bytes=0,
            capture=True,
        )
        _require(lock_raw == b"" and lock_size == 0, "canary journal lock changed")
        seal_raw, _, _ = _inspect_private_regular_at(
            events_fd,
            f"{journal_name}.seal.json",
            maximum_bytes=preparation.MAX_JSON_BYTES,
            capture=True,
        )
        _require(
            journal_raw is not None and seal_raw is not None,
            "canary custody read failed",
        )
        _require(
            not journal_raw or journal_raw.endswith(b"\n"),
            "canary journal ends inside a record",
        )
        records = [
            _strict_json(line, f"canary journal record {index}")
            for index, line in enumerate(journal_raw.splitlines(), start=1)
        ]
        wave = canary_cell.get("wave")
        _require(type(wave) is dict, "canary wave custody is missing")
        try:
            _driver.validate_attempt_journal(
                records,
                manifest=wave,
                expected_record_count=record_count,
                expected_terminal_sha256=terminal_sha256,
            )
        except ValueError as exc:
            raise PortfolioRunnerError("canary journal authentication failed") from exc
        _require(
            bool(records) and records[-1].get("outcome") == outcome,
            "canary terminal outcome disagrees with journal",
        )
        _require(
            seal_raw.endswith(b"\n"),
            "canary journal seal is not newline-terminated",
        )
        seal = _strict_json(seal_raw[:-1], "canary journal seal")
        unsigned_seal = dict(seal)
        recorded_seal_sha256 = unsigned_seal.pop("seal_sha256", None)
        _require(
            frozenset(seal) == _driver._SEAL_KEYS
            and seal.get("schema") == _driver.SEAL_SCHEMA
            and seal.get("wave_manifest_sha256") == _driver.wave_manifest_sha256(wave)
            and seal.get("record_count") == record_count
            and seal.get("terminal_attempt_sha256") == terminal_sha256
            and seal.get("journal_sha256") == journal_sha256
            and recorded_seal_sha256 == seal_sha256
            and _driver.sha256_json(unsigned_seal) == seal_sha256,
            "canary seal authentication failed",
        )

        artifact_name = f"{journal_name}.artifacts"
        artifact_fd, artifact_identity = _open_private_directory_at(
            events_fd, artifact_name
        )
        expected_artifacts = {
            digest
            for record in records
            for key, digest in record["artifacts"].items()
            if digest is not None and key != "cnf_sha256"
        }
        _require(
            set(os.listdir(artifact_fd)) == expected_artifacts,
            "canary artifact inventory drifted",
        )
        terminal_checkpoint = records[-1]["artifacts"]["checkpoint_sha256"]
        terminal_event_raw: bytes | None = None
        for digest in sorted(expected_artifacts):
            payload, actual_digest, _ = _inspect_private_regular_at(
                artifact_fd,
                digest,
                maximum_bytes=MAX_RUNTIME_ARTIFACT_BYTES,
                capture=digest == terminal_checkpoint,
            )
            _require(actual_digest == digest, "canary artifact hash drifted")
            if digest == terminal_checkpoint:
                terminal_event_raw = payload
        _require(terminal_event_raw is not None, "canary terminal event is missing")
        terminal_event = _strict_json(terminal_event_raw, "canary terminal event")
        try:
            _driver._validate_event(terminal_event)
        except PiqdDriverError as exc:
            raise PortfolioRunnerError("canary terminal event is malformed") from exc
        _require(
            terminal_event.get("job_id") == job_id,
            "canary terminal job_id disagrees with journal",
        )
        _require_private_directory_identity(
            events_fd, artifact_name, artifact_fd, artifact_identity
        )
        expected_event_names = {
            journal_name,
            f"{journal_name}.lock",
            artifact_name,
            f"{journal_name}.seal.json",
        }
        _require(
            set(os.listdir(events_fd)) == expected_event_names,
            "canary event inventory drifted",
        )
        _require_named_directory_identity(
            root, run_root / "events", events_fd, "canary events"
        )
    finally:
        if artifact_fd is not None:
            os.close(artifact_fd)
        os.close(events_fd)
    return dict(terminal)


def static_check(
    *,
    root: Path = ROOT,
    run_root: Path = RUN_ROOT,
    launch_mode: str | None = None,
) -> dict[str, Any]:
    root = Path(os.path.abspath(root))
    run_root = Path(os.path.abspath(run_root))
    _validate_layout(run_root, launch_mode)
    authenticated = preparation.authenticate_source_campaign(
        root=root,
        campaign_path=(
            root
            / preparation._relative(preparation.ROOT, preparation.SOURCE_CAMPAIGN_PATH)
        ),
        source_run_manifest_path=(
            root
            / preparation._relative(
                preparation.ROOT, preparation.SOURCE_RUN_MANIFEST_PATH
            )
        ),
        checkpoint_path=(
            root / preparation._relative(preparation.ROOT, preparation.CHECKPOINT_PATH)
        ),
        output_root=run_root,
    )
    _validate_run_manifest(root, run_root, authenticated)
    campaign_snapshot = _read_output(
        root,
        preparation._relative(root, run_root / "artifacts/campaign-manifest.json"),
        maximum_bytes=preparation.MAX_JSON_BYTES,
    )
    campaign = _strict_json(campaign_snapshot.content or b"", "portfolio campaign")
    _require(
        campaign.get("schema") == preparation.PORTFOLIO_SCHEMA,
        "portfolio campaign schema drifted",
    )
    _require(
        campaign.get("status") == "PREPARED_LOCAL_ONLY",
        "portfolio campaign status drifted",
    )
    _require(
        campaign.get("source_campaign")
        == preparation._file_ref(authenticated["campaign"]),
        "portfolio source-campaign provenance drifted",
    )
    _require(
        campaign.get("source_run_manifest")
        == preparation._file_ref(authenticated["source_run"]),
        "portfolio source-run provenance drifted",
    )
    _require(
        campaign.get("source_preparer")
        == {
            **preparation._file_ref(authenticated["source_preparer"]),
            "commit": preparation.SOURCE_PREPARER_COMMIT,
            "git_blob_sha256": preparation.SOURCE_PREPARER_SHA256,
        },
        "portfolio source-preparer provenance drifted",
    )
    _require(
        campaign.get("cnf_custody") == "REFERENCE_ONLY_NO_COPY",
        "portfolio CNF custody drifted",
    )
    _require(
        campaign.get("cell_count") == preparation.CELL_COUNT,
        "portfolio cell count drifted",
    )
    policy = campaign.get("execution")
    _require(
        policy
        == {
            "backend": preparation.BACKEND,
            "solver_profile": preparation.SOLVER_PROFILE,
            "query_polarity": preparation.QUERY_POLARITY,
            "requested_core_limit_per_job": 1,
            "solve_timeout_s": 3_600,
            "replay_timeout_s": 3_600,
            "maximum_concurrency": 6,
            "duplicate_recovery_owner": None,
        },
        "portfolio execution policy drifted",
    )
    cells = campaign.get("cells")
    _require(
        type(cells) is list and len(cells) == preparation.CELL_COUNT,
        "portfolio cells are malformed",
    )
    base_artifacts = {"campaign-manifest.json", "preparation-report.json", "cells"}
    actual_artifacts = {entry.name for entry in os.scandir(run_root / "artifacts")}
    if launch_mode in {None, "FULL_PORTFOLIO", "SINGLE_CELL_CANARY"}:
        _require(
            actual_artifacts == base_artifacts,
            "portfolio is already launched or artifacts drifted",
        )
    elif launch_mode == "REMAINING_FIVE":
        _require(
            actual_artifacts
            == base_artifacts
            | {CANARY_LAUNCH_PATH.name, CANARY_RESULT_PATH.name, CANARY_LOCK_NAME},
            "rest launch requires exact completed canary custody",
        )
    else:
        raise PortfolioRunnerError("unknown launch mode")
    checked_cells: list[dict[str, Any]] = []
    for ordinal, (cell, expected) in enumerate(
        zip(cells, authenticated["cells"], strict=True)
    ):
        _require(type(cell) is dict, "portfolio cell is malformed")
        _require(cell.get("ordinal") == ordinal, "portfolio ordinal drifted")
        _require(
            cell.get("cell_id") == expected["cell_id"],
            "portfolio cell identity drifted",
        )
        _require(
            cell.get("portfolio_cell_id") == expected["portfolio_cell_id"],
            "portfolio identity drifted",
        )
        _require(
            cell.get("source_cnf") == preparation._file_ref(expected["source_cnf"]),
            "portfolio CNF reference drifted",
        )
        _require(
            cell.get("source_producer_manifest")
            == preparation._file_ref(expected["source_producer"]),
            "source producer reference drifted",
        )
        _require(
            cell.get("source_wave_manifest")
            == preparation._file_ref(expected["source_wave"]),
            "source wave reference drifted",
        )
        producer_ref = cell.get("producer_manifest")
        wave_ref = cell.get("wave_manifest")
        _require(
            type(producer_ref) is dict and type(wave_ref) is dict,
            "new manifest references are malformed",
        )
        producer = _read_output(
            root, producer_ref["path"], maximum_bytes=preparation.MAX_JSON_BYTES
        )
        wave = _read_output(
            root, wave_ref["path"], maximum_bytes=preparation.MAX_JSON_BYTES
        )
        preparation._bind(producer, producer_ref, "new producer")
        preparation._bind(wave, wave_ref, "new wave")
        _require(
            producer.content == expected["producer_bytes"],
            "new producer manifest drifted",
        )
        _require(wave.content == expected["wave_bytes"], "new wave manifest drifted")
        producer_json = _strict_json(producer.content or b"", "new producer")
        wave_json = _strict_json(wave.content or b"", "new wave")
        _require(
            producer_json.get("solver_profile") == "sat", "new producer profile drifted"
        )
        _require(
            wave_json.get("execution", {}).get("solver_profile") == "sat",
            "new wave profile drifted",
        )
        expected_identity = preparation.raw_dimacs_identity(
            expected["source_cnf"].sha256, producer.sha256
        )
        _require(
            cell.get("expected_identity_hash") == expected_identity,
            "raw-DIMACS identity drifted",
        )
        checked_cells.append({**cell, "producer": producer_json, "wave": wave_json})
    inherited_canary_result: dict[str, Any] | None = None
    if launch_mode == "REMAINING_FIVE":
        canary_cells = [
            cell
            for cell in checked_cells
            if cell["cell_id"]
            == "four-row-bisector-two-kalmanson-next-center-02-physical-none"
        ]
        _require(len(canary_cells) == 1, "canary portfolio identity is not unique")
        inherited_canary_result = _validate_canary_custody(
            root, run_root, canary_cells[0]
        )
    return {
        "status": "PASS",
        "campaign_sha256": campaign_snapshot.sha256,
        "run_manifest_sha256": sha256_bytes(
            preparation._build_run_manifest(root, run_root, authenticated)
        ),
        "cells": checked_cells,
        "identities": {
            item["portfolio_cell_id"]: item["expected_identity_hash"]
            for item in checked_cells
        },
        "policy": policy,
        "inherited_canary_result": inherited_canary_result,
    }


def _open_directory(root: Path, relative: str) -> int:
    root_fd = preparation._open_root(root)
    current = root_fd
    flags = os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0)
    try:
        for component in PurePosixPath(
            preparation._safe_relative(relative, "directory path")
        ).parts:
            child = os.open(component, flags, dir_fd=current)
            os.close(current)
            current = child
        return current
    except OSError as exc:
        os.close(current)
        raise PortfolioRunnerError("unsafe output directory path") from exc


def _named_file_identity(
    directory_fd: int,
    name: str,
    descriptor: int,
    *,
    expected: FileIdentity | None = None,
) -> FileIdentity:
    try:
        held = os.fstat(descriptor)
        named = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
    except OSError as exc:
        raise PortfolioRunnerError(f"create-once path changed: {name}") from exc
    identity = DescriptorAttemptJournal._file_identity(held)
    _require(
        stat.S_ISREG(held.st_mode)
        and held.st_nlink == 1
        and not held.st_mode & 0o077
        and identity == DescriptorAttemptJournal._file_identity(named),
        f"create-once file identity changed: {name}",
    )
    if expected is not None:
        _require(identity == expected, f"reserved file identity changed: {name}")
    return identity


def _create_once(directory_fd: int, name: str, payload: bytes = b"") -> FileIdentity:
    _require(name not in {"", ".", ".."} and "/" not in name, "unsafe output name")
    descriptor: int | None = None
    try:
        descriptor = os.open(
            name,
            os.O_WRONLY
            | os.O_CREAT
            | os.O_EXCL
            | os.O_NOFOLLOW
            | getattr(os, "O_CLOEXEC", 0),
            0o600,
            dir_fd=directory_fd,
        )
        before = _named_file_identity(directory_fd, name, descriptor)
        _require(os.fstat(descriptor).st_size == 0, "create-once file is not empty")
        offset = 0
        while offset < len(payload):
            written = os.write(descriptor, payload[offset:])
            _require(written > 0, "create-once write made no progress")
            offset += written
        os.fsync(descriptor)
        after = _named_file_identity(directory_fd, name, descriptor, expected=before)
        _require(
            os.fstat(descriptor).st_size == len(payload), "create-once size changed"
        )
        os.fsync(directory_fd)
        _named_file_identity(directory_fd, name, descriptor, expected=after)
        return after
    except OSError as exc:
        raise PortfolioRunnerError(
            f"create-once output already exists or is unsafe: {name}"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)


def _reopen_named_identity(
    directory_fd: int, name: str, *, expected: FileIdentity
) -> None:
    try:
        descriptor = os.open(
            name,
            os.O_RDONLY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
            dir_fd=directory_fd,
        )
    except OSError as exc:
        raise PortfolioRunnerError(
            f"reserved file is missing or unsafe: {name}"
        ) from exc
    try:
        _named_file_identity(directory_fd, name, descriptor, expected=expected)
    finally:
        os.close(descriptor)


def _require_named_directory_identity(
    root: Path, path: Path, held_fd: int, label: str
) -> None:
    reopened = _open_directory(root, preparation._relative(root, path))
    try:
        held = os.fstat(held_fd)
        named = os.fstat(reopened)
        _require(
            stat.S_ISDIR(held.st_mode)
            and (held.st_dev, held.st_ino) == (named.st_dev, named.st_ino),
            f"{label} directory identity changed",
        )
    finally:
        os.close(reopened)


def _run_cell(
    root: Path,
    run_root: Path,
    cell: Mapping[str, Any],
    base_url: str,
) -> dict[str, Any]:
    cnf_ref = cell["source_cnf"]
    producer_ref = cell["producer_manifest"]
    wave_ref = cell["wave_manifest"]
    cnf = _read_output(root, cnf_ref["path"], maximum_bytes=preparation.MAX_CNF_BYTES)
    producer = _read_output(
        root, producer_ref["path"], maximum_bytes=preparation.MAX_JSON_BYTES
    )
    wave = _read_output(
        root, wave_ref["path"], maximum_bytes=preparation.MAX_JSON_BYTES
    )
    preparation._bind(cnf, cnf_ref, "launch CNF")
    preparation._bind(producer, producer_ref, "launch producer")
    preparation._bind(wave, wave_ref, "launch wave")
    producer_json = _strict_json(producer.content or b"", "launch producer")
    wave_json = _strict_json(wave.content or b"", "launch wave")
    encoding = wave_json.get("encoding")
    execution = wave_json.get("execution")
    _require(
        producer_json.get("backend") == preparation.BACKEND
        and producer_json.get("solver_profile") == preparation.SOLVER_PROFILE
        and producer_json.get("query_polarity") == preparation.QUERY_POLARITY
        and producer_json.get("variable_map_sha256") == preparation.VARIABLE_MAP_SHA256,
        "launch producer semantic profile drifted",
    )
    _require(
        type(encoding) is dict
        and encoding.get("cnf_sha256") == cnf.sha256
        and encoding.get("producer_manifest_sha256") == producer.sha256
        and encoding.get("variable_map_sha256") == preparation.VARIABLE_MAP_SHA256
        and encoding.get("num_variables") == preparation.NUM_VARIABLES
        and encoding.get("num_clauses") == preparation.NUM_CLAUSES
        and encoding.get("query_polarity") == preparation.QUERY_POLARITY,
        "launch wave encoding drifted",
    )
    _require(
        type(execution) is dict
        and execution.get("backend") == preparation.BACKEND
        and execution.get("solver_profile") == preparation.SOLVER_PROFILE,
        "launch wave execution profile drifted",
    )
    _require(
        cell.get("expected_identity_hash")
        == preparation.raw_dimacs_identity(cnf.sha256, producer.sha256),
        "launch raw-DIMACS identity drifted",
    )
    identifier = str(cell["portfolio_cell_id"])
    journal_path = run_root / "events" / f"{identifier}.jsonl"
    journal_identity = cell.get("_journal_reservation_identity")
    lock_identity = cell.get("_journal_lock_reservation_identity")
    _require(
        type(journal_identity) is tuple
        and len(journal_identity) == 4
        and all(type(value) is int for value in journal_identity),
        "journal reservation custody is missing",
    )
    _require(
        type(lock_identity) is tuple
        and len(lock_identity) == 4
        and all(type(value) is int for value in lock_identity),
        "journal lock reservation custody is missing",
    )
    policy = DriverPolicy(
        max_prepare_attempts=1,
        max_confirm_attempts=1,
        max_polls=MAX_POLLS,
        max_result_attempts=1,
        poll_interval_s=POLL_INTERVAL_S,
        solver_timeout_s=preparation.SOLVE_TIMEOUT_S,
        march_timeout_s=preparation.SOLVE_TIMEOUT_S,
        project=PROJECT,
        requested_core_limit=preparation.REQUESTED_CORE_LIMIT,
    )
    client = FreshOnlyPiqdClient(PiqdRawDimacsClient(base_url))
    journal = DescriptorAttemptJournal(
        journal_path,
        manifest=wave_json,
        root=root,
        expected_journal_identity=journal_identity,
        expected_lock_identity=lock_identity,
    )
    try:
        result = PiqdCegarDriver(
            client=client,
            journal=journal,
            policy=policy,
            proof_replayer=LeanLratReplayer(
                lean_root=root / "lean",
                work_dir=run_root / "tmp" / f"{identifier}-replay-work",
                timeout_s=preparation.REPLAY_TIMEOUT_S,
            ),
            sleep=time.sleep,
        ).run(
            wave_manifest=wave_json,
            cnf=cnf.content or b"",
            producer_manifest=producer.content or b"",
        )
        if client.rejected_existing:
            raise PortfolioRunnerError(
                "PIQD returned existing=true; no adoption or recovery owner is authorized"
            )
    finally:
        journal.close()
    return {
        "portfolio_cell_id": identifier,
        "job_id": result.job_id,
        "outcome": result.outcome,
        "terminal_record_sha256": result.terminal_record_sha256,
        "journal_record_count": result.journal_record_count,
        "seal_sha256": result.seal_sha256,
    }


CellRunner = Callable[[Path, Path, Mapping[str, Any], str], dict[str, Any]]


def _start(
    *,
    launch_mode: str,
    base_url: str = "http://127.0.0.1:7272",
    root: Path = ROOT,
    run_root: Path = RUN_ROOT,
    identity_fetcher: Callable[[str], dict[str, Any]] = live_identity,
    cell_runner: CellRunner = _run_cell,
) -> dict[str, Any]:
    _require(
        launch_mode in {"FULL_PORTFOLIO", "SINGLE_CELL_CANARY", "REMAINING_FIVE"},
        "unknown launch mode",
    )
    checked = static_check(root=root, run_root=run_root, launch_mode=launch_mode)
    if launch_mode == "FULL_PORTFOLIO":
        selected_cells = checked["cells"]
    elif launch_mode == "SINGLE_CELL_CANARY":
        selected_cells = [
            cell
            for cell in checked["cells"]
            if cell["cell_id"]
            == "four-row-bisector-two-kalmanson-next-center-02-physical-none"
        ]
    else:
        selected_cells = [
            cell
            for cell in checked["cells"]
            if cell["cell_id"]
            != "four-row-bisector-two-kalmanson-next-center-02-physical-none"
        ]
    expected_selected = {
        "FULL_PORTFOLIO": preparation.CELL_COUNT,
        "SINGLE_CELL_CANARY": 1,
        "REMAINING_FIVE": preparation.CELL_COUNT - 1,
    }[launch_mode]
    _require(
        len(selected_cells) == expected_selected,
        "launch selection does not match its governed mode",
    )
    launch_concurrency = {
        "FULL_PORTFOLIO": preparation.MAX_CONCURRENCY,
        "SINGLE_CELL_CANARY": 1,
        "REMAINING_FIVE": preparation.MAX_CONCURRENCY - 1,
    }[launch_mode]
    launch_name, result_name, lock_name = _mode_artifacts(launch_mode)
    identity = identity_fetcher(base_url)
    artifacts_fd = _open_directory(
        root, preparation._relative(root, run_root / "artifacts")
    )
    events_fd: int | None = None
    tmp_fd: int | None = None
    launch_lock_fd: int | None = None
    try:
        launch_lock_identity = _create_once(artifacts_fd, lock_name)
        launch_lock_fd = os.open(
            lock_name,
            os.O_RDWR | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
            dir_fd=artifacts_fd,
        )
        _named_file_identity(
            artifacts_fd,
            lock_name,
            launch_lock_fd,
            expected=launch_lock_identity,
        )
        fcntl.flock(launch_lock_fd, fcntl.LOCK_EX | fcntl.LOCK_NB)
        _named_file_identity(
            artifacts_fd,
            lock_name,
            launch_lock_fd,
            expected=launch_lock_identity,
        )
        events_fd = _open_directory(
            root, preparation._relative(root, run_root / "events")
        )
        tmp_fd = _open_directory(root, preparation._relative(root, run_root / "tmp"))
        reserved_cells: list[dict[str, Any]] = []
        for cell in selected_cells:
            name = f"{cell['portfolio_cell_id']}.jsonl"
            journal_identity = _create_once(events_fd, name)
            lock_identity = _create_once(events_fd, f"{name}.lock")
            reserved_cells.append(
                {
                    **cell,
                    "_journal_reservation_identity": journal_identity,
                    "_journal_lock_reservation_identity": lock_identity,
                }
            )
        selected_cells = reserved_cells
        launch = {
            "schema": LAUNCH_SCHEMA,
            "status": "LAUNCH_AUTHENTICATED",
            "launch_mode": launch_mode,
            "portfolio_cell_count": preparation.CELL_COUNT,
            "selected_cell_count": len(selected_cells),
            "campaign_sha256": checked["campaign_sha256"],
            "run_manifest_sha256": checked["run_manifest_sha256"],
            "live_identity": identity,
            "execution": {
                **checked["policy"],
                "project": PROJECT,
                "max_prepare_attempts": 1,
                "max_confirm_attempts": 1,
                "max_result_attempts": 1,
                "max_polls": MAX_POLLS,
                "poll_interval_s": POLL_INTERVAL_S,
                "launch_concurrency": launch_concurrency,
            },
            "cells": [
                {
                    "portfolio_cell_id": cell["portfolio_cell_id"],
                    "expected_identity_hash": cell["expected_identity_hash"],
                    "journal": preparation._relative(
                        root, run_root / "events" / f"{cell['portfolio_cell_id']}.jsonl"
                    ),
                }
                for cell in selected_cells
            ],
        }
        launch_bytes = canonical_json_bytes(launch)
        launch_identity = _create_once(artifacts_fd, launch_name, launch_bytes)
        _require_named_directory_identity(
            root, run_root / "events", events_fd, "events"
        )
        _require_named_directory_identity(root, run_root / "tmp", tmp_fd, "tmp")
        results: list[dict[str, Any]] = []
        with ThreadPoolExecutor(max_workers=launch_concurrency) as executor:
            futures = {
                executor.submit(cell_runner, root, run_root, cell, base_url): cell[
                    "portfolio_cell_id"
                ]
                for cell in selected_cells
            }
            for future in as_completed(futures):
                result = future.result()
                _require(
                    result.get("portfolio_cell_id") == futures[future],
                    "cell runner returned the wrong identity",
                )
                results.append(result)
        _require_named_directory_identity(
            root, run_root / "events", events_fd, "events"
        )
        _require_named_directory_identity(root, run_root / "tmp", tmp_fd, "tmp")
        results.sort(key=lambda item: item["portfolio_cell_id"])
        inherited_results: list[dict[str, Any]] = []
        if launch_mode == "REMAINING_FIVE":
            inherited = checked.get("inherited_canary_result")
            _require(
                type(inherited) is dict,
                "rest launch is missing authenticated canary terminal custody",
            )
            inherited_results.append(dict(inherited))
        aggregate_results = [*inherited_results, *results]
        aggregate_results.sort(key=lambda item: item["portfolio_cell_id"])
        _require(
            len(aggregate_results)
            == len({item["portfolio_cell_id"] for item in aggregate_results}),
            "portfolio result identities are not unique",
        )
        terminal = {
            "schema": RESULT_SCHEMA,
            "status": (
                "COMPLETE"
                if (
                    launch_mode == "SINGLE_CELL_CANARY"
                    or len(aggregate_results) == preparation.CELL_COUNT
                )
                and all(
                    item.get("outcome") == "STRUCTURAL_SAT"
                    for item in aggregate_results
                )
                else "COMPLETE_WITH_NON_SAT_RESULTS"
            ),
            "launch_mode": launch_mode,
            "portfolio_cell_count": preparation.CELL_COUNT,
            "launch_sha256": sha256_bytes(launch_bytes),
            "selected_cell_count": len(results),
            "inherited_cell_count": len(inherited_results),
            "cell_count": len(aggregate_results),
            "selected_results": results,
            "inherited_results": inherited_results,
            "results": aggregate_results,
        }
        _reopen_named_identity(artifacts_fd, launch_name, expected=launch_identity)
        _create_once(artifacts_fd, result_name, canonical_json_bytes(terminal))
        _named_file_identity(
            artifacts_fd,
            lock_name,
            launch_lock_fd,
            expected=launch_lock_identity,
        )
        return terminal
    finally:
        if launch_lock_fd is not None:
            fcntl.flock(launch_lock_fd, fcntl.LOCK_UN)
            os.close(launch_lock_fd)
        if events_fd is not None:
            os.close(events_fd)
        if tmp_fd is not None:
            os.close(tmp_fd)
        os.close(artifacts_fd)


def start(
    *,
    base_url: str = "http://127.0.0.1:7272",
    root: Path = ROOT,
    run_root: Path = RUN_ROOT,
    identity_fetcher: Callable[[str], dict[str, Any]] = live_identity,
    cell_runner: CellRunner = _run_cell,
) -> dict[str, Any]:
    """Launch all six cells concurrently under the one-shot owner."""
    return _start(
        launch_mode="FULL_PORTFOLIO",
        base_url=base_url,
        root=root,
        run_root=run_root,
        identity_fetcher=identity_fetcher,
        cell_runner=cell_runner,
    )


def start_canary(
    *,
    base_url: str = "http://127.0.0.1:7272",
    root: Path = ROOT,
    run_root: Path = RUN_ROOT,
    identity_fetcher: Callable[[str], dict[str, Any]] = live_identity,
    cell_runner: CellRunner = _run_cell,
) -> dict[str, Any]:
    """Launch only center-02/physical-none after authenticating all six cells."""
    return _start(
        launch_mode="SINGLE_CELL_CANARY",
        base_url=base_url,
        root=root,
        run_root=run_root,
        identity_fetcher=identity_fetcher,
        cell_runner=cell_runner,
    )


def start_rest(
    *,
    base_url: str = "http://127.0.0.1:7272",
    root: Path = ROOT,
    run_root: Path = RUN_ROOT,
    identity_fetcher: Callable[[str], dict[str, Any]] = live_identity,
    cell_runner: CellRunner = _run_cell,
) -> dict[str, Any]:
    """After exact canary custody, launch the other five cells once."""
    return _start(
        launch_mode="REMAINING_FIVE",
        base_url=base_url,
        root=root,
        run_root=run_root,
        identity_fetcher=identity_fetcher,
        cell_runner=cell_runner,
    )


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "command", choices=("static-check", "start-canary", "start-rest", "start")
    )
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    args = parser.parse_args(argv)
    try:
        if args.command == "static-check":
            payload = static_check()
        elif args.command == "start-canary":
            payload = start_canary(base_url=args.base_url)
        elif args.command == "start-rest":
            payload = start_rest(base_url=args.base_url)
        else:
            payload = start(base_url=args.base_url)
    except (
        OSError,
        PortfolioRunnerError,
        preparation.PreparationError,
        PiqdDriverError,
        PiqdOracleError,
        LratReplayError,
    ) as exc:
        print(f"SAT-profile portfolio runner rejected: {exc}", file=sys.stderr)
        return 2
    print(json.dumps(payload, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
