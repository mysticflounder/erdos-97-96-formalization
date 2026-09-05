#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Reconstruct exact-13 CEGAR custody and emit clause-provenance DIMACS."""

from __future__ import annotations

import argparse
import ctypes
import hashlib
import json
import os
import shutil
import sys
import tempfile
import types
from collections.abc import Iterable
from dataclasses import dataclass
from pathlib import Path

import cardge13_exact13_global_source_cell_boolean_slice_piqd as boolean
import cardge13_exact13_global_source_cell_csp_piqd as base
import cardge13_exact13_global_source_cell_slice_piqd as sliced
import cardge13_exact13_tight_cover_lra_piqd as tight
import cardge13_literal_qfuf_to_dimacs as legacy

SCHEMA = "cardge13-literal-qfuf-dimacs/v2"
PROVENANCE_SCHEMA = "cardge13-literal-qfuf-clause-provenance/v1"
PATH_EVENT_SCHEMA = "cardge13-exact13-global-source-cell-boolean-path-cegar-piqd/v1"
PAIR_EVENT_SCHEMA = "cardge13-exact13-global-source-cell-boolean-path-pair-cegar-piqd/v1"
RESUME_EVENT_SCHEMA = (
    "cardge13-exact13-global-source-cell-boolean-path-pair-resume-piqd/v1"
)
EVENT_SCHEMAS = frozenset({PATH_EVENT_SCHEMA, PAIR_EVENT_SCHEMA, RESUME_EVENT_SCHEMA})


class ConversionError(ValueError):
    """The source, event lineage, or literal-CNF custody failed validation."""


@dataclass(frozen=True)
class ParsedClause:
    """One literal clause with its exact assertion location."""

    literals: tuple[int, ...]
    assertion: str
    assertion_sha256: str
    assertion_ordinal: int
    command_index: int | None
    line_number: int | None
    byte_start: int | None
    byte_end: int | None


@dataclass(frozen=True)
class StagedArtifact:
    """One fully written sibling temporary file awaiting exclusive publish."""

    temporary: Path
    target: Path
    sha256: str
    byte_count: int


@dataclass(frozen=True)
class ParsedCnf:
    """A declaration-ordered literal CNF retaining assertion records."""

    symbols: tuple[str, ...]
    clauses: tuple[ParsedClause, ...]
    positive_units: int
    negative_units: int
    disjunctions: int


@dataclass(frozen=True)
class CutRecord:
    """One learned cut bound to its event and semantic conflict record."""

    assertion: str
    origin: dict[str, object]


@dataclass(frozen=True)
class ReconstructedRun:
    """A byte-checked journal and its terminal learned cuts."""

    event: dict[str, object]
    event_sha256: str
    base_commands: tuple[str, ...]
    bank: tuple[dict[str, object], ...]
    seed_cuts: tuple[CutRecord, ...]
    terminal_cuts: tuple[CutRecord, ...]
    role_pins: dict[str, int]
    row_pins: dict[str, tuple[int, ...]]
    orientation: str
    order: tuple[int, ...]
    custody_snapshots: tuple[tuple[Path, bytes], ...]


def canonical_json_bytes(value: object) -> bytes:
    """Encode canonical JSON for stable hashes and JSONL rows."""
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def sha256_bytes(payload: bytes) -> str:
    """Return the lowercase SHA-256 digest of bytes."""
    return hashlib.sha256(payload).hexdigest()


def sha256_file(path: Path) -> str:
    """Hash a file without loading it all in memory."""
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def capture_snapshot(
    path: Path, snapshots: dict[Path, bytes], *, label: str
) -> bytes:
    """Read one canonical path once and reject drift across recursive visits."""
    canonical = path.resolve()
    payload = canonical.read_bytes()
    previous = snapshots.get(canonical)
    if previous is not None and previous != payload:
        raise ConversionError(f"{label} changed during recursive authentication: {path}")
    snapshots[canonical] = payload
    return payload


def load_json_object(payload: bytes, label: str) -> dict[str, object]:
    """Decode one UTF-8 JSON object fail-closed."""
    try:
        value = json.loads(payload)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise ConversionError(f"{label} is not valid UTF-8 JSON") from exc
    if not isinstance(value, dict):
        raise ConversionError(f"{label} is not a JSON object")
    return value


def normalized_pins(
    event: dict[str, object],
) -> tuple[dict[str, int], dict[str, tuple[int, ...]]]:
    """Validate and normalize event role and row pin maps."""
    raw_roles = event.get("role_pins")
    raw_rows = event.get("row_pins")
    if not isinstance(raw_roles, dict) or not isinstance(raw_rows, dict):
        raise ConversionError("event pin maps are malformed")
    role_items: list[tuple[str, int]] = []
    for name, point in raw_roles.items():
        if not isinstance(name, str) or isinstance(point, bool) or not isinstance(point, int):
            raise ConversionError("event role pin is malformed")
        role_items.append((name, point))
    row_items: list[tuple[str, tuple[int, ...]]] = []
    for name, support in raw_rows.items():
        if not isinstance(name, str) or not isinstance(support, list):
            raise ConversionError("event row pin is malformed")
        if any(isinstance(point, bool) or not isinstance(point, int) for point in support):
            raise ConversionError("event row support is malformed")
        row_items.append((name, tuple(support)))
    try:
        roles, rows = sliced.normalize_pins(tuple(role_items), tuple(row_items))
    except (AssertionError, TypeError, ValueError) as exc:
        raise ConversionError("event pins fail source normalization") from exc
    if roles != raw_roles or {name: list(support) for name, support in rows.items()} != raw_rows:
        raise ConversionError("event pins are not in normalized source form")
    return roles, rows


def validate_conflict_cut(
    iteration: dict[str, object],
    *,
    event_label: str,
    iteration_index: int,
) -> tuple[str, dict[str, object]]:
    """Bind a learned clause exactly to its recorded conflict atom set."""
    cut = iteration.get("cut")
    conflict = iteration.get("linear_conflict")
    if not isinstance(cut, str) or not isinstance(conflict, dict):
        raise ConversionError(f"{event_label} iteration {iteration_index} lacks cut data")
    atoms = conflict.get("atoms")
    if (
        not isinstance(atoms, list)
        or not atoms
        or any(not isinstance(atom, str) for atom in atoms)
        or atoms != sorted(set(atoms))
    ):
        raise ConversionError(f"{event_label} iteration {iteration_index} has malformed atoms")
    expected = f"(assert {base.disjunction(f'(not {atom})' for atom in atoms)})"
    if cut != expected or legacy.OR_RE.fullmatch(cut) is None:
        raise ConversionError(f"{event_label} iteration {iteration_index} cut/atom drift")
    return cut, conflict


def event_cut_records(
    payload: bytes,
    *,
    event_path: str,
) -> tuple[dict[str, object], tuple[CutRecord, ...], str]:
    """Validate one CEGAR event and retain every learned cut occurrence."""
    event = load_json_object(payload, event_path)
    schema = event.get("schema")
    if schema not in EVENT_SCHEMAS:
        raise ConversionError(f"unsupported CEGAR event schema in {event_path}")
    statuses = event.get("cegar_statuses")
    if statuses not in (["UNSAT"], ["REFINEMENT_BUDGET"], ["SAT_SURVIVOR"]):
        raise ConversionError(f"unsupported CEGAR status in {event_path}")
    status = statuses[0]
    solves = event.get("solves")
    if not isinstance(solves, list) or len(solves) != 1 or not isinstance(solves[0], dict):
        raise ConversionError(f"{event_path} must contain exactly one solve")
    solve = solves[0]
    if solve.get("cegar_status") != status:
        raise ConversionError(f"{event_path} solve/event status drift")
    iterations = solve.get("iterations")
    if not isinstance(iterations, list) or not iterations:
        raise ConversionError(f"{event_path} has no iterations")
    records: list[CutRecord] = []
    event_sha256 = sha256_bytes(payload)
    for expected_index, raw_iteration in enumerate(iterations):
        if not isinstance(raw_iteration, dict) or raw_iteration.get("index") != expected_index:
            raise ConversionError(f"{event_path} iteration indices are not dense")
        solved = raw_iteration.get("solved")
        if not isinstance(solved, dict):
            raise ConversionError(f"{event_path} iteration {expected_index} lacks solve data")
        cut = raw_iteration.get("cut")
        is_last = expected_index == len(iterations) - 1
        if cut is None:
            if not is_last:
                raise ConversionError(f"{event_path} has an early cut-free iteration")
            expected_solved = "UNSAT" if status == "UNSAT" else "SAT"
            if solved.get("status") != expected_solved:
                raise ConversionError(f"{event_path} terminal solve/status drift")
            if status == "UNSAT" and solved.get("terminal_unsat") is not True:
                raise ConversionError(f"{event_path} terminal UNSAT is not durable")
            continue
        if solved.get("status") != "SAT":
            raise ConversionError(f"{event_path} learned a cut from a non-SAT solve")
        checked_cut, conflict = validate_conflict_cut(
            raw_iteration,
            event_label=event_path,
            iteration_index=expected_index,
        )
        records.append(
            CutRecord(
                checked_cut,
                {
                    "event_path": event_path,
                    "event_schema": schema,
                    "event_sha256": event_sha256,
                    "solve_index": 0,
                    "iteration_index": expected_index,
                    "cut_sha256": sha256_bytes(checked_cut.encode("ascii")),
                    "linear_conflict_kind": conflict.get("kind"),
                    "linear_conflict_sha256": sha256_bytes(canonical_json_bytes(conflict)),
                },
            )
        )
    if iterations[-1].get("cut") is not None:
        raise ConversionError(f"{event_path} has no final cut-free solve")
    closed = solve.get("closed")
    if not isinstance(closed, dict) or closed.get("solves") != len(iterations):
        raise ConversionError(f"{event_path} solve count does not match iterations")
    return event, tuple(records), status


def resolve_seed_path(repo_root: Path, raw_path: str) -> Path:
    """Resolve a seed path inside the repository without accepting path escape."""
    candidate = Path(raw_path)
    path = (repo_root / candidate).resolve() if not candidate.is_absolute() else candidate.resolve()
    try:
        path.relative_to(repo_root)
    except ValueError as exc:
        raise ConversionError(f"seed event escapes repository: {raw_path}") from exc
    return path


def seed_cut_records(
    seed_sources: object,
    *,
    repo_root: Path,
    snapshots: dict[Path, bytes],
    ancestry: frozenset[Path] = frozenset(),
) -> tuple[tuple[CutRecord, ...], tuple[dict[str, object], ...]]:
    """Reconstruct first-occurrence seed cuts and authenticate every source event."""
    if not isinstance(seed_sources, list):
        raise ConversionError("resume event has no seed source list")
    seen: set[str] = set()
    retained: list[CutRecord] = []
    reconstructed_sources: list[dict[str, object]] = []
    for raw_source in seed_sources:
        if not isinstance(raw_source, dict):
            raise ConversionError("resume event has a malformed seed source")
        raw_path = raw_source.get("path")
        expected_sha = raw_source.get("sha256")
        expected_occurrences = raw_source.get("cut_occurrences")
        if (
            not isinstance(raw_path, str)
            or not isinstance(expected_sha, str)
            or isinstance(expected_occurrences, bool)
            or not isinstance(expected_occurrences, int)
        ):
            raise ConversionError("resume event seed source fields are malformed")
        path = resolve_seed_path(repo_root, raw_path)
        if path in ancestry:
            raise ConversionError(f"cyclic seed event lineage: {raw_path}")
        payload = capture_snapshot(path, snapshots, label="seed event")
        if sha256_bytes(payload) != expected_sha:
            raise ConversionError(f"seed event digest drift: {raw_path}")
        _event, records, _status = authenticate_seed_event(
            payload,
            event_path=path,
            event_label=raw_path,
            repo_root=repo_root,
            snapshots=snapshots,
            ancestry=ancestry | {path},
        )
        if len(records) != expected_occurrences:
            raise ConversionError(f"seed cut occurrence drift: {raw_path}")
        reconstructed_sources.append(
            {
                "path": raw_path,
                "sha256": expected_sha,
                "cut_occurrences": len(records),
            }
        )
        for record in records:
            if record.assertion not in seen:
                seen.add(record.assertion)
                retained.append(record)
    return tuple(retained), tuple(reconstructed_sources)


def source_qfuf_commands() -> tuple[str, ...]:
    """Reconstruct the Boolean source-command prefix used by the CEGAR producer."""
    commands = list(base.source_commands("strict"))
    if not commands or commands[0] != "(set-logic QF_LRA)":
        raise ConversionError("source-command prelude drifted")
    commands[0] = "(set-logic QF_UF)"
    return tuple(commands)


def event_source_shape(
    event: dict[str, object],
) -> tuple[
    str,
    tuple[int, ...],
    dict[str, int],
    dict[str, tuple[int, ...]],
    tuple[str, ...],
    tuple[dict[str, object], ...],
]:
    """Reconstruct one event's orientation, pins, base commands, and bank."""
    orientation = event.get("orientation")
    if orientation not in {"direct", "mirror"}:
        raise ConversionError("event orientation is malformed")
    order = base.DIRECT_ORDER if orientation == "direct" else base.MIRROR_ORDER
    if event.get("order") != list(order):
        raise ConversionError("event order drifted from source generator")
    role_pins, row_pins = normalized_pins(event)
    base_commands, bank = boolean.build_commands(
        order,
        tuple(role_pins.items()),
        tuple(row_pins.items()),
    )
    if event.get("base_conflict_count") != len(bank):
        raise ConversionError("event base conflict count drifted")
    return orientation, order, role_pins, row_pins, base_commands, bank


def authenticate_seed_event(
    payload: bytes,
    *,
    event_path: Path,
    event_label: str,
    repo_root: Path,
    snapshots: dict[Path, bytes],
    ancestry: frozenset[Path],
) -> tuple[dict[str, object], tuple[CutRecord, ...], str]:
    """Recursively rebuild one seed event's own journal and seed lineage."""
    event, records, status = event_cut_records(payload, event_path=event_label)
    _orientation, _order, _roles, _rows, base_commands, _bank = event_source_shape(event)
    if event["schema"] == RESUME_EVENT_SCHEMA:
        seeds, sources = seed_cut_records(
            event.get("seed_sources"),
            repo_root=repo_root,
            snapshots=snapshots,
            ancestry=ancestry,
        )
        if tuple(event.get("seed_sources", ())) != sources:
            raise ConversionError(f"seed source ledger drifted: {event_label}")
        if event.get("base_command_count") != len(base_commands):
            raise ConversionError(f"base command count drifted: {event_label}")
        if event.get("seed_cut_count") != len(seeds):
            raise ConversionError(f"seed cut count drifted: {event_label}")
    else:
        seeds = ()
        if "seed_sources" in event or "seed_cut_count" in event:
            raise ConversionError(f"non-resume seed carries seed metadata: {event_label}")
    journal_commands = (*base_commands, *(record.assertion for record in seeds))
    if event.get("command_count") != len(journal_commands):
        raise ConversionError(f"command count drifted: {event_label}")
    raw_journal_path = event.get("journal")
    if not isinstance(raw_journal_path, str):
        raise ConversionError(f"seed event has no journal path: {event_label}")
    journal_path = resolve_seed_path(repo_root, raw_journal_path)
    expected = ("\n".join(journal_commands) + "\n").encode("ascii")
    journal_payload = capture_snapshot(journal_path, snapshots, label="seed journal")
    if journal_payload != expected:
        raise ConversionError(f"seed journal reconstruction drifted: {event_label}")
    if event.get("journal_sha256") != sha256_bytes(journal_payload):
        raise ConversionError(f"seed journal digest drifted: {event_label}")
    return event, records, status


def reconstruct_run(
    source_payload: bytes,
    terminal_event_payload: bytes,
    *,
    terminal_source_path: str,
    terminal_event_path: str,
    repo_root: Path,
) -> ReconstructedRun:
    """Rebuild and byte-check the base formula and recursive seed lineage."""
    event, terminal_cuts, status = event_cut_records(
        terminal_event_payload,
        event_path=terminal_event_path,
    )
    if status != "UNSAT":
        raise ConversionError("terminal CEGAR event is not UNSAT")
    source_path = resolve_seed_path(repo_root, terminal_source_path)
    event_path = resolve_seed_path(repo_root, terminal_event_path)
    snapshots: dict[Path, bytes] = {}
    if capture_snapshot(source_path, snapshots, label="terminal journal") != source_payload:
        raise ConversionError("terminal journal changed before authentication")
    if capture_snapshot(event_path, snapshots, label="terminal event") != terminal_event_payload:
        raise ConversionError("terminal event changed before authentication")
    raw_journal_path = event.get("journal")
    if not isinstance(raw_journal_path, str):
        raise ConversionError("terminal event has no journal path")
    declared_journal_path = resolve_seed_path(repo_root, raw_journal_path)
    if declared_journal_path != source_path:
        raise ConversionError("terminal event journal path differs from supplied source")
    if declared_journal_path.read_bytes() != source_payload:
        raise ConversionError("terminal event journal changed during conversion")
    orientation, order, role_pins, row_pins, base_commands, bank = event_source_shape(
        event
    )
    schema = event["schema"]
    if schema == RESUME_EVENT_SCHEMA:
        seed_cuts, seed_sources = seed_cut_records(
            event.get("seed_sources"),
            repo_root=repo_root,
            snapshots=snapshots,
            ancestry=frozenset({event_path}),
        )
        if tuple(event.get("seed_sources", ())) != seed_sources:
            raise ConversionError("terminal event seed source ledger drifted")
        if event.get("base_command_count") != len(base_commands):
            raise ConversionError("terminal event base command count drifted")
        if event.get("seed_cut_count") != len(seed_cuts):
            raise ConversionError("terminal event seed cut count drifted")
    else:
        seed_cuts = ()
        if "seed_sources" in event or "seed_cut_count" in event:
            raise ConversionError("non-resume terminal event carries seed metadata")
    journal_commands = (*base_commands, *(record.assertion for record in seed_cuts))
    if event.get("command_count") != len(journal_commands):
        raise ConversionError("terminal event command count drifted")
    expected_payload = ("\n".join(journal_commands) + "\n").encode("ascii")
    if source_payload != expected_payload:
        raise ConversionError("source journal does not match reconstructed command lineage")
    if event.get("journal_sha256") != sha256_bytes(source_payload):
        raise ConversionError("terminal event journal digest drifted")
    seen = set(journal_commands)
    for record in terminal_cuts:
        if record.assertion in seen:
            raise ConversionError("terminal event repeats a source or seed assertion")
        seen.add(record.assertion)
    return ReconstructedRun(
        event=event,
        event_sha256=sha256_bytes(terminal_event_payload),
        base_commands=base_commands,
        bank=bank,
        seed_cuts=seed_cuts,
        terminal_cuts=terminal_cuts,
        role_pins=role_pins,
        row_pins=row_pins,
        orientation=orientation,
        order=order,
        custody_snapshots=tuple(sorted(snapshots.items(), key=lambda item: str(item[0]))),
    )


def parse_assertion(
    line: str,
    numbers: dict[str, int],
    *,
    line_number: int,
) -> tuple[tuple[int, ...], str]:
    """Parse one assertion and classify its literal-clause shape."""
    positive = legacy.POSITIVE_UNIT_RE.fullmatch(line)
    negative = legacy.NEGATIVE_UNIT_RE.fullmatch(line)
    disjunction = legacy.OR_RE.fullmatch(line)
    if positive is not None:
        symbol = positive.group(1)
        if symbol not in numbers:
            raise ConversionError(f"undeclared symbol {symbol!r} on line {line_number}")
        return (numbers[symbol],), "positive_unit"
    if negative is not None:
        symbol = negative.group(1)
        if symbol not in numbers:
            raise ConversionError(f"undeclared symbol {symbol!r} on line {line_number}")
        return (-numbers[symbol],), "negative_unit"
    if disjunction is not None:
        try:
            clause = legacy._parse_or_body(disjunction.group(1), numbers, line_number)
        except legacy.ConversionError as exc:
            raise ConversionError(str(exc)) from exc
        return clause, "disjunction"
    raise ConversionError(f"unsupported assertion on line {line_number}: {line}")


def parse_journal(source_payload: bytes) -> ParsedCnf:
    """Parse an exact generated journal while retaining line and byte locations."""
    if not source_payload.endswith(b"\n") or b"\r" in source_payload:
        raise ConversionError("source journal is not LF-terminated ASCII")
    try:
        source = source_payload.decode("ascii")
    except UnicodeDecodeError as exc:
        raise ConversionError("source journal is not ASCII") from exc
    symbols: list[str] = []
    numbers: dict[str, int] = {}
    clauses: list[ParsedClause] = []
    logic_seen = False
    assertions_seen = False
    counts = {"positive_unit": 0, "negative_unit": 0, "disjunction": 0}
    offset = 0
    for command_index, raw_line in enumerate(source.splitlines(keepends=True)):
        line_number = command_index + 1
        if not raw_line.endswith("\n"):
            raise ConversionError(f"source line {line_number} lacks LF terminator")
        line = raw_line[:-1]
        byte_start = offset
        offset += len(raw_line.encode("ascii"))
        if line == "(set-logic QF_UF)":
            if logic_seen or symbols or clauses:
                raise ConversionError(f"misplaced set-logic on line {line_number}")
            logic_seen = True
            continue
        declaration = legacy.DECLARE_RE.fullmatch(line)
        if declaration is not None:
            if not logic_seen or assertions_seen:
                raise ConversionError(f"misplaced declaration on line {line_number}")
            symbol = declaration.group(1)
            if symbol in numbers:
                raise ConversionError(f"duplicate declaration {symbol!r} on line {line_number}")
            symbols.append(symbol)
            numbers[symbol] = len(symbols)
            continue
        if not logic_seen or not symbols:
            raise ConversionError(f"assertion precedes declarations on line {line_number}")
        assertions_seen = True
        literals, shape = parse_assertion(line, numbers, line_number=line_number)
        counts[shape] += 1
        clauses.append(
            ParsedClause(
                literals=literals,
                assertion=line,
                assertion_sha256=sha256_bytes(line.encode("ascii")),
                assertion_ordinal=len(clauses),
                command_index=command_index,
                line_number=line_number,
                byte_start=byte_start,
                byte_end=offset,
            )
        )
    if not logic_seen or not symbols or not clauses:
        raise ConversionError("source journal lacks logic, declarations, or clauses")
    return ParsedCnf(
        symbols=tuple(symbols),
        clauses=tuple(clauses),
        positive_units=counts["positive_unit"],
        negative_units=counts["negative_unit"],
        disjunctions=counts["disjunction"],
    )


def parse_dynamic_clause(
    assertion: str,
    numbers: dict[str, int],
    assertion_ordinal: int,
) -> ParsedClause:
    """Parse an event-resident cut without pretending it has a journal offset."""
    literals, _shape = parse_assertion(assertion, numbers, line_number=0)
    return ParsedClause(
        literals=literals,
        assertion=assertion,
        assertion_sha256=sha256_bytes(assertion.encode("ascii")),
        assertion_ordinal=assertion_ordinal,
        command_index=None,
        line_number=None,
        byte_start=None,
        byte_end=None,
    )


def source_command_origins(
    run: ReconstructedRun,
) -> tuple[dict[str, object] | None, ...]:
    """Classify every reconstructed journal command by semantic family."""
    source_count = len(source_qfuf_commands())
    bank_count = len(run.bank)
    origins: list[dict[str, object] | None] = []
    for command_index, command in enumerate(run.base_commands):
        if not command.startswith("(assert "):
            origins.append(None)
        elif command_index < source_count:
            origins.append(
                {
                    "family": "base_combinatorial",
                    "subtype": "source_command",
                    "source_command_index": command_index,
                }
            )
        elif command_index < source_count + bank_count:
            bank_index = command_index - source_count
            record = run.bank[bank_index]
            origins.append(
                {
                    "family": "base_kalmanson_nogood",
                    "subtype": "one_form_provider_conflict",
                    "conflict_bank_index": bank_index,
                    "semantic_record_sha256": sha256_bytes(canonical_json_bytes(record)),
                }
            )
        else:
            origins.append(
                {
                    "family": "base_combinatorial",
                    "subtype": "role_pin" if command.startswith("(assert is_") else "row_pin",
                    "pin_command_index": command_index - source_count - bank_count,
                }
            )
    origins.extend(
        {
            "family": "dynamic_kalmanson_nogood",
            "subtype": "seed_cut",
            **record.origin,
        }
        for record in run.seed_cuts
    )
    return tuple(origins)


def provenance_rows(
    parsed: ParsedCnf,
    run: ReconstructedRun,
) -> tuple[dict[str, object], ...]:
    """Combine journal clauses and terminal cuts into ordered provenance rows."""
    origins = source_command_origins(run)
    if len(origins) != len(run.base_commands) + len(run.seed_cuts):
        raise ConversionError("journal origin table length drifted")
    rows: list[dict[str, object]] = []
    all_clauses: list[tuple[ParsedClause, dict[str, object]]] = []
    for clause in parsed.clauses:
        if clause.command_index is None or clause.command_index >= len(origins):
            raise ConversionError("parsed clause has no reconstructed command origin")
        origin = origins[clause.command_index]
        if origin is None:
            raise ConversionError("parsed assertion maps to a non-assertion command")
        all_clauses.append((clause, origin))
    numbers = {symbol: index for index, symbol in enumerate(parsed.symbols, 1)}
    for record in run.terminal_cuts:
        clause = parse_dynamic_clause(record.assertion, numbers, len(all_clauses))
        all_clauses.append(
            (
                clause,
                {
                    "family": "dynamic_kalmanson_nogood",
                    "subtype": "terminal_event_cut",
                    **record.origin,
                },
            )
        )
    for clause_id, (clause, origin) in enumerate(all_clauses, 1):
        literal_body = " ".join(map(str, clause.literals)).encode("ascii")
        rows.append(
            {
                "schema": PROVENANCE_SCHEMA,
                "original_clause_id": clause_id,
                "literals": list(clause.literals),
                "literal_body_sha256": sha256_bytes(literal_body),
                "assertion": clause.assertion,
                "assertion_sha256": clause.assertion_sha256,
                "assertion_ordinal": clause.assertion_ordinal,
                "journal_locator": {
                    "command_index": clause.command_index,
                    "line_number": clause.line_number,
                    "byte_start": clause.byte_start,
                    "byte_end": clause.byte_end,
                },
                "origin": origin,
                "orientation": run.orientation,
                "order": list(run.order),
            }
        )
    return tuple(rows)


def render_dimacs(
    symbols: tuple[str, ...],
    rows: tuple[dict[str, object], ...],
    *,
    journal_sha256: str,
    event_sha256: str,
) -> bytes:
    """Render one DIMACS clause for every provenance row."""
    lines = [
        "c cardge13 literal QF_UF clause-preserving conversion v2",
        f"c source_journal_sha256 {journal_sha256}",
        f"c terminal_event_sha256 {event_sha256}",
        f"p cnf {len(symbols)} {len(rows)}",
    ]
    for row in rows:
        literals = row["literals"]
        if not isinstance(literals, list):
            raise ConversionError("provenance row literals are malformed")
        lines.append(" ".join(map(str, literals)) + " 0")
    return ("\n".join(lines) + "\n").encode("ascii")


def artifact_record(path: Path) -> dict[str, object]:
    """Describe one emitted artifact."""
    return {"path": str(path), "sha256": sha256_file(path), "byte_count": path.stat().st_size}


def payload_record(path: Path, payload: bytes) -> dict[str, object]:
    """Describe the captured bytes actually consumed by this conversion."""
    return {
        "path": str(path),
        "sha256": sha256_bytes(payload),
        "byte_count": len(payload),
    }


def stage_artifact(target: Path, chunks: Iterable[bytes]) -> StagedArtifact:
    """Write and fsync one sibling temporary artifact without publishing it."""
    target.parent.mkdir(parents=True, exist_ok=True)
    descriptor, raw_temporary = tempfile.mkstemp(
        dir=target.parent,
        prefix=f".{target.name}.",
        suffix=".tmp",
    )
    temporary = Path(raw_temporary)
    digest = hashlib.sha256()
    byte_count = 0
    try:
        with os.fdopen(descriptor, "wb") as stream:
            for chunk in chunks:
                if not isinstance(chunk, bytes):
                    raise TypeError("artifact chunk is not bytes")
                stream.write(chunk)
                digest.update(chunk)
                byte_count += len(chunk)
            stream.flush()
            os.fsync(stream.fileno())
    except BaseException:
        temporary.unlink(missing_ok=True)
        raise
    return StagedArtifact(temporary, target, digest.hexdigest(), byte_count)


def discard_staged_artifacts(
    staged: Iterable[StagedArtifact], published: Iterable[StagedArtifact]
) -> None:
    """Remove only temporary files and links created by this publication attempt."""
    for artifact in reversed(tuple(published)):
        try:
            if (
                artifact.target.exists()
                and artifact.temporary.exists()
                and os.path.samefile(artifact.target, artifact.temporary)
            ):
                artifact.target.unlink()
        except OSError:
            pass
    for artifact in staged:
        artifact.temporary.unlink(missing_ok=True)


def publish_staged_artifacts(staged: Iterable[StagedArtifact]) -> None:
    """Publish prepared artifacts without overwriting any concurrent output."""
    prepared = tuple(staged)
    published: list[StagedArtifact] = []
    try:
        for artifact in prepared:
            os.link(artifact.temporary, artifact.target)
            published.append(artifact)
    except BaseException:
        discard_staged_artifacts(prepared, published)
        raise
    for artifact in prepared:
        artifact.temporary.unlink()


def fsync_directory(path: Path) -> None:
    """Persist one directory entry set before or after atomic publication."""
    descriptor = os.open(path, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def rename_directory_exclusive(source: Path, target: Path) -> None:
    """Atomically publish a directory without replacing a concurrent target."""
    libc = ctypes.CDLL(None, use_errno=True)
    encoded_source = os.fsencode(source)
    encoded_target = os.fsencode(target)
    if sys.platform == "darwin":
        renamex = libc.renamex_np
        renamex.argtypes = [ctypes.c_char_p, ctypes.c_char_p, ctypes.c_uint]
        renamex.restype = ctypes.c_int
        result = renamex(encoded_source, encoded_target, 0x00000004)
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
        result = renameat2(-100, encoded_source, -100, encoded_target, 0x00000001)
    else:
        raise ConversionError("atomic no-replace directory publication is unavailable")
    if result != 0:
        error_number = ctypes.get_errno()
        raise OSError(error_number, os.strerror(error_number), str(target))


def execute_module_snapshot(name: str, path: Path, payload: bytes) -> types.ModuleType:
    """Execute one module directly from the source bytes recorded for custody."""
    module = types.ModuleType(name)
    module.__file__ = str(path)
    module.__package__ = ""
    sys.modules[name] = module
    exec(  # noqa: S102 - custody requires executing the captured source bytes
        compile(payload, str(path), "exec"), module.__dict__
    )
    return module


def generator_snapshots() -> tuple[tuple[Path, bytes], ...]:
    """Capture and execute the exact source-reconstruction dependency bytes."""
    global boolean, base, sliced, tight, legacy
    names_and_paths = (
        (tight.__name__, Path(tight.__file__).resolve()),
        (base.__name__, Path(base.__file__).resolve()),
        (sliced.__name__, Path(sliced.__file__).resolve()),
        (boolean.__name__, Path(boolean.__file__).resolve()),
        (legacy.__name__, Path(legacy.__file__).resolve()),
    )
    captured = {name: (path, path.read_bytes()) for name, path in names_and_paths}
    previous = {name: sys.modules.get(name) for name, _path in names_and_paths}
    try:
        loaded = {
            name: execute_module_snapshot(name, *captured[name])
            for name, _path in names_and_paths
        }
    except BaseException:
        for name, module in previous.items():
            if module is None:
                sys.modules.pop(name, None)
            else:
                sys.modules[name] = module
        raise
    tight = loaded[tight.__name__]
    base = loaded[base.__name__]
    sliced = loaded[sliced.__name__]
    boolean = loaded[boolean.__name__]
    legacy = loaded[legacy.__name__]
    ordered_paths = (
        Path(__file__).resolve(),
        Path(boolean.__file__).resolve(),
        Path(base.__file__).resolve(),
        Path(sliced.__file__).resolve(),
        Path(tight.__file__).resolve(),
        Path(legacy.__file__).resolve(),
    )
    own_path = ordered_paths[0]
    return ((own_path, own_path.read_bytes()),) + tuple(
        (path, captured[name][1])
        for name, path in (
            (boolean.__name__, ordered_paths[1]),
            (base.__name__, ordered_paths[2]),
            (sliced.__name__, ordered_paths[3]),
            (tight.__name__, ordered_paths[4]),
            (legacy.__name__, ordered_paths[5]),
        )
    )


def generator_records(
    snapshots: Iterable[tuple[Path, bytes]],
) -> tuple[dict[str, object], ...]:
    """Bind each generator path to the source bytes captured before conversion."""
    return tuple(payload_record(path, payload) for path, payload in snapshots)


def assert_payloads_unchanged(
    snapshots: Iterable[tuple[Path, bytes]], *, label: str
) -> None:
    """Reject a concurrent mutation before publishing snapshot-bound artifacts."""
    for path, payload in snapshots:
        if path.read_bytes() != payload:
            raise ConversionError(f"{label} changed during conversion: {path}")


def convert(
    *,
    source_path: Path,
    event_path: Path,
    output_cnf_path: Path,
    output_manifest_path: Path,
    output_provenance_path: Path,
    repo_root: Path,
) -> dict[str, object]:
    """Authenticate a terminal run and emit DIMACS, provenance, and manifest."""
    outputs = (output_cnf_path, output_manifest_path, output_provenance_path)
    output_parents = {path.parent.resolve() for path in outputs}
    if len(output_parents) != 1:
        raise ConversionError("all outputs must share one publication directory")
    if len({path.name for path in outputs}) != len(outputs):
        raise ConversionError("output filenames must be distinct")
    output_root = output_parents.pop()
    if output_root.exists():
        raise ConversionError(f"refusing to overwrite output directory: {output_root}")
    output_root.parent.mkdir(parents=True, exist_ok=True)
    repo_root = repo_root.resolve()
    captured_generators = generator_snapshots()
    source_payload = source_path.read_bytes()
    event_payload = event_path.read_bytes()
    run = reconstruct_run(
        source_payload,
        event_payload,
        terminal_source_path=str(source_path),
        terminal_event_path=str(event_path),
        repo_root=repo_root,
    )
    parsed = parse_journal(source_payload)
    rows = provenance_rows(parsed, run)
    dimacs = render_dimacs(
        parsed.symbols,
        rows,
        journal_sha256=sha256_bytes(source_payload),
        event_sha256=run.event_sha256,
    )
    family_counts: dict[str, int] = {}
    for row in rows:
        origin = row["origin"]
        if not isinstance(origin, dict) or not isinstance(origin.get("family"), str):
            raise ConversionError("provenance row origin is malformed")
        family = origin["family"]
        family_counts[family] = family_counts.get(family, 0) + 1

    staging_root = Path(
        tempfile.mkdtemp(
            dir=output_root.parent,
            prefix=f".{output_root.name}.",
            suffix=".tmp",
        )
    )
    staged: list[StagedArtifact] = []
    try:
        cnf_artifact = stage_artifact(staging_root / output_cnf_path.name, (dimacs,))
        staged.append(cnf_artifact)
        provenance_artifact = stage_artifact(
            staging_root / output_provenance_path.name,
            (canonical_json_bytes(row) + b"\n" for row in rows),
        )
        staged.append(provenance_artifact)
        unsigned: dict[str, object] = {
            "schema": SCHEMA,
            "source_journal": payload_record(source_path, source_payload),
            "terminal_event": payload_record(event_path, event_payload),
            "orientation": run.orientation,
            "order": list(run.order),
            "role_pins": run.role_pins,
            "row_pins": {name: list(support) for name, support in run.row_pins.items()},
            "seed_event_sources": run.event.get("seed_sources", []),
            "seed_cut_count": len(run.seed_cuts),
            "terminal_cut_count": len(run.terminal_cuts),
            "recursive_custody": [
                payload_record(path, payload) for path, payload in run.custody_snapshots
            ],
            "dimacs": {
                "path": str(output_cnf_path),
                "sha256": cnf_artifact.sha256,
                "byte_count": cnf_artifact.byte_count,
                "variable_count": len(parsed.symbols),
                "clause_count": len(rows),
            },
            "clause_provenance": {
                "path": str(output_provenance_path),
                "sha256": provenance_artifact.sha256,
                "byte_count": provenance_artifact.byte_count,
            },
            "clause_family_counts": family_counts,
            "generator_execution": "captured-source-compile-exec/v1",
            "assertion_classes": {
                "positive_units": parsed.positive_units,
                "negative_units": parsed.negative_units,
                "disjunctions_in_journal": parsed.disjunctions,
                "terminal_disjunctions": len(run.terminal_cuts),
            },
            "variables": [
                {"dimacs": index, "symbol": symbol}
                for index, symbol in enumerate(parsed.symbols, 1)
            ],
            "generators": generator_records(captured_generators),
        }
        manifest = {
            **unsigned,
            "manifest_sha256": sha256_bytes(canonical_json_bytes(unsigned)),
        }
        manifest_artifact = stage_artifact(
            staging_root / output_manifest_path.name,
            (json.dumps(manifest, indent=2, sort_keys=True).encode() + b"\n",),
        )
        staged.append(manifest_artifact)
        assert_payloads_unchanged(run.custody_snapshots, label="input")
        assert_payloads_unchanged(captured_generators, label="generator")
        publish_staged_artifacts(staged)
        fsync_directory(staging_root)
        rename_directory_exclusive(staging_root, output_root)
        fsync_directory(output_root.parent)
    except BaseException:
        discard_staged_artifacts(staged, ())
        if staging_root.exists():
            shutil.rmtree(staging_root)
        raise
    return manifest


def main() -> int:
    """Run the source-reconstructing clause-provenance converter."""
    parser = argparse.ArgumentParser()
    parser.add_argument("source", type=Path)
    parser.add_argument("--event", type=Path, required=True)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--out-cnf", type=Path, required=True)
    parser.add_argument("--out-manifest", type=Path, required=True)
    parser.add_argument("--out-provenance", type=Path, required=True)
    args = parser.parse_args()
    manifest = convert(
        source_path=args.source,
        event_path=args.event,
        output_cnf_path=args.out_cnf,
        output_manifest_path=args.out_manifest,
        output_provenance_path=args.out_provenance,
        repo_root=args.repo_root,
    )
    print(
        json.dumps(
            {
                "clauses": manifest["dimacs"]["clause_count"],
                "cnf_sha256": manifest["dimacs"]["sha256"],
                "family_counts": manifest["clause_family_counts"],
                "manifest_sha256": manifest["manifest_sha256"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
