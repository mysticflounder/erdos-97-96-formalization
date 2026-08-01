/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3FirstApexExactFiveSliceLedger

/-!
# Authenticated retained global-equality-transitivity slice of the exact-eleven G3 core

The tenth checkpoint segment contains `10,721` retained clauses from the
`78,705` global edge-equality transitivity clauses.  This file decodes their
family ordinals, reconstructs the exact triangle/branch source order,
authenticates the rendering against checkpoint zero, and discharges every
clause using the packet's global-equality semantics.
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

private def retainedPrefixCount : Nat := 174429
private def retainedGlobalTransitivityCount : Nat := 10721
private def globalTransitivityClauseCount : Nat := 78705

private def retainedGlobalTransitivityPayload : String :=
  include_str "data/g3-global-transitivity-slice-ordinals.a85"

abbrev GlobalTransitivityClauseIndex := Fin globalTransitivityClauseCount

private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if globalTransitivityClauseCount < candidate then
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
    Nat → Nat → Nat → Array GlobalTransitivityClauseIndex →
      Option (Array GlobalTransitivityClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ globalTransitivityClauseCount then
          let sourceIndex : GlobalTransitivityClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedGlobalTransitivityIndices :
    Option (Array GlobalTransitivityClauseIndex) := do
  let bytes ← decodeAscii85 retainedGlobalTransitivityPayload
  decodePositiveDeltasAux bytes retainedGlobalTransitivityCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete global-transitivity
family. -/
def g3RetainedGlobalTransitivityIndices :
    Array GlobalTransitivityClauseIndex :=
  decodeRetainedGlobalTransitivityIndices.getD #[]

/-- One ordered triple of encoder graph edges. -/
structure GlobalEqualityTriangle where
  first : RawEdge
  pivot : RawEdge
  last : RawEdge
deriving DecidableEq, Repr

/-- Exact `combinations(edges, 3)` order used by the G3 generator. -/
private def encoderGlobalEqualityTriangles : List GlobalEqualityTriangle :=
  (combos 3 (List.range encoderEdges.length)).map fun triple =>
    ⟨encoderEdges.getD (triple.getD 0 0) (0, 0),
      encoderEdges.getD (triple.getD 1 0) (0, 0),
      encoderEdges.getD (triple.getD 2 0) (0, 0)⟩

set_option linter.style.nativeDecide false in
private theorem encoderGlobalEqualityTriangles_length :
    encoderGlobalEqualityTriangles.length = 26235 := by
  native_decide

private def globalEqualityIndex (left right : RawEdge) : Fin 1485 :=
  Fin.ofNat 1485 (encoderGlobalEqRows.idxOf (left, right))

/-- One of the three source clauses for a global-equality triangle. -/
structure GlobalTransitivityOccurrence where
  triangle : GlobalEqualityTriangle
  branch : Fin 3
deriving DecidableEq, Repr

/-- Every generated global-transitivity occurrence, in encoder order. -/
def encoderGlobalTransitivityOccurrences :
    List GlobalTransitivityOccurrence :=
  encoderGlobalEqualityTriangles.flatMap fun triangle =>
    (List.range 3).map fun branch =>
      ⟨triangle, Fin.ofNat 3 branch⟩

set_option linter.style.nativeDecide false in
theorem encoderGlobalTransitivityOccurrences_length :
    encoderGlobalTransitivityOccurrences.length =
      globalTransitivityClauseCount := by
  native_decide

/-- Array form of the complete global-transitivity occurrence family. -/
def globalTransitivityOccurrenceArray :
    Array GlobalTransitivityOccurrence :=
  encoderGlobalTransitivityOccurrences.toArray

/-- The complete-family occurrence at a typed source ordinal. -/
def globalTransitivityOccurrenceAt
    (index : GlobalTransitivityClauseIndex) : GlobalTransitivityOccurrence :=
  globalTransitivityOccurrenceArray[index.val]'(by
    simpa [globalTransitivityOccurrenceArray,
      encoderGlobalTransitivityOccurrences_length] using index.isLt)

/-- Render one occurrence in the generator's exact three-branch order. -/
def renderGlobalTransitivityOccurrence
    (occurrence : GlobalTransitivityOccurrence) : List Int :=
  let triangle := occurrence.triangle
  let firstPivot := globalEqualityIndex triangle.first triangle.pivot
  let firstLast := globalEqualityIndex triangle.first triangle.last
  let pivotLast := globalEqualityIndex triangle.pivot triangle.last
  match occurrence.branch.val with
  | 0 => globalEqTransitivityClause firstPivot firstLast pivotLast
  | 1 => globalEqTransitivityClause firstPivot pivotLast firstLast
  | _ => globalEqTransitivityClause firstLast pivotLast firstPivot

/-- Typed retained global-transitivity occurrences in checkpoint order. -/
def g3GlobalTransitivitySlice : Array GlobalTransitivityOccurrence :=
  g3RetainedGlobalTransitivityIndices.map globalTransitivityOccurrenceAt

/-- Signed clauses represented by the retained global-transitivity ledger. -/
def g3GlobalTransitivitySliceClauses : List (List Int) :=
  g3GlobalTransitivitySlice.toList.map renderGlobalTransitivityOccurrence

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3GlobalTransitivitySlice_size :
    g3GlobalTransitivitySlice.size = retainedGlobalTransitivityCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger corresponds clausewise, up to literal permutation, to the retained global-transitivity
segment of checkpoint zero. -/
theorem g3GlobalTransitivitySlice_perm_checkpoint :
    List.Forall₂ List.Perm g3GlobalTransitivitySliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedGlobalTransitivityCount) := by
  native_decide

theorem globalTransitivityOccurrenceAt_rows :
    ∀ index : GlobalTransitivityClauseIndex,
      let occurrence := globalTransitivityOccurrenceAt index
      let triangle := occurrence.triangle
      globalEqRow (globalEqualityIndex triangle.first triangle.pivot) =
          (triangle.first, triangle.pivot) ∧
        globalEqRow (globalEqualityIndex triangle.first triangle.last) =
          (triangle.first, triangle.last) ∧
        globalEqRow (globalEqualityIndex triangle.pivot triangle.last) =
          (triangle.pivot, triangle.last) := by
  native_decide

/-- Global equality satisfies all three source orientations.  The middle
orientation is the uniform semantic theorem; the outer two use symmetry of
the same equality relation. -/
private theorem CanonicalPacket.globalEqualityTriangleClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (occurrence : GlobalTransitivityOccurrence)
    (hfirstPivot :
      globalEqRow
          (globalEqualityIndex occurrence.triangle.first
            occurrence.triangle.pivot) =
        (occurrence.triangle.first, occurrence.triangle.pivot))
    (hfirstLast :
      globalEqRow
          (globalEqualityIndex occurrence.triangle.first
            occurrence.triangle.last) =
        (occurrence.triangle.first, occurrence.triangle.last))
    (hpivotLast :
      globalEqRow
          (globalEqualityIndex occurrence.triangle.pivot
            occurrence.triangle.last) =
        (occurrence.triangle.pivot, occurrence.triangle.last)) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderGlobalTransitivityOccurrence occurrence) = true := by
  classical
  rcases occurrence with ⟨triangle, branch⟩
  let firstPivot :=
    globalEqualityIndex triangle.first triangle.pivot
  let firstLast :=
    globalEqualityIndex triangle.first triangle.last
  let pivotLast :=
    globalEqualityIndex triangle.pivot triangle.last
  have hfirstPivot' :
      globalEqRow firstPivot = (triangle.first, triangle.pivot) := by
    simpa [firstPivot] using hfirstPivot
  have hfirstLast' :
      globalEqRow firstLast = (triangle.first, triangle.last) := by
    simpa [firstLast] using hfirstLast
  have hpivotLast' :
      globalEqRow pivotLast = (triangle.pivot, triangle.last) := by
    simpa [pivotLast] using hpivotLast
  have hfirstPivotValue :
      P.fullRadiusValuation shadow selected
          (encodeG3Var (.globalEquality firstPivot)) =
        decide (P.globalEqHolds (globalEqRow firstPivot)) :=
    P.fullRadiusValuation_globalEquality shadow selected firstPivot
  have hfirstLastValue :
      P.fullRadiusValuation shadow selected
          (encodeG3Var (.globalEquality firstLast)) =
        decide (P.globalEqHolds (globalEqRow firstLast)) :=
    P.fullRadiusValuation_globalEquality shadow selected firstLast
  have hpivotLastValue :
      P.fullRadiusValuation shadow selected
          (encodeG3Var (.globalEquality pivotLast)) =
        decide (P.globalEqHolds (globalEqRow pivotLast)) :=
    P.fullRadiusValuation_globalEquality shadow selected pivotLast
  fin_cases branch
  · simp only [renderGlobalTransitivityOccurrence]
    unfold globalEqTransitivityClause
    apply evalClauseD_transitivityClause
      (P.fullRadiusValuation shadow selected)
      (encodeG3Var_pos (.globalEquality pivotLast))
    intro hfirstPivotTrue hfirstLastTrue
    rw [hfirstPivotValue] at hfirstPivotTrue
    rw [hfirstLastValue] at hfirstLastTrue
    rw [hpivotLastValue]
    have hfirstPivotProp :
        P.globalEqHolds (globalEqRow firstPivot) :=
      of_decide_eq_true hfirstPivotTrue
    have hfirstLastProp :
        P.globalEqHolds (globalEqRow firstLast) :=
      of_decide_eq_true hfirstLastTrue
    rw [hfirstPivot'] at hfirstPivotProp
    rw [hfirstLast'] at hfirstLastProp
    rw [hpivotLast']
    exact decide_eq_true (hfirstPivotProp.symm.trans hfirstLastProp)
  · simp only [renderGlobalTransitivityOccurrence]
    exact P.globalEqTransitivityClause_sat shadow selected
      firstPivot pivotLast firstLast
      triangle.first triangle.pivot triangle.last
      hfirstPivot' hpivotLast' hfirstLast'
  · simp only [renderGlobalTransitivityOccurrence]
    unfold globalEqTransitivityClause
    apply evalClauseD_transitivityClause
      (P.fullRadiusValuation shadow selected)
      (encodeG3Var_pos (.globalEquality firstPivot))
    intro hfirstLastTrue hpivotLastTrue
    rw [hfirstLastValue] at hfirstLastTrue
    rw [hpivotLastValue] at hpivotLastTrue
    rw [hfirstPivotValue]
    have hfirstLastProp :
        P.globalEqHolds (globalEqRow firstLast) :=
      of_decide_eq_true hfirstLastTrue
    have hpivotLastProp :
        P.globalEqHolds (globalEqRow pivotLast) :=
      of_decide_eq_true hpivotLastTrue
    rw [hfirstLast'] at hfirstLastProp
    rw [hpivotLast'] at hpivotLastProp
    rw [hfirstPivot']
    exact decide_eq_true (hfirstLastProp.trans hpivotLastProp.symm)

/-- Every generated occurrence is satisfied by the total G3 valuation. -/
theorem CanonicalPacket.renderGlobalTransitivityOccurrence_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : GlobalTransitivityClauseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderGlobalTransitivityOccurrence
        (globalTransitivityOccurrenceAt index)) = true := by
  obtain ⟨hfirstPivot, hfirstLast, hpivotLast⟩ :=
    globalTransitivityOccurrenceAt_rows index
  exact P.globalEqualityTriangleClause_sat shadow selected
    (globalTransitivityOccurrenceAt index)
    hfirstPivot hfirstLast hpivotLast

/-- Every retained global-transitivity clause is satisfied. -/
theorem CanonicalPacket.g3GlobalTransitivitySlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3GlobalTransitivitySliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3GlobalTransitivitySlice :=
    Array.mem_toList_iff.mp hoccurrence
  rw [g3GlobalTransitivitySlice] at hoccurrenceArray
  obtain ⟨index, _hindex, rfl⟩ := Array.mem_map.mp hoccurrenceArray
  exact P.renderGlobalTransitivityOccurrence_sat shadow selected index

/-- Signed-clause form of the authenticated global-transitivity result. -/
theorem CanonicalPacket.g3Checkpoint0_globalTransitivitySlice_signed_sat
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
          retainedPrefixCount).take retainedGlobalTransitivityCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
    (P.fullRadiusValuation shadow selected)
    g3GlobalTransitivitySlice_perm_checkpoint
    (P.g3GlobalTransitivitySlice_sat shadow selected)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3GlobalTransitivitySlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderGlobalTransitivityOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_globalTransitivitySlice_signed_sat
