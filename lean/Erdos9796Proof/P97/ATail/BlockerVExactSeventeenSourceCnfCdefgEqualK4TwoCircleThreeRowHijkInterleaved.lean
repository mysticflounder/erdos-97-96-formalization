/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijk
import Erdos9796Proof.P97.ATail.KalmansonThreeEqualitySchemas

/-!
# Interleaved three-row clauses for the exact-seventeen source CNF

This module extends the checked H--K child by every cyclic placement of the
cardinality-independent six-hit obstruction

```text
B : C,D
E : A,D
F : A,C
```

on six boundary positions `A < B < C < D < E < F`.  Both source
orientations are proved impossible before the clauses enter the
Lean-authoritative CNF.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleaved

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircle
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRow
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijk
open CapCrossingKalmansonBridge

/-- Six selected-row hits for the interleaved three-row obstruction. -/
def interleavedHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, d, e, f] =>
      let p := placedLabel order direction cut
      [(p b, p c), (p b, p d),
        (p e, p 0), (p e, p d),
        (p f, p 0), (p f, p c)]
  | _ => []

private theorem false_of_interleaved_at {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut b c d e f : Label)
    (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (hcB : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut b))
    (hdB : placedLabel order direction cut d ∈
      r.model.selected (placedLabel order direction cut b))
    (haE : placedLabel order direction cut 0 ∈
      r.model.selected (placedLabel order direction cut e))
    (hdE : placedLabel order direction cut d ∈
      r.model.selected (placedLabel order direction cut e))
    (haF : placedLabel order direction cut 0 ∈
      r.model.selected (placedLabel order direction cut f))
    (hcF : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut f)) : False := by
  have hcB' := mem_placedRow_of_mem_model r order direction cut b c horder hcB
  have hdB' := mem_placedRow_of_mem_model r order direction cut b d horder hdB
  have haE' := mem_placedRow_of_mem_model r order direction cut e 0 horder haE
  have hdE' := mem_placedRow_of_mem_model r order direction cut e d horder hdE
  have haF' := mem_placedRow_of_mem_model r order direction cut f 0 horder haF
  have hcF' := mem_placedRow_of_mem_model r order direction cut f c horder hcF
  by_cases hsame : r.orientation = direction
  · exact false_of_three_selected_rows_interleaved_cyclicShift
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hcd))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hde))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hef))
      (placedRow r order direction cut b horder)
      (placedRow r order direction cut e horder)
      (placedRow r order direction cut f horder)
      hcB' hdB' haE' hdE' haF' hcF'
  · exact false_of_three_selected_rows_interleaved_cyclicShift_of_decreasing
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hcd))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hde))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hef))
      (placedRow r order direction cut b horder)
      (placedRow r order direction cut e horder)
      (placedRow r order direction cut f horder)
      hcB' hdB' haE' hdE' haF' hcF'

/-- Every generated interleaved clause is true under a source realization. -/
theorem sourceAssign_interleavedClause {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut : Label) (offsets : List Label)
    (hoffsets : offsets ∈
      ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijk.fiveOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (nogoodClause order (interleavedHits order direction cut offsets)) = true := by
  obtain ⟨b, c, d, e, f, rfl, h0b, hbc, hcd, hde, hef⟩ :=
    ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijk.fiveOffsetChoices_shape
      offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  have get (center point : Label)
      (hmem : (placedLabel order direction cut center,
          placedLabel order direction cut point) ∈
        interleavedHits order direction cut [b, c, d, e, f]) :
      placedLabel order direction cut point ∈
        r.model.selected (placedLabel order direction cut center) :=
    hall _ hmem
  exact false_of_interleaved_at r order direction cut b c d e f horder.symm
    h0b hbc hcd hde hef
    (get b c (by simp [interleavedHits]))
    (get b d (by simp [interleavedHits]))
    (get e 0 (by simp [interleavedHits]))
    (get e d (by simp [interleavedHits]))
    (get f 0 (by simp [interleavedHits]))
    (get f c (by simp [interleavedHits]))

/-- Complete guarded cyclic orbit of the interleaved three-row clause. -/
def interleavedClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.flatMap fun direction =>
      labels.flatMap fun cut =>
        ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijk.fiveOffsetChoices.map
          fun offsets =>
          nogoodClause order (interleavedHits order direction cut offsets)

/-- Every source realization satisfies the complete interleaved family. -/
theorem sourceAssign_interleavedClauses {A : Finset ℝ²}
    (r : SourceRealization A) :
    ∀ clause ∈ interleavedClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  simp only [interleavedClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection,
    cut, _hcut, offsets, hoffsets, rfl⟩ := hclause
  exact sourceAssign_interleavedClause r order direction cut offsets hoffsets

/-- Lean-authoritative child root after the interleaved three-row family. -/
def extendedInterleavedCnf : Std.Sat.CNF Atom :=
  extendedHijkCnf ++ interleavedClauses

/-- Exact size of the complete interleaved three-row family. -/
theorem interleavedClauses_length : interleavedClauses.length = 297024 := by
  native_decide

/-- Exact clause count of the Lean-authoritative interleaved child root. -/
theorem extendedInterleavedCnf_clause_count :
    extendedInterleavedCnf.length = 3915420 := by
  simp [extendedInterleavedCnf, extendedHijkCnf_clause_count,
    interleavedClauses_length]

/-- Gate B for the complete interleaved child root. -/
theorem sourceAssign_extendedInterleavedCnf {A : Finset ℝ²}
    (r : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign r.model) extendedInterleavedCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedInterleavedCnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedHijkCnf r
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_interleavedClauses r clause hnew

/-- Certificate-to-source landing contract for the interleaved child root. -/
theorem false_of_sourceRealization_of_extendedInterleavedCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedInterleavedCnf = true) : False := by
  rcases hsource with ⟨r⟩
  exact hunsat ⟨sourceAssign r.model, sourceAssign_extendedInterleavedCnf r⟩

end ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleaved
end Problem97
