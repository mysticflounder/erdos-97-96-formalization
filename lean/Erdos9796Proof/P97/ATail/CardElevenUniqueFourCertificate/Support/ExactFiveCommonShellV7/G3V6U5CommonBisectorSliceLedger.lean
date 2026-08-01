/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3V6U5NontripleSliceLedger

/-!
# Authenticated V6 U5 common-bisector slice of the exact-eleven G3 core

This checkpoint segment retains `36` clauses from the `39300`-clause V6 U5
common-bisector-triple incompatibility family.  Source order is the manifest
source-choice order followed by the six labels outside the chosen row and its
center.  Each clause excludes the source choice together with three canonical
global-equality atoms at the outside label.
-/

open Std.Sat

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

private def retainedPrefixCount : Nat := 220288
private def retainedV6U5CommonBisectorCount : Nat := 36
private def v6U5CommonBisectorClauseCount : Nat := 39300

private def retainedV6U5CommonBisectorPayload : String :=
  include_str "data/g3-v6-u5-common-bisector-slice-ordinals.a85"

abbrev V6U5CommonBisectorClauseIndex :=
  Fin v6U5CommonBisectorClauseCount

private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if v6U5CommonBisectorClauseCount < candidate then
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
    Nat → Nat → Nat → Array V6U5CommonBisectorClauseIndex →
      Option (Array V6U5CommonBisectorClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ v6U5CommonBisectorClauseCount then
          let sourceIndex : V6U5CommonBisectorClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedV6U5CommonBisectorIndices :
    Option (Array V6U5CommonBisectorClauseIndex) := do
  let bytes ← decodeAscii85 retainedV6U5CommonBisectorPayload
  decodePositiveDeltasAux bytes retainedV6U5CommonBisectorCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete V6 U5 common-bisector
family. -/
def g3RetainedV6U5CommonBisectorIndices :
    Array V6U5CommonBisectorClauseIndex :=
  decodeRetainedV6U5CommonBisectorIndices.getD #[]

/-- One exact source occurrence in the V6 U5 common-bisector family. -/
structure V6U5CommonBisectorOccurrence where
  source : Label
  choice : SourceChoiceIndex source
  center : Label
  candidateIndex : Nat
  t1 : Label
  t2 : Label
  t3 : Label
  x : Label
deriving DecidableEq, Repr

private def commonBisectorChoiceSupport
    (source : Label) (choice : SourceChoiceIndex source) : List Label :=
  let decoded := sourceChoiceAt source choice
  (List.finRange 11).filter fun label =>
    ((candMasks decoded.1.val).getD decoded.2 0).testBit label.val

private def commonBisectorChoiceInside
    (source : Label) (choice : SourceChoiceIndex source) : List Label :=
  (commonBisectorChoiceSupport source choice).filter fun label =>
    label != source

private def commonBisectorChoiceOutside
    (source : Label) (choice : SourceChoiceIndex source) : List Label :=
  let decoded := sourceChoiceAt source choice
  (List.finRange 11).filter fun label =>
    !((candMasks decoded.1.val).getD decoded.2 0).testBit label.val &&
      label != decoded.1

private def encoderCommonBisectorSourceChoices :
    List SourceChoiceOccurrence :=
  (List.finRange 11).flatMap fun source =>
    (List.finRange (sourceChoiceCount source)).map fun choice =>
      ⟨source, choice⟩

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
private theorem encoderCommonBisectorSourceChoices_length :
    encoderCommonBisectorSourceChoices.length = 6550 := by
  native_decide

/-- Exact generator order: each source choice followed by its six outside
labels. -/
def encoderV6U5CommonBisectorOccurrences :
    List V6U5CommonBisectorOccurrence :=
  encoderCommonBisectorSourceChoices.flatMap fun sourceChoice =>
    let decoded := sourceChoiceAt sourceChoice.source sourceChoice.choice
    let inside :=
      commonBisectorChoiceInside sourceChoice.source sourceChoice.choice
    (commonBisectorChoiceOutside sourceChoice.source
      sourceChoice.choice).map fun x =>
        ⟨sourceChoice.source, sourceChoice.choice, decoded.1, decoded.2,
          inside.getD 0 0, inside.getD 1 0, inside.getD 2 0, x⟩

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem encoderV6U5CommonBisectorOccurrences_length :
    encoderV6U5CommonBisectorOccurrences.length =
      v6U5CommonBisectorClauseCount := by
  native_decide

def v6U5CommonBisectorOccurrenceArray :
    Array V6U5CommonBisectorOccurrence :=
  encoderV6U5CommonBisectorOccurrences.toArray

def v6U5CommonBisectorOccurrenceAt
    (index : V6U5CommonBisectorClauseIndex) :
    V6U5CommonBisectorOccurrence :=
  v6U5CommonBisectorOccurrenceArray[index.val]'(by
    simpa [v6U5CommonBisectorOccurrenceArray,
      encoderV6U5CommonBisectorOccurrences_length] using index.isLt)

private def canonicalCommonBisectorLocalEqRow
    (center left right : Label) : LocalEqRow :=
  if left.val < right.val then
    ⟨center, left, right⟩
  else
    ⟨center, right, left⟩

private def commonBisectorLocalEqualityIndex
    (center left right : Label) : Fin 495 :=
  Fin.ofNat 495
    (encoderLocalEqRows.idxOf
      (canonicalCommonBisectorLocalEqRow center left right))

private def commonBisectorLocalFourSupport
    (occurrence : V6U5CommonBisectorOccurrence) : List Label :=
  (List.finRange 11).filter fun label =>
    label == occurrence.center || label == occurrence.t1 ||
      label == occurrence.t2 || label == occurrence.t3

private def commonBisectorLocalFourIndex
    (occurrence : V6U5CommonBisectorOccurrence) : Fin 2310 :=
  let available :=
    (List.range 11).filter fun label => label != occurrence.x.val
  let support :=
    (commonBisectorLocalFourSupport occurrence).map fun label => label.val
  let supportOrdinal := (combos 4 available).idxOf support
  Fin.ofNat 2310 (occurrence.x.val * 210 + supportOrdinal)

/-- Render the exact compact source clause for one V6 U5 common-bisector
occurrence. -/
def renderV6U5CommonBisectorOccurrence
    (occurrence : V6U5CommonBisectorOccurrence) : List Int :=
  [-Int.ofNat
      (sourceChoiceVariable occurrence.source occurrence.choice),
    -Int.ofNat
      (encodeG3Var (.localEquality
        (commonBisectorLocalEqualityIndex occurrence.x occurrence.center
          occurrence.t1))),
    -Int.ofNat
      (encodeG3Var (.localEquality
        (commonBisectorLocalEqualityIndex occurrence.x occurrence.center
          occurrence.t2))),
    -Int.ofNat
      (encodeG3Var (.localEquality
        (commonBisectorLocalEqualityIndex occurrence.x occurrence.center
          occurrence.t3)))]

/-- Typed retained V6 U5 common-bisector occurrences in checkpoint order. -/
def g3V6U5CommonBisectorSlice :
    Array V6U5CommonBisectorOccurrence :=
  g3RetainedV6U5CommonBisectorIndices.map
    v6U5CommonBisectorOccurrenceAt

/-- Signed clauses represented by the retained V6 U5 common-bisector ledger. -/
def g3V6U5CommonBisectorSliceClauses : List (List Int) :=
  g3V6U5CommonBisectorSlice.toList.map
    renderV6U5CommonBisectorOccurrence

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3V6U5CommonBisectorSlice_size :
    g3V6U5CommonBisectorSlice.size =
      retainedV6U5CommonBisectorCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger corresponds clausewise, up to literal permutation, to the retained V6 U5 common-bisector
segment of the parsed G3 checkpoint-zero payload. -/
theorem g3V6U5CommonBisectorSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3V6U5CommonBisectorSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedV6U5CommonBisectorCount) := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- Exhaustive source-order, membership, and atom-identity audit for the
complete family. -/
theorem v6U5CommonBisectorOccurrenceAt_valid :
    ∀ index : V6U5CommonBisectorClauseIndex,
      let occurrence := v6U5CommonBisectorOccurrenceAt index
      let row := localFourRow (commonBisectorLocalFourIndex occurrence)
      sourceChoiceAt occurrence.source occurrence.choice =
          (occurrence.center, occurrence.candidateIndex) ∧
        occurrence.candidateIndex < candCount occurrence.center.val ∧
        ((candMasks occurrence.center.val).getD
            occurrence.candidateIndex 0).testBit
              occurrence.t1.val = true ∧
        ((candMasks occurrence.center.val).getD
            occurrence.candidateIndex 0).testBit
              occurrence.t2.val = true ∧
        ((candMasks occurrence.center.val).getD
            occurrence.candidateIndex 0).testBit
              occurrence.t3.val = true ∧
        occurrence.t1 ≠ occurrence.t2 ∧
        occurrence.t1 ≠ occurrence.t3 ∧
        occurrence.t2 ≠ occurrence.t3 ∧
        row.center = occurrence.x ∧
        occurrence.source ∉ row.support ∧
        occurrence.center ∈ row.support ∧
        occurrence.t1 ∈ row.support ∧
        occurrence.t2 ∈ row.support ∧
        occurrence.t3 ∈ row.support ∧
        (∀ z ∈ row.support,
          z = occurrence.center ∨ z = occurrence.t1 ∨
            z = occurrence.t2 ∨ z = occurrence.t3) ∧
        (localEqRow
              (commonBisectorLocalEqualityIndex occurrence.x
                occurrence.center occurrence.t1) =
            ⟨occurrence.x, occurrence.center, occurrence.t1⟩ ∨
          localEqRow
              (commonBisectorLocalEqualityIndex occurrence.x
                occurrence.center occurrence.t1) =
            ⟨occurrence.x, occurrence.t1, occurrence.center⟩) ∧
        (localEqRow
              (commonBisectorLocalEqualityIndex occurrence.x
                occurrence.center occurrence.t2) =
            ⟨occurrence.x, occurrence.center, occurrence.t2⟩ ∨
          localEqRow
              (commonBisectorLocalEqualityIndex occurrence.x
                occurrence.center occurrence.t2) =
            ⟨occurrence.x, occurrence.t2, occurrence.center⟩) ∧
        (localEqRow
              (commonBisectorLocalEqualityIndex occurrence.x
                occurrence.center occurrence.t3) =
            ⟨occurrence.x, occurrence.center, occurrence.t3⟩ ∨
          localEqRow
              (commonBisectorLocalEqualityIndex occurrence.x
                occurrence.center occurrence.t3) =
            ⟨occurrence.x, occurrence.t3, occurrence.center⟩) := by
  native_decide

private theorem commonBisectorSourceChoiceVariable_lt
    (source : Label) (choice : SourceChoiceIndex source) :
    sourceChoiceVariable source choice < 41005 := by
  fin_cases source <;>
    simp [sourceChoiceVariable, sourceChoiceStart, sourceChoiceCount] at choice ⊢ <;>
    omega

/-- Every occurrence in the complete V6 U5 common-bisector family is
satisfied by the total G3 valuation. -/
theorem CanonicalPacket.renderV6U5CommonBisectorOccurrence_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : V6U5CommonBisectorClauseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderV6U5CommonBisectorOccurrence
        (v6U5CommonBisectorOccurrenceAt index)) = true := by
  let occurrence := v6U5CommonBisectorOccurrenceAt index
  let row := localFourRow (commonBisectorLocalFourIndex occurrence)
  obtain ⟨hdecode, hindex, ht1Bit, ht2Bit, ht3Bit,
      ht12, ht13, ht23, hcenterRow, hsourceRow, hpRow,
      ht1Row, ht2Row, ht3Row, hexhaust, heq1Row, heq2Row, heq3Row⟩ :=
    v6U5CommonBisectorOccurrenceAt_valid index
  unfold renderV6U5CommonBisectorOccurrence
  apply evalClauseD_four_negative
  intro hchoiceValue heq1Value heq2Value heq3Value
  rw [P.fullRadiusValuation_eq_fullSourceChoice_of_lt shadow selected
      (sourceChoiceVariable_pos occurrence.source occurrence.choice)
      (commonBisectorSourceChoiceVariable_lt
        occurrence.source occurrence.choice),
    P.fullSourceChoiceValuation_choice] at hchoiceValue
  rw [P.fullRadiusValuation_localEquality] at heq1Value heq2Value heq3Value
  have hchoice :
      P.sourceChoiceHolds shadow occurrence.source occurrence.choice :=
    of_decide_eq_true hchoiceValue
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
  have ht1 : occurrence.t1 ∈ P.cube.cube occurrence.center := by
    apply of_decide_eq_true
    rw [← coverIndex_testBit_of_cubeOk hP occurrence.center occurrence.t1]
    rw [← hcandidate]
    simpa [occurrence] using ht1Bit
  have ht2 : occurrence.t2 ∈ P.cube.cube occurrence.center := by
    apply of_decide_eq_true
    rw [← coverIndex_testBit_of_cubeOk hP occurrence.center occurrence.t2]
    rw [← hcandidate]
    simpa [occurrence] using ht2Bit
  have ht3 : occurrence.t3 ∈ P.cube.cube occurrence.center := by
    apply of_decide_eq_true
    rw [← coverIndex_testBit_of_cubeOk hP occurrence.center occurrence.t3]
    rw [← hcandidate]
    simpa [occurrence] using ht3Bit
  have heq1 :
      P.globalEqHolds
        (canonicalGlobalRow
          (canonicalEdge occurrence.x occurrence.center)
          (canonicalEdge occurrence.x occurrence.t1)) := by
    apply
      (P.globalEqHolds_canonicalStar_iff occurrence.x occurrence.center
        occurrence.t1).2
    have hlocal :
        P.localEqHolds
          (localEqRow
            (commonBisectorLocalEqualityIndex occurrence.x
              occurrence.center occurrence.t1)) :=
      of_decide_eq_true heq1Value
    rcases heq1Row with hrow | hrow
    · rw [hrow] at hlocal
      simpa only [CanonicalPacket.localEqHolds] using hlocal
    · rw [hrow] at hlocal
      simpa only [CanonicalPacket.localEqHolds] using hlocal.symm
  have heq2 :
      P.globalEqHolds
        (canonicalGlobalRow
          (canonicalEdge occurrence.x occurrence.center)
          (canonicalEdge occurrence.x occurrence.t2)) := by
    apply
      (P.globalEqHolds_canonicalStar_iff occurrence.x occurrence.center
        occurrence.t2).2
    have hlocal :
        P.localEqHolds
          (localEqRow
            (commonBisectorLocalEqualityIndex occurrence.x
              occurrence.center occurrence.t2)) :=
      of_decide_eq_true heq2Value
    rcases heq2Row with hrow | hrow
    · rw [hrow] at hlocal
      simpa only [CanonicalPacket.localEqHolds] using hlocal
    · rw [hrow] at hlocal
      simpa only [CanonicalPacket.localEqHolds] using hlocal.symm
  have heq3 :
      P.globalEqHolds
        (canonicalGlobalRow
          (canonicalEdge occurrence.x occurrence.center)
          (canonicalEdge occurrence.x occurrence.t3)) := by
    apply
      (P.globalEqHolds_canonicalStar_iff occurrence.x occurrence.center
        occurrence.t3).2
    have hlocal :
        P.localEqHolds
          (localEqRow
            (commonBisectorLocalEqualityIndex occurrence.x
              occurrence.center occurrence.t3)) :=
      of_decide_eq_true heq3Value
    rcases heq3Row with hrow | hrow
    · rw [hrow] at hlocal
      simpa only [CanonicalPacket.localEqHolds] using hlocal
    · rw [hrow] at hlocal
      simpa only [CanonicalPacket.localEqHolds] using hlocal.symm
  exact P.u5CommonBisectorChoice_incompatible shadow
    occurrence.source occurrence.center occurrence.x
    occurrence.t1 occurrence.t2 occurrence.t3 occurrence.choice
    hdecodedCenter
    hchoice ht1 ht2 ht3 ht12 ht13 ht23 row
    (localFourRow_mem_encoderLocalFourRows
      (commonBisectorLocalFourIndex occurrence))
    hcenterRow hsourceRow hpRow ht1Row ht2Row ht3Row hexhaust
    heq1 heq2 heq3

/-- Every clause in the retained V6 U5 common-bisector slice is satisfied. -/
theorem CanonicalPacket.g3V6U5CommonBisectorSlice_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3V6U5CommonBisectorSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3V6U5CommonBisectorSlice :=
    Array.mem_toList_iff.mp hoccurrence
  rw [g3V6U5CommonBisectorSlice] at hoccurrenceArray
  obtain ⟨index, _hindex, rfl⟩ := Array.mem_map.mp hoccurrenceArray
  exact P.renderV6U5CommonBisectorOccurrence_sat hP shadow selected index

/-- Signed-clause form of the authenticated V6 U5 common-bisector result. -/
theorem CanonicalPacket.g3Checkpoint0_v6U5CommonBisectorSlice_signed_sat
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
          retainedPrefixCount).take retainedV6U5CommonBisectorCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
    (P.fullRadiusValuation shadow selected)
    g3V6U5CommonBisectorSlice_perm_checkpoint
    (P.g3V6U5CommonBisectorSlice_sat hP shadow selected)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3V6U5CommonBisectorSlice_size
#print axioms Problem97.ExactFiveCommonShellV7.g3V6U5CommonBisectorSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderV6U5CommonBisectorOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3V6U5CommonBisectorSlice_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_v6U5CommonBisectorSlice_signed_sat
