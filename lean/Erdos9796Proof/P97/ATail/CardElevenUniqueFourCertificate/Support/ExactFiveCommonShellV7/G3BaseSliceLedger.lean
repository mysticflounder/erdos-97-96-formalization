/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3ClauseFamilySemantics
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3CertificateSemantics
import Erdos9796Proof.P97.Certificate.G3ParsedClauseNormalization

/-!
# Authenticated retained-base slice of the exact-eleven G3 core

The first `108705` clauses of checkpoint zero are the G3 selector-totality
clause followed by `108704` retained occurrences from the inherited
`Census554` base formula.  The external audit records their strictly
increasing one-based source positions as positive delta-varints in a strict
raw ASCII85 envelope.

The executable theorem in this file authenticates the decoded ledger against
the exact parsed checkpoint payload.  The semantic theorem then discharges
the entire slice using one generic `CanonicalPacket.baseDimacs_sat` argument;
there is no clause-specific proof code.
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
open CheckpointedRup.ParsedClauseNormalization

set_option maxRecDepth 100000

private def retainedBaseCount : Nat := 108704

private def retainedBasePayload : String :=
  include_str "data/g3-base-slice-positions.a85"

/-- Typed zero-based source index into the inherited base formula. -/
abbrev CensusBaseIndex := Fin baseDimacs.length

/-- Read one canonical positive LEB128 value from a byte array. -/
private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if baseDimacs.length < candidate then
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

/-- Decode exactly the requested number of positive deltas, reject trailing
bytes, and reject any resulting source position outside `baseDimacs`. -/
private def decodePositiveDeltasAux (bytes : ByteArray) :
    Nat → Nat → Nat → Array CensusBaseIndex →
      Option (Array CensusBaseIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ baseDimacs.length then
          let sourceIndex : CensusBaseIndex :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedBaseIndices :
    Option (Array CensusBaseIndex) := do
  let bytes ← decodeAscii85 retainedBasePayload
  decodePositiveDeltasAux bytes retainedBaseCount 0 0 #[]

/-- The authenticated, typed source indices of the retained base clauses.  A
malformed payload decodes to the empty array and is therefore rejected by
`g3BaseSlice_perm_checkpoint`. -/
def g3RetainedBaseIndices : Array CensusBaseIndex :=
  decodeRetainedBaseIndices.getD #[]

private def baseClauseArray : Array (List Int) :=
  baseDimacs.toArray

/-- Typed semantic witnesses for the first retained-core slice. -/
inductive G3BaseSliceWitness where
  | selectorTotality
  | censusBase (sourceIndex : CensusBaseIndex)
deriving DecidableEq

/-- Render one typed first-slice witness in constant-time array indexing. -/
def renderG3BaseSliceWitness : G3BaseSliceWitness → List Int
  | .selectorTotality => g3SelectorTotalityClause
  | .censusBase sourceIndex =>
      baseClauseArray[sourceIndex.val]'(by
        simpa [baseClauseArray] using sourceIndex.isLt)

/-- Typed witnesses represented by the first authenticated G3 ledger slice. -/
def g3BaseSlice : Array G3BaseSliceWitness :=
  #[.selectorTotality] ++
    g3RetainedBaseIndices.map G3BaseSliceWitness.censusBase

/-- Signed clauses represented by the first authenticated G3 ledger slice. -/
def g3BaseSliceClauses : List (List Int) :=
  g3BaseSlice.toList.map renderG3BaseSliceWitness

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The typed first slice has the audited cardinality. -/
theorem g3BaseSlice_size :
    g3BaseSlice.size = retainedBaseCount + 1 := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger renders the first `108705` signed clauses of the
parsed G3 checkpoint-zero payload, preserving each clause up to the literal
permutation introduced by the extracted-core producer. -/
theorem g3BaseSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3BaseSliceClauses
      ((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).take
        (retainedBaseCount + 1)) := by
  native_decide

theorem g3BaseClauseAt_mem_baseDimacs
    (sourceIndex : CensusBaseIndex) :
    renderG3BaseSliceWitness (.censusBase sourceIndex) ∈ baseDimacs := by
  simp only [renderG3BaseSliceWitness, baseClauseArray,
    List.getElem_toArray]
  exact List.getElem_mem sourceIndex.isLt

/-- The selected route satisfies selector totality in the total G3
valuation. -/
theorem CanonicalPacket.fullRadius_selectorTotality_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      g3SelectorTotalityClause = true := by
  apply evalClauseD_of_positive_mem
      (right := g3SelectorVar selected)
  · exact lt_of_lt_of_le (by omega) (g3SelectorVar_lowerBound selected)
  · cases selected <;> simp [g3SelectorTotalityClause, g3SelectorVar]
  · simpa using P.fullRadiusValuation_selector shadow selected selected

/-- One inherited base occurrence is satisfied in the total G3 valuation. -/
theorem CanonicalPacket.g3BaseClauseAt_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (sourceIndex : CensusBaseIndex) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderG3BaseSliceWitness (.censusBase sourceIndex)) = true := by
  let clause := renderG3BaseSliceWitness (.censusBase sourceIndex)
  have hclause : clause ∈ baseDimacs :=
    g3BaseClauseAt_mem_baseDimacs sourceIndex
  have hbound := baseDimacs_literal_lt_pairIndicatorStart clause hclause
  have hsat :
    evalClauseD (P.fullRadiusValuation shadow selected) clause =
        true := by
    calc
      evalClauseD (P.fullRadiusValuation shadow selected) clause =
          evalClauseD (P.fullSourceChoiceValuation shadow) clause := by
        apply evalClauseD_congr
        intro literal hliteral
        exact P.fullRadiusValuation_eq_fullSourceChoice_of_lt shadow selected
          (Int.natAbs_pos.mpr
            (baseDimacs_nonzero clause hclause literal hliteral))
          (lt_trans (hbound literal hliteral) (by omega))
      _ = evalClauseD P.separationValuation clause := by
        apply evalClauseD_congr
        intro literal hliteral
        exact P.fullSourceChoiceValuation_eq_separation_of_lt shadow
          (lt_trans (hbound literal hliteral) (by omega))
      _ = evalClauseD P.baseValuation clause := by
        apply evalClauseD_congr
        intro literal hliteral
        exact P.separationValuation_eq_base_of_lt
          (hbound literal hliteral)
      _ = true := P.baseDimacs_sat hP clause hclause
  exact hsat

/-- Every typed first-slice witness is satisfied by the total G3 valuation. -/
theorem CanonicalPacket.renderG3BaseSliceWitness_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (witness : G3BaseSliceWitness) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderG3BaseSliceWitness witness) = true := by
  cases witness with
  | selectorTotality =>
      exact P.fullRadius_selectorTotality_sat shadow selected
  | censusBase sourceIndex =>
      exact P.g3BaseClauseAt_sat hP shadow selected sourceIndex

/-- Every clause in the selector-plus-retained-base slice is satisfied by the
total G3 valuation. -/
theorem CanonicalPacket.g3BaseSlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈ g3BaseSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨witness, hwitness, rfl⟩ := List.mem_map.mp hclause
  exact P.renderG3BaseSliceWitness_sat hP shadow selected witness

/-- Signed-clause form of the authenticated first-slice semantic result. -/
theorem CanonicalPacket.g3Checkpoint0_baseSlice_signed_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈
        (signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).take
          (retainedBaseCount + 1),
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact evalClauseD_all_core_of_source
    (P.fullRadiusValuation shadow selected)
    g3BaseSlice_perm_checkpoint
    (P.g3BaseSlice_sat hP shadow selected)

/-- Parsed-clause form of the authenticated first-slice semantic result. -/
theorem CanonicalPacket.g3Checkpoint0_baseSlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    ∀ clause ∈
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text).toList.take
          (retainedBaseCount + 1),
      evalClauseD (P.fullRadiusValuation shadow selected)
        (signedClauseOfDefault clause) = true := by
  intro clause hclause
  apply P.g3Checkpoint0_baseSlice_signed_sat hP shadow selected
  rw [signedClausesOfFormula, ← List.map_take]
  exact List.mem_map_of_mem hclause

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.g3BaseSlice_perm_checkpoint
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.renderG3BaseSliceWitness_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3BaseSlice_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.g3Checkpoint0_baseSlice_sat
