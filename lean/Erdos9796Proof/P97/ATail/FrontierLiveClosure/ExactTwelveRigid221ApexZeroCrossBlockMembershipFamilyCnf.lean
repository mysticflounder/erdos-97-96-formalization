/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexZeroCrossBlockCommonFiveCertificate

/-!
# Exact CNF binding for the apex-zero cross-block common-five family

This file binds the 24 checked `(a, x, c)` role instances to the deterministic
positive-membership CNF extension installed after the zero-center cross-block
family.  The 23 fresh variables encode the requirements

* `row 1 ⊇ {0, a}`;
* `row x ⊇ {0, a}`; and
* `row c ⊇ {0, 1, x}`.

Candidate implication lists are computed directly from the frozen canonical
row table in the same increasing-index order as the Python compiler.

This is an exact-twelve predicate-ingress bridge.  It does not assert terminal
UNSAT, complete arm/placement coverage, an arbitrary-cardinality lift, or live
theorem closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace ApexZeroCrossBlockMembershipFamilyCnf

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

-- Apex-one requirements.
def definition1_03 := mkDefinition 45055 1 {0, 3}
def definition1_04 := mkDefinition 45056 1 {0, 4}
def definition1_05 := mkDefinition 45057 1 {0, 5}

-- Second-opposite-center requirements.
def definition6_03 := mkDefinition 45058 6 {0, 3}
def definition6_04 := mkDefinition 45059 6 {0, 4}
def definition6_05 := mkDefinition 45060 6 {0, 5}
def definition7_03 := mkDefinition 45061 7 {0, 3}
def definition7_04 := mkDefinition 45062 7 {0, 4}
def definition7_05 := mkDefinition 45063 7 {0, 5}
def definition8_03 := mkDefinition 45064 8 {0, 3}
def definition8_04 := mkDefinition 45065 8 {0, 4}
def definition8_05 := mkDefinition 45066 8 {0, 5}
def definition9_03 := mkDefinition 45067 9 {0, 3}
def definition9_04 := mkDefinition 45068 9 {0, 4}
def definition9_05 := mkDefinition 45069 9 {0, 5}

-- First-opposite-center requirements.
def definition10_016 := mkDefinition 45070 10 {0, 1, 6}
def definition10_017 := mkDefinition 45071 10 {0, 1, 7}
def definition10_018 := mkDefinition 45072 10 {0, 1, 8}
def definition10_019 := mkDefinition 45073 10 {0, 1, 9}
def definition11_016 := mkDefinition 45074 11 {0, 1, 6}
def definition11_017 := mkDefinition 45075 11 {0, 1, 7}
def definition11_018 := mkDefinition 45076 11 {0, 1, 8}
def definition11_019 := mkDefinition 45077 11 {0, 1, 9}

/-- Fresh definitions in exactly the sorted order used by the Python
compiler. -/
def definitions : List PositiveMembershipDefinition :=
  [definition1_03, definition1_04, definition1_05,
    definition6_03, definition6_04, definition6_05,
    definition7_03, definition7_04, definition7_05,
    definition8_03, definition8_04, definition8_05,
    definition9_03, definition9_04, definition9_05,
    definition10_016, definition10_017, definition10_018, definition10_019,
    definition11_016, definition11_017, definition11_018, definition11_019]

/-- Total source meaning for all 23 fresh variables. -/
def requirementAt (v : Nat) : RowChoice Label :=
  ((definitions.find? fun definition =>
    decide (definition.varIndex = v)).getD definition1_03).requirement

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
  decide (45054 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          45054 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ definitions) :
    45054 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            45054 ∧
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
    evalClauseD (positiveMembershipAssign base 45054 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ :=
    List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 45054
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
def familyData : List ApexZeroCrossBlockCommonFiveData :=
  [{a := 3, x := 6, c := 10}, {a := 3, x := 6, c := 11},
    {a := 3, x := 7, c := 10}, {a := 3, x := 7, c := 11},
    {a := 3, x := 8, c := 10}, {a := 3, x := 8, c := 11},
    {a := 3, x := 9, c := 10}, {a := 3, x := 9, c := 11},
    {a := 4, x := 6, c := 10}, {a := 4, x := 6, c := 11},
    {a := 4, x := 7, c := 10}, {a := 4, x := 7, c := 11},
    {a := 4, x := 8, c := 10}, {a := 4, x := 8, c := 11},
    {a := 4, x := 9, c := 10}, {a := 4, x := 9, c := 11},
    {a := 5, x := 6, c := 10}, {a := 5, x := 6, c := 11},
    {a := 5, x := 7, c := 10}, {a := 5, x := 7, c := 11},
    {a := 5, x := 8, c := 10}, {a := 5, x := 8, c := 11},
    {a := 5, x := 9, c := 10}, {a := 5, x := 9, c := 11}]

def familyChoices
    (data : ApexZeroCrossBlockCommonFiveData) : List (RowChoice Label) :=
  [{center := 1, support := {0, data.a}},
    {center := data.x, support := {0, data.a}},
    {center := data.c, support := {0, 1, data.x}}]

def lookupDefinition
    (requirement : RowChoice Label) : PositiveMembershipDefinition :=
  (definitions.find? fun definition =>
    decide (definition.requirement = requirement)).getD definition1_03

structure FamilyEntry where
  data : ApexZeroCrossBlockCommonFiveData
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
checked apex-zero cross-block common-five theorem. -/
theorem false_of_blockingClause_false
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (entry : FamilyEntry) (hentry : entry ∈ entries)
    (hfalse : evalClauseD
      (positiveMembershipAssign base 45054 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_positiveMembershipBlockingClause_false
      base 45054 row requirementAt entry.definitions
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).1)
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).2.1)
      hfalse
  let nogood := SourceOrderPositiveNogood.ofApexZeroCrossBlockCommonFive
    (entry.definitions.map fun definition => definition.requirement)
    entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end ApexZeroCrossBlockMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
