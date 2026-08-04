import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Post-v37 mixed-overlap endpoint adapter audit

Scratch-only proof experiment for the retained-omission endpoint leaves.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointContinuation

/-
Scratch-only audit: the live left-adjacent-cap singleton localizes any supplied
two-hit branch row to the exact mixed overlap `{J, x}` with `x` outside the cap.
The extra `Kb`/membership/two-hit inputs below are deliberately explicit: the
current endpoint leaf does not yet produce them.
-/
theorem audit_exactMixedOverlap_left_of_suppliedBranchRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (hJLeft : Q.J ∈ S.leftAdjacentCapByIndex S.oppIndex1)
    {b : ℝ²} (Kb : SelectedFourClass D.A b)
    (hAb : S.oppApex1 ≠ b)
    (hJb : Q.J ∈ Kb.support)
    (htwo : 2 ≤ (Q.row.support ∩ Kb.support).card) :
    ∃ x,
      x ∉ S.leftAdjacentCapByIndex S.oppIndex1 ∧
      Q.row.support ∩ Kb.support = {Q.J, x} ∧
      (Q.row.support \ S.leftAdjacentCapByIndex S.oppIndex1) ∩
          (Kb.support \ S.leftAdjacentCapByIndex S.oppIndex1) = {x} := by
  classical
  have hphysical :=
    endpointFresh_frontierRadiusClass_inter_leftAdjacentCap_eq_singleton
      Q hJLeft
  have hrowSub :
      Q.row.support ⊆ SelectedClass D.A S.oppApex1 radius := by
    intro z hz
    exact mem_selectedClass.mpr
      ⟨Q.row.support_subset_A hz,
        (Q.row.support_eq_radius z hz).trans Q.row_radius_eq⟩
  have hcap :
      Q.row.support ∩ S.leftAdjacentCapByIndex S.oppIndex1 = {Q.J} := by
    apply Finset.Subset.antisymm
    · intro z hz
      have hzPhysical :
          z ∈ SelectedClass D.A S.oppApex1 radius ∩
            S.leftAdjacentCapByIndex S.oppIndex1 :=
        Finset.mem_inter.mpr ⟨hrowSub (Finset.mem_inter.mp hz).1,
          (Finset.mem_inter.mp hz).2⟩
      simpa [hphysical] using hzPhysical
    · intro z hz
      have hzJ : z = Q.J := Finset.mem_singleton.mp hz
      subst z
      exact Finset.mem_inter.mpr ⟨Q.J_mem_row, hJLeft⟩
  exact SelectedFourClass.exact_overlap_of_cap_singleton
    Q.row Kb hAb hcap (Finset.mem_inter.mpr ⟨Q.J_mem_row, hJb⟩) htwo

theorem audit_exactMixedOverlap_right_of_suppliedBranchRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (hJRight : Q.J ∈ S.rightAdjacentCapByIndex S.oppIndex1)
    {b : ℝ²} (Kb : SelectedFourClass D.A b)
    (hAb : S.oppApex1 ≠ b)
    (hJb : Q.J ∈ Kb.support)
    (htwo : 2 ≤ (Q.row.support ∩ Kb.support).card) :
    ∃ x,
      x ∉ S.rightAdjacentCapByIndex S.oppIndex1 ∧
      Q.row.support ∩ Kb.support = {Q.J, x} ∧
      (Q.row.support \ S.rightAdjacentCapByIndex S.oppIndex1) ∩
          (Kb.support \ S.rightAdjacentCapByIndex S.oppIndex1) = {x} := by
  classical
  have hphysical :=
    endpointFresh_frontierRadiusClass_inter_rightAdjacentCap_eq_singleton
      Q hJRight
  have hrowSub :
      Q.row.support ⊆ SelectedClass D.A S.oppApex1 radius := by
    intro z hz
    exact mem_selectedClass.mpr
      ⟨Q.row.support_subset_A hz,
        (Q.row.support_eq_radius z hz).trans Q.row_radius_eq⟩
  have hcap :
      Q.row.support ∩ S.rightAdjacentCapByIndex S.oppIndex1 = {Q.J} := by
    apply Finset.Subset.antisymm
    · intro z hz
      have hzPhysical :
          z ∈ SelectedClass D.A S.oppApex1 radius ∩
            S.rightAdjacentCapByIndex S.oppIndex1 :=
        Finset.mem_inter.mpr ⟨hrowSub (Finset.mem_inter.mp hz).1,
          (Finset.mem_inter.mp hz).2⟩
      simpa [hphysical] using hzPhysical
    · intro z hz
      have hzJ : z = Q.J := Finset.mem_singleton.mp hz
      subst z
      exact Finset.mem_inter.mpr ⟨Q.J_mem_row, hJRight⟩
  exact SelectedFourClass.exact_overlap_of_cap_singleton
    Q.row Kb hAb hcap (Finset.mem_inter.mpr ⟨Q.J_mem_row, hJb⟩) htwo

/- The stronger fact in the current source: the shared-blocker shell itself is
the branch row, and the second shared point is already the named endpoint `C`.
-/
theorem audit_live_exactMixedOverlap_left
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
    (hJLeft : Q.J ∈ S.leftAdjacentCapByIndex S.oppIndex1) :
    let KB :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell.toSelectedFourClass
    Q.C ∉ S.leftAdjacentCapByIndex S.oppIndex1 ∧
      Q.row.support ∩ KB.support = {Q.J, Q.C} := by
  classical
  let KB :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell.toSelectedFourClass
  change Q.C ∉ S.leftAdjacentCapByIndex S.oppIndex1 ∧
    Q.row.support ∩ KB.support = {Q.J, Q.C}
  have hphysical :=
    endpointFresh_frontierRadiusClass_inter_leftAdjacentCap_eq_singleton
      Q hJLeft
  have hCClass : Q.C ∈ SelectedClass D.A S.oppApex1 radius := Q.C_mem_radius
  have hCOutside : Q.C ∉ S.leftAdjacentCapByIndex S.oppIndex1 := by
    intro hCLeft
    have hCInter :
        Q.C ∈ SelectedClass D.A S.oppApex1 radius ∩
          S.leftAdjacentCapByIndex S.oppIndex1 :=
      Finset.mem_inter.mpr ⟨hCClass, hCLeft⟩
    rw [hphysical] at hCInter
    exact Q.J_ne_C (Finset.mem_singleton.mp hCInter).symm
  refine ⟨hCOutside, ?_⟩
  have hinter :=
    endpointFresh_commonSupport_inter_firstApexRow_eq_pair_of_sharedBlocker
      Q K_mem_J_shell hAX
  simpa [KB, CriticalFourShell.toSelectedFourClass, Finset.inter_comm,
    Finset.pair_comm] using hinter

theorem audit_live_exactMixedOverlap_right
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
    (hJRight : Q.J ∈ S.rightAdjacentCapByIndex S.oppIndex1) :
    let KB :=
      (H.selectedAt E.fiber.source₁.1
        E.fiber.source₁.2).toCriticalFourShell.toSelectedFourClass
    Q.C ∉ S.rightAdjacentCapByIndex S.oppIndex1 ∧
      Q.row.support ∩ KB.support = {Q.J, Q.C} := by
  classical
  let KB :=
    (H.selectedAt E.fiber.source₁.1
      E.fiber.source₁.2).toCriticalFourShell.toSelectedFourClass
  change Q.C ∉ S.rightAdjacentCapByIndex S.oppIndex1 ∧
    Q.row.support ∩ KB.support = {Q.J, Q.C}
  have hphysical :=
    endpointFresh_frontierRadiusClass_inter_rightAdjacentCap_eq_singleton
      Q hJRight
  have hCClass : Q.C ∈ SelectedClass D.A S.oppApex1 radius := Q.C_mem_radius
  have hCOutside : Q.C ∉ S.rightAdjacentCapByIndex S.oppIndex1 := by
    intro hCRight
    have hCInter :
        Q.C ∈ SelectedClass D.A S.oppApex1 radius ∩
          S.rightAdjacentCapByIndex S.oppIndex1 :=
      Finset.mem_inter.mpr ⟨hCClass, hCRight⟩
    rw [hphysical] at hCInter
    exact Q.J_ne_C (Finset.mem_singleton.mp hCInter).symm
  refine ⟨hCOutside, ?_⟩
  have hinter :=
    endpointFresh_commonSupport_inter_firstApexRow_eq_pair_of_sharedBlocker
      Q K_mem_J_shell hAX
  simpa [KB, CriticalFourShell.toSelectedFourClass, Finset.inter_comm,
    Finset.pair_comm] using hinter

#print axioms audit_exactMixedOverlap_left_of_suppliedBranchRow
#print axioms audit_exactMixedOverlap_right_of_suppliedBranchRow
#print axioms audit_live_exactMixedOverlap_left
#print axioms audit_live_exactMixedOverlap_right

end ATailFrontierLiveClosure
end Problem97
