#!/usr/bin/env python3
"""Normalize LRAT ids when Lean's checker CNF has one extra padding clause.

`drat-trim` numbers lemmas relative to the unpadded core.  Lean's verified LRAT
checker bounds certificate literals by the maximum variable occurring in its
input CNF, so the generated Lean CNF appends one fresh tautological padding
clause.  The padding clause occupies one checker clause-array slot while being
discarded semantically by `Clause.ofArray`.

This normalizer therefore distinguishes:

* source base clauses: clause ids fixed by the core-relative LRAT; and
* checker base clauses: source clauses plus the fresh padding slot.

All additions and hints are retained, including RAT hints and deletions.  No
certificate literal is filtered by the original input-variable bound.
"""

from __future__ import annotations

import argparse
from pathlib import Path


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--source-base-clauses", type=int, required=True)
    parser.add_argument("--checker-base-clauses", type=int, required=True)
    args = parser.parse_args()
    if args.checker_base_clauses < args.source_base_clauses:
        parser.error("checker base cannot be smaller than source base")

    kept = 0
    deleted = 0
    max_certificate_variable = 0
    id_map: dict[int, int] = {}

    def remap_id(token: str, line_number: int) -> str:
        value = int(token)
        if value == 0:
            return token
        sign = -1 if value < 0 else 1
        old_id = abs(value)
        if old_id <= args.source_base_clauses:
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
                rewritten_ids: list[str] = []
                for token in fields[2:]:
                    if token == "0":
                        break
                    rewritten_ids.append(remap_id(token, line_number))
                target.write("1 d " + " ".join(rewritten_ids) + " 0\n")
                continue

            old_id = int(fields[0])
            if old_id in id_map:
                raise ValueError(f"duplicate lemma id {old_id} on line {line_number}")
            try:
                clause_end = fields.index("0", 1)
            except ValueError as exc:
                raise ValueError(
                    f"missing clause terminator on line {line_number}"
                ) from exc

            clause = [int(token) for token in fields[1:clause_end]]
            if any(literal == 0 for literal in clause):
                raise ValueError(f"zero literal in clause on line {line_number}")
            polarities = set(clause)
            if any(-literal in polarities for literal in polarities):
                raise ValueError(
                    f"tautological certificate clause on line {line_number}; "
                    "cannot retain it in Lean's filtered checker action stream"
                )
            max_certificate_variable = max(
                max_certificate_variable,
                max((abs(literal) for literal in clause), default=0),
            )

            new_id = args.checker_base_clauses + kept + 1
            rewritten = [str(new_id), *fields[1 : clause_end + 1]]
            rewritten.extend(
                remap_id(token, line_number)
                for token in fields[clause_end + 1 :]
            )
            target.write(" ".join(rewritten) + "\n")
            id_map[old_id] = new_id
            kept += 1

    print(
        f"kept_additions={kept} retained_deletions={deleted} "
        f"source_base_clauses={args.source_base_clauses} "
        f"checker_base_clauses={args.checker_base_clauses} "
        f"dense_id_range={args.checker_base_clauses + 1}.."
        f"{args.checker_base_clauses + kept} "
        f"max_certificate_variable={max_certificate_variable}"
    )


if __name__ == "__main__":
    main()
