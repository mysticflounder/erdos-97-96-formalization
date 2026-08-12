"""Generate the complete minimal two-Kalmanson family from exact-17 child 28.

The discovery side exhaustively enumerates every checked cancellation in the
authenticated model, projects each certificate to the positive row incidences
it actually consumes, and retains the inclusion-minimal supports.  For every
support it independently finds both a forward and reflected checked
certificate.  The emitted Lean file treats these records only as data: one
cardinality-generic source theorem checks every record before its four CNF
nogoods are admitted.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections.abc import Iterable
from pathlib import Path
from typing import Any

REPO = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(REPO))

from census.atail_force import producer_bank

N = 17
ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)

Hit = tuple[int, int]


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def record_core(record: dict[str, Any]) -> dict[str, Any]:
    core = record.get("core")
    if not isinstance(core, dict):
        raise TypeError("cancellation record has no core")
    return core


def path_hits(record: dict[str, Any]) -> frozenset[Hit]:
    hits: set[Hit] = set()
    for path in record_core(record)["paths"]:
        for step in path["steps"]:
            if step["kind"] == "row":
                center = int(step["center"])
                hits.add((center, int(step["first"])))
                hits.add((center, int(step["second"])))
    return frozenset(hits)


def rows_from_hits(hits: Iterable[Hit]) -> list[producer_bank.MetricRow]:
    supports: dict[int, set[int]] = {}
    for center, point in hits:
        supports.setdefault(center, set()).add(point)
    return [
        producer_bank.MetricRow(center, tuple(sorted(points)), exact=False)
        for center, points in sorted(supports.items())
    ]


def record_key(record: dict[str, Any]) -> str:
    return json.dumps(record, sort_keys=True, separators=(",", ":"))


def choose_exact_support_record(hits: frozenset[Hit]) -> dict[str, Any]:
    records = producer_bank.enumerate_two_kalmanson_cancellations(
        rows_from_hits(hits), N, tuple(range(N)), max_cores=100_000
    )
    exact = [record for record in records if path_hits(record) == hits]
    if not exact:
        raise ValueError(f"no exact-support cancellation for {sorted(hits)!r}")
    return min(exact, key=record_key)


def reflected(hits: frozenset[Hit]) -> frozenset[Hit]:
    return frozenset((N - 1 - center, N - 1 - point) for center, point in hits)


def lean_pair(pair: Iterable[int]) -> str:
    first, second = pair
    return f"({first}, {second})"


def lean_step(step: dict[str, Any]) -> str:
    if step["kind"] == "flip":
        return f".flip {step['first']} {step['second']}"
    if step["kind"] == "row":
        return f".row {step['center']} {step['first']} {step['second']}"
    raise ValueError(f"unknown primitive step {step!r}")


def lean_path(path: dict[str, Any]) -> str:
    steps = ", ".join(lean_step(step) for step in path["steps"])
    return (
        f"⟨{lean_pair(path['first'])}, [{steps}], "
        f"{lean_pair(path['last'])}⟩"
    )


def lean_choices(core: dict[str, Any]) -> str:
    choices = []
    for choice in core["row_choices"]:
        support = ", ".join(str(point) for point in choice["support"])
        choices.append(
            f"{{ center := {choice['center']}, support := {{{support}}} }}"
        )
    return "[" + ",\n        ".join(choices) + "]"


def lean_data(core: dict[str, Any]) -> str:
    paths = core["paths"]
    permutation = core["permutation"]
    return "\n".join(
        [
            "{",
            f"      firstQuad := ⟨{', '.join(map(str, core['first_quad']))}⟩",
            f"      firstForm := .{core['first_form']}",
            f"      secondQuad := ⟨{', '.join(map(str, core['second_quad']))}⟩",
            f"      secondForm := .{core['second_form']}",
            f"      permutation := ⟨{', '.join(map(str, permutation))}⟩",
            f"      path0 := {lean_path(paths[0])}",
            f"      path1 := {lean_path(paths[1])}",
            f"      path2 := {lean_path(paths[2])}",
            f"      path3 := {lean_path(paths[3])} }}",
        ]
    )


def lean_occurrence(
    hits: frozenset[Hit], forward: dict[str, Any], reverse: dict[str, Any]
) -> str:
    forward_core = record_core(forward)
    reverse_core = record_core(reverse)
    hit_text = ", ".join(lean_pair(hit) for hit in sorted(hits))
    return "\n".join(
        [
            "  { hits := [" + hit_text + "]",
            "    forwardChoices := " + lean_choices(forward_core),
            "    reverseChoices := " + lean_choices(reverse_core),
            "    forwardData := " + lean_data(forward_core),
            "    reverseData := " + lean_data(reverse_core) + " }",
        ]
    )


LEAN_PREAMBLE = r'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentySeventhModelRefinements

/-!
# Complete minimal cancellation family from exact-seventeen child 28

The child-28 model has 183 checked two-Kalmanson cancellation certificates.
Projecting them to the positive selected-row incidences actually consumed and
removing supersets leaves 64 supports.  Each record below contains separately
checked forward and reflected certificates.  One source theorem validates the
records; their 256 order/orientation nogoods form the child-29 suffix.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenTwentyEighthModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenTwentySeventhModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev priorOrientedHits :=
  ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits

private abbrev priorOccurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

private abbrev priorOccurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

private theorem sourceIndexEquiv_symm_eq_of_same
    (order : NamedOrder) (actual direction : Orientation)
    (hsame : actual = direction) (index : Label) :
    (sourceIndexEquiv order actual).symm index =
      orientedLabelAtPosition order direction index := by
  subst actual
  rfl

private theorem sourceIndexEquiv_symm_eq_reflected_of_ne
    (order : NamedOrder) (actual direction : Orientation)
    (hne : actual ≠ direction) (index : Label) :
    (sourceIndexEquiv order actual).symm index =
      orientedLabelAtPosition order direction (Fin.rev index) := by
  cases actual <;> cases direction <;>
    simp_all [sourceIndexEquiv, orientedLabelAtPosition]

private theorem positiveRowsMatch_of_same {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hsame : source.orientation = direction)
    (baseHits : List Hit) (choices : List (RowChoice Label))
    (hcover : ∀ choice ∈ choices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ baseHits)
    (hall : ∀ hit ∈ priorOrientedHits baseHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected) choices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  exact hall
    (orientedLabelAtPosition source.model.order direction choice.center,
      orientedLabelAtPosition source.model.order direction point)
    (by
      simp only [priorOrientedHits,
        ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits,
        List.mem_map]
      exact ⟨(choice.center, point), hcover choice hchoice point hpoint, rfl⟩)

private theorem positiveRowsMatch_of_ne {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hne : source.orientation ≠ direction)
    (baseHits : List Hit) (choices : List (RowChoice Label))
    (hcover : ∀ choice ∈ choices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ baseHits)
    (hall : ∀ hit ∈ priorOrientedHits baseHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected) choices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  exact hall
    (orientedLabelAtPosition source.model.order direction (Fin.rev choice.center),
      orientedLabelAtPosition source.model.order direction (Fin.rev point))
    (by
      simp only [priorOrientedHits,
        ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits,
        List.mem_map]
      exact ⟨(Fin.rev choice.center, Fin.rev point),
        hcover choice hchoice point hpoint, rfl⟩)

structure CancellationOccurrence where
  hits : List Hit
  forwardChoices : List (RowChoice Label)
  reverseChoices : List (RowChoice Label)
  forwardData : TwoKalmansonCancellationData Label
  reverseData : TwoKalmansonCancellationData Label
deriving DecidableEq

def CancellationOccurrence.check (occ : CancellationOccurrence) : Bool :=
  occ.forwardData.check occ.forwardChoices &&
  occ.reverseData.check occ.reverseChoices &&
  decide (∀ choice ∈ occ.forwardChoices, ∀ point ∈ choice.support,
    (choice.center, point) ∈ occ.hits) &&
  decide (∀ choice ∈ occ.reverseChoices, ∀ point ∈ choice.support,
    (Fin.rev choice.center, Fin.rev point) ∈ occ.hits)

private theorem false_of_cancellationOccurrenceHits {A : Finset ℝ²}
    (source : SourceRealization A) (occ : CancellationOccurrence)
    (hcheck : occ.check = true) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits occ.hits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  simp only [CancellationOccurrence.check, Bool.and_eq_true,
    decide_eq_true_eq] at hcheck
  rcases hcheck with ⟨⟨⟨hforward, hreverse⟩, hforwardCover⟩,
    hreverseCover⟩
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_twoKalmansonCancellationData_of_check
      source.carrier_convexIndep source.boundary_image source.boundary_ccw
      hreal occ.forwardChoices
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        occ.hits occ.forwardChoices hforwardCover hall)
      occ.forwardData hforward
  · exact false_of_twoKalmansonCancellationData_of_check
      source.carrier_convexIndep source.boundary_image source.boundary_ccw
      hreal occ.reverseChoices
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        occ.hits occ.reverseChoices hreverseCover hall)
      occ.reverseData hreverse

theorem sourceAssign_cancellationOccurrenceClause {A : Finset ℝ²}
    (source : SourceRealization A) (occ : CancellationOccurrence)
    (hcheck : occ.check = true) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (priorOccurrenceClause occ.hits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_cancellationOccurrenceHits source occ hcheck order direction
    horder.symm hall

def cancellationOccurrences : List CancellationOccurrence :=
'''


LEAN_POSTAMBLE = r'''

theorem cancellationOccurrences_length : cancellationOccurrences.length = 64 := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def twentyEighthModelRefinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => priorOccurrenceClauses occ.hits

theorem twentyEighthModelRefinementClauses_length :
    twentyEighthModelRefinementClauses.length = 256 := by
  native_decide

theorem sourceAssign_twentyEighthModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ twentyEighthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [twentyEighthModelRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp cancellationOccurrences_all_check occ hocc
  simp only [priorOccurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

def extendedTwentyEighthModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedTwentySeventhModelRefinementsCnf ++
    twentyEighthModelRefinementClauses

theorem extendedTwentyEighthModelRefinementsCnf_length :
    extendedTwentyEighthModelRefinementsCnf.length = 5846544 := by
  native_decide

theorem sourceAssign_extendedTwentyEighthModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedTwentyEighthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedTwentyEighthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedTwentySeventhModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_twentyEighthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedTwentyEighthModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedTwentyEighthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedTwentyEighthModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedTwentyEighthModelRefinementsCnf

end ATailBlockerVExactSeventeenTwentyEighthModelRefinements
end Problem97
'''


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--analysis", type=Path, required=True)
    parser.add_argument("--lean-output", type=Path, required=True)
    parser.add_argument("--ledger-output", type=Path, required=True)
    args = parser.parse_args()

    analysis = json.loads(args.analysis.read_text(encoding="utf-8"))
    if analysis["status"] != "PASS" or analysis["named_orders"] not in ([0], [1]):
        raise ValueError("expected one authenticated SAT named-order model")
    order = ORDERS[analysis["named_orders"][0]]
    rows = [
        producer_bank.MetricRow(int(center), tuple(points), exact=False)
        for center, points in sorted(
            analysis["rows"].items(), key=lambda item: int(item[0])
        )
    ]
    records = producer_bank.enumerate_two_kalmanson_cancellations(
        rows, N, order, max_cores=100_000
    )
    supports = sorted({path_hits(record) for record in records}, key=lambda h: (len(h), sorted(h)))
    minimal = [
        hits for hits in supports
        if not any(other < hits for other in supports)
    ]
    if (len(records), len(supports), len(minimal)) != (183, 104, 64):
        raise ValueError(
            "unexpected census: "
            f"{len(records)} records, {len(supports)} supports, {len(minimal)} minimal"
        )

    entries = []
    lean_entries = []
    for hits in minimal:
        forward = choose_exact_support_record(hits)
        reverse_hits = reflected(hits)
        reverse = choose_exact_support_record(reverse_hits)
        if path_hits(forward) != hits or path_hits(reverse) != reverse_hits:
            raise AssertionError("chosen certificate does not consume the exact support")
        entries.append(
            {
                "hits": [list(hit) for hit in sorted(hits)],
                "forward_record": forward,
                "reverse_record": reverse,
            }
        )
        lean_entries.append(lean_occurrence(hits, forward, reverse))

    args.lean_output.parent.mkdir(parents=True, exist_ok=True)
    args.lean_output.write_text(
        LEAN_PREAMBLE + "[\n" + ",\n".join(lean_entries) + "]\n" + LEAN_POSTAMBLE,
        encoding="utf-8",
    )
    ledger = {
        "schema": "p97-exact17-child28-all-minimal-two-kalmanson/v1",
        "source_analysis": str(args.analysis),
        "source_analysis_sha256": sha256_file(args.analysis),
        "record_count": len(records),
        "distinct_support_count": len(supports),
        "minimal_support_count": len(minimal),
        "emitted_clause_count": 4 * len(minimal),
        "entries": entries,
    }
    args.ledger_output.parent.mkdir(parents=True, exist_ok=True)
    args.ledger_output.write_text(
        json.dumps(ledger, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        f"generated {args.lean_output} and {args.ledger_output}: "
        f"{len(records)} records -> {len(minimal)} minimal -> {4 * len(minimal)} clauses"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
