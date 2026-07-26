/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DirectOuterSourceSatisfaction
import P4DirectOuterArcFiniteData

/-!
# Keyed finite ingress for direct P4 row-to-outer-arc clauses

The finite table and the compact row/arc occurrence ledger are joined by their
three persisted occurrence keys and their typed row/arc atoms.  This is an
exhaustive finite check, not a positional correspondence between lists.

The resulting theorem discharges only the 3,179 direct
`row_pattern_implies_outer_arc` compact clauses under the direct source
valuation.  It neither establishes global P4 source satisfaction nor closes a
production theorem.
-/

namespace Problem97.P4DirectOuterValuationScratch

open P4DirectOuterArcAdapterScratch
open P4DirectOuterBindingIntegrityScratch
open P4DirectRowArcOccurrenceBridgeScratch
open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

/-- The full source identity and semantic payload required for one finite
datum to witness one retained compact occurrence. -/
def RowArcFiniteOccurrenceMatches (e : RowArcOccurrence)
    (f : DirectRowArcFiniteOccurrence) : Prop :=
  e.outputClauseIndex = f.outputClauseIndex ∧
  e.coreClauseIndex = f.coreClauseIndex ∧
  e.terminalClauseIndex = f.terminalClauseIndex ∧
  e.row.2 = f.datum.row ∧
  e.arc.2 = f.datum.arc

instance (e : RowArcOccurrence) (f : DirectRowArcFiniteOccurrence) :
    Decidable (RowArcFiniteOccurrenceMatches e f) := by
  unfold RowArcFiniteOccurrenceMatches
  infer_instance

def rowArcFiniteOccurrenceMatchBool (e : RowArcOccurrence)
    (f : DirectRowArcFiniteOccurrence) : Bool :=
  decide (RowArcFiniteOccurrenceMatches e f)

def rowArcFiniteForwardMatchCheck : Bool :=
  rowArcOccurrences.all fun e =>
    directRowArcFiniteOccurrences.any (rowArcFiniteOccurrenceMatchBool e)

def rowArcFiniteReverseMatchCheck : Bool :=
  directRowArcFiniteOccurrences.all fun f =>
    rowArcOccurrences.any fun e => rowArcFiniteOccurrenceMatchBool e f

def rowArcOccurrenceKey (e : RowArcOccurrence) : Nat × Nat × Nat :=
  (e.outputClauseIndex, e.coreClauseIndex, e.terminalClauseIndex)

def directRowArcFiniteOccurrenceKey
    (f : DirectRowArcFiniteOccurrence) : Nat × Nat × Nat :=
  (f.outputClauseIndex, f.coreClauseIndex, f.terminalClauseIndex)

def rowArcOccurrenceKeysNodupCheck : Bool :=
  decide (rowArcOccurrences.map rowArcOccurrenceKey).Nodup

def directRowArcFiniteOccurrenceKeysNodupCheck : Bool :=
  decide (directRowArcFiniteOccurrences.map directRowArcFiniteOccurrenceKey).Nodup

/-- Each ledger family lists every retained occurrence once; this guards the
keyed correspondence independently of its displayed order. -/
def rowArcFiniteBijectionCheck : Bool :=
  rowArcFiniteForwardMatchCheck &&
    (rowArcFiniteReverseMatchCheck &&
      (rowArcOccurrenceKeysNodupCheck &&
        directRowArcFiniteOccurrenceKeysNodupCheck))

theorem rowArcFiniteBijectionCheck_true : rowArcFiniteBijectionCheck = true := by
  native_decide

theorem rowArcFiniteForwardMatchCheck_true :
    rowArcFiniteForwardMatchCheck = true := by
  have h := rowArcFiniteBijectionCheck_true
  simp only [rowArcFiniteBijectionCheck, Bool.and_eq_true] at h
  exact h.1

theorem rowArcFiniteReverseMatchCheck_true :
    rowArcFiniteReverseMatchCheck = true := by
  have h := rowArcFiniteBijectionCheck_true
  simp only [rowArcFiniteBijectionCheck, Bool.and_eq_true] at h
  exact h.2.1

theorem rowArcOccurrenceKeysNodupCheck_true :
    rowArcOccurrenceKeysNodupCheck = true := by
  have h := rowArcFiniteBijectionCheck_true
  simp only [rowArcFiniteBijectionCheck, Bool.and_eq_true] at h
  exact h.2.2.1

theorem directRowArcFiniteOccurrenceKeysNodupCheck_true :
    directRowArcFiniteOccurrenceKeysNodupCheck = true := by
  have h := rowArcFiniteBijectionCheck_true
  simp only [rowArcFiniteBijectionCheck, Bool.and_eq_true] at h
  exact h.2.2.2

theorem rowArcFiniteOccurrence_exists (e : RowArcOccurrence)
    (he : e ∈ rowArcOccurrences) :
    ∃ f ∈ directRowArcFiniteOccurrences,
      RowArcFiniteOccurrenceMatches e f := by
  have hcheck := List.all_eq_true.mp rowArcFiniteForwardMatchCheck_true e he
  rcases List.any_eq_true.mp hcheck with ⟨f, hf, hmatch⟩
  refine ⟨f, hf, ?_⟩
  change decide (RowArcFiniteOccurrenceMatches e f) = true at hmatch
  exact of_decide_eq_true hmatch

theorem directRowArcFiniteDatum_valid_of_mem
    (f : DirectRowArcFiniteOccurrence) (hf : f ∈ directRowArcFiniteOccurrences) :
    f.datum.Valid :=
  directRowArcFiniteOccurrences_batch_valid.2 f hf

/-- The keyed finite datum supplies the geometry and the direct atom binding
needed by the pre-existing conditional row/arc checker.  The finite witness is
chosen from the validated exhaustive table, never inferred from list position. -/
noncomputable def directRowArcFiniteAgreement (Q : DirectSource R profile distribution)
    (e : RowArcOccurrence) (he : e ∈ rowArcOccurrences) :
    RowArcOccurrenceAgreement Q (directVal Q) e := by
  let hexists := rowArcFiniteOccurrence_exists e he
  let f := Classical.choose hexists
  have hf : f ∈ directRowArcFiniteOccurrences :=
    (Classical.choose_spec hexists).1
  have hmatch : RowArcFiniteOccurrenceMatches e f :=
    (Classical.choose_spec hexists).2
  have hvalid := directRowArcFiniteDatum_valid_of_mem f hf
  refine {
    schema := f.datum.toSchema hvalid
    schema_row := ?_
    schema_arc := ?_
    row := directVal_row_of_binding Q (rowArc_row_binding_of_mem e he)
    arc := directVal_outer_of_binding Q (rowArc_arc_binding_of_mem e he) }
  · change f.datum.row = e.row.2
    exact hmatch.2.2.2.1.symm
  · change f.datum.arc = e.arc.2
    exact hmatch.2.2.2.2.symm

/-- All 3,179 authenticated direct row-to-outer-arc compact clauses hold
under the source-faithful direct valuation. -/
theorem direct_row_pattern_implies_outer_arc_compact_sat
    (Q : DirectSource R profile distribution) :
    ∀ clause, clause ∈ compactLedgerClauses →
      P4DirectRowArcOccurrenceBridgeScratch.clauseSat (directVal Q) clause :=
  allRowArcOccurrences_sat Q (fun e he => directRowArcFiniteAgreement Q e he)

end Problem97.P4DirectOuterValuationScratch
