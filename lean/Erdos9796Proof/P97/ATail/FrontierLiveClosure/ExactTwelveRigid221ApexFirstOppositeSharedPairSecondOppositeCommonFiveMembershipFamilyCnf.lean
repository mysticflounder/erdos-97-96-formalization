/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexFirstOppositeSharedPairSecondOppositeCommonFiveCertificate
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexSharedPairCrossBlockMembershipFamilyCnf

/-!
# Exact CNF binding for the 96-role successor common-five family

This file binds every source-valid `(a, b, c, y)` role assignment to the
deterministic positive-membership extension installed after the apex/first-opposite
shared-pair family.  Twelve apex-zero requirements reuse variables from the
earlier apex-shared-pair cross-block family, and forty-eight requirements receive
fresh variables.  Each of the 96 role instances encodes

* `row 0 ⊇ {a, b}`;
* `row y ⊇ {a, b}`; and
* `row c ⊇ {b, 0, y}`.

This is finite exact-twelve predicate ingress.  It is not terminal UNSAT,
complete arm coverage, an arbitrary-cardinality lift, or live closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open PositiveMembershipCnfBridge
open SafeCoverCnf
open SafeCoverIndexBridge
open SourceOrderTerminalBankConsumer
open scoped EuclideanGeometry

private def mkRequirement (center : Label) (support : Finset Label) :
    RowChoice Label :=
  { center := center, support := support }

private def fallbackFreshRequirement : RowChoice Label :=
  mkRequirement 6 {3, 0, 10}

/-- The forty-eight genuinely fresh requirements, in Python allocation order. -/
def freshRequirements : List (RowChoice Label) :=
  (([6, 7, 8, 9] : List Label).flatMap fun c =>
      ([3, 4, 5] : List Label).flatMap fun b =>
        ([10, 11] : List Label).map fun y =>
          mkRequirement c {b, 0, y}) ++
    (([10, 11] : List Label).flatMap fun y =>
      ([3, 4, 5] : List Label).flatMap fun b =>
        ([6, 7, 8, 9] : List Label).map fun a =>
          mkRequirement y {a, b})

private def mkDefinition (index : Nat) : PositiveMembershipDefinition :=
  { varIndex := 45177 + index
    requirement := freshRequirements.getD index fallbackFreshRequirement }

/-- The forty-eight fresh definitions, occupying DIMACS variables 45177--45224. -/
def freshDefinitions : List PositiveMembershipDefinition :=
  (List.range freshRequirements.length).map mkDefinition

def d45177 : PositiveMembershipDefinition := freshDefinitions.getD 0
  { varIndex := 45177, requirement := fallbackFreshRequirement }

/-- Exact ancestor definitions reused by the Python compiler. -/
def reusedDefinitions : List PositiveMembershipDefinition :=
  [ApexSharedPairCrossBlockMembershipFamilyCnf.definition0_36,
    ApexSharedPairCrossBlockMembershipFamilyCnf.definition0_37,
    ApexSharedPairCrossBlockMembershipFamilyCnf.definition0_38,
    ApexSharedPairCrossBlockMembershipFamilyCnf.definition0_39,
    ApexSharedPairCrossBlockMembershipFamilyCnf.definition0_46,
    ApexSharedPairCrossBlockMembershipFamilyCnf.definition0_47,
    ApexSharedPairCrossBlockMembershipFamilyCnf.definition0_48,
    ApexSharedPairCrossBlockMembershipFamilyCnf.definition0_49,
    ApexSharedPairCrossBlockMembershipFamilyCnf.definition0_56,
    ApexSharedPairCrossBlockMembershipFamilyCnf.definition0_57,
    ApexSharedPairCrossBlockMembershipFamilyCnf.definition0_58,
    ApexSharedPairCrossBlockMembershipFamilyCnf.definition0_59]

/-- Every definition referenced by a family block, partitioned by allocation. -/
def definitions : List PositiveMembershipDefinition :=
  freshDefinitions ++ reusedDefinitions

def requirementAt (v : Nat) : RowChoice Label :=
  ((freshDefinitions.find? fun definition =>
    decide (definition.varIndex = v)).getD d45177).requirement

def candidateIndicesFor
    (definition : PositiveMembershipDefinition) : List Nat :=
  (List.range (SafeCoverCnf.candCount definition.requirement.center.val)).filter
    fun candidateIndex =>
      decide (∀ a ∈ definition.requirement.support,
        ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
          candidateIndex 0).testBit a.val = true)

def implicationDimacs : List (List Int) :=
  freshDefinitions.flatMap fun definition =>
    positiveMembershipIndexImplicationClauses
      definition.requirement.center (candidateIndicesFor definition) definition

private def definitionCompilerValid
    (definition : PositiveMembershipDefinition) : Bool :=
  decide (45176 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          45176 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ freshDefinitions) :
    45176 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            45176 ∧
          ∀ a ∈ definition.requirement.support,
            ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
              candidateIndex 0).testBit a.val = true := by
  have hall : freshDefinitions.all definitionCompilerValid = true := by native_decide
  have hvalid := List.all_eq_true.mp hall definition hdefinition
  simp only [definitionCompilerValid, Bool.and_eq_true] at hvalid
  have hhead := of_decide_eq_true hvalid.1
  refine ⟨hhead.1, hhead.2, ?_⟩
  intro candidateIndex hcandidateIndex
  exact of_decide_eq_true
    (List.all_eq_true.mp hvalid.2 candidateIndex hcandidateIndex)

theorem implicationDimacs_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v)
    {clause : List Int} (hclause : clause ∈ implicationDimacs) :
    evalClauseD (positiveMembershipAssign base 45176 row requirementAt)
      clause = true := by
  simp only [implicationDimacs, List.mem_flatMap] at hclause
  rcases hclause with ⟨definition, hdefinition, hclause⟩
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 45176
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

/-- All 96 role assignments in lexicographic `(a, b, c, y)` order. -/
def familyData :
    List ApexFirstOppositeSharedPairSecondOppositeCommonFiveData :=
  ([6, 7, 8, 9] : List Label).flatMap fun a =>
    ([3, 4, 5] : List Label).flatMap fun b =>
      ([6, 7, 8, 9] : List Label).flatMap fun c =>
        ([10, 11] : List Label).map fun y => {a := a, b := b, c := c, y := y}

def familyChoices
    (data : ApexFirstOppositeSharedPairSecondOppositeCommonFiveData) :
    List (RowChoice Label) :=
  [{center := 0, support := {data.a, data.b}},
    {center := data.c, support := {data.b, 0, data.y}},
    {center := data.y, support := {data.a, data.b}}]

def lookupDefinition
    (requirement : RowChoice Label) : PositiveMembershipDefinition :=
  (definitions.find? fun definition =>
    decide (definition.requirement = requirement)).getD d45177

structure FamilyEntry where
  data : ApexFirstOppositeSharedPairSecondOppositeCommonFiveData
  definitions : List PositiveMembershipDefinition
deriving DecidableEq

def entries : List FamilyEntry :=
  familyData.map fun data =>
    { data := data
      definitions := (familyChoices data).map lookupDefinition }

def blockingClauses : List (List Int) :=
  entries.map fun entry => positiveMembershipBlockingClause entry.definitions

/-- Executable cardinality and variable-range anchor for the exact family. -/
theorem family_shape :
    freshDefinitions.length = 48 ∧ reusedDefinitions.length = 12 ∧
      definitions.length = 60 ∧ entries.length = 96 ∧
      blockingClauses.length = 96 ∧
      freshDefinitions.all (fun definition => decide
        (45177 ≤ definition.varIndex ∧ definition.varIndex ≤ 45224)) = true := by
  native_decide

private def entryValid (entry : FamilyEntry) : Bool :=
  entry.data.check
      (entry.definitions.map fun definition => definition.requirement) &&
    entry.definitions.all fun definition => decide (definition ∈ definitions)

private theorem entry_valid {entry : FamilyEntry} (hentry : entry ∈ entries) :
    entry.data.check
        (entry.definitions.map fun definition => definition.requirement) = true ∧
      ∀ definition ∈ entry.definitions, definition ∈ definitions := by
  have hall : entries.all entryValid = true := by native_decide
  have hvalid := List.all_eq_true.mp hall entry hentry
  simp only [entryValid, Bool.and_eq_true] at hvalid
  refine ⟨hvalid.1, ?_⟩
  intro definition hdefinition
  exact of_decide_eq_true
    (List.all_eq_true.mp hvalid.2 definition hdefinition)

private theorem reused_definition_le_cutoff
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ reusedDefinitions) :
    definition.varIndex ≤ 45176 := by
  have hall : (reusedDefinitions.all fun current =>
      decide (current.varIndex ≤ 45176)) = true := by native_decide
  exact of_decide_eq_true
    (List.all_eq_true.mp hall definition hdefinition)

private theorem positiveRowsMatch_of_mixed_blockingClause_false
    (base : Nat → Bool) (row : RowPattern Label)
    (entryDefinitions : List PositiveMembershipDefinition)
    (hdefinitions : ∀ definition ∈ entryDefinitions, definition ∈ definitions)
    (hreused : ∀ definition ∈ reusedDefinitions,
      base definition.varIndex = decide
        (definition.requirement.support ⊆ row definition.requirement.center))
    (hfalse : evalClauseD
      (positiveMembershipAssign base 45176 row requirementAt)
      (positiveMembershipBlockingClause entryDefinitions) = false) :
    PositiveRowsMatch row (entryDefinitions.map fun definition =>
      definition.requirement) := by
  have hall : ∀ literal ∈ positiveMembershipBlockingClause entryDefinitions,
      evalLitD (positiveMembershipAssign base 45176 row requirementAt)
        literal = false := by
    rw [evalClauseD, List.any_eq_false] at hfalse
    intro literal hliteral
    exact Bool.eq_false_of_not_eq_true (hfalse literal hliteral)
  intro requirement hrequirement
  obtain ⟨definition, hdefinition, rfl⟩ := List.mem_map.mp hrequirement
  have hliteral : -(Int.ofNat definition.varIndex) ∈
      positiveMembershipBlockingClause entryDefinitions :=
    List.mem_map_of_mem hdefinition
  have heval := hall (-(Int.ofNat definition.varIndex)) hliteral
  have hscope := hdefinitions definition hdefinition
  rw [definitions, List.mem_append] at hscope
  rcases hscope with hfresh | hreusedDefinition
  · have hvalid := definition_compiler_valid hfresh
    rw [evalLitD_negNat,
      positiveMembershipAssign_of_lt _ _ _ _ hvalid.1,
      hvalid.2.1] at heval
    have htrue : decide (definition.requirement.support ⊆
        row definition.requirement.center) = true := by
      cases hvalue : decide (definition.requirement.support ⊆
          row definition.requirement.center) <;> simp [hvalue] at heval ⊢
    exact of_decide_eq_true htrue
  · rw [evalLitD_negNat,
      positiveMembershipAssign_of_le _ _ _ _
        (reused_definition_le_cutoff hreusedDefinition),
      hreused definition hreusedDefinition] at heval
    have htrue : decide (definition.requirement.support ⊆
        row definition.requirement.center) = true := by
      cases hvalue : decide (definition.requirement.support ⊆
          row definition.requirement.center) <;> simp [hvalue] at heval ⊢
    exact of_decide_eq_true htrue

/-- Falsifying one family block contradicts source geometry through the checked
96-role common-five theorem. -/
theorem false_of_blockingClause_false
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (hreused : ∀ definition ∈ reusedDefinitions,
      base definition.varIndex = decide
        (definition.requirement.support ⊆ row definition.requirement.center))
    (entry : FamilyEntry) (hentry : entry ∈ entries)
    (hfalse : evalClauseD
      (positiveMembershipAssign base 45176 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_mixed_blockingClause_false base row entry.definitions
      hvalid.2 hreused hfalse
  let nogood :=
    SourceOrderPositiveNogood.ofApexFirstOppositeSharedPairSecondOppositeCommonFive
      (entry.definitions.map fun definition => definition.requirement)
      entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
