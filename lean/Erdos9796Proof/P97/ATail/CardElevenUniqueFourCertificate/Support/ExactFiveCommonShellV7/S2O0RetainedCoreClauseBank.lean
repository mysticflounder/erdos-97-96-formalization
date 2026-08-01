/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.S2O0SpecialFamilySemantics
import Erdos9796Proof.P97.Certificate.G3ParsedClauseNormalization

/-!
# Complete semantic bank for the exact-eleven `s2_o0` retained core

The compact LRAT ingress proves that the frozen 81,253-clause core is
unsatisfiable.  This module authenticates the 21 retained source-family
segments against that exact core and proves that the direct geometric
valuation satisfies every source clause.
-/

open Std.Sat

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554.CoverCnf
open CheckpointedRup.SemanticBoundary

set_option maxRecDepth 1000000

def s2O0ConvexFiveClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .convexFive fun index =>
    renderConvexFiveOccurrence (convexFiveOccurrenceAt index)

set_option maxHeartbeats 0 in
set_option linter.style.nativeDecide false in
private theorem s2O0RetainedConvexFiveOccurrences_valid :
    ∀ index ∈ s2O0RetainedIndices .convexFive,
      (convexFiveOccurrenceAt index).Valid := by
  native_decide

/-- The exact source clauses represented by the retained core, in the 21
source-family segments' original order. -/
def s2O0RetainedCoreSourceClauses : List (List Int) :=
  s2O0InheritedBaseClauses ++
  s2O0InheritedSeparationClauses ++
  s2O0InheritedSourceTailClausesFor s2O0ShellCase ++
  s2O0LocalTransitivityClauses ++
  s2O0SelectedLocalEqualityClauses ++
  s2O0SourceCenterClauses ++
  s2O0UsedCenterClauses ++
  s2O0ExactBlockerClauses ++
  s2O0NoQFreeClauses ++
  s2O0FirstApexExactFiveClauses s2O0ShellCase ++
  s2O0GlobalTransitivityClauses ++
  s2O0SelectedGlobalEqualityClauses ++
  s2O0FirstApexGlobalEqualityClauses s2O0ShellCase ++
  s2O0DuplicateCenterClauses ++
  s2O0PerpendicularBisectorClauses ++
  s2O0ConvexFiveClauses ++
  s2O0V6LocalFourClauses ++
  s2O0V6QDeletedPairClauses ++
  s2O0V6U5NontripleClauses ++
  s2O0V6U5CommonBisectorClauses ++
  s2O0V7TwoCenterBisectorClauses

set_option maxHeartbeats 0 in
set_option linter.style.nativeDecide false in
/-- The rendered source bank is clausewise identical up to literal order to
the exact runtime-parsed core consumed by the LRAT ingress. -/
theorem s2O0RetainedCoreSourceClauses_perm_core :
    List.Forall₂ List.Perm s2O0RetainedCoreSourceClauses
      (signedClausesOfFormula S2O0TextIngress.coreFormula) := by
  native_decide

private theorem s2O0RetainedRenderedClauses_sat
    (sigma : Nat → Bool) (family : S2O0RetainedFamily)
    (render : Fin family.sourceCount → List Int)
    (hsat : ∀ index, evalClauseD sigma (render index) = true) :
    ∀ clause ∈ s2O0RetainedRenderedClauses family render,
      evalClauseD sigma clause = true := by
  intro clause hclause
  unfold s2O0RetainedRenderedClauses at hclause
  obtain ⟨index, _hindex, rfl⟩ := List.mem_map.mp hclause
  exact hsat index

/-- Every rendered source clause of the exact retained core is satisfied by
the direct `s2_o0` full-radius valuation. -/
theorem CanonicalPacket.s2O0RetainedCoreSourceClauses_sat
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (hcard : D.A.card = 11)
    (shadow : SourceIndexedShadow H L P.cube)
    (hShellCase : P.shellCase = s2O0ShellCase)
    (hApexChoice : P.baseIndex 1 = P.shellCase.erasedCandidateIndex)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8) :
    ∀ clause ∈ s2O0RetainedCoreSourceClauses,
      evalClauseD (P.s2O0RetainedCoreValuation shadow) clause = true := by
  let sigma := P.s2O0RetainedCoreValuation shadow
  have hbase : ∀ clause ∈ s2O0InheritedBaseClauses,
      evalClauseD sigma clause = true := by
    simpa [s2O0InheritedBaseClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .inheritedBase
        (fun index =>
          renderG3BaseSliceWitness (.censusBase (s2O0BaseIndex index)))
        (fun index => P.renderG3BaseSliceWitness_sat hP shadow .s2_o9
          (.censusBase (s2O0BaseIndex index)))
  have hseparation : ∀ clause ∈ s2O0InheritedSeparationClauses,
      evalClauseD sigma clause = true := by
    simpa [s2O0InheritedSeparationClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .inheritedSeparation
        (fun index => renderG3SeparationSliceWitness
          (decodeSeparationWitness index))
        (fun index => P.renderG3SeparationSliceWitness_sat hP shadow .s2_o9
          (decodeSeparationWitness index))
  have hsourceTail :
      ∀ clause ∈ s2O0InheritedSourceTailClausesFor s2O0ShellCase,
        evalClauseD sigma clause = true := by
    simpa [CanonicalPacket.s2O0InheritedSourceTailClauses, hShellCase,
      sigma] using
      P.s2O0InheritedSourceTailClauses_sat hP shadow hShellCase
        hApexChoice hsix hseven
  have hlocalTrans : ∀ clause ∈ s2O0LocalTransitivityClauses,
      evalClauseD sigma clause = true := by
    simpa [s2O0LocalTransitivityClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .localEqualityTransitivity
        (fun index => renderLocalTransitivityOccurrence
          (localTransitivityOccurrenceAt index))
        (fun index => P.renderLocalTransitivityOccurrence_sat
          shadow .s2_o9 index)
  have hselectedLocal : ∀ clause ∈ s2O0SelectedLocalEqualityClauses,
      evalClauseD sigma clause = true := by
    simpa [s2O0SelectedLocalEqualityClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .selectedLocalEquality
        (fun index => renderSelectedLocalEqOccurrence
          (selectedLocalEqOccurrenceAt index))
        (fun index => P.renderSelectedLocalEqOccurrence_sat
          hP shadow .s2_o9 index)
  have hsourceCenter : ∀ clause ∈ s2O0SourceCenterClauses,
      evalClauseD sigma clause = true := by
    simpa [s2O0SourceCenterClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .sourceCenter
        (fun index => renderSourceCenterOccurrence
          (sourceCenterOccurrenceAt index))
        (fun index => P.renderSourceCenterOccurrence_sat
          hP shadow .s2_o9 index)
  have husedCenter : ∀ clause ∈ s2O0UsedCenterClauses,
      evalClauseD sigma clause = true := by
    simpa [s2O0UsedCenterClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .usedCenter
        (fun index => renderUsedCenterOccurrence
          (usedCenterOccurrenceAt index))
        (fun index => P.renderUsedCenterOccurrence_sat
          shadow .s2_o9 hsix hseven index)
  have hexactBlocker : ∀ clause ∈ s2O0ExactBlockerClauses,
      evalClauseD sigma clause = true := by
    simpa [s2O0ExactBlockerClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .exactBlocker
        (fun index => renderExactBlockerOccurrence
          (exactBlockerOccurrenceAt index))
        (fun index => P.renderExactBlockerOccurrence_sat
          hP shadow .s2_o9 index)
  have hnoQFree : ∀ clause ∈ s2O0NoQFreeClauses,
      evalClauseD sigma clause = true := by
    simpa [s2O0NoQFreeClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .noQFree
        (fun index => renderNoQFreeOccurrence (noQFreeOccurrenceAt index))
        (fun index => P.renderNoQFreeOccurrence_sat shadow .s2_o9 index)
  have hfirstApexExactFive :
      ∀ clause ∈ s2O0FirstApexExactFiveClauses s2O0ShellCase,
        evalClauseD sigma clause = true := by
    simpa [s2O0FirstApexExactFiveClauses, sigma] using
      s2O0RetainedRenderedClauses_sat sigma .firstApexExactFive
        (fun index => firstApexExactFivePayload
          (s2O0FirstApexExactFiveKindAt s2O0ShellCase index))
        (fun index => P.s2O0FirstApexExactFiveClause_sat
          shadow hShellCase index)
  have hglobalTrans : ∀ clause ∈ s2O0GlobalTransitivityClauses,
      evalClauseD sigma clause = true := by
    simpa [s2O0GlobalTransitivityClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .globalEqualityTransitivity
        (fun index => renderGlobalTransitivityOccurrence
          (globalTransitivityOccurrenceAt index))
        (fun index => P.renderGlobalTransitivityOccurrence_sat
          shadow .s2_o9 index)
  have hselectedGlobal :
      ∀ clause ∈ s2O0SelectedGlobalEqualityClauses,
        evalClauseD sigma clause = true := by
    simpa [s2O0SelectedGlobalEqualityClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .selectedGlobalEquality
        (fun index => renderSelectedGlobalEqOccurrence
          (selectedGlobalEqOccurrenceAt index))
        (fun index => P.renderSelectedGlobalEqOccurrence_sat
          hP shadow .s2_o9 index)
  have hfirstApexGlobal :
      ∀ clause ∈ s2O0FirstApexGlobalEqualityClauses s2O0ShellCase,
        evalClauseD sigma clause = true := by
    simpa [s2O0FirstApexGlobalEqualityClauses, sigma] using
      s2O0RetainedRenderedClauses_sat sigma .firstApexGlobalEquality
        (fun index =>
          let pair := s2O0FirstApexGlobalEqPairAt s2O0ShellCase index
          firstApexGlobalEqUnit pair.1 pair.2)
        (fun index => P.s2O0FirstApexGlobalEqClause_sat
          shadow hShellCase index)
  have hduplicate : ∀ clause ∈ s2O0DuplicateCenterClauses,
      evalClauseD sigma clause = true := by
    simpa [s2O0DuplicateCenterClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .duplicateCenter
        (fun index => renderDuplicateCenterOccurrence
          (duplicateCenterOccurrenceAt index))
        (fun index => P.renderDuplicateCenterOccurrence_sat
          shadow .s2_o9 index)
  have hperpendicular : ∀ clause ∈ s2O0PerpendicularBisectorClauses,
      evalClauseD sigma clause = true := by
    simpa [s2O0PerpendicularBisectorClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .perpendicularBisector
        (fun index => renderPerpendicularBisectorOccurrence
          (perpendicularBisectorOccurrenceAt index))
        (fun index => P.renderPerpendicularBisectorOccurrence_sat
          shadow .s2_o9 index)
  have hconvex : ∀ clause ∈ s2O0ConvexFiveClauses,
      evalClauseD sigma clause = true := by
    intro clause hclause
    unfold s2O0ConvexFiveClauses s2O0RetainedRenderedClauses at hclause
    obtain ⟨index, hindex, rfl⟩ := List.mem_map.mp hclause
    have hindexArray : index ∈ s2O0RetainedIndices .convexFive :=
      Array.mem_toList_iff.mp hindex
    simpa [sigma, CanonicalPacket.s2O0RetainedCoreValuation] using
      P.renderConvexFiveOccurrence_sat shadow .s2_o9
        (convexFiveOccurrenceAt index)
        (s2O0RetainedConvexFiveOccurrences_valid index hindexArray)
  have hv6Local : ∀ clause ∈ s2O0V6LocalFourClauses,
      evalClauseD sigma clause = true := by
    simpa [s2O0V6LocalFourClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .v6LocalFour
        (fun index => renderV6LocalFourOccurrence
          (v6LocalFourOccurrenceAt index))
        (fun index => P.renderV6LocalFourOccurrence_sat shadow .s2_o9 index)
  have hv6QDeleted : ∀ clause ∈ s2O0V6QDeletedPairClauses,
      evalClauseD sigma clause = true := by
    simpa [s2O0V6QDeletedPairClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .v6QDeletedPair
        (fun index => renderV6QDeletedPairOccurrence
          (v6QDeletedPairOccurrenceAt index))
        (fun index => P.renderV6QDeletedPairOccurrence_sat
          shadow .s2_o9 index)
  have hv6U5Nontriple : ∀ clause ∈ s2O0V6U5NontripleClauses,
      evalClauseD sigma clause = true := by
    simpa [s2O0V6U5NontripleClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .v6U5Nontriple
        (fun index => renderV6U5NontripleOccurrence
          (v6U5NontripleOccurrenceAt index))
        (fun index => P.renderV6U5NontripleOccurrence_sat
          hP shadow .s2_o9 index)
  have hv6U5Common : ∀ clause ∈ s2O0V6U5CommonBisectorClauses,
      evalClauseD sigma clause = true := by
    simpa [s2O0V6U5CommonBisectorClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .v6U5CommonBisector
        (fun index => renderV6U5CommonBisectorOccurrence
          (v6U5CommonBisectorOccurrenceAt index))
        (fun index => P.renderV6U5CommonBisectorOccurrence_sat
          hP shadow .s2_o9 index)
  have hv7TwoCenter : ∀ clause ∈ s2O0V7TwoCenterBisectorClauses,
      evalClauseD sigma clause = true := by
    simpa [s2O0V7TwoCenterBisectorClauses, sigma,
      CanonicalPacket.s2O0RetainedCoreValuation] using
      s2O0RetainedRenderedClauses_sat sigma .v7TwoCenterBisector
        (fun index => renderTwoCenterBisectorOccurrence
          (twoCenterBisectorOccurrenceAt index))
        (fun index => P.renderTwoCenterBisectorOccurrence_sat hcard
          shadow .s2_o9 (twoCenterBisectorOccurrenceAt index)
          (twoCenterBisectorOccurrenceAt_valid index))
  intro clause hclause
  simp only [s2O0RetainedCoreSourceClauses, List.mem_append] at hclause
  rcases hclause with
      hclause | hclause | hclause | hclause | hclause | hclause |
      hclause | hclause | hclause | hclause | hclause | hclause |
      hclause | hclause | hclause | hclause | hclause | hclause |
      hclause | hclause | hclause
  · exact hbase clause hclause
  · exact hseparation clause hclause
  · exact hsourceTail clause hclause
  · exact hlocalTrans clause hclause
  · exact hselectedLocal clause hclause
  · exact hsourceCenter clause hclause
  · exact husedCenter clause hclause
  · exact hexactBlocker clause hclause
  · exact hnoQFree clause hclause
  · exact hfirstApexExactFive clause hclause
  · exact hglobalTrans clause hclause
  · exact hselectedGlobal clause hclause
  · exact hfirstApexGlobal clause hclause
  · exact hduplicate clause hclause
  · exact hperpendicular clause hclause
  · exact hconvex clause hclause
  · exact hv6Local clause hclause
  · exact hv6QDeleted clause hclause
  · exact hv6U5Nontriple clause hclause
  · exact hv6U5Common clause hclause
  · exact hv7TwoCenter clause hclause

/-- The authenticated direct `s2_o0` semantic bank contradicts the frozen
compact LRAT replay. -/
theorem CanonicalPacket.false_of_s2O0RetainedCore
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (hcard : D.A.card = 11)
    (shadow : SourceIndexedShadow H L P.cube)
    (hShellCase : P.shellCase = s2O0ShellCase)
    (hApexChoice : P.baseIndex 1 = P.shellCase.erasedCandidateIndex)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8) : False := by
  have hcore :=
    CheckpointedRup.ParsedClauseNormalization.evalClauseD_all_core_of_source
      (P.s2O0RetainedCoreValuation shadow)
      s2O0RetainedCoreSourceClauses_perm_core
      (P.s2O0RetainedCoreSourceClauses_sat hP hcard shadow hShellCase
        hApexChoice hsix hseven)
  apply S2O0TextIngress.false_of_core_evalClauseD_sat
    (P.s2O0RetainedCoreValuation shadow)
  intro clause hclause
  exact hcore (signedClauseOfDefault clause)
    (List.mem_map.mpr ⟨clause, hclause, rfl⟩)

end ExactFiveCommonShellV7
end Problem97

#print axioms
  Problem97.ExactFiveCommonShellV7.s2O0RetainedCoreSourceClauses_perm_core
#print axioms
  Problem97.ExactFiveCommonShellV7.CanonicalPacket.s2O0RetainedCoreSourceClauses_sat
#print axioms
  Problem97.ExactFiveCommonShellV7.CanonicalPacket.false_of_s2O0RetainedCore
