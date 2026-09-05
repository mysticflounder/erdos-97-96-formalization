/-
Exact-five circle-power continuation, 2026-09-05.
Complete scalar proof-script candidate; NOT elaborated in this environment.
The source-facing cap normalization and global exact-five contradiction are
NOT asserted by this file.
-/
import Mathlib

namespace ExactFiveCirclePowerScalar

/-- Subtracting the equations of two circles with centers on the horizontal axis. -/
theorem circle_power_identity (h u v x y : ℝ) :
    x ^ 2 + y ^ 2 - (u ^ 2 + v ^ 2) -
      ((x - h) ^ 2 + y ^ 2 - ((u - h) ^ 2 + v ^ 2)) =
      2 * h * (x - u) := by
  ring

/-- On the second circle the first-circle power is linear in the chord side. -/
theorem first_power_eq_of_second_circle
    {h u v x y : ℝ}
    (hcircle : (x - h) ^ 2 + y ^ 2 = (u - h) ^ 2 + v ^ 2) :
    x ^ 2 + y ^ 2 - (u ^ 2 + v ^ 2) = 2 * h * (x - u) := by
  nlinarith [circle_power_identity h u v x y]

/-- The side containing the first center lies strictly inside the first circle. -/
theorem first_radius_sq_lt_of_second_circle_of_chord_side
    {h u v x y : ℝ}
    (hh : 0 < h) (hside : x < u)
    (hcircle : (x - h) ^ 2 + y ^ 2 = (u - h) ^ 2 + v ^ 2) :
    x ^ 2 + y ^ 2 < u ^ 2 + v ^ 2 := by
  have hpower := first_power_eq_of_second_circle hcircle
  have hneg : 2 * h * (x - u) < 0 :=
    mul_neg_of_pos_of_neg (by positivity) (sub_neg.mpr hside)
  linarith

/-- The first center lies strictly outside the second disk when the chord
separates the centers and its first-apex angle is acute. -/
theorem first_center_outside_second_disk
    {h u v : ℝ}
    (hu : 0 < u) (huh : u < h) (hacute : v ^ 2 < u ^ 2) :
    (u - h) ^ 2 + v ^ 2 < h ^ 2 := by
  have hproduct : 0 < u * (h - u) :=
    mul_pos hu (sub_pos.mpr huh)
  nlinarith

/-- An isosceles nonacute triangle has either leg strictly shorter than its
nonzero base; used in the minimal admissible-pair guard. -/
theorem leg_lt_base_of_nonacute
    {leg base : ℝ}
    (hleg : 0 ≤ leg) (hbase : 0 < base)
    (hnonacute : 2 * leg ^ 2 ≤ base ^ 2) :
    leg < base := by
  by_contra hnot
  have hge : base ≤ leg := le_of_not_gt hnot
  have hprod : 0 ≤ (leg - base) * (leg + base) :=
    mul_nonneg (sub_nonneg.mpr hge) (by linarith)
  nlinarith [sq_pos_of_pos hbase]

end ExactFiveCirclePowerScalar
