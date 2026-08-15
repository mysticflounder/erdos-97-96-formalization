/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.U2.SimilarityNormalization

/-!
# Seven-row obstruction

This scratch file kernel-checks both the exact normalized algebraic
contradiction and its source-level adapter: the fixed thirteen-label row
pattern has no injective Euclidean realization.
-/

namespace FirstnonhitSevenRow

open Problem97
open Problem97.Census554.EqualityCore
open scoped EuclideanGeometry

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

/--
The two arc-midpoint branches have the same three quadratic invariants.  The
sign of `(c, s)` is intentionally not chosen: these equations cover both signs.
-/
theorem branch_quadratic_invariants
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

/--
The square of the left side forced by membership of `p11` in the `K4` circle.
The hypotheses are the exact algebraic branch invariants after normalization.
-/
theorem forced_left_sq
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

/-- The corresponding square of the right side forced by the `K4` circle. -/
theorem forced_right_sq
    (epsilon t : ℝ)
    (hepsilon : epsilon ^ 2 = 1)
    (ht : t ^ 2 = 3) :
    (4 * (1 + epsilon * t)) ^ 2 = 64 + 32 * (epsilon * t) := by
  have het := epsilon_t_sq epsilon t hepsilon ht
  nlinarith

/--
Root-free certificate that the two forced squares differ.  The constant `23`
is `(3 * epsilon * t)^2 - 2^2`, using `epsilon^2 = 1` and `t^2 = 3`.
-/
theorem residual_conjugate_identity
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

/--
The exact final contradiction: no one of the four normalized sign branches can
satisfy the linear equality forced by the seventh (`K4`) row.
-/
theorem final_linear_equality_impossible
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

/--
Same obstruction stated directly from the unit-circle and perpendicular-bisector
equations for the normalized point `p2 = (c, s)`.
-/
theorem normalized_final_linear_equality_impossible
    (epsilon t c s : ℝ)
    (hepsilon : epsilon ^ 2 = 1)
    (ht : t ^ 2 = 3)
    (hunit : c ^ 2 + s ^ 2 = 1)
    (hbisector : c + (t - 2 * epsilon) * s = 0) :
    (3 + epsilon * t) * c + (5 * epsilon + 3 * t) * s ≠
      4 * (1 + epsilon * t) := by
  obtain ⟨hc, hs, hcs⟩ :=
    branch_quadratic_invariants epsilon t c s hepsilon ht hunit hbisector
  exact final_linear_equality_impossible epsilon t c s hepsilon ht hc hs hcs

/-- The normalized x-coordinate of the second `K2`/`K5` circle intersection. -/
noncomputable def p11X (t c s : ℝ) : ℝ := 1 + (c - t * s) / 2

/-- The normalized y-coordinate of the second `K2`/`K5` circle intersection. -/
noncomputable def p11Y (t c s : ℝ) : ℝ := (t * c + s) / 2

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

/--
Membership of `p2 = (c, s)` and the reflected point `p11` in the normalized
circle through `(0, epsilon)` and `(0, t)` forces the forbidden linear equality.
-/
theorem normalized_k4_membership_forces_linear_equality
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

/-- The normalized algebraic `K4` data are inconsistent. -/
theorem normalized_k4_membership_impossible
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
  exact normalized_final_linear_equality_impossible
    epsilon t c s hepsilon ht hunit hbisector hforced

/--
The second common point of the two normalized circles is the reflection of
`(1/2, t/2)` across their center line.  This is the coordinate form used for
the packet's point `11`.
-/
theorem second_circle_intersection_coordinates
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

/- ## Source-level row pattern -/

/- The compressed order is `(0,1,2,3,4,5,6,8,9,10,11,13,14)`. -/
abbrev PacketLabel := Fin 13

/-- The seven rows exactly as emitted by the first-nonhit search packet. -/
noncomputable def sevenRowPattern : RowPattern PacketLabel := fun center =>
  if center = 1 then {0, 3, 6, 8}
  else if center = 2 then {3, 0, 7, 10}
  else if center = 3 then {6, 1, 5, 8}
  else if center = 4 then {10, 2, 6, 7}
  else if center = 5 then {9, 3, 10, 8}
  else if center = 7 then {11, 1, 3, 9}
  else if center = 8 then {12, 2, 3, 7}
  else ∅

private theorem realizes_normSim
    {P : RowPattern PacketLabel} {pointOf : PacketLabel → ℝ²}
    (hreal : Realizes P pointOf) (a b : PacketLabel) (hab : a ≠ b) :
    Realizes P (fun i => Problem97.normSim (pointOf a) (pointOf b) (pointOf i)) := by
  have hp : pointOf a ≠ pointOf b := fun h => hab (hreal.injective h)
  constructor
  · intro center i hi j hj
    rw [Problem97.normSim_dist_image _ _ hp, Problem97.normSim_dist_image _ _ hp]
    congr 1
    exact hreal.equidist center i hi j hj
  · intro i j hij
    change Problem97.normSim (pointOf a) (pointOf b) (pointOf i) =
      Problem97.normSim (pointOf a) (pointOf b) (pointOf j) at hij
    have hzero :
        dist (Problem97.normSim (pointOf a) (pointOf b) (pointOf i))
            (Problem97.normSim (pointOf a) (pointOf b) (pointOf j)) = 0 := by
      rw [hij, dist_self]
    rw [Problem97.normSim_dist_image _ _ hp] at hzero
    have hscale : (dist (pointOf a) (pointOf b))⁻¹ ≠ 0 :=
      inv_ne_zero (dist_ne_zero.mpr hp)
    have hpij : pointOf i = pointOf j :=
      dist_eq_zero.mp ((mul_eq_zero.mp hzero).resolve_left hscale)
    exact hreal.injective hpij

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
    (pointOf : PacketLabel → ℝ²)
    (hreal : Realizes sevenRowPattern pointOf)
    (h9 : pointOf 8 = pt 0 0)
    (h5 : pointOf 5 = pt 1 0) :
    ∃ t : ℝ, t ^ 2 = 3 ∧
      pointOf 3 = pt (1 / 2) (t / 2) ∧
      pointOf 1 = pt (-1 / 2) (t / 2) ∧
      pointOf 6 = pt 0 t := by
  have h53_59 := hreal.equidist 5 3 (by simp [sevenRowPattern]) 8
    (by simp [sevenRowPattern])
  have h35_39 := hreal.equidist 3 5 (by simp [sevenRowPattern]) 8
    (by simp [sevenRowPattern])
  have e53_59 := coord_sqdist_eq_of_dist_eq h53_59
  have e35_39 := coord_sqdist_eq_of_dist_eq h35_39
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

  have h19_13 := hreal.equidist 1 8 (by simp [sevenRowPattern]) 3
    (by simp [sevenRowPattern])
  have h31_39 := hreal.equidist 3 1 (by simp [sevenRowPattern]) 8
    (by simp [sevenRowPattern])
  have e19_13 := coord_sqdist_eq_of_dist_eq h19_13
  have e31_39 := coord_sqdist_eq_of_dist_eq h31_39
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
    have : (1 : PacketLabel) = 5 := hreal.injective hp15
    have h15 : (1 : PacketLabel) ≠ 5 := by decide
    exact h15 this
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

  have h16_13 := hreal.equidist 1 6 (by simp [sevenRowPattern]) 3
    (by simp [sevenRowPattern])
  have h36_31 := hreal.equidist 3 6 (by simp [sevenRowPattern]) 1
    (by simp [sevenRowPattern])
  have e16_13 := coord_sqdist_eq_of_dist_eq h16_13
  have e36_31 := coord_sqdist_eq_of_dist_eq h36_31
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
    have : (6 : PacketLabel) = 8 := hreal.injective hp69
    have h69 : (6 : PacketLabel) ≠ 8 := by decide
    exact h69 this
  have hy6 : pointOf 6 1 = t := by
    rcases mul_eq_zero.mp hfactor6 with hzero | hother
    · exact (hy6ne hzero).elim
    · exact sub_eq_zero.mp hother
  have h6 : pointOf 6 = pt 0 t := by
    apply plane_eq_of_coords
    · simpa [pt] using hx6
    · simpa [pt] using hy6
  exact ⟨t, ht, h3, h1, h6⟩

private theorem normalized_packet_impossible
    (pointOf : PacketLabel → ℝ²)
    (hreal : Realizes sevenRowPattern pointOf)
    (h9 : pointOf 8 = pt 0 0)
    (h5 : pointOf 5 = pt 1 0) :
    False := by
  obtain ⟨t, ht, h3, h1, h6⟩ := normalized_base_frame pointOf hreal h9 h5

  have h93_98 := hreal.equidist 8 3 (by simp [sevenRowPattern]) 7
    (by simp [sevenRowPattern])
  have h81_83 := hreal.equidist 7 1 (by simp [sevenRowPattern]) 3
    (by simp [sevenRowPattern])
  have e93_98 := coord_sqdist_eq_of_dist_eq h93_98
  have e81_83 := coord_sqdist_eq_of_dist_eq h81_83
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

  have h92_93 := hreal.equidist 8 2 (by simp [sevenRowPattern]) 3
    (by simp [sevenRowPattern])
  have h23_28 := hreal.equidist 2 3 (by simp [sevenRowPattern]) 7
    (by simp [sevenRowPattern])
  have e92_93 := coord_sqdist_eq_of_dist_eq h92_93
  have e23_28 := coord_sqdist_eq_of_dist_eq h23_28
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
    apply plane_eq_of_coords
    · rfl
    · rfl
  obtain ⟨hc, hsquare, hcs⟩ :=
    branch_quadratic_invariants epsilon t c s hepsilon ht hunit hbisector
  have hs : s ≠ 0 := by
    intro hs0
    have het := epsilon_t_sq epsilon t hepsilon ht
    nlinarith only [hsquare, hs0, het]

  let u : ℝ := pointOf 10 0
  let v : ℝ := pointOf 10 1
  have h511_53 := hreal.equidist 5 10 (by simp [sevenRowPattern]) 3
    (by simp [sevenRowPattern])
  have h211_23 := hreal.equidist 2 10 (by simp [sevenRowPattern]) 3
    (by simp [sevenRowPattern])
  have e511_53 := coord_sqdist_eq_of_dist_eq h511_53
  have e211_23 := coord_sqdist_eq_of_dist_eq h211_23
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
    have hlabels : (10 : PacketLabel) = 3 := hreal.injective hp113
    have h113 : (10 : PacketLabel) ≠ 3 := by decide
    exact h113 hlabels
  obtain ⟨hu, hv⟩ := second_circle_intersection_coordinates
    t c s u v ht hunit hs hcircleOne hcircleD hneBase
  have h11 : pointOf 10 = pt (p11X t c s) (p11Y t c s) := by
    apply plane_eq_of_coords
    · simpa [u, pt] using hu
    · simpa [v, pt] using hv

  have h48_46 := hreal.equidist 4 7 (by simp [sevenRowPattern]) 6
    (by simp [sevenRowPattern])
  have h42_48 := hreal.equidist 4 2 (by simp [sevenRowPattern]) 7
    (by simp [sevenRowPattern])
  have h411_48 := hreal.equidist 4 10 (by simp [sevenRowPattern]) 7
    (by simp [sevenRowPattern])
  have e48_46 := coord_sqdist_eq_of_dist_eq h48_46
  have e42_48 := coord_sqdist_eq_of_dist_eq h42_48
  have e411_48 := coord_sqdist_eq_of_dist_eq h411_48
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

/-- The seven-row packet has no injective Euclidean realization. -/
theorem not_realizes_sevenRowPattern :
    ¬ ∃ pointOf : PacketLabel → ℝ², Realizes sevenRowPattern pointOf := by
  rintro ⟨pointOf, hreal⟩
  have h95 : (8 : PacketLabel) ≠ 5 := by decide
  have hp95 : pointOf 8 ≠ pointOf 5 := fun h => h95 (hreal.injective h)
  let normalized : PacketLabel → ℝ² := fun i =>
    Problem97.normSim (pointOf 8) (pointOf 5) (pointOf i)
  have hnormalized : Realizes sevenRowPattern normalized := by
    simpa [normalized] using realizes_normSim hreal 8 5 h95
  have hnormalized9 : normalized 8 = pt 0 0 := by
    dsimp [normalized]
    exact Problem97.normSim_fst _ _
  have hnormalized5 : normalized 5 = pt 1 0 := by
    dsimp [normalized]
    exact Problem97.normSim_snd _ _ hp95
  exact normalized_packet_impossible normalized hnormalized hnormalized9 hnormalized5

#print axioms FirstnonhitSevenRow.final_linear_equality_impossible
#print axioms FirstnonhitSevenRow.normalized_final_linear_equality_impossible
#print axioms FirstnonhitSevenRow.normalized_k4_membership_impossible
#print axioms FirstnonhitSevenRow.not_realizes_sevenRowPattern

end FirstnonhitSevenRow
