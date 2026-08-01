/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3SourceCenterSliceLedger

/-!
# Authenticated retained used-center slice of the exact-eleven G3 core

The seventh checkpoint segment contains `21` retained clauses from the
`103`-clause Tseitin family equating each used-center atom with the disjunction
of source-center atoms mapped to that center.  This file decodes the family
ordinals, reconstructs each typed forward or reverse occurrence, authenticates
the rendering against checkpoint zero, and proves every retained clause from
the source-indexed shadow semantics.

The reverse implication explicitly carries the two common-center facts for
sources `6` and `7`.  Those facts are load-bearing because the encoder had
already restricted both source domains to center `8`.
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

private def retainedPrefixCount : Nat := 168810
private def retainedUsedCenterCount : Nat := 21
private def usedCenterClauseCount : Nat := 103

private def retainedUsedCenterPayload : String :=
  include_str "data/g3-used-center-slice-ordinals.a85"

abbrev UsedCenterClauseIndex := Fin usedCenterClauseCount

/-- Read one canonical positive LEB128 value from a byte array. -/
private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if usedCenterClauseCount < candidate then
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
    Nat → Nat → Nat → Array UsedCenterClauseIndex →
      Option (Array UsedCenterClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ usedCenterClauseCount then
          let usedIndex : UsedCenterClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push usedIndex)
        else
          none
      else
        none

private def decodeRetainedUsedCenterIndices :
    Option (Array UsedCenterClauseIndex) := do
  let bytes ← decodeAscii85 retainedUsedCenterPayload
  decodePositiveDeltasAux bytes retainedUsedCenterCount 0 0 #[]

/-- Authenticated zero-based ordinals in the complete used-center family. -/
def g3RetainedUsedCenterIndices : Array UsedCenterClauseIndex :=
  decodeRetainedUsedCenterIndices.getD #[]

/-- Source-center rows mapped to one fixed center, in generator order. -/
private def usedCenterSourceRows (center : Label) : List (Fin 92) :=
  (List.finRange 92).filter fun sourceCenter =>
    (sourceCenterRow sourceCenter).center = center

/-- One occurrence in the exact used-center Tseitin family. -/
inductive UsedCenterOccurrence where
  | forward (center : Label) (sourceCenter : Fin 92)
  | reverse (center : Label)
deriving DecidableEq, Repr

/-- Exact generator order for the complete `103`-clause family. -/
def encoderUsedCenterOccurrences : List UsedCenterOccurrence :=
  (List.finRange 11).flatMap fun center =>
    (usedCenterSourceRows center).map
        (fun sourceCenter => .forward center sourceCenter)
      ++ [.reverse center]

set_option linter.style.nativeDecide false in
theorem encoderUsedCenterOccurrences_length :
    encoderUsedCenterOccurrences.length = usedCenterClauseCount := by
  native_decide

def usedCenterOccurrenceArray : Array UsedCenterOccurrence :=
  encoderUsedCenterOccurrences.toArray

def usedCenterOccurrenceAt
    (index : UsedCenterClauseIndex) : UsedCenterOccurrence :=
  usedCenterOccurrenceArray[index.val]'(by
    simpa [usedCenterOccurrenceArray, encoderUsedCenterOccurrences_length]
      using index.isLt)

/-- Render one typed used-center occurrence. -/
def renderUsedCenterOccurrence : UsedCenterOccurrence → List Int
  | .forward center sourceCenter =>
      sourceCenterUsedClause sourceCenter center
  | .reverse center =>
      -Int.ofNat (encodeG3Var (.usedCenter center)) ::
        (usedCenterSourceRows center).map fun sourceCenter =>
          Int.ofNat (encodeG3Var (.sourceCenter sourceCenter))

/-- Typed retained used-center witnesses in exact checkpoint order. -/
def g3UsedCenterSlice : Array UsedCenterOccurrence :=
  g3RetainedUsedCenterIndices.map usedCenterOccurrenceAt

/-- Signed clauses rendered from the retained used-center witnesses. -/
def g3UsedCenterSliceClauses : List (List Int) :=
  g3UsedCenterSlice.toList.map renderUsedCenterOccurrence

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3RetainedUsedCenterIndices_size :
    g3RetainedUsedCenterIndices.size = retainedUsedCenterCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3UsedCenterSlice_size :
    g3UsedCenterSlice.size = retainedUsedCenterCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger corresponds clausewise, up to literal permutation, to the retained used-center segment
of the parsed G3 checkpoint-zero payload. -/
theorem g3UsedCenterSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3UsedCenterSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedUsedCenterCount) := by
  native_decide

private def usedCenterOccurrenceAtValid
    (index : UsedCenterClauseIndex) : Prop :=
  match usedCenterOccurrenceAt index with
  | .forward center sourceCenter =>
      sourceCenterRow sourceCenter =
        ⟨(sourceCenterRow sourceCenter).source, center⟩
  | .reverse _ => True

private instance (index : UsedCenterClauseIndex) :
    Decidable (usedCenterOccurrenceAtValid index) := by
  unfold usedCenterOccurrenceAtValid
  cases usedCenterOccurrenceAt index <;> infer_instance

set_option maxHeartbeats 0 in
-- Exhaustively evaluates the complete used-center occurrence family.
/-- Every generated forward occurrence is assigned to a source-center row
whose decoded target is the occurrence's center. -/
theorem usedCenterOccurrenceAt_valid :
    ∀ index : UsedCenterClauseIndex,
      match usedCenterOccurrenceAt index with
      | .forward center sourceCenter =>
          sourceCenterRow sourceCenter =
            ⟨(sourceCenterRow sourceCenter).source, center⟩
      | .reverse _ => True := by
  change ∀ index : UsedCenterClauseIndex,
    usedCenterOccurrenceAtValid index
  native_decide

/-- Every non-self source/center pair allowed by the two pre-separated source
domains occurs in the encoder's source-center table. -/
private theorem exists_sourceCenterRow_of_ne_and_common :
    ∀ source center : Label,
      source ≠ center →
      (source = 6 → center = 8) →
      (source = 7 → center = 8) →
      ∃ sourceCenter : Fin 92,
        sourceCenterRow sourceCenter = ⟨source, center⟩ := by
  native_decide

/-- A false used-center atom immediately satisfies its reverse clause. -/
private theorem evalClauseD_negative_head
    (σ : Nat → Bool) {left : Nat} (hleft : σ left = false)
    (tail : List Int) :
    evalClauseD σ (-Int.ofNat left :: tail) = true := by
  simp [evalClauseD, evalLitD, hleft]

attribute [local instance] Classical.propDecidable

/-- Every occurrence in the complete used-center family is satisfied by the
total G3 valuation. -/
theorem CanonicalPacket.renderUsedCenterOccurrence_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8)
    (index : UsedCenterClauseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderUsedCenterOccurrence
        (usedCenterOccurrenceAt index)) = true := by
  cases hoccurrence : usedCenterOccurrenceAt index with
  | forward center sourceCenter =>
      have hrow :
          sourceCenterRow sourceCenter =
            ⟨(sourceCenterRow sourceCenter).source, center⟩ := by
        simpa [hoccurrence] using usedCenterOccurrenceAt_valid index
      simp only [renderUsedCenterOccurrence, hoccurrence]
      exact P.sourceCenterUsedClause_sat shadow selected sourceCenter
        (sourceCenterRow sourceCenter).source center hrow
  | reverse center =>
      simp only [renderUsedCenterOccurrence, hoccurrence]
      by_cases husedValue :
          P.fullRadiusValuation shadow selected
              (encodeG3Var (.usedCenter center)) = true
      · have hused : P.usedCenterHolds shadow center := by
          rw [P.fullRadiusValuation_usedCenter] at husedValue
          exact of_decide_eq_true husedValue
        obtain ⟨source, hsource⟩ := hused
        have hne : source ≠ center := by
          intro hsourceCenter
          exact shadow.center_ne_source source
            (hsource.trans hsourceCenter.symm)
        have hsixCenter : source = 6 → center = 8 := by
          intro hsourceSix
          rw [hsourceSix] at hsource
          exact hsource.symm.trans hsix
        have hsevenCenter : source = 7 → center = 8 := by
          intro hsourceSeven
          rw [hsourceSeven] at hsource
          exact hsource.symm.trans hseven
        obtain ⟨sourceCenter, hrow⟩ :=
          exists_sourceCenterRow_of_ne_and_common source center hne
            hsixCenter hsevenCenter
        have hrowMem :
            sourceCenter ∈ usedCenterSourceRows center := by
          simp [usedCenterSourceRows, hrow]
        have hsourceCenterValue :
            P.fullRadiusValuation shadow selected
                (encodeG3Var (.sourceCenter sourceCenter)) = true := by
          rw [P.fullRadiusValuation_sourceCenter]
          exact decide_eq_true (by simpa [hrow] using hsource)
        apply evalClauseD_of_positive_mem _
          (encodeG3Var_pos (.sourceCenter sourceCenter))
        · exact List.mem_cons_of_mem _ (List.mem_map.mpr
            ⟨sourceCenter, hrowMem, rfl⟩)
        · exact hsourceCenterValue
      · exact evalClauseD_negative_head _
          (Bool.eq_false_of_not_eq_true husedValue) _

/-- Every clause in the retained used-center slice is satisfied by the total
G3 valuation. -/
theorem CanonicalPacket.g3UsedCenterSlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8) :
    ∀ clause ∈ g3UsedCenterSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨occurrence, hoccurrence, rfl⟩ := List.mem_map.mp hclause
  have hoccurrenceArray : occurrence ∈ g3UsedCenterSlice :=
    Array.mem_toList_iff.mp hoccurrence
  rw [g3UsedCenterSlice] at hoccurrenceArray
  obtain ⟨index, _hindex, rfl⟩ := Array.mem_map.mp hoccurrenceArray
  exact P.renderUsedCenterOccurrence_sat shadow selected hsix hseven index

/-- Signed-clause form of the authenticated retained used-center result. -/
theorem CanonicalPacket.g3Checkpoint0_usedCenterSlice_signed_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8) :
    ∀ clause ∈
        ((signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedUsedCenterCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
    (P.fullRadiusValuation shadow selected)
    g3UsedCenterSlice_perm_checkpoint
    (P.g3UsedCenterSlice_sat shadow selected hsix hseven)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3UsedCenterSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderUsedCenterOccurrence_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_usedCenterSlice_signed_sat
