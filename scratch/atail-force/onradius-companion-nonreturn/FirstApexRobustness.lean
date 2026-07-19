/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierCommonDeletionSurplusEscape

/-!
# First-apex robustness on the frontier common-deletion branch

The common-deletion parent retains a K4 witness after deleting both frontier
sources at the first physical apex.  Together with the lower bound on the
frontier radius class, this already makes that apex fully deletion-robust:
either the frontier class has at least five members, or it is exact-card-four
and the double-deletion witness necessarily uses another radius.

The final theorem uses this robustness to remove the `actual blocker = first
apex` output from the `ThirdCenterCommonPair` total-map classifier.  These are
source-faithful reductions, not terminal contradictions.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailOnRadiusCompanionNonreturnScratch

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailFrontierCommonDeletionEscape
open ATailFrontierCommonDeletionSurplusEscape
open ATailOrientedPhysicalApexIngress
open ATailOrientedPhysicalApexIngress.CriticalPairFrontier
open ATailThirdCenterCommonPair

attribute [local instance] Classical.propDecidable

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

private theorem pair_q_mem_frontierClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.q_mem_marginal with ⟨hqFilter, _⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr
    ⟨hqA, by simpa only [dist_comm] using hqRadius⟩

private theorem pair_w_mem_frontierClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.w ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.w_mem_marginal with ⟨hwFilter, _⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
  exact mem_selectedClass.mpr
    ⟨hwA, by simpa only [dist_comm] using hwRadius⟩

/-- Every source-faithful common-deletion parent makes the first physical
apex fully deletion-robust.  This uses only the retained first-apex
double-deletion witness and the frontier-class lower bound. -/
theorem parentResidual_firstApex_fullyDeletionRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    FullyDeletionRobustAt D S.oppApex1 := by
  by_cases hfive :
      5 ≤ (SelectedClass D.A S.oppApex1 radius).card
  · exact fullyDeletionRobustAt_of_five_le_selectedClass
      (frontierRadius_pos F) hfive
  · have hfrontierCard :
        (SelectedClass D.A S.oppApex1 radius).card = 4 := by
      have hfour := R.frontierRadius_class_card_ge_four
      omega
    rcases R.common.firstApexDouble with ⟨otherRadius, hotherPos, hfourRaw⟩
    have hfourDouble :
        4 ≤ (SelectedClass
          ((D.A.erase F.pair.q).erase F.pair.w)
          S.oppApex1 otherRadius).card := by
      simpa [SelectedClass] using hfourRaw
    have hotherNe : otherRadius ≠ radius := by
      intro hsame
      subst otherRadius
      have hwAfterQ :
          F.pair.w ∈
            (SelectedClass D.A S.oppApex1 radius).erase F.pair.q :=
        Finset.mem_erase.mpr
          ⟨F.pair.q_ne_w.symm, pair_w_mem_frontierClass F⟩
      rw [selectedClass_erase_eq, selectedClass_erase_eq,
        Finset.card_erase_of_mem hwAfterQ,
        Finset.card_erase_of_mem (pair_q_mem_frontierClass F),
        hfrontierCard] at hfourDouble
      omega
    have hfourOther :
        4 ≤ (SelectedClass D.A S.oppApex1 otherRadius).card := by
      refine hfourDouble.trans (Finset.card_le_card ?_)
      intro x hx
      rcases mem_selectedClass.mp hx with ⟨hxA, hxRadius⟩
      exact mem_selectedClass.mpr
        ⟨Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxA), hxRadius⟩
    refine ⟨?_⟩
    intro z hzA
    by_cases hzFrontier :
        z ∈ SelectedClass D.A S.oppApex1 radius
    · have hzOther :
          z ∉ SelectedClass D.A S.oppApex1 otherRadius := by
        intro hzOther
        apply hotherNe
        calc
          otherRadius = dist S.oppApex1 z :=
            (mem_selectedClass.mp hzOther).2.symm
          _ = radius := (mem_selectedClass.mp hzFrontier).2
      refine ⟨otherRadius, hotherPos, ?_⟩
      have hsame :=
        selectedClass_erase_card_eq_of_not_mem hzOther
      have htarget :
          4 ≤ (SelectedClass (D.A.erase z)
            S.oppApex1 otherRadius).card := by
        rw [hsame]
        exact hfourOther
      simpa [SelectedClass] using htarget
    · refine ⟨radius, frontierRadius_pos F, ?_⟩
      have hsame :=
        selectedClass_erase_card_eq_of_not_mem hzFrontier
      have htarget :
          4 ≤ (SelectedClass (D.A.erase z)
            S.oppApex1 radius).card := by
        rw [hsame]
        exact R.frontierRadius_class_card_ge_four
      simpa [SelectedClass] using htarget

/-- The first apex cannot be the actual blocker of any source in the retained
critical-shell system. -/
theorem parentResidual_actualBlocker_ne_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (source : ℝ²) (hsource : source ∈ D.A) :
    H.centerAt source hsource ≠ S.oppApex1 :=
  (parentResidual_firstApex_fullyDeletionRobust R).centerAt_ne
    H source hsource

/-- On a directed cross-membership arm, first-apex robustness removes the
`actual blocker = first apex` alternative from the existing total-map
classifier. -/
theorem frontierDeletionSurvival_or_actualBlocker_eq_frontierBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (hwSupport :
      F.pair.w ∈
        (H.selectedAt F.pair.q
          F.pair.q_mem_A).toCriticalFourShell.support)
    (source : ℝ²) (hsource : source ∈ D.A) :
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
        (H.centerAt source hsource) ∨
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
        (H.centerAt source hsource) ∨
      H.centerAt source hsource =
        H.centerAt F.pair.q F.pair.q_mem_A := by
  rcases frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
      F.pair hwSupport R.common.packet.actual_blocker_ne_center₁ hsource with
    hq | hw | hfirst | hblocker
  · exact Or.inl hq
  · exact Or.inr (Or.inl hw)
  · exact False.elim
      (parentResidual_actualBlocker_ne_firstApex R source hsource hfirst)
  · exact Or.inr (Or.inr hblocker)

/-- Exact source-tagged packet on the conjunction of the on-radius surplus
paired-deletion arm and the directed companion-deletion arm.  It retains all
three deletion origins, the full first-apex radius equalities, the physical
second-apex equality for the surplus/marginal pair, and exclusion of all
three sources from the deleted frontier source's actual shell. -/
structure OnRadiusDirectedCompanionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {normal : FrontierCommonDeletionConsumerNormalForm R}
    (surplus : ParentSurplusEscape R)
    (hit : FirstApexMarginalCompanion surplus)
    (paired : OnRadiusSurplusMarginalCommonDeletion surplus hit)
    (companion : CommonDeletionTwoCenterPacket D H F.pair.w
      S.oppApex1 (H.centerAt F.pair.q F.pair.q_mem_A)) : Type where
  normal_eq : surplus.normal = normal
  directed_eq :
    normal.directed =
      FrontierDirectedBlockerOutcome.companionCommonDeletion companion
  firstApex_robust : FullyDeletionRobustAt D S.oppApex1
  escape_ne_hit : surplus.normal.escape.point ≠ hit.point
  escape_ne_companion : surplus.normal.escape.point ≠ F.pair.w
  escape_ne_deleted : surplus.normal.escape.point ≠ F.pair.q
  hit_ne_deleted : hit.point ≠ F.pair.q
  escape_not_mem_actualSupport :
    surplus.normal.escape.point ∉
      (H.selectedAt F.pair.q
        F.pair.q_mem_A).toCriticalFourShell.support
  hit_not_mem_actualSupport :
    hit.point ∉
      (H.selectedAt F.pair.q
        F.pair.q_mem_A).toCriticalFourShell.support
  companion_not_mem_actualSupport :
    F.pair.w ∉
      (H.selectedAt F.pair.q
        F.pair.q_mem_A).toCriticalFourShell.support
  escape_firstApex_radius :
    dist surplus.normal.escape.point S.oppApex1 = radius
  hit_firstApex_radius : dist hit.point S.oppApex1 = radius
  deleted_firstApex_radius : dist F.pair.q S.oppApex1 = radius
  companion_firstApex_radius : dist F.pair.w S.oppApex1 = radius
  secondApex_escape_hit_radius :
    dist S.oppApex2 surplus.normal.escape.point =
      dist S.oppApex2 hit.point

/-- The exact remaining source coincidence split.  In the second arm the
surplus escape, marginal hit, and frontier companion are three pairwise
distinct common-deletion sources at the same two centers. -/
inductive OnRadiusDirectedCompanionSourceSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {normal : FrontierCommonDeletionConsumerNormalForm R}
    {surplus : ParentSurplusEscape R}
    {hit : FirstApexMarginalCompanion surplus}
    {paired : OnRadiusSurplusMarginalCommonDeletion surplus hit}
    {companion : CommonDeletionTwoCenterPacket D H F.pair.w
      S.oppApex1 (H.centerAt F.pair.q F.pair.q_mem_A)}
    (packet : OnRadiusDirectedCompanionPacket
      (normal := normal) surplus hit paired companion) : Type
  | hitIsCompanion
      (hit_eq_companion : hit.point = F.pair.w)
  | threeDistinctSources
      (hit_ne_companion : hit.point ≠ F.pair.w)

/-- Build the exact packet and expose only the unavoidable equality split
between the marginal hit and the frontier companion source. -/
theorem nonempty_onRadiusDirectedCompanionSourceSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {normal : FrontierCommonDeletionConsumerNormalForm R}
    (surplus : ParentSurplusEscape R)
    (normal_eq : surplus.normal = normal)
    (hit : FirstApexMarginalCompanion surplus)
    (paired : OnRadiusSurplusMarginalCommonDeletion surplus hit)
    (companion : CommonDeletionTwoCenterPacket D H F.pair.w
      S.oppApex1 (H.centerAt F.pair.q F.pair.q_mem_A))
    (directed_eq :
      normal.directed =
        FrontierDirectedBlockerOutcome.companionCommonDeletion companion) :
    ∃ packet : OnRadiusDirectedCompanionPacket (normal := normal)
        surplus hit paired companion,
      Nonempty (OnRadiusDirectedCompanionSourceSplit packet) := by
  have hescapeNeW : surplus.normal.escape.point ≠ F.pair.w := by
    intro h
    have hwOff : F.pair.w ∉ S.surplusCap :=
      (Finset.mem_sdiff.mp F.pair.w_mem_marginal).2
    apply hwOff
    simpa only [h] using surplus.point_mem_surplusCap
  have hescapeNeQ : surplus.normal.escape.point ≠ F.pair.q := by
    intro h
    exact surplus.normal.escape.point_ne_deleted h
  have hhitNeQ : hit.point ≠ F.pair.q := by
    intro h
    have hrow := R.common.packet.row₂.subset hit.point_mem_secondRow
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hrow).2).1 h
  have hwOutside :
      F.pair.w ∉
        (H.selectedAt F.pair.q
          F.pair.q_mem_A).toCriticalFourShell.support :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H F.pair.q_mem_A).mp companion.survives₂
  have hsecond :
      dist S.oppApex2 surplus.normal.escape.point =
        dist S.oppApex2 hit.point := by
    have he := R.common.packet.row₂.same_radius
      surplus.normal.escape.point
      surplus.normal.escape.point_mem_secondRow
    have hh := R.common.packet.row₂.same_radius
      hit.point hit.point_mem_secondRow
    exact he.trans hh.symm
  let packet : OnRadiusDirectedCompanionPacket
      (normal := normal) surplus hit paired companion := {
    normal_eq := normal_eq
    directed_eq := directed_eq
    firstApex_robust := parentResidual_firstApex_fullyDeletionRobust R
    escape_ne_hit := paired.sources_ne
    escape_ne_companion := hescapeNeW
    escape_ne_deleted := hescapeNeQ
    hit_ne_deleted := hhitNeQ
    escape_not_mem_actualSupport :=
      surplus.normal.escape.point_not_mem_actualSupport
    hit_not_mem_actualSupport := hit.point_not_mem_actualSupport
    companion_not_mem_actualSupport := hwOutside
    escape_firstApex_radius := surplus.point_mem_frontierRadius
    hit_firstApex_radius :=
      (Finset.mem_filter.mp
        (Finset.mem_sdiff.mp hit.point_mem_firstApexMarginal).1).2
    deleted_firstApex_radius :=
      (Finset.mem_filter.mp
        (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
    companion_firstApex_radius :=
      (Finset.mem_filter.mp
        (Finset.mem_sdiff.mp F.pair.w_mem_marginal).1).2
    secondApex_escape_hit_radius := hsecond }
  refine ⟨packet, ?_⟩
  by_cases hhitW : hit.point = F.pair.w
  · exact ⟨OnRadiusDirectedCompanionSourceSplit.hitIsCompanion hhitW⟩
  · exact ⟨OnRadiusDirectedCompanionSourceSplit.threeDistinctSources
      hhitW⟩

/-- In the genuine three-source arm, the frontier companion is not a member
of the stored physical-second-apex row.  The marginal hit already occupies
the unique possible intersection of that row with the first-apex marginal.
Thus the missing second-apex equality cannot come from the retained row. -/
theorem companion_not_mem_secondRow_of_hit_ne_companion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {surplus : ParentSurplusEscape R}
    (hit : FirstApexMarginalCompanion surplus)
    (hit_ne_companion : hit.point ≠ F.pair.w) :
    F.pair.w ∉ R.common.packet.B₂ := by
  intro hwSecond
  let marginal :=
    (D.A.filter fun x ↦ dist x S.oppApex1 = radius) \ S.surplusCap
  have hwInter : F.pair.w ∈ R.common.packet.B₂ ∩ marginal :=
    Finset.mem_inter.mpr ⟨hwSecond, by
      simpa [marginal] using F.pair.w_mem_marginal⟩
  have hhitInter : hit.point ∈ R.common.packet.B₂ ∩ marginal :=
    Finset.mem_inter.mpr ⟨hit.point_mem_secondRow, by
      simpa [marginal] using hit.point_mem_firstApexMarginal⟩
  have hunique := Finset.card_le_one.mp
    (frontierCommonDeletionResidual_secondRow_inter_marginal_card_le_one
      R.common)
  exact hit_ne_companion
    (hunique F.pair.w hwInter hit.point hhitInter).symm

#print axioms parentResidual_firstApex_fullyDeletionRobust
#print axioms parentResidual_actualBlocker_ne_firstApex
#print axioms frontierDeletionSurvival_or_actualBlocker_eq_frontierBlocker
#print axioms nonempty_onRadiusDirectedCompanionSourceSplit
#print axioms companion_not_mem_secondRow_of_hit_ne_companion

end ATailOnRadiusCompanionNonreturnScratch
end Problem97
