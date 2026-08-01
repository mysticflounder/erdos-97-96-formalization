/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.S2O0SpecialFamilySemantics
import Erdos9796Proof.P97.Certificate.G3ParsedClauseNormalization

/-!
# Computed facts for the exact-eleven `s2_o0` retained core

This module isolates the native reductions used to authenticate the retained
source-family bank. In particular, the 81,253-clause permutation check is cached
independently of the downstream semantic assembly.
-/

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open CheckpointedRup.SemanticBoundary

set_option maxRecDepth 1000000

private instance (occurrence : ConvexFiveOccurrence) :
    Decidable occurrence.Valid := by
  unfold ConvexFiveOccurrence.Valid
  infer_instance

def s2O0ConvexFiveClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .convexFive fun index =>
    renderConvexFiveOccurrence (convexFiveOccurrenceAt index)

set_option maxHeartbeats 0 in
-- Native reduction checks every retained convex-five occurrence in the bank.
set_option linter.style.nativeDecide false in
/-- Every retained convex-five occurrence satisfies its computable validity predicate. -/
theorem s2O0RetainedConvexFiveOccurrences_valid :
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
-- Native reduction compares all 81,253 rendered clauses with the parsed core.
set_option linter.style.nativeDecide false in
/-- The rendered source bank is clausewise identical up to literal order to
the exact runtime-parsed core consumed by the LRAT ingress. -/
theorem s2O0RetainedCoreSourceClauses_perm_core :
    List.Forall₂ List.Perm s2O0RetainedCoreSourceClauses
      (signedClausesOfFormula S2O0TextIngress.coreFormula) := by
  native_decide

end ExactFiveCommonShellV7
end Problem97

#print axioms
  Problem97.ExactFiveCommonShellV7.s2O0RetainedConvexFiveOccurrences_valid
#print axioms
  Problem97.ExactFiveCommonShellV7.s2O0RetainedCoreSourceClauses_perm_core
