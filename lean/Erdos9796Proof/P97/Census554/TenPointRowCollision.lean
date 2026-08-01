/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.Census554.TenPointRowCollisionCertificate

/-!
# A ten-point equidistance pattern forces a collision

The ten four-member rows below admit an exact rational ideal-membership
identity.  After sending labels `0` and `1` to `(0,0)` and `(1,0)` with
`normalAxis`, the identity forces the squared norm of label `9` to vanish.
Thus labels `9` and `0` have the same image.

The theorem-facing interface is independent of the concrete label type.  The
finite indices only describe how ten arbitrary labels occur in the rows.
-/

open scoped EuclideanGeometry

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

namespace Problem97
namespace Census554
namespace TenPointRowCollision

open EqualityCore
open U5GramCert

/-- The ten four-member rows used by the collision identity. -/
def pattern : RowPattern (Fin 10)
  | 0 => {3, 4, 5, 9}
  | 1 => {2, 4, 7, 8}
  | 2 => {0, 1, 4, 9}
  | 3 => {0, 6, 7, 9}
  | 4 => {0, 1, 2, 7}
  | 5 => {0, 4, 6, 8}
  | 6 => {3, 5, 7, 8}
  | 7 => {1, 3, 4, 6}
  | 8 => {1, 5, 6, 9}
  | 9 => {0, 2, 3, 8}

/-- Ten arbitrary labels carrying the displayed row pattern. -/
structure Core {α : Type*} [DecidableEq α] (P : RowPattern α) where
  label : Fin 10 → α
  label_zero_ne_label_one : label 0 ≠ label 1
  label_nine_ne_label_zero : label 9 ≠ label 0
  mem : ∀ i j, j ∈ pattern i → label j ∈ P (label i)

private theorem all_facts_zero {α : Type*} [DecidableEq α]
    {P : RowPattern α} {pointOf : α → ℝ²}
    (core : Core P) (hreal : Realizes P pointOf) :
    let q : Fin 10 → ℝ² :=
      fun i => normalAxis (pointOf (core.label 0)) (pointOf (core.label 1))
        (pointOf (core.label i))
    ∀ f ∈ facts, eval (coordinateValuation q) f = 0 := by
  dsimp only
  have hpoint01 :
      pointOf (core.label 0) ≠ pointOf (core.label 1) := by
    intro h
    exact core.label_zero_ne_label_one (hreal.injective h)
  intro f hf
  simp only [facts, List.mem_cons, List.not_mem_nil, or_false] at hf
  rcases hf with
    rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl |
    rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl |
    rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals
    apply eval_distanceEqualityPolynomial_eq_zero
    · exact normalAxis_self
    · exact normalAxis_witness hpoint01
    · apply normalAxis_coord_sqdist_eq_of_dist_eq
        hpoint01
      apply hreal.equidist
      all_goals
        apply core.mem <;> native_decide

/-- Every plane realization of the ten rows maps label `9` to label `0`. -/
theorem point_nine_eq_point_zero {α : Type*} [DecidableEq α]
    {P : RowPattern α} {pointOf : α → ℝ²}
    (core : Core P) (hreal : Realizes P pointOf) :
    pointOf (core.label 9) = pointOf (core.label 0) := by
  let q : Fin 10 → ℝ² :=
    fun i => normalAxis (pointOf (core.label 0)) (pointOf (core.label 1))
      (pointOf (core.label i))
  let ν := coordinateValuation q
  have htarget : eval ν target = 0 :=
    eval_target_eq_zero_of_idealMembershipCertCheckerNormalized ν facts target
      cofactors certificate_checked (all_facts_zero core hreal)
  have hsum :
      (q 9 0) ^ 2 + (q 9 1) ^ 2 = 0 := by
    simpa [ν, target, coordinateValuation, eval_coordSqNormPoly] using htarget
  have hx : q 9 0 = 0 := by
    nlinarith [sq_nonneg (q 9 0), sq_nonneg (q 9 1)]
  have hy : q 9 1 = 0 := by
    nlinarith [sq_nonneg (q 9 0), sq_nonneg (q 9 1)]
  have hq9 : q 9 = 0 := by
    ext i
    fin_cases i <;> simp [hx, hy]
  have hq0 : q 0 = 0 := normalAxis_self
  have hq : q 9 = q 0 := hq9.trans hq0.symm
  have hpoint01 :
      pointOf (core.label 0) ≠ pointOf (core.label 1) := by
    intro h
    exact core.label_zero_ne_label_one (hreal.injective h)
  have hdist := (normalAxis_dist_eq_iff hpoint01
    (pointOf (core.label 9)) (pointOf (core.label 0))
    (pointOf (core.label 0)) (pointOf (core.label 0))).mpr (by simp [q, hq])
  exact dist_eq_zero.mp (by simpa using hdist)

/-- The ten-row core has no injective plane realization. -/
theorem not_realizes {α : Type*} [DecidableEq α]
    {P : RowPattern α} {pointOf : α → ℝ²} (core : Core P) :
    ¬ Realizes P pointOf := by
  intro hreal
  exact core.label_nine_ne_label_zero
    (hreal.injective (point_nine_eq_point_zero core hreal))

end TenPointRowCollision
end Census554
end Problem97
