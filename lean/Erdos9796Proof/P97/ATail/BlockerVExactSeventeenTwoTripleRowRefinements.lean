/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThreeRowCycleRefinements
import Erdos9796Proof.P97.ATail.TwoTripleRowSixPointEuclideanObstruction

/-!
# Two-triple-row clauses for the exact-seventeen source CNF

This module extends the complete three-row-cycle bank by every cyclic placement
of the already-proved two-row Euclidean obstruction

```text
B : A,C,D
F : A,D,E
```

on six boundary positions `A < B < C < D < E < F`.  Both source orientations
are proved impossible before the clauses enter the Lean-authoritative CNF.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenTwoTripleRowRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenThreeRowCycleRefinements
open TwoTripleRowSixPointEuclideanObstruction

/-- Six selected-row hits for the two-triple-row obstruction. -/
def twoTripleRowHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, d, e, f] =>
      let point := placedLabel order direction cut
      [(point b, point 0), (point b, point c), (point b, point d),
        (point f, point 0), (point f, point d), (point f, point e)]
  | _ => []

/-- A source-authenticated two-triple-row occurrence is impossible at every
normalized cyclic placement. -/
theorem false_of_twoTripleRow_at {A : Finset ℝ²} (r : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) (cut b c d e f : Label)
    (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (haB : placedLabel order direction cut 0 ∈
      r.model.selected (placedLabel order direction cut b))
    (hcB : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut b))
    (hdB : placedLabel order direction cut d ∈
      r.model.selected (placedLabel order direction cut b))
    (haF : placedLabel order direction cut 0 ∈
      r.model.selected (placedLabel order direction cut f))
    (hdF : placedLabel order direction cut d ∈
      r.model.selected (placedLabel order direction cut f))
    (heF : placedLabel order direction cut e ∈
      r.model.selected (placedLabel order direction cut f)) : False := by
  have haB' := mem_placedRow_of_mem_model r order direction cut b 0 horder haB
  have hcB' := mem_placedRow_of_mem_model r order direction cut b c horder hcB
  have hdB' := mem_placedRow_of_mem_model r order direction cut b d horder hdB
  have haF' := mem_placedRow_of_mem_model r order direction cut f 0 horder haF
  have hdF' := mem_placedRow_of_mem_model r order direction cut f d horder hdF
  have heF' := mem_placedRow_of_mem_model r order direction cut f e horder heF
  by_cases hsame : r.orientation = direction
  · exact false_of_two_selected_rows_triple_support_cyclicShift
      r.cardBoundary_injective r.cardBoundary_ccw
      (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hcd))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hde))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hef))
      (placedRow r order direction cut b horder)
      (placedRow r order direction cut f horder)
      haB' hcB' hdB' haF' hdF' heF'
  · exact false_of_two_selected_rows_triple_support_cyclicShift_of_decreasing
      r.cardBoundary_injective r.cardBoundary_ccw
      (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hcd))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hde))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hef))
      (placedRow r order direction cut b horder)
      (placedRow r order direction cut f horder)
      haB' hcB' hdB' haF' hdF' heF'

/-- One guarded two-triple-row clause is source-valid. -/
theorem sourceAssign_twoTripleRowClause {A : Finset ℝ²} (r : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) (cut : Label)
    (offsets : List Label) (hoffsets : offsets ∈ fiveOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (nogoodClause order (twoTripleRowHits order direction cut offsets)) = true := by
  obtain ⟨b, c, d, e, f, rfl, h0b, hbc, hcd, hde, hef⟩ :=
    fiveOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  have get (center point : Label)
      (hmem : (placedLabel order direction cut center,
          placedLabel order direction cut point) ∈
        twoTripleRowHits order direction cut [b, c, d, e, f]) :
      placedLabel order direction cut point ∈
        r.model.selected (placedLabel order direction cut center) :=
    hall _ hmem
  exact false_of_twoTripleRow_at r order direction cut b c d e f horder.symm
    h0b hbc hcd hde hef
    (get b 0 (by simp [twoTripleRowHits]))
    (get b c (by simp [twoTripleRowHits]))
    (get b d (by simp [twoTripleRowHits]))
    (get f 0 (by simp [twoTripleRowHits]))
    (get f d (by simp [twoTripleRowHits]))
    (get f e (by simp [twoTripleRowHits]))

/-- Complete guarded cyclic orbit of the two-triple-row obstruction. -/
def twoTripleRowClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.flatMap fun direction =>
      labels.flatMap fun cut =>
        fiveOffsetChoices.map fun offsets =>
          nogoodClause order (twoTripleRowHits order direction cut offsets)

theorem twoTripleRowClauses_length : twoTripleRowClauses.length = 297024 := by
  simp [twoTripleRowClauses, namedOrders, directions, labels,
    fiveOffsetChoices_length]

/-- Every source realization satisfies the complete two-triple-row bank. -/
theorem sourceAssign_twoTripleRowClauses {A : Finset ℝ²}
    (r : SourceRealization A) : ∀ clause ∈ twoTripleRowClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  simp only [twoTripleRowClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection,
    cut, _hcut, offsets, hoffsets, rfl⟩ := hclause
  exact sourceAssign_twoTripleRowClause r order direction cut offsets hoffsets

/-- Current exact-seventeen root extended by the complete two-triple-row bank. -/
def extendedTwoTripleRowCnf : Std.Sat.CNF Atom :=
  extendedThreeRowCycleCnf ++ twoTripleRowClauses

theorem extendedTwoTripleRowCnf_length : extendedTwoTripleRowCnf.length = 7036960 := by
  simp [extendedTwoTripleRowCnf, extendedThreeRowCycleCnf_length,
    twoTripleRowClauses_length]

/-- Every source realization satisfies the complete extended formula. -/
theorem sourceAssign_extendedTwoTripleRowCnf {A : Finset ℝ²}
    (r : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign r.model) extendedTwoTripleRowCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedTwoTripleRowCnf, List.mem_append] at hclause
  rcases hclause with hparent | hnew
  · have h := sourceAssign_extendedThreeRowCycleCnf r
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_twoTripleRowClauses r clause hnew

/-- Explicit terminal landing contract for the two-triple-row root. -/
theorem false_of_sourceRealization_of_extendedTwoTripleRowCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedTwoTripleRowCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedTwoTripleRowCnf source⟩

#print axioms sourceAssign_twoTripleRowClauses
#print axioms sourceAssign_extendedTwoTripleRowCnf
#print axioms false_of_sourceRealization_of_extendedTwoTripleRowCnf_unsat

end ATailBlockerVExactSeventeenTwoTripleRowRefinements
end Problem97
