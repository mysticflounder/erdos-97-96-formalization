import Mathlib

/-!
Scalar kernel extracted from the first ATAIL-FORCE three-center order-fan
UNSAT proposal.  The hypotheses are the conservative deletion core emitted by
`order_fan_minimize.py`; no geometric source adapter is claimed here.
-/

namespace Problem97.ATAILForceScratch

theorem orderFanKernel
    (v1x v1y s1x s1y s2x s2y q2x q2y ru2 rv2 rw2 : ℝ)
    (heq2 : -rv2 + v1x ^ 2 + v1y ^ 2 = 0)
    (heq3 : -ru2 + v1x ^ 2 + v1y ^ 2 = 0)
    (heq4 : -ru2 + v1x ^ 2 - 2 * v1x + v1y ^ 2 + 1 = 0)
    (heq5 :
      -ru2 + s1x ^ 2 - 2 * s1x * v1x + s1y ^ 2 - 2 * s1y * v1y +
          v1x ^ 2 + v1y ^ 2 = 0)
    (heq6 : -rv2 + s1x ^ 2 + s1y ^ 2 = 0)
    (heq7 :
      -ru2 + s2x ^ 2 - 2 * s2x * v1x + s2y ^ 2 - 2 * s2y * v1y +
          v1x ^ 2 + v1y ^ 2 = 0)
    (heq8 : -rw2 + s2x ^ 2 - 2 * s2x + s2y ^ 2 + 1 = 0)
    (heq13 : q2x ^ 2 - 2 * q2x + q2y ^ 2 - rw2 + 1 = 0)
    (hge6 : 0 ≤ v1x ^ 2 - v1x + v1y ^ 2)
    (hgt6 : 0 < s1x * v1y ^ 2 - s1y * v1x * v1y)
    (hgt8 :
      0 < -s2x * v1y ^ 2 + s2y * v1x * v1y - s2y * v1y + v1y ^ 2)
    (hgt9 : 0 < s2x * v1y ^ 2 - s2y * v1x * v1y)
    (hgt21 : 0 < -q2x * v1y ^ 2 + q2y * v1x * v1y)
    (hfan0 : 0 < s1x * s2y - s1y * s2x)
    (hfan4 : 0 < s1x * v1y - s1y * v1x) :
    False := by
  have hv1x : v1x = 1 / 2 := by
    nlinarith [heq3, heq4]
  have hv1y_pos : 0 < v1y := by
    have hprod : 0 < v1y * (s1x * v1y - s1y * v1x) := by
      nlinarith [hgt6]
    exact (mul_pos_iff.mp hprod).resolve_right (by
      intro hneg
      nlinarith [hfan4]) |>.1
  let d2 : ℝ := v1x ^ 2 + v1y ^ 2
  let n1 : ℝ := s1x ^ 2 + s1y ^ 2
  let n2 : ℝ := s2x ^ 2 + s2y ^ 2
  let r1 : ℝ := (s1x - 1) ^ 2 + s1y ^ 2
  let r2 : ℝ := (s2x - 1) ^ 2 + s2y ^ 2
  let rq : ℝ := (q2x - 1) ^ 2 + q2y ^ 2
  have hd2_pos : 0 < d2 := by
    dsimp [d2]
    nlinarith [sq_nonneg v1x, sq_pos_of_pos hv1y_pos]
  have hd2_eq : d2 = v1y ^ 2 + 1 / 4 := by
    dsimp [d2]
    rw [hv1x]
    ring
  have hnonobtuse : 1 / 4 ≤ v1y ^ 2 := by
    rw [hv1x] at hge6
    norm_num at hge6 ⊢
    linarith

  have hcircle1 :
      s1x ^ 2 + s1y ^ 2 - s1x - 2 * v1y * s1y = 0 := by
    rw [hv1x] at heq5 heq3
    linear_combination heq5 - heq3
  have hcircle2 :
      s2x ^ 2 + s2y ^ 2 - s2x - 2 * v1y * s2y = 0 := by
    rw [hv1x] at heq7 heq3
    linear_combination heq7 - heq3
  have hn1_eq : n1 = d2 := by
    dsimp [n1, d2]
    linear_combination heq6 - heq2

  have hs2y_neg : s2y < 0 := by
    by_contra hnot
    have hs2y_nonneg : 0 ≤ s2y := le_of_not_gt hnot
    have hleft : 0 < v1y * s2x - s2y / 2 := by
      rw [hv1x] at hgt9
      have : 0 < v1y * (s2x * v1y - s2y / 2) := by
        have hreorder :
            v1y * (s2x * v1y - s2y / 2) =
              s2x * v1y ^ 2 - s2y * (1 / 2) * v1y := by
          ring
        rw [hreorder]
        exact hgt9
      have hinner := pos_of_mul_pos_right this hv1y_pos.le
      simpa [mul_comm] using hinner
    have hright : 0 < v1y * (1 - s2x) - s2y / 2 := by
      rw [hv1x] at hgt8
      have : 0 < v1y * (v1y * (1 - s2x) - s2y / 2) := by
        have hreorder :
            v1y * (v1y * (1 - s2x) - s2y / 2) =
              -s2x * v1y ^ 2 + s2y * (1 / 2) * v1y -
                s2y * v1y + v1y ^ 2 := by
          ring
        rw [hreorder]
        exact hgt8
      exact pos_of_mul_pos_right this hv1y_pos.le
    have hs2x_pos : 0 < s2x := by
      have hhalf : 0 ≤ s2y / 2 := div_nonneg hs2y_nonneg (by norm_num)
      have hys2x : 0 < v1y * s2x := by linarith only [hleft, hhalf]
      exact pos_of_mul_pos_right hys2x hv1y_pos.le
    have hs2x_lt : s2x < 1 := by
      have hhalf : 0 ≤ s2y / 2 := div_nonneg hs2y_nonneg (by norm_num)
      have hyrest : 0 < v1y * (1 - s2x) := by linarith only [hright, hhalf]
      have := pos_of_mul_pos_right hyrest hv1y_pos.le
      linarith only [this]
    have hs2y_lt : s2y < v1y := by
      linarith only [hleft, hright]
    have hxpart : s2x ^ 2 - s2x < 0 := by
      nlinarith only [mul_pos hs2x_pos (sub_pos.mpr hs2x_lt)]
    have hypart : s2y ^ 2 - 2 * v1y * s2y ≤ 0 := by
      nlinarith only [mul_nonneg hs2y_nonneg (sub_nonneg.mpr hs2y_lt.le)]
    linarith only [hcircle2, hxpart, hypart]
  have hs2x_pos : 0 < s2x := by
    have hprod : 0 < s2x * (1 - s2x) := by
      nlinarith only [hcircle2, sq_nonneg s2y,
        mul_pos hv1y_pos (neg_pos.mpr hs2y_neg)]
    rcases mul_pos_iff.mp hprod with h | h
    · exact h.1
    · linarith only [h.1, h.2]

  have hs1y_neg : s1y < 0 := by
    by_contra hnot
    have hs1y_nonneg : 0 ≤ s1y := le_of_not_gt hnot
    have hs1x_pos : 0 < s1x := by
      rw [hv1x] at hfan4
      have hhalf : 0 ≤ s1y / 2 := div_nonneg hs1y_nonneg (by norm_num)
      have hys1x : 0 < v1y * s1x := by
        nlinarith only [hfan4, hhalf]
      exact pos_of_mul_pos_right hys1x hv1y_pos.le
    have hfirst : s1x * s2y < 0 := mul_neg_of_pos_of_neg hs1x_pos hs2y_neg
    have hsecond : 0 ≤ s1y * s2x := mul_nonneg hs1y_nonneg hs2x_pos.le
    linarith only [hfan0, hfirst, hsecond]
  have hs1x_pos : 0 < s1x := by
    have hprod : 0 < s1x * (1 - s1x) := by
      nlinarith only [hcircle1, sq_nonneg s1y,
        mul_pos hv1y_pos (neg_pos.mpr hs1y_neg)]
    rcases mul_pos_iff.mp hprod with h | h
    · exact h.1
    · linarith only [h.1, h.2]

  have hn1_pos : 0 < n1 := by
    dsimp [n1]
    nlinarith only [sq_pos_of_pos hs1x_pos, sq_nonneg s1y]
  have hn2_pos : 0 < n2 := by
    dsimp [n2]
    nlinarith only [sq_pos_of_pos hs2x_pos, sq_nonneg s2y]
  have hangular : s2y ^ 2 * n1 < s1y ^ 2 * n2 := by
    have hA_pos : 0 < -s1y * s2x := mul_pos (neg_pos.mpr hs1y_neg) hs2x_pos
    have hB_pos : 0 < -s2y * s1x := mul_pos (neg_pos.mpr hs2y_neg) hs1x_pos
    have hBA : -s2y * s1x < -s1y * s2x := by
      linarith only [hfan0]
    have hsq := mul_self_lt_mul_self hB_pos.le hBA
    dsimp [n1, n2]
    nlinarith only [hsq]

  have hchord1 : r1 * n1 = 4 * d2 * s1y ^ 2 := by
    have hid :
        r1 * n1 - 4 * d2 * s1y ^ 2 =
          (s1x ^ 2 + s1y ^ 2 - s1x - 2 * v1y * s1y) *
            (s1x ^ 2 - s1x + s1y ^ 2 + 2 * v1y * s1y) := by
      dsimp [r1, n1, d2]
      rw [hv1x]
      ring
    rw [hcircle1, zero_mul] at hid
    linarith
  have hchord2 : r2 * n2 = 4 * d2 * s2y ^ 2 := by
    have hid :
        r2 * n2 - 4 * d2 * s2y ^ 2 =
          (s2x ^ 2 + s2y ^ 2 - s2x - 2 * v1y * s2y) *
            (s2x ^ 2 - s2x + s2y ^ 2 + 2 * v1y * s2y) := by
      dsimp [r2, n2, d2]
      rw [hv1x]
      ring
    rw [hcircle2, zero_mul] at hid
    linarith
  have hr2_lt_r1 : r2 < r1 := by
    have hfrac : s2y ^ 2 / n2 < s1y ^ 2 / n1 :=
      (div_lt_div_iff₀ hn2_pos hn1_pos).2 hangular
    have hscaled := mul_lt_mul_of_pos_left hfrac
      (mul_pos (show (0 : ℝ) < 4 by norm_num) hd2_pos)
    have hr1div : r1 = 4 * d2 * (s1y ^ 2 / n1) := by
      calc
        r1 = (4 * d2 * s1y ^ 2) / n1 :=
          (eq_div_iff hn1_pos.ne').2 hchord1
        _ = 4 * d2 * (s1y ^ 2 / n1) := by ring
    have hr2div : r2 = 4 * d2 * (s2y ^ 2 / n2) := by
      calc
        r2 = (4 * d2 * s2y ^ 2) / n2 :=
          (eq_div_iff hn2_pos.ne').2 hchord2
        _ = 4 * d2 * (s2y ^ 2 / n2) := by ring
    rw [hr1div, hr2div]
    simpa [mul_assoc] using hscaled

  have hr1_formula : r1 = 3 / 4 - v1y ^ 2 + 4 * v1y * s1y := by
    dsimp [r1, n1, d2] at hn1_eq
    dsimp [r1]
    rw [hv1x] at hn1_eq
    nlinarith only [hn1_eq, hcircle1]
  have hr1_bound : r1 < 3 / 4 - v1y ^ 2 := by
    rw [hr1_formula]
    have hneg : v1y * s1y < 0 := mul_neg_of_pos_of_neg hv1y_pos hs1y_neg
    linarith only [hneg]
  have hframe_bound : d2 * (3 / 4 - v1y ^ 2) ≤ v1y ^ 2 := by
    have hfactor :
        0 ≤ (v1y ^ 2 - 1 / 4) * (v1y ^ 2 + 3 / 4) :=
      mul_nonneg (sub_nonneg.mpr hnonobtuse) (by positivity)
    rw [hd2_eq]
    nlinarith only [hfactor]
  have hr2_upper : d2 * r2 < v1y ^ 2 := by
    have hr1_upper : d2 * r1 < v1y ^ 2 :=
      lt_of_lt_of_le (mul_lt_mul_of_pos_left hr1_bound hd2_pos) hframe_bound
    have hmul := mul_lt_mul_of_pos_left hr2_lt_r1 hd2_pos
    linarith only [hmul, hr1_upper]

  have hqside : 0 < v1x * q2y - v1y * q2x := by
    have hprod : 0 < v1y * (v1x * q2y - v1y * q2x) := by
      have hreorder :
          v1y * (v1x * q2y - v1y * q2x) =
            -q2x * v1y ^ 2 + q2y * v1x * v1y := by
        ring
      rw [hreorder]
      exact hgt21
    exact pos_of_mul_pos_right hprod hv1y_pos.le
  have hcrossQ :
      v1y < v1x * q2y - v1y * (q2x - 1) := by
    linarith only [hqside]
  have hcrossQ_sq :
      v1y ^ 2 < (v1x * q2y - v1y * (q2x - 1)) ^ 2 :=
    (sq_lt_sq₀ hv1y_pos.le (by linarith only [hcrossQ, hv1y_pos])).2 hcrossQ
  have hcauchy :
      (v1x * q2y - v1y * (q2x - 1)) ^ 2 ≤ d2 * rq := by
    have hid :
        d2 * rq =
          (v1x * (q2x - 1) + v1y * q2y) ^ 2 +
          (v1x * q2y - v1y * (q2x - 1)) ^ 2 := by
      dsimp [d2, rq]
      ring
    rw [hid]
    nlinarith only [sq_nonneg (v1x * (q2x - 1) + v1y * q2y)]
  have hrq_lower : v1y ^ 2 < d2 * rq := lt_of_lt_of_le hcrossQ_sq hcauchy
  have hrq_eq_r2 : rq = r2 := by
    dsimp [rq, r2]
    linear_combination heq13 - heq8
  rw [hrq_eq_r2] at hrq_lower
  linarith only [hrq_lower, hr2_upper]

end Problem97.ATAILForceScratch
