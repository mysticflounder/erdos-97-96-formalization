/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AlignedP5BoundaryPacket
import AlignedP5MetricSound
import AlignedP5MirrorNativeCoverage

/-!
# Mirror aligned-p5 source trace

This file pulls the selected rows of a mirror `AlignedP5MirrorBoundaryPacket` back
to `Fin 11` and proves the semantic obligations consumed by the native
coverage theorem.  It treats only the mirror boundary arm.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourAlignedP5BoundaryScratch.AlignedP5MirrorBoundaryPacket

open ATailUniqueFourAlignedP5BoundaryScratch
open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailAlignedP5MetricSoundScratch
open ATailAlignedP5NativeClassifierScratch
open ATailAlignedP5MirrorNativeClassifierScratch
open ATailAlignedP5MirrorNativeCoverageScratch
open Census554
open Census554.CapSelectedFiniteCode
open Census554.CapSelectedNativeClassifier
open Census554.CapSelectedNativeClassifierFacts
open Census554.CapSelectedNativeClassifierSound
open Census554.EqualityCore
open Census554.SeparationCore

attribute [local instance] Classical.propDecidable

theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

theorem oppApex1_eq_oppositeVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

theorem oppApex2_eq_oppositeVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

section Packet

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
  {P : AlignedInteriorFrontier R}
  (Q : AlignedP5MirrorBoundaryPacket R profile P)

theorem boundary_mem (i : Fin 11) : Q.boundary i ∈ D.A := by
  have hi :
      Q.boundary i ∈ Finset.univ.image Q.boundary :=
    Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
  simpa only [Q.boundary_image] using hi

noncomputable abbrev code : PatternCode :=
  ATailAlignedP5MetricSoundScratch.patternCode Q.boundary Q.boundary_mem
    Q.carrierPattern

/-- Inverse boundary label used to pull arbitrary support points back to the
mirror `Fin 11` enumeration. -/
noncomputable def boundaryIndexOf
    (label : GeneralCarrierBridge.CarrierLabel D.A) : Fin 11 :=
  Classical.choose <| by
    have hmem : label.1 ∈ Finset.univ.image Q.boundary := by
      rw [Q.boundary_image]
      exact label.2
    rcases Finset.mem_image.mp hmem with ⟨i, _hi, hpoint⟩
    exact ⟨i, hpoint⟩

theorem boundary_boundaryIndexOf
    (label : GeneralCarrierBridge.CarrierLabel D.A) :
    Q.boundary (Q.boundaryIndexOf label) = label.1 :=
  Classical.choose_spec <| by
    have hmem : label.1 ∈ Finset.univ.image Q.boundary := by
      rw [Q.boundary_image]
      exact label.2
    rcases Finset.mem_image.mp hmem with ⟨i, _hi, hpoint⟩
    exact ⟨i, hpoint⟩

theorem classAt_zero_eq_firstApex :
    (Q.carrierPattern.classAt
        (Q.boundary 0) (Q.boundary_mem 0)).support =
      (Q.carrierPattern.classAt S.oppApex1 Q.firstApex_mem).support := by
  let center :
      {point : ℝ² // point ∈ D.A} :=
    ⟨Q.boundary 0, Q.boundary_mem 0⟩
  let apex :
      {point : ℝ² // point ∈ D.A} :=
    ⟨S.oppApex1, Q.firstApex_mem⟩
  have hcenter : center = apex := by
    apply Subtype.ext
    exact Q.boundary_zero
  exact congrArg
    (fun point : {point : ℝ² // point ∈ D.A} =>
      (Q.carrierPattern.classAt point.1 point.2).support)
    hcenter

theorem row_inter_indices_card_eq
    (center : Label) (indices : Finset Label) :
    (row Q.code center ∩ indices).card =
      ((Q.carrierPattern.classAt (Q.boundary center) (Q.boundary_mem center)).support ∩
        indices.image Q.boundary).card := by
  calc
    (row Q.code center ∩ indices).card =
        ((row Q.code center ∩ indices).image Q.boundary).card :=
      (Finset.card_image_of_injective _ Q.boundary_injective).symm
    _ = _ := by
      apply congrArg Finset.card
      ext point
      simp only [Finset.mem_image, Finset.mem_inter]
      constructor
      · rintro ⟨label, ⟨hrow, hindices⟩, rfl⟩
        refine ⟨(mem_row_patternCode_iff Q.boundary Q.boundary_mem
          Q.carrierPattern center label).mp hrow, ?_⟩
        exact ⟨label, hindices, rfl⟩
      · rintro ⟨hsupport, ⟨label, hindices, hpoint⟩⟩
        subst point
        exact ⟨label,
          ⟨(mem_row_patternCode_iff Q.boundary Q.boundary_mem
            Q.carrierPattern center label).mpr hsupport, hindices⟩, rfl⟩

theorem row_card (center : Label) :
    (row Q.code center).card = 4 := by
  have h := Q.row_inter_indices_card_eq center Finset.univ
  rw [Q.boundary_image,
    Finset.inter_eq_left.mpr
      (Q.carrierPattern.classAt
        (Q.boundary center) (Q.boundary_mem center)).support_subset_A] at h
  simpa only [Finset.inter_univ] using h.trans
    (Q.carrierPattern.classAt
      (Q.boundary center) (Q.boundary_mem center)).support_card

theorem center_not_mem_row (center : Label) :
    center ∉ row Q.code center := by
  intro hcenter
  have hsupport :=
    (mem_row_patternCode_iff Q.boundary Q.boundary_mem
      Q.carrierPattern center center).mp hcenter
  exact
    (Q.carrierPattern.classAt
      (Q.boundary center) (Q.boundary_mem center)).center_not_mem hsupport

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem countPoints_labels_eq_card (points : Finset Label) :
    countPoints (maskOfFinset points)
      ATailAlignedP5NativeClassifierScratch.labels = points.card := by
  native_decide +revert

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem countPoints_surplusCap_eq_card (points : Finset Label) :
    countPoints (maskOfFinset points) surplusCap =
      (points ∩ mirrorSurplusClosedIndices).card := by
  native_decide +revert

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem countPoints_firstOppositeCap_eq_card (points : Finset Label) :
    countPoints (maskOfFinset points) firstOppositeCap =
      (points ∩ mirrorFirstOppositeClosedIndices).card := by
  native_decide +revert

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem countPoints_secondOppositeCap_eq_card (points : Finset Label) :
    countPoints (maskOfFinset points) secondOppositeCap =
      (points ∩ mirrorSecondOppositeClosedIndices).card := by
  native_decide +revert

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem first_row_finite_shape (points : Finset Label)
    (hcard : points.card = 4) (hzero : (0 : Label) ∉ points)
    (hfour : (4 : Label) ∈ points) (hfive : (5 : Label) ∈ points)
    (hsix : (6 : Label) ∈ points) :
    ∃ extra : Label,
      extra.val ∈ ATailAlignedP5MirrorNativeClassifierScratch.extraPoints ∧
        ({ center := 0, support := maskOfFinset points } :
          ATailAlignedP5NativeClassifierScratch.Row) =
          ATailAlignedP5MirrorNativeClassifierScratch.fixedFirstRow extra.val := by
  native_decide +revert

set_option linter.style.nativeDecide false in
theorem mem_mirrorSurplusClosedIndices_of_surplusCap_contains (center : Label)
    (h : surplusCap.contains center.val = true) :
    center ∈ mirrorSurplusClosedIndices := by
  native_decide +revert

set_option linter.style.nativeDecide false in
theorem mem_mirrorFirstOppositeClosedIndices_of_firstOppositeCap_contains (center : Label)
    (h : firstOppositeCap.contains center.val = true) :
    center ∈ mirrorFirstOppositeClosedIndices := by
  native_decide +revert

set_option linter.style.nativeDecide false in
theorem mem_mirrorSecondOppositeClosedIndices_of_secondOppositeCap_contains (center : Label)
    (h : secondOppositeCap.contains center.val = true) :
    center ∈ mirrorSecondOppositeClosedIndices := by
  native_decide +revert

set_option linter.style.nativeDecide false in
theorem eq_seven_or_zero_of_surplusEndpoints_contains (center : Label)
    (h : surplusEndpoints.contains center.val = true) :
    center = 7 ∨ center = 0 := by
  native_decide +revert

set_option linter.style.nativeDecide false in
theorem eq_three_or_seven_of_firstOppositeEndpoints_contains (center : Label)
    (h : firstOppositeEndpoints.contains center.val = true) :
    center = 3 ∨ center = 7 := by
  native_decide +revert

set_option linter.style.nativeDecide false in
theorem eq_zero_or_three_of_secondOppositeEndpoints_contains (center : Label)
    (h : secondOppositeEndpoints.contains center.val = true) :
    center = 0 ∨ center = 3 := by
  native_decide +revert

theorem countPoints_surplusCap_eq_support_inter (center : Label) :
    countPoints (rowOfPattern Q.code center).support surplusCap =
      ((Q.carrierPattern.classAt
        (Q.boundary center) (Q.boundary_mem center)).support ∩
          S.surplusCap).card := by
  rw [show (rowOfPattern Q.code center).support =
      maskOfFinset (row Q.code center) from rfl,
    countPoints_surplusCap_eq_card]
  exact (Q.row_inter_indices_card_eq center mirrorSurplusClosedIndices).trans <| by
    rw [Q.mirrorSurplusClosedIndices_image]

theorem countPoints_firstOppositeCap_eq_support_inter (center : Label) :
    countPoints (rowOfPattern Q.code center).support firstOppositeCap =
      ((Q.carrierPattern.classAt
        (Q.boundary center) (Q.boundary_mem center)).support ∩
          S.oppCap1).card := by
  rw [show (rowOfPattern Q.code center).support =
      maskOfFinset (row Q.code center) from rfl,
    countPoints_firstOppositeCap_eq_card]
  exact
    (Q.row_inter_indices_card_eq center mirrorFirstOppositeClosedIndices).trans <| by
      rw [Q.mirrorFirstOppositeClosedIndices_image]

theorem countPoints_secondOppositeCap_eq_support_inter (center : Label) :
    countPoints (rowOfPattern Q.code center).support secondOppositeCap =
      ((Q.carrierPattern.classAt
        (Q.boundary center) (Q.boundary_mem center)).support ∩
          S.oppCap2).card := by
  rw [show (rowOfPattern Q.code center).support =
      maskOfFinset (row Q.code center) from rfl,
    countPoints_secondOppositeCap_eq_card]
  exact
    (Q.row_inter_indices_card_eq center mirrorSecondOppositeClosedIndices).trans <| by
      rw [Q.mirrorSecondOppositeClosedIndices_image]

theorem surplusCap_count_le_two (center : Label)
    (hcenter : surplusCap.contains center.val = true) :
    countPoints (rowOfPattern Q.code center).support surplusCap ≤ 2 := by
  have hindex : center ∈ mirrorSurplusClosedIndices := by
    exact mem_mirrorSurplusClosedIndices_of_surplusCap_contains center hcenter
  have hpoint : Q.boundary center ∈ S.capByIndex S.surplusIdx := by
    rw [capByIndex_surplusIdx_eq_surplusCap]
    rw [← Q.mirrorSurplusClosedIndices_image]
    exact Finset.mem_image.mpr ⟨center, hindex, rfl⟩
  rw [Q.countPoints_surplusCap_eq_support_inter,
    ← capByIndex_surplusIdx_eq_surplusCap]
  exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
    S D.convex S.surplusIdx
      (Q.carrierPattern.classAt
        (Q.boundary center) (Q.boundary_mem center)) hpoint

theorem firstOppositeCap_count_le_two (center : Label)
    (hcenter : firstOppositeCap.contains center.val = true) :
    countPoints (rowOfPattern Q.code center).support firstOppositeCap ≤ 2 := by
  have hindex : center ∈ mirrorFirstOppositeClosedIndices := by
    exact mem_mirrorFirstOppositeClosedIndices_of_firstOppositeCap_contains center hcenter
  have hpoint : Q.boundary center ∈ S.capByIndex S.oppIndex1 := by
    rw [capByIndex_oppIndex1_eq_oppCap1]
    rw [← Q.mirrorFirstOppositeClosedIndices_image]
    exact Finset.mem_image.mpr ⟨center, hindex, rfl⟩
  rw [Q.countPoints_firstOppositeCap_eq_support_inter,
    ← capByIndex_oppIndex1_eq_oppCap1]
  exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
    S D.convex S.oppIndex1
      (Q.carrierPattern.classAt
        (Q.boundary center) (Q.boundary_mem center)) hpoint

theorem secondOppositeCap_count_le_two (center : Label)
    (hcenter : secondOppositeCap.contains center.val = true) :
    countPoints (rowOfPattern Q.code center).support secondOppositeCap ≤ 2 := by
  have hindex : center ∈ mirrorSecondOppositeClosedIndices := by
    exact mem_mirrorSecondOppositeClosedIndices_of_secondOppositeCap_contains center hcenter
  have hpoint : Q.boundary center ∈ S.capByIndex S.oppIndex2 := by
    rw [capByIndex_oppIndex2_eq_oppCap2]
    rw [← Q.mirrorSecondOppositeClosedIndices_image]
    exact Finset.mem_image.mpr ⟨center, hindex, rfl⟩
  rw [Q.countPoints_secondOppositeCap_eq_support_inter,
    ← capByIndex_oppIndex2_eq_oppCap2]
  exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
    S D.convex S.oppIndex2
      (Q.carrierPattern.classAt
        (Q.boundary center) (Q.boundary_mem center)) hpoint

theorem surplusCap_endpoint_count_le_one (center : Label)
    (hcenter : surplusEndpoints.contains center.val = true) :
    countPoints (rowOfPattern Q.code center).support surplusCap ≤ 1 := by
  have hcases : center = 7 ∨ center = 0 := by
    exact eq_seven_or_zero_of_surplusEndpoints_contains center hcenter
  rw [Q.countPoints_surplusCap_eq_support_inter,
    ← capByIndex_surplusIdx_eq_surplusCap]
  rcases hcases with rfl | rfl
  · exact Census554.Card11SelectedCube.support_inter_capByIndex_card_le_one
      S D.convex
        (Q.carrierPattern.classAt (Q.boundary 7) (Q.boundary_mem 7))
        S.surplusIdx_ne_oppIndex2
        (Q.boundary_seven.trans (oppApex2_eq_oppositeVertexByIndex S))
  · exact Census554.Card11SelectedCube.support_inter_capByIndex_card_le_one
      S D.convex
        (Q.carrierPattern.classAt (Q.boundary 0) (Q.boundary_mem 0))
        S.surplusIdx_ne_oppIndex1
        (Q.boundary_zero.trans (oppApex1_eq_oppositeVertexByIndex S))

theorem firstOppositeCap_endpoint_count_le_one (center : Label)
    (hcenter : firstOppositeEndpoints.contains center.val = true) :
    countPoints (rowOfPattern Q.code center).support firstOppositeCap ≤ 1 := by
  have hcases : center = 3 ∨ center = 7 := by
    exact eq_three_or_seven_of_firstOppositeEndpoints_contains center hcenter
  rw [Q.countPoints_firstOppositeCap_eq_support_inter,
    ← capByIndex_oppIndex1_eq_oppCap1]
  rcases hcases with rfl | rfl
  · exact Census554.Card11SelectedCube.support_inter_capByIndex_card_le_one
      S D.convex
        (Q.carrierPattern.classAt (Q.boundary 3) (Q.boundary_mem 3))
        S.surplusIdx_ne_oppIndex1.symm Q.boundary_three
  · exact Census554.Card11SelectedCube.support_inter_capByIndex_card_le_one
      S D.convex
        (Q.carrierPattern.classAt (Q.boundary 7) (Q.boundary_mem 7))
        S.oppIndex1_ne_oppIndex2
        (Q.boundary_seven.trans (oppApex2_eq_oppositeVertexByIndex S))

theorem secondOppositeCap_endpoint_count_le_one (center : Label)
    (hcenter : secondOppositeEndpoints.contains center.val = true) :
    countPoints (rowOfPattern Q.code center).support secondOppositeCap ≤ 1 := by
  have hcases : center = 0 ∨ center = 3 := by
    exact eq_zero_or_three_of_secondOppositeEndpoints_contains center hcenter
  rw [Q.countPoints_secondOppositeCap_eq_support_inter,
    ← capByIndex_oppIndex2_eq_oppCap2]
  rcases hcases with rfl | rfl
  · exact Census554.Card11SelectedCube.support_inter_capByIndex_card_le_one
      S D.convex
        (Q.carrierPattern.classAt (Q.boundary 0) (Q.boundary_mem 0))
        S.oppIndex1_ne_oppIndex2.symm
        (Q.boundary_zero.trans (oppApex1_eq_oppositeVertexByIndex S))
  · exact Census554.Card11SelectedCube.support_inter_capByIndex_card_le_one
      S D.convex
        (Q.carrierPattern.classAt (Q.boundary 3) (Q.boundary_mem 3))
        S.surplusIdx_ne_oppIndex2.symm Q.boundary_three

theorem ownCapOK_row (center : Label) :
    ATailAlignedP5MirrorNativeClassifierScratch.ownCapOK center.val
      (rowOfPattern Q.code center).support = true := by
  have hfirst :
      capBoundOK surplusCap surplusEndpoints center.val
        (rowOfPattern Q.code center).support = true := by
    by_cases hcap : center.val ∈ surplusCap
    · have hcap' : surplusCap.contains center.val = true :=
        List.contains_iff_mem.mpr hcap
      by_cases hend : center.val ∈ surplusEndpoints
      · have hend' : surplusEndpoints.contains center.val = true :=
          List.contains_iff_mem.mpr hend
        simp [capBoundOK, hcap, hend, Q.surplusCap_count_le_two center hcap',
          Q.surplusCap_endpoint_count_le_one center hend']
      · simp [capBoundOK, hcap, hend, Q.surplusCap_count_le_two center hcap']
    · simp [capBoundOK, hcap]
  have haligned :
      capBoundOK firstOppositeCap firstOppositeEndpoints center.val
        (rowOfPattern Q.code center).support = true := by
    by_cases hcap : center.val ∈ firstOppositeCap
    · have hcap' : firstOppositeCap.contains center.val = true :=
        List.contains_iff_mem.mpr hcap
      by_cases hend : center.val ∈ firstOppositeEndpoints
      · have hend' : firstOppositeEndpoints.contains center.val = true :=
          List.contains_iff_mem.mpr hend
        simp [capBoundOK, hcap, hend, Q.firstOppositeCap_count_le_two center hcap',
          Q.firstOppositeCap_endpoint_count_le_one center hend']
      · simp [capBoundOK, hcap, hend, Q.firstOppositeCap_count_le_two center hcap']
    · simp [capBoundOK, hcap]
  have hshort :
      capBoundOK secondOppositeCap secondOppositeEndpoints center.val
        (rowOfPattern Q.code center).support = true := by
    by_cases hcap : center.val ∈ secondOppositeCap
    · have hcap' : secondOppositeCap.contains center.val = true :=
        List.contains_iff_mem.mpr hcap
      by_cases hend : center.val ∈ secondOppositeEndpoints
      · have hend' : secondOppositeEndpoints.contains center.val = true :=
          List.contains_iff_mem.mpr hend
        simp [capBoundOK, hcap, hend, Q.secondOppositeCap_count_le_two center hcap',
          Q.secondOppositeCap_endpoint_count_le_one center hend']
      · simp [capBoundOK, hcap, hend, Q.secondOppositeCap_count_le_two center hcap']
    · simp [capBoundOK, hcap]
  simp [ATailAlignedP5MirrorNativeClassifierScratch.ownCapOK, hfirst, haligned, hshort]

theorem first_row_aligned_hit (i : Fin 3) :
    mirrorFirstOppositeInteriorIndex i ∈ row Q.code 0 := by
  apply (mem_row_patternCode_iff Q.boundary Q.boundary_mem
    Q.carrierPattern 0 (mirrorFirstOppositeInteriorIndex i)).mpr
  change Q.boundary (mirrorFirstOppositeInteriorIndex i) ∈
    (Q.carrierPattern.classAt (Q.boundary 0) (Q.boundary_mem 0)).support
  have hmem :
      Q.boundary (mirrorFirstOppositeInteriorIndex i) ∈
        (Q.carrierPattern.classAt S.oppApex1 Q.firstApex_mem).support := by
    rw [Q.firstApex_row_eq]
    exact Q.boundary_firstOppositeInteriorIndex_mem_exactClass i
  rw [Q.classAt_zero_eq_firstApex]
  exact hmem

theorem alignedClassOK_row (center : Label) :
    ATailAlignedP5MirrorNativeClassifierScratch.exactFirstClassOK center.val
      (rowOfPattern Q.code center).support = true := by
  by_cases hcenter : center = 0
  · subst center
    have hfour : (4 : Label) ∈ row Q.code 0 := by
      simpa [mirrorFirstOppositeInteriorIndex] using
        Q.first_row_aligned_hit (0 : Fin 3)
    have hfive : (5 : Label) ∈ row Q.code 0 := by
      simpa [mirrorFirstOppositeInteriorIndex] using
        Q.first_row_aligned_hit (1 : Fin 3)
    have hsix : (6 : Label) ∈ row Q.code 0 := by
      simpa [mirrorFirstOppositeInteriorIndex] using
        Q.first_row_aligned_hit (2 : Fin 3)
    have hfour' :
        has (rowOfPattern Q.code 0).support 4 = true := by
      exact (has_rowMaskOf Q.code 0 (4 : Label)).trans
        ((mem_row_iff Q.code 0 4).mp hfour)
    have hfive' :
        has (rowOfPattern Q.code 0).support 5 = true := by
      exact (has_rowMaskOf Q.code 0 (5 : Label)).trans
        ((mem_row_iff Q.code 0 5).mp hfive)
    have hsix' :
        has (rowOfPattern Q.code 0).support 6 = true := by
      exact (has_rowMaskOf Q.code 0 (6 : Label)).trans
        ((mem_row_iff Q.code 0 6).mp hsix)
    simp [ATailAlignedP5MirrorNativeClassifierScratch.exactFirstClassOK,
      hfour', hfive', hsix']
  · have hval : center.val ≠ 0 := by
      intro hzero
      apply hcenter
      apply Fin.ext
      simpa using hzero
    simp [ATailAlignedP5MirrorNativeClassifierScratch.exactFirstClassOK, hval]

theorem localCandidateOK_row (center : Label) :
    ATailAlignedP5MirrorNativeClassifierScratch.localCandidateOK center.val
      (rowOfPattern Q.code center).support = true := by
  have hcode : Q.code center center = false := by
    apply Bool.eq_false_iff.mpr
    intro htrue
    exact Q.center_not_mem_row center
      ((mem_row_iff Q.code center center).mpr htrue)
  have hself :
      has (rowOfPattern Q.code center).support center.val = false := by
    exact (has_rowMaskOf Q.code center center).trans hcode
  have hcount :
      countPoints (rowOfPattern Q.code center).support
          ATailAlignedP5NativeClassifierScratch.labels = 4 := by
    exact (countPoints_labels_eq_card (row Q.code center)).trans
      (Q.row_card center)
  rw [ATailAlignedP5MirrorNativeClassifierScratch.localCandidateOK,
    hcount, hself, Q.ownCapOK_row center, Q.alignedClassOK_row center]
  decide

theorem candidate_row (center : Label) :
    rowOfPattern Q.code center ∈
      ATailAlignedP5MirrorNativeClassifierScratch.candidateRows center.val := by
  have hlt :
      (rowOfPattern Q.code center).support < 2048 := by
    exact maskOfFinset_lt_2048 (row Q.code center)
  simp only [ATailAlignedP5MirrorNativeClassifierScratch.candidateRows,
    List.mem_filterMap]
  refine ⟨(rowOfPattern Q.code center).support,
    List.mem_range.mpr hlt, ?_⟩
  simp only [Q.localCandidateOK_row center, if_true]
  rfl

theorem firstRow :
    ∃ extra,
      extra ∈ ATailAlignedP5MirrorNativeClassifierScratch.extraPoints ∧
        rowOfPattern Q.code 0 =
          ATailAlignedP5MirrorNativeClassifierScratch.fixedFirstRow extra := by
  have hfour : (4 : Label) ∈ row Q.code 0 := by
    simpa [mirrorFirstOppositeInteriorIndex] using
      Q.first_row_aligned_hit (0 : Fin 3)
  have hfive : (5 : Label) ∈ row Q.code 0 := by
    simpa [mirrorFirstOppositeInteriorIndex] using
      Q.first_row_aligned_hit (1 : Fin 3)
  have hsix : (6 : Label) ∈ row Q.code 0 := by
    simpa [mirrorFirstOppositeInteriorIndex] using
      Q.first_row_aligned_hit (2 : Fin 3)
  rcases first_row_finite_shape (row Q.code 0) (Q.row_card 0)
      (Q.center_not_mem_row 0) hfour hfive hsix with
    ⟨extra, hextra, hrow⟩
  exact ⟨extra.val, hextra, by simpa [rowOfPattern] using hrow⟩

theorem row_inter_card_le_two
    {left right : Label} (hne : left ≠ right) :
    (row Q.code left ∩ row Q.code right).card ≤ 2 := by
  let Kleft :=
    Q.carrierPattern.classAt (Q.boundary left) (Q.boundary_mem left)
  let Kright :=
    Q.carrierPattern.classAt (Q.boundary right) (Q.boundary_mem right)
  have hinter :
      (row Q.code left ∩ row Q.code right).image Q.boundary =
        Kleft.support ∩ Kright.support := by
    ext point
    simp only [Finset.mem_image, Finset.mem_inter]
    constructor
    · rintro ⟨label, ⟨hleft, hright⟩, rfl⟩
      exact
        ⟨(mem_row_patternCode_iff Q.boundary Q.boundary_mem
            Q.carrierPattern left label).mp hleft,
          (mem_row_patternCode_iff Q.boundary Q.boundary_mem
            Q.carrierPattern right label).mp hright⟩
    · rintro ⟨hleft, hright⟩
      let label : Label := Q.boundaryIndexOf ⟨point,
        Kleft.support_subset_A hleft⟩
      have hpoint : Q.boundary label = point :=
        Q.boundary_boundaryIndexOf ⟨point, Kleft.support_subset_A hleft⟩
      refine ⟨label, ⟨?_, ?_⟩, hpoint⟩
      · apply (mem_row_patternCode_iff Q.boundary Q.boundary_mem
          Q.carrierPattern left label).mpr
        simpa [hpoint] using hleft
      · apply (mem_row_patternCode_iff Q.boundary Q.boundary_mem
          Q.carrierPattern right label).mpr
        simpa [hpoint] using hright
  have hcard :
      (row Q.code left ∩ row Q.code right).card =
        (Kleft.support ∩ Kright.support).card := by
    rw [← hinter, Finset.card_image_of_injective _ Q.boundary_injective]
  rw [hcard]
  exact SelectedFourClass.inter_card_le_two Kleft Kright <| by
    intro hcenters
    exact hne (Q.boundary_injective hcenters)

theorem pairCenterCountOK : PairCenterCountOK Q.code := by
  intro left right hne
  let hits : Finset Label :=
    Finset.univ.filter fun center =>
      left ∈ row Q.code center ∧ right ∈ row Q.code center
  let target : Finset ℝ² :=
    D.A.filter fun center =>
      dist center (Q.boundary left) = dist center (Q.boundary right)
  have hmaps : Set.MapsTo Q.boundary (↑hits) (↑target) := by
    intro center hcenter
    have hrows :
        left ∈ row Q.code center ∧ right ∈ row Q.code center := by
      simpa [hits] using hcenter
    have hleft := (mem_row_patternCode_iff Q.boundary Q.boundary_mem
      Q.carrierPattern center left).mp hrows.1
    have hright := (mem_row_patternCode_iff Q.boundary Q.boundary_mem
      Q.carrierPattern center right).mp hrows.2
    exact Finset.mem_filter.mpr ⟨Q.boundary_mem center, by
      rw [(Q.carrierPattern.classAt
          (Q.boundary center) (Q.boundary_mem center)).support_eq_radius
            _ hleft,
        (Q.carrierPattern.classAt
          (Q.boundary center) (Q.boundary_mem center)).support_eq_radius
            _ hright]⟩
  have hinjOn : Set.InjOn Q.boundary (↑hits) :=
    Q.boundary_injective.injOn
  have hle : hits.card ≤ target.card :=
    Finset.card_le_card_of_injOn Q.boundary hmaps hinjOn
  have htarget : target.card ≤ 2 := by
    simpa [target] using
      Dumitrescu.perpBisector_apex_bound D.convex
        (Q.boundary_mem left) (Q.boundary_mem right)
        (Q.boundary_injective.ne hne)
  change hits.card ≤ 2
  exact hle.trans htarget

set_option maxHeartbeats 0 in
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem commonPoints_length_maskOfFinset
    (left right : Finset Label) :
    (commonPoints (maskOfFinset left) (maskOfFinset right)).length =
      (left ∩ right).card := by
  native_decide +revert

set_option linter.style.nativeDecide false in
theorem cyclicSeparated_swap_of_away
    (left right first second : Label)
    (hfirstLeft : first ≠ left) (hfirstRight : first ≠ right)
    (hsecondLeft : second ≠ left) (hsecondRight : second ≠ right) :
    ATailAlignedP5NativeClassifierScratch.cyclicSeparated
        left.val right.val first.val second.val =
      ATailAlignedP5NativeClassifierScratch.cyclicSeparated
        right.val left.val first.val second.val := by
  native_decide +revert

set_option maxRecDepth 10000 in
theorem crossSeparationOK_row
    {left right : Label} (hne : left ≠ right) :
    ATailAlignedP5NativeClassifierScratch.crossSeparationOK
      (rowOfPattern Q.code left) (rowOfPattern Q.code right) = true := by
  simp only [ATailAlignedP5NativeClassifierScratch.crossSeparationOK,
    rowOfPattern]
  generalize hcommon :
      commonPoints (rowMaskOf Q.code left) (rowMaskOf Q.code right) = common
  cases common with
  | nil => rfl
  | cons first rest =>
      cases rest with
      | nil => rfl
      | cons second tail =>
          have hlength :
              (commonPoints (rowMaskOf Q.code left)
                (rowMaskOf Q.code right)).length =
                (row Q.code left ∩ row Q.code right).card := by
            simpa [rowMaskOf] using
              commonPoints_length_maskOfFinset
                (row Q.code left) (row Q.code right)
          rw [hcommon] at hlength
          have hinter := Q.row_inter_card_le_two hne
          have htail : tail = [] := by
            cases tail with
            | nil => rfl
            | cons third more =>
                simp only [List.length_cons] at hlength
                omega
          subst tail
          simp only [List.isEmpty, Bool.and_eq_true]
          have hfirstMem :
              first ∈ commonPoints
                (rowMaskOf Q.code left) (rowMaskOf Q.code right) := by
            rw [hcommon]
            simp
          have hsecondMem :
              second ∈ commonPoints
                (rowMaskOf Q.code left) (rowMaskOf Q.code right) := by
            rw [hcommon]
            simp
          let firstLabel : Label :=
            ⟨first, lt_eleven_of_mem_commonPoints hfirstMem⟩
          let secondLabel : Label :=
            ⟨second, lt_eleven_of_mem_commonPoints hsecondMem⟩
          have hfirstRows :=
            (mem_commonPoints_rowMaskOf Q.code left right firstLabel).mp
              (by simpa [firstLabel] using hfirstMem)
          have hsecondRows :=
            (mem_commonPoints_rowMaskOf Q.code left right secondLabel).mp
              (by simpa [secondLabel] using hsecondMem)
          have hpointsNe : firstLabel ≠ secondLabel := by
            intro heq
            have hnodup := commonPoints_nodup
              (rowMaskOf Q.code left) (rowMaskOf Q.code right)
            rw [hcommon] at hnodup
            have hval : first = second := congrArg Fin.val heq
            simp [hval] at hnodup
          have hsecondLeft : secondLabel ≠ left := by
            intro heq
            exact Q.center_not_mem_row left (heq ▸ hsecondRows.1)
          have hsecondRight : secondLabel ≠ right := by
            intro heq
            exact Q.center_not_mem_row right (heq ▸ hsecondRows.2)
          have hfirstLeft : firstLabel ≠ left := by
            intro heq
            exact Q.center_not_mem_row left (heq ▸ hfirstRows.1)
          have hfirstRight : firstLabel ≠ right := by
            intro heq
            exact Q.center_not_mem_row right (heq ▸ hfirstRows.2)
          let core : SharedPairSeparationCore (rowPattern Q.code) :=
            { firstCenter := left
              secondCenter := right
              firstPoint := firstLabel
              secondPoint := secondLabel
              centers_ne := hne
              secondPoint_ne_firstCenter := hsecondLeft
              secondPoint_ne_secondCenter := hsecondRight
              points_ne := hpointsNe
              firstCenter_eq := EdgeClosure.row left firstLabel secondLabel
                hfirstRows.1 hsecondRows.1
              secondCenter_eq := EdgeClosure.row right firstLabel secondLabel
                hfirstRows.2 hsecondRows.2 }
          have hreal :
              Realizes (rowPattern Q.code) Q.boundary :=
            realizes_patternCode Q.boundary Q.boundary_mem
              Q.boundary_injective Q.carrierPattern
          have hsat : core.SatisfiedBy (fun label => label) :=
            core.satisfiedBy_of_realizes_ccw hreal Q.boundary
              (fun label => label) Q.boundary_ccw Q.boundary_injective
              Function.injective_id (fun _ => rfl)
          refine ⟨trivial, ?_⟩
          rcases lt_or_gt_of_ne hne with hleftRight | hrightLeft
          · apply cyclicSeparated_eq_true_of_btw
              left right firstLabel secondLabel hleftRight
            simpa [core, SharedPairSeparationCore.SatisfiedBy,
              firstLabel, secondLabel] using hsat
          · let swapped : SharedPairSeparationCore (rowPattern Q.code) :=
              { firstCenter := right
                secondCenter := left
                firstPoint := firstLabel
                secondPoint := secondLabel
                centers_ne := hne.symm
                secondPoint_ne_firstCenter := hsecondRight
                secondPoint_ne_secondCenter := hsecondLeft
                points_ne := hpointsNe
                firstCenter_eq := EdgeClosure.row right firstLabel secondLabel
                  hfirstRows.2 hsecondRows.2
                secondCenter_eq := EdgeClosure.row left firstLabel secondLabel
                  hfirstRows.1 hsecondRows.1 }
            have hsatSwapped :
                swapped.SatisfiedBy (fun label => label) :=
              swapped.satisfiedBy_of_realizes_ccw hreal Q.boundary
                (fun label => label) Q.boundary_ccw Q.boundary_injective
                Function.injective_id (fun _ => rfl)
            have hcyclic :=
              cyclicSeparated_eq_true_of_btw right left firstLabel secondLabel
                hrightLeft (by
                  simpa [swapped, SharedPairSeparationCore.SatisfiedBy,
                    firstLabel, secondLabel] using hsatSwapped)
            have hswap :
                ATailAlignedP5NativeClassifierScratch.cyclicSeparated
                    left.val right.val first second =
                  ATailAlignedP5NativeClassifierScratch.cyclicSeparated
                    right.val left.val first second := by
              exact cyclicSeparated_swap_of_away
                left right firstLabel secondLabel
                hfirstLeft hfirstRight hsecondLeft hsecondRight
            rw [hswap]
            simpa [firstLabel, secondLabel] using hcyclic

theorem compatible
    (assignedCenters : List Label) (center : Label)
    (hnodup : assignedCenters.Nodup) (hfresh : center ∉ assignedCenters) :
    ATailAlignedP5NativeClassifierScratch.compatibleWith
      (assignedCenters.map (rowOfPattern Q.code))
      (rowOfPattern Q.code center) = true := by
  have hpair :
      pairBoundOK (assignedCenters.map (rowOfPattern Q.code))
        (rowOfPattern Q.code center) = true :=
    pairBoundOK_encodedRows Q.pairCenterCountOK hnodup hfresh
  have hcross :
      (assignedCenters.map (rowOfPattern Q.code)).all
        (fun previous =>
          ATailAlignedP5NativeClassifierScratch.rowsCompatible
            (rowOfPattern Q.code center) previous) = true := by
    rw [List.all_eq_true]
    intro previous hprevious
    rcases List.mem_map.mp hprevious with ⟨other, hother, rfl⟩
    apply Q.crossSeparationOK_row
    intro heq
    exact hfresh (heq ▸ hother)
  unfold ATailAlignedP5NativeClassifierScratch.compatibleWith
  rw [hpair, hcross]
  rfl

theorem exactFirstClass :
    ExactFirstClass Q.boundary Q.boundary_mem Q.carrierPattern := by
  have hfiveSelected :
      Q.boundary 5 ∈ SelectedClass D.A S.oppApex1 radius := by
    simpa [mirrorFirstOppositeInteriorIndex] using
      Q.boundary_firstOppositeInteriorIndex_mem_exactClass (1 : Fin 3)
  have hfiveSupport :
      Q.boundary 5 ∈
        (Q.carrierPattern.classAt S.oppApex1 Q.firstApex_mem).support := by
    rw [Q.firstApex_row_eq]
    exact hfiveSelected
  have hfiveDistance :
      dist S.oppApex1 (Q.boundary 5) = radius := by
    exact (mem_selectedClass.mp hfiveSelected).2
  have hradius :
      (Q.carrierPattern.classAt
        (Q.boundary 0) (Q.boundary_mem 0)).radius = radius := by
    calc
      (Q.carrierPattern.classAt
          (Q.boundary 0) (Q.boundary_mem 0)).radius =
          dist (Q.boundary 0) (Q.boundary 5) := by
        symm
        apply
          (Q.carrierPattern.classAt
            (Q.boundary 0) (Q.boundary_mem 0)).support_eq_radius
        rw [Q.classAt_zero_eq_firstApex]
        exact hfiveSupport
      _ = dist S.oppApex1 (Q.boundary 5) := by rw [Q.boundary_zero]
      _ = radius := hfiveDistance
  intro z hz hdistance
  have hselected : z ∈ SelectedClass D.A S.oppApex1 radius := by
    rw [mem_selectedClass]
    refine ⟨hz, ?_⟩
    calc
      dist S.oppApex1 z = dist (Q.boundary 0) z := by rw [Q.boundary_zero]
      _ =
          (Q.carrierPattern.classAt
            (Q.boundary 0) (Q.boundary_mem 0)).radius := hdistance
      _ = radius := hradius
  have hsupport :
      z ∈ (Q.carrierPattern.classAt S.oppApex1 Q.firstApex_mem).support := by
    rw [Q.firstApex_row_eq]
    exact hselected
  rw [Q.classAt_zero_eq_firstApex]
  exact hsupport

theorem metricCore_false
    (centers : List Label) (hcenters : centers.Nodup) :
    metricCore (centers.map (rowOfPattern Q.code)) = false :=
  metricCore_eq_false D.convex Q.boundary Q.boundary_mem
    Q.boundary_injective Q.boundary_ccw Q.carrierPattern
    Q.exactFirstClass centers hcenters

set_option maxRecDepth 10000 in
/-- A direct aligned-p5 boundary packet supplies every semantic trace field
used by the closed native coverage theorem. -/
noncomputable def semanticTrace :
    SemanticTrace Q.code where
  firstRow := Q.firstRow
  candidate := Q.candidate_row
  compatible := compatible Q
  metricCore_false := Q.metricCore_false

end Packet

end ATailUniqueFourAlignedP5BoundaryScratch.AlignedP5MirrorBoundaryPacket
end Problem97
