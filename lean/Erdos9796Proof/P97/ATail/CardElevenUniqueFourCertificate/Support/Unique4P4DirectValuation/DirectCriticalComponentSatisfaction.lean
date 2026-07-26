import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4DirectValuation.DirectIndexedAgreement
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4StrictUnitSourceBridge.P4StrictUnitResidual
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4Cegar6OccurrenceBridge.CegarFamilies

/-!
# Direct satisfaction of the non-colliding P4 compact components

These four component ledgers all consume the same total indexed valuation.
Together they account for 161 compact clauses: 132 critical/first-apex
entries, two strict units, 21 right-cap residuals, and six CEGAR entries.
-/

namespace Problem97.P4DirectOuterValuationScratch

open P4Cegar6OccurrenceBridgeScratch
open P4CriticalSupportOccurrenceBridgeScratch
open P4DirectOuterArcAdapterScratch
open P4RightCapSourceBridgeScratch
open P4StrictUnitSourceBridgeScratch
open P5IndexedSourceScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

theorem directTotalVal_criticalBridge_sat
    (Q : DirectSource R profile distribution) :
    ∀ entry ∈ bridgeEntries,
      P4CriticalSupportOccurrenceBridgeScratch.clauseSat
        (directTotalVal Q) entry.clause :=
  bridgeEntries_sat Q.packet.core directIndex rfl
    Function.injective_id Function.surjective_id (directValAgreement Q)

theorem directTotalVal_strictUnitClauses_sat
    (Q : DirectSource R profile distribution) :
    ∀ clause ∈ strictUnitClauses,
      P5OccurrenceBridgeScratch.clauseSat (directTotalVal Q) clause :=
  strictUnitClauses_sat Q.packet (directValAgreement Q)

theorem directTotalVal_rightCapOccurrences_sat
    (Q : DirectSource R profile distribution) :
    ∀ entry ∈ rightCapOccurrences,
      P5OccurrenceBridgeScratch.clauseSat (directTotalVal Q) entry.clause :=
  rightCapOccurrences_sat_of_valAgreement Q.packet (directValAgreement Q)

theorem directTotalVal_cegarEntries_sat
    (Q : DirectSource R profile distribution) :
    ∀ entry ∈ cegarEntries,
      P5OccurrenceBridgeScratch.clauseSat (directTotalVal Q) entry.clause :=
  cegarEntries_sat_direct Q.packet.core (directValAgreement Q)

end Problem97.P4DirectOuterValuationScratch
