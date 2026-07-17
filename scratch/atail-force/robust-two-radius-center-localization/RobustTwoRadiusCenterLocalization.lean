/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RobustTwoRadiusGeometry
import BiapexContinuationGrid

/-!
# Scratch: cap localization for the fresh robust center in the two-radius transition

This file determines the exact cap/order information available after the
minimal-deletion transition at two support-disjoint physical-second-apex
radii.  It records reductions only; no endpoint is asserted contradictory.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustTwoRadiusCenterLocalizationScratch

open ATAILStageOneMinimalDeletionCore
open ATAILStageOnePrescribedApexDichotomy
open ATailContinuationBankMatchScratch
open ATailGlobalMinimalDeletionCoreScratch
open ATailRobustTwoRadiusGeometryScratch
open ATailRTwoOffLiveHandlerScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem oppApex2_eq_oppositeVertex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

private theorem oppositeVertexByIndex_mem_capByIndex_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3}
    (hij : i ≠ j) :
    S.oppositeVertexByIndex i ∈ S.capByIndex j := by
  fin_cases i <;> fin_cases j
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C2
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C1
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C2
  · exact False.elim (hij rfl)

private theorem false_of_two_cap_centers_equidistant_outside_pair
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (k : Fin 3)
    {c apex a b : ℝ²}
    (hcCap : c ∈ S.capByIndex k)
    (hapexCap : apex ∈ S.capByIndex k)
    (hc_ne_apex : c ≠ apex)
    (haA : a ∈ D.A) (hbA : b ∈ D.A) (hab : a ≠ b)
    (haOff : a ∉ S.capByIndex k) (hbOff : b ∉ S.capByIndex k)
    (hcEq : dist c a = dist c b)
    (hapexEq : dist apex a = dist apex b) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex k with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  have hapexImage : apex ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hapexCap
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hapexImage with ⟨ia, _hia, hia⟩
  have hic_ne_ia : ic ≠ ia := by
    intro h
    apply hc_ne_apex
    calc
      c = L.points ic := hic.symm
      _ = L.points ia := by simp [h]
      _ = apex := hia
  have haOutside : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbOutside : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  rcases lt_or_gt_of_ne hic_ne_ia with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt haA hbA haOutside hbOutside hab
      (by simpa [hic] using hcEq)
      (by simpa [hia] using hapexEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt haA hbA haOutside hbOutside hab
      (by simpa [hia] using hapexEq)
      (by simpa [hic] using hcEq)

/-- If a fresh carrier center and the physical second apex bisect two
distinct points of the strict opposite-cap interior, then the fresh center
lies in that same strict cap interior. -/
theorem commonPhysicalPair_center_mem_secondCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {center source partner : ℝ²}
    (hcenterA : center ∈ D.A)
    (hcenterNe : center ≠ S.oppApex2)
    (hsource : source ∈ S.capInteriorByIndex S.oppIndex2)
    (hpartner : partner ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourcePartner : source ≠ partner)
    (hcenterEq : dist center source = dist center partner)
    (hphysicalEq :
      dist S.oppApex2 source = dist S.oppApex2 partner) :
    center ∈ S.capInteriorByIndex S.oppIndex2 := by
  classical
  have happ := oppApex2_eq_oppositeVertex_oppIndex2 S
  have hsourceClass :
      source ∈ SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex2)
        (dist S.oppApex2 source) := by
    apply mem_selectedClass.mpr
    refine ⟨S.capInteriorByIndex_subset S.oppIndex2 hsource, ?_⟩
    simp [← happ]
  have hpartnerClass :
      partner ∈ SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex2)
        (dist S.oppApex2 source) := by
    apply mem_selectedClass.mpr
    exact ⟨S.capInteriorByIndex_subset S.oppIndex2 hpartner,
      by simpa [← happ] using hphysicalEq.symm⟩
  have hcenter_ne_opp :
      center ≠ S.oppositeVertexByIndex S.oppIndex2 := by
    simpa [← happ] using hcenterNe
  have hcenter_ne_left :
      center ≠ S.leftOuterVertexByIndex S.oppIndex2 := by
    intro hcenter
    have hne := S.capInterior_pair_dist_ne_leftOuter_of_selectedClass
      S.oppIndex2 hsource hpartner hsourcePartner
      hsourceClass hpartnerClass
    apply hne
    simpa [hcenter, dist_comm] using hcenterEq
  have hcenter_ne_right :
      center ≠ S.rightOuterVertexByIndex S.oppIndex2 := by
    intro hcenter
    have hne := S.capInterior_pair_dist_ne_rightOuter_of_selectedClass
      S.oppIndex2 hsource hpartner hsourcePartner
      hsourceClass hpartnerClass
    apply hne
    simpa [hcenter, dist_comm] using hcenterEq
  have hcenter_ne_surplusOpp :
      center ≠ S.oppositeVertexByIndex S.surplusIdx := by
    intro hcenter
    apply hcenter_ne_right
    exact hcenter.trans
      S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx.symm
  have hcenter_ne_opp1 :
      center ≠ S.oppositeVertexByIndex S.oppIndex1 := by
    intro hcenter
    apply hcenter_ne_left
    exact hcenter.trans
      S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1.symm
  have hcenter_not_triangle : center ∉ S.triangle.verts := by
    intro hcenterTriangle
    rcases S.mem_triangle_verts_oppositeVertexByIndex_cases hcenterTriangle with
      hcenter | hcenter | hcenter
    · exact hcenter_ne_surplusOpp hcenter
    · exact hcenter_ne_opp1 hcenter
    · exact hcenter_ne_opp hcenter
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hcenterA with
    hcenterTriangle | ⟨j, hcenterInterior⟩
  · exact False.elim (hcenter_not_triangle hcenterTriangle)
  · have hj : j = S.oppIndex2 := by
      by_contra hji
      have hij : S.oppIndex2 ≠ j := Ne.symm hji
      have hcenterCap : center ∈ S.capByIndex j :=
        S.capInteriorByIndex_subset_capByIndex j hcenterInterior
      have hapexCap :
          S.oppositeVertexByIndex S.oppIndex2 ∈ S.capByIndex j :=
        oppositeVertexByIndex_mem_capByIndex_of_ne S hij
      have hsourceOff : source ∉ S.capByIndex j :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne hsource hij
      have hpartnerOff : partner ∉ S.capByIndex j :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne hpartner hij
      exact false_of_two_cap_centers_equidistant_outside_pair S j
        hcenterCap hapexCap hcenter_ne_opp
        (S.capInteriorByIndex_subset S.oppIndex2 hsource)
        (S.capInteriorByIndex_subset S.oppIndex2 hpartner)
        hsourcePartner hsourceOff hpartnerOff hcenterEq
        (by simpa [← happ] using hphysicalEq)
    simpa [hj] using hcenterInterior

/-- Ordered-cap data showing that the fresh center lies strictly between the
two equal-radius sources in the cap order. -/
structure StrictSecondCapInterval
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (center source partner : ℝ²) where
  m : ℕ
  L : CGN.OrderedCap m
  Packet : CGN.MecCapPacket A L
  Hside : CGN.MinorCapSideHypotheses Packet
  Hord : CGN.StrictCapOrder A L
  centerIndex : Fin m
  sourceIndex : Fin m
  partnerIndex : Fin m
  cap_eq : Finset.univ.image L.points = S.capByIndex S.oppIndex2
  center_eq : L.points centerIndex = center
  source_eq : L.points sourceIndex = source
  partner_eq : L.points partnerIndex = partner
  between :
    (sourceIndex < centerIndex ∧ centerIndex < partnerIndex) ∨
      (partnerIndex < centerIndex ∧ centerIndex < sourceIndex)

/-- Two distinct equal-radius points in the physical opposite cap lie on
opposite sides of their fresh common center. -/
theorem nonempty_strictSecondCapInterval
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {center source partner : ℝ²}
    (hcenter : center ∈ S.capInteriorByIndex S.oppIndex2)
    (hsource : source ∈ S.capInteriorByIndex S.oppIndex2)
    (hpartner : partner ∈ S.capInteriorByIndex S.oppIndex2)
    (hcenterSource : center ≠ source)
    (hcenterPartner : center ≠ partner)
    (hsourcePartner : source ≠ partner)
    (heq : dist center source = dist center partner) :
    Nonempty (StrictSecondCapInterval S center source partner) := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex2 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hcenterImage : center ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hcenter
  have hsourceImage : source ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hsource
  have hpartnerImage : partner ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hpartner
  rcases Finset.mem_image.mp hcenterImage with
    ⟨centerIndex, _hcenterIndex, hcenterEq⟩
  rcases Finset.mem_image.mp hsourceImage with
    ⟨sourceIndex, _hsourceIndex, hsourceEq⟩
  rcases Finset.mem_image.mp hpartnerImage with
    ⟨partnerIndex, _hpartnerIndex, hpartnerEq⟩
  have hcenterSourceIndex : centerIndex ≠ sourceIndex := by
    intro h
    apply hcenterSource
    calc
      center = L.points centerIndex := hcenterEq.symm
      _ = L.points sourceIndex := by rw [h]
      _ = source := hsourceEq
  have hcenterPartnerIndex : centerIndex ≠ partnerIndex := by
    intro h
    apply hcenterPartner
    calc
      center = L.points centerIndex := hcenterEq.symm
      _ = L.points partnerIndex := by rw [h]
      _ = partner := hpartnerEq
  have hsourcePartnerIndex : sourceIndex ≠ partnerIndex := by
    intro h
    apply hsourcePartner
    calc
      source = L.points sourceIndex := hsourceEq.symm
      _ = L.points partnerIndex := by rw [h]
      _ = partner := hpartnerEq
  have hinj := CGN.oneSidedDistanceInjective_of_mecCapPacket Packet Hside Hord
  have heqIndices :
      dist (L.points centerIndex) (L.points sourceIndex) =
        dist (L.points centerIndex) (L.points partnerIndex) := by
    simpa only [hcenterEq, hsourceEq, hpartnerEq] using heq
  have hbetween :
      (sourceIndex < centerIndex ∧ centerIndex < partnerIndex) ∨
        (partnerIndex < centerIndex ∧ centerIndex < sourceIndex) := by
    rcases lt_or_gt_of_ne hcenterSourceIndex with hcenterBefore | hsourceBefore
    · rcases lt_trichotomy partnerIndex centerIndex with
        hpartnerBefore | hpartnerEqIndex | hcenterBeforePartner
      · exact Or.inr ⟨hpartnerBefore, hcenterBefore⟩
      · exact False.elim (hcenterPartnerIndex hpartnerEqIndex.symm)
      · rcases lt_trichotomy partnerIndex sourceIndex with
          hpartnerBeforeSource | hpartnerEqSource | hsourceBeforePartner
        · exact False.elim (hinj.1 hcenterBeforePartner
            hpartnerBeforeSource heqIndices.symm)
        · exact False.elim (hsourcePartnerIndex hpartnerEqSource.symm)
        · exact False.elim (hinj.1 hcenterBefore
            hsourceBeforePartner heqIndices)
    · rcases lt_trichotomy partnerIndex centerIndex with
        hpartnerBefore | hpartnerEqIndex | hcenterBeforePartner
      · rcases lt_trichotomy partnerIndex sourceIndex with
          hpartnerBeforeSource | hpartnerEqSource | hsourceBeforePartner
        · exact False.elim (hinj.2 hpartnerBeforeSource
            hsourceBefore heqIndices.symm)
        · exact False.elim (hsourcePartnerIndex hpartnerEqSource.symm)
        · exact False.elim (hinj.2 hsourceBeforePartner
            hpartnerBefore heqIndices)
      · exact False.elim (hcenterPartnerIndex hpartnerEqIndex.symm)
      · exact Or.inl ⟨hsourceBefore, hcenterBeforePartner⟩
  exact ⟨{
    m := m
    L := L
    Packet := Packet
    Hside := Hside
    Hord := Hord
    centerIndex := centerIndex
    sourceIndex := sourceIndex
    partnerIndex := partnerIndex
    cap_eq := hcap
    center_eq := hcenterEq
    source_eq := hsourceEq
    partner_eq := hpartnerEq
    between := hbetween
  }⟩

/-- Complete geometric location/packing split for a nontrivial core whose
fresh center is known not to be the physical second apex. -/
def FreshSecondApexCorePacking
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (V : Finset ℝ²) (center : ℝ²) : Prop :=
  (∃ k : Fin 3,
      center ∈ S.capInteriorByIndex k ∧
      2 * V.card ≤ (D.A \ S.capByIndex k).card) ∨
    ∃ k : Fin 3,
      S.oppositeVertexByIndex k = center ∧
      S.oppositeVertexByIndex k ≠ S.oppApex2 ∧
      6 ≤ (S.capByIndex k).card

/-- A two-source core at the fresh center has a finite location normal form:
strict-cap complement packing, or a non-physical Moser vertex opposite a cap
of cardinality at least six. -/
theorem MinimalDeletionCore.freshSecondApexCorePacking
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {V : Finset ℝ²} {center : ℝ²}
    (K : MinimalDeletionCore D.A V center)
    (hcenterA : center ∈ D.A)
    (hcenterNe : center ≠ S.oppApex2)
    (hVtwo : 2 ≤ V.card) :
    FreshSecondApexCorePacking S V center := by
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hcenterA with
    htriangle | ⟨k, hcenterInterior⟩
  · rcases S.mem_triangle_verts_oppositeVertexByIndex_cases htriangle with
      hcenter | hcenter | hcenter
    · exact Or.inr ⟨S.surplusIdx, hcenter.symm,
        fun heq ↦ hcenterNe (hcenter.trans heq),
        ATAILStageOneMinimalDeletionCore.MinimalDeletionCore.capByIndex_card_ge_six
          D S K S.surplusIdx hcenter.symm hVtwo⟩
    · exact Or.inr ⟨S.oppIndex1, hcenter.symm,
        fun heq ↦ hcenterNe (hcenter.trans heq),
        ATAILStageOneMinimalDeletionCore.MinimalDeletionCore.capByIndex_card_ge_six
          D S K S.oppIndex1 hcenter.symm hVtwo⟩
    · exact Or.inr ⟨S.oppIndex2, hcenter.symm,
        fun heq ↦ hcenterNe (hcenter.trans heq),
        ATAILStageOneMinimalDeletionCore.MinimalDeletionCore.capByIndex_card_ge_six
          D S K S.oppIndex2 hcenter.symm hVtwo⟩
  · have hcenterCap : center ∈ S.capByIndex k :=
      S.capInteriorByIndex_subset_capByIndex k hcenterInterior
    exact Or.inl ⟨k, hcenterInterior,
      Problem97.ATailGlobalMinimalDeletionCoreScratch.MinimalDeletionCore.two_mul_card_le_capByIndex_complement
        D S K k hcenterCap⟩

private theorem secondApexRow_strictInterior_card_ge_two
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (K : SelectedFourClass D.A S.oppApex2) :
    2 ≤ (K.support ∩ S.capInteriorByIndex S.oppIndex2).card := by
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have h :=
    Problem97.BiapexContinuationGridScratch.secondApex_support_strictInterior_card_ge_two
      DS K
  let strictSecondCap :=
    S.oppCap2 \ (S.surplusCap ∪ S.oppCap1)
  have hstrict :
      2 ≤ (K.support ∩ strictSecondCap).card := by
    simpa [DS, strictSecondCap] using h
  apply hstrict.trans (Finset.card_le_card ?_)
  intro x hx
  rcases Finset.mem_inter.mp hx with ⟨hxRow, hxStrict⟩
  apply Finset.mem_inter.mpr
  refine ⟨hxRow, ?_⟩
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simp only [strictSecondCap, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1, hi,
      Finset.mem_sdiff, Finset.mem_union] at hxStrict
    simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.oppIndex2, hi, Finset.mem_erase]
    exact ⟨fun hxv2 ↦ hxStrict.2 (Or.inl (hxv2 ▸ S.partition.v2_mem_C1)),
      fun hxv1 ↦ hxStrict.2 (Or.inr (hxv1 ▸ S.partition.v1_mem_C2)),
      hxStrict.1⟩
  · simp only [strictSecondCap, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1, hi,
      Finset.mem_sdiff, Finset.mem_union] at hxStrict
    simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.oppIndex2, hi, Finset.mem_erase]
    exact ⟨fun hxv3 ↦ hxStrict.2 (Or.inl (hxv3 ▸ S.partition.v3_mem_C2)),
      fun hxv2 ↦ hxStrict.2 (Or.inr (hxv2 ▸ S.partition.v2_mem_C3)),
      hxStrict.1⟩
  · simp only [strictSecondCap, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1, hi,
      Finset.mem_sdiff, Finset.mem_union] at hxStrict
    simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.oppIndex2, hi, Finset.mem_erase]
    exact ⟨fun hxv1 ↦ hxStrict.2 (Or.inl (hxv1 ▸ S.partition.v1_mem_C3)),
      fun hxv3 ↦ hxStrict.2 (Or.inr (hxv3 ▸ S.partition.v3_mem_C1)),
      hxStrict.1⟩

private theorem selectedFourClass_survives_sdiff_of_disjoint
    {D : CounterexampleData} {center : ℝ²}
    (K L : SelectedFourClass D.A center)
    {V : Finset ℝ²}
    (hVsub : V ⊆ K.support)
    (hdisjoint : Disjoint K.support L.support) :
    HasNEquidistantPointsAt 4 (D.A \ V) center := by
  refine ⟨L.radius, L.radius_pos, ?_⟩
  calc
    4 = L.support.card := L.support_card.symm
    _ ≤ ((D.A \ V).filter fun x ↦ dist center x = L.radius).card := by
      apply Finset.card_le_card
      intro x hxL
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_sdiff.mpr ⟨L.support_subset_A hxL, ?_⟩,
        L.support_eq_radius x hxL⟩
      intro hxV
      exact Finset.disjoint_left.mp hdisjoint (hVsub hxV) hxL

private theorem fullyDeletionRobustAt_of_nontrivial_minimalDeletionCore
    {D : CounterexampleData} {V : Finset ℝ²} {center : ℝ²}
    (K : MinimalDeletionCore D.A V center)
    (hVtwo : 2 ≤ V.card) :
    FullyDeletionRobustAt D center := by
  have hone : 1 < V.card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨s, hsV, t, htV, hst⟩
  let s' : {x : ℝ² // x ∈ V} := ⟨s, hsV⟩
  let t' : {x : ℝ² // x ∈ V} := ⟨t, htV⟩
  let Ks : SelectedFourClass D.A center := (K.shellAt s').toSelectedFourClass
  let Kt : SelectedFourClass D.A center := (K.shellAt t').toSelectedFourClass
  have hst' : s' ≠ t' := by
    intro h
    exact hst (congrArg Subtype.val h)
  exact fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses
    Ks Kt (by simpa [Ks, Kt] using K.supports_pairwise_disjoint s' t' hst')

/-- A singleton minimal-deletion core at a fresh center yields an exact
common-deletion packet with the support-disjoint physical row.  A point of
the physical row outside the fresh exact shell exists because two distinct
circle centers share at most two selected support points. -/
theorem exists_commonDeletion_of_singletonCore_and_disjointPhysicalRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {V : Finset ℝ²} {center : ℝ²}
    (R : FullyDeletionRobustAt D S.oppApex2)
    (secondRow : SelectedFourClass D.A S.oppApex2)
    (K : MinimalDeletionCore D.A V center)
    (hVone : V.card = 1)
    (hcenterA : center ∈ D.A)
    (hcenterNe : center ≠ S.oppApex2) :
    ∃ deleted : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket
        D H deleted center S.oppApex2) := by
  classical
  rcases Finset.card_eq_one.mp hVone with ⟨source, hVeq⟩
  have hsourceV : source ∈ V := by simp [hVeq]
  let source' : {x : ℝ² // x ∈ V} := ⟨source, hsourceV⟩
  let freshRow : SelectedFourClass D.A center :=
    (K.shellAt source').toSelectedFourClass
  have hinter : (secondRow.support ∩ freshRow.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two secondRow freshRow hcenterNe.symm
  have hsplit := Finset.card_sdiff_add_card_inter
    secondRow.support freshRow.support
  have houtside : 2 ≤ (secondRow.support \ freshRow.support).card := by
    rw [secondRow.support_card] at hsplit
    omega
  rcases Finset.card_pos.mp (by omega :
      0 < (secondRow.support \ freshRow.support).card) with
    ⟨deleted, hdeleted⟩
  have hdeletedRow : deleted ∈ secondRow.support :=
    (Finset.mem_sdiff.mp hdeleted).1
  have hdeletedFresh : deleted ∉ freshRow.support :=
    (Finset.mem_sdiff.mp hdeleted).2
  have hdeletedA : deleted ∈ D.A := secondRow.support_subset_A hdeletedRow
  have hfreshSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) center :=
    selectedFourClass_survives_erase_of_not_mem freshRow hdeletedFresh
  have hphysicalSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) S.oppApex2 :=
    R.survives deleted hdeletedA
  exact ⟨deleted,
    nonempty_commonDeletionTwoCenterPacket H hdeletedA hcenterA
      (oppApex2_mem_A S) hcenterNe hfreshSurvives hphysicalSurvives⟩

/-- Equal-radius endpoint after applying global minimality to two strict
second-cap members of one physical row.  The interval is local to this
fixed source pair; no descent or nonreturn property is asserted. -/
structure StrictPairCollisionIntervalEndpoint
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (firstRow : SelectedFourClass D.A S.oppApex2) : Type where
  center : ℝ²
  deleted : Finset ℝ²
  source : ℝ²
  partner : ℝ²
  center_mem_A : center ∈ D.A
  center_ne_secondApex : center ≠ S.oppApex2
  deleted_nonempty : deleted.Nonempty
  source_mem_deleted : source ∈ deleted
  partner_mem_deleted : partner ∈ deleted
  source_ne_partner : source ≠ partner
  source_mem_row : source ∈ firstRow.support
  partner_mem_row : partner ∈ firstRow.support
  source_mem_strictSecondCap :
    source ∈ S.capInteriorByIndex S.oppIndex2
  partner_mem_strictSecondCap :
    partner ∈ S.capInteriorByIndex S.oppIndex2
  blocked_after_deleted :
    ¬ HasNEquidistantPointsAt 4 (D.A \ deleted) center
  restored_after_each_deletion :
    ∀ s ∈ deleted,
      HasNEquidistantPointsAt 4 (D.A \ (deleted.erase s)) center
  freshCenter_bisects : dist center source = dist center partner
  freshCenter_mem_strictSecondCap :
    center ∈ S.capInteriorByIndex S.oppIndex2
  interval : StrictSecondCapInterval S center source partner
  freshCenter_robust : FullyDeletionRobustAt D center
  secondApex_survives_source_deletion :
    HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex2
  secondApex_survives_partner_deletion :
    HasNEquidistantPointsAt 4 (D.A.erase partner) S.oppApex2

/-- The exact nontrivial unequal-radius residual after deleting a chosen
strict second-cap pair.  Packing is only a finite location normal form; it
does not assert a rank decrease. -/
structure StrictPairUnequalCoreEndpoint
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (firstRow : SelectedFourClass D.A S.oppApex2) : Type where
  center : ℝ²
  deleted : Finset ℝ²
  center_mem_A : center ∈ D.A
  center_ne_secondApex : center ≠ S.oppApex2
  deleted_nonempty : deleted.Nonempty
  deleted_card_eq_two : deleted.card = 2
  deleted_subset_row : deleted ⊆ firstRow.support
  deleted_mem_strictSecondCap :
    ∀ source ∈ deleted,
      source ∈ S.capInteriorByIndex S.oppIndex2
  core : MinimalDeletionCore D.A deleted center
  source_radii_injective :
    ∀ source ∈ deleted, ∀ partner ∈ deleted,
      source ≠ partner → dist center source ≠ dist center partner
  freshCenter_robust : FullyDeletionRobustAt D center
  packing : FreshSecondApexCorePacking S deleted center
  secondApex_survives_source_deletion :
    ∀ source ∈ deleted,
      HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex2

/-- Singleton-core endpoint repackaged as an exact common deletion at the
fresh and physical second-apex centers.  This packet is not terminal under
the currently checked continuation. -/
structure StrictPairSingletonCommonDeletionEndpoint
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Type where
  center : ℝ²
  deleted : ℝ²
  center_mem_A : center ∈ D.A
  center_ne_secondApex : center ≠ S.oppApex2
  packet : CommonDeletionTwoCenterPacket
    D H deleted center S.oppApex2

/-- Exact normal form obtained by applying minimality to two strict
`oppCap2` members of a support-disjoint physical row pair.

The equal-radius arm is localized to one strict ordered-cap interval.  A
singleton core becomes a common-deletion packet, which may still loop under
the current continuation.  The unequal two-source core has a finite
location/packing split and fresh robustness, but no descent is claimed. -/
theorem exists_strictPair_minimalDeletionNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (hmin : D.Minimal)
    (H : CriticalShellSystem D.A)
    (R : FullyDeletionRobustAt D S.oppApex2)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hdisjoint : Disjoint firstRow.support secondRow.support)
    (hcard : 4 < D.A.card) :
    Nonempty (StrictPairCollisionIntervalEndpoint D S firstRow) ∨
      Nonempty (StrictPairSingletonCommonDeletionEndpoint D S H) ∨
      Nonempty (StrictPairUnequalCoreEndpoint D S firstRow) := by
  classical
  have hstrictCard := secondApexRow_strictInterior_card_ge_two S firstRow
  rcases Finset.one_lt_card.mp (by omega :
      1 < (firstRow.support ∩
        S.capInteriorByIndex S.oppIndex2).card) with
    ⟨x, hx, y, hy, hxy⟩
  have hxRow : x ∈ firstRow.support := (Finset.mem_inter.mp hx).1
  have hyRow : y ∈ firstRow.support := (Finset.mem_inter.mp hy).1
  have hxStrict : x ∈ S.capInteriorByIndex S.oppIndex2 :=
    (Finset.mem_inter.mp hx).2
  have hyStrict : y ∈ S.capInteriorByIndex S.oppIndex2 :=
    (Finset.mem_inter.mp hy).2
  let pair : Finset ℝ² := {x, y}
  have hpairCard : pair.card = 2 := by
    simp [pair, hxy]
  have hpairSub : pair ⊆ D.A := by
    intro z hz
    simp only [pair, Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact firstRow.support_subset_A hxRow
    · exact firstRow.support_subset_A hyRow
  have hpairNe : pair.Nonempty := by
    exact ⟨x, Finset.mem_insert_self x {y}⟩
  have hremainingCard : 0 < (D.A \ pair).card := by
    have hsplit := Finset.card_sdiff_add_card_inter D.A pair
    have hinter : D.A ∩ pair = pair := Finset.inter_eq_right.mpr hpairSub
    rw [hinter, hpairCard] at hsplit
    omega
  rcases exists_global_cardMinimal_blocking_subdeletion
      hmin hpairSub hpairNe (Finset.card_pos.mp hremainingCard) with
    ⟨center, hcenterFresh, deleted, hdeletedNe, hdeletedSub,
      hblocked, hminimal⟩
  have hcenterA : center ∈ D.A :=
    (Finset.mem_sdiff.mp hcenterFresh).1
  have hdeletedRow : deleted ⊆ firstRow.support := by
    intro source hsource
    have hsourcePair := hdeletedSub hsource
    simp only [pair, Finset.mem_insert, Finset.mem_singleton] at hsourcePair
    rcases hsourcePair with rfl | rfl
    · exact hxRow
    · exact hyRow
  have hdeletedStrict :
      ∀ source ∈ deleted,
        source ∈ S.capInteriorByIndex S.oppIndex2 := by
    intro source hsource
    have hsourcePair := hdeletedSub hsource
    simp only [pair, Finset.mem_insert, Finset.mem_singleton] at hsourcePair
    rcases hsourcePair with rfl | rfl
    · exact hxStrict
    · exact hyStrict
  have hcenterNe : center ≠ S.oppApex2 := by
    intro hcenter
    subst center
    exact hblocked
      (selectedFourClass_survives_sdiff_of_disjoint
        firstRow secondRow hdeletedRow hdisjoint)
  by_cases hcollision :
      ∃ source ∈ deleted, ∃ partner ∈ deleted,
        source ≠ partner ∧ dist center source = dist center partner
  · rcases hcollision with
      ⟨source, hsource, partner, hpartner, hsourcePartner, hdist⟩
    have hsourceRow := hdeletedRow hsource
    have hpartnerRow := hdeletedRow hpartner
    have hsourceStrict := hdeletedStrict source hsource
    have hpartnerStrict := hdeletedStrict partner hpartner
    have hsourceA : source ∈ D.A := firstRow.support_subset_A hsourceRow
    have hpartnerA : partner ∈ D.A := firstRow.support_subset_A hpartnerRow
    have hphysicalEq :
        dist S.oppApex2 source = dist S.oppApex2 partner :=
      (firstRow.support_eq_radius source hsourceRow).trans
        (firstRow.support_eq_radius partner hpartnerRow).symm
    have hcenterStrict :
        center ∈ S.capInteriorByIndex S.oppIndex2 :=
      commonPhysicalPair_center_mem_secondCapInterior (S := S) hcenterA hcenterNe
        hsourceStrict hpartnerStrict hsourcePartner hdist hphysicalEq
    have hcenterSource : center ≠ source := by
      intro h
      subst center
      exact (Finset.mem_sdiff.mp hcenterFresh).2 (hdeletedSub hsource)
    have hcenterPartner : center ≠ partner := by
      intro h
      subst center
      exact (Finset.mem_sdiff.mp hcenterFresh).2 (hdeletedSub hpartner)
    rcases nonempty_strictSecondCapInterval hcenterStrict hsourceStrict
        hpartnerStrict hcenterSource hcenterPartner hsourcePartner hdist with
      ⟨interval⟩
    have hfive :
        5 ≤ (SelectedClass D.A center (dist center source)).card :=
      five_le_selectedClass_of_minimalDeletion_equal_pair
        (hdeletedSub.trans hpairSub) hsource hpartner hsourcePartner hdist
        (hminimal source hsource) hblocked
    have hrobust : FullyDeletionRobustAt D center :=
      fullyDeletionRobustAt_of_five_le_selectedClass
        (dist_pos.mpr hcenterSource) hfive
    exact Or.inl ⟨{
      center := center
      deleted := deleted
      source := source
      partner := partner
      center_mem_A := hcenterA
      center_ne_secondApex := hcenterNe
      deleted_nonempty := hdeletedNe
      source_mem_deleted := hsource
      partner_mem_deleted := hpartner
      source_ne_partner := hsourcePartner
      source_mem_row := hsourceRow
      partner_mem_row := hpartnerRow
      source_mem_strictSecondCap := hsourceStrict
      partner_mem_strictSecondCap := hpartnerStrict
      blocked_after_deleted := hblocked
      restored_after_each_deletion := hminimal
      freshCenter_bisects := hdist
      freshCenter_mem_strictSecondCap := hcenterStrict
      interval := interval
      freshCenter_robust := hrobust
      secondApex_survives_source_deletion := R.survives source hsourceA
      secondApex_survives_partner_deletion := R.survives partner hpartnerA
    }⟩
  · have hcore : Nonempty (MinimalDeletionCore D.A deleted center) := by
      apply exists_minimalDeletionCore
        (hdeletedSub.trans hpairSub) hcenterA
      · intro source hsource partner hpartner hsourcePartner hdist
        exact hcollision
          ⟨source, hsource, partner, hpartner, hsourcePartner, hdist⟩
      · exact hblocked
      · exact hminimal
    rcases hcore with ⟨core⟩
    have hdeletedCardLe : deleted.card ≤ 2 := by
      calc
        deleted.card ≤ pair.card := Finset.card_le_card hdeletedSub
        _ = 2 := hpairCard
    by_cases hsingleton : deleted.card = 1
    · rcases exists_commonDeletion_of_singletonCore_and_disjointPhysicalRow
          R secondRow core hsingleton hcenterA hcenterNe with
        ⟨source, ⟨packet⟩⟩
      exact Or.inr (Or.inl ⟨{
        center := center
        deleted := source
        center_mem_A := hcenterA
        center_ne_secondApex := hcenterNe
        packet := packet
      }⟩)
    · have hdeletedCard : deleted.card = 2 := by
        have hpositive : 0 < deleted.card := Finset.card_pos.mpr hdeletedNe
        omega
      have htwo : 2 ≤ deleted.card := by omega
      have hrobust : FullyDeletionRobustAt D center :=
        fullyDeletionRobustAt_of_nontrivial_minimalDeletionCore core htwo
      exact Or.inr (Or.inr ⟨{
        center := center
        deleted := deleted
        center_mem_A := hcenterA
        center_ne_secondApex := hcenterNe
        deleted_nonempty := hdeletedNe
        deleted_card_eq_two := hdeletedCard
        deleted_subset_row := hdeletedRow
        deleted_mem_strictSecondCap := hdeletedStrict
        core := core
        source_radii_injective := by
          intro source hsource partner hpartner hsourcePartner hdist
          exact hcollision
            ⟨source, hsource, partner, hpartner, hsourcePartner, hdist⟩
        freshCenter_robust := hrobust
        packing :=
          Problem97.ATailRobustTwoRadiusCenterLocalizationScratch.MinimalDeletionCore.freshSecondApexCorePacking
            core hcenterA hcenterNe htwo
        secondApex_survives_source_deletion := by
          intro source hsource
          exact R.survives source
            (firstRow.support_subset_A (hdeletedRow hsource))
      }⟩)

#print axioms commonPhysicalPair_center_mem_secondCapInterior
#print axioms nonempty_strictSecondCapInterval
#print axioms MinimalDeletionCore.freshSecondApexCorePacking
#print axioms exists_commonDeletion_of_singletonCore_and_disjointPhysicalRow
#print axioms exists_strictPair_minimalDeletionNormalForm

end ATailRobustTwoRadiusCenterLocalizationScratch
end Problem97
