/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Certificate.CheckpointedRupCompactBoundary
import Erdos9796Proof.P97.Census554.SinzSat

/-!
# Signed-DIMACS semantics for compact RUP boundaries

This module contains the certificate-generic bridge from a proposition-valued
one-based DIMACS valuation to the compact checker's native formula semantics.
It deliberately says nothing about any particular generated certificate or
geometric valuation.
-/

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace Problem97
namespace CheckpointedRup
namespace SemanticBoundary

/-- One signed DIMACS literal is satisfied by a proposition-valued valuation. -/
def litSat (v : Nat → Prop) (l : Int) : Prop :=
  if 0 ≤ l then v l.toNat else ¬ v (-l).toNat

/-- One signed DIMACS clause is satisfied when one of its literals is. -/
def clauseSat (v : Nat → Prop) (clause : List Int) : Prop :=
  ∃ l ∈ clause, litSat v l

/-- Boolean DIMACS evaluation implies the proposition-valued literal semantics,
provided the signed literal is nonzero.  Generated compact formulas satisfy
this side condition because their variables have type `PosFin`. -/
theorem litSat_of_evalLitD (σ : Nat → Bool) (l : Int)
    (hl : l ≠ 0)
    (h : Census554.CoverCnf.evalLitD σ l = true) :
    litSat (fun n => σ n = true) l := by
  cases l with
  | ofNat n =>
      cases n with
      | zero => simp at hl
      | succ n =>
          simpa [Census554.CoverCnf.evalLitD, litSat] using h
  | negSucc n =>
      simp [Census554.CoverCnf.evalLitD, litSat] at h ⊢
      simp [h]

/-- Boolean DIMACS evaluation implies proposition-valued clause satisfaction
when every literal in the clause is nonzero. -/
theorem clauseSat_of_evalClauseD (σ : Nat → Bool) (clause : List Int)
    (hnz : ∀ l ∈ clause, l ≠ 0)
    (h : Census554.CoverCnf.evalClauseD σ clause = true) :
    clauseSat (fun n => σ n = true) clause := by
  obtain ⟨l, hl, hs⟩ := List.any_eq_true.mp h
  exact ⟨l, hl, litSat_of_evalLitD σ l (hnz l hl) hs⟩

/-- Convert the compact checker's literal representation to its signed,
one-based DIMACS integer. -/
def signedIntOfLiteral {n : Nat} (l : Literal (PosFin n)) : Int :=
  if l.2 then (l.1.val : Int) else -(l.1.val : Int)

/-- Signed DIMACS view of one parsed compact-checker clause. -/
def signedClauseOfDefault {n : Nat} (clause : DefaultClause n) : List Int :=
  clause.clause.map signedIntOfLiteral

/-- Compact-checker literals use strictly positive one-based variables, so
their signed DIMACS images are never zero. -/
theorem signedIntOfLiteral_ne_zero {n : Nat} (l : Literal (PosFin n)) :
    signedIntOfLiteral l ≠ 0 := by
  rcases l with ⟨p, polarity⟩
  cases polarity <;>
    simp [signedIntOfLiteral, ne_of_gt p.property.1]

theorem mem_signedClauseOfDefault_ne_zero {n : Nat}
    (clause : DefaultClause n) (l : Int)
    (hl : l ∈ signedClauseOfDefault clause) :
    l ≠ 0 := by
  obtain ⟨literal, _, rfl⟩ := List.mem_map.mp hl
  exact signedIntOfLiteral_ne_zero literal

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

/-- Signed-DIMACS satisfaction of a parsed clause implies its native checker
semantics. -/
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

/-- A Boolean one-based DIMACS valuation satisfying every parsed clause
transfers directly to the compact checker's native formula semantics. -/
theorem entails_formula_of_evalClauseD_sat {n : Nat}
    (σ : Nat → Bool) (formula : DefaultFormula n)
    (h : ∀ clause ∈ formula.toList,
      Census554.CoverCnf.evalClauseD σ
        (signedClauseOfDefault clause) = true) :
    Entails.eval (α := PosFin n)
      (checkerAssignment (fun v => σ v = true)) formula := by
  apply entails_formula_of_signedClauses_sat
  intro signedClause hsignedClause
  obtain ⟨clause, hclause, rfl⟩ := List.mem_map.mp hsignedClause
  apply clauseSat_of_evalClauseD σ
  · exact mem_signedClauseOfDefault_ne_zero clause
  · exact h clause hclause

end SemanticBoundary
end CheckpointedRup
end Problem97

#print axioms Problem97.CheckpointedRup.SemanticBoundary.entails_formula_of_signedClauses_sat
#print axioms Problem97.CheckpointedRup.SemanticBoundary.entails_formula_of_evalClauseD_sat
