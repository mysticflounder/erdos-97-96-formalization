/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3DuplicateCenterSliceLedger

/-!
# Authenticated perpendicular-bisector exclusion slice of the exact-eleven G3 core

This checkpoint segment retains `1293` clauses from the `4620`-clause common
family excluding three distinct carrier points on the perpendicular bisector
of the same two distinct foci. The ledger reconstructs the focus pair and
outside triple in source order, authenticates the three negative
global-equality literals against checkpoint zero, and discharges every clause
by the convex-independent perpendicular-bisector bound.
-/

open Std.Sat

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open CheckpointedRup.CompactIngress
open CheckpointedRup.CompactBoundary
open CheckpointedRup.SemanticBoundary

set_option maxRecDepth 100000

private def retainedPrefixCount : Nat := 194085
private def retainedPerpendicularBisectorCount : Nat := 1293
private def perpendicularBisectorClauseCount : Nat := 4620

private def retainedPerpendicularBisectorPayload : String :=
  include_str "data/g3-perpendicular-bisector-slice-ordinals.a85"

abbrev PerpendicularBisectorClauseIndex :=
  Fin perpendicularBisectorClauseCount

private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if perpendicularBisectorClauseCount < candidate then
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
    Nat → Nat → Nat → Array PerpendicularBisectorClauseIndex →
      Option (Array PerpendicularBisectorClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ perpendicularBisectorClauseCount then
          let sourceIndex : PerpendicularBisectorClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedPerpendicularBisectorIndices :
    Option (Array PerpendicularBisectorClauseIndex) := do
  let bytes ← decodeAscii85 retainedPerpendicularBisectorPayload
  decodePositiveDeltasAux bytes retainedPerpendicularBisectorCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete perpendicular-bisector
family. -/
def g3RetainedPerpendicularBisectorIndices :
    Array PerpendicularBisectorClauseIndex :=
  decodeRetainedPerpendicularBisectorIndices.getD #[]

/-- One source occurrence: a focus pair followed by three labels outside it. -/
structure PerpendicularBisectorOccurrence where
  a : Label
  b : Label
  p : Label
  q : Label
  r : Label
deriving DecidableEq, Repr

private def perpendicularBisectorOutside (focus : List Nat) : List Nat :=
  (List.range 11).filter fun point => point ∉ focus

/-- Exact source order: lexicographic focus pairs, then lexicographic triples
outside each focus pair. -/
def encoderPerpendicularBisectorOccurrences :
    List PerpendicularBisectorOccurrence :=
  (combos 2 (List.range 11)).flatMap fun focus =>
    (combos 3 (perpendicularBisectorOutside focus)).map fun triple =>
      ⟨toLabel (focus.getD 0 0), toLabel (focus.getD 1 0),
        toLabel (triple.getD 0 0), toLabel (triple.getD 1 0),
        toLabel (triple.getD 2 0)⟩

set_option linter.style.nativeDecide false in
theorem encoderPerpendicularBisectorOccurrences_length :
    encoderPerpendicularBisectorOccurrences.length =
      perpendicularBisectorClauseCount := by
  native_decide

def perpendicularBisectorOccurrenceArray :
    Array PerpendicularBisectorOccurrence :=
  encoderPerpendicularBisectorOccurrences.toArray

def perpendicularBisectorOccurrenceAt
    (index : PerpendicularBisectorClauseIndex) :
    PerpendicularBisectorOccurrence :=
  perpendicularBisectorOccurrenceArray[index.val]'(by
    simpa [perpendicularBisectorOccurrenceArray,
      encoderPerpendicularBisectorOccurrences_length] using index.isLt)

private def perpendicularBisectorGlobalEqualityIndex
    (point a b : Label) : Fin 1485 :=
  Fin.ofNat 1485
    (encoderGlobalEqRows.idxOf
      (canonicalGlobalRow
        (canonicalEdge point a) (canonicalEdge point b)))

/-- Render the three negative global-equality literals of one source
occurrence. -/
def renderPerpendicularBisectorOccurrence
    (occurrence : PerpendicularBisectorOccurrence) : List Int :=
  [-Int.ofNat
      (encodeG3Var (.globalEquality
        (perpendicularBisectorGlobalEqualityIndex occurrence.p
          occurrence.a occurrence.b))),
    -Int.ofNat
      (encodeG3Var (.globalEquality
        (perpendicularBisectorGlobalEqualityIndex occurrence.q
          occurrence.a occurrence.b))),
    -Int.ofNat
      (encodeG3Var (.globalEquality
        (perpendicularBisectorGlobalEqualityIndex occurrence.r
          occurrence.a occurrence.b)))]

/-- Typed retained perpendicular-bisector occurrences in checkpoint order. -/
def g3PerpendicularBisectorSlice : Array PerpendicularBisectorOccurrence :=
  g3RetainedPerpendicularBisectorIndices.map
    perpendicularBisectorOccurrenceAt

/-- Signed clauses represented by the retained perpendicular-bisector
ledger. -/
def g3PerpendicularBisectorSliceClauses : List (List Int) :=
  g3PerpendicularBisectorSlice.toList.map
    renderPerpendicularBisectorOccurrence

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3PerpendicularBisectorSlice_size :
    g3PerpendicularBisectorSlice.size =
      retainedPerpendicularBisectorCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger corresponds clausewise, up to literal permutation, to the retained
perpendicular-bisector segment of the parsed G3 checkpoint-zero payload. -/
theorem g3PerpendicularBisectorSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3PerpendicularBisectorSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedPerpendicularBisectorCount) := by
  native_decide

/-- Exhaustive finite audit of label distinctness and the three allocated
global-equality rows. -/
theorem perpendicularBisectorOccurrenceAt_valid :
    ∀ index : PerpendicularBisectorClauseIndex,
      let occurrence := perpendicularBisectorOccurrenceAt index
      occurrence.a ≠ occurrence.b ∧
        occurrence.p ≠ occurrence.q ∧
        occurrence.p ≠ occurrence.r ∧
        occurrence.q ≠ occurrence.r ∧
        globalEqRow
            (perpendicularBisectorGlobalEqualityIndex occurrence.p
              occurrence.a occurrence.b) =
          canonicalGlobalRow
            (canonicalEdge occurrence.p occurrence.a)
            (canonicalEdge occurrence.p occurrence.b) ∧
        globalEqRow
            (perpendicularBisectorGlobalEqualityIndex occurrence.q
              occurrence.a occurrence.b) =
          canonicalGlobalRow
            (canonicalEdge occurrence.q occurrence.a)
            (canonicalEdge occurrence.q occurrence.b) ∧
        globalEqRow
            (perpendicularBisectorGlobalEqualityIndex occurrence.r
              occurrence.a occurrence.b) =
          canonicalGlobalRow
            (canonicalEdge occurrence.r occurrence.a)
            (canonicalEdge occurrence.r occurrence.b) := by
  native_decide

/-- Every occurrence in the complete perpendicular-bisector exclusion family
is satisfied by the total G3 valuation. -/
theorem CanonicalPacket.renderPerpendicularBisectorOccurrence_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : PerpendicularBisectorClauseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderPerpendicularBisectorOccurrence
        (perpendicularBisectorOccurrenceAt index)) = true := by
  classical
  let occurrence := perpendicularBisectorOccurrenceAt index
  obtain ⟨hab, hpq, hpr, hqr, hpRow, hqRow, hrRow⟩ :=
    perpendicularBisectorOccurrenceAt_valid index
  unfold renderPerpendicularBisectorOccurrence
  apply evalClauseD_three_negative
  intro hpValue hqValue hrValue
  rw [P.fullRadiusValuation_globalEquality] at hpValue hqValue hrValue
  have hpProp :
      P.globalEqHolds
        (globalEqRow
          (perpendicularBisectorGlobalEqualityIndex occurrence.p
            occurrence.a occurrence.b)) :=
    of_decide_eq_true hpValue
  have hqProp :
      P.globalEqHolds
        (globalEqRow
          (perpendicularBisectorGlobalEqualityIndex occurrence.q
            occurrence.a occurrence.b)) :=
    of_decide_eq_true hqValue
  have hrProp :
      P.globalEqHolds
        (globalEqRow
          (perpendicularBisectorGlobalEqualityIndex occurrence.r
            occurrence.a occurrence.b)) :=
    of_decide_eq_true hrValue
  rw [hpRow] at hpProp
  rw [hqRow] at hqProp
  rw [hrRow] at hrProp
  have hpDist :
      dist (L.pointOf occurrence.p) (L.pointOf occurrence.a) =
        dist (L.pointOf occurrence.p) (L.pointOf occurrence.b) :=
    (P.globalEqHolds_canonicalStar_iff occurrence.p
      occurrence.a occurrence.b).mp hpProp
  have hqDist :
      dist (L.pointOf occurrence.q) (L.pointOf occurrence.a) =
        dist (L.pointOf occurrence.q) (L.pointOf occurrence.b) :=
    (P.globalEqHolds_canonicalStar_iff occurrence.q
      occurrence.a occurrence.b).mp hqProp
  have hrDist :
      dist (L.pointOf occurrence.r) (L.pointOf occurrence.a) =
        dist (L.pointOf occurrence.r) (L.pointOf occurrence.b) :=
    (P.globalEqHolds_canonicalStar_iff occurrence.r
      occurrence.a occurrence.b).mp hrProp
  have hpMem :
      L.pointOf occurrence.p ∈
        D.A.filter (fun x =>
          dist x (L.pointOf occurrence.a) =
            dist x (L.pointOf occurrence.b)) :=
    Finset.mem_filter.mpr ⟨L.mem_carrier occurrence.p, hpDist⟩
  have hqMem :
      L.pointOf occurrence.q ∈
        D.A.filter (fun x =>
          dist x (L.pointOf occurrence.a) =
            dist x (L.pointOf occurrence.b)) :=
    Finset.mem_filter.mpr ⟨L.mem_carrier occurrence.q, hqDist⟩
  have hrMem :
      L.pointOf occurrence.r ∈
        D.A.filter (fun x =>
          dist x (L.pointOf occurrence.a) =
            dist x (L.pointOf occurrence.b)) :=
    Finset.mem_filter.mpr ⟨L.mem_carrier occurrence.r, hrDist⟩
  have hlarge :
      2 < (D.A.filter (fun x =>
        dist x (L.pointOf occurrence.a) =
          dist x (L.pointOf occurrence.b))).card := by
    rw [Finset.two_lt_card]
    exact
      ⟨L.pointOf occurrence.p, hpMem, L.pointOf occurrence.q, hqMem,
        L.pointOf occurrence.r, hrMem, L.injective.ne hpq,
        L.injective.ne hpr, L.injective.ne hqr⟩
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex
    (L.mem_carrier occurrence.a) (L.mem_carrier occurrence.b)
    (L.injective.ne hab)
  exact (not_lt_of_ge hbound) hlarge

/-- Every clause in the retained perpendicular-bisector slice is satisfied. -/
theorem CanonicalPacket.g3PerpendicularBisectorSlice_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3PerpendicularBisectorSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3PerpendicularBisectorSlice :=
    Array.mem_toList_iff.mp hoccurrence
  rw [g3PerpendicularBisectorSlice] at hoccurrenceArray
  obtain ⟨index, _hindex, rfl⟩ := Array.mem_map.mp hoccurrenceArray
  exact P.renderPerpendicularBisectorOccurrence_sat shadow selected index

/-- Signed-clause form of the authenticated perpendicular-bisector result. -/
theorem CanonicalPacket.g3Checkpoint0_perpendicularBisectorSlice_signed_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈
        ((signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedPerpendicularBisectorCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
    (P.fullRadiusValuation shadow selected)
    g3PerpendicularBisectorSlice_perm_checkpoint
    (P.g3PerpendicularBisectorSlice_sat shadow selected)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3PerpendicularBisectorSlice_size
#print axioms Problem97.ExactFiveCommonShellV7.g3PerpendicularBisectorSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderPerpendicularBisectorOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3PerpendicularBisectorSlice_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_perpendicularBisectorSlice_signed_sat
