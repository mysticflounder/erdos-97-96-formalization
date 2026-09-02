/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoRadiusExactTwelveProfile

/-!
# First-apex class census of the two-radius branch at carrier size twelve

Plan item L4 (Phase 2) of
`docs/plans/2026-09-01-dr-two-radius-branch-closure.md`.  The leaf theorem
is `false_of_exactFourPostCardElevenTwoRadiusBranch` in
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Closure`; the intended
consumer is the Phase 3 valuation theorem (plan item P3.4), which reads the
`first_apex_class` clause family of `census/card_head/dr_exact12_structural.py`
off this census.

From a subset of the leaf binders together with `D.A.card = 12`, the
exact-four unique-radius class `SelectedClass D.A S.oppApex1 radius` carried
by the residual `R` is pinned down cap by cap:

* it has exactly four points (`R.class_card_eq_four`);
* its strict first-cap slice is exactly the retained interior pair
  `{R.interior_q, R.interior_w}`, because the strict first-cap interior has
  exactly two points at carrier size twelve (plan item L1,
  `exactTwelve_profile_of_twoRadiusBranch`);
* it meets each adjacent closed cap (the closed surplus cap and the closed
  second opposite cap) in exactly one point: the class minus the strict
  first-cap interior is covered by the two adjacent closed caps
  (`SurplusCapPacket.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps`),
  each of which carries at most one class point
  (`SurplusCapPacket.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep`
  and its right-hand sibling), so `4 = 2 + 1 + 1`;
* the centre `S.oppApex1` is not a member of its own positive-radius class.

The radius uniqueness `R.unique_K4_radius` is restated separately in the
shape consumed by the valuation theorem.
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

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- At the first opposite cap index, the closed left-adjacent cap is the closed
second opposite cap. -/
private theorem leftAdjacentCapByIndex_oppIndex1_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftAdjacentCapByIndex S.oppIndex1 = S.oppCap2 := by
  rw [S.leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2,
    capByIndex_oppIndex2_eq_oppCap2]

/-- At the first opposite cap index, the closed right-adjacent cap is the closed
surplus cap. -/
private theorem rightAdjacentCapByIndex_oppIndex1_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightAdjacentCapByIndex S.oppIndex1 = S.surplusCap := by
  rw [← capByIndex_surplusIdx_eq_surplusCap]
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.rightAdjacentCapByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.capByIndex, hi]

/-- Census of the exact-four unique-radius class at the first opposite apex in
the two-radius branch at carrier cardinality twelve: four points, the strict
first-cap slice is exactly the retained interior pair, one point in the closed
surplus cap, one point in the closed second opposite cap, and the centre is
not a member. -/
theorem firstApexClass_census_of_twoRadiusBranch_exactTwelve
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
    (SelectedClass D.A S.oppApex1 radius).card = 4 ∧
      SelectedClass D.A S.oppApex1 radius ∩ S.oppInterior1 =
        {R.interior_q, R.interior_w} ∧
      (SelectedClass D.A S.oppApex1 radius ∩ S.surplusCap).card = 1 ∧
      (SelectedClass D.A S.oppApex1 radius ∩ S.oppCap2).card = 1 ∧
      S.oppApex1 ∉ SelectedClass D.A S.oppApex1 radius := by
  classical
  obtain ⟨-, hI1, -⟩ :=
    exactTwelve_profile_of_twoRadiusBranch R surface rho otherRadius
      firstRow secondRow hradii hfirstRadius hsecondRadius hcard12
  have hradius : 0 < radius := F.radius_pos
  have hcardT : (SelectedClass D.A S.oppApex1 radius).card = 4 :=
    R.class_card_eq_four
  -- The strict first-cap slice is exactly the retained interior pair.
  have hpair_sub : ({R.interior_q, R.interior_w} : Finset ℝ²) ⊆
      SelectedClass D.A S.oppApex1 radius ∩ S.oppInterior1 := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact R.interior_q_mem
    · rw [Finset.mem_singleton] at hx
      subst hx
      exact R.interior_w_mem
  have hpair_card : ({R.interior_q, R.interior_w} : Finset ℝ²).card = 2 :=
    Finset.card_pair R.interior_q_ne_w
  have hslice_le :
      (SelectedClass D.A S.oppApex1 radius ∩ S.oppInterior1).card ≤ 2 := by
    have h := Finset.card_le_card
      (Finset.inter_subset_right :
        SelectedClass D.A S.oppApex1 radius ∩ S.oppInterior1 ⊆ S.oppInterior1)
    omega
  have hslice_eq :
      SelectedClass D.A S.oppApex1 radius ∩ S.oppInterior1 =
        {R.interior_q, R.interior_w} :=
    (Finset.eq_of_subset_of_card_le hpair_sub (by omega)).symm
  have hslice_card :
      (SelectedClass D.A S.oppApex1 radius ∩ S.oppInterior1).card = 2 := by
    rw [hslice_eq, hpair_card]
  -- The two remaining class points lie in the adjacent closed caps.
  have hsplit := Finset.card_sdiff_add_card_inter
    (SelectedClass D.A S.oppApex1 radius) S.oppInterior1
  have houtside :
      (SelectedClass D.A S.oppApex1 radius \ S.oppInterior1).card = 2 := by
    omega
  have hcenter : S.oppositeVertexByIndex S.oppIndex1 = S.oppApex1 :=
    oppositeVertexByIndex_oppIndex1 S
  have hleft :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.leftAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
    have h := S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex S.oppIndex1 radius
    rwa [hcenter] at h
  have hright :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.rightAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
    have h := S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex S.oppIndex1 radius
    rwa [hcenter] at h
  have hcover :
      SelectedClass D.A S.oppApex1 radius \ S.oppInterior1 ⊆
        (SelectedClass D.A S.oppApex1 radius ∩
          S.leftAdjacentCapByIndex S.oppIndex1) ∪
        (SelectedClass D.A S.oppApex1 radius ∩
          S.rightAdjacentCapByIndex S.oppIndex1) := by
    have h := S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
      S.oppIndex1 hradius
    rw [hcenter] at h
    exact h
  have hsum :
      2 ≤ (SelectedClass D.A S.oppApex1 radius ∩
          S.leftAdjacentCapByIndex S.oppIndex1).card +
        (SelectedClass D.A S.oppApex1 radius ∩
          S.rightAdjacentCapByIndex S.oppIndex1).card := by
    calc
      2 = (SelectedClass D.A S.oppApex1 radius \ S.oppInterior1).card :=
        houtside.symm
      _ ≤ _ := Finset.card_le_card hcover
      _ ≤ _ := Finset.card_union_le _ _
  have hleftEq :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.leftAdjacentCapByIndex S.oppIndex1).card = 1 := by omega
  have hrightEq :
      (SelectedClass D.A S.oppApex1 radius ∩
        S.rightAdjacentCapByIndex S.oppIndex1).card = 1 := by omega
  rw [leftAdjacentCapByIndex_oppIndex1_eq_oppCap2] at hleftEq
  rw [rightAdjacentCapByIndex_oppIndex1_eq_surplusCap] at hrightEq
  -- The centre is not in its own positive-radius class.
  have hcenter_not : S.oppApex1 ∉ SelectedClass D.A S.oppApex1 radius := by
    intro h
    have hd := (mem_selectedClass.mp h).2
    rw [dist_self] at hd
    linarith
  exact ⟨hcardT, hslice_eq, hrightEq, hleftEq, hcenter_not⟩

/-- Radius uniqueness of the first-apex four-class, restated from the
residual field `R.unique_K4_radius` in the shape consumed by the valuation
theorem: every positive radius whose class at `S.oppApex1` has exactly four
points is the retained radius. -/
theorem firstApexClass_radius_unique_of_twoRadiusBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F) :
    ∀ r : ℝ, 0 < r → (SelectedClass D.A S.oppApex1 r).card = 4 → r = radius :=
  fun r hr hfour ↦ R.unique_K4_radius r hr hfour.ge

end ATailFrontierLiveClosure
end Problem97
