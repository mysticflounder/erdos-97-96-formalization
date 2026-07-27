#!/usr/bin/env python3
"""Materialize the direct P4 membership-to-row compact occurrence bridge.

The input-core map gives the direct semantic parameters and terminal clause
order.  The compact occurrence ledger gives the dense literals actually kept
in the compact formula.  This script joins them by the three authenticated
provenance keys and writes a Lean data module without inventing a new order.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from dataclasses import dataclass, asdict
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
MAP_PATH = ROOT / "scratch/atail-force/unique4-exact-two-core-map/p4.input-core-map.json"
LEDGER_PATH = (
    ROOT
    / "scratch/atail-force/unique4-exact-two-core-map/generated"
    / "p4-seed0-compact/p4-seed0-compact-occurrences.jsonl"
)
CORE_PATH = HERE / "membership_row_data_core.lean"
OUT_PATH = HERE / "membership_row_data.lean"
FAMILY = "direct_memberships_imply_row_pattern"
EXPECTED_MAP_SHA256 = "af829a7c99e0f969f410d398d7c32c2ba5dd945f3a7ebb2ef3f8d7679633d64b"
EXPECTED_LEDGER_SHA256 = "b1c159058e659cbd06c4540e72e2ca94eef0ef27602733db0bc44122dcdb4aac"
EXPECTED_COUNT = 1265
CHUNK_SIZE = 100


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def lean_int_list(values: list[int]) -> str:
    return "[" + ", ".join(str(value) for value in values) + "]"


def lean_nat_list(values: list[int]) -> str:
    return "[" + ", ".join(str(value) for value in values) + "]"


def lean_finset(values: list[int]) -> str:
    return "{" + ", ".join(str(value) for value in values) + "}"


def dense_terminal_literals(
    core_literals: list[int], dense_literals: list[int], terminal_literals: list[int]
) -> list[int]:
    if len(core_literals) != len(dense_literals):
        raise ValueError("core and dense literal lists have different lengths")
    translation = dict(zip(core_literals, dense_literals, strict=True))
    if len(translation) != len(core_literals):
        raise ValueError("a source core clause repeats a signed literal")
    try:
        return [translation[literal] for literal in terminal_literals]
    except KeyError as error:
        raise ValueError(f"terminal literal absent from source core clause: {error}") from error


@dataclass(frozen=True)
class Record:
    family_ordinal: int
    output_clause_index: int
    source_core_clause_index: int
    source_terminal_clause_index: int
    source_core_literals: list[int]
    source_terminal_literals: list[int]
    compact_ledger_literals: list[int]
    compact_terminal_literals: list[int]
    center: int
    row_support: list[int]
    outer_center: int
    outer_side: str
    outer_turn_mask: int
    membership_vars: list[int]
    membership_points: list[int]
    row_var: int


def load_records() -> list[Record]:
    map_data = json.loads(MAP_PATH.read_text())
    target_map = [
        row
        for row in map_data["core_clauses"]
        if row["allocated_family"] == FAMILY
    ]
    if len(target_map) != EXPECTED_COUNT:
        raise ValueError(f"expected {EXPECTED_COUNT} mapped rows, found {len(target_map)}")
    map_by_key = {
        (row["allocated_family"], row["core_clause_index"], row["allocated_input_clause_index"]): row
        for row in target_map
    }
    if len(map_by_key) != EXPECTED_COUNT:
        raise ValueError("mapped provenance keys are not unique")

    ledger_rows = [json.loads(line) for line in LEDGER_PATH.read_text().splitlines()]
    target_ledger = [row for row in ledger_rows if row["family"] == FAMILY]
    if len(target_ledger) != EXPECTED_COUNT:
        raise ValueError(f"expected {EXPECTED_COUNT} ledger rows, found {len(target_ledger)}")

    records: list[Record] = []
    for ordinal, ledger in enumerate(target_ledger, start=1):
        key = (FAMILY, ledger["source_core_clause_index"], ledger["source_terminal_clause_index"])
        mapped = map_by_key.pop(key, None)
        if mapped is None:
            raise ValueError(f"unmatched ledger provenance key: {key}")
        if mapped["allocated_input_clause_literal_order"] != ledger["source_terminal_literals"]:
            raise ValueError(f"terminal-order mismatch for {key}")
        if mapped["core_clause_literal_order"] != ledger["source_core_literals"]:
            raise ValueError(f"core-order mismatch for {key}")

        candidates = mapped["candidate_provenance"]
        if len(candidates) != 1 or candidates[0]["family"] != FAMILY:
            raise ValueError(f"ambiguous direct provenance for {key}")
        semantic = candidates[0]["semantic_parameters"]
        if semantic["producer_function"] != "add_direct_curvature_overlay":
            raise ValueError(f"unexpected producer for {key}")
        center = semantic["center"]
        row_support = semantic["row_support"]
        outer = semantic["outer_arc"]
        if len(row_support) != 4 or len(set(row_support)) != 4:
            raise ValueError(f"non-four distinct row support for {key}")

        named_by_literal = {item["literal"]: item for item in mapped["named_literals"]}
        terminal_named = [named_by_literal[literal] for literal in ledger["source_terminal_literals"]]
        memberships = [item for item in terminal_named if item["variable_family"] == "selected_row_membership"]
        rows = [item for item in terminal_named if item["variable_family"] == "row_support"]
        if len(memberships) != 4 or len(rows) != 1:
            raise ValueError(f"wrong direct literal shape for {key}")
        if any(item["polarity"] != "negative" for item in memberships) or rows[0]["polarity"] != "positive":
            raise ValueError(f"wrong direct literal polarities for {key}")
        membership_points = [item["parameters"]["point"] for item in memberships]
        membership_vars = [item["variable"] for item in memberships]
        if [item["parameters"]["center"] for item in memberships] != [center] * 4:
            raise ValueError(f"membership center mismatch for {key}")
        if membership_points != row_support:
            raise ValueError(f"terminal membership order is not row-support order for {key}")
        row_parameters = rows[0]["parameters"]
        if row_parameters["center"] != center or [row_parameters[f"point{i}"] for i in range(4)] != row_support:
            raise ValueError(f"row atom parameters mismatch for {key}")

        dense_terminal = dense_terminal_literals(
            ledger["source_core_literals"], ledger["dense_literals"], ledger["source_terminal_literals"]
        )
        expected_terminal_shape = [-variable for variable in membership_vars] + [rows[0]["variable"]]
        if ledger["source_terminal_literals"] != expected_terminal_shape:
            raise ValueError(f"terminal source literal shape mismatch for {key}")
        if dense_terminal[4] <= 0 or any(literal >= 0 for literal in dense_terminal[:4]):
            raise ValueError(f"terminal dense polarity mismatch for {key}")
        records.append(
            Record(
                family_ordinal=ordinal,
                output_clause_index=ledger["output_clause_index"],
                source_core_clause_index=ledger["source_core_clause_index"],
                source_terminal_clause_index=ledger["source_terminal_clause_index"],
                source_core_literals=ledger["source_core_literals"],
                source_terminal_literals=ledger["source_terminal_literals"],
                compact_ledger_literals=ledger["dense_literals"],
                compact_terminal_literals=dense_terminal,
                center=center,
                row_support=row_support,
                outer_center=outer["center"],
                outer_side=outer["side"],
                outer_turn_mask=outer["turn_mask"],
                membership_vars=[abs(literal) for literal in dense_terminal[:4]],
                membership_points=membership_points,
                row_var=dense_terminal[4],
            )
        )
    if map_by_key:
        raise ValueError(f"{len(map_by_key)} mapped rows had no compact-ledger match")
    return records


def records_sha256(records: list[Record]) -> str:
    text = json.dumps([asdict(record) for record in records], sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(text.encode()).hexdigest()


def render_record(record: Record) -> str:
    support = lean_nat_list(record.row_support)
    support_finset = lean_finset(record.row_support)
    memberships = [
        f"({variable}, {{ center := {record.center}, point := {point} }})"
        for variable, point in zip(record.membership_vars, record.membership_points, strict=True)
    ]
    side_ctor = (
        "ATailUniqueFourExactTwoCurvatureScratch.P5CurvatureSource.OuterSide.left"
        if record.outer_side == "left"
        else "ATailUniqueFourExactTwoCurvatureScratch.P5CurvatureSource.OuterSide.right"
    )
    return "\n".join(
        [
            "  {",
            f"    familyOrdinal := {record.family_ordinal}",
            f"    outputClauseIndex := {record.output_clause_index}",
            f"    sourceCoreClauseIndex := {record.source_core_clause_index}",
            f"    sourceTerminalClauseIndex := {record.source_terminal_clause_index}",
            f"    sourceCoreLiterals := {lean_int_list(record.source_core_literals)}",
            f"    sourceTerminalLiterals := {lean_int_list(record.source_terminal_literals)}",
            f"    compactLedgerLiterals := {lean_int_list(record.compact_ledger_literals)}",
            f"    compactTerminalLiterals := {lean_int_list(record.compact_terminal_literals)}",
            f"    center := {record.center}",
            f"    rowSupport := {support}",
            f"    outerArc := {{ center := {record.outer_center}, side := {side_ctor}, turnMask := {record.outer_turn_mask} }}",
            f"    m1 := {memberships[0]}",
            f"    m2 := {memberships[1]}",
            f"    m3 := {memberships[2]}",
            f"    m4 := {memberships[3]}",
            f"    row := ({record.row_var}, {{ center := {record.center}, support := ({support_finset} : Finset Label) }})",
            "  },",
        ]
    )


def render_core(records: list[Record]) -> str:
    records_hash = records_sha256(records)
    return f'''/- This file is generated by membership_row_materialize.py; do not edit. -/
import P4DirectOuterArcAdapter

/-! Authenticated direct membership-to-row occurrence data definitions. -/

namespace Problem97.P4DirectMembershipRowOccurrenceBridgeScratch

open P4DirectOuterArcAdapterScratch

abbrev Label := P4DirectOuterArcAdapterScratch.Label

/-- Direct provenance retained for a row's accompanying outer-arc schema. -/
structure OuterArcProvenance where
  center : Label
  side : ATailUniqueFourExactTwoCurvatureScratch.P5CurvatureSource.OuterSide
  turnMask : Nat
  deriving DecidableEq

/-- One compact direct-membership occurrence, with both ledger and terminal order. -/
structure MembershipRowOccurrence where
  familyOrdinal : Nat
  outputClauseIndex : Nat
  sourceCoreClauseIndex : Nat
  sourceTerminalClauseIndex : Nat
  sourceCoreLiterals : List Int
  sourceTerminalLiterals : List Int
  compactLedgerLiterals : List Int
  compactTerminalLiterals : List Int
  center : Label
  rowSupport : List Label
  outerArc : OuterArcProvenance
  m1 : Nat × MembershipAtom
  m2 : Nat × MembershipAtom
  m3 : Nat × MembershipAtom
  m4 : Nat × MembershipAtom
  row : Nat × RowSupportAtom

def inputCoreMapSha256 : String := "{EXPECTED_MAP_SHA256}"
def compactLedgerSha256 : String := "{EXPECTED_LEDGER_SHA256}"
def selectedRecordsSha256 : String := "{records_hash}"
def expectedOccurrenceCount : Nat := {EXPECTED_COUNT}

end Problem97.P4DirectMembershipRowOccurrenceBridgeScratch
'''


def chunk_name(index: int) -> str:
    return f"membership_row_data_chunk_{index:03}.lean"


def chunk_definition(index: int) -> str:
    return f"membershipRowOccurrencesChunk{index:03}"


def render_chunk(index: int, records: list[Record]) -> str:
    rows = "\n".join(render_record(record) for record in records)
    return f'''/- This file is generated by membership_row_materialize.py; do not edit. -/
import membership_row_data_core

/-! One bounded authenticated direct membership-to-row data chunk. -/

namespace Problem97.P4DirectMembershipRowOccurrenceBridgeScratch

open P4DirectOuterArcAdapterScratch
open ATailUniqueFourExactTwoCurvatureScratch.P5CurvatureSource

def {chunk_definition(index)} : List MembershipRowOccurrence := [
{rows}
]

end Problem97.P4DirectMembershipRowOccurrenceBridgeScratch
'''


def render_aggregate(chunk_count: int) -> str:
    imports = "\n".join(f"import {chunk_name(index)[:-5]}" for index in range(chunk_count))
    chunks = " ++\n  ".join(chunk_definition(index) for index in range(chunk_count))
    return f'''/- This file is generated by membership_row_materialize.py; do not edit. -/
import membership_row_data_core
{imports}

/-! Aggregate of the bounded authenticated direct membership-to-row chunks. -/

namespace Problem97.P4DirectMembershipRowOccurrenceBridgeScratch

def membershipRowOccurrences : List MembershipRowOccurrence :=
  {chunks}

end Problem97.P4DirectMembershipRowOccurrenceBridgeScratch
'''


def expected_outputs(records: list[Record]) -> dict[Path, str]:
    chunks = [records[offset : offset + CHUNK_SIZE] for offset in range(0, len(records), CHUNK_SIZE)]
    outputs = {CORE_PATH: render_core(records), OUT_PATH: render_aggregate(len(chunks))}
    outputs.update(
        (HERE / chunk_name(index), render_chunk(index, chunk))
        for index, chunk in enumerate(chunks)
    )
    return outputs


def write_outputs(records: list[Record]) -> None:
    outputs = expected_outputs(records)
    for path, content in outputs.items():
        path.write_text(content)
    for stale in HERE.glob("membership_row_data_chunk_*.lean"):
        if stale not in outputs:
            stale.unlink()


def verify_output(records: list[Record]) -> None:
    outputs = expected_outputs(records)
    for path, expected in outputs.items():
        if not path.exists() or path.read_text() != expected:
            raise ValueError(f"generated file is stale: {path}")
    actual_chunks = set(HERE.glob("membership_row_data_chunk_*.lean"))
    expected_chunks = {path for path in outputs if path.name.startswith("membership_row_data_chunk_")}
    if actual_chunks != expected_chunks:
        raise ValueError("generated chunk set differs from the authenticated output")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--verify", action="store_true", help="check input and generated-output integrity")
    parser.add_argument("--write", action="store_true", help="write the deterministic Lean data module")
    args = parser.parse_args()
    if not args.verify and not args.write:
        parser.error("choose --verify or --write")
    if sha256(MAP_PATH) != EXPECTED_MAP_SHA256:
        raise ValueError("input-core map SHA-256 differs from the authenticated input")
    if sha256(LEDGER_PATH) != EXPECTED_LEDGER_SHA256:
        raise ValueError("compact occurrence ledger SHA-256 differs from the authenticated input")
    records = load_records()
    if len(records) != EXPECTED_COUNT:
        raise ValueError("record count changed after join")
    if args.write:
        write_outputs(records)
    if args.verify:
        verify_output(records)
    outputs = [record.output_clause_index for record in records]
    print(
        json.dumps(
            {
                "records": len(records),
                "family_ordinal": [records[0].family_ordinal, records[-1].family_ordinal],
                "output_clause_index_range": [min(outputs), max(outputs)],
                "distinct_output_clause_indices": len(set(outputs)),
                "records_sha256": records_sha256(records),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
