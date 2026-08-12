/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SecondCapApexSurplusCommonFiveCertificate

/-!
# Exact CNF binding for the second-cap/apex/surplus membership family

This file binds all 24 checked role assignments from
`SecondCapApexSurplusCommonFiveData` to the deterministic positive-membership
CNF extension installed after the adjacent-apex cross-block family.  The
extension contains 36 shared fresh variables, 582 candidate implications, and
24 three-literal blocking clauses.

This is an exact-twelve predicate-ingress bridge.  It does not assert terminal
UNSAT, complete arm/placement coverage, an arbitrary-cardinality lift, or live
theorem closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace SecondCapApexSurplusMembershipFamilyCnf

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

def definition3_27 := mkDefinition 44965 3 {2, 7}
def definition3_28 := mkDefinition 44966 3 {2, 8}
def definition4_27 := mkDefinition 44967 4 {2, 7}
def definition4_28 := mkDefinition 44968 4 {2, 8}
def definition5_27 := mkDefinition 44969 5 {2, 7}
def definition5_28 := mkDefinition 44970 5 {2, 8}
def definition6_27 := mkDefinition 44971 6 {2, 7}
def definition6_28 := mkDefinition 44972 6 {2, 8}
def definition6_378 := mkDefinition 44973 6 {3, 7, 8}
def definition6_379 := mkDefinition 44974 6 {3, 7, 9}
def definition6_389 := mkDefinition 44975 6 {3, 8, 9}
def definition6_478 := mkDefinition 44976 6 {4, 7, 8}
def definition6_479 := mkDefinition 44977 6 {4, 7, 9}
def definition6_489 := mkDefinition 44978 6 {4, 8, 9}
def definition6_578 := mkDefinition 44979 6 {5, 7, 8}
def definition6_579 := mkDefinition 44980 6 {5, 7, 9}
def definition6_589 := mkDefinition 44981 6 {5, 8, 9}
def definition7_28 := mkDefinition 44982 7 {2, 8}
def definition7_389 := mkDefinition 44983 7 {3, 8, 9}
def definition7_489 := mkDefinition 44984 7 {4, 8, 9}
def definition7_589 := mkDefinition 44985 7 {5, 8, 9}
def definition8_27 := mkDefinition 44986 8 {2, 7}
def definition8_367 := mkDefinition 44987 8 {3, 6, 7}
def definition8_467 := mkDefinition 44988 8 {4, 6, 7}
def definition8_567 := mkDefinition 44989 8 {5, 6, 7}
def definition9_27 := mkDefinition 44990 9 {2, 7}
def definition9_28 := mkDefinition 44991 9 {2, 8}
def definition9_367 := mkDefinition 44992 9 {3, 6, 7}
def definition9_368 := mkDefinition 44993 9 {3, 6, 8}
def definition9_378 := mkDefinition 44994 9 {3, 7, 8}
def definition9_467 := mkDefinition 44995 9 {4, 6, 7}
def definition9_468 := mkDefinition 44996 9 {4, 6, 8}
def definition9_478 := mkDefinition 44997 9 {4, 7, 8}
def definition9_567 := mkDefinition 44998 9 {5, 6, 7}
def definition9_568 := mkDefinition 44999 9 {5, 6, 8}
def definition9_578 := mkDefinition 45000 9 {5, 7, 8}

/-- Fresh definitions in exactly the lexicographic order used by the Python
compiler. -/
def definitions : List PositiveMembershipDefinition :=
  [definition3_27, definition3_28, definition4_27, definition4_28,
    definition5_27, definition5_28, definition6_27, definition6_28,
    definition6_378, definition6_379, definition6_389, definition6_478,
    definition6_479, definition6_489, definition6_578, definition6_579,
    definition6_589, definition7_28, definition7_389, definition7_489,
    definition7_589, definition8_27, definition8_367, definition8_467,
    definition8_567, definition9_27, definition9_28, definition9_367,
    definition9_368, definition9_378, definition9_467, definition9_468,
    definition9_478, definition9_567, definition9_568, definition9_578]

/-- Total source meaning for all 36 fresh variables. -/
def requirementAt (v : Nat) : RowChoice Label :=
  ((definitions.find? fun definition =>
    decide (definition.varIndex = v)).getD definition3_27).requirement

/-- Candidate indices containing each requirement, in the canonical increasing
table order used by Python's `enumerate`. -/
def candidateIndicesFor (definition : PositiveMembershipDefinition) : List Nat :=
  match definition.varIndex with
  | 44965 | 44967 | 44969 =>
      [30, 36, 41, 46, 47, 48, 49, 114, 120, 125, 130, 131, 132, 133,
        197, 202, 207, 208, 209, 210, 217, 222, 223, 224, 225, 232,
        233, 234, 235, 242, 243, 244, 245, 246, 247]
  | 44966 | 44968 | 44970 =>
      [31, 37, 42, 46, 50, 51, 52, 115, 121, 126, 130, 134, 135, 136,
        198, 203, 207, 211, 212, 213, 218, 222, 226, 227, 228, 232,
        236, 237, 238, 242, 243, 244, 248, 249, 250]
  | 44971 =>
      [30, 36, 41, 46, 47, 48, 49, 113, 119, 124, 129, 130, 131, 132,
        195, 200, 205, 206, 207, 208, 215, 220, 221, 222, 223, 230,
        231, 232, 233, 240, 241, 242, 243, 244]
  | 44972 | 44982 | 44986 | 44990 =>
      [31, 37, 42, 46, 50, 51, 52, 114, 120, 125, 129, 133, 134, 135,
        196, 201, 205, 209, 210, 211, 216, 220, 224, 225, 226, 230,
        234, 235, 236, 240, 241, 245, 246, 247]
  | 44973 | 44987 | 44992 => [67, 150, 205, 254, 264, 274, 275]
  | 44974 | 44993 => [68, 151, 206, 255, 265, 276, 277]
  | 44975 | 44983 | 44994 => [71, 154, 209, 258, 268, 279, 280]
  | 44976 | 44988 | 44995 => [82, 165, 220, 254, 283, 293, 294]
  | 44977 | 44996 => [83, 166, 221, 255, 284, 295, 296]
  | 44978 | 44984 | 44997 => [86, 169, 224, 258, 287, 298, 299]
  | 44979 | 44989 | 44998 => [92, 175, 230, 264, 283, 302, 303]
  | 44980 | 44999 => [93, 176, 231, 265, 284, 304, 305]
  | 44981 | 44985 | 45000 => [96, 179, 234, 268, 287, 307, 308]
  | 44991 =>
      [32, 38, 43, 47, 50, 53, 54, 115, 121, 126, 130, 133, 136, 137,
        197, 202, 206, 209, 212, 213, 217, 221, 224, 227, 228, 231,
        234, 237, 238, 242, 243, 245, 246, 248]
  | _ => []

/-- The exact 582 candidate implications emitted by the family compiler. -/
def implicationDimacs : List (List Int) :=
  definitions.flatMap fun definition =>
    positiveMembershipIndexImplicationClauses
      definition.requirement.center (candidateIndicesFor definition) definition

private def definitionCompilerValid
    (definition : PositiveMembershipDefinition) : Bool :=
  decide (44964 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          44964 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ definitions) :
    44964 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            44964 ∧
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

/-- The source valuation satisfies all 582 deterministic implication clauses. -/
theorem implicationDimacs_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v)
    {clause : List Int} (hclause : clause ∈ implicationDimacs) :
    evalClauseD (positiveMembershipAssign base 44964 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ :=
    List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 44964
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

/-- The 24 role quadruples, in Python compiler order. -/
def familyData : List SecondCapApexSurplusCommonFiveData :=
  [{x := 6, b := 7, c := 8, y := 3},
    {x := 6, b := 7, c := 8, y := 4},
    {x := 6, b := 7, c := 8, y := 5},
    {x := 6, b := 7, c := 9, y := 3},
    {x := 6, b := 7, c := 9, y := 4},
    {x := 6, b := 7, c := 9, y := 5},
    {x := 6, b := 8, c := 9, y := 3},
    {x := 6, b := 8, c := 9, y := 4},
    {x := 6, b := 8, c := 9, y := 5},
    {x := 7, b := 8, c := 9, y := 3},
    {x := 7, b := 8, c := 9, y := 4},
    {x := 7, b := 8, c := 9, y := 5},
    {x := 8, b := 7, c := 6, y := 3},
    {x := 8, b := 7, c := 6, y := 4},
    {x := 8, b := 7, c := 6, y := 5},
    {x := 9, b := 7, c := 6, y := 3},
    {x := 9, b := 7, c := 6, y := 4},
    {x := 9, b := 7, c := 6, y := 5},
    {x := 9, b := 8, c := 6, y := 3},
    {x := 9, b := 8, c := 6, y := 4},
    {x := 9, b := 8, c := 6, y := 5},
    {x := 9, b := 8, c := 7, y := 3},
    {x := 9, b := 8, c := 7, y := 4},
    {x := 9, b := 8, c := 7, y := 5}]

def familyChoices
    (data : SecondCapApexSurplusCommonFiveData) : List (RowChoice Label) :=
  [{center := data.x, support := {2, data.b}},
    {center := data.y, support := {2, data.b}},
    {center := data.c, support := {data.x, data.b, data.y}}]

def lookupDefinition (requirement : RowChoice Label) : PositiveMembershipDefinition :=
  (definitions.find? fun definition =>
    decide (definition.requirement = requirement)).getD definition3_27

structure FamilyEntry where
  data : SecondCapApexSurplusCommonFiveData
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
checked second-cap/apex/surplus common-five theorem. -/
theorem false_of_blockingClause_false
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (entry : FamilyEntry) (hentry : entry ∈ entries)
    (hfalse : evalClauseD
      (positiveMembershipAssign base 44964 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_positiveMembershipBlockingClause_false
      base 44964 row requirementAt entry.definitions
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).1)
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).2.1)
      hfalse
  let nogood := SourceOrderPositiveNogood.ofSecondCapApexSurplusCommonFive
    (entry.definitions.map fun definition => definition.requirement)
    entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end SecondCapApexSurplusMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
