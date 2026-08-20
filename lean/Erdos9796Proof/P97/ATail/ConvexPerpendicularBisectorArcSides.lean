/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ConvexPerpendicularBisectorSides
import Erdos9796Proof.P97.ArcBlockContiguity

/-!
# Convex perpendicular-bisector carrier exhaustion and arc sides

This module supplies the direct-distance carrier bound together with the
algebraic bridge from perpendicular-bisector side signs to strict closer-to-an
endpoint signs along a convex cyclic boundary.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ConvexPerpendicularBisectorSides

/-- The squared-distance difference to a chord has the same affine zero line
as the signed area through two points on its perpendicular bisector. -/
theorem perpBisector_signedArea_ratio
    {p q z P x y : ℝ²}
    (hz : dist z p ^ 2 = dist z q ^ 2)
    (hP : dist P p ^ 2 = dist P q ^ 2) :
    (dist x p ^ 2 - dist x q ^ 2) * signedArea2 z P y =
      (dist y p ^ 2 - dist y q ^ 2) * signedArea2 z P x := by
  have hz' := hz
  have hP' := hP
  rw [dist_sq_coord, dist_sq_coord] at hz'
  rw [dist_sq_coord, dist_sq_coord] at hP'
  simp only [dist_sq_coord, signedArea2]
  linear_combination
    ((x 0 - z 0) * (y 1 - z 1) - (x 1 - z 1) * (y 0 - z 0)) * hP' +
      (((P 0 - z 0) * (y 1 - z 1) - (P 1 - z 1) * (y 0 - z 0)) -
        ((P 0 - z 0) * (x 1 - z 1) - (P 1 - z 1) * (x 0 - z 0)) -
        ((x 0 - z 0) * (y 1 - z 1) - (x 1 - z 1) * (y 0 - z 0))) * hz'

/-- A strict closer-to-`p` witness fixes the strict closer side on the whole
open boundary arc between two bisector carriers. The same theorem with `p`
and `q` exchanged gives the closer-to-`q` version. -/
theorem strict_closer_to_p_of_between_of_anchor
    {n : ℕ} {φ : Fin n → ℝ²} {p q : ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hφ : Function.Injective φ)
    {iz ia iP i : Fin n}
    (hia : iz < ia) (haP : ia < iP)
    (hi : iz < i) (hiP : i < iP)
    (hz : dist (φ iz) p = dist (φ iz) q)
    (hP : dist (φ iP) p = dist (φ iP) q)
    (hanchor : dist (φ ia) p < dist (φ ia) q) :
    dist (φ i) p < dist (φ i) q := by
  have hzsq : dist (φ iz) p ^ 2 = dist (φ iz) q ^ 2 := by
    rw [hz]
  have hPsq : dist (φ iP) p ^ 2 = dist (φ iP) q ^ 2 := by
    rw [hP]
  have hratio := perpBisector_signedArea_ratio
    (p := p) (q := q) (z := φ iz) (P := φ iP)
    (x := φ i) (y := φ ia) hzsq hPsq
  have area_cyclic (a b c : ℝ²) :
      signedArea2 a b c = signedArea2 c a b := by
    simp [signedArea2]
    ring
  rw [area_cyclic (φ iz) (φ iP) (φ ia),
    area_cyclic (φ iz) (φ iP) (φ i)] at hratio
  have harea_i : 0 < signedArea2 (φ i) (φ iz) (φ iP) :=
    signedArea2_pos_of_between hccw hφ hi hiP
  have harea_a : 0 < signedArea2 (φ ia) (φ iz) (φ iP) :=
    signedArea2_pos_of_between hccw hφ hia haP
  have hpa : 0 ≤ dist (φ ia) p := dist_nonneg
  have hqa : 0 ≤ dist (φ ia) q := dist_nonneg
  have hdiff_a : dist (φ ia) p ^ 2 - dist (φ ia) q ^ 2 < 0 := by
    nlinarith [sq_nonneg (dist (φ ia) p), sq_nonneg (dist (φ ia) q)]
  have hprod :
      (dist (φ i) p ^ 2 - dist (φ i) q ^ 2) *
          signedArea2 (φ ia) (φ iz) (φ iP) < 0 := by
    rw [hratio]
    exact mul_neg_of_neg_of_pos hdiff_a harea_i
  have hdiff_i : dist (φ i) p ^ 2 - dist (φ i) q ^ 2 < 0 := by
    apply lt_of_mul_lt_mul_right (by simpa using hprod) (le_of_lt harea_a)
  have hpi : 0 ≤ dist (φ i) p := dist_nonneg
  have hqi : 0 ≤ dist (φ i) q := dist_nonneg
  nlinarith [hdiff_i, hpi, hqi, sq_nonneg (dist (φ i) p),
    sq_nonneg (dist (φ i) q)]

/-- The analogous constant-side statement for the complementary open boundary
arc, represented in a linearized cyclic cut by indices strictly outside the
closed interval `[iz, iP]`. -/
theorem strict_closer_to_p_of_outside_of_anchor
    {n : ℕ} {φ : Fin n → ℝ²} {p q : ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hφ : Function.Injective φ)
    {iz ia iP i : Fin n} (hizP : iz < iP)
    (hia : ia < iz ∨ iP < ia) (hi : i < iz ∨ iP < i)
    (hz : dist (φ iz) p = dist (φ iz) q)
    (hP : dist (φ iP) p = dist (φ iP) q)
    (hanchor : dist (φ ia) p < dist (φ ia) q) :
    dist (φ i) p < dist (φ i) q := by
  have hzsq : dist (φ iz) p ^ 2 = dist (φ iz) q ^ 2 := by
    rw [hz]
  have hPsq : dist (φ iP) p ^ 2 = dist (φ iP) q ^ 2 := by
    rw [hP]
  have hratio := perpBisector_signedArea_ratio
    (p := p) (q := q) (z := φ iz) (P := φ iP)
    (x := φ i) (y := φ ia) hzsq hPsq
  have area_cyclic (a b c : ℝ²) :
      signedArea2 a b c = signedArea2 c a b := by
    simp [signedArea2]
    ring
  rw [area_cyclic (φ iz) (φ iP) (φ ia),
    area_cyclic (φ iz) (φ iP) (φ i)] at hratio
  have harea_i : signedArea2 (φ i) (φ iz) (φ iP) < 0 :=
    signedArea2_neg_of_outside hccw hφ hizP hi
  have harea_a : signedArea2 (φ ia) (φ iz) (φ iP) < 0 :=
    signedArea2_neg_of_outside hccw hφ hizP hia
  have hpa : 0 ≤ dist (φ ia) p := dist_nonneg
  have hqa : 0 ≤ dist (φ ia) q := dist_nonneg
  have hdiff_a : dist (φ ia) p ^ 2 - dist (φ ia) q ^ 2 < 0 := by
    nlinarith [sq_nonneg (dist (φ ia) p), sq_nonneg (dist (φ ia) q)]
  have hprod :
      0 < (dist (φ i) p ^ 2 - dist (φ i) q ^ 2) *
          signedArea2 (φ ia) (φ iz) (φ iP) := by
    rw [hratio]
    exact mul_pos_of_neg_of_neg hdiff_a harea_i
  have hdiff_i : dist (φ i) p ^ 2 - dist (φ i) q ^ 2 < 0 := by
    rcases (mul_pos_iff.mp hprod) with h | h
    · exact False.elim ((not_lt_of_ge (le_of_lt harea_a)) h.2)
    · exact h.1
  have hpi : 0 ≤ dist (φ i) p := dist_nonneg
  have hqi : 0 ≤ dist (φ i) q := dist_nonneg
  nlinarith [hdiff_i, hpi, hqi, sq_nonneg (dist (φ i) p),
    sq_nonneg (dist (φ i) q)]

/-- If the only boundary carriers on the chord's perpendicular bisector are
the two named endpoints, every nonempty open arc between them has one strict
closer-side sign throughout. -/
theorem closer_side_constant_between_of_no_other_bisector
    {n : ℕ} {φ : Fin n → ℝ²} {p q : ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hφ : Function.Injective φ)
    {iz iP : Fin n} (hizP : iz < iP)
    (hz : dist (φ iz) p = dist (φ iz) q)
    (hP : dist (φ iP) p = dist (φ iP) q)
    (hnoeq : ∀ j, dist (φ j) p = dist (φ j) q → j = iz ∨ j = iP)
    (harc : ∃ ia, iz < ia ∧ ia < iP) :
    (∀ i, iz < i ∧ i < iP → dist (φ i) p < dist (φ i) q) ∨
      (∀ i, iz < i ∧ i < iP → dist (φ i) q < dist (φ i) p) := by
  obtain ⟨ia, hia, haP⟩ := harc
  have hne : dist (φ ia) p ≠ dist (φ ia) q := by
    intro heq
    rcases hnoeq ia heq with rfl | rfl <;> omega
  rcases lt_or_gt_of_ne hne with hlt | hgt
  · left
    intro i hi
    exact strict_closer_to_p_of_between_of_anchor hccw hφ hia haP
      hi.1 hi.2 hz hP hlt
  · right
    intro i hi
    exact strict_closer_to_p_of_between_of_anchor (p := q) (q := p)
      hccw hφ hia haP hi.1 hi.2 hz.symm hP.symm hgt

/-- The corresponding disjunctive constant-side result for the complementary
open arc in a linearized cyclic cut. -/
theorem closer_side_constant_outside_of_no_other_bisector
    {n : ℕ} {φ : Fin n → ℝ²} {p q : ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hφ : Function.Injective φ)
    {iz iP : Fin n} (hizP : iz < iP)
    (hz : dist (φ iz) p = dist (φ iz) q)
    (hP : dist (φ iP) p = dist (φ iP) q)
    (hnoeq : ∀ j, dist (φ j) p = dist (φ j) q → j = iz ∨ j = iP)
    (harc : ∃ ia, ia < iz ∨ iP < ia) :
    (∀ i, i < iz ∨ iP < i → dist (φ i) p < dist (φ i) q) ∨
      (∀ i, i < iz ∨ iP < i → dist (φ i) q < dist (φ i) p) := by
  obtain ⟨ia, hia⟩ := harc
  have hne : dist (φ ia) p ≠ dist (φ ia) q := by
    intro heq
    rcases hnoeq ia heq with rfl | rfl <;> omega
  rcases lt_or_gt_of_ne hne with hlt | hgt
  · left
    intro i hi
    exact strict_closer_to_p_of_outside_of_anchor hccw hφ hizP hia hi hz hP hlt
  · right
    intro i hi
    exact strict_closer_to_p_of_outside_of_anchor (p := q) (q := p)
      hccw hφ hizP hia hi hz.symm hP.symm hgt

end ConvexPerpendicularBisectorSides
end Problem97
