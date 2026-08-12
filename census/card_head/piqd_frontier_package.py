"""Authenticated, lane-neutral package boundary for P97 frontier queries.

This module owns custody metadata only.  Lane wrappers must materialize the
exact effective DIMACS for one query before calling the builder; no frontier
lane is imported here and no solver is invoked here.
"""

from __future__ import annotations

import json
import math
import os
import re
import stat
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    SAT_MEANS_COUNTEREXAMPLE,
    UNSAT_MEANS_OBSTRUCTION,
    canonical_json_bytes,
    sha256_bytes,
)
from census.p97_search.phase3_piqd_card_head_adapter import (
    DEFAULT_LIMITS,
    AuthenticatedPackageSnapshot,
    EndpointLimits,
)
from census.p97_search.phase3_piqd_oracle import PiqdOracleError, scan_dimacs

FRONTIER_PACKAGE_SCHEMA = "p97-piqd-frontier-production-package/v1"
FRONTIER_PROFILE_SCHEMA = "p97-piqd-frontier-lane-profile/v1"
VARIABLE_MAP_SCHEMA = "p97-piqd-frontier-total-variable-map/v1"
SOURCE_MANIFEST_SCHEMA = "p97-piqd-frontier-source-manifest/v1"
BUILD_PHASE_LEDGER_SCHEMA = "p97-piqd-frontier-build-phase-ledger/v1"

_LANES = frozenset({"B", "C", "DE", "DR", "E"})
_POLARITIES = frozenset({SAT_MEANS_COUNTEREXAMPLE, UNSAT_MEANS_OBSTRUCTION})
_SAFE_LABEL = re.compile(r"[A-Za-z0-9][A-Za-z0-9._:/+-]{0,255}\Z")
_HEX = frozenset("0123456789abcdef")
_CLOSED_CLAIMS = {
    "certificate_source_link_authenticated": False,
    "lean_replay_executed": False,
    "theorem_promotion_allowed": False,
    "source_entitlement_established": False,
    "theorem_coverage_established": False,
    "universal_lift_established": False,
    "lean_closure_established": False,
}


class FrontierPackageError(ValueError):
    """A frontier package input failed its closed boundary."""


def _positive_int(value: object, source: str) -> int:
    if type(value) is not int or value <= 0:
        raise FrontierPackageError(f"{source} must be a positive builtin int")
    return value


def _nonnegative_int(value: object, source: str) -> int:
    if type(value) is not int or value < 0:
        raise FrontierPackageError(f"{source} must be a nonnegative builtin int")
    return value


def _label(value: object, source: str) -> str:
    if type(value) is not str or _SAFE_LABEL.fullmatch(value) is None:
        raise FrontierPackageError(f"{source} is not a safe nonempty label")
    return value


def _text(value: object, source: str, *, maximum: int = 4096) -> str:
    if (
        type(value) is not str
        or not value
        or len(value.encode("utf-8")) > maximum
        or any(ord(char) < 32 for char in value)
    ):
        raise FrontierPackageError(f"{source} must be bounded nonempty text")
    return value


def _digest(value: object, source: str) -> str:
    if type(value) is not str or len(value) != 64 or any(c not in _HEX for c in value):
        raise FrontierPackageError(f"{source} must be a lowercase SHA-256")
    return value


def _exact_keys(value: dict[str, Any], expected: frozenset[str], source: str) -> None:
    actual = frozenset(value)
    if actual != expected:
        raise FrontierPackageError(
            f"{source} keys mismatch: missing={sorted(expected - actual)}, "
            f"extra={sorted(actual - expected)}"
        )


def _strict_json(raw: bytes, source: str, limits: EndpointLimits) -> dict[str, Any]:
    if type(raw) is not bytes or len(raw) > limits.json_bytes:
        raise FrontierPackageError(f"{source} bytes are invalid or oversized")

    def reject_constant(token: str) -> None:
        raise ValueError(f"non-finite JSON number: {token}")

    def pairs(items: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in items:
            if key in result:
                raise ValueError(f"duplicate JSON key: {key}")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw.decode("utf-8"),
            object_pairs_hook=pairs,
            parse_constant=reject_constant,
        )
    except (
        UnicodeDecodeError,
        json.JSONDecodeError,
        ValueError,
        RecursionError,
    ) as exc:
        raise FrontierPackageError(f"{source} is not strict JSON") from exc
    if type(value) is not dict:
        raise FrontierPackageError(f"{source} must contain one JSON object")
    nodes = 0
    pending: list[tuple[object, int]] = [(value, 1)]
    while pending:
        current, depth = pending.pop()
        nodes += 1
        if nodes > limits.json_nodes:
            raise FrontierPackageError(f"{source} exceeds JSON node limit")
        if depth > limits.json_depth:
            raise FrontierPackageError(f"{source} exceeds JSON depth limit")
        if type(current) is dict:
            pending.extend((child, depth + 1) for child in current.values())
        elif type(current) is list:
            pending.extend((child, depth + 1) for child in current)
        elif type(current) is float and not math.isfinite(current):
            raise FrontierPackageError(f"{source} contains a non-finite number")
    if canonical_json_bytes(value) != raw:
        raise FrontierPackageError(f"{source} must be canonical JSON")
    return value


@dataclass(frozen=True, slots=True)
class FrontierPackageLimits:
    """Bounds for package construction and path-backed source custody."""

    endpoint_limits: EndpointLimits = field(default=DEFAULT_LIMITS, repr=False)
    source_file_bytes: int = 8 * 1024 * 1024
    source_total_bytes: int = 64 * 1024 * 1024
    source_files: int = 256

    def __post_init__(self) -> None:
        if type(self.endpoint_limits) is not EndpointLimits:
            raise FrontierPackageError("endpoint_limits must be exactly EndpointLimits")
        _positive_int(self.source_file_bytes, "source_file_bytes")
        _positive_int(self.source_total_bytes, "source_total_bytes")
        _positive_int(self.source_files, "source_files")


DEFAULT_FRONTIER_LIMITS = FrontierPackageLimits()


@dataclass(frozen=True, slots=True)
class FileIdentity:
    device: int
    inode: int
    mode: int
    uid: int
    gid: int
    link_count: int
    size: int
    mtime_ns: int
    ctime_ns: int

    def __post_init__(self) -> None:
        for name in self.__dataclass_fields__:
            _nonnegative_int(getattr(self, name), f"file_identity.{name}")
        if self.link_count != 1:
            raise FrontierPackageError("source file must have exactly one link")
        if not stat.S_ISREG(self.mode):
            raise FrontierPackageError("source file must be regular")


@dataclass(frozen=True, slots=True)
class MemorySourceSnapshot:
    """Exact caller-supplied source bytes, distinct from filesystem capture."""

    logical_path: str
    content: bytes

    def __post_init__(self) -> None:
        _logical_path(self.logical_path)
        if type(self.content) is not bytes:
            raise FrontierPackageError("memory source content must be exact bytes")


@dataclass(frozen=True, slots=True)
class PathSourceSnapshot:
    """Exact source bytes captured through a no-follow filesystem walk."""

    logical_path: str
    capture_root: str
    relative_path: str
    content: bytes
    identity: FileIdentity

    def __post_init__(self) -> None:
        _logical_path(self.logical_path)
        _relative_path(self.relative_path)
        if (
            type(self.capture_root) is not str
            or not Path(self.capture_root).is_absolute()
        ):
            raise FrontierPackageError("capture_root must be an absolute string path")
        if type(self.content) is not bytes:
            raise FrontierPackageError("path source content must be exact bytes")
        if type(self.identity) is not FileIdentity:
            raise FrontierPackageError(
                "path source identity must be exactly FileIdentity"
            )


SourceSnapshot = MemorySourceSnapshot | PathSourceSnapshot


def _logical_path(value: object) -> str:
    if type(value) is not str or not value or "\\" in value or "\x00" in value:
        raise FrontierPackageError("logical_path must be a safe relative POSIX path")
    if len(value.encode("utf-8")) > 512:
        raise FrontierPackageError("logical_path is oversized")
    parts = value.split("/")
    if any(part in {"", ".", ".."} for part in parts) or value.startswith("/"):
        raise FrontierPackageError("logical_path must be a safe relative POSIX path")
    return value


def _relative_path(value: object) -> str:
    if (
        type(value) is not str
        or not value
        or "\x00" in value
        or "\\" in value
        or any(part in {"", ".", ".."} for part in value.split("/"))
    ):
        raise FrontierPackageError("relative_path must be a safe relative path")
    path = Path(value)
    if path.is_absolute():
        raise FrontierPackageError("relative_path must be a safe relative path")
    return value


def snapshot_source_bytes(
    logical_path: str,
    content: bytes,
    *,
    limits: FrontierPackageLimits = DEFAULT_FRONTIER_LIMITS,
) -> MemorySourceSnapshot:
    """Close exact in-memory source bytes under the source bounds."""

    if type(limits) is not FrontierPackageLimits:
        raise FrontierPackageError("limits must be exactly FrontierPackageLimits")
    snapshot = MemorySourceSnapshot(logical_path=logical_path, content=content)
    if len(content) > limits.source_file_bytes:
        raise FrontierPackageError("memory source exceeds source_file_bytes")
    return snapshot


def _identity(info: os.stat_result) -> FileIdentity:
    return FileIdentity(
        device=info.st_dev,
        inode=info.st_ino,
        mode=info.st_mode,
        uid=info.st_uid,
        gid=info.st_gid,
        link_count=info.st_nlink,
        size=info.st_size,
        mtime_ns=info.st_mtime_ns,
        ctime_ns=info.st_ctime_ns,
    )


def _open_root(root: Path) -> int:
    if not root.is_absolute() or any(part == ".." for part in root.parts):
        raise FrontierPackageError("capture root must be absolute without '..'")
    flags = os.O_RDONLY | os.O_DIRECTORY | os.O_CLOEXEC | os.O_NOFOLLOW
    fd = os.open("/", flags)
    try:
        for part in root.parts[1:]:
            if part in {"", ".", ".."}:
                raise FrontierPackageError("capture root contains an unsafe component")
            next_fd = os.open(part, flags, dir_fd=fd)
            os.close(fd)
            fd = next_fd
        return fd
    except BaseException:
        os.close(fd)
        raise


def _read_source_once(
    root: Path, relative_path: str, maximum: int
) -> tuple[bytes, FileIdentity]:
    components = Path(relative_path).parts
    directory_fd = _open_root(root)
    file_fd: int | None = None
    try:
        directory_flags = os.O_RDONLY | os.O_DIRECTORY | os.O_CLOEXEC | os.O_NOFOLLOW
        for component in components[:-1]:
            next_fd = os.open(component, directory_flags, dir_fd=directory_fd)
            os.close(directory_fd)
            directory_fd = next_fd
        file_fd = os.open(
            components[-1],
            os.O_RDONLY | os.O_CLOEXEC | os.O_NOFOLLOW,
            dir_fd=directory_fd,
        )
        before = _identity(os.fstat(file_fd))
        if before.size > maximum:
            raise FrontierPackageError("source file exceeds source_file_bytes")
        chunks: list[bytes] = []
        remaining = before.size
        while remaining:
            chunk = os.read(file_fd, min(remaining, 1024 * 1024))
            if not chunk:
                raise FrontierPackageError("source file shortened during capture")
            chunks.append(chunk)
            remaining -= len(chunk)
        if os.read(file_fd, 1):
            raise FrontierPackageError("source file grew during capture")
        after = _identity(os.fstat(file_fd))
        if before != after:
            raise FrontierPackageError("source identity changed during capture")
        return b"".join(chunks), before
    except (OSError, FrontierPackageError) as exc:
        if isinstance(exc, FrontierPackageError):
            raise
        raise FrontierPackageError("source path capture failed closed") from exc
    finally:
        if file_fd is not None:
            os.close(file_fd)
        os.close(directory_fd)


def capture_source_file(
    root: Path,
    relative_path: str,
    *,
    logical_path: str | None = None,
    limits: FrontierPackageLimits = DEFAULT_FRONTIER_LIMITS,
) -> PathSourceSnapshot:
    """Capture and immediately identity/hash recheck one no-follow regular file."""

    if not isinstance(root, Path):
        raise FrontierPackageError("root must be a pathlib.Path")
    if type(limits) is not FrontierPackageLimits:
        raise FrontierPackageError("limits must be exactly FrontierPackageLimits")
    _relative_path(relative_path)
    logical = relative_path if logical_path is None else logical_path
    _logical_path(logical)
    try:
        first_bytes, first_identity = _read_source_once(
            root, relative_path, limits.source_file_bytes
        )
        second_bytes, second_identity = _read_source_once(
            root, relative_path, limits.source_file_bytes
        )
    except OSError as exc:
        raise FrontierPackageError("source path capture failed closed") from exc
    if first_identity != second_identity or first_bytes != second_bytes:
        raise FrontierPackageError("source changed across capture recheck")
    if sha256_bytes(first_bytes) != sha256_bytes(second_bytes):
        raise FrontierPackageError("source hash changed across capture recheck")
    return PathSourceSnapshot(
        logical_path=logical,
        capture_root=str(root),
        relative_path=relative_path,
        content=first_bytes,
        identity=first_identity,
    )


def _dimacs(cnf: bytes, limits: EndpointLimits) -> tuple[int, int, frozenset[int]]:
    if type(cnf) is not bytes or len(cnf) > limits.cnf_bytes:
        raise FrontierPackageError("CNF bytes are invalid or oversized")
    try:
        num_vars, num_clauses = scan_dimacs(cnf)
    except (ValueError, PiqdOracleError) as exc:
        raise FrontierPackageError(str(exc)) from exc
    if num_vars <= 0:
        raise FrontierPackageError("frontier CNF must declare at least one variable")
    used: set[int] = set()
    for raw_line in cnf.splitlines():
        line = raw_line.decode("ascii").strip()
        if not line or line.startswith(("c", "p")):
            continue
        used.update(abs(int(token)) for token in line.split() if int(token) != 0)
    return num_vars, num_clauses, frozenset(used)


def build_complete_variable_map(
    cnf: bytes,
    named_variables: dict[str, int],
    *,
    limits: EndpointLimits = DEFAULT_LIMITS,
) -> bytes:
    """Build a canonical map covering every DIMACS ID, including auxiliaries."""

    if type(limits) is not EndpointLimits:
        raise FrontierPackageError("limits must be exactly EndpointLimits")
    if type(named_variables) is not dict:
        raise FrontierPackageError("named_variables must be an exact builtin dict")
    num_vars, _, used = _dimacs(cnf, limits)
    by_id: dict[int, str] = {}
    for name, variable_id in named_variables.items():
        _text(name, "variable name", maximum=512)
        if type(variable_id) is not int or not 1 <= variable_id <= num_vars:
            raise FrontierPackageError(
                "variable IDs must be builtin ints in DIMACS range"
            )
        if variable_id in by_id:
            raise FrontierPackageError("named variable IDs must be unique")
        by_id[variable_id] = name
    entries = []
    for variable_id in range(1, num_vars + 1):
        name = by_id.get(variable_id)
        entries.append(
            {
                "id": variable_id,
                "kind": "named" if name is not None else "anonymous_auxiliary",
                "name": name
                if name is not None
                else f"anonymous_auxiliary:{variable_id}",
                "used_in_cnf": variable_id in used,
            }
        )
    result = canonical_json_bytes(
        {
            "coverage": "COMPLETE_1_TO_NUM_VARIABLES",
            "entries": entries,
            "num_variables": num_vars,
            "schema": VARIABLE_MAP_SCHEMA,
        }
    )
    _validate_variable_map(result, cnf, limits)
    return result


def _validate_variable_map(
    raw: bytes, cnf: bytes, limits: EndpointLimits
) -> tuple[int, int]:
    value = _strict_json(raw, "variable map", limits)
    _exact_keys(
        value,
        frozenset({"schema", "coverage", "num_variables", "entries"}),
        "variable map",
    )
    if (
        value["schema"] != VARIABLE_MAP_SCHEMA
        or value["coverage"] != "COMPLETE_1_TO_NUM_VARIABLES"
    ):
        raise FrontierPackageError("variable map schema or coverage is invalid")
    num_vars, num_clauses, used = _dimacs(cnf, limits)
    if type(value["num_variables"]) is not int or value["num_variables"] != num_vars:
        raise FrontierPackageError("variable map DIMACS dimension mismatch")
    entries = value["entries"]
    if type(entries) is not list or len(entries) != num_vars:
        raise FrontierPackageError(
            "variable map must contain exactly num_variables entries"
        )
    seen_names: set[str] = set()
    for expected_id, entry in enumerate(entries, start=1):
        if type(entry) is not dict:
            raise FrontierPackageError("variable map entries must be exact objects")
        _exact_keys(
            entry, frozenset({"id", "kind", "name", "used_in_cnf"}), "variable entry"
        )
        if type(entry["id"]) is not int or entry["id"] != expected_id:
            raise FrontierPackageError(
                "variable map IDs must be exactly 1..num_variables"
            )
        name = _text(entry["name"], "variable name", maximum=512)
        if name in seen_names:
            raise FrontierPackageError("variable names must be unique")
        seen_names.add(name)
        if type(entry["kind"]) is not str or entry["kind"] not in {
            "named",
            "anonymous_auxiliary",
        }:
            raise FrontierPackageError("variable kind is invalid")
        if (
            entry["kind"] == "anonymous_auxiliary"
            and name != f"anonymous_auxiliary:{expected_id}"
        ):
            raise FrontierPackageError("anonymous auxiliary name is not deterministic")
        if type(entry["used_in_cnf"]) is not bool or entry["used_in_cnf"] != (
            expected_id in used
        ):
            raise FrontierPackageError("variable used_in_cnf flag drifted")
    return num_vars, num_clauses


@dataclass(frozen=True, slots=True)
class BuildAllocation:
    first_id: int
    last_id: int
    purpose: str

    def __post_init__(self) -> None:
        _positive_int(self.first_id, "allocation.first_id")
        _positive_int(self.last_id, "allocation.last_id")
        if self.last_id < self.first_id:
            raise FrontierPackageError("allocation last_id precedes first_id")
        _text(self.purpose, "allocation purpose", maximum=512)


@dataclass(frozen=True, slots=True)
class BuildQuery:
    query_id: str
    cnf_sha256: str
    num_variables: int
    num_clauses: int

    def __post_init__(self) -> None:
        _label(self.query_id, "query_id")
        _digest(self.cnf_sha256, "query cnf_sha256")
        _positive_int(self.num_variables, "query num_variables")
        _nonnegative_int(self.num_clauses, "query num_clauses")

    @classmethod
    def from_cnf(
        cls, query_id: str, cnf: bytes, *, limits: EndpointLimits = DEFAULT_LIMITS
    ) -> BuildQuery:
        num_vars, num_clauses, _ = _dimacs(cnf, limits)
        return cls(query_id, sha256_bytes(cnf), num_vars, num_clauses)


@dataclass(frozen=True, slots=True)
class BuildPhase:
    phase_name: str
    allocations: tuple[BuildAllocation, ...]
    allocator_num_variables: int
    query: BuildQuery | None = None

    def __post_init__(self) -> None:
        _text(self.phase_name, "phase_name", maximum=512)
        if type(self.allocations) is not tuple or any(
            type(item) is not BuildAllocation for item in self.allocations
        ):
            raise FrontierPackageError(
                "allocations must be an exact tuple of BuildAllocation"
            )
        _positive_int(self.allocator_num_variables, "allocator_num_variables")
        if self.query is not None and type(self.query) is not BuildQuery:
            raise FrontierPackageError("query must be exactly BuildQuery or None")
        if not self.allocations and self.query is None:
            raise FrontierPackageError(
                "build phase must allocate variables or close a query"
            )


def build_phase_ledger(phases: tuple[BuildPhase, ...], target_query: str) -> bytes:
    """Build an exact chronological allocation/query ledger for one query."""

    if (
        type(phases) is not tuple
        or not phases
        or any(type(item) is not BuildPhase for item in phases)
    ):
        raise FrontierPackageError(
            "phases must be a nonempty exact tuple of BuildPhase"
        )
    _label(target_query, "target_query")
    watermark = 0
    phase_names: set[str] = set()
    query_names: set[str] = set()
    encoded = []
    for index, phase in enumerate(phases):
        if phase.phase_name in phase_names:
            raise FrontierPackageError("phase names must be unique")
        phase_names.add(phase.phase_name)
        allocations = []
        for allocation in phase.allocations:
            if allocation.first_id != watermark + 1:
                raise FrontierPackageError("allocation ledger has a gap or overlap")
            watermark = allocation.last_id
            allocations.append(
                {
                    "first_id": allocation.first_id,
                    "last_id": allocation.last_id,
                    "purpose": allocation.purpose,
                }
            )
        if phase.allocator_num_variables != watermark:
            raise FrontierPackageError("allocator watermark drifted from allocations")
        query_value = None
        if phase.query is not None:
            if phase.query.query_id in query_names:
                raise FrontierPackageError("query IDs must be unique")
            query_names.add(phase.query.query_id)
            if phase.query.num_variables != watermark:
                raise FrontierPackageError(
                    "query header does not match allocator watermark"
                )
            query_value = {
                "cnf_sha256": phase.query.cnf_sha256,
                "num_clauses": phase.query.num_clauses,
                "num_variables": phase.query.num_variables,
                "query_id": phase.query.query_id,
            }
        encoded.append(
            {
                "allocations": allocations,
                "allocator_num_variables": phase.allocator_num_variables,
                "phase_index": index,
                "phase_name": phase.phase_name,
                "query": query_value,
            }
        )
    if phases[-1].query is None or phases[-1].query.query_id != target_query:
        raise FrontierPackageError("target_query must be the final ledger query")
    return canonical_json_bytes(
        {
            "phases": encoded,
            "schema": BUILD_PHASE_LEDGER_SCHEMA,
            "target_query": target_query,
        }
    )


_LEDGER_KEYS = frozenset({"schema", "target_query", "phases"})
_PHASE_KEYS = frozenset(
    {"phase_index", "phase_name", "allocations", "allocator_num_variables", "query"}
)
_ALLOCATION_KEYS = frozenset({"first_id", "last_id", "purpose"})
_QUERY_KEYS = frozenset({"query_id", "cnf_sha256", "num_variables", "num_clauses"})


def _validate_ledger(
    raw: bytes, cnf: bytes, limits: EndpointLimits
) -> tuple[str, int, int]:
    value = _strict_json(raw, "build phase ledger", limits)
    _exact_keys(value, _LEDGER_KEYS, "build phase ledger")
    if value["schema"] != BUILD_PHASE_LEDGER_SCHEMA:
        raise FrontierPackageError("build phase ledger schema is invalid")
    target = _label(value["target_query"], "target_query")
    phases_value = value["phases"]
    if type(phases_value) is not list or not phases_value:
        raise FrontierPackageError("build phase ledger phases must be a nonempty list")
    phases: list[BuildPhase] = []
    for index, item in enumerate(phases_value):
        if type(item) is not dict:
            raise FrontierPackageError("build phase must be an exact object")
        _exact_keys(item, _PHASE_KEYS, "build phase")
        if type(item["phase_index"]) is not int or item["phase_index"] != index:
            raise FrontierPackageError(
                "build phase indices must be consecutive builtin ints"
            )
        allocations_value = item["allocations"]
        if type(allocations_value) is not list:
            raise FrontierPackageError("allocations must be an exact list")
        allocations: list[BuildAllocation] = []
        for allocation in allocations_value:
            if type(allocation) is not dict:
                raise FrontierPackageError("allocation must be an exact object")
            _exact_keys(allocation, _ALLOCATION_KEYS, "allocation")
            allocations.append(
                BuildAllocation(
                    allocation["first_id"], allocation["last_id"], allocation["purpose"]
                )
            )
        query_value = item["query"]
        query = None
        if query_value is not None:
            if type(query_value) is not dict:
                raise FrontierPackageError("query must be an exact object or null")
            _exact_keys(query_value, _QUERY_KEYS, "query")
            query = BuildQuery(
                query_value["query_id"],
                query_value["cnf_sha256"],
                query_value["num_variables"],
                query_value["num_clauses"],
            )
        phases.append(
            BuildPhase(
                item["phase_name"],
                tuple(allocations),
                item["allocator_num_variables"],
                query,
            )
        )
    if build_phase_ledger(tuple(phases), target) != raw:
        raise FrontierPackageError("build phase ledger failed canonical replay")
    num_vars, num_clauses, _ = _dimacs(cnf, limits)
    final = phases[-1]
    assert final.query is not None
    if (
        final.query.cnf_sha256 != sha256_bytes(cnf)
        or final.query.num_variables != num_vars
        or final.query.num_clauses != num_clauses
    ):
        raise FrontierPackageError(
            "target query does not authenticate exact package CNF"
        )
    return target, num_vars, num_clauses


@dataclass(frozen=True, slots=True)
class FrontierLaneProfile:
    lane: str
    query_id: str
    wave_id: str
    live_leaf: str
    finite_schema: str
    cardinality_scope: str
    source_theorem: str
    query_polarity: str

    def __post_init__(self) -> None:
        if type(self.lane) is not str or self.lane not in _LANES:
            raise FrontierPackageError("lane must be one of B/C/DE/DR/E")
        for name in ("query_id", "wave_id"):
            _label(getattr(self, name), name)
        for name in (
            "live_leaf",
            "finite_schema",
            "cardinality_scope",
            "source_theorem",
        ):
            _text(getattr(self, name), name)
        if (
            type(self.query_polarity) is not str
            or self.query_polarity not in _POLARITIES
        ):
            raise FrontierPackageError("query_polarity is invalid")


def _profile_bytes(profile: FrontierLaneProfile) -> bytes:
    return canonical_json_bytes(
        {
            "claims": _CLOSED_CLAIMS,
            "evidence_classification": LOCAL_CERTIFICATE,
            "cardinality_scope": profile.cardinality_scope,
            "finite_schema": profile.finite_schema,
            "lane": profile.lane,
            "live_leaf": profile.live_leaf,
            "query_id": profile.query_id,
            "query_polarity": profile.query_polarity,
            "schema": FRONTIER_PROFILE_SCHEMA,
            "semantic_status": "FINITE_LOCAL",
            "source_theorem": profile.source_theorem,
            "wave_id": profile.wave_id,
        }
    )


@dataclass(frozen=True, slots=True)
class FrontierAuthenticatedPackage:
    """Exact frontier custody bytes plus the existing authenticated snapshot."""

    cnf: bytes
    variable_map_bytes: bytes
    source_manifest_bytes: bytes
    source_snapshots: tuple[SourceSnapshot, ...]
    build_phase_ledger_bytes: bytes
    lane_profile_bytes: bytes
    producer_manifest_bytes: bytes
    wave_manifest_bytes: bytes
    limits: FrontierPackageLimits = field(repr=False)
    snapshot: AuthenticatedPackageSnapshot

    def __post_init__(self) -> None:
        _validate_constructed_package(self)


def _source_manifest(
    snapshots: tuple[SourceSnapshot, ...], limits: FrontierPackageLimits
) -> bytes:
    if type(snapshots) is not tuple or not snapshots:
        raise FrontierPackageError("source_snapshots must be a nonempty exact tuple")
    if len(snapshots) > limits.source_files:
        raise FrontierPackageError("source snapshot count exceeds source_files")
    entries = []
    total = 0
    previous = ""
    for snapshot in snapshots:
        if type(snapshot) not in {MemorySourceSnapshot, PathSourceSnapshot}:
            raise FrontierPackageError("source snapshot has a non-closed type")
        if snapshot.logical_path <= previous:
            raise FrontierPackageError(
                "source snapshots must be uniquely sorted by logical_path"
            )
        previous = snapshot.logical_path
        if len(snapshot.content) > limits.source_file_bytes:
            raise FrontierPackageError("source snapshot exceeds source_file_bytes")
        total += len(snapshot.content)
        if total > limits.source_total_bytes:
            raise FrontierPackageError("source snapshots exceed source_total_bytes")
        identity_value = None
        capture_root = None
        relative_path = None
        kind = "memory"
        if type(snapshot) is PathSourceSnapshot:
            kind = "path"
            capture_root = snapshot.capture_root
            relative_path = snapshot.relative_path
            try:
                current_bytes, current_identity = _read_source_once(
                    Path(snapshot.capture_root),
                    snapshot.relative_path,
                    limits.source_file_bytes,
                )
            except OSError as exc:
                raise FrontierPackageError(
                    "path source package recheck failed"
                ) from exc
            if (
                current_identity != snapshot.identity
                or current_bytes != snapshot.content
            ):
                raise FrontierPackageError("path source drifted after capture")
            identity_value = {
                name: getattr(snapshot.identity, name)
                for name in snapshot.identity.__dataclass_fields__
            }
        entries.append(
            {
                "byte_count": len(snapshot.content),
                "capture_kind": kind,
                "capture_root": capture_root,
                "file_identity": identity_value,
                "logical_path": snapshot.logical_path,
                "relative_path": relative_path,
                "sha256": sha256_bytes(snapshot.content),
            }
        )
    return canonical_json_bytes(
        {
            "entries": entries,
            "schema": SOURCE_MANIFEST_SCHEMA,
            "source_count": len(entries),
            "total_bytes": total,
        }
    )


_PROFILE_KEYS = frozenset(
    {
        "schema",
        "lane",
        "query_id",
        "wave_id",
        "query_polarity",
        "live_leaf",
        "finite_schema",
        "cardinality_scope",
        "source_theorem",
        "semantic_status",
        "evidence_classification",
        "claims",
    }
)


def _validate_profile_bytes(raw: bytes, limits: EndpointLimits) -> dict[str, Any]:
    value = _strict_json(raw, "lane profile", limits)
    _exact_keys(value, _PROFILE_KEYS, "lane profile")
    if value["schema"] != FRONTIER_PROFILE_SCHEMA:
        raise FrontierPackageError("lane profile schema is invalid")
    if type(value["lane"]) is not str or value["lane"] not in _LANES:
        raise FrontierPackageError("lane profile lane is invalid")
    _label(value["query_id"], "lane profile query_id")
    _label(value["wave_id"], "lane profile wave_id")
    for name in ("live_leaf", "finite_schema", "cardinality_scope", "source_theorem"):
        _text(value[name], f"lane profile {name}")
    if (
        type(value["query_polarity"]) is not str
        or value["query_polarity"] not in _POLARITIES
    ):
        raise FrontierPackageError("lane profile query polarity is invalid")
    if (
        value["semantic_status"] != "FINITE_LOCAL"
        or value["evidence_classification"] != LOCAL_CERTIFICATE
        or value["claims"] != _CLOSED_CLAIMS
    ):
        raise FrontierPackageError("lane profile claims are not closed finite evidence")
    return value


def _validate_constructed_package(package: FrontierAuthenticatedPackage) -> None:
    for name in (
        "cnf",
        "variable_map_bytes",
        "source_manifest_bytes",
        "build_phase_ledger_bytes",
        "lane_profile_bytes",
        "producer_manifest_bytes",
        "wave_manifest_bytes",
    ):
        if type(getattr(package, name)) is not bytes:
            raise FrontierPackageError(f"{name} must be exact bytes")
    if type(package.snapshot) is not AuthenticatedPackageSnapshot:
        raise FrontierPackageError(
            "snapshot must be exactly AuthenticatedPackageSnapshot"
        )
    if type(package.limits) is not FrontierPackageLimits:
        raise FrontierPackageError("limits must be exactly FrontierPackageLimits")
    if package.snapshot.limits is not package.limits.endpoint_limits:
        raise FrontierPackageError("snapshot limits differ from package limits")
    if (
        package.snapshot.cnf != package.cnf
        or package.snapshot.producer_manifest != package.producer_manifest_bytes
        or package.snapshot.wave_manifest_bytes != package.wave_manifest_bytes
    ):
        raise FrontierPackageError("package fields differ from authenticated snapshot")
    num_vars, num_clauses = _validate_variable_map(
        package.variable_map_bytes, package.cnf, package.snapshot.limits
    )
    target, ledger_vars, ledger_clauses = _validate_ledger(
        package.build_phase_ledger_bytes, package.cnf, package.snapshot.limits
    )
    profile = _validate_profile_bytes(
        package.lane_profile_bytes, package.snapshot.limits
    )
    if profile["query_id"] != target:
        raise FrontierPackageError("lane profile query differs from ledger target")
    if (ledger_vars, ledger_clauses) != (num_vars, num_clauses):
        raise FrontierPackageError("constructed package dimensions drifted")
    if type(package.source_snapshots) is not tuple or not package.source_snapshots:
        raise FrontierPackageError("source_snapshots must be a nonempty exact tuple")
    if any(
        type(snapshot) not in {MemorySourceSnapshot, PathSourceSnapshot}
        for snapshot in package.source_snapshots
    ):
        raise FrontierPackageError("source snapshot has a non-closed type")
    if (
        _source_manifest(package.source_snapshots, package.limits)
        != package.source_manifest_bytes
    ):
        raise FrontierPackageError(
            "source manifest differs from exact source snapshots"
        )
    producer = _strict_json(
        package.producer_manifest_bytes, "producer manifest", package.snapshot.limits
    )
    expected_producer = {
        "build_phase_ledger_sha256": sha256_bytes(package.build_phase_ledger_bytes),
        "claims": _CLOSED_CLAIMS,
        "cnf_sha256": sha256_bytes(package.cnf),
        "evidence_classification": LOCAL_CERTIFICATE,
        "lane_profile_sha256": sha256_bytes(package.lane_profile_bytes),
        "num_clauses": num_clauses,
        "num_variables": num_vars,
        "schema": FRONTIER_PACKAGE_SCHEMA,
        "semantic_status": "FINITE_LOCAL",
        "source_manifest_sha256": sha256_bytes(package.source_manifest_bytes),
        "variable_map_sha256": sha256_bytes(package.variable_map_bytes),
    }
    if producer != expected_producer:
        raise FrontierPackageError(
            "producer manifest is not the exact frontier binding"
        )
    wave = package.snapshot.wave_manifest
    if (
        wave["wave_id"] != profile["wave_id"]
        or wave["encoding"]["query_polarity"] != profile["query_polarity"]
        or wave["encoding"]["variable_map_sha256"]
        != sha256_bytes(package.variable_map_bytes)
        or wave["execution"]["order_sha256"]
        != sha256_bytes(package.build_phase_ledger_bytes)
        or wave["source"]["ingress_hypotheses_sha256"]
        != sha256_bytes(package.source_manifest_bytes)
        or wave["source"]["live_leaf"] != profile["live_leaf"]
        or wave["source"]["finite_schema"] != profile["finite_schema"]
        or wave["source"]["cardinality_scope"] != profile["cardinality_scope"]
        or wave["source"]["source_theorem"] != profile["source_theorem"]
    ):
        raise FrontierPackageError(
            "wave manifest differs from frontier custody records"
        )


def build_frontier_authenticated_package(
    *,
    cnf: bytes,
    variable_map_bytes: bytes,
    source_snapshots: tuple[SourceSnapshot, ...],
    build_phase_ledger_bytes: bytes,
    lane_profile: FrontierLaneProfile,
    limits: FrontierPackageLimits = DEFAULT_FRONTIER_LIMITS,
) -> FrontierAuthenticatedPackage:
    """Build one authenticated package for one exact materialized query CNF."""

    if type(limits) is not FrontierPackageLimits:
        raise FrontierPackageError("limits must be exactly FrontierPackageLimits")
    if type(lane_profile) is not FrontierLaneProfile:
        raise FrontierPackageError("lane_profile must be exactly FrontierLaneProfile")
    num_vars, num_clauses = _validate_variable_map(
        variable_map_bytes, cnf, limits.endpoint_limits
    )
    target_query, ledger_vars, ledger_clauses = _validate_ledger(
        build_phase_ledger_bytes, cnf, limits.endpoint_limits
    )
    if target_query != lane_profile.query_id:
        raise FrontierPackageError("lane profile query_id differs from ledger target")
    if (ledger_vars, ledger_clauses) != (num_vars, num_clauses):
        raise FrontierPackageError("package dimensions drifted across custody records")
    manifest_bytes = _source_manifest(source_snapshots, limits)
    profile_bytes = _profile_bytes(lane_profile)
    producer = canonical_json_bytes(
        {
            "build_phase_ledger_sha256": sha256_bytes(build_phase_ledger_bytes),
            "claims": _CLOSED_CLAIMS,
            "cnf_sha256": sha256_bytes(cnf),
            "evidence_classification": LOCAL_CERTIFICATE,
            "lane_profile_sha256": sha256_bytes(profile_bytes),
            "num_clauses": num_clauses,
            "num_variables": num_vars,
            "schema": FRONTIER_PACKAGE_SCHEMA,
            "semantic_status": "FINITE_LOCAL",
            "source_manifest_sha256": sha256_bytes(manifest_bytes),
            "variable_map_sha256": sha256_bytes(variable_map_bytes),
        }
    )
    wave = canonical_json_bytes(
        {
            "encoding": {
                "cnf_sha256": sha256_bytes(cnf),
                "num_clauses": num_clauses,
                "num_variables": num_vars,
                "producer_manifest_sha256": sha256_bytes(producer),
                "query_polarity": lane_profile.query_polarity,
                "variable_map_sha256": sha256_bytes(variable_map_bytes),
            },
            "execution": {
                "backend": "cadical",
                "order_sha256": sha256_bytes(build_phase_ledger_bytes),
                "seed": 97,
                "shard_count": 1,
                "shard_id": 0,
                "solver_profile": "sat",
            },
            "iteration": 0,
            "parent_checkpoint_sha256": None,
            "promotion": {
                "consumer_theorem": None,
                "evidence_classification": LOCAL_CERTIFICATE,
                "lift_theorem": None,
                "producer_theorem": None,
            },
            "schema": "p97-cegar-wave/v1",
            "source": {
                "cardinality_scope": lane_profile.cardinality_scope,
                "finite_schema": lane_profile.finite_schema,
                "ingress_hypotheses_sha256": sha256_bytes(manifest_bytes),
                "live_leaf": lane_profile.live_leaf,
                "source_theorem": lane_profile.source_theorem,
            },
            "wave_id": lane_profile.wave_id,
        }
    )
    try:
        snapshot = AuthenticatedPackageSnapshot(
            cnf=cnf,
            producer_manifest=producer,
            wave_manifest_bytes=wave,
            limits=limits.endpoint_limits,
        )
    except ValueError as exc:
        raise FrontierPackageError(
            "existing authenticated snapshot rejected package"
        ) from exc
    return FrontierAuthenticatedPackage(
        cnf=cnf,
        variable_map_bytes=variable_map_bytes,
        source_manifest_bytes=manifest_bytes,
        source_snapshots=source_snapshots,
        build_phase_ledger_bytes=build_phase_ledger_bytes,
        lane_profile_bytes=profile_bytes,
        producer_manifest_bytes=producer,
        wave_manifest_bytes=wave,
        limits=limits,
        snapshot=snapshot,
    )


__all__ = [
    "BUILD_PHASE_LEDGER_SCHEMA",
    "DEFAULT_FRONTIER_LIMITS",
    "FRONTIER_PACKAGE_SCHEMA",
    "FRONTIER_PROFILE_SCHEMA",
    "SOURCE_MANIFEST_SCHEMA",
    "VARIABLE_MAP_SCHEMA",
    "BuildAllocation",
    "BuildPhase",
    "BuildQuery",
    "FileIdentity",
    "FrontierAuthenticatedPackage",
    "FrontierLaneProfile",
    "FrontierPackageError",
    "FrontierPackageLimits",
    "MemorySourceSnapshot",
    "PathSourceSnapshot",
    "build_complete_variable_map",
    "build_frontier_authenticated_package",
    "build_phase_ledger",
    "capture_source_file",
    "snapshot_source_bytes",
]
