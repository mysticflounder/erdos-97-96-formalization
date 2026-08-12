/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticCell1AfterFamilyThreeTriadPositiveCut
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge

/-!
# Exact CNF binding for the post-family cell-1 three-triad cut

Five fresh variables encode the five partial selected-row requirements used by
`staticCell1AfterFamilyThreeTriadPositiveNogood`.  The 34 deterministic
candidate implications and one five-literal block are layered after the
complete block-spanning family, whose last variable is 44,897.

This is a finite source-faithful predicate bridge.  It does not assert terminal
UNSAT, placement coverage, a universal lift, or live theorem closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace StaticCell1AfterFamilyThreeTriadMembershipCnf

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open PositiveMembershipCnfBridge
open SafeCoverCnf
open SafeCoverIndexBridge
open SourceOrderTerminalBankConsumer

private def mkDefinition (varIndex : Nat) (center : Label)
    (support : Finset Label) : PositiveMembershipDefinition :=
  { varIndex := varIndex
    requirement := { center := center, support := support } }

def definition0 := mkDefinition 44898 0 {1, 2}
def definition1 := mkDefinition 44899 1 {0, 6}
def definition2 := mkDefinition 44900 2 {0, 1, 11}
def definition6 := mkDefinition 44901 6 {2, 9, 11}
def definition9 := mkDefinition 44902 9 {1, 2, 11}

def definitions : List PositiveMembershipDefinition :=
  [definition0, definition1, definition2, definition6, definition9]

def requirementAt (v : Nat) : RowChoice Label :=
  ((definitions.find? fun definition =>
    decide (definition.varIndex = v)).getD definition0).requirement

def candidateIndicesFor (definition : PositiveMembershipDefinition) : List Nat :=
  match definition.varIndex with
  | 44898 => [0, 1, 2]
  | 44899 => [0, 1, 2, 6, 7, 8, 12, 13, 14, 18, 19, 20, 24, 25, 26]
  | 44900 => [0]
  | 44901 => [54, 137, 213, 228, 238, 243, 246, 248]
  | 44902 => [117, 123, 128, 132, 135, 137, 138]
  | _ => []

/-- The exact 34 compiler implications. -/
def implicationDimacs : List (List Int) :=
  definitions.flatMap fun definition =>
    positiveMembershipIndexImplicationClauses
      definition.requirement.center (candidateIndicesFor definition) definition

def blockingClause : List Int :=
  positiveMembershipBlockingClause definitions

theorem definitions_requirements :
    definitions.map (fun definition => definition.requirement) =
      staticCell1AfterFamilyThreeTriadPositiveChoices := by
  native_decide

private def definitionCompilerValid
    (definition : PositiveMembershipDefinition) : Bool :=
  decide (44897 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          44897 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ definitions) :
    44897 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            44897 ∧
          ∀ a ∈ definition.requirement.support,
            ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
              candidateIndex 0).testBit a.val = true := by
  have hall : definitions.all definitionCompilerValid = true := by
    native_decide
  have hvalid := List.all_eq_true.mp hall definition hdefinition
  simp only [definitionCompilerValid, Bool.and_eq_true] at hvalid
  have hhead := of_decide_eq_true hvalid.1
  refine ⟨hhead.1, hhead.2, ?_⟩
  intro candidateIndex hcandidateIndex
  exact of_decide_eq_true
    (List.all_eq_true.mp hvalid.2 candidateIndex hcandidateIndex)

/-- The nested source valuation satisfies all 34 implications. -/
theorem implicationDimacs_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v)
    {clause : List Int} (hclause : clause ∈ implicationDimacs) :
    evalClauseD (positiveMembershipAssign base 44897 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ :=
    List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 44897
    requirementAt definition.requirement.center
      (candidateIndicesFor definition) definition
  · intro candidateIndex hcandidateIndex
    exact (hvalid.2.2 candidateIndex hcandidateIndex).1
  · rfl
  · intro candidateIndex hcandidateIndex
    exact (hvalid.2.2 candidateIndex hcandidateIndex).2.2
  · intro candidateIndex hcandidateIndex
    exact (hvalid.2.2 candidateIndex hcandidateIndex).2.1
  · intro candidateIndex hcandidateIndex
    apply hbase
    have hi := (hvalid.2.2 candidateIndex hcandidateIndex).1
    calc
      SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          SafeCoverCnf.nX :=
        SafeCoverCnf.xVar_le_nX definition.requirement.center.isLt hi
      _ ≤ SafeCoverCnf.baseNumVars := by
        rw [SafeCoverCnf.nX_eq, SafeCoverCnf.baseNumVars_eq]
        omega
  · exact hvalid.1
  · exact hvalid.2.1
  · exact hclause

/-- Falsifying the supplemental block recovers exactly the five positive rows
consumed by the three-triad cut. -/
theorem positiveRowsMatch_of_blockingClause_false
    (base : Nat → Bool) (row : RowPattern Label)
    (hfalse : evalClauseD
      (positiveMembershipAssign base 44897 row requirementAt)
      blockingClause = false) :
    PositiveRowsMatch row staticCell1AfterFamilyThreeTriadPositiveChoices := by
  rw [← definitions_requirements]
  exact positiveRowsMatch_of_positiveMembershipBlockingClause_false
    base 44897 row requirementAt definitions
      (fun definition hdefinition =>
        (definition_compiler_valid hdefinition).1)
      (fun definition hdefinition =>
        (definition_compiler_valid hdefinition).2.1)
      hfalse

end StaticCell1AfterFamilyThreeTriadMembershipCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
