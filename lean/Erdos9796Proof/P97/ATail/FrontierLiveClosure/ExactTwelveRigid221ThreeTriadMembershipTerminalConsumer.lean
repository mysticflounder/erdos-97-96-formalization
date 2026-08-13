/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221BlockSpanningMembershipFamilyTerminalConsumer
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowNamedDeletionJobCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticCell1AfterFamilyThreeTriadMembershipCnf

/-!
# Terminal consumer with the block-spanning family and three-triad cut

This consumer composes two source-valued positive-membership layers: the
complete 24-role block-spanning family at variables 44,876--44,897, followed
by the five-variable three-triad cut at 44,898--44,902.  A terminal UNSAT proof
for the exact emitted formula therefore contradicts the selected exact-twelve
source cell.

No terminal artifact, all-cell coverage, arbitrary-cardinality lift, or live
theorem closure is asserted here.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace ThreeTriadMembershipTerminalConsumer

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open FrozenNextRowJobCnf
open FrozenNextRowNamedDeletionJobCnf
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

/-- Exact clause order emitted after both fixed membership layers. -/
def terminalStaticThreeTriadMembershipDimacs (cell : FrozenNextRowCell)
    (bank : List SourceOrderPositiveNogood) : List (List Int) :=
  frozenParentDimacs cell ++
    (BlockSpanningMembershipFamilyCnf.implicationDimacs ++
      (BlockSpanningMembershipFamilyCnf.blockingClauses ++
        (StaticCell1AfterFamilyThreeTriadMembershipCnf.implicationDimacs ++
          ([StaticCell1AfterFamilyThreeTriadMembershipCnf.blockingClause] ++
            bank.map fun nogood =>
            learnedClause nogood.choices))))

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem familyImplicationDimacs_lit_bound :
    ∀ clause ∈ BlockSpanningMembershipFamilyCnf.implicationDimacs,
      ∀ literal ∈ clause,
      literal.natAbs ≤ 44897 := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem familyBlockingClauses_lit_bound :
    ∀ clause ∈ BlockSpanningMembershipFamilyCnf.blockingClauses,
      ∀ literal ∈ clause,
      literal.natAbs ≤ 44897 := by
  native_decide +revert

private theorem evalClauseD_supplement_preserves_family
    (familyAssign : Nat → Bool) (row : RowPattern Label)
    {clause : List Int}
    (hbound : ∀ literal ∈ clause, literal.natAbs ≤ 44897) :
    evalClauseD
        (positiveMembershipAssign familyAssign 44897 row
          StaticCell1AfterFamilyThreeTriadMembershipCnf.requirementAt) clause =
      evalClauseD familyAssign clause := by
  apply SafeCoverCnf.evalClauseD_congr
  intro literal hliteral
  exact positiveMembershipAssign_of_le familyAssign 44897 row
    StaticCell1AfterFamilyThreeTriadMembershipCnf.requirementAt
      (hbound literal hliteral)

/-- A terminal UNSAT proof for the doubly extended formula contradicts every
realized convex source configuration satisfying the selected placement cell. -/
theorem false_of_terminalStaticNextRowThreeTriadMembershipBank
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
      (terminalStaticThreeTriadMembershipDimacs cell bank)) : False := by
  obtain ⟨d, hparent⟩ :=
    exists_staticAssign_sat_frozenParentDimacs cell hrow hadded pointOf hreal
      hconv (by intro y; simp)
  let base := staticAssign cell blocker row d pointOf
  let familyAssign := positiveMembershipAssign base 44875 row
    BlockSpanningMembershipFamilyCnf.requirementAt
  let σ := positiveMembershipAssign familyAssign 44897 row
    StaticCell1AfterFamilyThreeTriadMembershipCnf.requirementAt
  have hbase : ∀ n, n ≤ SafeCoverCnf.baseNumVars →
      base n = SafeCoverCnf.finalAssign (coverIndex row) n :=
    staticAssign_agreesOnBase cell blocker row d pointOf
  have hfamilyBase : ∀ n, n ≤ SafeCoverCnf.baseNumVars →
      familyAssign n = SafeCoverCnf.finalAssign (coverIndex row) n := by
    intro n hn
    have hnCutoff : n ≤ 44875 := by
      rw [SafeCoverCnf.baseNumVars_eq] at hn
      omega
    change positiveMembershipAssign base 44875 row
        BlockSpanningMembershipFamilyCnf.requirementAt n =
      SafeCoverCnf.finalAssign (coverIndex row) n
    rw [positiveMembershipAssign_of_le base 44875 row
      BlockSpanningMembershipFamilyCnf.requirementAt hnCutoff]
    exact hbase n hn
  have hσbase : ∀ n, n ≤ SafeCoverCnf.baseNumVars →
      σ n = SafeCoverCnf.finalAssign (coverIndex row) n := by
    intro n hn
    have hnCutoff : n ≤ 44897 := by
      rw [SafeCoverCnf.baseNumVars_eq] at hn
      omega
    change positiveMembershipAssign familyAssign 44897 row
        StaticCell1AfterFamilyThreeTriadMembershipCnf.requirementAt n =
      SafeCoverCnf.finalAssign (coverIndex row) n
    rw [positiveMembershipAssign_of_le familyAssign 44897 row
      StaticCell1AfterFamilyThreeTriadMembershipCnf.requirementAt hnCutoff]
    exact hfamilyBase n hn
  apply hterminal
  refine ⟨σ, ?_⟩
  intro clause hclause
  change clause ∈ frozenParentDimacs cell ++
    (BlockSpanningMembershipFamilyCnf.implicationDimacs ++
      (BlockSpanningMembershipFamilyCnf.blockingClauses ++
        (StaticCell1AfterFamilyThreeTriadMembershipCnf.implicationDimacs ++
          ([StaticCell1AfterFamilyThreeTriadMembershipCnf.blockingClause] ++
            bank.map fun nogood =>
            learnedClause nogood.choices)))) at hclause
  rcases List.mem_append.mp hclause with hparentClause | hrest
  · calc
      evalClauseD σ clause = evalClauseD familyAssign clause := by
        apply evalClauseD_supplement_preserves_family
        intro literal hliteral
        exact le_trans
          (frozenParentDimacs_lit_bound cell clause hparentClause literal
            hliteral) (by omega)
      _ = evalClauseD base clause := by
        apply SafeCoverCnf.evalClauseD_congr
        intro literal hliteral
        exact positiveMembershipAssign_of_le base 44875 row
          BlockSpanningMembershipFamilyCnf.requirementAt
          (frozenParentDimacs_lit_bound cell clause hparentClause literal
            hliteral)
      _ = true := hparent clause hparentClause
  · rcases List.mem_append.mp hrest with hfamilyImplication | hrest
    · rw [evalClauseD_supplement_preserves_family familyAssign row
          (familyImplicationDimacs_lit_bound clause hfamilyImplication)]
      exact BlockSpanningMembershipFamilyCnf.implicationDimacs_sat hrow base
        hbase hfamilyImplication
    · rcases List.mem_append.mp hrest with hfamilyBlock | hrest
      · obtain ⟨entry, hentry, rfl⟩ := List.mem_map.mp hfamilyBlock
        rw [evalClauseD_supplement_preserves_family familyAssign row
          (familyBlockingClauses_lit_bound _
            (List.mem_map.mpr ⟨entry, hentry, rfl⟩))]
        by_cases hfalse : evalClauseD familyAssign
            (positiveMembershipBlockingClause entry.definitions) = false
        · exact False.elim
            (BlockSpanningMembershipFamilyCnf.false_of_blockingClause_false
              base hreal order hforced hconv entry hentry hfalse)
        · cases heval : evalClauseD familyAssign
              (positiveMembershipBlockingClause entry.definitions) with
          | false => exact False.elim (hfalse heval)
          | true => rfl
      · rcases List.mem_append.mp hrest with hsupplementalImplication | hrest
        · exact
            StaticCell1AfterFamilyThreeTriadMembershipCnf.implicationDimacs_sat
              hrow familyAssign hfamilyBase hsupplementalImplication
        · rcases List.mem_append.mp hrest with hsupplementalBlock | hbank
          · simp only [List.mem_singleton] at hsupplementalBlock
            subst clause
            by_cases hfalse : evalClauseD σ
                StaticCell1AfterFamilyThreeTriadMembershipCnf.blockingClause =
              false
            · have hpositive :=
                StaticCell1AfterFamilyThreeTriadMembershipCnf.positiveRowsMatch_of_blockingClause_false
                  familyAssign row hfalse
              exact False.elim
                (staticCell1AfterFamilyThreeTriadPositiveNogood.refutes
                  hreal order hforced hconv hpositive)
            · cases heval : evalClauseD σ
                  StaticCell1AfterFamilyThreeTriadMembershipCnf.blockingClause with
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

/-- Exact production order for one fixed named-deletion arm: the historical
static/two-membership prefix, then the independently compiled arm suffix, then
the proof-carrying source-order bank. -/
def terminalStaticThreeTriadNamedDeletionArmDimacs
    (cell : FrozenNextRowArmCell)
    (bank : List SourceOrderPositiveNogood) : List (List Int) :=
  frozenParentDimacs cell.1 ++
    (BlockSpanningMembershipFamilyCnf.implicationDimacs ++
      (BlockSpanningMembershipFamilyCnf.blockingClauses ++
        (StaticCell1AfterFamilyThreeTriadMembershipCnf.implicationDimacs ++
          ([StaticCell1AfterFamilyThreeTriadMembershipCnf.blockingClause] ++
            (namedDeletionArmClauseDelta cell ++
              bank.map fun nogood => learnedClause nogood.choices)))))

/-- A terminal UNSAT proof for the exact fixed-arm production formula
contradicts every realized convex source configuration satisfying that arm.
This is a one-arm exact-twelve consumer; it is not an all-arm coverage theorem
or an arbitrary-cardinality lift. -/
theorem false_of_terminalStaticNextRowThreeTriadNamedDeletionArmBank
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    {blocker : Fin 5 → Label}
    (cell : FrozenNextRowArmCell)
    (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenNextRowFixedNamedDeletionArmAddedConstraintsHold
      row blocker (cell.1.1 : Label × Label).1
        (cell.1.1 : Label × Label).2 cell.2)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (bank : List SourceOrderPositiveNogood)
    (hencodable : ∀ nogood ∈ bank, ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support)
    (hterminal : DimacsUnsatisfiable
      (terminalStaticThreeTriadNamedDeletionArmDimacs cell bank)) : False := by
  obtain ⟨d, hparent⟩ :=
    exists_staticAssign_sat_frozenParentDimacs cell.1 hrow hadded.1 pointOf
      hreal hconv (by intro y; simp)
  let base := staticAssign cell.1 blocker row d pointOf
  let familyAssign := positiveMembershipAssign base 44875 row
    BlockSpanningMembershipFamilyCnf.requirementAt
  let σ := positiveMembershipAssign familyAssign 44897 row
    StaticCell1AfterFamilyThreeTriadMembershipCnf.requirementAt
  have hbase : ∀ n, n ≤ SafeCoverCnf.baseNumVars →
      base n = SafeCoverCnf.finalAssign (coverIndex row) n :=
    staticAssign_agreesOnBase cell.1 blocker row d pointOf
  have hfamilyBase : ∀ n, n ≤ SafeCoverCnf.baseNumVars →
      familyAssign n = SafeCoverCnf.finalAssign (coverIndex row) n := by
    intro n hn
    have hnCutoff : n ≤ 44875 := by
      rw [SafeCoverCnf.baseNumVars_eq] at hn
      omega
    change positiveMembershipAssign base 44875 row
        BlockSpanningMembershipFamilyCnf.requirementAt n =
      SafeCoverCnf.finalAssign (coverIndex row) n
    rw [positiveMembershipAssign_of_le base 44875 row
      BlockSpanningMembershipFamilyCnf.requirementAt hnCutoff]
    exact hbase n hn
  have hσbase : ∀ n, n ≤ SafeCoverCnf.baseNumVars →
      σ n = SafeCoverCnf.finalAssign (coverIndex row) n := by
    intro n hn
    have hnCutoff : n ≤ 44897 := by
      rw [SafeCoverCnf.baseNumVars_eq] at hn
      omega
    change positiveMembershipAssign familyAssign 44897 row
        StaticCell1AfterFamilyThreeTriadMembershipCnf.requirementAt n =
      SafeCoverCnf.finalAssign (coverIndex row) n
    rw [positiveMembershipAssign_of_le familyAssign 44897 row
      StaticCell1AfterFamilyThreeTriadMembershipCnf.requirementAt hnCutoff]
    exact hfamilyBase n hn
  apply hterminal
  refine ⟨σ, ?_⟩
  intro clause hclause
  change clause ∈ frozenParentDimacs cell.1 ++
    (BlockSpanningMembershipFamilyCnf.implicationDimacs ++
      (BlockSpanningMembershipFamilyCnf.blockingClauses ++
        (StaticCell1AfterFamilyThreeTriadMembershipCnf.implicationDimacs ++
          ([StaticCell1AfterFamilyThreeTriadMembershipCnf.blockingClause] ++
            (namedDeletionArmClauseDelta cell ++
              bank.map fun nogood => learnedClause nogood.choices))))) at hclause
  rcases List.mem_append.mp hclause with hparentClause | hrest
  · calc
      evalClauseD σ clause = evalClauseD familyAssign clause := by
        apply evalClauseD_supplement_preserves_family
        intro literal hliteral
        exact le_trans
          (frozenParentDimacs_lit_bound cell.1 clause hparentClause literal
            hliteral) (by omega)
      _ = evalClauseD base clause := by
        apply SafeCoverCnf.evalClauseD_congr
        intro literal hliteral
        exact positiveMembershipAssign_of_le base 44875 row
          BlockSpanningMembershipFamilyCnf.requirementAt
          (frozenParentDimacs_lit_bound cell.1 clause hparentClause literal
            hliteral)
      _ = true := hparent clause hparentClause
  · rcases List.mem_append.mp hrest with hfamilyImplication | hrest
    · rw [evalClauseD_supplement_preserves_family familyAssign row
          (familyImplicationDimacs_lit_bound clause hfamilyImplication)]
      exact BlockSpanningMembershipFamilyCnf.implicationDimacs_sat hrow base
        hbase hfamilyImplication
    · rcases List.mem_append.mp hrest with hfamilyBlock | hrest
      · obtain ⟨entry, hentry, rfl⟩ := List.mem_map.mp hfamilyBlock
        rw [evalClauseD_supplement_preserves_family familyAssign row
          (familyBlockingClauses_lit_bound _
            (List.mem_map.mpr ⟨entry, hentry, rfl⟩))]
        by_cases hfalse : evalClauseD familyAssign
            (positiveMembershipBlockingClause entry.definitions) = false
        · exact False.elim
            (BlockSpanningMembershipFamilyCnf.false_of_blockingClause_false
              base hreal order hforced hconv entry hentry hfalse)
        · cases heval : evalClauseD familyAssign
              (positiveMembershipBlockingClause entry.definitions) with
          | false => exact False.elim (hfalse heval)
          | true => rfl
      · rcases List.mem_append.mp hrest with hsupplementalImplication | hrest
        · exact
            StaticCell1AfterFamilyThreeTriadMembershipCnf.implicationDimacs_sat
              hrow familyAssign hfamilyBase hsupplementalImplication
        · rcases List.mem_append.mp hrest with hsupplementalBlock | hrest
          · simp only [List.mem_singleton] at hsupplementalBlock
            subst clause
            by_cases hfalse : evalClauseD σ
                StaticCell1AfterFamilyThreeTriadMembershipCnf.blockingClause =
              false
            · have hpositive :=
                StaticCell1AfterFamilyThreeTriadMembershipCnf.positiveRowsMatch_of_blockingClause_false
                  familyAssign row hfalse
              exact False.elim
                (staticCell1AfterFamilyThreeTriadPositiveNogood.refutes
                  hreal order hforced hconv hpositive)
            · cases heval : evalClauseD σ
                  StaticCell1AfterFamilyThreeTriadMembershipCnf.blockingClause with
              | false => exact False.elim (hfalse heval)
              | true => rfl
          · rcases List.mem_append.mp hrest with harm | hbank
            · calc
                evalClauseD σ clause = evalClauseD familyAssign clause := by
                  apply evalClauseD_supplement_preserves_family
                  intro literal hliteral
                  exact (namedDeletionArmClauseDelta_lit_bound cell clause harm
                    literal hliteral).trans (by
                      rw [nextRowFinalNumVars_eq]
                      omega)
                _ = evalClauseD base clause := by
                  apply SafeCoverCnf.evalClauseD_congr
                  intro literal hliteral
                  exact positiveMembershipAssign_of_le base 44875 row
                    BlockSpanningMembershipFamilyCnf.requirementAt
                    ((namedDeletionArmClauseDelta_lit_bound cell clause harm
                      literal hliteral).trans (by
                        rw [nextRowFinalNumVars_eq]
                        omega))
                _ = evalClauseD (nextRowAssign cell.1 blocker row d) clause := by
                  apply SafeCoverCnf.evalClauseD_congr
                  intro literal hliteral
                  exact staticAssign_eq_nextRowAssign_of_le cell.1 blocker row d
                    pointOf
                    (namedDeletionArmClauseDelta_lit_bound cell clause harm
                      literal hliteral)
                _ = true := nextRowAssign_sat_namedDeletionArmClauseDelta
                  cell hrow hadded d clause harm
            · obtain ⟨nogood, hnogood, rfl⟩ := List.mem_map.mp hbank
              by_cases hfalse : evalClauseD σ
                  (learnedClause nogood.choices) = false
              · have hsourceFalse :
                    evalClauseD (SafeCoverCnf.finalAssign (coverIndex row))
                        (learnedClause nogood.choices) = false := by
                  rw [← evalClauseD_of_agreesOnBase_learnedClause_eq
                    nogood.choices (hencodable nogood hnogood) hσbase]
                  exact hfalse
                have hselected := selectedByCoverIndex_of_learnedClause_false
                  hrow (hencodable nogood hnogood) hsourceFalse
                have hpositive := positiveRowsMatch_of_selectedByCoverIndex hrow
                  hselected
                exact False.elim
                  (nogood.refutes hreal order hforced hconv hpositive)
              · cases heval : evalClauseD σ
                    (learnedClause nogood.choices) with
                | false => exact False.elim (hfalse heval)
                | true => rfl
end ThreeTriadMembershipTerminalConsumer
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
