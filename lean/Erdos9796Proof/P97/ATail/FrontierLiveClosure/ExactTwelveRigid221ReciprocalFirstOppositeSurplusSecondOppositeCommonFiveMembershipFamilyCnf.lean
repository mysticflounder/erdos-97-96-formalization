/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveCertificate
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf

/-!
# Exact CNF binding for the reciprocal first/surplus/second common-five family

This file binds the 24 checked `(a, x, c)` role instances to the deterministic
positive-membership extension installed after the v20 family.  Six
`row a ⊇ {2,x}` requirements reuse variables 45302--45307.  The two
`row 0 ⊇ {2,a}` requirements, six `row 2 ⊇ {x,a}` requirements, and twelve
merged `row c ⊇ {0,2,x}` requirements receive variables 45338--45357.

The exact definition and blocking-clause tables are executable cross-language
anchors.  This is finite exact-twelve predicate ingress only: it does not
assert terminal UNSAT, complete arm coverage, an arbitrary-cardinality lift,
or closure of a live Rigid221 residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf

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

def definition0_210 := mkDefinition 45338 0 {2, 10}
def definition0_211 := mkDefinition 45339 0 {2, 11}
def definition2_310 := mkDefinition 45340 2 {3, 10}
def definition2_311 := mkDefinition 45341 2 {3, 11}
def definition2_410 := mkDefinition 45342 2 {4, 10}
def definition2_411 := mkDefinition 45343 2 {4, 11}
def definition2_510 := mkDefinition 45344 2 {5, 10}
def definition2_511 := mkDefinition 45345 2 {5, 11}
def definition6_023 := mkDefinition 45346 6 {0, 2, 3}
def definition6_024 := mkDefinition 45347 6 {0, 2, 4}
def definition6_025 := mkDefinition 45348 6 {0, 2, 5}
def definition7_023 := mkDefinition 45349 7 {0, 2, 3}
def definition7_024 := mkDefinition 45350 7 {0, 2, 4}
def definition7_025 := mkDefinition 45351 7 {0, 2, 5}
def definition8_023 := mkDefinition 45352 8 {0, 2, 3}
def definition8_024 := mkDefinition 45353 8 {0, 2, 4}
def definition8_025 := mkDefinition 45354 8 {0, 2, 5}
def definition9_023 := mkDefinition 45355 9 {0, 2, 3}
def definition9_024 := mkDefinition 45356 9 {0, 2, 4}
def definition9_025 := mkDefinition 45357 9 {0, 2, 5}

/-- The twenty genuinely fresh definitions, in compiler allocation order. -/
def freshDefinitions : List PositiveMembershipDefinition :=
  [definition0_210, definition0_211,
    definition2_310, definition2_311, definition2_410,
    definition2_411, definition2_510, definition2_511,
    definition6_023, definition6_024, definition6_025,
    definition7_023, definition7_024, definition7_025,
    definition8_023, definition8_024, definition8_025,
    definition9_023, definition9_024, definition9_025]

/-- Exact parent definitions reused by the compiler. -/
def reusedDefinitions : List PositiveMembershipDefinition :=
  [SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.definition10_23,
    SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.definition10_24,
    SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.definition10_25,
    SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.definition11_23,
    SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.definition11_24,
    SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.definition11_25]

/-- Every distinct definition referenced by a family block. -/
def definitions : List PositiveMembershipDefinition :=
  freshDefinitions ++ reusedDefinitions

/-- Deliberately impossible source meaning outside the twenty fresh indices. -/
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

/-- Executable byte-order anchor for all 120 Python-installed implications. -/
theorem implicationDimacs_eq :
    implicationDimacs =
      [[-18, 45338],
        [-20, 45338],
        [-22, 45338],
        [-19, 45339],
        [-21, 45339],
        [-23, 45339],
        [-156, 45340],
        [-163, 45340],
        [-164, 45340],
        [-165, 45340],
        [-166, 45340],
        [-156, 45341],
        [-163, 45341],
        [-164, 45341],
        [-165, 45341],
        [-166, 45341],
        [-157, 45342],
        [-167, 45342],
        [-168, 45342],
        [-169, 45342],
        [-170, 45342],
        [-157, 45343],
        [-167, 45343],
        [-168, 45343],
        [-169, 45343],
        [-170, 45343],
        [-158, 45344],
        [-171, 45344],
        [-172, 45344],
        [-173, 45344],
        [-174, 45344],
        [-158, 45345],
        [-171, 45345],
        [-172, 45345],
        [-173, 45345],
        [-174, 45345],
        [-1169, 45346],
        [-1170, 45346],
        [-1171, 45346],
        [-1172, 45346],
        [-1173, 45346],
        [-1174, 45346],
        [-1175, 45346],
        [-1169, 45347],
        [-1176, 45347],
        [-1177, 45347],
        [-1178, 45347],
        [-1179, 45347],
        [-1180, 45347],
        [-1181, 45347],
        [-1170, 45348],
        [-1176, 45348],
        [-1182, 45348],
        [-1183, 45348],
        [-1184, 45348],
        [-1185, 45348],
        [-1186, 45348],
        [-1483, 45349],
        [-1484, 45349],
        [-1485, 45349],
        [-1486, 45349],
        [-1487, 45349],
        [-1488, 45349],
        [-1489, 45349],
        [-1483, 45350],
        [-1490, 45350],
        [-1491, 45350],
        [-1492, 45350],
        [-1493, 45350],
        [-1494, 45350],
        [-1495, 45350],
        [-1484, 45351],
        [-1490, 45351],
        [-1496, 45351],
        [-1497, 45351],
        [-1498, 45351],
        [-1499, 45351],
        [-1500, 45351],
        [-1797, 45352],
        [-1798, 45352],
        [-1799, 45352],
        [-1800, 45352],
        [-1801, 45352],
        [-1802, 45352],
        [-1803, 45352],
        [-1797, 45353],
        [-1804, 45353],
        [-1805, 45353],
        [-1806, 45353],
        [-1807, 45353],
        [-1808, 45353],
        [-1809, 45353],
        [-1798, 45354],
        [-1804, 45354],
        [-1810, 45354],
        [-1811, 45354],
        [-1812, 45354],
        [-1813, 45354],
        [-1814, 45354],
        [-2111, 45355],
        [-2112, 45355],
        [-2113, 45355],
        [-2114, 45355],
        [-2115, 45355],
        [-2116, 45355],
        [-2117, 45355],
        [-2111, 45356],
        [-2118, 45356],
        [-2119, 45356],
        [-2120, 45356],
        [-2121, 45356],
        [-2122, 45356],
        [-2123, 45356],
        [-2112, 45357],
        [-2118, 45357],
        [-2124, 45357],
        [-2125, 45357],
        [-2126, 45357],
        [-2127, 45357],
        [-2128, 45357]] := by
  native_decide

private def definitionCompilerValid
    (definition : PositiveMembershipDefinition) : Bool :=
  decide (45337 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          45337 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ freshDefinitions) :
    45337 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            45337 ∧
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
    evalClauseD (positiveMembershipAssign base 45337 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ :=
    List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 45337
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
def familyData :
    List ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveData :=
  ([10, 11] : List Label).flatMap fun a =>
    ([3, 4, 5] : List Label).flatMap fun x =>
      ([6, 7, 8, 9] : List Label).map fun c => {a := a, x := x, c := c}

/-- Requirements are in the compiler's normalized center order. -/
def familyChoices
    (data : ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveData) :
    List (RowChoice Label) :=
  [{center := 0, support := {2, data.a}},
    {center := 2, support := {data.x, data.a}},
    {center := data.c, support := {0, 2, data.x}},
    {center := data.a, support := {2, data.x}}]

def lookupDefinition
    (requirement : RowChoice Label) : PositiveMembershipDefinition :=
  (definitions.find? fun definition =>
    decide (definition.requirement = requirement)).getD definition0_210

structure FamilyEntry where
  data : ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveData
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
      [[-45338, -45340, -45346, -45302],
        [-45338, -45340, -45349, -45302],
        [-45338, -45340, -45352, -45302],
        [-45338, -45340, -45355, -45302],
        [-45338, -45342, -45347, -45303],
        [-45338, -45342, -45350, -45303],
        [-45338, -45342, -45353, -45303],
        [-45338, -45342, -45356, -45303],
        [-45338, -45344, -45348, -45304],
        [-45338, -45344, -45351, -45304],
        [-45338, -45344, -45354, -45304],
        [-45338, -45344, -45357, -45304],
        [-45339, -45341, -45346, -45305],
        [-45339, -45341, -45349, -45305],
        [-45339, -45341, -45352, -45305],
        [-45339, -45341, -45355, -45305],
        [-45339, -45343, -45347, -45306],
        [-45339, -45343, -45350, -45306],
        [-45339, -45343, -45353, -45306],
        [-45339, -45343, -45356, -45306],
        [-45339, -45345, -45348, -45307],
        [-45339, -45345, -45351, -45307],
        [-45339, -45345, -45354, -45307],
        [-45339, -45345, -45357, -45307]] := by
  native_decide

/-- Executable cardinality, distinctness, and variable-range anchor. -/
theorem family_shape :
    freshDefinitions.length = 20 ∧ reusedDefinitions.length = 6 ∧
      definitions.length = 26 ∧ implicationDimacs.length = 120 ∧
      entries.length = 24 ∧ blockingClauses.length = 24 ∧
      (definitions.map fun definition => definition.requirement).Nodup ∧
      freshDefinitions.all (fun definition => decide
        (45338 ≤ definition.varIndex ∧ definition.varIndex ≤ 45357)) = true := by
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
    definition.varIndex ≤ 45337 := by
  have hall : (reusedDefinitions.all fun current =>
      decide (current.varIndex ≤ 45337)) = true := by
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
      (positiveMembershipAssign base 45337 row requirementAt)
      (positiveMembershipBlockingClause entryDefinitions) = false) :
    PositiveRowsMatch row (entryDefinitions.map fun definition =>
      definition.requirement) := by
  have hall : ∀ literal ∈ positiveMembershipBlockingClause entryDefinitions,
      evalLitD (positiveMembershipAssign base 45337 row requirementAt)
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
      (positiveMembershipAssign base 45337 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_mixed_blockingClause_false base row entry.definitions
      hvalid.2 hreused hfalse
  let nogood :=
    SourceOrderPositiveNogood.ofReciprocalFirstOppositeSurplusSecondOppositeCommonFive
      (entry.definitions.map fun definition => definition.requirement)
      entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
