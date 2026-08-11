/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircle

/-!
# Checked three-row Kalmanson clauses for the exact-seventeen source CNF

This module extends the checked two-circle child by every cyclic placement of
the five-point obstruction with boundary roles `O,A,Y,E,C` and selected-row
incidences

```text
Y : O,E
O : E,C
A : C,O.
```

Both source orientations are proved impossible before the family is admitted
to the Lean-authoritative child CNF.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRow

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircle
open CapCrossingKalmansonBridge

/-- Increasing four-offset choices for five-point cyclic placements. -/
def fourOffsetChoices : List (List Label) :=
  positiveOffsets.sublistsLen 4

/-- Every enumerated four-offset list is strictly ordered after zero. -/
theorem fourOffsetChoices_shape :
    ∀ offsets, offsets ∈ fourOffsetChoices →
      ∃ a y e c : Label,
        offsets = [a, y, e, c] ∧
          (0 : Label) < a ∧ a < y ∧ y < e ∧ e < c := by
  intro offsets hoffsets
  obtain ⟨hsub, hlen⟩ := List.mem_sublistsLen.mp hoffsets
  have hp : offsets.Pairwise (· < ·) :=
    List.Pairwise.sublist hsub positiveOffsets_pairwise
  rcases offsets with _ | ⟨a, offsets⟩
  · simp at hlen
  rcases offsets with _ | ⟨y, offsets⟩
  · simp at hlen
  rcases offsets with _ | ⟨e, offsets⟩
  · simp at hlen
  rcases offsets with _ | ⟨c, offsets⟩
  · simp at hlen
  rcases offsets with _ | ⟨d, offsets⟩
  · refine ⟨a, y, e, c, rfl, positiveOffsets_pos a ?_, ?_⟩
    · exact hsub.subset (by simp)
    · simp only [List.pairwise_cons, List.mem_cons, forall_eq_or_imp] at hp
      aesop
  · simp at hlen

/-- The six selected-row hits in the five-point Kalmanson obstruction. -/
def threeRowHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [a, y, e, c] =>
      let point := placedLabel order direction cut
      [(point y, point 0), (point y, point e),
        (point 0, point e), (point 0, point c),
        (point a, point c), (point a, point 0)]
  | _ => []

/-- Increasing cyclic-shift form of the three-row Kalmanson obstruction. -/
theorem false_of_threeRows_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {o a y e c : Fin carrier.card}
    (hoa : o < a) (hay : a < y) (hye : y < e) (hec : e < c)
    (ORow : SelectedFourClass carrier (boundary (o + cut)))
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (YRow : SelectedFourClass carrier (boundary (y + cut)))
    (hoY : boundary (o + cut) ∈ YRow.support)
    (heY : boundary (e + cut) ∈ YRow.support)
    (heO : boundary (e + cut) ∈ ORow.support)
    (hcO : boundary (c + cut) ∈ ORow.support)
    (hcA : boundary (c + cut) ∈ ARow.support)
    (hoA : boundary (o + cut) ∈ ARow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  exact false_of_selected_rows_in_five_ccw_order hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hoa hay hye hec ORow ARow YRow hoY heY heO hcO hcA hoA

/-- Decreasing cyclic-shift form of the same three-row obstruction. -/
theorem false_of_threeRows_cyclicShift_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {o a y e c : Fin carrier.card}
    (hao : a < o) (hya : y < a) (hey : e < y) (hce : c < e)
    (ORow : SelectedFourClass carrier (boundary (o + cut)))
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (YRow : SelectedFourClass carrier (boundary (y + cut)))
    (hoY : boundary (o + cut) ∈ YRow.support)
    (heY : boundary (e + cut) ∈ YRow.support)
    (heO : boundary (e + cut) ∈ ORow.support)
    (hcO : boundary (c + cut) ∈ ORow.support)
    (hcA : boundary (c + cut) ∈ ARow.support)
    (hoA : boundary (o + cut) ∈ ARow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  have hshifted_inj : Function.Injective shifted := by
    simpa only [shifted] using injective_cyclicShift hboundary_injective cut
  have hshifted_image : Finset.univ.image shifted = carrier := by
    simpa only [shifted] using
      (image_univ_cyclicShift boundary cut).trans hboundary_image
  have hshifted_ccw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
    simpa only [shifted] using
      isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut
  have hYRow : dist (shifted y) (shifted o) = dist (shifted y) (shifted e) :=
    (YRow.support_eq_radius _ hoY).trans
      (YRow.support_eq_radius _ heY).symm
  have hORow : dist (shifted o) (shifted e) = dist (shifted o) (shifted c) :=
    (ORow.support_eq_radius _ heO).trans
      (ORow.support_eq_radius _ hcO).symm
  have hARow : dist (shifted a) (shifted c) = dist (shifted a) (shifted o) :=
    (ARow.support_eq_radius _ hcA).trans
      (ARow.support_eq_radius _ hoA).symm
  have hAO_lt_AE :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hshifted_inj
      hshifted_image hshifted_ccw hey hya hao
  have hAE_lt_AO :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hshifted_inj
      hshifted_image hshifted_ccw hce (hey.trans hya) hao
  have hYRow' : dist (shifted e) (shifted y) = dist (shifted y) (shifted o) := by
    simpa only [dist_comm (shifted e) (shifted y)] using hYRow.symm
  have hORow' : dist (shifted c) (shifted o) = dist (shifted e) (shifted o) := by
    simpa only [dist_comm (shifted c) (shifted o),
      dist_comm (shifted e) (shifted o)] using hORow.symm
  have hARow' : dist (shifted c) (shifted a) = dist (shifted a) (shifted o) := by
    simpa only [dist_comm (shifted c) (shifted a)] using hARow
  linarith

/-- Source-authenticated three-row Kalmanson incidence is impossible at every
normalized cyclic placement. -/
theorem false_of_threeRow_at {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut a y e c : Label)
    (horder : order = r.model.order)
    (h0a : (0 : Label) < a) (hay : a < y) (hye : y < e) (hec : e < c)
    (hoY : placedLabel order direction cut 0 ∈
      r.model.selected (placedLabel order direction cut y))
    (heY : placedLabel order direction cut e ∈
      r.model.selected (placedLabel order direction cut y))
    (heO : placedLabel order direction cut e ∈
      r.model.selected (placedLabel order direction cut 0))
    (hcO : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut 0))
    (hcA : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut a))
    (hoA : placedLabel order direction cut 0 ∈
      r.model.selected (placedLabel order direction cut a)) : False := by
  have hoY' := mem_placedRow_of_mem_model r order direction cut y 0 horder hoY
  have heY' := mem_placedRow_of_mem_model r order direction cut y e horder heY
  have heO' := mem_placedRow_of_mem_model r order direction cut 0 e horder heO
  have hcO' := mem_placedRow_of_mem_model r order direction cut 0 c horder hcO
  have hcA' := mem_placedRow_of_mem_model r order direction cut a c horder hcA
  have hoA' := mem_placedRow_of_mem_model r order direction cut a 0 horder hoA
  by_cases hsame : r.orientation = direction
  · exact false_of_threeRows_cyclicShift
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame h0a))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hay))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hye))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hec))
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut a horder)
      (placedRow r order direction cut y horder)
      hoY' heY' heO' hcO' hcA' hoA'
  · exact false_of_threeRows_cyclicShift_of_decreasing
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame h0a))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hay))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hye))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hec))
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut a horder)
      (placedRow r order direction cut y horder)
      hoY' heY' heO' hcO' hcA' hoA'

/-- Every generated three-row clause is true under a source realization. -/
theorem sourceAssign_threeRowClause {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut : Label) (offsets : List Label)
    (hoffsets : offsets ∈ fourOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (nogoodClause order (threeRowHits order direction cut offsets)) = true := by
  obtain ⟨a, y, e, c, rfl, h0a, hay, hye, hec⟩ :=
    fourOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  apply false_of_threeRow_at r order direction cut a y e c horder.symm
    h0a hay hye hec
  · exact hall (placedLabel order direction cut y,
      placedLabel order direction cut 0) (by simp [threeRowHits])
  · exact hall (placedLabel order direction cut y,
      placedLabel order direction cut e) (by simp [threeRowHits])
  · exact hall (placedLabel order direction cut 0,
      placedLabel order direction cut e) (by simp [threeRowHits])
  · exact hall (placedLabel order direction cut 0,
      placedLabel order direction cut c) (by simp [threeRowHits])
  · exact hall (placedLabel order direction cut a,
      placedLabel order direction cut c) (by simp [threeRowHits])
  · exact hall (placedLabel order direction cut a,
      placedLabel order direction cut 0) (by simp [threeRowHits])

/-- Complete guarded three-row Kalmanson clause family. -/
def threeRowClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.flatMap fun direction =>
      labels.flatMap fun cut =>
        fourOffsetChoices.map fun offsets =>
          nogoodClause order (threeRowHits order direction cut offsets)

/-- Every source realization satisfies the complete three-row family. -/
theorem sourceAssign_threeRowClauses {A : Finset ℝ²}
    (r : SourceRealization A) :
    ∀ clause ∈ threeRowClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  simp only [threeRowClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, cut, _hcut,
    offsets, hoffsets, rfl⟩ := hclause
  exact sourceAssign_threeRowClause r order direction cut offsets hoffsets

/-- Lean-authoritative child root after the complete three-row family. -/
def extendedThreeRowCnf : Std.Sat.CNF Atom :=
  extendedTwoCircleCnf ++ threeRowClauses

/-- Exact size of the complete three-row clause family. -/
theorem threeRowClauses_length : threeRowClauses.length = 123760 := by
  native_decide

/-- Exact clause count of the Lean-authoritative child root. -/
theorem extendedThreeRowCnf_clause_count :
    extendedThreeRowCnf.length = 2430300 := by
  simp [extendedThreeRowCnf, extendedTwoCircleCnf_clause_count,
    threeRowClauses_length]

/-- Gate B for the complete three-row child root. -/
theorem sourceAssign_extendedThreeRowCnf {A : Finset ℝ²}
    (r : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign r.model) extendedThreeRowCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedThreeRowCnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedTwoCircleCnf r
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_threeRowClauses r clause hnew

/-- Certificate-to-source landing contract for the complete three-row root. -/
theorem false_of_sourceRealization_of_extendedThreeRowCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedThreeRowCnf = true) :
    False := by
  rcases hsource with ⟨r⟩
  exact hunsat ⟨sourceAssign r.model, sourceAssign_extendedThreeRowCnf r⟩

end ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRow
end Problem97
