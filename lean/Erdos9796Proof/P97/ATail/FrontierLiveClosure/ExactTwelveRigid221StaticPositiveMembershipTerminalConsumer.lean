/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticTerminalConsumer
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticCell1ThirdBlockSpanningMembershipCnf

/-!
# Static-parent terminal consumer with the cell-1 membership cut

This module extends the frozen static-parent valuation by the three fresh
positive-membership variables used by the cell-1 block-spanning cut.  It proves
that a terminal UNSAT result for the augmented formula contradicts every
realized convex source configuration in the selected placement cell.

This is a sound terminal consumer.  It does not assert that a terminal bank
exists, cover every placement cell, lift exact cardinality twelve, or close a
live arbitrary-cardinality leaf.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace StaticPositiveMembershipTerminalConsumer

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open FrozenNextRowJobCnf
open GenericRowNogoodCertificate
open NextRowTerminalBankConsumer
open PositiveMembershipCnfBridge
open SafeCoverIndexBridge
open SourceOrderTerminalBankConsumer
open StaticCell1ThirdBlockSpanningMembershipCnf
open StaticParentIngress
open StaticRelationAssignment
open StaticTerminalConsumer
open TerminalBankConsumer
open scoped EuclideanGeometry

abbrev Label := ExactTwelveCarrierIngress.Label

/-- Exact formula order emitted by the cell-1 runner: frozen static parent,
fixed positive-membership implications, its generalized block, then the
dynamic proof-carrying source-order bank. -/
def terminalStaticPositiveMembershipDimacs (cell : FrozenNextRowCell)
    (bank : List SourceOrderPositiveNogood) : List (List Int) :=
  frozenParentDimacs cell ++
    (implicationDimacs ++
      ([blockingClause] ++ bank.map fun nogood =>
        learnedClause nogood.choices))

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
/-- The frozen static parent occupies exactly the variable interval preserved
by `positiveMembershipAssign`; the membership variables start at 44,876. -/
theorem frozenParentDimacs_lit_bound (cell : FrozenNextRowCell) :
    ∀ clause ∈ frozenParentDimacs cell, ∀ literal ∈ clause,
      literal.natAbs ≤ 44875 := by
  native_decide +revert

/-- A terminal UNSAT proof for the augmented cell-1 formula contradicts every
realized convex source configuration satisfying that placement cell. -/
theorem false_of_terminalStaticNextRowPositiveMembershipBank
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
    (hterminal : DimacsUnsatisfiable
      (terminalStaticPositiveMembershipDimacs cell bank)) : False := by
  obtain ⟨d, hparent⟩ :=
    exists_staticAssign_sat_frozenParentDimacs cell hrow hadded pointOf hreal
      hconv (by intro y; simp)
  let base := staticAssign cell blocker row d pointOf
  let σ := positiveMembershipAssign base 44875 row requirementAt
  have hbase : ∀ n, n ≤ SafeCoverCnf.baseNumVars →
      base n = SafeCoverCnf.finalAssign (coverIndex row) n :=
    staticAssign_agreesOnBase cell blocker row d pointOf
  have hσbase : ∀ n, n ≤ SafeCoverCnf.baseNumVars →
      σ n = SafeCoverCnf.finalAssign (coverIndex row) n := by
    intro n hn
    have hnCutoff : n ≤ 44875 := by
      rw [SafeCoverCnf.baseNumVars_eq] at hn
      omega
    change positiveMembershipAssign base 44875 row requirementAt n =
      SafeCoverCnf.finalAssign (coverIndex row) n
    rw [positiveMembershipAssign_of_le base 44875 row requirementAt hnCutoff]
    exact hbase n hn
  apply hterminal
  refine ⟨σ, ?_⟩
  intro clause hclause
  change clause ∈ frozenParentDimacs cell ++
    (implicationDimacs ++
      ([blockingClause] ++ bank.map fun nogood =>
        learnedClause nogood.choices)) at hclause
  rcases List.mem_append.mp hclause with hparentClause | hrest
  · calc
      evalClauseD σ clause = evalClauseD base clause := by
        apply SafeCoverCnf.evalClauseD_congr
        intro literal hliteral
        exact positiveMembershipAssign_of_le base 44875 row requirementAt
          (frozenParentDimacs_lit_bound cell clause hparentClause literal
            hliteral)
      _ = true := hparent clause hparentClause
  · rcases List.mem_append.mp hrest with himplication | hrest
    · exact implicationDimacs_sat hrow base hbase himplication
    · rcases List.mem_append.mp hrest with hblock | hbank
      · simp only [List.mem_singleton] at hblock
        subst clause
        by_cases hfalse : evalClauseD σ blockingClause = false
        · have hpositive := positiveRowsMatch_of_blockingClause_false
            base row hfalse
          exact False.elim
            (staticCell1ThirdBlockSpanningMembershipPositiveNogood.refutes
              hreal order hforced hconv hpositive)
        · cases heval : evalClauseD σ blockingClause with
          | false => exact False.elim (hfalse heval)
          | true => rfl
      · obtain ⟨nogood, hnogood, rfl⟩ := List.mem_map.mp hbank
        by_cases hfalse : evalClauseD σ
            (learnedClause nogood.choices) = false
        · have hsourceFalse :
              evalClauseD (SafeCoverCnf.finalAssign (coverIndex row))
                  (learnedClause nogood.choices) = false := by
            rw [← evalClauseD_of_agreesOnBase_learnedClause_eq
              nogood.choices (hencodable nogood hnogood) hσbase]
            exact hfalse
          have hselected := selectedByCoverIndex_of_learnedClause_false hrow
            (hencodable nogood hnogood) hsourceFalse
          have hpositive := positiveRowsMatch_of_selectedByCoverIndex hrow
            hselected
          exact False.elim
            (nogood.refutes hreal order hforced hconv hpositive)
        · cases heval : evalClauseD σ
              (learnedClause nogood.choices) with
          | false => exact False.elim (hfalse heval)
          | true => rfl

end StaticPositiveMembershipTerminalConsumer
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
