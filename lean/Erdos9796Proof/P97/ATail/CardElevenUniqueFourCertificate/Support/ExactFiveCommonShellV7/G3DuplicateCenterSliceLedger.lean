/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3FirstApexGlobalEqSliceLedger
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3U5Semantics

/-!
# Authenticated duplicate-center exclusion slice of the exact-eleven G3 core

This checkpoint segment retains `714` clauses from the `4620`-clause common
family excluding two distinct centers that are each equidistant from the same
three distinct carrier points.  The ledger reconstructs the point triple and
the pair of outside centers in source order, authenticates the four negative
global-equality literals against checkpoint zero, and discharges every clause
by the duplicate-center metric obstruction.
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

private def retainedPrefixCount : Nat := 193371
private def retainedDuplicateCenterCount : Nat := 714
private def duplicateCenterClauseCount : Nat := 4620

private def retainedDuplicateCenterPayload : String :=
  include_str "data/g3-duplicate-center-slice-ordinals.a85"

abbrev DuplicateCenterClauseIndex := Fin duplicateCenterClauseCount

private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if duplicateCenterClauseCount < candidate then
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
    Nat → Nat → Nat → Array DuplicateCenterClauseIndex →
      Option (Array DuplicateCenterClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ duplicateCenterClauseCount then
          let sourceIndex : DuplicateCenterClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedDuplicateCenterIndices :
    Option (Array DuplicateCenterClauseIndex) := do
  let bytes ← decodeAscii85 retainedDuplicateCenterPayload
  decodePositiveDeltasAux bytes retainedDuplicateCenterCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete duplicate-center
family. -/
def g3RetainedDuplicateCenterIndices :
    Array DuplicateCenterClauseIndex :=
  decodeRetainedDuplicateCenterIndices.getD #[]

/-- One source occurrence: three points followed by two centers outside the
triple. -/
structure DuplicateCenterOccurrence where
  p : Label
  q : Label
  r : Label
  firstCenter : Label
  secondCenter : Label
deriving DecidableEq, Repr

private def encoderDuplicateCenterTriples : List (List Nat) :=
  combos 3 (List.range 11)

private def duplicateCenterOutside (triple : List Nat) : List Nat :=
  (List.range 11).filter fun center => center ∉ triple

/-- Exact source order: lexicographic point triples, then lexicographic pairs
of centers outside each triple. -/
def encoderDuplicateCenterOccurrences :
    List DuplicateCenterOccurrence :=
  encoderDuplicateCenterTriples.flatMap fun triple =>
    (combos 2 (duplicateCenterOutside triple)).map fun centers =>
      ⟨toLabel (triple.getD 0 0), toLabel (triple.getD 1 0),
        toLabel (triple.getD 2 0), toLabel (centers.getD 0 0),
        toLabel (centers.getD 1 0)⟩

set_option linter.style.nativeDecide false in
theorem encoderDuplicateCenterOccurrences_length :
    encoderDuplicateCenterOccurrences.length =
      duplicateCenterClauseCount := by
  native_decide

def duplicateCenterOccurrenceArray :
    Array DuplicateCenterOccurrence :=
  encoderDuplicateCenterOccurrences.toArray

def duplicateCenterOccurrenceAt
    (index : DuplicateCenterClauseIndex) : DuplicateCenterOccurrence :=
  duplicateCenterOccurrenceArray[index.val]'(by
    simpa [duplicateCenterOccurrenceArray,
      encoderDuplicateCenterOccurrences_length] using index.isLt)

private def duplicateCenterGlobalEqualityIndex
    (center left right : Label) : Fin 1485 :=
  Fin.ofNat 1485
    (encoderGlobalEqRows.idxOf
      (canonicalGlobalRow
        (canonicalEdge center left) (canonicalEdge center right)))

/-- Render the four negative global-equality literals of one source
occurrence. -/
def renderDuplicateCenterOccurrence
    (occurrence : DuplicateCenterOccurrence) : List Int :=
  [-Int.ofNat
      (encodeG3Var (.globalEquality
        (duplicateCenterGlobalEqualityIndex occurrence.firstCenter
          occurrence.p occurrence.q))),
    -Int.ofNat
      (encodeG3Var (.globalEquality
        (duplicateCenterGlobalEqualityIndex occurrence.firstCenter
          occurrence.p occurrence.r))),
    -Int.ofNat
      (encodeG3Var (.globalEquality
        (duplicateCenterGlobalEqualityIndex occurrence.secondCenter
          occurrence.p occurrence.q))),
    -Int.ofNat
      (encodeG3Var (.globalEquality
        (duplicateCenterGlobalEqualityIndex occurrence.secondCenter
          occurrence.p occurrence.r)))]

/-- Typed retained duplicate-center occurrences in checkpoint order. -/
def g3DuplicateCenterSlice : Array DuplicateCenterOccurrence :=
  g3RetainedDuplicateCenterIndices.map duplicateCenterOccurrenceAt

/-- Signed clauses represented by the retained duplicate-center ledger. -/
def g3DuplicateCenterSliceClauses : List (List Int) :=
  g3DuplicateCenterSlice.toList.map renderDuplicateCenterOccurrence

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3DuplicateCenterSlice_size :
    g3DuplicateCenterSlice.size = retainedDuplicateCenterCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger corresponds clausewise, up to literal permutation, to the retained duplicate-center
segment of the parsed G3 checkpoint-zero payload. -/
theorem g3DuplicateCenterSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3DuplicateCenterSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedDuplicateCenterCount) := by
  native_decide

/-- Exhaustive finite audit of label distinctness and the four allocated
global-equality rows. -/
theorem duplicateCenterOccurrenceAt_valid :
    ∀ index : DuplicateCenterClauseIndex,
      let occurrence := duplicateCenterOccurrenceAt index
      occurrence.p ≠ occurrence.q ∧
        occurrence.p ≠ occurrence.r ∧
        occurrence.q ≠ occurrence.r ∧
        occurrence.firstCenter ≠ occurrence.secondCenter ∧
        globalEqRow
            (duplicateCenterGlobalEqualityIndex occurrence.firstCenter
              occurrence.p occurrence.q) =
          canonicalGlobalRow
            (canonicalEdge occurrence.firstCenter occurrence.p)
            (canonicalEdge occurrence.firstCenter occurrence.q) ∧
        globalEqRow
            (duplicateCenterGlobalEqualityIndex occurrence.firstCenter
              occurrence.p occurrence.r) =
          canonicalGlobalRow
            (canonicalEdge occurrence.firstCenter occurrence.p)
            (canonicalEdge occurrence.firstCenter occurrence.r) ∧
        globalEqRow
            (duplicateCenterGlobalEqualityIndex occurrence.secondCenter
              occurrence.p occurrence.q) =
          canonicalGlobalRow
            (canonicalEdge occurrence.secondCenter occurrence.p)
            (canonicalEdge occurrence.secondCenter occurrence.q) ∧
        globalEqRow
            (duplicateCenterGlobalEqualityIndex occurrence.secondCenter
              occurrence.p occurrence.r) =
          canonicalGlobalRow
            (canonicalEdge occurrence.secondCenter occurrence.p)
            (canonicalEdge occurrence.secondCenter occurrence.r) := by
  native_decide

/-- Every occurrence in the complete duplicate-center exclusion family is
satisfied by the total G3 valuation. -/
theorem CanonicalPacket.renderDuplicateCenterOccurrence_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : DuplicateCenterClauseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderDuplicateCenterOccurrence
        (duplicateCenterOccurrenceAt index)) = true := by
  classical
  let occurrence := duplicateCenterOccurrenceAt index
  obtain ⟨hpq, hpr, hqr, hcenters,
      hfirstPQ, hfirstPR, hsecondPQ, hsecondPR⟩ :=
    duplicateCenterOccurrenceAt_valid index
  unfold renderDuplicateCenterOccurrence
  apply evalClauseD_four_negative
  intro hfirstPQValue hfirstPRValue hsecondPQValue hsecondPRValue
  rw [P.fullRadiusValuation_globalEquality] at hfirstPQValue hfirstPRValue
  rw [P.fullRadiusValuation_globalEquality] at hsecondPQValue hsecondPRValue
  have hfirstPQProp :
      P.globalEqHolds
        (globalEqRow
          (duplicateCenterGlobalEqualityIndex occurrence.firstCenter
            occurrence.p occurrence.q)) :=
    of_decide_eq_true hfirstPQValue
  have hfirstPRProp :
      P.globalEqHolds
        (globalEqRow
          (duplicateCenterGlobalEqualityIndex occurrence.firstCenter
            occurrence.p occurrence.r)) :=
    of_decide_eq_true hfirstPRValue
  have hsecondPQProp :
      P.globalEqHolds
        (globalEqRow
          (duplicateCenterGlobalEqualityIndex occurrence.secondCenter
            occurrence.p occurrence.q)) :=
    of_decide_eq_true hsecondPQValue
  have hsecondPRProp :
      P.globalEqHolds
        (globalEqRow
          (duplicateCenterGlobalEqualityIndex occurrence.secondCenter
            occurrence.p occurrence.r)) :=
    of_decide_eq_true hsecondPRValue
  rw [hfirstPQ] at hfirstPQProp
  rw [hfirstPR] at hfirstPRProp
  rw [hsecondPQ] at hsecondPQProp
  rw [hsecondPR] at hsecondPRProp
  have hfirstPQDist :
      dist (L.pointOf occurrence.firstCenter) (L.pointOf occurrence.p) =
        dist (L.pointOf occurrence.firstCenter) (L.pointOf occurrence.q) := by
    exact
      (P.globalEqHolds_canonicalStar_iff occurrence.firstCenter
        occurrence.p occurrence.q).mp hfirstPQProp
  have hfirstPRDist :
      dist (L.pointOf occurrence.firstCenter) (L.pointOf occurrence.p) =
        dist (L.pointOf occurrence.firstCenter) (L.pointOf occurrence.r) := by
    exact
      (P.globalEqHolds_canonicalStar_iff occurrence.firstCenter
        occurrence.p occurrence.r).mp hfirstPRProp
  have hsecondPQDist :
      dist (L.pointOf occurrence.secondCenter) (L.pointOf occurrence.p) =
        dist (L.pointOf occurrence.secondCenter) (L.pointOf occurrence.q) := by
    exact
      (P.globalEqHolds_canonicalStar_iff occurrence.secondCenter
        occurrence.p occurrence.q).mp hsecondPQProp
  have hsecondPRDist :
      dist (L.pointOf occurrence.secondCenter) (L.pointOf occurrence.p) =
        dist (L.pointOf occurrence.secondCenter) (L.pointOf occurrence.r) := by
    exact
      (P.globalEqHolds_canonicalStar_iff occurrence.secondCenter
        occurrence.p occurrence.r).mp hsecondPRProp
  exact not_dist_eq_three_of_ne
    (L.pointOf occurrence.p) (L.pointOf occurrence.q)
    (L.pointOf occurrence.r) (L.pointOf occurrence.firstCenter)
    (L.pointOf occurrence.secondCenter)
    (L.injective.ne hpq) (L.injective.ne hpr) (L.injective.ne hqr)
    hfirstPQDist hfirstPRDist hsecondPQDist hsecondPRDist
    (L.injective.ne hcenters)

/-- Every clause in the retained duplicate-center slice is satisfied. -/
theorem CanonicalPacket.g3DuplicateCenterSlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3DuplicateCenterSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3DuplicateCenterSlice :=
    Array.mem_toList_iff.mp hoccurrence
  rw [g3DuplicateCenterSlice] at hoccurrenceArray
  obtain ⟨index, _hindex, rfl⟩ := Array.mem_map.mp hoccurrenceArray
  exact P.renderDuplicateCenterOccurrence_sat shadow selected index

/-- Signed-clause form of the authenticated duplicate-center result. -/
theorem CanonicalPacket.g3Checkpoint0_duplicateCenterSlice_signed_sat
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
          retainedPrefixCount).take retainedDuplicateCenterCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
    (P.fullRadiusValuation shadow selected)
    g3DuplicateCenterSlice_perm_checkpoint
    (P.g3DuplicateCenterSlice_sat shadow selected)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3DuplicateCenterSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderDuplicateCenterOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_duplicateCenterSlice_signed_sat
