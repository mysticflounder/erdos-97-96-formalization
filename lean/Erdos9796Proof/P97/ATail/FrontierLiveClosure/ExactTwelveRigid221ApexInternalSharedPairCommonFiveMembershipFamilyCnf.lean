/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexInternalSharedPairCommonFiveCertificate
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SecondCapApexSurplusMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SurplusThreeTriadMembershipFamilyCnf

/-!
# Exact CNF binding for the apex-internal shared-pair common-five family

This file binds the thirty-six checked `(a, x, b, c, y)` role instances to the
deterministic positive-membership extension installed after the apex-shared-pair
cross-block family.  Twenty-four requirements reuse variables from earlier
families and thirty-six requirements receive fresh variables.  Together they encode

* `row x ⊇ {a, b}`;
* `row y ⊇ {a, b}`; and
* `row c ⊇ {b, x, y}`.

The blocking-clause consumer therefore asks its caller for the source meanings
of the twenty-four reused variables; it never reinterprets those variables as
fresh.  This is an exact-twelve predicate-ingress bridge.  It does not assert terminal
UNSAT, complete arm/placement coverage, an arbitrary-cardinality lift, or live
theorem closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace ApexInternalSharedPairCommonFiveMembershipFamilyCnf

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

-- Fresh requirements in the Python compiler's allocation order.
def d45127 := mkDefinition 45127 6 {3, 7}
def d45128 := mkDefinition 45128 6 {3, 8}
def d45129 := mkDefinition 45129 6 {4, 7}
def d45130 := mkDefinition 45130 6 {4, 8}
def d45131 := mkDefinition 45131 6 {5, 7}
def d45132 := mkDefinition 45132 6 {5, 8}
def d45133 := mkDefinition 45133 7 {3, 6}
def d45134 := mkDefinition 45134 7 {3, 8}
def d45135 := mkDefinition 45135 7 {3, 9}
def d45136 := mkDefinition 45136 7 {4, 6}
def d45137 := mkDefinition 45137 7 {4, 8}
def d45138 := mkDefinition 45138 7 {4, 9}
def d45139 := mkDefinition 45139 7 {5, 6}
def d45140 := mkDefinition 45140 7 {5, 8}
def d45141 := mkDefinition 45141 7 {5, 9}
def d45142 := mkDefinition 45142 8 {3, 6}
def d45143 := mkDefinition 45143 8 {3, 7}
def d45144 := mkDefinition 45144 8 {3, 7, 9}
def d45145 := mkDefinition 45145 8 {3, 9}
def d45146 := mkDefinition 45146 8 {4, 6}
def d45147 := mkDefinition 45147 8 {4, 7}
def d45148 := mkDefinition 45148 8 {4, 7, 9}
def d45149 := mkDefinition 45149 8 {4, 9}
def d45150 := mkDefinition 45150 8 {5, 6}
def d45151 := mkDefinition 45151 8 {5, 7}
def d45152 := mkDefinition 45152 8 {5, 7, 9}
def d45153 := mkDefinition 45153 8 {5, 9}
def d45154 := mkDefinition 45154 9 {3, 6}
def d45155 := mkDefinition 45155 9 {3, 7}
def d45156 := mkDefinition 45156 9 {3, 8}
def d45157 := mkDefinition 45157 9 {4, 6}
def d45158 := mkDefinition 45158 9 {4, 7}
def d45159 := mkDefinition 45159 9 {4, 8}
def d45160 := mkDefinition 45160 9 {5, 6}
def d45161 := mkDefinition 45161 9 {5, 7}
def d45162 := mkDefinition 45162 9 {5, 8}

/-- The thirty-six genuinely fresh definitions, in Python allocation order. -/
def freshDefinitions : List PositiveMembershipDefinition :=
  [d45127, d45128, d45129, d45130, d45131, d45132, d45133, d45134,
    d45135, d45136, d45137, d45138, d45139, d45140, d45141, d45142,
    d45143, d45144, d45145, d45146, d45147, d45148, d45149, d45150,
    d45151, d45152, d45153, d45154, d45155, d45156, d45157, d45158,
    d45159, d45160, d45161, d45162]

/-- Exact parent definitions reused by the Python compiler. -/
def reusedDefinitions : List PositiveMembershipDefinition :=
  [SecondCapApexSurplusMembershipFamilyCnf.definition6_379,
    SecondCapApexSurplusMembershipFamilyCnf.definition6_389,
    SecondCapApexSurplusMembershipFamilyCnf.definition6_479,
    SecondCapApexSurplusMembershipFamilyCnf.definition6_489,
    SecondCapApexSurplusMembershipFamilyCnf.definition6_579,
    SecondCapApexSurplusMembershipFamilyCnf.definition6_589,
    SecondCapApexSurplusMembershipFamilyCnf.definition7_389,
    SecondCapApexSurplusMembershipFamilyCnf.definition7_489,
    SecondCapApexSurplusMembershipFamilyCnf.definition7_589,
    SecondCapApexSurplusMembershipFamilyCnf.definition8_367,
    SecondCapApexSurplusMembershipFamilyCnf.definition8_467,
    SecondCapApexSurplusMembershipFamilyCnf.definition8_567,
    SecondCapApexSurplusMembershipFamilyCnf.definition9_367,
    SecondCapApexSurplusMembershipFamilyCnf.definition9_368,
    SecondCapApexSurplusMembershipFamilyCnf.definition9_467,
    SecondCapApexSurplusMembershipFamilyCnf.definition9_468,
    SecondCapApexSurplusMembershipFamilyCnf.definition9_567,
    SecondCapApexSurplusMembershipFamilyCnf.definition9_568,
    SurplusThreeTriadMembershipFamilyCnf.definition6_39,
    SurplusThreeTriadMembershipFamilyCnf.definition6_49,
    SurplusThreeTriadMembershipFamilyCnf.definition6_59,
    SurplusThreeTriadMembershipFamilyCnf.definition7_368,
    SurplusThreeTriadMembershipFamilyCnf.definition7_468,
    SurplusThreeTriadMembershipFamilyCnf.definition7_568]

/-- Every definition referenced by a family block, partitioned by allocation. -/
def definitions : List PositiveMembershipDefinition :=
  freshDefinitions ++ reusedDefinitions

/-- Total source meaning for the thirty-six fresh variables. -/
def requirementAt (v : Nat) : RowChoice Label :=
  ((freshDefinitions.find? fun definition =>
    decide (definition.varIndex = v)).getD d45127).requirement

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
  freshDefinitions.flatMap fun definition =>
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
    (hdefinition : definition ∈ freshDefinitions) :
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
  have hall : freshDefinitions.all definitionCompilerValid = true := by native_decide
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

/-- The thirty-six role tuples, in Python compiler order. -/
def familyData : List ApexInternalSharedPairCommonFiveData :=
  [{a := 6, x := 7, b := 3, c := 8, y := 9},
    {a := 6, x := 7, b := 4, c := 8, y := 9},
    {a := 6, x := 7, b := 5, c := 8, y := 9},
    {a := 6, x := 8, b := 3, c := 7, y := 9},
    {a := 6, x := 8, b := 4, c := 7, y := 9},
    {a := 6, x := 8, b := 5, c := 7, y := 9},
    {a := 6, x := 9, b := 3, c := 7, y := 8},
    {a := 6, x := 9, b := 4, c := 7, y := 8},
    {a := 6, x := 9, b := 5, c := 7, y := 8},
    {a := 7, x := 6, b := 3, c := 9, y := 8},
    {a := 7, x := 6, b := 4, c := 9, y := 8},
    {a := 7, x := 6, b := 5, c := 9, y := 8},
    {a := 7, x := 8, b := 3, c := 6, y := 9},
    {a := 7, x := 8, b := 4, c := 6, y := 9},
    {a := 7, x := 8, b := 5, c := 6, y := 9},
    {a := 7, x := 9, b := 3, c := 6, y := 8},
    {a := 7, x := 9, b := 4, c := 6, y := 8},
    {a := 7, x := 9, b := 5, c := 6, y := 8},
    {a := 8, x := 6, b := 3, c := 9, y := 7},
    {a := 8, x := 6, b := 4, c := 9, y := 7},
    {a := 8, x := 6, b := 5, c := 9, y := 7},
    {a := 8, x := 7, b := 3, c := 9, y := 6},
    {a := 8, x := 7, b := 4, c := 9, y := 6},
    {a := 8, x := 7, b := 5, c := 9, y := 6},
    {a := 8, x := 9, b := 3, c := 6, y := 7},
    {a := 8, x := 9, b := 4, c := 6, y := 7},
    {a := 8, x := 9, b := 5, c := 6, y := 7},
    {a := 9, x := 6, b := 3, c := 8, y := 7},
    {a := 9, x := 6, b := 4, c := 8, y := 7},
    {a := 9, x := 6, b := 5, c := 8, y := 7},
    {a := 9, x := 7, b := 3, c := 8, y := 6},
    {a := 9, x := 7, b := 4, c := 8, y := 6},
    {a := 9, x := 7, b := 5, c := 8, y := 6},
    {a := 9, x := 8, b := 3, c := 7, y := 6},
    {a := 9, x := 8, b := 4, c := 7, y := 6},
    {a := 9, x := 8, b := 5, c := 7, y := 6}]

def familyChoices
    (data : ApexInternalSharedPairCommonFiveData) : List (RowChoice Label) :=
  [{center := data.x, support := {data.a, data.b}},
    {center := data.y, support := {data.a, data.b}},
    {center := data.c, support := {data.b, data.x, data.y}}]

def lookupDefinition
    (requirement : RowChoice Label) : PositiveMembershipDefinition :=
  (definitions.find? fun definition =>
    decide (definition.requirement = requirement)).getD d45127

structure FamilyEntry where
  data : ApexInternalSharedPairCommonFiveData
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

private theorem reused_definition_le_cutoff
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ reusedDefinitions) :
    definition.varIndex ≤ 45077 := by
  have hall : (reusedDefinitions.all fun current =>
      decide (current.varIndex ≤ 45077)) = true := by native_decide
  exact of_decide_eq_true
    (List.all_eq_true.mp hall definition hdefinition)

private theorem positiveRowsMatch_of_mixed_blockingClause_false
    (base : Nat → Bool) (row : RowPattern Label)
    (entryDefinitions : List PositiveMembershipDefinition)
    (hdefinitions : ∀ definition ∈ entryDefinitions, definition ∈ definitions)
    (hreused : ∀ definition ∈ reusedDefinitions,
      base definition.varIndex = decide
        (definition.requirement.support ⊆ row definition.requirement.center))
    (hfalse : evalClauseD
      (positiveMembershipAssign base 45077 row requirementAt)
      (positiveMembershipBlockingClause entryDefinitions) = false) :
    PositiveRowsMatch row (entryDefinitions.map fun definition =>
      definition.requirement) := by
  have hall : ∀ literal ∈ positiveMembershipBlockingClause entryDefinitions,
      evalLitD (positiveMembershipAssign base 45077 row requirementAt)
        literal = false := by
    rw [evalClauseD, List.any_eq_false] at hfalse
    intro literal hliteral
    exact Bool.eq_false_of_not_eq_true (hfalse literal hliteral)
  intro requirement hrequirement
  obtain ⟨definition, hdefinition, rfl⟩ := List.mem_map.mp hrequirement
  have hliteral : -(Int.ofNat definition.varIndex) ∈
      positiveMembershipBlockingClause entryDefinitions :=
    List.mem_map_of_mem hdefinition
  have heval := hall (-(Int.ofNat definition.varIndex)) hliteral
  have hscope := hdefinitions definition hdefinition
  rw [definitions, List.mem_append] at hscope
  rcases hscope with hfresh | hreusedDefinition
  · have hvalid := definition_compiler_valid hfresh
    rw [evalLitD_negNat,
      positiveMembershipAssign_of_lt _ _ _ _ hvalid.1,
      hvalid.2.1] at heval
    have htrue : decide (definition.requirement.support ⊆
        row definition.requirement.center) = true := by
      cases hvalue : decide (definition.requirement.support ⊆
          row definition.requirement.center) <;> simp [hvalue] at heval ⊢
    exact of_decide_eq_true htrue
  · rw [evalLitD_negNat,
      positiveMembershipAssign_of_le _ _ _ _
        (reused_definition_le_cutoff hreusedDefinition),
      hreused definition hreusedDefinition] at heval
    have htrue : decide (definition.requirement.support ⊆
        row definition.requirement.center) = true := by
      cases hvalue : decide (definition.requirement.support ⊆
          row definition.requirement.center) <;> simp [hvalue] at heval ⊢
    exact of_decide_eq_true htrue

/-- Falsifying one family block contradicts the source geometry through the
checked apex-internal shared-pair common-five theorem. -/
theorem false_of_blockingClause_false
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (hreused : ∀ definition ∈ reusedDefinitions,
      base definition.varIndex = decide
        (definition.requirement.support ⊆ row definition.requirement.center))
    (entry : FamilyEntry) (hentry : entry ∈ entries)
    (hfalse : evalClauseD
      (positiveMembershipAssign base 45077 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_mixed_blockingClause_false base row entry.definitions
      hvalid.2 hreused hfalse
  let nogood := SourceOrderPositiveNogood.ofApexInternalSharedPairCommonFive
    (entry.definitions.map fun definition => definition.requirement)
    entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end ApexInternalSharedPairCommonFiveMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
