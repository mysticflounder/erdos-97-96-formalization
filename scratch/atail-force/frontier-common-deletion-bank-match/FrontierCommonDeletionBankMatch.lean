/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress
import Erdos9796Proof.P97.ATail.ThirdCenterCommonPair
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Source-faithful frontier common-deletion bank match

This scratch module checks what the current parent residual actually retains.
It does not assert a new contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FrontierCommonDeletionBankMatch

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailThirdCenterCommonPair

attribute [local instance] Classical.propDecidable

private theorem equidistant_mono
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hAB : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨r, hr, hcard⟩
  refine ⟨r, hr, le_trans hcard (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hAB hzA, hzdist⟩

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

/-- The genuinely source-faithful double-deletion output. Besides retaining
the complete parent residual, it stores the first-apex branch witness and a
second common-deletion packet for the frontier's other source at the same two
prescribed Moser apices. -/
structure FrontierTwoSourceSameApexDeletionResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type where
  firstApexDouble :
    HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1
  secondPacket : CommonDeletionTwoCenterPacket
    D H F.pair.w S.oppApex1 S.oppApex2

/-- The current `FrontierCommonDeletionParentResidual` does not by itself
identify the double-deletion arm. Re-inspecting the retained frontier yields
either the protected original unique-radius arm or the intended two-source,
same-apex deletion residual. -/
theorem originalUnique_or_twoSourceSameApexDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    OriginalFrontierUniqueRadiusArm F ∨
      Nonempty (FrontierTwoSourceSameApexDeletionResidual R) := by
  rcases F.firstApexSplit with hdouble | hunique
  · have hdoubleSym :
        HasNEquidistantPointsAt 4
          ((D.A.erase F.pair.w).erase F.pair.q) S.oppApex1 := by
      simpa [Finset.erase_right_comm] using hdouble
    have hfirstW :
        HasNEquidistantPointsAt 4
          (D.A.erase F.pair.w) S.oppApex1 :=
      equidistant_mono (Finset.erase_subset _ _) hdoubleSym
    have hsecondDoubleSym :
        HasNEquidistantPointsAt 4
          ((D.A.erase F.pair.w).erase F.pair.q) S.oppApex2 := by
      simpa [Finset.erase_right_comm] using F.secondApexDouble
    have hsecondW :
        HasNEquidistantPointsAt 4
          (D.A.erase F.pair.w) S.oppApex2 :=
      equidistant_mono (Finset.erase_subset _ _) hsecondDoubleSym
    rcases nonempty_commonDeletionTwoCenterPacket H
        F.pair.w_mem_A R.common.packet.center₁_mem_A
        R.common.packet.center₂_mem_A R.common.packet.centers_ne
        hfirstW hsecondW with ⟨secondPacket⟩
    exact Or.inr ⟨{
      firstApexDouble := hdouble
      secondPacket := secondPacket }⟩
  · exact Or.inl hunique

/-- On the genuine double-deletion branch, the first source's actual blocker
either supplies the directed cross-membership consumed by the existing
third-center bank, or the other frontier source supplies a second exact
common-deletion packet between the first apex and that actual blocker. -/
theorem crossMembership_or_secondSourceBlockerDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (T : FrontierTwoSourceSameApexDeletionResidual R) :
    F.pair.w ∈
        (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support ∨
      Nonempty (CommonDeletionTwoCenterPacket D H F.pair.w
        S.oppApex1 (H.centerAt F.pair.q F.pair.q_mem_A)) := by
  rcases cross_deletion_survives_or_cross_membership F.pair with
    hcross | hwSupport
  · have hcenterA : H.centerAt F.pair.q F.pair.q_mem_A ∈ D.A :=
      (Finset.mem_erase.mp
        (H.selectedAt F.pair.q
          F.pair.q_mem_A).toCriticalFourShell.center_mem).2
    have hcenters :
        S.oppApex1 ≠ H.centerAt F.pair.q F.pair.q_mem_A :=
      (_root_.Problem97.ATailCriticalPairFrontier.SurvivorPairRelocationPacket.actual_blocker_ne_oppApex1_of_cross_deletion_survives
        F.pair hcross).symm
    have hdoubleSym :
        HasNEquidistantPointsAt 4
          ((D.A.erase F.pair.w).erase F.pair.q) S.oppApex1 := by
      simpa [Finset.erase_right_comm] using T.firstApexDouble
    have hfirstW :
        HasNEquidistantPointsAt 4
          (D.A.erase F.pair.w) S.oppApex1 :=
      equidistant_mono (Finset.erase_subset _ _) hdoubleSym
    exact Or.inr (nonempty_commonDeletionTwoCenterPacket H
      F.pair.w_mem_A R.common.packet.center₁_mem_A hcenterA
      hcenters hfirstW hcross)
  · exact Or.inl hwSupport

/-- Exact match to the existing ordered-cap outside-pair consumer. If the
directed cross-membership arm fires, the actual blocker selected for the
first frontier source cannot lie in the surplus cap: it and the first apex
would be two distinct centers in that cap equidistant from the same two
distinct frontier points outside the cap. -/
theorem actualBlocker_not_mem_surplusCap_of_crossMembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (hwSupport :
      F.pair.w ∈
        (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support) :
    H.centerAt F.pair.q F.pair.q_mem_A ∉ S.surplusCap := by
  intro hblockerSurplus
  rcases S.capByIndex_cgn4g_capData D.convex S.surplusIdx with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcapSurplus := capByIndex_surplusIdx_eq_surplusCap S
  have hfirstImage : S.oppApex1 ∈ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact oppApex1_mem_surplusCap S
  have hblockerImage :
      H.centerAt F.pair.q F.pair.q_mem_A ∈ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hblockerSurplus
  rcases Finset.mem_image.mp hfirstImage with
    ⟨ifirst, _hifirst, hifirst⟩
  rcases Finset.mem_image.mp hblockerImage with
    ⟨iblocker, _hiblocker, hiblocker⟩
  have hindices_ne : ifirst ≠ iblocker := by
    intro hindices
    apply R.common.packet.actual_blocker_ne_center₁
    calc
      H.centerAt F.pair.q F.pair.q_mem_A = L.points iblocker := hiblocker.symm
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
      dist (H.centerAt F.pair.q F.pair.q_mem_A) F.pair.q =
        dist (H.centerAt F.pair.q F.pair.q_mem_A) F.pair.w :=
    sourceBlocker_dist_eq_of_crossMembership F.pair hwSupport
  rcases lt_or_gt_of_ne hindices_ne with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt F.pair.q_mem_A F.pair.w_mem_A
      hqOutside hwOutside F.pair.q_ne_w
      (by simpa [hifirst] using hfirstEq)
      (by simpa [hiblocker] using hblockerEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt F.pair.q_mem_A F.pair.w_mem_A
      hqOutside hwOutside F.pair.q_ne_w
      (by simpa [hiblocker] using hblockerEq)
      (by simpa [hifirst] using hfirstEq)

#print axioms originalUnique_or_twoSourceSameApexDeletion
#print axioms crossMembership_or_secondSourceBlockerDeletion
#print axioms actualBlocker_not_mem_surplusCap_of_crossMembership

end FrontierCommonDeletionBankMatch
end Problem97
