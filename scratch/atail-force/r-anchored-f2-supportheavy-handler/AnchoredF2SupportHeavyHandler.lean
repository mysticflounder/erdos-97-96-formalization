/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginTaggedCoordinator
import F2GeneratedMetricSink

/-!
# Anchored F2 support-heavy handler

The generic origin-tagged coordinator retypes an anchored common-deletion
packet with `commonDeletionAtLiveCenter`, while the provenance-bearing F2 work
uses `alignedSharedRowPacket`.  Those two values are not definitionally
interchangeable through the dependent live-system index.  This file therefore
keeps the anchored origin on its native `alignedSharedRowPacket` surface.

The exact four-way global-K4 split is reduced to:

* a new same-deletion common-deletion packet in the both-q-deleted case;
* the three routed continuation outputs in either mixed case; or
* cross survival in the both-q-critical case.

The both-q-critical metric residual is eliminated internally by the existing
anchored cap-order contradiction.  No support omission is converted into a
metric inequality.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRAnchoredF2SupportHeavyHandlerScratch

open ATailFrontierContinuationDispatcherScratch
open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailRFailureProfilesParentLiftScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2AnchoredSupportHeavyCouplingScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2GeneratedMetricSinkScratch
open ATailRF2SupportHeavyK4SplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.AmbientRobustHistoryPair
open ATailRFullParentEntryScratch.CriticalPairFrontier
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.ReciprocalDirectedCrossResidual
open ATailROriginTaggedCoordinatorScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRReciprocalSwapReductionScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- Preserve the exact mixed generated pair without repeating the four-way
constructor at every use site. -/
def exactPairOfQDeletedQCritical
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    {N : NamedF2SupportHeavyWitnesses P}
    (Q : QDeletedQCriticalCase N) :
    ExactGeneratedPair N :=
  Problem97.ATailRF2GeneratedEscapePlacementScratch.F2SupportHeavyK4FourWay.toExactGeneratedPair
    (F2SupportHeavyK4FourWay.qDeleted_qCritical Q)

/-- Symmetric exact mixed generated pair. -/
def exactPairOfQCriticalQDeleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    {N : NamedF2SupportHeavyWitnesses P}
    (Q : QCriticalQDeletedCase N) :
    ExactGeneratedPair N :=
  Problem97.ATailRF2GeneratedEscapePlacementScratch.F2SupportHeavyK4FourWay.toExactGeneratedPair
    (F2SupportHeavyK4FourWay.qCritical_qDeleted Q)

/-- Exact residual surface after consuming the anchored support-heavy
four-way split.

The absent ninth constructor is the both-q-critical metric residual: it is
already contradictory by `false_of_bothQCritical_metricResidual`. -/
inductive AnchoredF2SupportHeavyResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P₀ W.H)
    (A : AnchoredSourceCriticalTransition R)
    (X : RowExternalCommonDeletionSource A)
    (hcenter : R.firstCenter = p)
    (P : AnchoredProvenanceF2NormalForm W R A X hcenter)
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P) : Prop
  | repeatedCommonDeletion
      (Q : BothQDeletedCase K.named) :
      AnchoredF2SupportHeavyResidual W R A X hcenter P K
  | qDeletedQCriticalCross
      (Q : QDeletedQCriticalCase K.named)
      (cross : CrossSurvivalOutput
        (exactPairOfQDeletedQCritical Q).toTwoContinuationRows) :
      AnchoredF2SupportHeavyResidual W R A X hcenter P K
  | qDeletedQCriticalNonEquilateral
      (Q : QDeletedQCriticalCase K.named)
      (nonEquilateral : NonEquilateralOutput W.H
        (exactPairOfQDeletedQCritical Q).toTwoContinuationRows) :
      AnchoredF2SupportHeavyResidual W R A X hcenter P K
  | qDeletedQCriticalEquilateral
      (Q : QDeletedQCriticalCase K.named)
      (equilateral :
        (exactPairOfQDeletedQCritical Q).toTwoContinuationRows.EquilateralResidual) :
      AnchoredF2SupportHeavyResidual W R A X hcenter P K
  | qCriticalQDeletedCross
      (Q : QCriticalQDeletedCase K.named)
      (cross : CrossSurvivalOutput
        (exactPairOfQCriticalQDeleted Q).toTwoContinuationRows) :
      AnchoredF2SupportHeavyResidual W R A X hcenter P K
  | qCriticalQDeletedNonEquilateral
      (Q : QCriticalQDeletedCase K.named)
      (nonEquilateral : NonEquilateralOutput W.H
        (exactPairOfQCriticalQDeleted Q).toTwoContinuationRows) :
      AnchoredF2SupportHeavyResidual W R A X hcenter P K
  | qCriticalQDeletedEquilateral
      (Q : QCriticalQDeletedCase K.named)
      (equilateral :
        (exactPairOfQCriticalQDeleted Q).toTwoContinuationRows.EquilateralResidual) :
      AnchoredF2SupportHeavyResidual W R A X hcenter P K
  | bothQCriticalCross
      (Q : BothQCriticalCase K.named)
      (cross : CrossSurvivalOutput
        (exactGeneratedPairOfBothQCritical Q).toTwoContinuationRows) :
      AnchoredF2SupportHeavyResidual W R A X hcenter P K

/-- Enter the provenance-bearing anchored F2 analysis directly from the
origin-tagged coordinator's support-heavy handler arguments. -/
theorem anchoredF2SupportHeavyResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P₀ W.H)
    (A : AnchoredSourceCriticalTransition R)
    (X : RowExternalCommonDeletionSource A)
    (hcenter : R.firstCenter = p)
    (hXOff : X.point ∉ S.surplusCap)
    (hqSurplus : q ∈ S.surplusCap)
    (profile : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S
      (alignedSharedRowPacket X hcenter))
    (reduction : F2SupportHeavyReduction S W
      (alignedSharedRowPacket X hcenter)) :
    ∃ P : AnchoredProvenanceF2NormalForm W R A X hcenter,
      ∃ K : AnchoredSupportHeavyCoupling W R A X hcenter P,
        AnchoredF2SupportHeavyResidual W R A X hcenter P K := by
  let P := anchoredProvenanceF2NormalForm
    W R A X hcenter hXOff hqSurplus profile
  rcases nonempty_anchoredSupportHeavyCoupling
      W R A X hcenter P reduction with ⟨K⟩
  refine ⟨P, K, ?_⟩
  rcases K.named.nonempty_globalK4FourWay with ⟨Q⟩
  rcases Q with Q | Q | Q | Q
  · exact .repeatedCommonDeletion Q
  · let G := exactPairOfQDeletedQCritical Q
    rcases routedContinuationBranch D S W.H G.toTwoContinuationRows with
      hcross | hnon | heq
    · exact .qDeletedQCriticalCross Q (by simpa [G] using hcross)
    · exact .qDeletedQCriticalNonEquilateral Q (by simpa [G] using hnon)
    · exact .qDeletedQCriticalEquilateral Q (by simpa [G] using heq)
  · let G := exactPairOfQCriticalQDeleted Q
    rcases routedContinuationBranch D S W.H G.toTwoContinuationRows with
      hcross | hnon | heq
    · exact .qCriticalQDeletedCross Q (by simpa [G] using hcross)
    · exact .qCriticalQDeletedNonEquilateral Q (by simpa [G] using hnon)
    · exact .qCriticalQDeletedEquilateral Q (by simpa [G] using heq)
  · exact .bothQCriticalCross Q
      (crossSurvivalOutput_of_bothQCritical K Q)

set_option linter.unusedVariables false in
/-- Motive-valued handler for the eight exact residuals.  At `Goal := False`,
each field is a genuine remaining mathematical producer obligation. -/
structure AnchoredF2SupportHeavyEliminator
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P₀ W.H)
    (A : AnchoredSourceCriticalTransition R)
    (X : RowExternalCommonDeletionSource A)
    (hcenter : R.firstCenter = p)
    (P : AnchoredProvenanceF2NormalForm W R A X hcenter)
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P)
    (Goal : Prop) : Prop where
  repeatedCommonDeletion :
    BothQDeletedCase K.named → Goal
  qDeletedQCriticalCross :
    ∀ Q : QDeletedQCriticalCase K.named,
      CrossSurvivalOutput
        (exactPairOfQDeletedQCritical Q).toTwoContinuationRows →
      Goal
  qDeletedQCriticalNonEquilateral :
    ∀ Q : QDeletedQCriticalCase K.named,
      NonEquilateralOutput W.H
        (exactPairOfQDeletedQCritical Q).toTwoContinuationRows →
      Goal
  qDeletedQCriticalEquilateral :
    ∀ Q : QDeletedQCriticalCase K.named,
      (exactPairOfQDeletedQCritical Q).toTwoContinuationRows.EquilateralResidual →
      Goal
  qCriticalQDeletedCross :
    ∀ Q : QCriticalQDeletedCase K.named,
      CrossSurvivalOutput
        (exactPairOfQCriticalQDeleted Q).toTwoContinuationRows →
      Goal
  qCriticalQDeletedNonEquilateral :
    ∀ Q : QCriticalQDeletedCase K.named,
      NonEquilateralOutput W.H
        (exactPairOfQCriticalQDeleted Q).toTwoContinuationRows →
      Goal
  qCriticalQDeletedEquilateral :
    ∀ Q : QCriticalQDeletedCase K.named,
      (exactPairOfQCriticalQDeleted Q).toTwoContinuationRows.EquilateralResidual →
      Goal
  bothQCriticalCross :
    ∀ Q : BothQCriticalCase K.named,
      CrossSurvivalOutput
        (exactGeneratedPairOfBothQCritical Q).toTwoContinuationRows →
      Goal

/-- Apply the exact residual handler. -/
theorem AnchoredF2SupportHeavyEliminator.eliminate
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
    {K : AnchoredSupportHeavyCoupling W R A X hcenter P}
    {Goal : Prop}
    (E : AnchoredF2SupportHeavyEliminator
      W R A X hcenter P K Goal)
    (H : AnchoredF2SupportHeavyResidual
      W R A X hcenter P K) :
    Goal := by
  rcases H with Q | ⟨Q, h⟩ | ⟨Q, h⟩ | ⟨Q, h⟩ |
      ⟨Q, h⟩ | ⟨Q, h⟩ | ⟨Q, h⟩ | ⟨Q, h⟩
  · exact E.repeatedCommonDeletion Q
  · exact E.qDeletedQCriticalCross Q h
  · exact E.qDeletedQCriticalNonEquilateral Q h
  · exact E.qDeletedQCriticalEquilateral Q h
  · exact E.qCriticalQDeletedCross Q h
  · exact E.qCriticalQDeletedNonEquilateral Q h
  · exact E.qCriticalQDeletedEquilateral Q h
  · exact E.bothQCriticalCross Q h

/-- Coordinator-facing eliminator: the packet bridge, anchored provenance
lift, support-heavy coupling, four-way split, mixed metric routing, and
both-q-critical metric contradiction are all discharged before callbacks
are requested. -/
theorem eliminate_anchoredF2SupportHeavy
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P₀ W.H)
    (A : AnchoredSourceCriticalTransition R)
    (X : RowExternalCommonDeletionSource A)
    (hcenter : R.firstCenter = p)
    (hXOff : X.point ∉ S.surplusCap)
    (hqSurplus : q ∈ S.surplusCap)
    {Goal : Prop}
    (handlers :
      ∀ (P : AnchoredProvenanceF2NormalForm W R A X hcenter)
        (K : AnchoredSupportHeavyCoupling W R A X hcenter P),
        AnchoredF2SupportHeavyEliminator
          W R A X hcenter P K Goal)
    (profile : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S
      (alignedSharedRowPacket X hcenter))
    (reduction : F2SupportHeavyReduction S W
      (alignedSharedRowPacket X hcenter)) :
    Goal := by
  rcases anchoredF2SupportHeavyResidual
      W R A X hcenter hXOff hqSurplus profile reduction with ⟨P, K, H⟩
  exact (handlers P K).eliminate H

/-- Native anchored-origin handler.

Unlike the generic packet eliminator, the aligned branch is classified
directly on `alignedSharedRowPacket`.  This is the surface required by the
provenance-bearing F2 reductions and avoids a dependent cast through
`commonDeletionAtLiveCenter`. -/
structure AnchoredNativeRCommonDeletionEliminator
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    (A : AnchoredSourceCriticalTransition R)
    (X : RowExternalCommonDeletionSource A)
    (Goal : Prop) : Prop where
  unaligned :
    R.firstCenter ≠ p → Goal
  aligned :
    ∀ hcenter : R.firstCenter = p,
      AlignedRCommonDeletionEliminator
        S W (alignedSharedRowPacket X hcenter) Goal

/-- Apply the native anchored-origin alignment split and exact finite
classifier. -/
theorem AnchoredNativeRCommonDeletionEliminator.eliminate
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {Goal : Prop}
    (E : AnchoredNativeRCommonDeletionEliminator S W A X Goal)
    (hqSurplus : q ∈ S.surplusCap) :
    Goal := by
  by_cases hcenter : R.firstCenter = p
  · exact (E.aligned hcenter).eliminate
      (alignedRCommonDeletionBranch
        S W (alignedSharedRowPacket X hcenter) hqSurplus)
  · exact E.unaligned hcenter

set_option linter.unusedVariables false in
/-- Origin-complete eliminator with a native anchored branch.

Reciprocal and spent packets continue to use the generic packet classifier.
Only the anchored origin needs the source-faithful native packet surface. -/
structure NativeOriginTaggedRCommonDeletionEliminator
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    {radius : ℝ}
    (F : CriticalPairFrontier D S radius W.H)
    (Goal : Prop) : Prop where
  anchored :
    ∀ {T : FixedSingleFrontierRadiusTerminal F}
      {P : AmbientRobustHistoryPair D S T.terminal.carrier radius}
      (source_eq : P.x = F.pair.q)
      {R : CoherentRCommonDeletionPacket T.terminal P W.H}
      (A : AnchoredSourceCriticalTransition R)
      (X : RowExternalCommonDeletionSource A)
      (fresh_off_surplus : X.point ∉ S.surplusCap),
      AnchoredNativeRCommonDeletionEliminator S W A X Goal
  reciprocal :
    ∀ {T : FixedSingleFrontierRadiusTerminal F}
      {P : AmbientRobustHistoryPair D S T.terminal.carrier radius}
      (source_eq : P.x = F.pair.q)
      {R : CoherentRCommonDeletionPacket T.terminal P W.H}
      (X : ReciprocalDirectedCrossResidual R)
      (G : ReciprocalCommonDeletionContinuation X),
      RCommonDeletionEliminator S W G.packet Goal
  spent :
    ∀ (E : FrontierRadiusSpentAtEntry F)
      (C : CommonDeletionTwoCenterPacket
        D W.H F.pair.q S.oppApex1 S.oppApex2),
      RCommonDeletionEliminator S W C Goal

/-- Eliminate an origin-tagged packet while retaining the native anchored
packet through its aligned F2 branches. -/
theorem NativeOriginTaggedRCommonDeletionEliminator.eliminate
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {radius : ℝ}
    {F : CriticalPairFrontier D S radius W.H}
    {Goal : Prop}
    (E : NativeOriginTaggedRCommonDeletionEliminator S W F Goal)
    (hqSurplus : q ∈ S.surplusCap)
    (O : OriginTaggedRCommonDeletion S W F) :
    Goal := by
  rcases O with ⟨deleted, center₁, C, origin⟩
  rcases origin with
    ⟨hsource, A, X, hXOff⟩ | ⟨hsource, X, G⟩ | ⟨Espent, Cspent⟩
  · exact (E.anchored hsource A X hXOff).eliminate hqSurplus
  · exact (E.reciprocal hsource X G).eliminate hqSurplus
  · exact (E.spent Espent Cspent).eliminate hqSurplus

/-- Full source-current coordinator eliminator using the native anchored
packet surface. -/
structure NativeOriginTaggedCoordinatorEliminator
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    {radius : ℝ}
    (F : CriticalPairFrontier D S radius W.H)
    (Goal : Prop) : Prop where
  originalUnique :
    OriginalUniqueRadiusArm F → Goal
  commonDeletion :
    NativeOriginTaggedRCommonDeletionEliminator S W F Goal
  swappedUniqueFour :
    Nonempty (SwappedFirstApexUniqueFourFrontier D S W.H) → Goal

/-- Consume the source-current coordinator without casting the anchored
common-deletion packet away from its provenance-bearing representation. -/
theorem NativeOriginTaggedCoordinatorEliminator.eliminate
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {radius : ℝ}
    {F : CriticalPairFrontier D S radius W.H}
    {Goal : Prop}
    (E : NativeOriginTaggedCoordinatorEliminator S W F Goal)
    (N : OriginTaggedCurrentFirstApexFixedRadiusNormalForm S W F) :
    Goal := by
  rcases N.outcome with hunique | hcommon | hswapped
  · exact E.originalUnique hunique
  · rcases hcommon with ⟨O⟩
    exact E.commonDeletion.eliminate N.q_mem_surplus O
  · exact E.swappedUniqueFour hswapped

#print axioms anchoredF2SupportHeavyResidual
#print axioms AnchoredF2SupportHeavyEliminator.eliminate
#print axioms eliminate_anchoredF2SupportHeavy
#print axioms AnchoredNativeRCommonDeletionEliminator.eliminate
#print axioms NativeOriginTaggedRCommonDeletionEliminator.eliminate
#print axioms NativeOriginTaggedCoordinatorEliminator.eliminate

end ATailRAnchoredF2SupportHeavyHandlerScratch
end Problem97
