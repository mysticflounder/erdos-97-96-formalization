/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitRetainedDeletionFinitePayload
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitCommonRadiusFinitePayload

/-!
# Finite payload for the FirstNonHit retained/common-radius ingress

This module packages the two source-produced ingress arms over one complete
finite assignment.  It is only a branch payload: it makes no contradiction
claim and does not identify an independently produced common-radius surface
with the named canonical surface.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailBlockerMultiplicityGeometry
open ATailCriticalFiberClosingCore
open ATailCriticalPairFrontier
open ATailExactFifteenApexProfile
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCollisionGlobalProducer
open Census554.GeneralCarrierBridge

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
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)

/-- The finite data carried by one of the two source-produced ingress arms. -/
inductive FirstNonHitFiniteHingressPayload
    (P : RetainedInteriorBlockerCollision R)
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q) where
  | retained :
      FirstNonHitRetainedDeletionFinitePayload P Pρ C Q A →
      FirstNonHitFiniteHingressPayload P Pρ C Q A
  | commonRadius :
      FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A →
      FirstNonHitFiniteHingressPayload P Pρ C Q A

/-- The acyclic ingress producer supplies one finite payload branch.

The retained producer uses the explicit radius separation hypothesis required
by its deletion-fan construction.  In the common-radius arm the witness is
kept as its independently produced surface; no equality with `C` is used.
-/
theorem firstNonHitFiniteHingressPayload_nonempty
    (hρne : ρ ≠ radius)
    (hingress : FreshThirdAcyclicCanonicalConsumerPacket
      (P := P) (Pρ := Pρ) C) :
    Nonempty (FirstNonHitFiniteHingressPayload P Pρ C Q A) := by
  rcases hingress with hretained | hcommon
  · exact ⟨.retained (Classical.choice
      (firstNonHitRetainedDeletionFinitePayload_nonempty_of_aligned
        P Pρ C Q A hρne hretained))⟩
  · rcases hcommon with ⟨G⟩
    exact ⟨.commonRadius (Classical.choice
        (FirstNonHitFiniteCommonRadiusPayload.ofWitness
          P Pρ C Q A G))⟩

/-- Noncomputably select the branch payload supplied by the ingress producer. -/
noncomputable def firstNonHitFiniteHingressPayload
    (hρne : ρ ≠ radius)
    (hingress : FreshThirdAcyclicCanonicalConsumerPacket
      (P := P) (Pρ := Pρ) C) :
    FirstNonHitFiniteHingressPayload P Pρ C Q A :=
  Classical.choice
    (firstNonHitFiniteHingressPayload_nonempty
      P Pρ C Q A hρne hingress)

#print axioms firstNonHitFiniteHingressPayload_nonempty
#print axioms firstNonHitFiniteHingressPayload

end

end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
