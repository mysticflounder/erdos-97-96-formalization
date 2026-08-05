import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-! Off-spine package of the strongest source-clean mixed-placement facts
available in the shared-blocker endpoint branch. -/

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

theorem probe_sharedBlocker_mixed_packet
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
    (hJOutside : Q.J ∉ S.capInteriorByIndex S.oppIndex1)
    (hOpp : S.oppApex1 ∈ D.A)
    (B : BoundaryIndexing D.A) :
    let KA :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell
    (KA.support ∩ Q.row.support = {Q.C, Q.J} ∧
      Q.K ∉ Q.row.support ∧
      ∃! L : ℝ²,
        L ∉ ({Q.C, Q.K, Q.J} : Finset ℝ²) ∧
        KA.support = {Q.C, Q.K, Q.J, L} ∧
        L ∉ Q.row.support ∧
        L ≠ H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ∧
        L ≠ W.second) ∧
    Q.C ∈ S.capInteriorByIndex S.oppIndex1 ∧
    KA.support ∩ SelectedClass D.A S.oppApex1 radius = {Q.C, Q.J} ∧
    ((Q.J ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∧
        SelectedClass D.A S.oppApex1 radius ∩
          S.leftAdjacentCapByIndex S.oppIndex1 = {Q.J} ∧
        Q.C ∉ S.leftAdjacentCapByIndex S.oppIndex1) ∨
      (Q.J ∈ S.rightAdjacentCapByIndex S.oppIndex1 ∧
        SelectedClass D.A S.oppApex1 radius ∩
          S.rightAdjacentCapByIndex S.oppIndex1 = {Q.J} ∧
        Q.C ∉ S.rightAdjacentCapByIndex S.oppIndex1)) ∧
    (SurplusCOMPGBank.btw
        (B.indexOf ⟨S.oppApex1, hOpp⟩)
        (B.indexOf (H.blockerVertex E.fiber.source₁))
        (B.indexOf ⟨Q.C, Q.fiber_orientation.left_mem_A⟩) ↔
      ¬ SurplusCOMPGBank.btw
        (B.indexOf ⟨S.oppApex1, hOpp⟩)
        (B.indexOf (H.blockerVertex E.fiber.source₁))
        (B.indexOf ⟨Q.J, Q.J_mem_A⟩)) := by
  let KA :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell
  change
    (KA.support ∩ Q.row.support = {Q.C, Q.J} ∧
      Q.K ∉ Q.row.support ∧
      ∃! L : ℝ²,
        L ∉ ({Q.C, Q.K, Q.J} : Finset ℝ²) ∧
        KA.support = {Q.C, Q.K, Q.J, L} ∧
        L ∉ Q.row.support ∧
        L ≠ H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ∧
        L ≠ W.second) ∧
    Q.C ∈ S.capInteriorByIndex S.oppIndex1 ∧
    KA.support ∩ SelectedClass D.A S.oppApex1 radius = {Q.C, Q.J} ∧
    ((Q.J ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∧
        SelectedClass D.A S.oppApex1 radius ∩
          S.leftAdjacentCapByIndex S.oppIndex1 = {Q.J} ∧
        Q.C ∉ S.leftAdjacentCapByIndex S.oppIndex1) ∨
      (Q.J ∈ S.rightAdjacentCapByIndex S.oppIndex1 ∧
        SelectedClass D.A S.oppApex1 radius ∩
          S.rightAdjacentCapByIndex S.oppIndex1 = {Q.J} ∧
        Q.C ∉ S.rightAdjacentCapByIndex S.oppIndex1)) ∧
    (SurplusCOMPGBank.btw
        (B.indexOf ⟨S.oppApex1, hOpp⟩)
        (B.indexOf (H.blockerVertex E.fiber.source₁))
        (B.indexOf ⟨Q.C, Q.fiber_orientation.left_mem_A⟩) ↔
      ¬ SurplusCOMPGBank.btw
        (B.indexOf ⟨S.oppApex1, hOpp⟩)
        (B.indexOf (H.blockerVertex E.fiber.source₁))
        (B.indexOf ⟨Q.J, Q.J_mem_A⟩))
  have hFourth := endpointFresh_sharedBlocker_fourth_packet Q K_mem_J_shell hAX
  have hFourth' :
      KA.support ∩ Q.row.support = {Q.C, Q.J} ∧
        Q.K ∉ Q.row.support ∧
        ∃! L : ℝ²,
          L ∉ ({Q.C, Q.K, Q.J} : Finset ℝ²) ∧
          KA.support = {Q.C, Q.K, Q.J, L} ∧
          L ∉ Q.row.support ∧
          L ≠ H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 ∧
          L ≠ W.second := by
    simpa only [KA] using hFourth
  have hRadius :=
    endpointFresh_criticalShell_inter_frontierRadiusClass_eq_pair_of_sharedBlocker
      Q K_mem_J_shell hAX
  have hRadius' :
      KA.support ∩ SelectedClass D.A S.oppApex1 radius = {Q.C, Q.J} := by
    simpa only [KA] using hRadius
  have hCInterior : Q.C ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [Q.C_eq_fiber_source₁, E.fiber_source₁_eq_first]
    exact W.first_mem_capInterior
  have hSides :=
    EndpointFreshFirstApexRowSource.J_mem_leftAdjacentCap_or_rightAdjacentCap_of_not_mem_firstCapInterior
      Q hJOutside
  have hCapSingleton :
      (Q.J ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∧
          SelectedClass D.A S.oppApex1 radius ∩
            S.leftAdjacentCapByIndex S.oppIndex1 = {Q.J} ∧
          Q.C ∉ S.leftAdjacentCapByIndex S.oppIndex1) ∨
        (Q.J ∈ S.rightAdjacentCapByIndex S.oppIndex1 ∧
          SelectedClass D.A S.oppApex1 radius ∩
            S.rightAdjacentCapByIndex S.oppIndex1 = {Q.J} ∧
          Q.C ∉ S.rightAdjacentCapByIndex S.oppIndex1) := by
    rcases hSides with hLeft | hRight
    · have hSingleton :=
        endpointFresh_frontierRadiusClass_inter_leftAdjacentCap_eq_singleton
          Q hLeft
      have hCnot : Q.C ∉ S.leftAdjacentCapByIndex S.oppIndex1 := by
        intro hCleft
        have hCmem : Q.C ∈
            SelectedClass D.A S.oppApex1 radius ∩
              S.leftAdjacentCapByIndex S.oppIndex1 :=
          Finset.mem_inter.mpr ⟨Q.C_mem_radius, hCleft⟩
        rw [hSingleton] at hCmem
        have hEq : Q.C = Q.J := by simpa using hCmem
        exact Q.J_ne_C hEq.symm
      exact Or.inl ⟨hLeft, hSingleton, hCnot⟩
    · have hSingleton :=
        endpointFresh_frontierRadiusClass_inter_rightAdjacentCap_eq_singleton
          Q hRight
      have hCnot : Q.C ∉ S.rightAdjacentCapByIndex S.oppIndex1 := by
        intro hCright
        have hCmem : Q.C ∈
            SelectedClass D.A S.oppApex1 radius ∩
              S.rightAdjacentCapByIndex S.oppIndex1 :=
          Finset.mem_inter.mpr ⟨Q.C_mem_radius, hCright⟩
        rw [hSingleton] at hCmem
        have hEq : Q.C = Q.J := by simpa using hCmem
        exact Q.J_ne_C hEq.symm
      exact Or.inr ⟨hRight, hSingleton, hCnot⟩
  have hAlt := endpointFresh_sharedBlocker_pair_alternates Q K_mem_J_shell hAX B
  have hAlt' :
      SurplusCOMPGBank.btw
          (B.indexOf ⟨S.oppApex1, hOpp⟩)
          (B.indexOf (H.blockerVertex E.fiber.source₁))
          (B.indexOf ⟨Q.C, Q.fiber_orientation.left_mem_A⟩) ↔
        ¬ SurplusCOMPGBank.btw
          (B.indexOf ⟨S.oppApex1, hOpp⟩)
          (B.indexOf (H.blockerVertex E.fiber.source₁))
          (B.indexOf ⟨Q.J, Q.J_mem_A⟩) := by
    simpa using hAlt
  exact ⟨hFourth', hCInterior, hRadius', hCapSingleton, hAlt'⟩

end Problem97
