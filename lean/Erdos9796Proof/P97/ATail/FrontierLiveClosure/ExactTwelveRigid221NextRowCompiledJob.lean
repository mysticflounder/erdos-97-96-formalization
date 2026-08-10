/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowJobCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowTerminalBankConsumer

/-!
# Reconstructed compiled jobs for exact-twelve next-row cells

This module packages the source-faithful base CNF and the reconstructed
next-row clause delta behind the typed `CompiledNextRowJob` interface.

The resulting job is a mathematical reconstruction.  It does not yet assert
that an authenticated Python artifact serializes this exact clause list, nor
does it supply a terminal UNSAT certificate or all-cell coverage.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenNextRowCompiledJob

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open FrozenNextRowJobCnf
open NextRowTerminalBankConsumer
open SafeCoverIndexBridge
open TerminalBankConsumer

/-- Complete reconstructed formula for one normalized next-row cell. -/
def reconstructedCompleteDimacs (cell : FrozenNextRowCell) :
    List (List Int) :=
  SafeCoverCnf.baseDimacs ++ reconstructedClauseDelta cell

/-- The next-row extension preserves the canonical source assignment on every
base variable. -/
theorem nextRowAssign_agreesOnBase
    (cell : FrozenNextRowCell) (blocker : Fin 5 → Label)
    (row : RowPattern Label) (d : Label) :
    ∀ n, n ≤ SafeCoverCnf.baseNumVars →
      nextRowAssign cell blocker row d n =
        SafeCoverCnf.finalAssign (coverIndex row) n := by
  intro n hn
  have hnFinal :
      n ≤ FrozenV14JobCnf.finalNumVars (canonicalV14Coordinate cell) := by
    rw [FrozenV14JobCnf.finalNumVars_eq]
    rw [SafeCoverCnf.baseNumVars_eq] at hn
    omega
  rw [nextRowAssign_low cell blocker row d hnFinal]
  exact FrozenV14JobCnf.v14Assign_base_low
    (canonicalV14Coordinate cell) blocker (coverIndex row) hn

/-- The next-row extension satisfies every clause of the source-faithful base
CNF. -/
theorem nextRowAssign_sat_baseDimacs
    {row : RowPattern Label} (cell : FrozenNextRowCell)
    (blocker : Fin 5 → Label) (hrow : FrozenSafeCubeOK row)
    (d : Label) :
    ∀ c ∈ SafeCoverCnf.baseDimacs,
      evalClauseD (nextRowAssign cell blocker row d) c = true := by
  intro c hc
  calc
    evalClauseD (nextRowAssign cell blocker row d) c =
        evalClauseD (SafeCoverCnf.finalAssign (coverIndex row)) c := by
      apply SafeCoverCnf.evalClauseD_congr
      intro l hl
      exact nextRowAssign_agreesOnBase cell blocker row d l.natAbs
        (baseDimacs_lit_bound c hc l hl)
    _ = true := finalAssign_sat_baseDimacs hrow c hc

/-- Source-faithful next-row semantics extend the canonical base assignment to
a satisfying assignment of the complete reconstructed formula. -/
theorem exists_nextRowAssign_sat_reconstructedCompleteDimacs
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenNextRowCell) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenNextRowOnlyHitAddedConstraintsHold row blocker
      (cell.1 : Label × Label).1 (cell.1 : Label × Label).2) :
    ∃ d : Label,
      (∀ n, n ≤ SafeCoverCnf.baseNumVars →
        nextRowAssign cell blocker row d n =
          SafeCoverCnf.finalAssign (coverIndex row) n) ∧
      ∀ c ∈ reconstructedCompleteDimacs cell,
        evalClauseD (nextRowAssign cell blocker row d) c = true := by
  obtain ⟨d, hdelta⟩ :=
    exists_nextRowAssign_sat_reconstructedClauseDelta cell hrow hadded
  refine ⟨d, nextRowAssign_agreesOnBase cell blocker row d, ?_⟩
  intro c hc
  rcases List.mem_append.mp hc with hbase | hdeltaMem
  · exact nextRowAssign_sat_baseDimacs cell blocker hrow d c hbase
  · exact hdelta c hdeltaMem

/-- Concrete typed job for the reconstructed complete next-row formula.

Promotion to an authenticated generated job additionally requires a theorem
identifying the compiler's serialized clause list with
`reconstructedCompleteDimacs cell`. -/
def reconstructedCompiledNextRowJob (cell : FrozenNextRowCell) :
    CompiledNextRowJob
      (cell.1 : Label × Label).1 (cell.1 : Label × Label).2 where
  dimacs := reconstructedCompleteDimacs cell
  sourceWitness := by
    intro row blocker hrow hadded
    obtain ⟨d, hbase, hformula⟩ :=
      exists_nextRowAssign_sat_reconstructedCompleteDimacs
        cell hrow hadded
    exact ⟨nextRowAssign cell blocker row d, hbase, hformula⟩

/-- Transport the reconstructed source witness to an explicit serialized
clause delta once the generated artifact proves ordered-list equality. -/
def serializedCompiledNextRowJob (cell : FrozenNextRowCell)
    (serializedDelta : List (List Int))
    (hserialized : reconstructedClauseDelta cell = serializedDelta) :
    CompiledNextRowJob
      (cell.1 : Label × Label).1 (cell.1 : Label × Label).2 where
  dimacs := SafeCoverCnf.baseDimacs ++ serializedDelta
  sourceWitness := by
    intro row blocker hrow hadded
    obtain ⟨σ, hbase, hformula⟩ :=
      (reconstructedCompiledNextRowJob cell).sourceWitness hrow hadded
    refine ⟨σ, hbase, ?_⟩
    intro c hc
    apply hformula c
    change c ∈ reconstructedCompleteDimacs cell
    simpa [reconstructedCompleteDimacs, hserialized] using hc

end FrozenNextRowCompiledJob
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
