/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import QCriticalEndpointIntegration
import SecondApexPostmixWiring

/-!
# Scratch: reduced generated-successor frontier

This file combines two source-clean reductions at the full-parent boundary.
For an exact generated-successor pair, either at least one generated row is
q-deleted, in which case the post-mixed-residual source split is retained, or
both generated rows are q-critical, in which case the endpoint-reduced
cross-sink normal form is retained.

This is a routing theorem.  None of the residual constructors is asserted to
be contradictory here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2ReducedFrontierIntegrationScratch

open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2EqualSourceMetricTerminalScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2GeneratedSuccessorParentScratch
open ATailRF2GeneratedSuccessorParentFactsScratch
open ATailRF2GeneratedSuccessorParentFactsScratch.OriginalQOutsideMiddleParentContext
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQContinuationClassifierScratch
open ATailRF2OriginalQCriticalRankIntegrationScratch
open ATailRF2OriginalQGeneratedSuccessorPairScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2QCriticalEndpointIntegrationScratch
open ATailRF2SecondApexPostmixWiringScratch
open ATailRF2SupportHeavyK4SplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- A certificate that at least one exact generated row uses the q-deleted
constructor. -/
inductive QDeletedConstructorWitness
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
  | atX
      (row : ExactQDeletedAt D q K.named.x)
      (generated_eq : Q.generated.at_x.generated = .qDeleted row)
  | atY
      (row : ExactQDeletedAt D q K.named.y)
      (generated_eq : Q.generated.at_y.generated = .qDeleted row)

/-- Exact reduced frontier for a generated-successor pair.  The q-deleted
arm retains the post-mixed-residual source split; the q-critical arm retains an oriented
cross survival and its endpoint-reduced global-source normal form. -/
inductive ReducedGeneratedSuccessorFrontier
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
  | qDeleted
      (constructor : QDeletedConstructorWitness Q)
      (sourceSplit : PostmixSourceSplit Q)
  | qCritical
      (constructors : QCriticalConstructorPair Q)
      (cross : LiveDeletedCrossSurvival K)
      (endpoints : ReducedCrossSinkNormalForm cross.oriented)

/-- Full-parent classification of one exact generated-successor pair into
the q-deleted source-split arm or the q-critical endpoint arm. -/
theorem OriginalQOutsideMiddleParentContext.reducedGeneratedSuccessorFrontier
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (Pctx : OriginalQOutsideMiddleParentContext D p q t1 t2 t3 u)
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory
      D Pctx.leafPacket D.A radius}
    {P₀ : AmbientRobustHistoryPair
      D Pctx.leafPacket T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      Pctx.leafPacket W (alignedSharedRowPacket X hcenter)}
    {K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain}
    (Q : OriginalQGeneratedSuccessorPair K) :
    ReducedGeneratedSuccessorFrontier Q := by
  have hsplit : PostmixSourceSplit Q := postmixSourceSplit Q
  cases hx : Q.generated.at_x.generated with
  | qDeleted rowX =>
      exact .qDeleted (.atX rowX hx) hsplit
  | qCritical rowX =>
      cases hy : Q.generated.at_y.generated with
      | qDeleted rowY =>
          exact .qDeleted (.atY rowY hy) hsplit
      | qCritical rowY =>
          let Hcrit : QCriticalConstructorPair Q := {
            at_x := rowX
            at_y := rowY
            at_x_eq := hx
            at_y_eq := hy
          }
          rcases
              OriginalQOutsideMiddleParentContext.qCritical_reducedCrossSinkNormalForm
                Pctx Q Hcrit with
            ⟨L, hL⟩
          exact .qCritical Hcrit L hL

/-- Existence form of the exact reduced frontier at the full-parent
boundary. -/
theorem OriginalQOutsideMiddleParentContext.exists_generatedSuccessor_reducedFrontier
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (Pctx : OriginalQOutsideMiddleParentContext D p q t1 t2 t3 u)
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory
      D Pctx.leafPacket D.A radius}
    {P₀ : AmbientRobustHistoryPair
      D Pctx.leafPacket T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      Pctx.leafPacket W (alignedSharedRowPacket X hcenter)}
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain) :
    ∃ Q : OriginalQGeneratedSuccessorPair K,
      ReducedGeneratedSuccessorFrontier Q := by
  rcases nonempty_originalQGeneratedSuccessorPair K with ⟨Q⟩
  exact ⟨Q,
    OriginalQOutsideMiddleParentContext.reducedGeneratedSuccessorFrontier
      Pctx Q⟩

#print axioms
  OriginalQOutsideMiddleParentContext.reducedGeneratedSuccessorFrontier
#print axioms
  OriginalQOutsideMiddleParentContext.exists_generatedSuccessor_reducedFrontier

end ATailRF2ReducedFrontierIntegrationScratch
end Problem97
