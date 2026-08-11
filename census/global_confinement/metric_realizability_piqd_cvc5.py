"""Bounded PIQD cvc5 diagnostic for one global-confinement metric system.

The adapter reconstructs one current equality-prefilter survivor, preserves the
producer's exact full-convex SMT-LIB2 bytes, and runs one fresh cvc5 PIQD
session.  SAT is retained only after exact rational replay of every assertion;
all other outcomes are diagnostic or inconclusive and establish no theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import stat
import sys
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Any

from census.p97_search import phase3_piqd_freshthird_smt_session as sexpr
from census.p97_search import phase3_piqd_smt_source_adapter as neutral

from . import metric_realizability_cvc5 as producer

SCHEMA = "p97-global-confinement-metric-piqd-cvc5-result/v1"
SOURCE_RECORD_SCHEMA = "p97-global-confinement-metric-piqd-source/v1"
DESCRIPTOR_SCHEMA = "p97-global-confinement-metric-piqd-query/v1"
PROFILE_SCHEMA = "p97-piqd-cvc5-nl-cov-one-shot/v1"
STAGE = "full-convex"
NL_COV_COMMAND = "(set-option :nl-cov true)"
MAX_SOURCE_BYTES = 16 * 1024 * 1024
MAX_SOURCE_TOTAL_BYTES = 64 * 1024 * 1024
MAX_JSON_DEPTH = 64
MAX_JSON_NODES = 2_000_000
MAX_N = 64
MAX_PUBLICATION_FILES = 32
CANONICAL_ORIGINAL_SMT2_PATH = "original.smt2"
ROOT = producer.ROOT
DEFAULT_INPUTS = producer.DEFAULT_INPUTS
PROOF_BLUEPRINT = {
    "session_id": "019fdf9c",
    "anchor": "Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier",
    "state": "OPEN",
    "relation": "OFF_SPINE",
    "changed": False,
}
FALSE_CLAIMS = {
    "source_entitlement": False,
    "theorem": False,
    "global": False,
    "universal": False,
    "lean": False,
    "proof": False,
    "euclidean_problem97": False,
}

_INTEGER = re.compile(r"-?(?:0|[1-9][0-9]*)\Z")
_DECIMAL = re.compile(r"-?(?:0|[1-9][0-9]*)\.[0-9]+\Z")


class MetricPiqdCvc5Error(RuntimeError):
    """The source, exact replay, or PIQD contract failed closed."""


@dataclass(frozen=True)
class _PublishedDirectoryCapture:
    path: Path
    root_fd: int
    root_dev: int
    root_ino: int
    files: dict[str, bytes]


@dataclass(frozen=True)
class _SourceIdentity:
    directory_chain: tuple[tuple[int, int], ...]
    file_dev: int
    file_ino: int
    file_mode: int
    file_nlink: int
    file_size: int
    file_mtime_ns: int
    file_ctime_ns: int


@dataclass(frozen=True)
class _CapturedSource:
    payload: bytes
    identity: _SourceIdentity


@dataclass(frozen=True)
class SourceCustody:
    paths: tuple[Path, ...]
    snapshots: tuple[bytes, ...]
    identities: tuple[_SourceIdentity, ...]
    digest: str


@dataclass(frozen=True)
class AuthenticatedSelection:
    system: dict[str, Any]
    extraction: dict[str, Any]
    frontier_ids: tuple[str, ...]
    custody: SourceCustody


@dataclass(frozen=True)
class PreparedSystem:
    system_id: str
    source_record: dict[str, Any]
    source_record_bytes: bytes
    original_smt2: bytes
    query: neutral.SourceSemanticQuery
    extraction: dict[str, Any]
    frontier_ids: tuple[str, ...]
    custody: SourceCustody


@dataclass(frozen=True)
class _CapturedInput(os.PathLike[str]):
    """A producer-compatible path facade whose bytes cannot be re-opened."""

    path: Path
    payload: bytes

    def __fspath__(self) -> str:
        return os.fspath(self.path)

    def __str__(self) -> str:
        return os.fspath(self.path)

    @property
    def name(self) -> str:
        return self.path.name

    def read_bytes(self) -> bytes:
        return self.payload


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


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
        raise MetricPiqdCvc5Error("value is not canonical JSON") from exc


def _record(unsigned: Mapping[str, object]) -> dict[str, object]:
    body = dict(unsigned)
    return {**body, "record_sha256": _sha(_canonical(body))}


def _reject_constant(value: str) -> object:
    raise MetricPiqdCvc5Error(f"source JSON contains a non-finite number: {value}")


def _strict_object(pairs: list[tuple[str, object]]) -> dict[str, object]:
    result: dict[str, object] = {}
    for key, value in pairs:
        if key in result:
            raise MetricPiqdCvc5Error(f"source JSON has duplicate key: {key}")
        result[key] = value
    return result


def _validate_builtin_tree(value: object, where: str) -> None:
    pending: list[tuple[object, int]] = [(value, 0)]
    nodes = 0
    while pending:
        item, depth = pending.pop()
        nodes += 1
        if nodes > MAX_JSON_NODES:
            raise MetricPiqdCvc5Error(f"{where} exceeds its JSON node cap")
        if depth > MAX_JSON_DEPTH:
            raise MetricPiqdCvc5Error(f"{where} exceeds its JSON depth cap")
        if item is None or type(item) in {bool, int, float, str}:
            continue
        if type(item) is list:
            pending.extend((child, depth + 1) for child in item)
            continue
        if type(item) is dict:
            if any(type(key) is not str for key in item):
                raise MetricPiqdCvc5Error(f"{where} has a non-string object key")
            pending.extend((child, depth + 1) for child in item.values())
            continue
        raise MetricPiqdCvc5Error(f"{where} has a non-builtin JSON value")


def _strict_json(payload: bytes, where: str) -> object:
    try:
        text = payload.decode("utf-8")
        value = json.loads(
            text,
            object_pairs_hook=_strict_object,
            parse_constant=_reject_constant,
        )
    except MetricPiqdCvc5Error:
        raise
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise MetricPiqdCvc5Error(f"{where} is not strict UTF-8 JSON") from exc
    _validate_builtin_tree(value, where)
    return value


def _close_source_descriptors(
    descriptors: Sequence[int | None], primary_error: BaseException | None
) -> None:
    """Attempt every close without replacing an exception already in flight."""

    first_close_error: OSError | None = None
    for descriptor in descriptors:
        if descriptor is None:
            continue
        try:
            os.close(descriptor)
        except OSError as exc:
            if first_close_error is None:
                first_close_error = exc
    if primary_error is None and first_close_error is not None:
        raise MetricPiqdCvc5Error("cannot close source custody descriptors") from (
            first_close_error
        )


def _open_source_parent_nofollow(
    path: Path,
) -> tuple[int, tuple[tuple[int, int], ...]]:
    """Open an absolute directory chain and retain every component identity."""

    absolute = Path(os.path.abspath(os.fspath(path)))
    descriptor: int | None = None
    try:
        descriptor = os.open("/", os.O_RDONLY | os.O_DIRECTORY)
        root = os.fstat(descriptor)
        identities = [(root.st_dev, root.st_ino)]
        for part in absolute.parts[1:]:
            next_descriptor = os.open(
                part,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=descriptor,
            )
            try:
                info = os.fstat(next_descriptor)
            except BaseException:
                _close_source_descriptors(
                    (next_descriptor,),
                    sys.exc_info()[1],
                )
                raise
            previous_descriptor = descriptor
            descriptor = next_descriptor
            _close_source_descriptors((previous_descriptor,), None)
            identities.append((info.st_dev, info.st_ino))
        return descriptor, tuple(identities)
    except BaseException:
        _close_source_descriptors((descriptor,), sys.exc_info()[1])
        raise


def _capture_source(path: Path) -> _CapturedSource:
    """Capture a bounded regular file through component-wise no-follow FDs."""

    absolute = Path(os.path.abspath(os.fspath(path)))
    parent_fd: int | None = None
    descriptor: int | None = None
    try:
        parent_fd, directory_chain = _open_source_parent_nofollow(absolute.parent)
        descriptor = os.open(
            absolute.name,
            os.O_RDONLY | os.O_NOFOLLOW,
            dir_fd=parent_fd,
        )
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise MetricPiqdCvc5Error("source is not a singly-linked regular file")
        if before.st_size > MAX_SOURCE_BYTES:
            raise MetricPiqdCvc5Error("source exceeds its byte cap")
        chunks: list[bytes] = []
        remaining = MAX_SOURCE_BYTES + 1
        while remaining:
            chunk = os.read(descriptor, min(1024 * 1024, remaining))
            if not chunk:
                break
            chunks.append(chunk)
            remaining -= len(chunk)
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
        if (
            len(payload) > MAX_SOURCE_BYTES
            or len(payload) != before.st_size
            or before_identity != after_identity
        ):
            raise MetricPiqdCvc5Error("source changed during bounded capture")
        return _CapturedSource(
            payload,
            _SourceIdentity(
                directory_chain=directory_chain,
                file_dev=before.st_dev,
                file_ino=before.st_ino,
                file_mode=before.st_mode,
                file_nlink=before.st_nlink,
                file_size=before.st_size,
                file_mtime_ns=before.st_mtime_ns,
                file_ctime_ns=before.st_ctime_ns,
            ),
        )
    except MetricPiqdCvc5Error:
        raise
    except (OSError, neutral.SmtSourceAdapterError) as exc:
        raise MetricPiqdCvc5Error(
            f"cannot capture source without following links: {absolute}"
        ) from exc
    finally:
        _close_source_descriptors(
            (descriptor, parent_fd),
            sys.exc_info()[1],
        )


def _custody_digest(
    paths: Sequence[Path],
    snapshots: Sequence[bytes],
    identities: Sequence[_SourceIdentity],
) -> str:
    manifest = [
        {
            "path": os.fspath(path),
            "bytes": len(raw),
            "sha256": _sha(raw),
            "directory_chain": [
                {"dev": device, "ino": inode}
                for device, inode in identity.directory_chain
            ],
            "file": {
                "dev": identity.file_dev,
                "ino": identity.file_ino,
                "mode": identity.file_mode,
                "nlink": identity.file_nlink,
                "size": identity.file_size,
                "mtime_ns": identity.file_mtime_ns,
                "ctime_ns": identity.file_ctime_ns,
            },
        }
        for path, raw, identity in zip(paths, snapshots, identities, strict=True)
    ]
    return _sha(_canonical(manifest))


def _capture_inputs(paths: Sequence[Path]) -> SourceCustody:
    canonical_paths = tuple(Path(os.path.abspath(os.fspath(path))) for path in paths)
    if not canonical_paths or len(canonical_paths) > 16:
        raise MetricPiqdCvc5Error("source list must contain 1..16 files")
    if len(set(canonical_paths)) != len(canonical_paths):
        raise MetricPiqdCvc5Error("source list contains a duplicate path")
    captured = tuple(_capture_source(path) for path in canonical_paths)
    snapshots = tuple(item.payload for item in captured)
    identities = tuple(item.identity for item in captured)
    if sum(map(len, snapshots)) > MAX_SOURCE_TOTAL_BYTES:
        raise MetricPiqdCvc5Error("source set exceeds its aggregate byte cap")
    for path, raw in zip(canonical_paths, snapshots, strict=True):
        _strict_json(raw, os.fspath(path))
    return SourceCustody(
        canonical_paths,
        snapshots,
        identities,
        _custody_digest(canonical_paths, snapshots, identities),
    )


def recheck_source_custody(custody: SourceCustody) -> None:
    if type(custody) is not SourceCustody:
        raise MetricPiqdCvc5Error("source custody token has the wrong type")
    if (
        type(custody.paths) is not tuple
        or type(custody.snapshots) is not tuple
        or type(custody.identities) is not tuple
        or len(custody.paths) != len(custody.snapshots)
        or len(custody.paths) != len(custody.identities)
        or type(custody.digest) is not str
        or not re.fullmatch(r"[0-9a-f]{64}", custody.digest)
        or any(not isinstance(path, Path) for path in custody.paths)
        or any(type(snapshot) is not bytes for snapshot in custody.snapshots)
        or any(
            type(identity) is not _SourceIdentity
            or type(identity.directory_chain) is not tuple
            or not identity.directory_chain
            or any(
                type(component) is not tuple
                or len(component) != 2
                or any(type(value) is not int for value in component)
                for component in identity.directory_chain
            )
            or any(
                type(value) is not int
                for value in (
                    identity.file_dev,
                    identity.file_ino,
                    identity.file_mode,
                    identity.file_nlink,
                    identity.file_size,
                    identity.file_mtime_ns,
                    identity.file_ctime_ns,
                )
            )
            for identity in custody.identities
        )
    ):
        raise MetricPiqdCvc5Error("source custody token has an invalid shape")
    current = _capture_inputs(custody.paths)
    if current != custody:
        raise MetricPiqdCvc5Error("authenticated source changed after capture")


def _validate_system(system: object) -> dict[str, Any]:
    if type(system) is not dict:
        raise MetricPiqdCvc5Error("selected system is not a builtin object")
    _validate_builtin_tree(system, "selected system")
    required = {"system_id", "n", "profile", "order", "rows", "sources"}
    if set(system) != required:
        raise MetricPiqdCvc5Error("selected system has an unexpected field set")
    system_id = system["system_id"]
    n = system["n"]
    profile = system["profile"]
    order = system["order"]
    rows = system["rows"]
    sources = system["sources"]
    if type(system_id) is not str or not re.fullmatch(r"[0-9a-f]{20}", system_id):
        raise MetricPiqdCvc5Error("selected system ID is not canonical")
    if type(n) is not int or not 3 <= n <= MAX_N:
        raise MetricPiqdCvc5Error("selected system n is outside the bounded range")
    if (
        type(profile) is not list
        or not profile
        or any(type(item) is not int or item < 0 for item in profile)
    ):
        raise MetricPiqdCvc5Error("selected system profile is malformed")
    if (
        type(order) is not list
        or len(order) != n
        or any(type(item) is not int for item in order)
        or sorted(order) != list(range(n))
    ):
        raise MetricPiqdCvc5Error("selected system order is not a permutation")
    if type(rows) is not list or type(sources) is not list:
        raise MetricPiqdCvc5Error("selected system rows/sources have wrong types")
    for row in rows:
        if type(row) is not dict or set(row) != {"center", "support", "exact"}:
            raise MetricPiqdCvc5Error("selected metric row has wrong fields")
        center, support, exact = row["center"], row["support"], row["exact"]
        if type(center) is not int or center not in range(n):
            raise MetricPiqdCvc5Error("selected row center is invalid")
        if (
            type(support) is not list
            or not support
            or any(type(point) is not int or point not in range(n) for point in support)
            or len(set(support)) != len(support)
            or center in support
        ):
            raise MetricPiqdCvc5Error("selected row support is invalid")
        if type(exact) is not bool:
            raise MetricPiqdCvc5Error("selected row exact flag is not builtin bool")
    return dict(system)


def _selection_from_custody(
    system_id: str, custody: SourceCustody
) -> AuthenticatedSelection:
    if type(system_id) is not str or not re.fullmatch(r"[0-9a-f]{20}", system_id):
        raise MetricPiqdCvc5Error("system_id must be exactly 20 lowercase hex digits")
    recheck_source_custody(custody)
    captured_inputs = tuple(
        _CapturedInput(path, raw)
        for path, raw in zip(custody.paths, custody.snapshots, strict=True)
    )
    try:
        systems, extraction = producer.extract_systems(captured_inputs)
        frontier = producer._frontier(systems)
    except (OSError, ValueError, TypeError, KeyError, json.JSONDecodeError) as exc:
        raise MetricPiqdCvc5Error("current frontier reconstruction failed") from exc
    recheck_source_custody(custody)
    if type(extraction) is not dict:
        raise MetricPiqdCvc5Error("frontier extraction metadata has wrong type")
    _validate_builtin_tree(extraction, "frontier extraction")
    expected_inputs = [
        {
            "path": os.path.relpath(path, ROOT),
            "sha256": _sha(raw),
        }
        for path, raw in zip(custody.paths, custody.snapshots, strict=True)
    ]
    if extraction.get("input_files") != expected_inputs:
        raise MetricPiqdCvc5Error("extractor source hashes do not match custody")
    matches = [item for item in frontier if item.get("system_id") == system_id]
    if len(matches) != 1:
        raise MetricPiqdCvc5Error(
            "selected ID is not exactly one current frontier system"
        )
    validated = _validate_system(matches[0])
    frontier_ids = tuple(str(item["system_id"]) for item in frontier)
    if tuple(sorted(frontier_ids)) != frontier_ids or len(set(frontier_ids)) != len(
        frontier_ids
    ):
        raise MetricPiqdCvc5Error("current frontier IDs are not unique and sorted")
    return AuthenticatedSelection(validated, dict(extraction), frontier_ids, custody)


def load_selected_system(
    system_id: str,
    paths: Sequence[Path] = DEFAULT_INPUTS,
) -> AuthenticatedSelection:
    """Reconstruct the current frontier under strict source custody."""

    return _selection_from_custody(system_id, _capture_inputs(paths))


def _expected_counts(system: Mapping[str, Any]) -> dict[str, int]:
    n = system["n"]
    rows = system["rows"]
    row_equalities = sum(len(row["support"]) - 1 for row in rows)
    exact_exclusions = sum(n - 1 - len(row["support"]) for row in rows if row["exact"])
    counts = {
        "convex_order": n * (n - 2),
        "distinctness": n * (n - 1) // 2,
        "exact_exclusions": exact_exclusions,
        "row_equalities": row_equalities,
        "selected_rows": len(rows),
    }
    if not exact_exclusions:
        counts.pop("exact_exclusions")
    counts["total"] = sum(
        count for name, count in counts.items() if name != "selected_rows"
    )
    return dict(sorted(counts.items()))


def _strip_terminal_query(original: bytes) -> bytes:
    suffix = b"(check-sat)\n(exit)\n"
    if not original.endswith(suffix) or original.count(b"(check-sat)") != 1:
        raise MetricPiqdCvc5Error("producer SMT2 lacks its exact terminal suffix")
    state = original[: -len(suffix)]
    if b"(exit)" in state:
        raise MetricPiqdCvc5Error("producer SMT2 contains an interior exit")
    return state


def _variables(n: int) -> list[dict[str, str]]:
    return [
        {"id": f"{axis}-{point:02d}", "term": f"{axis}_{point}", "sort": "Real"}
        for axis in ("x", "y")
        for point in range(2, n)
    ]


def prepare_system(
    selection: AuthenticatedSelection,
    *,
    timeout_ms: int,
) -> PreparedSystem:
    """Build and cross-bind one exact current full-convex query."""

    if type(selection) is not AuthenticatedSelection:
        raise MetricPiqdCvc5Error("selection has the wrong type")
    if type(timeout_ms) is not int or not 1 <= timeout_ms <= 3_600_000:
        raise MetricPiqdCvc5Error("timeout_ms must be in 1..3600000")
    system = _validate_system(selection.system)
    current = _selection_from_custody(system["system_id"], selection.custody)
    if (
        system != current.system
        or selection.extraction != current.extraction
        or selection.frontier_ids != current.frontier_ids
    ):
        raise MetricPiqdCvc5Error("selection is not the reconstructed current frontier")
    selection = current
    original_text, counts = producer.build_smt2(system, STAGE)
    expected_counts = _expected_counts(system)
    if counts != expected_counts:
        raise MetricPiqdCvc5Error("producer full-convex constraint counts drifted")
    original = original_text.encode("utf-8")
    archived_commands = neutral.split_smt2_commands(
        _strip_terminal_query(original).decode("utf-8")
    )
    commands = (NL_COV_COMMAND, *archived_commands)
    journal = b"".join(command.encode("utf-8") + b"\n" for command in commands)
    source_inputs = [
        {
            "path": os.path.relpath(path, ROOT),
            "bytes": len(raw),
            "sha256": _sha(raw),
        }
        for path, raw in zip(
            selection.custody.paths, selection.custody.snapshots, strict=True
        )
    ]
    source_record = _record(
        {
            "schema": SOURCE_RECORD_SCHEMA,
            "system_id": system["system_id"],
            "stage": STAGE,
            "system": system,
            "system_sha256": _sha(_canonical(system)),
            "constraint_counts": counts,
            "frontier_count": len(selection.frontier_ids),
            "frontier_ids_sha256": _sha(
                "".join(f"{item}\n" for item in selection.frontier_ids).encode()
            ),
            "source_custody_sha256": selection.custody.digest,
            "source_inputs": source_inputs,
            "extraction_sha256": _sha(_canonical(selection.extraction)),
            "original_smt2_sha256": _sha(original),
            "journal_smt2_sha256": _sha(journal),
            "profile": {
                "schema": PROFILE_SCHEMA,
                "solver": "cvc5",
                "lane": "smt",
                "first_command": NL_COV_COMMAND,
                "fresh_session": True,
                "sequential": True,
                "solve_count": 1,
                "workers": 1,
                "timeout_ms": timeout_ms,
                "local_fallback": False,
            },
            "claims": dict(FALSE_CLAIMS),
            "proof_blueprint": dict(PROOF_BLUEPRINT),
        }
    )
    source_bytes = _canonical(source_record) + b"\n"
    semantic = {
        "system_id": system["system_id"],
        "system": system,
        "constraint_counts": counts,
        "source_record_sha256": _sha(source_bytes),
    }
    variables = _variables(system["n"])
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "global-confinement-metric-realizability", "version": "v1"},
        "semantic_verifier": {
            "id": "exact-rational-full-convex-replay",
            "version": "v1",
        },
        "stage_id": STAGE,
        "query_id": system["system_id"],
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
            "path": CANONICAL_ORIGINAL_SMT2_PATH,
            "bytes": len(original),
            "sha256": _sha(original),
        },
        "variables": variables,
        "named_atoms": [],
        "solve": {
            "assumption_ids": [],
            "readback_variable_ids": [item["id"] for item in variables],
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
        journal_commands=commands,
        journal_smt2=journal,
        source_files=(neutral.SourceSnapshot("system-record.json", source_bytes),),
    )
    prepared = PreparedSystem(
        system["system_id"],
        source_record,
        source_bytes,
        original,
        query,
        dict(selection.extraction),
        tuple(selection.frontier_ids),
        selection.custody,
    )
    _validate_prepared(prepared)
    recheck_source_custody(selection.custody)
    return prepared


def _validate_prepared(prepared: PreparedSystem) -> None:
    if type(prepared) is not PreparedSystem:
        raise MetricPiqdCvc5Error("prepared packet has the wrong type")
    query = prepared.query
    record = prepared.source_record
    if type(prepared.extraction) is not dict:
        raise MetricPiqdCvc5Error("prepared extraction has the wrong type")
    _validate_builtin_tree(prepared.extraction, "prepared extraction")
    unsigned = dict(record)
    claimed_hash = unsigned.pop("record_sha256", None)
    system = _validate_system(record.get("system"))
    rebuilt, counts = producer.build_smt2(system, STAGE)
    variables = _variables(system["n"])
    semantic = query.descriptor.get("semantic_input")
    expected_source_inputs = [
        {
            "path": os.path.relpath(path, ROOT),
            "bytes": len(raw),
            "sha256": _sha(raw),
        }
        for path, raw in zip(
            prepared.custody.paths, prepared.custody.snapshots, strict=True
        )
    ]
    expected_extraction_inputs = [
        {"path": item["path"], "sha256": item["sha256"]}
        for item in expected_source_inputs
    ]
    expected_frontier_digest = _sha(
        "".join(f"{item}\n" for item in prepared.frontier_ids).encode()
    )
    expected_solve = {
        "assumption_ids": [],
        "readback_variable_ids": [item["id"] for item in variables],
        "include_model": True,
    }
    expected_original = {
        "path": CANONICAL_ORIGINAL_SMT2_PATH,
        "bytes": len(query.original_smt2),
        "sha256": _sha(query.original_smt2),
    }
    if (
        claimed_hash != _sha(_canonical(unsigned))
        or record.get("schema") != SOURCE_RECORD_SCHEMA
        or record.get("stage") != STAGE
        or prepared.source_record_bytes != _canonical(record) + b"\n"
        or prepared.system_id != system["system_id"]
        or record.get("system_sha256") != _sha(_canonical(system))
        or record.get("constraint_counts") != _expected_counts(system)
        or record.get("source_custody_sha256") != prepared.custody.digest
        or record.get("source_inputs") != expected_source_inputs
        or prepared.extraction.get("input_files") != expected_extraction_inputs
        or record.get("extraction_sha256") != _sha(_canonical(prepared.extraction))
        or record.get("frontier_count") != len(prepared.frontier_ids)
        or record.get("frontier_ids_sha256") != expected_frontier_digest
        or prepared.system_id not in prepared.frontier_ids
        or tuple(sorted(prepared.frontier_ids)) != prepared.frontier_ids
        or len(set(prepared.frontier_ids)) != len(prepared.frontier_ids)
        or record.get("claims") != FALSE_CLAIMS
        or record.get("proof_blueprint") != PROOF_BLUEPRINT
        or counts != record.get("constraint_counts")
        or prepared.original_smt2 != rebuilt.encode()
        or prepared.original_smt2 != query.original_smt2
        or record.get("original_smt2_sha256") != _sha(query.original_smt2)
        or record.get("journal_smt2_sha256") != _sha(query.journal_smt2)
        or query.descriptor_bytes != _canonical(query.descriptor) + b"\n"
        or query.descriptor.get("schema") != DESCRIPTOR_SCHEMA
        or query.descriptor.get("producer")
        != {"id": "global-confinement-metric-realizability", "version": "v1"}
        or query.descriptor.get("semantic_verifier")
        != {"id": "exact-rational-full-convex-replay", "version": "v1"}
        or query.descriptor.get("query_id") != prepared.system_id
        or query.descriptor.get("stage_id") != STAGE
        or type(semantic) is not dict
        or semantic.get("system_id") != prepared.system_id
        or semantic.get("system") != system
        or semantic.get("constraint_counts") != counts
        or semantic.get("source_record_sha256") != _sha(prepared.source_record_bytes)
        or query.descriptor.get("semantic_sha256") != _sha(_canonical(semantic))
        or query.descriptor.get("sources")
        != [
            {
                "path": "system-record.json",
                "bytes": len(prepared.source_record_bytes),
                "sha256": _sha(prepared.source_record_bytes),
            }
        ]
        or query.descriptor.get("original_smt2") != expected_original
        or query.descriptor.get("variables") != variables
        or query.descriptor.get("named_atoms") != []
        or query.descriptor.get("solve") != expected_solve
        or not query.journal_commands
        or query.journal_commands[0] != NL_COV_COMMAND
        or query.journal_commands[1:]
        != tuple(
            neutral.split_smt2_commands(
                _strip_terminal_query(query.original_smt2).decode("utf-8")
            )
        )
        or query.journal_smt2
        != b"".join(command.encode() + b"\n" for command in query.journal_commands)
        or query.source_files
        != (neutral.SourceSnapshot("system-record.json", prepared.source_record_bytes),)
    ):
        raise MetricPiqdCvc5Error("prepared source/query custody mismatch")
    profile = record.get("profile")
    timeout_ms = profile.get("timeout_ms") if type(profile) is dict else None
    if profile != {
        "schema": PROFILE_SCHEMA,
        "solver": "cvc5",
        "lane": "smt",
        "first_command": NL_COV_COMMAND,
        "fresh_session": True,
        "sequential": True,
        "solve_count": 1,
        "workers": 1,
        "timeout_ms": timeout_ms,
        "local_fallback": False,
    } or query.descriptor.get("solver_profile") != {
        "schema": PROFILE_SCHEMA,
        "solvers": ["cvc5"],
        "timeout_ms": timeout_ms,
    }:
        raise MetricPiqdCvc5Error("prepared cvc5 session profile mismatch")


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
            raise MetricPiqdCvc5Error("zero denominator in cvc5 readback")
        return _real(value[1]) / denominator
    raise MetricPiqdCvc5Error("cvc5 readback is not an exact rational")


def _readback(raw: str, terms: Sequence[str]) -> dict[str, Fraction]:
    try:
        parsed = sexpr._parse_sexpr(raw)
    except Exception as exc:
        raise MetricPiqdCvc5Error(
            "cvc5 readback is not a bounded S-expression"
        ) from exc
    if type(parsed) is not list or len(parsed) != len(terms):
        raise MetricPiqdCvc5Error("cvc5 readback arity mismatch")
    result: dict[str, Fraction] = {}
    for term, pair in zip(terms, parsed, strict=True):
        if type(term) is not str or type(pair) is not list or len(pair) != 2:
            raise MetricPiqdCvc5Error("cvc5 readback pair has the wrong type")
        if pair[0] != term or term in result:
            raise MetricPiqdCvc5Error("cvc5 readback term mismatch")
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
    """Replay every generated full-convex assertion over exact rationals."""

    if solver != "cvc5" or type(model) is not str or type(values) is not str:
        raise MetricPiqdCvc5Error("SAT replay received the wrong solver/model shape")
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict:
        raise MetricPiqdCvc5Error("SAT replay semantic input has the wrong type")
    system = _validate_system(semantic.get("system"))
    counts = semantic.get("constraint_counts")
    if type(counts) is not dict or counts != _expected_counts(system):
        raise MetricPiqdCvc5Error("SAT replay constraint counts are not authenticated")
    terms = query.get_values
    readback = _readback(values, terms)
    n = system["n"]
    points: dict[int, tuple[Fraction, Fraction]] = {
        0: (Fraction(0), Fraction(0)),
        1: (Fraction(1), Fraction(0)),
    }
    for point in range(2, n):
        points[point] = (readback[f"x_{point}"], readback[f"y_{point}"])

    checked = {
        "row_equalities": 0,
        "exact_exclusions": 0,
        "distinctness": 0,
        "convex_order": 0,
    }
    for row in system["rows"]:
        center, support = row["center"], row["support"]
        reference = _d2(points, center, support[0])
        for point in support[1:]:
            checked["row_equalities"] += 1
            if _d2(points, center, point) != reference:
                return neutral.SemanticVerification(
                    False, {"reason": "row_equality", "center": center, "point": point}
                )
        if row["exact"]:
            support_set = set(support)
            for point in range(n):
                if point == center or point in support_set:
                    continue
                checked["exact_exclusions"] += 1
                delta = _d2(points, center, point) - reference
                if delta * delta <= 0:
                    return neutral.SemanticVerification(
                        False,
                        {"reason": "exact_exclusion", "center": center, "point": point},
                    )
    for left in range(n):
        for right in range(left + 1, n):
            checked["distinctness"] += 1
            if _d2(points, left, right) <= 0:
                return neutral.SemanticVerification(
                    False, {"reason": "distinctness", "pair": [left, right]}
                )
    order = system["order"]
    for offset, left in enumerate(order):
        right = order[(offset + 1) % n]
        for point in order:
            if point not in {left, right}:
                checked["convex_order"] += 1
                if _cross(points, left, right, point) <= 0:
                    return neutral.SemanticVerification(
                        False,
                        {
                            "reason": "strict_convex_order",
                            "triple": [left, right, point],
                        },
                    )
    expected_assertions = {
        key: value
        for key, value in counts.items()
        if key not in {"selected_rows", "total"}
    }
    checked_nonzero = {key: value for key, value in checked.items() if value}
    if (
        checked_nonzero != expected_assertions
        or sum(checked.values()) != counts["total"]
    ):
        raise MetricPiqdCvc5Error("SAT replay did not cover every source assertion")
    return neutral.SemanticVerification(
        True,
        {
            "system_id": system["system_id"],
            "model_sha256": _sha(model.encode()),
            "values_sha256": _sha(values.encode()),
            "exact_rational_readback": True,
            "all_source_assertions_replayed": True,
            "checks": checked,
        },
    )


def _classification(engine: Mapping[str, object]) -> str:
    raw = engine.get("raw_status")
    effective = engine.get("effective_status")
    if raw == "SAT" and effective == "SAT_SEMANTICALLY_REPLAYED":
        return "SAT_EXACT_RATIONAL_REPLAYED_DIAGNOSTIC"
    if raw == "UNSAT":
        return "CVC5_UNSAT_DIAGNOSTIC_NOT_KERNEL_CHECKED"
    if raw == "UNKNOWN":
        return "UNKNOWN_INCONCLUSIVE"
    if raw is None and effective == "INCONCLUSIVE_TRANSPORT_LOSS":
        return "TRANSPORT_LOSS_INCONCLUSIVE"
    return "ERROR_OR_REPLAY_REJECTION_INCONCLUSIVE"


def run_prepared_system(
    prepared: PreparedSystem,
    output_directory: Path,
    transport: neutral.PiqdTransport,
    *,
    used_session_ids: set[str] | None = None,
) -> dict[str, object]:
    """Run one cvc5 session/solve and publish one create-once artifact tree."""

    _validate_prepared(prepared)
    recheck_source_custody(prepared.custody)
    staging = neutral._reserve_output_staging(output_directory)
    keep = False
    try:
        query = prepared.query
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
        engine = neutral.run_authenticated_single_solver_query(
            query,
            solver="cvc5",
            descriptor_schema=DESCRIPTOR_SCHEMA,
            solver_profile_schema=PROFILE_SCHEMA,
            authenticated_journal_commands=query.journal_commands,
            transport=transport,
            semantic_verifier=verify_sat_model,
            output_fd=staging.staging_fd,
            used_session_ids=used_session_ids,
        )
        recheck_source_custody(prepared.custody)
        result = {
            "schema": SCHEMA,
            "system_id": prepared.system_id,
            "stage": STAGE,
            "source_record_sha256": _sha(prepared.source_record_bytes),
            "descriptor_sha256": _sha(query.descriptor_bytes),
            "original_smt2_sha256": _sha(query.original_smt2),
            "journal_smt2_sha256": _sha(query.journal_smt2),
            "raw_status": engine["raw_status"],
            "effective_status": engine["effective_status"],
            "classification": _classification(engine),
            "custody": custody,
            "engine": engine,
            "claims": dict(FALSE_CLAIMS),
            "proof_blueprint": dict(PROOF_BLUEPRINT),
        }
        neutral._write_immutable(
            staging.staging_fd, "result.json", _canonical(result) + b"\n"
        )
        neutral._publish_output(staging)
        keep = True
        return result
    finally:
        neutral._close_output_staging(staging, keep=keep)


def _expect_object(value: object, keys: set[str], where: str) -> dict[str, object]:
    if type(value) is not dict or set(value) != keys:
        raise MetricPiqdCvc5Error(f"{where} has an unexpected field set")
    _validate_builtin_tree(value, where)
    return dict(value)


def _expect_digest(value: object, where: str) -> str:
    if (
        type(value) is not str
        or len(value) != 64
        or any(character not in "0123456789abcdef" for character in value)
    ):
        raise MetricPiqdCvc5Error(f"{where} is not a lowercase SHA-256")
    return value


def _capture_published_files(root_fd: int) -> dict[str, bytes]:
    """Capture one complete flat output directory relative to an open descriptor."""

    before = os.fstat(root_fd)
    names = os.listdir(root_fd)
    if not names or len(names) > MAX_PUBLICATION_FILES or len(names) != len(set(names)):
        raise MetricPiqdCvc5Error("published output inventory is not bounded")
    files: dict[str, bytes] = {}
    total = 0
    for name in sorted(names):
        if (
            type(name) is not str
            or name in {"", ".", ".."}
            or "/" in name
            or "\\" in name
            or len(os.fsencode(name)) > 255
        ):
            raise MetricPiqdCvc5Error("published output has an unsafe name")
        info = os.stat(name, dir_fd=root_fd, follow_symlinks=False)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise MetricPiqdCvc5Error(
                "published output contains a non-file or hard-linked artifact"
            )
        raw = neutral._read_relative(
            root_fd,
            name,
            neutral.MAX_OUTPUT_BYTES,
            f"published artifact {name}",
        )
        total += len(raw)
        if total > neutral.MAX_OUTPUT_TOTAL_BYTES:
            raise MetricPiqdCvc5Error("published output exceeds its total byte cap")
        files[name] = raw
    after = os.fstat(root_fd)
    identity = lambda item: (
        item.st_dev,
        item.st_ino,
        item.st_mode,
        item.st_nlink,
        item.st_size,
        item.st_mtime_ns,
        item.st_ctime_ns,
    )
    if identity(before) != identity(after) or sorted(os.listdir(root_fd)) != sorted(
        names
    ):
        raise MetricPiqdCvc5Error("published output changed during capture")
    return files


def _capture_published_directory(
    output_directory: Path,
) -> _PublishedDirectoryCapture:
    """Open and capture one flat output directory while retaining its descriptor."""

    path = Path(os.path.abspath(os.fspath(output_directory)))
    root_fd: int | None = None
    keep_open = False
    try:
        root_fd = neutral._open_directory_nofollow(path)
        root_info = os.fstat(root_fd)
        capture = _PublishedDirectoryCapture(
            path=path,
            root_fd=root_fd,
            root_dev=root_info.st_dev,
            root_ino=root_info.st_ino,
            files=_capture_published_files(root_fd),
        )
        keep_open = True
        return capture
    except (MetricPiqdCvc5Error, neutral.SmtSourceAdapterError):
        raise
    except OSError as exc:
        raise MetricPiqdCvc5Error(
            "cannot capture published output without following links"
        ) from exc
    finally:
        if root_fd is not None and not keep_open:
            os.close(root_fd)


def _finalize_published_directory_capture(
    capture: _PublishedDirectoryCapture,
) -> None:
    """Recheck captured bytes and prove the requested path still names this directory."""

    try:
        if _capture_published_files(capture.root_fd) != capture.files:
            raise MetricPiqdCvc5Error(
                "published output changed during semantic validation"
            )
        reopened_fd = neutral._open_directory_nofollow(capture.path)
        try:
            reopened = os.fstat(reopened_fd)
            if (reopened.st_dev, reopened.st_ino) != (
                capture.root_dev,
                capture.root_ino,
            ):
                raise MetricPiqdCvc5Error(
                    "published output pathname was displaced during semantic validation"
                )
        finally:
            os.close(reopened_fd)
    except (MetricPiqdCvc5Error, neutral.SmtSourceAdapterError):
        raise
    except OSError as exc:
        raise MetricPiqdCvc5Error(
            "cannot revalidate published output without following links"
        ) from exc


def _publication_json(files: Mapping[str, bytes], name: str) -> object:
    try:
        raw = files[name]
    except KeyError as exc:
        raise MetricPiqdCvc5Error(f"published output is missing {name}") from exc
    value = _strict_json(raw, f"published artifact {name}")
    if raw != _canonical(value) + b"\n":
        raise MetricPiqdCvc5Error(f"published artifact {name} is not canonical JSON")
    return value


def _validate_artifact_record(
    files: Mapping[str, bytes], value: object, expected_path: str, where: str
) -> dict[str, object]:
    record = _expect_object(value, {"path", "bytes", "sha256"}, where)
    try:
        raw = files[expected_path]
    except KeyError as exc:
        raise MetricPiqdCvc5Error(
            f"published output is missing {expected_path}"
        ) from exc
    if record != {
        "path": expected_path,
        "bytes": len(raw),
        "sha256": _sha(raw),
    }:
        raise MetricPiqdCvc5Error(f"{where} does not bind its exact artifact")
    return record


def _validate_published_source_and_query(
    files: Mapping[str, bytes],
) -> tuple[neutral.SourceSemanticQuery, dict[str, object]]:
    source_value = _publication_json(files, "system-record.json")
    source = _expect_object(
        source_value,
        {
            "schema",
            "system_id",
            "stage",
            "system",
            "system_sha256",
            "constraint_counts",
            "frontier_count",
            "frontier_ids_sha256",
            "source_custody_sha256",
            "source_inputs",
            "extraction_sha256",
            "original_smt2_sha256",
            "journal_smt2_sha256",
            "profile",
            "claims",
            "proof_blueprint",
            "record_sha256",
        },
        "published source record",
    )
    unsigned = dict(source)
    claimed_record_sha256 = unsigned.pop("record_sha256")
    system = _validate_system(source["system"])
    counts = _expected_counts(system)
    profile = _expect_object(
        source["profile"],
        {
            "schema",
            "solver",
            "lane",
            "first_command",
            "fresh_session",
            "sequential",
            "solve_count",
            "workers",
            "timeout_ms",
            "local_fallback",
        },
        "published source profile",
    )
    timeout_ms = profile["timeout_ms"]
    expected_profile = {
        "schema": PROFILE_SCHEMA,
        "solver": "cvc5",
        "lane": "smt",
        "first_command": NL_COV_COMMAND,
        "fresh_session": True,
        "sequential": True,
        "solve_count": 1,
        "workers": 1,
        "timeout_ms": timeout_ms,
        "local_fallback": False,
    }
    if type(timeout_ms) is not int or not 1 <= timeout_ms <= 3_600_000:
        raise MetricPiqdCvc5Error("published timeout is outside the bounded range")
    source_inputs = source["source_inputs"]
    if type(source_inputs) is not list or not 1 <= len(source_inputs) <= 16:
        raise MetricPiqdCvc5Error("published source input list is not bounded")
    source_paths: list[str] = []
    source_total = 0
    for index, item in enumerate(source_inputs):
        entry = _expect_object(
            item,
            {"path", "bytes", "sha256"},
            f"published source input {index}",
        )
        path = entry["path"]
        size = entry["bytes"]
        if (
            type(path) is not str
            or not path
            or "\x00" in path
            or len(path.encode("utf-8")) > 4096
            or type(size) is not int
            or not 0 <= size <= MAX_SOURCE_BYTES
        ):
            raise MetricPiqdCvc5Error("published source input metadata is malformed")
        _expect_digest(entry["sha256"], f"published source input {index} hash")
        source_paths.append(path)
        source_total += size
    if (
        len(source_paths) != len(set(source_paths))
        or source_total > MAX_SOURCE_TOTAL_BYTES
    ):
        raise MetricPiqdCvc5Error(
            "published source input metadata is not unique/bounded"
        )
    for field in (
        "system_sha256",
        "frontier_ids_sha256",
        "source_custody_sha256",
        "extraction_sha256",
        "original_smt2_sha256",
        "journal_smt2_sha256",
    ):
        _expect_digest(source[field], f"published source {field}")
    if type(source["frontier_count"]) is not int or source["frontier_count"] < 1:
        raise MetricPiqdCvc5Error("published frontier count is invalid")
    source_bytes = files["system-record.json"]
    original = files.get(CANONICAL_ORIGINAL_SMT2_PATH)
    journal = files.get("journal.smt2")
    if original is None or journal is None:
        raise MetricPiqdCvc5Error("published output lacks the canonical SMT2 artifacts")
    try:
        rebuilt_text, rebuilt_counts = producer.build_smt2(system, STAGE)
    except (KeyError, TypeError, ValueError) as exc:
        raise MetricPiqdCvc5Error(
            "published metric SMT2 reconstruction failed"
        ) from exc
    rebuilt = rebuilt_text.encode("utf-8")
    commands = (
        NL_COV_COMMAND,
        *neutral.split_smt2_commands(_strip_terminal_query(rebuilt).decode("utf-8")),
    )
    rebuilt_journal = b"".join(command.encode("utf-8") + b"\n" for command in commands)
    variables = _variables(system["n"])
    semantic = {
        "system_id": system["system_id"],
        "system": system,
        "constraint_counts": counts,
        "source_record_sha256": _sha(source_bytes),
    }
    expected_descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "global-confinement-metric-realizability", "version": "v1"},
        "semantic_verifier": {
            "id": "exact-rational-full-convex-replay",
            "version": "v1",
        },
        "stage_id": STAGE,
        "query_id": system["system_id"],
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
            "path": CANONICAL_ORIGINAL_SMT2_PATH,
            "bytes": len(original),
            "sha256": _sha(original),
        },
        "variables": variables,
        "named_atoms": [],
        "solve": {
            "assumption_ids": [],
            "readback_variable_ids": [item["id"] for item in variables],
            "include_model": True,
        },
        "solver_profile": {
            "schema": PROFILE_SCHEMA,
            "solvers": ["cvc5"],
            "timeout_ms": timeout_ms,
        },
    }
    descriptor_value = _publication_json(files, "descriptor.json")
    if type(descriptor_value) is not dict or descriptor_value != expected_descriptor:
        raise MetricPiqdCvc5Error("published descriptor reconstruction mismatch")
    if (
        claimed_record_sha256 != _sha(_canonical(unsigned))
        or source["schema"] != SOURCE_RECORD_SCHEMA
        or source["system_id"] != system["system_id"]
        or source["stage"] != STAGE
        or source["system_sha256"] != _sha(_canonical(system))
        or source["constraint_counts"] != counts
        or source["profile"] != expected_profile
        or source["claims"] != FALSE_CLAIMS
        or source["proof_blueprint"] != PROOF_BLUEPRINT
        or rebuilt_counts != counts
        or original != rebuilt
        or journal != rebuilt_journal
        or source["original_smt2_sha256"] != _sha(original)
        or source["journal_smt2_sha256"] != _sha(journal)
    ):
        raise MetricPiqdCvc5Error("published source/query reconstruction mismatch")
    query = neutral.SourceSemanticQuery(
        descriptor=expected_descriptor,
        descriptor_bytes=files["descriptor.json"],
        original_smt2=original,
        journal_commands=commands,
        journal_smt2=journal,
        source_files=(neutral.SourceSnapshot("system-record.json", source_bytes),),
    )
    query = neutral.validate_authenticated_single_solver_query(
        query,
        solver="cvc5",
        descriptor_schema=DESCRIPTOR_SCHEMA,
        solver_profile_schema=PROFILE_SCHEMA,
        authenticated_journal_commands=commands,
    )
    return query, source


def _validate_published_engine(
    files: Mapping[str, bytes],
    query: neutral.SourceSemanticQuery,
    value: object,
) -> tuple[dict[str, object], set[str]]:
    engine = _expect_object(
        value,
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
            "reconciliation_attempts",
            "result_digest_advisory",
            "unsat_assumptions",
            "semantic_replay",
            "artifacts",
            "claims",
        },
        "published engine",
    )
    if (
        type(engine["response_lost"]) is not bool
        or type(engine["reconciled_from_receipt"]) is not bool
    ):
        raise MetricPiqdCvc5Error("published response-loss flags are not Boolean")
    attempts = engine["reconciliation_attempts"]
    if type(attempts) is not int or attempts < 0:
        raise MetricPiqdCvc5Error("published reconciliation count is invalid")
    raw_status = engine["raw_status"]
    response_lost = engine["response_lost"]
    reconciled = engine["reconciled_from_receipt"]
    if raw_status is None:
        if (
            not response_lost
            or reconciled
            or attempts != len(neutral.TRANSPORT_RECONCILIATION_DELAYS_S)
        ):
            raise MetricPiqdCvc5Error("published transport-loss state is inconsistent")
    elif raw_status in {"SAT", "UNSAT", "UNKNOWN"}:
        if (
            response_lost is not reconciled
            or (
                response_lost
                and not 1 <= attempts <= len(neutral.TRANSPORT_RECONCILIATION_DELAYS_S)
            )
            or (not response_lost and attempts != 0)
        ):
            raise MetricPiqdCvc5Error("published reconciliation state is inconsistent")
    else:
        raise MetricPiqdCvc5Error("published raw status is invalid")
    artifact_paths = {
        "session": "cvc5.session.json",
        "smt2": "cvc5.smt2",
        "receipts_before": "cvc5.receipts-before.json",
        "receipts": "cvc5.receipts.json",
        "closed_session": "cvc5.closed-session.json",
    }
    if raw_status is not None:
        if response_lost:
            artifact_paths.update(
                {
                    "reconciled_solve": "cvc5.reconciled-solve.json",
                    "reconciliation_session": "cvc5.reconciliation-session.json",
                }
            )
        else:
            artifact_paths["solve"] = "cvc5.solve.json"
        if raw_status == "SAT":
            artifact_paths["semantic"] = "cvc5.semantic.json"
    artifacts = _expect_object(
        engine["artifacts"], set(artifact_paths), "published engine artifacts"
    )
    for key, path in artifact_paths.items():
        _validate_artifact_record(
            files, artifacts[key], path, f"published engine artifact {key}"
        )
    label = (
        f"p97-smt-source/{query.descriptor['query_id']}/cvc5/"
        f"{query.descriptor['semantic_sha256'][:12]}"
    )
    session_value = _publication_json(files, artifact_paths["session"])
    session = neutral._validate_session(
        session_value, solver="cvc5", label=label, expected_state="live"
    )
    neutral._validate_fresh_session(session)
    if files[artifact_paths["smt2"]] != query.journal_smt2:
        raise MetricPiqdCvc5Error("published PIQD export differs from the journal")
    receipts_before_value = _publication_json(files, artifact_paths["receipts_before"])
    neutral._validate_receipts(
        receipts_before_value,
        session=session,
        query=query,
        solve=None,
        expected_count=0,
    )
    solve: dict[str, object] | None = None
    receipt: dict[str, object] | None = None
    if raw_status is not None:
        solve_key = "reconciled_solve" if response_lost else "solve"
        solve_value = _publication_json(files, artifact_paths[solve_key])
        solve = neutral._validate_solve(
            solve_value,
            timeout_ms=query.descriptor["solver_profile"]["timeout_ms"],
        )
        receipts_value = _publication_json(files, artifact_paths["receipts"])
        _, receipt = neutral._validate_receipts(
            receipts_value,
            session=session,
            query=query,
            solve=solve,
            expected_count=1,
        )
        if receipt is None:
            raise MetricPiqdCvc5Error("published completed solve has no receipt")
        receipt_solve = neutral._solve_from_receipt(receipt)
        expected_solve = (
            receipt_solve if response_lost else {**receipt_solve, "replayed": False}
        )
        if solve != expected_solve:
            raise MetricPiqdCvc5Error("published solve is not the receipt-bound answer")
    else:
        receipts_value = _publication_json(files, artifact_paths["receipts"])
        neutral._validate_receipts(
            receipts_value,
            session=session,
            query=query,
            solve=None,
            expected_count=0,
        )
    if response_lost and raw_status is not None:
        reconciliation_value = _publication_json(
            files, artifact_paths["reconciliation_session"]
        )
        reconciliation = neutral._validate_session(
            reconciliation_value,
            solver="cvc5",
            label=label,
            expected_state="live",
        )
        neutral._validate_closed_session(
            reconciliation, created=session, query=query, solve=solve
        )
    closed_value = _publication_json(files, artifact_paths["closed_session"])
    closed = neutral._validate_session(
        closed_value, solver="cvc5", label=label, expected_state="closed"
    )
    neutral._validate_closed_session(closed, created=session, query=query, solve=solve)
    if solve is None:
        effective_status = "INCONCLUSIVE_TRANSPORT_LOSS"
        semantic = None
        unsat = None
        advisory = None
        solve_index = None
        result_sha256 = None
    else:
        effective_status, semantic = neutral._semantic_replay(
            verify_sat_model, query, "cvc5", solve
        )
        unsat = neutral._unsat_assumption_provenance(query, solve)
        locally_recomputed = neutral.piqd_result_digest(solve)
        advisory = {
            "algorithm": "piqd-smt-solve-result/v1",
            "locally_recomputed": locally_recomputed,
            "matches_daemon": locally_recomputed == receipt["result_sha256"],
        }
        solve_index = solve["solve_index"]
        result_sha256 = receipt["result_sha256"]
    if semantic is not None:
        semantic_value = _publication_json(files, artifact_paths["semantic"])
        if semantic_value != semantic:
            raise MetricPiqdCvc5Error(
                "published SAT replay evidence is not reproducible"
            )
    expected_engine = {
        "solver": "cvc5",
        "session_id": session["id"],
        "solver_signature": session["solver_signature"],
        "solver_sha256": session["solver_sha256"],
        "raw_status": raw_status,
        "effective_status": effective_status,
        "solve_index": solve_index,
        "result_sha256": result_sha256,
        "response_lost": response_lost,
        "reconciled_from_receipt": reconciled,
        "reconciliation_attempts": attempts,
        "result_digest_advisory": advisory,
        "unsat_assumptions": unsat,
        "semantic_replay": semantic,
        "artifacts": artifacts,
        "claims": dict(neutral.FALSE_CLAIMS),
    }
    if engine != expected_engine:
        raise MetricPiqdCvc5Error("published engine cross-binding mismatch")
    neutral._validate_unsat_output_boundary(engine)
    return engine, set(artifact_paths.values())


def _validate_captured_published_output(
    files: Mapping[str, bytes],
) -> dict[str, object]:
    """Semantically validate one descriptor-relative publication snapshot."""

    result_value = _publication_json(files, "result.json")
    result = _expect_object(
        result_value,
        {
            "schema",
            "system_id",
            "stage",
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
            "proof_blueprint",
        },
        "published result",
    )
    query, source = _validate_published_source_and_query(files)
    custody = _expect_object(
        result["custody"],
        {"descriptor", "source_record", "original_smt2", "journal_smt2"},
        "published custody",
    )
    custody_paths = {
        "descriptor": "descriptor.json",
        "source_record": "system-record.json",
        "original_smt2": CANONICAL_ORIGINAL_SMT2_PATH,
        "journal_smt2": "journal.smt2",
    }
    for key, path in custody_paths.items():
        _validate_artifact_record(
            files, custody[key], path, f"published custody artifact {key}"
        )
    engine, engine_paths = _validate_published_engine(files, query, result["engine"])
    expected_inventory = {
        "descriptor.json",
        "system-record.json",
        CANONICAL_ORIGINAL_SMT2_PATH,
        "journal.smt2",
        "result.json",
        *engine_paths,
    }
    if set(files) != expected_inventory:
        raise MetricPiqdCvc5Error("published output inventory is not exact")
    expected_result = {
        "schema": SCHEMA,
        "system_id": source["system_id"],
        "stage": STAGE,
        "source_record_sha256": _sha(files["system-record.json"]),
        "descriptor_sha256": _sha(files["descriptor.json"]),
        "original_smt2_sha256": _sha(files[CANONICAL_ORIGINAL_SMT2_PATH]),
        "journal_smt2_sha256": _sha(files["journal.smt2"]),
        "raw_status": engine["raw_status"],
        "effective_status": engine["effective_status"],
        "classification": _classification(engine),
        "custody": custody,
        "engine": engine,
        "claims": dict(FALSE_CLAIMS),
        "proof_blueprint": dict(PROOF_BLUEPRINT),
    }
    if result != expected_result:
        raise MetricPiqdCvc5Error("published result cross-binding mismatch")
    return result


def validate_published_output(output_directory: Path) -> dict[str, object]:
    """Offline-validate one complete published metric-cvc5 output directory."""

    capture = _capture_published_directory(output_directory)
    try:
        result = _validate_captured_published_output(capture.files)
        _finalize_published_directory_capture(capture)
        return result
    finally:
        os.close(capture.root_fd)


def _parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--system-id")
    mode.add_argument("--check", type=Path)
    parser.add_argument("--input", action="append", type=Path, dest="inputs")
    parser.add_argument("--out", type=Path)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    args = parser.parse_args(argv)
    if args.check is None and args.out is None:
        parser.error("--out is required with --system-id")
    if args.check is not None and (args.out is not None or args.inputs is not None):
        parser.error("--check cannot be combined with --out or --input")
    return args


def main(argv: Sequence[str] | None = None) -> int:
    args = _parse_args(argv)
    try:
        if args.check is not None:
            result = validate_published_output(args.check)
            print(
                json.dumps(
                    {
                        "checked": True,
                        "classification": result["classification"],
                        "effective_status": result["effective_status"],
                        "output": os.fspath(args.check),
                        "system_id": result["system_id"],
                    },
                    sort_keys=True,
                )
            )
            return 0
        selection = load_selected_system(args.system_id, args.inputs or DEFAULT_INPUTS)
        prepared = prepare_system(selection, timeout_ms=args.timeout_ms)
        transport = neutral.UrllibPiqdTransport(
            args.server,
            http_timeout_s=neutral.bounded_solve_http_timeout_s(args.timeout_ms),
        )
        result = run_prepared_system(prepared, args.out, transport)
    except (MetricPiqdCvc5Error, neutral.SmtSourceAdapterError) as exc:
        print(json.dumps({"error": str(exc), "status": "INCONCLUSIVE"}, sort_keys=True))
        return 2
    print(
        json.dumps(
            {
                "classification": result["classification"],
                "effective_status": result["effective_status"],
                "output": os.fspath(args.out),
                "system_id": result["system_id"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
