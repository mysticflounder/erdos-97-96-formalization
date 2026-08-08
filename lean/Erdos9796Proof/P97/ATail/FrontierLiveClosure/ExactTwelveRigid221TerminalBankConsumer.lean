/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221LearnedClauseBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnf

/-!
# Terminal-bank consumption for the normalized exact-twelve v14 jobs

This module states the complete finite-CNF boundary needed by a terminal v14
job.  The terminal formula contains the frozen base cover CNF, the selected
cell's reconstructed source delta, and every learned duplicate-center clause.

If that complete formula is unsatisfiable, a source-safe row pattern satisfying
the cell predicates cannot be realized: its canonical `v14Assign` satisfies
the base and cell clauses, while any learned clause it falsifies reflects to a
checked positive duplicate-center obstruction.

This is a consumer only.  It does not provide a terminal journal, an UNSAT
proof, all-cell coverage, or the source adapter into either live exact-twelve
leaf.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace TerminalBankConsumer

open scoped EuclideanGeometry

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SafeCoverIndexBridge

/-- A finite DIMACS formula is unsatisfiable when no Boolean assignment makes
every clause true.  Terminal certificate ingress must establish this property
for the exact serialized formula. -/
def DimacsUnsatisfiable (cnf : List (List Int)) : Prop :=
  ¬ ∃ σ : Nat → Bool, ∀ c ∈ cnf, evalClauseD σ c = true

/-- Complete terminal formula for one normalized-v14 cell and learned bank.
The base formula is deliberately present: UNSAT of the delta and bank alone
would not certify the actual solver job. -/
def terminalDimacs (cell : FrozenV14JobCoordinate)
    (bank : List (DuplicateCenterNogood Label)) : List (List Int) :=
  SafeCoverCnf.baseDimacs ++
    FrozenV14JobCnf.reconstructedClauseDelta cell ++
      bank.map fun nogood => learnedClause nogood.choices

/-- Source-facing coverage statement generated when the canonical base
assignment falsifies at least one learned bank clause. -/
def LearnedClauseBankFalsifies (row : RowPattern Label)
    (bank : List (DuplicateCenterNogood Label)) : Prop :=
  ∃ nogood ∈ bank,
    evalClauseD (SafeCoverCnf.finalAssign (coverIndex row))
      (learnedClause nogood.choices) = false

/-- A falsified encodable learned clause reflects to positive semantic
coverage by its checked duplicate-center record. -/
theorem positiveDuplicateCenterBankCovers_of_learnedClauseBankFalsifies
    {row : RowPattern Label} {bank : List (DuplicateCenterNogood Label)}
    (hrow : FrozenSafeCubeOK row)
    (hencodable : ∀ nogood ∈ bank, ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support)
    (hfalse : LearnedClauseBankFalsifies row bank) :
    PositiveDuplicateCenterBankCovers bank row := by
  rcases hfalse with ⟨nogood, hnogood, hclause⟩
  exact ⟨nogood, hnogood,
    Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.SafeCoverIndexBridge.DuplicateCenterNogood.positivelyMatches_of_learnedClause_false
        hrow nogood
        (hencodable nogood hnogood) hclause⟩

/-- Bank-level source consumer independent of any terminal SAT result. -/
theorem not_realizes_of_learnedClauseBankFalsifies
    {row : RowPattern Label} {bank : List (DuplicateCenterNogood Label)}
    (hrow : FrozenSafeCubeOK row)
    (hvalid : ∀ nogood ∈ bank, nogood.check = true)
    (hencodable : ∀ nogood ∈ bank, ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support)
    (hfalse : LearnedClauseBankFalsifies row bank) :
    ¬ ∃ pointOf : Label → ℝ², Realizes row pointOf :=
  not_realizes_of_positiveDuplicateCenterBank_noCardinality hvalid
    (positiveDuplicateCenterBankCovers_of_learnedClauseBankFalsifies
      hrow hencodable hfalse)

/-- The canonical source assignment itself satisfies the complete base CNF.
This is the witness hidden behind `baseDimacs_sat`, exposed here so it can be
compared with the source/blocker extension used by a v14 terminal job. -/
theorem finalAssign_sat_baseDimacs {row : RowPattern Label}
    (hrow : FrozenSafeCubeOK row) :
    ∀ c ∈ SafeCoverCnf.baseDimacs,
      evalClauseD (SafeCoverCnf.finalAssign (coverIndex row)) c = true := by
  intro c hc
  simp only [SafeCoverCnf.baseDimacs, List.mem_append] at hc
  rcases hc with (hc | hc) | hc
  · exact SafeCoverCnf.onehot_sat (coverIndex row)
      (fun p hp => coverIndex_lt_of_safeCubeOK hrow hp) c hc
  · exact SafeCoverCnf.c2_sat (coverIndex row)
      (fun p hp => coverIndex_lt_of_safeCubeOK hrow hp)
      (coverIndex_c2_of_safeCubeOK hrow) c hc
  · exact SafeCoverCnf.c4_sat (coverIndex row)
      (fun p hp => coverIndex_lt_of_safeCubeOK hrow hp)
      (coverIndex_c4_of_safeCubeOK hrow) c hc

set_option maxHeartbeats 0 in
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
/-- Every base-CNF literal lies in the variable interval preserved by
`v14Assign`.  This frozen encoding-layout fact is checked by native evaluation;
it therefore has the same compiler-trusting status as the existing exact base
encoding anchors. -/
theorem baseDimacs_lit_bound :
    ∀ c ∈ SafeCoverCnf.baseDimacs, ∀ l ∈ c,
      l.natAbs ≤ SafeCoverCnf.baseNumVars := by
  native_decide

/-- The complete v14 source/blocker assignment preserves base-CNF
satisfiability. -/
theorem v14Assign_sat_baseDimacs
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hrow : FrozenSafeCubeOK row) :
    ∀ c ∈ SafeCoverCnf.baseDimacs,
      evalClauseD
        (FrozenV14JobCnf.v14Assign cell blocker (coverIndex row)) c = true := by
  intro c hc
  calc
    evalClauseD
        (FrozenV14JobCnf.v14Assign cell blocker (coverIndex row)) c =
        evalClauseD (SafeCoverCnf.finalAssign (coverIndex row)) c := by
      apply SafeCoverCnf.evalClauseD_congr
      intro l hl
      exact FrozenV14JobCnf.v14Assign_base_low cell blocker (coverIndex row)
        (baseDimacs_lit_bound c hc l hl)
    _ = true := finalAssign_sat_baseDimacs hrow c hc

/-- Learned clauses mention only selected-row variables, hence extending the
base assignment with the v14 source/blocker variables does not change their
truth values. -/
theorem evalClauseD_v14Assign_learnedClause_eq
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (nogood : DuplicateCenterNogood Label)
    (hencodable : ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support) :
    evalClauseD
        (FrozenV14JobCnf.v14Assign cell blocker (coverIndex row))
        (learnedClause nogood.choices) =
      evalClauseD (SafeCoverCnf.finalAssign (coverIndex row))
        (learnedClause nogood.choices) := by
  apply SafeCoverCnf.evalClauseD_congr
  intro l hl
  rcases List.mem_map.mp hl with ⟨choice, hchoice, rfl⟩
  have hchoiceIndex : encodedChoiceIndex choice <
      SafeCoverCnf.candCount choice.center.val :=
    coverIndexAt_lt choice.center choice.support
      (hencodable choice hchoice)
  have hx : SafeCoverCnf.xVar choice.center.val
        (encodedChoiceIndex choice) ≤ SafeCoverCnf.baseNumVars := by
    calc
      SafeCoverCnf.xVar choice.center.val (encodedChoiceIndex choice) ≤
          SafeCoverCnf.nX :=
        SafeCoverCnf.xVar_le_nX choice.center.isLt hchoiceIndex
      _ ≤ SafeCoverCnf.baseNumVars := by
        rw [SafeCoverCnf.nX_eq, SafeCoverCnf.baseNumVars_eq]
        omega
  simpa [learnedLiteral] using
    FrozenV14JobCnf.v14Assign_base_low cell blocker (coverIndex row) hx

/-- Complete terminal-bank consumer.  A realizable source row would make the
canonical v14 assignment satisfy the full base-plus-delta-plus-bank formula.
For a learned clause, falsity instead reflects to a checked duplicate-center
contradiction. -/
theorem not_realizes_of_terminalDuplicateCenterBank
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
    (hterminal : DimacsUnsatisfiable (terminalDimacs cell bank)) :
    ¬ ∃ pointOf : Label → ℝ², Realizes row pointOf := by
  intro hrealizes
  apply hterminal
  refine ⟨FrozenV14JobCnf.v14Assign cell blocker (coverIndex row), ?_⟩
  intro c hc
  simp only [terminalDimacs, List.mem_append] at hc
  rcases hc with (hc | hc) | hc
  · exact v14Assign_sat_baseDimacs cell hrow c hc
  · exact FrozenV14JobCnf.v14Assign_sat_reconstructedClauseDelta
      cell hrow hadded c hc
  · obtain ⟨nogood, hnogood, hclause⟩ := List.mem_map.mp hc
    subst c
    by_cases hfalse :
          evalClauseD
              (FrozenV14JobCnf.v14Assign cell blocker (coverIndex row))
              (learnedClause nogood.choices) = false
    · have hsourceFalse :
          evalClauseD (SafeCoverCnf.finalAssign (coverIndex row))
              (learnedClause nogood.choices) = false := by
        rw [← evalClauseD_v14Assign_learnedClause_eq cell nogood
          (hencodable nogood hnogood)]
        exact hfalse
      have hpositive :=
        Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.SafeCoverIndexBridge.DuplicateCenterNogood.positivelyMatches_of_learnedClause_false
            hrow nogood
            (hencodable nogood hnogood) hsourceFalse
      exact False.elim
        ((nogood.not_realizes_of_positiveCheck (hvalid nogood hnogood)
          hpositive) hrealizes)
    · cases heval : evalClauseD
        (FrozenV14JobCnf.v14Assign cell blocker (coverIndex row))
        (learnedClause nogood.choices) with
      | false => exact False.elim (hfalse heval)
      | true => rfl

end TerminalBankConsumer
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
