/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueArmDeletionNormalForm
import card_five_interior_bisector_localization
import card_five_interior_critical_frontier

/-!
# Source-clean dispatcher for the original unique-radius frontier arm

This module refines `OriginalFrontierUniqueRadiusArm` into the three honest
direct-`False` leaves:

* exact four, with universal first-apex deletion criticality and a strict-cap
  interior pair;
* exact five with distinct actual blockers, carrying the T5 directed
  cross-deletion survival; and
* exact five with a coincident actual blocker, carrying mutual cross
  membership, the T1 strict-cap localization, and the D no-third-bisector
  conclusion.

No terminal occurrence is assumed and no leaf is claimed contradictory here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueArmRouteAuditScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress
open ATailUniqueRowProducerScratch

attribute [local instance] Classical.propDecidable

/-- The exact-four direct-`False` leaf, retaining every public parent field
and the strongest source-clean local geometry currently available. -/
structure OriginalUniqueFourResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) where
  minimal : D.Minimal
  noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44
  carrier_card_gt_nine : 9 < D.A.card
  class_card_eq_four :
    (SelectedClass D.A S.oppApex1 radius).card = 4
  unique_K4_radius : ∀ rho : ℝ, 0 < rho →
    4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius
  every_class_member_blocks : ∀ x : ℝ²,
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

/-- Common exact-five parent data after the source-valid strict-interior pair
has been reselected. -/
structure OriginalUniqueFiveInteriorResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) where
  minimal : D.Minimal
  noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44
  carrier_card_gt_nine : 9 < D.A.card
  class_card_eq_five :
    (SelectedClass D.A S.oppApex1 radius).card = 5
  unique_K4_radius : ∀ rho : ℝ, 0 < rho →
    4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius
  firstApex_fullyDeletionRobust : FullyDeletionRobustAt D S.oppApex1
  originalPair_doubleDeletion_blocks :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1
  interior : CardFiveInteriorCriticalPairFrontierPacket D S radius H
  interiorPair_doubleDeletion_blocks :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase interior.frontier.pair.q).erase
        interior.frontier.pair.w) S.oppApex1

/-- Exact five with distinct actual blockers. T5 supplies a directed
cross-deletion survival without assuming any positive cross incidence. -/
structure OriginalUniqueFiveDistinctBlockersResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) where
  base : OriginalUniqueFiveInteriorResidual F
  blockers_ne :
    H.centerAt base.interior.frontier.pair.q
        base.interior.frontier.pair.q_mem_A ≠
      H.centerAt base.interior.frontier.pair.w
        base.interior.frontier.pair.w_mem_A
  directed_cross_deletion_survival :
    HasNEquidistantPointsAt 4
        (D.A.erase base.interior.frontier.pair.w)
        (H.centerAt base.interior.frontier.pair.q
          base.interior.frontier.pair.q_mem_A) ∨
      HasNEquidistantPointsAt 4
        (D.A.erase base.interior.frontier.pair.q)
        (H.centerAt base.interior.frontier.pair.w
          base.interior.frontier.pair.w_mem_A)

/-- Exact five with one common actual blocker. The retained fields are the
positive mutual membership, T1 localization of that blocker, and D's complete
exclusion of a third carrier bisector center. -/
structure OriginalUniqueFiveCoincidentBlockerResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) where
  base : OriginalUniqueFiveInteriorResidual F
  blockers_eq :
    H.centerAt base.interior.frontier.pair.q
        base.interior.frontier.pair.q_mem_A =
      H.centerAt base.interior.frontier.pair.w
        base.interior.frontier.pair.w_mem_A
  mutual_cross_membership :
    base.interior.frontier.pair.w ∈
        (H.selectedAt base.interior.frontier.pair.q
          base.interior.frontier.pair.q_mem_A).toCriticalFourShell.support ∧
      base.interior.frontier.pair.q ∈
        (H.selectedAt base.interior.frontier.pair.w
          base.interior.frontier.pair.w_mem_A).toCriticalFourShell.support
  commonBlocker_mem_interior :
    H.centerAt base.interior.frontier.pair.q
        base.interior.frontier.pair.q_mem_A ∈
      S.capInteriorByIndex S.oppIndex1
  commonBlocker_not_mem_surplus :
    H.centerAt base.interior.frontier.pair.q
        base.interior.frontier.pair.q_mem_A ∉ S.surplusCap
  no_third_carrier_bisector : ∀ x : ℝ², x ∈ D.A →
    x ≠ S.oppApex1 →
    x ≠ H.centerAt base.interior.frontier.pair.q
        base.interior.frontier.pair.q_mem_A →
    dist x base.interior.frontier.pair.q ≠
      dist x base.interior.frontier.pair.w

/-- The exact live three-leaf decomposition. This is the strongest checked
source-clean public dispatcher; proving `False` for each result is precisely
the remaining mathematical work. -/
theorem originalUniqueRadiusArm_residual_dispatch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hunique : OriginalFrontierUniqueRadiusArm F) :
    Nonempty (OriginalUniqueFourResidual F) ∨
      Nonempty (OriginalUniqueFiveDistinctBlockersResidual F) ∨
      Nonempty (OriginalUniqueFiveCoincidentBlockerResidual F) := by
  have hr : 0 < radius := frontier_radius_pos F
  rcases hunique with ⟨hcard45, huniqueRadius⟩
  rcases hcard45 with hfour | hfive
  · rcases exists_cardFour_interior_pair D S hr hfour with
      ⟨q, w, hq, hw, hqw⟩
    have hblocks :=
      uniqueFour_every_classMember_blocks_firstApex hfour huniqueRadius
    have hlocal : ∀ c : ℝ², c ∈ D.A → c ≠ S.oppApex1 →
        dist c q = dist c w →
        c ∈ S.capInteriorByIndex S.oppIndex1 := by
      intro c hcA hcApex hcEq
      exact interior_pair_bisector_center_mem_capInterior
        hq hw hqw hcA hcApex hcEq
    exact Or.inl ⟨{
      minimal := hmin
      noM44 := hNoM44
      carrier_card_gt_nine := hcard
      class_card_eq_four := hfour
      unique_K4_radius := huniqueRadius
      every_class_member_blocks := hblocks
      interior_q := q
      interior_w := w
      interior_q_mem := hq
      interior_w_mem := hw
      interior_q_ne_w := hqw
      bisector_center_mem_interior := hlocal }⟩
  · rcases exists_cardFiveInteriorCriticalPairFrontier D S H hr hfive with
      ⟨P⟩
    have hrobust : FullyDeletionRobustAt D S.oppApex1 :=
      uniqueFive_firstApex_fullyDeletionRobust F hfive
    have hdoubleOriginal :
        ¬ HasNEquidistantPointsAt 4
          ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1 :=
      uniqueArm_retainedPair_doubleDeletion_blocks_firstApex F
        (Or.inr hfive) huniqueRadius
    have hdoubleInterior :
        ¬ HasNEquidistantPointsAt 4
          ((D.A.erase P.frontier.pair.q).erase P.frontier.pair.w)
            S.oppApex1 :=
      uniqueArm_retainedPair_doubleDeletion_blocks_firstApex P.frontier
        (Or.inr hfive) huniqueRadius
    let base : OriginalUniqueFiveInteriorResidual F := {
      minimal := hmin
      noM44 := hNoM44
      carrier_card_gt_nine := hcard
      class_card_eq_five := hfive
      unique_K4_radius := huniqueRadius
      firstApex_fullyDeletionRobust := hrobust
      originalPair_doubleDeletion_blocks := hdoubleOriginal
      interior := P
      interiorPair_doubleDeletion_blocks := hdoubleInterior }
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
            S.capInteriorByIndex S.oppIndex1 := by
        simpa using P.interiorPair.q_mem
      have hwInterior :
          P.frontier.pair.w ∈ SelectedClass D.A S.oppApex1 radius ∩
            S.capInteriorByIndex S.oppIndex1 := by
        simpa using P.interiorPair.w_mem
      have hcInterior :
          H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A ∈
            S.capInteriorByIndex S.oppIndex1 :=
        interior_pair_bisector_center_mem_capInterior
          hqInterior hwInterior P.frontier.pair.q_ne_w hcA hcNe hcEq
      have hcNotSurplus :
          H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A ∉
            S.surplusCap :=
        interior_pair_bisector_center_not_mem_surplusCap
          hqInterior hwInterior P.frontier.pair.q_ne_w hcA hcNe hcEq
      have hthird : ∀ x : ℝ², x ∈ D.A →
          x ≠ S.oppApex1 →
          x ≠ H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A →
          dist x P.frontier.pair.q ≠ dist x P.frontier.pair.w := by
        intro x hxA hxApex hxBlocker
        exact coincident_blocker_no_third_bisector_center
          P.frontier.pair hr hfive hcenters hxA hxApex hxBlocker
      exact Or.inr (Or.inr ⟨{
        base := base
        blockers_eq := hcenters
        mutual_cross_membership := hmutual
        commonBlocker_mem_interior := hcInterior
        commonBlocker_not_mem_surplus := hcNotSurplus
        no_third_carrier_bisector := hthird }⟩)
    · have hsurvival := cross_survival_of_distinct_blockers
        P.frontier.pair hr (by omega) hcenters
      exact Or.inr (Or.inl ⟨{
        base := base
        blockers_ne := hcenters
        directed_cross_deletion_survival := hsurvival }⟩)

#print axioms originalUniqueRadiusArm_residual_dispatch

end ATailUniqueArmRouteAuditScratch
end Problem97
