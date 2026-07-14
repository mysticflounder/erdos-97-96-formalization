/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Analysis.Real.Pi.Bounds
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Bounds

/-!
# Three-circle lower-intersection scalar core

Let `x`, `y`, and `z` be the three half-angle gaps cut out by two points on
the minor arc of an equilateral unit circle.  Thus `x + y + z = pi / 6`.
The three lower circle-intersection inequalities used by the five-row
circle-intersection obstruction are

* `|1 - 2 sin x| <= 2 sin y` (the point-5 circle pair),
* `|1 - 2 sin x| <= 2 sin x` (the point-6 circle pair), and
* `|1 - 2 sin (y + z)| <= 2 sin z` (the point-9 circle pair).

They are already incompatible.  The proof uses only `sin t <= t` for
nonnegative `t`: the three inequalities respectively force
`x + y >= 1/2`, `x >= 1/4`, and `y + 2*z >= 1/2`.  Adding gives
`5/4 <= 2*(x+y+z) = pi/3`, contradicting `pi < 3.15`.

This file is a solver-free, kernel-checked scalar consumer.  It does not by
itself prove that live MEC/order data supplies the two arc parameters.
-/

namespace Problem97
namespace Census554
namespace CircleIntersectionInequalityCore

/-- Any common lower bound for the three numerical gate margins is strictly
below `-4/25`.  The reference optimizer value near `-0.17017` is therefore on
the correct side of a rigorous, solver-free `-0.16` upper bound. -/
theorem common_gate_margin_lt_neg_four_twentyfive
    {x y z tau : ℝ}
    (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z)
    (hsum : x + y + z = Real.pi / 6)
    (h5 : tau ≤ 2 * Real.sin x + 2 * Real.sin y - 1)
    (h6 : tau ≤ 4 * Real.sin x - 1)
    (h9 : tau ≤ 2 * Real.sin (y + z) + 2 * Real.sin z - 1) :
    tau < -(4 / 25 : ℝ) := by
  have hsinX : Real.sin x ≤ x := Real.sin_le hx
  have hsinY : Real.sin y ≤ y := Real.sin_le hy
  have hsinZ : Real.sin z ≤ z := Real.sin_le hz
  have hsinYZ : Real.sin (y + z) ≤ y + z :=
    Real.sin_le (add_nonneg hy hz)
  have hPi := Real.pi_lt_d2
  linarith

/-- The exact lower-chord scalar obstruction behind the numerical
circle-intersection margin.  This is the weakest form needed from the three triangle
inequalities. -/
theorem lower_chord_margins_incompatible
    {x y z : ℝ}
    (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z)
    (hsum : x + y + z = Real.pi / 6)
    (h5 : 1 - 2 * Real.sin x ≤ 2 * Real.sin y)
    (h6 : 1 - 2 * Real.sin x ≤ 2 * Real.sin x)
    (h9 : 1 - 2 * Real.sin (y + z) ≤ 2 * Real.sin z) : False := by
  have hsinX : Real.sin x ≤ x := Real.sin_le hx
  have hsinY : Real.sin y ≤ y := Real.sin_le hy
  have hsinZ : Real.sin z ≤ z := Real.sin_le hz
  have hsinYZ : Real.sin (y + z) ≤ y + z :=
    Real.sin_le (add_nonneg hy hz)
  have hPi := Real.pi_lt_d2
  linarith

/-- Absolute-difference circle-intersection form of
`lower_chord_margins_incompatible`. -/
theorem lower_circle_intersection_inequalities_incompatible
    {x y z : ℝ}
    (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z)
    (hsum : x + y + z = Real.pi / 6)
    (h5 : |1 - 2 * Real.sin x| ≤ 2 * Real.sin y)
    (h6 : |1 - 2 * Real.sin x| ≤ 2 * Real.sin x)
    (h9 : |1 - 2 * Real.sin (y + z)| ≤ 2 * Real.sin z) : False := by
  apply lower_chord_margins_incompatible hx hy hz hsum
  · exact (le_abs_self (1 - 2 * Real.sin x)).trans h5
  · exact (le_abs_self (1 - 2 * Real.sin x)).trans h6
  · exact (le_abs_self (1 - 2 * Real.sin (y + z))).trans h9

/-- Angle-parameter form with exactly the three one-sided lower chord
margins supplied by triangle inequalities. -/
theorem angle_lower_chord_margins_incompatible
    {a b : ℝ}
    (ha : 0 ≤ a) (hab : a ≤ b) (hb : b ≤ Real.pi / 3)
    (h5 : 1 - 2 * Real.sin (a / 2) ≤
      2 * Real.sin ((b - a) / 2))
    (h6 : 1 - 2 * Real.sin (a / 2) ≤ 2 * Real.sin (a / 2))
    (h9 : 1 - 2 * Real.sin ((Real.pi / 3 - a) / 2) ≤
      2 * Real.sin ((Real.pi / 3 - b) / 2)) : False := by
  let x := a / 2
  let y := (b - a) / 2
  let z := (Real.pi / 3 - b) / 2
  apply lower_chord_margins_incompatible (x := x) (y := y) (z := z)
  · dsimp [x]
    linarith
  · dsimp [y]
    linarith
  · dsimp [z]
    linarith
  · dsimp [x, y, z]
    ring
  · simpa [x, y] using h5
  · simpa [x] using h6
  · have hyz : y + z = (Real.pi / 3 - a) / 2 := by
      dsimp [y, z]
      ring
    rw [hyz]
    simpa [z] using h9

/-- Angle-parameter form used by the five-row geometry lift.  Here `a` and `b` are
the unit-circle angles of labels 3 and 4, so the three half-angle gaps are
`a/2`, `(b-a)/2`, and `(pi/3-b)/2`. -/
theorem angle_lower_circle_intersection_inequalities_incompatible
    {a b : ℝ}
    (ha : 0 ≤ a) (hab : a ≤ b) (hb : b ≤ Real.pi / 3)
    (h5 : |1 - 2 * Real.sin (a / 2)| ≤
      2 * Real.sin ((b - a) / 2))
    (h6 : |1 - 2 * Real.sin (a / 2)| ≤ 2 * Real.sin (a / 2))
    (h9 : |1 - 2 * Real.sin ((Real.pi / 3 - a) / 2)| ≤
      2 * Real.sin ((Real.pi / 3 - b) / 2)) : False := by
  apply angle_lower_chord_margins_incompatible ha hab hb
  · exact (le_abs_self (1 - 2 * Real.sin (a / 2))).trans h5
  · exact (le_abs_self (1 - 2 * Real.sin (a / 2))).trans h6
  · exact
      (le_abs_self (1 - 2 * Real.sin ((Real.pi / 3 - a) / 2))).trans h9

end CircleIntersectionInequalityCore
end Census554
end Problem97
