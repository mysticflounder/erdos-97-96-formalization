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

/-- A strict source refinement of the three-center normal form.  Either a
source distinct from the original deletion is omitted by all three rows, or
the carrier has exactly twelve points, the three rows cover its deletion, and
the retained source yields the physical continuation. -/
inductive ExactFiveDistinctStrictThreeCenterAlternative
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C) : Type
  | distinctFresh
      (fresh : ℝ²)
      (fresh_ne_deleted : fresh ≠ deleted)
      (packet :
        ThreeCenterCommonDeletionExactRows D fresh
          S.oppApex1 blocker S.oppApex2
          N.firstApexClass.support N.blockerClass.support
          N.secondApexClass.support)
  | exactTwelveTightPhysical
      (carrier_card_eq_twelve : D.A.card = 12)
      (union_card_eq_eleven :
        ((N.firstApexClass.support ∪ N.blockerClass.support) ∪
          N.secondApexClass.support).card = 11)
      (carrier_erase_deleted_eq_union :
        D.A.erase deleted =
          (N.firstApexClass.support ∪ N.blockerClass.support) ∪
            N.secondApexClass.support)
      (retained_not_mem_second :
        N.retained ∉ N.secondApexClass.support)
      (packet :
        CommonDeletionTwoCenterPacket D H N.retained
          S.oppApex1 S.oppApex2)

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

/-- Refine the non-strict fresh source in the normal form into a genuinely
new deletion source.  The sole obstruction is the exact-twelve cover, where
the retained source must lie in the physical continuation rather than the
five-incidence continuation. -/
theorem nonempty_strictThreeCenterAlternative
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    Nonempty (ExactFiveDistinctStrictThreeCenterAlternative R C N) := by
  classical
  let U :=
    (N.firstApexClass.support ∪ N.blockerClass.support) ∪
      N.secondApexClass.support
  have hdeletedK₀ : deleted ∉ N.firstApexClass.support := by
    rw [N.firstApexClass_support_eq]
    simp
  have hdeletedK₁ : deleted ∉ N.blockerClass.support := by
    rw [N.blockerClass_support_eq]
    exact C.row₁.q_not_mem
  have hdeletedK₂ : deleted ∉ N.secondApexClass.support := by
    rw [N.secondApexClass_support_eq]
    exact C.row₂.q_not_mem
  have hdeletedU : deleted ∉ U := by
    simp [U, hdeletedK₀, hdeletedK₁, hdeletedK₂]
  have hUsubA : U ⊆ D.A := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx | hx
    · rcases Finset.mem_union.mp hx with hx | hx
      · exact N.firstApexClass.support_subset_A hx
      · exact N.blockerClass.support_subset_A hx
    · exact N.secondApexClass.support_subset_A hx
  have hUsubErase : U ⊆ D.A.erase deleted := by
    intro x hx
    exact Finset.mem_erase.mpr ⟨by
      intro h
      subst x
      exact hdeletedU hx, hUsubA hx⟩
  have hK₀K₁Card :
      (N.firstApexClass.support ∪ N.blockerClass.support).card ≤ 7 := by
    have hinterNonempty :
        (N.firstApexClass.support ∩ N.blockerClass.support).Nonempty :=
      ⟨N.retained, Finset.mem_inter.mpr
        ⟨N.retained_mem_firstApexClass, N.retained_mem_blockerClass⟩⟩
    have hinterCard :
        1 ≤ (N.firstApexClass.support ∩ N.blockerClass.support).card :=
      Finset.one_le_card.mpr hinterNonempty
    have hsum := Finset.card_union_add_card_inter
      N.firstApexClass.support N.blockerClass.support
    rw [N.firstApexClass.support_card, N.blockerClass.support_card] at hsum
    omega
  have hUCard : U.card ≤ 11 := by
    calc
      U.card ≤
          (N.firstApexClass.support ∪ N.blockerClass.support).card +
            N.secondApexClass.support.card := by
        dsimp [U]
        exact Finset.card_union_le _ _
      _ ≤ 11 := by rw [N.secondApexClass.support_card]; omega
  have hcarrier : 12 ≤ D.A.card :=
    carrierCard_ge_twelve_of_secondApexRobust R N.secondApex_robust
  by_cases hEraseSub : D.A.erase deleted ⊆ U
  · have hEraseEqU : D.A.erase deleted = U :=
      Finset.Subset.antisymm hEraseSub hUsubErase
    have hEraseCard := Finset.card_erase_of_mem C.q_mem_A
    have hcardTwelve : D.A.card = 12 := by
      rw [hEraseEqU] at hEraseCard
      omega
    have hUcardEleven : U.card = 11 := by
      rw [hEraseEqU] at hEraseCard
      omega
    cases N.alternative with
    | physical hretainedK₂ packet =>
        exact ⟨.exactTwelveTightPhysical hcardTwelve
          (by simpa [U] using hUcardEleven)
          (by simpa [U] using hEraseEqU) hretainedK₂ packet⟩
    | fiveIncidence packet =>
        have hretainedK₂ : N.retained ∈ N.secondApexClass.support := by
          rw [← packet.row₂_support_eq]
          exact packet.a_mem_row₂
        have hinterNonempty :
            ((N.firstApexClass.support ∪ N.blockerClass.support) ∩
              N.secondApexClass.support).Nonempty :=
          ⟨N.retained, Finset.mem_inter.mpr
            ⟨Finset.mem_union.mpr
              (Or.inl N.retained_mem_firstApexClass), hretainedK₂⟩⟩
        have hinterCard :
            1 ≤ ((N.firstApexClass.support ∪ N.blockerClass.support) ∩
              N.secondApexClass.support).card :=
          Finset.one_le_card.mpr hinterNonempty
        have hsum := Finset.card_union_add_card_inter
          (N.firstApexClass.support ∪ N.blockerClass.support)
          N.secondApexClass.support
        have hUleTen : U.card ≤ 10 := by
          rw [N.secondApexClass.support_card] at hsum
          dsimp [U]
          omega
        omega
  · rw [Finset.not_subset] at hEraseSub
    rcases hEraseSub with ⟨fresh, hfreshErase, hfreshU⟩
    have hfreshA : fresh ∈ D.A := (Finset.mem_erase.mp hfreshErase).2
    have hfreshNeDeleted : fresh ≠ deleted :=
      (Finset.mem_erase.mp hfreshErase).1
    have hfreshK₀ : fresh ∉ N.firstApexClass.support := by
      intro hfresh
      exact hfreshU (Finset.mem_union.mpr
        (Or.inl (Finset.mem_union.mpr (Or.inl hfresh))))
    have hfreshK₁ : fresh ∉ N.blockerClass.support := by
      intro hfresh
      exact hfreshU (Finset.mem_union.mpr
        (Or.inl (Finset.mem_union.mpr (Or.inr hfresh))))
    have hfreshK₂ : fresh ∉ N.secondApexClass.support := by
      intro hfresh
      exact hfreshU (Finset.mem_union.mpr (Or.inr hfresh))
    let packet :=
      (nonempty_threeCenterCommonDeletionExactRows_of_omitted_selectedFourClasses
        hfreshA N.freshThreeCenter.center₀_mem_A
        N.freshThreeCenter.center₁_mem_A N.freshThreeCenter.center₂_mem_A
        N.freshThreeCenter.center₀_ne_center₁
        N.freshThreeCenter.center₀_ne_center₂
        N.freshThreeCenter.center₁_ne_center₂
        N.firstApexClass N.blockerClass N.secondApexClass
        hfreshK₀ hfreshK₁ hfreshK₂).some
    exact ⟨.distinctFresh fresh hfreshNeDeleted packet⟩

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
