/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Seven-point seven-row interlock collision core

This file proves that a particular eleven-relation distance-equality system on seven
arbitrary labels is inconsistent when its two anchor labels are distinct. It also packages
the system as an equality-closure core for finite row patterns.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem sevenPointSevenRowInterlockCollision_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 :=
  Problem97.dist_sq_coord x y

/-- The two-dimensional mixed Gram-determinant identity. -/
private theorem sevenPointSevenRowInterlockCollision_mixedGram₂
    (a0 a1 b0 b1 x0 x1 z0 z1 : ℝ) :
    ((a0 ^ 2 + a1 ^ 2) * (b0 ^ 2 + b1 ^ 2) - (a0 * b0 + a1 * b1) ^ 2) *
        (x0 * z0 + x1 * z1) =
      (b0 ^ 2 + b1 ^ 2) * (a0 * x0 + a1 * x1) * (a0 * z0 + a1 * z1) -
        (a0 * b0 + a1 * b1) *
          ((a0 * x0 + a1 * x1) * (b0 * z0 + b1 * z1) +
            (b0 * x0 + b1 * x1) * (a0 * z0 + a1 * z1)) +
        (a0 ^ 2 + a1 ^ 2) * (b0 * x0 + b1 * x1) * (b0 * z0 + b1 * z1) := by
  ring

/-- Reconstruction of a mixed inner product in an equilateral basis. -/
private theorem sevenPointSevenRowInterlockCollision_equilateral_reconstruct
    {a0 a1 b0 b1 R : ℝ}
    (ha : a0 ^ 2 + a1 ^ 2 = R)
    (hb : b0 ^ 2 + b1 ^ 2 = R)
    (hab : 2 * (a0 * b0 + a1 * b1) = R)
    (hR : R ≠ 0) (x0 x1 z0 z1 : ℝ) :
    3 * R * (x0 * z0 + x1 * z1) =
      2 * (2 * (a0 * x0 + a1 * x1) * (a0 * z0 + a1 * z1) -
        (a0 * x0 + a1 * x1) * (b0 * z0 + b1 * z1) -
        (b0 * x0 + b1 * x1) * (a0 * z0 + a1 * z1) +
        2 * (b0 * x0 + b1 * x1) * (b0 * z0 + b1 * z1)) := by
  have hab' : a0 * b0 + a1 * b1 = R / 2 := by
    linarith
  have hg := sevenPointSevenRowInterlockCollision_mixedGram₂
    a0 a1 b0 b1 x0 x1 z0 z1
  rw [ha, hb, hab'] at hg
  have hm :
      R * (3 * R * (x0 * z0 + x1 * z1) -
        2 * (2 * (a0 * x0 + a1 * x1) * (a0 * z0 + a1 * z1) -
          (a0 * x0 + a1 * x1) * (b0 * z0 + b1 * z1) -
          (b0 * x0 + b1 * x1) * (a0 * z0 + a1 * z1) +
          2 * (b0 * x0 + b1 * x1) * (b0 * z0 + b1 * z1))) = 0 := by
    nlinarith only [hg]
  have hzero := (mul_eq_zero.mp hm).resolve_left hR
  linarith

set_option maxHeartbeats 2000000 in
-- The explicit polynomial certificate needs extra normalization budget.
/-- The scalar invariant system extracted from the eight mixed Gram identities. -/
private theorem sevenPointSevenRowInterlockCollision_invariant_R_eq_zero
    {R W X Y P Q K : ℝ}
    (f1 : W ^ 2 - 4 * R * W + R ^ 2 = 0)
    (f2 : 4 * (X ^ 2 - X * Y + Y ^ 2) - 3 * R = 0)
    (f3 : 2 * (2 * X * R - X * W - Y * R + 2 * Y * W) + 3 * R * W = 0)
    (f4 : 4 * (P ^ 2 - P * Q + Q ^ 2) - 3 * R = 0)
    (f5 : 2 * (2 * R - W) * P + 2 * (-R + 2 * W) * Q - 3 * R = 0)
    (f6 :
      4 * ((2 * X - Y) * P + (-X + 2 * Y) * Q) - 3 * R * (R - 1 - 2 * P) = 0)
    (f7 : 1 - 2 * K + 4 * K ^ 2 - 3 * R = 0)
    (f8 : 2 * (2 * X - 2 * X * K - Y + 4 * Y * K) -
      3 * R * (R - 1 - 2 * K) = 0) : R = 0 := by
  -- An exact integer certificate for the scalar invariant ideal.
  let C1 : ℝ :=
    -21792 * P * Q * K * R
      + 43584 * Q ^ 2 * K * R
      - 11664 * P ^ 2 * R ^ 2
      + 34992 * P * Q * R ^ 2
      - 23328 * Q ^ 2 * R ^ 2
      + 5832 * P * R ^ 3
      - 11664 * Q * R ^ 3
      - 139968 * X ^ 2 * Q
      + 279936 * X * Y * Q
      - 39648 * P ^ 2 * Q
      + 2016 * X * Q ^ 2
      - 4032 * Y * Q ^ 2
      + 93504 * P * Q ^ 2
      - 28416 * Q ^ 3
      - 29664 * X * Y * K
      + 59328 * Y ^ 2 * K
      + 288 * P ^ 2 * K
      - 404256 * X * Q * K
      + 808512 * Y * Q * K
      + 20928 * P * Q * K
      - 43008 * Q ^ 2 * K
      + 23328 * X ^ 2 * R
      - 23328 * X * Y * R
      - 46656 * Y ^ 2 * R
      + 2016 * X * P * R
      - 4032 * Y * P * R
      + 5064 * P ^ 2 * R
      + 66528 * X * Q * R
      + 286848 * Y * Q * R
      + 26376 * P * Q * R
      - 76032 * Q ^ 2 * R
      - 75696 * X * K * R
      + 195888 * Y * K * R
      + 125760 * P * K * R
      + 354864 * Q * K * R
      + 36072 * X * R ^ 2
      - 177120 * Y * R ^ 2
      + 155052 * P * R ^ 2
      - 101016 * Q * R ^ 2
      + 113544 * K * R ^ 2
      - 106596 * R ^ 3
      - 156576 * X ^ 2
      + 384528 * X * Y
      - 142752 * Y ^ 2
      - 198936 * X * P
      + 397872 * Y * P
      + 40800 * P ^ 2
      + 70320 * X * Q
      - 140640 * Y * Q
      - 163680 * P * Q
      + 164160 * Q ^ 2
      + 183120 * X * K
      - 366240 * Y * K
      - 125760 * P * K
      + 251520 * Q * K
      + 291192 * X * R
      - 219720 * Y * R
      + 125304 * P * R
      + 240720 * Q * R
      - 274680 * K * R
      - 84492 * R ^ 2
      + 72408 * X
      - 144816 * Y
      + 28560 * P
      - 57120 * Q
      - 108612 * R
  let C2 : ℝ :=
    -23328 * W * Y * P
      - 16 * W * P ^ 2
      + 46656 * W * Y * Q
      - 19760 * W * P * Q
      + 39584 * W * Q ^ 2
      - 72048 * W * P * K
      + 43392 * P ^ 2 * K
      - 57600 * P * Q * K
      + 17952 * Q ^ 2 * K
      - 46656 * Y * K ^ 2
      + 39648 * P * K ^ 2
      - 39648 * Q * K ^ 2
      + 68652 * W * P * R
      + 186624 * Y * P * R
      - 51712 * P ^ 2 * R
      - 67320 * W * Q * R
      - 163296 * Y * Q * R
      + 63376 * P * Q * R
      - 78160 * Q ^ 2 * R
      + 7416 * W * K * R
      + 186912 * P * K * R
      + 72048 * Q * K * R
      + 100968 * K ^ 2 * R
      - 17496 * W * R ^ 2
      + 143280 * P * R ^ 2
      - 110628 * Q * R ^ 2
      - 1008 * K * R ^ 2
      + 52488 * R ^ 3
      + 3516 * W * P
      - 3744 * P ^ 2
      - 57552 * W * Q
      + 23568 * P * Q
      - 10848 * Q ^ 2
      + 66456 * W * K
      + 93312 * Y * K
      - 12720 * P * K
      + 32544 * Q * K
      + 288 * K ^ 2
      + 24912 * W * R
      - 13728 * P * R
      + 24996 * Q * R
      - 291396 * K * R
      - 181080 * R ^ 2
      + 18432 * W
      - 46656 * Y
      - 6360 * Q
      - 144 * K
      + 20652 * R
      - 144
  let C3 : ℝ :=
    -21792 * P ^ 2 * K * R
      + 43584 * P * Q * K * R
      + 11664 * P * Q * R ^ 2
      - 23328 * Q ^ 2 * R ^ 2
      - 5832 * P * K * R ^ 2
      - 46656 * X * Y * P
      - 46656 * Y ^ 2 * P
      - 32 * X * P ^ 2
      - 32 * Y * P ^ 2
      - 69984 * W * X * Q
      + 93312 * X * Y * Q
      + 93312 * Y ^ 2 * Q
      - 39520 * X * P * Q
      + 14240 * Y * P * Q
      - 25440 * P ^ 2 * Q
      + 1008 * W * Q ^ 2
      + 79168 * X * Q ^ 2
      - 28352 * Y * Q ^ 2
      + 90528 * P * Q ^ 2
      - 79296 * Q ^ 3
      - 14832 * W * Y * K
      - 144096 * X * P * K
      + 144096 * Y * P * K
      + 39456 * P ^ 2 * K
      - 202128 * W * Q * K
      - 144096 * Y * Q * K
      - 75744 * P * Q * K
      - 7200 * Q ^ 2 * K
      + 265824 * Y * K ^ 2
      + 28608 * Q * K ^ 2
      + 11664 * W * X * R
      + 11664 * W * Y * R
      + 1008 * W * P * R
      + 137304 * X * P * R
      - 173952 * Y * P * R
      + 22200 * P ^ 2 * R
      - 71712 * W * Q * R
      + 5328 * X * Q * R
      + 277920 * Y * Q * R
      - 75360 * P * Q * R
      + 58392 * Q ^ 2 * R
      - 37848 * W * K * R
      + 14832 * X * K * R
      - 97632 * Y * K * R
      - 68448 * P * K * R
      - 58680 * Q * K * R
      + 254880 * K ^ 2 * R
      + 35532 * W * R ^ 2
      - 58320 * X * R ^ 2
      - 23328 * Y * R ^ 2
      + 84144 * P * R ^ 2
      + 131052 * Q * R ^ 2
      + 51900 * K * R ^ 2
      - 88560 * R ^ 3
      - 78288 * W * X
      + 35688 * W * Y
      - 99468 * W * P
      + 7032 * X * P
      - 216 * Y * P
      - 33168 * P ^ 2
      + 35160 * W * Q
      - 115104 * X * Q
      + 50952 * Y * Q
      + 4224 * P * Q
      + 40848 * Q ^ 2
      + 91560 * W * K
      + 132912 * X * K
      - 59184 * Y * K
      + 103200 * P * K
      + 48144 * Q * K
      + 28164 * W * R
      + 206400 * X * R
      - 114288 * Y * R
      + 411264 * P * R
      - 218280 * Q * R
      - 168756 * K * R
      - 170412 * R ^ 2
      + 36204 * W
      + 36864 * X
      - 36864 * Y
      + 12072 * P
      - 89568 * Q
      - 86988 * R
  let C4 : ℝ :=
    5448 * W * K * R ^ 2
      - 21792 * X * K * R ^ 2
      + 43584 * Y * K * R ^ 2
      + 2916 * W * R ^ 3
      + 23328 * X * R ^ 3
      - 11664 * Y * R ^ 3
      + 5448 * K * R ^ 3
      + 2916 * R ^ 4
      + 288 * W * Y * K
      - 14208 * X * Y * K
      - 25440 * Y ^ 2 * K
      - 79296 * X * K ^ 2
      + 39648 * Y * K ^ 2
      - 39168 * X * Y * R
      + 58464 * Y ^ 2 * R
      + 16272 * W * Q * R
      + 53856 * X * Q * R
      + 11232 * Y * Q * R
      - 5160 * W * K * R
      + 54048 * X * K * R
      - 97440 * Y * K * R
      - 59472 * K ^ 2 * R
      - 11532 * W * R ^ 2
      - 49632 * X * R ^ 2
      - 37824 * Y * R ^ 2
      + 16272 * Q * R ^ 2
      - 32520 * K * R ^ 2
      - 14592 * R ^ 3
      + 27792 * W * Y
      + 19824 * X * Y
      - 7104 * Y ^ 2
      + 25440 * X * K
      - 12720 * Y * K
      + 26724 * W * R
      - 23592 * X * R
      + 20832 * Y * R
      + 51624 * K * R
      - 27492 * R ^ 2
      - 2808 * R
  let C5 : ℝ :=
    21792 * X * P * K * R
      - 43584 * Y * P * K * R
      - 10896 * W * Q * K * R
      - 5832 * W * P * R ^ 2
      + 5832 * W * Q * R ^ 2
      - 11664 * X * Q * R ^ 2
      + 23328 * Y * Q * R ^ 2
      + 5832 * X * K * R ^ 2
      - 11664 * Y * K * R ^ 2
      - 21792 * P * K * R ^ 2
      + 32688 * Q * K * R ^ 2
      + 2916 * W * R ^ 3
      + 17496 * P * R ^ 3
      - 5832 * Q * R ^ 3
      - 8748 * K * R ^ 3
      - 5832 * R ^ 4
      - 139968 * Y ^ 3
      - 96 * Y ^ 2 * P
      - 53760 * X * Y * Q
      - 11232 * Y ^ 2 * Q
      - 19824 * W * P * Q
      + 25440 * X * P * Q
      - 50880 * Y * P * Q
      + 7104 * W * Q ^ 2
      - 39648 * X * Q ^ 2
      + 79296 * Y * Q ^ 2
      + 144 * W * P * K
      - 39456 * X * P * K
      + 79488 * Y * P * K
      + 10752 * W * Q * K
      - 3744 * X * Q * K
      + 7200 * Y * Q * K
      + 241272 * X * Y * R
      - 280584 * Y ^ 2 * R
      + 2532 * W * P * R
      - 22248 * X * P * R
      + 44352 * Y * P * R
      + 18252 * W * Q * R
      - 29424 * X * Q * R
      - 40152 * Y * Q * R
      + 34032 * P * Q * R
      + 18336 * Q ^ 2 * R
      + 62880 * W * K * R
      + 126480 * X * K * R
      + 158304 * Y * K * R
      + 48576 * P * K * R
      - 27072 * Q * K * R
      + 79038 * W * R ^ 2
      + 218652 * X * R ^ 2
      - 135012 * Y * R ^ 2
      + 5172 * P * R ^ 2
      - 99168 * Q * R ^ 2
      - 22800 * K * R ^ 2
      + 57078 * R ^ 3
      + 108288 * X * Y
      - 43920 * Y ^ 2
      + 20400 * W * P
      + 33168 * X * P
      - 10752 * Y * P
      - 41040 * W * Q
      + 6528 * X * Q
      - 40848 * Y * Q
      - 62880 * W * K
      - 88896 * X * K
      + 199248 * Y * K
      - 86550 * W * R
      - 302148 * X * R
      + 286884 * Y * R
      - 37080 * P * R
      + 121296 * Q * R
      + 399144 * K * R
      + 11136 * R ^ 2
      + 14280 * W
      + 118776 * X
      - 41280 * Y
      + 51810 * R
  let C6 : ℝ :=
    10896 * P * K * R ^ 2
      - 21792 * Q * K * R ^ 2
      - 2532 * K ^ 2 * R ^ 2
      - 11664 * P * R ^ 3
      + 5832 * Q * R ^ 3
      + 2916 * K * R ^ 3
      + 72048 * W * Y * K
      - 21696 * X * P * K
      + 17952 * Y * P * K
      - 144 * W * Q * K
      + 17952 * X * Q * K
      + 3744 * Y * Q * K
      - 19824 * X * K ^ 2
      + 39648 * P * K ^ 2
      - 39648 * Q * K ^ 2
      - 69984 * X * Y * R
      + 69984 * Y ^ 2 * R
      + 25872 * X * P * R
      + 6672 * Y * P * R
      - 252 * W * Q * R
      + 1008 * X * Q * R
      - 48 * Y * Q * R
      - 26928 * P * Q * R
      - 5616 * Q ^ 2 * R
      + 68544 * W * K * R
      - 21408 * X * K * R
      - 72048 * Y * K * R
      - 10752 * P * K * R
      + 21792 * Q * K * R
      + 38136 * K ^ 2 * R
      + 24714 * W * R ^ 2
      - 140292 * X * R ^ 2
      + 54648 * Y * R ^ 2
      + 5436 * P * R ^ 2
      + 23976 * Q * R ^ 2
      - 6222 * K * R ^ 2
      - 39645 * R ^ 3
      + 25260 * W * Y
      + 1872 * X * P
      - 10848 * Y * P
      - 13896 * W * Q
      - 10848 * X * Q
      + 8976 * Y * Q
      + 3576 * W * K
      + 6360 * X * K
      + 9912 * Y * K
      - 12720 * P * K
      + 32544 * Q * K
      - 25092 * W * R
      + 3348 * X * R
      - 10740 * Y * R
      + 10392 * P * R
      + 30264 * Q * R
      - 89256 * K * R
      - 53715 * R ^ 2
      + 32712 * W
      - 3180 * Y
      - 6360 * Q
      - 6282 * R
  let C7 : ℝ :=
    7596 * Y * P * R ^ 2
      + 13428 * X * Q * R ^ 2
      - 26856 * Y * Q * R ^ 2
      - 2916 * X * R ^ 3
      + 5832 * Y * R ^ 3
      + 11394 * P * R ^ 3
      - 23940 * Q * R ^ 3
      + 2475 * R ^ 4
      + 139968 * Y ^ 3
      + 53856 * X * Y * Q
      + 11232 * Y ^ 2 * Q
      + 53856 * X * Q ^ 2
      + 11232 * Y * Q ^ 2
      - 313416 * X * Y * R
      + 135144 * Y ^ 2 * R
      - 25200 * Y * P * R
      - 3456 * X * Q * R
      + 2160 * Y * Q * R
      + 59472 * P * Q * R
      + 38160 * Q ^ 2 * R
      - 366372 * X * R ^ 2
      + 42696 * Y * R ^ 2
      - 97272 * P * R ^ 2
      + 34344 * Q * R ^ 2
      - 51741 * R ^ 3
      - 864 * X * Y
      + 864 * Y ^ 2
      - 11808 * X * R
      - 70848 * Y * R
      - 47322 * R ^ 2
      + 216 * R
  let C8 : ℝ :=
    5832 * W * Q * R ^ 2
      - 5064 * P * K * R ^ 2
      + 15960 * Q * K * R ^ 2
      + 5832 * P * R ^ 3
      - 5832 * Q * R ^ 3
      - 2916 * K * R ^ 3
      - 132912 * W * Y * K
      - 46656 * X * Y * K
      - 46656 * Y ^ 2 * K
      - 19824 * Y * P * K
      - 14304 * W * Q * K
      - 19824 * X * Q * K
      + 14208 * Y * Q * K
      - 39648 * P * Q * K
      + 14208 * Q ^ 2 * K
      + 71064 * W * Y * R
      - 93456 * Y * P * R
      + 289404 * W * Q * R
      + 93456 * X * Q * R
      - 32544 * P * Q * R
      + 26928 * Q ^ 2 * R
      - 127440 * W * K * R
      + 100968 * X * K * R
      - 16608 * Y * K * R
      + 46536 * P * K * R
      - 42720 * Q * K * R
      + 23022 * W * R ^ 2
      + 13824 * X * R ^ 2
      - 48816 * Y * R ^ 2
      + 8340 * P * R ^ 2
      - 65928 * Q * R ^ 2
      + 54828 * K * R ^ 2
      + 4554 * R ^ 3
      - 36864 * W * Y
      + 46656 * X * Y
      - 23328 * Y ^ 2
      + 6360 * Y * P
      - 130848 * W * Q
      + 6360 * X * Q
      - 19824 * Y * Q
      + 12720 * P * Q
      - 19824 * Q ^ 2
      + 288 * X * K
      - 576 * Y * K
      - 34938 * W * R
      - 57516 * X * R
      + 185988 * Y * R
      - 94812 * P * R
      + 151800 * Q * R
      + 33228 * K * R
      - 51948 * R ^ 2
      + 144 * X
      + 144 * Y
      + 91926 * R
  have h648 : (648 : ℝ) * R = 0 := by
    linear_combination
      C1 * f1 + C2 * f2 + C3 * f3 + C4 * f4 +
      C5 * f5 + C6 * f6 + C7 * f7 + C8 * f8
  nlinarith only [h648]

set_option maxHeartbeats 4000000 in
-- The coordinate proof factors through eight low-degree scalar invariants.
/-- The normalized eleven-relation distance system is inconsistent. -/
private theorem normalized_sevenPointSevenRowInterlockCollision_incompatible
    {T U V A B : ℝ²}
    (hPQ_PU : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) U)
    (hQP_QT : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) T)
    (hQP_QV : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) V)
    (hTP_TB : dist T (pt 0 0) = dist T B)
    (hUQ_UV : dist U (pt 1 0) = dist U V)
    (hUQ_UA : dist U (pt 1 0) = dist U A)
    (hVP_VA : dist V (pt 0 0) = dist V A)
    (hAQ_AT : dist A (pt 1 0) = dist A T)
    (hAQ_AB : dist A (pt 1 0) = dist A B)
    (hBQ_BU : dist B (pt 1 0) = dist B U)
    (hBQ_BA : dist B (pt 1 0) = dist B A) : False := by
  have hPQ_PU_sq := congrArg (fun r : ℝ ↦ r ^ 2) hPQ_PU
  have hQP_QT_sq := congrArg (fun r : ℝ ↦ r ^ 2) hQP_QT
  have hQP_QV_sq := congrArg (fun r : ℝ ↦ r ^ 2) hQP_QV
  have hTP_TB_sq := congrArg (fun r : ℝ ↦ r ^ 2) hTP_TB
  have hUQ_UV_sq := congrArg (fun r : ℝ ↦ r ^ 2) hUQ_UV
  have hUQ_UA_sq := congrArg (fun r : ℝ ↦ r ^ 2) hUQ_UA
  have hVP_VA_sq := congrArg (fun r : ℝ ↦ r ^ 2) hVP_VA
  have hAQ_AT_sq := congrArg (fun r : ℝ ↦ r ^ 2) hAQ_AT
  have hAQ_AB_sq := congrArg (fun r : ℝ ↦ r ^ 2) hAQ_AB
  have hBQ_BU_sq := congrArg (fun r : ℝ ↦ r ^ 2) hBQ_BU
  have hBQ_BA_sq := congrArg (fun r : ℝ ↦ r ^ 2) hBQ_BA
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) U ^ 2 at hPQ_PU_sq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) T ^ 2 at hQP_QT_sq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) V ^ 2 at hQP_QV_sq
  change dist T (pt 0 0) ^ 2 = dist T B ^ 2 at hTP_TB_sq
  change dist U (pt 1 0) ^ 2 = dist U V ^ 2 at hUQ_UV_sq
  change dist U (pt 1 0) ^ 2 = dist U A ^ 2 at hUQ_UA_sq
  change dist V (pt 0 0) ^ 2 = dist V A ^ 2 at hVP_VA_sq
  change dist A (pt 1 0) ^ 2 = dist A T ^ 2 at hAQ_AT_sq
  change dist A (pt 1 0) ^ 2 = dist A B ^ 2 at hAQ_AB_sq
  change dist B (pt 1 0) ^ 2 = dist B U ^ 2 at hBQ_BU_sq
  change dist B (pt 1 0) ^ 2 = dist B A ^ 2 at hBQ_BA_sq
  rw [sevenPointSevenRowInterlockCollision_dist_sq_coord,
    sevenPointSevenRowInterlockCollision_dist_sq_coord]
    at hPQ_PU_sq hQP_QT_sq hQP_QV_sq hTP_TB_sq hUQ_UV_sq hUQ_UA_sq hVP_VA_sq
      hAQ_AT_sq hAQ_AB_sq hBQ_BU_sq hBQ_BA_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hPQ_PU_sq hQP_QT_sq hQP_QV_sq hTP_TB_sq hUQ_UV_sq hUQ_UA_sq hVP_VA_sq
      hAQ_AT_sq hAQ_AB_sq hBQ_BU_sq hBQ_BA_sq
  let a0 := A 0 - 1
  let a1 := A 1
  let b0 := B 0 - 1
  let b1 := B 1
  let w0 := U 0 - 1
  let w1 := U 1
  let r0 := V 0 - 1
  let r1 := V 1
  let s0 := T 0 - 1
  let s1 := T 1
  let R := a0 ^ 2 + a1 ^ 2
  let W := w0 ^ 2 + w1 ^ 2
  let X := a0
  let Y := b0
  let P := a0 * r0 + a1 * r1
  let Q := b0 * r0 + b1 * r1
  let K := b0 * s0 + b1 * s1
  have ha : a0 ^ 2 + a1 ^ 2 = R := rfl
  have hWnorm : w0 ^ 2 + w1 ^ 2 = W := rfl
  have hb : b0 ^ 2 + b1 ^ 2 = R := by
    dsimp only [a0, a1, b0, b1, R]
    nlinarith only [hAQ_AB_sq, hBQ_BA_sq]
  have hab : 2 * (a0 * b0 + a1 * b1) = R := by
    dsimp only [a0, a1, b0, b1, R]
    nlinarith only [hBQ_BA_sq]
  have hew : W + 2 * w0 = 0 := by
    dsimp only [w0, w1, W]
    nlinarith only [hPQ_PU_sq]
  have hwa : 2 * (a0 * w0 + a1 * w1) = R := by
    dsimp only [a0, a1, w0, w1, R]
    nlinarith only [hUQ_UA_sq]
  have hwb : 2 * (b0 * w0 + b1 * w1) = W := by
    dsimp only [b0, b1, w0, w1, W]
    nlinarith only [hBQ_BU_sq]
  have hrr : r0 ^ 2 + r1 ^ 2 = 1 := by
    dsimp only [r0, r1]
    nlinarith only [hQP_QV_sq]
  have hwr : 2 * (w0 * r0 + w1 * r1) = 1 := by
    dsimp only [w0, w1, r0, r1]
    nlinarith only [hUQ_UV_sq, hrr]
  have hra : 2 * (a0 * r0 + a1 * r1) + 2 * r0 = R - 1 := by
    dsimp only [a0, a1, r0, r1, R]
    nlinarith only [hVP_VA_sq, hrr]
  have hss : s0 ^ 2 + s1 ^ 2 = 1 := by
    dsimp only [s0, s1]
    nlinarith only [hQP_QT_sq]
  have has : 2 * (a0 * s0 + a1 * s1) = 1 := by
    dsimp only [a0, a1, s0, s1]
    nlinarith only [hAQ_AT_sq, hss]
  have hsb : 2 * (b0 * s0 + b1 * s1) + 2 * s0 = R - 1 := by
    dsimp only [b0, b1, s0, s1, R]
    nlinarith only [hTP_TB_sq, hss, hb]
  by_cases hR : R = 0
  · have ha0 : a0 = 0 := by
      nlinarith only [ha, hR, sq_nonneg a0, sq_nonneg a1]
    have ha1 : a1 = 0 := by
      nlinarith only [ha, hR, sq_nonneg a0, sq_nonneg a1]
    have hb0 : b0 = 0 := by
      nlinarith only [hb, hR, sq_nonneg b0, sq_nonneg b1]
    have hb1 : b1 = 0 := by
      nlinarith only [hb, hR, sq_nonneg b0, sq_nonneg b1]
    have hW : W = 0 := by
      rw [hb0, hb1] at hwb
      simpa using hwb.symm
    have hw0 : w0 = 0 := by
      nlinarith only [hWnorm, hW, sq_nonneg w0, sq_nonneg w1]
    have hw1 : w1 = 0 := by
      nlinarith only [hWnorm, hW, sq_nonneg w0, sq_nonneg w1]
    rw [hw0, hw1] at hwr
    norm_num at hwr
  · have hwa' : a0 * w0 + a1 * w1 = R / 2 := by
      linarith
    have hwb' : b0 * w0 + b1 * w1 = W / 2 := by
      linarith
    have hwr' : w0 * r0 + w1 * r1 = 1 / 2 := by
      linarith
    have has' : a0 * s0 + a1 * s1 = 1 / 2 := by
      linarith
    have g1 := sevenPointSevenRowInterlockCollision_equilateral_reconstruct
      ha hb hab hR w0 w1 w0 w1
    have g2 := sevenPointSevenRowInterlockCollision_equilateral_reconstruct
      ha hb hab hR 1 0 1 0
    have g3 := sevenPointSevenRowInterlockCollision_equilateral_reconstruct
      ha hb hab hR 1 0 w0 w1
    have g4 := sevenPointSevenRowInterlockCollision_equilateral_reconstruct
      ha hb hab hR r0 r1 r0 r1
    have g5 := sevenPointSevenRowInterlockCollision_equilateral_reconstruct
      ha hb hab hR w0 w1 r0 r1
    have g6 := sevenPointSevenRowInterlockCollision_equilateral_reconstruct
      ha hb hab hR 1 0 r0 r1
    have g7 := sevenPointSevenRowInterlockCollision_equilateral_reconstruct
      ha hb hab hR s0 s1 s0 s1
    have g8 := sevenPointSevenRowInterlockCollision_equilateral_reconstruct
      ha hb hab hR 1 0 s0 s1
    have f1 : W ^ 2 - 4 * R * W + R ^ 2 = 0 := by
      rw [hwa', hwb'] at g1
      linear_combination -g1 + 3 * R * hWnorm
    have f2 : 4 * (X ^ 2 - X * Y + Y ^ 2) - 3 * R = 0 := by
      dsimp only [X, Y]
      linear_combination -g2
    have f3 :
        2 * (2 * X * R - X * W - Y * R + 2 * Y * W) + 3 * R * W = 0 := by
      rw [hwa', hwb'] at g3
      dsimp only [X, Y]
      linear_combination -2 * g3 + 3 * R * hew
    have f4 : 4 * (P ^ 2 - P * Q + Q ^ 2) - 3 * R = 0 := by
      dsimp only [P, Q]
      linear_combination -g4 + 3 * R * hrr
    have f5 : 2 * (2 * R - W) * P + 2 * (-R + 2 * W) * Q - 3 * R = 0 := by
      rw [hwa', hwb', hwr'] at g5
      dsimp only [P, Q]
      linear_combination -2 * g5
    have f6 :
        4 * ((2 * X - Y) * P + (-X + 2 * Y) * Q) -
          3 * R * (R - 1 - 2 * P) = 0 := by
      dsimp only [X, Y, P, Q]
      linear_combination -2 * g6 + 3 * R * hra
    have f7 : 1 - 2 * K + 4 * K ^ 2 - 3 * R = 0 := by
      rw [has'] at g7
      dsimp only [K]
      linear_combination -g7 + 3 * R * hss
    have g8' :
        3 * R * s0 = 2 * X - 2 * X * K - Y + 4 * Y * K := by
      rw [has'] at g8
      dsimp only [X, Y, K]
      linear_combination g8
    have hs0' : 2 * s0 = R - 1 - 2 * K := by
      dsimp only [K]
      linarith only [hsb]
    have f8 :
        2 * (2 * X - 2 * X * K - Y + 4 * Y * K) -
          3 * R * (R - 1 - 2 * K) = 0 := by
      linear_combination -2 * g8' + 3 * R * hs0'
    exact hR <| sevenPointSevenRowInterlockCollision_invariant_R_eq_zero
      f1 f2 f3 f4 f5 f6 f7 f8

/-- The eleven distance relations are inconsistent when the two anchors are distinct. -/
theorem seven_point_seven_row_interlock_collision
    {p q t u v a b : ℝ²}
    (h_pq : p ≠ q)
    (hPQ_PU : dist p q = dist p u)
    (hQP_QT : dist q p = dist q t)
    (hQP_QV : dist q p = dist q v)
    (hTP_TB : dist t p = dist t b)
    (hUQ_UV : dist u q = dist u v)
    (hUQ_UA : dist u q = dist u a)
    (hVP_VA : dist v p = dist v a)
    (hAQ_AT : dist a q = dist a t)
    (hAQ_AB : dist a q = dist a b)
    (hBQ_BU : dist b q = dist b u)
    (hBQ_BA : dist b q = dist b a) : False := by
  let N : ℝ² → ℝ² := normSim p q
  let tn := N t
  let un := N u
  let vn := N v
  let an := N a
  let bn := N b
  have hdist (X Y : ℝ²) :
      dist (N X) (N Y) = (dist p q)⁻¹ * dist X Y := by
    simpa [N] using normSim_dist_image p q h_pq X Y
  have hN0 : N p = pt 0 0 := by
    simpa [N] using normSim_fst p q
  have hN1 : N q = pt 1 0 := by
    simpa [N] using normSim_snd p q h_pq
  have map_dist_eq {X Y Z R : ℝ²} (h : dist X Y = dist Z R) :
      dist (N X) (N Y) = dist (N Z) (N R) := by
    rw [hdist, hdist, h]
  apply normalized_sevenPointSevenRowInterlockCollision_incompatible
      (T := tn) (U := un) (V := vn) (A := an) (B := bn)
  · simpa [un, hN0, hN1] using map_dist_eq hPQ_PU
  · simpa [tn, hN0, hN1] using map_dist_eq hQP_QT
  · simpa [vn, hN0, hN1] using map_dist_eq hQP_QV
  · simpa [bn, tn, hN0] using map_dist_eq hTP_TB
  · simpa [un, vn, hN1] using map_dist_eq hUQ_UV
  · simpa [an, un, hN1] using map_dist_eq hUQ_UA
  · simpa [an, vn, hN0] using map_dist_eq hVP_VA
  · simpa [an, tn, hN1] using map_dist_eq hAQ_AT
  · simpa [an, bn, hN1] using map_dist_eq hAQ_AB
  · simpa [bn, un, hN1] using map_dist_eq hBQ_BU
  · simpa [an, bn, hN1] using map_dist_eq hBQ_BA

/-- Equality-closure form of the seven-point seven-row interlock collision. -/
structure SevenPointSevenRowInterlockCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  p : alpha
  q : alpha
  t : alpha
  u : alpha
  v : alpha
  a : alpha
  b : alpha
  h_pq : p ≠ q
  pq_pu : EdgeClosure P (p, q) (p, u)
  qp_qt : EdgeClosure P (q, p) (q, t)
  qp_qv : EdgeClosure P (q, p) (q, v)
  tp_tb : EdgeClosure P (t, p) (t, b)
  uq_uv : EdgeClosure P (u, q) (u, v)
  uq_ua : EdgeClosure P (u, q) (u, a)
  vp_va : EdgeClosure P (v, p) (v, a)
  aq_at : EdgeClosure P (a, q) (a, t)
  aq_ab : EdgeClosure P (a, q) (a, b)
  bq_bu : EdgeClosure P (b, q) (b, u)
  bq_ba : EdgeClosure P (b, q) (b, a)

/-- A seven-point seven-row interlock collision core has no injective planar realization. -/
theorem not_realizes_of_sevenPointSevenRowInterlockCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : SevenPointSevenRowInterlockCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  exact seven_point_seven_row_interlock_collision
    (fun hcollision ↦ core.h_pq (hreal.injective hcollision))
    (by simpa [edgeDist] using sound core.pq_pu)
    (by simpa [edgeDist] using sound core.qp_qt)
    (by simpa [edgeDist] using sound core.qp_qv)
    (by simpa [edgeDist] using sound core.tp_tb)
    (by simpa [edgeDist] using sound core.uq_uv)
    (by simpa [edgeDist] using sound core.uq_ua)
    (by simpa [edgeDist] using sound core.vp_va)
    (by simpa [edgeDist] using sound core.aq_at)
    (by simpa [edgeDist] using sound core.aq_ab)
    (by simpa [edgeDist] using sound core.bq_bu)
    (by simpa [edgeDist] using sound core.bq_ba)

end EqualityCore
end Census554
end Problem97
