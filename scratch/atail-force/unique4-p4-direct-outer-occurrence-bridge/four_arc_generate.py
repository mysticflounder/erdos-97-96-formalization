#!/usr/bin/env python3
"""Materialize the direct four-outer-arc compact occurrences.

This is deliberately a one-family ingress.  It joins the source core map to
the compact occurrence ledger by the allocated-family/core/terminal triple,
then reads both the compact literals and the semantic `outer_arcs` in the
source-terminal order.  Core literal order is checked only as source-map
authentication; it is never used as the emitted occurrence order.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
CORE_MAP = ROOT / "scratch/atail-force/unique4-exact-two-core-map/p4.input-core-map.json"
LEDGER = (
    ROOT
    / "scratch/atail-force/unique4-exact-two-core-map/generated/p4-seed0-compact"
    / "p4-seed0-compact-occurrences.jsonl"
)
MANIFEST = (
    ROOT
    / "scratch/atail-force/unique4-exact-two-core-map/generated/p4-seed0-compact"
    / "p4-seed0-compact-manifest.json"
)
OUT_LEAN = HERE / "four_arc_data.lean"
OUT_BASE = HERE / "four_arc_base.lean"
OUT_JSONL = HERE / "four_arc_occurrences.jsonl"
OUT_VALIDATION = HERE / "four_arc_validation.json"
OUT_DIRECT_OUTER_AUDIT = HERE / "four_arc_direct_outer_mapping_audit.json"

FAMILY = "direct_no_four_turn_disjoint_outer_arcs"
DIRECT_FAMILIES = {
    "direct_memberships_imply_row_pattern",
    "direct_row_pattern_implies_outer_arc",
    FAMILY,
}
EXPECTED_COUNT = 6170
FIRST_OUTPUT = 12873
LAST_OUTPUT = 19042
CHUNK_SIZE = 200
EXPECTED_HASHES = {
    "source_map": "af829a7c99e0f969f410d398d7c32c2ba5dd945f3a7ebb2ef3f8d7679633d64b",
    "ledger": "b1c159058e659cbd06c4540e72e2ca94eef0ef27602733db0bc44122dcdb4aac",
    "manifest": "61efb4c99512ef3cff6968f1513ebb8e3c9009ad3fcc7bb013da70a5d3f37305",
}


def canonical(value: Any) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"))


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def fail(message: str) -> None:
    raise ValueError(message)


def source_arc_from_named(named: dict[str, Any]) -> dict[str, Any]:
    if named["variable_family"] != "outer_arc":
        fail(f"non-outer-arc named literal {named['name']}")
    parameters = named["parameters"]
    return {
        "center": parameters["center"],
        "side": parameters["side"],
        "turn_mask": parameters["turn_mask"],
    }


def validate_arc(arc: dict[str, Any], context: str) -> None:
    if set(arc) != {"center", "side", "turn_mask"}:
        fail(f"unexpected outer-arc fields at {context}: {sorted(arc)}")
    if not isinstance(arc["center"], int) or not 0 <= arc["center"] < 11:
        fail(f"out-of-range center at {context}")
    if arc["side"] not in {"left", "right"}:
        fail(f"unknown side at {context}")
    if not isinstance(arc["turn_mask"], int) or not 0 < arc["turn_mask"] < 2**11:
        fail(f"invalid turn mask at {context}")


def check_pairwise_disjoint(arcs: list[dict[str, Any]], context: str) -> None:
    for left in range(4):
        for right in range(left + 1, 4):
            if arcs[left]["turn_mask"] & arcs[right]["turn_mask"]:
                fail(f"non-disjoint direct masks at {context}: {left}, {right}")


def source_records(core_map: dict[str, Any]) -> dict[tuple[str, int, int], dict[str, Any]]:
    records: dict[tuple[str, int, int], dict[str, Any]] = {}
    for source in core_map["core_clauses"]:
        if source["allocated_family"] != FAMILY:
            continue
        key = (FAMILY, source["core_clause_index"], source["allocated_input_clause_index"])
        if key in records:
            fail(f"duplicate source-map join key {key}")
        core_lits = source["core_clause_literal_order"]
        named = source["named_literals"]
        if [item["literal"] for item in named] != core_lits:
            fail(f"named/core order mismatch at {key}")
        candidates = [candidate for candidate in source["candidate_provenance"]
                      if candidate["family"] == FAMILY]
        if len(candidates) != 1:
            fail(f"expected one direct candidate at {key}, got {len(candidates)}")
        candidate = candidates[0]
        terminal_lits = source["allocated_input_clause_literal_order"]
        if candidate["input_clause_index"] != key[2]:
            fail(f"terminal index mismatch at {key}")
        if candidate["input_clause_literal_order"] != terminal_lits:
            fail(f"terminal literal mismatch at {key}")
        arcs = candidate["semantic_parameters"].get("outer_arcs")
        if not isinstance(arcs, list) or len(arcs) != 4:
            fail(f"expected exactly four outer arcs at {key}")
        for index, arc in enumerate(arcs):
            validate_arc(arc, f"{key}/{index}")
        named_by_literal = {item["literal"]: source_arc_from_named(item) for item in named}
        if len(named_by_literal) != 4 or set(named_by_literal) != set(terminal_lits):
            fail(f"named/source literal provenance mismatch at {key}")
        terminal_arcs = [named_by_literal[literal] for literal in terminal_lits]
        if terminal_arcs != arcs:
            fail(f"candidate outer_arcs are not in terminal literal order at {key}")
        if any(literal >= 0 for literal in terminal_lits):
            fail(f"non-negative direct no-four source literal at {key}")
        check_pairwise_disjoint(arcs, str(key))
        records[key] = {
            "core_clause_index": key[1],
            "terminal_clause_index": key[2],
            "source_core_literals": core_lits,
            "source_terminal_literals": terminal_lits,
            "outer_arcs": arcs,
        }
    if len(records) != EXPECTED_COUNT:
        fail(f"source-map count {len(records)} != {EXPECTED_COUNT}")
    return records


def signed_dense_literal(source_literal: int, old_to_new: dict[int, int]) -> int:
    try:
        dense = old_to_new[abs(source_literal)]
    except KeyError as error:
        raise ValueError(f"source literal missing from old_to_new: {source_literal}") from error
    return dense if source_literal > 0 else -dense


def joined_records(
    source: dict[tuple[str, int, int], dict[str, Any]], old_to_new: dict[int, int]
) -> list[dict[str, Any]]:
    joined: list[dict[str, Any]] = []
    seen: set[tuple[str, int, int]] = set()
    with LEDGER.open() as handle:
        for line_number, line in enumerate(handle, 1):
            ledger = json.loads(line)
            if ledger["family"] != FAMILY:
                continue
            key = (FAMILY, ledger["source_core_clause_index"], ledger["source_terminal_clause_index"])
            if key in seen:
                fail(f"duplicate ledger join key {key}")
            seen.add(key)
            try:
                source_record = source[key]
            except KeyError as error:
                raise ValueError(f"ledger-only join key {key} at line {line_number}") from error
            if ledger["source_core_literals"] != source_record["source_core_literals"]:
                fail(f"core literal provenance mismatch at {key}")
            if ledger["source_terminal_literals"] != source_record["source_terminal_literals"]:
                fail(f"terminal literal provenance mismatch at {key}")
            compact_core_order = ledger["dense_literals"]
            if len(compact_core_order) != 4 or any(literal >= 0 for literal in compact_core_order):
                fail(f"invalid compact four-arc clause at {key}")
            core_literals = source_record["source_core_literals"]
            terminal_literals = source_record["source_terminal_literals"]
            if Counter(core_literals) != Counter(terminal_literals) or len(set(core_literals)) != 4:
                fail(f"non-bijective core/terminal direct literal orders at {key}")
            expected_compact_core = [
                signed_dense_literal(literal, old_to_new) for literal in core_literals
            ]
            if compact_core_order != expected_compact_core:
                fail(f"ledger compact/source old_to_new mismatch at {key}")
            # The compact ledger stores its clause in core order.  The source
            # theorem's four arcs are terminal/direct ordered, so permute the
            # signed literals through `old_to_new` before emitting this
            # materializer's occurrence.
            compact = [
                signed_dense_literal(literal, old_to_new) for literal in terminal_literals
            ]
            arcs = source_record["outer_arcs"]
            joined.append({
                "output_clause_index": ledger["output_clause_index"],
                "core_clause_index": key[1],
                "terminal_clause_index": key[2],
                "compact_clause": compact,
                "compact_variables": [-literal for literal in compact],
                "source_terminal_literals": source_record["source_terminal_literals"],
                # Keep this semantic field exactly to the requested schema;
                # dense variables live separately so the terminal-order zip is
                # explicit rather than encoded in an extra arc field.
                "outer_arcs": arcs,
            })
    if len(joined) != EXPECTED_COUNT:
        fail(f"ledger count {len(joined)} != {EXPECTED_COUNT}")
    if set(source) != seen:
        fail(f"source-only join keys: {len(set(source) - seen)}")
    outputs = [record["output_clause_index"] for record in joined]
    expected_outputs = list(range(FIRST_OUTPUT, LAST_OUTPUT + 1))
    if outputs != expected_outputs:
        fail("output range is not the exact ordered interval 12873..19042")
    for record in joined:
        if len(record["outer_arcs"]) != 4:
            fail(f"wrong emitted arc count at output {record['output_clause_index']}")
        if [-variable for variable in record["compact_variables"]] != record["compact_clause"]:
            fail(f"compact/source order mismatch at output {record['output_clause_index']}")
        check_pairwise_disjoint(record["outer_arcs"], str(record["output_clause_index"]))
    return joined


def lean_arc(arc: dict[str, Any]) -> str:
    return f"⟨{arc['center']}, .{arc['side']}, {lean_mask(arc['turn_mask'])}⟩"


def lean_mask(mask: int) -> str:
    members = [str(index) for index in range(11) if mask & (1 << index)]
    return "{" + ", ".join(members) + "}"


def lean_base(hashes: dict[str, str]) -> str:
    lines = [
        "/- This file is generated by four_arc_generate.py; do not edit. -/",
        "import P4DirectOuterArcAdapter",
        "/-! Generated base types and authenticated input identities for the direct four-arc ingress. -/",
        "",
        "namespace Problem97.P4DirectFourArcOccurrenceBridgeScratch",
        "",
        "open P4DirectOuterArcAdapterScratch",
        "",
        "/-- One direct occurrence, with arcs ordered by the source-terminal literal order. -/",
        "structure FourArcOccurrence where",
        "  outputClauseIndex : Nat",
        "  coreClauseIndex : Nat",
        "  terminalClauseIndex : Nat",
        "  clause : List Int",
        "  a1 : Nat × OuterArcAtom",
        "  a2 : Nat × OuterArcAtom",
        "  a3 : Nat × OuterArcAtom",
        "  a4 : Nat × OuterArcAtom",
        "",
        "/-- The source-terminal ordered arc list; it has exactly four entries by construction. -/",
        "def FourArcOccurrence.outerArcs (e : FourArcOccurrence) : List (Nat × OuterArcAtom) :=",
        "  [e.a1, e.a2, e.a3, e.a4]",
        "",
        f'def sourceMapSha256 : String := "{hashes["source_map"]}"',
        f'def occurrenceLedgerSha256 : String := "{hashes["ledger"]}"',
        f"def directNoFourOccurrenceCount : Nat := {EXPECTED_COUNT}",
        f"def firstDirectNoFourOutput : Nat := {FIRST_OUTPUT}",
        f"def lastDirectNoFourOutput : Nat := {LAST_OUTPUT}",
        "",
    ]
    lines.extend([
        "end Problem97.P4DirectFourArcOccurrenceBridgeScratch",
        "",
    ])
    return "\n".join(lines)


def lean_chunk(chunk_index: int, records: list[dict[str, Any]]) -> str:
    lines = [
        "/- This file is generated by four_arc_generate.py; do not edit. -/",
        "import four_arc_base",
        "/-! One bounded generated fragment of direct four-arc compact occurrences. -/",
        "",
        "namespace Problem97.P4DirectFourArcOccurrenceBridgeScratch",
        "",
        f"def directNoFourOccurrencesChunk{chunk_index:02d} : List FourArcOccurrence := [",
    ]
    for record in records:
        arcs = record["outer_arcs"]
        variables = record["compact_variables"]
        lines.extend([
            "  { outputClauseIndex := " + str(record["output_clause_index"])
            + ", coreClauseIndex := " + str(record["core_clause_index"])
            + ", terminalClauseIndex := " + str(record["terminal_clause_index"])
            + ", clause := [" + ", ".join(str(literal) for literal in record["compact_clause"]) + "]"
            + ", a1 := (" + str(variables[0]) + ", " + lean_arc(arcs[0]) + ")"
            + ", a2 := (" + str(variables[1]) + ", " + lean_arc(arcs[1]) + ")"
            + ", a3 := (" + str(variables[2]) + ", " + lean_arc(arcs[2]) + ")"
            + ", a4 := (" + str(variables[3]) + ", " + lean_arc(arcs[3]) + ") },",
        ])
    lines.extend([
        "]",
        "",
        "end Problem97.P4DirectFourArcOccurrenceBridgeScratch",
        "",
    ])
    return "\n".join(lines)


def lean_data(chunk_count: int) -> str:
    imports = [f"import four_arc_chunk_{index:02d}" for index in range(chunk_count)]
    chunks = [f"directNoFourOccurrencesChunk{index:02d}" for index in range(chunk_count)]
    return "\n".join([
        "/- This file is generated by four_arc_generate.py; do not edit. -/",
        *imports,
        "/-! Aggregate of the bounded generated direct four-arc occurrence fragments. -/",
        "",
        "namespace Problem97.P4DirectFourArcOccurrenceBridgeScratch",
        "",
        "/-- All 6,170 joined direct four-arc occurrences, source-terminal ordered. -/",
        "def directNoFourOccurrences : List FourArcOccurrence :=",
        "  " + " ++\n  ".join(chunks),
        "",
        "end Problem97.P4DirectFourArcOccurrenceBridgeScratch",
        "",
    ])


def direct_outer_mapping_audit(
    core_map: dict[str, Any], old_to_new: dict[int, int]
) -> dict[str, Any]:
    """Audit the source-core variable map behind all three direct families.

    This is deliberately performed in source-core order: that is the order in
    which the compact ledger's dense literals are authenticated.  It is
    separate from the terminal-order permutation emitted for the four-arc
    source theorem above.
    """
    source: dict[tuple[str, int, int], tuple[list[int], list[dict[str, Any]]]] = {}
    for clause in core_map["core_clauses"]:
        family = clause["allocated_family"]
        if family not in DIRECT_FAMILIES:
            continue
        key = (family, clause["core_clause_index"], clause["allocated_input_clause_index"])
        if key in source:
            fail(f"duplicate direct source-map key {key}")
        core_literals = clause["core_clause_literal_order"]
        named = clause["named_literals"]
        if [item["literal"] for item in named] != core_literals:
            fail(f"direct source named/core mismatch at {key}")
        source[key] = (core_literals, named)

    dense_to_source: dict[int, set[int]] = {}
    dense_to_arc: dict[int, set[tuple[int, str, int]]] = {}
    source_to_arc: dict[int, set[tuple[int, str, int]]] = {}
    family_dense: dict[str, set[int]] = {family: set() for family in DIRECT_FAMILIES}
    family_source: dict[str, set[int]] = {family: set() for family in DIRECT_FAMILIES}
    row_count = 0
    position_count = 0
    with LEDGER.open() as handle:
        for line_number, line in enumerate(handle, 1):
            ledger = json.loads(line)
            family = ledger["family"]
            if family not in DIRECT_FAMILIES:
                continue
            key = (family, ledger["source_core_clause_index"], ledger["source_terminal_clause_index"])
            try:
                core_literals, named = source[key]
            except KeyError as error:
                raise ValueError(f"direct ledger-only key {key} at line {line_number}") from error
            compact = ledger["dense_literals"]
            expected_compact = [
                signed_dense_literal(literal, old_to_new) for literal in core_literals
            ]
            if (
                ledger["source_core_literals"] != core_literals
                or compact != expected_compact
                or len(compact) != len(named)
            ):
                fail(f"direct source-core alignment failure at {key}")
            row_count += 1
            for dense_literal, source_literal, atom in zip(compact, core_literals, named, strict=True):
                if atom["literal"] != source_literal or dense_literal == 0:
                    fail(f"direct literal alignment failure at {key}")
                dense_variable = abs(dense_literal)
                source_variable = atom["variable"]
                dense_to_source.setdefault(dense_variable, set()).add(source_variable)
                position_count += 1
                if atom["variable_family"] != "outer_arc":
                    continue
                arc = source_arc_from_named(atom)
                arc_tuple = (arc["center"], arc["side"], arc["turn_mask"])
                dense_to_arc.setdefault(dense_variable, set()).add(arc_tuple)
                source_to_arc.setdefault(source_variable, set()).add(arc_tuple)
                family_dense[family].add(dense_variable)
                family_source[family].add(source_variable)

    dense_source_conflicts = {
        dense: sorted(sources) for dense, sources in dense_to_source.items() if len(sources) != 1
    }
    syntactic_outer_aliases = {
        dense: sorted(arcs) for dense, arcs in dense_to_arc.items() if len(arcs) != 1
    }
    source_arc_conflicts = {
        source_variable: sorted(arcs)
        for source_variable, arcs in source_to_arc.items() if len(arcs) != 1
    }
    if dense_source_conflicts or syntactic_outer_aliases or source_arc_conflicts:
        fail("direct source-core outer mapping is not functional")

    examples = []
    for dense in sorted(dense_to_arc)[:4]:
        source_variable = next(iter(dense_to_source[dense]))
        center, side, turn_mask = next(iter(dense_to_arc[dense]))
        examples.append({
            "dense_variable": dense,
            "source_outer_identifier": source_variable,
            "outer_arc": {"center": center, "side": side, "turn_mask": turn_mask},
        })
    return {
        "families": sorted(DIRECT_FAMILIES),
        "direct_row_count": row_count,
        "source_core_position_count": position_count,
        "dense_variable_count": len(dense_to_source),
        "dense_to_source_identifier_is_functional": True,
        "retained_outer_dense_variable_count": len(dense_to_arc),
        "retained_outer_source_identifier_count": len(source_to_arc),
        "dense_to_outer_arc_is_functional": True,
        "source_identifier_to_outer_arc_is_functional": True,
        "dense_variables_with_syntactically_distinct_outer_arc_records": 0,
        "semantic_alias_cases_requiring_an_equality_proof": 0,
        "genuine_conflicting_outer_truth_requirements": 0,
        "four_arc_family_outer_dense_variable_count": len(family_dense[FAMILY]),
        "four_arc_family_outer_source_identifier_count": len(family_source[FAMILY]),
        "examples": examples,
    }


def validation(
    records: list[dict[str, Any]], hashes: dict[str, str], core_map: dict[str, Any],
    old_to_new: dict[int, int]
) -> dict[str, Any]:
    return {
        "family": FAMILY,
        "source_map_sha256": hashes["source_map"],
        "occurrence_ledger_sha256": hashes["ledger"],
        "compact_manifest_sha256": hashes["manifest"],
        "row_count": len(records),
        "output_range": {"first": FIRST_OUTPUT, "last": LAST_OUTPUT, "inclusive": True},
        "join_key": ["allocated_family", "core_clause_index", "allocated_input_clause_index"],
        "checks": {
            "source_map_and_ledger_key_sets_equal": True,
            "named_literals_match_core_literal_order": True,
            "candidate_outer_arcs_match_source_terminal_literal_order": True,
            "ledger_terminal_literals_match_source_terminal_literals": True,
            "old_to_new_matches_every_source_core_compact_literal": True,
            "compact_literals_zip_with_terminal_ordered_outer_arcs": True,
            "emitted_compact_literals_are_permuted_from_core_to_terminal_order": True,
            "exactly_four_outer_arcs_per_occurrence": True,
            "all_six_direct_mask_pairs_are_disjoint": True,
            "every_compact_literal_is_zipped_to_its_terminal_ordered_source_arc": True,
            "output_clause_indices_are_contiguous": True,
        },
        "direct_outer_source_mapping_audit": direct_outer_mapping_audit(core_map, old_to_new),
    }


def materialize(write: bool) -> dict[str, Any]:
    hashes = {
        "source_map": sha256(CORE_MAP),
        "ledger": sha256(LEDGER),
        "manifest": sha256(MANIFEST),
    }
    if hashes != EXPECTED_HASHES:
        fail(f"input hashes changed: {hashes}")
    core_map = json.loads(CORE_MAP.read_text())
    manifest = json.loads(MANIFEST.read_text())
    old_to_new = dict(manifest["dense_variable_renaming"]["old_to_new"])
    expected_dense_count = manifest["dense_variable_renaming"]["dense_variable_count"]
    if (
        len(old_to_new) != expected_dense_count
        or len(set(old_to_new.values())) != expected_dense_count
    ):
        fail("old_to_new is not an injective source-variable map")
    source = source_records(core_map)
    records = joined_records(source, old_to_new)
    result = validation(records, hashes, core_map, old_to_new)
    if write:
        chunks = [records[index:index + CHUNK_SIZE]
                  for index in range(0, len(records), CHUNK_SIZE)]
        OUT_BASE.write_text(lean_base(hashes))
        for index, chunk in enumerate(chunks):
            (HERE / f"four_arc_chunk_{index:02d}.lean").write_text(lean_chunk(index, chunk))
        OUT_LEAN.write_text(lean_data(len(chunks)))
        OUT_JSONL.write_text("".join(canonical(record) + "\n" for record in records))
        OUT_VALIDATION.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
        OUT_DIRECT_OUTER_AUDIT.write_text(
            json.dumps(result["direct_outer_source_mapping_audit"], indent=2, sort_keys=True) + "\n"
        )
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--verify", action="store_true", help="validate inputs without changing output")
    arguments = parser.parse_args()
    result = materialize(write=not arguments.verify)
    print(json.dumps(result, sort_keys=True))


if __name__ == "__main__":
    main()
