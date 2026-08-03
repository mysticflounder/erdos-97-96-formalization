/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Crossed-arm seven-point Euclidean obstruction

This file isolates an eleven-equality metric configuration on seven planar points. The
equalities force the two anchor labels to coincide.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace CrossedArmSevenPointEuclideanObstruction

open Census554.EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem crossedArm_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 :=
  Problem97.dist_sq_coord x y

private def zCoord (X : ℝ²) : ℂ := (X 0 : ℂ) + Complex.I * (X 1 : ℂ)

private def bCoord (X : ℝ²) : ℂ := (X 0 : ℂ) - Complex.I * (X 1 : ℂ)

private theorem zCoord_eq_conj_bCoord (X : ℝ²) :
    zCoord X = starRingEnd ℂ (bCoord X) := by
  simp [zCoord, bCoord]

private theorem diagonalized_sq (X Y : ℝ²) :
    (zCoord X - zCoord Y) * (bCoord X - bCoord Y) =
      (((X 0 - Y 0) ^ 2 + (X 1 - Y 1) ^ 2 : ℝ) : ℂ) := by
  simp only [zCoord, bCoord, Complex.ofReal_add, Complex.ofReal_sub, Complex.ofReal_pow]
  have hI : Complex.I * Complex.I = (-1 : ℂ) := Complex.I_mul_I
  grobner

/-- Equality of Euclidean distances becomes a bilinear equality in the two
diagonal complex coordinates. -/
private theorem diagonalized_eq_of_dist_eq {X Y Z Q : ℝ²}
    (h : dist X Y = dist Z Q) :
    (zCoord X - zCoord Y) * (bCoord X - bCoord Y) =
      (zCoord Z - zCoord Q) * (bCoord Z - bCoord Q) := by
  rw [diagonalized_sq, diagonalized_sq]
  norm_cast
  rw [← crossedArm_dist_sq_coord, ← crossedArm_dist_sq_coord]
  exact congrArg (fun r : ℝ => r ^ 2) h

private theorem eq_pt_zero_of_bCoord_eq_zero {X : ℝ²} (h : bCoord X = 0) :
    X = pt 0 0 := by
  ext i
  fin_cases i
  · have hr := congrArg Complex.re h
    simpa [bCoord, pt] using hr
  · have hi := congrArg Complex.im h
    simp [bCoord] at hi
    simp [pt, hi]

private theorem eq_pt_one_of_bCoord_eq_one {X : ℝ²} (h : bCoord X = 1) :
    X = pt 1 0 := by
  ext i
  fin_cases i
  · have hr := congrArg Complex.re h
    simpa [bCoord, pt] using hr
  · have hi := congrArg Complex.im h
    simp [bCoord] at hi
    simp [pt, hi]

#eval IO.println "START determinant_relation_one"
set_option maxHeartbeats 2000000 in
private theorem determinant_relation_one
    {zr zs zu zw br bs bu bw : ℂ}
    (f1 : (br - bw) * zr + (-bs + bw) * zs + (-br + bs) * zw = 0)
    (f2 : (br - bw) * zr + (-bu + bw) * zu + (-br + bu) * zw = 0)
    (f3 : -bs * zs + 1 = 0)
    (f4 : -bw * zw + 1 = 0)
    (f5 : (-bs + bu) * zs + (bs - bu) * zu + 1 = 0) :
    (br - bw) *
      (bs ^ 3 - 2 * bs ^ 2 * bu - bs ^ 2 * bw + bs * bu ^ 2 + bs * bu * bw +
        bs * bw ^ 2 - bu ^ 2 * bw) = 0 := by
  grobner (ringSteps := 100000)

set_option maxHeartbeats 2000000 in
#eval IO.println "START determinant_relation_two"
private theorem determinant_relation_two
    {zr zs zu zv zw br bs bu bv bw : ℂ}
    (f2 : (br - bw) * zr + (-bu + bw) * zu + (-br + bu) * zw = 0)
    (f3 : -bs * zs + 1 = 0)
    (f4 : -bw * zw + 1 = 0)
    (f5 : (-bs + bu) * zs + (bs - bu) * zu + 1 = 0)
    (f6 : (-bs + bv) * zs + (bs - bv) * zv + 1 = 0)
    (f7 : br * zr - bv * zv = 0) :
    br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
      br ^ 2 * bs * bu * bv - br * bs ^ 3 * bu + br * bs ^ 2 * bu ^ 2 +
      br * bs ^ 2 * bu * bv - br * bs * bu ^ 2 * bv - br * bs * bu ^ 2 * bw +
      br * bs * bu * bw ^ 2 + br * bs * bv ^ 2 * bw + br * bu ^ 2 * bv * bw -
      br * bu * bv ^ 2 * bw - br * bu * bv * bw ^ 2 - bs * bv ^ 2 * bw ^ 2 +
      bu * bv ^ 2 * bw ^ 2 = 0 := by
  grobner (ringSteps := 100000)

set_option maxHeartbeats 2000000 in
#eval IO.println "START determinant_relation_five"
private theorem determinant_relation_five
    {zr zs zu zv zw br bs bu bv bw : ℂ}
    (f3 : -bs * zs + 1 = 0)
    (f4 : -bw * zw + 1 = 0)
    (f5 : (-bs + bu) * zs + (bs - bu) * zu + 1 = 0)
    (f6 : (-bs + bv) * zs + (bs - bv) * zv + 1 = 0)
    (f7 : br * zr - bv * zv = 0)
    (f10 : (1 - bu) * zr + (-br + bu) * zu + (br - 1) = 0) :
    br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
      br ^ 2 * bs * bu * bv + br ^ 2 * bs * bu - br ^ 2 * bu * bv -
      br * bs ^ 3 + br * bs ^ 2 * bu + br * bs ^ 2 * bv - br * bs * bu ^ 2 -
      br * bs * bu * bv + br * bu ^ 2 * bv + bs * bu * bv ^ 2 - bs * bv ^ 2 -
      bu ^ 2 * bv ^ 2 + bu * bv ^ 2 = 0 := by
  grobner (ringSteps := 100000)

set_option maxHeartbeats 2000000 in
#eval IO.println "START determinant_relation_seven"
private theorem determinant_relation_seven
    {zr zs zu zv zw br bs bu bv bw : ℂ}
    (f3 : -bs * zs + 1 = 0)
    (f4 : -bw * zw + 1 = 0)
    (f5 : (-bs + bu) * zs + (bs - bu) * zu + 1 = 0)
    (f6 : (-bs + bv) * zs + (bs - bv) * zv + 1 = 0)
    (f7 : br * zr - bv * zv = 0)
    (f11 : (1 - bv) * zu + (-bu + bv) * zv + (bu - 1) = 0) :
    br *
      (bs ^ 3 * bu - bs ^ 3 - bs ^ 2 * bu ^ 2 - bs ^ 2 * bu * bv + bs ^ 2 * bu +
        bs ^ 2 * bv + bs * bu ^ 2 * bv + bs * bu * bv - bs * bu - bs * bv ^ 2 -
        bu ^ 2 * bv + bu * bv) = 0 := by
  grobner (ringSteps := 100000)

set_option maxHeartbeats 2000000 in
#eval IO.println "START determinant_relation_eight"
private theorem determinant_relation_eight
    {zr zs zu zv zw br bs bu bv bw : ℂ}
    (f3 : -bs * zs + 1 = 0)
    (f4 : -bw * zw + 1 = 0)
    (f6 : (-bs + bv) * zs + (bs - bv) * zv + 1 = 0)
    (f7 : br * zr - bv * zv = 0)
    (f8 : (bv - 1) * zv + (1 - bw) * zw + (-bv + bw) = 0)
    (f11 : (1 - bv) * zu + (-bu + bv) * zv + (bu - 1) = 0) :
    -br * (bv - 1) *
      (bs ^ 2 * bv * bw - bs ^ 2 * bw ^ 2 + bs ^ 2 * bw - bs ^ 2 -
        bs * bv ^ 2 * bw + bs * bv * bw ^ 2 - bs * bv * bw + bs * bv +
        bv ^ 2 * bw - bv * bw) = 0 := by
  grobner (ringSteps := 100000)

set_option maxHeartbeats 2000000 in
#eval IO.println "START determinant_relation_nine"
private theorem determinant_relation_nine
    {zr zs zu zv zw br bs bu bv bw : ℂ}
    (f3 : -bs * zs + 1 = 0)
    (f4 : -bw * zw + 1 = 0)
    (f6 : (-bs + bv) * zs + (bs - bv) * zv + 1 = 0)
    (f7 : br * zr - bv * zv = 0)
    (f9 : (br - bv) * zr + (1 - br) * zv + (bv - 1) = 0)
    (f11 : (1 - bv) * zu + (-bu + bv) * zv + (bu - 1) = 0) :
    (bv - 1) *
      (br ^ 2 * bv + br * bs ^ 2 * bv - br * bs ^ 2 - br * bs * bv ^ 2 +
        br * bs * bv - br * bv ^ 2 - br * bv + bv ^ 3) = 0 := by
  grobner (ringSteps := 100000)

private def q1Polynomial (bs bu bw : ℂ) : ℂ :=
  bs ^ 3 - 2 * bs ^ 2 * bu - bs ^ 2 * bw + bs * bu ^ 2 + bs * bu * bw +
    bs * bw ^ 2 - bu ^ 2 * bw

private def e2Polynomial (br bs bu bv bw : ℂ) : ℂ :=
  br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
    br ^ 2 * bs * bu * bv - br * bs ^ 3 * bu + br * bs ^ 2 * bu ^ 2 +
    br * bs ^ 2 * bu * bv - br * bs * bu ^ 2 * bv - br * bs * bu ^ 2 * bw +
    br * bs * bu * bw ^ 2 + br * bs * bv ^ 2 * bw + br * bu ^ 2 * bv * bw -
    br * bu * bv ^ 2 * bw - br * bu * bv * bw ^ 2 - bs * bv ^ 2 * bw ^ 2 +
    bu * bv ^ 2 * bw ^ 2

private def e5Polynomial (br bs bu bv : ℂ) : ℂ :=
  br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
    br ^ 2 * bs * bu * bv + br ^ 2 * bs * bu - br ^ 2 * bu * bv -
    br * bs ^ 3 + br * bs ^ 2 * bu + br * bs ^ 2 * bv - br * bs * bu ^ 2 -
    br * bs * bu * bv + br * bu ^ 2 * bv + bs * bu * bv ^ 2 - bs * bv ^ 2 -
    bu ^ 2 * bv ^ 2 + bu * bv ^ 2

private def e7Polynomial (bs bu bv : ℂ) : ℂ :=
  bs ^ 3 * bu - bs ^ 3 - bs ^ 2 * bu ^ 2 - bs ^ 2 * bu * bv + bs ^ 2 * bu +
    bs ^ 2 * bv + bs * bu ^ 2 * bv + bs * bu * bv - bs * bu - bs * bv ^ 2 -
    bu ^ 2 * bv + bu * bv

private def e8Polynomial (bs bv bw : ℂ) : ℂ :=
  bs ^ 2 * bv * bw - bs ^ 2 * bw ^ 2 + bs ^ 2 * bw - bs ^ 2 -
    bs * bv ^ 2 * bw + bs * bv * bw ^ 2 - bs * bv * bw + bs * bv +
    bv ^ 2 * bw - bv * bw

private def e9Polynomial (br bs bv : ℂ) : ℂ :=
  br ^ 2 * bv + br * bs ^ 2 * bv - br * bs ^ 2 - br * bs * bv ^ 2 +
    br * bs * bv - br * bv ^ 2 - br * bv + bv ^ 3

set_option maxHeartbeats 4000000 in
#eval IO.println "START brEqBwB3"
private theorem brEqBwB3
    {bs bu bv bw : ℂ}
    (p2 : e2Polynomial bw bs bu bv bw = 0)
    (p5 : e5Polynomial bw bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial bw bs bv = 0) :
    bs * (bv - bu) * (bw - 1) * (bw - bv) = 0 := by
  simp only [e2Polynomial, e5Polynomial, e7Polynomial, e8Polynomial,
    e9Polynomial] at *
  grobner (ringSteps := 100000)

set_option maxHeartbeats 4000000 in
#eval IO.println "START brEqBwB17"
private theorem brEqBwB17
    {bs bu bv bw : ℂ}
    (p2 : e2Polynomial bw bs bu bv bw = 0)
    (p5 : e5Polynomial bw bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial bw bs bv = 0) :
    bs * bv * (bw ^ 3 - bv ^ 2 + 2 * bv * bw - 3 * bw ^ 2 + bw) = 0 := by
  simp only [e2Polynomial, e5Polynomial, e7Polynomial, e8Polynomial,
    e9Polynomial] at *
  grobner (ringSteps := 100000)

set_option maxHeartbeats 4000000 in
#eval IO.println "START brEqBwBuEqBvB24"
private theorem brEqBwBuEqBvB24
    {bs bv bw : ℂ}
    (p2 : e2Polynomial bw bs bv bv bw = 0)
    (p5 : e5Polynomial bw bs bv bv = 0)
    (p7 : e7Polynomial bs bv bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial bw bs bv = 0) :
    -bv ^ 2 * (bw - 1) * (bw - bv ^ 2) = 0 := by
  simp only [e2Polynomial, e5Polynomial, e7Polynomial, e8Polynomial,
    e9Polynomial] at *
  grobner (ringSteps := 100000)

set_option maxHeartbeats 4000000 in
#eval IO.println "START q1EqZeroG7"
private theorem q1EqZeroG7
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    bs * bv * (br ^ 2 - br * bv + bv ^ 2 - br) = 0 := by
  simp only [q1Polynomial, e2Polynomial, e5Polynomial, e7Polynomial,
    e8Polynomial, e9Polynomial] at *
  grobner (ringSteps := 100000)

set_option maxRecDepth 10000 in
set_option maxHeartbeats 4000000 in
#eval IO.println "START determinant_relations_incompatible"
private theorem determinant_relations_incompatible
    {br bs bu bv bw : ℂ}
    (p1 : bv * (br - bw) *
      (bs ^ 3 - 2 * bs ^ 2 * bu - bs ^ 2 * bw + bs * bu ^ 2 + bs * bu * bw +
        bs * bw ^ 2 - bu ^ 2 * bw) = 0)
    (p2 : br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
      br ^ 2 * bs * bu * bv - br * bs ^ 3 * bu + br * bs ^ 2 * bu ^ 2 +
      br * bs ^ 2 * bu * bv - br * bs * bu ^ 2 * bv - br * bs * bu ^ 2 * bw +
      br * bs * bu * bw ^ 2 + br * bs * bv ^ 2 * bw + br * bu ^ 2 * bv * bw -
      br * bu * bv ^ 2 * bw - br * bu * bv * bw ^ 2 - bs * bv ^ 2 * bw ^ 2 +
      bu * bv ^ 2 * bw ^ 2 = 0)
    (p5 : br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
      br ^ 2 * bs * bu * bv + br ^ 2 * bs * bu - br ^ 2 * bu * bv -
      br * bs ^ 3 + br * bs ^ 2 * bu + br * bs ^ 2 * bv - br * bs * bu ^ 2 -
      br * bs * bu * bv + br * bu ^ 2 * bv + bs * bu * bv ^ 2 - bs * bv ^ 2 -
      bu ^ 2 * bv ^ 2 + bu * bv ^ 2 = 0)
    (p7 : br *
      (bs ^ 3 * bu - bs ^ 3 - bs ^ 2 * bu ^ 2 - bs ^ 2 * bu * bv + bs ^ 2 * bu +
        bs ^ 2 * bv + bs * bu ^ 2 * bv + bs * bu * bv - bs * bu - bs * bv ^ 2 -
        bu ^ 2 * bv + bu * bv) = 0)
    (p8 : -br * (bv - 1) *
      (bs ^ 2 * bv * bw - bs ^ 2 * bw ^ 2 + bs ^ 2 * bw - bs ^ 2 -
        bs * bv ^ 2 * bw + bs * bv * bw ^ 2 - bs * bv * bw + bs * bv +
        bv ^ 2 * bw - bv * bw) = 0)
    (p9 : (bv - 1) *
      (br ^ 2 * bv + br * bs ^ 2 * bv - br * bs ^ 2 - br * bs * bv ^ 2 +
        br * bs * bv - br * bv ^ 2 - br * bv + bv ^ 3) = 0)
    (hbr : br ≠ 0) (hbs : bs ≠ 0) (hbw : bw ≠ 0) (hbv : bv - 1 ≠ 0)
    {zr zs zu zv : ℂ}
    (f3 : -bs * zs + 1 = 0)
    (f5 : (-bs + bu) * zs + (bs - bu) * zu + 1 = 0)
    (f6 : (-bs + bv) * zs + (bs - bv) * zv + 1 = 0)
    (f9 : (br - bv) * zr + (1 - br) * zv + (bv - 1) = 0)
    (hconj : zs = starRingEnd ℂ bs)
    (hconjV : zv = starRingEnd ℂ bv) : False := by
  change bv * (br - bw) * q1Polynomial bs bu bw = 0 at p1
  change e2Polynomial br bs bu bv bw = 0 at p2
  change e5Polynomial br bs bu bv = 0 at p5
  change br * e7Polynomial bs bu bv = 0 at p7
  change -br * (bv - 1) * e8Polynomial bs bv bw = 0 at p8
  change (bv - 1) * e9Polynomial br bs bv = 0 at p9
  rcases mul_eq_zero.mp p1 with hpref | hq
  · rcases mul_eq_zero.mp hpref with hbv0 | hbrbw
    · subst bv
      ring_nf at p9
      exact (mul_ne_zero hbr (pow_ne_zero 2 hbs)) p9
    · have hbr_eq_bw : br = bw := sub_eq_zero.mp hbrbw
      subst br
      have hbv0 : bv ≠ 0 := by
        intro hv
        subst bv
        ring_nf at p9
        exact (mul_ne_zero hbw (pow_ne_zero 2 hbs)) p9
      have q7 :
          bs ^ 3 * bu - bs ^ 3 - bs ^ 2 * bu ^ 2 - bs ^ 2 * bu * bv +
            bs ^ 2 * bu + bs ^ 2 * bv + bs * bu ^ 2 * bv + bs * bu * bv -
            bs * bu - bs * bv ^ 2 - bu ^ 2 * bv + bu * bv = 0 :=
        (mul_eq_zero.mp p7).resolve_left hbw
      have q8raw :
          bs ^ 2 * bv * bw - bs ^ 2 * bw ^ 2 + bs ^ 2 * bw - bs ^ 2 -
            bs * bv ^ 2 * bw + bs * bv * bw ^ 2 - bs * bv * bw + bs * bv +
            bv ^ 2 * bw - bv * bw = 0 := by
        have hpref : -bw * (bv - 1) ≠ 0 :=
          mul_ne_zero (neg_ne_zero.mpr hbw) hbv
        exact (mul_eq_zero.mp p8).resolve_left hpref
      have q9 :
          bw ^ 2 * bv + bw * bs ^ 2 * bv - bw * bs ^ 2 - bw * bs * bv ^ 2 +
            bw * bs * bv - bw * bv ^ 2 - bw * bv + bv ^ 3 = 0 :=
        (mul_eq_zero.mp p9).resolve_left hbv
      have B3 : bs * (bv - bu) * (bw - 1) * (bw - bv) = 0 := by
        exact brEqBwB3 p2 p5 q7 q8raw q9
      let h := bw ^ 3 - bv ^ 2 + 2 * bv * bw - 3 * bw ^ 2 + bw
      have B17 : bs * bv * h = 0 := by
        dsimp [h]
        exact brEqBwB17 p2 p5 q7 q8raw q9
      have hh : h = 0 :=
        (mul_eq_zero.mp B17).resolve_left (mul_ne_zero hbs hbv0)
      have hbw1 : bw ≠ 1 := by
        intro hw
        subst bw
        dsimp [h] at hh
        have hz : (bv - 1) ^ 2 = 0 := by linear_combination -hh
        exact (pow_ne_zero 2 hbv) hz
      have hwbv : bw ≠ bv := by
        intro hw
        subst bw
        dsimp [h] at hh
        have hz : bv * (bv - 1) ^ 2 = 0 := by linear_combination hh
        exact (mul_ne_zero hbv0 (pow_ne_zero 2 hbv)) hz
      have hbu : bu = bv := by
        by_contra hne
        exact (mul_ne_zero
          (mul_ne_zero (mul_ne_zero hbs (sub_ne_zero.mpr (Ne.symm hne)))
            (sub_ne_zero.mpr hbw1))
          (sub_ne_zero.mpr hwbv)) B3
      have B24 : -bv ^ 2 * (bw - 1) * (bw - bv ^ 2) = 0 := by
        subst bu
        exact brEqBwBuEqBvB24 p2 p5 q7 q8raw q9
      have hwbv2 : bw = bv ^ 2 := by
        have hprefix : -bv ^ 2 * (bw - 1) ≠ 0 :=
          mul_ne_zero (neg_ne_zero.mpr (pow_ne_zero 2 hbv0)) (sub_ne_zero.mpr hbw1)
        exact sub_eq_zero.mp ((mul_eq_zero.mp B24).resolve_left hprefix)
      have hbvneg : bv = -2 := by
        have hz : bv ^ 3 * (bv - 1) ^ 2 * (bv + 2) = 0 := by
          dsimp [h] at hh
          rw [hwbv2] at hh
          linear_combination hh
        have hpref : bv ^ 3 * (bv - 1) ^ 2 ≠ 0 :=
          mul_ne_zero (pow_ne_zero 3 hbv0) (pow_ne_zero 2 hbv)
        have : bv + 2 = 0 := (mul_eq_zero.mp hz).resolve_left hpref
        linear_combination this
      have pbs : bs ^ 2 + 2 * bs + 4 = 0 := by
        rw [hwbv2, hbvneg] at p9
        ring_nf at p9
        linear_combination (1 / 36 : ℂ) * p9
      have pzs : zs ^ 2 + 2 * zs + 4 = 0 := by
        have hc := congrArg (starRingEnd ℂ) pbs
        norm_num at hc
        rw [← hconj] at hc
        simpa only [map_ofNat] using hc
      grobner
  · have q7 :
        bs ^ 3 * bu - bs ^ 3 - bs ^ 2 * bu ^ 2 - bs ^ 2 * bu * bv +
          bs ^ 2 * bu + bs ^ 2 * bv + bs * bu ^ 2 * bv + bs * bu * bv -
          bs * bu - bs * bv ^ 2 - bu ^ 2 * bv + bu * bv = 0 :=
      (mul_eq_zero.mp p7).resolve_left hbr
    have q8 :
        bs ^ 2 * bv * bw - bs ^ 2 * bw ^ 2 + bs ^ 2 * bw - bs ^ 2 -
          bs * bv ^ 2 * bw + bs * bv * bw ^ 2 - bs * bv * bw + bs * bv +
          bv ^ 2 * bw - bv * bw = 0 := by
      have hpref : -br * (bv - 1) ≠ 0 :=
        mul_ne_zero (neg_ne_zero.mpr hbr) hbv
      exact (mul_eq_zero.mp p8).resolve_left hpref
    have q9 :
        br ^ 2 * bv + br * bs ^ 2 * bv - br * bs ^ 2 - br * bs * bv ^ 2 +
          br * bs * bv - br * bv ^ 2 - br * bv + bv ^ 3 = 0 :=
      (mul_eq_zero.mp p9).resolve_left hbv
    have hbv0 : bv ≠ 0 := by
      intro hv
      subst bv
      ring_nf at q9
      apply (mul_ne_zero hbr (pow_ne_zero 2 hbs))
      linear_combination -q9
    have G7 : bs * bv * (br ^ 2 - br * bv + bv ^ 2 - br) = 0 := by
      exact q1EqZeroG7 hq p2 p5 q7 q8 q9
    have hK : br ^ 2 - br * bv + bv ^ 2 - br = 0 :=
      (mul_eq_zero.mp G7).resolve_left (mul_ne_zero hbs hbv0)
    have hprod : br * bs * (bv - 1) * (bs - bv) = 0 := by
      linear_combination q9 - bv * hK
    have hbsbv : bs = bv := by
      have hlast : bs - bv = 0 :=
        (mul_eq_zero.mp hprod).resolve_left
          (mul_ne_zero (mul_ne_zero hbr hbs) hbv)
      exact sub_eq_zero.mp hlast
    rw [hbsbv] at f6
    norm_num at f6


set_option maxHeartbeats 12000000 in
-- The kernel-checked Groebner certificate eliminates all eleven equations together.
/-- The normalized crossed-arm eleven-equality system is inconsistent. -/
#eval IO.println "START normalized_crossedArmSevenPoint_incompatible"
private theorem normalized_crossedArmSevenPoint_incompatible
    {R S U V W : ℝ²}
    (hRW_SW : dist R W = dist S W)
    (hRW_UW : dist R W = dist U W)
    (hAP_AS : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) S)
    (hAP_AW : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) W)
    (hAS_SU : dist (pt 0 0) S = dist S U)
    (hAS_SV : dist (pt 0 0) S = dist S V)
    (hAR_AV : dist (pt 0 0) R = dist (pt 0 0) V)
    (hPV_PW : dist (pt 1 0) V = dist (pt 1 0) W)
    (hPV_RV : dist (pt 1 0) V = dist R V)
    (hPR_RU : dist (pt 1 0) R = dist R U)
    (hPU_UV : dist (pt 1 0) U = dist U V) : False := by
  by_cases hbr : bCoord R = 0
  · have hR : R = pt 0 0 := eq_pt_zero_of_bCoord_eq_zero hbr
    have h0V : dist (pt 0 0) V = 0 := by
      simpa [hR] using hAR_AV.symm
    have hV : V = pt 0 0 := (dist_eq_zero.mp h0V).symm
    have h10 : dist (pt 1 0) (pt 0 0) = 0 := by
      simpa [hR, hV] using hPV_RV
    have hbad : pt 1 0 = pt 0 0 := dist_eq_zero.mp h10
    have := congrArg (fun X : ℝ² => X 0) hbad
    norm_num [pt] at this
  by_cases hbv : bCoord V = 1
  · have hV : V = pt 1 0 := eq_pt_one_of_bCoord_eq_one hbv
    have hPW : dist (pt 1 0) W = 0 := by
      simpa [hV] using hPV_PW
    have hW : W = pt 1 0 := (dist_eq_zero.mp hPW).symm
    have hRP : dist R (pt 1 0) = 0 := by
      simpa [hV] using hPV_RV.symm
    have hR : R = pt 1 0 := dist_eq_zero.mp hRP
    have hSP : dist S (pt 1 0) = 0 := by
      simpa [hR, hW] using hRW_SW.symm
    have hS : S = pt 1 0 := dist_eq_zero.mp hSP
    have h01 : dist (pt 0 0) (pt 1 0) = 0 := by
      simpa [hS, hV] using hAS_SV
    have hbad : pt 0 0 = pt 1 0 := dist_eq_zero.mp h01
    have := congrArg (fun X : ℝ² => X 0) hbad
    norm_num [pt] at this

  let zr := zCoord R
  let zs := zCoord S
  let zu := zCoord U
  let zv := zCoord V
  let zw := zCoord W
  let br := bCoord R
  let bs := bCoord S
  let bu := bCoord U
  let bv := bCoord V
  let bw := bCoord W

  have f1 : (br - bw) * zr + (-bs + bw) * zs + (-br + bs) * zw = 0 := by
    have h := diagonalized_eq_of_dist_eq hRW_SW
    change (zr - zw) * (br - bw) = (zs - zw) * (bs - bw) at h
    linear_combination h
  have f2 : (br - bw) * zr + (-bu + bw) * zu + (-br + bu) * zw = 0 := by
    have h := diagonalized_eq_of_dist_eq hRW_UW
    change (zr - zw) * (br - bw) = (zu - zw) * (bu - bw) at h
    linear_combination h
  have f3 : -bs * zs + 1 = 0 := by
    have h := diagonalized_eq_of_dist_eq hAP_AS
    change (zCoord (pt 0 0) - zCoord (pt 1 0)) *
        (bCoord (pt 0 0) - bCoord (pt 1 0)) =
      (zCoord (pt 0 0) - zs) * (bCoord (pt 0 0) - bs) at h
    simp [zCoord, bCoord, pt] at h
    linear_combination h
  have f4 : -bw * zw + 1 = 0 := by
    have h := diagonalized_eq_of_dist_eq hAP_AW
    change (zCoord (pt 0 0) - zCoord (pt 1 0)) *
        (bCoord (pt 0 0) - bCoord (pt 1 0)) =
      (zCoord (pt 0 0) - zw) * (bCoord (pt 0 0) - bw) at h
    simp [zCoord, bCoord, pt] at h
    linear_combination h
  have f5 : (-bs + bu) * zs + (bs - bu) * zu + 1 = 0 := by
    have h := diagonalized_eq_of_dist_eq (hAP_AS.trans hAS_SU)
    change (zCoord (pt 0 0) - zCoord (pt 1 0)) *
        (bCoord (pt 0 0) - bCoord (pt 1 0)) = (zs - zu) * (bs - bu) at h
    simp [zCoord, bCoord, pt] at h
    linear_combination h
  have f6 : (-bs + bv) * zs + (bs - bv) * zv + 1 = 0 := by
    have h := diagonalized_eq_of_dist_eq (hAP_AS.trans hAS_SV)
    change (zCoord (pt 0 0) - zCoord (pt 1 0)) *
        (bCoord (pt 0 0) - bCoord (pt 1 0)) = (zs - zv) * (bs - bv) at h
    simp [zCoord, bCoord, pt] at h
    linear_combination h
  have f7 : br * zr - bv * zv = 0 := by
    have h := diagonalized_eq_of_dist_eq hAR_AV
    change (zCoord (pt 0 0) - zr) * (bCoord (pt 0 0) - br) =
      (zCoord (pt 0 0) - zv) * (bCoord (pt 0 0) - bv) at h
    simp [zCoord, bCoord, pt] at h
    linear_combination h
  have f8 : (bv - 1) * zv + (1 - bw) * zw + (-bv + bw) = 0 := by
    have h := diagonalized_eq_of_dist_eq hPV_PW
    change (zCoord (pt 1 0) - zv) * (bCoord (pt 1 0) - bv) =
      (zCoord (pt 1 0) - zw) * (bCoord (pt 1 0) - bw) at h
    simp [zCoord, bCoord, pt] at h
    linear_combination h
  have f9 : (br - bv) * zr + (1 - br) * zv + (bv - 1) = 0 := by
    have h := diagonalized_eq_of_dist_eq hPV_RV
    change (zCoord (pt 1 0) - zv) * (bCoord (pt 1 0) - bv) =
      (zr - zv) * (br - bv) at h
    simp [zCoord, bCoord, pt] at h
    linear_combination -h
  have f10 : (1 - bu) * zr + (-br + bu) * zu + (br - 1) = 0 := by
    have h := diagonalized_eq_of_dist_eq hPR_RU
    change (zCoord (pt 1 0) - zr) * (bCoord (pt 1 0) - br) =
      (zr - zu) * (br - bu) at h
    simp [zCoord, bCoord, pt] at h
    linear_combination -h
  have f11 : (1 - bv) * zu + (-bu + bv) * zv + (bu - 1) = 0 := by
    have h := diagonalized_eq_of_dist_eq hPU_UV
    change (zCoord (pt 1 0) - zu) * (bCoord (pt 1 0) - bu) =
      (zu - zv) * (bu - bv) at h
    simp [zCoord, bCoord, pt] at h
    linear_combination -h

  have hbs : bs ≠ 0 := by
    intro h
    rw [h] at f3
    norm_num at f3
  have hbw : bw ≠ 0 := by
    intro h
    rw [h] at f4
    norm_num at f4
  have hbr' : br ≠ 0 := by simpa [br] using hbr
  have hbv' : bv - 1 ≠ 0 := sub_ne_zero.mpr (by simpa [bv] using hbv)

  have p1base := determinant_relation_one f1 f2 f3 f4 f5
  have p1 : bv * (br - bw) *
      (bs ^ 3 - 2 * bs ^ 2 * bu - bs ^ 2 * bw + bs * bu ^ 2 + bs * bu * bw +
        bs * bw ^ 2 - bu ^ 2 * bw) = 0 := by
    linear_combination bv * p1base
  have p2 := determinant_relation_two f2 f3 f4 f5 f6 f7
  have p5 := determinant_relation_five f3 f4 f5 f6 f7 f10
  have p7 := determinant_relation_seven f3 f4 f5 f6 f7 f11
  have p8 := determinant_relation_eight f3 f4 f6 f7 f8 f11
  have p9 := determinant_relation_nine f3 f4 f6 f7 f9 f11
  have hconj : zs = starRingEnd ℂ bs := by
    simpa [zs, bs] using zCoord_eq_conj_bCoord S
  have hconjV : zv = starRingEnd ℂ bv := by
    simpa [zv, bv] using zCoord_eq_conj_bCoord V
  exact determinant_relations_incompatible p1 p2 p5 p7 p8 p9 hbr' hbs hbw hbv'
    f3 f5 f6 f9 hconj hconjV

/-- The crossed-arm eleven distance equalities force the anchor labels to coincide. -/
#eval IO.println "START crossed_arm_seven_point_collision"
theorem crossed_arm_seven_point_collision
    {A P R S U V W : ℝ²}
    (hRW_SW : dist R W = dist S W)
    (hRW_UW : dist R W = dist U W)
    (hAP_AS : dist A P = dist A S)
    (hAP_AW : dist A P = dist A W)
    (hAS_SU : dist A S = dist S U)
    (hAS_SV : dist A S = dist S V)
    (hAR_AV : dist A R = dist A V)
    (hPV_PW : dist P V = dist P W)
    (hPV_RV : dist P V = dist R V)
    (hPR_RU : dist P R = dist R U)
    (hPU_UV : dist P U = dist U V) : A = P := by
  by_contra hAP
  let T : ℝ² → ℝ² := normSim A P
  let r := T R
  let s := T S
  let u := T U
  let v := T V
  let w := T W
  have hdist (X Y : ℝ²) :
      dist (T X) (T Y) = (dist A P)⁻¹ * dist X Y := by
    simpa [T] using normSim_dist_image A P hAP X Y
  have hT0 : T A = pt 0 0 := by
    simpa [T] using normSim_fst A P
  have hT1 : T P = pt 1 0 := by
    simpa [T] using normSim_snd A P hAP
  have map_dist_eq {X Y Z Q : ℝ²} (h : dist X Y = dist Z Q) :
      dist (T X) (T Y) = dist (T Z) (T Q) := by
    rw [hdist, hdist, h]
  apply normalized_crossedArmSevenPoint_incompatible
      (R := r) (S := s) (U := u) (V := v) (W := w)
  · simpa [r, s, w] using map_dist_eq hRW_SW
  · simpa [r, u, w] using map_dist_eq hRW_UW
  · simpa [s, hT0, hT1] using map_dist_eq hAP_AS
  · simpa [w, hT0, hT1] using map_dist_eq hAP_AW
  · simpa [s, u, hT0] using map_dist_eq hAS_SU
  · simpa [s, v, hT0] using map_dist_eq hAS_SV
  · simpa [r, v, hT0] using map_dist_eq hAR_AV
  · simpa [v, w, hT1] using map_dist_eq hPV_PW
  · simpa [r, v, hT1] using map_dist_eq hPV_RV
  · simpa [r, u, hT1] using map_dist_eq hPR_RU
  · simpa [u, v, hT1] using map_dist_eq hPU_UV

/-- Global-equality form of the crossed-arm collision. -/
theorem crossed_arm_seven_point_collision_of_global_equalities
    {A P R S U V W : ℝ²}
    (hRW_SW : dist R W = dist S W)
    (hRW_UW : dist R W = dist U W)
    (hAP_AS : dist A P = dist A S)
    (hAP_AW : dist A P = dist A W)
    (hAP_SU : dist A P = dist S U)
    (hAP_SV : dist A P = dist S V)
    (hAR_AV : dist A R = dist A V)
    (hPV_PW : dist P V = dist P W)
    (hPV_RV : dist P V = dist R V)
    (hPR_RU : dist P R = dist R U)
    (hPU_UV : dist P U = dist U V) : A = P := by
  apply crossed_arm_seven_point_collision hRW_SW hRW_UW hAP_AS hAP_AW
      (hAP_AS.symm.trans hAP_SU) (hAP_AS.symm.trans hAP_SV) hAR_AV hPV_PW hPV_RV
      hPR_RU hPU_UV

/-- Injective label realizations cannot contain the crossed-arm equality pattern. -/
theorem false_of_crossed_arm_seven_point_collision_of_injective
    {α : Type*} {pointOf : α → ℝ²} (hinj : Function.Injective pointOf)
    {A P R S U V W : α} (hAP : A ≠ P)
    (hAP_AS : dist (pointOf A) (pointOf P) = dist (pointOf A) (pointOf S))
    (hAP_AW : dist (pointOf A) (pointOf P) = dist (pointOf A) (pointOf W))
    (hSA_SU : dist (pointOf S) (pointOf A) = dist (pointOf S) (pointOf U))
    (hSA_SV : dist (pointOf S) (pointOf A) = dist (pointOf S) (pointOf V))
    (hWR_WS : dist (pointOf W) (pointOf R) = dist (pointOf W) (pointOf S))
    (hWR_WU : dist (pointOf W) (pointOf R) = dist (pointOf W) (pointOf U))
    (hPV_PW : dist (pointOf P) (pointOf V) = dist (pointOf P) (pointOf W))
    (hVP_VR : dist (pointOf V) (pointOf P) = dist (pointOf V) (pointOf R))
    (hAR_AV : dist (pointOf A) (pointOf R) = dist (pointOf A) (pointOf V))
    (hRP_RU : dist (pointOf R) (pointOf P) = dist (pointOf R) (pointOf U))
    (hUP_UV : dist (pointOf U) (pointOf P) = dist (pointOf U) (pointOf V)) : False := by
  apply hAP
  apply hinj
  apply crossed_arm_seven_point_collision
  · exact (dist_comm _ _).trans (hWR_WS.trans (dist_comm _ _))
  · exact (dist_comm _ _).trans (hWR_WU.trans (dist_comm _ _))
  · exact hAP_AS
  · exact hAP_AW
  · exact (dist_comm _ _).trans hSA_SU
  · exact (dist_comm _ _).trans hSA_SV
  · exact hAR_AV
  · exact hPV_PW
  · exact (dist_comm _ _).trans (hVP_VR.trans (dist_comm _ _))
  · exact (dist_comm _ _).trans hRP_RU
  · exact (dist_comm _ _).trans hUP_UV

/-- A purely combinatorial closure package for the crossed-arm seven-point
obstruction. -/
structure EqualityCore {α : Type*} (rowPattern : RowPattern α) where
  A : α
  P : α
  R : α
  S : α
  U : α
  V : α
  W : α
  hAP : A ≠ P
  AP_AS : EdgeClosure rowPattern (A, P) (A, S)
  AP_AW : EdgeClosure rowPattern (A, P) (A, W)
  SA_SU : EdgeClosure rowPattern (S, A) (S, U)
  SA_SV : EdgeClosure rowPattern (S, A) (S, V)
  WR_WS : EdgeClosure rowPattern (W, R) (W, S)
  WR_WU : EdgeClosure rowPattern (W, R) (W, U)
  PV_PW : EdgeClosure rowPattern (P, V) (P, W)
  VP_VR : EdgeClosure rowPattern (V, P) (V, R)
  AR_AV : EdgeClosure rowPattern (A, R) (A, V)
  RP_RU : EdgeClosure rowPattern (R, P) (R, U)
  UP_UV : EdgeClosure rowPattern (U, P) (U, V)

/-- No injective planar realization can realize a row pattern whose equality
closure contains a crossed-arm seven-point core. -/
theorem not_realizes_of_crossedArmSevenPointCollisionCore
    {α : Type*} {rowPattern : RowPattern α}
    (core : EqualityCore rowPattern) :
    ¬ ∃ pointOf : α → ℝ², Realizes rowPattern pointOf := by
  rintro ⟨pointOf, hreal⟩
  apply false_of_crossed_arm_seven_point_collision_of_injective hreal.injective core.hAP
  · simpa [edgeDist] using EdgeClosure.sound hreal core.AP_AS
  · simpa [edgeDist] using EdgeClosure.sound hreal core.AP_AW
  · simpa [edgeDist] using EdgeClosure.sound hreal core.SA_SU
  · simpa [edgeDist] using EdgeClosure.sound hreal core.SA_SV
  · simpa [edgeDist] using EdgeClosure.sound hreal core.WR_WS
  · simpa [edgeDist] using EdgeClosure.sound hreal core.WR_WU
  · simpa [edgeDist] using EdgeClosure.sound hreal core.PV_PW
  · simpa [edgeDist] using EdgeClosure.sound hreal core.VP_VR
  · simpa [edgeDist] using EdgeClosure.sound hreal core.AR_AV
  · simpa [edgeDist] using EdgeClosure.sound hreal core.RP_RU
  · simpa [edgeDist] using EdgeClosure.sound hreal core.UP_UV

end CrossedArmSevenPointEuclideanObstruction
end Problem97
