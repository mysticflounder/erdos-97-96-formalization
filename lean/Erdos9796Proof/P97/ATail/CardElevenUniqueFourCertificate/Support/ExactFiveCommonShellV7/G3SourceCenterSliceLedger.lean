/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3SelectedLocalEqSliceLedger

/-!
# Authenticated retained source-center slice of the exact-eleven G3 core

The sixth checkpoint segment contains `317` retained clauses from the
`6642`-clause Tseitin family equating each source-center atom with the
disjunction of source-row choices having that center.  This file decodes the
source-family ordinals, reconstructs each typed forward or reverse occurrence,
authenticates the rendering against checkpoint zero, and proves every retained
clause from the source-indexed shadow semantics.
-/

open Std.Sat
open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open CheckpointedRup.CompactIngress
open CheckpointedRup.CompactBoundary
open CheckpointedRup.SemanticBoundary

set_option maxRecDepth 100000

private def retainedPrefixCount : Nat := 168493
private def retainedSourceCenterCount : Nat := 317
private def sourceCenterClauseCount : Nat := 6642

private def retainedSourceCenterPayload : String :=
  include_str "data/g3-source-center-slice-ordinals.a85"

abbrev SourceCenterClauseIndex := Fin sourceCenterClauseCount

/-- Read one canonical positive LEB128 value from a byte array. -/
private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if sourceCenterClauseCount < candidate then
          none
        else if raw < 128 then
          if (0 < used ∧ payload = 0) ∨ candidate = 0 then
            none
          else
            some (candidate, position + 1)
        else
          readPositiveVarUIntAux fuel (used + 1) (multiplier * 128)
            candidate (position + 1) bytes
      else
        none

private def readPositiveVarUInt (bytes : ByteArray) (position : Nat) :
    Option (Nat × Nat) :=
  readPositiveVarUIntAux 10 0 1 0 position bytes

private def decodePositiveDeltasAux (bytes : ByteArray) :
    Nat → Nat → Nat → Array SourceCenterClauseIndex →
      Option (Array SourceCenterClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ sourceCenterClauseCount then
          let sourceIndex : SourceCenterClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedSourceCenterIndices :
    Option (Array SourceCenterClauseIndex) := do
  let bytes ← decodeAscii85 retainedSourceCenterPayload
  decodePositiveDeltasAux bytes retainedSourceCenterCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete source-center family. -/
def g3RetainedSourceCenterIndices : Array SourceCenterClauseIndex :=
  decodeRetainedSourceCenterIndices.getD #[]

/-- Source choices decoded to one fixed source-center atom, in generator
order. -/
private def sourceCenterChoices (sourceCenter : Fin 92) :
    List (SourceChoiceIndex (sourceCenterRow sourceCenter).source) :=
  (List.finRange
      (sourceChoiceCount (sourceCenterRow sourceCenter).source)).filter
    fun choice =>
      (sourceChoiceAt (sourceCenterRow sourceCenter).source choice).1 =
        (sourceCenterRow sourceCenter).center

/-- One source occurrence in the exact Tseitin family. -/
inductive SourceCenterOccurrence where
  | forward (sourceCenter : Fin 92)
      (choice : SourceChoiceIndex (sourceCenterRow sourceCenter).source)
  | reverse (sourceCenter : Fin 92)
deriving DecidableEq, Repr

/-- Exact generator order for the complete `6642`-clause family. -/
def encoderSourceCenterOccurrences : List SourceCenterOccurrence :=
  (List.finRange 92).flatMap fun sourceCenter =>
    (sourceCenterChoices sourceCenter).map
        (fun choice => .forward sourceCenter choice)
      ++ [.reverse sourceCenter]

set_option linter.style.nativeDecide false in
theorem encoderSourceCenterOccurrences_length :
    encoderSourceCenterOccurrences.length = sourceCenterClauseCount := by
  native_decide

def sourceCenterOccurrenceArray : Array SourceCenterOccurrence :=
  encoderSourceCenterOccurrences.toArray

def sourceCenterOccurrenceAt
    (index : SourceCenterClauseIndex) : SourceCenterOccurrence :=
  sourceCenterOccurrenceArray[index.val]'(by
    simpa [sourceCenterOccurrenceArray,
      encoderSourceCenterOccurrences_length] using index.isLt)

/-- The forward implication from a source choice to its source-center atom. -/
def sourceCenterForwardClause
    (sourceCenter : Fin 92)
    (choice : SourceChoiceIndex (sourceCenterRow sourceCenter).source) :
    List Int :=
  [-Int.ofNat
      (sourceChoiceVariable (sourceCenterRow sourceCenter).source choice),
    Int.ofNat (encodeG3Var (.sourceCenter sourceCenter))]

/-- The reverse implication from a source-center atom to one of its decoded
source choices. -/
def sourceCenterReverseClause (sourceCenter : Fin 92) : List Int :=
  -Int.ofNat (encodeG3Var (.sourceCenter sourceCenter)) ::
    (sourceCenterChoices sourceCenter).map fun choice =>
      Int.ofNat
        (sourceChoiceVariable (sourceCenterRow sourceCenter).source choice)

/-- Render one source-center occurrence in exact source order. -/
def renderSourceCenterOccurrence : SourceCenterOccurrence → List Int
  | .forward sourceCenter choice =>
      sourceCenterForwardClause sourceCenter choice
  | .reverse sourceCenter =>
      sourceCenterReverseClause sourceCenter

/-- Typed retained source-center occurrences in checkpoint order. -/
def g3SourceCenterSlice : Array SourceCenterOccurrence :=
  g3RetainedSourceCenterIndices.map sourceCenterOccurrenceAt

/-- Signed clauses represented by the retained source-center ledger. -/
def g3SourceCenterSliceClauses : List (List Int) :=
  g3SourceCenterSlice.toList.map renderSourceCenterOccurrence

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3SourceCenterSlice_size :
    g3SourceCenterSlice.size = retainedSourceCenterCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger renders the retained source-center segment of the
parsed G3 checkpoint-zero payload, preserving each clause up to the per-clause
permutation introduced by extracted-core production. -/
theorem g3SourceCenterSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3SourceCenterSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedSourceCenterCount) := by
  native_decide

private def sourceCenterOccurrenceAtValid
    (index : SourceCenterClauseIndex) : Prop :=
  match sourceCenterOccurrenceAt index with
  | .forward sourceCenter choice =>
      (sourceChoiceAt
          (sourceCenterRow sourceCenter).source choice).1 =
        (sourceCenterRow sourceCenter).center
  | .reverse _ => True

private instance (index : SourceCenterClauseIndex) :
    Decidable (sourceCenterOccurrenceAtValid index) := by
  unfold sourceCenterOccurrenceAtValid
  cases sourceCenterOccurrenceAt index <;> infer_instance

set_option maxHeartbeats 0 in
-- Exhaustively evaluates all 6642 source-center family indices.
/-- Every generated forward occurrence is assigned to the source-center row
whose atom occurs in its clause. -/
theorem sourceCenterOccurrenceAt_valid :
    ∀ index : SourceCenterClauseIndex,
      match sourceCenterOccurrenceAt index with
      | .forward sourceCenter choice =>
          (sourceChoiceAt
              (sourceCenterRow sourceCenter).source choice).1 =
            (sourceCenterRow sourceCenter).center
      | .reverse _ => True := by
  change ∀ index : SourceCenterClauseIndex,
    sourceCenterOccurrenceAtValid index
  native_decide

/-- Every decoded source-center row names a center in the source's encoder
domain. -/
private theorem sourceCenterRow_center_mem :
    ∀ sourceCenter : Fin 92,
      (sourceCenterRow sourceCenter).center ∈
        sourceChoiceCenters (sourceCenterRow sourceCenter).source := by
  native_decide

private theorem sourceChoiceVariable_upperBound
    (source : Label) (choice : SourceChoiceIndex source) :
    sourceChoiceVariable source choice < 41005 := by
  have hchoice := choice.isLt
  fin_cases source <;>
    simp [sourceChoiceVariable, sourceChoiceStart, sourceChoiceCount] at hchoice ⊢ <;>
    omega

/-- A false source-center atom immediately satisfies its reverse clause. -/
private theorem evalClauseD_negative_head
    (σ : Nat → Bool) {left : Nat} (hleft : σ left = false)
    (tail : List Int) :
    evalClauseD σ (-Int.ofNat left :: tail) = true := by
  simp [evalClauseD, evalLitD, hleft]

attribute [local instance] Classical.propDecidable

/-- Every occurrence in the complete source-center family is satisfied by the
total G3 valuation. -/
theorem CanonicalPacket.renderSourceCenterOccurrence_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : SourceCenterClauseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderSourceCenterOccurrence
        (sourceCenterOccurrenceAt index)) = true := by
  cases hoccurrence : sourceCenterOccurrenceAt index with
  | forward sourceCenter choice =>
      have hsameCenter :
          (sourceChoiceAt
              (sourceCenterRow sourceCenter).source choice).1 =
            (sourceCenterRow sourceCenter).center := by
        simpa [hoccurrence] using sourceCenterOccurrenceAt_valid index
      simp only [renderSourceCenterOccurrence, hoccurrence]
      apply evalClauseD_binary_implication _
        (encodeG3Var_pos (.sourceCenter sourceCenter))
      intro hchoiceValue
      have hsourceChoiceValue :
          P.fullSourceChoiceValuation shadow
              (sourceChoiceVariable
                (sourceCenterRow sourceCenter).source choice) = true := by
        rw [← P.fullRadiusValuation_eq_fullSourceChoice_of_lt
          shadow selected
          (sourceChoiceVariable_pos
            (sourceCenterRow sourceCenter).source choice)
          (sourceChoiceVariable_upperBound
            (sourceCenterRow sourceCenter).source choice)]
        exact hchoiceValue
      have hchoice :
          P.sourceChoiceHolds shadow
            (sourceCenterRow sourceCenter).source choice := by
        rw [P.fullSourceChoiceValuation_choice] at hsourceChoiceValue
        exact of_decide_eq_true hsourceChoiceValue
      rw [P.fullRadiusValuation_sourceCenter]
      exact decide_eq_true (by
        simpa [hsameCenter] using
          P.sourceChoiceHolds_sourceCenterHolds shadow
            (sourceCenterRow sourceCenter).source choice hchoice)
  | reverse sourceCenter =>
      simp only [renderSourceCenterOccurrence, hoccurrence]
      by_cases hsourceValue :
          P.fullRadiusValuation shadow selected
              (encodeG3Var (.sourceCenter sourceCenter)) = true
      · have hsourceCenter :
            P.sourceCenterHolds shadow (sourceCenterRow sourceCenter) := by
          rw [P.fullRadiusValuation_sourceCenter] at hsourceValue
          exact of_decide_eq_true hsourceValue
        have hcenterDomain :
            shadow.centerOf (sourceCenterRow sourceCenter).source ∈
              sourceChoiceCenters
                (sourceCenterRow sourceCenter).source := by
          rw [hsourceCenter]
          exact sourceCenterRow_center_mem sourceCenter
        obtain ⟨choice, hchoice⟩ :=
          P.exists_sourceChoiceHolds hP shadow
            (sourceCenterRow sourceCenter).source hcenterDomain
        have hsameCenter :
            (sourceChoiceAt
                (sourceCenterRow sourceCenter).source choice).1 =
              (sourceCenterRow sourceCenter).center :=
          hchoice.1.symm.trans hsourceCenter
        have hchoiceMem : choice ∈ sourceCenterChoices sourceCenter := by
          simp [sourceCenterChoices, hsameCenter]
        have hchoiceValue :
            P.fullRadiusValuation shadow selected
                (sourceChoiceVariable
                  (sourceCenterRow sourceCenter).source choice) = true := by
          rw [P.fullRadiusValuation_eq_fullSourceChoice_of_lt
            shadow selected
            (sourceChoiceVariable_pos
              (sourceCenterRow sourceCenter).source choice)
            (sourceChoiceVariable_upperBound
              (sourceCenterRow sourceCenter).source choice)]
          rw [P.fullSourceChoiceValuation_choice]
          exact decide_eq_true hchoice
        apply evalClauseD_of_positive_mem _
          (sourceChoiceVariable_pos
            (sourceCenterRow sourceCenter).source choice)
        · exact List.mem_cons_of_mem _ (List.mem_map.mpr
            ⟨choice, hchoiceMem, rfl⟩)
        · exact hchoiceValue
      · exact evalClauseD_negative_head _
          (Bool.eq_false_of_not_eq_true hsourceValue) _

/-- Every clause in the retained source-center slice is satisfied by the total
G3 valuation. -/
theorem CanonicalPacket.g3SourceCenterSlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3SourceCenterSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3SourceCenterSlice :=
    Array.mem_toList_iff.mp hoccurrence
  rw [g3SourceCenterSlice] at hoccurrenceArray
  obtain ⟨index, _hindex, rfl⟩ := Array.mem_map.mp hoccurrenceArray
  exact P.renderSourceCenterOccurrence_sat hP shadow selected index

/-- Signed-clause form of the authenticated retained source-center result. -/
theorem CanonicalPacket.g3Checkpoint0_sourceCenterSlice_signed_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈
        ((signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedSourceCenterCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact
    CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
      (P.fullRadiusValuation shadow selected)
      g3SourceCenterSlice_perm_checkpoint
      (P.g3SourceCenterSlice_sat hP shadow selected)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3SourceCenterSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderSourceCenterOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_sourceCenterSlice_signed_sat
