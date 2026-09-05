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

/-- A carrier point outside the first opposite cap belongs to one of the two
other indexed caps. -/
theorem mem_surplusOrSecondCap_of_mem_not_firstCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hxA : x ∈ A) (hxNotFirst : x ∉ S.capByIndex S.oppIndex1) :
    x ∈ S.capByIndex S.surplusIdx ∨
      x ∈ S.capByIndex S.oppIndex2 := by
  rcases S.exists_mem_capByIndex_of_mem hxA with ⟨i, hi⟩
  rcases S.index_eq_surplusIdx_or_oppIndex1_or_oppIndex2 i with
    hiSurplus | hiFirst | hiSecond
  · subst i
    exact Or.inl hi
  · subst i
    exact False.elim (hxNotFirst hi)
  · subst i
    exact Or.inr hi

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

/-- Once the fresh source is known to be absent from the original first-apex
row, the surviving double-hit child has a named two-inside/two-outside
support.  The fresh source and the fourth point are both outside the first
cap. -/
theorem actualFreshBlocker_doubleHit_twoOutside
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hfreshNotFirst : fresh ∉ SelectedClass D.A S.oppApex1 radius)
    (hqRow : R.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hwRow : R.interior.frontier.pair.w ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support) :
    ∃ t : ℝ²,
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support =
        {R.interior.frontier.pair.q, R.interior.frontier.pair.w, fresh, t} ∧
      ({R.interior.frontier.pair.q, R.interior.frontier.pair.w,
          fresh, t} : Finset ℝ²).card = 4 ∧
      fresh ∉ S.capByIndex S.oppIndex1 ∧
      t ∉ S.capByIndex S.oppIndex1 ∧
      (H.selectedAt fresh hfreshA).toCriticalFourShell.radius < radius := by
  let K := (H.selectedAt fresh hfreshA).toCriticalFourShell
  have hfreshRow : fresh ∈ K.support := K.q_mem_support
  have hqFirst :
      R.interior.frontier.pair.q ∈
        SelectedClass D.A S.oppApex1 radius :=
    (Finset.mem_inter.mp R.interior.q_mem_interior).1
  have hwFirst :
      R.interior.frontier.pair.w ∈
        SelectedClass D.A S.oppApex1 radius :=
    (Finset.mem_inter.mp R.interior.w_mem_interior).1
  have hfreshNeQ : fresh ≠ R.interior.frontier.pair.q := by
    intro h
    apply hfreshNotFirst
    simpa [h] using hqFirst
  have hfreshNeW : fresh ≠ R.interior.frontier.pair.w := by
    intro h
    apply hfreshNotFirst
    simpa [h] using hwFirst
  have htripleCard :
      ({R.interior.frontier.pair.q, R.interior.frontier.pair.w,
          fresh} : Finset ℝ²).card = 3 := by
    rw [Finset.card_eq_three]
    exact ⟨R.interior.frontier.pair.q,
      R.interior.frontier.pair.w, fresh,
      R.interior.frontier.pair.q_ne_w,
      hfreshNeQ.symm, hfreshNeW.symm, rfl⟩
  have hextra :
      ∃ t ∈ K.support,
        t ∉ ({R.interior.frontier.pair.q,
          R.interior.frontier.pair.w, fresh} : Finset ℝ²) := by
    by_contra h
    have hsubset :
        K.support ⊆
          ({R.interior.frontier.pair.q,
            R.interior.frontier.pair.w, fresh} : Finset ℝ²) := by
      intro z hz
      by_contra hzNot
      exact h ⟨z, hz, hzNot⟩
    have hcardLe := Finset.card_le_card hsubset
    rw [K.support_card, htripleCard] at hcardLe
    omega
  rcases hextra with ⟨t, htRow, htNotTriple⟩
  have htNeQ : t ≠ R.interior.frontier.pair.q := by
    intro h
    apply htNotTriple
    simp [h]
  have htNeW : t ≠ R.interior.frontier.pair.w := by
    intro h
    apply htNotTriple
    simp [h]
  have htNeFresh : t ≠ fresh := by
    intro h
    apply htNotTriple
    simp [h]
  have hnamedCard :
      ({R.interior.frontier.pair.q, R.interior.frontier.pair.w,
          fresh, t} : Finset ℝ²).card = 4 := by
    rw [Finset.card_eq_four]
    exact ⟨R.interior.frontier.pair.q,
      R.interior.frontier.pair.w, fresh, t,
      R.interior.frontier.pair.q_ne_w,
      hfreshNeQ.symm, htNeQ.symm,
      hfreshNeW.symm, htNeW.symm, htNeFresh.symm, rfl⟩
  have hnamedSubset :
      ({R.interior.frontier.pair.q, R.interior.frontier.pair.w,
          fresh, t} : Finset ℝ²) ⊆ K.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl
    · exact hqRow
    · exact hwRow
    · exact hfreshRow
    · exact htRow
  have hnamedEq :
      ({R.interior.frontier.pair.q, R.interior.frontier.pair.w,
          fresh, t} : Finset ℝ²) = K.support :=
    Finset.eq_of_subset_of_card_le hnamedSubset (by
      rw [hnamedCard, K.support_card])
  rcases actualFreshBlocker_doubleHit_sourceConsequences
      R hfreshA hqRow hwRow with ⟨_, hdrop, hcapEq⟩
  have hfreshOutside : fresh ∉ S.capByIndex S.oppIndex1 := by
    intro hfreshCap
    have hfreshPair :
        fresh ∈ ({R.interior.frontier.pair.q,
          R.interior.frontier.pair.w} : Finset ℝ²) := by
      rw [← hcapEq]
      exact Finset.mem_inter.mpr ⟨hfreshRow, hfreshCap⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hfreshPair
    exact hfreshPair.elim hfreshNeQ hfreshNeW
  have htOutside : t ∉ S.capByIndex S.oppIndex1 := by
    intro htCap
    have htPair :
        t ∈ ({R.interior.frontier.pair.q,
          R.interior.frontier.pair.w} : Finset ℝ²) := by
      rw [← hcapEq]
      exact Finset.mem_inter.mpr ⟨htRow, htCap⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at htPair
    exact htPair.elim htNeQ htNeW
  exact ⟨t, hnamedEq.symm, hnamedCard, hfreshOutside, htOutside, hdrop⟩

/-- The actual fresh-source row either omits one of the two original interior
sources, or it has the fully named two-inside/two-outside form. -/
theorem actualFreshBlocker_omission_or_twoOutside
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hfreshNotFirst : fresh ∉ SelectedClass D.A S.oppApex1 radius) :
    R.interior.frontier.pair.q ∉
        (H.selectedAt fresh hfreshA).toCriticalFourShell.support ∨
      R.interior.frontier.pair.w ∉
        (H.selectedAt fresh hfreshA).toCriticalFourShell.support ∨
      ∃ t : ℝ²,
        (H.selectedAt fresh hfreshA).toCriticalFourShell.support =
          {R.interior.frontier.pair.q, R.interior.frontier.pair.w, fresh, t} ∧
        ({R.interior.frontier.pair.q, R.interior.frontier.pair.w,
            fresh, t} : Finset ℝ²).card = 4 ∧
        fresh ∉ S.capByIndex S.oppIndex1 ∧
        t ∉ S.capByIndex S.oppIndex1 ∧
        (H.selectedAt fresh hfreshA).toCriticalFourShell.radius < radius := by
  by_cases hqRow : R.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support
  · by_cases hwRow : R.interior.frontier.pair.w ∈
        (H.selectedAt fresh hfreshA).toCriticalFourShell.support
    · exact Or.inr (Or.inr
        (actualFreshBlocker_doubleHit_twoOutside
          R hfreshA hfreshNotFirst hqRow hwRow))
    · exact Or.inr (Or.inl hwRow)
  · exact Or.inl hqRow

/-- The two exterior points in the double-hit row both land in the union of
the surplus cap and the second opposite cap. -/
theorem actualFreshBlocker_doubleHit_otherCapPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hfreshNotFirst : fresh ∉ SelectedClass D.A S.oppApex1 radius)
    (hqRow : R.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hwRow : R.interior.frontier.pair.w ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support) :
    ∃ t : ℝ²,
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support =
        {R.interior.frontier.pair.q, R.interior.frontier.pair.w, fresh, t} ∧
      (fresh ∈ S.capByIndex S.surplusIdx ∨
        fresh ∈ S.capByIndex S.oppIndex2) ∧
      (t ∈ S.capByIndex S.surplusIdx ∨
        t ∈ S.capByIndex S.oppIndex2) ∧
      (H.selectedAt fresh hfreshA).toCriticalFourShell.radius < radius := by
  let K := (H.selectedAt fresh hfreshA).toCriticalFourShell
  rcases actualFreshBlocker_doubleHit_twoOutside
      R hfreshA hfreshNotFirst hqRow hwRow with
    ⟨t, hsupport, _hcard, hfreshOutside, htOutside, hdrop⟩
  have htRow : t ∈ K.support := by
    rw [hsupport]
    simp
  have htA : t ∈ D.A := K.support_subset_A htRow
  exact ⟨t, hsupport,
    mem_surplusOrSecondCap_of_mem_not_firstCap S hfreshA hfreshOutside,
    mem_surplusOrSecondCap_of_mem_not_firstCap S htA htOutside,
    hdrop⟩

end ExactFiveDistinctPhysicalFreshRowRadiusDrop
end Problem97
