"""PIQD cvc5-session adapter for the Phase-3 survivor metric screen.

This module owns only diagnostic solver discovery.  It preserves one canonical
Phase-3 system record and the producer's exact SMT2 bytes, prepends the cvc5
``:nl-cov`` option required by the qualified PIQD session profile, and runs one
fresh bounded cvc5 session per system.  UNSAT is never promoted to a proof.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import re
import stat
from collections import Counter
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Any

from census.p97_search import phase3_piqd_smt_source_adapter as neutral
from census.p97_search import phase3_survivor_cvc5_driver as legacy

SCHEMA = "p97-phase3-piqd-survivor-cvc5-wave/v1"
SYSTEM_RECORD_SCHEMA = "p97-phase3-piqd-survivor-cvc5-system/v1"
DESCRIPTOR_SCHEMA = "p97-phase3-piqd-survivor-cvc5-query/v1"
RESULT_SCHEMA = "p97-phase3-piqd-survivor-cvc5-result/v1"
PROFILE_SCHEMA = "p97-phase3-piqd-cvc5-nl-cov-session/v1"
NL_COV_COMMAND = "(set-option :nl-cov true)"
EXPECTED_COUNTS = {
    "convex_order": 80,
    "distinctness": 45,
    "row_equalities": 30,
    "selected_rows": 10,
    "total": 155,
}
BACKEND_STATUSES = ("SAT", "UNSAT", "UNKNOWN", "ERROR")
FALSE_CLAIMS = {
    "theorem": False,
    "universal": False,
    "lean": False,
    "euclidean_problem97": False,
}
WAVE_MANIFEST_KEYS = frozenset(
    {
        "schema",
        "source_manifest_sha256",
        "server",
        "profile",
        "system_count",
        "status_counts",
        "results",
        "claims",
        "proof_blueprint",
        "manifest_sha256",
    }
)
WAVE_PROFILE_KEYS = frozenset(
    {
        "schema",
        "solver",
        "lane",
        "first_command",
        "workers",
        "timeout_ms",
        "local_fallback",
    }
)
WAVE_RESULT_KEYS = frozenset(
    {
        "index",
        "system_id",
        "status",
        "effective_status",
        "classification",
        "result_sha256",
    }
)
LEAF_RESULT_KEYS = frozenset(
    {
        "schema",
        "system_id",
        "source_record_sha256",
        "descriptor_sha256",
        "original_smt2_sha256",
        "journal_smt2_sha256",
        "raw_status",
        "effective_status",
        "classification",
        "custody",
        "engine",
        "claims",
    }
)
LEAF_CUSTODY_KEYS = frozenset(
    {"descriptor", "source_record", "original_smt2", "journal_smt2"}
)
LEAF_ENGINE_KEYS = frozenset(
    {
        "solver",
        "session_id",
        "solver_signature",
        "solver_sha256",
        "raw_status",
        "effective_status",
        "solve_index",
        "result_sha256",
        "response_lost",
        "reconciled_from_receipt",
        "result_digest_advisory",
        "unsat_assumptions",
        "semantic_replay",
        "artifacts",
        "claims",
    }
)
LEAF_ARTIFACT_DESCRIPTOR_KEYS = frozenset({"path", "bytes", "sha256"})
DEFAULT_OUT = legacy.DEFAULT_OUT.with_name("phase3_survivor_piqd_cvc5_v1")
ROOT = Path(__file__).resolve().parents[2]
# The PIQD adapter consumes the authenticated current fixture.  The legacy
# local lane intentionally keeps its own historical default in the driver.
DEFAULT_SOURCE = (
    ROOT / "census/p97_search/tests/fixtures/phase3_survivor_metric_100_current"
)
_INTEGER = re.compile(r"-?(?:0|[1-9][0-9]*)\Z")
_DECIMAL = re.compile(r"-?(?:0|[1-9][0-9]*)\.[0-9]+\Z")
_SOURCE_ARTIFACT_CAP = 64 * 1024 * 1024


def _is_sha256(value: object) -> bool:
    return (
        type(value) is str
        and len(value) == 64
        and all(character in "0123456789abcdef" for character in value)
    )


def _read_lane_relative(root_fd: int, relative: str, cap: int, where: str) -> bytes:
    """Read one lane artifact through held no-follow descriptors."""

    parts = relative.split("/")
    if not parts or any(part in {"", ".", ".."} for part in parts):
        raise Phase3PiqdCvc5Error(f"{where} is not a normalized relative path")
    directory_fd = os.dup(root_fd)
    descriptor: int | None = None
    try:
        for part in parts[:-1]:
            next_fd = os.open(
                part,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=directory_fd,
            )
            os.close(directory_fd)
            directory_fd = next_fd
        descriptor = os.open(
            parts[-1], os.O_RDONLY | os.O_NOFOLLOW, dir_fd=directory_fd
        )
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise Phase3PiqdCvc5Error(f"{where} is not a singly-linked regular file")
        if before.st_size > cap:
            raise Phase3PiqdCvc5Error(f"{where} exceeds its byte cap")
        chunks: list[bytes] = []
        while sum(map(len, chunks)) <= cap:
            chunk = os.read(
                descriptor, min(1024 * 1024, cap + 1 - sum(map(len, chunks)))
            )
            if not chunk:
                break
            chunks.append(chunk)
        payload = b"".join(chunks)
        after = os.fstat(descriptor)
        before_identity = (
            before.st_dev,
            before.st_ino,
            before.st_mode,
            before.st_nlink,
            before.st_size,
            before.st_mtime_ns,
            before.st_ctime_ns,
        )
        after_identity = (
            after.st_dev,
            after.st_ino,
            after.st_mode,
            after.st_nlink,
            after.st_size,
            after.st_mtime_ns,
            after.st_ctime_ns,
        )
        if len(payload) != before.st_size or before_identity != after_identity:
            raise Phase3PiqdCvc5Error(f"{where} changed during capture")
        return payload
    except Phase3PiqdCvc5Error:
        raise
    except OSError as exc:
        raise Phase3PiqdCvc5Error(
            f"cannot read {where} without following links"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
        os.close(directory_fd)


def _open_lane_child(root_fd: int, name: str) -> int:
    try:
        descriptor = os.open(
            name, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW, dir_fd=root_fd
        )
        info = os.fstat(descriptor)
        if not stat.S_ISDIR(info.st_mode):
            raise Phase3PiqdCvc5Error("published leaf is not a directory")
        return descriptor
    except Phase3PiqdCvc5Error:
        raise
    except OSError as exc:
        raise Phase3PiqdCvc5Error(
            "cannot open published leaf without following links"
        ) from exc


def _capture_source_file(path: Path) -> bytes:
    """Capture one authenticated source file through component-wise FDs."""

    parent_fd: int | None = None
    descriptor: int | None = None
    try:
        parent_fd = neutral._open_directory_nofollow(path.parent)
        descriptor = os.open(path.name, os.O_RDONLY | os.O_NOFOLLOW, dir_fd=parent_fd)
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise Phase3PiqdCvc5Error(
                f"source is not a singly-linked regular file: {path}"
            )
        if before.st_size > _SOURCE_ARTIFACT_CAP:
            raise Phase3PiqdCvc5Error(f"source exceeds its byte cap: {path}")
        chunks: list[bytes] = []
        total = 0
        while total <= _SOURCE_ARTIFACT_CAP:
            chunk = os.read(
                descriptor, min(1024 * 1024, _SOURCE_ARTIFACT_CAP + 1 - total)
            )
            if not chunk:
                break
            chunks.append(chunk)
            total += len(chunk)
        payload = b"".join(chunks)
        after = os.fstat(descriptor)
        before_identity = (
            before.st_dev,
            before.st_ino,
            before.st_mode,
            before.st_nlink,
            before.st_size,
            before.st_mtime_ns,
            before.st_ctime_ns,
        )
        after_identity = (
            after.st_dev,
            after.st_ino,
            after.st_mode,
            after.st_nlink,
            after.st_size,
            after.st_mtime_ns,
            after.st_ctime_ns,
        )
        if len(payload) != before.st_size or before_identity != after_identity:
            raise Phase3PiqdCvc5Error(f"source changed during capture: {path}")
        return payload
    except Phase3PiqdCvc5Error:
        raise
    except (OSError, neutral.SmtSourceAdapterError) as exc:
        raise Phase3PiqdCvc5Error(
            f"cannot capture source without following links: {path}"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
        if parent_fd is not None:
            os.close(parent_fd)


def _source_path(value: object) -> Path | None:
    if type(value) is not str or not value or "\x00" in value:
        return None
    path = Path(value)
    return path if path.is_absolute() else ROOT / path


def _capture_source_snapshot(source_dir: Path) -> dict[str, bytes]:
    """Capture loader inputs and every manifest-declared source dependency."""

    source_dir = Path(os.path.abspath(source_dir))
    paths: set[Path] = {
        source_dir / "manifest.json",
        source_dir / "source-manifest.json",
        source_dir / "results.jsonl",
    }
    manifest = _json_artifact(
        _capture_source_file(source_dir / "manifest.json"), "source manifest"
    )
    source_manifest = _json_artifact(
        _capture_source_file(source_dir / "source-manifest.json"), "source-manifest"
    )
    for document in (manifest, source_manifest):
        configuration = document.get("configuration")
        dependency_hashes = (
            configuration.get("dependency_sha256", {})
            if type(configuration) is dict
            else {}
        )
        if type(dependency_hashes) is dict:
            for relative in dependency_hashes:
                path = _source_path(relative)
                if path is not None:
                    paths.add(path)

        def collect(value: object) -> None:
            if type(value) is dict:
                for key, child in value.items():
                    if key == "path":
                        path = _source_path(child)
                        if path is not None:
                            paths.add(path)
                    elif key == "directory":
                        directory = _source_path(child)
                        if directory is not None:
                            paths.update(
                                {
                                    directory / "manifest.json",
                                    directory / "survivors.jsonl",
                                }
                            )
                    collect(child)
            elif type(value) is list:
                for child in value:
                    collect(child)

        collect(document)
    snapshots: dict[str, bytes] = {}
    for path in sorted(paths, key=lambda item: os.fspath(item)):
        absolute = Path(os.path.abspath(path))
        snapshots[os.fspath(absolute)] = _capture_source_file(absolute)
    return snapshots


def _assert_source_snapshot(source_dir: Path, snapshot: dict[str, bytes]) -> None:
    if _capture_source_snapshot(source_dir) != snapshot:
        raise Phase3PiqdCvc5Error(
            "authenticated source changed during parsing or preparation"
        )


class Phase3PiqdCvc5Error(legacy.Phase3Cvc5Error):
    """The Phase-3 source, semantic replay, or PIQD contract failed closed."""


class Phase3PiqdSolverError(neutral.SmtSourceAdapterError, Phase3PiqdCvc5Error):
    """A single PIQD session/solver leaf failed without a fallback."""


@dataclass(frozen=True)
class AuthenticatedSourceToken:
    """Opaque custody token for one authenticated current-source snapshot."""

    _source_dir: Path
    _snapshot: tuple[tuple[str, bytes], ...]
    digest: str


@dataclass(frozen=True)
class AuthenticatedCurrentSource:
    """Parsed current source plus the token required for post-run rechecking."""

    manifest: dict[str, Any]
    systems: tuple[legacy.UniqueSystem, ...]
    token: AuthenticatedSourceToken


def _snapshot_digest(snapshot: Mapping[str, bytes]) -> str:
    return _sha(
        _canonical({path: _sha(payload) for path, payload in sorted(snapshot.items())})
    )


def load_authenticated_current_source(
    source_dir: Path = DEFAULT_SOURCE,
) -> AuthenticatedCurrentSource:
    """Parse the current fixture only after bounded source custody capture."""

    source_dir = Path(os.path.abspath(source_dir))
    snapshot = _capture_source_snapshot(source_dir)
    try:
        source_manifest, systems = legacy.load_unique_systems(source_dir)
    except (legacy.Phase3Cvc5Error, OSError, ValueError, TypeError, KeyError) as exc:
        raise Phase3PiqdCvc5Error("authenticated source parsing failed closed") from exc
    _assert_source_snapshot(source_dir, snapshot)
    if len(systems) != legacy.EXPECTED_UNIQUE_SYSTEMS:
        raise Phase3PiqdCvc5Error("authenticated source does not contain 48 systems")
    snapshot_items = tuple(sorted(snapshot.items()))
    token = AuthenticatedSourceToken(
        _source_dir=source_dir,
        _snapshot=snapshot_items,
        digest=_snapshot_digest(snapshot),
    )
    return AuthenticatedCurrentSource(dict(source_manifest), tuple(systems), token)


def recheck_authenticated_current_source(token: AuthenticatedSourceToken) -> None:
    """Re-capture and compare exact bytes held by an authenticated source token."""

    if type(token) is not AuthenticatedSourceToken:
        raise Phase3PiqdCvc5Error("invalid authenticated source token")
    current = _capture_source_snapshot(token._source_dir)
    if tuple(sorted(current.items())) != token._snapshot:
        raise Phase3PiqdCvc5Error("authenticated source changed after leaf run")
    if _snapshot_digest(current) != token.digest:
        raise Phase3PiqdCvc5Error("authenticated source token digest mismatch")


@dataclass
class _WaveRoot:
    staging: neutral._OutputStaging
    path: Path


def _wave_root(path: Path) -> _WaveRoot:
    try:
        staging = neutral._reserve_output_staging(path)
    except neutral.SmtSourceAdapterError as exc:
        raise Phase3PiqdCvc5Error(str(exc)) from exc
    return _WaveRoot(staging, path.parent / staging.staging_name)


def _validate_wave_root(root: _WaveRoot) -> None:
    neutral._validate_output_parent_identity(root.staging)
    if neutral._find_staging_entry(root.staging) != root.staging.staging_name:
        raise Phase3PiqdCvc5Error("wave staging identity changed")
    info = os.fstat(root.staging.staging_fd)
    if not stat.S_ISDIR(info.st_mode):
        raise Phase3PiqdCvc5Error("wave staging is no longer a directory")
    for name in os.listdir(root.staging.staging_fd):
        child = os.stat(name, dir_fd=root.staging.staging_fd, follow_symlinks=False)
        if stat.S_ISREG(child.st_mode) and child.st_nlink != 1:
            raise Phase3PiqdCvc5Error("wave staging contains a hard-linked file")
        if not (stat.S_ISREG(child.st_mode) or stat.S_ISDIR(child.st_mode)):
            raise Phase3PiqdCvc5Error("wave staging contains a hostile entry")


def _write_wave_file(root: _WaveRoot, name: str, payload: bytes) -> dict[str, object]:
    _validate_wave_root(root)
    descriptor: int | None = None
    try:
        descriptor = os.open(
            name,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
            0o400,
            dir_fd=root.staging.staging_fd,
        )
        neutral._write_all(descriptor, payload)
        os.fsync(descriptor)
        info = os.fstat(descriptor)
        if (
            not stat.S_ISREG(info.st_mode)
            or info.st_nlink != 1
            or info.st_size != len(payload)
        ):
            raise Phase3PiqdCvc5Error(f"wave file custody mismatch: {name}")
        return {"path": name, "bytes": len(payload), "sha256": _sha(payload)}
    except FileExistsError as exc:
        raise Phase3PiqdCvc5Error(f"wave file already exists: {name}") from exc
    except OSError as exc:
        raise Phase3PiqdCvc5Error(f"cannot publish wave file: {name}") from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)


def _publish_wave_root(root: _WaveRoot, expected_names: set[str]) -> None:
    _validate_wave_root(root)
    actual_names = set(os.listdir(root.staging.staging_fd))
    if actual_names != expected_names:
        raise Phase3PiqdCvc5Error("wave staging inventory changed before publication")
    for name in actual_names:
        info = os.stat(name, dir_fd=root.staging.staging_fd, follow_symlinks=False)
        if name in {"manifest.json", "source-manifest.json"} and not stat.S_ISREG(
            info.st_mode
        ):
            raise Phase3PiqdCvc5Error("wave manifest identity changed")
        if stat.S_ISREG(info.st_mode) and info.st_nlink != 1:
            raise Phase3PiqdCvc5Error("wave publication contains a hard-linked file")
        if name not in {"manifest.json", "source-manifest.json"} and not stat.S_ISDIR(
            info.st_mode
        ):
            raise Phase3PiqdCvc5Error("wave leaf identity changed")
    os.fsync(root.staging.staging_fd)
    neutral._rename_directory_noreplace(
        root.staging.parent_fd, root.staging.staging_name, root.staging.final_name
    )
    root.staging.installed = True
    os.fsync(root.staging.parent_fd)
    rebound: int | None = None
    try:
        rebound = os.open(
            root.staging.final_name,
            os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
            dir_fd=root.staging.parent_fd,
        )
        staged = os.fstat(root.staging.staging_fd)
        installed = os.fstat(rebound)
        if (staged.st_dev, staged.st_ino) != (installed.st_dev, installed.st_ino):
            raise Phase3PiqdCvc5Error("published wave identity changed")
        published_names = set(os.listdir(rebound))
        if published_names != expected_names:
            raise Phase3PiqdCvc5Error("published wave inventory changed")
        for name in published_names:
            info = os.stat(name, dir_fd=rebound, follow_symlinks=False)
            if name in {"manifest.json", "source-manifest.json"}:
                if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
                    raise Phase3PiqdCvc5Error(
                        "published wave manifest identity changed"
                    )
            elif not stat.S_ISDIR(info.st_mode):
                raise Phase3PiqdCvc5Error("published wave leaf identity changed")
    except OSError as exc:
        raise Phase3PiqdCvc5Error("cannot rebind published wave") from exc
    finally:
        if rebound is not None:
            os.close(rebound)


@dataclass(frozen=True)
class PreparedSystem:
    """Immutable source/query packet for one authenticated Phase-3 system."""

    index: int
    system_id: str
    source_record: dict[str, Any]
    source_record_bytes: bytes
    original_smt2: bytes
    query: neutral.SourceSemanticQuery


def _canonical(value: object) -> bytes:
    try:
        return json.dumps(
            value,
            ensure_ascii=False,
            allow_nan=False,
            sort_keys=True,
            separators=(",", ":"),
        ).encode("utf-8")
    except (TypeError, ValueError) as exc:
        raise Phase3PiqdCvc5Error("value is not canonical JSON") from exc


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _record(unsigned: Mapping[str, object]) -> dict[str, object]:
    payload = dict(unsigned)
    return {**payload, "record_sha256": _sha(_canonical(payload))}


def _strip_terminal_query(original: bytes) -> bytes:
    """Remove only the producer's exact terminal check/exit suffix."""

    suffix = b"(check-sat)\n(exit)\n"
    if not original.endswith(suffix) or original.count(b"(check-sat)") != 1:
        raise Phase3PiqdCvc5Error("producer SMT2 lacks the exact terminal query suffix")
    state = original[: -len(suffix)]
    if b"(exit)" in state:
        raise Phase3PiqdCvc5Error("producer SMT2 has an interior exit command")
    return state


def _variables() -> list[dict[str, str]]:
    return [
        {"id": f"{axis}-{point:02d}", "term": f"{axis}_{point}", "sort": "Real"}
        for axis in ("x", "y")
        for point in range(2, 10)
    ]


def prepare_system(
    index: int,
    item: legacy.UniqueSystem,
    source_manifest: Mapping[str, Any],
    *,
    timeout_ms: int,
) -> PreparedSystem:
    """Build and cross-bind one exact producer packet without contacting PIQD."""

    if type(index) is not int or index < 0:
        raise ValueError("index must be a nonnegative integer")
    if type(timeout_ms) is not int or not 1 <= timeout_ms <= 3_600_000:
        raise ValueError("timeout_ms must be in 1..3600000")
    original_text, counts = legacy.cvc5_backend.build_smt2(item.system, legacy.STAGE)
    if counts != EXPECTED_COUNTS or "exact_exclusions" in original_text:
        raise Phase3PiqdCvc5Error(
            "Phase-3 query is not the faithful full-convex encoding"
        )
    original = original_text.encode("utf-8")
    state = _strip_terminal_query(original)
    archived_commands = neutral.split_smt2_commands(state.decode("utf-8"))
    commands = [NL_COV_COMMAND, *archived_commands]
    if not commands or commands[0] != NL_COV_COMMAND:
        raise Phase3PiqdCvc5Error("nl-cov is not the first PIQD journal command")
    journal = b"".join(command.encode("utf-8") + b"\n" for command in commands)
    if tuple(commands[1:]) != tuple(archived_commands):
        raise Phase3PiqdCvc5Error("session journal does not preserve archived commands")

    source_record = _record(
        {
            "schema": SYSTEM_RECORD_SCHEMA,
            "index": index,
            "system_id": item.system_id,
            "semantic_sha256": _sha(_canonical(item.system)),
            "system": dict(item.system),
            "prior_z3_status": item.prior_z3_status,
            "source_leaf_count": len(item.source_leaves),
            "source_leaves": list(item.source_leaves),
            "constraint_counts": counts,
            "source_manifest_sha256": source_manifest["manifest_sha256"],
            "original_smt2_sha256": _sha(original),
            "journal_smt2_sha256": _sha(journal),
            "profile": {
                "schema": PROFILE_SCHEMA,
                "solver": "cvc5",
                "lane": "smt",
                "first_command": NL_COV_COMMAND,
                "fresh_session": True,
                "solve_count": 1,
                "workers": 1,
                "timeout_ms": timeout_ms,
            },
        }
    )
    source_bytes = _canonical(source_record) + b"\n"
    semantic = {
        "system_id": item.system_id,
        "system": dict(item.system),
        "constraint_counts": counts,
        "source_record_sha256": _sha(source_bytes),
    }
    variables = _variables()
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "phase3-survivor-cvc5", "version": "v1"},
        "semantic_verifier": {
            "id": "phase3-exact-rational-coordinate-replay",
            "version": "v1",
        },
        "stage_id": legacy.STAGE,
        "query_id": item.system_id,
        "sources": [
            {
                "path": "system-record.json",
                "bytes": len(source_bytes),
                "sha256": _sha(source_bytes),
            }
        ],
        "semantic_input": semantic,
        "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {
            "path": "query.full-convex.smt2",
            "bytes": len(original),
            "sha256": _sha(original),
        },
        "variables": variables,
        "named_atoms": [],
        "solve": {
            "assumption_ids": [],
            "readback_variable_ids": [entry["id"] for entry in variables],
            "include_model": True,
        },
        "solver_profile": {
            "schema": PROFILE_SCHEMA,
            "solvers": ["cvc5"],
            "timeout_ms": timeout_ms,
        },
    }
    descriptor_bytes = _canonical(descriptor) + b"\n"
    query = neutral.SourceSemanticQuery(
        descriptor=descriptor,
        descriptor_bytes=descriptor_bytes,
        original_smt2=original,
        journal_commands=tuple(commands),
        journal_smt2=journal,
        source_files=(neutral.SourceSnapshot("system-record.json", source_bytes),),
    )
    return PreparedSystem(
        index, item.system_id, source_record, source_bytes, original, query
    )


def _validate_prepared(prepared: PreparedSystem) -> None:
    """Recompute every local descriptor/source/query binding before transport."""

    query = prepared.query
    descriptor = query.descriptor
    source_entry = descriptor.get("sources")
    original_entry = descriptor.get("original_smt2")
    profile = descriptor.get("solver_profile")
    source_profile = prepared.source_record.get("profile")
    timeout_ms = (
        source_profile.get("timeout_ms") if type(source_profile) is dict else None
    )
    unsigned_record = dict(prepared.source_record)
    claimed_record_sha256 = unsigned_record.pop("record_sha256", None)
    semantic_input = descriptor.get("semantic_input")
    variables = _variables()
    if (
        type(timeout_ms) is not int
        or not 1 <= timeout_ms <= 3_600_000
        or query.descriptor_bytes != _canonical(descriptor) + b"\n"
        or prepared.source_record_bytes != _canonical(prepared.source_record) + b"\n"
        or claimed_record_sha256 != _sha(_canonical(unsigned_record))
        or prepared.original_smt2 != query.original_smt2
        or prepared.system_id != prepared.source_record.get("system_id")
        or prepared.system_id != descriptor.get("query_id")
        or prepared.source_record.get("constraint_counts") != EXPECTED_COUNTS
        or type(semantic_input) is not dict
        or semantic_input.get("system_id") != prepared.system_id
        or semantic_input.get("system") != prepared.source_record.get("system")
        or semantic_input.get("constraint_counts") != EXPECTED_COUNTS
        or semantic_input.get("source_record_sha256")
        != _sha(prepared.source_record_bytes)
        or descriptor.get("semantic_sha256") != _sha(_canonical(semantic_input))
        or descriptor.get("variables") != variables
        or descriptor.get("solve")
        != {
            "assumption_ids": [],
            "readback_variable_ids": [entry["id"] for entry in variables],
            "include_model": True,
        }
        or type(source_entry) is not list
        or source_entry
        != [
            {
                "path": "system-record.json",
                "bytes": len(prepared.source_record_bytes),
                "sha256": _sha(prepared.source_record_bytes),
            }
        ]
        or type(original_entry) is not dict
        or original_entry
        != {
            "path": "query.full-convex.smt2",
            "bytes": len(query.original_smt2),
            "sha256": _sha(query.original_smt2),
        }
        or profile
        != {
            "schema": PROFILE_SCHEMA,
            "solvers": ["cvc5"],
            "timeout_ms": timeout_ms,
        }
        or source_profile
        != {
            "schema": PROFILE_SCHEMA,
            "solver": "cvc5",
            "lane": "smt",
            "first_command": NL_COV_COMMAND,
            "fresh_session": True,
            "solve_count": 1,
            "workers": 1,
            "timeout_ms": timeout_ms,
        }
        or query.source_files
        != (neutral.SourceSnapshot("system-record.json", prepared.source_record_bytes),)
        or query.journal_commands[0] != NL_COV_COMMAND
        or query.journal_smt2
        != b"".join(command.encode() + b"\n" for command in query.journal_commands)
        or query.journal_commands[1:]
        != tuple(
            neutral.split_smt2_commands(
                _strip_terminal_query(query.original_smt2).decode("utf-8")
            )
        )
        or prepared.source_record.get("original_smt2_sha256")
        != _sha(query.original_smt2)
        or prepared.source_record.get("journal_smt2_sha256") != _sha(query.journal_smt2)
    ):
        raise Phase3PiqdCvc5Error("prepared source/query custody mismatch")


def _real(value: object) -> Fraction:
    if type(value) is str and _INTEGER.fullmatch(value):
        return Fraction(int(value))
    if type(value) is str and _DECIMAL.fullmatch(value):
        return Fraction(value)
    if type(value) is list and len(value) == 2 and value[0] == "-":
        return -_real(value[1])
    if type(value) is list and len(value) == 3 and value[0] == "/":
        denominator = _real(value[2])
        if denominator == 0:
            raise Phase3PiqdCvc5Error("zero denominator in cvc5 readback")
        return _real(value[1]) / denominator
    raise Phase3PiqdCvc5Error("cvc5 readback is not an exact rational value")


def _readback(raw: str, terms: Sequence[str]) -> dict[str, Fraction]:
    parsed = __import__(
        "census.p97_search.phase3_piqd_freshthird_smt_session",
        fromlist=["_parse_sexpr"],
    )._parse_sexpr(raw)
    if type(parsed) is not list or len(parsed) != len(terms):
        raise Phase3PiqdCvc5Error("cvc5 readback arity mismatch")
    result: dict[str, Fraction] = {}
    for term, pair in zip(terms, parsed, strict=True):
        if type(pair) is not list or len(pair) != 2 or pair[0] != term:
            raise Phase3PiqdCvc5Error("cvc5 readback term mismatch")
        result[term] = _real(pair[1])
    return result


def _d2(points: Mapping[int, tuple[Fraction, Fraction]], a: int, b: int) -> Fraction:
    return (points[a][0] - points[b][0]) ** 2 + (points[a][1] - points[b][1]) ** 2


def _cross(
    points: Mapping[int, tuple[Fraction, Fraction]], a: int, b: int, c: int
) -> Fraction:
    abx, aby = points[b][0] - points[a][0], points[b][1] - points[a][1]
    acx, acy = points[c][0] - points[a][0], points[c][1] - points[a][1]
    return abx * acy - aby * acx


def verify_sat_model(
    query: neutral.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> neutral.SemanticVerification:
    """Replay every Phase-3 assertion from exact rational coordinate readback."""

    if solver != "cvc5" or type(model) is not str or type(values) is not str:
        raise Phase3PiqdCvc5Error("SAT replay received the wrong solver/model shape")
    terms = query.get_values
    readback = _readback(values, terms)
    points: dict[int, tuple[Fraction, Fraction]] = {
        0: (Fraction(0), Fraction(0)),
        1: (Fraction(1), Fraction(0)),
    }
    for point in range(2, 10):
        points[point] = (readback[f"x_{point}"], readback[f"y_{point}"])
    system = query.descriptor["semantic_input"]["system"]
    for left in range(10):
        for right in range(left + 1, 10):
            if _d2(points, left, right) <= 0:
                return neutral.SemanticVerification(
                    False, {"reason": "distinctness", "pair": [left, right]}
                )
    equality_count = 0
    for row in system["rows"]:
        center, support = int(row["center"]), [int(x) for x in row["support"]]
        reference = _d2(points, center, support[0])
        for point in support[1:]:
            equality_count += 1
            if _d2(points, center, point) != reference:
                return neutral.SemanticVerification(
                    False, {"reason": "row_equality", "center": center, "point": point}
                )
    order = [int(x) for x in system["order"]]
    convex_count = 0
    for offset, left in enumerate(order):
        right = order[(offset + 1) % len(order)]
        for point in order:
            if point not in {left, right}:
                convex_count += 1
                if _cross(points, left, right, point) <= 0:
                    return neutral.SemanticVerification(
                        False,
                        {
                            "reason": "strict_convex_order",
                            "triple": [left, right, point],
                        },
                    )
    return neutral.SemanticVerification(
        True,
        {
            "system_id": query.descriptor["query_id"],
            "model_sha256": _sha(model.encode()),
            "values_sha256": _sha(values.encode()),
            "exact_rational_readback": True,
            "checks": {
                "distinctness": 45,
                "row_equalities": equality_count,
                "convex_order": convex_count,
            },
        },
    )


def run_prepared_system(
    prepared: PreparedSystem,
    output_directory: Path,
    transport: neutral.PiqdTransport,
    *,
    used_session_ids: set[str] | None = None,
) -> dict[str, object]:
    """Run one fresh cvc5 session and atomically publish its receipt packet."""

    if type(prepared) is not PreparedSystem:
        raise Phase3PiqdCvc5Error("prepared system has the wrong type")
    _validate_prepared(prepared)
    query = prepared.query
    staging = neutral._reserve_output_staging(output_directory)
    keep = False
    try:
        custody = {
            "descriptor": neutral._write_immutable(
                staging.staging_fd, "descriptor.json", query.descriptor_bytes
            ),
            "source_record": neutral._write_immutable(
                staging.staging_fd, "system-record.json", prepared.source_record_bytes
            ),
            "original_smt2": neutral._write_immutable(
                staging.staging_fd, "original.smt2", query.original_smt2
            ),
            "journal_smt2": neutral._write_immutable(
                staging.staging_fd, "journal.smt2", query.journal_smt2
            ),
        }
        try:
            engine = neutral._run_solver(
                query,
                "cvc5",
                transport,
                verify_sat_model,
                staging.staging_fd,
                used_session_ids if used_session_ids is not None else set(),
            )
        except neutral.SmtSourceAdapterError as exc:
            # Session/transport failures are leaf-local no-verdict outcomes;
            # custody and producer failures remain outside this boundary.
            message = str(exc).lower()
            if any(
                marker in message
                for marker in ("artifact", "output staging", "output tree", "immutable")
            ):
                raise
            raise Phase3PiqdSolverError(str(exc)) from exc
        result = {
            "schema": RESULT_SCHEMA,
            "system_id": prepared.system_id,
            "source_record_sha256": _sha(prepared.source_record_bytes),
            "descriptor_sha256": _sha(query.descriptor_bytes),
            "original_smt2_sha256": _sha(query.original_smt2),
            "journal_smt2_sha256": _sha(query.journal_smt2),
            "raw_status": engine["raw_status"],
            "effective_status": engine["effective_status"],
            "classification": {
                "UNSAT": "CVC5_UNSAT_DIAGNOSTIC_NOT_KERNEL_CHECKED",
                "UNKNOWN": "UNKNOWN_NO_VERDICT",
                "SAT": (
                    "SAT_SEMANTICALLY_REPLAYED_DIAGNOSTIC"
                    if engine["effective_status"] == "SAT_SEMANTICALLY_REPLAYED"
                    else "SAT_REPLAY_FAILED_NO_VERDICT"
                ),
            }[engine["raw_status"]],
            "custody": custody,
            "engine": engine,
            "claims": dict(FALSE_CLAIMS),
        }
        neutral._write_immutable(
            staging.staging_fd, "result.json", _canonical(result) + b"\n"
        )
        neutral._publish_output(staging)
        keep = True
        return result
    finally:
        neutral._close_output_staging(staging, keep=keep)


def _json_file(root_fd: int, relative: str) -> tuple[bytes, dict[str, Any]]:
    payload = _read_lane_relative(root_fd, relative, 16 * 1024 * 1024, relative)
    try:
        value = json.loads(payload)
    except (TypeError, ValueError) as exc:
        raise Phase3PiqdCvc5Error(f"invalid JSON artifact: {relative}") from exc
    if type(value) is not dict:
        raise Phase3PiqdCvc5Error(f"JSON artifact is not an object: {relative}")
    return payload, value


def _json_artifact(payload: bytes, name: str) -> dict[str, Any]:
    try:
        value = json.loads(payload)
    except (TypeError, ValueError) as exc:
        raise Phase3PiqdCvc5Error(f"invalid JSON artifact: {name}") from exc
    if type(value) is not dict:
        raise Phase3PiqdCvc5Error(f"JSON artifact is not an object: {name}")
    return value


def _validate_prepared_system_output_fd(
    prepared: PreparedSystem, root_fd: int
) -> dict[str, object]:
    """Validate one leaf solely through its already-held directory descriptor."""

    _validate_prepared(prepared)
    result_bytes, result = _json_file(root_fd, "result.json")
    if result_bytes != _canonical(result) + b"\n" or set(result) != LEAF_RESULT_KEYS:
        raise Phase3PiqdCvc5Error("result JSON schema or canonical form is invalid")
    if result["schema"] != RESULT_SCHEMA or result["system_id"] != prepared.system_id:
        raise Phase3PiqdCvc5Error("result system identity/schema mismatch")
    for field in (
        "source_record_sha256",
        "descriptor_sha256",
        "original_smt2_sha256",
        "journal_smt2_sha256",
    ):
        if not _is_sha256(result[field]):
            raise Phase3PiqdCvc5Error(f"result {field} is not a SHA-256 scalar")
    if result["claims"] != FALSE_CLAIMS or any(
        type(result["claims"].get(key)) is not bool for key in FALSE_CLAIMS
    ):
        raise Phase3PiqdCvc5Error("result claims are not fail-closed")
    custody = result["custody"]
    engine = result["engine"]
    if type(custody) is not dict or set(custody) != LEAF_CUSTODY_KEYS:
        raise Phase3PiqdCvc5Error("result custody schema is invalid")
    if type(engine) is not dict or set(engine) != LEAF_ENGINE_KEYS:
        raise Phase3PiqdCvc5Error("result engine schema is invalid")
    expected_payloads = {
        "descriptor.json": prepared.query.descriptor_bytes,
        "system-record.json": prepared.source_record_bytes,
        "original.smt2": prepared.query.original_smt2,
        "journal.smt2": prepared.query.journal_smt2,
    }
    expected_custody = {
        "descriptor": {
            "path": "descriptor.json",
            "bytes": len(prepared.query.descriptor_bytes),
            "sha256": _sha(prepared.query.descriptor_bytes),
        },
        "source_record": {
            "path": "system-record.json",
            "bytes": len(prepared.source_record_bytes),
            "sha256": _sha(prepared.source_record_bytes),
        },
        "original_smt2": {
            "path": "original.smt2",
            "bytes": len(prepared.query.original_smt2),
            "sha256": _sha(prepared.query.original_smt2),
        },
        "journal_smt2": {
            "path": "journal.smt2",
            "bytes": len(prepared.query.journal_smt2),
            "sha256": _sha(prepared.query.journal_smt2),
        },
    }
    if custody != expected_custody:
        raise Phase3PiqdCvc5Error("result custody is not independently source-derived")
    expected_names = set(expected_payloads) | {"result.json"}
    for field, payload in expected_payloads.items():
        entry = custody[
            {
                "descriptor.json": "descriptor",
                "system-record.json": "source_record",
                "original.smt2": "original_smt2",
                "journal.smt2": "journal_smt2",
            }[field]
        ]
        if (
            type(entry) is not dict
            or set(entry) != LEAF_ARTIFACT_DESCRIPTOR_KEYS
            or entry["path"] != field
            or type(entry["bytes"]) is not int
            or entry["bytes"] != len(payload)
            or entry["sha256"] != _sha(payload)
        ):
            raise Phase3PiqdCvc5Error(f"{field} custody descriptor is invalid")
        actual = _read_lane_relative(root_fd, field, 16 * 1024 * 1024, field)
        if actual != payload:
            raise Phase3PiqdCvc5Error(f"{field} custody bytes mismatch")
    artifacts = engine["artifacts"]
    if type(artifacts) is not dict:
        raise Phase3PiqdCvc5Error("engine artifacts are missing")
    artifact_bytes: dict[str, bytes] = {}
    for key, entry in artifacts.items():
        if (
            type(key) is not str
            or type(entry) is not dict
            or set(entry) != LEAF_ARTIFACT_DESCRIPTOR_KEYS
            or type(entry["path"]) is not str
            or "/" in entry["path"]
            or entry["path"].startswith(".")
            or entry["path"] in expected_names
            or type(entry["bytes"]) is not int
            or not _is_sha256(entry["sha256"])
        ):
            raise Phase3PiqdCvc5Error("engine artifact descriptor is malformed")
        name = entry["path"]
        actual = _read_lane_relative(root_fd, name, 16 * 1024 * 1024, name)
        if entry["bytes"] != len(actual) or entry["sha256"] != _sha(actual):
            raise Phase3PiqdCvc5Error(f"engine artifact hash mismatch: {name}")
        artifact_bytes[key] = actual
        expected_names.add(name)
    solve_key = "solve" if "solve" in artifact_bytes else "reconciled_solve"
    expected_artifacts = {
        "session",
        "smt2",
        "receipts_before",
        "receipts",
        solve_key,
        "closed_session",
    }
    session = _json_artifact(artifact_bytes.get("session", b""), "session")
    solve = _json_artifact(artifact_bytes.get(solve_key, b""), solve_key)
    neutral._validate_solve(solve)
    if solve["status"] == "SAT":
        expected_artifacts.add("semantic")
    if set(artifacts) != expected_artifacts:
        raise Phase3PiqdCvc5Error("engine artifact inventory is not exact")
    if set(os.listdir(root_fd)) != expected_names:
        raise Phase3PiqdCvc5Error("published leaf inventory mismatch")
    created = neutral._validate_session(
        session, solver="cvc5", label=session["label"], expected_state="live"
    )
    neutral._validate_fresh_session(created)
    receipts = _json_artifact(artifact_bytes["receipts"], "receipts")
    _, receipt = neutral._validate_receipts(
        receipts, session=created, query=prepared.query, solve=solve
    )
    if receipt is None:
        raise Phase3PiqdCvc5Error("validated solve has no durable receipt")
    receipts_before = _json_artifact(
        artifact_bytes["receipts_before"], "receipts_before"
    )
    neutral._validate_receipts(
        receipts_before,
        session=created,
        query=prepared.query,
        solve=None,
        expected_count=0,
    )
    closed = _json_artifact(artifact_bytes["closed_session"], "closed_session")
    closed_session = neutral._validate_session(
        closed, solver="cvc5", label=created["label"], expected_state="closed"
    )
    neutral._validate_closed_session(
        closed_session, created=created, query=prepared.query, solve=solve
    )
    derived_digest = neutral.piqd_result_digest(solve)
    if receipt["result_sha256"] != derived_digest:
        raise Phase3PiqdCvc5Error("solve/receipt result digest mismatch")
    derived_effective, derived_semantic = neutral._semantic_replay(
        verify_sat_model, prepared.query, "cvc5", solve
    )
    archived_semantic = (
        _json_artifact(artifact_bytes["semantic"], "semantic")
        if "semantic" in artifact_bytes
        else None
    )
    if archived_semantic != derived_semantic:
        raise Phase3PiqdCvc5Error("semantic outcome is not independently replayable")
    derived_classification = {
        "UNSAT": "CVC5_UNSAT_DIAGNOSTIC_NOT_KERNEL_CHECKED",
        "UNKNOWN": "UNKNOWN_NO_VERDICT",
        "SAT": (
            "SAT_SEMANTICALLY_REPLAYED_DIAGNOSTIC"
            if derived_effective == "SAT_SEMANTICALLY_REPLAYED"
            else "SAT_REPLAY_FAILED_NO_VERDICT"
        ),
    }[solve["status"]]
    response_lost = solve_key == "reconciled_solve"
    expected_engine = {
        "solver": "cvc5",
        "session_id": created["id"],
        "solver_signature": created["solver_signature"],
        "solver_sha256": created["solver_sha256"],
        "raw_status": solve["status"],
        "effective_status": derived_effective,
        "solve_index": solve["solve_index"],
        "result_sha256": receipt["result_sha256"],
        "response_lost": response_lost,
        "reconciled_from_receipt": response_lost,
        "result_digest_advisory": {
            "algorithm": "piqd-smt-solve-result/v1",
            "locally_recomputed": derived_digest,
            "matches_daemon": derived_digest == receipt["result_sha256"],
        },
        "unsat_assumptions": (
            neutral._unsat_assumption_provenance(prepared.query, solve)
            if solve["status"] == "UNSAT"
            else None
        ),
        "semantic_replay": derived_semantic,
        "artifacts": artifacts,
        "claims": dict(neutral.FALSE_CLAIMS),
    }
    if engine != expected_engine:
        raise Phase3PiqdCvc5Error("outer engine metadata is not artifact-derived")
    expected_outer = {
        "schema": RESULT_SCHEMA,
        "system_id": prepared.system_id,
        "source_record_sha256": _sha(prepared.source_record_bytes),
        "descriptor_sha256": _sha(prepared.query.descriptor_bytes),
        "original_smt2_sha256": _sha(prepared.query.original_smt2),
        "journal_smt2_sha256": _sha(prepared.query.journal_smt2),
        "raw_status": solve["status"],
        "effective_status": derived_effective,
        "classification": derived_classification,
        "custody": expected_custody,
        "engine": expected_engine,
        "claims": dict(FALSE_CLAIMS),
    }
    if result != expected_outer:
        raise Phase3PiqdCvc5Error("outer result fields are not artifact-derived")
    return result


def validate_prepared_system_output(
    prepared: PreparedSystem, output_directory: Path
) -> dict[str, object]:
    """Public leaf validator; the internal check uses one held leaf FD."""

    try:
        root_fd = neutral._open_directory_nofollow(output_directory)
        try:
            return _validate_prepared_system_output_fd(prepared, root_fd)
        finally:
            os.close(root_fd)
    except Phase3PiqdCvc5Error:
        raise
    except (
        KeyError,
        OSError,
        TypeError,
        ValueError,
        neutral.SmtSourceAdapterError,
    ) as exc:
        raise Phase3PiqdCvc5Error("leaf custody validation failed closed") from exc


def run_wave(
    *,
    source_dir: Path,
    out_dir: Path,
    server: str,
    workers: int,
    timeout_ms: int,
    transport: neutral.PiqdTransport | None = None,
) -> dict[str, object]:
    """Run the complete authenticated 48-system wave sequentially via PIQD."""

    if workers != 1 or type(workers) is not int:
        raise ValueError("PIQD Phase-3 cvc5 requires workers=1")
    if type(timeout_ms) is not int or not 1 <= timeout_ms <= 3_600_000:
        raise ValueError("timeout_ms must be in 1..3600000")
    authenticated = load_authenticated_current_source(source_dir)
    source_manifest = authenticated.manifest
    systems = authenticated.systems
    prepared_systems: list[PreparedSystem] = []
    for index, item in enumerate(systems):
        try:
            prepared_systems.append(
                prepare_system(index, item, source_manifest, timeout_ms=timeout_ms)
            )
        except Phase3PiqdCvc5Error:
            raise
        except (neutral.SmtSourceAdapterError, KeyError, TypeError, ValueError) as exc:
            raise Phase3PiqdCvc5Error(
                "authenticated system preparation failed closed"
            ) from exc
    recheck_authenticated_current_source(authenticated.token)
    client = transport or neutral.UrllibPiqdTransport(server)
    root = _wave_root(out_dir)
    keep = False
    try:
        _write_wave_file(
            root, "source-manifest.json", _canonical(source_manifest) + b"\n"
        )
        results: list[dict[str, object]] = []
        used_session_ids: set[str] = set()
        for index, (item, prepared) in enumerate(
            zip(systems, prepared_systems, strict=True)
        ):
            _validate_wave_root(root)
            # Producer/source failures are deliberately outside the leaf
            # solver catch: they abort the entire authenticated wave.
            result = run_prepared_system(
                prepared,
                root.path / f"{index:02d}-{item.system_id}",
                client,
                used_session_ids=used_session_ids,
            )
            results.append(
                {
                    "index": index,
                    "system_id": item.system_id,
                    "status": result["raw_status"],
                    "effective_status": result["effective_status"],
                    "classification": result["classification"],
                    "result_sha256": _sha(_canonical(result)),
                }
            )
            _validate_wave_root(root)
        recheck_authenticated_current_source(authenticated.token)
        statuses = Counter(str(row["status"]) for row in results)
        unsigned_manifest = {
            "schema": SCHEMA,
            "source_manifest_sha256": source_manifest["manifest_sha256"],
            "server": server,
            "profile": {
                "schema": PROFILE_SCHEMA,
                "solver": "cvc5",
                "lane": "smt",
                "first_command": NL_COV_COMMAND,
                "workers": 1,
                "timeout_ms": timeout_ms,
                "local_fallback": False,
            },
            "system_count": len(results),
            "status_counts": {
                key: statuses[key] for key in ("SAT", "UNSAT", "UNKNOWN", "ERROR")
            },
            "results": results,
            "claims": dict(FALSE_CLAIMS),
            "proof_blueprint": {
                "session": "019fdf9c",
                "state": "unchanged/open/off-spine",
            },
        }
        manifest = {
            **unsigned_manifest,
            "manifest_sha256": _sha(_canonical(unsigned_manifest)),
        }
        _write_wave_file(root, "manifest.json", _canonical(manifest) + b"\n")
        _publish_wave_root(
            root,
            {"source-manifest.json", "manifest.json"}
            | {
                f"{row['index']:02d}-{row['system_id']}"
                for row in results
                if row["status"] != "ERROR"
            },
        )
        keep = True
        return manifest
    finally:
        neutral._close_output_staging(root.staging, keep=keep)


def validate_wave_output(output_directory: Path, source_dir: Path) -> dict[str, object]:
    """Public offline revalidation of the exact published wave tree."""

    authenticated = load_authenticated_current_source(source_dir)
    source_manifest = authenticated.manifest
    systems = authenticated.systems
    try:
        root_fd = neutral._open_directory_nofollow(output_directory)
    except (OSError, neutral.SmtSourceAdapterError) as exc:
        raise Phase3PiqdCvc5Error(
            "published wave root cannot be opened safely"
        ) from exc
    try:
        _, initial_manifest = _json_file(root_fd, "manifest.json")
        initial_profile = initial_manifest.get("profile")
        validation_timeout_ms = (
            initial_profile.get("timeout_ms") if type(initial_profile) is dict else None
        )
        if (
            type(validation_timeout_ms) is not int
            or not 1 <= validation_timeout_ms <= 3_600_000
        ):
            raise Phase3PiqdCvc5Error("published profile timeout is invalid")
        prepared_systems: dict[int, PreparedSystem] = {}
        for index, item in enumerate(systems):
            prepared_systems[index] = prepare_system(
                index, item, source_manifest, timeout_ms=validation_timeout_ms
            )
        recheck_authenticated_current_source(authenticated.token)
    except (
        Phase3PiqdCvc5Error,
        neutral.SmtSourceAdapterError,
        KeyError,
        OSError,
        TypeError,
        ValueError,
    ) as exc:
        os.close(root_fd)
        if isinstance(exc, Phase3PiqdCvc5Error):
            raise
        raise Phase3PiqdCvc5Error(
            "authenticated system preparation failed closed"
        ) from exc
    try:
        source_bytes, published_source = _json_file(root_fd, "source-manifest.json")
        if (
            source_bytes != _canonical(published_source) + b"\n"
            or published_source != source_manifest
        ):
            raise Phase3PiqdCvc5Error("published source manifest is not authenticated")
        manifest_bytes, manifest = _json_file(root_fd, "manifest.json")
        if manifest_bytes != _canonical(manifest) + b"\n":
            raise Phase3PiqdCvc5Error("published wave manifest is not canonical")
        unsigned = dict(manifest)
        claimed = unsigned.pop("manifest_sha256", None)
        if set(manifest) != WAVE_MANIFEST_KEYS or not _is_sha256(claimed):
            raise Phase3PiqdCvc5Error("published wave manifest schema is not strict")
        if claimed != _sha(_canonical(unsigned)):
            raise Phase3PiqdCvc5Error("published wave manifest self-hash mismatch")
        profile = manifest.get("profile")
        status_counts = manifest.get("status_counts")
        blueprint = manifest.get("proof_blueprint")
        claims = manifest.get("claims")
        if (
            type(profile) is not dict
            or set(profile) != WAVE_PROFILE_KEYS
            or profile.get("schema") != PROFILE_SCHEMA
            or profile.get("solver") != "cvc5"
            or profile.get("lane") != "smt"
            or profile.get("first_command") != NL_COV_COMMAND
            or type(profile.get("workers")) is not int
            or profile.get("workers") != 1
            or type(profile.get("timeout_ms")) is not int
            or not 1 <= profile.get("timeout_ms") <= 3_600_000
            or type(profile.get("local_fallback")) is not bool
            or profile.get("local_fallback") is not False
            or type(manifest.get("server")) is not str
            or not manifest.get("server")
            or not _is_sha256(manifest.get("source_manifest_sha256"))
            or manifest.get("source_manifest_sha256")
            != source_manifest["manifest_sha256"]
            or type(manifest.get("system_count")) is not int
            or type(status_counts) is not dict
            or set(status_counts) != set(BACKEND_STATUSES)
            or any(
                type(status_counts[key]) is not int or status_counts[key] < 0
                for key in BACKEND_STATUSES
            )
            or type(claims) is not dict
            or set(claims) != set(FALSE_CLAIMS)
            or any(type(claims[key]) is not bool for key in FALSE_CLAIMS)
            or claims != FALSE_CLAIMS
            or blueprint != {"session": "019fdf9c", "state": "unchanged/open/off-spine"}
        ):
            raise Phase3PiqdCvc5Error(
                "published wave manifest scalar schema is invalid"
            )
        rows = manifest.get("results")
        if (
            manifest.get("schema") != SCHEMA
            or type(rows) is not list
            or type(manifest.get("system_count")) is not int
            or manifest["system_count"] != len(systems)
            or len(rows) != len(systems)
        ):
            raise Phase3PiqdCvc5Error("published wave manifest has wrong system count")
        expected_names = {"source-manifest.json", "manifest.json"}
        seen: set[str] = set()
        seen_indices: set[int] = set()
        for row in rows:
            if (
                type(row) is not dict
                or type(row.get("index")) is not int
                or type(row.get("system_id")) is not str
            ):
                raise Phase3PiqdCvc5Error("published result row is malformed")
            if not 0 <= row["index"] < len(systems) or row["index"] in seen_indices:
                raise Phase3PiqdCvc5Error("published result index set is not canonical")
            seen_indices.add(row["index"])
            system_id = row["system_id"]
            if systems[row["index"]].system_id != system_id:
                raise Phase3PiqdCvc5Error(
                    "published result index/system pairing is not canonical"
                )
            if system_id in seen:
                raise Phase3PiqdCvc5Error(
                    "published result identity is not the authenticated 48-system set"
                )
            seen.add(system_id)
            child_name = f"{row['index']:02d}-{system_id}"
            status = row.get("status")
            if status in {"SAT", "UNSAT", "UNKNOWN"}:
                if set(row) != WAVE_RESULT_KEYS or not _is_sha256(
                    row.get("result_sha256")
                ):
                    raise Phase3PiqdCvc5Error("published result schema is invalid")
                expected_classification = {
                    "SAT": {
                        "SAT_SEMANTICALLY_REPLAYED_DIAGNOSTIC",
                        "SAT_REPLAY_FAILED_NO_VERDICT",
                    },
                    "UNSAT": {"CVC5_UNSAT_DIAGNOSTIC_NOT_KERNEL_CHECKED"},
                    "UNKNOWN": {"UNKNOWN_NO_VERDICT"},
                }[status]
                expected_effective = {
                    "SAT": {
                        "SAT_SEMANTICALLY_REPLAYED",
                        "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED",
                        "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE",
                    },
                    "UNSAT": {"UNSAT_DISCOVERY_ONLY"},
                    "UNKNOWN": {"INCONCLUSIVE_UNKNOWN"},
                }[status]
                if (
                    row.get("effective_status") not in expected_effective
                    or row.get("classification") not in expected_classification
                ):
                    raise Phase3PiqdCvc5Error(
                        "published result scalar schema is invalid"
                    )
            else:
                raise Phase3PiqdCvc5Error("published result status is invalid")
            prepared = prepared_systems[row["index"]]
            child_fd = _open_lane_child(root_fd, child_name)
            try:
                result = _validate_prepared_system_output_fd(prepared, child_fd)
            except (
                neutral.SmtSourceAdapterError,
                KeyError,
                OSError,
                TypeError,
                ValueError,
            ) as exc:
                raise Phase3PiqdCvc5Error(
                    "published leaf validation failed closed"
                ) from exc
            finally:
                os.close(child_fd)
            if (
                row.get("status") != result.get("raw_status")
                or row.get("effective_status") != result.get("effective_status")
                or row.get("classification") != result.get("classification")
                or row.get("result_sha256") != _sha(_canonical(result))
            ):
                raise Phase3PiqdCvc5Error("published result summary hash mismatch")
            expected_names.add(child_name)
        if seen != {item.system_id for item in systems}:
            raise Phase3PiqdCvc5Error("published wave omits an authenticated system")
        if seen_indices != set(range(len(systems))):
            raise Phase3PiqdCvc5Error("published wave index set is incomplete")
        actual_names = set(os.listdir(root_fd))
        if any(name.startswith(".piqd-smt-tombstone-") for name in actual_names):
            raise Phase3PiqdCvc5Error(
                "published wave contains an unbound solver tombstone"
            )
        if actual_names != expected_names:
            raise Phase3PiqdCvc5Error("published wave inventory is not exact")
        counts = Counter(str(row.get("status")) for row in rows)
        if manifest.get("status_counts") != {
            key: counts[key] for key in ("SAT", "UNSAT", "UNKNOWN", "ERROR")
        }:
            raise Phase3PiqdCvc5Error("published status counts mismatch")
        recheck_authenticated_current_source(authenticated.token)
        return manifest
    except (
        OSError,
        neutral.SmtSourceAdapterError,
        KeyError,
        TypeError,
        ValueError,
    ) as exc:
        raise Phase3PiqdCvc5Error("published wave validation failed closed") from exc
    finally:
        os.close(root_fd)


def _parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=DEFAULT_SOURCE)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT)
    parser.add_argument("--piqd-url", default="http://127.0.0.1:7272")
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--timeout", type=float, default=120.0)
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> int:
    args = _parse_args(argv)
    if not math.isfinite(args.timeout) or args.timeout <= 0:
        print("phase3 PIQD survivor cvc5 failed: timeout must be finite and positive")
        return 2
    try:
        manifest = run_wave(
            source_dir=args.source,
            out_dir=args.out,
            server=args.piqd_url,
            workers=args.workers,
            timeout_ms=max(1, int(args.timeout * 1000)),
        )
    except (
        OSError,
        ValueError,
        Phase3PiqdCvc5Error,
        neutral.SmtSourceAdapterError,
    ) as exc:
        print(f"phase3 PIQD survivor cvc5 failed: {exc}")
        return 2
    print(json.dumps(manifest["status_counts"], sort_keys=True))
    return 0 if manifest["status_counts"]["ERROR"] == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())
