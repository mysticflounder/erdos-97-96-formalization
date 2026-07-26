/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.Unique4ExactTwoLratIngress.P5LargestWindowedReplay.WindowedRupReplay.Compose
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4ExactTwoSourceBridge.OccurrenceBridge.BridgeMain

/-!
# Focused p5 exact-two certificate closure

This scratch composition joins the source-faithful occurrence bridge to the
checkpointed RUP replay.  Its only certificate-specific seam is the checked
ground equality `checkpoint0_clauses_eq_bridgeClauses`.
-/

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace Problem97
namespace P5ExactTwoCertificateClosureScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open P5OccurrenceBridgeScratch
open P5IndexedSourceScratch
open Problem97.CheckpointedRup.TextBoundary

/-- Convert the LRAT checker's literal representation back to its signed,
one-based DIMACS integer. -/
def signedIntOfLiteral {n : Nat} (l : Literal (PosFin n)) : Int :=
  if l.2 then (l.1.val : Int) else -(l.1.val : Int)

/-- Signed DIMACS view of one parsed checker clause. -/
def signedClauseOfDefault {n : Nat} (clause : DefaultClause n) : List Int :=
  clause.clause.map signedIntOfLiteral

/-- Signed DIMACS view of the active clauses of one checker formula. -/
def signedClausesOfFormula {n : Nat} (formula : DefaultFormula n) :
    List (List Int) :=
  formula.toList.map signedClauseOfDefault

/-- Checkpoint zero is exactly the occurrence bridge's stored trimmed clause
list, including clause and literal order. -/
theorem checkpoint0_clauses_eq_bridgeClauses :
    signedClausesOfFormula
        (formulaOfText (n := WindowedRupReplay.n)
          WindowedRupReplay.Checkpoint.C0000.text) =
      bridgeClauses := by
  set_option maxRecDepth 16384 in
    native_decide

/-- A proposition-valued DIMACS valuation, classically decided at the
checker's positive finite variable type. -/
noncomputable def checkerAssignment {n : Nat} (v : Nat → Prop) :
    PosFin n → Bool :=
  fun p => @decide (v p.val) (Classical.propDecidable _)

theorem checkerAssignment_iff {n : Nat} (v : Nat → Prop) (p : PosFin n) :
    checkerAssignment v p = true ↔ v p.val := by
  simp [checkerAssignment]

/-- Satisfaction of the signed view of a checker clause transfers back to
the checker's native clause semantics. -/
theorem entails_defaultClause_of_clauseSat {n : Nat} (v : Nat → Prop)
    (clause : DefaultClause n)
    (h : clauseSat v (signedClauseOfDefault clause)) :
    Entails.eval (α := PosFin n) (checkerAssignment v) clause := by
  obtain ⟨l, hl, hsat⟩ := h
  obtain ⟨literal, hliteral, rfl⟩ :=
    List.mem_map.mp (show l ∈ clause.clause.map signedIntOfLiteral from hl)
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

/-- Clausewise satisfaction of the signed active formula implies the
checker's formula semantics. -/
theorem entails_formula_of_signedClauses_sat {n : Nat}
    (v : Nat → Prop) (formula : DefaultFormula n)
    (h : ∀ clause ∈ signedClausesOfFormula formula, clauseSat v clause) :
    Entails.eval (α := PosFin n) (checkerAssignment v) formula := by
  rw [Formula.formulaEntails_def, List.all_eq_true]
  intro clause hclause
  simp only [decide_eq_true_eq]
  exact
    entails_defaultClause_of_clauseSat v clause
      (h (signedClauseOfDefault clause)
        (List.mem_map.mpr ⟨clause, hclause, rfl⟩))

/-- Any source valuation satisfying all occurrence-bridge clauses contradicts
the kernel-checked checkpointed replay. -/
theorem false_of_bridgeClauses_sat (v : Nat → Prop)
    (h : ∀ clause ∈ bridgeClauses, clauseSat v clause) : False := by
  apply WindowedRupReplay.startUnsatisfiable (checkerAssignment v)
  apply entails_formula_of_signedClauses_sat
  intro clause hclause
  apply h clause
  rw [← checkpoint0_clauses_eq_bridgeClauses]
  exact hclause

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}

/-- The `(5,5,4)` exact-two residual is contradictory: its source-faithful
packet satisfies the exact trimmed formula that the checkpointed replay proves
unsatisfiable. -/
theorem false_of_p5ExactTwo
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    (distribution : ExactTwoStrictHitDistribution R) : False := by
  rcases exists_bridge_satisfying_packet R profile distribution with
    ⟨P, hP⟩ | ⟨P, hP⟩
  · exact false_of_bridgeClauses_sat (bridgeVal P.core directIndex) hP
  · exact false_of_bridgeClauses_sat (bridgeVal P.core mirrorIndex) hP

end P5ExactTwoCertificateClosureScratch
end Problem97

#print axioms
  Problem97.P5ExactTwoCertificateClosureScratch.checkpoint0_clauses_eq_bridgeClauses
#print axioms
  Problem97.P5ExactTwoCertificateClosureScratch.false_of_bridgeClauses_sat
#print axioms
  Problem97.P5ExactTwoCertificateClosureScratch.false_of_p5ExactTwo
