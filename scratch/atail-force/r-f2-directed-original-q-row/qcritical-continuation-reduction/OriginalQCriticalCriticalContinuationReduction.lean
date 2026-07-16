/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalQCriticalCriticalMetricTerminal
import QNotSecondApex

/-!
# Scratch: q-critical/q-critical continuation reduction

The exact original-`q` continuation classifier has three outcomes: deletion
of `y` preserves K4 at `x`, deletion of `x` preserves K4 at `y`, or the two
generated rows reach `MetricResidual`.

When both generated constructors are q-critical, the checked metric terminal
eliminates the third outcome under `q ≠ S.oppApex2`.  Thus the exact result is
the disjunction of the two cross-deletion-survival arms.  The full-parent
adapter discharges the sole exclusion from `q ∉ M.verts` through the checked
`QNotSecondApex` fact.

This is a reduction to two live continuation branches, not a contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2OriginalQCriticalCriticalContinuationReductionScratch

open ATailContinuationBankMatchScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2GeneratedSuccessorParentFactsScratch
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

/-- With both exact generated constructors q-critical, the sole residual
alternative is impossible under `q ≠ oppApex2`; one of the two cross
deletions therefore preserves K4. -/
theorem cross_survival_of_qCritical_qCritical
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
    (G : OriginalQGeneratedPair K)
    (Qx : ExactQCriticalAt D q K.named.x)
    (Qy : ExactQCriticalAt D q K.named.y)
    (hx : G.at_x.generated = .qCritical Qx)
    (hy : G.at_y.generated = .qCritical Qy)
    (hqNeApex : q ≠ S.oppApex2) :
    HasNEquidistantPointsAt 4 (D.A.erase K.named.y) K.named.x ∨
      HasNEquidistantPointsAt 4 (D.A.erase K.named.x) K.named.y := by
  rcases G.cross_survival_or_metricResidual with
    hcrossX | hcrossY | hmetric
  · exact Or.inl hcrossX
  · exact Or.inr hcrossY
  · exact False.elim
      (false_of_qCritical_qCritical_metricResidual
        G Qx Qy hx hy hmetric hqNeApex)

/-- The full parent context supplies `q ≠ leafPacket.oppApex2`, so no free
side condition remains in the exact two-arm continuation reduction. -/
theorem OriginalQOutsideMiddleParentContext.cross_survival_of_qCritical_qCritical
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
    (hy : G.at_y.generated = .qCritical Qy) :
    HasNEquidistantPointsAt 4 (D.A.erase K.named.y) K.named.x ∨
      HasNEquidistantPointsAt 4 (D.A.erase K.named.x) K.named.y :=
  _root_.Problem97.ATailRF2OriginalQCriticalCriticalContinuationReductionScratch.cross_survival_of_qCritical_qCritical
    G Qx Qy hx hy
      (_root_.Problem97.ATailRF2GeneratedSuccessorParentFactsScratch.OriginalQOutsideMiddleParentContext.q_ne_leafPacket_oppApex2
        Pctx)

#print axioms cross_survival_of_qCritical_qCritical
#print axioms
  OriginalQOutsideMiddleParentContext.cross_survival_of_qCritical_qCritical

end ATailRF2OriginalQCriticalCriticalContinuationReductionScratch
end Problem97
