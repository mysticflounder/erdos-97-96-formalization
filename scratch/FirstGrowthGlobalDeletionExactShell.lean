import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# First-growth global-deletion exact shell

Scratch extraction of the exact physical-apex consequences of the global
minimal deletion.  This file deliberately does not alter production.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable
set_option maxHeartbeats 800000

/-- At the physical second apex, the global minimal deletion removes exactly
two points from the physical five-class.  Consequently its surviving
physical shell has exactly three points, while restoring either deleted point
gives exactly four physical-shell points. -/
theorem exactFourRigid221_firstGrowth_globalDeletion_exactShell_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    P.globalDeletion.deleted.card = 2 ∧
      SelectedClass
          (D.A \ P.globalDeletion.deleted) S.oppApex2 P.rho =
        SelectedClass D.A S.oppApex2 P.rho \
          P.globalDeletion.deleted ∧
      (SelectedClass
          (D.A \ P.globalDeletion.deleted) S.oppApex2 P.rho).card = 3 ∧
      ∀ s ∈ P.globalDeletion.deleted,
        (SelectedClass
          (D.A \ (P.globalDeletion.deleted.erase s))
          S.oppApex2 P.rho).card = 4 := by
  classical
  let C := SelectedClass D.A S.oppApex2 P.rho
  let V := P.globalDeletion.deleted
  have hVsubC : V ⊆ C := by
    simpa [C, V] using P.globalDeletion.deleted_subset_class
  have hclassDeleted :
      SelectedClass (D.A \ V) S.oppApex2 P.rho = C \ V := by
    ext z
    simp [C, SelectedClass, and_assoc, and_comm]
  have htwoLower : 2 ≤ V.card := by
    by_contra hnot
    have hleOne : V.card ≤ 1 := by omega
    have hdiffCard : (C \ V).card = C.card - V.card :=
      Finset.card_sdiff_of_subset hVsubC
    have hfour : 4 ≤ (C \ V).card := by
      rw [hdiffCard]
      dsimp [C]
      rw [P.hclassFive]
      omega
    apply P.globalDeletion.blocked
    rw [P.hcenter]
    refine ⟨P.rho, P.hrho, ?_⟩
    simpa [SelectedClass] using
      (show 4 ≤
        (SelectedClass (D.A \ V) S.oppApex2 P.rho).card by
          rw [hclassDeleted]
          exact hfour)
  have htwoUpper : V.card ≤ 2 := by
    rcases P.globalDeletion.deleted_nonempty with ⟨s, hs⟩
    have hsV : s ∈ V := by simpa [V] using hs
    rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
        (P.globalDeletion.restores s hs) with
      ⟨r, hr, hfourRestored⟩
    have hsRestored :
        s ∈ SelectedClass
          (D.A \ (V.erase s)) P.globalDeletion.center r := by
      by_contra hsNot
      apply P.globalDeletion.blocked
      have hsameCard :=
        selectedClass_erase_card_eq_of_not_mem
          (A := D.A \ (V.erase s))
          (x := s) (s := P.globalDeletion.center) (d := r) hsNot
      have hfourErased :
          4 ≤
            (SelectedClass
              ((D.A \ (V.erase s)).erase s)
              P.globalDeletion.center r).card := by
        rw [hsameCard]
        exact hfourRestored
      have hcarrierEq :
          (D.A \ (V.erase s)).erase s = D.A \ V := by
        ext z
        by_cases hzs : z = s
        · subst z
          simp [hsV]
        · simp [hzs]
      rw [hcarrierEq] at hfourErased
      exact ⟨r, hr, by simpa [SelectedClass, V] using hfourErased⟩
    have hsR : dist P.globalDeletion.center s = r :=
      (mem_selectedClass.mp hsRestored).2
    have hsC : s ∈ C := hVsubC hsV
    have hsRho : dist S.oppApex2 s = P.rho :=
      (mem_selectedClass.mp (by simpa [C] using hsC)).2
    have hrEq : r = P.rho := by
      rw [← hsR, P.hcenter]
      exact hsRho
    have hclassRestored :
        SelectedClass (D.A \ (V.erase s))
            P.globalDeletion.center r =
          C \ (V.erase s) := by
      ext z
      simp [C, SelectedClass, P.hcenter, hrEq, and_assoc, and_comm]
    have hfourDiff : 4 ≤ (C \ (V.erase s)).card := by
      rw [← hclassRestored]
      exact hfourRestored
    have hEraseSub : V.erase s ⊆ C :=
      (Finset.erase_subset s V).trans hVsubC
    have hdiffCard :
        (C \ (V.erase s)).card = C.card - (V.erase s).card :=
      Finset.card_sdiff_of_subset hEraseSub
    have hEraseCard : (V.erase s).card = V.card - 1 :=
      Finset.card_erase_of_mem hsV
    rw [hdiffCard, hEraseCard] at hfourDiff
    dsimp [C] at hfourDiff
    rw [P.hclassFive] at hfourDiff
    omega
  have hVcard : V.card = 2 := by omega
  have hremainingCard : (C \ V).card = 3 := by
    rw [Finset.card_sdiff_of_subset hVsubC, hVcard]
    dsimp [C]
    rw [P.hclassFive]
  refine ⟨by simpa [V] using hVcard, ?_, ?_, ?_⟩
  · simpa [C, V] using hclassDeleted
  · rw [hclassDeleted]
    exact hremainingCard
  · intro s hs
    have hsV : s ∈ V := by simpa [V] using hs
    have hEraseSub : V.erase s ⊆ C :=
      (Finset.erase_subset s V).trans hVsubC
    have hEraseCard : (V.erase s).card = 1 := by
      rw [Finset.card_erase_of_mem hsV, hVcard]
    have hclassRestored :
        SelectedClass (D.A \ (V.erase s)) S.oppApex2 P.rho =
          C \ (V.erase s) := by
      ext z
      simp [C, SelectedClass, and_assoc, and_comm]
    rw [hclassRestored, Finset.card_sdiff_of_subset hEraseSub, hEraseCard]
    dsimp [C]
    rw [P.hclassFive]

/-- A finite incidence model showing that the exact `5 - 2 = 3` deletion
arithmetic alone is compatible with either remaining two-point row trace.
This is not a model of the full geometric context; it isolates the missing
link between the global deleted set and the row trace. -/
theorem firstGrowth_globalDeletion_arithmetic_does_not_choose_row_probe :
    let C : Finset (Fin 5) := Finset.univ
    let globalDeleted : Finset (Fin 5) := {0, 1}
    let vRow : Finset (Fin 5) := {3, 2}
    let oldDeletedRow : Finset (Fin 5) := {3, 4}
    C.card = 5 ∧
      globalDeleted ⊆ C ∧
      globalDeleted.card = 2 ∧
      (C \ globalDeleted).card = 3 ∧
      ¬4 ≤ (C \ globalDeleted).card ∧
      (∀ s ∈ globalDeleted,
        4 ≤ (C \ (globalDeleted.erase s)).card) ∧
      (C \ (globalDeleted.erase 0)).card = 4 ∧
      (C \ (globalDeleted.erase 1)).card = 4 ∧
      2 ∈ vRow ∧
      4 ∈ oldDeletedRow := by
  decide

end ATailFrontierLiveClosure
end Problem97

#print axioms
  Problem97.ATailFrontierLiveClosure.exactFourRigid221_firstGrowth_globalDeletion_exactShell_probe
#print axioms
  Problem97.ATailFrontierLiveClosure.firstGrowth_globalDeletion_arithmetic_does_not_choose_row_probe
