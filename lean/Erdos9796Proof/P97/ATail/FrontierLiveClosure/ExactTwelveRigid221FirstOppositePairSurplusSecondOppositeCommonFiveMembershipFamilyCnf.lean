/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221FirstOppositePairSurplusSecondOppositeCommonFiveCertificate
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf

/-!
# Exact CNF binding for the first-opposite-pair common-five family

This file binds all 48 checked `(a, b, c)` role instances to the deterministic
positive-membership extension installed after the v21 family.  The 24
requirements `row 10 ⊇ {a,b}` and `row 11 ⊇ {a,b}` reuse variables
45201--45224.  The 12 merged requirements `row c ⊇ {b,10,11}` receive fresh
variables 45358--45369.  Each role contributes one three-literal block.

This is finite exact-twelve predicate ingress only.  It does not assert
terminal UNSAT, complete arm coverage, an arbitrary-cardinality lift, or live
Rigid221 closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf

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

def definition6_31011 := mkDefinition 45358 6 {3, 10, 11}
def definition6_41011 := mkDefinition 45359 6 {4, 10, 11}
def definition6_51011 := mkDefinition 45360 6 {5, 10, 11}
def definition7_31011 := mkDefinition 45361 7 {3, 10, 11}
def definition7_41011 := mkDefinition 45362 7 {4, 10, 11}
def definition7_51011 := mkDefinition 45363 7 {5, 10, 11}
def definition8_31011 := mkDefinition 45364 8 {3, 10, 11}
def definition8_41011 := mkDefinition 45365 8 {4, 10, 11}
def definition8_51011 := mkDefinition 45366 8 {5, 10, 11}
def definition9_31011 := mkDefinition 45367 9 {3, 10, 11}
def definition9_41011 := mkDefinition 45368 9 {4, 10, 11}
def definition9_51011 := mkDefinition 45369 9 {5, 10, 11}

/-- The twelve genuinely fresh definitions, in compiler allocation order. -/
def freshDefinitions : List PositiveMembershipDefinition :=
  [definition6_31011, definition6_41011, definition6_51011,
    definition7_31011, definition7_41011, definition7_51011,
    definition8_31011, definition8_41011, definition8_51011,
    definition9_31011, definition9_41011, definition9_51011]

/-- The 24 exact parent definitions reused by the compiler. -/
def reusedDefinitions : List PositiveMembershipDefinition :=
  ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf.freshDefinitions.drop 24

/-- Every distinct definition referenced by a family block. -/
def definitions : List PositiveMembershipDefinition :=
  freshDefinitions ++ reusedDefinitions

/-- Deliberately non-family source meaning outside the twelve fresh indices. -/
def outOfFamilyRequirement : RowChoice Label :=
  { center := 0, support := {0} }

/-- Total source meaning for the fresh variables, failing closed outside their
exact indices. -/
def requirementAt (v : Nat) : RowChoice Label :=
  (freshDefinitions.find? fun definition =>
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

/-- Deterministic candidate implications for the twelve fresh definitions. -/
def implicationDimacs : List (List Int) :=
  freshDefinitions.flatMap fun definition =>
    positiveMembershipIndexImplicationClauses
      definition.requirement.center (candidateIndicesFor definition) definition

/-- Executable byte-order anchor for all 96 Python-installed implications. -/
theorem implicationDimacs_eq :
    implicationDimacs =
      [[-1217, 45358], [-1300, 45358], [-1355, 45358], [-1404, 45358],
        [-1414, 45358], [-1419, 45358], [-1422, 45358], [-1423, 45358],
        [-1232, 45359], [-1315, 45359], [-1370, 45359], [-1404, 45359],
        [-1433, 45359], [-1438, 45359], [-1441, 45359], [-1442, 45359],
        [-1242, 45360], [-1325, 45360], [-1380, 45360], [-1414, 45360],
        [-1433, 45360], [-1447, 45360], [-1450, 45360], [-1451, 45360],
        [-1531, 45361], [-1614, 45361], [-1669, 45361], [-1718, 45361],
        [-1728, 45361], [-1733, 45361], [-1736, 45361], [-1737, 45361],
        [-1546, 45362], [-1629, 45362], [-1684, 45362], [-1718, 45362],
        [-1747, 45362], [-1752, 45362], [-1755, 45362], [-1756, 45362],
        [-1556, 45363], [-1639, 45363], [-1694, 45363], [-1728, 45363],
        [-1747, 45363], [-1761, 45363], [-1764, 45363], [-1765, 45363],
        [-1845, 45364], [-1928, 45364], [-1983, 45364], [-2032, 45364],
        [-2042, 45364], [-2047, 45364], [-2050, 45364], [-2051, 45364],
        [-1860, 45365], [-1943, 45365], [-1998, 45365], [-2032, 45365],
        [-2061, 45365], [-2066, 45365], [-2069, 45365], [-2070, 45365],
        [-1870, 45366], [-1953, 45366], [-2008, 45366], [-2042, 45366],
        [-2061, 45366], [-2075, 45366], [-2078, 45366], [-2079, 45366],
        [-2159, 45367], [-2242, 45367], [-2297, 45367], [-2346, 45367],
        [-2356, 45367], [-2361, 45367], [-2364, 45367], [-2365, 45367],
        [-2174, 45368], [-2257, 45368], [-2312, 45368], [-2346, 45368],
        [-2375, 45368], [-2380, 45368], [-2383, 45368], [-2384, 45368],
        [-2184, 45369], [-2267, 45369], [-2322, 45369], [-2356, 45369],
        [-2375, 45369], [-2389, 45369], [-2392, 45369], [-2393, 45369]] := by
  native_decide


private def definitionCompilerValid
    (definition : PositiveMembershipDefinition) : Bool :=
  decide (45357 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          45357 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ freshDefinitions) :
    45357 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            45357 ∧
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
    evalClauseD (positiveMembershipAssign base 45357 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ :=
    List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 45357
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

/-- The 48 roles, in Python compiler order. -/
def familyData :
    List FirstOppositePairSurplusSecondOppositeCommonFiveData :=
  ([6, 7, 8, 9] : List Label).flatMap fun a =>
    ([3, 4, 5] : List Label).flatMap fun b =>
      ([6, 7, 8, 9] : List Label).map fun c => {a := a, b := b, c := c}

/-- Requirements are in the compiler's normalized center order. -/
def familyChoices
    (data : FirstOppositePairSurplusSecondOppositeCommonFiveData) :
    List (RowChoice Label) :=
  [{center := data.c, support := {data.b, 10, 11}},
    {center := 10, support := {data.a, data.b}},
    {center := 11, support := {data.a, data.b}}]

def lookupDefinition
    (requirement : RowChoice Label) : PositiveMembershipDefinition :=
  (definitions.find? fun definition =>
    decide (definition.requirement = requirement)).getD definition6_31011

structure FamilyEntry where
  data : FirstOppositePairSurplusSecondOppositeCommonFiveData
  definitions : List PositiveMembershipDefinition
deriving DecidableEq

def entries : List FamilyEntry :=
  familyData.map fun data =>
    { data := data
      definitions := (familyChoices data).map lookupDefinition }

def blockingClauses : List (List Int) :=
  entries.map fun entry => positiveMembershipBlockingClause entry.definitions

/-- Executable byte-order anchor for all 48 Python-installed blocks. -/
theorem blockingClauses_eq :
    blockingClauses =
      [[-45358, -45201, -45213], [-45361, -45201, -45213],
        [-45364, -45201, -45213], [-45367, -45201, -45213],
        [-45359, -45205, -45217], [-45362, -45205, -45217],
        [-45365, -45205, -45217], [-45368, -45205, -45217],
        [-45360, -45209, -45221], [-45363, -45209, -45221],
        [-45366, -45209, -45221], [-45369, -45209, -45221],
        [-45358, -45202, -45214], [-45361, -45202, -45214],
        [-45364, -45202, -45214], [-45367, -45202, -45214],
        [-45359, -45206, -45218], [-45362, -45206, -45218],
        [-45365, -45206, -45218], [-45368, -45206, -45218],
        [-45360, -45210, -45222], [-45363, -45210, -45222],
        [-45366, -45210, -45222], [-45369, -45210, -45222],
        [-45358, -45203, -45215], [-45361, -45203, -45215],
        [-45364, -45203, -45215], [-45367, -45203, -45215],
        [-45359, -45207, -45219], [-45362, -45207, -45219],
        [-45365, -45207, -45219], [-45368, -45207, -45219],
        [-45360, -45211, -45223], [-45363, -45211, -45223],
        [-45366, -45211, -45223], [-45369, -45211, -45223],
        [-45358, -45204, -45216], [-45361, -45204, -45216],
        [-45364, -45204, -45216], [-45367, -45204, -45216],
        [-45359, -45208, -45220], [-45362, -45208, -45220],
        [-45365, -45208, -45220], [-45368, -45208, -45220],
        [-45360, -45212, -45224], [-45363, -45212, -45224],
        [-45366, -45212, -45224], [-45369, -45212, -45224]] := by
  native_decide

/-- Executable cardinality, distinctness, and variable-range anchor. -/
theorem family_shape :
    freshDefinitions.length = 12 ∧ reusedDefinitions.length = 24 ∧
      definitions.length = 36 ∧ implicationDimacs.length = 96 ∧
      entries.length = 48 ∧ blockingClauses.length = 48 ∧
      (definitions.map fun definition => definition.requirement).Nodup ∧
      freshDefinitions.all (fun definition => decide
        (45358 ≤ definition.varIndex ∧ definition.varIndex ≤ 45369)) = true := by
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
    definition.varIndex ≤ 45357 := by
  have hall : (reusedDefinitions.all fun current =>
      decide (current.varIndex ≤ 45357)) = true := by
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
      (positiveMembershipAssign base 45357 row requirementAt)
      (positiveMembershipBlockingClause entryDefinitions) = false) :
    PositiveRowsMatch row (entryDefinitions.map fun definition =>
      definition.requirement) := by
  have hall : ∀ literal ∈ positiveMembershipBlockingClause entryDefinitions,
      evalLitD (positiveMembershipAssign base 45357 row requirementAt)
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
48-role common-five theorem. -/
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
      (positiveMembershipAssign base 45357 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_mixed_blockingClause_false base row entry.definitions
      hvalid.2 hreused hfalse
  let nogood :=
    SourceOrderPositiveNogood.ofFirstOppositePairSurplusSecondOppositeCommonFive
      (entry.definitions.map fun definition => definition.requirement)
      entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
