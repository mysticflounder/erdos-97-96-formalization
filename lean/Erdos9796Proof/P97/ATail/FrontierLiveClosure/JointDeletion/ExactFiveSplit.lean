/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.Constructors

/-!
# Exact-five joint-deletion classifications

The finite exact-five normal form for two small rows inside one radius class,
and the two consumers built on it: the rigid `2+2` strong split at cardinality
five and the two-packet route at cardinality at least six.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open Census554.CapSelectedGeometry
open ATailCriticalSystemRebase
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailSurvivalCover
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- Exact-card-five finite-set normal form for two rows of size at most two
inside the class and one named point outside both rows. -/
private theorem exactFive_two_small_rows_split
    {α : Type*} [DecidableEq α]
    (C Iu Iv : Finset α) (z : α)
    (hC : C.card = 5)
    (hIuSub : Iu ⊆ C)
    (hIvSub : Iv ⊆ C)
    (hIuTwo : Iu.card ≤ 2)
    (hIvTwo : Iv.card ≤ 2)
    (hzC : z ∈ C)
    (hzNotIu : z ∉ Iu)
    (hzNotIv : z ∉ Iv) :
    (∃ w ∈ C, w ≠ z ∧ w ∉ Iu ∧ w ∉ Iv) ∨
      (Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert z (Iu ∪ Iv)) := by
  by_cases hother : ∃ w ∈ C, w ≠ z ∧ w ∉ Iu ∧ w ∉ Iv
  · exact Or.inl hother
  · right
    have hcover : C = insert z (Iu ∪ Iv) := by
      ext x
      constructor
      · intro hxC
        by_cases hxz : x = z
        · simp [hxz]
        · have hxUnion : x ∈ Iu ∪ Iv := by
            by_contra hxNotUnion
            have hxNotIu : x ∉ Iu := by
              intro hxIu
              exact hxNotUnion (Finset.mem_union_left Iv hxIu)
            have hxNotIv : x ∉ Iv := by
              intro hxIv
              exact hxNotUnion (Finset.mem_union_right Iu hxIv)
            exact hother ⟨x, hxC, hxz, hxNotIu, hxNotIv⟩
          exact Finset.mem_insert_of_mem hxUnion
      · intro hx
        rcases Finset.mem_insert.mp hx with hxz | hxUnion
        · simpa [hxz] using hzC
        · rcases Finset.mem_union.mp hxUnion with hxIu | hxIv
          · exact hIuSub hxIu
          · exact hIvSub hxIv
    have hzNotUnion : z ∉ Iu ∪ Iv := by
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
    have hInterEmpty : Iu ∩ Iv = ∅ :=
      Finset.card_eq_zero.mp hInterCard
    have hDisjoint : Disjoint Iu Iv :=
      Finset.disjoint_iff_inter_eq_empty.mpr hInterEmpty
    exact ⟨hIuEq, hIvEq, hDisjoint, hcover⟩

/-- Raw-point wrapper around the prescribed-deletion constructor. -/
private theorem exists_exactFourMutualOmissionJointDeletion_of_prescribed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (u v : CarrierVertex D.A)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (z : ℝ²)
    (hzC : z ∈ SelectedClass D.A S.oppApex2 rho)
    (hzNotURow :
      z ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (hzNotVRow :
      z ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support) :
    ∃ joint : ExactFourMutualOmissionJointDeletion R rho u v,
      joint.deleted.1 = z := by
  have hzA : z ∈ D.A := (mem_selectedClass.mp hzC).1
  let deleted : CarrierVertex D.A := ⟨z, hzA⟩
  have hdeletedClass :
      deleted.1 ∈ SelectedClass D.A S.oppApex2 rho := by
    simpa [deleted] using hzC
  have hdeletedNotURow :
      deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support := by
    simpa [deleted] using hzNotURow
  have hdeletedNotVRow :
      deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support := by
    simpa [deleted] using hzNotVRow
  rcases exactFourMutualOmissionJointDeletion_of_prescribed
      R surface rho u v deleted hdeletedClass hdeletedNotURow
        hdeletedNotVRow hblockersNe with
    ⟨joint, hjoint⟩
  exact ⟨joint, by simpa [hjoint, deleted]⟩

/-- At exact class cardinality five, either a second prescribed joint
deletion exists or the two row intersections rigidly partition the four
remaining class points as `2+2`. -/
theorem
    exactFourMutualOmissionJointDeletion_exactFive_strongSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (hcard : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (u v : CarrierVertex D.A)
    (J : ExactFourMutualOmissionJointDeletion R rho u v) :
    (∃ K : ExactFourMutualOmissionJointDeletion R rho u v,
        K.deleted ≠ J.deleted) ∨
      (let C := SelectedClass D.A S.oppApex2 rho
       let Iu :=
         ((lateFirstApexSystem R).selectedAt
           u.1 u.2).toCriticalFourShell.support ∩ C
       let Iv :=
         ((lateFirstApexSystem R).selectedAt
           v.1 v.2).toCriticalFourShell.support ∩ C
       Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
         C = insert J.deleted.1 (Iu ∪ Iv)) := by
  let C := SelectedClass D.A S.oppApex2 rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  have hC : C.card = 5 := by
    simpa [C] using hcard
  have hIuSub : Iu ⊆ C := by
    intro x hx
    exact (Finset.mem_inter.mp hx).2
  have hIvSub : Iv ⊆ C := by
    intro x hx
    exact (Finset.mem_inter.mp hx).2
  have hIuTwo : Iu.card ≤ 2 := by
    simpa [Iu, C] using
      actualLateRow_secondClass_card_le_two R surface u
  have hIvTwo : Iv.card ≤ 2 := by
    simpa [Iv, C] using
      actualLateRow_secondClass_card_le_two R surface v
  have hzC : J.deleted.1 ∈ C := by
    simpa [C] using J.deleted_mem_class
  have hzNotIu : J.deleted.1 ∉ Iu := by
    intro hz
    exact J.deleted_not_mem_uRow (Finset.mem_inter.mp hz).1
  have hzNotIv : J.deleted.1 ∉ Iv := by
    intro hz
    exact J.deleted_not_mem_vRow (Finset.mem_inter.mp hz).1
  rcases exactFive_two_small_rows_split
      C Iu Iv J.deleted.1 hC hIuSub hIvSub hIuTwo hIvTwo
        hzC hzNotIu hzNotIv with
    hsecond | hrigid
  · rcases hsecond with ⟨w, hwC, hwNe, hwNotIu, hwNotIv⟩
    have hwA : w ∈ D.A :=
      (mem_selectedClass.mp (by simpa [C] using hwC)).1
    let wCarrier : CarrierVertex D.A := ⟨w, hwA⟩
    have hwClass :
        wCarrier.1 ∈ SelectedClass D.A S.oppApex2 rho := by
      simpa [wCarrier, C] using hwC
    have hwNotURow :
        wCarrier.1 ∉
          ((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.support := by
      intro hwRow
      apply hwNotIu
      exact Finset.mem_inter.mpr
        ⟨by simpa [wCarrier] using hwRow,
         by simpa [wCarrier, C] using hwC⟩
    have hwNotVRow :
        wCarrier.1 ∉
          ((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.support := by
      intro hwRow
      apply hwNotIv
      exact Finset.mem_inter.mpr
        ⟨by simpa [wCarrier] using hwRow,
         by simpa [wCarrier, C] using hwC⟩
    rcases exactFourMutualOmissionJointDeletion_of_prescribed
        R surface rho u v wCarrier hwClass hwNotURow hwNotVRow
          J.blockers_ne with
      ⟨K, hK⟩
    left
    refine ⟨K, ?_⟩
    rw [hK]
    intro hEq
    apply hwNe
    exact congrArg Subtype.val hEq
  · right
    simpa [C, Iu, Iv] using hrigid

/-- A class of size at least six contains two distinct points outside the
union of the two actual rows, hence two distinct joint-deletion packets. -/
theorem exists_two_exactFourMutualOmissionJointDeletions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (hsix : 6 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2) :
    ∃ first second : ExactFourMutualOmissionJointDeletion R rho u v,
      first.deleted ≠ second.deleted := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support ∩ C
  have hIuTwo : Iu.card ≤ 2 := by
    simpa [Iu, C] using
      actualLateRow_secondClass_card_le_two R surface u
  have hIvTwo : Iv.card ≤ 2 := by
    simpa [Iv, C] using
      actualLateRow_secondClass_card_le_two R surface v
  have hUnionFour : (Iu ∪ Iv).card ≤ 4 := by
    calc
      (Iu ∪ Iv).card ≤ Iu.card + Iv.card := Finset.card_union_le Iu Iv
      _ ≤ 4 := by omega
  have hCsix : 6 ≤ C.card := by
    simpa [C] using hsix
  have hlt : (Iu ∪ Iv).card < C.card := by omega
  obtain ⟨z, hzC, hzNotUnion⟩ :=
    Finset.exists_mem_notMem_of_card_lt_card hlt
  have hUnionZFive : ((Iu ∪ Iv) ∪ {z}).card ≤ 5 := by
    calc
      ((Iu ∪ Iv) ∪ {z}).card ≤
          (Iu ∪ Iv).card + ({z} : Finset ℝ²).card :=
        Finset.card_union_le (Iu ∪ Iv) {z}
      _ ≤ 5 := by simp only [Finset.card_singleton]; omega
  have hlt' : ((Iu ∪ Iv) ∪ {z}).card < C.card := by omega
  obtain ⟨w, hwC, hwNotUnionZ⟩ :=
    Finset.exists_mem_notMem_of_card_lt_card hlt'
  have hzNotIu : z ∉ Iu := by
    intro hz
    exact hzNotUnion (Finset.mem_union_left Iv hz)
  have hzNotIv : z ∉ Iv := by
    intro hz
    exact hzNotUnion (Finset.mem_union_right Iu hz)
  have hwNotUnion : w ∉ Iu ∪ Iv := by
    intro hw
    exact hwNotUnionZ (Finset.mem_union_left {z} hw)
  have hwNotIu : w ∉ Iu := by
    intro hw
    exact hwNotUnion (Finset.mem_union_left Iv hw)
  have hwNotIv : w ∉ Iv := by
    intro hw
    exact hwNotUnion (Finset.mem_union_right Iu hw)
  have hwNeZ : w ≠ z := by
    intro hwz
    apply hwNotUnionZ
    apply Finset.mem_union_right (Iu ∪ Iv)
    simpa [hwz]
  have hzNotURow :
      z ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support := by
    intro hz
    exact hzNotIu (Finset.mem_inter.mpr ⟨hz, hzC⟩)
  have hzNotVRow :
      z ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support := by
    intro hz
    exact hzNotIv (Finset.mem_inter.mpr ⟨hz, hzC⟩)
  have hwNotURow :
      w ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support := by
    intro hw
    exact hwNotIu (Finset.mem_inter.mpr ⟨hw, hwC⟩)
  have hwNotVRow :
      w ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support := by
    intro hw
    exact hwNotIv (Finset.mem_inter.mpr ⟨hw, hwC⟩)
  obtain ⟨first, hfirst⟩ :=
    exists_exactFourMutualOmissionJointDeletion_of_prescribed
      R surface rho u v hblockersNe z hzC hzNotURow hzNotVRow
  obtain ⟨second, hsecond⟩ :=
    exists_exactFourMutualOmissionJointDeletion_of_prescribed
      R surface rho u v hblockersNe w hwC hwNotURow hwNotVRow
  refine ⟨first, second, ?_⟩
  intro hEq
  have hzw : z = w :=
    hfirst.symm.trans ((congrArg Subtype.val hEq).trans hsecond)
  exact hwNeZ hzw.symm

end ATailFrontierLiveClosure
end Problem97
