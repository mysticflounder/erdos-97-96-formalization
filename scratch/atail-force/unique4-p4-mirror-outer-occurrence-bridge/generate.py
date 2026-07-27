#!/usr/bin/env python3
"""Generate the authenticated P4 mirror outer-overlay occurrence schema.

This generator is deliberately source-facing: its entries retain the compact
``output_clause_index`` and obtain all semantic parameters from the named core
literals.  In particular, the four arcs in a no-four clause are read in
``core_clause_literal_order``; candidate provenance ordering is never used as
semantic input.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from dataclasses import dataclass
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
CORE_MAP = ROOT / "scratch/atail-force/unique4-exact-two-core-map/p4.input-core-map.json"
SOURCE_CNF = ROOT / "scratch/atail-force/unique4-exact-two-core-map/p4.input-core.cnf"
PACKAGE = ROOT / "scratch/atail-force/unique4-exact-two-core-map/generated/p4-seed0-compact"
MANIFEST = PACKAGE / "p4-seed0-compact-manifest.json"
LEDGER = PACKAGE / "p4-seed0-compact-occurrences.jsonl"
CNF = PACKAGE / "p4-seed0-compact.cnf"
OUT = HERE / "generated"

FAMILIES = (
    "direct_memberships_imply_row_pattern",
    "direct_row_pattern_implies_outer_arc",
    "direct_no_four_turn_disjoint_outer_arcs",
)
EXPECTED_COUNTS = {
    "direct_memberships_imply_row_pattern": 1265,
    "direct_row_pattern_implies_outer_arc": 3179,
    "direct_no_four_turn_disjoint_outer_arcs": 6170,
}
EXPECTED_COUNT = sum(EXPECTED_COUNTS.values())
CHUNK_SIZE = 256

# These anchor the whole compact/source correspondence.  The three selected
# digests are filled from a successful provenance print before this generator
# is considered an authenticated materializer.
EXPECTED = {
    "formula": "449cea2217bf144caafdd2dadb2ae7083d7ca34816bd226c2ab776f52ea58dae",
    "ledger": "b1c159058e659cbd06c4540e72e2ca94eef0ef27602733db0bc44122dcdb4aac",
    "manifest": "61efb4c99512ef3cff6968f1513ebb8e3c9009ad3fcc7bb013da70a5d3f37305",
    "source_core": "739a55ce7a818cbcdfb8c9fa0731b19b564933e546c303b17c2366871078241b",
    "source_map": "af829a7c99e0f969f410d398d7c32c2ba5dd945f3a7ebb2ef3f8d7679633d64b",
    "selected_ledger": "740043231ec9d2b8c86cee39f427f29dadcac62aad89f1331b81ff307d660517",
    "selected_compact_cnf": "ddc21ca6ef49608d3638eddffd798eb08a39cc8ab7874adfc6dfba01233f8408",
    "selected_source_core": "efbb9031cceaa0e99a526e1cff549f05f55ad9ea3fcc4dc3424c0fff2b9d4045",
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def lines_digest(lines: list[str]) -> str:
    return hashlib.sha256(("\n".join(lines) + "\n").encode()).hexdigest()


def parse_dimacs_clause(line: str) -> list[int]:
    values = [int(value) for value in line.split()]
    if not values or values[-1] != 0:
        raise ValueError("malformed DIMACS clause")
    return values[:-1]


def canonical(value: Any) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"))


def refl(label: int) -> int:
    if not 0 <= label < 11:
        raise ValueError(f"label outside Fin 11: {label}")
    return 10 - label


def mask_labels(mask: int) -> list[int]:
    if mask < 0 or mask >= 1 << 11:
        raise ValueError(f"turn mask outside 11-bit domain: {mask}")
    return [label for label in range(11) if mask & (1 << label)]


def reflected_mask(mask: int) -> int:
    return sum(1 << refl(label) for label in mask_labels(mask))


def reflected_side(side: str) -> str:
    if side == "left":
        return "right"
    if side == "right":
        return "left"
    raise ValueError(f"unknown outer side: {side}")


def row_atom(named: dict[str, Any]) -> dict[str, Any]:
    parameters = named["parameters"]
    if named["variable_family"] != "row_support":
        raise ValueError("expected row_support named literal")
    points = [parameters[f"point{index}"] for index in range(4)]
    center = parameters["center"]
    if len(set(points)) != 4 or center in points:
        raise ValueError("malformed row-support parameters")
    return {"center": center, "support": points}


def membership_atom(named: dict[str, Any]) -> dict[str, Any]:
    parameters = named["parameters"]
    if named["variable_family"] != "selected_row_membership":
        raise ValueError("expected selected_row_membership named literal")
    center, point = parameters["center"], parameters["point"]
    if center == point:
        raise ValueError("membership endpoint equals center")
    return {"center": center, "point": point}


def outer_arc_atom(named: dict[str, Any]) -> dict[str, Any]:
    parameters = named["parameters"]
    if named["variable_family"] != "outer_arc":
        raise ValueError("expected outer_arc named literal")
    return {"center": parameters["center"], "side": parameters["side"],
            "mask": parameters["turn_mask"]}


def reflect_row(row: dict[str, Any]) -> dict[str, Any]:
    return {"center": refl(row["center"]),
            "support": [refl(point) for point in row["support"]]}


def reflect_arc(arc: dict[str, Any]) -> dict[str, Any]:
    return {"center": refl(arc["center"]), "side": reflected_side(arc["side"]),
            "mask": reflected_mask(arc["mask"])}


def finite_mask(row: dict[str, Any], side: str) -> int:
    """The executable content of `finiteArcTurnMask` for one displayed row."""
    center, support = row["center"], row["support"]
    if len(set(support)) != 4 or center in support:
        raise ValueError("finite mask requires a four-point off-center support")
    centered = sorted((center - point) % 11 for point in support)
    start = (-center) % 11
    if side == "left":
        count = centered[1] - 1
    elif side == "right":
        start += centered[2]
        count = 10 - centered[2]
    else:
        raise ValueError(f"unknown outer side: {side}")
    return sum(1 << ((start + offset) % 11) for offset in range(count))


def check_reflected_datum(row: dict[str, Any], arc: dict[str, Any]) -> dict[str, Any]:
    datum = {"row": reflect_row(row), "arc": reflect_arc(arc)}
    if datum["arc"]["center"] != datum["row"]["center"]:
        raise ValueError("row-to-arc center mismatch")
    if finite_mask(datum["row"], datum["arc"]["side"]) != datum["arc"]["mask"]:
        raise ValueError("reflected finite datum invalid")
    return datum


def check_pairwise_disjoint(arcs: list[dict[str, Any]]) -> None:
    reflected = [reflect_arc(arc)["mask"] for arc in arcs]
    for left in range(len(reflected)):
        for right in range(left + 1, len(reflected)):
            if reflected[left] & reflected[right]:
                raise ValueError("reflected no-four masks are not pairwise disjoint")


def named_literal_map(core_clause: dict[str, Any]) -> list[dict[str, Any]]:
    named = core_clause["named_literals"]
    literals = core_clause["core_clause_literal_order"]
    if [item["literal"] for item in named] != literals:
        raise ValueError(f"named literal order mismatch at {core_clause['core_clause_index']}")
    return named


def check_semantic_conflicts(core_clauses: list[dict[str, Any]]) -> None:
    """Reject a core map that assigns two semantic atoms to one source variable."""
    seen: dict[int, str] = {}
    for core_clause in core_clauses:
        for named in named_literal_map(core_clause):
            variable = named["variable"]
            fingerprint = canonical({"family": named["variable_family"],
                                     "parameters": named["parameters"]})
            old = seen.setdefault(variable, fingerprint)
            if old != fingerprint:
                raise ValueError(f"semantic conflict for source variable {variable}")


def dense_atom_map(entries: list[dict[str, Any]]) -> dict[int, dict[str, Any]]:
    """Return the unique direct-overlay atom carried by each compact variable.

    The source map checks source-variable semantics.  This second check is the
    corresponding compact-side invariant needed by the Lean valuation adapter:
    a compact variable may not be used as two different semantic atom kinds.
    """
    seen: dict[int, dict[str, Any]] = {}

    def add(variable: int, kind: str, atom: dict[str, Any]) -> None:
        value = {"kind": kind, "atom": atom}
        old = seen.setdefault(variable, value)
        if canonical(old) != canonical(value):
            raise ValueError(f"semantic conflict for compact variable {variable}")

    for entry in entries:
        shape = entry["shape"]
        if shape["kind"] == "membership_row":
            add(shape["row_var"], "row", shape["row"])
            for member in shape["members"]:
                add(member["var"], "membership",
                    {"center": member["center"], "point": member["point"]})
        elif shape["kind"] == "row_arc":
            add(shape["row_var"], "row", shape["row"])
            add(shape["arc_var"], "arc", shape["arc"])
        else:
            for arc in shape["arcs"]:
                add(arc["var"], "arc",
                    {"center": arc["center"], "side": arc["side"], "mask": arc["mask"]})
    return dict(sorted(seen.items()))


def shape_for(core_clause: dict[str, Any], dense_literals: list[int]) -> dict[str, Any]:
    family = core_clause["allocated_family"]
    named = named_literal_map(core_clause)
    if len(named) != len(dense_literals) or any((left < 0) != (right < 0)
                                                for left, right in zip(
                                                    [item["literal"] for item in named], dense_literals,
                                                    strict=True)):
        raise ValueError("dense/source literal polarity correspondence failed")
    dense_named = [(abs(dense), item) for dense, item in zip(dense_literals, named, strict=True)]
    if family == "direct_memberships_imply_row_pattern":
        rows = [item for item in dense_named if item[1]["variable_family"] == "row_support"]
        members = [item for item in dense_named if item[1]["variable_family"] == "selected_row_membership"]
        if len(rows) != 1 or len(members) != 4 or rows[0][1]["literal"] <= 0:
            raise ValueError("invalid membership-to-row literal shape")
        if any(item[1]["literal"] >= 0 for item in members):
            raise ValueError("membership-to-row polarity drift")
        row = row_atom(rows[0][1])
        membership = [{"var": variable, **membership_atom(item)} for variable, item in members]
        if any(atom["center"] != row["center"] for atom in membership):
            raise ValueError("membership-to-row center mismatch")
        if {atom["point"] for atom in membership} != set(row["support"]):
            raise ValueError("membership-to-row support mismatch")
        return {"kind": "membership_row", "row": row, "row_var": rows[0][0], "members": membership}
    if family == "direct_row_pattern_implies_outer_arc":
        rows = [item for item in dense_named if item[1]["variable_family"] == "row_support"]
        arcs = [item for item in dense_named if item[1]["variable_family"] == "outer_arc"]
        if len(rows) != 1 or len(arcs) != 1 or rows[0][1]["literal"] >= 0 or arcs[0][1]["literal"] <= 0:
            raise ValueError("invalid row-to-arc literal shape")
        row, arc = row_atom(rows[0][1]), outer_arc_atom(arcs[0][1])
        return {"kind": "row_arc", "row": row, "row_var": rows[0][0],
                "arc": arc, "arc_var": arcs[0][0],
                "reflected_datum": check_reflected_datum(row, arc)}
    if family == "direct_no_four_turn_disjoint_outer_arcs":
        if len(named) != 4 or any(item["literal"] >= 0 for item in named):
            raise ValueError("invalid no-four literal shape")
        arcs = [{"var": variable, **outer_arc_atom(item)} for variable, item in dense_named]
        check_pairwise_disjoint(arcs)
        # `arcs` retains core_clause_literal_order by construction.
        return {"kind": "no_four", "arcs": arcs}
    raise ValueError(f"unselected family: {family}")


def checked_expected(name: str, actual: str) -> None:
    expected = EXPECTED[name]
    if expected == "TO_BE_FILLED":
        return
    if actual != expected:
        raise ValueError(f"{name} provenance digest drifted")


def load_entries() -> tuple[dict[str, str], list[dict[str, Any]]]:
    for name, path in (("formula", CNF), ("ledger", LEDGER), ("manifest", MANIFEST),
                       ("source_core", SOURCE_CNF), ("source_map", CORE_MAP)):
        checked_expected(name, sha256(path))
    core_map = json.loads(CORE_MAP.read_text())
    core_by_index = {item["core_clause_index"]: item for item in core_map["core_clauses"]}
    if len(core_by_index) != 48605:
        raise ValueError("unexpected core-clause map cardinality")
    ledger_lines = LEDGER.read_text().splitlines()
    records = [json.loads(line) for line in ledger_lines]
    if len(records) != 19048:
        raise ValueError("unexpected occurrence ledger cardinality")
    selected_pairs = [(line, record) for line, record in zip(ledger_lines, records, strict=True)
                      if record["family"] in FAMILIES]
    selected_lines = [line for line, _ in selected_pairs]
    selected = [record for _, record in selected_pairs]
    family_counts = Counter(record["family"] for record in selected)
    if family_counts != Counter(EXPECTED_COUNTS) or len(selected) != EXPECTED_COUNT:
        raise ValueError(f"selected family count drift: {family_counts}")
    output_indices = [record["output_clause_index"] for record in selected]
    source_indices = [record["source_core_clause_index"] for record in selected]
    if len(set(output_indices)) != EXPECTED_COUNT or len(set(source_indices)) != EXPECTED_COUNT:
        raise ValueError("duplicate selected occurrence index")
    if output_indices != sorted(output_indices):
        raise ValueError("selected ledger is not in compact output order")
    compact_lines = CNF.read_text().splitlines()[1:]
    source_lines = SOURCE_CNF.read_text().splitlines()[1:]
    checked: list[dict[str, Any]] = []
    semantic_core_clauses: list[dict[str, Any]] = []
    for record in selected:
        output, source = record["output_clause_index"], record["source_core_clause_index"]
        core_clause = core_by_index.get(source)
        if core_clause is None or core_clause["allocated_family"] != record["family"]:
            raise ValueError(f"core-map family correspondence failed at output {output}")
        if record["match_status"] not in {
            "semantic_unique_canonical_literal_reordering",
            "semantic_unique_exact_literal_order",
        }:
            raise ValueError(f"non-unique occurrence at output {output}")
        # Both map ordinals are DIMACS clause ordinals: one-based after header.
        if parse_dimacs_clause(compact_lines[output - 1]) != record["dense_literals"]:
            raise ValueError(f"compact clause mismatch at output {output}")
        if parse_dimacs_clause(source_lines[source - 1]) != record["source_core_literals"]:
            raise ValueError(f"source clause mismatch at source {source}")
        semantic_core_clauses.append(core_clause)
        checked.append({"output": output, "source": source,
                        "clause": record["dense_literals"],
                        "shape": shape_for(core_clause, record["dense_literals"])})
    check_semantic_conflicts(semantic_core_clauses)
    provenance = {
        "selected_ledger": lines_digest(selected_lines),
        "selected_compact_cnf": lines_digest([compact_lines[record["output_clause_index"] - 1]
                                               for record in selected]),
        "selected_source_core": lines_digest([source_lines[record["source_core_clause_index"] - 1]
                                                for record in selected]),
    }
    for name, digest in provenance.items():
        checked_expected(name, digest)
    dense_atom_map(checked)
    return provenance, checked


def lean_finset(labels: list[int]) -> str:
    return "{" + ", ".join(str(label) for label in sorted(labels)) + "}"


def lean_row(row: dict[str, Any]) -> str:
    return f"⟨{row['center']}, {lean_finset(row['support'])}⟩"


def lean_arc(arc: dict[str, Any]) -> str:
    return f"⟨{arc['center']}, .{arc['side']}, {lean_finset(mask_labels(arc['mask']))}⟩"


def lean_ints(values: list[int]) -> str:
    return "[" + ", ".join(str(value) for value in values) + "]"


def chunk_sizes(count: int) -> tuple[int, ...]:
    whole, remainder = divmod(count, CHUNK_SIZE)
    return (CHUNK_SIZE,) * whole + ((remainder,) if remainder else ())


def render_chunk(number: int, entries: list[dict[str, Any]]) -> str:
    lines = ["/- This file is generated by ../generate.py; do not edit. -/",
             "import Families", "", "namespace Problem97.P4MirrorOuterOccurrenceBridgeScratch", ""]
    names: list[str] = []
    for offset, entry in enumerate(entries):
        name = f"entry_{entry['output']:05d}"
        names.append(name)
        shape = entry["shape"]
        if shape["kind"] == "membership_row":
            members = shape["members"]
            body = f'''membershipRowEntry {entry['output']} {lean_ints(entry['clause'])}
  {shape['row_var']} {lean_row(shape['row'])}
  ({members[0]['var']}, ⟨{members[0]['center']}, {members[0]['point']}⟩)
  ({members[1]['var']}, ⟨{members[1]['center']}, {members[1]['point']}⟩)
  ({members[2]['var']}, ⟨{members[2]['center']}, {members[2]['point']}⟩)
  ({members[3]['var']}, ⟨{members[3]['center']}, {members[3]['point']}⟩)
  (by native_decide)'''
            body = f".membershipRow ({body})"
        elif shape["kind"] == "row_arc":
            datum = shape["reflected_datum"]
            datum_name = f"reflectedDatum_{entry['output']:05d}"
            lines += [f"def {datum_name} : DirectRowArcFiniteDatum :=",
                      f"  ⟨{lean_row(datum['row'])}, {lean_arc(datum['arc'])}⟩", ""]
            body = f'''.rowArc (rowArcEntry {entry['output']} {lean_ints(entry['clause'])}
  {shape['row_var']} {lean_row(shape['row'])} {shape['arc_var']} {lean_arc(shape['arc'])}
  {datum_name} (by native_decide))'''
        else:
            arcs = shape["arcs"]
            body = f'''.noFour (noFourEntry {entry['output']} {lean_ints(entry['clause'])}
  ({arcs[0]['var']}, {lean_arc(arcs[0])}) ({arcs[1]['var']}, {lean_arc(arcs[1])})
  ({arcs[2]['var']}, {lean_arc(arcs[2])}) ({arcs[3]['var']}, {lean_arc(arcs[3])})
  (by native_decide))'''
        lines += [f"def {name} : MirrorEntry := {body}", ""]
    list_name = f"bridgeChunk{number:02d}"
    lines += [f"def {list_name} : List MirrorEntry := [", *[f"  {name}," for name in names], "]", "",
              f"theorem {list_name}_wf : {list_name}.all MirrorEntry.wf = true := by native_decide", "",
              f"theorem {list_name}_length : {list_name}.length = {len(entries)} := by simp [{list_name}]", "",
              "end Problem97.P4MirrorOuterOccurrenceBridgeScratch", ""]
    return "\n".join(lines)


def render_core(atom_map: dict[int, dict[str, Any]]) -> str:
    # Lean 4.27 exceeds its default elaboration-heartbeat budget on one match
    # with the whole authenticated table.  Keep the exact same map, but split
    # its generated lookup into bounded absolute-variable blocks.
    block_size = 128
    block_branches: dict[int, list[str]] = {}
    for variable, semantic in atom_map.items():
        kind, atom = semantic["kind"], semantic["atom"]
        if kind == "membership":
            rendered = f".membership ⟨{atom['center']}, {atom['point']}⟩"
        elif kind == "row":
            rendered = f".row {lean_row(atom)}"
        else:
            rendered = f".arc {lean_arc(atom)}"
        block_branches.setdefault(variable // block_size, []).append(f"  | {variable} => {rendered}")

    block_definitions: list[str] = []
    dispatch_branches: list[str] = []
    for block, branches in sorted(block_branches.items()):
        name = f"atomOfVarBlock{block:02d}"
        block_definitions.extend([
            f"def {name} (n : Nat) : DenseAtom :=",
            "  match n with",
            *branches,
            "  | _ => .unused",
            "",
        ])
        dispatch_branches.append(f"  | {block} => {name} n")
    return '''/- This file is generated by ../generate.py; do not edit. -/
import P4MirrorOuterArcTransport
import BridgeCore

/-! Data schema for authenticated direct-overlay occurrences under a mirror packet.

The compact-variable table is produced only from the authenticated selected
occurrence ledger.  `Families.lean` consumes this table to prove source
satisfaction from the mirror transport APIs.
-/

namespace Problem97.P4MirrorOuterOccurrenceBridgeScratch

open P4DirectOuterArcAdapterScratch
open ATailUniqueFourExactTwoCurvatureScratch
open ATailUniqueFourExactTwoCurvatureScratch.P5CurvatureSource
open P5IndexedSourceScratch

inductive DenseAtom where
  | membership (atom : MembershipAtom)
  | row (atom : RowSupportAtom)
  | arc (atom : OuterArcAtom)
  | unused
  deriving DecidableEq

/- The authenticated compact-variable map, partitioned only for bounded Lean elaboration. -/
__ATOM_BLOCKS__

def atomOfVar (n : Nat) : DenseAtom :=
  match n / 128 with
__ATOM_DISPATCH__
  | _ => .unused

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  (distribution : ExactTwoStrictHitDistribution R) (Q : ExactTwoBoundaryCore R distribution)

def mirrorVal (n : Nat) : Prop :=
  match atomOfVar n with
  | .membership atom => mirrorMembershipVal Q atom
  | .row atom => mirrorRowSupportVal Q atom
  | .arc atom => mirrorOuterArcVal Q atom
  | .unused => False

structure CoreValAgreement (valuation : Nat → Prop) : Prop where
  atom : ∀ n, valuation n ↔ mirrorVal distribution Q n

theorem mirrorVal_agreement : CoreValAgreement distribution Q
    (mirrorVal distribution Q) := ⟨fun _ => Iff.rfl⟩

theorem membership_agree (valuation : Nat → Prop)
    (agreement : CoreValAgreement distribution Q valuation)
    (n : Nat) (atom : MembershipAtom)
    (hatom : atomOfVar n = .membership atom) :
    valuation n ↔ mirrorMembershipVal Q atom := by
  simpa [mirrorVal, hatom] using agreement.atom n

theorem row_agree (valuation : Nat → Prop)
    (agreement : CoreValAgreement distribution Q valuation)
    (n : Nat) (atom : RowSupportAtom)
    (hatom : atomOfVar n = .row atom) :
    valuation n ↔ mirrorRowSupportVal Q atom := by
  simpa [mirrorVal, hatom] using agreement.atom n

theorem arc_agree (valuation : Nat → Prop)
    (agreement : CoreValAgreement distribution Q valuation)
    (n : Nat) (atom : OuterArcAtom)
    (hatom : atomOfVar n = .arc atom) :
    valuation n ↔ mirrorOuterArcVal Q atom := by
  simpa [mirrorVal, hatom] using agreement.atom n

abbrev clauseSat (valuation : Nat → Prop) : List Int → Prop :=
  P5OccurrenceBridgeScratch.clauseSat valuation

abbrev litsSubset : List Int → List Int → Bool :=
  P5OccurrenceBridgeScratch.litsSubset

end Problem97.P4MirrorOuterOccurrenceBridgeScratch
'''.replace("__ATOM_BLOCKS__", "\n".join(block_definitions)).replace(
    "__ATOM_DISPATCH__", "\n".join(dispatch_branches)
)


def render_families() -> str:
    return '''/- This file is generated by ../generate.py; do not edit. -/
import Core

namespace Problem97.P4MirrorOuterOccurrenceBridgeScratch

open P4DirectOuterArcAdapterScratch

theorem litSat_pos {valuation : Nat → Prop} {variable : Nat}
    (h : valuation variable) : P5OccurrenceBridgeScratch.litSat valuation (variable : Int) := by
  unfold P5OccurrenceBridgeScratch.litSat
  rw [if_pos (Int.natCast_nonneg variable)]
  simpa using h

theorem litSat_neg {valuation : Nat → Prop} {variable : Nat}
    (hpositive : 1 ≤ variable) (h : ¬ valuation variable) :
    P5OccurrenceBridgeScratch.litSat valuation (-(variable : Int)) := by
  unfold P5OccurrenceBridgeScratch.litSat
  rw [if_neg (by omega)]
  simpa using h

structure MembershipRowEntry where
  outputClauseIndex : Nat
  clause : List Int
  rowVar : Nat
  row : RowSupportAtom
  m1 m2 m3 m4 : Nat × MembershipAtom

def membershipRowLits (e : MembershipRowEntry) : List Int :=
  [-((e.m1.1 : Nat) : Int), -((e.m2.1 : Nat) : Int), -((e.m3.1 : Nat) : Int),
    -((e.m4.1 : Nat) : Int), (e.rowVar : Int)]

def membershipRowWF (e : MembershipRowEntry) : Bool :=
  decide ((reflectSupport e.row.support).card = 4 ∧
    e.m1.2.center = e.row.center ∧ e.m2.2.center = e.row.center ∧
    e.m3.2.center = e.row.center ∧ e.m4.2.center = e.row.center ∧
    (∀ point, point ∈ e.row.support →
      point = e.m1.2.point ∨ point = e.m2.2.point ∨ point = e.m3.2.point ∨ point = e.m4.2.point) ∧
    atomOfVar e.rowVar = .row e.row ∧
    atomOfVar e.m1.1 = .membership e.m1.2 ∧ atomOfVar e.m2.1 = .membership e.m2.2 ∧
    atomOfVar e.m3.1 = .membership e.m3.2 ∧ atomOfVar e.m4.1 = .membership e.m4.2) &&
  litsSubset (membershipRowLits e) e.clause

def membershipRowEntry (outputClauseIndex : Nat) (clause : List Int)
    (rowVar : Nat) (row : RowSupportAtom)
    (m1 m2 m3 m4 : Nat × MembershipAtom) (_ : membershipRowWF
      { outputClauseIndex, clause, rowVar, row, m1, m2, m3, m4 } = true) : MembershipRowEntry :=
  { outputClauseIndex, clause, rowVar, row, m1, m2, m3, m4 }

structure RowArcEntry where
  outputClauseIndex : Nat
  clause : List Int
  rowVar : Nat
  row : RowSupportAtom
  arcVar : Nat
  arc : OuterArcAtom
  datum : DirectRowArcFiniteDatum

def rowArcLits (e : RowArcEntry) : List Int := [-((e.rowVar : Nat) : Int), (e.arcVar : Int)]

def rowArcWF (e : RowArcEntry) : Bool :=
  decide (e.datum.Valid ∧ e.datum.row = reflectRowSupportAtom e.row ∧
    e.datum.arc = reflectOuterArcAtom e.arc ∧ atomOfVar e.rowVar = .row e.row ∧
    atomOfVar e.arcVar = .arc e.arc) && litsSubset (rowArcLits e) e.clause

def rowArcEntry (outputClauseIndex : Nat) (clause : List Int) (rowVar : Nat)
    (row : RowSupportAtom) (arcVar : Nat) (arc : OuterArcAtom)
    (datum : DirectRowArcFiniteDatum) (_ : rowArcWF
      { outputClauseIndex, clause, rowVar, row, arcVar, arc, datum } = true) : RowArcEntry :=
  { outputClauseIndex, clause, rowVar, row, arcVar, arc, datum }

structure NoFourEntry where
  outputClauseIndex : Nat
  clause : List Int
  a1 a2 a3 a4 : Nat × OuterArcAtom

def noFourLits (e : NoFourEntry) : List Int :=
  [-((e.a1.1 : Nat) : Int), -((e.a2.1 : Nat) : Int),
    -((e.a3.1 : Nat) : Int), -((e.a4.1 : Nat) : Int)]

def noFourWF (e : NoFourEntry) : Bool :=
  decide (atomOfVar e.a1.1 = .arc e.a1.2 ∧ atomOfVar e.a2.1 = .arc e.a2.2 ∧
    atomOfVar e.a3.1 = .arc e.a3.2 ∧ atomOfVar e.a4.1 = .arc e.a4.2 ∧
    Disjoint (reflectMask e.a1.2.mask) (reflectMask e.a2.2.mask) ∧
    Disjoint (reflectMask e.a1.2.mask) (reflectMask e.a3.2.mask) ∧
    Disjoint (reflectMask e.a1.2.mask) (reflectMask e.a4.2.mask) ∧
    Disjoint (reflectMask e.a2.2.mask) (reflectMask e.a3.2.mask) ∧
    Disjoint (reflectMask e.a2.2.mask) (reflectMask e.a4.2.mask) ∧
    Disjoint (reflectMask e.a3.2.mask) (reflectMask e.a4.2.mask)) &&
  litsSubset (noFourLits e) e.clause

def noFourEntry (outputClauseIndex : Nat) (clause : List Int)
    (a1 a2 a3 a4 : Nat × OuterArcAtom) (_ : noFourWF
      { outputClauseIndex, clause, a1, a2, a3, a4 } = true) : NoFourEntry :=
  { outputClauseIndex, clause, a1, a2, a3, a4 }

inductive MirrorEntry where
  | membershipRow (entry : MembershipRowEntry)
  | rowArc (entry : RowArcEntry)
  | noFour (entry : NoFourEntry)

def MirrorEntry.outputClauseIndex : MirrorEntry → Nat
  | .membershipRow entry => entry.outputClauseIndex
  | .rowArc entry => entry.outputClauseIndex
  | .noFour entry => entry.outputClauseIndex

def MirrorEntry.clause : MirrorEntry → List Int
  | .membershipRow entry => entry.clause
  | .rowArc entry => entry.clause
  | .noFour entry => entry.clause

def MirrorEntry.wf : MirrorEntry → Bool
  | .membershipRow entry => membershipRowWF entry
  | .rowArc entry => rowArcWF entry
  | .noFour entry => noFourWF entry

end Problem97.P4MirrorOuterOccurrenceBridgeScratch
'''


def render_all(entries: list[dict[str, Any]], provenance: dict[str, str]) -> str:
    sizes = chunk_sizes(len(entries))
    imports = "\n".join(f"import BridgeChunk{number:02d}" for number in range(1, len(sizes) + 1))
    chunks = " ++ ".join(f"bridgeChunk{number:02d}" for number in range(1, len(sizes) + 1))
    lengths = ", ".join(f"bridgeChunk{number:02d}_length" for number in range(1, len(sizes) + 1))
    wfs = ", ".join(f"bridgeChunk{number:02d}_wf" for number in range(1, len(sizes) + 1))
    return f'''/- This file is generated by ../generate.py; do not edit. -/
{imports}

namespace Problem97.P4MirrorOuterOccurrenceBridgeScratch

def compactFormulaSha256 : String := "{EXPECTED['formula']}"
def occurrenceLedgerSha256 : String := "{EXPECTED['ledger']}"
def stableManifestSha256 : String := "{EXPECTED['manifest']}"
def sourceCoreSha256 : String := "{EXPECTED['source_core']}"
def sourceOccurrenceMapSha256 : String := "{EXPECTED['source_map']}"
def selectedLedgerSha256 : String := "{provenance['selected_ledger']}"
def selectedCompactCnfSha256 : String := "{provenance['selected_compact_cnf']}"
def selectedSourceCoreSha256 : String := "{provenance['selected_source_core']}"
def selectedClauseCount : Nat := {EXPECTED_COUNT}

def bridgeEntries : List MirrorEntry :=
  {chunks}

theorem bridgeEntries_length : bridgeEntries.length = {EXPECTED_COUNT} := by
  simp [bridgeEntries, {lengths}]

theorem bridgeEntries_wf : bridgeEntries.all MirrorEntry.wf = true := by
  simp [bridgeEntries, {wfs}]

end Problem97.P4MirrorOuterOccurrenceBridgeScratch
'''


def render_main() -> str:
    return '''/- This file is generated by ../generate.py; do not edit. -/
import BridgeAll

namespace Problem97.P4MirrorOuterOccurrenceBridgeScratch

open P4DirectOuterArcAdapterScratch
open ATailUniqueFourExactTwoCurvatureScratch
open ATailUniqueFourExactTwoCurvatureScratch.P5CurvatureSource
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}

theorem membershipRow_sat (Q : ExactTwoBoundaryCore R distribution)
    {valuation : Nat → Prop} (agreement : CoreValAgreement distribution Q valuation)
    (e : MembershipRowEntry) (he : membershipRowWF e = true) : clauseSat valuation e.clause := by
  simp only [membershipRowWF, Bool.and_eq_true] at he
  have hdata := of_decide_eq_true he.1
  rcases hdata with ⟨hcard, hc1, hc2, hc3, hc4, hcover, hrow, hm1, hm2, hm3, hm4⟩
  apply P5OccurrenceBridgeScratch.clauseSat_of_subset he.2
  by_cases h1 : mirrorMembershipVal Q e.m1.2
  · by_cases h2 : mirrorMembershipVal Q e.m2.2
    · by_cases h3 : mirrorMembershipVal Q e.m3.2
      · by_cases h4 : mirrorMembershipVal Q e.m4.2
        · have hrowval : mirrorRowSupportVal Q e.row :=
            mirror_direct_memberships_imply_row_pattern Q e.row hcard (by
              intro point hpoint
              rcases hcover point hpoint with hp | hp | hp | hp
              · subst point; simpa [hc1] using h1
              · subst point; simpa [hc2] using h2
              · subst point; simpa [hc3] using h3
              · subst point; simpa [hc4] using h4)
          refine ⟨(e.rowVar : Int), by simp [membershipRowLits], litSat_pos ?_⟩
          exact (row_agree distribution Q valuation agreement e.rowVar e.row hrow).mpr hrowval
        · refine ⟨-((e.m4.1 : Nat) : Int), by simp [membershipRowLits], litSat_neg (by omega) ?_⟩
          intro h; exact h4 ((membership_agree distribution Q valuation agreement e.m4.1 e.m4.2 hm4).mp h)
      · refine ⟨-((e.m3.1 : Nat) : Int), by simp [membershipRowLits], litSat_neg (by omega) ?_⟩
        intro h; exact h3 ((membership_agree distribution Q valuation agreement e.m3.1 e.m3.2 hm3).mp h)
    · refine ⟨-((e.m2.1 : Nat) : Int), by simp [membershipRowLits], litSat_neg (by omega) ?_⟩
      intro h; exact h2 ((membership_agree distribution Q valuation agreement e.m2.1 e.m2.2 hm2).mp h)
  · refine ⟨-((e.m1.1 : Nat) : Int), by simp [membershipRowLits], litSat_neg (by omega) ?_⟩
    intro h; exact h1 ((membership_agree distribution Q valuation agreement e.m1.1 e.m1.2 hm1).mp h)

theorem rowArc_sat (Q : ExactTwoBoundaryCore R distribution)
    {valuation : Nat → Prop} (agreement : CoreValAgreement distribution Q valuation)
    (e : RowArcEntry) (he : rowArcWF e = true) : clauseSat valuation e.clause := by
  simp only [rowArcWF, Bool.and_eq_true] at he
  have hdata := of_decide_eq_true he.1
  rcases hdata with ⟨hvalid, hrowDatum, harcDatum, hrow, harc⟩
  apply P5OccurrenceBridgeScratch.clauseSat_of_subset he.2
  by_cases hrowval : mirrorRowSupportVal Q e.row
  · have harcval := mirror_direct_row_pattern_implies_outer_arc Q e.row e.arc e.datum
      hvalid hrowDatum harcDatum hrowval
    refine ⟨(e.arcVar : Int), by simp [rowArcLits], litSat_pos ?_⟩
    exact (arc_agree distribution Q valuation agreement e.arcVar e.arc harc).mpr harcval
  · refine ⟨-((e.rowVar : Nat) : Int), by simp [rowArcLits], litSat_neg (by omega) ?_⟩
    intro h; exact hrowval ((row_agree distribution Q valuation agreement e.rowVar e.row hrow).mp h)

theorem noFour_sat (Q : ExactTwoBoundaryCore R distribution)
    {valuation : Nat → Prop} (agreement : CoreValAgreement distribution Q valuation)
    (e : NoFourEntry) (he : noFourWF e = true) : clauseSat valuation e.clause := by
  simp only [noFourWF, Bool.and_eq_true] at he
  have hdata := of_decide_eq_true he.1
  rcases hdata with ⟨ha1, ha2, ha3, ha4, h12, h13, h14, h23, h24, h34⟩
  apply P5OccurrenceBridgeScratch.clauseSat_of_subset he.2
  by_cases h1 : mirrorOuterArcVal Q e.a1.2
  · by_cases h2 : mirrorOuterArcVal Q e.a2.2
    · by_cases h3 : mirrorOuterArcVal Q e.a3.2
      · by_cases h4 : mirrorOuterArcVal Q e.a4.2
        · exact False.elim (mirror_direct_no_four_turn_disjoint_outer_arcs Q e.a1.2 e.a2.2 e.a3.2 e.a4.2 h1 h2 h3 h4 h12 h13 h14 h23 h24 h34)
        · refine ⟨-((e.a4.1 : Nat) : Int), by simp [noFourLits], litSat_neg (by omega) ?_⟩
          intro h; exact h4 ((arc_agree distribution Q valuation agreement e.a4.1 e.a4.2 ha4).mp h)
      · refine ⟨-((e.a3.1 : Nat) : Int), by simp [noFourLits], litSat_neg (by omega) ?_⟩
        intro h; exact h3 ((arc_agree distribution Q valuation agreement e.a3.1 e.a3.2 ha3).mp h)
    · refine ⟨-((e.a2.1 : Nat) : Int), by simp [noFourLits], litSat_neg (by omega) ?_⟩
      intro h; exact h2 ((arc_agree distribution Q valuation agreement e.a2.1 e.a2.2 ha2).mp h)
  · refine ⟨-((e.a1.1 : Nat) : Int), by simp [noFourLits], litSat_neg (by omega) ?_⟩
    intro h; exact h1 ((arc_agree distribution Q valuation agreement e.a1.1 e.a1.2 ha1).mp h)

theorem entry_sat (Q : ExactTwoBoundaryCore R distribution)
    {valuation : Nat → Prop} (agreement : CoreValAgreement distribution Q valuation)
    (entry : MirrorEntry) (hentry : entry.wf = true) : clauseSat valuation entry.clause := by
  cases entry with
  | membershipRow entry => exact membershipRow_sat Q agreement entry hentry
  | rowArc entry => exact rowArc_sat Q agreement entry hentry
  | noFour entry => exact noFour_sat Q agreement entry hentry

theorem entryList_sat (Q : ExactTwoBoundaryCore R distribution)
    {valuation : Nat → Prop} (agreement : CoreValAgreement distribution Q valuation)
    (entries : List MirrorEntry) (hentries : entries.all MirrorEntry.wf = true) :
    ∀ entry ∈ entries, clauseSat valuation entry.clause := by
  induction entries with
  | nil => simp
  | cons entry entries ih =>
      simp only [List.all_cons, Bool.and_eq_true] at hentries
      intro target htarget
      simp only [List.mem_cons] at htarget
      rcases htarget with rfl | htarget
      · exact entry_sat Q agreement entry hentries.1
      · exact ih hentries.2 target htarget

def bridgeClauses : List (List Int) := bridgeEntries.map MirrorEntry.clause

theorem bridgeClauses_length : bridgeClauses.length = selectedClauseCount := by
  simp [bridgeClauses, bridgeEntries_length, selectedClauseCount]

theorem bridgeClauses_sat (Q : ExactTwoBoundaryCore R distribution)
    {valuation : Nat → Prop} (agreement : CoreValAgreement distribution Q valuation)
    (hentries : bridgeEntries.all MirrorEntry.wf = true) :
    ∀ clause ∈ bridgeClauses, clauseSat valuation clause := by
  intro clause hclause
  simp only [bridgeClauses, List.mem_map] at hclause
  rcases hclause with ⟨entry, hentry, rfl⟩
  exact entryList_sat Q agreement bridgeEntries hentries entry hentry

theorem authenticated_bridgeClauses_sat (Q : ExactTwoBoundaryCore R distribution)
    {valuation : Nat → Prop} (agreement : CoreValAgreement distribution Q valuation) :
    ∀ clause ∈ bridgeClauses, clauseSat valuation clause :=
  bridgeClauses_sat Q agreement bridgeEntries_wf

end Problem97.P4MirrorOuterOccurrenceBridgeScratch
'''


def render_axiom_audit() -> str:
    return '''/- This file is generated by ../generate.py; do not edit. -/
import Main

namespace Problem97.P4MirrorOuterOccurrenceBridgeScratch

#print axioms mirrorVal_agreement
#print axioms bridgeEntries_wf
#print axioms authenticated_bridgeClauses_sat

end Problem97.P4MirrorOuterOccurrenceBridgeScratch
'''


def render_generated_files() -> dict[str, bytes]:
    provenance, entries = load_entries()
    rendered = {"Core.lean": render_core(dense_atom_map(entries)).encode(),
                "Families.lean": render_families().encode(), "Main.lean": render_main().encode(),
                "AxiomAudit.lean": render_axiom_audit().encode()}
    offset = 0
    for number, size in enumerate(chunk_sizes(len(entries)), start=1):
        rendered[f"BridgeChunk{number:02d}.lean"] = render_chunk(number, entries[offset:offset + size]).encode()
        offset += size
    if offset != len(entries):
        raise ValueError("unemitted entry drift")
    rendered["BridgeAll.lean"] = render_all(entries, provenance).encode()
    return rendered


def generate() -> None:
    for name, contents in render_generated_files().items():
        destination = OUT / name
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_bytes(contents)


def verify_generated() -> None:
    expected = render_generated_files()
    actual = {path.relative_to(OUT).as_posix() for path in OUT.rglob("*.lean") if path.is_file()}
    missing, extra = sorted(set(expected) - actual), sorted(actual - set(expected))
    if missing or extra:
        detail = (["missing " + ", ".join(missing)] if missing else []) + (["extra " + ", ".join(extra)] if extra else [])
        raise ValueError("generated file-set drift: " + "; ".join(detail))
    for name, contents in expected.items():
        if (OUT / name).read_bytes() != contents:
            raise ValueError(f"generated content drift: {name}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--verify-only", action="store_true")
    parser.add_argument("--print-provenance", action="store_true")
    args = parser.parse_args()
    provenance, entries = load_entries()
    if args.print_provenance:
        print(json.dumps({"count": len(entries), "counts": EXPECTED_COUNTS, **provenance}, sort_keys=True))
        return
    if args.verify_only:
        verify_generated()
    else:
        generate()
        verify_generated()
    print(json.dumps({"count": len(entries), "chunk_sizes": chunk_sizes(len(entries)), **provenance}, sort_keys=True))


if __name__ == "__main__":
    main()
