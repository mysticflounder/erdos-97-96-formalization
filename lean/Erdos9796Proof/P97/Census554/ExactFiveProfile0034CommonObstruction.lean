/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Exact-five profile 0034 common obstruction

This module isolates the branch-free scalar contradiction mined from the
common physical core of the direct and mirror profile-0034 cells. The public
statement deliberately keeps only the eight signed-area inequalities and four
metric equations used by the proof.
-/

namespace Problem97
namespace Census554
namespace EqualityCore
namespace Profile0034

def cross (ax ay bx byy cx cy : ℝ) : ℝ :=
  (bx - ax) * (cy - ay) - (byy - ay) * (cx - ax)

def qdist (ax ay bx byy : ℝ) : ℝ :=
  (ax - bx) ^ 2 + 3 * (ay - byy) ^ 2

set_option maxHeartbeats 2000000 in
theorem normalized_first_chain_obstruction
    (px py sx sy : ℝ)
    (hUps : 0 < cross 0 0 px py sx sy)
    (hUpa : 0 < cross 0 0 px py (1 / 2) (-1 / 2))
    (hUpO : 0 < cross 0 0 px py 1 0)
    (hpsa : 0 < cross px py sx sy (1 / 2) (-1 / 2))
    (hOap : qdist 1 0 (1 / 2) (-1 / 2) = qdist 1 0 px py)
    (hUOs : qdist 0 0 1 0 = qdist 0 0 sx sy) :
    sx < 1 / 2 ∧ sy < -1 / 2 := by
  norm_num [cross, qdist] at *
  have hpy : py < 0 := by
    exact hUpO
  have hpxpy : px + py < 0 := by
    linarith only [hUpa]
  have hpcircle : px ^ 2 - 2 * px + 3 * py ^ 2 = 0 := by
    nlinarith only [hOap]
  have hscircle : sx ^ 2 + 3 * sy ^ 2 = 1 := by
    linarith only [hUOs]
  have hpy_sq : 0 < py ^ 2 := by
    have hpy_mul : 0 < py * py := mul_pos_of_neg_of_neg hpy hpy
    simpa only [pow_two] using hpy_mul
  have hpx : 0 < px := by
    nlinarith only [hpcircle, hpy_sq]
  have hA : 0 < -3 * py - px := by
    linarith only [hpxpy, hpy]
  have hB : 0 < 3 * (px - py) := by
    linarith only [hpx, hpy]
  have hEshift :
      (-3 * py - px) * sx + 3 * (px - py) * sy + 2 * px =
        (-3 * py - px) * (sx - 1 / 2) +
          3 * (px - py) * (sy + 1 / 2) := by
    ring
  have hcross_relation :
      4 * ((sx - px) * (-1 / 2 - py) - (sy - py) * (1 / 2 - px)) * px =
        (px + py) *
          ((-3 * py - px) * sx + 3 * (px - py) * sy + 2 * px) := by
    linear_combination (sx + sy) * hpcircle
  have hleft_pos :
      0 < 4 * ((sx - px) * (-1 / 2 - py) - (sy - py) * (1 / 2 - px)) * px := by
    have hcross_pos :
        0 < (sx - px) * (-1 / 2 - py) - (sy - py) * (1 / 2 - px) := by
      linarith only [hpsa]
    exact mul_pos (mul_pos (by norm_num) hcross_pos) hpx
  have hprod_pos :
      0 < (px + py) *
        ((-3 * py - px) * sx + 3 * (px - py) * sy + 2 * px) := by
    linarith only [hcross_relation, hleft_pos]
  have hEneg :
      (-3 * py - px) * sx + 3 * (px - py) * sy + 2 * px < 0 := by
    rcases (mul_pos_iff.mp hprod_pos) with h | h
    · exact (not_lt_of_ge (le_of_lt hpxpy) h.1).elim
    · exact h.2
  have hsx : sx < 1 / 2 := by
    by_contra hsx_not
    have hu : 0 ≤ sx - 1 / 2 := by
      linarith only [hsx_not]
    have hv : sy + 1 / 2 < 0 := by
      by_contra hv_not
      have hv_nonneg : 0 ≤ sy + 1 / 2 := by
        linarith only [hv_not]
      have hAu : 0 ≤ (-3 * py - px) * (sx - 1 / 2) :=
        mul_nonneg (le_of_lt hA) hu
      have hBv : 0 ≤ 3 * (px - py) * (sy + 1 / 2) :=
        mul_nonneg (le_of_lt hB) hv_nonneg
      linarith only [hEneg, hEshift, hAu, hBv]
    have hshifted_circle :
        (sx - 1 / 2) ^ 2 + 3 * (sy + 1 / 2) ^ 2 +
            (sx - 1 / 2) - 3 * (sy + 1 / 2) = 0 := by
      nlinarith only [hscircle]
    nlinarith only [hshifted_circle, hu, hv,
      sq_nonneg (sx - 1 / 2), sq_nonneg (sy + 1 / 2)]
  have hsy : sy < -1 / 2 := by
    by_contra hsy_not
    have hv_nonneg : 0 ≤ sy + 1 / 2 := by
      linarith only [hsy_not]
    have hBC_pos :
        0 < 3 * (px - py) * (px * sy - py * sx) := by
      have hcross_pos : 0 < px * sy - py * sx := by
        linarith only [hUps]
      exact mul_pos hB hcross_pos
    have hminus_pxE_pos :
        0 < -px *
          ((-3 * py - px) * sx + 3 * (px - py) * sy + 2 * px) := by
      exact mul_pos_of_neg_of_neg (by linarith) hEneg
    have hcombo_pos :
        0 < 3 * (px - py) * (px * sy - py * sx) -
          px * ((-3 * py - px) * sx + 3 * (px - py) * sy + 2 * px) := by
      linarith only [hBC_pos, hminus_pxE_pos]
    have hcombo_identity :
        3 * (px - py) * (px * sy - py * sx) -
            px * ((-3 * py - px) * sx + 3 * (px - py) * sy + 2 * px) =
          2 * px * (sx - px) := by
      linear_combination sx * hpcircle
    have hpx_ltsx : px < sx := by
      rw [hcombo_identity] at hcombo_pos
      rcases (mul_pos_iff.mp hcombo_pos) with h | h
      · linarith only [h.2]
      · linarith only [h.1, hpx]
    have hsx_pos : 0 < sx := lt_trans hpx hpx_ltsx
    have hw_pos : 0 < 1 / 2 - sx := by
      linarith only [hsx]
    have hw_lt_half : 1 / 2 - sx < 1 / 2 := by
      linarith only [hsx_pos]
    have hshifted_circle :
        3 * (sy + 1 / 2) * (sy + 1 / 2 - 1) =
          (1 / 2 - sx) * (1 - (1 / 2 - sx)) := by
      nlinarith only [hscircle]
    have hright_pos :
        0 < (1 / 2 - sx) * (1 - (1 / 2 - sx)) := by
      exact mul_pos hw_pos (by linarith only [hw_lt_half])
    have hv_prod_pos :
        0 < (sy + 1 / 2) * (sy + 1 / 2 - 1) := by
      nlinarith only [hshifted_circle, hright_pos]
    have hv_one : 1 < sy + 1 / 2 := by
      rcases (mul_pos_iff.mp hv_prod_pos) with h | h
      · linarith only [h.2]
      · exact (not_lt_of_ge hv_nonneg h.1).elim
    have hAw :
        (-3 * py - px) * (1 / 2 - sx) < (-3 * py - px) * (1 / 2) := by
      exact mul_lt_mul_of_pos_left hw_lt_half hA
    have hAhalf_lt_B :
        (-3 * py - px) * (1 / 2) < 3 * (px - py) := by
      linarith only [hpx, hpy]
    have hB_lt_Bv :
        3 * (px - py) < 3 * (px - py) * (sy + 1 / 2) := by
      nlinarith only [mul_lt_mul_of_pos_left hv_one hB]
    have hEpos_shift :
        0 < (-3 * py - px) * (sx - 1 / 2) +
          3 * (px - py) * (sy + 1 / 2) := by
      linarith only [hAw, hAhalf_lt_B, hB_lt_Bv]
    linarith only [hEneg, hEshift, hEpos_shift]
  constructor
  · exact hsx
  · linarith [hsy]

set_option maxHeartbeats 2000000 in
theorem normalized_common_obstruction
    (px py sx sy dx dy cx cy : ℝ)
    (hUps : 0 < cross 0 0 px py sx sy)
    (hUpa : 0 < cross 0 0 px py (1 / 2) (-1 / 2))
    (hUpc : 0 < cross 0 0 px py cx cy)
    (hUpO : 0 < cross 0 0 px py 1 0)
    (hpsa : 0 < cross px py sx sy (1 / 2) (-1 / 2))
    (hadU : 0 < cross (1 / 2) (-1 / 2) dx dy 0 0)
    (hads : 0 < cross (1 / 2) (-1 / 2) dx dy sx sy)
    (hdcU : 0 < cross dx dy cx cy 0 0)
    (hOad : qdist 1 0 (1 / 2) (-1 / 2) = qdist 1 0 dx dy)
    (hOap : qdist 1 0 (1 / 2) (-1 / 2) = qdist 1 0 px py)
    (hUOs : qdist 0 0 1 0 = qdist 0 0 sx sy)
    (hcOa : qdist cx cy 1 0 = qdist cx cy (1 / 2) (-1 / 2)) :
    False := by
  have hchain := normalized_first_chain_obstruction px py sx sy
    hUps hUpa hUpO hpsa hOap hUOs
  rcases hchain with ⟨hsx, hsy⟩
  norm_num [cross, qdist] at hUps hUpa hUpc hUpO hpsa hadU hads hdcU hOad hOap hUOs hcOa hsx hsy
  have hpy : py < 0 := by
    exact hUpO
  have hpxpy : px + py < 0 := by
    linarith only [hUpa]
  have hpx3py : px + 3 * py < 0 := by
    linarith only [hpxpy, hpy]
  have hcline : cx + 3 * cy = 0 := by
    nlinarith only [hcOa]
  have hcx : cx = -3 * cy := by
    linarith
  have hUpc_factored : 0 < cy * (px + 3 * py) := by
    rw [hcx] at hUpc
    nlinarith only [hUpc]
  have hcy : cy < 0 := by
    rcases (mul_pos_iff.mp hUpc_factored) with h | h
    · exact (not_lt_of_ge (le_of_lt hpx3py) h.2).elim
    · exact h.1
  have hdc_factored : 0 < cy * (dx + 3 * dy) := by
    rw [hcx] at hdcU
    nlinarith only [hdcU]
  have hdx3dy : dx + 3 * dy < 0 := by
    rcases (mul_pos_iff.mp hdc_factored) with h | h
    · exact (not_lt_of_ge (le_of_lt hcy) h.1).elim
    · exact h.2
  have hdxdy : 0 < dx + dy := by
    linarith only [hadU]
  have hdy : dy < 0 := by
    linarith only [hdxdy, hdx3dy]
  have hdx : 0 < dx := by
    linarith only [hdxdy, hdy]
  have hdcircle : dx ^ 2 - 2 * dx + 3 * dy ^ 2 = 0 := by
    nlinarith only [hOad]
  have hdx_minus_dy : 0 < dx - dy := by
    linarith
  have hfirst_term_neg :
      3 * (dx - dy) * (sy + 1 / 2) < 0 := by
    exact mul_neg_of_pos_of_neg (mul_pos (by norm_num) hdx_minus_dy) (by linarith)
  have hsecond_term_pos :
      0 < (dx + 3 * dy) * (sx - 1 / 2) := by
    exact mul_pos_of_neg_of_neg hdx3dy (by linarith)
  have hbracket_neg :
      3 * (dx - dy) * (sy + 1 / 2) -
          (dx + 3 * dy) * (sx - 1 / 2) < 0 := by
    linarith
  have hright_neg :
      (dx + dy) *
          (3 * (dx - dy) * (sy + 1 / 2) -
            (dx + 3 * dy) * (sx - 1 / 2)) < 0 := by
    exact mul_neg_of_pos_of_neg hdxdy hbracket_neg
  have hfactor_identity :
      4 * dx *
          ((dx - 1 / 2) * (sy + 1 / 2) -
            (dy + 1 / 2) * (sx - 1 / 2)) =
        (dx + dy) *
          (3 * (dx - dy) * (sy + 1 / 2) -
            (dx + 3 * dy) * (sx - 1 / 2)) := by
    linear_combination (sx + sy) * hdcircle
  have hleft_pos :
      0 < 4 * dx *
        ((dx - 1 / 2) * (sy + 1 / 2) -
          (dy + 1 / 2) * (sx - 1 / 2)) := by
    have hcross_pos :
        0 < (dx - 1 / 2) * (sy + 1 / 2) -
          (dy + 1 / 2) * (sx - 1 / 2) := by
      linarith only [hads]
    exact mul_pos (mul_pos (by norm_num) hdx) hcross_pos
  rw [hfactor_identity] at hleft_pos
  linarith only [hleft_pos, hright_neg]

end Profile0034
end EqualityCore
end Census554
end Problem97
