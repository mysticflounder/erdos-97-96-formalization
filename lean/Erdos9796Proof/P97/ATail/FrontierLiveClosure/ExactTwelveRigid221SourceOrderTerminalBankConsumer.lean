/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SameBoundaryOrderIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221TerminalBankConsumer

/-!
# Source-order terminal-bank consumption for exact-twelve Rigid221 jobs

This module generalizes the terminal-bank consumer from checked
duplicate-center cuts to proof-carrying positive-row cuts.  Such a cut may use
the common frozen boundary order, its forced second-cap order, and convexity,
but it must carry a Lean proof that those source facts make its positive row
incidences contradictory.

The distinction is deliberate: an ordered detector record is not terminal by
itself.  It becomes admissible here only after its all-source-order coverage
has been translated into the `refutes` field below.  This file supplies the
typed consumer boundary; it does not generate those proofs, certify a solver
journal, prove terminal UNSAT, cover all cells, or close a live residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace SourceOrderTerminalBankConsumer

open scoped EuclideanGeometry

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SafeCoverIndexBridge
open TerminalBankConsumer

/-- A learned positive-row cut together with its source-order semantic proof.
The proof is uniform in the realized row pattern and in the particular common
boundary order supplied by the source ingress. -/
structure SourceOrderPositiveNogood where
  choices : List (RowChoice Label)
  refutes :
    ∀ {row : RowPattern Label} {pointOf : Label → ℝ²},
      Realizes row pointOf →
      (order : FrozenBoundaryOrder pointOf) →
      FrozenForcedSecondCapOrder order.position →
      ConvexIndep (Finset.univ.image pointOf) →
      PositiveRowsMatch row choices → False

/-- A checked duplicate-center cut is a source-order cut that simply does not
need the additional order or convexity hypotheses. -/
def SourceOrderPositiveNogood.ofDuplicateCenter
    (nogood : DuplicateCenterNogood Label) (hcheck : nogood.check = true) :
    SourceOrderPositiveNogood where
  choices := nogood.choices
  refutes := by
    intro row pointOf hreal order hforced hconv hpositive
    exact (nogood.not_realizes_of_positiveCheck hcheck hpositive) ⟨pointOf, hreal⟩

/-- Complete terminal formula for one normalized-v14 cell and a bank of
proof-carrying source-order cuts. -/
def terminalDimacs (cell : FrozenV14JobCoordinate)
    (bank : List SourceOrderPositiveNogood) : List (List Int) :=
  SafeCoverCnf.baseDimacs ++
    FrozenV14JobCnf.reconstructedClauseDelta cell ++
      bank.map fun nogood => learnedClause nogood.choices

/-- Learned clauses use only base selected-row variables, independently of
the semantic proof attached to their positive row choices. -/
theorem evalClauseD_v14Assign_learnedClause_eq
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (choices : List (RowChoice Label))
    (hencodable : ∀ choice ∈ choices,
      FrozenSafeCandidateAt choice.center choice.support) :
    evalClauseD
        (FrozenV14JobCnf.v14Assign cell blocker (coverIndex row))
        (learnedClause choices) =
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
  simpa [learnedLiteral] using
    FrozenV14JobCnf.v14Assign_base_low cell blocker (coverIndex row) hx

/-- Terminal source-order-bank consumer.  A realized source row and its common
boundary order induce a satisfying assignment unless one learned clause is
false; that false clause yields the positive incidences consumed by the cut's
stored semantic proof. -/
theorem false_of_terminalSourceOrderPositiveBank
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
    (bank : List SourceOrderPositiveNogood)
    (hencodable : ∀ nogood ∈ bank, ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support)
    (hterminal : DimacsUnsatisfiable (terminalDimacs cell bank)) : False := by
  apply hterminal
  refine ⟨FrozenV14JobCnf.v14Assign cell blocker (coverIndex row), ?_⟩
  intro c hc
  simp only [terminalDimacs, List.mem_append] at hc
  rcases hc with (hc | hc) | hc
  · exact TerminalBankConsumer.v14Assign_sat_baseDimacs cell hrow c hc
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
        rw [← evalClauseD_v14Assign_learnedClause_eq cell nogood.choices
          (hencodable nogood hnogood)]
        exact hfalse
      have hselected := selectedByCoverIndex_of_learnedClause_false hrow
        (hencodable nogood hnogood) hsourceFalse
      have hpositive := positiveRowsMatch_of_selectedByCoverIndex hrow hselected
      exact False.elim
        (nogood.refutes hreal order hforced hconv hpositive)
    · cases heval : evalClauseD
        (FrozenV14JobCnf.v14Assign cell blocker (coverIndex row))
        (learnedClause nogood.choices) with
      | false => exact False.elim (hfalse heval)
      | true => rfl

end SourceOrderTerminalBankConsumer
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
