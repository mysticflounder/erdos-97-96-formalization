"""Strict execution-custody adapter for PIQD's Singular lane.

This module deliberately does not interpret Singular output.  A ``RAN``
receipt says only that PIQD started Singular and retained its transcript; the
caller remains responsible for parsing and checking any mathematical claim.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
import time
import urllib.error
import urllib.request
import uuid
from collections.abc import Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any

SCHEMA = "p97-piqd-singular-execution-custody/v1"
PROFILE = "default"
MAX_SCRIPT_BYTES = 16 * 1024 * 1024
MAX_STREAM_BYTES = 16 * 1024 * 1024
MAX_CONTEXT_BYTES = 1024 * 1024
MAX_HTTP_JSON_BYTES = 1024 * 1024
MAX_TIMEOUT_S = 86_400
I64_MIN = -(1 << 63)
I64_MAX = (1 << 63) - 1
_NATIVE_PATH_TYPE = type(Path())
RUN_KEYS = frozenset(
    {
        "id",
        "project",
        "request_id",
        "request_sha256",
        "script_blob_hash",
        "source",
        "profile",
        "timeout_s",
        "state",
        "run_status",
        "exit_code",
        "argv",
        "binary_path",
        "binary_sha256",
        "env_sha256",
        "stdout_blob_hash",
        "stderr_blob_hash",
        "stdout_truncated",
        "stderr_truncated",
        "attested_processes",
        "attestation_basis",
        "result_sha256",
        "wall_ms",
        "created_at",
        "started_at",
        "finished_at",
    }
)
SUBMIT_KEYS = RUN_KEYS | {"replayed"}
STATES = frozenset({"queued", "running", "finished"})
RUN_STATUSES = frozenset(
    {"RAN", "ERRORED", "TIMED_OUT", "DID_NOT_START", "INTERRUPTED"}
)
ARGV_PREFIX = (
    "Singular",
    "-q",
    "-t",
    "--no-rc",
    "--cpus=1",
    "--threads=1",
    "--flint-threads=1",
)
STARTED_ATTESTATION = "SINGLE_SPAWN_UNCONFINED_CHILDREN"
DID_NOT_START_ATTESTATION = "SOLVER_DID_NOT_START"
MANIFEST_KEYS = frozenset(
    {
        "schema",
        "source",
        "effective_source",
        "source_context",
        "source_context_sha256",
        "request",
        "replayed",
        "receipt",
        "receipt_sha256",
        "artifacts",
        "claims",
        "artifact_sha256",
    }
)
REQUEST_KEYS = frozenset(
    {"script_blob_hash", "source", "profile", "timeout_s", "project", "request_id"}
)
ARTIFACT_KEYS = frozenset({"script", "stdout", "stderr"})
ARTIFACT_ENTRY_KEYS = frozenset({"path", "bytes", "sha256"})
CLAIMS = {
    "execution_custody": True,
    "mathematical_verdict": False,
    "singular_children_confined": False,
}


class PiqdSingularCustodyError(RuntimeError):
    """PIQD transport, schema, lifecycle, digest, or artifact custody failed."""


def _native_path(value: object, where: str) -> Path:
    if type(value) is not _NATIVE_PATH_TYPE:
        raise PiqdSingularCustodyError(f"{where} must be an exact native Path")
    return value


@dataclass(frozen=True)
class SingularExecutionResult:
    run_id: str
    run_status: str
    exit_code: int | None
    stdout: bytes | None
    stderr: bytes | None
    script_path: Path
    stdout_path: Path | None
    stderr_path: Path | None
    receipt_path: Path
    manifest_path: Path
    request_sha256: str
    result_sha256: str
    script_sha256: str
    stdout_sha256: str | None
    stderr_sha256: str | None
    source_context_sha256: str
    receipt_sha256: str
    artifact_sha256: str
    replayed: bool


def _sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _canonical(value: object) -> bytes:
    try:
        return json.dumps(
            value,
            allow_nan=False,
            ensure_ascii=False,
            separators=(",", ":"),
            sort_keys=True,
        ).encode("utf-8")
    except (TypeError, ValueError, UnicodeEncodeError, RecursionError) as exc:
        raise PiqdSingularCustodyError("value is not canonical JSON") from exc


def _strict_pairs(pairs: list[tuple[str, object]]) -> dict[str, object]:
    result: dict[str, object] = {}
    for key, value in pairs:
        if key in result:
            raise PiqdSingularCustodyError(f"JSON repeats key {key!r}")
        result[key] = value
    return result


def _reject_constant(value: str) -> object:
    raise PiqdSingularCustodyError(f"JSON contains non-finite number {value}")


def _json(data: bytes, where: str) -> object:
    try:
        return json.loads(
            data.decode("utf-8"),
            object_pairs_hook=_strict_pairs,
            parse_constant=_reject_constant,
        )
    except PiqdSingularCustodyError:
        raise
    except (
        UnicodeDecodeError,
        json.JSONDecodeError,
        ValueError,
        RecursionError,
    ) as exc:
        raise PiqdSingularCustodyError(f"{where} is not strict UTF-8 JSON") from exc


def _builtin_json(value: object, where: str) -> None:
    pending: list[tuple[object, int]] = [(value, 0)]
    nodes = 0
    while pending:
        item, depth = pending.pop()
        nodes += 1
        if nodes > 100_000 or depth > 64:
            raise PiqdSingularCustodyError(f"{where} exceeds its structural bound")
        if item is None or type(item) in {bool, int, str}:
            continue
        if type(item) is list:
            pending.extend((child, depth + 1) for child in item)
            continue
        if type(item) is dict:
            if any(type(key) is not str for key in item):
                raise PiqdSingularCustodyError(f"{where} has a non-string key")
            pending.extend((child, depth + 1) for child in item.values())
            continue
        raise PiqdSingularCustodyError(f"{where} is not JSON-safe")


def _exact_keys(value: object, keys: frozenset[str], where: str) -> dict[str, Any]:
    if type(value) is not dict:
        raise PiqdSingularCustodyError(f"{where} is not an object")
    actual = frozenset(value)
    if actual != keys:
        raise PiqdSingularCustodyError(
            f"{where} key set differs: missing={sorted(keys - actual)}, "
            f"unknown={sorted(actual - keys)}"
        )
    return value


def _string(value: object, where: str, *, nonempty: bool = False) -> str:
    if type(value) is not str or (nonempty and not value):
        raise PiqdSingularCustodyError(f"{where} has the wrong string type")
    try:
        value.encode("utf-8")
    except UnicodeEncodeError as exc:
        raise PiqdSingularCustodyError(f"{where} is not valid UTF-8 text") from exc
    return value


def _integer(value: object, where: str, *, minimum: int | None = None) -> int:
    if (
        type(value) is not int
        or not (I64_MIN <= value <= I64_MAX)
        or (minimum is not None and value < minimum)
    ):
        raise PiqdSingularCustodyError(f"{where} has the wrong integer type/range")
    return value


def _optional_integer(value: object, where: str) -> int | None:
    if value is None:
        return None
    return _integer(value, where)


def _boolean(value: object, where: str) -> bool:
    if type(value) is not bool:
        raise PiqdSingularCustodyError(f"{where} has the wrong boolean type")
    return value


def _hash(value: object, where: str, *, nullable: bool = False) -> str | None:
    if nullable and value is None:
        return None
    text = _string(value, where)
    if len(text) != 64 or any(c not in "0123456789abcdef" for c in text):
        raise PiqdSingularCustodyError(f"{where} is not canonical SHA-256")
    return text


def _request_sha256(
    project: str, script_hash: str, source: str, profile: str, timeout_s: int
) -> str:
    digest = hashlib.sha256()
    for field in (project, script_hash, source, profile):
        raw = field.encode("utf-8")
        digest.update(str(len(raw)).encode("ascii"))
        digest.update(b":")
        digest.update(raw)
    digest.update(str(timeout_s).encode("ascii"))
    return digest.hexdigest()


def _argv_json(argv: list[str]) -> str:
    return json.dumps(argv, ensure_ascii=False, separators=(",", ":"))


def _result_sha256(receipt: Mapping[str, object]) -> str:
    exit_code = receipt["exit_code"]
    fields = (
        receipt["request_sha256"],
        receipt["run_status"],
        "-" if exit_code is None else str(exit_code),
        receipt["binary_sha256"] or "-",
        receipt["stdout_blob_hash"] or "-",
        receipt["stderr_blob_hash"] or "-",
        "1" if receipt["stdout_truncated"] else "0",
        "1" if receipt["stderr_truncated"] else "0",
        _argv_json(receipt["argv"]),
    )
    return _sha("".join(f"{field}\n" for field in fields).encode("utf-8"))


def _validate_argv(value: object, run_id: str) -> list[str]:
    if type(value) is not list or any(type(item) is not str for item in value):
        raise PiqdSingularCustodyError("receipt.argv is not a string array")
    argv: list[str] = value
    if tuple(argv[:-1]) != ARGV_PREFIX or len(argv) != len(ARGV_PREFIX) + 1:
        raise PiqdSingularCustodyError(
            "receipt.argv is not the maintained Singular profile"
        )
    suffix = f"/singular/{run_id}/script.sing"
    if not argv[-1].endswith(suffix) or "\x00" in argv[-1]:
        raise PiqdSingularCustodyError(
            "receipt.argv has an unexpected staged script path"
        )
    return argv


def _validate_receipt(
    raw: object, expected_request: Mapping[str, object] | None = None
) -> dict[str, Any]:
    receipt = _exact_keys(raw, RUN_KEYS, "RunView")
    run_id = _string(receipt["id"], "receipt.id", nonempty=True)
    try:
        if str(uuid.UUID(run_id)) != run_id:
            raise ValueError
    except ValueError as exc:
        raise PiqdSingularCustodyError("receipt.id is not a canonical UUID") from exc
    project = _string(receipt["project"], "receipt.project")
    _string(receipt["request_id"], "receipt.request_id")
    request_hash = _hash(receipt["request_sha256"], "receipt.request_sha256")
    script_hash = _hash(receipt["script_blob_hash"], "receipt.script_blob_hash")
    source = _string(receipt["source"], "receipt.source")
    profile = _string(receipt["profile"], "receipt.profile")
    if profile != PROFILE:
        raise PiqdSingularCustodyError("receipt.profile is not the maintained profile")
    timeout_s = _integer(receipt["timeout_s"], "receipt.timeout_s", minimum=1)
    if timeout_s > MAX_TIMEOUT_S:
        raise PiqdSingularCustodyError("receipt.timeout_s exceeds adapter policy")
    expected_hash = _request_sha256(project, script_hash, source, profile, timeout_s)
    if request_hash != expected_hash:
        raise PiqdSingularCustodyError("receipt.request_sha256 does not recompute")
    if expected_request is not None:
        for key in REQUEST_KEYS:
            if receipt[key] != expected_request[key]:
                raise PiqdSingularCustodyError(
                    f"receipt does not bind request field {key}"
                )

    state = _string(receipt["state"], "receipt.state")
    if state not in STATES:
        raise PiqdSingularCustodyError("receipt.state is outside the closed vocabulary")
    created_at = _integer(receipt["created_at"], "receipt.created_at", minimum=0)
    started_at = _optional_integer(receipt["started_at"], "receipt.started_at")
    finished_at = _optional_integer(receipt["finished_at"], "receipt.finished_at")
    terminal_names = (
        "run_status",
        "exit_code",
        "argv",
        "binary_path",
        "binary_sha256",
        "env_sha256",
        "stdout_blob_hash",
        "stderr_blob_hash",
        "stdout_truncated",
        "stderr_truncated",
        "attested_processes",
        "attestation_basis",
        "result_sha256",
        "wall_ms",
        "finished_at",
    )
    if state == "queued":
        if started_at is not None or any(
            receipt[name] is not None for name in terminal_names
        ):
            raise PiqdSingularCustodyError(
                "queued receipt has premature lifecycle fields"
            )
        return receipt
    if state == "running":
        if started_at is None or started_at < created_at:
            raise PiqdSingularCustodyError("running receipt has invalid started_at")
        if any(receipt[name] is not None for name in terminal_names):
            raise PiqdSingularCustodyError(
                "running receipt has premature terminal fields"
            )
        return receipt

    status = _string(receipt["run_status"], "receipt.run_status")
    if status not in RUN_STATUSES:
        raise PiqdSingularCustodyError(
            "receipt.run_status is outside the closed vocabulary"
        )
    if (
        started_at is None
        or finished_at is None
        or not (created_at <= started_at <= finished_at)
    ):
        raise PiqdSingularCustodyError("finished receipt has invalid timestamps")
    if status == "INTERRUPTED":
        unobserved_names = (
            "exit_code",
            "argv",
            "binary_path",
            "binary_sha256",
            "env_sha256",
            "stdout_blob_hash",
            "stderr_blob_hash",
            "stdout_truncated",
            "stderr_truncated",
            "attested_processes",
            "attestation_basis",
            "result_sha256",
            "wall_ms",
        )
        if any(receipt[name] is not None for name in unobserved_names):
            raise PiqdSingularCustodyError(
                "INTERRUPTED must have null unobserved outcome fields"
            )
        raise PiqdSingularCustodyError(
            "Singular run was INTERRUPTED; execution custody is inconclusive"
        )
    exit_code = _optional_integer(receipt["exit_code"], "receipt.exit_code")
    _integer(receipt["wall_ms"], "receipt.wall_ms", minimum=0)
    argv = _validate_argv(receipt["argv"], run_id)
    result_hash = _hash(receipt["result_sha256"], "receipt.result_sha256")
    for name in ("stdout_truncated", "stderr_truncated"):
        _boolean(receipt[name], f"receipt.{name}")

    if status == "DID_NOT_START":
        if receipt["exit_code"] is not None:
            raise PiqdSingularCustodyError("DID_NOT_START has an exit code")
        if receipt["binary_path"] is not None:
            _string(receipt["binary_path"], "receipt.binary_path", nonempty=True)
        binary_hash = _hash(
            receipt["binary_sha256"], "receipt.binary_sha256", nullable=True
        )
        if receipt["binary_path"] is None and binary_hash is not None:
            raise PiqdSingularCustodyError(
                "DID_NOT_START hashes a binary without naming its path"
            )
        if any(
            receipt[name] is not None
            for name in ("env_sha256", "stdout_blob_hash", "stderr_blob_hash")
        ):
            raise PiqdSingularCustodyError(
                "DID_NOT_START claims process output/environment"
            )
        if receipt["stdout_truncated"] or receipt["stderr_truncated"]:
            raise PiqdSingularCustodyError("DID_NOT_START claims truncated streams")
        if (
            receipt["attested_processes"] != 0
            or type(receipt["attested_processes"]) is not int
        ):
            raise PiqdSingularCustodyError(
                "DID_NOT_START lacks exact zero-process attestation"
            )
        if receipt["attestation_basis"] != DID_NOT_START_ATTESTATION:
            raise PiqdSingularCustodyError(
                "DID_NOT_START has the wrong attestation basis"
            )
    else:
        if status == "RAN" and exit_code != 0:
            raise PiqdSingularCustodyError("RAN does not have exit code zero")
        if status == "ERRORED" and exit_code == 0:
            raise PiqdSingularCustodyError("ERRORED has exit code zero")
        _string(receipt["binary_path"], "receipt.binary_path", nonempty=True)
        for name in (
            "binary_sha256",
            "env_sha256",
            "stdout_blob_hash",
            "stderr_blob_hash",
        ):
            _hash(receipt[name], f"receipt.{name}")
        if (
            receipt["attested_processes"] != 1
            or type(receipt["attested_processes"]) is not int
        ):
            raise PiqdSingularCustodyError(
                "started run lacks exact one-process attestation"
            )
        if receipt["attestation_basis"] != STARTED_ATTESTATION:
            raise PiqdSingularCustodyError(
                "started run has the wrong attestation basis"
            )
    if result_hash != _result_sha256({**receipt, "argv": argv}):
        raise PiqdSingularCustodyError("receipt.result_sha256 does not recompute")
    return receipt


class PiqdSingularRunner:
    """Submit, poll, retrieve, verify, and publish one PIQD Singular run."""

    def __init__(
        self,
        base_url: str = "http://127.0.0.1:7272",
        *,
        poll_interval_s: float = 0.25,
        max_poll_s: float = 3600.0,
    ) -> None:
        if not base_url.startswith(("http://", "https://")):
            raise ValueError("base_url must be HTTP(S)")
        if not (0.01 <= poll_interval_s <= 60.0):
            raise ValueError("poll_interval_s is outside 0.01..60")
        if not (1.0 <= max_poll_s <= MAX_TIMEOUT_S + 300):
            raise ValueError("max_poll_s is outside its bounded policy")
        self.base_url = base_url.rstrip("/")
        self.poll_interval_s = float(poll_interval_s)
        self.max_poll_s = float(max_poll_s)

    def _request(
        self,
        method: str,
        path: str,
        *,
        body: bytes | None = None,
        limit: int = MAX_HTTP_JSON_BYTES,
    ) -> tuple[int, bytes]:
        request = urllib.request.Request(
            self.base_url + path,
            data=body,
            method=method,
            headers={
                "Accept": "application/json"
                if limit == MAX_HTTP_JSON_BYTES
                else "application/octet-stream",
                "Content-Type": "application/json"
                if method == "POST"
                else "application/octet-stream",
            },
        )
        try:
            with urllib.request.urlopen(request, timeout=30.0) as response:
                data = response.read(limit + 1)
                if len(data) > limit:
                    raise PiqdSingularCustodyError(f"{path} exceeds its response cap")
                return response.status, data
        except urllib.error.HTTPError as exc:
            detail = exc.read(MAX_HTTP_JSON_BYTES + 1)
            raise PiqdSingularCustodyError(
                f"PIQD {method} {path} returned HTTP {exc.code}: {detail[:1000]!r}"
            ) from exc
        except (urllib.error.URLError, TimeoutError, OSError) as exc:
            raise PiqdSingularCustodyError(
                f"PIQD {method} {path} failed: {exc}"
            ) from exc

    def execute(
        self,
        script: bytes,
        *,
        source: str,
        project: str,
        request_id: str,
        timeout_s: int,
        output_directory: Path,
        source_context: Mapping[str, object],
    ) -> SingularExecutionResult:
        if type(script) is not bytes or not script or len(script) > MAX_SCRIPT_BYTES:
            raise PiqdSingularCustodyError(
                "script must be nonempty bytes within the 16 MiB cap"
            )
        for value, name, maximum in (
            (source, "source", 400),
            (project, "project", 200),
            (request_id, "request_id", 200),
        ):
            text = _string(value, name, nonempty=True)
            if len(text.encode("utf-8")) > maximum or "\x00" in text:
                raise PiqdSingularCustodyError(
                    f"{name} is empty, malformed, or too long"
                )
        if (
            type(timeout_s) is not int
            or type(timeout_s) is bool
            or not (1 <= timeout_s <= MAX_TIMEOUT_S)
        ):
            raise PiqdSingularCustodyError("timeout_s must be an integer in 1..86400")
        output = _native_path(output_directory, "output_directory")
        if type(source_context) is not dict:
            raise PiqdSingularCustodyError(
                "source_context must be an exact builtin dict"
            )
        _builtin_json(source_context, "source_context")
        context_bytes = _canonical(source_context)
        if len(context_bytes) > MAX_CONTEXT_BYTES:
            raise PiqdSingularCustodyError("source_context exceeds 1 MiB")
        context = _json(context_bytes, "source_context snapshot")
        if type(context) is not dict:
            raise PiqdSingularCustodyError("source_context snapshot is not an object")
        _builtin_json(context, "source_context snapshot")
        context_hash = _sha(context_bytes)
        effective_source = f"{source}#source_context_sha256={context_hash}"
        if len(effective_source.encode("utf-8")) > 512:
            raise PiqdSingularCustodyError(
                "effective PIQD source exceeds 512 characters"
            )

        script_hash = _sha(script)
        put_status, put_raw = self._request(
            "PUT", f"/blobs/{script_hash}", body=script, limit=MAX_HTTP_JSON_BYTES
        )
        if put_status not in {200, 201}:
            raise PiqdSingularCustodyError("blob PUT returned an unexpected status")
        put = _exact_keys(
            _json(put_raw, "blob PUT response"),
            frozenset({"hash", "bytes", "already_present"}),
            "blob PUT response",
        )
        if (
            put["hash"] != script_hash
            or put["bytes"] != len(script)
            or type(put["bytes"]) is not int
        ):
            raise PiqdSingularCustodyError(
                "blob PUT response does not bind the uploaded script"
            )
        already_present = _boolean(put["already_present"], "blob PUT already_present")
        if (put_status, already_present) not in {(200, True), (201, False)}:
            raise PiqdSingularCustodyError(
                "blob PUT status disagrees with already_present"
            )

        submit_request: dict[str, object] = {
            "script_blob_hash": script_hash,
            "source": effective_source,
            "profile": PROFILE,
            "timeout_s": timeout_s,
            "project": project,
            "request_id": request_id,
        }
        submit_status, submit_raw = self._request(
            "POST", "/singular/runs", body=_canonical(submit_request)
        )
        if submit_status not in {200, 202}:
            raise PiqdSingularCustodyError(
                "Singular submit returned an unexpected status"
            )
        submit = _exact_keys(
            _json(submit_raw, "submit response"), SUBMIT_KEYS, "submit response"
        )
        replayed = _boolean(submit["replayed"], "submit.replayed")
        if (submit_status, replayed) not in {(202, False), (200, True)}:
            raise PiqdSingularCustodyError(
                "submit HTTP status/replayed pairing is invalid"
            )
        receipt = _validate_receipt(
            {key: submit[key] for key in RUN_KEYS}, submit_request
        )
        run_id = receipt["id"]

        deadline = time.monotonic() + self.max_poll_s
        while receipt["state"] != "finished":
            if time.monotonic() >= deadline:
                raise PiqdSingularCustodyError("bounded Singular polling expired")
            time.sleep(self.poll_interval_s)
            status, raw = self._request("GET", f"/singular/runs/{run_id}")
            if status != 200:
                raise PiqdSingularCustodyError(
                    "Singular receipt GET returned an unexpected status"
                )
            current = _validate_receipt(_json(raw, "RunView"), submit_request)
            if (
                current["id"] != run_id
                or current["created_at"] != receipt["created_at"]
            ):
                raise PiqdSingularCustodyError(
                    "PIQD changed the run identity while polling"
                )
            previous = receipt["state"]
            if (
                receipt["started_at"] is not None
                and current["started_at"] != receipt["started_at"]
            ):
                raise PiqdSingularCustodyError("PIQD changed started_at while polling")
            if (previous, current["state"]) not in {
                ("queued", "queued"),
                ("queued", "running"),
                ("queued", "finished"),
                ("running", "running"),
                ("running", "finished"),
            }:
                raise PiqdSingularCustodyError("PIQD lifecycle moved backwards")
            receipt = current

        if receipt["run_status"] == "INTERRUPTED":
            raise PiqdSingularCustodyError(
                "Singular run was INTERRUPTED; execution custody is inconclusive"
            )
        script_back = self._fetch(
            f"/singular/runs/{run_id}/script", script_hash, MAX_SCRIPT_BYTES
        )
        if script_back != script:
            raise PiqdSingularCustodyError(
                "retrieved Singular script differs from submitted bytes"
            )
        stdout: bytes | None = None
        stderr: bytes | None = None
        if receipt["run_status"] != "DID_NOT_START":
            stdout = self._fetch(
                f"/singular/runs/{run_id}/stdout",
                receipt["stdout_blob_hash"],
                MAX_STREAM_BYTES,
            )
            stderr = self._fetch(
                f"/singular/runs/{run_id}/stderr",
                receipt["stderr_blob_hash"],
                MAX_STREAM_BYTES,
            )
            if (receipt["stdout_truncated"] and len(stdout) != MAX_STREAM_BYTES) or (
                receipt["stderr_truncated"] and len(stderr) != MAX_STREAM_BYTES
            ):
                raise PiqdSingularCustodyError(
                    "truncated stream does not fill PIQD's 16 MiB retained prefix"
                )
        return _publish(
            output,
            script,
            stdout,
            stderr,
            source,
            effective_source,
            context,
            context_hash,
            submit_request,
            replayed,
            receipt,
        )

    def _fetch(self, path: str, expected_hash: str, limit: int) -> bytes:
        status, data = self._request("GET", path, limit=limit)
        if status != 200 or _sha(data) != expected_hash:
            raise PiqdSingularCustodyError(
                f"{path} bytes do not match their receipt hash"
            )
        return data


def _open_directory_nofollow(path: Path) -> int:
    supplied = Path(path)
    if ".." in supplied.parts:
        raise OSError("parent traversal is not accepted")
    if supplied.is_absolute():
        fd = os.open("/", os.O_RDONLY | os.O_DIRECTORY)
        parts = supplied.parts[1:]
    else:
        fd = os.open(".", os.O_RDONLY | os.O_DIRECTORY)
        parts = supplied.parts
    try:
        for part in parts:
            if part in {"", "."}:
                continue
            next_fd = os.open(
                part,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=fd,
            )
            os.close(fd)
            fd = next_fd
        return fd
    except Exception:
        os.close(fd)
        raise


def _secure_new_directory(path: Path) -> int:
    if not path.name or path.name in {".", ".."}:
        raise PiqdSingularCustodyError("output_directory has no safe final component")
    parent = path.parent
    try:
        parent_fd = _open_directory_nofollow(parent)
    except OSError as exc:
        raise PiqdSingularCustodyError(
            "output parent is absent, unsafe, or a symlink"
        ) from exc
    try:
        os.mkdir(path.name, mode=0o700, dir_fd=parent_fd)
        root_fd = os.open(
            path.name, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW, dir_fd=parent_fd
        )
    except OSError as exc:
        raise PiqdSingularCustodyError(
            "output directory must not already exist"
        ) from exc
    finally:
        os.close(parent_fd)
    return root_fd


def _write_once(root_fd: int, name: str, data: bytes) -> None:
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW
    fd = os.open(name, flags, 0o400, dir_fd=root_fd)
    try:
        view = memoryview(data)
        while view:
            written = os.write(fd, view)
            if written <= 0:
                raise PiqdSingularCustodyError(f"short write for {name}")
            view = view[written:]
        os.fsync(fd)
        info = os.fstat(fd)
        if (
            not stat.S_ISREG(info.st_mode)
            or info.st_nlink != 1
            or info.st_size != len(data)
        ):
            raise PiqdSingularCustodyError(
                f"published {name} is not a private regular file"
            )
    finally:
        os.close(fd)


def _artifact_entry(name: str, data: bytes) -> dict[str, object]:
    return {"path": name, "bytes": len(data), "sha256": _sha(data)}


def _publish(
    output: Path,
    script: bytes,
    stdout: bytes | None,
    stderr: bytes | None,
    source: str,
    effective_source: str,
    context: dict[str, object],
    context_hash: str,
    request: dict[str, object],
    replayed: bool,
    receipt: dict[str, Any],
) -> SingularExecutionResult:
    receipt_bytes = _canonical(receipt) + b"\n"
    receipt_hash = _sha(receipt_bytes)
    artifacts: dict[str, object] = {
        "script": _artifact_entry("script.sing", script),
        "stdout": None if stdout is None else _artifact_entry("stdout.bin", stdout),
        "stderr": None if stderr is None else _artifact_entry("stderr.bin", stderr),
    }
    unsigned: dict[str, object] = {
        "schema": SCHEMA,
        "source": source,
        "effective_source": effective_source,
        "source_context": context,
        "source_context_sha256": context_hash,
        "request": request,
        "replayed": replayed,
        "receipt": receipt,
        "receipt_sha256": receipt_hash,
        "artifacts": artifacts,
        "claims": dict(CLAIMS),
    }
    artifact_hash = _sha(_canonical(unsigned))
    manifest = {**unsigned, "artifact_sha256": artifact_hash}
    root_fd = _secure_new_directory(output)
    try:
        _write_once(root_fd, "script.sing", script)
        if stdout is not None:
            _write_once(root_fd, "stdout.bin", stdout)
            _write_once(root_fd, "stderr.bin", stderr or b"")
        _write_once(root_fd, "receipt.json", receipt_bytes)
        _write_once(root_fd, "manifest.json", _canonical(manifest) + b"\n")
        os.fsync(root_fd)
        os.fchmod(root_fd, 0o500)
    finally:
        os.close(root_fd)
    return validate_artifact_directory(output)


def _read_nofollow(root_fd: int, name: str, limit: int) -> bytes:
    try:
        fd = os.open(name, os.O_RDONLY | os.O_NOFOLLOW, dir_fd=root_fd)
    except OSError as exc:
        raise PiqdSingularCustodyError(f"cannot safely open artifact {name}") from exc
    try:
        before = os.fstat(fd)
        if (
            not stat.S_ISREG(before.st_mode)
            or before.st_nlink != 1
            or before.st_size > limit
            or before.st_mode & 0o222
        ):
            raise PiqdSingularCustodyError(
                f"artifact {name} violates its custody bound"
            )
        data = b""
        while len(data) <= limit:
            chunk = os.read(fd, min(1024 * 1024, limit + 1 - len(data)))
            if not chunk:
                break
            data += chunk
        after = os.fstat(fd)
        stable_before = (
            before.st_dev,
            before.st_ino,
            before.st_mode,
            before.st_nlink,
            before.st_size,
            before.st_mtime_ns,
            before.st_ctime_ns,
        )
        stable_after = (
            after.st_dev,
            after.st_ino,
            after.st_mode,
            after.st_nlink,
            after.st_size,
            after.st_mtime_ns,
            after.st_ctime_ns,
        )
        if (
            len(data) > limit
            or stable_before != stable_after
            or len(data) != before.st_size
        ):
            raise PiqdSingularCustodyError(f"artifact {name} changed while read")
        return data
    finally:
        os.close(fd)


def validate_artifact_directory(path: Path) -> SingularExecutionResult:
    """Validate a standalone artifact without contacting PIQD."""

    root = _native_path(path, "artifact directory")
    try:
        root_fd = _open_directory_nofollow(root)
    except OSError as exc:
        raise PiqdSingularCustodyError(
            "artifact directory is absent or unsafe"
        ) from exc
    try:
        root_info = os.fstat(root_fd)
        if not stat.S_ISDIR(root_info.st_mode) or root_info.st_mode & 0o222:
            raise PiqdSingularCustodyError(
                "artifact directory is not an immutable directory"
            )
        names = set(os.listdir(root_fd))
        if not names <= {
            "script.sing",
            "stdout.bin",
            "stderr.bin",
            "receipt.json",
            "manifest.json",
        }:
            raise PiqdSingularCustodyError(
                "artifact directory contains untracked entries"
            )
        manifest_raw = _read_nofollow(
            root_fd, "manifest.json", MAX_CONTEXT_BYTES + MAX_HTTP_JSON_BYTES
        )
        manifest = _exact_keys(
            _json(manifest_raw, "manifest.json"), MANIFEST_KEYS, "manifest"
        )
        if manifest["schema"] != SCHEMA:
            raise PiqdSingularCustodyError("artifact has the wrong schema")
        if type(manifest["source_context"]) is not dict:
            raise PiqdSingularCustodyError("source_context is not an object")
        _builtin_json(manifest["source_context"], "source_context")
        if len(_canonical(manifest["source_context"])) > MAX_CONTEXT_BYTES:
            raise PiqdSingularCustodyError("source_context exceeds 1 MiB")
        context_hash = _hash(manifest["source_context_sha256"], "source_context_sha256")
        if context_hash != _sha(_canonical(manifest["source_context"])):
            raise PiqdSingularCustodyError("source_context_sha256 does not recompute")
        source = _string(manifest["source"], "source", nonempty=True)
        if len(source.encode("utf-8")) > 400 or "\x00" in source:
            raise PiqdSingularCustodyError("source violates its custody bound")
        effective = _string(
            manifest["effective_source"], "effective_source", nonempty=True
        )
        if len(effective.encode("utf-8")) > 512 or "\x00" in effective:
            raise PiqdSingularCustodyError(
                "effective_source violates PIQD's custody bound"
            )
        if effective != f"{source}#source_context_sha256={context_hash}":
            raise PiqdSingularCustodyError(
                "effective_source does not bind source_context"
            )
        request = _exact_keys(manifest["request"], REQUEST_KEYS, "request")
        if request["source"] != effective or request["profile"] != PROFILE:
            raise PiqdSingularCustodyError(
                "request does not bind maintained source/profile"
            )
        for key in ("project", "request_id"):
            value = _string(request[key], f"request.{key}", nonempty=True)
            if len(value.encode("utf-8")) > 200 or "\x00" in value:
                raise PiqdSingularCustodyError(
                    f"request.{key} violates its custody bound"
                )
        replayed = _boolean(manifest["replayed"], "replayed")
        receipt = _validate_receipt(manifest["receipt"], request)
        if receipt["state"] != "finished":
            raise PiqdSingularCustodyError("published receipt is not finished")
        if receipt["run_status"] == "INTERRUPTED":
            raise PiqdSingularCustodyError(
                "INTERRUPTED artifact is custody-inconclusive"
            )
        receipt_raw = _read_nofollow(root_fd, "receipt.json", MAX_HTTP_JSON_BYTES)
        receipt_hash = _hash(manifest["receipt_sha256"], "receipt_sha256")
        if (
            receipt_raw != _canonical(receipt) + b"\n"
            or _sha(receipt_raw) != receipt_hash
        ):
            raise PiqdSingularCustodyError("receipt.json does not match the manifest")
        artifacts = _exact_keys(manifest["artifacts"], ARTIFACT_KEYS, "artifacts")

        def read_entry(
            kind: str, expected_name: str, limit: int
        ) -> tuple[Path | None, bytes | None, str | None]:
            entry = artifacts[kind]
            if entry is None:
                if expected_name in names:
                    raise PiqdSingularCustodyError(f"untracked {expected_name} exists")
                return None, None, None
            item = _exact_keys(entry, ARTIFACT_ENTRY_KEYS, f"artifacts.{kind}")
            if item["path"] != expected_name:
                raise PiqdSingularCustodyError(f"artifacts.{kind} has unsafe path")
            size = _integer(item["bytes"], f"artifacts.{kind}.bytes", minimum=0)
            digest = _hash(item["sha256"], f"artifacts.{kind}.sha256")
            data = _read_nofollow(root_fd, expected_name, limit)
            if len(data) != size or _sha(data) != digest:
                raise PiqdSingularCustodyError(
                    f"artifact {expected_name} does not match manifest"
                )
            return root / expected_name, data, digest

        script_path, script, script_hash = read_entry(
            "script", "script.sing", MAX_SCRIPT_BYTES
        )
        stdout_path, stdout, stdout_hash = read_entry(
            "stdout", "stdout.bin", MAX_STREAM_BYTES
        )
        stderr_path, stderr, stderr_hash = read_entry(
            "stderr", "stderr.bin", MAX_STREAM_BYTES
        )
        if not script or script_hash != request["script_blob_hash"]:
            raise PiqdSingularCustodyError("script artifact does not bind request")
        if receipt["run_status"] == "DID_NOT_START":
            if stdout is not None or stderr is not None:
                raise PiqdSingularCustodyError("DID_NOT_START artifact has streams")
        elif (
            stdout_hash != receipt["stdout_blob_hash"]
            or stderr_hash != receipt["stderr_blob_hash"]
        ):
            raise PiqdSingularCustodyError("stream artifacts do not bind receipt")
        elif (receipt["stdout_truncated"] and len(stdout) != MAX_STREAM_BYTES) or (
            receipt["stderr_truncated"] and len(stderr) != MAX_STREAM_BYTES
        ):
            raise PiqdSingularCustodyError(
                "truncated stream does not fill PIQD's 16 MiB retained prefix"
            )
        if manifest["claims"] != CLAIMS:
            raise PiqdSingularCustodyError("artifact claims drifted")
        artifact_hash = _hash(manifest["artifact_sha256"], "artifact_sha256")
        unsigned = dict(manifest)
        del unsigned["artifact_sha256"]
        if artifact_hash != _sha(_canonical(unsigned)):
            raise PiqdSingularCustodyError("artifact_sha256 does not recompute")
        if manifest_raw != _canonical(manifest) + b"\n":
            raise PiqdSingularCustodyError("manifest.json is not canonical")
        expected_names = {"script.sing", "receipt.json", "manifest.json"}
        if stdout is not None:
            expected_names |= {"stdout.bin", "stderr.bin"}
        if names != expected_names:
            raise PiqdSingularCustodyError("artifact directory file set is incomplete")
        final_root_info = os.fstat(root_fd)
        initial_root_state = (
            root_info.st_dev,
            root_info.st_ino,
            root_info.st_mode,
            root_info.st_nlink,
            root_info.st_mtime_ns,
            root_info.st_ctime_ns,
        )
        final_root_state = (
            final_root_info.st_dev,
            final_root_info.st_ino,
            final_root_info.st_mode,
            final_root_info.st_nlink,
            final_root_info.st_mtime_ns,
            final_root_info.st_ctime_ns,
        )
        if final_root_state != initial_root_state or set(os.listdir(root_fd)) != names:
            raise PiqdSingularCustodyError(
                "artifact directory changed while validating"
            )
        return SingularExecutionResult(
            run_id=receipt["id"],
            run_status=receipt["run_status"],
            exit_code=receipt["exit_code"],
            stdout=stdout,
            stderr=stderr,
            script_path=script_path,
            stdout_path=stdout_path,
            stderr_path=stderr_path,
            receipt_path=root / "receipt.json",
            manifest_path=root / "manifest.json",
            request_sha256=receipt["request_sha256"],
            result_sha256=receipt["result_sha256"],
            script_sha256=script_hash,
            stdout_sha256=stdout_hash,
            stderr_sha256=stderr_hash,
            source_context_sha256=context_hash,
            receipt_sha256=receipt_hash,
            artifact_sha256=artifact_hash,
            replayed=replayed,
        )
    finally:
        os.close(root_fd)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", type=Path, required=True)
    args = parser.parse_args(argv)
    result = validate_artifact_directory(args.check)
    print(
        json.dumps(
            {
                "artifact_sha256": result.artifact_sha256,
                "run_id": result.run_id,
                "run_status": result.run_status,
                "mathematical_verdict": None,
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
