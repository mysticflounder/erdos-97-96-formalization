/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.PrefixInheritedTailSemantics

/-!
# One-valuation semantics for the exact-five common-shell prefix

The component prefix theorems were originally stated under three nested
valuations.  This module proves that the final inherited-tail valuation
simultaneously satisfies the Census554 base family, the full separation
family, and the shell/source tail selected by the packet's actual shell case.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open Census554.CoverIndexBridge

private theorem CanonicalPacket.evalClauseD_inherited_eq_separation
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) {clause : List Int}
    (hbound : ∀ literal ∈ clause, literal.natAbs < 36451) :
    evalClauseD P.inheritedTailValuation clause =
      evalClauseD P.separationValuation clause := by
  apply evalClauseD_congr
  intro literal hliteral
  exact P.inheritedTailValuation_eq_separation_of_lt
    (hbound literal hliteral)

private theorem CanonicalPacket.evalClauseD_inherited_eq_base
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) {clause : List Int}
    (hbound : ∀ literal ∈ clause, literal.natAbs < 27287) :
    evalClauseD P.inheritedTailValuation clause =
      evalClauseD P.baseValuation clause := by
  calc
    evalClauseD P.inheritedTailValuation clause =
        evalClauseD P.separationValuation clause := by
      apply evalClauseD_congr
      intro literal hliteral
      exact P.inheritedTailValuation_eq_separation_of_lt
        (lt_trans (hbound literal hliteral) (by omega))
    _ = evalClauseD P.baseValuation clause := by
      apply evalClauseD_congr
      intro literal hliteral
      exact P.separationValuation_eq_base_of_lt
        (hbound literal hliteral)

set_option maxHeartbeats 0 in
-- The exact `native_decide` scan authenticates all 108704 retained base clauses.
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
/-- Every literal in the inherited Census554 base block precedes the first
separation-extension variable. -/
theorem baseDimacs_literal_lt_pairIndicatorStart :
    ∀ clause ∈ baseDimacs, ∀ literal ∈ clause,
      literal.natAbs < 27287 := by
  native_decide

private theorem indicatorClause_literal_lt_sourceChoiceStart
    {occurrence : IndicatorOccurrence}
    (hoccurrence : occurrence ∈ encoderIndicatorOccurrences) :
    ∀ literal ∈ indicatorClause occurrence,
      literal.natAbs < 36451 := by
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
    omega
  · simp [pairIndicatorVar]
    omega

private theorem selectorTotalityClause_literal_lt_sourceChoiceStart :
    ∀ literal ∈ selectorTotalityClause,
      literal.natAbs < 36451 := by
  intro literal hliteral
  obtain ⟨selector, _hselector, rfl⟩ :=
    List.mem_map.mp hliteral
  simp [varOfAtom]
  omega

private theorem guardedClause_literal_lt_sourceChoiceStart
    (occurrence : GuardedOccurrence) :
    ∀ literal ∈ guardedClause occurrence,
      literal.natAbs < 36451 := by
  intro literal hliteral
  simp only [guardedClause, List.mem_cons, List.not_mem_nil, or_false] at hliteral
  rcases hliteral with rfl | rfl | rfl
  · simp [varOfAtom]
    omega
  · simp [pairIndicatorVar]
    omega
  · simp [pairIndicatorVar]
    omega

/-- The inherited-tail valuation simultaneously satisfies the inherited base
and full separation families. -/
def CanonicalPacket.BaseSeparationFamilySat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) : Prop :=
  (∀ clause ∈ baseDimacs,
    evalClauseD P.inheritedTailValuation clause = true) ∧
  (∀ occurrence ∈ encoderIndicatorOccurrences,
    evalClauseD P.inheritedTailValuation
      (indicatorClause occurrence) = true) ∧
  evalClauseD P.inheritedTailValuation selectorTotalityClause = true ∧
  ∀ occurrence ∈ encoderGuardedOccurrences,
    evalClauseD P.inheritedTailValuation
      (guardedClause occurrence) = true

theorem CanonicalPacket.baseSeparationFamily_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube) :
    P.BaseSeparationFamilySat := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro clause hclause
    rw [P.evalClauseD_inherited_eq_base
      (baseDimacs_literal_lt_pairIndicatorStart clause hclause)]
    exact P.baseDimacs_sat hP clause hclause
  · intro occurrence hoccurrence
    rw [P.evalClauseD_inherited_eq_separation
      (indicatorClause_literal_lt_sourceChoiceStart hoccurrence)]
    exact P.indicatorClause_sat hP hoccurrence
  · rw [P.evalClauseD_inherited_eq_separation
      selectorTotalityClause_literal_lt_sourceChoiceStart]
    exact P.selectorTotalityClause_sat
  · intro occurrence hoccurrence
    rw [P.evalClauseD_inherited_eq_separation
      (guardedClause_literal_lt_sourceChoiceStart occurrence)]
    exact P.guardedClause_sat hoccurrence

/-- All three current prefix blocks under one valuation. -/
def CanonicalPacket.ShellCasePrefixFamilySat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) : Prop :=
  P.BaseSeparationFamilySat ∧ P.ShellCaseInheritedTailFamilySat

theorem CanonicalPacket.shellCasePrefixFamily_sat
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
    P.ShellCasePrefixFamilySat :=
  ⟨P.baseSeparationFamily_sat hP,
    P.shellCaseInheritedTailFamily_sat hP shadow hApexChoice
      hsixCenter hsevenCenter⟩

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.baseSeparationFamily_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.shellCasePrefixFamily_sat
