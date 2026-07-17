/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import EqualSourceNonEquilateral

/-!
# Scratch: source-faithful audit of the reverse-equality target

The exact live row has support `{q, z₁, z₂, coherentSource}`.  A point in
strict `oppCap1` that lies on this live circle therefore has to be the coherent
source: `q` is in the surplus cap and both generated centers are in `oppCap2`.

Consequently the first two fields of `LiveCenterReverseEqualities` are already
jointly contradictory for the two distinct strict witnesses.  The third,
`y`-centered reverse equality is not needed.  This does not produce either of
the first two equalities; it sharpens the target and records their exact
source-identification content.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2ReverseEqualityProducerScratch

open ATailNonEquilateralGeometryConsumerScratch
open ATailNonEquilateralParentProducerScratch
open ATailFrontierContinuationDispatcherScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2EqualSourceNonEquilateralScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQContinuationClassifierScratch
open ATailRF2OriginalQGeneratedSuccessorPairScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- A strict-`oppCap1` carrier point on the exact live-row circle is the
coherent source. -/
theorem eq_coherentSource_of_strictOppCap1_liveRadius
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
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain)
    {z : ℝ²}
    (hzA : z ∈ D.A)
    (hzStrict : z ∈ strictOppCap1Region S)
    (hzRadius : dist p z = dist p K.named.y) :
    z = R.sourcePair.x := by
  have hyLive : K.named.y ∈ W.liveRow.toCriticalFourShell.support := by
    rw [W.liveRow_support]
    exact Finset.mem_insert_of_mem K.named.y_mem_dangerousTriple
  have hzLive : z ∈ W.liveRow.toCriticalFourShell.support :=
    W.liveRow.toCriticalFourShell.off_row_named_label_forbidden hzA
      (hzRadius.trans
        (W.liveRow.toCriticalFourShell.support_eq_radius K.named.y hyLive))
  have hzNotAdjacent : z ∉ S.surplusCap ∪ S.oppCap2 :=
    (Finset.mem_sdiff.mp
      (by simpa [strictOppCap1Region] using hzStrict)).2
  have hxOpp2 : K.named.x ∈ S.oppCap2 :=
    (Finset.mem_sdiff.mp
      (Finset.mem_inter.mp K.named.x_mem_liveStrict).2).1
  have hyOpp2 : K.named.y ∈ S.oppCap2 :=
    (Finset.mem_sdiff.mp
      (Finset.mem_inter.mp K.named.y_mem_liveStrict).2).1
  rw [W.liveRow_support, K.dangerous_triple_eq] at hzLive
  simp only [Finset.mem_insert, Finset.mem_singleton] at hzLive
  rcases hzLive with hq | hx | hy | hr
  · subst z
    exact False.elim <| hzNotAdjacent <|
      Finset.mem_union_left _ P.q_mem_surplus
  · subst z
    exact False.elim <| hzNotAdjacent <|
      Finset.mem_union_right _ hxOpp2
  · subst z
    exact False.elim <| hzNotAdjacent <|
      Finset.mem_union_right _ hyOpp2
  · exact hr

/-- Exact characterization of the live-radius condition on strict
`oppCap1`: it is not an independent metric coincidence, but precisely the
identification with the coherent source. -/
theorem strictOppCap1_liveRadius_iff_eq_coherentSource
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
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain)
    {z : ℝ²}
    (hzA : z ∈ D.A)
    (hzStrict : z ∈ strictOppCap1Region S) :
    dist p z = dist p K.named.y ↔ z = R.sourcePair.x := by
  constructor
  · exact eq_coherentSource_of_strictOppCap1_liveRadius K hzA hzStrict
  · intro hzSource
    have hsourceLive :
        R.sourcePair.x ∈ W.liveRow.toCriticalFourShell.support := by
      rw [W.liveRow_support]
      exact Finset.mem_insert_of_mem P.coherent_source_mem_dangerousTriple
    have hyLive : K.named.y ∈ W.liveRow.toCriticalFourShell.support := by
      rw [W.liveRow_support]
      exact Finset.mem_insert_of_mem K.named.y_mem_dangerousTriple
    rw [hzSource]
    exact
      (W.liveRow.toCriticalFourShell.support_eq_radius
          R.sourcePair.x hsourceLive).trans
        (W.liveRow.toCriticalFourShell.support_eq_radius
          K.named.y hyLive).symm

/-- On the strict-witness arm, being on the live radius is exactly the named
coherent-source identification. -/
theorem strictWitness_liveRadius_iff_eq_coherentSource
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
    (V : StrictWitnessMetricHinge N) :
    dist p V.x = dist p Q.generated.toTwoContinuationRows.z₂ ↔
      V.x = R.sourcePair.x := by
  simpa [OriginalQGeneratedPair.toTwoContinuationRows] using
    (strictOppCap1_liveRadius_iff_eq_coherentSource K
      (Q.generated.toTwoContinuationRows.row₁.support_subset_A
        V.x_mem_row₁)
      V.x_strict_oppCap1)

/-- The first two live-center reverse equalities already force both distinct
strict witnesses to be the coherent source. -/
theorem false_of_strictWitness_two_liveCenterEqualities
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
    (V : StrictWitnessMetricHinge N)
    (hxRadius : dist p V.x = dist p Q.generated.toTwoContinuationRows.z₂)
    (hxyRadius : dist p V.x = dist p V.y) : False := by
  have hxSource : V.x = R.sourcePair.x :=
    (strictWitness_liveRadius_iff_eq_coherentSource Q V).mp hxRadius
  have hySource : V.y = R.sourcePair.x := by
    apply eq_coherentSource_of_strictOppCap1_liveRadius K
    · exact Q.generated.toTwoContinuationRows.row₂.support_subset_A
        V.y_mem_row₂
    · exact V.y_strict_oppCap1
    · simpa [OriginalQGeneratedPair.toTwoContinuationRows] using
        hxyRadius.symm.trans hxRadius
  exact V.x_ne_y (hxSource.trans hySource.symm)

/-- Source-faithful replacement for the three-field bank sink: the third
reverse equality is unused. -/
theorem false_of_liveCenterReverseEqualities_exactSupport
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
    (V : StrictWitnessMetricHinge N)
    (E : LiveCenterReverseEqualities p V.x
      Q.generated.toTwoContinuationRows.z₁
      Q.generated.toTwoContinuationRows.z₂ V.y) : False := by
  exact false_of_strictWitness_two_liveCenterEqualities
    Q V E.p_x_eq_p_z₂ E.p_x_eq_p_y

#print axioms eq_coherentSource_of_strictOppCap1_liveRadius
#print axioms strictOppCap1_liveRadius_iff_eq_coherentSource
#print axioms strictWitness_liveRadius_iff_eq_coherentSource
#print axioms false_of_strictWitness_two_liveCenterEqualities
#print axioms false_of_liveCenterReverseEqualities_exactSupport

end ATailRF2ReverseEqualityProducerScratch
end Problem97
