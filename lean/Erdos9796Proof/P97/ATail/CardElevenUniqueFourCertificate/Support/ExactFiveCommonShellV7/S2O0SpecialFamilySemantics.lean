/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.S2O0RetainedCoreSemantics

/-!
# Direct semantics for the three route-sensitive `s2_o0` retained families

The compact `s2_o0` core is selector-free.  Its inherited source tail and its
two first-apex families therefore cannot be discharged by the guarded G3
ledgers.  This module proves those three source families directly for the
fixed `s2_o0` shell case.
-/

open Std.Sat
open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf

set_option maxRecDepth 1000000

attribute [local instance] Classical.propDecidable

private theorem CanonicalPacket.s2O0_evalClauseD_fullRadius_eq_inherited
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (clause : List Int)
    (hbound : ∀ literal ∈ clause,
      0 < literal.natAbs ∧ literal.natAbs < 27287) :
    evalClauseD (P.s2O0RetainedCoreValuation shadow) clause =
      evalClauseD P.inheritedTailValuation clause := by
  apply evalClauseD_congr
  intro literal hliteral
  have hliteralBounds := hbound literal hliteral
  change P.fullRadiusValuation shadow .s2_o9 literal.natAbs = _
  calc
    P.fullRadiusValuation shadow .s2_o9 literal.natAbs =
        P.fullSourceChoiceValuation shadow literal.natAbs :=
      P.fullRadiusValuation_eq_fullSourceChoice_of_lt shadow .s2_o9
        hliteralBounds.1 (by omega)
    _ = P.separationValuation literal.natAbs :=
      P.fullSourceChoiceValuation_eq_separation_of_lt shadow (by omega)
    _ = P.inheritedTailValuation literal.natAbs :=
      (P.inheritedTailValuation_eq_separation_of_lt (by omega)).symm

private theorem CanonicalPacket.s2O0_evalClauseD_fullRadius_eq_fullSourceChoice
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (clause : List Int)
    (hbound : ∀ literal ∈ clause,
      0 < literal.natAbs ∧ literal.natAbs < 41005) :
    evalClauseD (P.s2O0RetainedCoreValuation shadow) clause =
      evalClauseD (P.fullSourceChoiceValuation shadow) clause := by
  apply evalClauseD_congr
  intro literal hliteral
  change P.fullRadiusValuation shadow .s2_o9 literal.natAbs = _
  exact P.fullRadiusValuation_eq_fullSourceChoice_of_lt shadow .s2_o9
    (hbound literal hliteral).1 (hbound literal hliteral).2

set_option linter.style.nativeDecide false in
private theorem s2O0ShellCaseApexChoiceClause_literal_bounds :
    ∀ literal ∈ shellCaseApexChoiceClause s2O0ShellCase,
      0 < literal.natAbs ∧ literal.natAbs < 27287 := by
  native_decide

set_option linter.style.nativeDecide false in
private theorem s2O0BlockerShellChoiceClause_literal_bounds :
    ∀ literal ∈ blockerShellChoiceClause,
      0 < literal.natAbs ∧ literal.natAbs < 27287 := by
  native_decide

private def commonSourceChoiceAsFull
    (source : CommonSource) (choice : Fin 84) :
    SourceChoiceIndex (commonSourceLabel source) :=
  ⟨choice.val, by
    fin_cases source <;>
      simp [sourceChoiceCount, commonSourceLabel]⟩

set_option maxHeartbeats 0 in
-- Native reduction exhausts the two common sources and their 84 choices.
set_option linter.style.nativeDecide false in
private theorem commonSourceImplicationClause_eq_full :
    ∀ occurrence : CommonSourceOccurrence,
      commonSourceImplicationClause occurrence =
        sourceChoiceImplicationClause (commonSourceLabel occurrence.1)
          (commonSourceChoiceAsFull occurrence.1 occurrence.2) := by
  native_decide

set_option maxHeartbeats 0 in
-- Native reduction exhausts the two common-source totality clauses.
set_option linter.style.nativeDecide false in
private theorem commonSourceTotalityClause_eq_full :
    ∀ source : CommonSource,
      commonSourceTotalityClause source =
        sourceChoiceTotalityClause (commonSourceLabel source) := by
  native_decide

private theorem s2O0SourceChoiceVariable_upperBound
    (source : Label) (choice : SourceChoiceIndex source) :
    sourceChoiceVariable source choice < 41005 := by
  have hchoice := choice.isLt
  fin_cases source <;>
    simp [sourceChoiceVariable, sourceChoiceStart, sourceChoiceCount]
      at hchoice ⊢ <;>
    omega

private theorem s2O0SourceChoiceXVar_bounds
    (source : Label) (choice : SourceChoiceIndex source) :
    0 < xVar (sourceChoiceAt source choice).1.val
        (sourceChoiceAt source choice).2 ∧
      xVar (sourceChoiceAt source choice).1.val
          (sourceChoiceAt source choice).2 < 41005 := by
  have hfacts := sourceChoiceAt_facts source choice
  exact ⟨one_le_xVar (sourceChoiceAt source choice).1.val
      (sourceChoiceAt source choice).2,
    lt_of_le_of_lt
      (xVar_le_nX (sourceChoiceAt source choice).1.isLt hfacts.1)
      (lt_trans nX_lt_pairIndicatorStart (by omega))⟩

private theorem commonSourceImplicationClause_literal_bounds
    (occurrence : CommonSourceOccurrence) :
    ∀ literal ∈ commonSourceImplicationClause occurrence,
      0 < literal.natAbs ∧ literal.natAbs < 41005 := by
  rw [commonSourceImplicationClause_eq_full occurrence]
  intro literal hliteral
  simp only [sourceChoiceImplicationClause, List.mem_cons,
    List.not_mem_nil, or_false] at hliteral
  rcases hliteral with rfl | rfl
  · simpa using ⟨sourceChoiceVariable_pos
      (commonSourceLabel occurrence.1)
      (commonSourceChoiceAsFull occurrence.1 occurrence.2),
      s2O0SourceChoiceVariable_upperBound
        (commonSourceLabel occurrence.1)
        (commonSourceChoiceAsFull occurrence.1 occurrence.2)⟩
  · simpa using s2O0SourceChoiceXVar_bounds
      (commonSourceLabel occurrence.1)
      (commonSourceChoiceAsFull occurrence.1 occurrence.2)

private theorem commonSourceTotalityClause_literal_bounds
    (source : CommonSource) :
    ∀ literal ∈ commonSourceTotalityClause source,
      0 < literal.natAbs ∧ literal.natAbs < 41005 := by
  rw [commonSourceTotalityClause_eq_full source]
  intro literal hliteral
  simp only [sourceChoiceTotalityClause, List.mem_map] at hliteral
  obtain ⟨choice, _hchoice, rfl⟩ := hliteral
  simpa using ⟨sourceChoiceVariable_pos (commonSourceLabel source) choice,
    s2O0SourceChoiceVariable_upperBound (commonSourceLabel source) choice⟩

/-- The exact 169-clause inherited source tail is satisfied by the direct
`s2_o0` valuation. -/
theorem CanonicalPacket.s2O0InheritedSourceTailClauses_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (hShellCase : P.shellCase = s2O0ShellCase)
    (hApexChoice : P.baseIndex 1 = P.shellCase.erasedCandidateIndex)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8) :
    ∀ clause ∈ P.s2O0InheritedSourceTailClauses,
      evalClauseD (P.s2O0RetainedCoreValuation shadow) clause = true := by
  have hinherited :=
    P.shellCaseInheritedTailFamily_sat hP shadow hApexChoice hsix hseven
  have hsource :=
    P.fullSourceChoiceFamily_sat_of_commonCenters hP shadow hsix hseven
  intro clause hclause
  have hclauseFixed :
      clause ∈ s2O0InheritedSourceTailClausesFor s2O0ShellCase := by
    simpa [CanonicalPacket.s2O0InheritedSourceTailClauses, hShellCase] using
      hclause
  simp only [s2O0InheritedSourceTailClausesFor, List.mem_append,
    List.mem_cons, List.not_mem_nil, or_false, List.mem_map] at hclauseFixed
  rcases hclauseFixed with hprefix | htotalityOne
  · rcases hprefix with hprefix | ⟨occurrence, _hoccurrence, rfl⟩
    · rcases hprefix with hprefix | htotalityZero
      · rcases hprefix with hlow | ⟨occurrence, _hoccurrence, rfl⟩
        · rcases hlow with hapex | hblocker
          · rcases hapex with rfl
            rw [P.s2O0_evalClauseD_fullRadius_eq_inherited shadow
              (shellCaseApexChoiceClause s2O0ShellCase)
              s2O0ShellCaseApexChoiceClause_literal_bounds]
            simpa [hShellCase] using hinherited.1
          · rcases hblocker with rfl
            rw [P.s2O0_evalClauseD_fullRadius_eq_inherited shadow
              blockerShellChoiceClause
              s2O0BlockerShellChoiceClause_literal_bounds]
            exact hinherited.2.1
        · rw [P.s2O0_evalClauseD_fullRadius_eq_fullSourceChoice shadow
              (commonSourceImplicationClause occurrence)
              (commonSourceImplicationClause_literal_bounds occurrence)]
          rw [commonSourceImplicationClause_eq_full occurrence]
          exact hsource.1 (commonSourceLabel occurrence.1)
            (commonSourceChoiceAsFull occurrence.1 occurrence.2)
      · rcases htotalityZero with rfl
        rw [P.s2O0_evalClauseD_fullRadius_eq_fullSourceChoice shadow
          (commonSourceTotalityClause 0)
          (commonSourceTotalityClause_literal_bounds 0)]
        rw [commonSourceTotalityClause_eq_full 0]
        exact hsource.2.1 (commonSourceLabel 0)
    · rw [P.s2O0_evalClauseD_fullRadius_eq_fullSourceChoice shadow
          (commonSourceImplicationClause occurrence)
          (commonSourceImplicationClause_literal_bounds occurrence)]
      rw [commonSourceImplicationClause_eq_full occurrence]
      exact hsource.1 (commonSourceLabel occurrence.1)
        (commonSourceChoiceAsFull occurrence.1 occurrence.2)
  · rcases htotalityOne with rfl
    rw [P.s2O0_evalClauseD_fullRadius_eq_fullSourceChoice shadow
      (commonSourceTotalityClause 1)
      (commonSourceTotalityClause_literal_bounds 1)]
    rw [commonSourceTotalityClause_eq_full 1]
    exact hsource.2.1 (commonSourceLabel 1)

private def s2O0FirstApexExactFiveKindAtValid
    (index : Fin S2O0RetainedFamily.firstApexExactFive.sourceCount) : Prop :=
  match s2O0FirstApexExactFiveKindAt s2O0ShellCase index with
  | .equality left right =>
      left ∈ s2O0ShellCase.support ∧
      right ∈ s2O0ShellCase.support ∧
      (localEqRow (firstApexLocalEqualityIndex left right) =
          ⟨1, left, right⟩ ∨
        localEqRow (firstApexLocalEqualityIndex left right) =
          ⟨1, right, left⟩)
  | .exclusion inside outside =>
      inside ∈ s2O0ShellCase.support ∧
      outside ∉ s2O0ShellCase.support ∧
      (localEqRow (firstApexLocalEqualityIndex inside outside) =
          ⟨1, inside, outside⟩ ∨
        localEqRow (firstApexLocalEqualityIndex inside outside) =
          ⟨1, outside, inside⟩)

private instance
    (index : Fin S2O0RetainedFamily.firstApexExactFive.sourceCount) :
    Decidable (s2O0FirstApexExactFiveKindAtValid index) := by
  unfold s2O0FirstApexExactFiveKindAtValid
  cases s2O0FirstApexExactFiveKindAt s2O0ShellCase index <;>
    infer_instance

set_option maxHeartbeats 0 in
-- Native reduction exhausts the retained first-apex exact-five family.
set_option linter.style.nativeDecide false in
private theorem s2O0FirstApexExactFiveKindAt_valid :
    ∀ index : Fin S2O0RetainedFamily.firstApexExactFive.sourceCount,
      s2O0FirstApexExactFiveKindAtValid index := by
  native_decide

/-- One direct, unguarded first-apex exact-five source clause is satisfied by
the `s2_o0` valuation. -/
theorem CanonicalPacket.s2O0FirstApexExactFiveClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (hShellCase : P.shellCase = s2O0ShellCase)
    (index : Fin S2O0RetainedFamily.firstApexExactFive.sourceCount) :
    evalClauseD (P.s2O0RetainedCoreValuation shadow)
      (firstApexExactFivePayload
        (s2O0FirstApexExactFiveKindAt s2O0ShellCase index)) = true := by
  have hvalid := s2O0FirstApexExactFiveKindAt_valid index
  unfold s2O0FirstApexExactFiveKindAtValid at hvalid
  have hshell : P.shellLabels = s2O0ShellCase.support := by
    rw [P.shellLabels_eq, hShellCase]
  change evalClauseD (P.fullRadiusValuation shadow .s2_o9) _ = true
  cases hkind : s2O0FirstApexExactFiveKindAt s2O0ShellCase index with
  | equality left right =>
      rw [hkind] at hvalid
      obtain ⟨hleft, hright, hrow⟩ := hvalid
      have hleft' : left ∈ P.shellLabels := by simpa [hshell] using hleft
      have hright' : right ∈ P.shellLabels := by simpa [hshell] using hright
      have hlocal :
          P.localEqHolds
            (localEqRow (firstApexLocalEqualityIndex left right)) := by
        rcases hrow with hrow | hrow
        · rw [hrow]
          exact P.localEqHolds_one_of_shell hleft' hright'
        · rw [hrow]
          exact P.localEqHolds_one_of_shell hright' hleft'
      simp [firstApexExactFivePayload, evalClauseD, evalLitD,
        encodeG3Var_pos, P.fullRadiusValuation_localEquality, hlocal]
  | exclusion inside outside =>
      rw [hkind] at hvalid
      obtain ⟨hinside, houtside, hrow⟩ := hvalid
      have hinside' : inside ∈ P.shellLabels := by
        simpa [hshell] using hinside
      have houtside' : outside ∉ P.shellLabels := by
        simpa [hshell] using houtside
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
      simp [firstApexExactFivePayload, evalClauseD, evalLitD,
        P.fullRadiusValuation_localEquality, hnot]

set_option maxHeartbeats 0 in
-- Native reduction exhausts the retained first-apex global-equality family.
set_option linter.style.nativeDecide false in
theorem s2O0FirstApexGlobalEqPairAt_valid :
    ∀ index : Fin S2O0RetainedFamily.firstApexGlobalEquality.sourceCount,
      let pair := s2O0FirstApexGlobalEqPairAt s2O0ShellCase index
      pair.1 ∈ s2O0ShellCase.support ∧
      pair.2 ∈ s2O0ShellCase.support ∧
      globalEqRow (firstApexGlobalEqualityIndex pair.1 pair.2) =
        (canonicalEdge 1 pair.1, canonicalEdge 1 pair.2) := by
  native_decide

/-- One direct, unguarded first-apex global-equality source clause is
satisfied by the `s2_o0` valuation. -/
theorem CanonicalPacket.s2O0FirstApexGlobalEqClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (hShellCase : P.shellCase = s2O0ShellCase)
    (index : Fin S2O0RetainedFamily.firstApexGlobalEquality.sourceCount) :
    let pair := s2O0FirstApexGlobalEqPairAt s2O0ShellCase index
    evalClauseD (P.s2O0RetainedCoreValuation shadow)
      (firstApexGlobalEqUnit pair.1 pair.2) = true := by
  let pair := s2O0FirstApexGlobalEqPairAt s2O0ShellCase index
  obtain ⟨hleft, hright, hrow⟩ :=
    s2O0FirstApexGlobalEqPairAt_valid index
  have hleft' : pair.1 ∈ P.shellLabels := by
    rw [P.shellLabels_eq, hShellCase]
    exact hleft
  have hright' : pair.2 ∈ P.shellLabels := by
    rw [P.shellLabels_eq, hShellCase]
    exact hright
  have hglobal :
      P.globalEqHolds
        (globalEqRow
          (firstApexGlobalEqualityIndex pair.1 pair.2)) := by
    rw [hrow]
    exact P.globalEqHolds_one_of_shell hleft' hright'
  change evalClauseD (P.fullRadiusValuation shadow .s2_o9)
    (firstApexGlobalEqUnit pair.1 pair.2) = true
  unfold firstApexGlobalEqUnit evalClauseD
  have hpositive :
      0 < encodeG3Var
        (.globalEquality (firstApexGlobalEqualityIndex pair.1 pair.2)) :=
    encodeG3Var_pos _
  simpa [evalLitD, P.fullRadiusValuation_globalEquality, hglobal] using
    hpositive

end ExactFiveCommonShellV7
end Problem97

#print axioms
  Problem97.ExactFiveCommonShellV7.CanonicalPacket.s2O0InheritedSourceTailClauses_sat
#print axioms
  Problem97.ExactFiveCommonShellV7.CanonicalPacket.s2O0FirstApexExactFiveClause_sat
#print axioms
  Problem97.ExactFiveCommonShellV7.CanonicalPacket.s2O0FirstApexGlobalEqClause_sat
