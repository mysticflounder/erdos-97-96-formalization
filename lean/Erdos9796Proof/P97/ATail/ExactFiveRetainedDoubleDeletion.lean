/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ApexRichClassStructure
import Erdos9796Proof.P97.ATail.ExactFiveDistinctSecondApexSourceSwap
import Erdos9796Proof.P97.ATail.PairedCommonDeletionNormalForm

/-!
# Retained double deletion for the exact-five physical route

The critical-pair frontier stores a simultaneous second-apex deletion witness
for the two original sources.  This module extracts a selected four-row from
that witness, replaces only the second row of the common-deletion packet, and
rebuilds the physical normal form.  Its weak fresh field is intentionally the
original deletion: consumers must run `nonempty_strictThreeCenterAlternative`
after replacement.

The hard source-swap packet does not say that its two displayed radii exhaust
the positive radius classes.  The same double-deletion witness produces a
third full class.  Consequently three disjoint radius slices force six points
in the second strict cap interior and at least fifteen carrier points.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveRetainedDoubleDeletion

open ATailCapApexRadiusRigidity
open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailPairedCommonDeletionNormalForm
open ATailThreeCenterCommonDeletion
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

/-- Distinct radii at one fixed center have disjoint selected supports. -/
theorem selectedFourClasses_disjoint_of_radius_ne
    {A : Finset ℝ²} {center : ℝ²}
    (K L : SelectedFourClass A center)
    (hne : K.radius ≠ L.radius) :
    Disjoint K.support L.support := by
  apply (selectedClass_disjoint_of_radius_ne hne).mono
  · intro z hz
    exact mem_selectedClass.mpr
      ⟨K.support_subset_A hz, K.support_eq_radius z hz⟩
  · intro z hz
    exact mem_selectedClass.mpr
      ⟨L.support_subset_A hz, L.support_eq_radius z hz⟩

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
  exact ⟨T, hTfull, hOld, hReplacement,
    selectedFourClasses_disjoint_of_radius_ne T N.secondApexClass hOld,
    selectedFourClasses_disjoint_of_radius_ne T P.replacement hReplacement,
    hdT, haT⟩

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
  survives₂ := selectedFourClass_survives_erase_of_not_mem K hdK
  actual_blocker_ne_center₁ := C.actual_blocker_ne_center₁
  actual_blocker_ne_center₂ := C.actual_blocker_ne_center₂
  B₁ := C.B₁
  B₂ := K.support
  row₁ := C.row₁
  row₂ := qDeletedK4ClassOfSelectedFourClass K hdK
  B₁_card := C.B₁_card
  B₂_card := K.support_card
  overlap_le_two :=
    U5QDeletedK4Class.inter_card_le_two C.row₁
      (qDeletedK4ClassOfSelectedFourClass K hdK) C.centers_ne

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
    (nonempty_threeCenterCommonDeletionExactRows_of_omitted_selectedFourClasses
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

/-- The rebuilt packet preserves the first row, retained source, and blocker
row; its second row is exactly the replacement support, and its weak fresh
source is reset before strict-source regeneration. -/
theorem physicalNormalFormWithSecondRow_sourceAudit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (K : SelectedFourClass D.A S.oppApex2)
    (hdK : deleted ∉ K.support) (haK : N.retained ∉ K.support) :
    (replaceSecondRow C K hdK).B₁ = C.B₁ ∧
      (physicalNormalFormWithSecondRow N K hdK haK).retained = N.retained ∧
      (physicalNormalFormWithSecondRow N K hdK haK).firstApexClass.support =
        N.firstApexClass.support ∧
      (physicalNormalFormWithSecondRow N K hdK haK).blockerClass.support =
        N.blockerClass.support ∧
      (physicalNormalFormWithSecondRow N K hdK haK).secondApexClass.support =
        K.support ∧
      (physicalNormalFormWithSecondRow N K hdK haK).fresh = deleted := by
  exact ⟨rfl, rfl, rfl, rfl, rfl, rfl⟩

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

/-- A selected four-class at the second opposite apex contributes at least two
points to the corresponding strict cap interior. -/
theorem selectedFourClass_secondCapInterior_card_ge_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (K : SelectedFourClass D.A S.oppApex2) :
    2 ≤ (SelectedClass D.A S.oppApex2 K.radius ∩
      S.capInteriorByIndex S.oppIndex2).card := by
  classical
  have hsub : K.support ⊆ SelectedClass D.A S.oppApex2 K.radius := by
    intro z hz
    exact mem_selectedClass.mpr
      ⟨K.support_subset_A hz, K.support_eq_radius z hz⟩
  have hfour : 4 ≤ (SelectedClass D.A S.oppApex2 K.radius).card := by
    have h := Finset.card_le_card hsub
    rwa [K.support_card] at h
  have hfour' :
      4 ≤ (SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex2) K.radius).card := by
    simpa using hfour
  have hcount :=
    S.selectedClass_capInteriorByIndex_card_ge_two D.convex S.oppIndex2
      K.radius_pos hfour'
  simpa using hcount

/-- A hard source-swap packet forces at least six points in the strict second
opposite-cap interior: two from each of three distinct full radius classes. -/
theorem hardSourceSwap_secondCapInterior_card_ge_six
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    (P : ExactFiveDistinctSecondApexHardSourceSwap R C N) :
    6 ≤ (S.capInteriorByIndex S.oppIndex2).card := by
  classical
  obtain ⟨T, hTfull, _, _, hTold, hTreplacement, _, _⟩ :=
    exists_third_full_radius_of_hardSourceSwap P
  let I := S.capInteriorByIndex S.oppIndex2
  have hOld := selectedFourClass_secondCapInterior_card_ge_two N.secondApexClass
  have hReplacement :=
    selectedFourClass_secondCapInterior_card_ge_two P.replacement
  have hThird := selectedFourClass_secondCapInterior_card_ge_two T
  rw [← P.old_full] at hOld
  rw [← P.replacement_full] at hReplacement
  rw [← hTfull] at hThird
  have hOldReplacement :
      Disjoint (N.secondApexClass.support ∩ I)
        (P.replacement.support ∩ I) :=
    P.supports_disjoint.mono Finset.inter_subset_left Finset.inter_subset_left
  have hOldThird :
      Disjoint (N.secondApexClass.support ∩ I) (T.support ∩ I) :=
    hTold.symm.mono Finset.inter_subset_left Finset.inter_subset_left
  have hReplacementThird :
      Disjoint (P.replacement.support ∩ I) (T.support ∩ I) :=
    hTreplacement.symm.mono Finset.inter_subset_left Finset.inter_subset_left
  have hUnionThird :
      Disjoint
        ((N.secondApexClass.support ∩ I) ∪ (P.replacement.support ∩ I))
        (T.support ∩ I) :=
    Finset.disjoint_union_left.mpr ⟨hOldThird, hReplacementThird⟩
  have hsub :
      ((N.secondApexClass.support ∩ I) ∪ (P.replacement.support ∩ I)) ∪
          (T.support ∩ I) ⊆ I :=
    Finset.union_subset
      (Finset.union_subset Finset.inter_subset_right Finset.inter_subset_right)
      Finset.inter_subset_right
  have hcard := Finset.card_le_card hsub
  rw [Finset.card_union_of_disjoint hUnionThird,
    Finset.card_union_of_disjoint hOldReplacement] at hcard
  change 2 ≤ (N.secondApexClass.support ∩ I).card at hOld
  change 2 ≤ (P.replacement.support ∩ I).card at hReplacement
  change 2 ≤ (T.support ∩ I).card at hThird
  change 6 ≤ I.card
  exact by omega

/-- A hard source-swap packet forces at least fifteen carrier points. -/
theorem hardSourceSwap_carrier_card_ge_fifteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    (P : ExactFiveDistinctSecondApexHardSourceSwap R C N) :
    15 ≤ D.A.card := by
  have hfirstInterior :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card :=
    ATailUniqueRowProducerScratch.firstApex_cardFive_interior_card_ge_three
      D S R.interior.frontier.radius_pos R.class_card_eq_five
  have hfirstInteriorCap :
      3 ≤ (S.capInteriorByIndex S.oppIndex1).card :=
    hfirstInterior.trans (Finset.card_le_card Finset.inter_subset_right)
  have hfirstCapSum :=
    capInteriorByIndex_card_add_two S S.oppIndex1
  have hfirstCapEq : S.capByIndex S.oppIndex1 = S.oppCap1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap1,
        SurplusCapPacket.oppIndex1, hi]
  rw [hfirstCapEq] at hfirstCapSum
  have hfirstCap : 5 ≤ S.oppCap1.card := by omega
  have hsecondInterior := hardSourceSwap_secondCapInterior_card_ge_six P
  have hsecondCapSum :=
    capInteriorByIndex_card_add_two S S.oppIndex2
  have hsecondCapEq : S.capByIndex S.oppIndex2 = S.oppCap2 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap2,
        SurplusCapPacket.oppIndex2, hi]
  rw [hsecondCapEq] at hsecondCapSum
  have hsecondCap : 8 ≤ S.oppCap2.card := by omega
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  all_goals
    simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hsum hsurplus hfirstCap hsecondCap
    omega

end ExactFiveRetainedDoubleDeletion
end Problem97
