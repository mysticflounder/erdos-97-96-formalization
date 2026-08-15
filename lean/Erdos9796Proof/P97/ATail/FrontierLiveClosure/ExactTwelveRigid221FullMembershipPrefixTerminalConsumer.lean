/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ThreeTriadMembershipTerminalConsumer
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SurplusApexPairMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221AdjacentApexCrossBlockMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SecondCapApexSurplusMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SurplusThreeTriadMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ZeroCenterCrossBlockMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexZeroCrossBlockMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexPairCrossBlockMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexSharedPairCrossBlockMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexInternalSharedPairCommonFiveMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221AllOrderCommonFiveMembershipFamilyCnf

/-!
# Full exact-twelve positive-membership prefix consumer

This module gives one source-valued Boolean assignment to every authenticated
positive-membership variable from 44,876 through 47,136 and proves that the
assignment satisfies each generated implication or else the corresponding
source theorem refutes a blocking clause.  The construction deliberately
supports layers compiled against older prefixes: local and global valuations
are compared only at variables occurring in the layer's clauses.

The terminal theorem consumes one fixed named-deletion arm and a proof-carrying
source-order bank.  It does not assert terminal UNSAT, all-arm coverage, an
arbitrary-cardinality lift, or closure of a live theorem.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FullMembershipPrefixTerminalConsumer

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open FrozenNextRowJobCnf
open FrozenNextRowNamedDeletionJobCnf
open GenericRowNogoodCertificate
open NextRowTerminalBankConsumer
open PositiveMembershipCnfBridge
open SafeCoverIndexBridge
open SourceOrderTerminalBankConsumer
open StaticParentIngress
open StaticPositiveMembershipTerminalConsumer
open StaticRelationAssignment
open StaticTerminalConsumer
open TerminalBankConsumer
open scoped EuclideanGeometry

abbrev Label := ExactTwelveCarrierIngress.Label

/-- Source meaning of every positive-membership variable in the frozen prefix.
The branches are in exact variable-allocation order. -/
def globalRequirementAt (v : Nat) : RowChoice Label :=
  if v ≤ 44897 then BlockSpanningMembershipFamilyCnf.requirementAt v
  else if v ≤ 44902 then StaticCell1AfterFamilyThreeTriadMembershipCnf.requirementAt v
    else if v ≤ 44925 then SurplusApexPairMembershipFamilyCnf.requirementAt v
      else if v ≤ 44964 then AdjacentApexCrossBlockMembershipFamilyCnf.requirementAt v
        else if v ≤ 45000 then SecondCapApexSurplusMembershipFamilyCnf.requirementAt v
          else if v ≤ 45010 then SurplusThreeTriadMembershipFamilyCnf.requirementAt v
            else if v ≤ 45054 then ZeroCenterCrossBlockMembershipFamilyCnf.requirementAt v
              else if v ≤ 45077 then ApexZeroCrossBlockMembershipFamilyCnf.requirementAt v
                else if v ≤ 45096 then ApexPairCrossBlockMembershipFamilyCnf.requirementAt v
                  else if v ≤ 45126 then ApexSharedPairCrossBlockMembershipFamilyCnf.requirementAt v
                    else if v ≤ 45162 then ApexInternalSharedPairCommonFiveMembershipFamilyCnf.requirementAt v
                      else if v ≤ 45176 then ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.requirementAt v
                        else if v ≤ 45224 then ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf.requirementAt v
                          else if v ≤ 45241 then ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyCnf.requirementAt v
                            else if v ≤ 45247 then SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyCnf.requirementAt v
                              else if v ≤ 45277 then ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf.requirementAt v
                                else if v ≤ 45307 then SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.requirementAt v
                                  else if v ≤ 45337 then ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf.requirementAt v
                                    else if v ≤ 45357 then ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf.requirementAt v
                                      else if v ≤ 45369 then FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf.requirementAt v
                                        else if v ≤ 45489 then SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyCnf.requirementAt v
                                          else AllOrderCommonFiveMembershipFamilyCnf.requirementAt v

/-- One source-valued assignment for the complete generated membership prefix. -/
def globalMembershipAssign (base : Nat → Bool) (row : RowPattern Label) :
    Nat → Bool :=
  positiveMembershipAssign base 44875 row globalRequirementAt

private def blockSpanningLayerDimacs : List (List Int) :=
  BlockSpanningMembershipFamilyCnf.implicationDimacs ++ BlockSpanningMembershipFamilyCnf.blockingClauses

private def surplusApexPairLayerDimacs : List (List Int) :=
  SurplusApexPairMembershipFamilyCnf.implicationDimacs ++ SurplusApexPairMembershipFamilyCnf.blockingClauses

private def adjacentApexCrossBlockLayerDimacs : List (List Int) :=
  AdjacentApexCrossBlockMembershipFamilyCnf.implicationDimacs ++ AdjacentApexCrossBlockMembershipFamilyCnf.blockingClauses

private def secondCapApexSurplusLayerDimacs : List (List Int) :=
  SecondCapApexSurplusMembershipFamilyCnf.implicationDimacs ++ SecondCapApexSurplusMembershipFamilyCnf.blockingClauses

private def surplusThreeTriadLayerDimacs : List (List Int) :=
  SurplusThreeTriadMembershipFamilyCnf.implicationDimacs ++ SurplusThreeTriadMembershipFamilyCnf.blockingClauses

private def zeroCenterCrossBlockLayerDimacs : List (List Int) :=
  ZeroCenterCrossBlockMembershipFamilyCnf.implicationDimacs ++ ZeroCenterCrossBlockMembershipFamilyCnf.blockingClauses

private def apexZeroCrossBlockLayerDimacs : List (List Int) :=
  ApexZeroCrossBlockMembershipFamilyCnf.implicationDimacs ++ ApexZeroCrossBlockMembershipFamilyCnf.blockingClauses

private def apexPairCrossBlockLayerDimacs : List (List Int) :=
  ApexPairCrossBlockMembershipFamilyCnf.implicationDimacs ++ ApexPairCrossBlockMembershipFamilyCnf.blockingClauses

private def apexSharedPairCrossBlockLayerDimacs : List (List Int) :=
  ApexSharedPairCrossBlockMembershipFamilyCnf.implicationDimacs ++ ApexSharedPairCrossBlockMembershipFamilyCnf.blockingClauses

private def apexInternalSharedPairCommonFiveLayerDimacs : List (List Int) :=
  ApexInternalSharedPairCommonFiveMembershipFamilyCnf.implicationDimacs ++ ApexInternalSharedPairCommonFiveMembershipFamilyCnf.blockingClauses

private def apexFirstOppositeSharedPairCommonFiveLayerDimacs : List (List Int) :=
  ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.implicationDimacs ++ ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.blockingClauses

private def apexFirstOppositeSharedPairSecondOppositeCommonFiveLayerDimacs : List (List Int) :=
  ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf.implicationDimacs ++ ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf.blockingClauses

private def apexTripleSurplusSecondOppositeCommonFiveLayerDimacs : List (List Int) :=
  ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyCnf.implicationDimacs ++ ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyCnf.blockingClauses

private def surplusPairSecondOppositeApexPairCommonFiveLayerDimacs : List (List Int) :=
  SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyCnf.implicationDimacs ++ SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyCnf.blockingClauses

private def apexFirstSurplusSecondCommonFiveLayerDimacs : List (List Int) :=
  ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf.implicationDimacs ++ ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf.blockingClauses

private def secondApexSurplusSecondFirstCommonFiveLayerDimacs : List (List Int) :=
  SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.implicationDimacs ++ SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.blockingClauses

private def apexFirstOppositeSharedPairSurplusCommonFiveLayerDimacs : List (List Int) :=
  ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf.implicationDimacs ++ ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf.blockingClauses

private def reciprocalFirstOppositeSurplusSecondOppositeCommonFiveLayerDimacs : List (List Int) :=
  ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf.implicationDimacs ++ ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf.blockingClauses

private def firstOppositePairSurplusSecondOppositeCommonFiveLayerDimacs : List (List Int) :=
  FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf.implicationDimacs ++ FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf.blockingClauses

private def secondOppositeTripleSurplusFirstOppositeThreeTriadLayerDimacs : List (List Int) :=
  SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyCnf.implicationDimacs ++ SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyCnf.blockingClauses

private def allOrderCommonFiveLayerDimacs : List (List Int) :=
  AllOrderCommonFiveMembershipFamilyCnf.implicationDimacs ++ AllOrderCommonFiveMembershipFamilyCnf.blockingClauses

private def staticThreeTriadLayerDimacs : List (List Int) :=
  StaticCell1AfterFamilyThreeTriadMembershipCnf.implicationDimacs ++
    [StaticCell1AfterFamilyThreeTriadMembershipCnf.blockingClause]

/-- Generic composition of one generated implication/blocking layer. -/
private theorem layerDimacs_sat
    {Entry : Type}
    (σ localAssign : Nat → Bool)
    (implicationDimacs blockingClauses : List (List Int))
    (entries : List Entry) (clauseOf : Entry → List Int)
    (hblocks : blockingClauses = entries.map clauseOf)
    (himplication : ∀ clause ∈ implicationDimacs,
      evalClauseD localAssign clause = true)
    (hblock : ∀ entry ∈ entries,
      evalClauseD localAssign (clauseOf entry) = false → False)
    (heq : ∀ clause ∈ implicationDimacs ++ blockingClauses,
      evalClauseD localAssign clause = evalClauseD σ clause) :
    ∀ clause ∈ implicationDimacs ++ blockingClauses,
      evalClauseD σ clause = true := by
  intro clause hclause
  have hall := hclause
  rcases List.mem_append.mp hclause with himplicationClause | hblockingClause
  · rw [← heq clause hall]
    exact himplication clause himplicationClause
  · rw [hblocks] at hblockingClause
    obtain ⟨entry, hentry, rfl⟩ := List.mem_map.mp hblockingClause
    cases hvalue : evalClauseD localAssign (clauseOf entry) with
    | false => exact False.elim (hblock entry hentry hvalue)
    | true =>
        rw [← heq (clauseOf entry) hall]
        exact hvalue

/-- The global valuation gives every reused definition its recorded source
meaning. -/
private theorem globalAssignment_satisfies_reused
    (base : Nat → Bool) (row : RowPattern Label)
    (definitions : List PositiveMembershipDefinition)
    (hdefinitions : ∀ definition ∈ definitions,
      44875 < definition.varIndex ∧
        globalRequirementAt definition.varIndex = definition.requirement) :
    ∀ definition ∈ definitions,
      globalMembershipAssign base row definition.varIndex = decide
        (definition.requirement.support ⊆ row definition.requirement.center) := by
  intro definition hdefinition
  have hvalid := hdefinitions definition hdefinition
  simp only [globalMembershipAssign]
  rw [positiveMembershipAssign_of_lt base 44875 row globalRequirementAt
    hvalid.1, hvalid.2]

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem blockSpanning_clause_requirements :
    ∀ clause ∈ blockSpanningLayerDimacs, ∀ literal ∈ clause,
      44875 < literal.natAbs →
        BlockSpanningMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem surplusApexPair_clause_requirements :
    ∀ clause ∈ surplusApexPairLayerDimacs, ∀ literal ∈ clause,
      44902 < literal.natAbs →
        SurplusApexPairMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem adjacentApexCrossBlock_clause_requirements :
    ∀ clause ∈ adjacentApexCrossBlockLayerDimacs, ∀ literal ∈ clause,
      44925 < literal.natAbs →
        AdjacentApexCrossBlockMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem secondCapApexSurplus_clause_requirements :
    ∀ clause ∈ secondCapApexSurplusLayerDimacs, ∀ literal ∈ clause,
      44964 < literal.natAbs →
        SecondCapApexSurplusMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem surplusThreeTriad_clause_requirements :
    ∀ clause ∈ surplusThreeTriadLayerDimacs, ∀ literal ∈ clause,
      45000 < literal.natAbs →
        SurplusThreeTriadMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem zeroCenterCrossBlock_clause_requirements :
    ∀ clause ∈ zeroCenterCrossBlockLayerDimacs, ∀ literal ∈ clause,
      45010 < literal.natAbs →
        ZeroCenterCrossBlockMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem apexZeroCrossBlock_clause_requirements :
    ∀ clause ∈ apexZeroCrossBlockLayerDimacs, ∀ literal ∈ clause,
      45054 < literal.natAbs →
        ApexZeroCrossBlockMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem apexPairCrossBlock_clause_requirements :
    ∀ clause ∈ apexPairCrossBlockLayerDimacs, ∀ literal ∈ clause,
      45077 < literal.natAbs →
        ApexPairCrossBlockMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem apexSharedPairCrossBlock_clause_requirements :
    ∀ clause ∈ apexSharedPairCrossBlockLayerDimacs, ∀ literal ∈ clause,
      45077 < literal.natAbs →
        ApexSharedPairCrossBlockMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem apexInternalSharedPairCommonFive_clause_requirements :
    ∀ clause ∈ apexInternalSharedPairCommonFiveLayerDimacs, ∀ literal ∈ clause,
      45077 < literal.natAbs →
        ApexInternalSharedPairCommonFiveMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem apexFirstOppositeSharedPairCommonFive_clause_requirements :
    ∀ clause ∈ apexFirstOppositeSharedPairCommonFiveLayerDimacs, ∀ literal ∈ clause,
      45162 < literal.natAbs →
        ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem apexFirstOppositeSharedPairSecondOppositeCommonFive_clause_requirements :
    ∀ clause ∈ apexFirstOppositeSharedPairSecondOppositeCommonFiveLayerDimacs, ∀ literal ∈ clause,
      45176 < literal.natAbs →
        ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem apexTripleSurplusSecondOppositeCommonFive_clause_requirements :
    ∀ clause ∈ apexTripleSurplusSecondOppositeCommonFiveLayerDimacs, ∀ literal ∈ clause,
      45224 < literal.natAbs →
        ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem surplusPairSecondOppositeApexPairCommonFive_clause_requirements :
    ∀ clause ∈ surplusPairSecondOppositeApexPairCommonFiveLayerDimacs, ∀ literal ∈ clause,
      45241 < literal.natAbs →
        SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem apexFirstSurplusSecondCommonFive_clause_requirements :
    ∀ clause ∈ apexFirstSurplusSecondCommonFiveLayerDimacs, ∀ literal ∈ clause,
      45247 < literal.natAbs →
        ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem secondApexSurplusSecondFirstCommonFive_clause_requirements :
    ∀ clause ∈ secondApexSurplusSecondFirstCommonFiveLayerDimacs, ∀ literal ∈ clause,
      45277 < literal.natAbs →
        SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem apexFirstOppositeSharedPairSurplusCommonFive_clause_requirements :
    ∀ clause ∈ apexFirstOppositeSharedPairSurplusCommonFiveLayerDimacs, ∀ literal ∈ clause,
      45307 < literal.natAbs →
        ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem reciprocalFirstOppositeSurplusSecondOppositeCommonFive_clause_requirements :
    ∀ clause ∈ reciprocalFirstOppositeSurplusSecondOppositeCommonFiveLayerDimacs, ∀ literal ∈ clause,
      45337 < literal.natAbs →
        ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem firstOppositePairSurplusSecondOppositeCommonFive_clause_requirements :
    ∀ clause ∈ firstOppositePairSurplusSecondOppositeCommonFiveLayerDimacs, ∀ literal ∈ clause,
      45357 < literal.natAbs →
        FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem secondOppositeTripleSurplusFirstOppositeThreeTriad_clause_requirements :
    ∀ clause ∈ secondOppositeTripleSurplusFirstOppositeThreeTriadLayerDimacs, ∀ literal ∈ clause,
      45369 < literal.natAbs →
        SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem allOrderCommonFive_clause_requirements :
    ∀ clause ∈ allOrderCommonFiveLayerDimacs, ∀ literal ∈ clause,
      45489 < literal.natAbs →
        AllOrderCommonFiveMembershipFamilyCnf.requirementAt literal.natAbs =
          globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem staticThreeTriad_clause_requirements :
    ∀ clause ∈ staticThreeTriadLayerDimacs, ∀ literal ∈ clause,
      44897 < literal.natAbs →
        StaticCell1AfterFamilyThreeTriadMembershipCnf.requirementAt
            literal.natAbs = globalRequirementAt literal.natAbs := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem apexInternalSharedPairCommonFive_reused_requirements :
    ∀ definition ∈ ApexInternalSharedPairCommonFiveMembershipFamilyCnf.reusedDefinitions,
      44875 < definition.varIndex ∧
        globalRequirementAt definition.varIndex = definition.requirement := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem apexFirstOppositeSharedPairSecondOppositeCommonFive_reused_requirements :
    ∀ definition ∈ ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf.reusedDefinitions,
      44875 < definition.varIndex ∧
        globalRequirementAt definition.varIndex = definition.requirement := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem surplusPairSecondOppositeApexPairCommonFive_reused_requirements :
    ∀ definition ∈ SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyCnf.reusedDefinitions,
      44875 < definition.varIndex ∧
        globalRequirementAt definition.varIndex = definition.requirement := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem apexFirstSurplusSecondCommonFive_reused_requirements :
    ∀ definition ∈ ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf.reusedDefinitions,
      44875 < definition.varIndex ∧
        globalRequirementAt definition.varIndex = definition.requirement := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem secondApexSurplusSecondFirstCommonFive_reused_requirements :
    ∀ definition ∈ SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.reusedDefinitions,
      44875 < definition.varIndex ∧
        globalRequirementAt definition.varIndex = definition.requirement := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem apexFirstOppositeSharedPairSurplusCommonFive_reused_requirements :
    ∀ definition ∈ ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf.reusedDefinitions,
      44875 < definition.varIndex ∧
        globalRequirementAt definition.varIndex = definition.requirement := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem reciprocalFirstOppositeSurplusSecondOppositeCommonFive_reused_requirements :
    ∀ definition ∈ ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf.reusedDefinitions,
      44875 < definition.varIndex ∧
        globalRequirementAt definition.varIndex = definition.requirement := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem firstOppositePairSurplusSecondOppositeCommonFive_reused_requirements :
    ∀ definition ∈ FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf.reusedDefinitions,
      44875 < definition.varIndex ∧
        globalRequirementAt definition.varIndex = definition.requirement := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem secondOppositeTripleSurplusFirstOppositeThreeTriad_reused_requirements :
    ∀ definition ∈ SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyCnf.reusedDefinitions,
      44875 < definition.varIndex ∧
        globalRequirementAt definition.varIndex = definition.requirement := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
private theorem allOrderCommonFive_reused_requirements :
    ∀ definition ∈ AllOrderCommonFiveMembershipFamilyCnf.reusedDefinitions,
      44875 < definition.varIndex ∧
        globalRequirementAt definition.varIndex = definition.requirement := by
  native_decide +revert

private theorem blockSpanningLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ blockSpanningLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [blockSpanningLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        44875 row BlockSpanningMembershipFamilyCnf.requirementAt)
      (implicationDimacs := BlockSpanningMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := BlockSpanningMembershipFamilyCnf.blockingClauses)
      (entries := BlockSpanningMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        BlockSpanningMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        BlockSpanningMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 44875 row globalRequirementAt
            BlockSpanningMembershipFamilyCnf.requirementAt (by omega)
              (blockSpanning_clause_requirements clause hclause)))

private theorem surplusApexPairLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ surplusApexPairLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [surplusApexPairLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        44902 row SurplusApexPairMembershipFamilyCnf.requirementAt)
      (implicationDimacs := SurplusApexPairMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := SurplusApexPairMembershipFamilyCnf.blockingClauses)
      (entries := SurplusApexPairMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        SurplusApexPairMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        SurplusApexPairMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 44902 row globalRequirementAt
            SurplusApexPairMembershipFamilyCnf.requirementAt (by omega)
              (surplusApexPair_clause_requirements clause hclause)))

private theorem adjacentApexCrossBlockLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ adjacentApexCrossBlockLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [adjacentApexCrossBlockLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        44925 row AdjacentApexCrossBlockMembershipFamilyCnf.requirementAt)
      (implicationDimacs := AdjacentApexCrossBlockMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := AdjacentApexCrossBlockMembershipFamilyCnf.blockingClauses)
      (entries := AdjacentApexCrossBlockMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        AdjacentApexCrossBlockMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        AdjacentApexCrossBlockMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 44925 row globalRequirementAt
            AdjacentApexCrossBlockMembershipFamilyCnf.requirementAt (by omega)
              (adjacentApexCrossBlock_clause_requirements clause hclause)))

private theorem secondCapApexSurplusLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ secondCapApexSurplusLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [secondCapApexSurplusLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        44964 row SecondCapApexSurplusMembershipFamilyCnf.requirementAt)
      (implicationDimacs := SecondCapApexSurplusMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := SecondCapApexSurplusMembershipFamilyCnf.blockingClauses)
      (entries := SecondCapApexSurplusMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        SecondCapApexSurplusMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        SecondCapApexSurplusMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 44964 row globalRequirementAt
            SecondCapApexSurplusMembershipFamilyCnf.requirementAt (by omega)
              (secondCapApexSurplus_clause_requirements clause hclause)))

private theorem surplusThreeTriadLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ surplusThreeTriadLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [surplusThreeTriadLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45000 row SurplusThreeTriadMembershipFamilyCnf.requirementAt)
      (implicationDimacs := SurplusThreeTriadMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := SurplusThreeTriadMembershipFamilyCnf.blockingClauses)
      (entries := SurplusThreeTriadMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        SurplusThreeTriadMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        SurplusThreeTriadMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45000 row globalRequirementAt
            SurplusThreeTriadMembershipFamilyCnf.requirementAt (by omega)
              (surplusThreeTriad_clause_requirements clause hclause)))

private theorem zeroCenterCrossBlockLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ zeroCenterCrossBlockLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [zeroCenterCrossBlockLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45010 row ZeroCenterCrossBlockMembershipFamilyCnf.requirementAt)
      (implicationDimacs := ZeroCenterCrossBlockMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := ZeroCenterCrossBlockMembershipFamilyCnf.blockingClauses)
      (entries := ZeroCenterCrossBlockMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        ZeroCenterCrossBlockMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        ZeroCenterCrossBlockMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45010 row globalRequirementAt
            ZeroCenterCrossBlockMembershipFamilyCnf.requirementAt (by omega)
              (zeroCenterCrossBlock_clause_requirements clause hclause)))

private theorem apexZeroCrossBlockLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ apexZeroCrossBlockLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [apexZeroCrossBlockLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45054 row ApexZeroCrossBlockMembershipFamilyCnf.requirementAt)
      (implicationDimacs := ApexZeroCrossBlockMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := ApexZeroCrossBlockMembershipFamilyCnf.blockingClauses)
      (entries := ApexZeroCrossBlockMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        ApexZeroCrossBlockMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        ApexZeroCrossBlockMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45054 row globalRequirementAt
            ApexZeroCrossBlockMembershipFamilyCnf.requirementAt (by omega)
              (apexZeroCrossBlock_clause_requirements clause hclause)))

private theorem apexPairCrossBlockLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ apexPairCrossBlockLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [apexPairCrossBlockLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45077 row ApexPairCrossBlockMembershipFamilyCnf.requirementAt)
      (implicationDimacs := ApexPairCrossBlockMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := ApexPairCrossBlockMembershipFamilyCnf.blockingClauses)
      (entries := ApexPairCrossBlockMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        ApexPairCrossBlockMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        ApexPairCrossBlockMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45077 row globalRequirementAt
            ApexPairCrossBlockMembershipFamilyCnf.requirementAt (by omega)
              (apexPairCrossBlock_clause_requirements clause hclause)))

private theorem apexSharedPairCrossBlockLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ apexSharedPairCrossBlockLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [apexSharedPairCrossBlockLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45077 row ApexSharedPairCrossBlockMembershipFamilyCnf.requirementAt)
      (implicationDimacs := ApexSharedPairCrossBlockMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := ApexSharedPairCrossBlockMembershipFamilyCnf.blockingClauses)
      (entries := ApexSharedPairCrossBlockMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        ApexSharedPairCrossBlockMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        ApexSharedPairCrossBlockMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45077 row globalRequirementAt
            ApexSharedPairCrossBlockMembershipFamilyCnf.requirementAt (by omega)
              (apexSharedPairCrossBlock_clause_requirements clause hclause)))

private theorem apexInternalSharedPairCommonFiveLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ apexInternalSharedPairCommonFiveLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [apexInternalSharedPairCommonFiveLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45077 row ApexInternalSharedPairCommonFiveMembershipFamilyCnf.requirementAt)
      (implicationDimacs := ApexInternalSharedPairCommonFiveMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := ApexInternalSharedPairCommonFiveMembershipFamilyCnf.blockingClauses)
      (entries := ApexInternalSharedPairCommonFiveMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        ApexInternalSharedPairCommonFiveMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        ApexInternalSharedPairCommonFiveMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
        (globalAssignment_satisfies_reused base row
          ApexInternalSharedPairCommonFiveMembershipFamilyCnf.reusedDefinitions apexInternalSharedPairCommonFive_reused_requirements)
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45077 row globalRequirementAt
            ApexInternalSharedPairCommonFiveMembershipFamilyCnf.requirementAt (by omega)
              (apexInternalSharedPairCommonFive_clause_requirements clause hclause)))

private theorem apexFirstOppositeSharedPairCommonFiveLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ apexFirstOppositeSharedPairCommonFiveLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [apexFirstOppositeSharedPairCommonFiveLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45162 row ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.requirementAt)
      (implicationDimacs := ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.blockingClauses)
      (entries := ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45162 row globalRequirementAt
            ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.requirementAt (by omega)
              (apexFirstOppositeSharedPairCommonFive_clause_requirements clause hclause)))

private theorem apexFirstOppositeSharedPairSecondOppositeCommonFiveLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ apexFirstOppositeSharedPairSecondOppositeCommonFiveLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [apexFirstOppositeSharedPairSecondOppositeCommonFiveLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45176 row ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf.requirementAt)
      (implicationDimacs := ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf.blockingClauses)
      (entries := ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
        (globalAssignment_satisfies_reused base row
          ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf.reusedDefinitions apexFirstOppositeSharedPairSecondOppositeCommonFive_reused_requirements)
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45176 row globalRequirementAt
            ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf.requirementAt (by omega)
              (apexFirstOppositeSharedPairSecondOppositeCommonFive_clause_requirements clause hclause)))

private theorem apexTripleSurplusSecondOppositeCommonFiveLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ apexTripleSurplusSecondOppositeCommonFiveLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [apexTripleSurplusSecondOppositeCommonFiveLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45224 row ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyCnf.requirementAt)
      (implicationDimacs := ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyCnf.blockingClauses)
      (entries := ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45224 row globalRequirementAt
            ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyCnf.requirementAt (by omega)
              (apexTripleSurplusSecondOppositeCommonFive_clause_requirements clause hclause)))

private theorem surplusPairSecondOppositeApexPairCommonFiveLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ surplusPairSecondOppositeApexPairCommonFiveLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [surplusPairSecondOppositeApexPairCommonFiveLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45241 row SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyCnf.requirementAt)
      (implicationDimacs := SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyCnf.blockingClauses)
      (entries := SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
        (globalAssignment_satisfies_reused base row
          SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyCnf.reusedDefinitions surplusPairSecondOppositeApexPairCommonFive_reused_requirements)
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45241 row globalRequirementAt
            SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyCnf.requirementAt (by omega)
              (surplusPairSecondOppositeApexPairCommonFive_clause_requirements clause hclause)))

private theorem apexFirstSurplusSecondCommonFiveLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ apexFirstSurplusSecondCommonFiveLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [apexFirstSurplusSecondCommonFiveLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45247 row ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf.requirementAt)
      (implicationDimacs := ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf.blockingClauses)
      (entries := ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
        (globalAssignment_satisfies_reused base row
          ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf.reusedDefinitions apexFirstSurplusSecondCommonFive_reused_requirements)
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45247 row globalRequirementAt
            ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf.requirementAt (by omega)
              (apexFirstSurplusSecondCommonFive_clause_requirements clause hclause)))

private theorem secondApexSurplusSecondFirstCommonFiveLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ secondApexSurplusSecondFirstCommonFiveLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [secondApexSurplusSecondFirstCommonFiveLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45277 row SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.requirementAt)
      (implicationDimacs := SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.blockingClauses)
      (entries := SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
        (globalAssignment_satisfies_reused base row
          SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.reusedDefinitions secondApexSurplusSecondFirstCommonFive_reused_requirements)
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45277 row globalRequirementAt
            SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.requirementAt (by omega)
              (secondApexSurplusSecondFirstCommonFive_clause_requirements clause hclause)))

private theorem apexFirstOppositeSharedPairSurplusCommonFiveLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ apexFirstOppositeSharedPairSurplusCommonFiveLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [apexFirstOppositeSharedPairSurplusCommonFiveLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45307 row ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf.requirementAt)
      (implicationDimacs := ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf.blockingClauses)
      (entries := ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
        (globalAssignment_satisfies_reused base row
          ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf.reusedDefinitions apexFirstOppositeSharedPairSurplusCommonFive_reused_requirements)
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45307 row globalRequirementAt
            ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf.requirementAt (by omega)
              (apexFirstOppositeSharedPairSurplusCommonFive_clause_requirements clause hclause)))

private theorem reciprocalFirstOppositeSurplusSecondOppositeCommonFiveLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ reciprocalFirstOppositeSurplusSecondOppositeCommonFiveLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [reciprocalFirstOppositeSurplusSecondOppositeCommonFiveLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45337 row ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf.requirementAt)
      (implicationDimacs := ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf.blockingClauses)
      (entries := ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
        (globalAssignment_satisfies_reused base row
          ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf.reusedDefinitions reciprocalFirstOppositeSurplusSecondOppositeCommonFive_reused_requirements)
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45337 row globalRequirementAt
            ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf.requirementAt (by omega)
              (reciprocalFirstOppositeSurplusSecondOppositeCommonFive_clause_requirements clause hclause)))

private theorem firstOppositePairSurplusSecondOppositeCommonFiveLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ firstOppositePairSurplusSecondOppositeCommonFiveLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [firstOppositePairSurplusSecondOppositeCommonFiveLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45357 row FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf.requirementAt)
      (implicationDimacs := FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf.blockingClauses)
      (entries := FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
        (globalAssignment_satisfies_reused base row
          FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf.reusedDefinitions firstOppositePairSurplusSecondOppositeCommonFive_reused_requirements)
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45357 row globalRequirementAt
            FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf.requirementAt (by omega)
              (firstOppositePairSurplusSecondOppositeCommonFive_clause_requirements clause hclause)))

private theorem secondOppositeTripleSurplusFirstOppositeThreeTriadLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ secondOppositeTripleSurplusFirstOppositeThreeTriadLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [secondOppositeTripleSurplusFirstOppositeThreeTriadLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45369 row SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyCnf.requirementAt)
      (implicationDimacs := SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyCnf.blockingClauses)
      (entries := SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
        (globalAssignment_satisfies_reused base row
          SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyCnf.reusedDefinitions secondOppositeTripleSurplusFirstOppositeThreeTriad_reused_requirements)
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45369 row globalRequirementAt
            SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyCnf.requirementAt (by omega)
              (secondOppositeTripleSurplusFirstOppositeThreeTriad_clause_requirements clause hclause)))

private theorem allOrderCommonFiveLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ allOrderCommonFiveLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [allOrderCommonFiveLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        45489 row AllOrderCommonFiveMembershipFamilyCnf.requirementAt)
      (implicationDimacs := AllOrderCommonFiveMembershipFamilyCnf.implicationDimacs)
      (blockingClauses := AllOrderCommonFiveMembershipFamilyCnf.blockingClauses)
      (entries := AllOrderCommonFiveMembershipFamilyCnf.entries)
      (clauseOf := fun entry =>
        positiveMembershipBlockingClause entry.definitions)
      (by rfl)
      (fun clause hclause =>
        AllOrderCommonFiveMembershipFamilyCnf.implicationDimacs_sat hrow
          (globalMembershipAssign base row) hglobalBase hclause)
      (fun entry hentry hfalse =>
        AllOrderCommonFiveMembershipFamilyCnf.false_of_blockingClause_false
          (globalMembershipAssign base row) hreal order hforced hconv
        (globalAssignment_satisfies_reused base row
          AllOrderCommonFiveMembershipFamilyCnf.reusedDefinitions allOrderCommonFive_reused_requirements)
          entry hentry hfalse)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 45489 row globalRequirementAt
            AllOrderCommonFiveMembershipFamilyCnf.requirementAt (by omega)
              (allOrderCommonFive_clause_requirements clause hclause)))

private theorem staticThreeTriadLayer_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ staticThreeTriadLayerDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  simpa [staticThreeTriadLayerDimacs] using
    (layerDimacs_sat
      (σ := globalMembershipAssign base row)
      (localAssign := positiveMembershipAssign (globalMembershipAssign base row)
        44897 row
          StaticCell1AfterFamilyThreeTriadMembershipCnf.requirementAt)
      (implicationDimacs :=
        StaticCell1AfterFamilyThreeTriadMembershipCnf.implicationDimacs)
      (blockingClauses :=
        [StaticCell1AfterFamilyThreeTriadMembershipCnf.blockingClause])
      (entries := [()])
      (clauseOf := fun _ =>
        StaticCell1AfterFamilyThreeTriadMembershipCnf.blockingClause)
      (by rfl)
      (fun clause hclause =>
        StaticCell1AfterFamilyThreeTriadMembershipCnf.implicationDimacs_sat
          hrow (globalMembershipAssign base row) hglobalBase hclause)
      (fun _ _ hfalse => by
        have hpositive :=
          StaticCell1AfterFamilyThreeTriadMembershipCnf.positiveRowsMatch_of_blockingClause_false
            (globalMembershipAssign base row) row hfalse
        exact staticCell1AfterFamilyThreeTriadPositiveNogood.refutes
          hreal order hforced hconv hpositive)
      (fun clause hclause =>
        evalClauseD_positiveMembershipAssign_over_global_agrees_on
          base 44875 44897 row globalRequirementAt
            StaticCell1AfterFamilyThreeTriadMembershipCnf.requirementAt
              (by omega)
                (staticThreeTriad_clause_requirements clause hclause)))

/-- Exact generated positive-membership clause order used by the frozen v24
canary, before its named-deletion arm and source-order bank. -/
def fullMembershipPrefixDimacs : List (List Int) :=
  blockSpanningLayerDimacs ++
    staticThreeTriadLayerDimacs ++
    surplusApexPairLayerDimacs ++
    adjacentApexCrossBlockLayerDimacs ++
    secondCapApexSurplusLayerDimacs ++
    surplusThreeTriadLayerDimacs ++
    zeroCenterCrossBlockLayerDimacs ++
    apexZeroCrossBlockLayerDimacs ++
    apexPairCrossBlockLayerDimacs ++
    apexSharedPairCrossBlockLayerDimacs ++
    apexInternalSharedPairCommonFiveLayerDimacs ++
    apexFirstOppositeSharedPairCommonFiveLayerDimacs ++
    apexFirstOppositeSharedPairSecondOppositeCommonFiveLayerDimacs ++
    apexTripleSurplusSecondOppositeCommonFiveLayerDimacs ++
    surplusPairSecondOppositeApexPairCommonFiveLayerDimacs ++
    apexFirstSurplusSecondCommonFiveLayerDimacs ++
    secondApexSurplusSecondFirstCommonFiveLayerDimacs ++
    apexFirstOppositeSharedPairSurplusCommonFiveLayerDimacs ++
    reciprocalFirstOppositeSurplusSecondOppositeCommonFiveLayerDimacs ++
    firstOppositePairSurplusSecondOppositeCommonFiveLayerDimacs ++
    secondOppositeTripleSurplusFirstOppositeThreeTriadLayerDimacs ++
    allOrderCommonFiveLayerDimacs

set_option maxRecDepth 100000 in
private theorem fullMembershipPrefix_sat
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (base : Nat → Bool)
    (hrow : FrozenSafeCubeOK row)
    (hglobalBase : ∀ v, v ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row v =
        SafeCoverCnf.finalAssign (coverIndex row) v)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf)) :
    ∀ clause ∈ fullMembershipPrefixDimacs,
      evalClauseD (globalMembershipAssign base row) clause = true := by
  intro clause hclause
  unfold fullMembershipPrefixDimacs at hclause
  simp only [List.append_assoc] at hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact blockSpanningLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact staticThreeTriadLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact surplusApexPairLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact adjacentApexCrossBlockLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact secondCapApexSurplusLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact surplusThreeTriadLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact zeroCenterCrossBlockLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact apexZeroCrossBlockLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact apexPairCrossBlockLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact apexSharedPairCrossBlockLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact apexInternalSharedPairCommonFiveLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact apexFirstOppositeSharedPairCommonFiveLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact apexFirstOppositeSharedPairSecondOppositeCommonFiveLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact apexTripleSurplusSecondOppositeCommonFiveLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact surplusPairSecondOppositeApexPairCommonFiveLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact apexFirstSurplusSecondCommonFiveLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact secondApexSurplusSecondFirstCommonFiveLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact apexFirstOppositeSharedPairSurplusCommonFiveLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact reciprocalFirstOppositeSurplusSecondOppositeCommonFiveLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact firstOppositePairSurplusSecondOppositeCommonFiveLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  rcases List.mem_append.mp hclause with hclause | hclause
  · exact secondOppositeTripleSurplusFirstOppositeThreeTriadLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause
  exact allOrderCommonFiveLayer_sat base hrow hglobalBase hreal order hforced hconv clause hclause

/-- Exact one-arm terminal formula: frozen parent, all authenticated membership
layers, named-deletion arm suffix, then proof-carrying source-order cuts. -/
def terminalFullMembershipNamedDeletionArmDimacs
    (cell : FrozenNextRowArmCell)
    (bank : List SourceOrderPositiveNogood) : List (List Int) :=
  frozenParentDimacs cell.1 ++
    (fullMembershipPrefixDimacs ++
      (namedDeletionArmClauseDelta cell ++
        bank.map fun nogood => learnedClause nogood.choices))

/-- A terminal UNSAT proof for the exact full-prefix fixed-arm formula
contradicts every realized source configuration satisfying that arm.  This is
still one arm, not aggregate exact-twelve coverage. -/
theorem false_of_terminalFullMembershipNamedDeletionArmBank
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    {blocker : Fin 5 → Label}
    (cell : FrozenNextRowArmCell)
    (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenNextRowFixedNamedDeletionArmAddedConstraintsHold
      row blocker (cell.1.1 : Label × Label).1
        (cell.1.1 : Label × Label).2 cell.2)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (bank : List SourceOrderPositiveNogood)
    (hencodable : ∀ nogood ∈ bank, ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support)
    (hterminal : DimacsUnsatisfiable
      (terminalFullMembershipNamedDeletionArmDimacs cell bank)) : False := by
  obtain ⟨d, hparent⟩ :=
    exists_staticAssign_sat_frozenParentDimacs cell.1 hrow hadded.1 pointOf
      hreal hconv (by intro y; simp)
  let base := staticAssign cell.1 blocker row d pointOf
  have hbase : ∀ n, n ≤ SafeCoverCnf.baseNumVars →
      base n = SafeCoverCnf.finalAssign (coverIndex row) n :=
    staticAssign_agreesOnBase cell.1 blocker row d pointOf
  have hglobalBase : ∀ n, n ≤ SafeCoverCnf.baseNumVars →
      globalMembershipAssign base row n =
        SafeCoverCnf.finalAssign (coverIndex row) n := by
    intro n hn
    have hnCutoff : n ≤ 44875 := by
      rw [SafeCoverCnf.baseNumVars_eq] at hn
      omega
    rw [globalMembershipAssign,
      positiveMembershipAssign_of_le base 44875 row globalRequirementAt
        hnCutoff]
    exact hbase n hn
  apply hterminal
  refine ⟨globalMembershipAssign base row, ?_⟩
  intro clause hclause
  change clause ∈ frozenParentDimacs cell.1 ++
    (fullMembershipPrefixDimacs ++
      (namedDeletionArmClauseDelta cell ++
        bank.map fun nogood => learnedClause nogood.choices)) at hclause
  rcases List.mem_append.mp hclause with hparentClause | hrest
  · calc
      evalClauseD (globalMembershipAssign base row) clause =
          evalClauseD base clause := by
        apply SafeCoverCnf.evalClauseD_congr
        intro literal hliteral
        rw [globalMembershipAssign,
          positiveMembershipAssign_of_le base 44875 row globalRequirementAt
            (frozenParentDimacs_lit_bound cell.1 clause hparentClause literal
              hliteral)]
      _ = true := hparent clause hparentClause
  · rcases List.mem_append.mp hrest with hmembership | hrest
    · exact fullMembershipPrefix_sat base hrow hglobalBase hreal order hforced
        hconv clause hmembership
    · rcases List.mem_append.mp hrest with harm | hbank
      · calc
          evalClauseD (globalMembershipAssign base row) clause =
              evalClauseD base clause := by
            apply SafeCoverCnf.evalClauseD_congr
            intro literal hliteral
            rw [globalMembershipAssign,
              positiveMembershipAssign_of_le base 44875 row globalRequirementAt
                ((namedDeletionArmClauseDelta_lit_bound cell clause harm literal
                  hliteral).trans (by
                    rw [nextRowFinalNumVars_eq]
                    omega))]
          _ = evalClauseD (nextRowAssign cell.1 blocker row d) clause := by
            apply SafeCoverCnf.evalClauseD_congr
            intro literal hliteral
            exact staticAssign_eq_nextRowAssign_of_le cell.1 blocker row d
              pointOf
              (namedDeletionArmClauseDelta_lit_bound cell clause harm literal
                hliteral)
          _ = true := nextRowAssign_sat_namedDeletionArmClauseDelta
            cell hrow hadded d clause harm
      · obtain ⟨nogood, hnogood, rfl⟩ := List.mem_map.mp hbank
        by_cases hfalse : evalClauseD (globalMembershipAssign base row)
            (learnedClause nogood.choices) = false
        · have hsourceFalse :
              evalClauseD (SafeCoverCnf.finalAssign (coverIndex row))
                  (learnedClause nogood.choices) = false := by
            rw [← evalClauseD_of_agreesOnBase_learnedClause_eq
              nogood.choices (hencodable nogood hnogood) hglobalBase]
            exact hfalse
          have hselected := selectedByCoverIndex_of_learnedClause_false hrow
            (hencodable nogood hnogood) hsourceFalse
          have hpositive := positiveRowsMatch_of_selectedByCoverIndex hrow
            hselected
          exact False.elim
            (nogood.refutes hreal order hforced hconv hpositive)
        · cases heval : evalClauseD (globalMembershipAssign base row)
              (learnedClause nogood.choices) with
          | false => exact False.elim (hfalse heval)
          | true => rfl

end FullMembershipPrefixTerminalConsumer
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
