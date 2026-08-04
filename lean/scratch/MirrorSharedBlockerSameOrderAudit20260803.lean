import Erdos9796Proof.P97.ATail.FrontierLiveClosure

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

private theorem audit_oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem audit_oppApex1_eq_oppositeVertex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

/-- The strongest unconditional localization inherited from the upstream
all-large context: the common endpoint blocker is in some strict cap, but the
index is not identified. -/
theorem audit_commonEndpointBlocker_exists_capInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk) :
    ∃ i : Fin 3,
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ∈
        S.capInteriorByIndex i := by
  exact
    exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge
      C.allLarge E.fiber.source₁.2

/-- A left-adjacent `J` is either the one unresolved outer triangle endpoint
or is already in the strict adjacent interior. -/
theorem audit_J_leftOuter_or_leftAdjacentInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (hJLeft : Q.J ∈ S.leftAdjacentCapByIndex S.oppIndex1) :
    Q.J = S.leftOuterVertexByIndex S.oppIndex1 ∨
      Q.J ∈ S.leftAdjacentInteriorByIndex S.oppIndex1 := by
  by_cases houter : Q.J = S.leftOuterVertexByIndex S.oppIndex1
  · exact Or.inl houter
  · refine Or.inr (S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
      S.oppIndex1 F.radius_pos ?_ hJLeft houter)
    simpa only [← audit_oppApex1_eq_oppositeVertex S] using Q.J_mem_radius

/-- Right-adjacent analogue of the exact endpoint frontier. -/
theorem audit_J_rightOuter_or_rightAdjacentInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (hJRight : Q.J ∈ S.rightAdjacentCapByIndex S.oppIndex1) :
    Q.J = S.rightOuterVertexByIndex S.oppIndex1 ∨
      Q.J ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
  by_cases houter : Q.J = S.rightOuterVertexByIndex S.oppIndex1
  · exact Or.inl houter
  · refine Or.inr (S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
      S.oppIndex1 F.radius_pos ?_ hJRight houter)
    simpa only [← audit_oppApex1_eq_oppositeVertex S] using Q.J_mem_radius

/-- The closest named-cap localization route.  It needs precisely the fact
missing from the fresh endpoint: `K` lies on the retained first-apex radius. -/
theorem audit_commonEndpointBlocker_mem_firstCapInterior_of_K_mem_radius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (hKRadius : Q.K ∈ SelectedClass D.A S.oppApex1 radius) :
    H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ∈
      S.capInteriorByIndex S.oppIndex1 := by
  have hCI : Q.C ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [Q.C_eq_fiber_source₁, E.fiber_source₁_eq_first, C.walk_first_eq]
    exact O.kept_mem_capInterior
  have hKI : Q.K ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [Q.K_eq_fiber_source₂, E.fiber_source₂_eq_next, C.walk_next_eq]
    exact C.fresh_mem_capInterior
  have hcenterA :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ∈ D.A := by
    exact (H.blockerVertex E.fiber.source₁).2
  have hcenterNe :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ≠
        S.oppositeVertexByIndex S.oppIndex1 := by
    simpa only [← audit_oppApex1_eq_oppositeVertex S] using
      E.fiber.commonBlocker_ne_firstApex
  have hphysical : dist S.oppApex1 Q.C = dist S.oppApex1 Q.K :=
    (mem_selectedClass.mp Q.C_mem_radius).2.trans
      (mem_selectedClass.mp hKRadius).2.symm
  exact
    ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_capInteriorByIndex
      S.oppIndex1 hcenterA hcenterNe hCI hKI Q.fiber_orientation.ne
      Q.fiber_orientation.commonBlocker_equidistant (by
        simpa only [← audit_oppApex1_eq_oppositeVertex S] using hphysical)

/-- Audit reduction shared by both adjacent-cap leaves.  The cap side is
irrelevant once a boundary indexing puts `C` and `J` on the same side of the
ordered pair consisting of the first apex and the common blocker. -/
theorem false_of_endpointFresh_sharedBlocker_of_exists_same_btw
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
    (hsame :
      ∃ B : BoundaryIndexing D.A,
        SurplusCOMPGBank.btw
            (B.indexOf
              ⟨S.oppApex1, audit_oppApex1_mem_A S⟩)
            (B.indexOf (H.blockerVertex E.fiber.source₁))
            (B.indexOf ⟨Q.C, Q.fiber_orientation.left_mem_A⟩) ↔
          SurplusCOMPGBank.btw
            (B.indexOf
              ⟨S.oppApex1, audit_oppApex1_mem_A S⟩)
            (B.indexOf (H.blockerVertex E.fiber.source₁))
            (B.indexOf ⟨Q.J, Q.J_mem_A⟩)) :
    False := by
  rcases hsame with ⟨B, hsame⟩
  have halt :=
    endpointFresh_sharedBlocker_pair_alternates Q K_mem_J_shell hAX B
  by_cases hC :
      SurplusCOMPGBank.btw
        (B.indexOf ⟨S.oppApex1, audit_oppApex1_mem_A S⟩)
        (B.indexOf (H.blockerVertex E.fiber.source₁))
        (B.indexOf ⟨Q.C, Q.fiber_orientation.left_mem_A⟩)
  · exact (halt.mp hC) (hsame.mp hC)
  · apply hC
    apply halt.mpr
    intro hJ
    exact hC (hsame.mpr hJ)

/-- The exact side-parametric reduction: neither the left/right choice nor the
closed-cap placement is used after the missing same-order fact is supplied. -/
theorem mirror_adjacent_sharedBlocker_leaf_reduces_to_exists_same_btw
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
    (_hJOutside : Q.J ∉ S.capInteriorByIndex S.oppIndex1)
    (_hJAdjacent :
      Q.J ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∨
        Q.J ∈ S.rightAdjacentCapByIndex S.oppIndex1)
    (hsame :
      ∃ B : BoundaryIndexing D.A,
        SurplusCOMPGBank.btw
            (B.indexOf
              ⟨S.oppApex1, audit_oppApex1_mem_A S⟩)
            (B.indexOf (H.blockerVertex E.fiber.source₁))
            (B.indexOf ⟨Q.C, Q.fiber_orientation.left_mem_A⟩) ↔
          SurplusCOMPGBank.btw
            (B.indexOf
              ⟨S.oppApex1, audit_oppApex1_mem_A S⟩)
            (B.indexOf (H.blockerVertex E.fiber.source₁))
            (B.indexOf ⟨Q.J, Q.J_mem_A⟩)) :
    False := by
  exact
    false_of_endpointFresh_sharedBlocker_of_exists_same_btw
      Q K_mem_J_shell hAX hsame

end ATailFrontierLiveClosure
end Problem97
