/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DirectOuterThreeFamilySatisfaction
import DirectCriticalComponentSatisfaction
import DirectResidual55Satisfaction
import P4RadiusPartitionOccurrenceBridge.Main
import P4RowAtLeastFourOccurrenceBridge.Main
import P4RowRadiusOccurrenceBridge.Orientation
import P4OccurrenceClosure.MutualTransport.Orientation
import P4OccurrenceClosure.CyclicAlternation.Main
import P4OccurrenceClosure.Kalmanson.Main
import P4CertificateLedgerClosure

/-!
# P4 full compact-ledger source satisfaction

This file joins the source-faithful satisfaction theorems for all twelve
authenticated P4 compact-ledger slices.  A native equality check authenticates
that the resulting 19,048 clauses cover the exact checkpoint-0 ledger.
-/

namespace Problem97.P4DirectOuterValuationScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open P4Cegar6OccurrenceBridgeScratch
open P4CriticalSupportOccurrenceBridgeScratch
open P4DirectOuterArcAdapterScratch
open P4RightCapSourceBridgeScratch
open P4StrictUnitSourceBridgeScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

private def radiusPartitionAgreement
    (Q : DirectSource R profile distribution) :
    P4RadiusPartitionOccurrenceBridgeScratch.CoreValAgreement
      Q.packet (directTotalVal Q) where
  row := by
    intro center point hne
    change directTotalVal Q (rowVariable center point) ↔
      rowMem Q.packet.core directIndex center point
    exact (directValAgreement Q).row center point hne
  radius := by
    intro center left right hlr hlc hrc
    change directTotalVal Q (radiusVariable center left right) ↔
      radiusEq Q.packet.core directIndex center left right
    exact (directValAgreement Q).radius center left right hlr hlc hrc

private def rowAtLeastFourAgreement
    (Q : DirectSource R profile distribution) :
    P4RowAtLeastFourOccurrenceBridgeScratch.CoreValAgreement
      Q.packet (directTotalVal Q) where
  row := by
    intro center point hne
    change directTotalVal Q (rowVariable center point) ↔
      rowMem Q.packet.core directIndex center point
    exact (directValAgreement Q).row center point hne

private def rowRadiusAgreement
    (Q : DirectSource R profile distribution) :
    P4RowRadiusOccurrenceBridgeScratch.CoreValAgreement
      Q.packet.core directIndex (directTotalVal Q) where
  row := by
    intro center point hne
    change directTotalVal Q (rowVariable center point) ↔
      rowMem Q.packet.core directIndex center point
    exact (directValAgreement Q).row center point hne
  radius := by
    intro center left right hlr hlc hrc
    change directTotalVal Q (radiusVariable center left right) ↔
      radiusEq Q.packet.core directIndex center left right
    exact (directValAgreement Q).radius center left right hlr hlc hrc

private def mutualTransportAgreement
    (Q : DirectSource R profile distribution) :
    P4MutualTransportOccurrenceBridgeScratch.CoreValAgreement
      Q.packet.core directIndex (directTotalVal Q) where
  row := by
    intro center point hne
    change directTotalVal Q (rowVariable center point) ↔
      rowMem Q.packet.core directIndex center point
    exact (directValAgreement Q).row center point hne
  radius := by
    intro center left right hlr hlc hrc
    change directTotalVal Q (radiusVariable center left right) ↔
      radiusEq Q.packet.core directIndex center left right
    exact (directValAgreement Q).radius center left right hlr hlc hrc

private def cyclicAlternationAgreement
    (Q : DirectSource R profile distribution) :
    P4CyclicAlternationOccurrenceBridgeScratch.CoreValAgreement
      Q.packet (directTotalVal Q) where
  row := by
    intro center point hne
    change directTotalVal Q (rowVariable center point) ↔
      rowMem Q.packet.core directIndex center point
    exact (directValAgreement Q).row center point hne
  radius := by
    intro center left right hlr hlc hrc
    change directTotalVal Q (radiusVariable center left right) ↔
      radiusEq Q.packet.core directIndex center left right
    exact (directValAgreement Q).radius center left right hlr hlc hrc

def p4SourceClauses : List (List Int) :=
  P4RadiusPartitionOccurrenceBridgeScratch.bridgeClauses ++
  (P4RowRadiusOccurrenceBridgeScratch.bridgeClauses ++
    (P4RowAtLeastFourOccurrenceBridgeScratch.bridgeClauses ++
      (P4MutualTransportOccurrenceBridgeScratch.bridgeClauses ++
        (P4CyclicAlternationOccurrenceBridgeScratch.bridgeClauses ++
          (bridgeEntries.map BridgeEntry.clause ++
            (residual55Entries.map NonKalmansonEntry.clause ++
              (strictUnitClauses ++
                (rightCapOccurrences.map RightCapOccurrence.clause ++
                  (P4KalmansonOccurrenceBridgeScratch.bridgeClauses ++
                    (directOuterThreeFamilyCompactClauses ++
                      cegarEntries.map CegarEntry.clause))))))))))

set_option maxRecDepth 100000 in
theorem p4SourceClauses_length : p4SourceClauses.length = 19048 := by
  native_decide

def normalizeClause (clause : List Int) : List Int :=
  clause.mergeSort fun left right => decide (left < right)

set_option maxRecDepth 100000 in
theorem p4CompactLedger_normalized_mem_p4SourceClauses :
    ∀ clause ∈ P4ExactTwoCertificateClosureScratch.p4CompactLedger,
      normalizeClause clause ∈ p4SourceClauses.map normalizeClause := by
  native_decide

set_option maxRecDepth 100000 in
theorem p4SourceClauses_normalized_mem_p4CompactLedger :
    ∀ clause ∈ p4SourceClauses,
      normalizeClause clause ∈
        P4ExactTwoCertificateClosureScratch.p4CompactLedger.map normalizeClause := by
  native_decide

theorem directTotalVal_radiusPartitionClauses_sat
    (Q : DirectSource R profile distribution) :
    ∀ clause ∈ P4RadiusPartitionOccurrenceBridgeScratch.bridgeClauses,
      P5OccurrenceBridgeScratch.clauseSat (directTotalVal Q) clause :=
  P4RadiusPartitionOccurrenceBridgeScratch.bridgeClauses_sat
    Q.packet (radiusPartitionAgreement Q)

theorem directTotalVal_rowRadiusClauses_sat
    (Q : DirectSource R profile distribution) :
    ∀ clause ∈ P4RowRadiusOccurrenceBridgeScratch.bridgeClauses,
      P5OccurrenceBridgeScratch.clauseSat (directTotalVal Q) clause :=
  P4RowRadiusOccurrenceBridgeScratch.bridgeClauses_sat_direct
    Q.packet (rowRadiusAgreement Q)

theorem directTotalVal_rowAtLeastFourClauses_sat
    (Q : DirectSource R profile distribution) :
    ∀ clause ∈ P4RowAtLeastFourOccurrenceBridgeScratch.bridgeClauses,
      P5OccurrenceBridgeScratch.clauseSat (directTotalVal Q) clause :=
  P4RowAtLeastFourOccurrenceBridgeScratch.bridgeClauses_sat
    Q.packet (rowAtLeastFourAgreement Q)

theorem directTotalVal_mutualTransportClauses_sat
    (Q : DirectSource R profile distribution) :
    ∀ clause ∈ P4MutualTransportOccurrenceBridgeScratch.bridgeClauses,
      P5OccurrenceBridgeScratch.clauseSat (directTotalVal Q) clause :=
  P4MutualTransportOccurrenceBridgeScratch.bridgeClauses_sat_direct
    Q.packet (mutualTransportAgreement Q)

theorem directTotalVal_cyclicAlternationClauses_sat
    (Q : DirectSource R profile distribution) :
    ∀ clause ∈ P4CyclicAlternationOccurrenceBridgeScratch.bridgeClauses,
      P5OccurrenceBridgeScratch.clauseSat (directTotalVal Q) clause :=
  P4CyclicAlternationOccurrenceBridgeScratch.bridgeClauses_sat
    Q.packet (cyclicAlternationAgreement Q)

theorem directTotalVal_kalmansonClauses_sat
    (Q : DirectSource R profile distribution) :
    ∀ clause ∈ P4KalmansonOccurrenceBridgeScratch.bridgeClauses,
      P5OccurrenceBridgeScratch.clauseSat (directTotalVal Q) clause :=
  P4KalmansonOccurrenceBridgeScratch.bridgeClauses_sat_direct
    Q.packet.core (mutualTransportAgreement Q)

private def literalIndex (literal : Int) : Nat :=
  if 0 ≤ literal then literal.toNat else (-literal).toNat

set_option maxRecDepth 100000 in
private theorem directOuterThreeFamily_literalIndex_lt :
    ∀ clause ∈ directOuterThreeFamilyCompactClauses,
      ∀ literal ∈ clause, literalIndex literal < 10000 := by
  native_decide

private theorem p5LitSat_directTotal_of_directVal
    (Q : DirectSource R profile distribution) {literal : Int}
    (hsmall : literalIndex literal < 10000)
    (hsat : P5OccurrenceBridgeScratch.litSat (directVal Q) literal) :
    P5OccurrenceBridgeScratch.litSat (directTotalVal Q) literal := by
  by_cases hnonnegative : 0 ≤ literal
  · simp only [P5OccurrenceBridgeScratch.litSat, if_pos hnonnegative] at hsat ⊢
    exact (directTotalVal_of_lt Q
      (by simpa [literalIndex, hnonnegative] using hsmall)).mpr hsat
  · simp only [P5OccurrenceBridgeScratch.litSat, if_neg hnonnegative] at hsat ⊢
    intro htotal
    exact hsat ((directTotalVal_of_lt Q
      (by simpa [literalIndex, hnonnegative] using hsmall)).mp htotal)

theorem directTotalVal_directOuterThreeFamilyClauses_sat
    (Q : DirectSource R profile distribution) :
    ∀ clause ∈ directOuterThreeFamilyCompactClauses,
      P5OccurrenceBridgeScratch.clauseSat (directTotalVal Q) clause := by
  intro clause hclause
  have hdirect : P5OccurrenceBridgeScratch.clauseSat (directVal Q) clause := by
    simpa [P4DirectRowArcOccurrenceBridgeScratch.clauseSat,
      P4DirectRowArcOccurrenceBridgeScratch.literalSat,
      P5OccurrenceBridgeScratch.clauseSat,
      P5OccurrenceBridgeScratch.litSat] using
      direct_outer_three_family_compact_sat Q clause hclause
  rcases hdirect with ⟨literal, hliteral, hsat⟩
  exact ⟨literal, hliteral, p5LitSat_directTotal_of_directVal Q
    (directOuterThreeFamily_literalIndex_lt clause hclause literal hliteral) hsat⟩

theorem directTotalVal_p4SourceClauses_sat
    (Q : DirectSource R profile distribution) :
    ∀ clause ∈ p4SourceClauses,
      P5OccurrenceBridgeScratch.clauseSat (directTotalVal Q) clause := by
  intro clause hclause
  unfold p4SourceClauses at hclause
  rcases List.mem_append.mp hclause with hfamily | hclause
  · exact directTotalVal_radiusPartitionClauses_sat Q clause hfamily
  rcases List.mem_append.mp hclause with hfamily | hclause
  · exact directTotalVal_rowRadiusClauses_sat Q clause hfamily
  rcases List.mem_append.mp hclause with hfamily | hclause
  · exact directTotalVal_rowAtLeastFourClauses_sat Q clause hfamily
  rcases List.mem_append.mp hclause with hfamily | hclause
  · exact directTotalVal_mutualTransportClauses_sat Q clause hfamily
  rcases List.mem_append.mp hclause with hfamily | hclause
  · exact directTotalVal_cyclicAlternationClauses_sat Q clause hfamily
  rcases List.mem_append.mp hclause with hfamily | hclause
  · rcases List.mem_map.mp hfamily with ⟨entry, hentry, rfl⟩
    exact directTotalVal_criticalBridge_sat Q entry hentry
  rcases List.mem_append.mp hclause with hfamily | hclause
  · rcases List.mem_map.mp hfamily with ⟨entry, hentry, rfl⟩
    exact directTotalVal_residual55Entries_sat Q entry hentry
  rcases List.mem_append.mp hclause with hfamily | hclause
  · exact directTotalVal_strictUnitClauses_sat Q clause hfamily
  rcases List.mem_append.mp hclause with hfamily | hclause
  · rcases List.mem_map.mp hfamily with ⟨entry, hentry, rfl⟩
    exact directTotalVal_rightCapOccurrences_sat Q entry hentry
  rcases List.mem_append.mp hclause with hfamily | hclause
  · exact directTotalVal_kalmansonClauses_sat Q clause hfamily
  rcases List.mem_append.mp hclause with hfamily | hclause
  · exact directTotalVal_directOuterThreeFamilyClauses_sat Q clause hfamily
  rcases List.mem_map.mp hclause with ⟨entry, hentry, rfl⟩
  exact directTotalVal_cegarEntries_sat Q entry hentry

private theorem p5ClauseSat_normalizeClause_iff
    (v : Nat → Prop) (clause : List Int) :
    P5OccurrenceBridgeScratch.clauseSat v (normalizeClause clause) ↔
      P5OccurrenceBridgeScratch.clauseSat v clause := by
  simp only [P5OccurrenceBridgeScratch.clauseSat, normalizeClause,
    List.mem_mergeSort]

theorem directTotalVal_p4CompactLedger_sat
    (Q : DirectSource R profile distribution) :
    ∀ clause ∈ P4ExactTwoCertificateClosureScratch.p4CompactLedger,
      P4ExactTwoCertificateClosureScratch.clauseSat
        (directTotalVal Q) clause := by
  intro clause hclause
  have hnormalized :=
    p4CompactLedger_normalized_mem_p4SourceClauses clause hclause
  rcases List.mem_map.mp hnormalized with
    ⟨sourceClause, hsourceClause, hnormalize⟩
  have hsource := directTotalVal_p4SourceClauses_sat
    Q sourceClause hsourceClause
  have hsourceNormalized :=
    (p5ClauseSat_normalizeClause_iff
      (directTotalVal Q) sourceClause).mpr hsource
  rw [hnormalize] at hsourceNormalized
  have hledger :=
    (p5ClauseSat_normalizeClause_iff
      (directTotalVal Q) clause).mp hsourceNormalized
  simpa [P4ExactTwoCertificateClosureScratch.clauseSat,
    P4ExactTwoCertificateClosureScratch.litSat,
    P5OccurrenceBridgeScratch.clauseSat,
    P5OccurrenceBridgeScratch.litSat] using hledger

theorem false_of_directSource
    (Q : DirectSource R profile distribution) : False :=
  P4ExactTwoCertificateClosureScratch.false_of_p4CompactLedger_sat
    (directTotalVal Q) (directTotalVal_p4CompactLedger_sat Q)

/-- Packet-facing terminal for the direct `(5,4,5)` exact-two branch. -/
theorem false_of_p4DirectBoundaryPacket
    (P : P4DirectBoundaryPacket R profile distribution) : False :=
  false_of_directSource ⟨P⟩

end Problem97.P4DirectOuterValuationScratch
