"""Fail-closed package adapter for the exact17 direct6 refinement lane.

The adapter authenticates a root CNF and eight explicit DIMACS clause
fragments, reconstructs their aggregate, and emits a generic PIQD ``RunPacket``.
It never runs PIQD, a solver, a producer, a replay command, Lean, or Git.
"""

from __future__ import annotations

import json
import os
import re
import stat
from collections.abc import Mapping
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from types import MappingProxyType
from typing import Any

from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    UNSAT_MEANS_OBSTRUCTION,
    WAVE_SCHEMA,
    canonical_json_bytes,
    sha256_bytes,
    validate_wave_manifest,
)
from census.p97_search.phase3_piqd_exact17_runner import RunPacket
from census.p97_search.phase3_piqd_oracle import (
    PiqdOracleError,
    raw_dimacs_identity,
    scan_dimacs,
)

LANE_SCHEMA = "p97-exact17-cap9-root-refinement-lane/v1"
VARIABLE_MAP_SCHEMA = "p97-exact17-cap9-variable-map/v1"
PACKAGE_RESULT_SCHEMA = "p97-phase3-piqd-exact17-direct6-package-result/v1"
LANE_LABEL = "P97 exact-17 cap-nine root plus ordered two-Kalmanson refinements"
LANE_SCOPE = (
    "one normalized cap-nine case; nogood soundness and Lean lift remain separate"
)
TERMINAL_SEMANTICS = (
    "finite normalized-case custody and replay only; no source entitlement, "
    "aggregate coverage, universal lift, or theorem closure"
)
AGGREGATE_ALGORITHM = "root-body-plus-ordered-raw-fragments/v1"
AGGREGATE_VERSION = 1
MAX_AGGREGATE_BYTES = 256 * 1024 * 1024

EXACT17_ORDER = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
EXACT17_ANONYMOUS_POSITIONS = (0, 1)
LIVE_LEAF = "Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier"
SOURCE_THEOREM = "UNAUTHENTICATED_EXACT17_DIRECT6_FINITE_LANE"
WAVE_ID = "rank-four-exact17-cap9-direct6-root-refinements"
EXPECTED_STRUCTURAL_RESULT = "PASS for every seven cut-round model receipts"
EXPECTED_EXACT_LRA_RESULT = (
    "not requested; cuts use replayed Lean theorem-bank consumers"
)

_HEX = frozenset("0123456789abcdef")
_COMMIT_RE = re.compile(r"[0-9a-f]{40}")
_FRAGMENT_TOKEN_RE = re.compile(rb"(?:-?[1-9][0-9]*|0)")
_HEADER_RE = re.compile(
    rb"^(?P<prefix>[ \t]*p[ \t]+cnf[ \t]+)(?P<variables>[0-9]+)"
    rb"(?P<separator>[ \t]+)(?P<clauses>[0-9]+)(?P<suffix>[ \t]*\n)$"
)
_READ_CHUNK = 1024 * 1024
_MAX_MANIFEST_BYTES = 8 * 1024 * 1024
_MAX_JSON_ARTIFACT_BYTES = 64 * 1024 * 1024
_MAX_SOURCE_BYTES = 32 * 1024 * 1024
_MAX_SOURCE_INVENTORY_BYTES = 128 * 1024 * 1024
_OUTPUT_LOCK = ".phase3-piqd-exact17-direct6-package.lock"
_OUTPUT_FILES = frozenset(
    {
        "discovery.cnf",
        "producer-manifest.json",
        "variable-map.json",
        "wave-manifest.json",
        "package-result.json",
    }
)

_TOP_KEYS = frozenset(
    {
        "schema",
        "lane",
        "producer",
        "root",
        "variable_map",
        "refinements",
        "aggregate",
        "replay",
        "resource",
        "claims",
    }
)
_LANE_KEYS = frozenset(
    {
        "label",
        "scope",
        "order_index",
        "anonymous_positions",
        "order",
        "terminal_semantics",
    }
)
_PRODUCER_KEYS = frozenset(
    {"git_commit", "argv", "executable", "version", "source_files"}
)
_ROOT_KEYS = frozenset({"cnf", "manifest", "num_clauses", "num_vars", "validation"})
_FILE_REF_KEYS = frozenset({"path", "byte_count", "sha256"})
_SOURCE_KEYS = frozenset({"path", "byte_count", "sha256"})
_VARIABLE_MAP_KEYS = frozenset(
    {"artifact", "entry_count", "order_sha256", "reconstructor", "schema"}
)
_VARIABLE_MAP_DOCUMENT_KEYS = frozenset({"entries", "order", "schema"})
_RECONSTRUCTOR_KEYS = frozenset({"function", "source"})
_REFINEMENT_KEYS = frozenset(
    {
        "ordinal",
        "kind",
        "receipt",
        "receipt_schema",
        "clause_fragment",
        "clause_count",
        "parent_formula_sha256",
        "parent_clause_count",
        "result_formula_sha256",
        "result_clause_count",
        "provenance",
    }
)
_CUT_PROVENANCE_KEYS = frozenset(
    {"analysis", "analysis_sha256", "model_log", "model_log_sha256", "session_id"}
)
_PAIR_PROVENANCE_KEYS = frozenset(
    {"batch_count", "selected_pair_count", "selected_pair_sha256", "session_id"}
)
_AGGREGATE_KEYS = frozenset(
    {
        "algorithm",
        "version",
        "sha256",
        "byte_count",
        "num_vars",
        "num_clauses",
        "upload_cap_bytes",
        "within_upload_cap",
    }
)
_REPLAY_KEYS = frozenset(
    {
        "source_model_validator",
        "expected_structural_result",
        "expected_exact_global_lra_result",
    }
)
_SOURCE_MODEL_VALIDATOR_KEYS = frozenset({"argv_template", "path", "source_files"})
_RESOURCE_KEYS = frozenset(
    {
        "max_cores",
        "max_solver_processes",
        "wall_time_envelope_seconds",
        "parallel",
    }
)
_CLAIM_KEYS = frozenset(
    {
        "normalized_case_only",
        "source_entitlement",
        "aggregate_case_coverage",
        "universal_lift",
        "theorem_closure",
        "lean_checked",
        "daemon_signed_attestation",
    }
)


class Direct6PackageError(RuntimeError):
    """A direct6 lane input or immutable output failed its strict contract."""


@dataclass(frozen=True)
class _Snapshot:
    path: str
    content: bytes
    byte_count: int
    sha256: str


@dataclass(frozen=True)
class PackageResult:
    """Immutable identity of an emitted direct6 package."""

    output_dir: Path
    canonical_bytes: bytes
    sha256: str
    aggregate_sha256: str
    aggregate_byte_count: int
    num_variables: int
    num_clauses: int
    artifact_hashes: Mapping[str, str]

    def as_dict(self) -> dict[str, Any]:
        value = json.loads(self.canonical_bytes)
        if type(value) is not dict:  # pragma: no cover - construction invariant
            raise Direct6PackageError("package result is not an object")
        return value


def _exact_keys(value: Mapping[str, Any], expected: frozenset[str], path: str) -> None:
    if type(value) is not dict:
        raise Direct6PackageError(f"{path} must be a built-in object")
    if set(value) != expected:
        raise Direct6PackageError(
            f"{path} keys mismatch: missing={sorted(expected - value.keys())}, "
            f"extra={sorted(value.keys() - expected)}"
        )


def _object(value: Any, path: str) -> dict[str, Any]:
    if type(value) is not dict:
        raise Direct6PackageError(f"{path} must be a built-in object")
    return value


def _array(value: Any, path: str) -> list[Any]:
    if type(value) is not list:
        raise Direct6PackageError(f"{path} must be a built-in array")
    return value


def _string(value: Any, path: str) -> str:
    if type(value) is not str or not value:
        raise Direct6PackageError(f"{path} must be a nonempty built-in string")
    return value


def _integer(value: Any, path: str, *, minimum: int = 0) -> int:
    if type(value) is not int or value < minimum:
        raise Direct6PackageError(f"{path} must be a built-in integer >= {minimum}")
    return value


def _boolean(value: Any, path: str) -> bool:
    if type(value) is not bool:
        raise Direct6PackageError(f"{path} must be a built-in boolean")
    return value


def _digest(value: Any, path: str) -> str:
    if (
        type(value) is not str
        or len(value) != 64
        or any(character not in _HEX for character in value)
    ):
        raise Direct6PackageError(f"{path} must be a lowercase SHA-256 digest")
    return value


def _argv(value: Any, path: str) -> list[str]:
    items = _array(value, path)
    if not items:
        raise Direct6PackageError(f"{path} must not be empty")
    return [_string(item, f"{path}[{index}]") for index, item in enumerate(items)]


def _require_builtin_json(value: Any, path: str) -> None:
    value_type = type(value)
    if value_type is dict:
        for key, item in value.items():
            if type(key) is not str:
                raise Direct6PackageError(f"{path} has a non-built-in string key")
            _require_builtin_json(item, f"{path}.{key}")
        return
    if value_type is list:
        for index, item in enumerate(value):
            _require_builtin_json(item, f"{path}[{index}]")
        return
    if value_type not in {str, int, bool, type(None)}:
        raise Direct6PackageError(
            f"{path} contains a non-canonical JSON value of type {value_type.__name__}"
        )


def _strict_json(raw: bytes, *, path: str, canonical: bool) -> dict[str, Any]:
    def unique(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate JSON key {key!r}")
            result[key] = value
        return result

    def finite(value: str) -> None:
        raise ValueError(f"non-finite JSON value {value}")

    try:
        value = json.loads(raw, object_pairs_hook=unique, parse_constant=finite)
    except (
        UnicodeDecodeError,
        json.JSONDecodeError,
        ValueError,
        RecursionError,
    ) as exc:
        raise Direct6PackageError(f"{path} is not strict JSON") from exc
    value = _object(value, path)
    _require_builtin_json(value, path)
    if canonical and canonical_json_bytes(value) != raw:
        raise Direct6PackageError(f"{path} is not canonical compact JSON")
    return value


def _strict_canonical_json(raw: bytes, *, path: str) -> dict[str, Any]:
    return _strict_json(raw, path=path, canonical=True)


def _relative_path(value: Any, path: str) -> str:
    text = _string(value, path)
    pure = PurePosixPath(text)
    if (
        pure.is_absolute()
        or pure.as_posix() != text
        or "\\" in text
        or not pure.parts
        or any(part in {"", ".", ".."} for part in pure.parts)
    ):
        raise Direct6PackageError(f"{path} must be a canonical relative POSIX path")
    return text


def _identity(info: os.stat_result) -> tuple[int, ...]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _directory_identity(info: os.stat_result) -> tuple[int, int]:
    return (info.st_dev, info.st_ino)


def _open_absolute_directory_nofollow(path: Path, *, label: str) -> int:
    nofollow = getattr(os, "O_NOFOLLOW", None)
    directory = getattr(os, "O_DIRECTORY", None)
    if nofollow is None or directory is None:
        raise Direct6PackageError("platform lacks required no-follow open flags")
    absolute = Path(os.path.abspath(path))
    flags = os.O_RDONLY | directory | nofollow | getattr(os, "O_CLOEXEC", 0)
    try:
        descriptor = os.open(absolute.anchor, flags)
        for component in absolute.parts[1:]:
            child = os.open(component, flags, dir_fd=descriptor)
            os.close(descriptor)
            descriptor = child
    except OSError as exc:
        try:
            os.close(descriptor)
        except UnboundLocalError:
            pass
        raise Direct6PackageError(
            f"{label} contains a symlink or non-directory component"
        ) from exc
    return descriptor


class _InputCustody:
    def __init__(self, root: Path) -> None:
        self.root = Path(os.path.abspath(root))
        self.root_fd = _open_absolute_directory_nofollow(self.root, label="input root")
        self.cache: dict[str, _Snapshot] = {}

    def close(self) -> None:
        os.close(self.root_fd)

    def capture(self, label: str, *, maximum_bytes: int) -> _Snapshot:
        label = _relative_path(label, "artifact path")
        if type(maximum_bytes) is not int or maximum_bytes < 0:
            raise Direct6PackageError("maximum_bytes must be a nonnegative integer")
        cached = self.cache.get(label)

        directory_flags = (
            os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0)
        )
        opened: list[tuple[int, str, int, tuple[int, ...]]] = []
        current = os.dup(self.root_fd)
        file_fd: int | None = None
        try:
            parts = PurePosixPath(label).parts
            for component in parts[:-1]:
                child = os.open(component, directory_flags, dir_fd=current)
                before = os.fstat(child)
                if not stat.S_ISDIR(before.st_mode):
                    raise Direct6PackageError(
                        f"artifact parent is not a directory: {label}"
                    )
                opened.append((current, component, child, _identity(before)))
                current = child
            file_fd = os.open(
                parts[-1],
                os.O_RDONLY
                | os.O_NONBLOCK
                | os.O_NOFOLLOW
                | getattr(os, "O_CLOEXEC", 0),
                dir_fd=current,
            )
            before = os.fstat(file_fd)
            if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
                raise Direct6PackageError(
                    f"artifact is not a private regular file: {label}"
                )
            if before.st_size > maximum_bytes:
                raise Direct6PackageError(f"artifact exceeds byte bound: {label}")
            chunks: list[bytes] = []
            total = 0
            while True:
                chunk = os.read(file_fd, min(_READ_CHUNK, maximum_bytes + 1 - total))
                if not chunk:
                    break
                chunks.append(chunk)
                total += len(chunk)
                if total > maximum_bytes:
                    raise Direct6PackageError(f"artifact exceeds byte bound: {label}")
            content = b"".join(chunks)
            after = os.fstat(file_fd)
            path_after = os.stat(parts[-1], dir_fd=current, follow_symlinks=False)
            if (
                _identity(before) != _identity(after)
                or _identity(after) != _identity(path_after)
                or len(content) != before.st_size
            ):
                raise Direct6PackageError(
                    f"artifact changed during authenticated read: {label}"
                )
            for parent_fd, component, child_fd, expected in reversed(opened):
                child_after = os.fstat(child_fd)
                path_child = os.stat(component, dir_fd=parent_fd, follow_symlinks=False)
                if (
                    _identity(child_after) != expected
                    or _identity(path_child) != expected
                ):
                    raise Direct6PackageError(
                        f"artifact parent changed during authenticated read: {label}"
                    )
            snapshot = _Snapshot(
                path=label,
                content=content,
                byte_count=len(content),
                sha256=sha256_bytes(content),
            )
            if cached is not None and snapshot != cached:
                raise Direct6PackageError(
                    f"artifact changed between authenticated reads: {label}"
                )
            self.cache[label] = snapshot
            return snapshot
        except OSError as exc:
            raise Direct6PackageError(
                f"no-follow artifact read failed: {label}"
            ) from exc
        finally:
            if file_fd is not None:
                os.close(file_fd)
            for parent_fd, _component, _child_fd, _expected in reversed(opened):
                os.close(parent_fd)
            os.close(current)


def _bind_snapshot(
    record: Mapping[str, Any],
    *,
    path: str,
    keys: frozenset[str],
    custody: _InputCustody,
    maximum_bytes: int,
) -> _Snapshot:
    _exact_keys(record, keys, path)
    label = _relative_path(record["path"], f"{path}.path")
    byte_count = _integer(record["byte_count"], f"{path}.byte_count")
    digest = _digest(record["sha256"], f"{path}.sha256")
    snapshot = custody.capture(label, maximum_bytes=maximum_bytes)
    if snapshot.byte_count != byte_count or snapshot.sha256 != digest:
        raise Direct6PackageError(f"{path} byte identity mismatch")
    return snapshot


def _validate_inventory(
    value: Any, *, path: str, custody: _InputCustody
) -> dict[str, _Snapshot]:
    records = _array(value, path)
    labels: list[str] = []
    snapshots: dict[str, _Snapshot] = {}
    total = 0
    for index, item in enumerate(records):
        record_path = f"{path}[{index}]"
        record = _object(item, record_path)
        snapshot = _bind_snapshot(
            record,
            path=record_path,
            keys=_SOURCE_KEYS,
            custody=custody,
            maximum_bytes=_MAX_SOURCE_BYTES,
        )
        if snapshot.path in snapshots:
            raise Direct6PackageError(f"{path} contains duplicate source paths")
        labels.append(snapshot.path)
        snapshots[snapshot.path] = snapshot
        total += snapshot.byte_count
    if labels != sorted(labels):
        raise Direct6PackageError(f"{path} must be in canonical path order")
    if total > _MAX_SOURCE_INVENTORY_BYTES:
        raise Direct6PackageError(f"{path} exceeds the aggregate source byte bound")
    return snapshots


def _validate_json_artifact(
    value: Any, *, path: str, custody: _InputCustody, canonical: bool = False
) -> tuple[_Snapshot, dict[str, Any]]:
    record = _object(value, path)
    snapshot = _bind_snapshot(
        record,
        path=path,
        keys=_FILE_REF_KEYS,
        custody=custody,
        maximum_bytes=_MAX_JSON_ARTIFACT_BYTES,
    )
    document = _strict_json(snapshot.content, path=path, canonical=canonical)
    return snapshot, document


def _capture_path_digest(
    *,
    path_value: Any,
    digest_value: Any,
    path: str,
    custody: _InputCustody,
    maximum_bytes: int,
) -> _Snapshot:
    label = _relative_path(path_value, path)
    expected = _digest(digest_value, f"{path}_sha256")
    snapshot = custody.capture(label, maximum_bytes=maximum_bytes)
    if snapshot.sha256 != expected:
        raise Direct6PackageError(f"{path} SHA-256 mismatch")
    return snapshot


def _header_clause_span(root: bytes) -> tuple[int, int, int, int]:
    offset = 0
    found: tuple[int, int, int, int] | None = None
    for line in root.splitlines(keepends=True):
        stripped = line.lstrip()
        if stripped.startswith(b"p"):
            match = _HEADER_RE.fullmatch(line)
            if match is None or found is not None:
                raise Direct6PackageError(
                    "root CNF has a malformed or duplicate header"
                )
            variables = int(match.group("variables"))
            clauses = int(match.group("clauses"))
            start = offset + match.start("clauses")
            end = offset + match.end("clauses")
            found = (start, end, variables, clauses)
        offset += len(line)
    if found is None:
        raise Direct6PackageError("root CNF header is missing")
    return found


def _rewrite_clause_count(root: bytes, clause_count: int) -> bytes:
    start, end, _variables, _clauses = _header_clause_span(root)
    return root[:start] + str(clause_count).encode("ascii") + root[end:]


def _validate_fragment(fragment: bytes, *, num_variables: int, path: str) -> int:
    if not fragment or not fragment.endswith(b"\n") or b"\r" in fragment:
        raise Direct6PackageError(
            f"{path} must be nonempty newline-terminated DIMACS lines"
        )
    count = 0
    for line_number, raw in enumerate(fragment.splitlines(keepends=True), start=1):
        if not raw.endswith(b"\n"):
            raise Direct6PackageError(f"{path} line {line_number} is unterminated")
        line = raw[:-1]
        if not line or line.startswith((b"c", b"p")):
            raise Direct6PackageError(
                f"{path} line {line_number} must be one clause, not a header/comment/blank"
            )
        tokens = line.split(b" ")
        if (
            any(
                not token or _FRAGMENT_TOKEN_RE.fullmatch(token) is None
                for token in tokens
            )
            or tokens[-1] != b"0"
            or b"0" in tokens[:-1]
        ):
            raise Direct6PackageError(
                f"{path} line {line_number} is not a canonical zero-terminated clause"
            )
        for token in tokens[:-1]:
            literal = int(token)
            if abs(literal) > num_variables:
                raise Direct6PackageError(
                    f"{path} line {line_number} literal {literal} exceeds root variables"
                )
        count += 1
    return count


def _validate_lane(value: Any) -> tuple[dict[str, Any], str]:
    lane = _object(value, "lane")
    _exact_keys(lane, _LANE_KEYS, "lane")
    if _string(lane["label"], "lane.label") != LANE_LABEL:
        raise Direct6PackageError("lane.label is not the direct6 lane label")
    if _string(lane["scope"], "lane.scope") != LANE_SCOPE:
        raise Direct6PackageError("lane.scope is not the normalized exact17 scope")
    if _integer(lane["order_index"], "lane.order_index") != 0:
        raise Direct6PackageError("lane.order_index must be zero")
    anonymous = _array(lane["anonymous_positions"], "lane.anonymous_positions")
    if anonymous != list(EXACT17_ANONYMOUS_POSITIONS) or any(
        type(item) is not int for item in anonymous
    ):
        raise Direct6PackageError("lane.anonymous_positions mismatch")
    order = _array(lane["order"], "lane.order")
    if order != list(EXACT17_ORDER) or any(type(item) is not int for item in order):
        raise Direct6PackageError("lane.order is not the full reviewed exact17 order")
    if (
        _string(lane["terminal_semantics"], "lane.terminal_semantics")
        != TERMINAL_SEMANTICS
    ):
        raise Direct6PackageError("lane.terminal_semantics mismatch")
    return lane, sha256_bytes(canonical_json_bytes(order))


def _validate_claims(value: Any) -> dict[str, bool]:
    claims = _object(value, "claims")
    _exact_keys(claims, _CLAIM_KEYS, "claims")
    for key in _CLAIM_KEYS:
        _boolean(claims[key], f"claims.{key}")
    expected = {key: False for key in _CLAIM_KEYS}
    expected["normalized_case_only"] = True
    if claims != expected:
        raise Direct6PackageError(
            "claims must be exactly the conservative direct6 claims"
        )
    return claims


def _validate_output_name(name: str) -> None:
    if name not in _OUTPUT_FILES:
        raise Direct6PackageError(f"unexpected package output name: {name}")


def _open_output_directory(path: Path) -> int:
    absolute = Path(os.path.abspath(path))
    parent = absolute.parent
    parent_fd = _open_absolute_directory_nofollow(parent, label="output parent")
    try:
        try:
            os.mkdir(absolute.name, 0o700, dir_fd=parent_fd)
        except FileExistsError:
            pass
        try:
            descriptor = os.open(
                absolute.name,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=parent_fd,
            )
        except OSError as exc:
            raise Direct6PackageError(
                "output path is a symlink or non-directory"
            ) from exc
    finally:
        os.close(parent_fd)
    return descriptor


def _read_output(directory_fd: int, name: str, *, maximum_bytes: int) -> bytes:
    _validate_output_name(name)
    try:
        descriptor = os.open(
            name,
            os.O_RDONLY | os.O_NONBLOCK | os.O_NOFOLLOW,
            dir_fd=directory_fd,
        )
    except OSError as exc:
        raise Direct6PackageError(f"cannot safely read package output {name}") from exc
    try:
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise Direct6PackageError(
                f"package output is not a private regular file: {name}"
            )
        if before.st_size > maximum_bytes:
            raise Direct6PackageError(f"package output exceeds bound: {name}")
        chunks: list[bytes] = []
        total = 0
        while True:
            chunk = os.read(descriptor, min(_READ_CHUNK, maximum_bytes + 1 - total))
            if not chunk:
                break
            chunks.append(chunk)
            total += len(chunk)
            if total > maximum_bytes:
                raise Direct6PackageError(f"package output exceeds bound: {name}")
        after = os.fstat(descriptor)
        path_after = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        if _identity(before) != _identity(after) or _identity(after) != _identity(
            path_after
        ):
            raise Direct6PackageError(f"package output changed during read: {name}")
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def _install_output(directory_fd: int, name: str, payload: bytes) -> None:
    _validate_output_name(name)
    try:
        descriptor = os.open(
            name,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
            0o600,
            dir_fd=directory_fd,
        )
    except OSError as exc:
        raise Direct6PackageError(
            f"cannot install immutable package output {name}"
        ) from exc
    try:
        before = os.fstat(descriptor)
        if (
            not stat.S_ISREG(before.st_mode)
            or before.st_nlink != 1
            or before.st_size != 0
        ):
            raise Direct6PackageError(f"unsafe newly-created package output: {name}")
        view = memoryview(payload)
        while view:
            written = os.write(descriptor, view)
            if type(written) is not int or written <= 0:
                raise Direct6PackageError(f"short package output write: {name}")
            view = view[written:]
        os.fsync(descriptor)
        after = os.fstat(descriptor)
        path_after = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        if (
            not stat.S_ISREG(after.st_mode)
            or after.st_nlink != 1
            or after.st_size != len(payload)
            or (after.st_dev, after.st_ino) != (before.st_dev, before.st_ino)
            or _identity(after) != _identity(path_after)
        ):
            raise Direct6PackageError(f"package output changed during write: {name}")
    finally:
        os.close(descriptor)


def _emit_immutable(output_dir: Path, files: Mapping[str, bytes]) -> None:
    if set(files) != _OUTPUT_FILES:
        raise Direct6PackageError("internal package output set mismatch")
    directory_fd = _open_output_directory(output_dir)
    directory_identity = _directory_identity(os.fstat(directory_fd))
    lock_fd: int | None = None
    try:
        try:
            lock_fd = os.open(
                _OUTPUT_LOCK,
                os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
                0o600,
                dir_fd=directory_fd,
            )
        except OSError as exc:
            raise Direct6PackageError("direct6 package writer lock collision") from exc
        entries = set(os.listdir(directory_fd)) - {_OUTPUT_LOCK}
        extras = entries - set(files)
        if extras:
            raise Direct6PackageError(
                f"output directory has extra entries: {sorted(extras)}"
            )
        for name in sorted(files):
            payload = files[name]
            if name in entries:
                if (
                    _read_output(directory_fd, name, maximum_bytes=len(payload))
                    != payload
                ):
                    raise Direct6PackageError(
                        f"refusing different existing artifact: {name}"
                    )
            else:
                _install_output(directory_fd, name, payload)
        os.fsync(directory_fd)
        if set(os.listdir(directory_fd)) != set(files) | {_OUTPUT_LOCK}:
            raise Direct6PackageError(
                "output directory changed during package emission"
            )
        for name, payload in files.items():
            if _read_output(directory_fd, name, maximum_bytes=len(payload)) != payload:
                raise Direct6PackageError(f"final output verification failed: {name}")
        reopened_fd = _open_absolute_directory_nofollow(
            Path(os.path.abspath(output_dir)), label="final output directory"
        )
        try:
            if _directory_identity(os.fstat(reopened_fd)) != directory_identity:
                raise Direct6PackageError(
                    "output directory was replaced during emission"
                )
        finally:
            os.close(reopened_fd)
        lock_info = os.fstat(lock_fd)
        lock_path = os.stat(_OUTPUT_LOCK, dir_fd=directory_fd, follow_symlinks=False)
        if _identity(lock_info) != _identity(lock_path):
            raise Direct6PackageError("direct6 package writer lock was replaced")
        os.unlink(_OUTPUT_LOCK, dir_fd=directory_fd)
        unlinked = os.fstat(lock_fd)
        if unlinked.st_nlink != 0:
            raise Direct6PackageError("direct6 package writer lock was not unlinked")
    finally:
        if lock_fd is not None:
            os.close(lock_fd)
        os.close(directory_fd)


def _resolve_manifest_root(
    manifest_path: Path, repo_root: Path | None
) -> tuple[Path, str]:
    absolute_manifest = Path(os.path.abspath(manifest_path))
    root = (
        absolute_manifest.parent
        if repo_root is None
        else Path(os.path.abspath(repo_root))
    )
    try:
        relative = absolute_manifest.relative_to(root)
    except ValueError as exc:
        raise Direct6PackageError("manifest is outside repo_root") from exc
    label = _relative_path(relative.as_posix(), "manifest_path")
    return root, label


def build_direct6_root_refinement_package(
    manifest_path: Path,
    output_dir: Path,
    *,
    expected_manifest_sha256: str,
    repo_root: Path | None = None,
) -> tuple[RunPacket, PackageResult]:
    """Authenticate, reconstruct, and immutably emit one direct6 package.

    Paths in the manifest are relative to ``repo_root``.  The independently
    supplied manifest digest is mandatory: a moving live manifest is never an
    accepted ingress source.
    """

    expected_manifest_digest = _digest(
        expected_manifest_sha256, "expected_manifest_sha256"
    )
    root_path, manifest_label = _resolve_manifest_root(manifest_path, repo_root)
    custody = _InputCustody(root_path)
    try:
        manifest_snapshot = custody.capture(
            manifest_label, maximum_bytes=_MAX_MANIFEST_BYTES
        )
        if manifest_snapshot.sha256 != expected_manifest_digest:
            raise Direct6PackageError("lane manifest does not match the pinned digest")
        manifest = _strict_canonical_json(
            manifest_snapshot.content, path="lane manifest"
        )
        _exact_keys(manifest, _TOP_KEYS, "lane manifest")
        if manifest["schema"] != LANE_SCHEMA:
            raise Direct6PackageError(f"manifest.schema must be {LANE_SCHEMA!r}")

        _lane, order_sha256 = _validate_lane(manifest["lane"])
        claims = _validate_claims(manifest["claims"])

        producer = _object(manifest["producer"], "producer")
        _exact_keys(producer, _PRODUCER_KEYS, "producer")
        commit = _string(producer["git_commit"], "producer.git_commit")
        if _COMMIT_RE.fullmatch(commit) is None:
            raise Direct6PackageError(
                "producer.git_commit must be an exact 40-hex commit"
            )
        _argv(producer["argv"], "producer.argv")
        _string(producer["executable"], "producer.executable")
        _string(producer["version"], "producer.version")
        producer_sources = _validate_inventory(
            producer["source_files"], path="producer.source_files", custody=custody
        )
        if not producer_sources:
            raise Direct6PackageError("producer.source_files must not be empty")

        root = _object(manifest["root"], "root")
        _exact_keys(root, _ROOT_KEYS, "root")
        root_cnf_record = _object(root["cnf"], "root.cnf")
        root_snapshot = _bind_snapshot(
            root_cnf_record,
            path="root.cnf",
            keys=_FILE_REF_KEYS,
            custody=custody,
            maximum_bytes=MAX_AGGREGATE_BYTES,
        )
        root_variables = _integer(root["num_vars"], "root.num_vars", minimum=1)
        root_clauses = _integer(root["num_clauses"], "root.num_clauses", minimum=1)
        if not root_snapshot.content.endswith(b"\n"):
            raise Direct6PackageError("root CNF must end with a newline")
        try:
            scanned_variables, scanned_clauses = scan_dimacs(root_snapshot.content)
        except PiqdOracleError as exc:
            raise Direct6PackageError("root CNF failed raw-DIMACS validation") from exc
        header_start, header_end, header_variables, header_clauses = (
            _header_clause_span(root_snapshot.content)
        )
        if (
            scanned_variables != root_variables
            or scanned_clauses != root_clauses
            or header_variables != root_variables
            or header_clauses != root_clauses
            or _rewrite_clause_count(root_snapshot.content, root_clauses)
            != root_snapshot.content
            or header_start >= header_end
        ):
            raise Direct6PackageError("root CNF dimensions/header mismatch")

        _root_manifest_snapshot, root_manifest = _validate_json_artifact(
            root["manifest"], path="root.manifest", custody=custody
        )
        _root_validation_snapshot, root_validation = _validate_json_artifact(
            root["validation"], path="root.validation", custody=custody
        )
        if (
            type(root_manifest.get("variables")) is not int
            or root_manifest["variables"] != root_variables
            or type(root_manifest.get("clauses")) is not int
            or root_manifest["clauses"] != root_clauses
            or root_manifest.get("order") != list(EXACT17_ORDER)
        ):
            raise Direct6PackageError("root.manifest dimensions/order mismatch")
        if (
            root_validation.get("status") != "PASS"
            or type(root_validation.get("variables")) is not int
            or root_validation["variables"] != root_variables
            or type(root_validation.get("clauses")) is not int
            or root_validation["clauses"] != root_clauses
        ):
            raise Direct6PackageError(
                "root.validation is not the matching PASS receipt"
            )

        variable_map = _object(manifest["variable_map"], "variable_map")
        _exact_keys(variable_map, _VARIABLE_MAP_KEYS, "variable_map")
        map_snapshot, map_document = _validate_json_artifact(
            variable_map["artifact"],
            path="variable_map.artifact",
            custody=custody,
            canonical=True,
        )
        _exact_keys(map_document, _VARIABLE_MAP_DOCUMENT_KEYS, "variable map document")
        entries = _array(map_document["entries"], "variable map document.entries")
        if (
            _integer(variable_map["entry_count"], "variable_map.entry_count", minimum=1)
            != root_variables
            or _digest(variable_map["order_sha256"], "variable_map.order_sha256")
            != order_sha256
            or variable_map["schema"] != VARIABLE_MAP_SCHEMA
            or map_document.get("schema") != VARIABLE_MAP_SCHEMA
            or map_document.get("order") != list(EXACT17_ORDER)
            or len(entries) != root_variables
        ):
            raise Direct6PackageError("variable map dimension/order binding mismatch")
        encoded_entries: set[bytes] = set()
        for index, entry in enumerate(entries):
            if type(entry) is not list or not entry:
                raise Direct6PackageError(
                    f"variable map document.entries[{index}] must be a nonempty list"
                )
            _require_builtin_json(entry, f"variable map document.entries[{index}]")
            encoded = canonical_json_bytes(entry)
            if encoded in encoded_entries:
                raise Direct6PackageError("variable map entries must be unique")
            encoded_entries.add(encoded)
        reconstructor = _object(
            variable_map["reconstructor"], "variable_map.reconstructor"
        )
        _exact_keys(reconstructor, _RECONSTRUCTOR_KEYS, "variable_map.reconstructor")
        reconstructor_path = _relative_path(
            reconstructor["source"], "variable_map.reconstructor.source"
        )
        reconstructor_snapshot = custody.capture(
            reconstructor_path, maximum_bytes=_MAX_SOURCE_BYTES
        )
        _string(reconstructor["function"], "variable_map.reconstructor.function")
        inventory_copy = producer_sources.get(reconstructor_path)
        if (
            inventory_copy is None
            or inventory_copy.sha256 != reconstructor_snapshot.sha256
        ):
            raise Direct6PackageError(
                "variable map reconstructor must occur in producer.source_files"
            )

        refinements = _array(manifest["refinements"], "refinements")
        if len(refinements) != 8:
            raise Direct6PackageError("refinements must contain exactly eight entries")
        fragments: list[bytes] = []
        parent_formula = root_snapshot.content
        parent_count = root_clauses
        for ordinal, item in enumerate(refinements):
            path = f"refinements[{ordinal}]"
            refinement = _object(item, path)
            _exact_keys(refinement, _REFINEMENT_KEYS, path)
            if _integer(refinement["ordinal"], f"{path}.ordinal") != ordinal:
                raise Direct6PackageError("refinement ordinals must be dense 0..7")
            expected_kind = "cut_round" if ordinal < 7 else "pair_closure"
            if _string(refinement["kind"], f"{path}.kind") != expected_kind:
                raise Direct6PackageError(
                    "refinement kinds must be cut_round x7 followed by pair_closure"
                )
            expected_receipt_schema = (
                "p97-piqd-two-kalmanson-label-cut-admission-v1"
                if ordinal < 2
                else "p97-piqd-two-kalmanson-label-cut-admission-v2"
                if ordinal < 7
                else "p97-piqd-two-kalmanson-pair-closure-admission-v3"
            )
            receipt_schema = _string(
                refinement["receipt_schema"], f"{path}.receipt_schema"
            )
            if receipt_schema != expected_receipt_schema:
                raise Direct6PackageError(f"{path} receipt schema mismatch")
            _receipt_snapshot, receipt_document = _validate_json_artifact(
                refinement["receipt"], path=f"{path}.receipt", custody=custody
            )
            if receipt_document.get("schema") != receipt_schema:
                raise Direct6PackageError(f"{path} receipt schema binding mismatch")
            provenance = _object(refinement["provenance"], f"{path}.provenance")
            provenance_keys = (
                _CUT_PROVENANCE_KEYS if ordinal < 7 else _PAIR_PROVENANCE_KEYS
            )
            _exact_keys(provenance, provenance_keys, f"{path}.provenance")
            session_id = _string(
                provenance["session_id"], f"{path}.provenance.session_id"
            )
            if (
                receipt_document.get("session_id") != session_id
                or receipt_document.get("order") != list(EXACT17_ORDER)
                or type(receipt_document.get("variables")) is not int
                or receipt_document["variables"] != root_variables
            ):
                raise Direct6PackageError(f"{path} receipt provenance mismatch")

            if ordinal < 7:
                analysis_snapshot = _capture_path_digest(
                    path_value=provenance["analysis"],
                    digest_value=provenance["analysis_sha256"],
                    path=f"{path}.provenance.analysis",
                    custody=custody,
                    maximum_bytes=_MAX_JSON_ARTIFACT_BYTES,
                )
                _strict_json(
                    analysis_snapshot.content,
                    path=f"{path}.provenance.analysis",
                    canonical=False,
                )
                model_snapshot = _capture_path_digest(
                    path_value=provenance["model_log"],
                    digest_value=provenance["model_log_sha256"],
                    path=f"{path}.provenance.model_log",
                    custody=custody,
                    maximum_bytes=_MAX_JSON_ARTIFACT_BYTES,
                )
                if (
                    receipt_document.get("analysis") != analysis_snapshot.path
                    or receipt_document.get("analysis_sha256")
                    != analysis_snapshot.sha256
                    or receipt_document.get("model_log") != model_snapshot.path
                    or receipt_document.get("model_log_sha256") != model_snapshot.sha256
                ):
                    raise Direct6PackageError(f"{path} cut provenance binding mismatch")
            else:
                batch_count = _integer(
                    provenance["batch_count"],
                    f"{path}.provenance.batch_count",
                    minimum=1,
                )
                selected_pair_count = _integer(
                    provenance["selected_pair_count"],
                    f"{path}.provenance.selected_pair_count",
                    minimum=1,
                )
                selected_pair_sha256 = _digest(
                    provenance["selected_pair_sha256"],
                    f"{path}.provenance.selected_pair_sha256",
                )
                batches = _array(
                    receipt_document.get("batches"), f"{path}.receipt.batches"
                )
                if (
                    len(batches) != batch_count
                    or receipt_document.get("selected_pair_count")
                    != selected_pair_count
                    or receipt_document.get("selected_pair_sha256")
                    != selected_pair_sha256
                ):
                    raise Direct6PackageError(
                        f"{path} pair provenance binding mismatch"
                    )

            fragment_record = _object(
                refinement["clause_fragment"], f"{path}.clause_fragment"
            )
            fragment_snapshot = _bind_snapshot(
                fragment_record,
                path=f"{path}.clause_fragment",
                keys=_FILE_REF_KEYS,
                custody=custody,
                maximum_bytes=MAX_AGGREGATE_BYTES,
            )
            actual_fragment_clauses = _validate_fragment(
                fragment_snapshot.content,
                num_variables=root_variables,
                path=f"{path}.clause_fragment",
            )
            declared_fragment_clauses = _integer(
                refinement["clause_count"],
                f"{path}.clause_count",
                minimum=1,
            )
            if (
                actual_fragment_clauses != declared_fragment_clauses
                or receipt_document.get("appended_clause_count")
                != declared_fragment_clauses
                or receipt_document.get("appended_clause_sha256")
                != fragment_snapshot.sha256
            ):
                raise Direct6PackageError(f"{path} fragment clause-count mismatch")

            if (
                _digest(
                    refinement["parent_formula_sha256"],
                    f"{path}.parent_formula_sha256",
                )
                != sha256_bytes(parent_formula)
                or _integer(
                    refinement["parent_clause_count"],
                    f"{path}.parent_clause_count",
                )
                != parent_count
            ):
                raise Direct6PackageError(f"{path} parent formula chain mismatch")

            fragments.append(fragment_snapshot.content)
            result_count = parent_count + actual_fragment_clauses
            rewritten_root = _rewrite_clause_count(root_snapshot.content, result_count)
            if (
                len(rewritten_root) + sum(len(fragment) for fragment in fragments)
                > MAX_AGGREGATE_BYTES
            ):
                raise Direct6PackageError("reconstructed aggregate exceeds 256 MiB")
            result_formula = rewritten_root + b"".join(fragments)
            if (
                _digest(
                    refinement["result_formula_sha256"],
                    f"{path}.result_formula_sha256",
                )
                != sha256_bytes(result_formula)
                or _integer(
                    refinement["result_clause_count"],
                    f"{path}.result_clause_count",
                )
                != result_count
            ):
                raise Direct6PackageError(f"{path} result formula chain mismatch")
            parent_formula = result_formula
            parent_count = result_count

        aggregate = _object(manifest["aggregate"], "aggregate")
        _exact_keys(aggregate, _AGGREGATE_KEYS, "aggregate")
        if (
            aggregate["algorithm"] != AGGREGATE_ALGORITHM
            or _integer(aggregate["version"], "aggregate.version", minimum=1)
            != AGGREGATE_VERSION
            or _integer(
                aggregate["upload_cap_bytes"],
                "aggregate.upload_cap_bytes",
                minimum=1,
            )
            != MAX_AGGREGATE_BYTES
            or _boolean(aggregate["within_upload_cap"], "aggregate.within_upload_cap")
            is not True
        ):
            raise Direct6PackageError("aggregate algorithm/version/cap mismatch")
        aggregate_bytes = parent_formula
        aggregate_sha = sha256_bytes(aggregate_bytes)
        if (
            _digest(aggregate["sha256"], "aggregate.sha256") != aggregate_sha
            or _integer(aggregate["byte_count"], "aggregate.byte_count")
            != len(aggregate_bytes)
            or _integer(aggregate["num_vars"], "aggregate.num_vars", minimum=1)
            != root_variables
            or _integer(aggregate["num_clauses"], "aggregate.num_clauses")
            != parent_count
        ):
            raise Direct6PackageError(
                "independently supplied aggregate identity mismatch"
            )
        try:
            final_variables, final_clauses = scan_dimacs(aggregate_bytes)
        except PiqdOracleError as exc:
            raise Direct6PackageError("aggregate failed raw-DIMACS validation") from exc
        if final_variables != root_variables or final_clauses != parent_count:
            raise Direct6PackageError("aggregate DIMACS dimensions mismatch")

        replay = _object(manifest["replay"], "replay")
        _exact_keys(replay, _REPLAY_KEYS, "replay")
        validator = _object(
            replay["source_model_validator"], "replay.source_model_validator"
        )
        _exact_keys(
            validator, _SOURCE_MODEL_VALIDATOR_KEYS, "replay.source_model_validator"
        )
        _argv(validator["argv_template"], "replay.source_model_validator.argv_template")
        validator_path = _relative_path(
            validator["path"], "replay.source_model_validator.path"
        )
        replay_sources = _validate_inventory(
            validator["source_files"],
            path="replay.source_model_validator.source_files",
            custody=custody,
        )
        validator_snapshot = replay_sources.get(validator_path)
        producer_validator = producer_sources.get(validator_path)
        if (
            len(replay_sources) != 1
            or validator_snapshot is None
            or producer_validator is None
            or producer_validator.sha256 != validator_snapshot.sha256
        ):
            raise Direct6PackageError(
                "source model validator must be the sole replay source and producer-bound"
            )
        structural_result = _string(
            replay["expected_structural_result"], "replay.expected_structural_result"
        )
        if structural_result != EXPECTED_STRUCTURAL_RESULT:
            raise Direct6PackageError("unexpected structural replay result label")
        exact_lra_result = _string(
            replay["expected_exact_global_lra_result"],
            "replay.expected_exact_global_lra_result",
        )
        if exact_lra_result != EXPECTED_EXACT_LRA_RESULT:
            raise Direct6PackageError("unexpected exact-global-LRA result")

        resource = _object(manifest["resource"], "resource")
        _exact_keys(resource, _RESOURCE_KEYS, "resource")
        if (
            _integer(
                resource["max_cores"],
                "resource.max_cores",
                minimum=1,
            )
            != 1
            or _integer(
                resource["max_solver_processes"],
                "resource.max_solver_processes",
                minimum=1,
            )
            != 1
            or _boolean(resource["parallel"], "resource.parallel")
        ):
            raise Direct6PackageError(
                "resource contract requires one core/process and no parallelism"
            )
        envelope = _array(
            resource["wall_time_envelope_seconds"],
            "resource.wall_time_envelope_seconds",
        )
        if envelope != [1, 900] or any(type(item) is not int for item in envelope):
            raise Direct6PackageError("wall-time envelope must be exactly [1, 900]")

        wave = {
            "schema": WAVE_SCHEMA,
            "wave_id": WAVE_ID,
            # This is the first generic runner wave for this package.  The eight
            # producer refinements are authenticated CNF construction steps,
            # not prior entries in the runner's checkpoint chain.
            "iteration": 0,
            "parent_checkpoint_sha256": None,
            "source": {
                "live_leaf": LIVE_LEAF,
                "ingress_hypotheses_sha256": manifest_snapshot.sha256,
                "finite_schema": LANE_SCHEMA,
                "cardinality_scope": LANE_SCOPE,
                "source_theorem": SOURCE_THEOREM,
            },
            "encoding": {
                "cnf_sha256": aggregate_sha,
                "variable_map_sha256": map_snapshot.sha256,
                "producer_manifest_sha256": manifest_snapshot.sha256,
                "num_variables": root_variables,
                "num_clauses": parent_count,
                "query_polarity": UNSAT_MEANS_OBSTRUCTION,
            },
            "execution": {
                "backend": "cadical",
                "solver_profile": "sat",
                "shard_id": 0,
                "shard_count": 1,
                "order_sha256": order_sha256,
                "seed": 97,
            },
            "promotion": {
                "evidence_classification": LOCAL_CERTIFICATE,
                "producer_theorem": None,
                "lift_theorem": None,
                "consumer_theorem": None,
            },
        }
        try:
            validate_wave_manifest(wave)
        except Exception as exc:  # exact public contract is the boundary
            raise Direct6PackageError("constructed wave manifest is invalid") from exc
        wave_bytes = canonical_json_bytes(wave)
        ingress_identity = raw_dimacs_identity(
            backend="cadical",
            solver_profile="sat",
            cnf_sha256=aggregate_sha,
            producer_manifest_sha256=manifest_snapshot.sha256,
            requested_core_limit=1,
        )
        result_payload = {
            "schema": PACKAGE_RESULT_SCHEMA,
            "lane_manifest_sha256": manifest_snapshot.sha256,
            "aggregate": {
                "sha256": aggregate_sha,
                "byte_count": len(aggregate_bytes),
                "num_variables": root_variables,
                "num_clauses": parent_count,
                "raw_dimacs_identity": ingress_identity,
            },
            "artifacts": {
                "discovery.cnf": aggregate_sha,
                "producer-manifest.json": manifest_snapshot.sha256,
                "variable-map.json": map_snapshot.sha256,
                "wave-manifest.json": sha256_bytes(wave_bytes),
            },
            "expected_outcome": "PIQD_DISCOVERY_ONLY",
            "exact_global_lra_result": exact_lra_result,
            "resource": resource,
            "claims": claims,
        }
        result_bytes = canonical_json_bytes(result_payload)
        files = {
            "discovery.cnf": aggregate_bytes,
            "producer-manifest.json": manifest_snapshot.content,
            "variable-map.json": map_snapshot.content,
            "wave-manifest.json": wave_bytes,
            "package-result.json": result_bytes,
        }
        _emit_immutable(output_dir, files)
        packet_wave = _strict_canonical_json(
            wave_bytes, path="constructed packet wave manifest"
        )
        packet_hashes = {
            name: sha256_bytes(payload) for name, payload in sorted(files.items())
        }
        artifact_hashes = MappingProxyType(dict(packet_hashes))
        packet = RunPacket(
            packet_id=WAVE_ID,
            cnf=aggregate_bytes,
            producer_manifest=manifest_snapshot.content,
            # The public generic runner serializes these mappings directly.
            # Give it exact JSON containers, isolated from immutable internal
            # package state, rather than MappingProxyType wrappers.
            wave_manifest=packet_wave,
            package_hashes=dict(packet_hashes),
            exact17_package=True,
        )
        if (
            packet.packet_id != wave["wave_id"]
            or canonical_json_bytes(packet.wave_manifest) != wave_bytes
            or packet.package_hashes["wave-manifest.json"]
            != sha256_bytes(canonical_json_bytes(packet.wave_manifest))
            or packet.package_hashes["discovery.cnf"] != sha256_bytes(packet.cnf)
            or packet.package_hashes["producer-manifest.json"]
            != sha256_bytes(packet.producer_manifest)
        ):
            raise Direct6PackageError("internal RunPacket binding failure")
        result = PackageResult(
            output_dir=Path(os.path.abspath(output_dir)),
            canonical_bytes=result_bytes,
            sha256=sha256_bytes(result_bytes),
            aggregate_sha256=aggregate_sha,
            aggregate_byte_count=len(aggregate_bytes),
            num_variables=root_variables,
            num_clauses=parent_count,
            artifact_hashes=artifact_hashes,
        )
        return packet, result
    finally:
        custody.close()


__all__ = [
    "AGGREGATE_ALGORITHM",
    "AGGREGATE_VERSION",
    "EXACT17_ANONYMOUS_POSITIONS",
    "EXACT17_ORDER",
    "LANE_LABEL",
    "LANE_SCHEMA",
    "LANE_SCOPE",
    "MAX_AGGREGATE_BYTES",
    "PACKAGE_RESULT_SCHEMA",
    "TERMINAL_SEMANTICS",
    "VARIABLE_MAP_SCHEMA",
    "Direct6PackageError",
    "PackageResult",
    "build_direct6_root_refinement_package",
]
