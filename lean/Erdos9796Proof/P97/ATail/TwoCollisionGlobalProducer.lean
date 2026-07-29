/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapApexRadiusRigidity
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector
import Erdos9796Proof.P97.ATail.SurvivalCover
import Erdos9796Proof.P97.ATail.ThirdCenterCommonPair

/-!
# Global connector for two exact-four collision rows

In the cap-eight branch, four named collision sources cannot exhaust the
strict first indexed cap.  A fifth source there has an actual blocker distinct
from both collision blockers.  Second-apex deletion robustness and the
third-center classifier then force one deletion from each collision pair to
survive at that blocker.  Equivalently, the source's canonical four-point row
omits at least one endpoint of each pair.

The producer takes second-apex robustness explicitly.  This keeps it
independent of the later live-closure residual structures and therefore
available to their coordinator without an import cycle.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTwoCollisionGlobalProducer

open ATAILStageOnePrescribedApexDichotomy
open ATailCapApexRadiusRigidity
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

private theorem interior_not_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.oppIndex1) :
    x ∉ S.surplusCap := by
  have hnot := S.capInteriorByIndex_not_mem_capByIndex_of_ne hx
    S.surplusIdx_ne_oppIndex1.symm
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simpa [SurplusCapPacket.capByIndex,
      SurplusCapPacket.surplusCap, hi] using hnot

private noncomputable def collisionRelocation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (secondApexRobust : FullyDeletionRobustAt D S.oppApex2)
    (P : RetainedInteriorBlockerCollision R) :
    SurvivorPairRelocationPacket D S radius H := by
  have hqMarginal :
      P.source₁ ∈
        (D.A.filter fun x => dist x S.oppApex1 = radius) \
          S.surplusCap := by
    refine Finset.mem_sdiff.mpr
      ⟨Finset.mem_filter.mpr ⟨P.source₁_mem_A, ?_⟩, ?_⟩
    · simpa only [dist_comm] using
        (mem_selectedClass.mp P.source₁_mem_radius).2
    · exact interior_not_mem_surplusCap S P.source₁_mem_capInterior
  have hwMarginal :
      P.source₂ ∈
        (D.A.filter fun x => dist x S.oppApex1 = radius) \
          S.surplusCap := by
    refine Finset.mem_sdiff.mpr
      ⟨Finset.mem_filter.mpr ⟨P.source₂_mem_A, ?_⟩, ?_⟩
    · simpa only [dist_comm] using
        (mem_selectedClass.mp P.source₂_mem_radius).2
    · exact interior_not_mem_surplusCap S P.source₂_mem_capInterior
  have hqSurvives :=
    secondApexRobust.survives P.source₁ P.source₁_mem_A
  have hwSurvives :=
    secondApexRobust.survives P.source₂ P.source₂_mem_A
  exact {
    q := P.source₁
    w := P.source₂
    q_mem_A := P.source₁_mem_A
    w_mem_A := P.source₂_mem_A
    q_mem_marginal := hqMarginal
    w_mem_marginal := hwMarginal
    q_ne_w := P.sources_ne
    q_survives := hqSurvives
    w_survives := hwSurvives
    q_blocker_ne_oppApex2 :=
      actual_blocker_ne_of_deletion_survives
        H P.source₁_mem_A hqSurvives
    w_blocker_ne_oppApex2 :=
      actual_blocker_ne_of_deletion_survives
        H P.source₂_mem_A hwSurvives }

/-- The pointwise third-blocker and cross-pair deletion-survival witness
carried by a strict-cap source outside both collision pairs. -/
abbrev CapSourceThirdBlockerCrossPairDeletionSurvivals
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  source.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
    source.1 ∉
      (({P.source₁, P.source₂} : Finset ℝ²) ∪
        {Pρ.source₁, Pρ.source₂}) ∧
    H.centerAt source.1 source.2 ≠
      H.centerAt P.source₁ P.source₁_mem_A ∧
    H.centerAt source.1 source.2 ≠
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∧
    H.centerAt source.1 source.2 ≠ S.oppApex1 ∧
    H.centerAt source.1 source.2 ≠ S.oppApex2 ∧
    (HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
        (H.centerAt source.1 source.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase P.source₂)
        (H.centerAt source.1 source.2)) ∧
    (HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₁)
        (H.centerAt source.1 source.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₂)
        (H.centerAt source.1 source.2))

private theorem two_le_card_capInterior_sdiff_collisionSources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card) :
    2 ≤
      ((S.capInteriorByIndex S.oppIndex1) \
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂})).card := by
  classical
  let pairSources : Finset ℝ² :=
    ({P.source₁, P.source₂} : Finset ℝ²) ∪
      {Pρ.source₁, Pρ.source₂}
  have hpairCard : pairSources.card = 4 := by
    dsimp [pairSources]
    rw [Finset.card_union_of_disjoint hpairsDisjoint]
    simp [P.sources_ne, Pρ.sources_ne]
  have hpairSubset :
      pairSources ⊆ S.capInteriorByIndex S.oppIndex1 := by
    intro z hz
    rcases Finset.mem_union.mp hz with hz | hz
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact P.source₁_mem_capInterior
      · exact P.source₂_mem_capInterior
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact Pρ.source₁_mem_capInterior
      · exact Pρ.source₂_mem_capInterior
  have hcapInterior :
      6 ≤ (S.capInteriorByIndex S.oppIndex1).card := by
    have hcard := capInteriorByIndex_card_add_two S S.oppIndex1
    omega
  have hsplit := Finset.card_sdiff_add_card_inter
    (S.capInteriorByIndex S.oppIndex1) pairSources
  have hinter :
      S.capInteriorByIndex S.oppIndex1 ∩ pairSources = pairSources :=
    Finset.inter_eq_right.mpr hpairSubset
  rw [hinter, hpairCard] at hsplit
  change 2 ≤ ((S.capInteriorByIndex S.oppIndex1) \ pairSources).card
  omega

private theorem capSourceThirdBlockerCrossPairDeletionSurvivals_of_mem_sdiff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (secondApexRobust : FullyDeletionRobustAt D S.oppApex2)
    {q : ℝ²}
    (hqOutside :
      q ∈
        (S.capInteriorByIndex S.oppIndex1) \
          (({P.source₁, P.source₂} : Finset ℝ²) ∪
            {Pρ.source₁, Pρ.source₂})) :
    ∃ source : CriticalShellSystem.CarrierVertex D.A,
      source.1 = q ∧
        CapSourceThirdBlockerCrossPairDeletionSurvivals P Pρ source := by
  classical
  let pairSources : Finset ℝ² :=
    ({P.source₁, P.source₂} : Finset ℝ²) ∪
      {Pρ.source₁, Pρ.source₂}
  change q ∈ (S.capInteriorByIndex S.oppIndex1) \ pairSources at hqOutside
  have hqParts := Finset.mem_sdiff.mp hqOutside
  have hqInterior : q ∈ S.capInteriorByIndex S.oppIndex1 := hqParts.1
  have hqCap : q ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hqInterior
  have hqNotPairs : q ∉ pairSources := hqParts.2
  have hqA : q ∈ D.A := S.capByIndex_subset S.oppIndex1 hqCap
  let source : CriticalShellSystem.CarrierVertex D.A := ⟨q, hqA⟩
  have hcenterNe :
      H.centerAt q hqA ≠
        H.centerAt P.source₁ P.source₁_mem_A := by
    intro hcenter
    have hsupportEq :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H hqA P.source₁_mem_A hcenter
    have hqShell :
        q ∈
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support := by
      have hown :=
        (H.selectedAt q hqA).toCriticalFourShell.q_mem_support
      rw [hsupportEq] at hown
      exact hown
    apply hqNotPairs
    apply Finset.mem_union_left
    rw [← P.shell_inter_cap_eq_sources]
    exact Finset.mem_inter.mpr ⟨hqShell, hqCap⟩
  have hcenterNeρ :
      H.centerAt q hqA ≠
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A := by
    intro hcenter
    have hsupportEq :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H hqA Pρ.source₁_mem_A hcenter
    have hqShell :
        q ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support := by
      have hown :=
        (H.selectedAt q hqA).toCriticalFourShell.q_mem_support
      rw [hsupportEq] at hown
      exact hown
    apply hqNotPairs
    apply Finset.mem_union_right
    rw [← Pρ.shell_inter_cap_eq_sources]
    exact Finset.mem_inter.mpr ⟨hqShell, hqCap⟩
  let Q := collisionRelocation secondApexRobust P
  let Qρ := collisionRelocation secondApexRobust Pρ
  have hQSupport :
      Q.w ∈
        (H.selectedAt Q.q Q.q_mem_A).toCriticalFourShell.support := by
    simpa [Q, collisionRelocation] using P.source₂_mem_source₁_shell
  have hQρSupport :
      Qρ.w ∈
        (H.selectedAt Qρ.q Qρ.q_mem_A).toCriticalFourShell.support := by
    simpa [Qρ, collisionRelocation] using Pρ.source₂_mem_source₁_shell
  have hQFirst :
      H.centerAt Q.q Q.q_mem_A ≠ S.oppApex1 := by
    simpa [Q, collisionRelocation] using
      R.actualBlocker_ne_firstApex P.source₁ P.source₁_mem_A
  have hQρFirst :
      H.centerAt Qρ.q Qρ.q_mem_A ≠ S.oppApex1 := by
    simpa [Qρ, collisionRelocation] using
      Rρ.actualBlocker_ne_firstApex Pρ.source₁ Pρ.source₁_mem_A
  have hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
          (H.centerAt q hqA) ∨
        HasNEquidistantPointsAt 4 (D.A.erase P.source₂)
          (H.centerAt q hqA) := by
    rcases
        ATailThirdCenterCommonPair.frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
            Q hQSupport hQFirst hqA with
      hq | hw | hfirst | hknown
    · exact Or.inl (by simpa [Q, collisionRelocation] using hq)
    · exact Or.inr (by simpa [Q, collisionRelocation] using hw)
    · exact False.elim
        ((R.actualBlocker_ne_firstApex q hqA) hfirst)
    · exact False.elim
        (hcenterNe (by simpa [Q, collisionRelocation] using hknown))
  have hsurvivesρ :
      HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₁)
          (H.centerAt q hqA) ∨
        HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₂)
          (H.centerAt q hqA) := by
    rcases
        ATailThirdCenterCommonPair.frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
            Qρ hQρSupport hQρFirst hqA with
      hq | hw | hfirst | hknown
    · exact Or.inl (by simpa [Qρ, collisionRelocation] using hq)
    · exact Or.inr (by simpa [Qρ, collisionRelocation] using hw)
    · exact False.elim ((Rρ.actualBlocker_ne_firstApex q hqA) hfirst)
    · exact False.elim
        (hcenterNeρ (by simpa [Qρ, collisionRelocation] using hknown))
  exact ⟨source, rfl, hqInterior, hqNotPairs, hcenterNe, hcenterNeρ,
    R.actualBlocker_ne_firstApex q hqA,
    secondApexRobust.centerAt_ne H q hqA,
    hsurvives, hsurvivesρ⟩

/-- In the cap-eight branch, choose a source in the strict first indexed cap
outside both collision pairs.  Its actual blocker differs from both collision
blockers and both physical apices, and preserves one deletion from each
collision pair. -/
theorem exists_capSource_thirdBlocker_crossPairDeletionSurvivals
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (secondApexRobust : FullyDeletionRobustAt D S.oppApex2)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card) :
    ∃ source : CriticalShellSystem.CarrierVertex D.A,
      CapSourceThirdBlockerCrossPairDeletionSurvivals P Pρ source := by
  classical
  have hcard :=
    two_le_card_capInterior_sdiff_collisionSources
      P Pρ hpairsDisjoint hcap
  have houtside :
      ((S.capInteriorByIndex S.oppIndex1) \
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂})).Nonempty := by
    apply Finset.card_pos.mp
    omega
  rcases houtside with ⟨q, hqOutside⟩
  obtain ⟨source, -, hsource⟩ :=
    capSourceThirdBlockerCrossPairDeletionSurvivals_of_mem_sdiff
      P Pρ secondApexRobust hqOutside
  exact ⟨source, hsource⟩

/-- The cap-eight margin leaves two distinct strict-cap sources outside both
collision pairs, each carrying the full third-blocker and cross-pair
deletion-survival witness. -/
theorem exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (secondApexRobust : FullyDeletionRobustAt D S.oppApex2)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card) :
    ∃ source source' : CriticalShellSystem.CarrierVertex D.A,
      source.1 ≠ source'.1 ∧
        CapSourceThirdBlockerCrossPairDeletionSurvivals P Pρ source ∧
        CapSourceThirdBlockerCrossPairDeletionSurvivals P Pρ source' := by
  classical
  have hcard :=
    two_le_card_capInterior_sdiff_collisionSources
      P Pρ hpairsDisjoint hcap
  have honeLt :
      1 <
        ((S.capInteriorByIndex S.oppIndex1) \
          (({P.source₁, P.source₂} : Finset ℝ²) ∪
            {Pρ.source₁, Pρ.source₂})).card := by
    omega
  rcases Finset.one_lt_card.mp honeLt with
    ⟨q, hqOutside, q', hqOutside', hqNe⟩
  obtain ⟨source, hsourceEq, hsource⟩ :=
    capSourceThirdBlockerCrossPairDeletionSurvivals_of_mem_sdiff
      P Pρ secondApexRobust hqOutside
  obtain ⟨source', hsourceEq', hsource'⟩ :=
    capSourceThirdBlockerCrossPairDeletionSurvivals_of_mem_sdiff
      P Pρ secondApexRobust hqOutside'
  refine ⟨source, source', ?_, hsource, hsource'⟩
  simpa [hsourceEq, hsourceEq'] using hqNe

/-- Two strict first-cap points on a common apex-centred radius, distinct from
both retained collision radii, can be lifted without erasing their metric
provenance.  Each lifted source carries the same third-blocker and cross-pair
deletion-survival packet as the cardinality-only cap-eight producer. -/
theorem
    exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals_of_commonRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (secondApexRobust : FullyDeletionRobustAt D S.oppApex2)
    (commonRadius : ℝ)
    (hcommonCard :
      2 ≤
        (SelectedClass D.A S.oppApex1 commonRadius ∩
          S.capInteriorByIndex S.oppIndex1).card)
    (hcommonNeRadius : commonRadius ≠ radius)
    (hcommonNeρ : commonRadius ≠ ρ) :
    ∃ source source' : CriticalShellSystem.CarrierVertex D.A,
      source.1 ≠ source'.1 ∧
        source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius ∧
        source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius ∧
        CapSourceThirdBlockerCrossPairDeletionSurvivals P Pρ source ∧
        CapSourceThirdBlockerCrossPairDeletionSurvivals P Pρ source' := by
  classical
  have honeLt :
      1 <
        (SelectedClass D.A S.oppApex1 commonRadius ∩
          S.capInteriorByIndex S.oppIndex1).card := by
    omega
  rcases Finset.one_lt_card.mp honeLt with
    ⟨q, hq, q', hq', hqq'⟩
  rcases Finset.mem_inter.mp hq with ⟨hqRadius, hqInterior⟩
  rcases Finset.mem_inter.mp hq' with ⟨hqRadius', hqInterior'⟩
  have hqNotPairs :
      q ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) := by
    intro hqPairs
    rcases Finset.mem_union.mp hqPairs with hqP | hqPρ
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hqP
      rcases hqP with rfl | rfl
      · apply hcommonNeRadius
        exact (mem_selectedClass.mp hqRadius).2.symm.trans
          (mem_selectedClass.mp P.source₁_mem_radius).2
      · apply hcommonNeRadius
        exact (mem_selectedClass.mp hqRadius).2.symm.trans
          (mem_selectedClass.mp P.source₂_mem_radius).2
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hqPρ
      rcases hqPρ with rfl | rfl
      · apply hcommonNeρ
        exact (mem_selectedClass.mp hqRadius).2.symm.trans
          (mem_selectedClass.mp Pρ.source₁_mem_radius).2
      · apply hcommonNeρ
        exact (mem_selectedClass.mp hqRadius).2.symm.trans
          (mem_selectedClass.mp Pρ.source₂_mem_radius).2
  have hqNotPairs' :
      q' ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) := by
    intro hqPairs
    rcases Finset.mem_union.mp hqPairs with hqP | hqPρ
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hqP
      rcases hqP with rfl | rfl
      · apply hcommonNeRadius
        exact (mem_selectedClass.mp hqRadius').2.symm.trans
          (mem_selectedClass.mp P.source₁_mem_radius).2
      · apply hcommonNeRadius
        exact (mem_selectedClass.mp hqRadius').2.symm.trans
          (mem_selectedClass.mp P.source₂_mem_radius).2
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hqPρ
      rcases hqPρ with rfl | rfl
      · apply hcommonNeρ
        exact (mem_selectedClass.mp hqRadius').2.symm.trans
          (mem_selectedClass.mp Pρ.source₁_mem_radius).2
      · apply hcommonNeρ
        exact (mem_selectedClass.mp hqRadius').2.symm.trans
          (mem_selectedClass.mp Pρ.source₂_mem_radius).2
  obtain ⟨source, hsourceEq, hsource⟩ :=
    capSourceThirdBlockerCrossPairDeletionSurvivals_of_mem_sdiff
      P Pρ secondApexRobust
      (Finset.mem_sdiff.mpr ⟨hqInterior, hqNotPairs⟩)
  obtain ⟨source', hsourceEq', hsource'⟩ :=
    capSourceThirdBlockerCrossPairDeletionSurvivals_of_mem_sdiff
      P Pρ secondApexRobust
      (Finset.mem_sdiff.mpr ⟨hqInterior', hqNotPairs'⟩)
  refine ⟨source, source', ?_, ?_, ?_, hsource, hsource'⟩
  · simpa [hsourceEq, hsourceEq'] using hqq'
  · simpa [hsourceEq] using hqRadius
  · simpa [hsourceEq'] using hqRadius'

/-- The four cross-blocker equalities left by the global cap-or-equality
split. -/
abbrev CrossBlockerCoincidence
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) : Prop :=
  H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ ∨
    H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ ∨
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ ∨
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂

/-- One of the two cross-deletions preserves the source's canonical K4. -/
abbrev CrossPairDeletionSurvival
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (source : CriticalShellSystem.CarrierVertex D.A)
    (x y : ℝ²) : Prop :=
  HasNEquidistantPointsAt 4 (D.A.erase x)
      (H.centerAt source.1 source.2) ∨
    HasNEquidistantPointsAt 4 (D.A.erase y)
      (H.centerAt source.1 source.2)

/-- The selected-support form of cross-pair deletion survival. -/
abbrev CrossPairSelectedSupportOmission
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (source : CriticalShellSystem.CarrierVertex D.A)
    (x y : ℝ²) : Prop :=
  x ∉ (H.selectedAt source.1 source.2).toCriticalFourShell.support ∨
    y ∉ (H.selectedAt source.1 source.2).toCriticalFourShell.support

/-- Cross-pair deletion survival and selected-support omission are the same
canonical-row invariant. -/
theorem crossPairDeletionSurvival_iff_selectedSupportOmission
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (source : CriticalShellSystem.CarrierVertex D.A)
    (x y : ℝ²) :
    CrossPairDeletionSurvival (H := H) source x y ↔
      CrossPairSelectedSupportOmission (H := H) source x y := by
  exact
    or_congr
      (cross_deletion_survives_iff_not_mem_selected_support H source.2)
      (cross_deletion_survives_iff_not_mem_selected_support H source.2)

/-- Canonical packet retaining the producer's deletion-survival evidence.
Selected-support omission is derived through the pair-level equivalence. -/
structure CrossPairDeletionView
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (source : CriticalShellSystem.CarrierVertex D.A)
    (x y : ℝ²) : Prop where
  survives : CrossPairDeletionSurvival (H := H) source x y

namespace CrossPairDeletionView

/-- Selected-support omission derived from the retained survival view. -/
theorem omits
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {source : CriticalShellSystem.CarrierVertex D.A}
    {x y : ℝ²}
    (view : CrossPairDeletionView (H := H) source x y) :
    CrossPairSelectedSupportOmission (H := H) source x y :=
  (crossPairDeletionSurvival_iff_selectedSupportOmission
    (H := H) source x y).mp view.survives

end CrossPairDeletionView

/-- The exact third canonical-row surface produced by the cap-eight branch.

Keep the cap-eight lower bound in the packet: downstream positive-alignment
arguments need the original cap cardinal margin, not only the selected source
extracted from it. -/
abbrev CapSourceThirdCanonicalRowSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) : Prop :=
  8 ≤ (S.capByIndex S.oppIndex1).card ∧
  ∃ source : CriticalShellSystem.CarrierVertex D.A,
    source.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
      source.1 ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) ∧
      H.centerAt source.1 source.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A ∧
      H.centerAt source.1 source.2 ≠
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∧
      H.centerAt source.1 source.2 ≠ S.oppApex1 ∧
      H.centerAt source.1 source.2 ≠ S.oppApex2 ∧
      source.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      (H.selectedAt source.1 source.2).toCriticalFourShell.support.card = 4 ∧
      CrossPairDeletionView (H := H) source P.source₁ P.source₂ ∧
      CrossPairDeletionView (H := H) source Pρ.source₁ Pρ.source₂

/-- The cap-source row surface is unchanged when the two collision rows are
exchanged. -/
theorem capSourceThirdCanonicalRowSurface_swap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (h : CapSourceThirdCanonicalRowSurface P Pρ) :
    CapSourceThirdCanonicalRowSurface Pρ P := by
  rcases h with
    ⟨hcap, source, hsourceInterior, hsourceOutside,
      hcenterNeFirstBlocker, hcenterNeSecondBlocker,
      hcenterNeFirstApex, hcenterNeSecondApex,
      hsourceMem, hsourceCard, hfirstView, hsecondView⟩
  refine
    ⟨hcap, source, hsourceInterior, ?_,
      hcenterNeSecondBlocker, hcenterNeFirstBlocker,
      hcenterNeFirstApex, hcenterNeSecondApex,
      hsourceMem, hsourceCard, hsecondView, hfirstView⟩
  simpa [Finset.union_comm] using hsourceOutside

/-- The mapped global alternative used by the two-collision coordinator. -/
abbrev TwoCollisionGlobalSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) : Prop :=
  CapSourceThirdCanonicalRowSurface P Pρ ∨
    CrossBlockerCoincidence P Pρ

/-- The cap-eight source's canonical row is a third exact-four row and omits
at least one endpoint from each of the two collision pairs. -/
theorem exists_capSource_thirdCanonicalRow_omits_each_collisionPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (secondApexRobust : FullyDeletionRobustAt D S.oppApex2)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card) :
    CapSourceThirdCanonicalRowSurface P Pρ := by
  obtain ⟨source, hsourceCap, hsourceOutside, hcenterNe, hcenterNeρ,
      hcenterNeFirst, hcenterNeSecond, hsurvives, hsurvivesρ⟩ :=
    exists_capSource_thirdBlocker_crossPairDeletionSurvivals
      P Pρ secondApexRobust hpairsDisjoint hcap
  exact ⟨hcap, source, hsourceCap, hsourceOutside, hcenterNe, hcenterNeρ,
    hcenterNeFirst, hcenterNeSecond,
    (H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support,
    (H.selectedAt source.1 source.2).toCriticalFourShell.support_card,
    ⟨hsurvives⟩, ⟨hsurvivesρ⟩⟩

end ATailTwoCollisionGlobalProducer
end Problem97
