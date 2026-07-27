import Erdos9796Proof.P97.ATail.FrontierLiveClosure
import Erdos9796Proof.P97.ATail.SurvivalCover
import Erdos9796Proof.P97.ATail.ThirdCenterCommonPair

open scoped EuclideanGeometry

namespace Problem97
namespace TwoCollisionGlobalProducerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailFrontierLiveClosure
open ATailLargeOppositeCapsBiApexSurface
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

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

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

/-- The cap-eight branch leaves a source outside both collision-blocker
fibers.  Its actual blocker preserves one deletion from each collision pair. -/
theorem exists_thirdBlocker_crossPairDeletionSurvivals
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card) :
    ∃ source : CriticalShellSystem.CarrierVertex D.A,
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
            (H.centerAt source.1 source.2)) := by
  classical
  let anchor : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₁, P.source₁_mem_A⟩
  let anchorρ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
  let fiber :=
    ATailSurvivalCover.actualBlockerFiber H anchor
  let fiberρ :=
    ATailSurvivalCover.actualBlockerFiber H anchorρ
  let covered := fiber ∪ fiberρ
  have hfirst : 8 ≤ S.oppCap1.card := by
    rw [← capByIndex_oppIndex1_eq_oppCap1 S]
    exact hcap
  have hcarrier : 17 ≤ D.A.card := by
    have hsum := S.capSum
    have hsecond := L.secondOppCap_card_ge_six
    have hsurplus := N.surplusCap_card_ge_six
    omega
  have hfiber : fiber.card ≤ 4 := by
    simpa [fiber, anchor] using
      ATailSurvivalCover.actualBlockerFiber_card_le_four H anchor
  have hfiberρ : fiberρ.card ≤ 4 := by
    simpa [fiberρ, anchorρ] using
      ATailSurvivalCover.actualBlockerFiber_card_le_four H anchorρ
  have hcovered : covered.card ≤ 8 := by
    have hunion := Finset.card_union_le fiber fiberρ
    simpa [covered] using (show (fiber ∪ fiberρ).card ≤ 8 by omega)
  have hsplit := Finset.card_sdiff_add_card_inter
    (Finset.univ :
      Finset (CriticalShellSystem.CarrierVertex D.A)) covered
  have hinter :
      (Finset.univ ∩ covered :
        Finset (CriticalShellSystem.CarrierVertex D.A)) = covered :=
    Finset.inter_eq_right.mpr (Finset.subset_univ _)
  have htotal :
      (Finset.univ :
        Finset (CriticalShellSystem.CarrierVertex D.A)).card = D.A.card := by
    simp [CriticalShellSystem.CarrierVertex, Fintype.card_coe]
  rw [hinter, htotal] at hsplit
  have houtside :
      ((Finset.univ :
        Finset (CriticalShellSystem.CarrierVertex D.A)) \ covered).Nonempty := by
    apply Finset.card_pos.mp
    omega
  rcases houtside with ⟨source, hsourceOutside⟩
  have hsourceNotCovered := (Finset.mem_sdiff.mp hsourceOutside).2
  have hsourceNotFiber : source ∉ fiber := by
    intro hs
    exact hsourceNotCovered (Finset.mem_union_left fiberρ hs)
  have hsourceNotFiberρ : source ∉ fiberρ := by
    intro hs
    exact hsourceNotCovered (Finset.mem_union_right fiber hs)
  have hcenterNe :
      H.centerAt source.1 source.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A := by
    intro hcenter
    apply hsourceNotFiber
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ source, ?_⟩
    exact Subtype.ext hcenter
  have hcenterNeρ :
      H.centerAt source.1 source.2 ≠
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A := by
    intro hcenter
    apply hsourceNotFiberρ
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ source, ?_⟩
    exact Subtype.ext hcenter
  let Q := collisionRelocation B.secondApex_robust P
  let Qρ := collisionRelocation B.secondApex_robust Pρ
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
          (H.centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase P.source₂)
          (H.centerAt source.1 source.2) := by
    rcases
        Problem97.ATailThirdCenterCommonPair.frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
            Q hQSupport hQFirst source.2 with
      hq | hw | hfirst | hknown
    · exact Or.inl (by simpa [Q, collisionRelocation] using hq)
    · exact Or.inr (by simpa [Q, collisionRelocation] using hw)
    · exact False.elim
        ((R.actualBlocker_ne_firstApex source.1 source.2) hfirst)
    · exact False.elim
        (hcenterNe (by simpa [Q, collisionRelocation] using hknown))
  have hsurvivesρ :
      HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₁)
          (H.centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₂)
          (H.centerAt source.1 source.2) := by
    rcases
        Problem97.ATailThirdCenterCommonPair.frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
            Qρ hQρSupport hQρFirst source.2 with
      hq | hw | hfirst | hknown
    · exact Or.inl (by simpa [Qρ, collisionRelocation] using hq)
    · exact Or.inr (by simpa [Qρ, collisionRelocation] using hw)
    · exact False.elim
        ((Rρ.actualBlocker_ne_firstApex source.1 source.2) hfirst)
    · exact False.elim
        (hcenterNeρ (by simpa [Qρ, collisionRelocation] using hknown))
  exact ⟨source, hcenterNe, hcenterNeρ,
    R.actualBlocker_ne_firstApex source.1 source.2,
    B.secondApex_robust.centerAt_ne H source.1 source.2,
    hsurvives, hsurvivesρ⟩

/-- In the cap-eight branch the third-blocker source can itself be chosen in
the first opposite cap, outside the four named collision sources. -/
theorem exists_capSource_thirdBlocker_crossPairDeletionSurvivals
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    {B : FrontierBiApexRobustResidual R}
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card) :
    ∃ source : CriticalShellSystem.CarrierVertex D.A,
      source.1 ∈ S.capByIndex S.oppIndex1 ∧
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
            (H.centerAt source.1 source.2)) := by
  classical
  let pairSources : Finset ℝ² :=
    ({P.source₁, P.source₂} : Finset ℝ²) ∪
      {Pρ.source₁, Pρ.source₂}
  have hpairCard : pairSources.card = 4 := by
    dsimp [pairSources]
    rw [Finset.card_union_of_disjoint hpairsDisjoint]
    simp [P.sources_ne, Pρ.sources_ne]
  have hpairSubset :
      pairSources ⊆ S.capByIndex S.oppIndex1 := by
    intro z hz
    rcases Finset.mem_union.mp hz with hz | hz
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          P.source₁_mem_capInterior
      · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          P.source₂_mem_capInterior
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          Pρ.source₁_mem_capInterior
      · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          Pρ.source₂_mem_capInterior
  have hsplit := Finset.card_sdiff_add_card_inter
    (S.capByIndex S.oppIndex1) pairSources
  have hinter :
      S.capByIndex S.oppIndex1 ∩ pairSources = pairSources :=
    Finset.inter_eq_right.mpr hpairSubset
  rw [hinter, hpairCard] at hsplit
  have houtside :
      ((S.capByIndex S.oppIndex1) \ pairSources).Nonempty := by
    apply Finset.card_pos.mp
    omega
  rcases houtside with ⟨q, hqOutside⟩
  have hqParts := Finset.mem_sdiff.mp hqOutside
  have hqCap : q ∈ S.capByIndex S.oppIndex1 := hqParts.1
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
  let Q := collisionRelocation B.secondApex_robust P
  let Qρ := collisionRelocation B.secondApex_robust Pρ
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
        Problem97.ATailThirdCenterCommonPair.frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
            Q hQSupport hQFirst hqA with
      hq | hw | hfirst | hknown
    · exact Or.inl (by simpa [Q, collisionRelocation] using hq)
    · exact Or.inr (by simpa [Q, collisionRelocation] using hw)
    · exact False.elim ((R.actualBlocker_ne_firstApex q hqA) hfirst)
    · exact False.elim
        (hcenterNe (by simpa [Q, collisionRelocation] using hknown))
  have hsurvivesρ :
      HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₁)
          (H.centerAt q hqA) ∨
        HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₂)
          (H.centerAt q hqA) := by
    rcases
        Problem97.ATailThirdCenterCommonPair.frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
            Qρ hQρSupport hQρFirst hqA with
      hq | hw | hfirst | hknown
    · exact Or.inl (by simpa [Qρ, collisionRelocation] using hq)
    · exact Or.inr (by simpa [Qρ, collisionRelocation] using hw)
    · exact False.elim ((Rρ.actualBlocker_ne_firstApex q hqA) hfirst)
    · exact False.elim
        (hcenterNeρ (by simpa [Qρ, collisionRelocation] using hknown))
  exact ⟨source, hqCap, hqNotPairs, hcenterNe, hcenterNeρ,
    R.actualBlocker_ne_firstApex q hqA,
    B.secondApex_robust.centerAt_ne H q hqA,
    hsurvives, hsurvivesρ⟩

end TwoCollisionGlobalProducerScratch
end Problem97
