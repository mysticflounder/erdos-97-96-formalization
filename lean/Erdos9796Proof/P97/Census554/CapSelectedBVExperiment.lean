/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedBVRoleBank
import Mathlib.Tactic

namespace Problem97.Census554.CapSelectedBVExperiment

open CapSelectedBVRoleBank

private abbrev RowBits := BitVec 121
private abbrev ColorBits := BitVec 847

private def digit2Left (code : Nat) : Nat := code / 11
private def digit2Right (code : Nat) : Nat := code % 11

private def digit3First (code : Nat) : Nat := code / 121
private def digit3Second (code : Nat) : Nat := (code / 11) % 11
private def digit3Third (code : Nat) : Nat := code % 11

private def digit5A (code : Nat) : Nat := code / 14641
private def digit5X (code : Nat) : Nat := (code / 1331) % 11
private def digit5B (code : Nat) : Nat := (code / 121) % 11
private def digit5C (code : Nat) : Nat := (code / 11) % 11
private def digit5Y (code : Nat) : Nat := code % 11

private def digit6A (code : Nat) : Nat := code / 161051
private def digit6B (code : Nat) : Nat := (code / 14641) % 11
private def digit6C (code : Nat) : Nat := (code / 1331) % 11
private def digit6X (code : Nat) : Nat := (code / 121) % 11
private def digit6Y (code : Nat) : Nat := (code / 11) % 11
private def digit6D (code : Nat) : Nat := code % 11

private def rowBit (rows : RowBits) (center point : Nat) : Bool :=
  rows.getLsbD (11 * center + point)

private def edgeColor (colors : ColorBits) (left right : Nat) : BitVec 7 :=
  colors.extractLsb' (7 * (11 * left + right)) 7

private def colorEq (colors : ColorBits)
    (a b c d : Nat) : Bool :=
  edgeColor colors a b == edgeColor colors c d

private def countWhere (items : List Nat) (p : Nat -> Bool) : BitVec 4 :=
  items.foldl (fun total item => total + bif p item then 1#4 else 0#4) 0#4

private def countRow (rows : RowBits) (center : Nat) : BitVec 4 :=
  countWhere labels (rowBit rows center)

private def countRowOn (rows : RowBits) (center : Nat)
    (points : List Nat) : BitVec 4 :=
  countWhere points (rowBit rows center)

private def countIntersection (rows : RowBits) (left right : Nat) : BitVec 4 :=
  countWhere labels fun point => rowBit rows left point && rowBit rows right point

private def countPairCenters (rows : RowBits) (left right : Nat) : BitVec 4 :=
  countWhere labels fun center => rowBit rows center left && rowBit rows center right

private def moser : List Nat := [0, 1, 2]
private def capS : List Nat := [1, 2, 3, 4, 5, 6]
private def intS : List Nat := [3, 4, 5, 6]
private def capO1 : List Nat := [0, 2, 7, 8]
private def intO1 : List Nat := [7, 8]
private def capO2 : List Nat := [0, 1, 9, 10]
private def intO2 : List Nat := [9, 10]

private def oneHitB (rows : RowBits) : Bool :=
  (countRowOn rows 0 [2, 7, 8]).ule 1#4 &&
  (countRowOn rows 0 [1, 9, 10]).ule 1#4 &&
  (countRowOn rows 1 [2, 3, 4, 5, 6]).ule 1#4 &&
  (countRowOn rows 1 [0, 9, 10]).ule 1#4 &&
  (countRowOn rows 2 [1, 3, 4, 5, 6]).ule 1#4 &&
  (countRowOn rows 2 [0, 7, 8]).ule 1#4

private def localRowsB (rows : RowBits) : Bool :=
  labels.all fun center =>
    countRow rows center == 4#4 &&
    !rowBit rows center center &&
    (center < 3 || (countRowOn rows center moser).ule 2#4)

private def intersectionsB (rows : RowBits) : Bool :=
  pairCodes.all fun code =>
    (countIntersection rows (digit2Left code) (digit2Right code)).ule 2#4

private def pairCenterCountB (rows : RowBits) : Bool :=
  pairCodes.all fun code =>
    (countPairCenters rows (digit2Left code) (digit2Right code)).ule 2#4

private def hullPosition : Nat -> Nat
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

private def offset (left right : Nat) : Nat :=
  (hullPosition right + 11 - hullPosition left) % 11

private def betweenB (left right point : Nat) : Bool :=
  decide (0 < offset left point && offset left point < offset left right)

private def separatedB (left right a b : Nat) : Bool :=
  betweenB left right a != betweenB left right b

private def crossSeparationB (rows : RowBits) : Bool :=
  pairCodes.all fun centerCode => pairCodes.all fun pointCode =>
    let left := digit2Left centerCode
    let right := digit2Right centerCode
    let a := digit2Left pointCode
    let b := digit2Right pointCode
    !(rowBit rows left a && rowBit rows left b &&
      rowBit rows right a && rowBit rows right b) ||
      separatedB left right a b

private def noTripleOn (rows : RowBits) (left right : Nat)
    (points : List Nat) : Bool :=
  points.all fun point =>
    !(rowBit rows left point && rowBit rows right point)

private def q3B (rows : RowBits) : Bool :=
  noTripleOn rows 0 1 intO2 &&
  (noTripleOn rows 0 1 intS || noTripleOn rows 0 1 intO1) &&
  noTripleOn rows 0 2 intO1 &&
  (noTripleOn rows 0 2 intS || noTripleOn rows 0 2 intO2) &&
  noTripleOn rows 1 2 intS &&
  (noTripleOn rows 1 2 intO1 || noTripleOn rows 1 2 intO2)

private def capSelectedCountsB (rows : RowBits) : Bool :=
  capS.all fun center =>
    countRowOn rows center capS == if center == 1 || center == 2 then 1#4 else 2#4

private def incidenceB (rows : RowBits) : Bool :=
  localRowsB rows && oneHitB rows && intersectionsB rows &&
    pairCenterCountB rows && crossSeparationB rows && q3B rows &&
    capSelectedCountsB rows

private def fixedPinnedB (rows : RowBits) (pinSource deleted : Nat) : Bool :=
  labels.all fun point =>
      rowBit rows 1 point ==
        (point == 0 || point == 7 || point == 8 || point == pinSource) &&
    rowBit rows 0 deleted

private def respectsRowsB (rows : RowBits) (colors : ColorBits) : Bool :=
  (labels.all fun a => labels.all fun b => colorEq colors a b b a) &&
  (labels.all fun center => labels.all fun a => labels.all fun b =>
    !(rowBit rows center a && rowBit rows center b) ||
      colorEq colors center a center b)

private def duplicateCoreB (colors : ColorBits) : Bool :=
  pairCodes.any fun centerCode => tripleCodes.any fun pointCode =>
    let a := digit2Left centerCode
    let b := digit2Right centerCode
    let p := digit3First pointCode
    let q := digit3Second pointCode
    let r := digit3Third pointCode
    colorEq colors a p a q && colorEq colors a p a r &&
      colorEq colors b p b q && colorEq colors b p b r

private def exactPinnedCoreB (rows : RowBits) (colors : ColorBits) : Bool :=
  labels.any fun a => labels.any fun z =>
    rowBit rows 1 a && !rowBit rows 1 z && colorEq colors 1 a 1 z

private def perpendicularCoreB (colors : ColorBits) : Bool :=
  pairCodes.any fun focusCode => tripleCodes.any fun pointCode =>
    let a := digit2Left focusCode
    let b := digit2Right focusCode
    let p := digit3First pointCode
    let q := digit3Second pointCode
    let r := digit3Third pointCode
    colorEq colors p a p b && colorEq colors q a q b &&
      colorEq colors r a r b

private def fivePointCoreB (colors : ColorBits) : Bool :=
  fiveRoleCodes.any fun code =>
    let a := digit5A code
    let x := digit5X code
    let b := digit5B code
    let c := digit5C code
    let y := digit5Y code
    colorEq colors x a x b && colorEq colors y a y b &&
      colorEq colors c b c x && colorEq colors c b c y

private def rhombusCoreB (colors : ColorBits) : Bool :=
  sixRoleCodes.any fun code =>
    let a := digit6A code
    let b := digit6B code
    let c := digit6C code
    let x := digit6X code
    let y := digit6Y code
    let d := digit6D code
    colorEq colors a b b c && colorEq colors a b c d &&
      colorEq colors a b d a && colorEq colors a b b y &&
      colorEq colors a b c y && colorEq colors a b x d &&
      colorEq colors a b x a

private def prefixCoreB (rows : RowBits) (colors : ColorBits) : Bool :=
  duplicateCoreB colors || exactPinnedCoreB rows colors ||
    perpendicularCoreB colors || fivePointCoreB colors || rhombusCoreB colors

private def antecedentB (rows : RowBits) (colors : ColorBits)
    (pinSource deleted : Nat) : Bool :=
  incidenceB rows && fixedPinnedB rows pinSource deleted &&
    respectsRowsB rows colors

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
example (rows : RowBits) (colors : ColorBits) :
    antecedentB rows colors 6 4 = true -> prefixCoreB rows colors = true := by
  simp (config := { maxSteps := 10000000 })
    [antecedentB, incidenceB, localRowsB, oneHitB, intersectionsB,
    pairCenterCountB, crossSeparationB, q3B, noTripleOn,
    capSelectedCountsB, fixedPinnedB, respectsRowsB, prefixCoreB,
    duplicateCoreB, exactPinnedCoreB, perpendicularCoreB, fivePointCoreB,
    rhombusCoreB, labels, pairCodes, tripleCodes, fiveRoleCodes, sixRoleCodes,
    digit2Left, digit2Right, digit3First, digit3Second, digit3Third,
    digit5A, digit5X, digit5B, digit5C, digit5Y, digit6A, digit6B, digit6C,
    digit6X, digit6Y, digit6D, countRow, countRowOn,
    countIntersection, countPairCenters, countWhere, rowBit, colorEq,
    edgeColor, separatedB, betweenB, offset, hullPosition, moser, capS,
    intS, capO1, intO1, capO2, intO2]
  bv_decide

end Problem97.Census554.CapSelectedBVExperiment
