/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.TwoKalmansonEqualityChainSchemas

/-!
# Two-Kalmanson equality chains with an unordered intermediary center

The five-row obstruction only uses the cyclic order of `A,B,C,E,F,G`.
The boundary position of the intermediary selected-row center `D` is irrelevant.
This stronger source theorem backs the swapped-`D/E` exact-seventeen refinement
without changing the immutable source custody of the parent PIQD ingress.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace TwoKalmansonEqualityChainBridge

open CapCrossingKalmansonBridge

/-- The two-Kalmanson equality chain only needs the cyclic order of
`A,B,C,E,F,G`; the intermediary row center `D` may occur anywhere. -/
theorem false_of_five_selected_rows_two_kalmanson_chain_of_six_order
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f g : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hce : c < e)
    (hef : e < f) (hfg : f < g)
    (CRow : SelectedFourClass carrier (boundary c))
    (DRow : SelectedFourClass carrier (boundary d))
    (ARow : SelectedFourClass carrier (boundary a))
    (FRow : SelectedFourClass carrier (boundary f))
    (GRow : SelectedFourClass carrier (boundary g))
    (hbC : boundary b ∈ CRow.support)
    (hdC : boundary d ∈ CRow.support)
    (hcD : boundary c ∈ DRow.support)
    (haD : boundary a ∈ DRow.support)
    (hdA : boundary d ∈ ARow.support)
    (hfA : boundary f ∈ ARow.support)
    (heA : boundary e ∈ ARow.support)
    (haF : boundary a ∈ FRow.support)
    (hbF : boundary b ∈ FRow.support)
    (heG : boundary e ∈ GRow.support)
    (hcG : boundary c ∈ GRow.support) : False := by
  have hC := (CRow.support_eq_radius _ hbC).trans
    (CRow.support_eq_radius _ hdC).symm
  have hD := (DRow.support_eq_radius _ hcD).trans
    (DRow.support_eq_radius _ haD).symm
  have hAD := (ARow.support_eq_radius _ hdA).trans
    (ARow.support_eq_radius _ hfA).symm
  have hAE := (ARow.support_eq_radius _ hfA).trans
    (ARow.support_eq_radius _ heA).symm
  have hF := (FRow.support_eq_radius _ haF).trans
    (FRow.support_eq_radius _ hbF).symm
  have hG := (GRow.support_eq_radius _ heG).trans
    (GRow.support_eq_radius _ hcG).symm
  have hK1 := dist_add_dist_lt_diagonal_sum_of_ccw
    hcarrier hboundaryInjective hboundaryImage hboundaryCcw
      hab hbc (hce.trans hef)
  have hK2 := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hcarrier hboundaryInjective hboundaryImage hboundaryCcw
      (hab.trans hbc) hce (hef.trans hfg)
  simp only [dist_comm] at hC hD hAD hAE hF hG hK1 hK2
  linarith

/-- Decreasing-index companion of the six-ordered-vertex theorem. -/
theorem false_of_five_selected_rows_two_kalmanson_chain_of_six_order_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f g : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hec : e < c)
    (hfe : f < e) (hgf : g < f)
    (CRow : SelectedFourClass carrier (boundary c))
    (DRow : SelectedFourClass carrier (boundary d))
    (ARow : SelectedFourClass carrier (boundary a))
    (FRow : SelectedFourClass carrier (boundary f))
    (GRow : SelectedFourClass carrier (boundary g))
    (hbC : boundary b ∈ CRow.support)
    (hdC : boundary d ∈ CRow.support)
    (hcD : boundary c ∈ DRow.support)
    (haD : boundary a ∈ DRow.support)
    (hdA : boundary d ∈ ARow.support)
    (hfA : boundary f ∈ ARow.support)
    (heA : boundary e ∈ ARow.support)
    (haF : boundary a ∈ FRow.support)
    (hbF : boundary b ∈ FRow.support)
    (heG : boundary e ∈ GRow.support)
    (hcG : boundary c ∈ GRow.support) : False := by
  have hC := (CRow.support_eq_radius _ hbC).trans
    (CRow.support_eq_radius _ hdC).symm
  have hD := (DRow.support_eq_radius _ hcD).trans
    (DRow.support_eq_radius _ haD).symm
  have hAD := (ARow.support_eq_radius _ hdA).trans
    (ARow.support_eq_radius _ hfA).symm
  have hAE := (ARow.support_eq_radius _ hfA).trans
    (ARow.support_eq_radius _ heA).symm
  have hF := (FRow.support_eq_radius _ haF).trans
    (FRow.support_eq_radius _ hbF).symm
  have hG := (GRow.support_eq_radius _ heG).trans
    (GRow.support_eq_radius _ hcG).symm
  have hK1 := dist_add_dist_lt_diagonal_sum_of_ccw
    hcarrier hboundaryInjective hboundaryImage hboundaryCcw
      (hfe.trans hec) hcb hba
  have hK2 := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hcarrier hboundaryInjective hboundaryImage hboundaryCcw
      (hgf.trans hfe) hec (hcb.trans hba)
  simp only [dist_comm] at hC hD hAD hAE hF hG hK1 hK2
  linarith

/-- Cyclic-shift form of the increasing six-ordered-vertex theorem. -/
theorem false_of_five_selected_rows_two_kalmanson_chain_of_six_order_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f g : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hce : c < e)
    (hef : e < f) (hfg : f < g)
    (CRow : SelectedFourClass carrier (boundary (c + cut)))
    (DRow : SelectedFourClass carrier (boundary (d + cut)))
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (FRow : SelectedFourClass carrier (boundary (f + cut)))
    (GRow : SelectedFourClass carrier (boundary (g + cut)))
    (hbC : boundary (b + cut) ∈ CRow.support)
    (hdC : boundary (d + cut) ∈ CRow.support)
    (hcD : boundary (c + cut) ∈ DRow.support)
    (haD : boundary (a + cut) ∈ DRow.support)
    (hdA : boundary (d + cut) ∈ ARow.support)
    (hfA : boundary (f + cut) ∈ ARow.support)
    (heA : boundary (e + cut) ∈ ARow.support)
    (haF : boundary (a + cut) ∈ FRow.support)
    (hbF : boundary (b + cut) ∈ FRow.support)
    (heG : boundary (e + cut) ∈ GRow.support)
    (hcG : boundary (c + cut) ∈ GRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  exact false_of_five_selected_rows_two_kalmanson_chain_of_six_order
    (boundary := shifted) (a := a) (b := b) (c := c) (d := d)
    (e := e) (f := f) (g := g) hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundaryInjective cut)
    (by simpa only [shifted] using
      (image_univ_cyclicShift boundary cut).trans hboundaryImage)
    (by simpa only [shifted] using
      isCcwConvexPolygon_cyclicShift hboundaryInjective hboundaryCcw cut)
    hab hbc hce hef hfg CRow DRow ARow FRow GRow
    hbC hdC hcD haD hdA hfA heA haF hbF heG hcG

/-- Cyclic-shift form of the decreasing six-ordered-vertex theorem. -/
theorem false_of_five_selected_rows_two_kalmanson_chain_of_six_order_cyclicShift_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f g : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hec : e < c)
    (hfe : f < e) (hgf : g < f)
    (CRow : SelectedFourClass carrier (boundary (c + cut)))
    (DRow : SelectedFourClass carrier (boundary (d + cut)))
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (FRow : SelectedFourClass carrier (boundary (f + cut)))
    (GRow : SelectedFourClass carrier (boundary (g + cut)))
    (hbC : boundary (b + cut) ∈ CRow.support)
    (hdC : boundary (d + cut) ∈ CRow.support)
    (hcD : boundary (c + cut) ∈ DRow.support)
    (haD : boundary (a + cut) ∈ DRow.support)
    (hdA : boundary (d + cut) ∈ ARow.support)
    (hfA : boundary (f + cut) ∈ ARow.support)
    (heA : boundary (e + cut) ∈ ARow.support)
    (haF : boundary (a + cut) ∈ FRow.support)
    (hbF : boundary (b + cut) ∈ FRow.support)
    (heG : boundary (e + cut) ∈ GRow.support)
    (hcG : boundary (c + cut) ∈ GRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  exact
    false_of_five_selected_rows_two_kalmanson_chain_of_six_order_of_decreasing
      (boundary := shifted) (a := a) (b := b) (c := c) (d := d)
      (e := e) (f := f) (g := g) hcarrier
      (by simpa only [shifted] using injective_cyclicShift hboundaryInjective cut)
      (by simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundaryImage)
      (by simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundaryInjective hboundaryCcw cut)
      hba hcb hec hfe hgf CRow DRow ARow FRow GRow
      hbC hdC hcD haD hdA hfA heA haF hbF heG hcG

#print axioms false_of_five_selected_rows_two_kalmanson_chain_of_six_order
#print axioms false_of_five_selected_rows_two_kalmanson_chain_of_six_order_of_decreasing
#print axioms false_of_five_selected_rows_two_kalmanson_chain_of_six_order_cyclicShift
#print axioms false_of_five_selected_rows_two_kalmanson_chain_of_six_order_cyclicShift_of_decreasing

end TwoKalmansonEqualityChainBridge
end Problem97
