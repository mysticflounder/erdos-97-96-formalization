/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.RemovableVertexAxiom.Base
import Erdos9796Proof.P97.ErasedCertificate.CardTenP4SeedDFS

/-!
# Erased-pin card-ten producer

This module supplies the label-complete (`A.card = 10`) geometric producer
for both erased-pin banks.  P2 rows use fixed private masks.  The P4 arms
construct the private mask from the erased-pin selected class, route immediate
fixed-cap separation contradictions, and send the compatible remainder to the
generated P4 native bank.  Global `K4` supplies four-point support classes at
every other non-cap center, while same-radius geometry discharges the generated
pair-count and separation interfaces.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace ErasedCertificate

open SurplusCOMPGBank

private theorem orderedLabelPairs_ne {c cp : Label}
    (hpair : (c, cp) ∈ orderedLabelPairs) : c ≠ cp := by
  intro hEq
  subst cp
  cases c <;> simp [orderedLabelPairs] at hpair

private theorem p4PointMask_foldl_preserve_bit_of_forall_lt
    {α : Type _} [DecidableEq α] (pointOf : Label → α)
    (T : Finset α) (labels : List Label) {k acc : Nat}
    (hlabels : ∀ label ∈ labels, k < label.index) :
    (labels.foldl
        (fun acc label => if pointOf label ∈ T then label.bit + acc else acc)
        acc).testBit k = acc.testBit k := by
  induction labels generalizing acc with
  | nil => rfl
  | cons label rest ih =>
      simp only [List.foldl_cons]
      have hlabel : k < label.index := hlabels label (by simp)
      have hrest : ∀ member ∈ rest, k < member.index := by
        intro member hmember
        exact hlabels member (by simp [hmember])
      by_cases hmem : pointOf label ∈ T
      · rw [ih hrest]
        simp [hmem]
        simpa [Label.bit] using
          (Nat.testBit_two_pow_add_gt hlabel acc)
      · rw [ih hrest]
        simp [hmem]

private theorem p4PointMask_maskHas_true_of_mem_of_prefix_suffix
    {α : Type _} [DecidableEq α]
    {pointOf : Label → α} {T : Finset α}
    {pref suff : List Label} {label : Label}
    (hall : allLabels = pref ++ label :: suff)
    (hpref : maskOfLabels pref < 2 ^ label.index)
    (hsuff : ∀ member ∈ suff, label.index < member.index)
    (hmem : pointOf label ∈ T) :
    maskHas (pointMask pointOf T) label = true := by
  unfold pointMask maskHas
  rw [hall, List.foldl_append, List.foldl_cons]
  rw [p4PointMask_foldl_preserve_bit_of_forall_lt pointOf T suff hsuff]
  have hle := pointMask_foldl_le_add_maskOfLabels pointOf T pref 0
  have hlt :
      pref.foldl
          (fun acc member =>
            if pointOf member ∈ T then member.bit + acc else acc)
          0 <
        2 ^ label.index := by
    have hle' :
        pref.foldl
            (fun acc member =>
              if pointOf member ∈ T then member.bit + acc else acc)
            0 ≤ maskOfLabels pref := by
      simpa using hle
    exact Nat.lt_of_le_of_lt hle' hpref
  have hprefixFalse :
      (pref.foldl
          (fun acc member =>
            if pointOf member ∈ T then member.bit + acc else acc)
          0).testBit label.index = false :=
    Nat.testBit_eq_false_of_lt hlt
  simp only [hmem, if_true, Label.bit]
  rw [Nat.testBit_two_pow_add_eq]
  simpa [Label.bit] using congrArg Bool.not hprefixFalse

private theorem p4PointMask_maskHas_true_of_mem
    {α : Type _} [DecidableEq α]
    {pointOf : Label → α} {T : Finset α} {label : Label}
    (hmem : pointOf label ∈ T) :
    maskHas (pointMask pointOf T) label = true := by
  cases label
  · exact p4PointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [])
      (suff := [.v, .w, .s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hmem
  · exact p4PointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u])
      (suff := [.w, .s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hmem
  · exact p4PointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u, .v])
      (suff := [.s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hmem
  · exact p4PointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u, .v, .w])
      (suff := [.s2, .s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hmem
  · exact p4PointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1])
      (suff := [.s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hmem
  · exact p4PointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2])
      (suff := [.Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hmem
  · exact p4PointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2, .s3])
      (suff := [.Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hmem
  · exact p4PointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2, .s3, .Pw])
      (suff := [.Q1, .Q2])
      rfl (by decide) (by decide) hmem
  · exact p4PointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2, .s3, .Pw, .Pu])
      (suff := [.Q2])
      rfl (by decide) (by decide) hmem
  · exact p4PointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2, .s3, .Pw, .Pu, .Q1])
      (suff := []) rfl (by decide) (by decide) hmem

private theorem p4Foldl_count_true
    {α : Type _} (predicate : α → Bool) (items : List α) (acc : Nat) :
    items.foldl (fun count item => if predicate item then count + 1 else count)
        acc =
      acc + (items.filter predicate).length := by
  induction items generalizing acc with
  | nil => simp
  | cons item rest ih =>
      by_cases hitem : predicate item = true
      · simp [hitem, ih]
        omega
      · have hfalse : predicate item = false := by
          cases h : predicate item <;> simp_all
        simp [hfalse, ih]

private theorem p4MaskCard_pointMask_eq_card_of_subset_range
    {α : Type _} [DecidableEq α]
    {pointOf : Label → α} (hinj : Function.Injective pointOf)
    {T : Finset α}
    (hcover : ∀ x ∈ T, ∃ label : Label, pointOf label = x) :
    maskCard (pointMask pointOf T) = T.card := by
  let labels := allLabels.filter fun label =>
    maskHas (pointMask pointOf T) label
  have hmaskCard : maskCard (pointMask pointOf T) = labels.length := by
    rw [maskCard, p4Foldl_count_true]
    simp [labels]
  have hlabelsNodup : labels.Nodup := by
    exact (by decide : allLabels.Nodup).filter _
  have himage : labels.toFinset.image pointOf = T := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨label, hlabel, rfl⟩
      have hlabelList : label ∈ labels := by simpa using hlabel
      exact pointMask_maskHas_mem (List.mem_filter.mp hlabelList).2
    · intro hx
      rcases hcover x hx with ⟨label, rfl⟩
      apply Finset.mem_image.mpr
      refine ⟨label, ?_, rfl⟩
      simp only [List.mem_toFinset, labels, List.mem_filter]
      exact ⟨by cases label <;> simp [allLabels],
        p4PointMask_maskHas_true_of_mem hx⟩
  calc
    maskCard (pointMask pointOf T) = labels.length := hmaskCard
    _ = labels.toFinset.card :=
      (List.toFinset_card_of_nodup hlabelsNodup).symm
    _ = (labels.toFinset.image pointOf).card :=
      (Finset.card_image_of_injective _ hinj).symm
    _ = T.card := by rw [himage]

private abbrev SameRadiusCrossSeparationProducer
    (pointOf : Label → ℝ²) : Prop :=
  ∀ {centerClass : Label → Finset ℝ²} {c cp : Label},
    c ≠ cp →
      (∀ a b : Label,
        pointOf a ∈ centerClass c →
          pointOf b ∈ centerClass c →
            dist (pointOf c) (pointOf a) =
              dist (pointOf c) (pointOf b)) →
      (∀ a b : Label,
        pointOf a ∈ centerClass cp →
          pointOf b ∈ centerClass cp →
            dist (pointOf cp) (pointOf a) =
              dist (pointOf cp) (pointOf b)) →
      crossSeparationOKForMasks c
          (pointMask pointOf (centerClass c)) cp
          (pointMask pointOf (centerClass cp)) = true

private noncomputable def cardTenCenterClass
    {A : Finset ℝ²} (pointOf : Label → ℝ²) (seed : OneSidedSeed)
    (vRadius wRadius privateRadius : ℝ)
    (supportClass : Label → Finset ℝ²) : Label → Finset ℝ² :=
  fun center =>
    if center = .v then
      SelectedClass A (pointOf .v) vRadius
    else if center = .w then
      SelectedClass A (pointOf .w) wRadius
    else if center = seed.privateCenter then
      SelectedClass A (pointOf seed.privateCenter) privateRadius
    else
      supportClass center

private theorem false_of_erasedPinSeed_of_cardTen_selectedClasses_core
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hcardA : A.card = 10)
    {pointOf : Label → ℝ²} (hinj : Function.Injective pointOf)
    (hpointA : ∀ label : Label, pointOf label ∈ A)
    {seed : OneSidedSeed} (hs : isSurplusStar seed.sstar = true)
    (hprivateV : seed.privateCenter ≠ .v)
    (hprivateW : seed.privateCenter ≠ .w)
    (hprivateCard : maskCard seed.privateMask = 4)
    (hprivateSelf : maskHas seed.privateMask seed.privateCenter = false)
    {vRadius wRadius privateRadius : ℝ}
    (hv : pointMask pointOf (SelectedClass A (pointOf .v) vRadius) =
      firstOppExactCapMask)
    (hw : pointMask pointOf (SelectedClass A (pointOf .w) wRadius) =
      secondOppExactCapMask)
    (hprivate :
      pointMask pointOf
          (SelectedClass A (pointOf seed.privateCenter) privateRadius) =
        seed.privateMask)
    (hcross : SameRadiusCrossSeparationProducer pointOf)
    (hreject : ∀ shadow : Shadow,
      isValidOneSidedSeedRelaxedShapeShadow seed shadow = true → False) :
    False := by
  classical
  have hcover : ∀ x ∈ A, ∃ label : Label, pointOf label = x :=
    EndpointCertificate.cover_of_card_ten hinj hpointA hcardA
  rcases EndpointCertificate.exists_labelCompleteSupportClasses
      hK4 hinj hpointA hcover with
    ⟨supportClass, _radiusOf, _hsub, hsameSupport, hcardSupport,
      hselfSupport⟩
  let centerClass :=
    cardTenCenterClass (A := A) pointOf seed vRadius wRadius privateRadius
      supportClass
  have hcenterV :
      centerClass .v = SelectedClass A (pointOf .v) vRadius := by
    simp [centerClass, cardTenCenterClass]
  have hcenterW :
      centerClass .w = SelectedClass A (pointOf .w) wRadius := by
    simp [centerClass, cardTenCenterClass]
  have hcenterPrivate :
      centerClass seed.privateCenter =
        SelectedClass A (pointOf seed.privateCenter) privateRadius := by
    simp [centerClass, cardTenCenterClass, hprivateV, hprivateW]
  have hcenterSupport (center : Label)
      (hvCenter : center ≠ .v) (hwCenter : center ≠ .w)
      (hprivateCenter : center ≠ seed.privateCenter) :
      centerClass center = supportClass center := by
    simp [centerClass, cardTenCenterClass, hvCenter, hwCenter,
      hprivateCenter]
  have hsame : ∀ center a b : Label,
      pointOf a ∈ centerClass center →
        pointOf b ∈ centerClass center →
          dist (pointOf center) (pointOf a) =
            dist (pointOf center) (pointOf b) := by
    intro center a b ha hb
    by_cases hvCenter : center = .v
    · subst center
      rw [hcenterV] at ha hb
      exact (mem_selectedClass.mp ha).2.trans
        (mem_selectedClass.mp hb).2.symm
    by_cases hwCenter : center = .w
    · subst center
      rw [hcenterW] at ha hb
      exact (mem_selectedClass.mp ha).2.trans
        (mem_selectedClass.mp hb).2.symm
    by_cases hprivateCenter : center = seed.privateCenter
    · subst center
      rw [hcenterPrivate] at ha hb
      exact (mem_selectedClass.mp ha).2.trans
        (mem_selectedClass.mp hb).2.symm
    · rw [hcenterSupport center hvCenter hwCenter hprivateCenter] at ha hb
      exact hsameSupport center a b ha hb
  have hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      maskCard (pointMask pointOf (centerClass center)) = 4 := by
    intro center hvCenter hwCenter
    by_cases hprivateCenter : center = seed.privateCenter
    · subst center
      rw [hcenterPrivate, hprivate]
      exact hprivateCard
    · rw [hcenterSupport center hvCenter hwCenter hprivateCenter]
      exact hcardSupport center
  have hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      maskHas (pointMask pointOf (centerClass center)) center = false := by
    intro center hvCenter hwCenter
    by_cases hprivateCenter : center = seed.privateCenter
    · subst center
      rw [hcenterPrivate, hprivate]
      exact hprivateSelf
    · rw [hcenterSupport center hvCenter hwCenter hprivateCenter]
      exact hselfSupport center
  have hcounts :
      PrefixPairCountsOK (shadowOfPointClasses pointOf centerClass) :=
    prefixPairCountsOK_shadowOfPointClasses_of_sameRadius hconv hinj hpointA
      hsame
  have hno3 : noThreeOK (shadowOfPointClasses pointOf centerClass) = true :=
    noThreeOK_of_PrefixPairCountsOK hcounts
  have hsearchSep : ∀ c cp : Label,
      (c, cp) ∈ orderedLabelPairs →
        crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
          (pointMask pointOf (centerClass cp)) = true := by
    intro c cp hpair
    exact hcross (orderedLabelPairs_ne hpair) (hsame c) (hsame cp)
  have hsep : ∀ c cp a b : Label,
      (c, cp) ∈ labelPairs →
        (a, b) ∈ labelPairs →
          sepOKFor (shadowOfPointClasses pointOf centerClass) c cp a b =
            true := by
    intro c cp a b hcenterPair hab
    exact sepOKFor_of_crossSeparationOKForMasks
      (hsearchSep c cp (labelPairs_mem_orderedLabelPairs hcenterPair)) hab
  apply hreject (shadowOfPointClasses pointOf centerClass)
  exact
    isValidRelaxedShapeShadow_shadowOfPointClasses_of_exact_vw_shapes_labelPairs
      hs (by simpa [hcenterV] using hv)
      (by simpa [hcenterW] using hw)
      (by simpa [hcenterPrivate] using hprivate)
      hcard hself hno3 hcounts hsep hsearchSep

private theorem false_of_erasedPinFixedSeed_of_cardTen_selectedClasses_core
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hcardA : A.card = 10)
    {pointOf : Label → ℝ²} (hinj : Function.Injective pointOf)
    (hpointA : ∀ label : Label, pointOf label ∈ A)
    {seed : OneSidedSeed} (hseed : seed ∈ erasedPinFixedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hprivateV : seed.privateCenter ≠ .v)
    (hprivateW : seed.privateCenter ≠ .w)
    {vRadius wRadius privateRadius : ℝ}
    (hv : pointMask pointOf (SelectedClass A (pointOf .v) vRadius) =
      firstOppExactCapMask)
    (hw : pointMask pointOf (SelectedClass A (pointOf .w) wRadius) =
      secondOppExactCapMask)
    (hprivate :
      pointMask pointOf
          (SelectedClass A (pointOf seed.privateCenter) privateRadius) =
        seed.privateMask)
    (hcross : SameRadiusCrossSeparationProducer pointOf) :
    False := by
  apply false_of_erasedPinSeed_of_cardTen_selectedClasses_core
    hconv hK4 hcardA hinj hpointA hs hprivateV hprivateW
      (erasedPinFixedSeeds_privateMask_card seed hseed)
      (erasedPinFixedSeeds_privateMask_self_false seed hseed)
      hv hw hprivate hcross
  intro shadow hvalid
  exact
    false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_erasedPinFixedSeed
      hseed hvalid

/-- A card-ten label-complete point map in the generated CCW hull order
cannot realize any fixed erased-pin seed once the exact cap and private
selected-class masks are supplied. -/
theorem false_of_erasedPinFixedSeed_of_cardTen_selectedClasses_ccwHull
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hcardA : A.card = 10)
    {pointOf : Label → ℝ²} (hinj : Function.Injective pointOf)
    (hpointA : ∀ label : Label, pointOf label ∈ A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon
      (fun i : Fin 10 => pointOf (labelOfHullFin i)))
    {seed : OneSidedSeed} (hseed : seed ∈ erasedPinFixedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hprivateV : seed.privateCenter ≠ .v)
    (hprivateW : seed.privateCenter ≠ .w)
    {vRadius wRadius privateRadius : ℝ}
    (hv : pointMask pointOf (SelectedClass A (pointOf .v) vRadius) =
      firstOppExactCapMask)
    (hw : pointMask pointOf (SelectedClass A (pointOf .w) wRadius) =
      secondOppExactCapMask)
    (hprivate :
      pointMask pointOf
          (SelectedClass A (pointOf seed.privateCenter) privateRadius) =
        seed.privateMask) :
    False := by
  apply false_of_erasedPinFixedSeed_of_cardTen_selectedClasses_core
    hconv hK4 hcardA hinj hpointA hseed hs hprivateV hprivateW hv hw
      hprivate
  intro centerClass c cp hccp hsameC hsameCP
  exact crossSeparationOKForMasks_of_sameRadius_ccwHull hccw hinj hccp
    hsameC hsameCP

/-- Reflected-hull counterpart of
`false_of_erasedPinFixedSeed_of_cardTen_selectedClasses_ccwHull`. -/
theorem false_of_erasedPinFixedSeed_of_cardTen_selectedClasses_reflectedCcwHull
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hcardA : A.card = 10)
    {pointOf : Label → ℝ²} (hinj : Function.Injective pointOf)
    (hpointA : ∀ label : Label, pointOf label ∈ A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon
      (fun i : Fin 10 =>
        pointOf (reflectedHullLabel (labelOfHullFin i))))
    {seed : OneSidedSeed} (hseed : seed ∈ erasedPinFixedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hprivateV : seed.privateCenter ≠ .v)
    (hprivateW : seed.privateCenter ≠ .w)
    {vRadius wRadius privateRadius : ℝ}
    (hv : pointMask pointOf (SelectedClass A (pointOf .v) vRadius) =
      firstOppExactCapMask)
    (hw : pointMask pointOf (SelectedClass A (pointOf .w) wRadius) =
      secondOppExactCapMask)
    (hprivate :
      pointMask pointOf
          (SelectedClass A (pointOf seed.privateCenter) privateRadius) =
        seed.privateMask) :
    False := by
  apply false_of_erasedPinFixedSeed_of_cardTen_selectedClasses_core
    hconv hK4 hcardA hinj hpointA hseed hs hprivateV hprivateW hv hw
      hprivate
  intro centerClass c cp hccp hsameC hsameCP
  exact crossSeparationOKForMasks_of_sameRadius_reflectedCcwHull hccw hinj
    hccp hsameC hsameCP

private theorem capInteriorByIndex_card_eq_three_of_cap_card_eq_five
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (hcard : (S.capByIndex i).card = 5) :
    (S.capInteriorByIndex i).card = 3 := by
  fin_cases i
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv3 :
        S.triangle.v3 ∈ S.partition.C1.erase S.triangle.v2 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v23_ne.symm, S.partition.v3_mem_C1⟩
    rw [Finset.card_erase_of_mem hv3,
      Finset.card_erase_of_mem S.partition.v2_mem_C1, hcard]
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv1 :
        S.triangle.v1 ∈ S.partition.C2.erase S.triangle.v3 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v13_ne, S.partition.v1_mem_C2⟩
    rw [Finset.card_erase_of_mem hv1,
      Finset.card_erase_of_mem S.partition.v3_mem_C2, hcard]
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv2 :
        S.triangle.v2 ∈ S.partition.C3.erase S.triangle.v1 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v12_ne.symm, S.partition.v2_mem_C3⟩
    rw [Finset.card_erase_of_mem hv2,
      Finset.card_erase_of_mem S.partition.v1_mem_C3, hcard]

private theorem surplusInterior_card_eq_three_of_surplus_card_five
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hcard5 : S.surplusCap.card = 5) :
    (S.capInteriorByIndex S.surplusIdx).card = 3 := by
  have hcapCard : (S.capByIndex S.surplusIdx).card = 5 := by
    rcases hi : S.surplusIdx with ⟨i, hiLt⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.capByIndex, hi] using hcard5
  exact capInteriorByIndex_card_eq_three_of_cap_card_eq_five S
    S.surplusIdx hcapCard

/-- At surplus-cap cardinality five, the right pure surplus-side row would
put a four-point selected class inside a three-point strict cap interior. -/
theorem false_of_rightNonSurplusRow0004_of_cardFive
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1) :
    RightNonSurplusExactCountRowExcluded S x p 0 0 0 4 := by
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  have hselectedCard : (SelectedClass A p (dist p x)).card = 4 := by
    have hsum :=
      S.selectedClass_card_eq_groupSum (x := p) S.oppIndex1 hradiusPos
    simpa [hm, hs, hl, hr] using hsum
  have hsub :=
    rightNonSurplusPureRow_selectedClass_subset_surplusInterior
      hx hp hm hs hl
  have hle := Finset.card_le_card hsub
  have hinteriorCard :=
    surplusInterior_card_eq_three_of_surplus_card_five S hcard5
  omega

/-- At surplus-cap cardinality five, the left pure surplus-side row would
put a four-point selected class inside a three-point strict cap interior. -/
theorem false_of_leftNonSurplusRow0040_of_cardFive
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2) :
    LeftNonSurplusExactCountRowExcluded S x p 0 0 4 0 := by
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  have hselectedCard : (SelectedClass A p (dist p x)).card = 4 := by
    have hsum :=
      S.selectedClass_card_eq_groupSum (x := p) S.oppIndex2 hradiusPos
    simpa [hm, hs, hl, hr] using hsum
  have hsub :=
    leftNonSurplusPureRow_selectedClass_subset_surplusInterior
      hx hp hm hs hr
  have hle := Finset.card_le_card hsub
  have hinteriorCard :=
    surplusInterior_card_eq_three_of_surplus_card_five S hcard5
  omega

private structure RightCardFiveLabels
    {A : Finset ℝ²} (S : SurplusCapPacket A) (T : Finset ℝ²) where
  p₁ : ℝ²
  p₂ : ℝ²
  q₁ : ℝ²
  q₂ : ℝ²
  s1 : ℝ²
  s2 : ℝ²
  s3 : ℝ²
  hp12 : p₁ ≠ p₂
  hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²)
  hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²)
  hs12 : s1 ≠ s2
  hs13 : s1 ≠ s3
  hs23 : s2 ≠ s3
  hT : T = ({s1, s2, s3} : Finset ℝ²)
  hinj : Function.Injective
    (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
  hpointA : ∀ label : Label,
    rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label ∈ A
  hcross : SameRadiusCrossSeparationProducer
    (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)

private theorem exists_rightCardFiveLabels
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x : ℝ²} {T : Finset ℝ²}
    (hxT : x ∈ T) (hTcard : T.card = 3)
    (hTsub : T ⊆ S.capInteriorByIndex S.surplusIdx) :
    Nonempty (RightCardFiveLabels S T) := by
  classical
  rcases S.exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices
      hne hconv hK4 with
    ⟨n, hn, φ, iv, iw, hφinj, hφimage, hccwBoundary, hu, hv, hw,
      hapexOrder⟩
  rcases hapexOrder with hrightOrder | hleftOrder
  · rcases hrightOrder with ⟨h0v, hvw⟩
    rcases exists_rightPinnedHullOrderLabels_of_apex_order
        (A := A) (S := S) (x := x) (T := T)
        (n := n) (φ := φ) (iv := iv) (iw := iw)
        hn hφinj hφimage hccwBoundary hu hv hw h0v hvw hM44 hxT
        hTcard hTsub with
      ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
        hTeq, _hxLabels, hs12, hs13, hs23, _hsSub, hp₁I, hp₂I,
        hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
    have hinj : Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) :=
      rightPinnedLabelPoint_injective_of_mem S
        hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13
          hs23
    have hpointA : ∀ label : Label,
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label ∈ A :=
      rightPinnedLabelPoint_mem_of_mem S
        hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I
    have hccw : EuclideanGeometry.IsCcwConvexPolygon
        (fun i : Fin 10 =>
          rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
            (labelOfHullFin i)) :=
      isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder
    refine ⟨{
      p₁ := p₁, p₂ := p₂, q₁ := q₁, q₂ := q₂,
      s1 := s1, s2 := s2, s3 := s3,
      hp12 := hp12, hpair := hpair, hqpair := hqpair,
      hs12 := hs12, hs13 := hs13, hs23 := hs23,
      hT := hTeq, hinj := hinj, hpointA := hpointA,
      hcross := ?_ }⟩
    intro centerClass c cp hccp hsameC hsameCP
    exact crossSeparationOKForMasks_of_sameRadius_ccwHull hccw hinj hccp
      hsameC hsameCP
  · rcases hleftOrder with ⟨h0w, hwv⟩
    rcases exists_leftPinnedHullOrderLabels_of_apex_order
        (A := A) (S := S) (x := x) (T := T)
        (n := n) (φ := φ) (iv := iv) (iw := iw)
        hn hφinj hφimage hccwBoundary hu hv hw h0w hwv hM44 hxT
        hTcard hTsub with
      ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
        hTeq, _hxLabels, hs12, hs13, hs23, _hsSub, hp₁I, hp₂I,
        hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
    have hpairRev : S.oppInterior1 = ({p₂, p₁} : Finset ℝ²) := by
      rw [hpair]
      ext z
      simp [or_comm]
    have hqpairRev : S.oppInterior2 = ({q₂, q₁} : Finset ℝ²) := by
      rw [hqpair]
      ext z
      simp [or_comm]
    have hTrev : T = ({s3, s2, s1} : Finset ℝ²) := by
      rw [hTeq]
      ext z
      simp [or_comm, or_left_comm]
    have hinj : Function.Injective
        (rightPinnedLabelPoint S p₂ p₁ q₂ q₁ s3 s2 s1) :=
      rightPinnedLabelPoint_injective_of_mem S
        hp₂I hp₁I hq₂I hq₁I hs3I hs2I hs1I hp12.symm hq12.symm
          hs23.symm hs13.symm hs12.symm
    have hpointA : ∀ label : Label,
        rightPinnedLabelPoint S p₂ p₁ q₂ q₁ s3 s2 s1 label ∈ A :=
      rightPinnedLabelPoint_mem_of_mem S
        hp₂I hp₁I hq₂I hq₁I hs3I hs2I hs1I
    have hccwReflected : EuclideanGeometry.IsCcwConvexPolygon
        (fun i : Fin 10 =>
          rightPinnedLabelPoint S p₂ p₁ q₂ q₁ s3 s2 s1
            (reflectedHullLabel (labelOfHullFin i))) := by
      have hccwLeft : EuclideanGeometry.IsCcwConvexPolygon
          (fun i : Fin 10 =>
            leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3
              (labelOfHullFin i)) :=
        isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder
      convert hccwLeft using 2
      rename_i i
      fin_cases i <;> rfl
    refine ⟨{
      p₁ := p₂, p₂ := p₁, q₁ := q₂, q₂ := q₁,
      s1 := s3, s2 := s2, s3 := s1,
      hp12 := hp12.symm, hpair := hpairRev, hqpair := hqpairRev,
      hs12 := hs23.symm, hs13 := hs13.symm, hs23 := hs12.symm,
      hT := hTrev, hinj := hinj, hpointA := hpointA,
      hcross := ?_ }⟩
    intro centerClass c cp hccp hsameC hsameCP
    exact crossSeparationOKForMasks_of_sameRadius_reflectedCcwHull
      hccwReflected hinj hccp hsameC hsameCP

private theorem false_of_erasedPinP4Seed_of_cardTen_selectedClasses_core
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hcardA : A.card = 10)
    {pointOf : Label → ℝ²} (hinj : Function.Injective pointOf)
    (hpointA : ∀ label : Label, pointOf label ∈ A)
    {seed : OneSidedSeed} (hseed : seed ∈ erasedPinCardTenP4Seeds)
    (hs : isSurplusStar seed.sstar = true)
    (hprivateV : seed.privateCenter ≠ .v)
    (hprivateW : seed.privateCenter ≠ .w)
    (hprivateCard : maskCard seed.privateMask = 4)
    (hprivateSelf : maskHas seed.privateMask seed.privateCenter = false)
    {vRadius wRadius privateRadius : ℝ}
    (hv : pointMask pointOf (SelectedClass A (pointOf .v) vRadius) =
      firstOppExactCapMask)
    (hw : pointMask pointOf (SelectedClass A (pointOf .w) wRadius) =
      secondOppExactCapMask)
    (hprivate :
      pointMask pointOf
          (SelectedClass A (pointOf seed.privateCenter) privateRadius) =
        seed.privateMask)
    (hcross : SameRadiusCrossSeparationProducer pointOf) :
    False := by
  have hseedSplit :=
    erasedPinCardTenP4Seeds_mem_grid_or_cross_false hseed
  apply false_of_erasedPinSeed_of_cardTen_selectedClasses_core
    hconv hK4 hcardA hinj hpointA hs hprivateV hprivateW
      hprivateCard hprivateSelf hv hw hprivate hcross
  intro shadow hvalid
  rcases hseedSplit with hgrid | hbadV | hbadW
  · exact
      false_of_isValidOneSidedSeedRelaxedShapeShadow_of_mem_cardTenP4
        hgrid hvalid
  · have hsep := crossSeparationOKForMasks_of_searchSeparationOK
        (center := seed.privateCenter) (other := .v)
        (searchSeparationOK_of_isValidOneSidedSeedRelaxedShapeShadow hvalid)
        hprivateV
    have hprivateEq :=
      privateMask_eq_of_isValidOneSidedSeedRelaxedShapeShadow hvalid
    have hvEq :=
      firstOppExactCapMask_eq_of_isValidOneSidedSeedRelaxedShapeShadow hvalid
    have hsep' :
        crossSeparationOKForMasks seed.privateCenter seed.privateMask .v
            firstOppExactCapMask = true := by
      simpa [hprivateEq, hvEq] using hsep
    exact Bool.noConfusion (hbadV.symm.trans hsep')
  · have hsep := crossSeparationOKForMasks_of_searchSeparationOK
        (center := seed.privateCenter) (other := .w)
        (searchSeparationOK_of_isValidOneSidedSeedRelaxedShapeShadow hvalid)
        hprivateW
    have hprivateEq :=
      privateMask_eq_of_isValidOneSidedSeedRelaxedShapeShadow hvalid
    have hwEq :=
      secondOppExactCapMask_eq_of_isValidOneSidedSeedRelaxedShapeShadow hvalid
    have hsep' :
        crossSeparationOKForMasks seed.privateCenter seed.privateMask .w
            secondOppExactCapMask = true := by
      simpa [hprivateEq, hwEq] using hsep
    exact Bool.noConfusion (hbadW.symm.trans hsep')

private theorem false_of_rightCardFiveLabels_cardTenP4Seed
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcardA : A.card = 10)
    {T : Finset ℝ²} (L : RightCardFiveLabels S T)
    {x p : ℝ²} (hxA : x ∈ A) (htriple : ErasedPinTriple A x p)
    {sstar privateCenter : Label}
    (hs : isSurplusStar sstar = true)
    (hsstarPoint :
      rightPinnedLabelPoint S L.p₁ L.p₂ L.q₁ L.q₂ L.s1 L.s2 L.s3
        sstar = x)
    (hcenter : privateCenter = .u ∨ isSurplusStar privateCenter = true)
    (hprivateCenterPoint :
      rightPinnedLabelPoint S L.p₁ L.p₂ L.q₁ L.q₂ L.s1 L.s2 L.s3
        privateCenter = p) :
    False := by
  let pointOf :=
    rightPinnedLabelPoint S L.p₁ L.p₂ L.q₁ L.q₂ L.s1 L.s2 L.s3
  rcases exact_erased_pin_of_erasedPinTriple hxA htriple with
    ⟨hradiusPos, hprivateClassCard, hxClass⟩
  let privateMask := pointMask pointOf (SelectedClass A p (dist p x))
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := privateCenter, kind := .own,
      privateMask := privateMask }
  have hcoverA :=
    EndpointCertificate.cover_of_card_ten L.hinj L.hpointA hcardA
  have hprivateCard : maskCard privateMask = 4 := by
    calc
      maskCard privateMask =
          (SelectedClass A p (dist p x)).card := by
        apply p4MaskCard_pointMask_eq_card_of_subset_range L.hinj
        intro y hy
        exact hcoverA y (mem_selectedClass.mp hy).1
      _ = 4 := hprivateClassCard
  have hpNotClass : p ∉ SelectedClass A p (dist p x) := by
    intro hpClass
    have hpDist := (mem_selectedClass.mp hpClass).2
    rw [dist_self] at hpDist
    exact hradiusPos.ne' hpDist.symm
  have hprivateSelf : maskHas privateMask privateCenter = false := by
    apply pointMask_maskHas_false_of_not_mem
    simpa [privateMask, pointOf, hprivateCenterPoint] using hpNotClass
  have hprivateStar : maskHas privateMask sstar = true := by
    apply p4PointMask_maskHas_true_of_mem
    simpa [privateMask, pointOf, hsstarPoint] using hxClass
  have hprivateNorm : maskNormalized privateMask = true := by
    exact maskNormalized_pointMask pointOf (SelectedClass A p (dist p x))
  have hseed : seed ∈ erasedPinCardTenP4Seeds := by
    exact mem_erasedPinCardTenP4Seeds_of_privateCenter hs hcenter
      hprivateNorm hprivateCard hprivateSelf hprivateStar
  have hprivateV : privateCenter ≠ .v := by
    rcases hcenter with rfl | hcenter
    · decide
    · cases privateCenter <;> simp [isSurplusStar] at hcenter ⊢
  have hprivateW : privateCenter ≠ .w := by
    rcases hcenter with rfl | hcenter
    · decide
    · cases privateCenter <;> simp [isSurplusStar] at hcenter ⊢
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex1 hK4
      hcontain.1 hM44.oppIndex1_cap_card_eq_four with
    ⟨vRadius, _hvRadius, hvClass⟩
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex2 hK4
      hcontain.2 hM44.oppIndex2_cap_card_eq_four with
    ⟨wRadius, _hwRadius, hwClass⟩
  have hvMask :
      pointMask pointOf (SelectedClass A (pointOf .v) vRadius) =
        firstOppExactCapMask := by
    rw [show SelectedClass A (pointOf .v) vRadius =
        S.capByIndex S.oppIndex1 by
      simpa [pointOf, rightPinnedLabelPoint] using hvClass]
    exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
      S L.hinj L.hpair
  have hwMask :
      pointMask pointOf (SelectedClass A (pointOf .w) wRadius) =
        secondOppExactCapMask := by
    rw [show SelectedClass A (pointOf .w) wRadius =
        S.capByIndex S.oppIndex2 by
      simpa [pointOf, rightPinnedLabelPoint] using hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S L.hinj L.hqpair
  have hprivateCenterPoint' : pointOf privateCenter = p :=
    hprivateCenterPoint
  have hprivateMask :
      pointMask pointOf
          (SelectedClass A (pointOf privateCenter) (dist p x)) =
        privateMask := by
    rw [hprivateCenterPoint']
  apply false_of_erasedPinP4Seed_of_cardTen_selectedClasses_core
    hconv hK4 hcardA L.hinj L.hpointA hseed hs hprivateV hprivateW
      hprivateCard hprivateSelf hvMask hwMask
  · simpa only [seed] using hprivateMask
  · exact L.hcross

/-- The card-ten surplus-opposite P4 arm is excluded by the complete `.u`
private-center seed bank. -/
theorem false_of_surplusOppositeErasedPinTriple_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x : ℝ²} (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (htriple : ErasedPinTriple A x
      (S.oppositeVertexByIndex S.surplusIdx)) :
    False := by
  have hcardA : A.card = 10 := by
    have hcard := hM44.surplus_card_eq
    omega
  have hinteriorCard :=
    surplusInterior_card_eq_three_of_surplus_card_five S hcard5
  rcases exists_rightCardFiveLabels (S := S)
      (T := S.capInteriorByIndex S.surplusIdx)
      hne hconv hK4 hM44 hx hinteriorCard (by intro y hy; exact hy) with
    ⟨L⟩
  have hxLabels : x ∈ ({L.s1, L.s2, L.s3} : Finset ℝ²) := by
    rw [← L.hT]
    exact hx
  rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
      S L.p₁ L.p₂ L.q₁ L.q₂ L.s1 L.s2 L.s3 hxLabels with
    ⟨sstar, hs, hsstarPoint⟩
  have hxA : x ∈ A := by
    simpa [hsstarPoint] using L.hpointA sstar
  exact false_of_rightCardFiveLabels_cardTenP4Seed
    hconv hK4 hM44 hcontain hcardA L hxA htriple hs hsstarPoint
      (Or.inl rfl) rfl

/-- The card-ten surplus-interior P4 arm is excluded by the complete
surplus-center seed bank. -/
theorem false_of_surplusInteriorErasedPinTriple_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.surplusIdx)
    (htriple : ErasedPinTriple A x p) :
    False := by
  have hcardA : A.card = 10 := by
    have hcard := hM44.surplus_card_eq
    omega
  have hinteriorCard :=
    surplusInterior_card_eq_three_of_surplus_card_five S hcard5
  rcases exists_rightCardFiveLabels (S := S)
      (T := S.capInteriorByIndex S.surplusIdx)
      hne hconv hK4 hM44 hx hinteriorCard (by intro y hy; exact hy) with
    ⟨L⟩
  have hxLabels : x ∈ ({L.s1, L.s2, L.s3} : Finset ℝ²) := by
    rw [← L.hT]
    exact hx
  have hpLabels : p ∈ ({L.s1, L.s2, L.s3} : Finset ℝ²) := by
    rw [← L.hT]
    exact hp
  rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
      S L.p₁ L.p₂ L.q₁ L.q₂ L.s1 L.s2 L.s3 hxLabels with
    ⟨sstar, hs, hsstarPoint⟩
  rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
      S L.p₁ L.p₂ L.q₁ L.q₂ L.s1 L.s2 L.s3 hpLabels with
    ⟨privateCenter, hprivateCenter, hprivateCenterPoint⟩
  have hxA : x ∈ A := by
    simpa [hsstarPoint] using L.hpointA sstar
  exact false_of_rightCardFiveLabels_cardTenP4Seed
    hconv hK4 hM44 hcontain hcardA L hxA htriple hs hsstarPoint
      (Or.inr hprivateCenter) hprivateCenterPoint

private theorem false_of_rightCardFiveLabels_fixedSeed
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcardA : A.card = 10)
    {T : Finset ℝ²} (L : RightCardFiveLabels S T)
    {seed : OneSidedSeed} (hseed : seed ∈ erasedPinFixedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hprivateCenter : seed.privateCenter = .Pw ∨
      seed.privateCenter = .Pu)
    {privateCenterPoint : ℝ²} {privateRadius : ℝ}
    (hprivateCenterPoint :
      rightPinnedLabelPoint S L.p₁ L.p₂ L.q₁ L.q₂ L.s1 L.s2 L.s3
        seed.privateCenter = privateCenterPoint)
    (hprivate :
      pointMask
          (rightPinnedLabelPoint S L.p₁ L.p₂ L.q₁ L.q₂ L.s1 L.s2 L.s3)
          (SelectedClass A privateCenterPoint privateRadius) =
        seed.privateMask) :
    False := by
  let pointOf :=
    rightPinnedLabelPoint S L.p₁ L.p₂ L.q₁ L.q₂ L.s1 L.s2 L.s3
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex1 hK4
      hcontain.1 hM44.oppIndex1_cap_card_eq_four with
    ⟨vRadius, _hvRadius, hvClass⟩
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex2 hK4
      hcontain.2 hM44.oppIndex2_cap_card_eq_four with
    ⟨wRadius, _hwRadius, hwClass⟩
  have hvMask :
      pointMask pointOf (SelectedClass A (pointOf .v) vRadius) =
        firstOppExactCapMask := by
    rw [show SelectedClass A (pointOf .v) vRadius =
        S.capByIndex S.oppIndex1 by
      simpa [pointOf, rightPinnedLabelPoint] using hvClass]
    exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
      S L.hinj L.hpair
  have hwMask :
      pointMask pointOf (SelectedClass A (pointOf .w) wRadius) =
        secondOppExactCapMask := by
    rw [show SelectedClass A (pointOf .w) wRadius =
        S.capByIndex S.oppIndex2 by
      simpa [pointOf, rightPinnedLabelPoint] using hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S L.hinj L.hqpair
  exact false_of_erasedPinFixedSeed_of_cardTen_selectedClasses_core
    hconv hK4 hcardA L.hinj L.hpointA hseed hs
    (by rcases hprivateCenter with h | h <;> simp [h])
    (by rcases hprivateCenter with h | h <;> simp [h])
    hvMask hwMask (by simpa [hprivateCenterPoint] using hprivate) L.hcross

private theorem false_of_rightCardFiveRow_of_seedProducer
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hproducer : ∀ L : RightCardFiveLabels S
        (S.capInteriorByIndex S.surplusIdx),
      ∃ seed : OneSidedSeed,
        seed ∈ erasedPinFixedSeeds ∧
        isSurplusStar seed.sstar = true ∧
        (seed.privateCenter = .Pw ∨ seed.privateCenter = .Pu) ∧
        rightPinnedLabelPoint S L.p₁ L.p₂ L.q₁ L.q₂ L.s1 L.s2 L.s3
          seed.privateCenter = p ∧
        pointMask
            (rightPinnedLabelPoint S L.p₁ L.p₂ L.q₁ L.q₂ L.s1 L.s2
              L.s3)
            (SelectedClass A p (dist p x)) = seed.privateMask) :
    False := by
  have hcardA : A.card = 10 := by
    have hcard := hM44.surplus_card_eq
    omega
  have hinteriorCard :=
    surplusInterior_card_eq_three_of_surplus_card_five S hcard5
  rcases exists_rightCardFiveLabels hne hconv hK4 hM44 hx
      hinteriorCard (fun _ h => h) with
    ⟨L⟩
  rcases hproducer L with
    ⟨seed, hseed, hs, hprivateCenter, hprivateCenterPoint, hprivate⟩
  exact false_of_rightCardFiveLabels_fixedSeed hconv hK4 hM44 hcontain
    hcardA L hseed hs hprivateCenter hprivateCenterPoint hprivate

private theorem rightCardFiveLabels_rowFacts
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : RightCardFiveLabels S
      (S.capInteriorByIndex S.surplusIdx))
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1) :
    SelectedClass A p (dist p x) ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
        ({L.s1, L.s2, L.s3} : Finset ℝ²) ∧
      x ∈ SelectedClass A p (dist p x) ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ∧
      (p = L.p₁ ∨ p = L.p₂) := by
  have hRtriple : SelectedClass A p (dist p x) ∩
      S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
      ({L.s1, L.s2, L.s3} : Finset ℝ²) := by
    intro y hy
    rw [← L.hT]
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using (Finset.mem_inter.mp hy).2
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxRight : x ∈
      S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hx
  have hxR : x ∈ SelectedClass A p (dist p x) ∩
      S.rightAdjacentInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩
  have hpPair : p ∈ ({L.p₁, L.p₂} : Finset ℝ²) := by
    rw [← L.hpair]
    simpa [SurplusCapPacket.oppInterior1] using hp
  simpa only [Finset.mem_insert, Finset.mem_singleton] using
    And.intro hRtriple (And.intro hxR hpPair)

/-- The right count row `(0,0,1,3)` is impossible in the label-complete
`S.surplusCap.card = 5` branch. -/
theorem false_of_rightNonSurplusRow0013_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1) :
    RightNonSurplusExactCountRowExcluded S x p 0 0 1 3 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  apply false_of_rightCardFiveRow_of_seedProducer (x := x) (p := p)
    hne hconv hK4 hM44 hcontain hcard5 hx
  intro L
  have hRtriple : SelectedClass A p (dist p x) ∩
      S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
      ({L.s1, L.s2, L.s3} : Finset ℝ²) := by
    intro y hy
    rw [← L.hT]
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using (Finset.mem_inter.mp hy).2
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxRight : x ∈
      S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hx
  have hxR : x ∈ SelectedClass A p (dist p x) ∩
      S.rightAdjacentInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩
  have hpPair : p ∈ ({L.p₁, L.p₂} : Finset ℝ²) := by
    rw [← L.hpair]
    simpa [SurplusCapPacket.oppInterior1] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hpEq | hpEq
  · subst p
    rcases right_row0013_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hqpair hRtriple L.hs12 L.hs13
        L.hs23 hxR (privateCenter := .Pw) (Or.inl rfl)
        (centerClass := fun _ => SelectedClass A L.p₁ (dist L.p₁ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m0_s0_l1_r3_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inl hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, rightPinnedLabelPoint]
    · simpa only using hprivate
  · subst p
    rcases right_row0013_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hqpair hRtriple L.hs12 L.hs13
        L.hs23 hxR (privateCenter := .Pu) (Or.inr rfl)
        (centerClass := fun _ => SelectedClass A L.p₂ (dist L.p₂ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m0_s0_l1_r3_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inr hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, rightPinnedLabelPoint]
    · simpa only using hprivate

/-- The right count row `(0,1,0,3)` is impossible in the label-complete
`S.surplusCap.card = 5` branch. -/
theorem false_of_rightNonSurplusRow0103_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1) :
    RightNonSurplusExactCountRowExcluded S x p 0 1 0 3 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  apply false_of_rightCardFiveRow_of_seedProducer (x := x) (p := p)
    hne hconv hK4 hM44 hcontain hcard5 hx
  intro L
  rcases rightCardFiveLabels_rowFacts L hx hp with
    ⟨hRtriple, hxR, hpEq | hpEq⟩
  · subst p
    rcases right_row0103_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hp12 L.hpair hRtriple L.hs12
        L.hs13 L.hs23 hxR (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₁ (dist L.p₁ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m0_s1_l0_r3_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inl hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, rightPinnedLabelPoint]
    · simpa only using hprivate
  · subst p
    rcases right_row0103_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hp12 L.hpair hRtriple L.hs12
        L.hs13 L.hs23 hxR (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₂ (dist L.p₂ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m0_s1_l0_r3_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inr hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, rightPinnedLabelPoint]
    · simpa only using hprivate

/-- The right count row `(1,0,0,3)` is impossible in the label-complete
`S.surplusCap.card = 5` branch. -/
theorem false_of_rightNonSurplusRow1003_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1) :
    RightNonSurplusExactCountRowExcluded S x p 1 0 0 3 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  apply false_of_rightCardFiveRow_of_seedProducer (x := x) (p := p)
    hne hconv hK4 hM44 hcontain hcard5 hx
  intro L
  rcases rightCardFiveLabels_rowFacts L hx hp with
    ⟨hRtriple, hxR, hpEq | hpEq⟩
  · subst p
    rcases right_row1003_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj hRtriple L.hs12 L.hs13 L.hs23
        hxR (privateCenter := .Pw) (Or.inl rfl)
        (centerClass := fun _ => SelectedClass A L.p₁ (dist L.p₁ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m1_s0_l0_r3_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inl hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, rightPinnedLabelPoint]
    · simpa only using hprivate
  · subst p
    rcases right_row1003_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj hRtriple L.hs12 L.hs13 L.hs23
        hxR (privateCenter := .Pu) (Or.inr rfl)
        (centerClass := fun _ => SelectedClass A L.p₂ (dist L.p₂ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m1_s0_l0_r3_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inr hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, rightPinnedLabelPoint]
    · simpa only using hprivate

/-- The right count row `(0,1,1,2)` is impossible in the label-complete
`S.surplusCap.card = 5` branch. -/
theorem false_of_rightNonSurplusRow0112_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1) :
    RightNonSurplusExactCountRowExcluded S x p 0 1 1 2 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  apply false_of_rightCardFiveRow_of_seedProducer (x := x) (p := p)
    hne hconv hK4 hM44 hcontain hcard5 hx
  intro L
  rcases rightCardFiveLabels_rowFacts L hx hp with
    ⟨hRtriple, hxR, hpEq | hpEq⟩
  · subst p
    rcases right_row0112_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hp12 L.hpair L.hqpair hRtriple
        hxR (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₁ (dist L.p₁ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m0_s1_l1_r2_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inl hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, rightPinnedLabelPoint]
    · simpa only using hprivate
  · subst p
    rcases right_row0112_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hp12 L.hpair L.hqpair hRtriple
        hxR (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₂ (dist L.p₂ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m0_s1_l1_r2_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inr hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, rightPinnedLabelPoint]
    · simpa only using hprivate

/-- The right count row `(1,0,1,2)` is impossible in the label-complete
`S.surplusCap.card = 5` branch. -/
theorem false_of_rightNonSurplusRow1012_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1) :
    RightNonSurplusExactCountRowExcluded S x p 1 0 1 2 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  apply false_of_rightCardFiveRow_of_seedProducer (x := x) (p := p)
    hne hconv hK4 hM44 hcontain hcard5 hx
  intro L
  rcases rightCardFiveLabels_rowFacts L hx hp with
    ⟨hRtriple, hxR, hpEq | hpEq⟩
  · subst p
    rcases right_row1012_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hqpair hRtriple hxR
        (privateCenter := .Pw) (Or.inl rfl)
        (centerClass := fun _ => SelectedClass A L.p₁ (dist L.p₁ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m1_s0_l1_r2_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inl hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, rightPinnedLabelPoint]
    · simpa only using hprivate
  · subst p
    rcases right_row1012_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hqpair hRtriple hxR
        (privateCenter := .Pu) (Or.inr rfl)
        (centerClass := fun _ => SelectedClass A L.p₂ (dist L.p₂ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m1_s0_l1_r2_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inr hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, rightPinnedLabelPoint]
    · simpa only using hprivate

/-- The right count row `(1,1,1,1)` is impossible in the label-complete
`S.surplusCap.card = 5` branch. -/
theorem false_of_rightNonSurplusRow1111_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1) :
    RightNonSurplusExactCountRowExcluded S x p 1 1 1 1 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  apply false_of_rightCardFiveRow_of_seedProducer (x := x) (p := p)
    hne hconv hK4 hM44 hcontain hcard5 hx
  intro L
  have hxTriple : x ∈ ({L.s1, L.s2, L.s3} : Finset ℝ²) := by
    rw [← L.hT]
    exact hx
  rcases rightCardFiveLabels_rowFacts L hx hp with
    ⟨hRtriple, hxR, hpEq | hpEq⟩
  · subst p
    rcases right_row1111_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hp12 L.hpair L.hqpair hxTriple
        hxR (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₁ (dist L.p₁ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m1_s1_l1_r1_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inl hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, rightPinnedLabelPoint]
    · simpa only using hprivate
  · subst p
    rcases right_row1111_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hp12 L.hpair L.hqpair hxTriple
        hxR (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₂ (dist L.p₂ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m1_s1_l1_r1_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inr hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, rightPinnedLabelPoint]
    · simpa only using hprivate

/-- The right count row `(1,1,0,2)` is impossible in the label-complete
`S.surplusCap.card = 5` branch. -/
theorem false_of_rightNonSurplusRow1102_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1) :
    RightNonSurplusExactCountRowExcluded S x p 1 1 0 2 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  apply false_of_rightCardFiveRow_of_seedProducer (x := x) (p := p)
    hne hconv hK4 hM44 hcontain hcard5 hx
  intro L
  rcases rightCardFiveLabels_rowFacts L hx hp with
    ⟨hRtriple, hxR, hpEq | hpEq⟩
  · subst p
    rcases right_row1102_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hp12 L.hpair hRtriple hxR
        (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₁ (dist L.p₁ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m1_s1_l0_r2_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inl hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, rightPinnedLabelPoint]
    · simpa only using hprivate
  · subst p
    rcases right_row1102_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hp12 L.hpair hRtriple hxR
        (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₂ (dist L.p₂ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m1_s1_l0_r2_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inr hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, rightPinnedLabelPoint]
    · simpa only using hprivate

/-- The right count row `(2,0,0,2)` is impossible in the label-complete
`S.surplusCap.card = 5` branch. -/
theorem false_of_rightNonSurplusRow2002_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1) :
    RightNonSurplusExactCountRowExcluded S x p 2 0 0 2 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  apply false_of_rightCardFiveRow_of_seedProducer (x := x) (p := p)
    hne hconv hK4 hM44 hcontain hcard5 hx
  intro L
  rcases rightCardFiveLabels_rowFacts L hx hp with
    ⟨hRtriple, hxR, hpEq | hpEq⟩
  · subst p
    rcases right_row2002_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj hRtriple hxR
        (privateCenter := .Pw) (Or.inl ⟨rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₁ (dist L.p₁ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m2_s0_l0_r2_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inl hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, rightPinnedLabelPoint]
    · simpa only using hprivate
  · subst p
    rcases right_row2002_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj hRtriple hxR
        (privateCenter := .Pu) (Or.inr ⟨rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₂ (dist L.p₂ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m2_s0_l0_r2_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inr hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, rightPinnedLabelPoint]
    · simpa only using hprivate

private structure LeftCardFiveLabels
    {A : Finset ℝ²} (S : SurplusCapPacket A) (T : Finset ℝ²) where
  p₁ : ℝ²
  p₂ : ℝ²
  q₁ : ℝ²
  q₂ : ℝ²
  s1 : ℝ²
  s2 : ℝ²
  s3 : ℝ²
  hp12 : p₁ ≠ p₂
  hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²)
  hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²)
  hs12 : s1 ≠ s2
  hs13 : s1 ≠ s3
  hs23 : s2 ≠ s3
  hT : T = ({s1, s2, s3} : Finset ℝ²)
  hinj : Function.Injective
    (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
  hpointA : ∀ label : Label,
    leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label ∈ A
  hcross : SameRadiusCrossSeparationProducer
    (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)

private theorem exists_leftCardFiveLabels
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x : ℝ²} {T : Finset ℝ²}
    (hxT : x ∈ T) (hTcard : T.card = 3)
    (hTsub : T ⊆ S.capInteriorByIndex S.surplusIdx) :
    Nonempty (LeftCardFiveLabels S T) := by
  classical
  rcases S.exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices
      hne hconv hK4 with
    ⟨n, hn, φ, iv, iw, hφinj, hφimage, hccwBoundary, hu, hv, hw,
      hapexOrder⟩
  rcases hapexOrder with hrightOrder | hleftOrder
  · rcases hrightOrder with ⟨h0v, hvw⟩
    rcases exists_rightPinnedHullOrderLabels_of_apex_order
        (A := A) (S := S) (x := x) (T := T)
        (n := n) (φ := φ) (iv := iv) (iw := iw)
        hn hφinj hφimage hccwBoundary hu hv hw h0v hvw hM44 hxT
        hTcard hTsub with
      ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
        hTeq, _hxLabels, hs12, hs13, hs23, _hsSub, hp₁I, hp₂I,
        hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
    have hpairRev : S.oppInterior2 = ({q₂, q₁} : Finset ℝ²) := by
      rw [hqpair]
      ext z
      simp [or_comm]
    have hqpairRev : S.oppInterior1 = ({p₂, p₁} : Finset ℝ²) := by
      rw [hpair]
      ext z
      simp [or_comm]
    have hTrev : T = ({s3, s2, s1} : Finset ℝ²) := by
      rw [hTeq]
      ext z
      simp [or_comm, or_left_comm]
    have hinj : Function.Injective
        (leftPinnedLabelPoint S q₂ q₁ p₂ p₁ s3 s2 s1) :=
      leftPinnedLabelPoint_injective_of_mem S
        hq₂I hq₁I hp₂I hp₁I hs3I hs2I hs1I hq12.symm hp12.symm
          hs23.symm hs13.symm hs12.symm
    have hpointA : ∀ label : Label,
        leftPinnedLabelPoint S q₂ q₁ p₂ p₁ s3 s2 s1 label ∈ A :=
      leftPinnedLabelPoint_mem_of_mem S
        hq₂I hq₁I hp₂I hp₁I hs3I hs2I hs1I
    have hccwReflected : EuclideanGeometry.IsCcwConvexPolygon
        (fun i : Fin 10 =>
          leftPinnedLabelPoint S q₂ q₁ p₂ p₁ s3 s2 s1
            (reflectedHullLabel (labelOfHullFin i))) := by
      have hccwRight : EuclideanGeometry.IsCcwConvexPolygon
          (fun i : Fin 10 =>
            rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
              (labelOfHullFin i)) :=
        isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder
      convert hccwRight using 2
      rename_i i
      fin_cases i <;> rfl
    refine ⟨{
      p₁ := q₂, p₂ := q₁, q₁ := p₂, q₂ := p₁,
      s1 := s3, s2 := s2, s3 := s1,
      hp12 := hq12.symm, hpair := hpairRev, hqpair := hqpairRev,
      hs12 := hs23.symm, hs13 := hs13.symm, hs23 := hs12.symm,
      hT := hTrev, hinj := hinj, hpointA := hpointA,
      hcross := ?_ }⟩
    intro centerClass c cp hccp hsameC hsameCP
    exact crossSeparationOKForMasks_of_sameRadius_reflectedCcwHull
      hccwReflected hinj hccp hsameC hsameCP
  · rcases hleftOrder with ⟨h0w, hwv⟩
    rcases exists_leftPinnedHullOrderLabels_of_apex_order
        (A := A) (S := S) (x := x) (T := T)
        (n := n) (φ := φ) (iv := iv) (iw := iw)
        hn hφinj hφimage hccwBoundary hu hv hw h0w hwv hM44 hxT
        hTcard hTsub with
      ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
        hTeq, _hxLabels, hs12, hs13, hs23, _hsSub, hp₁I, hp₂I,
        hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
    have hinj : Function.Injective
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3) :=
      leftPinnedLabelPoint_injective_of_mem S
        hq₁I hq₂I hp₁I hp₂I hs1I hs2I hs3I hq12 hp12 hs12 hs13
          hs23
    have hpointA : ∀ label : Label,
        leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3 label ∈ A :=
      leftPinnedLabelPoint_mem_of_mem S
        hq₁I hq₂I hp₁I hp₂I hs1I hs2I hs3I
    have hccw : EuclideanGeometry.IsCcwConvexPolygon
        (fun i : Fin 10 =>
          leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3
            (labelOfHullFin i)) :=
      isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder
    refine ⟨{
      p₁ := q₁, p₂ := q₂, q₁ := p₁, q₂ := p₂,
      s1 := s1, s2 := s2, s3 := s3,
      hp12 := hq12, hpair := hqpair, hqpair := hpair,
      hs12 := hs12, hs13 := hs13, hs23 := hs23,
      hT := hTeq, hinj := hinj, hpointA := hpointA,
      hcross := ?_ }⟩
    intro centerClass c cp hccp hsameC hsameCP
    exact crossSeparationOKForMasks_of_sameRadius_ccwHull hccw hinj hccp
      hsameC hsameCP

private theorem false_of_leftCardFiveLabels_fixedSeed
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcardA : A.card = 10)
    {T : Finset ℝ²} (L : LeftCardFiveLabels S T)
    {seed : OneSidedSeed} (hseed : seed ∈ erasedPinFixedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hprivateCenter : seed.privateCenter = .Pw ∨
      seed.privateCenter = .Pu)
    {privateCenterPoint : ℝ²} {privateRadius : ℝ}
    (hprivateCenterPoint :
      leftPinnedLabelPoint S L.p₁ L.p₂ L.q₁ L.q₂ L.s1 L.s2 L.s3
        seed.privateCenter = privateCenterPoint)
    (hprivate :
      pointMask
          (leftPinnedLabelPoint S L.p₁ L.p₂ L.q₁ L.q₂ L.s1 L.s2 L.s3)
          (SelectedClass A privateCenterPoint privateRadius) =
        seed.privateMask) :
    False := by
  let pointOf :=
    leftPinnedLabelPoint S L.p₁ L.p₂ L.q₁ L.q₂ L.s1 L.s2 L.s3
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex2 hK4
      hcontain.2 hM44.oppIndex2_cap_card_eq_four with
    ⟨vRadius, _hvRadius, hvClass⟩
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex1 hK4
      hcontain.1 hM44.oppIndex1_cap_card_eq_four with
    ⟨wRadius, _hwRadius, hwClass⟩
  have hvMask :
      pointMask pointOf (SelectedClass A (pointOf .v) vRadius) =
        firstOppExactCapMask := by
    rw [show SelectedClass A (pointOf .v) vRadius =
        S.capByIndex S.oppIndex2 by
      simpa [pointOf, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint] using hvClass]
    exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
      S L.hinj L.hpair
  have hwMask :
      pointMask pointOf (SelectedClass A (pointOf .w) wRadius) =
        secondOppExactCapMask := by
    rw [show SelectedClass A (pointOf .w) wRadius =
        S.capByIndex S.oppIndex1 by
      simpa [pointOf, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint] using hwClass]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S L.hinj L.hqpair
  exact false_of_erasedPinFixedSeed_of_cardTen_selectedClasses_core
    hconv hK4 hcardA L.hinj L.hpointA hseed hs
    (by rcases hprivateCenter with h | h <;> simp [h])
    (by rcases hprivateCenter with h | h <;> simp [h])
    hvMask hwMask (by simpa [hprivateCenterPoint] using hprivate) L.hcross

private theorem false_of_leftCardFiveRow_of_seedProducer
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hproducer : ∀ L : LeftCardFiveLabels S
        (S.capInteriorByIndex S.surplusIdx),
      ∃ seed : OneSidedSeed,
        seed ∈ erasedPinFixedSeeds ∧
        isSurplusStar seed.sstar = true ∧
        (seed.privateCenter = .Pw ∨ seed.privateCenter = .Pu) ∧
        leftPinnedLabelPoint S L.p₁ L.p₂ L.q₁ L.q₂ L.s1 L.s2 L.s3
          seed.privateCenter = p ∧
        pointMask
            (leftPinnedLabelPoint S L.p₁ L.p₂ L.q₁ L.q₂ L.s1 L.s2
              L.s3)
            (SelectedClass A p (dist p x)) = seed.privateMask) :
    False := by
  have hcardA : A.card = 10 := by
    have hcard := hM44.surplus_card_eq
    omega
  have hinteriorCard :=
    surplusInterior_card_eq_three_of_surplus_card_five S hcard5
  rcases exists_leftCardFiveLabels hne hconv hK4 hM44 hx
      hinteriorCard (fun _ h => h) with
    ⟨L⟩
  rcases hproducer L with
    ⟨seed, hseed, hs, hprivateCenter, hprivateCenterPoint, hprivate⟩
  exact false_of_leftCardFiveLabels_fixedSeed hconv hK4 hM44 hcontain
    hcardA L hseed hs hprivateCenter hprivateCenterPoint hprivate

private theorem leftCardFiveLabels_rowFacts
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : LeftCardFiveLabels S
      (S.capInteriorByIndex S.surplusIdx))
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2) :
    SelectedClass A p (dist p x) ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
        ({L.s1, L.s2, L.s3} : Finset ℝ²) ∧
      x ∈ SelectedClass A p (dist p x) ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2 ∧
      (p = L.p₁ ∨ p = L.p₂) := by
  have hLtriple : SelectedClass A p (dist p x) ∩
      S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
      ({L.s1, L.s2, L.s3} : Finset ℝ²) := by
    intro y hy
    rw [← L.hT]
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using (Finset.mem_inter.mp hy).2
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxLeft : x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hx
  have hxL : x ∈ SelectedClass A p (dist p x) ∩
      S.leftAdjacentInteriorByIndex S.oppIndex2 :=
    Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩
  have hpPair : p ∈ ({L.p₁, L.p₂} : Finset ℝ²) := by
    rw [← L.hpair]
    simpa [SurplusCapPacket.oppInterior2] using hp
  simpa only [Finset.mem_insert, Finset.mem_singleton] using
    And.intro hLtriple (And.intro hxL hpPair)

/-- The left count row `(0,0,3,1)` is impossible in the label-complete
`S.surplusCap.card = 5` branch. -/
theorem false_of_leftNonSurplusRow0031_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2) :
    LeftNonSurplusExactCountRowExcluded S x p 0 0 3 1 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  apply false_of_leftCardFiveRow_of_seedProducer (x := x) (p := p)
    hne hconv hK4 hM44 hcontain hcard5 hx
  intro L
  have hLtriple : SelectedClass A p (dist p x) ∩
      S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
      ({L.s1, L.s2, L.s3} : Finset ℝ²) := by
    intro y hy
    rw [← L.hT]
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using (Finset.mem_inter.mp hy).2
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxLeft : x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hx
  have hxL : x ∈ SelectedClass A p (dist p x) ∩
      S.leftAdjacentInteriorByIndex S.oppIndex2 :=
    Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩
  have hpPair : p ∈ ({L.p₁, L.p₂} : Finset ℝ²) := by
    rw [← L.hpair]
    simpa [SurplusCapPacket.oppInterior2] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hpEq | hpEq
  · subst p
    rcases left_row0031_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hqpair hLtriple L.hs12 L.hs13
        L.hs23 hxL (privateCenter := .Pw) (Or.inl rfl)
        (centerClass := fun _ => SelectedClass A L.p₁ (dist L.p₁ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m0_s0_l3_r1_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inl hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint]
    · simpa only using hprivate
  · subst p
    rcases left_row0031_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hqpair hLtriple L.hs12 L.hs13
        L.hs23 hxL (privateCenter := .Pu) (Or.inr rfl)
        (centerClass := fun _ => SelectedClass A L.p₂ (dist L.p₂ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m0_s0_l3_r1_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inr hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint]
    · simpa only using hprivate

/-- The left count row `(0,1,3,0)` is impossible in the label-complete
`S.surplusCap.card = 5` branch. -/
theorem false_of_leftNonSurplusRow0130_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2) :
    LeftNonSurplusExactCountRowExcluded S x p 0 1 3 0 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  apply false_of_leftCardFiveRow_of_seedProducer (x := x) (p := p)
    hne hconv hK4 hM44 hcontain hcard5 hx
  intro L
  rcases leftCardFiveLabels_rowFacts L hx hp with
    ⟨hLtriple, hxL, hpEq | hpEq⟩
  · subst p
    rcases left_row0130_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hp12 L.hpair hLtriple L.hs12
        L.hs13 L.hs23 hxL (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₁ (dist L.p₁ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m0_s1_l3_r0_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inl hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint]
    · simpa only using hprivate
  · subst p
    rcases left_row0130_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hp12 L.hpair hLtriple L.hs12
        L.hs13 L.hs23 hxL (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₂ (dist L.p₂ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m0_s1_l3_r0_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inr hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint]
    · simpa only using hprivate

/-- The left count row `(1,0,3,0)` is impossible in the label-complete
`S.surplusCap.card = 5` branch. -/
theorem false_of_leftNonSurplusRow1030_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2) :
    LeftNonSurplusExactCountRowExcluded S x p 1 0 3 0 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  apply false_of_leftCardFiveRow_of_seedProducer (x := x) (p := p)
    hne hconv hK4 hM44 hcontain hcard5 hx
  intro L
  rcases leftCardFiveLabels_rowFacts L hx hp with
    ⟨hLtriple, hxL, hpEq | hpEq⟩
  · subst p
    rcases left_row1030_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj hLtriple L.hs12 L.hs13 L.hs23
        hxL (privateCenter := .Pw) (Or.inl rfl)
        (centerClass := fun _ => SelectedClass A L.p₁ (dist L.p₁ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m1_s0_l3_r0_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inl hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint]
    · simpa only using hprivate
  · subst p
    rcases left_row1030_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj hLtriple L.hs12 L.hs13 L.hs23
        hxL (privateCenter := .Pu) (Or.inr rfl)
        (centerClass := fun _ => SelectedClass A L.p₂ (dist L.p₂ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m1_s0_l3_r0_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inr hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint]
    · simpa only using hprivate

/-- The left count row `(0,1,2,1)` is impossible in the label-complete
`S.surplusCap.card = 5` branch. -/
theorem false_of_leftNonSurplusRow0121_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2) :
    LeftNonSurplusExactCountRowExcluded S x p 0 1 2 1 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  apply false_of_leftCardFiveRow_of_seedProducer (x := x) (p := p)
    hne hconv hK4 hM44 hcontain hcard5 hx
  intro L
  rcases leftCardFiveLabels_rowFacts L hx hp with
    ⟨hLtriple, hxL, hpEq | hpEq⟩
  · subst p
    rcases left_row0121_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hp12 L.hpair L.hqpair hLtriple
        hxL (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₁ (dist L.p₁ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m0_s1_l2_r1_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inl hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint]
    · simpa only using hprivate
  · subst p
    rcases left_row0121_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hp12 L.hpair L.hqpair hLtriple
        hxL (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₂ (dist L.p₂ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m0_s1_l2_r1_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inr hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint]
    · simpa only using hprivate

/-- The left count row `(1,0,2,1)` is impossible in the label-complete
`S.surplusCap.card = 5` branch. -/
theorem false_of_leftNonSurplusRow1021_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2) :
    LeftNonSurplusExactCountRowExcluded S x p 1 0 2 1 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  apply false_of_leftCardFiveRow_of_seedProducer (x := x) (p := p)
    hne hconv hK4 hM44 hcontain hcard5 hx
  intro L
  rcases leftCardFiveLabels_rowFacts L hx hp with
    ⟨hLtriple, hxL, hpEq | hpEq⟩
  · subst p
    rcases left_row1021_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hqpair hLtriple hxL
        (privateCenter := .Pw) (Or.inl rfl)
        (centerClass := fun _ => SelectedClass A L.p₁ (dist L.p₁ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m1_s0_l2_r1_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inl hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint]
    · simpa only using hprivate
  · subst p
    rcases left_row1021_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hqpair hLtriple hxL
        (privateCenter := .Pu) (Or.inr rfl)
        (centerClass := fun _ => SelectedClass A L.p₂ (dist L.p₂ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m1_s0_l2_r1_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inr hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint]
    · simpa only using hprivate

/-- The left count row `(1,1,1,1)` is impossible in the label-complete
`S.surplusCap.card = 5` branch. -/
theorem false_of_leftNonSurplusRow1111_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2) :
    LeftNonSurplusExactCountRowExcluded S x p 1 1 1 1 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  apply false_of_leftCardFiveRow_of_seedProducer (x := x) (p := p)
    hne hconv hK4 hM44 hcontain hcard5 hx
  intro L
  have hxTriple : x ∈ ({L.s1, L.s2, L.s3} : Finset ℝ²) := by
    rw [← L.hT]
    exact hx
  rcases leftCardFiveLabels_rowFacts L hx hp with
    ⟨_hLtriple, hxL, hpEq | hpEq⟩
  · subst p
    rcases left_row1111_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hp12 L.hpair L.hqpair hxTriple
        hxL (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₁ (dist L.p₁ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m1_s1_l1_r1_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inl hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint]
    · simpa only using hprivate
  · subst p
    rcases left_row1111_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hp12 L.hpair L.hqpair hxTriple
        hxL (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₂ (dist L.p₂ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m1_s1_l1_r1_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inr hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint]
    · simpa only using hprivate

/-- The left count row `(1,1,2,0)` is impossible in the label-complete
`S.surplusCap.card = 5` branch. -/
theorem false_of_leftNonSurplusRow1120_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2) :
    LeftNonSurplusExactCountRowExcluded S x p 1 1 2 0 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  apply false_of_leftCardFiveRow_of_seedProducer (x := x) (p := p)
    hne hconv hK4 hM44 hcontain hcard5 hx
  intro L
  rcases leftCardFiveLabels_rowFacts L hx hp with
    ⟨hLtriple, hxL, hpEq | hpEq⟩
  · subst p
    rcases left_row1120_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hp12 L.hpair hLtriple hxL
        (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₁ (dist L.p₁ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m1_s1_l2_r0_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inl hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint]
    · simpa only using hprivate
  · subst p
    rcases left_row1120_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj L.hp12 L.hpair hLtriple hxL
        (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₂ (dist L.p₂ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m1_s1_l2_r0_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inr hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint]
    · simpa only using hprivate

/-- The left count row `(2,0,2,0)` is impossible in the label-complete
`S.surplusCap.card = 5` branch. -/
theorem false_of_leftNonSurplusRow2020_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2) :
    LeftNonSurplusExactCountRowExcluded S x p 2 0 2 0 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradiusPos : 0 < dist p x := dist_pos.mpr hp_ne_x
  apply false_of_leftCardFiveRow_of_seedProducer (x := x) (p := p)
    hne hconv hK4 hM44 hcontain hcard5 hx
  intro L
  rcases leftCardFiveLabels_rowFacts L hx hp with
    ⟨hLtriple, hxL, hpEq | hpEq⟩
  · subst p
    rcases left_row2020_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj hLtriple hxL
        (privateCenter := .Pw) (Or.inl ⟨rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₁ (dist L.p₁ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m2_s0_l2_r0_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inl hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint]
    · simpa only using hprivate
  · subst p
    rcases left_row2020_exists_erasedPinRowSeed_privateMask S hM44
        hradiusPos hm hs hl hr L.hinj hLtriple hxL
        (privateCenter := .Pu) (Or.inr ⟨rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A L.p₂ (dist L.p₂ x))
        rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m2_s0_l2_r0_seeds_candidates_subset_fixed
        hseedRow
    refine ⟨seed, hseed, hsstar, Or.inr hprivateCenter, ?_, ?_⟩
    · simp [hprivateCenter, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint]
    · simpa only using hprivate

private theorem false_of_rightOneSidedErasedPayload_of_cardTen_labels_core
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) (hcontain : S.NonSurplusMoserCapContainment)
    (hcardA : A.card = 10)
    {center x : ℝ²} {radius : ℝ}
    (hpayload : SurplusCapPacket.RightOneSidedErasedPayload
      S S.oppIndex1 center x radius)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpointA : ∀ label : Label,
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label ∈ A)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hcenter : center ∈ S.oppInterior1)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hcross : SameRadiusCrossSeparationProducer
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)) :
    False := by
  classical
  let pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex1 hK4
      hcontain.1 hM44.oppIndex1_cap_card_eq_four with
    ⟨vRadius, _hvRadius, hvClass⟩
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex2 hK4
      hcontain.2 hM44.oppIndex2_cap_card_eq_four with
    ⟨wRadius, _hwRadius, hwClass⟩
  have hvMask :
      pointMask pointOf (SelectedClass A (pointOf .v) vRadius) =
        firstOppExactCapMask := by
    rw [show SelectedClass A (pointOf .v) vRadius =
        S.capByIndex S.oppIndex1 by
      simpa [pointOf, rightPinnedLabelPoint] using hvClass]
    exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
      S hinj hpair
  have hwMask :
      pointMask pointOf (SelectedClass A (pointOf .w) wRadius) =
        secondOppExactCapMask := by
    rw [show SelectedClass A (pointOf .w) wRadius =
        S.capByIndex S.oppIndex2 by
      simpa [pointOf, rightPinnedLabelPoint] using hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S hinj hqpair
  have hcenterPair : center ∈ ({p₁, p₂} : Finset ℝ²) := by
    rw [← hpair]
    exact hcenter
  simp only [Finset.mem_insert, Finset.mem_singleton] at hcenterPair
  rcases hcenterPair with hcenterEq | hcenterEq
  · subst center
    rcases right_row2101_exists_erasedPinRowSeed_privateMask S hpayload
        hinj hp12 hpair hxTriple
        (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A p₁ radius) rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m2_s1_l0_r1_seeds_candidates_subset_fixed
        hseedRow
    have hprivateMask :
        pointMask pointOf
            (SelectedClass A (pointOf seed.privateCenter) radius) =
          seed.privateMask := by
      simpa [pointOf, rightPinnedLabelPoint, hprivateCenter] using hprivate
    exact false_of_erasedPinFixedSeed_of_cardTen_selectedClasses_core
      hconv hK4 hcardA hinj hpointA hseed hsstar
      (by simp [hprivateCenter]) (by simp [hprivateCenter])
      hvMask hwMask hprivateMask hcross
  · subst center
    rcases right_row2101_exists_erasedPinRowSeed_privateMask S hpayload
        hinj hp12 hpair hxTriple
        (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A p₂ radius) rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_right_m2_s1_l0_r1_seeds_candidates_subset_fixed
        hseedRow
    have hprivateMask :
        pointMask pointOf
            (SelectedClass A (pointOf seed.privateCenter) radius) =
          seed.privateMask := by
      simpa [pointOf, rightPinnedLabelPoint, hprivateCenter] using hprivate
    exact false_of_erasedPinFixedSeed_of_cardTen_selectedClasses_core
      hconv hK4 hcardA hinj hpointA hseed hsstar
      (by simp [hprivateCenter]) (by simp [hprivateCenter])
      hvMask hwMask hprivateMask hcross

/-- In a right-oriented card-ten labeling, the terminal erased payload
produces a fixed bank seed whose private class is the payload class. -/
theorem false_of_rightOneSidedErasedPayload_of_cardTen_ccwLabels
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) (hcontain : S.NonSurplusMoserCapContainment)
    (hcardA : A.card = 10)
    {center x : ℝ²} {radius : ℝ}
    (hpayload : SurplusCapPacket.RightOneSidedErasedPayload
      S S.oppIndex1 center x radius)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpointA : ∀ label : Label,
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label ∈ A)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hcenter : center ∈ S.oppInterior1)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hccw : EuclideanGeometry.IsCcwConvexPolygon
      (fun i : Fin 10 =>
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
          (labelOfHullFin i))) :
    False := by
  apply false_of_rightOneSidedErasedPayload_of_cardTen_labels_core
    hconv hK4 hM44 hcontain hcardA hpayload hinj hpointA hp12 hpair
      hqpair hcenter hxTriple
  intro centerClass c cp hccp hsameC hsameCP
  exact crossSeparationOKForMasks_of_sameRadius_ccwHull hccw hinj hccp
    hsameC hsameCP

/-- Reflected-hull counterpart of
`false_of_rightOneSidedErasedPayload_of_cardTen_ccwLabels`. -/
theorem false_of_rightOneSidedErasedPayload_of_cardTen_reflectedCcwLabels
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) (hcontain : S.NonSurplusMoserCapContainment)
    (hcardA : A.card = 10)
    {center x : ℝ²} {radius : ℝ}
    (hpayload : SurplusCapPacket.RightOneSidedErasedPayload
      S S.oppIndex1 center x radius)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpointA : ∀ label : Label,
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label ∈ A)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hcenter : center ∈ S.oppInterior1)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hccw : EuclideanGeometry.IsCcwConvexPolygon
      (fun i : Fin 10 =>
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
          (reflectedHullLabel (labelOfHullFin i)))) :
    False := by
  apply false_of_rightOneSidedErasedPayload_of_cardTen_labels_core
    hconv hK4 hM44 hcontain hcardA hpayload hinj hpointA hp12 hpair
      hqpair hcenter hxTriple
  intro centerClass c cp hccp hsameC hsameCP
  exact crossSeparationOKForMasks_of_sameRadius_reflectedCcwHull hccw hinj
    hccp hsameC hsameCP

private theorem false_of_leftOneSidedErasedPayload_of_cardTen_labels_core
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) (hcontain : S.NonSurplusMoserCapContainment)
    (hcardA : A.card = 10)
    {center x : ℝ²} {radius : ℝ}
    (hpayload : SurplusCapPacket.LeftOneSidedErasedPayload
      S S.oppIndex2 center x radius)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpointA : ∀ label : Label,
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label ∈ A)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hcenter : center ∈ S.oppInterior2)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hcross : SameRadiusCrossSeparationProducer
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)) :
    False := by
  classical
  let pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex2 hK4
      hcontain.2 hM44.oppIndex2_cap_card_eq_four with
    ⟨vRadius, _hvRadius, hvClass⟩
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex1 hK4
      hcontain.1 hM44.oppIndex1_cap_card_eq_four with
    ⟨wRadius, _hwRadius, hwClass⟩
  have hvMask :
      pointMask pointOf (SelectedClass A (pointOf .v) vRadius) =
        firstOppExactCapMask := by
    rw [show SelectedClass A (pointOf .v) vRadius =
        S.capByIndex S.oppIndex2 by
      simpa [pointOf, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint] using hvClass]
    exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
      S hinj hpair
  have hwMask :
      pointMask pointOf (SelectedClass A (pointOf .w) wRadius) =
        secondOppExactCapMask := by
    rw [show SelectedClass A (pointOf .w) wRadius =
        S.capByIndex S.oppIndex1 by
      simpa [pointOf, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint] using hwClass]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S hinj hqpair
  have hcenterPair : center ∈ ({p₁, p₂} : Finset ℝ²) := by
    rw [← hpair]
    exact hcenter
  simp only [Finset.mem_insert, Finset.mem_singleton] at hcenterPair
  rcases hcenterPair with hcenterEq | hcenterEq
  · subst center
    rcases left_row2110_exists_erasedPinRowSeed_privateMask S hpayload
        hinj hp12 hpair hxTriple
        (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A p₁ radius) rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m2_s1_l1_r0_seeds_candidates_subset_fixed
        hseedRow
    have hprivateMask :
        pointMask pointOf
            (SelectedClass A (pointOf seed.privateCenter) radius) =
          seed.privateMask := by
      simpa [pointOf, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint, hprivateCenter] using hprivate
    exact false_of_erasedPinFixedSeed_of_cardTen_selectedClasses_core
      hconv hK4 hcardA hinj hpointA hseed hsstar
      (by simp [hprivateCenter]) (by simp [hprivateCenter])
      hvMask hwMask hprivateMask hcross
  · subst center
    rcases left_row2110_exists_erasedPinRowSeed_privateMask S hpayload
        hinj hp12 hpair hxTriple
        (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩)
        (centerClass := fun _ => SelectedClass A p₂ radius) rfl with
      ⟨seed, hseedRow, hsstar, _hsstarEq, hprivateCenter, hprivate⟩
    have hseed : seed ∈ erasedPinFixedSeeds :=
      erasedPinRow_ep_left_m2_s1_l1_r0_seeds_candidates_subset_fixed
        hseedRow
    have hprivateMask :
        pointMask pointOf
            (SelectedClass A (pointOf seed.privateCenter) radius) =
          seed.privateMask := by
      simpa [pointOf, leftPinnedLabelPoint, leftPinnedToRightLabel,
        rightPinnedLabelPoint, hprivateCenter] using hprivate
    exact false_of_erasedPinFixedSeed_of_cardTen_selectedClasses_core
      hconv hK4 hcardA hinj hpointA hseed hsstar
      (by simp [hprivateCenter]) (by simp [hprivateCenter])
      hvMask hwMask hprivateMask hcross

/-- Left-oriented terminal erased payload exclusion in the generated card-ten
hull convention. -/
theorem false_of_leftOneSidedErasedPayload_of_cardTen_ccwLabels
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) (hcontain : S.NonSurplusMoserCapContainment)
    (hcardA : A.card = 10)
    {center x : ℝ²} {radius : ℝ}
    (hpayload : SurplusCapPacket.LeftOneSidedErasedPayload
      S S.oppIndex2 center x radius)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpointA : ∀ label : Label,
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label ∈ A)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hcenter : center ∈ S.oppInterior2)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hccw : EuclideanGeometry.IsCcwConvexPolygon
      (fun i : Fin 10 =>
        leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
          (labelOfHullFin i))) :
    False := by
  apply false_of_leftOneSidedErasedPayload_of_cardTen_labels_core
    hconv hK4 hM44 hcontain hcardA hpayload hinj hpointA hp12 hpair
      hqpair hcenter hxTriple
  intro centerClass c cp hccp hsameC hsameCP
  exact crossSeparationOKForMasks_of_sameRadius_ccwHull hccw hinj hccp
    hsameC hsameCP

/-- Reflected-hull counterpart of
`false_of_leftOneSidedErasedPayload_of_cardTen_ccwLabels`. -/
theorem false_of_leftOneSidedErasedPayload_of_cardTen_reflectedCcwLabels
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) (hcontain : S.NonSurplusMoserCapContainment)
    (hcardA : A.card = 10)
    {center x : ℝ²} {radius : ℝ}
    (hpayload : SurplusCapPacket.LeftOneSidedErasedPayload
      S S.oppIndex2 center x radius)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpointA : ∀ label : Label,
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label ∈ A)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hcenter : center ∈ S.oppInterior2)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hccw : EuclideanGeometry.IsCcwConvexPolygon
      (fun i : Fin 10 =>
        leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
          (reflectedHullLabel (labelOfHullFin i)))) :
    False := by
  apply false_of_leftOneSidedErasedPayload_of_cardTen_labels_core
    hconv hK4 hM44 hcontain hcardA hpayload hinj hpointA hp12 hpair
      hqpair hcenter hxTriple
  intro centerClass c cp hccp hsameC hsameCP
  exact crossSeparationOKForMasks_of_sameRadius_reflectedCcwHull hccw hinj
    hccp hsameC hsameCP

/-- The right terminal erased payload is impossible in the label-complete
`S.surplusCap.card = 5` branch, independently of the ambient apex
orientation. -/
theorem false_of_rightOneSidedErasedPayload_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {center x : ℝ²} {radius : ℝ}
    (hcenter : center ∈ S.capInteriorByIndex S.oppIndex1)
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hpayload : SurplusCapPacket.RightOneSidedErasedPayload
      S S.oppIndex1 center x radius) :
    False := by
  classical
  have hcardA : A.card = 10 := by
    have hcard := hM44.surplus_card_eq
    omega
  have hxSingleton : ({x} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx := by
    intro z hz
    have hzEq : z = x := by simpa using hz
    simpa [hzEq] using hx
  rcases EndpointCertificate.exists_surplusInterior_triple_covering
      hM44 hxSingleton (by simp) with
    ⟨t1, t2, t3, hxTripleSub, ht12, ht13, ht23, htSub⟩
  have hxTriple : x ∈ ({t1, t2, t3} : Finset ℝ²) :=
    hxTripleSub (by simp)
  have hTcard : ({t1, t2, t3} : Finset ℝ²).card = 3 := by
    simp [ht12, ht13, ht23]
  have hcenterOpp : center ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hcenter
  rcases S.exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices
      hne hconv hK4 with
    ⟨n, hn, φ, iv, iw, hφinj, hφimage, hccwBoundary, hu, hv, hw,
      hapexOrder⟩
  rcases hapexOrder with hrightOrder | hleftOrder
  · rcases hrightOrder with ⟨h0v, hvw⟩
    rcases exists_rightPinnedHullOrderLabels_of_apex_order
        (A := A) (S := S) (x := x)
        (T := ({t1, t2, t3} : Finset ℝ²))
        (n := n) (φ := φ) (iv := iv) (iw := iw)
        hn hφinj hφimage hccwBoundary hu hv hw h0v hvw hM44 hxTriple
        hTcard htSub with
      ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
        _hTeq, hxLabels, hs12, hs13, hs23, _hsSub, hp₁I, hp₂I,
        hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
    have hinj : Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) :=
      rightPinnedLabelPoint_injective_of_mem S
        hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13
          hs23
    have hpointA : ∀ label : Label,
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label ∈ A :=
      rightPinnedLabelPoint_mem_of_mem S
        hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I
    exact false_of_rightOneSidedErasedPayload_of_cardTen_ccwLabels
      hconv hK4 hM44 hcontain hcardA hpayload hinj hpointA hp12 hpair
      hqpair hcenterOpp hxLabels
      (isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder)
  · rcases hleftOrder with ⟨h0w, hwv⟩
    rcases exists_leftPinnedHullOrderLabels_of_apex_order
        (A := A) (S := S) (x := x)
        (T := ({t1, t2, t3} : Finset ℝ²))
        (n := n) (φ := φ) (iv := iv) (iw := iw)
        hn hφinj hφimage hccwBoundary hu hv hw h0w hwv hM44 hxTriple
        hTcard htSub with
      ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
        _hTeq, hxLabels, hs12, hs13, hs23, _hsSub, hp₁I, hp₂I,
        hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
    have hpairRev : S.oppInterior1 = ({p₂, p₁} : Finset ℝ²) := by
      rw [hpair]
      ext z
      simp [or_comm]
    have hqpairRev : S.oppInterior2 = ({q₂, q₁} : Finset ℝ²) := by
      rw [hqpair]
      ext z
      simp [or_comm]
    have hxLabelsRev : x ∈ ({s3, s2, s1} : Finset ℝ²) := by
      simpa [or_comm, or_left_comm, or_assoc] using hxLabels
    have hinj : Function.Injective
        (rightPinnedLabelPoint S p₂ p₁ q₂ q₁ s3 s2 s1) :=
      rightPinnedLabelPoint_injective_of_mem S
        hp₂I hp₁I hq₂I hq₁I hs3I hs2I hs1I hp12.symm hq12.symm
          hs23.symm hs13.symm hs12.symm
    have hpointA : ∀ label : Label,
        rightPinnedLabelPoint S p₂ p₁ q₂ q₁ s3 s2 s1 label ∈ A :=
      rightPinnedLabelPoint_mem_of_mem S
        hp₂I hp₁I hq₂I hq₁I hs3I hs2I hs1I
    have hccwReflected : EuclideanGeometry.IsCcwConvexPolygon
        (fun i : Fin 10 =>
          rightPinnedLabelPoint S p₂ p₁ q₂ q₁ s3 s2 s1
            (reflectedHullLabel (labelOfHullFin i))) := by
      have hccwLeft : EuclideanGeometry.IsCcwConvexPolygon
          (fun i : Fin 10 =>
            leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3
              (labelOfHullFin i)) :=
        isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder
      convert hccwLeft using 2
      rename_i i
      fin_cases i <;> rfl
    exact false_of_rightOneSidedErasedPayload_of_cardTen_reflectedCcwLabels
      hconv hK4 hM44 hcontain hcardA hpayload hinj hpointA hp12.symm
      hpairRev hqpairRev hcenterOpp hxLabelsRev hccwReflected

/-- The left terminal erased payload is impossible in the label-complete
`S.surplusCap.card = 5` branch, independently of the ambient apex
orientation. -/
theorem false_of_leftOneSidedErasedPayload_of_cardFive
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard5 : S.surplusCap.card = 5)
    {center x : ℝ²} {radius : ℝ}
    (hcenter : center ∈ S.capInteriorByIndex S.oppIndex2)
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hpayload : SurplusCapPacket.LeftOneSidedErasedPayload
      S S.oppIndex2 center x radius) :
    False := by
  classical
  have hcardA : A.card = 10 := by
    have hcard := hM44.surplus_card_eq
    omega
  have hxSingleton : ({x} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx := by
    intro z hz
    have hzEq : z = x := by simpa using hz
    simpa [hzEq] using hx
  rcases EndpointCertificate.exists_surplusInterior_triple_covering
      hM44 hxSingleton (by simp) with
    ⟨t1, t2, t3, hxTripleSub, ht12, ht13, ht23, htSub⟩
  have hxTriple : x ∈ ({t1, t2, t3} : Finset ℝ²) :=
    hxTripleSub (by simp)
  have hTcard : ({t1, t2, t3} : Finset ℝ²).card = 3 := by
    simp [ht12, ht13, ht23]
  have hcenterOpp : center ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hcenter
  rcases S.exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices
      hne hconv hK4 with
    ⟨n, hn, φ, iv, iw, hφinj, hφimage, hccwBoundary, hu, hv, hw,
      hapexOrder⟩
  rcases hapexOrder with hrightOrder | hleftOrder
  · rcases hrightOrder with ⟨h0v, hvw⟩
    rcases exists_rightPinnedHullOrderLabels_of_apex_order
        (A := A) (S := S) (x := x)
        (T := ({t1, t2, t3} : Finset ℝ²))
        (n := n) (φ := φ) (iv := iv) (iw := iw)
        hn hφinj hφimage hccwBoundary hu hv hw h0v hvw hM44 hxTriple
        hTcard htSub with
      ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
        _hTeq, hxLabels, hs12, hs13, hs23, _hsSub, hp₁I, hp₂I,
        hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
    have hpairRev : S.oppInterior2 = ({q₂, q₁} : Finset ℝ²) := by
      rw [hqpair]
      ext z
      simp [or_comm]
    have hqpairRev : S.oppInterior1 = ({p₂, p₁} : Finset ℝ²) := by
      rw [hpair]
      ext z
      simp [or_comm]
    have hxLabelsRev : x ∈ ({s3, s2, s1} : Finset ℝ²) := by
      simpa [or_comm, or_left_comm, or_assoc] using hxLabels
    have hinj : Function.Injective
        (leftPinnedLabelPoint S q₂ q₁ p₂ p₁ s3 s2 s1) :=
      leftPinnedLabelPoint_injective_of_mem S
        hq₂I hq₁I hp₂I hp₁I hs3I hs2I hs1I hq12.symm hp12.symm
          hs23.symm hs13.symm hs12.symm
    have hpointA : ∀ label : Label,
        leftPinnedLabelPoint S q₂ q₁ p₂ p₁ s3 s2 s1 label ∈ A :=
      leftPinnedLabelPoint_mem_of_mem S
        hq₂I hq₁I hp₂I hp₁I hs3I hs2I hs1I
    have hccwReflected : EuclideanGeometry.IsCcwConvexPolygon
        (fun i : Fin 10 =>
          leftPinnedLabelPoint S q₂ q₁ p₂ p₁ s3 s2 s1
            (reflectedHullLabel (labelOfHullFin i))) := by
      have hccwRight : EuclideanGeometry.IsCcwConvexPolygon
          (fun i : Fin 10 =>
            rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
              (labelOfHullFin i)) :=
        isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder
      convert hccwRight using 2
      rename_i i
      fin_cases i <;> rfl
    exact false_of_leftOneSidedErasedPayload_of_cardTen_reflectedCcwLabels
      hconv hK4 hM44 hcontain hcardA hpayload hinj hpointA hq12.symm
      hpairRev hqpairRev hcenterOpp hxLabelsRev hccwReflected
  · rcases hleftOrder with ⟨h0w, hwv⟩
    rcases exists_leftPinnedHullOrderLabels_of_apex_order
        (A := A) (S := S) (x := x)
        (T := ({t1, t2, t3} : Finset ℝ²))
        (n := n) (φ := φ) (iv := iv) (iw := iw)
        hn hφinj hφimage hccwBoundary hu hv hw h0w hwv hM44 hxTriple
        hTcard htSub with
      ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
        _hTeq, hxLabels, hs12, hs13, hs23, _hsSub, hp₁I, hp₂I,
        hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
    have hinj : Function.Injective
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3) :=
      leftPinnedLabelPoint_injective_of_mem S
        hq₁I hq₂I hp₁I hp₂I hs1I hs2I hs3I hq12 hp12 hs12 hs13
          hs23
    have hpointA : ∀ label : Label,
        leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3 label ∈ A :=
      leftPinnedLabelPoint_mem_of_mem S
        hq₁I hq₂I hp₁I hp₂I hs1I hs2I hs3I
    exact false_of_leftOneSidedErasedPayload_of_cardTen_ccwLabels
      hconv hK4 hM44 hcontain hcardA hpayload hinj hpointA hq12 hqpair
      hpair hcenterOpp hxLabels
      (isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder)

end ErasedCertificate

end Problem97
