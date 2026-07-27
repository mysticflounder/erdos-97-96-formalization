#!/usr/bin/env python3
"""Normalize an LRAT certificate for Lean 4.27's verified checker replay.

Lean 4.27 appends each checked lemma to its internal clause array and does not
use the lemma id carried by an LRAT addition.  `drat-trim`, however, preserves
sparse ids from the original DRAT proof.  This script relabels retained lemma
ids and every later hint to the dense append index expected by Lean.  Deletion
actions are retained because they can be load-bearing for RAT-hint
exhaustiveness; references to sparse, unretained lemmas are omitted.
"""

from __future__ import annotations

import argparse
from pathlib import Path


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument(
        "--base-clauses",
        type=int,
        required=True,
        help="number of clauses in the input DIMACS (ids 1..N remain fixed)",
    )
    parser.add_argument(
        "--max-variable",
        type=int,
        required=True,
        help="largest DIMACS variable accepted by the Lean CNF conversion",
    )
    parser.add_argument(
        "--drop-deletions",
        action="store_true",
        help="diagnostic only: omit all deletion actions",
    )
    args = parser.parse_args()

    kept = 0
    skipped_tautologies = 0
    skipped_out_of_range = 0
    deleted = 0
    id_map: dict[int, int] = {}

    def remap_hint(token: str, line_number: int) -> str:
        value = int(token)
        if value == 0:
            return token
        sign = -1 if value < 0 else 1
        old_id = abs(value)
        if old_id <= args.base_clauses:
            return token
        try:
            new_id = id_map[old_id]
        except KeyError as exc:
            raise ValueError(
                f"line {line_number} references unseen sparse lemma id {old_id}"
            ) from exc
        return str(sign * new_id)

    with args.input.open("r", encoding="ascii") as source, args.output.open(
        "w", encoding="ascii"
    ) as target:
        for line_number, line in enumerate(source, start=1):
            fields = line.split()
            if len(fields) < 2:
                raise ValueError(f"malformed LRAT line {line_number}")
            if fields[1] == "d":
                deleted += 1
                if args.drop_deletions:
                    continue
                rewritten_ids: list[str] = []
                for token in fields[2:]:
                    old_deleted_id = int(token)
                    if old_deleted_id == 0:
                        break
                    if old_deleted_id <= args.base_clauses:
                        rewritten_ids.append(token)
                    elif old_deleted_id in id_map:
                        rewritten_ids.append(str(id_map[old_deleted_id]))
                target.write("1 d " + " ".join(rewritten_ids) + " 0\n")
                continue

            old_id = int(fields[0])
            if old_id in id_map:
                raise ValueError(f"duplicate lemma id {old_id} on line {line_number}")

            try:
                clause_end = fields.index("0", 1)
            except ValueError as exc:
                raise ValueError(f"missing clause terminator on line {line_number}") from exc

            clause = [int(token) for token in fields[1:clause_end]]
            if any(literal == 0 or abs(literal) > args.max_variable for literal in clause):
                skipped_out_of_range += 1
                continue
            polarities: dict[int, int] = {}
            tautological = False
            for literal in clause:
                variable = abs(literal)
                polarity = 1 if literal > 0 else -1
                previous = polarities.setdefault(variable, polarity)
                if previous != polarity:
                    tautological = True
                    break
            if tautological:
                skipped_tautologies += 1
                continue

            new_id = args.base_clauses + kept + 1
            rewritten = [str(new_id), *fields[1 : clause_end + 1]]
            rewritten.extend(
                remap_hint(token, line_number) for token in fields[clause_end + 1 :]
            )
            target.write(" ".join(rewritten) + "\n")
            id_map[old_id] = new_id
            kept += 1

    print(
        f"kept_additions={kept} "
        f"skipped_tautologies={skipped_tautologies} "
        f"skipped_out_of_range={skipped_out_of_range} "
        f"{'removed' if args.drop_deletions else 'retained'}_deletions={deleted} "
        f"dense_id_range={args.base_clauses + 1}..{args.base_clauses + kept}"
    )


if __name__ == "__main__":
    main()
