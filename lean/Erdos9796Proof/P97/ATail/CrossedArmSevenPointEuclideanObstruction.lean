/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.ATail.CrossedArmQ1G7Producer

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

/-- P97 ATail CrossedArmSevenPointEuclideanObstruction def. -/
private def zCoord (X : ℝ²) : ℂ := (X 0 : ℂ) + Complex.I * (X 1 : ℂ)

/-- P97 ATail CrossedArmSevenPointEuclideanObstruction def. -/
private def bCoord (X : ℝ²) : ℂ := (X 0 : ℂ) - Complex.I * (X 1 : ℂ)

/-- P97 ATail CrossedArmSevenPointEuclideanObstruction theorem. -/
private theorem zCoord_eq_conj_bCoord (X : ℝ²) :
    zCoord X = starRingEnd ℂ (bCoord X) := by
  simp [zCoord, bCoord]

/-- P97 ATail CrossedArmSevenPointEuclideanObstruction theorem. -/
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

/-- P97 ATail CrossedArmSevenPointEuclideanObstruction theorem. -/
private theorem eq_pt_zero_of_bCoord_eq_zero {X : ℝ²} (h : bCoord X = 0) :
    X = pt 0 0 := by
  ext i
  fin_cases i
  · have hr := congrArg Complex.re h
    simpa [bCoord, pt] using hr
  · have hi := congrArg Complex.im h
    simp [bCoord] at hi
    simp [pt, hi]

/-- P97 ATail CrossedArmSevenPointEuclideanObstruction theorem. -/
private theorem eq_pt_one_of_bCoord_eq_one {X : ℝ²} (h : bCoord X = 1) :
    X = pt 1 0 := by
  ext i
  fin_cases i
  · have hr := congrArg Complex.re h
    simpa [bCoord, pt] using hr
  · have hi := congrArg Complex.im h
    simp [bCoord] at hi
    simp [pt, hi]

set_option maxHeartbeats 2000000 in
/-- P97 ATail CrossedArmSevenPointEuclideanObstruction theorem. -/
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
/-- P97 ATail CrossedArmSevenPointEuclideanObstruction theorem. -/
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
/-- P97 ATail CrossedArmSevenPointEuclideanObstruction theorem. -/
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
/-- P97 ATail CrossedArmSevenPointEuclideanObstruction theorem. -/
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
/-- P97 ATail CrossedArmSevenPointEuclideanObstruction theorem. -/
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
  -- `grobner` does not close this goal.  The cofactors come from a Groebner
  -- lift of the goal over the hypothesis ideal; `f7` and `f11` are not needed.
  linear_combination
    (br * bs * bv ^ 2 * bw - br * bv ^ 3 * bw - 2 * br * bs * bv * bw +
        2 * br * bv ^ 2 * bw + br * bs * bw - br * bv * bw) * f3 +
      (-(br * bs ^ 2 * bv * bw) + br * bs * bv ^ 2 * bw + br * bs ^ 2 * bv -
        br * bs * bv ^ 2 + br * bs ^ 2 * bw - br * bs * bv * bw -
        br * bs ^ 2 + br * bs * bv) * f4 +
      (-(br * bs * bv ^ 2 * bw) + 2 * br * bs * bv * bw - br * bs * bw) * f6 +
      (br * bs ^ 2 * bv * bw - br * bs * bv ^ 2 * bw - br * bs ^ 2 * bw +
        br * bs * bv * bw) * f8

set_option maxHeartbeats 2000000 in
/-- P97 ATail CrossedArmSevenPointEuclideanObstruction theorem. -/
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
  -- `grobner` does not close this goal.  The cofactors come from a Groebner
  -- lift of the goal over the hypothesis ideal; `f4` and `f11` are not needed.
  linear_combination
    (-(br ^ 2 * bs * bv) + br ^ 2 * bv ^ 2 + br * bs * bv ^ 2 - br * bv ^ 3 -
        bs * bv ^ 3 + bv ^ 4 + br ^ 2 * bs - br ^ 2 * bv + bs * bv ^ 2 -
        bv ^ 3 - br * bs + br * bv) * f3 +
      (br ^ 2 * bs * bv - br * bs * bv ^ 2 + bs * bv ^ 3 - br ^ 2 * bs -
        bs * bv ^ 2 + br * bs) * f6 +
      (-(br * bs ^ 2 * bv) + br * bs * bv ^ 2 + bs ^ 2 * bv ^ 2 - bs * bv ^ 3 +
        br * bs ^ 2 - br * bs * bv - bs ^ 2 * bv + bs * bv ^ 2) * f7 +
      (br * bs ^ 2 * bv - br * bs * bv ^ 2 - br * bs ^ 2 + br * bs * bv) * f9

/- The six normalized polynomials and the equal-anchor bridge come from
   `CrossedArmQ1G7Producer`, which declares them in this namespace.  Private
   copies of the same names are not allowed: Lean v4.33 rejects a declaration
   whose name an imported module already holds. -/

set_option maxHeartbeats 4000000 in
/-- P97 ATail CrossedArmSevenPointEuclideanObstruction theorem. -/
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
  -- `grobner` does not close this goal.  The cofactors come from a Groebner
  -- lift of the goal over the hypothesis ideal, reduced modulo the syzygies.
  linear_combination
      (      -7499 * bs^ 4/804 + 5 * bs^ 3 * bv * bw/6 - 14317 * bs^ 3 * bv/804 - 6731 * bs^ 3
        * bw/804 + 44 * bs^ 3 + 7901 * bs^ 2 * bu^ 2/804 - 5 * bs^ 2 * bu * bv * bw/6 -
        9847 * bs^ 2 * bu * bv/201 - bs^ 2 * bu * bw^ 2/2 - 2647 * bs^ 2 * bu * bw/804 -
        5087 * bs^ 2 * bu/402 - bs^ 2 * bv^ 3/2 - bs^ 2 * bv^ 2 * bw/3 + 5989 * bs^ 2 *
        bv^ 2/201 + 10 * bs^ 2 * bv * bw^ 2/3 + 1184 * bs^ 2 * bv * bw/201 + 3711 * bs^
        2 * bv/67 - 10827 * bs^ 2 * bw^ 2/268 + 13497 * bs^ 2 * bw/134 - 25213 * bs^
        2/201 - bs * bu^ 3/2 + 51565 * bs * bu^ 2 * bv/804 + bs * bu^ 2 * bw^ 2/2 - 5 *
        bs * bu^ 2 * bw/2 - bs * bu^ 2 + bs * bu * bv^ 3/2 + bs * bu * bv^ 2 * bw/3 -
        1805 * bs * bu * bv^ 2/201 - 10 * bs * bu * bv * bw^ 2/3 + 13779 * bs * bu * bv
        * bw/268 - 84209 * bs * bu * bv/804 - 214 * bs * bu * bw^ 2/3 + 5725 * bs * bu *
        bw/402 + 9646 * bs * bu/201 + bs * bv^ 4/2 - bs * bv^ 3 * bw + 5185 * bs * bv^
        3/268 - bs * bv^ 2 * bw^ 2/2 - 9546 * bs * bv^ 2 * bw/67 + 17399 * bs * bv^
        2/804 + bs * bv * bw^ 3/2 + 139013 * bs * bv * bw^ 2/804 - 119339 * bs * bv *
        bw/804 + 31965 * bs * bv/268 - bs * bw^ 4/2 - 24925 * bs * bw^ 3/804 + 8849 * bs
        * bw^ 2/134 - 15610 * bs * bw/201 + 26771 * bs/804 - bu^ 3 * bv/2 + bu^ 3 * bw/2
        - 2 * bu^ 2 * bv^ 2 + 2 * bu^ 2 * bv * bw - 287 * bu^ 2 * bv/67 - bu^ 2 * bw^
        2/2 - 17785 * bu^ 2 * bw/402 - 11747 * bu^ 2/804 - 37 * bu * bv^ 3/6 + 23 * bu *
        bv^ 2 * bw/2 - 211 * bu * bv^ 2/3 - 37 * bu * bv * bw^ 2/6 + 22489 * bu * bv *
        bw/268 + 9761 * bu * bv/134 + 10 * bu * bw^ 3/3 + 43 * bu * bw^ 2/6 + 15101 * bu
        * bw/804 - 28315 * bu/804 + 17 * bv^ 4/6 - 71 * bv^ 3 * bw/6 + 2717 * bv^ 3/804
        + 97 * bv^ 2 * bw^ 2/6 + 19663 * bv^ 2 * bw/201 - 22067 * bv^ 2/402 - 19 * bv *
        bw^ 3/3 - 2883 * bv * bw^ 2/67 - 61673 * bv * bw/804 + 38585 * bv/804 + 17 * bw^
        4/6 + 1651 * bw^ 3/268 - 4928 * bw^ 2/201 + 16873 * bw/268 - 19369/402) * p2 +
      (      7499 * bs^ 4/804 + 5 * bs^ 3 * bu * bv/6 - 6731 * bs^ 3 * bu/804 - 5 * bs^ 3 * bv
        * bw/6 + 4549 * bs^ 3 * bv/268 - 5683 * bs^ 3 * bw/402 - 879 * bs^ 3/67 - 5 *
        bs^ 2 * bu^ 2 * bv/6 - bs^ 2 * bu^ 2 * bw/2 - 64 * bs^ 2 * bu^ 2/67 - bs^ 2 * bu
        * bv^ 2/3 + 25 * bs^ 2 * bu * bv * bw/6 - 5073 * bs^ 2 * bu * bv/268 + bs^ 2 *
        bu * bw^ 2/2 + 10641 * bs^ 2 * bu * bw/134 + 195 * bs^ 2 * bu/134 + bs^ 2 * bv^
        3/2 + bs^ 2 * bv^ 2 * bw/3 - 1974 * bs^ 2 * bv^ 2/67 - 10 * bs^ 2 * bv * bw^ 2/3
        - 618 * bs^ 2 * bv * bw/67 + 2827 * bs^ 2 * bv/804 + 10827 * bs^ 2 * bw^ 2/268 -
        49043 * bs^ 2 * bw/402 + 5579 * bs^ 2/67 + bs * bu^ 3 * bw/2 + 5 * bs * bu^ 2 *
        bv^ 2/6 + 64 * bs * bu^ 2 * bv/67 + 3 * bs * bu^ 2 * bw^ 2/2 - 9643 * bs * bu^ 2
        * bw/134 - bs * bu * bv^ 3/2 - 14 * bs * bu * bv^ 2 * bw/3 + 11645 * bs * bu *
        bv^ 2/402 + 20 * bs * bu * bv * bw^ 2/3 - 169 * bs * bu * bv * bw/134 + 10237 *
        bs * bu * bv/804 - 35 * bs * bu * bw^ 3/6 + 45791 * bs * bu * bw^ 2/402 - 19739
        * bs * bu * bw/268 - 329 * bs * bu/134 - bs * bv^ 4/2 + bs * bv^ 3 * bw + 156 *
        bs * bv^ 3/67 + bs * bv^ 2 * bw^ 2/2 + 3673 * bs * bv^ 2 * bw/804 + 11567 * bs *
        bv^ 2/804 - 29 * bs * bv * bw^ 3/6 - 67783 * bs * bv * bw^ 2/804 + 31545 * bs *
        bv * bw/268 - 11091 * bs * bv/134 + 4 * bs * bw^ 4 - 7873 * bs * bw^ 3/268 +
        31477 * bs * bw^ 2/804 - 418 * bs * bw/67 - bu^ 3 * bv^ 2/2 + bu^ 3 * bv * bw/2
        + bu^ 3 * bv/2 - bu^ 3 * bw^ 2/2 - 11 * bu^ 2 * bv^ 2/6 - 2 * bu^ 2 * bv * bw^ 2
        + 12953 * bu^ 2 * bv * bw/804 - 61 * bu^ 2 * bv/134 + bu^ 2 * bw^ 3/2 + 17785 *
        bu^ 2 * bw^ 2/402 + 11345 * bu^ 2 * bw/804 + bu^ 2/2 + bu * bv^ 3 - 17 * bu *
        bv^ 2 * bw^ 2/3 + 15079 * bu * bv^ 2 * bw/402 - 18691 * bu * bv^ 2/402 + 49 * bu
        * bv * bw^ 3/6 - 82777 * bu * bv * bw^ 2/804 + 11645 * bu * bv * bw/402 + 64 *
        bu * bv/67 - 10 * bu * bw^ 4/3 - 43 * bu * bw^ 3/6 - 6712 * bu * bw^ 2/201 +
        28315 * bu * bw/804 + bv^ 4/2 + 23 * bv^ 3 * bw^ 2/6 + 521 * bv^ 3 * bw/804 +
        27791 * bv^ 3/804 - 22 * bv^ 2 * bw^ 3/3 + 561 * bv^ 2 * bw^ 2/268 - 13539 * bv^
        2 * bw/134 + 949 * bv^ 2/67 + 3 * bv * bw^ 4 + 7487 * bv * bw^ 3/201 + 3839 * bv
        * bw^ 2/134 + 26563 * bv * bw/804 - 17 * bw^ 5/6 - 1651 * bw^ 4/268 - 1927 * bw^
        3/402 + 1579 * bw^ 2/402 - 882 * bw/67 - 1) * p5 +
      (      -7499 * bs^ 4 * bw/804 - 4549 * bs^ 3 * bv * bw/268 + 28645 * bs^ 3 * bw/804 +
        7901 * bs^ 2 * bu^ 2 * bw/804 - 20029 * bs^ 2 * bu * bv * bw/402 - 17681 * bs^ 2
        * bu * bw^ 2/804 + 743 * bs^ 2 * bu * bw/134 - bs^ 2 * bv^ 3 * bw/2 + 1974 * bs^
        2 * bv^ 2 * bw/67 - 7499 * bs^ 2 * bv^ 2/804 + 62693 * bs^ 2 * bv * bw^ 2/804 +
        4253 * bs^ 2 * bv * bw/804 - 25969 * bs^ 2 * bw^ 3/201 + 82423 * bs^ 2 * bw^
        2/402 - 30205 * bs^ 2 * bw/201 - bs * bu^ 3 * bw/2 + 52235 * bs * bu^ 2 * bv *
        bw/804 - 8705 * bs * bu^ 2 * bw^ 2/804 - 73 * bs * bu^ 2 * bw/134 + bs * bu *
        bv^ 3 * bw/2 - 5 * bs * bu * bv^ 3/6 - bs * bu * bv^ 2 * bw^ 2/2 - 3677 * bs *
        bu * bv^ 2 * bw/402 + 6731 * bs * bu * bv^ 2/804 - 5 * bs * bu * bv * bw^ 3/2 -
        48685 * bs * bu * bv * bw^ 2/804 + 598 * bs * bu * bv * bw/67 + bs * bu * bv - 2
        * bs * bu * bw^ 4 - 1931 * bs * bu * bw^ 3/402 + 8875 * bs * bu * bw^ 2/804 -
        7097 * bs * bu * bw/804 + bs * bu/2 + bs * bv^ 4 * bw/2 - bs * bv^ 3 * bw^ 2 +
        16225 * bs * bv^ 3 * bw/804 - 10573 * bs * bv^ 3/402 + 23 * bs * bv^ 2 * bw^ 3/6
        - 3952 * bs * bv^ 2 * bw^ 2/67 + 6671 * bs * bv^ 2 * bw/201 + 879 * bs * bv^
        2/67 - 11 * bs * bv * bw^ 4/3 + 86489 * bs * bv * bw^ 3/804 - 115199 * bs * bv *
        bw^ 2/402 + 64907 * bs * bv * bw/402 - bs * bv/2 + 16 * bs * bw^ 5/3 + 724 * bs
        * bw^ 4/67 + 35581 * bs * bw^ 3/804 + 3569 * bs * bw^ 2/268 - 815 * bs * bw/67 -
        bu^ 3 * bv^ 2 * bw/2 + bu^ 3 * bv * bw/2 + bu^ 3 * bw^ 2/2 - bu^ 3 * bw/2 + 5 *
        bu^ 2 * bv^ 3/6 + bu^ 2 * bv^ 2 * bw^ 2/2 - 17 * bu^ 2 * bv^ 2 * bw/6 + 64 * bu^
        2 * bv^ 2/67 - bu^ 2 * bv * bw^ 3/2 - 50359 * bu^ 2 * bv * bw^ 2/804 - 11309 *
        bu^ 2 * bv * bw/804 - bu^ 2 * bv/2 + 11345 * bu^ 2 * bw^ 3/804 + bu^ 2 * bw^ 2/2
        - bu * bv^ 4/2 - bu * bv^ 3 * bw^ 2/2 - 59 * bu * bv^ 3 * bw/6 + 10975 * bu *
        bv^ 3/402 - bu * bv^ 2 * bw^ 3/3 + 8535 * bu * bv^ 2 * bw^ 2/134 - 10133 * bu *
        bv^ 2 * bw/134 - 195 * bu * bv^ 2/134 + 16 * bu * bv * bw^ 4/3 + 2769 * bu * bv
        * bw^ 3/268 + 17581 * bu * bv * bw^ 2/268 - 11677 * bu * bv * bw/804 + 11819 *
        bu * bw^ 4/804 - 53777 * bu * bw^ 3/804 + 24661 * bu * bw^ 2/402 + bu * bw - bv^
        5/2 + 13 * bv^ 4 * bw/3 + 1271 * bv^ 4/402 + bv^ 3 * bw^ 3/2 - 8983 * bv^ 3 *
        bw^ 2/402 - 18437 * bv^ 3 * bw/134 + 7573 * bv^ 3/268 - 2 * bv^ 2 * bw^ 4 + 1967
        * bv^ 2 * bw^ 3/402 + 59083 * bv^ 2 * bw^ 2/201 - 25261 * bv^ 2 * bw/804 + bv^ 2
        - 13 * bv * bw^ 5/6 + 16439 * bv * bw^ 4/402 - 37009 * bv * bw^ 3/201 + 24395 *
        bv * bw^ 2/804 - 7707 * bv * bw/268 + bv - 11783 * bw^ 5/402 + 53777 * bw^ 4/804
        - 24661 * bw^ 3/402 - bw) * p7 +
      (      -18097 * bs^ 4 * bw/804 + 18097 * bs^ 3 * bw/268 + bs^ 2 * bu^ 2 * bv + 9745 * bs^
        2 * bu^ 2 * bw/804 + bs^ 2 * bu^ 2/2 - 21838 * bs^ 2 * bu * bv * bw/201 - 3 *
        bs^ 2 * bu * bv/2 + 11235 * bs^ 2 * bu * bw^ 2/134 + 8353 * bs^ 2 * bu * bw/804
        - bs^ 2 * bu/2 - 5809 * bs^ 2 * bv^ 2 * bw/268 + 8078 * bs^ 2 * bv * bw^ 2/67 -
        4774 * bs^ 2 * bv * bw/201 + bs^ 2 * bv/2 + 7 * bs^ 2 * bw^ 4/2 - 4492 * bs^ 2 *
        bw^ 3/67 - 7498 * bs^ 2 * bw^ 2/201 - 16625 * bs^ 2 * bw/268 - 3 * bs * bu^ 3 *
        bv/2 + 29879 * bs * bu^ 3 * bw/804 - bs * bu^ 3/2 + 2431 * bs * bu^ 2 * bv *
        bw/268 + 2 * bs * bu^ 2 * bv - 6245 * bs * bu^ 2 * bw/134 + bs * bu^ 2/2 + 39315
        * bs * bu * bv^ 2 * bw/268 + 75251 * bs * bu * bv^ 2/804 + 61 * bs * bu * bv *
        bw^ 3/6 - 22585 * bs * bu * bv * bw^ 2/201 - 112547 * bs * bu * bv * bw/402 + bs
        * bu * bv/2 - 41 * bs * bu * bw^ 4/6 - 10853 * bs * bu * bw^ 3/804 - 5647 * bs *
        bu * bw^ 2/268 + 42487 * bs * bu * bw/268 + bs * bv^ 3 * bw^ 2 - 17 * bs * bv^ 3
        * bw/2 - 5139 * bs * bv^ 3/268 - 31 * bs * bv^ 2 * bw^ 3/6 - 59083 * bs * bv^ 2
        * bw^ 2/804 + 6270 * bs * bv^ 2 * bw/67 - 5646 * bs * bv^ 2/67 + bs * bv * bw^
        4/6 + 17759 * bs * bv * bw^ 3/804 + 15695 * bs * bv * bw^ 2/201 + 71003 * bs *
        bv * bw/804 - bs * bv - 17 * bs * bw^ 5/6 - 2675 * bs * bw^ 4/804 + 31499 * bs *
        bw^ 3/804 - 13675 * bs * bw^ 2/402 + bs * bw + bu^ 4 * bv/2 - 11747 * bu^ 4 *
        bw/804 + 1046 * bu^ 3 * bv * bw/201 - bu^ 3 * bv/2 + 17333 * bu^ 3 * bw^ 2/804 -
        25501 * bu^ 3 * bw/804 + bu^ 2 * bv^ 3 * bw/2 - bu^ 2 * bv^ 3/2 - bu^ 2 * bv^ 2
        * bw^ 2 - 1315 * bu^ 2 * bv^ 2 * bw/134 - 74849 * bu^ 2 * bv^ 2/804 - 6 * bu^ 2
        * bv * bw^ 3 - 32263 * bu^ 2 * bv * bw^ 2/402 + 92647 * bu^ 2 * bv * bw/402 -
        bu^ 2 * bv + 23 * bu^ 2 * bw^ 4/6 - 11005 * bu^ 2 * bw^ 3/804 + 59881 * bu^ 2 *
        bw^ 2/804 - 10547 * bu^ 2 * bw/268 - bu^ 2/2 - bu * bv^ 3 * bw^ 2/2 + 49 * bu *
        bv^ 3 * bw/6 - 73321 * bu * bv^ 3/804 + bu * bv^ 2 * bw^ 3 - 8455 * bu * bv^ 2 *
        bw^ 2/402 + 13522 * bu * bv^ 2 * bw/201 + 4831 * bu * bv^ 2/67 - bu * bv * bw^
        4/6 + 106379 * bu * bv * bw^ 3/804 - 28549 * bu * bv * bw^ 2/134 - 4708 * bu *
        bv * bw/201 + 3 * bu * bv/2 + 7 * bu * bw^ 5/3 - 4859 * bu * bw^ 4/201 - 27619 *
        bu * bw^ 3/804 + 36203 * bu * bw^ 2/804 + 748 * bu * bw/67 - bv^ 4 * bw + 4 *
        bv^ 4/3 + 11 * bv^ 3 * bw^ 2/6 + 17390 * bv^ 3 * bw/201 + 19885 * bv^ 3/268 - 11
        * bv^ 2 * bw^ 3/6 - 17189 * bv^ 2 * bw^ 2/201 - 60727 * bv^ 2 * bw/804 + 5 * bv
        * bw^ 4/6 + 34981 * bv * bw^ 3/402 - 3659 * bv * bw^ 2/268 - 19885 * bv * bw/268) * p8 +
      (      18097 * bs^ 4 * bw/804 - 7499 * bs^ 3 * bv/804 - 46373 * bs^ 3 * bw/804 - 419 *
        bs^ 3/804 + 13091 * bs^ 2 * bu^ 2 * bw/804 - 9221 * bs^ 2 * bu^ 2/402 + 20505 *
        bs^ 2 * bu * bv/268 - 10352 * bs^ 2 * bu * bw^ 2/67 + 47890 * bs^ 2 * bu *
        bw/201 - 9896 * bs^ 2 * bu/67 - 1818 * bs^ 2 * bv^ 2/67 + 5295 * bs^ 2 * bv/268
        + 5 * bs^ 2 * bw^ 4/6 + 18194 * bs^ 2 * bw^ 3/201 - 60727 * bs^ 2 * bw^ 2/804 +
        399 * bs^ 2 * bw/268 + 19885 * bs^ 2/268 + bs * bu^ 4 * bv/2 - bs * bu^ 4/2 + bs
        * bu^ 3 * bv/2 - 51773 * bs * bu^ 3 * bw/804 + 4510 * bs * bu^ 3/201 + 65669 *
        bs * bu^ 2 * bv * bw/804 - 10048 * bs * bu^ 2 * bv/201 + 30947 * bs * bu^ 2 *
        bw/804 + 22663 * bs * bu^ 2/804 - 21509 * bs * bu * bv^ 2 * bw/201 - 9853 * bs *
        bu * bv^ 2/804 - 13 * bs * bu * bv * bw^ 3/6 + 17267 * bs * bu * bv * bw^ 2/402
        + 11747 * bs * bu * bv * bw/268 + 4261 * bs * bu * bv/268 + 10 * bs * bu * bw^
        4/3 + 11806 * bs * bu * bw^ 3/201 + 167 * bs * bu * bw^ 2/402 - 131147 * bs * bu
        * bw/804 + 6903 * bs * bu/268 - bs * bv^ 4/2 - bs * bv^ 3 * bw^ 2 + 31 * bs *
        bv^ 3 * bw/6 + 736 * bs * bv^ 3/201 + 7 * bs * bv^ 2 * bw^ 3/3 + 31559 * bs *
        bv^ 2 * bw^ 2/402 - 30611 * bs * bv^ 2 * bw/804 + 24719 * bs * bv^ 2/402 + 2 *
        bs * bv * bw^ 4 - 30999 * bs * bv * bw^ 3/268 + 16733 * bs * bv * bw^ 2/804 -
        11683 * bs * bv * bw/804 - 15821 * bs * bv/268 - 17 * bs * bw^ 4/6 - 1651 * bs *
        bw^ 3/268 + 13273 * bs * bw^ 2/402 - bs * bw + bs - bu^ 5 * bv/2 + bu^ 5/2 - bu^
        4 * bv/2 + 11345 * bu^ 4 * bw/804 + bu^ 3 * bv^ 2/2 + 10925 * bu^ 3 * bv *
        bw/402 - 1219 * bu^ 3 * bv/67 + 11819 * bu^ 3 * bw^ 2/804 - 24625 * bu^ 3 *
        bw/804 - bu^ 3 + bu^ 2 * bv^ 2 * bw^ 2/2 + 1335 * bu^ 2 * bv^ 2 * bw/268 + 9977
        * bu^ 2 * bv^ 2/268 - 7 * bu^ 2 * bv * bw^ 3/2 - 731 * bu^ 2 * bv * bw^ 2/402 -
        137521 * bu^ 2 * bv * bw/804 + 16513 * bu^ 2 * bv/268 - 1707 * bu^ 2 * bw^ 3/67
        + 5572 * bu^ 2 * bw^ 2/201 + 10949 * bu^ 2 * bw/268 + 3 * bu^ 2/2 + 10 * bu *
        bv^ 2 * bw^ 3/3 - 23 * bu * bv^ 2 * bw^ 2/2 + 17329 * bu * bv^ 2 * bw/201 -
        10111 * bu * bv^ 2/268 - 17 * bu * bv * bw^ 4/3 + 7997 * bu * bv * bw^ 3/402 +
        5489 * bu * bv * bw^ 2/67 + 15115 * bu * bv * bw/402 - 11369 * bu * bv/268 + 7 *
        bu * bw^ 4/3 - 4390 * bu * bw^ 3/201 - 45179 * bu * bw^ 2/804 - 748 * bu * bw/67
        - bu + bv^ 3 * bw^ 2 - 4 * bv^ 3 * bw/3 - 5 * bv^ 2 * bw^ 3/6 - 5953 * bv^ 2 *
        bw^ 2/67 - 58583 * bv^ 2 * bw/804 + 5 * bv * bw^ 3/6 + 5886 * bv * bw^ 2/67 +
        19885 * bv * bw/268) * p9

set_option maxHeartbeats 4000000 in
/-- P97 ATail CrossedArmSevenPointEuclideanObstruction theorem. -/
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
  -- `grobner` does not close this goal.  The cofactors come from a Groebner
  -- lift of the goal over the hypothesis ideal, reduced modulo the syzygies.
  linear_combination
      (      429 * bs^ 4/134 - 269 * bs^ 3 * bv/268 - 10 * bs^ 3 * bw/67 - 25 * bs^ 3/4 - 429 *
        bs^ 2 * bu^ 2/134 + 207 * bs^ 2 * bu * bv/268 + 404 * bs^ 2 * bu * bw/67 + 161 *
        bs^ 2 * bu/67 + 11 * bs^ 2 * bv^ 2/268 - 133 * bs^ 2 * bv * bw/268 + 92 * bs^ 2
        * bv/67 + 1429 * bs^ 2 * bw^ 2/134 - 3383 * bs^ 2 * bw/134 + 5163 * bs^ 2/268 -
        269 * bs * bu^ 2 * bv/134 + 213 * bs * bu * bv^ 2/268 - 1911 * bs * bu * bv *
        bw/268 + 1461 * bs * bu * bv/134 + 3 * bs * bu * bw^ 2 + 28 * bs * bu * bw/67 -
        1075 * bs * bu/134 + 159 * bs * bv^ 3/268 + 1119 * bs * bv^ 2 * bw/268 - 1071 *
        bs * bv^ 2/268 - 1024 * bs * bv * bw^ 2/67 + 5351 * bs * bv * bw/268 - 608 * bs
        * bv/67 + 217 * bs * bw^ 3/268 - 53 * bs * bw^ 2/67 - 16 * bs * bw/67 - 675 *
        bs/268 - 573 * bu^ 2 * bv/268 + 413 * bu^ 2 * bw/134 + 285 * bu^ 2/268 + 7 * bu
        * bv^ 2/4 + 233 * bu * bv * bw/268 - 1133 * bu * bv/268 - bu * bw^ 2/4 - 37 * bu
        * bw/67 + 97 * bu/67 + 455 * bv^ 3/67 - 1182 * bv^ 2 * bw/67 + 701 * bv^ 2/268 +
        2595 * bv * bw^ 2/268 + 63 * bv * bw/134 - 106 * bv/67 + 281 * bw^ 3/268 - 513 *
        bw^ 2/268 + 729 * bw/268 + 259/268) * p2 +
      (      -429 * bs^ 4/134 - 10 * bs^ 3 * bu/67 + 269 * bs^ 3 * bv/268 - 719 * bs^ 3 *
        bw/268 + 1237 * bs^ 3/134 + 449 * bs^ 2 * bu^ 2/134 + 629 * bs^ 2 * bu * bv/268
        - 1099 * bs^ 2 * bu * bw/134 - 449 * bs^ 2 * bu/134 - 11 * bs^ 2 * bv^ 2/268 +
        133 * bs^ 2 * bv * bw/268 - 2821 * bs^ 2 * bv/268 - 1429 * bs^ 2 * bw^ 2/134 +
        2002 * bs^ 2 * bw/67 - 998 * bs^ 2/67 - 449 * bs * bu^ 2 * bv/134 + 349 * bs *
        bu^ 2 * bw/67 - 589 * bs * bu * bv^ 2/268 + 881 * bs * bu * bv * bw/268 - 647 *
        bs * bu * bv/268 - 441 * bs * bu * bw^ 2/67 + 963 * bs * bu * bw/268 + 583 * bs
        * bu/134 + 150 * bs * bv^ 3/67 - 507 * bs * bv^ 2 * bw/134 + 1657 * bs * bv^
        2/268 + 988 * bs * bv * bw^ 2/67 - 7665 * bs * bv * bw/268 + 931 * bs * bv/67 +
        493 * bs * bw^ 3/268 + 677 * bs * bw^ 2/268 - 170 * bs * bw/67 - 285 * bu^ 2 *
        bv * bw/268 + 449 * bu^ 2 * bv/134 - 413 * bu^ 2 * bw^ 2/134 - 285 * bu^ 2 *
        bw/268 - 329 * bu * bv^ 2 * bw/268 + 673 * bu * bv^ 2/268 + 591 * bu * bv * bw^
        2/134 - 261 * bu * bv * bw/134 - 449 * bu * bv/134 + bu * bw^ 3/4 + 433 * bu *
        bw^ 2/268 - 97 * bu * bw/67 + 127 * bv^ 3 * bw/67 - 2367 * bv^ 3/134 - 731 * bv^
        2 * bw^ 2/268 + 8453 * bv^ 2 * bw/268 - 260 * bv^ 2/67 - 59 * bv * bw^ 3/134 -
        2367 * bv * bw^ 2/134 + 1025 * bv * bw/134 - 281 * bw^ 4/268 + 627 * bw^ 3/268 -
        809 * bw^ 2/134 + 193 * bw/67) * p5 +
      (      429 * bs^ 4 * bw/134 - 269 * bs^ 3 * bv * bw/268 - 1715 * bs^ 3 * bw/268 - 429 *
        bs^ 2 * bu^ 2 * bw/134 + 207 * bs^ 2 * bu * bv * bw/268 + 1217 * bs^ 2 * bu *
        bw^ 2/134 - 87 * bs^ 2 * bu * bw/134 + 11 * bs^ 2 * bv^ 2 * bw/268 + 429 * bs^ 2
        * bv^ 2/134 - 969 * bs^ 2 * bv * bw^ 2/268 - 128 * bs^ 2 * bv * bw/67 + 1823 *
        bs^ 2 * bw^ 3/268 - 975 * bs^ 2 * bw^ 2/67 + 2095 * bs^ 2 * bw/134 - 269 * bs *
        bu^ 2 * bv * bw/134 + 429 * bs * bu^ 2 * bw^ 2/134 - 449 * bs * bu^ 2 * bw/134 +
        481 * bs * bu * bv^ 2 * bw/268 + 10 * bs * bu * bv^ 2/67 - 230 * bs * bu * bv *
        bw^ 2/67 + 279 * bs * bu * bv * bw/134 - bs * bu * bv - 2059 * bs * bu * bw^
        3/268 + 479 * bs * bu * bw^ 2/67 + 161 * bs * bu * bw/134 + 159 * bs * bv^ 3 *
        bw/268 + 589 * bs * bv^ 3/268 - 1369 * bs * bv^ 2 * bw^ 2/134 + 995 * bs * bv^ 2
        * bw/134 - 1237 * bs * bv^ 2/134 + 233 * bs * bv * bw^ 3/67 + 3029 * bs * bv *
        bw^ 2/134 - 743 * bs * bv * bw/67 + bs * bv - 180 * bs * bw^ 4/67 + 673 * bs *
        bw^ 3/268 - 5621 * bs * bw^ 2/268 + 528 * bs * bw/67 - 449 * bu^ 2 * bv^ 2/134 +
        269 * bu^ 2 * bv * bw^ 2/134 + 1183 * bu^ 2 * bv * bw/268 - 285 * bu^ 2 * bw^
        3/268 - 589 * bu * bv^ 3/268 - 419 * bu * bv^ 2 * bw^ 2/268 + 1737 * bu * bv^ 2
        * bw/268 + 449 * bu * bv^ 2/134 + 1557 * bu * bv * bw^ 3/268 - 3775 * bu * bv *
        bw^ 2/268 + 76 * bu * bv * bw/67 + 171 * bu * bw^ 4/268 + 889 * bu * bw^ 3/268 -
        1031 * bu * bw^ 2/268 + 150 * bv^ 4/67 + 227 * bv^ 3 * bw^ 2/268 + 2559 * bv^ 3
        * bw/268 - 1369 * bv^ 3/268 - 567 * bv^ 2 * bw^ 3/268 - 6331 * bv^ 2 * bw^ 2/268
        + 501 * bv^ 2 * bw/268 - 567 * bv * bw^ 4/268 + 5285 * bv * bw^ 3/268 - 1117 *
        bv * bw^ 2/268 + 1369 * bv * bw/268 + 57 * bw^ 5/134 - 889 * bw^ 4/268 + 1031 *
        bw^ 3/268) * p7 +
      (      -759 * bs^ 4 * bw/268 + 2277 * bs^ 3 * bw/268 - bs^ 2 * bu^ 2 * bv + 95 * bs^ 2 *
        bu^ 2 * bw/134 + 4233 * bs^ 2 * bu * bv * bw/268 + 2 * bs^ 2 * bu * bv - 1937 *
        bs^ 2 * bu * bw^ 2/268 - 1633 * bs^ 2 * bu * bw/134 - 759 * bs^ 2 * bv^ 2 *
        bw/268 - 216 * bs^ 2 * bv * bw^ 2/67 - 2061 * bs^ 2 * bv * bw/268 - bs^ 2 * bv +
        355 * bs^ 2 * bw^ 3/134 + 708 * bs^ 2 * bw^ 2/67 - 1191 * bs^ 2 * bw/134 + bs *
        bu^ 3 * bv - 323 * bs * bu^ 3 * bw/67 - 1193 * bs * bu^ 2 * bv * bw/134 - 2 * bs
        * bu^ 2 * bv + 4895 * bs * bu^ 2 * bw/268 + 135 * bs * bu * bv^ 2 * bw/134 -
        2425 * bs * bu * bv^ 2/134 + 125 * bs * bu * bv * bw^ 2/134 + 4683 * bs * bu *
        bv * bw/134 + bs * bu * bv + 2329 * bs * bu * bw^ 3/268 - 1581 * bs * bu * bw^
        2/67 - 242 * bs * bu * bw/67 - 759 * bs * bv^ 3/268 + 695 * bs * bv^ 2 * bw^
        2/268 - 1257 * bs * bv^ 2 * bw/268 + 998 * bs * bv^ 2/67 - 399 * bs * bv * bw^
        3/268 - 3165 * bs * bv * bw^ 2/268 + 537 * bs * bv * bw/67 - 281 * bs * bw^
        4/268 + 397 * bs * bw^ 3/134 - 513 * bs * bw^ 2/268 + bs * bw + 285 * bu^ 4 *
        bw/268 + 123 * bu^ 3 * bv * bw/268 - 149 * bu^ 3 * bw^ 2/268 + 30 * bu^ 3 *
        bw/67 - 61 * bu^ 2 * bv^ 2 * bw/134 + 2291 * bu^ 2 * bv^ 2/134 + 1045 * bu^ 2 *
        bv * bw^ 2/134 - 8061 * bu^ 2 * bv * bw/268 + bu^ 2 * bv + 203 * bu^ 2 * bw^
        3/134 - 599 * bu^ 2 * bw^ 2/268 - 63 * bu^ 2 * bw/268 + 385 * bu * bv^ 3/134 +
        349 * bu * bv^ 2 * bw^ 2/268 - 1041 * bu * bv^ 2 * bw/268 - 537 * bu * bv^ 2/67
        - 870 * bu * bv * bw^ 3/67 + 6501 * bu * bv * bw^ 2/268 - 295 * bu * bv * bw/134
        - bu * bv + 249 * bu * bw^ 4/134 - 74 * bu * bw^ 3/67 + 955 * bu * bw^ 2/134 -
        528 * bu * bw/67 - 715 * bv^ 3 * bw/134 + 135 * bv^ 3/134 + 715 * bv^ 2 * bw^
        2/134 - 135 * bv^ 2 * bw/134 - 715 * bv * bw^ 3/134 + 425 * bv * bw^ 2/67 - 135
        * bv * bw/134) * p8 +
      (      759 * bs^ 4 * bw/268 + 429 * bs^ 3 * bv/134 - 165 * bs^ 3 * bw/67 - 2475 * bs^
        3/268 - 141 * bs^ 2 * bu^ 2 * bw/134 + 607 * bs^ 2 * bu^ 2/268 - 1041 * bs^ 2 *
        bu * bv/67 + 2441 * bs^ 2 * bu * bw^ 2/268 - 2669 * bs^ 2 * bu * bw/134 + 3239 *
        bs^ 2 * bu/134 + 589 * bs^ 2 * bv^ 2/268 + 1311 * bs^ 2 * bv/268 - 715 * bs^ 2 *
        bw^ 3/134 + 1205 * bs^ 2 * bw^ 2/134 + 103 * bs^ 2 * bw/67 + 135 * bs^ 2/134 +
        196 * bs * bu^ 3 * bw/67 - 607 * bs * bu^ 3/268 - 1417 * bs * bu^ 2 * bv *
        bw/268 + 1611 * bs * bu^ 2 * bv/134 - 2501 * bs * bu^ 2 * bw/268 - 604 * bs *
        bu^ 2/67 + 131 * bs * bu * bv^ 2 * bw/134 + 2945 * bs * bu * bv^ 2/268 + 505 *
        bs * bu * bv * bw^ 2/134 - 733 * bs * bu * bv * bw/67 + 391 * bs * bu * bv/67 -
        2705 * bs * bu * bw^ 3/268 + 5443 * bs * bu * bw^ 2/268 + 179 * bs * bu * bw/67
        - 1369 * bs * bu/268 + 150 * bs * bv^ 3/67 - 1203 * bs * bv^ 2 * bw^ 2/268 +
        1174 * bs * bv^ 2 * bw/67 - 6103 * bs * bv^ 2/268 + 1825 * bs * bv * bw^ 3/268 -
        3949 * bs * bv * bw^ 2/268 + 100 * bs * bv * bw/67 - 655 * bs * bv/134 - 281 *
        bs * bw^ 3/268 + 513 * bs * bw^ 2/268 + bs * bw - bs - 285 * bu^ 4 * bw/268 -
        329 * bu^ 3 * bv * bw/268 + 21 * bu^ 3 * bv/67 + 171 * bu^ 3 * bw^ 2/268 + 911 *
        bu^ 3 * bw/268 + 127 * bu^ 2 * bv^ 2 * bw/67 - 2067 * bu^ 2 * bv^ 2/134 - 1101 *
        bu^ 2 * bv * bw^ 2/134 + 7359 * bu^ 2 * bv * bw/268 - 2493 * bu^ 2 * bv/268 + 57
        * bu^ 2 * bw^ 3/134 - 369 * bu^ 2 * bw^ 2/268 + 63 * bu^ 2 * bw/268 - 639 * bu *
        bv^ 2 * bw/134 + 2067 * bu * bv^ 2/134 + 1979 * bu * bv * bw^ 3/268 - 4467 * bu
        * bv * bw^ 2/268 - 990 * bu * bv * bw/67 + 2409 * bu * bv/268 + 249 * bu * bw^
        3/134 + 101 * bu * bw^ 2/134 + 528 * bu * bw/67 + 715 * bv^ 2 * bw^ 2/134 - 135
        * bv^ 2 * bw/134 - 715 * bv * bw^ 2/134 + 135 * bv * bw/134) * p9

set_option maxHeartbeats 4000000 in
/-- P97 ATail CrossedArmSevenPointEuclideanObstruction theorem. -/
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

-- `grobner` cannot close this goal, so the proof carries an explicit 1688-term
-- ideal-membership certificate; the raised limits cover elaborating it.
set_option maxRecDepth 100000 in
set_option maxHeartbeats 4000000 in
/-- P97 ATail CrossedArmSevenPointEuclideanObstruction theorem. -/
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
  have hT1 : br * bs ^ 2 * (bv - 1) * (bs - bv) = 0 := by
    linear_combination
      (-br * bu ^ 4 * bv ^ 2 * bw + br * bu ^ 4 * bv ^ 3 - br * bu ^ 5 * bv ^ 2 + br *
        bs * bu ^ 4 * bv * bw - br * bs * bu ^ 4 * bv ^ 2 + br * bs * bu ^ 5 * bv - bu *
        bv ^ 5 * bw - 8500179931588 * bu ^ 2 * bv ^ 3 * bw ^ 2 / 706465498035 +
        8500179931588 * bu ^ 2 * bv ^ 4 * bw / 706465498035 + 2 * bu ^ 2 * bv ^ 5 +
        8500179931588 * bu ^ 3 * bv ^ 2 * bw ^ 2 / 706465498035 + 4779435986219 * bu ^ 3
        * bv ^ 3 * bw / 1412930996070 + 2 * bu ^ 3 * bv ^ 4 + 1108807537294 * bu ^ 4 *
        bv ^ 2 * bw / 141293099607 - 23531108781764 * bu ^ 4 * bv ^ 3 / 235488499345 +
        4077468918823 * bu ^ 5 * bv ^ 2 / 282586199214 - 4921131568307 * bs * bu ^ 2 *
        bv ^ 3 * bw / 282586199214 - 2 * bs * bu ^ 2 * bv ^ 4 - 1108807537294 * bs * bu
        ^ 3 * bv ^ 2 * bw / 141293099607 + 24002085780454 * bs * bu ^ 3 * bv ^ 3 /
        235488499345 + 51172059829279 * bs * bu ^ 4 * bv ^ 2 / 706465498035 -
        122731464252673 * bs ^ 2 * bu ^ 3 * bv ^ 2 / 1412930996070 - br * bu * bv ^ 4 *
        bw - 14725363073 * br * bu ^ 2 * bv ^ 3 * bw / 42816090790 - 3649149609298 * br
        * bu ^ 2 * bv ^ 4 / 706465498035 - 675388163456 * br * bu ^ 3 * bv * bw ^ 2 /
        706465498035 - 3031744935178 * br * bu ^ 3 * bv ^ 2 * bw / 235488499345 +
        2179430063957 * br * bu ^ 3 * bv ^ 3 / 42816090790 + 4419088758041 * br * bu ^ 4
        * bv * bw / 1412930996070 + 47300978781369 * br * bu ^ 4 * bv ^ 2 / 470976998690
        - 2664537922753 * br * bu ^ 5 * bv / 282586199214 + 28115021286923 * br * bs *
        bu ^ 2 * bv ^ 2 * bw / 1412930996070 + 28579349648647 * br * bs * bu ^ 2 * bv ^
        3 / 1412930996070 + 675388163456 * br * bs * bu ^ 3 * bw ^ 2 / 706465498035 +
        932416637057 * br * bs * bu ^ 3 * bv * bw / 706465498035 - 21920925068754 * br *
        bs * bu ^ 3 * bv ^ 2 / 235488499345 - 4419088758041 * br * bs * bu ^ 4 * bw /
        1412930996070 - 189621905467909 * br * bs * bu ^ 4 * bv / 1412930996070 +
        2947124121967 * br * bs * bu ^ 5 / 282586199214 + 33837087023392 * br * bs ^ 2 *
        bu ^ 4 / 706465498035 + br ^ 2 * bu * bv ^ 3 * bw + 879189079963 * br ^ 2 * bu ^
        2 * bv ^ 2 * bw / 470976998690 + 117098202739 * br ^ 2 * bu ^ 2 * bv ^ 3 /
        282586199214 - 8504663819789 * br ^ 2 * bu ^ 3 * bv * bw / 706465498035 -
        26560601552786 * br ^ 2 * bu ^ 3 * bv ^ 2 / 706465498035 - 2389820193817 * br ^
        2 * bu ^ 4 * bv / 282586199214 - 3086335258030 * br ^ 2 * bs * bu ^ 2 * bv ^ 2 /
        141293099607 + 278937493739 * br ^ 2 * bs * bu ^ 3 * bw / 128448272370 +
        61427214664 * br ^ 2 * bs * bu ^ 3 * bv / 530777985 - 19828777082591 * br ^ 2 *
        bs * bu ^ 4 / 1412930996070 - 2092475383925 * br ^ 2 * bs ^ 2 * bu ^ 3 /
        94195399738 - br ^ 3 * bu * bv ^ 2 * bw + 5 * br ^ 3 * bu ^ 2 * bv * bw - br ^ 3
        * bu ^ 2 * bv ^ 2 - 162801219046 * br ^ 3 * bu ^ 3 * bv / 21408045395 +
        98577082861 * br ^ 3 * bs * bu ^ 3 / 21408045395 + 3095255795179 * bv ^ 3 * bw ^
        3 / 1412930996070 + 54332827395647 * bv ^ 4 * bw ^ 2 / 706465498035 +
        5578791443386 * bv ^ 5 * bw / 706465498035 - 3095255795179 * bu * bv ^ 2 * bw ^
        3 / 1412930996070 - 6110955465867 * bu * bv ^ 3 * bw ^ 2 / 94195399738 -
        43178080440107 * bu * bv ^ 4 * bw / 1412930996070 - 3621609633349 * bu * bv ^ 5
        / 42816090790 - 623920678273 * bu ^ 2 * bv ^ 2 * bw ^ 2 / 42816090790 +
        65677841258779 * bu ^ 2 * bv ^ 3 * bw / 706465498035 + 462378594586883 * bu ^ 2
        * bv ^ 4 / 706465498035 - 21234637347164 * bu ^ 3 * bv ^ 2 * bw / 235488499345 +
        777990650018827 * bu ^ 3 * bv ^ 3 / 470976998690 - 531816593797033 * bu ^ 4 * bv
        ^ 2 / 1412930996070 + 6189442046611 * bs * bv ^ 4 * bw / 1412930996070 -
        3200329804057 * bs * bu * bv ^ 3 * bw / 64224136185 - 10674533249684 * bs * bu *
        bv ^ 4 / 21408045395 + 19730868318547 * bs * bu ^ 2 * bv * bw ^ 2 /
        1412930996070 + 78435810143557 * bs * bu ^ 2 * bv ^ 2 * bw / 1412930996070 -
        258630962474939 * bs * bu ^ 2 * bv ^ 3 / 141293099607 - 1027064131938217 * bs *
        bu ^ 3 * bv ^ 2 / 1412930996070 + 155888072573525 * bs ^ 2 * bu ^ 2 * bv ^ 2 /
        141293099607 - 3095255795179 * br * bv ^ 2 * bw ^ 3 / 1412930996070 -
        57298183814572 * br * bv ^ 3 * bw ^ 2 / 706465498035 - 113917028232038 * br * bv
        ^ 4 * bw / 706465498035 + 107432931797221 * br * bv ^ 5 / 1412930996070 +
        3095255795179 * br * bu * bv * bw ^ 3 / 1412930996070 + 19189810241011 * br * bu
        * bv ^ 2 * bw ^ 2 / 141293099607 + 229470710306089 * br * bu * bv ^ 3 * bw /
        706465498035 - 4154373448279 * br * bu * bv ^ 4 / 282586199214 - 25084818753954
        * br * bu ^ 2 * bv * bw ^ 2 / 235488499345 - 181986380337887 * br * bu ^ 2 * bv
        ^ 2 * bw / 706465498035 - 739060438877209 * br * bu ^ 2 * bv ^ 3 / 470976998690
        + 51250644731741 * br * bu ^ 3 * bv * bw / 470976998690 - 1409481322722122 * br
        * bu ^ 3 * bv ^ 2 / 706465498035 + 225382519747247 * br * bu ^ 4 * bv /
        706465498035 + 3095255795179 * br * bs * bv * bw ^ 3 / 1412930996070 -
        14059894965323 * br * bs * bv ^ 3 * bw / 282586199214 - 10738757385869 * br * bs
        * bv ^ 4 / 21408045395 - 3095255795179 * br * bs * bu * bw ^ 3 / 1412930996070 +
        22167571743281 * br * bs * bu * bv * bw ^ 2 / 1412930996070 + 228552065265391 *
        br * bs * bu * bv ^ 2 * bw / 1412930996070 + 423278687864321 * br * bs * bu * bv
        ^ 3 / 470976998690 + 1163226575355 * br * bs * bu ^ 2 * bw ^ 2 / 47097699869 +
        80861046176008 * br * bs * bu ^ 2 * bv * bw / 706465498035 + 148477374241978 *
        br * bs * bu ^ 2 * bv ^ 2 / 64224136185 - 59884662267919 * br * bs * bu ^ 3 * bw
        / 706465498035 + 418430283990655 * br * bs * bu ^ 3 * bv / 282586199214 -
        255181496879689 * br * bs * bu ^ 4 / 706465498035 - 36069075707451 * br * bs ^ 2
        * bu ^ 2 * bw / 235488499345 - 632838838791257 * br * bs ^ 2 * bu ^ 3 /
        1412930996070 + 3095255795179 * br ^ 2 * bv * bw ^ 3 / 1412930996070 +
        2615157127684 * br ^ 2 * bv ^ 2 * bw ^ 2 / 235488499345 + 19374849817613 * br ^
        2 * bv ^ 3 * bw / 128448272370 - 166992453338512 * br ^ 2 * bv ^ 4 /
        706465498035 + 2284659760111 * br ^ 2 * bu * bv * bw ^ 2 / 706465498035 -
        502267337687339 * br ^ 2 * bu * bv ^ 2 * bw / 1412930996070 + 42782121346269 *
        br ^ 2 * bu * bv ^ 3 / 94195399738 + 217385791821667 * br ^ 2 * bu ^ 2 * bv * bw
        / 1412930996070 + 967758953285141 * br ^ 2 * bu ^ 2 * bv ^ 2 / 1412930996070 +
        119275001739964 * br ^ 2 * bu ^ 3 * bv / 235488499345 - 3095255795179 * br ^ 2 *
        bs * bw ^ 3 / 1412930996070 + 87385434823107 * br ^ 2 * bs * bv ^ 3 /
        235488499345 - 1372484515833 * br ^ 2 * bs * bu * bw ^ 2 / 470976998690 -
        12190494334629 * br ^ 2 * bs * bu * bv * bw / 235488499345 - 685545447127579 *
        br ^ 2 * bs * bu * bv ^ 2 / 706465498035 + 103511177610403 * br ^ 2 * bs * bu ^
        2 * bw / 1412930996070 - 1459570616113534 * br ^ 2 * bs * bu ^ 2 * bv /
        706465498035 + 417770035250153 * br ^ 2 * bs * bu ^ 3 / 706465498035 +
        24374496521747 * br ^ 2 * bs ^ 2 * bu * bw / 470976998690 + 325658832753643 * br
        ^ 2 * bs ^ 2 * bu ^ 2 / 706465498035 - 5449657106621 * br ^ 3 * bv * bw ^ 2 /
        282586199214 - 2819537480113 * br ^ 3 * bv ^ 2 * bw / 64224136185 +
        195365302271297 * br ^ 3 * bv ^ 3 / 1412930996070 + 374287523891 * br ^ 3 * bu *
        bv * bw / 4281609079 - 36739643768779 * br ^ 3 * bu * bv ^ 2 / 470976998690 -
        38738988286419 * br ^ 3 * bu ^ 2 * bv / 235488499345 + 5449657106621 * br ^ 3 *
        bs * bw ^ 2 / 282586199214 - 35481427551866 * br ^ 3 * bs * bv * bw /
        706465498035 - 70431597751036 * br ^ 3 * bs * bv ^ 2 / 235488499345 -
        4499355281413 * br ^ 3 * bs * bu * bw / 128448272370 + 1046612060356837 * br ^ 3
        * bs * bu * bv / 1412930996070 - 334031063332697 * br ^ 3 * bs * bu ^ 2 /
        1412930996070 + 24731194842839 * br ^ 3 * bs ^ 2 * bw / 1412930996070 -
        13300656428105 * br ^ 3 * bs ^ 2 * bu / 282586199214 + 6031483694719 * br ^ 4 *
        bv * bw / 1412930996070 - 6278974030997 * br ^ 4 * bv ^ 2 / 235488499345 -
        29691062881 * br ^ 4 * bu * bv / 4281609079 + 19902664586111 * br ^ 4 * bs * bv
        / 470976998690 + 707654418989 * br ^ 4 * bs * bu / 706465498035 - 8001332938816
        * br ^ 4 * bs ^ 2 / 706465498035 - 51222569322838 * bv ^ 3 * bw ^ 2 /
        706465498035 + 11909078002643 * bv ^ 4 * bw / 141293099607 + 5333627553613 * bv
        ^ 5 / 1412930996070 + 75123805483391 * bu * bv ^ 2 * bw ^ 2 / 706465498035 -
        281062336641578 * bu * bv ^ 3 * bw / 706465498035 - 1371011704282171 * bu * bv ^
        4 / 1412930996070 + 156073507320531 * bu ^ 2 * bv ^ 2 * bw / 470976998690 -
        438475539445303 * bu ^ 2 * bv ^ 3 / 1412930996070 - 72671730866591 * bu ^ 3 * bv
        ^ 2 / 1412930996070 + 15827798411113 * bs * bv ^ 3 * bw / 282586199214 +
        10717349340474 * bs * bv ^ 4 / 21408045395 - 23901236160553 * bs * bu * bv * bw
        ^ 2 / 706465498035 - 251783403246083 * bs * bu * bv ^ 2 * bw / 1412930996070 +
        1975325145572987 * bs * bu * bv ^ 3 / 1412930996070 - 2381215310083 * bs * bu ^
        2 * bv * bw / 141293099607 + 2857669344082621 * bs * bu ^ 2 * bv ^ 2 /
        1412930996070 + 1360428260761 * bs ^ 2 * bu * bv * bw / 470976998690 -
        2745936757151363 * bs ^ 2 * bu * bv ^ 2 / 1412930996070 - 3095255795179 * br *
        bv * bw ^ 3 / 1412930996070 - 4939826801002 * br * bv ^ 2 * bw ^ 2 /
        706465498035 - 38210948435789 * br * bv ^ 3 * bw / 282586199214 - 39023138560503
        * br * bv ^ 4 / 235488499345 + 16867676848783 * br * bu * bv * bw ^ 2 /
        1412930996070 + 19268954001329 * br * bu * bv ^ 2 * bw / 42816090790 +
        150456340612927 * br * bu * bv ^ 3 / 64224136185 - 59303606833473 * br * bu ^ 2
        * bv * bw / 235488499345 - 874375622549056 * br * bu ^ 2 * bv ^ 2 / 706465498035
        + 432827208616598 * br * bu ^ 3 * bv / 706465498035 + 3095255795179 * br * bs *
        bw ^ 3 / 1412930996070 - 581128916410 * br * bs * bv * bw ^ 2 / 141293099607 -
        20391169026091 * br * bs * bv ^ 2 * bw / 706465498035 - 2121232914780083 * br *
        bs * bv ^ 3 / 1412930996070 - 14956427307 * br * bs * bu * bw ^ 2 / 1220147665 -
        220228725173872 * br * bs * bu * bv * bw / 706465498035 + 649309496065544 * br *
        bs * bu * bv ^ 2 / 235488499345 + 37794948373267 * br * bs * bu ^ 2 * bw /
        282586199214 - 1791347374948039 * br * bs * bu ^ 2 * bv / 706465498035 -
        339268626992294 * br * bs * bu ^ 3 / 706465498035 + 36596592016316 * br * bs ^ 2
        * bu * bw / 141293099607 - 2568086534344 * br * bs ^ 2 * bu ^ 2 / 64224136185 +
        1931580468716 * br ^ 2 * bv * bw ^ 2 / 64224136185 + 4302702239969 * br ^ 2 * bv
        ^ 2 * bw / 25689654474 - 20226339210871 * br ^ 2 * bv ^ 3 / 47097699869 -
        198131057695652 * br ^ 2 * bu * bv * bw / 706465498035 - 800445850285033 * br ^
        2 * bu * bv ^ 2 / 1412930996070 + 122917566571307 * br ^ 2 * bu ^ 2 * bv /
        94195399738 - 1931580468716 * br ^ 2 * bs * bw ^ 2 / 64224136185 +
        59136158113283 * br ^ 2 * bs * bv * bw / 470976998690 + 1157344316802257 * br ^
        2 * bs * bv ^ 2 / 706465498035 - 41443422098157 * br ^ 2 * bs * bu * bw /
        470976998690 - 980166414619961 * br ^ 2 * bs * bu * bv / 706465498035 +
        258461960835253 * br ^ 2 * bs * bu ^ 2 / 470976998690 - 639968025775 * br ^ 2 *
        bs ^ 2 * bw / 8563218158 - 1149808132703939 * br ^ 2 * bs ^ 2 * bu /
        1412930996070 + 48630188959048 * br ^ 3 * bv * bw / 706465498035 -
        210280355152496 * br ^ 3 * bv ^ 2 / 706465498035 + 1256482409892317 * br ^ 3 *
        bu * bv / 1412930996070 - 5449657106621 * br ^ 3 * bs * bw / 282586199214 -
        413604281633761 * br ^ 3 * bs * bv / 1412930996070 + 6452555295063 * br ^ 3 * bs
        * bu / 94195399738 + 2615288181314 * br ^ 3 * bs ^ 2 / 47097699869 -
        16159104138973 * br ^ 4 * bv / 282586199214 + 60720291711425 * bv ^ 3 * bw /
        282586199214 + 358743478681429 * bv ^ 4 / 470976998690 - 55854493654794 * bu *
        bv ^ 2 * bw / 235488499345 - 91640721555737 * bu * bv ^ 3 / 47097699869 +
        539272528240769 * bu ^ 2 * bv ^ 2 / 706465498035 + 15233615590502 * bs * bv ^ 2
        * bw / 141293099607 + 230391261223534 * bs * bv ^ 3 / 706465498035 +
        51883757103389 * bs * bu * bv * bw / 1412930996070 - 1012281748792987 * bs * bu
        * bv ^ 2 / 470976998690 + 19730868318547 * bs * bu ^ 2 * bv / 1412930996070 -
        1360428260761 * bs ^ 2 * bv * bw / 470976998690 + 654893747834393 * bs ^ 2 * bv
        ^ 2 / 706465498035 - 2025204830578 * br * bv * bw ^ 2 / 235488499345 -
        19643522182891 * br * bv ^ 2 * bw / 94195399738 - 315298514233387 * br * bv ^ 3
        / 470976998690 + 219354852020351 * br * bu * bv * bw / 706465498035 +
        2540334166801216 * br * bu * bv ^ 2 / 706465498035 - 95321750206598 * br * bu ^
        2 * bv / 47097699869 + 2025204830578 * br * bs * bw ^ 2 / 235488499345 +
        67285538410702 * br * bs * bv * bw / 706465498035 - 781393413420089 * br * bs *
        bv ^ 2 / 470976998690 - 30738211184473 * br * bs * bu * bw / 1412930996070 -
        1934338623594647 * br * bs * bu * bv / 1412930996070 + 1688330317798841 * br *
        bs * bu ^ 2 / 1412930996070 - 141811426073659 * br * bs ^ 2 * bw / 1412930996070
        + 867340508110949 * br * bs ^ 2 * bu / 706465498035 - 14956843799197 * br ^ 2 *
        bv * bw / 470976998690 + 273175994801497 * br ^ 2 * bv ^ 2 / 235488499345 -
        2914860808047271 * br ^ 2 * bu * bv / 706465498035 + 23247685281619 * br ^ 2 *
        bs * bw / 470976998690 + 2080254619984 * br ^ 2 * bs * bv / 1946185945 +
        4155174782020 * br ^ 2 * bs * bu / 47097699869 + 53698371399259 * br ^ 2 * bs ^
        2 / 141293099607 - 448988823009263 * br ^ 3 * bv / 1412930996070 + 5449657106621
        * br ^ 3 * bs / 282586199214 - 43721187538823 * bv ^ 2 * bw / 1412930996070 +
        152585511771057 * bv ^ 3 / 470976998690 - 1360428260761 * bu * bv * bw /
        470976998690 - 166355889415711 * bu * bv ^ 2 / 470976998690 + 76288582131337 *
        bs * bv ^ 2 / 94195399738 - 23901236160553 * bs * bu * bv / 706465498035 -
        67327875174503 * br * bv * bw / 1412930996070 - 288556143404361 * br * bv ^ 2 /
        235488499345 + 3781684404439807 * br * bu * bv / 1412930996070 - 1017825010681 *
        br * bs * bw / 42816090790 - 191824397660781 * br * bs * bv / 470976998690 +
        105329471679193 * br * bs * bu / 282586199214 - 558038630590091 * br * bs ^ 2 /
        706465498035 + 166600107530110 * br ^ 2 * bv / 141293099607 - 15196675368977 *
        br ^ 2 * bs / 470976998690 + 70054421744 * bv ^ 2 / 21408045395 -
        189133966766817 * br * bv / 235488499345 + 9170870286913 * br * bs /
        706465498035) * hq + (-bu ^ 5 * bv + 6120392878852 * bs * bu ^ 2 * bv ^ 2 * bw /
        706465498035 - 5413927380817 * bs * bu ^ 2 * bv ^ 3 / 706465498035 -
        6120392878852 * bs * bu ^ 3 * bv * bw / 706465498035 + 5413927380817 * bs * bu ^
        3 * bv ^ 2 / 706465498035 - 7883754118639 * bs * bu ^ 4 * bv / 706465498035 + bs
        * bu ^ 5 - 6120392878852 * bs ^ 2 * bu ^ 2 * bv * bw / 706465498035 +
        5413927380817 * bs ^ 2 * bu ^ 2 * bv ^ 2 / 706465498035 + 6120392878852 * bs ^ 2
        * bu ^ 3 * bw / 706465498035 + 1058764078619 * bs ^ 2 * bu ^ 3 * bv /
        235488499345 + 7883754118639 * bs ^ 2 * bu ^ 4 / 706465498035 - 8590219616674 *
        bs ^ 3 * bu ^ 3 / 706465498035 + 6120392878852 * br * bs * bu ^ 2 * bv * bw /
        706465498035 + 411437794181 * br * bs * bu ^ 2 * bv ^ 2 / 706465498035 -
        3136781280466 * br * bs * bu ^ 3 * bv / 706465498035 - 6120392878852 * br * bs ^
        2 * bu ^ 2 * bw / 706465498035 + 545068697257 * br * bs ^ 2 * bu ^ 2 * bv /
        141293099607 + 3136781280466 * br * bs ^ 2 * bu ^ 3 / 706465498035 -
        3136781280466 * br * bs ^ 3 * bu ^ 2 / 706465498035 + bv ^ 4 * bw - bv ^ 5 - 5 *
        bu * bv ^ 3 * bw + 5 * bu * bv ^ 4 - 15652138763539 * bu ^ 2 * bv ^ 2 * bw /
        1412930996070 + 492187702159 * bu ^ 2 * bv ^ 3 / 42816090790 + 15652138763539 *
        bu ^ 3 * bv * bw / 1412930996070 - 4262980661439 * bu ^ 3 * bv ^ 2 /
        235488499345 + 5169054710327 * bu ^ 4 * bw / 470976998690 + 169775281108 * bu ^
        4 * bv / 47097699869 + 4 * bu ^ 5 - 13093671354427 * bs * bv ^ 3 * bw /
        1412930996070 + 13093671354427 * bs * bv ^ 4 / 1412930996070 - 39230541141441 *
        bs * bu * bv * bw ^ 2 / 470976998690 - 87977215335113 * bs * bu * bv ^ 2 * bw /
        1412930996070 + 7394310390011 * bs * bu * bv ^ 3 / 128448272370 - 8500179931588
        * bs * bu ^ 2 * bw ^ 2 / 706465498035 + 14671259775145 * bs * bu ^ 2 * bv * bw /
        141293099607 - 35368611033489 * bs * bu ^ 2 * bv ^ 2 / 235488499345 +
        760251360554 * bs * bu ^ 3 * bw / 235488499345 + 32658033691658 * bs * bu ^ 3 *
        bv / 47097699869 - 3199266363346 * bs * bu ^ 4 / 141293099607 + 15025097115289 *
        bs ^ 2 * bv ^ 2 * bw / 706465498035 - 15025097115289 * bs ^ 2 * bv ^ 3 /
        706465498035 + 39230541141441 * bs ^ 2 * bu * bw ^ 2 / 470976998690 +
        92216008323323 * bs ^ 2 * bu * bv * bw / 1412930996070 + 112546903812289 * bs ^
        2 * bu * bv ^ 2 / 1412930996070 - 149780910182579 * bs ^ 2 * bu ^ 2 * bw /
        1412930996070 - 6723852574573 * bs ^ 2 * bu ^ 2 * bv / 11677115670 -
        193718238441533 * bs ^ 2 * bu ^ 3 / 282586199214 - 18369453872221 * bs ^ 3 * bv
        * bw / 1412930996070 + 18369453872221 * bs ^ 3 * bv ^ 2 / 1412930996070 -
        19812311109062 * bs ^ 3 * bu * bv / 141293099607 + 343584929284461 * bs ^ 3 * bu
        ^ 2 / 470976998690 - br * bv ^ 3 * bw + 2 * br * bv ^ 4 + 5 * br * bu * bv ^ 2 *
        bw - 10 * br * bu * bv ^ 3 - 1941925734598 * br * bu ^ 2 * bv ^ 2 / 235488499345
        - 14156387804069 * br * bu ^ 3 * bw / 1412930996070 + 13298070475313 * br * bu ^
        3 * bv / 470976998690 + 77169037466 * br * bu ^ 4 / 21408045395 + 850381130846 *
        br * bs * bv ^ 2 * bw / 706465498035 + 119516310196967 * br * bs * bv ^ 3 /
        1412930996070 - 996806510594 * br * bs * bu * bv * bw / 12844827237 -
        321982787865697 * br * bs * bu * bv ^ 2 / 706465498035 + 13711339743148 * br *
        bs * bu ^ 2 * bw / 706465498035 + 40146686079640 * br * bs * bu ^ 2 * bv /
        141293099607 + 2010019895616 * br * bs * bu ^ 3 / 235488499345 + 3872421364941 *
        br * bs ^ 2 * bv * bw / 470976998690 - 22374544591592 * br * bs ^ 2 * bv ^ 2 /
        235488499345 + 945427201646 * br * bs ^ 2 * bu * bw / 12844827237 +
        9044515172186 * br * bs ^ 2 * bu * bv / 47097699869 - 43416940507441 * br * bs ^
        2 * bu ^ 2 / 141293099607 - 2381019072089 * br * bs ^ 3 * bw / 282586199214 +
        4077740890198 * br * bs ^ 3 * bv / 141293099607 + 191260318769152 * br * bs ^ 3
        * bu / 706465498035 - 1924820902769 * br * bs ^ 4 / 94195399738 + br ^ 2 * bv ^
        2 * bw - br ^ 2 * bv ^ 3 - 5 * br ^ 2 * bu * bv * bw + 5 * br ^ 2 * bu * bv ^ 2
        + 5414339409613 * br ^ 2 * bu ^ 2 * bv / 1412930996070 - 184209264441 * br ^ 2 *
        bu ^ 3 / 21408045395 - 16146943742884 * br ^ 2 * bs * bv * bw / 706465498035 -
        12340772397159 * br ^ 2 * bs * bv ^ 2 / 470976998690 + 4 * br ^ 2 * bs * bu * bw
        - 13384844282923 * br ^ 2 * bs * bu * bv / 1412930996070 + 3094734462991 * br ^
        2 * bs * bu ^ 2 / 1412930996070 + 15440478244849 * br ^ 2 * bs ^ 2 * bw /
        706465498035 + 12811749395849 * br ^ 2 * bs ^ 2 * bv / 470976998690 +
        9146051294713 * br ^ 2 * bs ^ 2 * bu / 1412930996070 + 9111158450038 * bv ^ 2 *
        bw ^ 2 / 706465498035 + 13020056112348 * bv ^ 3 * bw / 235488499345 -
        40324569841 * bv ^ 4 / 244029533 + 57048244381516 * bu * bv * bw ^ 2 /
        706465498035 + 141294358751189 * bu * bv ^ 2 * bw / 1412930996070 +
        378952894618592 * bu * bv ^ 3 / 706465498035 - 3095255795179 * bu ^ 2 * bw ^ 2 /
        706465498035 - 68918677957871 * bu ^ 2 * bv * bw / 470976998690 +
        138547296370442 * bu ^ 2 * bv ^ 2 / 706465498035 + 13842043958986 * bu ^ 3 * bw
        / 706465498035 - 330375013716353 * bu ^ 3 * bv / 470976998690 + 11555851751 * bu
        ^ 4 / 47097699869 + 3095255795179 * bs * bw ^ 3 / 1412930996070 + 87348082096039
        * bs * bv * bw ^ 2 / 1412930996070 - 5066424026909 * bs * bv ^ 2 * bw /
        282586199214 + 86038695801638 * bs * bv ^ 3 / 706465498035 + 429257032231 * bs *
        bu * bw ^ 2 / 706465498035 - 5624388593347 * bs * bu * bv * bw / 128448272370 -
        417499886629711 * bs * bu * bv ^ 2 / 470976998690 - 16370351533451 * bs * bu ^ 2
        * bw / 282586199214 + 310141371326778 * bs * bu ^ 2 * bv / 235488499345 -
        19767620828671 * bs * bu ^ 3 / 1412930996070 - 39230541141441 * bs ^ 2 * bw ^ 2
        / 470976998690 - 4139678194145 * bs ^ 2 * bv * bw / 141293099607 -
        35186528846547 * bs ^ 2 * bv ^ 2 / 470976998690 + 36010417695739 * bs ^ 2 * bu *
        bw / 470976998690 - 83341949259683 * bs ^ 2 * bu * bv / 1412930996070 +
        82661463905054 * bs ^ 2 * bu ^ 2 / 706465498035 + 19738299178949 * bs ^ 3 * bw /
        1412930996070 + 202943707830503 * bs ^ 3 * bv / 1412930996070 - 32355556780399 *
        bs ^ 3 * bu / 470976998690 - 153149355138979 * br * bv ^ 2 * bw / 1412930996070
        + 360341641035011 * br * bv ^ 3 / 1412930996070 - 907428973657 * br * bu * bw ^
        2 / 94195399738 + 20016406540939 * br * bu * bv * bw / 282586199214 -
        17196057474271 * br * bu * bv ^ 2 / 25689654474 + 12074841135266 * br * bu ^ 2 *
        bw / 706465498035 - 238019963935591 * br * bu ^ 2 * bv / 706465498035 -
        1224035363293 * br * bu ^ 3 / 282586199214 + 3095255795179 * br * bs * bw ^ 2 /
        706465498035 + 35052146310719 * br * bs * bv * bw / 235488499345 -
        161268798934382 * br * bs * bv ^ 2 / 235488499345 + 920097891494 * br * bs * bu
        * bw / 141293099607 + 612827058673054 * br * bs * bu * bv / 706465498035 +
        194967468897809 * br * bs * bu ^ 2 / 1412930996070 - 7508610630783 * br * bs ^ 2
        * bw / 47097699869 + 820141493143087 * br * bs ^ 2 * bv / 1412930996070 -
        29253162618155 * br * bs ^ 2 * bu / 94195399738 - 254402451189787 * br * bs ^ 3
        / 1412930996070 + 907428973657 * br ^ 2 * bw ^ 2 / 94195399738 + 121340572616683
        * br ^ 2 * bv * bw / 1412930996070 - 26012389020152 * br ^ 2 * bv ^ 2 /
        141293099607 + 1673733697 * br ^ 2 * bu * bw / 706465498035 + 253433555078953 *
        br ^ 2 * bu * bv / 470976998690 - 15651263892773 * br ^ 2 * bu ^ 2 /
        1412930996070 - 5098337152881 * br ^ 2 * bs * bw / 235488499345 +
        104099269679857 * br ^ 2 * bs * bv / 706465498035 - 5966276550295 * br ^ 2 * bs
        * bu / 47097699869 - 9029900308193 * br ^ 2 * bs ^ 2 / 282586199214 +
        6278974030997 * br ^ 3 * bv / 235488499345 + 1412187166052 * br ^ 3 * bu /
        706465498035 - 56540370564551 * bv * bw ^ 2 / 706465498035 - 809379494069 * bv ^
        2 * bw / 1412930996070 + 252926873583 * bv ^ 3 / 1946185945 + 21383322134 * bu *
        bw ^ 2 / 5838557835 - 3739613836219 * bu * bv * bw / 235488499345 +
        153496613670827 * bu * bv ^ 2 / 1412930996070 + 93395615575777 * bu ^ 2 * bw /
        1412930996070 - 293746452353953 * bu ^ 2 * bv / 1412930996070 + 1062406464851 *
        bu ^ 3 / 141293099607 + 15246484778647 * bs * bw ^ 2 / 1412930996070 +
        54789569200087 * bs * bv * bw / 1412930996070 - 141457984114167 * bs * bv ^ 2 /
        235488499345 - 10798588094683 * bs * bu * bw / 128448272370 + 19819740725731 *
        bs * bu * bv / 21408045395 - 175280205882292 * bs * bu ^ 2 / 235488499345 +
        39293888988536 * bs ^ 2 * bw / 706465498035 + 71471142976885 * bs ^ 2 * bv /
        141293099607 + 899249412589723 * bs ^ 2 * bu / 1412930996070 - 976678794851843 *
        bs ^ 3 / 1412930996070 - 267342563015197 * br * bv * bw / 1412930996070 -
        58938190117643 * br * bv ^ 2 / 282586199214 - 3481428076231 * br * bu * bw /
        141293099607 + 154632220716047 * br * bu * bv / 1412930996070 + 307473423706651
        * br * bu ^ 2 / 1412930996070 + 9621347450417 * br * bs * bw / 141293099607 +
        86688528263807 * br * bs * bv / 1412930996070 - 235705323759014 * br * bs * bu /
        706465498035 - 31536101766944 * br * bs ^ 2 / 141293099607 + 2391231272777 * br
        ^ 2 * bw / 1412930996070 + 186084824896119 * br ^ 2 * bv / 470976998690 -
        161499510019453 * br ^ 2 * bu / 706465498035 + 7293678519827 * br ^ 2 * bs /
        706465498035 - 693169387083 * bw ^ 2 / 470976998690 + 34936167566567 * bv * bw /
        706465498035 + 1057369994473 * bv ^ 2 / 64224136185 - 3697296455773 * bu * bw /
        470976998690 + 230905819878572 * bu * bv / 706465498035 - 3177437502881 * bu ^ 2
        / 141293099607 + 736825196449 * bs * bw / 47097699869 + 58104239564603 * bs * bv
        / 1412930996070 - 277955941080707 * bs * bu / 470976998690 + 15941880397771 * bs
        ^ 2 / 282586199214 + 8117947982659 * br * bw / 706465498035 - 348353770748341 *
        br * bv / 706465498035 - 49360543520449 * br * bu / 235488499345 +
        25410303170543 * br * bs / 282586199214 - 1738535201627 * br ^ 2 / 470976998690
        - 6907993813021 * bw / 1412930996070 + 403329367647149 * bv / 1412930996070 +
        354265420651993 * bu / 1412930996070 - 141638872892369 * bs / 1412930996070 +
        56069937180786 * br / 235488499345 - 22174463231727 / 94195399738) * p2 +
        (15652138763539 * bu ^ 2 * bv * bw ^ 3 / 1412930996070 + 17065069759609 * bu ^ 2
        * bv ^ 2 * bw ^ 2 / 1412930996070 - 11413345775329 * bu ^ 2 * bv ^ 3 * bw /
        1412930996070 + 14156387804069 * bu ^ 3 * bw ^ 3 / 1412930996070 - 1164333413825
        * bu ^ 3 * bv * bw ^ 2 / 94195399738 - 73729677032927 * bu ^ 3 * bv ^ 2 * bw /
        1412930996070 + bu ^ 3 * bv ^ 3 - 543635138866 * bu ^ 4 * bw ^ 2 / 141293099607
        + 126970257240883 * bu ^ 4 * bv * bw / 1412930996070 - 4077468918823 * bu ^ 5 *
        bw / 282586199214 + 39945351226201 * bs * bu ^ 2 * bv * bw ^ 2 / 1412930996070 -
        47166530754961 * bs * bu ^ 2 * bv ^ 2 * bw / 1412930996070 + 4707461882782 * bs
        * bu ^ 2 * bv ^ 3 / 706465498035 - 36653890135169 * bs * bu ^ 3 * bw ^ 2 /
        1412930996070 + 13279455578564 * bs * bu ^ 3 * bv * bw / 235488499345 -
        44215091146739 * bs * bu ^ 4 * bw / 706465498035 - 16545122902049 * bs * bu ^ 4
        * bv / 1412930996070 + 4077468918823 * bs * bu ^ 5 / 282586199214 +
        6120392878852 * bs ^ 2 * bu ^ 2 * bv * bw / 706465498035 - 5413927380817 * bs ^
        2 * bu ^ 2 * bv ^ 2 / 706465498035 - 12240785757704 * bs ^ 2 * bu ^ 3 * bw /
        706465498035 + 16545122902049 * bs ^ 2 * bu ^ 3 * bv / 1412930996070 -
        31294221266531 * bs ^ 2 * bu ^ 4 / 1412930996070 + 1817812778736 * bs ^ 3 * bu ^
        3 / 235488499345 - 14239207767469 * br * bu ^ 2 * bv * bw ^ 2 / 1412930996070 +
        14239207767469 * br * bu ^ 2 * bv ^ 2 * bw / 1412930996070 + 184209264441 * br *
        bu ^ 3 * bw ^ 2 / 21408045395 - 98577082861 * br * bu ^ 3 * bv * bw /
        21408045395 - br * bu ^ 3 * bv ^ 2 - 4 * br * bu ^ 4 * bw + br * bu ^ 4 * bv -
        6120392878852 * br * bs * bu ^ 2 * bv * bw / 706465498035 - 411437794181 * br *
        bs * bu ^ 2 * bv ^ 2 / 706465498035 + 3136781280466 * br * bs * bu ^ 3 * bv /
        706465498035 - br * bs * bu ^ 4 + 6120392878852 * br * bs ^ 2 * bu ^ 2 * bw /
        706465498035 - 545068697257 * br * bs ^ 2 * bu ^ 2 * bv / 141293099607 -
        2430315782431 * br * bs ^ 2 * bu ^ 3 / 706465498035 + 3136781280466 * br * bs ^
        3 * bu ^ 2 / 706465498035 - 4610882295221 * bv * bw ^ 4 / 1412930996070 +
        5693242218832 * bv ^ 2 * bw ^ 3 / 706465498035 + 31484719865078 * bv ^ 3 * bw ^
        2 / 235488499345 - 35793548441889 * bv ^ 4 * bw / 470976998690 + bv ^ 5 -
        3095255795179 * bu * bw ^ 4 / 1412930996070 - 184832992683073 * bu * bv * bw ^ 3
        / 1412930996070 - 17455872195959 * bu * bv ^ 2 * bw ^ 2 / 706465498035 +
        83694093343279 * bu * bv ^ 3 * bw / 470976998690 - 4 * bu * bv ^ 4 -
        102219775232 * bu ^ 2 * bw ^ 3 / 141293099607 + 277998730042467 * bu ^ 2 * bv *
        bw ^ 2 / 470976998690 - 91118183325142 * bu ^ 2 * bv ^ 2 * bw / 235488499345 -
        8683913356321 * bu ^ 2 * bv ^ 3 / 706465498035 + 15169830195721 * bu ^ 3 * bw ^
        2 / 235488499345 - 46330248606168 * bu ^ 3 * bv * bw / 47097699869 +
        84474557489963 * bu ^ 3 * bv ^ 2 / 1412930996070 + 255714624601459 * bu ^ 4 * bw
        / 706465498035 - 55212567169417 * bu ^ 4 * bv / 706465498035 + 2381019072089 *
        bs * bv ^ 2 * bw ^ 2 / 282586199214 + 198095998997 * bs * bv ^ 3 * bw /
        235488499345 - 11680740358357 * bs * bv ^ 4 / 1412930996070 - 116498205806831 *
        bs * bu * bw ^ 3 / 1412930996070 + 8270586160901 * bs * bu * bv * bw ^ 2 /
        47097699869 + 86880270568939 * bs * bu * bv ^ 2 * bw / 470976998690 -
        204659081457917 * bs * bu * bv ^ 3 / 1412930996070 - 93124661680865 * bs * bu ^
        2 * bw ^ 2 / 94195399738 + 296966968913697 * bs * bu ^ 2 * bv * bw /
        470976998690 + 230426937425411 * bs * bu ^ 2 * bv ^ 2 / 1412930996070 +
        61260871281447 * bs * bu ^ 3 * bw / 94195399738 + 11757744433759 * bs * bu ^ 3 *
        bv / 1412930996070 - 256421090099494 * bs * bu ^ 4 / 706465498035 -
        1177880689043 * bs ^ 2 * bv ^ 2 * bw / 1412930996070 + 70701911292671 * bs ^ 2 *
        bv ^ 3 / 706465498035 - 14803218313798 * bs ^ 2 * bu * bw ^ 2 / 235488499345 -
        8059874422850 * bs ^ 2 * bu * bv * bw / 141293099607 - 246794171361841 * bs ^ 2
        * bu * bv ^ 2 / 1412930996070 + 118573187289904 * bs ^ 2 * bu ^ 2 * bw /
        706465498035 - 18510846670091 * bs ^ 2 * bu ^ 2 * bv / 235488499345 +
        199319311208729 * bs ^ 2 * bu ^ 3 / 235488499345 + 18369453872221 * bs ^ 3 * bv
        * bw / 1412930996070 - 18369453872221 * bs ^ 3 * bv ^ 2 / 1412930996070 -
        2381019072089 * bs ^ 3 * bu * bw / 282586199214 + 7963350666420 * bs ^ 3 * bu *
        bv / 47097699869 - 641960587754147 * bs ^ 3 * bu ^ 2 / 1412930996070 -
        1924820902769 * bs ^ 4 * bu / 94195399738 - 907428973657 * br * bw ^ 4 /
        94195399738 + 33420242663189 * br * bv * bw ^ 3 / 706465498035 - 133743371139661
        * br * bv ^ 2 * bw ^ 2 / 1412930996070 + 9321265215841 * br * bv ^ 3 * bw /
        706465498035 - br * bv ^ 4 + 20428186335283 * br * bu * bw ^ 3 / 706465498035 -
        32173816272063 * br * bu * bv * bw ^ 2 / 470976998690 - 1536392377303 * br * bu
        * bv ^ 2 * bw / 128448272370 + 4 * br * bu * bv ^ 3 - 18264463147241 * br * bu ^
        2 * bw ^ 2 / 470976998690 + 518752754020769 * br * bu ^ 2 * bv * bw /
        1412930996070 + 6947909346417 * br * bu ^ 2 * bv ^ 2 / 470976998690 -
        15445041821414 * br * bu ^ 3 * bw / 64224136185 - 27788046079 * br * bu ^ 3 * bv
        / 4281609079 + 6229508957107 * br * bs * bw ^ 3 / 470976998690 + 12697762377352
        * br * bs * bv * bw ^ 2 / 706465498035 + 4139681631537 * br * bs * bv ^ 2 * bw /
        470976998690 - 56742413251124 * br * bs * bv ^ 3 / 706465498035 + 50371686720107
        * br * bs * bu * bw ^ 2 / 128448272370 - 16591198859005 * br * bs * bu * bv * bw
        / 47097699869 + 187050655450915 * br * bs * bu * bv ^ 2 / 282586199214 -
        407970026756 * br * bs * bu ^ 2 * bw / 3660442995 - 345309424116518 * br * bs *
        bu ^ 2 * bv / 706465498035 + 115346409016189 * br * bs * bu ^ 3 / 470976998690 -
        3872421364941 * br * bs ^ 2 * bv * bw / 470976998690 + 22374544591592 * br * bs
        ^ 2 * bv ^ 2 / 235488499345 - 36558017845681 * br * bs ^ 2 * bu * bw /
        706465498035 - 77633402326011 * br * bs ^ 2 * bu * bv / 470976998690 +
        537329036377 * br * bs ^ 2 * bu ^ 2 / 141293099607 + 2381019072089 * br * bs ^ 3
        * bw / 282586199214 - 4077740890198 * br * bs ^ 3 * bv / 141293099607 -
        191260318769152 * br * bs ^ 3 * bu / 706465498035 + 1924820902769 * br * bs ^ 4
        / 94195399738 - br ^ 2 * bv ^ 2 * bw + br ^ 2 * bv ^ 3 - 1412187166052 * br ^ 2
        * bu * bw ^ 2 / 706465498035 + 4944514656227 * br ^ 2 * bu * bv * bw /
        706465498035 - 4 * br ^ 2 * bu * bv ^ 2 + 2119841585041 * br ^ 2 * bu ^ 2 * bw /
        706465498035 - 6564516862216 * br ^ 2 * bu ^ 2 * bv / 706465498035 +
        16146943742884 * br ^ 2 * bs * bv * bw / 706465498035 + 12340772397159 * br ^ 2
        * bs * bv ^ 2 / 470976998690 + 2479715102011 * br ^ 2 * bs * bu * bw /
        235488499345 + 13384844282923 * br ^ 2 * bs * bu * bv / 1412930996070 +
        9146051294713 * br ^ 2 * bs * bu ^ 2 / 1412930996070 - 15440478244849 * br ^ 2 *
        bs ^ 2 * bw / 706465498035 - 12811749395849 * br ^ 2 * bs ^ 2 * bv /
        470976998690 - 9146051294713 * br ^ 2 * bs ^ 2 * bu / 1412930996070 +
        693169387083 * bw ^ 4 / 470976998690 + 25872674708854 * bv * bw ^ 3 /
        235488499345 + 57670716232562 * bv ^ 2 * bw ^ 2 / 706465498035 - 118642657985053
        * bv ^ 3 * bw / 470976998690 + 217830005656853 * bv ^ 4 / 1412930996070 -
        3357240274073 * bu * bw ^ 3 / 470976998690 + 18507442336829 * bu * bv * bw ^ 2 /
        470976998690 + 287950546639385 * bu * bv ^ 2 * bw / 282586199214 -
        904275897334859 * bu * bv ^ 3 / 1412930996070 - 239673364424017 * bu ^ 2 * bw ^
        2 / 1412930996070 + 100166081278213 * bu ^ 2 * bv * bw / 470976998690 +
        21183896176559 * bu ^ 2 * bv ^ 2 / 282586199214 + 601163494601843 * bu ^ 3 * bw
        / 1412930996070 + 1611930858193937 * bu ^ 3 * bv / 1412930996070 +
        11090363045062 * bs * bw ^ 3 / 141293099607 - 255677375607877 * bs * bv * bw ^ 2
        / 706465498035 + 196694612323577 * bs * bv ^ 2 * bw / 470976998690 -
        362305515766861 * bs * bv ^ 3 / 1412930996070 + 122055771604307 * bs * bu * bw ^
        2 / 706465498035 - 1176204174782177 * bs * bu * bv * bw / 706465498035 +
        851668151735947 * bs * bu * bv ^ 2 / 1412930996070 - 239332763414081 * bs * bu ^
        2 * bw / 1412930996070 - 2070342960333 * bs * bu ^ 2 * bv / 778474378 -
        22784906476621 * bs * bu ^ 3 / 42816090790 + 39230541141441 * bs ^ 2 * bw ^ 2 /
        470976998690 + 46874291302295 * bs ^ 2 * bv * bw / 282586199214 - 81475199517313
        * bs ^ 2 * bv ^ 2 / 235488499345 - 47952909726731 * bs ^ 2 * bu * bw /
        141293099607 + 2419646829173699 * bs ^ 2 * bu * bv / 1412930996070 +
        13817522972364 * bs ^ 2 * bu ^ 2 / 21408045395 - 3916601909252 * bs ^ 3 * bw /
        706465498035 - 81240372244161 * bs ^ 3 * bv / 470976998690 - 466197252493 * bs ^
        3 * bu / 1220147665 + 1924820902769 * bs ^ 4 / 94195399738 - 2391231272777 * br
        * bw ^ 3 / 1412930996070 + 33827831890474 * br * bv * bw ^ 2 / 706465498035 -
        99280275034439 * br * bv ^ 2 * bw / 470976998690 - 4671214197071 * br * bv ^ 3 /
        25689654474 + 53032871742343 * br * bu * bw ^ 2 / 235488499345 - 2184645173884 *
        br * bu * bv * bw / 21408045395 + 90645171999253 * br * bu * bv ^ 2 /
        141293099607 + 23088819667231 * br * bu ^ 2 * bw / 235488499345 + 78231402855002
        * br * bu ^ 2 * bv / 706465498035 - 585024089574173 * br * bs * bw ^ 2 /
        1412930996070 + 442022084777069 * br * bs * bv * bw / 1412930996070 +
        412107031164808 * br * bs * bv ^ 2 / 706465498035 + 16285151496103 * br * bs *
        bu * bw / 1412930996070 - 430534569290917 * br * bs * bu * bv / 706465498035 -
        133315705558063 * br * bs * bu ^ 2 / 1412930996070 + 169646167590953 * br * bs ^
        2 * bw / 1412930996070 - 429288370665317 * br * bs ^ 2 * bv / 706465498035 +
        278943257674793 * br * bs ^ 2 * bu / 470976998690 + 254402451189787 * br * bs ^
        3 / 1412930996070 - 40637748578962 * br ^ 2 * bv * bw / 706465498035 +
        4645524542597 * br ^ 2 * bv ^ 2 / 25689654474 - 2119841585041 * br ^ 2 * bu * bw
        / 706465498035 - 907101759326999 * br ^ 2 * bu * bv / 1412930996070 +
        184209264441 * br ^ 2 * bu ^ 2 / 21408045395 - 2971328778346 * br ^ 2 * bs * bw
        / 706465498035 - 16793591149361 * br ^ 2 * bs * bv / 94195399738 - 6578946931643
        * br ^ 2 * bs * bu / 282586199214 + 20384055806199 * br ^ 2 * bs ^ 2 /
        470976998690 - 6278974030997 * br ^ 3 * bv / 235488499345 - 18406596862901 * bw
        ^ 3 / 706465498035 - 35161210544189 * bv * bw ^ 2 / 42816090790 +
        886355491601677 * bv ^ 2 * bw / 1412930996070 - 319065033307913 * bv ^ 3 /
        1412930996070 - 3533145135569 * bu * bw ^ 2 / 141293099607 - 1577871929444497 *
        bu * bv * bw / 1412930996070 - 76011801447094 * bu * bv ^ 2 / 706465498035 -
        166840110983083 * bu ^ 2 * bw / 470976998690 - 139841387100737 * bu ^ 2 * bv /
        235488499345 + 447802313713323 * bs * bw ^ 2 / 470976998690 - 303050463889199 *
        bs * bv * bw / 1412930996070 + 87072751816019 * bs * bv ^ 2 / 282586199214 +
        217865110693418 * bs * bu * bw / 706465498035 + 1614937705924193 * bs * bu * bv
        / 1412930996070 + 621005326696951 * bs * bu ^ 2 / 706465498035 - 20566903622 *
        bs ^ 2 * bw / 3660442995 - 1158505624986307 * bs ^ 2 * bv / 1412930996070 -
        363327712712557 * bs ^ 2 * bu / 235488499345 + 41036041534721 * bs ^ 3 /
        47097699869 - 63664797801533 * br * bw ^ 2 / 282586199214 + 212103220215413 * br
        * bv * bw / 706465498035 + 4473211514498 * br * bv ^ 2 / 64224136185 -
        9514490025779 * br * bu * bw / 1412930996070 + 733154676072857 * br * bu * bv /
        1412930996070 - 184209264441 * br * bu ^ 2 / 21408045395 + 3105824246447 * br *
        bs * bw / 235488499345 - 13715720100739 * br * bs * bv / 64224136185 +
        92801482800857 * br * bs * bu / 706465498035 + 159943428334579 * br * bs ^ 2 /
        706465498035 + 17558646096193 * br ^ 2 * bw / 706465498035 - 278566814789827 *
        br ^ 2 * bv / 1412930996070 + 13106312012732 * br ^ 2 * bu / 706465498035 +
        167636913654097 * br ^ 2 * bs / 1412930996070 - 1412187166052 * br ^ 3 /
        706465498035 + 112413513437003 * bw ^ 2 / 470976998690 - 470618008282459 * bv *
        bw / 1412930996070 + 20156338075893 * bv ^ 2 / 94195399738 + 26878840367648 * bu
        * bw / 47097699869 - 220819133750227 * bu * bv / 470976998690 - 70054421744 * bs
        * bw / 21408045395 + 469205077286389 * bs * bv / 1412930996070 + 219277936471859
        * bs * bu / 470976998690 - 92916297090257 * bs ^ 2 / 282586199214 -
        3324391589065 * br * bw / 94195399738 + 8359981084759 * br * bv / 706465498035 -
        13106312012732 * br * bu / 706465498035 - 167636913654097 * br * bs /
        1412930996070 + 305169445470499 * br ^ 2 / 1412930996070 - 20156338075893 * br /
        94195399738) * p5 + (-2 * bu ^ 4 * bv ^ 2 * bw ^ 2 + 2 * bu ^ 4 * bv ^ 3 * bw +
        bs * bu ^ 4 * bv * bw ^ 2 - bs * bu ^ 4 * bv ^ 2 * bw + 3 * br * bu ^ 4 * bv *
        bw ^ 2 - 4 * br * bu ^ 4 * bv ^ 2 * bw - 2 * br * bs * bu ^ 4 * bw ^ 2 + 2 * br
        * bs * bu ^ 4 * bv * bw - br ^ 2 * bu ^ 4 * bw ^ 2 + br ^ 2 * bu ^ 4 * bv * bw -
        bu * bv ^ 5 * bw + 8500179931588 * bu ^ 2 * bv ^ 2 * bw ^ 3 / 706465498035 -
        4000859068626 * bu ^ 2 * bv ^ 3 * bw ^ 2 / 235488499345 + 841772554465 * bu ^ 2
        * bv ^ 4 * bw / 141293099607 - 7824791768132 * bu ^ 3 * bv * bw ^ 3 /
        706465498035 + 260844217352 * bu ^ 3 * bv ^ 2 * bw ^ 2 / 12844827237 +
        1362113932411 * bu ^ 3 * bv ^ 3 * bw / 706465498035 + 2 * bu ^ 4 * bv ^ 2 * bw -
        8590219616674 * bs * bu ^ 2 * bv ^ 3 * bw / 706465498035 + 1865428944136 * bs *
        bu ^ 3 * bv * bw ^ 2 / 47097699869 - 1865428944136 * bs * bu ^ 3 * bv ^ 2 * bw /
        47097699869 - bs * bu ^ 4 * bv * bw - 14156387804069 * br * bu ^ 2 * bv * bw ^ 3
        / 1412930996070 + 17822768739389 * br * bu ^ 2 * bv ^ 2 * bw ^ 2 / 1412930996070
        + 15795784567709 * br * bu ^ 2 * bv ^ 3 * bw / 706465498035 - 5138996099329 * br
        * bu ^ 3 * bv * bw ^ 2 / 1412930996070 - 16770407950314 * br * bu ^ 3 * bv ^ 2 *
        bw / 235488499345 + br * bu ^ 3 * bv ^ 3 + br * bu ^ 4 * bw ^ 2 + 1929968591929
        * br * bu ^ 4 * bv * bw / 470976998690 - br * bu ^ 4 * bv ^ 2 - br * bu ^ 5 * bw
        + 22693981426121 * br * bs * bu ^ 2 * bv ^ 3 / 1412930996070 + 1107712805411 *
        br * bs * bu ^ 3 * bw ^ 2 / 706465498035 + 22831727522497 * br * bs * bu ^ 3 *
        bv * bw / 282586199214 - 8452037825167 * br * bs * bu ^ 3 * bv ^ 2 /
        706465498035 - 7177288620604 * br * bs * bu ^ 4 * bw / 706465498035 -
        1929968591929 * br * bs * bu ^ 4 * bv / 470976998690 + br * bs * bu ^ 5 +
        6120392878852 * br * bs ^ 2 * bu ^ 3 * bw / 706465498035 + 7883754118639 * br *
        bs ^ 2 * bu ^ 4 / 706465498035 - 8590219616674 * br * bs ^ 3 * bu ^ 3 /
        706465498035 + 7125452905207 * br ^ 2 * bu ^ 2 * bv ^ 2 * bw / 470976998690 - br
        ^ 2 * bu ^ 2 * bv ^ 3 + 12031333918649 * br ^ 2 * bu ^ 3 * bw ^ 2 /
        1412930996070 - 4195958207129 * br ^ 2 * bu ^ 3 * bv * bw / 47097699869 +
        4360055118037 * br ^ 2 * bu ^ 4 * bw / 282586199214 + br ^ 2 * bu ^ 4 * bv -
        6055572313321 * br ^ 2 * bs * bu ^ 2 * bv ^ 2 / 282586199214 + 41078309866273 *
        br ^ 2 * bs * bu ^ 3 * bw / 706465498035 + 6055572313321 * br ^ 2 * bs * bu ^ 3
        * bv / 282586199214 - 4360055118037 * br ^ 2 * bs * bu ^ 4 / 282586199214 +
        4360055118037 * br ^ 2 * bs ^ 2 * bu ^ 3 / 282586199214 - 18130718374243 * br ^
        3 * bu ^ 2 * bw ^ 2 / 1412930996070 + 12478994389963 * br ^ 3 * bu ^ 2 * bv * bw
        / 1412930996070 + br ^ 3 * bu ^ 2 * bv ^ 2 + 4 * br ^ 3 * bu ^ 3 * bw - br ^ 3 *
        bu ^ 3 * bv + br ^ 3 * bs * bu ^ 3 - br ^ 3 * bs ^ 2 * bu ^ 2 + 39230541141441 *
        bv ^ 2 * bw ^ 4 / 470976998690 - 59676553919887 * bv ^ 3 * bw ^ 3 / 706465498035
        + 5638644532457 * bv ^ 4 * bw ^ 2 / 128448272370 + 5815256275249 * bv ^ 5 * bw /
        128448272370 + 34281885132301 * bu * bv ^ 2 * bw ^ 3 / 470976998690 +
        6215572414851 * bu * bv ^ 3 * bw ^ 2 / 235488499345 - 43909010744191 * bu * bv ^
        4 * bw / 706465498035 + 23901236160553 * bu ^ 2 * bv * bw ^ 3 / 706465498035 -
        899759819362553 * bu ^ 2 * bv ^ 2 * bw ^ 2 / 706465498035 + 180035738972917 * bu
        ^ 2 * bv ^ 3 * bw / 282586199214 - 26932774414331 * bu ^ 2 * bv ^ 4 /
        1412930996070 + 7824791768132 * bu ^ 3 * bv * bw ^ 2 / 706465498035 +
        17895628048818 * bu ^ 3 * bv ^ 2 * bw / 235488499345 + 13159499707949 * bu ^ 3 *
        bv ^ 3 / 706465498035 + 55212567169417 * bu ^ 4 * bv ^ 2 / 706465498035 -
        19812311109062 * bs * bv ^ 4 * bw / 141293099607 - 2304526802098 * bs * bu * bv
        * bw ^ 3 / 47097699869 + 110731581052451 * bs * bu * bv ^ 3 * bw / 141293099607
        + 2 * bs * bu * bv ^ 4 - 1360428260761 * bs * bu ^ 2 * bw ^ 3 / 470976998690 +
        72037550065391 * bs * bu ^ 2 * bv * bw ^ 2 / 141293099607 - 422559021992354 * bs
        * bu ^ 2 * bv ^ 2 * bw / 706465498035 - 21281050430051 * bs * bu ^ 2 * bv ^ 3 /
        1412930996070 - 1865428944136 * bs * bu ^ 3 * bv * bw / 47097699869 -
        78660820194549 * bs * bu ^ 3 * bv ^ 2 / 470976998690 + bs * bu ^ 4 * bv +
        122731464252673 * bs ^ 2 * bu ^ 2 * bv ^ 2 / 1412930996070 - 39230541141441 * br
        * bv * bw ^ 4 / 470976998690 + 2488880307902 * br * bv ^ 2 * bw ^ 3 /
        47097699869 - 55488853497916 * br * bv ^ 3 * bw ^ 2 / 235488499345 -
        40782097809833 * br * bv ^ 4 * bw / 1412930996070 - 112304727342809 * br * bu *
        bv * bw ^ 3 / 1412930996070 - 2825978469041 * br * bu * bv ^ 2 * bw ^ 2 /
        12844827237 - 10380530215189 * br * bu * bv ^ 3 * bw / 141293099607 + 3 * br *
        bu * bv ^ 4 + 19268685877179 * br * bu ^ 2 * bw ^ 3 / 235488499345 +
        335847113165803 * br * bu ^ 2 * bv * bw ^ 2 / 282586199214 + 6882967555885 * br
        * bu ^ 2 * bv ^ 2 * bw / 12844827237 + 42664930924013 * br * bu ^ 2 * bv ^ 3 /
        1412930996070 - 2138195224639 * br * bu ^ 3 * bw ^ 2 / 94195399738 -
        1036683196302 * br * bu ^ 3 * bv * bw / 47097699869 - 15359843329502 * br * bu ^
        3 * bv ^ 2 / 706465498035 + 4449979648949 * br * bu ^ 4 * bw / 94195399738 -
        55212567169417 * br * bu ^ 4 * bv / 706465498035 + 676271796182687 * br * bs *
        bv ^ 3 * bw / 1412930996070 - 714091615020967 * br * bs * bv ^ 4 / 1412930996070
        + 1455026916953 * br * bs * bu * bw ^ 3 / 282586199214 - 722350479623169 * br *
        bs * bu * bv ^ 2 * bw / 470976998690 + 62335450853586 * br * bs * bu * bv ^ 3 /
        235488499345 - 1761135749213069 * br * bs * bu ^ 2 * bw ^ 2 / 1412930996070 +
        892753376012 * br * bs * bu ^ 2 * bv * bw / 64224136185 + 23490140873068 * br *
        bs * bu ^ 2 * bv ^ 2 / 141293099607 + 903916610173499 * br * bs * bu ^ 3 * bw /
        1412930996070 + 105207270196279 * br * bs * bu ^ 3 * bv / 706465498035 +
        325922699309 * br * bs * bu ^ 4 / 11677115670 - 58087493899329 * br * bs ^ 2 *
        bu ^ 2 * bw / 470976998690 - 174239915801998 * br * bs ^ 2 * bu ^ 3 /
        235488499345 + 1024481225292451 * br * bs ^ 3 * bu ^ 2 / 1412930996070 +
        693169387083 * br ^ 2 * bw ^ 4 / 470976998690 - 6034279352 * br ^ 2 * bv ^ 3 *
        bw / 64224136185 - br ^ 2 * bv ^ 4 + 21261537964459 * br ^ 2 * bu * bv ^ 2 * bw
        / 64224136185 + 6301763318749 * br ^ 2 * bu * bv ^ 3 / 1412930996070 -
        91252624114643 * br ^ 2 * bu ^ 2 * bw ^ 2 / 1412930996070 + 313859963334803 * br
        ^ 2 * bu ^ 2 * bv * bw / 470976998690 - 11922046994908 * br ^ 2 * bu ^ 2 * bv ^
        2 / 141293099607 - 620228729613953 * br ^ 2 * bu ^ 3 * bw / 1412930996070 +
        225619378487801 * br ^ 2 * bu ^ 3 * bv / 1412930996070 + 297062777917733 * br ^
        2 * bs * bv ^ 3 / 1412930996070 + 24408821003771 * br ^ 2 * bs * bu * bv ^ 2 /
        235488499345 - 232021326961598 * br ^ 2 * bs * bu ^ 2 * bw / 706465498035 -
        460695945130429 * br ^ 2 * bs * bu ^ 2 * bv / 1412930996070 + 513251295843911 *
        br ^ 2 * bs * bu ^ 3 / 1412930996070 - 315307162868057 * br ^ 2 * bs ^ 2 * bu ^
        2 / 706465498035 + 22837003271321 * br ^ 3 * bv ^ 2 * bw / 470976998690 + br ^ 3
        * bv ^ 3 + 668508822516 * br ^ 3 * bu * bw ^ 2 / 47097699869 - 17072643176471 *
        br ^ 3 * bu * bv * bw / 47097699869 - 4888832322679 * br ^ 3 * bu * bv ^ 2 /
        706465498035 + 368983291786429 * br ^ 3 * bu ^ 2 * bw / 1412930996070 +
        3526646517065 * br ^ 3 * bu ^ 2 * bv / 282586199214 - 184209264441 * br ^ 3 * bu
        ^ 3 / 21408045395 - 166979679945517 * br ^ 3 * bs * bv ^ 2 / 706465498035 +
        10195753180 * br ^ 3 * bs * bu * bw / 106155597 + 275116128164519 * br ^ 3 * bs
        * bu * bv / 1412930996070 - 36637133099296 * br ^ 3 * bs * bu ^ 2 / 141293099607
        + 436529235009283 * br ^ 3 * bs ^ 2 * bu / 1412930996070 - br ^ 4 * bv ^ 2 -
        2119841585041 * br ^ 4 * bu * bw / 706465498035 + 7714694314819 * br ^ 4 * bu *
        bv / 1412930996070 + 184209264441 * br ^ 4 * bu ^ 2 / 21408045395 -
        3421669099391 * br ^ 4 * bs * bw / 235488499345 - 6120392878852 * br ^ 4 * bs *
        bu / 706465498035 - 34809394316423 * bv ^ 2 * bw ^ 3 / 282586199214 +
        1255960551997691 * bv ^ 3 * bw ^ 2 / 1412930996070 - 1415697341091553 * bv ^ 4 *
        bw / 1412930996070 + 712678684024897 * bv ^ 5 / 1412930996070 - 919172262321113
        * bu * bv ^ 2 * bw ^ 2 / 1412930996070 - 2886098616239083 * bu * bv ^ 3 * bw /
        1412930996070 - 127431230538417 * bu * bv ^ 4 / 470976998690 - 23901236160553 *
        bu ^ 2 * bv * bw ^ 2 / 706465498035 - 21643841203363 * bu ^ 2 * bv ^ 2 * bw /
        470976998690 - 859419275093 * bu ^ 2 * bv ^ 3 / 1220147665 - 7824791768132 * bu
        ^ 3 * bv * bw / 706465498035 - 1611930858193937 * bu ^ 3 * bv ^ 2 /
        1412930996070 - 70054421744 * bs * bv * bw ^ 3 / 21408045395 + 818021072554111 *
        bs * bv ^ 3 * bw / 1412930996070 + 10717349340474 * bs * bv ^ 4 / 21408045395 -
        122100969188566 * bs * bu * bv * bw ^ 2 / 235488499345 + 3245427525631169 * bs *
        bu * bv ^ 2 * bw / 1412930996070 + 165707125537274 * bs * bu * bv ^ 3 /
        235488499345 + 1360428260761 * bs * bu ^ 2 * bw ^ 2 / 470976998690 -
        716294215871627 * bs * bu ^ 2 * bv * bw / 1412930996070 + 3020010300749731 * bs
        * bu ^ 2 * bv ^ 2 / 1412930996070 + 1865428944136 * bs * bu ^ 3 * bv /
        47097699869 - 703638473970521 * bs ^ 2 * bu * bv ^ 2 / 706465498035 -
        693169387083 * br * bw ^ 4 / 470976998690 + 166973748755197 * br * bv * bw ^ 3 /
        1412930996070 - 919756495257229 * br * bv ^ 2 * bw ^ 2 / 1412930996070 +
        1280321465017847 * br * bv ^ 3 * bw / 706465498035 - 167158258984492 * br * bv ^
        4 / 235488499345 + 7824791768132 * br * bu * bw ^ 3 / 706465498035 +
        719892445159556 * br * bu * bv * bw ^ 2 / 706465498035 + 1802755843757069 * br *
        bu * bv ^ 2 * bw / 706465498035 + 15740402083629 * br * bu * bv ^ 3 /
        42816090790 + 22693588439336 * br * bu ^ 2 * bw ^ 2 / 706465498035 +
        167093544588331 * br * bu ^ 2 * bv * bw / 470976998690 + 464574718993028 * br *
        bu ^ 2 * bv ^ 2 / 706465498035 - 192672601636797 * br * bu ^ 3 * bw /
        235488499345 + 231785361158207 * br * bu ^ 3 * bv / 235488499345 -
        30410804993411 * br * bs * bw ^ 3 / 1412930996070 - 2791313169913603 * br * bs *
        bv ^ 2 * bw / 1412930996070 - 1974578889610841 * br * bs * bv ^ 3 /
        1412930996070 + 359286646157279 * br * bs * bu * bw ^ 2 / 1412930996070 -
        254487380408527 * br * bs * bu * bv * bw / 94195399738 + 214551047923969 * br *
        bs * bu * bv ^ 2 / 141293099607 + 2408045584006057 * br * bs * bu ^ 2 * bw /
        1412930996070 - 1762393917988273 * br * bs * bu ^ 2 * bv / 706465498035 -
        12778552620912 * br * bs * bu ^ 3 / 47097699869 + 242389880381139 * br * bs ^ 2
        * bu * bw / 470976998690 + 22258773606761 * br * bs ^ 2 * bu ^ 2 / 235488499345
        - 3512083351239 * br * bs ^ 3 * bw / 470976998690 + 29110285368829 * br * bs ^ 3
        * bu / 470976998690 - 1924820902769 * br * bs ^ 4 / 94195399738 - 10288648880242
        * br ^ 2 * bw ^ 3 / 706465498035 - 206827077591766 * br ^ 2 * bv ^ 2 * bw /
        235488499345 + 413171845765533 * br ^ 2 * bv ^ 3 / 470976998690 - 16524945880149
        * br ^ 2 * bu * bw ^ 2 / 235488499345 - 51083644309893 * br ^ 2 * bu * bv * bw /
        42816090790 - 10099538287747 * br ^ 2 * bu * bv ^ 2 / 21408045395 - 827714573216
        * br ^ 2 * bu ^ 2 * bw / 3660442995 - 68213285198709 * br ^ 2 * bu ^ 2 * bv /
        42816090790 + 184209264441 * br ^ 2 * bu ^ 3 / 21408045395 + 89226214905035 * br
        ^ 2 * bs * bv * bw / 282586199214 + 57477328344544 * br ^ 2 * bs * bv ^ 2 /
        47097699869 + 1038420871768547 * br ^ 2 * bs * bu * bw / 1412930996070 +
        1929429910054169 * br ^ 2 * bs * bu * bv / 1412930996070 + 171131848854475 * br
        ^ 2 * bs * bu ^ 2 / 141293099607 - 23399317383608 * br ^ 2 * bs ^ 2 * bu /
        21408045395 - 161769797306273 * br ^ 3 * bw ^ 2 / 706465498035 + 574576315041859
        * br ^ 3 * bv * bw / 1412930996070 - 88041382767956 * br ^ 3 * bv ^ 2 /
        235488499345 - 66664462146389 * br ^ 3 * bu * bw / 1412930996070 - 8470412680528
        * br ^ 3 * bu * bv / 235488499345 - 3837043547857 * br ^ 3 * bu ^ 2 /
        141293099607 - 442762975845683 * br ^ 3 * bs * bw / 1412930996070 -
        94621513622506 * br ^ 3 * bs * bv / 235488499345 + 11980890315646 * br ^ 3 * bs
        * bu / 706465498035 + 7277439006847 * br ^ 3 * bs ^ 2 / 470976998690 +
        17558646096193 * br ^ 4 * bw / 706465498035 + 239390357721751 * br ^ 4 * bv /
        1412930996070 + 14518499178784 * br ^ 4 * bu / 706465498035 + 16565842790341 *
        br ^ 4 * bs / 128448272370 - 1412187166052 * br ^ 5 / 706465498035 -
        1360428260761 * bv * bw ^ 3 / 470976998690 + 118077143090305 * bv ^ 2 * bw ^ 2 /
        282586199214 - 929471565453751 * bv ^ 3 * bw / 706465498035 + 53780884437004 *
        bv ^ 4 / 47097699869 - 1360428260761 * bu * bv * bw ^ 2 / 470976998690 +
        365621066537653 * bu * bv ^ 2 * bw / 706465498035 - 1270328295733349 * bu * bv ^
        3 / 470976998690 + 43721187538823 * bu ^ 2 * bv * bw / 1412930996070 +
        139841387100737 * bu ^ 2 * bv ^ 2 / 235488499345 + 2901625539129 * bs * bv * bw
        ^ 2 / 470976998690 - 86198517020299 * bs * bv ^ 2 * bw / 706465498035 +
        1927640803839329 * bs * bv ^ 3 / 1412930996070 + 123461397449327 * bs * bu * bv
        * bw / 235488499345 - 3785590561767829 * bs * bu * bv ^ 2 / 1412930996070 -
        1360428260761 * bs * bu ^ 2 * bw / 470976998690 + 716294215871627 * bs * bu ^ 2
        * bv / 1412930996070 - 1360428260761 * bs ^ 2 * bv * bw / 470976998690 +
        116446834738841 * bs ^ 2 * bv ^ 2 / 128448272370 - 6907993813021 * br * bw ^ 3 /
        1412930996070 - 36910061371454 * br * bv * bw ^ 2 / 64224136185 +
        262640020614307 * br * bv ^ 2 * bw / 235488499345 - 1450948476869042 * br * bv ^
        3 / 706465498035 + 28760549753239 * br * bu * bw ^ 2 / 706465498035 -
        26361347964277 * br * bu * bv * bw / 470976998690 + 4214078331833093 * br * bu *
        bv ^ 2 / 1412930996070 - 281212998346233 * br * bu ^ 2 * bw / 235488499345 +
        781951626189343 * br * bu ^ 2 * bv / 706465498035 + 306632513978339 * br * bs *
        bw ^ 2 / 282586199214 + 205925002959811 * br * bs * bv * bw / 1412930996070 -
        153192412846588 * br * bs * bv ^ 2 / 235488499345 - 12931534701169 * br * bs *
        bu * bw / 1412930996070 - 3258579989627627 * br * bs * bu * bv / 1412930996070 +
        109985890619504 * br * bs * bu ^ 2 / 706465498035 - 108940959372715 * br * bs ^
        2 * bw / 282586199214 + 1819749184049519 * br * bs ^ 2 * bu / 1412930996070 -
        484495337718463 * br * bs ^ 3 / 706465498035 + 4082788869065 * br ^ 2 * bw ^ 2 /
        8563218158 - 122117438685486 * br ^ 2 * bv * bw / 47097699869 + 2781834210733637
        * br ^ 2 * bv ^ 2 / 1412930996070 + 18846716262921 * br ^ 2 * bu * bw /
        47097699869 - 2241498560024941 * br ^ 2 * bu * bv / 706465498035 +
        13106312012732 * br ^ 2 * bu ^ 2 / 706465498035 + 2174700793008461 * br ^ 2 * bs
        * bw / 1412930996070 + 2052565046683273 * br ^ 2 * bs * bv / 1412930996070 +
        5620930834405 * br ^ 2 * bs * bu / 47097699869 - 5610562164608 * br ^ 2 * bs ^ 2
        / 21408045395 - 3324391589065 * br ^ 3 * bw / 94195399738 - 1925220710071 * br ^
        3 * bv / 2440295330 - 331382069495963 * br ^ 3 * bu / 1412930996070 +
        169490045156936 * br ^ 3 * bs / 706465498035 + 305169445470499 * br ^ 4 /
        1412930996070 - 26878840367648 * bv ^ 2 * bw / 47097699869 + 329480079292679 *
        bv ^ 3 / 470976998690 + 220819133750227 * bu * bv ^ 2 / 470976998690 -
        70054421744 * bs * bv * bw / 21408045395 - 349438867193191 * bs * bv ^ 2 /
        470976998690 - 133623603199056 * bs * bu * bv / 235488499345 - 22174463231727 *
        br * bw ^ 2 / 94195399738 + 2138844175066013 * br * bv * bw / 706465498035 -
        867288923662719 * br * bv ^ 2 / 470976998690 + 314275207902079 * br * bu * bw /
        1412930996070 + 1329740371373233 * br * bu * bv / 470976998690 -
        2361184730786671 * br * bs * bw / 1412930996070 - 768796194858848 * br * bs * bv
        / 706465498035 + 192665442726987 * br * bs * bu / 470976998690 + 14292068691799
        * br * bs ^ 2 / 21408045395 + 260705329080184 * br ^ 2 * bv / 235488499345 +
        20156338075893 * br ^ 2 * bu / 94195399738 - 114228584824397 * br ^ 2 * bs /
        94195399738 - 20156338075893 * br ^ 3 / 94195399738 - 329480079292679 * br * bv
        / 470976998690 + 18085414278097 * br * bs / 21408045395) * p7 + (2 * bu ^ 6 * bv
        ^ 2 - 2 * bs * bu ^ 5 * bv ^ 2 - bs * bu ^ 6 * bv + bs ^ 2 * bu ^ 5 * bv - 4 *
        br * bu ^ 6 * bv - br * bs * bu ^ 4 * bv ^ 2 + 5 * br * bs * bu ^ 5 * bv + 2 *
        br * bs * bu ^ 6 - 2 * br * bs ^ 2 * bu ^ 5 + br ^ 2 * bu ^ 6 - br ^ 2 * bs * bu
        ^ 5 - 6120392878852 * bu ^ 3 * bv ^ 3 * bw / 706465498035 - bu ^ 3 * bv ^ 4 -
        793262350912 * bu ^ 4 * bv ^ 2 * bw / 235488499345 + 700479454858 * bu ^ 4 * bv
        ^ 3 / 141293099607 + 7824791768132 * bu ^ 5 * bv * bw / 706465498035 +
        655648434376 * bu ^ 5 * bv ^ 2 / 706465498035 + 6120392878852 * bs * bu ^ 2 * bv
        ^ 3 * bw / 706465498035 + bs * bu ^ 2 * bv ^ 4 + 793262350912 * bs * bu ^ 3 * bv
        ^ 2 * bw / 235488499345 - 841772554465 * bs * bu ^ 3 * bv ^ 3 / 141293099607 -
        7824791768132 * bs * bu ^ 4 * bv * bw / 706465498035 - 1707880510603 * bs * bu ^
        4 * bv ^ 2 / 141293099607 - 1818331244267 * bs * bu ^ 5 * bv / 47097699869 +
        8590219616674 * bs ^ 2 * bu ^ 3 * bv ^ 2 / 706465498035 + 1818331244267 * bs ^ 2
        * bu ^ 4 * bv / 47097699869 - br * bu * bv ^ 4 * bw + 5 * br * bu ^ 2 * bv ^ 3 *
        bw + 15652138763539 * br * bu ^ 3 * bv ^ 2 * bw / 1412930996070 + 5413927380817
        * br * bu ^ 3 * bv ^ 3 / 706465498035 + 221902202829 * br * bu ^ 4 * bv * bw /
        94195399738 + 19936274391409 * br * bu ^ 4 * bv ^ 2 / 1412930996070 +
        74368221735 * br * bu ^ 5 * bv / 94195399738 + br * bu ^ 6 - 622632089363 * br *
        bs * bu ^ 2 * bv ^ 2 * bw / 282586199214 - 14531070616157 * br * bs * bu ^ 2 *
        bv ^ 3 / 1412930996070 - 28108297116863 * br * bs * bu ^ 3 * bv * bw /
        1412930996070 - 3677387665121 * br * bs * bu ^ 3 * bv ^ 2 / 235488499345 +
        6120392878852 * br * bs * bu ^ 4 * bw / 706465498035 + 6444174336377 * br * bs *
        bu ^ 4 * bv / 1412930996070 - 1463748059729 * br * bs * bu ^ 5 / 706465498035 +
        3136781280466 * br * bs ^ 2 * bu ^ 2 * bv ^ 2 / 706465498035 - 551779619563 * br
        * bs ^ 2 * bu ^ 4 / 64224136185 + br ^ 2 * bu * bv ^ 3 * bw + br ^ 2 * bu * bv ^
        4 - 5 * br ^ 2 * bu ^ 2 * bv ^ 2 * bw - 6 * br ^ 2 * bu ^ 2 * bv ^ 3 -
        682270601167 * br ^ 2 * bu ^ 3 * bv * bw / 282586199214 - 1764317632159 * br ^ 2
        * bu ^ 3 * bv ^ 2 / 235488499345 - 14156387804069 * br ^ 2 * bu ^ 4 * bw /
        1412930996070 - 26271798309223 * br ^ 2 * bu ^ 4 * bv / 1412930996070 -
        8007913526059 * br ^ 2 * bu ^ 5 / 1412930996070 + 15652138763539 * br ^ 2 * bs *
        bu ^ 2 * bv * bw / 1412930996070 + 12236221363691 * br ^ 2 * bs * bu ^ 2 * bv ^
        2 / 1412930996070 + 127706803091 * br ^ 2 * bs * bu ^ 3 * bw / 94195399738 -
        14848275280789 * br ^ 2 * bs * bu ^ 3 * bv / 1412930996070 + 2871643271812 * br
        ^ 2 * bs * bu ^ 4 / 64224136185 + 39945351226201 * br ^ 2 * bs ^ 2 * bu ^ 2 * bv
        / 1412930996070 - 42927452696101 * br ^ 2 * bs ^ 2 * bu ^ 3 / 1412930996070 +
        14239207767469 * br ^ 3 * bu ^ 3 * bv / 1412930996070 + 5972906921137 * br ^ 3 *
        bu ^ 4 / 1412930996070 - 14239207767469 * br ^ 3 * bs * bu ^ 2 * bv /
        1412930996070 - 5972906921137 * br ^ 3 * bs * bu ^ 3 / 1412930996070 + bv ^ 5 *
        bw + 7441947370147 * bu * bv ^ 4 * bw / 1412930996070 + bu * bv ^ 5 +
        8500179931588 * bu ^ 2 * bv ^ 2 * bw ^ 2 / 706465498035 + 224032490479043 * bu ^
        2 * bv ^ 3 * bw / 1412930996070 + 29626654668806 * bu ^ 2 * bv ^ 4 /
        706465498035 - 44712691519291 * bu ^ 3 * bv ^ 2 * bw / 235488499345 -
        97829121519451 * bu ^ 3 * bv ^ 3 / 1412930996070 - 2115068528579 * bu ^ 4 * bv *
        bw / 47097699869 + 472420719898048 * bu ^ 4 * bv ^ 2 / 706465498035 - bu ^ 5 *
        bv - 11680740358357 * bs * bv ^ 4 * bw / 1412930996070 - 114969285017659 * bs *
        bu * bv ^ 3 * bw / 706465498035 - 5815256275249 * bs * bu * bv ^ 4 /
        128448272370 + 39271034286051 * bs * bu ^ 2 * bv ^ 2 * bw / 235488499345 -
        32840286355813 * bs * bu ^ 2 * bv ^ 3 / 470976998690 + 4419595330677 * bs * bu ^
        3 * bv * bw / 47097699869 + 213837882436447 * bs * bu ^ 3 * bv ^ 2 /
        1412930996070 + 1360428260761 * bs * bu ^ 4 * bw / 470976998690 -
        660331347547547 * bs * bu ^ 4 * bv / 1412930996070 + 18369453872221 * bs ^ 2 *
        bv ^ 3 * bw / 1412930996070 + 19812311109062 * bs ^ 2 * bu * bv ^ 3 /
        141293099607 - 2304526802098 * bs ^ 2 * bu ^ 2 * bv * bw / 47097699869 -
        366630197305441 * bs ^ 2 * bu ^ 2 * bv ^ 2 / 470976998690 - 1360428260761 * bs ^
        2 * bu ^ 3 * bw / 470976998690 + 660331347547547 * bs ^ 2 * bu ^ 3 * bv /
        1412930996070 - br * bv ^ 4 * bw - br * bv ^ 5 - 9111158450038 * br * bu * bv ^
        2 * bw ^ 2 / 706465498035 - 9332681928533 * br * bu * bv ^ 3 * bw / 128448272370
        - 4616085378007 * br * bu * bv ^ 4 / 1412930996070 + 693169387083 * br * bu ^ 2
        * bv * bw ^ 2 / 470976998690 - 118409035974089 * br * bu ^ 2 * bv ^ 2 * bw /
        470976998690 - 6892716256818 * br * bu ^ 2 * bv ^ 3 / 235488499345 -
        7824791768132 * br * bu ^ 3 * bw ^ 2 / 706465498035 + 58203279404181 * br * bu ^
        3 * bv * bw / 235488499345 + 155694214250639 * br * bu ^ 3 * bv ^ 2 /
        1412930996070 - 13827028643939 * br * bu ^ 4 * bw / 235488499345 -
        470009013137933 * br * bu ^ 4 * bv / 706465498035 + 22276038888013 * br * bu ^ 5
        / 706465498035 + 143915632811 * br * bs * bv ^ 3 * bw / 706465498035 +
        67155371906543 * br * bs * bv ^ 4 / 706465498035 - 39230541141441 * br * bs * bu
        * bv * bw ^ 2 / 470976998690 + 203416577723107 * br * bs * bu * bv ^ 2 * bw /
        706465498035 - 97503138983951 * br * bs * bu * bv ^ 3 / 282586199214 +
        39230541141441 * br * bs * bu ^ 2 * bw ^ 2 / 470976998690 - 19432096816717 * br
        * bs * bu ^ 2 * bv * bw / 470976998690 + 128543657570891 * br * bs * bu ^ 2 * bv
        ^ 2 / 64224136185 - 86465796752242 * br * bs * bu ^ 3 * bw / 706465498035 -
        146965072253942 * br * bs * bu ^ 3 * bv / 141293099607 + 159913637215896 * br *
        bs * bu ^ 4 / 235488499345 + 2381019072089 * br * bs ^ 2 * bv ^ 2 * bw /
        282586199214 - 18369453872221 * br * bs ^ 2 * bv ^ 3 / 1412930996070 -
        18369453872221 * br * bs ^ 2 * bu * bv * bw / 1412930996070 - 411392951079839 *
        br * bs ^ 2 * bu * bv ^ 2 / 1412930996070 + 1455026916953 * br * bs ^ 2 * bu ^ 2
        * bw / 282586199214 - 47366125217756 * br * bs ^ 2 * bu ^ 2 * bv / 706465498035
        - 279949868610464 * br * bs ^ 2 * bu ^ 3 / 706465498035 + 1924820902769 * br *
        bs ^ 3 * bv ^ 2 / 94195399738 - 39230541141441 * br * bs ^ 3 * bu ^ 2 /
        470976998690 + br ^ 2 * bv ^ 3 * bw + br ^ 2 * bv ^ 4 + 4610882295221 * br ^ 2 *
        bu * bv * bw ^ 2 / 1412930996070 + 9405569071439 * br ^ 2 * bu * bv ^ 2 * bw /
        64224136185 - 4054363827317 * br ^ 2 * bu * bv ^ 3 / 470976998690 + 101574763393
        * br ^ 2 * bu ^ 2 * bw ^ 2 / 141293099607 + 83264679132013 * br ^ 2 * bu ^ 2 *
        bv * bw / 1412930996070 - 11834162937887 * br ^ 2 * bu ^ 2 * bv ^ 2 /
        141293099607 + 6302637933949 * br ^ 2 * bu ^ 3 * bw / 282586199214 -
        12874559660167 * br ^ 2 * bu ^ 3 * bv / 706465498035 - 9488890199467 * br ^ 2 *
        bu ^ 4 / 282586199214 - 4610882295221 * br ^ 2 * bs * bv * bw ^ 2 /
        1412930996070 + 5208309785427 * br ^ 2 * bs * bv ^ 2 * bw / 94195399738 +
        114154943259352 * br ^ 2 * bs * bv ^ 3 / 706465498035 - 101574763393 * br ^ 2 *
        bs * bu * bw ^ 2 / 141293099607 - 218217254476864 * br ^ 2 * bs * bu * bv * bw /
        706465498035 - 300188941866589 * br ^ 2 * bs * bu * bv ^ 2 / 470976998690 +
        219473000235571 * br ^ 2 * bs * bu ^ 2 * bw / 1412930996070 + 1084555152810667 *
        br ^ 2 * bs * bu ^ 2 * bv / 1412930996070 + 391772735115559 * br ^ 2 * bs * bu ^
        3 / 706465498035 - 21400550194546 * br ^ 2 * bs ^ 2 * bu * bw / 235488499345 +
        42800069137411 * br ^ 2 * bs ^ 2 * bu * bv / 1412930996070 - 1048316865718937 *
        br ^ 2 * bs ^ 2 * bu ^ 2 / 1412930996070 - br ^ 3 * bv ^ 3 + 907428973657 * br ^
        3 * bu * bw ^ 2 / 94195399738 - 28507646069097 * br ^ 3 * bu * bv * bw /
        470976998690 + 25055658417527 * br ^ 3 * bu * bv ^ 2 / 1412930996070 -
        17602324343143 * br ^ 3 * bu ^ 2 * bw / 706465498035 + 26397557349039 * br ^ 3 *
        bu ^ 2 * bv / 470976998690 + 6852168113179 * br ^ 3 * bu ^ 3 / 470976998690 -
        907428973657 * br ^ 3 * bs * bw ^ 2 / 94195399738 + 7866261171134 * br ^ 3 * bs
        * bv * bw / 235488499345 - 55664847623159 * br ^ 3 * bs * bv ^ 2 / 1412930996070
        + 53048802288943 * br ^ 3 * bs * bu * bw / 1412930996070 - 10959251510392 * br ^
        3 * bs * bu * bv / 235488499345 - 296215432754081 * br ^ 3 * bs * bu ^ 2 /
        706465498035 + 6229508957107 * br ^ 3 * bs ^ 2 * bw / 470976998690 +
        8816810325205 * br ^ 3 * bs ^ 2 * bv / 282586199214 + 50371686720107 * br ^ 3 *
        bs ^ 2 * bu / 128448272370 + 1412187166052 * br ^ 4 * bu ^ 2 / 706465498035 -
        1412187166052 * br ^ 4 * bs * bu / 706465498035 - 3095255795179 * bv ^ 2 * bw ^
        3 / 1412930996070 + 4025504956321 * bv ^ 3 * bw ^ 2 / 235488499345 -
        14118662157266 * bv ^ 4 * bw / 706465498035 - 93298911241234 * bv ^ 5 /
        706465498035 + 2236741730717 * bu * bv ^ 2 * bw ^ 2 / 1412930996070 -
        51915357227902 * bu * bv ^ 3 * bw / 706465498035 + 122818752207785 * bu * bv ^ 4
        / 282586199214 + 19730868318547 * bu ^ 2 * bv * bw ^ 2 / 1412930996070 +
        169151586281581 * bu ^ 2 * bv ^ 2 * bw / 706465498035 - 2329113554144903 * bu ^
        2 * bv ^ 3 / 706465498035 + 19790257025029 * bu ^ 3 * bv * bw / 470976998690 -
        779196342029053 * bu ^ 3 * bv ^ 2 / 706465498035 - 36232000005533 * bu ^ 4 * bv
        / 1412930996070 + 24017807732909 * bs * bv ^ 3 * bw / 235488499345 +
        6863009785081 * bs * bv ^ 4 / 128448272370 - 24552055778831 * bs * bu * bv ^ 2 *
        bw / 94195399738 + 491271480961717 * bs * bu * bv ^ 3 / 706465498035 -
        44015184289163 * bs * bu ^ 2 * bv * bw / 470976998690 + 352050920457658 * bs *
        bu ^ 2 * bv ^ 2 / 235488499345 - 1360428260761 * bs * bu ^ 3 * bw / 470976998690
        + 492858032809623 * bs * bu ^ 3 * bv / 470976998690 - 19738299178949 * bs ^ 2 *
        bv ^ 2 * bw / 1412930996070 - 6191289489007 * bs ^ 2 * bv ^ 3 / 42816090790 +
        10752035371306 * bs ^ 2 * bu * bv * bw / 235488499345 + 53859627523011 * bs ^ 2
        * bu * bv ^ 2 / 470976998690 + 1360428260761 * bs ^ 2 * bu ^ 2 * bw /
        470976998690 - 749152483373708 * bs ^ 2 * bu ^ 2 * bv / 706465498035 +
        3095255795179 * br * bv * bw ^ 3 / 1412930996070 + 3095255795179 * br * bv ^ 2 *
        bw ^ 2 / 1412930996070 + 1306836431779 * br * bv ^ 3 * bw / 235488499345 -
        12094130578814 * br * bv ^ 4 / 141293099607 + 8530720815031 * br * bu * bv * bw
        ^ 2 / 1412930996070 + 9711959889573 * br * bu * bv ^ 2 * bw / 94195399738 +
        55130154311549 * br * bu * bv ^ 3 / 235488499345 + 481264435265 * br * bu ^ 2 *
        bw ^ 2 / 25689654474 - 34601178612611 * br * bu ^ 2 * bv * bw / 141293099607 +
        2730408224904229 * br * bu ^ 2 * bv ^ 2 / 706465498035 + 2865903547025 * br * bu
        ^ 3 * bw / 141293099607 + 150423800775003 * br * bu ^ 3 * bv / 235488499345 +
        797901868003489 * br * bu ^ 4 / 1412930996070 + 23841449984873 * br * bs * bv *
        bw ^ 2 / 282586199214 - 32444995045888 * br * bs * bv ^ 2 * bw / 235488499345 -
        113675292455168 * br * bs * bv ^ 3 / 235488499345 - 56790309997607 * br * bs *
        bu * bw ^ 2 / 706465498035 + 5190014405657 * br * bs * bu * bv * bw /
        47097699869 + 265208608170883 * br * bs * bu * bv ^ 2 / 470976998690 +
        46696902856468 * br * bs * bu ^ 2 * bw / 706465498035 - 512104996712179 * br *
        bs * bu ^ 2 * bv / 128448272370 - 1171281455014588 * br * bs * bu ^ 3 /
        706465498035 + 3095255795179 * br * bs ^ 2 * bv * bw / 1412930996070 +
        55447201232783 * br * bs ^ 2 * bv ^ 2 / 282586199214 + 46180026908623 * br * bs
        ^ 2 * bu * bw / 706465498035 - 3636378740426 * br * bs ^ 2 * bu * bv /
        141293099607 + 690340857956345 * br * bs ^ 2 * bu ^ 2 / 282586199214 +
        68836977769037 * br * bs ^ 3 * bu / 470976998690 - 3095255795179 * br ^ 2 * bw ^
        3 / 1412930996070 - 3095255795179 * br ^ 2 * bv * bw ^ 2 / 1412930996070 -
        1542324931124 * br ^ 2 * bv ^ 2 * bw / 235488499345 + 80014040485096 * br ^ 2 *
        bv ^ 3 / 706465498035 - 2926726471435 * br ^ 2 * bu * bw ^ 2 / 282586199214 -
        10524400146308 * br ^ 2 * bu * bv * bw / 235488499345 - 953478529133879 * br ^ 2
        * bu * bv ^ 2 / 1412930996070 + 6107223633559 * br ^ 2 * bu ^ 2 * bw /
        235488499345 - 229933728061897 * br ^ 2 * bu ^ 2 * bv / 141293099607 -
        130098271802248 * br ^ 2 * bu ^ 3 / 235488499345 + 8353345200017 * br ^ 2 * bs *
        bw ^ 2 / 706465498035 - 15232273463611 * br ^ 2 * bs * bv * bw / 235488499345 +
        748577752353349 * br ^ 2 * bs * bv ^ 2 / 1412930996070 - 4314120886411 * br ^ 2
        * bs * bu * bw / 128448272370 + 3846809085511 * br ^ 2 * bs * bu * bv /
        94195399738 + 812570174818597 * br ^ 2 * bs * bu ^ 2 / 1412930996070 +
        92215103579299 * br ^ 2 * bs ^ 2 * bw / 1412930996070 - 35718709029512 * br ^ 2
        * bs ^ 2 * bv / 141293099607 - 387677851854131 * br ^ 2 * bs ^ 2 * bu /
        706465498035 + 5449657106621 * br ^ 3 * bw ^ 2 / 282586199214 - 9491687363894 *
        br ^ 3 * bv * bw / 706465498035 - 34521297245659 * br ^ 3 * bv ^ 2 /
        141293099607 - 18143452730771 * br ^ 3 * bu * bw / 1412930996070 +
        147408884729393 * br ^ 3 * bu * bv / 235488499345 + 16621695461104 * br ^ 3 * bu
        ^ 2 / 706465498035 - 4162757624393 * br ^ 3 * bs * bw / 470976998690 +
        76464046296777 * br ^ 3 * bs * bv / 470976998690 + 35032239381321 * br ^ 3 * bs
        * bu / 94195399738 - 278813980211114 * br ^ 3 * bs ^ 2 / 706465498035 +
        6278974030997 * br ^ 4 * bv / 235488499345 - 12196125766877 * br ^ 4 * bu /
        1412930996070 - 2391231272777 * br ^ 4 * bs / 1412930996070 - 9170870286913 * bv
        ^ 2 * bw ^ 2 / 706465498035 + 9773610753881 * bv ^ 3 * bw / 235488499345 +
        1497776907308747 * bv ^ 4 / 1412930996070 - 23901236160553 * bu * bv * bw ^ 2 /
        706465498035 - 77116529838076 * bu * bv ^ 2 * bw / 706465498035 -
        160315334984099 * bu * bv ^ 3 / 282586199214 + 10666665870917 * bu ^ 2 * bv * bw
        / 706465498035 + 2783072102933989 * bu ^ 2 * bv ^ 2 / 1412930996070 +
        1360428260761 * bu ^ 3 * bw / 470976998690 - 764096688192733 * bu ^ 3 * bv /
        1412930996070 + 31819731201681 * bs * bv ^ 2 * bw / 470976998690 -
        468005638806721 * bs * bv ^ 3 / 706465498035 + 21589440243001 * bs * bu * bv *
        bw / 706465498035 - 2880750752600167 * bs * bu * bv ^ 2 / 1412930996070 -
        353068337276062 * bs * bu ^ 2 * bv / 706465498035 + 70054421744 * bs ^ 2 * bv *
        bw / 21408045395 + 160260681251333 * bs ^ 2 * bv ^ 2 / 235488499345 +
        75393914687323 * bs ^ 2 * bu * bv / 141293099607 + 3095255795179 * br * bw ^ 3 /
        1412930996070 - 581128916410 * br * bv * bw ^ 2 / 141293099607 - 15202170104377
        * br * bv ^ 2 * bw / 706465498035 - 286055811803123 * br * bv ^ 3 / 235488499345
        + 102219775232 * br * bu * bw ^ 2 / 141293099607 + 23053043749199 * br * bu * bv
        * bw / 235488499345 - 238095402254089 * br * bu * bv ^ 2 / 706465498035 -
        3157052237057 * br * bu ^ 2 * bw / 235488499345 - 5444270608593 * br * bu ^ 2 *
        bv / 470976998690 + 3107188393373 * br * bu ^ 3 / 1412930996070 - 3095255795179
        * br * bs * bw ^ 2 / 1412930996070 + 18641831788652 * br * bs * bv * bw /
        706465498035 - 822744737500781 * br * bs * bv ^ 2 / 1412930996070 - 525633297029
        * br * bs * bu * bw / 1412930996070 + 410823503353806 * br * bs * bu * bv /
        235488499345 + 464213868325721 * br * bs * bu ^ 2 / 282586199214 - 7739756966203
        * br * bs ^ 2 * bw / 141293099607 + 39203740744073 * br * bs ^ 2 * bv /
        128448272370 - 47078936969557 * br * bs ^ 2 * bu / 282586199214 - 39230541141441
        * br * bs ^ 3 / 470976998690 - 15196675368977 * br ^ 2 * bw ^ 2 / 470976998690 +
        38812519625537 * br ^ 2 * bv * bw / 706465498035 + 368411970261969 * br ^ 2 * bv
        ^ 2 / 235488499345 + 12945833039539 * br ^ 2 * bu * bw / 706465498035 -
        1065773098681901 * br ^ 2 * bu * bv / 706465498035 + 869539421476247 * br ^ 2 *
        bu ^ 2 / 1412930996070 + 5883416490187 * br ^ 2 * bs * bw / 282586199214 -
        1639145494158097 * br ^ 2 * bs * bv / 1412930996070 - 285005211288713 * br ^ 2 *
        bs * bu / 282586199214 + 2098992573013211 * br ^ 2 * bs ^ 2 / 1412930996070 -
        13419079702377 * br ^ 3 * bv / 42816090790 - 268933590791093 * br ^ 3 * bu /
        706465498035 + 31250177614217 * br ^ 3 * bs / 1412930996070 + 2806060144829 * bv
        ^ 3 / 2440295330 + 70054421744 * bu * bv * bw / 21408045395 - 7576897905227 * bu
        * bv ^ 2 / 128448272370 + 133623603199056 * bu ^ 2 * bv / 235488499345 +
        469205077286389 * bs * bv ^ 2 / 1412930996070 + 9170870286913 * br * bw ^ 2 /
        706465498035 - 9773610753881 * br * bv * bw / 235488499345 - 1561242865582369 *
        br * bv ^ 2 / 706465498035 - 2582737782769 * br * bu * bw / 470976998690 +
        127920526581355 * br * bu * bv / 94195399738 - 89227153608304 * br * bu ^ 2 /
        141293099607 - 7757939290843 * br * bs * bw / 706465498035 + 2766849415063 * br
        * bs * bv / 1464177198 - 221072980927058 * br * bs * bu / 706465498035 -
        2800004425636567 * br * bs ^ 2 / 1412930996070 + 350581107055 * br ^ 2 * bv /
        244029533 + 116246709980231 * br ^ 2 * bu / 94195399738 - 1009062577917 * br ^ 2
        * bs / 47097699869 - 2806060144829 * br * bv / 2440295330 - 18085414278097 * br
        * bu / 21408045395 + br * bs) * p8 + (-bu ^ 6 * bw ^ 2 - bs * bu ^ 4 * bv * bw ^
        2 + bs * bu ^ 4 * bv ^ 2 * bw + 2 * bs * bu ^ 5 * bw ^ 2 - bs * bu ^ 5 * bv * bw
        - bu * bv ^ 3 * bw ^ 3 + bu * bv ^ 4 * bw ^ 2 + 5 * bu ^ 2 * bv ^ 2 * bw ^ 3 - 5
        * bu ^ 2 * bv ^ 3 * bw ^ 2 + 15652138763539 * bu ^ 3 * bv * bw ^ 3 /
        1412930996070 - 5414339409613 * bu ^ 3 * bv ^ 2 * bw ^ 2 / 1412930996070 +
        2693182219009 * bu ^ 4 * bv * bw ^ 2 / 94195399738 - 7174552787119 * bu ^ 4 * bv
        ^ 2 * bw / 1412930996070 - 190968128980 * bu ^ 5 * bw ^ 2 / 141293099607 -
        72316746036857 * bu ^ 5 * bv * bw / 1412930996070 + bu ^ 5 * bv ^ 2 -
        8564671465421 * bu ^ 6 * bw / 1412930996070 - 5117982068173 * bs * bu ^ 2 * bv *
        bw ^ 3 / 470976998690 + 1234405284841 * bs * bu ^ 2 * bv ^ 3 * bw / 470976998690
        - 171112355509 * bs * bu ^ 3 * bw ^ 3 / 141293099607 - 3716718835121 * bs * bu ^
        3 * bv * bw ^ 2 / 235488499345 + 59118709861 * bs * bu ^ 3 * bv ^ 2 * bw /
        64224136185 - 7506096281603 * bs * bu ^ 4 * bw ^ 2 / 706465498035 +
        1684200057897 * bs * bu ^ 4 * bv * bw / 42816090790 + 6421781038337 * bs * bu ^
        4 * bv ^ 2 / 282586199214 + 61412471602612 * bs * bu ^ 5 * bw / 706465498035 -
        14572430704019 * bs * bu ^ 5 * bv / 706465498035 + 11390533457561 * bs * bu ^ 6
        / 1412930996070 - 3136781280466 * bs ^ 2 * bu ^ 2 * bv ^ 2 * bw / 706465498035 +
        14710612495526 * bs ^ 2 * bu ^ 3 * bv * bw / 706465498035 - 6704367237551 * bs ^
        2 * bu ^ 3 * bv ^ 2 / 282586199214 - 100606554986029 * bs ^ 2 * bu ^ 4 * bw /
        1412930996070 + 9158503323202 * bs ^ 2 * bu ^ 4 * bv / 706465498035 -
        3548623585855 * bs ^ 2 * bu ^ 5 / 282586199214 - 6120392878852 * bs ^ 3 * bu ^ 3
        * bw / 706465498035 + 5413927380817 * bs ^ 3 * bu ^ 3 * bv / 706465498035 +
        1058764078619 * bs ^ 3 * bu ^ 4 / 235488499345 + br * bu * bv ^ 2 * bw ^ 3 - br
        * bu * bv ^ 4 * bw - 5 * br * bu ^ 2 * bv * bw ^ 3 - br * bu ^ 2 * bv ^ 2 * bw ^
        2 + 6 * br * bu ^ 2 * bv ^ 3 * bw - 528857395596 * br * bu ^ 3 * bv * bw ^ 2 /
        235488499345 - 1650315570737 * br * bu ^ 3 * bv ^ 2 * bw / 1412930996070 -
        11066063393893 * br * bu ^ 4 * bw ^ 2 / 1412930996070 - 18985081858789 * br * bu
        ^ 4 * bv * bw / 1412930996070 + br * bu ^ 5 * bw - 8240201401753 * br * bs * bu
        ^ 2 * bv * bw ^ 2 / 1412930996070 + 17597894066926 * br * bs * bu ^ 3 * bw ^ 2 /
        706465498035 + 3288120579829 * br * bs * bu ^ 3 * bv * bw / 235488499345 - br *
        bs * bu ^ 3 * bv ^ 2 - 2208883082261 * br * bs * bu ^ 4 * bw / 1412930996070 -
        20272882393333 * br * bs * bu ^ 4 * bv / 1412930996070 + 3 * br * bs * bu ^ 5 +
        208992721998 * br * bs ^ 2 * bu ^ 2 * bv * bw / 235488499345 + br * bs ^ 2 * bu
        ^ 2 * bv ^ 2 - 2453541851975 * br * bs ^ 2 * bu ^ 3 * bw / 282586199214 +
        20272882393333 * br * bs ^ 2 * bu ^ 3 * bv / 1412930996070 + 13208227412983 * br
        * bs ^ 2 * bu ^ 4 / 1412930996070 - 17447020401193 * br * bs ^ 3 * bu ^ 3 /
        1412930996070 - bv ^ 4 * bw ^ 2 - 9111158450038 * bu * bv * bw ^ 4 /
        706465498035 - 13020056112348 * bu * bv ^ 2 * bw ^ 3 / 235488499345 +
        226037312009243 * bu * bv ^ 3 * bw ^ 2 / 1412930996070 - bu * bv ^ 4 * bw +
        693169387083 * bu ^ 2 * bw ^ 4 / 470976998690 - 52531895741727 * bu ^ 2 * bv *
        bw ^ 3 / 470976998690 - 23994909592732 * bu ^ 2 * bv ^ 2 * bw ^ 2 / 47097699869
        - 10125320463947 * bu ^ 2 * bv ^ 3 * bw / 141293099607 + bu ^ 2 * bv ^ 4 +
        41078724793 * bu ^ 3 * bw ^ 3 / 128448272370 - 27457767536807 * bu ^ 3 * bv * bw
        ^ 2 / 706465498035 + 71581475697499 * bu ^ 3 * bv ^ 2 * bw / 706465498035 - 4 *
        bu ^ 3 * bv ^ 3 + 1238920570421 * bu ^ 4 * bw ^ 2 / 8563218158 + 205697794004044
        * bu ^ 4 * bv * bw / 706465498035 - 45713532123043 * bu ^ 4 * bv ^ 2 /
        1412930996070 + 462183184398074 * bu ^ 5 * bw / 706465498035 + 36931185635287 *
        bu ^ 5 * bv / 470976998690 - 40876667818243 * bs * bv ^ 4 * bw / 470976998690 +
        418018639520081 * bs * bu * bv * bw ^ 3 / 1412930996070 + 63506931587228 * bs *
        bu * bv ^ 3 * bw / 141293099607 - bs * bu * bv ^ 4 - 169757390100037 * bs * bu ^
        2 * bw ^ 3 / 1412930996070 + 837941522275051 * bs * bu ^ 2 * bv * bw ^ 2 /
        470976998690 - 407972251388049 * bs * bu ^ 2 * bv ^ 2 * bw / 235488499345 -
        149128094962661 * bs * bu ^ 2 * bv ^ 3 / 282586199214 - 1003668716372813 * bs *
        bu ^ 3 * bw ^ 2 / 706465498035 + 1436941708124 * bs * bu ^ 3 * bv * bw /
        3660442995 + 182002064409719 * bs * bu ^ 3 * bv ^ 2 / 706465498035 -
        997893502384436 * bs * bu ^ 4 * bw / 706465498035 + 90741000421227 * bs * bu ^ 4
        * bv / 470976998690 - 62068798798609 * bs * bu ^ 5 / 94195399738 -
        15969881073331 * bs ^ 2 * bu * bv ^ 2 * bw / 282586199214 + 33053876653427 * bs
        ^ 2 * bu * bv ^ 3 / 64224136185 + 173923711432403 * bs ^ 2 * bu ^ 2 * bv * bw /
        235488499345 - 86365180352593 * bs ^ 2 * bu ^ 2 * bv ^ 2 / 470976998690 +
        27535619014967 * bs ^ 2 * bu ^ 3 * bw / 64224136185 - 22326658509187 * bs ^ 2 *
        bu ^ 3 * bv / 64224136185 + 946919061617 * bs ^ 2 * bu ^ 4 / 778474378 -
        1924820902769 * bs ^ 3 * bv ^ 2 * bw / 94195399738 + 15025097115289 * bs ^ 3 *
        bu * bv * bw / 706465498035 - 15025097115289 * bs ^ 3 * bu * bv ^ 2 /
        706465498035 + 240517871377571 * bs ^ 3 * bu ^ 2 * bw / 1412930996070 +
        41674797589217 * bs ^ 3 * bu ^ 2 * bv / 706465498035 - 58809007276903 * bs ^ 3 *
        bu ^ 3 / 141293099607 - 18369453872221 * bs ^ 4 * bu * bw / 1412930996070 +
        18369453872221 * bs ^ 4 * bu * bv / 1412930996070 - 19812311109062 * bs ^ 4 * bu
        ^ 2 / 141293099607 + br * bv ^ 4 * bw + 188181057943061 * br * bu * bv * bw ^ 3
        / 1412930996070 - 187003750517207 * br * bu * bv ^ 2 * bw ^ 2 / 1412930996070 -
        230276104997453 * br * bu * bv ^ 3 * bw / 1412930996070 + 259411962378898 * br *
        bu ^ 2 * bv * bw ^ 2 / 706465498035 + 374720717087583 * br * bu ^ 2 * bv ^ 2 *
        bw / 470976998690 - br * bu ^ 2 * bv ^ 3 + 94077239463967 * br * bu ^ 3 * bw ^ 2
        / 1412930996070 - 920905147066649 * br * bu ^ 3 * bv * bw / 1412930996070 + 7 *
        br * bu ^ 3 * bv ^ 2 - 12767252956243 * br * bu ^ 4 * bw / 94195399738 +
        11720984517621 * br * bu ^ 4 * bv / 470976998690 - 184209264441 * br * bu ^ 5 /
        21408045395 + 10223000112866 * br * bs * bv * bw ^ 3 / 141293099607 -
        43700505455258 * br * bs * bu * bw ^ 3 / 235488499345 - 64970707598486 * br * bs
        * bu * bv * bw ^ 2 / 235488499345 + 3 * br * bs * bu * bv ^ 3 - 22722969192186 *
        br * bs * bu ^ 2 * bw ^ 2 / 235488499345 - 4653301995388 * br * bs * bu ^ 2 * bv
        * bw / 47097699869 + 63784290385451 * br * bs * bu ^ 2 * bv ^ 2 / 1412930996070
        + 188038952621558 * br * bs * bu ^ 3 * bw / 235488499345 + 34054387664489 * br *
        bs * bu ^ 3 * bv / 64224136185 + 219037375450031 * br * bs * bu ^ 4 /
        1412930996070 - br * bs ^ 2 * bv ^ 3 - 198761180261909 * br * bs ^ 2 * bu * bv *
        bw / 470976998690 + 9521471300299 * br * bs ^ 2 * bu * bv ^ 2 / 235488499345 -
        109100126688881 * br * bs ^ 2 * bu ^ 2 * bw / 1412930996070 - 134576371092849 *
        br * bs ^ 2 * bu ^ 2 * bv / 235488499345 - 697589883574691 * br * bs ^ 2 * bu ^
        3 / 706465498035 - 55676814177382 * br * bs ^ 3 * bv ^ 2 / 706465498035 +
        396845336578963 * br * bs ^ 3 * bu ^ 2 / 470976998690 + 6278974030997 * br ^ 2 *
        bu * bv * bw ^ 2 / 235488499345 + 6043485531652 * br ^ 2 * bu * bv ^ 2 * bw /
        235488499345 + br ^ 2 * bu * bv ^ 3 + 6031483694719 * br ^ 2 * bu ^ 2 * bw ^ 2 /
        1412930996070 - 6545865905951 * br ^ 2 * bu ^ 2 * bv * bw / 141293099607 - 5 *
        br ^ 2 * bu ^ 2 * bv ^ 2 - 6311212541417 * br ^ 2 * bu ^ 3 * bw / 706465498035 -
        5414339409613 * br ^ 2 * bu ^ 3 * bv / 1412930996070 + 184209264441 * br ^ 2 *
        bu ^ 4 / 21408045395 - 6031483694719 * br ^ 2 * bs * bw ^ 3 / 1412930996070 - br
        ^ 2 * bs * bv ^ 3 - 35322585967949 * br ^ 2 * bs * bu * bw ^ 2 / 1412930996070 +
        7439889136051 * br ^ 2 * bs * bu * bv * bw / 706465498035 + 11683207678999 * br
        ^ 2 * bs * bu * bv ^ 2 / 1412930996070 + 6179075271608 * br ^ 2 * bs * bu ^ 2 *
        bw / 141293099607 + 1137911937913 * br ^ 2 * bs * bu ^ 2 * bv / 470976998690 -
        7522316513366 * br ^ 2 * bs * bu ^ 3 / 706465498035 - 9700643130388 * br ^ 2 *
        bs ^ 2 * bv * bw / 235488499345 - 6031483694719 * br ^ 2 * bs ^ 2 * bv ^ 2 /
        1412930996070 + 4200448105709 * br ^ 2 * bs ^ 2 * bu * bw / 282586199214 +
        2824670588188 * br ^ 2 * bs ^ 2 * bu * bv / 706465498035 + 108502498199 * br ^ 2
        * bs ^ 2 * bu ^ 2 / 235488499345 + 3095255795179 * bv * bw ^ 4 / 1412930996070 -
        4025504956321 * bv ^ 2 * bw ^ 3 / 235488499345 + 14825127655301 * bv ^ 3 * bw ^
        2 / 706465498035 + 93298911241234 * bv ^ 4 * bw / 706465498035 + 17756543527577
        * bu * bv * bw ^ 3 / 235488499345 - 161642828721401 * bu * bv ^ 2 * bw ^ 2 /
        706465498035 - 189756001248309 * bu * bv ^ 3 * bw / 470976998690 - bu * bv ^ 4 -
        9780775063277 * bu ^ 2 * bw ^ 3 / 706465498035 + 1220243778637111 * bu ^ 2 * bv
        * bw ^ 2 / 1412930996070 + 1393962235796432 * bu ^ 2 * bv ^ 2 * bw /
        706465498035 + 31205347122201 * bu ^ 2 * bv ^ 3 / 47097699869 - 494151627832957
        * bu ^ 3 * bw ^ 2 / 1412930996070 - 1710263619699407 * bu ^ 3 * bv * bw /
        1412930996070 - 1242268987823137 * bu ^ 3 * bv ^ 2 / 1412930996070 +
        343449718412168 * bu ^ 4 * bw / 235488499345 - 100008159658076 * bu ^ 4 * bv /
        141293099607 - 167695511012068 * bs * bv * bw ^ 3 / 706465498035 -
        48134156703817 * bs * bv ^ 3 * bw / 235488499345 + 714091615020967 * bs * bv ^ 4
        / 1412930996070 + 205317355801669 * bs * bu * bw ^ 3 / 706465498035 +
        30034300607636 * bs * bu * bv * bw ^ 2 / 64224136185 - 184925793679466 * bs * bu
        * bv ^ 2 * bw / 141293099607 - 654093147959497 * bs * bu * bv ^ 3 / 706465498035
        - 431030032123831 * bs * bu ^ 2 * bw ^ 2 / 282586199214 + 29523075927263 * bs *
        bu ^ 2 * bv * bw / 141293099607 - 857146468151371 * bs * bu ^ 2 * bv ^ 2 /
        1412930996070 - 161329161278702 * bs * bu ^ 3 * bw / 235488499345 +
        1041914949253749 * bs * bu ^ 3 * bv / 235488499345 - 1942957813982927 * bs * bu
        ^ 4 / 1412930996070 + 285949586881087 * bs ^ 2 * bv ^ 2 * bw / 1412930996070 -
        154676071927 * bs ^ 2 * bv ^ 3 / 12844827237 + 213379138453199 * bs ^ 2 * bu *
        bv * bw / 282586199214 + 1662229854307471 * bs ^ 2 * bu * bv ^ 2 / 1412930996070
        + 1375277595814006 * bs ^ 2 * bu ^ 2 * bw / 706465498035 - 812332845486872 * bs
        ^ 2 * bu ^ 2 * bv / 235488499345 + 1020827189543663 * bs ^ 2 * bu ^ 3 /
        706465498035 - 58922507772113 * bs ^ 3 * bv * bw / 1412930996070 +
        70701911292671 * bs ^ 3 * bv ^ 2 / 706465498035 - 52804286519784 * bs ^ 3 * bu *
        bw / 235488499345 - 196453405900687 * bs ^ 3 * bu * bv / 706465498035 -
        8377297907953 * bs ^ 3 * bu ^ 2 / 21408045395 + 18369453872221 * bs ^ 4 * bw /
        1412930996070 - 18369453872221 * bs ^ 4 * bv / 1412930996070 + 76702280282554 *
        bs ^ 4 * bu / 235488499345 - 5449657106621 * br * bv * bw ^ 3 / 282586199214 +
        9491687363894 * br * bv ^ 2 * bw ^ 2 / 706465498035 + 153063098637269 * br * bv
        ^ 3 * bw / 706465498035 + 907428973657 * br * bu * bw ^ 3 / 94195399738 +
        99765954741924 * br * bu * bv * bw ^ 2 / 235488499345 - 700313468388889 * br *
        bu * bv ^ 2 * bw / 1412930996070 - 141350333609561 * br * bu ^ 2 * bw ^ 2 /
        706465498035 - 56722151853277 * br * bu ^ 2 * bv * bw / 235488499345 -
        284981094670 * br * bu ^ 2 * bv ^ 2 / 732088599 + 647270178214288 * br * bu ^ 3
        * bw / 706465498035 + 67915434354431 * br * bu ^ 3 * bv / 94195399738 -
        13106312012732 * br * bu ^ 4 / 706465498035 - 17931002136913 * br * bs * bw ^ 3
        / 282586199214 + 65895750046517 * br * bs * bv * bw ^ 2 / 141293099607 -
        90624769277191 * br * bs * bv ^ 2 * bw / 141293099607 - 57771587777197 * br * bs
        * bv ^ 3 / 282586199214 - 692193782313236 * br * bs * bu * bw ^ 2 / 706465498035
        + 688785903567581 * br * bs * bu * bv * bw / 1412930996070 + 119255774889445 *
        br * bs * bu * bv ^ 2 / 282586199214 - 414919394754989 * br * bs * bu ^ 2 * bw /
        235488499345 + 73788254838824 * br * bs * bu ^ 2 * bv / 706465498035 -
        231354405320824 * br * bs * bu ^ 3 / 141293099607 + 29628434771666 * br * bs ^ 2
        * bv * bw / 706465498035 - 75959732177821 * br * bs ^ 2 * bv ^ 2 / 706465498035
        + 404321194110533 * br * bs ^ 2 * bu * bw / 282586199214 - 84972210274724 * br *
        bs ^ 2 * bu * bv / 235488499345 + 1604776563153046 * br * bs ^ 2 * bu ^ 2 /
        706465498035 - 102295969332424 * br * bs ^ 3 * bw / 706465498035 +
        617304422838307 * br * bs ^ 3 * bv / 1412930996070 - 874531796874481 * br * bs ^
        3 * bu / 706465498035 - 6278974030997 * br ^ 2 * bv ^ 2 * bw / 235488499345 -
        23026457130349 * br ^ 2 * bu * bv * bw / 470976998690 + 219242936652923 * br ^ 2
        * bu * bv ^ 2 / 1412930996070 - 8570770834075 * br ^ 2 * bu ^ 2 * bw /
        282586199214 - 213525542022063 * br ^ 2 * bu ^ 2 * bv / 470976998690 +
        14518499178784 * br ^ 2 * bu ^ 3 / 706465498035 + 16159104138973 * br ^ 2 * bs *
        bw ^ 2 / 282586199214 + 15036473530229 * br ^ 2 * bs * bv * bw / 282586199214 +
        78855327796549 * br ^ 2 * bs * bv ^ 2 / 470976998690 + 89012059135913 * br ^ 2 *
        bs * bu * bw / 1412930996070 - 955539074491843 * br ^ 2 * bs * bu * bv /
        1412930996070 + 180348067354886 * br ^ 2 * bs * bu ^ 2 / 235488499345 -
        118469364880847 * br ^ 2 * bs ^ 2 * bw / 1412930996070 + 131509895694308 * br ^
        2 * bs ^ 2 * bv / 706465498035 - 116919206680019 * br ^ 2 * bs ^ 2 * bu /
        706465498035 - 6278974030997 * br ^ 3 * bu * bv / 235488499345 - 1412187166052 *
        br ^ 3 * bu ^ 2 / 706465498035 - 1412187166052 * br ^ 3 * bs * bv / 706465498035
        + 4332259285019 * br ^ 3 * bs * bu / 141293099607 - 3095255795179 * bw ^ 4 /
        1412930996070 + 1931580468716 * bv * bw ^ 3 / 64224136185 - 43439494418909 * bv
        ^ 2 * bw ^ 2 / 706465498035 - 30624995087113 * bv ^ 3 * bw / 25689654474 -
        102219775232 * bu * bw ^ 3 / 141293099607 - 1344161779120873 * bu * bv * bw ^ 2
        / 1412930996070 + 531215958501022 * bu * bv ^ 2 * bw / 235488499345 -
        31016956322725 * bu * bv ^ 3 / 47097699869 + 452475362425223 * bu ^ 2 * bw ^ 2 /
        1412930996070 - 392754035429545 * bu ^ 2 * bv * bw / 94195399738 +
        860310362917439 * bu ^ 2 * bv ^ 2 / 470976998690 - 770952359855204 * bu ^ 3 * bw
        / 235488499345 - 512286741736556 * bu ^ 3 * bv / 235488499345 - 8892804066527 *
        bs * bw ^ 3 / 128448272370 - 944406842263726 * bs * bv * bw ^ 2 / 706465498035 +
        973678167932971 * bs * bv ^ 2 * bw / 706465498035 + 183441305568131 * bs * bv ^
        3 / 128448272370 + 2379029058236576 * bs * bu * bw ^ 2 / 706465498035 +
        2325751696018787 * bs * bu * bv * bw / 1412930996070 - 3128038451027782 * bs *
        bu * bv ^ 2 / 706465498035 + 101727342514571 * bs * bu ^ 2 * bw / 21408045395 +
        1272722115715586 * bs * bu ^ 2 * bv / 235488499345 + 1414444791763403 * bs * bu
        ^ 3 / 706465498035 - 787326186483542 * bs ^ 2 * bv * bw / 706465498035 -
        103394058385337 * bs ^ 2 * bv ^ 2 / 470976998690 - 2578873329448921 * bs ^ 2 *
        bu * bw / 706465498035 + 173855908759177 * bs ^ 2 * bu * bv / 282586199214 -
        2608350204560109 * bs ^ 2 * bu ^ 2 / 470976998690 + 58628114432737 * bs ^ 3 * bw
        / 282586199214 - 318575060977001 * bs ^ 3 * bv / 1412930996070 +
        1521458595478364 * bs ^ 3 * bu / 706465498035 - 131045285302352 * bs ^ 4 /
        706465498035 + 5449657106621 * br * bw ^ 3 / 282586199214 - 9491687363894 * br *
        bv * bw ^ 2 / 706465498035 + 97616657721851 * br * bv ^ 2 * bw / 1412930996070 -
        18143452730771 * br * bu * bw ^ 2 / 1412930996070 + 592729756292353 * br * bu *
        bv * bw / 706465498035 + 29813155824367 * br * bu * bv ^ 2 / 128448272370 -
        48121687456030 * br * bu ^ 2 * bw / 141293099607 - 78642950689031 * br * bu ^ 2
        * bv / 282586199214 - 20156338075893 * br * bu ^ 3 / 94195399738 +
        81674630882974 * br * bs * bw ^ 2 / 235488499345 - 235237270213247 * br * bs *
        bv * bw / 1412930996070 - 305926452518441 * br * bs * bv ^ 2 / 1412930996070 +
        38979933624693 * br * bs * bu * bw / 42816090790 - 253265170826599 * br * bs *
        bu * bv / 706465498035 + 48100973465514 * br * bs * bu ^ 2 / 47097699869 -
        318158881571299 * br * bs ^ 2 * bw / 706465498035 + 256839707091454 * br * bs ^
        2 * bv / 706465498035 - 489579295093153 * br * bs ^ 2 * bu / 706465498035 +
        6750729224171 * br * bs ^ 3 / 47097699869 + 6278974030997 * br ^ 2 * bv * bw /
        235488499345 - 12196125766877 * br ^ 2 * bu * bw / 1412930996070 -
        55563101669756 * br ^ 2 * bu * bv / 141293099607 + 20156338075893 * br ^ 2 * bu
        ^ 2 / 94195399738 - 2391231272777 * br ^ 2 * bs * bw / 1412930996070 +
        88223742317471 * br ^ 2 * bs * bv / 470976998690 - 4905912557923 * br ^ 2 * bs *
        bu / 141293099607 + 6278974030997 * br ^ 2 * bs ^ 2 / 235488499345 -
        9170870286913 * bw ^ 3 / 706465498035 + 9773610753881 * bv * bw ^ 2 /
        235488499345 - 63465958273622 * bv ^ 2 * bw / 706465498035 + 2582737782769 * bu
        * bw ^ 2 / 470976998690 + 254356841342827 * bu * bv * bw / 1412930996070 -
        1294361499802207 * bu * bv ^ 2 / 1412930996070 + 1004366798055058 * bu ^ 2 * bw
        / 706465498035 + 5253793799110667 * bu ^ 2 * bv / 1412930996070 -
        110094618144539 * bs * bw ^ 2 / 141293099607 + 240841085005111 * bs * bv * bw /
        1412930996070 - 828401702738623 * bs * bv ^ 2 / 1412930996070 - 2476002224152493
        * bs * bu * bw / 706465498035 - 33106948434034 * bs * bu * bv / 64224136185 -
        572665501500107 * bs * bu ^ 2 / 128448272370 + 725690502474947 * bs ^ 2 * bw /
        1412930996070 + 37836141115667 * bs ^ 2 * bv / 64224136185 + 756888061149787 *
        bs ^ 2 * bu / 235488499345 - 246180114327218 * bs ^ 3 / 235488499345 -
        699750925721 * br * bv * bw / 2440295330 - 183354435783021 * br * bu * bw /
        470976998690 + 578616110935171 * br * bu * bv / 1412930996070 + 961964878048 *
        br * bs * bw / 47097699869 + 80466282332071 * br * bs * bv / 282586199214 -
        191930578867689 * br * bs * bu / 470976998690 - 699750925721 * br * bs ^ 2 /
        2440295330 + 2806060144829 * bv * bw / 2440295330 + 18085414278097 * bu * bw /
        21408045395 - 215130884836072 * bu * bv / 235488499345 - bs * bw -
        220393958786266 * bs * bv / 235488499345 + 329480079292679 * bs * bu /
        470976998690 + 2806060144829 * bs ^ 2 / 2440295330) * p9
  linear_combination bs * p9 - hT1

/- The equal-anchor bridge `false_of_q1_br_eq_bv` comes from
   `CrossedArmQ1G7Producer` and needs no local wrapper: both files use the same
   polynomial definitions. -/

set_option maxHeartbeats 1000000 in
/-- P97 ATail CrossedArmSevenPointEuclideanObstruction theorem. -/
private theorem false_of_q1_br_ne_bv_of_G3
    {br bs bu bv bw : ℂ}
    (hq : q1Polynomial bs bu bw = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0)
    (hbrv : br ≠ bv) (hbs : bs ≠ 0) (hbw : bw ≠ 0)
    (hbv1 : bv - 1 ≠ 0) (hbv0 : bv ≠ 0)
  (hG3 : (bu - bs) * (br - bv) * bv * bw = 0) : False := by
  simp only [q1Polynomial, e7Polynomial, e8Polynomial, e9Polynomial] at hq p7 p8 p9
  have hbu0 : bu - bs = 0 := by
    by_contra hne
    have hleft : (bu - bs) * (br - bv) * bv ≠ 0 := by
      exact mul_ne_zero (mul_ne_zero hne (sub_ne_zero.mpr hbrv)) hbv0
    exact hbw ((mul_eq_zero.mp hG3).resolve_left hleft)
  have hbu : bu = bs := sub_eq_zero.mp hbu0
  subst bu
  have hq' : bs * bw * (bw - bs) = 0 := by
    linear_combination hq
  have hbsbw : bs * bw ≠ 0 := mul_ne_zero hbs hbw
  have hbwbs0 : bw - bs = 0 :=
    (mul_eq_zero.mp hq').resolve_left hbsbw
  have hbwbs : bw = bs := sub_eq_zero.mp hbwbs0
  subst bw
  have hp7' : -bs * (bv - 1) * (bv - bs) = 0 := by
    linear_combination p7
  have hbsbv1 : (-bs) * (bv - 1) ≠ 0 :=
    mul_ne_zero (neg_ne_zero.mpr hbs) hbv1
  have hbvbs0 : bv - bs = 0 :=
    (mul_eq_zero.mp hp7').resolve_left hbsbv1
  have hbvbs : bv = bs := sub_eq_zero.mp hbvbs0
  subst bv
  have hp8' : bs ^ 2 * (bs - 1) = 0 := by
    linear_combination p8
  have hbs1sub : bs - 1 = 0 :=
    (mul_eq_zero.mp hp8').resolve_left (pow_ne_zero 2 hbs)
  have hbs1 : bs = 1 := sub_eq_zero.mp hbs1sub
  subst bs
  have hp9' : (br - 1) ^ 2 = 0 := by
    linear_combination p9
  exact (pow_ne_zero 2 (sub_ne_zero.mpr hbrv)) hp9'

set_option maxRecDepth 10000 in
set_option maxHeartbeats 4000000 in
/-- P97 ATail CrossedArmSevenPointEuclideanObstruction theorem. -/
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
      simp only [e9Polynomial] at p9
      have hp9 : br * bs ^ 2 = 0 := by linear_combination p9
      exact (mul_ne_zero hbr (pow_ne_zero 2 hbs)) hp9
    · have hbr_eq_bw : br = bw := sub_eq_zero.mp hbrbw
      subst br
      have hbv0 : bv ≠ 0 := by
        intro hv
        subst bv
        simp only [e9Polynomial] at p9
        have hp9 : bw * bs ^ 2 = 0 := by linear_combination p9
        exact (mul_ne_zero hbw (pow_ne_zero 2 hbs)) hp9
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
        simp only [e9Polynomial] at p9
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
