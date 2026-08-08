/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221TerminalBankConsumer
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer
import Erdos9796Proof.P97.Certificate.CheckpointedRupCompact
import Erdos9796Proof.P97.Certificate.CheckpointedRupSemanticBoundary

/-!
# Checked compact-RUP ingress for exact-twelve terminal jobs

This module connects the generic compact RUP checker to the exact-twelve
terminal-bank consumer.  A generated certificate must still provide three
pieces of evidence: exact parsing of its start formula, successful terminal
RUP replay, and exact equality between the parsed signed clauses and the full
base-plus-cell-plus-bank `terminalDimacs` formula.

No terminal certificate or all-cell coverage artifact is embedded here.
-/

open Std.Sat
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal
open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace TerminalRupIngress

open CheckpointedRup.CompactIngress
open CheckpointedRup.SemanticBoundary
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SafeCoverIndexBridge
open TerminalBankConsumer

/-- Native checker unsatisfiability transfers to the signed DIMACS formula
identified with the parsed checker clauses. -/
theorem dimacsUnsatisfiable_of_formula
    {n : Nat} {formula : DefaultFormula n} {cnf : List (List Int)}
    (hclauses : signedClausesOfFormula formula = cnf)
    (hunsat : Unsatisfiable (PosFin n) formula) :
    DimacsUnsatisfiable cnf := by
  rintro ⟨σ, hσ⟩
  apply hunsat (checkerAssignment (fun v => σ v = true))
  apply entails_formula_of_evalClauseD_sat
  intro clause hclause
  apply hσ (signedClauseOfDefault clause)
  rw [← hclauses]
  exact List.mem_map.mpr ⟨clause, hclause, rfl⟩

/-- Successful compact terminal replay proves unsatisfiability of any exact
signed-DIMACS ledger for its parsed starting formula. -/
theorem dimacsUnsatisfiable_of_checkedCompactTerminal
    {n : Nat} {startText actionText : String}
    {start : Array (Option (DefaultClause n))} {cnf : List (List Int)}
    (hstart : parseFormula (n := n) startText = some start)
    (hcheck : checkTerminalCompact (n := n) startText actionText = true)
    (hclauses :
      signedClausesOfFormula (DefaultFormula.ofArray start) = cnf) :
    DimacsUnsatisfiable cnf :=
  dimacsUnsatisfiable_of_formula hclauses
    (checkTerminalCompact_sound_of_parse hstart hcheck)

/-- Exact-twelve certificate endpoint.  Once generated data identifies a
checked compact terminal proof with the complete terminal formula, the existing
source consumer rules out a realizable row for that cell. -/
theorem not_realizes_of_checkedCompactTerminal
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1)
    (bank : List (DuplicateCenterNogood Label))
    (hvalid : ∀ nogood ∈ bank, nogood.check = true)
    (hencodable : ∀ nogood ∈ bank, ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support)
    {n : Nat} {startText actionText : String}
    {start : Array (Option (DefaultClause n))}
    (hstart : parseFormula (n := n) startText = some start)
    (hcheck : checkTerminalCompact (n := n) startText actionText = true)
    (hclauses : signedClausesOfFormula (DefaultFormula.ofArray start) =
      terminalDimacs cell bank) :
    ¬ ∃ pointOf : Label → ℝ², Realizes row pointOf :=
  not_realizes_of_terminalDuplicateCenterBank cell hrow hadded bank hvalid
    hencodable
    (dimacsUnsatisfiable_of_checkedCompactTerminal hstart hcheck hclauses)

/-- Source-order exact-twelve certificate endpoint.  This is the semantic
boundary for a terminal bank containing proof-carrying positive-row cuts;
checked duplicate-center cuts can enter the same bank through
`SourceOrderPositiveNogood.ofDuplicateCenter`. -/
theorem false_of_checkedCompactSourceOrderTerminal
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (bank : List SourceOrderTerminalBankConsumer.SourceOrderPositiveNogood)
    (hencodable : ∀ nogood ∈ bank, ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support)
    {n : Nat} {startText actionText : String}
    {start : Array (Option (DefaultClause n))}
    (hstart : parseFormula (n := n) startText = some start)
    (hcheck : checkTerminalCompact (n := n) startText actionText = true)
    (hclauses : signedClausesOfFormula (DefaultFormula.ofArray start) =
      SourceOrderTerminalBankConsumer.terminalDimacs cell bank) : False :=
  SourceOrderTerminalBankConsumer.false_of_terminalSourceOrderPositiveBank
    cell hrow hadded hreal order hforced hconv bank hencodable
    (dimacsUnsatisfiable_of_checkedCompactTerminal hstart hcheck hclauses)

end TerminalRupIngress
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
