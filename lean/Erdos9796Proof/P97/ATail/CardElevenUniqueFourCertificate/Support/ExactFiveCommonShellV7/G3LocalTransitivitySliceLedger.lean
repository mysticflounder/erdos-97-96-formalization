/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3SourceTailSliceLedger

/-!
# Authenticated retained local-transitivity slice of the exact-eleven G3 core

The fourth checkpoint segment contains `341` retained clauses from the
`3960`-clause center-local equality-transitivity family.  This file decodes
their family ordinals, reconstructs the exact equality triangle and
transitivity branch, authenticates the rendered clauses against checkpoint
zero, and proves them from equality transitivity.
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

private def retainedPrefixCount : Nat := 159533
private def retainedLocalTransitivityCount : Nat := 341
private def localTransitivityClauseCount : Nat := 3960

private def retainedLocalTransitivityPayload : String :=
  include_str "data/g3-local-transitivity-slice-ordinals.a85"

abbrev LocalTransitivityClauseIndex := Fin localTransitivityClauseCount

/-- Read one canonical positive LEB128 value from a byte array. -/
private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if localTransitivityClauseCount < candidate then
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
    Nat → Nat → Nat → Array LocalTransitivityClauseIndex →
      Option (Array LocalTransitivityClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ localTransitivityClauseCount then
          let sourceIndex : LocalTransitivityClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedLocalTransitivityIndices :
    Option (Array LocalTransitivityClauseIndex) := do
  let bytes ← decodeAscii85 retainedLocalTransitivityPayload
  decodePositiveDeltasAux bytes retainedLocalTransitivityCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete local-transitivity
family. -/
def g3RetainedLocalTransitivityIndices :
    Array LocalTransitivityClauseIndex :=
  decodeRetainedLocalTransitivityIndices.getD #[]

/-- One ordered triple of labels incident to a common center. -/
structure LocalEqualityTriangle where
  center : Label
  first : Label
  pivot : Label
  last : Label
deriving DecidableEq, Repr

/-- The exact center/triple order used by the G3 generator. -/
private def encoderLocalEqualityTriangles : List LocalEqualityTriangle :=
  (List.range 11).flatMap fun center =>
    (combos 3 (encoderIncidentLabels center)).map fun triple =>
      ⟨toLabel center, toLabel (triple.getD 0 0),
        toLabel (triple.getD 1 0), toLabel (triple.getD 2 0)⟩

set_option linter.style.nativeDecide false in
private theorem encoderLocalEqualityTriangles_length :
    encoderLocalEqualityTriangles.length = 1320 := by
  native_decide

/-- Recover the typed local-equality atom allocated to a center and an
ordered incident pair.  The finite family audit below proves that every pair
used by a generated triangle is present, so `Fin.ofNat` never wraps there. -/
private def localEqualityIndex
    (center left right : Label) : Fin 495 :=
  Fin.ofNat 495
    (encoderLocalEqRows.idxOf ⟨center, left, right⟩)

/-- One of the three transitivity clauses emitted for an equality triangle. -/
structure LocalTransitivityOccurrence where
  triangle : LocalEqualityTriangle
  branch : Fin 3
deriving DecidableEq, Repr

def encoderLocalTransitivityOccurrences :
    List LocalTransitivityOccurrence :=
  encoderLocalEqualityTriangles.flatMap fun triangle =>
    (List.range 3).map fun branch =>
      ⟨triangle, Fin.ofNat 3 branch⟩

set_option linter.style.nativeDecide false in
theorem encoderLocalTransitivityOccurrences_length :
    encoderLocalTransitivityOccurrences.length =
      localTransitivityClauseCount := by
  native_decide

def localTransitivityOccurrenceArray :
    Array LocalTransitivityOccurrence :=
  encoderLocalTransitivityOccurrences.toArray

def localTransitivityOccurrenceAt
    (index : LocalTransitivityClauseIndex) : LocalTransitivityOccurrence :=
  localTransitivityOccurrenceArray[index.val]'(by
    simpa [localTransitivityOccurrenceArray,
      encoderLocalTransitivityOccurrences_length] using index.isLt)

/-- Render one occurrence in the exact three-branch generator order. -/
def renderLocalTransitivityOccurrence
    (occurrence : LocalTransitivityOccurrence) : List Int :=
  let triangle := occurrence.triangle
  let firstPivot :=
    localEqualityIndex triangle.center triangle.first triangle.pivot
  let firstLast :=
    localEqualityIndex triangle.center triangle.first triangle.last
  let pivotLast :=
    localEqualityIndex triangle.center triangle.pivot triangle.last
  match occurrence.branch.val with
  | 0 => localEqTransitivityClause firstPivot firstLast pivotLast
  | 1 => localEqTransitivityClause firstPivot pivotLast firstLast
  | _ => localEqTransitivityClause firstLast pivotLast firstPivot

/-- Typed retained local-transitivity occurrences in checkpoint order. -/
def g3LocalTransitivitySlice : Array LocalTransitivityOccurrence :=
  g3RetainedLocalTransitivityIndices.map localTransitivityOccurrenceAt

/-- Signed clauses represented by the retained local-transitivity ledger. -/
def g3LocalTransitivitySliceClauses : List (List Int) :=
  g3LocalTransitivitySlice.toList.map renderLocalTransitivityOccurrence

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3LocalTransitivitySlice_size :
    g3LocalTransitivitySlice.size = retainedLocalTransitivityCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger renders the retained local-transitivity segment of
the parsed G3 checkpoint-zero payload, preserving each clause up to the
per-clause permutation introduced by extracted-core production. -/
theorem g3LocalTransitivitySlice_perm_checkpoint :
    List.Forall₂ List.Perm g3LocalTransitivitySliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedLocalTransitivityCount) := by
  native_decide

theorem localTransitivityOccurrenceAt_rows :
    ∀ index : LocalTransitivityClauseIndex,
      let occurrence := localTransitivityOccurrenceAt index
      let triangle := occurrence.triangle
      localEqRow
          (localEqualityIndex triangle.center triangle.first triangle.pivot) =
          ⟨triangle.center, triangle.first, triangle.pivot⟩ ∧
        localEqRow
          (localEqualityIndex triangle.center triangle.first triangle.last) =
          ⟨triangle.center, triangle.first, triangle.last⟩ ∧
        localEqRow
          (localEqualityIndex triangle.center triangle.pivot triangle.last) =
          ⟨triangle.center, triangle.pivot, triangle.last⟩ := by
  native_decide

/-- Equality transitivity satisfies all three clauses emitted for an ordered
triple of local distances. -/
private theorem CanonicalPacket.localEqualityTriangleClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (occurrence : LocalTransitivityOccurrence)
    (hfirstPivot :
      localEqRow
          (localEqualityIndex occurrence.triangle.center
            occurrence.triangle.first occurrence.triangle.pivot) =
        ⟨occurrence.triangle.center, occurrence.triangle.first,
          occurrence.triangle.pivot⟩)
    (hfirstLast :
      localEqRow
          (localEqualityIndex occurrence.triangle.center
            occurrence.triangle.first occurrence.triangle.last) =
        ⟨occurrence.triangle.center, occurrence.triangle.first,
          occurrence.triangle.last⟩)
    (hpivotLast :
      localEqRow
          (localEqualityIndex occurrence.triangle.center
            occurrence.triangle.pivot occurrence.triangle.last) =
        ⟨occurrence.triangle.center, occurrence.triangle.pivot,
          occurrence.triangle.last⟩) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderLocalTransitivityOccurrence occurrence) = true := by
  classical
  rcases occurrence with ⟨triangle, branch⟩
  let firstPivot :=
    localEqualityIndex triangle.center triangle.first triangle.pivot
  let firstLast :=
    localEqualityIndex triangle.center triangle.first triangle.last
  let pivotLast :=
    localEqualityIndex triangle.center triangle.pivot triangle.last
  have hfirstPivotValue :
      P.fullRadiusValuation shadow selected (encodeG3Var (.localEquality firstPivot)) =
        decide (P.localEqHolds (localEqRow firstPivot)) :=
    P.fullRadiusValuation_localEquality shadow selected firstPivot
  have hfirstLastValue :
      P.fullRadiusValuation shadow selected (encodeG3Var (.localEquality firstLast)) =
        decide (P.localEqHolds (localEqRow firstLast)) :=
    P.fullRadiusValuation_localEquality shadow selected firstLast
  have hpivotLastValue :
      P.fullRadiusValuation shadow selected (encodeG3Var (.localEquality pivotLast)) =
        decide (P.localEqHolds (localEqRow pivotLast)) :=
    P.fullRadiusValuation_localEquality shadow selected pivotLast
  fin_cases branch
  · simp only [renderLocalTransitivityOccurrence]
    unfold localEqTransitivityClause
    apply evalClauseD_transitivityClause _
      (encodeG3Var_pos (.localEquality pivotLast))
    intro hfirstPivotTrue hfirstLastTrue
    rw [hfirstPivotValue] at hfirstPivotTrue
    rw [hfirstLastValue] at hfirstLastTrue
    rw [hpivotLastValue]
    have hfirstPivotProp :
        P.localEqHolds (localEqRow firstPivot) :=
      of_decide_eq_true hfirstPivotTrue
    have hfirstLastProp :
        P.localEqHolds (localEqRow firstLast) :=
      of_decide_eq_true hfirstLastTrue
    rw [hfirstPivot] at hfirstPivotProp
    rw [hfirstLast] at hfirstLastProp
    rw [hpivotLast]
    exact decide_eq_true (hfirstPivotProp.symm.trans hfirstLastProp)
  · simp only [renderLocalTransitivityOccurrence]
    unfold localEqTransitivityClause
    apply evalClauseD_transitivityClause _
      (encodeG3Var_pos (.localEquality firstLast))
    intro hfirstPivotTrue hpivotLastTrue
    rw [hfirstPivotValue] at hfirstPivotTrue
    rw [hpivotLastValue] at hpivotLastTrue
    rw [hfirstLastValue]
    have hfirstPivotProp :
        P.localEqHolds (localEqRow firstPivot) :=
      of_decide_eq_true hfirstPivotTrue
    have hpivotLastProp :
        P.localEqHolds (localEqRow pivotLast) :=
      of_decide_eq_true hpivotLastTrue
    rw [hfirstPivot] at hfirstPivotProp
    rw [hpivotLast] at hpivotLastProp
    rw [hfirstLast]
    exact decide_eq_true (hfirstPivotProp.trans hpivotLastProp)
  · simp only [renderLocalTransitivityOccurrence]
    unfold localEqTransitivityClause
    apply evalClauseD_transitivityClause _
      (encodeG3Var_pos (.localEquality firstPivot))
    intro hfirstLastTrue hpivotLastTrue
    rw [hfirstLastValue] at hfirstLastTrue
    rw [hpivotLastValue] at hpivotLastTrue
    rw [hfirstPivotValue]
    have hfirstLastProp :
        P.localEqHolds (localEqRow firstLast) :=
      of_decide_eq_true hfirstLastTrue
    have hpivotLastProp :
        P.localEqHolds (localEqRow pivotLast) :=
      of_decide_eq_true hpivotLastTrue
    rw [hfirstLast] at hfirstLastProp
    rw [hpivotLast] at hpivotLastProp
    rw [hfirstPivot]
    exact decide_eq_true (hfirstLastProp.trans hpivotLastProp.symm)

/-- Every retained local-transitivity occurrence is satisfied by the total
G3 valuation. -/
theorem CanonicalPacket.renderLocalTransitivityOccurrence_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : LocalTransitivityClauseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderLocalTransitivityOccurrence
        (localTransitivityOccurrenceAt index)) = true := by
  obtain ⟨hfirstPivot, hfirstLast, hpivotLast⟩ :=
    localTransitivityOccurrenceAt_rows index
  exact P.localEqualityTriangleClause_sat shadow selected
    (localTransitivityOccurrenceAt index)
    hfirstPivot hfirstLast hpivotLast

/-- Every clause in the retained local-transitivity slice is satisfied by the
total G3 valuation. -/
theorem CanonicalPacket.g3LocalTransitivitySlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3LocalTransitivitySliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3LocalTransitivitySlice :=
    Array.mem_toList_iff.mp hoccurrence
  rw [g3LocalTransitivitySlice] at hoccurrenceArray
  obtain ⟨index, _hindex, rfl⟩ := Array.mem_map.mp hoccurrenceArray
  exact P.renderLocalTransitivityOccurrence_sat shadow selected index

/-- Signed-clause form of the authenticated local-transitivity result. -/
theorem CanonicalPacket.g3Checkpoint0_localTransitivitySlice_signed_sat
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
          retainedPrefixCount).take retainedLocalTransitivityCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact
    CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
      (P.fullRadiusValuation shadow selected)
      g3LocalTransitivitySlice_perm_checkpoint
      (P.g3LocalTransitivitySlice_sat shadow selected)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3LocalTransitivitySlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderLocalTransitivityOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_localTransitivitySlice_signed_sat
