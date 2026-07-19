/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierCommonDeletionSurplusEscape

/-!
# Scratch: off-radius frontier source versus the directed blocker split

This file keeps the off-radius source and the original frontier pair in their
source-indexed roles.  On the directed cross-membership arm, a complete
reverse return through the off-radius source is impossible by the three-center
perpendicular-bisector bound.  On the companion-common-deletion arm, the
honest output is instead a two-source omission fork; a complete reverse return
only localizes the off-radius source's actual blocker outside the surplus cap.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailOffRadiusDirectedNonreturnScratch

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailFrontierCommonDeletionEscape
open ATailOrientedPhysicalApexIngress
open ATailThirdCenterCommonPair

attribute [local instance] Classical.propDecidable

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

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

/-- Any actual blocker whose selected row contains both frontier sources lies
outside the surplus cap.  The first apex is already a distinct center in that
cap equidistant from the same two off-cap points. -/
theorem sourceBlocker_not_mem_surplusCap_of_frontierPair_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {source : ℝ²} (hsource : source ∈ D.A)
    (hblocker_ne_first : H.centerAt source hsource ≠ S.oppApex1)
    (hqSupport :
      F.pair.q ∈
        (H.selectedAt source hsource).toCriticalFourShell.support)
    (hwSupport :
      F.pair.w ∈
        (H.selectedAt source hsource).toCriticalFourShell.support) :
    H.centerAt source hsource ∉ S.surplusCap := by
  intro hblockerSurplus
  rcases S.capByIndex_cgn4g_capData D.convex S.surplusIdx with
    ⟨m, L, packet, _hside, hord, hcap⟩
  have hcapSurplus := capByIndex_surplusIdx_eq_surplusCap S
  have hfirstImage : S.oppApex1 ∈ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact oppApex1_mem_surplusCap S
  have hblockerImage :
      H.centerAt source hsource ∈ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hblockerSurplus
  rcases Finset.mem_image.mp hfirstImage with
    ⟨ifirst, _hifirst, hifirst⟩
  rcases Finset.mem_image.mp hblockerImage with
    ⟨iblocker, _hiblocker, hiblocker⟩
  have hindices_ne : ifirst ≠ iblocker := by
    intro hindices
    apply hblocker_ne_first
    calc
      H.centerAt source hsource = L.points iblocker := hiblocker.symm
      _ = L.points ifirst := by simp [hindices]
      _ = S.oppApex1 := hifirst
  have hqOutside : F.pair.q ∉ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hwOutside : F.pair.w ∉ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact (Finset.mem_sdiff.mp F.pair.w_mem_marginal).2
  have hfirstEq :
      dist S.oppApex1 F.pair.q = dist S.oppApex1 F.pair.w :=
    firstApex_dist_eq F.pair
  have hblockerEq :
      dist (H.centerAt source hsource) F.pair.q =
        dist (H.centerAt source hsource) F.pair.w :=
    (H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
      F.pair.q hqSupport |>.trans
        ((H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
          F.pair.w hwSupport).symm
  rcases lt_or_gt_of_ne hindices_ne with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex hord packet.mem_A hlt F.pair.q_mem_A F.pair.w_mem_A
      hqOutside hwOutside F.pair.q_ne_w
      (by simpa [hifirst] using hfirstEq)
      (by simpa [hiblocker] using hblockerEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex hord packet.mem_A hgt F.pair.q_mem_A F.pair.w_mem_A
      hqOutside hwOutside F.pair.q_ne_w
      (by simpa [hiblocker] using hblockerEq)
      (by simpa [hifirst] using hfirstEq)

/-- On the directed cross-membership arm, an off-radius common-deletion
source cannot return to both original frontier sources in its actual row. -/
theorem false_of_crossMembership_offRadius_fullReturn
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {escape : FrontierSecondRowOffConfinementEscape R.common}
    {offRadius : FrontierOffRadiusEscape R escape}
    (commonDeletion : FrontierOffRadiusCommonDeletion escape offRadius)
    (hwSupport :
      F.pair.w ∈
        (H.selectedAt F.pair.q
          F.pair.q_mem_A).toCriticalFourShell.support)
    (hqReturn :
      F.pair.q ∈
        (H.selectedAt escape.point
          escape.point_mem_A).toCriticalFourShell.support)
    (hwReturn :
      F.pair.w ∈
        (H.selectedAt escape.point
          escape.point_mem_A).toCriticalFourShell.support) :
    False := by
  exact false_of_thirdActualCenter_selectedRow_contains_frontierPair
    F.pair hwSupport R.common.packet.actual_blocker_ne_center₁
    escape.point_mem_A
    commonDeletion.packet.actual_blocker_ne_center₁
    commonDeletion.packet.actual_blocker_ne_center₂
    hqReturn hwReturn

/-- Disjunctive nonreturn form of
`false_of_crossMembership_offRadius_fullReturn`. -/
theorem crossMembership_offRadius_nonreturn
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {escape : FrontierSecondRowOffConfinementEscape R.common}
    {offRadius : FrontierOffRadiusEscape R escape}
    (commonDeletion : FrontierOffRadiusCommonDeletion escape offRadius)
    (hwSupport :
      F.pair.w ∈
        (H.selectedAt F.pair.q
          F.pair.q_mem_A).toCriticalFourShell.support) :
    F.pair.q ∉
        (H.selectedAt escape.point
          escape.point_mem_A).toCriticalFourShell.support ∨
      F.pair.w ∉
        (H.selectedAt escape.point
          escape.point_mem_A).toCriticalFourShell.support := by
  by_cases hqReturn :
      F.pair.q ∈
        (H.selectedAt escape.point
          escape.point_mem_A).toCriticalFourShell.support
  · exact Or.inr (fun hwReturn ↦
      false_of_crossMembership_offRadius_fullReturn
        commonDeletion hwSupport hqReturn hwReturn)
  · exact Or.inl hqReturn

/-- On the companion-common-deletion arm, the original source's actual row
omits both the off-radius source and the companion frontier source. -/
theorem companionCommonDeletion_two_source_omission_fork
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {escape : FrontierSecondRowOffConfinementEscape R.common}
    {offRadius : FrontierOffRadiusEscape R escape}
    (_commonDeletion : FrontierOffRadiusCommonDeletion escape offRadius)
    (companion : CommonDeletionTwoCenterPacket D H F.pair.w
      S.oppApex1 (H.centerAt F.pair.q F.pair.q_mem_A)) :
    escape.point ≠ F.pair.w ∧
      escape.point ∉
        (H.selectedAt F.pair.q
          F.pair.q_mem_A).toCriticalFourShell.support ∧
      F.pair.w ∉
        (H.selectedAt F.pair.q
          F.pair.q_mem_A).toCriticalFourShell.support := by
  exact ⟨offRadius.point_ne_companion,
    escape.point_not_mem_actualSupport,
    (cross_deletion_survives_iff_not_mem_selected_support
      H F.pair.q_mem_A).mp companion.survives₂⟩

/-- If the off-radius source nevertheless returns to both frontier points on
the companion-common-deletion arm, cap order forces its actual blocker out of
the surplus cap. -/
theorem companionCommonDeletion_fullReturn_localizes_sourceBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {escape : FrontierSecondRowOffConfinementEscape R.common}
    {offRadius : FrontierOffRadiusEscape R escape}
    (commonDeletion : FrontierOffRadiusCommonDeletion escape offRadius)
    (_companion : CommonDeletionTwoCenterPacket D H F.pair.w
      S.oppApex1 (H.centerAt F.pair.q F.pair.q_mem_A))
    (hqReturn :
      F.pair.q ∈
        (H.selectedAt escape.point
          escape.point_mem_A).toCriticalFourShell.support)
    (hwReturn :
      F.pair.w ∈
        (H.selectedAt escape.point
          escape.point_mem_A).toCriticalFourShell.support) :
    H.centerAt escape.point escape.point_mem_A ∉ S.surplusCap :=
  sourceBlocker_not_mem_surplusCap_of_frontierPair_membership
    escape.point_mem_A commonDeletion.packet.actual_blocker_ne_center₁
      hqReturn hwReturn

/-- Exact joint output for either off-radius constructor after coupling it to
the directed blocker outcome stored by the same normal form. -/
inductive OffRadiusDirectedOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (escape : FrontierSecondRowOffConfinementEscape R.common)
    (offRadius : FrontierOffRadiusEscape R escape)
    (commonDeletion : FrontierOffRadiusCommonDeletion escape offRadius) : Type
  | crossNonreturn
      (companion_mem_actualSupport :
        F.pair.w ∈
          (H.selectedAt F.pair.q
            F.pair.q_mem_A).toCriticalFourShell.support)
      (actualBlocker_not_mem_surplusCap :
        H.centerAt F.pair.q F.pair.q_mem_A ∉ S.surplusCap)
      (reverse_omission :
        F.pair.q ∉
            (H.selectedAt escape.point
              escape.point_mem_A).toCriticalFourShell.support ∨
          F.pair.w ∉
            (H.selectedAt escape.point
              escape.point_mem_A).toCriticalFourShell.support)
  | companionFork
      (companion : CommonDeletionTwoCenterPacket D H F.pair.w
        S.oppApex1 (H.centerAt F.pair.q F.pair.q_mem_A))
      (source_ne_companion : escape.point ≠ F.pair.w)
      (source_not_mem_actualSupport :
        escape.point ∉
          (H.selectedAt F.pair.q
            F.pair.q_mem_A).toCriticalFourShell.support)
      (companion_not_mem_actualSupport :
        F.pair.w ∉
          (H.selectedAt F.pair.q
            F.pair.q_mem_A).toCriticalFourShell.support)
      (fullReturn_localizes_sourceBlocker :
        F.pair.q ∈
            (H.selectedAt escape.point
              escape.point_mem_A).toCriticalFourShell.support →
          F.pair.w ∈
            (H.selectedAt escape.point
              escape.point_mem_A).toCriticalFourShell.support →
          H.centerAt escape.point escape.point_mem_A ∉ S.surplusCap)

/-- Both refined off-radius constructors reach the same exact, source-tagged
joint output; the theorem needs only their common off-radius packet and the
directed outcome from the retained normal form. -/
theorem nonempty_offRadiusDirectedOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (normal : FrontierCommonDeletionConsumerNormalForm R)
    (escape : FrontierSecondRowOffConfinementEscape R.common)
    (offRadius : FrontierOffRadiusEscape R escape)
    (commonDeletion : FrontierOffRadiusCommonDeletion escape offRadius) :
    Nonempty (OffRadiusDirectedOutcome escape offRadius commonDeletion) := by
  cases normal.directed with
  | crossMembership hwSupport hblockerOff =>
      exact ⟨OffRadiusDirectedOutcome.crossNonreturn
        hwSupport hblockerOff
        (crossMembership_offRadius_nonreturn commonDeletion hwSupport)⟩
  | companionCommonDeletion companion =>
      have hfork := companionCommonDeletion_two_source_omission_fork
        commonDeletion companion
      exact ⟨OffRadiusDirectedOutcome.companionFork companion
        hfork.1 hfork.2.1 hfork.2.2
        (fun hqReturn hwReturn ↦
          companionCommonDeletion_fullReturn_localizes_sourceBlocker
            commonDeletion companion hqReturn hwReturn)⟩

#print axioms sourceBlocker_not_mem_surplusCap_of_frontierPair_membership
#print axioms false_of_crossMembership_offRadius_fullReturn
#print axioms crossMembership_offRadius_nonreturn
#print axioms companionCommonDeletion_two_source_omission_fork
#print axioms companionCommonDeletion_fullReturn_localizes_sourceBlocker
#print axioms nonempty_offRadiusDirectedOutcome

end ATailOffRadiusDirectedNonreturnScratch
end Problem97
