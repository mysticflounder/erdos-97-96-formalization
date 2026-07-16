/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalQOffLiveDeficit

/-!
# Scratch: continuation classifier for the live-heavy original-q pair

The live-heavy F2 reduction supplies two distinct strict second-cap centers
`x,y` in the retained second-apex row.  Global K4 for deletion of the
original live source `q` supplies an exact q-deleted or q-critical generated
row at each center.

This file retains those exact rows and places them into the existing
`TwoContinuationRows` classifier.  Consequently the pair reaches one of two
cross-deletion survival arms or the existing metric residual.  No survival
statement is reinterpreted as support membership.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2OriginalQContinuationClassifierScratch

open ATailContinuationGeometryClassifier
open ATailContinuationBankMatchScratch
open ATailJointTransitionCoreScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQOffLiveDeficitScratch
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

/-- The two exact original-`q` generated rows at the named live-heavy
centers, retaining the source profile and the two-off-live conclusion for
each row. -/
structure OriginalQGeneratedPair
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
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain) : Type where
  at_x : OriginalQOffLiveGeneratedProfile (S := S) W K.named.x
  at_y : OriginalQOffLiveGeneratedProfile (S := S) W K.named.y

/-- Extract the exact generated pair from the source-faithful live-heavy
normal form. -/
theorem nonempty_originalQGeneratedPair
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
    Nonempty (OriginalQGeneratedPair K) := by
  rcases
      nonempty_originalQOffLiveGeneratedPair_of_liveHeavy K with
    ⟨Gx, Gy⟩
  exact ⟨{
    at_x := Gx
    at_y := Gy
  }⟩

namespace OriginalQGeneratedPair

/-- The exact original-`q` pair is already a pair of continuation rows over
the retained second-apex row.  Q-critical triples are completed by adjoining
`q`; q-deleted four-rows are unchanged. -/
noncomputable def toTwoContinuationRows
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
    (G : OriginalQGeneratedPair K) :
    TwoContinuationRows (rebasePacket D S)
      (@Problem97.ATailRFailureProfilesParentLiftScratch.CommonDeletionTwoCenterPacket.secondRowSelectedFourClass
        D W.H X.point p S.oppApex2 (alignedSharedRowPacket X hcenter)) := by
  have hxMiddle :
      K.named.x ∈ (alignedSharedRowPacket X hcenter).B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp K.named.x_mem_liveStrict).1).1).1
  have hyMiddle :
      K.named.y ∈ (alignedSharedRowPacket X hcenter).B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp K.named.y_mem_liveStrict).1).1).1
  have hxStrict : K.named.x ∈ strictSecondCap S :=
    (Finset.mem_inter.mp K.named.x_mem_liveStrict).2
  have hyStrict : K.named.y ∈ strictSecondCap S :=
    (Finset.mem_inter.mp K.named.y_mem_liveStrict).2
  exact {
    z₁ := K.named.x
    z₂ := K.named.y
    z₁_mem := Finset.mem_inter.mpr
      ⟨hxMiddle, by
        simpa [rebasePacket, strictSecondCap] using hxStrict⟩
    z₂_mem := Finset.mem_inter.mpr
      ⟨hyMiddle, by
        simpa [rebasePacket, strictSecondCap] using hyStrict⟩
    z₁_ne_z₂ := K.named.x_ne_y
    row₁ :=
      G.at_x.generated.fullSelectedFourClass
        G.at_x.source_profile.source.q_mem_A
        G.at_x.source_profile.center_ne_source
    row₂ :=
      G.at_y.generated.fullSelectedFourClass
        G.at_y.source_profile.source.q_mem_A
        G.at_y.source_profile.center_ne_source
  }

/-- The exact live-heavy original-`q` pair reaches a cross-deletion survival
arm or the existing metric residual. -/
theorem cross_survival_or_metricResidual
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
    (G : OriginalQGeneratedPair K) :
    HasNEquidistantPointsAt 4 (D.A.erase K.named.y) K.named.x ∨
      HasNEquidistantPointsAt 4 (D.A.erase K.named.x) K.named.y ∨
      (G.toTwoContinuationRows).MetricResidual := by
  simpa [rebasePacket] using
    (G.toTwoContinuationRows).cross_survival_or_metricResidual

end OriginalQGeneratedPair

#print axioms nonempty_originalQGeneratedPair
#print axioms OriginalQGeneratedPair.cross_survival_or_metricResidual

end ATailRF2OriginalQContinuationClassifierScratch
end Problem97
