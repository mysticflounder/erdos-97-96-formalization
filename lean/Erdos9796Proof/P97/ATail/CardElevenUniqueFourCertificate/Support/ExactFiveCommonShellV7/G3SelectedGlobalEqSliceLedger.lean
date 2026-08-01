/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3GlobalTransitivitySliceLedger

/-!
# Authenticated retained selected-row global-equality slice of the exact-eleven G3 core

This checkpoint segment contains `8199` retained clauses from the
`11694`-clause family asserting the corresponding global edge equalities for
all six support pairs of every selected four-point candidate row.  This file
decodes their source-family ordinals, reconstructs the exact candidate row and
support pair, authenticates the rendered clauses against checkpoint zero, and
proves them from the selected-row semantics.
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

private def retainedPrefixCount : Nat := 185150
private def retainedSelectedGlobalEqCount : Nat := 8199
private def selectedGlobalEqClauseCount : Nat := 11694

private def retainedSelectedGlobalEqPayload : String :=
  include_str "data/g3-selected-global-eq-slice-ordinals.a85"

abbrev SelectedGlobalEqClauseIndex := Fin selectedGlobalEqClauseCount

/-- Read one canonical positive LEB128 value from a byte array. -/
private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if selectedGlobalEqClauseCount < candidate then
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
    Nat → Nat → Nat → Array SelectedGlobalEqClauseIndex →
      Option (Array SelectedGlobalEqClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ selectedGlobalEqClauseCount then
          let sourceIndex : SelectedGlobalEqClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedSelectedGlobalEqIndices :
    Option (Array SelectedGlobalEqClauseIndex) := do
  let bytes ← decodeAscii85 retainedSelectedGlobalEqPayload
  decodePositiveDeltasAux bytes retainedSelectedGlobalEqCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete selected-row global
equality family. -/
def g3RetainedSelectedGlobalEqIndices :
    Array SelectedGlobalEqClauseIndex :=
  decodeRetainedSelectedGlobalEqIndices.getD #[]

/-- One candidate row in the exact center/index order of the source encoder. -/
structure SelectedGlobalCandidateRow where
  center : Label
  candidateIndex : Nat
deriving DecidableEq, Repr

/-- The exact `1949` selected candidate rows used by the source encoder. -/
private def encoderSelectedGlobalCandidateRows :
    List SelectedGlobalCandidateRow :=
  (List.range 11).flatMap fun center =>
    (List.range (candCount center)).map fun candidateIndex =>
      ⟨toLabel center, candidateIndex⟩

set_option linter.style.nativeDecide false in
private theorem encoderSelectedGlobalCandidateRows_length :
    encoderSelectedGlobalCandidateRows.length = 1949 := by
  native_decide

/-- The ordered support labels of a selected candidate mask. -/
private def selectedGlobalCandidateSupport
    (row : SelectedGlobalCandidateRow) : List Nat :=
  (List.range 11).filter fun label =>
    ((candMasks row.center.val).getD row.candidateIndex 0).testBit label

/-- One source occurrence: a selected candidate row and one of its six
lexicographically ordered support pairs. -/
structure SelectedGlobalEqOccurrence where
  row : SelectedGlobalCandidateRow
  left : Label
  right : Label
deriving DecidableEq, Repr

/-- Exact generator order for the complete `11694`-clause family. -/
def encoderSelectedGlobalEqOccurrences :
    List SelectedGlobalEqOccurrence :=
  encoderSelectedGlobalCandidateRows.flatMap fun row =>
    (combos 2 (selectedGlobalCandidateSupport row)).map fun pair =>
      ⟨row, toLabel (pair.getD 0 0), toLabel (pair.getD 1 0)⟩

set_option linter.style.nativeDecide false in
private theorem encoderSelectedGlobalEqOccurrences_length :
    encoderSelectedGlobalEqOccurrences.length =
      selectedGlobalEqClauseCount := by
  native_decide

/-- Array form of the complete selected-row global-equality occurrence family. -/
def selectedGlobalEqOccurrenceArray :
    Array SelectedGlobalEqOccurrence :=
  encoderSelectedGlobalEqOccurrences.toArray

/-- The complete-family occurrence at a zero-based source ordinal. -/
def selectedGlobalEqOccurrenceAt
    (index : SelectedGlobalEqClauseIndex) : SelectedGlobalEqOccurrence :=
  selectedGlobalEqOccurrenceArray[index.val]'(by
    simpa [selectedGlobalEqOccurrenceArray,
      encoderSelectedGlobalEqOccurrences_length] using index.isLt)

/-- Recover the typed global-equality atom allocated to the two incident
edges.  The finite family audit below proves that every generated pair occurs
in the atom table in this order. -/
private def selectedGlobalEqualityIndex
    (center left right : Label) : Fin 1485 :=
  Fin.ofNat 1485
    (encoderGlobalEqRows.idxOf
      (canonicalEdge center left, canonicalEdge center right))

/-- Render one selected-row global-equality implication in exact source order. -/
def renderSelectedGlobalEqOccurrence
    (occurrence : SelectedGlobalEqOccurrence) : List Int :=
  selectedGlobalEqClause occurrence.row.center occurrence.row.candidateIndex
    (selectedGlobalEqualityIndex occurrence.row.center
      occurrence.left occurrence.right)

/-- Typed retained selected-row global-equality occurrences in checkpoint
order. -/
def g3SelectedGlobalEqSlice : Array SelectedGlobalEqOccurrence :=
  g3RetainedSelectedGlobalEqIndices.map selectedGlobalEqOccurrenceAt

/-- Signed clauses represented by the retained selected-row global-equality
ledger. -/
def g3SelectedGlobalEqSliceClauses : List (List Int) :=
  g3SelectedGlobalEqSlice.toList.map renderSelectedGlobalEqOccurrence

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3SelectedGlobalEqSlice_size :
    g3SelectedGlobalEqSlice.size = retainedSelectedGlobalEqCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger corresponds clausewise, up to literal permutation, to the retained selected-row global
equality segment of the parsed G3 checkpoint-zero payload. -/
theorem g3SelectedGlobalEqSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3SelectedGlobalEqSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedSelectedGlobalEqCount) := by
  native_decide

/-- Exhaustive finite audit connecting each generated occurrence to a valid
candidate index, its two support bits, and the canonical global-equality
atom. -/
theorem selectedGlobalEqOccurrenceAt_valid :
    ∀ index : SelectedGlobalEqClauseIndex,
      let occurrence := selectedGlobalEqOccurrenceAt index
      occurrence.row.candidateIndex <
          candCount occurrence.row.center.val ∧
        ((candMasks occurrence.row.center.val).getD
            occurrence.row.candidateIndex 0).testBit
              occurrence.left.val = true ∧
        ((candMasks occurrence.row.center.val).getD
            occurrence.row.candidateIndex 0).testBit
              occurrence.right.val = true ∧
        globalEqRow
            (selectedGlobalEqualityIndex occurrence.row.center
              occurrence.left occurrence.right) =
          (canonicalEdge occurrence.row.center occurrence.left,
            canonicalEdge occurrence.row.center occurrence.right) := by
  native_decide

/-- Every occurrence in the complete selected-row global-equality family is
satisfied by the total G3 valuation. -/
theorem CanonicalPacket.renderSelectedGlobalEqOccurrence_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : SelectedGlobalEqClauseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderSelectedGlobalEqOccurrence
        (selectedGlobalEqOccurrenceAt index)) = true := by
  obtain ⟨hindex, hleft, hright, hrow⟩ :=
    selectedGlobalEqOccurrenceAt_valid index
  exact P.selectedGlobalEqClause_sat hP shadow selected
    (selectedGlobalEqOccurrenceAt index).row.center
    (selectedGlobalEqOccurrenceAt index).row.candidateIndex hindex
    (selectedGlobalEqualityIndex
      (selectedGlobalEqOccurrenceAt index).row.center
      (selectedGlobalEqOccurrenceAt index).left
      (selectedGlobalEqOccurrenceAt index).right)
    (selectedGlobalEqOccurrenceAt index).left
    (selectedGlobalEqOccurrenceAt index).right hrow hleft hright

/-- Every clause in the retained selected-row global-equality slice is
satisfied by the total G3 valuation. -/
theorem CanonicalPacket.g3SelectedGlobalEqSlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3SelectedGlobalEqSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3SelectedGlobalEqSlice :=
    Array.mem_toList_iff.mp hoccurrence
  rw [g3SelectedGlobalEqSlice] at hoccurrenceArray
  obtain ⟨index, _hindex, rfl⟩ := Array.mem_map.mp hoccurrenceArray
  exact P.renderSelectedGlobalEqOccurrence_sat hP shadow selected index

/-- Signed-clause form of the authenticated selected-row global-equality
result. -/
theorem CanonicalPacket.g3Checkpoint0_selectedGlobalEqSlice_signed_sat
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
          retainedPrefixCount).take retainedSelectedGlobalEqCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
    (P.fullRadiusValuation shadow selected)
    g3SelectedGlobalEqSlice_perm_checkpoint
    (P.g3SelectedGlobalEqSlice_sat hP shadow selected)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3SelectedGlobalEqSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderSelectedGlobalEqOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_selectedGlobalEqSlice_signed_sat
