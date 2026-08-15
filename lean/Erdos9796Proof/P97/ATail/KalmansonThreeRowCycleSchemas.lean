/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.KalmansonFourEqualitySchemas

/-!
# Three-class cyclic Kalmanson contradictions

Three exact-distance classes can form a six-incidence cycle on six boundary
vertices.  Up to reversal, there are three relevant cyclic order types.  In
each type, two strict Kalmanson inequalities contradict the three distance
equalities supplied by the classes.

The metric theorems are independent of the carrier cardinality.  The public
cyclic-shift consumers translate direct `SelectedFourClass` membership into
the three required distance equalities in both index orientations.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace CapCrossingKalmansonBridge

private theorem adjacentSides_lt_diagonal_sum_of_ccw_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {ia ib ic id : Fin n}
    (hiba : ib < ia) (hicb : ic < ib) (hidc : id < ic) :
    dist (phi ia) (phi ib) + dist (phi ic) (phi id) <
      dist (phi ia) (phi ic) + dist (phi ib) (phi id) := by
  simpa only [dist_comm, add_comm] using
    (complementary_dist_add_dist_lt_diagonal_sum_of_ccw
      (ia := id) (ib := ic) (ic := ib) (id := ia)
      hA hphi_inj hphi_image hccw hidc hicb hiba)

private theorem innerOuter_lt_diagonal_sum_of_ccw_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {ia ib ic id : Fin n}
    (hiba : ib < ia) (hicb : ic < ib) (hidc : id < ic) :
    dist (phi ib) (phi ic) + dist (phi ia) (phi id) <
      dist (phi ia) (phi ic) + dist (phi ib) (phi id) := by
  simpa only [dist_comm, add_comm] using
    (dist_add_dist_lt_diagonal_sum_of_ccw
      (ia := id) (ib := ic) (ic := ib) (id := ia)
      hA hphi_inj hphi_image hccw hidc hicb hiba)

/-- The adjacent-sides inequalities on `a,b,c,d` and `b,d,e,f` contradict
the distance-class cycle `a:{b,c}; d:{c,f}; e:{b,f}`. -/
theorem false_of_six_ccw_three_distance_equalities_cycle_adjacent_adjacent_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (habc : dist (phi a) (phi b) = dist (phi a) (phi c))
    (hdcf : dist (phi d) (phi c) = dist (phi d) (phi f))
    (hebf : dist (phi e) (phi b) = dist (phi e) (phi f)) : False := by
  have hKAdjacent_abcd := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc hcd
  have hKAdjacent_bdef := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hbc.trans hcd) hde hef
  simp only [dist_comm] at habc hdcf hebf
  linarith

/-- Decreasing-index companion of
`false_of_six_ccw_three_distance_equalities_cycle_adjacent_adjacent_of_increasing`. -/
theorem false_of_six_ccw_three_distance_equalities_cycle_adjacent_adjacent_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (habc : dist (phi a) (phi b) = dist (phi a) (phi c))
    (hdcf : dist (phi d) (phi c) = dist (phi d) (phi f))
    (hebf : dist (phi e) (phi b) = dist (phi e) (phi f)) : False := by
  have hKAdjacent_abcd := adjacentSides_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba hcb hdc
  have hKAdjacent_bdef := adjacentSides_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hdc.trans hcb) hed hfe
  simp only [dist_comm] at habc hdcf hebf
  linarith

/-- The adjacent-sides inequality on `a,b,c,e` and the inner-outer inequality
on `c,d,e,f` contradict the cycle `a:{b,c}; e:{b,d}; f:{c,d}`. -/
theorem false_of_six_ccw_three_distance_equalities_cycle_adjacent_innerOuter_left_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (habc : dist (phi a) (phi b) = dist (phi a) (phi c))
    (hebd : dist (phi e) (phi b) = dist (phi e) (phi d))
    (hfcd : dist (phi f) (phi c) = dist (phi f) (phi d)) : False := by
  have hKAdjacent_abce := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc (hcd.trans hde)
  have hKInnerOuter_cdef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hcd hde hef
  simp only [dist_comm] at habc hebd hfcd
  linarith

/-- Decreasing-index companion of
`false_of_six_ccw_three_distance_equalities_cycle_adjacent_innerOuter_left_of_increasing`. -/
theorem false_of_six_ccw_three_distance_equalities_cycle_adjacent_innerOuter_left_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (habc : dist (phi a) (phi b) = dist (phi a) (phi c))
    (hebd : dist (phi e) (phi b) = dist (phi e) (phi d))
    (hfcd : dist (phi f) (phi c) = dist (phi f) (phi d)) : False := by
  have hKAdjacent_abce := adjacentSides_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba hcb (hed.trans hdc)
  have hKInnerOuter_cdef := innerOuter_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hdc hed hfe
  simp only [dist_comm] at habc hebd hfcd
  linarith

/-- The adjacent-sides inequality on `a,b,d,f` and the inner-outer inequality
on `b,c,e,f` contradict the cycle `a:{b,d}; e:{b,c}; f:{c,d}`. -/
theorem false_of_six_ccw_three_distance_equalities_cycle_adjacent_innerOuter_right_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (habd : dist (phi a) (phi b) = dist (phi a) (phi d))
    (hebc : dist (phi e) (phi b) = dist (phi e) (phi c))
    (hfcd : dist (phi f) (phi c) = dist (phi f) (phi d)) : False := by
  have hKAdjacent_abdf := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab (hbc.trans hcd) (hde.trans hef)
  have hKInnerOuter_bcef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc (hcd.trans hde) hef
  simp only [dist_comm] at habd hebc hfcd
  linarith

/-- Decreasing-index companion of
`false_of_six_ccw_three_distance_equalities_cycle_adjacent_innerOuter_right_of_increasing`. -/
theorem false_of_six_ccw_three_distance_equalities_cycle_adjacent_innerOuter_right_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (habd : dist (phi a) (phi b) = dist (phi a) (phi d))
    (hebc : dist (phi e) (phi b) = dist (phi e) (phi c))
    (hfcd : dist (phi f) (phi c) = dist (phi f) (phi d)) : False := by
  have hKAdjacent_abdf := adjacentSides_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba (hdc.trans hcb) (hfe.trans hed)
  have hKInnerOuter_bcef := innerOuter_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb (hed.trans hdc) hfe
  simp only [dist_comm] at habd hebc hfcd
  linarith

/-- Direct selected-class consumer for the adjacent/adjacent cycle in an
increasing cyclic boundary window. -/
theorem false_of_three_selected_rows_in_six_ccw_order_cycle_adjacent_adjacent_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (DRow : SelectedFourClass carrier (boundary (d + cut)))
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (hb_mem_ARow : boundary (b + cut) ∈ ARow.support)
    (hc_mem_ARow : boundary (c + cut) ∈ ARow.support)
    (hc_mem_DRow : boundary (c + cut) ∈ DRow.support)
    (hf_mem_DRow : boundary (f + cut) ∈ DRow.support)
    (hb_mem_ERow : boundary (b + cut) ∈ ERow.support)
    (hf_mem_ERow : boundary (f + cut) ∈ ERow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i ↦ boundary (i + cut)
  have habc := (ARow.support_eq_radius _ hb_mem_ARow).trans
    (ARow.support_eq_radius _ hc_mem_ARow).symm
  have hdcf := (DRow.support_eq_radius _ hc_mem_DRow).trans
    (DRow.support_eq_radius _ hf_mem_DRow).symm
  have hebf := (ERow.support_eq_radius _ hb_mem_ERow).trans
    (ERow.support_eq_radius _ hf_mem_ERow).symm
  exact false_of_six_ccw_three_distance_equalities_cycle_adjacent_adjacent_of_increasing
    (phi := shifted) (a := a) (b := b) (c := c) (d := d) (e := e) (f := f)
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hab hbc hcd hde hef habc hdcf hebf

/-- Decreasing-index companion of the adjacent/adjacent cyclic-window
selected-class consumer. -/
theorem false_of_three_selected_rows_in_six_ccw_order_cycle_adjacent_adjacent_cyclicShift_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (DRow : SelectedFourClass carrier (boundary (d + cut)))
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (hb_mem_ARow : boundary (b + cut) ∈ ARow.support)
    (hc_mem_ARow : boundary (c + cut) ∈ ARow.support)
    (hc_mem_DRow : boundary (c + cut) ∈ DRow.support)
    (hf_mem_DRow : boundary (f + cut) ∈ DRow.support)
    (hb_mem_ERow : boundary (b + cut) ∈ ERow.support)
    (hf_mem_ERow : boundary (f + cut) ∈ ERow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i ↦ boundary (i + cut)
  have habc := (ARow.support_eq_radius _ hb_mem_ARow).trans
    (ARow.support_eq_radius _ hc_mem_ARow).symm
  have hdcf := (DRow.support_eq_radius _ hc_mem_DRow).trans
    (DRow.support_eq_radius _ hf_mem_DRow).symm
  have hebf := (ERow.support_eq_radius _ hb_mem_ERow).trans
    (ERow.support_eq_radius _ hf_mem_ERow).symm
  exact false_of_six_ccw_three_distance_equalities_cycle_adjacent_adjacent_of_decreasing
    (phi := shifted) (a := a) (b := b) (c := c) (d := d) (e := e) (f := f)
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hba hcb hdc hed hfe habc hdcf hebf

/-- Direct selected-class consumer for the left adjacent/inner-outer cycle in
an increasing cyclic boundary window. -/
theorem false_of_three_selected_rows_in_six_ccw_order_cycle_adjacent_innerOuter_left_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (FRow : SelectedFourClass carrier (boundary (f + cut)))
    (hb_mem_ARow : boundary (b + cut) ∈ ARow.support)
    (hc_mem_ARow : boundary (c + cut) ∈ ARow.support)
    (hb_mem_ERow : boundary (b + cut) ∈ ERow.support)
    (hd_mem_ERow : boundary (d + cut) ∈ ERow.support)
    (hc_mem_FRow : boundary (c + cut) ∈ FRow.support)
    (hd_mem_FRow : boundary (d + cut) ∈ FRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i ↦ boundary (i + cut)
  have habc := (ARow.support_eq_radius _ hb_mem_ARow).trans
    (ARow.support_eq_radius _ hc_mem_ARow).symm
  have hebd := (ERow.support_eq_radius _ hb_mem_ERow).trans
    (ERow.support_eq_radius _ hd_mem_ERow).symm
  have hfcd := (FRow.support_eq_radius _ hc_mem_FRow).trans
    (FRow.support_eq_radius _ hd_mem_FRow).symm
  exact false_of_six_ccw_three_distance_equalities_cycle_adjacent_innerOuter_left_of_increasing
    (phi := shifted) (a := a) (b := b) (c := c) (d := d) (e := e) (f := f)
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hab hbc hcd hde hef habc hebd hfcd

/-- Decreasing-index companion of the left adjacent/inner-outer cyclic-window
selected-class consumer. -/
theorem false_of_three_selected_rows_in_six_ccw_order_cycle_adjacent_innerOuter_left_cyclicShift_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (FRow : SelectedFourClass carrier (boundary (f + cut)))
    (hb_mem_ARow : boundary (b + cut) ∈ ARow.support)
    (hc_mem_ARow : boundary (c + cut) ∈ ARow.support)
    (hb_mem_ERow : boundary (b + cut) ∈ ERow.support)
    (hd_mem_ERow : boundary (d + cut) ∈ ERow.support)
    (hc_mem_FRow : boundary (c + cut) ∈ FRow.support)
    (hd_mem_FRow : boundary (d + cut) ∈ FRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i ↦ boundary (i + cut)
  have habc := (ARow.support_eq_radius _ hb_mem_ARow).trans
    (ARow.support_eq_radius _ hc_mem_ARow).symm
  have hebd := (ERow.support_eq_radius _ hb_mem_ERow).trans
    (ERow.support_eq_radius _ hd_mem_ERow).symm
  have hfcd := (FRow.support_eq_radius _ hc_mem_FRow).trans
    (FRow.support_eq_radius _ hd_mem_FRow).symm
  exact false_of_six_ccw_three_distance_equalities_cycle_adjacent_innerOuter_left_of_decreasing
    (phi := shifted) (a := a) (b := b) (c := c) (d := d) (e := e) (f := f)
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hba hcb hdc hed hfe habc hebd hfcd

/-- Direct selected-class consumer for the right adjacent/inner-outer cycle in
an increasing cyclic boundary window. -/
theorem false_of_three_selected_rows_in_six_ccw_order_cycle_adjacent_innerOuter_right_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (FRow : SelectedFourClass carrier (boundary (f + cut)))
    (hb_mem_ARow : boundary (b + cut) ∈ ARow.support)
    (hd_mem_ARow : boundary (d + cut) ∈ ARow.support)
    (hb_mem_ERow : boundary (b + cut) ∈ ERow.support)
    (hc_mem_ERow : boundary (c + cut) ∈ ERow.support)
    (hc_mem_FRow : boundary (c + cut) ∈ FRow.support)
    (hd_mem_FRow : boundary (d + cut) ∈ FRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i ↦ boundary (i + cut)
  have habd := (ARow.support_eq_radius _ hb_mem_ARow).trans
    (ARow.support_eq_radius _ hd_mem_ARow).symm
  have hebc := (ERow.support_eq_radius _ hb_mem_ERow).trans
    (ERow.support_eq_radius _ hc_mem_ERow).symm
  have hfcd := (FRow.support_eq_radius _ hc_mem_FRow).trans
    (FRow.support_eq_radius _ hd_mem_FRow).symm
  exact false_of_six_ccw_three_distance_equalities_cycle_adjacent_innerOuter_right_of_increasing
    (phi := shifted) (a := a) (b := b) (c := c) (d := d) (e := e) (f := f)
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hab hbc hcd hde hef habd hebc hfcd

/-- Decreasing-index companion of the right adjacent/inner-outer cyclic-window
selected-class consumer. -/
theorem false_of_three_selected_rows_in_six_ccw_order_cycle_adjacent_innerOuter_right_cyclicShift_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (FRow : SelectedFourClass carrier (boundary (f + cut)))
    (hb_mem_ARow : boundary (b + cut) ∈ ARow.support)
    (hd_mem_ARow : boundary (d + cut) ∈ ARow.support)
    (hb_mem_ERow : boundary (b + cut) ∈ ERow.support)
    (hc_mem_ERow : boundary (c + cut) ∈ ERow.support)
    (hc_mem_FRow : boundary (c + cut) ∈ FRow.support)
    (hd_mem_FRow : boundary (d + cut) ∈ FRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i ↦ boundary (i + cut)
  have habd := (ARow.support_eq_radius _ hb_mem_ARow).trans
    (ARow.support_eq_radius _ hd_mem_ARow).symm
  have hebc := (ERow.support_eq_radius _ hb_mem_ERow).trans
    (ERow.support_eq_radius _ hc_mem_ERow).symm
  have hfcd := (FRow.support_eq_radius _ hc_mem_FRow).trans
    (FRow.support_eq_radius _ hd_mem_FRow).symm
  exact false_of_six_ccw_three_distance_equalities_cycle_adjacent_innerOuter_right_of_decreasing
    (phi := shifted) (a := a) (b := b) (c := c) (d := d) (e := e) (f := f)
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hba hcb hdc hed hfe habd hebc hfcd

end CapCrossingKalmansonBridge
end Problem97
