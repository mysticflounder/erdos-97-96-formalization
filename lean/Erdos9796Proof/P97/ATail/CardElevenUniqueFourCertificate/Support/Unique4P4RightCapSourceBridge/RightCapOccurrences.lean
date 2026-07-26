/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4RightCapSourceBridge.P4RightCapSourceBridge
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4CriticalSupportOccurrenceBridge.Families

/-!
# Direct materialization of the P4 right-cap residual occurrences

The compact P4 occurrence ledger contains 24 cap-2 occurrences.  Six are
already in `Residual55Data`: the three triples not containing role `7` and the
three endpoint-`0` pairs not containing role `7`.  This module materializes
the other 18 cap-2 clauses, together with the three cap-1 endpoint-`7`
clauses.  Every listed compact literal is proved directly from `ValAgreement`
and the two direct source theorems in `P4RightCapSourceBridge`.

The static output/core pairs are authenticated against the same compact
formula, occurrence-ledger, and source-core-map digests recorded by
`GeneratedData.lean`.
-/

namespace Problem97
namespace P4RightCapSourceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open P5IndexedSourceScratch
open P4CriticalSupportOccurrenceBridgeScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}

/-- The right-cap residual only reads compact selected-row variables.  Keeping
this agreement separate from the broader five-field `ValAgreement` lets a
source-faithful valuation discharge this finite package without inventing
meanings for unrelated compact atom families. -/
structure RowValAgreement (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (v : Nat → Prop) : Prop where
  row : ∀ center point : Label, center ≠ point →
    (v (rowVariable center point) ↔ rowMem Q σ center point)

/-- The three source-ledger families represented by the direct cap bridge. -/
inductive RightCapFamily where
  | selectedRowEndpointOwnCapAtMostOne1
  | selectedRowOwnCapAtMostTwo2
  | selectedRowEndpointOwnCapAtMostOne2
deriving DecidableEq

/-- The source parameters, preserving the compact ledger's literal order. -/
inductive RightCapShape where
  | shortEndpoint (center left right : Label)
  | endpoint (center left right : Label)
  | ownCap (center first second third : Label)
deriving DecidableEq

def RightCapShape.family : RightCapShape → RightCapFamily
  | .shortEndpoint .. => .selectedRowEndpointOwnCapAtMostOne1
  | .endpoint .. => .selectedRowEndpointOwnCapAtMostOne2
  | .ownCap .. => .selectedRowOwnCapAtMostTwo2

def RightCapShape.literals : RightCapShape → List Int
  | .shortEndpoint center left right =>
      [-(rowVariable center left : Int), -(rowVariable center right : Int)]
  | .endpoint center left right =>
      [-(rowVariable center left : Int), -(rowVariable center right : Int)]
  | .ownCap center first second third =>
      [-(rowVariable center first : Int), -(rowVariable center second : Int),
        -(rowVariable center third : Int)]

/-- A compact occurrence together with its exact source-ledger provenance. -/
structure RightCapOccurrence where
  outputClause : Nat
  sourceCoreClause : Nat
  sourceTerminalClause : Nat
  sourceFamily : RightCapFamily
  sourceCoreLiterals : List Int
  sourceTerminalLiterals : List Int
  shape : RightCapShape
  clause : List Int
deriving DecidableEq

def rightCapShapeWF : RightCapShape → Bool
  | .shortEndpoint center left right =>
      decide (center ∈ shortCapEndpoints ∧ left ∈ shortCapPositions ∧
        right ∈ shortCapPositions ∧ left ≠ center ∧ right ≠ center ∧ left ≠ right)
  | .endpoint center left right =>
      decide (center ∈ rightCapEndpoints ∧ left ∈ rightCapPositions ∧
        right ∈ rightCapPositions ∧ left ≠ center ∧ right ≠ center ∧ left ≠ right)
  | .ownCap center first second third =>
      decide (center ∈ rightCapPositions ∧ first ∈ rightCapPositions ∧
        second ∈ rightCapPositions ∧ third ∈ rightCapPositions ∧ first ≠ center ∧
        second ≠ center ∧ third ≠ center ∧ first ≠ second ∧ first ≠ third ∧ second ≠ third)

def rightCapOccurrenceWF (entry : RightCapOccurrence) : Bool :=
  decide (entry.clause = entry.shape.literals) && rightCapShapeWF entry.shape

def rightCapOccurrenceProvenanceWF (entry : RightCapOccurrence) : Bool :=
  decide (entry.sourceFamily = entry.shape.family) &&
    decide (entry.sourceCoreLiterals.length = entry.clause.length) &&
    decide (entry.sourceTerminalLiterals.length = entry.clause.length)

/-- The 21 non-generic direct-P4 right-cap occurrences in the compact ledger.

The omitted cap-2 output indices are `8407`, `8411`, `8415`, and `8426`--`8428`:
they are exactly the six generic entries already authenticated by `Residual55Data`.
-/
def rightCapOccurrences : List RightCapOccurrence := [
  { outputClause := 8402, sourceCoreClause := 29626, sourceTerminalClause := 2598191,
    sourceFamily := .selectedRowEndpointOwnCapAtMostOne1,
    sourceCoreLiterals := [-83, -82], sourceTerminalLiterals := [-82, -83],
    shape := .shortEndpoint 7 5 4, clause := [-76, -75] },
  { outputClause := 8403, sourceCoreClause := 29627, sourceTerminalClause := 2598192,
    sourceFamily := .selectedRowEndpointOwnCapAtMostOne1,
    sourceCoreLiterals := [-84, -82], sourceTerminalLiterals := [-82, -84],
    shape := .shortEndpoint 7 6 4, clause := [-77, -75] },
  { outputClause := 8404, sourceCoreClause := 29628, sourceTerminalClause := 2598193,
    sourceFamily := .selectedRowEndpointOwnCapAtMostOne1,
    sourceCoreLiterals := [-84, -83], sourceTerminalLiterals := [-83, -84],
    shape := .shortEndpoint 7 6 5, clause := [-77, -76] },
  { outputClause := 8405, sourceCoreClause := 29629, sourceTerminalClause := 2598202,
    sourceFamily := .selectedRowOwnCapAtMostTwo2,
    sourceCoreLiterals := [-98, -96, -89], sourceTerminalLiterals := [-89, -96, -98],
    shape := .ownCap 8 9 7 0, clause := [-89, -88, -81] },
  { outputClause := 8406, sourceCoreClause := 29630, sourceTerminalClause := 2598203,
    sourceFamily := .selectedRowOwnCapAtMostTwo2,
    sourceCoreLiterals := [-96, -99, -89], sourceTerminalLiterals := [-89, -96, -99],
    shape := .ownCap 8 7 10 0, clause := [-88, -90, -81] },
  { outputClause := 8408, sourceCoreClause := 29632, sourceTerminalClause := 2598205,
    sourceFamily := .selectedRowOwnCapAtMostTwo2,
    sourceCoreLiterals := [-96, -98, -99], sourceTerminalLiterals := [-96, -98, -99],
    shape := .ownCap 8 7 9 10, clause := [-88, -89, -90] },
  { outputClause := 8409, sourceCoreClause := 29633, sourceTerminalClause := 2598206,
    sourceFamily := .selectedRowOwnCapAtMostTwo2,
    sourceCoreLiterals := [-107, -108, -100], sourceTerminalLiterals := [-100, -107, -108],
    shape := .ownCap 9 7 8 0, clause := [-98, -99, -91] },
  { outputClause := 8410, sourceCoreClause := 29634, sourceTerminalClause := 2598207,
    sourceFamily := .selectedRowOwnCapAtMostTwo2,
    sourceCoreLiterals := [-107, -110, -100], sourceTerminalLiterals := [-100, -107, -110],
    shape := .ownCap 9 7 10 0, clause := [-98, -100, -91] },
  { outputClause := 8412, sourceCoreClause := 29636, sourceTerminalClause := 2598209,
    sourceFamily := .selectedRowOwnCapAtMostTwo2,
    sourceCoreLiterals := [-107, -110, -108], sourceTerminalLiterals := [-107, -108, -110],
    shape := .ownCap 9 7 10 8, clause := [-98, -100, -99] },
  { outputClause := 8413, sourceCoreClause := 29637, sourceTerminalClause := 2598210,
    sourceFamily := .selectedRowOwnCapAtMostTwo2,
    sourceCoreLiterals := [-118, -119, -111], sourceTerminalLiterals := [-111, -118, -119],
    shape := .ownCap 10 7 8 0, clause := [-108, -109, -101] },
  { outputClause := 8414, sourceCoreClause := 29638, sourceTerminalClause := 2598211,
    sourceFamily := .selectedRowOwnCapAtMostTwo2,
    sourceCoreLiterals := [-118, -120, -111], sourceTerminalLiterals := [-111, -118, -120],
    shape := .ownCap 10 7 9 0, clause := [-108, -110, -101] },
  { outputClause := 8416, sourceCoreClause := 29640, sourceTerminalClause := 2598213,
    sourceFamily := .selectedRowOwnCapAtMostTwo2,
    sourceCoreLiterals := [-118, -119, -120], sourceTerminalLiterals := [-118, -119, -120],
    shape := .ownCap 10 7 8 9, clause := [-108, -109, -110] },
  { outputClause := 8417, sourceCoreClause := 29641, sourceTerminalClause := 2598214,
    sourceFamily := .selectedRowEndpointOwnCapAtMostOne2,
    sourceCoreLiterals := [-86, -78], sourceTerminalLiterals := [-78, -86],
    shape := .endpoint 7 8 0, clause := [-78, -71] },
  { outputClause := 8418, sourceCoreClause := 29642, sourceTerminalClause := 2598215,
    sourceFamily := .selectedRowEndpointOwnCapAtMostOne2,
    sourceCoreLiterals := [-87, -78], sourceTerminalLiterals := [-78, -87],
    shape := .endpoint 7 9 0, clause := [-79, -71] },
  { outputClause := 8419, sourceCoreClause := 29643, sourceTerminalClause := 2598216,
    sourceFamily := .selectedRowEndpointOwnCapAtMostOne2,
    sourceCoreLiterals := [-88, -78], sourceTerminalLiterals := [-78, -88],
    shape := .endpoint 7 10 0, clause := [-80, -71] },
  { outputClause := 8420, sourceCoreClause := 29644, sourceTerminalClause := 2598217,
    sourceFamily := .selectedRowEndpointOwnCapAtMostOne2,
    sourceCoreLiterals := [-87, -86], sourceTerminalLiterals := [-86, -87],
    shape := .endpoint 7 9 8, clause := [-79, -78] },
  { outputClause := 8421, sourceCoreClause := 29645, sourceTerminalClause := 2598218,
    sourceFamily := .selectedRowEndpointOwnCapAtMostOne2,
    sourceCoreLiterals := [-88, -86], sourceTerminalLiterals := [-86, -88],
    shape := .endpoint 7 10 8, clause := [-80, -78] },
  { outputClause := 8422, sourceCoreClause := 29646, sourceTerminalClause := 2598219,
    sourceFamily := .selectedRowEndpointOwnCapAtMostOne2,
    sourceCoreLiterals := [-88, -87], sourceTerminalLiterals := [-87, -88],
    shape := .endpoint 7 10 9, clause := [-80, -79] },
  { outputClause := 8423, sourceCoreClause := 29647, sourceTerminalClause := 2598220,
    sourceFamily := .selectedRowEndpointOwnCapAtMostOne2,
    sourceCoreLiterals := [-8, -9], sourceTerminalLiterals := [-8, -9],
    shape := .endpoint 0 7 8, clause := [-7, -8] },
  { outputClause := 8424, sourceCoreClause := 29648, sourceTerminalClause := 2598221,
    sourceFamily := .selectedRowEndpointOwnCapAtMostOne2,
    sourceCoreLiterals := [-10, -8], sourceTerminalLiterals := [-8, -10],
    shape := .endpoint 0 9 7, clause := [-9, -7] },
  { outputClause := 8425, sourceCoreClause := 29649, sourceTerminalClause := 2598222,
    sourceFamily := .selectedRowEndpointOwnCapAtMostOne2,
    sourceCoreLiterals := [-11, -8], sourceTerminalLiterals := [-8, -11],
    shape := .endpoint 0 10 7, clause := [-10, -7] }
]

/-- The 21 occurrences have the expected direct source domains and exact compact literals. -/
theorem rightCapOccurrences_wf : rightCapOccurrences.all rightCapOccurrenceWF = true := by decide

/-- Every stored row preserves its source family and literal arities.  The exact
indices and literals are emitted by `materialize_right_cap_residual_ledger.py`. -/
theorem rightCapOccurrences_provenance_wf :
    rightCapOccurrences.all rightCapOccurrenceProvenanceWF = true := by decide

/-- The direct bridge materializes exactly the 18 non-generic cap-2 clauses and three cap-1 clauses. -/
theorem rightCapOccurrences_length : rightCapOccurrences.length = 21 := by decide

/-- Stable digests that bind the static occurrence data to the compact source artifacts. -/
theorem rightCapOccurrences_authenticated :
    (compactFormulaSha256 = "449cea2217bf144caafdd2dadb2ae7083d7ca34816bd226c2ab776f52ea58dae") ∧
    (occurrenceLedgerSha256 = "b1c159058e659cbd06c4540e72e2ca94eef0ef27602733db0bc44122dcdb4aac") ∧
    (sourceCoreMapSha256 = "af829a7c99e0f969f410d398d7c32c2ba5dd945f3a7ebb2ef3f8d7679633d64b") := by
  exact ⟨rfl, rfl, rfl⟩

private theorem shortEndpointSat
    (P : P4DirectBoundaryPacket R profile distribution) {v : Nat → Prop}
    (hv : RowValAgreement P.core directIndex v) (center left right : Label)
    (hcenter : center ∈ shortCapEndpoints) (hleft : left ∈ shortCapPositions)
    (hright : right ∈ shortCapPositions) (hleftCenter : left ≠ center)
    (hrightCenter : right ≠ center) (hleftRight : left ≠ right) :
    P5OccurrenceBridgeScratch.clauseSat v
      (RightCapShape.literals (.shortEndpoint center left right)) := by
  have hnot := shortCapEndpointOwnCapAtMostOneSat_direct P center hcenter left hleft right hright
    hleftCenter hrightCenter hleftRight
  have hcenterLeft : center ≠ left := Ne.symm hleftCenter
  have hcenterRight : center ≠ right := Ne.symm hrightCenter
  by_cases hleftMem : rowMem P.core directIndex center left
  · refine ⟨-(rowVariable center right : Int), by simp [RightCapShape.literals], ?_⟩
    apply litSat_neg (rowVariable_pos center right)
    intro hrightVal
    exact hnot ⟨hleftMem, (hv.row center right hcenterRight).mp hrightVal⟩
  · refine ⟨-(rowVariable center left : Int), by simp [RightCapShape.literals], ?_⟩
    apply litSat_neg (rowVariable_pos center left)
    exact fun hleftVal => hleftMem ((hv.row center left hcenterLeft).mp hleftVal)

private theorem endpointSat
    (P : P4DirectBoundaryPacket R profile distribution) {v : Nat → Prop}
    (hv : RowValAgreement P.core directIndex v) (center left right : Label)
    (hcenter : center ∈ rightCapEndpoints) (hleft : left ∈ rightCapPositions)
    (hright : right ∈ rightCapPositions) (hleftCenter : left ≠ center)
    (hrightCenter : right ≠ center) (hleftRight : left ≠ right) :
    P5OccurrenceBridgeScratch.clauseSat v (RightCapShape.literals (.endpoint center left right)) := by
  have hnot := rightCapEndpointOwnCapAtMostOneSat_direct P center hcenter left hleft right hright
    hleftCenter hrightCenter hleftRight
  have hcenterLeft : center ≠ left := Ne.symm hleftCenter
  have hcenterRight : center ≠ right := Ne.symm hrightCenter
  by_cases hleftMem : rowMem P.core directIndex center left
  · refine ⟨-(rowVariable center right : Int), by simp [RightCapShape.literals], ?_⟩
    apply litSat_neg (rowVariable_pos center right)
    intro hrightVal
    exact hnot ⟨hleftMem, (hv.row center right hcenterRight).mp hrightVal⟩
  · refine ⟨-(rowVariable center left : Int), by simp [RightCapShape.literals], ?_⟩
    apply litSat_neg (rowVariable_pos center left)
    exact fun hleftVal => hleftMem ((hv.row center left hcenterLeft).mp hleftVal)

private theorem ownCapSat
    (P : P4DirectBoundaryPacket R profile distribution) {v : Nat → Prop}
    (hv : RowValAgreement P.core directIndex v) (center first second third : Label)
    (hcenter : center ∈ rightCapPositions) (hfirst : first ∈ rightCapPositions)
    (hsecond : second ∈ rightCapPositions) (hthird : third ∈ rightCapPositions)
    (hfirstCenter : first ≠ center) (hsecondCenter : second ≠ center)
    (hthirdCenter : third ≠ center) (hfirstSecond : first ≠ second)
    (hfirstThird : first ≠ third) (hsecondThird : second ≠ third) :
    P5OccurrenceBridgeScratch.clauseSat v (RightCapShape.literals (.ownCap center first second third)) := by
  have hnot := rightCapOwnCapAtMostTwoSat_direct P center hcenter first hfirst second hsecond third hthird
    hfirstCenter hsecondCenter hthirdCenter hfirstSecond hfirstThird hsecondThird
  have hcenterFirst : center ≠ first := Ne.symm hfirstCenter
  have hcenterSecond : center ≠ second := Ne.symm hsecondCenter
  have hcenterThird : center ≠ third := Ne.symm hthirdCenter
  by_cases hfirstMem : rowMem P.core directIndex center first
  · by_cases hsecondMem : rowMem P.core directIndex center second
    · refine ⟨-(rowVariable center third : Int), by simp [RightCapShape.literals], ?_⟩
      apply litSat_neg (rowVariable_pos center third)
      intro hthirdVal
      exact hnot ⟨hfirstMem, hsecondMem, (hv.row center third hcenterThird).mp hthirdVal⟩
    · refine ⟨-(rowVariable center second : Int), by simp [RightCapShape.literals], ?_⟩
      apply litSat_neg (rowVariable_pos center second)
      exact fun hsecondVal => hsecondMem ((hv.row center second hcenterSecond).mp hsecondVal)
  · refine ⟨-(rowVariable center first : Int), by simp [RightCapShape.literals], ?_⟩
    apply litSat_neg (rowVariable_pos center first)
    exact fun hfirstVal => hfirstMem ((hv.row center first hcenterFirst).mp hfirstVal)

/-- Every right-cap occurrence is satisfied by the direct P4 source valuation.

This is literal-level: the proof picks one of the compact row literals from
each stored clause and transports it through `RowValAgreement.row` to the
direct source contradiction. -/
theorem rightCapOccurrences_sat
    (P : P4DirectBoundaryPacket R profile distribution) {v : Nat → Prop}
    (hv : RowValAgreement P.core directIndex v) :
    ∀ entry ∈ rightCapOccurrences, P5OccurrenceBridgeScratch.clauseSat v entry.clause := by
  intro entry hentry
  have hentryWF := List.all_eq_true.mp rightCapOccurrences_wf entry hentry
  rcases entry with
    ⟨outputClause, sourceCoreClause, sourceTerminalClause, sourceFamily,
      sourceCoreLiterals, sourceTerminalLiterals, shape, clause⟩
  cases shape with
  | shortEndpoint center left right =>
      simp [rightCapOccurrenceWF, rightCapShapeWF] at hentryWF
      rw [hentryWF.1]
      exact shortEndpointSat P hv center left right hentryWF.2.1 hentryWF.2.2.1
        hentryWF.2.2.2.1 hentryWF.2.2.2.2.1 hentryWF.2.2.2.2.2.1 hentryWF.2.2.2.2.2.2
  | endpoint center left right =>
      simp [rightCapOccurrenceWF, rightCapShapeWF] at hentryWF
      rw [hentryWF.1]
      exact endpointSat P hv center left right hentryWF.2.1 hentryWF.2.2.1
        hentryWF.2.2.2.1 hentryWF.2.2.2.2.1 hentryWF.2.2.2.2.2.1 hentryWF.2.2.2.2.2.2
  | ownCap center first second third =>
      simp [rightCapOccurrenceWF, rightCapShapeWF] at hentryWF
      rw [hentryWF.1]
      exact ownCapSat P hv center first second third hentryWF.2.1 hentryWF.2.2.1
        hentryWF.2.2.2.1 hentryWF.2.2.2.2.1 hentryWF.2.2.2.2.2.1 hentryWF.2.2.2.2.2.2.1
        hentryWF.2.2.2.2.2.2.2.1 hentryWF.2.2.2.2.2.2.2.2.1 hentryWF.2.2.2.2.2.2.2.2.2.1
        hentryWF.2.2.2.2.2.2.2.2.2.2

/-- Compatibility wrapper for consumers that already provide the broader
critical-support agreement. -/
theorem rightCapOccurrences_sat_of_valAgreement
    (P : P4DirectBoundaryPacket R profile distribution) {v : Nat → Prop}
    (hv : ValAgreement P.core directIndex v) :
    ∀ entry ∈ rightCapOccurrences, P5OccurrenceBridgeScratch.clauseSat v entry.clause :=
  rightCapOccurrences_sat P ⟨hv.row⟩

end P4RightCapSourceBridgeScratch
end Problem97
