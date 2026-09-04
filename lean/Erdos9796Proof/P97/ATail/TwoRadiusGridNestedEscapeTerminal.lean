/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.TwoRadiusGridZeroCutAssembly

/-!
# Nested-escape terminal for a two-radius zero-cut grid

This module isolates the source-independent algebraic contradiction at the
end of the two-radius zero-cut assembly.  Its public theorems take only named
points and the metric data needed by that assembly.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTwoRadiusGridNestedEscapeTerminal

open ATailTwoRadiusGridCoordinateGeometry
open ATailTwoRadiusGridEscapeSynchronization
open ATailTwoRadiusGridZeroCutAssembly

private theorem polynomial_nested_escape_core
    {x y X Y u v : ℝ}
    (hx : 0 < x) (hy : 0 < y) (hyY : y < Y)
    (hNest : 0 < X * y - Y * x)
    (hNorm : u ^ 2 + v ^ 2 = x ^ 2 + y ^ 2)
    (hRayOrder : 0 < x * v - y * u)
    (hTriple :
      0 < (x - X) * (v - Y) - (y - Y) * (u - X)) :
    x * v + y * u < 0 := by
  have hNormDiff : x ^ 2 + y ^ 2 - u ^ 2 - v ^ 2 = 0 := by
    nlinarith [hNorm]
  have hN : 0 < x ^ 2 + y ^ 2 := by
    positivity
  have hE : 0 < x ^ 2 + y ^ 2 + x * u + y * v := by
    nlinarith [sq_nonneg (x + u), sq_nonneg (y + v)]
  have hFactor :
      (x ^ 2 + y ^ 2) * (x ^ 2 + y ^ 2 + x * u + y * v) *
          ((x - X) * (v - Y) - (y - Y) * (u - X)) =
        (x * v - y * u) *
          ((x * v - y * u) * (X * y - Y * x) +
            (x ^ 2 + y ^ 2 + x * u + y * v) *
              (x ^ 2 + y ^ 2 - (X * x + Y * y))) := by
    calc
      _ =
          (x * v - y * u) *
              ((x * v - y * u) * (X * y - Y * x) +
                (x ^ 2 + y ^ 2 + x * u + y * v) *
                  (x ^ 2 + y ^ 2 - (X * x + Y * y))) +
            (x ^ 2 + y ^ 2) * (X * y - Y * x) *
              (x ^ 2 + y ^ 2 - u ^ 2 - v ^ 2) := by ring
      _ = _ := by rw [hNormDiff]; ring
  have hBracket :
      0 < (x * v - y * u) * (X * y - Y * x) +
        (x ^ 2 + y ^ 2 + x * u + y * v) *
          (x ^ 2 + y ^ 2 - (X * x + Y * y)) := by
    have hleft :
        0 < (x ^ 2 + y ^ 2) * (x ^ 2 + y ^ 2 + x * u + y * v) *
          ((x - X) * (v - Y) - (y - Y) * (u - X)) :=
      mul_pos (mul_pos hN hE) hTriple
    rw [hFactor] at hleft
    by_contra hnot
    have hnonpos :
        (x * v - y * u) *
            ((x * v - y * u) * (X * y - Y * x) +
              (x ^ 2 + y ^ 2 + x * u + y * v) *
                (x ^ 2 + y ^ 2 - (X * x + Y * y))) ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos (le_of_lt hRayOrder)
        (le_of_not_gt hnot)
    exact (not_lt_of_ge hnonpos) hleft
  have hLinear :
      x * (X * y - Y * x) +
          y * (x ^ 2 + y ^ 2 - (X * x + Y * y)) < 0 := by
    have hIdentity :
        x * (X * y - Y * x) +
            y * (x ^ 2 + y ^ 2 - (X * x + Y * y)) =
          (x ^ 2 + y ^ 2) * (y - Y) := by ring
    rw [hIdentity]
    exact mul_neg_of_pos_of_neg hN (sub_neg.mpr hyY)
  have hEliminate :
      0 < (X * y - Y * x) *
        ((x * v - y * u) * y -
          (x ^ 2 + y ^ 2 + x * u + y * v) * x) := by
    have hFirst :
        0 < y *
          ((x * v - y * u) * (X * y - Y * x) +
            (x ^ 2 + y ^ 2 + x * u + y * v) *
              (x ^ 2 + y ^ 2 - (X * x + Y * y))) :=
      mul_pos hy hBracket
    have hSecond :
        (x ^ 2 + y ^ 2 + x * u + y * v) *
            (x * (X * y - Y * x) +
              y * (x ^ 2 + y ^ 2 - (X * x + Y * y))) < 0 :=
      mul_neg_of_pos_of_neg hE hLinear
    calc
      0 <
          y *
              ((x * v - y * u) * (X * y - Y * x) +
                (x ^ 2 + y ^ 2 + x * u + y * v) *
                  (x ^ 2 + y ^ 2 - (X * x + Y * y))) -
            (x ^ 2 + y ^ 2 + x * u + y * v) *
              (x * (X * y - Y * x) +
                y * (x ^ 2 + y ^ 2 - (X * x + Y * y))) := by
            nlinarith
        _ = _ := by ring
  have hCore :
      0 < (x * v - y * u) * y -
        (x ^ 2 + y ^ 2 + x * u + y * v) * x := by
    by_contra hnot
    have hnonpos :
        (X * y - Y * x) *
            ((x * v - y * u) * y -
              (x ^ 2 + y ^ 2 + x * u + y * v) * x) ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos (le_of_lt hNest)
        (le_of_not_gt hnot)
    exact (not_lt_of_ge hnonpos) hEliminate
  have hCoreIdentity :
      (x * v - y * u) * y -
          (x ^ 2 + y ^ 2 + x * u + y * v) * x =
        -(x ^ 2 + y ^ 2) * (u + x) := by ring
  rw [hCoreIdentity] at hCore
  have hux : u + x < 0 := by
    by_contra hnot
    have hnonpos : -(x ^ 2 + y ^ 2) * (u + x) ≤ 0 :=
      mul_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr (le_of_lt hN))
        (le_of_not_gt hnot)
    exact (not_lt_of_ge hnonpos) hCore
  have huSquare : x ^ 2 < u ^ 2 := by
    have hdiff : u - x < 0 := by linarith
    have hprod : 0 < (u - x) * (u + x) :=
      mul_pos_of_neg_of_neg hdiff hux
    nlinarith
  have hvSquare : v ^ 2 < y ^ 2 := by
    nlinarith [hNorm]
  have hv : v < y := by
    by_contra hnot
    have hdiff : 0 ≤ v - y := by linarith
    have hsum : 0 ≤ v + y := by linarith
    have hprod : 0 ≤ (v - y) * (v + y) := mul_nonneg hdiff hsum
    nlinarith
  have hxv : x * v < x * y := mul_lt_mul_of_pos_left hv hx
  have hyu : y * u < y * (-x) :=
    mul_lt_mul_of_pos_left (by linarith : u < -x) hy
  nlinarith

private theorem polynomial_nested_escape_core_of_negative
    {x y X Y u v : ℝ}
    (hx : 0 < x) (hy : y < 0) (hYy : Y < y)
    (hNest : X * y - Y * x < 0)
    (hNorm : u ^ 2 + v ^ 2 = x ^ 2 + y ^ 2)
    (hRayOrder : x * v - y * u < 0)
    (hTriple :
      (x - X) * (v - Y) - (y - Y) * (u - X) < 0) :
    0 < x * v + y * u := by
  have h := polynomial_nested_escape_core
    (x := x) (y := -y) (X := X) (Y := -Y) (u := u) (v := -v)
    hx (by linarith) (by linarith) (by nlinarith)
    (by nlinarith [hNorm]) (by nlinarith) (by nlinarith)
  nlinarith

private theorem false_of_scaledNestedEscape_positive
    {o a s sMinus L t : ℝ²}
    (hoa : o ≠ a)
    (hreflect :
      scaledLongitudinalCoord o a s =
          scaledLongitudinalCoord o a sMinus ∧
        scaledTransverseCoord o a s =
          -scaledTransverseCoord o a sMinus)
    (hx : 0 < scaledLongitudinalCoord o a s)
    (hy : 0 < scaledTransverseCoord o a s)
    (hyY :
      scaledTransverseCoord o a s < scaledTransverseCoord o a L)
    (hNest :
      0 < scaledLongitudinalCoord o a L *
          scaledTransverseCoord o a s -
        scaledTransverseCoord o a L * scaledLongitudinalCoord o a s)
    (hNorm :
      scaledLongitudinalCoord o a t ^ 2 +
          scaledTransverseCoord o a t ^ 2 =
        scaledLongitudinalCoord o a s ^ 2 +
          scaledTransverseCoord o a s ^ 2)
    (hRayArea : 0 < signedArea2 o s t)
    (hTripleArea : 0 < signedArea2 L s t)
    (hFinalArea : 0 < signedArea2 o sMinus t) :
    False := by
  let x := scaledLongitudinalCoord o a s
  let y := scaledTransverseCoord o a s
  let X := scaledLongitudinalCoord o a L
  let Y := scaledTransverseCoord o a L
  let u := scaledLongitudinalCoord o a t
  let v := scaledTransverseCoord o a t
  have hRay : 0 < x * v - y * u := by
    have h := (scaledCoordinate_det_pos_iff hoa).2 hRayArea
    simpa only [x, y, u, v] using h
  have hTriple :
      0 < (x - X) * (v - Y) - (y - Y) * (u - X) := by
    have h := (scaledCoordinate_triangle_det_pos_iff hoa).2 hTripleArea
    simpa only [x, y, X, Y, u, v] using h
  have hFinalRaw := (scaledCoordinate_det_pos_iff hoa).2 hFinalArea
  have hsmallLong : scaledLongitudinalCoord o a sMinus = x := by
    exact hreflect.1.symm.trans (by rfl)
  have hsmallTrans : scaledTransverseCoord o a sMinus = -y := by
    dsimp only [y]
    linarith [hreflect.2]
  have hFinal : 0 < x * v + y * u := by
    rw [hsmallLong, hsmallTrans] at hFinalRaw
    change 0 < x * v - (-y) * u at hFinalRaw
    nlinarith
  have hpoly : x * v + y * u < 0 := by
    apply polynomial_nested_escape_core (x := x) (y := y) (X := X) (Y := Y)
    · simpa only [x] using hx
    · simpa only [y] using hy
    · simpa only [y, Y] using hyY
    · simpa only [x, y, X, Y] using hNest
    · simpa only [x, y, u, v] using hNorm
    · exact hRay
    · exact hTriple
  linarith

private theorem false_of_scaledNestedEscape_negative
    {o a s sMinus L t : ℝ²}
    (hoa : o ≠ a)
    (hreflect :
      scaledLongitudinalCoord o a s =
          scaledLongitudinalCoord o a sMinus ∧
        scaledTransverseCoord o a s =
          -scaledTransverseCoord o a sMinus)
    (hx : 0 < scaledLongitudinalCoord o a s)
    (hy : scaledTransverseCoord o a s < 0)
    (hYy :
      scaledTransverseCoord o a L < scaledTransverseCoord o a s)
    (hNest :
      scaledLongitudinalCoord o a L *
          scaledTransverseCoord o a s -
        scaledTransverseCoord o a L * scaledLongitudinalCoord o a s < 0)
    (hNorm :
      scaledLongitudinalCoord o a t ^ 2 +
          scaledTransverseCoord o a t ^ 2 =
        scaledLongitudinalCoord o a s ^ 2 +
          scaledTransverseCoord o a s ^ 2)
    (hRayArea : signedArea2 o s t < 0)
    (hTripleArea : signedArea2 L s t < 0)
    (hFinalArea : signedArea2 o sMinus t < 0) :
    False := by
  let x := scaledLongitudinalCoord o a s
  let y := scaledTransverseCoord o a s
  let X := scaledLongitudinalCoord o a L
  let Y := scaledTransverseCoord o a L
  let u := scaledLongitudinalCoord o a t
  let v := scaledTransverseCoord o a t
  have hbase : 0 < ‖a - o‖ ^ 2 :=
    sq_pos_of_pos (norm_pos_iff.mpr (sub_ne_zero.mpr hoa.symm))
  have hRayEq := scaledCoordinate_det o a s t
  have hRay : x * v - y * u < 0 := by
    change x * v - y * u = ‖a - o‖ ^ 2 * signedArea2 o s t at hRayEq
    rw [hRayEq]
    exact mul_neg_of_pos_of_neg hbase hRayArea
  have hTripleEq := scaledCoordinate_triangle_det o a L s t
  have hTriple :
      (x - X) * (v - Y) - (y - Y) * (u - X) < 0 := by
    change
      (x - X) * (v - Y) - (y - Y) * (u - X) =
        ‖a - o‖ ^ 2 * signedArea2 L s t at hTripleEq
    rw [hTripleEq]
    exact mul_neg_of_pos_of_neg hbase hTripleArea
  have hFinalEq := scaledCoordinate_det o a sMinus t
  have hsmallLong : scaledLongitudinalCoord o a sMinus = x := by
    exact hreflect.1.symm.trans (by rfl)
  have hsmallTrans : scaledTransverseCoord o a sMinus = -y := by
    dsimp only [y]
    linarith [hreflect.2]
  have hFinalRaw : x * v - (-y) * u < 0 := by
    rw [hsmallLong, hsmallTrans] at hFinalEq
    change x * v - (-y) * u =
      ‖a - o‖ ^ 2 * signedArea2 o sMinus t at hFinalEq
    rw [hFinalEq]
    exact mul_neg_of_pos_of_neg hbase hFinalArea
  have hFinal : x * v + y * u < 0 := by nlinarith [hFinalRaw]
  have hpoly : 0 < x * v + y * u := by
    apply polynomial_nested_escape_core_of_negative
      (x := x) (y := y) (X := X) (Y := Y)
    · simpa only [x] using hx
    · simpa only [y] using hy
    · simpa only [y, Y] using hYy
    · simpa only [x, y, X, Y] using hNest
    · simpa only [x, y, u, v] using hNorm
    · exact hRay
    · exact hTriple
  linarith

/-- The direct-or-mirror zero-cut output contradicts the reflected smaller
pair and the shared smaller-radius norm. -/
theorem false_of_nestedEscape_packet
    {o a s sMinus L LMinus t : ℝ²}
    (hoa : o ≠ a)
    (hsReflect :
      scaledLongitudinalCoord o a s =
          scaledLongitudinalCoord o a sMinus ∧
        scaledTransverseCoord o a s =
          -scaledTransverseCoord o a sMinus)
    (hLReflect :
      scaledLongitudinalCoord o a L =
          scaledLongitudinalCoord o a LMinus ∧
        scaledTransverseCoord o a L =
          -scaledTransverseCoord o a LMinus)
    (hNorm :
      scaledLongitudinalCoord o a t ^ 2 +
          scaledTransverseCoord o a t ^ 2 =
        scaledLongitudinalCoord o a s ^ 2 +
          scaledTransverseCoord o a s ^ 2)
    (hpacket :
      (PositiveScaledNesting o a s L ∧
          0 < signedArea2 o a s ∧
          0 < signedArea2 o s t ∧
          0 < signedArea2 o sMinus t ∧
          (0 < signedArea2 o L s → 0 < signedArea2 L s t)) ∨
        ((scaledTransverseCoord o a s < 0 ∧
            scaledTransverseCoord o a L < 0) ∧
          PositiveScaledNesting o a sMinus LMinus ∧
          signedArea2 o a s < 0 ∧
          signedArea2 o s t < 0 ∧
          signedArea2 o sMinus t < 0 ∧
          (signedArea2 o L s < 0 → signedArea2 L s t < 0))) :
    False := by
  rcases hpacket with hpositive | hnegative
  · rcases hpositive with ⟨hnest, _hbaseSign, hRay, hFinal, hTripleOf⟩
    rcases hnest with ⟨hx, hy, hyY, hNest⟩
    have hAreaOLs : 0 < signedArea2 o L s :=
      (scaledCoordinate_det_pos_iff hoa).1 hNest
    exact false_of_scaledNestedEscape_positive hoa hsReflect hx hy hyY
      hNest hNorm hRay (hTripleOf hAreaOLs) hFinal
  · rcases hnegative with
      ⟨⟨hy, _hLargeTransNeg⟩, hmirrorNest, _hbaseSign,
        hRay, hFinal, hTripleOf⟩
    rcases hmirrorNest with ⟨hxMirror, _hyMirror, hyYMirror, hNestMirror⟩
    have hx : 0 < scaledLongitudinalCoord o a s := by
      rw [hsReflect.1]
      exact hxMirror
    have hYy :
        scaledTransverseCoord o a L < scaledTransverseCoord o a s := by
      nlinarith [hsReflect.2, hLReflect.2, hyYMirror]
    have hNest :
        scaledLongitudinalCoord o a L * scaledTransverseCoord o a s -
            scaledTransverseCoord o a L *
              scaledLongitudinalCoord o a s < 0 := by
      rw [hsReflect.1, hLReflect.1, hsReflect.2, hLReflect.2]
      nlinarith [hNestMirror]
    have hDetSwap :
        0 < scaledLongitudinalCoord o a s * scaledTransverseCoord o a L -
            scaledTransverseCoord o a s *
              scaledLongitudinalCoord o a L := by
      nlinarith [hNest]
    have hAreaSwap : 0 < signedArea2 o s L :=
      (scaledCoordinate_det_pos_iff hoa).1 hDetSwap
    have hAreaOLs : signedArea2 o L s < 0 := by
      have hswap : signedArea2 o L s = -signedArea2 o s L := by
        simp [signedArea2]
      rw [hswap]
      linarith
    exact false_of_scaledNestedEscape_negative hoa hsReflect hx hy hYy
      hNest hNorm hRay (hTripleOf hAreaOLs) hFinal

/-- The zero-cut two-radius packet contradicts a third point on the smaller
physical radius.  This is the source-neutral terminal consumed after the six
geometric roles have been named. -/
theorem false_of_twoRadiusGrid_zeroCut_nestedEscape
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {a s sMinus L LMinus t : ℝ²}
    (haA : a ∈ D.A) (hLMinusA : LMinus ∈ D.A)
    (hsInside : s ∈ S.capInteriorByIndex S.oppIndex1)
    (hLInside : L ∈ S.capInteriorByIndex S.oppIndex1)
    (hsMinusLeft : sMinus ∈ S.leftAdjacentCapByIndex S.oppIndex1)
    (htRight : t ∈ S.rightAdjacentCapByIndex S.oppIndex1)
    (hoa : S.oppApex1 ≠ a) (hot : S.oppApex1 ≠ t)
    (hos : S.oppApex1 ≠ s) (hosMinus : S.oppApex1 ≠ sMinus)
    (hasMinus : a ≠ sMinus)
    (hssMinus : s ≠ sMinus) (haL : a ≠ L)
    (haLMinus : a ≠ LMinus) (hLLMinus : L ≠ LMinus)
    (hsReflect :
      scaledLongitudinalCoord S.oppApex1 a s =
          scaledLongitudinalCoord S.oppApex1 a sMinus ∧
        scaledTransverseCoord S.oppApex1 a s =
          -scaledTransverseCoord S.oppApex1 a sMinus)
    (hLReflect :
      scaledLongitudinalCoord S.oppApex1 a L =
          scaledLongitudinalCoord S.oppApex1 a LMinus ∧
        scaledTransverseCoord S.oppApex1 a L =
          -scaledTransverseCoord S.oppApex1 a LMinus)
    (hsO : dist S.oppApex1 s = dist S.oppApex1 sMinus)
    (hsA : dist a s = dist a sMinus)
    (hLO : dist S.oppApex1 L = dist S.oppApex1 LMinus)
    (hLA : dist a L = dist a LMinus)
    (hRadius : dist S.oppApex1 s < dist S.oppApex1 L)
    (hCommonBlocker : dist a s = dist a L)
    (hLMinusOutside : LMinus ∉ S.capInteriorByIndex S.oppIndex1)
    (hNorm :
      scaledLongitudinalCoord S.oppApex1 a t ^ 2 +
          scaledTransverseCoord S.oppApex1 a t ^ 2 =
        scaledLongitudinalCoord S.oppApex1 a s ^ 2 +
          scaledTransverseCoord S.oppApex1 a s ^ 2) :
    False := by
  have hpacket := twoRadiusGrid_zeroCut_assembly S haA hLMinusA
    hsInside hLInside hsMinusLeft htRight hoa hot hos hosMinus hasMinus
    hssMinus haL haLMinus hLLMinus hsReflect hLReflect hsO hsA hLO hLA
    hRadius hCommonBlocker hLMinusOutside
  exact false_of_nestedEscape_packet hoa hsReflect hLReflect hNorm hpacket

end ATailTwoRadiusGridNestedEscapeTerminal
end Problem97
