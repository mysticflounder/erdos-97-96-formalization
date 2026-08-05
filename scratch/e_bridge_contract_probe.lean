import Erdos9796Proof.P97.ATail.FrontierLiveClosure

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open Census554.GeneralCarrierBridge
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointCollisionLocalization
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedMatchingGeometricReduction

theorem endpointFresh_sharedBlocker_same_side_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAX :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A)
    (hoA : S.oppApex1 ∈ D.A)
    (B : BoundaryIndexing D.A)
    (hC :
      SurplusCOMPGBank.btw
        (B.indexOf
          ⟨S.oppApex1, hoA⟩)
        (B.indexOf (H.blockerVertex E.fiber.source₁))
        (B.indexOf ⟨Q.C, Q.fiber_orientation.left_mem_A⟩))
    (hJ :
      SurplusCOMPGBank.btw
        (B.indexOf
          ⟨S.oppApex1, hoA⟩)
        (B.indexOf (H.blockerVertex E.fiber.source₁))
        (B.indexOf ⟨Q.J, Q.J_mem_A⟩)) :
    False := by
  have hAlt := endpointFresh_sharedBlocker_pair_alternates
    Q K_mem_J_shell hAX B
  exact (hAlt.mp hC) hJ

end ATailFrontierLiveClosure
end Problem97
