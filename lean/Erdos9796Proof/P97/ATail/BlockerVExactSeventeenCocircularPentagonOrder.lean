/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CocircularPentagonOrder
import Erdos9796Proof.P97.ATail.CocircularPerpendicularBisector
import Erdos9796Proof.P97.ATail.ConvexCocircularHalfPlane
import Erdos9796Proof.P97.ConvexCyclicOrder.Basic

/-!
# The exact cocircular pentagon order cut

The five physical-class points are co-radial about a carrier apex.  Three
on-class selected-row centers give nested positive sum directions.  A fourth
bisector witness cannot occur before the final on-class center in the convex
boundary order.  The two public theorems cover the increasing and decreasing
linear representatives of the same cyclic configuration.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace BlockerVExactSeventeenCocircularPentagonOrder

private theorem sum_ne_zero_of_strict_halfplane
    {P p q w : ℝ²}
    (hp : 0 < ⟪w, p - P⟫_ℝ) (hq : 0 < ⟪w, q - P⟫_ℝ) :
    (p - P) + (q - P) ≠ 0 := by
  intro hzero
  have hinner := congrArg (fun z : ℝ² => ⟪w, z⟫_ℝ) hzero
  change ⟪w, (p - P) + (q - P)⟫_ℝ = ⟪w, 0⟫_ℝ at hinner
  rw [inner_add_right, inner_zero_right] at hinner
  linarith

private theorem area_cyclic (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 b c a := by
  simp only [signedArea2]
  ring

private theorem area_swap (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 a c b := by
  simp only [signedArea2]
  ring

private theorem fan_parameters
    {P u v d e x y w : ℝ²} {radius : ℝ}
    (hP_u : dist P u = radius) (hP_v : dist P v = radius)
    (hP_d : dist P d = radius) (hP_x : dist P x = radius)
    (hP_y : dist P y = radius)
    (hu_ne_y : u ≠ y) (hu_ne_x : u ≠ x) (hv_ne_x : v ≠ x)
    (hd_ne_y : d ≠ y)
    (hx_ne_P : x ≠ P) (hv_ne_P : v ≠ P) (hd_ne_P : d ≠ P)
    (hpos_u : 0 < ⟪w, u - P⟫_ℝ) (hpos_v : 0 < ⟪w, v - P⟫_ℝ)
    (hpos_d : 0 < ⟪w, d - P⟫_ℝ) (hpos_x : 0 < ⟪w, x - P⟫_ℝ)
    (hpos_y : 0 < ⟪w, y - P⟫_ℝ)
    (hx_eq : dist x u = dist x y)
    (hv_eq : dist v u = dist v x)
    (hd_eq : dist d v = dist d x)
    (he_eq : dist e d = dist e y)
    (he_sides :
      (0 < signedArea2 d y e ∧ signedArea2 d y P < 0) ∨
      (0 < signedArea2 y d e ∧ signedArea2 y d P < 0)) :
    ∃ tx tv td te : ℝ,
      0 < tx ∧ 0 < tv ∧ 0 < td ∧ 0 < te ∧
      x - P = tx • ((u - P) + (y - P)) ∧
      v - P = tv • ((u - P) + (x - P)) ∧
      d - P = td • ((v - P) + (x - P)) ∧
      e - P = te • ((d - P) + (y - P)) := by
  have hsum_uy := sum_ne_zero_of_strict_halfplane hpos_u hpos_y
  have hsum_ux := sum_ne_zero_of_strict_halfplane hpos_u hpos_x
  have hsum_vx := sum_ne_zero_of_strict_halfplane hpos_v hpos_x
  have hsum_dy := sum_ne_zero_of_strict_halfplane hpos_d hpos_y
  obtain ⟨tx, hxrep, -⟩ :=
    Erdos9796Proof.Geometry.exists_bisector_direction_ne_zero hu_ne_y
      (hP_u.trans hP_y.symm) hx_eq hsum_uy hx_ne_P
  obtain ⟨tv, hvrep, -⟩ :=
    Erdos9796Proof.Geometry.exists_bisector_direction_ne_zero hu_ne_x
      (hP_u.trans hP_x.symm) hv_eq hsum_ux hv_ne_P
  obtain ⟨td, hdrep, -⟩ :=
    Erdos9796Proof.Geometry.exists_bisector_direction_ne_zero hv_ne_x
      (hP_v.trans hP_x.symm) hd_eq hsum_vx hd_ne_P
  obtain ⟨te, herep⟩ :=
    Erdos9796Proof.Geometry.exists_bisector_direction hd_ne_y
      (hP_d.trans hP_y.symm) he_eq hsum_dy
  have htx : 0 < tx :=
    CocircularPentagonOrder.positive_parameter_of_strict_halfplane
      hpos_u hpos_y hpos_x hxrep
  have htv : 0 < tv :=
    CocircularPentagonOrder.positive_parameter_of_strict_halfplane
      hpos_u hpos_x hpos_v hvrep
  have htd : 0 < td :=
    CocircularPentagonOrder.positive_parameter_of_strict_halfplane
      hpos_v hpos_x hpos_d hdrep
  have hteHalf : (1 / 2 : ℝ) < te := by
    rcases he_sides with hforward | hreverse
    · exact Erdos9796Proof.Geometry.bisector_parameter_gt_half_of_signed_sides
        herep hforward.1 hforward.2
    · have herep' : e - P = te • ((y - P) + (d - P)) := by
        simpa only [add_comm] using herep
      exact Erdos9796Proof.Geometry.bisector_parameter_gt_half_of_signed_sides
        herep' hreverse.1 hreverse.2
  exact ⟨tx, tv, td, te, htx, htv, htd, by linarith,
    hxrep, hvrep, hdrep, herep⟩

private theorem five_point_halfplane
    {A : Finset ℝ²} {P u v d x y : ℝ²} {radius : ℝ}
    (hA : ConvexIndep A) (hP_mem : P ∈ A)
    (hu_mem : u ∈ A) (hv_mem : v ∈ A) (hd_mem : d ∈ A)
    (hx_mem : x ∈ A) (hy_mem : y ∈ A)
    (hu_ne_P : u ≠ P) (hv_ne_P : v ≠ P) (hd_ne_P : d ≠ P)
    (hx_ne_P : x ≠ P) (hy_ne_P : y ≠ P)
    (hradius : 0 < radius)
    (hP_u : dist P u = radius) (hP_v : dist P v = radius)
    (hP_d : dist P d = radius) (hP_x : dist P x = radius)
    (hP_y : dist P y = radius) :
    ∃ w : ℝ²,
      0 < ⟪w, u - P⟫_ℝ ∧ 0 < ⟪w, v - P⟫_ℝ ∧
      0 < ⟪w, d - P⟫_ℝ ∧ 0 < ⟪w, x - P⟫_ℝ ∧
      0 < ⟪w, y - P⟫_ℝ := by
  let C : Finset ℝ² := {u, v, d, x, y}
  have hC : C ⊆ A.erase P := by
    intro q hq
    simp only [C, Finset.mem_insert, Finset.mem_singleton] at hq
    rcases hq with rfl | rfl | rfl | rfl | rfl
    · exact Finset.mem_erase.mpr ⟨hu_ne_P, hu_mem⟩
    · exact Finset.mem_erase.mpr ⟨hv_ne_P, hv_mem⟩
    · exact Finset.mem_erase.mpr ⟨hd_ne_P, hd_mem⟩
    · exact Finset.mem_erase.mpr ⟨hx_ne_P, hx_mem⟩
    · exact Finset.mem_erase.mpr ⟨hy_ne_P, hy_mem⟩
  have hcommon : ∀ q ∈ C, dist q P = radius := by
    intro q hq
    simp only [C, Finset.mem_insert, Finset.mem_singleton] at hq
    rcases hq with rfl | rfl | rfl | rfl | rfl
    · simpa [dist_comm] using hP_u
    · simpa [dist_comm] using hP_v
    · simpa [dist_comm] using hP_d
    · simpa [dist_comm] using hP_x
    · simpa [dist_comm] using hP_y
  obtain ⟨w, hw⟩ :=
    exists_strict_separating_vector_of_convexIndep_cocircular
      hA hP_mem hC hradius hcommon
  refine ⟨w, hw u ?_, hw v ?_, hw d ?_, hw x ?_, hw y ?_⟩
  all_goals simp [C]

/-- Increasing-boundary form of the forbidden swapped pentagon order. -/
theorem false_of_pentagon_swappedOrder
    {A : Finset ℝ²} {n : ℕ} (hA : ConvexIndep A)
    {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {iu iv id ie ix iy iP : Fin n} {radius : ℝ}
    (huv : iu < iv) (hvd : iv < id) (hde : id < ie)
    (hex : ie < ix) (hxy : ix < iy) (hyP : iy < iP)
    (hradius : 0 < radius)
    (hP_u : dist (phi iP) (phi iu) = radius)
    (hP_v : dist (phi iP) (phi iv) = radius)
    (hP_d : dist (phi iP) (phi id) = radius)
    (hP_x : dist (phi iP) (phi ix) = radius)
    (hP_y : dist (phi iP) (phi iy) = radius)
    (hx_eq : dist (phi ix) (phi iu) = dist (phi ix) (phi iy))
    (hv_eq : dist (phi iv) (phi iu) = dist (phi iv) (phi ix))
    (hd_eq : dist (phi id) (phi iv) = dist (phi id) (phi ix))
    (he_eq : dist (phi ie) (phi id) = dist (phi ie) (phi iy)) : False := by
  have hmem (i : Fin n) : phi i ∈ A := by
    rw [← hphi_image]
    exact Finset.mem_image.mpr ⟨i, Finset.mem_univ i, rfl⟩
  have hne {i j : Fin n} (hij : i ≠ j) : phi i ≠ phi j :=
    hphi_inj.ne hij
  obtain ⟨w, hwu, hwv, hwd, hwx, hwy⟩ := five_point_halfplane hA (hmem iP)
    (hmem iu) (hmem iv) (hmem id) (hmem ix) (hmem iy)
    (hne (ne_of_lt (huv.trans (hvd.trans (hde.trans (hex.trans (hxy.trans hyP)))))))
    (hne (ne_of_lt (hvd.trans (hde.trans (hex.trans (hxy.trans hyP))))))
    (hne (ne_of_lt (hde.trans (hex.trans (hxy.trans hyP)))))
    (hne (ne_of_lt (hxy.trans hyP))) (hne (ne_of_lt hyP)) hradius
    hP_u hP_v hP_d hP_x hP_y
  have hdey : signedArea2 (phi id) (phi ie) (phi iy) < 0 :=
    hneg_of_ccw hphi_inj hccw hde (hex.trans hxy)
  have heSide : 0 < signedArea2 (phi id) (phi iy) (phi ie) := by
    rw [area_swap (phi id) (phi iy) (phi ie)]
    linarith
  have hPSide : signedArea2 (phi id) (phi iy) (phi iP) < 0 :=
    hneg_of_ccw hphi_inj hccw
      (hde.trans (hex.trans hxy)) hyP
  obtain ⟨tx, tv, td, te, htx, htv, htd, hte, hxrep, hvrep, hdrep, herep⟩ :=
    fan_parameters hP_u hP_v hP_d hP_x hP_y
      (hne (ne_of_lt (huv.trans (hvd.trans (hde.trans (hex.trans hxy))))))
      (hne (ne_of_lt (huv.trans (hvd.trans (hde.trans hex)))))
      (hne (ne_of_lt (hvd.trans (hde.trans hex))))
      (hne (ne_of_lt (hde.trans (hex.trans hxy))))
      (hne (ne_of_lt (hxy.trans hyP)))
      (hne (ne_of_lt (hvd.trans (hde.trans (hex.trans (hxy.trans hyP))))))
      (hne (ne_of_lt (hde.trans (hex.trans (hxy.trans hyP)))))
      hwu hwv hwd hwx hwy hx_eq hv_eq hd_eq he_eq (Or.inl ⟨heSide, hPSide⟩)
  have huxP : signedArea2 (phi iu) (phi ix) (phi iP) < 0 :=
    hneg_of_ccw hphi_inj hccw
      (huv.trans (hvd.trans (hde.trans hex))) (hxy.trans hyP)
  have hbase : signedArea2 (phi iP) (phi iu) (phi ix) < 0 := by
    rw [area_cyclic (phi iP) (phi iu) (phi ix)]
    exact huxP
  have hderived :=
    (CocircularPentagonOrder.signedArea2_pentagonFan_same_sign hradius
      (by simpa only [dist_eq_norm, norm_sub_rev] using hP_u)
      (by simpa only [dist_eq_norm, norm_sub_rev] using hP_v)
      (by simpa only [dist_eq_norm, norm_sub_rev] using hP_d)
      (by simpa only [dist_eq_norm, norm_sub_rev] using hP_x)
      (by simpa only [dist_eq_norm, norm_sub_rev] using hP_y)
      htx htv htd hte hxrep hvrep hdrep herep).1 hbase
  have hexiP : signedArea2 (phi ie) (phi ix) (phi iP) < 0 :=
    hneg_of_ccw hphi_inj hccw hex (hxy.trans hyP)
  have hcontrary : 0 < signedArea2 (phi iP) (phi ix) (phi ie) := by
    have hcycle : signedArea2 (phi iP) (phi ie) (phi ix) < 0 := by
      rw [area_cyclic (phi iP) (phi ie) (phi ix)]
      exact hexiP
    rw [area_swap (phi iP) (phi ix) (phi ie)]
    linarith
  linarith

/-- Decreasing-boundary form of the forbidden swapped pentagon order. -/
theorem false_of_pentagon_swappedOrder_of_decreasing
    {A : Finset ℝ²} {n : ℕ} (hA : ConvexIndep A)
    {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {iP iy ix ie id iv iu : Fin n} {radius : ℝ}
    (hPy : iP < iy) (hyx : iy < ix) (hxe : ix < ie)
    (hed : ie < id) (hdv : id < iv) (hvu : iv < iu)
    (hradius : 0 < radius)
    (hP_u : dist (phi iP) (phi iu) = radius)
    (hP_v : dist (phi iP) (phi iv) = radius)
    (hP_d : dist (phi iP) (phi id) = radius)
    (hP_x : dist (phi iP) (phi ix) = radius)
    (hP_y : dist (phi iP) (phi iy) = radius)
    (hx_eq : dist (phi ix) (phi iu) = dist (phi ix) (phi iy))
    (hv_eq : dist (phi iv) (phi iu) = dist (phi iv) (phi ix))
    (hd_eq : dist (phi id) (phi iv) = dist (phi id) (phi ix))
    (he_eq : dist (phi ie) (phi id) = dist (phi ie) (phi iy)) : False := by
  have hmem (i : Fin n) : phi i ∈ A := by
    rw [← hphi_image]
    exact Finset.mem_image.mpr ⟨i, Finset.mem_univ i, rfl⟩
  have hne {i j : Fin n} (hij : i ≠ j) : phi i ≠ phi j := hphi_inj.ne hij
  obtain ⟨w, hwu, hwv, hwd, hwx, hwy⟩ := five_point_halfplane hA (hmem iP)
    (hmem iu) (hmem iv) (hmem id) (hmem ix) (hmem iy)
    (hne (ne_of_gt (hPy.trans (hyx.trans (hxe.trans (hed.trans (hdv.trans hvu)))))))
    (hne (ne_of_gt (hPy.trans (hyx.trans (hxe.trans (hed.trans hdv))))))
    (hne (ne_of_gt (hPy.trans (hyx.trans (hxe.trans hed)))))
    (hne (ne_of_gt (hPy.trans hyx))) (hne (ne_of_gt hPy)) hradius
    hP_u hP_v hP_d hP_x hP_y
  have hyed : signedArea2 (phi iy) (phi ie) (phi id) < 0 :=
    hneg_of_ccw hphi_inj hccw (hyx.trans hxe) hed
  have heSide : 0 < signedArea2 (phi iy) (phi id) (phi ie) := by
    rw [area_swap (phi iy) (phi id) (phi ie)]
    linarith
  have hPyd : signedArea2 (phi iP) (phi iy) (phi id) < 0 :=
    hneg_of_ccw hphi_inj hccw hPy
      (hyx.trans (hxe.trans hed))
  have hPSide : signedArea2 (phi iy) (phi id) (phi iP) < 0 := by
    rw [area_cyclic (phi iy) (phi id) (phi iP),
      area_cyclic (phi id) (phi iP) (phi iy)]
    exact hPyd
  obtain ⟨tx, tv, td, te, htx, htv, htd, hte, hxrep, hvrep, hdrep, herep⟩ :=
    fan_parameters hP_u hP_v hP_d hP_x hP_y
      (hne (ne_of_gt (hyx.trans (hxe.trans (hed.trans (hdv.trans hvu))))))
      (hne (ne_of_gt (hxe.trans (hed.trans (hdv.trans hvu)))))
      (hne (ne_of_gt (hxe.trans (hed.trans hdv))))
      (hne (ne_of_gt (hyx.trans (hxe.trans hed))))
      (hne (ne_of_gt (hPy.trans hyx)))
      (hne (ne_of_gt (hPy.trans (hyx.trans (hxe.trans (hed.trans hdv))))))
      (hne (ne_of_gt (hPy.trans (hyx.trans (hxe.trans hed)))))
      hwu hwv hwd hwx hwy hx_eq hv_eq hd_eq he_eq (Or.inr ⟨heSide, hPSide⟩)
  have hPxu : signedArea2 (phi iP) (phi ix) (phi iu) < 0 :=
    hneg_of_ccw hphi_inj hccw
      (hPy.trans hyx) (hxe.trans (hed.trans (hdv.trans hvu)))
  have hbase : 0 < signedArea2 (phi iP) (phi iu) (phi ix) := by
    rw [area_swap (phi iP) (phi iu) (phi ix)]
    linarith
  have hderived :=
    (CocircularPentagonOrder.signedArea2_pentagonFan_same_sign hradius
      (by simpa only [dist_eq_norm, norm_sub_rev] using hP_u)
      (by simpa only [dist_eq_norm, norm_sub_rev] using hP_v)
      (by simpa only [dist_eq_norm, norm_sub_rev] using hP_d)
      (by simpa only [dist_eq_norm, norm_sub_rev] using hP_x)
      (by simpa only [dist_eq_norm, norm_sub_rev] using hP_y)
      htx htv htd hte hxrep hvrep hdrep herep).2 hbase
  have hPxe : signedArea2 (phi iP) (phi ix) (phi ie) < 0 :=
    hneg_of_ccw hphi_inj hccw (hPy.trans hyx) hxe
  linarith

end BlockerVExactSeventeenCocircularPentagonOrder
end Problem97
