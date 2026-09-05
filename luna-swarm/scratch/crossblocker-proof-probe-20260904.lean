/-
Bounded read-only probe for the unresolved cross-blocker leaf.

The target deliberately cannot import the downstream TwoSourceClosure chain.
These checks record the strongest source-level upstream interfaces available
without introducing that cycle.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceCanonicalSurface
import Erdos9796Proof.P97.ATail.FirstFiberOverlapDescent

/-!
# Cross-blocker proof probe

This scratch module records only source-clean consequences of the four
cross-blocker equality arms.  In particular, an equality gives its matching
shell omission; it does not by itself negate the independent four-way hit
disjunction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace CrossBlockerProofProbe

open ATailFirstFiberOverlapDescent
open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailFrontierLiveClosure
open ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCollisionGlobalProducer

#check firstFiber_firstSourceHit_or_fiveCenterDeletion
#check false_of_firstFiber_explicit_overlap_card_ge_three
#check false_of_firstFiber_twoOutsideHits_of_capCenter
#check ATailRetainedCollisionCapLocalization.false_of_distinct_actualRow_contains_collisionSources
#check ATailRetainedCollisionCapLocalization.actualRow_center_eq_commonBlocker_of_sameCap_outside_sources
#check CriticalFourShell.center_not_mem_support

theorem named_cross_blocker_omissions
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) :
    (H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ →
      Pρ.source₁ ∉
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support) ∧
    (H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ →
      Pρ.source₂ ∉
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support) ∧
    (H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ →
      P.source₁ ∉
        (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support) ∧
    (H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂ →
      P.source₂ ∉
        (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support) := by
  constructor
  · intro h
    intro hmem
    apply CriticalFourShell.center_not_mem_support
      (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell
    simpa [h] using hmem
  constructor
  · intro h
    intro hmem
    apply CriticalFourShell.center_not_mem_support
      (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell
    simpa [h] using hmem
  constructor
  · intro h
    intro hmem
    apply CriticalFourShell.center_not_mem_support
      (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell
    simpa [h] using hmem
  · intro h
    intro hmem
    apply CriticalFourShell.center_not_mem_support
      (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell
    simpa [h] using hmem

theorem crossBlockerCoincidence_corresponding_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hcoincidence : CrossBlockerCoincidence P Pρ) :
    (H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ ∧
        Pρ.source₁ ∉
          (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support) ∨
      (H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ ∧
        Pρ.source₂ ∉
          (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support) ∨
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ ∧
        P.source₁ ∉
          (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support) ∨
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂ ∧
        P.source₂ ∉
          (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support) := by
  rcases hcoincidence with h | h | h | h
  · exact Or.inl ⟨h, (named_cross_blocker_omissions P Pρ).1 h⟩
  · exact Or.inr (Or.inl ⟨h, (named_cross_blocker_omissions P Pρ).2.1 h⟩)
  · exact Or.inr (Or.inr (Or.inl ⟨h, (named_cross_blocker_omissions P Pρ).2.2.1 h⟩))
  · exact Or.inr (Or.inr (Or.inr ⟨h, (named_cross_blocker_omissions P Pρ).2.2.2 h⟩))

theorem disjoint_collisionPairs_not_collisionCrossHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂}) :
    ¬ CollisionCrossHit P Pρ := by
  have hPρsource₁_cap : Pρ.source₁ ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.source₁_mem_capInterior
  have hPρsource₂_cap : Pρ.source₂ ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.source₂_mem_capInterior
  have hPsource₁_cap : P.source₁ ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₁_mem_capInterior
  have hPsource₂_cap : P.source₂ ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₂_mem_capInterior
  have hPρsource₁_not_mem :
      Pρ.source₁ ∉
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support := by
    intro hmem
    have hpair : Pρ.source₁ ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by
      rw [← P.shell_inter_cap_eq_sources]
      exact Finset.mem_inter.mpr ⟨hmem, hPρsource₁_cap⟩
    exact Finset.disjoint_left.mp hpairsDisjoint hpair (by simp)
  have hPρsource₂_not_mem :
      Pρ.source₂ ∉
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support := by
    intro hmem
    have hpair : Pρ.source₂ ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by
      rw [← P.shell_inter_cap_eq_sources]
      exact Finset.mem_inter.mpr ⟨hmem, hPρsource₂_cap⟩
    exact Finset.disjoint_left.mp hpairsDisjoint hpair (by simp)
  have hPsource₁_not_mem :
      P.source₁ ∉
        (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support := by
    intro hmem
    have hpair : P.source₁ ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) := by
      rw [← Pρ.shell_inter_cap_eq_sources]
      exact Finset.mem_inter.mpr ⟨hmem, hPsource₁_cap⟩
    exact Finset.disjoint_left.mp hpairsDisjoint (by simp) hpair
  have hPsource₂_not_mem :
      P.source₂ ∉
        (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support := by
    intro hmem
    have hpair : P.source₂ ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) := by
      rw [← Pρ.shell_inter_cap_eq_sources]
      exact Finset.mem_inter.mpr ⟨hmem, hPsource₂_cap⟩
    exact Finset.disjoint_left.mp hpairsDisjoint (by simp) hpair
  intro hhit
  rcases hhit with h | h | h | h
  · exact hPρsource₁_not_mem h
  · exact hPρsource₂_not_mem h
  · exact hPsource₁_not_mem h
  · exact hPsource₂_not_mem h

end CrossBlockerProofProbe
end Problem97
