import Mathlib

/-!
# Assignment comparability: exact incidence/flux reduction

This scratch module formalizes only the proved algebraic reduction.  It does
not assert the open circular product-box comparability theorem.
-/

namespace Problem97.ATailAssignmentComparabilityScratch

open scoped BigOperators

variable {n : ℕ}

/-- Signed incidence difference of two one-target-per-center assignments. -/
def assignmentIncidence (f g : Fin n → Fin n) (center target : Fin n) : ℤ :=
  (if f center = target then 1 else 0) -
    (if g center = target then 1 else 0)

/-- Number of assignment arrows leaving a finite vertex set. -/
def outwardCrossing (I : Finset (Fin n)) (f : Fin n → Fin n) : ℕ :=
  (I.filter fun center => f center ∉ I).card

/-- Outward flux of the signed assignment difference across `I`. -/
def assignmentFlux
    (I : Finset (Fin n)) (f g : Fin n → Fin n) : ℤ :=
  ∑ center ∈ I, ∑ target ∈ Finset.univ \ I,
    assignmentIncidence f g center target

/-- Every assignment difference has zero mass in each center row. -/
theorem assignmentIncidence_row_sum_eq_zero
    (f g : Fin n → Fin n) (center : Fin n) :
    ∑ target, assignmentIncidence f g center target = 0 := by
  simp [assignmentIncidence]

/-- The multiplicity of `target` in one assignment. -/
def targetMultiplicity (f : Fin n → Fin n) (target : Fin n) : ℕ :=
  (Finset.univ.filter fun center => f center = target).card

/-- Equal target multiplicities give zero mass in every target column. -/
theorem assignmentIncidence_target_sum_eq_zero
    (f g : Fin n → Fin n) (target : Fin n)
    (h : targetMultiplicity f target = targetMultiplicity g target) :
    ∑ center, assignmentIncidence f g center target = 0 := by
  classical
  calc
    ∑ center, assignmentIncidence f g center target =
        (targetMultiplicity f target : ℤ) -
          (targetMultiplicity g target : ℤ) := by
      simp [assignmentIncidence, targetMultiplicity, Finset.sum_boole]
    _ = 0 := by rw [h]; simp

/-- The interval flux is exactly the difference of outward crossing counts. -/
theorem assignmentFlux_eq_crossing_sub
    (I : Finset (Fin n)) (f g : Fin n → Fin n) :
    assignmentFlux I f g =
      (outwardCrossing I f : ℤ) - (outwardCrossing I g : ℤ) := by
  classical
  unfold outwardCrossing
  rw [Finset.natCast_card_filter, Finset.natCast_card_filter]
  simp [assignmentFlux, assignmentIncidence]

end Problem97.ATailAssignmentComparabilityScratch

#print axioms Problem97.ATailAssignmentComparabilityScratch.assignmentIncidence_row_sum_eq_zero
#print axioms Problem97.ATailAssignmentComparabilityScratch.assignmentIncidence_target_sum_eq_zero
#print axioms Problem97.ATailAssignmentComparabilityScratch.assignmentFlux_eq_crossing_sub
