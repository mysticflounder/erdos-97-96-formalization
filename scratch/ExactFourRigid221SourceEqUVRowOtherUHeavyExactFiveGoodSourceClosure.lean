/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveSourceDichotomy

/-!
# Exact-five `u`-heavy good-source restart

This file extracts the non-circular consequences of either genuinely distinct
good-source branch in the exact-five `u`-heavy source dichotomy.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The full non-circular restart obtained from either good-source constructor
of the exact-five `u`-heavy dichotomy.  Besides the genuinely new source, it
retains its omitted strict-interior peer, a mutually omitted physical pair,
the corresponding source context, and a joint deletion outside both rows. -/
structure ExactFourRigid221UHeavyExactFiveGoodSourceRestart
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (goodSource : CarrierVertex D.A) : Type where
  good_ne_original : goodSource ≠ P.source
  good_mem_class :
    goodSource.1 ∈ SelectedClass D.A S.oppApex2 P.rho
  good_mem_interior :
    goodSource.1 ∈ S.capInteriorByIndex S.oppIndex2
  good_mem_outside :
    goodSource ∈ outsideFirstApexFiber R
  good_cross_card_le_two :
    ((((lateFirstApexSystem R).selectedAt
          goodSource.1 goodSource.2).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex2 P.rho ∩
          S.capInteriorByIndex S.oppIndex2)).card ≤ 2)
  good_survives_q_or_w :
    HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
        ((lateFirstApexSystem R).centerAt
          goodSource.1 goodSource.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
        ((lateFirstApexSystem R).centerAt
          goodSource.1 goodSource.2)
  omittedPeer : CarrierVertex D.A
  omittedPeer_ne_good : omittedPeer ≠ goodSource
  omittedPeer_mem_class :
    omittedPeer.1 ∈ SelectedClass D.A S.oppApex2 P.rho
  omittedPeer_mem_interior :
    omittedPeer.1 ∈ S.capInteriorByIndex S.oppIndex2
  omittedPeer_not_mem_good_row :
    omittedPeer.1 ∉
      ((lateFirstApexSystem R).selectedAt
        goodSource.1 goodSource.2).toCriticalFourShell.support
  good_peer_blockers_ne :
    (lateFirstApexSystem R).centerAt goodSource.1 goodSource.2 ≠
      (lateFirstApexSystem R).centerAt
        omittedPeer.1 omittedPeer.2
  mutualU : CarrierVertex D.A
  mutualV : CarrierVertex D.A
  mutual_ne : mutualU ≠ mutualV
  mutualU_mem_class :
    mutualU.1 ∈ SelectedClass D.A S.oppApex2 P.rho
  mutualV_mem_class :
    mutualV.1 ∈ SelectedClass D.A S.oppApex2 P.rho
  mutualV_not_mem_u_row :
    mutualV.1 ∉
      ((lateFirstApexSystem R).selectedAt
        mutualU.1 mutualU.2).toCriticalFourShell.support
  mutualU_not_mem_v_row :
    mutualU.1 ∉
      ((lateFirstApexSystem R).selectedAt
        mutualV.1 mutualV.2).toCriticalFourShell.support
  context :
    ExactFourMutualOmissionSourceContext
      R P.rho goodSource omittedPeer mutualU mutualV
  jointDeletion :
    ExactFourMutualOmissionJointDeletion
      R P.rho mutualU mutualV

/-- Either genuinely distinct good source from the exact-five `u`-heavy
dichotomy regenerates the complete mutual-omission and joint-deletion input.
No open exact-four closer is used. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_goodSource_restart
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (goodSource : CarrierVertex D.A)
    (hgoodNe : goodSource ≠ P.source)
    (hgoodClass :
      goodSource.1 ∈ SelectedClass D.A S.oppApex2 P.rho)
    (hgoodInterior :
      goodSource.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hgood :
      goodSource ∈ outsideFirstApexFiber R ∧
        (HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
            ((lateFirstApexSystem R).centerAt
              goodSource.1 goodSource.2) ∨
          HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
            ((lateFirstApexSystem R).centerAt
              goodSource.1 goodSource.2))) :
    Nonempty
      (ExactFourRigid221UHeavyExactFiveGoodSourceRestart
        P goodSource) := by
  classical
  have hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            goodSource.1 goodSource.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 P.rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2) :=
    actualLateRow_secondClassInterior_card_le_two
      R P.surface goodSource hgoodClass hgoodInterior
  rcases
      exists_omittedSecondClassInteriorPeer
        R goodSource P.hrho P.hfive hlateCross with
    ⟨omittedPeer, hpeerNe, hpeerClass, hpeerInterior,
      hpeerOmitted, hpeerBlockersNe⟩
  rcases
      exists_mutuallyOmittedSecondClassPair
        R P.surface goodSource P.hfive hgoodClass with
    ⟨mutualU, mutualV, hmutualNe, hmutualUClass,
      hmutualVClass, hmutualVOmitted, hmutualUOmitted,
      hgoodMemURow, hmutualVOmittedGoodRow,
      hmutualUEqGoodOrOmitted⟩
  have hmutualBlockersNe :
      (lateFirstApexSystem R).centerAt
          mutualU.1 mutualU.2 ≠
        (lateFirstApexSystem R).centerAt
          mutualV.1 mutualV.2 := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem R) mutualU.2 mutualV.2 hcenters
    apply hmutualVOmitted
    rw [hsupports]
    exact
      ((lateFirstApexSystem R).selectedAt
        mutualV.1 mutualV.2).toCriticalFourShell.q_mem_support
  let context :
      ExactFourMutualOmissionSourceContext
        R P.rho goodSource omittedPeer mutualU mutualV := {
    source_mem_class := hgoodClass
    source_mem_interior := hgoodInterior
    source_mem_outside := hgood.1
    source_cross_card_le_two := hlateCross
    other_ne_source := hpeerNe
    other_mem_class := hpeerClass
    other_mem_interior := hpeerInterior
    other_not_mem_source_row := hpeerOmitted
    source_other_blockers_ne := hpeerBlockersNe
    source_survives_q_or_w := hgood.2
    source_mem_u_row := hgoodMemURow
    v_not_mem_source_row := hmutualVOmittedGoodRow
    u_eq_source_or_not_mem_source_row := hmutualUEqGoodOrOmitted
  }
  rcases
      nonempty_exactFourMutualOmissionJointDeletion
        R P.surface P.rho P.hfive mutualU mutualV
          hmutualBlockersNe with
    ⟨jointDeletion⟩
  exact ⟨{
    good_ne_original := hgoodNe
    good_mem_class := hgoodClass
    good_mem_interior := hgoodInterior
    good_mem_outside := hgood.1
    good_cross_card_le_two := hlateCross
    good_survives_q_or_w := hgood.2
    omittedPeer := omittedPeer
    omittedPeer_ne_good := hpeerNe
    omittedPeer_mem_class := hpeerClass
    omittedPeer_mem_interior := hpeerInterior
    omittedPeer_not_mem_good_row := hpeerOmitted
    good_peer_blockers_ne := hpeerBlockersNe
    mutualU := mutualU
    mutualV := mutualV
    mutual_ne := hmutualNe
    mutualU_mem_class := hmutualUClass
    mutualV_mem_class := hmutualVClass
    mutualV_not_mem_u_row := hmutualVOmitted
    mutualU_not_mem_v_row := hmutualUOmitted
    context := context
    jointDeletion := jointDeletion
  }⟩

private theorem goodSource_jointDeletion_of_prescribed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (u v w : CarrierVertex D.A)
    (hwClass : w.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hwNotU :
      w.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (hwNotV :
      w.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2) :
    ∃ K : ExactFourMutualOmissionJointDeletion R rho u v,
      K.deleted = w := by
  have hwNeU : w ≠ u := by
    intro hwu
    apply hwNotU
    simpa [hwu] using
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.q_mem_support
  have hwNeV : w ≠ v := by
    intro hwv
    apply hwNotV
    simpa [hwv] using
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.q_mem_support
  have huBlockerA :
      (lateFirstApexSystem R).centerAt u.1 u.2 ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      ((lateFirstApexSystem R).blockerVertex u).2
  have hvBlockerA :
      (lateFirstApexSystem R).centerAt v.1 v.2 ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      ((lateFirstApexSystem R).blockerVertex v).2
  have hsecondApexA : S.oppApex2 ∈ D.A :=
    surface.ingress.packet.center₂_mem_A
  have huBlockerNeApex :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠ S.oppApex2 :=
    surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) u.1 u.2
  have hvBlockerNeApex :
      (lateFirstApexSystem R).centerAt v.1 v.2 ≠ S.oppApex2 :=
    surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) v.1 v.2
  have huSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w.1)
        ((lateFirstApexSystem R).centerAt u.1 u.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) u.2).mpr hwNotU
  have hvSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w.1)
        ((lateFirstApexSystem R).centerAt v.1 v.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) v.2).mpr hwNotV
  have hsecondApexSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w.1) S.oppApex2 :=
    surface.secondApex_robust.survives w.1 w.2
  rcases nonempty_commonDeletionTwoCenterPacket
      (lateFirstApexSystem R) w.2 huBlockerA hsecondApexA
      huBlockerNeApex huSurvives hsecondApexSurvives with
    ⟨uPacket⟩
  rcases nonempty_commonDeletionTwoCenterPacket
      (lateFirstApexSystem R) w.2 hvBlockerA hsecondApexA
      hvBlockerNeApex hvSurvives hsecondApexSurvives with
    ⟨vPacket⟩
  let K : ExactFourMutualOmissionJointDeletion R rho u v := {
    deleted := w
    deleted_mem_class := hwClass
    deleted_ne_u := hwNeU
    deleted_ne_v := hwNeV
    deleted_not_mem_uRow := hwNotU
    deleted_not_mem_vRow := hwNotV
    blockers_ne := hblockersNe
    uPacket := uPacket
    vPacket := vPacket
  }
  exact ⟨K, rfl⟩

/-- Exact cardinality five turns the good-source restart into either a
genuinely second joint deletion for its regenerated mutually omitted pair, or
a new globally minimal rigid `2+2+1` deletion packet. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_goodSource_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (goodSource : CarrierVertex D.A)
    (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart
      P goodSource) :
    (∃ second :
        ExactFourMutualOmissionJointDeletion
          R P.rho Q.mutualU Q.mutualV,
        second.deleted ≠ Q.jointDeletion.deleted) ∨
      Nonempty
        (ExactFourMutualOmissionRigid221GlobalDeletion
          R P.rho Q.mutualU Q.mutualV Q.jointDeletion) := by
  classical
  let C := SelectedClass D.A S.oppApex2 P.rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      Q.mutualU.1 Q.mutualU.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      Q.mutualV.1 Q.mutualV.2).toCriticalFourShell.support ∩ C
  have hC : C.card = 5 := by
    simpa [C] using P.hclassFive
  have hIuSub : Iu ⊆ C := fun _ hx => (Finset.mem_inter.mp hx).2
  have hIvSub : Iv ⊆ C := fun _ hx => (Finset.mem_inter.mp hx).2
  have hIuTwo : Iu.card ≤ 2 := by
    simpa [Iu, C] using
      actualLateRow_secondClass_card_le_two
        R P.surface Q.mutualU
  have hIvTwo : Iv.card ≤ 2 := by
    simpa [Iv, C] using
      actualLateRow_secondClass_card_le_two
        R P.surface Q.mutualV
  have hzC : Q.jointDeletion.deleted.1 ∈ C := by
    simpa [C] using Q.jointDeletion.deleted_mem_class
  have hzNotIu : Q.jointDeletion.deleted.1 ∉ Iu := by
    intro hz
    exact Q.jointDeletion.deleted_not_mem_uRow
      (Finset.mem_inter.mp hz).1
  have hzNotIv : Q.jointDeletion.deleted.1 ∉ Iv := by
    intro hz
    exact Q.jointDeletion.deleted_not_mem_vRow
      (Finset.mem_inter.mp hz).1
  by_cases hsecond :
      ∃ w ∈ C, w ≠ Q.jointDeletion.deleted.1 ∧
        w ∉ Iu ∧ w ∉ Iv
  · rcases hsecond with ⟨w, hwC, hwNe, hwNotIu, hwNotIv⟩
    have hwA : w ∈ D.A :=
      (mem_selectedClass.mp (by simpa [C] using hwC)).1
    let wCarrier : CarrierVertex D.A := ⟨w, hwA⟩
    have hwClass :
        wCarrier.1 ∈ SelectedClass D.A S.oppApex2 P.rho := by
      simpa [wCarrier, C] using hwC
    have hwNotURow :
        wCarrier.1 ∉
          ((lateFirstApexSystem R).selectedAt
            Q.mutualU.1 Q.mutualU.2).toCriticalFourShell.support := by
      intro hw
      exact hwNotIu
        (Finset.mem_inter.mpr
          ⟨by simpa [wCarrier] using hw, by simpa [wCarrier, C] using hwC⟩)
    have hwNotVRow :
        wCarrier.1 ∉
          ((lateFirstApexSystem R).selectedAt
            Q.mutualV.1 Q.mutualV.2).toCriticalFourShell.support := by
      intro hw
      exact hwNotIv
        (Finset.mem_inter.mpr
          ⟨by simpa [wCarrier] using hw, by simpa [wCarrier, C] using hwC⟩)
    rcases goodSource_jointDeletion_of_prescribed
        R P.surface P.rho Q.mutualU Q.mutualV wCarrier
          hwClass hwNotURow hwNotVRow
          Q.jointDeletion.blockers_ne with
      ⟨second, hsecondDeleted⟩
    left
    refine ⟨second, ?_⟩
    intro heq
    apply hwNe
    have hval := congrArg (fun deleted : CarrierVertex D.A => deleted.1)
      heq
    simpa [hsecondDeleted, wCarrier] using hval
  · have hcover : C = insert Q.jointDeletion.deleted.1 (Iu ∪ Iv) := by
      ext x
      constructor
      · intro hxC
        by_cases hxz : x = Q.jointDeletion.deleted.1
        · simp [hxz]
        · have hxUnion : x ∈ Iu ∪ Iv := by
            by_contra hxNotUnion
            have hxNotIu : x ∉ Iu := by
              intro hxIu
              exact hxNotUnion (Finset.mem_union_left Iv hxIu)
            have hxNotIv : x ∉ Iv := by
              intro hxIv
              exact hxNotUnion (Finset.mem_union_right Iu hxIv)
            exact hsecond ⟨x, hxC, hxz, hxNotIu, hxNotIv⟩
          exact Finset.mem_insert_of_mem hxUnion
      · intro hx
        rcases Finset.mem_insert.mp hx with hxz | hxUnion
        · simpa [hxz] using hzC
        · rcases Finset.mem_union.mp hxUnion with hxIu | hxIv
          · exact hIuSub hxIu
          · exact hIvSub hxIv
    have hzNotUnion : Q.jointDeletion.deleted.1 ∉ Iu ∪ Iv := by
      simpa using And.intro hzNotIu hzNotIv
    have hUnionCard : (Iu ∪ Iv).card = 4 := by
      have h := hC
      simp [hcover, hzNotUnion] at h
      omega
    have hUnionLe : (Iu ∪ Iv).card ≤ Iu.card + Iv.card :=
      Finset.card_union_le Iu Iv
    have hIuEq : Iu.card = 2 := by omega
    have hIvEq : Iv.card = 2 := by omega
    have hInterCard : (Iu ∩ Iv).card = 0 := by
      have h := Finset.card_union_add_card_inter Iu Iv
      omega
    have hDisjoint : Disjoint Iu Iv :=
      Finset.disjoint_iff_inter_eq_empty.mpr
        (Finset.card_eq_zero.mp hInterCard)
    have hrigid :
        let C := SelectedClass D.A S.oppApex2 P.rho
        let Iu :=
          ((lateFirstApexSystem R).selectedAt
            Q.mutualU.1 Q.mutualU.2).toCriticalFourShell.support ∩ C
        let Iv :=
          ((lateFirstApexSystem R).selectedAt
            Q.mutualV.1 Q.mutualV.2).toCriticalFourShell.support ∩ C
        Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
          C = insert Q.jointDeletion.deleted.1 (Iu ∪ Iv) := by
      simpa [C, Iu, Iv] using
        And.intro hIuEq
          (And.intro hIvEq (And.intro hDisjoint hcover))
    exact Or.inr
      (exactFourMutualOmissionRigid221_globalDeletion
        R P.rho P.hrho Q.mutualU Q.mutualV Q.jointDeletion
          P.hclassFive hrigid)

/-- Compare the original rigid packet's distinguished deleted source with the
rows regenerated from a genuinely new good source.  At least one of the useful
finite outcomes occurs:

* the old deleted source lies in a regenerated row, hence the regenerated
  joint deletion is genuinely different;
* the old source lies outside both regenerated rows and supplies a second
  joint deletion for the regenerated pair; or
* the regenerated joint deletion is literally the old deleted source (and is
  therefore outside both regenerated rows).

Thus the precise residual after the good-source restart is a row-membership
or deleted-source equality; there is no hidden choice of a fresh deletion. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_goodSource_oldDeleted_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (goodSource : CarrierVertex D.A)
    (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart
      P goodSource) :
    (((P.jointDeletion.deleted.1 ∈
          ((lateFirstApexSystem R).selectedAt
            Q.mutualU.1 Q.mutualU.2).toCriticalFourShell.support) ∨
        (P.jointDeletion.deleted.1 ∈
          ((lateFirstApexSystem R).selectedAt
            Q.mutualV.1 Q.mutualV.2).toCriticalFourShell.support)) ∧
      Q.jointDeletion.deleted ≠ P.jointDeletion.deleted) ∨
    (∃ second :
        ExactFourMutualOmissionJointDeletion
          R P.rho Q.mutualU Q.mutualV,
      second.deleted ≠ Q.jointDeletion.deleted) ∨
    (Q.jointDeletion.deleted = P.jointDeletion.deleted ∧
      P.jointDeletion.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          Q.mutualU.1 Q.mutualU.2).toCriticalFourShell.support ∧
      P.jointDeletion.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          Q.mutualV.1 Q.mutualV.2).toCriticalFourShell.support) := by
  classical
  by_cases holdU :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          Q.mutualU.1 Q.mutualU.2).toCriticalFourShell.support
  · left
    refine ⟨Or.inl holdU, ?_⟩
    intro heq
    apply Q.jointDeletion.deleted_not_mem_uRow
    rw [heq]
    exact holdU
  by_cases holdV :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          Q.mutualV.1 Q.mutualV.2).toCriticalFourShell.support
  · left
    refine ⟨Or.inr holdV, ?_⟩
    intro heq
    apply Q.jointDeletion.deleted_not_mem_vRow
    rw [heq]
    exact holdV
  by_cases heq :
      Q.jointDeletion.deleted = P.jointDeletion.deleted
  · exact Or.inr (Or.inr ⟨heq, holdU, holdV⟩)
  · rcases goodSource_jointDeletion_of_prescribed
        R P.surface P.rho Q.mutualU Q.mutualV
          P.jointDeletion.deleted
          P.jointDeletion.deleted_mem_class holdU holdV
          Q.jointDeletion.blockers_ne with
      ⟨second, hsecond⟩
    right
    left
    refine ⟨second, ?_⟩
    intro hsecondEq
    apply heq
    exact hsecondEq.symm.trans hsecond

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_goodSource_restart
#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_goodSource_split
#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_goodSource_oldDeleted_split

end ATailFrontierLiveClosure
end Problem97
