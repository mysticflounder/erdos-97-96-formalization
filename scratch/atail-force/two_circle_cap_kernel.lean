import Mathlib

/-!
Order-free scalar kernel extracted from ATAIL class 2422.  The hypotheses are
the conservative deletion core emitted by `m6_base_minimize.py`; no live-leaf
or full-filter adapter is claimed here.
-/

namespace Problem97.ATAILForceScratch

set_option maxHeartbeats 800000 in
theorem twoCircleCapKernel
    (v1x v1y p2x p2y q2x q2y ru2 rv2 rw2 : ℝ)
    (heq2 : -rv2 + v1x ^ 2 + v1y ^ 2 = 0)
    (heq3 : 1 - rw2 = 0)
    (heq4 : -ru2 + v1x ^ 2 - 2 * v1x + v1y ^ 2 + 1 = 0)
    (heq5 : 1 - rv2 = 0)
    (heq9 : p2x ^ 2 + p2y ^ 2 - rv2 = 0)
    (heq10 : p2x ^ 2 - 2 * p2x + p2y ^ 2 - rw2 + 1 = 0)
    (heq12 :
      q2x ^ 2 - 2 * q2x * v1x + q2y ^ 2 - 2 * q2y * v1y -
        ru2 + v1x ^ 2 + v1y ^ 2 = 0)
    (heq13 : q2x ^ 2 - 2 * q2x + q2y ^ 2 - rw2 + 1 = 0)
    (hgt14 :
      0 < p2x * v1y ^ 2 - p2y * v1x * v1y +
        p2y * v1y - v1y ^ 2)
    (hgt19 : 0 < q2y * v1y)
    (hgt20 :
      0 < -q2x * v1y ^ 2 + q2y * v1x * v1y -
        q2y * v1y + v1y ^ 2) :
    False := by
  have hp2x : p2x = 1 / 2 := by
    nlinarith [heq3, heq5, heq9, heq10]
  have hp2y_sq : p2y ^ 2 = 3 / 4 := by
    rw [hp2x] at heq9
    nlinarith [heq5]
  have hv1y_ne : v1y ≠ 0 := by
    intro hy
    rw [hy, mul_zero] at hgt19
    linarith
  have hv1y_sq_pos : 0 < v1y ^ 2 := sq_pos_of_ne_zero hv1y_ne
  have hx_lt : v1x < 1 / 2 := by
    have hcap : v1y ^ 2 / 2 < v1y * ((1 - v1x) * p2y) := by
      rw [hp2x] at hgt14
      nlinarith [hgt14]
    have hcap_pos : 0 < v1y * ((1 - v1x) * p2y) := by
      linarith [hv1y_sq_pos]
    have hsq := mul_self_lt_mul_self
      (show 0 ≤ v1y ^ 2 / 2 by positivity) hcap
    have hfactor :
        0 < v1y ^ 2 *
          ((1 - v1x) ^ 2 * p2y ^ 2 - v1y ^ 2 / 4) := by
      have hdiff := sub_pos.mpr hsq
      have hreorder :
          v1y * ((1 - v1x) * p2y) *
                (v1y * ((1 - v1x) * p2y)) -
              v1y ^ 2 / 2 * (v1y ^ 2 / 2) =
            v1y ^ 2 *
              ((1 - v1x) ^ 2 * p2y ^ 2 - v1y ^ 2 / 4) := by
        ring
      rw [← hreorder]
      exact hdiff
    have hinner :
        0 < (1 - v1x) ^ 2 * p2y ^ 2 - v1y ^ 2 / 4 :=
      pos_of_mul_pos_right hfactor hv1y_sq_pos.le
    by_contra hx_not
    have hx_ge : 1 / 2 ≤ v1x := le_of_not_gt hx_not
    have hx_le_one : v1x ≤ 1 := by
      nlinarith [heq2, heq5, sq_nonneg v1y]
    have hprod : 0 ≤ (v1x - 1 / 2) * (1 - v1x) :=
      mul_nonneg (sub_nonneg.mpr hx_ge) (sub_nonneg.mpr hx_le_one)
    nlinarith [heq2, heq5, hp2y_sq, hinner, hprod]

  have hx_gt : 1 / 2 < v1x := by
    by_contra hx_not
    have hx_le : v1x ≤ 1 / 2 := le_of_not_gt hx_not
    let a : ℝ := 1 - v1x
    let b : ℝ := 1 - q2x
    let t : ℝ := q2y * v1y
    have ha_ge : 1 / 2 ≤ a := by
      dsimp [a]
      linarith
    have ha_pos : 0 < a := lt_of_lt_of_le (by norm_num) ha_ge
    have ht_pos : 0 < t := by
      simpa [t] using hgt19
    have ht_alt : t = a * q2x + v1x - 1 / 2 := by
      dsimp [a, t]
      nlinarith [heq3, heq4, heq12, heq13]
    have ht_formula : t = 1 / 2 - a * b := by
      rw [ht_alt]
      dsimp [a, b]
      ring
    have haq_pos : 0 < a * q2x := by
      linarith only [ht_alt, ht_pos, hx_le]
    have hq2x_pos : 0 < q2x :=
      pos_of_mul_pos_right haq_pos ha_pos.le
    have hb_lt_one : b < 1 := by
      dsimp [b]
      linarith only [hq2x_pos]
    have hcap : 0 < b * v1y ^ 2 - a * t := by
      have hreorder :
          b * v1y ^ 2 - a * t =
            -q2x * v1y ^ 2 + q2y * v1x * v1y -
              q2y * v1y + v1y ^ 2 := by
        dsimp [a, b, t]
        ring
      rw [hreorder]
      exact hgt20
    have hb_pos : 0 < b := by
      by_contra hb_not
      have hb_nonpos : b ≤ 0 := le_of_not_gt hb_not
      have hleft_nonpos : b * v1y ^ 2 ≤ 0 :=
        mul_nonpos_of_nonpos_of_nonneg hb_nonpos (sq_nonneg v1y)
      have hright_pos : 0 < a * t := mul_pos ha_pos ht_pos
      linarith only [hcap, hleft_nonpos, hright_pos]
    have hqcircle : q2y ^ 2 = 1 - b ^ 2 := by
      dsimp [b]
      nlinarith only [heq3, heq13]
    have hq2y_ne : q2y ≠ 0 := by
      intro hq
      have hzero : q2y * v1y = 0 := by rw [hq, zero_mul]
      linarith only [hgt19, hzero]
    have hq2y_sq_pos : 0 < q2y ^ 2 := sq_pos_of_ne_zero hq2y_ne
    have hcap_lt : a * t < b * v1y ^ 2 := by linarith only [hcap]
    have hmul := mul_lt_mul_of_pos_right hcap_lt hq2y_sq_pos
    have ht_sq : t ^ 2 = q2y ^ 2 * v1y ^ 2 := by
      dsimp [t]
      ring
    have hscaled : t * (a * q2y ^ 2) < t * (b * t) := by
      calc
        t * (a * q2y ^ 2) = (a * t) * q2y ^ 2 := by ring
        _ < (b * v1y ^ 2) * q2y ^ 2 := hmul
        _ = b * (q2y ^ 2 * v1y ^ 2) := by ring
        _ = b * t ^ 2 := by rw [ht_sq]
        _ = t * (b * t) := by ring
    have hcancel : a * q2y ^ 2 < b * t := by
      by_contra hnot
      have hreverse : b * t ≤ a * q2y ^ 2 := le_of_not_gt hnot
      have hscaled_reverse :=
        mul_le_mul_of_nonneg_left hreverse ht_pos.le
      exact (not_lt_of_ge hscaled_reverse) hscaled
    have hab : 2 * a < b := by
      rw [hqcircle, ht_formula] at hcancel
      nlinarith
    nlinarith [ha_ge, hb_lt_one, hab]
  linarith

end Problem97.ATAILForceScratch
