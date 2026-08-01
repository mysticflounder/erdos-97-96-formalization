/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3V7TwoCenterBisectorSliceLedger
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.S2O0TextIngress

/-!
# Authenticated family ordinals for the exact-eleven `s2_o0` retained core

The compact `s2_o0` replay starts from 81,253 clauses drawn, in source order,
from 21 semantic families of the full v7 encoder.  This module decodes the
authenticated one-based source-family ordinals for those clauses.

The ordinal payloads are proof inputs, not a semantic proof by themselves.
The positive producer still has to render every decoded occurrence, prove it
satisfied by `s2O0RetainedCoreValuation`, and authenticate the rendered clause
bank against compact checkpoint zero.
-/

open Std.Sat
open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open CheckpointedRup.CompactIngress

set_option maxRecDepth 100000

/-- The 21 source families whose retained segments concatenate to the exact
81,253-clause `s2_o0` core. -/
inductive S2O0RetainedFamily where
  | inheritedBase
  | inheritedSeparation
  | inheritedSourceTail
  | localEqualityTransitivity
  | selectedLocalEquality
  | sourceCenter
  | usedCenter
  | exactBlocker
  | noQFree
  | firstApexExactFive
  | globalEqualityTransitivity
  | selectedGlobalEquality
  | firstApexGlobalEquality
  | duplicateCenter
  | perpendicularBisector
  | convexFive
  | v6LocalFour
  | v6QDeletedPair
  | v6U5Nontriple
  | v6U5CommonBisector
  | v7TwoCenterBisector
deriving DecidableEq, Repr

/-- Complete source-family size, before retained-core trimming. -/
def S2O0RetainedFamily.sourceCount : S2O0RetainedFamily → Nat
  | .inheritedBase => 207969
  | .inheritedSeparation => 179887
  | .inheritedSourceTail => 26191
  | .localEqualityTransitivity => 3960
  | .selectedLocalEquality => 11694
  | .sourceCenter => 6642
  | .usedCenter => 103
  | .exactBlocker => 46776
  | .noQFree => 11592
  | .firstApexExactFive => 35
  | .globalEqualityTransitivity => 78705
  | .selectedGlobalEquality => 11694
  | .firstApexGlobalEquality => 10
  | .duplicateCenter => 4620
  | .perpendicularBisector => 4620
  | .convexFive => 332640
  | .v6LocalFour => 9240
  | .v6QDeletedPair => 87120
  | .v6U5Nontriple => 117900
  | .v6U5CommonBisector => 39300
  | .v7TwoCenterBisector => 190080

/-- Number of clauses retained from one source family. -/
def S2O0RetainedFamily.retainedCount : S2O0RetainedFamily → Nat
  | .inheritedBase => 29295
  | .inheritedSeparation => 17792
  | .inheritedSourceTail => 169
  | .localEqualityTransitivity => 73
  | .selectedLocalEquality => 4642
  | .sourceCenter => 164
  | .usedCenter => 1
  | .exactBlocker => 16
  | .noQFree => 101
  | .firstApexExactFive => 7
  | .globalEqualityTransitivity => 1464
  | .selectedGlobalEquality => 8214
  | .firstApexGlobalEquality => 10
  | .duplicateCenter => 188
  | .perpendicularBisector => 172
  | .convexFive => 395
  | .v6LocalFour => 12
  | .v6QDeletedPair => 4
  | .v6U5Nontriple => 10
  | .v6U5CommonBisector => 2
  | .v7TwoCenterBisector => 18522

/-- One-based first position of a family segment in compact checkpoint zero. -/
def S2O0RetainedFamily.coreFirst : S2O0RetainedFamily → Nat
  | .inheritedBase => 1
  | .inheritedSeparation => 29296
  | .inheritedSourceTail => 47088
  | .localEqualityTransitivity => 47257
  | .selectedLocalEquality => 47330
  | .sourceCenter => 51972
  | .usedCenter => 52136
  | .exactBlocker => 52137
  | .noQFree => 52153
  | .firstApexExactFive => 52254
  | .globalEqualityTransitivity => 52261
  | .selectedGlobalEquality => 53725
  | .firstApexGlobalEquality => 61939
  | .duplicateCenter => 61949
  | .perpendicularBisector => 62137
  | .convexFive => 62309
  | .v6LocalFour => 62704
  | .v6QDeletedPair => 62716
  | .v6U5Nontriple => 62720
  | .v6U5CommonBisector => 62730
  | .v7TwoCenterBisector => 62732

/-- The exact manifest order of the retained family segments. -/
def s2O0RetainedFamilies : List S2O0RetainedFamily :=
  [.inheritedBase, .inheritedSeparation, .inheritedSourceTail,
    .localEqualityTransitivity, .selectedLocalEquality, .sourceCenter,
    .usedCenter, .exactBlocker, .noQFree, .firstApexExactFive,
    .globalEqualityTransitivity, .selectedGlobalEquality,
    .firstApexGlobalEquality, .duplicateCenter, .perpendicularBisector,
    .convexFive, .v6LocalFour, .v6QDeletedPair, .v6U5Nontriple,
    .v6U5CommonBisector, .v7TwoCenterBisector]

private def S2O0RetainedFamily.payload :
    S2O0RetainedFamily → String
  | .inheritedBase =>
      include_str "data/s2_o0_retained_core/inherited-census554-base-ordinals.a85"
  | .inheritedSeparation =>
      include_str "data/s2_o0_retained_core/inherited-separation-ordinals.a85"
  | .inheritedSourceTail =>
      include_str "data/s2_o0_retained_core/inherited-source-tail-ordinals.a85"
  | .localEqualityTransitivity =>
      include_str "data/s2_o0_retained_core/local-equality-transitivity-ordinals.a85"
  | .selectedLocalEquality =>
      include_str "data/s2_o0_retained_core/selected-row-internal-radius-equalities-ordinals.a85"
  | .sourceCenter =>
      include_str "data/s2_o0_retained_core/source-center-iff-some-source-row-choice-ordinals.a85"
  | .usedCenter =>
      include_str "data/s2_o0_retained_core/used-center-iff-some-source-center-map-ordinals.a85"
  | .exactBlocker =>
      include_str "data/s2_o0_retained_core/source-choice-implies-entire-blocker-radius-class-ordinals.a85"
  | .noQFree =>
      include_str "data/s2_o0_retained_core/source-choice-no-qfree-after-that-source-deletion-ordinals.a85"
  | .firstApexExactFive =>
      include_str "data/s2_o0_retained_core/first-apex-named-exact-five-entire-class-ordinals.a85"
  | .globalEqualityTransitivity =>
      include_str "data/s2_o0_retained_core/global-edge-equality-transitivity-ordinals.a85"
  | .selectedGlobalEquality =>
      include_str "data/s2_o0_retained_core/selected-row-global-equality-seeds-ordinals.a85"
  | .firstApexGlobalEquality =>
      include_str "data/s2_o0_retained_core/first-apex-exact-five-global-equality-seeds-ordinals.a85"
  | .duplicateCenter =>
      include_str "data/s2_o0_retained_core/duplicate-center-core-exclusions-ordinals.a85"
  | .perpendicularBisector =>
      include_str "data/s2_o0_retained_core/perpendicular-bisector-core-exclusions-ordinals.a85"
  | .convexFive =>
      include_str "data/s2_o0_retained_core/convex-five-point-core-forward-exclusions-ordinals.a85"
  | .v6LocalFour =>
      include_str "data/s2_o0_retained_core/v6-local-four-class-witness-iff-ordinals.a85"
  | .v6QDeletedPair =>
      include_str "data/s2_o0_retained_core/v6-qdeleted-pair-witness-iff-ordinals.a85"
  | .v6U5Nontriple =>
      include_str "data/s2_o0_retained_core/v6-u5-nontriple-equilateral-incompatibilities-ordinals.a85"
  | .v6U5CommonBisector =>
      include_str "data/s2_o0_retained_core/v6-u5-common-bisector-triple-incompatibilities-ordinals.a85"
  | .v7TwoCenterBisector =>
      include_str "data/s2_o0_retained_core/v7-global-two-center-bisector-parity-ordinals.a85"

private def readPositiveVarUIntAux (upperBound : Nat) :
    Nat → Nat → Nat → Nat → Nat → ByteArray → Option (Nat × Nat)
  | 0, _, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, position, bytes =>
      if h : position < bytes.size then
        let raw := (bytes.get position h).toNat
        let payload := raw % 128
        let candidate := value + payload * multiplier
        if upperBound < candidate then
          none
        else if raw < 128 then
          if (0 < used ∧ payload = 0) ∨ candidate = 0 then
            none
          else
            some (candidate, position + 1)
        else
          readPositiveVarUIntAux upperBound fuel (used + 1)
            (multiplier * 128) candidate (position + 1) bytes
      else
        none

private def readPositiveVarUInt (upperBound : Nat)
    (bytes : ByteArray) (position : Nat) : Option (Nat × Nat) :=
  readPositiveVarUIntAux upperBound 10 0 1 0 position bytes

private def decodePositiveDeltasAux (upperBound : Nat) (bytes : ByteArray) :
    Nat → Nat → Nat → Array (Fin upperBound) →
      Option (Array (Fin upperBound))
  | 0, position, _, output =>
      if position = bytes.size then some output else none
  | remaining + 1, position, previous, output => do
      let (delta, next) ← readPositiveVarUInt upperBound bytes position
      let current := previous + delta
      if hdelta : 0 < delta then
        if hcurrent : current ≤ upperBound then
          let sourceIndex : Fin upperBound :=
            ⟨current - 1, by omega⟩
          decodePositiveDeltasAux upperBound bytes remaining next current
            (output.push sourceIndex)
        else
          none
      else
        none

private def decodeRetainedIndices (family : S2O0RetainedFamily) :
    Option (Array (Fin family.sourceCount)) := do
  let bytes ← decodeAscii85 family.payload
  decodePositiveDeltasAux family.sourceCount bytes family.retainedCount 0 0 #[]

/-- Authenticated zero-based ordinals in a complete source family. -/
def s2O0RetainedIndices (family : S2O0RetainedFamily) :
    Array (Fin family.sourceCount) :=
  (decodeRetainedIndices family).getD #[]

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
theorem s2O0RetainedIndices_size (family : S2O0RetainedFamily) :
    (s2O0RetainedIndices family).size = family.retainedCount := by
  cases family <;> native_decide

set_option linter.style.nativeDecide false in
theorem s2O0RetainedFamily_count :
    s2O0RetainedFamilies.length = 21 := by
  native_decide

set_option linter.style.nativeDecide false in
theorem s2O0RetainedClause_count :
    (s2O0RetainedFamilies.map S2O0RetainedFamily.retainedCount).sum =
      81253 := by
  native_decide

/-- Render the retained source ordinals of one family in compact
checkpoint-zero order. -/
def s2O0RetainedRenderedClauses (family : S2O0RetainedFamily)
    (render : Fin family.sourceCount → List Int) : List (List Int) :=
  (s2O0RetainedIndices family).toList.map render

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
private theorem s2O0BaseDimacs_length :
    Census554.CoverCnf.baseDimacs.length = 207969 := by
  native_decide

def s2O0BaseIndex
    (index : Fin S2O0RetainedFamily.inheritedBase.sourceCount) :
    CensusBaseIndex :=
  ⟨index.val, by
    rw [s2O0BaseDimacs_length]
    exact index.isLt⟩

def s2O0InheritedBaseClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .inheritedBase fun index =>
    renderG3BaseSliceWitness (.censusBase (s2O0BaseIndex index))

def s2O0InheritedSeparationClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .inheritedSeparation fun index =>
    renderG3SeparationSliceWitness (decodeSeparationWitness index)

def s2O0RetainedCommonSourceOccurrences
    (source : CommonSource) : List CommonSourceOccurrence :=
  retainedCommonSourceOccurrences.filter fun occurrence =>
    occurrence.1 = source

/-- The exact 169-clause inherited source-tail bank for a fixed shell case. -/
def s2O0InheritedSourceTailClausesFor
    (shellCase : ShellCase) : List (List Int) :=
  [shellCaseApexChoiceClause shellCase, blockerShellChoiceClause] ++
    (s2O0RetainedCommonSourceOccurrences 0).map
      commonSourceImplicationClause ++
    [commonSourceTotalityClause 0] ++
    (s2O0RetainedCommonSourceOccurrences 1).map
      commonSourceImplicationClause ++
    [commonSourceTotalityClause 1]

/-- The exact 169-clause inherited source-tail bank in source order. -/
def CanonicalPacket.s2O0InheritedSourceTailClauses
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) : List (List Int) :=
  s2O0InheritedSourceTailClausesFor P.shellCase

/-- The known source ordinals of the exact source-tail bank, zero-based. -/
private def s2O0InheritedSourceTailExpectedOrdinals : List Nat :=
  [0, 1] ++
    ((List.range 85).map (17088 + ·)).filter (· != 17098) ++
    ((List.range 85).map (17423 + ·)).filter fun ordinal =>
      ordinal != 17433 && ordinal != 17497

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
set_option linter.style.nativeDecide false in
/-- The decoded source-tail ledger is exactly the source order represented by
`s2O0InheritedSourceTailClauses`. -/
theorem s2O0InheritedSourceTail_ordinals :
    (s2O0RetainedIndices .inheritedSourceTail).toList.map Fin.val =
      s2O0InheritedSourceTailExpectedOrdinals := by
  native_decide

/-- The shell case handled by the direct `s2_o0` certificate. -/
def s2O0ShellCase : ShellCase :=
  ⟨.labelTwo, .labelZero⟩

private def s2O0FirstApexSupport (shellCase : ShellCase) : List Label :=
  ((List.range 11).filter fun label =>
      toLabel label ∈ shellCase.support).map toLabel

private def s2O0FirstApexOutside (shellCase : ShellCase) : List Label :=
  ((List.range 11).filter fun label =>
      label != 1 && toLabel label ∉ shellCase.support).map toLabel

private def s2O0FirstApexExactFiveKinds (shellCase : ShellCase) :
    List FirstApexExactFiveKind :=
  ((s2O0FirstApexSupport shellCase).flatMap fun left =>
      ((s2O0FirstApexSupport shellCase).filter fun right =>
          left.val < right.val).map fun right =>
        .equality left right) ++
    ((s2O0FirstApexSupport shellCase).flatMap fun inside =>
      (s2O0FirstApexOutside shellCase).map fun outside =>
        .exclusion inside outside)

def s2O0FirstApexExactFiveKindAt
    (shellCase : ShellCase)
    (index : Fin S2O0RetainedFamily.firstApexExactFive.sourceCount) :
    FirstApexExactFiveKind :=
  (s2O0FirstApexExactFiveKinds shellCase).getD index.val (.equality 0 0)

private def s2O0FirstApexGlobalEqPairs
    (shellCase : ShellCase) : List (Label × Label) :=
  (combos 2
    ((List.range 11).filter fun label =>
      toLabel label ∈ shellCase.support)).map fun pair =>
    (toLabel (pair.getD 0 0), toLabel (pair.getD 1 0))

def s2O0FirstApexGlobalEqPairAt
    (shellCase : ShellCase)
    (index : Fin S2O0RetainedFamily.firstApexGlobalEquality.sourceCount) :
    Label × Label :=
  (s2O0FirstApexGlobalEqPairs shellCase).getD index.val (0, 0)

def s2O0LocalTransitivityClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .localEqualityTransitivity fun index =>
    renderLocalTransitivityOccurrence
      (localTransitivityOccurrenceAt index)

def s2O0SelectedLocalEqualityClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .selectedLocalEquality fun index =>
    renderSelectedLocalEqOccurrence
      (selectedLocalEqOccurrenceAt index)

def s2O0SourceCenterClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .sourceCenter fun index =>
    renderSourceCenterOccurrence (sourceCenterOccurrenceAt index)

def s2O0UsedCenterClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .usedCenter fun index =>
    renderUsedCenterOccurrence (usedCenterOccurrenceAt index)

def s2O0ExactBlockerClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .exactBlocker fun index =>
    renderExactBlockerOccurrence (exactBlockerOccurrenceAt index)

def s2O0NoQFreeClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .noQFree fun index =>
    renderNoQFreeOccurrence (noQFreeOccurrenceAt index)

def s2O0FirstApexExactFiveClauses
    (shellCase : ShellCase) : List (List Int) :=
  s2O0RetainedRenderedClauses .firstApexExactFive fun index =>
    firstApexExactFivePayload
      (s2O0FirstApexExactFiveKindAt shellCase index)

def s2O0GlobalTransitivityClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .globalEqualityTransitivity fun index =>
    renderGlobalTransitivityOccurrence
      (globalTransitivityOccurrenceAt index)

def s2O0SelectedGlobalEqualityClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .selectedGlobalEquality fun index =>
    renderSelectedGlobalEqOccurrence
      (selectedGlobalEqOccurrenceAt index)

def s2O0FirstApexGlobalEqualityClauses
    (shellCase : ShellCase) : List (List Int) :=
  s2O0RetainedRenderedClauses .firstApexGlobalEquality fun index =>
    let pair := s2O0FirstApexGlobalEqPairAt shellCase index
    firstApexGlobalEqUnit pair.1 pair.2

def s2O0DuplicateCenterClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .duplicateCenter fun index =>
    renderDuplicateCenterOccurrence
      (duplicateCenterOccurrenceAt index)

def s2O0PerpendicularBisectorClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .perpendicularBisector fun index =>
    renderPerpendicularBisectorOccurrence
      (perpendicularBisectorOccurrenceAt index)

def s2O0V6LocalFourClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .v6LocalFour fun index =>
    renderV6LocalFourOccurrence (v6LocalFourOccurrenceAt index)

def s2O0V6QDeletedPairClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .v6QDeletedPair fun index =>
    renderV6QDeletedPairOccurrence
      (v6QDeletedPairOccurrenceAt index)

def s2O0V6U5NontripleClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .v6U5Nontriple fun index =>
    renderV6U5NontripleOccurrence
      (v6U5NontripleOccurrenceAt index)

def s2O0V6U5CommonBisectorClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .v6U5CommonBisector fun index =>
    renderV6U5CommonBisectorOccurrence
      (v6U5CommonBisectorOccurrenceAt index)

def s2O0V7TwoCenterBisectorClauses : List (List Int) :=
  s2O0RetainedRenderedClauses .v7TwoCenterBisector fun index =>
    renderTwoCenterBisectorOccurrence
      (twoCenterBisectorOccurrenceAt index)

/-- The full-radius valuation restricted to the selector-free `s2_o0` core.

The dummy G3 route affects only variables `49358..49360`; every initial
`s2_o0` core variable lies in `1..49357`. -/
noncomputable def CanonicalPacket.s2O0RetainedCoreValuation
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (varIndex : Nat) : Bool :=
  P.fullRadiusValuation shadow .s2_o9 varIndex

end ExactFiveCommonShellV7
end Problem97

#print axioms
  Problem97.ExactFiveCommonShellV7.s2O0RetainedIndices_size
