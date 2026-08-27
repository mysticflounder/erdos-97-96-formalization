"""Fail-closed planning and execution for the cap-configuration census.

The public CLI intentionally has no ambient authority.  ``plan`` is entirely
offline.  ``run`` requires the retained wave authorization plus a registered
resource/daemon attestor; tests inject that boundary together with a fake PIQD
adapter.  Every retained record is create-once and every execution attempt is
an append-only hash chain.
"""

from __future__ import annotations

import argparse
import ctypes
import errno
import fcntl
import json
import os
import re
import stat
import subprocess
import sys
import uuid
from collections import Counter
from collections.abc import Iterator, Mapping, Sequence
from contextlib import contextmanager
from dataclasses import dataclass
from datetime import UTC, datetime
from pathlib import Path, PurePosixPath
from typing import Any, NoReturn, Protocol

from .replay import replay_piqd_sat_values
from .schema import (
    canonical_json_bytes,
    parse_stored_json_bytes,
    raw_sha256,
    stored_json_bytes,
    structured_hash,
)
from .universe import (
    CapConfigurationUniverseError,
    safe_relative_path,
    validate_manifest,
    validate_universe,
)

AUTHORIZATION_SCHEMA = "cap-configuration-wave-authorization/v1"
AUTHORIZATION_CONSUMPTION_SCHEMA = "cap-configuration-wave-authorization-consumption/v1"
PLAN_SCHEMA = "cap-configuration-campaign-plan/v1"
RESOURCE_ATTESTATION_SCHEMA = "cap-configuration-resource-attestation/v1"
ATTEMPT_ADMISSION_SCHEMA = "cap-configuration-attempt-admission/v1"
ATTEMPT_STAGE_SCHEMA = "cap-configuration-attempt-stage/v1"
ATTEMPT_OUTCOME_SCHEMA = "cap-configuration-attempt-outcome/v1"
CELL_RESULT_SCHEMA = "cap-configuration-cell-result/v1"
COVERAGE_SCHEMA = "cap-configuration-coverage/v1"
FINAL_RECAPTURE_SCHEMA = "cap-configuration-final-recapture/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
PIQD_ADAPTER_RESULT_SCHEMA = "cap-configuration-piqd-adapter-result/v1"

_FIXTURE_ADAPTER_RESULT_KEYS = frozenset(
    {
        "cap_semantic_replay",
        "cap_values_artifact",
        "cap_values_json_field",
        "cap_values_raw_sha256",
        "classification",
        "schema",
    }
)

RUN_KINDS = frozenset(
    {"fixture_canary", "target_preflight", "pilot", "campaign", "resume"}
)
CLASSIFICATIONS = frozenset(
    {
        "SAT_SEMANTICALLY_REPLAYED",
        "UNSAT_DISCOVERY_ONLY",
        "INCONCLUSIVE_UNKNOWN",
        "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED",
        "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE",
        "INCONCLUSIVE_TRANSPORT_LOSS",
        "INCONCLUSIVE_CROSS_SOLVER_DISAGREEMENT",
    }
)
DECISIVE_CLASSIFICATIONS = frozenset(
    {"SAT_SEMANTICALLY_REPLAYED", "UNSAT_DISCOVERY_ONLY"}
)
FALSE_CLAIMS = {
    "lean_closure": False,
    "source_entitlement": False,
    "theorem_coverage": False,
    "universal_lift": False,
}
OUTPUT_CLASSES = ["artifacts", "events", "tmp"]

MAX_INPUT_BYTES = 32 * 1024 * 1024
MAX_RECORD_BYTES = 64 * 1024 * 1024
_ID = re.compile(r"^[A-Za-z0-9][A-Za-z0-9._-]{0,127}$")
_LANE = re.compile(r"^[a-z0-9][a-z0-9-]{0,127}$")
_HEX40 = re.compile(r"^[0-9a-f]{40}$")
_HEX64 = re.compile(r"^[0-9a-f]{64}$")


class CapConfigurationCampaignError(RuntimeError):
    """One fail-closed campaign gate failed."""

    def __init__(self, code: str, message: str):
        super().__init__(f"{code}: {message}")
        self.code = code


class _MissingFinalDirectory(CapConfigurationCampaignError):
    """The requested final directory member does not exist."""

    def __init__(self, relative: str):
        super().__init__("ABSENT_OPTIONAL_DIRECTORY", f"missing directory: {relative}")


class _MissingFinalMember(CapConfigurationCampaignError):
    """The requested final regular-file member does not exist."""

    def __init__(self, relative: str):
        super().__init__("ABSENT_OPTIONAL_MEMBER", f"missing member: {relative}")


def _optional_directory_present(root_fd: int, relative: str) -> bool:
    try:
        descriptor = _open_directory_at(root_fd, relative)
    except _MissingFinalDirectory:
        return False
    os.close(descriptor)
    return True


def _fail(code: str, message: str) -> NoReturn:
    raise CapConfigurationCampaignError(code, message)


class _ArtifactExists(RuntimeError):
    """Internal signal used to implement exact-existing idempotence."""


class _InjectedCrash(RuntimeError):
    """Test-only process-boundary interruption."""


def _now_utc() -> str:
    return datetime.now(UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")


def _parse_utc(value: object, path: str) -> datetime:
    if type(value) is not str or not value.endswith("Z"):
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", f"{path} must be UTC with a Z suffix")
    try:
        parsed = datetime.fromisoformat(value)
    except ValueError as exc:
        raise CapConfigurationCampaignError(
            "BLOCKED_CUSTODY_OR_IDENTITY", f"{path} is not a UTC timestamp"
        ) from exc
    if parsed.tzinfo != UTC:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", f"{path} is not UTC")
    return parsed


def _object(value: object, keys: set[str], path: str) -> dict[str, Any]:
    if type(value) is not dict or set(value) != keys:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", f"{path} has an inexact schema")
    return value


def _text(value: object, path: str) -> str:
    if type(value) is not str or not value:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", f"{path} must be a nonempty string")
    return value


def _identifier(value: object, path: str, *, lane: bool = False) -> str:
    text = _text(value, path)
    expression = _LANE if lane else _ID
    if expression.fullmatch(text) is None or not text.isascii():
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", f"{path} is not a safe ASCII identifier")
    return text


def _digest(value: object, path: str, *, revision: bool = False) -> str:
    text = _text(value, path)
    expression = _HEX40 if revision else _HEX64
    if expression.fullmatch(text) is None:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", f"{path} has an invalid digest")
    return text


def _exact_int(value: object, path: str, *, minimum: int = 0) -> int:
    if type(value) is not int or value < minimum:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", f"{path} must be an integer >= {minimum}")
    return value


def _strict_json_bytes(payload: bytes, path: str) -> dict[str, Any]:
    def pairs(items: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in items:
            if key in result:
                _fail("BLOCKED_CUSTODY_OR_IDENTITY", f"{path} has duplicate JSON keys")
            result[key] = value
        return result

    try:
        value = json.loads(
            payload.decode("utf-8"),
            object_pairs_hook=pairs,
            parse_float=lambda token: _fail(
                "BLOCKED_CUSTODY_OR_IDENTITY", f"{path} contains float {token}"
            ),
            parse_constant=lambda token: _fail(
                "BLOCKED_CUSTODY_OR_IDENTITY", f"{path} contains {token}"
            ),
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise CapConfigurationCampaignError(
            "BLOCKED_CUSTODY_OR_IDENTITY", f"{path} is not strict UTF-8 JSON"
        ) from exc
    if type(value) is not dict:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", f"{path} must be a JSON object")
    return value


def _repo_relative(value: str | os.PathLike[str], path: str) -> str:
    spelling = os.fspath(value)
    try:
        return safe_relative_path(spelling, path)
    except CapConfigurationUniverseError as exc:
        raise CapConfigurationCampaignError(
            "BLOCKED_CUSTODY_OR_IDENTITY", str(exc)
        ) from exc


def _run_identity(run_root: str | os.PathLike[str]) -> tuple[str, str, str]:
    relative = _repo_relative(run_root, "run_root")
    parts = PurePosixPath(relative).parts
    if len(parts) != 4 or parts[:2] != ("scratch", "runs"):
        _fail(
            "BLOCKED_CUSTODY_OR_IDENTITY",
            "run_root must be scratch/runs/<lane-id>/<run-id>",
        )
    lane_id = _identifier(parts[2], "run_root lane", lane=True)
    run_id = _identifier(parts[3], "run_root run_id")
    return relative, lane_id, run_id


def _directory_flags() -> int:
    nofollow = getattr(os, "O_NOFOLLOW", 0)
    directory = getattr(os, "O_DIRECTORY", 0)
    if nofollow == 0 or directory == 0:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", "platform lacks no-follow directory opens")
    return os.O_RDONLY | nofollow | directory | getattr(os, "O_CLOEXEC", 0)


def _file_flags(*, write: bool = False) -> int:
    nofollow = getattr(os, "O_NOFOLLOW", 0)
    nonblock = getattr(os, "O_NONBLOCK", 0)
    if nofollow == 0 or nonblock == 0:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", "platform lacks no-follow file opens")
    base = os.O_WRONLY if write else os.O_RDONLY
    return base | nofollow | nonblock | getattr(os, "O_CLOEXEC", 0)


def _open_repo(repo_root: Path) -> int:
    try:
        descriptor = os.open(repo_root, _directory_flags())
    except OSError as exc:
        raise CapConfigurationCampaignError(
            "BLOCKED_CUSTODY_OR_IDENTITY", "cannot open repository root"
        ) from exc
    return descriptor


def _open_directory_at(root_fd: int, relative: str) -> int:
    current = os.dup(root_fd)
    try:
        parts = PurePosixPath(relative).parts
        for index, component in enumerate(parts):
            try:
                named_before = os.stat(component, dir_fd=current, follow_symlinks=False)
            except OSError as exc:
                if exc.errno == errno.ENOENT and index == len(parts) - 1:
                    raise _MissingFinalDirectory(relative) from exc
                raise CapConfigurationCampaignError(
                    "BLOCKED_CUSTODY_OR_IDENTITY",
                    f"cannot safely open directory: {relative}",
                ) from exc
            if not stat.S_ISDIR(named_before.st_mode):
                raise CapConfigurationCampaignError(
                    "BLOCKED_CUSTODY_OR_IDENTITY",
                    f"cannot safely open directory: {relative}",
                )
            child = -1
            adopted = False
            try:
                child = os.open(component, _directory_flags(), dir_fd=current)
                opened = os.fstat(child)
                named_after = os.stat(component, dir_fd=current, follow_symlinks=False)
                if (
                    not stat.S_ISDIR(opened.st_mode)
                    or (named_before.st_dev, named_before.st_ino)
                    != (opened.st_dev, opened.st_ino)
                    or (named_after.st_dev, named_after.st_ino)
                    != (opened.st_dev, opened.st_ino)
                ):
                    raise CapConfigurationCampaignError(
                        "BLOCKED_CUSTODY_OR_IDENTITY",
                        f"directory identity changed: {relative}",
                    )
                adopted = True
            except OSError as exc:
                raise CapConfigurationCampaignError(
                    "BLOCKED_CUSTODY_OR_IDENTITY",
                    f"cannot safely open directory: {relative}",
                ) from exc
            finally:
                if child >= 0 and not adopted:
                    os.close(child)
            os.close(current)
            current = child
        return current
    except CapConfigurationCampaignError:
        os.close(current)
        raise


def _mkdirs_at(root_fd: int, relative: str) -> int:
    current = os.dup(root_fd)
    try:
        for component in PurePosixPath(relative).parts:
            try:
                child = os.open(component, _directory_flags(), dir_fd=current)
            except FileNotFoundError:
                os.mkdir(component, 0o700, dir_fd=current)
                os.fsync(current)
                child = os.open(component, _directory_flags(), dir_fd=current)
            os.close(current)
            current = child
        return current
    except OSError as exc:
        os.close(current)
        raise CapConfigurationCampaignError(
            "BLOCKED_CUSTODY_OR_IDENTITY", f"cannot create safe directory: {relative}"
        ) from exc


@dataclass(frozen=True, slots=True)
class HeldBytes:
    path: str
    payload: bytes
    raw_sha256: str


def _read_regular_at(
    root_fd: int,
    relative: str,
    *,
    maximum_bytes: int = MAX_INPUT_BYTES,
) -> HeldBytes:
    relative = _repo_relative(relative, "input path")
    parts = PurePosixPath(relative).parts
    parent_relative = "/".join(parts[:-1])
    try:
        parent = (
            os.dup(root_fd)
            if not parent_relative
            else _open_directory_at(root_fd, parent_relative)
        )
    except _MissingFinalDirectory as exc:
        raise CapConfigurationCampaignError(
            "BLOCKED_CUSTODY_OR_IDENTITY",
            f"missing parent directory for input: {relative}",
        ) from exc
    descriptor = -1
    name_observed = False
    try:
        named_before = os.stat(parts[-1], dir_fd=parent, follow_symlinks=False)
        name_observed = True
        descriptor = os.open(parts[-1], _file_flags(), dir_fd=parent)
        before = os.fstat(descriptor)
        if (
            not stat.S_ISREG(before.st_mode)
            or before.st_nlink != 1
            or (named_before.st_dev, named_before.st_ino)
            != (before.st_dev, before.st_ino)
        ):
            _fail(
                "BLOCKED_CUSTODY_OR_IDENTITY",
                f"input is not one unique regular file: {relative}",
            )
        chunks: list[bytes] = []
        byte_count = 0
        while True:
            chunk = os.read(descriptor, min(1 << 20, maximum_bytes + 1 - byte_count))
            if not chunk:
                break
            chunks.append(chunk)
            byte_count += len(chunk)
            if byte_count > maximum_bytes:
                _fail(
                    "BLOCKED_CUSTODY_OR_IDENTITY", f"input exceeds byte cap: {relative}"
                )
        after = os.fstat(descriptor)
        named_after = os.stat(parts[-1], dir_fd=parent, follow_symlinks=False)
        identity_before = (
            before.st_dev,
            before.st_ino,
            before.st_size,
            before.st_mtime_ns,
            before.st_nlink,
        )
        identity_after = (
            after.st_dev,
            after.st_ino,
            after.st_size,
            after.st_mtime_ns,
            after.st_nlink,
        )
        if (
            identity_before != identity_after
            or (
                named_after.st_dev,
                named_after.st_ino,
                named_after.st_size,
                named_after.st_mtime_ns,
                named_after.st_nlink,
            )
            != identity_after
        ):
            _fail(
                "BLOCKED_CUSTODY_OR_IDENTITY", f"input changed while read: {relative}"
            )
        payload = b"".join(chunks)
        return HeldBytes(relative, payload, raw_sha256(payload))
    except FileNotFoundError as exc:
        if not name_observed:
            raise _MissingFinalMember(relative) from exc
        raise CapConfigurationCampaignError(
            "BLOCKED_CUSTODY_OR_IDENTITY",
            f"input disappeared while reading: {relative}",
        ) from exc
    except OSError as exc:
        raise CapConfigurationCampaignError(
            "BLOCKED_CUSTODY_OR_IDENTITY", f"cannot safely read input: {relative}"
        ) from exc
    finally:
        if descriptor >= 0:
            os.close(descriptor)
        os.close(parent)


def _write_all(descriptor: int, payload: bytes) -> None:
    view = memoryview(payload)
    while view:
        written = os.write(descriptor, view)
        if written <= 0:
            _fail("BLOCKED_CUSTODY_OR_IDENTITY", "short artifact write")
        view = view[written:]


def _write_create_once(root_fd: int, relative: str, payload: bytes) -> None:
    """Atomically publish exact bytes without ever exposing a partial final file."""

    relative = _repo_relative(relative, "artifact path")
    parts = PurePosixPath(relative).parts
    parent_relative = "/".join(parts[:-1])
    parent = (
        os.dup(root_fd) if not parent_relative else _mkdirs_at(root_fd, parent_relative)
    )
    temporary = f".{parts[-1]}.staging-{uuid.uuid4()}"
    descriptor = -1
    temporary_identity: tuple[int, int] | None = None
    try:
        descriptor = os.open(
            temporary,
            _file_flags(write=True) | os.O_CREAT | os.O_EXCL,
            0o600,
            dir_fd=parent,
        )
        opened = os.fstat(descriptor)
        if not stat.S_ISREG(opened.st_mode) or opened.st_nlink != 1:
            _fail("BLOCKED_CUSTODY_OR_IDENTITY", f"unsafe artifact target: {relative}")
        temporary_identity = (opened.st_dev, opened.st_ino)
        _write_all(descriptor, payload)
        os.fsync(descriptor)
        os.close(descriptor)
        descriptor = -1
        _rename_directory_noreplace(parent, temporary, parts[-1])
        temporary_identity = None
        named = os.stat(parts[-1], dir_fd=parent, follow_symlinks=False)
        if not stat.S_ISREG(named.st_mode) or named.st_nlink != 1:
            _fail("BLOCKED_CUSTODY_OR_IDENTITY", f"artifact changed: {relative}")
        os.fsync(parent)
    except CapConfigurationCampaignError as exc:
        if "run root already exists" in str(exc):
            raise _ArtifactExists(relative) from exc
        raise
    finally:
        if descriptor >= 0:
            os.close(descriptor)
        if temporary_identity is not None:
            try:
                current = os.stat(temporary, dir_fd=parent, follow_symlinks=False)
                if (current.st_dev, current.st_ino) == temporary_identity:
                    os.unlink(temporary, dir_fd=parent)
                    os.fsync(parent)
            except FileNotFoundError:
                pass
        os.close(parent)


def _publish_exact(root_fd: int, relative: str, payload: bytes) -> None:
    try:
        _write_create_once(root_fd, relative, payload)
    except _ArtifactExists:
        observed = _read_regular_at(
            root_fd, relative, maximum_bytes=max(len(payload), 1)
        )
        if observed.payload != payload:
            _fail(
                "BLOCKED_CUSTODY_OR_IDENTITY",
                f"divergent immutable artifact: {relative}",
            )


def _write_json(root_fd: int, relative: str, value: Mapping[str, Any]) -> None:
    _publish_exact(root_fd, relative, stored_json_bytes(dict(value)))


def _read_cap_json(root_fd: int, relative: str) -> tuple[dict[str, Any], HeldBytes]:
    held = _read_regular_at(root_fd, relative, maximum_bytes=MAX_RECORD_BYTES)
    try:
        value = parse_stored_json_bytes(held.payload)
    except Exception as exc:  # schema layer supplies precise subtype
        raise CapConfigurationCampaignError(
            "BLOCKED_CUSTODY_OR_IDENTITY", f"noncanonical retained JSON: {relative}"
        ) from exc
    if type(value) is not dict:
        _fail(
            "BLOCKED_CUSTODY_OR_IDENTITY", f"retained JSON is not an object: {relative}"
        )
    return value, held


def _rename_directory_noreplace(parent_fd: int, source: str, target: str) -> None:
    libc = ctypes.CDLL(None, use_errno=True)
    if sys.platform == "darwin" and hasattr(libc, "renameatx_np"):
        function = libc.renameatx_np
        function.argtypes = [
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_uint,
        ]
        function.restype = ctypes.c_int
        result = function(
            parent_fd, os.fsencode(source), parent_fd, os.fsencode(target), 0x4
        )
    elif sys.platform.startswith("linux") and hasattr(libc, "renameat2"):
        function = libc.renameat2
        function.argtypes = [
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_uint,
        ]
        function.restype = ctypes.c_int
        result = function(
            parent_fd, os.fsencode(source), parent_fd, os.fsencode(target), 0x1
        )
    else:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", "platform lacks atomic no-replace rename")
    if result != 0:
        number = ctypes.get_errno()
        if number in {errno.EEXIST, errno.ENOTEMPTY}:
            _fail("BLOCKED_CUSTODY_OR_IDENTITY", "run root already exists")
        _fail(
            "BLOCKED_CUSTODY_OR_IDENTITY",
            f"cannot publish run root: {os.strerror(number)}",
        )


def _hash_record(domain: str, value: Mapping[str, Any], field: str) -> dict[str, Any]:
    body = {key: item for key, item in value.items() if key != field}
    return {**body, field: structured_hash(domain, body)}


def _verify_record_hash(
    value: Mapping[str, Any], domain: str, field: str, path: str
) -> str:
    digest = _digest(value.get(field), f"{path}.{field}")
    body = {key: item for key, item in value.items() if key != field}
    if structured_hash(domain, body) != digest:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", f"{path} self-hash mismatch")
    return digest


def _git_head(repo_root: Path) -> str:
    completed = subprocess.run(
        ["git", "rev-parse", "HEAD"],
        cwd=repo_root,
        check=False,
        capture_output=True,
        text=True,
    )
    if completed.returncode != 0:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", "cannot observe repository HEAD")
    return _digest(completed.stdout.strip(), "repository HEAD", revision=True)


def _checkpoint_self_hash(value: Mapping[str, Any]) -> str:
    body = {key: item for key, item in value.items() if key != "manifest_sha256"}
    return raw_sha256(canonical_json_bytes(body))


def _validate_checkpoint(
    repo_fd: int,
    lane_id: str,
    run_root: str,
    *,
    observed_head: str,
) -> tuple[dict[str, Any], HeldBytes, str]:
    path = f".codex/worktree-checkpoints/{lane_id}.json"
    held = _read_regular_at(repo_fd, path)
    value = _object(
        _strict_json_bytes(held.payload, path),
        {
            "schema",
            "lane_id",
            "owner",
            "base_head",
            "owned_paths",
            "generated_roots",
            "durable_paths",
            "created_utc",
            "manifest_sha256",
        },
        "lane checkpoint",
    )
    if value["schema"] != "worktree-lane-checkpoint/v1":
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", "lane checkpoint schema mismatch")
    if _identifier(value["lane_id"], "checkpoint.lane_id", lane=True) != lane_id:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", "lane checkpoint identity mismatch")
    _identifier(value["owner"], "checkpoint.owner")
    _digest(value["base_head"], "checkpoint.base_head", revision=True)
    _parse_utc(value["created_utc"], "checkpoint.created_utc")
    expected_hash = _digest(value["manifest_sha256"], "checkpoint.manifest_sha256")
    if _checkpoint_self_hash(value) != expected_hash:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", "lane checkpoint self-hash mismatch")
    generated = value["generated_roots"]
    if type(generated) is not list or run_root not in generated:
        _fail(
            "BLOCKED_CUSTODY_OR_IDENTITY", "lane checkpoint does not declare run root"
        )
    if len(generated) != len(set(generated)):
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", "lane checkpoint repeats a generated root")
    if _digest(observed_head, "observed_head", revision=True) == "0" * 40:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", "zero repository HEAD is forbidden")
    return value, held, path


def build_wave_authorization(
    *,
    manifest: Mapping[str, Any],
    run_root: str,
    run_kind: str,
    active_plan: Mapping[str, str],
    authorizing_checkpoint: Mapping[str, str],
    piqd: Mapping[str, str],
    resource_envelope: Mapping[str, Any],
    issued_utc: str,
    expires_utc: str,
    issuer: str,
    parent: Mapping[str, Any] | None = None,
) -> dict[str, Any]:
    """Build the strict immutable v1 authorization used by fixtures/tests."""

    validated = validate_manifest(manifest)
    identity: dict[str, Any] = {
        "active_plan": dict(active_plan),
        "allowed_cell_ids": list(validated.cell_ids),
        "authorizing_checkpoint": dict(authorizing_checkpoint),
        "campaign_id": validated.campaign_id,
        "expires_utc": expires_utc,
        "issued_utc": issued_utc,
        "issuer": issuer,
        "manifest_sha256": validated.manifest_sha256,
        "max_children": 1,
        "parent": None if parent is None else dict(parent),
        "piqd": dict(piqd),
        "resource_envelope": dict(resource_envelope),
        "revoked": False,
        "run_kind": run_kind,
        "run_root": run_root,
    }
    body = {"identity": identity, "schema": AUTHORIZATION_SCHEMA}
    return {
        **body,
        "authorization_sha256": structured_hash(AUTHORIZATION_SCHEMA, body),
    }


_AUTH_IDENTITY_KEYS = {
    "active_plan",
    "allowed_cell_ids",
    "authorizing_checkpoint",
    "campaign_id",
    "expires_utc",
    "issued_utc",
    "issuer",
    "manifest_sha256",
    "max_children",
    "parent",
    "piqd",
    "resource_envelope",
    "revoked",
    "run_kind",
    "run_root",
}


def validate_wave_authorization(
    value: object,
    *,
    manifest: Mapping[str, Any],
    run_root: str,
    now_utc: str,
) -> dict[str, Any]:
    authorization = _object(
        value,
        {"authorization_sha256", "identity", "schema"},
        "authorization",
    )
    if authorization["schema"] != AUTHORIZATION_SCHEMA:
        _fail("BLOCKED_AUTHORIZATION", "authorization schema mismatch")
    identity = _object(
        authorization["identity"], _AUTH_IDENTITY_KEYS, "authorization.identity"
    )
    if identity["parent"] is not None:
        _fail(
            "BLOCKED_AUTHORIZATION",
            "v1 fixture authorization cannot carry a parent record",
        )
    validated = validate_manifest(manifest)
    if identity["campaign_id"] != validated.campaign_id:
        _fail("BLOCKED_AUTHORIZATION", "authorization campaign mismatch")
    if identity["manifest_sha256"] != validated.manifest_sha256:
        _fail("BLOCKED_AUTHORIZATION", "authorization manifest mismatch")
    if identity["run_root"] != run_root:
        _fail("BLOCKED_AUTHORIZATION", "authorization run-root mismatch")
    if identity["run_kind"] not in RUN_KINDS:
        _fail("BLOCKED_AUTHORIZATION", "unsupported run kind")
    if identity["allowed_cell_ids"] != list(validated.cell_ids):
        _fail("BLOCKED_AUTHORIZATION", "authorization cell universe mismatch")
    if identity["max_children"] != 1 or type(identity["revoked"]) is not bool:
        _fail("BLOCKED_AUTHORIZATION", "authorization is not single-use")
    if identity["revoked"]:
        _fail("BLOCKED_AUTHORIZATION", "authorization is revoked")
    issued = _parse_utc(identity["issued_utc"], "authorization.issued_utc")
    expires = _parse_utc(identity["expires_utc"], "authorization.expires_utc")
    now = _parse_utc(now_utc, "now_utc")
    if not issued <= now < expires:
        _fail("BLOCKED_AUTHORIZATION", "authorization is not active")
    _identifier(identity["issuer"], "authorization.issuer")
    active = _object(
        identity["active_plan"], {"path", "raw_sha256"}, "authorization.active_plan"
    )
    checkpoint = _object(
        identity["authorizing_checkpoint"],
        {"base_head", "path", "raw_sha256"},
        "authorization.authorizing_checkpoint",
    )
    _repo_relative(active["path"], "authorization.active_plan.path")
    _digest(active["raw_sha256"], "authorization.active_plan.raw_sha256")
    _repo_relative(checkpoint["path"], "authorization.authorizing_checkpoint.path")
    _digest(
        checkpoint["base_head"],
        "authorization.authorizing_checkpoint.base_head",
        revision=True,
    )
    _digest(checkpoint["raw_sha256"], "authorization.authorizing_checkpoint.raw_sha256")
    piqd = _object(
        identity["piqd"],
        {"daemon_identity", "profile", "profile_identity", "solver", "solver_identity"},
        "authorization.piqd",
    )
    for key in piqd:
        _text(piqd[key], f"authorization.piqd.{key}")
    manifest_solver = manifest["identity"]["solver"]
    if (
        piqd["solver"] != manifest_solver["backend"]
        or piqd["solver_identity"] != manifest_solver["identity"]
        or piqd["profile"] != manifest_solver["profile"]
    ):
        _fail(
            "BLOCKED_AUTHORIZATION",
            "authorization solver identity differs from manifest",
        )
    resources = _object(
        identity["resource_envelope"],
        {
            "cpu_seconds",
            "disk_bytes",
            "max_processes",
            "memory_bytes",
            "supervisor_config_path",
            "supervisor_config_raw_sha256",
            "supervisor_identity",
            "supervisor_qualified",
            "telemetry_identity",
            "telemetry_policy_path",
            "telemetry_policy_raw_sha256",
            "tier",
            "wall_seconds",
        },
        "authorization.resource_envelope",
    )
    for key in ("cpu_seconds", "disk_bytes", "memory_bytes", "wall_seconds"):
        _exact_int(resources[key], f"authorization.resource_envelope.{key}")
    _exact_int(
        resources["max_processes"],
        "authorization.resource_envelope.max_processes",
        minimum=1,
    )
    if type(resources["supervisor_qualified"]) is not bool:
        _fail("BLOCKED_RESOURCE_BOUNDARY", "supervisor_qualified must be boolean")
    for key in ("supervisor_config_path", "telemetry_policy_path"):
        _repo_relative(resources[key], f"authorization.resource_envelope.{key}")
    for key in ("supervisor_config_raw_sha256", "telemetry_policy_raw_sha256"):
        _digest(resources[key], f"authorization.resource_envelope.{key}")
    for key in ("supervisor_identity", "telemetry_identity", "tier"):
        _text(resources[key], f"authorization.resource_envelope.{key}")
    manifest_limits = manifest["identity"]["resource_limits"]
    if (
        resources["memory_bytes"] != manifest_limits["memory_bytes"]
        or resources["wall_seconds"] != manifest_limits["wall_seconds"]
    ):
        _fail(
            "BLOCKED_RESOURCE_BOUNDARY",
            "authorization resource limits differ from manifest",
        )
    if identity["run_kind"] in {"fixture_canary", "target_preflight"}:
        if resources["max_processes"] != 1:
            _fail("BLOCKED_RESOURCE_BOUNDARY", "preflight requires exactly one process")
    elif not resources["supervisor_qualified"]:
        _fail("BLOCKED_RESOURCE_BOUNDARY", "run kind requires a qualified supervisor")
    _verify_record_hash(
        authorization, AUTHORIZATION_SCHEMA, "authorization_sha256", "authorization"
    )
    return authorization


def _bundle_path(manifest_path: str, child_path: str) -> str:
    child = _repo_relative(child_path, "manifest artifact path")
    parent = PurePosixPath(manifest_path).parent
    combined = parent / PurePosixPath(child)
    return _repo_relative(combined.as_posix(), "manifest artifact path")


def _read_and_validate_bundle(
    repo_fd: int, manifest_path: str
) -> tuple[dict[str, Any], dict[str, HeldBytes], Any]:
    manifest_held = _read_regular_at(repo_fd, manifest_path)
    try:
        manifest = parse_stored_json_bytes(manifest_held.payload)
    except Exception as exc:
        raise CapConfigurationCampaignError(
            "BLOCKED_ENCODING_OR_REPLAY", "manifest is not canonical stored JSON"
        ) from exc
    if type(manifest) is not dict:
        _fail("BLOCKED_ENCODING_OR_REPLAY", "manifest must be a JSON object")
    try:
        validated_manifest = validate_manifest(manifest)
    except CapConfigurationUniverseError as exc:
        raise CapConfigurationCampaignError(
            "BLOCKED_ENCODING_OR_REPLAY", str(exc)
        ) from exc
    identity = manifest["identity"]
    artifact_paths = [
        identity["finite_ingress"]["path"],
        identity["symmetry"]["path"],
        *(entry["path"] for entry in identity["cells"]),
    ]
    held: dict[str, HeldBytes] = {"manifest.json": manifest_held}
    parsed: dict[str, dict[str, Any]] = {}
    for child in artifact_paths:
        source_path = _bundle_path(manifest_path, child)
        item = _read_regular_at(repo_fd, source_path)
        try:
            value = parse_stored_json_bytes(item.payload)
        except Exception as exc:
            raise CapConfigurationCampaignError(
                "BLOCKED_ENCODING_OR_REPLAY", f"noncanonical universe artifact: {child}"
            ) from exc
        if type(value) is not dict:
            _fail(
                "BLOCKED_ENCODING_OR_REPLAY",
                f"universe artifact is not an object: {child}",
            )
        held[child] = item
        parsed[child] = value
    cells = [parsed[entry["path"]] for entry in identity["cells"]]
    finite = parsed[identity["finite_ingress"]["path"]]
    orbits = parsed[identity["symmetry"]["path"]]
    try:
        universe = validate_universe(manifest, cells, orbits, finite)
    except CapConfigurationUniverseError as exc:
        raise CapConfigurationCampaignError(
            "BLOCKED_ENCODING_OR_REPLAY", str(exc)
        ) from exc
    if universe.manifest_sha256 != validated_manifest.manifest_sha256:
        _fail("BLOCKED_ENCODING_OR_REPLAY", "universe manifest identity mismatch")
    return manifest, held, universe


def _snapshot_rel(logical: str) -> str:
    logical = _repo_relative(logical, "snapshot logical path")
    return f"artifacts/snapshots/{logical}"


def _record_snapshot(
    staging_fd: int,
    logical: str,
    retained_path: str,
    held: HeldBytes,
) -> dict[str, Any]:
    _write_create_once(staging_fd, retained_path, held.payload)
    return {
        "logical_path": logical,
        "retained_path": retained_path,
        "raw_sha256": held.raw_sha256,
        "bytes": len(held.payload),
    }


def _verify_source_manifests(
    repo_fd: int, manifest: Mapping[str, Any]
) -> tuple[list[dict[str, Any]], dict[str, HeldBytes]]:
    records: list[dict[str, Any]] = []
    held_by_path: dict[str, HeldBytes] = {}
    for role in ("generator", "validator"):
        for entry in manifest["identity"]["source_manifests"][role]:
            path = _repo_relative(entry["path"], f"{role} source path")
            held = held_by_path.get(path)
            if held is None:
                held = _read_regular_at(repo_fd, path)
                held_by_path[path] = held
            if held.raw_sha256 != entry["raw_sha256"]:
                _fail(
                    "BLOCKED_CUSTODY_OR_IDENTITY",
                    f"{role} source digest mismatch: {path}",
                )
            records.append(
                {
                    "role": role,
                    "path": path,
                    "raw_sha256": held.raw_sha256,
                    "bytes": len(held.payload),
                }
            )
    unique = {(item["role"], item["path"]) for item in records}
    if len(unique) != len(records):
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", "source manifests contain duplicates")
    return records, held_by_path


def _validate_authorization_references(
    repo_fd: int,
    authorization: Mapping[str, Any],
    checkpoint_held: HeldBytes,
    checkpoint_path: str,
) -> dict[str, HeldBytes]:
    identity = authorization["identity"]
    reference_rows = (
        (identity["active_plan"]["path"], identity["active_plan"]["raw_sha256"]),
        (
            identity["authorizing_checkpoint"]["path"],
            identity["authorizing_checkpoint"]["raw_sha256"],
        ),
        (
            identity["resource_envelope"]["supervisor_config_path"],
            identity["resource_envelope"]["supervisor_config_raw_sha256"],
        ),
        (
            identity["resource_envelope"]["telemetry_policy_path"],
            identity["resource_envelope"]["telemetry_policy_raw_sha256"],
        ),
    )
    references: dict[str, str] = {}
    for path, expected in reference_rows:
        previous = references.get(path)
        if previous is not None and previous != expected:
            _fail(
                "BLOCKED_AUTHORIZATION",
                f"authorization assigns conflicting hashes to one path: {path}",
            )
        references[path] = expected
    if identity["authorizing_checkpoint"]["path"] != checkpoint_path:
        _fail("BLOCKED_AUTHORIZATION", "authorization names another lane checkpoint")
    if identity["authorizing_checkpoint"]["base_head"] == "0" * 40:
        _fail("BLOCKED_AUTHORIZATION", "authorization has a zero checkpoint base")
    result: dict[str, HeldBytes] = {}
    for path, expected in references.items():
        held = (
            checkpoint_held
            if path == checkpoint_path
            else _read_regular_at(repo_fd, path)
        )
        if held.raw_sha256 != expected:
            _fail(
                "BLOCKED_AUTHORIZATION",
                f"authorization reference digest mismatch: {path}",
            )
        result[path] = held
    return result


def _run_manifest_hash(value: Mapping[str, Any]) -> str:
    body = {key: item for key, item in value.items() if key != "manifest_sha256"}
    return raw_sha256(canonical_json_bytes(body))


def plan_campaign(
    manifest_path: str | os.PathLike[str],
    run_root: str | os.PathLike[str],
    authorization_path: str | os.PathLike[str],
    *,
    repo_root: str | os.PathLike[str] = ".",
    now_utc: str | None = None,
    observed_head: str | None = None,
) -> dict[str, Any]:
    """Validate and atomically publish one immutable zero-network plan."""

    repository = Path(repo_root).resolve(strict=True)
    manifest_relative = _repo_relative(manifest_path, "manifest_path")
    authorization_relative = _repo_relative(authorization_path, "authorization_path")
    root_relative, lane_id, run_id = _run_identity(run_root)
    created_utc = _now_utc() if now_utc is None else now_utc
    _parse_utc(created_utc, "now_utc")
    head = (
        _git_head(repository)
        if observed_head is None
        else _digest(observed_head, "observed_head", revision=True)
    )
    repo_fd = _open_repo(repository)
    try:
        manifest, bundle_files, universe = _read_and_validate_bundle(
            repo_fd, manifest_relative
        )
        if manifest["identity"]["repository_revision"] != head:
            _fail(
                "BLOCKED_CUSTODY_OR_IDENTITY",
                "manifest repository revision differs from HEAD",
            )
        source_records, source_files = _verify_source_manifests(repo_fd, manifest)
        authorization_held = _read_regular_at(repo_fd, authorization_relative)
        try:
            authorization_value = parse_stored_json_bytes(authorization_held.payload)
        except Exception as exc:
            raise CapConfigurationCampaignError(
                "BLOCKED_AUTHORIZATION", "authorization is not canonical stored JSON"
            ) from exc
        authorization = validate_wave_authorization(
            authorization_value,
            manifest=manifest,
            run_root=root_relative,
            now_utc=created_utc,
        )
        if authorization["identity"]["run_kind"] != "fixture_canary":
            _fail(
                "BLOCKED_NOT_IMPLEMENTED",
                "v1 implementation currently admits only fixture_canary plans",
            )
        checkpoint, checkpoint_held, checkpoint_path = _validate_checkpoint(
            repo_fd, lane_id, root_relative, observed_head=head
        )
        if (
            authorization["identity"]["authorizing_checkpoint"]["base_head"]
            != checkpoint["base_head"]
        ):
            _fail("BLOCKED_AUTHORIZATION", "authorization checkpoint base mismatch")
        reference_files = _validate_authorization_references(
            repo_fd, authorization, checkpoint_held, checkpoint_path
        )

        lane_parent = _mkdirs_at(repo_fd, f"scratch/runs/{lane_id}")
        staging_name = f".{run_id}.staging-{uuid.uuid4()}"
        staging_fd = -1
        try:
            os.mkdir(staging_name, 0o700, dir_fd=lane_parent)
            os.fsync(lane_parent)
            staging_fd = os.open(staging_name, _directory_flags(), dir_fd=lane_parent)
            for output_class in OUTPUT_CLASSES:
                child = _mkdirs_at(staging_fd, output_class)
                os.close(child)

            snapshots: list[dict[str, Any]] = []
            for logical, held in bundle_files.items():
                retained = _snapshot_rel(f"bundle/{logical}")
                snapshots.append(_record_snapshot(staging_fd, logical, retained, held))
            snapshots.append(
                _record_snapshot(
                    staging_fd,
                    "authorization.json",
                    _snapshot_rel("authorization.json"),
                    authorization_held,
                )
            )
            for path, held in sorted(reference_files.items()):
                snapshots.append(
                    _record_snapshot(
                        staging_fd,
                        f"repo/{path}",
                        _snapshot_rel(f"repo/{path}"),
                        held,
                    )
                )
            source_by_path: dict[str, str] = {}
            for source in source_records:
                source_by_path[source["path"]] = source["raw_sha256"]
                held = source_files[source["path"]]
                retained = _snapshot_rel(f"repo/{source['path']}")
                if not any(item["retained_path"] == retained for item in snapshots):
                    snapshots.append(
                        _record_snapshot(
                            staging_fd, f"repo/{source['path']}", retained, held
                        )
                    )

            plan_body: dict[str, Any] = {
                "authorization_raw_sha256": authorization_held.raw_sha256,
                "authorization_sha256": authorization["authorization_sha256"],
                "campaign_id": universe.campaign_id,
                "checkpoint": {
                    "base_head": checkpoint["base_head"],
                    "owner": checkpoint["owner"],
                    "path": checkpoint_path,
                    "raw_sha256": checkpoint_held.raw_sha256,
                },
                "created_utc": created_utc,
                "manifest_raw_sha256": bundle_files["manifest.json"].raw_sha256,
                "manifest_sha256": universe.manifest_sha256,
                "observed_head": head,
                "ordered_cell_ids": [cell.cell_id for cell in universe.cells],
                "piqd": authorization["identity"]["piqd"],
                "resource_envelope": authorization["identity"]["resource_envelope"],
                "run_kind": authorization["identity"]["run_kind"],
                "run_root": root_relative,
                "schema": PLAN_SCHEMA,
                "snapshot_files": snapshots,
                "source_records": source_records,
                "universe": {
                    "canonical_cell_count": universe.canonical_cell_count,
                    "orbit_count": universe.orbit_count,
                    "orbit_ledger_sha256": universe.orbit_ledger_sha256,
                    "raw_cell_count": universe.raw_cell_count,
                },
            }
            plan = _hash_record(PLAN_SCHEMA, plan_body, "plan_sha256")
            _write_json(staging_fd, "artifacts/plan.json", plan)

            final_snapshot_paths = {
                f"{root_relative}/{entry['retained_path']}": entry["raw_sha256"]
                for entry in snapshots
            }
            run_manifest_body: dict[str, Any] = {
                "base_head": checkpoint["base_head"],
                "created_utc": created_utc,
                "input_digests": final_snapshot_paths,
                "lane_id": lane_id,
                "output_classes": OUTPUT_CLASSES,
                "owner": checkpoint["owner"],
                "root": root_relative,
                "run_id": run_id,
                "schema": RUN_MANIFEST_SCHEMA,
                "source_digests": {
                    **source_by_path,
                    checkpoint_path: checkpoint_held.raw_sha256,
                },
            }
            run_manifest = {
                **run_manifest_body,
                "manifest_sha256": _run_manifest_hash(run_manifest_body),
            }
            _write_json(staging_fd, "run_manifest.json", run_manifest)
            os.fsync(staging_fd)
            _rename_directory_noreplace(lane_parent, staging_name, run_id)
            os.fsync(lane_parent)
        finally:
            if staging_fd >= 0:
                os.close(staging_fd)
            os.close(lane_parent)
        return plan
    finally:
        os.close(repo_fd)


def _open_run(
    repo_fd: int, run_root: str | os.PathLike[str]
) -> tuple[int, str, str, str]:
    relative, lane_id, run_id = _run_identity(run_root)
    return _open_directory_at(repo_fd, relative), relative, lane_id, run_id


def _load_plan(run_fd: int) -> tuple[dict[str, Any], HeldBytes]:
    plan, held = _read_cap_json(run_fd, "artifacts/plan.json")
    _object(
        plan,
        {
            "authorization_raw_sha256",
            "authorization_sha256",
            "campaign_id",
            "checkpoint",
            "created_utc",
            "manifest_raw_sha256",
            "manifest_sha256",
            "observed_head",
            "ordered_cell_ids",
            "piqd",
            "plan_sha256",
            "resource_envelope",
            "run_kind",
            "run_root",
            "schema",
            "snapshot_files",
            "source_records",
            "universe",
        },
        "plan",
    )
    if plan["schema"] != PLAN_SCHEMA:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", "plan schema mismatch")
    _verify_record_hash(plan, PLAN_SCHEMA, "plan_sha256", "plan")
    return plan, held


def _snapshot_map(plan: Mapping[str, Any]) -> dict[str, dict[str, Any]]:
    rows = plan["snapshot_files"]
    if type(rows) is not list:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", "plan snapshot inventory is malformed")
    result: dict[str, dict[str, Any]] = {}
    for index, row in enumerate(rows):
        item = _object(
            row,
            {"bytes", "logical_path", "raw_sha256", "retained_path"},
            f"plan.snapshot_files[{index}]",
        )
        logical = _text(item["logical_path"], f"snapshot[{index}].logical_path")
        _repo_relative(item["retained_path"], f"snapshot[{index}].retained_path")
        _digest(item["raw_sha256"], f"snapshot[{index}].raw_sha256")
        _exact_int(item["bytes"], f"snapshot[{index}].bytes")
        if logical in result:
            _fail("BLOCKED_CUSTODY_OR_IDENTITY", "plan repeats a logical snapshot")
        result[logical] = item
    return result


def _verify_snapshots(run_fd: int, plan: Mapping[str, Any]) -> dict[str, HeldBytes]:
    result: dict[str, HeldBytes] = {}
    for logical, record in _snapshot_map(plan).items():
        held = _read_regular_at(
            run_fd, record["retained_path"], maximum_bytes=MAX_RECORD_BYTES
        )
        if (
            held.raw_sha256 != record["raw_sha256"]
            or len(held.payload) != record["bytes"]
        ):
            _fail("BLOCKED_CUSTODY_OR_IDENTITY", f"snapshot drifted: {logical}")
        result[logical] = held
    return result


def _snapshot_universe(
    plan: Mapping[str, Any], snapshots: Mapping[str, HeldBytes]
) -> tuple[dict[str, Any], Any]:
    try:
        manifest = parse_stored_json_bytes(snapshots["manifest.json"].payload)
        finite = parse_stored_json_bytes(snapshots["finite-ingress.json"].payload)
        orbit = parse_stored_json_bytes(snapshots["orbit-ledger.json"].payload)
        cells = [
            parse_stored_json_bytes(
                snapshots[f"cells/{ordinal:04d}-{cell_id}.json"].payload
            )
            for ordinal, cell_id in enumerate(plan["ordered_cell_ids"])
        ]
    except (KeyError, Exception) as exc:
        if isinstance(exc, CapConfigurationCampaignError):
            raise
        raise CapConfigurationCampaignError(
            "BLOCKED_ENCODING_OR_REPLAY", "retained universe snapshots are malformed"
        ) from exc
    try:
        universe = validate_universe(manifest, cells, orbit, finite)
    except CapConfigurationUniverseError as exc:
        raise CapConfigurationCampaignError(
            "BLOCKED_ENCODING_OR_REPLAY", str(exc)
        ) from exc
    if (
        universe.campaign_id != plan["campaign_id"]
        or universe.manifest_sha256 != plan["manifest_sha256"]
    ):
        _fail(
            "BLOCKED_CUSTODY_OR_IDENTITY", "retained universe crossed campaign identity"
        )
    return manifest, universe


def _verify_caller_matches_snapshot(
    repo_fd: int,
    caller_path: str | os.PathLike[str],
    expected_raw_sha256: str,
    description: str,
) -> None:
    relative = _repo_relative(caller_path, description)
    held = _read_regular_at(repo_fd, relative)
    if held.raw_sha256 != expected_raw_sha256:
        _fail(
            "BLOCKED_CUSTODY_OR_IDENTITY",
            f"{description} differs from planned snapshot",
        )


def _attempt_relative(cell_id: str, attempt_index: int = 0) -> str:
    _identifier(cell_id, "cell_id")
    _exact_int(attempt_index, "attempt_index")
    return f"events/attempts/{cell_id}/{attempt_index:06d}"


def _attempt_identity(
    plan: Mapping[str, Any],
    cell: Any,
    *,
    attempt_index: int,
    parent_attempt_id: str | None = None,
) -> dict[str, Any]:
    return {
        "attempt_index": attempt_index,
        "campaign_id": plan["campaign_id"],
        "cell_id": cell.cell_id,
        "cell_sha256": cell.cell_sha256,
        "execution_route": "smt_session",
        "manifest_sha256": plan["manifest_sha256"],
        "parent_attempt_id": parent_attempt_id,
        "request_payload": {
            "cell_snapshot_raw_sha256": _snapshot_map(plan)[
                f"cells/{cell.ordinal:04d}-{cell.cell_id}.json"
            ]["raw_sha256"],
            "system_sha256": structured_hash(
                "cap-configuration-polynomial-system/v1", cell.system.to_record()
            ),
        },
        "resource_envelope": plan["resource_envelope"],
        "retry_reason": None,
        "solver": plan["piqd"],
        "claim_flags": dict(FALSE_CLAIMS),
    }


def _build_admission(
    plan: Mapping[str, Any],
    cell: Any,
    *,
    admitted_utc: str,
    attempt_index: int = 0,
) -> dict[str, Any]:
    identity = _attempt_identity(plan, cell, attempt_index=attempt_index)
    attempt_id = structured_hash("cap-configuration-attempt-identity/v1", identity)
    body = {
        "admitted_utc": admitted_utc,
        "attempt_id": attempt_id,
        "identity": identity,
        "schema": ATTEMPT_ADMISSION_SCHEMA,
    }
    return _hash_record(ATTEMPT_ADMISSION_SCHEMA, body, "admission_sha256")


def _stage(
    *,
    attempt_id: str,
    sequence: int,
    kind: str,
    previous_sha256: str,
    payload: Mapping[str, Any],
    recorded_utc: str,
) -> dict[str, Any]:
    body = {
        "attempt_id": attempt_id,
        "kind": kind,
        "payload": dict(payload),
        "previous_sha256": previous_sha256,
        "recorded_utc": recorded_utc,
        "schema": ATTEMPT_STAGE_SCHEMA,
        "sequence": sequence,
    }
    return _hash_record(ATTEMPT_STAGE_SCHEMA, body, "stage_sha256")


def _request_id(attempt_id: str) -> str:
    return str(
        uuid.uuid5(uuid.NAMESPACE_URL, f"cap-configuration-attempt/{attempt_id}")
    )


def _consume_authorization(
    run_fd: int,
    plan: Mapping[str, Any],
    *,
    attempt_id: str,
    consumed_utc: str,
) -> dict[str, Any]:
    retained = _load_if_present(run_fd, "events/authorization-consumption.json")
    if retained is not None:
        record = retained[0]
        _object(
            record,
            {
                "attempt_id",
                "authorization_consumption_sha256",
                "authorization_sha256",
                "campaign_id",
                "consumed_utc",
                "run_root",
                "schema",
            },
            "authorization consumption",
        )
        if record["schema"] != AUTHORIZATION_CONSUMPTION_SCHEMA:
            _fail("BLOCKED_AUTHORIZATION", "authorization consumption schema mismatch")
        _verify_record_hash(
            record,
            AUTHORIZATION_CONSUMPTION_SCHEMA,
            "authorization_consumption_sha256",
            "authorization consumption",
        )
        if (
            record["authorization_sha256"] != plan["authorization_sha256"]
            or record["campaign_id"] != plan["campaign_id"]
            or record["run_root"] != plan["run_root"]
            or record["attempt_id"] != attempt_id
        ):
            _fail(
                "BLOCKED_AUTHORIZATION",
                "retained authorization consumption crossed identity",
            )
        _parse_utc(record["consumed_utc"], "authorization_consumption.consumed_utc")
        return record
    body = {
        "attempt_id": attempt_id,
        "authorization_sha256": plan["authorization_sha256"],
        "campaign_id": plan["campaign_id"],
        "consumed_utc": consumed_utc,
        "run_root": plan["run_root"],
        "schema": AUTHORIZATION_CONSUMPTION_SCHEMA,
    }
    record = _hash_record(
        AUTHORIZATION_CONSUMPTION_SCHEMA,
        body,
        "authorization_consumption_sha256",
    )
    _publish_exact(
        run_fd,
        "events/authorization-consumption.json",
        stored_json_bytes(record),
    )
    return record


class ResourceAttestor(Protocol):
    def __call__(
        self,
        *,
        plan: Mapping[str, Any],
        base_url: str,
        transport: object,
    ) -> Mapping[str, Any]: ...


class CellAdapter(Protocol):
    def __call__(
        self,
        *,
        cell_bytes: bytes,
        system_bytes: bytes,
        solver: str,
        timeout_ms: int,
        request_id: str,
        transport: object,
        output_fd: int,
        used_session_ids: set[str],
        resume_policy: str | None,
    ) -> Mapping[str, Any]: ...


def _default_resource_attestor(**_: object) -> Mapping[str, Any]:
    _fail("BLOCKED_RESOURCE_BOUNDARY", "no registered resource/daemon attestor")


def _default_cell_adapter(**kwargs: object) -> Mapping[str, Any]:
    try:
        from .piqd_adapter import (
            build_authenticated_cell_query,
            run_authenticated_cell_query,
        )
    except ImportError as exc:
        raise CapConfigurationCampaignError(
            "BLOCKED_NOT_IMPLEMENTED", "cap PIQD adapter is unavailable"
        ) from exc
    query = build_authenticated_cell_query(
        cell_bytes=kwargs["cell_bytes"],
        system_bytes=kwargs["system_bytes"],
        solver=kwargs["solver"],
        timeout_ms=kwargs["timeout_ms"],
    )
    arguments = {
        "request_id": kwargs["request_id"],
        "transport": kwargs["transport"],
        "output_fd": kwargs["output_fd"],
        "used_session_ids": kwargs["used_session_ids"],
    }
    if kwargs.get("resume_policy") is not None:
        arguments["resume_policy"] = kwargs["resume_policy"]
    return run_authenticated_cell_query(query, **arguments)


def _validate_attestation(
    value: Mapping[str, Any], plan: Mapping[str, Any], *, recorded_utc: str
) -> dict[str, Any]:
    supplied = dict(value)
    expected_keys = {
        "observed_piqd",
        "production_memory_ceiling_claimed",
        "resource_envelope",
        "schema",
        "status",
        "supervisor_config_raw_sha256",
        "supervisor_identity",
        "telemetry_identity",
        "telemetry_policy_raw_sha256",
    }
    _object(supplied, expected_keys, "resource attestation input")
    if (
        supplied["schema"] != RESOURCE_ATTESTATION_SCHEMA
        or supplied["status"] != "PASSED"
    ):
        _fail("BLOCKED_RESOURCE_BOUNDARY", "resource attestation did not pass")
    if supplied["observed_piqd"] != plan["piqd"]:
        _fail(
            "BLOCKED_PIQD_UNAVAILABLE_OR_DRIFTED",
            "live PIQD identity differs from plan",
        )
    if supplied["resource_envelope"] != plan["resource_envelope"]:
        _fail(
            "BLOCKED_RESOURCE_BOUNDARY", "attested resource envelope differs from plan"
        )
    resources = plan["resource_envelope"]
    for key in (
        "supervisor_config_raw_sha256",
        "supervisor_identity",
        "telemetry_identity",
        "telemetry_policy_raw_sha256",
    ):
        expected = resources[key]
        if supplied[key] != expected:
            _fail("BLOCKED_RESOURCE_BOUNDARY", f"attested {key} differs from plan")
    if type(supplied["production_memory_ceiling_claimed"]) is not bool:
        _fail("BLOCKED_RESOURCE_BOUNDARY", "memory-ceiling claim is not boolean")
    if plan["run_kind"] in {"fixture_canary", "target_preflight"}:
        if supplied["production_memory_ceiling_claimed"]:
            _fail(
                "BLOCKED_RESOURCE_BOUNDARY",
                "preflight cannot claim a production memory ceiling",
            )
    elif not supplied["production_memory_ceiling_claimed"]:
        _fail(
            "BLOCKED_RESOURCE_BOUNDARY",
            "production run lacks a memory-ceiling attestation",
        )
    body = {
        **supplied,
        "campaign_id": plan["campaign_id"],
        "recorded_utc": recorded_utc,
        "run_root": plan["run_root"],
    }
    return _hash_record(
        RESOURCE_ATTESTATION_SCHEMA, body, "resource_attestation_sha256"
    )


def _open_output_directory(run_fd: int, attempt_relative: str) -> int:
    return _mkdirs_at(run_fd, f"{attempt_relative}/piqd")


def _normalize_adapter_result(
    run_fd: int,
    attempt_relative: str,
    result: Mapping[str, Any],
    *,
    system: Any,
) -> dict[str, Any]:
    normalized = dict(result)
    input_keys = frozenset(normalized)
    allowed_input_keys = {
        frozenset({"classification"}),
        frozenset({"classification", "session_id"}),
        frozenset({"classification", "values"}),
        frozenset({"classification", "session_id", "values"}),
    }
    if input_keys not in allowed_input_keys:
        _fail(
            "BLOCKED_CUSTODY_OR_IDENTITY",
            "backend-none fixture adapter returned an unsupported raw shape",
        )
    classification = normalized.get("classification")
    if classification not in CLASSIFICATIONS:
        _fail(
            "BLOCKED_CUSTODY_OR_IDENTITY",
            "adapter returned an unsupported classification",
        )
    normalized["classification"] = classification
    normalized.setdefault("schema", PIQD_ADAPTER_RESULT_SCHEMA)
    if classification == "SAT_SEMANTICALLY_REPLAYED" and "values" in normalized:
        values = normalized.pop("values")
        if type(values) is not str:
            _fail("BLOCKED_ENCODING_OR_REPLAY", "fake SAT values are not text")
        raw_values = values.encode("utf-8")
        artifact_payload = stored_json_bytes({"values": values})
        artifact_name = "cap-values.json"
        replay = replay_piqd_sat_values(system, values).to_record()
        _publish_exact(
            run_fd, f"{attempt_relative}/piqd/{artifact_name}", artifact_payload
        )
        normalized.update(
            {
                "cap_semantic_replay": replay,
                "cap_values_artifact": {
                    "bytes": len(artifact_payload),
                    "path": artifact_name,
                    "sha256": raw_sha256(artifact_payload),
                },
                "cap_values_json_field": "values",
                "cap_values_raw_sha256": raw_sha256(raw_values),
            }
        )
    if classification == "SAT_SEMANTICALLY_REPLAYED":
        replay = normalized.get("cap_semantic_replay")
        if (
            type(replay) is not dict
            or replay.get("adapter_classification") != classification
        ):
            _fail(
                "BLOCKED_ENCODING_OR_REPLAY",
                "SAT adapter result lacks accepted cap replay",
            )
        if normalized.get("cap_values_artifact") is None:
            _fail(
                "BLOCKED_ENCODING_OR_REPLAY", "SAT adapter result lacks retained values"
            )
    else:
        normalized.setdefault("cap_semantic_replay", None)
        normalized.setdefault("cap_values_artifact", None)
        normalized.setdefault("cap_values_json_field", None)
        normalized.setdefault("cap_values_raw_sha256", None)
    _validate_fixture_adapter_result_shape(normalized)
    return normalized


def _adapter_session_id(
    result: Mapping[str, Any],
    *,
    allow_missing: bool,
    where: str = "adapter result",
) -> str | None:
    if "session_id" not in result:
        if allow_missing:
            return None
        _fail(
            "BLOCKED_CUSTODY_OR_IDENTITY",
            f"{where} lacks its authenticated session identity",
        )
    session_id = result["session_id"]
    if type(session_id) is not str:
        _fail(
            "BLOCKED_CUSTODY_OR_IDENTITY",
            f"{where} session_id is not a canonical UUID",
        )
    try:
        canonical = str(uuid.UUID(session_id))
    except (ValueError, AttributeError) as exc:
        raise CapConfigurationCampaignError(
            "BLOCKED_CUSTODY_OR_IDENTITY",
            f"{where} session_id is not a canonical UUID",
        ) from exc
    if canonical != session_id:
        _fail(
            "BLOCKED_CUSTODY_OR_IDENTITY",
            f"{where} session_id is not a canonical UUID",
        )
    return session_id


def _validate_fixture_adapter_result_shape(
    result: Mapping[str, Any],
) -> str | None:
    keys = frozenset(result)
    allowed = {
        _FIXTURE_ADAPTER_RESULT_KEYS,
        _FIXTURE_ADAPTER_RESULT_KEYS | {"session_id"},
    }
    if keys not in allowed:
        _fail(
            "BLOCKED_CUSTODY_OR_IDENTITY",
            "backend-none fixture adapter result has an unsupported shape",
        )
    if result.get("schema") != PIQD_ADAPTER_RESULT_SCHEMA:
        _fail(
            "BLOCKED_CUSTODY_OR_IDENTITY",
            "backend-none fixture adapter result schema mismatch",
        )
    if result.get("classification") not in CLASSIFICATIONS:
        _fail(
            "BLOCKED_CUSTODY_OR_IDENTITY",
            "backend-none fixture adapter result classification mismatch",
        )
    return _adapter_session_id(result, allow_missing=True)


def _validate_real_adapter_result(
    *,
    cell_bytes: bytes,
    system_bytes: bytes,
    solver: str,
    timeout_ms: int,
    request_id: str,
    adapter_result: Mapping[str, Any],
    output_fd: int,
) -> dict[str, Any]:
    try:
        from .piqd_adapter import validate_retained_cell_query_result
    except ImportError as exc:
        raise CapConfigurationCampaignError(
            "BLOCKED_NOT_IMPLEMENTED",
            "offline validation of real PIQD results is unavailable",
        ) from exc
    try:
        validated = validate_retained_cell_query_result(
            cell_bytes=cell_bytes,
            system_bytes=system_bytes,
            solver=solver,
            timeout_ms=timeout_ms,
            request_id=request_id,
            adapter_result=adapter_result,
            output_fd=output_fd,
        )
    except Exception as exc:
        raise CapConfigurationCampaignError(
            "BLOCKED_CUSTODY_OR_IDENTITY",
            "real PIQD adapter result failed offline authentication",
        ) from exc
    if validated != adapter_result:
        _fail(
            "BLOCKED_CUSTODY_OR_IDENTITY",
            "real PIQD adapter result is not the canonical validated mapping",
        )
    return validated


def _retained_session_ids(
    run_fd: int,
    universe: Any,
    *,
    backend: str,
) -> set[str]:
    retained: set[str] = set()
    if not _optional_directory_present(run_fd, "events/attempts"):
        return retained
    for cell in universe.cells:
        cell_root = f"events/attempts/{cell.cell_id}"
        if not _optional_directory_present(run_fd, cell_root):
            continue
        if not _optional_directory_present(run_fd, _attempt_relative(cell.cell_id)):
            continue
        loaded = _load_if_present(
            run_fd, f"{_attempt_relative(cell.cell_id)}/adapter-result.json"
        )
        if loaded is None:
            continue
        adapter_result = loaded[0]
        if backend == "none":
            session_id = _validate_fixture_adapter_result_shape(adapter_result)
        else:
            session_id = _adapter_session_id(adapter_result, allow_missing=False)
        if session_id is None:
            continue
        if session_id in retained:
            _fail(
                "BLOCKED_CUSTODY_OR_IDENTITY",
                "retained adapter results reuse a session_id",
            )
        retained.add(session_id)
    return retained


def _outcome_kind(classification: str) -> str:
    if classification == "SAT_SEMANTICALLY_REPLAYED":
        return "sat"
    if classification == "UNSAT_DISCOVERY_ONLY":
        return "unsat"
    if classification == "INCONCLUSIVE_UNKNOWN":
        return "unknown"
    return "failed"


def _build_outcome(
    admission: Mapping[str, Any],
    last_stage: Mapping[str, Any],
    adapter_result: Mapping[str, Any],
    adapter_held: HeldBytes,
    *,
    recorded_utc: str,
) -> dict[str, Any]:
    classification = adapter_result["classification"]
    replay = adapter_result.get("cap_semantic_replay")
    body = {
        "adapter_classification": classification,
        "adapter_result_raw_sha256": adapter_held.raw_sha256,
        "attempt_id": admission["attempt_id"],
        "certificate_ref": None,
        "certificate_status": "NOT_AVAILABLE"
        if classification == "UNSAT_DISCOVERY_ONLY"
        else "NOT_REQUESTED",
        "failure": None
        if classification
        in {"SAT_SEMANTICALLY_REPLAYED", "UNSAT_DISCOVERY_ONLY", "INCONCLUSIVE_UNKNOWN"}
        else classification,
        "kind": _outcome_kind(classification),
        "previous_sha256": last_stage["stage_sha256"],
        "recorded_utc": recorded_utc,
        "schema": ATTEMPT_OUTCOME_SCHEMA,
        "semantic_replay_sha256": None
        if replay is None
        else replay.get("replay_sha256"),
    }
    return _hash_record(ATTEMPT_OUTCOME_SCHEMA, body, "outcome_sha256")


def _failure_outcome(
    admission: Mapping[str, Any],
    previous_sha256: str,
    *,
    failure_stage: str,
    message: str,
    recorded_utc: str,
) -> dict[str, Any]:
    body = {
        "adapter_classification": None,
        "adapter_result_raw_sha256": None,
        "attempt_id": admission["attempt_id"],
        "certificate_ref": None,
        "certificate_status": "NOT_REQUESTED",
        "failure": {"message": message, "stage": failure_stage},
        "kind": "failed",
        "previous_sha256": previous_sha256,
        "recorded_utc": recorded_utc,
        "schema": ATTEMPT_OUTCOME_SCHEMA,
        "semantic_replay_sha256": None,
    }
    return _hash_record(ATTEMPT_OUTCOME_SCHEMA, body, "outcome_sha256")


def _cell_result(
    plan: Mapping[str, Any],
    cell: Any,
    admission: Mapping[str, Any],
    outcome: Mapping[str, Any],
) -> dict[str, Any]:
    body = {
        "adapter_classification": outcome["adapter_classification"],
        "campaign_id": plan["campaign_id"],
        "cell_id": cell.cell_id,
        "cell_sha256": cell.cell_sha256,
        "certificate_ref": outcome["certificate_ref"],
        "certificate_status": outcome["certificate_status"],
        "claim_flags": dict(FALSE_CLAIMS),
        "manifest_sha256": plan["manifest_sha256"],
        "schema": CELL_RESULT_SCHEMA,
        "selection": {
            "admission_sha256": admission["admission_sha256"],
            "admission_policy": "cap-configuration-fixture-result-admission/v1",
            "kind": "single_attempt",
            "outcome_sha256": outcome["outcome_sha256"],
            "reason": "only_eligible_terminal_attempt",
            "selected_attempt_id": admission["attempt_id"],
        },
    }
    return _hash_record(CELL_RESULT_SCHEMA, body, "cell_result_sha256")


def _coverage(
    plan: Mapping[str, Any],
    universe: Any,
    results: Sequence[Mapping[str, Any]],
    *,
    attempts: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    by_cell = {result["cell_id"]: result for result in results}
    missing = [cell.cell_id for cell in universe.cells if cell.cell_id not in by_cell]
    failed = [
        result["cell_id"]
        for result in results
        if result["adapter_classification"] is None
    ]
    classifications = Counter(
        result["adapter_classification"]
        for result in results
        if result["adapter_classification"] is not None
    )
    complete = not missing and not failed and len(results) == len(universe.cells)
    body = {
        "campaign_id": plan["campaign_id"],
        "claim_flags": dict(FALSE_CLAIMS),
        "classification_counts": dict(sorted(classifications.items())),
        "conflicting_decisive": [],
        "coverage_status": "COMPLETE" if complete else "INCOMPLETE",
        "diagnostic_coverage": complete,
        "duplicate_cells": [],
        "failed_cells": failed,
        "identity_mismatches": [],
        "manifest_sha256": plan["manifest_sha256"],
        "missing_cells": missing,
        "nonterminal_attempts": [],
        "ordered_attempt_ids": [item["attempt_id"] for item in attempts],
        "ordered_selected_results": [
            {
                "cell_id": cell.cell_id,
                "cell_result_sha256": by_cell[cell.cell_id]["cell_result_sha256"],
            }
            for cell in universe.cells
            if cell.cell_id in by_cell
        ],
        "orphan_attempts": [],
        "promotion_verifier_record": None,
        "schema": COVERAGE_SCHEMA,
        "stale_attempts": [],
        "target_termination": {
            "policy": "EXHAUSTIVE_FIXTURE",
            "reason": "ordered_universe_exhausted"
            if complete
            else "retained_prefix_incomplete",
            "terminal_witness_result": None,
            "unattempted_cell_ids": missing,
        },
        "universe": plan["universe"],
    }
    return _hash_record(COVERAGE_SCHEMA, body, "coverage_sha256")


def _next_coverage_path(run_fd: int) -> str:
    try:
        directory = _open_directory_at(run_fd, "artifacts/coverage")
    except _MissingFinalDirectory:
        directory = _mkdirs_at(run_fd, "artifacts/coverage")
    try:
        try:
            names = sorted(os.listdir(directory))
        except OSError as exc:
            raise CapConfigurationCampaignError(
                "BLOCKED_CUSTODY_OR_IDENTITY",
                "cannot safely inspect coverage directory",
            ) from exc
    finally:
        os.close(directory)
    for name in names:
        if re.fullmatch(r"[0-9]{6}\.json", name) is None:
            _fail(
                "BLOCKED_CUSTODY_OR_IDENTITY", "coverage directory contains an orphan"
            )
    return f"artifacts/coverage/{len(names):06d}.json"


@contextmanager
def _run_lock(run_fd: int) -> Iterator[None]:
    held = _read_regular_at(run_fd, "run_manifest.json")
    del held
    descriptor = os.open("run_manifest.json", _file_flags(), dir_fd=run_fd)
    try:
        fcntl.flock(descriptor, fcntl.LOCK_EX)
        yield
    finally:
        fcntl.flock(descriptor, fcntl.LOCK_UN)
        os.close(descriptor)


def _load_if_present(
    run_fd: int, relative: str
) -> tuple[dict[str, Any], HeldBytes] | None:
    try:
        return _read_cap_json(run_fd, relative)
    except _MissingFinalMember:
        return None


def _crash(crash_after: str | None, boundary: str) -> None:
    if crash_after == boundary:
        raise _InjectedCrash(f"injected crash after {boundary}")


def run_campaign(
    manifest_path: str | os.PathLike[str],
    run_root: str | os.PathLike[str],
    authorization_path: str | os.PathLike[str],
    base_url: str,
    *,
    repo_root: str | os.PathLike[str] = ".",
    transport: object | None = None,
    adapter: CellAdapter | None = None,
    resource_attestor: ResourceAttestor | None = None,
    now_utc: str | None = None,
    crash_after: str | None = None,
) -> dict[str, Any]:
    """Execute or resume one authenticated, sequential, append-only campaign."""

    repository = Path(repo_root).resolve(strict=True)
    recorded_utc = _now_utc() if now_utc is None else now_utc
    _parse_utc(recorded_utc, "now_utc")
    if type(base_url) is not str or not base_url:
        _fail("BLOCKED_ASSIGNMENT_INCOMPLETE", "base_url is required")
    repo_fd = _open_repo(repository)
    run_fd = -1
    try:
        run_fd, root_relative, _lane, _run_id = _open_run(repo_fd, run_root)
        with _run_lock(run_fd):
            plan, _plan_held = _load_plan(run_fd)
            if plan["run_root"] != root_relative:
                _fail("BLOCKED_CUSTODY_OR_IDENTITY", "plan run root mismatch")
            snapshots = _verify_snapshots(run_fd, plan)
            manifest, universe = _snapshot_universe(plan, snapshots)
            _verify_caller_matches_snapshot(
                repo_fd, manifest_path, plan["manifest_raw_sha256"], "manifest"
            )
            _verify_caller_matches_snapshot(
                repo_fd,
                authorization_path,
                plan["authorization_raw_sha256"],
                "authorization",
            )
            authorization = parse_stored_json_bytes(
                snapshots["authorization.json"].payload
            )
            validate_wave_authorization(
                authorization,
                manifest=manifest,
                run_root=root_relative,
                now_utc=recorded_utc,
            )

            # The authoritative validator is imported lazily to avoid a cycle.
            from .validate import validate_campaign

            validation = validate_campaign(
                manifest_path,
                run_root,
                repo_root=repository,
                allow_incomplete=True,
                observed_now_utc=recorded_utc,
            )
            if not validation.resume_safe:
                _fail(
                    "BLOCKED_CUSTODY_OR_IDENTITY",
                    "retained prefix is not safe to resume",
                )

            backend = manifest["identity"]["solver"]["backend"]
            used_session_ids = _retained_session_ids(run_fd, universe, backend=backend)

            existing_status = campaign_status(run_root, repo_root=repository)
            if (
                validation.coverage_status == "COMPLETE"
                and not validation.observations
                and existing_status["coverage"] is not None
            ):
                return existing_status["coverage"]

            retained_attestation = _load_if_present(
                run_fd, "events/resource-attestation.json"
            )
            if transport is None:
                try:
                    from .piqd_adapter import stdlib_piqd_transport
                except ImportError as exc:
                    raise CapConfigurationCampaignError(
                        "BLOCKED_NOT_IMPLEMENTED", "cap PIQD transport is unavailable"
                    ) from exc
                transport = stdlib_piqd_transport(
                    base_url,
                    timeout_ms=max(1, plan["resource_envelope"]["wall_seconds"] * 1000),
                )
            attestor = (
                _default_resource_attestor
                if resource_attestor is None
                else resource_attestor
            )
            attestation_value = attestor(
                plan=plan, base_url=base_url, transport=transport
            )
            current_attestation = _validate_attestation(
                attestation_value, plan, recorded_utc=recorded_utc
            )
            if retained_attestation is None:
                attestation = current_attestation
                _write_json(run_fd, "events/resource-attestation.json", attestation)
            else:
                attestation = retained_attestation[0]
                stable_fields = set(attestation) - {
                    "recorded_utc",
                    "resource_attestation_sha256",
                }
                if stable_fields != set(current_attestation) - {
                    "recorded_utc",
                    "resource_attestation_sha256",
                } or any(
                    attestation[key] != current_attestation[key]
                    for key in stable_fields
                ):
                    _fail(
                        "BLOCKED_RESOURCE_BOUNDARY",
                        "resume resource/daemon attestation differs from retained identity",
                    )
            print("CAP_CONFIG_RESOURCE_ATTESTATION=PASSED")
            _crash(crash_after, "resource_attestation")

            if backend == "none" and adapter is None:
                _fail(
                    "BLOCKED_NOT_IMPLEMENTED",
                    "backend-none fixture execution requires an injected adapter",
                )
            execute = _default_cell_adapter if adapter is None else adapter
            admissions: list[dict[str, Any]] = []
            results: list[dict[str, Any]] = []
            stop_after_failure = False

            for cell in universe.cells:
                attempt_relative = _attempt_relative(cell.cell_id)
                attempt_directory = _mkdirs_at(run_fd, attempt_relative)
                os.close(attempt_directory)
                stages_directory = _mkdirs_at(run_fd, f"{attempt_relative}/stages")
                os.close(stages_directory)
                result_directory = _mkdirs_at(
                    run_fd, f"artifacts/results/{cell.cell_id}"
                )
                os.close(result_directory)
                admission_path = f"{attempt_relative}/admission.json"
                loaded_admission = _load_if_present(run_fd, admission_path)
                if loaded_admission is None:
                    admission = _build_admission(plan, cell, admitted_utc=recorded_utc)
                    _write_json(run_fd, admission_path, admission)
                    admission_was_created = True
                else:
                    admission = loaded_admission[0]
                    admission_was_created = False
                admissions.append(admission)
                if cell.ordinal == 0:
                    _consume_authorization(
                        run_fd,
                        plan,
                        attempt_id=admission["attempt_id"],
                        consumed_utc=recorded_utc,
                    )
                if admission_was_created:
                    _crash(crash_after, "admission")

                stage0_path = (
                    f"{attempt_relative}/stages/000000-resource-attestation.json"
                )
                loaded_stage0 = _load_if_present(run_fd, stage0_path)
                if loaded_stage0 is None:
                    stage0 = _stage(
                        attempt_id=admission["attempt_id"],
                        sequence=0,
                        kind="resource_attestation",
                        previous_sha256=admission["admission_sha256"],
                        payload={
                            "resource_attestation_sha256": attestation[
                                "resource_attestation_sha256"
                            ]
                        },
                        recorded_utc=recorded_utc,
                    )
                    _write_json(run_fd, stage0_path, stage0)
                else:
                    stage0 = loaded_stage0[0]

                request_id = _request_id(admission["attempt_id"])
                stage1_path = f"{attempt_relative}/stages/000001-request-intent.json"
                loaded_stage1 = _load_if_present(run_fd, stage1_path)
                if loaded_stage1 is None:
                    stage1 = _stage(
                        attempt_id=admission["attempt_id"],
                        sequence=1,
                        kind="request_intent",
                        previous_sha256=stage0["stage_sha256"],
                        payload={"request_id": request_id},
                        recorded_utc=recorded_utc,
                    )
                    _write_json(run_fd, stage1_path, stage1)
                    _crash(crash_after, "request_intent")
                    resume_policy = None
                else:
                    stage1 = loaded_stage1[0]
                    resume_policy = "allow_create_if_prefix_proves_no_mutation"

                adapter_path = f"{attempt_relative}/adapter-result.json"
                loaded_adapter = _load_if_present(run_fd, adapter_path)
                if loaded_adapter is None:
                    retained_failure_stage = _load_if_present(
                        run_fd,
                        f"{attempt_relative}/stages/000002-adapter-failure.json",
                    )
                    if retained_failure_stage is not None:
                        retained_outcome = _load_if_present(
                            run_fd, f"{attempt_relative}/outcome.json"
                        )
                        if retained_outcome is None:
                            _fail(
                                "BLOCKED_CUSTODY_OR_IDENTITY",
                                "adapter failure stage lacks its failure seal",
                            )
                        outcome = retained_outcome[0]
                        result_path = (
                            f"artifacts/results/{cell.cell_id}/"
                            f"{admission['attempt_id']}.json"
                        )
                        retained_result = _load_if_present(run_fd, result_path)
                        if retained_result is None:
                            _fail(
                                "BLOCKED_CUSTODY_OR_IDENTITY",
                                "adapter failure outcome lacks its result projection",
                            )
                        results.append(retained_result[0])
                        stop_after_failure = True
                        break
                    output_fd = _open_output_directory(run_fd, attempt_relative)
                    try:
                        cell_logical = f"cells/{cell.ordinal:04d}-{cell.cell_id}.json"
                        cell_bytes = snapshots[cell_logical].payload
                        system_bytes = stored_json_bytes(cell.system.to_record())
                        adapter_arguments: dict[str, Any] = {
                            "cell_bytes": cell_bytes,
                            "system_bytes": system_bytes,
                            "solver": plan["piqd"]["solver"],
                            "timeout_ms": max(
                                1,
                                plan["resource_envelope"]["wall_seconds"] * 1000,
                            ),
                            "request_id": request_id,
                            "transport": transport,
                            "output_fd": output_fd,
                            "used_session_ids": used_session_ids,
                            "resume_policy": resume_policy,
                        }
                        sessions_before_call = set(used_session_ids)
                        raw_result = execute(**adapter_arguments)
                        _crash(crash_after, "adapter_call")
                        if not sessions_before_call.issubset(used_session_ids):
                            _fail(
                                "BLOCKED_CUSTODY_OR_IDENTITY",
                                "adapter removed a retained session identity",
                            )
                        session_id = _adapter_session_id(
                            raw_result, allow_missing=backend == "none"
                        )
                        if session_id is not None:
                            if session_id in sessions_before_call:
                                _fail(
                                    "BLOCKED_CUSTODY_OR_IDENTITY",
                                    "adapter reused a session_id from an earlier cell",
                                )
                            used_session_ids.add(session_id)
                        if backend == "none":
                            normalized = _normalize_adapter_result(
                                run_fd,
                                attempt_relative,
                                raw_result,
                                system=cell.system,
                            )
                        else:
                            normalized = _validate_real_adapter_result(
                                cell_bytes=cell_bytes,
                                system_bytes=system_bytes,
                                solver=plan["piqd"]["solver"],
                                timeout_ms=max(
                                    1,
                                    plan["resource_envelope"]["wall_seconds"] * 1000,
                                ),
                                request_id=request_id,
                                adapter_result=raw_result,
                                output_fd=output_fd,
                            )
                    except Exception as exc:
                        if isinstance(exc, _InjectedCrash):
                            raise
                        failure_stage = _stage(
                            attempt_id=admission["attempt_id"],
                            sequence=2,
                            kind="adapter_failure",
                            previous_sha256=stage1["stage_sha256"],
                            payload={"exception": type(exc).__name__},
                            recorded_utc=recorded_utc,
                        )
                        _write_json(
                            run_fd,
                            f"{attempt_relative}/stages/000002-adapter-failure.json",
                            failure_stage,
                        )
                        outcome = _failure_outcome(
                            admission,
                            failure_stage["stage_sha256"],
                            failure_stage="adapter",
                            message=type(exc).__name__,
                            recorded_utc=recorded_utc,
                        )
                        _write_json(run_fd, f"{attempt_relative}/outcome.json", outcome)
                        result = _cell_result(plan, cell, admission, outcome)
                        result_path = f"artifacts/results/{cell.cell_id}/{admission['attempt_id']}.json"
                        _write_json(run_fd, result_path, result)
                        results.append(result)
                        stop_after_failure = True
                        break
                    finally:
                        os.close(output_fd)
                    _write_json(run_fd, adapter_path, normalized)
                    loaded_adapter = _read_cap_json(run_fd, adapter_path)
                    _crash(crash_after, "adapter_result")
                adapter_result, adapter_held = loaded_adapter

                stage2_path = f"{attempt_relative}/stages/000002-adapter-completed.json"
                loaded_stage2 = _load_if_present(run_fd, stage2_path)
                if loaded_stage2 is None:
                    stage2 = _stage(
                        attempt_id=admission["attempt_id"],
                        sequence=2,
                        kind="adapter_completed",
                        previous_sha256=stage1["stage_sha256"],
                        payload={
                            "adapter_result_raw_sha256": adapter_held.raw_sha256,
                            "classification": adapter_result["classification"],
                        },
                        recorded_utc=recorded_utc,
                    )
                    _write_json(run_fd, stage2_path, stage2)
                else:
                    stage2 = loaded_stage2[0]
                outcome_path = f"{attempt_relative}/outcome.json"
                loaded_outcome = _load_if_present(run_fd, outcome_path)
                if loaded_outcome is None:
                    outcome = _build_outcome(
                        admission,
                        stage2,
                        adapter_result,
                        adapter_held,
                        recorded_utc=recorded_utc,
                    )
                    _write_json(run_fd, outcome_path, outcome)
                    _crash(crash_after, "outcome")
                else:
                    outcome = loaded_outcome[0]
                result = _cell_result(plan, cell, admission, outcome)
                result_path = (
                    f"artifacts/results/{cell.cell_id}/{admission['attempt_id']}.json"
                )
                _write_json(run_fd, result_path, result)
                _crash(crash_after, "cell_result")
                results.append(result)

            coverage = _coverage(plan, universe, results, attempts=admissions)
            coverage_path = _next_coverage_path(run_fd)
            _write_json(run_fd, coverage_path, coverage)
            _crash(crash_after, "coverage")
            recapture_body = {
                "campaign_id": plan["campaign_id"],
                "coverage_sha256": coverage["coverage_sha256"],
                "recorded_utc": recorded_utc,
                "schema": FINAL_RECAPTURE_SCHEMA,
                "snapshot_digests": {
                    logical: held.raw_sha256
                    for logical, held in sorted(snapshots.items())
                },
            }
            recapture = _hash_record(
                FINAL_RECAPTURE_SCHEMA, recapture_body, "final_recapture_sha256"
            )
            _write_json(
                run_fd,
                f"artifacts/recapture/{coverage['coverage_sha256']}.json",
                recapture,
            )
            if stop_after_failure:
                return coverage
            return coverage
    finally:
        if run_fd >= 0:
            os.close(run_fd)
        os.close(repo_fd)


def _coverage_files(run_fd: int) -> list[str]:
    try:
        directory = _open_directory_at(run_fd, "artifacts/coverage")
    except _MissingFinalDirectory:
        return []
    try:
        try:
            names = sorted(os.listdir(directory))
        except OSError as exc:
            raise CapConfigurationCampaignError(
                "BLOCKED_CUSTODY_OR_IDENTITY",
                "cannot safely inspect coverage directory",
            ) from exc
    finally:
        os.close(directory)
    if any(re.fullmatch(r"[0-9]{6}\.json", name) is None for name in names):
        _fail(
            "BLOCKED_CUSTODY_OR_IDENTITY", "coverage directory has an unexpected member"
        )
    if names != [f"{index:06d}.json" for index in range(len(names))]:
        _fail("BLOCKED_CUSTODY_OR_IDENTITY", "coverage sequence has a gap")
    return [f"artifacts/coverage/{name}" for name in names]


def campaign_status(
    run_root: str | os.PathLike[str],
    *,
    repo_root: str | os.PathLike[str] = ".",
) -> dict[str, Any]:
    """Return structural observations only; this is not validation."""

    repository = Path(repo_root).resolve(strict=True)
    repo_fd = _open_repo(repository)
    run_fd = -1
    try:
        run_fd, root_relative, lane_id, run_id = _open_run(repo_fd, run_root)
        plan, _ = _load_plan(run_fd)
        observed: dict[str, str] = {}
        attempts_root_present = _optional_directory_present(run_fd, "events/attempts")
        for cell_id in plan["ordered_cell_ids"]:
            attempt = _attempt_relative(cell_id)
            cell_present = attempts_root_present and _optional_directory_present(
                run_fd, f"events/attempts/{cell_id}"
            )
            attempt_present = cell_present and _optional_directory_present(
                run_fd, attempt
            )
            if not attempt_present:
                observed[cell_id] = "unattempted_observed"
            elif _load_if_present(run_fd, f"{attempt}/outcome.json") is not None:
                observed[cell_id] = "terminal_observed"
            elif _load_if_present(run_fd, f"{attempt}/admission.json") is not None:
                observed[cell_id] = "admitted_nonterminal_observed"
            else:
                observed[cell_id] = "unattempted_observed"
        coverage_paths = _coverage_files(run_fd)
        coverage = None
        if coverage_paths:
            coverage = _read_cap_json(run_fd, coverage_paths[-1])[0]
        return {
            "schema": "cap-configuration-campaign-status/v1",
            "campaign_id": plan["campaign_id"],
            "coverage": coverage,
            "coverage_status": "UNVALIDATED_OBSERVED_NONE"
            if coverage is None
            else coverage.get("coverage_status", "UNVALIDATED_OBSERVED_UNKNOWN"),
            "lane_id": lane_id,
            "mathematical_claim": None,
            "observed_cells": observed,
            "run_id": run_id,
            "run_root": root_relative,
            "validated": False,
        }
    finally:
        if run_fd >= 0:
            os.close(run_fd)
        os.close(repo_fd)


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="python -m census.cap_configuration.campaign",
        description="Plan, run, or inspect a fail-closed cap-configuration census.",
    )
    subparsers = parser.add_subparsers(dest="command", required=True)
    plan = subparsers.add_parser("plan", help="validate and retain an offline plan")
    plan.add_argument("manifest")
    plan.add_argument("run_root")
    plan.add_argument("--authorization", required=True)
    run = subparsers.add_parser("run", help="execute or resume one retained campaign")
    run.add_argument("manifest")
    run.add_argument("run_root")
    run.add_argument("--authorization", required=True)
    run.add_argument("--base-url", required=True)
    status = subparsers.add_parser("status", help="report unvalidated observed state")
    status.add_argument("run_root")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    arguments = _parser().parse_args(argv)
    try:
        if arguments.command == "plan":
            result = plan_campaign(
                arguments.manifest,
                arguments.run_root,
                arguments.authorization,
            )
            print(stored_json_bytes(result).decode("utf-8"), end="")
            print("CAP_CONFIG_PLAN=PASSED")
        elif arguments.command == "run":
            result = run_campaign(
                arguments.manifest,
                arguments.run_root,
                arguments.authorization,
                arguments.base_url,
            )
            print(stored_json_bytes(result).decode("utf-8"), end="")
        else:
            print(
                stored_json_bytes(campaign_status(arguments.run_root)).decode("utf-8"),
                end="",
            )
        return 0
    except CapConfigurationCampaignError as exc:
        print(str(exc), file=sys.stderr)
        return {
            "BLOCKED_ASSIGNMENT_INCOMPLETE": 10,
            "BLOCKED_AUTHORIZATION": 12,
            "BLOCKED_RESOURCE_BOUNDARY": 13,
            "BLOCKED_PIQD_UNAVAILABLE_OR_DRIFTED": 14,
            "BLOCKED_NOT_IMPLEMENTED": 20,
        }.get(exc.code, 21)


if __name__ == "__main__":
    raise SystemExit(main())
