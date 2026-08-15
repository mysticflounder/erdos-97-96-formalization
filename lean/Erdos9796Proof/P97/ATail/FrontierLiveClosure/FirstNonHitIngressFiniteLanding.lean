/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitFiniteHingressPayload

/-!
# FirstNonHit finite-payload landing contracts

These adapters state the exact universal theorem that a finite search must
produce in order to close either arm of the live retained/common-radius
ingress.  They reindex the actual complete carrier and introduce no fixed
cardinality, bounded-core, or surface-identification assumption.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailBlockerMultiplicityGeometry
open ATailCriticalFiberClosingCore
open ATailCriticalPairFrontier
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedMatchingGeometricReduction
open ATailRetainedStrictInteriorPairSelector

namespace TwoSourceExactCollisionRowsTerminal

noncomputable section

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)

/-- Exact universal finite query required to eliminate the aligned-retained
arm.  The quantifier ranges over the complete source assignment, not a fixed
carrier size. -/
abbrev FirstNonHitRetainedFinitePayloadImpossible
    (P : RetainedInteriorBlockerCollision R)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  ∀ A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q,
    FirstNonHitRetainedDeletionFinitePayload P Pρ C Q A → False

/-- Exact universal finite query required to eliminate the independent
common-radius arm.  Its payload indices come from the witness surface and are
not identified with the named canonical surface `C`. -/
abbrev FirstNonHitCommonRadiusFinitePayloadImpossible
    (P : RetainedInteriorBlockerCollision R)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  ∀ A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q,
    FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A → False

/-- Exact universal finite query for the unsplit acyclic ingress.  This is the
single proposition a complete finite-query theorem may expose to the live
parent; the branch-specific aliases above remain useful for separate search
campaigns. -/
abbrev FirstNonHitFiniteHingressPayloadImpossible
    (P : RetainedInteriorBlockerCollision R)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  ∀ A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q,
    FirstNonHitFiniteHingressPayload P Pρ C Q A → False

include hρne L N in
/-- A uniform impossibility theorem for the retained finite payload closes the
source-level aligned-retained branch. -/
theorem false_of_freshThird_firstNonHit_alignedRetained_of_finitePayloadImpossible
    (hretained : FreshThirdAlignedRetainedConsumerPacket
      (P := P) (Pρ := Pρ) C)
    (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q)
    (hfinite : FirstNonHitRetainedFinitePayloadImpossible P Pρ C Q) :
    False := by
  let A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q :=
    FirstNonHitSourceTotalFiniteAssignment.ofPacket
      P Pρ L N C Q (Or.inl hretained) data secondInteraction
  exact
    hfinite A
      (firstNonHitRetainedDeletionFinitePayload_of_aligned
        P Pρ C Q A hρne hretained)

include L N in
/-- A uniform impossibility theorem for the independently reindexed
common-radius payload closes the source-level common-radius branch. -/
theorem false_of_freshThird_firstNonHit_commonRadius_of_finitePayloadImpossible
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q)
    (hfinite : FirstNonHitCommonRadiusFinitePayloadImpossible P Pρ C Q) :
    False := by
  let A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q :=
    FirstNonHitSourceTotalFiniteAssignment.ofPacket
      P Pρ L N C Q (Or.inr ⟨G⟩) data secondInteraction
  exact
    hfinite A
      (Classical.choice
        (FirstNonHitFiniteCommonRadiusPayload.ofWitness P Pρ C Q A G))

include hρne L N in
/-- A uniform impossibility theorem for the complete finite hingress payload
closes the unsplit source-level FirstNonHit branch. -/
theorem false_of_freshThird_firstNonHit_of_finiteHingressPayloadImpossible
    (hingress : FreshThirdAcyclicCanonicalConsumerPacket
      (P := P) (Pρ := Pρ) C)
    (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q)
    (hfinite : FirstNonHitFiniteHingressPayloadImpossible P Pρ C Q) :
    False := by
  let A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q :=
    FirstNonHitSourceTotalFiniteAssignment.ofPacket
      P Pρ L N C Q hingress data secondInteraction
  exact
    hfinite A
      (firstNonHitFiniteHingressPayload P Pρ C Q A hρne hingress)

#print axioms false_of_freshThird_firstNonHit_alignedRetained_of_finitePayloadImpossible
#print axioms false_of_freshThird_firstNonHit_commonRadius_of_finitePayloadImpossible
#print axioms false_of_freshThird_firstNonHit_of_finiteHingressPayloadImpossible

end

end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
