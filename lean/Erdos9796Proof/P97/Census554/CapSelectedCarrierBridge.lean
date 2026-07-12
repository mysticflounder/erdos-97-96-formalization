/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.CapSelectedRowCounting
import Erdos9796Proof.P97.Census554.CapSelectedGeometry
import Erdos9796Proof.P97.Census554.CapSelectedNativeClosureSound
import Erdos9796Proof.P97.CircumcenterSide
import Erdos9796Proof.P97.Q3SharedInterior

/-!
# Carrier realization of the cap-selected card-eleven code

This module pulls a `FaithfulCarrierPattern` back along the canonical
`(6,4,4)` labeling. It proves the profile-independent incidence facts and the
exact finite-code cap labels used by the final pinned-source adapters.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace CapSelectedCarrierBridge

open EqualityCore
open CapSelectedFiniteCode
open CapSelectedGeometry

/-- Pull a selected four-class at every geometric carrier point back to the
canonical eleven labels. -/
noncomputable def patternCode {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A) : PatternCode :=
  fun center point => decide <|
    L.pointOf point ∈
      (F.classAt (L.pointOf center) (L.mem_carrier center)).support

@[simp] theorem mem_row_patternCode_iff
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (center point : Label) :
    point ∈ row (patternCode L F) center ↔
      L.pointOf point ∈
        (F.classAt (L.pointOf center) (L.mem_carrier center)).support := by
  simp [patternCode, mem_row_iff]

/-- A pulled-back row is exactly the canonical label preimage of its selected
geometric support. -/
theorem row_patternCode_eq_labelsOf
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (center : Label) :
    row (patternCode L F) center =
      L.toCard11Labeling.labelsOf
        (F.classAt (L.pointOf center) (L.mem_carrier center)).support := by
  ext point
  rw [mem_row_patternCode_iff, L.toCard11Labeling.mem_labelsOf]

/-- The canonical point map realizes every pulled-back row equality. -/
theorem realizes_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A) :
    Realizes (rowPattern (patternCode L F)) L.pointOf := by
  refine ⟨?_, L.injective⟩
  intro center left hleft right hright
  have hleftSupport :=
    (mem_row_patternCode_iff L F center left).mp hleft
  have hrightSupport :=
    (mem_row_patternCode_iff L F center right).mp hright
  exact
    ((F.classAt (L.pointOf center) (L.mem_carrier center)).support_eq_radius
      _ hleftSupport).trans
    ((F.classAt (L.pointOf center) (L.mem_carrier center)).support_eq_radius
      _ hrightSupport).symm

/-- Every pulled-back row has four labels. -/
theorem row_patternCode_card
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (center : Label) :
    (row (patternCode L F) center).card = 4 := by
  rw [row_patternCode_eq_labelsOf]
  exact (L.toCard11Labeling.labelsOf_card_eq
    (F.classAt (L.pointOf center) (L.mem_carrier center)).support_subset_A).trans
    (F.classAt (L.pointOf center) (L.mem_carrier center)).support_card

/-- A pulled-back row omits its center. -/
theorem center_not_mem_row_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (center : Label) :
    center ∉ row (patternCode L F) center := by
  intro hcenter
  exact
    (F.classAt (L.pointOf center) (L.mem_carrier center)).center_not_mem
      ((mem_row_patternCode_iff L F center center).mp hcenter)

/-- A selected row centered away from the three Moser labels cannot contain
all three Moser labels. Otherwise its center is the circumcenter of the
non-obtuse Moser triangle and lies in the convex hull of three other carrier
points, contradicting convex independence. -/
theorem nonMoser_inter_moser_card_le_two
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (hconv : ConvexIndep A) {center : Label}
    (hcenter : center ∉ CapSelectedFiniteCode.moser) :
    (row (patternCode L F) center ∩
        CapSelectedFiniteCode.moser).card ≤ 2 := by
  let K := F.classAt (L.pointOf center) (L.mem_carrier center)
  by_contra hcard
  have hall : ∀ point ∈ CapSelectedFiniteCode.moser,
      point ∈ row (patternCode L F) center := by
    intro point hpoint
    by_contra hpointRow
    have hsub :
        row (patternCode L F) center ∩ CapSelectedFiniteCode.moser ⊆
          CapSelectedFiniteCode.moser.erase point := by
      intro q hq
      rw [Finset.mem_inter] at hq
      rw [Finset.mem_erase]
      exact ⟨fun h => hpointRow (h ▸ hq.1), hq.2⟩
    have hle := Finset.card_le_card hsub
    have herase : (CapSelectedFiniteCode.moser.erase point).card = 2 := by
      rw [Finset.card_erase_of_mem hpoint]
      decide
    omega
  have hrow0 := hall 0 (by decide)
  have hrow1 := hall 1 (by decide)
  have hrow2 := hall 2 (by decide)
  have hsupport0 : L.pointOf 0 ∈ K.support := by
    exact (mem_row_patternCode_iff L F center 0).mp hrow0
  have hsupport1 : L.pointOf 1 ∈ K.support := by
    exact (mem_row_patternCode_iff L F center 1).mp hrow1
  have hsupport2 : L.pointOf 2 ∈ K.support := by
    exact (mem_row_patternCode_iff L F center 2).mp hrow2
  have h01 : dist (L.pointOf center) (L.pointOf 0) =
      dist (L.pointOf center) (L.pointOf 1) := by
    exact (K.support_eq_radius _ hsupport0).trans
      (K.support_eq_radius _ hsupport1).symm
  have h02 : dist (L.pointOf center) (L.pointOf 0) =
      dist (L.pointOf center) (L.pointOf 2) := by
    exact (K.support_eq_radius _ hsupport0).trans
      (K.support_eq_radius _ hsupport2).symm
  have harea :
      signedArea2 (L.pointOf 0) (L.pointOf 1) (L.pointOf 2) ≠ 0 := by
    intro hzero
    exact hconv.not_three_collinear (L.mem_carrier 0) (L.mem_carrier 1)
      (L.mem_carrier 2) (by
        intro h
        exact (by decide : (0 : Label) ≠ 1) (L.injective h)) (by
        intro h
        exact (by decide : (0 : Label) ≠ 2) (L.injective h)) (by
        intro h
        exact (by decide : (1 : Label) ≠ 2) (L.injective h))
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)
  let P := S.circPacketByIndex S.surplusIdx
  have hp0 : L.pointOf 0 = (S.triangleByIndex S.surplusIdx).v1 :=
    L.point_zero_eq_opposite.trans
      (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.surplusIdx).symm
  have hp1 : L.pointOf 1 = (S.triangleByIndex S.surplusIdx).v2 :=
    L.point_one_eq_opposite.trans
      S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm
  have hp2 : L.pointOf 2 = (S.triangleByIndex S.surplusIdx).v3 :=
    L.point_two_eq_opposite.trans
      S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm
  have hinner0 := P.inner_at_v1
  have hinner1 := P.inner_at_v2
  have hinner2 := P.inner_at_v3
  rw [← hp0, ← hp1, ← hp2] at hinner0 hinner1 hinner2
  have hcenterHull :
      L.pointOf center ∈
        convexHull ℝ
          ({L.pointOf 0, L.pointOf 1, L.pointOf 2} : Set ℝ²) :=
    mem_convexHull_three_of_equidistant_nonobtuse harea h01 h02
      hinner0 hinner1 hinner2
  have hcenter0 : center ≠ 0 := by
    intro h
    subst center
    exact hcenter (by decide)
  have hcenter1 : center ≠ 1 := by
    intro h
    subst center
    exact hcenter (by decide)
  have hcenter2 : center ≠ 2 := by
    intro h
    subst center
    exact hcenter (by decide)
  have hsub :
      ({L.pointOf 0, L.pointOf 1, L.pointOf 2} : Set ℝ²) ⊆
        (A : Set ℝ²) \ {L.pointOf center} := by
    intro point hpoint
    rcases hpoint with rfl | rfl | rfl
    · exact ⟨by exact_mod_cast L.mem_carrier 0, by
        simpa using (L.injective.ne hcenter0).symm⟩
    · exact ⟨by exact_mod_cast L.mem_carrier 1, by
        simpa using (L.injective.ne hcenter1).symm⟩
    · exact ⟨by exact_mod_cast L.mem_carrier 2, by
        simpa using (L.injective.ne hcenter2).symm⟩
  exact hconv (L.pointOf center) (by exact_mod_cast L.mem_carrier center)
    (convexHull_mono hsub hcenterHull)

/-- Distinct pulled-back rows meet in at most two labels. -/
theorem row_patternCode_inter_card_le_two
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    {left right : Label} (hne : left ≠ right) :
    (row (patternCode L F) left ∩ row (patternCode L F) right).card ≤ 2 := by
  let Kleft := F.classAt (L.pointOf left) (L.mem_carrier left)
  let Kright := F.classAt (L.pointOf right) (L.mem_carrier right)
  have hinter :
      row (patternCode L F) left ∩ row (patternCode L F) right =
        L.toCard11Labeling.labelsOf (Kleft.support ∩ Kright.support) := by
    ext point
    rw [Finset.mem_inter, mem_row_patternCode_iff,
      mem_row_patternCode_iff, L.toCard11Labeling.mem_labelsOf,
      Finset.mem_inter]
  rw [hinter, L.toCard11Labeling.labelsOf_card_eq]
  · exact SelectedFourClass.inter_card_le_two Kleft Kright
      (fun h => hne (L.injective h))
  · intro point hpoint
    exact Kleft.support_subset_A (Finset.mem_inter.mp hpoint).1

/-- Any fixed pair of distinct labels occurs in rows at at most two centers. -/
theorem pairCenterCount_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (hconv : ConvexIndep A) {left right : Label} (hne : left ≠ right) :
    ((Finset.univ : Finset Label).filter fun center =>
      left ∈ row (patternCode L F) center ∧
        right ∈ row (patternCode L F) center).card ≤ 2 := by
  let hits : Finset Label :=
    Finset.univ.filter fun center =>
      left ∈ row (patternCode L F) center ∧
        right ∈ row (patternCode L F) center
  let target : Finset ℝ² :=
    A.filter fun center =>
      dist center (L.pointOf left) = dist center (L.pointOf right)
  have hmaps : Set.MapsTo L.pointOf (↑hits) (↑target) := by
    intro center hcenter
    have hrows :
        left ∈ row (patternCode L F) center ∧
          right ∈ row (patternCode L F) center := by
      simpa [hits] using hcenter
    have hleft := (mem_row_patternCode_iff L F center left).mp hrows.1
    have hright := (mem_row_patternCode_iff L F center right).mp hrows.2
    exact Finset.mem_filter.mpr ⟨L.mem_carrier center, by
      rw [(F.classAt (L.pointOf center) (L.mem_carrier center)).support_eq_radius
          _ hleft,
        (F.classAt (L.pointOf center) (L.mem_carrier center)).support_eq_radius
          _ hright]⟩
  have hinjOn : Set.InjOn L.pointOf (↑hits) := by
    intro left _hleft right _hright heq
    exact L.injective heq
  have hhitsTarget : hits.card ≤ target.card :=
    Finset.card_le_card_of_injOn L.pointOf hmaps hinjOn
  have hpointNe : L.pointOf left ≠ L.pointOf right := L.injective.ne hne
  have htarget : target.card ≤ 2 := by
    simpa [target] using
      Dumitrescu.perpBisector_apex_bound hconv
        (L.mem_carrier left) (L.mem_carrier right) hpointNe
  change hits.card ≤ 2
  exact hhitsTarget.trans htarget

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨index, hindex⟩
  interval_cases index <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

/-- The canonical labels of the six-point surplus cap are exactly `capS`. -/
theorem labelsOf_surplusCap_eq_capS
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (hcard : S.surplusCap.card = 6) :
    L.toCard11Labeling.labelsOf S.surplusCap =
      CapSelectedFiniteCode.capS := by
  have hcap : S.capByIndex S.surplusIdx = S.surplusCap :=
    capByIndex_surplusIdx_eq_surplusCap S
  have hsubset : CapSelectedFiniteCode.capS ⊆
      L.toCard11Labeling.labelsOf S.surplusCap := by
    intro label hlabel
    simp only [CapSelectedFiniteCode.capS, Finset.mem_insert,
      Finset.mem_singleton] at hlabel
    rcases hlabel with rfl | rfl | hlabel
    · apply L.toCard11Labeling.mem_labelsOf.mpr
      rw [L.point_one_eq_opposite, ← hcap,
        ← S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1]
      exact S.triangleByIndex_v2_mem_capByIndex S.surplusIdx
    · apply L.toCard11Labeling.mem_labelsOf.mpr
      rw [L.point_two_eq_opposite, ← hcap,
        ← S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2]
      exact S.triangleByIndex_v3_mem_capByIndex S.surplusIdx
    · have hinterior :
          label ∈ L.toCard11Labeling.labelsOf
            (S.capInteriorByIndex S.surplusIdx) := by
        have hlabelInt : label ∈ CapSelectedFiniteCode.intS := by
          simpa [CapSelectedFiniteCode.intS] using hlabel
        rwa [L.surplusInterior_eq]
      apply L.toCard11Labeling.mem_labelsOf.mpr
      exact hcap ▸ S.capInteriorByIndex_subset_capByIndex S.surplusIdx
        (L.toCard11Labeling.mem_labelsOf.mp hinterior)
  symm
  apply Finset.eq_of_subset_of_card_le hsubset
  rw [L.toCard11Labeling.labelsOf_card_eq, hcard]
  · decide
  · rw [← hcap]
    exact S.capByIndex_subset S.surplusIdx

/-- The canonical labels of the first four-point non-surplus cap are exactly
`capO1`. -/
theorem labelsOf_oppCap1_eq_capO1
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (hcard : (S.capByIndex S.oppIndex1).card = 4) :
    L.toCard11Labeling.labelsOf (S.capByIndex S.oppIndex1) =
      CapSelectedFiniteCode.capO1 := by
  have hsubset : CapSelectedFiniteCode.capO1 ⊆
      L.toCard11Labeling.labelsOf (S.capByIndex S.oppIndex1) := by
    intro label hlabel
    simp only [CapSelectedFiniteCode.capO1, Finset.mem_insert,
      Finset.mem_singleton] at hlabel
    rcases hlabel with rfl | rfl | hlabel
    · apply L.toCard11Labeling.mem_labelsOf.mpr
      rw [L.point_zero_eq_opposite,
        ← S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx]
      exact S.triangleByIndex_v3_mem_capByIndex S.oppIndex1
    · apply L.toCard11Labeling.mem_labelsOf.mpr
      rw [L.point_two_eq_opposite,
        ← S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2]
      exact S.triangleByIndex_v2_mem_capByIndex S.oppIndex1
    · have hinterior : label ∈
          L.toCard11Labeling.labelsOf S.oppInterior1 := by
        have hlabelInt : label ∈ CapSelectedFiniteCode.intO1 := by
          simpa [CapSelectedFiniteCode.intO1] using hlabel
        rwa [L.oppInterior1_eq]
      apply L.toCard11Labeling.mem_labelsOf.mpr
      exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        (L.toCard11Labeling.mem_labelsOf.mp hinterior)
  symm
  apply Finset.eq_of_subset_of_card_le hsubset
  rw [L.toCard11Labeling.labelsOf_card_eq, hcard]
  · decide
  · exact S.capByIndex_subset S.oppIndex1

/-- The canonical labels of the second four-point non-surplus cap are exactly
`capO2`. -/
theorem labelsOf_oppCap2_eq_capO2
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (hcard : (S.capByIndex S.oppIndex2).card = 4) :
    L.toCard11Labeling.labelsOf (S.capByIndex S.oppIndex2) =
      CapSelectedFiniteCode.capO2 := by
  have hsubset : CapSelectedFiniteCode.capO2 ⊆
      L.toCard11Labeling.labelsOf (S.capByIndex S.oppIndex2) := by
    intro label hlabel
    simp only [CapSelectedFiniteCode.capO2, Finset.mem_insert,
      Finset.mem_singleton] at hlabel
    rcases hlabel with rfl | rfl | hlabel
    · apply L.toCard11Labeling.mem_labelsOf.mpr
      rw [L.point_zero_eq_opposite,
        ← S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx]
      exact S.triangleByIndex_v2_mem_capByIndex S.oppIndex2
    · apply L.toCard11Labeling.mem_labelsOf.mpr
      rw [L.point_one_eq_opposite,
        ← S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1]
      exact S.triangleByIndex_v3_mem_capByIndex S.oppIndex2
    · have hinterior : label ∈
          L.toCard11Labeling.labelsOf S.oppInterior2 := by
        have hlabelInt : label ∈ CapSelectedFiniteCode.intO2 := by
          simpa [CapSelectedFiniteCode.intO2] using hlabel
        rwa [L.oppInterior2_eq]
      apply L.toCard11Labeling.mem_labelsOf.mpr
      exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2
        (L.toCard11Labeling.mem_labelsOf.mp hinterior)
  symm
  apply Finset.eq_of_subset_of_card_le hsubset
  rw [L.toCard11Labeling.labelsOf_card_eq, hcard]
  · decide
  · exact S.capByIndex_subset S.oppIndex2

/-- Intersecting a pulled-back row with labels of a geometric subset preserves
the geometric intersection cardinality. -/
theorem row_inter_labelsOf_card_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (center : Label) (C : Finset ℝ²) (hC : C ⊆ A) :
    (row (patternCode L F) center ∩
        L.toCard11Labeling.labelsOf C).card =
      ((F.classAt (L.pointOf center) (L.mem_carrier center)).support ∩
        C).card := by
  have hinter :
      row (patternCode L F) center ∩
          L.toCard11Labeling.labelsOf C =
        L.toCard11Labeling.labelsOf
          ((F.classAt (L.pointOf center) (L.mem_carrier center)).support ∩
            C) := by
    ext point
    rw [Finset.mem_inter, mem_row_patternCode_iff,
      L.toCard11Labeling.mem_labelsOf,
      L.toCard11Labeling.mem_labelsOf, Finset.mem_inter]
  rw [hinter, L.toCard11Labeling.labelsOf_card_eq]
  intro point hpoint
  exact hC (Finset.mem_inter.mp hpoint).2

private theorem inter_erase_card_le_one
    {alpha : Type*} [DecidableEq alpha]
    (left right : Finset alpha) (point : alpha)
    (hcard : (left ∩ right).card ≤ 1) :
    (left ∩ right.erase point).card ≤ 1 := by
  apply (Finset.card_le_card ?_).trans hcard
  intro x hx
  rw [Finset.mem_inter] at hx ⊢
  exact ⟨hx.1, Finset.mem_of_mem_erase hx.2⟩

/-- The three Moser-center rows satisfy all six one-hit constraints in the
cap-selected finite code. -/
theorem moserOneHitOK_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hsurplusCard : S.surplusCap.card = 6) :
    MoserOneHitOK (patternCode L F) := by
  have hcapS := labelsOf_surplusCap_eq_capS L hsurplusCard
  have hcapO1 := labelsOf_oppCap1_eq_capO1 L
    hM44.oppIndex1_cap_card_eq_four
  have hcapO2 := labelsOf_oppCap2_eq_capO2 L
    hM44.oppIndex2_cap_card_eq_four
  have hcenter0 : L.pointOf 0 = S.oppositeVertexByIndex S.surplusIdx :=
    L.point_zero_eq_opposite
  have hcenter1 : L.pointOf 1 = S.oppositeVertexByIndex S.oppIndex1 :=
    L.point_one_eq_opposite
  have hcenter2 : L.pointOf 2 = S.oppositeVertexByIndex S.oppIndex2 :=
    L.point_two_eq_opposite
  have h01 := Card11SelectedCube.support_inter_capByIndex_card_le_one
    S hconv
      (F.classAt (L.pointOf 0) (L.mem_carrier 0))
      S.surplusIdx_ne_oppIndex1.symm hcenter0
  have h02 := Card11SelectedCube.support_inter_capByIndex_card_le_one
    S hconv
      (F.classAt (L.pointOf 0) (L.mem_carrier 0))
      S.surplusIdx_ne_oppIndex2.symm hcenter0
  have h10 := Card11SelectedCube.support_inter_capByIndex_card_le_one
    S hconv
      (F.classAt (L.pointOf 1) (L.mem_carrier 1))
      S.surplusIdx_ne_oppIndex1 hcenter1
  have h12 := Card11SelectedCube.support_inter_capByIndex_card_le_one
    S hconv
      (F.classAt (L.pointOf 1) (L.mem_carrier 1))
      S.oppIndex1_ne_oppIndex2.symm hcenter1
  have h20 := Card11SelectedCube.support_inter_capByIndex_card_le_one
    S hconv
      (F.classAt (L.pointOf 2) (L.mem_carrier 2))
      S.surplusIdx_ne_oppIndex2 hcenter2
  have h21 := Card11SelectedCube.support_inter_capByIndex_card_le_one
    S hconv
      (F.classAt (L.pointOf 2) (L.mem_carrier 2))
      S.oppIndex1_ne_oppIndex2 hcenter2
  have hsurplusEq : S.capByIndex S.surplusIdx = S.surplusCap :=
    capByIndex_surplusIdx_eq_surplusCap S
  have h10' :
      ((F.classAt (L.pointOf 1) (L.mem_carrier 1)).support ∩
        S.surplusCap).card ≤ 1 := by
    rw [← hsurplusEq]
    exact h10
  have h20' :
      ((F.classAt (L.pointOf 2) (L.mem_carrier 2)).support ∩
        S.surplusCap).card ≤ 1 := by
    rw [← hsurplusEq]
    exact h20
  have hrow01 :
      (row (patternCode L F) 0 ∩ CapSelectedFiniteCode.capO1).card ≤ 1 := by
    calc
      _ = (row (patternCode L F) 0 ∩
          L.toCard11Labeling.labelsOf
            (S.capByIndex S.oppIndex1)).card := by rw [hcapO1]
      _ = ((F.classAt (L.pointOf 0) (L.mem_carrier 0)).support ∩
          S.capByIndex S.oppIndex1).card :=
        row_inter_labelsOf_card_eq L F 0 _
          (S.capByIndex_subset S.oppIndex1)
      _ ≤ 1 := h01
  have hrow02 :
      (row (patternCode L F) 0 ∩ CapSelectedFiniteCode.capO2).card ≤ 1 := by
    calc
      _ = (row (patternCode L F) 0 ∩
          L.toCard11Labeling.labelsOf
            (S.capByIndex S.oppIndex2)).card := by rw [hcapO2]
      _ = ((F.classAt (L.pointOf 0) (L.mem_carrier 0)).support ∩
          S.capByIndex S.oppIndex2).card :=
        row_inter_labelsOf_card_eq L F 0 _
          (S.capByIndex_subset S.oppIndex2)
      _ ≤ 1 := h02
  have hrow10 :
      (row (patternCode L F) 1 ∩ CapSelectedFiniteCode.capS).card ≤ 1 := by
    calc
      _ = (row (patternCode L F) 1 ∩
          L.toCard11Labeling.labelsOf S.surplusCap).card := by rw [hcapS]
      _ = ((F.classAt (L.pointOf 1) (L.mem_carrier 1)).support ∩
          S.surplusCap).card :=
        row_inter_labelsOf_card_eq L F 1 _ (by
          rw [← hsurplusEq]
          exact S.capByIndex_subset S.surplusIdx)
      _ ≤ 1 := h10'
  have hrow12 :
      (row (patternCode L F) 1 ∩ CapSelectedFiniteCode.capO2).card ≤ 1 := by
    calc
      _ = (row (patternCode L F) 1 ∩
          L.toCard11Labeling.labelsOf
            (S.capByIndex S.oppIndex2)).card := by rw [hcapO2]
      _ = ((F.classAt (L.pointOf 1) (L.mem_carrier 1)).support ∩
          S.capByIndex S.oppIndex2).card :=
        row_inter_labelsOf_card_eq L F 1 _
          (S.capByIndex_subset S.oppIndex2)
      _ ≤ 1 := h12
  have hrow20 :
      (row (patternCode L F) 2 ∩ CapSelectedFiniteCode.capS).card ≤ 1 := by
    calc
      _ = (row (patternCode L F) 2 ∩
          L.toCard11Labeling.labelsOf S.surplusCap).card := by rw [hcapS]
      _ = ((F.classAt (L.pointOf 2) (L.mem_carrier 2)).support ∩
          S.surplusCap).card :=
        row_inter_labelsOf_card_eq L F 2 _ (by
          rw [← hsurplusEq]
          exact S.capByIndex_subset S.surplusIdx)
      _ ≤ 1 := h20'
  have hrow21 :
      (row (patternCode L F) 2 ∩ CapSelectedFiniteCode.capO1).card ≤ 1 := by
    calc
      _ = (row (patternCode L F) 2 ∩
          L.toCard11Labeling.labelsOf
            (S.capByIndex S.oppIndex1)).card := by rw [hcapO1]
      _ = ((F.classAt (L.pointOf 2) (L.mem_carrier 2)).support ∩
          S.capByIndex S.oppIndex1).card :=
        row_inter_labelsOf_card_eq L F 2 _
          (S.capByIndex_subset S.oppIndex1)
      _ ≤ 1 := h21
  exact
    ⟨⟨inter_erase_card_le_one _ _ 0 hrow01,
        inter_erase_card_le_one _ _ 0 hrow02⟩,
      ⟨inter_erase_card_le_one _ _ 1 hrow10,
        inter_erase_card_le_one _ _ 1 hrow12⟩,
      ⟨inter_erase_card_le_one _ _ 2 hrow20,
        inter_erase_card_le_one _ _ 2 hrow21⟩⟩

/-- The pulled-back selected rows satisfy the complete local-row contract,
including the upstream convex-independence obstruction to selecting all three
Moser labels from a non-Moser center. -/
theorem localRowsOK_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hsurplusCard : S.surplusCap.card = 6) :
    LocalRowsOK (patternCode L F) := by
  refine ⟨fun center =>
      ⟨row_patternCode_card L F center,
        center_not_mem_row_patternCode L F center⟩,
    moserOneHitOK_patternCode L F hconv hM44 hsurplusCard, ?_⟩
  intro center hcenter
  exact nonMoser_inter_moser_card_le_two L F hconv hcenter

/-- The pulled-back selected rows satisfy the pairwise row-intersection
conjunct of `IncidenceOK`. -/
theorem rowIntersectionsOK_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A) :
    RowIntersectionsOK (patternCode L F) := by
  intro left right hne
  exact row_patternCode_inter_card_le_two L F hne

/-- The pulled-back selected rows satisfy the pair-center-count conjunct of
`IncidenceOK`. -/
theorem pairCenterCountOK_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (hconv : ConvexIndep A) :
    PairCenterCountOK (patternCode L F) := by
  intro left right hne
  exact pairCenterCount_patternCode L F hconv hne

end CapSelectedCarrierBridge
end Census554
end Problem97
