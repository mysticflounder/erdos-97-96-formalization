/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.KalmansonFourEqualitySchemas

/-!
# Three-class Kalmanson contradictions on four or five distinguished vertices

Three selected exact-distance classes can force a cancellation between two strict
Kalmanson inequalities even when a class center is also an endpoint of another class.
This file proves the three resulting order types and their decreasing-order companions.

The public cyclic-shift consumers are independent of the carrier cardinality and use
only positive support membership in the three selected classes.
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

private theorem false_of_five_ccw_three_distance_equalities_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d) (hde : d < e)
    (habc : dist (phi a) (phi b) = dist (phi a) (phi c))
    (hbce : dist (phi b) (phi c) = dist (phi b) (phi e))
    (hdbe : dist (phi d) (phi b) = dist (phi d) (phi e)) : False := by
  have hFirst := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc (hcd.trans hde)
  have hSecond := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc hcd hde
  simp only [dist_comm] at habc hbce hdbe
  linarith

private theorem false_of_five_ccw_three_distance_equalities_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c) (hed : e < d)
    (habc : dist (phi a) (phi b) = dist (phi a) (phi c))
    (hbce : dist (phi b) (phi c) = dist (phi b) (phi e))
    (hdbe : dist (phi d) (phi b) = dist (phi d) (phi e)) : False := by
  have hFirst := adjacentSides_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba hcb (hed.trans hdc)
  have hSecond := adjacentSides_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb hdc hed
  simp only [dist_comm] at habc hbce hdbe
  linarith

private theorem false_of_four_role_cycle_with_first_gap_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a x b c d : Fin n}
    (hax : a < x) (hxb : x < b) (hbc : b < c) (hcd : c < d)
    (habc : dist (phi a) (phi b) = dist (phi a) (phi c))
    (hbac : dist (phi b) (phi a) = dist (phi b) (phi c))
    (hdab : dist (phi d) (phi a) = dist (phi d) (phi b)) : False := by
  have hFirst := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hax (hxb.trans hbc) hcd
  have hSecond := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hxb hbc hcd
  simp only [dist_comm] at habc hbac hdab
  linarith

private theorem false_of_four_role_cycle_with_first_gap_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a x b c d : Fin n}
    (hxa : x < a) (hbx : b < x) (hcb : c < b) (hdc : d < c)
    (habc : dist (phi a) (phi b) = dist (phi a) (phi c))
    (hbac : dist (phi b) (phi a) = dist (phi b) (phi c))
    (hdab : dist (phi d) (phi a) = dist (phi d) (phi b)) : False := by
  have hFirst := innerOuter_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hxa (hcb.trans hbx) hdc
  have hSecond := innerOuter_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hbx hcb hdc
  simp only [dist_comm] at habc hbac hdab
  linarith

private theorem false_of_four_role_cycle_with_last_gap_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c x d : Fin n}
    (hab : a < b) (hbc : b < c) (hcx : c < x) (hxd : x < d)
    (habc : dist (phi a) (phi b) = dist (phi a) (phi c))
    (hbac : dist (phi b) (phi a) = dist (phi b) (phi c))
    (hdab : dist (phi d) (phi a) = dist (phi d) (phi b)) : False := by
  have hFirst := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab (hbc.trans hcx) hxd
  have hSecond := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc hcx
  simp only [dist_comm] at habc hbac hdab
  linarith

private theorem false_of_four_role_cycle_with_last_gap_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c x d : Fin n}
    (hba : b < a) (hcb : c < b) (hxc : x < c) (hdx : d < x)
    (habc : dist (phi a) (phi b) = dist (phi a) (phi c))
    (hbac : dist (phi b) (phi a) = dist (phi b) (phi c))
    (hdab : dist (phi d) (phi a) = dist (phi d) (phi b)) : False := by
  have hFirst := innerOuter_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba (hxc.trans hcb) hdx
  have hSecond := innerOuter_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba hcb hxc
  simp only [dist_comm] at habc hbac hdab
  linarith

private theorem shifted_boundary_data
    {carrier : Finset ℝ²}
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card) :
    Function.Injective (fun i ↦ boundary (i + cut)) ∧
      Finset.univ.image (fun i ↦ boundary (i + cut)) = carrier ∧
      EuclideanGeometry.IsCcwConvexPolygon (fun i ↦ boundary (i + cut)) := by
  exact ⟨injective_cyclicShift hboundary_injective cut,
    (image_univ_cyclicShift boundary cut).trans hboundary_image,
    isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut⟩

/-- Three selected classes with incidences `a:{b,c}`, `b:{c,e}`, and `d:{b,e}`
cannot occur at five increasingly ordered boundary positions. -/
theorem false_of_three_selected_classes_of_a_lt_b_lt_c_lt_d_lt_e_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d) (hde : d < e)
    (AClass : SelectedFourClass carrier (boundary (a + cut)))
    (BClass : SelectedFourClass carrier (boundary (b + cut)))
    (DClass : SelectedFourClass carrier (boundary (d + cut)))
    (hb_mem_AClass : boundary (b + cut) ∈ AClass.support)
    (hc_mem_AClass : boundary (c + cut) ∈ AClass.support)
    (hc_mem_BClass : boundary (c + cut) ∈ BClass.support)
    (he_mem_BClass : boundary (e + cut) ∈ BClass.support)
    (hb_mem_DClass : boundary (b + cut) ∈ DClass.support)
    (he_mem_DClass : boundary (e + cut) ∈ DClass.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i ↦ boundary (i + cut)
  rcases shifted_boundary_data hboundary_injective hboundary_image hboundary_ccw cut with
    ⟨hshifted_injective, hshifted_image, hshifted_ccw⟩
  exact false_of_five_ccw_three_distance_equalities_of_increasing
    (phi := shifted) hcarrier hshifted_injective hshifted_image hshifted_ccw
    hab hbc hcd hde
    ((AClass.support_eq_radius _ hb_mem_AClass).trans
      (AClass.support_eq_radius _ hc_mem_AClass).symm)
    ((BClass.support_eq_radius _ hc_mem_BClass).trans
      (BClass.support_eq_radius _ he_mem_BClass).symm)
    ((DClass.support_eq_radius _ hb_mem_DClass).trans
      (DClass.support_eq_radius _ he_mem_DClass).symm)

/-- Decreasing-index companion of
`false_of_three_selected_classes_of_a_lt_b_lt_c_lt_d_lt_e_cyclicShift`. -/
theorem false_of_three_selected_classes_of_e_lt_d_lt_c_lt_b_lt_a_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c) (hed : e < d)
    (AClass : SelectedFourClass carrier (boundary (a + cut)))
    (BClass : SelectedFourClass carrier (boundary (b + cut)))
    (DClass : SelectedFourClass carrier (boundary (d + cut)))
    (hb_mem_AClass : boundary (b + cut) ∈ AClass.support)
    (hc_mem_AClass : boundary (c + cut) ∈ AClass.support)
    (hc_mem_BClass : boundary (c + cut) ∈ BClass.support)
    (he_mem_BClass : boundary (e + cut) ∈ BClass.support)
    (hb_mem_DClass : boundary (b + cut) ∈ DClass.support)
    (he_mem_DClass : boundary (e + cut) ∈ DClass.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i ↦ boundary (i + cut)
  rcases shifted_boundary_data hboundary_injective hboundary_image hboundary_ccw cut with
    ⟨hshifted_injective, hshifted_image, hshifted_ccw⟩
  exact false_of_five_ccw_three_distance_equalities_of_decreasing
    (phi := shifted) hcarrier hshifted_injective hshifted_image hshifted_ccw
    hba hcb hdc hed
    ((AClass.support_eq_radius _ hb_mem_AClass).trans
      (AClass.support_eq_radius _ hc_mem_AClass).symm)
    ((BClass.support_eq_radius _ hc_mem_BClass).trans
      (BClass.support_eq_radius _ he_mem_BClass).symm)
    ((DClass.support_eq_radius _ hb_mem_DClass).trans
      (DClass.support_eq_radius _ he_mem_DClass).symm)

/-- Three selected classes with incidences `a:{b,c}`, `b:{a,c}`, and `d:{a,b}`
cannot occur when an auxiliary boundary position lies strictly between `a` and `b`. -/
theorem false_of_three_selected_classes_of_a_lt_x_lt_b_lt_c_lt_d_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a x b c d : Fin carrier.card}
    (hax : a < x) (hxb : x < b) (hbc : b < c) (hcd : c < d)
    (AClass : SelectedFourClass carrier (boundary (a + cut)))
    (BClass : SelectedFourClass carrier (boundary (b + cut)))
    (DClass : SelectedFourClass carrier (boundary (d + cut)))
    (hb_mem_AClass : boundary (b + cut) ∈ AClass.support)
    (hc_mem_AClass : boundary (c + cut) ∈ AClass.support)
    (ha_mem_BClass : boundary (a + cut) ∈ BClass.support)
    (hc_mem_BClass : boundary (c + cut) ∈ BClass.support)
    (ha_mem_DClass : boundary (a + cut) ∈ DClass.support)
    (hb_mem_DClass : boundary (b + cut) ∈ DClass.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i ↦ boundary (i + cut)
  rcases shifted_boundary_data hboundary_injective hboundary_image hboundary_ccw cut with
    ⟨hshifted_injective, hshifted_image, hshifted_ccw⟩
  exact false_of_four_role_cycle_with_first_gap_of_increasing
    (phi := shifted) hcarrier hshifted_injective hshifted_image hshifted_ccw
    hax hxb hbc hcd
    ((AClass.support_eq_radius _ hb_mem_AClass).trans
      (AClass.support_eq_radius _ hc_mem_AClass).symm)
    ((BClass.support_eq_radius _ ha_mem_BClass).trans
      (BClass.support_eq_radius _ hc_mem_BClass).symm)
    ((DClass.support_eq_radius _ ha_mem_DClass).trans
      (DClass.support_eq_radius _ hb_mem_DClass).symm)

/-- Decreasing-index companion of
`false_of_three_selected_classes_of_a_lt_x_lt_b_lt_c_lt_d_cyclicShift`. -/
theorem false_of_three_selected_classes_of_d_lt_c_lt_b_lt_x_lt_a_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a x b c d : Fin carrier.card}
    (hxa : x < a) (hbx : b < x) (hcb : c < b) (hdc : d < c)
    (AClass : SelectedFourClass carrier (boundary (a + cut)))
    (BClass : SelectedFourClass carrier (boundary (b + cut)))
    (DClass : SelectedFourClass carrier (boundary (d + cut)))
    (hb_mem_AClass : boundary (b + cut) ∈ AClass.support)
    (hc_mem_AClass : boundary (c + cut) ∈ AClass.support)
    (ha_mem_BClass : boundary (a + cut) ∈ BClass.support)
    (hc_mem_BClass : boundary (c + cut) ∈ BClass.support)
    (ha_mem_DClass : boundary (a + cut) ∈ DClass.support)
    (hb_mem_DClass : boundary (b + cut) ∈ DClass.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i ↦ boundary (i + cut)
  rcases shifted_boundary_data hboundary_injective hboundary_image hboundary_ccw cut with
    ⟨hshifted_injective, hshifted_image, hshifted_ccw⟩
  exact false_of_four_role_cycle_with_first_gap_of_decreasing
    (phi := shifted) hcarrier hshifted_injective hshifted_image hshifted_ccw
    hxa hbx hcb hdc
    ((AClass.support_eq_radius _ hb_mem_AClass).trans
      (AClass.support_eq_radius _ hc_mem_AClass).symm)
    ((BClass.support_eq_radius _ ha_mem_BClass).trans
      (BClass.support_eq_radius _ hc_mem_BClass).symm)
    ((DClass.support_eq_radius _ ha_mem_DClass).trans
      (DClass.support_eq_radius _ hb_mem_DClass).symm)

/-- Three selected classes with incidences `a:{b,c}`, `b:{a,c}`, and `d:{a,b}`
cannot occur when an auxiliary boundary position lies strictly between `c` and `d`. -/
theorem false_of_three_selected_classes_of_a_lt_b_lt_c_lt_x_lt_d_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c x d : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcx : c < x) (hxd : x < d)
    (AClass : SelectedFourClass carrier (boundary (a + cut)))
    (BClass : SelectedFourClass carrier (boundary (b + cut)))
    (DClass : SelectedFourClass carrier (boundary (d + cut)))
    (hb_mem_AClass : boundary (b + cut) ∈ AClass.support)
    (hc_mem_AClass : boundary (c + cut) ∈ AClass.support)
    (ha_mem_BClass : boundary (a + cut) ∈ BClass.support)
    (hc_mem_BClass : boundary (c + cut) ∈ BClass.support)
    (ha_mem_DClass : boundary (a + cut) ∈ DClass.support)
    (hb_mem_DClass : boundary (b + cut) ∈ DClass.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i ↦ boundary (i + cut)
  rcases shifted_boundary_data hboundary_injective hboundary_image hboundary_ccw cut with
    ⟨hshifted_injective, hshifted_image, hshifted_ccw⟩
  exact false_of_four_role_cycle_with_last_gap_of_increasing
    (phi := shifted) hcarrier hshifted_injective hshifted_image hshifted_ccw
    hab hbc hcx hxd
    ((AClass.support_eq_radius _ hb_mem_AClass).trans
      (AClass.support_eq_radius _ hc_mem_AClass).symm)
    ((BClass.support_eq_radius _ ha_mem_BClass).trans
      (BClass.support_eq_radius _ hc_mem_BClass).symm)
    ((DClass.support_eq_radius _ ha_mem_DClass).trans
      (DClass.support_eq_radius _ hb_mem_DClass).symm)

/-- Decreasing-index companion of
`false_of_three_selected_classes_of_a_lt_b_lt_c_lt_x_lt_d_cyclicShift`. -/
theorem false_of_three_selected_classes_of_d_lt_x_lt_c_lt_b_lt_a_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c x d : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hxc : x < c) (hdx : d < x)
    (AClass : SelectedFourClass carrier (boundary (a + cut)))
    (BClass : SelectedFourClass carrier (boundary (b + cut)))
    (DClass : SelectedFourClass carrier (boundary (d + cut)))
    (hb_mem_AClass : boundary (b + cut) ∈ AClass.support)
    (hc_mem_AClass : boundary (c + cut) ∈ AClass.support)
    (ha_mem_BClass : boundary (a + cut) ∈ BClass.support)
    (hc_mem_BClass : boundary (c + cut) ∈ BClass.support)
    (ha_mem_DClass : boundary (a + cut) ∈ DClass.support)
    (hb_mem_DClass : boundary (b + cut) ∈ DClass.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i ↦ boundary (i + cut)
  rcases shifted_boundary_data hboundary_injective hboundary_image hboundary_ccw cut with
    ⟨hshifted_injective, hshifted_image, hshifted_ccw⟩
  exact false_of_four_role_cycle_with_last_gap_of_decreasing
    (phi := shifted) hcarrier hshifted_injective hshifted_image hshifted_ccw
    hba hcb hxc hdx
    ((AClass.support_eq_radius _ hb_mem_AClass).trans
      (AClass.support_eq_radius _ hc_mem_AClass).symm)
    ((BClass.support_eq_radius _ ha_mem_BClass).trans
      (BClass.support_eq_radius _ hc_mem_BClass).symm)
    ((DClass.support_eq_radius _ ha_mem_DClass).trans
      (DClass.support_eq_radius _ hb_mem_DClass).symm)

end CapCrossingKalmansonBridge
end Problem97
