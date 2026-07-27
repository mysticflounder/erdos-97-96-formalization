/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveTwoDeletionRows

/-!
# Incidence normal form after two exact-five joint deletions

This file combines the two-deletion row classification with the asymmetric
source-incidence data retained by the good-source restart.
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

private theorem finset_eq_sourceSingleton_or_oneOf_two
    {α : Type*} [DecidableEq α]
    (I : Finset α) (x a b : α)
    (hxa : x ≠ a) (hxb : x ≠ b) (hab : a ≠ b)
    (hsub : I ⊆ {x, a, b})
    (hx : x ∈ I)
    (hcard : I.card ≤ 2) :
    I = {x} ∨ I = {x, a} ∨ I = {x, b} := by
  by_cases ha : a ∈ I
  · by_cases hb : b ∈ I
    · have hthreeSub : ({x, a, b} : Finset α) ⊆ I := by
        intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl | rfl
        · exact hx
        · exact ha
        · exact hb
      have hthreeCard : ({x, a, b} : Finset α).card = 3 := by
        simp [hxa, hxb, hab]
      have hthreeLe := Finset.card_le_card hthreeSub
      rw [hthreeCard] at hthreeLe
      omega
    · exact Or.inr (Or.inl (by
        apply Finset.Subset.antisymm
        · intro z hz
          have hzThree := hsub hz
          simp only [Finset.mem_insert, Finset.mem_singleton] at hzThree ⊢
          rcases hzThree with rfl | rfl | rfl
          · exact Or.inl rfl
          · exact Or.inr rfl
          · exact False.elim (hb hz)
        · intro z hz
          simp only [Finset.mem_insert, Finset.mem_singleton] at hz
          rcases hz with rfl | rfl
          · exact hx
          · exact ha))
  · by_cases hb : b ∈ I
    · exact Or.inr (Or.inr (by
        apply Finset.Subset.antisymm
        · intro z hz
          have hzThree := hsub hz
          simp only [Finset.mem_insert, Finset.mem_singleton] at hzThree ⊢
          rcases hzThree with rfl | rfl | rfl
          · exact Or.inl rfl
          · exact False.elim (ha hz)
          · exact Or.inr rfl
        · intro z hz
          simp only [Finset.mem_insert, Finset.mem_singleton] at hz
          rcases hz with rfl | rfl
          · exact hx
          · exact hb))
    · exact Or.inl (by
        apply Finset.Subset.antisymm
        · intro z hz
          have hzThree := hsub hz
          simp only [Finset.mem_insert, Finset.mem_singleton] at hzThree
          rcases hzThree with rfl | rfl | rfl
          · simp
          · exact False.elim (ha hz)
          · exact False.elim (hb hz)
        · intro z hz
          have hzx : z = x := by simpa using hz
          simpa [hzx] using hx)

/-- The exact incidence normal form forced by the retained source data.

If `mutualU` is the good source, the good-source class row is exactly `Iu`.
Otherwise the source is the unique fifth class point `x`, `Iu` is forced to
the two-point row `{u, x}`, and the good-source row omits both `u` and `v`.
Its class intersection can then contain at most one of the two deletions. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_twoDeletion_incidence
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
    let sourceRow :=
      ((lateFirstApexSystem R).selectedAt
        goodSource.1 goodSource.2).toCriticalFourShell.support
    let sourceI := sourceRow ∩ C
    let Iu :=
      ((lateFirstApexSystem R).selectedAt
        Q.mutualU.1 Q.mutualU.2).toCriticalFourShell.support ∩ C
    let Iv :=
      ((lateFirstApexSystem R).selectedAt
        Q.mutualV.1 Q.mutualV.2).toCriticalFourShell.support ∩ C
    ∃ x : ℝ²,
      C \ four = {x} ∧
      x ∈ C ∧
      x ∉ four ∧
      C = insert x four ∧
      goodSource.1 ∈ Iu ∧
      goodSource ≠ Q.mutualV ∧
      v ∉ sourceRow ∧
      (Iu = {u} ∨ Iu = {u, x}) ∧
      (Iv = {v} ∨ Iv = {v, x}) ∧
      ((Q.mutualU = goodSource ∧ sourceI = Iu) ∨
        (Q.mutualU ≠ goodSource ∧
          goodSource.1 = x ∧
          Iu = {u, x} ∧
          u ∉ sourceRow ∧
          (sourceI = {x} ∨
            sourceI = {x, deleted₁} ∨
            sourceI = {x, deleted₂}))) := by
  classical
  let C := SelectedClass D.A S.oppApex2 P.rho
  let u := Q.mutualU.1
  let v := Q.mutualV.1
  let deleted₁ := Q.jointDeletion.deleted.1
  let deleted₂ := second.deleted.1
  let four := ({u, v, deleted₁, deleted₂} : Finset ℝ²)
  let sourceRow :=
    ((lateFirstApexSystem R).selectedAt
      goodSource.1 goodSource.2).toCriticalFourShell.support
  let sourceI := sourceRow ∩ C
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      Q.mutualU.1 Q.mutualU.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      Q.mutualV.1 Q.mutualV.2).toCriticalFourShell.support ∩ C
  change
    ∃ x : ℝ²,
      C \ four = {x} ∧
      x ∈ C ∧
      x ∉ four ∧
      C = insert x four ∧
      goodSource.1 ∈ Iu ∧
      goodSource ≠ Q.mutualV ∧
      v ∉ sourceRow ∧
      (Iu = {u} ∨ Iu = {u, x}) ∧
      (Iv = {v} ∨ Iv = {v, x}) ∧
      ((Q.mutualU = goodSource ∧ sourceI = Iu) ∨
        (Q.mutualU ≠ goodSource ∧
          goodSource.1 = x ∧
          Iu = {u, x} ∧
          u ∉ sourceRow ∧
          (sourceI = {x} ∨
            sourceI = {x, deleted₁} ∨
            sourceI = {x, deleted₂})))

  rcases
      exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_twoDeletion_rows
        P goodSource Q second hsecondNe with
    ⟨_hfourCard, _hfourSub, x, hdiff, hxC, hxNotFour, hCeq,
      hIuSub, _hIvSub, hIuNormal, hIvNormal⟩
  change C \ four = {x} at hdiff
  change x ∈ C at hxC
  change x ∉ four at hxNotFour
  change C = insert x four at hCeq
  change Iu ⊆ {u, x} at hIuSub
  change Iu = {u} ∨ Iu = {u, x} at hIuNormal
  change Iv = {v} ∨ Iv = {v, x} at hIvNormal

  have hsourceInIu : goodSource.1 ∈ Iu := by
    exact Finset.mem_inter.mpr
      ⟨by simpa [sourceRow] using Q.context.source_mem_u_row,
       by simpa [C] using Q.context.source_mem_class⟩
  have hvNotSourceRow : v ∉ sourceRow := by
    simpa [v, sourceRow] using Q.context.v_not_mem_source_row
  have hsourceSelf : goodSource.1 ∈ sourceRow := by
    simpa [sourceRow] using
      ((lateFirstApexSystem R).selectedAt
        goodSource.1 goodSource.2).toCriticalFourShell.q_mem_support
  have hsourceNeV : goodSource ≠ Q.mutualV := by
    intro hsourceV
    apply hvNotSourceRow
    simpa [v, hsourceV] using hsourceSelf

  refine
    ⟨x, hdiff, hxC, hxNotFour, hCeq, hsourceInIu,
      hsourceNeV, hvNotSourceRow, hIuNormal, hIvNormal, ?_⟩
  by_cases huSource : Q.mutualU = goodSource
  · left
    refine ⟨huSource, ?_⟩
    have hrows :=
      congrArg
        (fun w : CarrierVertex D.A =>
          ((lateFirstApexSystem R).selectedAt
            w.1 w.2).toCriticalFourShell.support)
        huSource
    have hinter :=
      congrArg (fun J : Finset ℝ² => J ∩ C) hrows.symm
    simpa [sourceI, sourceRow, Iu] using hinter
  · right
    have hsourceX : goodSource.1 = x := by
      have hsourcePair := hIuSub hsourceInIu
      simp only [Finset.mem_insert, Finset.mem_singleton] at hsourcePair
      rcases hsourcePair with hsourceU | hsourceX
      · exfalso
        apply huSource
        exact (Subtype.ext hsourceU.symm)
      · exact hsourceX
    have huIu : u ∈ Iu := by
      exact Finset.mem_inter.mpr
        ⟨by
          simpa [u] using
            ((lateFirstApexSystem R).selectedAt
              Q.mutualU.1 Q.mutualU.2).toCriticalFourShell.q_mem_support,
         by simpa [u, C] using Q.mutualU_mem_class⟩
    have hxIu : x ∈ Iu := by
      simpa [hsourceX] using hsourceInIu
    have hIuPair : Iu = {u, x} := by
      apply Finset.Subset.antisymm hIuSub
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact huIu
      · exact hxIu
    have huNotSourceRow : u ∉ sourceRow := by
      rcases Q.context.u_eq_source_or_not_mem_source_row with
        huSource' | huNot
      · exact False.elim (huSource huSource')
      · simpa [u, sourceRow] using huNot
    have hsourceInSourceI : goodSource.1 ∈ sourceI :=
      Finset.mem_inter.mpr
        ⟨hsourceSelf, by simpa [C] using Q.context.source_mem_class⟩
    have hxSourceI : x ∈ sourceI := by
      simpa [hsourceX] using hsourceInSourceI
    have hsourceISub :
        sourceI ⊆ {x, deleted₁, deleted₂} := by
      intro z hz
      have hzRow := (Finset.mem_inter.mp hz).1
      have hzC := (Finset.mem_inter.mp hz).2
      rw [hCeq] at hzC
      simp only [four, Finset.mem_insert, Finset.mem_singleton] at hzC
      rcases hzC with rfl | rfl | rfl | rfl | rfl
      · simp
      · exact False.elim (huNotSourceRow hzRow)
      · exact False.elim (hvNotSourceRow hzRow)
      · simp
      · simp
    have hsourceICard : sourceI.card ≤ 2 := by
      simpa [sourceI, sourceRow, C] using
        actualLateRow_secondClass_card_le_two
          R P.surface goodSource
    have hxNeDeleted₁ : x ≠ deleted₁ := by
      intro hx
      apply hxNotFour
      simp [four, hx]
    have hxNeDeleted₂ : x ≠ deleted₂ := by
      intro hx
      apply hxNotFour
      simp [four, hx]
    have hdeleted₁NeDeleted₂ : deleted₁ ≠ deleted₂ := by
      intro hdeleted
      apply hsecondNe
      exact Subtype.ext hdeleted.symm
    have hsourceINormal :
        sourceI = {x} ∨
          sourceI = {x, deleted₁} ∨
          sourceI = {x, deleted₂} :=
      finset_eq_sourceSingleton_or_oneOf_two
        sourceI x deleted₁ deleted₂
          hxNeDeleted₁ hxNeDeleted₂ hdeleted₁NeDeleted₂
          hsourceISub hxSourceI hsourceICard
    exact
      ⟨huSource, hsourceX, hIuPair, huNotSourceRow,
        hsourceINormal⟩

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_twoDeletion_incidence

end ATailFrontierLiveClosure
end Problem97
