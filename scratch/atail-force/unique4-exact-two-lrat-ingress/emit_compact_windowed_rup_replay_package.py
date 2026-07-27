#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Emit deterministic compact Lean replay modules for a windowed RUP package."""

from __future__ import annotations

import argparse
import base64
import copy
import hashlib
import json
from pathlib import Path
import shutil
import sys
import tempfile
from typing import Any

import materialize_checkpointed_rup as base
import materialize_windowed_rup


SCHEMA = "p97-windowed-rup-compact-lean-replay-v2"
MANIFEST_NAME = "compact-replay-manifest.json"
MODULE_NAMESPACE = "CompactWindowedRupReplay"
U64_MAX = (1 << 64) - 1
EXPECTED_TRUST_AXIOMS = [
    "propext",
    "Classical.choice",
    "Quot.sound",
    "Lean.ofReduceBool",
    "Lean.trustCompiler",
]
EPISTEMIC_STATUS = (
    "STRUCTURALLY VERIFIED COMPACT REPLAY PACKAGE; "
    "LEAN BUILD AND AXIOM AUDIT REQUIRED"
)
TRUST_AUDIT_STATUS = "NOT_AUDITED"
TRUST_CLAIM = (
    "Generated window proofs use native_decide and therefore explicitly "
    "include Lean.trustCompiler; no compiler-independent trust is claimed."
)
FORBIDDEN_GENERATED_TOKENS = (
    "axiom",
    "sorry",
    "admit",
    "implemented_by",
)


FormulaSemantic = tuple[int, tuple[tuple[int, ...], ...]]
ActionSemantic = tuple[str, tuple[int, ...], tuple[int, ...]]


class CompactReplayPackageError(RuntimeError):
    """The compact replay package is malformed or cannot be emitted safely."""


def _canonical_json(payload: object) -> bytes:
    return json.dumps(
        payload, separators=(",", ":"), sort_keys=True
    ).encode("utf-8")


def compute_compact_replay_package_digest(
    payload: dict[str, Any],
) -> str:
    """Hash all relocation-stable manifest content except the digest itself."""

    digest_payload = copy.deepcopy(payload)
    digest_payload.pop("compact_replay_package_sha256", None)
    return hashlib.sha256(_canonical_json(digest_payload)).hexdigest()


def _sha256_bytes(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as source:
        while block := source.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def _safe_relative(value: object, *, label: str) -> Path:
    relative = Path(str(value))
    if (
        not relative.parts
        or relative.is_absolute()
        or ".." in relative.parts
        or relative == Path(".")
    ):
        raise CompactReplayPackageError(
            f"unsafe {label} path: {relative}"
        )
    return relative


def _source_record(path: Path, *, relative: str) -> dict[str, Any]:
    return {
        "path": relative,
        "byte_count": path.stat().st_size,
        "sha256": _sha256(path),
    }


def _lean_source_record(source: str, *, path: str) -> dict[str, Any]:
    encoded = source.encode("utf-8")
    return {
        "path": path,
        "byte_count": len(encoded),
        "sha256": _sha256_bytes(encoded),
    }


def _assert_safe_generated_source(source: str, *, label: str) -> None:
    lowered = source.lower()
    for token in FORBIDDEN_GENERATED_TOKENS:
        if token in lowered:
            raise CompactReplayPackageError(
                f"generated {label} contains forbidden token {token}"
            )


def _encode_uvarint(value: int) -> bytes:
    if value < 0 or value > U64_MAX:
        raise CompactReplayPackageError(
            f"unsigned integer is outside the canonical u64 range: {value}"
        )
    output = bytearray()
    while value >= 128:
        output.append((value & 0x7F) | 0x80)
        value >>= 7
    output.append(value)
    return bytes(output)


def _encode_zigzag(value: int) -> bytes:
    encoded = 2 * value if value >= 0 else -2 * value - 1
    return _encode_uvarint(encoded)


def _encode_ascii85(payload: bytes) -> str:
    """Encode raw bytes with the checker's strict canonical ASCII85 dialect."""

    output: list[str] = []
    for position in range(0, len(payload), 4):
        chunk = payload[position : position + 4]
        group_length = len(chunk) + 1
        word = int.from_bytes(chunk.ljust(4, b"\0"), "big")
        digits = [0] * 5
        for index in range(4, -1, -1):
            digits[index] = word % 85
            word //= 85
        output.extend(chr(digit + 33) for digit in digits[:group_length])
    encoded = "".join(output)
    if any(not 33 <= ord(character) <= 117 for character in encoded):
        raise AssertionError("strict ASCII85 encoder emitted an invalid byte")
    return encoded


def _decode_ascii85_independent(text: str) -> bytes:
    """Decode with Python's independent implementation and enforce canonicality."""

    try:
        encoded = text.encode("ascii")
    except UnicodeEncodeError as exc:
        raise CompactReplayPackageError(
            "compact payload is not ASCII"
        ) from exc
    if any(value < 33 or value > 117 for value in encoded):
        raise CompactReplayPackageError(
            "compact payload contains a character outside !..u"
        )
    if len(encoded) % 5 == 1:
        raise CompactReplayPackageError(
            "compact payload has a one-character final ASCII85 group"
        )
    try:
        decoded = base64.a85decode(
            encoded, adobe=False, foldspaces=False, ignorechars=b""
        )
    except (ValueError, TypeError) as exc:
        raise CompactReplayPackageError(
            "compact payload is not strict ASCII85"
        ) from exc
    canonical = base64.a85encode(
        decoded, adobe=False, foldspaces=False, wrapcol=0, pad=False
    )
    if canonical != encoded:
        raise CompactReplayPackageError(
            "compact payload has a noncanonical final ASCII85 group"
        )
    return decoded


def _read_uvarint_independent(
    payload: bytes, position: int
) -> tuple[int, int]:
    value = 0
    shift = 0
    for used in range(10):
        if position >= len(payload):
            raise CompactReplayPackageError("truncated compact uvarint")
        raw = payload[position]
        position += 1
        digit = raw & 0x7F
        if used == 9 and digit > 1:
            raise CompactReplayPackageError("compact uvarint overflows u64")
        value |= digit << shift
        if raw < 128:
            if used > 0 and digit == 0:
                raise CompactReplayPackageError(
                    "compact uvarint is not minimally encoded"
                )
            return value, position
        shift += 7
    raise CompactReplayPackageError("compact uvarint exceeds ten bytes")


def _read_zigzag_independent(
    payload: bytes, position: int
) -> tuple[int, int]:
    encoded, position = _read_uvarint_independent(payload, position)
    if encoded % 2 == 0:
        return encoded // 2, position
    return -(encoded // 2) - 1, position


def _validate_clause(
    clause: tuple[int, ...], *, variable_count: int, label: str
) -> None:
    variables: set[int] = set()
    for literal in clause:
        variable = abs(literal)
        if literal == 0 or variable > variable_count:
            raise CompactReplayPackageError(
                f"{label} contains zero or an out-of-range literal"
            )
        if variable in variables:
            raise CompactReplayPackageError(
                f"{label} repeats variable {variable}"
            )
        variables.add(variable)


def _formula_json(formula: FormulaSemantic) -> dict[str, Any]:
    variable_count, clauses = formula
    return {
        "variable_count": variable_count,
        "clauses": [list(clause) for clause in clauses],
    }


def _actions_json(actions: tuple[ActionSemantic, ...]) -> dict[str, Any]:
    records: list[dict[str, Any]] = []
    for tag, first, second in actions:
        if tag == "add":
            records.append(
                {
                    "tag": "add",
                    "clause": list(first),
                    "hints": list(second),
                }
            )
        else:
            records.append({"tag": "del", "ids": list(first)})
    return {"actions": records}


def _semantic_sha256(kind: str, semantic: object) -> str:
    if kind == "formula":
        payload = _formula_json(semantic)  # type: ignore[arg-type]
    else:
        payload = _actions_json(semantic)  # type: ignore[arg-type]
    return _sha256_bytes(_canonical_json(payload))


def _encode_formula(formula: FormulaSemantic) -> bytes:
    variable_count, clauses = formula
    if variable_count <= 0:
        raise CompactReplayPackageError(
            "formula variable count must be positive"
        )
    output = bytearray(b"CPF1")
    output.extend(_encode_uvarint(variable_count))
    output.extend(_encode_uvarint(len(clauses)))
    for index, clause in enumerate(clauses, 1):
        _validate_clause(
            clause,
            variable_count=variable_count,
            label=f"formula clause {index}",
        )
        output.extend(_encode_uvarint(len(clause)))
        for literal in clause:
            output.extend(_encode_zigzag(literal))
    return bytes(output)


def _decode_formula_independent(text: str) -> FormulaSemantic:
    payload = _decode_ascii85_independent(text)
    if not payload.startswith(b"CPF1"):
        raise CompactReplayPackageError("compact formula has wrong magic")
    position = 4
    variable_count, position = _read_uvarint_independent(payload, position)
    clause_count, position = _read_uvarint_independent(payload, position)
    clauses: list[tuple[int, ...]] = []
    for clause_index in range(1, clause_count + 1):
        literal_count, position = _read_uvarint_independent(
            payload, position
        )
        clause: list[int] = []
        for _ in range(literal_count):
            literal, position = _read_zigzag_independent(payload, position)
            clause.append(literal)
        clause_tuple = tuple(clause)
        _validate_clause(
            clause_tuple,
            variable_count=variable_count,
            label=f"decoded formula clause {clause_index}",
        )
        clauses.append(clause_tuple)
    if position != len(payload):
        raise CompactReplayPackageError(
            "compact formula has trailing bytes"
        )
    return variable_count, tuple(clauses)


def _encode_actions(actions: tuple[ActionSemantic, ...]) -> bytes:
    output = bytearray(b"CPA1")
    output.extend(_encode_uvarint(len(actions)))
    for tag, first, second in actions:
        if tag == "add":
            output.append(0)
            output.extend(_encode_uvarint(len(first)))
            for literal in first:
                output.extend(_encode_zigzag(literal))
            output.extend(_encode_uvarint(len(second)))
            for hint in second:
                if hint <= 0:
                    raise CompactReplayPackageError(
                        "compact RUP hint must be positive"
                    )
                output.extend(_encode_uvarint(hint))
        elif tag == "del":
            output.append(1)
            output.extend(_encode_uvarint(len(first)))
            for clause_id in first:
                if clause_id <= 0:
                    raise CompactReplayPackageError(
                        "compact deletion id must be positive"
                    )
                output.extend(_encode_uvarint(clause_id))
        else:
            raise CompactReplayPackageError(
                f"unsupported compact action tag: {tag!r}"
            )
    return bytes(output)


def _decode_actions_independent(
    text: str, *, variable_count: int
) -> tuple[ActionSemantic, ...]:
    payload = _decode_ascii85_independent(text)
    if not payload.startswith(b"CPA1"):
        raise CompactReplayPackageError("compact actions have wrong magic")
    position = 4
    action_count, position = _read_uvarint_independent(payload, position)
    actions: list[ActionSemantic] = []
    for action_index in range(1, action_count + 1):
        if position >= len(payload):
            raise CompactReplayPackageError("truncated compact action")
        tag = payload[position]
        position += 1
        count, position = _read_uvarint_independent(payload, position)
        if tag == 0:
            clause: list[int] = []
            for _ in range(count):
                literal, position = _read_zigzag_independent(
                    payload, position
                )
                clause.append(literal)
            clause_tuple = tuple(clause)
            _validate_clause(
                clause_tuple,
                variable_count=variable_count,
                label=f"decoded action {action_index}",
            )
            hint_count, position = _read_uvarint_independent(
                payload, position
            )
            hints: list[int] = []
            for _ in range(hint_count):
                hint, position = _read_uvarint_independent(
                    payload, position
                )
                if hint == 0:
                    raise CompactReplayPackageError(
                        "decoded compact RUP hint is zero"
                    )
                hints.append(hint)
            actions.append(("add", clause_tuple, tuple(hints)))
        elif tag == 1:
            deleted: list[int] = []
            for _ in range(count):
                clause_id, position = _read_uvarint_independent(
                    payload, position
                )
                if clause_id == 0:
                    raise CompactReplayPackageError(
                        "decoded compact deletion id is zero"
                    )
                deleted.append(clause_id)
            actions.append(("del", tuple(deleted), ()))
        else:
            raise CompactReplayPackageError(
                f"unsupported compact action tag: {tag}"
            )
    if position != len(payload):
        raise CompactReplayPackageError(
            "compact action stream has trailing bytes"
        )
    return tuple(actions)


def _load_formula(path: Path) -> FormulaSemantic:
    cnf = base.parse_dimacs(path)
    formula = cnf.variable_count, cnf.clauses
    _encode_formula(formula)
    return formula


def _load_actions(
    path: Path,
    *,
    variable_count: int,
    start_clause_count: int,
) -> tuple[ActionSemantic, ...]:
    actions: list[ActionSemantic] = []
    next_addition_id = start_clause_count + 1
    with path.open("rb") as source:
        for line_number, raw_line in enumerate(source, 1):
            if not raw_line.endswith(b"\n") or b"\r" in raw_line:
                raise CompactReplayPackageError(
                    f"action line {line_number} is not LF-terminated ASCII"
                )
            try:
                line = raw_line.decode("ascii")
            except UnicodeDecodeError as exc:
                raise CompactReplayPackageError(
                    f"non-ASCII action line {line_number}"
                ) from exc
            fields = line.split()
            if len(fields) < 2:
                raise CompactReplayPackageError(
                    f"blank or malformed action line {line_number}"
                )
            try:
                if fields[1] == "d":
                    action_id, deleted = base.parse_deletion(
                        fields, line_number=line_number
                    )
                    if action_id != 1:
                        raise CompactReplayPackageError(
                            "deletion action id is not canonical"
                        )
                    if line[:-1] != base.format_deletion(deleted):
                        raise CompactReplayPackageError(
                            "deletion spelling is not canonical"
                        )
                    actions.append(("del", tuple(deleted), ()))
                else:
                    action_id, clause, hints = base.parse_addition(
                        fields,
                        line_number=line_number,
                        variable_count=variable_count,
                    )
                    if action_id != next_addition_id:
                        raise CompactReplayPackageError(
                            "unsupported sparse addition ids: "
                            f"expected {next_addition_id}, got {action_id}"
                        )
                    if line[:-1] != base.format_addition(
                        action_id, clause, hints
                    ):
                        raise CompactReplayPackageError(
                            "addition spelling is not canonical pure RUP"
                        )
                    _validate_clause(
                        clause,
                        variable_count=variable_count,
                        label=f"addition {action_id}",
                    )
                    actions.append(
                        ("add", clause, tuple(hints))
                    )
                    next_addition_id += 1
            except base.MaterializationError as exc:
                raise CompactReplayPackageError(
                    "unsupported RAT or malformed action on line "
                    f"{line_number}: {exc}"
                ) from exc
    return tuple(actions)


def _validate_window_layout(
    payload: dict[str, Any],
) -> tuple[list[dict[str, Any]], list[dict[str, Any]], set[int]]:
    windows = payload.get("windows")
    if not isinstance(windows, dict):
        raise CompactReplayPackageError(
            "verified package has no windows object"
        )
    shards: list[list[dict[str, Any]]] = []
    consumed: set[int] = set()
    previous_end: int | None = None
    for shard in (1, 2):
        records = windows.get(f"shard_{shard}")
        if not isinstance(records, list) or not records:
            raise CompactReplayPackageError(
                f"verified package has no shard_{shard}"
            )
        for expected_index, record in enumerate(records, 1):
            if int(record.get("index", -1)) != expected_index:
                raise CompactReplayPackageError(
                    f"non-dense shard_{shard} window index"
                )
            start = int(record["start_checkpoint"])
            finish = int(record["end_checkpoint"])
            if finish != start + 1:
                raise CompactReplayPackageError(
                    f"shard_{shard} window {expected_index} skips checkpoints"
                )
            if previous_end is not None and start != previous_end:
                raise CompactReplayPackageError(
                    f"shard_{shard} window {expected_index} breaks the chain"
                )
            consumed.add(start)
            if record["role"] == "rebase":
                consumed.add(finish)
            previous_end = finish
        shards.append(records)
    return shards[0], shards[1], consumed


def _common_module(n: int) -> str:
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Certificate.CheckpointedRupCompactBoundary

namespace {MODULE_NAMESPACE}

/-- One larger than the DIMACS variable count. -/
abbrev n : Nat := {n}

end {MODULE_NAMESPACE}
"""


def _checkpoint_module(index: int, payload_path: str) -> str:
    name = f"C{index:04d}"
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import {MODULE_NAMESPACE}.Common

namespace {MODULE_NAMESPACE}.Checkpoint.{name}

/-- Canonical compact text for checkpoint {index}. -/
def text : String :=
  include_str "../../{payload_path}"

end {MODULE_NAMESPACE}.Checkpoint.{name}
"""


def _window_module(
    shard: int,
    record: dict[str, Any],
    *,
    action_payload_path: str,
) -> str:
    index = int(record["index"])
    role = str(record["role"])
    start = int(record["start_checkpoint"])
    finish = int(record["end_checkpoint"])
    window_name = f"W{index:04d}"
    start_name = f"C{start:04d}"
    finish_name = f"C{finish:04d}"
    imports = [
        f"import {MODULE_NAMESPACE}.Checkpoint.{start_name}",
    ]
    if role == "rebase":
        imports.append(
            f"import {MODULE_NAMESPACE}.Checkpoint.{finish_name}"
        )
    elif role != "terminal":
        raise CompactReplayPackageError(
            f"unsupported role for shard {shard} window {index}: {role}"
        )
    if role == "rebase":
        accepted_type = f"""\
    checkRebaseCompact (n := n)
      Checkpoint.{start_name}.text actionText
      Checkpoint.{finish_name}.text = true"""
        unfold_names = (
            f"n Checkpoint.{start_name}.text actionText "
            f"Checkpoint.{finish_name}.text"
        )
        sound_type = f"""\
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.{start_name}.text)
      (formulaOfCompact (n := n) Checkpoint.{finish_name}.text)"""
        sound_value = "  checkRebaseCompact_sound_of_compact accepted"
    else:
        accepted_type = f"""\
    checkTerminalCompact (n := n)
      Checkpoint.{start_name}.text actionText = true"""
        unfold_names = f"n Checkpoint.{start_name}.text actionText"
        sound_type = f"""\
    Unsatisfiable (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.{start_name}.text)"""
        sound_value = "  checkTerminalCompact_sound_of_compact accepted"
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
{chr(10).join(imports)}

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace {MODULE_NAMESPACE}.Shard{shard}.{window_name}

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../{action_payload_path}"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
{accepted_type} := by
  unfold {unfold_names}
  native_decide

theorem sound :
{sound_type} :=
{sound_value}

end {MODULE_NAMESPACE}.Shard{shard}.{window_name}
"""


def _rebase_type(start: int, finish: int) -> str:
    return f"""\
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C{start:04d}.text)
      (formulaOfCompact (n := n) Checkpoint.C{finish:04d}.text)"""


def _unsat_type(start: int) -> str:
    return f"""\
    Unsatisfiable (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C{start:04d}.text)"""


def _shard_module(shard: int, records: list[dict[str, Any]]) -> str:
    if not records:
        raise CompactReplayPackageError(f"shard_{shard} has no windows")
    imports = [
        f"import {MODULE_NAMESPACE}.Shard{shard}.W{int(r['index']):04d}"
        for r in records
    ]
    lines = [
        "/-",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Authors: Adam McKenna",
        "-/",
        *imports,
        "",
        "open Std.Sat",
        "open Std.Tactic.BVDecide.LRAT.Internal",
        "",
        f"namespace {MODULE_NAMESPACE}.Shard{shard}",
        "",
        "open Problem97.CheckpointedRup.CompactBoundary",
        "",
    ]
    first_start = int(records[0]["start_checkpoint"])
    if shard == 1:
        if any(record["role"] != "rebase" for record in records):
            raise CompactReplayPackageError(
                "shard_1 must contain only rebase windows"
            )
        previous_name = ""
        for offset, record in enumerate(records):
            index = int(record["index"])
            finish = int(record["end_checkpoint"])
            theorem_name = f"throughW{index:04d}"
            lines.extend(
                [
                    f"theorem {theorem_name} :",
                    _rebase_type(first_start, finish) + " :=",
                ]
            )
            if offset == 0:
                lines.append(f"  W{index:04d}.sound")
            else:
                lines.append(
                    "  composeRebaseCompact "
                    f"{previous_name} W{index:04d}.sound"
                )
            lines.append("")
            previous_name = theorem_name
        final_finish = int(records[-1]["end_checkpoint"])
        lines.extend(
            [
                "theorem sound :",
                _rebase_type(first_start, final_finish) + " :=",
                f"  {previous_name}",
            ]
        )
    else:
        if records[-1]["role"] != "terminal":
            raise CompactReplayPackageError(
                "the final shard_2 window must be terminal"
            )
        if any(record["role"] != "rebase" for record in records[:-1]):
            raise CompactReplayPackageError(
                "only the final shard_2 window may be terminal"
            )
        rebase_records = records[:-1]
        terminal_index = int(records[-1]["index"])
        previous_name = ""
        for offset, record in enumerate(rebase_records):
            index = int(record["index"])
            finish = int(record["end_checkpoint"])
            theorem_name = f"throughW{index:04d}"
            lines.extend(
                [
                    f"theorem {theorem_name} :",
                    _rebase_type(first_start, finish) + " :=",
                ]
            )
            if offset == 0:
                lines.append(f"  W{index:04d}.sound")
            else:
                lines.append(
                    "  composeRebaseCompact "
                    f"{previous_name} W{index:04d}.sound"
                )
            lines.append("")
            previous_name = theorem_name
        lines.extend(["theorem sound :", _unsat_type(first_start) + " :="])
        if rebase_records:
            lines.append(
                "  closeRebaseCompact "
                f"{previous_name} W{terminal_index:04d}.sound"
            )
        else:
            lines.append(f"  W{terminal_index:04d}.sound")
    lines.extend(["", f"end {MODULE_NAMESPACE}.Shard{shard}", ""])
    return "\n".join(lines)


def _compose_module(shard_1_start: int) -> str:
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import {MODULE_NAMESPACE}.Shard1
import {MODULE_NAMESPACE}.Shard2

open Std.Sat
open Std.Tactic.BVDecide.LRAT.Internal

namespace {MODULE_NAMESPACE}

open Problem97.CheckpointedRup.CompactBoundary

theorem startUnsatisfiable :
{_unsat_type(shard_1_start)} :=
  closeRebaseCompact Shard1.sound Shard2.sound

end {MODULE_NAMESPACE}
"""


def _store_payload(
    stage: Path,
    payloads: dict[str, dict[str, Any]],
    *,
    kind: str,
    binary: bytes,
    semantic_sha256: str,
) -> dict[str, Any]:
    text = _encode_ascii85(binary)
    encoded = text.encode("ascii")
    emitted_sha256 = _sha256_bytes(encoded)
    extension = "cpf85" if kind == "formula" else "cpa85"
    directory = "formulas" if kind == "formula" else "actions"
    relative = f"data/{directory}/{emitted_sha256}.{extension}"
    record = {
        "kind": kind,
        "path": relative,
        "byte_count": len(encoded),
        "sha256": emitted_sha256,
        "binary_byte_count": len(binary),
        "binary_sha256": _sha256_bytes(binary),
        "semantic_sha256": semantic_sha256,
    }
    previous = payloads.get(relative)
    if previous is not None:
        if previous != record:
            raise CompactReplayPackageError(
                f"content-address collision at {relative}"
            )
        return record
    target = stage / relative
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(encoded)
    payloads[relative] = record
    return record


def _object_record(
    *,
    kind: str,
    identity: str,
    source: dict[str, Any],
    emitted: dict[str, Any],
    counts: dict[str, int],
) -> dict[str, Any]:
    return {
        "kind": kind,
        "identity": identity,
        "source": source,
        "emitted": copy.deepcopy(emitted),
        "semantic_sha256": emitted["semantic_sha256"],
        "counts": counts,
    }


def emit(package_dir: Path, output_dir: Path) -> dict[str, Any]:
    """Verify once, then atomically emit the compact Lean replay package."""

    package_dir = package_dir.resolve()
    output_dir = output_dir.resolve()
    if output_dir.exists():
        raise CompactReplayPackageError(
            f"refusing to overwrite existing replay output: {output_dir}"
        )
    payload = materialize_windowed_rup.verify_windowed_package(package_dir)
    shard_1, shard_2, consumed_checkpoints = _validate_window_layout(
        payload
    )
    counts = payload.get("counts")
    checkpoints = payload.get("checkpoints")
    if not isinstance(counts, dict) or not isinstance(checkpoints, list):
        raise CompactReplayPackageError(
            "verified package is missing counts or checkpoints"
        )
    variable_count = int(counts["variable_count"])
    if variable_count <= 0:
        raise CompactReplayPackageError(
            "variable_count must be positive"
        )
    n = variable_count + 1
    if max(consumed_checkpoints) >= len(checkpoints):
        raise CompactReplayPackageError(
            "window references a missing checkpoint"
        )

    output_dir.parent.mkdir(parents=True, exist_ok=True)
    stage = Path(
        tempfile.mkdtemp(
            prefix=f".{output_dir.name}.stage-", dir=output_dir.parent
        )
    )
    try:
        payload_records: dict[str, dict[str, Any]] = {}
        objects: list[dict[str, Any]] = []
        checkpoint_payloads: dict[int, str] = {}
        total_actions = 0
        total_additions = 0
        total_deletions = 0
        total_hints = 0
        total_deleted_ids = 0

        for checkpoint_index in sorted(consumed_checkpoints):
            source_manifest_record = checkpoints[checkpoint_index]
            source_path = materialize_windowed_rup.resolve_package_relative(
                package_dir,
                source_manifest_record,
                label=f"checkpoint {checkpoint_index}",
            )
            formula = _load_formula(source_path)
            if formula[0] != variable_count:
                raise CompactReplayPackageError(
                    f"checkpoint {checkpoint_index} variable-count drift"
                )
            binary = _encode_formula(formula)
            text = _encode_ascii85(binary)
            if _decode_formula_independent(text) != formula:
                raise CompactReplayPackageError(
                    f"checkpoint {checkpoint_index} compact round-trip failed"
                )
            semantic_sha256 = _semantic_sha256("formula", formula)
            emitted = _store_payload(
                stage,
                payload_records,
                kind="formula",
                binary=binary,
                semantic_sha256=semantic_sha256,
            )
            checkpoint_payloads[checkpoint_index] = str(emitted["path"])
            source = _source_record(
                source_path,
                relative=str(source_manifest_record["path"]),
            )
            if (
                source["byte_count"]
                != int(source_manifest_record["byte_count"])
                or source["sha256"] != source_manifest_record["sha256"]
            ):
                raise CompactReplayPackageError(
                    f"checkpoint {checkpoint_index} changed after verification"
                )
            objects.append(
                _object_record(
                    kind="formula",
                    identity=f"checkpoint-{checkpoint_index:04d}",
                    source=source,
                    emitted=emitted,
                    counts={
                        "variable_count": variable_count,
                        "clauses": len(formula[1]),
                        "literals": sum(
                            len(clause) for clause in formula[1]
                        ),
                    },
                )
            )

        action_payloads: dict[tuple[int, int], str] = {}
        for shard, records in ((1, shard_1), (2, shard_2)):
            for record in records:
                index = int(record["index"])
                start = int(record["start_checkpoint"])
                start_formula_object = next(
                    item
                    for item in objects
                    if item["identity"] == f"checkpoint-{start:04d}"
                )
                start_clause_count = int(
                    start_formula_object["counts"]["clauses"]
                )
                action_manifest_record = record["artifacts"][
                    "actions_lrat"
                ]
                source_path = (
                    materialize_windowed_rup.resolve_package_relative(
                        package_dir,
                        action_manifest_record,
                        label=f"shard {shard} window {index} actions",
                    )
                )
                actions = _load_actions(
                    source_path,
                    variable_count=variable_count,
                    start_clause_count=start_clause_count,
                )
                binary = _encode_actions(actions)
                text = _encode_ascii85(binary)
                if (
                    _decode_actions_independent(
                        text, variable_count=variable_count
                    )
                    != actions
                ):
                    raise CompactReplayPackageError(
                        f"shard {shard} window {index} round-trip failed"
                    )
                semantic_sha256 = _semantic_sha256("actions", actions)
                emitted = _store_payload(
                    stage,
                    payload_records,
                    kind="actions",
                    binary=binary,
                    semantic_sha256=semantic_sha256,
                )
                action_payloads[(shard, index)] = str(emitted["path"])
                source = _source_record(
                    source_path,
                    relative=str(action_manifest_record["path"]),
                )
                if (
                    source["byte_count"]
                    != int(action_manifest_record["byte_count"])
                    or source["sha256"]
                    != action_manifest_record["sha256"]
                ):
                    raise CompactReplayPackageError(
                        f"shard {shard} window {index} changed after "
                        "verification"
                    )
                additions = sum(
                    1 for action in actions if action[0] == "add"
                )
                deletions = len(actions) - additions
                hints = sum(
                    len(action[2])
                    for action in actions
                    if action[0] == "add"
                )
                deleted_ids = sum(
                    len(action[1])
                    for action in actions
                    if action[0] == "del"
                )
                total_actions += len(actions)
                total_additions += additions
                total_deletions += deletions
                total_hints += hints
                total_deleted_ids += deleted_ids
                objects.append(
                    _object_record(
                        kind="actions",
                        identity=f"shard-{shard}-window-{index:04d}",
                        source=source,
                        emitted=emitted,
                        counts={
                            "actions": len(actions),
                            "additions": additions,
                            "deletions": deletions,
                            "hints": hints,
                            "deleted_ids": deleted_ids,
                            "first_addition_id": start_clause_count + 1,
                            "next_addition_id": (
                                start_clause_count + additions + 1
                            ),
                        },
                    )
                )

        sources: dict[str, str] = {
            f"{MODULE_NAMESPACE}/Common.lean": _common_module(n),
        }
        for checkpoint_index in sorted(consumed_checkpoints):
            relative = (
                f"{MODULE_NAMESPACE}/Checkpoint/C"
                f"{checkpoint_index:04d}.lean"
            )
            sources[relative] = _checkpoint_module(
                checkpoint_index,
                checkpoint_payloads[checkpoint_index],
            )
        for shard, records in ((1, shard_1), (2, shard_2)):
            for record in records:
                index = int(record["index"])
                relative = (
                    f"{MODULE_NAMESPACE}/Shard{shard}/W{index:04d}.lean"
                )
                sources[relative] = _window_module(
                    shard,
                    record,
                    action_payload_path=action_payloads[(shard, index)],
                )
            sources[f"{MODULE_NAMESPACE}/Shard{shard}.lean"] = (
                _shard_module(shard, records)
            )
        boundary = int(shard_1[-1]["end_checkpoint"])
        if int(shard_2[0]["start_checkpoint"]) != boundary:
            raise CompactReplayPackageError(
                "shard boundary checkpoint drift"
            )
        sources[f"{MODULE_NAMESPACE}/Compose.lean"] = _compose_module(
            int(shard_1[0]["start_checkpoint"])
        )
        for relative, source in sources.items():
            _assert_safe_generated_source(source, label=relative)

        lean_sources: list[dict[str, Any]] = []
        for relative, source in sources.items():
            target = stage / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(source, encoding="utf-8")
            lean_sources.append(
                _lean_source_record(source, path=relative)
            )

        payload_list = [
            payload_records[path] for path in sorted(payload_records)
        ]
        source_bytes = sum(
            int(item["source"]["byte_count"]) for item in objects
        )
        compact_bytes = sum(
            int(item["byte_count"]) for item in payload_list
        )
        binary_bytes = sum(
            int(item["binary_byte_count"]) for item in payload_list
        )
        manifest: dict[str, Any] = {
            "schema": SCHEMA,
            "epistemic_status": EPISTEMIC_STATUS,
            "generator": {
                "path": Path(__file__).name,
                "byte_count": Path(__file__).stat().st_size,
                "sha256": _sha256(Path(__file__)),
            },
            "source": {
                "schema": payload.get("schema"),
                "package_sha256": payload.get("package_sha256"),
                "epistemic_status": payload.get("epistemic_status"),
                "tools": copy.deepcopy(payload.get("tools")),
            },
            "encoding": {
                "formula_magic": "CPF1",
                "actions_magic": "CPA1",
                "integer": "canonical-u64-leb128",
                "signed_literal": "zigzag",
                "envelope": "strict-canonical-raw-ascii85",
                "ascii85_character_range": "!..u",
                "dense_addition_ids_omitted": True,
            },
            "counts": {
                "variable_count": variable_count,
                "n": n,
                "shard_1_windows": len(shard_1),
                "shard_2_windows": len(shard_2),
                "windows": len(shard_1) + len(shard_2),
                "consumed_checkpoints": len(consumed_checkpoints),
                "objects": len(objects),
                "payloads": len(payload_list),
                "lean_sources": len(lean_sources),
                "actions": total_actions,
                "additions": total_additions,
                "deletions": total_deletions,
                "hints": total_hints,
                "deleted_ids": total_deleted_ids,
                "source_bytes": source_bytes,
                "compact_binary_bytes": binary_bytes,
                "compact_ascii85_bytes": compact_bytes,
            },
            "source_counts": copy.deepcopy(counts),
            "trust_profile": {
                "audit_status": TRUST_AUDIT_STATUS,
                "allowed_axioms": EXPECTED_TRUST_AXIOMS,
                "claim": TRUST_CLAIM,
            },
            "objects": objects,
            "payloads": payload_list,
            "lean_sources": lean_sources,
        }
        manifest["compact_replay_package_sha256"] = (
            compute_compact_replay_package_digest(manifest)
        )
        (stage / MANIFEST_NAME).write_text(
            json.dumps(manifest, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        if output_dir.exists():
            raise CompactReplayPackageError(
                f"refusing to overwrite existing replay output: {output_dir}"
            )
        stage.rename(output_dir)
    except BaseException:
        shutil.rmtree(stage, ignore_errors=True)
        raise
    return manifest


def verify_compact_replay_package(
    output_dir: Path,
) -> dict[str, Any]:
    """Reject manifest, content, digest, decoder, or file-set drift."""

    output_dir = output_dir.resolve()
    manifest_path = output_dir / MANIFEST_NAME
    try:
        payload = json.loads(manifest_path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise CompactReplayPackageError(
            f"cannot read compact replay manifest: {manifest_path}"
        ) from exc
    if payload.get("schema") != SCHEMA:
        raise CompactReplayPackageError(
            f"unexpected compact replay schema: {payload.get('schema')!r}"
        )
    if payload.get("epistemic_status") != EPISTEMIC_STATUS:
        raise CompactReplayPackageError(
            "compact replay epistemic-status drift"
        )
    if payload.get("trust_profile") != {
        "audit_status": TRUST_AUDIT_STATUS,
        "allowed_axioms": EXPECTED_TRUST_AXIOMS,
        "claim": TRUST_CLAIM,
    }:
        raise CompactReplayPackageError("expected trust profile drift")
    if payload.get("compact_replay_package_sha256") != (
        compute_compact_replay_package_digest(payload)
    ):
        raise CompactReplayPackageError(
            "compact replay package SHA-256 drift"
        )

    payload_records = payload.get("payloads")
    lean_sources = payload.get("lean_sources")
    objects = payload.get("objects")
    if not isinstance(payload_records, list):
        raise CompactReplayPackageError(
            "manifest payloads is not a list"
        )
    if not isinstance(lean_sources, list):
        raise CompactReplayPackageError(
            "manifest lean_sources is not a list"
        )
    if not isinstance(objects, list):
        raise CompactReplayPackageError("manifest objects is not a list")

    expected_paths = {MANIFEST_NAME}
    payload_by_path: dict[str, dict[str, Any]] = {}
    variable_count = int(payload["counts"]["variable_count"])
    for record in payload_records:
        relative = _safe_relative(record.get("path"), label="payload")
        relative_text = relative.as_posix()
        if relative_text in expected_paths:
            raise CompactReplayPackageError(
                f"duplicate compact replay path: {relative_text}"
            )
        expected_paths.add(relative_text)
        path = output_dir / relative
        if path.is_symlink() or not path.is_file():
            raise CompactReplayPackageError(
                f"compact replay payload is missing: {relative_text}"
            )
        encoded = path.read_bytes()
        if len(encoded) != int(record.get("byte_count", -1)):
            raise CompactReplayPackageError(
                f"compact payload byte-count drift: {relative_text}"
            )
        emitted_sha256 = _sha256_bytes(encoded)
        if emitted_sha256 != record.get("sha256"):
            raise CompactReplayPackageError(
                f"compact payload SHA-256 drift: {relative_text}"
            )
        if Path(relative_text).stem != emitted_sha256:
            raise CompactReplayPackageError(
                f"compact payload path is not content-addressed: "
                f"{relative_text}"
            )
        try:
            text = encoded.decode("ascii")
        except UnicodeDecodeError as exc:
            raise CompactReplayPackageError(
                f"compact payload is not ASCII: {relative_text}"
            ) from exc
        binary = _decode_ascii85_independent(text)
        if len(binary) != int(record.get("binary_byte_count", -1)):
            raise CompactReplayPackageError(
                f"compact binary byte-count drift: {relative_text}"
            )
        if _sha256_bytes(binary) != record.get("binary_sha256"):
            raise CompactReplayPackageError(
                f"compact binary SHA-256 drift: {relative_text}"
            )
        kind = record.get("kind")
        if kind == "formula":
            semantic: object = _decode_formula_independent(text)
        elif kind == "actions":
            semantic = _decode_actions_independent(
                text, variable_count=variable_count
            )
        else:
            raise CompactReplayPackageError(
                f"unknown compact payload kind: {kind!r}"
            )
        if _semantic_sha256(str(kind), semantic) != record.get(
            "semantic_sha256"
        ):
            raise CompactReplayPackageError(
                f"compact semantic digest drift: {relative_text}"
            )
        payload_by_path[relative_text] = record

    for record in lean_sources:
        relative = _safe_relative(record.get("path"), label="Lean source")
        relative_text = relative.as_posix()
        if relative_text in expected_paths:
            raise CompactReplayPackageError(
                f"duplicate compact replay path: {relative_text}"
            )
        expected_paths.add(relative_text)
        path = output_dir / relative
        if path.is_symlink() or not path.is_file():
            raise CompactReplayPackageError(
                f"compact replay source is missing: {relative_text}"
            )
        if path.stat().st_size != int(record.get("byte_count", -1)):
            raise CompactReplayPackageError(
                f"Lean source byte-count drift: {relative_text}"
            )
        if _sha256(path) != record.get("sha256"):
            raise CompactReplayPackageError(
                f"Lean source SHA-256 drift: {relative_text}"
            )
        try:
            source = path.read_text(encoding="utf-8")
        except (OSError, UnicodeDecodeError) as exc:
            raise CompactReplayPackageError(
                f"cannot read generated Lean source: {relative_text}"
            ) from exc
        _assert_safe_generated_source(source, label=relative_text)

    for record in objects:
        emitted = record.get("emitted")
        source = record.get("source")
        if not isinstance(emitted, dict) or not isinstance(source, dict):
            raise CompactReplayPackageError(
                "compact object lacks source or emitted record"
            )
        relative = _safe_relative(
            emitted.get("path"), label="object payload"
        ).as_posix()
        canonical = payload_by_path.get(relative)
        if canonical != emitted:
            raise CompactReplayPackageError(
                f"object payload record drift: {relative}"
            )
        if record.get("semantic_sha256") != emitted.get(
            "semantic_sha256"
        ):
            raise CompactReplayPackageError(
                f"object semantic digest drift: {relative}"
            )
        if int(source.get("byte_count", -1)) < 0 or not isinstance(
            source.get("sha256"), str
        ):
            raise CompactReplayPackageError(
                "object source hash or size is malformed"
            )

    actual_paths: set[str] = set()
    for path in output_dir.rglob("*"):
        if path.is_symlink():
            raise CompactReplayPackageError(
                f"compact replay contains symlink: "
                f"{path.relative_to(output_dir)}"
            )
        if path.is_file():
            actual_paths.add(
                path.relative_to(output_dir).as_posix()
            )
    if actual_paths != expected_paths:
        missing = sorted(expected_paths - actual_paths)
        unexpected = sorted(actual_paths - expected_paths)
        raise CompactReplayPackageError(
            "compact replay path-set drift: "
            f"missing={missing}, unexpected={unexpected}"
        )

    counts = payload.get("counts")
    if not isinstance(counts, dict):
        raise CompactReplayPackageError(
            "compact manifest counts is not an object"
        )
    if int(counts.get("objects", -1)) != len(objects):
        raise CompactReplayPackageError("compact object count drift")
    if int(counts.get("payloads", -1)) != len(payload_records):
        raise CompactReplayPackageError("compact payload count drift")
    if int(counts.get("lean_sources", -1)) != len(lean_sources):
        raise CompactReplayPackageError("compact Lean source count drift")
    return payload


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--package-dir", type=Path)
    mode.add_argument("--verify-replay-package", type=Path)
    parser.add_argument("--output-dir", type=Path)
    args = parser.parse_args(argv)
    try:
        if args.verify_replay_package is not None:
            if args.output_dir is not None:
                parser.error(
                    "--verify-replay-package cannot be combined with "
                    "--output-dir"
                )
            manifest = verify_compact_replay_package(
                args.verify_replay_package
            )
            result = {
                "status": "STRUCTURALLY_VERIFIED",
                "epistemic_status": manifest["epistemic_status"],
                "output_dir": str(args.verify_replay_package.resolve()),
                "compact_replay_package_sha256": (
                    manifest["compact_replay_package_sha256"]
                ),
            }
        else:
            if args.output_dir is None:
                parser.error("--package-dir requires --output-dir")
            manifest = emit(args.package_dir, args.output_dir)
            result = {
                "status": "EMITTED",
                "output_dir": str(args.output_dir.resolve()),
                "compact_replay_package_sha256": (
                    manifest["compact_replay_package_sha256"]
                ),
                "counts": manifest["counts"],
            }
    except (
        base.MaterializationError,
        materialize_windowed_rup.MaterializationError,
        CompactReplayPackageError,
        KeyError,
        TypeError,
        ValueError,
        OSError,
    ) as exc:
        parser.error(str(exc))
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    sys.exit(main())
