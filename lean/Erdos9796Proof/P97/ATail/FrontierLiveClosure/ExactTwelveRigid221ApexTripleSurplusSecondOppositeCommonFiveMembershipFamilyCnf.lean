/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexTripleSurplusSecondOppositeCommonFiveCertificate

/-!
# Exact CNF binding for the apex-triple common-five family

This file binds the twelve checked `(c, y)` role instances to the deterministic
positive-membership CNF extension installed after the second-opposite
shared-pair family.  The seventeen fresh variables encode the requirements

* `row 0 ⊇ {1, 2}`;
* `row y ⊇ {1, 2}`; and
* `row c ⊇ {0, 2, y}`.

Candidate implication lists are computed directly from the frozen canonical
row table in the same increasing-index order as the Python compiler.

This is an exact-twelve predicate-ingress bridge.  It does not assert terminal
UNSAT, complete arm/placement coverage, an arbitrary-cardinality lift, or live
theorem closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyCnf

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

def definition0_12 := mkDefinition 45225 0 {1, 2}

def definition3_026 := mkDefinition 45226 3 {0, 2, 6}
def definition3_027 := mkDefinition 45227 3 {0, 2, 7}
def definition3_028 := mkDefinition 45228 3 {0, 2, 8}
def definition3_029 := mkDefinition 45229 3 {0, 2, 9}

def definition4_026 := mkDefinition 45230 4 {0, 2, 6}
def definition4_027 := mkDefinition 45231 4 {0, 2, 7}
def definition4_028 := mkDefinition 45232 4 {0, 2, 8}
def definition4_029 := mkDefinition 45233 4 {0, 2, 9}

def definition5_026 := mkDefinition 45234 5 {0, 2, 6}
def definition5_027 := mkDefinition 45235 5 {0, 2, 7}
def definition5_028 := mkDefinition 45236 5 {0, 2, 8}
def definition5_029 := mkDefinition 45237 5 {0, 2, 9}

def definition6_12 := mkDefinition 45238 6 {1, 2}
def definition7_12 := mkDefinition 45239 7 {1, 2}
def definition8_12 := mkDefinition 45240 8 {1, 2}
def definition9_12 := mkDefinition 45241 9 {1, 2}

/-- Fresh definitions in exactly the sorted order used by the Python
compiler. -/
def definitions : List PositiveMembershipDefinition :=
  [definition0_12,
    definition3_026, definition3_027, definition3_028, definition3_029,
    definition4_026, definition4_027, definition4_028, definition4_029,
    definition5_026, definition5_027, definition5_028, definition5_029,
    definition6_12, definition7_12, definition8_12, definition9_12]

/-- Deliberately non-family source meaning used outside the seventeen fresh
variable indices.  Every family definition is separately proved to resolve to
its exact requirement. -/
def outOfFamilyRequirement : RowChoice Label :=
  { center := 0, support := ∅ }

/-- Total source meaning for all seventeen fresh variables. -/
def requirementAt (v : Nat) : RowChoice Label :=
  (definitions.find? fun definition =>
    decide (definition.varIndex = v)).map
      (fun definition => definition.requirement) |>.getD outOfFamilyRequirement

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
  decide (45224 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          45224 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ definitions) :
    45224 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            45224 ∧
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
    evalClauseD (positiveMembershipAssign base 45224 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ :=
    List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 45224
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

/-- The twelve role pairs, in Python compiler order. -/
def familyData : List ApexTripleSurplusSecondOppositeCommonFiveData :=
  [{c := 3, y := 6}, {c := 3, y := 7}, {c := 3, y := 8}, {c := 3, y := 9},
    {c := 4, y := 6}, {c := 4, y := 7}, {c := 4, y := 8}, {c := 4, y := 9},
    {c := 5, y := 6}, {c := 5, y := 7}, {c := 5, y := 8}, {c := 5, y := 9}]

def familyChoices
    (data : ApexTripleSurplusSecondOppositeCommonFiveData) :
    List (RowChoice Label) :=
  [{center := 0, support := {1, 2}},
    {center := data.c, support := {0, 2, data.y}},
    {center := data.y, support := {1, 2}}]

structure FamilyEntry where
  data : ApexTripleSurplusSecondOppositeCommonFiveData
  definitions : List PositiveMembershipDefinition
deriving DecidableEq

def entries : List FamilyEntry :=
  [ { data := {c := 3, y := 6}
      definitions := [definition0_12, definition3_026, definition6_12] },
    { data := {c := 3, y := 7}
      definitions := [definition0_12, definition3_027, definition7_12] },
    { data := {c := 3, y := 8}
      definitions := [definition0_12, definition3_028, definition8_12] },
    { data := {c := 3, y := 9}
      definitions := [definition0_12, definition3_029, definition9_12] },
    { data := {c := 4, y := 6}
      definitions := [definition0_12, definition4_026, definition6_12] },
    { data := {c := 4, y := 7}
      definitions := [definition0_12, definition4_027, definition7_12] },
    { data := {c := 4, y := 8}
      definitions := [definition0_12, definition4_028, definition8_12] },
    { data := {c := 4, y := 9}
      definitions := [definition0_12, definition4_029, definition9_12] },
    { data := {c := 5, y := 6}
      definitions := [definition0_12, definition5_026, definition6_12] },
    { data := {c := 5, y := 7}
      definitions := [definition0_12, definition5_027, definition7_12] },
    { data := {c := 5, y := 8}
      definitions := [definition0_12, definition5_028, definition8_12] },
    { data := {c := 5, y := 9}
      definitions := [definition0_12, definition5_029, definition9_12] } ]

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
checked apex-triple common-five theorem. -/
theorem false_of_blockingClause_false
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (entry : FamilyEntry) (hentry : entry ∈ entries)
    (hfalse : evalClauseD
      (positiveMembershipAssign base 45224 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_positiveMembershipBlockingClause_false
      base 45224 row requirementAt entry.definitions
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).1)
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).2.1)
      hfalse
  let nogood :=
    SourceOrderPositiveNogood.ofApexTripleSurplusSecondOppositeCommonFive
      (entry.definitions.map fun definition => definition.requirement)
      entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
