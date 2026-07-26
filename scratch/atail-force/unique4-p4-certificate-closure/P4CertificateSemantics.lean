/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CompactWindowedRupReplay.Compose

/-!
# P4 compact-replay semantic boundary

This file is deliberately certificate-generic.  It turns a proposition-valued
signed-DIMACS valuation satisfying every clause of the exact parsed P4
checkpoint-0 formula into a contradiction from the already compiled,
checkpointed pure-RUP replay.

It does *not* yet claim that the geometric source packages satisfy that whole
formula.  That remaining ingress theorem must authenticate the complete
19,048-clause ledger and supply the hypothesis to
`false_of_checkpoint0_signedClauses_sat` under one orientation-compatible
valuation.
-/

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace Problem97
namespace P4ExactTwoCertificateClosureScratch

open Problem97.CheckpointedRup.CompactBoundary

/-- One signed DIMACS literal is satisfied by a proposition-valued valuation. -/
def litSat (v : Nat → Prop) (l : Int) : Prop :=
  if 0 ≤ l then v l.toNat else ¬ v (-l).toNat

/-- One signed DIMACS clause is satisfied when one of its literals is. -/
def clauseSat (v : Nat → Prop) (clause : List Int) : Prop :=
  ∃ l ∈ clause, litSat v l

/-- Convert the compact checker's literal representation to its signed,
one-based DIMACS integer. -/
def signedIntOfLiteral {n : Nat} (l : Literal (PosFin n)) : Int :=
  if l.2 then (l.1.val : Int) else -(l.1.val : Int)

/-- Signed DIMACS view of one parsed compact-checker clause. -/
def signedClauseOfDefault {n : Nat} (clause : DefaultClause n) : List Int :=
  clause.clause.map signedIntOfLiteral

/-- Signed DIMACS view of a parsed compact-checker formula. -/
def signedClausesOfFormula {n : Nat} (formula : DefaultFormula n) :
    List (List Int) :=
  formula.toList.map signedClauseOfDefault

/-- A proposition-valued DIMACS valuation, classically decided at the
checker's positive finite variable type. -/
noncomputable def checkerAssignment {n : Nat} (v : Nat → Prop) :
    PosFin n → Bool :=
  fun p => @decide (v p.val) (Classical.propDecidable _)

theorem checkerAssignment_iff {n : Nat} (v : Nat → Prop) (p : PosFin n) :
    checkerAssignment v p = true ↔ v p.val := by
  simp [checkerAssignment]

/-- Signed-DIMACS satisfaction of the parsed clause implies its native
checker semantics. -/
theorem entails_defaultClause_of_clauseSat {n : Nat} (v : Nat → Prop)
    (clause : DefaultClause n)
    (h : clauseSat v (signedClauseOfDefault clause)) :
    Entails.eval (α := PosFin n) (checkerAssignment v) clause := by
  obtain ⟨l, hl, hsat⟩ := h
  obtain ⟨literal, hliteral, rfl⟩ :=
    List.mem_map.mp
      (show l ∈ clause.clause.map signedIntOfLiteral from hl)
  change Clause.eval (checkerAssignment v) clause = true
  apply List.any_eq_true.mpr
  refine ⟨literal, hliteral, ?_⟩
  rcases literal with ⟨p, polarity⟩
  cases polarity with
  | false =>
      simp only [signedIntOfLiteral, Bool.false_eq_true, ↓reduceIte] at hsat
      have hpPos : (0 : Int) < (p.val : Int) := by
        exact_mod_cast p.property.1
      have hp : ¬(0 : Int) ≤ -(p.val : Int) := by omega
      unfold litSat at hsat
      rw [if_neg hp] at hsat
      simp only [decide_eq_true_eq]
      change checkerAssignment v p = false
      have hnot : ¬v p.val := by simpa using hsat
      simp [checkerAssignment, hnot]
  | true =>
      simp only [signedIntOfLiteral, ↓reduceIte] at hsat
      unfold litSat at hsat
      rw [if_pos (Int.natCast_nonneg p.val)] at hsat
      simp only [decide_eq_true_eq]
      change checkerAssignment v p = true
      exact (checkerAssignment_iff v p).mpr (by simpa using hsat)

/-- Clausewise signed-DIMACS satisfaction transfers to the compact checker's
native formula semantics. -/
theorem entails_formula_of_signedClauses_sat {n : Nat}
    (v : Nat → Prop) (formula : DefaultFormula n)
    (h : ∀ clause ∈ signedClausesOfFormula formula,
      clauseSat v clause) :
    Entails.eval (α := PosFin n) (checkerAssignment v) formula := by
  rw [Formula.formulaEntails_def, List.all_eq_true]
  intro clause hclause
  simp only [decide_eq_true_eq]
  exact entails_defaultClause_of_clauseSat v clause
    (h (signedClauseOfDefault clause)
      (List.mem_map.mpr ⟨clause, hclause, rfl⟩))

/-- Any source valuation satisfying every signed clause of the exact parsed
P4 checkpoint-0 compact formula contradicts the kernel-checked replay. -/
theorem false_of_checkpoint0_signedClauses_sat (v : Nat → Prop)
    (h : ∀ clause ∈ signedClausesOfFormula
        (formulaOfCompact (n := CompactWindowedRupReplay.n)
          CompactWindowedRupReplay.Checkpoint.C0000.text),
      clauseSat v clause) : False := by
  apply CompactWindowedRupReplay.startUnsatisfiable (checkerAssignment v)
  exact entails_formula_of_signedClauses_sat v _ h

end P4ExactTwoCertificateClosureScratch
end Problem97

#print axioms Problem97.P4ExactTwoCertificateClosureScratch.false_of_checkpoint0_signedClauses_sat
