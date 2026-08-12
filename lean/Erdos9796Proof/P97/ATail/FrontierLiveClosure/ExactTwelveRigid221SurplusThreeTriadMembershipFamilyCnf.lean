/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SurplusThreeTriadCertificate

/-!
# Exact CNF binding for the surplus three-triad membership family

This file binds the three checked surplus-role instances to the deterministic
positive-membership CNF extension installed after the second-cap/apex/surplus
family.  The extension contains ten shared fresh variables, 175 candidate
implications, and three four-literal blocking clauses.

This is an exact-twelve predicate-ingress bridge.  It does not assert terminal
UNSAT, complete arm/placement coverage, an arbitrary-cardinality lift, or live
theorem closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace SurplusThreeTriadMembershipFamilyCnf

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open PositiveMembershipCnfBridge
open SafeCoverCnf
open SafeCoverIndexBridge
open SourceOrderTerminalBankConsumer
open scoped EuclideanGeometry

private def mkDefinition (varIndex : Nat) (center : Label)
    (support : Finset Label) : PositiveMembershipDefinition :=
  { varIndex := varIndex
    requirement := { center := center, support := support } }

def definition6_39 := mkDefinition 45001 6 {3, 9}
def definition6_49 := mkDefinition 45002 6 {4, 9}
def definition6_59 := mkDefinition 45003 6 {5, 9}
def definition7_368 := mkDefinition 45004 7 {3, 6, 8}
def definition7_468 := mkDefinition 45005 7 {4, 6, 8}
def definition7_568 := mkDefinition 45006 7 {5, 6, 8}
def definition8_369 := mkDefinition 45007 8 {3, 6, 9}
def definition8_469 := mkDefinition 45008 8 {4, 6, 9}
def definition8_569 := mkDefinition 45009 8 {5, 6, 9}
def definition9_67 := mkDefinition 45010 9 {6, 7}

/-- Fresh definitions in exactly the lexicographic order used by the Python
compiler. -/
def definitions : List PositiveMembershipDefinition :=
  [definition6_39, definition6_49, definition6_59,
    definition7_368, definition7_468, definition7_568,
    definition8_369, definition8_469, definition8_569, definition9_67]

/-- Total source meaning for all ten fresh variables. -/
def requirementAt (v : Nat) : RowChoice Label :=
  ((definitions.find? fun definition =>
    decide (definition.varIndex = v)).getD definition6_39).requirement

/-- Candidate indices containing each requirement, in canonical compiler
order. -/
def candidateIndicesFor (definition : PositiveMembershipDefinition) : List Nat :=
  match definition.varIndex with
  | 45001 =>
      [4, 32, 59, 64, 68, 71, 74, 75, 115, 142, 147, 151, 154, 157,
        158, 197, 202, 206, 209, 212, 213, 251, 255, 258, 261, 262,
        265, 268, 271, 272, 276, 277, 279, 280, 282]
  | 45002 =>
      [10, 38, 59, 79, 83, 86, 89, 90, 121, 142, 162, 166, 169, 172,
        173, 197, 217, 221, 224, 227, 228, 251, 255, 258, 261, 262,
        284, 287, 290, 291, 295, 296, 298, 299, 301]
  | 45003 =>
      [15, 43, 64, 79, 93, 96, 99, 100, 126, 147, 162, 176, 179, 182,
        183, 202, 217, 231, 234, 237, 238, 251, 265, 268, 271, 272,
        284, 287, 290, 291, 304, 305, 307, 308, 310]
  | 45004 => [67, 150, 205, 254, 264, 274, 275]
  | 45005 => [82, 165, 220, 254, 283, 293, 294]
  | 45006 => [92, 175, 230, 264, 283, 302, 303]
  | 45007 => [68, 151, 206, 255, 265, 276, 277]
  | 45008 => [83, 166, 221, 255, 284, 295, 296]
  | 45009 => [93, 176, 231, 265, 284, 304, 305]
  | 45010 =>
      [18, 46, 67, 82, 92, 102, 103, 129, 150, 165, 175, 185, 186,
        205, 220, 230, 240, 241, 254, 264, 274, 275, 283, 293, 294,
        302, 303, 311]
  | _ => []

/-- The candidate-index computation performed by the Python compiler: scan the
canonical candidate table in increasing index order and retain exactly the
rows containing every required support label. -/
def compilerCandidateIndicesFor
    (definition : PositiveMembershipDefinition) : List Nat :=
  (List.range (SafeCoverCnf.candCount definition.requirement.center.val)).filter
    fun candidateIndex =>
      decide (∀ a ∈ definition.requirement.support,
        ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
          candidateIndex 0).testBit a.val = true)

/-- The handwritten compact tables are extensionally equal to the complete
compiler scan for every installed definition.  This rules out a one-way-only
candidate binding: no Python implication is omitted by the Lean table. -/
theorem candidateIndicesFor_eq_compiler
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ definitions) :
    candidateIndicesFor definition = compilerCandidateIndicesFor definition := by
  have hall : definitions.all (fun current =>
      decide (candidateIndicesFor current =
        compilerCandidateIndicesFor current)) = true := by
    native_decide
  exact of_decide_eq_true
    (List.all_eq_true.mp hall definition hdefinition)

/-- The exact 175 candidate implications emitted by the family compiler. -/
def implicationDimacs : List (List Int) :=
  definitions.flatMap fun definition =>
    positiveMembershipIndexImplicationClauses
      definition.requirement.center (candidateIndicesFor definition) definition

private def definitionCompilerValid
    (definition : PositiveMembershipDefinition) : Bool :=
  decide (45000 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          45000 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ definitions) :
    45000 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            45000 ∧
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

/-- The source valuation satisfies all 175 deterministic implication clauses. -/
theorem implicationDimacs_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v)
    {clause : List Int} (hclause : clause ∈ implicationDimacs) :
    evalClauseD (positiveMembershipAssign base 45000 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ :=
    List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 45000
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

/-- The three surplus roles, in Python compiler order. -/
def familyData : List SurplusThreeTriadData :=
  [{a := 3}, {a := 4}, {a := 5}]

def familyChoices (data : SurplusThreeTriadData) : List (RowChoice Label) :=
  [{center := 6, support := {data.a, 9}},
    {center := 7, support := {data.a, 6, 8}},
    {center := 8, support := {data.a, 6, 9}},
    {center := 9, support := {6, 7}}]

def lookupDefinition
    (requirement : RowChoice Label) : PositiveMembershipDefinition :=
  (definitions.find? fun definition =>
    decide (definition.requirement = requirement)).getD definition6_39

structure FamilyEntry where
  data : SurplusThreeTriadData
  definitions : List PositiveMembershipDefinition
deriving DecidableEq

def entries : List FamilyEntry :=
  familyData.map fun data =>
    { data := data
      definitions := (familyChoices data).map lookupDefinition }

def blockingClauses : List (List Int) :=
  entries.map fun entry => positiveMembershipBlockingClause entry.definitions

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

/-- Falsifying one family block contradicts the source geometry through the
checked surplus three-triad theorem. -/
theorem false_of_blockingClause_false
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (entry : FamilyEntry) (hentry : entry ∈ entries)
    (hfalse : evalClauseD
      (positiveMembershipAssign base 45000 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_positiveMembershipBlockingClause_false
      base 45000 row requirementAt entry.definitions
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).1)
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).2.1)
      hfalse
  let nogood := SourceOrderPositiveNogood.ofSurplusThreeTriad
    (entry.definitions.map fun definition => definition.requirement)
    entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end SurplusThreeTriadMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
