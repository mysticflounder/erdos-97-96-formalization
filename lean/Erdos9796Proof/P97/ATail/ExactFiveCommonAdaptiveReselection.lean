/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueRowProducer.card_five_interior_survivor_pair
import Erdos9796Proof.P97.ATail.FirstApexUniqueRadiusResidual
import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover
import Erdos9796Proof.P97.ATail.PhysicalSecondApexSwap

/-!
# Adaptive reselection for the common exact-five residual

Choose a third strict-interior point and inspect its deletion at the physical
second apex.  A critical deletion produces the swapped exact-four outcome.  A
surviving deletion omits one old source, giving a new strict-interior pair.
The old common row then supplies the third-incidence contradiction needed to
separate the new obstruction centers.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonAdaptiveReselection

open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailPhysicalSecondApexSwap
open ATAILStageOnePrescribedApexDichotomy
open FirstApexExactFiveInteriorFrontier
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

private theorem exists_third_mem_of_three_le_card
    {α : Type*}
    {s : Finset α} {q w : α}
    (hq : q ∈ s) (hw : w ∈ s) (hqw : q ≠ w)
    (hthree : 3 ≤ s.card) :
    ∃ t ∈ s, t ≠ q ∧ t ≠ w := by
  classical
  have hwErase : w ∈ s.erase q := Finset.mem_erase.mpr ⟨hqw.symm, hw⟩
  have hcardQ : (s.erase q).card = s.card - 1 :=
    Finset.card_erase_of_mem hq
  have hcardW : ((s.erase q).erase w).card = (s.erase q).card - 1 :=
    Finset.card_erase_of_mem hwErase
  have hpos : 0 < ((s.erase q).erase w).card := by omega
  rcases Finset.card_pos.mp hpos with ⟨t, ht⟩
  rcases Finset.mem_erase.mp ht with ⟨htw, htqErase⟩
  rcases Finset.mem_erase.mp htqErase with ⟨htq, hts⟩
  exact ⟨t, hts, htq, htw⟩

private theorem oppApex2_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem nonempty_distinct_of_reselected_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F)
    {t x y : ℝ²} {rho : ℝ}
    (htI : t ∈ SelectedClass D.A S.oppApex1 radius ∩
      S.capInteriorByIndex S.oppIndex1)
    (hxI : x ∈ SelectedClass D.A S.oppApex1 radius ∩
      S.capInteriorByIndex S.oppIndex1)
    (hyClass : y ∈ SelectedClass D.A S.oppApex1 radius)
    (htx : t ≠ x) (hty : t ≠ y) (hxy : x ≠ y)
    (hxA : x ∈ D.A)
    (hyKx : y ∈ (H.selectedAt x hxA).toCriticalFourShell.support)
    (hrho : 0 < rho)
    (hfourEraseT :
      4 ≤ (SelectedClass (D.A.erase t) S.oppApex2 rho).card)
    (hxNot : x ∉ SelectedClass D.A S.oppApex2 rho) :
    Nonempty
      (FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) := by
  have hxNotEraseT :
      x ∉ SelectedClass (D.A.erase t) S.oppApex2 rho := by
    intro hx
    exact hxNot <| mem_selectedClass.mpr
      ⟨Finset.mem_of_mem_erase (mem_selectedClass.mp hx).1,
        (mem_selectedClass.mp hx).2⟩
  have hfourDouble :
      4 ≤ (SelectedClass ((D.A.erase t).erase x)
        S.oppApex2 rho).card := by
    rw [selectedClass_erase_card_eq_of_not_mem hxNotEraseT]
    exact hfourEraseT
  have hdouble :
      HasNEquidistantPointsAt 4
        ((D.A.erase t).erase x) S.oppApex2 :=
    ⟨rho, hrho, by simpa [SelectedClass] using hfourDouble⟩
  let P' :=
    ExactFiveInteriorCriticalPairFrontier.ofInteriorPair
      D S H htI hxI htx hdouble
  have hfive : 5 ≤ (SelectedClass D.A S.oppApex1 radius).card := by
    rw [R.class_card_eq_five]
  have hcenters :
      H.centerAt P'.frontier.pair.q P'.frontier.pair.q_mem_A ≠
        H.centerAt P'.frontier.pair.w P'.frontier.pair.w_mem_A := by
    intro heq
    have hnewMutual :=
      (blocker_centers_eq_iff_mutual_cross_membership_of_five_le
        P'.frontier.pair P'.frontier.radius_pos
        hfive).mp heq
    have htKx :
        t ∈ (H.selectedAt x hxA).toCriticalFourShell.support := by
      simpa [P', ExactFiveInteriorCriticalPairFrontier.ofInteriorPair,
        ExactFiveInteriorCriticalPairFrontier.frontier] using hnewMutual.2
    have hxKx :
        x ∈ (H.selectedAt x hxA).toCriticalFourShell.support :=
      (H.selectedAt x hxA).toCriticalFourShell.q_mem_support
    let C : Finset ℝ² := SelectedClass D.A S.oppApex1 radius
    have hsub :
        ({x, y, t} : Finset ℝ²) ⊆
          (H.selectedAt x hxA).toCriticalFourShell.support ∩ C := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact Finset.mem_inter.mpr
          ⟨hxKx, by simpa [C] using (Finset.mem_inter.mp hxI).1⟩
      · exact Finset.mem_inter.mpr ⟨hyKx, by simpa [C] using hyClass⟩
      · exact Finset.mem_inter.mpr
          ⟨htKx, by simpa [C] using (Finset.mem_inter.mp htI).1⟩
    have hthree :
        3 ≤ ((H.selectedAt x hxA).toCriticalFourShell.support ∩ C).card := by
      calc
        3 = ({x, y, t} : Finset ℝ²).card := by
          have hyt : y ∉ ({t} : Finset ℝ²) := by
            simpa using hty.symm
          have hxyt : x ∉ ({y, t} : Finset ℝ²) := by
            simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
            exact ⟨hxy, htx.symm⟩
          rw [Finset.card_insert_of_notMem hxyt,
            Finset.card_insert_of_notMem hyt, Finset.card_singleton]
        _ ≤ _ := Finset.card_le_card hsub
    have hblockerNe : H.centerAt x hxA ≠ S.oppApex1 :=
      actual_blocker_ne_of_deletion_survives H hxA
        (R.firstApex_fullyDeletionRobust.survives x hxA)
    have htwo :=
      ATailMinimalUniqueFourCover.criticalFourShell_inter_selectedClass_card_le_two
        (radius := radius)
        (H.selectedAt x hxA).toCriticalFourShell hblockerNe
    have htwoC :
        ((H.selectedAt x hxA).toCriticalFourShell.support ∩ C).card ≤ 2 := by
      simpa [C] using htwo
    omega
  have hcross :=
    FirstApexInteriorPairGeometry.crossDeletion_survives_of_obstructionCenters_ne
      P'.frontier.pair P'.frontier.radius_pos
      hfive hcenters
  have hdoubleFirst :
      ¬ HasNEquidistantPointsAt 4
        ((D.A.erase P'.frontier.pair.q).erase P'.frontier.pair.w)
        S.oppApex1 :=
    retainedPair_doubleDeletion_obstructsFirstApex
      P'.frontier (Or.inr R.class_card_eq_five)
        R.unique_fourClass_radius
  exact ⟨{
    minimal := R.minimal
    noM44 := R.noM44
    carrier_card_gt_nine := R.carrier_card_gt_nine
    class_card_eq_five := R.class_card_eq_five
    unique_fourClass_radius := R.unique_fourClass_radius
    firstApex_fullyDeletionRobust := R.firstApex_fullyDeletionRobust
    originalPair_doubleDeletion_obstructs :=
      R.originalPair_doubleDeletion_obstructs
    interior := P'
    interiorPair_doubleDeletion_obstructs := hdoubleFirst
    obstructionCenters_ne := hcenters
    directed_crossDeletion_survival := hcross
  }⟩

/-- The common exact-five residual either reorients at a critical third-point
deletion or admits a reselected strict-interior pair with distinct obstruction
centers. -/
theorem nonempty_swapped_or_distinct
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    Nonempty (SwappedFirstApexUniqueFourFrontier D S H) ∨
      Nonempty
        (FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) := by
  let P := R.interior.frontier.pair
  let I := SelectedClass D.A S.oppApex1 radius ∩
    S.capInteriorByIndex S.oppIndex1
  have hI3 : 3 ≤ I.card := by
    simpa [I] using
      ATailUniqueRowProducerScratch.firstApex_cardFive_interior_card_ge_three
        D S R.interior.frontier.radius_pos R.class_card_eq_five
  rcases exists_third_mem_of_three_le_card
      (by simpa [I, P] using R.interior.q_mem_interior)
      (by simpa [I, P] using R.interior.w_mem_interior)
      (by simpa [P] using P.q_ne_w) hI3 with
    ⟨t, htI, htq, htw⟩
  have htI' :
      t ∈ SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1 := by
    simpa [I] using htI
  have hO2A : S.oppApex2 ∈ D.A := oppApex2_mem S
  rcases erase_survives_or_criticalSelectedFourClass_at
      (q := t) D.K4 hO2A with htSurvives | ⟨KtO2, htBlocked⟩
  · rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt htSurvives with
      ⟨rho, hrho, hfourEraseT⟩
    have homit :
        P.q ∉ SelectedClass D.A S.oppApex2 rho ∨
          P.w ∉ SelectedClass D.A S.oppApex2 rho := by
      by_cases hq : P.q ∈ SelectedClass D.A S.oppApex2 rho
      · by_cases hw : P.w ∈ SelectedClass D.A S.oppApex2 rho
        · have hone := firstApex_marginal_inter_secondClass_card_le_one
              D S radius rho
          rw [Finset.card_le_one] at hone
          have hqw : P.q = P.w := hone P.q
            (Finset.mem_filter.mpr ⟨P.q_mem_marginal, hq⟩) P.w
            (Finset.mem_filter.mpr ⟨P.w_mem_marginal, hw⟩)
          exact False.elim (P.q_ne_w hqw)
        · exact Or.inr hw
      · exact Or.inl hq
    rcases homit with hqOmit | hwOmit
    · exact Or.inr <|
        nonempty_distinct_of_reselected_pair R htI'
          R.interior.q_mem_interior
          (Finset.mem_inter.mp R.interior.w_mem_interior).1
          htq htw P.q_ne_w P.q_mem_A R.mutual_cross_membership.1
          hrho hfourEraseT hqOmit
    · exact Or.inr <|
        nonempty_distinct_of_reselected_pair R htI'
          R.interior.w_mem_interior
          (Finset.mem_inter.mp R.interior.q_mem_interior).1
          htw htq P.q_ne_w.symm P.w_mem_A R.mutual_cross_membership.2
          hrho hfourEraseT hwOmit
  · exact Or.inl <|
      physicalSecondCritical_reorients_to_swappedUniqueFour KtO2 htBlocked

end ExactFiveCommonAdaptiveReselection
end Problem97
