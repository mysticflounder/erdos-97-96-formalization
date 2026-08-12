/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SurplusPairSecondOppositeApexPairCommonFiveCertificate
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexZeroCrossBlockMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexPairCrossBlockMembershipFamilyCnf

/-!
# Exact CNF binding for the surplus-pair/second-opposite/apex-pair family

This file binds the 24 checked `(a, x, y)` role instances to the deterministic
positive-membership extension installed after the apex-triple family.  The
twelve `row x ⊇ {0, a}` requirements and twelve `row 1 ⊇ {0, x, y}`
requirements reuse exact variables from parent families.  Only the six
ordered-distinct `row y ⊇ {0, a}` requirements receive fresh variables,
occupying 45242--45247.

Candidate implication lists are emitted only for those six fresh definitions.
Every role block explicitly names its two reused definitions and one fresh
definition.  Out-of-family fresh-variable lookups resolve to an empty-support
sentinel, never to a real family definition.

This is an exact-twelve predicate-ingress bridge.  It does not assert terminal
UNSAT, complete arm/placement coverage, an arbitrary-cardinality lift, or live
theorem closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyCnf

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

-- The six ordered-distinct surplus-center requirements.
def definition3_04 := mkDefinition 45242 3 {0, 4}
def definition3_05 := mkDefinition 45243 3 {0, 5}
def definition4_03 := mkDefinition 45244 4 {0, 3}
def definition4_05 := mkDefinition 45245 4 {0, 5}
def definition5_03 := mkDefinition 45246 5 {0, 3}
def definition5_04 := mkDefinition 45247 5 {0, 4}

/-- The six genuinely fresh definitions, in compiler allocation order. -/
def freshDefinitions : List PositiveMembershipDefinition :=
  [definition3_04, definition3_05, definition4_03,
    definition4_05, definition5_03, definition5_04]

/-- Exact parent definitions reused by the compiler. -/
def reusedDefinitions : List PositiveMembershipDefinition :=
  [ApexZeroCrossBlockMembershipFamilyCnf.definition6_03,
    ApexZeroCrossBlockMembershipFamilyCnf.definition6_04,
    ApexZeroCrossBlockMembershipFamilyCnf.definition6_05,
    ApexZeroCrossBlockMembershipFamilyCnf.definition7_03,
    ApexZeroCrossBlockMembershipFamilyCnf.definition7_04,
    ApexZeroCrossBlockMembershipFamilyCnf.definition7_05,
    ApexZeroCrossBlockMembershipFamilyCnf.definition8_03,
    ApexZeroCrossBlockMembershipFamilyCnf.definition8_04,
    ApexZeroCrossBlockMembershipFamilyCnf.definition8_05,
    ApexZeroCrossBlockMembershipFamilyCnf.definition9_03,
    ApexZeroCrossBlockMembershipFamilyCnf.definition9_04,
    ApexZeroCrossBlockMembershipFamilyCnf.definition9_05,
    ApexPairCrossBlockMembershipFamilyCnf.definition1_036,
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

/-- Deliberately non-family source meaning outside the six fresh indices. -/
def outOfFamilyRequirement : RowChoice Label :=
  { center := 0, support := ∅ }

/-- Total source meaning for the six fresh variables, failing closed outside
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

/-- Deterministic candidate implications for the six fresh definitions only. -/
def implicationDimacs : List (List Int) :=
  freshDefinitions.flatMap fun definition =>
    positiveMembershipIndexImplicationClauses
      definition.requirement.center (candidateIndicesFor definition) definition

private def definitionCompilerValid
    (definition : PositiveMembershipDefinition) : Bool :=
  decide (45241 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement) &&
    (candidateIndicesFor definition).all fun candidateIndex =>
      decide (candidateIndex <
          SafeCoverCnf.candCount definition.requirement.center.val ∧
        SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
          45241 ∧
        ∀ a ∈ definition.requirement.support,
          ((SafeCoverCnf.candMasks definition.requirement.center.val).getD
            candidateIndex 0).testBit a.val = true)

private theorem definition_compiler_valid
    {definition : PositiveMembershipDefinition}
    (hdefinition : definition ∈ freshDefinitions) :
    45241 < definition.varIndex ∧
      requirementAt definition.varIndex = definition.requirement ∧
      ∀ candidateIndex ∈ candidateIndicesFor definition,
        candidateIndex <
            SafeCoverCnf.candCount definition.requirement.center.val ∧
          SafeCoverCnf.xVar definition.requirement.center.val candidateIndex ≤
            45241 ∧
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
    evalClauseD (positiveMembershipAssign base 45241 row requirementAt)
      clause = true := by
  obtain ⟨definition, hdefinition, hclause⟩ :=
    List.mem_flatMap.mp hclause
  have hvalid := definition_compiler_valid hdefinition
  apply positiveMembershipIndexImplicationClauses_sat hrow base 45241
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

/-- The 24 roles, as six ordered surplus pairs times four second-opposite
labels. -/
def familyData :
    List SurplusPairSecondOppositeApexPairCommonFiveData :=
  [{a := 3, x := 6, y := 4}, {a := 3, x := 7, y := 4},
    {a := 3, x := 8, y := 4}, {a := 3, x := 9, y := 4},
    {a := 3, x := 6, y := 5}, {a := 3, x := 7, y := 5},
    {a := 3, x := 8, y := 5}, {a := 3, x := 9, y := 5},
    {a := 4, x := 6, y := 3}, {a := 4, x := 7, y := 3},
    {a := 4, x := 8, y := 3}, {a := 4, x := 9, y := 3},
    {a := 4, x := 6, y := 5}, {a := 4, x := 7, y := 5},
    {a := 4, x := 8, y := 5}, {a := 4, x := 9, y := 5},
    {a := 5, x := 6, y := 3}, {a := 5, x := 7, y := 3},
    {a := 5, x := 8, y := 3}, {a := 5, x := 9, y := 3},
    {a := 5, x := 6, y := 4}, {a := 5, x := 7, y := 4},
    {a := 5, x := 8, y := 4}, {a := 5, x := 9, y := 4}]

def familyChoices
    (data : SurplusPairSecondOppositeApexPairCommonFiveData) :
    List (RowChoice Label) :=
  [{center := data.x, support := {data.a, 0}},
    {center := data.y, support := {data.a, 0}},
    {center := 1, support := {0, data.x, data.y}}]

structure FamilyEntry where
  data : SurplusPairSecondOppositeApexPairCommonFiveData
  definitions : List PositiveMembershipDefinition
deriving DecidableEq

/-- Explicit role-to-definition wiring; no definition lookup fallback is used. -/
def entries : List FamilyEntry :=
  [{ data := {a := 3, x := 6, y := 4}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition6_03,
       definition4_03, ApexPairCrossBlockMembershipFamilyCnf.definition1_046] },
   { data := {a := 3, x := 7, y := 4}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition7_03,
       definition4_03, ApexPairCrossBlockMembershipFamilyCnf.definition1_047] },
   { data := {a := 3, x := 8, y := 4}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition8_03,
       definition4_03, ApexPairCrossBlockMembershipFamilyCnf.definition1_048] },
   { data := {a := 3, x := 9, y := 4}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition9_03,
       definition4_03, ApexPairCrossBlockMembershipFamilyCnf.definition1_049] },
   { data := {a := 3, x := 6, y := 5}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition6_03,
       definition5_03, ApexPairCrossBlockMembershipFamilyCnf.definition1_056] },
   { data := {a := 3, x := 7, y := 5}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition7_03,
       definition5_03, ApexPairCrossBlockMembershipFamilyCnf.definition1_057] },
   { data := {a := 3, x := 8, y := 5}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition8_03,
       definition5_03, ApexPairCrossBlockMembershipFamilyCnf.definition1_058] },
   { data := {a := 3, x := 9, y := 5}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition9_03,
       definition5_03, ApexPairCrossBlockMembershipFamilyCnf.definition1_059] },
   { data := {a := 4, x := 6, y := 3}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition6_04,
       definition3_04, ApexPairCrossBlockMembershipFamilyCnf.definition1_036] },
   { data := {a := 4, x := 7, y := 3}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition7_04,
       definition3_04, ApexPairCrossBlockMembershipFamilyCnf.definition1_037] },
   { data := {a := 4, x := 8, y := 3}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition8_04,
       definition3_04, ApexPairCrossBlockMembershipFamilyCnf.definition1_038] },
   { data := {a := 4, x := 9, y := 3}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition9_04,
       definition3_04, ApexPairCrossBlockMembershipFamilyCnf.definition1_039] },
   { data := {a := 4, x := 6, y := 5}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition6_04,
       definition5_04, ApexPairCrossBlockMembershipFamilyCnf.definition1_056] },
   { data := {a := 4, x := 7, y := 5}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition7_04,
       definition5_04, ApexPairCrossBlockMembershipFamilyCnf.definition1_057] },
   { data := {a := 4, x := 8, y := 5}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition8_04,
       definition5_04, ApexPairCrossBlockMembershipFamilyCnf.definition1_058] },
   { data := {a := 4, x := 9, y := 5}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition9_04,
       definition5_04, ApexPairCrossBlockMembershipFamilyCnf.definition1_059] },
   { data := {a := 5, x := 6, y := 3}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition6_05,
       definition3_05, ApexPairCrossBlockMembershipFamilyCnf.definition1_036] },
   { data := {a := 5, x := 7, y := 3}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition7_05,
       definition3_05, ApexPairCrossBlockMembershipFamilyCnf.definition1_037] },
   { data := {a := 5, x := 8, y := 3}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition8_05,
       definition3_05, ApexPairCrossBlockMembershipFamilyCnf.definition1_038] },
   { data := {a := 5, x := 9, y := 3}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition9_05,
       definition3_05, ApexPairCrossBlockMembershipFamilyCnf.definition1_039] },
   { data := {a := 5, x := 6, y := 4}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition6_05,
       definition4_05, ApexPairCrossBlockMembershipFamilyCnf.definition1_046] },
   { data := {a := 5, x := 7, y := 4}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition7_05,
       definition4_05, ApexPairCrossBlockMembershipFamilyCnf.definition1_047] },
   { data := {a := 5, x := 8, y := 4}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition8_05,
       definition4_05, ApexPairCrossBlockMembershipFamilyCnf.definition1_048] },
   { data := {a := 5, x := 9, y := 4}
     definitions := [ApexZeroCrossBlockMembershipFamilyCnf.definition9_05,
       definition4_05, ApexPairCrossBlockMembershipFamilyCnf.definition1_049] }]

def blockingClauses : List (List Int) :=
  entries.map fun entry => positiveMembershipBlockingClause entry.definitions

/-- Executable cardinality, distinctness, and variable-range anchor. -/
theorem family_shape :
    freshDefinitions.length = 6 ∧ reusedDefinitions.length = 24 ∧
      definitions.length = 30 ∧ entries.length = 24 ∧
      blockingClauses.length = 24 ∧
      (definitions.map fun definition => definition.requirement).Nodup ∧
      freshDefinitions.all (fun definition => decide
        (45242 ≤ definition.varIndex ∧ definition.varIndex ≤ 45247)) = true := by
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
    definition.varIndex ≤ 45241 := by
  have hall : (reusedDefinitions.all fun current =>
      decide (current.varIndex ≤ 45241)) = true := by native_decide
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
      (positiveMembershipAssign base 45241 row requirementAt)
      (positiveMembershipBlockingClause entryDefinitions) = false) :
    PositiveRowsMatch row (entryDefinitions.map fun definition =>
      definition.requirement) := by
  have hall : ∀ literal ∈ positiveMembershipBlockingClause entryDefinitions,
      evalLitD (positiveMembershipAssign base 45241 row requirementAt)
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
      (positiveMembershipAssign base 45241 row requirementAt)
      (positiveMembershipBlockingClause entry.definitions) = false) : False := by
  have hvalid := entry_valid hentry
  have hpositive : PositiveRowsMatch row
      (entry.definitions.map fun definition => definition.requirement) :=
    positiveRowsMatch_of_mixed_blockingClause_false base row entry.definitions
      hvalid.2 hreused hfalse
  let nogood :=
    SourceOrderPositiveNogood.ofSurplusPairSecondOppositeApexPairCommonFive
      (entry.definitions.map fun definition => definition.requirement)
      entry.data hvalid.1
  apply nogood.refutes hreal order hforced hconv
  simpa [nogood] using hpositive

end SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
