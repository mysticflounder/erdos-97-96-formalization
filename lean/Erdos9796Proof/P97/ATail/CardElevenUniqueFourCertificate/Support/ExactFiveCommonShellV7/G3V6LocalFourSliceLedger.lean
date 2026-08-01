/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3ConvexFiveSliceLedger
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3ClauseFamilySemantics

/-!
# Authenticated V6 local-four-definition slice of the exact-eleven G3 core

This checkpoint segment retains `3024` clauses from the `9240`-clause V6
local-four Tseitin family.  Source occurrence `i` is the `i / 4`-th
local-four row and branch `i % 4`: three forward implications from the helper
to its anchor equalities, followed by the reverse implication.  The ledger
authenticates all source occurrences, the retained checkpoint segment, and
the semantic truth of every retained clause.
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

private def retainedPrefixCount : Nat := 203775
private def retainedV6LocalFourCount : Nat := 3024
private def v6LocalFourClauseCount : Nat := 9240

private def retainedV6LocalFourPayload : String :=
  include_str "data/g3-v6-local-four-slice-ordinals.a85"

abbrev V6LocalFourClauseIndex := Fin v6LocalFourClauseCount

private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if v6LocalFourClauseCount < candidate then
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
    Nat → Nat → Nat → Array V6LocalFourClauseIndex →
      Option (Array V6LocalFourClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ v6LocalFourClauseCount then
          let sourceIndex : V6LocalFourClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedV6LocalFourIndices :
    Option (Array V6LocalFourClauseIndex) := do
  let bytes ← decodeAscii85 retainedV6LocalFourPayload
  decodePositiveDeltasAux bytes retainedV6LocalFourCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete V6 local-four family. -/
def g3RetainedV6LocalFourIndices :
    Array V6LocalFourClauseIndex :=
  decodeRetainedV6LocalFourIndices.getD #[]

/-- The four source branches attached to each local-four row. -/
inductive V6LocalFourKind where
  | forward (slot : Fin 3)
  | reverse
deriving DecidableEq, Repr

/-- One source occurrence: a local-four row and one of its four Tseitin
branches. -/
structure V6LocalFourOccurrence where
  localFour : Fin 2310
  kind : V6LocalFourKind
deriving DecidableEq, Repr

private def encoderV6LocalFourKinds : List V6LocalFourKind :=
  [.forward ⟨0, by omega⟩, .forward ⟨1, by omega⟩,
    .forward ⟨2, by omega⟩, .reverse]

/-- Exact source order: manifest local-four rows, with the three negative
helper branches followed by the reverse branch. -/
def encoderV6LocalFourOccurrences :
    List V6LocalFourOccurrence :=
  (List.finRange 2310).flatMap fun localFour =>
    encoderV6LocalFourKinds.map fun kind => ⟨localFour, kind⟩

set_option linter.style.nativeDecide false in
theorem encoderV6LocalFourOccurrences_length :
    encoderV6LocalFourOccurrences.length = v6LocalFourClauseCount := by
  native_decide

def v6LocalFourOccurrenceArray :
    Array V6LocalFourOccurrence :=
  encoderV6LocalFourOccurrences.toArray

def v6LocalFourOccurrenceAt
    (index : V6LocalFourClauseIndex) : V6LocalFourOccurrence :=
  v6LocalFourOccurrenceArray[index.val]'(by
    simpa [v6LocalFourOccurrenceArray,
      encoderV6LocalFourOccurrences_length] using index.isLt)

private def v6LocalFourCenter (localFour : Fin 2310) : Label :=
  (localFourRow localFour).center

private def v6LocalFourSupport (localFour : Fin 2310) : List Label :=
  (localFourRow localFour).support

private def v6LocalFourPoint
    (localFour : Fin 2310) (slot : Nat) : Label :=
  (v6LocalFourSupport localFour).getD (slot + 1) 0

private def v6LocalFourEqualityIndex
    (localFour : Fin 2310) (point : Label) : Fin 495 :=
  Fin.ofNat 495
    (encoderLocalEqRows.idxOf
      ⟨v6LocalFourCenter localFour,
        (v6LocalFourSupport localFour).getD 0 0, point⟩)

/-- Render the exact source clause for one V6 local-four occurrence. -/
def renderV6LocalFourOccurrence
    (occurrence : V6LocalFourOccurrence) : List Int :=
  match occurrence.kind with
  | .forward slot =>
      localFourForwardClause occurrence.localFour
        (v6LocalFourEqualityIndex occurrence.localFour
          (v6LocalFourPoint occurrence.localFour slot.val))
  | .reverse =>
      localFourReverseClause occurrence.localFour
        (v6LocalFourEqualityIndex occurrence.localFour
          (v6LocalFourPoint occurrence.localFour 0))
        (v6LocalFourEqualityIndex occurrence.localFour
          (v6LocalFourPoint occurrence.localFour 1))
        (v6LocalFourEqualityIndex occurrence.localFour
          (v6LocalFourPoint occurrence.localFour 2))

/-- Typed retained V6 local-four occurrences in checkpoint order. -/
def g3V6LocalFourSlice : Array V6LocalFourOccurrence :=
  g3RetainedV6LocalFourIndices.map v6LocalFourOccurrenceAt

/-- Signed clauses represented by the retained V6 local-four ledger. -/
def g3V6LocalFourSliceClauses : List (List Int) :=
  g3V6LocalFourSlice.toList.map renderV6LocalFourOccurrence

private def v6LocalFourIsForward
    (occurrence : V6LocalFourOccurrence) : Bool :=
  match occurrence.kind with
  | .forward _ => true
  | .reverse => false

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3V6LocalFourSlice_size :
    g3V6LocalFourSlice.size = retainedV6LocalFourCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The retained slice has exactly the audited forward/reverse branch split. -/
theorem g3V6LocalFourSlice_branch_counts :
    (g3V6LocalFourSlice.toList.filter v6LocalFourIsForward).length = 2769 ∧
      (g3V6LocalFourSlice.toList.filter
        (fun occurrence => !v6LocalFourIsForward occurrence)).length = 255 := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger corresponds clausewise, up to literal permutation, to the retained V6 local-four segment
of the parsed G3 checkpoint-zero payload. -/
theorem g3V6LocalFourSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3V6LocalFourSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedV6LocalFourCount) := by
  native_decide

/-- Exhaustive finite audit of every source occurrence's local-four support
and three allocated local-equality rows. -/
theorem v6LocalFourOccurrenceAt_valid :
    ∀ index : V6LocalFourClauseIndex,
      let occurrence := v6LocalFourOccurrenceAt index
      let localFour := occurrence.localFour
      let center := v6LocalFourCenter localFour
      let anchor := (v6LocalFourSupport localFour).getD 0 0
      let point₁ := v6LocalFourPoint localFour 0
      let point₂ := v6LocalFourPoint localFour 1
      let point₃ := v6LocalFourPoint localFour 2
      localFourRow localFour =
          ⟨center, [anchor, point₁, point₂, point₃]⟩ ∧
        localEqRow (v6LocalFourEqualityIndex localFour point₁) =
          ⟨center, anchor, point₁⟩ ∧
        localEqRow (v6LocalFourEqualityIndex localFour point₂) =
          ⟨center, anchor, point₂⟩ ∧
        localEqRow (v6LocalFourEqualityIndex localFour point₃) =
          ⟨center, anchor, point₃⟩ := by
  native_decide

/-- Every occurrence in the complete V6 local-four family is satisfied by
the total G3 valuation. -/
theorem CanonicalPacket.renderV6LocalFourOccurrence_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : V6LocalFourClauseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderV6LocalFourOccurrence
        (v6LocalFourOccurrenceAt index)) = true := by
  let occurrence := v6LocalFourOccurrenceAt index
  let localFour := occurrence.localFour
  let center := v6LocalFourCenter localFour
  let anchor := (v6LocalFourSupport localFour).getD 0 0
  let point₁ := v6LocalFourPoint localFour 0
  let point₂ := v6LocalFourPoint localFour 1
  let point₃ := v6LocalFourPoint localFour 2
  obtain ⟨hfour, hfirst, hsecond, hthird⟩ :=
    v6LocalFourOccurrenceAt_valid index
  cases hkind : occurrence.kind with
  | reverse =>
      simpa [renderV6LocalFourOccurrence, occurrence, localFour,
        center, anchor, point₁, point₂, point₃, hkind] using
        P.localFourReverseClause_sat shadow selected localFour
          (v6LocalFourEqualityIndex localFour point₁)
          (v6LocalFourEqualityIndex localFour point₂)
          (v6LocalFourEqualityIndex localFour point₃)
          center anchor point₁ point₂ point₃ hfour hfirst hsecond hthird
  | forward slot =>
      fin_cases slot <;>
        simp only [renderV6LocalFourOccurrence, occurrence, localFour,
          center, anchor, point₁, point₂, point₃, hkind,
          v6LocalFourPoint] <;>
        first
        | exact P.localFourForwardClause_sat shadow selected localFour
            (v6LocalFourEqualityIndex localFour point₁)
            center anchor point₁ [anchor, point₁, point₂, point₃]
            hfour hfirst (by simp) (by simp)
        | exact P.localFourForwardClause_sat shadow selected localFour
            (v6LocalFourEqualityIndex localFour point₂)
            center anchor point₂ [anchor, point₁, point₂, point₃]
            hfour hsecond (by simp) (by simp)
        | exact P.localFourForwardClause_sat shadow selected localFour
            (v6LocalFourEqualityIndex localFour point₃)
            center anchor point₃ [anchor, point₁, point₂, point₃]
            hfour hthird (by simp) (by simp)

/-- Every clause in the retained V6 local-four slice is satisfied. -/
theorem CanonicalPacket.g3V6LocalFourSlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3V6LocalFourSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3V6LocalFourSlice :=
    Array.mem_toList_iff.mp hoccurrence
  rw [g3V6LocalFourSlice] at hoccurrenceArray
  obtain ⟨index, _hindex, rfl⟩ := Array.mem_map.mp hoccurrenceArray
  exact P.renderV6LocalFourOccurrence_sat shadow selected index

/-- Signed-clause form of the authenticated V6 local-four result. -/
theorem CanonicalPacket.g3Checkpoint0_v6LocalFourSlice_signed_sat
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
          retainedPrefixCount).take retainedV6LocalFourCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
    (P.fullRadiusValuation shadow selected)
    g3V6LocalFourSlice_perm_checkpoint
    (P.g3V6LocalFourSlice_sat shadow selected)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3V6LocalFourSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderV6LocalFourOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_v6LocalFourSlice_signed_sat
