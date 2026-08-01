/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3BaseSliceLedger

/-!
# Authenticated retained-separation slice of the exact-eleven G3 core

The checkpoint clauses immediately after the selector-plus-base slice are
`45581` retained occurrences from the exact cyclic-separation family.  This
file decodes their strictly increasing one-based family ordinals, renders each
ordinal through a typed occurrence, and authenticates the resulting clause
list against the parsed checkpoint payload.
-/

open scoped EuclideanGeometry

open Std.Sat

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open CheckpointedRup.CompactIngress
open CheckpointedRup.CompactBoundary
open CheckpointedRup.SemanticBoundary

set_option maxRecDepth 100000

private def retainedPrefixCount : Nat := 108705
private def retainedSeparationCount : Nat := 45581
private def separationClauseCount : Nat := 179887
private def indicatorClauseCount : Nat := 11694
private def guardedClauseCount : Nat := 168192

private def retainedSeparationPayload : String :=
  include_str "data/g3-separation-slice-ordinals.a85"

abbrev SeparationClauseIndex := Fin separationClauseCount
abbrev IndicatorClauseIndex := Fin indicatorClauseCount
abbrev GuardedClauseIndex := Fin guardedClauseCount

/-- Read one canonical positive LEB128 value from a byte array. -/
private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if separationClauseCount < candidate then
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

/-- Decode exactly the audited number of positive deltas, rejecting trailing
bytes and ordinals outside the exact separation-family block. -/
private def decodePositiveDeltasAux (bytes : ByteArray) :
    Nat → Nat → Nat → Array SeparationClauseIndex →
      Option (Array SeparationClauseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ separationClauseCount then
          let sourceIndex : SeparationClauseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedSeparationIndices :
    Option (Array SeparationClauseIndex) := do
  let bytes ← decodeAscii85 retainedSeparationPayload
  decodePositiveDeltasAux bytes retainedSeparationCount 0 0 #[]

/-- Authenticated zero-based indices in the complete separation family. -/
def g3RetainedSeparationIndices : Array SeparationClauseIndex :=
  decodeRetainedSeparationIndices.getD #[]

private def indicatorOccurrenceArray : Array IndicatorOccurrence :=
  encoderIndicatorOccurrences.toArray

private def guardedOccurrenceArray : Array GuardedOccurrence :=
  encoderGuardedOccurrences.toArray

/-- Typed semantic witnesses for retained separation clauses. -/
inductive G3SeparationSliceWitness where
  | indicator (index : IndicatorClauseIndex)
  | selectorTotality
  | guarded (index : GuardedClauseIndex)
deriving DecidableEq

/-- Decode an arbitrary source ordinal in the complete separation family to
its typed semantic witness.  This is public so independently authenticated
retained-core ledgers can reuse the same renderer and semantic theorem. -/
def decodeSeparationWitness
    (sourceIndex : SeparationClauseIndex) : G3SeparationSliceWitness :=
  if hIndicator : sourceIndex.val < indicatorClauseCount then
    .indicator ⟨sourceIndex.val, hIndicator⟩
  else if hSelector : sourceIndex.val = indicatorClauseCount then
    .selectorTotality
  else
    .guarded
      ⟨sourceIndex.val - (indicatorClauseCount + 1), by
        have hsource := sourceIndex.isLt
        simp only [guardedClauseCount, separationClauseCount,
          indicatorClauseCount] at hsource ⊢
        omega⟩

private def indicatorOccurrenceAt
    (index : IndicatorClauseIndex) : IndicatorOccurrence :=
  indicatorOccurrenceArray[index.val]'(by
    simpa [indicatorOccurrenceArray, indicatorClauseCount,
      encoderIndicatorOccurrences_length] using index.isLt)

private def guardedOccurrenceAt
    (index : GuardedClauseIndex) : GuardedOccurrence :=
  guardedOccurrenceArray[index.val]'(by
    simpa [guardedOccurrenceArray, guardedClauseCount,
      encoderGuardedOccurrences_length] using index.isLt)

/-- Render a typed separation witness in constant-time array indexing. -/
def renderG3SeparationSliceWitness :
    G3SeparationSliceWitness → List Int
  | .indicator index => indicatorClause (indicatorOccurrenceAt index)
  | .selectorTotality => selectorTotalityClause
  | .guarded index => guardedClause (guardedOccurrenceAt index)

/-- Typed retained separation witnesses in exact checkpoint order. -/
def g3SeparationSlice : Array G3SeparationSliceWitness :=
  g3RetainedSeparationIndices.map decodeSeparationWitness

/-- Signed clauses represented by the retained separation ledger. -/
def g3SeparationSliceClauses : List (List Int) :=
  g3SeparationSlice.toList.map renderG3SeparationSliceWitness

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3SeparationSlice_size :
    g3SeparationSlice.size = retainedSeparationCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger renders the retained separation segment of the parsed
G3 checkpoint-zero payload, preserving each clause up to the per-clause
permutation introduced by extracted-core production. -/
theorem g3SeparationSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3SeparationSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedSeparationCount) := by
  native_decide

private theorem indicatorOccurrenceAt_mem
    (index : IndicatorClauseIndex) :
    indicatorOccurrenceAt index ∈ encoderIndicatorOccurrences := by
  simp only [indicatorOccurrenceAt, indicatorOccurrenceArray,
    List.getElem_toArray]
  exact List.getElem_mem (by
    simpa [indicatorClauseCount, encoderIndicatorOccurrences_length]
      using index.isLt)

private theorem guardedOccurrenceAt_mem
    (index : GuardedClauseIndex) :
    guardedOccurrenceAt index ∈ encoderGuardedOccurrences := by
  simp only [guardedOccurrenceAt, guardedOccurrenceArray,
    List.getElem_toArray]
  exact List.getElem_mem (by
    simpa [guardedClauseCount, encoderGuardedOccurrences_length]
      using index.isLt)

private theorem indicatorClause_literal_bounds
    {occurrence : IndicatorOccurrence}
    (hoccurrence : occurrence ∈ encoderIndicatorOccurrences) :
    ∀ literal ∈ indicatorClause occurrence,
      0 < literal.natAbs ∧ literal.natAbs < 27905 := by
  intro literal hliteral
  simp only [indicatorClause, List.mem_cons, List.not_mem_nil, or_false] at hliteral
  rcases hliteral with rfl | rfl
  · simp only [Int.ofNat_eq_natCast, Int.natAbs_neg, Int.natAbs_natCast]
    have hx :
        xVar (pairIndicatorRow occurrence.1).1.val occurrence.2 < 27287 :=
      lt_of_le_of_lt
        (xVar_le_nX (pairIndicatorRow occurrence.1).1.isLt
          (indicatorOccurrence_facts hoccurrence).1)
        nX_lt_pairIndicatorStart
    exact ⟨one_le_xVar (pairIndicatorRow occurrence.1).1.val occurrence.2, by omega⟩
  · simp [pairIndicatorVar]
    omega

private theorem selectorTotalityClause_literal_bounds :
    ∀ literal ∈ selectorTotalityClause,
      0 < literal.natAbs ∧ literal.natAbs < 27905 := by
  intro literal hliteral
  obtain ⟨selector, _hselector, rfl⟩ := List.mem_map.mp hliteral
  simp [varOfAtom]
  omega

private theorem guardedClause_literal_bounds
    (occurrence : GuardedOccurrence) :
    ∀ literal ∈ guardedClause occurrence,
      0 < literal.natAbs ∧ literal.natAbs < 27905 := by
  intro literal hliteral
  simp only [guardedClause, List.mem_cons, List.not_mem_nil, or_false] at hliteral
  rcases hliteral with rfl | rfl | rfl
  · simp [varOfAtom]
    omega
  · simp [pairIndicatorVar]
    omega
  · simp [pairIndicatorVar]
    omega

private theorem renderG3SeparationSliceWitness_literal_bounds
    (witness : G3SeparationSliceWitness) :
    ∀ literal ∈ renderG3SeparationSliceWitness witness,
      0 < literal.natAbs ∧ literal.natAbs < 27905 := by
  cases witness with
  | indicator index =>
      exact indicatorClause_literal_bounds (indicatorOccurrenceAt_mem index)
  | selectorTotality =>
      exact selectorTotalityClause_literal_bounds
  | guarded index =>
      exact guardedClause_literal_bounds (guardedOccurrenceAt index)

private theorem CanonicalPacket.renderG3SeparationSliceWitness_separation_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (witness : G3SeparationSliceWitness) :
    evalClauseD P.separationValuation
      (renderG3SeparationSliceWitness witness) = true := by
  cases witness with
  | indicator index =>
      exact P.indicatorClause_sat hP (indicatorOccurrenceAt_mem index)
  | selectorTotality =>
      exact P.selectorTotalityClause_sat
  | guarded index =>
      exact P.guardedClause_sat (guardedOccurrenceAt_mem index)

/-- Every typed retained-separation witness is satisfied by the total G3
valuation. -/
theorem CanonicalPacket.renderG3SeparationSliceWitness_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (witness : G3SeparationSliceWitness) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderG3SeparationSliceWitness witness) = true := by
  let clause := renderG3SeparationSliceWitness witness
  have hbounds := renderG3SeparationSliceWitness_literal_bounds witness
  calc
    evalClauseD (P.fullRadiusValuation shadow selected) clause =
        evalClauseD (P.fullSourceChoiceValuation shadow) clause := by
      apply evalClauseD_congr
      intro literal hliteral
      exact P.fullRadiusValuation_eq_fullSourceChoice_of_lt shadow selected
        (hbounds literal hliteral).1
        (lt_trans (hbounds literal hliteral).2 (by omega))
    _ = evalClauseD P.separationValuation clause := by
      apply evalClauseD_congr
      intro literal hliteral
      exact P.fullSourceChoiceValuation_eq_separation_of_lt shadow
        (hbounds literal hliteral).2
    _ = true :=
      P.renderG3SeparationSliceWitness_separation_sat hP witness

/-- Every clause in the retained-separation slice is satisfied by the total
G3 valuation. -/
theorem CanonicalPacket.g3SeparationSlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3SeparationSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨witness, _hwitness, rfl⟩ := List.mem_map.mp hclause
  exact P.renderG3SeparationSliceWitness_sat hP shadow selected witness

/-- Signed-clause form of the authenticated separation-slice result. -/
theorem CanonicalPacket.g3Checkpoint0_separationSlice_signed_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈
        ((signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedSeparationCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact
    CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
      (P.fullRadiusValuation shadow selected)
      g3SeparationSlice_perm_checkpoint
      (P.g3SeparationSlice_sat hP shadow selected)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3SeparationSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderG3SeparationSliceWitness_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_separationSlice_signed_sat
