/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SecondApexPostmixWiring
import CapRankOppositeSide

/-!
# Scratch: source-faithful consumer for the postmix reroutes

The two reroute constructors of `PostmixSourceSplit` project away the history
which produced them.  This file keeps that history: the predecessor sources
agree at the physical second apex, and the two generated rows are in the
equilateral metric arm.

With that history retained, each reroute has an exact terminal-filtered
ordered-cap outcome.  If its fresh source remains in `oppCap2`, it is an
opposite-side rank move relative to the other live-heavy center.  If it lies
outside `oppCap2`, it must be omitted by the opposite generated row, since
otherwise the second apex and the fresh source would be a common outside pair.

No cap membership is inferred from support omission, and the rank move is not
claimed to be a recursive descent.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2PostmixRerouteConsumerScratch

open ATailContinuationBankMatchScratch
open ATailJointTransitionCoreScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2EqualSourceMetricTerminalScratch
open ATailRF2GeneratedSuccessorRankScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2MixedSecondApexEliminatorScratch
open ATailRF2OriginalQCapEscapeScratch
open ATailRF2OriginalQContinuationClassifierScratch
open ATailRF2OriginalQGeneratedSuccessorPairScratch
open ATailRF2OriginalQOutsideMiddleSplitScratch
open ATailRF2SecondApexConstructorSplitScratch
open ATailRF2SecondApexPostmixWiringScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- An `x`-reroute together with the exact second-apex history which produced it. -/
structure HistoryRetainingRerouteAtX
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
    (Q : OriginalQGeneratedSuccessorPair K) : Type where
  predecessor_sources_eq : Q.at_x.source = Q.at_y.source
  equilateral : Q.generated.toTwoContinuationRows.EquilateralResidual
  predecessor_eq_secondApex : Q.at_x.source = S.oppApex2
  reroute : NonApexOutsideMiddleRerouteAtX Q

/-- Symmetric history-retaining `y`-reroute. -/
structure HistoryRetainingRerouteAtY
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
    (Q : OriginalQGeneratedSuccessorPair K) : Type where
  predecessor_sources_eq : Q.at_x.source = Q.at_y.source
  equilateral : Q.generated.toTwoContinuationRows.EquilateralResidual
  predecessor_eq_secondApex : Q.at_x.source = S.oppApex2
  reroute : NonApexOutsideMiddleRerouteAtY Q

/-- The postmix source split without projecting away the second-apex history on reroutes. -/
inductive HistoryRetainingPostmixSourceSplit
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
    (Q : OriginalQGeneratedSuccessorPair K) : Prop
  | distinctSources
      (source_ne : Q.at_x.source ≠ Q.at_y.source)
  | equalSource_crossAtX
      (source_eq : Q.at_x.source = Q.at_y.source)
      (survives : HasNEquidistantPointsAt 4 (D.A.erase K.named.y) K.named.x)
  | equalSource_crossAtY
      (source_eq : Q.at_x.source = Q.at_y.source)
      (survives : HasNEquidistantPointsAt 4 (D.A.erase K.named.x) K.named.y)
  | rerouteAtX (reroute : Nonempty (HistoryRetainingRerouteAtX Q))
  | rerouteAtY (reroute : Nonempty (HistoryRetainingRerouteAtY Q))

/-- Construct the history-retaining split directly from the unprojected reduced split. -/
theorem historyRetainingPostmixSourceSplit
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
    (Q : OriginalQGeneratedSuccessorPair K) :
    HistoryRetainingPostmixSourceSplit Q := by
  cases reducedSourceSplit Q with
  | distinctSources source_ne => exact .distinctSources source_ne
  | equalSource_crossAtX source_eq survives =>
      exact .equalSource_crossAtX source_eq survives
  | equalSource_crossAtY source_eq survives =>
      exact .equalSource_crossAtY source_eq survives
  | equalSource_atSecondApex source_eq equilateral source_eq_secondApex =>
      cases secondApexRerouteReduction
          Q source_eq equilateral source_eq_secondApex with
      | rerouteAtX reroute =>
          rcases reroute with ⟨reroute⟩
          exact .rerouteAtX ⟨⟨source_eq, equilateral, source_eq_secondApex, reroute⟩⟩
      | rerouteAtY reroute =>
          rcases reroute with ⟨reroute⟩
          exact .rerouteAtY ⟨⟨source_eq, equilateral, source_eq_secondApex, reroute⟩⟩

private theorem oppApex2_not_mem_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∉ S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex2, hi] using S.partition.v3_notin_C3
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex2, hi] using S.partition.v1_notin_C1
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex2, hi] using S.partition.v2_notin_C2

/-- An outside `x`-reroute source cannot also belong to the opposite generated row. -/
theorem false_of_rerouteAtX_sourceOutside_mem_otherRow
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
    {Q : OriginalQGeneratedSuccessorPair K}
    (H : HistoryRetainingRerouteAtX Q)
    (hsourceOutside : H.reroute.source ∉ S.oppCap2)
    (hsourceOther :
      H.reroute.source ∈ Q.generated.toTwoContinuationRows.row₂.support) : False := by
  have hapexRow₁ :
      S.oppApex2 ∈ Q.generated.toTwoContinuationRows.row₁.support := by
    simpa [H.predecessor_eq_secondApex] using Q.source_x_mem_row₁
  have hapexRow₂ :
      S.oppApex2 ∈ Q.generated.toTwoContinuationRows.row₂.support := by
    have h := Q.source_y_mem_row₂
    rw [← H.predecessor_sources_eq, H.predecessor_eq_secondApex] at h
    exact h
  have hsourceRow₁ :
      H.reroute.source ∈ Q.generated.toTwoContinuationRows.row₁.support := by
    simpa [OriginalQGeneratedPair.toTwoContinuationRows] using
      Q.generated.at_x.generated.support_subset_fullSelectedFourClass
        Q.generated.at_x.source_profile.source.q_mem_A
        Q.generated.at_x.source_profile.center_ne_source
        H.reroute.source_mem_generated
  exact false_of_two_strictOppCap2_rows_common_outside_pair
    (rebasePacket D S)
    Q.generated.toTwoContinuationRows.row₁
    Q.generated.toTwoContinuationRows.row₂
    (by simpa [rebasePacket, strictSecondCap] using
      Q.generated.at_x.source_profile.center_mem_strictSecondCap)
    (by simpa [rebasePacket, strictSecondCap] using
      Q.generated.at_y.source_profile.center_mem_strictSecondCap)
    K.named.x_ne_y
    hapexRow₁ hsourceRow₁ hapexRow₂ hsourceOther
    (by simpa [rebasePacket] using oppApex2_not_mem_oppCap2 S)
    (by simpa [rebasePacket] using hsourceOutside)
    H.reroute.source_ne_secondApex.symm

/-- Symmetric outside-row terminal for a `y`-reroute. -/
theorem false_of_rerouteAtY_sourceOutside_mem_otherRow
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
    {Q : OriginalQGeneratedSuccessorPair K}
    (H : HistoryRetainingRerouteAtY Q)
    (hsourceOutside : H.reroute.source ∉ S.oppCap2)
    (hsourceOther :
      H.reroute.source ∈ Q.generated.toTwoContinuationRows.row₁.support) : False := by
  have hapexRow₁ :
      S.oppApex2 ∈ Q.generated.toTwoContinuationRows.row₁.support := by
    simpa [H.predecessor_eq_secondApex] using Q.source_x_mem_row₁
  have hapexRow₂ :
      S.oppApex2 ∈ Q.generated.toTwoContinuationRows.row₂.support := by
    have h := Q.source_y_mem_row₂
    rw [← H.predecessor_sources_eq, H.predecessor_eq_secondApex] at h
    exact h
  have hsourceRow₂ :
      H.reroute.source ∈ Q.generated.toTwoContinuationRows.row₂.support := by
    simpa [OriginalQGeneratedPair.toTwoContinuationRows] using
      Q.generated.at_y.generated.support_subset_fullSelectedFourClass
        Q.generated.at_y.source_profile.source.q_mem_A
        Q.generated.at_y.source_profile.center_ne_source
        H.reroute.source_mem_generated
  exact false_of_two_strictOppCap2_rows_common_outside_pair
    (rebasePacket D S)
    Q.generated.toTwoContinuationRows.row₁
    Q.generated.toTwoContinuationRows.row₂
    (by simpa [rebasePacket, strictSecondCap] using
      Q.generated.at_x.source_profile.center_mem_strictSecondCap)
    (by simpa [rebasePacket, strictSecondCap] using
      Q.generated.at_y.source_profile.center_mem_strictSecondCap)
    K.named.x_ne_y
    hapexRow₁ hsourceOther hapexRow₂ hsourceRow₂
    (by simpa [rebasePacket] using oppApex2_not_mem_oppCap2 S)
    (by simpa [rebasePacket] using hsourceOutside)
    H.reroute.source_ne_secondApex.symm

/-- Exact terminal-filtered rank outcome for an `x`-reroute. -/
inductive RerouteRankOutcomeAtX
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
    {Q : OriginalQGeneratedSuccessorPair K}
    (H : HistoryRetainingRerouteAtX Q) : Prop
  | outsideOppCap2
      (source_not_mem : H.reroute.source ∉ S.oppCap2)
      (source_not_mem_other :
        H.reroute.source ∉ Q.generated.toTwoContinuationRows.row₂.support)
  | oppositeRank
      (source_mem : H.reroute.source ∈ S.oppCap2)
      (move : EqualRadiusOppositeRankData S S.oppIndex2
        K.named.x K.named.y H.reroute.source)

/-- Exact terminal-filtered rank outcome for a `y`-reroute. -/
inductive RerouteRankOutcomeAtY
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
    {Q : OriginalQGeneratedSuccessorPair K}
    (H : HistoryRetainingRerouteAtY Q) : Prop
  | outsideOppCap2
      (source_not_mem : H.reroute.source ∉ S.oppCap2)
      (source_not_mem_other :
        H.reroute.source ∉ Q.generated.toTwoContinuationRows.row₁.support)
  | oppositeRank
      (source_mem : H.reroute.source ∈ S.oppCap2)
      (move : EqualRadiusOppositeRankData S S.oppIndex2
        K.named.y K.named.x H.reroute.source)

/-- Classify an `x`-reroute without unranked recursion. -/
theorem HistoryRetainingRerouteAtX.rankOutcome
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
    {Q : OriginalQGeneratedSuccessorPair K}
    (H : HistoryRetainingRerouteAtX Q) : RerouteRankOutcomeAtX H := by
  by_cases hsourceCap : H.reroute.source ∈ S.oppCap2
  · have hmetric : Q.generated.toTwoContinuationRows.MetricResidual :=
      Or.inr H.equilateral
    have hcompanion := (rawCompanions_of_metricResidual Q hmetric).1
    have hcompanionCap :=
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp K.named.y_mem_liveStrict).2).1
    have hcompanionSource : K.named.y ≠ H.reroute.source := by
      intro h
      apply H.reroute.source_not_mem_live
      rw [← h]
      exact Finset.mem_insert_of_mem K.named.y_mem_dangerousTriple
    rcases
        OriginalQOffLiveGeneratedProfile.nonempty_equalRadiusOppositeRankData
          Q.generated.at_x hcompanion H.reroute.source_mem_generated
          hcompanionCap hsourceCap hcompanionSource with
      ⟨move⟩
    exact .oppositeRank hsourceCap move
  · by_cases hsourceOther :
        H.reroute.source ∈ Q.generated.toTwoContinuationRows.row₂.support
    · exact False.elim
        (false_of_rerouteAtX_sourceOutside_mem_otherRow
          H hsourceCap hsourceOther)
    · exact .outsideOppCap2 hsourceCap hsourceOther

/-- Symmetric classifier for a `y`-reroute. -/
theorem HistoryRetainingRerouteAtY.rankOutcome
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
    {Q : OriginalQGeneratedSuccessorPair K}
    (H : HistoryRetainingRerouteAtY Q) : RerouteRankOutcomeAtY H := by
  by_cases hsourceCap : H.reroute.source ∈ S.oppCap2
  · have hmetric : Q.generated.toTwoContinuationRows.MetricResidual :=
      Or.inr H.equilateral
    have hcompanion := (rawCompanions_of_metricResidual Q hmetric).2
    have hcompanionCap :=
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp K.named.x_mem_liveStrict).2).1
    have hcompanionSource : K.named.x ≠ H.reroute.source := by
      intro h
      apply H.reroute.source_not_mem_live
      rw [← h]
      exact Finset.mem_insert_of_mem K.named.x_mem_dangerousTriple
    rcases
        OriginalQOffLiveGeneratedProfile.nonempty_equalRadiusOppositeRankData
          Q.generated.at_y hcompanion H.reroute.source_mem_generated
          hcompanionCap hsourceCap hcompanionSource with
      ⟨move⟩
    exact .oppositeRank hsourceCap move
  · by_cases hsourceOther :
        H.reroute.source ∈ Q.generated.toTwoContinuationRows.row₁.support
    · exact False.elim
        (false_of_rerouteAtY_sourceOutside_mem_otherRow
          H hsourceCap hsourceOther)
    · exact .outsideOppCap2 hsourceCap hsourceOther

#print axioms historyRetainingPostmixSourceSplit
#print axioms false_of_rerouteAtX_sourceOutside_mem_otherRow
#print axioms false_of_rerouteAtY_sourceOutside_mem_otherRow
#print axioms HistoryRetainingRerouteAtX.rankOutcome
#print axioms HistoryRetainingRerouteAtY.rankOutcome

end ATailRF2PostmixRerouteConsumerScratch
end Problem97
