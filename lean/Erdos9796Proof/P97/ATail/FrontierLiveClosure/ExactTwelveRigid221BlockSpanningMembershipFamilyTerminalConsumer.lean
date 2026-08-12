/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticPositiveMembershipTerminalConsumer
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221BlockSpanningMembershipFamilyCnf

/-!
# Static-parent terminal consumer with the full block-spanning family

This module extends the frozen static-parent valuation by the 22 shared fresh
variables of the complete 24-entry block-spanning family.  It proves that a
terminal UNSAT result for the augmented formula contradicts every realized
convex source configuration in the selected placement cell.

This theorem is a sound exact-twelve consumer.  It does not assert that a
terminal bank exists, cover all placement cells, lift exact cardinality
twelve, or close a live arbitrary-cardinality leaf.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace BlockSpanningMembershipFamilyTerminalConsumer

open BlockSpanningMembershipFamilyCnf
open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open FrozenNextRowJobCnf
open GenericRowNogoodCertificate
open NextRowTerminalBankConsumer
open PositiveMembershipCnfBridge
open SafeCoverIndexBridge
open SourceOrderTerminalBankConsumer
open StaticParentIngress
open StaticPositiveMembershipTerminalConsumer
open StaticRelationAssignment
open StaticTerminalConsumer
open TerminalBankConsumer
open scoped EuclideanGeometry

abbrev Label := ExactTwelveCarrierIngress.Label

/-- Exact formula order emitted by the family runner: frozen static parent,
all fixed membership implications, all 24 generalized blocks, then the
dynamic proof-carrying source-order bank. -/
def terminalStaticBlockSpanningFamilyDimacs (cell : FrozenNextRowCell)
    (bank : List SourceOrderPositiveNogood) : List (List Int) :=
  frozenParentDimacs cell ++
    (implicationDimacs ++
      (blockingClauses ++ bank.map fun nogood =>
        learnedClause nogood.choices))

/-- A terminal UNSAT proof for the augmented family formula contradicts every
realized convex source configuration satisfying that placement cell. -/
theorem false_of_terminalStaticNextRowBlockSpanningFamilyBank
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
      (terminalStaticBlockSpanningFamilyDimacs cell bank)) : False := by
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
      (blockingClauses ++ bank.map fun nogood =>
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
      · obtain ⟨entry, hentry, rfl⟩ := List.mem_map.mp hblock
        by_cases hfalse : evalClauseD σ
            (positiveMembershipBlockingClause entry.definitions) = false
        · exact False.elim (false_of_blockingClause_false base hreal order
            hforced hconv entry hentry hfalse)
        · cases heval : evalClauseD σ
              (positiveMembershipBlockingClause entry.definitions) with
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

end BlockSpanningMembershipFamilyTerminalConsumer
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
