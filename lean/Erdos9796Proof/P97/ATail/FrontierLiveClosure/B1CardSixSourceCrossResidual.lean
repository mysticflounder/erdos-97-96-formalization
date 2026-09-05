/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1EscapeSourceContextCrossBad

/-!
# B1 card-six source/cross residual

This module records the exact source-rich split left by the card-six
canonical-deletion residual.  The two mixed arms retain both strict
second-cap-interior hypotheses, because downstream first-apex and bad-source
consumers need those witnesses explicitly.  No arm is claimed to be closed.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailSurvivalCover
open ATailUniqueFourLateChoiceTerminalScratch
open ATailTwoRadiusGridEscapeSynchronization
open Census554.CapSelectedGeometry
open Census554.GeneralCarrierBridge

/- The three explicit residual arms are: failure of simultaneous strict
   interior, the U-bad/V-first cross arm, and its symmetric mate. -/
def B1CardSixSourceCrossResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Prop :=
  (¬ (C.u.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      C.v.1 ∈ S.capInteriorByIndex S.oppIndex2)) ∨
    ((C.u.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        C.v.1 ∈ S.capInteriorByIndex S.oppIndex2) ∧
      (C.u ∈ interiorPairBadOutsideSources C.R ∧
        C.v.1 ∈ SelectedClass D.A S.oppApex1 radius)) ∨
    ((C.u.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        C.v.1 ∈ S.capInteriorByIndex S.oppIndex2) ∧
      (C.u.1 ∈ SelectedClass D.A S.oppApex1 radius ∧
        C.v ∈ interiorPairBadOutsideSources C.R))

/-- In the card-six branch of the canonical endpoint residual, either the
    existing source context is available, or the exact three-arm residual is
    exposed.  The card packet and endpoint residual are retained as binders so
    this theorem can be used directly at that dependent branch. -/
theorem b1_cardSix_sourceContext_or_sourceCrossResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (_P : B1CardSixLocalRolePacket C)
    (E : B1EscapeRowProvenanceStar C)
    (_R : B1GoodCanonicalDeletionEndpointResidual C E) :
    Nonempty (B1EscapeSourceContext C) ∨
      B1CardSixSourceCrossResidual C := by
  classical
  by_cases hboth :
      C.u.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        C.v.1 ∈ S.capInteriorByIndex S.oppIndex2
  · rcases b1_escapeSourceContext_or_liveFirstApexCrossBad
      C hnormal hboth.1 hboth.2 with hsource | hcross
    · exact Or.inl hsource
    · rcases hcross with hu | hv
      · exact Or.inr (Or.inr (Or.inl ⟨hboth, hu⟩))
      · exact Or.inr (Or.inr (Or.inr ⟨hboth, hv⟩))
  · exact Or.inr (Or.inl hboth)

#print axioms b1_cardSix_sourceContext_or_sourceCrossResidual

end ATailFrontierLiveClosure
end Problem97
