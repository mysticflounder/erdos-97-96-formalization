/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ZeroCenterCrossBlockCommonFiveCertificate

/-!
# Exact CNF binding for the zero-center cross-block common-five family

This file binds the 24 checked `(x, b, y)` role instances to the deterministic
positive-membership CNF extension installed after the surplus three-triad
family.  The 44 fresh variables encode the requirements

* `row 0 ⊇ {x, b, y}`;
* `row x ⊇ {1, b}`; and
* `row y ⊇ {1, b}`.

Candidate implication lists are computed directly from the frozen canonical
row table in the same increasing-index order as the Python compiler.

This is an exact-twelve predicate-ingress bridge.  It does not assert terminal
UNSAT, complete arm/placement coverage, an arbitrary-cardinality lift, or live
theorem closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace ZeroCenterCrossBlockMembershipFamilyCnf

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

-- Center-zero requirements, ordered lexicographically by `(x, b, y)`.
def definition0_3610 := mkDefinition 45011 0 {3, 6, 10}
def definition0_3611 := mkDefinition 45012 0 {3, 6, 11}
def definition0_3710 := mkDefinition 45013 0 {3, 7, 10}
def definition0_3711 := mkDefinition 45014 0 {3, 7, 11}
def definition0_3810 := mkDefinition 45015 0 {3, 8, 10}
def definition0_3811 := mkDefinition 45016 0 {3, 8, 11}
def definition0_3910 := mkDefinition 45017 0 {3, 9, 10}
def definition0_3911 := mkDefinition 45018 0 {3, 9, 11}
def definition0_4610 := mkDefinition 45019 0 {4, 6, 10}
def definition0_4611 := mkDefinition 45020 0 {4, 6, 11}
def definition0_4710 := mkDefinition 45021 0 {4, 7, 10}
def definition0_4711 := mkDefinition 45022 0 {4, 7, 11}
def definition0_4810 := mkDefinition 45023 0 {4, 8, 10}
def definition0_4811 := mkDefinition 45024 0 {4, 8, 11}
def definition0_4910 := mkDefinition 45025 0 {4, 9, 10}
def definition0_4911 := mkDefinition 45026 0 {4, 9, 11}
def definition0_5610 := mkDefinition 45027 0 {5, 6, 10}
def definition0_5611 := mkDefinition 45028 0 {5, 6, 11}
def definition0_5710 := mkDefinition 45029 0 {5, 7, 10}
def definition0_5711 := mkDefinition 45030 0 {5, 7, 11}
def definition0_5810 := mkDefinition 45031 0 {5, 8, 10}
def definition0_5811 := mkDefinition 45032 0 {5, 8, 11}
def definition0_5910 := mkDefinition 45033 0 {5, 9, 10}
def definition0_5911 := mkDefinition 45034 0 {5, 9, 11}

-- Surplus-center requirements.
def definition3_16 := mkDefinition 45035 3 {1, 6}
def definition3_17 := mkDefinition 45036 3 {1, 7}
def definition3_18 := mkDefinition 45037 3 {1, 8}
def definition3_19 := mkDefinition 45038 3 {1, 9}
def definition4_16 := mkDefinition 45039 4 {1, 6}
def definition4_17 := mkDefinition 45040 4 {1, 7}
def definition4_18 := mkDefinition 45041 4 {1, 8}
def definition4_19 := mkDefinition 45042 4 {1, 9}
def definition5_16 := mkDefinition 45043 5 {1, 6}
def definition5_17 := mkDefinition 45044 5 {1, 7}
def definition5_18 := mkDefinition 45045 5 {1, 8}
def definition5_19 := mkDefinition 45046 5 {1, 9}

-- First-opposite-center requirements.
def definition10_16 := mkDefinition 45047 10 {1, 6}
def definition10_17 := mkDefinition 45048 10 {1, 7}
def definition10_18 := mkDefinition 45049 10 {1, 8}
def definition10_19 := mkDefinition 45050 10 {1, 9}
def definition11_16 := mkDefinition 45051 11 {1, 6}
def definition11_17 := mkDefinition 45052 11 {1, 7}
def definition11_18 := mkDefinition 45053 11 {1, 8}
def definition11_19 := mkDefinition 45054 11 {1, 9}

/-- Fresh definitions in exactly the sorted order used by the Python
compiler. -/
def definitions : List PositiveMembershipDefinition :=
  [definition0_3610, definition0_3611, definition0_3710, definition0_3711,
    definition0_3810, definition0_3811, definition0_3910, definition0_3911,
    definition0_4610, definition0_4611, definition0_4710, definition0_4711,
    definition0_4810, definition0_4811, definition0_4910, definition0_4911,
    definition0_5610, definition0_5611, definition0_5710, definition0_5711,
    definition0_5810, definition0_5811, definition0_5910, definition0_5911,
    definition3_16, definition3_17, definition3_18, definition3_19,
    definition4_16, definition4_17, definition4_18, definition4_19,
    definition5_16, definition5_17, definition5_18, definition5_19,
    definition10_16, definition10_17, definition10_18, definition10_19,
    definition11_16, definition11_17, definition11_18, definition11_19]

/-- Total source meaning for all 44 fresh variables. -/
def requirementAt (v : Nat) : RowChoice Label :=
  ((definitions.find? fun definition =>
    decide (definition.varIndex = v)).getD definition0_3610).requirement

/-- The candidate-index computation performed by the Python compiler: scan the
canonical candidate table in increasing index order and retain exactly the
rows containing every required support label. -/
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
  decide (45010 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          45010 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ definitions) :
    45010 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            45010 ∧
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
    evalClauseD (positiveMembershipAssign base 45010 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ :=
    List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 45010
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
def familyData : List ZeroCenterCrossBlockCommonFiveData :=
  [{x := 3, b := 6, y := 10}, {x := 3, b := 6, y := 11},
    {x := 3, b := 7, y := 10}, {x := 3, b := 7, y := 11},
    {x := 3, b := 8, y := 10}, {x := 3, b := 8, y := 11},
    {x := 3, b := 9, y := 10}, {x := 3, b := 9, y := 11},
    {x := 4, b := 6, y := 10}, {x := 4, b := 6, y := 11},
    {x := 4, b := 7, y := 10}, {x := 4, b := 7, y := 11},
    {x := 4, b := 8, y := 10}, {x := 4, b := 8, y := 11},
    {x := 4, b := 9, y := 10}, {x := 4, b := 9, y := 11},
    {x := 5, b := 6, y := 10}, {x := 5, b := 6, y := 11},
    {x := 5, b := 7, y := 10}, {x := 5, b := 7, y := 11},
    {x := 5, b := 8, y := 10}, {x := 5, b := 8, y := 11},
    {x := 5, b := 9, y := 10}, {x := 5, b := 9, y := 11}]

def familyChoices
    (data : ZeroCenterCrossBlockCommonFiveData) : List (RowChoice Label) :=
  [{center := 0, support := {data.x, data.b, data.y}},
    {center := data.x, support := {1, data.b}},
    {center := data.y, support := {1, data.b}}]

def lookupDefinition
    (requirement : RowChoice Label) : PositiveMembershipDefinition :=
  (definitions.find? fun definition =>
    decide (definition.requirement = requirement)).getD definition0_3610

structure FamilyEntry where
  data : ZeroCenterCrossBlockCommonFiveData
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
checked zero-center cross-block common-five theorem. -/
theorem false_of_blockingClause_false
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (entry : FamilyEntry) (hentry : entry ∈ entries)
    (hfalse : evalClauseD
      (positiveMembershipAssign base 45010 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_positiveMembershipBlockingClause_false
      base 45010 row requirementAt entry.definitions
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).1)
      (fun definition hdefinition =>
        (definition_compiler_valid (hvalid.2 definition hdefinition)).2.1)
      hfalse
  let nogood := SourceOrderPositiveNogood.ofZeroCenterCrossBlockCommonFive
    (entry.definitions.map fun definition => definition.requirement)
    entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end ZeroCenterCrossBlockMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
