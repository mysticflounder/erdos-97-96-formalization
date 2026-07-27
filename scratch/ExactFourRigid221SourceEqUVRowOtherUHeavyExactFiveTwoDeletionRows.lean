/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveGoodSourceClosure

/-!
# Two-deletion row normal forms in the exact-five good-source restart

Two distinct joint deletions for the regenerated mutually omitted pair account
for four distinct points of the physical five-class together with the two
mutual source points.  This file isolates the unique fifth point and records
the resulting singleton-or-pair normal forms for both actual mutual rows.
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

/-- In an exact-five physical class, two distinct joint deletions for the
regenerated mutually omitted pair leave a unique fifth class point `x`.
Intersecting either actual mutual row with the class then gives either its own
source singleton or that singleton together with `x`. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_twoDeletion_rows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (goodSource : CarrierVertex D.A)
    (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource)
    (second :
      ExactFourMutualOmissionJointDeletion
        R P.rho Q.mutualU Q.mutualV)
    (hsecondNe : second.deleted ≠ Q.jointDeletion.deleted) :
    let C := SelectedClass D.A S.oppApex2 P.rho
    let u := Q.mutualU.1
    let v := Q.mutualV.1
    let deleted₁ := Q.jointDeletion.deleted.1
    let deleted₂ := second.deleted.1
    let four := ({u, v, deleted₁, deleted₂} : Finset ℝ²)
    let Iu :=
      ((lateFirstApexSystem R).selectedAt
        Q.mutualU.1 Q.mutualU.2).toCriticalFourShell.support ∩ C
    let Iv :=
      ((lateFirstApexSystem R).selectedAt
        Q.mutualV.1 Q.mutualV.2).toCriticalFourShell.support ∩ C
    four.card = 4 ∧
      four ⊆ C ∧
      ∃ x : ℝ²,
        C \ four = {x} ∧
        x ∈ C ∧
        x ∉ four ∧
        C = insert x four ∧
        Iu ⊆ {u, x} ∧
        Iv ⊆ {v, x} ∧
        (Iu = {u} ∨ Iu = {u, x}) ∧
        (Iv = {v} ∨ Iv = {v, x}) := by
  classical
  let C := SelectedClass D.A S.oppApex2 P.rho
  let u := Q.mutualU.1
  let v := Q.mutualV.1
  let deleted₁ := Q.jointDeletion.deleted.1
  let deleted₂ := second.deleted.1
  let four := ({u, v, deleted₁, deleted₂} : Finset ℝ²)
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      Q.mutualU.1 Q.mutualU.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      Q.mutualV.1 Q.mutualV.2).toCriticalFourShell.support ∩ C
  change
    four.card = 4 ∧
      four ⊆ C ∧
      ∃ x : ℝ²,
        C \ four = {x} ∧
        x ∈ C ∧
        x ∉ four ∧
        C = insert x four ∧
        Iu ⊆ {u, x} ∧
        Iv ⊆ {v, x} ∧
        (Iu = {u} ∨ Iu = {u, x}) ∧
        (Iv = {v} ∨ Iv = {v, x})

  have huv : u ≠ v := by
    intro h
    apply Q.mutual_ne
    exact Subtype.ext h
  have hdeleted₁u : deleted₁ ≠ u := by
    intro h
    apply Q.jointDeletion.deleted_ne_u
    exact Subtype.ext h
  have hdeleted₁v : deleted₁ ≠ v := by
    intro h
    apply Q.jointDeletion.deleted_ne_v
    exact Subtype.ext h
  have hdeleted₂u : deleted₂ ≠ u := by
    intro h
    apply second.deleted_ne_u
    exact Subtype.ext h
  have hdeleted₂v : deleted₂ ≠ v := by
    intro h
    apply second.deleted_ne_v
    exact Subtype.ext h
  have hdeleted₂deleted₁ : deleted₂ ≠ deleted₁ := by
    intro h
    apply hsecondNe
    exact Subtype.ext h

  have hfourCard : four.card = 4 := by
    simp [four, huv, Ne.symm hdeleted₁u, Ne.symm hdeleted₁v,
      Ne.symm hdeleted₂u, Ne.symm hdeleted₂v,
      Ne.symm hdeleted₂deleted₁]
  have hfourSub : four ⊆ C := by
    intro z hz
    simp only [four, Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl
    · simpa [u, C] using Q.mutualU_mem_class
    · simpa [v, C] using Q.mutualV_mem_class
    · simpa [deleted₁, C] using
        Q.jointDeletion.deleted_mem_class
    · simpa [deleted₂, C] using second.deleted_mem_class
  have hCcard : C.card = 5 := by
    simpa [C] using P.hclassFive
  have hdiffCard : (C \ four).card = 1 := by
    rw [Finset.card_sdiff_of_subset hfourSub, hCcard, hfourCard]
  rcases Finset.card_eq_one.mp hdiffCard with ⟨x, hdiff⟩
  have hxDiff : x ∈ C \ four := by
    simp [hdiff]
  have hxC : x ∈ C := (Finset.mem_sdiff.mp hxDiff).1
  have hxNotFour : x ∉ four := (Finset.mem_sdiff.mp hxDiff).2

  have hCeq : C = insert x four := by
    apply Finset.Subset.antisymm
    · intro z hzC
      by_cases hzFour : z ∈ four
      · exact Finset.mem_insert_of_mem hzFour
      · have hzDiff : z ∈ C \ four :=
          Finset.mem_sdiff.mpr ⟨hzC, hzFour⟩
        have hzx : z = x := by
          simpa [hdiff] using hzDiff
        simpa [hzx]
    · intro z hz
      simp only [Finset.mem_insert] at hz
      rcases hz with rfl | hzFour
      · exact hxC
      · exact hfourSub hzFour

  have huIu : u ∈ Iu := by
    exact Finset.mem_inter.mpr
      ⟨by
        simpa [u] using
          ((lateFirstApexSystem R).selectedAt
            Q.mutualU.1 Q.mutualU.2).toCriticalFourShell.q_mem_support,
       by simpa [u, C] using Q.mutualU_mem_class⟩
  have hvIv : v ∈ Iv := by
    exact Finset.mem_inter.mpr
      ⟨by
        simpa [v] using
          ((lateFirstApexSystem R).selectedAt
            Q.mutualV.1 Q.mutualV.2).toCriticalFourShell.q_mem_support,
       by simpa [v, C] using Q.mutualV_mem_class⟩

  have hIuSub : Iu ⊆ {u, x} := by
    intro z hz
    have hzRow := (Finset.mem_inter.mp hz).1
    have hzC := (Finset.mem_inter.mp hz).2
    rw [hCeq] at hzC
    simp only [four, Finset.mem_insert, Finset.mem_singleton] at hzC
    rcases hzC with rfl | rfl | rfl | rfl | rfl
    · simp
    · simp
    · exact False.elim (Q.mutualV_not_mem_u_row hzRow)
    · exact False.elim
        (Q.jointDeletion.deleted_not_mem_uRow hzRow)
    · exact False.elim (second.deleted_not_mem_uRow hzRow)
  have hIvSub : Iv ⊆ {v, x} := by
    intro z hz
    have hzRow := (Finset.mem_inter.mp hz).1
    have hzC := (Finset.mem_inter.mp hz).2
    rw [hCeq] at hzC
    simp only [four, Finset.mem_insert, Finset.mem_singleton] at hzC
    rcases hzC with rfl | rfl | rfl | rfl | rfl
    · simp
    · exact False.elim (Q.mutualU_not_mem_v_row hzRow)
    · simp
    · exact False.elim
        (Q.jointDeletion.deleted_not_mem_vRow hzRow)
    · exact False.elim (second.deleted_not_mem_vRow hzRow)

  have hIuNormal : Iu = {u} ∨ Iu = {u, x} := by
    by_cases hxIu : x ∈ Iu
    · right
      apply Finset.Subset.antisymm hIuSub
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact huIu
      · exact hxIu
    · left
      apply Finset.Subset.antisymm
      · intro z hz
        have hzPair := hIuSub hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair
        rcases hzPair with hzu | hzx
        · simpa [hzu]
        · exact False.elim (hxIu (by simpa [hzx] using hz))
      · intro z hz
        have hzu : z = u := by simpa using hz
        simpa [hzu] using huIu
  have hIvNormal : Iv = {v} ∨ Iv = {v, x} := by
    by_cases hxIv : x ∈ Iv
    · right
      apply Finset.Subset.antisymm hIvSub
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact hvIv
      · exact hxIv
    · left
      apply Finset.Subset.antisymm
      · intro z hz
        have hzPair := hIvSub hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair
        rcases hzPair with hzv | hzx
        · simpa [hzv]
        · exact False.elim (hxIv (by simpa [hzx] using hz))
      · intro z hz
        have hzv : z = v := by simpa using hz
        simpa [hzv] using hvIv

  exact
    ⟨hfourCard, hfourSub, x, hdiff, hxC, hxNotFour, hCeq,
      hIuSub, hIvSub, hIuNormal, hIvNormal⟩

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_twoDeletion_rows

end ATailFrontierLiveClosure
end Problem97
