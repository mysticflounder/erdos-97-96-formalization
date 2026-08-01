/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Circle-point power matrices

The matrix of powers of planar points with respect to planar circles factors
through a four-dimensional feature space.  Consequently its rank is at most
four and every `5 × 5` minor vanishes.

The final theorems give the finite determinant certificate used by the
power-pattern miner.  The certificate deliberately distinguishes entries
proved zero from entries proved nonzero:

* uniqueness is tested among every permutation not killed by a proved zero;
* every entry of the sole surviving permutation must be proved nonzero.

In particular, an entry whose status is unknown is retained when testing
uniqueness.
-/

namespace Problem97
namespace Census554
namespace CirclePowerMatrix

/-- Planar points in the project's standard Euclidean plane. -/
abbrev Point2 := Fin 2 → ℝ

/-- Squared Euclidean norm in the fixed Cartesian coordinates. -/
def sqNorm (p : Point2) : ℝ :=
  p 0 ^ 2 + p 1 ^ 2

/-- Squared Euclidean distance in the fixed Cartesian coordinates. -/
def sqDist (p q : Point2) : ℝ :=
  (p 0 - q 0) ^ 2 + (p 1 - q 1) ^ 2

/-- Power of a point with respect to a circle, with squared radius supplied
directly. -/
def power (center : Point2) (radiusSq : ℝ) (point : Point2) : ℝ :=
  sqDist point center - radiusSq

/-- Membership in the circle specified by a center and a squared radius. -/
def OnCircle (center : Point2) (radiusSq : ℝ) (point : Point2) : Prop :=
  sqDist point center = radiusSq

/-- Circle membership is exactly vanishing of the corresponding power entry. -/
theorem power_eq_zero_iff_onCircle
    (center : Point2) (radiusSq : ℝ) (point : Point2) :
    power center radiusSq point = 0 ↔ OnCircle center radiusSq point := by
  simp only [power, OnCircle]
  constructor <;> intro h <;> linarith

/-- A circle's center has power equal to the negative squared radius. -/
theorem power_center (center : Point2) (radiusSq : ℝ) :
    power center radiusSq center = -radiusSq := by
  simp [power, sqDist]

/-- Positive-radius circles therefore give a canonical certified-nonzero
diagonal entry when their center is used as the point column. -/
theorem power_center_ne_zero
    (center : Point2) (radiusSq : ℝ) (hradius : radiusSq ≠ 0) :
    power center radiusSq center ≠ 0 := by
  rw [power_center]
  exact neg_ne_zero.mpr hradius

/-- The four row features of a circle. -/
def circleFeature (center : Point2) (radiusSq : ℝ) : Fin 4 → ℝ :=
  ![1, -2 * center 0, -2 * center 1, sqNorm center - radiusSq]

/-- The four column features of a point. -/
def pointFeature (point : Point2) : Fin 4 → ℝ :=
  ![sqNorm point, point 0, point 1, 1]

/-- The scalar circle-point power factors through the four feature
coordinates. -/
theorem power_eq_feature_sum (center point : Point2) (radiusSq : ℝ) :
    power center radiusSq point =
      ∑ k : Fin 4, circleFeature center radiusSq k * pointFeature point k := by
  simp [power, sqDist, sqNorm, circleFeature, pointFeature, Fin.sum_univ_four]
  ring

variable {ι κ : Type*}

/-- The circle-point power matrix. -/
def powerMatrix
    (centers : ι → Point2) (radiusSq : ι → ℝ) (points : κ → Point2) :
    Matrix ι κ ℝ :=
  fun i j => power (centers i) (radiusSq i) (points j)

/-- Matrix of circle row features. -/
def circleFeatureMatrix
    (centers : ι → Point2) (radiusSq : ι → ℝ) :
    Matrix ι (Fin 4) ℝ :=
  fun i k => circleFeature (centers i) (radiusSq i) k

/-- Matrix of point column features. -/
def pointFeatureMatrix (points : κ → Point2) : Matrix (Fin 4) κ ℝ :=
  fun k j => pointFeature (points j) k

/-- Exact four-dimensional factorization of the power matrix. -/
theorem powerMatrix_factorization
    (centers : ι → Point2) (radiusSq : ι → ℝ) (points : κ → Point2) :
    powerMatrix centers radiusSq points =
      circleFeatureMatrix centers radiusSq * pointFeatureMatrix points := by
  ext i j
  exact power_eq_feature_sum (centers i) (points j) (radiusSq i)

/-- Every planar circle-point power matrix has rank at most four. -/
theorem powerMatrix_rank_le_four
    [Fintype κ]
    (centers : ι → Point2) (radiusSq : ι → ℝ) (points : κ → Point2) :
    (powerMatrix centers radiusSq points).rank ≤ 4 := by
  rw [powerMatrix_factorization]
  exact (Matrix.rank_mul_le_left _ _).trans (by
    simpa using Matrix.rank_le_card_width
      (circleFeatureMatrix centers radiusSq))

/-- Every `5 × 5` planar circle-point power matrix has zero determinant. -/
theorem powerMatrix_det_fin_five
    (centers : Fin 5 → Point2) (radiusSq : Fin 5 → ℝ)
    (points : Fin 5 → Point2) :
    (powerMatrix centers radiusSq points).det = 0 := by
  by_contra hdet
  have hdetUnit : IsUnit (powerMatrix centers radiusSq points).det :=
    isUnit_iff_ne_zero.mpr hdet
  have hmatrixUnit : IsUnit (powerMatrix centers radiusSq points) :=
    (powerMatrix centers radiusSq points).isUnit_iff_isUnit_det.mpr hdetUnit
  have hrank :
      (powerMatrix centers radiusSq points).rank = 5 := by
    simpa using Matrix.rank_of_isUnit
      (powerMatrix centers radiusSq points) hmatrixUnit
  have hle := powerMatrix_rank_le_four centers radiusSq points
  omega

/-- A permutation is possible relative to a certified-zero predicate when none
of its selected entries has been certified zero.  Unknown entries therefore
remain possible. -/
def PermutationPossible
    (forcedZero : Fin 5 → Fin 5 → Prop) (σ : Equiv.Perm (Fin 5)) : Prop :=
  ∀ i, ¬ forcedZero (σ i) i

/-- Every selected entry of a permutation is certified nonzero. -/
def PermutationCertifiedNonzero
    (forcedNonzero : Fin 5 → Fin 5 → Prop) (σ : Equiv.Perm (Fin 5)) : Prop :=
  ∀ i, forcedNonzero (σ i) i

/-- The determinant is nonzero when exactly one permutation survives all
certified zeros and every entry of that permutation is certified nonzero.

This is the precise three-valued power-pattern criterion: uniqueness is among
the possible-support graph (`nonzero ∪ unknown`), not merely among entries
already certified nonzero. -/
theorem det_ne_zero_of_unique_possible_matching
    (M : Matrix (Fin 5) (Fin 5) ℝ)
    (forcedZero forcedNonzero : Fin 5 → Fin 5 → Prop)
    (σ₀ : Equiv.Perm (Fin 5))
    (hZeroSound : ∀ i j, forcedZero i j → M i j = 0)
    (hNonzeroSound : ∀ i j, forcedNonzero i j → M i j ≠ 0)
    (hUnique :
      ∀ σ, PermutationPossible forcedZero σ → σ = σ₀)
    (hMatching :
      PermutationCertifiedNonzero forcedNonzero σ₀) :
    M.det ≠ 0 := by
  have hKilled :
      ∀ σ : Equiv.Perm (Fin 5), σ ≠ σ₀ →
        ∃ i, M (σ i) i = 0 := by
    intro σ hσ
    by_contra hNoZero
    have hPossible : PermutationPossible forcedZero σ := by
      intro i hi
      apply hNoZero
      exact ⟨i, hZeroSound (σ i) i hi⟩
    exact hσ (hUnique σ hPossible)
  rw [Matrix.det_apply']
  rw [Finset.sum_eq_single σ₀]
  · apply mul_ne_zero
    · simp
    · exact Finset.prod_ne_zero_iff.mpr fun i _ =>
        hNonzeroSound (σ₀ i) i (hMatching i)
  · intro σ _ hσ
    obtain ⟨i, hi⟩ := hKilled σ hσ
    have hprod : ∏ k, M (σ k) k = 0 :=
      Finset.prod_eq_zero (Finset.mem_univ i) hi
    simp [hprod]
  · simp

/-- No planar `5 × 5` power matrix can admit a unique possible perfect matching
whose five selected entries are all certified nonzero. -/
theorem false_of_powerMatrix_unique_possible_matching
    (centers : Fin 5 → Point2) (radiusSq : Fin 5 → ℝ)
    (points : Fin 5 → Point2)
    (forcedZero forcedNonzero : Fin 5 → Fin 5 → Prop)
    (σ₀ : Equiv.Perm (Fin 5))
    (hZeroSound :
      ∀ i j, forcedZero i j →
        powerMatrix centers radiusSq points i j = 0)
    (hNonzeroSound :
      ∀ i j, forcedNonzero i j →
        powerMatrix centers radiusSq points i j ≠ 0)
    (hUnique :
      ∀ σ, PermutationPossible forcedZero σ → σ = σ₀)
    (hMatching :
      PermutationCertifiedNonzero forcedNonzero σ₀) :
    False :=
  (det_ne_zero_of_unique_possible_matching
    (powerMatrix centers radiusSq points)
    forcedZero forcedNonzero σ₀ hZeroSound hNonzeroSound hUnique hMatching)
    (powerMatrix_det_fin_five centers radiusSq points)

#print axioms power_eq_feature_sum
#print axioms power_eq_zero_iff_onCircle
#print axioms power_center_ne_zero
#print axioms powerMatrix_factorization
#print axioms powerMatrix_rank_le_four
#print axioms powerMatrix_det_fin_five
#print axioms det_ne_zero_of_unique_possible_matching
#print axioms false_of_powerMatrix_unique_possible_matching

end CirclePowerMatrix
end Census554
end Problem97
