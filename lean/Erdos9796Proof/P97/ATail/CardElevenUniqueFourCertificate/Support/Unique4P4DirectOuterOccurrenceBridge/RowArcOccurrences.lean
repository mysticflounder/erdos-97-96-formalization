/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4DirectOuterOccurrenceBridge.row_arc_data

/-!
# Direct P4 row-to-outer-arc compact occurrences

This materializes exactly the 3,179 retained
`direct_row_pattern_implies_outer_arc` source clauses.  The generated ingress
retains the source core order, source terminal order, compact-ledger order,
and compact terminal order.  The semantic `row`/`arc` pair is deliberately
zipped with the latter terminal order (`[-row, +arc]`), never with the
compact-ledger/core order.

`RowArcOccurrenceAgreement` is local to one displayed row/arc pair.  It does
not construct a total compact valuation, prove global P4 satisfaction, or
close a production theorem.
-/

namespace Problem97.P4DirectRowArcOccurrenceBridgeScratch

open P4DirectOuterArcAdapterScratch
open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch

/-- Satisfaction of one signed compact literal. -/
def literalSat (v : Nat → Prop) (literal : Int) : Prop :=
  if 0 ≤ literal then v literal.toNat else ¬ v (-literal).toNat

/-- Satisfaction of a compact clause. -/
def clauseSat (v : Nat → Prop) (clause : List Int) : Prop :=
  ∃ literal ∈ clause, literalSat v literal

/-- Boolean terminal-clause inclusion check. -/
def litsSubset (lits clause : List Int) : Bool :=
  lits.all fun literal => clause.contains literal

theorem literalSat_pos {v : Nat → Prop} {index : Nat}
    (h : v index) : literalSat v (index : Int) := by
  unfold literalSat
  rw [if_pos (Int.natCast_nonneg index)]
  simpa using h

theorem literalSat_neg {v : Nat → Prop} {index : Nat}
    (hpositive : 1 ≤ index) (h : ¬ v index) :
    literalSat v (-(index : Int)) := by
  unfold literalSat
  rw [if_neg (by omega)]
  simpa using h

theorem clauseSat_of_subset {v : Nat → Prop} {lits clause : List Int}
    (hsubset : litsSubset lits clause = true) (h : clauseSat v lits) :
    clauseSat v clause := by
  obtain ⟨literal, hliteral, hsat⟩ := h
  refine ⟨literal, ?_, hsat⟩
  simpa using List.all_eq_true.mp hsubset literal hliteral

/-- The source-terminal literal order for the local source theorem. -/
def rowArcTerminalLits (e : RowArcOccurrence) : List Int :=
  [-((e.row.1 : Nat) : Int), (e.arc.1 : Int)]

/-- All finite provenance and terminal-order checks attached to one entry. -/
def EntrySides (e : RowArcOccurrence) : Prop :=
  1 ≤ e.coreClauseIndex ∧
  1 ≤ e.terminalClauseIndex ∧
  e.sourceCoreLiterals.length = 2 ∧
  e.sourceTerminalLiterals.length = 2 ∧
  e.compactLedgerLiterals.length = 2 ∧
  e.compactTerminalLiterals.length = 2 ∧
  e.sourceTerminalLiterals.Perm e.sourceCoreLiterals ∧
  e.compactTerminalLiterals.Perm e.compactLedgerLiterals ∧
  e.compactTerminalLiterals = rowArcTerminalLits e ∧
  e.row.2.support.card = 4 ∧
  e.row.2.center = e.arc.2.center ∧
  1 ≤ e.row.1 ∧
  1 ≤ e.arc.1

instance entrySidesDecidable (e : RowArcOccurrence) : Decidable (EntrySides e) := by
  unfold EntrySides
  infer_instance

/-- Generated check used by all theorems below. -/
def entryWF (e : RowArcOccurrence) : Bool :=
  decide (EntrySides e) && litsSubset (rowArcTerminalLits e) e.compactLedgerLiterals

def allEntriesWF : Bool := rowArcOccurrences.all entryWF

def coreClauseIndices : List Nat := rowArcOccurrences.map (·.coreClauseIndex)
def terminalClauseIndices : List Nat := rowArcOccurrences.map (·.terminalClauseIndex)
def compactLedgerClauses : List (List Int) := rowArcOccurrences.map (·.compactLedgerLiterals)

/-- Generator-authenticated cardinality of the retained direct row/arc family. -/
theorem rowArcOccurrences_count_exact : rowArcOccurrences.length = expectedOccurrenceCount := by
  set_option maxRecDepth 100000 in
    decide

/-- Every retained entry has its exact source/terminal/ledger provenance checks. -/
theorem allEntriesWF_true : allEntriesWF = true := by
  set_option maxRecDepth 100000 in
    decide

/-- The source and ledger inputs are pinned to the hashes checked by the generator. -/
theorem input_hashes_exact :
    sourceMapSha256 = "af829a7c99e0f969f410d398d7c32c2ba5dd945f3a7ebb2ef3f8d7679633d64b" ∧
    occurrenceLedgerSha256 = "b1c159058e659cbd06c4540e72e2ca94eef0ef27602733db0bc44122dcdb4aac" ∧
    compactManifestSha256 = "61efb4c99512ef3cff6968f1513ebb8e3c9009ad3fcc7bb013da70a5d3f37305" := by
  decide

theorem entryWF_of_mem (e : RowArcOccurrence)
    (he : e ∈ rowArcOccurrences) : entryWF e = true := by
  exact List.all_eq_true.mp allEntriesWF_true e he

/-- Terminal order is authenticated entrywise; it is not inferred from core order. -/
theorem terminal_order_of_mem (e : RowArcOccurrence)
    (he : e ∈ rowArcOccurrences) :
    e.compactTerminalLiterals = rowArcTerminalLits e := by
  have h := entryWF_of_mem e he
  simp only [entryWF, Bool.and_eq_true] at h
  exact (of_decide_eq_true h.1).2.2.2.2.2.2.2.2.1

/-- The source-terminal clause is included in its exact compact-ledger clause. -/
theorem terminal_clause_included_of_mem (e : RowArcOccurrence)
    (he : e ∈ rowArcOccurrences) :
    litsSubset (rowArcTerminalLits e) e.compactLedgerLiterals = true := by
  have h := entryWF_of_mem e he
  simp only [entryWF, Bool.and_eq_true] at h
  exact h.2

/-- The finite source ingredient and valuation agreement for one occurrence.
No values outside this entry's row and outer-arc dense variables are assumed. -/
structure RowArcOccurrenceAgreement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧ S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
    {distribution : ExactTwoStrictHitDistribution R}
    (Q : DirectSource R profile distribution) (v : Nat → Prop)
    (e : RowArcOccurrence) where
  schema : DirectRowArcSchema
  schema_row : schema.row = e.row.2
  schema_arc : schema.arc = e.arc.2
  row : v e.row.1 ↔ rowSupportVal Q.curvature e.row.2
  arc : v e.arc.1 ↔ outerArcVal Q.curvature e.arc.2

private theorem terminalClauseSat_of_rowFalse
    {v : Nat → Prop} (e : RowArcOccurrence) (hentry : entryWF e = true)
    (hrow : ¬ v e.row.1) : clauseSat v (rowArcTerminalLits e) := by
  simp only [entryWF, Bool.and_eq_true] at hentry
  have hside : EntrySides e := of_decide_eq_true hentry.1
  exact ⟨-(e.row.1 : Int), by simp [rowArcTerminalLits],
    literalSat_neg hside.2.2.2.2.2.2.2.2.2.2.2.1 hrow⟩

/-- Conditional source satisfaction for exactly one authenticated occurrence. -/
theorem rowArcOccurrence_sat
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧ S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
    {distribution : ExactTwoStrictHitDistribution R}
    (Q : DirectSource R profile distribution) {v : Nat → Prop}
    (e : RowArcOccurrence) (he : e ∈ rowArcOccurrences)
    (agreement : RowArcOccurrenceAgreement Q v e) :
    clauseSat v e.compactLedgerLiterals := by
  have hentry := entryWF_of_mem e he
  apply clauseSat_of_subset (terminal_clause_included_of_mem e he)
  by_cases hrow : v e.row.1
  · have hsourceRow : rowSupportVal Q.curvature agreement.schema.row := by
      rw [agreement.schema_row]
      exact agreement.row.mp hrow
    have hsourceArc : outerArcVal Q.curvature agreement.schema.arc :=
      direct_row_pattern_implies_outer_arc Q.curvature agreement.schema hsourceRow
    have harc : v e.arc.1 := by
      apply agreement.arc.mpr
      rw [← agreement.schema_arc]
      exact hsourceArc
    exact ⟨(e.arc.1 : Int), by simp [rowArcTerminalLits], literalSat_pos harc⟩
  · exact terminalClauseSat_of_rowFalse e hentry hrow

/-- Conditional satisfaction of every one of the 3,179 materialized clauses.
This quantifies only over the supplied local agreements. -/
theorem allRowArcOccurrences_sat
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧ S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
    {distribution : ExactTwoStrictHitDistribution R}
    (Q : DirectSource R profile distribution) {v : Nat → Prop}
    (agreements : ∀ e, e ∈ rowArcOccurrences → RowArcOccurrenceAgreement Q v e) :
    ∀ clause ∈ compactLedgerClauses, clauseSat v clause := by
  intro clause hclause
  rcases List.mem_map.mp hclause with ⟨e, he, rfl⟩
  exact rowArcOccurrence_sat Q e he (agreements e he)

end Problem97.P4DirectRowArcOccurrenceBridgeScratch
