/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CirclePowerMatrix
import Erdos9796Proof.P97.Moser.NonDeg
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Lifted determinants of exact critical circle classes

The paraboloid lift of four planar points has determinant equal to a signed
area times the fourth point's power with respect to any circle through the
first three points.  Consequently:

* four points on one exact critical shell give a zero determinant; and
* three points on the shell together with an omitted carrier point give a
  nonzero determinant.

The second statement is the geometric bridge used by the seven-source Paley
obstruction: it turns full-shell nonmembership into a Cramer minor known to be
nonzero.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCriticalShellLift

open Census554.CirclePowerMatrix

/-- The four-column paraboloid-lift matrix of planar points. -/
def liftedFour (a b c d : ℝ²) : Matrix (Fin 4) (Fin 4) ℝ :=
  !![sqNorm a, sqNorm b, sqNorm c, sqNorm d;
     a 0, b 0, c 0, d 0;
     a 1, b 1, c 1, d 1;
     1, 1, 1, 1]

/-- The coordinate squared distance used by `power` is Euclidean distance
squared. -/
theorem sqDist_eq_dist_sq (x y : ℝ²) :
    sqDist x y = dist x y ^ 2 := by
  rw [Problem97.dist_sq_coord]
  rfl

/-- A point at distance `r` from `center` has zero power for squared radius
`r ^ 2`. -/
theorem power_eq_zero_of_dist_eq
    (center z : ℝ²) (r : ℝ) (h : dist center z = r) :
    power center (r ^ 2) z = 0 := by
  rw [power, sqDist_eq_dist_sq, dist_comm, h]
  ring

/-- For positive `r`, failure of the distance equality gives nonzero power. -/
theorem power_ne_zero_of_dist_ne
    (center z : ℝ²) (r : ℝ) (hr : 0 < r)
    (h : dist center z ≠ r) :
    power center (r ^ 2) z ≠ 0 := by
  rw [power, sqDist_eq_dist_sq, dist_comm]
  intro hz
  apply h
  nlinarith [dist_nonneg (x := center) (y := z),
    sq_nonneg (dist center z + r)]

/-- Expanding the lifted determinant along the power row factors it into
signed area and the fourth point's circle power. -/
theorem det_liftedFour_eq_neg_signedArea2_mul_power
    (center a b c d : ℝ²) (radiusSq : ℝ)
    (ha : power center radiusSq a = 0)
    (hb : power center radiusSq b = 0)
    (hc : power center radiusSq c = 0) :
    (liftedFour a b c d).det =
      -signedArea2 a b c * power center radiusSq d := by
  have hrow :
      (liftedFour a b c d).det =
        (Matrix.det !![
          power center radiusSq a, power center radiusSq b,
            power center radiusSq c, power center radiusSq d;
          a 0, b 0, c 0, d 0;
          a 1, b 1, c 1, d 1;
          1, 1, 1, 1]) := by
    rw [Matrix.det_succ_row_zero, Matrix.det_succ_row_zero]
    simp [Fin.sum_univ_succ, Matrix.det_fin_three, Fin.succAbove,
      liftedFour, power, sqDist, sqNorm]
    ring
  rw [hrow, ha, hb, hc]
  rw [Matrix.det_succ_row_zero]
  simp [Fin.sum_univ_succ, Matrix.det_fin_three, Fin.succAbove,
    signedArea2]
  ring

/-- Four points on one critical full shell have dependent paraboloid lifts. -/
theorem det_liftedFour_eq_zero_of_mem_support
    {A : Finset ℝ²} {q center a b c d : ℝ²}
    (K : CriticalFourShell A q center)
    (ha : a ∈ K.support) (hb : b ∈ K.support)
    (hc : c ∈ K.support) (hd : d ∈ K.support) :
    (liftedFour a b c d).det = 0 := by
  rw [det_liftedFour_eq_neg_signedArea2_mul_power center a b c d
    (K.radius ^ 2)
    (power_eq_zero_of_dist_eq center a K.radius
      (K.support_eq_radius a ha))
    (power_eq_zero_of_dist_eq center b K.radius
      (K.support_eq_radius b hb))
    (power_eq_zero_of_dist_eq center c K.radius
      (K.support_eq_radius c hc)),
    power_eq_zero_of_dist_eq center d K.radius
      (K.support_eq_radius d hd), mul_zero]

/-- Three distinct points on an exact critical shell and one omitted ambient
carrier point have independent paraboloid lifts. -/
theorem det_liftedFour_ne_zero_of_three_mem_one_not_mem
    {A : Finset ℝ²} {q center a b c d : ℝ²}
    (K : CriticalFourShell A q center)
    (ha : a ∈ K.support) (hb : b ∈ K.support)
    (hc : c ∈ K.support)
    (hdA : d ∈ A) (hd : d ∉ K.support)
    (hab : a ≠ b) (hbc : b ≠ c) (hac : a ≠ c) :
    (liftedFour a b c d).det ≠ 0 := by
  have hpa := power_eq_zero_of_dist_eq center a K.radius
    (K.support_eq_radius a ha)
  have hpb := power_eq_zero_of_dist_eq center b K.radius
    (K.support_eq_radius b hb)
  have hpc := power_eq_zero_of_dist_eq center c K.radius
    (K.support_eq_radius c hc)
  rw [det_liftedFour_eq_neg_signedArea2_mul_power center a b c d
    (K.radius ^ 2) hpa hpb hpc]
  apply mul_ne_zero
  · exact neg_ne_zero.mpr (MEC.signedArea2_ne_zero_of_three_dist_eq
      (by simpa [dist_comm] using K.support_eq_radius a ha)
      (by simpa [dist_comm] using K.support_eq_radius b hb)
      (by simpa [dist_comm] using K.support_eq_radius c hc)
      hab hbc hac)
  · exact power_ne_zero_of_dist_ne center d K.radius K.radius_pos
      (K.dist_ne_radius_of_mem_A_not_mem_support hdA hd)

end ATailCriticalShellLift
end Problem97
