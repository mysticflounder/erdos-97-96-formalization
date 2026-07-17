/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import EqualSourceNonEquilateral

/-!
# Scratch: the surplus-heavy native-row arm has no positive second-center sink

On the actual equal-source-at-live-center non-equilateral branch, the live
center belongs to both native rows.  Together with the opposite continuation
center, it saturates the ordered-cap upper bound of two support points in
`oppCap2`.  Hence every surplus-heavy pair lies outside `oppCap2`; the deleted
second apex is omitted, so the pair also avoids `oppCap1`.  Thus the pair is
genuinely in the strict surplus interior.

The native row center is equidistant from that pair.  But the live center is a
second distinct center in `oppCap2`, so `outsidePair_unique_capCenter` (through
the checked cap-order adapter) proves that it is *not* equidistant from the
pair.  Consequently the old proposed consumer is reduced to a scalar equality
whose negation is already forced.  This file deliberately does not manufacture
that equality and does not duplicate the stronger equal-source metric terminal.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2SurplusHeavyConsumerScratch

open ATailContinuationCapOrderClassifierScratch
open ATailContinuationGeometryClassifier
open ATailFrontierContinuationDispatcherScratch
open ATailJointTransitionCoreScratch
open ATailNonEquilateralGeometryConsumerScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQCapEscapeScratch
open ATailRF2OriginalQGeneratedSuccessorPairScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2OriginalQOutsideMiddleSplitScratch
open ATailRF2OriginalQSourceExtractionScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- The part of the surplus cap away from both adjacent closed caps. -/
noncomputable def strictSurplusRegion
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Finset ℝ² :=
  S.surplusCap \ (S.oppCap1 ∪ S.oppCap2)

/-- Exact normalized data supplied by one surplus-heavy native row on the
equal-source-at-live-center branch.  The last field records the wrong polarity
for a repeated-center consumer: the live center separates the pair. -/
structure LiveCenterSeparatedSurplusPair
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p center : ℝ²) (R : SelectedFourClass D.A center) : Type where
  a : ℝ²
  b : ℝ²
  a_mem_row : a ∈ R.support
  b_mem_row : b ∈ R.support
  a_strict_surplus : a ∈ strictSurplusRegion S
  b_strict_surplus : b ∈ strictSurplusRegion S
  a_ne_b : a ≠ b
  center_mem_oppCap2 : center ∈ S.oppCap2
  liveCenter_mem_oppCap2 : p ∈ S.oppCap2
  center_ne_liveCenter : center ≠ p
  center_pair_eq : dist center a = dist center b
  liveCenter_pair_ne : dist p a ≠ dist p b

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem nonempty_liveCenterSeparatedSurplusPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p center other : ℝ²} (R : SelectedFourClass D.A center)
    (hcenterStrict :
      center ∈ S.oppCap2 \ (S.surplusCap ∪ S.oppCap1))
    (hliveStrict : p ∈ S.oppCap2 \ (S.surplusCap ∪ S.oppCap1))
    (hotherStrict : other ∈ S.oppCap2 \ (S.surplusCap ∪ S.oppCap1))
    (hotherRow : other ∈ R.support)
    (hliveRow : p ∈ R.support)
    (hliveNeOther : p ≠ other)
    (hapexOmit : S.oppApex2 ∉ R.support)
    (hheavy : 2 ≤ (R.support ∩ S.surplusCap).card) :
    Nonempty (LiveCenterSeparatedSurplusPair S p center R) := by
  have hcapEq := capByIndex_oppIndex2_eq_oppCap2 S
  have hcenterCap : center ∈ S.oppCap2 :=
    (Finset.mem_sdiff.mp hcenterStrict).1
  have hliveCap : p ∈ S.oppCap2 :=
    (Finset.mem_sdiff.mp hliveStrict).1
  have hotherCap : other ∈ S.oppCap2 :=
    (Finset.mem_sdiff.mp hotherStrict).1
  have hliveNotSurplus : p ∉ S.surplusCap := by
    intro hp
    exact (Finset.mem_sdiff.mp hliveStrict).2
      (Finset.mem_union.mpr (Or.inl hp))
  have hotherNotSurplus : other ∉ S.surplusCap := by
    intro ho
    exact (Finset.mem_sdiff.mp hotherStrict).2
      (Finset.mem_union.mpr (Or.inl ho))
  have hcapUpper : (R.support ∩ S.oppCap2).card ≤ 2 := by
    have hraw :=
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 R
          (by simpa only [hcapEq] using hcenterCap)
    simpa only [hcapEq] using hraw
  have hpairSub :
      ({p, other} : Finset ℝ²) ⊆ R.support ∩ S.oppCap2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hliveRow, hliveCap⟩
    · exact Finset.mem_inter.mpr ⟨hotherRow, hotherCap⟩
  have hcapCardLePair :
      (R.support ∩ S.oppCap2).card ≤ ({p, other} : Finset ℝ²).card := by
    rw [Finset.card_pair hliveNeOther]
    exact hcapUpper
  have hcapInterEq :
      R.support ∩ S.oppCap2 = ({p, other} : Finset ℝ²) :=
    (Finset.eq_of_subset_of_card_le hpairSub hcapCardLePair).symm
  rcases Finset.one_lt_card.mp (by omega :
      1 < (R.support ∩ S.surplusCap).card) with
    ⟨a, ha, b, hb, hab⟩
  have haRow : a ∈ R.support := (Finset.mem_inter.mp ha).1
  have hbRow : b ∈ R.support := (Finset.mem_inter.mp hb).1
  have haSurplus : a ∈ S.surplusCap := (Finset.mem_inter.mp ha).2
  have hbSurplus : b ∈ S.surplusCap := (Finset.mem_inter.mp hb).2
  have haNotOppCap2 : a ∉ S.oppCap2 := by
    intro haCap
    have haInter : a ∈ R.support ∩ S.oppCap2 :=
      Finset.mem_inter.mpr ⟨haRow, haCap⟩
    rw [hcapInterEq] at haInter
    simp only [Finset.mem_insert, Finset.mem_singleton] at haInter
    rcases haInter with rfl | rfl
    · exact hliveNotSurplus haSurplus
    · exact hotherNotSurplus haSurplus
  have hbNotOppCap2 : b ∉ S.oppCap2 := by
    intro hbCap
    have hbInter : b ∈ R.support ∩ S.oppCap2 :=
      Finset.mem_inter.mpr ⟨hbRow, hbCap⟩
    rw [hcapInterEq] at hbInter
    simp only [Finset.mem_insert, Finset.mem_singleton] at hbInter
    rcases hbInter with rfl | rfl
    · exact hliveNotSurplus hbSurplus
    · exact hotherNotSurplus hbSurplus
  have haNotOppCap1 : a ∉ S.oppCap1 := by
    intro haCap
    have haEndpoint :=
      U2NonSurplusSqueeze.surplus_inter_oppCap1_subset_oppApex2
        (rebasePacket D S) (Finset.mem_inter.mpr ⟨haSurplus, haCap⟩)
    have haEq : a = S.oppApex2 := Finset.mem_singleton.mp haEndpoint
    exact hapexOmit (haEq ▸ haRow)
  have hbNotOppCap1 : b ∉ S.oppCap1 := by
    intro hbCap
    have hbEndpoint :=
      U2NonSurplusSqueeze.surplus_inter_oppCap1_subset_oppApex2
        (rebasePacket D S) (Finset.mem_inter.mpr ⟨hbSurplus, hbCap⟩)
    have hbEq : b = S.oppApex2 := Finset.mem_singleton.mp hbEndpoint
    exact hapexOmit (hbEq ▸ hbRow)
  have haStrict : a ∈ strictSurplusRegion S := by
    exact Finset.mem_sdiff.mpr ⟨haSurplus, by
      simpa only [Finset.mem_union, not_or] using
        ⟨haNotOppCap1, haNotOppCap2⟩⟩
  have hbStrict : b ∈ strictSurplusRegion S := by
    exact Finset.mem_sdiff.mpr ⟨hbSurplus, by
      simpa only [Finset.mem_union, not_or] using
        ⟨hbNotOppCap1, hbNotOppCap2⟩⟩
  have hcenterEq : dist center a = dist center b :=
    (R.support_eq_radius a haRow).trans
      (R.support_eq_radius b hbRow).symm
  have hcenterNeLive : center ≠ p := by
    intro h
    apply R.center_not_mem
    simpa [h] using hliveRow
  have hliveNe : dist p a ≠ dist p b := by
    apply second_center_separates_outside_pair
      S D.convex S.oppIndex2
    · simpa only [hcapEq] using hcenterCap
    · simpa only [hcapEq] using hliveCap
    · exact hcenterNeLive
    · exact R.support_subset_A haRow
    · exact R.support_subset_A hbRow
    · simpa only [hcapEq] using haNotOppCap2
    · simpa only [hcapEq] using hbNotOppCap2
    · exact hab
    · exact hcenterEq
  exact ⟨{
    a := a
    b := b
    a_mem_row := haRow
    b_mem_row := hbRow
    a_strict_surplus := haStrict
    b_strict_surplus := hbStrict
    a_ne_b := hab
    center_mem_oppCap2 := hcenterCap
    liveCenter_mem_oppCap2 := hliveCap
    center_ne_liveCenter := hcenterNeLive
    center_pair_eq := hcenterEq
    liveCenter_pair_ne := hliveNe }⟩

/-- The complete surplus-heavy normalization on the actual equal-source
non-equilateral branch.  Either native row supplies two strict-surplus points,
but the live center separates them, so no repeated-center equality is left for
an existing positive consumer. -/
theorem surplusHeavy_normalForm_of_equalSource_atLiveCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    {K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain}
    (Q : OriginalQGeneratedSuccessorPair K)
    (N : NonEquilateralOutput W.H Q.generated.toTwoContinuationRows)
    (hsource : Q.at_x.source = Q.at_y.source)
    (hsourceLive : Q.at_x.source = p)
    (hheavy : SurplusHeavyNativeRow Q.generated.toTwoContinuationRows) :
    Nonempty (LiveCenterSeparatedSurplusPair S p
      Q.generated.toTwoContinuationRows.z₁
      Q.generated.toTwoContinuationRows.row₁) ∨
    Nonempty (LiveCenterSeparatedSurplusPair S p
      Q.generated.toTwoContinuationRows.z₂
      Q.generated.toTwoContinuationRows.row₂) := by
  let rows := Q.generated.toTwoContinuationRows
  have hpRow₁ : p ∈ rows.row₁.support := by
    simpa [rows, hsourceLive] using Q.source_x_mem_row₁
  have hsourceRow₂ : Q.at_x.source ∈ rows.row₂.support := by
    rw [hsource]
    simpa [rows] using Q.source_y_mem_row₂
  have hpRow₂ : p ∈ rows.row₂.support := by
    simpa [hsourceLive] using hsourceRow₂
  have hpStrict : p ∈ S.oppCap2 \ (S.surplusCap ∪ S.oppCap1) := by
    simpa [strictSecondCap] using
      (AnchoredF2LiveHeavyReduction.liveCapFacts K).1
  have hz₁Strict :
      rows.z₁ ∈ S.oppCap2 \ (S.surplusCap ∪ S.oppCap1) := by
    simpa [rows, rebasePacket] using (Finset.mem_inter.mp rows.z₁_mem).2
  have hz₂Strict :
      rows.z₂ ∈ S.oppCap2 \ (S.surplusCap ∪ S.oppCap1) := by
    simpa [rows, rebasePacket] using (Finset.mem_inter.mp rows.z₂_mem).2
  rcases N.residual with
    ⟨_hd, hz₂Row₁, hz₁Row₂, _hr₁, _hr₂, hapex₁, hapex₂⟩
  have hpNeZ₁ : p ≠ rows.z₁ := by
    intro h
    apply rows.row₁.center_not_mem
    simpa [h] using hpRow₁
  have hpNeZ₂ : p ≠ rows.z₂ := by
    intro h
    apply rows.row₂.center_not_mem
    simpa [h] using hpRow₂
  rcases hheavy with hheavy₁ | hheavy₂
  · left
    simpa [rows] using
      (nonempty_liveCenterSeparatedSurplusPair (D := D) rows.row₁
        hz₁Strict hpStrict hz₂Strict hz₂Row₁ hpRow₁
        hpNeZ₂ hapex₁ hheavy₁)
  · right
    simpa [rows] using
      (nonempty_liveCenterSeparatedSurplusPair (D := D) rows.row₂
        hz₂Strict hpStrict hz₁Strict hz₁Row₂ hpRow₂
        hpNeZ₁ hapex₂ hheavy₂)

#print axioms surplusHeavy_normalForm_of_equalSource_atLiveCenter

end ATailRF2SurplusHeavyConsumerScratch
end Problem97
