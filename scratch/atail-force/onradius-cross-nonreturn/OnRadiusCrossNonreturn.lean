/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierCommonDeletionSurplusEscape
import Erdos9796Proof.P97.ATail.ThirdCenterCommonPair

/-!
# On-radius surplus / cross-membership nonreturn boundary

This scratch file keeps the full production parent, frontier, critical map,
and refined normal form.  It studies only the constructor pair

* `FrontierRefinedEscapeOutcome.onRadiusSurplusPairedCommonDeletion`; and
* `FrontierDirectedBlockerOutcome.crossMembership`.

The first result records the two genuine alternating bisector chords forced
by convexity and the two equal-radius pairs.  The second result applies the
existing third-center classifier to the actual blocker of the marginal
companion.  That blocker either returns exactly to the stored physical
second-apex row, or it produces a common deletion at a genuinely third center.

Neither output is asserted contradictory.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailOnRadiusCrossNonreturnScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailFrontierCommonDeletionEscape
open ATailFrontierCommonDeletionSurplusEscape
open ATailOrientedPhysicalApexIngress
open ATailThirdCenterCommonPair

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Exact constructor data for the on-radius surplus arm coupled to the
directed cross-membership arm of the same refined normal form. -/
structure OnRadiusCrossBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type where
  refined : FrontierCommonDeletionRefinedNormalForm R
  surplus : ParentSurplusEscape R
  normal_eq : surplus.normal = refined.normal
  hit : FirstApexMarginalCompanion surplus
  paired : OnRadiusSurplusMarginalCommonDeletion surplus hit
  companion_mem_actualSupport :
    F.pair.w ∈
      (H.selectedAt F.pair.q
        F.pair.q_mem_A).toCriticalFourShell.support
  actualBlocker_not_mem_surplusCap :
    H.centerAt F.pair.q F.pair.q_mem_A ∉ S.surplusCap

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem oppApex1_ne_oppApex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ≠ S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v23_ne
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v13_ne.symm
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v12_ne

private theorem blocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source : ℝ²} (hsource : source ∈ A) :
    H.centerAt source hsource ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt source hsource).toCriticalFourShell.center_mem).2

private theorem equidistant_mono
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hAB : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨r, hr, hcard⟩
  refine ⟨r, hr, hcard.trans (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hAB hzA, hzdist⟩

private theorem firstApex_survives_deleting_q
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.q) S.oppApex1 := by
  exact equidistant_mono (Finset.erase_subset _ _)
    R.common.firstApexDouble

private theorem firstApex_survives_deleting_w
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.w) S.oppApex1 := by
  have hdouble :
      HasNEquidistantPointsAt 4
        ((D.A.erase F.pair.w).erase F.pair.q) S.oppApex1 := by
    simpa [Finset.erase_right_comm] using R.common.firstApexDouble
  exact equidistant_mono (Finset.erase_subset _ _) hdouble

private theorem secondApex_survives_deleting_q
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F) :
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.q) S.oppApex2 := by
  exact equidistant_mono (Finset.erase_subset _ _)
    F.secondApexDouble

private theorem secondApex_survives_deleting_w
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F) :
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.w) S.oppApex2 := by
  have hdouble :
      HasNEquidistantPointsAt 4
        ((D.A.erase F.pair.w).erase F.pair.q) S.oppApex2 := by
    simpa [Finset.erase_right_comm] using F.secondApexDouble
  exact equidistant_mono (Finset.erase_subset _ _) hdouble

/-- The exact geometric content already forced by the branch: the
surplus/marginal pair alternates across the physical-apex chord, while the
frontier pair alternates across the first-apex/actual-blocker chord. -/
structure RootedTwoBisectorAlternation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (X : OnRadiusCrossBranch R) : Prop where
  surplus_pair_firstApex_radius :
    dist X.surplus.normal.escape.point S.oppApex1 =
      dist X.hit.point S.oppApex1
  surplus_pair_secondApex_radius :
    dist X.surplus.normal.escape.point S.oppApex2 =
      dist X.hit.point S.oppApex2
  surplus_pair_midpoint_on_apex_line :
    signedArea2 (midpoint ℝ X.surplus.normal.escape.point X.hit.point)
      S.oppApex1 S.oppApex2 = 0
  surplus_pair_opposite_strict_sides :
    signedArea2 X.surplus.normal.escape.point S.oppApex1 S.oppApex2 *
      signedArea2 X.hit.point S.oppApex1 S.oppApex2 < 0
  frontier_pair_firstApex_radius :
    dist F.pair.q S.oppApex1 = dist F.pair.w S.oppApex1
  frontier_pair_actualBlocker_radius :
    dist (H.centerAt F.pair.q F.pair.q_mem_A) F.pair.q =
      dist (H.centerAt F.pair.q F.pair.q_mem_A) F.pair.w
  frontier_pair_opposite_strict_sides :
    signedArea2 F.pair.w S.oppApex1
        (H.centerAt F.pair.q F.pair.q_mem_A) *
      signedArea2 F.pair.q S.oppApex1
        (H.centerAt F.pair.q F.pair.q_mem_A) < 0

/-- Build the cap/order-aware alternating-bisector packet without weakening
the source or center provenance. -/
theorem rootedTwoBisectorAlternation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (X : OnRadiusCrossBranch R) :
    RootedTwoBisectorAlternation X := by
  have hfirstZ :
      dist X.surplus.normal.escape.point S.oppApex1 = radius :=
    X.surplus.point_mem_frontierRadius
  have hfirstY : dist X.hit.point S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp X.hit.point_mem_firstApexMarginal).1).2
  have hsecondZ := R.common.packet.row₂.same_radius
    X.surplus.normal.escape.point
    X.surplus.normal.escape.point_mem_secondRow
  have hsecondY := R.common.packet.row₂.same_radius
    X.hit.point X.hit.point_mem_secondRow
  have hsecond :
      dist X.surplus.normal.escape.point S.oppApex2 =
        dist X.hit.point S.oppApex2 := by
    simpa only [dist_comm] using hsecondZ.trans hsecondY.symm
  have hmidRaw :
      signedArea2
        (midpoint ℝ X.hit.point X.surplus.normal.escape.point)
        S.oppApex1 S.oppApex2 = 0 :=
    twoCircle_midpoint_collinear hfirstZ hfirstY
      (by simpa only [dist_comm] using hsecondZ)
      (by simpa only [dist_comm] using hsecondY)
      X.paired.sources_ne
  have hmid :
      signedArea2
        (midpoint ℝ X.surplus.normal.escape.point X.hit.point)
        S.oppApex1 S.oppApex2 = 0 :=
    by simpa [midpoint_comm] using hmidRaw
  have hflip :
      signedArea2 X.surplus.normal.escape.point S.oppApex1 S.oppApex2 =
        -signedArea2 X.hit.point S.oppApex1 S.oppApex2 :=
    signedArea2_reflection_neg hmidRaw
  have hyNotSurplus : X.hit.point ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp X.hit.point_mem_firstApexMarginal).2
  have hyA : X.hit.point ∈ D.A :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp X.hit.point_mem_firstApexMarginal).1).1
  have hyPositive :
      0 < signedArea2 X.hit.point S.oppApex1 S.oppApex2 *
        signedArea2 S.surplusApex S.oppApex1 S.oppApex2 := by
    rw [U2NonSurplusSqueeze.mem_surplusCap_iff_onArc D S hyA] at hyNotSurplus
    unfold OnArcOpposite at hyNotSurplus
    exact not_le.mp hyNotSurplus
  have hyAreaNe :
      signedArea2 X.hit.point S.oppApex1 S.oppApex2 ≠ 0 := by
    intro hzero
    rw [hzero, zero_mul] at hyPositive
    exact lt_irrefl 0 hyPositive
  refine {
    surplus_pair_firstApex_radius := hfirstZ.trans hfirstY.symm
    surplus_pair_secondApex_radius := hsecond
    surplus_pair_midpoint_on_apex_line := hmid
    surplus_pair_opposite_strict_sides := ?_
    frontier_pair_firstApex_radius := by
      simpa only [dist_comm] using firstApex_dist_eq F.pair
    frontier_pair_actualBlocker_radius :=
      sourceBlocker_dist_eq_of_crossMembership F.pair
        X.companion_mem_actualSupport
    frontier_pair_opposite_strict_sides :=
      signedArea_product_neg_of_cross_membership F.pair
        X.companion_mem_actualSupport
        R.common.packet.actual_blocker_ne_center₁ }
  rw [hflip]
  nlinarith [sq_pos_of_ne_zero hyAreaNe]

/-- If the marginal companion's actual blocker returns to the physical
second apex, its exact critical support is exactly the already stored
second-apex row. -/
structure PhysicalSecondApexReturn
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (X : OnRadiusCrossBranch R) : Prop where
  blocker_eq_secondApex :
    H.centerAt X.hit.point X.paired.hitCommonDeletion.packet.q_mem_A =
      S.oppApex2
  support_eq_secondRow :
    (H.selectedAt X.hit.point
      X.paired.hitCommonDeletion.packet.q_mem_A).toCriticalFourShell.support =
        R.common.packet.B₂

/-- Genuine nonreturn output: one of the original frontier sources survives
deletion at the first apex, the second apex, and the marginal companion's
actual blocker.  The latter is distinct from both physical apices and the
original deleted source's blocker. -/
structure ThirdCenterCommonDeletionNonreturn
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (X : OnRadiusCrossBranch R) : Type where
  source : ℝ²
  source_eq_deleted_or_companion :
    source = F.pair.q ∨ source = F.pair.w
  source_mem_A : source ∈ D.A
  source_not_mem_surplusCap : source ∉ S.surplusCap
  thirdCenter : ℝ²
  thirdCenter_eq_actualBlocker :
    thirdCenter =
      H.centerAt X.hit.point X.paired.hitCommonDeletion.packet.q_mem_A
  thirdCenter_ne_firstApex : thirdCenter ≠ S.oppApex1
  thirdCenter_ne_secondApex : thirdCenter ≠ S.oppApex2
  thirdCenter_ne_originalBlocker :
    thirdCenter ≠ H.centerAt F.pair.q F.pair.q_mem_A
  physicalPacket : CommonDeletionTwoCenterPacket D H source
    S.oppApex1 S.oppApex2
  thirdCenterPacket : CommonDeletionTwoCenterPacket D H source
    S.oppApex1 thirdCenter

/-- Exact branch-complete nonreturn boundary.  The existing third-center
classifier is consumed here; the result is either an exact physical-row
return or a genuinely new three-center common-deletion source. -/
theorem physicalSecondApexReturn_or_thirdCenterCommonDeletionNonreturn
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (X : OnRadiusCrossBranch R) :
    PhysicalSecondApexReturn X ∨
      Nonempty (ThirdCenterCommonDeletionNonreturn X) := by
  let hyA := X.paired.hitCommonDeletion.packet.q_mem_A
  let third := H.centerAt X.hit.point hyA
  have hthirdA : third ∈ D.A := blocker_mem_A H hyA
  have hthirdNeFirst : third ≠ S.oppApex1 := by
    simpa [third, hyA] using
      X.paired.hitCommonDeletion.packet.actual_blocker_ne_center₁
  have hthirdNeOriginal :
      third ≠ H.centerAt F.pair.q F.pair.q_mem_A := by
    simpa [third, hyA] using
      X.paired.hitCommonDeletion.packet.actual_blocker_ne_center₂
  have hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.q) third ∨
        HasNEquidistantPointsAt 4 (D.A.erase F.pair.w) third := by
    rcases frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
        F.pair X.companion_mem_actualSupport
        R.common.packet.actual_blocker_ne_center₁ hyA with
      hq | hw | hfirst | horiginal
    · exact Or.inl hq
    · exact Or.inr hw
    · exact False.elim (hthirdNeFirst (by simpa [third, hyA] using hfirst))
    · exact False.elim
        (hthirdNeOriginal (by simpa [third, hyA] using horiginal))
  by_cases hreturn : third = S.oppApex2
  · let Kthird : SelectedFourClass D.A
        (H.centerAt X.hit.point hyA) := {
      support := R.common.packet.B₂
      support_subset_A := by
        intro z hz
        exact (Finset.mem_erase.mp
          (Finset.mem_erase.mp (R.common.packet.row₂.subset hz)).2).2
      support_card := R.common.packet.B₂_card
      radius := R.common.packet.row₂.radius
      radius_pos := R.common.packet.row₂.radius_pos
      support_eq_radius := by
        intro z hz
        change dist third z = R.common.packet.row₂.radius
        rw [hreturn]
        exact R.common.packet.row₂.same_radius z hz
      center_not_mem := by
        intro hcenter
        exact (Finset.mem_erase.mp
          (R.common.packet.row₂.subset hcenter)).1 hreturn }
    have hsupport := H.selectedFourClass_support_eq_shell
      X.hit.point hyA Kthird
    exact Or.inl {
      blocker_eq_secondApex := by simpa [third, hyA] using hreturn
      support_eq_secondRow := by
        simpa [Kthird] using hsupport.symm }
  · have hcentersPhysical := oppApex1_ne_oppApex2 S
    have hcentersThird : S.oppApex1 ≠ third := hthirdNeFirst.symm
    rcases hsurvives with hqThird | hwThird
    · rcases nonempty_commonDeletionTwoCenterPacket H
          F.pair.q_mem_A (oppApex1_mem_A S) hthirdA hcentersThird
          (firstApex_survives_deleting_q R) hqThird with
        ⟨thirdPacket⟩
      exact Or.inr ⟨{
        source := F.pair.q
        source_eq_deleted_or_companion := Or.inl rfl
        source_mem_A := F.pair.q_mem_A
        source_not_mem_surplusCap :=
          (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
        thirdCenter := third
        thirdCenter_eq_actualBlocker := rfl
        thirdCenter_ne_firstApex := hthirdNeFirst
        thirdCenter_ne_secondApex := hreturn
        thirdCenter_ne_originalBlocker := hthirdNeOriginal
        physicalPacket := R.common.packet
        thirdCenterPacket := thirdPacket }⟩
    · rcases nonempty_commonDeletionTwoCenterPacket H
          F.pair.w_mem_A (oppApex1_mem_A S) (oppApex2_mem_A S)
          hcentersPhysical (firstApex_survives_deleting_w R)
          (secondApex_survives_deleting_w R) with ⟨physicalPacket⟩
      rcases nonempty_commonDeletionTwoCenterPacket H
          F.pair.w_mem_A (oppApex1_mem_A S) hthirdA hcentersThird
          (firstApex_survives_deleting_w R) hwThird with ⟨thirdPacket⟩
      exact Or.inr ⟨{
        source := F.pair.w
        source_eq_deleted_or_companion := Or.inr rfl
        source_mem_A := F.pair.w_mem_A
        source_not_mem_surplusCap :=
          (Finset.mem_sdiff.mp F.pair.w_mem_marginal).2
        thirdCenter := third
        thirdCenter_eq_actualBlocker := rfl
        thirdCenter_ne_firstApex := hthirdNeFirst
        thirdCenter_ne_secondApex := hreturn
        thirdCenter_ne_originalBlocker := hthirdNeOriginal
        physicalPacket := physicalPacket
        thirdCenterPacket := thirdPacket }⟩

#print axioms rootedTwoBisectorAlternation
#print axioms physicalSecondApexReturn_or_thirdCenterCommonDeletionNonreturn

end

end ATailOnRadiusCrossNonreturnScratch
end Problem97
