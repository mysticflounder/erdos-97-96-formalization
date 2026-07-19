/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.RetainedMatchingSourceReturnRadiusSplit
import Erdos9796Proof.P97.U5GlobalIncidenceKernels

/-!
# Source-return U5 theorem-bank match

This scratch file records the exact finite-incidence information carried by
the two source-return U5 ingress packets.  It deliberately does not introduce
another abstract row census.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSourceReturnU5BankMatchScratch

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingSourceReturnRadiusSplit

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The joint-deletion ingress's actual q-critical center is different from
the dangerous first apex. -/
theorem joint_actualCritical_center_ne_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (J : RetainedSourceReturnJointDeletion W) :
    H.centerAt J.source (mem_selectedClass.mp J.source_mem_radius).1 ≠
      S.oppApex1 := by
  simpa only using J.firstPacket.actual_blocker_ne_center₁

/-- The supplied q-critical row in the joint-deletion ingress meets its
dangerous triple in at most one point.  This is the exact negation of the
smallest arbitrary-center imported U5 consumer, namely
`U5QCriticalTripleClass.two_triple_points_incompatibility`. -/
theorem joint_actualCritical_inter_dangerous_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (J : RetainedSourceReturnJointDeletion W)
    (I : RetainedSourceReturnJointU5Ingress J) :
    (((H.selectedAt J.source
          (mem_selectedClass.mp J.source_mem_radius).1).toCriticalFourShell.support.erase
        J.source) ∩ I.T).card ≤ 1 := by
  rw [Finset.card_le_one]
  intro x hx y hy
  by_contra hxy
  exact U5QCriticalTripleClass.two_triple_points_incompatibility
    I.dangerous I.actualCriticalRow
    (joint_actualCritical_center_ne_firstApex J)
    (Finset.mem_inter.mp hx).2 (Finset.mem_inter.mp hy).2 hxy
    (Finset.mem_inter.mp hx).1 (Finset.mem_inter.mp hy).1

/-- A single exact support-containment producer would send the first
joint-deletion blocker row directly to the imported common-bisector
incompatibility. -/
theorem joint_false_of_firstBlocker_dangerousClosure
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {J : RetainedSourceReturnJointDeletion W}
    (I : RetainedSourceReturnJointU5Ingress J)
    (hclosure : insert S.oppApex1 I.T ⊆ J.firstPacket.B₂) : False := by
  rcases I.dangerous.exists_triple_labels with
    ⟨t₁, t₂, t₃, _ht₁₂, _ht₁₃, _ht₂₃, hT,
      hnoncollinear, ht₁Radius, ht₂Radius, ht₃Radius⟩
  exact u5_common_bisector_triple_incompatibility
    I.dangerous.q_radius_pos hnoncollinear ht₁Radius ht₂Radius ht₃Radius
    I.firstBlockerRow
    (hclosure (by simp))
    (hclosure (by simp [hT]))
    (hclosure (by simp [hT]))
    (hclosure (by simp [hT]))

/-- Symmetric support-containment adapter for the second joint-deletion
blocker row. -/
theorem joint_false_of_secondBlocker_dangerousClosure
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {J : RetainedSourceReturnJointDeletion W}
    (I : RetainedSourceReturnJointU5Ingress J)
    (hclosure : insert S.oppApex1 I.T ⊆ J.secondPacket.B₂) : False := by
  rcases I.dangerous.exists_triple_labels with
    ⟨t₁, t₂, t₃, _ht₁₂, _ht₁₃, _ht₂₃, hT,
      hnoncollinear, ht₁Radius, ht₂Radius, ht₃Radius⟩
  exact u5_common_bisector_triple_incompatibility
    I.dangerous.q_radius_pos hnoncollinear ht₁Radius ht₂Radius ht₃Radius
    I.secondBlockerRow
    (hclosure (by simp))
    (hclosure (by simp [hT]))
    (hclosure (by simp [hT]))
    (hclosure (by simp [hT]))

/-- On the first side of the exact-four ingress, the q-critical support meets
the dangerous triple in exactly the original first source. -/
theorem exactFour_firstCritical_inter_dangerous_eq_singleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (P : RetainedSourceReturnExactFourPartition W) :
    ((H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support.erase
          P.firstPartner ∩
        (SelectedClass D.A S.oppApex1 radius).erase P.firstPartner) =
      {W.first} := by
  classical
  ext z
  constructor
  · intro hz
    have hzCross :
        z ∈ (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex1 radius :=
      Finset.mem_inter.mpr
        ⟨(Finset.mem_erase.mp (Finset.mem_inter.mp hz).1).2,
          (Finset.mem_erase.mp (Finset.mem_inter.mp hz).2).2⟩
    rw [P.firstHits_eq] at hzCross
    rcases Finset.mem_insert.mp hzCross with hzFirst | hzPartner
    · simp [hzFirst]
    · have hzEq : z = P.firstPartner := Finset.mem_singleton.mp hzPartner
      exact False.elim
        ((Finset.mem_erase.mp (Finset.mem_inter.mp hz).1).1 hzEq)
  · intro hz
    have hzEq : z = W.first := Finset.mem_singleton.mp hz
    subst z
    have hCross :
        W.first ∈
          (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex1 radius := by
      rw [P.firstHits_eq]
      simp
    exact Finset.mem_inter.mpr
      ⟨Finset.mem_erase.mpr
          ⟨P.firstPartner_ne_first.symm, (Finset.mem_inter.mp hCross).1⟩,
        Finset.mem_erase.mpr
          ⟨P.firstPartner_ne_first.symm, (Finset.mem_inter.mp hCross).2⟩⟩

/-- On the first side of the exact-four ingress, the opposite q-deleted
blocker row meets the dangerous triple in the other two retained sources. -/
theorem exactFour_firstDeleted_inter_dangerous_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (P : RetainedSourceReturnExactFourPartition W) :
    ((H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex1 radius).erase P.firstPartner) =
      {W.second, P.secondPartner} := by
  classical
  ext z
  constructor
  · intro hz
    have hzCross :
        z ∈ (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex1 radius :=
      Finset.mem_inter.mpr
        ⟨(Finset.mem_inter.mp hz).1,
          (Finset.mem_erase.mp (Finset.mem_inter.mp hz).2).2⟩
    simpa only [P.secondHits_eq] using hzCross
  · intro hz
    have hzCross :
        z ∈ (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex1 radius := by
      simpa only [P.secondHits_eq] using hz
    have hzNe : z ≠ P.firstPartner := by
      rcases Finset.mem_insert.mp hz with hzSecond | hzPartner
      · exact hzSecond.trans_ne P.firstPartner_ne_second.symm
      · exact (Finset.mem_singleton.mp hzPartner).trans_ne P.partners_ne.symm
    exact Finset.mem_inter.mpr
      ⟨(Finset.mem_inter.mp hzCross).1,
        Finset.mem_erase.mpr ⟨hzNe, (Finset.mem_inter.mp hzCross).2⟩⟩

/-- The dual q-critical row has the symmetric singleton intersection. -/
theorem exactFour_secondCritical_inter_dangerous_eq_singleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (P : RetainedSourceReturnExactFourPartition W) :
    ((H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support.erase
          P.secondPartner ∩
        (SelectedClass D.A S.oppApex1 radius).erase P.secondPartner) =
      {W.second} := by
  classical
  ext z
  constructor
  · intro hz
    have hzCross :
        z ∈ (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex1 radius :=
      Finset.mem_inter.mpr
        ⟨(Finset.mem_erase.mp (Finset.mem_inter.mp hz).1).2,
          (Finset.mem_erase.mp (Finset.mem_inter.mp hz).2).2⟩
    rw [P.secondHits_eq] at hzCross
    rcases Finset.mem_insert.mp hzCross with hzSecond | hzPartner
    · simp [hzSecond]
    · have hzEq : z = P.secondPartner := Finset.mem_singleton.mp hzPartner
      exact False.elim
        ((Finset.mem_erase.mp (Finset.mem_inter.mp hz).1).1 hzEq)
  · intro hz
    have hzEq : z = W.second := Finset.mem_singleton.mp hz
    subst z
    have hCross :
        W.second ∈
          (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex1 radius := by
      rw [P.secondHits_eq]
      simp
    exact Finset.mem_inter.mpr
      ⟨Finset.mem_erase.mpr
          ⟨P.secondPartner_ne_second.symm, (Finset.mem_inter.mp hCross).1⟩,
        Finset.mem_erase.mpr
          ⟨P.secondPartner_ne_second.symm, (Finset.mem_inter.mp hCross).2⟩⟩

/-- The dual opposite q-deleted row has the symmetric two-point
intersection. -/
theorem exactFour_secondDeleted_inter_dangerous_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (P : RetainedSourceReturnExactFourPartition W) :
    ((H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex1 radius).erase P.secondPartner) =
      {W.first, P.firstPartner} := by
  classical
  ext z
  constructor
  · intro hz
    have hzCross :
        z ∈ (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex1 radius :=
      Finset.mem_inter.mpr
        ⟨(Finset.mem_inter.mp hz).1,
          (Finset.mem_erase.mp (Finset.mem_inter.mp hz).2).2⟩
    simpa only [P.firstHits_eq] using hzCross
  · intro hz
    have hzCross :
        z ∈ (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex1 radius := by
      simpa only [P.firstHits_eq] using hz
    have hzNe : z ≠ P.secondPartner := by
      rcases Finset.mem_insert.mp hz with hzFirst | hzPartner
      · exact hzFirst.trans_ne P.secondPartner_ne_first.symm
      · exact (Finset.mem_singleton.mp hzPartner).trans_ne P.partners_ne
    exact Finset.mem_inter.mpr
      ⟨(Finset.mem_inter.mp hzCross).1,
        Finset.mem_erase.mpr ⟨hzNe, (Finset.mem_inter.mp hzCross).2⟩⟩

/-- The first exact-four dangerous triple is exactly the three retained
sources other than the first partner. -/
theorem exactFour_firstDangerous_eq_triple
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (P : RetainedSourceReturnExactFourPartition W) :
    (SelectedClass D.A S.oppApex1 radius).erase P.firstPartner =
      {W.first, W.second, P.secondPartner} := by
  classical
  rw [← P.hits_union_eq_class, P.firstHits_eq, P.secondHits_eq]
  ext z
  simp only [Finset.mem_erase, Finset.mem_union, Finset.mem_insert,
    Finset.mem_singleton]
  constructor
  · rintro ⟨hzNe, (hzFirst | hzPartner) | hzSecond | hzSecondPartner⟩
    · exact Or.inl hzFirst
    · exact False.elim (hzNe hzPartner)
    · exact Or.inr (Or.inl hzSecond)
    · exact Or.inr (Or.inr hzSecondPartner)
  · rintro (hzFirst | hzSecond | hzSecondPartner)
    · exact ⟨hzFirst.trans_ne P.firstPartner_ne_first.symm,
        Or.inl (Or.inl hzFirst)⟩
    · exact ⟨hzSecond.trans_ne P.firstPartner_ne_second.symm,
        Or.inr (Or.inl hzSecond)⟩
    · exact ⟨hzSecondPartner.trans_ne P.partners_ne.symm,
        Or.inr (Or.inr hzSecondPartner)⟩

/-- The dual exact-four dangerous triple is exactly the three retained
sources other than the second partner. -/
theorem exactFour_secondDangerous_eq_triple
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (P : RetainedSourceReturnExactFourPartition W) :
    (SelectedClass D.A S.oppApex1 radius).erase P.secondPartner =
      {W.second, W.first, P.firstPartner} := by
  classical
  rw [← P.hits_union_eq_class, P.firstHits_eq, P.secondHits_eq]
  ext z
  simp only [Finset.mem_erase, Finset.mem_union, Finset.mem_insert,
    Finset.mem_singleton]
  constructor
  · rintro ⟨hzNe, (hzFirst | hzFirstPartner) | hzSecond | hzPartner⟩
    · exact Or.inr (Or.inl hzFirst)
    · exact Or.inr (Or.inr hzFirstPartner)
    · exact Or.inl hzSecond
    · exact False.elim (hzNe hzPartner)
  · rintro (hzSecond | hzFirst | hzFirstPartner)
    · exact ⟨hzSecond.trans_ne P.secondPartner_ne_second.symm,
        Or.inr (Or.inl hzSecond)⟩
    · exact ⟨hzFirst.trans_ne P.secondPartner_ne_first.symm,
        Or.inl (Or.inl hzFirst)⟩
    · exact ⟨hzFirstPartner.trans_ne P.partners_ne,
        Or.inl (Or.inr hzFirstPartner)⟩

/-- The first-side common-bisector closure cannot be the missing producer:
the source-return omission edge forces the remaining dangerous point out of
the opposite blocker row. -/
theorem exactFour_first_not_mem_oppositeRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (P : RetainedSourceReturnExactFourPartition W) :
    W.first ∉
      (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support := by
  have h := W.next_not_mem_second_shell
  rw [P.sourceReturn] at h
  exact h

/-- Dual forced absence of the remaining dangerous point. -/
theorem exactFour_second_not_mem_oppositeRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (_P : RetainedSourceReturnExactFourPartition W) :
    W.second ∉
      (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support :=
  W.second_not_mem_first_shell

/-- The first exact-four U5 ingress reaches the imported common-bisector
consumer as soon as the opposite blocker row also contains the first apex and
the one dangerous point not already forced into that row. -/
theorem exactFour_first_false_of_apex_and_first_mem_oppositeRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {P : RetainedSourceReturnExactFourPartition W}
    (I : RetainedSourceReturnExactFourU5Ingress P)
    (hapex : S.oppApex1 ∈
      (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support)
    (hfirst : W.first ∈
      (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support) :
    False := by
  have hPair := exactFour_firstDeleted_inter_dangerous_eq_pair P
  have hsecond : W.second ∈
      (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support := by
    have : W.second ∈
        (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex1 radius).erase P.firstPartner := by
      rw [hPair]
      simp
    exact (Finset.mem_inter.mp this).1
  have hsecondPartner : P.secondPartner ∈
      (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support := by
    have : P.secondPartner ∈
        (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex1 radius).erase P.firstPartner := by
      rw [hPair]
      simp
    exact (Finset.mem_inter.mp this).1
  have hfirstT : W.first ∈
      (SelectedClass D.A S.oppApex1 radius).erase P.firstPartner := by
    rw [exactFour_firstDangerous_eq_triple P]
    simp
  have hsecondT : W.second ∈
      (SelectedClass D.A S.oppApex1 radius).erase P.firstPartner := by
    rw [exactFour_firstDangerous_eq_triple P]
    simp
  have hsecondPartnerT : P.secondPartner ∈
      (SelectedClass D.A S.oppApex1 radius).erase P.firstPartner := by
    rw [exactFour_firstDangerous_eq_triple P]
    simp
  exact u5_common_bisector_triple_incompatibility
    I.firstDangerous.q_radius_pos
    (by
      simpa only [exactFour_firstDangerous_eq_triple P,
        Finset.coe_insert, Finset.coe_singleton] using
        I.firstDangerous.T_noncollinear)
    (I.firstDangerous.T_same_radius W.first hfirstT)
    (I.firstDangerous.T_same_radius W.second hsecondT)
    (I.firstDangerous.T_same_radius P.secondPartner hsecondPartnerT)
    I.firstDeletedAtSecondBlocker hapex hfirst hsecond hsecondPartner

/-- Dual form of the exact missing two-incidence antecedent. -/
theorem exactFour_second_false_of_apex_and_second_mem_oppositeRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {P : RetainedSourceReturnExactFourPartition W}
    (I : RetainedSourceReturnExactFourU5Ingress P)
    (hapex : S.oppApex1 ∈
      (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support)
    (hsecond : W.second ∈
      (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support) :
    False := by
  have hPair := exactFour_secondDeleted_inter_dangerous_eq_pair P
  have hfirst : W.first ∈
      (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support := by
    have : W.first ∈
        (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex1 radius).erase P.secondPartner := by
      rw [hPair]
      simp
    exact (Finset.mem_inter.mp this).1
  have hfirstPartner : P.firstPartner ∈
      (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support := by
    have : P.firstPartner ∈
        (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex1 radius).erase P.secondPartner := by
      rw [hPair]
      simp
    exact (Finset.mem_inter.mp this).1
  have hsecondT : W.second ∈
      (SelectedClass D.A S.oppApex1 radius).erase P.secondPartner := by
    rw [exactFour_secondDangerous_eq_triple P]
    simp
  have hfirstT : W.first ∈
      (SelectedClass D.A S.oppApex1 radius).erase P.secondPartner := by
    rw [exactFour_secondDangerous_eq_triple P]
    simp
  have hfirstPartnerT : P.firstPartner ∈
      (SelectedClass D.A S.oppApex1 radius).erase P.secondPartner := by
    rw [exactFour_secondDangerous_eq_triple P]
    simp
  exact u5_common_bisector_triple_incompatibility
    I.secondDangerous.q_radius_pos
    (by
      simpa only [exactFour_secondDangerous_eq_triple P,
        Finset.coe_insert, Finset.coe_singleton] using
        I.secondDangerous.T_noncollinear)
    (I.secondDangerous.T_same_radius W.second hsecondT)
    (I.secondDangerous.T_same_radius W.first hfirstT)
    (I.secondDangerous.T_same_radius P.firstPartner hfirstPartnerT)
    I.secondDeletedAtFirstBlocker hapex hsecond hfirst hfirstPartner

/-- The first exact-four ingress's supplied q-critical row is centered away
from the dangerous first apex. -/
theorem exactFour_firstCritical_center_ne_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (_P : RetainedSourceReturnExactFourPartition W) :
    H.centerAt W.first W.first_mem_A ≠ S.oppApex1 := by
  exact W.firstPacket.centers_ne.symm

/-- The second exact-four ingress's supplied q-critical row is centered away
from the dangerous first apex. -/
theorem exactFour_secondCritical_center_ne_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (_P : RetainedSourceReturnExactFourPartition W) :
    H.centerAt W.second W.second_mem_A ≠ S.oppApex1 := by
  exact W.secondPacket.centers_ne.symm

/-- The exact-four physical q-deleted row cannot contain its own center. -/
theorem exactFour_firstPhysical_center_not_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {P : RetainedSourceReturnExactFourPartition W}
    (I : RetainedSourceReturnExactFourU5Ingress P) :
    S.oppApex1 ∉ I.firstPhysicalB := by
  intro h
  exact (Finset.mem_erase.mp (I.firstDeletedAtPhysical.subset h)).1 rfl

/-- The dual physical q-deleted row cannot contain its own center. -/
theorem exactFour_secondPhysical_center_not_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {P : RetainedSourceReturnExactFourPartition W}
    (I : RetainedSourceReturnExactFourU5Ingress P) :
    S.oppApex1 ∉ I.secondPhysicalB := by
  intro h
  exact (Finset.mem_erase.mp (I.secondDeletedAtPhysical.subset h)).1 rfl

#print axioms joint_actualCritical_inter_dangerous_card_le_one
#print axioms joint_false_of_firstBlocker_dangerousClosure
#print axioms joint_false_of_secondBlocker_dangerousClosure
#print axioms exactFour_firstCritical_inter_dangerous_eq_singleton
#print axioms exactFour_firstDeleted_inter_dangerous_eq_pair
#print axioms exactFour_secondCritical_inter_dangerous_eq_singleton
#print axioms exactFour_secondDeleted_inter_dangerous_eq_pair
#print axioms exactFour_first_not_mem_oppositeRow
#print axioms exactFour_second_not_mem_oppositeRow
#print axioms exactFour_first_false_of_apex_and_first_mem_oppositeRow
#print axioms exactFour_second_false_of_apex_and_second_mem_oppositeRow

end

end ATailSourceReturnU5BankMatchScratch
end Problem97
