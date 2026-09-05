/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.ConvexCyclicOrder.Basic
import Erdos9796Proof.P97.U2.SimilarityNormalization

/-!
# Exact-five profile 0034 common obstruction

This module isolates the branch-free scalar contradiction mined from the
common physical core of the direct and mirror profile-0034 cells. The public
statement deliberately keeps only the seven signed-area inequalities and four
metric equations used by the proof.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore
namespace Profile0034

def cross (ax ay bx byy cx cy : ℝ) : ℝ :=
  (bx - ax) * (cy - ay) - (byy - ay) * (cx - ax)

def qdist (ax ay bx byy : ℝ) : ℝ :=
  (ax - bx) ^ 2 + 3 * (ay - byy) ^ 2

/-- The normalized mutual-center circle equations and four strict half-frame
inequalities force the cross product at the equilateral anchor to be negative.
This is the division-free scalar certificate for the guarded five-point order
`U<a<s<d<O`. -/
theorem normalized_pentagon_cross_neg
    (x y z w : ℝ)
    (hs : x ^ 2 + 3 * y ^ 2 = 1)
    (hd : z ^ 2 + 3 * w ^ 2 = 2 * z)
    (hx : 1 / 2 < x) (hz : 1 / 2 < z)
    (hw : w < 0) (hzw : 0 < z + w) :
    cross (1 / 2) (-1 / 2) x y z w < 0 := by
  have hz0 : 0 < z := by linarith
  have hx2 : 0 < 2 * x - 1 := by linarith
  have hz2 : 0 < 2 * z - 1 := by linarith
  have hw0 : 0 < -w := by linarith
  have hp : 0 < 12 * (2 * x - 1) * (-w) * (z + w) :=
    mul_pos (mul_pos (mul_pos (by norm_num) hx2) hw0) hzw
  have hsq : 0 ≤ (2 * x - 1) ^ 2 + 3 * (2 * y + 1) ^ 2 := by
    positivity
  have hn : 0 ≤ z * (2 * z - 1) *
      ((2 * x - 1) ^ 2 + 3 * (2 * y + 1) ^ 2) :=
    mul_nonneg (le_of_lt (mul_pos hz0 hz2)) hsq
  have hid :
      24 * z * cross (1 / 2) (-1 / 2) x y z w +
        12 * (2 * x - 1) * (-w) * (z + w) +
        z * (2 * z - 1) * ((2 * x - 1) ^ 2 + 3 * (2 * y + 1) ^ 2) = 0 := by
    calc
      _ = 4 * z * (2 * z - 1) * (x ^ 2 + 3 * y ^ 2 - 1) -
          4 * (2 * x - 1) * (z ^ 2 + 3 * w ^ 2 - 2 * z) := by
            unfold cross
            ring
      _ = 0 := by rw [hs, hd]; ring
  by_contra hc
  have hc0 : 0 ≤ cross (1 / 2) (-1 / 2) x y z w := le_of_not_gt hc
  have hnonneg : 0 ≤ 24 * z * cross (1 / 2) (-1 / 2) x y z w :=
    mul_nonneg (by positivity) hc0
  linarith

/-- The six positive determinants of the normalized cyclic order
`U,a,s,d,O` contradict the two mutual-center circle equations. -/
theorem false_of_normalized_pentagon_order
    (x y z w : ℝ)
    (hs : x ^ 2 + 3 * y ^ 2 = 1)
    (hd : z ^ 2 + 3 * w ^ 2 = 2 * z)
    (hUas : 0 < cross 0 0 (1 / 2) (-1 / 2) x y)
    (hasO : 0 < cross (1 / 2) (-1 / 2) x y 1 0)
    (hUad : 0 < cross 0 0 (1 / 2) (-1 / 2) z w)
    (hadO : 0 < cross (1 / 2) (-1 / 2) z w 1 0)
    (hUdO : 0 < cross 0 0 z w 1 0)
    (hasd : 0 < cross (1 / 2) (-1 / 2) x y z w) : False := by
  have hx : 1 / 2 < x := by
    norm_num [cross] at hUas hasO ⊢
    linarith
  have hz : 1 / 2 < z := by
    norm_num [cross] at hUad hadO ⊢
    linarith
  have hw : w < 0 := by
    norm_num [cross] at hUdO ⊢
    linarith
  have hzw : 0 < z + w := by
    norm_num [cross] at hUad ⊢
    linarith
  have hneg := normalized_pentagon_cross_neg x y z w hs hd hx hz hw hzw
  linarith

set_option maxHeartbeats 2000000 in
-- The normalized nonlinear elimination uses several nested `nlinarith` calls;
-- the default heartbeat budget is insufficient on a clean build.
theorem normalized_first_chain_obstruction
    (px py sx sy : ℝ)
    (hUps : 0 < cross 0 0 px py sx sy)
    (hUpa : 0 < cross 0 0 px py (1 / 2) (-1 / 2))
    (hpsa : 0 < cross px py sx sy (1 / 2) (-1 / 2))
    (hOap : qdist 1 0 (1 / 2) (-1 / 2) = qdist 1 0 px py)
    (hUOs : qdist 0 0 1 0 = qdist 0 0 sx sy) :
    sx < 1 / 2 ∧ sy < -1 / 2 := by
  norm_num [cross, qdist] at *
  have hpxpy : px + py < 0 := by
    linarith only [hUpa]
  have hpcircle : px ^ 2 - 2 * px + 3 * py ^ 2 = 0 := by
    nlinarith only [hOap]
  have hpy : py < 0 := by
    by_contra hpy_not
    have hpy_nonneg : 0 ≤ py := by linarith only [hpy_not]
    have hpx_neg : px < 0 := by linarith only [hpxpy, hpy_nonneg]
    nlinarith only [hpcircle, hpx_neg, sq_nonneg px, sq_nonneg py]
  have hscircle : sx ^ 2 + 3 * sy ^ 2 = 1 := by
    linarith only [hUOs]
  have hpy_sq : 0 < py ^ 2 := by
    have hpy_mul : 0 < py * py := mul_pos_of_neg_of_neg hpy hpy
    simpa only [pow_two] using hpy_mul
  have hpx : 0 < px := by
    nlinarith only [hpcircle, hpy_sq]
  have hA : 0 < -3 * py - px := by
    linarith only [hpxpy, hpy]
  have hB : 0 < 3 * (px - py) := by
    linarith only [hpx, hpy]
  have hEshift :
      (-3 * py - px) * sx + 3 * (px - py) * sy + 2 * px =
        (-3 * py - px) * (sx - 1 / 2) +
          3 * (px - py) * (sy + 1 / 2) := by
    ring
  have hcross_relation :
      4 * ((sx - px) * (-1 / 2 - py) - (sy - py) * (1 / 2 - px)) * px =
        (px + py) *
          ((-3 * py - px) * sx + 3 * (px - py) * sy + 2 * px) := by
    linear_combination (sx + sy) * hpcircle
  have hleft_pos :
      0 < 4 * ((sx - px) * (-1 / 2 - py) - (sy - py) * (1 / 2 - px)) * px := by
    have hcross_pos :
        0 < (sx - px) * (-1 / 2 - py) - (sy - py) * (1 / 2 - px) := by
      linarith only [hpsa]
    exact mul_pos (mul_pos (by norm_num) hcross_pos) hpx
  have hprod_pos :
      0 < (px + py) *
        ((-3 * py - px) * sx + 3 * (px - py) * sy + 2 * px) := by
    linarith only [hcross_relation, hleft_pos]
  have hEneg :
      (-3 * py - px) * sx + 3 * (px - py) * sy + 2 * px < 0 := by
    rcases (mul_pos_iff.mp hprod_pos) with h | h
    · exact (not_lt_of_ge (le_of_lt hpxpy) h.1).elim
    · exact h.2
  have hsx : sx < 1 / 2 := by
    by_contra hsx_not
    have hu : 0 ≤ sx - 1 / 2 := by
      linarith only [hsx_not]
    have hv : sy + 1 / 2 < 0 := by
      by_contra hv_not
      have hv_nonneg : 0 ≤ sy + 1 / 2 := by
        linarith only [hv_not]
      have hAu : 0 ≤ (-3 * py - px) * (sx - 1 / 2) :=
        mul_nonneg (le_of_lt hA) hu
      have hBv : 0 ≤ 3 * (px - py) * (sy + 1 / 2) :=
        mul_nonneg (le_of_lt hB) hv_nonneg
      linarith only [hEneg, hEshift, hAu, hBv]
    have hshifted_circle :
        (sx - 1 / 2) ^ 2 + 3 * (sy + 1 / 2) ^ 2 +
            (sx - 1 / 2) - 3 * (sy + 1 / 2) = 0 := by
      nlinarith only [hscircle]
    nlinarith only [hshifted_circle, hu, hv,
      sq_nonneg (sx - 1 / 2), sq_nonneg (sy + 1 / 2)]
  have hsy : sy < -1 / 2 := by
    by_contra hsy_not
    have hv_nonneg : 0 ≤ sy + 1 / 2 := by
      linarith only [hsy_not]
    have hBC_pos :
        0 < 3 * (px - py) * (px * sy - py * sx) := by
      have hcross_pos : 0 < px * sy - py * sx := by
        linarith only [hUps]
      exact mul_pos hB hcross_pos
    have hminus_pxE_pos :
        0 < -px *
          ((-3 * py - px) * sx + 3 * (px - py) * sy + 2 * px) := by
      exact mul_pos_of_neg_of_neg (by linarith) hEneg
    have hcombo_pos :
        0 < 3 * (px - py) * (px * sy - py * sx) -
          px * ((-3 * py - px) * sx + 3 * (px - py) * sy + 2 * px) := by
      linarith only [hBC_pos, hminus_pxE_pos]
    have hcombo_identity :
        3 * (px - py) * (px * sy - py * sx) -
            px * ((-3 * py - px) * sx + 3 * (px - py) * sy + 2 * px) =
          2 * px * (sx - px) := by
      linear_combination sx * hpcircle
    have hpx_ltsx : px < sx := by
      rw [hcombo_identity] at hcombo_pos
      rcases (mul_pos_iff.mp hcombo_pos) with h | h
      · linarith only [h.2]
      · linarith only [h.1, hpx]
    have hsx_pos : 0 < sx := lt_trans hpx hpx_ltsx
    have hw_pos : 0 < 1 / 2 - sx := by
      linarith only [hsx]
    have hw_lt_half : 1 / 2 - sx < 1 / 2 := by
      linarith only [hsx_pos]
    have hshifted_circle :
        3 * (sy + 1 / 2) * (sy + 1 / 2 - 1) =
          (1 / 2 - sx) * (1 - (1 / 2 - sx)) := by
      nlinarith only [hscircle]
    have hright_pos :
        0 < (1 / 2 - sx) * (1 - (1 / 2 - sx)) := by
      exact mul_pos hw_pos (by linarith only [hw_lt_half])
    have hv_prod_pos :
        0 < (sy + 1 / 2) * (sy + 1 / 2 - 1) := by
      nlinarith only [hshifted_circle, hright_pos]
    have hv_one : 1 < sy + 1 / 2 := by
      rcases (mul_pos_iff.mp hv_prod_pos) with h | h
      · linarith only [h.2]
      · exact (not_lt_of_ge hv_nonneg h.1).elim
    have hAw :
        (-3 * py - px) * (1 / 2 - sx) < (-3 * py - px) * (1 / 2) := by
      exact mul_lt_mul_of_pos_left hw_lt_half hA
    have hAhalf_lt_B :
        (-3 * py - px) * (1 / 2) < 3 * (px - py) := by
      linarith only [hpx, hpy]
    have hB_lt_Bv :
        3 * (px - py) < 3 * (px - py) * (sy + 1 / 2) := by
      nlinarith only [mul_lt_mul_of_pos_left hv_one hB]
    have hEpos_shift :
        0 < (-3 * py - px) * (sx - 1 / 2) +
          3 * (px - py) * (sy + 1 / 2) := by
      linarith only [hAw, hAhalf_lt_B, hB_lt_Bv]
    linarith only [hEneg, hEshift, hEpos_shift]
  constructor
  · exact hsx
  · linarith [hsy]

set_option maxHeartbeats 2000000 in
-- Combining the two normalized chains enlarges the nonlinear context enough
-- that a clean build needs the same bounded heartbeat allowance.
theorem normalized_common_obstruction
    (px py sx sy dx dy cx cy : ℝ)
    (hUps : 0 < cross 0 0 px py sx sy)
    (hUpa : 0 < cross 0 0 px py (1 / 2) (-1 / 2))
    (hUpc : 0 < cross 0 0 px py cx cy)
    (hpsa : 0 < cross px py sx sy (1 / 2) (-1 / 2))
    (hads : 0 < cross (1 / 2) (-1 / 2) dx dy sx sy)
    (hadc : 0 < cross (1 / 2) (-1 / 2) dx dy cx cy)
    (hdcU : 0 < cross dx dy cx cy 0 0)
    (hOad : qdist 1 0 (1 / 2) (-1 / 2) = qdist 1 0 dx dy)
    (hOap : qdist 1 0 (1 / 2) (-1 / 2) = qdist 1 0 px py)
    (hUOs : qdist 0 0 1 0 = qdist 0 0 sx sy)
    (hcOa : qdist cx cy 1 0 = qdist cx cy (1 / 2) (-1 / 2)) :
    False := by
  have hchain := normalized_first_chain_obstruction px py sx sy
    hUps hUpa hpsa hOap hUOs
  rcases hchain with ⟨hsx, hsy⟩
  norm_num [cross, qdist] at hUps hUpa hUpc hpsa hads hadc hdcU hOad hOap hUOs hcOa hsx hsy
  have hpcircle : px ^ 2 - 2 * px + 3 * py ^ 2 = 0 := by
    nlinarith only [hOap]
  have hpxpy : px + py < 0 := by
    linarith only [hUpa]
  have hpy : py < 0 := by
    by_contra hpy_not
    have hpy_nonneg : 0 ≤ py := by linarith only [hpy_not]
    have hpx_neg : px < 0 := by linarith only [hpxpy, hpy_nonneg]
    nlinarith only [hpcircle, hpx_neg, sq_nonneg px, sq_nonneg py]
  have hpx3py : px + 3 * py < 0 := by
    linarith only [hpxpy, hpy]
  have hcline : cx + 3 * cy = 0 := by
    nlinarith only [hcOa]
  have hcx : cx = -3 * cy := by
    linarith
  have hUpc_factored : 0 < cy * (px + 3 * py) := by
    rw [hcx] at hUpc
    nlinarith only [hUpc]
  have hcy : cy < 0 := by
    rcases (mul_pos_iff.mp hUpc_factored) with h | h
    · exact (not_lt_of_ge (le_of_lt hpx3py) h.2).elim
    · exact h.1
  have hdc_factored : 0 < cy * (dx + 3 * dy) := by
    rw [hcx] at hdcU
    nlinarith only [hdcU]
  have hdcircle : dx ^ 2 - 2 * dx + 3 * dy ^ 2 = 0 := by
    nlinarith only [hOad]
  have hsupport : 0 ≤ dx + 3 * dy + 1 := by
    have hsupport_identity :
        dx + 3 * dy + 1 = (dx - 1 / 2) ^ 2 + 3 * (dy + 1 / 2) ^ 2 := by
      nlinarith only [hdcircle]
    rw [hsupport_identity]
    exact add_nonneg (sq_nonneg _) (mul_nonneg (by norm_num) (sq_nonneg _))
  have hAdc_expanded :
      0 < cy * (dx + 3 * dy + 1) + (dx + dy) / 2 := by
    rw [hcx] at hadc
    nlinarith only [hadc]
  have hdxdy : 0 < dx + dy := by
    have hprod_nonpos : cy * (dx + 3 * dy + 1) ≤ 0 :=
      mul_nonpos_of_nonpos_of_nonneg (le_of_lt hcy) hsupport
    linarith only [hAdc_expanded, hprod_nonpos]
  have hdx3dy : dx + 3 * dy < 0 := by
    rcases (mul_pos_iff.mp hdc_factored) with h | h
    · exact (not_lt_of_ge (le_of_lt hcy) h.1).elim
    · exact h.2
  have hdy : dy < 0 := by
    linarith only [hdxdy, hdx3dy]
  have hdx : 0 < dx := by
    linarith only [hdxdy, hdy]
  have hdx_minus_dy : 0 < dx - dy := by
    linarith
  have hfirst_term_neg :
      3 * (dx - dy) * (sy + 1 / 2) < 0 := by
    exact mul_neg_of_pos_of_neg (mul_pos (by norm_num) hdx_minus_dy) (by linarith)
  have hsecond_term_pos :
      0 < (dx + 3 * dy) * (sx - 1 / 2) := by
    exact mul_pos_of_neg_of_neg hdx3dy (by linarith)
  have hbracket_neg :
      3 * (dx - dy) * (sy + 1 / 2) -
          (dx + 3 * dy) * (sx - 1 / 2) < 0 := by
    linarith
  have hright_neg :
      (dx + dy) *
          (3 * (dx - dy) * (sy + 1 / 2) -
            (dx + 3 * dy) * (sx - 1 / 2)) < 0 := by
    exact mul_neg_of_pos_of_neg hdxdy hbracket_neg
  have hfactor_identity :
      4 * dx *
          ((dx - 1 / 2) * (sy + 1 / 2) -
            (dy + 1 / 2) * (sx - 1 / 2)) =
        (dx + dy) *
          (3 * (dx - dy) * (sy + 1 / 2) -
            (dx + 3 * dy) * (sx - 1 / 2)) := by
    linear_combination (sx + sy) * hdcircle
  have hleft_pos :
      0 < 4 * dx *
        ((dx - 1 / 2) * (sy + 1 / 2) -
          (dy + 1 / 2) * (sx - 1 / 2)) := by
    have hcross_pos :
        0 < (dx - 1 / 2) * (sy + 1 / 2) -
          (dy + 1 / 2) * (sx - 1 / 2) := by
      linarith only [hads]
    exact mul_pos (mul_pos (by norm_num) hdx) hcross_pos
  rw [hfactor_identity] at hleft_pos
  linarith only [hleft_pos, hright_neg]

set_option maxHeartbeats 2000000 in
-- The swapped-chain proof performs a factored quadratic sign elimination;
-- the bounded allowance keeps that kernel-checked calculation reproducible.
/-- In the normalized equilateral frame, the profile-0034 circle equations
exclude the swapped chain `U<a<s<d<c<O`. -/
theorem normalized_a_before_s_obstruction
    (sx sy dx dy cx cy : ℝ)
    (hUas : 0 < cross 0 0 (1 / 2) (-1 / 2) sx sy)
    (hasO : 0 < cross (1 / 2) (-1 / 2) sx sy 1 0)
    (hUad : 0 < cross 0 0 (1 / 2) (-1 / 2) dx dy)
    (hUac : 0 < cross 0 0 (1 / 2) (-1 / 2) cx cy)
    (hsda : 0 < cross sx sy dx dy (1 / 2) (-1 / 2))
    (hdcU : 0 < cross dx dy cx cy 0 0)
    (hOad : qdist 1 0 (1 / 2) (-1 / 2) = qdist 1 0 dx dy)
    (hUOs : qdist 0 0 1 0 = qdist 0 0 sx sy)
    (hcOa : qdist cx cy 1 0 = qdist cx cy (1 / 2) (-1 / 2)) :
    False := by
  norm_num [cross, qdist] at *
  have hsx : 1 / 2 < sx := by linarith only [hUas, hasO]
  have hsy : -1 / 2 < sy := by
    by_contra hsy_not
    have hsy_le : sy ≤ -1 / 2 := by linarith only [hsy_not]
    nlinarith only [hUOs, hsx, hsy_le, sq_nonneg sx, sq_nonneg sy]
  have hcline : cx + 3 * cy = 0 := by nlinarith only [hcOa]
  have hcy : cy < 0 := by linarith only [hUac, hcline]
  have hdxdy : 0 < dx + dy := by linarith only [hUad]
  have hdx3dy : dx + 3 * dy < 0 := by
    have hcx : cx = -3 * cy := by linarith only [hcline]
    rw [hcx] at hdcU
    have hprod : 0 < cy * (dx + 3 * dy) := by
      nlinarith only [hdcU]
    rcases (mul_pos_iff.mp hprod) with h | h
    · exact (not_lt_of_ge (le_of_lt hcy) h.1).elim
    · exact h.2
  have hdy : dy < -1 / 2 := by
    have hdcircle : dx ^ 2 - 2 * dx + 3 * dy ^ 2 = 0 := by
      nlinarith only [hOad]
    have hdx : 0 < dx := by linarith only [hdxdy, hdx3dy]
    have hprod : (dx + dy) * (dx + 3 * dy) < 0 :=
      mul_neg_of_pos_of_neg hdxdy hdx3dy
    have hfactor :
        dx ^ 2 - 2 * dx + 3 * dy ^ 2 =
          (dx + dy) * (dx + 3 * dy) - 2 * dx * (2 * dy + 1) := by
      ring
    by_contra hdy_not
    have hshift : 0 ≤ 2 * dy + 1 := by linarith only [hdy_not]
    have hterm : 0 ≤ 2 * dx * (2 * dy + 1) :=
      mul_nonneg (mul_nonneg (by norm_num) (le_of_lt hdx)) hshift
    linarith only [hdcircle, hfactor, hprod, hterm]
  have hdx : 1 / 2 < dx := by linarith only [hdxdy, hdy]
  have hfirst : (sx - 1 / 2) * (dy + 1 / 2) < 0 :=
    mul_neg_of_pos_of_neg (sub_pos.mpr hsx) (by linarith only [hdy])
  have hsecond : 0 < (sy + 1 / 2) * (dx - 1 / 2) :=
    mul_pos (by linarith only [hsy]) (sub_pos.mpr hdx)
  linarith only [hsda, hfirst, hsecond]

private theorem scaled_cross_eq_signedArea2_div
    (r : ℝ) (hr : r ≠ 0) (X Y Z : ℝ²) :
    cross (X 0) (X 1 / r) (Y 0) (Y 1 / r) (Z 0) (Z 1 / r) =
      signedArea2 X Y Z / r := by
  simp only [cross, signedArea2]
  field_simp

private theorem scaled_qdist_eq_dist_sq
    (r : ℝ) (hr : r ≠ 0) (hr_sq : r ^ 2 = 3) (X Y : ℝ²) :
    qdist (X 0) (X 1 / r) (Y 0) (Y 1 / r) = dist X Y ^ 2 := by
  rw [dist_sq_coord]
  simp only [qdist]
  rw [← hr_sq]
  field_simp

/-- The common obstruction in the standard Euclidean equilateral frame. This
wrapper converts ordinary signed areas and distances to the rational scalar
coordinates used by `normalized_common_obstruction`. -/
theorem normalized_euclidean_common_obstruction
    (p s d c : ℝ²)
    (hUps : 0 < signedArea2 (pt 0 0) p s)
    (hUpa : 0 < signedArea2 (pt 0 0) p
      (pt (1 / 2) (-Real.sqrt 3 / 2)))
    (hUpc : 0 < signedArea2 (pt 0 0) p c)
    (hpsa : 0 < signedArea2 p s (pt (1 / 2) (-Real.sqrt 3 / 2)))
    (hads : 0 < signedArea2 (pt (1 / 2) (-Real.sqrt 3 / 2)) d s)
    (hadc : 0 < signedArea2 (pt (1 / 2) (-Real.sqrt 3 / 2)) d c)
    (hdcU : 0 < signedArea2 d c (pt 0 0))
    (hOad : dist (pt 1 0) (pt (1 / 2) (-Real.sqrt 3 / 2)) = dist (pt 1 0) d)
    (hOap : dist (pt 1 0) (pt (1 / 2) (-Real.sqrt 3 / 2)) = dist (pt 1 0) p)
    (hUOs : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) s)
    (hcOa : dist c (pt 1 0) = dist c (pt (1 / 2) (-Real.sqrt 3 / 2))) :
    False := by
  let r : ℝ := Real.sqrt 3
  have hr : 0 < r := by
    dsimp only [r]
    positivity
  have hr_ne : r ≠ 0 := ne_of_gt hr
  have hr_sq : r ^ 2 = 3 := by
    dsimp only [r]
    exact Real.sq_sqrt (by norm_num)
  have hanchor_y : -Real.sqrt 3 / 2 / r = -1 / 2 := by
    dsimp only [r]
    field_simp
  have cross_pos (X Y Z : ℝ²) (h : 0 < signedArea2 X Y Z) :
      0 < cross (X 0) (X 1 / r) (Y 0) (Y 1 / r) (Z 0) (Z 1 / r) := by
    rw [scaled_cross_eq_signedArea2_div r hr_ne X Y Z]
    exact div_pos h hr
  have qdist_eq (X Y : ℝ²) :
      qdist (X 0) (X 1 / r) (Y 0) (Y 1 / r) = dist X Y ^ 2 :=
    scaled_qdist_eq_dist_sq r hr_ne hr_sq X Y
  have hOad_sq := congrArg (fun x : ℝ ↦ x ^ 2) hOad
  have hOap_sq := congrArg (fun x : ℝ ↦ x ^ 2) hOap
  have hUOs_sq := congrArg (fun x : ℝ ↦ x ^ 2) hUOs
  have hcOa_sq := congrArg (fun x : ℝ ↦ x ^ 2) hcOa
  apply normalized_common_obstruction
      (p 0) (p 1 / r) (s 0) (s 1 / r)
      (d 0) (d 1 / r) (c 0) (c 1 / r)
  · simpa [pt, r, hr_ne] using cross_pos (pt 0 0) p s hUps
  · simpa [pt, r, hr_ne, hanchor_y] using
      cross_pos (pt 0 0) p (pt (1 / 2) (-Real.sqrt 3 / 2)) hUpa
  · simpa [pt, r, hr_ne] using cross_pos (pt 0 0) p c hUpc
  · simpa [pt, r, hr_ne, hanchor_y] using
      cross_pos p s (pt (1 / 2) (-Real.sqrt 3 / 2)) hpsa
  · simpa [pt, r, hr_ne, hanchor_y] using
      cross_pos (pt (1 / 2) (-Real.sqrt 3 / 2)) d s hads
  · simpa [pt, r, hr_ne, hanchor_y] using
      cross_pos (pt (1 / 2) (-Real.sqrt 3 / 2)) d c hadc
  · simpa [pt, r, hr_ne] using cross_pos d c (pt 0 0) hdcU
  · simpa [pt, r, hr_ne, hanchor_y] using
      (show
        qdist ((pt 1 0 : ℝ²) 0) ((pt 1 0 : ℝ²) 1 / r)
            ((pt (1 / 2) (-Real.sqrt 3 / 2) : ℝ²) 0)
            ((pt (1 / 2) (-Real.sqrt 3 / 2) : ℝ²) 1 / r) =
          qdist ((pt 1 0 : ℝ²) 0) ((pt 1 0 : ℝ²) 1 / r)
            (d 0) (d 1 / r) by
        rw [qdist_eq, qdist_eq]
        exact hOad_sq)
  · simpa [pt, r, hr_ne, hanchor_y] using
      (show
        qdist ((pt 1 0 : ℝ²) 0) ((pt 1 0 : ℝ²) 1 / r)
            ((pt (1 / 2) (-Real.sqrt 3 / 2) : ℝ²) 0)
            ((pt (1 / 2) (-Real.sqrt 3 / 2) : ℝ²) 1 / r) =
          qdist ((pt 1 0 : ℝ²) 0) ((pt 1 0 : ℝ²) 1 / r)
            (p 0) (p 1 / r) by
        rw [qdist_eq, qdist_eq]
        exact hOap_sq)
  · simpa [pt, r, hr_ne, hanchor_y] using
      (show
        qdist ((pt 0 0 : ℝ²) 0) ((pt 0 0 : ℝ²) 1 / r)
            ((pt 1 0 : ℝ²) 0) ((pt 1 0 : ℝ²) 1 / r) =
          qdist ((pt 0 0 : ℝ²) 0) ((pt 0 0 : ℝ²) 1 / r)
            (s 0) (s 1 / r) by
        rw [qdist_eq, qdist_eq]
        exact hUOs_sq)
  · simpa [pt, r, hr_ne, hanchor_y] using
      (show
        qdist (c 0) (c 1 / r)
            ((pt 1 0 : ℝ²) 0) ((pt 1 0 : ℝ²) 1 / r) =
          qdist (c 0) (c 1 / r)
            ((pt (1 / 2) (-Real.sqrt 3 / 2) : ℝ²) 0)
            ((pt (1 / 2) (-Real.sqrt 3 / 2) : ℝ²) 1 / r) by
        rw [qdist_eq, qdist_eq]
        exact hcOa_sq)

/-- Euclidean-coordinate form of the normalized `U<a<s<d<c<O`
obstruction. -/
theorem normalized_euclidean_a_before_s_obstruction
    (s d c : ℝ²)
    (hUas : 0 < signedArea2 (pt 0 0)
      (pt (1 / 2) (-Real.sqrt 3 / 2)) s)
    (hasO : 0 < signedArea2 (pt (1 / 2) (-Real.sqrt 3 / 2)) s (pt 1 0))
    (hUad : 0 < signedArea2 (pt 0 0)
      (pt (1 / 2) (-Real.sqrt 3 / 2)) d)
    (hUac : 0 < signedArea2 (pt 0 0)
      (pt (1 / 2) (-Real.sqrt 3 / 2)) c)
    (hsda : 0 < signedArea2 s d (pt (1 / 2) (-Real.sqrt 3 / 2)))
    (hdcU : 0 < signedArea2 d c (pt 0 0))
    (hOad : dist (pt 1 0) (pt (1 / 2) (-Real.sqrt 3 / 2)) = dist (pt 1 0) d)
    (hUOs : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) s)
    (hcOa : dist c (pt 1 0) = dist c (pt (1 / 2) (-Real.sqrt 3 / 2))) :
    False := by
  let r : ℝ := Real.sqrt 3
  have hr : 0 < r := by
    dsimp only [r]
    positivity
  have hr_ne : r ≠ 0 := ne_of_gt hr
  have hr_sq : r ^ 2 = 3 := by
    dsimp only [r]
    exact Real.sq_sqrt (by norm_num)
  have hanchor_y : -Real.sqrt 3 / 2 / r = -1 / 2 := by
    dsimp only [r]
    field_simp
  have cross_pos (X Y Z : ℝ²) (h : 0 < signedArea2 X Y Z) :
      0 < cross (X 0) (X 1 / r) (Y 0) (Y 1 / r) (Z 0) (Z 1 / r) := by
    rw [scaled_cross_eq_signedArea2_div r hr_ne X Y Z]
    exact div_pos h hr
  have qdist_eq (X Y : ℝ²) :
      qdist (X 0) (X 1 / r) (Y 0) (Y 1 / r) = dist X Y ^ 2 :=
    scaled_qdist_eq_dist_sq r hr_ne hr_sq X Y
  have hOad_sq := congrArg (fun x : ℝ ↦ x ^ 2) hOad
  have hUOs_sq := congrArg (fun x : ℝ ↦ x ^ 2) hUOs
  have hcOa_sq := congrArg (fun x : ℝ ↦ x ^ 2) hcOa
  apply normalized_a_before_s_obstruction
      (s 0) (s 1 / r) (d 0) (d 1 / r) (c 0) (c 1 / r)
  · simpa [pt, r, hr_ne, hanchor_y] using
      cross_pos (pt 0 0) (pt (1 / 2) (-Real.sqrt 3 / 2)) s hUas
  · simpa [pt, r, hr_ne, hanchor_y] using
      cross_pos (pt (1 / 2) (-Real.sqrt 3 / 2)) s (pt 1 0) hasO
  · simpa [pt, r, hr_ne, hanchor_y] using
      cross_pos (pt 0 0) (pt (1 / 2) (-Real.sqrt 3 / 2)) d hUad
  · simpa [pt, r, hr_ne, hanchor_y] using
      cross_pos (pt 0 0) (pt (1 / 2) (-Real.sqrt 3 / 2)) c hUac
  · simpa [pt, r, hr_ne, hanchor_y] using
      cross_pos s d (pt (1 / 2) (-Real.sqrt 3 / 2)) hsda
  · simpa [pt, r, hr_ne] using cross_pos d c (pt 0 0) hdcU
  · simpa [pt, r, hr_ne, hanchor_y] using
      (show
        qdist ((pt 1 0 : ℝ²) 0) ((pt 1 0 : ℝ²) 1 / r)
            ((pt (1 / 2) (-Real.sqrt 3 / 2) : ℝ²) 0)
            ((pt (1 / 2) (-Real.sqrt 3 / 2) : ℝ²) 1 / r) =
          qdist ((pt 1 0 : ℝ²) 0) ((pt 1 0 : ℝ²) 1 / r)
            (d 0) (d 1 / r) by
        rw [qdist_eq, qdist_eq]
        exact hOad_sq)
  · simpa [pt, r, hr_ne] using
      (show
        qdist ((pt 0 0 : ℝ²) 0) ((pt 0 0 : ℝ²) 1 / r)
            ((pt 1 0 : ℝ²) 0) ((pt 1 0 : ℝ²) 1 / r) =
          qdist ((pt 0 0 : ℝ²) 0) ((pt 0 0 : ℝ²) 1 / r)
            (s 0) (s 1 / r) by
        rw [qdist_eq, qdist_eq]
        exact hUOs_sq)
  · simpa [pt, r, hr_ne, hanchor_y] using
      (show
        qdist (c 0) (c 1 / r)
            ((pt 1 0 : ℝ²) 0) ((pt 1 0 : ℝ²) 1 / r) =
          qdist (c 0) (c 1 / r)
            ((pt (1 / 2) (-Real.sqrt 3 / 2) : ℝ²) 0)
            ((pt (1 / 2) (-Real.sqrt 3 / 2) : ℝ²) 1 / r) by
        rw [qdist_eq, qdist_eq]
        exact hcOa_sq)

/-- A negatively oriented equilateral frame cannot realize the swapped
profile-0034 chain `U<a<s<d<c<O`. -/
theorem euclidean_a_before_s_obstruction
    (U a s d c O : ℝ²)
    (hUO_ne : U ≠ O)
    (hUO_Ua : dist U O = dist U a)
    (hUO_Oa : dist U O = dist O a)
    (hUOa : signedArea2 U O a < 0)
    (hUas : 0 < signedArea2 U a s)
    (hasO : 0 < signedArea2 a s O)
    (hUad : 0 < signedArea2 U a d)
    (hUac : 0 < signedArea2 U a c)
    (hsda : 0 < signedArea2 s d a)
    (hdcU : 0 < signedArea2 d c U)
    (hOad : dist O a = dist O d)
    (hUOs : dist U O = dist U s)
    (hcOa : dist c O = dist c a) :
    False := by
  let T : ℝ² → ℝ² := normSim U O
  have hdist (X Y : ℝ²) :
      dist (T X) (T Y) = (dist U O)⁻¹ * dist X Y := by
    simpa [T] using normSim_dist_image U O hUO_ne X Y
  have map_dist_eq {W X Y Z : ℝ²} (h : dist W X = dist Y Z) :
      dist (T W) (T X) = dist (T Y) (T Z) := by
    rw [hdist, hdist, h]
  have hT_U : T U = pt 0 0 := by
    simpa [T] using normSim_fst U O
  have hT_O : T O = pt 1 0 := by
    simpa [T] using normSim_snd U O hUO_ne
  have hbase_sq_pos : 0 < (O 0 - U 0) ^ 2 + (O 1 - U 1) ^ 2 := by
    rw [← dist_sq_coord O U]
    exact sq_pos_of_pos (dist_pos.mpr hUO_ne.symm)
  let k : ℝ := ((O 0 - U 0) ^ 2 + (O 1 - U 1) ^ 2)⁻¹
  have hk : 0 < k := inv_pos.mpr hbase_sq_pos
  have map_area (X Y Z : ℝ²) :
      signedArea2 (T X) (T Y) (T Z) = k * signedArea2 X Y Z := by
    simpa [T, k] using signedArea2_normSim U O hUO_ne X Y Z
  have map_area_pos {X Y Z : ℝ²} (h : 0 < signedArea2 X Y Z) :
      0 < signedArea2 (T X) (T Y) (T Z) := by
    rw [map_area]
    exact mul_pos hk h
  have hUa_map : dist (T U) (T a) = dist (T U) (T O) :=
    map_dist_eq hUO_Ua.symm
  have hOa_map : dist (T O) (T a) = dist (T U) (T O) :=
    map_dist_eq hUO_Oa.symm
  have hUa_sq := congrArg (fun x : ℝ ↦ x ^ 2) hUa_map
  have hOa_sq := congrArg (fun x : ℝ ↦ x ^ 2) hOa_map
  change dist (T U) (T a) ^ 2 = dist (T U) (T O) ^ 2 at hUa_sq
  change dist (T O) (T a) ^ 2 = dist (T U) (T O) ^ 2 at hOa_sq
  rw [hT_U, hT_O, dist_sq_coord, dist_sq_coord] at hUa_sq
  rw [hT_O, hT_U, dist_sq_coord, dist_sq_coord] at hOa_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hUa_sq hOa_sq
  have hTa_x : (T a) 0 = 1 / 2 := by
    nlinarith only [hUa_sq, hOa_sq]
  have hTa_y_sq : (T a) 1 ^ 2 = 3 / 4 := by
    nlinarith only [hUa_sq, hTa_x]
  have hTa_area : signedArea2 (T U) (T O) (T a) < 0 := by
    rw [map_area]
    exact mul_neg_of_pos_of_neg hk hUOa
  rw [hT_U, hT_O] at hTa_area
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hTa_area
  have hsqrt_pos : 0 < Real.sqrt 3 / 2 := by positivity
  have hsqrt_sq : (Real.sqrt 3 / 2) ^ 2 = 3 / 4 := by
    rw [div_pow, Real.sq_sqrt (by norm_num)]
    norm_num
  have hTa_y : (T a) 1 = -Real.sqrt 3 / 2 := by
    nlinarith only [hTa_y_sq, hsqrt_sq, hTa_area, hsqrt_pos]
  have hT_a : T a = pt (1 / 2) (-Real.sqrt 3 / 2) := by
    apply PiLp.ext
    intro i
    fin_cases i
    · simpa [pt] using hTa_x
    · simpa [pt] using hTa_y
  apply normalized_euclidean_a_before_s_obstruction (T s) (T d) (T c)
  · simpa only [hT_U, hT_a] using map_area_pos hUas
  · simpa only [hT_a, hT_O] using map_area_pos hasO
  · simpa only [hT_U, hT_a] using map_area_pos hUad
  · simpa only [hT_U, hT_a] using map_area_pos hUac
  · simpa only [hT_a] using map_area_pos hsda
  · simpa only [hT_U] using map_area_pos hdcU
  · simpa only [hT_O, hT_a] using map_dist_eq hOad
  · simpa only [hT_U, hT_O] using map_dist_eq hUOs
  · simpa only [hT_O, hT_a] using map_dist_eq hcOa

/-- A negatively oriented equilateral frame cannot realize the profile-0034
common signed-area and distance core. -/
theorem euclidean_common_obstruction
    (U p s a d c O : ℝ²)
    (hUO_ne : U ≠ O)
    (hUO_Ua : dist U O = dist U a)
    (hUO_Oa : dist U O = dist O a)
    (hUOa : signedArea2 U O a < 0)
    (hUps : 0 < signedArea2 U p s)
    (hUpa : 0 < signedArea2 U p a)
    (hUpc : 0 < signedArea2 U p c)
    (hpsa : 0 < signedArea2 p s a)
    (hads : 0 < signedArea2 a d s)
    (hadc : 0 < signedArea2 a d c)
    (hdcU : 0 < signedArea2 d c U)
    (hOad : dist O a = dist O d)
    (hOap : dist O a = dist O p)
    (hUOs : dist U O = dist U s)
    (hcOa : dist c O = dist c a) :
    False := by
  let T : ℝ² → ℝ² := normSim U O
  have hdist (X Y : ℝ²) :
      dist (T X) (T Y) = (dist U O)⁻¹ * dist X Y := by
    simpa [T] using normSim_dist_image U O hUO_ne X Y
  have map_dist_eq {W X Y Z : ℝ²} (h : dist W X = dist Y Z) :
      dist (T W) (T X) = dist (T Y) (T Z) := by
    rw [hdist, hdist, h]
  have hT_U : T U = pt 0 0 := by
    simpa [T] using normSim_fst U O
  have hT_O : T O = pt 1 0 := by
    simpa [T] using normSim_snd U O hUO_ne
  have hbase_sq_pos : 0 < (O 0 - U 0) ^ 2 + (O 1 - U 1) ^ 2 := by
    rw [← dist_sq_coord O U]
    exact sq_pos_of_pos (dist_pos.mpr hUO_ne.symm)
  let k : ℝ := ((O 0 - U 0) ^ 2 + (O 1 - U 1) ^ 2)⁻¹
  have hk : 0 < k := inv_pos.mpr hbase_sq_pos
  have map_area (X Y Z : ℝ²) :
      signedArea2 (T X) (T Y) (T Z) = k * signedArea2 X Y Z := by
    simpa [T, k] using signedArea2_normSim U O hUO_ne X Y Z
  have map_area_pos {X Y Z : ℝ²} (h : 0 < signedArea2 X Y Z) :
      0 < signedArea2 (T X) (T Y) (T Z) := by
    rw [map_area]
    exact mul_pos hk h
  have hUa_map : dist (T U) (T a) = dist (T U) (T O) :=
    map_dist_eq hUO_Ua.symm
  have hOa_map : dist (T O) (T a) = dist (T U) (T O) :=
    map_dist_eq hUO_Oa.symm
  have hUa_sq := congrArg (fun x : ℝ ↦ x ^ 2) hUa_map
  have hOa_sq := congrArg (fun x : ℝ ↦ x ^ 2) hOa_map
  change dist (T U) (T a) ^ 2 = dist (T U) (T O) ^ 2 at hUa_sq
  change dist (T O) (T a) ^ 2 = dist (T U) (T O) ^ 2 at hOa_sq
  rw [hT_U, hT_O, dist_sq_coord, dist_sq_coord] at hUa_sq
  rw [hT_O, hT_U, dist_sq_coord, dist_sq_coord] at hOa_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hUa_sq hOa_sq
  have hTa_x : (T a) 0 = 1 / 2 := by
    nlinarith only [hUa_sq, hOa_sq]
  have hTa_y_sq : (T a) 1 ^ 2 = 3 / 4 := by
    nlinarith only [hUa_sq, hTa_x]
  have hTa_area : signedArea2 (T U) (T O) (T a) < 0 := by
    rw [map_area]
    exact mul_neg_of_pos_of_neg hk hUOa
  rw [hT_U, hT_O] at hTa_area
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hTa_area
  have hsqrt_pos : 0 < Real.sqrt 3 / 2 := by positivity
  have hsqrt_sq : (Real.sqrt 3 / 2) ^ 2 = 3 / 4 := by
    rw [div_pow, Real.sq_sqrt (by norm_num)]
    norm_num
  have hTa_y : (T a) 1 = -Real.sqrt 3 / 2 := by
    nlinarith only [hTa_y_sq, hsqrt_sq, hTa_area, hsqrt_pos]
  have hT_a : T a = pt (1 / 2) (-Real.sqrt 3 / 2) := by
    apply PiLp.ext
    intro i
    fin_cases i
    · simpa [pt] using hTa_x
    · simpa [pt] using hTa_y
  apply normalized_euclidean_common_obstruction (T p) (T s) (T d) (T c)
  · simpa only [hT_U] using map_area_pos hUps
  · simpa only [hT_U, hT_a] using map_area_pos hUpa
  · simpa only [hT_U] using map_area_pos hUpc
  · simpa only [hT_a] using map_area_pos hpsa
  · simpa only [hT_a] using map_area_pos hads
  · simpa only [hT_a] using map_area_pos hadc
  · simpa only [hT_U] using map_area_pos hdcU
  · simpa only [hT_O, hT_a] using map_dist_eq hOad
  · simpa only [hT_O, hT_a] using map_dist_eq hOap
  · simpa only [hT_U, hT_O] using map_dist_eq hUOs
  · simpa only [hT_O, hT_a] using map_dist_eq hcOa

/-- Orientation-invariant form of `euclidean_common_obstruction`. Each
required turn has sign opposite to the equilateral base orientation. -/
theorem euclidean_common_obstruction_opposedProducts
    (U p s a d c O : ℝ²)
    (hUO_ne : U ≠ O)
    (hUO_Ua : dist U O = dist U a)
    (hUO_Oa : dist U O = dist O a)
    (hUps : signedArea2 U O a * signedArea2 U p s < 0)
    (hUpa : signedArea2 U O a * signedArea2 U p a < 0)
    (hUpc : signedArea2 U O a * signedArea2 U p c < 0)
    (hpsa : signedArea2 U O a * signedArea2 p s a < 0)
    (hads : signedArea2 U O a * signedArea2 a d s < 0)
    (hadc : signedArea2 U O a * signedArea2 a d c < 0)
    (hdcU : signedArea2 U O a * signedArea2 d c U < 0)
    (hOad : dist O a = dist O d)
    (hOap : dist O a = dist O p)
    (hUOs : dist U O = dist U s)
    (hcOa : dist c O = dist c a) :
    False := by
  have hbase_ne : signedArea2 U O a ≠ 0 := by
    intro hzero
    rw [hzero, zero_mul] at hUps
    linarith
  by_cases hbase_neg : signedArea2 U O a < 0
  · have turn_pos {t : ℝ} (h : signedArea2 U O a * t < 0) : 0 < t := by
      rcases mul_neg_iff.mp h with hsign | hsign
      · exact False.elim ((not_lt_of_ge hbase_neg.le) hsign.1)
      · exact hsign.2
    exact euclidean_common_obstruction U p s a d c O
      hUO_ne hUO_Ua hUO_Oa hbase_neg
      (turn_pos hUps) (turn_pos hUpa) (turn_pos hUpc)
      (turn_pos hpsa) (turn_pos hads) (turn_pos hadc) (turn_pos hdcU)
      hOad hOap hUOs hcOa
  · have hbase_pos : 0 < signedArea2 U O a :=
      lt_of_le_of_ne (le_of_not_gt hbase_neg) hbase_ne.symm
    have turn_neg {t : ℝ} (h : signedArea2 U O a * t < 0) : t < 0 := by
      rcases mul_neg_iff.mp h with hsign | hsign
      · exact hsign.2
      · exact False.elim ((not_lt_of_ge hbase_pos.le) hsign.1)
    have map_turn {X Y Z : ℝ²} (h : signedArea2 X Y Z < 0) :
        0 < signedArea2 (reflectXAxis X) (reflectXAxis Y) (reflectXAxis Z) := by
      rw [signedArea2_reflectXAxis]
      linarith
    apply euclidean_common_obstruction
      (reflectXAxis U) (reflectXAxis p) (reflectXAxis s)
      (reflectXAxis a) (reflectXAxis d) (reflectXAxis c) (reflectXAxis O)
    · exact fun h => hUO_ne (reflectXAxis_injective h)
    · simpa only [dist_reflectXAxis] using hUO_Ua
    · simpa only [dist_reflectXAxis] using hUO_Oa
    · rw [signedArea2_reflectXAxis]
      linarith
    · exact map_turn (turn_neg hUps)
    · exact map_turn (turn_neg hUpa)
    · exact map_turn (turn_neg hUpc)
    · exact map_turn (turn_neg hpsa)
    · exact map_turn (turn_neg hads)
    · exact map_turn (turn_neg hadc)
    · exact map_turn (turn_neg hdcU)
    · simpa only [dist_reflectXAxis] using hOad
    · simpa only [dist_reflectXAxis] using hOap
    · simpa only [dist_reflectXAxis] using hUOs
    · simpa only [dist_reflectXAxis] using hcOa

/-- Orientation-independent form of the swapped profile-0034 obstruction.
Each required turn has sign opposite to the equilateral base orientation. -/
theorem euclidean_a_before_s_obstruction_opposedProducts
    (U a s d c O : ℝ²)
    (hUO_ne : U ≠ O)
    (hUO_Ua : dist U O = dist U a)
    (hUO_Oa : dist U O = dist O a)
    (hUas : signedArea2 U O a * signedArea2 U a s < 0)
    (hasO : signedArea2 U O a * signedArea2 a s O < 0)
    (hUad : signedArea2 U O a * signedArea2 U a d < 0)
    (hUac : signedArea2 U O a * signedArea2 U a c < 0)
    (hsda : signedArea2 U O a * signedArea2 s d a < 0)
    (hdcU : signedArea2 U O a * signedArea2 d c U < 0)
    (hOad : dist O a = dist O d)
    (hUOs : dist U O = dist U s)
    (hcOa : dist c O = dist c a) :
    False := by
  have hbase_ne : signedArea2 U O a ≠ 0 := by
    intro hzero
    rw [hzero, zero_mul] at hUas
    linarith
  by_cases hbase_neg : signedArea2 U O a < 0
  · have turn_pos {t : ℝ} (h : signedArea2 U O a * t < 0) : 0 < t := by
      rcases mul_neg_iff.mp h with hsign | hsign
      · exact False.elim ((not_lt_of_ge hbase_neg.le) hsign.1)
      · exact hsign.2
    exact euclidean_a_before_s_obstruction U a s d c O
      hUO_ne hUO_Ua hUO_Oa hbase_neg
      (turn_pos hUas) (turn_pos hasO) (turn_pos hUad)
      (turn_pos hUac) (turn_pos hsda) (turn_pos hdcU)
      hOad hUOs hcOa
  · have hbase_pos : 0 < signedArea2 U O a :=
      lt_of_le_of_ne (le_of_not_gt hbase_neg) hbase_ne.symm
    have turn_neg {t : ℝ} (h : signedArea2 U O a * t < 0) : t < 0 := by
      rcases mul_neg_iff.mp h with hsign | hsign
      · exact hsign.2
      · exact False.elim ((not_lt_of_ge hbase_pos.le) hsign.1)
    have map_turn {X Y Z : ℝ²} (h : signedArea2 X Y Z < 0) :
        0 < signedArea2 (reflectXAxis X) (reflectXAxis Y) (reflectXAxis Z) := by
      rw [signedArea2_reflectXAxis]
      linarith
    apply euclidean_a_before_s_obstruction
      (reflectXAxis U) (reflectXAxis a) (reflectXAxis s)
      (reflectXAxis d) (reflectXAxis c) (reflectXAxis O)
    · exact fun h => hUO_ne (reflectXAxis_injective h)
    · simpa only [dist_reflectXAxis] using hUO_Ua
    · simpa only [dist_reflectXAxis] using hUO_Oa
    · rw [signedArea2_reflectXAxis]
      linarith
    · exact map_turn (turn_neg hUas)
    · exact map_turn (turn_neg hasO)
    · exact map_turn (turn_neg hUad)
    · exact map_turn (turn_neg hUac)
    · exact map_turn (turn_neg hsda)
    · exact map_turn (turn_neg hdcU)
    · simpa only [dist_reflectXAxis] using hOad
    · simpa only [dist_reflectXAxis] using hUOs
    · simpa only [dist_reflectXAxis] using hcOa

/-- Six increasing positions on a convex boundary cannot carry the swapped
profile-0034 metric pattern in the order `U<a<s<d<c<O`. -/
theorem boundaryOrder_a_before_s_obstruction
    {n : ℕ} (boundary : Fin n → ℝ²)
    (hinj : Function.Injective boundary)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (iU ia is id ic iO : Fin n)
    (hUa : iU < ia) (has : ia < is) (hsd : is < id)
    (hdc : id < ic) (hcO : ic < iO)
    (hUO_Ua : dist (boundary iU) (boundary iO) =
      dist (boundary iU) (boundary ia))
    (hUO_Oa : dist (boundary iU) (boundary iO) =
      dist (boundary iO) (boundary ia))
    (hOad : dist (boundary iO) (boundary ia) =
      dist (boundary iO) (boundary id))
    (hUOs : dist (boundary iU) (boundary iO) =
      dist (boundary iU) (boundary is))
    (hcOa : dist (boundary ic) (boundary iO) =
      dist (boundary ic) (boundary ia)) :
    False := by
  have hUiO : iU < iO :=
    lt_trans hUa (lt_trans has (lt_trans hsd (lt_trans hdc hcO)))
  have hUis : iU < is := lt_trans hUa has
  have hUid : iU < id := lt_trans hUis hsd
  have hUic : iU < ic := lt_trans hUid hdc
  have hiaO : ia < iO := lt_trans has (lt_trans hsd (lt_trans hdc hcO))
  have hisO : is < iO := lt_trans hsd (lt_trans hdc hcO)
  have cyclic_area (X Y Z : ℝ²) :
      signedArea2 X Y Z = signedArea2 Y Z X := by
    simp only [signedArea2]
    ring
  have swap_last (X Y Z : ℝ²) :
      signedArea2 X Z Y = -signedArea2 X Y Z := by
    simp only [signedArea2]
    ring
  have hUaO : signedArea2 (boundary iU) (boundary ia) (boundary iO) < 0 :=
    hneg_of_ccw hinj hccw hUa hiaO
  have hbase :
      0 < signedArea2 (boundary iU) (boundary iO) (boundary ia) := by
    rw [swap_last]
    linarith
  have hUas : signedArea2 (boundary iU) (boundary ia) (boundary is) < 0 :=
    hneg_of_ccw hinj hccw hUa has
  have hasO : signedArea2 (boundary ia) (boundary is) (boundary iO) < 0 :=
    hneg_of_ccw hinj hccw has hisO
  have hUad : signedArea2 (boundary iU) (boundary ia) (boundary id) < 0 :=
    hneg_of_ccw hinj hccw hUa (lt_trans has hsd)
  have hUac : signedArea2 (boundary iU) (boundary ia) (boundary ic) < 0 :=
    hneg_of_ccw hinj hccw hUa (lt_trans (lt_trans has hsd) hdc)
  have hasd : signedArea2 (boundary ia) (boundary is) (boundary id) < 0 :=
    hneg_of_ccw hinj hccw has hsd
  have hsda : signedArea2 (boundary is) (boundary id) (boundary ia) < 0 := by
    rw [← cyclic_area]
    exact hasd
  have hUdc : signedArea2 (boundary iU) (boundary id) (boundary ic) < 0 :=
    hneg_of_ccw hinj hccw hUid hdc
  have hdcU : signedArea2 (boundary id) (boundary ic) (boundary iU) < 0 := by
    rw [← cyclic_area]
    exact hUdc
  exact euclidean_a_before_s_obstruction_opposedProducts
    (boundary iU) (boundary ia) (boundary is) (boundary id)
    (boundary ic) (boundary iO)
    (hinj.ne (ne_of_lt hUiO)) hUO_Ua hUO_Oa
    (mul_neg_of_pos_of_neg hbase hUas)
    (mul_neg_of_pos_of_neg hbase hasO)
    (mul_neg_of_pos_of_neg hbase hUad)
    (mul_neg_of_pos_of_neg hbase hUac)
    (mul_neg_of_pos_of_neg hbase hsda)
    (mul_neg_of_pos_of_neg hbase hdcU)
    hOad hUOs hcOa

/-- Seven increasing positions on a convex boundary cannot carry the common
profile-0034 metric pattern in the order `U,p,s,a,d,c,O`. -/
theorem boundaryOrder_common_obstruction
    {n : ℕ} (boundary : Fin n → ℝ²)
    (hinj : Function.Injective boundary)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (iU ip is ia id ic iO : Fin n)
    (hUp : iU < ip) (hps : ip < is) (hsa : is < ia)
    (had : ia < id) (hdc : id < ic) (hcO : ic < iO)
    (hUO_Ua : dist (boundary iU) (boundary iO) =
      dist (boundary iU) (boundary ia))
    (hUO_Oa : dist (boundary iU) (boundary iO) =
      dist (boundary iO) (boundary ia))
    (hOad : dist (boundary iO) (boundary ia) =
      dist (boundary iO) (boundary id))
    (hOap : dist (boundary iO) (boundary ia) =
      dist (boundary iO) (boundary ip))
    (hUOs : dist (boundary iU) (boundary iO) =
      dist (boundary iU) (boundary is))
    (hcOa : dist (boundary ic) (boundary iO) =
      dist (boundary ic) (boundary ia)) :
    False := by
  have hUiO : iU < iO := lt_trans hUp (lt_trans hps
    (lt_trans hsa (lt_trans had (lt_trans hdc hcO))))
  have hUia : iU < ia := lt_trans hUp (lt_trans hps hsa)
  have hUis : iU < is := lt_trans hUp hps
  have hUip : iU < ip := hUp
  have hipa : ip < ia := lt_trans hps hsa
  have hipc : ip < ic := lt_trans hps (lt_trans hsa (lt_trans had hdc))
  have hisd : is < id := lt_trans hsa had
  have hiaO : ia < iO := lt_trans had (lt_trans hdc hcO)
  have cyclic_area (X Y Z : ℝ²) :
      signedArea2 X Y Z = signedArea2 Y Z X := by
    simp only [signedArea2]
    ring
  have swap_last (X Y Z : ℝ²) :
      signedArea2 X Z Y = -signedArea2 X Y Z := by
    simp only [signedArea2]
    ring
  have hUaO : signedArea2 (boundary iU) (boundary ia) (boundary iO) < 0 :=
    hneg_of_ccw hinj hccw hUia hiaO
  have hbase : 0 < signedArea2 (boundary iU) (boundary iO) (boundary ia) := by
    rw [swap_last]
    linarith
  have hUps : signedArea2 (boundary iU) (boundary ip) (boundary is) < 0 :=
    hneg_of_ccw hinj hccw hUip hps
  have hUpa : signedArea2 (boundary iU) (boundary ip) (boundary ia) < 0 :=
    hneg_of_ccw hinj hccw hUip hipa
  have hUpc : signedArea2 (boundary iU) (boundary ip) (boundary ic) < 0 :=
    hneg_of_ccw hinj hccw hUip hipc
  have hpsa : signedArea2 (boundary ip) (boundary is) (boundary ia) < 0 :=
    hneg_of_ccw hinj hccw hps hsa
  have hsad : signedArea2 (boundary is) (boundary ia) (boundary id) < 0 :=
    hneg_of_ccw hinj hccw hsa had
  have hads : signedArea2 (boundary ia) (boundary id) (boundary is) < 0 := by
    rw [← cyclic_area]
    exact hsad
  have hadc : signedArea2 (boundary ia) (boundary id) (boundary ic) < 0 :=
    hneg_of_ccw hinj hccw had hdc
  have hUdc : signedArea2 (boundary iU) (boundary id) (boundary ic) < 0 :=
    hneg_of_ccw hinj hccw (lt_trans hUia had) hdc
  have hdcU : signedArea2 (boundary id) (boundary ic) (boundary iU) < 0 := by
    rw [← cyclic_area]
    exact hUdc
  exact euclidean_common_obstruction_opposedProducts
    (boundary iU) (boundary ip) (boundary is) (boundary ia)
    (boundary id) (boundary ic) (boundary iO)
    (hinj.ne (ne_of_lt hUiO)) hUO_Ua hUO_Oa
    (mul_neg_of_pos_of_neg hbase hUps)
    (mul_neg_of_pos_of_neg hbase hUpa)
    (mul_neg_of_pos_of_neg hbase hUpc)
    (mul_neg_of_pos_of_neg hbase hpsa)
    (mul_neg_of_pos_of_neg hbase hads)
    (mul_neg_of_pos_of_neg hbase hadc)
    (mul_neg_of_pos_of_neg hbase hdcU)
    hOad hOap hUOs hcOa

/-- Six increasing positions on a convex boundary cannot carry the swapped
profile-0034 metric pattern in the reversed order `U<O<c<d<s<a`. -/
theorem boundaryOrder_a_before_s_obstruction_reversed
    {n : ℕ} (boundary : Fin n → ℝ²)
    (hinj : Function.Injective boundary)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (iU iO ic id is ia : Fin n)
    (hUO : iU < iO) (hOc : iO < ic) (hcd : ic < id)
    (hds : id < is) (hsa : is < ia)
    (hUO_Ua : dist (boundary iU) (boundary iO) =
      dist (boundary iU) (boundary ia))
    (hUO_Oa : dist (boundary iU) (boundary iO) =
      dist (boundary iO) (boundary ia))
    (hOad : dist (boundary iO) (boundary ia) =
      dist (boundary iO) (boundary id))
    (hUOs : dist (boundary iU) (boundary iO) =
      dist (boundary iU) (boundary is))
    (hcOa : dist (boundary ic) (boundary iO) =
      dist (boundary ic) (boundary ia)) :
    False := by
  have hOa : iO < ia := lt_trans hOc (lt_trans hcd (lt_trans hds hsa))
  have hUa : iU < ia := lt_trans hUO hOa
  have hUs : iU < is := lt_trans hUO (lt_trans hOc (lt_trans hcd hds))
  have hUd : iU < id := lt_trans hUO (lt_trans hOc hcd)
  have hUc : iU < ic := lt_trans hUO hOc
  have hda : id < ia := lt_trans hds hsa
  have cyclic_area (X Y Z : ℝ²) :
      signedArea2 X Y Z = signedArea2 Y Z X := by
    simp only [signedArea2]
    ring
  have swap_last (X Y Z : ℝ²) :
      signedArea2 X Z Y = -signedArea2 X Y Z := by
    simp only [signedArea2]
    ring
  have hbase : signedArea2 (boundary iU) (boundary iO) (boundary ia) < 0 :=
    hneg_of_ccw hinj hccw hUO hOa
  have hUsa : signedArea2 (boundary iU) (boundary is) (boundary ia) < 0 :=
    hneg_of_ccw hinj hccw hUs hsa
  have hUas : 0 < signedArea2 (boundary iU) (boundary ia) (boundary is) := by
    rw [swap_last]
    linarith
  have hOsa : signedArea2 (boundary iO) (boundary is) (boundary ia) < 0 :=
    hneg_of_ccw hinj hccw (lt_trans hOc (lt_trans hcd hds)) hsa
  have haOs : signedArea2 (boundary ia) (boundary iO) (boundary is) < 0 := by
    rw [cyclic_area]
    exact hOsa
  have hasO : 0 < signedArea2 (boundary ia) (boundary is) (boundary iO) := by
    rw [swap_last]
    linarith
  have hUda : signedArea2 (boundary iU) (boundary id) (boundary ia) < 0 :=
    hneg_of_ccw hinj hccw hUd hda
  have hUad : 0 < signedArea2 (boundary iU) (boundary ia) (boundary id) := by
    rw [swap_last]
    linarith
  have hUca : signedArea2 (boundary iU) (boundary ic) (boundary ia) < 0 :=
    hneg_of_ccw hinj hccw hUc (lt_trans hcd hda)
  have hUac : 0 < signedArea2 (boundary iU) (boundary ia) (boundary ic) := by
    rw [swap_last]
    linarith
  have hdsa : signedArea2 (boundary id) (boundary is) (boundary ia) < 0 :=
    hneg_of_ccw hinj hccw hds hsa
  have hsad : signedArea2 (boundary is) (boundary ia) (boundary id) < 0 := by
    rw [← cyclic_area]
    exact hdsa
  have hsda : 0 < signedArea2 (boundary is) (boundary id) (boundary ia) := by
    rw [swap_last]
    linarith
  have hUcd : signedArea2 (boundary iU) (boundary ic) (boundary id) < 0 :=
    hneg_of_ccw hinj hccw hUc hcd
  have hdUc : signedArea2 (boundary id) (boundary iU) (boundary ic) < 0 := by
    rw [cyclic_area]
    exact hUcd
  have hdcU : 0 < signedArea2 (boundary id) (boundary ic) (boundary iU) := by
    rw [swap_last]
    linarith
  exact euclidean_a_before_s_obstruction_opposedProducts
    (boundary iU) (boundary ia) (boundary is) (boundary id)
    (boundary ic) (boundary iO)
    (hinj.ne (ne_of_lt hUO)) hUO_Ua hUO_Oa
    (mul_neg_of_neg_of_pos hbase hUas)
    (mul_neg_of_neg_of_pos hbase hasO)
    (mul_neg_of_neg_of_pos hbase hUad)
    (mul_neg_of_neg_of_pos hbase hUac)
    (mul_neg_of_neg_of_pos hbase hsda)
    (mul_neg_of_neg_of_pos hbase hdcU)
    hOad hUOs hcOa

/-- Seven increasing positions on a convex boundary cannot carry the common
profile-0034 metric pattern in the reversed order `U<O<c<d<a<s<p`. -/
theorem boundaryOrder_common_obstruction_reversed
    {n : ℕ} (boundary : Fin n → ℝ²)
    (hinj : Function.Injective boundary)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (iU iO ic id ia is ip : Fin n)
    (hUO : iU < iO) (hOc : iO < ic) (hcd : ic < id)
    (hda : id < ia) (has : ia < is) (hsp : is < ip)
    (hUO_Ua : dist (boundary iU) (boundary iO) =
      dist (boundary iU) (boundary ia))
    (hUO_Oa : dist (boundary iU) (boundary iO) =
      dist (boundary iO) (boundary ia))
    (hOad : dist (boundary iO) (boundary ia) =
      dist (boundary iO) (boundary id))
    (hOap : dist (boundary iO) (boundary ia) =
      dist (boundary iO) (boundary ip))
    (hUOs : dist (boundary iU) (boundary iO) =
      dist (boundary iU) (boundary is))
    (hcOa : dist (boundary ic) (boundary iO) =
      dist (boundary ic) (boundary ia)) :
    False := by
  have hOa : iO < ia := lt_trans hOc (lt_trans hcd hda)
  have hUa : iU < ia := lt_trans hUO hOa
  have hUs : iU < is := lt_trans hUa has
  have hUp : iU < ip := lt_trans hUs hsp
  have hUc : iU < ic := lt_trans hUO hOc
  have hUd : iU < id := lt_trans hUc hcd
  have hdp : id < ip := lt_trans hda (lt_trans has hsp)
  have hcp : ic < ip := lt_trans hcd hdp
  have cyclic_area (X Y Z : ℝ²) :
      signedArea2 X Y Z = signedArea2 Y Z X := by
    simp only [signedArea2]
    ring
  have swap_last (X Y Z : ℝ²) :
      signedArea2 X Z Y = -signedArea2 X Y Z := by
    simp only [signedArea2]
    ring
  have hbase : signedArea2 (boundary iU) (boundary iO) (boundary ia) < 0 :=
    hneg_of_ccw hinj hccw hUO hOa
  have hUsp : signedArea2 (boundary iU) (boundary is) (boundary ip) < 0 :=
    hneg_of_ccw hinj hccw hUs hsp
  have hUps : 0 < signedArea2 (boundary iU) (boundary ip) (boundary is) := by
    rw [swap_last]
    linarith
  have hUap : signedArea2 (boundary iU) (boundary ia) (boundary ip) < 0 :=
    hneg_of_ccw hinj hccw hUa (lt_trans has hsp)
  have hUpa : 0 < signedArea2 (boundary iU) (boundary ip) (boundary ia) := by
    rw [swap_last]
    linarith
  have hUcp : signedArea2 (boundary iU) (boundary ic) (boundary ip) < 0 :=
    hneg_of_ccw hinj hccw hUc hcp
  have hUpc : 0 < signedArea2 (boundary iU) (boundary ip) (boundary ic) := by
    rw [swap_last]
    linarith
  have hasp : signedArea2 (boundary ia) (boundary is) (boundary ip) < 0 :=
    hneg_of_ccw hinj hccw has hsp
  have hpas : signedArea2 (boundary ip) (boundary ia) (boundary is) < 0 := by
    rw [cyclic_area]
    exact hasp
  have hpsa : 0 < signedArea2 (boundary ip) (boundary is) (boundary ia) := by
    rw [swap_last]
    linarith
  have hdas : signedArea2 (boundary id) (boundary ia) (boundary is) < 0 :=
    hneg_of_ccw hinj hccw hda has
  have hasd : signedArea2 (boundary ia) (boundary is) (boundary id) < 0 := by
    rw [← cyclic_area]
    exact hdas
  have hads : 0 < signedArea2 (boundary ia) (boundary id) (boundary is) := by
    rw [swap_last]
    linarith
  have hcda : signedArea2 (boundary ic) (boundary id) (boundary ia) < 0 :=
    hneg_of_ccw hinj hccw hcd hda
  have hacd : signedArea2 (boundary ia) (boundary ic) (boundary id) < 0 := by
    rw [cyclic_area]
    exact hcda
  have hadc : 0 < signedArea2 (boundary ia) (boundary id) (boundary ic) := by
    rw [swap_last]
    linarith
  have hUcd : signedArea2 (boundary iU) (boundary ic) (boundary id) < 0 :=
    hneg_of_ccw hinj hccw hUc hcd
  have hdUc : signedArea2 (boundary id) (boundary iU) (boundary ic) < 0 := by
    rw [cyclic_area]
    exact hUcd
  have hdcU : 0 < signedArea2 (boundary id) (boundary ic) (boundary iU) := by
    rw [swap_last]
    linarith
  exact euclidean_common_obstruction_opposedProducts
    (boundary iU) (boundary ip) (boundary is) (boundary ia)
    (boundary id) (boundary ic) (boundary iO)
    (hinj.ne (ne_of_lt hUO)) hUO_Ua hUO_Oa
    (mul_neg_of_neg_of_pos hbase hUps)
    (mul_neg_of_neg_of_pos hbase hUpa)
    (mul_neg_of_neg_of_pos hbase hUpc)
    (mul_neg_of_neg_of_pos hbase hpsa)
    (mul_neg_of_neg_of_pos hbase hads)
    (mul_neg_of_neg_of_pos hbase hadc)
    (mul_neg_of_neg_of_pos hbase hdcU)
    hOad hOap hUOs hcOa

end Profile0034
end EqualityCore
end Census554
end Problem97
