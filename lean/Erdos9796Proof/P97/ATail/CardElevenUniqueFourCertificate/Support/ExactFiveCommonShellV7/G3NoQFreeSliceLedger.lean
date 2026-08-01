/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3ExactBlockerSliceLedger

/-!
# Authenticated retained no-Q-free slice of the exact-eleven G3 core

The eighth checkpoint segment contains `426` retained clauses from the
`11592`-clause family ruling out a four-class after deletion of the source
represented by a selected source-center map.  This file decodes the family
ordinals, reconstructs each typed source-center/four-set occurrence in source
order, authenticates its rendering against checkpoint zero, and discharges it
using the uniform no-Q-free theorem.
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

private def retainedPrefixCount : Nat := 173914
private def retainedNoQFreeCount : Nat := 426
private def noQFreeClauseCount : Nat := 11592

private def retainedNoQFreePayload : String :=
  include_str "data/g3-no-qfree-slice-ordinals.a85"

abbrev NoQFreeClauseIndex := Fin noQFreeClauseCount

/-- Read one canonical positive LEB128 value from a byte array. -/
private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if noQFreeClauseCount < candidate then
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
    Nat → Nat → Nat → Array NoQFreeClauseIndex →
      Option (Array NoQFreeClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ noQFreeClauseCount then
          let familyIndex : NoQFreeClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push familyIndex)
        else
          none
      else
        none

private def decodeRetainedNoQFreeIndices :
    Option (Array NoQFreeClauseIndex) := do
  let bytes ← decodeAscii85 retainedNoQFreePayload
  decodePositiveDeltasAux bytes retainedNoQFreeCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete no-Q-free family. -/
def g3RetainedNoQFreeIndices : Array NoQFreeClauseIndex :=
  decodeRetainedNoQFreeIndices.getD #[]

/-- One source-center map and four-set in exact source-encoder order. -/
structure NoQFreeOccurrence where
  sourceCenter : Fin 92
  anchor : Label
  point₁ : Label
  point₂ : Label
  point₃ : Label
deriving DecidableEq, Repr

/-- Exact generator order: source-center rows, then increasing four-subsets
of the nine labels other than the source and its selected center. -/
def encoderNoQFreeOccurrences : List NoQFreeOccurrence :=
  (List.finRange 92).flatMap fun sourceCenter =>
    let row := sourceCenterRow sourceCenter
    let available :=
      (List.range 11).filter fun label =>
        label != row.center.val && label != row.source.val
    (combos 4 available).map fun support =>
      { sourceCenter := sourceCenter
        anchor := toLabel (support.getD 0 0)
        point₁ := toLabel (support.getD 1 0)
        point₂ := toLabel (support.getD 2 0)
        point₃ := toLabel (support.getD 3 0) }

set_option linter.style.nativeDecide false in
theorem encoderNoQFreeOccurrences_length :
    encoderNoQFreeOccurrences.length = noQFreeClauseCount := by
  native_decide

def noQFreeOccurrenceArray : Array NoQFreeOccurrence :=
  encoderNoQFreeOccurrences.toArray

def noQFreeOccurrenceAt
    (index : NoQFreeClauseIndex) : NoQFreeOccurrence :=
  noQFreeOccurrenceArray[index.val]'(by
    simpa [noQFreeOccurrenceArray,
      encoderNoQFreeOccurrences_length] using index.isLt)

private def noQFreeLocalFourIndex
    (occurrence : NoQFreeOccurrence) : Fin 2310 :=
  Fin.ofNat 2310
    (encoderLocalFourRows.idxOf
      ⟨(sourceCenterRow occurrence.sourceCenter).center,
        [occurrence.anchor, occurrence.point₁, occurrence.point₂,
          occurrence.point₃]⟩)

private def noQFreeLocalEqualityIndex
    (occurrence : NoQFreeOccurrence) (point : Label) : Fin 495 :=
  Fin.ofNat 495
    (encoderLocalEqRows.idxOf
      ⟨(sourceCenterRow occurrence.sourceCenter).center,
        occurrence.anchor, point⟩)

/-- Render one no-Q-free occurrence in exact source order. -/
def renderNoQFreeOccurrence
    (occurrence : NoQFreeOccurrence) : List Int :=
  sourceCenterNoQFreeClause occurrence.sourceCenter
    (noQFreeLocalEqualityIndex occurrence occurrence.point₁)
    (noQFreeLocalEqualityIndex occurrence occurrence.point₂)
    (noQFreeLocalEqualityIndex occurrence occurrence.point₃)

/-- Typed retained no-Q-free occurrences in checkpoint order. -/
def g3NoQFreeSlice : Array NoQFreeOccurrence :=
  g3RetainedNoQFreeIndices.map noQFreeOccurrenceAt

/-- Signed clauses represented by the retained no-Q-free ledger. -/
def g3NoQFreeSliceClauses : List (List Int) :=
  g3NoQFreeSlice.toList.map renderNoQFreeOccurrence

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3RetainedNoQFreeIndices_size :
    g3RetainedNoQFreeIndices.size = retainedNoQFreeCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3NoQFreeSlice_size :
    g3NoQFreeSlice.size = retainedNoQFreeCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger corresponds clausewise, up to literal permutation, to the retained no-Q-free segment of
the parsed G3 checkpoint-zero payload. -/
theorem g3NoQFreeSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3NoQFreeSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedNoQFreeCount) := by
  native_decide

/-- Exhaustive finite audit connecting each occurrence to its source-center
row, four-class row, three local-equality atoms, and deleted source. -/
theorem noQFreeOccurrenceAt_valid :
    ∀ index : NoQFreeClauseIndex,
      let occurrence := noQFreeOccurrenceAt index
      localFourRow (noQFreeLocalFourIndex occurrence) =
          ⟨(sourceCenterRow occurrence.sourceCenter).center,
            [occurrence.anchor, occurrence.point₁, occurrence.point₂,
              occurrence.point₃]⟩ ∧
        localEqRow
              (noQFreeLocalEqualityIndex occurrence occurrence.point₁) =
            ⟨(sourceCenterRow occurrence.sourceCenter).center,
              occurrence.anchor, occurrence.point₁⟩ ∧
        localEqRow
              (noQFreeLocalEqualityIndex occurrence occurrence.point₂) =
            ⟨(sourceCenterRow occurrence.sourceCenter).center,
              occurrence.anchor, occurrence.point₂⟩ ∧
        localEqRow
              (noQFreeLocalEqualityIndex occurrence occurrence.point₃) =
            ⟨(sourceCenterRow occurrence.sourceCenter).center,
              occurrence.anchor, occurrence.point₃⟩ ∧
        (sourceCenterRow occurrence.sourceCenter).source ∉
          [occurrence.anchor, occurrence.point₁, occurrence.point₂,
            occurrence.point₃] := by
  native_decide

/-- Every occurrence in the complete no-Q-free family is satisfied by the
total G3 valuation. -/
theorem CanonicalPacket.renderNoQFreeOccurrence_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : NoQFreeClauseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderNoQFreeOccurrence (noQFreeOccurrenceAt index)) = true := by
  obtain ⟨hfour, hfirst, hsecond, hthird, hdeleted⟩ :=
    noQFreeOccurrenceAt_valid index
  exact P.sourceCenterNoQFreeClause_sat shadow selected
    (noQFreeOccurrenceAt index).sourceCenter
    (noQFreeLocalFourIndex (noQFreeOccurrenceAt index))
    (noQFreeLocalEqualityIndex (noQFreeOccurrenceAt index)
      (noQFreeOccurrenceAt index).point₁)
    (noQFreeLocalEqualityIndex (noQFreeOccurrenceAt index)
      (noQFreeOccurrenceAt index).point₂)
    (noQFreeLocalEqualityIndex (noQFreeOccurrenceAt index)
      (noQFreeOccurrenceAt index).point₃)
    (sourceCenterRow (noQFreeOccurrenceAt index).sourceCenter).source
    (sourceCenterRow (noQFreeOccurrenceAt index).sourceCenter).center
    (noQFreeOccurrenceAt index).anchor
    (noQFreeOccurrenceAt index).point₁
    (noQFreeOccurrenceAt index).point₂
    (noQFreeOccurrenceAt index).point₃
    rfl hfour hfirst hsecond hthird hdeleted

/-- Every clause in the retained no-Q-free slice is satisfied by the total G3
valuation. -/
theorem CanonicalPacket.g3NoQFreeSlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3NoQFreeSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3NoQFreeSlice :=
    Array.mem_toList_iff.mp hoccurrence
  rw [g3NoQFreeSlice] at hoccurrenceArray
  obtain ⟨index, _hindex, rfl⟩ := Array.mem_map.mp hoccurrenceArray
  exact P.renderNoQFreeOccurrence_sat shadow selected index

/-- Signed-clause form of the authenticated no-Q-free result. -/
theorem CanonicalPacket.g3Checkpoint0_noQFreeSlice_signed_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈
        ((signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedNoQFreeCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
    (P.fullRadiusValuation shadow selected)
    g3NoQFreeSlice_perm_checkpoint
    (P.g3NoQFreeSlice_sat shadow selected)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3NoQFreeSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderNoQFreeOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_noQFreeSlice_signed_sat
