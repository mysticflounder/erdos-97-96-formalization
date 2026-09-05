/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1WinningSliceOrderOutcome

/-!
# B1 canonical exhaustion

The robust strict-interior source split is made exhaustive here.  Once the
escape-source context branch is absent, every eligible physical-class source
must be one of the two canonical deleted sources.  The retained boundary
endpoint residual is carried separately, so this module does not add an
unproved live-slice order or signed-area conclusion.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- Every eligible strict-second-cap source is canonical once the escape
context is unavailable.  The endpoint residual is retained at the same wave
boundary for the downstream canonical branch. -/
theorem b1_escape_or_canonicalExhaustion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (E : B1EscapeRowProvenanceStar C) :
    Nonempty (B1EscapeSourceContext C) ∨
      (Nonempty (B1GoodCanonicalDeletionEndpointResidual C E) ∧
        ∀ s : CarrierVertex D.A,
          s.1 ∈ SelectedClass D.A S.oppApex2 C.rho →
          s.1 ∈ S.capInteriorByIndex S.oppIndex2 →
          s ∈ outsideFirstApexFiber C.R →
          (HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_q)
              ((lateFirstApexSystem C.R).centerAt s.1 s.2) ∨
            HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_w)
              ((lateFirstApexSystem C.R).centerAt s.1 s.2)) →
          s = C.first.deleted ∨ s = C.second.deleted) := by
  classical
  by_cases hescape : Nonempty (B1EscapeSourceContext C)
  · exact Or.inl hescape
  · right
    have hcanonical : B1GoodCanonicalDeletionResidual C :=
      (b1_escapeSourceContext_or_goodCanonicalDeletion C hnormal).resolve_left
        hescape
    refine ⟨⟨hcanonical.toEndpointResidual hnormal E⟩, ?_⟩
    intro s hsClass hsInterior hsOutside hsSurvives
    by_contra hnoncanonical
    apply hescape
    apply b1EscapeSourceContext_of_normalForm_sourceData
      C hnormal s hsClass hsInterior
    · intro h
      exact hnoncanonical (Or.inl h)
    · intro h
      exact hnoncanonical (Or.inr h)
    · exact hsOutside
    · exact hsSurvives

#print axioms b1_escape_or_canonicalExhaustion

end ATailFrontierLiveClosure
end Problem97
