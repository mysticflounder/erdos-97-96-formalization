/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4StrictUnitValuation

/-!
# Authenticated P4 strict-unit residual slice

The P4 compact CNF clauses at zero-based output positions `6314` and `6315`
are the respective one-literal projections `[632]` and `[633]` of source-core
clauses `7379` and `7380`.  They are the two exact-two strict-hit clauses for
the direct P4 positional normalization.  This module keeps that two-clause
slice separate from the generic 55-clause source family: the latter uses the
different P5 three-position normalization.

The compact formula and occurrence-ledger hashes agree with the neighboring
P4 occurrence bridges.  They identify the external artifacts; the theorem
below is the Lean source-satisfaction result for the displayed clauses.
-/

namespace Problem97
namespace P4StrictUnitSourceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open P5IndexedSourceScratch
open P4CriticalSupportOccurrenceBridgeScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

/-- The compact P4 formula to which the two output-clause positions belong. -/
def compactFormulaSha256 : String :=
  "449cea2217bf144caafdd2dadb2ae7083d7ca34816bd226c2ab776f52ea58dae"

/-- The source-to-compact occurrence ledger used to authenticate this slice. -/
def occurrenceLedgerSha256 : String :=
  "b1c159058e659cbd06c4540e72e2ca94eef0ef27602733db0bc44122dcdb4aac"

/-- Zero-based compact-CNF positions of the two direct strict-unit clauses. -/
def strictUnitOutputIndices : List Nat := [6314, 6315]

/-- Zero-based source-core positions of the two direct strict-unit clauses. -/
def strictUnitSourceCoreIndices : List Nat := [7379, 7380]

/-- The two authenticated one-literal compact clauses. -/
def strictUnitClauses : List (List Int) := [[632], [633]]

theorem strictUnitClauses_length : strictUnitClauses.length = 2 := by decide

/-- The direct P4 source valuation satisfies both compact strict-unit clauses. -/
theorem strictUnitClauses_sat {v : Nat → Prop}
    (P : P4DirectBoundaryPacket R profile distribution)
    (hv : ValAgreement P.core directIndex v) :
    ∀ clause ∈ strictUnitClauses, P5OccurrenceBridgeScratch.clauseSat v clause := by
  intro clause hclause
  have hclauses : clause = [632] ∨ clause = [633] := by
    simpa [strictUnitClauses] using hclause
  clear hclause
  rcases hclauses with hclause | hclause
  · subst clause
    exact ⟨632, by simp, P4CriticalSupportOccurrenceBridgeScratch.litSat_pos
      (classUnit_direct_lit632 P hv)⟩
  · subst clause
    exact ⟨633, by simp, P4CriticalSupportOccurrenceBridgeScratch.litSat_pos
      (classUnit_direct_lit633 P hv)⟩

end P4StrictUnitSourceBridgeScratch
end Problem97
