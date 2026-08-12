/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SecondApexSurplusSecondFirstCommonFiveCertificate
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SurplusApexPairMembershipFamilyCnf

/-!
# Exact CNF binding for the second-apex/surplus/second-opposite/first-opposite common-five family

This file binds the 24 checked `(b, c, y)` role instances to the deterministic
positive-membership extension installed after the surplus-apex-pair family.
The three `row 0 ⊇ {2, b}` requirements reuse exact variables from that
family.  The six `row y ⊇ {2, b}` requirements and the 24 `row c ⊇ {0, b, y}`
requirements receive fresh variables 45278--45307.

Candidate implication lists are emitted only for those 30 fresh definitions.
Every role block explicitly uses its two fresh definitions and its reused
center-zero definition.  Out-of-family fresh-variable lookups resolve to an
empty-support sentinel, never to a real family definition.

This is an exact-twelve predicate-ingress bridge.  It does not assert terminal
UNSAT, complete arm/placement coverage, an arbitrary-cardinality lift, or live
theorem closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf

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

-- The six fresh first-opposite-center requirements.
def definition10_23 := mkDefinition 45278 10 {2, 3}
def definition11_23 := mkDefinition 45279 11 {2, 3}
def definition10_24 := mkDefinition 45280 10 {2, 4}
def definition11_24 := mkDefinition 45281 11 {2, 4}
def definition10_25 := mkDefinition 45282 10 {2, 5}
def definition11_25 := mkDefinition 45283 11 {2, 5}

-- The 24 fresh second-opposite-center requirements.
def definition6_0310 := mkDefinition 45284 6 {0, 3, 10}
def definition6_0311 := mkDefinition 45285 6 {0, 3, 11}
def definition6_0410 := mkDefinition 45286 6 {0, 4, 10}
def definition6_0411 := mkDefinition 45287 6 {0, 4, 11}
def definition6_0510 := mkDefinition 45288 6 {0, 5, 10}
def definition6_0511 := mkDefinition 45289 6 {0, 5, 11}
def definition7_0310 := mkDefinition 45290 7 {0, 3, 10}
def definition7_0311 := mkDefinition 45291 7 {0, 3, 11}
def definition7_0410 := mkDefinition 45292 7 {0, 4, 10}
def definition7_0411 := mkDefinition 45293 7 {0, 4, 11}
def definition7_0510 := mkDefinition 45294 7 {0, 5, 10}
def definition7_0511 := mkDefinition 45295 7 {0, 5, 11}
def definition8_0310 := mkDefinition 45296 8 {0, 3, 10}
def definition8_0311 := mkDefinition 45297 8 {0, 3, 11}
def definition8_0410 := mkDefinition 45298 8 {0, 4, 10}
def definition8_0411 := mkDefinition 45299 8 {0, 4, 11}
def definition8_0510 := mkDefinition 45300 8 {0, 5, 10}
def definition8_0511 := mkDefinition 45301 8 {0, 5, 11}
def definition9_0310 := mkDefinition 45302 9 {0, 3, 10}
def definition9_0311 := mkDefinition 45303 9 {0, 3, 11}
def definition9_0410 := mkDefinition 45304 9 {0, 4, 10}
def definition9_0411 := mkDefinition 45305 9 {0, 4, 11}
def definition9_0510 := mkDefinition 45306 9 {0, 5, 10}
def definition9_0511 := mkDefinition 45307 9 {0, 5, 11}

/-- The 30 genuinely fresh definitions, in compiler allocation order. -/
def freshDefinitions : List PositiveMembershipDefinition :=
  [definition10_23, definition11_23, definition10_24,
    definition11_24, definition10_25, definition11_25,
    definition6_0310, definition6_0311, definition6_0410,
    definition6_0411, definition6_0510, definition6_0511,
    definition7_0310, definition7_0311, definition7_0410,
    definition7_0411, definition7_0510, definition7_0511,
    definition8_0310, definition8_0311, definition8_0410,
    definition8_0411, definition8_0510, definition8_0511,
    definition9_0310, definition9_0311, definition9_0410,
    definition9_0411, definition9_0510, definition9_0511]

/-- Exact parent definitions reused by the compiler. -/
def reusedDefinitions : List PositiveMembershipDefinition :=
  [SurplusApexPairMembershipFamilyCnf.definition0_23,
    SurplusApexPairMembershipFamilyCnf.definition0_24,
    SurplusApexPairMembershipFamilyCnf.definition0_25]

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
  decide (45277 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          45277 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ freshDefinitions) :
    45277 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            45277 ∧
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
    evalClauseD (positiveMembershipAssign base 45277 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ :=
    List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 45277
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

/-- The 24 roles, as three surplus choices times four second-opposite choices
times two first-opposite choices. -/
def familyData : List SecondApexSurplusSecondFirstCommonFiveData :=
  ([3, 4, 5] : List Label).flatMap fun b =>
    ([6, 7, 8, 9] : List Label).flatMap fun c =>
      ([10, 11] : List Label).map fun y => {b := b, c := c, y := y}

def familyChoices
    (data : SecondApexSurplusSecondFirstCommonFiveData) :
    List (RowChoice Label) :=
  [{center := 0, support := {2, data.b}},
    {center := data.y, support := {2, data.b}},
    {center := data.c, support := {0, data.b, data.y}}]

structure FamilyEntry where
  data : SecondApexSurplusSecondFirstCommonFiveData
  definitions : List PositiveMembershipDefinition
deriving DecidableEq

/-- Explicit role-to-definition wiring; no definition lookup fallback is used. -/
def entries : List FamilyEntry :=
  [{ data := {b := 3, c := 6, y := 10}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_23,
       definition10_23, definition6_0310] },
   { data := {b := 3, c := 6, y := 11}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_23,
       definition11_23, definition6_0311] },
   { data := {b := 3, c := 7, y := 10}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_23,
       definition10_23, definition7_0310] },
   { data := {b := 3, c := 7, y := 11}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_23,
       definition11_23, definition7_0311] },
   { data := {b := 3, c := 8, y := 10}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_23,
       definition10_23, definition8_0310] },
   { data := {b := 3, c := 8, y := 11}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_23,
       definition11_23, definition8_0311] },
   { data := {b := 3, c := 9, y := 10}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_23,
       definition10_23, definition9_0310] },
   { data := {b := 3, c := 9, y := 11}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_23,
       definition11_23, definition9_0311] },
   { data := {b := 4, c := 6, y := 10}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_24,
       definition10_24, definition6_0410] },
   { data := {b := 4, c := 6, y := 11}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_24,
       definition11_24, definition6_0411] },
   { data := {b := 4, c := 7, y := 10}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_24,
       definition10_24, definition7_0410] },
   { data := {b := 4, c := 7, y := 11}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_24,
       definition11_24, definition7_0411] },
   { data := {b := 4, c := 8, y := 10}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_24,
       definition10_24, definition8_0410] },
   { data := {b := 4, c := 8, y := 11}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_24,
       definition11_24, definition8_0411] },
   { data := {b := 4, c := 9, y := 10}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_24,
       definition10_24, definition9_0410] },
   { data := {b := 4, c := 9, y := 11}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_24,
       definition11_24, definition9_0411] },
   { data := {b := 5, c := 6, y := 10}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_25,
       definition10_25, definition6_0510] },
   { data := {b := 5, c := 6, y := 11}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_25,
       definition11_25, definition6_0511] },
   { data := {b := 5, c := 7, y := 10}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_25,
       definition10_25, definition7_0510] },
   { data := {b := 5, c := 7, y := 11}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_25,
       definition11_25, definition7_0511] },
   { data := {b := 5, c := 8, y := 10}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_25,
       definition10_25, definition8_0510] },
   { data := {b := 5, c := 8, y := 11}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_25,
       definition11_25, definition8_0511] },
   { data := {b := 5, c := 9, y := 10}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_25,
       definition10_25, definition9_0510] },
   { data := {b := 5, c := 9, y := 11}
     definitions := [SurplusApexPairMembershipFamilyCnf.definition0_25,
       definition11_25, definition9_0511] }]

def blockingClauses : List (List Int) :=
  entries.map fun entry => positiveMembershipBlockingClause entry.definitions

/-- Executable cardinality, distinctness, and variable-range anchor. -/
theorem family_shape :
    freshDefinitions.length = 30 ∧ reusedDefinitions.length = 3 ∧
      definitions.length = 33 ∧ entries.length = 24 ∧
      blockingClauses.length = 24 ∧
      (definitions.map fun definition => definition.requirement).Nodup ∧
      freshDefinitions.all (fun definition => decide
        (45278 ≤ definition.varIndex ∧ definition.varIndex ≤ 45307)) = true := by
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
    definition.varIndex ≤ 45277 := by
  have hall : (reusedDefinitions.all fun current =>
      decide (current.varIndex ≤ 45277)) = true := by
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
      (positiveMembershipAssign base 45277 row requirementAt)
      (positiveMembershipBlockingClause entryDefinitions) = false) :
    PositiveRowsMatch row (entryDefinitions.map fun definition =>
      definition.requirement) := by
  have hall : ∀ literal ∈ positiveMembershipBlockingClause entryDefinitions,
      evalLitD (positiveMembershipAssign base 45277 row requirementAt)
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
      (positiveMembershipAssign base 45277 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_mixed_blockingClause_false base row entry.definitions
      hvalid.2 hreused hfalse
  let nogood :=
    SourceOrderPositiveNogood.ofSecondApexSurplusSecondFirstCommonFive
      (entry.definitions.map fun definition => definition.requirement)
      entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
