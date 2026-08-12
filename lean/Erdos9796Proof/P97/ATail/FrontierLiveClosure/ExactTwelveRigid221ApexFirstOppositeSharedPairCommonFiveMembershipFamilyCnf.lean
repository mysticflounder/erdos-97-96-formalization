/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexFirstOppositeSharedPairCommonFiveCertificate
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexInternalSharedPairCommonFiveMembershipFamilyCnf

/-!
# Exact CNF binding for the apex/first-opposite shared-pair family

This file binds the eight checked `(x, b, y)` role instances to fourteen fresh
positive-membership variables installed after the apex-internal shared-pair
family.  Each role instance encodes

* `row x ⊇ {0, b}`;
* `row y ⊇ {0, b}`; and
* `row 2 ⊇ {b, x, y}`.

This is finite exact-twelve predicate ingress.  It is not terminal UNSAT,
complete arm coverage, an arbitrary-cardinality lift, or live closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf

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

def d45163 := mkDefinition 45163 2 {6, 10, 11}
def d45164 := mkDefinition 45164 2 {7, 10, 11}
def d45165 := mkDefinition 45165 2 {8, 10, 11}
def d45166 := mkDefinition 45166 2 {9, 10, 11}
def d45167 := mkDefinition 45167 6 {0, 10}
def d45168 := mkDefinition 45168 6 {0, 11}
def d45169 := mkDefinition 45169 7 {0, 10}
def d45170 := mkDefinition 45170 7 {0, 11}
def d45171 := mkDefinition 45171 8 {0, 10}
def d45172 := mkDefinition 45172 8 {0, 11}
def d45173 := mkDefinition 45173 9 {0, 10}
def d45174 := mkDefinition 45174 9 {0, 11}
def d45175 := mkDefinition 45175 10 {0, 11}
def d45176 := mkDefinition 45176 11 {0, 10}

/-- The fourteen fresh definitions in Python allocation order. -/
def definitions : List PositiveMembershipDefinition :=
  [d45163, d45164, d45165, d45166, d45167, d45168, d45169,
    d45170, d45171, d45172, d45173, d45174, d45175, d45176]

def requirementAt (v : Nat) : RowChoice Label :=
  ((definitions.find? fun definition =>
    decide (definition.varIndex = v)).getD d45163).requirement

def candidateIndicesFor
    (definition : PositiveMembershipDefinition) : List Nat :=
  (List.range (SafeCoverCnf.candCount definition.requirement.center.val)).filter
    fun candidateIndex =>
      decide (∀ a ∈ definition.requirement.support,
        ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
          candidateIndex 0).testBit a.val = true)

def implicationDimacs : List (List Int) :=
  definitions.flatMap fun definition =>
    positiveMembershipIndexImplicationClauses
      definition.requirement.center (candidateIndicesFor definition) definition

private def definitionCompilerValid
    (definition : PositiveMembershipDefinition) : Bool :=
  decide (45162 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          45162 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ definitions) :
    45162 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            45162 ∧
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

theorem implicationDimacs_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v)
    {clause : List Int} (hclause : clause ∈ implicationDimacs) :
    evalClauseD (positiveMembershipAssign base 45162 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ := List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 45162
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

/-- The eight role assignments in Python compiler order. -/
def familyData : List ApexFirstOppositeSharedPairCommonFiveData :=
  [{x := 6, b := 10, y := 11}, {x := 6, b := 11, y := 10},
    {x := 7, b := 10, y := 11}, {x := 7, b := 11, y := 10},
    {x := 8, b := 10, y := 11}, {x := 8, b := 11, y := 10},
    {x := 9, b := 10, y := 11}, {x := 9, b := 11, y := 10}]

def familyChoices
    (data : ApexFirstOppositeSharedPairCommonFiveData) : List (RowChoice Label) :=
  [{center := 2, support := {data.b, data.x, data.y}},
    {center := data.x, support := {0, data.b}},
    {center := data.y, support := {0, data.b}},
  ]

def lookupDefinition
    (requirement : RowChoice Label) : PositiveMembershipDefinition :=
  (definitions.find? fun definition =>
    decide (definition.requirement = requirement)).getD d45163

structure FamilyEntry where
  data : ApexFirstOppositeSharedPairCommonFiveData
  definitions : List PositiveMembershipDefinition
deriving DecidableEq

def entries : List FamilyEntry :=
  familyData.map fun data =>
    { data := data
      definitions := (familyChoices data).map lookupDefinition }

def blockingClauses : List (List Int) :=
  entries.map fun entry => positiveMembershipBlockingClause entry.definitions

/-- Executable byte-order anchor for the eight clauses installed by Python. -/
theorem blockingClauses_eq :
    blockingClauses =
      [[-45163, -45167, -45176],
        [-45163, -45168, -45175],
        [-45164, -45169, -45176],
        [-45164, -45170, -45175],
        [-45165, -45171, -45176],
        [-45165, -45172, -45175],
        [-45166, -45173, -45176],
        [-45166, -45174, -45175]] := by
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

/-- Falsifying one family block contradicts source geometry through the checked
apex/first-opposite shared-pair common-five theorem. -/
theorem false_of_blockingClause_false
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (entry : FamilyEntry) (hentry : entry ∈ entries)
    (hfalse : evalClauseD
      (positiveMembershipAssign base 45162 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_positiveMembershipBlockingClause_false
      base 45162 row requirementAt entry.definitions
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).1)
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).2.1)
      hfalse
  let nogood := SourceOrderPositiveNogood.ofApexFirstOppositeSharedPairCommonFive
    (entry.definitions.map fun definition => definition.requirement)
    entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
