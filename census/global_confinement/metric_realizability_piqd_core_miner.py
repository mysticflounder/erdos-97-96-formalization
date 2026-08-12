# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated PIQD lane for metric row/equality core discovery.

This module deliberately publishes diagnostic solver evidence only.  In
particular, an SMT UNSAT response is not a proof and the daemon's native
assumption core is never promoted to source facts.
"""

from __future__ import annotations

import argparse
import contextlib
import hashlib
import json
import math
import os
import re
import stat
import uuid
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Any

from census.p97_search import phase3_piqd_smt_source_adapter as neutral

from . import metric_realizability_cvc5 as producer
from . import metric_realizability_piqd_cvc5 as metric_piqd

SCHEMA = "p97-global-confinement-metric-piqd-core-miner-v1"
MANIFEST_SCHEMA = f"{SCHEMA}/manifest"
PROFILE_SCHEMA = f"{SCHEMA}/profile"
DEFAULT_OUT = producer.HERE / "metric_realizability_piqd_cores"
MAX_INPUT_BYTES = 64 * 1024 * 1024
MAX_TIMEOUT_MS = 3_600_000
_UUID_NAMESPACE = uuid.UUID("93760218-e576-44b4-8ffc-e240ed4f9b53")
_HEX64 = re.compile(r"[0-9a-f]{64}")
_SESSION_KEYS = {
    "id",
    "lane",
    "state",
    "solver_name",
    "solver_sha256",
    "solver_signature",
    "protocol_version",
    "journal_path",
    "created_at",
    "updated_at",
    "clauses",
    "max_var",
    "solves",
    "last_status",
    "declared_num_vars",
    "last_solve_index",
    "last_assumption_free",
    "last_terminal_unsat",
    "label",
}
_RESULT_FIELDS = {
    "constraint_counts",
    "decisive_stage",
    "n",
    "order",
    "profile",
    "rows",
    "sources",
    "stages",
    "status",
    "system_id",
}
_TOP_FIELDS = {
    "config",
    "extraction",
    "generated_at",
    "results",
    "schema",
    "selection",
    "smoke",
    "summary",
}
_FALSE_CLAIMS = {
    "global_confinement": False,
    "lean": False,
    "named_core_source_promotion": False,
    "proof": False,
    "sorry_closed": False,
    "theorem": False,
    "universal": False,
}
_RECORD_FIELDS = {
    "schema",
    "input",
    "selection",
    "profile",
    "results",
    "classification",
    "claims",
}
_SELECTION_FIELDS = {"system_ids", "count", "system_ids_sha256"}
_PUBLISHED_RESULT_FIELDS = {
    "system_id",
    "semantic_input",
    "semantic_input_sha256",
    "order_sha256",
    "profile_sha256",
    "minimized_stage",
    "atom_stage",
    "original_row_count",
    "core_row_indices",
    "core_rows",
    "row_deletion_attempts",
    "row_validation",
    "convex_only_validation",
    "original_atom_count",
    "atoms",
    "atom_deletion_attempts",
    "atom_validation",
    "z3_row_validation",
    "z3_atom_validation",
    "crosscheck_status",
    "classification",
    "assumption_binding",
    "claims",
    "cvc5_engine",
    "z3_engine",
}
_ENGINE_FIELDS = {
    "solver",
    "session",
    "closed_session",
    "journal_sha256",
    "journal_bytes",
    "command_count",
    "requests",
    "solves",
    "receipts",
    "sequential",
    "workers",
    "local_fallback",
}
_EVIDENCE_FIELDS = {
    "purpose",
    "stage",
    "row_indices",
    "atoms",
    "status",
    "solve_index",
    "result_sha256",
    "request_id",
    "native_assumption_core",
    "native_named_core_promotion",
    "semantic_replay",
}
_PROFILE_FIELDS = {
    "schema",
    "lane",
    "solvers",
    "workers",
    "sequential",
    "append_cas",
    "request_id_idempotency",
    "local_fallback",
    "deletion_timeout_ms",
    "validation_timeout_ms",
}


class MetricPiqdCoreError(RuntimeError):
    """The input, PIQD transcript, semantic replay, or custody failed closed."""


@dataclass(frozen=True)
class _InputCustody:
    path: Path
    raw: bytes
    dev: int
    ino: int
    size: int
    mtime_ns: int
    ctime_ns: int


@dataclass(frozen=True)
class _Plan:
    purpose: str
    stage: str
    rows: tuple[int, ...]
    atoms: tuple[tuple[int, int], ...]
    timeout_ms: int


def _sha(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _builtin(value: object, where: str, *, depth: int = 0) -> object:
    if depth > 32:
        raise MetricPiqdCoreError(f"{where} exceeds the JSON depth cap")
    if value is None or type(value) in {bool, int, str}:
        return value
    if type(value) is float and math.isfinite(value):
        return value
    if type(value) is list:
        return [_builtin(item, where, depth=depth + 1) for item in value]
    if type(value) is dict:
        result: dict[str, object] = {}
        for key, item in value.items():
            if type(key) is not str:
                raise MetricPiqdCoreError(f"{where} has a non-string key")
            result[key] = _builtin(item, where, depth=depth + 1)
        return result
    raise MetricPiqdCoreError(f"{where} contains non-builtin JSON")


def _canonical(value: object) -> bytes:
    return json.dumps(
        _builtin(value, "canonical JSON"),
        allow_nan=False,
        ensure_ascii=False,
        separators=(",", ":"),
        sort_keys=True,
    ).encode()


def _artifact(value: object) -> bytes:
    return _canonical(value) + b"\n"


def _strict_json(raw: bytes, where: str) -> object:
    def pairs(items: list[tuple[str, Any]]) -> dict[str, Any]:
        answer: dict[str, Any] = {}
        for key, value in items:
            if key in answer:
                raise ValueError(f"duplicate key {key!r}")
            answer[key] = value
        return answer

    try:
        value = json.loads(
            raw.decode(),
            object_pairs_hook=pairs,
            parse_constant=lambda item: (_ for _ in ()).throw(
                ValueError(f"non-JSON constant {item}")
            ),
        )
    except (UnicodeDecodeError, ValueError, json.JSONDecodeError) as exc:
        raise MetricPiqdCoreError(f"{where} is not strict JSON") from exc
    return _builtin(value, where)


def _read_bounded(descriptor: int) -> bytes:
    chunks: list[bytes] = []
    remaining = MAX_INPUT_BYTES + 1
    while remaining:
        chunk = os.read(descriptor, min(1024 * 1024, remaining))
        if not chunk:
            break
        chunks.append(chunk)
        remaining -= len(chunk)
    return b"".join(chunks)


def _capture(path: Path) -> _InputCustody:
    absolute = Path(os.path.abspath(os.fspath(path)))
    flags = os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0) | getattr(os, "O_NONBLOCK", 0)
    try:
        descriptor = os.open(absolute, flags)
    except OSError as exc:
        raise MetricPiqdCoreError(
            "input must be one singly-linked regular file"
        ) from exc
    try:
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise MetricPiqdCoreError("input must be one singly-linked regular file")
        if before.st_size > MAX_INPUT_BYTES:
            raise MetricPiqdCoreError("input exceeds the byte cap")
        raw = _read_bounded(descriptor)
        after = os.fstat(descriptor)
        path_after = os.lstat(absolute)
    finally:
        os.close(descriptor)
    identity = (
        before.st_dev,
        before.st_ino,
        before.st_size,
        before.st_mtime_ns,
        before.st_ctime_ns,
    )
    if (
        identity
        != (
            after.st_dev,
            after.st_ino,
            after.st_size,
            after.st_mtime_ns,
            after.st_ctime_ns,
        )
        or (after.st_dev, after.st_ino) != (path_after.st_dev, path_after.st_ino)
        or not stat.S_ISREG(path_after.st_mode)
        or path_after.st_nlink != 1
        or len(raw) != before.st_size
    ):
        raise MetricPiqdCoreError("input changed while it was captured")
    if len(raw) > MAX_INPUT_BYTES:
        raise MetricPiqdCoreError("input exceeds the byte cap")
    return _InputCustody(absolute, raw, *identity[:2], *identity[2:])


def _recheck(custody: _InputCustody) -> None:
    if _capture(custody.path) != custody:
        raise MetricPiqdCoreError("input changed before immutable publication")


def _validate_source_stage(stage: object, where: str) -> None:
    required = {
        "constraint_counts",
        "elapsed_sec",
        "return_code",
        "stage",
        "status",
    }
    if type(stage) is not dict or (
        set(stage) != required and set(stage) != required | {"reason"}
    ):
        raise MetricPiqdCoreError(f"{where} has a non-current field set")
    if (
        stage["stage"]
        not in {
            "exact-metric-relaxation",
            "full-convex",
            "convex-only-relaxation",
        }
        or stage["status"] not in {"SAT", "UNSAT", "UNKNOWN", "ERROR"}
        or type(stage["constraint_counts"]) is not dict
        or any(
            type(key) is not str or type(value) is not int
            for key, value in stage["constraint_counts"].items()
        )
        or type(stage["elapsed_sec"]) not in {int, float}
        or type(stage["return_code"]) is not int
        or ("reason" in stage and type(stage["reason"]) is not str)
    ):
        raise MetricPiqdCoreError(f"{where} metadata is malformed")


def _validate_input(raw: bytes) -> tuple[dict[str, Any], list[dict[str, Any]]]:
    source = _strict_json(raw, "metric miner input")
    if type(source) is not dict or set(source) != _TOP_FIELDS:
        raise MetricPiqdCoreError(
            "metric miner input has a non-current top-level schema"
        )
    if source.get("schema") != producer.SCHEMA or type(source["results"]) is not list:
        raise MetricPiqdCoreError("metric miner input schema is unsupported")
    exact_nested = {
        "config": {
            "checkpoint_every",
            "cvc5",
            "cvc5_version",
            "timeout_seconds",
            "workers",
        },
        "extraction": {
            "deduplicated_assignments",
            "input_files",
            "raw_assignments",
            "rejected_non_sat_assignments",
            "source_family_counts",
            "unique_metric_systems",
        },
        "selection": {
            "baseline_path",
            "baseline_sha256",
            "count",
            "matches_baseline",
            "selected_for_run",
            "system_id_sha256",
        },
        "smoke": {"passed", "sat", "unsat"},
        "summary": {"decisive_stage_counts", "stage_status_counts", "status_counts"},
    }
    if type(source["generated_at"]) is not str or any(
        type(source[key]) is not dict or set(source[key]) != fields
        for key, fields in exact_nested.items()
    ):
        raise MetricPiqdCoreError("metric miner nested schema is non-current")
    config = source["config"]
    extraction = source["extraction"]
    selection = source["selection"]
    summary = source["summary"]
    if (
        type(config["checkpoint_every"]) is not int
        or type(config["cvc5"]) is not str
        or type(config["cvc5_version"]) is not str
        or type(config["timeout_seconds"]) not in {int, float}
        or type(config["workers"]) is not int
        or any(
            type(extraction[key]) is not int
            for key in (
                "deduplicated_assignments",
                "raw_assignments",
                "rejected_non_sat_assignments",
                "unique_metric_systems",
            )
        )
        or type(extraction["source_family_counts"]) is not dict
        or any(
            type(key) is not str or type(value) is not int
            for key, value in extraction["source_family_counts"].items()
        )
        or type(selection["baseline_path"]) is not str
        or type(selection["baseline_sha256"]) is not str
        or _HEX64.fullmatch(selection["baseline_sha256"]) is None
        or type(selection["count"]) is not int
        or type(selection["matches_baseline"]) is not bool
        or type(selection["selected_for_run"]) is not int
        or type(selection["system_id_sha256"]) is not str
        or _HEX64.fullmatch(selection["system_id_sha256"]) is None
        or any(type(summary[key]) is not dict for key in summary)
    ):
        raise MetricPiqdCoreError("metric miner nested metadata is malformed")
    if type(source["extraction"]["input_files"]) is not list or any(
        type(item) is not dict
        or set(item) != {"path", "sha256"}
        or type(item["path"]) is not str
        or type(item["sha256"]) is not str
        or _HEX64.fullmatch(item["sha256"]) is None
        for item in source["extraction"]["input_files"]
    ):
        raise MetricPiqdCoreError("metric miner extraction inputs are malformed")
    if source["smoke"]["passed"] is not True:
        raise MetricPiqdCoreError("metric miner source smoke test did not pass")
    for key in ("sat", "unsat"):
        _validate_source_stage(source["smoke"][key], f"metric miner smoke {key}")
    if (
        not set(summary["decisive_stage_counts"])
        <= {"full-convex", "convex-only-relaxation", "none"}
        or not set(summary["stage_status_counts"])
        <= {
            "exact-metric-relaxation",
            "full-convex",
            "convex-only-relaxation",
        }
        or not set(summary["status_counts"]) <= {"CVC5_UNSAT", "UNKNOWN"}
        or any(
            type(value) is not int
            for value in (
                *summary["decisive_stage_counts"].values(),
                *summary["status_counts"].values(),
            )
        )
        or any(
            type(counts) is not dict
            or not set(counts) <= {"SAT", "UNSAT", "UNKNOWN", "ERROR"}
            or any(type(value) is not int for value in counts.values())
            for counts in summary["stage_status_counts"].values()
        )
    ):
        raise MetricPiqdCoreError("metric miner summary metadata is malformed")
    selected: list[dict[str, Any]] = []
    ids: list[str] = []
    for result in source["results"]:
        if type(result) is not dict or set(result) != _RESULT_FIELDS:
            raise MetricPiqdCoreError("metric miner result has a non-current field set")
        try:
            system = metric_piqd._validate_system(
                {
                    key: result[key]
                    for key in (
                        "system_id",
                        "n",
                        "profile",
                        "order",
                        "rows",
                        "sources",
                    )
                }
            )
        except metric_piqd.MetricPiqdCvc5Error as exc:
            raise MetricPiqdCoreError("metric miner system is malformed") from exc
        ids.append(system["system_id"])
        if type(result["stages"]) is not list:
            raise MetricPiqdCoreError("metric miner stages are not a list")
        for stage in result["stages"]:
            _validate_source_stage(stage, "metric miner stage")
        if (
            result["status"] not in {"CVC5_UNSAT", "UNKNOWN"}
            or result["decisive_stage"]
            not in {None, "full-convex", "convex-only-relaxation"}
            or type(result["constraint_counts"]) is not dict
            or any(
                type(key) is not str or type(value) is not int
                for key, value in result["constraint_counts"].items()
            )
        ):
            raise MetricPiqdCoreError("metric miner result metadata is malformed")
        if result["status"] == "CVC5_UNSAT":
            selected.append({**system, "stages": result["stages"]})
    if ids != sorted(ids) or len(ids) != len(set(ids)):
        raise MetricPiqdCoreError("metric miner result IDs are not unique and sorted")
    if not selected:
        raise MetricPiqdCoreError("input contains no CVC5_UNSAT systems")
    return source, selected


def _all_atoms(
    system: Mapping[str, Any], rows: Sequence[int]
) -> tuple[tuple[int, int], ...]:
    return tuple(
        (row_index, int(point))
        for row_index in rows
        for point in system["rows"][row_index]["support"][1:]
    )


def _row_guard(index: int) -> str:
    return f"p97_row_{index:03d}"


def _atom_guard(index: int, point: int) -> str:
    return f"p97_eq_{index:03d}_{point:03d}"


def _build_journal(
    system: Mapping[str, Any], solver: str
) -> tuple[tuple[str, ...], bytes]:
    n = int(system["n"])
    commands = ["(set-logic QF_NRA)"]
    if solver == "cvc5":
        commands.insert(0, "(set-option :nl-cov true)")
    for point in range(2, n):
        commands.extend(
            (f"(declare-fun x_{point} () Real)", f"(declare-fun y_{point} () Real)")
        )
    commands.append("(declare-fun p97_full_stage () Bool)")
    for row_index, row in enumerate(system["rows"]):
        commands.append(f"(declare-fun {_row_guard(row_index)} () Bool)")
        reference = producer._d2(row["center"], row["support"][0])
        for point in row["support"][1:]:
            guard = _atom_guard(row_index, point)
            commands.append(f"(declare-fun {guard} () Bool)")
            equality = f"(= {producer._d2(row['center'], point)} {reference})"
            commands.append(
                f"(assert (=> (and {_row_guard(row_index)} {guard}) {equality}))"
            )
        if row["exact"]:
            support = set(row["support"])
            for point in range(n):
                if point == row["center"] or point in support:
                    continue
                delta = f"(- {producer._d2(row['center'], point)} {reference})"
                exclusion = f"(> (* {delta} {delta}) 0)"
                commands.append(
                    f"(assert (=> (and {_row_guard(row_index)} p97_full_stage) {exclusion}))"
                )
    for left in range(n):
        for right in range(left + 1, n):
            commands.append(f"(assert (> {producer._d2(left, right)} 0))")
    order = system["order"]
    for offset, left in enumerate(order):
        right = order[(offset + 1) % n]
        for point in order:
            if point not in {left, right}:
                commands.append(f"(assert (> {producer._cross(left, right, point)} 0))")
    journal = b"".join(command.encode() + b"\n" for command in commands)
    normalized_commands, normalized = neutral.normalize_state_journal(journal)
    if tuple(commands) != normalized_commands or journal != normalized:
        raise MetricPiqdCoreError("guarded journal is not PIQD-canonical")
    return tuple(commands), journal


def _assumptions(system: Mapping[str, Any], plan: _Plan) -> list[str]:
    active_rows = set(plan.rows)
    active_atoms = set(plan.atoms)
    assumptions = [
        "p97_full_stage" if plan.stage == "full-convex" else "(not p97_full_stage)"
    ]
    for row_index, row in enumerate(system["rows"]):
        row_guard = _row_guard(row_index)
        assumptions.append(
            row_guard if row_index in active_rows else f"(not {row_guard})"
        )
        for point in row["support"][1:]:
            atom = _atom_guard(row_index, point)
            assumptions.append(
                atom if (row_index, point) in active_atoms else f"(not {atom})"
            )
    return assumptions


def _readback_terms(n: int) -> list[str]:
    return [term for point in range(2, n) for term in (f"x_{point}", f"y_{point}")]


def _request_digest(
    *,
    journal: bytes,
    command_count: int,
    assumptions: Sequence[str],
    timeout_ms: int,
    include_model: bool,
    get_values: Sequence[str],
) -> str:
    digest = hashlib.sha256()
    digest.update(b"piqd-smt-solve-request/v1")
    digest.update(f"\nbase={command_count}:{len(journal)}:{_sha(journal)}".encode())
    digest.update(
        f"\ntimeout={timeout_ms}\nmodel={str(include_model).lower()}".encode()
    )
    digest.update(f"\nassumptions={len(assumptions)}".encode())
    for term in assumptions:
        digest.update(f"\n{len(term)}:{term}".encode())
    digest.update(f"\nget_values={len(get_values)}".encode())
    for term in get_values:
        digest.update(f"\n{len(term)}:{term}".encode())
    return digest.hexdigest()


def _json_call(
    transport: neutral.PiqdTransport,
    method: str,
    path: str,
    body: Mapping[str, object] | None = None,
    *,
    status: int = 200,
) -> object:
    try:
        response = transport.request_json(method, path, body)
    except neutral.PiqdTransportLoss:
        raise
    except Exception as exc:
        raise neutral.PiqdTransportLoss("PIQD JSON transport failed") from exc
    if type(response) is not neutral.JsonResponse or response.status != status:
        raise MetricPiqdCoreError("PIQD JSON response/status has the wrong shape")
    return _builtin(response.body, "PIQD JSON response")


def _bytes_call(transport: neutral.PiqdTransport, path: str) -> bytes:
    try:
        response = transport.request_bytes("GET", path)
    except neutral.PiqdTransportLoss:
        raise
    except Exception as exc:
        raise neutral.PiqdTransportLoss("PIQD byte transport failed") from exc
    if (
        type(response) is not neutral.BytesResponse
        or response.status != 200
        or type(response.body) is not bytes
    ):
        raise MetricPiqdCoreError("PIQD byte response/status has the wrong shape")
    return response.body


def _validate_session(
    value: object, *, solver: str, label: str, state: str
) -> dict[str, Any]:
    if type(value) is not dict or set(value) != _SESSION_KEYS:
        raise MetricPiqdCoreError("PIQD session has a non-current field set")
    obj = dict(value)
    try:
        canonical_id = str(uuid.UUID(obj["id"]))
    except (ValueError, TypeError, AttributeError) as exc:
        raise MetricPiqdCoreError("PIQD session ID is invalid") from exc
    if (
        canonical_id != obj["id"]
        or obj["lane"] != "smt"
        or obj["solver_name"] != solver
        or obj["label"] != label
        or obj["state"] != state
        or obj["protocol_version"] != 1
        or type(obj["clauses"]) is not int
        or type(obj["solves"]) is not int
        or type(obj["max_var"]) is not int
        or obj["max_var"] != 0
        or obj["declared_num_vars"] is not None
        or type(obj["solver_signature"]) is not str
        or type(obj["solver_sha256"]) is not str
        or _HEX64.fullmatch(obj["solver_sha256"]) is None
    ):
        raise MetricPiqdCoreError("PIQD session identity/state is invalid")
    return obj


def _answer_keys(
    status: str, *, include_model: bool, get_values: Sequence[str]
) -> set[str]:
    if status == "SAT":
        return ({"model"} if include_model else set()) | (
            {"values"} if get_values else set()
        )
    if status == "UNSAT":
        return {"core", "terminal_unsat"}
    if status == "UNKNOWN":
        return set()
    raise MetricPiqdCoreError("PIQD solve status is invalid")


def _validate_answer(
    value: object,
    *,
    timeout_ms: int,
    include_model: bool,
    get_values: Sequence[str],
    response: bool,
) -> dict[str, Any]:
    required = {
        "status",
        "solve_ms",
        "solve_index",
        "result_sha256",
        "effective_deadline_ms",
    }
    optional = {"interrupted_by", "core", "terminal_unsat", "model", "values"}
    if response:
        optional.add("replayed")
    if (
        type(value) is not dict
        or not required <= set(value)
        or not set(value) <= required | optional
    ):
        raise MetricPiqdCoreError("PIQD solve has a non-current field set")
    obj = dict(value)
    extras = set(obj) & {"core", "terminal_unsat", "model", "values"}
    if extras != _answer_keys(
        obj["status"], include_model=include_model, get_values=get_values
    ):
        raise MetricPiqdCoreError("PIQD solve answer shape disagrees with the request")
    if (
        obj["status"] not in {"SAT", "UNSAT", "UNKNOWN"}
        or type(obj["solve_ms"]) is not int
        or obj["solve_ms"] < 0
        or type(obj["solve_index"]) is not int
        or obj["solve_index"] < 1
        or type(obj["result_sha256"]) is not str
        or _HEX64.fullmatch(obj["result_sha256"]) is None
        or obj["effective_deadline_ms"] != neutral.effective_deadline_ms(timeout_ms)
    ):
        raise MetricPiqdCoreError("PIQD solve metadata is invalid")
    if response and type(obj.get("replayed")) is not bool:
        raise MetricPiqdCoreError("PIQD idempotency flag is absent or invalid")
    if obj["status"] == "UNSAT":
        if type(obj["core"]) is not list or any(
            type(term) is not str for term in obj["core"]
        ):
            raise MetricPiqdCoreError("PIQD UNSAT core is invalid")
        if type(obj["terminal_unsat"]) is not bool or obj["terminal_unsat"] is not (
            len(obj["core"]) == 0
        ):
            raise MetricPiqdCoreError(
                "PIQD terminal UNSAT flag disagrees with its core"
            )
    if obj["status"] == "SAT":
        for key in extras:
            if type(obj[key]) is not str:
                raise MetricPiqdCoreError("PIQD SAT readback is not text")
    if "interrupted_by" in obj and (
        obj["status"] != "UNKNOWN" or obj["interrupted_by"] != "daemon_deadline"
    ):
        raise MetricPiqdCoreError("PIQD cutoff metadata is invalid")
    digest_input = {
        key: obj[key]
        for key in (
            "status",
            "interrupted_by",
            "terminal_unsat",
            "core",
            "model",
            "values",
        )
        if key in obj
    }
    if neutral.piqd_result_digest(digest_input) != obj["result_sha256"]:
        raise MetricPiqdCoreError("PIQD result digest mismatch")
    return obj


def _validate_receipts(
    value: object,
    *,
    session: Mapping[str, Any],
    journal: bytes,
    commands: int,
    requests: Sequence[Mapping[str, Any]],
    solves: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    outer = {"session_id", "lane", "journal_path", "receipts_path", "count", "receipts"}
    if (
        type(value) is not dict
        or set(value) != outer
        or type(value["receipts"]) is not list
    ):
        raise MetricPiqdCoreError("PIQD receipts envelope has a non-current shape")
    expected_path = (
        session["journal_path"].removesuffix("journal.smt2") + "receipts.jsonl"
    )
    if (
        value["session_id"] != session["id"]
        or value["lane"] != "smt"
        or value["journal_path"] != session["journal_path"]
        or value["receipts_path"] != expected_path
        or value["count"] != len(requests)
        or len(value["receipts"]) != len(requests)
    ):
        raise MetricPiqdCoreError("PIQD receipts envelope is not cross-bound")
    checked: list[dict[str, Any]] = []
    base = {
        "base_commands": commands,
        "base_bytes": len(journal),
        "base_sha256": _sha(journal),
        "solver_signature": session["solver_signature"],
        "solver_sha256": session["solver_sha256"],
    }
    for index, (raw, request, solve) in enumerate(
        zip(value["receipts"], requests, solves, strict=True), start=1
    ):
        if (
            type(request) is not dict
            or set(request)
            != {
                "assumptions",
                "timeout_ms",
                "include_model",
                "get_values",
                "request_id",
            }
            or type(request["assumptions"]) is not list
            or any(type(item) is not str for item in request["assumptions"])
            or len(request["assumptions"]) != len(set(request["assumptions"]))
            or type(request["timeout_ms"]) is not int
            or type(request["include_model"]) is not bool
            or type(request["get_values"]) is not list
            or any(type(item) is not str for item in request["get_values"])
            or type(request["request_id"]) is not str
        ):
            raise MetricPiqdCoreError("PIQD request has a non-current schema")
        answer_keys = _answer_keys(
            solve["status"],
            include_model=request["include_model"],
            get_values=request["get_values"],
        )
        required = {
            "solve_index",
            "base_commands",
            "base_bytes",
            "base_sha256",
            "solver_signature",
            "solver_sha256",
            "assumptions",
            "timeout_ms",
            "effective_deadline_ms",
            "include_model",
            "get_values",
            "status",
            "solve_ms",
            "result_sha256",
            "at",
            "request_id",
            "request_sha256",
        } | answer_keys
        optional = {"interrupted_by"} if solve["status"] == "UNKNOWN" else set()
        if (
            type(raw) is not dict
            or not required <= set(raw)
            or not set(raw) <= required | optional
        ):
            raise MetricPiqdCoreError("PIQD receipt has a non-current field set")
        receipt = dict(raw)
        request_digest = _request_digest(
            journal=journal,
            command_count=commands,
            assumptions=request["assumptions"],
            timeout_ms=request["timeout_ms"],
            include_model=request["include_model"],
            get_values=request["get_values"],
        )
        compared = {key: solve[key] for key in set(solve) - {"replayed"}}
        receipt_answer = {key: receipt[key] for key in compared}
        if (
            receipt["solve_index"] != index
            or any(receipt[key] != expected for key, expected in base.items())
            or receipt["assumptions"] != request["assumptions"]
            or receipt["timeout_ms"] != request["timeout_ms"]
            or receipt["include_model"] is not request["include_model"]
            or receipt["get_values"] != request["get_values"]
            or receipt["request_id"] != request["request_id"]
            or receipt["request_sha256"] != request_digest
            or receipt_answer != compared
            or type(receipt["at"]) is not int
        ):
            raise MetricPiqdCoreError(
                "PIQD receipt is not cross-bound to its request/result"
            )
        _validate_answer(
            receipt_answer,
            timeout_ms=request["timeout_ms"],
            include_model=request["include_model"],
            get_values=request["get_values"],
            response=False,
        )
        checked.append(receipt)
    return {**dict(value), "receipts": checked}


def _semantic_replay(
    system: Mapping[str, Any], plan: _Plan, model: str, values: str
) -> dict[str, object]:
    terms = _readback_terms(system["n"])
    readback = metric_piqd._readback(values, terms)
    points: dict[int, tuple[Fraction, Fraction]] = {
        0: (Fraction(0), Fraction(0)),
        1: (Fraction(1), Fraction(0)),
    }
    for point in range(2, system["n"]):
        points[point] = (readback[f"x_{point}"], readback[f"y_{point}"])
    active_atoms = set(plan.atoms)
    checks = {
        "row_equalities": 0,
        "exact_exclusions": 0,
        "distinctness": 0,
        "convex_order": 0,
    }
    for row_index in plan.rows:
        row = system["rows"][row_index]
        reference = metric_piqd._d2(points, row["center"], row["support"][0])
        for point in row["support"][1:]:
            if (row_index, point) in active_atoms:
                checks["row_equalities"] += 1
                if metric_piqd._d2(points, row["center"], point) != reference:
                    raise MetricPiqdCoreError(
                        "SAT replay rejected an active row equality"
                    )
        if plan.stage == "full-convex" and row["exact"]:
            for point in range(system["n"]):
                if point != row["center"] and point not in row["support"]:
                    checks["exact_exclusions"] += 1
                    delta = metric_piqd._d2(points, row["center"], point) - reference
                    if delta * delta <= 0:
                        raise MetricPiqdCoreError(
                            "SAT replay rejected an active exact exclusion"
                        )
    for left in range(system["n"]):
        for right in range(left + 1, system["n"]):
            checks["distinctness"] += 1
            if metric_piqd._d2(points, left, right) <= 0:
                raise MetricPiqdCoreError("SAT replay rejected distinctness")
    order = system["order"]
    for offset, left in enumerate(order):
        right = order[(offset + 1) % system["n"]]
        for point in order:
            if point not in {left, right}:
                checks["convex_order"] += 1
                if metric_piqd._cross(points, left, right, point) <= 0:
                    raise MetricPiqdCoreError("SAT replay rejected convex order")
    return {
        "accepted": True,
        "exact_rational": True,
        "model_sha256": _sha(model.encode()),
        "values_sha256": _sha(values.encode()),
        "checks": checks,
    }


def _validate_published_evidence(
    evidence: object,
    *,
    extension: Mapping[str, type] | None,
    system: Mapping[str, Any],
    engine: Mapping[str, Any],
) -> int:
    extra = set(extension or {})
    if type(evidence) is not dict or set(evidence) != _EVIDENCE_FIELDS | extra:
        raise MetricPiqdCoreError("published solve evidence has a non-current schema")
    for field, expected_type in (extension or {}).items():
        if type(evidence[field]) is not expected_type:
            raise MetricPiqdCoreError(
                "published deletion evidence extension is invalid"
            )
    if (
        type(evidence["purpose"]) is not str
        or evidence["stage"] not in {"full-convex", "convex-only-relaxation"}
        or type(evidence["row_indices"]) is not list
        or any(type(item) is not int for item in evidence["row_indices"])
        or evidence["row_indices"] != sorted(set(evidence["row_indices"]))
        or any(not 0 <= item < len(system["rows"]) for item in evidence["row_indices"])
        or type(evidence["atoms"]) is not list
        or any(
            type(atom) is not list
            or len(atom) != 2
            or any(type(item) is not int for item in atom)
            for atom in evidence["atoms"]
        )
        or evidence["native_named_core_promotion"] is not False
    ):
        raise MetricPiqdCoreError("published solve evidence is malformed")
    atom_tuples = tuple(tuple(atom) for atom in evidence["atoms"])
    if len(atom_tuples) != len(set(atom_tuples)) or not set(atom_tuples) <= set(
        _all_atoms(system, evidence["row_indices"])
    ):
        raise MetricPiqdCoreError("published evidence atom set is invalid")
    solve_index = evidence["solve_index"]
    if type(solve_index) is not int or not 1 <= solve_index <= len(engine["solves"]):
        raise MetricPiqdCoreError("published evidence solve index is invalid")
    solve = engine["solves"][solve_index - 1]
    request = engine["requests"][solve_index - 1]
    plan = _Plan(
        evidence["purpose"],
        evidence["stage"],
        tuple(evidence["row_indices"]),
        atom_tuples,
        request["timeout_ms"],
    )
    assumptions = _assumptions(system, plan)
    expected_request_id = str(
        uuid.uuid5(
            _UUID_NAMESPACE,
            f"{engine['session']['id']}:{solve_index}:{_sha(_canonical([plan.purpose, assumptions]))}",
        )
    )
    if (
        request["assumptions"] != assumptions
        or request["request_id"] != expected_request_id
        or evidence["request_id"] != expected_request_id
        or evidence["status"] != solve["status"]
        or evidence["result_sha256"] != solve["result_sha256"]
        or evidence["native_assumption_core"] != solve.get("core")
    ):
        raise MetricPiqdCoreError("published solve evidence is not request-bound")
    expected_replay = None
    if solve["status"] == "SAT" and engine["solver"] == "cvc5":
        expected_replay = _semantic_replay(
            system, plan, solve["model"], solve["values"]
        )
    if evidence["semantic_replay"] != expected_replay:
        raise MetricPiqdCoreError("published SAT semantic replay is not reproducible")
    return solve_index


class _SessionRunner:
    def __init__(
        self, transport: neutral.PiqdTransport, system: Mapping[str, Any], solver: str
    ) -> None:
        self.transport = transport
        self.system = system
        self.solver = solver
        self.commands, self.journal = _build_journal(system, solver)
        self.label = f"p97-metric-core-{system['system_id']}-{solver}"
        self.session: dict[str, Any] | None = None
        self.requests: list[dict[str, Any]] = []
        self.solves: list[dict[str, Any]] = []
        self.receipts: dict[str, Any] | None = None
        self.closed: dict[str, Any] | None = None

    def open(self) -> None:
        raw = _json_call(
            self.transport,
            "POST",
            "/sessions",
            {"solver": self.solver, "lane": "smt", "label": self.label},
            status=201,
        )
        self.session = _validate_session(
            raw, solver=self.solver, label=self.label, state="live"
        )
        if self.session["clauses"] != 0 or self.session["solves"] != 0:
            raise MetricPiqdCoreError("PIQD did not create a fresh session")
        route = f"/sessions/{self.session['id']}"
        asserted = _json_call(
            self.transport,
            "POST",
            f"{route}/assert",
            {"commands": list(self.commands), "expect_commands": 0},
        )
        if (
            type(asserted) is not dict
            or set(asserted) != {"added", "commands"}
            or asserted != {"added": len(self.commands), "commands": len(self.commands)}
        ):
            raise MetricPiqdCoreError(
                "PIQD append CAS did not bind the guarded journal"
            )
        if _bytes_call(self.transport, f"{route}/smt2") != self.journal:
            raise MetricPiqdCoreError(
                "PIQD exported journal differs from the guarded query"
            )
        self.receipts = _validate_receipts(
            _json_call(self.transport, "GET", f"{route}/receipts"),
            session=self.session,
            journal=self.journal,
            commands=len(self.commands),
            requests=[],
            solves=[],
        )

    def solve(self, plan: _Plan) -> dict[str, Any]:
        if self.session is None:
            raise MetricPiqdCoreError("PIQD session is not open")
        assumptions = _assumptions(self.system, plan)
        get_values = _readback_terms(self.system["n"]) if self.solver == "cvc5" else []
        include_model = self.solver == "cvc5"
        request_id = str(
            uuid.uuid5(
                _UUID_NAMESPACE,
                f"{self.session['id']}:{len(self.requests) + 1}:{_sha(_canonical([plan.purpose, assumptions]))}",
            )
        )
        request = {
            "assumptions": assumptions,
            "timeout_ms": plan.timeout_ms,
            "include_model": include_model,
            "get_values": get_values,
            "request_id": request_id,
        }
        route = f"/sessions/{self.session['id']}"
        try:
            raw = _json_call(self.transport, "POST", f"{route}/solve", request)
        except neutral.PiqdTransportLoss:
            raw = _json_call(self.transport, "POST", f"{route}/solve", request)
            if type(raw) is not dict or raw.get("replayed") is not True:
                raise MetricPiqdCoreError(
                    "idempotent PIQD retry was not marked replayed"
                )
        solve = _validate_answer(
            raw,
            timeout_ms=plan.timeout_ms,
            include_model=include_model,
            get_values=get_values,
            response=True,
        )
        if solve["solve_index"] != len(self.solves) + 1:
            raise MetricPiqdCoreError("PIQD solve index is not sequential")
        if solve["status"] == "UNSAT" and (
            len(solve["core"]) != len(set(solve["core"]))
            or not set(solve["core"]) <= set(assumptions)
        ):
            raise MetricPiqdCoreError(
                "PIQD native core is not a subset of requested assumptions"
            )
        replay = None
        if solve["status"] == "SAT" and self.solver == "cvc5":
            replay = _semantic_replay(
                self.system, plan, solve["model"], solve["values"]
            )
        self.requests.append(request)
        self.solves.append(solve)
        receipts = _validate_receipts(
            _json_call(self.transport, "GET", f"{route}/receipts"),
            session=self.session,
            journal=self.journal,
            commands=len(self.commands),
            requests=self.requests,
            solves=self.solves,
        )
        if (
            self.receipts is not None
            and receipts["receipts"][: len(self.receipts["receipts"])]
            != self.receipts["receipts"]
        ):
            raise MetricPiqdCoreError("durable PIQD receipt history changed")
        self.receipts = receipts
        return {
            "purpose": plan.purpose,
            "stage": plan.stage,
            "row_indices": list(plan.rows),
            "atoms": [list(atom) for atom in plan.atoms],
            "status": solve["status"],
            "solve_index": solve["solve_index"],
            "result_sha256": solve["result_sha256"],
            "request_id": request_id,
            "native_assumption_core": solve.get("core"),
            "native_named_core_promotion": False,
            "semantic_replay": replay,
        }

    def close(self) -> None:
        if self.session is None:
            return
        self.closed = _validate_session(
            _json_call(self.transport, "DELETE", f"/sessions/{self.session['id']}"),
            solver=self.solver,
            label=self.label,
            state="closed",
        )
        if self.closed["clauses"] != len(self.commands) or self.closed["solves"] != len(
            self.solves
        ):
            raise MetricPiqdCoreError("closed PIQD session counters disagree")

    def evidence(self) -> dict[str, object]:
        if self.session is None or self.receipts is None or self.closed is None:
            raise MetricPiqdCoreError("PIQD session evidence is incomplete")
        return {
            "solver": self.solver,
            "session": self.session,
            "closed_session": self.closed,
            "journal_sha256": _sha(self.journal),
            "journal_bytes": len(self.journal),
            "command_count": len(self.commands),
            "requests": self.requests,
            "solves": self.solves,
            "receipts": self.receipts,
            "sequential": True,
            "workers": 1,
            "local_fallback": False,
        }


def _stage(system: Mapping[str, Any]) -> str:
    statuses = {item["stage"]: item["status"] for item in system["stages"]}
    return (
        "convex-only-relaxation"
        if statuses.get("convex-only-relaxation") == "UNSAT"
        else "full-convex"
    )


def _mine_one(
    system: Mapping[str, Any],
    transport: neutral.PiqdTransport,
    *,
    deletion_timeout_ms: int,
    validation_timeout_ms: int,
) -> tuple[dict[str, object], dict[str, bytes]]:
    stage = _stage(system)
    cvc5 = _SessionRunner(transport, system, "cvc5")
    z3 = _SessionRunner(transport, system, "z3")
    cvc5.open()
    try:
        rows = list(range(len(system["rows"])))
        row_attempts = []
        for row_index in tuple(rows):
            trial = tuple(item for item in rows if item != row_index)
            plan = _Plan(
                f"delete-row-{row_index}",
                stage,
                trial,
                _all_atoms(system, trial),
                deletion_timeout_ms,
            )
            verdict = cvc5.solve(plan)
            removed = verdict["status"] == "UNSAT"
            row_attempts.append({**verdict, "row_index": row_index, "removed": removed})
            if removed:
                rows = list(trial)
        core_rows = tuple(rows)
        row_validation = cvc5.solve(
            _Plan(
                "validate-row-core",
                stage,
                core_rows,
                _all_atoms(system, core_rows),
                validation_timeout_ms,
            )
        )
        convex_validation = None
        if stage == "full-convex":
            convex_validation = cvc5.solve(
                _Plan(
                    "validate-convex-only-row-core",
                    "convex-only-relaxation",
                    core_rows,
                    _all_atoms(system, core_rows),
                    validation_timeout_ms,
                )
            )
        atom_stage = (
            "convex-only-relaxation"
            if stage == "convex-only-relaxation"
            or (convex_validation and convex_validation["status"] == "UNSAT")
            else "full-convex"
        )
        atoms = list(_all_atoms(system, core_rows))
        atom_attempts = []
        for atom in tuple(atoms):
            trial_atoms = tuple(item for item in atoms if item != atom)
            verdict = cvc5.solve(
                _Plan(
                    f"delete-atom-{atom[0]}-{atom[1]}",
                    atom_stage,
                    core_rows,
                    trial_atoms,
                    deletion_timeout_ms,
                )
            )
            removed = verdict["status"] == "UNSAT"
            atom_attempts.append({**verdict, "atom": list(atom), "removed": removed})
            if removed:
                atoms = list(trial_atoms)
        atom_core = tuple(atoms)
        atom_validation = cvc5.solve(
            _Plan(
                "validate-atom-core",
                atom_stage,
                core_rows,
                atom_core,
                validation_timeout_ms,
            )
        )
    except Exception:
        with contextlib.suppress(Exception):
            cvc5.close()
        raise
    else:
        cvc5.close()
    z3.open()
    try:
        z3_row = z3.solve(
            _Plan(
                "z3-validate-row-core",
                stage,
                core_rows,
                _all_atoms(system, core_rows),
                validation_timeout_ms,
            )
        )
        z3_atom = z3.solve(
            _Plan(
                "z3-validate-atom-core",
                atom_stage,
                core_rows,
                atom_core,
                validation_timeout_ms,
            )
        )
    except Exception:
        with contextlib.suppress(Exception):
            z3.close()
        raise
    else:
        z3.close()
    if atom_validation["status"] != "UNSAT":
        cross = "CORE_NOT_REVALIDATED"
    elif z3_atom["status"] == "UNSAT":
        cross = "CROSSCHECKED_UNSAT"
    elif z3_atom["status"] == "SAT":
        cross = "SOLVER_DISAGREEMENT"
    elif z3_atom["status"] == "UNKNOWN":
        cross = "CVC5_UNSAT_Z3_UNKNOWN"
    else:
        cross = "CVC5_UNSAT_Z3_ERROR"
    semantic = {
        key: system[key]
        for key in ("system_id", "n", "profile", "order", "rows", "sources")
    }
    order_bytes = _canonical(system["order"])
    profile_bytes = _canonical(system["profile"])
    result = {
        "system_id": system["system_id"],
        "semantic_input": semantic,
        "semantic_input_sha256": _sha(_canonical(semantic)),
        "order_sha256": _sha(order_bytes),
        "profile_sha256": _sha(profile_bytes),
        "minimized_stage": stage,
        "atom_stage": atom_stage,
        "original_row_count": len(system["rows"]),
        "core_row_indices": list(core_rows),
        "core_rows": [system["rows"][index] for index in core_rows],
        "row_deletion_attempts": row_attempts,
        "row_validation": row_validation,
        "convex_only_validation": convex_validation,
        "original_atom_count": len(_all_atoms(system, core_rows)),
        "atoms": [list(atom) for atom in atom_core],
        "atom_deletion_attempts": atom_attempts,
        "atom_validation": atom_validation,
        "z3_row_validation": z3_row,
        "z3_atom_validation": z3_atom,
        "crosscheck_status": cross,
        "classification": "DIAGNOSTIC_SOLVER_EVIDENCE_NOT_A_PROOF",
        "assumption_binding": "source-promotion-blocked-pending-caller-owned-commitment-5400",
        "claims": dict(_FALSE_CLAIMS),
        "cvc5_engine": cvc5.evidence(),
        "z3_engine": z3.evidence(),
    }
    prefix = system["system_id"]
    artifacts = {
        f"{prefix}.cvc5.smt2": cvc5.journal,
        f"{prefix}.z3.smt2": z3.journal,
        f"{prefix}.cvc5.receipts.json": _artifact(cvc5.receipts),
        f"{prefix}.z3.receipts.json": _artifact(z3.receipts),
    }
    return result, artifacts


def _publish(
    output: Path,
    custody: _InputCustody,
    record: Mapping[str, object],
    artifacts: Mapping[str, bytes],
) -> None:
    staging = neutral._reserve_output_staging(output)
    keep = False
    try:
        manifest_artifacts: dict[str, dict[str, object]] = {}
        all_artifacts = {
            "source-input.json": custody.raw,
            "result.json": _artifact(record),
            **artifacts,
        }
        for name, raw in sorted(all_artifacts.items()):
            manifest_artifacts[name] = neutral._write_immutable(
                staging.staging_fd, name, raw
            )
        manifest = {
            "schema": MANIFEST_SCHEMA,
            "artifacts": manifest_artifacts,
            "record_sha256": _sha(_artifact(record)),
            "input_sha256": _sha(custody.raw),
            "immutable": True,
        }
        neutral._write_immutable(
            staging.staging_fd, "manifest.json", _artifact(manifest)
        )
        _recheck(custody)
        neutral._publish_output(staging)
        keep = True
    finally:
        neutral._close_output_staging(staging, keep=keep)


def run(
    input_path: Path,
    output: Path,
    transport: neutral.PiqdTransport,
    *,
    deletion_timeout_ms: int,
    validation_timeout_ms: int,
    system_ids: Sequence[str] = (),
) -> dict[str, object]:
    if (
        type(deletion_timeout_ms) is not int
        or not 1 <= deletion_timeout_ms <= MAX_TIMEOUT_MS
    ):
        raise MetricPiqdCoreError("deletion_timeout_ms is outside 1..3600000")
    if (
        type(validation_timeout_ms) is not int
        or not 1 <= validation_timeout_ms <= MAX_TIMEOUT_MS
    ):
        raise MetricPiqdCoreError("validation_timeout_ms is outside 1..3600000")
    custody = _capture(input_path)
    _source, systems = _validate_input(custody.raw)
    if system_ids:
        wanted = set(system_ids)
        systems = [system for system in systems if system["system_id"] in wanted]
        missing = wanted - {system["system_id"] for system in systems}
        if missing:
            raise MetricPiqdCoreError(
                f"unknown CVC5_UNSAT IDs: {', '.join(sorted(missing))}"
            )
    results, artifacts = [], {}
    for system in systems:
        result, system_artifacts = _mine_one(
            system,
            transport,
            deletion_timeout_ms=deletion_timeout_ms,
            validation_timeout_ms=validation_timeout_ms,
        )
        results.append(result)
        artifacts.update(system_artifacts)
    selected_ids = [system["system_id"] for system in systems]
    record = {
        "schema": SCHEMA,
        "input": {
            "path": os.fspath(custody.path),
            "bytes": len(custody.raw),
            "sha256": _sha(custody.raw),
            "schema": producer.SCHEMA,
            "identity": {
                "dev": custody.dev,
                "ino": custody.ino,
                "size": custody.size,
                "mtime_ns": custody.mtime_ns,
                "ctime_ns": custody.ctime_ns,
            },
        },
        "selection": {
            "system_ids": selected_ids,
            "count": len(selected_ids),
            "system_ids_sha256": _sha(_canonical(selected_ids)),
        },
        "profile": {
            "schema": PROFILE_SCHEMA,
            "lane": "smt",
            "solvers": ["cvc5", "z3"],
            "workers": 1,
            "sequential": True,
            "append_cas": True,
            "request_id_idempotency": True,
            "local_fallback": False,
            "deletion_timeout_ms": deletion_timeout_ms,
            "validation_timeout_ms": validation_timeout_ms,
        },
        "results": results,
        "classification": "PIQD_AUTHENTICATED_DIAGNOSTIC_NOT_P97_CLOSURE",
        "claims": dict(_FALSE_CLAIMS),
    }
    _publish(output, custody, record, artifacts)
    return record


def _validate_published_files(files: Mapping[str, bytes]) -> dict[str, object]:
    if (
        "manifest.json" not in files
        or "result.json" not in files
        or "source-input.json" not in files
    ):
        raise MetricPiqdCoreError("published output is incomplete")
    manifest = _strict_json(files["manifest.json"], "published manifest")
    if (
        type(manifest) is not dict
        or set(manifest)
        != {"schema", "artifacts", "record_sha256", "input_sha256", "immutable"}
        or manifest["schema"] != MANIFEST_SCHEMA
        or manifest["immutable"] is not True
    ):
        raise MetricPiqdCoreError("published manifest has a non-current schema")
    if type(manifest["artifacts"]) is not dict or set(files) != set(
        manifest["artifacts"]
    ) | {"manifest.json"}:
        raise MetricPiqdCoreError("published artifact inventory mismatch")
    for name, meta in manifest["artifacts"].items():
        if type(meta) is not dict or set(meta) != {"path", "bytes", "sha256"}:
            raise MetricPiqdCoreError(
                "published artifact metadata has a non-current schema"
            )
        if (
            meta["path"] != name
            or meta["bytes"] != len(files[name])
            or meta["sha256"] != _sha(files[name])
        ):
            raise MetricPiqdCoreError("published artifact digest mismatch")
    record = _strict_json(files["result.json"], "published result")
    if (
        type(record) is not dict
        or set(record) != _RECORD_FIELDS
        or record["schema"] != SCHEMA
    ):
        raise MetricPiqdCoreError("published result has a non-current schema")
    if manifest["record_sha256"] != _sha(files["result.json"]) or manifest[
        "input_sha256"
    ] != _sha(files["source-input.json"]):
        raise MetricPiqdCoreError("manifest root binding mismatch")
    if (
        record["classification"] != "PIQD_AUTHENTICATED_DIAGNOSTIC_NOT_P97_CLOSURE"
        or record["claims"] != _FALSE_CLAIMS
        or type(record["input"]) is not dict
        or set(record["input"]) != {"path", "bytes", "sha256", "schema", "identity"}
        or record["input"]["bytes"] != len(files["source-input.json"])
        or record["input"]["sha256"] != _sha(files["source-input.json"])
        or record["input"]["schema"] != producer.SCHEMA
        or type(record["input"]["path"]) is not str
        or type(record["input"]["identity"]) is not dict
        or set(record["input"]["identity"])
        != {"dev", "ino", "size", "mtime_ns", "ctime_ns"}
        or any(type(value) is not int for value in record["input"]["identity"].values())
        or type(record["profile"]) is not dict
        or set(record["profile"]) != _PROFILE_FIELDS
        or record["profile"]["schema"] != PROFILE_SCHEMA
        or record["profile"]["lane"] != "smt"
        or record["profile"]["solvers"] != ["cvc5", "z3"]
        or record["profile"]["workers"] != 1
        or record["profile"]["sequential"] is not True
        or record["profile"]["append_cas"] is not True
        or record["profile"]["request_id_idempotency"] is not True
        or record["profile"]["local_fallback"] is not False
        or type(record["profile"]["deletion_timeout_ms"]) is not int
        or not 1 <= record["profile"]["deletion_timeout_ms"] <= MAX_TIMEOUT_MS
        or type(record["profile"]["validation_timeout_ms"]) is not int
        or not 1 <= record["profile"]["validation_timeout_ms"] <= MAX_TIMEOUT_MS
    ):
        raise MetricPiqdCoreError("published record/profile binding is invalid")
    _source, selected = _validate_input(files["source-input.json"])
    selected_by_id = {item["system_id"]: item for item in selected}
    selection = record.get("selection")
    if type(selection) is not dict or set(selection) != _SELECTION_FIELDS:
        raise MetricPiqdCoreError("published selection has a non-current schema")
    selection_ids = selection["system_ids"]
    if (
        type(selection_ids) is not list
        or not selection_ids
        or any(type(system_id) is not str for system_id in selection_ids)
        or selection_ids != sorted(selection_ids)
        or len(selection_ids) != len(set(selection_ids))
        or type(selection["count"]) is not int
        or selection["count"] != len(selection_ids)
        or type(selection["system_ids_sha256"]) is not str
        or _HEX64.fullmatch(selection["system_ids_sha256"]) is None
        or selection["system_ids_sha256"] != _sha(_canonical(selection_ids))
        or not set(selection_ids) <= set(selected_by_id)
    ):
        raise MetricPiqdCoreError("published selection binding is invalid")
    if type(record["results"]) is not list or not record["results"]:
        raise MetricPiqdCoreError("published result list is empty")
    result_ids = [
        result.get("system_id") if type(result) is dict else None
        for result in record["results"]
    ]
    if result_ids != selection_ids:
        raise MetricPiqdCoreError(
            "published result IDs do not exactly match the ordered selection"
        )
    expected_artifacts = {"source-input.json", "result.json"} | {
        f"{system_id}.{solver}.{suffix}"
        for system_id in selection_ids
        for solver, suffix in (
            ("cvc5", "smt2"),
            ("cvc5", "receipts.json"),
            ("z3", "smt2"),
            ("z3", "receipts.json"),
        )
    }
    if set(manifest["artifacts"]) != expected_artifacts:
        raise MetricPiqdCoreError("published system artifact inventory is not exact")
    for result in record["results"]:
        if (
            type(result) is not dict
            or set(result) != _PUBLISHED_RESULT_FIELDS
            or result.get("system_id") not in selected_by_id
        ):
            raise MetricPiqdCoreError(
                "published result does not bind a selected input system"
            )
        system_id = result["system_id"]
        semantic = {
            key: selected_by_id[system_id][key]
            for key in ("system_id", "n", "profile", "order", "rows", "sources")
        }
        if result.get("semantic_input") != semantic or result.get(
            "semantic_input_sha256"
        ) != _sha(_canonical(semantic)):
            raise MetricPiqdCoreError("published semantic input binding mismatch")
        if result.get("order_sha256") != _sha(
            _canonical(semantic["order"])
        ) or result.get("profile_sha256") != _sha(_canonical(semantic["profile"])):
            raise MetricPiqdCoreError("published order/profile binding mismatch")
        if (
            result["classification"] != "DIAGNOSTIC_SOLVER_EVIDENCE_NOT_A_PROOF"
            or result["claims"] != _FALSE_CLAIMS
            or result["assumption_binding"]
            != "source-promotion-blocked-pending-caller-owned-commitment-5400"
            or result["minimized_stage"]
            not in {"full-convex", "convex-only-relaxation"}
            or result["atom_stage"] not in {"full-convex", "convex-only-relaxation"}
            or type(result["core_row_indices"]) is not list
            or any(type(item) is not int for item in result["core_row_indices"])
            or result["core_row_indices"] != sorted(set(result["core_row_indices"]))
            or any(
                not 0 <= item < len(semantic["rows"])
                for item in result["core_row_indices"]
            )
            or type(result["core_rows"]) is not list
            or result["core_rows"]
            != [semantic["rows"][index] for index in result["core_row_indices"]]
            or result["original_row_count"] != len(semantic["rows"])
            or type(result["row_deletion_attempts"]) is not list
            or len(result["row_deletion_attempts"]) != len(semantic["rows"])
            or type(result["atom_deletion_attempts"]) is not list
            or type(result["atoms"]) is not list
            or type(result["row_validation"]) is not dict
            or (
                result["convex_only_validation"] is not None
                and type(result["convex_only_validation"]) is not dict
            )
            or type(result["atom_validation"]) is not dict
            or type(result["z3_row_validation"]) is not dict
            or type(result["z3_atom_validation"]) is not dict
        ):
            raise MetricPiqdCoreError("published minimized core binding is invalid")
        expected_stage = _stage(
            {**semantic, "stages": selected_by_id[system_id]["stages"]}
        )
        rows = list(range(len(semantic["rows"])))
        for expected_row, evidence in zip(
            tuple(rows), result["row_deletion_attempts"], strict=True
        ):
            trial = [item for item in rows if item != expected_row]
            removed = evidence.get("status") == "UNSAT"
            if (
                evidence.get("row_index") != expected_row
                or evidence.get("purpose") != f"delete-row-{expected_row}"
                or evidence.get("stage") != expected_stage
                or evidence.get("row_indices") != trial
                or evidence.get("removed") is not removed
            ):
                raise MetricPiqdCoreError("published row deletion trace is invalid")
            if removed:
                rows = trial
        if (
            result["minimized_stage"] != expected_stage
            or result["core_row_indices"] != rows
            or result["row_validation"].get("purpose") != "validate-row-core"
            or result["row_validation"].get("stage") != expected_stage
            or result["row_validation"].get("row_indices") != rows
            or result["z3_row_validation"].get("purpose") != "z3-validate-row-core"
            or result["z3_row_validation"].get("stage") != expected_stage
            or result["z3_row_validation"].get("row_indices") != rows
            or (result["convex_only_validation"] is None)
            != (expected_stage != "full-convex")
        ):
            raise MetricPiqdCoreError("published row core validation trace is invalid")
        all_core_atoms = [list(atom) for atom in _all_atoms(semantic, rows)]
        if (
            result["row_validation"].get("atoms") != all_core_atoms
            or result["z3_row_validation"].get("atoms") != all_core_atoms
            or (
                result["convex_only_validation"] is not None
                and (
                    result["convex_only_validation"].get("purpose")
                    != "validate-convex-only-row-core"
                    or result["convex_only_validation"].get("stage")
                    != "convex-only-relaxation"
                    or result["convex_only_validation"].get("row_indices") != rows
                    or result["convex_only_validation"].get("atoms") != all_core_atoms
                )
            )
        ):
            raise MetricPiqdCoreError(
                "published row validation assumptions are invalid"
            )
        expected_atom_stage = (
            "convex-only-relaxation"
            if expected_stage == "convex-only-relaxation"
            or result["convex_only_validation"].get("status") == "UNSAT"
            else "full-convex"
        )
        atoms = [list(atom) for atom in _all_atoms(semantic, rows)]
        if len(result["atom_deletion_attempts"]) != len(atoms):
            raise MetricPiqdCoreError("published atom deletion trace has wrong length")
        for expected_atom, evidence in zip(
            tuple(atoms), result["atom_deletion_attempts"], strict=True
        ):
            trial = [item for item in atoms if item != expected_atom]
            removed = evidence.get("status") == "UNSAT"
            if (
                evidence.get("atom") != expected_atom
                or evidence.get("purpose")
                != f"delete-atom-{expected_atom[0]}-{expected_atom[1]}"
                or evidence.get("stage") != expected_atom_stage
                or evidence.get("atoms") != trial
                or evidence.get("removed") is not removed
            ):
                raise MetricPiqdCoreError("published atom deletion trace is invalid")
            if removed:
                atoms = trial
        if (
            result["atom_stage"] != expected_atom_stage
            or result["original_atom_count"] != len(_all_atoms(semantic, rows))
            or result["atoms"] != atoms
            or result["atom_validation"].get("purpose") != "validate-atom-core"
            or result["atom_validation"].get("stage") != expected_atom_stage
            or result["atom_validation"].get("row_indices") != rows
            or result["atom_validation"].get("atoms") != atoms
            or result["z3_atom_validation"].get("purpose") != "z3-validate-atom-core"
            or result["z3_atom_validation"].get("stage") != expected_atom_stage
            or result["z3_atom_validation"].get("row_indices") != rows
            or result["z3_atom_validation"].get("atoms") != atoms
        ):
            raise MetricPiqdCoreError("published atom core validation trace is invalid")
        if result["atom_validation"]["status"] != "UNSAT":
            expected_cross = "CORE_NOT_REVALIDATED"
        elif result["z3_atom_validation"]["status"] == "UNSAT":
            expected_cross = "CROSSCHECKED_UNSAT"
        elif result["z3_atom_validation"]["status"] == "SAT":
            expected_cross = "SOLVER_DISAGREEMENT"
        elif result["z3_atom_validation"]["status"] == "UNKNOWN":
            expected_cross = "CVC5_UNSAT_Z3_UNKNOWN"
        else:
            expected_cross = "CVC5_UNSAT_Z3_ERROR"
        if result["crosscheck_status"] != expected_cross:
            raise MetricPiqdCoreError("published cross-check classification is invalid")
        engines: dict[str, dict[str, Any]] = {}
        for solver in ("cvc5", "z3"):
            journal = files[f"{system_id}.{solver}.smt2"]
            expected_commands, expected_journal = _build_journal(semantic, solver)
            if journal != expected_journal:
                raise MetricPiqdCoreError("published guarded query does not rebuild")
            engine = result.get(f"{solver}_engine")
            if (
                type(engine) is not dict
                or set(engine) != _ENGINE_FIELDS
                or engine.get("journal_sha256") != _sha(journal)
                or engine.get("command_count") != len(expected_commands)
                or engine.get("journal_bytes") != len(journal)
                or engine.get("solver") != solver
                or engine.get("workers") != 1
                or engine.get("sequential") is not True
                or engine.get("local_fallback") is not False
            ):
                raise MetricPiqdCoreError("published engine/query binding mismatch")
            created = _validate_session(
                engine["session"],
                solver=solver,
                label=f"p97-metric-core-{system_id}-{solver}",
                state="live",
            )
            closed = _validate_session(
                engine["closed_session"],
                solver=solver,
                label=f"p97-metric-core-{system_id}-{solver}",
                state="closed",
            )
            stable_session_fields = {
                "id",
                "lane",
                "solver_name",
                "solver_sha256",
                "solver_signature",
                "protocol_version",
                "journal_path",
                "created_at",
                "label",
            }
            if (
                any(created[field] != closed[field] for field in stable_session_fields)
                or closed["clauses"] != len(expected_commands)
                or closed["solves"] != len(engine["solves"])
            ):
                raise MetricPiqdCoreError(
                    "published session lifecycle is not continuous"
                )
            receipts = _strict_json(
                files[f"{system_id}.{solver}.receipts.json"], "published receipts"
            )
            if receipts != engine.get("receipts"):
                raise MetricPiqdCoreError("published receipt artifact mismatch")
            _validate_receipts(
                receipts,
                session=engine["session"],
                journal=journal,
                commands=len(expected_commands),
                requests=engine["requests"],
                solves=engine["solves"],
            )
            engines[solver] = engine
        cvc5_evidence = [
            *result["row_deletion_attempts"],
            result["row_validation"],
            *(
                [result["convex_only_validation"]]
                if result["convex_only_validation"] is not None
                else []
            ),
            *result["atom_deletion_attempts"],
            result["atom_validation"],
        ]
        cvc5_indices = []
        for evidence in result["row_deletion_attempts"]:
            cvc5_indices.append(
                _validate_published_evidence(
                    evidence,
                    extension={"row_index": int, "removed": bool},
                    system=semantic,
                    engine=engines["cvc5"],
                )
            )
        for evidence in cvc5_evidence[len(result["row_deletion_attempts"]) :]:
            extension = (
                {"atom": list, "removed": bool}
                if evidence in result["atom_deletion_attempts"]
                else None
            )
            cvc5_indices.append(
                _validate_published_evidence(
                    evidence,
                    extension=extension,
                    system=semantic,
                    engine=engines["cvc5"],
                )
            )
        z3_indices = [
            _validate_published_evidence(
                result[field], extension=None, system=semantic, engine=engines["z3"]
            )
            for field in ("z3_row_validation", "z3_atom_validation")
        ]
        if cvc5_indices != list(
            range(1, len(engines["cvc5"]["solves"]) + 1)
        ) or z3_indices != [1, 2]:
            raise MetricPiqdCoreError(
                "published solve evidence is incomplete or reordered"
            )
    return dict(record)


def validate_published_output(output: Path) -> dict[str, object]:
    """Validate an immutable PIQD core-miner bundle without PIQD or a solver."""

    try:
        capture = metric_piqd._capture_published_directory(output)
    except metric_piqd.MetricPiqdCvc5Error as exc:
        raise MetricPiqdCoreError("cannot capture immutable published output") from exc
    try:
        record = _validate_published_files(capture.files)
        try:
            metric_piqd._finalize_published_directory_capture(capture)
        except metric_piqd.MetricPiqdCvc5Error as exc:
            raise MetricPiqdCoreError("published output custody changed") from exc
        return record
    finally:
        os.close(capture.root_fd)


def _parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--check", type=Path)
    mode.add_argument("--system-id", action="append", default=[])
    parser.add_argument("--input", type=Path, default=producer.DEFAULT_OUT)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--deletion-timeout-ms", type=int, default=5_000)
    parser.add_argument("--validation-timeout-ms", type=int, default=60_000)
    args = parser.parse_args(argv)
    if args.workers != 1:
        parser.error("--workers must be exactly 1 for sequential PIQD custody")
    return args


def main(argv: Sequence[str] | None = None) -> int:
    args = _parse_args(argv)
    try:
        if args.check is not None:
            record = validate_published_output(args.check)
        else:
            transport = neutral.UrllibPiqdTransport(
                args.server,
                http_timeout_s=neutral.bounded_solve_http_timeout_s(
                    max(args.deletion_timeout_ms, args.validation_timeout_ms)
                ),
            )
            record = run(
                args.input,
                args.out,
                transport,
                deletion_timeout_ms=args.deletion_timeout_ms,
                validation_timeout_ms=args.validation_timeout_ms,
                system_ids=args.system_id,
            )
    except (MetricPiqdCoreError, neutral.SmtSourceAdapterError) as exc:
        print(json.dumps({"status": "INCONCLUSIVE", "error": str(exc)}, sort_keys=True))
        return 2
    print(
        json.dumps(
            {
                "classification": record["classification"],
                "output": os.fspath(args.check or args.out),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
