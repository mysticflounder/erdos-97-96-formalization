/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221AdjacentApexCrossBlockCommonFiveCertificate

/-!
# Exact CNF binding for the adjacent-apex cross-block membership family

This file binds all 24 checked role assignments from
`AdjacentApexCrossBlockCommonFiveData` to the deterministic positive-membership CNF
extension installed after the historical block-spanning and ThreeTriad banks.
The extension contains 39 shared fresh variables, 645 candidate implications,
and 24 three-literal blocking clauses.

This is an exact-twelve predicate-ingress bridge.  It does not assert terminal
UNSAT, complete arm/placement coverage, an arbitrary-cardinality lift, or live
theorem closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace AdjacentApexCrossBlockMembershipFamilyCnf

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

def definition0_13 := mkDefinition 44926 0 {1, 3}
def definition0_14 := mkDefinition 44927 0 {1, 4}
def definition0_15 := mkDefinition 44928 0 {1, 5}
def definition6_13 := mkDefinition 44929 6 {1, 3}
def definition6_14 := mkDefinition 44930 6 {1, 4}
def definition6_15 := mkDefinition 44931 6 {1, 5}
def definition7_13 := mkDefinition 44932 7 {1, 3}
def definition7_14 := mkDefinition 44933 7 {1, 4}
def definition7_15 := mkDefinition 44934 7 {1, 5}
def definition8_13 := mkDefinition 44935 8 {1, 3}
def definition8_14 := mkDefinition 44936 8 {1, 4}
def definition8_15 := mkDefinition 44937 8 {1, 5}
def definition9_13 := mkDefinition 44938 9 {1, 3}
def definition9_14 := mkDefinition 44939 9 {1, 4}
def definition9_15 := mkDefinition 44940 9 {1, 5}
def definition10_036 := mkDefinition 44941 10 {0, 3, 6}
def definition10_037 := mkDefinition 44942 10 {0, 3, 7}
def definition10_038 := mkDefinition 44943 10 {0, 3, 8}
def definition10_039 := mkDefinition 44944 10 {0, 3, 9}
def definition10_046 := mkDefinition 44945 10 {0, 4, 6}
def definition10_047 := mkDefinition 44946 10 {0, 4, 7}
def definition10_048 := mkDefinition 44947 10 {0, 4, 8}
def definition10_049 := mkDefinition 44948 10 {0, 4, 9}
def definition10_056 := mkDefinition 44949 10 {0, 5, 6}
def definition10_057 := mkDefinition 44950 10 {0, 5, 7}
def definition10_058 := mkDefinition 44951 10 {0, 5, 8}
def definition10_059 := mkDefinition 44952 10 {0, 5, 9}
def definition11_036 := mkDefinition 44953 11 {0, 3, 6}
def definition11_037 := mkDefinition 44954 11 {0, 3, 7}
def definition11_038 := mkDefinition 44955 11 {0, 3, 8}
def definition11_039 := mkDefinition 44956 11 {0, 3, 9}
def definition11_046 := mkDefinition 44957 11 {0, 4, 6}
def definition11_047 := mkDefinition 44958 11 {0, 4, 7}
def definition11_048 := mkDefinition 44959 11 {0, 4, 8}
def definition11_049 := mkDefinition 44960 11 {0, 4, 9}
def definition11_056 := mkDefinition 44961 11 {0, 5, 6}
def definition11_057 := mkDefinition 44962 11 {0, 5, 7}
def definition11_058 := mkDefinition 44963 11 {0, 5, 8}
def definition11_059 := mkDefinition 44964 11 {0, 5, 9}

/-- Fresh definitions in exactly the lexicographic order used by the Python
compiler. -/
def definitions : List PositiveMembershipDefinition :=
  [definition0_13, definition0_14, definition0_15,
    definition6_13, definition6_14, definition6_15,
    definition7_13, definition7_14, definition7_15,
    definition8_13, definition8_14, definition8_15,
    definition9_13, definition9_14, definition9_15,
    definition10_036, definition10_037, definition10_038, definition10_039,
    definition10_046, definition10_047, definition10_048, definition10_049,
    definition10_056, definition10_057, definition10_058, definition10_059,
    definition11_036, definition11_037, definition11_038, definition11_039,
    definition11_046, definition11_047, definition11_048, definition11_049,
    definition11_056, definition11_057, definition11_058, definition11_059]

/-- Total source meaning for all 39 fresh variables. -/
def requirementAt (v : Nat) : RowChoice Label :=
  ((definitions.find? fun definition =>
    decide (definition.varIndex = v)).getD definition0_13).requirement

/-- Candidate indices containing each requirement, in the canonical increasing
table order used by Python's `enumerate`. -/
def candidateIndicesFor (definition : PositiveMembershipDefinition) : List Nat :=
  match definition.varIndex with
  | 44926 => [0, 1, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  | 44927 => [0, 2, 3, 4, 5, 6, 7, 12, 13, 14, 15]
  | 44928 => [1, 2, 3, 8, 9, 10, 11, 12, 13, 14, 15]
  | 44929 | 44932 | 44935 | 44938 =>
      [0, 1, 2, 3, 4, 5, 6, 111, 112, 113, 114, 115, 116, 117, 139,
        140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151,
        152, 153, 154, 155, 156, 157, 158, 159]
  | 44930 | 44933 | 44936 | 44939 =>
      [0, 7, 8, 9, 10, 11, 12, 111, 118, 119, 120, 121, 122, 123,
        139, 140, 141, 142, 143, 144, 160, 161, 162, 163, 164, 165,
        166, 167, 168, 169, 170, 171, 172, 173, 174]
  | 44931 | 44934 | 44937 | 44940 =>
      [1, 7, 13, 14, 15, 16, 17, 112, 118, 124, 125, 126, 127, 128,
        139, 145, 146, 147, 148, 149, 160, 161, 162, 163, 164, 175,
        176, 177, 178, 179, 180, 181, 182, 183, 184]
  | 44941 | 44953 => [2, 30, 57, 62, 67, 68, 69, 70]
  | 44942 | 44954 => [3, 31, 58, 63, 67, 71, 72, 73]
  | 44943 | 44955 => [4, 32, 59, 64, 68, 71, 74, 75]
  | 44944 | 44956 => [5, 33, 60, 65, 69, 72, 74, 76]
  | 44945 | 44957 => [8, 36, 57, 77, 82, 83, 84, 85]
  | 44946 | 44958 => [9, 37, 58, 78, 82, 86, 87, 88]
  | 44947 | 44959 => [10, 38, 59, 79, 83, 86, 89, 90]
  | 44948 | 44960 => [11, 39, 60, 80, 84, 87, 89, 91]
  | 44949 | 44961 => [13, 41, 62, 77, 92, 93, 94, 95]
  | 44950 | 44962 => [14, 42, 63, 78, 92, 96, 97, 98]
  | 44951 | 44963 => [15, 43, 64, 79, 93, 96, 99, 100]
  | 44952 | 44964 => [16, 44, 65, 80, 94, 97, 99, 101]
  | _ => []

/-- The exact 645 candidate implications emitted by the family compiler. -/
def implicationDimacs : List (List Int) :=
  definitions.flatMap fun definition =>
    positiveMembershipIndexImplicationClauses
      definition.requirement.center (candidateIndicesFor definition) definition

private def definitionCompilerValid
    (definition : PositiveMembershipDefinition) : Bool :=
  decide (44925 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          44925 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ definitions) :
    44925 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            44925 ∧
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

/-- The source valuation satisfies all 645 deterministic implication clauses. -/
theorem implicationDimacs_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v)
    {clause : List Int} (hclause : clause ∈ implicationDimacs) :
    evalClauseD (positiveMembershipAssign base 44925 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ :=
    List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 44925
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
def familyData : List AdjacentApexCrossBlockCommonFiveData :=
  [{b := 3, c := 10, y := 6}, {b := 3, c := 10, y := 7},
    {b := 3, c := 10, y := 8}, {b := 3, c := 10, y := 9},
    {b := 3, c := 11, y := 6}, {b := 3, c := 11, y := 7},
    {b := 3, c := 11, y := 8}, {b := 3, c := 11, y := 9},
    {b := 4, c := 10, y := 6}, {b := 4, c := 10, y := 7},
    {b := 4, c := 10, y := 8}, {b := 4, c := 10, y := 9},
    {b := 4, c := 11, y := 6}, {b := 4, c := 11, y := 7},
    {b := 4, c := 11, y := 8}, {b := 4, c := 11, y := 9},
    {b := 5, c := 10, y := 6}, {b := 5, c := 10, y := 7},
    {b := 5, c := 10, y := 8}, {b := 5, c := 10, y := 9},
    {b := 5, c := 11, y := 6}, {b := 5, c := 11, y := 7},
    {b := 5, c := 11, y := 8}, {b := 5, c := 11, y := 9}]

def familyChoices (data : AdjacentApexCrossBlockCommonFiveData) : List (RowChoice Label) :=
  [{center := 0, support := {1, data.b}},
    {center := data.y, support := {1, data.b}},
    {center := data.c, support := {0, data.b, data.y}}]

def lookupDefinition (requirement : RowChoice Label) : PositiveMembershipDefinition :=
  (definitions.find? fun definition =>
    decide (definition.requirement = requirement)).getD definition0_13

structure FamilyEntry where
  data : AdjacentApexCrossBlockCommonFiveData
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
checked adjacent-apex cross-block common-five theorem. -/
theorem false_of_blockingClause_false
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (entry : FamilyEntry) (hentry : entry ∈ entries)
    (hfalse : evalClauseD
      (positiveMembershipAssign base 44925 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_positiveMembershipBlockingClause_false
      base 44925 row requirementAt entry.definitions
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).1)
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).2.1)
      hfalse
  let nogood := SourceOrderPositiveNogood.ofAdjacentApexCrossBlockCommonFive
    (entry.definitions.map fun definition => definition.requirement)
    entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end AdjacentApexCrossBlockMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
