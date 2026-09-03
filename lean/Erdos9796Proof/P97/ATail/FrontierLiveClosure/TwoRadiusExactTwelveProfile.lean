/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ApexRichClassStructure
import Erdos9796Proof.P97.ATail.CapApexRadiusRigidity
import Erdos9796Proof.P97.ATail.ExactFourRobustCapExpansion

/-!
# Exact-twelve cap profile of the two-radius branch

Plan item L1 (Phase 2, Section 4 "Exact-12 rigidity") of
`docs/plans/2026-09-01-dr-two-radius-branch-closure.md`.  The leaf theorem
is `false_of_exactFourPostCardElevenTwoRadiusBranch` in
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Closure`; this module
takes a subset of its binders together with `D.A.card = 12` and pins the
closed-cap profile `(surplus, opp1, opp2) = (5, 4, 6)` and the
strict-interior profile `(3, 2, 4)`.

Ingredients: the three-cap sum identity `SurplusCapPacket.capSum`, the
surplus bound `SurplusCapPacket.surplus_card_gt_four`, the first opposite cap
lower bound carried by `ExactFourPostCardElevenRobustSurface`, the
closed-cap/strict-interior relation `capInteriorByIndex_card_add_two`, and
the strict-interior hit count
`SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_card_sub_two`
applied to the two exact rows.  The rows' radius classes are disjoint because
the radii differ, so the strict second-cap interior receives at least four
points; the cap sum then leaves no slack.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailApexRichClassStructure
open ATailCapApexRadiusRigidity
open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

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

/-- The full radius class of a selected four-class at the second opposite
apex places at least two points in the strict second-cap interior. -/
private theorem two_le_selectedClass_inter_secondCapInterior_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (K : SelectedFourClass D.A S.oppApex2) :
    2 ≤ (SelectedClass D.A S.oppApex2 K.radius ∩
      S.capInteriorByIndex S.oppIndex2).card := by
  classical
  have hsub : K.support ⊆ SelectedClass D.A S.oppApex2 K.radius := by
    intro x hx
    exact mem_selectedClass.mpr ⟨K.support_subset_A hx, K.support_eq_radius x hx⟩
  have hfour : 4 ≤ (SelectedClass D.A S.oppApex2 K.radius).card := by
    have h := Finset.card_le_card hsub
    rwa [K.support_card] at h
  have h :=
    S.selectedClass_capInteriorByIndex_card_ge_card_sub_two D.convex S.oppIndex2
      K.radius_pos
  rw [oppositeVertexByIndex_oppIndex2] at h
  omega

/-- Two selected four-classes at the second opposite apex with distinct radii
place at least four points in the strict second-cap interior. -/
theorem four_le_oppInterior2_card_of_twoRadiusRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius) :
    4 ≤ S.oppInterior2.card := by
  classical
  have h1 := two_le_selectedClass_inter_secondCapInterior_card firstRow
  have h2 := two_le_selectedClass_inter_secondCapInterior_card secondRow
  rw [hfirstRadius] at h1
  rw [hsecondRadius] at h2
  have hdisj : Disjoint
      (SelectedClass D.A S.oppApex2 rho ∩ S.capInteriorByIndex S.oppIndex2)
      (SelectedClass D.A S.oppApex2 otherRadius ∩
        S.capInteriorByIndex S.oppIndex2) := by
    rw [Finset.disjoint_left]
    intro x hx1 hx2
    have hd1 := (mem_selectedClass.mp (Finset.mem_inter.mp hx1).1).2
    have hd2 := (mem_selectedClass.mp (Finset.mem_inter.mp hx2).1).2
    exact hradii (hd2.symm.trans hd1)
  have hsub :
      (SelectedClass D.A S.oppApex2 rho ∩ S.capInteriorByIndex S.oppIndex2) ∪
        (SelectedClass D.A S.oppApex2 otherRadius ∩
          S.capInteriorByIndex S.oppIndex2) ⊆
        S.capInteriorByIndex S.oppIndex2 :=
    Finset.union_subset Finset.inter_subset_right Finset.inter_subset_right
  have hcard := Finset.card_le_card hsub
  rw [Finset.card_union_of_disjoint hdisj] at hcard
  unfold SurplusCapPacket.oppInterior2
  omega

/-- Closed-cap profile of the two-radius branch at carrier cardinality
twelve: `(surplus, opp1, opp2) = (5, 4, 6)`. -/
theorem exactTwelve_capProfile_of_twoRadiusBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hcard12 : D.A.card = 12) :
    S.surplusCap.card = 5 ∧ S.oppCap1.card = 4 ∧ S.oppCap2.card = 6 := by
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hopp1 := surface.firstOppCap_card_ge_four
  have hI2 := capInteriorByIndex_card_add_two S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2] at hI2
  have hfour :=
    four_le_oppInterior2_card_of_twoRadiusRows rho otherRadius firstRow secondRow
      hradii hfirstRadius hsecondRadius
  unfold SurplusCapPacket.oppInterior2 at hfour
  exact ⟨by omega, by omega, by omega⟩

/-- The three closed-cap profiles compatible with the two-radius branch at
carrier cardinality thirteen.  After removing the two endpoint vertices from
each closed cap, these are the strict-interior profiles `(3, 2, 5)`,
`(4, 2, 4)`, and `(3, 3, 4)` used by the card-thirteen arm encoder. -/
inductive ExactThirteenTwoRadiusCapProfile
    {D : CounterexampleData} (S : SurplusCapPacket D.A) : Prop
  | secondOpposite
      (surplusCap_card_eq_five : S.surplusCap.card = 5)
      (firstOppCap_card_eq_four : S.oppCap1.card = 4)
      (secondOppCap_card_eq_seven : S.oppCap2.card = 7)
  | surplus
      (surplusCap_card_eq_six : S.surplusCap.card = 6)
      (firstOppCap_card_eq_four : S.oppCap1.card = 4)
      (secondOppCap_card_eq_six : S.oppCap2.card = 6)
  | firstOpposite
      (surplusCap_card_eq_five : S.surplusCap.card = 5)
      (firstOppCap_card_eq_five : S.oppCap1.card = 5)
      (secondOppCap_card_eq_six : S.oppCap2.card = 6)

/-- At carrier cardinality thirteen, the cap sum and the two disjoint-radius
rows leave exactly the three profiles represented by
`ExactThirteenTwoRadiusCapProfile`. -/
theorem exactThirteen_capProfile_of_twoRadiusBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hcard13 : D.A.card = 13) :
    ExactThirteenTwoRadiusCapProfile S := by
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hopp1 := surface.firstOppCap_card_ge_four
  have hI2 := capInteriorByIndex_card_add_two S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2] at hI2
  have hfour :=
    four_le_oppInterior2_card_of_twoRadiusRows rho otherRadius firstRow secondRow
      hradii hfirstRadius hsecondRadius
  unfold SurplusCapPacket.oppInterior2 at hfour
  have hprofiles :
      (S.surplusCap.card = 5 ∧ S.oppCap1.card = 4 ∧
        S.oppCap2.card = 7) ∨
      (S.surplusCap.card = 6 ∧ S.oppCap1.card = 4 ∧
        S.oppCap2.card = 6) ∨
      (S.surplusCap.card = 5 ∧ S.oppCap1.card = 5 ∧
        S.oppCap2.card = 6) := by
    omega
  rcases hprofiles with h | h | h
  · exact .secondOpposite h.1 h.2.1 h.2.2
  · exact .surplus h.1 h.2.1 h.2.2
  · exact .firstOpposite h.1 h.2.1 h.2.2

/-- Strict-interior form of the card-thirteen two-radius profile.  The three
closed-cap alternatives above become the profiles `(3, 2, 5)`, `(4, 2, 4)`,
and `(3, 3, 4)` after deleting the two endpoints of each cap. -/
theorem exactThirteen_profile_of_twoRadiusBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hcard13 : D.A.card = 13) :
    ((S.capInteriorByIndex S.surplusIdx).card = 3 ∧
        S.oppInterior1.card = 2 ∧ S.oppInterior2.card = 5) ∨
      ((S.capInteriorByIndex S.surplusIdx).card = 4 ∧
        S.oppInterior1.card = 2 ∧ S.oppInterior2.card = 4) ∨
      ((S.capInteriorByIndex S.surplusIdx).card = 3 ∧
        S.oppInterior1.card = 3 ∧ S.oppInterior2.card = 4) := by
  obtain hprofile := exactThirteen_capProfile_of_twoRadiusBranch R surface rho otherRadius
    firstRow secondRow hradii hfirstRadius hsecondRadius hcard13
  have hIS := capInteriorByIndex_card_add_two S S.surplusIdx
  have hI1 := capInteriorByIndex_card_add_two S S.oppIndex1
  have hI2 := capInteriorByIndex_card_add_two S S.oppIndex2
  rw [capByIndex_surplusIdx_eq_surplusCap] at hIS
  rw [capByIndex_oppIndex1_eq_oppCap1] at hI1
  rw [capByIndex_oppIndex2_eq_oppCap2] at hI2
  unfold SurplusCapPacket.oppInterior1 SurplusCapPacket.oppInterior2
  rcases hprofile with h | h | h
  · left
    exact ⟨by omega, by omega, by omega⟩
  · right
    left
    exact ⟨by omega, by omega, by omega⟩
  · right
    right
    exact ⟨by omega, by omega, by omega⟩

/-- The six closed-cap profiles compatible with the two-radius branch at
carrier cardinality fourteen.  Constructor names match the diagnostic
encoder profiles in `p97-dr-two-radius-card14-profile-probe-v1.md`. -/
inductive ExactFourteenTwoRadiusCapProfile
    {D : CounterexampleData} (S : SurplusCapPacket D.A) : Prop
  | secondOpposite
      (surplusCap_card_eq_five : S.surplusCap.card = 5)
      (firstOppCap_card_eq_four : S.oppCap1.card = 4)
      (secondOppCap_card_eq_eight : S.oppCap2.card = 8)
  | surplusS6O1Four
      (surplusCap_card_eq_six : S.surplusCap.card = 6)
      (firstOppCap_card_eq_four : S.oppCap1.card = 4)
      (secondOppCap_card_eq_seven : S.oppCap2.card = 7)
  | surplusS6O1Five
      (surplusCap_card_eq_six : S.surplusCap.card = 6)
      (firstOppCap_card_eq_five : S.oppCap1.card = 5)
      (secondOppCap_card_eq_six : S.oppCap2.card = 6)
  | surplusS7
      (surplusCap_card_eq_seven : S.surplusCap.card = 7)
      (firstOppCap_card_eq_four : S.oppCap1.card = 4)
      (secondOppCap_card_eq_six : S.oppCap2.card = 6)
  | firstOppositeO1Five
      (surplusCap_card_eq_five : S.surplusCap.card = 5)
      (firstOppCap_card_eq_five : S.oppCap1.card = 5)
      (secondOppCap_card_eq_seven : S.oppCap2.card = 7)
  | firstOppositeO1Six
      (surplusCap_card_eq_five : S.surplusCap.card = 5)
      (firstOppCap_card_eq_six : S.oppCap1.card = 6)
      (secondOppCap_card_eq_six : S.oppCap2.card = 6)

/-- At carrier cardinality fourteen, the cap sum and the two disjoint-radius
rows leave exactly the six profiles represented by
`ExactFourteenTwoRadiusCapProfile`. -/
theorem exactFourteen_capProfile_of_twoRadiusBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hcard14 : D.A.card = 14) :
    ExactFourteenTwoRadiusCapProfile S := by
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hopp1 := surface.firstOppCap_card_ge_four
  have hI2 := capInteriorByIndex_card_add_two S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2] at hI2
  have hfour :=
    four_le_oppInterior2_card_of_twoRadiusRows rho otherRadius firstRow secondRow
      hradii hfirstRadius hsecondRadius
  unfold SurplusCapPacket.oppInterior2 at hfour
  have hprofiles :
      (S.surplusCap.card = 5 ∧ S.oppCap1.card = 4 ∧
        S.oppCap2.card = 8) ∨
      (S.surplusCap.card = 6 ∧ S.oppCap1.card = 4 ∧
        S.oppCap2.card = 7) ∨
      (S.surplusCap.card = 6 ∧ S.oppCap1.card = 5 ∧
        S.oppCap2.card = 6) ∨
      (S.surplusCap.card = 7 ∧ S.oppCap1.card = 4 ∧
        S.oppCap2.card = 6) ∨
      (S.surplusCap.card = 5 ∧ S.oppCap1.card = 5 ∧
        S.oppCap2.card = 7) ∨
      (S.surplusCap.card = 5 ∧ S.oppCap1.card = 6 ∧
        S.oppCap2.card = 6) := by
    omega
  rcases hprofiles with h | h | h | h | h | h
  · exact .secondOpposite h.1 h.2.1 h.2.2
  · exact .surplusS6O1Four h.1 h.2.1 h.2.2
  · exact .surplusS6O1Five h.1 h.2.1 h.2.2
  · exact .surplusS7 h.1 h.2.1 h.2.2
  · exact .firstOppositeO1Five h.1 h.2.1 h.2.2
  · exact .firstOppositeO1Six h.1 h.2.1 h.2.2

/-- Strict-interior profile of the two-radius branch at carrier cardinality
twelve: the surplus cap has three strict interior points, the first opposite
cap two, and the second opposite cap four. -/
theorem exactTwelve_profile_of_twoRadiusBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hcard12 : D.A.card = 12) :
    (S.capInteriorByIndex S.surplusIdx).card = 3 ∧
      S.oppInterior1.card = 2 ∧ S.oppInterior2.card = 4 := by
  obtain ⟨hS, h1, h2⟩ :=
    exactTwelve_capProfile_of_twoRadiusBranch R surface rho otherRadius
      firstRow secondRow hradii hfirstRadius hsecondRadius hcard12
  have hIS := capInteriorByIndex_card_add_two S S.surplusIdx
  have hI1 := capInteriorByIndex_card_add_two S S.oppIndex1
  have hI2 := capInteriorByIndex_card_add_two S S.oppIndex2
  rw [capByIndex_surplusIdx_eq_surplusCap] at hIS
  rw [capByIndex_oppIndex1_eq_oppCap1] at hI1
  rw [capByIndex_oppIndex2_eq_oppCap2] at hI2
  unfold SurplusCapPacket.oppInterior1 SurplusCapPacket.oppInterior2
  exact ⟨by omega, by omega, by omega⟩

/-- At carrier cardinality twelve the two-radius branch realizes the
`secondOpposite` cap-growth profile, and the cap data of the other two
growth arms is inconsistent. -/
theorem exactTwelve_secondOppositeCapGrowth_of_twoRadiusBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hcard12 : D.A.card = 12) :
    ExactFourSecondOppositeCapGrowth S ∧
      ¬ 6 ≤ S.surplusCap.card ∧ ¬ ExactFourFirstOppositeCapGrowth S := by
  obtain ⟨hS, h1, h2⟩ :=
    exactTwelve_capProfile_of_twoRadiusBranch R surface rho otherRadius
      firstRow secondRow hradii hfirstRadius hsecondRadius hcard12
  refine ⟨⟨hS, h1, by omega, by omega⟩, by omega, ?_⟩
  intro hfirst
  have hfive := hfirst.firstOppCap_card_ge_five
  omega

end ATailFrontierLiveClosure
end Problem97
