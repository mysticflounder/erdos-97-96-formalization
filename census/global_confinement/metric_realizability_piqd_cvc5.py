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
class SourceCustody:
    paths: tuple[Path, ...]
    snapshots: tuple[bytes, ...]
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


def _capture_source(path: Path) -> bytes:
    """Capture a bounded regular file through component-wise no-follow FDs."""

    absolute = Path(os.path.abspath(os.fspath(path)))
    parent_fd: int | None = None
    descriptor: int | None = None
    try:
        parent_fd = neutral._open_directory_nofollow(absolute.parent)
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
        return payload
    except MetricPiqdCvc5Error:
        raise
    except (OSError, neutral.SmtSourceAdapterError) as exc:
        raise MetricPiqdCvc5Error(
            f"cannot capture source without following links: {absolute}"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
        if parent_fd is not None:
            os.close(parent_fd)


def _custody_digest(paths: Sequence[Path], snapshots: Sequence[bytes]) -> str:
    manifest = [
        {"path": os.fspath(path), "bytes": len(raw), "sha256": _sha(raw)}
        for path, raw in zip(paths, snapshots, strict=True)
    ]
    return _sha(_canonical(manifest))


def _capture_inputs(paths: Sequence[Path]) -> SourceCustody:
    canonical_paths = tuple(Path(os.path.abspath(os.fspath(path))) for path in paths)
    if not canonical_paths or len(canonical_paths) > 16:
        raise MetricPiqdCvc5Error("source list must contain 1..16 files")
    if len(set(canonical_paths)) != len(canonical_paths):
        raise MetricPiqdCvc5Error("source list contains a duplicate path")
    snapshots = tuple(_capture_source(path) for path in canonical_paths)
    if sum(map(len, snapshots)) > MAX_SOURCE_TOTAL_BYTES:
        raise MetricPiqdCvc5Error("source set exceeds its aggregate byte cap")
    for path, raw in zip(canonical_paths, snapshots, strict=True):
        _strict_json(raw, os.fspath(path))
    return SourceCustody(
        canonical_paths,
        snapshots,
        _custody_digest(canonical_paths, snapshots),
    )


def recheck_source_custody(custody: SourceCustody) -> None:
    if type(custody) is not SourceCustody:
        raise MetricPiqdCvc5Error("source custody token has the wrong type")
    current = _capture_inputs(custody.paths)
    if current.snapshots != custody.snapshots or current.digest != custody.digest:
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
            "path": "query.full-convex.smt2",
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
        "path": "query.full-convex.smt2",
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


def _parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--system-id", required=True)
    parser.add_argument("--input", action="append", type=Path, dest="inputs")
    parser.add_argument("--out", required=True, type=Path)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> int:
    args = _parse_args(argv)
    try:
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
