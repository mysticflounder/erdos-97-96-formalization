#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Join exact-13 clause provenance to an independently verified LRAT core."""

from __future__ import annotations

import argparse
import ctypes
import hashlib
import json
import os
import secrets
import stat
import sys
from collections import Counter
from pathlib import Path, PurePosixPath
from typing import Any

import extract_lrat_verified_core as core

SCHEMA = "cardge13-verified-core-provenance-projection/v1"
ROW_SCHEMA = "cardge13-verified-core-clause-provenance/v1"
CONVERSION_SCHEMA = "cardge13-literal-qfuf-dimacs/v2"
PROVENANCE_SCHEMA = "cardge13-literal-qfuf-clause-provenance/v1"
CORE_SCHEMA = "lrat-verified-core-extraction/v1"
HEX_DIGITS = frozenset("0123456789abcdef")
EXPECTED_VARIABLE_COUNT = 286
EXPECTED_FULL_CLAUSE_COUNT = 51_580
EXPECTED_CORE_CLAUSE_COUNT = 4_767
EXPECTED_ORIENTATION = "direct"
EXPECTED_ORDER = [2, 8, 9, 10, 11, 12, 1, 3, 4, 5, 0, 6, 7]
EXPECTED_ROLE_PINS = {"b0": 9, "b1": 2, "d": 7, "s0": 4, "s1": 3, "z": 9}
EXPECTED_ROW_PINS = {"C0": [2, 4, 6, 11]}


class ProjectionError(ValueError):
    """An input custody, clause identity, or projection invariant failed."""


def canonical_json_bytes(value: object) -> bytes:
    """Encode one value using the repository's canonical JSON convention."""
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def sha256_bytes(payload: bytes) -> str:
    """Return the lowercase SHA-256 digest of bytes."""
    return hashlib.sha256(payload).hexdigest()


def is_sha256(value: object) -> bool:
    """Recognize a lowercase hexadecimal SHA-256 digest."""
    return (
        isinstance(value, str)
        and len(value) == 64
        and all(character in HEX_DIGITS for character in value)
    )


def reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    """Build one JSON object while rejecting duplicate keys."""
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ProjectionError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def load_json_object(payload: bytes, label: str) -> dict[str, Any]:
    """Decode one strict UTF-8 JSON object."""
    try:
        value = json.loads(payload, object_pairs_hook=reject_duplicate_keys)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise ProjectionError(f"{label} is not strict UTF-8 JSON") from exc
    if not isinstance(value, dict):
        raise ProjectionError(f"{label} is not a JSON object")
    return value


def validate_self_hash(value: dict[str, Any], field: str, label: str) -> str:
    """Validate a canonical JSON self-hash that omits its own field."""
    digest = value.get(field)
    if not is_sha256(digest):
        raise ProjectionError(f"{label} has malformed {field}")
    unsigned = {key: item for key, item in value.items() if key != field}
    expected = sha256_bytes(canonical_json_bytes(unsigned))
    if digest != expected:
        raise ProjectionError(f"{label} {field} mismatch")
    return digest


def read_regular_unique_fd(descriptor: int, label: str) -> bytes:
    """Read one already-open unique regular file and reject in-place mutation."""
    before = os.fstat(descriptor)
    if not stat.S_ISREG(before.st_mode):
        raise ProjectionError(f"{label} is not a regular file")
    if before.st_nlink != 1:
        raise ProjectionError(f"{label} is not a unique file")
    blocks: list[bytes] = []
    while block := os.read(descriptor, 1024 * 1024):
        blocks.append(block)
    payload = b"".join(blocks)
    after = os.fstat(descriptor)
    identity_before = (
        before.st_dev,
        before.st_ino,
        before.st_size,
        before.st_mtime_ns,
        before.st_ctime_ns,
        before.st_nlink,
    )
    identity_after = (
        after.st_dev,
        after.st_ino,
        after.st_size,
        after.st_mtime_ns,
        after.st_ctime_ns,
        after.st_nlink,
    )
    if identity_before != identity_after or len(payload) != before.st_size:
        raise ProjectionError(f"{label} changed while it was read")
    return payload


def open_flags(*, directory: bool = False) -> int:
    """Return read-only close-on-exec, no-follow flags for a file or directory."""
    flags = os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0)
    if directory:
        flags |= getattr(os, "O_DIRECTORY", 0)
    return flags


def open_under_root(repo_root: Path, path: Path, label: str, *, directory: bool) -> int:
    """Open a repository entry component-by-component without following symlinks."""
    try:
        relative = path.relative_to(repo_root)
    except ValueError as exc:
        raise ProjectionError(f"{label} escapes the repository root") from exc
    if not relative.parts:
        if not directory:
            raise ProjectionError(f"{label} names the repository directory")
        return os.open(repo_root, open_flags(directory=True))
    parent = os.open(repo_root, open_flags(directory=True))
    try:
        for part in relative.parts[:-1]:
            child = os.open(part, open_flags(directory=True), dir_fd=parent)
            os.close(parent)
            parent = child
        descriptor = os.open(
            relative.parts[-1], open_flags(directory=directory), dir_fd=parent
        )
    except OSError as exc:
        raise ProjectionError(f"cannot securely open {label}: {path}") from exc
    finally:
        os.close(parent)
    return descriptor


def capture_file(path: Path, label: str, repo_root: Path | None = None) -> bytes:
    """Capture one unique regular file through a no-follow descriptor."""
    descriptor: int
    if repo_root is not None:
        try:
            path.relative_to(repo_root)
        except ValueError:
            descriptor = os.open(path, open_flags())
        else:
            descriptor = open_under_root(repo_root, path, label, directory=False)
    else:
        descriptor = os.open(path, open_flags())
    try:
        return read_regular_unique_fd(descriptor, label)
    except OSError as exc:
        raise ProjectionError(f"cannot read {label}: {path}") from exc
    finally:
        os.close(descriptor)


def repository_input_path(repo_root: Path, path: Path, label: str) -> Path:
    """Normalize a lexical path and require repository containment."""
    raw_path = os.fspath(path)
    if any(ord(character) < 32 or ord(character) == 127 for character in raw_path):
        raise ProjectionError(f"{label} path contains a control character")
    candidate = path if path.is_absolute() else repo_root / path
    candidate = Path(os.path.abspath(candidate))
    try:
        candidate.relative_to(repo_root)
    except ValueError as exc:
        raise ProjectionError(f"{label} escapes the repository root") from exc
    return candidate


def validate_relative_path(value: object, label: str) -> PurePosixPath:
    """Validate one normalized repository-relative POSIX path."""
    if not isinstance(value, str) or not value:
        raise ProjectionError(f"{label} path is malformed")
    if any(ord(character) < 32 or ord(character) == 127 for character in value):
        raise ProjectionError(f"{label} path contains a control character")
    path = PurePosixPath(value)
    if path.is_absolute() or ".." in path.parts or "." in path.parts:
        raise ProjectionError(f"{label} path is not normalized repository-relative")
    if str(path) != value:
        raise ProjectionError(f"{label} path is not canonical POSIX")
    return path


def relative_repo_path(repo_root: Path, path: Path, label: str) -> str:
    """Return the normalized repository-relative name of an explicit path."""
    try:
        relative = path.relative_to(repo_root)
    except ValueError as exc:
        raise ProjectionError(f"{label} escapes the repository root") from exc
    return relative.as_posix()


def validate_artifact_record(
    *,
    repo_root: Path,
    record: object,
    explicit_path: Path,
    payload: bytes,
    label: str,
    extra_keys: frozenset[str] = frozenset(),
) -> None:
    """Bind a manifest artifact record to an explicit captured input."""
    if not isinstance(record, dict):
        raise ProjectionError(f"{label} artifact record is malformed")
    allowed_keys = {"path", "sha256", "byte_count"} | extra_keys
    if not {"path", "sha256"} <= set(record) or not set(record) <= allowed_keys:
        raise ProjectionError(f"{label} artifact record keys are malformed")
    recorded_path = validate_relative_path(record.get("path"), label)
    expected_relative = relative_repo_path(repo_root, explicit_path, label)
    if str(recorded_path) != expected_relative:
        raise ProjectionError(f"{label} recorded path differs from explicit input")
    digest = record.get("sha256")
    if not is_sha256(digest) or digest != sha256_bytes(payload):
        raise ProjectionError(f"{label} SHA-256 mismatch")
    byte_count = record.get("byte_count")
    if byte_count is not None and byte_count != len(payload):
        raise ProjectionError(f"{label} byte count mismatch")


def capture_recorded_artifact(
    *, repo_root: Path, record: object, label: str
) -> tuple[Path, bytes]:
    """Resolve, securely capture, and validate one receipt-selected artifact."""
    if not isinstance(record, dict):
        raise ProjectionError(f"{label} artifact record is malformed")
    relative = validate_relative_path(record.get("path"), label)
    path = repository_input_path(repo_root, Path(*relative.parts), label)
    payload = capture_file(path, label, repo_root)
    validate_artifact_record(
        repo_root=repo_root,
        record=record,
        explicit_path=path,
        payload=payload,
        label=label,
    )
    return path, payload


def validate_expected_dimensions(
    *,
    conversion: dict[str, Any],
    variable_count: int,
    full_clause_count: int,
    core_clause_count: int,
    expected_variable_count: int,
    expected_full_clause_count: int,
    expected_core_clause_count: int,
    expected_orientation: str,
    expected_order: list[int],
    expected_role_pins: dict[str, int],
    expected_row_pins: dict[str, list[int]],
) -> None:
    """Bind the generic join machinery to one exact CardGe13 fixed-cell claim."""
    if variable_count != expected_variable_count:
        raise ProjectionError("variable count differs from the fixed claim")
    if full_clause_count != expected_full_clause_count:
        raise ProjectionError("full clause count differs from the fixed claim")
    if core_clause_count != expected_core_clause_count:
        raise ProjectionError("core clause count differs from the fixed claim")
    if conversion.get("orientation") != expected_orientation:
        raise ProjectionError("orientation differs from the fixed claim")
    if conversion.get("order") != expected_order:
        raise ProjectionError("cyclic order differs from the fixed claim")
    if conversion.get("role_pins") != expected_role_pins:
        raise ProjectionError("role pins differ from the fixed claim")
    if conversion.get("row_pins") != expected_row_pins:
        raise ProjectionError("row pins differ from the fixed claim")


def validate_run_manifest(
    *,
    repo_root: Path,
    manifest: dict[str, Any],
    explicit_paths: dict[str, Path],
    snapshots: dict[Path, bytes],
) -> str:
    """Require the governed run manifest to anchor every source and parent artifact."""
    if manifest.get("schema") != "worktree-run-manifest/v1":
        raise ProjectionError("run manifest schema mismatch")
    digest = validate_self_hash(manifest, "manifest_sha256", "run manifest")
    input_digests = manifest.get("input_digests")
    source_digests = manifest.get("source_digests")
    if not isinstance(input_digests, dict) or not isinstance(source_digests, dict):
        raise ProjectionError("run manifest digest maps are malformed")
    for label, path in explicit_paths.items():
        if label in {"run_manifest", "generator", "replay_checker"}:
            continue
        relative = relative_repo_path(repo_root, path, label)
        if input_digests.get(relative) != sha256_bytes(snapshots[path]):
            raise ProjectionError(f"run manifest does not anchor {label}")
    for label in ("generator", "replay_checker"):
        path = explicit_paths[label]
        try:
            source_key = relative_repo_path(repo_root, path, label)
        except ProjectionError:
            source_key = str(path)
        if source_digests.get(source_key) != sha256_bytes(snapshots[path]):
            raise ProjectionError(f"run manifest does not anchor {label}")
    return digest


def parse_dimacs(payload: bytes, label: str) -> tuple[int, tuple[tuple[int, ...], ...]]:
    """Parse strict DIMACS bytes while preserving literal and clause order."""
    try:
        text = payload.decode("ascii")
    except UnicodeDecodeError as exc:
        raise ProjectionError(f"{label} is not ASCII DIMACS") from exc
    if "\r" in text:
        raise ProjectionError(f"{label} contains carriage returns")
    header: tuple[int, int] | None = None
    clauses: list[tuple[int, ...]] = []
    pending: list[int] = []
    polarities: dict[int, int] = {}
    for line_number, line in enumerate(text.splitlines(), 1):
        stripped = line.strip()
        if not stripped or stripped.startswith("c"):
            continue
        fields = stripped.split()
        if fields[0] == "p":
            if header is not None:
                raise ProjectionError(f"{label} has a duplicate DIMACS header")
            if len(fields) != 4 or fields[1] != "cnf":
                raise ProjectionError(f"{label} has a malformed header on line {line_number}")
            try:
                variable_count, clause_count = int(fields[2]), int(fields[3])
            except ValueError as exc:
                raise ProjectionError(f"{label} has non-integer header counts") from exc
            if variable_count <= 0 or clause_count <= 0:
                raise ProjectionError(f"{label} has non-positive header counts")
            header = (variable_count, clause_count)
            continue
        if header is None:
            raise ProjectionError(f"{label} has a clause before its header")
        for field in fields:
            try:
                literal = int(field)
            except ValueError as exc:
                raise ProjectionError(
                    f"{label} has a non-integer token on line {line_number}"
                ) from exc
            if literal == 0:
                clauses.append(tuple(pending))
                pending.clear()
                polarities.clear()
                continue
            if abs(literal) > header[0]:
                raise ProjectionError(f"{label} has an out-of-range literal")
            variable = abs(literal)
            polarity = 1 if literal > 0 else -1
            previous = polarities.get(variable)
            if previous == polarity:
                raise ProjectionError(f"{label} has a duplicate literal")
            if previous is not None:
                raise ProjectionError(f"{label} has a tautological clause")
            polarities[variable] = polarity
            pending.append(literal)
    if header is None:
        raise ProjectionError(f"{label} has no DIMACS header")
    if pending:
        raise ProjectionError(f"{label} has an unterminated final clause")
    if len(clauses) != header[1]:
        raise ProjectionError(f"{label} clause count differs from its header")
    return header[0], tuple(clauses)


def parse_canonical_jsonl(payload: bytes, label: str) -> list[dict[str, Any]]:
    """Parse canonical LF-terminated JSON-object lines."""
    if not payload or not payload.endswith(b"\n") or b"\r" in payload:
        raise ProjectionError(f"{label} is not nonempty LF-terminated JSONL")
    rows: list[dict[str, Any]] = []
    for line_number, line in enumerate(payload[:-1].split(b"\n"), 1):
        if not line:
            raise ProjectionError(f"{label} has a blank line at {line_number}")
        row = load_json_object(line, f"{label} line {line_number}")
        if canonical_json_bytes(row) != line:
            raise ProjectionError(f"{label} line {line_number} is not canonical JSON")
        rows.append(row)
    return rows


def literal_body_sha256(clause: tuple[int, ...]) -> str:
    """Hash one clause body without its DIMACS terminator."""
    return sha256_bytes(" ".join(map(str, clause)).encode("ascii"))


def validate_variables(manifest: dict[str, Any], variable_count: int) -> None:
    """Validate the converter's dense variable map."""
    variables = manifest.get("variables")
    if not isinstance(variables, list) or len(variables) != variable_count:
        raise ProjectionError("conversion variable map count mismatch")
    symbols: set[str] = set()
    for expected_id, row in enumerate(variables, 1):
        dimacs_id = row.get("dimacs") if isinstance(row, dict) else None
        if (
            not isinstance(row, dict)
            or isinstance(dimacs_id, bool)
            or not isinstance(dimacs_id, int)
            or dimacs_id != expected_id
        ):
            raise ProjectionError("conversion variable map is not densely ordered")
        symbol = row.get("symbol")
        if not isinstance(symbol, str) or not symbol or symbol in symbols:
            raise ProjectionError("conversion variable map has a malformed symbol")
        symbols.add(symbol)


def validate_provenance(
    rows: list[dict[str, Any]],
    clauses: tuple[tuple[int, ...], ...],
) -> tuple[Counter[str], Counter[str], Counter[str]]:
    """Validate every source-provenance row against its original clause."""
    if len(rows) != len(clauses):
        raise ProjectionError("provenance row count differs from full CNF")
    families: Counter[str] = Counter()
    subtypes: Counter[str] = Counter()
    conflict_kinds: Counter[str] = Counter()
    expected_keys = {
        "schema",
        "original_clause_id",
        "assertion_ordinal",
        "assertion",
        "assertion_sha256",
        "journal_locator",
        "orientation",
        "order",
        "literals",
        "literal_body_sha256",
        "origin",
    }
    for original_id, (row, clause) in enumerate(zip(rows, clauses, strict=True), 1):
        if set(row) != expected_keys:
            raise ProjectionError(f"provenance row {original_id} has unexpected keys")
        if row.get("schema") != PROVENANCE_SCHEMA:
            raise ProjectionError(f"provenance row {original_id} has wrong schema")
        row_original_id = row.get("original_clause_id")
        if (
            isinstance(row_original_id, bool)
            or not isinstance(row_original_id, int)
            or row_original_id != original_id
        ):
            raise ProjectionError("provenance original clause IDs are not dense")
        assertion_ordinal = row.get("assertion_ordinal")
        if (
            isinstance(assertion_ordinal, bool)
            or not isinstance(assertion_ordinal, int)
            or assertion_ordinal != original_id - 1
        ):
            raise ProjectionError("provenance assertion ordinals are not dense")
        literals = row.get("literals")
        if (
            not isinstance(literals, list)
            or any(
                isinstance(literal, bool) or not isinstance(literal, int)
                for literal in literals
            )
            or tuple(literals) != clause
        ):
            raise ProjectionError(f"provenance literals differ at clause {original_id}")
        if row.get("literal_body_sha256") != literal_body_sha256(clause):
            raise ProjectionError(f"provenance literal digest differs at clause {original_id}")
        origin = row.get("origin")
        if not isinstance(origin, dict):
            raise ProjectionError(f"provenance origin is malformed at clause {original_id}")
        family, subtype = origin.get("family"), origin.get("subtype")
        if not isinstance(family, str) or not isinstance(subtype, str):
            raise ProjectionError(f"provenance origin labels are malformed at {original_id}")
        families[family] += 1
        subtypes[subtype] += 1
        conflict_kind = origin.get("linear_conflict_kind")
        if conflict_kind is not None:
            if not isinstance(conflict_kind, str):
                raise ProjectionError(f"conflict kind is malformed at clause {original_id}")
            conflict_kinds[conflict_kind] += 1
    return families, subtypes, conflict_kinds


def validate_core_map(
    rows: list[dict[str, Any]],
    full_clauses: tuple[tuple[int, ...], ...],
    dense_clauses: tuple[tuple[int, ...], ...],
) -> tuple[int, ...]:
    """Validate dense core IDs, original IDs, digests, and exact clauses."""
    if len(rows) != len(dense_clauses):
        raise ProjectionError("core map count differs from dense core CNF")
    originals: list[int] = []
    previous = 0
    expected_keys = {"core_clause_id", "original_clause_id", "literal_body_sha256"}
    for dense_id, (row, dense_clause) in enumerate(zip(rows, dense_clauses, strict=True), 1):
        core_clause_id = row.get("core_clause_id")
        if (
            set(row) != expected_keys
            or isinstance(core_clause_id, bool)
            or not isinstance(core_clause_id, int)
            or core_clause_id != dense_id
        ):
            raise ProjectionError("core map rows are malformed or not densely ordered")
        original_id = row.get("original_clause_id")
        if (
            isinstance(original_id, bool)
            or not isinstance(original_id, int)
            or not 1 <= original_id <= len(full_clauses)
            or original_id <= previous
        ):
            raise ProjectionError("core map original IDs are invalid or unordered")
        original_clause = full_clauses[original_id - 1]
        if dense_clause != original_clause:
            raise ProjectionError(f"dense core clause {dense_id} differs from original")
        digest = literal_body_sha256(original_clause)
        if row.get("literal_body_sha256") != digest:
            raise ProjectionError(f"core map literal digest differs at clause {dense_id}")
        originals.append(original_id)
        previous = original_id
    return tuple(originals)


def counter_json(counter: Counter[str]) -> dict[str, int]:
    """Render a stable string counter."""
    return dict(sorted(counter.items()))


def artifact_record(repo_root: Path, path: Path, payload: bytes) -> dict[str, object]:
    """Describe one repository-local captured or emitted artifact."""
    return {
        "path": relative_repo_path(repo_root, path, str(path)),
        "sha256": sha256_bytes(payload),
        "byte_count": len(payload),
    }


def write_fsynced_at(directory_fd: int, name: str, payload: bytes) -> None:
    """Create and fsync one output file relative to a held directory."""
    flags = (
        os.O_WRONLY
        | os.O_CREAT
        | os.O_EXCL
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    descriptor = os.open(name, flags, 0o600, dir_fd=directory_fd)
    try:
        view = memoryview(payload)
        while view:
            written = os.write(descriptor, view)
            view = view[written:]
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def rename_directory_exclusive_at(parent_fd: int, source: str, target: str) -> None:
    """Atomically publish one child directory without replacing its sibling."""
    libc = ctypes.CDLL(None, use_errno=True)
    encoded_source = os.fsencode(source)
    encoded_target = os.fsencode(target)
    if sys.platform == "darwin":
        renameatx = libc.renameatx_np
        renameatx.argtypes = [
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_uint,
        ]
        renameatx.restype = ctypes.c_int
        result = renameatx(parent_fd, encoded_source, parent_fd, encoded_target, 0x00000004)
    elif sys.platform.startswith("linux") and hasattr(libc, "renameat2"):
        renameat2 = libc.renameat2
        renameat2.argtypes = [
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_uint,
        ]
        renameat2.restype = ctypes.c_int
        result = renameat2(
            parent_fd, encoded_source, parent_fd, encoded_target, 0x00000001
        )
    else:
        raise ProjectionError("atomic no-replace directory publication is unavailable")
    if result != 0:
        error_number = ctypes.get_errno()
        raise OSError(error_number, os.strerror(error_number), target)


def create_staging_directory(parent_fd: int, target_name: str) -> tuple[str, int]:
    """Create one unpredictable private staging directory under a held parent."""
    for _attempt in range(100):
        name = f".{target_name}.{secrets.token_hex(12)}.tmp"
        try:
            os.mkdir(name, 0o700, dir_fd=parent_fd)
        except FileExistsError:
            continue
        descriptor = os.open(name, open_flags(directory=True), dir_fd=parent_fd)
        return name, descriptor
    raise ProjectionError("could not allocate a unique staging directory")


def cleanup_staging(parent_fd: int, staging_name: str, staging_fd: int) -> None:
    """Remove only the two files and private directory created by this attempt."""
    for name in (
        "core-provenance.jsonl",
        "receipt.json",
        "replay-dense-core.cnf",
        "replay-dense-core.lrat",
    ):
        try:
            os.unlink(name, dir_fd=staging_fd)
        except FileNotFoundError:
            pass
    os.rmdir(staging_name, dir_fd=parent_fd)


def fsync_parent(parent_fd: int) -> None:
    """Persist publication in the held output parent directory."""
    os.fsync(parent_fd)


def assert_directory_path_unchanged(repo_root: Path, path: Path, held_fd: int) -> None:
    """Require an output parent path to still name the held directory inode."""
    check_fd = open_under_root(repo_root, path, "output parent directory", directory=True)
    try:
        held = os.fstat(held_fd)
        current = os.fstat(check_fd)
        if (held.st_dev, held.st_ino) != (current.st_dev, current.st_ino):
            raise ProjectionError("output parent directory changed during projection")
    finally:
        os.close(check_fd)


def assert_snapshots_unchanged(
    snapshots: dict[Path, bytes], repo_root: Path | None = None
) -> None:
    """Recheck every input and source byte immediately before publication."""
    for path, expected in snapshots.items():
        if capture_file(path, str(path), repo_root) != expected:
            raise ProjectionError(f"input changed during projection: {path}")


def project_core_provenance(
    *,
    repo_root: Path,
    conversion_manifest_path: Path,
    v2_cnf_path: Path,
    provenance_path: Path,
    core_receipt_path: Path,
    core_map_path: Path,
    dense_core_cnf_path: Path,
    run_manifest_path: Path,
    output_dir: Path,
    expected_variable_count: int = EXPECTED_VARIABLE_COUNT,
    expected_full_clause_count: int = EXPECTED_FULL_CLAUSE_COUNT,
    expected_core_clause_count: int = EXPECTED_CORE_CLAUSE_COUNT,
    expected_orientation: str = EXPECTED_ORIENTATION,
    expected_order: list[int] = EXPECTED_ORDER,
    expected_role_pins: dict[str, int] = EXPECTED_ROLE_PINS,
    expected_row_pins: dict[str, list[int]] = EXPECTED_ROW_PINS,
) -> dict[str, Any]:
    """Validate both custody chains and publish the joined core provenance."""
    repo_root = repo_root.resolve()
    explicit_paths = {
        "conversion_manifest": repository_input_path(
            repo_root, conversion_manifest_path, "conversion manifest"
        ),
        "v2_cnf": repository_input_path(repo_root, v2_cnf_path, "v2 CNF"),
        "provenance": repository_input_path(repo_root, provenance_path, "provenance"),
        "core_receipt": repository_input_path(
            repo_root, core_receipt_path, "core receipt"
        ),
        "core_map": repository_input_path(repo_root, core_map_path, "core map"),
        "dense_core_cnf": repository_input_path(
            repo_root, dense_core_cnf_path, "dense core CNF"
        ),
        "run_manifest": repository_input_path(
            repo_root, run_manifest_path, "run manifest"
        ),
        "generator": Path(os.path.abspath(__file__)),
        "replay_checker": Path(os.path.abspath(core.__file__)),
    }
    snapshots = {
        path: capture_file(path, label, repo_root)
        for label, path in explicit_paths.items()
    }
    conversion = load_json_object(
        snapshots[explicit_paths["conversion_manifest"]], "conversion manifest"
    )
    if conversion.get("schema") != CONVERSION_SCHEMA:
        raise ProjectionError("conversion manifest schema mismatch")
    conversion_self_hash = validate_self_hash(
        conversion, "manifest_sha256", "conversion manifest"
    )
    validate_artifact_record(
        repo_root=repo_root,
        record=conversion.get("dimacs"),
        explicit_path=explicit_paths["v2_cnf"],
        payload=snapshots[explicit_paths["v2_cnf"]],
        label="conversion DIMACS",
        extra_keys=frozenset({"variable_count", "clause_count"}),
    )
    validate_artifact_record(
        repo_root=repo_root,
        record=conversion.get("clause_provenance"),
        explicit_path=explicit_paths["provenance"],
        payload=snapshots[explicit_paths["provenance"]],
        label="conversion provenance",
    )

    core_receipt = load_json_object(
        snapshots[explicit_paths["core_receipt"]], "core receipt"
    )
    if core_receipt.get("schema") != CORE_SCHEMA:
        raise ProjectionError("core receipt schema mismatch")
    core_receipt_self_hash = validate_self_hash(core_receipt, "receipt_sha256", "core receipt")
    inputs = core_receipt.get("inputs")
    outputs = core_receipt.get("outputs")
    if not isinstance(inputs, dict) or not isinstance(outputs, dict):
        raise ProjectionError("core receipt artifact maps are malformed")
    if set(inputs) != {"full_cnf", "raw_lrat", "core_cnf", "trace"}:
        raise ProjectionError("core receipt input artifact set is incomplete")
    if set(outputs) != {"core_clause_map", "dense_core_cnf", "dense_core_lrat"}:
        raise ProjectionError("core receipt output artifact set is incomplete")
    full_cnf_record = inputs.get("full_cnf")
    if not isinstance(full_cnf_record, dict):
        raise ProjectionError("core receipt lacks the full CNF record")
    full_cnf_relative = validate_relative_path(full_cnf_record.get("path"), "core full CNF")
    full_cnf_path = repository_input_path(
        repo_root, Path(*full_cnf_relative.parts), "core full CNF"
    )
    explicit_paths["v1_cnf"] = full_cnf_path
    snapshots[full_cnf_path] = capture_file(full_cnf_path, "core full CNF", repo_root)
    if full_cnf_path == explicit_paths["v2_cnf"] or os.path.samefile(
        full_cnf_path, explicit_paths["v2_cnf"]
    ):
        raise ProjectionError("v1 and v2 full CNFs are not independent files")
    validate_artifact_record(
        repo_root=repo_root,
        record=full_cnf_record,
        explicit_path=full_cnf_path,
        payload=snapshots[full_cnf_path],
        label="core full CNF",
    )
    validate_artifact_record(
        repo_root=repo_root,
        record=outputs.get("core_clause_map"),
        explicit_path=explicit_paths["core_map"],
        payload=snapshots[explicit_paths["core_map"]],
        label="core clause map",
    )
    validate_artifact_record(
        repo_root=repo_root,
        record=outputs.get("dense_core_cnf"),
        explicit_path=explicit_paths["dense_core_cnf"],
        payload=snapshots[explicit_paths["dense_core_cnf"]],
        label="dense core CNF",
    )
    for label, record in (
        ("raw_lrat", inputs["raw_lrat"]),
        ("core_cnf", inputs["core_cnf"]),
        ("trace", inputs["trace"]),
        ("dense_core_lrat", outputs["dense_core_lrat"]),
    ):
        path, payload = capture_recorded_artifact(
            repo_root=repo_root, record=record, label=label
        )
        explicit_paths[label] = path
        snapshots[path] = payload
    replay = core_receipt.get("dense_rup_replay")
    if not isinstance(replay, dict) or replay.get("verified") is not True:
        raise ProjectionError("core receipt does not record verified dense RUP replay")

    v2_variables, v2_clauses = parse_dimacs(
        snapshots[explicit_paths["v2_cnf"]], "v2 DIMACS"
    )
    v1_variables, v1_clauses = parse_dimacs(snapshots[full_cnf_path], "core full DIMACS")
    if v1_variables != v2_variables or v1_clauses != v2_clauses:
        raise ProjectionError("v1 and v2 full DIMACS clause sequences differ")
    validate_variables(conversion, v2_variables)
    dimacs_record = conversion.get("dimacs")
    if (
        not isinstance(dimacs_record, dict)
        or dimacs_record.get("variable_count") != v2_variables
        or dimacs_record.get("clause_count") != len(v2_clauses)
    ):
        raise ProjectionError("conversion DIMACS counts differ from parsed CNF")

    provenance_rows = parse_canonical_jsonl(
        snapshots[explicit_paths["provenance"]], "clause provenance"
    )
    families, subtypes, conflict_kinds = validate_provenance(provenance_rows, v2_clauses)
    if conversion.get("clause_family_counts") != counter_json(families):
        raise ProjectionError("conversion family counts differ from provenance")

    map_rows = parse_canonical_jsonl(snapshots[explicit_paths["core_map"]], "core map")
    dense_variables, dense_clauses = parse_dimacs(
        snapshots[explicit_paths["dense_core_cnf"]], "dense core DIMACS"
    )
    if dense_variables != v2_variables:
        raise ProjectionError("dense core and full CNF variable counts differ")
    original_ids = validate_core_map(map_rows, v2_clauses, dense_clauses)
    if core_receipt.get("base_clause_count") != len(v2_clauses):
        raise ProjectionError("core receipt base clause count mismatch")
    if core_receipt.get("core_clause_count") != len(original_ids):
        raise ProjectionError("core receipt core clause count mismatch")
    original_ids_digest = sha256_bytes(canonical_json_bytes(list(original_ids)))
    if core_receipt.get("core_original_ids_sha256") != original_ids_digest:
        raise ProjectionError("core receipt original-ID digest mismatch")
    validate_expected_dimensions(
        conversion=conversion,
        variable_count=v2_variables,
        full_clause_count=len(v2_clauses),
        core_clause_count=len(original_ids),
        expected_variable_count=expected_variable_count,
        expected_full_clause_count=expected_full_clause_count,
        expected_core_clause_count=expected_core_clause_count,
        expected_orientation=expected_orientation,
        expected_order=expected_order,
        expected_role_pins=expected_role_pins,
        expected_row_pins=expected_row_pins,
    )
    run_manifest = load_json_object(
        snapshots[explicit_paths["run_manifest"]], "run manifest"
    )
    run_manifest_self_hash = validate_run_manifest(
        repo_root=repo_root,
        manifest=run_manifest,
        explicit_paths=explicit_paths,
        snapshots=snapshots,
    )

    selected_rows: list[dict[str, Any]] = []
    selected_families: Counter[str] = Counter()
    selected_subtypes: Counter[str] = Counter()
    selected_conflicts: Counter[str] = Counter()
    for dense_id, original_id in enumerate(original_ids, 1):
        source = provenance_rows[original_id - 1]
        origin = source["origin"]
        selected_families[origin["family"]] += 1
        selected_subtypes[origin["subtype"]] += 1
        conflict_kind = origin.get("linear_conflict_kind")
        if conflict_kind is not None:
            selected_conflicts[conflict_kind] += 1
        selected_rows.append(
            {
                "schema": ROW_SCHEMA,
                "core_clause_id": dense_id,
                "original_clause_id": original_id,
                "literals": source["literals"],
                "literal_body_sha256": source["literal_body_sha256"],
                "provenance_row_sha256": sha256_bytes(canonical_json_bytes(source)),
                "source_provenance": source,
            }
        )
    projection_payload = b"".join(
        canonical_json_bytes(row) + b"\n" for row in selected_rows
    )

    output_dir = repository_input_path(repo_root, output_dir, "output directory")
    if not output_dir.name:
        raise ProjectionError("output directory has no final component")
    parent_fd = open_under_root(
        repo_root, output_dir.parent, "output parent directory", directory=True
    )
    staging_name = ""
    staging_fd = -1
    published = False
    try:
        try:
            os.stat(output_dir.name, dir_fd=parent_fd, follow_symlinks=False)
        except FileNotFoundError:
            pass
        else:
            raise ProjectionError(f"refusing to overwrite output directory: {output_dir}")
        staging_name, staging_fd = create_staging_directory(parent_fd, output_dir.name)
        replay_cnf_name = "replay-dense-core.cnf"
        replay_lrat_name = "replay-dense-core.lrat"
        write_fsynced_at(
            staging_fd,
            replay_cnf_name,
            snapshots[explicit_paths["dense_core_cnf"]],
        )
        write_fsynced_at(
            staging_fd,
            replay_lrat_name,
            snapshots[explicit_paths["dense_core_lrat"]],
        )
        assert_directory_path_unchanged(repo_root, output_dir.parent, parent_fd)
        staging_path = output_dir.parent / staging_name
        try:
            replay_counts = core.validate_dense_rup(
                staging_path / replay_cnf_name, staging_path / replay_lrat_name
            )
        except core.CoreExtractionError as exc:
            raise ProjectionError(f"independent dense RUP replay failed: {exc}") from exc
        assert_directory_path_unchanged(repo_root, output_dir.parent, parent_fd)
        expected_replay_counts = {
            key: value for key, value in replay.items() if key != "verified"
        }
        if replay_counts != expected_replay_counts:
            raise ProjectionError("independent dense RUP counts differ from core receipt")
        os.unlink(replay_cnf_name, dir_fd=staging_fd)
        os.unlink(replay_lrat_name, dir_fd=staging_fd)
        write_fsynced_at(staging_fd, "core-provenance.jsonl", projection_payload)
        receipt: dict[str, Any] = {
            "schema": SCHEMA,
            "generator": {
                "path": str(explicit_paths["generator"]),
                "sha256": sha256_bytes(snapshots[explicit_paths["generator"]]),
                "byte_count": len(snapshots[explicit_paths["generator"]]),
            },
            "replay_checker": {
                "path": str(explicit_paths["replay_checker"]),
                "sha256": sha256_bytes(snapshots[explicit_paths["replay_checker"]]),
                "byte_count": len(snapshots[explicit_paths["replay_checker"]]),
            },
            "inputs": {
                label: artifact_record(repo_root, path, snapshots[path])
                for label, path in sorted(explicit_paths.items())
                if label not in {"generator", "replay_checker"}
            },
            "bindings": {
                "conversion_manifest_sha256": conversion_self_hash,
                "core_receipt_sha256": core_receipt_self_hash,
                "run_manifest_sha256": run_manifest_self_hash,
                "core_original_ids_sha256": original_ids_digest,
                "full_clause_sequence_sha256": sha256_bytes(
                    canonical_json_bytes([list(clause) for clause in v2_clauses])
                ),
            },
            "independent_dense_rup_replay": {"verified": True, **replay_counts},
            "counts": {
                "variable_count": v2_variables,
                "full_clause_count": len(v2_clauses),
                "core_clause_count": len(original_ids),
                "full_families": counter_json(families),
                "full_subtypes": counter_json(subtypes),
                "full_linear_conflict_kinds": counter_json(conflict_kinds),
                "core_families": counter_json(selected_families),
                "core_subtypes": counter_json(selected_subtypes),
                "core_linear_conflict_kinds": counter_json(selected_conflicts),
            },
            "claim_scope": {
                "source_general": False,
                "theorem_promotion": False,
                "classification": "diagnostic-formula-core-only",
                "role_pins": conversion.get("role_pins"),
                "row_pins": conversion.get("row_pins"),
                "reason": (
                    "This projection preserves formula/core provenance only; it does not "
                    "establish source coverage or Lean certificate ingress."
                ),
            },
            "outputs": {
                "core_provenance": {
                    "path": "core-provenance.jsonl",
                    "sha256": sha256_bytes(projection_payload),
                    "byte_count": len(projection_payload),
                }
            },
        }
        receipt["receipt_sha256"] = sha256_bytes(canonical_json_bytes(receipt))
        receipt_payload = canonical_json_bytes(receipt) + b"\n"
        write_fsynced_at(staging_fd, "receipt.json", receipt_payload)
        os.fsync(staging_fd)
        assert_snapshots_unchanged(snapshots, repo_root)
        assert_directory_path_unchanged(repo_root, output_dir.parent, parent_fd)
        rename_directory_exclusive_at(parent_fd, staging_name, output_dir.name)
        published = True
        try:
            fsync_parent(parent_fd)
        except OSError as sync_error:
            try:
                os.rename(
                    output_dir.name,
                    staging_name,
                    src_dir_fd=parent_fd,
                    dst_dir_fd=parent_fd,
                )
                published = False
            except OSError as rollback_error:
                failure = ProjectionError(
                    "output was published but parent fsync and rollback both failed"
                )
                failure.add_note(f"rollback failure: {rollback_error}")
                raise failure from sync_error
            raise ProjectionError("parent fsync failed; publication was rolled back") from sync_error
        return receipt
    except BaseException as error:
        if staging_fd >= 0 and not published:
            try:
                cleanup_staging(parent_fd, staging_name, staging_fd)
            except OSError as cleanup_error:
                error.add_note(f"staging cleanup also failed: {cleanup_error}")
        raise
    finally:
        if staging_fd >= 0:
            os.close(staging_fd)
        os.close(parent_fd)


def parser() -> argparse.ArgumentParser:
    """Build the command-line parser."""
    result = argparse.ArgumentParser(description=__doc__)
    result.add_argument("--repo-root", type=Path, required=True)
    result.add_argument("--conversion-manifest", type=Path, required=True)
    result.add_argument("--v2-cnf", type=Path, required=True)
    result.add_argument("--provenance", type=Path, required=True)
    result.add_argument("--core-receipt", type=Path, required=True)
    result.add_argument("--core-map", type=Path, required=True)
    result.add_argument("--dense-core-cnf", type=Path, required=True)
    result.add_argument("--run-manifest", type=Path, required=True)
    result.add_argument("--output-dir", type=Path, required=True)
    return result


def main() -> int:
    """Run the fail-closed projection CLI."""
    arguments = parser().parse_args()
    try:
        receipt = project_core_provenance(
            repo_root=arguments.repo_root,
            conversion_manifest_path=arguments.conversion_manifest,
            v2_cnf_path=arguments.v2_cnf,
            provenance_path=arguments.provenance,
            core_receipt_path=arguments.core_receipt,
            core_map_path=arguments.core_map,
            dense_core_cnf_path=arguments.dense_core_cnf,
            run_manifest_path=arguments.run_manifest,
            output_dir=arguments.output_dir,
        )
    except (OSError, ProjectionError) as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 2
    print(json.dumps(receipt, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
