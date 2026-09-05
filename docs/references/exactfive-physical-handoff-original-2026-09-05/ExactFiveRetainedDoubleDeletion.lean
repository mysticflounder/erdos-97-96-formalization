/-
Draft for the source snapshot
493b88dad29f68d5f7dfe35bd3d5e17cd492be33.

Complete proof-script candidate; NOT elaborated in this environment.
This module does not claim the physical exact-five contradiction.
-/
import Erdos9796Proof.P97.ATail.ExactFiveDistinctSecondApexSourceSwap
import Erdos9796Proof.P97.ATail.ThreeCenterCommonDeletion

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveRetainedDoubleDeletion

open ATailCriticalPairFrontier
open ATailCommonDeletionTwoCenter
open ExactFiveDistinctThreeCenterContinuation
open ExactFiveDistinctSecondApexSourceSwap
open FirstApexUniqueRadiusResidual

/-- Select a four-row while preserving both erasures literally. -/
theorem exists_selectedFourClass_of_doubleDeletion
    {A : Finset ℝ²} {d a center : ℝ²}
    (hdouble :
      HasNEquidistantPointsAt 4 ((A.erase d).erase a) center) :
    ∃ K : SelectedFourClass A center,
      K.support ⊆ (A.erase d).erase a ∧
      d ∉ K.support ∧ a ∉ K.support := by
  classical
  obtain ⟨rho, hrho, hfour⟩ :=
    exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hdouble
  obtain ⟨B, hBsub, hBcard⟩ :=
    Finset.exists_subset_card_eq
      (s := SelectedClass ((A.erase d).erase a) center rho) hfour
  have hBE : B ⊆ (A.erase d).erase a := by
    intro z hz
    exact (mem_selectedClass.mp (hBsub hz)).1
  let K : SelectedFourClass A center := {
    support := B
    support_subset_A := by
      intro z hz
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase (hBE hz))
    support_card := hBcard
    radius := rho
    radius_pos := hrho
    support_eq_radius := by
      intro z hz
      exact (mem_selectedClass.mp (hBsub hz)).2
    center_not_mem := by
      intro hcenter
      have hdist : dist center center = rho :=
        (mem_selectedClass.mp (hBsub hcenter)).2
      have hzero : rho = 0 := by simpa using hdist.symm
      exact (ne_of_gt hrho) hzero }
  refine ⟨K, hBE, ?_, ?_⟩
  · intro hd
    have hdErase : d ∈ A.erase d :=
      Finset.mem_of_mem_erase (hBE hd)
    exact (Finset.ne_of_mem_erase hdErase) rfl
  · intro ha
    exact (Finset.ne_of_mem_erase (hBE ha)) rfl

/-- The normal form's original source pair retains simultaneous second-apex
survival, irrespective of the arbitrary row stored in the normal form. -/
theorem secondApex_doubleDeletion_of_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    HasNEquidistantPointsAt 4
      ((D.A.erase deleted).erase N.retained) S.oppApex2 := by
  rcases N.orientation with ⟨hd, ha, _⟩ | ⟨hd, ha, _⟩
  · simpa only [hd, ha, Finset.erase_right_comm] using
      R.interior.frontier.secondApexDouble
  · simpa only [hd, ha] using R.interior.frontier.secondApexDouble

/-- The physical row-existence disjunct holds for every exact-five normal form;
no retained-source membership in the old second row is needed. -/
theorem exists_secondApex_row_omitting_originalPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    ∃ K : SelectedFourClass D.A S.oppApex2,
      N.retained ∉ K.support ∧ deleted ∉ K.support := by
  obtain ⟨K, _, hd, ha⟩ :=
    exists_selectedFourClass_of_doubleDeletion
      (secondApex_doubleDeletion_of_normalForm N)
  exact ⟨K, ha, hd⟩

/-- A hard-swap record does not assert that its two named radii are exhaustive.
The retained double-deletion witness forces a third complete four-point class. -/
theorem exists_third_full_radius_of_hardSourceSwap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    (P : ExactFiveDistinctSecondApexHardSourceSwap R C N) :
    ∃ T : SelectedFourClass D.A S.oppApex2,
      T.support = SelectedClass D.A S.oppApex2 T.radius ∧
      T.radius ≠ N.secondApexClass.radius ∧
      T.radius ≠ P.replacement.radius ∧
      Disjoint T.support N.secondApexClass.support ∧
      Disjoint T.support P.replacement.support ∧
      deleted ∉ T.support ∧ N.retained ∉ T.support := by
  classical
  obtain ⟨T, _, hdT, haT⟩ :=
    exists_selectedFourClass_of_doubleDeletion
      (secondApex_doubleDeletion_of_normalForm N)
  have hTsub : T.support ⊆ SelectedClass D.A S.oppApex2 T.radius := by
    intro z hz
    exact mem_selectedClass.mpr
      ⟨T.support_subset_A hz, T.support_eq_radius z hz⟩
  have hTfull :
      T.support = SelectedClass D.A S.oppApex2 T.radius := by
    apply Finset.eq_of_subset_of_card_le hTsub
    have hsmall := P.every_positive_class_small T.radius T.radius_pos
    rw [T.support_card]
    omega
  have hOld : T.radius ≠ N.secondApexClass.radius := by
    intro hEq
    apply haT
    rw [hTfull, hEq, ← P.old_full]
    exact P.retained_mem_old
  have hReplacement : T.radius ≠ P.replacement.radius := by
    intro hEq
    apply hdT
    rw [hTfull, hEq, ← P.replacement_full]
    exact P.deleted_mem_replacement
  have hDisjointOld : Disjoint T.support N.secondApexClass.support := by
    rw [Finset.disjoint_left]
    intro z hzT hzOld
    exact hOld ((T.support_eq_radius z hzT).symm.trans
      (N.secondApexClass.support_eq_radius z hzOld))
  have hDisjointReplacement : Disjoint T.support P.replacement.support := by
    rw [Finset.disjoint_left]
    intro z hzT hzReplacement
    exact hReplacement ((T.support_eq_radius z hzT).symm.trans
      (P.replacement.support_eq_radius z hzReplacement))
  exact ⟨T, hTfull, hOld, hReplacement, hDisjointOld,
    hDisjointReplacement, hdT, haT⟩


/-- Replace the second selected row without changing the source, centers,
first support, first deleted row, or actual-blocker identities. -/
noncomputable def replaceSecondRow
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted blocker secondApex : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker secondApex)
    (K : SelectedFourClass D.A secondApex)
    (hdK : deleted ∉ K.support) :
    CommonDeletionTwoCenterPacket D H deleted blocker secondApex where
  q_mem_A := C.q_mem_A
  center₁_mem_A := C.center₁_mem_A
  center₂_mem_A := C.center₂_mem_A
  centers_ne := C.centers_ne
  survives₁ := C.survives₁
  survives₂ := ATailDeletionRobustness.selectedFourClass_survives_erase_of_not_mem K hdK
  actual_blocker_ne_center₁ := C.actual_blocker_ne_center₁
  actual_blocker_ne_center₂ := C.actual_blocker_ne_center₂
  B₁ := C.B₁
  B₂ := K.support
  row₁ := C.row₁
  row₂ := ATailThreeCenterCommonDeletion.qDeletedK4ClassOfSelectedFourClass K hdK
  B₁_card := C.B₁_card
  B₂_card := K.support_card
  overlap_le_two :=
    U5QDeletedK4Class.inter_card_le_two C.row₁
      (ATailThreeCenterCommonDeletion.qDeletedK4ClassOfSelectedFourClass K hdK)
      C.centers_ne

/-- Rebuild the physical normal form around a row omitting both original
sources. The weak `fresh` field is deliberately set to the original deletion.
The strict-source producer must subsequently select a new source or return
the existing tight-cover alternative; the old fresh source is not reused. -/
noncomputable def physicalNormalFormWithSecondRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (K : SelectedFourClass D.A S.oppApex2)
    (hdK : deleted ∉ K.support) (haK : N.retained ∉ K.support) :
    ExactFiveDistinctThreeCenterNormalForm R (replaceSecondRow C K hdK) := by
  classical
  have hdFirst : deleted ∉ N.firstApexClass.support := by
    rw [N.firstApexClass_support_eq]
    simp
  have hdBlocker : deleted ∉ N.blockerClass.support := by
    rw [N.blockerClass_support_eq]
    exact C.row₁.q_not_mem
  let sourcePacket :=
    (ATailThreeCenterCommonDeletion.nonempty_threeCenterCommonDeletionExactRows_of_omitted_selectedFourClasses
      C.q_mem_A N.freshThreeCenter.center₀_mem_A
      N.freshThreeCenter.center₁_mem_A N.freshThreeCenter.center₂_mem_A
      N.freshThreeCenter.center₀_ne_center₁
      N.freshThreeCenter.center₀_ne_center₂
      N.freshThreeCenter.center₁_ne_center₂
      N.firstApexClass N.blockerClass K hdFirst hdBlocker hdK).some
  let retainedPacket :=
    (nonempty_commonDeletionTwoCenterPacket_of_fullyDeletionRobustAt_and_omitted_selectedFourClass
      H N.retained_mem_A N.freshThreeCenter.center₀_mem_A
      N.freshThreeCenter.center₂_mem_A N.freshThreeCenter.center₀_ne_center₂
      R.firstApex_fullyDeletionRobust K haK).some
  exact {
    secondApex_robust := N.secondApex_robust
    retained := N.retained
    retained_mem_A := N.retained_mem_A
    orientation := N.orientation
    firstApexClass := N.firstApexClass
    firstApexClass_support_eq := N.firstApexClass_support_eq
    blockerClass := N.blockerClass
    blockerClass_support_eq := N.blockerClass_support_eq
    secondApexClass := K
    secondApexClass_support_eq := rfl
    retained_mem_firstApexClass := N.retained_mem_firstApexClass
    retained_mem_blockerClass := N.retained_mem_blockerClass
    fresh := deleted
    freshThreeCenter := sourcePacket
    alternative := .physical haK retainedPacket }

/-- Every old normal form can be replaced by a physical one with the same
retained source and the same first and blocker rows. -/
theorem exists_physicalNormalForm_reselection
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    ∃ C' : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2,
      ∃ N' : ExactFiveDistinctThreeCenterNormalForm R C',
        N'.retained = N.retained ∧
        N'.firstApexClass.support = N.firstApexClass.support ∧
        N'.blockerClass.support = N.blockerClass.support ∧
        N'.retained ∉ N'.secondApexClass.support := by
  obtain ⟨K, _, hdK, haK⟩ :=
    exists_selectedFourClass_of_doubleDeletion
      (secondApex_doubleDeletion_of_normalForm N)
  exact ⟨replaceSecondRow C K hdK,
    physicalNormalFormWithSecondRow N K hdK haK, rfl, rfl, rfl, haK⟩

end ExactFiveRetainedDoubleDeletion
end Problem97

#print axioms Problem97.ExactFiveRetainedDoubleDeletion.exists_selectedFourClass_of_doubleDeletion
#print axioms Problem97.ExactFiveRetainedDoubleDeletion.secondApex_doubleDeletion_of_normalForm
#print axioms Problem97.ExactFiveRetainedDoubleDeletion.exists_secondApex_row_omitting_originalPair
#print axioms Problem97.ExactFiveRetainedDoubleDeletion.exists_third_full_radius_of_hardSourceSwap

#print axioms Problem97.ExactFiveRetainedDoubleDeletion.exists_physicalNormalForm_reselection
