/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Foundation
import Erdos9796Proof.P97.ConvexIndepHelpers
import Erdos9796Proof.P97.Moser.NonDeg

/-!
# Arc-midpoint reflection collinearity

Let `A`, `B`, `K`, `P` lie on one circle, centre `O` and radius `r`, and let `K`
be equidistant from `A` and `P` — on a circle that says exactly that `K` is a
midpoint of one of the two arcs cut by the chord `A P`.  Let `R` be a second
point equidistant from `K` and from `B` as `P` is, that is, the second
intersection of `circle K (dist K P)` with `circle B (dist B P)`.  Then `A`,
`B`, `R` are collinear.

`Problem97.signedArea2_eq_zero_of_arcMidpoint_twoCircle` is that statement in
`signedArea2` form.  The three disequalities `R ≠ P`, `B ≠ K`, `A ≠ P` are each
necessary: `B = K` makes the two circles concentric, so `R` is unconstrained;
`A = P` degenerates the chord, so the arc-midpoint hypothesis is vacuous and
`K` is unconstrained; `R = P` picks the first intersection rather than the
second.

## Proof route

The synthetic argument reflects `P` across the line `B K` and reads the image
off an inscribed-angle bisector.  Mathlib has no arc-midpoint concept and no
angle-bisector API, so that route would need both built first.  This file takes
the algebraic route instead, which needs neither.

Writing `u = B - K` and `m = R + P - 2 • K`, the two distance hypotheses give
`(R - P) ⬝ u = 0` and `(R - P) ⬝ m = 0`.  In the plane a nonzero vector has a
one-dimensional orthogonal complement, so `R ≠ P` forces `u` and `m` parallel.
The planar identity `‖u‖² • m = (m ⬝ u) • u + cross u m • uᗮ` then pins
`‖u‖² • (R - K)`, and the conclusion follows from a polynomial certificate over
the four circle memberships and the arc-midpoint equality, cleared by the
squared distance `A P`.

The certificate was produced by `lift` in Singular over ℚ and is checked here by
`ring` inside `linear_combination`, so nothing in this file rests on the solver:
the solver supplied the cofactors, and Lean re-verifies the identity.
-/

namespace Problem97

open scoped EuclideanGeometry

/-- The certificate identity.  With `A`, `B`, `K`, `P` on the circle of radius
`r` about the origin and `K` equidistant from `A` and `P`, the quantity `tgt`
below — which is `‖B - K‖²` times the signed area of `(A, B, R)`, after `R` has
been eliminated — vanishes once multiplied by the squared distance `A P`. -/
private lemma arcMidpoint_certificate
    (a1 a2 b1 b2 k1 k2 p1 p2 r : ℝ)
    (hA : a1 ^ 2 + a2 ^ 2 = r ^ 2)
    (hB : b1 ^ 2 + b2 ^ 2 = r ^ 2)
    (hK : k1 ^ 2 + k2 ^ 2 = r ^ 2)
    (hP : p1 ^ 2 + p2 ^ 2 = r ^ 2)
    (hMid : (k1 - a1) ^ 2 + (k2 - a2) ^ 2 = (k1 - p1) ^ 2 + (k2 - p2) ^ 2) :
    (((b1 - k1) ^ 2 + (b2 - k2) ^ 2) * ((b1 - a1) * (k2 - a2) - (k1 - a1) * (b2 - a2)) + ((b1 - a1) * (2 * ((p1 - k1) * (b1 - k1) + (p2 - k2) * (b2 - k2)) * (b2 - k2) - ((b1 - k1) ^ 2 + (b2 - k2) ^ 2) * (p2 - k2)) - (2 * ((p1 - k1) * (b1 - k1) + (p2 - k2) * (b2 - k2)) * (b1 - k1) - ((b1 - k1) ^ 2 + (b2 - k2) ^ 2) * (p1 - k1)) * (b2 - a2))) * ((a1 - p1) ^ 2 + (a2 - p2) ^ 2) = 0 := by
  linear_combination (2*a1*b1*b2*k1+2*a2*b2^2*k1-2*a2*b1*b2*k2+2*a1*b2^2*k2+2*a1*b1*k1*k2-2*a2*b2*k1*k2+2*a2*b1*k2^2+2*a1*b2*k2^2-2*a1*b1*b2*p1-2*a2*b2^2*p1+2*a1*b2*k1*p1-2*b1*b2*k1*p1+2*a1*b1*k2*p1+4*a2*b2*k2*p1-2*b2^2*k2*p1-2*a1*k1*k2*p1-2*b1*k1*k2*p1-2*a2*k2^2*p1-2*b2*k2^2*p1+2*a2*b1*b2*p2-2*a1*b2^2*p2-4*a1*b1*k1*p2-2*a2*b2*k1*p2-2*b2^2*k1*p2-2*a2*b1*k2*p2+2*b1*b2*k2*p2+2*a2*k1*k2*p2+2*b2*k1*k2*p2-2*a1*k2^2*p2-2*b1*k2^2*p2+4*b2^2*p1*p2+4*b1*k1*p1*p2-4*b2*k2*p1*p2+4*k2^2*p1*p2-4*b1*b2*p2^2+4*b2*k1*p2^2+4*b1*k2*p2^2-4*k1*k2*p2^2-2*a1*b2*r^2+2*b1*b2*r^2-2*b2*k1*r^2-2*a1*k2*r^2-2*b1*k2*r^2+2*k1*k2*r^2+2*b2*p1*r^2+2*k2*p1*r^2+4*a1*p2*r^2-4*p1*p2*r^2) * hA + (-a1^2*a2*b1-a2^3*b1+a1^3*b2+a1*a2^2*b2+2*a1^2*a2*k1+2*a2^3*k1-2*a1^2*b2*k1-2*a2^2*b2*k1-2*a1^3*k2-2*a1*a2^2*k2+2*a1^2*b1*k2+2*a2^2*b1*k2-2*a1^2*k1*k2-2*a2^2*k1*k2+a1^2*a2*p1+a2^3*p1+2*a1*a2*b1*p1-a1^2*b2*p1+a2^2*b2*p1-4*a1*a2*k1*p1+4*a1*b2*k1*p1+2*a1^2*k2*p1-2*a2^2*k2*p1-4*a1*b1*k2*p1+4*a1*k1*k2*p1+a1^3*p2+a1*a2^2*p2-a1^2*b1*p2+a2^2*b1*p2-2*a1*a2*b2*p2+2*a1^2*k1*p2-2*a2^2*k1*p2+4*a2*b2*k1*p2+4*a1*a2*k2*p2-4*a2*b1*k2*p2+4*a2*k1*k2*p2-2*a1^2*p1*p2-2*a2^2*p1*p2+2*a1*b1*p1*p2-2*a2*b2*p1*p2-4*a1*k1*p1*p2+4*a2*k2*p1*p2+2*a2*b1*p2^2+2*a1*b2*p2^2-4*a2*k1*p2^2-4*a1*k2*p2^2-2*a1*a2*r^2-a2*b1*r^2-a1*b2*r^2+2*a2*k1*r^2-2*b2*k1*r^2+2*a1*k2*r^2+2*b1*k2*r^2-2*k1*k2*r^2+a2*p1*r^2+b2*p1*r^2-2*k2*p1*r^2+a1*p2*r^2-b1*p2*r^2+2*k1*p2*r^2) * hB + (-a1^2*a2*b1-a2^3*b1-a1^3*b2-a1*a2^2*b2-2*a1^2*b1*b2+2*a2^2*b1*b2-4*a1*a2*b2^2+a1^2*a2*p1+a2^3*p1-2*a1*a2*b1*p1+a1^2*b2*p1-a2^2*b2*p1+4*a1*b1*b2*p1+4*a2*b2^2*p1+4*a2*b1*p1^2-4*b1*b2*p1^2+a1^3*p2+a1*a2^2*p2+3*a1^2*b1*p2+a2^2*b1*p2+2*a1*a2*b2*p2-4*a2*b1*b2*p2+4*a1*b2^2*p2-2*a1^2*p1*p2-2*a2^2*p1*p2-2*a1*b1*p1*p2+2*a2*b2*p1*p2-4*b2^2*p1*p2+2*a2*b1*p2^2-2*a1*b2*p2^2+2*a1*a2*r^2-a2*b1*r^2+a1*b2*r^2+2*b1*b2*r^2-3*a2*p1*r^2-b2*p1*r^2-3*a1*p2*r^2-b1*p2*r^2+4*p1*p2*r^2) * hK + (-2*a1*a2*b1^2-a2*b1^3+4*a1^2*b1*b2-a1*b1^2*b2+2*a1*a2*b2^2-a2*b1*b2^2-a1*b2^3+4*a1*a2*b1*k1+2*a2*b1^2*k1-4*a1^2*b2*k1-2*a1*b1*b2*k1-2*b1^2*b2*k1-2*b2^3*k1-2*a1*a2*k1^2-a2*b1*k1^2+a1*b2*k1^2+2*b1*b2*k1^2-4*a1^2*b1*k2+2*a1*b1^2*k2+2*b1^3*k2-4*a1*a2*b2*k2+2*a2*b1*b2*k2+2*b1*b2^2*k2+4*a1^2*k1*k2-2*a1*b1*k1*k2-2*b1^2*k1*k2+2*a2*b2*k1*k2-2*b2^2*k1*k2+2*a1*a2*k2^2-3*a2*b1*k2^2-a1*b2*k2^2+2*b1*b2*k2^2+a2*b1^2*p1-2*a1*b1*b2*p1+b1^2*b2*p1-a2*b2^2*p1+b2^3*p1-4*a2*b1*k1*p1+2*a1*b2*k1*p1+2*b1*b2*k1*p1+a2*k1^2*p1-b2*k1^2*p1+2*a1*b1*k2*p1-2*b1^2*k2*p1-2*a1*k1*k2*p1+2*b1*k1*k2*p1-a2*k2^2*p1+b2*k2^2*p1+a1*b1^2*p2-b1^3*p2+2*a2*b1*b2*p2-a1*b2^2*p2-b1*b2^2*p2+2*b1^2*k1*p2-2*a2*b2*k1*p2+4*b2^2*k1*p2+a1*k1^2*p2-b1*k1^2*p2-2*a2*b1*k2*p2+4*a1*b2*k2*p2-2*b1*b2*k2*p2+2*a2*k1*k2*p2-2*b2*k1*k2*p2-a1*k2^2*p2+b1*k2^2*p2+2*a2*b1*r^2+2*a1*b2*r^2-4*b1*b2*r^2-2*a2*k1*r^2+4*b2*k1*r^2+2*a2*p1*r^2-2*b2*p1*r^2-2*a1*p2*r^2+2*b1*p2*r^2-2*k1*p2*r^2) * hP + (-2*a1*b1*b2*k1-2*a2*b2^2*k1+2*a2*b1*b2*k2-2*a1*b2^2*k2-2*a2*b1*k1*p1+2*b1*b2*k1*p1-2*a2*b2*k2*p1+2*b2^2*k2*p1+2*a1*b1*k1*p2+2*b2^2*k1*p2+2*a1*b2*k2*p2-2*b1*b2*k2*p2-2*a2*b1*r^2+2*a1*b2*r^2+2*a2*k1*r^2+2*a2*p1*r^2-2*b2*p1*r^2-2*a1*p2*r^2+2*b1*p2*r^2-2*k1*p2*r^2) * hMid

/-- Coordinate form, centre at the origin. -/
private lemma signedArea2_coord_eq_zero_of_arcMidpoint
    (a1 a2 b1 b2 k1 k2 p1 p2 x y r : ℝ)
    (hA : a1 ^ 2 + a2 ^ 2 = r ^ 2)
    (hB : b1 ^ 2 + b2 ^ 2 = r ^ 2)
    (hK : k1 ^ 2 + k2 ^ 2 = r ^ 2)
    (hP : p1 ^ 2 + p2 ^ 2 = r ^ 2)
    (hMid : (k1 - a1) ^ 2 + (k2 - a2) ^ 2 = (k1 - p1) ^ 2 + (k2 - p2) ^ 2)
    (hKR : (k1 - x) ^ 2 + (k2 - y) ^ 2 = (k1 - p1) ^ 2 + (k2 - p2) ^ 2)
    (hBR : (b1 - x) ^ 2 + (b2 - y) ^ 2 = (b1 - p1) ^ 2 + (b2 - p2) ^ 2)
    (hRP : (x - p1) ^ 2 + (y - p2) ^ 2 ≠ 0)
    (hBK : (b1 - k1) ^ 2 + (b2 - k2) ^ 2 ≠ 0)
    (hAP : (a1 - p1) ^ 2 + (a2 - p2) ^ 2 ≠ 0) :
    (b1 - a1) * (y - a2) - (x - a1) * (b2 - a2) = 0 := by
  -- `R - P` is orthogonal to the line of centres `B - K`.
  have hOrth : (x - p1) * (b1 - k1) + (y - p2) * (b2 - k2) = 0 := by
    linear_combination hKR / 2 - hBR / 2
  -- `R - P` is orthogonal to `R + P - 2K`.
  have hMR : (x - p1) * (x + p1 - 2 * k1) + (y - p2) * (y + p2 - 2 * k2) = 0 := by
    linear_combination hKR
  -- In the plane, `R ≠ P` forces those two orthogonal vectors to be parallel.
  have hv : x - p1 ≠ 0 ∨ y - p2 ≠ 0 := by
    by_contra hc
    push_neg at hc
    exact hRP (by rw [hc.1, hc.2]; ring)
  have hCross :
      (b1 - k1) * (y + p2 - 2 * k2) - (b2 - k2) * (x + p1 - 2 * k1) = 0 := by
    rcases hv with h | h
    · refine mul_left_cancel₀ h ?_
      linear_combination (y + p2 - 2 * k2) * hOrth - (b2 - k2) * hMR
    · refine mul_left_cancel₀ h ?_
      linear_combination (b1 - k1) * hMR - (x + p1 - 2 * k1) * hOrth
  -- `‖u‖² • m = (m ⬝ u) • u + cross u m • uᗮ`, with the cross term now zero.
  have hW1 : ((b1 - k1) ^ 2 + (b2 - k2) ^ 2) * (x - k1) = (2 * ((p1 - k1) * (b1 - k1) + (p2 - k2) * (b2 - k2)) * (b1 - k1) - ((b1 - k1) ^ 2 + (b2 - k2) ^ 2) * (p1 - k1)) := by
    linear_combination (b1 - k1) * hOrth - (b2 - k2) * hCross
  have hW2 : ((b1 - k1) ^ 2 + (b2 - k2) ^ 2) * (y - k2) = (2 * ((p1 - k1) * (b1 - k1) + (p2 - k2) * (b2 - k2)) * (b2 - k2) - ((b1 - k1) ^ 2 + (b2 - k2) ^ 2) * (p2 - k2)) := by
    linear_combination (b2 - k2) * hOrth + (b1 - k1) * hCross
  -- The certificate, divided by the nonzero squared distance `A P`.
  have htgt : (((b1 - k1) ^ 2 + (b2 - k2) ^ 2) * ((b1 - a1) * (k2 - a2) - (k1 - a1) * (b2 - a2)) + ((b1 - a1) * (2 * ((p1 - k1) * (b1 - k1) + (p2 - k2) * (b2 - k2)) * (b2 - k2) - ((b1 - k1) ^ 2 + (b2 - k2) ^ 2) * (p2 - k2)) - (2 * ((p1 - k1) * (b1 - k1) + (p2 - k2) * (b2 - k2)) * (b1 - k1) - ((b1 - k1) ^ 2 + (b2 - k2) ^ 2) * (p1 - k1)) * (b2 - a2))) = 0 := by
    have h := arcMidpoint_certificate a1 a2 b1 b2 k1 k2 p1 p2 r hA hB hK hP hMid
    exact (mul_eq_zero.mp h).resolve_right hAP
  -- `‖B - K‖²` times the signed area is exactly that quantity.
  have hkey : ((b1 - k1) ^ 2 + (b2 - k2) ^ 2) * ((b1 - a1) * (y - a2) - (x - a1) * (b2 - a2)) = 0 := by
    rw [← htgt]; linear_combination (b1 - a1) * hW2 - (b2 - a2) * hW1
  exact (mul_eq_zero.mp hkey).resolve_left hBK

/-- **Arc-midpoint reflection collinearity.**  `A`, `B`, `K`, `P` lie on the
circle of centre `O` and radius `r`; `K` is equidistant from `A` and `P`, so it
is a midpoint of one of the two arcs cut by the chord `A P`; and `R` is the
second point lying at distance `dist K P` from `K` and `dist B P` from `B`.
Then `A`, `B`, `R` are collinear. -/
theorem signedArea2_eq_zero_of_arcMidpoint_twoCircle
    {O A B K P R : ℝ²} {r : ℝ}
    (hA : dist A O = r) (hB : dist B O = r) (hK : dist K O = r)
    (hP : dist P O = r)
    (hmid : dist K A = dist K P)
    (hKR : dist K R = dist K P) (hBR : dist B R = dist B P)
    (hRP : R ≠ P) (hBK : B ≠ K) (hAP : A ≠ P) :
    signedArea2 A B R = 0 := by
  have sq : ∀ u v : ℝ², dist u v ^ 2 = (u 0 - v 0) ^ 2 + (u 1 - v 1) ^ 2 :=
    dist_sq_coord
  have hA' : (A 0 - O 0) ^ 2 + (A 1 - O 1) ^ 2 = r ^ 2 := by rw [← sq, hA]
  have hB' : (B 0 - O 0) ^ 2 + (B 1 - O 1) ^ 2 = r ^ 2 := by rw [← sq, hB]
  have hK' : (K 0 - O 0) ^ 2 + (K 1 - O 1) ^ 2 = r ^ 2 := by rw [← sq, hK]
  have hP' : (P 0 - O 0) ^ 2 + (P 1 - O 1) ^ 2 = r ^ 2 := by rw [← sq, hP]
  have hmid' : (K 0 - A 0) ^ 2 + (K 1 - A 1) ^ 2
      = (K 0 - P 0) ^ 2 + (K 1 - P 1) ^ 2 := by rw [← sq, ← sq, hmid]
  have hKR' : (K 0 - R 0) ^ 2 + (K 1 - R 1) ^ 2
      = (K 0 - P 0) ^ 2 + (K 1 - P 1) ^ 2 := by rw [← sq, ← sq, hKR]
  have hBR' : (B 0 - R 0) ^ 2 + (B 1 - R 1) ^ 2
      = (B 0 - P 0) ^ 2 + (B 1 - P 1) ^ 2 := by rw [← sq, ← sq, hBR]
  have hRP' : (R 0 - P 0) ^ 2 + (R 1 - P 1) ^ 2 ≠ 0 := by
    rw [← sq]; exact pow_ne_zero 2 (dist_ne_zero.mpr hRP)
  have hBK' : (B 0 - K 0) ^ 2 + (B 1 - K 1) ^ 2 ≠ 0 := by
    rw [← sq]; exact pow_ne_zero 2 (dist_ne_zero.mpr hBK)
  have hAP' : (A 0 - P 0) ^ 2 + (A 1 - P 1) ^ 2 ≠ 0 := by
    rw [← sq]; exact pow_ne_zero 2 (dist_ne_zero.mpr hAP)
  have main := signedArea2_coord_eq_zero_of_arcMidpoint
    (A 0 - O 0) (A 1 - O 1) (B 0 - O 0) (B 1 - O 1) (K 0 - O 0) (K 1 - O 1)
    (P 0 - O 0) (P 1 - O 1) (R 0 - O 0) (R 1 - O 1) r
    hA' hB' hK' hP'
    (by linear_combination hmid') (by linear_combination hKR')
    (by linear_combination hBR')
    (fun h => hRP' (by linear_combination h))
    (fun h => hBK' (by linear_combination h))
    (fun h => hAP' (by linear_combination h))
  unfold signedArea2
  linear_combination main

/-- **Consumer form.**  A convex-independent carrier cannot hold the
configuration.  `a`, `b`, `k`, `p` lie on the circle of centre `o` and radius
`r`; `k` is equidistant from `a` and `p`; and `q` is a second point at distance
`dist k p` from `k` and `dist b p` from `b`.  Then `a`, `b`, `q` are collinear,
which three distinct points of a convex-independent set cannot be.

This is the shape the TriApex leaf consumes.  What it still needs from the
source is only the metric data: the four circle memberships, the three
equalities, and the six disequalities. -/
theorem false_of_arcMidpoint_twoCircle_of_convexIndep
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {o a b k p q : ℝ²} {r : ℝ}
    (hamem : a ∈ A) (hbmem : b ∈ A) (hqmem : q ∈ A)
    (ha : dist a o = r) (hb : dist b o = r) (hk : dist k o = r)
    (hp : dist p o = r)
    (hmid : dist k a = dist k p)
    (hkq : dist k q = dist k p) (hbq : dist b q = dist b p)
    (hqp : q ≠ p) (hbk : b ≠ k) (hap : a ≠ p)
    (hab : a ≠ b) (haq : a ≠ q) (hbqne : b ≠ q) :
    False :=
  hA.not_three_collinear hamem hbmem hqmem hab haq hbqne
    (collinear_of_signedArea2_eq_zero _ _ _
      (signedArea2_eq_zero_of_arcMidpoint_twoCircle ha hb hk hp hmid hkq hbq
        hqp hbk hap))

end Problem97
