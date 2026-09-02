/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFifteenApexProfile
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoRadiusExactTwelveProfile
import Erdos9796Proof.P97.SurplusM44Packet.ExactFourAdjacentDistribution

/-!
# Second-apex row census of the two-radius branch at carrier size twelve

Plan items L2 and L3 (Phase 2) of
`docs/plans/2026-09-01-dr-two-radius-branch-closure.md`.  The leaf theorem
is `false_of_exactFourPostCardElevenTwoRadiusBranch` in
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Closure`.  The
consumer of this module is the plan's Phase 3 valuation theorem P3.4, which
reads the `second_apex_rows` clause family of the exact-twelve structural
CNF (`census/card_head/dr_exact12_structural.py`) from the census proved
here: two disjoint full four-classes at `S.oppApex2`, each with two points in
the strict second-cap interior and one point in each adjacent closed cap.

Starting from the strict-interior profile `(3, 2, 4)` of
`exactTwelve_profile_of_twoRadiusBranch` (plan item L1):

* L2 `secondCapInterior_partition_of_twoRadiusBranch_exactTwelve`: the four
  points of the strict second-cap interior split `2 + 2` between the two
  radius classes at `S.oppApex2`, by
  `twoRichClassSlices_partition_of_capInterior_card_eq_four`;
* L3 `exactFourTwoRadiusAdjacentCapGrid_oppIndex2_of_twoRadiusBranch_exactTwelve`:
  the index-generic grid `SurplusCapPacket.exactFourTwoRadiusAdjacentCapGrid`
  at `S.oppIndex2`, so each class has exactly one point in each adjacent
  closed cap;
* `secondApexRow_census_of_twoRadiusBranch_exactTwelve`: for a row at either
  radius, two support points in `S.oppInterior2`, one in `S.surplusCap`, one
  in `S.oppCap1`, and `S.oppApex2` outside the support;
* `selectedFourClass_support_subset_oppInterior2_union_adjacentCaps`: the
  support of any selected four-class at `S.oppApex2` lies in
  `S.oppInterior2 ∪ S.surplusCap ∪ S.oppCap1`, from the packet cover lemma
  `SurplusCapPacket.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps`.

The no-five hypothesis of the leaf makes each row's support the whole radius
class (`selectedFourClass_support_eq_selectedClass_of_card_lt_five`); the
adjacent closed caps of the second opposite index are the surplus cap (left)
and the first opposite cap (right).
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailApexRichClassStructure
open ATailCapApexRadiusRigidity
open ATailCriticalPairFrontier
open ATailExactFifteenApexProfile
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

/-- The left-adjacent closed cap of the second opposite index is the surplus
cap. -/
private theorem leftAdjacentCapByIndex_oppIndex2_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftAdjacentCapByIndex S.oppIndex2 = S.surplusCap := by
  calc
    S.leftAdjacentCapByIndex S.oppIndex2 =
        S.leftAdjacentCapByIndex
          (SurplusCapPacket.rightAdjacentIndex S.surplusIdx) :=
      congrArg S.leftAdjacentCapByIndex
        S.oppIndex2_eq_rightAdjacentIndex_surplusIdx
    _ = S.capByIndex S.surplusIdx :=
      S.leftAdjacentCapByIndex_rightAdjacentIndex S.surplusIdx
    _ = S.surplusCap := capByIndex_surplusIdx_eq_surplusCap S

/-- The right-adjacent closed cap of the second opposite index is the first
opposite cap. -/
private theorem rightAdjacentCapByIndex_oppIndex2_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightAdjacentCapByIndex S.oppIndex2 = S.oppCap1 :=
  S.rightAdjacentCapByIndex_oppIndex2_eq_capByIndex_oppIndex1.trans
    (capByIndex_oppIndex1_eq_oppCap1 S)

/-- The support of a selected four-class lies in its full radius class. -/
private theorem selectedFourClass_support_subset_selectedClass
    {A : Finset ℝ²} {center : ℝ²} (K : SelectedFourClass A center) :
    K.support ⊆ SelectedClass A center K.radius := by
  intro x hx
  exact mem_selectedClass.mpr ⟨K.support_subset_A hx, K.support_eq_radius x hx⟩

/-- The full radius class of a selected four-class has at least four
points. -/
private theorem four_le_selectedClass_card_of_selectedFourClass
    {A : Finset ℝ²} {center : ℝ²} (K : SelectedFourClass A center) :
    4 ≤ (SelectedClass A center K.radius).card := by
  have h := Finset.card_le_card (selectedFourClass_support_subset_selectedClass K)
  rwa [K.support_card] at h

/-- When the full radius class of a selected four-class has fewer than five
points, the support is the whole class. -/
theorem selectedFourClass_support_eq_selectedClass_of_card_lt_five
    {A : Finset ℝ²} {center : ℝ²} (K : SelectedFourClass A center)
    (hlt : (SelectedClass A center K.radius).card < 5) :
    K.support = SelectedClass A center K.radius := by
  refine Finset.eq_of_subset_of_card_le
    (selectedFourClass_support_subset_selectedClass K) ?_
  rw [K.support_card]
  omega

/-- The support of a selected four-class at the second opposite apex is
covered by the strict second-cap interior and the two adjacent closed caps,
the surplus cap and the first opposite cap. -/
theorem selectedFourClass_support_subset_oppInterior2_union_adjacentCaps
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (row : SelectedFourClass A S.oppApex2) :
    row.support ⊆ S.oppInterior2 ∪ S.surplusCap ∪ S.oppCap1 := by
  have hcover :=
    S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps S.oppIndex2
      row.radius_pos
  rw [oppositeVertexByIndex_oppIndex2, leftAdjacentCapByIndex_oppIndex2_eq_surplusCap,
    rightAdjacentCapByIndex_oppIndex2_eq_oppCap1] at hcover
  intro x hx
  have hxClass := selectedFourClass_support_subset_selectedClass row hx
  by_cases hxI : x ∈ S.capInteriorByIndex S.oppIndex2
  · exact Finset.mem_union_left _ (Finset.mem_union_left _ hxI)
  · rcases Finset.mem_union.mp (hcover (Finset.mem_sdiff.mpr ⟨hxClass, hxI⟩)) with
      hleft | hright
    · exact Finset.mem_union_left _
        (Finset.mem_union_right _ (Finset.mem_inter.mp hleft).2)
    · exact Finset.mem_union_right _ (Finset.mem_inter.mp hright).2

/-- L2.  At carrier cardinality twelve the four points of the strict
second-cap interior split `2 + 2` between the two radius classes at
`S.oppApex2`: each slice has two points, the slices are disjoint, and they
cover the interior. -/
theorem secondCapInterior_partition_of_twoRadiusBranch_exactTwelve
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
    (SelectedClass D.A S.oppApex2 rho ∩ S.oppInterior2).card = 2 ∧
      (SelectedClass D.A S.oppApex2 otherRadius ∩ S.oppInterior2).card = 2 ∧
      Disjoint (SelectedClass D.A S.oppApex2 rho ∩ S.oppInterior2)
        (SelectedClass D.A S.oppApex2 otherRadius ∩ S.oppInterior2) ∧
      S.oppInterior2 =
        (SelectedClass D.A S.oppApex2 rho ∩ S.oppInterior2) ∪
          (SelectedClass D.A S.oppApex2 otherRadius ∩ S.oppInterior2) := by
  obtain ⟨-, -, hI2⟩ :=
    exactTwelve_profile_of_twoRadiusBranch R surface rho otherRadius
      firstRow secondRow hradii hfirstRadius hsecondRadius hcard12
  have hrho : 0 < rho := hfirstRadius ▸ firstRow.radius_pos
  have hother : 0 < otherRadius := hsecondRadius ▸ secondRow.radius_pos
  have hfour₁ :
      4 ≤ (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex2) rho).card := by
    rw [oppositeVertexByIndex_oppIndex2, ← hfirstRadius]
    exact four_le_selectedClass_card_of_selectedFourClass firstRow
  have hfour₂ :
      4 ≤ (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex2)
        otherRadius).card := by
    rw [oppositeVertexByIndex_oppIndex2, ← hsecondRadius]
    exact four_le_selectedClass_card_of_selectedFourClass secondRow
  have hinterior : (S.capInteriorByIndex S.oppIndex2).card = 4 := hI2
  have h :=
    twoRichClassSlices_partition_of_capInterior_card_eq_four S D.convex
      S.oppIndex2 hrho hother hradii.symm hfour₁ hfour₂ hinterior
  simpa only [oppositeVertexByIndex_oppIndex2, SurplusCapPacket.oppInterior2] using h

/-- L3.  At carrier cardinality twelve the two radius classes at `S.oppApex2`
form the index-generic two-by-two adjacent-cap grid at `S.oppIndex2`: each
class has exactly one point in each adjacent closed cap, and the two classes'
hits on each side are disjoint.  The no-five hypothesis pins both full
classes at exactly four points. -/
theorem exactFourTwoRadiusAdjacentCapGrid_oppIndex2_of_twoRadiusBranch_exactTwelve
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hcard12 : D.A.card = 12) :
    S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex2 rho otherRadius := by
  obtain ⟨hI₁, hI₂, -, -⟩ :=
    secondCapInterior_partition_of_twoRadiusBranch_exactTwelve R surface rho
      otherRadius firstRow secondRow hradii hfirstRadius hsecondRadius hcard12
  have hrho : 0 < rho := hfirstRadius ▸ firstRow.radius_pos
  have hother : 0 < otherRadius := hsecondRadius ▸ secondRow.radius_pos
  have hcard₁ : (SelectedClass D.A S.oppApex2 rho).card = 4 := by
    rw [← hfirstRadius,
      ← selectedFourClass_support_eq_selectedClass_of_card_lt_five firstRow
        (hnoFive _ firstRow.radius_pos)]
    exact firstRow.support_card
  have hcard₂ : (SelectedClass D.A S.oppApex2 otherRadius).card = 4 := by
    rw [← hsecondRadius,
      ← selectedFourClass_support_eq_selectedClass_of_card_lt_five secondRow
        (hnoFive _ secondRow.radius_pos)]
    exact secondRow.support_card
  refine S.exactFourTwoRadiusAdjacentCapGrid D.convex S.oppIndex2 hrho hother
    hradii.symm ?_ ?_ ?_ ?_
  · simpa only [oppositeVertexByIndex_oppIndex2] using hcard₁
  · simpa only [oppositeVertexByIndex_oppIndex2] using hcard₂
  · simpa only [oppositeVertexByIndex_oppIndex2, SurplusCapPacket.oppInterior2] using hI₁
  · simpa only [oppositeVertexByIndex_oppIndex2, SurplusCapPacket.oppInterior2] using hI₂

/-- Second-apex row census at carrier cardinality twelve.  A selected
four-class at `S.oppApex2` whose radius is one of the two branch radii has
two support points in the strict second-cap interior, one in the surplus cap,
one in the first opposite cap, and does not contain `S.oppApex2`. -/
theorem secondApexRow_census_of_twoRadiusBranch_exactTwelve
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hcard12 : D.A.card = 12)
    (row : SelectedFourClass D.A S.oppApex2)
    (hrow : row.radius = rho ∨ row.radius = otherRadius) :
    (row.support ∩ S.oppInterior2).card = 2 ∧
      (row.support ∩ S.surplusCap).card = 1 ∧
      (row.support ∩ S.oppCap1).card = 1 ∧
      S.oppApex2 ∉ row.support := by
  obtain ⟨hI₁, hI₂, -, -⟩ :=
    secondCapInterior_partition_of_twoRadiusBranch_exactTwelve R surface rho
      otherRadius firstRow secondRow hradii hfirstRadius hsecondRadius hcard12
  have G :=
    exactFourTwoRadiusAdjacentCapGrid_oppIndex2_of_twoRadiusBranch_exactTwelve
      R surface rho otherRadius firstRow secondRow hradii hnoFive hfirstRadius
      hsecondRadius hcard12
  have hrhoLeft := G.radius_left_card_eq_one
  have hrhoRight := G.radius_right_card_eq_one
  have hotherLeft := G.rho_left_card_eq_one
  have hotherRight := G.rho_right_card_eq_one
  rw [oppositeVertexByIndex_oppIndex2, leftAdjacentCapByIndex_oppIndex2_eq_surplusCap]
    at hrhoLeft hotherLeft
  rw [oppositeVertexByIndex_oppIndex2, rightAdjacentCapByIndex_oppIndex2_eq_oppCap1]
    at hrhoRight hotherRight
  have hsupport :=
    selectedFourClass_support_eq_selectedClass_of_card_lt_five row
      (hnoFive _ row.radius_pos)
  rw [hsupport]
  refine ⟨?_, ?_, ?_, ?_⟩
  · rcases hrow with h | h <;> rw [h]
    · exact hI₁
    · exact hI₂
  · rcases hrow with h | h <;> rw [h]
    · exact hrhoLeft
    · exact hotherLeft
  · rcases hrow with h | h <;> rw [h]
    · exact hrhoRight
    · exact hotherRight
  · rw [← hsupport]
    exact row.center_not_mem

end ATailFrontierLiveClosure
end Problem97
