/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Exact rational source-faithful full-parent local cell

This file checks the rational model independently replayed by
`verify_exact_source_faithful_full_cell.py`.  It decides one local identity
cell only.  It does not construct total K4, a total `CriticalShellSystem`,
minimality, or `noM44`.
-/

namespace Problem97
namespace ATailExactSourceFaithfulFullCellScratch

abbrev QPoint := ℚ × ℚ

private def add (a b : QPoint) : QPoint := (a.1 + b.1, a.2 + b.2)
private def sub (a b : QPoint) : QPoint := (a.1 - b.1, a.2 - b.2)
private def scale (c : ℚ) (a : QPoint) : QPoint := (c * a.1, c * a.2)

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

/- Tangent-half-angle and scalar parameters, denominator bound 10,000. -/
private def tApex : ℚ := 2179 / 2587
private def tq0 : ℚ := 41 / 7163
private def tq1 : ℚ := 379 / 950
private def tq2 : ℚ := 2848 / 3419
private def lambda0 : ℚ := 4733 / 9400
private def lambda1 : ℚ := 1161 / 2321
private def lambda2 : ℚ := 2261 / 3551

private def o : QPoint := (0, 0)
private def left : QPoint := (1, 0)
private def right : QPoint := unit tApex
private def q0 : QPoint := unit tq0
private def q1 : QPoint := unit tq1
private def q2 : QPoint := unit tq2
private def c0 : QPoint := scale lambda0 (add q0 q1)
private def c1 : QPoint := scale lambda1 (add q1 q2)
private def c2 : QPoint := scale lambda2 (add q2 q0)

private def x00 : QPoint := add c0 (rotate (sub q0 c0) (-1101 / 7430))
private def x01 : QPoint := add c0 (rotate (sub q0 c0) (-1627 / 7794))
private def x10 : QPoint := add c1 (rotate (sub q1 c1) (-14866 / 2957))
private def x11 : QPoint := add c1 (rotate (sub q1 c1) (-2173 / 259))
private def x20 : QPoint := add c2 (rotate (sub q2 c2) (12917 / 9834))
private def x21 : QPoint := add c2 (rotate (sub q2 c2) (8701 / 3308))

private def r0 : ℚ := 3569 / 3599
private def r1 : ℚ := 5585 / 5603
private def t0i0 : QPoint := add right (scale r0 (unit (-9303 / 9148)))
private def t0i1 : QPoint := add right (scale r0 (unit (-8089 / 7860)))
private def t0o : QPoint := add right (scale r0 (unit (-3870 / 9697)))
private def t0s : QPoint := add right (scale r0 (unit (-6019 / 5055)))
private def t1i0 : QPoint := add right (scale r1 (unit (-9079 / 9952)))
private def t1i1 : QPoint := add right (scale r1 (unit (-1741 / 1524)))
private def t1o : QPoint := add right (scale r1 (unit (-1529 / 3818)))
private def t1s : QPoint := add right (scale r1 (unit (-7316 / 6153)))

private def uI : QPoint := add left (rotate (sub c1 left) (3898 / 7197))
private def uS0 : QPoint := add left (rotate (sub c1 left) (703 / 1738))
private def uS1 : QPoint := add left (rotate (sub c1 left) (829 / 1702))

/- The exact counterclockwise boundary word. -/
private def point : Nat → QPoint
  | 0 => uS0
  | 1 => uS1
  | 2 => t0s
  | 3 => t1s
  | 4 => o
  | 5 => uI
  | 6 => t1i1
  | 7 => t0i1
  | 8 => t0i0
  | 9 => t1i0
  | 10 => x20
  | 11 => x01
  | 12 => x00
  | 13 => x21
  | 14 => left
  | 15 => q0
  | 16 => t1o
  | 17 => t0o
  | 18 => c0
  | 19 => c2
  | 20 => q1
  | 21 => c1
  | 22 => q2
  | 23 => right
  | 24 => x11
  | 25 => x10
  | _ => o

private def indices : List Nat := List.range 26

private def strictHullCheck : Bool :=
  indices.all fun i =>
    let next := (i + 1) % 26
    indices.all fun j =>
      if j = i ∨ j = next then true
      else decide (0 < cross (point i) (point next) (point j))

private def distinctCheck : Bool :=
  indices.all fun i =>
    (List.range i).all fun j => decide (0 < sqdist (point i) (point j))

private def mecCenter : QPoint :=
  (1 / 2, (1 - right.1) / (2 * right.2))

private def mecRadiusSq : ℚ := sqdist mecCenter o

private def mecCheck : Bool :=
  indices.all (fun i => decide (sqdist mecCenter (point i) ≤ mecRadiusSq)) &&
    decide (sqdist mecCenter o = mecRadiusSq) &&
    decide (sqdist mecCenter left = mecRadiusSq) &&
    decide (sqdist mecCenter right = mecRadiusSq)

private def nonobtuseCheck : Bool :=
  decide (sqdist left right ≤ sqdist o left + sqdist o right) &&
    decide (sqdist o right ≤ sqdist left o + sqdist left right) &&
    decide (sqdist o left ≤ sqdist right o + sqdist right left)

private def oppositeCapCheck (a b opposite p : QPoint) : Bool :=
  decide (cross a b opposite * cross a b p < 0)

private def capRoleCheck : Bool :=
  [t0i0, t0i1, t1i0, t1i1, uI].all
      (oppositeCapCheck o left right) &&
    [t0o, t1o].all (oppositeCapCheck left right o) &&
    [t0s, t1s, uS0, uS1].all (oppositeCapCheck right o left)

private def physicalSupport : List Nat := [14, 15, 20, 22, 23]

private def physicalExactCheck : Bool :=
  physicalSupport.all (fun i => decide (sqdist o (point i) = 1)) &&
    indices.all fun i =>
      if i = 4 ∨ i ∈ physicalSupport then true
      else decide (sqdist o (point i) ≠ 1)

private def physicalOtherIndices : List Nat :=
  indices.filter fun i => i ≠ 4 && i ∉ physicalSupport

private def physicalOtherDistinctRadiusCheck : Bool :=
  physicalOtherIndices.all fun i =>
    physicalOtherIndices.all fun j =>
      if i < j then decide (sqdist o (point i) ≠ sqdist o (point j)) else true

private def rowCenter : Nat → Nat
  | 0 => 18
  | 1 => 21
  | _ => 19

private def rowSupport : Nat → List Nat
  | 0 => [15, 20, 12, 11]
  | 1 => [20, 22, 25, 24]
  | _ => [22, 15, 10, 13]

private def rowExactCheck : Bool :=
  (List.range 3).all fun row =>
    let center := rowCenter row
    let support := rowSupport row
    let radiusSq := sqdist (point center) (point support.head!)
    support.all (fun i => decide (sqdist (point center) (point i) = radiusSq)) &&
      indices.all fun i =>
        if i = center ∨ i ∈ support then true
        else decide (sqdist (point center) (point i) ≠ radiusSq)

private def rowOtherDistinctRadiusCheck : Bool :=
  (List.range 3).all fun row =>
    let center := rowCenter row
    let support := rowSupport row
    let others := indices.filter fun i => i ≠ center && i ∉ support
    others.all fun i => others.all fun j =>
      if i < j then
        decide (sqdist (point center) (point i) ≠ sqdist (point center) (point j))
      else true

private def t0Support : List Nat := [8, 7, 17, 2]
private def t1Support : List Nat := [9, 6, 16, 3]

private def exactSupportAt (center : Nat) (support : List Nat) : Bool :=
  let radiusSq := sqdist (point center) (point support.head!)
  support.all (fun i => decide (sqdist (point center) (point i) = radiusSq)) &&
    indices.all fun i =>
      if i = center ∨ i ∈ support then true
      else decide (sqdist (point center) (point i) ≠ radiusSq)

private def firstApexRowsCheck : Bool :=
  exactSupportAt 23 t0Support && exactSupportAt 23 t1Support &&
    decide (0 < r0) && decide (0 < r1) &&
    decide (sqdist right t0i0 ≠ sqdist right t1i0) &&
    decide (sqdist o t0i0 ≠ sqdist o t0i1)

private def unusedSupport : List Nat := [21, 5, 0, 1]

private def unusedRowCheck : Bool := exactSupportAt 14 unusedSupport

private def unusedOtherDistinctRadiusCheck : Bool :=
  let others := indices.filter fun i => i ≠ 14 && i ∉ unusedSupport
  others.all fun i => others.all fun j =>
    if i < j then decide (sqdist left (point i) ≠ sqdist left (point j)) else true

private def reverseNonreturnCheck : Bool :=
  decide (sqdist right x00 ≠ sqdist right x01) &&
    decide (sqdist right x10 ≠ sqdist right x11) &&
    decide (sqdist right x20 ≠ sqdist right x21)

private def sourceFaithfulRoleCheck : Bool :=
  decide (t0Support = [8, 7, 17, 2]) &&
    decide (t1Support = [9, 6, 16, 3]) &&
    decide (unusedSupport = [21, 5, 0, 1]) &&
    decide (15 ∉ unusedSupport) && decide (20 ∉ unusedSupport) &&
    decide (15 ∉ t1Support) && decide (20 ∉ t1Support) &&
    decide (8 ∉ t1Support) && decide (7 ∉ t1Support)

private def capCardinalityCheck : Bool :=
  decide ([4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14].length = 11) &&
    decide ([14, 15, 16, 17, 18, 19, 20, 21, 22, 23].length = 10) &&
    decide ([23, 24, 25, 0, 1, 2, 3, 4].length = 8)

/-- Kernel-checked positivity of the two first-apex row radii. -/
theorem exact_firstApex_radii_pos : 0 < r0 ∧ 0 < r1 := by
  norm_num [r0, r1]

/-- Kernel-checked unequal physical-apex radii of the retained frontier pair. -/
theorem exact_frontierPair_secondApex_sqdist_ne :
    sqdist o t0i0 ≠ sqdist o t0i1 := by
  norm_num [sqdist, sub, o, t0i0, t0i1, right, unit, scale, add,
    r0, tApex]

/-- The 26-point rational model satisfies the complete local metric, convex,
MEC, cap-role, first-apex, unused-row and continuation ledger.  It is a local
countermodel only; no total critical system or global minimal counterexample
is constructed here. -/
theorem exact_sourceFaithfulFullParent_localCell_countermodel :
    strictHullCheck && distinctCheck && mecCheck && nonobtuseCheck &&
      capRoleCheck && physicalExactCheck && physicalOtherDistinctRadiusCheck &&
        rowExactCheck && rowOtherDistinctRadiusCheck && firstApexRowsCheck &&
          unusedRowCheck && unusedOtherDistinctRadiusCheck &&
            reverseNonreturnCheck && sourceFaithfulRoleCheck &&
              capCardinalityCheck = true := by
  native_decide

#print axioms exact_sourceFaithfulFullParent_localCell_countermodel
#print axioms exact_firstApex_radii_pos
#print axioms exact_frontierPair_secondApex_sqdist_ne

end ATailExactSourceFaithfulFullCellScratch
end Problem97
