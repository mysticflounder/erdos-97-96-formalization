/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import BridgeChunkAll
import MirrorSatisfaction

/-!
# All 8,703 trimmed p5 clauses are satisfied by the bridge valuation

`bridgeClauses` is the full trimmed clause list of the authenticated
occurrence map `p5-largest.trimmed-occurrence-map.json`, stored verbatim
in map order.  The main theorem consumes any `DenseFamilySatisfaction`
record at the documented seam and satisfies every stored clause; the
Boolean corollary evaluates the classically-decided assignment
`fun n => decide (bridgeVal Q σ n)` of `FAMILY_ROUTES.md`.  The packet
corollaries compose with the `IndexedSource` branch aggregates: every
`(5,5,4)` exact-two residual reaches a boundary packet whose geometry
satisfies all 8,703 trimmed clauses in the packet's own orientation.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P5OccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open RetainedKalmansonDecoderScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
  {distribution : ExactTwoStrictHitDistribution R}

/-- The stored trimmed clause list, in occurrence-map order. -/
def bridgeClauses : List (List Int) :=
  bridgeEntries.map BridgeEntry.clause

set_option maxRecDepth 8192 in
theorem bridgeClauses_length : bridgeClauses.length = 8703 := by
  have h01 : bridgeChunk01.length = 220 := by decide
  have h02 : bridgeChunk02.length = 220 := by decide
  have h03 : bridgeChunk03.length = 220 := by decide
  have h04 : bridgeChunk04.length = 220 := by decide
  have h05 : bridgeChunk05.length = 220 := by decide
  have h06 : bridgeChunk06.length = 220 := by decide
  have h07 : bridgeChunk07.length = 220 := by decide
  have h08 : bridgeChunk08.length = 220 := by decide
  have h09 : bridgeChunk09.length = 220 := by decide
  have h10 : bridgeChunk10.length = 220 := by decide
  have h11 : bridgeChunk11.length = 220 := by decide
  have h12 : bridgeChunk12.length = 220 := by decide
  have h13 : bridgeChunk13.length = 220 := by decide
  have h14 : bridgeChunk14.length = 220 := by decide
  have h15 : bridgeChunk15.length = 220 := by decide
  have h16 : bridgeChunk16.length = 220 := by decide
  have h17 : bridgeChunk17.length = 220 := by decide
  have h18 : bridgeChunk18.length = 220 := by decide
  have h19 : bridgeChunk19.length = 220 := by decide
  have h20 : bridgeChunk20.length = 220 := by decide
  have h21 : bridgeChunk21.length = 220 := by decide
  have h22 : bridgeChunk22.length = 220 := by decide
  have h23 : bridgeChunk23.length = 220 := by decide
  have h24 : bridgeChunk24.length = 220 := by decide
  have h25 : bridgeChunk25.length = 220 := by decide
  have h26 : bridgeChunk26.length = 220 := by decide
  have h27 : bridgeChunk27.length = 220 := by decide
  have h28 : bridgeChunk28.length = 220 := by decide
  have h29 : bridgeChunk29.length = 220 := by decide
  have h30 : bridgeChunk30.length = 220 := by decide
  have h31 : bridgeChunk31.length = 220 := by decide
  have h32 : bridgeChunk32.length = 220 := by decide
  have h33 : bridgeChunk33.length = 220 := by decide
  have h34 : bridgeChunk34.length = 220 := by decide
  have h35 : bridgeChunk35.length = 220 := by decide
  have h36 : bridgeChunk36.length = 220 := by decide
  have h37 : bridgeChunk37.length = 220 := by decide
  have h38 : bridgeChunk38.length = 220 := by decide
  have h39 : bridgeChunk39.length = 220 := by decide
  have h40 : bridgeChunk40.length = 123 := by decide
  simp only [bridgeClauses, List.length_map, bridgeEntries,
    List.length_append, h01, h02, h03, h04, h05, h06, h07, h08, h09, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31, h32, h33, h34, h35, h36, h37, h38, h39, h40]

/-- Every trimmed clause of the selected p5 formula is satisfied by the
bridge valuation of any packet geometry satisfying all retained
families. -/
theorem bridge_clauses_sat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (hQ : DenseFamilySatisfaction Q σ) :
    ∀ clause ∈ bridgeClauses, clauseSat (bridgeVal Q σ) clause :=
  entryList_sat Q σ hQ bridgeEntries bridgeEntries_wf

/- ## Boolean assignment corollary (`FAMILY_ROUTES.md` seam) -/

/-- Boolean evaluation of one signed literal. -/
def evalLit (b : Nat → Bool) (l : Int) : Bool :=
  if 0 ≤ l then b l.toNat else !b (-l).toNat

/-- Boolean evaluation of one signed clause. -/
def evalClause (b : Nat → Bool) (clause : List Int) : Bool :=
  clause.any (evalLit b)

/-- The classically-decided Boolean assignment of the bridge
valuation. -/
noncomputable def bridgeBoolVal (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) : Nat → Bool :=
  fun n => @decide (bridgeVal Q σ n) (Classical.propDecidable _)

theorem bridgeBoolVal_iff (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (n : Nat) :
    bridgeBoolVal Q σ n = true ↔ bridgeVal Q σ n := by
  simp [bridgeBoolVal]

theorem evalClause_of_clauseSat {v : Nat → Prop} {b : Nat → Bool}
    (hvb : ∀ n, b n = true ↔ v n) {clause : List Int}
    (h : clauseSat v clause) : evalClause b clause = true := by
  obtain ⟨l, hl, hsat⟩ := h
  refine List.any_eq_true.mpr ⟨l, hl, ?_⟩
  unfold litSat at hsat
  unfold evalLit
  by_cases h0 : (0 : Int) ≤ l
  · rw [if_pos h0] at hsat ⊢
    exact (hvb _).mpr hsat
  · rw [if_neg h0] at hsat ⊢
    cases hb : b (-l).toNat with
    | false => rfl
    | true => exact absurd ((hvb _).mp hb) hsat

/-- Boolean form: the decided assignment evaluates every stored trimmed
clause to `true`. -/
theorem bridge_clauses_bool_sat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label)
    (hQ : DenseFamilySatisfaction Q σ) :
    bridgeClauses.all (evalClause (bridgeBoolVal Q σ)) = true :=
  List.all_eq_true.mpr fun clause hc =>
    evalClause_of_clauseSat (bridgeBoolVal_iff Q σ)
      (bridge_clauses_sat Q σ hQ clause hc)

/- ## Packet composition corollaries -/

/-- Direct branch: the direct packet's geometry satisfies every stored
trimmed clause under the identity index transport. -/
theorem bridge_clauses_sat_direct
    (P : P5DirectBoundaryPacket R profile distribution) :
    ∀ clause ∈ bridgeClauses,
      clauseSat (bridgeVal P.core directIndex) clause :=
  bridge_clauses_sat P.core directIndex (directSatisfaction P)

/-- Mirror branch: the mirror packet's geometry satisfies every stored
trimmed clause under the reflection transport `ρ(i) = -i`. -/
theorem bridge_clauses_sat_mirror
    (P : P5MirrorBoundaryPacket R profile distribution) :
    ∀ clause ∈ bridgeClauses,
      clauseSat (bridgeVal P.core mirrorIndex) clause :=
  bridge_clauses_sat P.core mirrorIndex (mirrorSatisfaction P)

/-- Every `(5,5,4)` exact-two residual reaches a boundary packet whose
own geometry satisfies all 8,703 trimmed clauses of the selected p5
formula, in the orientation the packet realizes. -/
theorem exists_bridge_satisfying_packet
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    (distribution : ExactTwoStrictHitDistribution R) :
    (∃ P : P5DirectBoundaryPacket R profile distribution,
      ∀ clause ∈ bridgeClauses,
        clauseSat (bridgeVal P.core directIndex) clause) ∨
    (∃ P : P5MirrorBoundaryPacket R profile distribution,
      ∀ clause ∈ bridgeClauses,
        clauseSat (bridgeVal P.core mirrorIndex) clause) := by
  rcases exists_satisfying_p5_packet R profile distribution with
    ⟨P, hP⟩ | ⟨P, hP⟩
  · exact Or.inl ⟨P, bridge_clauses_sat P.core directIndex hP⟩
  · exact Or.inr ⟨P, bridge_clauses_sat P.core mirrorIndex hP⟩

end P5OccurrenceBridgeScratch
end Problem97

#print axioms Problem97.P5OccurrenceBridgeScratch.bridgeClauses_length
#print axioms Problem97.P5OccurrenceBridgeScratch.bridge_clauses_sat
#print axioms Problem97.P5OccurrenceBridgeScratch.bridge_clauses_bool_sat
#print axioms
  Problem97.P5OccurrenceBridgeScratch.exists_bridge_satisfying_packet
