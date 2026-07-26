import MirrorIndexedAgreement

#check @Problem97.P4MirrorValuationScratch.mirrorTotalVal_classVariable_iff_classHit

namespace Problem97.P4MirrorValuationScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open P4CriticalSupportOccurrenceBridgeScratch
open P4CompactAtomBindingScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
example (P : P4MirrorBoundaryPacket R profile distribution)
    (h : classHit P.core mirrorIndex 5) :
    mirrorTotalVal P (classVariable 5) := by
  rw [mirrorTotalVal_classVariable_iff_classHit
    (D := D) (S := S) (radius := radius) (H := H) (F := F)
    (R := R) (profile := profile) (distribution := distribution) P 5]
  exact h

end Problem97.P4MirrorValuationScratch
