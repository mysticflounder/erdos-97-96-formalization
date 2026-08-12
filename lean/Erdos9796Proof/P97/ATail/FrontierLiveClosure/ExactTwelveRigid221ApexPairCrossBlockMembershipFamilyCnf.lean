/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexPairCrossBlockCommonFiveCertificate

/-!
# Exact CNF binding for the apex-pair cross-block common-five family

This file binds the twelve checked `(x, y)` role instances to the deterministic
positive-membership CNF extension installed after the apex-zero cross-block
family.  The nineteen fresh variables encode the requirements

* `row 1 ⊇ {0, x, y}`;
* `row y ⊇ {0, 2}`; and
* `row x ⊇ {0, 2}`.

Candidate implication lists are computed directly from the frozen canonical
row table in the same increasing-index order as the Python compiler.

This is an exact-twelve predicate-ingress bridge.  It does not assert terminal
UNSAT, complete arm/placement coverage, an arbitrary-cardinality lift, or live
theorem closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace ApexPairCrossBlockMembershipFamilyCnf

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

-- Apex-one three-point requirements.
def definition1_036 := mkDefinition 45078 1 {0, 3, 6}
def definition1_037 := mkDefinition 45079 1 {0, 3, 7}
def definition1_038 := mkDefinition 45080 1 {0, 3, 8}
def definition1_039 := mkDefinition 45081 1 {0, 3, 9}
def definition1_046 := mkDefinition 45082 1 {0, 4, 6}
def definition1_047 := mkDefinition 45083 1 {0, 4, 7}
def definition1_048 := mkDefinition 45084 1 {0, 4, 8}
def definition1_049 := mkDefinition 45085 1 {0, 4, 9}
def definition1_056 := mkDefinition 45086 1 {0, 5, 6}
def definition1_057 := mkDefinition 45087 1 {0, 5, 7}
def definition1_058 := mkDefinition 45088 1 {0, 5, 8}
def definition1_059 := mkDefinition 45089 1 {0, 5, 9}

-- Surplus-center pair requirements.
def definition3_02 := mkDefinition 45090 3 {0, 2}
def definition4_02 := mkDefinition 45091 4 {0, 2}
def definition5_02 := mkDefinition 45092 5 {0, 2}

-- Second-opposite-center pair requirements.
def definition6_02 := mkDefinition 45093 6 {0, 2}
def definition7_02 := mkDefinition 45094 7 {0, 2}
def definition8_02 := mkDefinition 45095 8 {0, 2}
def definition9_02 := mkDefinition 45096 9 {0, 2}

/-- Fresh definitions in exactly the sorted order used by the Python
compiler. -/
def definitions : List PositiveMembershipDefinition :=
  [definition1_036, definition1_037, definition1_038, definition1_039,
    definition1_046, definition1_047, definition1_048, definition1_049,
    definition1_056, definition1_057, definition1_058, definition1_059,
    definition3_02, definition4_02, definition5_02,
    definition6_02, definition7_02, definition8_02, definition9_02]

/-- Total source meaning for all nineteen fresh variables. -/
def requirementAt (v : Nat) : RowChoice Label :=
  ((definitions.find? fun definition =>
    decide (definition.varIndex = v)).getD definition1_036).requirement

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

/-- The twelve role pairs, in Python compiler order. -/
def familyData : List ApexPairCrossBlockCommonFiveData :=
  [{x := 6, y := 3}, {x := 6, y := 4}, {x := 6, y := 5},
    {x := 7, y := 3}, {x := 7, y := 4}, {x := 7, y := 5},
    {x := 8, y := 3}, {x := 8, y := 4}, {x := 8, y := 5},
    {x := 9, y := 3}, {x := 9, y := 4}, {x := 9, y := 5}]

def familyChoices
    (data : ApexPairCrossBlockCommonFiveData) : List (RowChoice Label) :=
  [{center := 1, support := {0, data.x, data.y}},
    {center := data.y, support := {0, 2}},
    {center := data.x, support := {0, 2}}]

def lookupDefinition
    (requirement : RowChoice Label) : PositiveMembershipDefinition :=
  (definitions.find? fun definition =>
    decide (definition.requirement = requirement)).getD definition1_036

structure FamilyEntry where
  data : ApexPairCrossBlockCommonFiveData
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
checked apex-pair cross-block common-five theorem. -/
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
  let nogood := SourceOrderPositiveNogood.ofApexPairCrossBlockCommonFive
    (entry.definitions.map fun definition => definition.requirement)
    entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end ApexPairCrossBlockMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
