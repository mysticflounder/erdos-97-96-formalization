/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedBVRoleBank
import Mathlib.Tactic

/-!
# Native row classifier for the cap-selected card-eleven branch

This module replaces the quantified color circuit with the same finite search
used by the direct census. Rows are eleven-bit masks. Equality closure is
computed deterministically by union-find on the 55 unoriented non-loop edges,
so the search has no free color variables.

The first checkpoint is executable performance on one placement. The
proof-facing soundness layer is kept separate from this search kernel.
-/

namespace Problem97
namespace Census554
namespace CapSelectedNativeClassifier

open CapSelectedBVRoleBank

abbrev RowMask := Nat

structure Row where
  center : Nat
  support : RowMask
deriving DecidableEq, Repr

structure Domain where
  center : Nat
  rows : List Row
deriving Repr

def labels : List Nat := List.range 11

def has (mask point : Nat) : Bool := mask.testBit point

def countPoints (mask : RowMask) (points : List Nat) : Nat :=
  points.foldl (fun count point => bif has mask point then count + 1 else count) 0

def supportPoints (mask : RowMask) : List Nat :=
  labels.filter fun point => has mask point

def commonPoints (left right : RowMask) : List Nat :=
  labels.filter fun point => has left point && has right point

def allEmptyCommon (left right : RowMask) (points : List Nat) : Bool :=
  points.all fun point => !(has left point && has right point)

def hullPosition : Nat -> Nat
  | 0 => 0
  | 9 => 1
  | 10 => 2
  | 1 => 3
  | 3 => 4
  | 4 => 5
  | 5 => 6
  | 6 => 7
  | 2 => 8
  | 7 => 9
  | 8 => 10
  | _ => 0

def cyclicBetween (left right point : Nat) : Bool :=
  let pointOffset := (hullPosition point + 11 - hullPosition left) % 11
  let rightOffset := (hullPosition right + 11 - hullPosition left) % 11
  decide (0 < pointOffset && pointOffset < rightOffset)

def cyclicSeparated (left right first second : Nat) : Bool :=
  cyclicBetween left right first != cyclicBetween left right second

def cyclicOffset (left right : Nat) : Nat :=
  (hullPosition right + 11 - hullPosition left) % 11

def cyclicFive (a x b c y : Nat) : Bool :=
  let ax := cyclicOffset a x
  let ab := cyclicOffset a b
  let ac := cyclicOffset a c
  let ay := cyclicOffset a y
  decide (0 < ax && ax < ab && ab < ac && ac < ay)

def cyclicFiveUpToOrientation (a x b c y : Nat) : Bool :=
  cyclicFive a x b c y || cyclicFive a y c b x

def moserOneHitOK (center : Nat) (support : RowMask) : Bool :=
  match center with
  | 0 => countPoints support [2, 7, 8] <= 1 &&
      countPoints support [1, 9, 10] <= 1
  | 1 => countPoints support [2, 3, 4, 5, 6] <= 1 &&
      countPoints support [0, 9, 10] <= 1
  | 2 => countPoints support [1, 3, 4, 5, 6] <= 1 &&
      countPoints support [0, 7, 8] <= 1
  | _ => true

def capSelectedCountOK (center : Nat) (support : RowMask) : Bool :=
  if 1 <= center && center <= 6 then
    countPoints support [1, 2, 3, 4, 5, 6] ==
      (if center <= 2 then 1 else 2)
  else
    true

def localCandidateOK (center deleted : Nat) (support : RowMask) : Bool :=
  countPoints support labels == 4 &&
    !has support center &&
    moserOneHitOK center support &&
    (if 3 <= center then countPoints support [0, 1, 2] <= 2 else true) &&
    capSelectedCountOK center support &&
    (if center == 0 then has support deleted else true)

def candidateRows (center deleted : Nat) : List Row :=
  (List.range 2048).filterMap fun support =>
    if localCandidateOK center deleted support then
      some { center, support }
    else
      none

def q3PairOK (left right : Row) : Bool :=
  let c := left.center
  let d := right.center
  let L := left.support
  let R := right.support
  if c == 0 && d == 1 || c == 1 && d == 0 then
    allEmptyCommon L R [9, 10] &&
      (allEmptyCommon L R [3, 4, 5, 6] || allEmptyCommon L R [7, 8])
  else if c == 0 && d == 2 || c == 2 && d == 0 then
    allEmptyCommon L R [7, 8] &&
      (allEmptyCommon L R [3, 4, 5, 6] || allEmptyCommon L R [9, 10])
  else if c == 1 && d == 2 || c == 2 && d == 1 then
    allEmptyCommon L R [3, 4, 5, 6] &&
      (allEmptyCommon L R [7, 8] || allEmptyCommon L R [9, 10])
  else
    true

def crossSeparationOK (left right : Row) : Bool :=
  match commonPoints left.support right.support with
  | first :: second :: _ =>
      cyclicSeparated left.center right.center first second
  | _ => true

def rowsCompatible (left right : Row) : Bool :=
  countPoints left.support (supportPoints right.support) <= 2 &&
    q3PairOK left right &&
    crossSeparationOK left right

def decodePair (code : Nat) : Nat × Nat := (code / 11, code % 11)

def containsPair (row : Row) (code : Nat) : Bool :=
  let pair := decodePair code
  has row.support pair.1 && has row.support pair.2

def pairBoundOK (assigned : List Row) (row : Row) : Bool :=
  pairCodes.all fun code =>
    !containsPair row code ||
      (assigned.countP fun previous => containsPair previous code) < 2

def compatibleWith (assigned : List Row) (row : Row) : Bool :=
  pairBoundOK assigned row && assigned.all fun previous => rowsCompatible row previous

def edgeCode (left right : Nat) : Nat :=
  if left < right then 11 * left + right else 11 * right + left

def initialParents : Array Nat := (List.range 121).toArray

def rootAux : Nat -> Array Nat -> Nat -> Nat
  | 0, _, edge => edge
  | fuel + 1, parents, edge =>
      let parent := parents[edge]!
      if parent == edge then edge else rootAux fuel parents parent

def root (parents : Array Nat) (edge : Nat) : Nat :=
  rootAux 121 parents edge

def unionEdges (parents : Array Nat) (left right : Nat) : Array Nat :=
  let leftRoot := root parents left
  let rightRoot := root parents right
  if leftRoot == rightRoot then parents else parents.set! rightRoot leftRoot

def addRowEqualities (parents : Array Nat) (row : Row) : Array Nat :=
  match supportPoints row.support with
  | [] => parents
  | first :: rest =>
      rest.foldl
        (fun current point =>
          unionEdges current (edgeCode row.center first) (edgeCode row.center point))
        parents

def equalityClosure (rows : List Row) : Array Nat :=
  rows.foldl addRowEqualities initialParents

def normalizedRoots (parents : Array Nat) : Array Nat :=
  (List.range 121).toArray.map fun edge => root parents edge

def edgesEqual (roots : Array Nat)
    (left₁ right₁ left₂ right₂ : Nat) : Bool :=
  roots[edgeCode left₁ right₁]! == roots[edgeCode left₂ right₂]!

def atLeast (count : Nat) (xs : List Nat) (predicate : Nat -> Bool) : Bool :=
  count <= xs.countP predicate

def duplicateCenterCore (roots : Array Nat) : Bool :=
  tripleCodes.any fun code =>
    let p := code / 121
    let q := (code / 11) % 11
    let r := code % 11
    atLeast 2 labels fun center =>
      edgesEqual roots center p center q &&
        edgesEqual roots center p center r

def exactPinnedOffCircleCore (roots : Array Nat) (pinned : RowMask) : Bool :=
  labels.any fun onCircle =>
    has pinned onCircle && labels.any fun offCircle =>
      !has pinned offCircle && edgesEqual roots 1 onCircle 1 offCircle

def perpendicularBisectorCore (roots : Array Nat) : Bool :=
  pairCodes.any fun code =>
    let pair := decodePair code
    atLeast 3 labels fun point =>
      edgesEqual roots point pair.1 point pair.2

def fivePointCoreAtEndpoints (roots : Array Nat) (a b : Nat) : Bool :=
  let bisectors := labels.filter fun point => edgesEqual roots point a point b
  bisectors.any fun x => bisectors.any fun y =>
    x != y && labels.any fun c =>
      cyclicFiveUpToOrientation a x b c y &&
        edgesEqual roots c b c x &&
        edgesEqual roots c b c y

def convexFivePointCore (roots : Array Nat) : Bool :=
  pairCodes.any fun code =>
    let pair := decodePair code
    fivePointCoreAtEndpoints roots pair.1 pair.2 ||
      fivePointCoreAtEndpoints roots pair.2 pair.1

def convexRhombusCore (roots : Array Nat) : Bool :=
  sixRoleCodes.any fun code =>
    let d := code % 11
    let code := code / 11
    let y := code % 11
    let code := code / 11
    let x := code % 11
    let code := code / 11
    let c := code % 11
    let code := code / 11
    let b := code % 11
    let a := code / 11
    edgesEqual roots a b b c &&
      edgesEqual roots a b c d &&
      edgesEqual roots a b d a &&
      edgesEqual roots a b b y &&
      edgesEqual roots a b c y &&
      edgesEqual roots a b x d &&
      edgesEqual roots a b x a

def hasPrefixCore (rows : List Row) : Bool :=
  let roots := normalizedRoots (equalityClosure rows)
  let pinned := rows.find? (fun row => row.center == 1)
  duplicateCenterCore roots ||
    (match pinned with
      | some row => exactPinnedOffCircleCore roots row.support
      | none => false) ||
    perpendicularBisectorCore roots ||
    convexFivePointCore roots

def insertDomain (domain : Domain) : List Domain -> List Domain
  | [] => [domain]
  | next :: rest =>
      if domain.rows.length <= next.rows.length then
        domain :: next :: rest
      else
        next :: insertDomain domain rest

def sortDomains (domains : List Domain) : List Domain :=
  domains.foldr insertDomain []

def restrictDomain (assigned : List Row) (domain : Domain) : Domain :=
  { domain with rows := domain.rows.filter fun row => compatibleWith assigned row }

def allKilled : Nat -> List Row -> List Domain -> Bool
  | 0, assigned, _ => hasPrefixCore assigned
  | fuel + 1, assigned, domains =>
      if hasPrefixCore assigned then
        true
      else
        match sortDomains domains with
        | [] => false
        | domain :: rest =>
            domain.rows.all fun row =>
              if compatibleWith assigned row then
                let nextAssigned := row :: assigned
                let nextDomains := rest.map (restrictDomain nextAssigned)
                if nextDomains.any fun next => next.rows.isEmpty then
                  true
                else
                  allKilled fuel nextAssigned nextDomains
              else
                true

def fixedPinnedRow (pinSource : Nat) : Row :=
  { center := 1
    support := 2 ^ 0 + 2 ^ 7 + 2 ^ 8 + 2 ^ pinSource }

def variableCenters : List Nat := [0, 2, 3, 4, 5, 6, 7, 8, 9, 10]

def placementCheck (pinSource deleted : Nat) : Bool :=
  let fixed := fixedPinnedRow pinSource
  if !localCandidateOK fixed.center deleted fixed.support then
    false
  else
    let assigned := [fixed]
    let domains := variableCenters.map fun center =>
      restrictDomain assigned { center, rows := candidateRows center deleted }
    if domains.any fun domain => domain.rows.isEmpty then
      true
    else
      allKilled variableCenters.length assigned domains

set_option maxHeartbeats 0 in
-- Native replay traverses the complete finite placement search tree.
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem placementCheck_p6_d4 : placementCheck 6 4 = true := by
  native_decide

end CapSelectedNativeClassifier
end Census554
end Problem97
