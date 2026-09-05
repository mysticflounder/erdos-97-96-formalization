# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Extract and densely renumber a core witnessed by a raw drat-trim LRAT proof."""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from collections.abc import Iterable
from pathlib import Path
from typing import Any

import materialize_checkpointed_rup as rup


class CoreExtractionError(ValueError):
    """Raised when the purported core or proof custody is inconsistent."""


def sha256(path: Path) -> str:
    """Return the SHA-256 digest of one file without loading it in memory."""
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def canonical_json_bytes(value: object) -> bytes:
    """Encode a value using the repository's canonical JSON convention."""
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def clause_key(clause: Iterable[int]) -> tuple[int, ...]:
    """Normalize literal order while retaining multiplicity at the clause level."""
    return tuple(sorted(clause, key=lambda literal: (abs(literal), literal < 0)))


def parse_initial_deletion(raw_lrat_path: Path, base_count: int) -> tuple[int, ...]:
    """Read the raw LRAT's initial deletion of non-core input clauses."""
    with raw_lrat_path.open("r", encoding="ascii", newline="") as stream:
        raw_line = stream.readline()
    if not raw_line or not raw_line.endswith("\n") or "\r" in raw_line:
        raise CoreExtractionError("raw LRAT has no LF-terminated initial action")
    fields = raw_line.split()
    try:
        action_id, deleted = rup.parse_deletion(fields, line_number=1)
    except rup.MaterializationError as exc:
        raise CoreExtractionError(str(exc)) from exc
    if action_id != base_count:
        raise CoreExtractionError(
            f"initial deletion action id {action_id} does not equal base count {base_count}"
        )
    if len(set(deleted)) != len(deleted):
        raise CoreExtractionError("initial deletion contains duplicate clause ids")
    if any(clause_id > base_count for clause_id in deleted):
        raise CoreExtractionError("initial deletion contains a non-input clause id")
    return tuple(deleted)


def retained_input_ids(base_count: int, deleted: Iterable[int]) -> tuple[int, ...]:
    """Return the original input IDs retained by the LRAT core witness."""
    deleted_set = set(deleted)
    return tuple(clause_id for clause_id in range(1, base_count + 1) if clause_id not in deleted_set)


def validate_core_multiset(
    full_cnf: rup.Cnf,
    core_cnf: rup.Cnf,
    retained_ids: tuple[int, ...],
) -> None:
    """Check drat-trim's bare core against retained full-CNF clauses."""
    if full_cnf.variable_count != core_cnf.variable_count:
        raise CoreExtractionError("full and core DIMACS variable counts differ")
    expected = Counter(clause_key(full_cnf.clauses[index - 1]) for index in retained_ids)
    actual = Counter(clause_key(clause) for clause in core_cnf.clauses)
    if expected != actual:
        missing = sum((expected - actual).values())
        extra = sum((actual - expected).values())
        raise CoreExtractionError(
            f"core DIMACS clause multiset differs: missing={missing}, extra={extra}"
        )


def trace_input_ids(trace_path: Path, full_cnf: rup.Cnf) -> tuple[int, ...]:
    """Read original input IDs from a drat-trim TRACECHECK resolution graph."""
    answer: list[int] = []
    seen: set[int] = set()
    with trace_path.open("r", encoding="ascii", newline="") as stream:
        for line_number, raw_line in enumerate(stream, 1):
            if not raw_line.endswith("\n") or "\r" in raw_line:
                raise CoreExtractionError(
                    f"trace line {line_number} is not LF-terminated ASCII"
                )
            fields = raw_line.split()
            if not fields:
                continue
            try:
                values = [int(field) for field in fields]
            except ValueError as exc:
                raise CoreExtractionError(f"non-integer trace field on line {line_number}") from exc
            try:
                clause_end = values.index(0)
            except ValueError as exc:
                raise CoreExtractionError(f"trace line {line_number} has no clause terminator") from exc
            clause_id = values[0]
            if not 1 <= clause_id <= len(full_cnf.clauses):
                continue
            if clause_id in seen:
                raise CoreExtractionError(f"duplicate input id {clause_id} in trace")
            clause = tuple(values[1:clause_end])
            if clause_key(clause) != clause_key(full_cnf.clauses[clause_id - 1]):
                raise CoreExtractionError(f"trace clause for input id {clause_id} differs")
            seen.add(clause_id)
            answer.append(clause_id)
    return tuple(sorted(answer))


def render_dense_core(
    output_path: Path,
    full_cnf: rup.Cnf,
    retained_ids: tuple[int, ...],
) -> None:
    """Write retained full-CNF clauses in increasing original-ID order."""
    if output_path.exists():
        raise CoreExtractionError(f"refusing to overwrite: {output_path}")
    dense = rup.Cnf(
        full_cnf.variable_count,
        tuple(full_cnf.clauses[clause_id - 1] for clause_id in retained_ids),
    )
    with rup.DigestWriter(output_path) as writer:
        rup.render_cnf(writer, dense)


def render_core_map(
    output_path: Path,
    full_cnf: rup.Cnf,
    retained_ids: tuple[int, ...],
) -> None:
    """Write the dense-to-original input clause map as canonical JSON lines."""
    if output_path.exists():
        raise CoreExtractionError(f"refusing to overwrite: {output_path}")
    with output_path.open("xb") as stream:
        for dense_id, original_id in enumerate(retained_ids, 1):
            clause = full_cnf.clauses[original_id - 1]
            record = {
                "core_clause_id": dense_id,
                "original_clause_id": original_id,
                "literal_body_sha256": hashlib.sha256(
                    " ".join(map(str, clause)).encode("ascii")
                ).hexdigest(),
            }
            stream.write(canonical_json_bytes(record) + b"\n")


def render_dense_lrat(
    output_path: Path,
    raw_lrat_path: Path,
    variable_count: int,
    base_count: int,
    retained_ids: tuple[int, ...],
) -> dict[str, int]:
    """Drop the initial deletion and densely remap a strict pure-RUP proof."""
    if output_path.exists():
        raise CoreExtractionError(f"refusing to overwrite: {output_path}")
    id_map = {old_id: new_id for new_id, old_id in enumerate(retained_ids, 1)}
    active = set(retained_ids)
    additions = 0
    deletions = 0
    deleted_ids = 0
    hints_count = 0
    terminal_empty = False
    last_old_addition: int | None = None

    with raw_lrat_path.open("rb") as source, output_path.open("xb") as output:
        first = source.readline()
        if not first:
            raise CoreExtractionError("raw LRAT is empty")
        for line_number, raw_line in enumerate(source, 2):
            if terminal_empty:
                raise CoreExtractionError("LRAT action follows the empty clause")
            if not raw_line.endswith(b"\n") or b"\r" in raw_line:
                raise CoreExtractionError(
                    f"raw LRAT line {line_number} is not LF-terminated ASCII"
                )
            fields = raw_line.decode("ascii").split()
            try:
                if len(fields) >= 2 and fields[1] == "d":
                    action_id, old_deleted = rup.parse_deletion(
                        fields, line_number=line_number
                    )
                    if last_old_addition is not None and action_id != last_old_addition:
                        raise CoreExtractionError(
                            f"deletion action id drift on LRAT line {line_number}"
                        )
                    if len(set(old_deleted)) != len(old_deleted):
                        raise CoreExtractionError(
                            f"duplicate deletion id on LRAT line {line_number}"
                        )
                    if any(clause_id not in active for clause_id in old_deleted):
                        raise CoreExtractionError(
                            f"deletion references inactive clause on LRAT line {line_number}"
                        )
                    new_deleted = [id_map[clause_id] for clause_id in old_deleted]
                    for clause_id in old_deleted:
                        active.remove(clause_id)
                    rendered = rup.format_deletion(new_deleted)
                    deletions += 1
                    deleted_ids += len(old_deleted)
                else:
                    old_id, clause, old_hints = rup.parse_addition(
                        fields,
                        line_number=line_number,
                        variable_count=variable_count,
                    )
                    if old_id in id_map or old_id <= base_count:
                        raise CoreExtractionError(
                            f"reused addition id on LRAT line {line_number}"
                        )
                    if any(hint not in active for hint in old_hints):
                        raise CoreExtractionError(
                            f"RUP hint references inactive clause on LRAT line {line_number}"
                        )
                    new_id = len(retained_ids) + additions + 1
                    new_hints = [id_map[hint] for hint in old_hints]
                    id_map[old_id] = new_id
                    active.add(old_id)
                    last_old_addition = old_id
                    rendered = rup.format_addition(new_id, clause, new_hints)
                    additions += 1
                    hints_count += len(old_hints)
                    terminal_empty = not clause
            except rup.MaterializationError as exc:
                raise CoreExtractionError(str(exc)) from exc
            output.write(rendered.encode("ascii") + b"\n")
    if additions == 0 or not terminal_empty:
        raise CoreExtractionError("LRAT stream has no terminal empty-clause addition")
    return {
        "additions": additions,
        "deletions": deletions,
        "deleted_ids": deleted_ids,
        "hints": hints_count,
    }


def rup_hint_check(
    clause: tuple[int, ...],
    hints: list[int],
    active_clauses: dict[int, tuple[int, ...]],
    *,
    line_number: int,
) -> None:
    """Check one strict ordered RUP hint chain."""
    assignment = {abs(literal): literal < 0 for literal in clause}
    for hint_index, hint in enumerate(hints):
        try:
            reason = active_clauses[hint]
        except KeyError as exc:
            raise CoreExtractionError(
                f"RUP hint {hint} is inactive on dense LRAT line {line_number}"
            ) from exc
        unassigned: list[int] = []
        satisfied = False
        for literal in reason:
            value = assignment.get(abs(literal))
            if value is None:
                unassigned.append(literal)
            elif value == (literal > 0):
                satisfied = True
                break
        if satisfied or len(unassigned) > 1:
            raise CoreExtractionError(
                f"RUP hint {hint} is neither unit nor conflicting on line {line_number}"
            )
        if not unassigned:
            if hint_index != len(hints) - 1:
                raise CoreExtractionError(
                    f"RUP conflict has trailing hints on dense LRAT line {line_number}"
                )
            return
        unit = unassigned[0]
        assignment[abs(unit)] = unit > 0
    raise CoreExtractionError(f"RUP hints do not derive conflict on dense LRAT line {line_number}")


def validate_dense_rup(cnf_path: Path, lrat_path: Path) -> dict[str, int]:
    """Replay every dense pure-RUP hint chain against its active clause table."""
    cnf = rup.parse_dimacs(cnf_path)
    active_clauses = {
        clause_id: clause for clause_id, clause in enumerate(cnf.clauses, 1)
    }
    next_id = len(cnf.clauses) + 1
    additions = 0
    deletions = 0
    terminal_empty = False
    with lrat_path.open("r", encoding="ascii", newline="") as stream:
        for line_number, raw_line in enumerate(stream, 1):
            if terminal_empty:
                raise CoreExtractionError("dense LRAT action follows the empty clause")
            if not raw_line.endswith("\n") or "\r" in raw_line:
                raise CoreExtractionError(
                    f"dense LRAT line {line_number} is not LF-terminated ASCII"
                )
            fields = raw_line.split()
            try:
                if len(fields) >= 2 and fields[1] == "d":
                    action_id, deleted = rup.parse_deletion(fields, line_number=line_number)
                    if action_id != 1:
                        raise CoreExtractionError(
                            f"dense deletion action id must be 1 on line {line_number}"
                        )
                    if len(set(deleted)) != len(deleted):
                        raise CoreExtractionError(
                            f"duplicate dense deletion id on line {line_number}"
                        )
                    if any(clause_id not in active_clauses for clause_id in deleted):
                        raise CoreExtractionError(
                            f"dense deletion references inactive clause on line {line_number}"
                        )
                    for clause_id in deleted:
                        del active_clauses[clause_id]
                    deletions += 1
                else:
                    action_id, clause, hints = rup.parse_addition(
                        fields,
                        line_number=line_number,
                        variable_count=cnf.variable_count,
                    )
                    if action_id != next_id:
                        raise CoreExtractionError(
                            f"dense addition id {action_id} should be {next_id}"
                        )
                    rup_hint_check(
                        clause,
                        hints,
                        active_clauses,
                        line_number=line_number,
                    )
                    active_clauses[action_id] = clause
                    terminal_empty = not clause
                    next_id += 1
                    additions += 1
            except rup.MaterializationError as exc:
                raise CoreExtractionError(str(exc)) from exc
    if additions == 0 or not terminal_empty:
        raise CoreExtractionError("dense LRAT has no terminal empty-clause addition")
    return {"additions": additions, "deletions": deletions}


def extract_verified_core(
    *,
    full_cnf_path: Path,
    raw_lrat_path: Path,
    core_cnf_path: Path,
    output_cnf_path: Path,
    output_lrat_path: Path,
    output_map_path: Path,
    output_receipt_path: Path,
    trace_path: Path | None = None,
) -> dict[str, Any]:
    """Validate core witnesses and emit a dense CNF/LRAT pair plus custody map."""
    full_cnf = rup.parse_dimacs(full_cnf_path)
    core_cnf = rup.parse_dimacs(core_cnf_path)
    deleted = parse_initial_deletion(raw_lrat_path, len(full_cnf.clauses))
    retained = retained_input_ids(len(full_cnf.clauses), deleted)
    validate_core_multiset(full_cnf, core_cnf, retained)
    if trace_path is not None:
        traced = trace_input_ids(trace_path, full_cnf)
        if traced != retained:
            raise CoreExtractionError(
                f"trace input IDs differ from LRAT core: trace={len(traced)}, "
                f"lrat={len(retained)}"
            )

    output_cnf_path.parent.mkdir(parents=True, exist_ok=True)
    render_dense_core(output_cnf_path, full_cnf, retained)
    render_core_map(output_map_path, full_cnf, retained)
    lrat_counts = render_dense_lrat(
        output_lrat_path,
        raw_lrat_path,
        full_cnf.variable_count,
        len(full_cnf.clauses),
        retained,
    )
    replay_counts = validate_dense_rup(output_cnf_path, output_lrat_path)
    receipt: dict[str, Any] = {
        "schema": "lrat-verified-core-extraction/v1",
        "generator": {
            "path": str(Path(__file__).resolve()),
            "sha256": sha256(Path(__file__).resolve()),
        },
        "inputs": {
            "full_cnf": {"path": str(full_cnf_path), "sha256": sha256(full_cnf_path)},
            "raw_lrat": {"path": str(raw_lrat_path), "sha256": sha256(raw_lrat_path)},
            "core_cnf": {"path": str(core_cnf_path), "sha256": sha256(core_cnf_path)},
        },
        "outputs": {
            "dense_core_cnf": {
                "path": str(output_cnf_path),
                "sha256": sha256(output_cnf_path),
            },
            "dense_core_lrat": {
                "path": str(output_lrat_path),
                "sha256": sha256(output_lrat_path),
            },
            "core_clause_map": {
                "path": str(output_map_path),
                "sha256": sha256(output_map_path),
            },
        },
        "base_clause_count": len(full_cnf.clauses),
        "core_clause_count": len(retained),
        "initial_deleted_clause_count": len(deleted),
        "core_original_ids_sha256": hashlib.sha256(
            canonical_json_bytes(list(retained))
        ).hexdigest(),
        "lrat": lrat_counts,
        "dense_rup_replay": {"verified": True, **replay_counts},
    }
    if trace_path is not None:
        receipt["inputs"]["trace"] = {"path": str(trace_path), "sha256": sha256(trace_path)}
    if output_receipt_path.exists():
        raise CoreExtractionError(f"refusing to overwrite: {output_receipt_path}")
    receipt["receipt_sha256"] = hashlib.sha256(canonical_json_bytes(receipt)).hexdigest()
    output_receipt_path.write_bytes(canonical_json_bytes(receipt) + b"\n")
    return receipt


def main() -> int:
    """Run the verified-core extractor CLI."""
    parser = argparse.ArgumentParser()
    parser.add_argument("--full-cnf", type=Path, required=True)
    parser.add_argument("--raw-lrat", type=Path, required=True)
    parser.add_argument("--core-cnf", type=Path, required=True)
    parser.add_argument("--trace", type=Path)
    parser.add_argument("--out-cnf", type=Path, required=True)
    parser.add_argument("--out-lrat", type=Path, required=True)
    parser.add_argument("--out-map", type=Path, required=True)
    parser.add_argument("--receipt", type=Path, required=True)
    args = parser.parse_args()
    receipt = extract_verified_core(
        full_cnf_path=args.full_cnf,
        raw_lrat_path=args.raw_lrat,
        core_cnf_path=args.core_cnf,
        trace_path=args.trace,
        output_cnf_path=args.out_cnf,
        output_lrat_path=args.out_lrat,
        output_map_path=args.out_map,
        output_receipt_path=args.receipt,
    )
    print(
        json.dumps(
            {
                "core_clause_count": receipt["core_clause_count"],
                "lrat": receipt["lrat"],
                "receipt_sha256": receipt["receipt_sha256"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
