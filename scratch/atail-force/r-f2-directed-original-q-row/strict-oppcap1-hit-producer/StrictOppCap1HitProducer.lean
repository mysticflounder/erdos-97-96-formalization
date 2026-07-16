/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import MetricSurvivorRouting
import NonEquilateralGeometryConsumer
import OriginalQGeneratedSuccessorPair

/-!
# The strict-first-cap common-hit target has the wrong polarity

In the equal-successor-source branch at the live center, that source is the live
center `p` and belongs to both generated rows.  A non-equilateral residual says
that the two native row supports overlap in at most one point.  Hence their
intersection is exactly `{p}`.

The live-heavy cap theorem places `p` in strict `oppCap2`.  Consequently the
current `StrictOppCap1CommonHit` consumer antecedent is false on this branch:
producing it would already amount to proving the whole branch contradictory.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2StrictOppCap1HitProducerScratch

open ATailContinuationBankMatchScratch
open ATailContinuationGeometryClassifier
open ATailFrontierContinuationDispatcherScratch
open ATailJointTransitionCoreScratch
open ATailNonEquilateralContinuationScratch
open ATailNonEquilateralGeometryConsumerScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2MetricSurvivorRoutingScratch
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
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- In the live-center equal-source non-equilateral branch, the two generated
row supports meet exactly at the live center. -/
theorem row_inter_eq_singleton_liveCenter_of_equalSource_nonEquilateral
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
    (hsourceLive : Q.at_x.source = p) :
    Q.generated.toTwoContinuationRows.row₁.support ∩
        Q.generated.toTwoContinuationRows.row₂.support = {p} := by
  have hpRow₁ : p ∈ Q.generated.toTwoContinuationRows.row₁.support := by
    simpa [hsourceLive] using Q.source_x_mem_row₁
  have hsourceRow₂ :
      Q.at_x.source ∈ Q.generated.toTwoContinuationRows.row₂.support := by
    rw [hsource]
    exact Q.source_y_mem_row₂
  have hpRow₂ : p ∈ Q.generated.toTwoContinuationRows.row₂.support := by
    simpa [hsourceLive] using hsourceRow₂
  have hpInter :
      p ∈ Q.generated.toTwoContinuationRows.row₁.support ∩
        Q.generated.toTwoContinuationRows.row₂.support :=
    Finset.mem_inter.mpr ⟨hpRow₁, hpRow₂⟩
  have hinterLe :
      (Q.generated.toTwoContinuationRows.row₁.support ∩
        Q.generated.toTwoContinuationRows.row₂.support).card ≤ 1 :=
    nativeRow_inter_card_le_one N
  apply Finset.eq_singleton_iff_unique_mem.mpr
  refine ⟨hpInter, ?_⟩
  intro z hz
  rw [Finset.card_le_one] at hinterLe
  exact hinterLe z hz p hpInter

/-- Every common support point is the live center, and therefore lies in
`oppCap2`.  In particular there is no common support point outside that cap. -/
theorem commonSupport_mem_oppCap2_of_equalSource_nonEquilateral
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
    {z : ℝ²}
    (hzRow₁ : z ∈ Q.generated.toTwoContinuationRows.row₁.support)
    (hzRow₂ : z ∈ Q.generated.toTwoContinuationRows.row₂.support) :
    z ∈ S.oppCap2 := by
  have hinter :=
    row_inter_eq_singleton_liveCenter_of_equalSource_nonEquilateral
      Q N hsource hsourceLive
  have hzInter :
      z ∈ Q.generated.toTwoContinuationRows.row₁.support ∩
        Q.generated.toTwoContinuationRows.row₂.support :=
    Finset.mem_inter.mpr ⟨hzRow₁, hzRow₂⟩
  rw [hinter] at hzInter
  have hzp : z = p := Finset.mem_singleton.mp hzInter
  rw [hzp]
  exact (Finset.mem_sdiff.mp
    (AnchoredF2LiveHeavyReduction.liveCapFacts K).1).1

/-- The strict-first-cap common-hit antecedent is impossible on the actual
equal-source-at-live-center non-equilateral branch. -/
theorem not_strictOppCap1CommonHit_of_equalSource_atLiveCenter
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
    (hsourceLive : Q.at_x.source = p) :
    ¬ StrictOppCap1CommonHit Q.generated.toTwoContinuationRows := by
  intro hit
  rcases hit with ⟨z, hzRow₁, hzRow₂, hzStrict⟩
  have hzCap : z ∈ S.oppCap2 :=
    commonSupport_mem_oppCap2_of_equalSource_nonEquilateral
      Q N hsource hsourceLive hzRow₁ hzRow₂
  exact (Finset.mem_sdiff.mp hzStrict).2
    (Finset.mem_union.mpr (Or.inr hzCap))

/-- For the sibling five-point obstruction, the equal source supplies the
previously missing common point and both of its native-row memberships.  The
completion is therefore reduced exactly to the two `p`-centered reverse
equalities and the one `y`-centered reverse equality displayed below. -/
theorem u1TwoLargeCapHypotheses_of_equalSource_strictWitness_reverseEqualities
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
    {N : NonEquilateralOutput W.H Q.generated.toTwoContinuationRows}
    (hsource : Q.at_x.source = Q.at_y.source)
    (hsourceLive : Q.at_x.source = p)
    (V : StrictWitnessMetricHinge N)
    (hp_x_eq_p_z₂ :
      dist p V.x = dist p Q.generated.toTwoContinuationRows.z₂)
    (hp_x_eq_p_y : dist p V.x = dist p V.y)
    (hy_x_eq_y_z₁ :
      dist V.y V.x = dist V.y Q.generated.toTwoContinuationRows.z₁) :
    U1TwoLargeCapHypotheses V.x
      Q.generated.toTwoContinuationRows.z₁
      Q.generated.toTwoContinuationRows.z₂ V.y p := by
  have hpRow₁ : p ∈ Q.generated.toTwoContinuationRows.row₁.support := by
    simpa [hsourceLive] using Q.source_x_mem_row₁
  have hsourceRow₂ :
      Q.at_x.source ∈ Q.generated.toTwoContinuationRows.row₂.support := by
    rw [hsource]
    exact Q.source_y_mem_row₂
  have hpRow₂ : p ∈ Q.generated.toTwoContinuationRows.row₂.support := by
    simpa [hsourceLive] using hsourceRow₂
  exact u1TwoLargeCapHypotheses_of_strictWitnessBankCompletion V
    { f := p
      f_mem_row₁ := hpRow₁
      f_mem_row₂ := hpRow₂
      f_x_eq_f_z₂ := hp_x_eq_p_z₂
      f_x_eq_f_y := hp_x_eq_p_y
      y_x_eq_y_z₁ := hy_x_eq_y_z₁ }

#print axioms row_inter_eq_singleton_liveCenter_of_equalSource_nonEquilateral
#print axioms commonSupport_mem_oppCap2_of_equalSource_nonEquilateral
#print axioms not_strictOppCap1CommonHit_of_equalSource_atLiveCenter
#print axioms u1TwoLargeCapHypotheses_of_equalSource_strictWitness_reverseEqualities

end ATailRF2StrictOppCap1HitProducerScratch
end Problem97
