/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.U2.SimilarityNormalization

/-!
# Thirteen-point seven-circle collision core

This file isolates the seven equal-radius rows in the thirteen-label packet
found by the first-nonhit search.  The search only discovered the motif: the
proof below is a standalone Euclidean incompatibility, followed by a generic
`RowPattern`/`Realizes` adapter through `EdgeClosure`.

Discovery provenance: the labeled packet is recorded in
`scratch/p97-consumer-first/freshthird_firstnonhit_exact3_metric_canary_v1/input.json`
(SHA-256 `b0891ba0969d73261bec65cd7debd0fbbe0900deab6b7432d3b75204b4263230`).
The seven-row subset was isolated in
`scratch/p97-consumer-first/freshthird_firstnonhit_exact3_row_core_v3/results.json`
(SHA-256 `da8456866c77f6061ad0f0c17ae2c1aff88d9e5b405ebc9fef43abb36f6ed862`).
These artifacts are discovery evidence only; the declarations below are proved
directly in Lean and do not trust either solver result.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

private lemma epsilon_t_sq
    (epsilon t : ℝ) (hepsilon : epsilon ^ 2 = 1) (ht : t ^ 2 = 3) :
    (epsilon * t) ^ 2 = 3 := by
  rw [mul_pow, hepsilon, ht]
  norm_num

private lemma first_coefficient_sq
    (epsilon t : ℝ) (hepsilon : epsilon ^ 2 = 1) (ht : t ^ 2 = 3) :
    (3 + epsilon * t) ^ 2 = 12 + 6 * (epsilon * t) := by
  calc
    (3 + epsilon * t) ^ 2 =
        9 + 6 * (epsilon * t) + epsilon ^ 2 * t ^ 2 := by ring
    _ = 12 + 6 * (epsilon * t) := by rw [hepsilon, ht]; ring

private lemma second_coefficient_sq
    (epsilon t : ℝ) (hepsilon : epsilon ^ 2 = 1) (ht : t ^ 2 = 3) :
    (5 * epsilon + 3 * t) ^ 2 = 52 + 30 * (epsilon * t) := by
  calc
    (5 * epsilon + 3 * t) ^ 2 =
        25 * epsilon ^ 2 + 30 * (epsilon * t) + 9 * t ^ 2 := by ring
    _ = 52 + 30 * (epsilon * t) := by rw [hepsilon, ht]; ring

private lemma coefficient_product
    (epsilon t : ℝ) (hepsilon : epsilon ^ 2 = 1) (ht : t ^ 2 = 3) :
    (3 + epsilon * t) * (5 * epsilon + 3 * t) = 24 * epsilon + 14 * t := by
  calc
    (3 + epsilon * t) * (5 * epsilon + 3 * t) =
        15 * epsilon + 9 * t + 5 * epsilon ^ 2 * t + 3 * epsilon * t ^ 2 := by
      ring
    _ = 24 * epsilon + 14 * t := by rw [hepsilon, ht]; ring

private theorem branch_quadratic_invariants
    (epsilon t c s : ℝ)
    (hepsilon : epsilon ^ 2 = 1)
    (ht : t ^ 2 = 3)
    (hunit : c ^ 2 + s ^ 2 = 1)
    (hbisector : c + (t - 2 * epsilon) * s = 0) :
    c ^ 2 = (2 - epsilon * t) / 4 ∧
      s ^ 2 = (2 + epsilon * t) / 4 ∧
      c * s = epsilon / 4 := by
  have hc_formula : c = (2 * epsilon - t) * s := by
    linarith
  have hunit' : ((2 * epsilon - t) * s) ^ 2 + s ^ 2 = 1 := by
    rw [← hc_formula]
    exact hunit
  have hcoefficient :
      (2 * epsilon - t) ^ 2 + 1 = 4 * (2 - epsilon * t) := by
    calc
      (2 * epsilon - t) ^ 2 + 1 =
          4 * epsilon ^ 2 - 4 * epsilon * t + t ^ 2 + 1 := by ring
      _ = 4 * (2 - epsilon * t) := by rw [hepsilon, ht]; ring
  have hscaled : 4 * (2 - epsilon * t) * s ^ 2 = 1 := by
    calc
      4 * (2 - epsilon * t) * s ^ 2 =
          ((2 * epsilon - t) ^ 2 + 1) * s ^ 2 := by rw [hcoefficient]
      _ = ((2 * epsilon - t) * s) ^ 2 + s ^ 2 := by ring
      _ = 1 := hunit'
  have het := epsilon_t_sq epsilon t hepsilon ht
  have hconjugates : (2 - epsilon * t) * (2 + epsilon * t) = 1 := by
    nlinarith
  have hnonzero : 2 - epsilon * t ≠ 0 := by
    intro hzero
    rw [hzero] at hconjugates
    norm_num at hconjugates
  have hs : s ^ 2 = (2 + epsilon * t) / 4 := by
    have hfactor :
        (2 - epsilon * t) * (4 * s ^ 2 - (2 + epsilon * t)) = 0 := by
      nlinarith
    rcases mul_eq_zero.mp hfactor with hzero | hrest
    · exact (hnonzero hzero).elim
    · linarith
  have hc : c ^ 2 = (2 - epsilon * t) / 4 := by
    nlinarith
  have hcs : c * s = epsilon / 4 := by
    calc
      c * s = (2 * epsilon - t) * s ^ 2 := by rw [hc_formula]; ring
      _ = (2 * epsilon - t) * ((2 + epsilon * t) / 4) := by rw [hs]
      _ = epsilon / 4 := by
        calc
          (2 * epsilon - t) * ((2 + epsilon * t) / 4) =
              (4 * epsilon + 2 * epsilon ^ 2 * t - 2 * t - epsilon * t ^ 2) / 4 := by
            ring
          _ = epsilon / 4 := by rw [hepsilon, ht]; ring
  exact ⟨hc, hs, hcs⟩

private theorem forced_left_sq
    (epsilon t c s : ℝ)
    (hepsilon : epsilon ^ 2 = 1)
    (ht : t ^ 2 = 3)
    (hc : c ^ 2 = (2 - epsilon * t) / 4)
    (hs : s ^ 2 = (2 + epsilon * t) / 4)
    (hcs : c * s = epsilon / 4) :
    ((3 + epsilon * t) * c + (5 * epsilon + 3 * t) * s) ^ 2 =
      62 + 35 * (epsilon * t) := by
  have hfirst := first_coefficient_sq epsilon t hepsilon ht
  have hsecond := second_coefficient_sq epsilon t hepsilon ht
  have hproduct := coefficient_product epsilon t hepsilon ht
  have het := epsilon_t_sq epsilon t hepsilon ht
  calc
    ((3 + epsilon * t) * c + (5 * epsilon + 3 * t) * s) ^ 2 =
        (3 + epsilon * t) ^ 2 * c ^ 2 +
          (5 * epsilon + 3 * t) ^ 2 * s ^ 2 +
          2 * ((3 + epsilon * t) * (5 * epsilon + 3 * t)) * (c * s) := by
      ring
    _ = (12 + 6 * (epsilon * t)) * ((2 - epsilon * t) / 4) +
          (52 + 30 * (epsilon * t)) * ((2 + epsilon * t) / 4) +
          2 * (24 * epsilon + 14 * t) * (epsilon / 4) := by
      rw [hfirst, hsecond, hproduct, hc, hs, hcs]
    _ = 62 + 35 * (epsilon * t) := by
      nlinarith

private theorem forced_right_sq
    (epsilon t : ℝ)
    (hepsilon : epsilon ^ 2 = 1)
    (ht : t ^ 2 = 3) :
    (4 * (1 + epsilon * t)) ^ 2 = 64 + 32 * (epsilon * t) := by
  have het := epsilon_t_sq epsilon t hepsilon ht
  nlinarith

private theorem residual_conjugate_identity
    (epsilon t c s : ℝ)
    (hepsilon : epsilon ^ 2 = 1)
    (ht : t ^ 2 = 3)
    (hc : c ^ 2 = (2 - epsilon * t) / 4)
    (hs : s ^ 2 = (2 + epsilon * t) / 4)
    (hcs : c * s = epsilon / 4) :
    ((((3 + epsilon * t) * c + (5 * epsilon + 3 * t) * s) ^ 2 -
          (4 * (1 + epsilon * t)) ^ 2) *
        (3 * epsilon * t + 2)) = 23 := by
  rw [forced_left_sq epsilon t c s hepsilon ht hc hs hcs,
    forced_right_sq epsilon t hepsilon ht]
  have het := epsilon_t_sq epsilon t hepsilon ht
  nlinarith

private theorem final_linear_equality_impossible
    (epsilon t c s : ℝ)
    (hepsilon : epsilon ^ 2 = 1)
    (ht : t ^ 2 = 3)
    (hc : c ^ 2 = (2 - epsilon * t) / 4)
    (hs : s ^ 2 = (2 + epsilon * t) / 4)
    (hcs : c * s = epsilon / 4) :
    (3 + epsilon * t) * c + (5 * epsilon + 3 * t) * s ≠
      4 * (1 + epsilon * t) := by
  intro h
  have hsquares :
      ((3 + epsilon * t) * c + (5 * epsilon + 3 * t) * s) ^ 2 =
        (4 * (1 + epsilon * t)) ^ 2 := by
    rw [h]
  have hcertificate :=
    residual_conjugate_identity epsilon t c s hepsilon ht hc hs hcs
  rw [hsquares] at hcertificate
  norm_num at hcertificate

private noncomputable def p11X (t c s : ℝ) : ℝ :=
  1 + (c - t * s) / 2

private noncomputable def p11Y (t c s : ℝ) : ℝ :=
  (t * c + s) / 2

private lemma p11_norm_sq
    (t c s : ℝ)
    (ht : t ^ 2 = 3)
    (hunit : c ^ 2 + s ^ 2 = 1) :
    p11X t c s ^ 2 + p11Y t c s ^ 2 = 2 + c - t * s := by
  calc
    p11X t c s ^ 2 + p11Y t c s ^ 2 =
        1 + c - t * s + ((1 + t ^ 2) * (c ^ 2 + s ^ 2)) / 4 := by
      simp only [p11X, p11Y]
      ring
    _ = 2 + c - t * s := by rw [ht, hunit]; ring

private theorem normalized_k4_membership_forces_linear_equality
    (epsilon t c s A : ℝ)
    (hepsilon : epsilon ^ 2 = 1)
    (ht : t ^ 2 = 3)
    (hunit : c ^ 2 + s ^ 2 = 1)
    (hbisector : c + (t - 2 * epsilon) * s = 0)
    (hp2Circle :
      c ^ 2 + s ^ 2 + A * c - (epsilon + t) * s + epsilon * t = 0)
    (hp11Circle :
      p11X t c s ^ 2 + p11Y t c s ^ 2 + A * p11X t c s -
          (epsilon + t) * p11Y t c s + epsilon * t = 0) :
    (3 + epsilon * t) * c + (5 * epsilon + 3 * t) * s =
      4 * (1 + epsilon * t) := by
  obtain ⟨hc, hs, hcs⟩ :=
    branch_quadratic_invariants epsilon t c s hepsilon ht hunit hbisector
  have hAc0 : A * c = (epsilon + t) * s - 1 - epsilon * t := by
    nlinarith
  have hAc : A * c = (epsilon + t) * (s - epsilon) := by
    calc
      A * c = (epsilon + t) * s - 1 - epsilon * t := hAc0
      _ = (epsilon + t) * (s - epsilon) := by
        calc
          (epsilon + t) * s - 1 - epsilon * t =
              (epsilon + t) * s - epsilon ^ 2 - epsilon * t := by rw [hepsilon]
          _ = (epsilon + t) * (s - epsilon) := by ring
  have hjNorm := p11_norm_sq t c s ht hunit
  have hp11Circle' :
      2 + c - t * s + A * p11X t c s -
          (epsilon + t) * p11Y t c s + epsilon * t = 0 := by
    rw [← hjNorm]
    exact hp11Circle
  have htwice :
      2 * c *
          (2 + c - t * s + A * p11X t c s -
            (epsilon + t) * p11Y t c s + epsilon * t) =
        (3 + epsilon * t) * c + (5 * epsilon + 3 * t) * s -
          4 * (1 + epsilon * t) := by
    calc
      2 * c *
          (2 + c - t * s + A * p11X t c s -
            (epsilon + t) * p11Y t c s + epsilon * t) =
          2 * c * (2 + c - t * s + epsilon * t) +
            (A * c) * (2 + c - t * s) -
            (epsilon + t) * c * (t * c + s) := by
        simp only [p11X, p11Y]
        ring
      _ = 2 * c * (2 + c - t * s + epsilon * t) +
            ((epsilon + t) * (s - epsilon)) * (2 + c - t * s) -
            (epsilon + t) * c * (t * c + s) := by rw [hAc]
      _ = 4 * c + 2 * c ^ 2 - 2 * t * (c * s) + 2 * epsilon * t * c +
            (epsilon + t) *
              (2 * s - 2 * epsilon - epsilon * c - t * (c ^ 2 + s ^ 2) +
                epsilon * t * s) := by ring
      _ = 4 * c + 2 * c ^ 2 - 2 * t * (c * s) + 2 * epsilon * t * c +
            (epsilon + t) *
              (2 * s - 2 * epsilon - epsilon * c - t + epsilon * t * s) := by
        rw [hunit]
        ring
      _ = (3 + epsilon * t) * c + (5 * epsilon + 3 * t) * s -
            4 * (1 + epsilon * t) := by
        rw [hc, hcs]
        field_simp
        ring_nf
        rw [hepsilon, ht]
        ring
  rw [hp11Circle'] at htwice
  linarith

private theorem normalized_k4_membership_impossible
    (epsilon t c s A : ℝ)
    (hepsilon : epsilon ^ 2 = 1)
    (ht : t ^ 2 = 3)
    (hunit : c ^ 2 + s ^ 2 = 1)
    (hbisector : c + (t - 2 * epsilon) * s = 0)
    (hp2Circle :
      c ^ 2 + s ^ 2 + A * c - (epsilon + t) * s + epsilon * t = 0)
    (hp11Circle :
      p11X t c s ^ 2 + p11Y t c s ^ 2 + A * p11X t c s -
          (epsilon + t) * p11Y t c s + epsilon * t = 0) :
    False := by
  have hforced := normalized_k4_membership_forces_linear_equality
    epsilon t c s A hepsilon ht hunit hbisector hp2Circle hp11Circle
  obtain ⟨hc, hs, hcs⟩ :=
    branch_quadratic_invariants epsilon t c s hepsilon ht hunit hbisector
  exact final_linear_equality_impossible
    epsilon t c s hepsilon ht hc hs hcs hforced

private theorem second_circle_intersection_coordinates
    (t c s u v : ℝ)
    (ht : t ^ 2 = 3)
    (hunit : c ^ 2 + s ^ 2 = 1)
    (hs : s ≠ 0)
    (hcircleOne : (u - 1) ^ 2 + v ^ 2 = 1)
    (hcircleD :
      (u - c) ^ 2 + (v - s) ^ 2 =
        (1 / 2 - c) ^ 2 + (t / 2 - s) ^ 2)
    (hneBase : ¬ (u = 1 / 2 ∧ v = t / 2)) :
    u = p11X t c s ∧ v = p11Y t c s := by
  have hline :
      (1 - c) * (u - 1 / 2) - s * (v - t / 2) = 0 := by
    nlinarith
  have hsv : s * v = (1 - c) * (u - 1 / 2) + s * t / 2 := by
    linarith
  have hcircleZero : (u - 1) ^ 2 + v ^ 2 - 1 = 0 := by
    linarith
  have hscaledCircle : s ^ 2 * ((u - 1) ^ 2 + v ^ 2 - 1) = 0 := by
    rw [hcircleZero]
    ring
  have hpolynomial :
      s ^ 2 * ((u - 1) ^ 2 - 1) +
          ((1 - c) * (u - 1 / 2) + s * t / 2) ^ 2 = 0 := by
    calc
      s ^ 2 * ((u - 1) ^ 2 - 1) +
          ((1 - c) * (u - 1 / 2) + s * t / 2) ^ 2 =
          s ^ 2 * ((u - 1) ^ 2 - 1) + (s * v) ^ 2 := by rw [hsv]
      _ = s ^ 2 * ((u - 1) ^ 2 + v ^ 2 - 1) := by ring
      _ = 0 := hscaledCircle
  have hfactorIdentity :
      s ^ 2 * ((u - 1) ^ 2 - 1) +
          ((1 - c) * (u - 1 / 2) + s * t / 2) ^ 2 =
        2 * (1 - c) * (u - 1 / 2) * (u - p11X t c s) := by
    simp only [p11X]
    linear_combination
      ((u - 1 / 2) ^ 2 - (u - 1 / 2)) * hunit + (s ^ 2 / 4) * ht
  have hfactor :
      (1 - c) * (u - 1 / 2) * (u - p11X t c s) = 0 := by
    nlinarith [hpolynomial, hfactorIdentity]
  have hcOne : 1 - c ≠ 0 := by
    intro hc
    have hc' : c = 1 := by linarith
    rw [hc'] at hunit
    have : s = 0 := by nlinarith [sq_nonneg s]
    exact hs this
  have huHalf : u - 1 / 2 ≠ 0 := by
    intro hu
    have hu' : u = 1 / 2 := by linarith
    have hv' : v = t / 2 := by
      rw [hu'] at hline
      have : s * (v - t / 2) = 0 := by linarith
      exact sub_eq_zero.mp ((mul_eq_zero.mp this).resolve_left hs)
    exact hneBase ⟨hu', hv'⟩
  have hu : u = p11X t c s := by
    rcases mul_eq_zero.mp hfactor with hleft | hright
    · rcases mul_eq_zero.mp hleft with hc | hu
      · exact (hcOne hc).elim
      · exact (huHalf hu).elim
    · exact sub_eq_zero.mp hright
  have hvProduct : s * (v - p11Y t c s) = 0 := by
    rw [hu] at hline
    calc
      s * (v - p11Y t c s) =
          -((1 - c) * (p11X t c s - 1 / 2) - s * (v - t / 2)) +
            (1 - (c ^ 2 + s ^ 2)) / 2 := by
        simp only [p11X, p11Y]
        ring
      _ = 0 := by rw [hline, hunit]; norm_num
  have hv : v = p11Y t c s :=
    sub_eq_zero.mp ((mul_eq_zero.mp hvProduct).resolve_left hs)
  exact ⟨hu, hv⟩

private theorem coord_sqdist_eq_of_dist_eq {a b c d : ℝ²}
    (h : dist a b = dist c d) :
    (a 0 - b 0) ^ 2 + (a 1 - b 1) ^ 2 =
      (c 0 - d 0) ^ 2 + (c 1 - d 1) ^ 2 := by
  have hsq := congrArg (fun x : ℝ => x ^ 2) h
  simpa only [Problem97.dist_sq_coord] using hsq

private theorem plane_eq_of_coords {p q : ℝ²}
    (h0 : p 0 = q 0) (h1 : p 1 = q 1) : p = q := by
  ext i
  fin_cases i
  · exact h0
  · exact h1

private theorem normalized_base_frame
    (pointOf : Fin 13 → ℝ²)
    (hinjective : Function.Injective pointOf)
    (h9 : pointOf 8 = pt 0 0)
    (h5 : pointOf 5 = pt 1 0)
    (hK5_53_59 : dist (pointOf 5) (pointOf 3) = dist (pointOf 5) (pointOf 8))
    (hK3_35_39 : dist (pointOf 3) (pointOf 5) = dist (pointOf 3) (pointOf 8))
    (hK1_19_13 : dist (pointOf 1) (pointOf 8) = dist (pointOf 1) (pointOf 3))
    (hK3_31_39 : dist (pointOf 3) (pointOf 1) = dist (pointOf 3) (pointOf 8))
    (hK1_16_13 : dist (pointOf 1) (pointOf 6) = dist (pointOf 1) (pointOf 3))
    (hK3_36_31 : dist (pointOf 3) (pointOf 6) = dist (pointOf 3) (pointOf 1)) :
    ∃ t : ℝ, t ^ 2 = 3 ∧
      pointOf 3 = pt (1 / 2) (t / 2) ∧
      pointOf 1 = pt (-1 / 2) (t / 2) ∧
      pointOf 6 = pt 0 t := by
  have e53_59 := coord_sqdist_eq_of_dist_eq hK5_53_59
  have e35_39 := coord_sqdist_eq_of_dist_eq hK3_35_39
  rw [h5, h9] at e53_59 e35_39
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at e53_59 e35_39
  have hx3 : pointOf 3 0 = 1 / 2 := by
    nlinarith only [e35_39]
  let t : ℝ := 2 * pointOf 3 1
  have hy3 : pointOf 3 1 = t / 2 := by
    dsimp [t]
    ring
  have ht : t ^ 2 = 3 := by
    dsimp [t]
    nlinarith only [e53_59, hx3]
  have h3 : pointOf 3 = pt (1 / 2) (t / 2) := by
    apply plane_eq_of_coords
    · simpa [pt] using hx3
    · simpa [pt] using hy3
  have e19_13 := coord_sqdist_eq_of_dist_eq hK1_19_13
  have e31_39 := coord_sqdist_eq_of_dist_eq hK3_31_39
  rw [h9, h3] at e19_13 e31_39
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at e19_13 e31_39
  have hfactor1 : pointOf 1 1 * (2 * pointOf 1 1 - t) = 0 := by
    nlinarith only [e19_13, e31_39, ht]
  have hy1ne : pointOf 1 1 ≠ 0 := by
    intro hy1
    have hx1 : pointOf 1 0 = 1 := by
      nlinarith only [e19_13, hy1, ht]
    have hp15 : pointOf 1 = pointOf 5 := by
      apply plane_eq_of_coords
      · rw [h5]
        simpa [pt] using hx1
      · rw [h5]
        simpa [pt] using hy1
    have hlabels : (1 : Fin 13) = 5 := hinjective hp15
    have h15 : (1 : Fin 13) ≠ 5 := by decide
    exact h15 hlabels
  have hy1 : pointOf 1 1 = t / 2 := by
    rcases mul_eq_zero.mp hfactor1 with hzero | hother
    · exact (hy1ne hzero).elim
    · linarith
  have hx1 : pointOf 1 0 = -1 / 2 := by
    nlinarith only [e19_13, hy1, ht]
  have h1 : pointOf 1 = pt (-1 / 2) (t / 2) := by
    apply plane_eq_of_coords
    · simpa [pt] using hx1
    · simpa [pt] using hy1
  have e16_13 := coord_sqdist_eq_of_dist_eq hK1_16_13
  have e36_31 := coord_sqdist_eq_of_dist_eq hK3_36_31
  rw [h1, h3] at e16_13 e36_31
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at e16_13 e36_31
  have hx6 : pointOf 6 0 = 0 := by
    nlinarith only [e16_13, e36_31]
  have hfactor6 : pointOf 6 1 * (pointOf 6 1 - t) = 0 := by
    nlinarith only [e36_31, hx6, ht]
  have hy6ne : pointOf 6 1 ≠ 0 := by
    intro hy6
    have hp69 : pointOf 6 = pointOf 8 := by
      apply plane_eq_of_coords
      · rw [h9]
        simpa [pt] using hx6
      · rw [h9]
        simpa [pt] using hy6
    have hlabels : (6 : Fin 13) = 8 := hinjective hp69
    have h69 : (6 : Fin 13) ≠ 8 := by decide
    exact h69 hlabels
  have hy6 : pointOf 6 1 = t := by
    rcases mul_eq_zero.mp hfactor6 with hzero | hother
    · exact (hy6ne hzero).elim
    · exact sub_eq_zero.mp hother
  have h6 : pointOf 6 = pt 0 t := by
    apply plane_eq_of_coords
    · simpa [pt] using hx6
    · simpa [pt] using hy6
  exact ⟨t, ht, h3, h1, h6⟩

private theorem normalized_thirteenPointSevenCircle_incompatible
    (pointOf : Fin 13 → ℝ²)
    (hinjective : Function.Injective pointOf)
    (h9 : pointOf 8 = pt 0 0)
    (h5 : pointOf 5 = pt 1 0)
    (hK1_19_13 : dist (pointOf 1) (pointOf 8) = dist (pointOf 1) (pointOf 3))
    (hK1_16_13 : dist (pointOf 1) (pointOf 6) = dist (pointOf 1) (pointOf 3))
    (hK2_23_28 : dist (pointOf 2) (pointOf 3) = dist (pointOf 2) (pointOf 7))
    (hK2_211_23 : dist (pointOf 2) (pointOf 10) = dist (pointOf 2) (pointOf 3))
    (hK3_35_39 : dist (pointOf 3) (pointOf 5) = dist (pointOf 3) (pointOf 8))
    (hK3_31_39 : dist (pointOf 3) (pointOf 1) = dist (pointOf 3) (pointOf 8))
    (hK3_36_31 : dist (pointOf 3) (pointOf 6) = dist (pointOf 3) (pointOf 1))
    (hK4_48_46 : dist (pointOf 4) (pointOf 7) = dist (pointOf 4) (pointOf 6))
    (hK4_42_48 : dist (pointOf 4) (pointOf 2) = dist (pointOf 4) (pointOf 7))
    (hK4_411_48 : dist (pointOf 4) (pointOf 10) = dist (pointOf 4) (pointOf 7))
    (hK5_53_59 : dist (pointOf 5) (pointOf 3) = dist (pointOf 5) (pointOf 8))
    (hK5_511_53 : dist (pointOf 5) (pointOf 10) = dist (pointOf 5) (pointOf 3))
    (hK8_81_83 : dist (pointOf 7) (pointOf 1) = dist (pointOf 7) (pointOf 3))
    (hK9_93_98 : dist (pointOf 8) (pointOf 3) = dist (pointOf 8) (pointOf 7))
    (hK9_92_93 : dist (pointOf 8) (pointOf 2) = dist (pointOf 8) (pointOf 3)) :
    False := by
  obtain ⟨t, ht, h3, h1, h6⟩ := normalized_base_frame pointOf hinjective h9 h5
    hK5_53_59 hK3_35_39 hK1_19_13 hK3_31_39 hK1_16_13 hK3_36_31
  have e93_98 := coord_sqdist_eq_of_dist_eq hK9_93_98
  have e81_83 := coord_sqdist_eq_of_dist_eq hK8_81_83
  rw [h9, h3] at e93_98
  rw [h1, h3] at e81_83
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at e93_98 e81_83
  have hx8 : pointOf 7 0 = 0 := by
    nlinarith only [e81_83]
  let epsilon : ℝ := pointOf 7 1
  have hepsilon : epsilon ^ 2 = 1 := by
    dsimp [epsilon]
    nlinarith only [e93_98, hx8, ht]
  have h8 : pointOf 7 = pt 0 epsilon := by
    apply plane_eq_of_coords
    · simpa [pt] using hx8
    · rfl
  have e92_93 := coord_sqdist_eq_of_dist_eq hK9_92_93
  have e23_28 := coord_sqdist_eq_of_dist_eq hK2_23_28
  rw [h9, h3] at e92_93
  rw [h3, h8] at e23_28
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at e92_93 e23_28
  let c : ℝ := pointOf 2 0
  let s : ℝ := pointOf 2 1
  have hunit : c ^ 2 + s ^ 2 = 1 := by
    dsimp [c, s]
    nlinarith only [e92_93, ht]
  have hbisector : c + (t - 2 * epsilon) * s = 0 := by
    dsimp [c, s, epsilon]
    nlinarith only [e23_28, ht, hepsilon]
  have h2 : pointOf 2 = pt c s := by
    apply plane_eq_of_coords <;> rfl
  obtain ⟨_, hsquare, _⟩ :=
    branch_quadratic_invariants epsilon t c s hepsilon ht hunit hbisector
  have hs : s ≠ 0 := by
    intro hs0
    have het := epsilon_t_sq epsilon t hepsilon ht
    nlinarith only [hsquare, hs0, het]
  let u : ℝ := pointOf 10 0
  let v : ℝ := pointOf 10 1
  have e511_53 := coord_sqdist_eq_of_dist_eq hK5_511_53
  have e211_23 := coord_sqdist_eq_of_dist_eq hK2_211_23
  rw [h5, h3] at e511_53
  rw [h2, h3] at e211_23
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at e511_53 e211_23
  have hcircleOne : (u - 1) ^ 2 + v ^ 2 = 1 := by
    dsimp [u, v]
    nlinarith only [e511_53, ht]
  have hcircleD :
      (u - c) ^ 2 + (v - s) ^ 2 =
        (1 / 2 - c) ^ 2 + (t / 2 - s) ^ 2 := by
    dsimp [u, v]
    nlinarith only [e211_23]
  have hneBase : ¬ (u = 1 / 2 ∧ v = t / 2) := by
    rintro ⟨hu, hv⟩
    have hp113 : pointOf 10 = pointOf 3 := by
      apply plane_eq_of_coords
      · rw [h3]
        simpa [u, pt] using hu
      · rw [h3]
        simpa [v, pt] using hv
    have hlabels : (10 : Fin 13) = 3 := hinjective hp113
    have h113 : (10 : Fin 13) ≠ 3 := by decide
    exact h113 hlabels
  obtain ⟨hu, hv⟩ := second_circle_intersection_coordinates
    t c s u v ht hunit hs hcircleOne hcircleD hneBase
  have h11 : pointOf 10 = pt (p11X t c s) (p11Y t c s) := by
    apply plane_eq_of_coords
    · simpa [u, pt] using hu
    · simpa [v, pt] using hv
  have e48_46 := coord_sqdist_eq_of_dist_eq hK4_48_46
  have e42_48 := coord_sqdist_eq_of_dist_eq hK4_42_48
  have e411_48 := coord_sqdist_eq_of_dist_eq hK4_411_48
  rw [h8, h6] at e48_46
  rw [h2, h8] at e42_48
  rw [h11, h8] at e411_48
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at e48_46 e42_48 e411_48
  let a : ℝ := pointOf 4 0
  let b : ℝ := pointOf 4 1
  let A : ℝ := -2 * a
  have hte : t ≠ epsilon := by
    intro h
    rw [h, hepsilon] at ht
    norm_num at ht
  have hcenterFactor : (t - epsilon) * (2 * b - (epsilon + t)) = 0 := by
    dsimp [b]
    nlinarith only [e48_46]
  have hb : 2 * b = epsilon + t := by
    rcases mul_eq_zero.mp hcenterFactor with hbad | hgood
    · exact (sub_ne_zero.mpr hte hbad).elim
    · exact sub_eq_zero.mp hgood
  have hp2Circle :
      c ^ 2 + s ^ 2 + A * c - (epsilon + t) * s + epsilon * t = 0 := by
    dsimp [A, a, b] at hb ⊢
    linear_combination e42_48 + (s - epsilon) * hb
  have hp11Circle :
      p11X t c s ^ 2 + p11Y t c s ^ 2 + A * p11X t c s -
          (epsilon + t) * p11Y t c s + epsilon * t = 0 := by
    dsimp [A, a, b] at hb ⊢
    linear_combination e411_48 + (p11Y t c s - epsilon) * hb
  exact normalized_k4_membership_impossible
    epsilon t c s A hepsilon ht hunit hbisector hp2Circle hp11Circle

/--
The thirteen-point seven-circle equalities have no injective Euclidean
realization.  The indices use the compressed original-label order
`(0,1,2,3,4,5,6,8,9,10,11,13,14)`.
-/
theorem thirteen_point_seven_circle_incompatible
    (pointOf : Fin 13 → ℝ²)
    (hinjective : Function.Injective pointOf)
    (hK1_19_13 : dist (pointOf 1) (pointOf 8) = dist (pointOf 1) (pointOf 3))
    (hK1_16_13 : dist (pointOf 1) (pointOf 6) = dist (pointOf 1) (pointOf 3))
    (hK2_23_28 : dist (pointOf 2) (pointOf 3) = dist (pointOf 2) (pointOf 7))
    (hK2_211_23 : dist (pointOf 2) (pointOf 10) = dist (pointOf 2) (pointOf 3))
    (hK3_35_39 : dist (pointOf 3) (pointOf 5) = dist (pointOf 3) (pointOf 8))
    (hK3_31_39 : dist (pointOf 3) (pointOf 1) = dist (pointOf 3) (pointOf 8))
    (hK3_36_31 : dist (pointOf 3) (pointOf 6) = dist (pointOf 3) (pointOf 1))
    (hK4_48_46 : dist (pointOf 4) (pointOf 7) = dist (pointOf 4) (pointOf 6))
    (hK4_42_48 : dist (pointOf 4) (pointOf 2) = dist (pointOf 4) (pointOf 7))
    (hK4_411_48 : dist (pointOf 4) (pointOf 10) = dist (pointOf 4) (pointOf 7))
    (hK5_53_59 : dist (pointOf 5) (pointOf 3) = dist (pointOf 5) (pointOf 8))
    (hK5_511_53 : dist (pointOf 5) (pointOf 10) = dist (pointOf 5) (pointOf 3))
    (hK8_81_83 : dist (pointOf 7) (pointOf 1) = dist (pointOf 7) (pointOf 3))
    (hK9_93_98 : dist (pointOf 8) (pointOf 3) = dist (pointOf 8) (pointOf 7))
    (hK9_92_93 : dist (pointOf 8) (pointOf 2) = dist (pointOf 8) (pointOf 3)) :
    False := by
  have h85 : (8 : Fin 13) ≠ 5 := by decide
  have hp85 : pointOf 8 ≠ pointOf 5 := fun h => h85 (hinjective h)
  let normalized : Fin 13 → ℝ² := fun i =>
    normSim (pointOf 8) (pointOf 5) (pointOf i)
  have hnormalizedInjective : Function.Injective normalized := by
    intro i j hij
    have hzero : dist (normalized i) (normalized j) = 0 := by
      rw [hij, dist_self]
    change dist (normSim (pointOf 8) (pointOf 5) (pointOf i))
        (normSim (pointOf 8) (pointOf 5) (pointOf j)) = 0 at hzero
    rw [normSim_dist_image _ _ hp85] at hzero
    have hscale : (dist (pointOf 8) (pointOf 5))⁻¹ ≠ 0 :=
      inv_ne_zero (dist_ne_zero.mpr hp85)
    have hpij : pointOf i = pointOf j :=
      dist_eq_zero.mp ((mul_eq_zero.mp hzero).resolve_left hscale)
    exact hinjective hpij
  have hnormalized9 : normalized 8 = pt 0 0 := by
    dsimp [normalized]
    exact normSim_fst _ _
  have hnormalized5 : normalized 5 = pt 1 0 := by
    dsimp [normalized]
    exact normSim_snd _ _ hp85
  have map_dist_eq {i j k l : Fin 13}
      (h : dist (pointOf i) (pointOf j) = dist (pointOf k) (pointOf l)) :
      dist (normalized i) (normalized j) = dist (normalized k) (normalized l) := by
    dsimp [normalized]
    rw [normSim_dist_image _ _ hp85, normSim_dist_image _ _ hp85, h]
  exact normalized_thirteenPointSevenCircle_incompatible
    normalized hnormalizedInjective hnormalized9 hnormalized5
    (map_dist_eq hK1_19_13) (map_dist_eq hK1_16_13)
    (map_dist_eq hK2_23_28) (map_dist_eq hK2_211_23)
    (map_dist_eq hK3_35_39) (map_dist_eq hK3_31_39) (map_dist_eq hK3_36_31)
    (map_dist_eq hK4_48_46) (map_dist_eq hK4_42_48) (map_dist_eq hK4_411_48)
    (map_dist_eq hK5_53_59) (map_dist_eq hK5_511_53)
    (map_dist_eq hK8_81_83) (map_dist_eq hK9_93_98) (map_dist_eq hK9_92_93)

/-
## Row-pattern adapter

The compressed labels `7,8,9,10,11,12` below denote the original labels
`8,9,10,11,13,14`, respectively.
-/

/-- The thirteen labels in compressed original-label order. -/
abbrev ThirteenPointSevenCircleLabel := Fin 13

/-- The fixed seven-row packet on its exact thirteen-label support. -/
def thirteenPointSevenCirclePattern : RowPattern ThirteenPointSevenCircleLabel :=
    fun center =>
  if center = 1 then {0, 3, 6, 8}
  else if center = 2 then {3, 0, 7, 10}
  else if center = 3 then {6, 1, 5, 8}
  else if center = 4 then {10, 2, 6, 7}
  else if center = 5 then {9, 3, 10, 8}
  else if center = 7 then {11, 1, 3, 9}
  else if center = 8 then {12, 2, 3, 7}
  else ∅

/--
An `EdgeClosure` occurrence of the fixed thirteen-label seven-circle motif in
an arbitrary row pattern.
-/
structure ThirteenPointSevenCircleCollisionCore {alpha : Type*}
    (P : RowPattern alpha) where
  label : Fin 13 → alpha
  label_injective : Function.Injective label
  K1_19_13 : EdgeClosure P (label 1, label 8) (label 1, label 3)
  K1_16_13 : EdgeClosure P (label 1, label 6) (label 1, label 3)
  K2_23_28 : EdgeClosure P (label 2, label 3) (label 2, label 7)
  K2_211_23 : EdgeClosure P (label 2, label 10) (label 2, label 3)
  K3_35_39 : EdgeClosure P (label 3, label 5) (label 3, label 8)
  K3_31_39 : EdgeClosure P (label 3, label 1) (label 3, label 8)
  K3_36_31 : EdgeClosure P (label 3, label 6) (label 3, label 1)
  K4_48_46 : EdgeClosure P (label 4, label 7) (label 4, label 6)
  K4_42_48 : EdgeClosure P (label 4, label 2) (label 4, label 7)
  K4_411_48 : EdgeClosure P (label 4, label 10) (label 4, label 7)
  K5_53_59 : EdgeClosure P (label 5, label 3) (label 5, label 8)
  K5_511_53 : EdgeClosure P (label 5, label 10) (label 5, label 3)
  K8_81_83 : EdgeClosure P (label 7, label 1) (label 7, label 3)
  K9_93_98 : EdgeClosure P (label 8, label 3) (label 8, label 7)
  K9_92_93 : EdgeClosure P (label 8, label 2) (label 8, label 3)

/-- A thirteen-point seven-circle collision core has no injective realization. -/
theorem not_realizes_of_thirteenPointSevenCircleCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : ThirteenPointSevenCircleCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  let q : Fin 13 → ℝ² := fun i => pointOf (core.label i)
  have hqInjective : Function.Injective q := by
    intro i j hij
    apply core.label_injective
    apply hreal.injective
    exact hij
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  exact thirteen_point_seven_circle_incompatible q hqInjective
    (by simpa [q, edgeDist] using sound core.K1_19_13)
    (by simpa [q, edgeDist] using sound core.K1_16_13)
    (by simpa [q, edgeDist] using sound core.K2_23_28)
    (by simpa [q, edgeDist] using sound core.K2_211_23)
    (by simpa [q, edgeDist] using sound core.K3_35_39)
    (by simpa [q, edgeDist] using sound core.K3_31_39)
    (by simpa [q, edgeDist] using sound core.K3_36_31)
    (by simpa [q, edgeDist] using sound core.K4_48_46)
    (by simpa [q, edgeDist] using sound core.K4_42_48)
    (by simpa [q, edgeDist] using sound core.K4_411_48)
    (by simpa [q, edgeDist] using sound core.K5_53_59)
    (by simpa [q, edgeDist] using sound core.K5_511_53)
    (by simpa [q, edgeDist] using sound core.K8_81_83)
    (by simpa [q, edgeDist] using sound core.K9_93_98)
    (by simpa [q, edgeDist] using sound core.K9_92_93)

/-- The fixed thirteen-label packet supplies the generic collision core. -/
def thirteenPointSevenCircleCollisionCore :
    ThirteenPointSevenCircleCollisionCore thirteenPointSevenCirclePattern where
  label := id
  label_injective := Function.injective_id
  K1_19_13 := EdgeClosure.row 1 8 3
    (by simp [thirteenPointSevenCirclePattern])
    (by simp [thirteenPointSevenCirclePattern])
  K1_16_13 := EdgeClosure.row 1 6 3
    (by simp [thirteenPointSevenCirclePattern])
    (by simp [thirteenPointSevenCirclePattern])
  K2_23_28 := EdgeClosure.row 2 3 7
    (by simp [thirteenPointSevenCirclePattern])
    (by simp [thirteenPointSevenCirclePattern])
  K2_211_23 := EdgeClosure.row 2 10 3
    (by simp [thirteenPointSevenCirclePattern])
    (by simp [thirteenPointSevenCirclePattern])
  K3_35_39 := EdgeClosure.row 3 5 8
    (by simp [thirteenPointSevenCirclePattern])
    (by simp [thirteenPointSevenCirclePattern])
  K3_31_39 := EdgeClosure.row 3 1 8
    (by simp [thirteenPointSevenCirclePattern])
    (by simp [thirteenPointSevenCirclePattern])
  K3_36_31 := EdgeClosure.row 3 6 1
    (by simp [thirteenPointSevenCirclePattern])
    (by simp [thirteenPointSevenCirclePattern])
  K4_48_46 := EdgeClosure.row 4 7 6
    (by simp [thirteenPointSevenCirclePattern])
    (by simp [thirteenPointSevenCirclePattern])
  K4_42_48 := EdgeClosure.row 4 2 7
    (by simp [thirteenPointSevenCirclePattern])
    (by simp [thirteenPointSevenCirclePattern])
  K4_411_48 := EdgeClosure.row 4 10 7
    (by simp [thirteenPointSevenCirclePattern])
    (by simp [thirteenPointSevenCirclePattern])
  K5_53_59 := EdgeClosure.row 5 3 8
    (by simp [thirteenPointSevenCirclePattern])
    (by simp [thirteenPointSevenCirclePattern])
  K5_511_53 := EdgeClosure.row 5 10 3
    (by simp [thirteenPointSevenCirclePattern])
    (by simp [thirteenPointSevenCirclePattern])
  K8_81_83 := EdgeClosure.row 7 1 3
    (by simp [thirteenPointSevenCirclePattern])
    (by simp [thirteenPointSevenCirclePattern])
  K9_93_98 := EdgeClosure.row 8 3 7
    (by simp [thirteenPointSevenCirclePattern])
    (by simp [thirteenPointSevenCirclePattern])
  K9_92_93 := EdgeClosure.row 8 2 3
    (by simp [thirteenPointSevenCirclePattern])
    (by simp [thirteenPointSevenCirclePattern])

/-- The fixed thirteen-label seven-row packet has no injective realization. -/
theorem not_realizes_thirteenPointSevenCirclePattern :
    ¬ ∃ pointOf : ThirteenPointSevenCircleLabel → ℝ²,
      Realizes thirteenPointSevenCirclePattern pointOf :=
  not_realizes_of_thirteenPointSevenCircleCollisionCore
    thirteenPointSevenCircleCollisionCore

#print axioms thirteen_point_seven_circle_incompatible
#print axioms not_realizes_of_thirteenPointSevenCircleCollisionCore
#print axioms not_realizes_thirteenPointSevenCirclePattern

end EqualityCore
end Census554
end Problem97
