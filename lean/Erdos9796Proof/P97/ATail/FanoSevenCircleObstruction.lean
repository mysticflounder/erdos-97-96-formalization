/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Mathlib.Data.Real.Basic
import Mathlib.Tactic

/-!
# The scalar obstruction behind the seven-point Fano-complement configuration

This file isolates the final algebraic contradiction in the normalized rank-four
coordinate argument for the Paley supports
`B i = {i, i + 1, i + 2, i + 4} (mod 7)`.

The second theorem below packages the determinant calculation for the seven
Paley supports.  A geometric application must still choose the first four
lifted points as a basis, prove the displayed coordinates nonzero, and identify
the seven circle dependencies with these determinant hypotheses.
-/

namespace Problem97
namespace FanoSevenCircleObstruction

/-- The normalized Paley-support coordinate relations are incompatible over `ℝ`.

The first three relations imply
`a * g * m = c * h * j`.  The last relation then makes the nonzero product
`c * h * j` equal to zero (using that `2 ≠ 0` in `ℝ`).
-/
theorem coordinate_relations_incompatible
    (a b c f g h j k m : ℝ)
    (ha : a ≠ 0) (hb : b ≠ 0) (hc : c ≠ 0)
    (hf : f ≠ 0) (hg : g ≠ 0) (hh : h ≠ 0)
    (hj : j ≠ 0) (hk : k ≠ 0) (hm : m ≠ 0)
    (hak : a * k = b * j)
    (hbg : b * g = c * f)
    (hhk : h * k = f * m)
    (hsum : a * g * m + c * h * j = 0) :
    False := by
  have hproduct : f * (a * g * m - c * h * j) = 0 := by
    linear_combination g * h * hak - a * g * hhk + h * j * hbg
  have hdifference : a * g * m - c * h * j = 0 :=
    (mul_eq_zero.mp hproduct).resolve_left hf
  have hequal : a * g * m = c * h * j := sub_eq_zero.mp hdifference
  have hnonzero : a * b * c * f * g * h * j * k * m ≠ 0 := by
    exact mul_ne_zero
      (mul_ne_zero
        (mul_ne_zero
          (mul_ne_zero
            (mul_ne_zero
              (mul_ne_zero
                (mul_ne_zero
                  (mul_ne_zero ha hb) hc) hf) hg) hh) hj) hk) hm
  rw [hequal] at hsum
  have hzero : c * h * j = 0 := by linarith
  apply hnonzero
  calc
    a * b * c * f * g * h * j * k * m = (a * b * f * g * k * m) * (c * h * j) := by ring
    _ = 0 := by rw [hzero, mul_zero]

/-- Seven normalized Paley-support determinant dependencies are incompatible.

The columns in the hypotheses are the normalized basis vectors
`e₀, e₁, e₂, e₃` together with
`v₄ = (a,b,c,d)`, `v₅ = (e,f,g,h)`, and `v₆ = (j,k,l,m)`.
The seven matrices are the four-column supports
`{i, i+1, i+2, i+4}` modulo seven.  Their determinant equations first force
`d = e = l = 0`, and the remaining four equations reduce to
`coordinate_relations_incompatible`.
-/
theorem normalized_paley_determinants_incompatible
    (a b c d e f g h j k l m : ℝ)
    (ha : a ≠ 0) (hb : b ≠ 0) (hc : c ≠ 0)
    (hf : f ≠ 0) (hg : g ≠ 0) (hh : h ≠ 0)
    (hj : j ≠ 0) (hk : k ≠ 0) (hm : m ≠ 0)
    (hB0 : Matrix.det !![1, 0, 0, a; 0, 1, 0, b; 0, 0, 1, c; 0, 0, 0, d] = 0)
    (hB1 : Matrix.det !![0, 0, 0, e; 1, 0, 0, f; 0, 1, 0, g; 0, 0, 1, h] = 0)
    (hB2 : Matrix.det !![0, 0, a, j; 0, 0, b, k; 1, 0, c, l; 0, 1, d, m] = 0)
    (hB3 : Matrix.det !![0, a, e, 1; 0, b, f, 0; 0, c, g, 0; 1, d, h, 0] = 0)
    (hB4 : Matrix.det !![a, e, j, 0; b, f, k, 1; c, g, l, 0; d, h, m, 0] = 0)
    (hB5 : Matrix.det !![e, j, 1, 0; f, k, 0, 0; g, l, 0, 1; h, m, 0, 0] = 0)
    (hB6 : Matrix.det !![j, 1, 0, 0; k, 0, 1, 0; l, 0, 0, 0; m, 0, 0, 1] = 0) :
    False := by
  have hdet0 :
      Matrix.det !![1, 0, 0, a; 0, 1, 0, b; 0, 0, 1, c; 0, 0, 0, d] = d := by
    rw [Matrix.det_succ_row_zero]
    simp [Fin.sum_univ_succ, Matrix.det_fin_three, Fin.succAbove]
  have hd : d = 0 := hdet0.symm.trans hB0
  have hdet1 :
      Matrix.det !![0, 0, 0, e; 1, 0, 0, f; 0, 1, 0, g; 0, 0, 1, h] = -e := by
    rw [Matrix.det_succ_row_zero]
    simp [Fin.sum_univ_succ, Matrix.det_fin_three, Fin.succAbove]
    norm_num
  have he : e = 0 := by linarith [hdet1.symm.trans hB1]
  have hdet6 :
      Matrix.det !![j, 1, 0, 0; k, 0, 1, 0; l, 0, 0, 0; m, 0, 0, 1] = l := by
    rw [Matrix.det_succ_row_zero]
    simp [Fin.sum_univ_succ, Matrix.det_fin_three, Fin.succAbove]
  have hl : l = 0 := hdet6.symm.trans hB6
  subst d
  subst e
  subst l
  have hdet2 :
      Matrix.det !![0, 0, a, j; 0, 0, b, k; 1, 0, c, 0; 0, 1, 0, m] =
        a * k - b * j := by
    rw [Matrix.det_succ_row_zero]
    simp [Fin.sum_univ_succ, Matrix.det_fin_three, Fin.succAbove]
    ring
  have hak : a * k = b * j := by linarith [hdet2.symm.trans hB2]
  have hdet3 :
      Matrix.det !![0, a, 0, 1; 0, b, f, 0; 0, c, g, 0; 1, 0, h, 0] =
        c * f - b * g := by
    rw [Matrix.det_succ_row_zero]
    simp [Fin.sum_univ_succ, Matrix.det_fin_three, Fin.succAbove]
    ring
  have hbg : b * g = c * f := by linarith [hdet3.symm.trans hB3]
  have hdet4 :
      Matrix.det !![a, 0, j, 0; b, f, k, 1; c, g, 0, 0; 0, h, m, 0] =
        a * g * m + c * h * j := by
    rw [Matrix.det_succ_row_zero]
    simp [Fin.sum_univ_succ, Matrix.det_fin_three, Fin.succAbove]
    ring
  have hsum : a * g * m + c * h * j = 0 := hdet4.symm.trans hB4
  have hdet5 :
      Matrix.det !![0, j, 1, 0; f, k, 0, 0; g, 0, 0, 1; h, m, 0, 0] =
        h * k - f * m := by
    rw [Matrix.det_succ_row_zero]
    simp [Fin.sum_univ_succ, Matrix.det_fin_three, Fin.succAbove]
    ring
  have hhk : h * k = f * m := by linarith [hdet5.symm.trans hB5]
  exact coordinate_relations_incompatible a b c f g h j k m
    ha hb hc hf hg hh hj hk hm hak hbg hhk hsum

end FanoSevenCircleObstruction
end Problem97
