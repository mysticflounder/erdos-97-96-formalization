/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexSharedPairCrossBlockCommonFiveCertificate

/-!
# Exact CNF binding for the apex-shared-pair cross-block family

This file binds the twenty-four checked `(a, b, c)` role instances to the
deterministic positive-membership CNF extension installed after the apex-pair
cross-block family.  The thirty fresh variables encode the requirements

* `row 0 ⊇ {a, b}`;
* `row 1 ⊇ {a, b}`; and
* `row c ⊇ {0, 1, b}`.

This is an exact-twelve predicate-ingress bridge.  It does not assert terminal
UNSAT, complete arm/placement coverage, an arbitrary-cardinality lift, or live
theorem closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace ApexSharedPairCrossBlockMembershipFamilyCnf

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

-- Apex-zero shared-pair requirements.
def definition0_36 := mkDefinition 45097 0 {3, 6}
def definition0_37 := mkDefinition 45098 0 {3, 7}
def definition0_38 := mkDefinition 45099 0 {3, 8}
def definition0_39 := mkDefinition 45100 0 {3, 9}
def definition0_46 := mkDefinition 45101 0 {4, 6}
def definition0_47 := mkDefinition 45102 0 {4, 7}
def definition0_48 := mkDefinition 45103 0 {4, 8}
def definition0_49 := mkDefinition 45104 0 {4, 9}
def definition0_56 := mkDefinition 45105 0 {5, 6}
def definition0_57 := mkDefinition 45106 0 {5, 7}
def definition0_58 := mkDefinition 45107 0 {5, 8}
def definition0_59 := mkDefinition 45108 0 {5, 9}

-- Apex-one shared-pair requirements.
def definition1_36 := mkDefinition 45109 1 {3, 6}
def definition1_37 := mkDefinition 45110 1 {3, 7}
def definition1_38 := mkDefinition 45111 1 {3, 8}
def definition1_39 := mkDefinition 45112 1 {3, 9}
def definition1_46 := mkDefinition 45113 1 {4, 6}
def definition1_47 := mkDefinition 45114 1 {4, 7}
def definition1_48 := mkDefinition 45115 1 {4, 8}
def definition1_49 := mkDefinition 45116 1 {4, 9}
def definition1_56 := mkDefinition 45117 1 {5, 6}
def definition1_57 := mkDefinition 45118 1 {5, 7}
def definition1_58 := mkDefinition 45119 1 {5, 8}
def definition1_59 := mkDefinition 45120 1 {5, 9}

-- First-opposite cross-block requirements.
def definition10_013 := mkDefinition 45121 10 {0, 1, 3}
def definition10_014 := mkDefinition 45122 10 {0, 1, 4}
def definition10_015 := mkDefinition 45123 10 {0, 1, 5}
def definition11_013 := mkDefinition 45124 11 {0, 1, 3}
def definition11_014 := mkDefinition 45125 11 {0, 1, 4}
def definition11_015 := mkDefinition 45126 11 {0, 1, 5}

/-- Fresh definitions in exactly the sorted order used by the Python
compiler. -/
def definitions : List PositiveMembershipDefinition :=
  [definition0_36, definition0_37, definition0_38, definition0_39,
    definition0_46, definition0_47, definition0_48, definition0_49,
    definition0_56, definition0_57, definition0_58, definition0_59,
    definition1_36, definition1_37, definition1_38, definition1_39,
    definition1_46, definition1_47, definition1_48, definition1_49,
    definition1_56, definition1_57, definition1_58, definition1_59,
    definition10_013, definition10_014, definition10_015,
    definition11_013, definition11_014, definition11_015]

/-- Total source meaning for all thirty fresh variables. -/
def requirementAt (v : Nat) : RowChoice Label :=
  ((definitions.find? fun definition =>
    decide (definition.varIndex = v)).getD definition0_36).requirement

/-- The candidate-index computation performed by the Python compiler. -/
def candidateIndicesFor
    (definition : PositiveMembershipDefinition) : List Nat :=
  (List.range (SafeCoverCnf.candCount definition.requirement.center.val)).filter
    fun candidateIndex =>
      decide (∀ a ∈ definition.requirement.support,
        ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
          candidateIndex 0).testBit a.val = true)

/-- All deterministic candidate implications emitted by the family compiler. -/
def implicationDimacs : List (List Int) :=
  definitions.flatMap fun definition =>
    positiveMembershipIndexImplicationClauses
      definition.requirement.center (candidateIndicesFor definition) definition

private def definitionCompilerValid
    (definition : PositiveMembershipDefinition) : Bool :=
  decide (45077 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          45077 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ definitions) :
    45077 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            45077 ∧
          ∀ a ∈ definition.requirement.support,
            ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
              candidateIndex 0).testBit a.val = true := by
  have hall : definitions.all definitionCompilerValid = true := by native_decide
  have hvalid := List.all_eq_true.mp hall definition hdefinition
  simp only [definitionCompilerValid, Bool.and_eq_true] at hvalid
  have hhead := of_decide_eq_true hvalid.1
  refine ⟨hhead.1, hhead.2, ?_⟩
  intro candidateIndex hcandidateIndex
  exact of_decide_eq_true
    (List.all_eq_true.mp hvalid.2 candidateIndex hcandidateIndex)

/-- The source valuation satisfies every deterministic implication clause. -/
theorem implicationDimacs_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v)
    {clause : List Int} (hclause : clause ∈ implicationDimacs) :
    evalClauseD (positiveMembershipAssign base 45077 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ :=
    List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 45077
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

/-- The twenty-four role triples, in Python compiler order. -/
def familyData : List ApexSharedPairCrossBlockCommonFiveData :=
  [{a := 6, b := 3, c := 10}, {a := 6, b := 3, c := 11},
    {a := 6, b := 4, c := 10}, {a := 6, b := 4, c := 11},
    {a := 6, b := 5, c := 10}, {a := 6, b := 5, c := 11},
    {a := 7, b := 3, c := 10}, {a := 7, b := 3, c := 11},
    {a := 7, b := 4, c := 10}, {a := 7, b := 4, c := 11},
    {a := 7, b := 5, c := 10}, {a := 7, b := 5, c := 11},
    {a := 8, b := 3, c := 10}, {a := 8, b := 3, c := 11},
    {a := 8, b := 4, c := 10}, {a := 8, b := 4, c := 11},
    {a := 8, b := 5, c := 10}, {a := 8, b := 5, c := 11},
    {a := 9, b := 3, c := 10}, {a := 9, b := 3, c := 11},
    {a := 9, b := 4, c := 10}, {a := 9, b := 4, c := 11},
    {a := 9, b := 5, c := 10}, {a := 9, b := 5, c := 11}]

def familyChoices
    (data : ApexSharedPairCrossBlockCommonFiveData) : List (RowChoice Label) :=
  [{center := 0, support := {data.a, data.b}},
    {center := 1, support := {data.a, data.b}},
    {center := data.c, support := {0, 1, data.b}}]

def lookupDefinition
    (requirement : RowChoice Label) : PositiveMembershipDefinition :=
  (definitions.find? fun definition =>
    decide (definition.requirement = requirement)).getD definition0_36

structure FamilyEntry where
  data : ApexSharedPairCrossBlockCommonFiveData
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
checked apex-shared-pair cross-block common-five theorem. -/
theorem false_of_blockingClause_false
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (entry : FamilyEntry) (hentry : entry ∈ entries)
    (hfalse : evalClauseD
      (positiveMembershipAssign base 45077 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_positiveMembershipBlockingClause_false
      base 45077 row requirementAt entry.definitions
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).1)
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).2.1)
      hfalse
  let nogood := SourceOrderPositiveNogood.ofApexSharedPairCrossBlockCommonFive
    (entry.definitions.map fun definition => definition.requirement)
    entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end ApexSharedPairCrossBlockMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
