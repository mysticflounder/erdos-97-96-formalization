/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.PrefixSeparationSemantics

/-!
# Inherited shell/source tail semantics for exact-five V7

This file authenticates the `169` inherited-tail clauses retained by the
exact-five V7 core:

* two shell-choice clauses;
* `83` retained source-`6` implications and its totality clause; and
* `82` retained source-`7` implications and its totality clause.

The source implications are proved for the full two `84`-choice families.
No sequential-counter auxiliary clause from the source-indexed encoding is
retained by this core, so the valuation only needs the exact choice variables.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open Census554.CoverIndexBridge

abbrev CommonSource := Fin 2
abbrev CommonSourceOccurrence := CommonSource × Fin 84

/-- The two common-source labels, in encoder order: `6`, then `7`. -/
def commonSourceLabel (source : CommonSource) : Label :=
  ⟨6 + source.val, by omega⟩

/-- Candidate indices at blocker center `8` whose row contains the source. -/
def commonSourceChoiceIndices (source : CommonSource) : List Nat :=
  (List.range (candCount 8)).filter fun candidateIndex =>
    ((candMasks 8).getD candidateIndex 0).testBit
      (commonSourceLabel source).val

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem commonSourceChoiceIndices_length (source : CommonSource) :
    (commonSourceChoiceIndices source).length = 84 := by
  fin_cases source <;> native_decide

/-- Exact candidate index named by a source-choice occurrence. -/
def commonSourceChoiceRow
    (source : CommonSource) (choice : Fin 84) : Nat :=
  (commonSourceChoiceIndices source).get
    ⟨choice.val, by
      simpa [commonSourceChoiceIndices_length source] using choice.isLt⟩

/-- Exact DIMACS starts for source `6` and source `7`. -/
def commonSourceChoiceStart (source : CommonSource) : Nat :=
  36451 + 168 * source.val

/-- Exact source-choice DIMACS variable. -/
def commonSourceChoiceVar (occurrence : CommonSourceOccurrence) : Nat :=
  commonSourceChoiceStart occurrence.1 + occurrence.2.val

/-- The retained source implications omit source-`6` choice `10` and
source-`7` choices `10,74`; all other choices survive core trimming. -/
def retainedCommonSourceOccurrences : List CommonSourceOccurrence :=
  ((List.finRange 2).flatMap fun source =>
    (List.finRange 84).map fun choice => (source, choice)).filter
      fun occurrence =>
        if occurrence.1.val = 0 then occurrence.2.val != 10
        else occurrence.2.val != 10 && occurrence.2.val != 74

set_option linter.style.nativeDecide false in
theorem retainedCommonSourceOccurrences_length :
    retainedCommonSourceOccurrences.length = 165 := by
  native_decide

/-- Candidate indices at blocker center `8` containing both named sources. -/
def blockerCommonPairCandidateIndices : List Nat :=
  (List.range (candCount 8)).filter fun candidateIndex =>
    ((candMasks 8).getD candidateIndex 0).testBit 6 &&
      ((candMasks 8).getD candidateIndex 0).testBit 7

/-- The exact center-`1` shell-choice clause (original input ID `387857`). -/
def apexShellChoiceClause : List Int :=
  [0, 12, 13].map fun candidateIndex =>
    Int.ofNat (xVar 1 candidateIndex)

/-- The center-`1` candidate indices retained by each of the four canonical
exact-five shell-case manifests. -/
def shellCaseApexCandidateIndices (shellCase : ShellCase) : List Nat :=
  match shellCase.surplus, shellCase.other with
  | .labelTwo, .labelZero => [0, 12, 13]
  | .labelTwo, .labelNine => [13, 14, 41]
  | .labelThree, .labelZero => [3, 12, 20]
  | .labelThree, .labelNine => [20, 21, 41]

/-- Case-indexed center-`1` shell-choice clause. -/
def shellCaseApexChoiceClause (shellCase : ShellCase) : List Int :=
  (shellCaseApexCandidateIndices shellCase).map fun candidateIndex =>
    Int.ofNat (xVar 1 candidateIndex)

set_option linter.style.nativeDecide false in
theorem ShellCase.erasedCandidateIndex_mem_apexCandidates
    (shellCase : ShellCase) :
    shellCase.erasedCandidateIndex ∈
      shellCaseApexCandidateIndices shellCase := by
  native_decide +revert

/-- The exact center-`8` shell-choice clause (original input ID `387858`). -/
def blockerShellChoiceClause : List Int :=
  blockerCommonPairCandidateIndices.map fun candidateIndex =>
    Int.ofNat (xVar 8 candidateIndex)

set_option linter.style.nativeDecide false in
theorem apexShellChoiceClause_exact :
    apexShellChoiceClause = [211, 223, 224] := by
  native_decide

set_option linter.style.nativeDecide false in
theorem blockerShellChoiceClause_exact :
    blockerShellChoiceClause =
      [1342, 1363, 1378, 1388, 1394, 1400, 1401, 1419, 1434, 1444,
        1450, 1456, 1457, 1469, 1479, 1485, 1491, 1492, 1499, 1505,
        1511, 1512, 1515, 1521, 1522, 1525, 1526, 1529] := by
  native_decide

/-- Exact implication `source choice -> selected blocker row`. -/
def commonSourceImplicationClause
    (occurrence : CommonSourceOccurrence) : List Int :=
  [-Int.ofNat (commonSourceChoiceVar occurrence),
    Int.ofNat (xVar 8
      (commonSourceChoiceRow occurrence.1 occurrence.2))]

/-- Exact source-choice totality clause. -/
def commonSourceTotalityClause (source : CommonSource) : List Int :=
  (List.finRange 84).map fun choice =>
    Int.ofNat (commonSourceChoiceVar (source, choice))

/-- Extend the separation valuation by the exact source-`6` and source-`7`
choice-variable ranges.  The unique true choice names the selected row at
blocker center `8`. -/
noncomputable def CanonicalPacket.inheritedTailValuation
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (varIndex : Nat) : Bool :=
  if hSix : 36451 ≤ varIndex ∧ varIndex < 36535 then
    decide
      (commonSourceChoiceRow 0
        ⟨varIndex - 36451, by omega⟩ = P.baseIndex 8)
  else if hSeven : 36619 ≤ varIndex ∧ varIndex < 36703 then
    decide
      (commonSourceChoiceRow 1
        ⟨varIndex - 36619, by omega⟩ = P.baseIndex 8)
  else
    P.separationValuation varIndex

/-- Below the first retained source-choice range, the final inherited-tail
valuation is exactly the separation valuation. -/
theorem CanonicalPacket.inheritedTailValuation_eq_separation_of_lt
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) {varIndex : Nat}
    (hvarIndex : varIndex < 36451) :
    P.inheritedTailValuation varIndex =
      P.separationValuation varIndex := by
  rw [CanonicalPacket.inheritedTailValuation,
    dif_neg (by omega), dif_neg (by omega)]

set_option maxRecDepth 10000 in
theorem CanonicalPacket.inheritedTailValuation_sourceChoice
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (occurrence : CommonSourceOccurrence) :
    P.inheritedTailValuation (commonSourceChoiceVar occurrence) =
      decide
        (commonSourceChoiceRow occurrence.1 occurrence.2 =
          P.baseIndex 8) := by
  rcases occurrence with ⟨source, choice⟩
  rcases source with ⟨source, hsource⟩
  interval_cases source
  · simp only [commonSourceChoiceVar, commonSourceChoiceStart, Prod.fst,
      Prod.snd, Fin.val_zero, Nat.mul_zero, Nat.add_zero]
    rw [CanonicalPacket.inheritedTailValuation]
    rw [dif_pos (by omega)]
    have hchoice :
        (⟨36451 + choice.val - 36451, by omega⟩ : Fin 84) = choice := by
      apply Fin.ext
      simp
    rw [hchoice]
    have hzero : (⟨0, hsource⟩ : Fin 2) = 0 := by
      apply Fin.ext
      rfl
    rw [hzero]
  · simp only [commonSourceChoiceVar, commonSourceChoiceStart, Prod.fst,
      Prod.snd, Fin.isValue, Nat.mul_one]
    rw [CanonicalPacket.inheritedTailValuation]
    rw [dif_neg (by omega), dif_pos (by omega)]
    have hchoice :
        (⟨36619 + choice.val - 36619, by omega⟩ : Fin 84) = choice := by
      apply Fin.ext
      simp
    rw [hchoice]
    have hone : (⟨1, hsource⟩ : Fin 2) = 1 := by
      apply Fin.ext
      rfl
    rw [hone]

theorem commonSourceChoiceRow_facts
    (source : CommonSource) (choice : Fin 84) :
    commonSourceChoiceRow source choice < candCount 8 ∧
      ((candMasks 8).getD (commonSourceChoiceRow source choice) 0).testBit
        (commonSourceLabel source).val = true := by
  have hmem :
      commonSourceChoiceRow source choice ∈
        commonSourceChoiceIndices source := by
    exact List.get_mem _ _
  simpa only [commonSourceChoiceIndices, List.mem_filter, List.mem_range,
    Bool.and_eq_true] using hmem

theorem CanonicalPacket.inheritedTailValuation_x
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) {center candidateIndex : Nat}
    (hcenter : center < 11) (hindex : candidateIndex < candCount center) :
    P.inheritedTailValuation (xVar center candidateIndex) =
      P.baseValuation (xVar center candidateIndex) := by
  have hx : xVar center candidateIndex < 27287 :=
    lt_of_le_of_lt (xVar_le_nX hcenter hindex)
      nX_lt_pairIndicatorStart
  rw [CanonicalPacket.inheritedTailValuation,
    dif_neg (by omega), dif_neg (by omega)]
  exact P.separationValuation_x hcenter hindex

theorem CanonicalPacket.commonSourceImplicationClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (occurrence : CommonSourceOccurrence) :
    evalClauseD P.inheritedTailValuation
      (commonSourceImplicationClause occurrence) = true := by
  have hrow :=
    commonSourceChoiceRow_facts occurrence.1 occurrence.2
  cases hchoice :
      P.inheritedTailValuation
        (commonSourceChoiceVar occurrence) with
  | false =>
      rw [evalClauseD]
      simp only [commonSourceImplicationClause, List.any_cons, List.any_nil,
        Bool.or_false, Bool.or_eq_true]
      left
      rw [evalLitD_negNat, hchoice]
      rfl
  | true =>
      have hroweq :
          commonSourceChoiceRow occurrence.1 occurrence.2 =
            P.baseIndex 8 := by
        have :=
          P.inheritedTailValuation_sourceChoice occurrence
        rw [hchoice] at this
        exact of_decide_eq_true this.symm
      have hx :
          P.inheritedTailValuation
              (xVar 8
                (commonSourceChoiceRow occurrence.1 occurrence.2)) =
            true := by
        rw [P.inheritedTailValuation_x (by omega) hrow.1]
        rw [P.baseValuation_x_iff hP (by omega) hrow.1]
        exact hroweq
      rw [evalClauseD]
      simp only [commonSourceImplicationClause, List.any_cons, List.any_nil,
        Bool.or_false, Bool.or_eq_true]
      right
      rw [evalLitD_pos P.inheritedTailValuation
        (lt_of_lt_of_le Nat.zero_lt_one
          (one_le_xVar 8
            (commonSourceChoiceRow occurrence.1 occurrence.2)))]
      exact hx

theorem CanonicalPacket.commonSourceTotalityClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (source : CommonSource)
    (hcenter : shadow.centerOf (commonSourceLabel source) = 8) :
    evalClauseD P.inheritedTailValuation
      (commonSourceTotalityClause source) = true := by
  have hsource :
      commonSourceLabel source ∈ P.cube.cube (8 : Label) := by
    simpa [hcenter] using
      shadow.source_mem_cube (commonSourceLabel source)
  have hbit :
      ((candMasks 8).getD (P.baseIndex 8) 0).testBit
          (commonSourceLabel source).val = true := by
    simpa [CanonicalPacket.baseIndex, hsource] using
      coverIndex_testBit_of_cubeOk hP (8 : Label)
        (commonSourceLabel source)
  have hindex : P.baseIndex 8 < candCount 8 :=
    coverIndex_lt_of_cubeOk hP (by omega)
  have hmem :
      P.baseIndex 8 ∈ commonSourceChoiceIndices source := by
    simp only [commonSourceChoiceIndices, List.mem_filter, List.mem_range,
      Bool.and_eq_true]
    exact ⟨hindex, hbit⟩
  obtain ⟨choice, hchoice⟩ :=
    (List.mem_iff_get.mp hmem)
  have hchoiceLt : choice.val < 84 := by
    rw [← commonSourceChoiceIndices_length source]
    exact choice.isLt
  let choice84 : Fin 84 :=
    ⟨choice.val, hchoiceLt⟩
  have hrow :
      commonSourceChoiceRow source choice84 = P.baseIndex 8 := by
    unfold commonSourceChoiceRow
    have hfin :
        (⟨choice84.val, by
          simpa only [commonSourceChoiceIndices_length] using
            choice84.isLt⟩ :
          Fin (commonSourceChoiceIndices source).length) = choice := by
      apply Fin.ext
      rfl
    rw [hfin]
    exact hchoice
  rw [evalClauseD, List.any_eq_true]
  refine ⟨Int.ofNat (commonSourceChoiceVar (source, choice84)), ?_, ?_⟩
  · simp [commonSourceTotalityClause]
  · rw [evalLitD_pos P.inheritedTailValuation (by
      unfold commonSourceChoiceVar commonSourceChoiceStart
      omega)]
    rw [P.inheritedTailValuation_sourceChoice]
    simp [hrow]

private theorem CanonicalPacket.blockerShellChoiceClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (hsix : (6 : Label) ∈ P.cube.cube 8)
    (hseven : (7 : Label) ∈ P.cube.cube 8) :
    evalClauseD P.inheritedTailValuation
      blockerShellChoiceClause = true := by
  have hindex : P.baseIndex 8 < candCount 8 :=
    coverIndex_lt_of_cubeOk hP (by omega)
  have hsixbit :
      ((candMasks 8).getD (P.baseIndex 8) 0).testBit 6 = true := by
    simpa [CanonicalPacket.baseIndex, hsix] using
      coverIndex_testBit_of_cubeOk hP (8 : Label) (6 : Label)
  have hsevenbit :
      ((candMasks 8).getD (P.baseIndex 8) 0).testBit 7 = true := by
    simpa [CanonicalPacket.baseIndex, hseven] using
      coverIndex_testBit_of_cubeOk hP (8 : Label) (7 : Label)
  have hmem :
      P.baseIndex 8 ∈ blockerCommonPairCandidateIndices := by
    simp only [blockerCommonPairCandidateIndices, List.mem_filter, List.mem_range,
      Bool.and_eq_true]
    exact ⟨hindex, hsixbit, hsevenbit⟩
  rw [evalClauseD, List.any_eq_true]
  refine
    ⟨Int.ofNat (xVar 8 (P.baseIndex 8)), ?_, ?_⟩
  · exact List.mem_map.mpr
      ⟨P.baseIndex 8, hmem, rfl⟩
  · rw [evalLitD_pos P.inheritedTailValuation (by
      exact lt_of_lt_of_le Nat.zero_lt_one
        (one_le_xVar 8 (P.baseIndex 8)))]
    rw [P.inheritedTailValuation_x (by omega) hindex]
    exact P.baseValuation_chosen hP (by omega)

private theorem CanonicalPacket.apexShellChoiceClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (hchoice : P.baseIndex 1 ∈ [0, 12, 13]) :
    evalClauseD P.inheritedTailValuation apexShellChoiceClause = true := by
  have hindex : P.baseIndex 1 < candCount 1 :=
    coverIndex_lt_of_cubeOk hP (by omega)
  rw [evalClauseD, List.any_eq_true]
  refine ⟨Int.ofNat (xVar 1 (P.baseIndex 1)), ?_, ?_⟩
  · exact List.mem_map.mpr ⟨P.baseIndex 1, hchoice, rfl⟩
  · rw [evalLitD_pos P.inheritedTailValuation (by
      exact lt_of_lt_of_le Nat.zero_lt_one
        (one_le_xVar 1 (P.baseIndex 1)))]
    rw [P.inheritedTailValuation_x (by omega) hindex]
    exact P.baseValuation_chosen hP (by omega)

/-- The case-indexed apex clause is witnessed by the exact erased shell row
constructed by the live prefix producer. -/
private theorem CanonicalPacket.shellCaseApexChoiceClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (hchoice :
      P.baseIndex 1 = P.shellCase.erasedCandidateIndex) :
    evalClauseD P.inheritedTailValuation
      (shellCaseApexChoiceClause P.shellCase) = true := by
  have hindex : P.baseIndex 1 < candCount 1 :=
    coverIndex_lt_of_cubeOk hP (by omega)
  rw [evalClauseD, List.any_eq_true]
  refine ⟨Int.ofNat (xVar 1 (P.baseIndex 1)), ?_, ?_⟩
  · apply List.mem_map.mpr
    refine ⟨P.baseIndex 1, ?_, rfl⟩
    rw [hchoice]
    exact P.shellCase.erasedCandidateIndex_mem_apexCandidates
  · rw [evalLitD_pos P.inheritedTailValuation (by
      exact lt_of_lt_of_le Nat.zero_lt_one
        (one_le_xVar 1 (P.baseIndex 1)))]
    rw [P.inheritedTailValuation_x (by omega) hindex]
    exact P.baseValuation_chosen hP (by omega)

/-- Typed satisfaction interface for all `169` retained inherited-tail
clauses. -/
def CanonicalPacket.InheritedTailFamilySat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) : Prop :=
  evalClauseD P.inheritedTailValuation apexShellChoiceClause = true ∧
  evalClauseD P.inheritedTailValuation blockerShellChoiceClause = true ∧
  (∀ occurrence ∈ retainedCommonSourceOccurrences,
    evalClauseD P.inheritedTailValuation
      (commonSourceImplicationClause occurrence) = true) ∧
  ∀ source : CommonSource,
    evalClauseD P.inheritedTailValuation
      (commonSourceTotalityClause source) = true

theorem inheritedTailFamily_clauseCount :
    2 + retainedCommonSourceOccurrences.length + 2 = 169 := by
  rw [retainedCommonSourceOccurrences_length]

theorem CanonicalPacket.inheritedTailFamily_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (hApexChoice : P.baseIndex 1 ∈ [0, 12, 13])
    (hsixCenter : shadow.centerOf 6 = 8)
    (hsevenCenter : shadow.centerOf 7 = 8) :
    P.InheritedTailFamilySat := by
  refine
    ⟨P.apexShellChoiceClause_sat hP hApexChoice,
      P.blockerShellChoiceClause_sat hP ?_ ?_, ?_, ?_⟩
  · simpa [hsixCenter] using shadow.source_mem_cube (6 : Label)
  · simpa [hsevenCenter] using shadow.source_mem_cube (7 : Label)
  · intro occurrence _hretained
    exact P.commonSourceImplicationClause_sat hP occurrence
  · intro source
    fin_cases source
    · exact P.commonSourceTotalityClause_sat hP shadow 0 hsixCenter
    · exact P.commonSourceTotalityClause_sat hP shadow 1 hsevenCenter

/-- The inherited tail with its apex clause selected from the packet's actual
four-way shell case. -/
def CanonicalPacket.ShellCaseInheritedTailFamilySat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) : Prop :=
  evalClauseD P.inheritedTailValuation
      (shellCaseApexChoiceClause P.shellCase) = true ∧
  evalClauseD P.inheritedTailValuation blockerShellChoiceClause = true ∧
  (∀ occurrence ∈ retainedCommonSourceOccurrences,
    evalClauseD P.inheritedTailValuation
      (commonSourceImplicationClause occurrence) = true) ∧
  ∀ source : CommonSource,
    evalClauseD P.inheritedTailValuation
      (commonSourceTotalityClause source) = true

/-- Source-clean satisfaction of the case-indexed inherited tail.  Unlike the
literal v7 retained-clause wrapper, this needs no manually supplied apex
candidate disjunction. -/
theorem CanonicalPacket.shellCaseInheritedTailFamily_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (hApexChoice :
      P.baseIndex 1 = P.shellCase.erasedCandidateIndex)
    (hsixCenter : shadow.centerOf 6 = 8)
    (hsevenCenter : shadow.centerOf 7 = 8) :
    P.ShellCaseInheritedTailFamilySat := by
  refine
    ⟨P.shellCaseApexChoiceClause_sat hP hApexChoice,
      P.blockerShellChoiceClause_sat hP ?_ ?_, ?_, ?_⟩
  · simpa [hsixCenter] using shadow.source_mem_cube (6 : Label)
  · simpa [hsevenCenter] using shadow.source_mem_cube (7 : Label)
  · intro occurrence _hretained
    exact P.commonSourceImplicationClause_sat hP occurrence
  · intro source
    fin_cases source
    · exact P.commonSourceTotalityClause_sat hP shadow 0 hsixCenter
    · exact P.commonSourceTotalityClause_sat hP shadow 1 hsevenCenter

end ExactFiveCommonShellV7
end Problem97
