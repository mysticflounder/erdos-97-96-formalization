/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourStrictPairMinimality
import Erdos9796Proof.P97.N8.FourSubpacket
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Exact-four equal-radius cap projection

The equal-radius strict-pair residual has a fresh center in the first opposite cap and a
complete ambient radius class of cardinality at least five.  This module proves that the
complete class meets that cap in exactly the retained pair.  It then chooses a four-point
subpacket preserving the pair, thereby extracting exactly two witnesses outside the cap.

The extracted outside pair reaches the one-center prefix of
`CapSelectedRowCounting.outsidePair_unique_capCenter`.  Full deletion robustness supplies
the useful source-indexed exclusion: no actual critical row whose center is in the same cap
can contain both outside witnesses.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourEqualRadiusTerminalScratch

open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourStrictPairMinimalityScratch

attribute [local instance] Classical.propDecidable

private def selectedFourClassOfSubpacket
    {A : Finset ℝ²} {center : ℝ²} {radius : ℝ} {T : Finset ℝ²}
    (hradius : 0 < radius)
    (hTsub : T ⊆ SelectedClass A center radius)
    (hTcard : T.card = 4) :
    SelectedFourClass A center where
  support := T
  support_subset_A := by
    intro x hx
    exact (mem_selectedClass.mp (hTsub hx)).1
  support_card := hTcard
  radius := radius
  radius_pos := hradius
  support_eq_radius := by
    intro x hx
    exact (mem_selectedClass.mp (hTsub hx)).2
  center_not_mem := by
    intro hcenter
    have hzero := (mem_selectedClass.mp (hTsub hcenter)).2
    have : radius = 0 := by simpa using hzero.symm
    exact (ne_of_gt hradius) this

/-- A positive radius class of cardinality at least four, centered in an indexed cap,
contains at most two points of that cap.  The proof extends any hypothetical three-point
cap intersection to a selected four-row and applies the ordered-cap row bound. -/
theorem selectedClass_inter_capByIndex_card_le_two
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {center : ℝ²} {radius : ℝ}
    (hcenter : center ∈ S.capByIndex i)
    (hradius : 0 < radius)
    (hcard : 4 ≤ (SelectedClass A center radius).card) :
    (SelectedClass A center radius ∩ S.capByIndex i).card ≤ 2 := by
  classical
  by_contra hnot
  have hthree : 3 ≤ (SelectedClass A center radius ∩ S.capByIndex i).card := by
    omega
  rcases Finset.exists_subset_card_eq hthree with ⟨P, hPsub, hPcard⟩
  have hPclass : P ⊆ SelectedClass A center radius :=
    hPsub.trans Finset.inter_subset_left
  rcases FiniteEndpointShell.exists_fourSubpacket_preserving_of_selected_card_ge_four
      hPclass (by omega) hcard with ⟨T, hPT, hTclass, hTcard⟩
  let K : SelectedFourClass A center :=
    selectedFourClassOfSubpacket hradius hTclass hTcard
  have hPinter : P ⊆ K.support ∩ S.capByIndex i := by
    intro x hx
    exact Finset.mem_inter.mpr ⟨hPT hx, (Finset.mem_inter.mp (hPsub hx)).2⟩
  have hthreeK : 3 ≤ (K.support ∩ S.capByIndex i).card := by
    calc
      3 = P.card := hPcard.symm
      _ ≤ (K.support ∩ S.capByIndex i).card := Finset.card_le_card hPinter
  have htwoK :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S hconv i K hcenter
  omega

/-- The complete fresh-center class meets the first opposite cap in exactly the two
retained strict-cap points. -/
theorem equalRadius_ambientClass_inter_firstCap_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : StrictPairMinimalDeletion R)
    (hpair : P.deleted = ({R.interior_q, R.interior_w} : Finset ℝ²))
    (hdist : dist P.center R.interior_q = dist P.center R.interior_w) :
    SelectedClass D.A P.center (dist P.center R.interior_q) ∩
        S.capByIndex S.oppIndex1 =
      ({R.interior_q, R.interior_w} : Finset ℝ²) := by
  classical
  rcases equalRadius_pair_collision_normalForm P hpair hdist with
    ⟨hcenterInterior, hradius, hqClass, hwClass, hfive, _hcap, _hrobust, _homitted⟩
  have hcenterCap : P.center ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hcenterInterior
  have hle :
      (SelectedClass D.A P.center (dist P.center R.interior_q) ∩
        S.capByIndex S.oppIndex1).card ≤ 2 :=
    selectedClass_inter_capByIndex_card_le_two S D.convex S.oppIndex1
      hcenterCap hradius (by omega)
  have hpairSub :
      ({R.interior_q, R.interior_w} : Finset ℝ²) ⊆
        SelectedClass D.A P.center (dist P.center R.interior_q) ∩
          S.capByIndex S.oppIndex1 := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨hqClass, S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          (Finset.mem_inter.mp R.interior_q_mem).2⟩
    · exact Finset.mem_inter.mpr
        ⟨hwClass, S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          (Finset.mem_inter.mp R.interior_w_mem).2⟩
  apply (Finset.eq_of_subset_of_card_le hpairSub ?_).symm
  have hpairCard : ({R.interior_q, R.interior_w} : Finset ℝ²).card = 2 := by
    simp [R.interior_q_ne_w]
  rw [hpairCard]
  exact hle

/-- At least three members of the complete fresh-center radius class lie outside the first
opposite cap. -/
theorem three_le_equalRadius_ambientClass_sdiff_firstCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : StrictPairMinimalDeletion R)
    (hpair : P.deleted = ({R.interior_q, R.interior_w} : Finset ℝ²))
    (hdist : dist P.center R.interior_q = dist P.center R.interior_w) :
    3 ≤
      (SelectedClass D.A P.center (dist P.center R.interior_q) \
        S.capByIndex S.oppIndex1).card := by
  have hnormal := equalRadius_pair_collision_normalForm P hpair hdist
  have hinter := equalRadius_ambientClass_inter_firstCap_eq_pair P hpair hdist
  have hsplit := Finset.card_inter_add_card_sdiff
    (SelectedClass D.A P.center (dist P.center R.interior_q))
    (S.capByIndex S.oppIndex1)
  have hpairCard : ({R.interior_q, R.interior_w} : Finset ℝ²).card = 2 := by
    simp [R.interior_q_ne_w]
  rw [hinter, hpairCard] at hsplit
  omega

/-- The pair-preserving selected row at the fresh center.  Its remaining two support
points are a distinct pair outside the first opposite cap. -/
structure EqualRadiusPairOutsideRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : StrictPairMinimalDeletion R) : Type where
  row : SelectedFourClass D.A P.center
  center_mem_firstCap : P.center ∈ S.capByIndex S.oppIndex1
  freshCenter_robust : FullyDeletionRobustAt D P.center
  interior_q_mem_row : R.interior_q ∈ row.support
  interior_w_mem_row : R.interior_w ∈ row.support
  row_inter_firstCap_eq_pair :
    row.support ∩ S.capByIndex S.oppIndex1 =
      ({R.interior_q, R.interior_w} : Finset ℝ²)
  outside₁ : ℝ²
  outside₂ : ℝ²
  outside_points_ne : outside₁ ≠ outside₂
  row_sdiff_firstCap_eq_outsidePair :
    row.support \ S.capByIndex S.oppIndex1 = {outside₁, outside₂}
  outside₁_mem_A : outside₁ ∈ D.A
  outside₂_mem_A : outside₂ ∈ D.A
  outside₁_not_mem_firstCap : outside₁ ∉ S.capByIndex S.oppIndex1
  outside₂_not_mem_firstCap : outside₂ ∉ S.capByIndex S.oppIndex1
  freshCenter_equidistant_outsidePair :
    dist P.center outside₁ = dist P.center outside₂

/-- The equal-radius collision produces the exact one-center outside-pair packet used by
the ordered-cap uniqueness terminal. -/
theorem nonempty_equalRadiusPairOutsideRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : StrictPairMinimalDeletion R)
    (hpair : P.deleted = ({R.interior_q, R.interior_w} : Finset ℝ²))
    (hdist : dist P.center R.interior_q = dist P.center R.interior_w) :
    Nonempty (EqualRadiusPairOutsideRow P) := by
  classical
  rcases equalRadius_pair_collision_normalForm P hpair hdist with
    ⟨hcenterInterior, hradius, hqClass, hwClass, hfive, _hcap, hrobust, _homitted⟩
  let pair : Finset ℝ² := {R.interior_q, R.interior_w}
  have hpairSub : pair ⊆ SelectedClass D.A P.center (dist P.center R.interior_q) := by
    intro x hx
    simp only [pair, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact hqClass
    · exact hwClass
  have hpairCard : pair.card = 2 := by
    simp [pair, R.interior_q_ne_w]
  rcases FiniteEndpointShell.exists_fourSubpacket_preserving_of_selected_card_ge_four
      hpairSub (by omega) (by omega) with ⟨T, hpairT, hTclass, hTcard⟩
  let K : SelectedFourClass D.A P.center :=
    selectedFourClassOfSubpacket hradius hTclass hTcard
  have hcenterCap : P.center ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hcenterInterior
  have hinterLe : (K.support ∩ S.capByIndex S.oppIndex1).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex1 K hcenterCap
  have hpairInter : pair ⊆ K.support ∩ S.capByIndex S.oppIndex1 := by
    intro x hx
    refine Finset.mem_inter.mpr ⟨hpairT hx, ?_⟩
    simp only [pair, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        (Finset.mem_inter.mp R.interior_q_mem).2
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        (Finset.mem_inter.mp R.interior_w_mem).2
  have hinterEq :
      K.support ∩ S.capByIndex S.oppIndex1 = pair := by
    exact (Finset.eq_of_subset_of_card_le hpairInter (by
      rw [hpairCard]
      exact hinterLe)).symm
  have hsplit :=
    Finset.card_inter_add_card_sdiff K.support (S.capByIndex S.oppIndex1)
  have houtsideCard :
      (K.support \ S.capByIndex S.oppIndex1).card = 2 := by
    rw [hinterEq, hpairCard, K.support_card] at hsplit
    omega
  rcases Finset.card_eq_two.mp houtsideCard with
    ⟨outside₁, outside₂, houtsideNe, houtsideEq⟩
  have houtside₁ :
      outside₁ ∈ K.support \ S.capByIndex S.oppIndex1 := by
    rw [houtsideEq]
    simp
  have houtside₂ :
      outside₂ ∈ K.support \ S.capByIndex S.oppIndex1 := by
    rw [houtsideEq]
    simp
  refine ⟨{
    row := K
    center_mem_firstCap := hcenterCap
    freshCenter_robust := hrobust
    interior_q_mem_row := hpairT (by simp [pair])
    interior_w_mem_row := hpairT (by simp [pair])
    row_inter_firstCap_eq_pair := by simpa [pair] using hinterEq
    outside₁ := outside₁
    outside₂ := outside₂
    outside_points_ne := houtsideNe
    row_sdiff_firstCap_eq_outsidePair := houtsideEq
    outside₁_mem_A := K.support_subset_A (Finset.mem_sdiff.mp houtside₁).1
    outside₂_mem_A := K.support_subset_A (Finset.mem_sdiff.mp houtside₂).1
    outside₁_not_mem_firstCap := (Finset.mem_sdiff.mp houtside₁).2
    outside₂_not_mem_firstCap := (Finset.mem_sdiff.mp houtside₂).2
    freshCenter_equidistant_outsidePair :=
      (K.support_eq_radius outside₁ (Finset.mem_sdiff.mp houtside₁).1).trans
        (K.support_eq_radius outside₂
          (Finset.mem_sdiff.mp houtside₂).1).symm }⟩

/-- A second distinct center in the first cap bisecting the extracted outside pair is
impossible by ordered-cap uniqueness. -/
theorem false_of_secondFirstCapCenter_bisecting_outsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {P : StrictPairMinimalDeletion R}
    (Q : EqualRadiusPairOutsideRow P)
    {secondCenter : ℝ²}
    (hsecondCap : secondCenter ∈ S.capByIndex S.oppIndex1)
    (hsecondNe : secondCenter ≠ P.center)
    (hsecondEq : dist secondCenter Q.outside₁ = dist secondCenter Q.outside₂) :
    False := by
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex1 with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hfreshImage : P.center ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact Q.center_mem_firstCap
  have hsecondImage : secondCenter ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hsecondCap
  rcases Finset.mem_image.mp hfreshImage with ⟨i, _hi, hiFresh⟩
  rcases Finset.mem_image.mp hsecondImage with ⟨j, _hj, hjSecond⟩
  have hij : i ≠ j := by
    intro hij
    apply hsecondNe
    calc
      secondCenter = L.points j := hjSecond.symm
      _ = L.points i := by rw [hij]
      _ = P.center := hiFresh
  have houtside₁ : Q.outside₁ ∉ Finset.univ.image L.points := by
    simpa [hcap] using Q.outside₁_not_mem_firstCap
  have houtside₂ : Q.outside₂ ∉ Finset.univ.image L.points := by
    simpa [hcap] using Q.outside₂_not_mem_firstCap
  rcases lt_or_gt_of_ne hij with hij | hji
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hij Q.outside₁_mem_A Q.outside₂_mem_A
      houtside₁ houtside₂ Q.outside_points_ne
      (by
        rw [hiFresh]
        exact Q.freshCenter_equidistant_outsidePair)
      (by
        rw [hjSecond]
        exact hsecondEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hji Q.outside₁_mem_A Q.outside₂_mem_A
      houtside₁ houtside₂ Q.outside_points_ne
      (by
        rw [hjSecond]
        exact hsecondEq)
      (by
        rw [hiFresh]
        exact Q.freshCenter_equidistant_outsidePair)

/-- No actual critical row centered in the first opposite cap can contain both extracted
outside witnesses.  Robustness makes every actual blocker different from the fresh center,
so such a row would supply the forbidden second cap center. -/
theorem not_both_outsidePoints_mem_actualRow_of_center_mem_firstCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F} {P : StrictPairMinimalDeletion R}
    (Q : EqualRadiusPairOutsideRow P)
    (H' : CriticalShellSystem D.A) (source : ℝ²) (hsource : source ∈ D.A)
    (hcenterCap : H'.centerAt source hsource ∈ S.capByIndex S.oppIndex1) :
    ¬ (Q.outside₁ ∈
        (H'.selectedAt source hsource).toCriticalFourShell.support ∧
      Q.outside₂ ∈
        (H'.selectedAt source hsource).toCriticalFourShell.support) := by
  rintro ⟨houtside₁, houtside₂⟩
  apply false_of_secondFirstCapCenter_bisecting_outsidePair Q hcenterCap
    (Q.freshCenter_robust.centerAt_ne H' source hsource)
  exact
    ((H'.selectedAt source hsource).toCriticalFourShell.support_eq_radius
      Q.outside₁ houtside₁).trans
      ((H'.selectedAt source hsource).toCriticalFourShell.support_eq_radius
        Q.outside₂ houtside₂).symm

#print axioms selectedClass_inter_capByIndex_card_le_two
#print axioms equalRadius_ambientClass_inter_firstCap_eq_pair
#print axioms three_le_equalRadius_ambientClass_sdiff_firstCap
#print axioms nonempty_equalRadiusPairOutsideRow
#print axioms false_of_secondFirstCapCenter_bisecting_outsidePair
#print axioms not_both_outsidePoints_mem_actualRow_of_center_mem_firstCap

end ATailUniqueFourEqualRadiusTerminalScratch
end Problem97
