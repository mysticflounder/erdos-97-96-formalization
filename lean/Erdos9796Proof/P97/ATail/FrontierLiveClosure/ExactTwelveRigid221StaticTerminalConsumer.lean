/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticParentIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowTerminalBankConsumer

/-!
# Static-parent terminal consumer for exact-twelve next-row computation

The historical next-row terminal consumer asks its compiled job to provide a
source witness from incidence data alone.  The frozen static parent additionally
contains metric-equality and convexity clauses, whose source witness necessarily
uses the realization and convex-independence hypotheses already available at
the terminal theorem.

This module supplies that lane-specific endpoint.  It does not assert terminal
UNSAT, authenticate a generated terminal bank, cover all placement cells, or
lift exact cardinality twelve to the live arbitrary-cardinality branch.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace StaticTerminalConsumer

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open FrozenNextRowCompiledJob
open FrozenNextRowJobCnf
open NextRowTerminalBankConsumer
open SafeCoverIndexBridge
open SourceOrderTerminalBankConsumer
open StaticParentIngress
open StaticRelationAssignment
open TerminalBankConsumer
open scoped EuclideanGeometry

abbrev Label := ExactTwelveCarrierIngress.Label

/-- The complete frozen static parent followed by proof-carrying source-order
nogoods.  This is the exact formula shape consumed by a terminal cell proof. -/
def terminalStaticDimacs (cell : FrozenNextRowCell)
    (bank : List SourceOrderPositiveNogood) : List (List Int) :=
  frozenParentDimacs cell ++ bank.map fun nogood =>
    learnedClause nogood.choices

/-- The combined incidence/metric assignment still agrees with the canonical
source assignment throughout the base-variable interval used by learned row
clauses. -/
theorem staticAssign_agreesOnBase
    (cell : FrozenNextRowCell) (blocker : Fin 5 → Label)
    (row : RowPattern Label) (d : Label) (pointOf : Label → ℝ²) :
    ∀ n, n ≤ SafeCoverCnf.baseNumVars →
      staticAssign cell blocker row d pointOf n =
        SafeCoverCnf.finalAssign (coverIndex row) n := by
  intro n hn
  have hnPrefix : n ≤ nextRowFinalNumVars cell := by
    rw [nextRowFinalNumVars_eq]
    rw [SafeCoverCnf.baseNumVars_eq] at hn
    omega
  rw [staticAssign_eq_nextRowAssign_of_le
    cell blocker row d pointOf hnPrefix]
  exact nextRowAssign_agreesOnBase cell blocker row d n hn

/-- A terminal UNSAT proof for one full static parent plus a source-order bank
contradicts every realized convex source configuration in that placement cell. -/
theorem false_of_terminalStaticNextRowSourceOrderBank
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    {blocker : Fin 5 → Label}
    (cell : FrozenNextRowCell)
    (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenNextRowOnlyHitAddedConstraintsHold row blocker
      (cell.1 : Label × Label).1 (cell.1 : Label × Label).2)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (bank : List SourceOrderPositiveNogood)
    (hencodable : ∀ nogood ∈ bank, ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support)
    (hterminal : DimacsUnsatisfiable (terminalStaticDimacs cell bank)) : False := by
  obtain ⟨d, hparent⟩ :=
    exists_staticAssign_sat_frozenParentDimacs cell hrow hadded pointOf hreal
      hconv (by intro y; simp)
  let σ := staticAssign cell blocker row d pointOf
  have hbase : ∀ n, n ≤ SafeCoverCnf.baseNumVars →
      σ n = SafeCoverCnf.finalAssign (coverIndex row) n :=
    staticAssign_agreesOnBase cell blocker row d pointOf
  apply hterminal
  refine ⟨σ, ?_⟩
  intro c hc
  simp only [terminalStaticDimacs, List.mem_append] at hc
  rcases hc with hc | hc
  · exact hparent c hc
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

end StaticTerminalConsumer
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
