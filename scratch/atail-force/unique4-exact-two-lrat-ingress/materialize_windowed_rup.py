#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Materialize a verified two-shard pure-RUP package into bounded windows.

Both logical shards of a hash-verified checkpointed package are preserved
and subdivided into independently rebased windows.  Every window carries a
whole-line LRAT action slice rebased to dense window-local clause ids and a
total, injective window-local/shard-local/global clause-id map.  Window
endpoints are shared canonical checkpoint artifacts: one checkpoint CNF per
boundary, referenced by index, so adjacent windows use the identical
checkpoint definition rather than two separately materialized copies.
Checkpoint 0 is byte-identical to the parent start CNF, the shard-boundary
checkpoint is byte-identical to the parent checkpoint CNF, and the final
window of the second shard derives the empty clause.

This program checks only materialization invariants; it does not decide
RUP.  Soundness comes from replaying each window with
``CheckpointedRup.lean`` (``checkRebaseText`` per window,
``checkTerminalText`` for the terminal window) and composing the resulting
implications transitively across the shared checkpoints.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import tempfile
from typing import Any, Callable

import materialize_checkpointed_rup as base


SCHEMA = "p97-windowed-pure-rup-package-v1"
DEFAULT_MAX_ACTIONS = 4000
DEFAULT_MAX_LRAT_BYTES = 4 * 1024 * 1024
MAP_HEADER = "window_local_id\tshard_local_id\tglobal_id"

MaterializationError = base.MaterializationError

PACKAGE_DIGEST_KEYS = (
    "schema",
    "source",
    "caps",
    "numbering",
    "counts",
    "checkpoints",
    "windows",
    "tools",
    "invariants",
)

INVARIANTS = [
    "The parent two-shard package fully verifies against its manifest "
    "hashes before any windowing starts.",
    "Windows never split an LRAT line; a window closes before the action "
    "that would exceed the action or byte cap, and a single action larger "
    "than the byte cap fails closed.",
    "Adjacent windows reference one shared canonical checkpoint artifact "
    "by index; no boundary CNF is materialized twice.",
    "Checkpoint 0 is byte-identical to the parent start CNF and the "
    "shard-boundary checkpoint is byte-identical to the parent checkpoint "
    "CNF, so the two logical shards are preserved.",
    "Every checkpoint lists the active clauses in increasing shard-local "
    "id order with dense window-local ids.",
    "Every window map is total on the window's local ids and injective "
    "into shard-local and global ids.",
    "Every hint and deletion references an active clause and translates "
    "through the window map; unseen, inactive, or unmapped references "
    "fail closed.",
    "Addition ids are dense per shard and every action line must round-trip "
    "to its canonical spelling.",
    "The terminal window derives exactly one empty clause and no action "
    "follows it.",
]


def compute_package_digest(payload: dict[str, Any]) -> str:
    """Hash the semantic manifest independently of its location."""

    digest_payload = base.without_provenance_paths(
        {key: payload[key] for key in PACKAGE_DIGEST_KEYS}
    )
    return hashlib.sha256(
        json.dumps(
            digest_payload,
            separators=(",", ":"),
            sort_keys=True,
        ).encode("utf-8")
    ).hexdigest()


def resolve_package_relative(
    package_dir: Path,
    record: dict[str, Any],
    *,
    label: str,
) -> Path:
    relative = Path(str(record.get("path", "")))
    if not relative.parts or relative.is_absolute() or ".." in relative.parts:
        raise MaterializationError(
            f"unsafe package artifact path for {label}: {relative}"
        )
    return package_dir / relative


def load_checkpoint_map(path: Path, expected_count: int) -> dict[int, int]:
    """Load the parent checkpoint-map.tsv, rejecting any structural drift."""

    try:
        rows = path.read_text(encoding="ascii").splitlines()
    except (OSError, UnicodeDecodeError) as exc:
        raise MaterializationError(
            f"cannot read parent checkpoint map: {path}"
        ) from exc
    if not rows or rows[0] != "local_id\tglobal_id":
        raise MaterializationError("parent checkpoint map has no header")
    mapping: dict[int, int] = {}
    previous_global = 0
    for expected_local, row in enumerate(rows[1:], 1):
        fields = row.split("\t")
        if len(fields) != 2:
            raise MaterializationError(
                f"malformed parent checkpoint map row {expected_local}"
            )
        try:
            local_id = int(fields[0])
            global_id = int(fields[1])
        except ValueError as exc:
            raise MaterializationError(
                f"non-integer parent checkpoint map row {expected_local}"
            ) from exc
        if local_id != expected_local:
            raise MaterializationError(
                f"non-dense parent checkpoint map local id {local_id}"
            )
        if global_id <= previous_global:
            raise MaterializationError(
                f"non-increasing parent checkpoint map global id {global_id}"
            )
        previous_global = global_id
        mapping[local_id] = global_id
    if len(mapping) != expected_count:
        raise MaterializationError(
            f"parent checkpoint map row-count drift: expected "
            f"{expected_count}, found {len(mapping)}"
        )
    return mapping


class ShardWindower:
    """Stream one shard's LRAT into capped, independently rebased windows.

    The caller supplies the shard's starting active clauses and the index of
    the already-written canonical checkpoint artifact describing them.  Each
    window close writes exactly one new checkpoint artifact; the next window
    references that artifact by index instead of re-materializing it.
    """

    def __init__(
        self,
        *,
        shard_label: str,
        variable_count: int,
        start_clauses: dict[int, tuple[int, ...]],
        first_addition_id: int,
        stage_dir: Path,
        checkpoints_dir: Path,
        caps_max_actions: int,
        caps_max_lrat_bytes: int,
        shard_to_global: Callable[[int], int],
        terminal: bool,
        first_checkpoint_index: int,
    ):
        if caps_max_actions < 1:
            raise MaterializationError("--max-actions must be at least one")
        if caps_max_lrat_bytes < 1:
            raise MaterializationError("--max-lrat-bytes must be at least one")
        if not start_clauses:
            raise MaterializationError(
                f"{shard_label} has no starting clauses"
            )
        self.shard_label = shard_label
        self.variable_count = variable_count
        self.active = dict(start_clauses)
        self.next_addition_id = first_addition_id
        self.stage_dir = stage_dir
        self.checkpoints_dir = checkpoints_dir
        self.max_actions = caps_max_actions
        self.max_lrat_bytes = caps_max_lrat_bytes
        self.shard_to_global = shard_to_global
        self.terminal = terminal
        self.checkpoint_counter = first_checkpoint_index
        self.records: list[dict[str, Any]] = []
        self.checkpoint_records: list[dict[str, Any]] = []
        self.counts = base.ActionCounts()
        self.peak_active_clause_count = len(self.active)
        self.empty_shard_ids: list[int] = []
        self.line_number = 0
        self.window_open = False

    def _open_window(self) -> None:
        index = len(self.records) + 1
        self.w_index = index
        self.w_dir = self.stage_dir / self.shard_label / f"window-{index:04d}"
        self.w_dir.mkdir(parents=True, exist_ok=False)
        self.w_start_checkpoint = self.checkpoint_counter
        self.w_start_ids = sorted(self.active)
        self.w_map = {
            shard_id: local_id
            for local_id, shard_id in enumerate(self.w_start_ids, 1)
        }
        self.w_start_clause_count = len(self.w_start_ids)
        self.w_added_ids: list[int] = []
        self.w_lines: list[str] = []
        self.w_bytes = 0
        self.w_counts = base.ActionCounts()
        self.w_first_line: int | None = None
        self.w_last_line: int | None = None
        self.window_open = True

    def _translate(self, cid: int) -> int:
        local_id = self.w_map.get(cid)
        if local_id is None:
            raise MaterializationError(
                f"{self.shard_label} window {self.w_index} has no local "
                f"mapping for shard clause id {cid} on LRAT line "
                f"{self.line_number}"
            )
        return local_id

    def _render_deletion(self, deleted: list[int]) -> tuple[str, None]:
        return (
            base.format_deletion(self._translate(cid) for cid in deleted),
            None,
        )

    def _render_addition(
        self,
        clause: tuple[int, ...],
        hints: list[int],
    ) -> tuple[str, int]:
        local_id = self.w_start_clause_count + self.w_counts.additions + 1
        translated = [self._translate(hint) for hint in hints]
        return base.format_addition(local_id, clause, translated), local_id

    def _emit(
        self,
        *,
        deleted: list[int] | None = None,
        clause: tuple[int, ...] | None = None,
        hints: list[int] | None = None,
    ) -> None:
        if not self.window_open:
            self._open_window()

        def render() -> tuple[str, int | None]:
            if deleted is not None:
                return self._render_deletion(deleted)
            assert clause is not None and hints is not None
            return self._render_addition(clause, hints)

        text, local_id = render()
        size = len(text) + 1
        if (
            self.w_counts.lines + 1 > self.max_actions
            or self.w_bytes + size > self.max_lrat_bytes
        ):
            if self.w_counts.lines >= 1:
                self._close_window()
                self._open_window()
                text, local_id = render()
                size = len(text) + 1
        if size > self.max_lrat_bytes:
            raise MaterializationError(
                f"single LRAT action on {self.shard_label} line "
                f"{self.line_number} exceeds the window byte cap"
            )
        self.w_lines.append(text)
        self.w_bytes += size
        self.w_counts.lines += 1
        if self.w_first_line is None:
            self.w_first_line = self.line_number
        self.w_last_line = self.line_number
        if deleted is not None:
            self.w_counts.deletions += 1
            self.w_counts.deleted_ids += len(deleted)
        else:
            assert clause is not None and hints is not None and local_id
            self.w_counts.additions += 1
            self.w_counts.hints += len(hints)
            shard_id = self.next_addition_id
            self.w_map[shard_id] = local_id
            self.w_added_ids.append(shard_id)

    def _close_window(self) -> None:
        self.checkpoint_counter += 1
        end_index = self.checkpoint_counter
        end_ids = sorted(self.active)
        end_cnf = base.Cnf(
            self.variable_count,
            tuple(self.active[shard_id] for shard_id in end_ids),
        )
        checkpoint_path = (
            self.checkpoints_dir / f"checkpoint-{end_index:04d}.cnf"
        )
        with base.DigestWriter(checkpoint_path) as writer:
            base.render_cnf(writer, end_cnf)
        checkpoint_record = writer.record()
        checkpoint_record["path"] = f"checkpoints/{checkpoint_path.name}"
        checkpoint_record["index"] = end_index
        checkpoint_record["clause_count"] = len(end_ids)
        self.checkpoint_records.append(checkpoint_record)

        with base.DigestWriter(self.w_dir / "actions.lrat") as writer:
            for line in self.w_lines:
                writer.line(line)
        actions_record = writer.record()
        if actions_record["byte_count"] != self.w_bytes:
            raise MaterializationError(
                f"{self.shard_label} window {self.w_index} action byte "
                "accounting drift"
            )
        actions_record["path"] = (
            f"{self.shard_label}/window-{self.w_index:04d}/actions.lrat"
        )

        map_shard_ids = [*self.w_start_ids, *self.w_added_ids]
        map_global_ids = [
            self.shard_to_global(shard_id) for shard_id in map_shard_ids
        ]
        if len(set(map_shard_ids)) != len(map_shard_ids):
            raise MaterializationError(
                f"{self.shard_label} window {self.w_index} map repeats a "
                "shard-local clause id"
            )
        if len(set(map_global_ids)) != len(map_global_ids):
            raise MaterializationError(
                f"{self.shard_label} window {self.w_index} map repeats a "
                "global clause id"
            )
        with base.DigestWriter(self.w_dir / "map.tsv") as writer:
            writer.line(MAP_HEADER)
            for local_id, (shard_id, global_id) in enumerate(
                zip(map_shard_ids, map_global_ids),
                1,
            ):
                writer.line(f"{local_id}\t{shard_id}\t{global_id}")
        map_record = writer.record()
        map_record["path"] = (
            f"{self.shard_label}/window-{self.w_index:04d}/map.tsv"
        )

        addition_span = (
            [self.w_added_ids[0], self.w_added_ids[-1]]
            if self.w_added_ids
            else None
        )
        self.records.append(
            {
                "index": self.w_index,
                "role": "rebase",
                "directory": (
                    f"{self.shard_label}/window-{self.w_index:04d}"
                ),
                "start_checkpoint": self.w_start_checkpoint,
                "end_checkpoint": end_index,
                "counts": self.w_counts.as_json(),
                "numbering": {
                    "start_clause_count": self.w_start_clause_count,
                    "end_clause_count": len(end_ids),
                    "first_local_addition_id": (
                        self.w_start_clause_count + 1
                    ),
                    "addition_shard_ids": addition_span,
                    "source_lines": [self.w_first_line, self.w_last_line],
                },
                "artifacts": {
                    "actions_lrat": actions_record,
                    "map": map_record,
                },
            }
        )
        self.counts.lines += self.w_counts.lines
        self.counts.additions += self.w_counts.additions
        self.counts.deletions += self.w_counts.deletions
        self.counts.deleted_ids += self.w_counts.deleted_ids
        self.counts.hints += self.w_counts.hints
        self.window_open = False

    def run(self, lrat_path: Path) -> None:
        with lrat_path.open("rb") as source:
            for raw_line in source:
                self.line_number += 1
                line_number = self.line_number
                if not raw_line.endswith(b"\n") or b"\r" in raw_line:
                    raise MaterializationError(
                        f"{self.shard_label} LRAT line {line_number} is "
                        "not LF-terminated ASCII"
                    )
                try:
                    line = raw_line.decode("ascii")
                except UnicodeDecodeError as exc:
                    raise MaterializationError(
                        f"non-ASCII {self.shard_label} LRAT line "
                        f"{line_number}"
                    ) from exc
                fields = line.split()
                if len(fields) < 2:
                    raise MaterializationError(
                        f"blank or malformed {self.shard_label} LRAT line "
                        f"{line_number}"
                    )
                if self.empty_shard_ids:
                    raise MaterializationError(
                        f"action follows the empty clause on "
                        f"{self.shard_label} LRAT line {line_number}"
                    )

                if fields[1] == "d":
                    action_id, deleted = base.parse_deletion(
                        fields,
                        line_number=line_number,
                    )
                    if action_id != 1:
                        raise MaterializationError(
                            f"noncanonical deletion action id on "
                            f"{self.shard_label} LRAT line {line_number}"
                        )
                    if len(set(deleted)) != len(deleted):
                        raise MaterializationError(
                            f"duplicate id within deletion on "
                            f"{self.shard_label} LRAT line {line_number}"
                        )
                    if line[:-1] != base.format_deletion(deleted):
                        raise MaterializationError(
                            f"noncanonical deletion spelling on "
                            f"{self.shard_label} LRAT line {line_number}"
                        )
                    current_max_id = self.next_addition_id - 1
                    for clause_id in deleted:
                        if clause_id > current_max_id:
                            raise MaterializationError(
                                f"deletion references unseen clause "
                                f"{clause_id} on {self.shard_label} LRAT "
                                f"line {line_number}"
                            )
                        if clause_id not in self.active:
                            raise MaterializationError(
                                f"deletion references inactive clause "
                                f"{clause_id} on {self.shard_label} LRAT "
                                f"line {line_number}"
                            )
                    self._emit(deleted=deleted)
                    for clause_id in deleted:
                        self.active.pop(clause_id)
                    continue

                action_id, clause, hints = base.parse_addition(
                    fields,
                    line_number=line_number,
                    variable_count=self.variable_count,
                )
                if action_id != self.next_addition_id:
                    raise MaterializationError(
                        f"non-dense addition id on {self.shard_label} LRAT "
                        f"line {line_number}: expected "
                        f"{self.next_addition_id}, got {action_id}"
                    )
                if line[:-1] != base.format_addition(action_id, clause, hints):
                    raise MaterializationError(
                        f"noncanonical addition spelling on "
                        f"{self.shard_label} LRAT line {line_number}"
                    )
                for hint in hints:
                    if hint >= action_id:
                        raise MaterializationError(
                            f"RUP hint {hint} is not earlier than addition "
                            f"{action_id} on {self.shard_label} LRAT line "
                            f"{line_number}"
                        )
                    if hint not in self.active:
                        raise MaterializationError(
                            f"RUP hint {hint} is inactive on "
                            f"{self.shard_label} LRAT line {line_number}"
                        )
                self._emit(clause=clause, hints=hints)
                self.active[action_id] = clause
                self.next_addition_id += 1
                if not clause:
                    if not self.terminal:
                        raise MaterializationError(
                            f"empty clause occurs in non-terminal "
                            f"{self.shard_label} on LRAT line {line_number}"
                        )
                    self.empty_shard_ids.append(action_id)
                self.peak_active_clause_count = max(
                    self.peak_active_clause_count,
                    len(self.active),
                )

    def finish(self) -> None:
        if self.window_open:
            self._close_window()
        if not self.records:
            raise MaterializationError(
                f"{self.shard_label} contains no actions"
            )
        if self.terminal:
            if len(self.empty_shard_ids) != 1:
                raise MaterializationError(
                    f"{self.shard_label} must derive exactly one empty "
                    "clause"
                )
            self.records[-1]["role"] = "terminal"


def shard_summary(windower: ShardWindower) -> dict[str, Any]:
    records = windower.records
    return {
        "windows": len(records),
        **windower.counts.as_json(),
        "max_window_lines": max(
            record["counts"]["lines"] for record in records
        ),
        "max_window_lrat_bytes": max(
            record["artifacts"]["actions_lrat"]["byte_count"]
            for record in records
        ),
        "peak_active_clause_count": windower.peak_active_clause_count,
    }


def materialize_windows(
    *,
    package_dir: Path,
    output_dir: Path,
    max_actions: int = DEFAULT_MAX_ACTIONS,
    max_lrat_bytes: int = DEFAULT_MAX_LRAT_BYTES,
) -> dict[str, Any]:
    """Window a verified two-shard package behind shared checkpoints."""

    package_dir = package_dir.resolve()
    output_dir = output_dir.resolve()
    if output_dir.exists():
        raise MaterializationError(
            f"refusing to overwrite existing output directory: {output_dir}"
        )
    if max_actions < 1:
        raise MaterializationError("--max-actions must be at least one")
    if max_lrat_bytes < 1:
        raise MaterializationError("--max-lrat-bytes must be at least one")

    parent_payload = base.verify_package(package_dir)
    parent_counts = parent_payload["counts"]
    parent_numbering = parent_payload["numbering"]
    parent_artifacts = parent_payload["artifacts"]
    variable_count = int(parent_counts["variable_count"])
    base_clause_count = int(parent_counts["base_clause_count"])
    checkpoint_clause_count = int(
        parent_counts["checkpoint_active_clause_count"]
    )
    second_shard_first_local = int(
        parent_numbering["second_shard_first_local_addition"]
    )
    second_shard_first_global = int(
        parent_numbering["second_shard_first_global_addition"]
    )

    start_cnf = base.parse_dimacs(
        resolve_package_relative(
            package_dir,
            parent_artifacts["start_cnf"],
            label="parent start CNF",
        )
    )
    if (
        start_cnf.variable_count != variable_count
        or len(start_cnf.clauses) != base_clause_count
    ):
        raise MaterializationError(
            "parent start CNF drifts from its manifest counts"
        )
    checkpoint_cnf = base.parse_dimacs(
        resolve_package_relative(
            package_dir,
            parent_artifacts["checkpoint_cnf"],
            label="parent checkpoint CNF",
        )
    )
    if (
        checkpoint_cnf.variable_count != variable_count
        or len(checkpoint_cnf.clauses) != checkpoint_clause_count
    ):
        raise MaterializationError(
            "parent checkpoint CNF drifts from its manifest counts"
        )
    checkpoint_map = load_checkpoint_map(
        resolve_package_relative(
            package_dir,
            parent_artifacts["checkpoint_map"],
            label="parent checkpoint map",
        ),
        checkpoint_clause_count,
    )

    def shard_1_global(shard_id: int) -> int:
        return shard_id

    def shard_2_global(shard_id: int) -> int:
        if shard_id <= checkpoint_clause_count:
            return checkpoint_map[shard_id]
        return second_shard_first_global + (
            shard_id - second_shard_first_local
        )

    output_dir.parent.mkdir(parents=True, exist_ok=True)
    stage = Path(
        tempfile.mkdtemp(
            prefix=f".{output_dir.name}.stage-",
            dir=output_dir.parent,
        )
    )
    try:
        checkpoints_dir = stage / "checkpoints"
        checkpoints_dir.mkdir()

        checkpoint_zero_path = checkpoints_dir / "checkpoint-0000.cnf"
        with base.DigestWriter(checkpoint_zero_path) as writer:
            base.render_cnf(writer, start_cnf)
        checkpoint_zero = writer.record()
        checkpoint_zero["path"] = "checkpoints/checkpoint-0000.cnf"
        checkpoint_zero["index"] = 0
        checkpoint_zero["clause_count"] = base_clause_count
        if (
            checkpoint_zero["sha256"]
            != parent_artifacts["start_cnf"]["sha256"]
        ):
            raise MaterializationError(
                "re-rendered start CNF drifts from the parent package"
            )

        first = ShardWindower(
            shard_label="shard-1",
            variable_count=variable_count,
            start_clauses={
                clause_id: clause
                for clause_id, clause in enumerate(start_cnf.clauses, 1)
            },
            first_addition_id=base_clause_count + 1,
            stage_dir=stage,
            checkpoints_dir=checkpoints_dir,
            caps_max_actions=max_actions,
            caps_max_lrat_bytes=max_lrat_bytes,
            shard_to_global=shard_1_global,
            terminal=False,
            first_checkpoint_index=0,
        )
        first.run(
            resolve_package_relative(
                package_dir,
                parent_artifacts["shard_1_lrat"],
                label="parent shard-1 LRAT",
            )
        )
        first.finish()
        boundary_index = first.checkpoint_counter
        boundary_record = first.checkpoint_records[-1]
        if (
            boundary_record["sha256"]
            != parent_artifacts["checkpoint_cnf"]["sha256"]
        ):
            raise MaterializationError(
                "shard-1 windows do not terminate at the parent checkpoint"
            )

        second = ShardWindower(
            shard_label="shard-2",
            variable_count=variable_count,
            start_clauses={
                clause_id: clause
                for clause_id, clause in enumerate(checkpoint_cnf.clauses, 1)
            },
            first_addition_id=second_shard_first_local,
            stage_dir=stage,
            checkpoints_dir=checkpoints_dir,
            caps_max_actions=max_actions,
            caps_max_lrat_bytes=max_lrat_bytes,
            shard_to_global=shard_2_global,
            terminal=True,
            first_checkpoint_index=boundary_index,
        )
        second.run(
            resolve_package_relative(
                package_dir,
                parent_artifacts["shard_2_lrat"],
                label="parent shard-2 LRAT",
            )
        )
        second.finish()

        checkpoints = [
            checkpoint_zero,
            *first.checkpoint_records,
            *second.checkpoint_records,
        ]
        for expected_index, record in enumerate(checkpoints):
            if record["index"] != expected_index:
                raise MaterializationError(
                    f"non-dense checkpoint index {record['index']}"
                )

        max_checkpoint_bytes = max(
            record["byte_count"] for record in checkpoints
        )
        max_checkpoint_clauses = max(
            record["clause_count"] for record in checkpoints
        )
        payload: dict[str, Any] = {
            "schema": SCHEMA,
            "epistemic_status": (
                "STRUCTURALLY VALIDATED WINDOWED PURE-RUP SHARDS; "
                "LEAN REPLAY REQUIRED"
            ),
            "claim_scope": (
                "This package is a deterministic bounded-window "
                "re-encoding of one hash-verified two-shard pure-RUP "
                "package. It is not itself a RUP proof check, a "
                "source-to-CNF bridge, or a production theorem."
            ),
            "source": {
                "parent_package": {
                    "path": str(package_dir),
                    "schema": parent_payload["schema"],
                    "package_sha256": parent_payload["package_sha256"],
                    "artifacts": {
                        label: {
                            "sha256": record["sha256"],
                            "byte_count": record["byte_count"],
                        }
                        for label, record in parent_artifacts.items()
                    },
                },
            },
            "caps": {
                "max_actions": max_actions,
                "max_lrat_bytes": max_lrat_bytes,
            },
            "numbering": {
                "checkpoint_order": "increasing_shard_local_clause_id",
                "deletion_action_id": 1,
                "map_columns": [
                    "window_local_id",
                    "shard_local_id",
                    "global_id",
                ],
                "shard_boundary_checkpoint": boundary_index,
                "shard_1_global_ids": (
                    "shard-local ids equal parent global ids"
                ),
                "shard_2_global_ids": (
                    "checkpoint rows translate through the parent "
                    "checkpoint map; additions are offset into parent "
                    "global addition ids"
                ),
                "parent": {
                    "base_clause_count": base_clause_count,
                    "checkpoint_active_clause_count": (
                        checkpoint_clause_count
                    ),
                    "second_shard_first_local_addition": (
                        second_shard_first_local
                    ),
                    "second_shard_first_global_addition": (
                        second_shard_first_global
                    ),
                },
            },
            "counts": {
                "variable_count": variable_count,
                "windows": len(first.records) + len(second.records),
                "checkpoints": len(checkpoints),
                "max_checkpoint_bytes": max_checkpoint_bytes,
                "max_checkpoint_clauses": max_checkpoint_clauses,
                "terminal_window": second.records[-1]["directory"],
                "shard_1": shard_summary(first),
                "shard_2": shard_summary(second),
            },
            "checkpoints": checkpoints,
            "windows": {
                "shard_1": first.records,
                "shard_2": second.records,
            },
            "tools": {
                "windowed_materializer": base.artifact_record(
                    Path(__file__).resolve()
                ),
                "parent_materializer": base.artifact_record(
                    Path(base.__file__).resolve()
                ),
                "lean_checker": parent_payload["tools"]["lean_checker"],
            },
            "invariants": INVARIANTS,
        }
        payload["package_sha256"] = compute_package_digest(payload)
        (stage / "manifest.json").write_text(
            json.dumps(payload, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        os.replace(stage, output_dir)
        return payload
    except Exception:
        shutil.rmtree(stage, ignore_errors=True)
        raise


def load_window_map(map_path: Path, *, label: str) -> list[tuple[int, int, int]]:
    """Load one window map, rejecting any deviation from the row grammar."""

    try:
        rows = map_path.read_text(encoding="ascii").splitlines()
    except (OSError, UnicodeDecodeError) as exc:
        raise MaterializationError(f"cannot read {label}") from exc
    if not rows or rows[0] != MAP_HEADER:
        raise MaterializationError(f"{label} has no canonical header")
    parsed: list[tuple[int, int, int]] = []
    for expected_local, row in enumerate(rows[1:], 1):
        fields = row.split("\t")
        if len(fields) != 3:
            raise MaterializationError(
                f"malformed {label} row {expected_local}"
            )
        try:
            local_id = int(fields[0])
            shard_id = int(fields[1])
            global_id = int(fields[2])
        except ValueError as exc:
            raise MaterializationError(
                f"non-integer {label} row {expected_local}"
            ) from exc
        if local_id != expected_local:
            raise MaterializationError(
                f"non-dense {label} local id {local_id}"
            )
        if shard_id < 1 or global_id < 1:
            raise MaterializationError(
                f"non-positive {label} clause id in row {expected_local}"
            )
        parsed.append((local_id, shard_id, global_id))
    return parsed


def authenticate_window_map(
    rows: list[tuple[int, int, int]],
    *,
    label: str,
    start_shard_ids: list[int],
    addition_shard_ids: list[int],
) -> None:
    """Require map rows to name the actual start clauses and additions."""

    expected = [*start_shard_ids, *addition_shard_ids]
    if len(rows) != len(expected):
        raise MaterializationError(
            f"{label} row-count drift: expected {len(expected)}, found "
            f"{len(rows)}"
        )
    for (local_id, shard_id, _), expected_shard in zip(rows, expected):
        if shard_id != expected_shard:
            raise MaterializationError(
                f"{label} shard-local id drift in row {local_id}: expected "
                f"{expected_shard}, found {shard_id}"
            )
    global_ids = [global_id for _, _, global_id in rows]
    if len(set(global_ids)) != len(global_ids):
        raise MaterializationError(f"{label} is not injective")


def replay_window_actions(
    actions_path: Path,
    *,
    label: str,
    start_clauses: tuple[tuple[int, ...], ...],
    variable_count: int,
    allow_empty: bool,
) -> tuple[base.ActionCounts, dict[int, tuple[int, ...]], list[int], bool]:
    """Structurally replay one window from its start checkpoint.

    Reconstructs the window-local active clause state action by action.
    Every reference must name an active local clause and every addition id
    must be dense; RUP itself is not decided.  Returns the observed action
    counts, the final active state, the deleted local ids in order, and
    whether the empty clause was derived.
    """

    local_active: dict[int, tuple[int, ...]] = {
        local_id: clause
        for local_id, clause in enumerate(start_clauses, 1)
    }
    next_local = len(start_clauses) + 1
    counts = base.ActionCounts()
    deleted_locals: list[int] = []
    empty_seen = False
    with actions_path.open("rb") as source:
        for line_number, raw_line in enumerate(source, 1):
            if not raw_line.endswith(b"\n") or b"\r" in raw_line:
                raise MaterializationError(
                    f"{label} line {line_number} is not LF-terminated ASCII"
                )
            try:
                line = raw_line.decode("ascii")
            except UnicodeDecodeError as exc:
                raise MaterializationError(
                    f"non-ASCII {label} line {line_number}"
                ) from exc
            fields = line.split()
            if len(fields) < 2:
                raise MaterializationError(
                    f"blank or malformed {label} line {line_number}"
                )
            if empty_seen:
                raise MaterializationError(
                    f"action follows the empty clause on {label} line "
                    f"{line_number}"
                )
            counts.lines += 1
            if fields[1] == "d":
                action_id, deleted = base.parse_deletion(
                    fields,
                    line_number=line_number,
                )
                if action_id != 1:
                    raise MaterializationError(
                        f"noncanonical deletion action id on {label} line "
                        f"{line_number}"
                    )
                if len(set(deleted)) != len(deleted):
                    raise MaterializationError(
                        f"duplicate id within deletion on {label} line "
                        f"{line_number}"
                    )
                if line[:-1] != base.format_deletion(deleted):
                    raise MaterializationError(
                        f"noncanonical deletion spelling on {label} line "
                        f"{line_number}"
                    )
                for local_id in deleted:
                    if local_id >= next_local:
                        raise MaterializationError(
                            f"deletion references unseen local clause "
                            f"{local_id} on {label} line {line_number}"
                        )
                    if local_id not in local_active:
                        raise MaterializationError(
                            f"deletion references inactive local clause "
                            f"{local_id} on {label} line {line_number}"
                        )
                    local_active.pop(local_id)
                deleted_locals.extend(deleted)
                counts.deletions += 1
                counts.deleted_ids += len(deleted)
                continue
            action_id, clause, hints = base.parse_addition(
                fields,
                line_number=line_number,
                variable_count=variable_count,
            )
            if action_id != next_local:
                raise MaterializationError(
                    f"non-dense addition id on {label} line {line_number}: "
                    f"expected {next_local}, got {action_id}"
                )
            if line[:-1] != base.format_addition(action_id, clause, hints):
                raise MaterializationError(
                    f"noncanonical addition spelling on {label} line "
                    f"{line_number}"
                )
            for hint in hints:
                if hint >= action_id:
                    raise MaterializationError(
                        f"RUP hint {hint} is not earlier than addition "
                        f"{action_id} on {label} line {line_number}"
                    )
                if hint not in local_active:
                    raise MaterializationError(
                        f"RUP hint {hint} is inactive on {label} line "
                        f"{line_number}"
                    )
            local_active[next_local] = clause
            next_local += 1
            counts.additions += 1
            counts.hints += len(hints)
            if not clause:
                if not allow_empty:
                    raise MaterializationError(
                        f"{label} derives an empty clause outside the "
                        "terminal window"
                    )
                empty_seen = True
    return counts, local_active, deleted_locals, empty_seen


def verify_windowed_package(package_dir: Path) -> dict[str, Any]:
    """Recompute all artifact hashes and semantically replay every window.

    Beyond hash and chain checks, every window is independently streamed
    from its shared start checkpoint through its action slice, the active
    clause state is reconstructed, and the result must equal the referenced
    end checkpoint exactly.  Map rows are authenticated against the actual
    start clauses and in-window additions, with global ids re-derived where
    they are determined and cross-window consistent elsewhere.  RUP itself
    is not decided.
    """

    package_dir = package_dir.resolve()
    manifest_path = package_dir / "manifest.json"
    try:
        payload = json.loads(manifest_path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise MaterializationError(
            f"cannot read package manifest: {manifest_path}"
        ) from exc
    if payload.get("schema") != SCHEMA:
        raise MaterializationError(
            f"unexpected package schema: {payload.get('schema')!r}"
        )
    if payload.get("package_sha256") != compute_package_digest(payload):
        raise MaterializationError("package SHA-256 drift")

    caps = payload["caps"]
    max_actions = int(caps["max_actions"])
    max_lrat_bytes = int(caps["max_lrat_bytes"])
    if max_actions < 1 or max_lrat_bytes < 1:
        raise MaterializationError("package caps must be positive")

    variable_count = int(payload["counts"]["variable_count"])
    parent_numbering = payload["numbering"]["parent"]
    base_clause_count = int(parent_numbering["base_clause_count"])
    checkpoint_clause_count = int(
        parent_numbering["checkpoint_active_clause_count"]
    )
    second_shard_first_local = int(
        parent_numbering["second_shard_first_local_addition"]
    )
    second_shard_first_global = int(
        parent_numbering["second_shard_first_global_addition"]
    )
    if second_shard_first_local != checkpoint_clause_count + 1:
        raise MaterializationError(
            "parent numbering drift: the second shard's first local "
            "addition must follow the checkpoint clauses"
        )

    checkpoints = payload["checkpoints"]
    if not isinstance(checkpoints, list) or not checkpoints:
        raise MaterializationError("package manifest has no checkpoints")
    for expected_index, record in enumerate(checkpoints):
        if record.get("index") != expected_index:
            raise MaterializationError(
                f"non-dense checkpoint index {record.get('index')}"
            )
        base.validate_expected_artifact(
            resolve_package_relative(
                package_dir,
                record,
                label=f"checkpoint {expected_index}",
            ),
            record,
            label=f"checkpoint {expected_index}",
        )

    parsed_checkpoints: dict[int, base.Cnf] = {}

    def checkpoint_cnf(index: int) -> base.Cnf:
        cached = parsed_checkpoints.get(index)
        if cached is not None:
            return cached
        record = checkpoints[index]
        cnf = base.parse_dimacs(
            resolve_package_relative(
                package_dir,
                record,
                label=f"checkpoint {index}",
            )
        )
        if cnf.variable_count != variable_count:
            raise MaterializationError(
                f"checkpoint {index} variable-count drift"
            )
        if len(cnf.clauses) != int(record["clause_count"]):
            raise MaterializationError(
                f"checkpoint {index} clause-count drift"
            )
        parsed_checkpoints[index] = cnf
        return cnf

    parent_artifacts = payload["source"]["parent_package"]["artifacts"]
    boundary_index = int(
        payload["numbering"]["shard_boundary_checkpoint"]
    )
    if not 0 < boundary_index < len(checkpoints) - 1:
        raise MaterializationError(
            "shard boundary checkpoint index is out of range"
        )
    if (
        checkpoints[0]["sha256"]
        != parent_artifacts["start_cnf"]["sha256"]
    ):
        raise MaterializationError(
            "checkpoint 0 drifts from the parent start CNF"
        )
    if (
        checkpoints[boundary_index]["sha256"]
        != parent_artifacts["checkpoint_cnf"]["sha256"]
    ):
        raise MaterializationError(
            "shard boundary checkpoint drifts from the parent checkpoint CNF"
        )

    windows = payload["windows"]
    shard_specs = (
        ("shard_1", 0, boundary_index, False, base_clause_count),
        (
            "shard_2",
            boundary_index,
            len(checkpoints) - 1,
            True,
            checkpoint_clause_count,
        ),
    )
    shard_2_checkpoint_globals: dict[int, int] = {}
    for (
        shard_key,
        first_start,
        last_end,
        is_terminal,
        shard_start_count,
    ) in shard_specs:
        records = windows.get(shard_key)
        if not isinstance(records, list) or not records:
            raise MaterializationError(
                f"package manifest has no {shard_key} windows"
            )
        if int(checkpoints[first_start]["clause_count"]) != shard_start_count:
            raise MaterializationError(
                f"{shard_key} start checkpoint clause-count drift from "
                "the parent numbering"
            )
        active_shard_ids = set(range(1, shard_start_count + 1))
        next_shard_addition = (
            base_clause_count + 1
            if shard_key == "shard_1"
            else second_shard_first_local
        )
        expected_start = first_start
        for position, record in enumerate(records, 1):
            label = f"{shard_key} window {position}"
            if record.get("index") != position:
                raise MaterializationError(f"non-dense index for {label}")
            if record.get("start_checkpoint") != expected_start:
                raise MaterializationError(
                    f"{label} does not share the previous window's "
                    "canonical checkpoint"
                )
            if record.get("end_checkpoint") != expected_start + 1:
                raise MaterializationError(
                    f"{label} does not advance to the next canonical "
                    "checkpoint"
                )
            expected_start += 1
            is_last = position == len(records)
            expected_role = (
                "terminal" if is_terminal and is_last else "rebase"
            )
            if record.get("role") != expected_role:
                raise MaterializationError(
                    f"{label} role drift: expected {expected_role!r}"
                )
            recorded_counts = record["counts"]
            if recorded_counts["lines"] < 1 or (
                recorded_counts["lines"] > max_actions
            ):
                raise MaterializationError(
                    f"{label} violates the action cap"
                )
            actions_record = record["artifacts"]["actions_lrat"]
            if int(actions_record["byte_count"]) > max_lrat_bytes:
                raise MaterializationError(
                    f"{label} violates the LRAT byte cap"
                )
            actions_path = resolve_package_relative(
                package_dir,
                actions_record,
                label=f"{label} actions",
            )
            base.validate_expected_artifact(
                actions_path,
                actions_record,
                label=f"{label} actions",
            )
            map_record = record["artifacts"]["map"]
            map_path = resolve_package_relative(
                package_dir,
                map_record,
                label=f"{label} map",
            )
            base.validate_expected_artifact(
                map_path,
                map_record,
                label=f"{label} map",
            )

            start_index = int(record["start_checkpoint"])
            end_index = int(record["end_checkpoint"])
            start_cnf = checkpoint_cnf(start_index)
            observed_counts, local_active, deleted_locals, empty_seen = (
                replay_window_actions(
                    actions_path,
                    label=f"{label} actions",
                    start_clauses=start_cnf.clauses,
                    variable_count=variable_count,
                    allow_empty=is_terminal and is_last,
                )
            )
            end_cnf = checkpoint_cnf(end_index)
            reconstructed = tuple(
                local_active[local_id]
                for local_id in sorted(local_active)
            )
            if reconstructed != end_cnf.clauses:
                raise MaterializationError(
                    f"{label} does not replay to its shared end checkpoint"
                )
            if is_terminal and is_last and not empty_seen:
                raise MaterializationError(
                    f"{label} does not derive the empty clause"
                )

            observed = observed_counts.as_json()
            recorded = {
                key: int(recorded_counts[key]) for key in observed
            }
            if observed != recorded:
                raise MaterializationError(
                    f"{label} recorded counts drift from the replayed "
                    "actions"
                )
            numbering = record["numbering"]
            if (
                int(numbering["start_clause_count"])
                != len(start_cnf.clauses)
                or int(numbering["end_clause_count"])
                != len(end_cnf.clauses)
            ):
                raise MaterializationError(
                    f"{label} endpoint clause counts drift from the "
                    "shared checkpoints"
                )
            if (
                int(numbering["first_local_addition_id"])
                != len(start_cnf.clauses) + 1
            ):
                raise MaterializationError(
                    f"{label} first local addition id drift"
                )
            addition_shard_ids = list(
                range(
                    next_shard_addition,
                    next_shard_addition + observed_counts.additions,
                )
            )
            expected_span = (
                [addition_shard_ids[0], addition_shard_ids[-1]]
                if addition_shard_ids
                else None
            )
            if numbering["addition_shard_ids"] != expected_span:
                raise MaterializationError(
                    f"{label} addition shard-id span drift"
                )

            start_shard_ids = sorted(active_shard_ids)
            if len(start_shard_ids) != len(start_cnf.clauses):
                raise MaterializationError(
                    f"{label} start checkpoint drifts from the shard "
                    "reconstruction"
                )
            rows = load_window_map(map_path, label=f"{label} map")
            authenticate_window_map(
                rows,
                label=f"{label} map",
                start_shard_ids=start_shard_ids,
                addition_shard_ids=addition_shard_ids,
            )
            if shard_key == "shard_1":
                for local_id, shard_id, global_id in rows:
                    if global_id != shard_id:
                        raise MaterializationError(
                            f"{label} map global id drift in row "
                            f"{local_id}"
                        )
            else:
                previous_checkpoint_global = 0
                for local_id, shard_id, global_id in rows:
                    if shard_id >= second_shard_first_local:
                        expected_global = second_shard_first_global + (
                            shard_id - second_shard_first_local
                        )
                        if global_id != expected_global:
                            raise MaterializationError(
                                f"{label} map global id drift in row "
                                f"{local_id}"
                            )
                        continue
                    if not 1 <= global_id < second_shard_first_global:
                        raise MaterializationError(
                            f"{label} map global id out of range in row "
                            f"{local_id}"
                        )
                    if global_id <= previous_checkpoint_global:
                        raise MaterializationError(
                            f"{label} map checkpoint global ids are not "
                            f"increasing at row {local_id}"
                        )
                    previous_checkpoint_global = global_id
                    known = shard_2_checkpoint_globals.get(shard_id)
                    if known is None:
                        shard_2_checkpoint_globals[shard_id] = global_id
                    elif known != global_id:
                        raise MaterializationError(
                            f"{label} map global id for shard clause "
                            f"{shard_id} is inconsistent across windows"
                        )

            local_to_shard = {
                local_id: shard_id for local_id, shard_id, _ in rows
            }
            active_shard_ids.update(addition_shard_ids)
            for local_id in deleted_locals:
                shard_id = local_to_shard[local_id]
                if shard_id not in active_shard_ids:
                    raise MaterializationError(
                        f"{label} deletes shard clause {shard_id} that "
                        "the shard reconstruction has no longer active"
                    )
                active_shard_ids.remove(shard_id)
            next_shard_addition += observed_counts.additions
            parsed_checkpoints.pop(start_index, None)
        if expected_start != last_end:
            raise MaterializationError(
                f"{shard_key} windows do not end at checkpoint {last_end}"
            )

    terminal_cnf = checkpoint_cnf(len(checkpoints) - 1)
    if not any(not clause for clause in terminal_cnf.clauses):
        raise MaterializationError(
            "terminal checkpoint does not contain the empty clause"
        )
    return payload


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument(
        "--package",
        type=Path,
        help="verified two-shard package directory to window",
    )
    mode.add_argument(
        "--verify-package",
        type=Path,
        help="recompute a windowed package's hashes and invariants",
    )
    parser.add_argument("--output-dir", type=Path)
    parser.add_argument(
        "--max-actions",
        type=int,
        default=DEFAULT_MAX_ACTIONS,
        help="maximum whole-line LRAT actions per window",
    )
    parser.add_argument(
        "--max-lrat-bytes",
        type=int,
        default=DEFAULT_MAX_LRAT_BYTES,
        help="maximum rebased LRAT bytes per window",
    )
    args = parser.parse_args()
    if args.verify_package is not None:
        if args.output_dir is not None:
            parser.error(
                "--verify-package cannot be combined with --output-dir"
            )
        try:
            payload = verify_windowed_package(args.verify_package)
        except (MaterializationError, OSError, KeyError, TypeError) as exc:
            parser.error(str(exc))
        print(
            json.dumps(
                {
                    "status": "VERIFIED",
                    "package_dir": str(args.verify_package.resolve()),
                    "package_sha256": payload["package_sha256"],
                    "windows": payload["counts"]["windows"],
                    "checkpoints": payload["counts"]["checkpoints"],
                },
                indent=2,
                sort_keys=True,
            )
        )
        return 0
    if args.output_dir is None:
        parser.error("windowing requires --output-dir")
    try:
        payload = materialize_windows(
            package_dir=args.package,
            output_dir=args.output_dir,
            max_actions=args.max_actions,
            max_lrat_bytes=args.max_lrat_bytes,
        )
    except (MaterializationError, OSError) as exc:
        parser.error(str(exc))
    print(
        json.dumps(
            {
                "status": payload["epistemic_status"],
                "output_dir": str(args.output_dir.resolve()),
                "caps": payload["caps"],
                "windows": {
                    "shard_1": payload["counts"]["shard_1"]["windows"],
                    "shard_2": payload["counts"]["shard_2"]["windows"],
                },
                "checkpoints": payload["counts"]["checkpoints"],
                "max_checkpoint_bytes": (
                    payload["counts"]["max_checkpoint_bytes"]
                ),
                "package_sha256": payload["package_sha256"],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
