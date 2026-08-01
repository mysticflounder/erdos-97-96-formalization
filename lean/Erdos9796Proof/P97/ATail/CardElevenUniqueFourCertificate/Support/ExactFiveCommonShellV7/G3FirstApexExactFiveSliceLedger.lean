/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3NoQFreeSliceLedger

/-!
# Authenticated retained first-apex exact-five slice of the exact-eleven G3 core

The ninth checkpoint segment contains `89` retained clauses from the `105`
route-guarded clauses saying that the named shell at apex label `1` is its
entire exact five-point radius class.  This file decodes the family ordinals,
reconstructs each typed occurrence in source order, authenticates its rendering
against checkpoint zero, and discharges it from the packet's exact-shell
equivalence plus the generic G3 selector guard.
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

private def retainedPrefixCount : Nat := 174340
private def retainedFirstApexExactFiveCount : Nat := 89
private def firstApexExactFiveClauseCount : Nat := 105

private def retainedFirstApexExactFivePayload : String :=
  include_str "data/g3-first-apex-exact-five-slice-ordinals.a85"

abbrev FirstApexExactFiveClauseIndex :=
  Fin firstApexExactFiveClauseCount

/-- Read one canonical positive LEB128 value from a byte array. -/
private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if firstApexExactFiveClauseCount < candidate then
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
    Nat → Nat → Nat → Array FirstApexExactFiveClauseIndex →
      Option (Array FirstApexExactFiveClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ firstApexExactFiveClauseCount then
          let familyIndex : FirstApexExactFiveClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push familyIndex)
        else
          none
      else
        none

private def decodeRetainedFirstApexExactFiveIndices :
    Option (Array FirstApexExactFiveClauseIndex) := do
  let bytes ← decodeAscii85 retainedFirstApexExactFivePayload
  decodePositiveDeltasAux bytes retainedFirstApexExactFiveCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete guarded family. -/
def g3RetainedFirstApexExactFiveIndices :
    Array FirstApexExactFiveClauseIndex :=
  decodeRetainedFirstApexExactFiveIndices.getD #[]

inductive FirstApexExactFiveKind
  | equality (left right : Label)
  | exclusion (inside outside : Label)
deriving DecidableEq, Repr

/-- One guarded exact-five clause occurrence. -/
structure FirstApexExactFiveOccurrence where
  route : G3Case
  kind : FirstApexExactFiveKind
deriving DecidableEq, Repr

private def encoderG3Routes : List G3Case :=
  [.s2_o9, .s3_o0, .s3_o9]

private def firstApexExactFiveSupport (route : G3Case) : List Label :=
  ((List.range 11).filter fun label =>
      toLabel label ∈ route.shellCase.support).map toLabel

private def firstApexExactFiveOutside (route : G3Case) : List Label :=
  ((List.range 11).filter fun label =>
      label != 1 && toLabel label ∉ route.shellCase.support).map toLabel

private def firstApexExactFivePairs (route : G3Case) :
    List FirstApexExactFiveKind :=
  (firstApexExactFiveSupport route).flatMap fun left =>
    ((firstApexExactFiveSupport route).filter fun right =>
        left.val < right.val).map fun right =>
      .equality left right

private def firstApexExactFiveExclusions (route : G3Case) :
    List FirstApexExactFiveKind :=
  (firstApexExactFiveSupport route).flatMap fun inside =>
    (firstApexExactFiveOutside route).map fun outside =>
      .exclusion inside outside

private def firstApexExactFiveKinds (route : G3Case) :
    List FirstApexExactFiveKind :=
  firstApexExactFivePairs route ++ firstApexExactFiveExclusions route

private def firstApexExactFiveKindAt
    (route : G3Case) (position : Nat) : FirstApexExactFiveKind :=
  (firstApexExactFiveKinds route).getD position (.equality 0 0)

/-- Exact generator order: source position first, then the three G3 routes. -/
def encoderFirstApexExactFiveOccurrences :
    List FirstApexExactFiveOccurrence :=
  (List.range 35).flatMap fun position =>
    encoderG3Routes.map fun route =>
      ⟨route, firstApexExactFiveKindAt route position⟩

set_option linter.style.nativeDecide false in
theorem encoderFirstApexExactFiveOccurrences_length :
    encoderFirstApexExactFiveOccurrences.length =
      firstApexExactFiveClauseCount := by
  native_decide

def firstApexExactFiveOccurrenceArray :
    Array FirstApexExactFiveOccurrence :=
  encoderFirstApexExactFiveOccurrences.toArray

def firstApexExactFiveOccurrenceAt
    (index : FirstApexExactFiveClauseIndex) :
    FirstApexExactFiveOccurrence :=
  firstApexExactFiveOccurrenceArray[index.val]'(by
    simpa [firstApexExactFiveOccurrenceArray,
      encoderFirstApexExactFiveOccurrences_length] using index.isLt)

/-- Canonical local-equality row for two first-apex incident labels. -/
def canonicalFirstApexLocalEqRow
    (left right : Label) : LocalEqRow :=
  if left.val < right.val then
    ⟨1, left, right⟩
  else
    ⟨1, right, left⟩

/-- Encoder index of the first-apex local-equality atom. -/
def firstApexLocalEqualityIndex
    (left right : Label) : Fin 495 :=
  Fin.ofNat 495
    (encoderLocalEqRows.idxOf
      (canonicalFirstApexLocalEqRow left right))

/-- Unguarded payload for one exact-five first-apex shell clause. -/
def firstApexExactFivePayload :
    FirstApexExactFiveKind → List Int
  | .equality left right =>
      [Int.ofNat
        (encodeG3Var (.localEquality
          (firstApexLocalEqualityIndex left right)))]
  | .exclusion inside outside =>
      [-Int.ofNat
        (encodeG3Var (.localEquality
          (firstApexLocalEqualityIndex inside outside)))]

/-- Render one guarded first-apex exact-five occurrence. -/
def renderFirstApexExactFiveOccurrence
    (occurrence : FirstApexExactFiveOccurrence) : List Int :=
  g3GuardedClause occurrence.route
    (firstApexExactFivePayload occurrence.kind)

/-- Typed retained occurrences in checkpoint order. -/
def g3FirstApexExactFiveSlice :
    Array FirstApexExactFiveOccurrence :=
  g3RetainedFirstApexExactFiveIndices.map
    firstApexExactFiveOccurrenceAt

/-- Signed clauses represented by the retained ledger. -/
def g3FirstApexExactFiveSliceClauses : List (List Int) :=
  g3FirstApexExactFiveSlice.toList.map
    renderFirstApexExactFiveOccurrence

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3RetainedFirstApexExactFiveIndices_size :
    g3RetainedFirstApexExactFiveIndices.size =
      retainedFirstApexExactFiveCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3FirstApexExactFiveSlice_size :
    g3FirstApexExactFiveSlice.size =
      retainedFirstApexExactFiveCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger corresponds clausewise, up to literal permutation, to the retained guarded segment of the
parsed G3 checkpoint-zero payload. -/
theorem g3FirstApexExactFiveSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3FirstApexExactFiveSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take
            retainedFirstApexExactFiveCount) := by
  native_decide

private def firstApexExactFiveOccurrenceAtValid
    (index : FirstApexExactFiveClauseIndex) : Prop :=
  let occurrence := firstApexExactFiveOccurrenceAt index
  match occurrence.kind with
  | .equality left right =>
      left ∈ occurrence.route.shellCase.support ∧
      right ∈ occurrence.route.shellCase.support ∧
      (localEqRow (firstApexLocalEqualityIndex left right) =
          ⟨1, left, right⟩ ∨
        localEqRow (firstApexLocalEqualityIndex left right) =
          ⟨1, right, left⟩)
  | .exclusion inside outside =>
      inside ∈ occurrence.route.shellCase.support ∧
      outside ∉ occurrence.route.shellCase.support ∧
      (localEqRow (firstApexLocalEqualityIndex inside outside) =
          ⟨1, inside, outside⟩ ∨
        localEqRow (firstApexLocalEqualityIndex inside outside) =
          ⟨1, outside, inside⟩)

private instance (index : FirstApexExactFiveClauseIndex) :
    Decidable (firstApexExactFiveOccurrenceAtValid index) := by
  unfold firstApexExactFiveOccurrenceAtValid
  cases firstApexExactFiveOccurrenceAt index with
  | mk route kind =>
      cases kind <;> infer_instance

/-- Exhaustive finite audit of shell membership and local-atom decoding. -/
theorem firstApexExactFiveOccurrenceAt_valid :
    ∀ index : FirstApexExactFiveClauseIndex,
      let occurrence := firstApexExactFiveOccurrenceAt index
      match occurrence.kind with
      | .equality left right =>
          left ∈ occurrence.route.shellCase.support ∧
          right ∈ occurrence.route.shellCase.support ∧
          (localEqRow (firstApexLocalEqualityIndex left right) =
              ⟨1, left, right⟩ ∨
            localEqRow (firstApexLocalEqualityIndex left right) =
              ⟨1, right, left⟩)
      | .exclusion inside outside =>
          inside ∈ occurrence.route.shellCase.support ∧
          outside ∉ occurrence.route.shellCase.support ∧
          (localEqRow (firstApexLocalEqualityIndex inside outside) =
              ⟨1, inside, outside⟩ ∨
            localEqRow (firstApexLocalEqualityIndex inside outside) =
              ⟨1, outside, inside⟩) := by
  change ∀ index : FirstApexExactFiveClauseIndex,
    firstApexExactFiveOccurrenceAtValid index
  native_decide

/-- Two labels in the named first-apex shell have equal local radii. -/
theorem CanonicalPacket.localEqHolds_one_of_shell
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) {left right : Label}
    (hleft : left ∈ P.shellLabels)
    (hright : right ∈ P.shellLabels) :
    P.localEqHolds ⟨1, left, right⟩ := by
  unfold CanonicalPacket.localEqHolds
  calc
    dist (L.pointOf 1) (L.pointOf left) =
        dist (L.pointOf left) (L.pointOf 1) := dist_comm _ _
    _ = P.shellRadius := (P.shellLabels_iff_radius left).mp hleft
    _ = dist (L.pointOf right) (L.pointOf 1) :=
      ((P.shellLabels_iff_radius right).mp hright).symm
    _ = dist (L.pointOf 1) (L.pointOf right) := dist_comm _ _

/-- A shell label and a label outside the named shell have unequal local radii. -/
theorem CanonicalPacket.not_localEqHolds_one_of_shell_outside
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) {inside outside : Label}
    (hinside : inside ∈ P.shellLabels)
    (houtside : outside ∉ P.shellLabels) :
    ¬ P.localEqHolds ⟨1, inside, outside⟩ := by
  intro heq
  apply houtside
  apply (P.shellLabels_iff_radius outside).mpr
  calc
    dist (L.pointOf outside) (L.pointOf 1) =
        dist (L.pointOf 1) (L.pointOf outside) := dist_comm _ _
    _ = dist (L.pointOf 1) (L.pointOf inside) := heq.symm
    _ = dist (L.pointOf inside) (L.pointOf 1) := dist_comm _ _
    _ = P.shellRadius := (P.shellLabels_iff_radius inside).mp hinside

/-- Every occurrence in the complete guarded family is satisfied by the total
G3 valuation when the packet shell agrees with the selected route. -/
theorem CanonicalPacket.renderFirstApexExactFiveOccurrence_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hShellCase : P.shellCase = selected.shellCase)
    (index : FirstApexExactFiveClauseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderFirstApexExactFiveOccurrence
        (firstApexExactFiveOccurrenceAt index)) = true := by
  let occurrence := firstApexExactFiveOccurrenceAt index
  have hvalid :
      match occurrence.kind with
      | .equality left right =>
          left ∈ occurrence.route.shellCase.support ∧
          right ∈ occurrence.route.shellCase.support ∧
          (localEqRow (firstApexLocalEqualityIndex left right) =
              ⟨1, left, right⟩ ∨
            localEqRow (firstApexLocalEqualityIndex left right) =
              ⟨1, right, left⟩)
      | .exclusion inside outside =>
          inside ∈ occurrence.route.shellCase.support ∧
          outside ∉ occurrence.route.shellCase.support ∧
          (localEqRow (firstApexLocalEqualityIndex inside outside) =
              ⟨1, inside, outside⟩ ∨
            localEqRow (firstApexLocalEqualityIndex inside outside) =
              ⟨1, outside, inside⟩) := by
    simpa [occurrence] using firstApexExactFiveOccurrenceAt_valid index
  change
    evalClauseD (P.fullRadiusValuation shadow selected)
      (g3GuardedClause occurrence.route
        (firstApexExactFivePayload occurrence.kind)) = true
  apply P.fullRadiusGuardedClause_sat shadow
  intro hroute
  have hcase : P.shellCase = occurrence.route.shellCase := by
    simpa [hroute] using hShellCase
  cases hkind : occurrence.kind with
  | equality left right =>
      rw [hkind] at hvalid
      obtain ⟨hleft, hright, hrow⟩ := hvalid
      have hleft' : left ∈ P.shellLabels := by
        rw [P.shellLabels_eq, hcase]
        exact hleft
      have hright' : right ∈ P.shellLabels := by
        rw [P.shellLabels_eq, hcase]
        exact hright
      have hlocal :
          P.localEqHolds
            (localEqRow (firstApexLocalEqualityIndex left right)) := by
        rcases hrow with hrow | hrow
        · rw [hrow]
          exact P.localEqHolds_one_of_shell hleft' hright'
        · rw [hrow]
          exact P.localEqHolds_one_of_shell hright' hleft'
      simp [firstApexExactFivePayload, evalClauseD]
      simp [evalLitD, encodeG3Var_pos,
        P.fullRadiusValuation_localEquality, hlocal]
  | exclusion inside outside =>
      rw [hkind] at hvalid
      obtain ⟨hinside, houtside, hrow⟩ := hvalid
      have hinside' : inside ∈ P.shellLabels := by
        rw [P.shellLabels_eq, hcase]
        exact hinside
      have houtside' : outside ∉ P.shellLabels := by
        rw [P.shellLabels_eq, hcase]
        exact houtside
      have hnot :
          ¬ P.localEqHolds
            (localEqRow
              (firstApexLocalEqualityIndex inside outside)) := by
        rcases hrow with hrow | hrow
        · rw [hrow]
          exact P.not_localEqHolds_one_of_shell_outside hinside' houtside'
        · rw [hrow]
          intro heq
          exact P.not_localEqHolds_one_of_shell_outside
            hinside' houtside' heq.symm
      simp [firstApexExactFivePayload, evalClauseD]
      simp [evalLitD, encodeG3Var_pos,
        P.fullRadiusValuation_localEquality, hnot]

/-- Every clause in the retained guarded slice is satisfied. -/
theorem CanonicalPacket.g3FirstApexExactFiveSlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hShellCase : P.shellCase = selected.shellCase) :
    ∀ clause ∈ g3FirstApexExactFiveSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3FirstApexExactFiveSlice :=
    Array.mem_toList_iff.mp hoccurrence
  rw [g3FirstApexExactFiveSlice] at hoccurrenceArray
  obtain ⟨index, _hindex, rfl⟩ := Array.mem_map.mp hoccurrenceArray
  exact P.renderFirstApexExactFiveOccurrence_sat
    shadow selected hShellCase index

/-- Signed-clause form of the authenticated first-apex exact-five result. -/
theorem CanonicalPacket.g3Checkpoint0_firstApexExactFiveSlice_signed_sat
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
          retainedPrefixCount).take retainedFirstApexExactFiveCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
    (P.fullRadiusValuation shadow selected)
    g3FirstApexExactFiveSlice_perm_checkpoint
    (P.g3FirstApexExactFiveSlice_sat shadow selected hShellCase)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3FirstApexExactFiveSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderFirstApexExactFiveOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_firstApexExactFiveSlice_signed_sat
