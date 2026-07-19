/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SourceReturnSecondApexBridge
import ReciprocalSwapReduction

/-!
# Consuming the source-return physical second-apex residual

The four-way physical endpoint of a retained source-return walk has only two
mathematical continuations.  A prescribed critical deletion at the physical
second apex reorients to the protected swapped unique-card-four frontier.
Two support-disjoint exact shells make the physical apex fully robust under
every single deletion.  The remaining joint-double-deletion arm is split by
the same exact robustness predicate; its nonrobust side again supplies a
prescribed critical deletion and hence the swapped frontier.

This file deliberately does not claim either continuation false.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSourceReturnPhysicalResidualScratch

open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingCommonDeletionCycle
open ATailRReciprocalSwapReductionScratch
open ATailSourceReturnSecondApexBridge

attribute [local instance] Classical.propDecidable

/-- The two genuine downstream frontiers of the source-return physical
second-apex classification. -/
inductive SourceReturnPhysicalConsumedOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) : Type
  | robust
      (sourceReturn : W.next = W.first)
      (secondApexRobust : FullyDeletionRobustAt D S.oppApex2)
  | swappedUniqueFour
      (sourceReturn : W.next = W.first)
      (frontier : SwappedFirstApexUniqueFourFrontier D S H)

private theorem nonempty_swappedUniqueFour_of_criticalResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (critical : PhysicalSecondApexCriticalResidual D S) :
    Nonempty (SwappedFirstApexUniqueFourFrontier D S H) :=
  secondApexCritical_reorients_to_firstApexUniqueFour
    critical.shell critical.deletion_blocked

private theorem nonempty_swappedUniqueFour_of_not_robust
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (hnotRobust : ¬ FullyDeletionRobustAt D S.oppApex2) :
    Nonempty (SwappedFirstApexUniqueFourFrontier D S H) := by
  rcases nonempty_physicalSecondApexCriticalResidual_of_not_robust
      hnotRobust with ⟨critical⟩
  exact nonempty_swappedUniqueFour_of_criticalResidual critical

/-- Consume one exact physical endpoint.  The disjoint-shell constructor is
sent constructively to robustness; the two critical constructors are sent
constructively to swapped unique four.  Only the joint-double-deletion
constructor needs excluded middle on full robustness. -/
theorem nonempty_consumedOutcome_of_physicalOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (outcome : RetainedSourceReturnPhysicalSecondApexOutcome W) :
    Nonempty (SourceReturnPhysicalConsumedOutcome W) := by
  cases outcome with
  | firstCritical sourceReturn _secondSurvives critical _criticalSource =>
      rcases nonempty_swappedUniqueFour_of_criticalResidual
          (H := H) critical with ⟨frontier⟩
      exact ⟨SourceReturnPhysicalConsumedOutcome.swappedUniqueFour
        sourceReturn frontier⟩
  | secondCritical sourceReturn _firstSurvives critical _criticalSource =>
      rcases nonempty_swappedUniqueFour_of_criticalResidual
          (H := H) critical with ⟨frontier⟩
      exact ⟨SourceReturnPhysicalConsumedOutcome.swappedUniqueFour
        sourceReturn frontier⟩
  | jointDoubleDeletion sourceReturn _firstSurvives _secondSurvives _doubleSurvives =>
      by_cases hrobust : FullyDeletionRobustAt D S.oppApex2
      · exact ⟨SourceReturnPhysicalConsumedOutcome.robust
          sourceReturn hrobust⟩
      · rcases nonempty_swappedUniqueFour_of_not_robust
            (H := H) hrobust with ⟨frontier⟩
        exact ⟨SourceReturnPhysicalConsumedOutcome.swappedUniqueFour
          sourceReturn frontier⟩
  | disjointExactShells sourceReturn _firstSurvives _secondSurvives
      firstShell secondShell _firstRadius _secondRadius supportsDisjoint =>
      have hrobust : FullyDeletionRobustAt D S.oppApex2 :=
        fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses
          firstShell.toSelectedFourClass secondShell.toSelectedFourClass
          supportsDisjoint
      exact ⟨SourceReturnPhysicalConsumedOutcome.robust
        sourceReturn hrobust⟩

/-- The full source-return arm reaches only the robust physical-apex frontier
or the protected swapped unique-card-four frontier. -/
theorem nonempty_sourceReturnPhysicalConsumedOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R)
    (hreturn : W.next = W.first) :
    Nonempty (SourceReturnPhysicalConsumedOutcome W) := by
  rcases nonempty_sourceReturnPhysicalSecondApexOutcome W hreturn with
    ⟨outcome⟩
  exact nonempty_consumedOutcome_of_physicalOutcome outcome

/-- Proposition-valued form of the same exact implication. -/
theorem sourceReturn_secondApexRobust_or_swappedUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R)
    (hreturn : W.next = W.first) :
    FullyDeletionRobustAt D S.oppApex2 ∨
      Nonempty (SwappedFirstApexUniqueFourFrontier D S H) := by
  rcases nonempty_sourceReturnPhysicalConsumedOutcome W hreturn with
    ⟨outcome⟩
  cases outcome with
  | robust _ robust => exact Or.inl robust
  | swappedUniqueFour _ frontier => exact Or.inr ⟨frontier⟩

/-- Motive-valued consumer boundary.  A direct contradiction on the robust
physical-apex frontier and the protected swapped unique-four frontier closes
the complete source-return physical endpoint. -/
theorem false_of_sourceReturnPhysicalConsumers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R)
    (hreturn : W.next = W.first)
    (robustFalse : FullyDeletionRobustAt D S.oppApex2 → False)
    (swappedUniqueFourFalse :
      SwappedFirstApexUniqueFourFrontier D S H → False) :
    False := by
  rcases sourceReturn_secondApexRobust_or_swappedUniqueFour W hreturn with
    hrobust | hswapped
  · exact robustFalse hrobust
  · exact swappedUniqueFourFalse hswapped.some

#print axioms nonempty_consumedOutcome_of_physicalOutcome
#print axioms nonempty_sourceReturnPhysicalConsumedOutcome
#print axioms sourceReturn_secondApexRobust_or_swappedUniqueFour
#print axioms false_of_sourceReturnPhysicalConsumers

end ATailSourceReturnPhysicalResidualScratch
end Problem97
