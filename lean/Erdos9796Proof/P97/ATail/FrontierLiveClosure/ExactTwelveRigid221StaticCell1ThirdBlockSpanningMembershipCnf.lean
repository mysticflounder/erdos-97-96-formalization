/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticCell1ThirdBlockSpanningPositiveCut
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge

/-!
# Exact CNF binding for the cell-1 block-spanning membership cut

This file binds the three fresh variables and 57 candidate implications emitted
by `exact12_positive_membership_cnf.py`.  The source assignment satisfies every
implication, and falsifying the final three-literal block supplies exactly the
positive rows consumed by the block-spanning common-five nogood.

This is a predicate ingress bridge.  It does not prove terminal UNSAT,
all-cell coverage, an arbitrary-cardinality lift, or closure of a live leaf.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace StaticCell1ThirdBlockSpanningMembershipCnf

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open PositiveMembershipCnfBridge
open SafeCoverCnf
open SafeCoverIndexBridge
open SourceOrderTerminalBankConsumer

def definition1 : PositiveMembershipDefinition :=
  { varIndex := 44876
    requirement := { center := 1, support := {0, 6} } }

def definition3 : PositiveMembershipDefinition :=
  { varIndex := 44877
    requirement := { center := 3, support := {0, 1, 5} } }

def definition5 : PositiveMembershipDefinition :=
  { varIndex := 44878
    requirement := { center := 5, support := {0, 6} } }

def definitions : List PositiveMembershipDefinition :=
  [definition1, definition3, definition5]

/-- Total source meaning for the three fresh variables.  Values at all other
fresh indices are irrelevant to this bank. -/
def requirementAt : Nat → RowChoice Label
  | 44876 => definition1.requirement
  | 44877 => definition3.requirement
  | 44878 => definition5.requirement
  | _ => definition1.requirement

def candidateIndices1 : List Nat :=
  [0, 1, 2, 6, 7, 8, 12, 13, 14, 18, 19, 20, 24, 25, 26]

def candidateIndices3 : List Nat :=
  [0, 7, 8, 9, 10, 11, 12]

def candidateIndices5 : List Nat :=
  [1, 7, 13, 14, 15, 16, 17, 29, 35, 41, 42, 43, 44, 45, 56, 62,
    63, 64, 65, 66, 77, 78, 79, 80, 81, 92, 93, 94, 95, 96, 97, 98,
    99, 100, 101]

/-- The exact 57 compiler implications, in deterministic compiler order. -/
def implicationDimacs : List (List Int) :=
  positiveMembershipIndexImplicationClauses 1 candidateIndices1 definition1 ++
  positiveMembershipIndexImplicationClauses 3 candidateIndices3 definition3 ++
  positiveMembershipIndexImplicationClauses 5 candidateIndices5 definition5

/-- The exact final compiler block. -/
def blockingClause : List Int :=
  positiveMembershipBlockingClause definitions

theorem definitions_requirements :
    definitions.map (fun definition => definition.requirement) =
      staticCell1ThirdBlockSpanningMembershipChoices := by
  native_decide

private theorem group1_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v) :
    ∀ clause ∈ positiveMembershipIndexImplicationClauses 1
        candidateIndices1 definition1,
      evalClauseD (positiveMembershipAssign base 44875 row requirementAt)
        clause = true := by
  apply positiveMembershipIndexImplicationClauses_sat hrow
  · native_decide
  · native_decide
  · native_decide
  · native_decide
  · intro i hi
    apply hbase
    have : ∀ i ∈ candidateIndices1,
        SafeCoverCnf.xVar 1 i ≤ SafeCoverCnf.baseNumVars := by native_decide
    exact this i hi
  · native_decide
  · native_decide

private theorem group3_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v) :
    ∀ clause ∈ positiveMembershipIndexImplicationClauses 3
        candidateIndices3 definition3,
      evalClauseD (positiveMembershipAssign base 44875 row requirementAt)
        clause = true := by
  apply positiveMembershipIndexImplicationClauses_sat hrow
  · native_decide
  · native_decide
  · native_decide
  · native_decide
  · intro i hi
    apply hbase
    have : ∀ i ∈ candidateIndices3,
        SafeCoverCnf.xVar 3 i ≤ SafeCoverCnf.baseNumVars := by native_decide
    exact this i hi
  · native_decide
  · native_decide

private theorem group5_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v) :
    ∀ clause ∈ positiveMembershipIndexImplicationClauses 5
        candidateIndices5 definition5,
      evalClauseD (positiveMembershipAssign base 44875 row requirementAt)
        clause = true := by
  apply positiveMembershipIndexImplicationClauses_sat hrow
  · native_decide
  · native_decide
  · native_decide
  · native_decide
  · intro i hi
    apply hbase
    have : ∀ i ∈ candidateIndices5,
        SafeCoverCnf.xVar 5 i ≤ SafeCoverCnf.baseNumVars := by native_decide
    exact this i hi
  · native_decide
  · native_decide

/-- The source valuation satisfies all 57 implication clauses emitted by the
authenticated Python compiler. -/
theorem implicationDimacs_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v)
    {clause : List Int} (hclause : clause ∈ implicationDimacs) :
    evalClauseD (positiveMembershipAssign base 44875 row requirementAt)
      clause = true := by
  simp only [implicationDimacs, List.mem_append] at hclause
  rcases hclause with (hclause | hclause) | hclause
  · exact group1_sat hrow base hbase clause hclause
  · exact group3_sat hrow base hbase clause hclause
  · exact group5_sat hrow base hbase clause hclause

/-- A false final compiler block supplies exactly the generalized positive
rows consumed by the block-spanning Lean nogood. -/
theorem positiveRowsMatch_of_blockingClause_false
    (base : Nat → Bool) (row : RowPattern Label)
    (hfalse : evalClauseD
      (positiveMembershipAssign base 44875 row requirementAt)
      blockingClause = false) :
    PositiveRowsMatch row staticCell1ThirdBlockSpanningMembershipChoices := by
  rw [← definitions_requirements]
  exact positiveRowsMatch_of_positiveMembershipBlockingClause_false
    base 44875 row requirementAt definitions (by native_decide)
      (by native_decide) hfalse

end StaticCell1ThirdBlockSpanningMembershipCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
