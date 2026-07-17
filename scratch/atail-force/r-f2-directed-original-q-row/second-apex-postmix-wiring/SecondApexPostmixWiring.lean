/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import MixedSecondApexEliminator

/-!
# Scratch: post-mixed-residual wiring for the second-apex source split

This file contains no new metric contradiction.  It isolates the exact logical
wiring needed after direct eliminators for the two mixed second-apex constructor
residuals are available.

The resulting source split has no unresolved equal-source-at-second-apex arm.
That arm is replaced by one of the two source-faithful non-apex reroutes already
constructed by `SecondApexConstructorReduction`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2SecondApexPostmixWiringScratch

open ATailContinuationGeometryClassifier
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2EqualSourceMetricTerminalScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2MixedSecondApexEliminatorScratch
open ATailRF2OriginalQContinuationClassifierScratch
open ATailRF2OriginalQGeneratedSuccessorPairScratch
open ATailRF2OriginalQOutsideMiddleSplitScratch
open ATailRF2SecondApexConstructorSplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- Source split after eliminating both mixed second-apex packets.  Unlike
`ReducedSourceSplit`, this interface has no unresolved second-apex constructor:
it retains the actual reroute produced on that branch. -/
inductive PostmixSourceSplit
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
  | rerouteAtX
      (reroute : Nonempty (NonApexOutsideMiddleRerouteAtX Q))
  | rerouteAtY
      (reroute : Nonempty (NonApexOutsideMiddleRerouteAtY Q))

/-- The retained `x`-reroute constructs the same source-faithful successor
type used by the generated-successor parent lane. -/
theorem NonApexOutsideMiddleRerouteAtX.toOutsideMiddleSuccessor
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
    (reroute : NonApexOutsideMiddleRerouteAtX Q) :
    Nonempty (OriginalQOutsideMiddleSuccessor
      (alignedSharedRowPacket X hcenter) Q.generated.at_x) :=
  nonempty_outsideMiddleSuccessor
    (alignedSharedRowPacket X hcenter) Q.generated.at_x
    reroute.source_mem_generated reroute.source_not_mem_live
    reroute.source_not_mem_middle

/-- Symmetric conversion of the retained `y`-reroute. -/
theorem NonApexOutsideMiddleRerouteAtY.toOutsideMiddleSuccessor
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
    (reroute : NonApexOutsideMiddleRerouteAtY Q) :
    Nonempty (OriginalQOutsideMiddleSuccessor
      (alignedSharedRowPacket X hcenter) Q.generated.at_y) :=
  nonempty_outsideMiddleSuccessor
    (alignedSharedRowPacket X hcenter) Q.generated.at_y
    reroute.source_mem_generated reroute.source_not_mem_live
    reroute.source_not_mem_middle

/-- Upgrade an existing reduced source split after the two mixed metric
eliminators land.  This is the direct adapter for the q-deleted arm of
`ReducedGeneratedSuccessorFrontier`. -/
theorem postmixSourceSplit_of_reducedSourceSplit
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
    (h : ReducedSourceSplit Q) :
    PostmixSourceSplit Q := by
  cases h with
  | distinctSources source_ne => exact .distinctSources source_ne
  | equalSource_crossAtX source_eq survives =>
      exact .equalSource_crossAtX source_eq survives
  | equalSource_crossAtY source_eq survives =>
      exact .equalSource_crossAtY source_eq survives
  | equalSource_atSecondApex hsource hequilateral hsourceApex =>
      cases secondApexRerouteReduction
          Q hsource hequilateral hsourceApex with
      | rerouteAtX reroute => exact .rerouteAtX reroute
      | rerouteAtY reroute => exact .rerouteAtY reroute

/-- Thinnest source-clean replacement for `reducedSourceSplit`: the first
three cases are unchanged, and the old second-apex case is replaced by its
concrete reroute output. -/
theorem postmixSourceSplit
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
    PostmixSourceSplit Q :=
  postmixSourceSplit_of_reducedSourceSplit Q (reducedSourceSplit Q)

#print axioms postmixSourceSplit_of_reducedSourceSplit
#print axioms postmixSourceSplit
#print axioms NonApexOutsideMiddleRerouteAtX.toOutsideMiddleSuccessor
#print axioms NonApexOutsideMiddleRerouteAtY.toOutsideMiddleSuccessor

end ATailRF2SecondApexPostmixWiringScratch
end Problem97
