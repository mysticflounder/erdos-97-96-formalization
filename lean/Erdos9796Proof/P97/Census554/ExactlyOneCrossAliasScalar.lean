/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EquilateralThreeFanCollision

/-!
# Scalar obstruction for one crossed three-fan alias

This module records the normalized scalar contradiction for the canonical
six-point order `A < Y < B < D < C < Z` when the crossed alias is `X = D`.
The strict inequalities are the source-neutral order and distinctness data;
the displayed polynomial identities are the normalized equal-distance data.
No boundary enumeration or source adapter is used here.
-/

namespace Problem97
namespace Census554
namespace EqualityCore

/-- The canonical `X = D` crossed-alias scalar configuration is impossible.

Here `D = (0, 0)`, `Z = (1, 0)`, `A = (a, -h)`, `C = (a, h)`, and
`Y = (u, v)`.  The equation `h² = a(2-a)` is the normalized `ZD = ZA`
relation, while `a u - h v = a` is the normalized `YD = YA` relation.
The remaining strict hypotheses are the signed-area/order consequences for
the canonical order `A < Y < B < D < C < Z`.
-/
theorem false_of_threeFan_one_cross_alias_order_scalar
    {a h u v : ℝ}
    (hbase : h ^ 2 = a * (2 - a))
    (hh_pos : 0 < h)
    (ha_lt_one : a < 1)
    (hy_pos : 0 < u)
    (hy_lt_one : u < 1)
    (hy_before_mid : 2 * u < a)
    (hY_eq : a * u - h * v = a)
    (hAYB : 0 < u ^ 2 + v ^ 2 - a) :
    False := by
  have hh_sq_pos : 0 < h ^ 2 := sq_pos_of_pos hh_pos
  have ha_pos : 0 < a := by
    nlinarith [hbase]
  have hy_interval : 0 < u ∧ u < 1 := ⟨hy_pos, hy_lt_one⟩
  have hu_lt_a : u < a := by
    linarith
  have hrel : h * v = a * u - a := by
    linarith
  have hrel_sq : h ^ 2 * v ^ 2 = (a * u - a) ^ 2 := by
    calc
      h ^ 2 * v ^ 2 = (h * v) ^ 2 := by ring
      _ = (a * u - a) ^ 2 := by rw [hrel]
  have hsq_u : h ^ 2 * u ^ 2 = (a * (2 - a)) * u ^ 2 := by
    rw [hbase]
  have hsq_a : a * h ^ 2 = a * (a * (2 - a)) := by
    rw [hbase]
  have hidentity :
      h ^ 2 * (u ^ 2 + v ^ 2 - a) =
        a * (2 * u ^ 2 - 2 * a * u + a ^ 2 - a) := by
    calc
      h ^ 2 * (u ^ 2 + v ^ 2 - a) =
          h ^ 2 * u ^ 2 + h ^ 2 * v ^ 2 - a * h ^ 2 := by ring
      _ = (a * (2 - a)) * u ^ 2 + (a * u - a) ^ 2 -
          a * (a * (2 - a)) := by rw [hsq_u, hrel_sq, hsq_a]
      _ = a * (2 * u ^ 2 - 2 * a * u + a ^ 2 - a) := by ring
  have hscalar_pos :
      0 < a * (2 * u ^ 2 - 2 * a * u + a ^ 2 - a) := by
    rw [← hidentity]
    exact mul_pos hh_sq_pos hAYB
  have hpoly_pos : 0 < 2 * u ^ 2 - 2 * a * u + a ^ 2 - a := by
    rcases mul_pos_iff.mp hscalar_pos with hpos | hneg
    · exact hpos.2
    · exact (not_lt_of_ge (le_of_lt ha_pos) hneg.1).elim
  have hfirst_neg : 2 * u * (u - a) < 0 := by
    exact mul_neg_of_pos_of_neg (mul_pos (by norm_num) hy_interval.1)
      (sub_neg.mpr hu_lt_a)
  have hsecond_neg : a * (a - 1) < 0 := by
    exact mul_neg_of_pos_of_neg ha_pos (sub_neg.mpr ha_lt_one)
  have hpoly_neg : 2 * u ^ 2 - 2 * a * u + a ^ 2 - a < 0 := by
    calc
      2 * u ^ 2 - 2 * a * u + a ^ 2 - a =
          2 * u * (u - a) + a * (a - 1) := by ring
      _ < 0 := add_neg hfirst_neg hsecond_neg
  linarith

end EqualityCore
end Census554
end Problem97
