/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Certificate.CheckpointedRupTextBoundary
import Erdos9796Proof.P97.Certificate.CheckpointedRupSemanticBoundary

/-!
# Runtime text ingress for the exact-eleven `s2_o0` certificate core

This module keeps the frozen DIMACS core out of Lean syntax.  `include_str`
embeds the exact text artifact, the fail-closed checkpointed-RUP text parser
constructs its formula at native evaluation time, and the standard full LRAT
checker verifies the authenticated dense pure-RUP certificate.  Keeping the
full checker boundary makes the ingress independent of the specialized
checkpoint/window checker while retaining `Reflect.verifyCert_correct` as the
only certificate soundness theorem.

The result is scoped only to the frozen trimmed core.  It does not provide the
geometric source-to-valuation or shell-case coverage bridge.
-/

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT.Internal

namespace Problem97.ExactFiveCommonShellV7.S2O0TextIngress

open Problem97.CheckpointedRup.TextBoundary
open Problem97.CheckpointedRup.TextIngress
open Problem97.CheckpointedRup.SemanticBoundary

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

/-- One more than the frozen core's DIMACS variable count. -/
def numVarsSucc : Nat := 49358

/-- Hash-frozen canonical DIMACS core.
SHA-256: `ee65de56f8b1f733957bd17b939efae63dbc9afbab21c0837af35f3cdae8b24c`. -/
def coreText : String := include_str "S2O0TextIngressData/core.cnf"

/-- The runtime-parsed core formula, with the parser's empty fail-closed fallback. -/
def coreFormula : DefaultFormula numVarsSucc :=
  formulaOfText (n := numVarsSucc) coreText

/-- Convert the parser's one-based finite literal to `Reflect`'s zero-based literal. -/
def reflectLiteral (literal : Literal (PosFin numVarsSucc)) : Literal Nat :=
  (literal.1.val - 1, literal.2)

/-- The exact runtime-parsed core in the representation consumed by `Reflect`. -/
def coreCnf : CNF Nat :=
  coreFormula.toList.map fun clause => clause.clause.map reflectLiteral

/-- The parser accepts the frozen text and reconstructs its reserved slot plus
all `81253` DIMACS clauses. -/
theorem coreText_parse_count :
    (parseDimacs (n := numVarsSucc) coreText).map Array.size = some 81254 := by
  native_decide

/-- Removing the parser's reserved DIMACS-header slot leaves exactly the frozen
core's `81253` clauses for the reflective checker. -/
theorem coreCnf_clause_count : coreCnf.length = 81253 := by
  native_decide

/- The standard LRAT checker bounds certificate variables by the largest input
variable.  This tautology raises that bound to cover the certificate's extension
variables without changing the models of the core. -/
def certificatePadding : CNF Nat :=
  [[(85275, true), (85275, false)]]

def certificateCnf : CNF Nat := coreCnf ++ certificatePadding

/-- Hash-frozen normalized pure-RUP LRAT certificate for the exact same
`81253`-clause core.  Its source manifest records `6611` additions, dense ids
`81254..87864`, terminal empty addition `87864`, and external `drat-trim`
verification.  The normalized source artifact is SHA-256
`9475c3f9923546a16bd5ebdc01cc538b77cbd6d4f9d1119ef01c93f5fe399350`.
Lean filters the tautological padding clause from its clause array while
retaining its variable-bound effect, so the first derived id remains `81254`.

SHA-256: `9475c3f9923546a16bd5ebdc01cc538b77cbd6d4f9d1119ef01c93f5fe399350`. -/
def normalizedLrat : String :=
  include_str "S2O0TextIngressData/core.normalized.lrat"

/-- The frozen normalized certificate parses as exactly one action per line. -/
def normalizedLratActionCount? : Option Nat :=
  match LRAT.parseLRATProof normalizedLrat.toUTF8 with
  | .ok actions => some actions.size
  | .error _ => none

theorem normalizedLrat_parse_count : normalizedLratActionCount? = some 11650 := by
  native_decide

/-- Full RAT-capable LRAT replay against the padded checker CNF. -/
theorem certificateCore_unsat : certificateCnf.Unsat := by
  apply Reflect.verifyCert_correct certificateCnf normalizedLrat
  native_decide

/-- Remove the checker-only tautological padding from the frozen-core result. -/
theorem core_unsat : coreCnf.Unsat := by
  intro assignment
  have h := certificateCore_unsat assignment
  have hpad : CNF.eval assignment certificatePadding = true := by
    cases hvalue : assignment 85275 <;>
      simp [certificatePadding, CNF.eval, CNF.Clause.eval, hvalue]
  simpa [certificateCnf, hpad] using h

private theorem reflectClause_eq_signedClause_map
    (clause : DefaultClause numVarsSucc) :
    clause.clause.map reflectLiteral =
      (signedClauseOfDefault clause).map Census554.CoverCnf.toLit := by
  simp only [signedClauseOfDefault, List.map_map]
  apply List.map_congr_left
  intro literal hliteral
  rcases literal with ⟨p, polarity⟩
  cases polarity <;>
    simp [reflectLiteral, signedIntOfLiteral,
      Census554.CoverCnf.toLit, p.property.1]

/-- Any one-based DIMACS valuation satisfying every clause of the exact
runtime-parsed core contradicts the hash-bound reflective replay.  This is the
source-facing boundary: downstream consumers never need to unfold the
zero-based `reflectLiteral` representation used by `Reflect`. -/
theorem false_of_core_evalClauseD_sat (sigma : Nat → Bool)
    (h : ∀ clause ∈ coreFormula.toList,
      Census554.CoverCnf.evalClauseD sigma
        (signedClauseOfDefault clause) = true) : False := by
  have hcore : CNF.eval (fun n => sigma (n + 1)) coreCnf = true := by
    rw [CNF.eval, List.all_eq_true]
    intro reflectedClause hreflectedClause
    obtain ⟨clause, hclause, rfl⟩ := List.mem_map.mp hreflectedClause
    rw [reflectClause_eq_signedClause_map]
    rw [Census554.CoverCnf.evalClauseD_toLit sigma
      (signedClauseOfDefault clause)]
    · exact h clause hclause
    · exact fun literal hliteral =>
        mem_signedClauseOfDefault_ne_zero clause literal hliteral
  rw [core_unsat (fun n => sigma (n + 1))] at hcore
  contradiction

#print axioms coreText_parse_count
#print axioms coreCnf_clause_count
#print axioms normalizedLrat_parse_count
#print axioms core_unsat
#print axioms false_of_core_evalClauseD_sat

end Problem97.ExactFiveCommonShellV7.S2O0TextIngress
