/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Exact rational local countermodel for three complete reverse rows

This file kernel-checks the rational-coordinate model independently replayed
by `verify_exact_countermodel.py`.  It is a countermodel only to the local
Euclidean/MEC inference: it does not construct global K4, a total critical
map, deletion minimality, or `noM44`.
-/

namespace Problem97
namespace ATailThreeCompleteReverseRowsAnalyticScratch

abbrev QPoint := ℚ × ℚ

private def add (a b : QPoint) : QPoint := (a.1 + b.1, a.2 + b.2)
private def sub (a b : QPoint) : QPoint := (a.1 - b.1, a.2 - b.2)
private def scale (c : ℚ) (a : QPoint) : QPoint := (c * a.1, c * a.2)

private def outwardBulge (a b : QPoint) (t epsilon : ℚ) : QPoint :=
  let pointOnEdge := add (scale (1 - t) a) (scale t b)
  let rightNormal : QPoint := (b.2 - a.2, a.1 - b.1)
  add pointOnEdge (scale epsilon rightNormal)

private def unit (t : ℚ) : QPoint :=
  ((1 - t ^ 2) / (1 + t ^ 2), 2 * t / (1 + t ^ 2))

private def rotate (a : QPoint) (t : ℚ) : QPoint :=
  let cosine := (1 - t ^ 2) / (1 + t ^ 2)
  let sine := 2 * t / (1 + t ^ 2)
  (cosine * a.1 - sine * a.2, sine * a.1 + cosine * a.2)

private def sqdist (a b : QPoint) : ℚ :=
  let d := sub a b
  d.1 ^ 2 + d.2 ^ 2

private def cross (a b c : QPoint) : ℚ :=
  let u := sub b a
  let v := sub c a
  u.1 * v.2 - u.2 * v.1

private def tApex : ℚ := 15091 / 15143
private def tq0 : ℚ := 943 / 92200
private def tq1 : ℚ := 9643 / 22662
private def tq2 : ℚ := 194 / 199

private def o : QPoint := (0, 0)
private def left : QPoint := (1, 0)
private def right : QPoint := unit tApex
private def q0 : QPoint := unit tq0
private def q1 : QPoint := unit tq1
private def q2 : QPoint := unit tq2

private def b0 : QPoint := scale (12637 / 25058) (add q0 q1)
private def b1 : QPoint := scale (45957 / 91523) (add q1 q2)
private def b2 : QPoint := scale (66359 / 95986) (add q2 q0)

private def x00 : QPoint :=
  add b0 (rotate (sub q0 b0) (-12151 / 50741))
private def x01 : QPoint :=
  add b0 (rotate (sub q0 b0) (-11188 / 69765))
private def x10 : QPoint :=
  add b1 (rotate (sub q1 b1) (-364045 / 54493))
private def x11 : QPoint :=
  add b1 (rotate (sub q1 b1) (-58655 / 15086))
private def x20 : QPoint :=
  add b2 (rotate (sub q2 b2) (42572 / 38447))
private def x21 : QPoint :=
  add b2 (rotate (sub q2 b2) (88847 / 40943))

private def zR : QPoint := outwardBulge right x10 (1 / 10) (1 / 1000)
private def zO : QPoint := outwardBulge x11 o (1 / 5) (1 / 1000)

/-- Counterclockwise boundary order of the exact rational model. -/
private def point : Nat → QPoint
  | 0 => o
  | 1 => x20
  | 2 => x00
  | 3 => x01
  | 4 => x21
  | 5 => left
  | 6 => q0
  | 7 => b0
  | 8 => b2
  | 9 => q1
  | 10 => b1
  | 11 => q2
  | 12 => right
  | 13 => zR
  | 14 => x10
  | 15 => x11
  | 16 => zO
  | _ => o

private def indices : List Nat := List.range 17

private def strictHullCheck : Bool :=
  indices.all fun i =>
    let next := (i + 1) % 17
    indices.all fun j =>
      if j = i ∨ j = next then true
      else decide (0 < cross (point i) (point next) (point j))

private def distinctCheck : Bool :=
  indices.all fun i =>
    (List.range i).all fun j => decide (0 < sqdist (point i) (point j))

private def mecCenter : QPoint := (1 / 2, tApex / 2)
private def mecRadiusSq : ℚ := (1 + tApex ^ 2) / 4

private def mecCheck : Bool :=
  indices.all (fun i => decide (sqdist mecCenter (point i) ≤ mecRadiusSq)) &&
    decide (sqdist mecCenter o = mecRadiusSq) &&
    decide (sqdist mecCenter left = mecRadiusSq) &&
    decide (sqdist mecCenter right = mecRadiusSq) &&
    decide (0 < right.1) && decide (right.1 < 1)

private def chordSideCheck : Bool :=
  ([0, 1, 2, 3, 4, 13, 14, 15, 16].all fun i =>
      decide (0 < cross left right (point i))) &&
    ([6, 7, 8, 9, 10, 11].all fun i =>
      decide (cross left right (point i) < 0))

private def physicalSupport : List Nat := [5, 6, 9, 11, 12]

private def physicalExactCheck : Bool :=
  physicalSupport.all (fun i => decide (sqdist o (point i) = 1)) &&
    indices.all fun i =>
      if i = 0 ∨ i ∈ physicalSupport then true
      else decide (sqdist o (point i) ≠ 1)

private def physicalOtherIndices : List Nat :=
  [1, 2, 3, 4, 7, 8, 10, 13, 14, 15, 16]

private def physicalOtherDistinctRadiusCheck : Bool :=
  physicalOtherIndices.all fun i =>
    physicalOtherIndices.all fun j =>
      if i < j then decide (sqdist o (point i) ≠ sqdist o (point j)) else true

private def capCardinalityCheck : Bool :=
  decide ([5, 6, 7, 8, 9, 10, 11, 12].length = 8) &&
    decide ([0, 1, 2, 3, 4, 5].length = 6) &&
    decide ([12, 13, 14, 15, 16, 0].length = 6)

private def firstApexOtherIndices : List Nat :=
  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16]

private def firstApexDistinctRadiusCheck : Bool :=
  firstApexOtherIndices.all fun i =>
    firstApexOtherIndices.all fun j =>
      if i < j then decide (sqdist right (point i) ≠ sqdist right (point j)) else true

private def rowCenter : Nat → Nat
  | 0 => 7
  | 1 => 10
  | _ => 8

private def rowSupport : Nat → List Nat
  | 0 => [6, 9, 2, 3]
  | 1 => [9, 11, 14, 15]
  | _ => [11, 6, 1, 4]

private def rowExactCheck : Bool :=
  (List.range 3).all fun row =>
    let center := rowCenter row
    let support := rowSupport row
    let radiusSq := sqdist (point center) (point support.head!)
    decide (0 < radiusSq) &&
      support.all (fun i => decide (sqdist (point center) (point i) = radiusSq)) &&
      indices.all fun i =>
        if i = center ∨ i ∈ support then true
        else decide (sqdist (point center) (point i) ≠ radiusSq)

private def firstApexNonreturnCheck : Bool :=
  decide (sqdist left x00 ≠ sqdist left x01) &&
    decide (sqdist left x10 ≠ sqdist left x11) &&
    decide (sqdist left x20 ≠ sqdist left x21) &&
    decide (sqdist right x00 ≠ sqdist right x01) &&
    decide (sqdist right x10 ≠ sqdist right x11) &&
    decide (sqdist right x20 ≠ sqdist right x21)

/-- The complete local Euclidean/MEC ledger is exactly feasible over rational
coordinates, while all three reverse outside pairs remain non-co-radial from
either support-triangle apex adjacent to the physical cap. -/
theorem exact_threeCompleteReverseRows_localMec_countermodel :
    strictHullCheck && distinctCheck && mecCheck && chordSideCheck &&
      physicalExactCheck && capCardinalityCheck && rowExactCheck &&
        firstApexNonreturnCheck && firstApexDistinctRadiusCheck &&
          physicalOtherDistinctRadiusCheck = true := by
  native_decide

#print axioms exact_threeCompleteReverseRows_localMec_countermodel

end ATailThreeCompleteReverseRowsAnalyticScratch
end Problem97
