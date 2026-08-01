/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3V6QDeletedPairSliceLedger

/-!
# Authenticated V6 U5 nontriple slice of the exact-eleven G3 core

This checkpoint segment retains `275` clauses from the `117900`-clause V6
U5 nontriple-equilateral incompatibility family.  The source order is the
manifest source-choice order, followed by the three other labels of the
selected four-row and the six labels outside that row and its center.  Each
clause excludes one source choice together with the two canonically sorted
q-deleted-pair atoms used by the existing U5 incidence theorem.
-/

open Std.Sat
open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open Census554.CoverIndexBridge
open CheckpointedRup.CompactIngress
open CheckpointedRup.CompactBoundary
open CheckpointedRup.SemanticBoundary

attribute [local instance] Classical.propDecidable

set_option maxRecDepth 100000

private def retainedPrefixCount : Nat := 220013
private def retainedV6U5NontripleCount : Nat := 275
private def v6U5NontripleClauseCount : Nat := 117900

private def retainedV6U5NontriplePayload : String :=
  include_str "data/g3-v6-u5-nontriple-slice-ordinals.a85"

abbrev V6U5NontripleClauseIndex := Fin v6U5NontripleClauseCount

private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if v6U5NontripleClauseCount < candidate then
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
    Nat → Nat → Nat → Array V6U5NontripleClauseIndex →
      Option (Array V6U5NontripleClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ v6U5NontripleClauseCount then
          let sourceIndex : V6U5NontripleClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedV6U5NontripleIndices :
    Option (Array V6U5NontripleClauseIndex) := do
  let bytes ← decodeAscii85 retainedV6U5NontriplePayload
  decodePositiveDeltasAux bytes retainedV6U5NontripleCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete V6 U5 nontriple
family. -/
def g3RetainedV6U5NontripleIndices :
    Array V6U5NontripleClauseIndex :=
  decodeRetainedV6U5NontripleIndices.getD #[]

/-- One exact source occurrence in the V6 U5 nontriple family. -/
structure V6U5NontripleOccurrence where
  source : Label
  choice : SourceChoiceIndex source
  center : Label
  candidateIndex : Nat
  t : Label
  x : Label
deriving DecidableEq, Repr

private def sourceChoiceSupport
    (source : Label) (choice : SourceChoiceIndex source) : List Label :=
  let decoded := sourceChoiceAt source choice
  (List.finRange 11).filter fun label =>
    ((candMasks decoded.1.val).getD decoded.2 0).testBit label.val

private def sourceChoiceInside
    (source : Label) (choice : SourceChoiceIndex source) : List Label :=
  (sourceChoiceSupport source choice).filter fun label => label != source

private def sourceChoiceOutside
    (source : Label) (choice : SourceChoiceIndex source) : List Label :=
  let decoded := sourceChoiceAt source choice
  (List.finRange 11).filter fun label =>
    !((candMasks decoded.1.val).getD decoded.2 0).testBit label.val &&
      label != decoded.1

def encoderSourceChoiceOccurrences :
    List SourceChoiceOccurrence :=
  (List.finRange 11).flatMap fun source =>
    (List.finRange (sourceChoiceCount source)).map fun choice =>
      ⟨source, choice⟩

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem encoderSourceChoiceOccurrences_length :
    encoderSourceChoiceOccurrences.length = 6550 := by
  native_decide

/-- Exact generator order: each source choice, the other three labels in its
candidate row, then the six labels outside that row and its center. -/
def encoderV6U5NontripleOccurrences :
    List V6U5NontripleOccurrence :=
  encoderSourceChoiceOccurrences.flatMap fun sourceChoice =>
    (sourceChoiceInside sourceChoice.source sourceChoice.choice).flatMap fun t =>
      (sourceChoiceOutside sourceChoice.source sourceChoice.choice).map fun x =>
        let decoded :=
          sourceChoiceAt sourceChoice.source sourceChoice.choice
        ⟨sourceChoice.source, sourceChoice.choice, decoded.1, decoded.2, t, x⟩

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem encoderV6U5NontripleOccurrences_length :
    encoderV6U5NontripleOccurrences.length =
      v6U5NontripleClauseCount := by
  native_decide

def v6U5NontripleOccurrenceArray :
    Array V6U5NontripleOccurrence :=
  encoderV6U5NontripleOccurrences.toArray

def v6U5NontripleOccurrenceAt
    (index : V6U5NontripleClauseIndex) : V6U5NontripleOccurrence :=
  v6U5NontripleOccurrenceArray[index.val]'(by
    simpa [v6U5NontripleOccurrenceArray,
      encoderV6U5NontripleOccurrences_length] using index.isLt)

private def canonicalQDeletedPairRow
    (deleted center first second : Label) : QDeletedPairRow :=
  if first ≤ second then ⟨deleted, center, first, second⟩
  else ⟨deleted, center, second, first⟩

private def canonicalQDeletedPairIndex
    (deleted center first second : Label) : Fin 3960 :=
  let centerOrdinal :=
    ((List.range 11).filter fun candidate => candidate != deleted.val).idxOf
      center.val
  let available :=
    (List.range 11).filter fun label =>
      label != deleted.val && label != center.val
  let pair :=
    if first ≤ second then [first.val, second.val]
    else [second.val, first.val]
  let pairOrdinal := (combos 2 available).idxOf pair
  Fin.ofNat 3960
    (deleted.val * 360 + centerOrdinal * 36 + pairOrdinal)

/-- Render the exact compact source clause for one V6 U5 nontriple
occurrence. -/
def renderV6U5NontripleOccurrence
    (occurrence : V6U5NontripleOccurrence) : List Int :=
  [-Int.ofNat
      (sourceChoiceVariable occurrence.source occurrence.choice),
    -Int.ofNat
      (encodeG3Var (.qDeletedPair
        (canonicalQDeletedPairIndex occurrence.source occurrence.t
          occurrence.center occurrence.x))),
    -Int.ofNat
      (encodeG3Var (.qDeletedPair
        (canonicalQDeletedPairIndex occurrence.source occurrence.x
          occurrence.center occurrence.t)))]

/-- Typed retained V6 U5 nontriple occurrences in checkpoint order. -/
def g3V6U5NontripleSlice : Array V6U5NontripleOccurrence :=
  g3RetainedV6U5NontripleIndices.map v6U5NontripleOccurrenceAt

/-- Signed clauses represented by the retained V6 U5 nontriple ledger. -/
def g3V6U5NontripleSliceClauses : List (List Int) :=
  g3V6U5NontripleSlice.toList.map renderV6U5NontripleOccurrence

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3V6U5NontripleSlice_size :
    g3V6U5NontripleSlice.size = retainedV6U5NontripleCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger corresponds clausewise, up to literal permutation, to the retained V6 U5 nontriple
segment of the parsed G3 checkpoint-zero payload. -/
theorem g3V6U5NontripleSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3V6U5NontripleSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedV6U5NontripleCount) := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- Exhaustive source-order and atom-identity audit for the complete family. -/
theorem v6U5NontripleOccurrenceAt_valid :
    ∀ index : V6U5NontripleClauseIndex,
      let occurrence := v6U5NontripleOccurrenceAt index
      sourceChoiceAt occurrence.source occurrence.choice =
          (occurrence.center, occurrence.candidateIndex) ∧
        occurrence.candidateIndex < candCount occurrence.center.val ∧
        ((candMasks occurrence.center.val).getD
            occurrence.candidateIndex 0).testBit
              occurrence.source.val = true ∧
        ((candMasks occurrence.center.val).getD
            occurrence.candidateIndex 0).testBit occurrence.t.val = true ∧
        ((candMasks occurrence.center.val).getD
            occurrence.candidateIndex 0).testBit occurrence.x.val = false ∧
        qDeletedPairRow
            (canonicalQDeletedPairIndex occurrence.source occurrence.t
              occurrence.center occurrence.x) =
          canonicalQDeletedPairRow occurrence.source occurrence.t
            occurrence.center occurrence.x ∧
        qDeletedPairRow
            (canonicalQDeletedPairIndex occurrence.source occurrence.x
              occurrence.center occurrence.t) =
          canonicalQDeletedPairRow occurrence.source occurrence.x
            occurrence.center occurrence.t := by
  native_decide

private theorem sourceChoiceVariable_lt
    (source : Label) (choice : SourceChoiceIndex source) :
    sourceChoiceVariable source choice < 41005 := by
  fin_cases source <;>
    simp [sourceChoiceVariable, sourceChoiceStart, sourceChoiceCount] at choice ⊢ <;>
    omega

private theorem CanonicalPacket.qDeletedPairHolds_canonical_iff
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (q c a b : Label) :
    P.qDeletedPairHolds (canonicalQDeletedPairRow q c a b) ↔
      P.qDeletedPairHolds ⟨q, c, a, b⟩ := by
  by_cases h : a ≤ b
  · simp [canonicalQDeletedPairRow, h]
  · simpa [canonicalQDeletedPairRow, h] using
      P.qDeletedPairHolds_swap q c b a

/-- Every occurrence in the complete V6 U5 nontriple family is satisfied by
the total G3 valuation. -/
theorem CanonicalPacket.renderV6U5NontripleOccurrence_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : V6U5NontripleClauseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderV6U5NontripleOccurrence
        (v6U5NontripleOccurrenceAt index)) = true := by
  let occurrence := v6U5NontripleOccurrenceAt index
  obtain ⟨hdecode, hindex, hsourceBit, htBit, hxBit,
      hpairTRow, hpairXRow⟩ :=
    v6U5NontripleOccurrenceAt_valid index
  unfold renderV6U5NontripleOccurrence
  apply evalClauseD_three_negative
  intro hchoiceValue hpairTValue hpairXValue
  rw [P.fullRadiusValuation_eq_fullSourceChoice_of_lt shadow selected
      (sourceChoiceVariable_pos occurrence.source occurrence.choice)
      (sourceChoiceVariable_lt occurrence.source occurrence.choice),
    P.fullSourceChoiceValuation_choice] at hchoiceValue
  rw [P.fullRadiusValuation_qDeletedPair] at hpairTValue hpairXValue
  have hchoice :
      P.sourceChoiceHolds shadow occurrence.source occurrence.choice :=
    of_decide_eq_true hchoiceValue
  have hpairT :
      P.qDeletedPairHolds
        (canonicalQDeletedPairRow occurrence.source occurrence.t
          occurrence.center occurrence.x) := by
    rw [← hpairTRow]
    exact of_decide_eq_true hpairTValue
  have hpairX :
      P.qDeletedPairHolds
        (canonicalQDeletedPairRow occurrence.source occurrence.x
          occurrence.center occurrence.t) := by
    rw [← hpairXRow]
    exact of_decide_eq_true hpairXValue
  have hdecodedCenter :
      (sourceChoiceAt occurrence.source occurrence.choice).1 =
        occurrence.center := by
    simpa using congrArg Prod.fst hdecode
  have hdecodedIndex :
      (sourceChoiceAt occurrence.source occurrence.choice).2 =
        occurrence.candidateIndex := by
    simpa using congrArg Prod.snd hdecode
  have hcandidate :
      occurrence.candidateIndex =
        coverIndex P.cube.cube occurrence.center := by
    calc
      occurrence.candidateIndex =
          (sourceChoiceAt occurrence.source occurrence.choice).2 :=
        hdecodedIndex.symm
      _ = P.baseIndex
          (sourceChoiceAt occurrence.source occurrence.choice).1.val :=
        hchoice.2
      _ = coverIndex P.cube.cube occurrence.center := by
        rw [hdecodedCenter]
        rfl
  have ht : occurrence.t ∈ P.cube.cube occurrence.center := by
    apply of_decide_eq_true
    rw [← coverIndex_testBit_of_cubeOk hP occurrence.center occurrence.t]
    rw [← hcandidate]
    simpa [occurrence] using htBit
  have hx : occurrence.x ∉ P.cube.cube occurrence.center := by
    apply of_decide_eq_false
    rw [← coverIndex_testBit_of_cubeOk hP occurrence.center occurrence.x]
    rw [← hcandidate]
    simpa [occurrence] using hxBit
  exact P.u5NontripleChoice_incompatible shadow
    occurrence.source occurrence.center occurrence.t occurrence.x
    occurrence.choice hdecodedCenter hchoice ht hx
    ((P.qDeletedPairHolds_canonical_iff occurrence.source occurrence.t
      occurrence.center occurrence.x).mp hpairT)
    ((P.qDeletedPairHolds_canonical_iff occurrence.source occurrence.x
      occurrence.center occurrence.t).mp hpairX)

/-- Every clause in the retained V6 U5 nontriple slice is satisfied. -/
theorem CanonicalPacket.g3V6U5NontripleSlice_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3V6U5NontripleSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3V6U5NontripleSlice :=
    Array.mem_toList_iff.mp hoccurrence
  rw [g3V6U5NontripleSlice] at hoccurrenceArray
  obtain ⟨index, _hindex, rfl⟩ := Array.mem_map.mp hoccurrenceArray
  exact P.renderV6U5NontripleOccurrence_sat hP shadow selected index

/-- Signed-clause form of the authenticated V6 U5 nontriple result. -/
theorem CanonicalPacket.g3Checkpoint0_v6U5NontripleSlice_signed_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈
        ((signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedV6U5NontripleCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
    (P.fullRadiusValuation shadow selected)
    g3V6U5NontripleSlice_perm_checkpoint
    (P.g3V6U5NontripleSlice_sat hP shadow selected)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3V6U5NontripleSlice_size
#print axioms Problem97.ExactFiveCommonShellV7.g3V6U5NontripleSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderV6U5NontripleOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3V6U5NontripleSlice_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_v6U5NontripleSlice_signed_sat
