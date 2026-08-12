/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221BlockSpanningCommonFiveCertificate
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge

/-!
# Exact CNF binding for the full block-spanning membership family

The generic block-spanning common-five theorem applies to every nontrivial
choice of `a` in the second-opposite interior and distinct `x,c` in the
surplus interior.  This file eagerly binds all 24 such role triples to one
deterministic positive-membership CNF extension: 22 shared fresh variables,
522 candidate implications, and 24 three-literal blocks.

This remains an exact-twelve predicate ingress bridge.  It does not assert a
terminal UNSAT result, an arbitrary-cardinality lift, or live theorem closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace BlockSpanningMembershipFamilyCnf

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

def definition1_06 := mkDefinition 44876 1 {0, 6}
def definition1_07 := mkDefinition 44877 1 {0, 7}
def definition1_08 := mkDefinition 44878 1 {0, 8}
def definition1_09 := mkDefinition 44879 1 {0, 9}
def definition3_014 := mkDefinition 44880 3 {0, 1, 4}
def definition3_015 := mkDefinition 44881 3 {0, 1, 5}
def definition3_06 := mkDefinition 44882 3 {0, 6}
def definition3_07 := mkDefinition 44883 3 {0, 7}
def definition3_08 := mkDefinition 44884 3 {0, 8}
def definition3_09 := mkDefinition 44885 3 {0, 9}
def definition4_013 := mkDefinition 44886 4 {0, 1, 3}
def definition4_015 := mkDefinition 44887 4 {0, 1, 5}
def definition4_06 := mkDefinition 44888 4 {0, 6}
def definition4_07 := mkDefinition 44889 4 {0, 7}
def definition4_08 := mkDefinition 44890 4 {0, 8}
def definition4_09 := mkDefinition 44891 4 {0, 9}
def definition5_013 := mkDefinition 44892 5 {0, 1, 3}
def definition5_014 := mkDefinition 44893 5 {0, 1, 4}
def definition5_06 := mkDefinition 44894 5 {0, 6}
def definition5_07 := mkDefinition 44895 5 {0, 7}
def definition5_08 := mkDefinition 44896 5 {0, 8}
def definition5_09 := mkDefinition 44897 5 {0, 9}

/-- Fresh definitions in exactly the lexicographic order used by the Python
compiler. -/
def definitions : List PositiveMembershipDefinition :=
  [definition1_06, definition1_07, definition1_08, definition1_09,
    definition3_014, definition3_015,
    definition3_06, definition3_07, definition3_08, definition3_09,
    definition4_013, definition4_015,
    definition4_06, definition4_07, definition4_08, definition4_09,
    definition5_013, definition5_014,
    definition5_06, definition5_07, definition5_08, definition5_09]

/-- Total source meaning for all 22 fresh variables. -/
def requirementAt (v : Nat) : RowChoice Label :=
  ((definitions.find? fun definition =>
    decide (definition.varIndex = v)).getD definition1_06).requirement

/-- Candidate indices containing a requirement, in the canonical increasing
table order used by Python's `enumerate`.  The repeated lists reflect the
translation-invariant candidate table at surplus centers. -/
private def pair06CandidateIndices : List Nat :=
  [1, 7, 13, 14, 15, 16, 17, 29, 35, 41, 42, 43, 44, 45, 56, 62,
    63, 64, 65, 66, 77, 78, 79, 80, 81, 92, 93, 94, 95, 96, 97, 98,
    99, 100, 101]

private def pair07CandidateIndices : List Nat :=
  [2, 8, 13, 18, 19, 20, 21, 30, 36, 41, 46, 47, 48, 49, 57, 62,
    67, 68, 69, 70, 77, 82, 83, 84, 85, 92, 93, 94, 95, 102, 103,
    104, 105, 106, 107]

private def pair08CandidateIndices : List Nat :=
  [3, 9, 14, 18, 22, 23, 24, 31, 37, 42, 46, 50, 51, 52, 58, 63,
    67, 71, 72, 73, 78, 82, 86, 87, 88, 92, 96, 97, 98, 102, 103,
    104, 108, 109, 110]

private def pair09CandidateIndices : List Nat :=
  [4, 10, 15, 19, 22, 25, 26, 32, 38, 43, 47, 50, 53, 54, 59, 64,
    68, 71, 74, 75, 79, 83, 86, 89, 90, 93, 96, 99, 100, 102, 105,
    106, 108, 109, 111]

def candidateIndicesFor (definition : PositiveMembershipDefinition) : List Nat :=
  match definition.varIndex with
  | 44876 => [0, 1, 2, 6, 7, 8, 12, 13, 14, 18, 19, 20, 24, 25, 26]
  | 44877 => [0, 3, 4, 6, 9, 10, 12, 15, 16, 18, 21, 22, 24, 25, 27]
  | 44878 => [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 24, 26, 27]
  | 44879 => [2, 4, 5, 8, 10, 11, 14, 16, 17, 20, 22, 23, 25, 26, 27]
  | 44880 => [0, 1, 2, 3, 4, 5, 6]
  | 44881 => [0, 7, 8, 9, 10, 11, 12]
  | 44882 => pair06CandidateIndices
  | 44883 => pair07CandidateIndices
  | 44884 => pair08CandidateIndices
  | 44885 => pair09CandidateIndices
  | 44886 => [0, 1, 2, 3, 4, 5, 6]
  | 44887 => [0, 7, 8, 9, 10, 11, 12]
  | 44888 => pair06CandidateIndices
  | 44889 => pair07CandidateIndices
  | 44890 => pair08CandidateIndices
  | 44891 => pair09CandidateIndices
  | 44892 => [0, 1, 2, 3, 4, 5, 6]
  | 44893 => [0, 7, 8, 9, 10, 11, 12]
  | 44894 => pair06CandidateIndices
  | 44895 => pair07CandidateIndices
  | 44896 => pair08CandidateIndices
  | 44897 => pair09CandidateIndices
  | _ => []

/-- The exact 522 candidate implications emitted by the family compiler. -/
def implicationDimacs : List (List Int) :=
  definitions.flatMap fun definition =>
    positiveMembershipIndexImplicationClauses
      definition.requirement.center (candidateIndicesFor definition) definition

private def definitionCompilerValid
    (definition : PositiveMembershipDefinition) : Bool :=
  decide (44875 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          44875 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ definitions) :
    44875 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            44875 ∧
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

/-- The source valuation satisfies all 522 deterministic implication clauses. -/
theorem implicationDimacs_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v)
    {clause : List Int} (hclause : clause ∈ implicationDimacs) :
    evalClauseD (positiveMembershipAssign base 44875 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ :=
    List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 44875
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

/-- The 24 nontrivial role triples, in Python compiler order. -/
def familyData : List BlockSpanningCommonFiveData :=
  [{a := 6, x := 3, c := 4}, {a := 6, x := 3, c := 5},
    {a := 6, x := 4, c := 3}, {a := 6, x := 4, c := 5},
    {a := 6, x := 5, c := 3}, {a := 6, x := 5, c := 4},
    {a := 7, x := 3, c := 4}, {a := 7, x := 3, c := 5},
    {a := 7, x := 4, c := 3}, {a := 7, x := 4, c := 5},
    {a := 7, x := 5, c := 3}, {a := 7, x := 5, c := 4},
    {a := 8, x := 3, c := 4}, {a := 8, x := 3, c := 5},
    {a := 8, x := 4, c := 3}, {a := 8, x := 4, c := 5},
    {a := 8, x := 5, c := 3}, {a := 8, x := 5, c := 4},
    {a := 9, x := 3, c := 4}, {a := 9, x := 3, c := 5},
    {a := 9, x := 4, c := 3}, {a := 9, x := 4, c := 5},
    {a := 9, x := 5, c := 3}, {a := 9, x := 5, c := 4}]

def familyChoices (data : BlockSpanningCommonFiveData) : List (RowChoice Label) :=
  let first : RowChoice Label := { center := 1, support := {0, data.a} }
  let xRow : RowChoice Label := { center := data.x, support := {0, data.a} }
  let cRow : RowChoice Label :=
    { center := data.c, support := {0, 1, data.x} }
  if data.x.val < data.c.val then [first, xRow, cRow]
  else [first, cRow, xRow]

def lookupDefinition (requirement : RowChoice Label) : PositiveMembershipDefinition :=
  (definitions.find? fun definition =>
    decide (definition.requirement = requirement)).getD definition1_06

structure FamilyEntry where
  data : BlockSpanningCommonFiveData
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

/-- Falsifying any one of the 24 family blocks contradicts the source
geometry through the already-proved generic block-spanning theorem. -/
theorem false_of_blockingClause_false
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (entry : FamilyEntry) (hentry : entry ∈ entries)
    (hfalse : evalClauseD
      (positiveMembershipAssign base 44875 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_positiveMembershipBlockingClause_false
      base 44875 row requirementAt entry.definitions
      (fun definition hdefinition =>
        (definition_compiler_valid
          (hvalid.2 definition hdefinition)).1)
      (fun definition hdefinition =>
        (definition_compiler_valid
          (hvalid.2 definition hdefinition)).2.1)
      hfalse
  let nogood := SourceOrderPositiveNogood.ofBlockSpanningCommonFive
    (entry.definitions.map fun definition => definition.requirement)
    entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end BlockSpanningMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
