/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Soundness
import Erdos9796Proof.P97.EndpointCertificate.Variables

/-!
# Endpoint certificate polynomial geometry

This module records reusable sparse-polynomial shapes that occur in the
endpoint certificate generators and proves their real-evaluation meanings.
-/

namespace Problem97

namespace EndpointCertificate

/-- Difference of squared distances from `p` and `q` to a variable center
`c`: `|p - c|^2 - |q - c|^2`, with the common `|c|^2` terms canceled. -/
def sqDistToCenterDiffPoly
    (cx cy px py qx qy : Nat) : Poly :=
  [ term (-2 : Rat) [(cx, 1), (px, 1)],
    term (2 : Rat) [(cx, 1), (qx, 1)],
    term (-2 : Rat) [(cy, 1), (py, 1)],
    term (2 : Rat) [(cy, 1), (qy, 1)],
    term (1 : Rat) [(px, 2)],
    term (1 : Rat) [(py, 2)],
    term (-1 : Rat) [(qx, 2)],
    term (-1 : Rat) [(qy, 2)] ]

/-- Evaluation of `sqDistToCenterDiffPoly`. -/
theorem evalPoly_sqDistToCenterDiffPoly
    (ν : Nat → ℝ) (cx cy px py qx qy : Nat) :
    evalPoly ν (sqDistToCenterDiffPoly cx cy px py qx qy) =
      ((ν px - ν cx) ^ 2 + (ν py - ν cy) ^ 2) -
        ((ν qx - ν cx) ^ 2 + (ν qy - ν cy) ^ 2) := by
  simp [sqDistToCenterDiffPoly, evalPoly, evalTerm, evalMonom, term]
  ring_nf

/-- Equal squared distances to a variable center make
`sqDistToCenterDiffPoly` evaluate to zero. -/
theorem evalPoly_sqDistToCenterDiffPoly_eq_zero_of_sqDist_eq
    (ν : Nat → ℝ) {cx cy px py qx qy : Nat}
    (h :
      (ν px - ν cx) ^ 2 + (ν py - ν cy) ^ 2 =
        (ν qx - ν cx) ^ 2 + (ν qy - ν cy) ^ 2) :
    evalPoly ν (sqDistToCenterDiffPoly cx cy px py qx qy) = 0 := by
  rw [evalPoly_sqDistToCenterDiffPoly, h]
  ring

/-- Difference of squared distances from `p` and `q` to the fixed point
`(1,0)`: `|p - (1,0)|^2 - |q - (1,0)|^2`. -/
def sqDistToUnitXDiffPoly (px py qx qy : Nat) : Poly :=
  [ term (-2 : Rat) [(px, 1)],
    term (2 : Rat) [(qx, 1)],
    term (1 : Rat) [(px, 2)],
    term (1 : Rat) [(py, 2)],
    term (-1 : Rat) [(qx, 2)],
    term (-1 : Rat) [(qy, 2)] ]

/-- Evaluation of `sqDistToUnitXDiffPoly`. -/
theorem evalPoly_sqDistToUnitXDiffPoly
    (ν : Nat → ℝ) (px py qx qy : Nat) :
    evalPoly ν (sqDistToUnitXDiffPoly px py qx qy) =
      ((ν px - 1) ^ 2 + ν py ^ 2) -
        ((ν qx - 1) ^ 2 + ν qy ^ 2) := by
  simp [sqDistToUnitXDiffPoly, evalPoly, evalTerm, evalMonom, term]
  ring_nf

/-- Equal squared distances to `(1,0)` make `sqDistToUnitXDiffPoly`
evaluate to zero. -/
theorem evalPoly_sqDistToUnitXDiffPoly_eq_zero_of_sqDist_eq
    (ν : Nat → ℝ) {px py qx qy : Nat}
    (h :
      (ν px - 1) ^ 2 + ν py ^ 2 =
        (ν qx - 1) ^ 2 + ν qy ^ 2) :
    evalPoly ν (sqDistToUnitXDiffPoly px py qx qy) = 0 := by
  rw [evalPoly_sqDistToUnitXDiffPoly, h]
  ring

/-- Difference of squared norms: `|p|^2 - |q|^2`. -/
def sqNormDiffPoly (px py qx qy : Nat) : Poly :=
  [ term (1 : Rat) [(px, 2)],
    term (1 : Rat) [(py, 2)],
    term (-1 : Rat) [(qx, 2)],
    term (-1 : Rat) [(qy, 2)] ]

/-- Evaluation of `sqNormDiffPoly`. -/
theorem evalPoly_sqNormDiffPoly
    (ν : Nat → ℝ) (px py qx qy : Nat) :
    evalPoly ν (sqNormDiffPoly px py qx qy) =
      (ν px ^ 2 + ν py ^ 2) - (ν qx ^ 2 + ν qy ^ 2) := by
  simp [sqNormDiffPoly, evalPoly, evalTerm, evalMonom, term]
  ring_nf

/-- Equal squared norms make `sqNormDiffPoly` evaluate to zero. -/
theorem evalPoly_sqNormDiffPoly_eq_zero_of_sqNorm_eq
    (ν : Nat → ℝ) {px py qx qy : Nat}
    (h : ν px ^ 2 + ν py ^ 2 = ν qx ^ 2 + ν qy ^ 2) :
    evalPoly ν (sqNormDiffPoly px py qx qy) = 0 := by
  rw [evalPoly_sqNormDiffPoly, h]
  ring

/-- Squared norm minus one: `|p|^2 - 1`. -/
def sqNormMinusOnePoly (px py : Nat) : Poly :=
  [ term (-1 : Rat) [],
    term (1 : Rat) [(px, 2)],
    term (1 : Rat) [(py, 2)] ]

/-- Evaluation of `sqNormMinusOnePoly`. -/
theorem evalPoly_sqNormMinusOnePoly (ν : Nat → ℝ) (px py : Nat) :
    evalPoly ν (sqNormMinusOnePoly px py) = ν px ^ 2 + ν py ^ 2 - 1 := by
  simp [sqNormMinusOnePoly, evalPoly, evalTerm, evalMonom, term]
  ring_nf

/-- Unit squared norm makes `sqNormMinusOnePoly` evaluate to zero. -/
theorem evalPoly_sqNormMinusOnePoly_eq_zero_of_sqNorm_eq_one
    (ν : Nat → ℝ) {px py : Nat} (h : ν px ^ 2 + ν py ^ 2 = 1) :
    evalPoly ν (sqNormMinusOnePoly px py) = 0 := by
  rw [evalPoly_sqNormMinusOnePoly, h]
  ring

/-- One minus squared norm: `1 - |p|^2`. -/
def oneMinusSqNormPoly (px py : Nat) : Poly :=
  [ term (1 : Rat) [],
    term (-1 : Rat) [(px, 2)],
    term (-1 : Rat) [(py, 2)] ]

/-- Evaluation of `oneMinusSqNormPoly`. -/
theorem evalPoly_oneMinusSqNormPoly (ν : Nat → ℝ) (px py : Nat) :
    evalPoly ν (oneMinusSqNormPoly px py) = 1 - (ν px ^ 2 + ν py ^ 2) := by
  simp [oneMinusSqNormPoly, evalPoly, evalTerm, evalMonom, term]
  ring_nf

/-- Unit squared norm makes `oneMinusSqNormPoly` evaluate to zero. -/
theorem evalPoly_oneMinusSqNormPoly_eq_zero_of_sqNorm_eq_one
    (ν : Nat → ℝ) {px py : Nat} (h : ν px ^ 2 + ν py ^ 2 = 1) :
    evalPoly ν (oneMinusSqNormPoly px py) = 0 := by
  rw [evalPoly_oneMinusSqNormPoly, h]
  ring

/-- Squared distance from `(1,0)` minus one: `|p - (1,0)|^2 - 1`. -/
def sqDistToUnitXMinusOnePoly (px py : Nat) : Poly :=
  [ term (-2 : Rat) [(px, 1)],
    term (1 : Rat) [(px, 2)],
    term (1 : Rat) [(py, 2)] ]

/-- Evaluation of `sqDistToUnitXMinusOnePoly`. -/
theorem evalPoly_sqDistToUnitXMinusOnePoly
    (ν : Nat → ℝ) (px py : Nat) :
    evalPoly ν (sqDistToUnitXMinusOnePoly px py) =
      (ν px - 1) ^ 2 + ν py ^ 2 - 1 := by
  simp [sqDistToUnitXMinusOnePoly, evalPoly, evalTerm, evalMonom, term]
  ring_nf

/-- Unit squared distance to `(1,0)` makes `sqDistToUnitXMinusOnePoly`
evaluate to zero. -/
theorem evalPoly_sqDistToUnitXMinusOnePoly_eq_zero_of_sqDist_eq_one
    (ν : Nat → ℝ) {px py : Nat}
    (h : (ν px - 1) ^ 2 + ν py ^ 2 = 1) :
    evalPoly ν (sqDistToUnitXMinusOnePoly px py) = 0 := by
  rw [evalPoly_sqDistToUnitXMinusOnePoly, h]
  ring

/-- One minus squared distance from `(1,0)`: `1 - |p - (1,0)|^2`. -/
def oneMinusSqDistToUnitXPoly (px py : Nat) : Poly :=
  [ term (2 : Rat) [(px, 1)],
    term (-1 : Rat) [(px, 2)],
    term (-1 : Rat) [(py, 2)] ]

/-- Evaluation of `oneMinusSqDistToUnitXPoly`. -/
theorem evalPoly_oneMinusSqDistToUnitXPoly
    (ν : Nat → ℝ) (px py : Nat) :
    evalPoly ν (oneMinusSqDistToUnitXPoly px py) =
      1 - ((ν px - 1) ^ 2 + ν py ^ 2) := by
  simp [oneMinusSqDistToUnitXPoly, evalPoly, evalTerm, evalMonom, term]
  ring_nf

/-- Unit squared distance to `(1,0)` makes `oneMinusSqDistToUnitXPoly`
evaluate to zero. -/
theorem evalPoly_oneMinusSqDistToUnitXPoly_eq_zero_of_sqDist_eq_one
    (ν : Nat → ℝ) {px py : Nat}
    (h : (ν px - 1) ^ 2 + ν py ^ 2 = 1) :
    evalPoly ν (oneMinusSqDistToUnitXPoly px py) = 0 := by
  rw [evalPoly_oneMinusSqDistToUnitXPoly, h]
  ring

/-- Difference between squared norm of `a` and squared distance from `b` to
`a`, with the common `|a|^2` terms canceled. -/
def sqNormFirstMinusSqDistPoly (ax ay bx b_y : Nat) : Poly :=
  [ term (2 : Rat) [(ax, 1), (bx, 1)],
    term (2 : Rat) [(ay, 1), (b_y, 1)],
    term (-1 : Rat) [(bx, 2)],
    term (-1 : Rat) [(b_y, 2)] ]

/-- Evaluation of `sqNormFirstMinusSqDistPoly`. -/
theorem evalPoly_sqNormFirstMinusSqDistPoly
    (ν : Nat → ℝ) (ax ay bx b_y : Nat) :
    evalPoly ν (sqNormFirstMinusSqDistPoly ax ay bx b_y) =
      (ν ax ^ 2 + ν ay ^ 2) -
        ((ν bx - ν ax) ^ 2 + (ν b_y - ν ay) ^ 2) := by
  simp [sqNormFirstMinusSqDistPoly, evalPoly, evalTerm, evalMonom, term]
  ring_nf

/-- Equality between `|a|^2` and `|b - a|^2` makes
`sqNormFirstMinusSqDistPoly` evaluate to zero. -/
theorem evalPoly_sqNormFirstMinusSqDistPoly_eq_zero_of_sqDist_eq
    (ν : Nat → ℝ) {ax ay bx b_y : Nat}
    (h :
      ν ax ^ 2 + ν ay ^ 2 =
        (ν bx - ν ax) ^ 2 + (ν b_y - ν ay) ^ 2) :
    evalPoly ν (sqNormFirstMinusSqDistPoly ax ay bx b_y) = 0 := by
  rw [evalPoly_sqNormFirstMinusSqDistPoly, h]
  ring

/-- Difference between squared distance from `b` to `a` and squared norm of
`a`, with the common `|a|^2` terms canceled. -/
def sqDistMinusSqNormFirstPoly (ax ay bx b_y : Nat) : Poly :=
  [ term (-2 : Rat) [(ax, 1), (bx, 1)],
    term (-2 : Rat) [(ay, 1), (b_y, 1)],
    term (1 : Rat) [(bx, 2)],
    term (1 : Rat) [(b_y, 2)] ]

/-- Evaluation of `sqDistMinusSqNormFirstPoly`. -/
theorem evalPoly_sqDistMinusSqNormFirstPoly
    (ν : Nat → ℝ) (ax ay bx b_y : Nat) :
    evalPoly ν (sqDistMinusSqNormFirstPoly ax ay bx b_y) =
      ((ν bx - ν ax) ^ 2 + (ν b_y - ν ay) ^ 2) -
        (ν ax ^ 2 + ν ay ^ 2) := by
  simp [sqDistMinusSqNormFirstPoly, evalPoly, evalTerm, evalMonom, term]
  ring_nf

/-- Equality between `|b - a|^2` and `|a|^2` makes
`sqDistMinusSqNormFirstPoly` evaluate to zero. -/
theorem evalPoly_sqDistMinusSqNormFirstPoly_eq_zero_of_sqDist_eq
    (ν : Nat → ℝ) {ax ay bx b_y : Nat}
    (h :
      (ν bx - ν ax) ^ 2 + (ν b_y - ν ay) ^ 2 =
        ν ax ^ 2 + ν ay ^ 2) :
    evalPoly ν (sqDistMinusSqNormFirstPoly ax ay bx b_y) = 0 := by
  rw [evalPoly_sqDistMinusSqNormFirstPoly, h]
  ring

/-- Difference between the squared distance from `c` to `p` and the squared
distance from `(1,0)` to `p`: `|c - p|^2 - |(1,0) - p|^2`. -/
def sqDistPointToUnitXDiffPoly (cx cy px py : Nat) : Poly :=
  [ term (-2 : Rat) [(cx, 1), (px, 1)],
    term (2 : Rat) [(px, 1)],
    term (-2 : Rat) [(cy, 1), (py, 1)],
    term (1 : Rat) [(cx, 2)],
    term (1 : Rat) [(cy, 2)],
    term (-1 : Rat) [] ]

/-- Evaluation of `sqDistPointToUnitXDiffPoly`. -/
theorem evalPoly_sqDistPointToUnitXDiffPoly
    (ν : Nat → ℝ) (cx cy px py : Nat) :
    evalPoly ν (sqDistPointToUnitXDiffPoly cx cy px py) =
      ((ν cx - ν px) ^ 2 + (ν cy - ν py) ^ 2) -
        ((1 - ν px) ^ 2 + ν py ^ 2) := by
  simp [sqDistPointToUnitXDiffPoly, evalPoly, evalTerm, evalMonom, term]
  ring_nf

/-- Equal squared distances from `p` to `c` and `(1,0)` make
`sqDistPointToUnitXDiffPoly` evaluate to zero. -/
theorem evalPoly_sqDistPointToUnitXDiffPoly_eq_zero_of_sqDist_eq
    (ν : Nat → ℝ) {cx cy px py : Nat}
    (h :
      (ν cx - ν px) ^ 2 + (ν cy - ν py) ^ 2 =
        (1 - ν px) ^ 2 + ν py ^ 2) :
    evalPoly ν (sqDistPointToUnitXDiffPoly cx cy px py) = 0 := by
  rw [evalPoly_sqDistPointToUnitXDiffPoly, h]
  ring

/-- Difference between the squared distance from `(1,0)` to `p` and the
squared distance from `c` to `p`: `|(1,0) - p|^2 - |c - p|^2`. -/
def sqDistUnitXToPointMinusCenterDistPoly (cx cy px py : Nat) : Poly :=
  [ term (1 : Rat) [],
    term (-2 : Rat) [(px, 1)],
    term (2 : Rat) [(cx, 1), (px, 1)],
    term (2 : Rat) [(cy, 1), (py, 1)],
    term (-1 : Rat) [(cx, 2)],
    term (-1 : Rat) [(cy, 2)] ]

/-- Evaluation of `sqDistUnitXToPointMinusCenterDistPoly`. -/
theorem evalPoly_sqDistUnitXToPointMinusCenterDistPoly
    (ν : Nat → ℝ) (cx cy px py : Nat) :
    evalPoly ν (sqDistUnitXToPointMinusCenterDistPoly cx cy px py) =
      ((1 - ν px) ^ 2 + ν py ^ 2) -
        ((ν cx - ν px) ^ 2 + (ν cy - ν py) ^ 2) := by
  simp [sqDistUnitXToPointMinusCenterDistPoly, evalPoly, evalTerm,
    evalMonom, term]
  ring_nf

/-- Equal squared distances from `p` to `(1,0)` and `c` make
`sqDistUnitXToPointMinusCenterDistPoly` evaluate to zero. -/
theorem evalPoly_sqDistUnitXToPointMinusCenterDistPoly_eq_zero_of_sqDist_eq
    (ν : Nat → ℝ) {cx cy px py : Nat}
    (h :
      (1 - ν px) ^ 2 + ν py ^ 2 =
        (ν cx - ν px) ^ 2 + (ν cy - ν py) ^ 2) :
    evalPoly ν (sqDistUnitXToPointMinusCenterDistPoly cx cy px py) = 0 := by
  rw [evalPoly_sqDistUnitXToPointMinusCenterDistPoly, h]
  ring

/-- Rabinowitsch equation for nonzero squared distance:
`tau * |a - b|^2 - 1`. -/
def rabinowitschSqDistPoly (tau ax ay bx b_y : Nat) : Poly :=
  [ term (-1 : Rat) [],
    term (1 : Rat) [(tau, 1), (ax, 2)],
    term (-2 : Rat) [(tau, 1), (ax, 1), (bx, 1)],
    term (1 : Rat) [(tau, 1), (ay, 2)],
    term (-2 : Rat) [(tau, 1), (ay, 1), (b_y, 1)],
    term (1 : Rat) [(tau, 1), (bx, 2)],
    term (1 : Rat) [(tau, 1), (b_y, 2)] ]

/-- Evaluation of `rabinowitschSqDistPoly`. -/
theorem evalPoly_rabinowitschSqDistPoly
    (ν : Nat → ℝ) (tau ax ay bx b_y : Nat) :
    evalPoly ν (rabinowitschSqDistPoly tau ax ay bx b_y) =
      ν tau *
        ((ν ax - ν bx) ^ 2 + (ν ay - ν b_y) ^ 2) - 1 := by
  simp [rabinowitschSqDistPoly, evalPoly, evalTerm, evalMonom, term]
  ring_nf

/-- The inverse of a nonzero squared distance zeros the Rabinowitsch
polynomial. -/
theorem evalPoly_rabinowitschSqDistPoly_eq_zero_of_inverse
    (ν : Nat → ℝ) {tau ax ay bx b_y : Nat}
    (hτ :
      ν tau = (((ν ax - ν bx) ^ 2 + (ν ay - ν b_y) ^ 2)⁻¹))
    (hne : (ν ax - ν bx) ^ 2 + (ν ay - ν b_y) ^ 2 ≠ 0) :
    evalPoly ν (rabinowitschSqDistPoly tau ax ay bx b_y) = 0 := by
  rw [evalPoly_rabinowitschSqDistPoly, hτ]
  field_simp [hne]
  ring

/-- Rabinowitsch equation for nonzero squared norm:
`tau * |a|^2 - 1`. -/
def rabinowitschSqNormPoly (tau ax ay : Nat) : Poly :=
  [ term (-1 : Rat) [],
    term (1 : Rat) [(tau, 1), (ax, 2)],
    term (1 : Rat) [(tau, 1), (ay, 2)] ]

/-- Evaluation of `rabinowitschSqNormPoly`. -/
theorem evalPoly_rabinowitschSqNormPoly
    (ν : Nat → ℝ) (tau ax ay : Nat) :
    evalPoly ν (rabinowitschSqNormPoly tau ax ay) =
      ν tau * (ν ax ^ 2 + ν ay ^ 2) - 1 := by
  simp [rabinowitschSqNormPoly, evalPoly, evalTerm, evalMonom, term]
  ring_nf

/-- The inverse of a nonzero squared norm zeros the fixed-`.v`
Rabinowitsch polynomial. -/
theorem evalPoly_rabinowitschSqNormPoly_eq_zero_of_inverse
    (ν : Nat → ℝ) {tau ax ay : Nat}
    (hτ : ν tau = ((ν ax ^ 2 + ν ay ^ 2)⁻¹))
    (hne : ν ax ^ 2 + ν ay ^ 2 ≠ 0) :
    evalPoly ν (rabinowitschSqNormPoly tau ax ay) = 0 := by
  rw [evalPoly_rabinowitschSqNormPoly, hτ]
  field_simp [hne]
  ring

/-- The frame equation polynomial `2 * X_x - 1`. -/
def twiceVarMinusOnePoly (x : Nat) : Poly :=
  [ term (2 : Rat) [(x, 1)],
    term (-1 : Rat) [] ]

/-- Evaluation of `twiceVarMinusOnePoly`. -/
theorem evalPoly_twiceVarMinusOnePoly (ν : Nat → ℝ) (x : Nat) :
    evalPoly ν (twiceVarMinusOnePoly x) = 2 * ν x - 1 := by
  simp [twiceVarMinusOnePoly, evalPoly, evalTerm, evalMonom, term]
  ring_nf

/-- The frame equation `ν x = 1 / 2` makes `twiceVarMinusOnePoly` evaluate to
zero. -/
theorem evalPoly_twiceVarMinusOnePoly_eq_zero_of_eq_half
    (ν : Nat → ℝ) {x : Nat} (h : ν x = (1 : ℝ) / 2) :
    evalPoly ν (twiceVarMinusOnePoly x) = 0 := by
  rw [evalPoly_twiceVarMinusOnePoly, h]
  ring

end EndpointCertificate

end Problem97
