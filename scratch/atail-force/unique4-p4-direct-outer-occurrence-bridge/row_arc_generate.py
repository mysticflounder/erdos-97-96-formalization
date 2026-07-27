#!/usr/bin/env python3
"""Authenticated ingress for `direct_row_pattern_implies_outer_arc`.

The semantic atoms and dense variables below are paired in *source terminal*
order.  In particular, compact-ledger/core literal order is used only to
authenticate the join; it is never zipped with the source semantic atoms.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
CORE_MAP = ROOT / "scratch/atail-force/unique4-exact-two-core-map/p4.input-core-map.json"
LEDGER = ROOT / "scratch/atail-force/unique4-exact-two-core-map/generated/p4-seed0-compact/p4-seed0-compact-occurrences.jsonl"
MANIFEST = ROOT / "scratch/atail-force/unique4-exact-two-core-map/generated/p4-seed0-compact/p4-seed0-compact-manifest.json"
FAMILY = "direct_row_pattern_implies_outer_arc"
DIRECT_FAMILIES = {
    "direct_memberships_imply_row_pattern", FAMILY,
    "direct_no_four_turn_disjoint_outer_arcs",
}
EXPECTED_COUNT = 3179
EXPECTED_DIRECT_OCCURRENCES = 10614
CHUNK_SIZE = 160
EXPECTED_HASHES = {
    "source_map": "af829a7c99e0f969f410d398d7c32c2ba5dd945f3a7ebb2ef3f8d7679633d64b",
    "ledger": "b1c159058e659cbd06c4540e72e2ca94eef0ef27602733db0bc44122dcdb4aac",
    "manifest": "61efb4c99512ef3cff6968f1513ebb8e3c9009ad3fcc7bb013da70a5d3f37305",
}


def fail(message: str) -> None:
    raise ValueError(message)


def canonical(value: Any) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"))


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def signed_dense(literal: int, old_to_new: dict[int, int]) -> int:
    dense = old_to_new.get(abs(literal))
    if dense is None:
        fail(f"unmapped source literal {literal}")
    return dense if literal > 0 else -dense


def atom_from_named(named: dict[str, Any]) -> tuple[str, dict[str, Any]]:
    family = named["variable_family"]
    p = named["parameters"]
    if family == "selected_row_membership":
        result = {"center": p["center"], "point": p["point"]}
        if not all(isinstance(x, int) and 0 <= x < 11 for x in result.values()):
            fail(f"invalid membership atom in {named['name']}")
        return family, result
    if family == "row_support":
        support = [p[f"point{i}"] for i in range(4)]
        if len(set(support)) != 4 or any(not 0 <= x < 11 for x in support):
            fail(f"invalid row support in {named['name']}")
        return family, {"center": p["center"], "support": support}
    if family == "outer_arc":
        result = {"center": p["center"], "side": p["side"], "turn_mask": p["turn_mask"]}
        if result["side"] not in {"left", "right"} or not 0 <= result["center"] < 11:
            fail(f"invalid outer arc in {named['name']}")
        return family, result
    fail(f"unexpected atom family {family}")


def source_records(core_map: dict[str, Any]) -> dict[tuple[str, int, int], dict[str, Any]]:
    result: dict[tuple[str, int, int], dict[str, Any]] = {}
    for source in core_map["core_clauses"]:
        if source["allocated_family"] != FAMILY:
            continue
        key = (FAMILY, source["core_clause_index"], source["allocated_input_clause_index"])
        if key in result:
            fail(f"duplicate source key {key}")
        core, terminal, named = (source["core_clause_literal_order"],
            source["allocated_input_clause_literal_order"], source["named_literals"])
        if [x["literal"] for x in named] != core:
            fail(f"named/core order mismatch {key}")
        if len(core) != 2 or len(terminal) != 2 or Counter(core) != Counter(terminal):
            fail(f"non-bijective two-literal source clause {key}")
        candidates = [x for x in source["candidate_provenance"] if x["family"] == FAMILY]
        if len(candidates) != 1:
            fail(f"expected one candidate {key}")
        candidate = candidates[0]
        if candidate["input_clause_index"] != key[2] or candidate["input_clause_literal_order"] != terminal:
            fail(f"candidate terminal mismatch {key}")
        atoms = {x["literal"]: atom_from_named(x) for x in named}
        if set(atoms) != set(terminal):
            fail(f"named literal set mismatch {key}")
        ordered = [atoms[x] for x in terminal]
        if [x[0] for x in ordered] != ["row_support", "outer_arc"]:
            fail(f"terminal order is not [-row,+arc] {key}")
        if terminal[0] >= 0 or terminal[1] <= 0:
            fail(f"unexpected source signs {key}")
        semantic = candidate["semantic_parameters"]
        if semantic.get("row_support") != ordered[0][1]["support"] or semantic.get("outer_arc") != ordered[1][1]:
            fail(f"candidate semantics not terminal-aligned {key}")
        if ordered[0][1]["center"] != ordered[1][1]["center"]:
            fail(f"row/arc center mismatch {key}")
        result[key] = {"core": core, "terminal": terminal, "row": ordered[0][1], "arc": ordered[1][1]}
    if len(result) != EXPECTED_COUNT:
        fail(f"source count {len(result)} != {EXPECTED_COUNT}")
    return result


def joined_records(source: dict[tuple[str, int, int], dict[str, Any]], old_to_new: dict[int, int]) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    seen: set[tuple[str, int, int]] = set()
    for line_number, line in enumerate(LEDGER.read_text().splitlines(), 1):
        ledger = json.loads(line)
        if ledger["family"] != FAMILY:
            continue
        key = (FAMILY, ledger["source_core_clause_index"], ledger["source_terminal_clause_index"])
        source_row = source.get(key)
        if source_row is None or key in seen:
            fail(f"bad ledger join at line {line_number}: {key}")
        seen.add(key)
        if ledger["source_core_literals"] != source_row["core"] or ledger["source_terminal_literals"] != source_row["terminal"]:
            fail(f"ledger/source literal provenance mismatch {key}")
        expected_core = [signed_dense(x, old_to_new) for x in source_row["core"]]
        if ledger["dense_literals"] != expected_core:
            fail(f"old_to_new/core dense mismatch {key}")
        terminal_dense = [signed_dense(x, old_to_new) for x in source_row["terminal"]]
        rows.append({
            "output_clause_index": ledger["output_clause_index"],
            "core_clause_index": key[1], "terminal_clause_index": key[2],
            "source_core_literals": source_row["core"], "source_terminal_literals": source_row["terminal"],
            "compact_ledger_literals": ledger["dense_literals"],
            "compact_terminal_literals": terminal_dense,
            "row_dense_variable": -terminal_dense[0], "arc_dense_variable": terminal_dense[1],
            "row": source_row["row"], "arc": source_row["arc"],
        })
    if len(rows) != EXPECTED_COUNT or set(source) != seen:
        fail(f"exact source/ledger join failed: rows={len(rows)}, missing={len(set(source)-seen)}")
    return rows


def direct_functionality_audit(core_map: dict[str, Any], old_to_new: dict[int, int]) -> dict[str, Any]:
    dense_to_atoms: dict[int, set[str]] = defaultdict(set)
    occurrences = 0
    family_counts: Counter[str] = Counter()
    for clause in core_map["core_clauses"]:
        family = clause["allocated_family"]
        if family not in DIRECT_FAMILIES:
            continue
        occurrences += 1
        family_counts[family] += 1
        named, core = clause["named_literals"], clause["core_clause_literal_order"]
        if [x["literal"] for x in named] != core:
            fail(f"direct named/core mismatch at {family}/{clause['core_clause_index']}")
        for item in named:
            atom_family, atom = atom_from_named(item)
            dense_to_atoms[old_to_new[item["variable"]]].add(canonical([atom_family, atom]))
    if occurrences != EXPECTED_DIRECT_OCCURRENCES:
        fail(f"direct occurrence count {occurrences} != {EXPECTED_DIRECT_OCCURRENCES}")
    conflicts = {str(dense): sorted(atoms) for dense, atoms in dense_to_atoms.items() if len(atoms) != 1}
    if conflicts:
        fail(f"nonfunctional direct dense maps: {len(conflicts)}")
    return {
        "combined_direct_occurrence_count": occurrences,
        "family_occurrence_counts": dict(sorted(family_counts.items())),
        "dense_variable_to_semantic_atom_functional": True,
        "distinct_direct_dense_variables": len(dense_to_atoms),
        "conflicting_dense_variables": conflicts,
        "method": "source core order authenticates each dense literal; emitted row/arc pairs use terminal order",
    }


def lean_mask(mask: int) -> str:
    return "{" + ", ".join(str(i) for i in range(11) if mask & (1 << i)) + "}"


def lean_row(row: dict[str, Any]) -> str:
    return f"⟨{row['center']}, {lean_mask(sum(1 << x for x in row['support']))}⟩"


def lean_arc(arc: dict[str, Any]) -> str:
    return f"⟨{arc['center']}, .{arc['side']}, {lean_mask(arc['turn_mask'])}⟩"


def lean_base(hashes: dict[str, str]) -> str:
    return f'''/- This file is generated by row_arc_generate.py; do not edit. -/
import P4DirectOuterArcAdapter
/-! Generated types and hash-pinned identities for the direct row/arc ingress. -/
namespace Problem97.P4DirectRowArcOccurrenceBridgeScratch
open P4DirectOuterArcAdapterScratch
structure RowArcOccurrence where
  outputClauseIndex : Nat
  coreClauseIndex : Nat
  terminalClauseIndex : Nat
  sourceCoreLiterals : List Int
  sourceTerminalLiterals : List Int
  compactLedgerLiterals : List Int
  compactTerminalLiterals : List Int
  row : Nat × RowSupportAtom
  arc : Nat × OuterArcAtom
def sourceMapSha256 : String := "{hashes['source_map']}"
def occurrenceLedgerSha256 : String := "{hashes['ledger']}"
def compactManifestSha256 : String := "{hashes['manifest']}"
def expectedOccurrenceCount : Nat := {EXPECTED_COUNT}
end Problem97.P4DirectRowArcOccurrenceBridgeScratch
'''


def lean_chunk(index: int, rows: list[dict[str, Any]]) -> str:
    out = ["/- This file is generated by row_arc_generate.py; do not edit. -/", "import row_arc_base", "/-! Bounded terminal-ordered direct row/arc occurrence fragment. -/", "namespace Problem97.P4DirectRowArcOccurrenceBridgeScratch", f"def rowArcOccurrencesChunk{index:02d} : List RowArcOccurrence := ["]
    for r in rows:
        fields = [f"outputClauseIndex := {r['output_clause_index']}", f"coreClauseIndex := {r['core_clause_index']}", f"terminalClauseIndex := {r['terminal_clause_index']}"]
        for field in ["source_core_literals", "source_terminal_literals", "compact_ledger_literals", "compact_terminal_literals"]:
            lean_name = "".join(x.title() if i else x for i, x in enumerate(field.split("_")))
            fields.append(f"{lean_name} := [{', '.join(map(str, r[field]))}]")
        fields += [f"row := ({r['row_dense_variable']}, {lean_row(r['row'])})", f"arc := ({r['arc_dense_variable']}, {lean_arc(r['arc'])})"]
        out.append("  { " + ", ".join(fields) + " },")
    return "\n".join(out + ["]", "end Problem97.P4DirectRowArcOccurrenceBridgeScratch", ""])


def lean_data(chunks: int) -> str:
    imports = [f"import row_arc_chunk_{i:02d}" for i in range(chunks)]
    names = [f"rowArcOccurrencesChunk{i:02d}" for i in range(chunks)]
    return "\n".join(["/- This file is generated by row_arc_generate.py; do not edit. -/", *imports, "/-! Aggregate of the exact direct row/arc occurrence fragments. -/", "namespace Problem97.P4DirectRowArcOccurrenceBridgeScratch", "def rowArcOccurrences : List RowArcOccurrence :=", "  " + " ++\n  ".join(names), "end Problem97.P4DirectRowArcOccurrenceBridgeScratch", ""])


def materialize(write: bool) -> dict[str, Any]:
    hashes = {"source_map": sha256(CORE_MAP), "ledger": sha256(LEDGER), "manifest": sha256(MANIFEST)}
    if hashes != EXPECTED_HASHES:
        fail(f"input hashes changed: {hashes}")
    core_map, manifest = json.loads(CORE_MAP.read_text()), json.loads(MANIFEST.read_text())
    old_to_new = {old: new for old, new in manifest["dense_variable_renaming"]["old_to_new"]}
    if len(old_to_new) != manifest["dense_variable_renaming"]["dense_variable_count"] or len(set(old_to_new.values())) != len(old_to_new):
        fail("old_to_new is not a bijective dense-variable map")
    rows = joined_records(source_records(core_map), old_to_new)
    result = {"family": FAMILY, "row_count": len(rows), "hashes": hashes,
        "join_key": ["allocated_family", "core_clause_index", "allocated_input_clause_index"],
        "checks": {"terminal_order_drives_semantic_zip": True, "source_ledger_exact_key_join": True,
                   "core_order_authenticated_separately": True, "no_output_interval_claim": True},
        "combined_direct_dense_mapping_audit": direct_functionality_audit(core_map, old_to_new)}
    if write:
        parts = [rows[i:i + CHUNK_SIZE] for i in range(0, len(rows), CHUNK_SIZE)]
        (HERE / "row_arc_base.lean").write_text(lean_base(hashes))
        for i, part in enumerate(parts):
            (HERE / f"row_arc_chunk_{i:02d}.lean").write_text(lean_chunk(i, part))
        (HERE / "row_arc_data.lean").write_text(lean_data(len(parts)))
        (HERE / "row_arc_occurrences.jsonl").write_text("".join(canonical(row) + "\n" for row in rows))
        (HERE / "row_arc_validation.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
        (HERE / "row_arc_direct_dense_mapping_audit.json").write_text(json.dumps(result["combined_direct_dense_mapping_audit"], indent=2, sort_keys=True) + "\n")
    return result


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--verify", action="store_true")
    args = parser.parse_args()
    print(json.dumps(materialize(not args.verify), sort_keys=True))
