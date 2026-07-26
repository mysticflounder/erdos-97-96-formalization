import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4MirrorValuation.MirrorCoreFamilySatisfaction
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4MirrorValuation.MirrorCegar6Satisfaction
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4MirrorValuation.MirrorOuterFamilySatisfaction
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4MirrorValuation.MirrorResidual55Satisfaction
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4MirrorValuation.MirrorRightCap21Satisfaction
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4MirrorValuation.MirrorStrictUnitSatisfaction
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4DirectValuation.P4FullLedgerSatisfaction

/-!
# Assembly of the reflected P4 compact ledger

The source-wired mirror families, including residual-55, right-cap-21, and
CEGAR-6, account for all 19,048 checkpoint-0 clauses.
-/

namespace Problem97.P4MirrorValuationScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open P4Cegar6OccurrenceBridgeScratch
open P4CriticalSupportOccurrenceBridgeScratch
open P4DirectOuterValuationScratch
open P4MirrorOuterOccurrenceBridgeScratch
open P4RightCapSourceBridgeScratch
open P4StrictUnitSourceBridgeScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

private theorem p5ClauseSat_normalizeClause_iff
    (v : Nat → Prop) (clause : List Int) :
    P5OccurrenceBridgeScratch.clauseSat v
        (P4DirectOuterValuationScratch.normalizeClause clause) ↔
      P5OccurrenceBridgeScratch.clauseSat v clause := by
  simp only [P5OccurrenceBridgeScratch.clauseSat,
    P4DirectOuterValuationScratch.normalizeClause, List.mem_mergeSort]

set_option maxRecDepth 100000 in
theorem directOuterThreeFamilyClauses_normalized_mem_mirrorBridge :
    ∀ clause ∈ directOuterThreeFamilyCompactClauses,
      P4DirectOuterValuationScratch.normalizeClause clause ∈
        P4MirrorOuterOccurrenceBridgeScratch.bridgeClauses.map
          P4DirectOuterValuationScratch.normalizeClause := by
  native_decide

theorem mirrorTotalVal_directOuterThreeFamilyClauses_sat
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ clause ∈ directOuterThreeFamilyCompactClauses,
      P5OccurrenceBridgeScratch.clauseSat (mirrorTotalVal P) clause := by
  intro clause hclause
  have hnormalized :=
    directOuterThreeFamilyClauses_normalized_mem_mirrorBridge clause hclause
  rcases List.mem_map.mp hnormalized with
    ⟨mirrorClause, hmirrorClause, hnormalize⟩
  have hmirror :=
    mirrorOuterBridgeClauses_sat P mirrorClause hmirrorClause
  have hmirrorNormalized :=
    (p5ClauseSat_normalizeClause_iff
      (mirrorTotalVal P) mirrorClause).mpr hmirror
  rw [hnormalize] at hmirrorNormalized
  exact (p5ClauseSat_normalizeClause_iff
    (mirrorTotalVal P) clause).mp hmirrorNormalized

theorem mirrorTotalVal_p4SourceClauses_sat
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ clause ∈ p4SourceClauses,
      P5OccurrenceBridgeScratch.clauseSat (mirrorTotalVal P) clause := by
  intro clause hclause
  unfold p4SourceClauses at hclause
  rcases List.mem_append.mp hclause with hfamily | hclause
  · exact mirrorTotalVal_radiusPartitionClauses_sat P clause hfamily
  rcases List.mem_append.mp hclause with hfamily | hclause
  · exact mirrorTotalVal_rowRadiusClauses_sat P clause hfamily
  rcases List.mem_append.mp hclause with hfamily | hclause
  · exact mirrorTotalVal_rowAtLeastFourClauses_sat P clause hfamily
  rcases List.mem_append.mp hclause with hfamily | hclause
  · exact mirrorTotalVal_mutualTransportClauses_sat P clause hfamily
  rcases List.mem_append.mp hclause with hfamily | hclause
  · exact mirrorTotalVal_cyclicAlternationClauses_sat P clause hfamily
  rcases List.mem_append.mp hclause with hfamily | hclause
  · rcases List.mem_map.mp hfamily with ⟨entry, hentry, rfl⟩
    exact mirrorTotalVal_criticalBridge_sat P entry hentry
  rcases List.mem_append.mp hclause with hfamily | hclause
  · rcases List.mem_map.mp hfamily with ⟨entry, hentry, rfl⟩
    exact mirrorTotalVal_residual55Entries_sat P entry hentry
  rcases List.mem_append.mp hclause with hfamily | hclause
  · exact mirrorTotalVal_strictUnitClauses_sat P clause hfamily
  rcases List.mem_append.mp hclause with hfamily | hclause
  · rcases List.mem_map.mp hfamily with ⟨entry, hentry, rfl⟩
    exact mirrorTotalVal_rightCapOccurrences_sat P entry hentry
  rcases List.mem_append.mp hclause with hfamily | hclause
  · exact mirrorTotalVal_kalmansonClauses_sat P clause hfamily
  rcases List.mem_append.mp hclause with hfamily | hclause
  · exact mirrorTotalVal_directOuterThreeFamilyClauses_sat P clause hfamily
  rcases List.mem_map.mp hclause with ⟨entry, hentry, rfl⟩
  exact mirrorTotalVal_cegarEntries_sat P entry hentry

theorem mirrorTotalVal_p4CompactLedger_sat
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ clause ∈ P4ExactTwoCertificateClosureScratch.p4CompactLedger,
      P4ExactTwoCertificateClosureScratch.clauseSat
        (mirrorTotalVal P) clause := by
  intro clause hclause
  have hnormalized :=
    p4CompactLedger_normalized_mem_p4SourceClauses clause hclause
  rcases List.mem_map.mp hnormalized with
    ⟨sourceClause, hsourceClause, hnormalize⟩
  have hsource :=
    mirrorTotalVal_p4SourceClauses_sat P sourceClause hsourceClause
  have hsourceNormalized :=
    (p5ClauseSat_normalizeClause_iff
      (mirrorTotalVal P) sourceClause).mpr hsource
  rw [hnormalize] at hsourceNormalized
  have hledger :=
    (p5ClauseSat_normalizeClause_iff
      (mirrorTotalVal P) clause).mp hsourceNormalized
  simpa [P4ExactTwoCertificateClosureScratch.clauseSat,
    P4ExactTwoCertificateClosureScratch.litSat,
    P5OccurrenceBridgeScratch.clauseSat,
    P5OccurrenceBridgeScratch.litSat] using hledger

theorem false_of_p4MirrorBoundaryPacket
    (P : P4MirrorBoundaryPacket R profile distribution) : False :=
  P4ExactTwoCertificateClosureScratch.false_of_p4CompactLedger_sat
    (mirrorTotalVal P)
    (mirrorTotalVal_p4CompactLedger_sat P)

end Problem97.P4MirrorValuationScratch
