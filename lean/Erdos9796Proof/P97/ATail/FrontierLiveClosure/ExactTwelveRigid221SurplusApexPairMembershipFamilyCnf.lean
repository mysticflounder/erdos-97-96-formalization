/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SurplusApexPairCommonFiveCertificate

/-!
# Exact CNF binding for the surplus/apex-pair membership family

This file binds all 24 checked role assignments from
`SurplusApexPairCommonFiveData` to the deterministic positive-membership CNF
extension installed after the historical block-spanning and ThreeTriad banks.
The extension contains 23 shared fresh variables, 497 candidate implications,
and 24 three-literal blocking clauses.

This is an exact-twelve predicate-ingress bridge.  It does not assert terminal
UNSAT, complete arm/placement coverage, an arbitrary-cardinality lift, or live
theorem closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace SurplusApexPairMembershipFamilyCnf

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

def definition0_23 := mkDefinition 44903 0 {2, 3}
def definition0_24 := mkDefinition 44904 0 {2, 4}
def definition0_25 := mkDefinition 44905 0 {2, 5}
def definition6_23 := mkDefinition 44906 6 {2, 3}
def definition6_24 := mkDefinition 44907 6 {2, 4}
def definition6_25 := mkDefinition 44908 6 {2, 5}
def definition7_23 := mkDefinition 44909 7 {2, 3}
def definition7_24 := mkDefinition 44910 7 {2, 4}
def definition7_25 := mkDefinition 44911 7 {2, 5}
def definition8_23 := mkDefinition 44912 8 {2, 3}
def definition8_24 := mkDefinition 44913 8 {2, 4}
def definition8_25 := mkDefinition 44914 8 {2, 5}
def definition9_23 := mkDefinition 44915 9 {2, 3}
def definition9_24 := mkDefinition 44916 9 {2, 4}
def definition9_25 := mkDefinition 44917 9 {2, 5}
def definition10_026 := mkDefinition 44918 10 {0, 2, 6}
def definition10_027 := mkDefinition 44919 10 {0, 2, 7}
def definition10_028 := mkDefinition 44920 10 {0, 2, 8}
def definition10_029 := mkDefinition 44921 10 {0, 2, 9}
def definition11_026 := mkDefinition 44922 11 {0, 2, 6}
def definition11_027 := mkDefinition 44923 11 {0, 2, 7}
def definition11_028 := mkDefinition 44924 11 {0, 2, 8}
def definition11_029 := mkDefinition 44925 11 {0, 2, 9}

/-- Fresh definitions in exactly the lexicographic order used by the Python
compiler. -/
def definitions : List PositiveMembershipDefinition :=
  [definition0_23, definition0_24, definition0_25,
    definition6_23, definition6_24, definition6_25,
    definition7_23, definition7_24, definition7_25,
    definition8_23, definition8_24, definition8_25,
    definition9_23, definition9_24, definition9_25,
    definition10_026, definition10_027, definition10_028, definition10_029,
    definition11_026, definition11_027, definition11_028, definition11_029]

/-- Total source meaning for all 23 fresh variables. -/
def requirementAt (v : Nat) : RowChoice Label :=
  ((definitions.find? fun definition =>
    decide (definition.varIndex = v)).getD definition0_23).requirement

private def pair23InteriorCandidateIndices : List Nat :=
  [28, 29, 30, 31, 32, 33, 34, 111, 112, 113, 114, 115, 116, 117,
    194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206,
    207, 208, 209, 210, 211, 212, 213, 214]

private def pair24InteriorCandidateIndices : List Nat :=
  [28, 35, 36, 37, 38, 39, 40, 111, 118, 119, 120, 121, 122, 123,
    194, 195, 196, 197, 198, 199, 215, 216, 217, 218, 219, 220, 221,
    222, 223, 224, 225, 226, 227, 228, 229]

private def pair25InteriorCandidateIndices : List Nat :=
  [29, 35, 41, 42, 43, 44, 45, 112, 118, 124, 125, 126, 127, 128,
    194, 200, 201, 202, 203, 204, 215, 216, 217, 218, 219, 230, 231,
    232, 233, 234, 235, 236, 237, 238, 239]

private def triple026CandidateIndices : List Nat :=
  [30, 36, 41, 46, 47, 48, 49]

private def triple027CandidateIndices : List Nat :=
  [31, 37, 42, 46, 50, 51, 52]

private def triple028CandidateIndices : List Nat :=
  [32, 38, 43, 47, 50, 53, 54]

private def triple029CandidateIndices : List Nat :=
  [33, 39, 44, 48, 51, 53, 55]

/-- Candidate indices containing each requirement, in the canonical increasing
table order used by Python's `enumerate`. -/
def candidateIndicesFor (definition : PositiveMembershipDefinition) : List Nat :=
  match definition.varIndex with
  | 44903 => [0, 1, 16, 17, 18, 19, 20]
  | 44904 => [0, 2, 16, 17, 18, 21, 22]
  | 44905 => [1, 2, 16, 19, 20, 21, 22]
  | 44906 | 44909 | 44912 | 44915 => pair23InteriorCandidateIndices
  | 44907 | 44910 | 44913 | 44916 => pair24InteriorCandidateIndices
  | 44908 | 44911 | 44914 | 44917 => pair25InteriorCandidateIndices
  | 44918 | 44922 => triple026CandidateIndices
  | 44919 | 44923 => triple027CandidateIndices
  | 44920 | 44924 => triple028CandidateIndices
  | 44921 | 44925 => triple029CandidateIndices
  | _ => []

/-- The exact 497 candidate implications emitted by the family compiler. -/
def implicationDimacs : List (List Int) :=
  definitions.flatMap fun definition =>
    positiveMembershipIndexImplicationClauses
      definition.requirement.center (candidateIndicesFor definition) definition

private def definitionCompilerValid
    (definition : PositiveMembershipDefinition) : Bool :=
  decide (44902 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          44902 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ definitions) :
    44902 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            44902 ∧
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

/-- The source valuation satisfies all 497 deterministic implication clauses. -/
theorem implicationDimacs_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v)
    {clause : List Int} (hclause : clause ∈ implicationDimacs) :
    evalClauseD (positiveMembershipAssign base 44902 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ :=
    List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 44902
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

/-- The 24 role triples, in Python compiler order. -/
def familyData : List SurplusApexPairCommonFiveData :=
  [{a := 3, c := 10, y := 6}, {a := 3, c := 10, y := 7},
    {a := 3, c := 10, y := 8}, {a := 3, c := 10, y := 9},
    {a := 3, c := 11, y := 6}, {a := 3, c := 11, y := 7},
    {a := 3, c := 11, y := 8}, {a := 3, c := 11, y := 9},
    {a := 4, c := 10, y := 6}, {a := 4, c := 10, y := 7},
    {a := 4, c := 10, y := 8}, {a := 4, c := 10, y := 9},
    {a := 4, c := 11, y := 6}, {a := 4, c := 11, y := 7},
    {a := 4, c := 11, y := 8}, {a := 4, c := 11, y := 9},
    {a := 5, c := 10, y := 6}, {a := 5, c := 10, y := 7},
    {a := 5, c := 10, y := 8}, {a := 5, c := 10, y := 9},
    {a := 5, c := 11, y := 6}, {a := 5, c := 11, y := 7},
    {a := 5, c := 11, y := 8}, {a := 5, c := 11, y := 9}]

def familyChoices (data : SurplusApexPairCommonFiveData) : List (RowChoice Label) :=
  [{center := 0, support := {2, data.a}},
    {center := data.y, support := {2, data.a}},
    {center := data.c, support := {0, 2, data.y}}]

def lookupDefinition (requirement : RowChoice Label) : PositiveMembershipDefinition :=
  (definitions.find? fun definition =>
    decide (definition.requirement = requirement)).getD definition0_23

structure FamilyEntry where
  data : SurplusApexPairCommonFiveData
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
checked surplus/apex-pair common-five theorem. -/
theorem false_of_blockingClause_false
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (entry : FamilyEntry) (hentry : entry ∈ entries)
    (hfalse : evalClauseD
      (positiveMembershipAssign base 44902 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_positiveMembershipBlockingClause_false
      base 44902 row requirementAt entry.definitions
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).1)
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).2.1)
      hfalse
  let nogood := SourceOrderPositiveNogood.ofSurplusApexPairCommonFive
    (entry.definitions.map fun definition => definition.requirement)
    entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end SurplusApexPairMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
