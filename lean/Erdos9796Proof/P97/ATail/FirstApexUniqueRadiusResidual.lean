/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FirstApexExactFiveInteriorFrontier
import Erdos9796Proof.P97.ATail.FirstApexInteriorPairGeometry
import Erdos9796Proof.P97.ATail.MinimalAdmissibleInteriorPair
import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress

/-!
# First-apex unique-radius residual cases

The protected first-apex unique-radius alternative has three source-clean
residual cases:

* an exact four-point class with universal singleton-deletion obstruction
  and a strict-interior pair;
* an exact five-point class whose reselected pair has distinct obstruction
  centers; and
* an exact five-point class whose reselected pair has a common obstruction
  center.

The theorem at the end derives this exhaustive trichotomy from the production
frontier data.  It does not claim that any of the three cases is contradictory.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FirstApexUniqueRadiusResidual

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress
open FirstApexExactFiveInteriorFrontier
open FirstApexInteriorPairGeometry

attribute [local instance] Classical.propDecidable

private theorem q_mem_firstApex_class
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.q_mem_marginal with ⟨hqFilter, _⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr ⟨hqA, by simpa only [dist_comm] using hqRadius⟩

private theorem w_mem_firstApex_class
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.w ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.w_mem_marginal with ⟨hwFilter, _⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
  exact mem_selectedClass.mpr ⟨hwA, by simpa only [dist_comm] using hwRadius⟩

private theorem everyClassMember_obstructsFirstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (hcard : (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius) :
    ∀ x : ℝ², x ∈ SelectedClass D.A S.oppApex1 radius →
      ¬ HasNEquidistantPointsAt 4 (D.A.erase x) S.oppApex1 := by
  intro x hx hsurvives
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hsurvives with
    ⟨rho, hrho, hfourErase⟩
  have hfourFull : 4 ≤ (SelectedClass D.A S.oppApex1 rho).card := by
    refine hfourErase.trans (Finset.card_le_card ?_)
    intro z hz
    rcases mem_selectedClass.mp hz with ⟨hzErase, hzdist⟩
    exact mem_selectedClass.mpr ⟨Finset.mem_of_mem_erase hzErase, hzdist⟩
  have hrho : rho = radius := hunique rho hrho hfourFull
  subst rho
  rw [selectedClass_erase_eq, Finset.card_erase_of_mem hx, hcard] at hfourErase
  omega

private theorem firstApex_fullyDeletionRobust_of_exactFive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hcard : (SelectedClass D.A S.oppApex1 radius).card = 5) :
    FullyDeletionRobustAt D S.oppApex1 := by
  exact fullyDeletionRobustAt_of_five_le_selectedClass
    F.radius_pos (by omega)

/-- A retained production pair obstructs simultaneous deletion at the first
apex whenever the only four-or-larger first-apex radius is the retained one. -/
theorem retainedPair_doubleDeletion_obstructsFirstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hcard : (SelectedClass D.A S.oppApex1 radius).card = 4 ∨
      (SelectedClass D.A S.oppApex1 radius).card = 5)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius) :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1 := by
  intro hsurvives
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hsurvives with
    ⟨rho, hrho, hfourErase⟩
  have hfourFull : 4 ≤ (SelectedClass D.A S.oppApex1 rho).card := by
    refine hfourErase.trans (Finset.card_le_card ?_)
    intro z hz
    rcases mem_selectedClass.mp hz with ⟨hzErase, hzdist⟩
    exact mem_selectedClass.mpr ⟨
      Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hzErase), hzdist⟩
  have hrho : rho = radius := hunique rho hrho hfourFull
  subst rho
  have hq := q_mem_firstApex_class F
  have hw := w_mem_firstApex_class F
  have hwErase :
      F.pair.w ∈ (SelectedClass D.A S.oppApex1 radius).erase F.pair.q :=
    Finset.mem_erase.mpr ⟨F.pair.q_ne_w.symm, hw⟩
  rw [selectedClass_erase_eq, selectedClass_erase_eq,
    Finset.card_erase_of_mem hwErase,
    Finset.card_erase_of_mem hq] at hfourErase
  rcases hcard with hfour | hfive <;> omega

/-- Exact four-point residual of the first-apex unique-radius alternative. -/
structure FirstApexUniqueRadiusExactFourResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) where
  minimal : D.Minimal
  noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44
  carrier_card_gt_nine : 9 < D.A.card
  class_card_eq_four :
    (SelectedClass D.A S.oppApex1 radius).card = 4
  unique_fourClass_radius : ∀ rho : ℝ, 0 < rho →
    4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius
  every_class_member_obstructs : ∀ x : ℝ²,
    x ∈ SelectedClass D.A S.oppApex1 radius →
      ¬ HasNEquidistantPointsAt 4 (D.A.erase x) S.oppApex1
  interior_q : ℝ²
  interior_w : ℝ²
  interior_q_mem :
    interior_q ∈ SelectedClass D.A S.oppApex1 radius ∩
      S.capInteriorByIndex S.oppIndex1
  interior_w_mem :
    interior_w ∈ SelectedClass D.A S.oppApex1 radius ∩
      S.capInteriorByIndex S.oppIndex1
  interior_q_ne_w : interior_q ≠ interior_w
  bisector_center_mem_interior : ∀ c : ℝ², c ∈ D.A →
    c ≠ S.oppApex1 →
    dist c interior_q = dist c interior_w →
    c ∈ S.capInteriorByIndex S.oppIndex1

/-- Exact five-point residual with distinct selected obstruction centers. -/
structure FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) where
  minimal : D.Minimal
  noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44
  carrier_card_gt_nine : 9 < D.A.card
  class_card_eq_five :
    (SelectedClass D.A S.oppApex1 radius).card = 5
  unique_fourClass_radius : ∀ rho : ℝ, 0 < rho →
    4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius
  firstApex_fullyDeletionRobust : FullyDeletionRobustAt D S.oppApex1
  originalPair_doubleDeletion_obstructs :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1
  interior : ExactFiveInteriorCriticalPairFrontier D S radius H
  interiorPair_doubleDeletion_obstructs :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase interior.frontier.pair.q).erase
        interior.frontier.pair.w) S.oppApex1
  obstructionCenters_ne :
    H.centerAt interior.frontier.pair.q interior.frontier.pair.q_mem_A ≠
      H.centerAt interior.frontier.pair.w interior.frontier.pair.w_mem_A
  directed_crossDeletion_survival :
    HasNEquidistantPointsAt 4
        (D.A.erase interior.frontier.pair.w)
        (H.centerAt interior.frontier.pair.q
          interior.frontier.pair.q_mem_A) ∨
      HasNEquidistantPointsAt 4
        (D.A.erase interior.frontier.pair.q)
        (H.centerAt interior.frontier.pair.w
          interior.frontier.pair.w_mem_A)

/-- Exact five-point residual with one common selected obstruction center. -/
structure FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) where
  minimal : D.Minimal
  noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44
  carrier_card_gt_nine : 9 < D.A.card
  class_card_eq_five :
    (SelectedClass D.A S.oppApex1 radius).card = 5
  unique_fourClass_radius : ∀ rho : ℝ, 0 < rho →
    4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius
  firstApex_fullyDeletionRobust : FullyDeletionRobustAt D S.oppApex1
  originalPair_doubleDeletion_obstructs :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1
  interior : ExactFiveInteriorCriticalPairFrontier D S radius H
  interiorPair_doubleDeletion_obstructs :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase interior.frontier.pair.q).erase
        interior.frontier.pair.w) S.oppApex1
  obstructionCenters_eq :
    H.centerAt interior.frontier.pair.q interior.frontier.pair.q_mem_A =
      H.centerAt interior.frontier.pair.w interior.frontier.pair.w_mem_A
  mutual_cross_membership :
    interior.frontier.pair.w ∈
        (H.selectedAt interior.frontier.pair.q
          interior.frontier.pair.q_mem_A).toCriticalFourShell.support ∧
      interior.frontier.pair.q ∈
        (H.selectedAt interior.frontier.pair.w
          interior.frontier.pair.w_mem_A).toCriticalFourShell.support
  commonObstructionCenter_mem_interior :
    H.centerAt interior.frontier.pair.q interior.frontier.pair.q_mem_A ∈
      S.capInteriorByIndex S.oppIndex1
  commonObstructionCenter_not_mem_surplus :
    H.centerAt interior.frontier.pair.q interior.frontier.pair.q_mem_A ∉
      S.surplusCap
  no_third_carrier_bisector : ∀ x : ℝ², x ∈ D.A →
    x ≠ S.oppApex1 →
    x ≠ H.centerAt interior.frontier.pair.q
        interior.frontier.pair.q_mem_A →
    dist x interior.frontier.pair.q ≠
      dist x interior.frontier.pair.w

/-- The distinct-center exact-five residual together with custody of the
minimum admissible source pair from which it was built. -/
structure FirstApexUniqueRadiusExactFiveMinimalDistinctResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) where
  residual :
    FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F
  minimalPair : MinimalAdmissibleInteriorPair D S radius H
  source_eq : minimalPair.frontier = residual.interior

/-- The common-center exact-five residual together with custody of the
minimum admissible source pair from which it was built.  An adaptive
reselection must not transfer this equality to its newly selected pair. -/
structure FirstApexUniqueRadiusExactFiveMinimalCommonResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) where
  residual :
    FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F
  minimalPair : MinimalAdmissibleInteriorPair D S radius H
  source_eq : minimalPair.frontier = residual.interior

/-- Exhaustive source-clean residual cases for the protected first-apex
unique-radius alternative. -/
theorem firstApexUniqueRadius_residualCases
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hunique : OriginalFrontierUniqueRadiusArm F) :
    Nonempty (FirstApexUniqueRadiusExactFourResidual F) ∨
      Nonempty
        (FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) ∨
      Nonempty
        (FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) := by
  have hr : 0 < radius := F.radius_pos
  rcases hunique with ⟨hcard45, huniqueRadius⟩
  rcases hcard45 with hfour | hfive
  · rcases exists_exactFour_firstApex_interiorPair D S hr hfour with
      ⟨q, w, hq, hw, hqw⟩
    have hobstructs :=
      everyClassMember_obstructsFirstApex hfour huniqueRadius
    have hlocal : ∀ c : ℝ², c ∈ D.A → c ≠ S.oppApex1 →
        dist c q = dist c w →
        c ∈ S.capInteriorByIndex S.oppIndex1 := by
      intro c hcA hcApex hcEq
      exact bisectorCenter_mem_firstApexInterior
        hq hw hqw hcA hcApex hcEq
    exact Or.inl ⟨{
      minimal := hmin
      noM44 := hNoM44
      carrier_card_gt_nine := hcard
      class_card_eq_four := hfour
      unique_fourClass_radius := huniqueRadius
      every_class_member_obstructs := hobstructs
      interior_q := q
      interior_w := w
      interior_q_mem := hq
      interior_w_mem := hw
      interior_q_ne_w := hqw
      bisector_center_mem_interior := hlocal }⟩
  · rcases nonempty_exactFiveInteriorCriticalPairFrontier D S H hr hfive with
      ⟨P⟩
    have hrobust : FullyDeletionRobustAt D S.oppApex1 :=
      firstApex_fullyDeletionRobust_of_exactFive F hfive
    have hdoubleOriginal :
        ¬ HasNEquidistantPointsAt 4
          ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1 :=
      retainedPair_doubleDeletion_obstructsFirstApex F
        (Or.inr hfive) huniqueRadius
    have hdoubleInterior :
        ¬ HasNEquidistantPointsAt 4
          ((D.A.erase P.frontier.pair.q).erase P.frontier.pair.w)
            S.oppApex1 :=
      retainedPair_doubleDeletion_obstructsFirstApex P.frontier
        (Or.inr hfive) huniqueRadius
    by_cases hcenters :
        H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A =
          H.centerAt P.frontier.pair.w P.frontier.pair.w_mem_A
    · have hmutual :=
        (blocker_centers_eq_iff_mutual_cross_membership_of_five_le
          P.frontier.pair hr (by omega)).mp hcenters
      let K :=
        (H.selectedAt P.frontier.pair.q
          P.frontier.pair.q_mem_A).toCriticalFourShell
      have hcA :
          H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A ∈ D.A := by
        exact (Finset.mem_erase.mp K.center_mem).2
      have hcNe :
          H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A ≠
            S.oppApex1 :=
        actual_blocker_ne_of_deletion_survives H
          P.frontier.pair.q_mem_A
          (hrobust.survives P.frontier.pair.q P.frontier.pair.q_mem_A)
      have hcEq :
          dist (H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A)
              P.frontier.pair.q =
            dist (H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A)
              P.frontier.pair.w := by
        exact K.support_eq_radius P.frontier.pair.q K.q_mem_support |>.trans
          (K.support_eq_radius P.frontier.pair.w hmutual.1).symm
      have hqInterior :
          P.frontier.pair.q ∈ SelectedClass D.A S.oppApex1 radius ∩
            S.capInteriorByIndex S.oppIndex1 :=
        P.q_mem_interior
      have hwInterior :
          P.frontier.pair.w ∈ SelectedClass D.A S.oppApex1 radius ∩
            S.capInteriorByIndex S.oppIndex1 :=
        P.w_mem_interior
      have hcInterior :
          H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A ∈
            S.capInteriorByIndex S.oppIndex1 :=
        bisectorCenter_mem_firstApexInterior
          hqInterior hwInterior P.frontier.pair.q_ne_w hcA hcNe hcEq
      have hcNotSurplus :
          H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A ∉
            S.surplusCap :=
        bisectorCenter_not_mem_surplusCap
          hqInterior hwInterior P.frontier.pair.q_ne_w hcA hcNe hcEq
      have hthird : ∀ x : ℝ², x ∈ D.A →
          x ≠ S.oppApex1 →
          x ≠ H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A →
          dist x P.frontier.pair.q ≠ dist x P.frontier.pair.w := by
        intro x hxA hxApex hxObstruction
        exact no_third_bisectorCenter_of_obstructionCenters_eq
          P.frontier.pair hr hfive hcenters hxA hxApex hxObstruction
      exact Or.inr (Or.inr ⟨{
        minimal := hmin
        noM44 := hNoM44
        carrier_card_gt_nine := hcard
        class_card_eq_five := hfive
        unique_fourClass_radius := huniqueRadius
        firstApex_fullyDeletionRobust := hrobust
        originalPair_doubleDeletion_obstructs := hdoubleOriginal
        interior := P
        interiorPair_doubleDeletion_obstructs := hdoubleInterior
        obstructionCenters_eq := hcenters
        mutual_cross_membership := hmutual
        commonObstructionCenter_mem_interior := hcInterior
        commonObstructionCenter_not_mem_surplus := hcNotSurplus
        no_third_carrier_bisector := hthird }⟩)
    · have hsurvival := crossDeletion_survives_of_obstructionCenters_ne
        P.frontier.pair hr (by omega) hcenters
      exact Or.inr (Or.inl ⟨{
        minimal := hmin
        noM44 := hNoM44
        carrier_card_gt_nine := hcard
        class_card_eq_five := hfive
        unique_fourClass_radius := huniqueRadius
        firstApex_fullyDeletionRobust := hrobust
        originalPair_doubleDeletion_obstructs := hdoubleOriginal
        interior := P
        interiorPair_doubleDeletion_obstructs := hdoubleInterior
        obstructionCenters_ne := hcenters
        directed_crossDeletion_survival := hsurvival }⟩)

/-- The exact-five source split with minimum-pair custody retained.  This is
the source-facing producer for consumers that use chord minimality; the
ordinary residual split above remains available to callers that do not need
that provenance. -/
theorem firstApexUniqueRadius_exactFive_minimalResidualCases
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hfive : (SelectedClass D.A S.oppApex1 radius).card = 5)
    (huniqueRadius : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius) :
    Nonempty (FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F) ∨
      Nonempty (FirstApexUniqueRadiusExactFiveMinimalCommonResidual F) := by
  have hr : 0 < radius := F.radius_pos
  rcases nonempty_minimalAdmissibleInteriorPair D S H hr hfive with ⟨M⟩
  let P := M.frontier
  have hrobust : FullyDeletionRobustAt D S.oppApex1 :=
    firstApex_fullyDeletionRobust_of_exactFive F hfive
  have hdoubleOriginal :
      ¬ HasNEquidistantPointsAt 4
        ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1 :=
    retainedPair_doubleDeletion_obstructsFirstApex F
      (Or.inr hfive) huniqueRadius
  have hdoubleInterior :
      ¬ HasNEquidistantPointsAt 4
        ((D.A.erase P.frontier.pair.q).erase P.frontier.pair.w)
          S.oppApex1 :=
    retainedPair_doubleDeletion_obstructsFirstApex P.frontier
      (Or.inr hfive) huniqueRadius
  by_cases hcenters :
      H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A =
        H.centerAt P.frontier.pair.w P.frontier.pair.w_mem_A
  · have hmutual :=
      (blocker_centers_eq_iff_mutual_cross_membership_of_five_le
        P.frontier.pair hr (by omega)).mp hcenters
    let K :=
      (H.selectedAt P.frontier.pair.q
        P.frontier.pair.q_mem_A).toCriticalFourShell
    have hcA :
        H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A ∈ D.A :=
      (Finset.mem_erase.mp K.center_mem).2
    have hcNe :
        H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A ≠
          S.oppApex1 :=
      actual_blocker_ne_of_deletion_survives H
        P.frontier.pair.q_mem_A
        (hrobust.survives P.frontier.pair.q P.frontier.pair.q_mem_A)
    have hcEq :
        dist (H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A)
            P.frontier.pair.q =
          dist (H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A)
            P.frontier.pair.w :=
      (K.support_eq_radius P.frontier.pair.q K.q_mem_support).trans
        (K.support_eq_radius P.frontier.pair.w hmutual.1).symm
    have hcInterior :
        H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A ∈
          S.capInteriorByIndex S.oppIndex1 :=
      bisectorCenter_mem_firstApexInterior
        P.q_mem_interior P.w_mem_interior P.frontier.pair.q_ne_w
        hcA hcNe hcEq
    have hcNotSurplus :
        H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A ∉
          S.surplusCap :=
      bisectorCenter_not_mem_surplusCap
        P.q_mem_interior P.w_mem_interior P.frontier.pair.q_ne_w
        hcA hcNe hcEq
    have hthird : ∀ x : ℝ², x ∈ D.A →
        x ≠ S.oppApex1 →
        x ≠ H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A →
        dist x P.frontier.pair.q ≠ dist x P.frontier.pair.w := by
      intro x hxA hxApex hxObstruction
      exact no_third_bisectorCenter_of_obstructionCenters_eq
        P.frontier.pair hr hfive hcenters hxA hxApex hxObstruction
    let Rcommon :
        FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F := {
      minimal := hmin
      noM44 := hNoM44
      carrier_card_gt_nine := hcard
      class_card_eq_five := hfive
      unique_fourClass_radius := huniqueRadius
      firstApex_fullyDeletionRobust := hrobust
      originalPair_doubleDeletion_obstructs := hdoubleOriginal
      interior := P
      interiorPair_doubleDeletion_obstructs := hdoubleInterior
      obstructionCenters_eq := hcenters
      mutual_cross_membership := hmutual
      commonObstructionCenter_mem_interior := hcInterior
      commonObstructionCenter_not_mem_surplus := hcNotSurplus
      no_third_carrier_bisector := hthird }
    exact Or.inr ⟨{
      residual := Rcommon
      minimalPair := M
      source_eq := by rfl }⟩
  · have hsurvival := crossDeletion_survives_of_obstructionCenters_ne
      P.frontier.pair hr (by omega) hcenters
    let Rdistinct :
        FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F := {
      minimal := hmin
      noM44 := hNoM44
      carrier_card_gt_nine := hcard
      class_card_eq_five := hfive
      unique_fourClass_radius := huniqueRadius
      firstApex_fullyDeletionRobust := hrobust
      originalPair_doubleDeletion_obstructs := hdoubleOriginal
      interior := P
      interiorPair_doubleDeletion_obstructs := hdoubleInterior
      obstructionCenters_ne := hcenters
      directed_crossDeletion_survival := hsurvival }
    exact Or.inl ⟨{
      residual := Rdistinct
      minimalPair := M
      source_eq := by rfl }⟩

/-- The full unique-radius split with minimum-pair custody retained on both
exact-five source branches. -/
theorem firstApexUniqueRadius_minimalResidualCases
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hunique : OriginalFrontierUniqueRadiusArm F) :
    Nonempty (FirstApexUniqueRadiusExactFourResidual F) ∨
      Nonempty (FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F) ∨
      Nonempty (FirstApexUniqueRadiusExactFiveMinimalCommonResidual F) := by
  have hr : 0 < radius := F.radius_pos
  rcases hunique with ⟨hcard45, huniqueRadius⟩
  rcases hcard45 with hfour | hfive
  · rcases exists_exactFour_firstApex_interiorPair D S hr hfour with
      ⟨q, w, hq, hw, hqw⟩
    have hobstructs :=
      everyClassMember_obstructsFirstApex hfour huniqueRadius
    have hlocal : ∀ c : ℝ², c ∈ D.A → c ≠ S.oppApex1 →
        dist c q = dist c w →
        c ∈ S.capInteriorByIndex S.oppIndex1 := by
      intro c hcA hcApex hcEq
      exact bisectorCenter_mem_firstApexInterior
        hq hw hqw hcA hcApex hcEq
    exact Or.inl ⟨{
      minimal := hmin
      noM44 := hNoM44
      carrier_card_gt_nine := hcard
      class_card_eq_four := hfour
      unique_fourClass_radius := huniqueRadius
      every_class_member_obstructs := hobstructs
      interior_q := q
      interior_w := w
      interior_q_mem := hq
      interior_w_mem := hw
      interior_q_ne_w := hqw
      bisector_center_mem_interior := hlocal }⟩
  · rcases firstApexUniqueRadius_exactFive_minimalResidualCases
      F hmin hNoM44 hcard hfive huniqueRadius with hdistinct | hcommon
    · exact Or.inr (Or.inl hdistinct)
    · exact Or.inr (Or.inr hcommon)

end FirstApexUniqueRadiusResidual
end Problem97
