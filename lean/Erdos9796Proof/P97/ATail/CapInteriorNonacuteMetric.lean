/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Nonacute metric bridge for a strict indexed cap

This is the source-side bridge needed by the exact-five cap radius-drop
argument.  The ordered-cap normalization gives a nonacute angle at any
indexed carrier lying strictly between two distinct equidistant witnesses;
similarity transport then brings the sign back to the original points.
-/

open scoped EuclideanGeometry
open scoped InnerProductSpace

namespace Problem97
namespace ATailCapInteriorNonacuteMetric

open CGN

private theorem inner_polarization_distances (x y z : ℝ²) :
    2 * inner ℝ (x - z) (y - z) =
      dist x z ^ 2 + dist y z ^ 2 - dist x y ^ 2 := by
  rw [real_inner_eq_norm_mul_self_add_norm_mul_self_sub_norm_sub_mul_self_div_two]
  have hsub : (x - z) - (y - z) = x - y := by abel
  rw [hsub]
  simp only [dist_eq_norm]
  ring

/- Equal-radius pairs with a strictly acute outer apex and a nonacute inner
   carrier have strictly smaller inner radius. -/
theorem paired_equal_radius_drop_of_inner_signs
    {a c q w : ℝ²} {r s : ℝ}
    (hr : 0 ≤ r) (hs : 0 ≤ s)
    (haq : dist a q = r) (haw : dist a w = r)
    (hcq : dist c q = s) (hcw : dist c w = s)
    (houter : 0 < inner ℝ (q - a) (w - a))
    (hinner : inner ℝ (q - c) (w - c) ≤ 0) :
    s < r := by
  have haq' : dist q a = r := by simpa [dist_comm] using haq
  have haw' : dist w a = r := by simpa [dist_comm] using haw
  have hcq' : dist q c = s := by simpa [dist_comm] using hcq
  have hcw' : dist w c = s := by simpa [dist_comm] using hcw
  have houter_id := inner_polarization_distances q w a
  have hinner_id := inner_polarization_distances q w c
  have hsq : s ^ 2 < r ^ 2 := by
    nlinarith [houter_id, hinner_id, houter, hinner, haq', haw', hcq', hcw']
  by_contra hnot
  have hrs : r ≤ s := le_of_not_gt hnot
  have hfactor : 0 ≤ (s - r) * (s + r) :=
    mul_nonneg (sub_nonneg.mpr hrs) (add_nonneg hs hr)
  nlinarith [hsq, hfactor]

/- The weak cap-region inequality becomes strict when both test points are
   genuine interior carrier points.  The only extra input is convex
   independence: a zero cone coefficient would put one of the test points on
   a boundary ray, hence make three carrier points collinear. -/
theorem inner_pos_of_cap_region_pair_of_convex
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    {O c a b x y : ℝ²} {r : ℝ}
    (hcA : c ∈ A) (haA : a ∈ A) (hbA : b ∈ A)
    (hxA : x ∈ A) (hyA : y ∈ A)
    (hca : c ≠ a) (hcb : c ≠ b) (hab : a ≠ b)
    (hxc : x ≠ c) (hxa : x ≠ a) (hxb : x ≠ b)
    (hyc : y ≠ c) (hya : y ≠ a) (hyb : y ≠ b)
    (hcO : ‖c - O‖ = r) (haO : ‖a - O‖ = r) (hbO : ‖b - O‖ = r)
    (hxO : ‖x - O‖ ≤ r) (hyO : ‖y - O‖ ≤ r)
    (hMajor : ⟪midpoint ℝ a b - O, midpoint ℝ a b - c⟫_ℝ ≥ 0)
    (hxSide : signedArea2 x a b * signedArea2 c a b ≤ 0)
    (hySide : signedArea2 y a b * signedArea2 c a b ≤ 0) :
    0 < inner ℝ (x - c) (y - c) := by
  have hDne : signedArea2 c a b ≠ 0 := by
    intro hzero
    exact hconv.not_three_collinear hcA haA hbA hca hcb hab
      (collinear_of_signedArea2_eq_zero c a b hzero)
  obtain ⟨tx, sx, htx, hsx, hx_eq⟩ :=
    exists_cone_coeffs_of_cap_region hcO haO hbO hxO hxSide hDne
  obtain ⟨ty, sy, hty, hsy, hy_eq⟩ :=
    exists_cone_coeffs_of_cap_region hcO haO hbO hyO hySide hDne
  have htx_ne : tx ≠ 0 := by
    intro htx0
    have hx' : x = c + tx • (a - c) + sx • (b - c) := by
      calc
        x = c + (x - c) := by abel
        _ = c + (tx • (a - c) + sx • (b - c)) := by rw [hx_eq]
        _ = c + tx • (a - c) + sx • (b - c) := by abel
    have hzero : signedArea2 c x b = 0 := by
      rw [hx']
      simp only [signedArea2, PiLp.add_apply, PiLp.smul_apply,
        PiLp.sub_apply]
      simp [htx0]
      ring
    exact hconv.not_three_collinear hcA hxA hbA hxc.symm hcb hxb
      (collinear_of_signedArea2_eq_zero c x b hzero)
  have hty_ne : ty ≠ 0 := by
    intro hty0
    have hy' : y = c + ty • (a - c) + sy • (b - c) := by
      calc
        y = c + (y - c) := by abel
        _ = c + (ty • (a - c) + sy • (b - c)) := by rw [hy_eq]
        _ = c + ty • (a - c) + sy • (b - c) := by abel
    have hzero : signedArea2 c y b = 0 := by
      rw [hy']
      simp only [signedArea2, PiLp.add_apply, PiLp.smul_apply,
        PiLp.sub_apply]
      simp [hty0]
      ring
    exact hconv.not_three_collinear hcA hyA hbA hyc.symm hcb hyb
      (collinear_of_signedArea2_eq_zero c y b hzero)
  have hsx_ne : sx ≠ 0 := by
    intro hsx0
    have hx' : x = c + tx • (a - c) + sx • (b - c) := by
      calc
        x = c + (x - c) := by abel
        _ = c + (tx • (a - c) + sx • (b - c)) := by rw [hx_eq]
        _ = c + tx • (a - c) + sx • (b - c) := by abel
    have hzero : signedArea2 c a x = 0 := by
      rw [hx']
      simp only [signedArea2, PiLp.add_apply, PiLp.smul_apply,
        PiLp.sub_apply]
      simp [hsx0]
      ring
    exact hconv.not_three_collinear hcA haA hxA hca hxc.symm hxa.symm
      (collinear_of_signedArea2_eq_zero c a x hzero)
  have hsy_ne : sy ≠ 0 := by
    intro hsy0
    have hy' : y = c + ty • (a - c) + sy • (b - c) := by
      calc
        y = c + (y - c) := by abel
        _ = c + (ty • (a - c) + sy • (b - c)) := by rw [hy_eq]
        _ = c + ty • (a - c) + sy • (b - c) := by abel
    have hzero : signedArea2 c a y = 0 := by
      rw [hy']
      simp only [signedArea2, PiLp.add_apply, PiLp.smul_apply,
        PiLp.sub_apply]
      simp [hsy0]
      ring
    exact hconv.not_three_collinear hcA haA hyA hca hyc.symm hya.symm
      (collinear_of_signedArea2_eq_zero c a y hzero)
  have htx_pos : 0 < tx := lt_of_le_of_ne htx (Ne.symm htx_ne)
  have hty_pos : 0 < ty := lt_of_le_of_ne hty (Ne.symm hty_ne)
  have hsx_pos : 0 < sx := lt_of_le_of_ne hsx (Ne.symm hsx_ne)
  have hsy_pos : 0 < sy := lt_of_le_of_ne hsy (Ne.symm hsy_ne)
  have haOe : ‖a - O‖ = ‖c - O‖ := by rw [haO, hcO]
  have hbOe : ‖b - O‖ = ‖c - O‖ := by rw [hbO, hcO]
  have habInner : 0 ≤ inner ℝ (a - c) (b - c) :=
    inner_nonneg_of_on_sphere_same_halfplane haOe hbOe hMajor
  have hself : 0 < inner ℝ (a - c) (a - c) := by
    rw [real_inner_self_eq_norm_sq]
    exact sq_pos_of_pos (norm_pos_iff.mpr (sub_ne_zero.mpr hca.symm))
  rw [hx_eq, hy_eq]
  simp only [inner_add_left, inner_add_right,
    real_inner_smul_left, real_inner_smul_right]
  have h11 : 0 < tx * (ty * inner ℝ (a - c) (a - c)) :=
    mul_pos htx_pos (mul_pos hty_pos hself)
  have h12 : 0 ≤ tx * (sy * inner ℝ (a - c) (b - c)) :=
    mul_nonneg (le_of_lt htx_pos) (mul_nonneg (le_of_lt hsy_pos) habInner)
  have habInner' : 0 ≤ inner ℝ (b - c) (a - c) := by
    rw [real_inner_comm]
    exact habInner
  have h21 : 0 ≤ sx * (ty * inner ℝ (b - c) (a - c)) :=
    mul_nonneg (le_of_lt hsx_pos) (mul_nonneg (le_of_lt hty_pos) habInner')
  have h22 : 0 ≤ sx * (sy * inner ℝ (b - c) (b - c)) :=
    mul_nonneg (le_of_lt hsx_pos)
      (mul_nonneg (le_of_lt hsy_pos) real_inner_self_nonneg)
  linarith

/-- In a strict indexed cap, an equidistant carrier lies between the two
    witnesses in cap order, so the angle at the carrier is nonacute. -/
theorem inner_nonpos_of_capInterior_equidistant
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {q w c : ℝ²}
    (hq : q ∈ S.capInteriorByIndex i)
    (hw : w ∈ S.capInteriorByIndex i)
    (hc : c ∈ S.capInteriorByIndex i)
    (hqw : q ≠ w)
    (heq : dist c q = dist c w) :
    inner ℝ (q - c) (w - c) ≤ 0 := by
  rcases S.capByIndex_cgn4g_capData hconv i with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hqcap : q ∈ S.capByIndex i :=
    S.capInteriorByIndex_subset_capByIndex i hq
  have hwcap : w ∈ S.capByIndex i :=
    S.capInteriorByIndex_subset_capByIndex i hw
  have hccap : c ∈ S.capByIndex i :=
    S.capInteriorByIndex_subset_capByIndex i hc
  have hqimage : q ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hqcap
  have hwimage : w ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hwcap
  have hcimage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hccap
  rcases Finset.mem_image.mp hqimage with ⟨iq, hiq, hiqeq⟩
  rcases Finset.mem_image.mp hwimage with ⟨iw, hiw, hiweq⟩
  rcases Finset.mem_image.mp hcimage with ⟨ic, hic, hiceq⟩
  have hiqiw : iq ≠ iw := by
    intro h
    apply hqw
    calc
      q = L.points iq := hiqeq.symm
      _ = L.points iw := by rw [h]
      _ = w := hiweq
  have hicq : ic ≠ iq := by
    intro h
    have hcq : c = q := by
      calc
        c = L.points ic := hiceq.symm
        _ = L.points iq := by rw [h]
        _ = q := hiqeq
    apply hqw
    apply dist_eq_zero.mp
    calc
      dist q w = dist c w := by rw [hcq]
      _ = dist c q := heq.symm
      _ = dist q q := by rw [hcq]
      _ = 0 := dist_self q
  have hicw : ic ≠ iw := by
    intro h
    have hcw : c = w := by
      calc
        c = L.points ic := hiceq.symm
        _ = L.points iw := by rw [h]
        _ = w := hiweq
    apply hqw
    apply dist_eq_zero.mp
    calc
      dist q w = dist c q := by simpa [hcw, dist_comm]
      _ = dist c w := heq
      _ = dist w w := by rw [hcw]
      _ = 0 := dist_self w
  rcases lt_or_gt_of_ne hiqiw with hiq_lt_iw | hiw_lt_iq
  · have hbetween : iq < ic ∧ ic < iw :=
      CGN.index_strictly_between_of_equidistant Packet Hside Hord hiq_lt_iw
        (by exact hicq) (by exact hicw) (by
          simpa [hiqeq, hiweq, hiceq] using heq)
    rcases CGN.CGN6norm_minorCapChainModel_of_mecCapPacket Packet Hside Hord with
      ⟨T, hT, tau, ⟨M⟩⟩
    have hnonacute := CGN.CGN6b_nonacute_of_minorCapChainModel M
      hbetween.1 hbetween.2
    have hinnerT :
        inner ℝ (T (L.points iq) - T (L.points ic))
          (T (L.points iw) - T (L.points ic)) ≤ 0 := by
      simpa only [CGN.OrderedCap.map_points] using hnonacute
    have hdist :
        dist (T (L.points iq)) (T (L.points ic)) ^ 2 +
          dist (T (L.points iw)) (T (L.points ic)) ^ 2 -
          dist (T (L.points iq)) (T (L.points iw)) ^ 2 ≤ 0 := by
      have hpol := inner_polarization_distances
        (T (L.points iq)) (T (L.points iw)) (T (L.points ic))
      nlinarith [hpol, hinnerT]
    rw [tau.dist_image, tau.dist_image, tau.dist_image] at hdist
    have hscale : 0 < tau.scale ^ 2 := sq_pos_of_pos tau.scale_pos
    have hdist0 :
        dist (L.points iq) (L.points ic) ^ 2 +
          dist (L.points iw) (L.points ic) ^ 2 -
          dist (L.points iq) (L.points iw) ^ 2 ≤ 0 := by
      nlinarith
    have hpol := inner_polarization_distances
      (L.points iq) (L.points iw) (L.points ic)
    have hinner_idx :
        inner ℝ (L.points iq - L.points ic) (L.points iw - L.points ic) ≤ 0 := by
      nlinarith [hpol, hdist0]
    simpa [hiqeq, hiweq, hiceq] using hinner_idx
  · have hbetween : iw < ic ∧ ic < iq :=
      CGN.index_strictly_between_of_equidistant Packet Hside Hord hiw_lt_iq
        (by exact hicw) (by exact hicq) (by
          simpa [hiqeq, hiweq, hiceq] using heq.symm)
    rcases CGN.CGN6norm_minorCapChainModel_of_mecCapPacket Packet Hside Hord with
      ⟨T, hT, tau, ⟨M⟩⟩
    have hnonacute := CGN.CGN6b_nonacute_of_minorCapChainModel M
      hbetween.1 hbetween.2
    have hinnerT :
        inner ℝ (T (L.points iw) - T (L.points ic))
          (T (L.points iq) - T (L.points ic)) ≤ 0 := by
      simpa only [CGN.OrderedCap.map_points] using hnonacute
    have hdist :
        dist (T (L.points iw)) (T (L.points ic)) ^ 2 +
          dist (T (L.points iq)) (T (L.points ic)) ^ 2 -
          dist (T (L.points iw)) (T (L.points iq)) ^ 2 ≤ 0 := by
      have hpol := inner_polarization_distances
        (T (L.points iw)) (T (L.points iq)) (T (L.points ic))
      nlinarith [hpol, hinnerT]
    rw [tau.dist_image, tau.dist_image, tau.dist_image] at hdist
    have hscale : 0 < tau.scale ^ 2 := sq_pos_of_pos tau.scale_pos
    have hdist0 :
        dist (L.points iw) (L.points ic) ^ 2 +
          dist (L.points iq) (L.points ic) ^ 2 -
          dist (L.points iw) (L.points iq) ^ 2 ≤ 0 := by
      nlinarith
    have hpol := inner_polarization_distances
      (L.points iw) (L.points iq) (L.points ic)
    have hinner_idx :
        inner ℝ (L.points iw - L.points ic) (L.points iq - L.points ic) ≤ 0 := by
      nlinarith [hpol, hdist0]
    have hinner_orig : inner ℝ (w - c) (q - c) ≤ 0 := by
      simpa [hiqeq, hiweq, hiceq] using hinner_idx
    simpa [real_inner_comm] using hinner_orig

end ATailCapInteriorNonacuteMetric
end Problem97
