/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import QCriticalRankIntegration

/-!
# Scratch: equal-source metric terminal at the live center

The generated-successor metric residual already says that each full selected
row contains the opposite named center.  The only difference between a full
row and its raw generated support is the original deleted point `q` in the
q-critical constructor.  Since the two named centers are dangerous-triple
points and `q` is not, both opposite-center memberships descend to the raw
generated supports.

When the common successor source is the live center `p`, that source and both
named centers lie in `oppCap2`.  The shared ordered-cap contradiction from the
q-critical rank integration therefore closes this constructor directly.  The
second-apex constructor is deliberately retained: `oppApex2` is not in
`oppCap2`, so the same ordered-cap argument does not apply to it.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2EqualSourceMetricTerminalScratch

open ATailContinuationGeometryClassifier
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQCapEscapeScratch
open ATailRF2OriginalQContinuationClassifierScratch
open ATailRF2OriginalQCriticalRankIntegrationScratch
open ATailRF2OriginalQGeneratedSuccessorPairScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- Membership in a completed generated row descends to its raw support away
from the deleted point. -/
theorem ExactGeneratedAt.mem_support_of_mem_full_of_ne_deleted
    {D : CounterexampleData} {deleted center z : ℝ²}
    (G : ExactGeneratedAt D deleted center)
    (hdeletedA : deleted ∈ D.A)
    (hcenterNe : center ≠ deleted)
    (hzFull :
      z ∈ (G.fullSelectedFourClass hdeletedA hcenterNe).support)
    (hzNe : z ≠ deleted) :
    z ∈ G.support := by
  cases G with
  | qDeleted K =>
      simpa [ExactGeneratedAt.fullSelectedFourClass,
        ExactGeneratedAt.qDeletedSelectedFourClass,
        ExactGeneratedAt.support] using hzFull
  | qCritical K =>
      simpa [ExactGeneratedAt.fullSelectedFourClass,
        ExactGeneratedAt.qCriticalSelectedFourClass,
        ExactGeneratedAt.support, hzNe] using hzFull

/-- A metric residual supplies both opposite-center memberships in the raw
generated supports, not merely in their completed selected rows. -/
theorem rawCompanions_of_metricResidual
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
    (hmetric : Q.generated.toTwoContinuationRows.MetricResidual) :
    K.named.y ∈ Q.generated.at_x.generated.support ∧
      K.named.x ∈ Q.generated.at_y.generated.support := by
  have hfull :
      K.named.y ∈ Q.generated.toTwoContinuationRows.row₁.support ∧
        K.named.x ∈ Q.generated.toTwoContinuationRows.row₂.support := by
    rcases hmetric with hnon | hequilateral
    · exact ⟨hnon.2.1, hnon.2.2.1⟩
    · exact ⟨hequilateral.2.1, hequilateral.2.2.1⟩
  have hyNe : K.named.y ≠ q := by
    intro hyq
    apply liveSource_not_mem_dangerousTriple W
    simpa [hyq] using K.named.y_mem_dangerousTriple
  have hxNe : K.named.x ≠ q := by
    intro hxq
    apply liveSource_not_mem_dangerousTriple W
    simpa [hxq] using K.named.x_mem_dangerousTriple
  constructor
  · apply
      ExactGeneratedAt.mem_support_of_mem_full_of_ne_deleted
        Q.generated.at_x.generated
        Q.generated.at_x.source_profile.source.q_mem_A
        Q.generated.at_x.source_profile.center_ne_source
        (z := K.named.y)
    · simpa [OriginalQGeneratedPair.toTwoContinuationRows] using hfull.1
    · exact hyNe
  · apply
      ExactGeneratedAt.mem_support_of_mem_full_of_ne_deleted
        Q.generated.at_y.generated
        Q.generated.at_y.source_profile.source.q_mem_A
        Q.generated.at_y.source_profile.center_ne_source
        (z := K.named.x)
    · simpa [OriginalQGeneratedPair.toTwoContinuationRows] using hfull.2
    · exact hxNe

/-- The equal-source-at-live-center metric constructor is impossible by one
shared ordered-cap presentation. -/
theorem false_of_equalSource_atLiveCenter_metricResidual
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
    (hsourceEq : Q.at_x.source = Q.at_y.source)
    (hmetric : Q.generated.toTwoContinuationRows.MetricResidual)
    (hsourceLive : Q.at_x.source = p) : False := by
  have hpCap : p ∈ S.oppCap2 :=
    (Finset.mem_sdiff.mp
      (AnchoredF2LiveHeavyReduction.liveCapFacts K).1).1
  have hsourceCap : Q.at_x.source ∈ S.oppCap2 := by
    simpa [hsourceLive] using hpCap
  rcases rawCompanions_of_metricResidual Q hmetric with
    ⟨hyRowX, hxRowY⟩
  exact false_of_equalSource_bothCompanions
    Q hsourceEq hsourceCap hyRowX hxRowY

/-- Source split after removing the impossible live-center metric
constructor.  The second-apex equilateral arm remains a genuine residual. -/
inductive ReducedSourceSplit
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
      (survives :
        HasNEquidistantPointsAt 4 (D.A.erase K.named.y) K.named.x)
  | equalSource_crossAtY
      (source_eq : Q.at_x.source = Q.at_y.source)
      (survives :
        HasNEquidistantPointsAt 4 (D.A.erase K.named.x) K.named.y)
  | equalSource_atSecondApex
      (source_eq : Q.at_x.source = Q.at_y.source)
      (equilateral : Q.generated.toTwoContinuationRows.EquilateralResidual)
      (source_eq_secondApex : Q.at_x.source = S.oppApex2)

/-- Every generated successor pair lies in the four-constructor reduced
source split. -/
theorem reducedSourceSplit
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
    ReducedSourceSplit Q := by
  cases Q.sourceSplit with
  | distinctSources hdistinct =>
      exact .distinctSources hdistinct
  | equalSource_crossAtX hsource hsurvives =>
      exact .equalSource_crossAtX hsource hsurvives
  | equalSource_crossAtY hsource hsurvives =>
      exact .equalSource_crossAtY hsource hsurvives
  | equalSource_atLiveCenter hsource hmetric hsourceLive =>
      exact False.elim
        (false_of_equalSource_atLiveCenter_metricResidual
          Q hsource hmetric hsourceLive)
  | equalSource_atSecondApex hsource hequilateral hsourceApex =>
      exact .equalSource_atSecondApex
        hsource hequilateral hsourceApex

/-- Existence form of the reduced paired-successor handoff. -/
theorem exists_originalQGeneratedSuccessorPair_with_reducedSourceSplit
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
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain) :
    ∃ Q : OriginalQGeneratedSuccessorPair K, ReducedSourceSplit Q := by
  rcases nonempty_originalQGeneratedSuccessorPair K with ⟨Q⟩
  exact ⟨Q, reducedSourceSplit Q⟩

#print axioms ExactGeneratedAt.mem_support_of_mem_full_of_ne_deleted
#print axioms rawCompanions_of_metricResidual
#print axioms false_of_equalSource_atLiveCenter_metricResidual
#print axioms reducedSourceSplit
#print axioms exists_originalQGeneratedSuccessorPair_with_reducedSourceSplit

end ATailRF2EqualSourceMetricTerminalScratch
end Problem97
