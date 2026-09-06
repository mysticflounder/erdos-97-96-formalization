/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ApexTripleEquidistance
import Erdos9796Proof.P97.ATail.BiApexRobustCapBounds
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueRowProducer.card_five_interior_survivor_pair
import Erdos9796Proof.P97.ATail.FirstApexUniqueRadiusResidual
import Erdos9796Proof.P97.ATail.FirstApexInteriorPairCirclePower
import Erdos9796Proof.P97.ATail.MinimalAdmissibleInteriorPair
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
open ATailApexTripleEquidistance
open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailCapApexRadiusRigidity
open CapSelectedRowCounting
open FirstApexInteriorPairGeometry
open FirstApexInteriorPairCirclePower
open FirstApexUniqueRadiusResidual

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

/-- An exact-five first-apex class puts at least five points in the first
physical opposite cap. -/
theorem firstOppCap_card_ge_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    5 ≤ S.oppCap1.card := by
  have hinterior :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card :=
    ATailUniqueRowProducerScratch.firstApex_cardFive_interior_card_ge_three
      D S R.interior.frontier.radius_pos R.class_card_eq_five
  have hinteriorCap : 3 ≤ (S.capInteriorByIndex S.oppIndex1).card :=
    hinterior.trans (Finset.card_le_card Finset.inter_subset_right)
  have hcap :=
    capInteriorByIndex_card_add_two S S.oppIndex1
  have hcapByIndex : 5 ≤ (S.capByIndex S.oppIndex1).card := by omega
  simpa only [capByIndex_oppIndex1_eq_oppCap1] using hcapByIndex

/-- Any selected four-class centered at a carrier point omits at least one
vertex of the packet's supporting Moser triangle. -/
theorem selectedFourClass_exists_supportTriangle_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {center : ℝ²} (hcenterA : center ∈ D.A)
    (K : SelectedFourClass D.A center) :
    ∃ v : ℝ², v ∈ S.triangle.verts ∧ v ∉ K.support := by
  by_cases h1 : S.triangle.v1 ∈ K.support
  · by_cases h2 : S.triangle.v2 ∈ K.support
    · by_cases h3 : S.triangle.v3 ∈ K.support
      · exact False.elim
          (not_equidistant_from_three_apices S D.convex hcenterA
            K.radius_pos
            (K.support_eq_radius S.triangle.v1 h1)
            (K.support_eq_radius S.triangle.v2 h2)
            (K.support_eq_radius S.triangle.v3 h3))
      · exact ⟨S.triangle.v3, by
          classical
          simp [MoserTriangle.verts], h3⟩
    · exact ⟨S.triangle.v2, by
        classical
        simp [MoserTriangle.verts], h2⟩
  · exact ⟨S.triangle.v1, by
      classical
      simp [MoserTriangle.verts], h1⟩

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

/-- Every exterior point of the actual fresh-source double-hit row lies
strictly inside the original first-apex circle. -/
theorem actualFreshBlocker_doubleHit_exteriorPoint_dist_firstApex_lt
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hqRow : R.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hwRow : R.interior.frontier.pair.w ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    {z : ℝ²}
    (hzRow : z ∈ (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hzOutside : z ∉ S.capByIndex S.oppIndex1) :
    dist S.oppApex1 z < radius := by
  let K := (H.selectedAt fresh hfreshA).toCriticalFourShell
  have hcenterA : H.centerAt fresh hfreshA ∈ D.A :=
    (Finset.mem_erase.mp K.center_mem).2
  have hcenterNe : H.centerAt fresh hfreshA ≠ S.oppApex1 :=
    R.firstApex_fullyDeletionRobust.centerAt_ne H fresh hfreshA
  have hqEq :
      dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.q = K.radius :=
    K.support_eq_radius R.interior.frontier.pair.q hqRow
  have hwEq :
      dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.w = K.radius :=
    K.support_eq_radius R.interior.frontier.pair.w hwRow
  have hzEq : dist (H.centerAt fresh hfreshA) z = K.radius :=
    K.support_eq_radius z hzRow
  exact dist_firstApex_lt_of_interiorPair_circlePoint_outsideCap
    R.interior.q_mem_interior R.interior.w_mem_interior
    R.interior.frontier.pair.q_ne_w hcenterA hcenterNe
    (hqEq.trans hwEq.symm) (K.support_subset_A hzRow) hzOutside
    (hzEq.trans hqEq.symm)

/-- A fresh source whose actual blocker row contains the original interior
pair cannot be one of the three supporting Moser vertices. -/
theorem actualFreshBlocker_doubleHit_fresh_not_mem_supportTriangle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hqRow : R.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hwRow : R.interior.frontier.pair.w ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support) :
    fresh ∉ S.triangle.verts := by
  let K := (H.selectedAt fresh hfreshA).toCriticalFourShell
  have hcenterA : H.centerAt fresh hfreshA ∈ D.A :=
    (Finset.mem_erase.mp K.center_mem).2
  have hcenterNe : H.centerAt fresh hfreshA ≠ S.oppApex1 :=
    R.firstApex_fullyDeletionRobust.centerAt_ne H fresh hfreshA
  have hqEq :
      dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.q = K.radius :=
    K.support_eq_radius R.interior.frontier.pair.q hqRow
  have hwEq :
      dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.w = K.radius :=
    K.support_eq_radius R.interior.frontier.pair.w hwRow
  have hfreshEq : dist (H.centerAt fresh hfreshA) fresh = K.radius :=
    K.support_eq_radius fresh K.q_mem_support
  have htriangle := interiorPair_circleRadius_lt_dist_supportTriangle
    R.interior.q_mem_interior R.interior.w_mem_interior
    R.interior.frontier.pair.q_ne_w hcenterA hcenterNe
    (hqEq.trans hwEq.symm)
  have hsame :
      dist (H.centerAt fresh hfreshA) fresh =
        dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.q :=
    hfreshEq.trans hqEq.symm
  intro hfreshVerts
  rcases SurplusCapPacket.mem_triangle_verts_cases hfreshVerts with
    h | h | h
  · have hlt :
        dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.q <
          dist (H.centerAt fresh hfreshA) fresh := by
      simpa [h] using htriangle.1
    linarith
  · have hlt :
        dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.q <
          dist (H.centerAt fresh hfreshA) fresh := by
      simpa [h] using htriangle.2.1
    linarith
  · have hlt :
        dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.q <
          dist (H.centerAt fresh hfreshA) fresh := by
      simpa [h] using htriangle.2.2
    linarith

/-- A double-hit fresh row omits every supporting-triangle vertex. -/
theorem actualFreshBlocker_doubleHit_supportTriangle_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hqRow : R.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hwRow : R.interior.frontier.pair.w ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    {v : ℝ²} (hvTriangle : v ∈ S.triangle.verts) :
    v ∉ (H.selectedAt fresh hfreshA).toCriticalFourShell.support := by
  let K := (H.selectedAt fresh hfreshA).toCriticalFourShell
  have hcenterA : H.centerAt fresh hfreshA ∈ D.A :=
    (Finset.mem_erase.mp K.center_mem).2
  have hcenterNe : H.centerAt fresh hfreshA ≠ S.oppApex1 :=
    R.firstApex_fullyDeletionRobust.centerAt_ne H fresh hfreshA
  have hqEq :
      dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.q = K.radius :=
    K.support_eq_radius R.interior.frontier.pair.q hqRow
  have hwEq :
      dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.w = K.radius :=
    K.support_eq_radius R.interior.frontier.pair.w hwRow
  have htriangle := interiorPair_circleRadius_lt_dist_supportTriangle
    R.interior.q_mem_interior R.interior.w_mem_interior
    R.interior.frontier.pair.q_ne_w hcenterA hcenterNe
    (hqEq.trans hwEq.symm)
  intro hvRow
  have hvEq : dist (H.centerAt fresh hfreshA) v = K.radius :=
    K.support_eq_radius v hvRow
  rcases SurplusCapPacket.mem_triangle_verts_cases hvTriangle with h | h | h
  · have hlt :
        dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.q <
          dist (H.centerAt fresh hfreshA) v := by
      simpa [h] using htriangle.1
    linarith
  · have hlt :
        dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.q <
          dist (H.centerAt fresh hfreshA) v := by
      simpa [h] using htriangle.2.1
    linarith
  · have hlt :
        dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.q <
          dist (H.centerAt fresh hfreshA) v := by
      simpa [h] using htriangle.2.2
    linarith

/-- A double-hit fresh row and any retained blocker row force a
supporting-triangle source whose actual blocker differs from both physical
apices and from both named blocker centers. -/
theorem exists_supportTriangleSource_freshActualBlocker_of_doubleHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    (hsecond : FullyDeletionRobustAt D S.oppApex2)
    {blocker : ℝ²} (hblockerA : blocker ∈ D.A)
    (blockerClass : SelectedFourClass D.A blocker)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hqRow : R.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hwRow : R.interior.frontier.pair.w ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support) :
    ∃ (v : ℝ²) (hvA : v ∈ D.A),
      v ∈ S.triangle.verts ∧
      v ∉ blockerClass.support ∧
      v ∉ (H.selectedAt fresh hfreshA).toCriticalFourShell.support ∧
      H.centerAt v hvA ≠ S.oppApex1 ∧
      H.centerAt v hvA ≠ S.oppApex2 ∧
      H.centerAt v hvA ≠ blocker ∧
      H.centerAt v hvA ≠ H.centerAt fresh hfreshA := by
  rcases selectedFourClass_exists_supportTriangle_omission
      hblockerA blockerClass with ⟨v, hvTriangle, hvBlocker⟩
  have hvA : v ∈ D.A := S.triangle.verts_subset hvTriangle
  have hvFresh :=
    actualFreshBlocker_doubleHit_supportTriangle_omission
      R hfreshA hqRow hwRow hvTriangle
  have hneFirst :=
    R.firstApex_fullyDeletionRobust.centerAt_ne H v hvA
  have hneSecond := hsecond.centerAt_ne H v hvA
  have hneBlocker :=
    ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
      H hvA
      (selectedFourClass_survives_erase_of_not_mem blockerClass hvBlocker)
  have hneFresh :=
    ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
      H hvA
      (selectedFourClass_survives_erase_of_not_mem
        (H.selectedAt fresh hfreshA).toCriticalFourShell.toSelectedFourClass
        hvFresh)
  exact ⟨v, hvA, hvTriangle, hvBlocker, hvFresh,
    hneFirst, hneSecond, hneBlocker, hneFresh⟩

/-- In the named two-inside/two-outside child, both exterior row points have
strictly smaller first-apex radius as well as the row's smaller shell radius. -/
theorem actualFreshBlocker_doubleHit_twoOutside_firstApexDistanceDrop
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
      dist S.oppApex1 fresh < radius ∧
      dist S.oppApex1 t < radius ∧
      (H.selectedAt fresh hfreshA).toCriticalFourShell.radius < radius := by
  let K := (H.selectedAt fresh hfreshA).toCriticalFourShell
  rcases actualFreshBlocker_doubleHit_twoOutside
      R hfreshA hfreshNotFirst hqRow hwRow with
    ⟨t, hsupport, hcard, hfreshOutside, htOutside, hrowDrop⟩
  have hfreshRow : fresh ∈ K.support := K.q_mem_support
  have htRow : t ∈ K.support := by
    rw [hsupport]
    simp
  have hfreshDrop :=
    actualFreshBlocker_doubleHit_exteriorPoint_dist_firstApex_lt
      R hfreshA hqRow hwRow hfreshRow hfreshOutside
  have htDrop :=
    actualFreshBlocker_doubleHit_exteriorPoint_dist_firstApex_lt
      R hfreshA hqRow hwRow htRow htOutside
  exact ⟨t, hsupport, hcard, hfreshOutside, htOutside,
    hfreshDrop, htDrop, hrowDrop⟩

/-- A minimum admissible source pair eliminates the actual fresh-row
double-hit child when the first closed cap has cardinality five.  The explicit
equality records that this is the source-selected pair; a later arbitrary
reselection does not inherit the conclusion. -/
theorem false_of_actualFreshBlocker_doubleHit_of_minimalPair_capFive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    (M : FirstApexExactFiveInteriorFrontier.MinimalAdmissibleInteriorPair
      D S radius H)
    (hsource : M.frontier = R.interior)
    (hsecond : FullyDeletionRobustAt D S.oppApex2)
    (hcap : (S.capByIndex S.oppIndex1).card = 5)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hqRow : R.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hwRow : R.interior.frontier.pair.w ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support) :
    False := by
  let K := (H.selectedAt fresh hfreshA).toCriticalFourShell
  have hcenterA : H.centerAt fresh hfreshA ∈ D.A :=
    (Finset.mem_erase.mp K.center_mem).2
  have hcenterNe : H.centerAt fresh hfreshA ≠ S.oppApex1 :=
    R.firstApex_fullyDeletionRobust.centerAt_ne H fresh hfreshA
  have hcenterEq :
      dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.q =
        dist (H.centerAt fresh hfreshA) R.interior.frontier.pair.w :=
    (K.support_eq_radius R.interior.frontier.pair.q hqRow).trans
      (K.support_eq_radius R.interior.frontier.pair.w hwRow).symm
  exact M.no_other_bisector_of_cap_card_five hsecond
    R.class_card_eq_five hcap hcenterA hcenterNe
    (by simpa [hsource] using hcenterEq)

/-- Source-custody form of the cap-five consequence: the actual fresh row
must omit at least one endpoint of the minimum admissible pair. -/
theorem
    FirstApexUniqueRadiusExactFiveMinimalDistinctResidual.actualFreshBlocker_omits_source_of_capFive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (Rmin : FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F)
    (hsecond : FullyDeletionRobustAt D S.oppApex2)
    (hcap : (S.capByIndex S.oppIndex1).card = 5)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A) :
    Rmin.residual.interior.frontier.pair.q ∉
        (H.selectedAt fresh hfreshA).toCriticalFourShell.support ∨
      Rmin.residual.interior.frontier.pair.w ∉
        (H.selectedAt fresh hfreshA).toCriticalFourShell.support := by
  by_cases hq : Rmin.residual.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support
  · by_cases hw : Rmin.residual.interior.frontier.pair.w ∈
        (H.selectedAt fresh hfreshA).toCriticalFourShell.support
    · exact (false_of_actualFreshBlocker_doubleHit_of_minimalPair_capFive
        Rmin.residual Rmin.minimalPair Rmin.source_eq hsecond hcap
        hfreshA hq hw).elim
    · exact Or.inr hw
  · exact Or.inl hq

/-- If the actual fresh row contains both endpoints of the minimum admissible
source pair, the first physical cap cannot have cardinality five.  The two
physical cap bounds and the surplus-cap partition then force at least thirteen
carrier points. -/
theorem
    FirstApexUniqueRadiusExactFiveMinimalDistinctResidual.carrier_card_ge_thirteen_of_actualFreshBlocker_doubleHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (Rmin : FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F)
    (hsecond : FullyDeletionRobustAt D S.oppApex2)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hqRow : Rmin.residual.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hwRow : Rmin.residual.interior.frontier.pair.w ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support) :
    13 ≤ D.A.card := by
  have hfirstFive : 5 ≤ S.oppCap1.card :=
    firstOppCap_card_ge_five Rmin.residual
  have hfirstSix : 6 ≤ S.oppCap1.card := by
    by_contra hnotSix
    have hcapOpp : S.oppCap1.card = 5 := by omega
    have hcap : (S.capByIndex S.oppIndex1).card = 5 := by
      simpa only [capByIndex_oppIndex1_eq_oppCap1] using hcapOpp
    exact false_of_actualFreshBlocker_doubleHit_of_minimalPair_capFive
      Rmin.residual Rmin.minimalPair Rmin.source_eq hsecond hcap
      hfreshA hqRow hwRow
  have hsecondFive : 5 ≤ S.oppCap2.card :=
    second_oppCap_card_ge_five hsecond
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  all_goals
    simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hsum hsurplus hfirstSix hsecondFive
    omega

/-- Every actual fresh blocker row in the minimum-pair source branch either
forces the carrier into the at-least-thirteen regime or omits one of the two
minimum source endpoints. -/
theorem
    FirstApexUniqueRadiusExactFiveMinimalDistinctResidual.card_ge_thirteen_or_actualFreshBlocker_source_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (Rmin : FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F)
    (hsecond : FullyDeletionRobustAt D S.oppApex2)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A) :
    13 ≤ D.A.card ∨
      Rmin.residual.interior.frontier.pair.q ∉
        (H.selectedAt fresh hfreshA).toCriticalFourShell.support ∨
      Rmin.residual.interior.frontier.pair.w ∉
        (H.selectedAt fresh hfreshA).toCriticalFourShell.support := by
  by_cases hq : Rmin.residual.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support
  · by_cases hw : Rmin.residual.interior.frontier.pair.w ∈
        (H.selectedAt fresh hfreshA).toCriticalFourShell.support
    · exact Or.inl
        (carrier_card_ge_thirteen_of_actualFreshBlocker_doubleHit
          Rmin hsecond hfreshA hq hw)
    · exact Or.inr (Or.inr hw)
  · exact Or.inr (Or.inl hq)

end ExactFiveDistinctPhysicalFreshRowRadiusDrop
end Problem97
