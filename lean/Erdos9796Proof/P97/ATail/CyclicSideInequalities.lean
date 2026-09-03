/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Foundation

/-!
# Three cyclic side inequalities force an equilateral triangle

Let `a, b, c` be the side lengths of a triangle inscribed in its
circumcircle.  A cap-index computation (see the closure plan for the
geometry) turns the question "does this class circle meet the
circumcircle's closed disk?" into the polynomial condition

  `a ^ 2 * b ≤ c * (a ^ 2 + b ^ 2 - c ^ 2)`,

which is the law of cosines applied to `2 * c * cos γ ≥ a`.  The cyclic
radius assignment imposes this condition together with its two images
under `a ↦ b ↦ c ↦ a`.

This file proves that the three conditions together force `a = b = c`.
The mechanism is an exact sum-of-squares identity: writing

  `x = b² + c² - a²`,  `y = c² + a² - b²`,  `z = a² + b² - c²`

(so `y + z = 2a²`, `z + x = 2b²`, `x + y = 2c²`), the product of the three
conditions says `8 * (x * y * z)` dominates `(x + y) * (y + z) * (z + x)`,
while `prod_add_sub_eight_mul_prod_eq` writes that difference as a sum of
three squares with `x, y, z` themselves as weights.  So each square
vanishes and the triangle is equilateral.  This is the equality case of
`cos α * cos β * cos γ ≤ 1/8`, in a form a machine checks by `ring`.

Nothing here is geometric: both statements are inequalities over `ℝ`.
-/

namespace Problem97

/-- **Sum-of-squares identity.**  The gap in the three-factor
arithmetic-geometric mean inequality `8 * x * y * z ≤ (x+y) * (y+z) * (z+x)`
is a sum of three squares weighted by the variables themselves.  For
nonnegative `x, y, z` this both proves the inequality and identifies its
equality case. -/
theorem prod_add_sub_eight_mul_prod_eq (x y z : ℝ) :
    (x + y) * (y + z) * (z + x) - 8 * (x * y * z)
      = x * (y - z) ^ 2 + y * (z - x) ^ 2 + z * (x - y) ^ 2 := by
  ring

/-- **Three cyclic side inequalities force an equilateral triangle.**

Each hypothesis is the in-disk condition for one slot of the cyclic radius
assignment, stated in side lengths.  Positivity of `b² + c² - a²`,
`c² + a² - b²` and `a² + b² - c²` is *not* assumed: it follows from the
hypotheses, since each right-hand side dominates a positive left-hand
side.  So the conclusion needs no separate non-obtuse hypothesis. -/
theorem eq_of_cyclic_side_inequalities
    {a b c : ℝ} (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (h1 : a ^ 2 * b ≤ c * (a ^ 2 + b ^ 2 - c ^ 2))
    (h2 : b ^ 2 * c ≤ a * (b ^ 2 + c ^ 2 - a ^ 2))
    (h3 : c ^ 2 * a ≤ b * (c ^ 2 + a ^ 2 - b ^ 2)) :
    a = b ∧ b = c := by
  -- Each bracket is positive: it dominates a positive quantity.
  have hx : 0 < b ^ 2 + c ^ 2 - a ^ 2 := by
    nlinarith [h2, mul_pos (mul_pos hb hb) hc]
  have hy : 0 < c ^ 2 + a ^ 2 - b ^ 2 := by
    nlinarith [h3, mul_pos (mul_pos hc hc) ha]
  have hz : 0 < a ^ 2 + b ^ 2 - c ^ 2 := by
    nlinarith [h1, mul_pos (mul_pos ha ha) hb]
  have habc : 0 < a * b * c := by positivity
  -- Multiply the three hypotheses; every factor is positive.
  have h12 : a ^ 2 * b * (b ^ 2 * c)
      ≤ c * (a ^ 2 + b ^ 2 - c ^ 2) * (a * (b ^ 2 + c ^ 2 - a ^ 2)) :=
    mul_le_mul h1 h2 (by positivity) (by positivity)
  have hprod : a ^ 2 * b * (b ^ 2 * c) * (c ^ 2 * a)
      ≤ c * (a ^ 2 + b ^ 2 - c ^ 2) * (a * (b ^ 2 + c ^ 2 - a ^ 2))
          * (b * (c ^ 2 + a ^ 2 - b ^ 2)) :=
    mul_le_mul h12 h3 (by positivity) (by positivity)
  -- Both sides carry the factor `a * b * c`; cancel it.
  have hcancel : a * b * c * (a ^ 2 * b ^ 2 * c ^ 2)
      ≤ a * b * c * ((b ^ 2 + c ^ 2 - a ^ 2)
          * ((c ^ 2 + a ^ 2 - b ^ 2) * (a ^ 2 + b ^ 2 - c ^ 2))) := by
    calc a * b * c * (a ^ 2 * b ^ 2 * c ^ 2)
        = a ^ 2 * b * (b ^ 2 * c) * (c ^ 2 * a) := by ring
      _ ≤ c * (a ^ 2 + b ^ 2 - c ^ 2) * (a * (b ^ 2 + c ^ 2 - a ^ 2))
            * (b * (c ^ 2 + a ^ 2 - b ^ 2)) := hprod
      _ = a * b * c * ((b ^ 2 + c ^ 2 - a ^ 2)
            * ((c ^ 2 + a ^ 2 - b ^ 2) * (a ^ 2 + b ^ 2 - c ^ 2))) := by ring
  have hkey : a ^ 2 * b ^ 2 * c ^ 2
      ≤ (b ^ 2 + c ^ 2 - a ^ 2)
          * ((c ^ 2 + a ^ 2 - b ^ 2) * (a ^ 2 + b ^ 2 - c ^ 2)) :=
    le_of_mul_le_mul_left hcancel habc
  -- The sum-of-squares identity turns that into three vanishing squares.
  have hsos :
      (b ^ 2 + c ^ 2 - a ^ 2)
          * ((c ^ 2 + a ^ 2 - b ^ 2) - (a ^ 2 + b ^ 2 - c ^ 2)) ^ 2
        + (c ^ 2 + a ^ 2 - b ^ 2)
          * ((a ^ 2 + b ^ 2 - c ^ 2) - (b ^ 2 + c ^ 2 - a ^ 2)) ^ 2
        + (a ^ 2 + b ^ 2 - c ^ 2)
          * ((b ^ 2 + c ^ 2 - a ^ 2) - (c ^ 2 + a ^ 2 - b ^ 2)) ^ 2 ≤ 0 := by
    have hid :
        (b ^ 2 + c ^ 2 - a ^ 2)
            * ((c ^ 2 + a ^ 2 - b ^ 2) - (a ^ 2 + b ^ 2 - c ^ 2)) ^ 2
          + (c ^ 2 + a ^ 2 - b ^ 2)
            * ((a ^ 2 + b ^ 2 - c ^ 2) - (b ^ 2 + c ^ 2 - a ^ 2)) ^ 2
          + (a ^ 2 + b ^ 2 - c ^ 2)
            * ((b ^ 2 + c ^ 2 - a ^ 2) - (c ^ 2 + a ^ 2 - b ^ 2)) ^ 2
        = 8 * (a ^ 2 * b ^ 2 * c ^ 2)
            - 8 * ((b ^ 2 + c ^ 2 - a ^ 2)
                * ((c ^ 2 + a ^ 2 - b ^ 2) * (a ^ 2 + b ^ 2 - c ^ 2))) := by
      ring
    rw [hid]
    linarith
  have t1 : 0 ≤ (b ^ 2 + c ^ 2 - a ^ 2)
      * ((c ^ 2 + a ^ 2 - b ^ 2) - (a ^ 2 + b ^ 2 - c ^ 2)) ^ 2 := by positivity
  have t2 : 0 ≤ (c ^ 2 + a ^ 2 - b ^ 2)
      * ((a ^ 2 + b ^ 2 - c ^ 2) - (b ^ 2 + c ^ 2 - a ^ 2)) ^ 2 := by positivity
  have t3 : 0 ≤ (a ^ 2 + b ^ 2 - c ^ 2)
      * ((b ^ 2 + c ^ 2 - a ^ 2) - (c ^ 2 + a ^ 2 - b ^ 2)) ^ 2 := by positivity
  have e2 : (c ^ 2 + a ^ 2 - b ^ 2)
      * ((a ^ 2 + b ^ 2 - c ^ 2) - (b ^ 2 + c ^ 2 - a ^ 2)) ^ 2 = 0 := by linarith
  have e3 : (a ^ 2 + b ^ 2 - c ^ 2)
      * ((b ^ 2 + c ^ 2 - a ^ 2) - (c ^ 2 + a ^ 2 - b ^ 2)) ^ 2 = 0 := by linarith
  -- The weights are positive, so the squares themselves vanish.
  have s2 : ((a ^ 2 + b ^ 2 - c ^ 2) - (b ^ 2 + c ^ 2 - a ^ 2)) = 0 := by
    rcases mul_eq_zero.mp e2 with h | h
    · exact absurd h (ne_of_gt hy)
    · exact pow_eq_zero_iff (two_ne_zero) |>.mp h
  have s3 : ((b ^ 2 + c ^ 2 - a ^ 2) - (c ^ 2 + a ^ 2 - b ^ 2)) = 0 := by
    rcases mul_eq_zero.mp e3 with h | h
    · exact absurd h (ne_of_gt hz)
    · exact pow_eq_zero_iff (two_ne_zero) |>.mp h
  have hac : a ^ 2 = c ^ 2 := by linarith
  have hab : a ^ 2 = b ^ 2 := by linarith
  refine ⟨?_, ?_⟩
  · have hfac : (a - b) * (a + b) = 0 := by
      have h : (a - b) * (a + b) = a ^ 2 - b ^ 2 := by ring
      rw [h, hab]; ring
    rcases mul_eq_zero.mp hfac with h | h
    · linarith
    · linarith
  · have hbc : b ^ 2 = c ^ 2 := by linarith
    have hfac : (b - c) * (b + c) = 0 := by
      have h : (b - c) * (b + c) = b ^ 2 - c ^ 2 := by ring
      rw [h, hbc]; ring
    rcases mul_eq_zero.mp hfac with h | h
    · linarith
    · linarith

end Problem97
