/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3V6LocalFourSliceLedger

/-!
# Authenticated V6 q-deleted-pair slice of the exact-eleven G3 core

This checkpoint segment retains `13214` clauses from the `87120`-clause V6
q-deleted-pair Tseitin family. Source occurrence `i` is attached to the
`i / 22`-th q-deleted row. Branches `0..20` are the forward implications from
the exact ordered local-four witness surface, and branch `21` is the reverse
implication. The ledger authenticates source order, the retained checkpoint
segment, and semantic truth through the existing generic family consumers.
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

private def retainedPrefixCount : Nat := 206799
private def retainedV6QDeletedPairCount : Nat := 13214
private def v6QDeletedPairClauseCount : Nat := 87120

private def retainedV6QDeletedPairPayload : String :=
  include_str "data/g3-v6-qdeleted-pair-slice-ordinals.a85"

abbrev V6QDeletedPairClauseIndex := Fin v6QDeletedPairClauseCount

private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if v6QDeletedPairClauseCount < candidate then
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
    Nat → Nat → Nat → Array V6QDeletedPairClauseIndex →
      Option (Array V6QDeletedPairClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ v6QDeletedPairClauseCount then
          let sourceIndex : V6QDeletedPairClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedV6QDeletedPairIndices :
    Option (Array V6QDeletedPairClauseIndex) := do
  let bytes ← decodeAscii85 retainedV6QDeletedPairPayload
  decodePositiveDeltasAux bytes retainedV6QDeletedPairCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete V6 q-deleted-pair
family. -/
def g3RetainedV6QDeletedPairIndices :
    Array V6QDeletedPairClauseIndex :=
  decodeRetainedV6QDeletedPairIndices.getD #[]

/-- The 22 source branches attached to each q-deleted-pair row. -/
inductive V6QDeletedPairKind where
  | forward (slot : Fin 21)
  | reverse
deriving DecidableEq, Repr

/-- One source occurrence: a q-deleted-pair row and one Tseitin branch. -/
structure V6QDeletedPairOccurrence where
  qDeletedPair : Fin 3960
  kind : V6QDeletedPairKind
deriving DecidableEq, Repr

private def v6QDeletedPairExtraLabels
    (qDeletedPair : Fin 3960) : List Nat :=
  let row := qDeletedPairRow qDeletedPair
  (List.range 11).filter fun label =>
    label != row.deleted.val && label != row.center.val &&
      label != row.first.val && label != row.second.val

private def v6QDeletedPairWitnessPairs
    (qDeletedPair : Fin 3960) : List (List Nat) :=
  combos 2 (v6QDeletedPairExtraLabels qDeletedPair)

private def v6QDeletedPairWitnessSupport
    (qDeletedPair : Fin 3960) (pair : List Nat) : List Label :=
  let row := qDeletedPairRow qDeletedPair
  ((List.range 11).filter fun label =>
    label == row.first.val || label == row.second.val ||
      label == pair.getD 0 0 || label == pair.getD 1 0).map toLabel

private def v6QDeletedPairWitnessIndex
    (qDeletedPair : Fin 3960) (pair : List Nat) : Fin 2310 :=
  let row := qDeletedPairRow qDeletedPair
  Fin.ofNat 2310
    (encoderLocalFourRows.idxOf
      ⟨row.center, v6QDeletedPairWitnessSupport qDeletedPair pair⟩)

/-- Exact source-ordered list of the 21 local-four witnesses attached to one
q-deleted-pair row. -/
def v6QDeletedPairWitnesses
    (qDeletedPair : Fin 3960) : List (Fin 2310) :=
  (v6QDeletedPairWitnessPairs qDeletedPair).map fun pair =>
    v6QDeletedPairWitnessIndex qDeletedPair pair

private def encoderV6QDeletedPairKinds : List V6QDeletedPairKind :=
  ((List.finRange 21).map fun slot => .forward slot) ++ [.reverse]

/-- Exact source order: manifest q-deleted rows, their 21 forward witnesses,
then the reverse branch. -/
def encoderV6QDeletedPairOccurrences :
    List V6QDeletedPairOccurrence :=
  (List.finRange 3960).flatMap fun qDeletedPair =>
    encoderV6QDeletedPairKinds.map fun kind => ⟨qDeletedPair, kind⟩

set_option linter.style.nativeDecide false in
theorem encoderV6QDeletedPairOccurrences_length :
    encoderV6QDeletedPairOccurrences.length =
      v6QDeletedPairClauseCount := by
  native_decide

def v6QDeletedPairOccurrenceArray :
    Array V6QDeletedPairOccurrence :=
  encoderV6QDeletedPairOccurrences.toArray

def v6QDeletedPairOccurrenceAt
    (index : V6QDeletedPairClauseIndex) : V6QDeletedPairOccurrence :=
  v6QDeletedPairOccurrenceArray[index.val]'(by
    simpa [v6QDeletedPairOccurrenceArray,
      encoderV6QDeletedPairOccurrences_length] using index.isLt)

/-- Render the exact source clause for one V6 q-deleted-pair occurrence. -/
def renderV6QDeletedPairOccurrence
    (occurrence : V6QDeletedPairOccurrence) : List Int :=
  match occurrence.kind with
  | .forward slot =>
      qDeletedPairForwardClause
        ((v6QDeletedPairWitnesses occurrence.qDeletedPair).getD slot.val 0)
        occurrence.qDeletedPair
  | .reverse =>
      qDeletedPairReverseClause occurrence.qDeletedPair
        (v6QDeletedPairWitnesses occurrence.qDeletedPair)

/-- Typed retained V6 q-deleted-pair occurrences in checkpoint order. -/
def g3V6QDeletedPairSlice : Array V6QDeletedPairOccurrence :=
  g3RetainedV6QDeletedPairIndices.map v6QDeletedPairOccurrenceAt

/-- Signed clauses represented by the retained V6 q-deleted-pair ledger. -/
def g3V6QDeletedPairSliceClauses : List (List Int) :=
  g3V6QDeletedPairSlice.toList.map renderV6QDeletedPairOccurrence

private def v6QDeletedPairIsForward
    (occurrence : V6QDeletedPairOccurrence) : Bool :=
  match occurrence.kind with
  | .forward _ => true
  | .reverse => false

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3V6QDeletedPairSlice_size :
    g3V6QDeletedPairSlice.size = retainedV6QDeletedPairCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The retained slice has exactly the audited forward/reverse branch split. -/
theorem g3V6QDeletedPairSlice_branch_counts :
    (g3V6QDeletedPairSlice.toList.filter
      v6QDeletedPairIsForward).length = 12509 ∧
      (g3V6QDeletedPairSlice.toList.filter
        (fun occurrence => !v6QDeletedPairIsForward occurrence)).length =
          705 := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger corresponds clausewise, up to literal permutation, to the retained V6 q-deleted-pair
segment of the parsed G3 checkpoint-zero payload. -/
theorem g3V6QDeletedPairSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3V6QDeletedPairSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedV6QDeletedPairCount) := by
  native_decide

/-- Exhaustive audit that the source-ordered witness list has length 21 and
every listed local-four row has the required q-deleted incidence. -/
set_option maxHeartbeats 0 in
-- This executable audit checks all 3960 q-deleted pairs and their 21 witnesses.
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem v6QDeletedPairWitnesses_valid :
    ∀ qDeletedPair : Fin 3960,
      let row := qDeletedPairRow qDeletedPair
      let witnesses := v6QDeletedPairWitnesses qDeletedPair
      witnesses.length = 21 ∧
        ∀ localFour ∈ witnesses,
          (localFourRow localFour).center = row.center ∧
            row.deleted ∉ (localFourRow localFour).support ∧
            row.first ∈ (localFourRow localFour).support ∧
            row.second ∈ (localFourRow localFour).support := by
  native_decide

/-- Exhaustive audit that the 21 source witnesses cover every admissible
encoder local-four row. -/
set_option maxHeartbeats 0 in
-- This executable audit checks all 3960 q-deleted pairs against all 2310 local-four rows.
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
private theorem v6QDeletedPairWitnesses_complete :
    ∀ qDeletedPair : Fin 3960,
      let row := qDeletedPairRow qDeletedPair
      ∀ localFour : Fin 2310,
        (localFourRow localFour).center = row.center →
        row.deleted ∉ (localFourRow localFour).support →
        row.first ∈ (localFourRow localFour).support →
        row.second ∈ (localFourRow localFour).support →
        localFour ∈ v6QDeletedPairWitnesses qDeletedPair := by
  native_decide

/-- Every occurrence in the complete V6 q-deleted-pair family is satisfied
by the total G3 valuation. -/
theorem CanonicalPacket.renderV6QDeletedPairOccurrence_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : V6QDeletedPairClauseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderV6QDeletedPairOccurrence
        (v6QDeletedPairOccurrenceAt index)) = true := by
  let occurrence := v6QDeletedPairOccurrenceAt index
  let qDeletedPair := occurrence.qDeletedPair
  let witnesses := v6QDeletedPairWitnesses qDeletedPair
  obtain ⟨hwitnessLength, hwitnessValid⟩ :=
    v6QDeletedPairWitnesses_valid qDeletedPair
  cases hkind : occurrence.kind with
  | forward slot =>
      let localFour := witnesses.getD slot.val 0
      have hlocalFourMem : localFour ∈ witnesses := by
        have hslot : slot.val < witnesses.length := by
          simpa [hwitnessLength] using slot.isLt
        rw [List.getD_eq_getElem witnesses slot.val hslot]
        exact List.getElem_mem hslot
      obtain ⟨hcenter, hdeleted, hfirst, hsecond⟩ :=
        hwitnessValid localFour hlocalFourMem
      simpa [renderV6QDeletedPairOccurrence, occurrence, qDeletedPair,
        witnesses, localFour, hkind] using
        P.qDeletedPairForwardClause_sat shadow selected localFour
          qDeletedPair hcenter hdeleted hfirst hsecond
  | reverse =>
      simpa [renderV6QDeletedPairOccurrence, occurrence, qDeletedPair,
        witnesses, hkind] using
        P.qDeletedPairReverseClause_sat shadow selected qDeletedPair
          witnesses (by
            intro candidate hcandidate hcenter hdeleted hfirst hsecond
            obtain ⟨candidateIndex, hcandidateIndex⟩ :=
              List.mem_iff_get.mp hcandidate
            let localFour : Fin 2310 :=
              ⟨candidateIndex.val, by
                simpa [encoderLocalFourRows_length] using
                  candidateIndex.isLt⟩
            have hrow : localFourRow localFour = candidate := by
              simpa [localFourRow, localFour] using hcandidateIndex
            have hlocalFourMem : localFour ∈ witnesses := by
              apply v6QDeletedPairWitnesses_complete qDeletedPair localFour
              · simpa [hrow] using hcenter
              · simpa [hrow] using hdeleted
              · simpa [hrow] using hfirst
              · simpa [hrow] using hsecond
            exact ⟨localFour, hlocalFourMem, hrow⟩)

/-- Every clause in the retained V6 q-deleted-pair slice is satisfied. -/
theorem CanonicalPacket.g3V6QDeletedPairSlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3V6QDeletedPairSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3V6QDeletedPairSlice :=
    Array.mem_toList_iff.mp hoccurrence
  rw [g3V6QDeletedPairSlice] at hoccurrenceArray
  obtain ⟨index, _hindex, rfl⟩ := Array.mem_map.mp hoccurrenceArray
  exact P.renderV6QDeletedPairOccurrence_sat shadow selected index

/-- Signed-clause form of the authenticated V6 q-deleted-pair result. -/
theorem CanonicalPacket.g3Checkpoint0_v6QDeletedPairSlice_signed_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈
        ((signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedV6QDeletedPairCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
    (P.fullRadiusValuation shadow selected)
    g3V6QDeletedPairSlice_perm_checkpoint
    (P.g3V6QDeletedPairSlice_sat shadow selected)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3V6QDeletedPairSlice_size
#print axioms Problem97.ExactFiveCommonShellV7.g3V6QDeletedPairSlice_branch_counts
#print axioms Problem97.ExactFiveCommonShellV7.g3V6QDeletedPairSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderV6QDeletedPairOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3V6QDeletedPairSlice_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_v6QDeletedPairSlice_signed_sat
