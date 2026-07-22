/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ExactFiveFirstApexCard13NormalForm
import Erdos9796Proof.P97.ATail.ExactFiveMutualOneHitGeometry

/-!
# Exact-five card-13 coupling to the retained first-apex row

This scratch module strengthens the card-13 first-apex normal form by coupling
its complete ambient radius classes to the actual q-deleted first row retained
by `FrontierCommonDeletionParentResidual`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveFirstApexCard13ParentRowCouplingScratch

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailExactFiveFirstApexCard13Scratch
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

private theorem oppApex1_eq_oppositeVertex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem selectedFourClass_subset_ambient
    {A : Finset ℝ²} {center : ℝ²} (K : SelectedFourClass A center) :
    K.support ⊆ SelectedClass A center K.radius := by
  intro x hx
  exact mem_selectedClass.mpr ⟨K.support_subset_A hx, K.support_eq_radius x hx⟩

private theorem selectedFourClass_ambient_card_ge_four
    {A : Finset ℝ²} {center : ℝ²} (K : SelectedFourClass A center) :
    4 ≤ (SelectedClass A center K.radius).card := by
  have hcard := Finset.card_le_card (selectedFourClass_subset_ambient K)
  simpa [K.support_card] using hcard

/-- In the card-13 same-radius mode, every positive first-apex K4 radius is
the retained frontier radius.  Saturation of all four strict-cap positions
leaves no room for a second K4 radius. -/
theorem firstApex_K4_radius_eq_frontier_of_sameRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (P : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hsame : P.doubleRadius = radius)
    {rho : ℝ} (hrho : 0 < rho)
    (hrhoFour : 4 ≤ (SelectedClass D.A S.oppApex1 rho).card) :
    rho = radius := by
  by_contra hne
  let I := S.capInteriorByIndex S.oppIndex1
  let C := SelectedClass D.A S.oppApex1 radius
  let K := SelectedClass D.A S.oppApex1 rho
  have hsat : C ∩ I = I := by
    simpa [C, I] using
      firstApex_class_inter_capInterior_eq_capInterior_of_sameRadius
        Q P hcard hsame
  have hKtwo : 2 ≤ (K ∩ I).card := by
    have happ := oppApex1_eq_oppositeVertex_oppIndex1 S
    have htwo := S.selectedClass_capInteriorByIndex_card_ge_two
      D.convex S.oppIndex1 hrho (by simpa [K, happ] using hrhoFour)
    rw [← happ] at htwo
    simpa [K, I] using htwo
  have hdisjoint : Disjoint C K := by
    rw [Finset.disjoint_left]
    intro x hxC hxK
    have hxr : dist S.oppApex1 x = radius := (mem_selectedClass.mp hxC).2
    have hxrho : dist S.oppApex1 x = rho := (mem_selectedClass.mp hxK).2
    exact hne (hxrho.symm.trans hxr)
  have hKempty : K ∩ I = ∅ := by
    apply Finset.eq_empty_iff_forall_notMem.mpr
    intro x hx
    have hxK := (Finset.mem_inter.mp hx).1
    have hxI := (Finset.mem_inter.mp hx).2
    have hxC : x ∈ C := by
      have : x ∈ C ∩ I := by simpa only [hsat] using hxI
      exact (Finset.mem_inter.mp this).1
    exact Finset.disjoint_left.mp hdisjoint hxC hxK
  rw [hKempty] at hKtwo
  simp at hKtwo

/-- In the same-radius mode, the actual retained q-deleted first row is a
four-point subrow of the unique six-point frontier class. -/
theorem parentFirstRow_subset_frontierClass_of_sameRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (P : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hsame : P.doubleRadius = radius) :
    R.common.packet.B₁ ⊆ SelectedClass D.A S.oppApex1 radius := by
  let K := firstRowSelectedFourClass R.common.packet
  have hradius : K.radius = radius :=
    firstApex_K4_radius_eq_frontier_of_sameRadius Q P hcard hsame
      K.radius_pos (selectedFourClass_ambient_card_ge_four K)
  simpa [K, hradius] using selectedFourClass_subset_ambient K

/-- In the card-13 distinct-radius mode, every positive first-apex K4 radius
is one of the two packet radii.  Their strict-cap parts already partition all
four available strict positions. -/
theorem firstApex_K4_radius_eq_retained_or_double_of_distinctRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (P : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hdistinct : P.doubleRadius ≠ radius)
    {rho : ℝ} (hrho : 0 < rho)
    (hrhoFour : 4 ≤ (SelectedClass D.A S.oppApex1 rho).card) :
    rho = radius ∨ rho = P.doubleRadius := by
  by_cases hretained : rho = radius
  · exact Or.inl hretained
  by_cases hdouble : rho = P.doubleRadius
  · exact Or.inr hdouble
  exfalso
  let I := S.capInteriorByIndex S.oppIndex1
  let K := SelectedClass D.A S.oppApex1 rho
  let T₀ := P.retainedRow.support ∩ I
  let T₁ := P.doubleRow.support ∩ I
  have hpartition : T₀ ∪ T₁ = I := by
    simpa [I, T₀, T₁] using
      (firstApex_distinctRadius_rows_partition_capInterior
        Q P hcard hdistinct).2.2
  have hKtwo : 2 ≤ (K ∩ I).card := by
    have happ := oppApex1_eq_oppositeVertex_oppIndex1 S
    have htwo := S.selectedClass_capInteriorByIndex_card_ge_two
      D.convex S.oppIndex1 hrho (by simpa [K, happ] using hrhoFour)
    rw [← happ] at htwo
    simpa [K, I] using htwo
  have hKempty : K ∩ I = ∅ := by
    apply Finset.eq_empty_iff_forall_notMem.mpr
    intro x hx
    have hxK := (Finset.mem_inter.mp hx).1
    have hxI := (Finset.mem_inter.mp hx).2
    have hxUnion : x ∈ T₀ ∪ T₁ := by simpa only [hpartition] using hxI
    rcases Finset.mem_union.mp hxUnion with hxT₀ | hxT₁
    · have hxRow := (Finset.mem_inter.mp hxT₀).1
      have hxrho : dist S.oppApex1 x = rho := (mem_selectedClass.mp hxK).2
      have hxr : dist S.oppApex1 x = radius := by
        calc
          dist S.oppApex1 x = P.retainedRow.radius :=
            P.retainedRow.support_eq_radius x hxRow
          _ = radius := P.retainedRow_radius
      exact hretained (hxrho.symm.trans hxr)
    · have hxRow := (Finset.mem_inter.mp hxT₁).1
      have hxrho : dist S.oppApex1 x = rho := (mem_selectedClass.mp hxK).2
      have hxdouble : dist S.oppApex1 x = P.doubleRadius := by
        calc
          dist S.oppApex1 x = P.doubleRow.radius :=
            P.doubleRow.support_eq_radius x hxRow
          _ = P.doubleRadius := P.doubleRow_radius
      exact hdouble (hxrho.symm.trans hxdouble)
  rw [hKempty] at hKtwo
  simp at hKtwo

/-- The distinct-radius card-13 mode identifies the actual retained q-deleted
first row exactly: it is the complete double-deletion radius class. -/
theorem parentFirstRow_eq_doubleRow_of_distinctRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (P : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hdistinct : P.doubleRadius ≠ radius) :
    R.common.packet.B₁ = P.doubleRow.support := by
  let K := firstRowSelectedFourClass R.common.packet
  have hradii :=
    firstApex_K4_radius_eq_retained_or_double_of_distinctRadius
      Q P hcard hdistinct K.radius_pos
        (selectedFourClass_ambient_card_ge_four K)
  have hexact :=
    firstApex_distinctRadius_rows_are_exactClasses Q P hcard hdistinct
  rcases hradii with hretained | hdouble
  · exfalso
    have hKsub : K.support ⊆ SelectedClass D.A S.oppApex1 radius := by
      simpa [hretained] using selectedFourClass_subset_ambient K
    have hclassCard :
        (SelectedClass D.A S.oppApex1 radius).card = 4 := by
      rw [← hexact.1, P.retainedRow.support_card]
    have hKeq : K.support = SelectedClass D.A S.oppApex1 radius := by
      apply Finset.eq_of_subset_of_card_le hKsub
      simpa [K.support_card] using hclassCard.le
    apply R.common.packet.row₁.q_not_mem
    change F.pair.q ∈ K.support
    rw [hKeq, ← hexact.1]
    exact P.q_mem_retainedRow
  · have hKsub : K.support ⊆
        SelectedClass D.A S.oppApex1 P.doubleRadius := by
      simpa [hdouble] using selectedFourClass_subset_ambient K
    have hclassCard :
        (SelectedClass D.A S.oppApex1 P.doubleRadius).card = 4 := by
      rw [← hexact.2, P.doubleRow.support_card]
    have hKeq : K.support =
        SelectedClass D.A S.oppApex1 P.doubleRadius := by
      apply Finset.eq_of_subset_of_card_le hKsub
      simpa [K.support_card] using hclassCard.le
    change K.support = P.doubleRow.support
    rw [hKeq, ← hexact.2]

/-- On an asymmetric global-cover arm in the same-radius mode, the terminal
negation forces at least one outside-row point to leave the strict first
opposite cap.  If both were strict-cap points, saturation by the six-point
frontier class would make them first-apex co-radial. -/
theorem SourceTwoHitNormalForm.outside_not_both_mem_firstCapInterior_of_sameRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    (N : SourceTwoHitNormalForm Q profile M)
    (P : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hsame : P.doubleRadius = radius) :
    N.outside₁ ∉ S.capInteriorByIndex S.oppIndex1 ∨
      N.outside₂ ∉ S.capInteriorByIndex S.oppIndex1 := by
  by_contra hboth
  push_neg at hboth
  have hsat :=
    firstApex_class_inter_capInterior_eq_capInterior_of_sameRadius
      Q P hcard hsame
  have h₁Class : N.outside₁ ∈ SelectedClass D.A S.oppApex1 radius := by
    have : N.outside₁ ∈
        SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 := by
      simpa only [hsat] using hboth.1
    exact (Finset.mem_inter.mp this).1
  have h₂Class : N.outside₂ ∈ SelectedClass D.A S.oppApex1 radius := by
    have : N.outside₂ ∈
        SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 := by
      simpa only [hsat] using hboth.2
    exact (Finset.mem_inter.mp this).1
  apply N.false_of_firstApex_coRadial
  exact (mem_selectedClass.mp h₁Class).2.trans
    (mem_selectedClass.mp h₂Class).2.symm

/-- On an asymmetric global-cover arm in the distinct-radius mode, if both
outside-row points lie in the strict first opposite cap, then they must cross
the two complete first-apex classes.  The second class is the actual retained
q-deleted parent row by `parentFirstRow_eq_doubleRow_of_distinctRadius`.

Putting both points in either class would trigger the existing first-apex
co-radial terminal. -/
theorem SourceTwoHitNormalForm.outsidePair_crosses_parentFirstRow_of_distinctRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    (N : SourceTwoHitNormalForm Q profile M)
    (P : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hdistinct : P.doubleRadius ≠ radius)
    (h₁Interior : N.outside₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (h₂Interior : N.outside₂ ∈ S.capInteriorByIndex S.oppIndex1) :
    (N.outside₁ ∈ P.retainedRow.support ∧
        N.outside₂ ∈ R.common.packet.B₁) ∨
      (N.outside₂ ∈ P.retainedRow.support ∧
        N.outside₁ ∈ R.common.packet.B₁) := by
  let I := S.capInteriorByIndex S.oppIndex1
  let T₀ := P.retainedRow.support ∩ I
  let T₁ := P.doubleRow.support ∩ I
  have hpartition : T₀ ∪ T₁ = I := by
    simpa [I, T₀, T₁] using
      (firstApex_distinctRadius_rows_partition_capInterior
        Q P hcard hdistinct).2.2
  have hB₁ : R.common.packet.B₁ = P.doubleRow.support :=
    parentFirstRow_eq_doubleRow_of_distinctRadius Q P hcard hdistinct
  have hclassify (x : ℝ²) (hx : x ∈ I) :
      x ∈ P.retainedRow.support ∨ x ∈ R.common.packet.B₁ := by
    have hxUnion : x ∈ T₀ ∪ T₁ := by simpa only [hpartition] using hx
    rcases Finset.mem_union.mp hxUnion with hx₀ | hx₁
    · exact Or.inl (Finset.mem_inter.mp hx₀).1
    · exact Or.inr (by rw [hB₁]; exact (Finset.mem_inter.mp hx₁).1)
  rcases hclassify N.outside₁ h₁Interior with h₁Retained | h₁B₁
  · rcases hclassify N.outside₂ h₂Interior with h₂Retained | h₂B₁
    · exfalso
      apply N.false_of_firstApex_coRadial
      exact (P.retainedRow.support_eq_radius N.outside₁ h₁Retained).trans
        (P.retainedRow.support_eq_radius N.outside₂ h₂Retained).symm
    · exact Or.inl ⟨h₁Retained, h₂B₁⟩
  · rcases hclassify N.outside₂ h₂Interior with h₂Retained | h₂B₁
    · exact Or.inr ⟨h₂Retained, h₁B₁⟩
    · exfalso
      apply N.false_of_firstApex_coRadial
      exact (R.common.packet.row₁.same_radius N.outside₁ h₁B₁).trans
        (R.common.packet.row₁.same_radius N.outside₂ h₂B₁).symm

#print axioms firstApex_K4_radius_eq_frontier_of_sameRadius
#print axioms parentFirstRow_subset_frontierClass_of_sameRadius
#print axioms firstApex_K4_radius_eq_retained_or_double_of_distinctRadius
#print axioms parentFirstRow_eq_doubleRow_of_distinctRadius
#print axioms SourceTwoHitNormalForm.outside_not_both_mem_firstCapInterior_of_sameRadius
#print axioms SourceTwoHitNormalForm.outsidePair_crosses_parentFirstRow_of_distinctRadius

end ATailExactFiveFirstApexCard13ParentRowCouplingScratch
end Problem97
