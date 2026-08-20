/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.Geometry.FivePointCircleIsosceles

/-!
# Cocircular perpendicular-bisector algebra

This module isolates the affine algebra used by the rigid221 bisector route.
The first theorem identifies the direction of a perpendicular bisector from a
point on a circle.  The signed-side theorem is deliberately weaker than a
cocircular statement: the point `z` need not lie on the circle centered at `P`.
-/

open scoped InnerProductSpace

namespace Erdos9796Proof
namespace Geometry

private lemma norm_sq_coord_sub (x y : Plane) :
    ‖x - y‖ ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]

set_option maxHeartbeats 400000 in
-- Coordinate `PiLp` elimination and the two-dimensional nonlinear cancellation
-- need a larger local elaboration budget; no computation or external evidence is used.
/-- A point on the perpendicular bisector of two distinct equal-radius points
is on the line through the centre in the sum direction. -/
theorem exists_bisector_direction
    {P p q z : Plane}
    (hpq : p ≠ q)
    (hP : dist P p = dist P q)
    (hz : dist z p = dist z q)
    (hsum : (p - P) + (q - P) ≠ 0) :
    ∃ t : ℝ, z - P = t • ((p - P) + (q - P)) := by
  let a : Plane := p - P
  let b : Plane := q - P
  let w : Plane := z - P
  let s : Plane := a + b
  let d : Plane := a - b
  have hPcoord :
      (P 0 - p 0) ^ 2 + (P 1 - p 1) ^ 2 =
        (P 0 - q 0) ^ 2 + (P 1 - q 1) ^ 2 := by
    have h := congrArg (fun r : ℝ => r ^ 2) hP
    simpa [dist_eq_norm, norm_sq_coord_sub] using h
  have hzcoord :
      (z 0 - p 0) ^ 2 + (z 1 - p 1) ^ 2 =
        (z 0 - q 0) ^ 2 + (z 1 - q 1) ^ 2 := by
    have h := congrArg (fun r : ℝ => r ^ 2) hz
    simpa [dist_eq_norm, norm_sq_coord_sub] using h
  have habcoord : a 0 ^ 2 + a 1 ^ 2 = b 0 ^ 2 + b 1 ^ 2 := by
    dsimp [a, b]
    nlinarith [hPcoord]
  have horth : w 0 * d 0 + w 1 * d 1 = 0 := by
    dsimp [a, b, w, d]
    nlinarith [hPcoord, hzcoord]
  have hsd : s 0 * d 0 + s 1 * d 1 = 0 := by
    dsimp [s, d]
    nlinarith [habcoord]
  have hd : d ≠ 0 := by
    intro hd
    apply hpq
    dsimp [d, a, b] at hd
    have hsumP := congrArg (fun v : Plane => v + P) hd
    have : p - q = 0 := by simpa [sub_add_cancel] using hsumP
    exact sub_eq_zero.mp this
  have hs : s ≠ 0 := by
    simpa [s, a, b] using hsum
  have hparallel : ∃ t : ℝ, w = t • s := by
    by_cases hs0 : s 0 = 0
    · have hs1 : s 1 ≠ 0 := by
        intro hs1
        apply hs
        apply PiLp.ext
        intro i
        fin_cases i <;> simp [hs0, hs1]
      refine ⟨w 1 / s 1, ?_⟩
      apply PiLp.ext
      intro i
      fin_cases i
      · have hmul : s 1 * d 1 = 0 := by
          simpa [hs0] using hsd
        have hd1 : d 1 = 0 := by
          rcases mul_eq_zero.mp hmul with h | h
          · exact (hs1 h).elim
          · exact h
        have hd0 : d 0 ≠ 0 := by
          intro hd0
          apply hd
          apply PiLp.ext
          intro j
          fin_cases j
          · exact hd0
          · exact hd1
        have hw0 : w 0 = 0 := by
          have hmul : w 0 * d 0 = 0 := by simpa [hd1] using horth
          rcases mul_eq_zero.mp hmul with h | h
          · exact h
          · exact (hd0 h).elim
        change w 0 = (w 1 / s 1) * s 0
        simp [hs0, hw0]
      · change w 1 = (w 1 / s 1) * s 1
        field_simp [hs1]
    · refine ⟨w 0 / s 0, ?_⟩
      apply PiLp.ext
      intro i
      fin_cases i
      · change w 0 = (w 0 / s 0) * s 0
        field_simp [hs0]
      · have hcross : w 1 * s 0 = w 0 * s 1 := by
          by_cases hd0 : d 0 = 0
          · have hd1 : d 1 ≠ 0 := by
              intro hd1
              apply hd
              apply PiLp.ext
              intro j
              fin_cases j <;> simp [hd0, hd1]
            have hprod : (w 1 * s 0 - w 0 * s 1) * d 1 = 0 := by
              linear_combination s 0 * horth - w 0 * hsd
            rcases mul_eq_zero.mp hprod with h | h
            · linarith
            · exact (hd1 h).elim
          · have hprod : (w 1 * s 0 - w 0 * s 1) * d 0 = 0 := by
              linear_combination w 1 * hsd - s 1 * horth
            rcases mul_eq_zero.mp hprod with h | h
            · linarith
            · exact (hd0 h).elim
        change w 1 = (w 0 / s 0) * s 1
        field_simp [hs0]
        nlinarith [hcross]
  obtain ⟨t, ht⟩ := hparallel
  refine ⟨t, ?_⟩
  simpa [a, b, w, s] using ht

/-- The scalar in the bisector representation is nonzero away from the centre. -/
theorem bisector_direction_parameter_ne_zero
    {P p q z : Plane} {τ : ℝ}
    (hrep : z - P = τ • ((p - P) + (q - P)))
    (hzP : z ≠ P) :
    τ ≠ 0 := by
  intro hτ
  apply hzP
  have : z - P = 0 := by simpa [hτ] using hrep
  exact sub_eq_zero.mp this

/-- The bisector direction has a nonzero parameter whenever the point is not
the centre.  This is the direct K2 form consumed by the rigid221 row cuts. -/
theorem exists_bisector_direction_ne_zero
    {P p q z : Plane}
    (hpq : p ≠ q)
    (hP : dist P p = dist P q)
    (hz : dist z p = dist z q)
    (hsum : (p - P) + (q - P) ≠ 0)
    (hzP : z ≠ P) :
    ∃ t : ℝ, z - P = t • ((p - P) + (q - P)) ∧ t ≠ 0 := by
  obtain ⟨t, ht⟩ := exists_bisector_direction hpq hP hz hsum
  exact ⟨t, ht, bisector_direction_parameter_ne_zero ht hzP⟩

/-- Signed sides of the chord force a bisector parameter past its midpoint. -/
theorem bisector_parameter_gt_half_of_signed_sides
    {P p q z : Plane} {t : ℝ}
    (hrep : z - P = t • ((p - P) + (q - P)))
    (hz : 0 < signedArea2 p q z)
    (hP : signedArea2 p q P < 0) :
    (1 / 2 : ℝ) < t := by
  have harea : signedArea2 p q z = (1 - 2 * t) * signedArea2 p q P := by
    unfold signedArea2 at hz hP ⊢
    have hcoord : ∀ i : Fin 2, z i - P i =
        t * ((p i - P i) + (q i - P i)) := by
      intro i
      have hi := congrArg (fun v : Plane => v i) hrep
      have hi' : z i - P i = t * (p i - P i) + t * (q i - P i) := by
        simpa only [PiLp.sub_apply, PiLp.add_apply, PiLp.smul_apply, smul_add,
          smul_eq_mul] using hi
      calc
        z i - P i = t * (p i - P i) + t * (q i - P i) := hi'
        _ = t * ((p i - P i) + (q i - P i)) := by ring
    have hz0 : z 0 = P 0 + t * ((p 0 - P 0) + (q 0 - P 0)) := by
      linarith [hcoord 0]
    have hz1 : z 1 = P 1 + t * ((p 1 - P 1) + (q 1 - P 1)) := by
      linarith [hcoord 1]
    rw [hz0, hz1]
    ring
  rw [harea] at hz
  have hfactor : 1 - 2 * t < 0 := by
    by_contra hnot
    have hnonneg : 0 ≤ 1 - 2 * t := le_of_not_gt hnot
    have hprod : (1 - 2 * t) * signedArea2 p q P ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos hnonneg (le_of_lt hP)
    linarith
  linarith

end Geometry
end Erdos9796Proof
