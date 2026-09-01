/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BiApexRobustCapBounds
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.PrefixSemanticCore
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueRowProducer.card_five_interior_survivor_pair
import Erdos9796Proof.P97.ATail.FirstApexUniqueRadiusResidual
import Erdos9796Proof.P97.ATail.PhysicalSecondApexCommonDeletion
import Erdos9796Proof.P97.ATail.RobustApexCommonDeletion
import Erdos9796Proof.P97.ATail.ThreeCenterCommonDeletion

/-!
# Three-center continuation for the distinct exact-five residual

An oriented physical-second-apex common-deletion packet exposes three concrete
selected four-classes.  Two share the retained endpoint, so a twelve-point
carrier supplies a fresh source outside all three supports.  This module
packages the resulting support-preserving three-center deletion together with
the retained endpoint's resolved incidence at the second physical apex.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveDistinctThreeCenterContinuation

open ATailBiApexRobustCapBounds
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailPhysicalSecondApexCommonDeletion
open ATailRobustApexCommonDeletion
open ATailThreeCenterCommonDeletion
open ExactFiveCommonShellV7
open FirstApexExactFiveInteriorFrontier
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

/-- The retained endpoint either yields another physical-apex deletion packet,
or belongs to all three selected rows and hence enters the five-way robust-apex
continuation. -/
inductive RetainedSourceAlternative
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (firstApex blocker secondApex retained : ℝ²)
    (K₀ : SelectedFourClass D.A firstApex)
    (K₁ : SelectedFourClass D.A blocker)
    (K₂ : SelectedFourClass D.A secondApex) : Type
  | physical
      (retained_not_mem_second : retained ∉ K₂.support)
      (packet :
        CommonDeletionTwoCenterPacket D H retained firstApex secondApex)
  | fiveIncidence
      (packet :
        RobustApexFiveIncidenceContinuationPacket D H
          firstApex blocker secondApex retained
          K₀.support K₁.support K₂.support)

/-- Source-faithful normal form produced from the oriented distinct exact-five
post-card-eleven residual. -/
structure ExactFiveDistinctThreeCenterNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2) : Type where
  secondApex_robust : FullyDeletionRobustAt D S.oppApex2
  retained : ℝ²
  retained_mem_A : retained ∈ D.A
  orientation :
    (deleted = R.interior.frontier.pair.w ∧
        retained = R.interior.frontier.pair.q ∧
        blocker = H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A) ∨
      (deleted = R.interior.frontier.pair.q ∧
        retained = R.interior.frontier.pair.w ∧
        blocker = H.centerAt R.interior.frontier.pair.w
          R.interior.frontier.pair.w_mem_A)
  firstApexClass : SelectedFourClass D.A S.oppApex1
  firstApexClass_support_eq :
    firstApexClass.support =
      (SelectedClass D.A S.oppApex1 radius).erase deleted
  blockerClass : SelectedFourClass D.A blocker
  blockerClass_support_eq : blockerClass.support = C.B₁
  secondApexClass : SelectedFourClass D.A S.oppApex2
  secondApexClass_support_eq : secondApexClass.support = C.B₂
  retained_mem_firstApexClass : retained ∈ firstApexClass.support
  retained_mem_blockerClass : retained ∈ blockerClass.support
  fresh : ℝ²
  freshThreeCenter :
    ThreeCenterCommonDeletionExactRows D fresh
      S.oppApex1 blocker S.oppApex2
      firstApexClass.support blockerClass.support secondApexClass.support
  alternative :
    RetainedSourceAlternative D H S.oppApex1 blocker S.oppApex2 retained
      firstApexClass blockerClass secondApexClass

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem oppApex1_ne_oppApex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ≠ S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi] using
      S.triangle.v23_ne
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi] using
      S.triangle.v13_ne.symm
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi] using
      S.triangle.v12_ne

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

/-- An exact five-point first-apex class forces at least five points in the
first physical opposite cap. -/
private theorem firstOppCap_card_ge_five
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
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two S S.oppIndex1
  have hcapByIndex : 5 ≤ (S.capByIndex S.oppIndex1).card := by omega
  simpa only [capByIndex_oppIndex1_eq_oppCap1] using hcapByIndex

/-- Robustness at the second physical apex, together with the exact-five first
cap, forces a carrier of cardinality at least twelve. -/
theorem carrierCard_ge_twelve_of_secondApexRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    (hsecond : FullyDeletionRobustAt D S.oppApex2) :
    12 ≤ D.A.card := by
  have hfirstCap : 5 ≤ S.oppCap1.card := firstOppCap_card_ge_five R
  have hsecondCap : 5 ≤ S.oppCap2.card := second_oppCap_card_ge_five hsecond
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  all_goals
    simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hsum hsurplus hfirstCap hsecondCap
    omega

private theorem nonempty_normalForm_of_orientedSources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker retained : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (hsecond : FullyDeletionRobustAt D S.oppApex2)
    (hretainedA : retained ∈ D.A)
    (hdeletedClass : deleted ∈ SelectedClass D.A S.oppApex1 radius)
    (hretainedClass : retained ∈ SelectedClass D.A S.oppApex1 radius)
    (hretainedNeDeleted : retained ≠ deleted)
    (hblocker : blocker = H.centerAt retained hretainedA)
    (horientation :
      (deleted = R.interior.frontier.pair.w ∧
          retained = R.interior.frontier.pair.q ∧
          blocker = H.centerAt R.interior.frontier.pair.q
            R.interior.frontier.pair.q_mem_A) ∨
        (deleted = R.interior.frontier.pair.q ∧
          retained = R.interior.frontier.pair.w ∧
          blocker = H.centerAt R.interior.frontier.pair.w
            R.interior.frontier.pair.w_mem_A)) :
    Nonempty (ExactFiveDistinctThreeCenterNormalForm R C) := by
  classical
  subst blocker
  let K₀ : SelectedFourClass D.A S.oppApex1 :=
    selectedFourClassOfExactFiveErase
      R.interior.frontier.radius_pos R.class_card_eq_five hdeletedClass
  let K₁ : SelectedFourClass D.A (H.centerAt retained hretainedA) :=
    firstRowSelectedFourClass C
  let K₂ : SelectedFourClass D.A S.oppApex2 :=
    secondRowSelectedFourClass C
  have hretainedK₀ : retained ∈ K₀.support := by
    exact Finset.mem_erase.mpr ⟨hretainedNeDeleted, hretainedClass⟩
  have hK₁Support :
      K₁.support =
        (H.selectedAt retained hretainedA).toCriticalFourShell.support := by
    simpa only [K₁] using
      firstRow_support_eq_criticalShell_of_center_eq C hretainedA rfl
  have hretainedK₁ : retained ∈ K₁.support := by
    rw [hK₁Support]
    exact (H.selectedAt retained hretainedA).toCriticalFourShell.q_mem_support
  have hinterNonempty : (K₀.support ∩ K₁.support).Nonempty :=
    ⟨retained, Finset.mem_inter.mpr ⟨hretainedK₀, hretainedK₁⟩⟩
  have hinterCard : 1 ≤ (K₀.support ∩ K₁.support).card :=
    Finset.one_le_card.mpr hinterNonempty
  have hK₀K₁Card : (K₀.support ∪ K₁.support).card ≤ 7 := by
    have hsum := Finset.card_union_add_card_inter K₀.support K₁.support
    rw [K₀.support_card, K₁.support_card] at hsum
    omega
  have hthreeCard :
      ((K₀.support ∪ K₁.support) ∪ K₂.support).card ≤ 11 := by
    calc
      ((K₀.support ∪ K₁.support) ∪ K₂.support).card
          ≤ (K₀.support ∪ K₁.support).card + K₂.support.card :=
        Finset.card_union_le _ _
      _ ≤ 11 := by rw [K₂.support_card]; omega
  have hcarrier : 12 ≤ D.A.card :=
    carrierCard_ge_twelve_of_secondApexRobust R hsecond
  have hnotSubset :
      ¬ D.A ⊆ (K₀.support ∪ K₁.support) ∪ K₂.support := by
    intro hsubset
    have hle := Finset.card_le_card hsubset
    omega
  rw [Finset.not_subset] at hnotSubset
  rcases hnotSubset with ⟨fresh, hfreshA, hfreshOutside⟩
  have hfreshK₀ : fresh ∉ K₀.support := by
    intro hfresh
    exact hfreshOutside (Finset.mem_union.mpr
      (Or.inl (Finset.mem_union.mpr (Or.inl hfresh))))
  have hfreshK₁ : fresh ∉ K₁.support := by
    intro hfresh
    exact hfreshOutside (Finset.mem_union.mpr
      (Or.inl (Finset.mem_union.mpr (Or.inr hfresh))))
  have hfreshK₂ : fresh ∉ K₂.support := by
    intro hfresh
    exact hfreshOutside (Finset.mem_union.mpr (Or.inr hfresh))
  have hfirstApexA : S.oppApex1 ∈ D.A := oppApex1_mem_A S
  have hfirstNeBlocker :
      S.oppApex1 ≠ H.centerAt retained hretainedA :=
    (R.firstApex_fullyDeletionRobust.centerAt_ne
      H retained hretainedA).symm
  have hfirstNeSecond : S.oppApex1 ≠ S.oppApex2 :=
    oppApex1_ne_oppApex2 S
  let freshThreeCenter :=
      (nonempty_threeCenterCommonDeletionExactRows_of_omitted_selectedFourClasses
        hfreshA hfirstApexA C.center₁_mem_A C.center₂_mem_A
        hfirstNeBlocker hfirstNeSecond C.centers_ne
        K₀ K₁ K₂ hfreshK₀ hfreshK₁ hfreshK₂).some
  have halternative :
      RetainedSourceAlternative D H S.oppApex1
        (H.centerAt retained hretainedA) S.oppApex2 retained K₀ K₁ K₂ := by
    by_cases hretainedK₂ : retained ∈ K₂.support
    · let surface : RobustApexThreeRowSurface D S.oppApex1
          (H.centerAt retained hretainedA) S.oppApex2 retained := {
        O_mem_A := hfirstApexA
        c₁_mem_A := C.center₁_mem_A
        c₂_mem_A := C.center₂_mem_A
        O_ne_c₁ := hfirstNeBlocker
        O_ne_c₂ := hfirstNeSecond
        c₁_ne_c₂ := C.centers_ne
        robustO := R.firstApex_fullyDeletionRobust
        row₀ := K₀
        row₁ := K₁
        row₂ := K₂
        a_mem_row₀ := hretainedK₀ }
      let continuation :=
        (nonempty_robustApexFiveIncidenceContinuation_of_commonPoint
          H surface hretainedK₁ hretainedK₂).some
      exact .fiveIncidence {
        surface := surface
        row₀_support_eq := rfl
        row₁_support_eq := rfl
        row₂_support_eq := rfl
        a_mem_row₁ := hretainedK₁
        a_mem_row₂ := hretainedK₂
        continuation := continuation }
    · let packet :=
          (nonempty_commonDeletionTwoCenterPacket_of_fullyDeletionRobustAt_and_omitted_selectedFourClass
            H hretainedA hfirstApexA C.center₂_mem_A hfirstNeSecond
              R.firstApex_fullyDeletionRobust K₂ hretainedK₂).some
      exact .physical hretainedK₂ packet
  exact ⟨{
    secondApex_robust := hsecond
    retained := retained
    retained_mem_A := hretainedA
    orientation := horientation
    firstApexClass := K₀
    firstApexClass_support_eq := rfl
    blockerClass := K₁
    blockerClass_support_eq := rfl
    secondApexClass := K₂
    secondApexClass_support_eq := rfl
    retained_mem_firstApexClass := hretainedK₀
    retained_mem_blockerClass := hretainedK₁
    fresh := fresh
    freshThreeCenter := freshThreeCenter
    alternative := halternative }⟩

/-- Produce the support-preserving three-center normal form from an oriented
physical-second-apex packet and second-apex deletion robustness. -/
theorem nonempty_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (horiented :
      (deleted = R.interior.frontier.pair.w ∧
          blocker = H.centerAt R.interior.frontier.pair.q
            R.interior.frontier.pair.q_mem_A) ∨
        (deleted = R.interior.frontier.pair.q ∧
          blocker = H.centerAt R.interior.frontier.pair.w
            R.interior.frontier.pair.w_mem_A))
    (hsecond : FullyDeletionRobustAt D S.oppApex2) :
    Nonempty (ExactFiveDistinctThreeCenterNormalForm R C) := by
  rcases horiented with hqw | hwq
  · rcases hqw with ⟨rfl, hblocker⟩
    apply nonempty_normalForm_of_orientedSources R C hsecond
      R.interior.frontier.pair.q_mem_A
      (Finset.mem_inter.mp R.interior.w_mem_interior).1
      (Finset.mem_inter.mp R.interior.q_mem_interior).1
      R.interior.frontier.pair.q_ne_w hblocker
    exact Or.inl ⟨rfl, rfl, hblocker⟩
  · rcases hwq with ⟨rfl, hblocker⟩
    apply nonempty_normalForm_of_orientedSources R C hsecond
      R.interior.frontier.pair.w_mem_A
      (Finset.mem_inter.mp R.interior.q_mem_interior).1
      (Finset.mem_inter.mp R.interior.w_mem_interior).1
      R.interior.frontier.pair.q_ne_w.symm hblocker
    exact Or.inr ⟨rfl, rfl, hblocker⟩

end ExactFiveDistinctThreeCenterContinuation
end Problem97
