/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FirstApexUniqueRadiusResidual
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Radius drop for the actual fresh-source blocker row

This module connects the source-side first-cap radius-drop theorem to the
canonical critical shell chosen for a fresh deletion source in the exact-five
physical continuation.  It covers precisely the double-hit branch: both
original strict-interior sources must lie on the fresh source's blocker row.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveDistinctPhysicalFreshRowRadiusDrop

open ATailDeletionRobustness
open ATailCriticalPairFrontier
open CapSelectedRowCounting
open FirstApexInteriorPairGeometry
open FirstApexUniqueRadiusResidual

/-- If the actual blocker row of a fresh carrier source contains both original
strict-interior sources, then its radius is strictly below the first-apex
radius. -/
theorem actualFreshBlocker_radius_lt_of_contains_interiorPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hqRow : R.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hwRow : R.interior.frontier.pair.w ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support) :
    (H.selectedAt fresh hfreshA).toCriticalFourShell.radius < radius := by
  let K := (H.selectedAt fresh hfreshA).toCriticalFourShell
  have hcenterA : H.centerAt fresh hfreshA ∈ D.A :=
    (Finset.mem_erase.mp K.center_mem).2
  have hcenterNe : H.centerAt fresh hfreshA ≠ S.oppApex1 :=
    R.firstApex_fullyDeletionRobust.centerAt_ne H fresh hfreshA
  have hqRadius :
      dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.q = K.radius :=
    K.support_eq_radius R.interior.frontier.pair.q hqRow
  have hwRadius :
      dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.w = K.radius :=
    K.support_eq_radius R.interior.frontier.pair.w hwRow
  have hdrop := bisectorCenter_radius_lt_of_selected_pair
    R.interior.q_mem_interior R.interior.w_mem_interior
    R.interior.frontier.pair.q_ne_w
    (le_of_lt R.interior.frontier.radius_pos)
    hcenterA hcenterNe (hqRadius.trans hwRadius.symm)
  simpa only [hqRadius] using hdrop

/-- The high-radius double-hit branch is contradictory. -/
theorem false_of_actualFreshBlocker_contains_interiorPair_of_radius_ge
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hqRow : R.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hwRow : R.interior.frontier.pair.w ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hrowGe : radius ≤
      (H.selectedAt fresh hfreshA).toCriticalFourShell.radius) :
    False := by
  exact (not_lt_of_ge hrowGe)
    (actualFreshBlocker_radius_lt_of_contains_interiorPair
      R hfreshA hqRow hwRow)

/-- In the surviving double-hit child, the actual fresh-source blocker lies
strictly inside the first cap and its exact row has precisely the two original
interior sources in that cap. -/
theorem actualFreshBlocker_doubleHit_sourceConsequences
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hqRow : R.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hwRow : R.interior.frontier.pair.w ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support) :
    H.centerAt fresh hfreshA ∈ S.capInteriorByIndex S.oppIndex1 ∧
      (H.selectedAt fresh hfreshA).toCriticalFourShell.radius < radius ∧
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {R.interior.frontier.pair.q, R.interior.frontier.pair.w} := by
  let K := (H.selectedAt fresh hfreshA).toCriticalFourShell
  have hcenterA : H.centerAt fresh hfreshA ∈ D.A :=
    (Finset.mem_erase.mp K.center_mem).2
  have hcenterNe : H.centerAt fresh hfreshA ≠ S.oppApex1 :=
    R.firstApex_fullyDeletionRobust.centerAt_ne H fresh hfreshA
  have hqRadius :
      dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.q = K.radius :=
    K.support_eq_radius R.interior.frontier.pair.q hqRow
  have hwRadius :
      dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.w = K.radius :=
    K.support_eq_radius R.interior.frontier.pair.w hwRow
  have hcenterInterior := bisectorCenter_mem_firstApexInterior
    R.interior.q_mem_interior R.interior.w_mem_interior
    R.interior.frontier.pair.q_ne_w hcenterA hcenterNe
    (hqRadius.trans hwRadius.symm)
  have hcenterCap : H.centerAt fresh hfreshA ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hcenterInterior
  have hcapCard :
      (K.support ∩ S.capByIndex S.oppIndex1).card ≤ 2 :=
    selectedFourClass_inter_capByIndex_card_le_two S D.convex S.oppIndex1
      K.toSelectedFourClass hcenterCap
  have hqCap : R.interior.frontier.pair.q ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      (Finset.mem_inter.mp R.interior.q_mem_interior).2
  have hwCap : R.interior.frontier.pair.w ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      (Finset.mem_inter.mp R.interior.w_mem_interior).2
  have hpairSubset :
      {R.interior.frontier.pair.q, R.interior.frontier.pair.w} ⊆
        K.support ∩ S.capByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hqRow, hqCap⟩
    · exact Finset.mem_inter.mpr ⟨hwRow, hwCap⟩
  have hpairCard :
      ({R.interior.frontier.pair.q,
          R.interior.frontier.pair.w} : Finset ℝ²).card = 2 := by
    simp [R.interior.frontier.pair.q_ne_w]
  have hpairEq :
      {R.interior.frontier.pair.q, R.interior.frontier.pair.w} =
        K.support ∩ S.capByIndex S.oppIndex1 :=
    Finset.eq_of_subset_of_card_le hpairSubset (by
      simpa only [hpairCard] using hcapCard)
  exact ⟨hcenterInterior,
    actualFreshBlocker_radius_lt_of_contains_interiorPair
      R hfreshA hqRow hwRow,
    hpairEq.symm⟩

end ExactFiveDistinctPhysicalFreshRowRadiusDrop
end Problem97
