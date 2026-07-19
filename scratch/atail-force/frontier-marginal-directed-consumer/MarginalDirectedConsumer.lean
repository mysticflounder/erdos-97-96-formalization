/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierCommonDeletionSurplusEscape

/-!
# First-apex marginal companion coupled to the directed blocker split

This scratch module keeps the complete parent/frontier provenance.  Its main
new fact is that a `FirstApexMarginalCompanion` is itself a common-deletion
source at the first apex and the original deleted source's actual blocker.
The final outcome then consumes the retained escape-location and directed
blocker splits without projecting either to a generic recursion.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierMarginalDirectedScratch

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailFrontierCommonDeletionEscape
open ATailFrontierCommonDeletionSurplusEscape
open ATailOrientedPhysicalApexIngress
open ATailThirdCenterCommonPair

attribute [local instance] Classical.propDecidable

noncomputable section

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3

private theorem blocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source : ℝ²} (hsource : source ∈ A) :
    H.centerAt source hsource ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt source hsource).toCriticalFourShell.center_mem).2

private theorem frontierRadius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    0 < radius := by
  have hqNotSurplus : F.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hfirstNeQ : S.oppApex1 ≠ F.pair.q := by
    intro h
    apply hqNotSurplus
    simpa [h] using oppApex1_mem_surplusCap S
  have hpos : 0 < dist S.oppApex1 F.pair.q := dist_pos.mpr hfirstNeQ
  have hqRadius : dist F.pair.q S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  simpa only [dist_comm, hqRadius] using hpos

private theorem marginalCompanion_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {E : ParentSurplusEscape R}
    (hit : FirstApexMarginalCompanion E) :
    hit.point ∈ D.A :=
  (Finset.mem_filter.mp
    (Finset.mem_sdiff.mp hit.point_mem_firstApexMarginal).1).1

private theorem marginalCompanion_ne_deleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {E : ParentSurplusEscape R}
    (hit : FirstApexMarginalCompanion E) :
    hit.point ≠ F.pair.q := by
  have hrow := R.common.packet.row₂.subset hit.point_mem_secondRow
  exact (Finset.mem_erase.mp (Finset.mem_erase.mp hrow).2).1

private theorem firstApex_survives_deleting_frontierRadiusPoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (z : ℝ²) (hzRadius : dist z S.oppApex1 = radius) :
    HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex1 := by
  have hqClass :
      F.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
    rcases Finset.mem_sdiff.mp F.pair.q_mem_marginal with ⟨hqFilter, _⟩
    rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
    exact mem_selectedClass.mpr
      ⟨hqA, by simpa only [dist_comm] using hqRadius⟩
  have hwClass :
      F.pair.w ∈ SelectedClass D.A S.oppApex1 radius := by
    rcases Finset.mem_sdiff.mp F.pair.w_mem_marginal with ⟨hwFilter, _⟩
    rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
    exact mem_selectedClass.mpr
      ⟨hwA, by simpa only [dist_comm] using hwRadius⟩
  by_cases hfive :
      5 ≤ (SelectedClass D.A S.oppApex1 radius).card
  · refine ⟨radius, frontierRadius_pos F, ?_⟩
    have hfour :
        4 ≤ (SelectedClass (D.A.erase z)
          S.oppApex1 radius).card :=
      selectedClass_erase_card_ge_of_succ_le hfive
    simpa [SelectedClass] using hfour
  · have hclassCard :
        (SelectedClass D.A S.oppApex1 radius).card = 4 := by
      have hfourClass := R.frontierRadius_class_card_ge_four
      omega
    rcases R.common.firstApexDouble with ⟨rho, hrho, hfourRaw⟩
    have hfour :
        4 ≤ (SelectedClass ((D.A.erase F.pair.q).erase F.pair.w)
          S.oppApex1 rho).card := by
      simpa [SelectedClass] using hfourRaw
    have hrhoNe : rho ≠ radius := by
      intro hrhoEq
      subst rho
      have hwErase :
          F.pair.w ∈
            (SelectedClass D.A S.oppApex1 radius).erase F.pair.q :=
        Finset.mem_erase.mpr ⟨F.pair.q_ne_w.symm, hwClass⟩
      rw [selectedClass_erase_eq, selectedClass_erase_eq,
        Finset.card_erase_of_mem hwErase,
        Finset.card_erase_of_mem hqClass, hclassCard] at hfour
      omega
    have hzNotClass :
        z ∉ SelectedClass D.A S.oppApex1 rho := by
      intro hzClass
      apply hrhoNe
      calc
        rho = dist S.oppApex1 z :=
          (mem_selectedClass.mp hzClass).2.symm
        _ = radius := by simpa only [dist_comm] using hzRadius
    refine ⟨rho, hrho, ?_⟩
    have hsame :
        (SelectedClass (D.A.erase z) S.oppApex1 rho).card =
          (SelectedClass D.A S.oppApex1 rho).card :=
      selectedClass_erase_card_eq_of_not_mem hzNotClass
    have hsub :
        SelectedClass ((D.A.erase F.pair.q).erase F.pair.w)
            S.oppApex1 rho ⊆
          SelectedClass D.A S.oppApex1 rho := by
      intro z hz
      rcases mem_selectedClass.mp hz with ⟨hzA, hzRadius⟩
      exact mem_selectedClass.mpr
        ⟨Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hzA), hzRadius⟩
    have htarget :
        4 ≤ (SelectedClass (D.A.erase z)
          S.oppApex1 rho).card := by
      rw [hsame]
      exact hfour.trans (Finset.card_le_card hsub)
    simpa [SelectedClass] using htarget

/-- The marginal companion survives deletion at the first apex.  If the
frontier class has at least five points this is immediate.  If it has exactly
four, the stored double-deletion witness must use another radius and hence is
unchanged by deleting the companion. -/
theorem firstApex_survives_deleting_marginalCompanion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {E : ParentSurplusEscape R}
    (hit : FirstApexMarginalCompanion E) :
    HasNEquidistantPointsAt 4 (D.A.erase hit.point) S.oppApex1 := by
  exact firstApex_survives_deleting_frontierRadiusPoint
    (H := H) (F := F) (R := R) hit.point
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp hit.point_mem_firstApexMarginal).1).2

/-- Source-faithful common deletion carried by the marginal companion. -/
structure MarginalCompanionCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {E : ParentSurplusEscape R}
    (hit : FirstApexMarginalCompanion E) : Type where
  point_mem_A : hit.point ∈ D.A
  point_ne_deleted : hit.point ≠ F.pair.q
  firstApex_survives :
    HasNEquidistantPointsAt 4 (D.A.erase hit.point) S.oppApex1
  packet : CommonDeletionTwoCenterPacket D H hit.point S.oppApex1
    (H.centerAt F.pair.q F.pair.q_mem_A)

/-- Build the exact common-deletion packet for the marginal companion. -/
theorem nonempty_marginalCompanionCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {E : ParentSurplusEscape R}
    (hit : FirstApexMarginalCompanion E) :
    Nonempty (MarginalCompanionCommonDeletion hit) := by
  have hyA := marginalCompanion_mem_A hit
  have hyNeQ := marginalCompanion_ne_deleted hit
  have hfirst := firstApex_survives_deleting_marginalCompanion hit
  have hblockerA := blocker_mem_A H F.pair.q_mem_A
  have hcenters :
      S.oppApex1 ≠ H.centerAt F.pair.q F.pair.q_mem_A :=
    R.common.packet.actual_blocker_ne_center₁.symm
  rcases nonempty_commonDeletionTwoCenterPacket H hyA
      R.common.packet.center₁_mem_A hblockerA hcenters hfirst
      hit.actualBlocker_survives_deleting_point with ⟨packet⟩
  exact ⟨{
    point_mem_A := hyA
    point_ne_deleted := hyNeQ
    firstApex_survives := hfirst
    packet := packet }⟩

/-- On the genuine on-radius branch, the surplus escape is a second
source-faithful common deletion at the same first-apex/actual-blocker pair. -/
structure OnRadiusSurplusMarginalCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : ParentSurplusEscape R)
    (hit : FirstApexMarginalCompanion E) : Type where
  escape_firstApex_radius :
    dist E.normal.escape.point S.oppApex1 = radius
  escapeCommonDeletion : CommonDeletionTwoCenterPacket D H
    E.normal.escape.point S.oppApex1
      (H.centerAt F.pair.q F.pair.q_mem_A)
  hitCommonDeletion : MarginalCompanionCommonDeletion hit
  sources_ne : E.normal.escape.point ≠ hit.point

/-- Build both origin-tagged common-deletion packets on the on-radius
surplus/marginal branch. -/
theorem nonempty_onRadiusSurplusMarginalCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : ParentSurplusEscape R)
    (hit : FirstApexMarginalCompanion E)
    (escapeRadius : dist E.normal.escape.point S.oppApex1 = radius) :
    Nonempty (OnRadiusSurplusMarginalCommonDeletion E hit) := by
  let hitCommon := (nonempty_marginalCompanionCommonDeletion hit).some
  have hfirst := firstApex_survives_deleting_frontierRadiusPoint
    (H := H) (F := F) (R := R) E.normal.escape.point escapeRadius
  have hblockerA := blocker_mem_A H F.pair.q_mem_A
  have hcenters :
      S.oppApex1 ≠ H.centerAt F.pair.q F.pair.q_mem_A :=
    R.common.packet.actual_blocker_ne_center₁.symm
  rcases nonempty_commonDeletionTwoCenterPacket H
      E.normal.escape.point_mem_A R.common.packet.center₁_mem_A
      hblockerA hcenters hfirst
      E.normal.escape.actualBlocker_survives_deleting_point with
    ⟨escapePacket⟩
  exact ⟨{
    escape_firstApex_radius := escapeRadius
    escapeCommonDeletion := escapePacket
    hitCommonDeletion := hitCommon
    sources_ne := hit.point_ne_escape.symm }⟩

/-- Exact metric/cap packet on the directed cross-membership arm. -/
structure MarginalCrossMetricPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {E : ParentSurplusEscape R}
    (hit : FirstApexMarginalCompanion E) : Type where
  surplusMarginalCommonDeletion :
    OnRadiusSurplusMarginalCommonDeletion E hit
  hitCommonDeletion : MarginalCompanionCommonDeletion hit
  companion_mem_actualSupport :
    F.pair.w ∈
      (H.selectedAt F.pair.q
        F.pair.q_mem_A).toCriticalFourShell.support
  actualBlocker_not_mem_surplusCap :
    H.centerAt F.pair.q F.pair.q_mem_A ∉ S.surplusCap
  escape_mem_surplusCap : E.normal.escape.point ∈ S.surplusCap
  hit_not_mem_surplusCap : hit.point ∉ S.surplusCap
  hit_ne_companion : hit.point ≠ F.pair.w
  escape_firstApex_radius :
    dist E.normal.escape.point S.oppApex1 = radius
  hit_firstApex_radius : dist hit.point S.oppApex1 = radius
  deleted_firstApex_radius : dist F.pair.q S.oppApex1 = radius
  companion_firstApex_radius : dist F.pair.w S.oppApex1 = radius
  secondApex_pair_radius :
    dist S.oppApex2 E.normal.escape.point =
      dist S.oppApex2 hit.point
  actualBlocker_frontierPair_radius :
    dist (H.centerAt F.pair.q F.pair.q_mem_A) F.pair.q =
      dist (H.centerAt F.pair.q F.pair.q_mem_A) F.pair.w
  hitActualBlocker_frontierDeletionSurvival :
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
        (H.centerAt hit.point hitCommonDeletion.packet.q_mem_A) ∨
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
        (H.centerAt hit.point hitCommonDeletion.packet.q_mem_A)

/-- Two distinct, source-faithful common deletions at the same first-apex /
actual-blocker center pair. -/
structure MarginalPairedCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {E : ParentSurplusEscape R}
    (hit : FirstApexMarginalCompanion E) : Type where
  surplusMarginalCommonDeletion :
    OnRadiusSurplusMarginalCommonDeletion E hit
  hitCommonDeletion : MarginalCompanionCommonDeletion hit
  companionCommonDeletion : CommonDeletionTwoCenterPacket D H F.pair.w
    S.oppApex1 (H.centerAt F.pair.q F.pair.q_mem_A)
  sources_ne : hit.point ≠ F.pair.w

/-- Fully coupled consumer boundary.  The apparent `FirstApexMarginalCompanion`
surface first rechecks the stored escape location, because the current
`ParentSurplusEscape` type retains cap membership but not the on-radius
equality in its fields. -/
inductive FirstApexMarginalDirectedOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : ParentSurplusEscape R)
    (hit : FirstApexMarginalCompanion E) : Type
  | originalEscapeOffRadius
      (hitCommonDeletion : MarginalCompanionCommonDeletion hit)
      (offRadius : FrontierOffRadiusEscape R E.normal.escape)
      (escapeCommonDeletion :
        FrontierOffRadiusCommonDeletion E.normal.escape offRadius)
  | onRadiusCrossMetric
      (packet : MarginalCrossMetricPacket hit)
  | onRadiusCompanionCoincides
      (surplusMarginalCommonDeletion :
        OnRadiusSurplusMarginalCommonDeletion E hit)
      (hitCommonDeletion : MarginalCompanionCommonDeletion hit)
      (companionCommonDeletion : CommonDeletionTwoCenterPacket D H F.pair.w
        S.oppApex1 (H.centerAt F.pair.q F.pair.q_mem_A))
      (source_eq : hit.point = F.pair.w)
  | onRadiusPairedCommonDeletion
      (packet : MarginalPairedCommonDeletion hit)

/-- Consume both stored splits while preserving the complete parent and
source origins in every residual branch. -/
theorem nonempty_firstApexMarginalDirectedOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (E : ParentSurplusEscape R)
    (hit : FirstApexMarginalCompanion E) :
    Nonempty (FirstApexMarginalDirectedOutcome E hit) := by
  let hitCommon := (nonempty_marginalCompanionCommonDeletion hit).some
  cases hlocation : E.normal.escapeLocation with
  | offRadiusCommonDeletion offRadius commonDeletion =>
      exact ⟨FirstApexMarginalDirectedOutcome.originalEscapeOffRadius
        hitCommon offRadius commonDeletion⟩
  | onRadiusSurplus _escapeMemCap escapeRadius =>
      let surplusMarginalCommon :=
        (nonempty_onRadiusSurplusMarginalCommonDeletion
          E hit escapeRadius).some
      cases hdirected : E.normal.directed with
      | crossMembership companionMem blockerNotCap =>
          have hhitNotCap : hit.point ∉ S.surplusCap :=
            (Finset.mem_sdiff.mp hit.point_mem_firstApexMarginal).2
          have hhitNeW : hit.point ≠ F.pair.w := by
            intro h
            apply hit.point_not_mem_actualSupport
            simpa only [h] using companionMem
          have hhitRadius : dist hit.point S.oppApex1 = radius :=
            (Finset.mem_filter.mp
              (Finset.mem_sdiff.mp hit.point_mem_firstApexMarginal).1).2
          have hqRadius : dist F.pair.q S.oppApex1 = radius :=
            (Finset.mem_filter.mp
              (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
          have hwRadius : dist F.pair.w S.oppApex1 = radius :=
            (Finset.mem_filter.mp
              (Finset.mem_sdiff.mp F.pair.w_mem_marginal).1).2
          have hsecond :
              dist S.oppApex2 E.normal.escape.point =
                dist S.oppApex2 hit.point := by
            have hx := R.common.packet.row₂.same_radius
              E.normal.escape.point E.normal.escape.point_mem_secondRow
            have hy := R.common.packet.row₂.same_radius
              hit.point hit.point_mem_secondRow
            simpa only [dist_comm] using hx.trans hy.symm
          have hhitBlockerSurvival :
              HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
                  (H.centerAt hit.point hitCommon.packet.q_mem_A) ∨
                HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
                  (H.centerAt hit.point hitCommon.packet.q_mem_A) := by
            rcases frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
                F.pair companionMem
                R.common.packet.actual_blocker_ne_center₁
                hitCommon.packet.q_mem_A with
              hqSurvives | hwSurvives | hfirst | hblocker
            · exact Or.inl hqSurvives
            · exact Or.inr hwSurvives
            · exact False.elim
                (hitCommon.packet.actual_blocker_ne_center₁ hfirst)
            · exact False.elim
                (hitCommon.packet.actual_blocker_ne_center₂ hblocker)
          exact ⟨FirstApexMarginalDirectedOutcome.onRadiusCrossMetric {
            surplusMarginalCommonDeletion := surplusMarginalCommon
            hitCommonDeletion := hitCommon
            companion_mem_actualSupport := companionMem
            actualBlocker_not_mem_surplusCap := blockerNotCap
            escape_mem_surplusCap := E.point_mem_surplusCap
            hit_not_mem_surplusCap := hhitNotCap
            hit_ne_companion := hhitNeW
            escape_firstApex_radius := escapeRadius
            hit_firstApex_radius := hhitRadius
            deleted_firstApex_radius := hqRadius
            companion_firstApex_radius := hwRadius
            secondApex_pair_radius := hsecond
            actualBlocker_frontierPair_radius :=
              sourceBlocker_dist_eq_of_crossMembership F.pair companionMem
            hitActualBlocker_frontierDeletionSurvival :=
              hhitBlockerSurvival }⟩
      | companionCommonDeletion companionPacket =>
          by_cases heq : hit.point = F.pair.w
          · exact
              ⟨FirstApexMarginalDirectedOutcome.onRadiusCompanionCoincides
                surplusMarginalCommon hitCommon companionPacket heq⟩
          · exact ⟨FirstApexMarginalDirectedOutcome.onRadiusPairedCommonDeletion {
              surplusMarginalCommonDeletion := surplusMarginalCommon
              hitCommonDeletion := hitCommon
              companionCommonDeletion := companionPacket
              sources_ne := heq }⟩

#print axioms firstApex_survives_deleting_marginalCompanion
#print axioms nonempty_marginalCompanionCommonDeletion
#print axioms nonempty_onRadiusSurplusMarginalCommonDeletion
#print axioms nonempty_firstApexMarginalDirectedOutcome

end

end ATailFrontierMarginalDirectedScratch
end Problem97
