/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexFirstSurplusSecondCommonFiveCertificate
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexPairCrossBlockMembershipFamilyCnf

/-!
# Exact CNF binding for the apex/first/surplus/second common-five family

This file binds the 24 checked `(a, b, y)` role instances to the deterministic
positive-membership extension installed after the surplus-pair family.  The
twelve `row 1 ⊇ {0, b, y}` requirements reuse exact variables from the
apex-pair cross-block family.  The six `row 0 ⊇ {a, b}` requirements and the
24 `row y ⊇ {a, b}` requirements receive fresh variables 45248--45277.

Candidate implication lists are emitted only for those 30 fresh definitions.
Every role block explicitly names its two fresh definitions and its reused
center-one definition.  Out-of-family fresh-variable lookups resolve to an
empty-support sentinel, never to a real family definition.

This is an exact-twelve predicate-ingress bridge.  It does not assert terminal
UNSAT, complete arm/placement coverage, an arbitrary-cardinality lift, or live
theorem closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf

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

-- The six fresh apex-center requirements.
def definition0_310 := mkDefinition 45248 0 {3, 10}
def definition0_311 := mkDefinition 45249 0 {3, 11}
def definition0_410 := mkDefinition 45250 0 {4, 10}
def definition0_411 := mkDefinition 45251 0 {4, 11}
def definition0_510 := mkDefinition 45252 0 {5, 10}
def definition0_511 := mkDefinition 45253 0 {5, 11}

-- The 24 fresh second-opposite-center requirements.
def definition6_310 := mkDefinition 45254 6 {3, 10}
def definition6_311 := mkDefinition 45255 6 {3, 11}
def definition6_410 := mkDefinition 45256 6 {4, 10}
def definition6_411 := mkDefinition 45257 6 {4, 11}
def definition6_510 := mkDefinition 45258 6 {5, 10}
def definition6_511 := mkDefinition 45259 6 {5, 11}
def definition7_310 := mkDefinition 45260 7 {3, 10}
def definition7_311 := mkDefinition 45261 7 {3, 11}
def definition7_410 := mkDefinition 45262 7 {4, 10}
def definition7_411 := mkDefinition 45263 7 {4, 11}
def definition7_510 := mkDefinition 45264 7 {5, 10}
def definition7_511 := mkDefinition 45265 7 {5, 11}
def definition8_310 := mkDefinition 45266 8 {3, 10}
def definition8_311 := mkDefinition 45267 8 {3, 11}
def definition8_410 := mkDefinition 45268 8 {4, 10}
def definition8_411 := mkDefinition 45269 8 {4, 11}
def definition8_510 := mkDefinition 45270 8 {5, 10}
def definition8_511 := mkDefinition 45271 8 {5, 11}
def definition9_310 := mkDefinition 45272 9 {3, 10}
def definition9_311 := mkDefinition 45273 9 {3, 11}
def definition9_410 := mkDefinition 45274 9 {4, 10}
def definition9_411 := mkDefinition 45275 9 {4, 11}
def definition9_510 := mkDefinition 45276 9 {5, 10}
def definition9_511 := mkDefinition 45277 9 {5, 11}

/-- The 30 genuinely fresh definitions, in compiler allocation order. -/
def freshDefinitions : List PositiveMembershipDefinition :=
  [definition0_310, definition0_311, definition0_410,
    definition0_411, definition0_510, definition0_511,
    definition6_310, definition6_311, definition6_410,
    definition6_411, definition6_510, definition6_511,
    definition7_310, definition7_311, definition7_410,
    definition7_411, definition7_510, definition7_511,
    definition8_310, definition8_311, definition8_410,
    definition8_411, definition8_510, definition8_511,
    definition9_310, definition9_311, definition9_410,
    definition9_411, definition9_510, definition9_511]

/-- Exact parent definitions reused by the compiler. -/
def reusedDefinitions : List PositiveMembershipDefinition :=
  [ApexPairCrossBlockMembershipFamilyCnf.definition1_036,
    ApexPairCrossBlockMembershipFamilyCnf.definition1_037,
    ApexPairCrossBlockMembershipFamilyCnf.definition1_038,
    ApexPairCrossBlockMembershipFamilyCnf.definition1_039,
    ApexPairCrossBlockMembershipFamilyCnf.definition1_046,
    ApexPairCrossBlockMembershipFamilyCnf.definition1_047,
    ApexPairCrossBlockMembershipFamilyCnf.definition1_048,
    ApexPairCrossBlockMembershipFamilyCnf.definition1_049,
    ApexPairCrossBlockMembershipFamilyCnf.definition1_056,
    ApexPairCrossBlockMembershipFamilyCnf.definition1_057,
    ApexPairCrossBlockMembershipFamilyCnf.definition1_058,
    ApexPairCrossBlockMembershipFamilyCnf.definition1_059]

/-- Every distinct definition referenced by a family block. -/
def definitions : List PositiveMembershipDefinition :=
  freshDefinitions ++ reusedDefinitions

/-- Deliberately impossible source meaning outside the 30 fresh indices: a
valid frozen row never contains its own center. -/
def outOfFamilyRequirement : RowChoice Label :=
  { center := 0, support := {0} }

theorem outOfFamilyRequirement_not_satisfied
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row) :
    ¬outOfFamilyRequirement.support ⊆ row outOfFamilyRequirement.center := by
  simpa [outOfFamilyRequirement] using hrow.sourceCube.center_not_mem 0

/-- Total source meaning for the 30 fresh variables, failing closed outside
their exact indices. -/
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

/-- Deterministic candidate implications for the 30 fresh definitions only. -/
def implicationDimacs : List (List Int) :=
  freshDefinitions.flatMap fun definition =>
    positiveMembershipIndexImplicationClauses
      definition.requirement.center (candidateIndicesFor definition) definition

private def definitionCompilerValid
    (definition : PositiveMembershipDefinition) : Bool :=
  decide (45247 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          45247 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ freshDefinitions) :
    45247 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            45247 ∧
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
    evalClauseD (positiveMembershipAssign base 45247 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ :=
    List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 45247
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

/-- The 24 roles, as two first-opposite choices times three surplus choices
times four second-opposite choices. -/
def familyData : List ApexFirstSurplusSecondCommonFiveData :=
  [{a := 10, b := 3, y := 6}, {a := 10, b := 3, y := 7},
    {a := 10, b := 3, y := 8}, {a := 10, b := 3, y := 9},
    {a := 10, b := 4, y := 6}, {a := 10, b := 4, y := 7},
    {a := 10, b := 4, y := 8}, {a := 10, b := 4, y := 9},
    {a := 10, b := 5, y := 6}, {a := 10, b := 5, y := 7},
    {a := 10, b := 5, y := 8}, {a := 10, b := 5, y := 9},
    {a := 11, b := 3, y := 6}, {a := 11, b := 3, y := 7},
    {a := 11, b := 3, y := 8}, {a := 11, b := 3, y := 9},
    {a := 11, b := 4, y := 6}, {a := 11, b := 4, y := 7},
    {a := 11, b := 4, y := 8}, {a := 11, b := 4, y := 9},
    {a := 11, b := 5, y := 6}, {a := 11, b := 5, y := 7},
    {a := 11, b := 5, y := 8}, {a := 11, b := 5, y := 9}]

def familyChoices (data : ApexFirstSurplusSecondCommonFiveData) :
    List (RowChoice Label) :=
  [{center := 0, support := {data.a, data.b}},
    {center := data.y, support := {data.a, data.b}},
    {center := 1, support := {0, data.b, data.y}}]

structure FamilyEntry where
  data : ApexFirstSurplusSecondCommonFiveData
  definitions : List PositiveMembershipDefinition
deriving DecidableEq

/-- Explicit role-to-definition wiring; no definition lookup fallback is used. -/
def entries : List FamilyEntry :=
  [{ data := {a := 10, b := 3, y := 6}
     definitions := [definition0_310, definition6_310,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_036] },
   { data := {a := 10, b := 3, y := 7}
     definitions := [definition0_310, definition7_310,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_037] },
   { data := {a := 10, b := 3, y := 8}
     definitions := [definition0_310, definition8_310,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_038] },
   { data := {a := 10, b := 3, y := 9}
     definitions := [definition0_310, definition9_310,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_039] },
   { data := {a := 10, b := 4, y := 6}
     definitions := [definition0_410, definition6_410,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_046] },
   { data := {a := 10, b := 4, y := 7}
     definitions := [definition0_410, definition7_410,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_047] },
   { data := {a := 10, b := 4, y := 8}
     definitions := [definition0_410, definition8_410,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_048] },
   { data := {a := 10, b := 4, y := 9}
     definitions := [definition0_410, definition9_410,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_049] },
   { data := {a := 10, b := 5, y := 6}
     definitions := [definition0_510, definition6_510,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_056] },
   { data := {a := 10, b := 5, y := 7}
     definitions := [definition0_510, definition7_510,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_057] },
   { data := {a := 10, b := 5, y := 8}
     definitions := [definition0_510, definition8_510,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_058] },
   { data := {a := 10, b := 5, y := 9}
     definitions := [definition0_510, definition9_510,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_059] },
   { data := {a := 11, b := 3, y := 6}
     definitions := [definition0_311, definition6_311,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_036] },
   { data := {a := 11, b := 3, y := 7}
     definitions := [definition0_311, definition7_311,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_037] },
   { data := {a := 11, b := 3, y := 8}
     definitions := [definition0_311, definition8_311,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_038] },
   { data := {a := 11, b := 3, y := 9}
     definitions := [definition0_311, definition9_311,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_039] },
   { data := {a := 11, b := 4, y := 6}
     definitions := [definition0_411, definition6_411,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_046] },
   { data := {a := 11, b := 4, y := 7}
     definitions := [definition0_411, definition7_411,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_047] },
   { data := {a := 11, b := 4, y := 8}
     definitions := [definition0_411, definition8_411,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_048] },
   { data := {a := 11, b := 4, y := 9}
     definitions := [definition0_411, definition9_411,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_049] },
   { data := {a := 11, b := 5, y := 6}
     definitions := [definition0_511, definition6_511,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_056] },
   { data := {a := 11, b := 5, y := 7}
     definitions := [definition0_511, definition7_511,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_057] },
   { data := {a := 11, b := 5, y := 8}
     definitions := [definition0_511, definition8_511,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_058] },
   { data := {a := 11, b := 5, y := 9}
     definitions := [definition0_511, definition9_511,
       ApexPairCrossBlockMembershipFamilyCnf.definition1_059] }]

def blockingClauses : List (List Int) :=
  entries.map fun entry => positiveMembershipBlockingClause entry.definitions

/-- Executable cardinality, distinctness, and variable-range anchor. -/
theorem family_shape :
    freshDefinitions.length = 30 ∧ reusedDefinitions.length = 12 ∧
      definitions.length = 42 ∧ entries.length = 24 ∧
      blockingClauses.length = 24 ∧
      (definitions.map fun definition => definition.requirement).Nodup ∧
      freshDefinitions.all (fun definition => decide
        (45248 ≤ definition.varIndex ∧ definition.varIndex ≤ 45277)) = true := by
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

private theorem reused_definition_le_cutoff
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ reusedDefinitions) :
    definition.varIndex ≤ 45247 := by
  have hall : (reusedDefinitions.all fun current =>
      decide (current.varIndex ≤ 45247)) = true := by native_decide
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
      (positiveMembershipAssign base 45247 row requirementAt)
      (positiveMembershipBlockingClause entryDefinitions) = false) :
    PositiveRowsMatch row (entryDefinitions.map fun definition =>
      definition.requirement) := by
  have hall : ∀ literal ∈ positiveMembershipBlockingClause entryDefinitions,
      evalLitD (positiveMembershipAssign base 45247 row requirementAt)
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
      (positiveMembershipAssign base 45247 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_mixed_blockingClause_false base row entry.definitions
      hvalid.2 hreused hfalse
  let nogood :=
    SourceOrderPositiveNogood.ofApexFirstSurplusSecondCommonFive
      (entry.definitions.map fun definition => definition.requirement)
      entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
