/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.RemovableVertexAxiom.Base

/-!
# Pinned-surplus metric-shadow producer

This shard contains the active producer obligation for the pinned-surplus
residual branch.  It imports the stable removable-vertex base shard but does not
import the generated row-zero bank.
-/

open scoped EuclideanGeometry

namespace Problem97

open SurplusCOMPGBank

private theorem endpointMetricShadow_shadowOfPointClasses_of_selectedClasses
    {A : Finset ℝ²} {pointOf : Label → ℝ²}
    {centerClass : Label → Finset ℝ²} {radiusOf : Label → ℝ}
    (hinj : Function.Injective pointOf)
    (hclass : ∀ center : Label,
      centerClass center = SelectedClass A (pointOf center) (radiusOf center)) :
    EndpointCertificate.Variables.EndpointMetricShadow pointOf
      (shadowOfPointClasses pointOf centerClass) := by
  refine endpointMetricShadow_shadowOfPointClasses_of_sameRadius hinj ?_
  intro center a b ha hb
  rw [hclass center] at ha hb
  exact (mem_selectedClass.mp ha).2.trans (mem_selectedClass.mp hb).2.symm

private theorem noThreeOK_shadowOfPointClasses_of_selectedClasses
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    {pointOf : Label → ℝ²}
    (hinj : Function.Injective pointOf)
    (hpointMem : ∀ center : Label, pointOf center ∈ A)
    {centerClass : Label → Finset ℝ²} {radiusOf : Label → ℝ}
    (hselected : ∀ center : Label,
      centerClass center = SelectedClass A (pointOf center) (radiusOf center)) :
    noThreeOK (shadowOfPointClasses pointOf centerClass) = true := by
  unfold noThreeOK
  rw [List.all_eq_true]
  intro pointPair hpointPair
  exact decide_eq_true
    (pointPairClassCount_le_two_of_selectedClasses hconv hinj hpointMem
      hselected hpointPair)

private theorem wSelectorMask_mem_candidateMasks
    {sstar leftHit rightHit : Label}
    (hsstar : isSurplusStar sstar = true)
    (hleft :
      leftHit = .v ∨ leftHit = .s1 ∨ leftHit = .s2 ∨ leftHit = .s3)
    (hright : rightHit = .u ∨ rightHit = .Pw ∨ rightHit = .Pu) :
    maskOfLabels [.Q1, .Q2, leftHit, rightHit] ∈
      candidateMasks sstar .w := by
  exact mem_candidateMasks_of_candidateMaskOK hsstar (by
    rcases hleft with rfl | rfl | rfl | rfl <;>
    rcases hright with rfl | rfl | rfl <;>
    cases sstar <;> simp [isSurplusStar] at hsstar <;> decide)

private theorem pointMask_eq_QQSelectorMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) {leftHit rightHit : Label}
    (hleft :
      leftHit = .v ∨ leftHit = .s1 ∨ leftHit = .s2 ∨ leftHit = .s3)
    (hright : rightHit = .u ∨ rightHit = .Pw ∨ rightHit = .Pu) :
    pointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf leftHit, pointOf rightHit} :
          Finset α) =
      maskOfLabels [.Q1, .Q2, leftHit, rightHit] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  rcases hleft with rfl | rfl | rfl | rfl <;>
  rcases hright with rfl | rfl | rfl <;>
    simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
      Label.index]

private theorem surplusStar_eq_s1_or_s2_or_s3 {label : Label}
    (hlabel : isSurplusStar label = true) :
    label = .s1 ∨ label = .s2 ∨ label = .s3 := by
  cases label <;> simp [isSurplusStar] at hlabel ⊢

private theorem wSelectorClass_mem_candidateMasks
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {T : Finset α} {sstar leftHit rightHit : Label}
    (hinj : Function.Injective pointOf)
    (hsstar : isSurplusStar sstar = true)
    (hleft :
      leftHit = .v ∨ leftHit = .s1 ∨ leftHit = .s2 ∨ leftHit = .s3)
    (hright : rightHit = .u ∨ rightHit = .Pw ∨ rightHit = .Pu)
    (hT :
      T = ({pointOf .Q1, pointOf .Q2, pointOf leftHit,
        pointOf rightHit} : Finset α)) :
    pointMask pointOf T ∈ candidateMasks sstar .w := by
  rw [hT, pointMask_eq_QQSelectorMask hinj hleft hright]
  exact wSelectorMask_mem_candidateMasks hsstar hleft hright

/-- Candidate-mask predicate left for non-`.v`/non-`.w` centers after the
metric-shadow producer has proved point-mask normalization and no-self. -/
def nonVWCandidateMaskOK (sstar center : Label) (mask : Nat) : Bool :=
  maskCard mask == 4 &&
    (if center == .u then
      decide (maskInterCard mask cvNoUMask <= 1) &&
        decide (maskInterCard mask cwNoUMask <= 1)
    else
      true) &&
    (if isMoserLabel center then
      true
    else
      !(maskHas mask .u && maskHas mask .v && maskHas mask .w)) &&
    localTriggerOKAt sstar center mask

private theorem candidateMaskOK_of_nonVWCandidateMaskOK_pointMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {sstar center : Label}
    (hv : center ≠ .v) (hw : center ≠ .w)
    (hself :
      maskHas (pointMask pointOf (centerClass center)) center = false)
    (hOK :
      nonVWCandidateMaskOK sstar center
        (pointMask pointOf (centerClass center)) = true) :
    candidateMaskOK sstar center
      (pointMask pointOf (centerClass center)) = true := by
  cases center <;> try contradiction
  all_goals
    simpa [nonVWCandidateMaskOK, candidateMaskOK, maskNormalized_pointMask,
      isMoserLabel, hself] using hOK

private theorem pointMask_maskHas_self_false_of_selectedClass_card_ge_four
    {A : Finset ℝ²} {pointOf : Label → ℝ²}
    {centerClass : Label → Finset ℝ²} {radiusOf : Label → ℝ}
    {center : Label}
    (hselected :
      centerClass center =
        SelectedClass A (pointOf center) (radiusOf center))
    (hcard : 4 ≤ (centerClass center).card) :
    maskHas (pointMask pointOf (centerClass center)) center = false := by
  classical
  refine pointMask_maskHas_false_of_not_mem ?_
  intro hmem
  have hmemSelected :
      pointOf center ∈
        SelectedClass A (pointOf center) (radiusOf center) := by
    simpa [hselected] using hmem
  have hradius_zero : radiusOf center = 0 := by
    have hdist := (mem_selectedClass.mp hmemSelected).2
    simpa [dist_self] using hdist.symm
  have hsub :
      centerClass center ⊆ ({pointOf center} : Finset ℝ²) := by
    intro y hy
    have hySelected :
        y ∈ SelectedClass A (pointOf center) (radiusOf center) := by
      simpa [hselected] using hy
    have hyDist : dist (pointOf center) y = 0 := by
      simpa [hradius_zero] using (mem_selectedClass.mp hySelected).2
    have hxy : pointOf center = y := dist_eq_zero.mp hyDist
    simp [hxy]
  have hle : (centerClass center).card ≤ 1 := by
    calc
      (centerClass center).card ≤ ({pointOf center} : Finset ℝ²).card :=
        Finset.card_le_card hsub
      _ = 1 := by simp
  omega

private theorem selectedClass_eq_pair_left_right_singletons
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    {q₁ q₂ leftHit rightHit : ℝ²}
    (hradius : 0 < radius)
    (hpair : S.capInteriorByIndex i = ({q₁, q₂} : Finset ℝ²))
    (hIsub :
      S.capInteriorByIndex i ⊆
        SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hleft :
      SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.leftAdjacentCapByIndex i =
        ({leftHit} : Finset ℝ²))
    (hright :
      SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.rightAdjacentCapByIndex i =
        ({rightHit} : Finset ℝ²)) :
    SelectedClass A (S.oppositeVertexByIndex i) radius =
      ({q₁, q₂, leftHit, rightHit} : Finset ℝ²) := by
  classical
  let T := SelectedClass A (S.oppositeVertexByIndex i) radius
  have hcover :
      T \ S.capInteriorByIndex i ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hradius
  ext z
  constructor
  · intro hz
    by_cases hzI : z ∈ S.capInteriorByIndex i
    · have hzPair : z ∈ ({q₁, q₂} : Finset ℝ²) := by
        simpa [hpair] using hzI
      simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair ⊢
      rcases hzPair with rfl | rfl
      · exact Or.inl rfl
      · exact Or.inr (Or.inl rfl)
    · have hzOutside : z ∈ T \ S.capInteriorByIndex i := by
        exact Finset.mem_sdiff.mpr ⟨by simpa [T] using hz, hzI⟩
      have hzAdj := hcover hzOutside
      simp only [Finset.mem_union, Finset.mem_inter] at hzAdj
      rcases hzAdj with hzLeft | hzRight
      · have hzSingleton : z ∈ ({leftHit} : Finset ℝ²) := by
          rw [← hleft]
          simpa [T] using hzLeft
        have hzEq : z = leftHit := by simpa using hzSingleton
        simp [hzEq]
      · have hzSingleton : z ∈ ({rightHit} : Finset ℝ²) := by
          rw [← hright]
          simpa [T] using hzRight
        have hzEq : z = rightHit := by simpa using hzSingleton
        simp [hzEq]
  · intro hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with hz | hz | hz | hz
    · subst z
      exact hIsub (by rw [hpair]; simp)
    · subst z
      exact hIsub (by rw [hpair]; simp)
    · subst z
      have hmem : leftHit ∈ T ∩ S.leftAdjacentCapByIndex i := by
        rw [hleft]
        simp
      exact by simpa [T] using (Finset.mem_inter.mp hmem).1
    · subst z
      have hmem : rightHit ∈ T ∩ S.rightAdjacentCapByIndex i := by
        rw [hright]
        simp
      exact by simpa [T] using (Finset.mem_inter.mp hmem).1

/-- Exact finite-shape producer still needed for the pinned-surplus metric
shadow: once the pinned residual has fixed the ten-label geometric surface, the
non-`.v`/non-`.w` selected classes must satisfy the generated local candidate
predicate after normalization and no-self are discharged by the consumer.

This is the on-spine residual isolated from
`isM44PinnedSurplusMetricShadowProducer`.  Its conclusion is the explicit
non-`.v`/non-`.w` predicate, whose first unavailable conjunct is the exact
four-label mask cardinality for the induced point mask. -/
abbrev IsM44PinnedSurplusNonVExactShapeProducerStatement : Prop :=
    ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
      HasNEquidistantProperty 4 A → 9 < A.card →
      (∀ B : Finset ℝ², B.card < A.card →
        B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
      ∀ S : SurplusCapPacket A, S.IsM44 →
        (∀ {radius : ℝ} {x : ℝ²},
          S.PinnedRightSurplusResidualAt radius x →
          ∀ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
            p₁ ≠ p₂ →
            S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) →
            q₁ ≠ q₂ →
            S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) →
            s1 ≠ s2 → s1 ≠ s3 → s2 ≠ s3 →
            ({s1, s2, s3} : Finset ℝ²) ⊆
              S.capInteriorByIndex S.surplusIdx →
            p₁ ∈ S.capInteriorByIndex S.oppIndex1 →
            p₂ ∈ S.capInteriorByIndex S.oppIndex1 →
            q₁ ∈ S.capInteriorByIndex S.oppIndex2 →
            q₂ ∈ S.capInteriorByIndex S.oppIndex2 →
            s1 ∈ S.capInteriorByIndex S.surplusIdx →
            s2 ∈ S.capInteriorByIndex S.surplusIdx →
            s3 ∈ S.capInteriorByIndex S.surplusIdx →
            x ∈ ({s1, s2, s3} : Finset ℝ²) →
            ∀ {centerClass : Label → Finset ℝ²}
                {radiusOf : Label → ℝ} {sstar : Label},
              isSurplusStar sstar = true →
              rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x →
              (∀ center : Label,
                centerClass center =
                  SelectedClass A
                    (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 center)
                    (radiusOf center)) →
              (∀ center : Label, center ≠ .v → center ≠ .w →
                4 ≤ (centerClass center).card) →
              ∀ center : Label, center ≠ .v → center ≠ .w →
                nonVWCandidateMaskOK sstar center
                  (pointMask
                    (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                    (centerClass center)) = true) ∧
        (∀ {radius : ℝ} {x : ℝ²},
          S.PinnedLeftSurplusResidualAt radius x →
          ∀ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
            p₁ ≠ p₂ →
            S.oppInterior2 = ({p₁, p₂} : Finset ℝ²) →
            q₁ ≠ q₂ →
            S.oppInterior1 = ({q₁, q₂} : Finset ℝ²) →
            s1 ≠ s2 → s1 ≠ s3 → s2 ≠ s3 →
            ({s1, s2, s3} : Finset ℝ²) ⊆
              S.capInteriorByIndex S.surplusIdx →
            p₁ ∈ S.capInteriorByIndex S.oppIndex2 →
            p₂ ∈ S.capInteriorByIndex S.oppIndex2 →
            q₁ ∈ S.capInteriorByIndex S.oppIndex1 →
            q₂ ∈ S.capInteriorByIndex S.oppIndex1 →
            s1 ∈ S.capInteriorByIndex S.surplusIdx →
            s2 ∈ S.capInteriorByIndex S.surplusIdx →
            s3 ∈ S.capInteriorByIndex S.surplusIdx →
            x ∈ ({s1, s2, s3} : Finset ℝ²) →
            ∀ {centerClass : Label → Finset ℝ²}
                {radiusOf : Label → ℝ} {sstar : Label},
              isSurplusStar sstar = true →
              leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x →
              (∀ center : Label,
                centerClass center =
                  SelectedClass A
                    (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 center)
                    (radiusOf center)) →
              (∀ center : Label, center ≠ .v → center ≠ .w →
                4 ≤ (centerClass center).card) →
              ∀ center : Label, center ≠ .v → center ≠ .w →
                nonVWCandidateMaskOK sstar center
                  (pointMask
                    (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                    (centerClass center)) = true)

/-- Named on-spine residual for the non-`.v`/non-`.w`
exact-shape/confinement part of the pinned-surplus metric-shadow producer. -/
theorem isM44PinnedSurplusNonVExactShapeProducer :
      IsM44PinnedSurplusNonVExactShapeProducerStatement := by
  sorry

/-- Remaining pinned-surplus producer obligation after the checked row-zero
bank contradiction is wired into the spine. -/
theorem isM44PinnedSurplusMetricShadowProducer :
      IsM44PinnedSurplusMetricShadowProducerStatement := by
  intro A hne hconv hK4 hgt hMin S hM44
  have hnonVShape :=
    isM44PinnedSurplusNonVExactShapeProducer A hne hconv hK4 hgt hMin S hM44
  rcases hM44.exists_nonSurplusMoserSelectorShapes hK4 hconv with
    ⟨opp1Radius, opp2Radius, hopp1RadiusPos, hopp1Shape,
      hopp2RadiusPos, hopp2Shape⟩
  rcases hopp1Shape with
    ⟨hopp1Card, hopp1InteriorSub, opp1LeftHit, opp1RightHit,
      hopp1LeftCap, hopp1RightCap, hopp1LeftSingleton,
      hopp1RightSingleton⟩
  rcases hopp2Shape with
    ⟨hopp2Card, hopp2InteriorSub, opp2LeftHit, opp2RightHit,
      hopp2LeftCap, hopp2RightCap, hopp2LeftSingleton,
      hopp2RightSingleton⟩
  rcases S.exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices
      hne hconv hK4 with
    ⟨n, hn, φ, iv, iw, hφinj, hφimage, hccwBoundary, hu, hv, hw,
      hapexOrder⟩
  constructor
  · intro radius x hpinned
    classical
    have hxSurplus := S.pinnedRightSurplusResidual_mem_right_surplus hpinned
    have hxSurplusInterior :
        x ∈ S.capInteriorByIndex S.surplusIdx :=
      S.mem_surplusInterior_of_oppIndex1_right_surplus
        (S.pinnedRightSurplusResidual_radius_pos hpinned)
        (S.pinnedRightSurplusResidual_mem_selectedClass hpinned)
        hxSurplus
    have hopp2LeftT :
        opp2LeftHit ∈
          SelectedClass A (S.oppositeVertexByIndex S.oppIndex2)
            opp2Radius := by
      have hmem :
          opp2LeftHit ∈
            SelectedClass A (S.oppositeVertexByIndex S.oppIndex2)
                opp2Radius ∩
              S.leftAdjacentCapByIndex S.oppIndex2 := by
        rw [hopp2LeftSingleton]
        simp
      exact (Finset.mem_inter.mp hmem).1
    have hopp2RightT :
        opp2RightHit ∈
          SelectedClass A (S.oppositeVertexByIndex S.oppIndex2)
            opp2Radius := by
      have hmem :
          opp2RightHit ∈
            SelectedClass A (S.oppositeVertexByIndex S.oppIndex2)
                opp2Radius ∩
              S.rightAdjacentCapByIndex S.oppIndex2 := by
        rw [hopp2RightSingleton]
        simp
      exact (Finset.mem_inter.mp hmem).1
    let R : Finset ℝ² :=
      ({x, opp2LeftHit} : Finset ℝ²).filter
        (fun z => z ∈ S.capInteriorByIndex S.surplusIdx)
    have hRsub : R ⊆ S.capInteriorByIndex S.surplusIdx := by
      intro z hz
      exact (Finset.mem_filter.mp hz).2
    have hRcard : R.card ≤ 3 := by
      have hleFilter : R.card ≤ ({x, opp2LeftHit} : Finset ℝ²).card :=
        Finset.card_filter_le _ _
      have hlePair : ({x, opp2LeftHit} : Finset ℝ²).card ≤ 2 :=
        Finset.card_le_two
      omega
    rcases EndpointCertificate.exists_surplusInterior_triple_covering
        hM44 hRsub hRcard with
      ⟨t1, t2, t3, hRtrip, ht12, ht13, ht23, htSub⟩
    have hxR : x ∈ R := by
      simp [R, hxSurplusInterior]
    have hxTripleT : x ∈ ({t1, t2, t3} : Finset ℝ²) := hRtrip hxR
    have hopp2LeftAltT :
        opp2LeftHit = S.oppositeVertexByIndex S.oppIndex1 ∨
          opp2LeftHit ∈ ({t1, t2, t3} : Finset ℝ²) := by
      by_cases houter :
          opp2LeftHit = S.oppositeVertexByIndex S.oppIndex1
      · exact Or.inl houter
      · have hleftI :
            opp2LeftHit ∈ S.capInteriorByIndex S.surplusIdx := by
          have hraw :=
            S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
              S.oppIndex2 hopp2RadiusPos hopp2LeftT hopp2LeftCap
              (by
                intro h
                exact houter (by
                  simpa [
                    S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
                    using h))
          simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
            using hraw
        have hleftR : opp2LeftHit ∈ R := by
          simp [R, hleftI]
        exact Or.inr (hRtrip hleftR)
    have hTcard : ({t1, t2, t3} : Finset ℝ²).card = 3 := by
      simp [ht12, ht13, ht23]
    have produceRight :
        ∀ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
          p₁ ≠ p₂ → S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) →
          q₁ ≠ q₂ → S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) →
          s1 ≠ s2 → s1 ≠ s3 → s2 ≠ s3 →
          ({s1, s2, s3} : Finset ℝ²) ⊆
            S.capInteriorByIndex S.surplusIdx →
          p₁ ∈ S.capInteriorByIndex S.oppIndex1 →
          p₂ ∈ S.capInteriorByIndex S.oppIndex1 →
          q₁ ∈ S.capInteriorByIndex S.oppIndex2 →
          q₂ ∈ S.capInteriorByIndex S.oppIndex2 →
          s1 ∈ S.capInteriorByIndex S.surplusIdx →
          s2 ∈ S.capInteriorByIndex S.surplusIdx →
          s3 ∈ S.capInteriorByIndex S.surplusIdx →
          x ∈ ({s1, s2, s3} : Finset ℝ²) →
          (opp2LeftHit = S.oppositeVertexByIndex S.oppIndex1 ∨
            opp2LeftHit ∈ ({s1, s2, s3} : Finset ℝ²)) →
          (∀ {centerClass : Label → Finset ℝ²}
              {radiusOf : Label → ℝ},
            Function.Injective
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) →
            (∀ center : Label,
              centerClass center =
                SelectedClass A
                  (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 center)
                  (radiusOf center)) →
            ∀ c cp : Label, (c, cp) ∈ orderedLabelPairs →
              crossSeparationOKForMasks c
                  (pointMask
                    (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                    (centerClass c))
                  cp
                  (pointMask
                    (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                    (centerClass cp)) = true) →
          RightPinnedSurplusMetricShadowData S radius x := by
      intro p₁ p₂ q₁ q₂ s1 s2 s3 hp12 hpairP hq12 hqpair
        hs12 hs13 hs23 hsSub hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I
        hxTriple hopp2LeftAlt hsearchSepOfSelected
      let pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      have hinj : Function.Injective pointOf :=
        rightPinnedLabelPoint_injective_of_mem S
          hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13
          hs23
      have hpointA : ∀ center : Label, pointOf center ∈ A :=
        rightPinnedLabelPoint_mem_of_mem S
          hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I
      rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
          S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
        ⟨sstar, hsstar, hsstar_eq⟩
      let radiusChoice : Label → ℝ := fun center =>
        Classical.choose
          (exists_selectedClass_card_ge_four_of_hasNEquidistantProperty
            hK4 (hpointA center))
      let radiusOf : Label → ℝ := fun center =>
        if center = .v then radius else
          if center = .w then opp2Radius else radiusChoice center
      let centerClass : Label → Finset ℝ² := fun center =>
        SelectedClass A (pointOf center) (radiusOf center)
      have hmetric :
          EndpointCertificate.Variables.EndpointMetricShadow pointOf
            (shadowOfPointClasses pointOf centerClass) :=
        endpointMetricShadow_shadowOfPointClasses_of_selectedClasses hinj
          (by intro center; rfl)
      have hselected : ∀ center : Label,
          centerClass center =
            SelectedClass A (pointOf center) (radiusOf center) := by
        intro center
        rfl
      have hclassCardGe : ∀ center : Label, center ≠ .v → center ≠ .w →
          4 ≤ (centerClass center).card := by
        intro center hcenter hwcenter
        have hchoice :=
          Classical.choose_spec
            (exists_selectedClass_card_ge_four_of_hasNEquidistantProperty
              hK4 (hpointA center))
        simpa [centerClass, radiusOf, radiusChoice, hcenter, hwcenter]
          using hchoice.2
      have hno3 :
          noThreeOK (shadowOfPointClasses pointOf centerClass) = true :=
        noThreeOK_shadowOfPointClasses_of_selectedClasses hconv hinj hpointA
          hselected
      have hcounts :
          PrefixPairCountsOK (shadowOfPointClasses pointOf centerClass) :=
        prefixPairCountsOK_shadowOfPointClasses_of_selectedClasses hconv hinj
          hpointA hselected
      have hWclassGeom :
          SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) opp2Radius =
            ({q₁, q₂, opp2LeftHit, opp2RightHit} : Finset ℝ²) := by
        have hqpairCap :
            S.capInteriorByIndex S.oppIndex2 =
              ({q₁, q₂} : Finset ℝ²) := by
          simpa [SurplusCapPacket.oppInterior2] using hqpair
        exact selectedClass_eq_pair_left_right_singletons
          S S.oppIndex2 hopp2RadiusPos hqpairCap hopp2InteriorSub
          hopp2LeftSingleton hopp2RightSingleton
      have hleftLabel :
          ∃ leftLabel : Label,
            (leftLabel = .v ∨ leftLabel = .s1 ∨ leftLabel = .s2 ∨
              leftLabel = .s3) ∧
              pointOf leftLabel = opp2LeftHit := by
        rcases hopp2LeftAlt with houter | htriple
        · exact ⟨.v, Or.inl rfl, by
            simp [pointOf, rightPinnedLabelPoint, houter]⟩
        · rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
            S p₁ p₂ q₁ q₂ s1 s2 s3 htriple with
            ⟨leftLabel, hleftStar, hleftEq⟩
          exact ⟨leftLabel,
            Or.inr (surplusStar_eq_s1_or_s2_or_s3 hleftStar), by
              simpa [pointOf] using hleftEq⟩
      have hrightLabel :
          ∃ rightLabel : Label,
            (rightLabel = .u ∨ rightLabel = .Pw ∨ rightLabel = .Pu) ∧
              pointOf rightLabel = opp2RightHit := by
        by_cases houter :
            opp2RightHit = S.oppositeVertexByIndex S.surplusIdx
        · exact ⟨.u, Or.inl rfl, by
            simp [pointOf, rightPinnedLabelPoint, houter]⟩
        · have hrightI :
              opp2RightHit ∈ S.oppInterior1 := by
            have hraw :=
              S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
                S.oppIndex2 hopp2RadiusPos hopp2RightT hopp2RightCap
                (by
                  intro h
                  exact houter (by
                    simpa [
                      S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx]
                      using h))
            simpa [S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1]
              using hraw
          have hpairMem : opp2RightHit ∈ ({p₁, p₂} : Finset ℝ²) := by
            simpa [hpairP] using hrightI
          simp only [Finset.mem_insert, Finset.mem_singleton] at hpairMem
          rcases hpairMem with hrightEq | hrightEq
          · exact ⟨.Pw, Or.inr (Or.inl rfl), by
              simp [pointOf, rightPinnedLabelPoint, hrightEq]⟩
          · exact ⟨.Pu, Or.inr (Or.inr rfl), by
              simp [pointOf, rightPinnedLabelPoint, hrightEq]⟩
      rcases hleftLabel with ⟨leftLabel, hleftCases, hleftPoint⟩
      rcases hrightLabel with ⟨rightLabel, hrightCases, hrightPoint⟩
      have hWcenterClass :
          centerClass .w =
            ({pointOf .Q1, pointOf .Q2, pointOf leftLabel,
              pointOf rightLabel} : Finset ℝ²) := by
        simpa [centerClass, radiusOf, pointOf, rightPinnedLabelPoint,
          hleftPoint, hrightPoint] using hWclassGeom
      have hWcandidate :
          pointMask pointOf (centerClass .w) ∈ candidateMasks sstar .w :=
        wSelectorClass_mem_candidateMasks hinj hsstar hleftCases hrightCases
          hWcenterClass
      have hcandidate : ∀ center : Label,
          pointMask pointOf (centerClass center) ∈
            candidateMasks sstar center := by
        intro center
        by_cases hv : center = .v
        · subst center
          exact mem_candidateMasks_v_of_pointMask_eq_pinnedMaskOf hsstar (by
            dsimp [centerClass, radiusOf, pointOf]
            simpa [rightPinnedLabelPoint] using
              pinnedRightSurplusResidual_pointMask_eq_pinnedMaskOf_of_pair
                S hpinned hxSurplus hinj hpairP hsstar hsstar_eq)
        · by_cases hw : center = .w
          · subst center
            exact hWcandidate
          · have hself :
                maskHas (pointMask pointOf (centerClass center))
                    center = false :=
              pointMask_maskHas_self_false_of_selectedClass_card_ge_four
                (pointOf := pointOf) (centerClass := centerClass)
                (radiusOf := radiusOf) (center := center)
                (hselected center) (hclassCardGe center hv hw)
            exact
              mem_candidateMasks_of_candidateMaskOK hsstar
                (candidateMaskOK_of_nonVWCandidateMaskOK_pointMask
                  hv hw hself
                  (hnonVShape.1 hpinned p₁ p₂ q₁ q₂ s1 s2 s3 hp12
                    hpairP hq12 hqpair hs12 hs13 hs23 hsSub hp₁I hp₂I
                    hq₁I hq₂I hs1I hs2I hs3I hxTriple
                    (centerClass := centerClass) (radiusOf := radiusOf)
                    (sstar := sstar) hsstar hsstar_eq hselected
                    hclassCardGe center hv hw))
      have hsearchSep : ∀ c cp : Label, (c, cp) ∈ orderedLabelPairs →
          crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
            (pointMask pointOf (centerClass cp)) = true := by
        intro c cp hpair
        exact hsearchSepOfSelected hinj hselected c cp hpair
      have hsep : ∀ c cp a b : Label, (c, cp) ∈ labelPairs →
          (a, b) ∈ labelPairs →
            sepOKFor (shadowOfPointClasses pointOf centerClass) c cp a b =
              true := by
        intro c cp a b hcenterPair hab
        exact sepOKFor_of_crossSeparationOKForMasks
          (hsearchSep c cp (labelPairs_mem_orderedLabelPairs hcenterPair)) hab
      have hvalid :
          isValidPinnedFragment sstar
            (shadowOfPointClasses pointOf centerClass) = true := by
        exact isValidPinnedFragment_shadowOfPointClasses_of_candidate_lists
          hsstar hcandidate hno3 hcounts hsep hsearchSep
      refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar, ?_, ?_⟩
      · simpa [pointOf] using hvalid
      · simpa [pointOf] using hmetric
    rcases hapexOrder with hrightOrder | hleftOrder
    · rcases hrightOrder with ⟨h0v, hvw⟩
      rcases exists_rightPinnedHullOrderLabels_of_apex_order
          (A := A) (S := S) (x := x)
          (T := ({t1, t2, t3} : Finset ℝ²)) (n := n) (φ := φ)
          (iv := iv) (iw := iw) hn hφinj hφimage hccwBoundary hu hv hw
          h0v hvw hM44 hxTripleT hTcard htSub with
        ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpairP, hq12, hqpair,
          hTeq, hxTriple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I,
          hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
      have hopp2LeftAlt :
          opp2LeftHit = S.oppositeVertexByIndex S.oppIndex1 ∨
            opp2LeftHit ∈ ({s1, s2, s3} : Finset ℝ²) := by
        rcases hopp2LeftAltT with houter | htrip
        · exact Or.inl houter
        · exact Or.inr (by simpa [hTeq] using htrip)
      exact produceRight p₁ p₂ q₁ q₂ s1 s2 s3 hp12 hpairP hq12 hqpair
        hs12 hs13 hs23 hsSub hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I
        hxTriple hopp2LeftAlt (by
          intro centerClass radiusOf hinj hselected c cp hpair
          exact crossSeparationOKForMasks_of_selectedClasses_ccwHull
            (A := A)
            (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass := centerClass) (radiusOf := radiusOf)
            (isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder)
            hinj hselected c cp hpair)
    · rcases hleftOrder with ⟨h0w, hwv⟩
      rcases exists_leftPinnedHullOrderLabels_of_apex_order
          (A := A) (S := S) (x := x)
          (T := ({t1, t2, t3} : Finset ℝ²)) (n := n) (φ := φ)
          (iv := iv) (iw := iw) hn hφinj hφimage hccwBoundary hu hv hw
          h0w hwv hM44 hxTripleT hTcard htSub with
        ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpairP, hq12, hqpair,
          hTeq, hxTriple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I,
          hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
      have hpairP_rev :
          S.oppInterior1 = ({p₂, p₁} : Finset ℝ²) := by
        rw [hpairP]
        ext z
        simp [or_comm]
      have hqpair_rev :
          S.oppInterior2 = ({q₂, q₁} : Finset ℝ²) := by
        rw [hqpair]
        ext z
        simp [or_comm]
      have hsSub_rev :
          ({s3, s2, s1} : Finset ℝ²) ⊆
            S.capInteriorByIndex S.surplusIdx := by
        intro z hz
        exact hsSub (by
          simpa [or_comm, or_left_comm, or_assoc] using hz)
      have hxTriple_rev : x ∈ ({s3, s2, s1} : Finset ℝ²) := by
        simpa [or_comm, or_left_comm, or_assoc] using hxTriple
      have hopp2LeftAltT_rev :
          opp2LeftHit = S.oppositeVertexByIndex S.oppIndex1 ∨
            opp2LeftHit ∈ ({s3, s2, s1} : Finset ℝ²) := by
        rcases hopp2LeftAltT with houter | htrip
        · exact Or.inl houter
        · have htrip' : opp2LeftHit ∈ ({s1, s2, s3} : Finset ℝ²) := by
            simpa [hTeq] using htrip
          exact Or.inr (by
            simpa [or_comm, or_left_comm, or_assoc] using htrip')
      have hccwReflected :
          EuclideanGeometry.IsCcwConvexPolygon
            (fun i : Fin 10 =>
              rightPinnedLabelPoint S p₂ p₁ q₂ q₁ s3 s2 s1
                (reflectedHullLabel (labelOfHullFin i))) := by
        have hccwLeft :
            EuclideanGeometry.IsCcwConvexPolygon
              (fun i : Fin 10 =>
                leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3
                  (labelOfHullFin i)) :=
          isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder
        convert hccwLeft using 2
        rename_i i
        fin_cases i <;> rfl
      exact produceRight p₂ p₁ q₂ q₁ s3 s2 s1 hp12.symm hpairP_rev
        hq12.symm hqpair_rev hs23.symm hs13.symm hs12.symm hsSub_rev
        hp₂I hp₁I hq₂I hq₁I hs3I hs2I hs1I hxTriple_rev
        hopp2LeftAltT_rev (by
          intro centerClass radiusOf hinj hselected c cp hpair
          exact crossSeparationOKForMasks_of_selectedClasses_reflectedCcwHull
            (A := A)
            (pointOf := rightPinnedLabelPoint S p₂ p₁ q₂ q₁ s3 s2 s1)
            (centerClass := centerClass) (radiusOf := radiusOf)
            hccwReflected hinj hselected c cp hpair)
  · intro radius x hpinned
    classical
    have hxSurplus := S.pinnedLeftSurplusResidual_mem_left_surplus hpinned
    have hxSurplusInterior :
        x ∈ S.capInteriorByIndex S.surplusIdx :=
      S.mem_surplusInterior_of_oppIndex2_left_surplus
        (S.pinnedLeftSurplusResidual_radius_pos hpinned)
        (S.pinnedLeftSurplusResidual_mem_selectedClass hpinned)
        hxSurplus
    have hopp1LeftT :
        opp1LeftHit ∈
          SelectedClass A (S.oppositeVertexByIndex S.oppIndex1)
            opp1Radius := by
      have hmem :
          opp1LeftHit ∈
            SelectedClass A (S.oppositeVertexByIndex S.oppIndex1)
                opp1Radius ∩
              S.leftAdjacentCapByIndex S.oppIndex1 := by
        rw [hopp1LeftSingleton]
        simp
      exact (Finset.mem_inter.mp hmem).1
    have hopp1RightT :
        opp1RightHit ∈
          SelectedClass A (S.oppositeVertexByIndex S.oppIndex1)
            opp1Radius := by
      have hmem :
          opp1RightHit ∈
            SelectedClass A (S.oppositeVertexByIndex S.oppIndex1)
                opp1Radius ∩
              S.rightAdjacentCapByIndex S.oppIndex1 := by
        rw [hopp1RightSingleton]
        simp
      exact (Finset.mem_inter.mp hmem).1
    let R : Finset ℝ² :=
      ({x, opp1RightHit} : Finset ℝ²).filter
        (fun z => z ∈ S.capInteriorByIndex S.surplusIdx)
    have hRsub : R ⊆ S.capInteriorByIndex S.surplusIdx := by
      intro z hz
      exact (Finset.mem_filter.mp hz).2
    have hRcard : R.card ≤ 3 := by
      have hleFilter : R.card ≤ ({x, opp1RightHit} : Finset ℝ²).card :=
        Finset.card_filter_le _ _
      have hlePair : ({x, opp1RightHit} : Finset ℝ²).card ≤ 2 :=
        Finset.card_le_two
      omega
    rcases EndpointCertificate.exists_surplusInterior_triple_covering
        hM44 hRsub hRcard with
      ⟨t1, t2, t3, hRtrip, ht12, ht13, ht23, htSub⟩
    have hxR : x ∈ R := by
      simp [R, hxSurplusInterior]
    have hxTripleT : x ∈ ({t1, t2, t3} : Finset ℝ²) := hRtrip hxR
    have hopp1RightAltT :
        opp1RightHit = S.oppositeVertexByIndex S.oppIndex2 ∨
          opp1RightHit ∈ ({t1, t2, t3} : Finset ℝ²) := by
      by_cases houter :
          opp1RightHit = S.oppositeVertexByIndex S.oppIndex2
      · exact Or.inl houter
      · have hrightI :
            opp1RightHit ∈ S.capInteriorByIndex S.surplusIdx := by
          have hraw :=
            S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
              S.oppIndex1 hopp1RadiusPos hopp1RightT hopp1RightCap
              (by
                intro h
                exact houter (by
                  simpa [
                    S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
                    using h))
          simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
            using hraw
        have hrightR : opp1RightHit ∈ R := by
          simp [R, hrightI]
        exact Or.inr (hRtrip hrightR)
    have hTcard : ({t1, t2, t3} : Finset ℝ²).card = 3 := by
      simp [ht12, ht13, ht23]
    have produceLeft :
        ∀ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
          p₁ ≠ p₂ → S.oppInterior2 = ({p₁, p₂} : Finset ℝ²) →
          q₁ ≠ q₂ → S.oppInterior1 = ({q₁, q₂} : Finset ℝ²) →
          s1 ≠ s2 → s1 ≠ s3 → s2 ≠ s3 →
          ({s1, s2, s3} : Finset ℝ²) ⊆
            S.capInteriorByIndex S.surplusIdx →
          p₁ ∈ S.capInteriorByIndex S.oppIndex2 →
          p₂ ∈ S.capInteriorByIndex S.oppIndex2 →
          q₁ ∈ S.capInteriorByIndex S.oppIndex1 →
          q₂ ∈ S.capInteriorByIndex S.oppIndex1 →
          s1 ∈ S.capInteriorByIndex S.surplusIdx →
          s2 ∈ S.capInteriorByIndex S.surplusIdx →
          s3 ∈ S.capInteriorByIndex S.surplusIdx →
          x ∈ ({s1, s2, s3} : Finset ℝ²) →
          (opp1RightHit = S.oppositeVertexByIndex S.oppIndex2 ∨
            opp1RightHit ∈ ({s1, s2, s3} : Finset ℝ²)) →
          (∀ {centerClass : Label → Finset ℝ²}
              {radiusOf : Label → ℝ},
            Function.Injective
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) →
            (∀ center : Label,
              centerClass center =
                SelectedClass A
                  (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 center)
                  (radiusOf center)) →
            ∀ c cp : Label, (c, cp) ∈ orderedLabelPairs →
              crossSeparationOKForMasks c
                  (pointMask
                    (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                    (centerClass c))
                  cp
                  (pointMask
                    (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                    (centerClass cp)) = true) →
          LeftPinnedSurplusMetricShadowData S radius x := by
      intro p₁ p₂ q₁ q₂ s1 s2 s3 hp12 hpairP hq12 hqpair
        hs12 hs13 hs23 hsSub hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I
        hxTriple hopp1RightAlt hsearchSepOfSelected
      let pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      have hinj : Function.Injective pointOf :=
        leftPinnedLabelPoint_injective_of_mem S
          hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13
          hs23
      have hpointA : ∀ center : Label, pointOf center ∈ A :=
        leftPinnedLabelPoint_mem_of_mem S
          hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I
      rcases exists_surplusStar_leftPinnedLabelPoint_eq_of_mem_triple
          S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
        ⟨sstar, hsstar, hsstar_eq⟩
      let radiusChoice : Label → ℝ := fun center =>
        Classical.choose
          (exists_selectedClass_card_ge_four_of_hasNEquidistantProperty
            hK4 (hpointA center))
      let radiusOf : Label → ℝ := fun center =>
        if center = .v then radius else
          if center = .w then opp1Radius else radiusChoice center
      let centerClass : Label → Finset ℝ² := fun center =>
        SelectedClass A (pointOf center) (radiusOf center)
      have hmetric :
          EndpointCertificate.Variables.EndpointMetricShadow pointOf
            (shadowOfPointClasses pointOf centerClass) :=
        endpointMetricShadow_shadowOfPointClasses_of_selectedClasses hinj
          (by intro center; rfl)
      have hselected : ∀ center : Label,
          centerClass center =
            SelectedClass A (pointOf center) (radiusOf center) := by
        intro center
        rfl
      have hclassCardGe : ∀ center : Label, center ≠ .v → center ≠ .w →
          4 ≤ (centerClass center).card := by
        intro center hcenter hwcenter
        have hchoice :=
          Classical.choose_spec
            (exists_selectedClass_card_ge_four_of_hasNEquidistantProperty
              hK4 (hpointA center))
        simpa [centerClass, radiusOf, radiusChoice, hcenter, hwcenter]
          using hchoice.2
      have hno3 :
          noThreeOK (shadowOfPointClasses pointOf centerClass) = true :=
        noThreeOK_shadowOfPointClasses_of_selectedClasses hconv hinj hpointA
          hselected
      have hcounts :
          PrefixPairCountsOK (shadowOfPointClasses pointOf centerClass) :=
        prefixPairCountsOK_shadowOfPointClasses_of_selectedClasses hconv hinj
          hpointA hselected
      have hWclassGeom :
          SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) opp1Radius =
            ({q₁, q₂, opp1LeftHit, opp1RightHit} : Finset ℝ²) := by
        have hqpairCap :
            S.capInteriorByIndex S.oppIndex1 =
              ({q₁, q₂} : Finset ℝ²) := by
          simpa [SurplusCapPacket.oppInterior1] using hqpair
        exact selectedClass_eq_pair_left_right_singletons
          S S.oppIndex1 hopp1RadiusPos hqpairCap hopp1InteriorSub
          hopp1LeftSingleton hopp1RightSingleton
      have hWclassGeomSwap :
          SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) opp1Radius =
            ({q₁, q₂, opp1RightHit, opp1LeftHit} : Finset ℝ²) := by
        rw [hWclassGeom]
        ext z
        simp only [Finset.mem_insert, Finset.mem_singleton]
        constructor
        · intro hz
          rcases hz with hz | hz | hz | hz
          · exact Or.inl hz
          · exact Or.inr (Or.inl hz)
          · exact Or.inr (Or.inr (Or.inr hz))
          · exact Or.inr (Or.inr (Or.inl hz))
        · intro hz
          rcases hz with hz | hz | hz | hz
          · exact Or.inl hz
          · exact Or.inr (Or.inl hz)
          · exact Or.inr (Or.inr (Or.inr hz))
          · exact Or.inr (Or.inr (Or.inl hz))
      have hleftLabel :
          ∃ leftLabel : Label,
            (leftLabel = .v ∨ leftLabel = .s1 ∨ leftLabel = .s2 ∨
              leftLabel = .s3) ∧
              pointOf leftLabel = opp1RightHit := by
        rcases hopp1RightAlt with houter | htriple
        · exact ⟨.v, Or.inl rfl, by
            simp [pointOf, leftPinnedLabelPoint, rightPinnedLabelPoint,
              leftPinnedToRightLabel, houter]⟩
        · rcases exists_surplusStar_leftPinnedLabelPoint_eq_of_mem_triple
            S p₁ p₂ q₁ q₂ s1 s2 s3 htriple with
            ⟨leftLabel, hleftStar, hleftEq⟩
          exact ⟨leftLabel,
            Or.inr (surplusStar_eq_s1_or_s2_or_s3 hleftStar), by
              simpa [pointOf] using hleftEq⟩
      have hrightLabel :
          ∃ rightLabel : Label,
            (rightLabel = .u ∨ rightLabel = .Pw ∨ rightLabel = .Pu) ∧
              pointOf rightLabel = opp1LeftHit := by
        by_cases houter :
            opp1LeftHit = S.oppositeVertexByIndex S.surplusIdx
        · exact ⟨.u, Or.inl rfl, by
            simp [pointOf, leftPinnedLabelPoint, rightPinnedLabelPoint,
              leftPinnedToRightLabel, houter]⟩
        · have hleftI :
              opp1LeftHit ∈ S.oppInterior2 := by
            have hraw :=
              S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
                S.oppIndex1 hopp1RadiusPos hopp1LeftT hopp1LeftCap
                (by
                  intro h
                  exact houter (by
                    simpa [
                      S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx]
                      using h))
            simpa [S.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2]
              using hraw
          have hpairMem : opp1LeftHit ∈ ({p₁, p₂} : Finset ℝ²) := by
            simpa [hpairP] using hleftI
          simp only [Finset.mem_insert, Finset.mem_singleton] at hpairMem
          rcases hpairMem with hrightEq | hrightEq
          · exact ⟨.Pw, Or.inr (Or.inl rfl), by
              simp [pointOf, leftPinnedLabelPoint, rightPinnedLabelPoint,
                leftPinnedToRightLabel, hrightEq]⟩
          · exact ⟨.Pu, Or.inr (Or.inr rfl), by
              simp [pointOf, leftPinnedLabelPoint, rightPinnedLabelPoint,
                leftPinnedToRightLabel, hrightEq]⟩
      rcases hleftLabel with ⟨leftLabel, hleftCases, hleftPoint⟩
      rcases hrightLabel with ⟨rightLabel, hrightCases, hrightPoint⟩
      have hWcenterClass :
          centerClass .w =
            ({pointOf .Q1, pointOf .Q2, pointOf leftLabel,
              pointOf rightLabel} : Finset ℝ²) := by
        simpa [centerClass, radiusOf, pointOf, leftPinnedLabelPoint,
          rightPinnedLabelPoint, leftPinnedToRightLabel, hleftPoint,
          hrightPoint] using hWclassGeomSwap
      have hWcandidate :
          pointMask pointOf (centerClass .w) ∈ candidateMasks sstar .w :=
        wSelectorClass_mem_candidateMasks hinj hsstar hleftCases hrightCases
          hWcenterClass
      have hcandidate : ∀ center : Label,
          pointMask pointOf (centerClass center) ∈
            candidateMasks sstar center := by
        intro center
        by_cases hv : center = .v
        · subst center
          exact mem_candidateMasks_v_of_pointMask_eq_pinnedMaskOf hsstar (by
            dsimp [centerClass, radiusOf, pointOf]
            simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
              leftPinnedToRightLabel] using
              pinnedLeftSurplusResidual_pointMask_eq_pinnedMaskOf_of_pair
                S hpinned hxSurplus hinj hpairP hsstar hsstar_eq)
        · by_cases hw : center = .w
          · subst center
            exact hWcandidate
          · have hself :
                maskHas (pointMask pointOf (centerClass center))
                    center = false :=
              pointMask_maskHas_self_false_of_selectedClass_card_ge_four
                (pointOf := pointOf) (centerClass := centerClass)
                (radiusOf := radiusOf) (center := center)
                (hselected center) (hclassCardGe center hv hw)
            exact
              mem_candidateMasks_of_candidateMaskOK hsstar
                (candidateMaskOK_of_nonVWCandidateMaskOK_pointMask
                  hv hw hself
                  (hnonVShape.2 hpinned p₁ p₂ q₁ q₂ s1 s2 s3 hp12
                    hpairP hq12 hqpair hs12 hs13 hs23 hsSub hp₁I hp₂I
                    hq₁I hq₂I hs1I hs2I hs3I hxTriple
                    (centerClass := centerClass) (radiusOf := radiusOf)
                    (sstar := sstar) hsstar hsstar_eq hselected
                    hclassCardGe center hv hw))
      have hsearchSep : ∀ c cp : Label, (c, cp) ∈ orderedLabelPairs →
          crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
            (pointMask pointOf (centerClass cp)) = true := by
        intro c cp hpair
        exact hsearchSepOfSelected hinj hselected c cp hpair
      have hsep : ∀ c cp a b : Label, (c, cp) ∈ labelPairs →
          (a, b) ∈ labelPairs →
            sepOKFor (shadowOfPointClasses pointOf centerClass) c cp a b =
              true := by
        intro c cp a b hcenterPair hab
        exact sepOKFor_of_crossSeparationOKForMasks
          (hsearchSep c cp (labelPairs_mem_orderedLabelPairs hcenterPair)) hab
      have hvalid :
          isValidPinnedFragment sstar
            (shadowOfPointClasses pointOf centerClass) = true := by
        exact isValidPinnedFragment_shadowOfPointClasses_of_candidate_lists
          hsstar hcandidate hno3 hcounts hsep hsearchSep
      refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar, ?_, ?_⟩
      · simpa [pointOf] using hvalid
      · simpa [pointOf] using hmetric
    rcases hapexOrder with hrightOrder | hleftOrder
    · rcases hrightOrder with ⟨h0v, hvw⟩
      rcases exists_rightPinnedHullOrderLabels_of_apex_order
          (A := A) (S := S) (x := x)
          (T := ({t1, t2, t3} : Finset ℝ²)) (n := n) (φ := φ)
          (iv := iv) (iw := iw) hn hφinj hφimage hccwBoundary hu hv hw
          h0v hvw hM44 hxTripleT hTcard htSub with
        ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpairP, hq12, hqpair,
          hTeq, hxTriple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I,
          hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
      have hpairP_rev :
          S.oppInterior1 = ({p₂, p₁} : Finset ℝ²) := by
        rw [hpairP]
        ext z
        simp [or_comm]
      have hqpair_rev :
          S.oppInterior2 = ({q₂, q₁} : Finset ℝ²) := by
        rw [hqpair]
        ext z
        simp [or_comm]
      have hsSub_rev :
          ({s3, s2, s1} : Finset ℝ²) ⊆
            S.capInteriorByIndex S.surplusIdx := by
        intro z hz
        exact hsSub (by
          simpa [or_comm, or_left_comm, or_assoc] using hz)
      have hxTriple_rev : x ∈ ({s3, s2, s1} : Finset ℝ²) := by
        simpa [or_comm, or_left_comm, or_assoc] using hxTriple
      have hopp1RightAltT_rev :
          opp1RightHit = S.oppositeVertexByIndex S.oppIndex2 ∨
            opp1RightHit ∈ ({s3, s2, s1} : Finset ℝ²) := by
        rcases hopp1RightAltT with houter | htrip
        · exact Or.inl houter
        · have htrip' : opp1RightHit ∈ ({s1, s2, s3} : Finset ℝ²) := by
            simpa [hTeq] using htrip
          exact Or.inr (by
            simpa [or_comm, or_left_comm, or_assoc] using htrip')
      have hccwReflected :
          EuclideanGeometry.IsCcwConvexPolygon
            (fun i : Fin 10 =>
              leftPinnedLabelPoint S q₂ q₁ p₂ p₁ s3 s2 s1
                (reflectedHullLabel (labelOfHullFin i))) := by
        have hccwRight :
            EuclideanGeometry.IsCcwConvexPolygon
              (fun i : Fin 10 =>
                rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
                  (labelOfHullFin i)) :=
          isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder
        convert hccwRight using 2
        rename_i i
        fin_cases i <;> rfl
      exact produceLeft q₂ q₁ p₂ p₁ s3 s2 s1 hq12.symm hqpair_rev
        hp12.symm hpairP_rev hs23.symm hs13.symm hs12.symm hsSub_rev
        hq₂I hq₁I hp₂I hp₁I hs3I hs2I hs1I hxTriple_rev
        hopp1RightAltT_rev (by
          intro centerClass radiusOf hinj hselected c cp hpair
          exact crossSeparationOKForMasks_of_selectedClasses_reflectedCcwHull
            (A := A)
            (pointOf := leftPinnedLabelPoint S q₂ q₁ p₂ p₁ s3 s2 s1)
            (centerClass := centerClass) (radiusOf := radiusOf)
            hccwReflected hinj hselected c cp hpair)
    · rcases hleftOrder with ⟨h0w, hwv⟩
      rcases exists_leftPinnedHullOrderLabels_of_apex_order
          (A := A) (S := S) (x := x)
          (T := ({t1, t2, t3} : Finset ℝ²)) (n := n) (φ := φ)
          (iv := iv) (iw := iw) hn hφinj hφimage hccwBoundary hu hv hw
          h0w hwv hM44 hxTripleT hTcard htSub with
        ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpairP, hq12, hqpair,
          hTeq, hxTriple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I,
          hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
      have hopp1RightAlt :
          opp1RightHit = S.oppositeVertexByIndex S.oppIndex2 ∨
            opp1RightHit ∈ ({s1, s2, s3} : Finset ℝ²) := by
        rcases hopp1RightAltT with houter | htrip
        · exact Or.inl houter
        · exact Or.inr (by simpa [hTeq] using htrip)
      exact produceLeft q₁ q₂ p₁ p₂ s1 s2 s3 hq12 hqpair hp12 hpairP
        hs12 hs13 hs23 hsSub hq₁I hq₂I hp₁I hp₂I hs1I hs2I hs3I
        hxTriple hopp1RightAlt (by
          intro centerClass radiusOf hinj hselected c cp hpair
          exact crossSeparationOKForMasks_of_selectedClasses_ccwHull
            (A := A)
            (pointOf := leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3)
            (centerClass := centerClass) (radiusOf := radiusOf)
            (isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder)
            hinj hselected c cp hpair)

end Problem97
