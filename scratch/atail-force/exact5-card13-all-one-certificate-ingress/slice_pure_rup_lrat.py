#!/usr/bin/env python3
"""Slice a pure-RUP LRAT proof to the final empty-clause dependency DAG.

Deletion records are omitted: keeping clauses live longer cannot invalidate a
RUP derivation.  The default output densely renumbers retained derived clauses
because Lean 4.27's verified checker indexes additions by insertion position,
not by the syntactic action identifier.  Clause literals and the order of RUP
hints are preserved exactly; only derived identifiers are rewritten.  A
diagnostic ``--preserve-ids`` mode copies retained additions byte-for-byte, but
its sparse IDs are not accepted by that checker.

This tool is intentionally fail-closed.  It rejects RAT/negative hints,
references to unseen derived clauses, derived literals using variables outside
the DIMACS header, malformed records, duplicate or unordered derived IDs,
multiple/missing/nonterminal empty clauses, and input hash drift.
"""

from __future__ import annotations

import argparse
from array import array
import hashlib
import json
import mmap
import os
from pathlib import Path
from typing import Any


SCHEMA = "p97-pure-rup-lrat-backward-slice-v1"


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def checked_hash(path: Path, expected: str, label: str) -> str:
    actual = sha256(path)
    if actual != expected.lower():
        raise ValueError(
            f"{label} SHA-256 drift: expected {expected.lower()}, got {actual}"
        )
    return actual


def parse_dimacs(cnf: Path) -> dict[str, int]:
    variables: int | None = None
    declared_clauses: int | None = None
    actual_clauses = 0
    max_variable = 0
    with cnf.open("rb") as stream:
        for line_number, raw in enumerate(stream, start=1):
            fields = raw.strip().split()
            if not fields or fields[0] == b"c":
                continue
            if fields[0] == b"p":
                if variables is not None:
                    raise ValueError(f"{cnf}:{line_number}: duplicate DIMACS header")
                if len(fields) != 4 or fields[1] != b"cnf":
                    raise ValueError(f"{cnf}:{line_number}: malformed DIMACS header")
                variables = int(fields[2])
                declared_clauses = int(fields[3])
                if variables < 0 or declared_clauses < 0:
                    raise ValueError(f"{cnf}:{line_number}: negative DIMACS bound")
                continue
            if variables is None or declared_clauses is None:
                raise ValueError(f"{cnf}:{line_number}: clause precedes header")
            values = [int(field) for field in fields]
            if not values or values[-1] != 0 or 0 in values[:-1]:
                raise ValueError(
                    f"{cnf}:{line_number}: expected one line-terminated DIMACS clause"
                )
            actual_clauses += 1
            if values[:-1]:
                max_variable = max(max_variable, max(abs(value) for value in values[:-1]))
            if max_variable > variables:
                raise ValueError(
                    f"{cnf}:{line_number}: literal exceeds declared variable bound"
                )
    if variables is None or declared_clauses is None:
        raise ValueError(f"{cnf}: missing DIMACS header")
    if actual_clauses != declared_clauses:
        raise ValueError(
            f"{cnf}: header declares {declared_clauses} clauses, found {actual_clauses}"
        )
    return {
        "variables": variables,
        "clauses": declared_clauses,
        "max_variable": max_variable,
    }


def parse_addition(
    fields: list[bytes],
    *,
    line_number: int,
    path: Path,
) -> tuple[int, list[int], list[int]]:
    if len(fields) < 4:
        raise ValueError(f"{path}:{line_number}: truncated LRAT addition")
    try:
        first_zero = fields.index(b"0", 1)
    except ValueError as error:
        raise ValueError(f"{path}:{line_number}: missing clause terminator") from error
    if fields[-1] != b"0" or fields.count(b"0") != 2:
        raise ValueError(f"{path}:{line_number}: malformed LRAT addition terminators")
    clause_id = int(fields[0])
    literals = [int(field) for field in fields[1:first_zero]]
    hints = [int(field) for field in fields[first_zero + 1 : -1]]
    if any(literal == 0 for literal in literals):
        raise ValueError(f"{path}:{line_number}: zero inside LRAT clause")
    if not hints:
        raise ValueError(f"{path}:{line_number}: addition has no RUP hints")
    return clause_id, literals, hints


def validate_and_index_lrat(
    lrat: Path,
    *,
    cnf_variables: int,
    cnf_clauses: int,
) -> tuple[dict[str, int], array, array]:
    addition_offsets = array("Q")
    addition_lengths = array("I")
    seen_derived: set[int] = set()
    last_addition_id = cnf_clauses
    additions = 0
    deletions = 0
    comments = 0
    original_hints = 0
    derived_hints = 0
    max_derived_variable = 0
    empty_clause_id: int | None = None
    last_semantic_record = ""

    with lrat.open("rb") as stream:
        with mmap.mmap(stream.fileno(), 0, access=mmap.ACCESS_READ) as mapped:
            cursor = 0
            line_number = 0
            size = len(mapped)
            while cursor < size:
                line_number += 1
                start = cursor
                newline = mapped.find(b"\n", cursor)
                cursor = size if newline < 0 else newline + 1
                raw = mapped[start:cursor]
                stripped = raw.strip()
                if not stripped:
                    continue
                fields = stripped.split()
                if fields[0] == b"c":
                    comments += 1
                    continue
                last_semantic_record = (
                    "deletion" if len(fields) > 1 and fields[1] == b"d" else "addition"
                )
                if len(fields) > 1 and fields[1] == b"d":
                    if len(fields) < 4 or fields[-1] != b"0" or fields.count(b"0") != 1:
                        raise ValueError(f"{lrat}:{line_number}: malformed deletion record")
                    deletion_epoch = int(fields[0])
                    if deletion_epoch > last_addition_id:
                        raise ValueError(
                            f"{lrat}:{line_number}: deletion epoch {deletion_epoch} "
                            f"exceeds last addition {last_addition_id}"
                        )
                    for field in fields[2:-1]:
                        target = int(field)
                        if target <= 0:
                            raise ValueError(
                                f"{lrat}:{line_number}: nonpositive deletion target {target}"
                            )
                        if target > cnf_clauses and target not in seen_derived:
                            raise ValueError(
                                f"{lrat}:{line_number}: deletion names unseen clause {target}"
                            )
                    deletions += 1
                    continue

                clause_id, literals, hints = parse_addition(
                    fields, line_number=line_number, path=lrat
                )
                if clause_id <= cnf_clauses:
                    raise ValueError(
                        f"{lrat}:{line_number}: derived ID {clause_id} shadows input clauses"
                    )
                if clause_id <= last_addition_id or clause_id in seen_derived:
                    raise ValueError(
                        f"{lrat}:{line_number}: duplicate or unordered derived ID {clause_id}"
                    )
                if empty_clause_id is not None:
                    raise ValueError(
                        f"{lrat}:{line_number}: addition follows empty clause {empty_clause_id}"
                    )
                for literal in literals:
                    variable = abs(literal)
                    max_derived_variable = max(max_derived_variable, variable)
                    if variable > cnf_variables:
                        raise ValueError(
                            f"{lrat}:{line_number}: extension variable {variable} exceeds "
                            f"DIMACS bound {cnf_variables}"
                        )
                for hint in hints:
                    if hint <= 0:
                        kind = "RAT/negative" if hint < 0 else "zero"
                        raise ValueError(
                            f"{lrat}:{line_number}: {kind} hint {hint}; pure RUP required"
                        )
                    if hint <= cnf_clauses:
                        original_hints += 1
                    elif hint in seen_derived:
                        derived_hints += 1
                    else:
                        raise ValueError(
                            f"{lrat}:{line_number}: unseen/future derived hint {hint}"
                        )
                if not literals:
                    empty_clause_id = clause_id
                seen_derived.add(clause_id)
                last_addition_id = clause_id
                additions += 1
                addition_offsets.append(start)
                addition_lengths.append(cursor - start)

    if empty_clause_id is None:
        raise ValueError(f"{lrat}: no derived empty clause")
    if last_semantic_record != "addition":
        raise ValueError(f"{lrat}: final semantic record is not the empty-clause addition")
    return (
        {
            "additions": additions,
            "deletions": deletions,
            "comments": comments,
            "original_hint_occurrences": original_hints,
            "derived_hint_occurrences": derived_hints,
            "max_derived_variable": max_derived_variable,
            "final_empty_clause_id": empty_clause_id,
            "last_addition_id": last_addition_id,
        },
        addition_offsets,
        addition_lengths,
    )


def slice_lrat(
    lrat: Path,
    output: Path,
    *,
    cnf_clauses: int,
    final_empty_clause_id: int,
    addition_offsets: array,
    addition_lengths: array,
    dense_renumber: bool,
) -> dict[str, int | str | float]:
    needed = {final_empty_clause_id}
    found: set[int] = set()
    retained_offsets = array("Q")
    retained_lengths = array("I")

    with lrat.open("rb") as stream:
        with mmap.mmap(stream.fileno(), 0, access=mmap.ACCESS_READ) as mapped:
            for offset, length in zip(
                reversed(addition_offsets), reversed(addition_lengths), strict=True
            ):
                raw = mapped[offset : offset + length]
                fields = raw.strip().split()
                clause_id, _, hints = parse_addition(fields, line_number=0, path=lrat)
                if clause_id not in needed:
                    continue
                found.add(clause_id)
                retained_offsets.append(offset)
                retained_lengths.append(length)
                for hint in hints:
                    if hint > cnf_clauses:
                        needed.add(hint)

            missing = needed - found
            if missing:
                sample = sorted(missing)[:10]
                raise ValueError(
                    f"{lrat}: backward closure has {len(missing)} missing derived records; "
                    f"first IDs {sample}"
                )

            old_to_new: dict[int, int] = {}
            if dense_renumber:
                next_id = cnf_clauses + 1
                for offset, length in zip(
                    reversed(retained_offsets), reversed(retained_lengths), strict=True
                ):
                    fields = mapped[offset : offset + length].strip().split()
                    old_id = int(fields[0])
                    if old_id in old_to_new:
                        raise ValueError(f"{lrat}: duplicate retained ID {old_id}")
                    old_to_new[old_id] = next_id
                    next_id += 1

            output.parent.mkdir(parents=True, exist_ok=True)
            temporary = output.with_name(output.name + ".tmp")
            output_digest = hashlib.sha256()
            output_bytes = 0
            with temporary.open("wb") as target:
                for offset, length in zip(
                    reversed(retained_offsets), reversed(retained_lengths), strict=True
                ):
                    raw = mapped[offset : offset + length]
                    if dense_renumber:
                        fields = raw.strip().split()
                        old_id, _, hints = parse_addition(fields, line_number=0, path=lrat)
                        first_zero = fields.index(b"0", 1)
                        rewritten_hints: list[bytes] = []
                        for hint in hints:
                            if hint <= cnf_clauses:
                                rewritten_hints.append(str(hint).encode("ascii"))
                            else:
                                try:
                                    rewritten_hints.append(
                                        str(old_to_new[hint]).encode("ascii")
                                    )
                                except KeyError as error:
                                    raise ValueError(
                                        f"{lrat}: retained clause {old_id} has unmapped "
                                        f"derived hint {hint}"
                                    ) from error
                        rewritten = b" ".join(
                            [str(old_to_new[old_id]).encode("ascii")]
                            + fields[1 : first_zero + 1]
                            + rewritten_hints
                            + [b"0"]
                        ) + b"\n"
                    else:
                        rewritten = raw
                    target.write(rewritten)
                    output_digest.update(rewritten)
                    output_bytes += len(rewritten)
                target.flush()
                os.fsync(target.fileno())
            os.replace(temporary, output)

    input_bytes = lrat.stat().st_size
    retained = len(retained_offsets)
    if dense_renumber:
        first_output_id = cnf_clauses + 1
        last_output_id = cnf_clauses + retained
    else:
        with lrat.open("rb") as stream:
            with mmap.mmap(stream.fileno(), 0, access=mmap.ACCESS_READ) as mapped:
                first_raw = mapped[
                    retained_offsets[-1] : retained_offsets[-1] + retained_lengths[-1]
                ]
                last_raw = mapped[
                    retained_offsets[0] : retained_offsets[0] + retained_lengths[0]
                ]
                first_output_id = int(first_raw.strip().split()[0])
                last_output_id = int(last_raw.strip().split()[0])
    return {
        "retained_additions": retained,
        "needed_derived_clauses": len(needed),
        "first_output_derived_id": first_output_id,
        "last_output_derived_id": last_output_id,
        "output_bytes": output_bytes,
        "output_sha256": output_digest.hexdigest(),
        "removed_bytes": input_bytes - output_bytes,
        "byte_reduction_fraction": (input_bytes - output_bytes) / input_bytes,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--lrat", type=Path, required=True)
    parser.add_argument("--output-lrat", type=Path, required=True)
    parser.add_argument("--output-manifest", type=Path, required=True)
    parser.add_argument("--expected-cnf-sha256", required=True)
    parser.add_argument("--expected-lrat-sha256", required=True)
    parser.add_argument(
        "--preserve-ids",
        action="store_true",
        help="diagnostic byte-preserving mode; sparse output is not Lean-4.27 compatible",
    )
    args = parser.parse_args()

    for path in (args.cnf, args.lrat):
        if not path.is_file():
            raise FileNotFoundError(path)
    if args.output_lrat.resolve() == args.lrat.resolve():
        raise ValueError("refusing to overwrite the input LRAT")

    cnf_hash = checked_hash(args.cnf, args.expected_cnf_sha256, "CNF")
    lrat_hash = checked_hash(args.lrat, args.expected_lrat_sha256, "LRAT")
    cnf_info = parse_dimacs(args.cnf)
    validation, offsets, lengths = validate_and_index_lrat(
        args.lrat,
        cnf_variables=cnf_info["variables"],
        cnf_clauses=cnf_info["clauses"],
    )
    sliced = slice_lrat(
        args.lrat,
        args.output_lrat,
        cnf_clauses=cnf_info["clauses"],
        final_empty_clause_id=validation["final_empty_clause_id"],
        addition_offsets=offsets,
        addition_lengths=lengths,
        dense_renumber=not args.preserve_ids,
    )
    manifest: dict[str, Any] = {
        "schema": SCHEMA,
        "mode": (
            "byte-preserving-original-ids-drop-deletions"
            if args.preserve_ids
            else "dense-derived-ids-drop-deletions"
        ),
        "pure_rup": True,
        "renumbered": not args.preserve_ids,
        "cnf": {
            "path": str(args.cnf),
            "bytes": args.cnf.stat().st_size,
            "sha256": cnf_hash,
            **cnf_info,
        },
        "input_lrat": {
            "path": str(args.lrat),
            "bytes": args.lrat.stat().st_size,
            "sha256": lrat_hash,
        },
        "validation": validation,
        "slice": {
            "path": str(args.output_lrat),
            **sliced,
        },
    }
    args.output_manifest.parent.mkdir(parents=True, exist_ok=True)
    manifest_temporary = args.output_manifest.with_name(args.output_manifest.name + ".tmp")
    manifest_temporary.write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    os.replace(manifest_temporary, args.output_manifest)
    print(json.dumps(manifest, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
