/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import QNotSecondApex
import OriginalQCriticalCriticalMetricTerminal

/-!
# Scratch: parent discharge of the q-critical/q-critical metric terminal

This file composes the local generated-row terminal with the exact
`q ∉ M.verts` hypothesis retained by the full parent context.  The resulting
theorem has no free `q ≠ oppApex2` premise.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2GeneratedSuccessorParentFactsScratch

open ATailContinuationBankMatchScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2GeneratedSuccessorParentScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQContinuationClassifierScratch
open ATailRF2OriginalQCriticalCriticalMetricTerminalScratch
open ATailRF2OriginalQOffLiveDeficitScratch
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

/-- The full parent context discharges the sole external exclusion required
by the q-critical/q-critical metric terminal. -/
theorem OriginalQOutsideMiddleParentContext.false_of_qCritical_qCritical_metricResidual
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
    (G : OriginalQGeneratedPair K)
    (Qx : ExactQCriticalAt D q K.named.x)
    (Qy : ExactQCriticalAt D q K.named.y)
    (hx : G.at_x.generated = .qCritical Qx)
    (hy : G.at_y.generated = .qCritical Qy)
    (hmetric : G.toTwoContinuationRows.MetricResidual) : False :=
  _root_.Problem97.ATailRF2OriginalQCriticalCriticalMetricTerminalScratch.false_of_qCritical_qCritical_metricResidual
    G Qx Qy hx hy hmetric
      (_root_.Problem97.ATailRF2GeneratedSuccessorParentFactsScratch.OriginalQOutsideMiddleParentContext.q_ne_leafPacket_oppApex2
        Pctx)

#print axioms
  OriginalQOutsideMiddleParentContext.false_of_qCritical_qCritical_metricResidual

end ATailRF2GeneratedSuccessorParentFactsScratch
end Problem97
