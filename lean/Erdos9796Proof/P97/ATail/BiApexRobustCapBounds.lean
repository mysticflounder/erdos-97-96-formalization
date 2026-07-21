/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapApexRadiusRigidity
import Erdos9796Proof.P97.ATail.LargeOppositeCapsBiApexSurface
import Erdos9796Proof.P97.ATail.LargeCapUniqueFive

/-!
# Cap bounds at the bi-apex robust frontier

The retained first-apex pair and common double-deletion witness force its
opposite cap to have at least six points.  Full deletion robustness forces
the second opposite cap to have at least five.  This gives the honest split:
the large-cap surface when the second cap has at least six points, and a
separate exact-five residual otherwise.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBiApexRobustCapBounds

open ATailCapApexRadiusRigidity
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailLargeOppositeCapsBiApexSurface
open ATailLargeCapUniqueFive
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

private theorem oppApex1_eq_oppositeVertex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem oppApex2_eq_oppositeVertex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem frontier_pair_q_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.q_mem_marginal with ⟨hqFilter, _⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr ⟨hqA, by simpa only [dist_comm] using hqRadius⟩

private theorem frontier_pair_w_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.w ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.w_mem_marginal with ⟨hwFilter, _⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
  exact mem_selectedClass.mpr ⟨hwA, by simpa only [dist_comm] using hwRadius⟩

private theorem frontierRadius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F) :
    0 < radius := by
  have hqNotSurplus : F.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hfirstNeQ : S.oppApex1 ≠ F.pair.q := by
    intro h
    apply hqNotSurplus
    rw [← h]
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex1, hi] using
        S.partition.v2_mem_C1
    · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex1, hi] using
        S.partition.v3_mem_C2
    · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex1, hi] using
        S.partition.v1_mem_C3
  have hpos : 0 < dist S.oppApex1 F.pair.q := dist_pos.mpr hfirstNeQ
  have hqRadius : dist F.pair.q S.oppApex1 = radius :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  simpa only [dist_comm, hqRadius] using hpos

/-- The retained two-source common-deletion witness forces the first physical
opposite cap to have cardinality at least six. -/
theorem first_oppCap_card_ge_six
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    6 ≤ S.oppCap1.card := by
  rcases R.common.firstApexDouble with ⟨otherRadius, hotherPos, hfourRaw⟩
  have hfourDouble :
      4 ≤ (SelectedClass ((D.A.erase F.pair.q).erase F.pair.w)
        S.oppApex1 otherRadius).card := by
    simpa [SelectedClass] using hfourRaw
  have hfourOther : 4 ≤ (SelectedClass D.A S.oppApex1 otherRadius).card := by
    refine hfourDouble.trans (Finset.card_le_card ?_)
    intro x hx
    rcases mem_selectedClass.mp hx with ⟨hxA, hxRadius⟩
    exact mem_selectedClass.mpr
      ⟨Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxA), hxRadius⟩
  by_cases hsame : otherRadius = radius
  · subst otherRadius
    have hwAfterQ : F.pair.w ∈
        (SelectedClass D.A S.oppApex1 radius).erase F.pair.q := by
      exact Finset.mem_erase.mpr
        ⟨F.pair.q_ne_w.symm, frontier_pair_w_mem_firstClass F⟩
    rw [selectedClass_erase_eq, selectedClass_erase_eq,
      Finset.card_erase_of_mem hwAfterQ,
      Finset.card_erase_of_mem (frontier_pair_q_mem_firstClass F)] at hfourDouble
    have hclassSix : 6 ≤ (SelectedClass D.A S.oppApex1 radius).card := by omega
    have hcenter := oppApex1_eq_oppositeVertex_oppIndex1 S
    by_contra hnotSix
    rcases oppositeCaps_card_ge_four D S with ⟨hfirstFour, _⟩
    have hfirstFour' : 4 ≤ S.oppCap1.card := by
      simpa only [← capByIndex_oppIndex1_eq_oppCap1] using hfirstFour
    have hfourCap : S.oppCap1.card = 4 ∨ S.oppCap1.card = 5 := by omega
    rcases hfourCap with hcap4 | hcap5
    · have hbyIndex : (S.capByIndex S.oppIndex1).card = 4 := by
        simpa [capByIndex_oppIndex1_eq_oppCap1] using hcap4
      have hle := oppositeVertex_selectedClass_card_le_four_of_cap_card_eq_four
        S D.convex S.oppIndex1 hbyIndex (frontierRadius_pos R)
      rw [← hcenter] at hle
      omega
    · have hbyIndex : (S.capByIndex S.oppIndex1).card = 5 := by
        simpa [capByIndex_oppIndex1_eq_oppCap1] using hcap5
      have hle := oppositeVertex_selectedClass_card_le_five_of_cap_card_eq_five
        S D.convex S.oppIndex1 hbyIndex (frontierRadius_pos R)
      rw [← hcenter] at hle
      omega
  · have hcenter := oppApex1_eq_oppositeVertex_oppIndex1 S
    have hcap := oppositeVertex_distinct_K4_radii_force_cap_card_ge_six
      S D.convex S.oppIndex1 hotherPos (frontierRadius_pos R)
      (by simpa only [← hcenter] using hfourOther)
      (by simpa only [← hcenter] using R.frontierRadius_class_card_ge_four) hsame
    simpa only [capByIndex_oppIndex1_eq_oppCap1] using hcap

/-- Full deletion robustness at the second physical apex rules out a
four-point opposite cap. -/
theorem second_oppCap_card_ge_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (B : FullyDeletionRobustAt D S.oppApex2) :
    5 ≤ S.oppCap2.card := by
  rcases oppositeCaps_card_ge_four D S with ⟨_, hfourCap⟩
  by_contra hnotFive
  have hfourCap' : 4 ≤ S.oppCap2.card := by
    simpa only [← capByIndex_oppIndex2_eq_oppCap2] using hfourCap
  have hcap : S.oppCap2.card = 4 := by omega
  obtain ⟨radius, hradius, hfour⟩ :=
    exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
      (D.K4 S.oppApex2 (oppApex2_mem_A S))
  by_cases hfive : 5 ≤ (SelectedClass D.A S.oppApex2 radius).card
  · have hcenter := oppApex2_eq_oppositeVertex_oppIndex2 S
    have hbyIndex : (S.capByIndex S.oppIndex2).card = 4 := by
      simpa [capByIndex_oppIndex2_eq_oppCap2] using hcap
    have hle := oppositeVertex_selectedClass_card_le_four_of_cap_card_eq_four
      S D.convex S.oppIndex2 hbyIndex hradius
    rw [← hcenter] at hle
    omega
  · have hcard : (SelectedClass D.A S.oppApex2 radius).card = 4 := by omega
    rcases Finset.card_pos.mp (by omega : 0 <
        (SelectedClass D.A S.oppApex2 radius).card) with ⟨z, hzClass⟩
    have hzA : z ∈ D.A := (mem_selectedClass.mp hzClass).1
    obtain ⟨otherRadius, hotherPos, hfourErase⟩ :=
      exists_selectedClass_card_ge_of_hasNEquidistantPointsAt (B.survives z hzA)
    have hfourOther : 4 ≤ (SelectedClass D.A S.oppApex2 otherRadius).card := by
      rw [selectedClass_erase_eq] at hfourErase
      exact hfourErase.trans (Finset.card_le_card (Finset.erase_subset _ _))
    by_cases hsame : otherRadius = radius
    · subst otherRadius
      rw [selectedClass_erase_eq, Finset.card_erase_of_mem hzClass, hcard] at hfourErase
      omega
    · have hcenter := oppApex2_eq_oppositeVertex_oppIndex2 S
      have hlarge := oppositeVertex_distinct_K4_radii_force_cap_card_ge_six
        S D.convex S.oppIndex2 hotherPos hradius
        (by simpa only [← hcenter] using hfourOther)
        (by simpa only [← hcenter] using hfour) hsame
      have hlarge' : 6 ≤ S.oppCap2.card := by
        simpa only [capByIndex_oppIndex2_eq_oppCap2] using hlarge
      omega

/-- The bi-apex robust parent cannot occur below carrier cardinality thirteen. -/
theorem carrier_card_ge_thirteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F} (B : FrontierBiApexRobustResidual R) :
    13 ≤ D.A.card := by
  have hfirst := first_oppCap_card_ge_six R
  have hsecond := second_oppCap_card_ge_five B.secondApex_robust
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  all_goals
    simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hsum hsurplus hfirst hsecond
    omega

/-- The genuine small-second-cap residual left after the robust cap bounds.
It is intentionally distinct from the existing large-cap surface. -/
structure FrontierBiApexRobustExactFiveSecondCapResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : FrontierBiApexRobustResidual R) : Prop where
  firstOppCap_card_ge_six : 6 ≤ S.oppCap1.card
  secondOppCap_card_eq_five : S.oppCap2.card = 5

/-- On the exact-five second-cap branch, second-apex robustness produces the
unique ambient exact-five radius profile. This is a profile producer only: it
does not assert that the cap-six continuation is available. -/
theorem nonempty_largeCapUniqueFiveSecondApexRadius_of_exactFiveSecondCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F} {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B) :
    Nonempty (LargeCapUniqueFiveSecondApexRadius D S) := by
  obtain ⟨r, hr, hfour⟩ :=
    exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
      (D.K4 S.oppApex2 (oppApex2_mem_A S))
  have hcenter := oppApex2_eq_oppositeVertex_oppIndex2 S
  have hcapByIndex : (S.capByIndex S.oppIndex2).card = 5 := by
    simpa only [capByIndex_oppIndex2_eq_oppCap2] using Q.secondOppCap_card_eq_five
  have hle := oppositeVertex_selectedClass_card_le_five_of_cap_card_eq_five
    S D.convex S.oppIndex2 hcapByIndex hr
  rw [← hcenter] at hle
  have hcard : (SelectedClass D.A S.oppApex2 r).card = 5 := by
    by_contra hnotFive
    have hfourExact : (SelectedClass D.A S.oppApex2 r).card = 4 := by omega
    rcases Finset.card_pos.mp (by omega : 0 <
        (SelectedClass D.A S.oppApex2 r).card) with ⟨z, hzClass⟩
    have hzA : z ∈ D.A := (mem_selectedClass.mp hzClass).1
    obtain ⟨otherRadius, hotherPos, hfourErase⟩ :=
      exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
        (B.secondApex_robust.survives z hzA)
    have hfourOther : 4 ≤ (SelectedClass D.A S.oppApex2 otherRadius).card := by
      rw [selectedClass_erase_eq] at hfourErase
      exact hfourErase.trans (Finset.card_le_card (Finset.erase_subset _ _))
    by_cases hsame : otherRadius = r
    · subst otherRadius
      rw [selectedClass_erase_eq, Finset.card_erase_of_mem hzClass, hfourExact]
        at hfourErase
      omega
    · have hlarge := oppositeVertex_distinct_K4_radii_force_cap_card_ge_six
        S D.convex S.oppIndex2 hotherPos hr
        (by simpa only [← hcenter] using hfourOther)
        (by simpa only [← hcenter] using hfour) hsame
      have hlarge' : 6 ≤ S.oppCap2.card := by
        simpa only [capByIndex_oppIndex2_eq_oppCap2] using hlarge
      omega
  refine ⟨{
    radius := r
    radius_pos := hr
    class_card_eq_five := hcard
    unique_K4_radius := ?_ }⟩
  intro otherRadius hotherPos hfourOther
  by_contra hne
  have hlarge := oppositeVertex_distinct_K4_radii_force_cap_card_ge_six
    S D.convex S.oppIndex2 hotherPos hr
    (by simpa only [← hcenter] using hfourOther)
    (by simpa only [← hcenter] using hfour) hne
  have hlarge' : 6 ≤ S.oppCap2.card := by
    simpa only [capByIndex_oppIndex2_eq_oppCap2] using hlarge
  omega

/-- The robust parent enters either the existing two-large-cap surface or the
new exact-five second-cap residual. -/
theorem biApexRobust_exactFiveSecond_or_largeOppositeCaps
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F} (B : FrontierBiApexRobustResidual R) :
    Nonempty (FrontierBiApexRobustExactFiveSecondCapResidual B) ∨
      Nonempty (FrontierLargeOppositeCapsBiApexRobustResidual B) := by
  have hfirst := first_oppCap_card_ge_six R
  have hsecond := second_oppCap_card_ge_five B.secondApex_robust
  by_cases hsecondSix : 6 ≤ S.oppCap2.card
  · exact Or.inr ⟨⟨hfirst, hsecondSix⟩⟩
  · left
    exact ⟨⟨hfirst, by omega⟩⟩

end ATailBiApexRobustCapBounds
end Problem97
