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

/-- Row membership supplies membership in the selected same-radius class at
the corresponding geometric center. -/
theorem mem_selectedClass_of_mem_row
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    {center point : Label} (hpoint : point ∈ row (patternCode L F) center) :
    L.pointOf point ∈
      SelectedClass A (L.pointOf center)
        (F.classAt (L.pointOf center) (L.mem_carrier center)).radius := by
  rw [mem_selectedClass]
  have hsupport := (mem_row_patternCode_iff L F center point).mp hpoint
  exact
    ⟨(F.classAt (L.pointOf center) (L.mem_carrier center)).support_subset_A
        hsupport,
      (F.classAt (L.pointOf center) (L.mem_carrier center)).support_eq_radius
        _ hsupport⟩

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

private theorem cyclicSeparated_of_direct_btw :
    ∀ c d a b : Label,
      c ≠ d → a ≠ c → a ≠ d → b ≠ c → b ≠ d →
      (SurplusCOMPGBank.btw (hullIndex c) (hullIndex d) (hullIndex a) ↔
        ¬ SurplusCOMPGBank.btw
          (hullIndex c) (hullIndex d) (hullIndex b)) →
      CyclicSeparated c d a b := by
  decide

private theorem cyclicSeparated_of_reflected_btw :
    ∀ c d a b : Label,
      c ≠ d → a ≠ c → a ≠ d → b ≠ c → b ≠ d →
      (SurplusCOMPGBank.btw
          (SeparationCore.card11BoundaryReflection (hullIndex c))
          (SeparationCore.card11BoundaryReflection (hullIndex d))
          (SeparationCore.card11BoundaryReflection (hullIndex a)) ↔
        ¬ SurplusCOMPGBank.btw
          (SeparationCore.card11BoundaryReflection (hullIndex c))
          (SeparationCore.card11BoundaryReflection (hullIndex d))
          (SeparationCore.card11BoundaryReflection (hullIndex b))) →
      CyclicSeparated c d a b := by
  decide

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

/-- A pair shared by two distinct pulled-back rows alternates across those
centers in the canonical cyclic order. -/
theorem crossSeparationOK_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A) :
    CrossSeparationOK (patternCode L F) := by
  intro c d a b hcd hab hac hbc had hbd
  have hacCenter : a ≠ c := by
    intro h
    subst a
    exact center_not_mem_row_patternCode L F c hac
  have hadCenter : a ≠ d := by
    intro h
    subst a
    exact center_not_mem_row_patternCode L F d had
  have hbcCenter : b ≠ c := by
    intro h
    subst b
    exact center_not_mem_row_patternCode L F c hbc
  have hbdCenter : b ≠ d := by
    intro h
    subst b
    exact center_not_mem_row_patternCode L F d hbd
  let core :
      SeparationCore.SharedPairSeparationCore
        (rowPattern (patternCode L F)) :=
    { firstCenter := c
      secondCenter := d
      firstPoint := a
      secondPoint := b
      centers_ne := hcd
      secondPoint_ne_firstCenter := hbcCenter
      secondPoint_ne_secondCenter := hbdCenter
      points_ne := hab
      firstCenter_eq := EdgeClosure.row c a b hac hbc
      secondCenter_eq := EdgeClosure.row d a b had hbd }
  rcases L.canonicalHull.point_eq with hdirect | hreflected
  · have hsat : core.SatisfiedBy hullIndex :=
      core.satisfiedBy_of_realizes_ccw (realizes_patternCode L F)
        L.canonicalHull.boundary hullIndex
        L.canonicalHull.boundary_ccw L.canonicalHull.boundary_injective
        hullIndex_injective hdirect
    apply cyclicSeparated_of_direct_btw c d a b hcd hacCenter hadCenter
      hbcCenter hbdCenter
    simpa [core, SeparationCore.SharedPairSeparationCore.SatisfiedBy] using hsat
  · let reflectedIndex : Label → Fin 11 := fun label =>
      SeparationCore.card11BoundaryReflection (hullIndex label)
    have hreflectedInjective : Function.Injective reflectedIndex :=
      SeparationCore.card11BoundaryReflection.injective.comp
        hullIndex_injective
    have hsat : core.SatisfiedBy reflectedIndex :=
      core.satisfiedBy_of_realizes_ccw (realizes_patternCode L F)
        L.canonicalHull.boundary reflectedIndex
        L.canonicalHull.boundary_ccw L.canonicalHull.boundary_injective
        hreflectedInjective hreflected
    apply cyclicSeparated_of_reflected_btw c d a b hcd hacCenter hadCenter
      hbcCenter hbdCenter
    simpa [core, reflectedIndex,
      SeparationCore.SharedPairSeparationCore.SatisfiedBy] using hsat

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

@[simp] theorem mem_intS_iff_point_mem_surplusInterior
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (point : Label) :
    point ∈ CapSelectedFiniteCode.intS ↔
      L.pointOf point ∈ S.capInteriorByIndex S.surplusIdx := by
  rw [← L.surplusInterior_eq, L.toCard11Labeling.mem_labelsOf]

@[simp] theorem mem_intO1_iff_point_mem_oppInterior1
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (point : Label) :
    point ∈ CapSelectedFiniteCode.intO1 ↔
      L.pointOf point ∈ S.capInteriorByIndex S.oppIndex1 := by
  rw [← L.oppInterior1_eq, L.toCard11Labeling.mem_labelsOf]
  rfl

@[simp] theorem mem_intO2_iff_point_mem_oppInterior2
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (point : Label) :
    point ∈ CapSelectedFiniteCode.intO2 ↔
      L.pointOf point ∈ S.capInteriorByIndex S.oppIndex2 := by
  rw [← L.oppInterior2_eq, L.toCard11Labeling.mem_labelsOf]
  rfl

private theorem leftAdjacentIndex_oppIndex1_eq_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    SurplusCapPacket.leftAdjacentIndex S.oppIndex1 = S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨index, hindex⟩
  interval_cases index <;>
    simp [SurplusCapPacket.leftAdjacentIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppIndex2, hi]

private theorem rightAdjacentIndex_oppIndex1_eq_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    SurplusCapPacket.rightAdjacentIndex S.oppIndex1 = S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨index, hindex⟩
  interval_cases index <;>
    simp [SurplusCapPacket.rightAdjacentIndex, SurplusCapPacket.oppIndex1, hi]

private theorem leftAdjacentIndex_oppIndex2_eq_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    SurplusCapPacket.leftAdjacentIndex S.oppIndex2 = S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨index, hindex⟩
  interval_cases index <;>
    simp [SurplusCapPacket.leftAdjacentIndex, SurplusCapPacket.oppIndex2, hi]

private theorem rightAdjacentIndex_oppIndex2_eq_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    SurplusCapPacket.rightAdjacentIndex S.oppIndex2 = S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨index, hindex⟩
  interval_cases index <;>
    simp [SurplusCapPacket.rightAdjacentIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppIndex2, hi]

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

private theorem exists_mem_target_of_row_card_four_of_two_oneHit
    (selected target left right : Finset Label)
    (hcard : selected.card = 4)
    (hcover : selected ⊆ target ∪ (left ∪ right))
    (hleft : (selected ∩ left).card ≤ 1)
    (hright : (selected ∩ right).card ≤ 1) :
    ∃ point, point ∈ target ∧ point ∈ selected := by
  by_contra hexists
  have hsub : selected ⊆ left ∪ right := by
    intro point hpoint
    rcases Finset.mem_union.mp (hcover hpoint) with htarget | hsides
    · exact (hexists ⟨point, htarget, hpoint⟩).elim
    · exact hsides
  have heq : selected = (selected ∩ left) ∪ (selected ∩ right) := by
    apply Finset.Subset.antisymm
    · intro point hpoint
      rcases Finset.mem_union.mp (hsub hpoint) with hpointLeft | hpointRight
      · exact Finset.mem_union_left _ (Finset.mem_inter.mpr ⟨hpoint, hpointLeft⟩)
      · exact Finset.mem_union_right _ (Finset.mem_inter.mpr ⟨hpoint, hpointRight⟩)
    · intro point hpoint
      rcases Finset.mem_union.mp hpoint with hpointLeft | hpointRight
      · exact (Finset.mem_inter.mp hpointLeft).1
      · exact (Finset.mem_inter.mp hpointRight).1
  have hunion := Finset.card_union_le (selected ∩ left) (selected ∩ right)
  rw [← heq, hcard] at hunion
  omega

private theorem exists_row_zero_mem_intS {P : PatternCode}
    (hlocal : LocalRowsOK P) :
    ∃ point, point ∈ CapSelectedFiniteCode.intS ∧ point ∈ row P 0 := by
  have hcover : row P 0 ⊆
      CapSelectedFiniteCode.intS ∪
        (CapSelectedFiniteCode.capO1.erase 0 ∪
          CapSelectedFiniteCode.capO2.erase 0) := by
    intro point hpoint
    have hcenter := (hlocal.1 0).2
    fin_cases point <;>
      simp_all [CapSelectedFiniteCode.intS, CapSelectedFiniteCode.capO1,
        CapSelectedFiniteCode.capO2]
  exact exists_mem_target_of_row_card_four_of_two_oneHit _ _ _ _
    (hlocal.1 0).1 hcover (hlocal.2.1.1.1) (hlocal.2.1.1.2)

private theorem exists_row_one_mem_intO1 {P : PatternCode}
    (hlocal : LocalRowsOK P) :
    ∃ point, point ∈ CapSelectedFiniteCode.intO1 ∧ point ∈ row P 1 := by
  have hcover : row P 1 ⊆
      CapSelectedFiniteCode.intO1 ∪
        (CapSelectedFiniteCode.capS.erase 1 ∪
          CapSelectedFiniteCode.capO2.erase 1) := by
    intro point hpoint
    have hcenter := (hlocal.1 1).2
    fin_cases point <;>
      simp_all [CapSelectedFiniteCode.intO1, CapSelectedFiniteCode.capS,
        CapSelectedFiniteCode.capO2]
  exact exists_mem_target_of_row_card_four_of_two_oneHit _ _ _ _
    (hlocal.1 1).1 hcover (hlocal.2.1.2.1.1) (hlocal.2.1.2.1.2)

private theorem exists_row_two_mem_intO2 {P : PatternCode}
    (hlocal : LocalRowsOK P) :
    ∃ point, point ∈ CapSelectedFiniteCode.intO2 ∧ point ∈ row P 2 := by
  have hcover : row P 2 ⊆
      CapSelectedFiniteCode.intO2 ∪
        (CapSelectedFiniteCode.capS.erase 2 ∪
          CapSelectedFiniteCode.capO1.erase 2) := by
    intro point hpoint
    have hcenter := (hlocal.1 2).2
    fin_cases point <;>
      simp_all [CapSelectedFiniteCode.intO2, CapSelectedFiniteCode.capS,
        CapSelectedFiniteCode.capO1]
  exact exists_mem_target_of_row_card_four_of_two_oneHit _ _ _ _
    (hlocal.1 2).1 hcover (hlocal.2.1.2.2.1) (hlocal.2.1.2.2.2)

private theorem row_zero_one_intO2_eq_empty
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (hconv : ConvexIndep A) (hlocal : LocalRowsOK (patternCode L F)) :
    row (patternCode L F) 0 ∩ row (patternCode L F) 1 ∩
        CapSelectedFiniteCode.intO2 = ∅ := by
  ext z
  constructor
  swap
  · simp
  intro hz
  rcases Finset.mem_inter.mp hz with ⟨hzRows, hzInt⟩
  rcases Finset.mem_inter.mp hzRows with ⟨hz0, hz1⟩
  rcases exists_row_zero_mem_intS hlocal with ⟨p, hpInt, hp0⟩
  rcases exists_row_one_mem_intO1 hlocal with ⟨q, hqInt, hq1⟩
  have hcenter0 :
      L.pointOf 0 = (S.triangleByIndex S.oppIndex2).v2 :=
    L.point_zero_eq_opposite.trans
      S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm
  have hcenter1 :
      L.pointOf 1 = (S.triangleByIndex S.oppIndex2).v3 :=
    L.point_one_eq_opposite.trans
      S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm
  exfalso
  exact S.q3_shared_interior_false_of_adjacent_selectedClass_membership
    hconv S.oppIndex2
    ((mem_intO2_iff_point_mem_oppInterior2 L z).mp hzInt)
    (by
      rw [leftAdjacentIndex_oppIndex2_eq_surplusIdx]
      exact (mem_intS_iff_point_mem_surplusInterior L p).mp hpInt)
    (by
      rw [rightAdjacentIndex_oppIndex2_eq_oppIndex1]
      exact (mem_intO1_iff_point_mem_oppInterior1 L q).mp hqInt)
    (by simpa only [hcenter0] using mem_selectedClass_of_mem_row L F hz0)
    (by simpa only [hcenter0] using mem_selectedClass_of_mem_row L F hp0)
    (by simpa only [hcenter1] using mem_selectedClass_of_mem_row L F hz1)
    (by simpa only [hcenter1] using mem_selectedClass_of_mem_row L F hq1)

private theorem row_zero_two_intO1_eq_empty
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (hconv : ConvexIndep A) (hlocal : LocalRowsOK (patternCode L F)) :
    row (patternCode L F) 0 ∩ row (patternCode L F) 2 ∩
        CapSelectedFiniteCode.intO1 = ∅ := by
  ext z
  constructor
  swap
  · simp
  intro hz
  rcases Finset.mem_inter.mp hz with ⟨hzRows, hzInt⟩
  rcases Finset.mem_inter.mp hzRows with ⟨hz0, hz2⟩
  rcases exists_row_two_mem_intO2 hlocal with ⟨p, hpInt, hp2⟩
  rcases exists_row_zero_mem_intS hlocal with ⟨q, hqInt, hq0⟩
  have hcenter2 :
      L.pointOf 2 = (S.triangleByIndex S.oppIndex1).v2 :=
    L.point_two_eq_opposite.trans
      S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2.symm
  have hcenter0 :
      L.pointOf 0 = (S.triangleByIndex S.oppIndex1).v3 :=
    L.point_zero_eq_opposite.trans
      S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm
  exfalso
  exact S.q3_shared_interior_false_of_adjacent_selectedClass_membership
    hconv S.oppIndex1
    ((mem_intO1_iff_point_mem_oppInterior1 L z).mp hzInt)
    (by
      rw [leftAdjacentIndex_oppIndex1_eq_oppIndex2]
      exact (mem_intO2_iff_point_mem_oppInterior2 L p).mp hpInt)
    (by
      rw [rightAdjacentIndex_oppIndex1_eq_surplusIdx]
      exact (mem_intS_iff_point_mem_surplusInterior L q).mp hqInt)
    (by simpa only [hcenter2] using mem_selectedClass_of_mem_row L F hz2)
    (by simpa only [hcenter2] using mem_selectedClass_of_mem_row L F hp2)
    (by simpa only [hcenter0] using mem_selectedClass_of_mem_row L F hz0)
    (by simpa only [hcenter0] using mem_selectedClass_of_mem_row L F hq0)

private theorem row_one_two_intS_eq_empty
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (hconv : ConvexIndep A) (hlocal : LocalRowsOK (patternCode L F)) :
    row (patternCode L F) 1 ∩ row (patternCode L F) 2 ∩
        CapSelectedFiniteCode.intS = ∅ := by
  ext z
  constructor
  swap
  · simp
  intro hz
  rcases Finset.mem_inter.mp hz with ⟨hzRows, hzInt⟩
  rcases Finset.mem_inter.mp hzRows with ⟨hz1, hz2⟩
  rcases exists_row_one_mem_intO1 hlocal with ⟨p, hpInt, hp1⟩
  rcases exists_row_two_mem_intO2 hlocal with ⟨q, hqInt, hq2⟩
  have hcenter1 :
      L.pointOf 1 = (S.triangleByIndex S.surplusIdx).v2 :=
    L.point_one_eq_opposite.trans
      S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm
  have hcenter2 :
      L.pointOf 2 = (S.triangleByIndex S.surplusIdx).v3 :=
    L.point_two_eq_opposite.trans
      S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm
  exfalso
  exact S.q3_shared_interior_false_of_adjacent_selectedClass_membership
    hconv S.surplusIdx
    ((mem_intS_iff_point_mem_surplusInterior L z).mp hzInt)
    (by
      rw [← S.oppIndex1_eq_leftAdjacentIndex_surplusIdx]
      exact (mem_intO1_iff_point_mem_oppInterior1 L p).mp hpInt)
    (by
      rw [← S.oppIndex2_eq_rightAdjacentIndex_surplusIdx]
      exact (mem_intO2_iff_point_mem_oppInterior2 L q).mp hqInt)
    (by simpa only [hcenter1] using mem_selectedClass_of_mem_row L F hz1)
    (by simpa only [hcenter1] using mem_selectedClass_of_mem_row L F hp1)
    (by simpa only [hcenter2] using mem_selectedClass_of_mem_row L F hz2)
    (by simpa only [hcenter2] using mem_selectedClass_of_mem_row L F hq2)

private theorem sharedPair_sameSide_false
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (i : Fin 3) {firstCenter secondCenter x y : Label}
    (hfirst : L.pointOf firstCenter = (S.triangleByIndex i).v2)
    (hsecond : L.pointOf secondCenter = (S.triangleByIndex i).v3)
    (hxOut : L.pointOf x ∉ S.capByIndex i)
    (hyOut : L.pointOf y ∉ S.capByIndex i)
    (hxy : x ≠ y)
    (hxFirst : x ∈ row (patternCode L F) firstCenter)
    (hyFirst : y ∈ row (patternCode L F) firstCenter)
    (hxSecond : x ∈ row (patternCode L F) secondCenter)
    (hySecond : y ∈ row (patternCode L F) secondCenter) :
    False := by
  let hreal := realizes_patternCode L F
  refine S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex
    i (rq := dist (L.pointOf firstCenter) (L.pointOf x))
    (rv := dist (L.pointOf secondCenter) (L.pointOf x))
    (L.mem_carrier x) (L.mem_carrier y) hxOut hyOut
    (L.injective.ne hxy) ?_ ?_ ?_ ?_
  · rw [← hfirst, dist_comm]
  · calc
      dist (L.pointOf y) (S.triangleByIndex i).v2 =
          dist (L.pointOf firstCenter) (L.pointOf y) := by
            rw [← hfirst, dist_comm]
      _ = dist (L.pointOf firstCenter) (L.pointOf x) :=
        hreal.equidist firstCenter y hyFirst x hxFirst
  · rw [← hsecond, dist_comm]
  · calc
      dist (L.pointOf y) (S.triangleByIndex i).v3 =
          dist (L.pointOf secondCenter) (L.pointOf y) := by
            rw [← hsecond, dist_comm]
      _ = dist (L.pointOf secondCenter) (L.pointOf x) :=
        hreal.equidist secondCenter y hySecond x hxSecond

/-- The pulled-back rows satisfy all three K-Q3-5 emptiness clauses and all
three K-Q3-1 alternatives in the finite incidence contract. -/
theorem q3OK_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hsurplusCard : S.surplusCap.card = 6) :
    Q3OK (patternCode L F) := by
  let hlocal := localRowsOK_patternCode L F hconv hM44 hsurplusCard
  refine ⟨row_zero_one_intO2_eq_empty L F hconv hlocal, ?_,
    row_zero_two_intO1_eq_empty L F hconv hlocal, ?_,
    row_one_two_intS_eq_empty L F hconv hlocal, ?_⟩
  · by_cases hS :
        row (patternCode L F) 0 ∩ row (patternCode L F) 1 ∩
          CapSelectedFiniteCode.intS = ∅
    · exact Or.inl hS
    · apply Or.inr
      by_contra hO1
      rcases Finset.nonempty_iff_ne_empty.mpr hS with ⟨x, hx⟩
      rcases Finset.nonempty_iff_ne_empty.mpr hO1 with ⟨y, hy⟩
      rcases Finset.mem_inter.mp hx with ⟨hxRows, hxInt⟩
      rcases Finset.mem_inter.mp hxRows with ⟨hx0, hx1⟩
      rcases Finset.mem_inter.mp hy with ⟨hyRows, hyInt⟩
      rcases Finset.mem_inter.mp hyRows with ⟨hy0, hy1⟩
      have hxI := (mem_intS_iff_point_mem_surplusInterior L x).mp hxInt
      have hyI := (mem_intO1_iff_point_mem_oppInterior1 L y).mp hyInt
      have hxy : x ≠ y := by
        intro h
        subst y
        exact Finset.disjoint_left.mp (by decide) hxInt hyInt
      apply sharedPair_sameSide_false L F S.oppIndex2
        (L.point_zero_eq_opposite.trans
          S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm)
        (L.point_one_eq_opposite.trans
          S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm)
        (S.capInteriorByIndex_not_mem_capByIndex_of_ne hxI
          S.surplusIdx_ne_oppIndex2)
        (S.capInteriorByIndex_not_mem_capByIndex_of_ne hyI
          S.oppIndex1_ne_oppIndex2)
        hxy hx0 hy0 hx1 hy1
  · by_cases hS :
        row (patternCode L F) 0 ∩ row (patternCode L F) 2 ∩
          CapSelectedFiniteCode.intS = ∅
    · exact Or.inl hS
    · apply Or.inr
      by_contra hO2
      rcases Finset.nonempty_iff_ne_empty.mpr hS with ⟨x, hx⟩
      rcases Finset.nonempty_iff_ne_empty.mpr hO2 with ⟨y, hy⟩
      rcases Finset.mem_inter.mp hx with ⟨hxRows, hxInt⟩
      rcases Finset.mem_inter.mp hxRows with ⟨hx0, hx2⟩
      rcases Finset.mem_inter.mp hy with ⟨hyRows, hyInt⟩
      rcases Finset.mem_inter.mp hyRows with ⟨hy0, hy2⟩
      have hxI := (mem_intS_iff_point_mem_surplusInterior L x).mp hxInt
      have hyI := (mem_intO2_iff_point_mem_oppInterior2 L y).mp hyInt
      have hxy : x ≠ y := by
        intro h
        subst y
        exact Finset.disjoint_left.mp (by decide) hxInt hyInt
      apply sharedPair_sameSide_false L F S.oppIndex1
        (L.point_two_eq_opposite.trans
          S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2.symm)
        (L.point_zero_eq_opposite.trans
          S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm)
        (S.capInteriorByIndex_not_mem_capByIndex_of_ne hxI
          S.surplusIdx_ne_oppIndex1)
        (S.capInteriorByIndex_not_mem_capByIndex_of_ne hyI
          S.oppIndex1_ne_oppIndex2.symm)
        hxy hx2 hy2 hx0 hy0
  · by_cases hO1 :
        row (patternCode L F) 1 ∩ row (patternCode L F) 2 ∩
          CapSelectedFiniteCode.intO1 = ∅
    · exact Or.inl hO1
    · apply Or.inr
      by_contra hO2
      rcases Finset.nonempty_iff_ne_empty.mpr hO1 with ⟨x, hx⟩
      rcases Finset.nonempty_iff_ne_empty.mpr hO2 with ⟨y, hy⟩
      rcases Finset.mem_inter.mp hx with ⟨hxRows, hxInt⟩
      rcases Finset.mem_inter.mp hxRows with ⟨hx1, hx2⟩
      rcases Finset.mem_inter.mp hy with ⟨hyRows, hyInt⟩
      rcases Finset.mem_inter.mp hyRows with ⟨hy1, hy2⟩
      have hxI := (mem_intO1_iff_point_mem_oppInterior1 L x).mp hxInt
      have hyI := (mem_intO2_iff_point_mem_oppInterior2 L y).mp hyInt
      have hxy : x ≠ y := by
        intro h
        subst y
        exact Finset.disjoint_left.mp (by decide) hxInt hyInt
      apply sharedPair_sameSide_false L F S.surplusIdx
        (L.point_one_eq_opposite.trans
          S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm)
        (L.point_two_eq_opposite.trans
          S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm)
        (S.capInteriorByIndex_not_mem_capByIndex_of_ne hxI
          S.surplusIdx_ne_oppIndex1.symm)
        (S.capInteriorByIndex_not_mem_capByIndex_of_ne hyI
          S.surplusIdx_ne_oppIndex2.symm)
        hxy hx1 hy1 hx2 hy2

/-- Equality in the surplus-cap pair count gives the exact endpoint/interior
cap-hit profile required by the finite code. -/
theorem capSelectedCountsOK_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hsurplusCard : S.surplusCap.card = 6) :
    CapSelectedCountsOK (patternCode L F) := by
  intro center hcenter
  have hcapS := labelsOf_surplusCap_eq_capS L hsurplusCard
  have hcenterCap : L.pointOf center ∈ S.surplusCap := by
    apply L.toCard11Labeling.mem_labelsOf.mp
    rw [hcapS]
    exact hcenter
  have hsurplusSubset : S.surplusCap ⊆ A := by
    rw [← capByIndex_surplusIdx_eq_surplusCap S]
    exact S.capByIndex_subset S.surplusIdx
  have hpointOne :
      L.pointOf 1 = (S.triangleByIndex S.surplusIdx).v2 :=
    L.point_one_eq_opposite.trans
      S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm
  have hpointTwo :
      L.pointOf 2 = (S.triangleByIndex S.surplusIdx).v3 :=
    L.point_two_eq_opposite.trans
      S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm
  have hendpointLabels :
      (L.pointOf center = (S.triangleByIndex S.surplusIdx).v2 ∨
          L.pointOf center = (S.triangleByIndex S.surplusIdx).v3) ↔
        (center = 1 ∨ center = 2) := by
    constructor
    · rintro (hpoint | hpoint)
      · exact Or.inl (L.injective (hpoint.trans hpointOne.symm))
      · exact Or.inr (L.injective (hpoint.trans hpointTwo.symm))
    · rintro (rfl | rfl)
      · exact Or.inl hpointOne
      · exact Or.inr hpointTwo
  calc
    (row (patternCode L F) center ∩ CapSelectedFiniteCode.capS).card =
        ((F.classAt (L.pointOf center) (L.mem_carrier center)).support ∩
          S.surplusCap).card := by
      rw [← hcapS]
      exact row_inter_labelsOf_card_eq L F center _ hsurplusSubset
    _ = if L.pointOf center = (S.triangleByIndex S.surplusIdx).v2 ∨
          L.pointOf center = (S.triangleByIndex S.surplusIdx).v3 then 1 else 2 :=
      CapSelectedRowCounting.SurplusCapPacket.selectedClass_support_inter_surplusCap_card_eq
        S hconv hM44 F hsurplusCard (L.mem_carrier center) hcenterCap
    _ = if center = 1 ∨ center = 2 then 1 else 2 := by
      simp only [hendpointLabels]

/-- The canonical pullback of a faithful carrier satisfies every incidence
and convex-order premise consumed by the cap-selected finite classifier. -/
theorem incidenceOK_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hsurplusCard : S.surplusCap.card = 6) :
    IncidenceOK (patternCode L F) := by
  exact
    ⟨localRowsOK_patternCode L F hconv hM44 hsurplusCard,
      rowIntersectionsOK_patternCode L F,
      pairCenterCountOK_patternCode L F hconv,
      crossSeparationOK_patternCode L F,
      q3OK_patternCode L F hconv hM44 hsurplusCard,
      capSelectedCountsOK_patternCode L F hconv hM44 hsurplusCard⟩

end CapSelectedCarrierBridge
end Census554
end Problem97
