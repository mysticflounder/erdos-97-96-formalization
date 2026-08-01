/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EquilateralHingeCollisions

/-!
# Orientation dichotomy for an equilateral apex

An apex equidistant from the endpoints of a nondegenerate base is obtained by rotating
the base vector by either `60` or `-60` degrees.  The normalized coordinate theorem is
the direct orientation split of `normSim_equilateralHinge_coordinates`; the final
theorem transports that split back to the original plane.

The result is independent of convexity and uses no finite-pattern assumptions.  It is
the real-to-two-branches bridge needed by exact equilateral-shell certificates.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Counterclockwise rotation through `60` degrees in real coordinates. -/
noncomputable def rotate60 (v : ℝ²) : ℝ² :=
  pt (v 0 / 2 - Real.sqrt 3 * v 1 / 2)
    (Real.sqrt 3 * v 0 / 2 + v 1 / 2)

/-- Clockwise rotation through `60` degrees in real coordinates. -/
noncomputable def rotateNeg60 (v : ℝ²) : ℝ² :=
  pt (v 0 / 2 + Real.sqrt 3 * v 1 / 2)
    (-Real.sqrt 3 * v 0 / 2 + v 1 / 2)

/-- An equilateral apex over normalized anchors is one of the two points with
vertical coordinate `±√3/2`. -/
theorem normSim_equilateralHinge_orientation
    {A B H : ℝ²}
    (hAB : A ≠ B)
    (hAH : dist A B = dist A H)
    (hBH : dist B A = dist B H) :
    normSim A B H = pt (1 / 2) (Real.sqrt 3 / 2) ∨
      normSim A B H = pt (1 / 2) (-Real.sqrt 3 / 2) := by
  have hcoords := normSim_equilateralHinge_coordinates hAB hAH hBH
  have hsqrt : Real.sqrt 3 ^ 2 = (3 : ℝ) := Real.sq_sqrt (by norm_num)
  have hfactor :
      ((normSim A B H) 1 - Real.sqrt 3 / 2) *
          ((normSim A B H) 1 + Real.sqrt 3 / 2) = 0 := by
    nlinarith [hcoords.2, hsqrt]
  rcases mul_eq_zero.mp hfactor with hy | hy
  · left
    have hy' : (normSim A B H) 1 = Real.sqrt 3 / 2 := by linarith
    apply PiLp.ext
    intro i
    fin_cases i
    · simpa [pt] using hcoords.1
    · simpa [pt] using hy'
  · right
    have hy' : (normSim A B H) 1 = -Real.sqrt 3 / 2 := by linarith
    apply PiLp.ext
    intro i
    fin_cases i
    · simpa [pt] using hcoords.1
    · simpa [pt] using hy'

private theorem baseCoordSquare_ne_zero {A B : ℝ²} (hAB : A ≠ B) :
    (B 0 - A 0) ^ 2 + (B 1 - A 1) ^ 2 ≠ 0 := by
  intro hzero
  have hx : B 0 = A 0 := by
    nlinarith [sq_nonneg (B 0 - A 0), sq_nonneg (B 1 - A 1)]
  have hy : B 1 = A 1 := by
    nlinarith [sq_nonneg (B 0 - A 0), sq_nonneg (B 1 - A 1)]
  apply hAB
  apply PiLp.ext
  intro i
  fin_cases i
  · exact hx.symm
  · exact hy.symm

private theorem original_eq_rotate60_of_normSim_eq
    {A B H : ℝ²}
    (hAB : A ≠ B)
    (hnorm : normSim A B H = pt (1 / 2) (Real.sqrt 3 / 2)) :
    H = A + rotate60 (B - A) := by
  have hℓ2 := baseCoordSquare_ne_zero hAB
  have hx := congrArg (fun q : ℝ² ↦ q 0) hnorm
  have hy := congrArg (fun q : ℝ² ↦ q 1) hnorm
  simp only [normSim, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hx hy
  rw [div_eq_iff hℓ2] at hx hy
  have hux_mul :
      (H 0 - A 0) * ((B 0 - A 0) ^ 2 + (B 1 - A 1) ^ 2) =
        (B 0 - A 0) / 2 * ((B 0 - A 0) ^ 2 + (B 1 - A 1) ^ 2) -
          Real.sqrt 3 * (B 1 - A 1) / 2 *
            ((B 0 - A 0) ^ 2 + (B 1 - A 1) ^ 2) := by
    linear_combination (B 0 - A 0) * hx - (B 1 - A 1) * hy
  have huy_mul :
      (H 1 - A 1) * ((B 0 - A 0) ^ 2 + (B 1 - A 1) ^ 2) =
        Real.sqrt 3 * (B 0 - A 0) / 2 *
            ((B 0 - A 0) ^ 2 + (B 1 - A 1) ^ 2) +
          (B 1 - A 1) / 2 * ((B 0 - A 0) ^ 2 + (B 1 - A 1) ^ 2) := by
    linear_combination (B 0 - A 0) * hy + (B 1 - A 1) * hx
  have hux :
      H 0 - A 0 = (B 0 - A 0) / 2 - Real.sqrt 3 * (B 1 - A 1) / 2 := by
    apply mul_right_cancel₀ hℓ2
    nlinarith [hux_mul]
  have huy :
      H 1 - A 1 = Real.sqrt 3 * (B 0 - A 0) / 2 + (B 1 - A 1) / 2 := by
    apply mul_right_cancel₀ hℓ2
    nlinarith [huy_mul]
  apply PiLp.ext
  intro i
  fin_cases i
  · simpa [rotate60, pt] using congrArg (fun x : ℝ ↦ A 0 + x) hux
  · simpa [rotate60, pt] using congrArg (fun x : ℝ ↦ A 1 + x) huy

private theorem original_eq_rotateNeg60_of_normSim_eq
    {A B H : ℝ²}
    (hAB : A ≠ B)
    (hnorm : normSim A B H = pt (1 / 2) (-Real.sqrt 3 / 2)) :
    H = A + rotateNeg60 (B - A) := by
  have hℓ2 := baseCoordSquare_ne_zero hAB
  have hx := congrArg (fun q : ℝ² ↦ q 0) hnorm
  have hy := congrArg (fun q : ℝ² ↦ q 1) hnorm
  simp only [normSim, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hx hy
  rw [div_eq_iff hℓ2] at hx hy
  have hux_mul :
      (H 0 - A 0) * ((B 0 - A 0) ^ 2 + (B 1 - A 1) ^ 2) =
        (B 0 - A 0) / 2 * ((B 0 - A 0) ^ 2 + (B 1 - A 1) ^ 2) +
          Real.sqrt 3 * (B 1 - A 1) / 2 *
            ((B 0 - A 0) ^ 2 + (B 1 - A 1) ^ 2) := by
    linear_combination (B 0 - A 0) * hx - (B 1 - A 1) * hy
  have huy_mul :
      (H 1 - A 1) * ((B 0 - A 0) ^ 2 + (B 1 - A 1) ^ 2) =
        -Real.sqrt 3 * (B 0 - A 0) / 2 *
            ((B 0 - A 0) ^ 2 + (B 1 - A 1) ^ 2) +
          (B 1 - A 1) / 2 * ((B 0 - A 0) ^ 2 + (B 1 - A 1) ^ 2) := by
    linear_combination (B 0 - A 0) * hy + (B 1 - A 1) * hx
  have hux :
      H 0 - A 0 = (B 0 - A 0) / 2 + Real.sqrt 3 * (B 1 - A 1) / 2 := by
    apply mul_right_cancel₀ hℓ2
    nlinarith [hux_mul]
  have huy :
      H 1 - A 1 = -Real.sqrt 3 * (B 0 - A 0) / 2 + (B 1 - A 1) / 2 := by
    apply mul_right_cancel₀ hℓ2
    nlinarith [huy_mul]
  apply PiLp.ext
  intro i
  fin_cases i
  · simpa [rotateNeg60, pt] using congrArg (fun x : ℝ ↦ A 0 + x) hux
  · simpa [rotateNeg60, pt] using congrArg (fun x : ℝ ↦ A 1 + x) huy

/-- Every equilateral apex over a nondegenerate base is obtained by one of the
two rotations of the base vector through `60` degrees. -/
theorem equilateral_apex_eq_rotate60_or_rotateNeg60
    {A B H : ℝ²}
    (hAB : A ≠ B)
    (hAH : dist A B = dist A H)
    (hBH : dist B A = dist B H) :
    H = A + rotate60 (B - A) ∨ H = A + rotateNeg60 (B - A) := by
  rcases normSim_equilateralHinge_orientation hAB hAH hBH with hpos | hneg
  · exact Or.inl (original_eq_rotate60_of_normSim_eq hAB hpos)
  · exact Or.inr (original_eq_rotateNeg60_of_normSim_eq hAB hneg)

end EqualityCore
end Census554
end Problem97
