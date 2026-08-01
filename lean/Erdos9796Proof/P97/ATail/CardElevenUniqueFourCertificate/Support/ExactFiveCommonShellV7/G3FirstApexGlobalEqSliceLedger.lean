/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3SelectedGlobalEqSliceLedger

/-!
# Authenticated first-apex global-equality seeds of the exact-eleven G3 core

This checkpoint segment retains `22` of the `30` guarded clauses asserting
the ten pairwise global edge equalities in each named first-apex shell.  The
ledger reconstructs source-position-first order followed by routes
`.s2_o9`, `.s3_o0`, `.s3_o9`, authenticates checkpoint zero, and proves the
clauses from exact shell membership.
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

private def retainedPrefixCount : Nat := 193349
private def retainedFirstApexGlobalEqCount : Nat := 22
private def firstApexGlobalEqClauseCount : Nat := 30

private def retainedFirstApexGlobalEqPayload : String :=
  include_str "data/g3-first-apex-global-eq-slice-ordinals.a85"

abbrev FirstApexGlobalEqClauseIndex := Fin firstApexGlobalEqClauseCount

private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if firstApexGlobalEqClauseCount < candidate then
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
    Nat → Nat → Nat → Array FirstApexGlobalEqClauseIndex →
      Option (Array FirstApexGlobalEqClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ firstApexGlobalEqClauseCount then
          let sourceIndex : FirstApexGlobalEqClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedFirstApexGlobalEqIndices :
    Option (Array FirstApexGlobalEqClauseIndex) := do
  let bytes ← decodeAscii85 retainedFirstApexGlobalEqPayload
  decodePositiveDeltasAux bytes retainedFirstApexGlobalEqCount 0 0 #[]

/-- Authenticated zero-based family ordinals. -/
def g3RetainedFirstApexGlobalEqIndices :
    Array FirstApexGlobalEqClauseIndex :=
  decodeRetainedFirstApexGlobalEqIndices.getD #[]

/-- One route-guarded equality between two edges incident to apex label `1`. -/
structure FirstApexGlobalEqOccurrence where
  route : G3Case
  left : Label
  right : Label
deriving DecidableEq, Repr

private def encoderG3Routes : List G3Case :=
  [.s2_o9, .s3_o0, .s3_o9]

private def firstApexGlobalEqSupport (route : G3Case) : List Nat :=
  (List.range 11).filter fun label =>
    toLabel label ∈ route.shellCase.support

private def firstApexGlobalEqPairs (route : G3Case) : List (Label × Label) :=
  (combos 2 (firstApexGlobalEqSupport route)).map fun pair =>
    (toLabel (pair.getD 0 0), toLabel (pair.getD 1 0))

private def firstApexGlobalEqPairAt
    (route : G3Case) (position : Nat) : Label × Label :=
  (firstApexGlobalEqPairs route).getD position (0, 0)

/-- Exact source order: shell-pair position first, then the three routes. -/
def encoderFirstApexGlobalEqOccurrences :
    List FirstApexGlobalEqOccurrence :=
  (List.range 10).flatMap fun position =>
    encoderG3Routes.map fun route =>
      let pair := firstApexGlobalEqPairAt route position
      ⟨route, pair.1, pair.2⟩

set_option linter.style.nativeDecide false in
theorem encoderFirstApexGlobalEqOccurrences_length :
    encoderFirstApexGlobalEqOccurrences.length =
      firstApexGlobalEqClauseCount := by
  native_decide

def firstApexGlobalEqOccurrenceArray :
    Array FirstApexGlobalEqOccurrence :=
  encoderFirstApexGlobalEqOccurrences.toArray

def firstApexGlobalEqOccurrenceAt
    (index : FirstApexGlobalEqClauseIndex) :
    FirstApexGlobalEqOccurrence :=
  firstApexGlobalEqOccurrenceArray[index.val]'(by
    simpa [firstApexGlobalEqOccurrenceArray,
      encoderFirstApexGlobalEqOccurrences_length] using index.isLt)

/-- Encoder index of a first-apex global edge-equality atom. -/
def firstApexGlobalEqualityIndex
    (left right : Label) : Fin 1485 :=
  Fin.ofNat 1485
    (encoderGlobalEqRows.idxOf
      (canonicalEdge 1 left, canonicalEdge 1 right))

/-- Unguarded positive first-apex global-equality unit clause. -/
def firstApexGlobalEqUnit (left right : Label) : List Int :=
  [Int.ofNat
    (encodeG3Var (.globalEquality
      (firstApexGlobalEqualityIndex left right)))]

/-- Render one guarded positive global-equality unit. -/
def renderFirstApexGlobalEqOccurrence
    (occurrence : FirstApexGlobalEqOccurrence) : List Int :=
  g3GuardedClause occurrence.route
    (firstApexGlobalEqUnit occurrence.left occurrence.right)

/-- Typed retained occurrences in checkpoint order. -/
def g3FirstApexGlobalEqSlice : Array FirstApexGlobalEqOccurrence :=
  g3RetainedFirstApexGlobalEqIndices.map firstApexGlobalEqOccurrenceAt

/-- Signed clauses represented by the retained ledger. -/
def g3FirstApexGlobalEqSliceClauses : List (List Int) :=
  g3FirstApexGlobalEqSlice.toList.map renderFirstApexGlobalEqOccurrence

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3FirstApexGlobalEqSlice_size :
    g3FirstApexGlobalEqSlice.size = retainedFirstApexGlobalEqCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The ledger corresponds clausewise, up to literal permutation, to the retained first-apex global-equality
checkpoint segment. -/
theorem g3FirstApexGlobalEqSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3FirstApexGlobalEqSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedFirstApexGlobalEqCount) := by
  native_decide

theorem firstApexGlobalEqOccurrenceAt_valid :
    ∀ index : FirstApexGlobalEqClauseIndex,
      let occurrence := firstApexGlobalEqOccurrenceAt index
      occurrence.left ∈ occurrence.route.shellCase.support ∧
        occurrence.right ∈ occurrence.route.shellCase.support ∧
        globalEqRow
            (firstApexGlobalEqualityIndex
              occurrence.left occurrence.right) =
          (canonicalEdge 1 occurrence.left,
            canonicalEdge 1 occurrence.right) := by
  native_decide

/-- Two first-apex shell edges have equal global edge length. -/
theorem CanonicalPacket.globalEqHolds_one_of_shell
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) {left right : Label}
    (hleft : left ∈ P.shellLabels)
    (hright : right ∈ P.shellLabels) :
    P.globalEqHolds
      (canonicalEdge 1 left, canonicalEdge 1 right) := by
  have hlocal : P.localEqHolds ⟨1, left, right⟩ := by
    unfold CanonicalPacket.localEqHolds
    calc
      dist (L.pointOf 1) (L.pointOf left) =
          dist (L.pointOf left) (L.pointOf 1) := dist_comm _ _
      _ = P.shellRadius := (P.shellLabels_iff_radius left).mp hleft
      _ = dist (L.pointOf right) (L.pointOf 1) :=
        ((P.shellLabels_iff_radius right).mp hright).symm
      _ = dist (L.pointOf 1) (L.pointOf right) := dist_comm _ _
  change
    edgeDistance L.pointOf (canonicalEdge 1 left) =
      edgeDistance L.pointOf (canonicalEdge 1 right)
  rw [edgeDistance_canonicalEdge, edgeDistance_canonicalEdge]
  exact hlocal

/-- Every source occurrence is satisfied when the packet shell agrees with
the selected G3 route. -/
theorem CanonicalPacket.renderFirstApexGlobalEqOccurrence_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hShellCase : P.shellCase = selected.shellCase)
    (index : FirstApexGlobalEqClauseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderFirstApexGlobalEqOccurrence
        (firstApexGlobalEqOccurrenceAt index)) = true := by
  let occurrence := firstApexGlobalEqOccurrenceAt index
  obtain ⟨hleft, hright, hrow⟩ :=
    firstApexGlobalEqOccurrenceAt_valid index
  change
    evalClauseD (P.fullRadiusValuation shadow selected)
      (g3GuardedClause occurrence.route
        (firstApexGlobalEqUnit occurrence.left occurrence.right)) = true
  apply P.fullRadiusGuardedClause_sat shadow
  intro hroute
  have hcase : P.shellCase = occurrence.route.shellCase := by
    simpa [hroute] using hShellCase
  have hleft' : occurrence.left ∈ P.shellLabels := by
    rw [P.shellLabels_eq, hcase]
    exact hleft
  have hright' : occurrence.right ∈ P.shellLabels := by
    rw [P.shellLabels_eq, hcase]
    exact hright
  have hglobal :
      P.globalEqHolds
        (globalEqRow
          (firstApexGlobalEqualityIndex
            occurrence.left occurrence.right)) := by
    rw [hrow]
    exact P.globalEqHolds_one_of_shell hleft' hright'
  unfold firstApexGlobalEqUnit evalClauseD
  simp [evalLitD, P.fullRadiusValuation_globalEquality, hglobal]
  exact encodeG3Var_pos _

/-- Every retained first-apex global-equality seed is satisfied. -/
theorem CanonicalPacket.g3FirstApexGlobalEqSlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hShellCase : P.shellCase = selected.shellCase) :
    ∀ clause ∈ g3FirstApexGlobalEqSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3FirstApexGlobalEqSlice :=
    Array.mem_toList_iff.mp hoccurrence
  rw [g3FirstApexGlobalEqSlice] at hoccurrenceArray
  obtain ⟨index, _hindex, rfl⟩ := Array.mem_map.mp hoccurrenceArray
  exact P.renderFirstApexGlobalEqOccurrence_sat
    shadow selected hShellCase index

/-- Signed-clause form of the authenticated result. -/
theorem CanonicalPacket.g3Checkpoint0_firstApexGlobalEqSlice_signed_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hShellCase : P.shellCase = selected.shellCase) :
    ∀ clause ∈
        ((signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedFirstApexGlobalEqCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
    (P.fullRadiusValuation shadow selected)
    g3FirstApexGlobalEqSlice_perm_checkpoint
    (P.g3FirstApexGlobalEqSlice_sat shadow selected hShellCase)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3FirstApexGlobalEqSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderFirstApexGlobalEqOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_firstApexGlobalEqSlice_signed_sat
