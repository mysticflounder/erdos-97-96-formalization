/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress

/-!
# First-apex unique-radius deletion normal form

The protected first-apex unique-radius arm contains two deletion-polarity
regimes.  An exact four-class is deletion-critical at the first apex for
every one of its members.  An exact five-class makes the first apex fully
singleton-deletion robust, while the retained frontier pair still blocks
the apex when deleted together.

This file only sharpens the live source contract.  It does not prove either
terminal contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueArmRouteAuditScratch

open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress

attribute [local instance] Classical.propDecidable

/-- The frontier radius is positive because its retained source is outside
the surplus cap, whereas the first opposite apex is a surplus-cap endpoint. -/
theorem frontier_radius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    0 < radius := by
  have hqNotSurplus : F.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hfirstNeQ : S.oppApex1 ≠ F.pair.q := by
    intro h
    apply hqNotSurplus
    rw [← h]
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3
  have hpos : 0 < dist S.oppApex1 F.pair.q := dist_pos.mpr hfirstNeQ
  have hqRadius : dist F.pair.q S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  simpa only [dist_comm, hqRadius] using hpos

private theorem q_mem_firstApex_class
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.q_mem_marginal with ⟨hqFilter, _⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr ⟨hqA, by simpa only [dist_comm] using hqRadius⟩

private theorem w_mem_firstApex_class
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.w ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.w_mem_marginal with ⟨hwFilter, _⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
  exact mem_selectedClass.mpr ⟨hwA, by simpa only [dist_comm] using hwRadius⟩

/-- In the exact-four unique-radius regime, deleting any member of the class
destroys every K4 witness at the first apex. -/
theorem uniqueFour_every_classMember_blocks_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (hcard : (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius) :
    ∀ x : ℝ², x ∈ SelectedClass D.A S.oppApex1 radius →
      ¬ HasNEquidistantPointsAt 4 (D.A.erase x) S.oppApex1 := by
  intro x hx hsurvives
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hsurvives with
    ⟨rho, hrho, hfourErase⟩
  have hfourFull : 4 ≤ (SelectedClass D.A S.oppApex1 rho).card := by
    refine hfourErase.trans (Finset.card_le_card ?_)
    intro z hz
    rcases mem_selectedClass.mp hz with ⟨hzErase, hzdist⟩
    exact mem_selectedClass.mpr ⟨Finset.mem_of_mem_erase hzErase, hzdist⟩
  have hrho : rho = radius := hunique rho hrho hfourFull
  subst rho
  rw [selectedClass_erase_eq, Finset.card_erase_of_mem hx, hcard] at hfourErase
  omega

/-- The exact-four arm makes the first apex non-robust. -/
theorem uniqueFour_firstApex_not_fullyDeletionRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hcard : (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius) :
    ¬ FullyDeletionRobustAt D S.oppApex1 := by
  intro hrobust
  exact uniqueFour_every_classMember_blocks_firstApex hcard hunique
    F.pair.q (q_mem_firstApex_class F)
    (hrobust.survives F.pair.q F.pair.q_mem_A)

/-- The exact-five arm makes the first apex robust under every singleton
deletion. -/
theorem uniqueFive_firstApex_fullyDeletionRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hcard : (SelectedClass D.A S.oppApex1 radius).card = 5) :
    FullyDeletionRobustAt D S.oppApex1 := by
  exact fullyDeletionRobustAt_of_five_le_selectedClass
    (frontier_radius_pos F) (by omega)

/-- Despite singleton robustness in the exact-five regime, deleting both
retained class members destroys K4 at the first apex.  The same conclusion
also holds in the exact-four regime. -/
theorem uniqueArm_retainedPair_doubleDeletion_blocks_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hcard : (SelectedClass D.A S.oppApex1 radius).card = 4 ∨
      (SelectedClass D.A S.oppApex1 radius).card = 5)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius) :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1 := by
  intro hsurvives
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hsurvives with
    ⟨rho, hrho, hfourErase⟩
  have hfourFull : 4 ≤ (SelectedClass D.A S.oppApex1 rho).card := by
    refine hfourErase.trans (Finset.card_le_card ?_)
    intro z hz
    rcases mem_selectedClass.mp hz with ⟨hzErase, hzdist⟩
    exact mem_selectedClass.mpr ⟨
      Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hzErase), hzdist⟩
  have hrho : rho = radius := hunique rho hrho hfourFull
  subst rho
  have hq := q_mem_firstApex_class F
  have hw := w_mem_firstApex_class F
  have hwErase :
      F.pair.w ∈ (SelectedClass D.A S.oppApex1 radius).erase F.pair.q :=
    Finset.mem_erase.mpr ⟨F.pair.q_ne_w.symm, hw⟩
  rw [selectedClass_erase_eq, selectedClass_erase_eq,
    Finset.card_erase_of_mem hwErase,
    Finset.card_erase_of_mem hq] at hfourErase
  rcases hcard with hfour | hfive <;> omega

/-- Exact live deletion normal form for the protected unique-radius arm. -/
theorem uniqueArm_deletionNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (arm : OriginalFrontierUniqueRadiusArm F) :
    ((SelectedClass D.A S.oppApex1 radius).card = 4 ∧
      (∀ x : ℝ², x ∈ SelectedClass D.A S.oppApex1 radius →
        ¬ HasNEquidistantPointsAt 4 (D.A.erase x) S.oppApex1)) ∨
    ((SelectedClass D.A S.oppApex1 radius).card = 5 ∧
      FullyDeletionRobustAt D S.oppApex1 ∧
      ¬ HasNEquidistantPointsAt 4
        ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1) := by
  rcases arm with ⟨hcard, hunique⟩
  rcases hcard with hfour | hfive
  · exact Or.inl ⟨hfour,
      uniqueFour_every_classMember_blocks_firstApex hfour hunique⟩
  · exact Or.inr ⟨hfive,
      uniqueFive_firstApex_fullyDeletionRobust F hfive,
      uniqueArm_retainedPair_doubleDeletion_blocks_firstApex F
        (Or.inr hfive) hunique⟩

#print axioms frontier_radius_pos
#print axioms uniqueFour_every_classMember_blocks_firstApex
#print axioms uniqueFour_firstApex_not_fullyDeletionRobust
#print axioms uniqueFive_firstApex_fullyDeletionRobust
#print axioms uniqueArm_retainedPair_doubleDeletion_blocks_firstApex
#print axioms uniqueArm_deletionNormalForm

end ATailUniqueArmRouteAuditScratch
end Problem97
