/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnfCdefgEqualK4

/-!
# Checked two-circle shared-pair clauses for the exact-seventeen source CNF

This module extends the checked C--G plus equal-K4 root by every cyclic
placement of the four-point Kalmanson obstruction in which the two endpoint
rows share both middle vertices.  Each clause is guarded by the source's named
order, and both possible source orientations are discharged geometrically.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircle

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4
open CapCrossingKalmansonBridge

/-- Increasing three-offset choices for four-point cyclic placements. -/
def threeOffsetChoices : List (List Label) :=
  positiveOffsets.sublistsLen 3

/-- Every enumerated three-offset list is strictly ordered after zero. -/
theorem threeOffsetChoices_shape :
    ∀ offsets, offsets ∈ threeOffsetChoices →
      ∃ b c d : Label,
        offsets = [b, c, d] ∧
          (0 : Label) < b ∧ b < c ∧ c < d := by
  intro offsets hoffsets
  obtain ⟨hsub, hlen⟩ := List.mem_sublistsLen.mp hoffsets
  have hp : offsets.Pairwise (· < ·) :=
    List.Pairwise.sublist hsub positiveOffsets_pairwise
  rcases offsets with _ | ⟨b, offsets⟩
  · simp at hlen
  rcases offsets with _ | ⟨c, offsets⟩
  · simp at hlen
  rcases offsets with _ | ⟨d, offsets⟩
  · simp at hlen
  rcases offsets with _ | ⟨e, offsets⟩
  · refine ⟨b, c, d, rfl, positiveOffsets_pos b ?_, ?_⟩
    · exact hsub.subset (by simp)
    · simp only [List.pairwise_cons, List.mem_cons, forall_eq_or_imp] at hp
      aesop
  · simp at hlen

/-- The two endpoint-center rows and their shared middle pair. -/
def endpointSharedPairHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [b, c, d] =>
      let point := placedLabel order direction cut
      [(point 0, point b), (point 0, point c),
        (point d, point b), (point d, point c)]
  | _ => []

/-- Increasing cyclic-shift selected-row form of the endpoint-center
Kalmanson obstruction. -/
theorem false_of_endpointRows_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (DRow : SelectedFourClass carrier (boundary (d + cut)))
    (hbA : boundary (b + cut) ∈ ARow.support)
    (hcA : boundary (c + cut) ∈ ARow.support)
    (hbD : boundary (b + cut) ∈ DRow.support)
    (hcD : boundary (c + cut) ∈ DRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  apply false_of_four_ccw_endpoint_centers_bisect_middle_pair
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hab hbc hcd
  · exact (ARow.support_eq_radius _ hbA).trans
      (ARow.support_eq_radius _ hcA).symm
  · exact (DRow.support_eq_radius _ hbD).trans
      (DRow.support_eq_radius _ hcD).symm

/-- Decreasing cyclic-shift selected-row form of the same endpoint-center
obstruction. -/
theorem false_of_endpointRows_cyclicShift_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (DRow : SelectedFourClass carrier (boundary (d + cut)))
    (hbA : boundary (b + cut) ∈ ARow.support)
    (hcA : boundary (c + cut) ∈ ARow.support)
    (hbD : boundary (b + cut) ∈ DRow.support)
    (hcD : boundary (c + cut) ∈ DRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  apply false_of_four_ccw_endpoint_centers_bisect_middle_pair
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hdc hcb hba
  · exact (DRow.support_eq_radius _ hcD).trans
      (DRow.support_eq_radius _ hbD).symm
  · exact (ARow.support_eq_radius _ hcA).trans
      (ARow.support_eq_radius _ hbA).symm

/-- Source-authenticated endpoint-center sharing is impossible at every
normalized cyclic placement. -/
theorem false_of_endpointSharedPair_at {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut b c d : Label)
    (horder : order = r.model.order)
    (h0b : (0 : Label) < b) (hbc : b < c) (hcd : c < d)
    (hbA : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut 0))
    (hcA : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut 0))
    (hbD : placedLabel order direction cut b ∈
      r.model.selected (placedLabel order direction cut d))
    (hcD : placedLabel order direction cut c ∈
      r.model.selected (placedLabel order direction cut d)) : False := by
  have hbA' := mem_placedRow_of_mem_model r order direction cut 0 b horder hbA
  have hcA' := mem_placedRow_of_mem_model r order direction cut 0 c horder hcA
  have hbD' := mem_placedRow_of_mem_model r order direction cut d b horder hbD
  have hcD' := mem_placedRow_of_mem_model r order direction cut d c horder hcD
  by_cases hsame : r.orientation = direction
  · exact false_of_endpointRows_cyclicShift
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_same hsame hcd))
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut d horder) hbA' hcA' hbD' hcD'
  · exact false_of_endpointRows_cyclicShift_of_decreasing
      r.carrier_convexIndep r.cardBoundary_injective r.cardBoundary_image
      r.cardBoundary_ccw (r.toCardIndex (consumerCut r.orientation direction cut))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame h0b))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hbc))
      (r.toCardIndex_lt (localPosition_lt_of_ne hsame hcd))
      (placedRow r order direction cut 0 horder)
      (placedRow r order direction cut d horder) hbA' hcA' hbD' hcD'

/-- Every generated endpoint-center clause is true under a source realization. -/
theorem sourceAssign_endpointSharedPairClause {A : Finset ℝ²}
    (r : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut : Label) (offsets : List Label)
    (hoffsets : offsets ∈ threeOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign r.model)
      (nogoodClause order
        (endpointSharedPairHits order direction cut offsets)) = true := by
  obtain ⟨b, c, d, rfl, h0b, hbc, hcd⟩ :=
    threeOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro horder hall
  apply false_of_endpointSharedPair_at r order direction cut b c d horder.symm
    h0b hbc hcd
  · exact hall (placedLabel order direction cut 0,
      placedLabel order direction cut b) (by simp [endpointSharedPairHits])
  · exact hall (placedLabel order direction cut 0,
      placedLabel order direction cut c) (by simp [endpointSharedPairHits])
  · exact hall (placedLabel order direction cut d,
      placedLabel order direction cut b) (by simp [endpointSharedPairHits])
  · exact hall (placedLabel order direction cut d,
      placedLabel order direction cut c) (by simp [endpointSharedPairHits])

/-- Complete guarded endpoint-center shared-pair clause family. -/
def endpointSharedPairClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.flatMap fun direction =>
      labels.flatMap fun cut =>
        threeOffsetChoices.map fun offsets =>
          nogoodClause order
            (endpointSharedPairHits order direction cut offsets)

/-- Every source realization satisfies the complete shared-pair family. -/
theorem sourceAssign_endpointSharedPairClauses {A : Finset ℝ²}
    (r : SourceRealization A) :
    ∀ clause ∈ endpointSharedPairClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign r.model) clause = true := by
  intro clause hclause
  simp only [endpointSharedPairClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, cut, _hcut,
    offsets, hoffsets, rfl⟩ := hclause
  exact sourceAssign_endpointSharedPairClause r order direction cut offsets hoffsets

/-- Lean-authoritative child root after the complete two-circle family. -/
def extendedTwoCircleCnf : Std.Sat.CNF Atom :=
  extendedEqualK4Cnf ++ endpointSharedPairClauses

/-- Exact size of the complete two-circle clause family. -/
theorem endpointSharedPairClauses_length :
    endpointSharedPairClauses.length = 38080 := by
  native_decide

/-- Exact clause count of the Lean-authoritative child root. -/
theorem extendedTwoCircleCnf_clause_count :
    extendedTwoCircleCnf.length = 2306540 := by
  simp [extendedTwoCircleCnf, extendedEqualK4Cnf_clause_count,
    endpointSharedPairClauses_length]

/-- Gate B for the complete two-circle child root. -/
theorem sourceAssign_extendedTwoCircleCnf {A : Finset ℝ²}
    (r : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign r.model) extendedTwoCircleCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedTwoCircleCnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedEqualK4Cnf r
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_endpointSharedPairClauses r clause hnew

/-- Certificate-to-source landing contract for the complete two-circle root. -/
theorem false_of_sourceRealization_of_extendedTwoCircleCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedTwoCircleCnf = true) :
    False := by
  rcases hsource with ⟨r⟩
  exact hunsat ⟨sourceAssign r.model, sourceAssign_extendedTwoCircleCnf r⟩

end ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircle
end Problem97
