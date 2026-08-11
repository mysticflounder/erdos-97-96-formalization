/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowStaticConvexCell0ThirdPositiveCut
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge

/-!
# Exact CNF binding for the third cell-0 positive-membership cut

This file binds the five fresh variables and 116 candidate implications emitted
by `exact12_positive_membership_cnf.py` for the third static-convex cell-0 cut.
The source assignment satisfies every implication, and falsifying the final
five-literal block supplies exactly the positive rows consumed by the Lean
nogood.

This does not value the earlier static-equality variables or prove terminal
UNSAT.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace NextRowStaticConvexCell0ThirdMembershipCnf

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open PositiveMembershipCnfBridge
open SafeCoverCnf
open SafeCoverIndexBridge
open SourceOrderTerminalBankConsumer

def definition3 : PositiveMembershipDefinition :=
  { varIndex := 44876
    requirement := { center := 3, support := {4, 6} } }

def definition6 : PositiveMembershipDefinition :=
  { varIndex := 44877
    requirement := { center := 6, support := {9, 10, 11} } }

def definition7 : PositiveMembershipDefinition :=
  { varIndex := 44878
    requirement := { center := 7, support := {4, 6} } }

def definition10 : PositiveMembershipDefinition :=
  { varIndex := 44879
    requirement := { center := 10, support := {3, 9} } }

def definition11 : PositiveMembershipDefinition :=
  { varIndex := 44880
    requirement := { center := 11, support := {3, 6, 7, 9} } }

def definitions : List PositiveMembershipDefinition :=
  [definition3, definition6, definition7, definition10, definition11]

/-- Total source meaning for the five fresh variables.  Values at all other
fresh indices are irrelevant to this bank. -/
def requirementAt : Nat → RowChoice Label
  | 44876 => definition3.requirement
  | 44877 => definition6.requirement
  | 44878 => definition7.requirement
  | 44879 => definition10.requirement
  | 44880 => definition11.requirement
  | _ => definition3.requirement

def candidateIndices3 : List Nat :=
  [1, 29, 56, 62, 63, 64, 65, 66, 113, 140, 146, 147, 148, 149, 150,
    196, 202, 203, 204, 205, 206, 252, 253, 254, 255, 256, 267, 268,
    269, 270, 271, 272, 273, 274, 275, 276]

def candidateIndices6 : List Nat :=
  [110, 193, 248, 282, 301, 310, 312, 313]

def candidateIndices7 : List Nat :=
  [8, 36, 57, 77, 82, 83, 84, 85, 119, 140, 160, 165, 166, 167, 168,
    195, 215, 220, 221, 222, 223, 249, 254, 255, 256, 257, 283, 284,
    285, 286, 293, 294, 295, 296, 297]

def candidateIndices10 : List Nat :=
  [5, 33, 60, 65, 69, 72, 74, 76, 117, 144, 149, 153, 156, 158, 160,
    200, 205, 209, 212, 214, 216, 255, 259, 262, 264, 266, 269, 272,
    274, 276, 278, 280, 282, 283, 285, 286]

def candidateIndices11 : List Nat := [278]

/-- The exact 116 compiler implications, in deterministic compiler order. -/
def implicationDimacs : List (List Int) :=
  positiveMembershipIndexImplicationClauses 3 candidateIndices3 definition3 ++
  positiveMembershipIndexImplicationClauses 6 candidateIndices6 definition6 ++
  positiveMembershipIndexImplicationClauses 7 candidateIndices7 definition7 ++
  positiveMembershipIndexImplicationClauses 10 candidateIndices10 definition10 ++
  positiveMembershipIndexImplicationClauses 11 candidateIndices11 definition11

/-- The exact final compiler block. -/
def blockingClause : List Int :=
  positiveMembershipBlockingClause definitions

theorem definitions_requirements :
    definitions.map (fun definition => definition.requirement) =
      nextRowStaticConvexCell0ThirdMembershipChoices := by
  native_decide

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

private theorem group6_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v) :
    ∀ clause ∈ positiveMembershipIndexImplicationClauses 6
        candidateIndices6 definition6,
      evalClauseD (positiveMembershipAssign base 44875 row requirementAt)
        clause = true := by
  apply positiveMembershipIndexImplicationClauses_sat hrow
  · native_decide
  · native_decide
  · native_decide
  · native_decide
  · intro i hi
    apply hbase
    have : ∀ i ∈ candidateIndices6,
        SafeCoverCnf.xVar 6 i ≤ SafeCoverCnf.baseNumVars := by native_decide
    exact this i hi
  · native_decide
  · native_decide

private theorem group7_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v) :
    ∀ clause ∈ positiveMembershipIndexImplicationClauses 7
        candidateIndices7 definition7,
      evalClauseD (positiveMembershipAssign base 44875 row requirementAt)
        clause = true := by
  apply positiveMembershipIndexImplicationClauses_sat hrow
  · native_decide
  · native_decide
  · native_decide
  · native_decide
  · intro i hi
    apply hbase
    have : ∀ i ∈ candidateIndices7,
        SafeCoverCnf.xVar 7 i ≤ SafeCoverCnf.baseNumVars := by native_decide
    exact this i hi
  · native_decide
  · native_decide

private theorem group10_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v) :
    ∀ clause ∈ positiveMembershipIndexImplicationClauses 10
        candidateIndices10 definition10,
      evalClauseD (positiveMembershipAssign base 44875 row requirementAt)
        clause = true := by
  apply positiveMembershipIndexImplicationClauses_sat hrow
  · native_decide
  · native_decide
  · native_decide
  · native_decide
  · intro i hi
    apply hbase
    have : ∀ i ∈ candidateIndices10,
        SafeCoverCnf.xVar 10 i ≤ SafeCoverCnf.baseNumVars := by native_decide
    exact this i hi
  · native_decide
  · native_decide

private theorem group11_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v) :
    ∀ clause ∈ positiveMembershipIndexImplicationClauses 11
        candidateIndices11 definition11,
      evalClauseD (positiveMembershipAssign base 44875 row requirementAt)
        clause = true := by
  apply positiveMembershipIndexImplicationClauses_sat hrow
  · native_decide
  · native_decide
  · native_decide
  · native_decide
  · intro i hi
    apply hbase
    have : ∀ i ∈ candidateIndices11,
        SafeCoverCnf.xVar 11 i ≤ SafeCoverCnf.baseNumVars := by native_decide
    exact this i hi
  · native_decide
  · native_decide

/-- The source valuation satisfies all 116 implication clauses emitted by the
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
  rcases hclause with (((hclause | hclause) | hclause) | hclause) | hclause
  · exact group3_sat hrow base hbase clause hclause
  · exact group6_sat hrow base hbase clause hclause
  · exact group7_sat hrow base hbase clause hclause
  · exact group10_sat hrow base hbase clause hclause
  · exact group11_sat hrow base hbase clause hclause

/-- A false final compiler block supplies exactly the generalized positive
rows consumed by the third Lean nogood. -/
theorem positiveRowsMatch_of_blockingClause_false
    (base : Nat → Bool) (row : RowPattern Label)
    (hfalse : evalClauseD
      (positiveMembershipAssign base 44875 row requirementAt)
      blockingClause = false) :
    PositiveRowsMatch row nextRowStaticConvexCell0ThirdMembershipChoices := by
  rw [← definitions_requirements]
  exact positiveRowsMatch_of_positiveMembershipBlockingClause_false
    base 44875 row requirementAt definitions (by native_decide)
      (by native_decide) hfalse

end NextRowStaticConvexCell0ThirdMembershipCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
