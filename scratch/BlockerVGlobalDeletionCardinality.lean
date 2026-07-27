/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Blocker-v global-deletion cardinality

Scratch extraction of the exact physical-radius consequences of the globally
minimal deletion in the source-equals-`u` physical-apex context.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

private theorem selectedClass_sdiff_eq
    {A E : Finset ℝ²} {center : ℝ²} {radius : ℝ} :
    SelectedClass (A \ E) center radius =
      SelectedClass A center radius \ E := by
  ext z
  simp only [mem_selectedClass, Finset.mem_sdiff]
  aesop

/-- The physical radius class remaining after the global deletion is exactly
the original physical class minus the deleted set. -/
theorem blockerV_globalDeletion_remaining_rhoClass_eq_sdiff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    SelectedClass
        (D.A \ P.globalDeletion.deleted) S.oppApex2 P.rho =
      SelectedClass D.A S.oppApex2 P.rho \
        P.globalDeletion.deleted :=
  selectedClass_sdiff_eq

/-- Restoring `s` removes only the other globally deleted points from the
physical radius class. -/
theorem blockerV_globalDeletion_restored_rhoClass_eq_sdiff_erase
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (s : ℝ²) :
    SelectedClass
        (D.A \ P.globalDeletion.deleted.erase s)
        S.oppApex2 P.rho =
      SelectedClass D.A S.oppApex2 P.rho \
        P.globalDeletion.deleted.erase s :=
  selectedClass_sdiff_eq

private theorem blockerV_globalDeletion_restored_rhoClass_card_ge_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    {s : ℝ²}
    (hs : s ∈ P.globalDeletion.deleted) :
    4 ≤
      (SelectedClass
        (D.A \ P.globalDeletion.deleted.erase s)
        S.oppApex2 P.rho).card := by
  rcases P.globalDeletion.restores s hs with ⟨r, hr, hfour⟩
  have hrho : r = P.rho := by
    by_contra hrne
    apply P.globalDeletion.blocked
    refine ⟨r, hr, ?_⟩
    refine le_trans hfour (Finset.card_le_card ?_)
    intro z hz
    rcases Finset.mem_filter.mp hz with ⟨hzRemaining, hzDist⟩
    apply Finset.mem_filter.mpr
    refine ⟨?_, hzDist⟩
    rcases Finset.mem_sdiff.mp hzRemaining with ⟨hzA, hzNotErased⟩
    refine Finset.mem_sdiff.mpr ⟨hzA, ?_⟩
    intro hzDeleted
    have hzRho :=
      (mem_selectedClass.mp
        (P.globalDeletion.deleted_subset_class hzDeleted)).2
    exact hrne (hzDist.symm.trans (by simpa [P.hcenter] using hzRho))
  simpa [SelectedClass, P.hcenter, hrho] using hfour

/-- Exact-five blocking and one-point restoration force the global deletion
to consist of exactly two physical-class points. -/
theorem blockerV_globalDeletion_deleted_card_eq_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    P.globalDeletion.deleted.card = 2 := by
  let C := SelectedClass D.A S.oppApex2 P.rho
  let V := P.globalDeletion.deleted
  have hVsubC : V ⊆ C := by
    simpa [C, V] using P.globalDeletion.deleted_subset_class
  have hremainingEq :
      SelectedClass (D.A \ V) S.oppApex2 P.rho = C \ V := by
    simpa [C] using
      (selectedClass_sdiff_eq
        (A := D.A) (E := V)
        (center := S.oppApex2) (radius := P.rho))
  have htwoLower : 2 ≤ V.card := by
    by_contra hnot
    apply P.globalDeletion.blocked
    refine ⟨P.rho, P.hrho, ?_⟩
    have hdiffCard : (C \ V).card = C.card - V.card :=
      Finset.card_sdiff_of_subset hVsubC
    have hfour : 4 ≤ (C \ V).card := by
      rw [hdiffCard]
      have hfive : C.card = 5 := by simpa [C] using P.hclassFive
      omega
    rw [← hremainingEq] at hfour
    simpa [SelectedClass, P.hcenter] using hfour
  have htwoUpper : V.card ≤ 2 := by
    rcases P.globalDeletion.deleted_nonempty with ⟨s, hs⟩
    have hsV : s ∈ V := by simpa [V] using hs
    have hfour :=
      blockerV_globalDeletion_restored_rhoClass_card_ge_four
        P (by simpa [V] using hs)
    have hrestoreEq :
        SelectedClass (D.A \ V.erase s) S.oppApex2 P.rho =
          C \ V.erase s := by
      simpa [C] using
        (selectedClass_sdiff_eq
          (A := D.A) (E := V.erase s)
          (center := S.oppApex2) (radius := P.rho))
    have heraseSub : V.erase s ⊆ C :=
      (Finset.erase_subset s V).trans hVsubC
    rw [hrestoreEq, Finset.card_sdiff_of_subset heraseSub,
      Finset.card_erase_of_mem hsV] at hfour
    have hfive : C.card = 5 := by simpa [C] using P.hclassFive
    omega
  simpa [V] using Nat.le_antisymm htwoUpper htwoLower

/-- Exactly three physical-radius points remain after the global deletion. -/
theorem blockerV_globalDeletion_remaining_rhoClass_card_eq_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    (SelectedClass
      (D.A \ P.globalDeletion.deleted)
      S.oppApex2 P.rho).card = 3 := by
  rw [blockerV_globalDeletion_remaining_rhoClass_eq_sdiff,
    Finset.card_sdiff_of_subset
      P.globalDeletion.deleted_subset_class,
    P.hclassFive,
    blockerV_globalDeletion_deleted_card_eq_two P]

/-- Restoring a deleted point yields exactly four physical-radius points. -/
theorem blockerV_globalDeletion_restored_rhoClass_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    {s : ℝ²}
    (hs : s ∈ P.globalDeletion.deleted) :
    (SelectedClass
      (D.A \ P.globalDeletion.deleted.erase s)
      S.oppApex2 P.rho).card = 4 := by
  rw [blockerV_globalDeletion_restored_rhoClass_eq_sdiff_erase,
    Finset.card_sdiff_of_subset]
  · rw [P.hclassFive, Finset.card_erase_of_mem hs,
      blockerV_globalDeletion_deleted_card_eq_two P]
  · exact
      (Finset.erase_subset s P.globalDeletion.deleted).trans
        P.globalDeletion.deleted_subset_class

/-- Restoring `s` adds precisely `s` to the remaining physical-radius class. -/
theorem blockerV_globalDeletion_restored_rhoClass_eq_insert_remaining
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    {s : ℝ²}
    (hs : s ∈ P.globalDeletion.deleted) :
    SelectedClass
        (D.A \ P.globalDeletion.deleted.erase s)
        S.oppApex2 P.rho =
      insert s
        (SelectedClass
          (D.A \ P.globalDeletion.deleted)
          S.oppApex2 P.rho) := by
  rw [blockerV_globalDeletion_restored_rhoClass_eq_sdiff_erase,
    blockerV_globalDeletion_remaining_rhoClass_eq_sdiff]
  ext z
  simp only [Finset.mem_sdiff, Finset.mem_erase, Finset.mem_insert]
  constructor
  · rintro ⟨hzClass, hzNotErase⟩
    by_cases hzs : z = s
    · exact Or.inl hzs
    · exact Or.inr ⟨hzClass, fun hzDeleted ↦ hzNotErase ⟨hzs, hzDeleted⟩⟩
  · rintro (rfl | ⟨hzClass, hzNotDeleted⟩)
    · exact ⟨P.globalDeletion.deleted_subset_class hs, by simp⟩
    · exact ⟨hzClass, fun hzErase ↦ hzNotDeleted hzErase.2⟩

#print axioms blockerV_globalDeletion_deleted_card_eq_two
#print axioms blockerV_globalDeletion_remaining_rhoClass_card_eq_three
#print axioms blockerV_globalDeletion_restored_rhoClass_card_eq_four
#print axioms blockerV_globalDeletion_restored_rhoClass_eq_insert_remaining

end ATailFrontierLiveClosure
end Problem97
