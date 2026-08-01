/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3PerpendicularBisectorSliceLedger
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.OccurrenceCore

/-!
# Authenticated convex-five exclusion slice of the exact-eleven G3 core

This checkpoint segment retains `8397` clauses from the `332640`-clause
common family excluding the convex five-point metric core. The ledger
reconstructs every manifest boundary order, cyclic start, and increasing
four-offset selection in source order. It authenticates the selector and four
negative global-equality literals against checkpoint zero, then discharges
each clause with the existing convex-five orientation obstruction.
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
set_option maxHeartbeats 0

private def retainedPrefixCount : Nat := 195378
private def retainedConvexFiveCount : Nat := 8397
private def convexFiveClauseCount : Nat := 332640

private def retainedConvexFivePayload : String :=
  include_str "data/g3-convex-five-slice-ordinals.a85"

abbrev ConvexFiveClauseIndex := Fin convexFiveClauseCount

private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if convexFiveClauseCount < candidate then
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
    Nat → Nat → Nat → Array ConvexFiveClauseIndex →
      Option (Array ConvexFiveClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ convexFiveClauseCount then
          let sourceIndex : ConvexFiveClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedConvexFiveIndices :
    Option (Array ConvexFiveClauseIndex) := do
  let bytes ← decodeAscii85 retainedConvexFivePayload
  decodePositiveDeltasAux bytes retainedConvexFiveCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete convex-five family. -/
def g3RetainedConvexFiveIndices : Array ConvexFiveClauseIndex :=
  decodeRetainedConvexFiveIndices.getD #[]

/-- One source occurrence, represented by its manifest selector, cyclic
start, and four positive offsets in the shifted boundary order. -/
structure ConvexFiveOccurrence where
  selector : Fin 144
  start : Label
  xOffset : Label
  bOffset : Label
  cOffset : Label
  yOffset : Label
deriving DecidableEq, Repr

/-- The carrier label at a shifted boundary offset. -/
def convexFiveLabelAt
    (occurrence : ConvexFiveOccurrence) (offset : Label) : Label :=
  (selectorIndexEquiv occurrence.selector).symm (offset + occurrence.start)

/-- Exact source order: manifest selector, cyclic start, then Python's
lexicographic four-combinations of the ten positive offsets. -/
private def encoderConvexFiveOccurrences : List ConvexFiveOccurrence :=
  (List.range 144).flatMap fun selector =>
    (List.range 11).flatMap fun start =>
      (combos 4 (List.range 10)).map fun positions =>
        ⟨Fin.ofNat 144 selector, toLabel start,
          toLabel (positions.getD 0 0 + 1),
          toLabel (positions.getD 1 0 + 1),
          toLabel (positions.getD 2 0 + 1),
          toLabel (positions.getD 3 0 + 1)⟩

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
private theorem encoderConvexFiveOccurrences_length :
    encoderConvexFiveOccurrences.length = convexFiveClauseCount := by
  native_decide

private def convexFiveComboTable : Array (List Nat) :=
  (combos 4 (List.range 10)).toArray

def convexFiveOccurrenceAt
    (index : ConvexFiveClauseIndex) : ConvexFiveOccurrence :=
  let selector := index.val / 2310
  let localIndex := index.val % 2310
  let start := localIndex / 210
  let comboIndex := localIndex % 210
  let positions := convexFiveComboTable[comboIndex]'(by
    have hsize : convexFiveComboTable.size = 210 := by native_decide
    rw [hsize]
    exact Nat.mod_lt _ (by decide))
  ⟨Fin.ofNat 144 selector, toLabel start,
    toLabel (positions.getD 0 0 + 1),
    toLabel (positions.getD 1 0 + 1),
    toLabel (positions.getD 2 0 + 1),
    toLabel (positions.getD 3 0 + 1)⟩

private def convexFiveGlobalEqualityIndex
    (center left right : Label) : Fin 1485 :=
  Fin.ofNat 1485
    (encoderGlobalEqRows.idxOf
      (canonicalGlobalRow
        (canonicalEdge center left) (canonicalEdge center right)))

/-- Render the selector guard and four negative global-equality literals of
one source occurrence. -/
def renderConvexFiveOccurrence
    (occurrence : ConvexFiveOccurrence) : List Int :=
  let a := convexFiveLabelAt occurrence 0
  let x := convexFiveLabelAt occurrence occurrence.xOffset
  let b := convexFiveLabelAt occurrence occurrence.bOffset
  let c := convexFiveLabelAt occurrence occurrence.cOffset
  let y := convexFiveLabelAt occurrence occurrence.yOffset
  [-Int.ofNat (varOfAtom (.orderSelector occurrence.selector)),
    -Int.ofNat
      (encodeG3Var (.globalEquality
        (convexFiveGlobalEqualityIndex x a b))),
    -Int.ofNat
      (encodeG3Var (.globalEquality
        (convexFiveGlobalEqualityIndex y a b))),
    -Int.ofNat
      (encodeG3Var (.globalEquality
        (convexFiveGlobalEqualityIndex c b x))),
    -Int.ofNat
      (encodeG3Var (.globalEquality
        (convexFiveGlobalEqualityIndex c b y)))]

/-- Typed retained convex-five occurrences in checkpoint order. -/
def g3ConvexFiveSlice : Array ConvexFiveOccurrence :=
  g3RetainedConvexFiveIndices.map convexFiveOccurrenceAt

/-- Signed clauses represented by the retained convex-five ledger. -/
def g3ConvexFiveSliceClauses : List (List Int) :=
  g3ConvexFiveSlice.toList.map renderConvexFiveOccurrence

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3ConvexFiveSlice_size :
    g3ConvexFiveSlice.size = retainedConvexFiveCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger corresponds clausewise, up to literal permutation, to the retained convex-five segment
of the parsed G3 checkpoint-zero payload. -/
theorem g3ConvexFiveSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3ConvexFiveSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedConvexFiveCount) := by
  native_decide

/-- Finite facts carried by one retained convex-five occurrence. -/
def ConvexFiveOccurrence.Valid (occurrence : ConvexFiveOccurrence) : Prop :=
  0 < occurrence.xOffset ∧
    occurrence.xOffset < occurrence.bOffset ∧
    occurrence.bOffset < occurrence.cOffset ∧
    occurrence.cOffset < occurrence.yOffset ∧
    globalEqRow
        (convexFiveGlobalEqualityIndex
          (convexFiveLabelAt occurrence occurrence.xOffset)
          (convexFiveLabelAt occurrence 0)
          (convexFiveLabelAt occurrence occurrence.bOffset)) =
      canonicalGlobalRow
        (canonicalEdge
          (convexFiveLabelAt occurrence occurrence.xOffset)
          (convexFiveLabelAt occurrence 0))
        (canonicalEdge
          (convexFiveLabelAt occurrence occurrence.xOffset)
          (convexFiveLabelAt occurrence occurrence.bOffset)) ∧
    globalEqRow
        (convexFiveGlobalEqualityIndex
          (convexFiveLabelAt occurrence occurrence.yOffset)
          (convexFiveLabelAt occurrence 0)
          (convexFiveLabelAt occurrence occurrence.bOffset)) =
      canonicalGlobalRow
        (canonicalEdge
          (convexFiveLabelAt occurrence occurrence.yOffset)
          (convexFiveLabelAt occurrence 0))
        (canonicalEdge
          (convexFiveLabelAt occurrence occurrence.yOffset)
          (convexFiveLabelAt occurrence occurrence.bOffset)) ∧
    globalEqRow
        (convexFiveGlobalEqualityIndex
          (convexFiveLabelAt occurrence occurrence.cOffset)
          (convexFiveLabelAt occurrence occurrence.bOffset)
          (convexFiveLabelAt occurrence occurrence.xOffset)) =
      canonicalGlobalRow
        (canonicalEdge
          (convexFiveLabelAt occurrence occurrence.cOffset)
          (convexFiveLabelAt occurrence occurrence.bOffset))
        (canonicalEdge
          (convexFiveLabelAt occurrence occurrence.cOffset)
          (convexFiveLabelAt occurrence occurrence.xOffset)) ∧
    globalEqRow
        (convexFiveGlobalEqualityIndex
          (convexFiveLabelAt occurrence occurrence.cOffset)
          (convexFiveLabelAt occurrence occurrence.bOffset)
          (convexFiveLabelAt occurrence occurrence.yOffset)) =
      canonicalGlobalRow
        (canonicalEdge
          (convexFiveLabelAt occurrence occurrence.cOffset)
          (convexFiveLabelAt occurrence occurrence.bOffset))
        (canonicalEdge
          (convexFiveLabelAt occurrence occurrence.cOffset)
          (convexFiveLabelAt occurrence occurrence.yOffset))

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- Exhaustive finite audit of the retained offset inequalities. -/
private theorem g3ConvexFiveSlice_all_offsets_valid :
    g3ConvexFiveSlice.toList.all (fun occurrence => decide (
      0 < occurrence.xOffset ∧
        occurrence.xOffset < occurrence.bOffset ∧
        occurrence.bOffset < occurrence.cOffset ∧
        occurrence.cOffset < occurrence.yOffset)) = true := by
  native_decide

private theorem g3ConvexFiveSlice_offsets_valid
    (occurrence : ConvexFiveOccurrence)
    (hoccurrence : occurrence ∈ g3ConvexFiveSlice) :
    0 < occurrence.xOffset ∧
      occurrence.xOffset < occurrence.bOffset ∧
      occurrence.bOffset < occurrence.cOffset ∧
      occurrence.cOffset < occurrence.yOffset := by
  have hall := List.all_eq_true.mp g3ConvexFiveSlice_all_offsets_valid
  exact of_decide_eq_true
    (hall occurrence (Array.mem_toList_iff.mpr hoccurrence))

private theorem convexFiveLabelAt_ne_of_ne
    (occurrence : ConvexFiveOccurrence) {first second : Label}
    (h : first ≠ second) :
    convexFiveLabelAt occurrence first ≠
      convexFiveLabelAt occurrence second := by
  unfold convexFiveLabelAt
  apply (selectorIndexEquiv occurrence.selector).symm.injective.ne
  intro hsum
  exact h (add_right_cancel hsum)

private theorem convexFiveGlobalEqualityIndex_spec
    (center left right : Label)
    (hcenterLeft : center ≠ left)
    (hcenterRight : center ≠ right)
    (hleftRight : left ≠ right) :
    globalEqRow (convexFiveGlobalEqualityIndex center left right) =
      canonicalGlobalRow
        (canonicalEdge center left) (canonicalEdge center right) := by
  let row := canonicalGlobalRow
    (canonicalEdge center left) (canonicalEdge center right)
  have hmem : row ∈ encoderGlobalEqRows :=
    canonicalGlobalStarRow_mem center left right
      hcenterLeft hcenterRight hleftRight
  have hlt : encoderGlobalEqRows.idxOf row < 1485 := by
    simpa [encoderGlobalEqRows_length] using
      (List.idxOf_lt_length_iff.mpr hmem)
  unfold convexFiveGlobalEqualityIndex globalEqRow
  have hindex :
      (Fin.ofNat 1485 (encoderGlobalEqRows.idxOf row)) =
        ⟨encoderGlobalEqRows.idxOf row, hlt⟩ := by
    apply Fin.ext
    simp [Nat.mod_eq_of_lt hlt]
  rw [hindex]
  exact List.idxOf_get hlt

private theorem g3ConvexFiveSlice_valid
    (occurrence : ConvexFiveOccurrence)
    (hoccurrence : occurrence ∈ g3ConvexFiveSlice) :
    occurrence.Valid := by
  obtain ⟨hxpos, hxb, hbc, hcy⟩ :=
    g3ConvexFiveSlice_offsets_valid occurrence hoccurrence
  have labelNe : ∀ {first second : Label}, first ≠ second →
      convexFiveLabelAt occurrence first ≠ convexFiveLabelAt occurrence second :=
    convexFiveLabelAt_ne_of_ne occurrence
  refine ⟨hxpos, hxb, hbc, hcy, ?_, ?_, ?_, ?_⟩
  · exact convexFiveGlobalEqualityIndex_spec _ _ _
      (labelNe (ne_of_gt hxpos))
      (labelNe (ne_of_lt hxb))
      (labelNe (ne_of_lt (lt_trans hxpos hxb)))
  · exact convexFiveGlobalEqualityIndex_spec _ _ _
      (labelNe (ne_of_gt (lt_trans (lt_trans hxpos hxb) (lt_trans hbc hcy))))
      (labelNe (ne_of_gt (lt_trans hbc hcy)))
      (labelNe (ne_of_lt (lt_trans hxpos hxb)))
  · exact convexFiveGlobalEqualityIndex_spec _ _ _
      (labelNe (ne_of_gt hbc))
      (labelNe (ne_of_gt (lt_trans hxb hbc)))
      (labelNe (ne_of_gt hxb))
  · exact convexFiveGlobalEqualityIndex_spec _ _ _
      (labelNe (ne_of_gt hbc))
      (labelNe (ne_of_lt hcy))
      (labelNe (ne_of_lt (lt_trans hbc hcy)))

private theorem evalClauseD_five_negative
    (σ : Nat → Bool) {first second third fourth fifth : Nat}
    (hcontra :
      σ first = true → σ second = true → σ third = true →
        σ fourth = true → σ fifth = true → False) :
    evalClauseD σ
      [-Int.ofNat first, -Int.ofNat second, -Int.ofNat third,
        -Int.ofNat fourth, -Int.ofNat fifth] = true := by
  by_cases hfirst : σ first = true
  · by_cases hsecond : σ second = true
    · by_cases hthird : σ third = true
      · by_cases hfourth : σ fourth = true
        · by_cases hfifth : σ fifth = true
          · exact (hcontra hfirst hsecond hthird hfourth hfifth).elim
          · have hfifthFalse := Bool.eq_false_of_not_eq_true hfifth
            simp [evalClauseD, evalLitD, hfifthFalse]
        · have hfourthFalse := Bool.eq_false_of_not_eq_true hfourth
          simp [evalClauseD, evalLitD, hfourthFalse]
      · have hthirdFalse := Bool.eq_false_of_not_eq_true hthird
        simp [evalClauseD, evalLitD, hthirdFalse]
    · have hsecondFalse := Bool.eq_false_of_not_eq_true hsecond
      simp [evalClauseD, evalLitD, hsecondFalse]
  · have hfirstFalse := Bool.eq_false_of_not_eq_true hfirst
    simp [evalClauseD, evalLitD, hfirstFalse]

/-- Direct negative-orientation wrapper for the banked convex-five metric
obstruction. -/
private theorem convexFiveMetricIncompatibilityOfNeg
    {a x b c y : ℝ²} (hab : a ≠ b) (hxy : x ≠ y)
    (hxa : dist x a = dist x b) (hya : dist y a = dist y b)
    (hcbx : dist c b = dist c x) (hcby : dist c b = dist c y)
    (haxb : signedArea2 a x b < 0)
    (hbcy : signedArea2 b c y < 0) : False := by
  open Census554.EqualityCore in
    apply Census554.ConvexFivePointCore.metric_orientation_incompatibility
      (a := reflectXAxis a) (x := reflectXAxis x) (b := reflectXAxis b)
      (c := reflectXAxis c) (y := reflectXAxis y)
      (reflectXAxis_injective.ne hab) (reflectXAxis_injective.ne hxy)
  · simpa only [Census554.EqualityCore.dist_reflectXAxis] using hxa
  · simpa only [Census554.EqualityCore.dist_reflectXAxis] using hya
  · simpa only [Census554.EqualityCore.dist_reflectXAxis] using hcbx
  · simpa only [Census554.EqualityCore.dist_reflectXAxis] using hcby
  · rw [Census554.EqualityCore.signedArea2_reflectXAxis]
    linarith
  · rw [Census554.EqualityCore.signedArea2_reflectXAxis]
    linarith

/-- Every retained convex-five source occurrence is satisfied by the total
G3 valuation. -/
theorem CanonicalPacket.renderConvexFiveOccurrence_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (occurrence : ConvexFiveOccurrence)
    (hvalid : occurrence.Valid) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderConvexFiveOccurrence occurrence) = true := by
  classical
  let a := convexFiveLabelAt occurrence 0
  let x := convexFiveLabelAt occurrence occurrence.xOffset
  let b := convexFiveLabelAt occurrence occurrence.bOffset
  let c := convexFiveLabelAt occurrence occurrence.cOffset
  let y := convexFiveLabelAt occurrence occurrence.yOffset
  obtain ⟨hxpos, hxb, hbc, hcy, hxaRow, hyaRow, hcbxRow, hcbyRow⟩ :=
    hvalid
  unfold renderConvexFiveOccurrence
  apply evalClauseD_five_negative
  intro hselectorValue hxaValue hyaValue hcbxValue hcbyValue
  have horderRange := varOfAtom_order_range occurrence.selector
  rw [P.fullRadiusValuation_eq_fullSourceChoice_of_lt shadow selected
      (by omega) (by omega),
    P.fullSourceChoiceValuation_eq_separation_of_lt shadow (by omega),
    P.separationValuation_selector] at hselectorValue
  have hselector :
      occurrence.selector = P.boundaryOrder.selector :=
    of_decide_eq_true hselectorValue
  rw [P.fullRadiusValuation_globalEquality] at hxaValue hyaValue
  rw [P.fullRadiusValuation_globalEquality] at hcbxValue hcbyValue
  have hxaProp :
      P.globalEqHolds
        (globalEqRow
          (convexFiveGlobalEqualityIndex x a b)) :=
    of_decide_eq_true hxaValue
  have hyaProp :
      P.globalEqHolds
        (globalEqRow
          (convexFiveGlobalEqualityIndex y a b)) :=
    of_decide_eq_true hyaValue
  have hcbxProp :
      P.globalEqHolds
        (globalEqRow
          (convexFiveGlobalEqualityIndex c b x)) :=
    of_decide_eq_true hcbxValue
  have hcbyProp :
      P.globalEqHolds
        (globalEqRow
          (convexFiveGlobalEqualityIndex c b y)) :=
    of_decide_eq_true hcbyValue
  rw [hxaRow] at hxaProp
  rw [hyaRow] at hyaProp
  rw [hcbxRow] at hcbxProp
  rw [hcbyRow] at hcbyProp
  have hxaDist :
      dist (L.pointOf x) (L.pointOf a) =
        dist (L.pointOf x) (L.pointOf b) :=
    (P.globalEqHolds_canonicalStar_iff x a b).mp hxaProp
  have hyaDist :
      dist (L.pointOf y) (L.pointOf a) =
        dist (L.pointOf y) (L.pointOf b) :=
    (P.globalEqHolds_canonicalStar_iff y a b).mp hyaProp
  have hcbxDist :
      dist (L.pointOf c) (L.pointOf b) =
        dist (L.pointOf c) (L.pointOf x) :=
    (P.globalEqHolds_canonicalStar_iff c b x).mp hcbxProp
  have hcbyDist :
      dist (L.pointOf c) (L.pointOf b) =
        dist (L.pointOf c) (L.pointOf y) :=
    (P.globalEqHolds_canonicalStar_iff c b y).mp hcbyProp
  let shiftedBoundary := fun offset : Label =>
    P.boundaryOrder.boundary (offset + occurrence.start)
  have hshiftedInjective : Function.Injective shiftedBoundary :=
    injective_cyclicShift P.boundaryOrder.boundary_injective occurrence.start
  have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shiftedBoundary :=
    isCcwConvexPolygon_cyclicShift
      P.boundaryOrder.boundary_injective
      P.boundaryOrder.boundary_ccw occurrence.start
  have hpoint (offset : Label) :
      L.pointOf (convexFiveLabelAt occurrence offset) =
        shiftedBoundary offset := by
    rw [← P.boundaryOrder.point_eq
      (convexFiveLabelAt occurrence offset)]
    simp only [shiftedBoundary, convexFiveLabelAt, hselector,
      Equiv.apply_symm_apply]
  have hab :
      L.pointOf a ≠ L.pointOf b := by
    rw [hpoint 0, hpoint occurrence.bOffset]
    exact hshiftedInjective.ne (ne_of_lt (hxpos.trans hxb))
  have hxy :
      L.pointOf x ≠ L.pointOf y := by
    rw [hpoint occurrence.xOffset, hpoint occurrence.yOffset]
    exact hshiftedInjective.ne
      (ne_of_lt (hxb.trans (hbc.trans hcy)))
  have haxb :
      signedArea2 (L.pointOf a) (L.pointOf x) (L.pointOf b) < 0 := by
    rw [hpoint 0, hpoint occurrence.xOffset,
      hpoint occurrence.bOffset]
    exact hneg_of_ccw hshiftedInjective hshiftedCcw hxpos hxb
  have hbcy :
      signedArea2 (L.pointOf b) (L.pointOf c) (L.pointOf y) < 0 := by
    rw [hpoint occurrence.bOffset, hpoint occurrence.cOffset,
      hpoint occurrence.yOffset]
    exact hneg_of_ccw hshiftedInjective hshiftedCcw hbc hcy
  exact convexFiveMetricIncompatibilityOfNeg
    hab hxy hxaDist hyaDist hcbxDist hcbyDist haxb hbcy

/-- Every clause in the retained convex-five slice is satisfied. -/
theorem CanonicalPacket.g3ConvexFiveSlice_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3ConvexFiveSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3ConvexFiveSlice :=
    Array.mem_toList_iff.mp hoccurrence
  exact P.renderConvexFiveOccurrence_sat shadow selected occurrence
    (g3ConvexFiveSlice_valid occurrence hoccurrenceArray)

/-- Signed-clause form of the authenticated convex-five result. -/
theorem CanonicalPacket.g3Checkpoint0_convexFiveSlice_signed_sat
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
          retainedPrefixCount).take retainedConvexFiveCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
    (P.fullRadiusValuation shadow selected)
    g3ConvexFiveSlice_perm_checkpoint
    (P.g3ConvexFiveSlice_sat shadow selected)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3ConvexFiveSlice_size
#print axioms Problem97.ExactFiveCommonShellV7.g3ConvexFiveSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderConvexFiveOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3ConvexFiveSlice_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_convexFiveSlice_signed_sat
