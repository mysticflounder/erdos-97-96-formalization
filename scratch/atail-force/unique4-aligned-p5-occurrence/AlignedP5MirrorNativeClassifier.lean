/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AlignedP5NativeClassifier

/-!
# Native classifier for the mirror aligned card-eleven exact-four surface

This is the mirror-layout specialization of `AlignedP5NativeClassifier`.  The
counterclockwise distinguished roles are first `0`, surplus `3`, and second
`7`.  The three closed caps are respectively `[0, 1, 2, 3]`,
`[3, 4, 5, 6, 7]`, and `[7, 8, 9, 10, 0]`, while the exact first row contains
`4`, `5`, and `6`.

The generic row compatibility, equality/metric core, search recursion, and
strict-Kalmanson schemas are reused from the original classifier.  In
particular, schema `6` is still searched with six roles.
-/

namespace Problem97
namespace ATailAlignedP5MirrorNativeClassifierScratch

open Census554.CapSelectedNativeClassifier

abbrev RowMask := ATailAlignedP5NativeClassifierScratch.RowMask
abbrev Row := ATailAlignedP5NativeClassifierScratch.Row
abbrev Domain := ATailAlignedP5NativeClassifierScratch.Domain

def secondOppositeCap : List Nat := [0, 1, 2, 3]
def firstOppositeCap : List Nat := [3, 4, 5, 6, 7]
def surplusCap : List Nat := [7, 8, 9, 10, 0]

def secondOppositeEndpoints : List Nat := [0, 3]
def firstOppositeEndpoints : List Nat := [3, 7]
def surplusEndpoints : List Nat := [7, 0]

def ownCapOK (center : Nat) (support : RowMask) : Bool :=
  ATailAlignedP5NativeClassifierScratch.capBoundOK
      secondOppositeCap secondOppositeEndpoints center support &&
    ATailAlignedP5NativeClassifierScratch.capBoundOK
      firstOppositeCap firstOppositeEndpoints center support &&
      ATailAlignedP5NativeClassifierScratch.capBoundOK
        surplusCap surplusEndpoints center support

def exactFirstClassOK (center : Nat) (support : RowMask) : Bool :=
  if center = 0 then has support 4 && has support 5 && has support 6 else true

def localCandidateOK (center : Nat) (support : RowMask) : Bool :=
  countPoints support ATailAlignedP5NativeClassifierScratch.labels = 4 &&
    !has support center &&
      ownCapOK center support &&
        exactFirstClassOK center support

def candidateRows (center : Nat) : List Row :=
  (List.range 2048).filterMap fun support =>
    if localCandidateOK center support then some { center, support } else none

def extraPoints : List Nat := [1, 2, 3, 7, 8, 9, 10]

def fixedFirstRow (extra : Nat) : Row :=
  { center := 0
    support := 2 ^ 4 + 2 ^ 5 + 2 ^ 6 + 2 ^ extra }

def variableCenters : List Nat := [3, 7, 1, 2, 4, 5, 6, 8, 9, 10]

def placementCheckForExtra (extra : Nat) : Bool :=
  let fixed := fixedFirstRow extra
  if !extraPoints.contains extra ||
      !localCandidateOK fixed.center fixed.support then
    false
  else
    let assigned := [fixed]
    let domains := variableCenters.map fun center =>
      ATailAlignedP5NativeClassifierScratch.restrictDomain assigned
        { center, rows := candidateRows center }
    if domains.any fun domain => domain.rows.isEmpty then
      true
    else
      ATailAlignedP5NativeClassifierScratch.allKilled
        variableCenters.length assigned domains

def placementCheck : Bool :=
  extraPoints.all placementCheckForExtra

end ATailAlignedP5MirrorNativeClassifierScratch
end Problem97
