/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3LocalTransitivitySliceLedger

/-!
# Authenticated retained selected-row equality slice of the exact-eleven G3 core

The fifth checkpoint segment contains `8619` retained clauses from the
`11694`-clause family asserting all six internal equalities of every selected
four-point candidate row.  This file decodes their source-family ordinals,
reconstructs the exact candidate row and support pair, authenticates the
rendered clauses against checkpoint zero, and proves them from the selected
row semantics.
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

private def retainedPrefixCount : Nat := 159874
private def retainedSelectedLocalEqCount : Nat := 8619
private def selectedLocalEqClauseCount : Nat := 11694

private def retainedSelectedLocalEqPayload : String :=
  include_str "data/g3-selected-local-eq-slice-ordinals.a85"

abbrev SelectedLocalEqClauseIndex := Fin selectedLocalEqClauseCount

/-- Read one canonical positive LEB128 value from a byte array. -/
private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if selectedLocalEqClauseCount < candidate then
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
    Nat → Nat → Nat → Array SelectedLocalEqClauseIndex →
      Option (Array SelectedLocalEqClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ selectedLocalEqClauseCount then
          let sourceIndex : SelectedLocalEqClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedSelectedLocalEqIndices :
    Option (Array SelectedLocalEqClauseIndex) := do
  let bytes ← decodeAscii85 retainedSelectedLocalEqPayload
  decodePositiveDeltasAux bytes retainedSelectedLocalEqCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete selected-row local
equality family. -/
def g3RetainedSelectedLocalEqIndices :
    Array SelectedLocalEqClauseIndex :=
  decodeRetainedSelectedLocalEqIndices.getD #[]

/-- One candidate row in the exact center/index order of the source encoder. -/
structure SelectedCandidateRow where
  center : Label
  candidateIndex : Nat
deriving DecidableEq, Repr

/-- The exact `1949` selected candidate rows used by the source encoder. -/
private def encoderSelectedCandidateRows : List SelectedCandidateRow :=
  (List.range 11).flatMap fun center =>
    (List.range (candCount center)).map fun candidateIndex =>
      ⟨toLabel center, candidateIndex⟩

set_option linter.style.nativeDecide false in
private theorem encoderSelectedCandidateRows_length :
    encoderSelectedCandidateRows.length = 1949 := by
  native_decide

/-- The ordered support labels of a selected candidate mask. -/
private def selectedCandidateSupport (row : SelectedCandidateRow) : List Nat :=
  (List.range 11).filter fun label =>
    ((candMasks row.center.val).getD row.candidateIndex 0).testBit label

/-- One source occurrence: a selected candidate row and one of its six
lexicographically ordered support pairs. -/
structure SelectedLocalEqOccurrence where
  row : SelectedCandidateRow
  left : Label
  right : Label
deriving DecidableEq, Repr

/-- Exact generator order for the complete `11694`-clause family. -/
def encoderSelectedLocalEqOccurrences :
    List SelectedLocalEqOccurrence :=
  encoderSelectedCandidateRows.flatMap fun row =>
    (combos 2 (selectedCandidateSupport row)).map fun pair =>
      ⟨row, toLabel (pair.getD 0 0), toLabel (pair.getD 1 0)⟩

set_option linter.style.nativeDecide false in
theorem encoderSelectedLocalEqOccurrences_length :
    encoderSelectedLocalEqOccurrences.length =
      selectedLocalEqClauseCount := by
  native_decide

def selectedLocalEqOccurrenceArray :
    Array SelectedLocalEqOccurrence :=
  encoderSelectedLocalEqOccurrences.toArray

def selectedLocalEqOccurrenceAt
    (index : SelectedLocalEqClauseIndex) : SelectedLocalEqOccurrence :=
  selectedLocalEqOccurrenceArray[index.val]'(by
    simpa [selectedLocalEqOccurrenceArray,
      encoderSelectedLocalEqOccurrences_length] using index.isLt)

/-- Recover the typed local-equality atom allocated to a center and support
pair.  The finite family audit below proves that every generated pair occurs
in the atom table. -/
private def selectedLocalEqualityIndex
    (center left right : Label) : Fin 495 :=
  Fin.ofNat 495
    (encoderLocalEqRows.idxOf ⟨center, left, right⟩)

/-- Render one selected-row implication in exact source order. -/
def renderSelectedLocalEqOccurrence
    (occurrence : SelectedLocalEqOccurrence) : List Int :=
  selectedLocalEqClause occurrence.row.center occurrence.row.candidateIndex
    (selectedLocalEqualityIndex occurrence.row.center
      occurrence.left occurrence.right)

/-- Typed retained selected-row equality occurrences in checkpoint order. -/
def g3SelectedLocalEqSlice : Array SelectedLocalEqOccurrence :=
  g3RetainedSelectedLocalEqIndices.map selectedLocalEqOccurrenceAt

/-- Signed clauses represented by the retained selected-row equality ledger. -/
def g3SelectedLocalEqSliceClauses : List (List Int) :=
  g3SelectedLocalEqSlice.toList.map renderSelectedLocalEqOccurrence

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3SelectedLocalEqSlice_size :
    g3SelectedLocalEqSlice.size = retainedSelectedLocalEqCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger renders the retained selected-row equality segment
of the parsed G3 checkpoint-zero payload, preserving each clause up to the
per-clause permutation introduced by extracted-core production. -/
theorem g3SelectedLocalEqSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3SelectedLocalEqSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedSelectedLocalEqCount) := by
  native_decide

/-- Exhaustive finite audit connecting each generated occurrence to a valid
candidate index, its two support bits, and the canonical local-equality atom. -/
theorem selectedLocalEqOccurrenceAt_valid :
    ∀ index : SelectedLocalEqClauseIndex,
      let occurrence := selectedLocalEqOccurrenceAt index
      occurrence.row.candidateIndex <
          candCount occurrence.row.center.val ∧
        ((candMasks occurrence.row.center.val).getD
            occurrence.row.candidateIndex 0).testBit
              occurrence.left.val = true ∧
        ((candMasks occurrence.row.center.val).getD
            occurrence.row.candidateIndex 0).testBit
              occurrence.right.val = true ∧
        localEqRow
            (selectedLocalEqualityIndex occurrence.row.center
              occurrence.left occurrence.right) =
          ⟨occurrence.row.center, occurrence.left, occurrence.right⟩ := by
  native_decide

/-- Every occurrence in the complete selected-row equality family is
satisfied by the total G3 valuation. -/
theorem CanonicalPacket.renderSelectedLocalEqOccurrence_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : SelectedLocalEqClauseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderSelectedLocalEqOccurrence
        (selectedLocalEqOccurrenceAt index)) = true := by
  obtain ⟨hindex, hleft, hright, hrow⟩ :=
    selectedLocalEqOccurrenceAt_valid index
  exact P.selectedLocalEqClause_sat hP shadow selected
    (selectedLocalEqOccurrenceAt index).row.center
    (selectedLocalEqOccurrenceAt index).row.candidateIndex hindex
    (selectedLocalEqualityIndex
      (selectedLocalEqOccurrenceAt index).row.center
      (selectedLocalEqOccurrenceAt index).left
      (selectedLocalEqOccurrenceAt index).right)
    (selectedLocalEqOccurrenceAt index).left
    (selectedLocalEqOccurrenceAt index).right hrow hleft hright

/-- Every clause in the retained selected-row equality slice is satisfied by
the total G3 valuation. -/
theorem CanonicalPacket.g3SelectedLocalEqSlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3SelectedLocalEqSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3SelectedLocalEqSlice :=
    Array.mem_toList_iff.mp hoccurrence
  rw [g3SelectedLocalEqSlice] at hoccurrenceArray
  obtain ⟨index, _hindex, rfl⟩ := Array.mem_map.mp hoccurrenceArray
  exact P.renderSelectedLocalEqOccurrence_sat hP shadow selected index

/-- Signed-clause form of the authenticated selected-row equality result. -/
theorem CanonicalPacket.g3Checkpoint0_selectedLocalEqSlice_signed_sat
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
          retainedPrefixCount).take retainedSelectedLocalEqCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact
    CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
      (P.fullRadiusValuation shadow selected)
      g3SelectedLocalEqSlice_perm_checkpoint
      (P.g3SelectedLocalEqSlice_sat hP shadow selected)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3SelectedLocalEqSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderSelectedLocalEqOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_selectedLocalEqSlice_signed_sat
