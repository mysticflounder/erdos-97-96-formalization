/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Four-equality Kalmanson schemas

Two seven-point contradictions extracted from the exact-sixteen `BlockerV`
four-row census.  Core minimization shows that each originally observed
five-equality signature has one redundant equality, leaving a stronger
four-equality, cardinality-independent consequence of strict Kalmanson
inequalities.  Both increasing and decreasing boundary-index forms are
supplied so finite certificate consumers can remain orientation-neutral.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace CapCrossingKalmansonBridge

private theorem dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
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

private theorem complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
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

/-- Seven increasingly ordered boundary vertices cannot support the first
four-equality four-row signature. -/
theorem false_of_seven_ccw_four_shell_equalities_A_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f g : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g)
    (hbae : dist (phi b) (phi a) = dist (phi b) (phi e))
    (hcbf : dist (phi c) (phi b) = dist (phi c) (phi f))
    (hdbe : dist (phi d) (phi b) = dist (phi d) (phi e))
    (heaf : dist (phi e) (phi a) = dist (phi e) (phi f)) : False := by
  have hK2_abcd := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc hcd
  have hK1_abcg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc (hcd.trans (hde.trans (hef.trans hfg)))
  have hK1_acdg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans hbc) hcd (hde.trans (hef.trans hfg))
  have hK1_adeg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans (hbc.trans hcd)) hde (hef.trans hfg)
  have hK2_bcef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc (hcd.trans hde) hef
  have hK2_bcfg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc (hcd.trans (hde.trans hef)) hfg
  have hK2_cdef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hcd hde hef
  have hK2_cdfg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hcd (hde.trans hef) hfg
  have hK2_defg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hde hef hfg
  simp only [dist_comm] at hbae hcbf hdbe heaf
  linarith

/-- Decreasing-index companion of
`false_of_seven_ccw_four_shell_equalities_A_of_increasing`. -/
theorem false_of_seven_ccw_four_shell_equalities_A_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f g : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e) (hgf : g < f)
    (hbae : dist (phi b) (phi a) = dist (phi b) (phi e))
    (hcbf : dist (phi c) (phi b) = dist (phi c) (phi f))
    (hdbe : dist (phi d) (phi b) = dist (phi d) (phi e))
    (heaf : dist (phi e) (phi a) = dist (phi e) (phi f)) : False := by
  have hK2_abcd := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba hcb hdc
  have hK1_abcg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba hcb (hgf.trans (hfe.trans (hed.trans hdc)))
  have hK1_acdg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hcb.trans hba) hdc (hgf.trans (hfe.trans hed))
  have hK1_adeg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hdc.trans (hcb.trans hba)) hed (hgf.trans hfe)
  have hK2_bcef := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb (hed.trans hdc) hfe
  have hK2_bcfg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb (hfe.trans (hed.trans hdc)) hgf
  have hK2_cdef := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hdc hed hfe
  have hK2_cdfg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hdc (hfe.trans hed) hgf
  have hK2_defg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hed hfe hgf
  simp only [dist_comm] at hbae hcbf hdbe heaf
  linarith

/-- Seven increasingly ordered boundary vertices cannot support the reflected
placement of the first five-equality signature. -/
theorem false_of_seven_ccw_four_shell_equalities_B_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f g : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g)
    (hbae : dist (phi b) (phi a) = dist (phi b) (phi e))
    (hcbg : dist (phi c) (phi b) = dist (phi c) (phi g))
    (hdbe : dist (phi d) (phi b) = dist (phi d) (phi e))
    (heag : dist (phi e) (phi a) = dist (phi e) (phi g)) : False := by
  have hK2_abcd := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc hcd
  have hK1_abcg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc (hcd.trans (hde.trans (hef.trans hfg)))
  have hK1_acdg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans hbc) hcd (hde.trans (hef.trans hfg))
  have hK1_adeg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans (hbc.trans hcd)) hde (hef.trans hfg)
  have hK2_bcef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc (hcd.trans hde) hef
  have hK2_bcfg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc (hcd.trans (hde.trans hef)) hfg
  have hK2_cdef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hcd hde hef
  have hK2_cdfg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hcd (hde.trans hef) hfg
  simp only [dist_comm] at hbae hcbg hdbe heag
  linarith

/-- Decreasing-index companion of
`false_of_seven_ccw_four_shell_equalities_B_of_increasing`. -/
theorem false_of_seven_ccw_four_shell_equalities_B_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f g : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e) (hgf : g < f)
    (hbae : dist (phi b) (phi a) = dist (phi b) (phi e))
    (hcbg : dist (phi c) (phi b) = dist (phi c) (phi g))
    (hdbe : dist (phi d) (phi b) = dist (phi d) (phi e))
    (heag : dist (phi e) (phi a) = dist (phi e) (phi g)) : False := by
  have hK2_abcd := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba hcb hdc
  have hK1_abcg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba hcb (hgf.trans (hfe.trans (hed.trans hdc)))
  have hK1_acdg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hcb.trans hba) hdc (hgf.trans (hfe.trans hed))
  have hK1_adeg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hdc.trans (hcb.trans hba)) hed (hgf.trans hfe)
  have hK2_bcef := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb (hed.trans hdc) hfe
  have hK2_bcfg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb (hfe.trans (hed.trans hdc)) hgf
  have hK2_cdef := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hdc hed hfe
  have hK2_cdfg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hdc (hfe.trans hed) hgf
  simp only [dist_comm] at hbae hcbg hdbe heag
  linarith

end CapCrossingKalmansonBridge
end Problem97
