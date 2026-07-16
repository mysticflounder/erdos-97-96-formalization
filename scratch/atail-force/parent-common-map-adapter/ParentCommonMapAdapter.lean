/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# Parent common-critical-map adapter

This scratch module pins the coherent surface available in
`u1_largeCap_routeB_tail_false` immediately after its concrete
`CriticalShellSystem` witness is chosen.  It performs only routine transport:

* the five named U1 rows and the additional `f2` row are built from the same
  retained system;
* the production `CriticalPairFrontier` is extracted for the exact
  `leafSurplusPacket`; and
* the two actual source rows give a branch-complete normal form: a directed
  cross-radius equality in either row, or reciprocal cross-deletion survival.

The reciprocal-survival arm is sharpened to the strongest consequences already
available from production theorems.  No geometric closing producer is assumed.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILParentCommonMapAdapter

open ATailCriticalPairFrontier
open ATAILStageOnePrescribedApexDichotomy
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- The complete assumption-free normal form on the reciprocal cross-survival
arm.  Besides the two survival facts, it records their exact support/radius
meaning and all pairwise center separations already forced by the frontier.

The separation from the first apex does not need a card-five hypothesis:
cross survival makes the two source distances at the blocker unequal, whereas
the frontier pair is co-radial at the first apex.
-/
structure ReciprocalCrossSurvivalPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H) : Prop where
  qCrossSurvives :
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
      (H.centerAt F.pair.q F.pair.q_mem_A)
  wCrossSurvives :
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
      (H.centerAt F.pair.w F.pair.w_mem_A)
  w_not_mem_qSupport :
    F.pair.w ∉
      (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support
  q_not_mem_wSupport :
    F.pair.q ∉
      (H.selectedAt F.pair.w F.pair.w_mem_A).toCriticalFourShell.support
  qBlocker_ne_oppApex1 :
    H.centerAt F.pair.q F.pair.q_mem_A ≠ S.oppApex1
  wBlocker_ne_oppApex1 :
    H.centerAt F.pair.w F.pair.w_mem_A ≠ S.oppApex1
  qBlocker_ne_oppApex2 :
    H.centerAt F.pair.q F.pair.q_mem_A ≠ S.oppApex2
  wBlocker_ne_oppApex2 :
    H.centerAt F.pair.w F.pair.w_mem_A ≠ S.oppApex2
  blockers_ne :
    H.centerAt F.pair.q F.pair.q_mem_A ≠
      H.centerAt F.pair.w F.pair.w_mem_A
  selectedSupports_inter_card_le_two :
    (((H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support ∩
      (H.selectedAt F.pair.w F.pair.w_mem_A).toCriticalFourShell.support).card
        ≤ 2)
  qCrossRadius_ne :
    dist (H.centerAt F.pair.q F.pair.q_mem_A) F.pair.w ≠
      dist (H.centerAt F.pair.q F.pair.q_mem_A) F.pair.q
  wCrossRadius_ne :
    dist (H.centerAt F.pair.w F.pair.w_mem_A) F.pair.q ≠
      dist (H.centerAt F.pair.w F.pair.w_mem_A) F.pair.w
  qSurvivingClass_exact_and_unique :
    SelectedClass (D.A.erase F.pair.w)
        (H.centerAt F.pair.q F.pair.q_mem_A)
        (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.radius =
      (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support ∧
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass (D.A.erase F.pair.w)
        (H.centerAt F.pair.q F.pair.q_mem_A) rho).card →
      rho =
        (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.radius
  wSurvivingClass_exact_and_unique :
    SelectedClass (D.A.erase F.pair.q)
        (H.centerAt F.pair.w F.pair.w_mem_A)
        (H.selectedAt F.pair.w F.pair.w_mem_A).toCriticalFourShell.radius =
      (H.selectedAt F.pair.w F.pair.w_mem_A).toCriticalFourShell.support ∧
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass (D.A.erase F.pair.q)
        (H.centerAt F.pair.w F.pair.w_mem_A) rho).card →
      rho =
        (H.selectedAt F.pair.w F.pair.w_mem_A).toCriticalFourShell.radius

/-- The branch-complete theorem-facing output on one retained frontier.

The first two alternatives are the exact directed row extensions.  If neither
extension holds, the selected exact rows themselves survive the opposite
deletions, and all routine robust consequences are retained in the third arm.
-/
def CrossEqualityOrReciprocalSurvival
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H) : Prop :=
  dist (H.centerAt F.pair.q F.pair.q_mem_A) F.pair.q =
      dist (H.centerAt F.pair.q F.pair.q_mem_A) F.pair.w ∨
    dist (H.centerAt F.pair.w F.pair.w_mem_A) F.pair.w =
      dist (H.centerAt F.pair.w F.pair.w_mem_A) F.pair.q ∨
    ReciprocalCrossSurvivalPacket F

private def swapPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    SurvivorPairRelocationPacket D S r H where
  q := P.w
  w := P.q
  q_mem_A := P.w_mem_A
  w_mem_A := P.q_mem_A
  q_mem_marginal := P.w_mem_marginal
  w_mem_marginal := P.q_mem_marginal
  q_ne_w := P.q_ne_w.symm
  q_survives := P.w_survives
  w_survives := P.q_survives
  q_blocker_ne_oppApex2 := P.w_blocker_ne_oppApex2
  w_blocker_ne_oppApex2 := P.q_blocker_ne_oppApex2

private theorem firstApex_pair_dist_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    dist S.oppApex1 P.w = dist S.oppApex1 P.q := by
  have hq : dist P.q S.oppApex1 = r :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp P.q_mem_marginal).1).2
  have hw : dist P.w S.oppApex1 = r :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp P.w_mem_marginal).1).2
  simpa [dist_comm] using hw.trans hq.symm

/-- A cross deletion surviving at the actual blocker already separates that
blocker from the first apex.  No class-cardinality hypothesis is needed. -/
theorem actualBlocker_ne_oppApex1_of_cross_deletion_survives
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcross :
      HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A)) :
    H.centerAt P.q P.q_mem_A ≠ S.oppApex1 := by
  have hradiusNe :=
    Problem97.ATailCriticalPairFrontier.SurvivorPairRelocationPacket.blocker_dist_ne_of_cross_deletion_survives
      P hcross
  intro hcenter
  apply hradiusNe
  simpa [hcenter] using firstApex_pair_dist_eq P

/-- Reciprocal cross-deletion survival already gives the full robust packet,
uniformly in the first-apex class cardinality.
-/
theorem reciprocalCrossSurvivalPacket_of_survival
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (hqCross :
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
        (H.centerAt F.pair.q F.pair.q_mem_A))
    (hwCross :
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
        (H.centerAt F.pair.w F.pair.w_mem_A)) :
    ReciprocalCrossSurvivalPacket F := by
  have hwOutside :
      F.pair.w ∉
        (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H F.pair.q_mem_A).mp hqCross
  have hqOutside :
      F.pair.q ∉
        (H.selectedAt F.pair.w F.pair.w_mem_A).toCriticalFourShell.support :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H F.pair.w_mem_A).mp hwCross
  have hqRadiusNe :=
    Problem97.ATailCriticalPairFrontier.SurvivorPairRelocationPacket.blocker_dist_ne_of_cross_deletion_survives
      F.pair hqCross
  have hwRadiusNe :=
    Problem97.ATailCriticalPairFrontier.SurvivorPairRelocationPacket.blocker_dist_ne_of_cross_deletion_survives
      (swapPair F.pair) hwCross
  have hqFirst : H.centerAt F.pair.q F.pair.q_mem_A ≠ S.oppApex1 :=
    actualBlocker_ne_oppApex1_of_cross_deletion_survives F.pair hqCross
  have hwFirst : H.centerAt F.pair.w F.pair.w_mem_A ≠ S.oppApex1 := by
    simpa [swapPair] using
      actualBlocker_ne_oppApex1_of_cross_deletion_survives
        (swapPair F.pair) hwCross
  exact
    { qCrossSurvives := hqCross
      wCrossSurvives := hwCross
      w_not_mem_qSupport := hwOutside
      q_not_mem_wSupport := hqOutside
      qBlocker_ne_oppApex1 := hqFirst
      wBlocker_ne_oppApex1 := hwFirst
      qBlocker_ne_oppApex2 := F.pair.q_blocker_ne_oppApex2
      wBlocker_ne_oppApex2 := F.pair.w_blocker_ne_oppApex2
      blockers_ne :=
        blocker_centers_ne_of_not_mem_other_selected_support
          H F.pair.q_mem_A F.pair.w_mem_A hqOutside
      selectedSupports_inter_card_le_two :=
        selected_support_inter_card_le_two_of_not_mem_other_selected_support
          H F.pair.q_mem_A F.pair.w_mem_A hqOutside
      qCrossRadius_ne := hqRadiusNe
      wCrossRadius_ne := hwRadiusNe
      qSurvivingClass_exact_and_unique :=
        cross_survival_unique_radius_and_exact_support
          H F.pair.q_mem_A hqCross
      wSurvivingClass_exact_and_unique :=
        cross_survival_unique_radius_and_exact_support
          H F.pair.w_mem_A hwCross }

/-- Every retained frontier has the complete equality-or-robust normal form.
This is pure case analysis on the two exact selected rows; no content theorem
or favorable critical-row choice is used.
-/
theorem crossEqualityOrReciprocalSurvival
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H) :
    CrossEqualityOrReciprocalSurvival F := by
  by_cases hwInQ :
      F.pair.w ∈
        (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support
  · exact Or.inl <|
      ((H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support_eq_radius
        F.pair.q
        (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.q_mem_support).trans
        ((H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support_eq_radius
          F.pair.w hwInQ).symm
  · have hqCross :
        HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
          (H.centerAt F.pair.q F.pair.q_mem_A) :=
      (cross_deletion_survives_iff_not_mem_selected_support
        H F.pair.q_mem_A).mpr hwInQ
    by_cases hqInW :
        F.pair.q ∈
          (H.selectedAt F.pair.w F.pair.w_mem_A).toCriticalFourShell.support
    · exact Or.inr <| Or.inl <|
        ((H.selectedAt F.pair.w F.pair.w_mem_A).toCriticalFourShell.support_eq_radius
          F.pair.w
          (H.selectedAt F.pair.w F.pair.w_mem_A).toCriticalFourShell.q_mem_support).trans
          ((H.selectedAt F.pair.w F.pair.w_mem_A).toCriticalFourShell.support_eq_radius
            F.pair.q hqInW).symm
    · have hwCross :
          HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
            (H.centerAt F.pair.w F.pair.w_mem_A) :=
        (cross_deletion_survives_iff_not_mem_selected_support
          H F.pair.w_mem_A).mpr hqInW
      exact Or.inr <| Or.inr <|
        reciprocalCrossSurvivalPacket_of_survival F hqCross hwCross

/-- Everything that can be built at the actual parent boundary without a new
geometric producer.  The constructor equalities make the common provenance
explicit rather than merely passing abstract rows beside an unrelated
`Nonempty (CriticalShellSystem D.A)`.
-/
structure ParentCommonCriticalMapSurface
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {q t1 t2 t3 u : ℝ²}
    (hqA : q ∈ D.A) (ht1A : t1 ∈ D.A) (ht2A : t2 ∈ D.A)
    (ht3A : t3 ∈ D.A) (huA : u ∈ D.A) where
  rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u
  rows_eq :
    rows = U1Depth5.CriticalSourceRows.ofCriticalShellSystem
      H hqA ht1A ht2A ht3A huA
  f2Row : U1Depth5.CriticalRowPacket D
    (rows.pointOfChoice
      { source := U1Depth5.CriticalSource.t2, slot := 0 })
  f2Row_eq :
    f2Row = U1Depth5.CriticalRowPacket.ofCriticalShellSystem H
      (rows.pointOfChoice_mem
        { source := U1Depth5.CriticalSource.t2, slot := 0 })
  radius : ℝ
  radius_pos : 0 < radius
  radius_card_four :
    4 ≤ (SelectedClass D.A S.oppApex1 radius).card
  frontier : CriticalPairFrontier D S radius H
  equality_or_robust : CrossEqualityOrReciprocalSurvival frontier

/-- Specialize the routine surface to the exact CP-built packet available in
`u1_largeCap_routeB_tail_false` before the live slot split.
-/
theorem exists_parentCommonCriticalMapSurface_leafSurplusPacket
    {D : CounterexampleData} {q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    (H : CriticalShellSystem D.A)
    (hqA : q ∈ D.A) (ht1A : t1 ∈ D.A) (ht2A : t2 ∈ D.A)
    (ht3A : t3 ∈ D.A) (huA : u ∈ D.A) :
    let S := leafSurplusPacket
      (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
      (hM := hM) (hsurplus := hsurplus)
    Nonempty (ParentCommonCriticalMapSurface
      D S H hqA ht1A ht2A ht3A huA) := by
  classical
  let S := leafSurplusPacket
    (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
    (hM := hM) (hsurplus := hsurplus)
  let rows := U1Depth5.CriticalSourceRows.ofCriticalShellSystem
    H hqA ht1A ht2A ht3A huA
  let f2Row : U1Depth5.CriticalRowPacket D
      (rows.pointOfChoice
        { source := U1Depth5.CriticalSource.t2, slot := 0 }) :=
    U1Depth5.CriticalRowPacket.ofCriticalShellSystem H
      (rows.pointOfChoice_mem
        { source := U1Depth5.CriticalSource.t2, slot := 0 })
  rcases exists_criticalPairFrontier_of_K4 D S H with
    ⟨r, hr, hfour, ⟨F⟩⟩
  exact ⟨
    { rows := rows
      rows_eq := rfl
      f2Row := f2Row
      f2Row_eq := rfl
      radius := r
      radius_pos := hr
      radius_card_four := hfour
      frontier := F
      equality_or_robust := crossEqualityOrReciprocalSurvival F }⟩

#print axioms actualBlocker_ne_oppApex1_of_cross_deletion_survives
#print axioms reciprocalCrossSurvivalPacket_of_survival
#print axioms crossEqualityOrReciprocalSurvival
#print axioms exists_parentCommonCriticalMapSurface_leafSurplusPacket

end ATAILParentCommonMapAdapter
end Problem97
