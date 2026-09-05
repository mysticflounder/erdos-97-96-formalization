/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover
import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.ATail.SurvivalCover

/-!
# Actual-blocker refinement of a two-deletion survival square

The four-point split in the common-deletion frontier records a survival square
but otherwise forgets which selected row supplied each surviving branch.  This
module keeps that provenance at the actual blocker of the erased source.  The
fresh arm is intentionally left as a disjunction of inequalities: converting
it into a new geometric terminal requires a separate incidence argument.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailActualBlockerSquareRefinement

open ATailDeletionRobustness
open ATailCriticalPairFrontier
open ATailMinimalUniqueFourCover
open ATailSurvivalCover

attribute [local instance] Classical.propDecidable

/-- The actual blocker of an erased source is either one of the named square
centers or is fresh from all three of them.  The selected-row omission is
recovered from the survival square and exported for the two-deletion
coordinator. -/
theorem actualBlocker_alias_or_fresh_of_survivalSquare
    {D : CounterexampleData}
    (H : CriticalShellSystem D.A)
    {a q X u v r : ℝ²}
    (hqA : q ∈ D.A)
    (hXA : X ∈ D.A)
    (huA : u ∈ D.A)
    (hvA : v ∈ D.A)
    (hrA : r ∈ D.A)
    (hrobust : FullyDeletionRobustAt D a)
    (hsquare :
      HasNEquidistantPointsAt 4 (D.A.erase X) (H.centerAt q hqA)) :
    let pX := H.centerAt X hXA
    let bu := H.centerAt u huA
    let bv := H.centerAt v hvA
    let br := H.centerAt r hrA
    let bq := H.centerAt q hqA
    IsUniqueFourCenter D.A pX ∧
    X ∈ uniqueFourClass D.A pX ∧
    uniqueFourClass D.A pX =
      (H.selectedAt X hXA).toCriticalFourShell.support ∧
    X ∉ (H.selectedAt q hqA).toCriticalFourShell.support ∧
    pX ≠ a ∧ pX ≠ bq ∧
    ((pX = bu ∧
        X ∈ (H.selectedAt u huA).toCriticalFourShell.support) ∨
      (pX = bv ∧
        X ∈ (H.selectedAt v hvA).toCriticalFourShell.support) ∨
      (pX = br ∧
        X ∈ (H.selectedAt r hrA).toCriticalFourShell.support) ∨
      (pX ≠ bu ∧ pX ≠ bv ∧ pX ≠ br)) := by
  dsimp only
  have hpXUnique : IsUniqueFourCenter D.A (H.centerAt X hXA) :=
    isUniqueFourCenter_centerAt H X hXA
  have hXMem : X ∈ uniqueFourClass D.A (H.centerAt X hXA) :=
    source_mem_uniqueFourClass_centerAt H X hXA
  have hSupportEq :
      uniqueFourClass D.A (H.centerAt X hXA) =
        (H.selectedAt X hXA).toCriticalFourShell.support :=
    uniqueFourClass_centerAt_eq_selectedAt_support H X hXA
  have hXnotQRow :
      X ∉ (H.selectedAt q hqA).toCriticalFourShell.support :=
    (cross_deletion_survives_iff_not_mem_selected_support H hqA).mp hsquare
  have hpXNeA : H.centerAt X hXA ≠ a :=
    hrobust.centerAt_ne H X hXA
  have hpXNeBQ : H.centerAt X hXA ≠ H.centerAt q hqA := by
    intro hcenter
    apply H.no_qfree_at X hXA
    rw [hcenter]
    exact hsquare
  have hXRow :
      X ∈ (H.selectedAt X hXA).toCriticalFourShell.support := by
    rw [← hSupportEq]
    exact hXMem
  refine ⟨hpXUnique, hXMem, hSupportEq, hXnotQRow, hpXNeA, hpXNeBQ, ?_⟩
  by_cases hbu : H.centerAt X hXA = H.centerAt u huA
  · left
    refine ⟨hbu, ?_⟩
    have hsupports :=
      selectedSupports_eq_of_actualBlockers_eq H hXA huA hbu
    rw [← hsupports]
    exact hXRow
  · by_cases hbv : H.centerAt X hXA = H.centerAt v hvA
    · exact Or.inr (Or.inl ⟨hbv, by
        have hsupports :=
          selectedSupports_eq_of_actualBlockers_eq H hXA hvA hbv
        rw [← hsupports]
        exact hXRow⟩)
    · by_cases hbr : H.centerAt X hXA = H.centerAt r hrA
      · exact Or.inr (Or.inr (Or.inl ⟨hbr, by
          have hsupports :=
            selectedSupports_eq_of_actualBlockers_eq H hXA hrA hbr
          rw [← hsupports]
          exact hXRow⟩))
      · exact Or.inr (Or.inr (Or.inr ⟨hbu, hbv, hbr⟩))

end ATailActualBlockerSquareRefinement
end Problem97
