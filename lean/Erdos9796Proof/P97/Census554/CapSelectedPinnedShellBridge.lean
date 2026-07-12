/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedCarrierBridge
import Erdos9796Proof.P97.Census554.PinnedCarrierBridge
import Erdos9796Proof.P97.EndpointCertificate.OrderedCoreSigns

/-!
# Pinned-shell realization for the cap-selected code

This module turns an aligned geometric pinned carrier and critical-shell system
into the finite `PinnedShellOK` seed consumed by the native closure theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace CapSelectedPinnedShellBridge

open CapSelectedFiniteCode
open CapSelectedGeometry
open CapSelectedCarrierBridge
open GeneralCarrierBridge
open CapSelectedNativeClosureSound
open EqualityCore

/-- The canonical label of a known carrier point. -/
noncomputable def labelOfPoint {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (point : ℝ²) (hpoint : point ∈ A) : Label :=
  Classical.choose (L.carrier_surjective point hpoint)

theorem pointOf_labelOfPoint {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (point : ℝ²) (hpoint : point ∈ A) :
    L.pointOf (labelOfPoint L point hpoint) = point :=
  Classical.choose_spec (L.carrier_surjective point hpoint)

private theorem blockerPoint_mem_carrier {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (H : CriticalShellSystem A) (q : Label) :
    H.centerAt (L.pointOf q) (L.mem_carrier q) ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt (L.pointOf q) (L.mem_carrier q)).toCriticalFourShell.center_mem).2

/-- Pull the geometric critical-shell blocker map back to the canonical labels. -/
noncomputable def blockerLabel {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (H : CriticalShellSystem A) (q : Label) : Label :=
  labelOfPoint L (H.centerAt (L.pointOf q) (L.mem_carrier q))
    (blockerPoint_mem_carrier L H q)

theorem pointOf_blockerLabel {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (H : CriticalShellSystem A) (q : Label) :
    L.pointOf (blockerLabel L H q) =
      H.centerAt (L.pointOf q) (L.mem_carrier q) :=
  pointOf_labelOfPoint L _ _

private theorem classAt_support_eq_of_eq {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) {left right : ℝ²}
    (hleft : left ∈ A) (hright : right ∈ A) (hpoint : left = right) :
    (F.classAt left hleft).support = (F.classAt right hright).support := by
  subst right
  rfl

private theorem centerAt_congr {A : Finset ℝ²} (H : CriticalShellSystem A)
    {left right : ℝ²} (hleft : left ∈ A) (hright : right ∈ A)
    (hpoint : left = right) :
    H.centerAt left hleft = H.centerAt right hright := by
  subst right
  rfl

theorem blockerLabel_ne_source {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (H : CriticalShellSystem A) (q : Label) :
    blockerLabel L H q ≠ q := by
  intro hq
  have hcenterNe :
      H.centerAt (L.pointOf q) (L.mem_carrier q) ≠ L.pointOf q :=
    (Finset.mem_erase.mp
      (H.selectedAt (L.pointOf q) (L.mem_carrier q)).toCriticalFourShell.center_mem).1
  apply hcenterNe
  rw [← pointOf_blockerLabel L H q, hq]

theorem source_mem_blockerLabel_row {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (q : Label) :
    q ∈ row (patternCode L F) (blockerLabel L H q) := by
  apply (mem_row_patternCode_iff L F (blockerLabel L H q) q).mpr
  rw [classAt_support_eq_of_eq F
    (L.mem_carrier (blockerLabel L H q)) (blockerPoint_mem_carrier L H q)
    (pointOf_blockerLabel L H q)]
  exact H.source_mem_selectedFourClass (L.pointOf q) (L.mem_carrier q)
    (F.classAt (H.centerAt (L.pointOf q) (L.mem_carrier q))
      (blockerPoint_mem_carrier L H q))

private theorem labelOfPoint_mem_intS {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) {point : ℝ²} (hpointA : point ∈ A)
    (hpointInt : point ∈ S.capInteriorByIndex S.surplusIdx) :
    labelOfPoint L point hpointA ∈ intS := by
  rw [← L.surplusInterior_eq, L.toCard11Labeling.mem_labelsOf]
  simpa only [pointOf_labelOfPoint] using hpointInt

private theorem rightPinned_row_eq {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x)
    (hFpin :
      (F.classAt (S.oppositeVertexByIndex S.oppIndex1)
        (S.oppositeVertexByIndex_mem S.oppIndex1)).support =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius) :
    row (patternCode L F) 1 =
      {0, 7, 8, labelOfPoint L x
        (mem_selectedClass.mp
          (S.pinnedRightSurplusResidual_mem_selectedClass hpinned)).1} := by
  classical
  let pinSource : Label := labelOfPoint L x
    (mem_selectedClass.mp
      (S.pinnedRightSurplusResidual_mem_selectedClass hpinned)).1
  have hxSurplus := S.pinnedRightSurplusResidual_mem_right_surplus hpinned
  rcases S.pinnedRightSurplusResidual_selectedClass_eq_surplusApex hpinned
      hxSurplus with
    ⟨p1, p2, hp12, hprivate, hpinnedClass⟩
  have hcenter1 : L.pointOf 1 = S.oppositeVertexByIndex S.oppIndex1 :=
    L.point_one_eq_opposite
  have hcenter0 : L.pointOf 0 = S.oppositeVertexByIndex S.surplusIdx :=
    L.point_zero_eq_opposite
  have hsupport1 :
      (F.classAt (L.pointOf 1) (L.mem_carrier 1)).support =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius := by
    calc
      (F.classAt (L.pointOf 1) (L.mem_carrier 1)).support =
          (F.classAt (S.oppositeVertexByIndex S.oppIndex1)
            (S.oppositeVertexByIndex_mem S.oppIndex1)).support :=
        classAt_support_eq_of_eq F (L.mem_carrier 1)
          (S.oppositeVertexByIndex_mem S.oppIndex1) hcenter1
      _ = SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius := hFpin
  have hrowCard : (row (patternCode L F) 1).card = 4 :=
    row_patternCode_card L F 1
  have hpinInt : pinSource ∈ intS := by
    exact labelOfPoint_mem_intS L
      (mem_selectedClass.mp
        (S.pinnedRightSurplusResidual_mem_selectedClass hpinned)).1
      (S.mem_surplusInterior_of_oppIndex1_right_surplus
        (S.pinnedRightSurplusResidual_radius_pos hpinned)
        (S.pinnedRightSurplusResidual_mem_selectedClass hpinned) hxSurplus)
  have htargetCard : ({0, 7, 8, pinSource} : Finset Label).card = 4 := by
    have hpinNe0 : pinSource ≠ 0 := by
      intro h
      have : (0 : Label) ∈ intS := h ▸ hpinInt
      exact (by decide : ¬ ((0 : Label) = 3 ∨ (0 : Label) = 4 ∨
        (0 : Label) = 5 ∨ (0 : Label) = 6)) (by simpa [intS] using this)
    have hpinNe7 : pinSource ≠ 7 := by
      intro h
      have : (7 : Label) ∈ intS := h ▸ hpinInt
      exact (by decide : ¬ ((7 : Label) = 3 ∨ (7 : Label) = 4 ∨
        (7 : Label) = 5 ∨ (7 : Label) = 6)) (by simpa [intS] using this)
    have hpinNe8 : pinSource ≠ 8 := by
      intro h
      have : (8 : Label) ∈ intS := h ▸ hpinInt
      exact (by decide : ¬ ((8 : Label) = 3 ∨ (8 : Label) = 4 ∨
        (8 : Label) = 5 ∨ (8 : Label) = 6)) (by simpa [intS] using this)
    rw [Finset.card_insert_of_notMem (by simp [hpinNe0.symm]),
      Finset.card_insert_of_notMem (by simp [hpinNe7.symm]),
      Finset.card_insert_of_notMem (by simp [hpinNe8.symm])]
    simp
  symm
  apply Finset.eq_of_subset_of_card_le
  · intro label hlabel
    simp only [Finset.mem_insert, Finset.mem_singleton] at hlabel
    rcases hlabel with rfl | rfl | rfl | hlabel
    · apply (mem_row_patternCode_iff L F 1 0).mpr
      rw [hsupport1, hpinnedClass]
      simp [hcenter0]
    · have hmem : L.pointOf 7 ∈ S.oppInterior1 := by
        apply L.toCard11Labeling.mem_labelsOf.mp
        rw [L.oppInterior1_eq]
        decide
      change L.pointOf 7 ∈ S.capInteriorByIndex S.oppIndex1 at hmem
      rw [hprivate] at hmem
      apply (mem_row_patternCode_iff L F 1 7).mpr
      rw [hsupport1, hpinnedClass]
      simp only [Finset.mem_insert, Finset.mem_singleton] at hmem ⊢
      rcases hmem with hmem | hmem
      · exact Or.inl hmem
      · exact Or.inr (Or.inl hmem)
    · have hmem : L.pointOf 8 ∈ S.oppInterior1 := by
        apply L.toCard11Labeling.mem_labelsOf.mp
        rw [L.oppInterior1_eq]
        decide
      change L.pointOf 8 ∈ S.capInteriorByIndex S.oppIndex1 at hmem
      rw [hprivate] at hmem
      apply (mem_row_patternCode_iff L F 1 8).mpr
      rw [hsupport1, hpinnedClass]
      simp only [Finset.mem_insert, Finset.mem_singleton] at hmem ⊢
      rcases hmem with hmem | hmem
      · exact Or.inl hmem
      · exact Or.inr (Or.inl hmem)
    · subst label
      apply (mem_row_patternCode_iff L F 1 pinSource).mpr
      rw [hsupport1]
      simpa only [pinSource, pointOf_labelOfPoint] using
        S.pinnedRightSurplusResidual_mem_selectedClass hpinned
  · rw [hrowCard, htargetCard]

/-- An aligned right-pinned carrier realizes the finite pinned-shell seed.

The deleted source is the surplus selected-four-class point whose critical
shell center is not the pinned opposite vertex. -/
theorem exists_right_pinnedShellOK_of_alignedCarrier
    {D : CounterexampleData}
    (L : CanonicalLabeling D.packet) {radius : ℝ} {x y p : ℝ²}
    (hpinned : D.packet.PinnedRightSurplusResidualAt radius x)
    (K : SelectedFourClass D.A
      (D.packet.oppositeVertexByIndex D.packet.surplusIdx))
    (hyInt : y ∈ D.packet.capInteriorByIndex D.packet.surplusIdx)
    (hyK : y ∈ K.support)
    (C : CriticalSelectedFourClass D.A y p)
    (hyNot : y ∉ SelectedClass D.A
      (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius)
    (hpne : p ≠ D.packet.oppositeVertexByIndex D.packet.oppIndex1)
    (haligned : RightPinnedSurplusAlignedCarrierData
      D radius y p K C) :
    ∃ (H : CriticalShellSystem D.A) (F : FaithfulCarrierPattern D.A),
      PinnedShellOK (patternCode L F) (blockerLabel L H)
        (labelOfPoint L x
          (mem_selectedClass.mp
            (D.packet.pinnedRightSurplusResidual_mem_selectedClass hpinned)).1)
        (labelOfPoint L y (K.support_subset_A hyK)) := by
  classical
  rcases haligned with ⟨H, F, hHpin, hHy, hFpin, hFK, _hFC⟩
  let pinSource : Label := labelOfPoint L x
    (mem_selectedClass.mp
      (D.packet.pinnedRightSurplusResidual_mem_selectedClass hpinned)).1
  let deleted : Label := labelOfPoint L y (K.support_subset_A hyK)
  have hxA : x ∈ D.A :=
    (mem_selectedClass.mp
      (D.packet.pinnedRightSurplusResidual_mem_selectedClass hpinned)).1
  have hyA : y ∈ D.A := K.support_subset_A hyK
  have hxInt : x ∈ D.packet.capInteriorByIndex D.packet.surplusIdx :=
    D.packet.mem_surplusInterior_of_oppIndex1_right_surplus
      (D.packet.pinnedRightSurplusResidual_radius_pos hpinned)
      (D.packet.pinnedRightSurplusResidual_mem_selectedClass hpinned)
      (D.packet.pinnedRightSurplusResidual_mem_right_surplus hpinned)
  have hpinInt : pinSource ∈ intS :=
    labelOfPoint_mem_intS L hxA hxInt
  have hdeletedInt : deleted ∈ intS :=
    labelOfPoint_mem_intS L hyA hyInt
  have hxy : x ≠ y := by
    intro hxy
    apply hyNot
    rw [← hxy]
    exact D.packet.pinnedRightSurplusResidual_mem_selectedClass hpinned
  have hpinDeleted : pinSource ≠ deleted := by
    intro hlabels
    apply hxy
    calc
      x = L.pointOf (labelOfPoint L x hxA) :=
        (pointOf_labelOfPoint L x hxA).symm
      _ = L.pointOf (labelOfPoint L y hyA) := congrArg L.pointOf hlabels
      _ = y := pointOf_labelOfPoint L y hyA
  have hrowPin : row (patternCode L F) 1 = {0, 7, 8, pinSource} :=
    rightPinned_row_eq L F hpinned hFpin
  have hsurplus0 :
      (F.classAt (L.pointOf 0) (L.mem_carrier 0)).support = K.support := by
    calc
      (F.classAt (L.pointOf 0) (L.mem_carrier 0)).support =
          (F.classAt (D.packet.oppositeVertexByIndex D.packet.surplusIdx)
            (D.packet.oppositeVertexByIndex_mem D.packet.surplusIdx)).support :=
        classAt_support_eq_of_eq F (L.mem_carrier 0)
          (D.packet.oppositeVertexByIndex_mem D.packet.surplusIdx)
          L.point_zero_eq_opposite
      _ = K.support := hFK
  have hdeletedRow0 : deleted ∈ row (patternCode L F) 0 := by
    apply (mem_row_patternCode_iff L F 0 deleted).mpr
    rw [hsurplus0]
    simpa only [deleted, pointOf_labelOfPoint] using hyK
  have hblockerRows : ∀ q, blockerLabel L H q ≠ q ∧
      q ∈ row (patternCode L F) (blockerLabel L H q) := by
    intro q
    exact ⟨blockerLabel_ne_source L H q, source_mem_blockerLabel_row L F H q⟩
  have hcenter1 : L.pointOf 1 =
      D.packet.oppositeVertexByIndex D.packet.oppIndex1 :=
    L.point_one_eq_opposite
  have hsupport1 :
      (F.classAt (L.pointOf 1) (L.mem_carrier 1)).support =
        SelectedClass D.A
          (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius := by
    calc
      (F.classAt (L.pointOf 1) (L.mem_carrier 1)).support =
          (F.classAt (D.packet.oppositeVertexByIndex D.packet.oppIndex1)
            (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex1)).support :=
        classAt_support_eq_of_eq F (L.mem_carrier 1)
          (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex1) hcenter1
      _ = SelectedClass D.A
          (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius := hFpin
  have hrow1Blocker : ∀ q, q ∈ row (patternCode L F) 1 →
      blockerLabel L H q = 1 := by
    intro q hq
    apply L.injective
    rw [pointOf_blockerLabel]
    have hqClass : L.pointOf q ∈
        SelectedClass D.A
          (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius := by
      rw [← hsupport1]
      exact (mem_row_patternCode_iff L F 1 q).mp hq
    rw [hHpin (L.pointOf q) (L.mem_carrier q) hqClass, hcenter1.symm]
  have hdeletedCenter : L.pointOf (blockerLabel L H deleted) = p := by
    rw [pointOf_blockerLabel]
    calc
      H.centerAt (L.pointOf deleted) (L.mem_carrier deleted) =
          H.centerAt y C.toCriticalFourShell.q_mem_A :=
        centerAt_congr H (L.mem_carrier deleted) C.toCriticalFourShell.q_mem_A
          (pointOf_labelOfPoint L y hyA)
      _ = p := hHy
  have hdeletedBlocker : blockerLabel L H deleted ≠ 1 := by
    intro hblocked
    apply hpne
    calc
      p = L.pointOf (blockerLabel L H deleted) := hdeletedCenter.symm
      _ = L.pointOf 1 := congrArg L.pointOf hblocked
      _ = D.packet.oppositeVertexByIndex D.packet.oppIndex1 := hcenter1
  exact ⟨H, F, hpinInt, hdeletedInt, hpinDeleted, hrowPin, hdeletedRow0,
    hblockerRows, hrow1Blocker, hdeletedBlocker⟩

/-- The right-pinned residual reaches the certified finite closure alternative. -/
theorem exists_right_closureCoreAlternative_of_alignedCarrier
    {D : CounterexampleData}
    (L : CanonicalLabeling D.packet) (hM44 : D.packet.IsM44)
    (hsurplusCard : D.packet.surplusCap.card = 6) {radius : ℝ} {x y p : ℝ²}
    (hpinned : D.packet.PinnedRightSurplusResidualAt radius x)
    (K : SelectedFourClass D.A
      (D.packet.oppositeVertexByIndex D.packet.surplusIdx))
    (hyInt : y ∈ D.packet.capInteriorByIndex D.packet.surplusIdx)
    (hyK : y ∈ K.support)
    (C : CriticalSelectedFourClass D.A y p)
    (hyNot : y ∉ SelectedClass D.A
      (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius)
    (hpne : p ≠ D.packet.oppositeVertexByIndex D.packet.oppIndex1)
    (haligned : RightPinnedSurplusAlignedCarrierData D radius y p K C) :
    ∃ (H : CriticalShellSystem D.A) (F : FaithfulCarrierPattern D.A),
      ClosureCoreAlternative (patternCode L F) (blockerLabel L H) := by
  rcases exists_right_pinnedShellOK_of_alignedCarrier L hpinned K hyInt hyK C
      hyNot hpne haligned with ⟨H, F, hpinnedShell⟩
  refine ⟨H, F, ?_⟩
  exact closureCoreAlternative_of_incidenceOK_pinnedShellOK
    (incidenceOK_patternCode L F D.convex hM44 hsurplusCard) hpinnedShell

/-- A duplicate-center core of the pulled-back finite code is impossible. -/
theorem false_of_duplicateCenterCore_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (core : DuplicateCenterCore (rowPattern (patternCode L F))) : False :=
  not_realizes_of_duplicateCenterCore core ⟨_, realizes_patternCode L F⟩

/-- A perpendicular-bisector core of the pulled-back finite code contradicts
convex independence of the geometric carrier. -/
theorem false_of_perpBisectorCore_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (hconv : ConvexIndep A)
    (core : PerpBisectorCore (rowPattern (patternCode L F))) : False :=
  false_of_convexIndep_of_perpBisectorCore (realizes_patternCode L F) hconv
    L.mem_carrier core

/-- The finite label of a critical-shell blocker inherits the carrier-level
exactness of that blocker row. -/
theorem exactAt_blockerLabel_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (q : Label) :
    ExactAt (rowPattern (patternCode L F)) L.pointOf (blockerLabel L H q) := by
  intro a ha z hz hdist
  let qCarrier : GeneralCarrierBridge.CarrierLabel A :=
    ⟨L.pointOf q, L.mem_carrier q⟩
  let aCarrier : GeneralCarrierBridge.CarrierLabel A :=
    ⟨L.pointOf a, L.mem_carrier a⟩
  let zCarrier : GeneralCarrierBridge.CarrierLabel A :=
    ⟨L.pointOf z, L.mem_carrier z⟩
  let cCarrier : GeneralCarrierBridge.CarrierLabel A :=
    GeneralCarrierBridge.blockerLabel H (L.pointOf q) (L.mem_carrier q)
  have hc : cCarrier.1 = L.pointOf (blockerLabel L H q) := by
    simpa [cCarrier] using (pointOf_blockerLabel L H q).symm
  have hsupport :
      (F.classAt cCarrier.1 cCarrier.2).support =
        (F.classAt (L.pointOf (blockerLabel L H q))
          (L.mem_carrier (blockerLabel L H q))).support :=
    classAt_support_eq_of_eq F cCarrier.2
      (L.mem_carrier (blockerLabel L H q)) hc
  have haCarrier : aCarrier ∈ GeneralCarrierBridge.rowPattern F cCarrier := by
    apply (GeneralCarrierBridge.mem_rowPattern_iff F cCarrier aCarrier).mpr
    rw [hsupport]
    exact (mem_row_patternCode_iff L F (blockerLabel L H q) a).mp ha
  have hzCarrier : zCarrier ∉ GeneralCarrierBridge.rowPattern F cCarrier := by
    intro hzCarrier
    apply hz
    apply (mem_row_patternCode_iff L F (blockerLabel L H q) z).mpr
    rw [← hsupport]
    exact (GeneralCarrierBridge.mem_rowPattern_iff F cCarrier zCarrier).mp hzCarrier
  have hdistCarrier :
      dist cCarrier.1 zCarrier.1 = dist cCarrier.1 aCarrier.1 := by
    simpa [hc, aCarrier, zCarrier] using hdist
  exact GeneralCarrierBridge.exactAt_blocker F H (L.pointOf q) (L.mem_carrier q)
    aCarrier haCarrier zCarrier hzCarrier hdistCarrier

/-- An exact-off-circle core at a selected finite blocker is impossible. -/
theorem false_of_exactOffCircleCore_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (source : Label)
    (core : ExactOffCircleCore (rowPattern (patternCode L F)))
    (hcenter : core.c = blockerLabel L H source) : False := by
  apply false_of_exactAt_of_exactOffCircleCore (realizes_patternCode L F) core
  rw [hcenter]
  exact exactAt_blockerLabel_patternCode L F H source

/-- An oriented convex-five core of the finite code is impossible under either
canonical hull orientation. -/
theorem false_of_convexFivePointCore_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (core : ConvexFivePointCore.Core (rowPattern (patternCode L F)))
    (hcyc : CyclicFiveUpToOrientation core.a core.x core.b core.c core.y) :
    False :=
  OrderedCoreSigns.cyclicFiveCore_false_of_canonicalLabeling L
    (realizes_patternCode L F) core hcyc

/-- Every certified finite closure alternative contradicts its realized right
carrier once the finite blocker map is supplied by a critical-shell system. -/
theorem false_of_closureCoreAlternative_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (hconv : ConvexIndep A)
    (hcore : ClosureCoreAlternative (patternCode L F) (blockerLabel L H)) :
    False := by
  rcases hcore with hduplicate | hexact | hequalK4 | hequilateral | hthree |
      hsurplus | hsix | horbit | hnetwork | hperp | hfive | hrhombus
  · rcases hduplicate with ⟨core⟩
    exact false_of_duplicateCenterCore_patternCode L F core
  · rcases hexact with ⟨source, core, hcenter⟩
    exact false_of_exactOffCircleCore_patternCode L F H source core hcenter
  · rcases hequalK4 with ⟨core⟩
    exact not_realizes_of_equalK4Core core ⟨_, realizes_patternCode L F⟩
  · rcases hequilateral with ⟨core⟩
    exact not_realizes_of_equilateralBisectorCollisionCore core
      ⟨_, realizes_patternCode L F⟩
  · rcases hthree with ⟨core⟩
    exact not_realizes_of_threeTriadCollisionCore core ⟨_, realizes_patternCode L F⟩
  · rcases hsurplus with ⟨core⟩
    exact not_realizes_of_surplusSourceCollisionCore core
      ⟨_, realizes_patternCode L F⟩
  · rcases hsix with ⟨core⟩
    exact not_realizes_of_sixRowAnchorCollisionCore core
      ⟨_, realizes_patternCode L F⟩
  · rcases horbit with ⟨core⟩
    exact not_realizes_of_sevenPointOrbitCollisionCore core
      ⟨_, realizes_patternCode L F⟩
  · rcases hnetwork with ⟨core⟩
    exact not_realizes_of_sevenPointCircleNetworkCollisionCore core
      ⟨_, realizes_patternCode L F⟩
  · rcases hperp with ⟨core⟩
    exact false_of_perpBisectorCore_patternCode L F hconv core
  · rcases hfive with ⟨core, hcyc⟩
    exact false_of_convexFivePointCore_patternCode L F core hcyc
  · rcases hrhombus with ⟨core, hcyc⟩
    exact OrderedCoreSigns.cyclicSixCore_false_of_canonicalLabeling L
      (realizes_patternCode L F) core hcyc

/-- An aligned right-pinned residual is impossible. -/
theorem false_of_right_pinnedResidual_alignedCarrier
    {D : CounterexampleData}
    (L : CanonicalLabeling D.packet) (hM44 : D.packet.IsM44)
    (hsurplusCard : D.packet.surplusCap.card = 6) {radius : ℝ} {x y p : ℝ²}
    (hpinned : D.packet.PinnedRightSurplusResidualAt radius x)
    (K : SelectedFourClass D.A
      (D.packet.oppositeVertexByIndex D.packet.surplusIdx))
    (hyInt : y ∈ D.packet.capInteriorByIndex D.packet.surplusIdx)
    (hyK : y ∈ K.support)
    (C : CriticalSelectedFourClass D.A y p)
    (hyNot : y ∉ SelectedClass D.A
      (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius)
    (hpne : p ≠ D.packet.oppositeVertexByIndex D.packet.oppIndex1)
    (haligned : RightPinnedSurplusAlignedCarrierData D radius y p K C) :
    False := by
  rcases exists_right_closureCoreAlternative_of_alignedCarrier L hM44
      hsurplusCard hpinned K hyInt hyK C hyNot hpne haligned with ⟨H, F, hcore⟩
  exact false_of_closureCoreAlternative_patternCode L F H D.convex hcore

end CapSelectedPinnedShellBridge
end Census554
end Problem97
