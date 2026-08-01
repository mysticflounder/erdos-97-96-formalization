/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3UsedCenterSliceLedger
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3BlockerSemantics

/-!
# Authenticated retained exact-blocker slice of the exact-eleven G3 core

The seventh checkpoint segment contains `5083` retained clauses from the
`46776`-clause family asserting that a used selected blocker row is its entire
positive-radius class.  This file decodes the family ordinals, reconstructs
each typed occurrence in source order, authenticates its rendering against
checkpoint zero, and discharges it using the uniform exact-blocker theorem.
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

private def retainedPrefixCount : Nat := 168831
private def retainedExactBlockerCount : Nat := 5083
private def exactBlockerClauseCount : Nat := 46776

private def retainedExactBlockerPayload : String :=
  include_str "data/g3-exact-blocker-slice-ordinals.a85"

abbrev ExactBlockerClauseIndex := Fin exactBlockerClauseCount

/-- Read one canonical positive LEB128 value from a byte array. -/
private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if exactBlockerClauseCount < candidate then
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
    Nat → Nat → Nat → Array ExactBlockerClauseIndex →
      Option (Array ExactBlockerClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ exactBlockerClauseCount then
          let familyIndex : ExactBlockerClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push familyIndex)
        else
          none
      else
        none

private def decodeRetainedExactBlockerIndices :
    Option (Array ExactBlockerClauseIndex) := do
  let bytes ← decodeAscii85 retainedExactBlockerPayload
  decodePositiveDeltasAux bytes retainedExactBlockerCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete exact-blocker family. -/
def g3RetainedExactBlockerIndices : Array ExactBlockerClauseIndex :=
  decodeRetainedExactBlockerIndices.getD #[]

/-- One selected candidate row in the exact source-encoder order. -/
structure ExactBlockerCandidateRow where
  center : Label
  candidateIndex : Nat
deriving DecidableEq, Repr

private def encoderExactBlockerCandidateRows :
    List ExactBlockerCandidateRow :=
  (List.range 11).flatMap fun center =>
    (List.range (candCount center)).map fun candidateIndex =>
      ⟨toLabel center, candidateIndex⟩

set_option linter.style.nativeDecide false in
private theorem encoderExactBlockerCandidateRows_length :
    encoderExactBlockerCandidateRows.length = 1949 := by
  native_decide

/-- The four selected support labels, in increasing encoder order. -/
private def exactBlockerCandidateSupport
    (row : ExactBlockerCandidateRow) : List Label :=
  ((List.range 11).filter fun label =>
      ((candMasks row.center.val).getD row.candidateIndex 0).testBit label).map
    toLabel

/-- The six incident labels outside the candidate support, in increasing
encoder order. -/
private def exactBlockerCandidateOutside
    (row : ExactBlockerCandidateRow) : List Label :=
  ((List.range 11).filter fun label =>
      label != row.center.val &&
        !((candMasks row.center.val).getD
          row.candidateIndex 0).testBit label).map toLabel

/-- One exact-blocker clause occurrence. -/
structure ExactBlockerOccurrence where
  row : ExactBlockerCandidateRow
  inside : Label
  outside : Label
deriving DecidableEq, Repr

/-- Exact generator order for the complete `46776`-clause family. -/
def encoderExactBlockerOccurrences :
    List ExactBlockerOccurrence :=
  encoderExactBlockerCandidateRows.flatMap fun row =>
    (exactBlockerCandidateSupport row).flatMap fun inside =>
      (exactBlockerCandidateOutside row).map fun outside =>
        ⟨row, inside, outside⟩

set_option linter.style.nativeDecide false in
theorem encoderExactBlockerOccurrences_length :
    encoderExactBlockerOccurrences.length = exactBlockerClauseCount := by
  native_decide

def exactBlockerOccurrenceArray : Array ExactBlockerOccurrence :=
  encoderExactBlockerOccurrences.toArray

def exactBlockerOccurrenceAt
    (index : ExactBlockerClauseIndex) : ExactBlockerOccurrence :=
  exactBlockerOccurrenceArray[index.val]'(by
    simpa [exactBlockerOccurrenceArray,
      encoderExactBlockerOccurrences_length] using index.isLt)

/-- Canonical row for the unordered local-equality atom used by the source
encoder. -/
private def canonicalExactBlockerLocalEqRow
    (center left right : Label) : LocalEqRow :=
  if left.val < right.val then
    ⟨center, left, right⟩
  else
    ⟨center, right, left⟩

private def exactBlockerLocalEqualityIndex
    (center left right : Label) : Fin 495 :=
  Fin.ofNat 495
    (encoderLocalEqRows.idxOf
      (canonicalExactBlockerLocalEqRow center left right))

/-- Render one exact-blocker occurrence in exact source order. -/
def renderExactBlockerOccurrence
    (occurrence : ExactBlockerOccurrence) : List Int :=
  exactBlockerClause occurrence.row.center occurrence.row.candidateIndex
    (exactBlockerLocalEqualityIndex occurrence.row.center
      occurrence.inside occurrence.outside)

/-- Typed retained exact-blocker occurrences in checkpoint order. -/
def g3ExactBlockerSlice : Array ExactBlockerOccurrence :=
  g3RetainedExactBlockerIndices.map exactBlockerOccurrenceAt

/-- Signed clauses represented by the retained exact-blocker ledger. -/
def g3ExactBlockerSliceClauses : List (List Int) :=
  g3ExactBlockerSlice.toList.map renderExactBlockerOccurrence

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3RetainedExactBlockerIndices_size :
    g3RetainedExactBlockerIndices.size = retainedExactBlockerCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3ExactBlockerSlice_size :
    g3ExactBlockerSlice.size = retainedExactBlockerCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger corresponds clausewise, up to literal permutation, to the retained exact-blocker segment
of the parsed G3 checkpoint-zero payload. -/
theorem g3ExactBlockerSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3ExactBlockerSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedExactBlockerCount) := by
  native_decide

/-- Exhaustive finite audit connecting each occurrence to its candidate mask
and canonical local-equality atom. -/
theorem exactBlockerOccurrenceAt_valid :
    ∀ index : ExactBlockerClauseIndex,
      let occurrence := exactBlockerOccurrenceAt index
      occurrence.row.candidateIndex <
          candCount occurrence.row.center.val ∧
        ((candMasks occurrence.row.center.val).getD
          occurrence.row.candidateIndex 0).testBit
            occurrence.inside.val = true ∧
        ((candMasks occurrence.row.center.val).getD
          occurrence.row.candidateIndex 0).testBit
            occurrence.outside.val = false ∧
        (localEqRow
              (exactBlockerLocalEqualityIndex occurrence.row.center
                occurrence.inside occurrence.outside) =
            ⟨occurrence.row.center, occurrence.inside, occurrence.outside⟩ ∨
          localEqRow
              (exactBlockerLocalEqualityIndex occurrence.row.center
                occurrence.inside occurrence.outside) =
            ⟨occurrence.row.center, occurrence.outside, occurrence.inside⟩) := by
  native_decide

/-- Every occurrence in the complete exact-blocker family is satisfied by the
total G3 valuation. -/
theorem CanonicalPacket.renderExactBlockerOccurrence_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : ExactBlockerClauseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderExactBlockerOccurrence
        (exactBlockerOccurrenceAt index)) = true := by
  obtain ⟨hindex, hinside, houtside, hrow⟩ :=
    exactBlockerOccurrenceAt_valid index
  exact P.exactBlockerClause_sat hP shadow selected
    (exactBlockerOccurrenceAt index).row.center
    (exactBlockerOccurrenceAt index).inside
    (exactBlockerOccurrenceAt index).outside
    (exactBlockerOccurrenceAt index).row.candidateIndex
    hindex
    (exactBlockerLocalEqualityIndex
      (exactBlockerOccurrenceAt index).row.center
      (exactBlockerOccurrenceAt index).inside
      (exactBlockerOccurrenceAt index).outside)
    hrow hinside houtside

/-- Every clause in the retained exact-blocker slice is satisfied by the
total G3 valuation. -/
theorem CanonicalPacket.g3ExactBlockerSlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3ExactBlockerSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3ExactBlockerSlice :=
    Array.mem_toList_iff.mp hoccurrence
  rw [g3ExactBlockerSlice] at hoccurrenceArray
  obtain ⟨index, _hindex, rfl⟩ := Array.mem_map.mp hoccurrenceArray
  exact P.renderExactBlockerOccurrence_sat hP shadow selected index

/-- Signed-clause form of the authenticated exact-blocker result. -/
theorem CanonicalPacket.g3Checkpoint0_exactBlockerSlice_signed_sat
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
          retainedPrefixCount).take retainedExactBlockerCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
    (P.fullRadiusValuation shadow selected)
    g3ExactBlockerSlice_perm_checkpoint
    (P.g3ExactBlockerSlice_sat hP shadow selected)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3ExactBlockerSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderExactBlockerOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_exactBlockerSlice_signed_sat
