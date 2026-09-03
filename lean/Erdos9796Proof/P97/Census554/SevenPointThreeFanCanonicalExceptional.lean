/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EquilateralThreeFanCollision

/-!
# Canonical exceptional-order scalar obstruction for the seven-point three-fan

The finite cyclic-order reduction leaves one order whose small orientation
constraints are represented by four positive parameters.  This file records
the final scalar contradiction separately from the still-missing finite-order
adapter.
-/

namespace Problem97
namespace Census554
namespace EqualityCore

/-- The canonical exceptional-order inequalities are inconsistent.

The two expressions named `E₀` and `E₁` are the signed-area inequalities for
the two small triples adjacent to the reflected point `C`.  The two displayed
identities force both quadratic bracket factors to be negative, while the two
positive orientation factors force their product to be larger than
`h² v²`.  These conclusions cannot hold simultaneously.
-/
theorem false_of_threeFan_canonical_exceptional_order_scalar
    {a h u v : ℝ}
    (ha_pos : 0 < a)
    (ha_lt_one : a < 1)
    (hu_pos : 0 < u)
    (hu_lt_one : u < 1)
    (ha_lt_u : a < u)
    (hAXY : 0 < a * u - h * v)
    (hAYZ : 0 < (1 - a) * (1 - u) - h * v)
    (hE₀ : a * (u ^ 2 + v ^ 2) - u * (a ^ 2 + h ^ 2) < 0)
    (hE₁ :
      (1 - u) * ((1 - a) ^ 2 + h ^ 2) -
        (1 - a) * ((1 - u) ^ 2 + v ^ 2) < 0)
    (hh_pos : 0 < h)
    (hv_pos : 0 < v) :
    False := by
  have h1_pos : 0 < 1 - a := sub_pos.mpr ha_lt_one
  have h1u_pos : 0 < 1 - u := by linarith
  have hleft₀ :
      (1 - a) * (a * (u ^ 2 + v ^ 2) - u * (a ^ 2 + h ^ 2)) +
          a * ((1 - u) * ((1 - a) ^ 2 + h ^ 2) -
            (1 - a) * ((1 - u) ^ 2 + v ^ 2)) < 0 := by
    have hterm₀ :
        (1 - a) * (a * (u ^ 2 + v ^ 2) - u * (a ^ 2 + h ^ 2)) < 0 :=
      mul_neg_of_pos_of_neg h1_pos hE₀
    have hterm₁ :
        a * ((1 - u) * ((1 - a) ^ 2 + h ^ 2) -
            (1 - a) * ((1 - u) ^ 2 + v ^ 2)) < 0 :=
      mul_neg_of_pos_of_neg ha_pos hE₁
    nlinarith
  have hleft₁ :
      (1 - u) * (a * (u ^ 2 + v ^ 2) - u * (a ^ 2 + h ^ 2)) +
          u * ((1 - u) * ((1 - a) ^ 2 + h ^ 2) -
            (1 - a) * ((1 - u) ^ 2 + v ^ 2)) < 0 := by
    have hterm₀ :
        (1 - u) * (a * (u ^ 2 + v ^ 2) - u * (a ^ 2 + h ^ 2)) < 0 :=
      mul_neg_of_pos_of_neg h1u_pos hE₀
    have hterm₁ :
        u * ((1 - u) * ((1 - a) ^ 2 + h ^ 2) -
            (1 - a) * ((1 - u) ^ 2 + v ^ 2)) < 0 :=
      mul_neg_of_pos_of_neg hu_pos hE₁
    nlinarith
  have hid₀ :
      (1 - a) * (a * (u ^ 2 + v ^ 2) - u * (a ^ 2 + h ^ 2)) +
          a * ((1 - u) * ((1 - a) ^ 2 + h ^ 2) -
            (1 - a) * ((1 - u) ^ 2 + v ^ 2)) =
        (u - a) * (a * (1 - a) - h ^ 2) := by
    ring
  have hid₁ :
      (1 - u) * (a * (u ^ 2 + v ^ 2) - u * (a ^ 2 + h ^ 2)) +
          u * ((1 - u) * ((1 - a) ^ 2 + h ^ 2) -
            (1 - a) * ((1 - u) ^ 2 + v ^ 2)) =
        (u - a) * (u * (1 - u) - v ^ 2) := by
    ring
  have hbracket₀ : a * (1 - a) - h ^ 2 < 0 := by
    by_contra hnot
    have hnonneg : 0 ≤ a * (1 - a) - h ^ 2 := le_of_not_gt hnot
    have hprod_nonneg :
        0 ≤ (u - a) * (a * (1 - a) - h ^ 2) :=
      mul_nonneg (le_of_lt (sub_pos.mpr ha_lt_u)) hnonneg
    nlinarith [hleft₀, hid₀]
  have hbracket₁ : u * (1 - u) - v ^ 2 < 0 := by
    by_contra hnot
    have hnonneg : 0 ≤ u * (1 - u) - v ^ 2 := le_of_not_gt hnot
    have hprod_nonneg :
        0 ≤ (u - a) * (u * (1 - u) - v ^ 2) :=
      mul_nonneg (le_of_lt (sub_pos.mpr ha_lt_u)) hnonneg
    nlinarith [hleft₁, hid₁]
  have hhv_pos : 0 < h * v := mul_pos hh_pos hv_pos
  have hcross_left : h * v < a * u := by linarith
  have hcross_right : h * v < (1 - a) * (1 - u) := by linarith
  have hau_pos : 0 < a * u :=
    lt_of_lt_of_le hhv_pos (le_of_lt hcross_left)
  have hmul₀ : (h * v) * (h * v) < (a * u) * (h * v) :=
    mul_lt_mul_of_pos_right hcross_left hhv_pos
  have hmul₁ :
      (a * u) * (h * v) < (a * u) * ((1 - a) * (1 - u)) :=
    mul_lt_mul_of_pos_left hcross_right hau_pos
  have hcross :
      (h * v) * (h * v) < (a * u) * ((1 - a) * (1 - u)) :=
    lt_trans hmul₀ hmul₁
  have hupper₀ : a * (1 - a) ≤ h ^ 2 := by linarith
  have hupper₁ : u * (1 - u) ≤ v ^ 2 := by linarith
  have hnonneg_u : 0 ≤ u * (1 - u) :=
    mul_nonneg (le_of_lt hu_pos) (le_of_lt h1u_pos)
  have hprod₀ :
      a * (1 - a) * (u * (1 - u)) ≤ h ^ 2 * (u * (1 - u)) :=
    mul_le_mul_of_nonneg_right hupper₀ hnonneg_u
  have hprod₁ : h ^ 2 * (u * (1 - u)) ≤ h ^ 2 * v ^ 2 :=
    mul_le_mul_of_nonneg_left hupper₁ (sq_nonneg h)
  have hprod :
      a * (1 - a) * (u * (1 - u)) ≤ h ^ 2 * v ^ 2 :=
    le_trans hprod₀ hprod₁
  nlinarith [hcross, hprod]

end EqualityCore
end Census554
end Problem97
