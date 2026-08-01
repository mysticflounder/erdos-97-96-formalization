/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3SeparationSliceLedger

/-!
# Authenticated retained source-tail slice of the exact-eleven G3 core

The third checkpoint segment contains `5247` retained clauses from the
source-choice tail.  Three are route-guarded apex-shell clauses.  The
remaining clauses are drawn from the common blocker-shell clause and the
complete eleven-source choice/Sinz family.

This file decodes the compressed retained ordinals, renders them through
typed semantic witnesses, authenticates the exact checkpoint slice, and
proves that the total G3 valuation satisfies every retained clause.
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

private def retainedPrefixCount : Nat := 154286
private def retainedSourceTailCount : Nat := 5247
private def sourceTailClauseCount : Nat := 26191
private def commonSourceTailClauseCount : Nat := 26190

private def retainedSourceTailPayload : String :=
  include_str "data/g3-source-tail-slice-ordinals.a85"

abbrev SourceTailClauseIndex := Fin sourceTailClauseCount

/-- A retained common-tail ordinal.  Ordinal zero is reserved for the
route-specific apex clause, so every common ordinal is positive. -/
structure RetainedCommonSourceTailIndex where
  index : SourceTailClauseIndex
  isCommon : 1 ≤ index.val

/-- Read one canonical positive LEB128 value from a byte array. -/
private def readPositiveVarUIntAux :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if sourceTailClauseCount < candidate then
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

/-- Decode exactly the audited number of common-tail positive deltas.
Decoded values are one-based family ordinals, hence subtracting one yields
the source-tail index used by the generator. -/
private def decodePositiveDeltasAux (bytes : ByteArray) :
    Nat → Nat → Nat → Array RetainedCommonSourceTailIndex →
      Option (Array RetainedCommonSourceTailIndex)
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ sourceTailClauseCount then
          if hcommon : 2 ≤ current then
            let sourceIndex : RetainedCommonSourceTailIndex :=
              ⟨⟨current - 1, by
                  simp [sourceTailClauseCount] at hcurrent ⊢
                  omega⟩,
                Nat.le_sub_of_add_le hcommon⟩
            decodePositiveDeltasAux bytes remaining next current
              (output.push sourceIndex)
          else
            none
        else
          none
      else
        none

private def decodeRetainedCommonSourceTailIndices :
    Option (Array RetainedCommonSourceTailIndex) := do
  let bytes ← decodeAscii85 retainedSourceTailPayload
  decodePositiveDeltasAux bytes (retainedSourceTailCount - 3) 0 0 #[]

/-- Authenticated zero-based indices in the common source-tail family. -/
def g3RetainedCommonSourceTailIndices :
    Array RetainedCommonSourceTailIndex :=
  decodeRetainedCommonSourceTailIndices.getD #[]

/-- Typed semantic witnesses for the retained source-tail clauses. -/
inductive G3SourceTailSliceWitness where
  | guardedApex (route : G3Case)
  | blockerShell
  | implication (source : Label) (choice : SourceChoiceIndex source)
  | totality (source : Label)
  | prefix (source : Label) (choice : SourceChoiceIndex source)
  | monotonicity (source : Label)
      (left right : SourceChoiceIndex source) (ordered : left.val ≤ right.val)
  | exclusion (source : Label)
      (left right : SourceChoiceIndex source) (ordered : left.val < right.val)

private theorem sourceChoiceCount_pos (source : Label) :
    0 < sourceChoiceCount source := by
  fin_cases source <;> decide

private def sourceChoiceZero (source : Label) : SourceChoiceIndex source :=
  ⟨0, sourceChoiceCount_pos source⟩

private structure ConsecutiveSourceChoices (source : Label) where
  left : SourceChoiceIndex source
  right : SourceChoiceIndex source
  consecutive : left.val + 1 = right.val

private def consecutiveSourceChoices
    (source : Label) : List (ConsecutiveSourceChoices source) :=
  (List.finRange (sourceChoiceCount source - 1)).map fun left =>
    { left := ⟨left.val, by
        have := left.isLt
        omega⟩
      right := ⟨left.val + 1, by
        have := left.isLt
        omega⟩
      consecutive := rfl }

/-- The exact generator order for one source block: all implications,
totality, initial prefix, then the three consecutive Sinz clauses. -/
private def sourceBlockWitnesses
    (source : Label) : List G3SourceTailSliceWitness :=
  ((List.finRange (sourceChoiceCount source)).map fun choice =>
      .implication source choice) ++
    [.totality source, .prefix source (sourceChoiceZero source)] ++
    (consecutiveSourceChoices source).flatMap fun pair =>
      [.prefix source pair.right,
        .monotonicity source pair.left pair.right (by
          have := pair.consecutive
          omega),
        .exclusion source pair.left pair.right (by
          have := pair.consecutive
          omega)]

/-- Complete common family in generator order, corresponding exactly to
source-tail ordinals `1` through `26190`. -/
private def completeCommonSourceTailWitnesses :
    Array G3SourceTailSliceWitness :=
  ([G3SourceTailSliceWitness.blockerShell] ++
    (List.finRange 11).flatMap sourceBlockWitnesses).toArray

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
private theorem completeCommonSourceTailWitnesses_size :
    completeCommonSourceTailWitnesses.size =
      commonSourceTailClauseCount := by
  native_decide

private def commonSourceTailWitnessAt
    (sourceIndex : RetainedCommonSourceTailIndex) :
    G3SourceTailSliceWitness :=
  completeCommonSourceTailWitnesses[sourceIndex.index.val - 1]'(by
    rw [completeCommonSourceTailWitnesses_size]
    have := sourceIndex.index.isLt
    have := sourceIndex.isCommon
    simp [sourceTailClauseCount, commonSourceTailClauseCount] at *
    omega)

/-- Render one typed source-tail witness. -/
def renderG3SourceTailSliceWitness :
    G3SourceTailSliceWitness → List Int
  | .guardedApex route =>
      g3GuardedClause route
        (shellCaseApexChoiceClause route.shellCase)
  | .blockerShell => blockerShellChoiceClause
  | .implication source choice =>
      sourceChoiceImplicationClause source choice
  | .totality source => sourceChoiceTotalityClause source
  | .prefix source choice => sourceChoicePrefixClause source choice
  | .monotonicity source left right _ =>
      sourcePrefixMonotonicityClause source left right
  | .exclusion source left right _ =>
      sourceChoicePrefixExclusionClause source left right

/-- Typed retained source-tail witnesses in exact checkpoint order. -/
def g3SourceTailSlice : Array G3SourceTailSliceWitness :=
  #[.guardedApex .s2_o9, .guardedApex .s3_o0,
      .guardedApex .s3_o9] ++
    g3RetainedCommonSourceTailIndices.map commonSourceTailWitnessAt

/-- Signed clauses represented by the retained source-tail ledger. -/
def g3SourceTailSliceClauses : List (List Int) :=
  g3SourceTailSlice.toList.map renderG3SourceTailSliceWitness

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem g3SourceTailSlice_size :
    g3SourceTailSlice.size = retainedSourceTailCount := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The compressed ledger renders the retained source-tail segment of the
parsed G3 checkpoint-zero payload, preserving each clause up to the per-clause
permutation introduced by extracted-core production. -/
theorem g3SourceTailSlice_perm_checkpoint :
    List.Forall₂ List.Perm g3SourceTailSliceClauses
      (((signedClausesOfFormula
        (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
          retainedPrefixCount).take retainedSourceTailCount) := by
  native_decide

private theorem sourceChoiceVariable_upperBound
    (source : Label) (choice : SourceChoiceIndex source) :
    sourceChoiceVariable source choice < 41005 := by
  have hchoice := choice.isLt
  fin_cases source <;>
    simp [sourceChoiceVariable, sourceChoiceStart, sourceChoiceCount]
      at hchoice ⊢ <;>
    omega

private theorem sourcePrefixVariable_upperBound
    (source : Label) (choice : SourceChoiceIndex source) :
    sourcePrefixVariable source choice < 41005 := by
  have hchoice := choice.isLt
  fin_cases source <;>
    simp [sourcePrefixVariable, sourcePrefixStart, sourceChoiceCount]
      at hchoice ⊢ <;>
    omega

private theorem sourceChoiceXVar_bounds
    (source : Label) (choice : SourceChoiceIndex source) :
    0 < xVar (sourceChoiceAt source choice).1.val
          (sourceChoiceAt source choice).2 ∧
      xVar (sourceChoiceAt source choice).1.val
          (sourceChoiceAt source choice).2 < 41005 := by
  have hfacts := sourceChoiceAt_facts source choice
  exact
    ⟨one_le_xVar (sourceChoiceAt source choice).1.val
        (sourceChoiceAt source choice).2,
      lt_of_le_of_lt
        (xVar_le_nX (sourceChoiceAt source choice).1.isLt hfacts.1)
        (lt_trans nX_lt_pairIndicatorStart (by omega))⟩

private theorem sourceWitness_literal_bounds
    (witness : G3SourceTailSliceWitness)
    (hsource :
      match witness with
      | .implication _ _ | .totality _ | .prefix _ _
      | .monotonicity _ _ _ _ | .exclusion _ _ _ _ => True
      | _ => False) :
    ∀ literal ∈ renderG3SourceTailSliceWitness witness,
      0 < literal.natAbs ∧ literal.natAbs < 41005 := by
  cases witness with
  | guardedApex route => simp at hsource
  | blockerShell => simp at hsource
  | implication source choice =>
      intro literal hliteral
      simp only [renderG3SourceTailSliceWitness,
        sourceChoiceImplicationClause, List.mem_cons, List.not_mem_nil,
        or_false] at hliteral
      rcases hliteral with rfl | rfl
      · simpa using
          ⟨sourceChoiceVariable_pos source choice,
            sourceChoiceVariable_upperBound source choice⟩
      · simpa using sourceChoiceXVar_bounds source choice
  | totality source =>
      intro literal hliteral
      simp only [renderG3SourceTailSliceWitness,
        sourceChoiceTotalityClause, List.mem_map] at hliteral
      obtain ⟨choice, _hchoice, rfl⟩ := hliteral
      simpa using
        ⟨sourceChoiceVariable_pos source choice,
          sourceChoiceVariable_upperBound source choice⟩
  | «prefix» source choice =>
      intro literal hliteral
      simp only [renderG3SourceTailSliceWitness, sourceChoicePrefixClause,
        List.mem_cons, List.not_mem_nil, or_false] at hliteral
      rcases hliteral with rfl | rfl
      · simpa using
          ⟨sourceChoiceVariable_pos source choice,
            sourceChoiceVariable_upperBound source choice⟩
      · simpa using
          ⟨sourcePrefixVariable_pos source choice,
            sourcePrefixVariable_upperBound source choice⟩
  | monotonicity source left right ordered =>
      intro literal hliteral
      simp only [renderG3SourceTailSliceWitness,
        sourcePrefixMonotonicityClause, List.mem_cons, List.not_mem_nil,
        or_false] at hliteral
      rcases hliteral with rfl | rfl
      · simpa using
          ⟨sourcePrefixVariable_pos source left,
            sourcePrefixVariable_upperBound source left⟩
      · simpa using
          ⟨sourcePrefixVariable_pos source right,
            sourcePrefixVariable_upperBound source right⟩
  | exclusion source left right ordered =>
      intro literal hliteral
      simp only [renderG3SourceTailSliceWitness,
        sourceChoicePrefixExclusionClause, List.mem_cons,
        List.not_mem_nil, or_false] at hliteral
      rcases hliteral with rfl | rfl
      · simpa using
          ⟨sourceChoiceVariable_pos source right,
            sourceChoiceVariable_upperBound source right⟩
      · simpa using
          ⟨sourcePrefixVariable_pos source left,
            sourcePrefixVariable_upperBound source left⟩

private theorem shellCaseApexChoiceClause_literal_bounds
    (route : G3Case) :
    ∀ literal ∈ shellCaseApexChoiceClause route.shellCase,
      0 < literal.natAbs ∧ literal.natAbs < 27287 := by
  cases route <;> native_decide

private theorem blockerShellChoiceClause_literal_bounds :
    ∀ literal ∈ blockerShellChoiceClause,
      0 < literal.natAbs ∧ literal.natAbs < 27287 := by
  native_decide

private theorem CanonicalPacket.evalClauseD_fullRadius_eq_inherited_of_bounds
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (clause : List Int)
    (hbound : ∀ literal ∈ clause,
      0 < literal.natAbs ∧ literal.natAbs < 27287) :
    evalClauseD (P.fullRadiusValuation shadow selected) clause =
      evalClauseD P.inheritedTailValuation clause := by
  apply evalClauseD_congr
  intro literal hliteral
  have hliteralBounds := hbound literal hliteral
  calc
    P.fullRadiusValuation shadow selected literal.natAbs =
        P.fullSourceChoiceValuation shadow literal.natAbs :=
      P.fullRadiusValuation_eq_fullSourceChoice_of_lt shadow selected
        hliteralBounds.1 (by omega)
    _ = P.separationValuation literal.natAbs :=
      P.fullSourceChoiceValuation_eq_separation_of_lt shadow (by omega)
    _ = P.inheritedTailValuation literal.natAbs :=
      (P.inheritedTailValuation_eq_separation_of_lt (by omega)).symm

private theorem CanonicalPacket.sourceWitness_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8)
    (witness : G3SourceTailSliceWitness)
    (hsource :
      match witness with
      | .implication _ _ | .totality _ | .prefix _ _
      | .monotonicity _ _ _ _ | .exclusion _ _ _ _ => True
      | _ => False) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderG3SourceTailSliceWitness witness) = true := by
  have hfamily :=
    P.fullSourceChoiceFamily_sat_of_commonCenters hP shadow hsix hseven
  have hsemantic :
      evalClauseD (P.fullSourceChoiceValuation shadow)
        (renderG3SourceTailSliceWitness witness) = true := by
    cases witness with
    | guardedApex route => simp at hsource
    | blockerShell => simp at hsource
    | implication source choice =>
        exact hfamily.1 source choice
    | totality source =>
        exact hfamily.2.1 source
    | «prefix» source choice =>
        exact hfamily.2.2.1 source choice
    | monotonicity source left right ordered =>
        exact hfamily.2.2.2.1 source left right ordered
    | exclusion source left right ordered =>
        exact hfamily.2.2.2.2 source left right ordered
  calc
    evalClauseD (P.fullRadiusValuation shadow selected)
        (renderG3SourceTailSliceWitness witness) =
        evalClauseD (P.fullSourceChoiceValuation shadow)
          (renderG3SourceTailSliceWitness witness) := by
      apply evalClauseD_congr
      intro literal hliteral
      exact P.fullRadiusValuation_eq_fullSourceChoice_of_lt shadow selected
        (sourceWitness_literal_bounds witness hsource literal hliteral).1
        (sourceWitness_literal_bounds witness hsource literal hliteral).2
    _ = true := hsemantic

/-- Every typed retained source-tail witness is satisfied by the total G3
valuation. -/
theorem CanonicalPacket.renderG3SourceTailSliceWitness_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hShellCase : P.shellCase = selected.shellCase)
    (hApexChoice :
      P.baseIndex 1 = P.shellCase.erasedCandidateIndex)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8)
    (witness : G3SourceTailSliceWitness) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderG3SourceTailSliceWitness witness) = true := by
  have hinherited :=
    P.shellCaseInheritedTailFamily_sat hP shadow hApexChoice hsix hseven
  cases witness with
  | guardedApex route =>
      by_cases hroute : route = selected
      · subst route
        have hpayloadInherited :
            evalClauseD P.inheritedTailValuation
              (shellCaseApexChoiceClause selected.shellCase) = true := by
          simpa [hShellCase] using hinherited.1
        have hpayload :
            evalClauseD (P.fullRadiusValuation shadow selected)
              (shellCaseApexChoiceClause selected.shellCase) = true := by
          rw [P.evalClauseD_fullRadius_eq_inherited_of_bounds shadow selected
            (shellCaseApexChoiceClause selected.shellCase)
            (shellCaseApexChoiceClause_literal_bounds selected)]
          exact hpayloadInherited
        simp only [renderG3SourceTailSliceWitness]
        rw [P.eval_fullRadiusGuardedClause_selected]
        exact hpayload
      · simp only [renderG3SourceTailSliceWitness]
        exact P.fullRadiusGuardedClause_sat_of_unselected shadow hroute _
  | blockerShell =>
      simp only [renderG3SourceTailSliceWitness]
      rw [P.evalClauseD_fullRadius_eq_inherited_of_bounds shadow selected
        blockerShellChoiceClause blockerShellChoiceClause_literal_bounds]
      exact hinherited.2.1
  | implication source choice =>
      exact P.sourceWitness_sat hP shadow selected hsix hseven
        (.implication source choice) trivial
  | totality source =>
      exact P.sourceWitness_sat hP shadow selected hsix hseven
        (.totality source) trivial
  | «prefix» source choice =>
      exact P.sourceWitness_sat hP shadow selected hsix hseven
        (.prefix source choice) trivial
  | monotonicity source left right ordered =>
      exact P.sourceWitness_sat hP shadow selected hsix hseven
        (.monotonicity source left right ordered) trivial
  | exclusion source left right ordered =>
      exact P.sourceWitness_sat hP shadow selected hsix hseven
        (.exclusion source left right ordered) trivial

/-- Every clause in the retained source-tail slice is satisfied by the total
G3 valuation. -/
theorem CanonicalPacket.g3SourceTailSlice_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hShellCase : P.shellCase = selected.shellCase)
    (hApexChoice :
      P.baseIndex 1 = P.shellCase.erasedCandidateIndex)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8) :
    ∀ clause ∈ g3SourceTailSliceClauses,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  intro clause hclause
  obtain ⟨witness, hwitness, rfl⟩ := List.mem_map.mp hclause
  exact P.renderG3SourceTailSliceWitness_sat hP shadow selected hShellCase
    hApexChoice hsix hseven witness

/-- Signed-clause form of the authenticated retained source-tail result. -/
theorem CanonicalPacket.g3Checkpoint0_sourceTailSlice_signed_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hShellCase : P.shellCase = selected.shellCase)
    (hApexChoice :
      P.baseIndex 1 = P.shellCase.erasedCandidateIndex)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8) :
    ∀ clause ∈
        ((signedClausesOfFormula
          (formulaOfCompact (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).drop
            retainedPrefixCount).take retainedSourceTailCount,
      evalClauseD (P.fullRadiusValuation shadow selected) clause = true := by
  exact
    CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
      (P.fullRadiusValuation shadow selected)
      g3SourceTailSlice_perm_checkpoint
      (P.g3SourceTailSlice_sat hP shadow selected hShellCase hApexChoice
        hsix hseven)

end ExactFiveCommonShellV7
end Problem97
