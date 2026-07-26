import MirrorIndexedAgreement
import P4RowRadiusOccurrenceBridge.Orientation
import P4OccurrenceClosure.MutualTransport.Orientation
import P4OccurrenceClosure.Kalmanson.Main

/-!
# Indexed P4 ledger families under one reflected valuation

These four authenticated slices are already parametrized by an index
transport.  This module instantiates them all with `mirrorIndex` and the one
source-faithful valuation from `MirrorIndexedAgreement`.
-/

namespace Problem97.P4MirrorValuationScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open P4CriticalSupportOccurrenceBridgeScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

private def rowRadiusAgreement
    (P : P4MirrorBoundaryPacket R profile distribution) :
    P4RowRadiusOccurrenceBridgeScratch.CoreValAgreement
      P.core mirrorIndex (mirrorTotalVal P) where
  row := (mirrorValAgreement P).row
  radius := (mirrorValAgreement P).radius

private def mutualTransportAgreement
    (P : P4MirrorBoundaryPacket R profile distribution) :
    P4MutualTransportOccurrenceBridgeScratch.CoreValAgreement
      P.core mirrorIndex (mirrorTotalVal P) where
  row := (mirrorValAgreement P).row
  radius := (mirrorValAgreement P).radius

theorem mirrorTotalVal_rowRadiusClauses_sat
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ clause ∈ P4RowRadiusOccurrenceBridgeScratch.bridgeClauses,
      P5OccurrenceBridgeScratch.clauseSat (mirrorTotalVal P) clause :=
  P4RowRadiusOccurrenceBridgeScratch.bridgeClauses_sat_mirror
    P (rowRadiusAgreement P)

theorem mirrorTotalVal_mutualTransportClauses_sat
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ clause ∈ P4MutualTransportOccurrenceBridgeScratch.bridgeClauses,
      P5OccurrenceBridgeScratch.clauseSat (mirrorTotalVal P) clause :=
  P4MutualTransportOccurrenceBridgeScratch.bridgeClauses_sat_mirror
    P (mutualTransportAgreement P)

theorem mirrorTotalVal_kalmansonClauses_sat
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ clause ∈ P4KalmansonOccurrenceBridgeScratch.bridgeClauses,
      P5OccurrenceBridgeScratch.clauseSat (mirrorTotalVal P) clause :=
  P4KalmansonOccurrenceBridgeScratch.bridgeClauses_sat_mirror
    P.core (mutualTransportAgreement P)

private theorem mirrorIndex_surjective : Function.Surjective mirrorIndex := by
  intro point
  exact ⟨mirrorIndex point, by simp⟩

theorem mirrorTotalVal_criticalBridge_sat
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ entry ∈ bridgeEntries,
      P4CriticalSupportOccurrenceBridgeScratch.clauseSat
        (mirrorTotalVal P) entry.clause :=
  bridgeEntries_sat P.core mirrorIndex mirrorIndex_zero
    mirrorIndex_injective mirrorIndex_surjective (mirrorValAgreement P)

end Problem97.P4MirrorValuationScratch
