#!/usr/bin/env python3
"""Materialize the authenticated P4 critical-support source slice.

The generated Lean data is tied to the compact CNF occurrence ledger, the
source-core allocation map, and the compact variable renaming.  It contains
no solver claim: it only records the 132 compact clauses whose source
semantics are supplied by ``Core.lean`` and ``Families.lean``.
"""

from __future__ import annotations

import hashlib
import json
from collections import Counter
from pathlib import Path


HERE = Path(__file__).resolve().parent
BASE = HERE.parent
MAP = BASE / "unique4-exact-two-core-map" / "p4.input-core-map.json"
COMPACT = BASE / "unique4-exact-two-core-map" / "generated" / "p4-seed0-compact"
MANIFEST = COMPACT / "p4-seed0-compact-manifest.json"
OCCURRENCES = COMPACT / "p4-seed0-compact-occurrences.jsonl"
OUTPUT = HERE / "GeneratedData.lean"

FAMILIES = {
    "critical_support_eq_full_radius_class",
    "blocker_center_row_eq_critical_support",
    "class_source_critical_support_eq_class",
    "first_apex_fiber_eq_class",
    "critical_support_excludes_center",
    "critical_support_at_least_4",
    "first_apex_class_pairwise_equal",
}

EXPECTED_COUNT = 132


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def p4_row(center: int, point: int) -> int:
    if center == point:
        raise ValueError("diagonal P4 row atom")
    return 1 + 10 * center + (point if point < center else point - 1)


def p4_radius(center: int, left: int, right: int) -> int:
    if not (left < right and left != center and right != center):
        raise ValueError("invalid P4 radius atom")
    pairs = [(a, b) for a in range(11) for b in range(11)
             if a < b and a != center and b != center]
    return 111 + 45 * center + pairs.index((left, right))


def params(literal: dict, *keys: str) -> tuple[int, ...]:
    values = literal["parameters"]
    return tuple(int(values[key]) for key in keys)


def one(items: list[dict], family: str, polarity: str) -> dict:
    matches = [item for item in items if item["variable_family"] == family and item["polarity"] == polarity]
    if len(matches) != 1:
        raise ValueError(f"expected one {family} {polarity}, got {len(matches)}")
    return matches[0]


def classify(family: str, named: list[dict]) -> tuple[str, tuple[object, ...]]:
    if family == "first_apex_class_pairwise_equal":
        radius = one(named, "complete_radius_equality", "positive")
        classes = [item for item in named if item["variable_family"] == "first_apex_class" and item["polarity"] == "negative"]
        if len(classes) != 2:
            raise ValueError("pairwise class clause shape drifted")
        center, left, right = params(radius, "center", "left", "right")
        points = [params(item, "point")[0] for item in classes]
        if center != 0 or {left, right} != set(points):
            raise ValueError("pairwise class payload drifted")
        return "pairwise", tuple(sorted(points))

    if family == "blocker_center_row_eq_critical_support":
        rows = [item for item in named if item["variable_family"] == "selected_row_membership"]
        blockers = [item for item in named if item["variable_family"] == "blocker_choice"]
        supports = [item for item in named if item["variable_family"] == "critical_support"]
        if len(rows) != 1 or len(blockers) != 1 or len(supports) != 1:
            raise ValueError("blocker-row clause shape drifted")
        row, blocker, support = rows[0], blockers[0], supports[0]
        center, point = params(row, "center", "point")
        source, blocker_center = params(blocker, "source", "center")
        support_source, support_point = params(support, "source", "point")
        if (center, point) != (blocker_center, support_point) or source != support_source:
            raise ValueError("blocker-row payload drifted")
        if row["polarity"] == "positive" and support["polarity"] == "negative":
            return "blocker_row", (source, center, point)
        if row["polarity"] == "negative" and support["polarity"] == "positive":
            return "support_of_row", (source, center, point)
        raise ValueError("blocker-row polarities drifted")

    if family == "critical_support_eq_full_radius_class":
        blocker = one(named, "blocker_choice", "negative")
        support = [item for item in named if item["variable_family"] == "critical_support"]
        radius = [item for item in named if item["variable_family"] == "complete_radius_equality"]
        if len(support) != 1 or len(radius) != 1:
            raise ValueError("critical-support equality payload drifted")
        source, blocker_center = params(blocker, "source", "center")
        support_source, point = params(support[0], "source", "point")
        center, left, right = params(radius[0], "center", "left", "right")
        if source != support_source or center != blocker_center or {left, right} != {source, point}:
            raise ValueError("critical-support equality indices drifted")
        if support[0]["polarity"] == "positive" and radius[0]["polarity"] == "negative":
            # The compact equality atom is canonically ordered, whereas the
            # source/support roles need not be.  Preserve both views here so
            # the generated compact literal is authenticated exactly.
            return "support_of_radius", (source, center, point, left, right)
        if support[0]["polarity"] == "negative" and radius[0]["polarity"] == "positive":
            return "radius_of_support", (source, center, point, left, right)
        raise ValueError("critical-support equality polarities drifted")

    if family == "class_source_critical_support_eq_class":
        classes = [item for item in named if item["variable_family"] == "first_apex_class"]
        supports = [item for item in named if item["variable_family"] == "critical_support"]
        if len(classes) != 2 or len(supports) != 1:
            raise ValueError("class/support clause shape drifted")
        support = supports[0]
        source, point = params(support, "source", "point")
        by_point = {params(item, "point")[0]: item for item in classes}
        if set(by_point) != {source, point}:
            raise ValueError("class/support payload drifted")
        source_class, point_class = by_point[source], by_point[point]
        if (support["polarity"], source_class["polarity"], point_class["polarity"]) == (
                "negative", "negative", "positive"):
            return "class_of_support", (source, point)
        if (support["polarity"], source_class["polarity"], point_class["polarity"]) == (
                "positive", "negative", "negative"):
            return "support_of_classes", (source, point)
        raise ValueError("class/support polarities drifted")

    if family == "first_apex_fiber_eq_class":
        blocker = one(named, "blocker_choice", "positive")
        source_class = one(named, "first_apex_class", "negative")
        source, center = params(blocker, "source", "center")
        if center != 0 or params(source_class, "point")[0] != source:
            raise ValueError("first-apex fiber payload drifted")
        return "fiber", (source,)

    if family == "critical_support_excludes_center":
        blocker = one(named, "blocker_choice", "negative")
        support = one(named, "critical_support", "negative")
        source, center = params(blocker, "source", "center")
        support_source, point = params(support, "source", "point")
        if (source, center) != (support_source, point):
            raise ValueError("support-exclusion payload drifted")
        return "excludes", (source, center)

    if family == "critical_support_at_least_4":
        supports = [item for item in named if item["variable_family"] == "critical_support" and item["polarity"] == "positive"]
        if len(supports) != 8:
            raise ValueError("critical support cardinality payload drifted")
        source = params(supports[0], "source")[0]
        points = [params(item, "point")[0] for item in supports]
        if any(params(item, "source")[0] != source for item in supports) or len(set(points)) != 8:
            raise ValueError("critical support cardinality indices drifted")
        if len(set(range(11)) - set(points)) != 3:
            raise ValueError("critical support complement drifted")
        return "at_least_four", (source, tuple(points))

    raise ValueError(f"unhandled family {family}")


def lean_ints(values: list[int]) -> str:
    return "[" + ", ".join(str(value) for value in values) + "]"


def lean_shape(kind: str, args: tuple[object, ...]) -> str:
    constructors = {
        "blocker_row": "blockerRow",
        "support_of_row": "supportOfRow",
        "support_of_radius": "supportOfRadius",
        "radius_of_support": "radiusOfSupport",
        "class_of_support": "classOfSupport",
        "support_of_classes": "supportOfClasses",
    }
    if kind == "pairwise":
        return f".pairwise {args[0]} {args[1]}"
    if kind in {"blocker_row", "support_of_row", "support_of_radius", "radius_of_support"}:
        return "." + constructors[kind] + " " + " ".join(str(arg) for arg in args)
    if kind in {"class_of_support", "support_of_classes", "excludes"}:
        name = constructors.get(kind, kind)
        return "." + name + " " + " ".join(str(arg) for arg in args)
    if kind == "fiber":
        return f".fiber {args[0]}"
    if kind == "at_least_four":
        source, points = args
        return f".atLeastFour {source} {lean_ints(list(points))}"
    raise AssertionError(kind)


def render(entries: list[dict], blocker_map: dict[tuple[int, int], int], support_map: dict[tuple[int, int], int]) -> str:
    blocker_cases = "\n".join(
        f"  | {source}, {center} => {variable}" for (source, center), variable in sorted(blocker_map.items()))
    support_cases = "\n".join(
        f"  | {source}, {point} => {variable}" for (source, point), variable in sorted(support_map.items()))
    entry_lines = "\n".join(
        f"  ⟨{entry['output']}, {entry['core']}, {lean_ints(entry['dense'])}, {lean_shape(entry['kind'], entry['shape'])}⟩,"
        for entry in entries
    )
    at_least_entry_lines = "\n".join(
        f"  ⟨{entry['output']}, {entry['core']}, {lean_ints(entry['dense'])}, {lean_shape(entry['kind'], entry['shape'])}⟩,"
        for entry in entries if entry["kind"] == "at_least_four"
    )
    return f'''/- This file is generated by generate.py; do not edit. -/
import Core

/-!
# Authenticated P4 critical-support occurrence data

This generated table is checked against the compact occurrence ledger and
source-core map by `generate.py`.  It makes no satisfiability claim.
-/

namespace Problem97
namespace P4CriticalSupportOccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open ATailUniqueFourLateChoiceTerminalScratch
open RetainedKalmansonDecoderScratch
open P5IndexedSourceScratch

def compactFormulaSha256 : String := "{digest(COMPACT / 'p4-seed0-compact.cnf')}"
def occurrenceLedgerSha256 : String := "{digest(OCCURRENCES)}"
def sourceCoreMapSha256 : String := "{digest(MAP)}"
def stableManifestSha256 : String := "{digest(MANIFEST)}"

def p4EqPairs (center : Label) : List (Label × Label) :=
  (((List.finRange 11).flatMap fun left =>
    (List.finRange 11).map fun right => (left, right)).filter
      fun pair => decide (pair.1 < pair.2) && decide (pair.1 ≠ center) &&
        decide (pair.2 ≠ center))

def rowVariable (center point : Label) : Nat :=
  1 + 10 * center.val + (if point.val < center.val then point.val else point.val - 1)

def radiusVariable (center left right : Label) : Nat :=
  111 + 45 * center.val + (p4EqPairs center).idxOf (left, right)

def classVariable (point : Label) : Nat := 627 + point.val

def blockerVariable (source center : Label) : Nat :=
  match source.val, center.val with
{blocker_cases}
  | source, center => 10000 + 11 * source + center

def supportVariable (source point : Label) : Nat :=
  match source.val, point.val with
{support_cases}
  | source, point => 20000 + 11 * source + point

inductive ClauseShape where
  | pairwise (left right : Label)
  | blockerRow (source center point : Label)
  | supportOfRow (source center point : Label)
  | supportOfRadius (source center point left right : Label)
  | radiusOfSupport (source center point left right : Label)
  | classOfSupport (source point : Label)
  | supportOfClasses (source point : Label)
  | fiber (source : Label)
  | excludes (source center : Label)
  | atLeastFour (source : Label) (points : List Label)
deriving DecidableEq

def shapeLits : ClauseShape → List Int
  | .pairwise left right =>
      [(radiusVariable 0 left right : Int), -(classVariable left : Int),
        -(classVariable right : Int)]
  | .blockerRow source center point =>
      [(rowVariable center point : Int), -(blockerVariable source center : Int),
        -(supportVariable source point : Int)]
  | .supportOfRow source center point =>
      [(supportVariable source point : Int), -(rowVariable center point : Int),
        -(blockerVariable source center : Int)]
  | .supportOfRadius source center point left right =>
      [(supportVariable source point : Int), -(radiusVariable center left right : Int),
        -(blockerVariable source center : Int)]
  | .radiusOfSupport source center point left right =>
      [(radiusVariable center left right : Int), -(supportVariable source point : Int),
        -(blockerVariable source center : Int)]
  | .classOfSupport source point =>
      [(classVariable point : Int), -(classVariable source : Int),
        -(supportVariable source point : Int)]
  | .supportOfClasses source point =>
      [(supportVariable source point : Int), -(classVariable source : Int),
        -(classVariable point : Int)]
  | .fiber source => [(blockerVariable source 0 : Int), -(classVariable source : Int)]
  | .excludes source center =>
      [-(blockerVariable source center : Int), -(supportVariable source center : Int)]
  | .atLeastFour source points => points.map fun point => (supportVariable source point : Int)

def shapeWF : ClauseShape → Bool
  | .pairwise left right => decide (left < right ∧ left ≠ 0 ∧ right ≠ 0)
  | .blockerRow _ center point => decide (center ≠ point)
  | .supportOfRow _ center point => decide (center ≠ point)
  | .supportOfRadius source center point left right =>
      decide (left < right ∧ left ≠ center ∧ right ≠ center ∧
        ((source = left ∧ point = right) ∨ (source = right ∧ point = left)))
  | .radiusOfSupport source center point left right =>
      decide (left < right ∧ left ≠ center ∧ right ≠ center ∧
        ((source = left ∧ point = right) ∨ (source = right ∧ point = left)))
  | .classOfSupport _ _ => true
  | .supportOfClasses _ _ => true
  | .fiber _ => true
  | .excludes _ _ => true
  | .atLeastFour _ points => decide (points.length = 8 ∧ points.Nodup)

def isAtLeast : ClauseShape → Bool
  | .atLeastFour _ _ => true
  | _ => false

def litsSubset (needed actual : List Int) : Bool :=
  needed.all fun lit => actual.contains lit

structure BridgeEntry where
  outputClauseIndex : Nat
  sourceCoreClauseIndex : Nat
  clause : List Int
  shape : ClauseShape
deriving DecidableEq

def entryWF (entry : BridgeEntry) : Bool :=
  shapeWF entry.shape && litsSubset (shapeLits entry.shape) entry.clause

def bridgeEntries : List BridgeEntry := [
{entry_lines}
]

def bridgeClauses : List (List Int) := bridgeEntries.map BridgeEntry.clause

def atLeastEntries : List BridgeEntry := [
{at_least_entry_lines}
]

theorem bridgeEntries_wf : bridgeEntries.all entryWF = true := by native_decide
theorem bridgeEntries_shape_wf : bridgeEntries.all (fun entry => shapeWF entry.shape) = true := by
  native_decide
theorem bridgeEntries_length : bridgeEntries.length = {len(entries)} := by native_decide
theorem atLeastEntries_length : atLeastEntries.length = 2 := by native_decide
theorem atLeastEntries_eq_filter :
    atLeastEntries = bridgeEntries.filter (fun entry => isAtLeast entry.shape) := by
  native_decide

end P4CriticalSupportOccurrenceBridgeScratch
end Problem97
'''


def main() -> None:
    core_map = json.loads(MAP.read_text())
    by_core = {int(entry["core_clause_index"]): entry for entry in core_map["core_clauses"]}
    manifest = json.loads(MANIFEST.read_text())
    dense_map = {int(old): int(new) for old, new in manifest["dense_variable_renaming"]["old_to_new"]}
    occurrences = [json.loads(line) for line in OCCURRENCES.read_text().splitlines() if line]
    selected = [entry for entry in occurrences if entry["family"] in FAMILIES]
    selected.sort(key=lambda entry: int(entry["output_clause_index"]))
    if len(selected) != EXPECTED_COUNT:
        raise ValueError(f"expected {EXPECTED_COUNT} critical-support occurrences, got {len(selected)}")

    entries: list[dict] = []
    blocker_map: dict[tuple[int, int], int] = {}
    support_map: dict[tuple[int, int], int] = {}
    for occurrence in selected:
        core_index = int(occurrence["source_core_clause_index"])
        core = by_core.get(core_index)
        if core is None or core["allocated_family"] != occurrence["family"]:
            raise ValueError(f"core family mismatch at output {occurrence['output_clause_index']}")
        named = core["named_literals"]
        mapped = [
            (1 if int(item["literal"]) > 0 else -1) * dense_map[int(item["variable"])]
            for item in named
        ]
        dense = [int(value) for value in occurrence["dense_literals"]]
        if Counter(mapped) != Counter(dense):
            raise ValueError(f"compact variable map mismatch at output {occurrence['output_clause_index']}")
        kind, shape = classify(str(occurrence["family"]), named)
        for item in named:
            variable = dense_map[int(item["variable"])]
            family = item["variable_family"]
            if family == "selected_row_membership":
                center, point = params(item, "center", "point")
                if p4_row(center, point) != variable:
                    raise ValueError("P4 row compact prefix drifted")
            elif family == "complete_radius_equality":
                center, left, right = params(item, "center", "left", "right")
                if p4_radius(center, left, right) != variable:
                    raise ValueError("P4 radius compact prefix drifted")
            elif family == "first_apex_class":
                (point,) = params(item, "point")
                if 627 + point != variable:
                    raise ValueError("P4 first-apex class prefix drifted")
            elif family == "blocker_choice":
                source, center = params(item, "source", "center")
                previous = blocker_map.setdefault((source, center), variable)
                if previous != variable:
                    raise ValueError("inconsistent compact blocker variable")
            elif family == "critical_support":
                source, point = params(item, "source", "point")
                previous = support_map.setdefault((source, point), variable)
                if previous != variable:
                    raise ValueError("inconsistent compact support variable")
            else:
                raise ValueError(f"unexpected atom family {family}")
        entries.append({
            "output": int(occurrence["output_clause_index"]),
            "core": core_index,
            "dense": dense,
            "kind": kind,
            "shape": shape,
        })

    OUTPUT.write_text(render(entries, blocker_map, support_map))
    print(f"wrote {OUTPUT.relative_to(HERE)}: {len(entries)} entries, "
          f"{len(blocker_map)} blocker atoms, {len(support_map)} support atoms")


if __name__ == "__main__":
    main()
