import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Third-blocker survival audit

Kernel-check the exact positive and negative content of the cap-eight
third-blocker producer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactLeafMathScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- The precise information supplied by a third blocker's two deletion
survival disjunctions.  On each source-exact collision radius, its selected
row contains at most one of the two strict-cap points. -/
theorem crossPairDeletionSurvivals_force_atMostOne_on_each_exact_slice
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
          (H.centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase P.source₂)
          (H.centerAt source.1 source.2))
    (hsurvivesρ :
      HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₁)
          (H.centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₂)
          (H.centerAt source.1 source.2))
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂}) :
    ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1)).card ≤ 1 ∧
      ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1)).card ≤ 1 := by
  classical
  let K :=
    (H.selectedAt source.1 source.2).toCriticalFourShell.support
  have homit :
      P.source₁ ∉ K ∨ P.source₂ ∉ K := by
    rcases hsurvives with hsource₁ | hsource₂
    · exact Or.inl
        ((cross_deletion_survives_iff_not_mem_selected_support
          H source.2).mp hsource₁)
    · exact Or.inr
        ((cross_deletion_survives_iff_not_mem_selected_support
          H source.2).mp hsource₂)
  have homitρ :
      Pρ.source₁ ∉ K ∨ Pρ.source₂ ∉ K := by
    rcases hsurvivesρ with hsource₁ | hsource₂
    · exact Or.inl
        ((cross_deletion_survives_iff_not_mem_selected_support
          H source.2).mp hsource₁)
    · exact Or.inr
        ((cross_deletion_survives_iff_not_mem_selected_support
          H source.2).mp hsource₂)
  have pair_card_le_one
      {a b : ℝ²} (h : a ∉ K ∨ b ∉ K) :
      (K ∩ ({a, b} : Finset ℝ²)).card ≤ 1 := by
    rcases h with ha | hb
    · have hsub : K ∩ ({a, b} : Finset ℝ²) ⊆ {b} := by
        intro z hz
        rcases Finset.mem_inter.mp hz with ⟨hzK, hzPair⟩
        simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair ⊢
        rcases hzPair with rfl | rfl
        · exact False.elim (ha hzK)
        · rfl
      exact le_trans (Finset.card_le_card hsub) (by simp)
    · have hsub : K ∩ ({a, b} : Finset ℝ²) ⊆ {a} := by
        intro z hz
        rcases Finset.mem_inter.mp hz with ⟨hzK, hzPair⟩
        simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair ⊢
        rcases hzPair with rfl | rfl
        · rfl
        · exact False.elim (hb hzK)
      exact le_trans (Finset.card_le_card hsub) (by simp)
  constructor
  · change
      (K ∩
        (SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1)).card ≤ 1
    rw [hfrontierInteriorEq]
    exact pair_card_le_one homit
  · change
      (K ∩
        (SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1)).card ≤ 1
    rw [hρInteriorEq]
    exact pair_card_le_one homitρ

#print axioms crossPairDeletionSurvivals_force_atMostOne_on_each_exact_slice

end ExactLeafMathScratch
end Problem97
