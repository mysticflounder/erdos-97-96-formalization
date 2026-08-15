/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdQFiberThreeCarrierFiniteNoAlternatingCapPhaseIngress

/-!
# Source-total contract ingress for the FreshThird carrier query

This module is the production-facing bridge for a finite certificate over the
compact three-phase cap representation.  A source configuration supplies cap
non-alternation and the relational quotient laws, hence it supplies the phase
witness required by such a certificate.  The resulting ordinary query contract
lands in the existing arbitrary-cardinality FreshThird boundary consumer.

This bridge contains no finite certificate and closes no obligation by itself.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

open scoped EuclideanGeometry
open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover
open Census554.GeneralCarrierBridge

namespace FreshThirdQFiberThreeCarrierFiniteView

/-- Replay contract for a source-total finite query whose auxiliary variables
encode the three-phase form of cap non-alternation. -/
structure ThreePhaseQueryContract : Prop where
  reject : ∀ Config : Configuration,
    CompleteSourceTheory Config →
      Nonempty Config.assignment.ThreePhaseCapRepresentation → False

/-- A certificate rejecting every phase-augmented source configuration rejects
every configuration admitted by the existing complete carrier query. -/
theorem ThreePhaseQueryContract.toQueryContract
    (Contract : ThreePhaseQueryContract) : QueryContract where
  reject Config hSource := by
    apply Contract.reject Config hSource
    exact
      (FreshThirdQFiberThreeCarrierFiniteAssignment.nonempty_threePhaseCapRepresentation_iff_noAlternatingCap
        hSource.relational).2
        hSource.rowTheory.cap_no_alternation

end FreshThirdQFiberThreeCarrierFiniteView

/-- Public name for the source-total three-phase replay contract. -/
abbrev FreshThirdQFiberThreeCarrierThreePhaseQueryContract :=
  FreshThirdQFiberThreeCarrierFiniteView.ThreePhaseQueryContract

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

/-- Public arbitrary-cardinality landing theorem for a compact three-phase
carrier-query certificate. -/
theorem FreshThirdQFiberThreeBoundary.false_of_carrierFiniteThreePhaseQueryContract
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (G : TriApexAllLargeContext D S)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q)
    (Pinned : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (Contract : FreshThirdQFiberThreeCarrierThreePhaseQueryContract) : False :=
  FreshThirdQFiberThreeBoundary.false_of_carrierFiniteQueryContract
    P Pρ Packet G Boundary Pinned Contract.toQueryContract

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
