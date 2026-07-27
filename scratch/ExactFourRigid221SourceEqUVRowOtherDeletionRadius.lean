/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyDirect

/-!
# Exact-four source-equals-u branch: global-deletion radius rigidity

At the physical second apex, global blocking forces every positive radius
supporting four ambient points to be the rigid exact-five radius.  Hence every
one-point restoration supplied by the minimal global deletion uses that same
radius.

The exact-five class and the restoration inequalities then determine the
global deletion completely at the level of cardinalities: exactly two
physical-class points are deleted, three remain, and restoring either deleted
point gives exactly four points at the physical radius.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

private theorem selectedClass_sdiff
    {A E : Finset ℝ²} {center : ℝ²} {radius : ℝ} :
    SelectedClass (A \ E) center radius =
      SelectedClass A center radius \ E := by
  ext z
  simp only [mem_selectedClass, Finset.mem_sdiff]
  aesop

/-- Any positive radius with at least four ambient points at the physical
second apex is the rigid exact-five radius. -/
theorem exactFourRigid221_sourceEqU_apex_largeRadius_eq_rho
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    {r : ℝ}
    (hr : 0 < r)
    (hfour :
      4 ≤ (D.A.filter fun q => dist S.oppApex2 q = r).card) :
    r = P.rho := by
  by_contra hrne
  apply P.globalDeletion.blocked
  refine ⟨r, hr, le_trans hfour (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
  apply Finset.mem_filter.mpr
  refine ⟨Finset.mem_sdiff.mpr ⟨hzA, ?_⟩, ?_⟩
  · intro hzdel
    have hzrho :=
      (mem_selectedClass.mp
        (P.globalDeletion.deleted_subset_class hzdel)).2
    exact hrne (hzdist.symm.trans hzrho)
  · simpa [P.hcenter] using hzdist

/-- The same radius rigidity holds in every one-point-restored carrier. -/
theorem exactFourRigid221_sourceEqU_restored_largeRadius_eq_rho
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (s : ℝ²)
    {r : ℝ}
    (hr : 0 < r)
    (hfour :
      4 ≤
        ((D.A \ P.globalDeletion.deleted.erase s).filter
          fun q => dist S.oppApex2 q = r).card) :
    r = P.rho := by
  apply exactFourRigid221_sourceEqU_apex_largeRadius_eq_rho P hr
  exact
    le_trans hfour (Finset.card_le_card (by
      intro z hz
      rcases Finset.mem_filter.mp hz with ⟨hzremaining, hzdist⟩
      exact
        Finset.mem_filter.mpr
          ⟨(Finset.mem_sdiff.mp hzremaining).1, hzdist⟩))

/-- Every minimal one-point restoration has at least four points at `rho`;
thus its existential restoration radius has been pinned to `rho`. -/
theorem exactFourRigid221_sourceEqU_restore_rhoClass_card_ge_four
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
  have hre : r = P.rho := by
    apply exactFourRigid221_sourceEqU_restored_largeRadius_eq_rho P s hr
    simpa [P.hcenter] using hfour
  simpa [SelectedClass, P.hcenter, hre] using hfour

/-- The remaining physical-radius class is the original class minus the
global deletion. -/
theorem exactFourRigid221_sourceEqU_remaining_rhoClass_eq_sdiff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    SelectedClass
        (D.A \ P.globalDeletion.deleted) S.oppApex2 P.rho =
      SelectedClass D.A S.oppApex2 P.rho \
        P.globalDeletion.deleted :=
  selectedClass_sdiff

/-- A one-point-restored physical-radius class is the original class minus
all deleted points other than the restored point. -/
theorem exactFourRigid221_sourceEqU_restored_rhoClass_eq_sdiff_erase
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
  selectedClass_sdiff

/-- Exact-five blocking and every one-point restoration force the global
deletion to contain exactly two physical-class points. -/
theorem exactFourRigid221_sourceEqU_globalDeletion_card_eq_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    P.globalDeletion.deleted.card = 2 := by
  let C := SelectedClass D.A S.oppApex2 P.rho
  let G := P.globalDeletion
  have hremainingLt :
      (SelectedClass
        (D.A \ G.deleted) S.oppApex2 P.rho).card < 4 := by
    by_contra hnot
    have hfourRemaining :
        4 ≤
          (SelectedClass
            (D.A \ G.deleted) S.oppApex2 P.rho).card :=
      Nat.le_of_not_gt hnot
    apply G.blocked
    refine ⟨P.rho, P.hrho, ?_⟩
    simpa [G, SelectedClass, P.hcenter] using hfourRemaining
  have hremainingEq :
      SelectedClass (D.A \ G.deleted) S.oppApex2 P.rho =
        C \ G.deleted := by
    simpa [C] using
      (selectedClass_sdiff
        (A := D.A) (E := G.deleted)
        (center := S.oppApex2) (radius := P.rho))
  have hdeletedSubset : G.deleted ⊆ C := by
    simpa [G, C] using G.deleted_subset_class
  have hdeletedLower : 2 ≤ G.deleted.card := by
    rw [hremainingEq,
      Finset.card_sdiff_of_subset hdeletedSubset] at hremainingLt
    have hfive : C.card = 5 := by
      simpa [C] using P.hclassFive
    omega
  have hdeletedLowerP :
      2 ≤ P.globalDeletion.deleted.card := by
    simpa [G] using hdeletedLower
  rcases G.deleted_nonempty with ⟨s, hs⟩
  have hrestore :=
    exactFourRigid221_sourceEqU_restore_rhoClass_card_ge_four
      P (by simpa [G] using hs)
  have hrestoreEq :
      SelectedClass
          (D.A \ G.deleted.erase s) S.oppApex2 P.rho =
        C \ G.deleted.erase s := by
    simpa [C] using
      (selectedClass_sdiff
        (A := D.A) (E := G.deleted.erase s)
        (center := S.oppApex2) (radius := P.rho))
  have heraseSubset : G.deleted.erase s ⊆ C :=
    fun z hz => hdeletedSubset (Finset.mem_of_mem_erase hz)
  rw [hrestoreEq,
    Finset.card_sdiff_of_subset heraseSubset] at hrestore
  have hfive : C.card = 5 := by
    simpa [C] using P.hclassFive
  have heraseCard :
      (G.deleted.erase s).card = G.deleted.card - 1 :=
    Finset.card_erase_of_mem hs
  have hdeletedUpper : G.deleted.card ≤ 2 := by
    omega
  have hdeletedUpperP :
      P.globalDeletion.deleted.card ≤ 2 := by
    simpa [G] using hdeletedUpper
  omega

/-- Exactly three points of the physical-radius class remain after the
global deletion. -/
theorem exactFourRigid221_sourceEqU_remaining_rhoClass_card_eq_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    (SelectedClass
      (D.A \ P.globalDeletion.deleted)
      S.oppApex2 P.rho).card = 3 := by
  rw [selectedClass_sdiff,
    Finset.card_sdiff_of_subset
      P.globalDeletion.deleted_subset_class,
    P.hclassFive,
    exactFourRigid221_sourceEqU_globalDeletion_card_eq_two P]

/-- Restoring any deleted point gives exactly four points at the physical
radius. -/
theorem exactFourRigid221_sourceEqU_restored_rhoClass_card_eq_four
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
  rw [selectedClass_sdiff, Finset.card_sdiff_of_subset]
  · rw [P.hclassFive,
      Finset.card_erase_of_mem hs,
      exactFourRigid221_sourceEqU_globalDeletion_card_eq_two P]
  · intro z hz
    exact
      P.globalDeletion.deleted_subset_class
        (Finset.mem_of_mem_erase hz)

/-- Restoring `s` adds exactly `s` to the remaining physical-radius class. -/
theorem exactFourRigid221_sourceEqU_restored_rhoClass_eq_insert_remaining
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
  rw [selectedClass_sdiff, selectedClass_sdiff]
  ext z
  simp only [Finset.mem_sdiff, Finset.mem_erase, Finset.mem_insert]
  constructor
  · rintro ⟨hzClass, hzNotErase⟩
    by_cases hzs : z = s
    · exact Or.inl hzs
    · exact
        Or.inr
          ⟨hzClass, fun hzdel => hzNotErase ⟨hzs, hzdel⟩⟩
  · rintro (rfl | ⟨hzClass, hzNotDeleted⟩)
    · exact
        ⟨P.globalDeletion.deleted_subset_class hs, by simp⟩
    · exact
        ⟨hzClass, fun hzErase => hzNotDeleted hzErase.2⟩

#print axioms exactFourRigid221_sourceEqU_apex_largeRadius_eq_rho
#print axioms exactFourRigid221_sourceEqU_restored_largeRadius_eq_rho
#print axioms exactFourRigid221_sourceEqU_restore_rhoClass_card_ge_four
#print axioms exactFourRigid221_sourceEqU_remaining_rhoClass_eq_sdiff
#print axioms exactFourRigid221_sourceEqU_restored_rhoClass_eq_sdiff_erase
#print axioms exactFourRigid221_sourceEqU_globalDeletion_card_eq_two
#print axioms exactFourRigid221_sourceEqU_remaining_rhoClass_card_eq_three
#print axioms exactFourRigid221_sourceEqU_restored_rhoClass_card_eq_four
#print axioms exactFourRigid221_sourceEqU_restored_rhoClass_eq_insert_remaining

end ATailFrontierLiveClosure
end Problem97
