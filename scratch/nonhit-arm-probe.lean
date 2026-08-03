import Erdos9796Proof.P97.ATail.FrontierLiveClosure

namespace Problem97.ATailFrontierLiveClosure
open scoped EuclideanGeometry
open ATailSurvivalCover
open TwoSourceExactCollisionRowsTerminal
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailBlockerMultiplicityGeometry

#check FreshThirdCapSourceNonHit
#check FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit
#check cross_deletion_survives_iff_not_mem_selected_support
#check false_of_twoCapSources_sameBlockerAllEndpointOmission
#check false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual
#print axioms false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual
#print axioms allCollisionEndpointsOmitted_of_equalCenterHits
#print axioms commonCollisionEndpointOmission_of_equalCenterHits
#print axioms false_of_twoCapSources_sameBlockerAllEndpointOmission
#print axioms false_of_twoCapSources_freshOutsideFirstBlockerFiber
#print axioms false_of_twoCapSources_freshThirdBlockerFiber_core
#print axioms FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit
#print axioms cross_deletion_survives_iff_not_mem_selected_support

/- A bounded arm probe: the first non-hit packet can be destructed into only
   same-blocker equality/support or a single source-row omission plus deletion
   survival.  No existing terminal has this packet as its input. -/
example {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hcase : FreshThirdNormalizedResidualCase P Pρ C Q) : True := by
  rcases hcase with hcase | hcase | hcase
  · cases hcase with
    | sameBlocker center_eq support_eq =>
        trivial
    | sourceRowOmission deleted deleted_eq deleted_not_mem deletion_survives =>
        have _survival := deletion_survives
        trivial
  · cases hcase with
    | sameBlocker center_eq support_eq =>
        trivial
    | sourceRowOmission deleted deleted_eq deleted_not_mem deletion_survives =>
        have _survival := deletion_survives
        trivial
  · trivial

end Problem97.ATailFrontierLiveClosure
