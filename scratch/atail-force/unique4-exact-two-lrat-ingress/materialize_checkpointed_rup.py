#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Materialize a hash-bound two-shard pure-RUP package.

The input LRAT must already use dense append numbering: base clauses have ids
``1..N`` and additions have ids ``N+1, N+2, ...``.  The first output shard
retains those ids.  Immediately before a selected addition, the active formula
is serialized in increasing global-id order and rebased to local ids
``1..K``.  The second shard translates every hint and deletion to those local
ids and numbers new additions ``K+1, K+2, ...``.

This program checks only the materialization invariants.  In particular, it
rejects RAT hints and references to inactive clauses, but it does not decide
RUP.  Soundness comes from replaying both outputs with ``CheckpointedRup.lean``.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
import hashlib
import json
import os
from pathlib import Path
import shutil
import tempfile
from typing import Any, BinaryIO, Iterable


SCHEMA = "p97-checkpointed-pure-rup-package-v1"
EXPECTED_SOURCE_SCHEMA = (
    "p97-unique4-exact-two-trimmed-reduced-core-certificate-v1"
)
HERE = Path(__file__).resolve().parent
CHECKER = (
    HERE.parent.parent.parent
    / "lean"
    / "Erdos9796Proof"
    / "P97"
    / "Certificate"
    / "CheckpointedRup.lean"
).resolve()


class MaterializationError(ValueError):
    """An input failed a fail-closed materialization invariant."""


@dataclass(frozen=True)
class Cnf:
    variable_count: int
    clauses: tuple[tuple[int, ...], ...]


@dataclass
class ActionCounts:
    lines: int = 0
    additions: int = 0
    deletions: int = 0
    deleted_ids: int = 0
    hints: int = 0

    def as_json(self) -> dict[str, int]:
        return {
            "lines": self.lines,
            "additions": self.additions,
            "deletions": self.deletions,
            "deleted_ids": self.deleted_ids,
            "hints": self.hints,
        }


class DigestWriter:
    """Binary writer that records the exact artifact digest and size."""

    def __init__(self, path: Path):
        self.path = path
        self._stream: BinaryIO = path.open("xb")
        self._digest = hashlib.sha256()
        self.byte_count = 0

    def write(self, text: str) -> None:
        try:
            payload = text.encode("ascii")
        except UnicodeEncodeError as exc:
            raise MaterializationError(
                f"non-ASCII output for {self.path.name}"
            ) from exc
        self._stream.write(payload)
        self._digest.update(payload)
        self.byte_count += len(payload)

    def line(self, text: str) -> None:
        self.write(text + "\n")

    def close(self) -> None:
        self._stream.close()

    def record(self) -> dict[str, Any]:
        return {
            "path": self.path.name,
            "sha256": self._digest.hexdigest(),
            "byte_count": self.byte_count,
        }

    def __enter__(self) -> "DigestWriter":
        return self

    def __exit__(self, *_args: object) -> None:
        self.close()


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def artifact_record(path: Path, *, relative_path: str | None = None) -> dict[str, Any]:
    return {
        "path": relative_path if relative_path is not None else str(path),
        "sha256": sha256(path),
        "byte_count": path.stat().st_size,
    }


def parse_dimacs(path: Path) -> Cnf:
    """Parse a DIMACS CNF and reject header/count/range drift."""

    header: tuple[int, int] | None = None
    clauses: list[tuple[int, ...]] = []
    pending: list[int] = []
    pending_polarities: dict[int, int] = {}
    with path.open("r", encoding="ascii") as stream:
        for line_number, line in enumerate(stream, 1):
            stripped = line.strip()
            if not stripped or stripped.startswith("c"):
                continue
            fields = stripped.split()
            if fields[0] == "p":
                if header is not None:
                    raise MaterializationError("duplicate DIMACS header")
                if len(fields) != 4 or fields[1] != "cnf":
                    raise MaterializationError(
                        f"malformed DIMACS header on line {line_number}"
                    )
                try:
                    variable_count = int(fields[2])
                    clause_count = int(fields[3])
                except ValueError as exc:
                    raise MaterializationError(
                        f"non-integer DIMACS header on line {line_number}"
                    ) from exc
                if variable_count <= 0 or clause_count <= 0:
                    raise MaterializationError(
                        "DIMACS counts must both be positive"
                    )
                header = (variable_count, clause_count)
                continue
            if header is None:
                raise MaterializationError(
                    f"DIMACS clause precedes header on line {line_number}"
                )
            for field in fields:
                try:
                    literal = int(field)
                except ValueError as exc:
                    raise MaterializationError(
                        f"non-integer DIMACS token on line {line_number}"
                    ) from exc
                if literal == 0:
                    clauses.append(tuple(pending))
                    pending.clear()
                    pending_polarities.clear()
                else:
                    if abs(literal) > header[0]:
                        raise MaterializationError(
                            f"DIMACS literal out of range on line {line_number}"
                        )
                    variable = abs(literal)
                    polarity = 1 if literal > 0 else -1
                    previous = pending_polarities.get(variable)
                    if previous == polarity:
                        raise MaterializationError(
                            f"duplicate DIMACS literal on line {line_number}"
                        )
                    if previous is not None:
                        raise MaterializationError(
                            f"tautological DIMACS clause on line {line_number}"
                        )
                    pending_polarities[variable] = polarity
                    pending.append(literal)
    if header is None:
        raise MaterializationError("missing DIMACS header")
    if pending:
        raise MaterializationError("unterminated final DIMACS clause")
    if len(clauses) != header[1]:
        raise MaterializationError(
            f"DIMACS clause count drift: header {header[1]}, parsed "
            f"{len(clauses)}"
        )
    return Cnf(header[0], tuple(clauses))


def render_cnf(writer: DigestWriter, cnf: Cnf) -> None:
    writer.line(f"p cnf {cnf.variable_count} {len(cnf.clauses)}")
    for clause in cnf.clauses:
        writer.line(" ".join([*(str(literal) for literal in clause), "0"]))


def parse_positive_ids(
    fields: list[str],
    *,
    line_number: int,
    what: str,
) -> list[int]:
    answer: list[int] = []
    for field in fields:
        try:
            value = int(field)
        except ValueError as exc:
            raise MaterializationError(
                f"non-integer {what} on LRAT line {line_number}"
            ) from exc
        if value <= 0:
            raise MaterializationError(
                f"non-positive {what} on LRAT line {line_number}"
            )
        answer.append(value)
    return answer


def parse_addition(
    fields: list[str],
    *,
    line_number: int,
    variable_count: int,
) -> tuple[int, tuple[int, ...], list[int]]:
    try:
        action_id = int(fields[0])
    except ValueError as exc:
        raise MaterializationError(
            f"non-integer addition id on LRAT line {line_number}"
        ) from exc
    if action_id <= 0:
        raise MaterializationError(
            f"non-positive addition id on LRAT line {line_number}"
        )
    zero_positions = [i for i, field in enumerate(fields) if field == "0"]
    if len(zero_positions) != 2 or zero_positions[-1] != len(fields) - 1:
        raise MaterializationError(
            f"addition must contain exactly two terminators on LRAT line "
            f"{line_number}"
        )
    clause_end, hint_end = zero_positions
    if clause_end == 0 or hint_end <= clause_end:
        raise MaterializationError(
            f"malformed addition on LRAT line {line_number}"
        )
    clause: list[int] = []
    polarities: dict[int, int] = {}
    for field in fields[1:clause_end]:
        try:
            literal = int(field)
        except ValueError as exc:
            raise MaterializationError(
                f"non-integer clause literal on LRAT line {line_number}"
            ) from exc
        if literal == 0 or abs(literal) > variable_count:
            raise MaterializationError(
                f"clause literal out of range on LRAT line {line_number}"
            )
        variable = abs(literal)
        polarity = 1 if literal > 0 else -1
        previous = polarities.get(variable)
        if previous == polarity:
            raise MaterializationError(
                f"duplicate addition literal on LRAT line {line_number}"
            )
        if previous is not None:
            raise MaterializationError(
                f"tautological addition on LRAT line {line_number}"
            )
        polarities[variable] = polarity
        clause.append(literal)
    hints = parse_positive_ids(
        fields[clause_end + 1 : hint_end],
        line_number=line_number,
        what="RUP hint",
    )
    if not hints:
        raise MaterializationError(
            f"addition has no RUP hints on LRAT line {line_number}"
        )
    return action_id, tuple(clause), hints


def parse_deletion(
    fields: list[str],
    *,
    line_number: int,
) -> tuple[int, list[int]]:
    if len(fields) < 4 or fields[1] != "d" or fields[-1] != "0":
        raise MaterializationError(
            f"malformed deletion on LRAT line {line_number}"
        )
    if "0" in fields[2:-1]:
        raise MaterializationError(
            f"early deletion terminator on LRAT line {line_number}"
        )
    try:
        action_id = int(fields[0])
    except ValueError as exc:
        raise MaterializationError(
            f"non-integer deletion action id on LRAT line {line_number}"
        ) from exc
    if action_id <= 0:
        raise MaterializationError(
            f"non-positive deletion action id on LRAT line {line_number}"
        )
    deleted = parse_positive_ids(
        fields[2:-1],
        line_number=line_number,
        what="deleted clause id",
    )
    return action_id, deleted


def format_addition(
    action_id: int,
    clause: Iterable[int],
    hints: Iterable[int],
) -> str:
    return " ".join(
        [
            str(action_id),
            *(str(literal) for literal in clause),
            "0",
            *(str(hint) for hint in hints),
            "0",
        ]
    )


def format_deletion(ids: Iterable[int]) -> str:
    return " ".join(["1", "d", *(str(clause_id) for clause_id in ids), "0"])


def binding_hash(label: str, *digests: str) -> str:
    digest = hashlib.sha256()
    digest.update(label.encode("ascii"))
    digest.update(b"\0")
    for value in digests:
        if len(value) != 64:
            raise MaterializationError(f"malformed SHA-256 in {label} binding")
        digest.update(bytes.fromhex(value))
    return digest.hexdigest()


PACKAGE_DIGEST_KEYS = (
    "schema",
    "source",
    "numbering",
    "counts",
    "artifacts",
    "tools",
    "bindings",
    "materializer_invariants",
)


def without_provenance_paths(value: Any) -> Any:
    """Drop relocation-dependent paths while preserving hashed provenance."""

    if isinstance(value, dict):
        return {
            key: without_provenance_paths(item)
            for key, item in value.items()
            if key != "path"
        }
    if isinstance(value, list):
        return [without_provenance_paths(item) for item in value]
    return value


def compute_package_digest(payload: dict[str, Any]) -> str:
    """Hash the semantic package manifest independently of its location."""

    digest_payload = without_provenance_paths(
        {key: payload[key] for key in PACKAGE_DIGEST_KEYS}
    )
    return hashlib.sha256(
        json.dumps(
            digest_payload,
            separators=(",", ":"),
            sort_keys=True,
        ).encode("utf-8")
    ).hexdigest()


def verify_package(package_dir: Path) -> dict[str, Any]:
    """Recompute generated artifact hashes and the relocation-stable digest."""

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
    records = payload.get("artifacts")
    if not isinstance(records, dict):
        raise MaterializationError("package manifest has no artifacts object")
    for label, record in records.items():
        if not isinstance(record, dict):
            raise MaterializationError(f"malformed artifact record: {label}")
        relative = Path(str(record.get("path", "")))
        if (
            not relative.parts
            or relative.is_absolute()
            or ".." in relative.parts
        ):
            raise MaterializationError(
                f"unsafe package artifact path for {label}: {relative}"
            )
        path = package_dir / relative
        validate_expected_artifact(path, record, label=f"package artifact {label}")
    expected_digest = payload.get("package_sha256")
    actual_digest = compute_package_digest(payload)
    if expected_digest != actual_digest:
        raise MaterializationError("package SHA-256 drift")
    return payload


def validate_expected_artifact(
    path: Path,
    expected: dict[str, Any],
    *,
    label: str,
) -> None:
    if not path.is_file():
        raise MaterializationError(f"{label} is missing: {path}")
    if path.stat().st_size != int(expected["byte_count"]):
        raise MaterializationError(f"{label} byte-count drift: {path}")
    actual_hash = sha256(path)
    if actual_hash != str(expected["sha256"]):
        raise MaterializationError(f"{label} SHA-256 drift: {path}")


def materialize(
    *,
    cnf_path: Path,
    lrat_path: Path,
    output_dir: Path,
    second_shard_first_addition: int,
    source_certificate: dict[str, Any] | None = None,
    source_certificate_record: dict[str, Any] | None = None,
    checker_path: Path | None = CHECKER,
) -> dict[str, Any]:
    """Stream one normalized LRAT into a deterministic two-shard package."""

    cnf_path = cnf_path.resolve()
    lrat_path = lrat_path.resolve()
    output_dir = output_dir.resolve()
    if output_dir.exists():
        raise MaterializationError(
            f"refusing to overwrite existing output directory: {output_dir}"
        )
    if second_shard_first_addition <= 1:
        raise MaterializationError(
            "--second-shard-first-addition must be greater than one"
        )

    cnf = parse_dimacs(cnf_path)
    base_clause_count = len(cnf.clauses)
    if second_shard_first_addition <= base_clause_count + 1:
        raise MaterializationError(
            "the first shard must contain at least one addition"
        )

    output_dir.parent.mkdir(parents=True, exist_ok=True)
    stage = Path(
        tempfile.mkdtemp(
            prefix=f".{output_dir.name}.stage-",
            dir=output_dir.parent,
        )
    )
    start_path = stage / "start.cnf"
    first_path = stage / "shard-1.lrat"
    checkpoint_path = stage / "checkpoint.cnf"
    checkpoint_map_path = stage / "checkpoint-map.tsv"
    second_path = stage / "shard-2.lrat"
    manifest_path = stage / "manifest.json"

    active: dict[int, tuple[int, ...]] = {
        clause_id: clause
        for clause_id, clause in enumerate(cnf.clauses, 1)
    }
    global_to_local: dict[int, int] | None = None
    first_counts = ActionCounts()
    second_counts = ActionCounts()
    source_digest = hashlib.sha256()
    source_byte_count = 0
    total_lines = 0
    total_additions = 0
    total_deletions = 0
    total_deleted_ids = 0
    total_hints = 0
    peak_active_clause_count = len(active)
    terminal_empty_global_ids: list[int] = []
    split_source_line: int | None = None
    split_source_byte_offset: int | None = None
    checkpoint_active_global_ids: list[int] | None = None
    checkpoint_record: dict[str, Any] | None = None
    checkpoint_map_record: dict[str, Any] | None = None

    try:
        with (
            DigestWriter(start_path) as start_writer,
            DigestWriter(first_path) as first_writer,
            DigestWriter(second_path) as second_writer,
        ):
            render_cnf(start_writer, cnf)
            with lrat_path.open("rb") as source:
                for line_number, raw_line in enumerate(source, 1):
                    byte_offset_before_line = source_byte_count
                    total_lines += 1
                    source_digest.update(raw_line)
                    source_byte_count += len(raw_line)
                    if not raw_line.endswith(b"\n") or b"\r" in raw_line:
                        raise MaterializationError(
                            f"LRAT line {line_number} is not LF-terminated ASCII"
                        )
                    try:
                        line = raw_line.decode("ascii")
                    except UnicodeDecodeError as exc:
                        raise MaterializationError(
                            f"non-ASCII LRAT line {line_number}"
                        ) from exc
                    fields = line.split()
                    if len(fields) < 2:
                        raise MaterializationError(
                            f"blank or malformed LRAT line {line_number}"
                        )

                    if fields[1] == "d":
                        if terminal_empty_global_ids:
                            raise MaterializationError(
                                f"action follows the empty clause on LRAT line "
                                f"{line_number}"
                            )
                        _action_id, deleted = parse_deletion(
                            fields,
                            line_number=line_number,
                        )
                        if _action_id != 1:
                            raise MaterializationError(
                                f"noncanonical deletion action id on LRAT line "
                                f"{line_number}"
                            )
                        if len(set(deleted)) != len(deleted):
                            raise MaterializationError(
                                f"duplicate id within deletion on LRAT line "
                                f"{line_number}"
                            )
                        if line[:-1] != format_deletion(deleted):
                            raise MaterializationError(
                                f"noncanonical deletion spelling on LRAT line "
                                f"{line_number}"
                            )
                        current_max_id = base_clause_count + total_additions
                        for clause_id in deleted:
                            if clause_id > current_max_id:
                                raise MaterializationError(
                                    f"deletion references unseen clause "
                                    f"{clause_id} on LRAT line {line_number}"
                                )
                            if clause_id not in active:
                                raise MaterializationError(
                                    f"deletion references inactive clause "
                                    f"{clause_id} on LRAT line {line_number}"
                                )
                            active.pop(clause_id)
                        total_deletions += 1
                        total_deleted_ids += len(deleted)
                        target_counts = (
                            first_counts
                            if global_to_local is None
                            else second_counts
                        )
                        target_counts.lines += 1
                        target_counts.deletions += 1
                        target_counts.deleted_ids += len(deleted)
                        if global_to_local is None:
                            first_writer.line(format_deletion(deleted))
                        else:
                            missing = [
                                clause_id
                                for clause_id in deleted
                                if clause_id not in global_to_local
                            ]
                            if missing:
                                raise MaterializationError(
                                    "second-shard deletion has no local mapping "
                                    f"for global clause ids {missing} on LRAT "
                                    f"line {line_number}"
                                )
                            translated = [
                                global_to_local[clause_id]
                                for clause_id in deleted
                            ]
                            second_writer.line(format_deletion(translated))
                        continue

                    action_id, clause, hints = parse_addition(
                        fields,
                        line_number=line_number,
                        variable_count=cnf.variable_count,
                    )
                    expected_id = base_clause_count + total_additions + 1
                    if action_id != expected_id:
                        raise MaterializationError(
                            f"non-dense addition id on LRAT line {line_number}: "
                            f"expected {expected_id}, got {action_id}"
                        )
                    if line[:-1] != format_addition(action_id, clause, hints):
                        raise MaterializationError(
                            f"noncanonical addition spelling on LRAT line "
                            f"{line_number}"
                        )
                    if terminal_empty_global_ids:
                        raise MaterializationError(
                            f"action follows the empty clause on LRAT line "
                            f"{line_number}"
                        )

                    if action_id == second_shard_first_addition:
                        split_source_line = line_number
                        split_source_byte_offset = byte_offset_before_line
                        checkpoint_active_global_ids = sorted(active)
                        global_to_local = {
                            global_id: local_id
                            for local_id, global_id in enumerate(
                                checkpoint_active_global_ids,
                                1,
                            )
                        }
                        checkpoint_cnf = Cnf(
                            cnf.variable_count,
                            tuple(
                                active[global_id]
                                for global_id in checkpoint_active_global_ids
                            ),
                        )
                        with DigestWriter(checkpoint_path) as checkpoint_writer:
                            render_cnf(checkpoint_writer, checkpoint_cnf)
                        checkpoint_record = checkpoint_writer.record()
                        with DigestWriter(
                            checkpoint_map_path
                        ) as checkpoint_map_writer:
                            checkpoint_map_writer.line("local_id\tglobal_id")
                            for global_id in checkpoint_active_global_ids:
                                checkpoint_map_writer.line(
                                    f"{global_to_local[global_id]}\t{global_id}"
                                )
                        checkpoint_map_record = checkpoint_map_writer.record()

                    for hint in hints:
                        if hint >= action_id:
                            raise MaterializationError(
                                f"RUP hint {hint} is not earlier than addition "
                                f"{action_id} on LRAT line {line_number}"
                            )
                        if hint not in active:
                            raise MaterializationError(
                                f"RUP hint {hint} is inactive on LRAT line "
                                f"{line_number}"
                            )

                    total_additions += 1
                    total_hints += len(hints)
                    active[action_id] = clause
                    if not clause:
                        if global_to_local is None:
                            raise MaterializationError(
                                f"empty clause occurs in shard 1 on LRAT line "
                                f"{line_number}"
                            )
                        terminal_empty_global_ids.append(action_id)
                    peak_active_clause_count = max(
                        peak_active_clause_count,
                        len(active),
                    )

                    if global_to_local is None:
                        first_writer.line(
                            format_addition(action_id, clause, hints)
                        )
                        first_counts.lines += 1
                        first_counts.additions += 1
                        first_counts.hints += len(hints)
                    else:
                        local_id = len(global_to_local) + 1
                        translated_hints = [
                            global_to_local[hint] for hint in hints
                        ]
                        second_writer.line(
                            format_addition(
                                local_id,
                                clause,
                                translated_hints,
                            )
                        )
                        global_to_local[action_id] = local_id
                        second_counts.lines += 1
                        second_counts.additions += 1
                        second_counts.hints += len(hints)

            if global_to_local is None:
                raise MaterializationError(
                    "selected second-shard first addition was not present"
                )
            if second_counts.additions == 0:
                raise MaterializationError(
                    "the second shard must contain at least one addition"
                )
            if not any(not clause for clause in active.values()):
                raise MaterializationError(
                    "final active formula does not contain the empty clause"
                )
            if len(terminal_empty_global_ids) != 1:
                raise MaterializationError(
                    "the source must derive exactly one empty clause"
                )

        source_lrat_record = {
            "path": str(lrat_path),
            "sha256": source_digest.hexdigest(),
            "byte_count": source_byte_count,
        }
        source_cnf_record = artifact_record(cnf_path)
        if source_certificate is not None:
            artifacts = source_certificate.get("artifacts")
            if not isinstance(artifacts, dict):
                raise MaterializationError(
                    "source certificate has no artifacts object"
                )
            expected_cnf = artifacts.get("trimmed_core_cnf")
            expected_lrat = artifacts.get("trimmed_lrat")
            if not isinstance(expected_cnf, dict) or not isinstance(
                expected_lrat,
                dict,
            ):
                raise MaterializationError(
                    "source certificate lacks trimmed CNF/LRAT records"
                )
            if (
                source_cnf_record["sha256"] != expected_cnf.get("sha256")
                or source_cnf_record["byte_count"]
                != int(expected_cnf.get("byte_count", -1))
            ):
                raise MaterializationError(
                    "source CNF does not match its certificate"
                )
            if (
                source_lrat_record["sha256"] != expected_lrat.get("sha256")
                or source_lrat_record["byte_count"]
                != int(expected_lrat.get("byte_count", -1))
            ):
                raise MaterializationError(
                    "source LRAT does not match its certificate"
                )

        first_record = artifact_record(
            first_path,
            relative_path=first_path.name,
        )
        second_record = artifact_record(
            second_path,
            relative_path=second_path.name,
        )
        start_record = artifact_record(
            start_path,
            relative_path=start_path.name,
        )
        assert checkpoint_record is not None
        assert checkpoint_map_record is not None
        assert checkpoint_active_global_ids is not None
        assert split_source_line is not None
        assert split_source_byte_offset is not None

        first_binding = binding_hash(
            "p97-checkpointed-rup-shard-1-v1",
            source_cnf_record["sha256"],
            first_record["sha256"],
        )
        checkpoint_binding = binding_hash(
            "p97-checkpointed-rup-checkpoint-v1",
            first_binding,
            checkpoint_record["sha256"],
            checkpoint_map_record["sha256"],
        )
        second_binding = binding_hash(
            "p97-checkpointed-rup-shard-2-v1",
            checkpoint_binding,
            second_record["sha256"],
        )

        payload: dict[str, Any] = {
            "schema": SCHEMA,
            "epistemic_status": (
                "STRUCTURALLY VALIDATED PURE-RUP SHARDS; LEAN REPLAY REQUIRED"
            ),
            "claim_scope": (
                "This package is a deterministic re-encoding of one hashed "
                "normalized pure-RUP proof. It is not itself a RUP proof "
                "check, a source-to-CNF bridge, or a production theorem."
            ),
            "source": {
                "certificate": source_certificate_record,
                "cnf": source_cnf_record,
                "normalized_lrat": source_lrat_record,
            },
            "numbering": {
                "base_clause_ids": [1, base_clause_count],
                "global_addition_ids": [
                    base_clause_count + 1,
                    base_clause_count + total_additions,
                ],
                "second_shard_first_global_addition": (
                    second_shard_first_addition
                ),
                "split_source_line": split_source_line,
                "split_source_byte_offset": split_source_byte_offset,
                "checkpoint_local_ids": [
                    1,
                    len(checkpoint_active_global_ids),
                ],
                "second_shard_first_local_addition": (
                    len(checkpoint_active_global_ids) + 1
                ),
                "checkpoint_order": "increasing_active_global_clause_id",
                "deletion_action_id": 1,
            },
            "counts": {
                "variable_count": cnf.variable_count,
                "base_clause_count": base_clause_count,
                "source_lines": total_lines,
                "additions": total_additions,
                "deletions": total_deletions,
                "deleted_ids": total_deleted_ids,
                "hints": total_hints,
                "peak_active_clause_count": peak_active_clause_count,
                "checkpoint_active_clause_count": (
                    len(checkpoint_active_global_ids)
                ),
                "final_active_clause_count": len(active),
                "terminal_empty_global_ids": terminal_empty_global_ids,
                "shard_1": first_counts.as_json(),
                "shard_2": second_counts.as_json(),
            },
            "artifacts": {
                "start_cnf": start_record,
                "shard_1_lrat": first_record,
                "checkpoint_cnf": checkpoint_record,
                "checkpoint_map": checkpoint_map_record,
                "shard_2_lrat": second_record,
            },
            "tools": {
                "materializer": artifact_record(Path(__file__).resolve()),
                "lean_checker": (
                    None
                    if checker_path is None
                    else artifact_record(checker_path.resolve())
                ),
            },
            "bindings": {
                "shard_1": first_binding,
                "checkpoint": checkpoint_binding,
                "shard_2": second_binding,
                "construction": (
                    "Each binding is SHA-256(label NUL predecessor/content "
                    "digests as raw 32-byte values)."
                ),
            },
            "materializer_invariants": [
                "The source certificate hash and its CNF/LRAT artifact hashes "
                "match when a source certificate is supplied.",
                "Base ids are 1..N and addition ids are dense append ids.",
                "Every addition has exactly two zero terminators.",
                "Every source and added clause has distinct variables and is "
                "non-tautological.",
                "Every hint is positive, earlier than its addition, and active.",
                "Every deletion names an active clause and repeated deletions "
                "are rejected.",
                "The checkpoint is the active clause list ordered by global id.",
                "The second shard translates every deletion and hint through "
                "one injective local-id map; missing mappings are rejected.",
                "The final active formula contains an empty clause.",
            ],
            "lean_replay": None,
        }
        payload["package_sha256"] = compute_package_digest(payload)
        manifest_text = json.dumps(
            payload,
            indent=2,
            sort_keys=True,
        ) + "\n"
        manifest_path.write_text(manifest_text, encoding="utf-8")
        os.replace(stage, output_dir)
        return payload
    except Exception:
        shutil.rmtree(stage, ignore_errors=True)
        raise


def load_source_certificate(
    certificate_path: Path,
) -> tuple[dict[str, Any], dict[str, Any], Path, Path]:
    certificate_path = certificate_path.resolve()
    try:
        certificate = json.loads(
            certificate_path.read_text(encoding="utf-8")
        )
    except (OSError, json.JSONDecodeError) as exc:
        raise MaterializationError(
            f"cannot read source certificate: {certificate_path}"
        ) from exc
    if certificate.get("schema") != EXPECTED_SOURCE_SCHEMA:
        raise MaterializationError(
            f"unexpected source certificate schema: "
            f"{certificate.get('schema')!r}"
        )
    artifacts = certificate.get("artifacts")
    if not isinstance(artifacts, dict):
        raise MaterializationError("source certificate has no artifacts object")
    cnf_record = artifacts.get("trimmed_core_cnf")
    lrat_record = artifacts.get("trimmed_lrat")
    if not isinstance(cnf_record, dict) or not isinstance(lrat_record, dict):
        raise MaterializationError(
            "source certificate lacks trimmed CNF/LRAT records"
        )
    def certificate_artifact_path(record: dict[str, Any]) -> Path:
        path = Path(str(record["path"]))
        if not path.is_absolute():
            path = certificate_path.parent / path
        return path.resolve()

    cnf_path = certificate_artifact_path(cnf_record)
    lrat_path = certificate_artifact_path(lrat_record)
    validate_expected_artifact(
        cnf_path,
        cnf_record,
        label="trimmed core CNF",
    )
    if not lrat_path.is_file():
        raise MaterializationError(
            f"normalized LRAT is missing: {lrat_path}"
        )
    if lrat_path.stat().st_size != int(lrat_record["byte_count"]):
        raise MaterializationError(
            f"normalized LRAT byte-count drift: {lrat_path}"
        )
    certificate_record = artifact_record(certificate_path)
    return certificate, certificate_record, cnf_path, lrat_path


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument(
        "--source-certificate",
        type=Path,
        help="trimmed-core certificate that hash-binds the CNF and LRAT",
    )
    mode.add_argument(
        "--verify-package",
        type=Path,
        help="recompute a package's generated artifact and manifest hashes",
    )
    parser.add_argument("--output-dir", type=Path)
    parser.add_argument(
        "--second-shard-first-addition",
        type=int,
        help="global addition id at which the rebased second shard starts",
    )
    args = parser.parse_args()
    if args.verify_package is not None:
        if (
            args.output_dir is not None
            or args.second_shard_first_addition is not None
        ):
            parser.error(
                "--verify-package cannot be combined with materialization "
                "arguments"
            )
        try:
            payload = verify_package(args.verify_package)
        except (MaterializationError, OSError) as exc:
            parser.error(str(exc))
        print(
            json.dumps(
                {
                    "status": "VERIFIED",
                    "package_dir": str(args.verify_package.resolve()),
                    "package_sha256": payload["package_sha256"],
                },
                indent=2,
                sort_keys=True,
            )
        )
        return 0
    if (
        args.output_dir is None
        or args.second_shard_first_addition is None
    ):
        parser.error(
            "materialization requires --output-dir and "
            "--second-shard-first-addition"
        )
    assert args.source_certificate is not None
    try:
        (
            certificate,
            certificate_record,
            cnf_path,
            lrat_path,
        ) = load_source_certificate(args.source_certificate)
        payload = materialize(
            cnf_path=cnf_path,
            lrat_path=lrat_path,
            output_dir=args.output_dir,
            second_shard_first_addition=args.second_shard_first_addition,
            source_certificate=certificate,
            source_certificate_record=certificate_record,
        )
    except (MaterializationError, OSError) as exc:
        parser.error(str(exc))
    print(
        json.dumps(
            {
                "status": payload["epistemic_status"],
                "output_dir": str(args.output_dir.resolve()),
                "checkpoint_active_clause_count": payload["counts"][
                    "checkpoint_active_clause_count"
                ],
                "shard_1_additions": payload["counts"]["shard_1"][
                    "additions"
                ],
                "shard_2_additions": payload["counts"]["shard_2"][
                    "additions"
                ],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
