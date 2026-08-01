/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3V6U5CommonBisectorSliceLedger
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.OccurrenceCore

/-!
# Authenticated v7 two-center bisector slice of the exact-eleven G3 core

This checkpoint segment retains `52693` clauses from the `190080`-clause
global two-center bisector-parity family.  Source order is the manifest
selector order, the lexicographic four-subsets of the eleven labels, and the
four nonalternating endpoint pairs in Python combination order.  Each clause
excludes its order selector together with the two canonical global-equality
atoms at the complementary centers.
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

private def retainedPrefixCount : Nat := 220324
private def retainedTwoCenterBisectorCount : Nat := 52693
private def twoCenterBisectorClauseCount : Nat := 190080

private def retainedTwoCenterBisectorPayload : String :=
  include_str "data/g3-v7-two-center-bisector-slice-ordinals.a85"

abbrev TwoCenterBisectorClauseIndex :=
  Fin twoCenterBisectorClauseCount

private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if twoCenterBisectorClauseCount < candidate then
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
    Nat → Nat → Nat → Array TwoCenterBisectorClauseIndex →
      Option (Array TwoCenterBisectorClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ twoCenterBisectorClauseCount then
          let sourceIndex : TwoCenterBisectorClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedTwoCenterBisectorIndices :
    Option (Array TwoCenterBisectorClauseIndex) := do
  let bytes ← decodeAscii85 retainedTwoCenterBisectorPayload
  decodePositiveDeltasAux bytes retainedTwoCenterBisectorCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete v7 two-center family. -/
def g3RetainedTwoCenterBisectorIndices :
    Array TwoCenterBisectorClauseIndex :=
  decodeRetainedTwoCenterBisectorIndices.getD #[]

/-- One exact source occurrence in the v7 two-center family. -/
structure TwoCenterBisectorOccurrence where
  selector : Fin 144
  firstEndpoint : Label
  secondEndpoint : Label
  firstCenter : Label
  secondCenter : Label
deriving DecidableEq, Repr

private def TwoCenterBisectorOccurrence.position
    (occurrence : TwoCenterBisectorOccurrence) (label : Label) : Label :=
  selectorIndexEquiv occurrence.selector label

private def TwoCenterBisectorOccurrence.nonalternating
    (occurrence : TwoCenterBisectorOccurrence) : Bool :=
  let firstCenter := occurrence.position occurrence.firstCenter
  let secondCenter := occurrence.position occurrence.secondCenter
  let firstEndpoint := occurrence.position occurrence.firstEndpoint
  let secondEndpoint := occurrence.position occurrence.secondEndpoint
  decide (
    ((min firstCenter secondCenter < firstEndpoint ∧
        firstEndpoint < max firstCenter secondCenter) ↔
      (min firstCenter secondCenter < secondEndpoint ∧
        secondEndpoint < max firstCenter secondCenter)))

/-- Exact source order: selector, four-set, endpoint pair, then the source
nonalternation filter. -/
def encoderTwoCenterBisectorOccurrences :
    List TwoCenterBisectorOccurrence :=
  (List.range 144).flatMap fun selector =>
    (combos 4 (List.range 11)).flatMap fun four =>
      (combos 2 four).flatMap fun endpoints =>
        let a := endpoints.getD 0 0
        let b := endpoints.getD 1 0
        let centers := four.filter fun label => label != a && label != b
        let occurrence : TwoCenterBisectorOccurrence :=
          ⟨Fin.ofNat 144 selector, toLabel a, toLabel b,
            toLabel (centers.getD 0 0), toLabel (centers.getD 1 0)⟩
        if occurrence.nonalternating then [occurrence] else []

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem encoderTwoCenterBisectorOccurrences_length :
    encoderTwoCenterBisectorOccurrences.length =
      twoCenterBisectorClauseCount := by
  native_decide

def twoCenterBisectorOccurrenceArray :
    Array TwoCenterBisectorOccurrence :=
  encoderTwoCenterBisectorOccurrences.toArray

def twoCenterBisectorOccurrenceAt
    (index : TwoCenterBisectorClauseIndex) :
    TwoCenterBisectorOccurrence :=
  twoCenterBisectorOccurrenceArray[index.val]'(by
    simpa [twoCenterBisectorOccurrenceArray,
      encoderTwoCenterBisectorOccurrences_length] using index.isLt)

private def twoCenterGlobalEqualityIndex
    (center left right : Label) : Fin 1485 :=
  Fin.ofNat 1485
    (encoderGlobalEqRows.idxOf
      (canonicalGlobalRow
        (canonicalEdge center left) (canonicalEdge center right)))

/-- Render one source occurrence with the generator's exact atom order. -/
def renderTwoCenterBisectorOccurrence
    (occurrence : TwoCenterBisectorOccurrence) : List Int :=
  [
    -Int.ofNat (varOfAtom (.orderSelector occurrence.selector)),
    -Int.ofNat (encodeG3Var (.globalEquality
      (twoCenterGlobalEqualityIndex occurrence.firstCenter
        occurrence.firstEndpoint occurrence.secondEndpoint))),
    -Int.ofNat (encodeG3Var (.globalEquality
      (twoCenterGlobalEqualityIndex occurrence.secondCenter
        occurrence.firstEndpoint occurrence.secondEndpoint)))
  ]

/-- Typed retained v7 two-center occurrences in checkpoint order. -/
def g3TwoCenterBisectorSlice : Array TwoCenterBisectorOccurrence :=
  g3RetainedTwoCenterBisectorIndices.map twoCenterBisectorOccurrenceAt

/-- Signed clauses represented by the retained v7 two-center ledger. -/
def g3TwoCenterBisectorSliceClauses : List (List Int) :=
  g3TwoCenterBisectorSlice.toList.map renderTwoCenterBisectorOccurrence

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3TwoCenterBisectorSlice_size :
    g3TwoCenterBisectorSlice.size =
      retainedTwoCenterBisectorCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger corresponds clausewise, up to literal permutation, to the retained v7 two-center segment
of the parsed G3 checkpoint-zero payload. -/
theorem g3TwoCenterBisectorSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3TwoCenterBisectorSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedTwoCenterBisectorCount) := by
  native_decide

/-- Finite position and row facts carried by one retained occurrence. -/
def TwoCenterBisectorOccurrence.Valid
    (occurrence : TwoCenterBisectorOccurrence) : Prop :=
  let firstCenter := occurrence.position occurrence.firstCenter
  let secondCenter := occurrence.position occurrence.secondCenter
  let firstEndpoint := occurrence.position occurrence.firstEndpoint
  let secondEndpoint := occurrence.position occurrence.secondEndpoint
  let leftEndpoint := min firstEndpoint secondEndpoint
  let rightEndpoint := max firstEndpoint secondEndpoint
  firstCenter ≠ secondCenter ∧
    leftEndpoint < rightEndpoint ∧
    leftEndpoint ≠ firstCenter ∧
    leftEndpoint ≠ secondCenter ∧
    rightEndpoint ≠ firstCenter ∧
    rightEndpoint ≠ secondCenter ∧
    ((min firstCenter secondCenter < leftEndpoint ∧
        leftEndpoint < max firstCenter secondCenter) ↔
      (min firstCenter secondCenter < rightEndpoint ∧
        rightEndpoint < max firstCenter secondCenter)) ∧
    globalEqRow
        (twoCenterGlobalEqualityIndex occurrence.firstCenter
          occurrence.firstEndpoint occurrence.secondEndpoint) =
      canonicalGlobalRow
        (canonicalEdge
          ((selectorIndexEquiv occurrence.selector).symm firstCenter)
          ((selectorIndexEquiv occurrence.selector).symm leftEndpoint))
        (canonicalEdge
          ((selectorIndexEquiv occurrence.selector).symm firstCenter)
          ((selectorIndexEquiv occurrence.selector).symm rightEndpoint)) ∧
    globalEqRow
        (twoCenterGlobalEqualityIndex occurrence.secondCenter
          occurrence.firstEndpoint occurrence.secondEndpoint) =
      canonicalGlobalRow
        (canonicalEdge
          ((selectorIndexEquiv occurrence.selector).symm secondCenter)
          ((selectorIndexEquiv occurrence.selector).symm leftEndpoint))
        (canonicalEdge
          ((selectorIndexEquiv occurrence.selector).symm secondCenter)
          ((selectorIndexEquiv occurrence.selector).symm rightEndpoint))

private instance (occurrence : TwoCenterBisectorOccurrence) :
    Decidable occurrence.Valid := by
  unfold TwoCenterBisectorOccurrence.Valid
  infer_instance

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- Every source occurrence in the complete v7 two-center family carries the
finite position and global-row facts required by the semantic renderer. -/
theorem twoCenterBisectorOccurrenceAt_valid :
    ∀ index : TwoCenterBisectorClauseIndex,
      (twoCenterBisectorOccurrenceAt index).Valid := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- Exhaustive finite audit of retained nonalternation facts and allocated
global-equality rows. -/
private theorem g3TwoCenterBisectorSlice_valid :
    ∀ occurrence ∈ g3TwoCenterBisectorSlice, occurrence.Valid := by
  native_decide

/-- Every retained v7 two-center source occurrence is satisfied by the total
G3 valuation. -/
theorem CanonicalPacket.renderTwoCenterBisectorOccurrence_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (hcard : D.A.card = 11)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (occurrence : TwoCenterBisectorOccurrence)
    (hvalid : occurrence.Valid) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderTwoCenterBisectorOccurrence occurrence) = true := by
  classical
  let firstCenter := occurrence.position occurrence.firstCenter
  let secondCenter := occurrence.position occurrence.secondCenter
  let firstEndpoint := occurrence.position occurrence.firstEndpoint
  let secondEndpoint := occurrence.position occurrence.secondEndpoint
  let leftEndpoint := min firstEndpoint secondEndpoint
  let rightEndpoint := max firstEndpoint secondEndpoint
  let firstEq :=
    twoCenterGlobalEqualityIndex occurrence.firstCenter
      occurrence.firstEndpoint occurrence.secondEndpoint
  let secondEq :=
    twoCenterGlobalEqualityIndex occurrence.secondCenter
      occurrence.firstEndpoint occurrence.secondEndpoint
  unfold TwoCenterBisectorOccurrence.Valid at hvalid
  dsimp only [firstCenter, secondCenter, firstEndpoint, secondEndpoint,
    leftEndpoint, rightEndpoint,
    TwoCenterBisectorOccurrence.position] at hvalid
  obtain ⟨hcenters, hendpoints, hleftFirst, hleftSecond,
      hrightFirst, hrightSecond, hside, hfirstRow, hsecondRow⟩ :=
    hvalid
  unfold renderTwoCenterBisectorOccurrence
  apply evalClauseD_three_negative
  intro hselectorValue hfirstValue hsecondValue
  have horderRange := varOfAtom_order_range occurrence.selector
  rw [P.fullRadiusValuation_eq_fullSourceChoice_of_lt shadow selected
      (by omega) (by omega),
    P.fullSourceChoiceValuation_eq_separation_of_lt shadow (by omega),
    P.separationValuation_selector] at hselectorValue
  have hselector :
      occurrence.selector = P.boundaryOrder.selector :=
    of_decide_eq_true hselectorValue
  rw [P.fullRadiusValuation_globalEquality] at hfirstValue hsecondValue
  have hfirstProp :
      P.globalEqHolds (globalEqRow firstEq) := by
    exact of_decide_eq_true hfirstValue
  have hsecondProp :
      P.globalEqHolds (globalEqRow secondEq) := by
    exact of_decide_eq_true hsecondValue
  have hselectorSource :
      sourceVal P.boundaryOrder
        (varOfAtom (.orderSelector occurrence.selector)) :=
    (sourceVal_order P.boundaryOrder occurrence.selector).mpr hselector
  have hfirstSource :
      sourceVal P.boundaryOrder
        (varOfAtom (.globalEdgeEq firstEq)) := by
    apply (sourceVal_global P.boundaryOrder firstEq).mpr
    simpa [edgeDistance, CanonicalPacket.globalEqHolds] using hfirstProp
  have hsecondSource :
      sourceVal P.boundaryOrder
        (varOfAtom (.globalEdgeEq secondEq)) := by
    apply (sourceVal_global P.boundaryOrder secondEq).mpr
    simpa [edgeDistance, CanonicalPacket.globalEqHolds] using hsecondProp
  have hcyclic : CyclicAlternationSat P.boundaryOrder :=
    cyclicAlternationSat D.convex hcard
      (Card11Labeling.image_pointOf_eq L.toCard11Labeling)
      P.boundaryOrder
  by_cases hcenterOrder : firstCenter < secondCenter
  · have hside' :
        ((firstCenter < leftEndpoint ∧ leftEndpoint < secondCenter) ↔
          (firstCenter < rightEndpoint ∧
            rightEndpoint < secondCenter)) := by
      change
        ((min firstCenter secondCenter < leftEndpoint ∧
            leftEndpoint < max firstCenter secondCenter) ↔
          (min firstCenter secondCenter < rightEndpoint ∧
            rightEndpoint < max firstCenter secondCenter)) at hside
      rw [min_eq_left (le_of_lt hcenterOrder),
        max_eq_right (le_of_lt hcenterOrder)] at hside
      exact hside
    exact (hcyclic occurrence.selector firstEq secondEq
      firstCenter secondCenter leftEndpoint rightEndpoint
      hselectorSource hfirstRow hsecondRow hcenterOrder hendpoints
      hleftFirst hleftSecond hrightFirst hrightSecond hside')
      ⟨hfirstSource, hsecondSource⟩
  · have hreverse : secondCenter < firstCenter :=
      lt_of_le_of_ne (le_of_not_gt hcenterOrder) hcenters.symm
    have hside' :
        ((secondCenter < leftEndpoint ∧ leftEndpoint < firstCenter) ↔
          (secondCenter < rightEndpoint ∧
            rightEndpoint < firstCenter)) := by
      change
        ((min firstCenter secondCenter < leftEndpoint ∧
            leftEndpoint < max firstCenter secondCenter) ↔
          (min firstCenter secondCenter < rightEndpoint ∧
            rightEndpoint < max firstCenter secondCenter)) at hside
      rw [min_eq_right (le_of_lt hreverse),
        max_eq_left (le_of_lt hreverse)] at hside
      exact hside
    exact (hcyclic occurrence.selector secondEq firstEq
      secondCenter firstCenter leftEndpoint rightEndpoint
      hselectorSource hsecondRow hfirstRow hreverse hendpoints
      hleftSecond hleftFirst hrightSecond hrightFirst hside')
      ⟨hsecondSource, hfirstSource⟩

/-- Every signed clause in the retained v7 two-center slice is semantically
satisfied by the total G3 valuation. -/
theorem CanonicalPacket.g3TwoCenterBisectorSlice_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (hcard : D.A.card = 11)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3TwoCenterBisectorSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3TwoCenterBisectorSlice :=
    Array.mem_toList_iff.mp hoccurrence
  exact P.renderTwoCenterBisectorOccurrence_sat hcard shadow selected
    occurrence (g3TwoCenterBisectorSlice_valid occurrence hoccurrenceArray)

/-- Every parsed clause in the retained v7 two-center slice is semantically
satisfied by the total G3 valuation. -/
theorem CanonicalPacket.g3Checkpoint0_twoCenterBisectorSlice_signed_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (hcard : D.A.card = 11)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈
        ((signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedTwoCenterBisectorCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
    (P.fullRadiusValuation shadow selected)
    g3TwoCenterBisectorSlice_perm_checkpoint
    (P.g3TwoCenterBisectorSlice_sat hcard shadow selected)

end ExactFiveCommonShellV7
end Problem97

#print axioms
  Problem97.ExactFiveCommonShellV7.g3TwoCenterBisectorSlice_perm_checkpoint
#print axioms
  Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_twoCenterBisectorSlice_signed_sat
