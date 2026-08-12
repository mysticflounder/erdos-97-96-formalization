/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexFirstOppositeSharedPairSurplusCommonFiveCertificate
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf

/-!
# Exact CNF binding for the apex/first-opposite/surplus common-five family

This file binds the 24 checked `(x, b, y)` role instances to the deterministic
positive-membership extension installed after the v18 family.  The eight
`row x ⊇ {0, b}` requirements reuse variables 45167--45174.  The 24
`row 2 ⊇ {b, x, y}` requirements and six `row y ⊇ {0, b}` requirements
receive fresh variables 45308--45337 in the Python compiler's sorted
requirement order.

The exact definition and blocking-clause tables below are executable
cross-language byte-order anchors.  This is finite exact-twelve predicate
ingress only: it does not assert terminal UNSAT, complete arm coverage, an
arbitrary-cardinality lift, or closure of a live Rigid221 residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf

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

-- The 24 fresh apex-center requirements, in sorted compiler order.
def definition2_3610 := mkDefinition 45308 2 {3, 6, 10}
def definition2_3611 := mkDefinition 45309 2 {3, 6, 11}
def definition2_3710 := mkDefinition 45310 2 {3, 7, 10}
def definition2_3711 := mkDefinition 45311 2 {3, 7, 11}
def definition2_3810 := mkDefinition 45312 2 {3, 8, 10}
def definition2_3811 := mkDefinition 45313 2 {3, 8, 11}
def definition2_3910 := mkDefinition 45314 2 {3, 9, 10}
def definition2_3911 := mkDefinition 45315 2 {3, 9, 11}
def definition2_4610 := mkDefinition 45316 2 {4, 6, 10}
def definition2_4611 := mkDefinition 45317 2 {4, 6, 11}
def definition2_4710 := mkDefinition 45318 2 {4, 7, 10}
def definition2_4711 := mkDefinition 45319 2 {4, 7, 11}
def definition2_4810 := mkDefinition 45320 2 {4, 8, 10}
def definition2_4811 := mkDefinition 45321 2 {4, 8, 11}
def definition2_4910 := mkDefinition 45322 2 {4, 9, 10}
def definition2_4911 := mkDefinition 45323 2 {4, 9, 11}
def definition2_5610 := mkDefinition 45324 2 {5, 6, 10}
def definition2_5611 := mkDefinition 45325 2 {5, 6, 11}
def definition2_5710 := mkDefinition 45326 2 {5, 7, 10}
def definition2_5711 := mkDefinition 45327 2 {5, 7, 11}
def definition2_5810 := mkDefinition 45328 2 {5, 8, 10}
def definition2_5811 := mkDefinition 45329 2 {5, 8, 11}
def definition2_5910 := mkDefinition 45330 2 {5, 9, 10}
def definition2_5911 := mkDefinition 45331 2 {5, 9, 11}

-- The six fresh surplus-center requirements.
def definition3_010 := mkDefinition 45332 3 {0, 10}
def definition3_011 := mkDefinition 45333 3 {0, 11}
def definition4_010 := mkDefinition 45334 4 {0, 10}
def definition4_011 := mkDefinition 45335 4 {0, 11}
def definition5_010 := mkDefinition 45336 5 {0, 10}
def definition5_011 := mkDefinition 45337 5 {0, 11}

/-- The 30 genuinely fresh definitions, in compiler allocation order. -/
def freshDefinitions : List PositiveMembershipDefinition :=
  [definition2_3610, definition2_3611, definition2_3710,
    definition2_3711, definition2_3810, definition2_3811,
    definition2_3910, definition2_3911, definition2_4610,
    definition2_4611, definition2_4710, definition2_4711,
    definition2_4810, definition2_4811, definition2_4910,
    definition2_4911, definition2_5610, definition2_5611,
    definition2_5710, definition2_5711, definition2_5810,
    definition2_5811, definition2_5910, definition2_5911,
    definition3_010, definition3_011, definition4_010,
    definition4_011, definition5_010, definition5_011]

/-- Exact parent definitions reused by the compiler. -/
def reusedDefinitions : List PositiveMembershipDefinition :=
  [ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.d45167,
    ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.d45168,
    ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.d45169,
    ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.d45170,
    ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.d45171,
    ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.d45172,
    ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.d45173,
    ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.d45174]

/-- Every distinct definition referenced by a family block. -/
def definitions : List PositiveMembershipDefinition :=
  freshDefinitions ++ reusedDefinitions

/-- Deliberately impossible source meaning outside the 30 fresh indices. -/
def outOfFamilyRequirement : RowChoice Label :=
  { center := 0, support := {0} }

theorem outOfFamilyRequirement_not_satisfied
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row) :
    ¬outOfFamilyRequirement.support ⊆ row outOfFamilyRequirement.center := by
  simpa [outOfFamilyRequirement] using hrow.sourceCube.center_not_mem 0

def requirementAt (v : Nat) : RowChoice Label :=
  ((freshDefinitions.find? fun definition =>
    decide (definition.varIndex = v)).map fun definition =>
      definition.requirement).getD outOfFamilyRequirement

def candidateIndicesFor
    (definition : PositiveMembershipDefinition) : List Nat :=
  (List.range (SafeCoverCnf.candCount definition.requirement.center.val)).filter
    fun candidateIndex =>
      decide (∀ a ∈ definition.requirement.support,
        ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
          candidateIndex 0).testBit a.val = true)

def implicationDimacs : List (List Int) :=
  freshDefinitions.flatMap fun definition =>
    positiveMembershipIndexImplicationClauses
      definition.requirement.center (candidateIndicesFor definition) definition

private def definitionCompilerValid
    (definition : PositiveMembershipDefinition) : Bool :=
  decide (45307 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          45307 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ freshDefinitions) :
    45307 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            45307 ∧
          ∀ a ∈ definition.requirement.support,
            ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
              candidateIndex 0).testBit a.val = true := by
  have hall : freshDefinitions.all definitionCompilerValid = true := by
    native_decide
  have hvalid := List.all_eq_true.mp hall definition hdefinition
  simp only [definitionCompilerValid, Bool.and_eq_true] at hvalid
  have hhead := of_decide_eq_true hvalid.1
  refine ⟨hhead.1, hhead.2, ?_⟩
  intro candidateIndex hcandidateIndex
  exact of_decide_eq_true
    (List.all_eq_true.mp hvalid.2 candidateIndex hcandidateIndex)

/-- The source valuation satisfies every fresh deterministic implication. -/
theorem implicationDimacs_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (base : Nat → Bool)
    (hbase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      base v = SafeCoverCnf.finalAssign (coverIndex row) v)
    {clause : List Int} (hclause : clause ∈ implicationDimacs) :
    evalClauseD (positiveMembershipAssign base 45307 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ :=
    List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 45307
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

/-- The 24 roles, in Python compiler order. -/
def familyData : List ApexFirstOppositeSharedPairSurplusCommonFiveData :=
  ([6, 7, 8, 9] : List Label).flatMap fun x =>
    ([10, 11] : List Label).flatMap fun b =>
      ([3, 4, 5] : List Label).map fun y => {x := x, b := b, y := y}

/-- Requirements are in the compiler's normalized center order. -/
def familyChoices
    (data : ApexFirstOppositeSharedPairSurplusCommonFiveData) :
    List (RowChoice Label) :=
  [{center := 2, support := {data.b, data.x, data.y}},
    {center := data.y, support := {0, data.b}},
    {center := data.x, support := {0, data.b}}]

def lookupDefinition
    (requirement : RowChoice Label) : PositiveMembershipDefinition :=
  (definitions.find? fun definition =>
    decide (definition.requirement = requirement)).getD definition2_3610

structure FamilyEntry where
  data : ApexFirstOppositeSharedPairSurplusCommonFiveData
  definitions : List PositiveMembershipDefinition
deriving DecidableEq

def entries : List FamilyEntry :=
  familyData.map fun data =>
    { data := data
      definitions := (familyChoices data).map lookupDefinition }

def blockingClauses : List (List Int) :=
  entries.map fun entry => positiveMembershipBlockingClause entry.definitions

/-- Executable byte-order anchor for all 24 Python-installed blocks. -/
theorem blockingClauses_eq :
    blockingClauses =
      [[-45308, -45332, -45167], [-45316, -45334, -45167],
        [-45324, -45336, -45167], [-45309, -45333, -45168],
        [-45317, -45335, -45168], [-45325, -45337, -45168],
        [-45310, -45332, -45169], [-45318, -45334, -45169],
        [-45326, -45336, -45169], [-45311, -45333, -45170],
        [-45319, -45335, -45170], [-45327, -45337, -45170],
        [-45312, -45332, -45171], [-45320, -45334, -45171],
        [-45328, -45336, -45171], [-45313, -45333, -45172],
        [-45321, -45335, -45172], [-45329, -45337, -45172],
        [-45314, -45332, -45173], [-45322, -45334, -45173],
        [-45330, -45336, -45173], [-45315, -45333, -45174],
        [-45323, -45335, -45174], [-45331, -45337, -45174]] := by
  native_decide

/-- Executable cardinality, distinctness, and variable-range anchor. -/
theorem family_shape :
    freshDefinitions.length = 30 ∧ reusedDefinitions.length = 8 ∧
      definitions.length = 38 ∧ entries.length = 24 ∧
      blockingClauses.length = 24 ∧
      (definitions.map fun definition => definition.requirement).Nodup ∧
      freshDefinitions.all (fun definition => decide
        (45308 ≤ definition.varIndex ∧ definition.varIndex ≤ 45337)) = true := by
  native_decide

private def entryValid (entry : FamilyEntry) : Bool :=
  entry.data.check
      (entry.definitions.map fun definition => definition.requirement) &&
    entry.definitions.all fun definition => decide (definition ∈ definitions)

private theorem entry_valid {entry : FamilyEntry} (hentry : entry ∈ entries) :
    entry.data.check
        (entry.definitions.map fun definition => definition.requirement) = true ∧
      ∀ definition ∈ entry.definitions, definition ∈ definitions := by
  have hall : entries.all entryValid = true := by
    native_decide
  have hvalid := List.all_eq_true.mp hall entry hentry
  simp only [entryValid, Bool.and_eq_true] at hvalid
  refine ⟨hvalid.1, ?_⟩
  intro definition hdefinition
  exact of_decide_eq_true
    (List.all_eq_true.mp hvalid.2 definition hdefinition)

private theorem reused_definition_le_cutoff
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ reusedDefinitions) :
    definition.varIndex ≤ 45307 := by
  have hall : (reusedDefinitions.all fun current =>
      decide (current.varIndex ≤ 45307)) = true := by
    native_decide
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
      (positiveMembershipAssign base 45307 row requirementAt)
      (positiveMembershipBlockingClause entryDefinitions) = false) :
    PositiveRowsMatch row (entryDefinitions.map fun definition =>
      definition.requirement) := by
  have hall : ∀ literal ∈ positiveMembershipBlockingClause entryDefinitions,
      evalLitD (positiveMembershipAssign base 45307 row requirementAt)
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

/-- Falsifying one family block contradicts source geometry through the checked
24-role common-five theorem. -/
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
      (positiveMembershipAssign base 45307 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_mixed_blockingClause_false base row entry.definitions
      hvalid.2 hreused hfalse
  let nogood :=
    SourceOrderPositiveNogood.ofApexFirstOppositeSharedPairSurplusCommonFive
      (entry.definitions.map fun definition => definition.requirement)
      entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
