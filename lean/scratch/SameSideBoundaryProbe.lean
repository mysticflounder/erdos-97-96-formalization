import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-! Off-spine probe.  The two endpoint terminal signatures already expose the
opposite-side (alternating) relation for `C,J`; no same-side relation follows. -/

open scoped EuclideanGeometry

namespace Problem97
open ATailFrontierLiveClosure
open ATailOrientedPhysicalApexIngress
open ATailCriticalPairFrontier
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedMatchingEndpointCollisionLocalization
open Census554
open Census554.GeneralCarrierBridge

theorem probe_terminal_signatures_force_alternation
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
    (hOpp : S.oppApex1 ∈ D.A)
    (B : BoundaryIndexing D.A) :
    SurplusCOMPGBank.btw
        (B.indexOf ⟨S.oppApex1, hOpp⟩)
        (B.indexOf (H.blockerVertex E.fiber.source₁))
        (B.indexOf ⟨Q.C, Q.fiber_orientation.left_mem_A⟩) ↔
      ¬ SurplusCOMPGBank.btw
        (B.indexOf ⟨S.oppApex1, hOpp⟩)
        (B.indexOf (H.blockerVertex E.fiber.source₁))
        (B.indexOf ⟨Q.J, Q.J_mem_A⟩) := by
  simpa using endpointFresh_sharedBlocker_pair_alternates Q K_mem_J_shell hAX B

/- A same-side assertion has the same two centers and points, but is not
derivable: combined with the forced alternation it is contradictory. -/
theorem probe_same_side_would_be_inconsistent
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
    (hOpp : S.oppApex1 ∈ D.A)
    (B : BoundaryIndexing D.A)
    (hSame :
      SurplusCOMPGBank.btw
          (B.indexOf ⟨S.oppApex1, hOpp⟩)
          (B.indexOf (H.blockerVertex E.fiber.source₁))
          (B.indexOf ⟨Q.C, Q.fiber_orientation.left_mem_A⟩) ↔
        SurplusCOMPGBank.btw
          (B.indexOf ⟨S.oppApex1, hOpp⟩)
          (B.indexOf (H.blockerVertex E.fiber.source₁))
          (B.indexOf ⟨Q.J, Q.J_mem_A⟩)) :
    False := by
  have hAlt := probe_terminal_signatures_force_alternation Q K_mem_J_shell hAX hOpp B
  by_cases hC :
      SurplusCOMPGBank.btw
        (B.indexOf ⟨S.oppApex1, hOpp⟩)
        (B.indexOf (H.blockerVertex E.fiber.source₁))
        (B.indexOf ⟨Q.C, Q.fiber_orientation.left_mem_A⟩)
  · exact (hAlt.mp hC) (hSame.mp hC)
  · have hNotJ : ¬ SurplusCOMPGBank.btw
          (B.indexOf ⟨S.oppApex1, hOpp⟩)
          (B.indexOf (H.blockerVertex E.fiber.source₁))
          (B.indexOf ⟨Q.J, Q.J_mem_A⟩) := by
      intro hJ
      exact hC (hSame.mpr hJ)
    exact hC (hAlt.mpr hNotJ)

end Problem97
