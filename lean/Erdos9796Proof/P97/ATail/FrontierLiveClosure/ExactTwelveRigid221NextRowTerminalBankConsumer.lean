/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowJobSemantics
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Terminal-bank consumption for exact-twelve next-row-only-hit jobs

The normalized next-row successor has a different finite formula from the
historical v14 job.  In particular, its distinguished row contains label `9`,
whereas the v14 distinguished-row clauses require label `9` to be absent.
Consequently the v14 terminal consumer is not a sound typed endpoint for this
lane.

This module supplies the lane-specific endpoint.  A `CompiledNextRowJob`
packages the exact complete finite job formula together with the one property
needed at the trust boundary: every source row satisfying
`FrozenNextRowOnlyHitAddedConstraintsHold` extends its canonical base
assignment to a satisfying assignment of that exact formula.  Learned clauses
remain proof-carrying `SourceOrderPositiveNogood`s.

The interface is deliberately conditional.  It does not reconstruct the
Python clause delta, authenticate a journal, produce a terminal UNSAT proof,
cover all twelve cells, or close a live residual.  A generated finite job must
still instantiate `CompiledNextRowJob` for the exact serialized clauses.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace NextRowTerminalBankConsumer

open scoped EuclideanGeometry

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SafeCoverIndexBridge
open SourceOrderTerminalBankConsumer
open TerminalBankConsumer

/-- A complete finite next-row job together with its source-satisfiability
contract.  Agreement is required on every base variable because learned
positive-row clauses mention only that interval. -/
structure CompiledNextRowJob (jointDeletion v : Label) where
  dimacs : List (List Int)
  sourceWitness :
    ∀ {row : RowPattern Label} {blocker : Fin 5 → Label},
      FrozenSafeCubeOK row →
      FrozenNextRowOnlyHitAddedConstraintsHold row blocker jointDeletion v →
      ∃ σ : Nat → Bool,
        (∀ n, n ≤ SafeCoverCnf.baseNumVars →
          σ n = SafeCoverCnf.finalAssign (coverIndex row) n) ∧
        ∀ c ∈ dimacs, evalClauseD σ c = true

/-- Exact terminal formula for one compiled next-row job and a heterogeneous
bank of proof-carrying source-order cuts. -/
def terminalDimacs {jointDeletion v : Label}
    (job : CompiledNextRowJob jointDeletion v)
    (bank : List SourceOrderPositiveNogood) : List (List Int) :=
  job.dimacs ++ bank.map fun nogood => learnedClause nogood.choices

/-- An assignment agreeing with the canonical source assignment on the base
variable interval evaluates every encodable learned clause identically. -/
theorem evalClauseD_of_agreesOnBase_learnedClause_eq
    {row : RowPattern Label} {σ : Nat → Bool}
    (choices : List (RowChoice Label))
    (hencodable : ∀ choice ∈ choices,
      FrozenSafeCandidateAt choice.center choice.support)
    (hbase : ∀ n, n ≤ SafeCoverCnf.baseNumVars →
      σ n = SafeCoverCnf.finalAssign (coverIndex row) n) :
    evalClauseD σ (learnedClause choices) =
      evalClauseD (SafeCoverCnf.finalAssign (coverIndex row))
        (learnedClause choices) := by
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
  simpa [learnedLiteral] using hbase _ hx

/-- Lane-specific terminal consumer.  A realized next-row source job supplies
a satisfying assignment of its exact compiled formula.  If a learned clause
is false under that assignment, base-variable agreement reflects it to the
canonical source rows and the cut's stored geometric proof yields `False`. -/
theorem false_of_terminalNextRowSourceOrderBank
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    {blocker : Fin 5 → Label} {jointDeletion v : Label}
    (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenNextRowOnlyHitAddedConstraintsHold
      row blocker jointDeletion v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (job : CompiledNextRowJob jointDeletion v)
    (bank : List SourceOrderPositiveNogood)
    (hencodable : ∀ nogood ∈ bank, ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support)
    (hterminal : DimacsUnsatisfiable (terminalDimacs job bank)) : False := by
  obtain ⟨σ, hbase, hjob⟩ := job.sourceWitness hrow hadded
  apply hterminal
  refine ⟨σ, ?_⟩
  intro c hc
  simp only [terminalDimacs, List.mem_append] at hc
  rcases hc with hc | hc
  · exact hjob c hc
  · obtain ⟨nogood, hnogood, rfl⟩ := List.mem_map.mp hc
    by_cases hfalse : evalClauseD σ (learnedClause nogood.choices) = false
    · have hsourceFalse :
          evalClauseD (SafeCoverCnf.finalAssign (coverIndex row))
              (learnedClause nogood.choices) = false := by
        rw [← evalClauseD_of_agreesOnBase_learnedClause_eq
          nogood.choices (hencodable nogood hnogood) hbase]
        exact hfalse
      have hselected := selectedByCoverIndex_of_learnedClause_false hrow
        (hencodable nogood hnogood) hsourceFalse
      have hpositive := positiveRowsMatch_of_selectedByCoverIndex hrow hselected
      exact False.elim
        (nogood.refutes hreal order hforced hconv hpositive)
    · cases heval : evalClauseD σ (learnedClause nogood.choices) with
      | false => exact False.elim (hfalse heval)
      | true => rfl

end NextRowTerminalBankConsumer
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
