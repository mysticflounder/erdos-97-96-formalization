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
import http.client
import json
import os
import re
import secrets
import stat
import subprocess
import tempfile
import urllib.error
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
REQUESTED_CORE_LIMIT = 1
ATTESTED_SOLVER_PROCESSES = 1
ATTESTATION_BASIS = "SINGLE_PROCESS_NO_PARALLEL_FLAG"
TIMEOUT_S = 3600
MARCH_TIMEOUT_S = 900


@dataclass(frozen=True)
class RunnerPaths:
    ingress: IngressPaths
    intent: Path
    prepared: Path
    state: Path
    final: Path
    model: Path
    solver_log: Path
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
    artifact_namespace: str = "child32"
    timeout_s: int = TIMEOUT_S
    march_timeout_s: int = MARCH_TIMEOUT_S

    def __post_init__(self) -> None:
        if self.artifact_namespace not in {"child32", "child33"}:
            raise ValueError("unsupported runner artifact namespace")
        if type(self.timeout_s) is not int or self.timeout_s <= 0:
            raise ValueError("timeout_s must be a positive integer")
        if type(self.march_timeout_s) is not int or self.march_timeout_s <= 0:
            raise ValueError("march_timeout_s must be a positive integer")

    @property
    def provisioned(self) -> bool:
        ingress_provisioned = getattr(
            self.ingress, "provisioned", self.ingress.export.provisioned
        )
        return (
            ingress_provisioned
            and self.manifest_sha256 is not None
            and self.root_sha256 is not None
            and self.root_bytes is not None
            and self.root_sha256 == self.ingress.export.child_sha256
            and self.root_bytes == self.ingress.export.child_bytes
        )


PRODUCTION_RUNNER_PATHS = RunnerPaths(
    ingress=PRODUCTION_INGRESS_PATHS,
    intent=ROOT
    / "scratch/exact17-lean-to-sat/piqd-child32-core1-fresh-custody-intent.json",
    prepared=ROOT
    / "scratch/exact17-lean-to-sat/piqd-child32-core1-fresh-custody-prepared.json",
    state=ROOT
    / "scratch/exact17-lean-to-sat/piqd-child32-core1-fresh-custody-live-state.json",
    final=ROOT
    / "scratch/exact17-lean-to-sat/piqd-child32-core1-fresh-custody-final.json",
    model=ROOT
    / "scratch/exact17-lean-to-sat/piqd-child32-core1-fresh-custody-model.json",
    solver_log=ROOT
    / "scratch/exact17-lean-to-sat/piqd-child32-core1-fresh-custody-solver.log",
    lock=ROOT
    / "scratch/exact17-lean-to-sat/piqd-child32-core1-fresh-custody-runner.lock",
)
PRODUCTION_RUNNER_SPEC = RunnerSpec(
    ingress=PRODUCTION_INGRESS_SPEC,
    manifest_sha256="3f7f043c81ffbedb34def0621a5ac84b363e6e492a7315b270678568dbd035f8",
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
        requested_core_limit: int,
        timeout_s: int | None = None,
        march_timeout_s: int | None = None,
    ) -> dict[str, Any]: ...

    def status(self, job_id: str) -> dict[str, Any]: ...

    def retrieve_cnf(self, job_id: str, destination: Path) -> None: ...

    def retrieve_blob(self, job_id: str, blob_hash: str, destination: Path) -> None: ...

    def confirm(self, job_id: str) -> dict[str, Any]: ...

    def model(self, job_id: str) -> dict[str, Any]: ...

    def model_check(self, job_id: str) -> dict[str, Any]: ...

    def retrieve_log(self, job_id: str, destination: Path) -> dict[str, Any]: ...


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
        requested_core_limit: int,
        timeout_s: int | None = None,
        march_timeout_s: int | None = None,
    ) -> dict[str, Any]:
        prepare_kwargs: dict[str, Any] = {}
        if timeout_s is not None:
            prepare_kwargs["timeout_s"] = timeout_s
        if march_timeout_s is not None:
            prepare_kwargs["march_timeout_s"] = march_timeout_s
        response = _stream_prepare_cnf(
            cnf,
            manifest,
            backend=backend,
            profile=profile,
            project=project,
            requested_core_limit=requested_core_limit,
            **prepare_kwargs,
        )
        existing = response.get("existing")
        if existing not in {True, False}:
            raise ValueError("PIQD prepare response omitted exact existing status")
        return response

    def status(self, job_id: str) -> dict[str, Any]:
        base = os.environ.get("PIQD_URL", "http://127.0.0.1:7272").rstrip("/")
        # PIQD deserializes this query parameter as a JSON-style boolean.
        # Numeric truth values such as ``1`` are rejected with HTTP 400.
        query = urllib.parse.urlencode({"log_digest": "true"})
        request = urllib.request.Request(
            f"{base}/jobs/{urllib.parse.quote(job_id, safe='')}?{query}",
            method="GET",
        )
        # The ordinary piqc status command does not request the terminal log
        # digest.  Query the API directly so accepted terminal state is bound
        # to the exact bytes later retrieved from the log endpoint.
        with urllib.request.urlopen(request, timeout=900) as response:
            return _strict_json_text(response.read().decode("utf-8"))

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
        try:
            with urllib.request.urlopen(request, timeout=900) as response:
                return _strict_json_text(response.read().decode("utf-8"))
        except urllib.error.HTTPError as error:
            if error.code == 409:
                raise ConfirmConflictError("PIQD confirm returned HTTP 409") from error
            raise

    def model(self, job_id: str) -> dict[str, Any]:
        return self._json(["piqc", "job", "model", job_id])

    def model_check(self, job_id: str) -> dict[str, Any]:
        base = os.environ.get("PIQD_URL", "http://127.0.0.1:7272").rstrip("/")
        request = urllib.request.Request(
            f"{base}/jobs/{urllib.parse.quote(job_id, safe='')}/model-check",
            method="GET",
        )
        # HTTP errors (including the expected 404 when no row exists) are
        # intentionally propagated: terminal evidence must fail closed.
        with urllib.request.urlopen(request, timeout=900) as response:
            return _strict_json_text(response.read().decode("utf-8"))

    def retrieve_log(self, job_id: str, destination: Path) -> dict[str, Any]:
        return _retrieve_complete_log(job_id, destination)


IngressValidator = Callable[..., dict[str, Any]]


class UnreconciledPrepareError(RuntimeError):
    """A prepare may have happened remotely but has no attributable response."""


class ConfirmConflictError(RuntimeError):
    """PIQD rejected confirmation because the job already advanced."""


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


def _piqd_connection(path: str) -> tuple[http.client.HTTPConnection, str]:
    base = os.environ.get("PIQD_URL", "http://127.0.0.1:7272")
    parsed = urllib.parse.urlsplit(base)
    if (
        parsed.scheme not in {"http", "https"}
        or not parsed.hostname
        or parsed.username is not None
        or parsed.password is not None
        or parsed.query
        or parsed.fragment
    ):
        raise ValueError("PIQD_URL must be an unauthenticated HTTP(S) base URL")
    connection_type = (
        http.client.HTTPSConnection
        if parsed.scheme == "https"
        else http.client.HTTPConnection
    )
    connection = connection_type(parsed.hostname, port=parsed.port, timeout=900)
    prefix = parsed.path.rstrip("/")
    return connection, f"{prefix}{path}"


@contextmanager
def _read_descriptor(path: Path):
    inherited = _dev_fd_number(path)
    descriptor = inherited
    if descriptor is None:
        descriptor = os.open(path, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0))
    try:
        metadata = os.fstat(descriptor)
        _require(stat.S_ISREG(metadata.st_mode), f"not a regular input file: {path}")
        yield descriptor, metadata.st_size
    finally:
        if inherited is None:
            os.close(descriptor)


@contextmanager
def _write_descriptor(path: Path):
    inherited = _dev_fd_number(path)
    descriptor = inherited
    if descriptor is None:
        descriptor = os.open(
            path,
            os.O_WRONLY | os.O_CREAT | os.O_TRUNC | getattr(os, "O_NOFOLLOW", 0),
            0o600,
        )
    try:
        os.ftruncate(descriptor, 0)
        os.lseek(descriptor, 0, os.SEEK_SET)
        yield descriptor
        os.fsync(descriptor)
    finally:
        if inherited is None:
            os.close(descriptor)


def _send_descriptor(
    connection: http.client.HTTPConnection, descriptor: int, size: int
) -> None:
    offset = 0
    while offset < size:
        chunk = os.pread(descriptor, min(1024 * 1024, size - offset), offset)
        if not chunk:
            raise OSError("multipart input truncated during upload")
        connection.send(chunk)
        offset += len(chunk)


def _multipart_header(
    boundary: str, name: str, filename: str, content_type: str
) -> bytes:
    return (
        f"--{boundary}\r\n"
        f'Content-Disposition: form-data; name="{name}"; filename="{filename}"\r\n'
        f"Content-Type: {content_type}\r\n\r\n"
    ).encode("ascii")


def _stream_prepare_cnf(
    cnf: Path,
    manifest: Path,
    *,
    backend: str,
    profile: str,
    project: str,
    requested_core_limit: int,
    timeout_s: int = TIMEOUT_S,
    march_timeout_s: int = MARCH_TIMEOUT_S,
) -> dict[str, Any]:
    _require(
        type(requested_core_limit) is int
        and requested_core_limit == REQUESTED_CORE_LIMIT,
        "child32 submission requires the exact builtin core limit 1",
    )
    meta = json.dumps(
        {
            "backend": backend,
            "march_timeout_s": march_timeout_s,
            "project": project,
            "requested_core_limit": requested_core_limit,
            "solver_profile": profile,
            "timeout_s": timeout_s,
        },
        separators=(",", ":"),
        sort_keys=True,
    ).encode("utf-8")
    boundary = f"p97-exact17-child32-{secrets.token_hex(16)}"
    cnf_header = _multipart_header(
        boundary, "cnf", "child32.cnf", "application/octet-stream"
    )
    meta_header = _multipart_header(boundary, "meta", "meta.json", "application/json")
    manifest_header = _multipart_header(
        boundary, "manifest", "producer.json", "application/json"
    )
    separator = b"\r\n"
    closing = f"--{boundary}--\r\n".encode("ascii")
    with _read_descriptor(cnf) as (cnf_fd, cnf_size), _read_descriptor(
        manifest
    ) as (manifest_fd, manifest_size):
        content_length = (
            len(cnf_header)
            + cnf_size
            + len(separator)
            + len(meta_header)
            + len(meta)
            + len(separator)
            + len(manifest_header)
            + manifest_size
            + len(separator)
            + len(closing)
        )
        connection, target = _piqd_connection("/jobs/prepare-cnf")
        try:
            connection.putrequest("POST", target, skip_accept_encoding=True)
            connection.putheader(
                "Content-Type", f"multipart/form-data; boundary={boundary}"
            )
            connection.putheader("Content-Length", str(content_length))
            connection.putheader("Accept", "application/json")
            connection.endheaders()
            connection.send(cnf_header)
            _send_descriptor(connection, cnf_fd, cnf_size)
            connection.send(separator)
            connection.send(meta_header)
            connection.send(meta)
            connection.send(separator)
            connection.send(manifest_header)
            _send_descriptor(connection, manifest_fd, manifest_size)
            connection.send(separator)
            connection.send(closing)
            response = connection.getresponse()
            body = response.read(1024 * 1024 + 1)
            if len(body) > 1024 * 1024:
                raise ValueError("PIQD prepare response exceeded 1 MiB")
            if response.status != 200:
                snippet = body[:400].decode("utf-8", errors="replace")
                raise RuntimeError(
                    f"PIQD prepare returned HTTP {response.status}: {snippet}"
                )
            return _strict_json_text(body.decode("utf-8"))
        finally:
            connection.close()


def _retrieve_complete_log(job_id: str, destination: Path) -> dict[str, Any]:
    digest = hashlib.sha256()
    offset = 0
    expected_total: int | None = None
    with _write_descriptor(destination) as descriptor:
        while expected_total is None or offset < expected_total:
            query = urllib.parse.urlencode({"from": offset, "max": 1024 * 1024})
            connection, target = _piqd_connection(
                f"/jobs/{urllib.parse.quote(job_id, safe='')}/log?{query}"
            )
            try:
                connection.request("GET", target, headers={"Accept": "text/plain"})
                response = connection.getresponse()
                page = response.read(1024 * 1024 + 1)
                if response.status != 200:
                    snippet = page[:400].decode("utf-8", errors="replace")
                    raise RuntimeError(
                        f"PIQD log returned HTTP {response.status}: {snippet}"
                    )
                _require(len(page) <= 1024 * 1024, "PIQD log page exceeded 1 MiB")
                _require(
                    response.headers.get_content_type() == "text/plain",
                    "PIQD log response is not text/plain",
                )
                total_text = response.getheader("X-Log-Size-Bytes")
                _require(total_text is not None, "PIQD log omitted total byte count")
                try:
                    total = int(total_text)
                except ValueError as error:
                    raise ValueError("PIQD log total byte count is malformed") from error
                _require(total >= 0, "PIQD log total byte count is negative")
                if expected_total is None:
                    expected_total = total
                else:
                    _require(total == expected_total, "PIQD log size changed during retrieval")
                _require(offset + len(page) <= total, "PIQD log page exceeds declared size")
                _require(offset == total or bool(page), "PIQD log pagination made no progress")
                _write_all(descriptor, page)
                digest.update(page)
                offset += len(page)
            finally:
                connection.close()
    _require(expected_total is not None and expected_total > 0, "PIQD solver log is empty")
    _require(offset == expected_total, "PIQD solver log retrieval was truncated")
    return {"bytes": offset, "sha256": digest.hexdigest()}


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
    descriptor = os.open(
        path,
        os.O_CREAT | os.O_RDWR | getattr(os, "O_NOFOLLOW", 0),
        0o600,
    )
    try:
        descriptor_stat = os.fstat(descriptor)
        path_stat = os.stat(path, follow_symlinks=False)
        _require(stat.S_ISREG(descriptor_stat.st_mode), "runner lock is not regular")
        _require(
            stat.S_ISREG(path_stat.st_mode)
            and (descriptor_stat.st_dev, descriptor_stat.st_ino)
            == (path_stat.st_dev, path_stat.st_ino),
            "runner lock identity changed",
        )
        fcntl.flock(descriptor, fcntl.LOCK_EX)
        locked_descriptor_stat = os.fstat(descriptor)
        locked_path_stat = os.stat(path, follow_symlinks=False)
        _require(stat.S_ISREG(locked_descriptor_stat.st_mode), "runner lock is not regular")
        _require(
            stat.S_ISREG(locked_path_stat.st_mode)
            and (locked_descriptor_stat.st_dev, locked_descriptor_stat.st_ino)
            == (locked_path_stat.st_dev, locked_path_stat.st_ino)
            and locked_descriptor_stat.st_nlink == locked_path_stat.st_nlink,
            "runner lock identity changed while acquiring lock",
        )
        yield
    finally:
        fcntl.flock(descriptor, fcntl.LOCK_UN)
        os.close(descriptor)


def expected_identity_hash(spec: RunnerSpec) -> str:
    if not spec.provisioned:
        raise UnprovisionedError("child32 PIQD runner is UNPROVISIONED")
    # PIQD's raw-dimacs/v1 identity is deliberately content-addressed by the
    # backend, canonical solver profile, exact CNF, exact producer manifest,
    # and optional core limit.  Runtime timeouts are persisted on the job but
    # are not part of that identity; child33 binds them separately in both the
    # prepare response and every status check.  Requiring ``existing = false``
    # also prevents a differently timed pre-existing job from being adopted.
    return hashlib.sha256(
        (
            "raw-dimacs/v1\n"
            f"{spec.ingress.backend}\n{spec.ingress.solver_profile}\n"
            f"{spec.root_sha256}\n{spec.manifest_sha256}\n"
            f"cores={REQUESTED_CORE_LIMIT}"
        ).encode()
    ).hexdigest()


def _legacy_timeout_inclusive_identity_hash(spec: RunnerSpec) -> str:
    """Recompute the exact child33 pre-fix identity, for custody migration only."""
    _require(
        spec.artifact_namespace == "child33",
        "legacy timeout-inclusive identity is child33-only",
    )
    return hashlib.sha256(
        (
            "raw-dimacs/v1\n"
            f"{spec.ingress.backend}\n{spec.ingress.solver_profile}\n"
            f"{spec.root_sha256}\n{spec.manifest_sha256}\n"
            f"cores={REQUESTED_CORE_LIMIT}\n"
            f"timeout_s={spec.timeout_s}\n"
            f"march_timeout_s={spec.march_timeout_s}"
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
    if spec.artifact_namespace == "child33":
        _require(status.get("timeout_s") == spec.timeout_s, "PIQD timeout crossed child33 identity")
        _require(
            status.get("march_timeout_s") == spec.march_timeout_s,
            "PIQD march timeout crossed child33 identity",
        )
    observed_core_limit = status.get("requested_core_limit")
    _require(
        type(observed_core_limit) is int
        and observed_core_limit == REQUESTED_CORE_LIMIT,
        "PIQD requested core limit crossed child32 identity",
    )
    allowed = (
        frozenset({expected_status})
        if isinstance(expected_status, str)
        else expected_status
    )
    actual = status.get("status")
    _require(actual in allowed, "PIQD status crossed child32 lifecycle")
    assert isinstance(actual, str)
    expected_run_epoch = 0 if actual in {"prepared", "confirmed"} else 1
    observed_run_epoch = status.get("run_epoch")
    _require(
        type(observed_run_epoch) is int
        and observed_run_epoch == expected_run_epoch,
        "PIQD run epoch is not a fresh single-attempt lifecycle",
    )
    _require(
        "recovery_action" in status and status.get("recovery_action") is None,
        "PIQD job has recovery history or omitted its recovery action",
    )
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
        "producer_manifest_hash": spec.manifest_sha256,
        "producer_manifest_blob_hash": spec.manifest_sha256,
    }
    for key, value in expected.items():
        _require(response.get(key) == value, f"PIQD prepare {key} crossed child32 identity")
    if spec.artifact_namespace == "child33":
        _require(response.get("timeout_s") == spec.timeout_s, "PIQD timeout crossed child33 identity")
        _require(
            response.get("march_timeout_s") == spec.march_timeout_s,
            "PIQD march timeout crossed child33 identity",
        )
    existing = response.get("existing")
    _require(type(existing) is bool, "PIQD prepare omitted exact existing flag")
    observed_core_limit = response.get("requested_core_limit")
    _require(
        type(observed_core_limit) is int
        and observed_core_limit == REQUESTED_CORE_LIMIT,
        "PIQD prepare requested core limit drifted",
    )
    if expected_existing is not None:
        _require(existing is expected_existing, "PIQD prepare existing flag drifted")


def _expected_binding(spec: RunnerSpec) -> dict[str, Any]:
    binding = {
        "identity_hash": expected_identity_hash(spec),
        "cnf_sha256": spec.root_sha256,
        "manifest_sha256": spec.manifest_sha256,
        "project": spec.project,
        "backend": spec.ingress.backend,
        "solver_profile": spec.ingress.solver_profile,
        "requested_core_limit": REQUESTED_CORE_LIMIT,
    }
    if spec.artifact_namespace == "child33":
        binding.update(
            {"timeout_s": spec.timeout_s, "march_timeout_s": spec.march_timeout_s}
        )
    return binding


def _legacy_timeout_inclusive_binding(spec: RunnerSpec) -> dict[str, Any]:
    binding = _expected_binding(spec)
    binding["identity_hash"] = _legacy_timeout_inclusive_identity_hash(spec)
    return binding


def _intent_binding_kind(intent: dict[str, Any], spec: RunnerSpec) -> str:
    observed = intent.get("binding")
    if observed == _expected_binding(spec):
        return "canonical"
    if (
        spec.artifact_namespace == "child33"
        and observed == _legacy_timeout_inclusive_binding(spec)
    ):
        return "legacy-timeout-inclusive/v1"
    raise ValueError("submission intent binding drifted")


def _expected_intent_binding_migration(
    spec: RunnerSpec, intent_sha256: str, job_id: str
) -> dict[str, Any]:
    return {
        "schema": _artifact_schema(spec, "intent-binding-migration", 1),
        "reason": "runner-pre-fix-timeout-inclusive-identity/v1",
        "job_id": job_id,
        "intent_sha256": intent_sha256,
        "from_binding": _legacy_timeout_inclusive_binding(spec),
        "to_binding": _expected_binding(spec),
    }


def _artifact_schema(spec: RunnerSpec, kind: str, version: int) -> str:
    return f"p97-exact17-{spec.artifact_namespace}-piqd-{kind}/v{version}"


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
        "schema": _artifact_schema(spec, "intent", 1),
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
    *,
    allow_legacy_timeout_inclusive: bool = False,
) -> str:
    _require(
        intent.get("schema") == _artifact_schema(spec, "intent", 1),
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
    binding_kind = _intent_binding_kind(intent, spec)
    _require(
        binding_kind == "canonical" or allow_legacy_timeout_inclusive,
        "legacy submission intent requires explicit identity-contract migration",
    )
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
    return binding_kind


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
        prepared.get("schema") == _artifact_schema(spec, "prepared", 3),
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
    binding_kind = _intent_binding_kind(intent, spec)
    if submission_mode == "created":
        _require(binding_kind == "canonical", "created custody used a legacy intent binding")
        _require(isinstance(submitted, dict), "prepared record omitted submit response")
        _check_prepare_response(submitted, job_id, spec, expected_existing=False)
    elif submission_mode == "reconciled_after_prepare_response_failure":
        _require(binding_kind == "canonical", "ordinary reconciliation used a legacy intent binding")
        _require(submitted is None, "reconciled prepared record invented a submit response")
    elif submission_mode == "reconciled_after_identity_contract_fix":
        _require(
            binding_kind == "legacy-timeout-inclusive/v1",
            "identity-contract migration omitted the exact legacy intent binding",
        )
        _require(submitted is None, "identity-contract migration invented a submit response")
        _require(
            prepared.get("intent_binding_migration")
            == _expected_intent_binding_migration(spec, intent_sha256, job_id),
            "prepared intent-binding migration drifted",
        )
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
    _require(
        method in {"direct", "status_recovery", "confirm_409_status_recovery"},
        "unknown confirmation method",
    )
    if method == "direct":
        _require(
            confirmation.get("response")
            == {"job_id": job_id, "blob_hash": spec.root_sha256, "status": "confirmed"},
            "state confirmation identity drifted",
        )
    elif method == "status_recovery":
        _require(
            confirmation.get("recovered_from") in POST_CONFIRM_STATUSES,
            "state recovery did not witness a post-confirm status",
        )
    else:
        _require(
            confirmation.get("recovered_from") in POST_CONFIRM_STATUSES,
            "confirm-409 recovery did not witness a post-confirm status",
        )
    post_status = state.get("post_confirm_status")
    _require(isinstance(post_status, dict), "state omitted post-confirm PIQD status")
    actual = _check_job(
        post_status, job_id, spec, POST_CONFIRM_STATUSES
    )
    if method in {"status_recovery", "confirm_409_status_recovery"}:
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
        # Prepared/confirmed jobs have not yet been assigned a deciding daemon
        # or solver, so PIQD serializes some attestation fields as JSON null.
        # Treat null like an absent optional field; any populated value remains
        # identity-bearing and must match exactly. Terminal attestation is
        # separately mandatory in `_check_completion_attestation`.
        if key in payload and payload.get(key) is not None:
            _require(payload.get(key) == value, f"PIQD {key} crossed child32 identity")


def _check_completion_attestation(status: dict[str, Any]) -> None:
    processes = status.get("attested_solver_processes")
    _require(
        type(processes) is int and processes == ATTESTED_SOLVER_PROCESSES,
        "completed PIQD job lacks exact single-process attestation",
    )
    _require(
        status.get("attestation_basis") == ATTESTATION_BASIS,
        "completed PIQD job lacks the required attestation basis",
    )
    solver_log_sha256 = status.get("log_sha256")
    _require(
        isinstance(solver_log_sha256, str)
        and re.fullmatch(r"[0-9a-f]{64}", solver_log_sha256) is not None,
        "completed PIQD job omitted or supplied a malformed solver-log hash",
    )


_MODEL_CHECK_KEYS = frozenset(
    {
        "job_id",
        "project",
        "cnf_blob_hash",
        "outcome",
        "announcement",
        "detail",
        "clause_index",
        "clause",
        "num_vars",
        "num_clauses",
        "num_assigned",
        "ce_scope",
        "checked_at",
        "announced_at",
        "model_sha256",
        "job_completed_at",
    }
)


def _check_child33_result_shape(
    status: dict[str, Any], spec: RunnerSpec, result: str
) -> None:
    if spec.artifact_namespace != "child33":
        return
    fields = (
        "proof_blob_hash",
        "kept_cnf_blob_hash",
        "proof_format",
        "model_blob_hash",
    )
    for field in fields:
        _require(field in status, f"child33 status omitted {field}")
    if result == "SAT":
        for field in fields:
            _require(status[field] is None, f"child33 SAT populated {field}")
        _require(
            type(status.get("completed_at")) is int,
            "child33 SAT status omitted exact completed_at",
        )
    elif result == "UNSAT":
        _require(status["model_blob_hash"] is None, "child33 UNSAT populated model_blob_hash")
        for field in ("proof_blob_hash", "kept_cnf_blob_hash"):
            _require(
                isinstance(status[field], str)
                and re.fullmatch(r"[0-9a-f]{64}", status[field]) is not None,
                f"child33 UNSAT supplied malformed {field}",
            )
        _require(
            status["proof_format"] == "compacted_lrat",
            "child33 UNSAT proof format is not compacted_lrat",
        )


def _check_child33_model_check(
    row: dict[str, Any],
    status: dict[str, Any],
    job_id: str,
    spec: RunnerSpec,
    assignment: list[int],
) -> None:
    _require(set(row) == _MODEL_CHECK_KEYS, "child33 model-check schema drifted")
    _require(row.get("job_id") == job_id, "child33 model-check crossed job identity")
    _require(row.get("project") == spec.project, "child33 model-check crossed project")
    _require(
        row.get("cnf_blob_hash") == spec.root_sha256,
        "child33 model-check crossed root identity",
    )
    _require(row.get("outcome") == "SATISFIED", "child33 model-check is not SATISFIED")
    _require(row.get("announcement") == "NONE", "child33 model-check announcement drifted")
    _require(row.get("detail") is None, "child33 model-check unexpectedly has detail")
    _require(row.get("clause_index") is None, "child33 model-check names a clause index")
    _require(row.get("clause") is None, "child33 model-check names a clause")
    _require(row.get("ce_scope") is None, "child33 model-check CE scope drifted")
    for field, expected in (
        ("num_vars", spec.variables),
        ("num_clauses", spec.clauses),
        ("num_assigned", spec.variables),
    ):
        _require(
            type(row.get(field)) is int and row[field] == expected,
            f"child33 model-check {field} drifted",
        )
    _require(
        type(status.get("completed_at")) is int
        and row.get("job_completed_at") == status["completed_at"],
        "child33 model-check crossed completed_at",
    )
    _require(
        type(row.get("checked_at")) is int
        and row["checked_at"] >= status["completed_at"],
        "child33 model-check checked_at predates completion",
    )
    _require(row.get("announced_at") is None, "child33 model-check was already announced")
    expected_model_sha256 = hashlib.sha256(
        " ".join(str(lit) for lit in assignment).encode()
    ).hexdigest()
    _require(
        row.get("model_sha256") == expected_model_sha256,
        "child33 model-check crossed model identity",
    )


def _check_failed_attestation(status: dict[str, Any]) -> None:
    _require(status.get("result") == "UNKNOWN", "failed PIQD job is not UNKNOWN")
    _require(
        status.get("attested_solver_processes") is None,
        "failed PIQD job unexpectedly attests solver processes",
    )
    _require(
        status.get("attestation_basis") is None,
        "failed PIQD job unexpectedly attests a solver basis",
    )


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


@contextmanager
def _retrieved_log_snapshot(
    client: PiqdClient, job_id: str, directory: Path
):
    with _anonymous_file(directory) as (descriptor, path):
        reported = client.retrieve_log(job_id, path)
        os.fsync(descriptor)
        size = os.fstat(descriptor).st_size
        digest = _sha256_descriptor(descriptor, size)
        _require(size > 0, "completed PIQD job has an empty solver log")
        _require(
            reported == {"bytes": size, "sha256": digest},
            "PIQD solver-log report does not match retrieved bytes",
        )
        os.lseek(descriptor, 0, os.SEEK_SET)
        yield HeldSnapshot(descriptor=descriptor, path=path, sha256=digest, size=size)


def _publish_snapshot(snapshot: HeldSnapshot, destination: Path) -> None:
    destination.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(
        dir=destination.parent, prefix=f".{destination.name}.", suffix=".tmp"
    )
    temporary = Path(temporary_name)
    try:
        os.fchmod(descriptor, 0o600)
        offset = 0
        while offset < snapshot.size:
            chunk = os.pread(
                snapshot.descriptor, min(1024 * 1024, snapshot.size - offset), offset
            )
            if not chunk:
                raise ValueError("held snapshot truncated during publication")
            _write_all(descriptor, chunk)
            offset += len(chunk)
        os.fsync(descriptor)
        _require(
            _sha256_descriptor(descriptor, snapshot.size) == snapshot.sha256,
            "published snapshot hash drifted before linking",
        )
        os.link(temporary, destination)
        directory = os.open(destination.parent, os.O_RDONLY)
        try:
            os.fsync(directory)
        finally:
            os.close(directory)
    finally:
        os.close(descriptor)
        temporary.unlink(missing_ok=True)


POST_CONFIRM_STATUSES = frozenset({"confirmed", "running", "completed", "failed"})


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
        try:
            confirmed = client.confirm(job_id)
        except ConfirmConflictError:
            post_status = client.status(job_id)
            recovered = _check_job(post_status, job_id, spec, POST_CONFIRM_STATUSES)
            _check_optional_protocol_bindings(post_status, spec, identity)
            confirmation = {
                "method": "confirm_409_status_recovery",
                "recovered_from": recovered,
            }
        else:
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
        "schema": _artifact_schema(spec, "state", 3),
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
        if (
            paths.state.exists()
            or paths.final.exists()
            or paths.model.exists()
            or paths.solver_log.exists()
        ):
            raise FileExistsError("refusing stale child32 confirmed/final artifact reuse")
        local = validate_local(paths, spec, ingress_validator=ingress_validator)
        identity = live_identity(client, spec)
        if paths.prepared.exists():
            _require(paths.intent.is_file(), "prepared custody omitted submission intent")
            intent = strict_json_read(paths.intent)
            prepared = strict_json_read(paths.prepared)
            _check_intent_record(
                intent,
                spec,
                local,
                identity,
                allow_legacy_timeout_inclusive=(
                    prepared.get("submission_mode")
                    == "reconciled_after_identity_contract_fix"
                ),
            )
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
                submit_kwargs: dict[str, Any] = {
                    "backend": spec.ingress.backend,
                    "profile": spec.ingress.solver_profile,
                    "project": spec.project,
                    "requested_core_limit": REQUESTED_CORE_LIMIT,
                }
                if spec.artifact_namespace == "child33":
                    submit_kwargs.update(
                        timeout_s=spec.timeout_s,
                        march_timeout_s=spec.march_timeout_s,
                    )
                response = client.submit(
                    root_snapshot.path, manifest_snapshot.path, **submit_kwargs
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
                    "schema": _artifact_schema(spec, "prepared", 3),
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
    allow_legacy_intent_migration: bool = False,
) -> dict[str, Any]:
    """Recover one known prepare whose response was lost after intent persistence."""
    with _transaction_lock(paths.lock):
        _require(bool(job_id), "reconciliation omitted PIQD job ID")
        if (
            paths.prepared.exists()
            or paths.state.exists()
            or paths.final.exists()
            or paths.model.exists()
            or paths.solver_log.exists()
        ):
            raise FileExistsError("refusing reconciliation over existing child32 custody")
        _require(paths.intent.is_file(), "reconciliation requires persisted submission intent")
        local = validate_local(paths, spec, ingress_validator=ingress_validator)
        identity = live_identity(client, spec)
        intent = strict_json_read(paths.intent)
        binding_kind = _check_intent_record(
            intent,
            spec,
            local,
            identity,
            allow_legacy_timeout_inclusive=allow_legacy_intent_migration,
        )
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

        migrated = binding_kind == "legacy-timeout-inclusive/v1"
        prepared = {
            "schema": _artifact_schema(spec, "prepared", 3),
            "phase": "prepared",
            "job_id": job_id,
            "root": local,
            "daemon": identity["version"],
            "solver": identity["solver"],
            "binding": _expected_binding(spec),
            "intent_sha256": intent_sha256,
            "intent": intent,
            "submission_mode": (
                "reconciled_after_identity_contract_fix"
                if migrated
                else "reconciled_after_prepare_response_failure"
            ),
            "submitted": None,
            "prepared_status": prepared_status,
            "stored_preconfirm": stored,
        }
        if migrated:
            prepared["intent_binding_migration"] = _expected_intent_binding_migration(
                spec, intent_sha256, job_id
            )
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
        if paths.final.exists() or paths.model.exists() or paths.solver_log.exists():
            raise FileExistsError("refusing stale child32 final/model/log reuse")
        local = validate_local(paths, spec, ingress_validator=ingress_validator)
        identity = live_identity(client, spec)
        prepared = strict_json_read(paths.prepared)
        intent = strict_json_read(paths.intent)
        _check_intent_record(
            intent,
            spec,
            local,
            identity,
            allow_legacy_timeout_inclusive=(
                prepared.get("submission_mode")
                == "reconciled_after_identity_contract_fix"
            ),
        )
        intent_sha256 = sha256_file(paths.intent)
        prepared_job_id = _check_prepared_record(
            prepared, spec, local, identity, intent, intent_sha256
        )
        prepared_sha256 = sha256_file(paths.prepared)
        state = strict_json_read(paths.state)
        _require(
            state.get("schema") == _artifact_schema(spec, "state", 3),
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
        lifecycle = _check_job(status, job_id, spec, frozenset({"completed", "failed"}))
        _check_optional_protocol_bindings(status, spec, identity)
        if lifecycle == "completed":
            _require(
                status.get("daemon_sha256") == spec.ingress.daemon_sha256,
                "completed job omitted or crossed the deciding daemon build",
            )
            _check_completion_attestation(status)
        else:
            _check_failed_attestation(status)
        result = status.get("result")
        if lifecycle == "completed":
            _require(
                result in {"SAT", "UNSAT"},
                "completed PIQD job has no proof-relevant result",
            )
            assert isinstance(result, str)
            _check_child33_result_shape(status, spec, result)
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
                "schema": _artifact_schema(spec, "final", 2),
                "job_id": job_id,
                "result": result,
                "binding": expected_binding,
                "completion_status": status,
                "stored_final": stored,
                "daemon": identity["version"],
                "deciding_daemon_sha256": status["daemon_sha256"],
                "solver": identity["solver"],
            }
            if lifecycle == "failed":
                report.update(
                    {
                        "next_gate": "new_identity_required_after_failed_no_solver_job",
                        "solver_log": None,
                    }
                )
            else:
                model_record: dict[str, Any] | None = None
                with _retrieved_log_snapshot(
                    client, job_id, paths.final.parent
                ) as solver_log:
                    terminal_log_sha256 = status.get("log_sha256")
                    _require(
                        terminal_log_sha256 == solver_log.sha256,
                        "retrieved PIQD solver log crossed its terminal attestation",
                    )
                    report["solver_log"] = {
                        "bytes": solver_log.size,
                        "sha256": solver_log.sha256,
                        "terminal_attestation": terminal_log_sha256,
                    }
                    if result == "SAT":
                        model = client.model(job_id)
                        _require(
                            set(model)
                            == {
                                "job_id",
                                "result",
                                "backend",
                                "solver_profile",
                                "num_assigned",
                                "assignment",
                            },
                            "model endpoint schema drifted",
                        )
                        _require(
                            model.get("job_id") == job_id,
                            "model crossed child32 job identity",
                        )
                        _require(model.get("result") == "SAT", "model endpoint is not SAT")
                        _require(
                            model.get("backend") == spec.ingress.backend,
                            "model backend crossed child32 identity",
                        )
                        _require(
                            model.get("solver_profile") == spec.ingress.solver_profile,
                            "model profile crossed child32 identity",
                        )
                        assigned = model.get("num_assigned")
                        _require(
                            type(assigned) is int and assigned == spec.variables,
                            "model width drifted",
                        )
                        replay = replay_model(
                            remote_cnf.path, model.get("assignment"), spec
                        )
                        model_check: dict[str, Any] | None = None
                        if spec.artifact_namespace == "child33":
                            model_check = client.model_check(job_id)
                            _check_child33_model_check(
                                model_check,
                                status,
                                job_id,
                                spec,
                                model["assignment"],
                            )
                        model_record = {
                            "schema": _artifact_schema(spec, "model", 3),
                            "job_id": job_id,
                            "cnf_sha256": spec.root_sha256,
                            "manifest_sha256": spec.manifest_sha256,
                            "completion_identity_hash": status.get("identity_hash"),
                            "model": model,
                            "replay": replay,
                        }
                        report.update(
                            {
                                "model_replay": replay,
                                **(
                                    {"model_check": model_check}
                                    if spec.artifact_namespace == "child33"
                                    else {}
                                ),
                                "next_gate": "mandatory_general_theorem_search",
                            }
                        )
                    elif result == "UNSAT":
                        report.update(
                            {
                                "proof_replay_complete": False,
                                "next_gate": (
                                    "retrieve_clause_map_and_proof_then_"
                                    "independently_replay"
                                ),
                            }
                        )
                    _publish_snapshot(solver_log, paths.solver_log)
                if model_record is not None:
                    _immutable_json(paths.model, model_record)
                    report["model_sha256"] = sha256_file(paths.model)
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
