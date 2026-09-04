/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Foundation

/-!
# Two distinct interior points cannot share the boundary-radius metric pattern

This is the source-independent planar metric obstruction requested by the
two-interior same-boundary-radius audit.  The proof uses coordinates only for
the final affine algebra; it does not depend on a convex polygon, an MEC
construction, or a closure-layer import.
-/

namespace Erdos9796Proof.Geometry

open scoped EuclideanGeometry

set_option maxHeartbeats 1000000 in
-- The coordinate cancellation in the closed-disk equality case exceeds the
-- default heartbeat budget; this finite local override keeps the proof bounded.
/-- Two distinct disk points cannot have the same distance pattern to two points
on a common disk boundary when their two endpoint distances are also equal. -/
theorem false_of_two_interior_same_boundary_radius
    {O B P X Y : ℝ²} {R : ℝ}
    (hB : dist B O = R)
    (hP : dist P O = R)
    (hXi : dist X O ≤ R)
    (hYi : dist Y O ≤ R)
    (hne : X ≠ Y)
    (hBP : dist B P = dist B X)
    (hBY : dist B P = dist B Y)
    (hPX : dist P X = dist P Y) : False := by
  have hBsq : dist B O ^ 2 = R ^ 2 := congrArg (fun t : ℝ ↦ t ^ 2) hB
  have hPsq : dist P O ^ 2 = R ^ 2 := congrArg (fun t : ℝ ↦ t ^ 2) hP
  have hBPsq : dist B P ^ 2 = dist B X ^ 2 := congrArg (fun t : ℝ ↦ t ^ 2) hBP
  have hBYsq : dist B P ^ 2 = dist B Y ^ 2 := congrArg (fun t : ℝ ↦ t ^ 2) hBY
  have hPXsq : dist P X ^ 2 = dist P Y ^ 2 := congrArg (fun t : ℝ ↦ t ^ 2) hPX
  have hRnonneg : 0 ≤ R := by
    have hdist : 0 ≤ dist B O := dist_nonneg
    nlinarith
  have hXsq' : dist X O ^ 2 ≤ R ^ 2 := by
    have hsum : 0 ≤ R + dist X O := by
      have hdist : 0 ≤ dist X O := dist_nonneg
      nlinarith
    have hprod : 0 ≤ (R - dist X O) * (R + dist X O) :=
      mul_nonneg (sub_nonneg.mpr hXi) hsum
    nlinarith
  have hYsq' : dist Y O ^ 2 ≤ R ^ 2 := by
    have hsum : 0 ≤ R + dist Y O := by
      have hdist : 0 ≤ dist Y O := dist_nonneg
      nlinarith
    have hprod : 0 ≤ (R - dist Y O) * (R + dist Y O) :=
      mul_nonneg (sub_nonneg.mpr hYi) hsum
    nlinarith
  simp only [Problem97.dist_sq_coord] at hBsq hPsq hXsq' hYsq' hBPsq hBYsq hPXsq
  let dx := P 0 - B 0
  let dy := P 1 - B 1
  let cx := O 0 - B 0
  let cy := O 1 - B 1
  let ux := X 0 - B 0
  let uy := X 1 - B 1
  let vx := Y 0 - B 0
  let vy := Y 1 - B 1
  have hcd : 2 * (dx * cx + dy * cy) = dx ^ 2 + dy ^ 2 := by
    dsimp [dx, dy, cx, cy]
    linear_combination hBsq - hPsq
  have huxnorm : dx ^ 2 + dy ^ 2 = ux ^ 2 + uy ^ 2 := by
    dsimp [dx, dy, ux, uy]
    linear_combination hBPsq
  have hvnorm : dx ^ 2 + dy ^ 2 = vx ^ 2 + vy ^ 2 := by
    dsimp [dx, dy, vx, vy]
    linear_combination hBYsq
  have hduv : dx * (ux - vx) + dy * (uy - vy) = 0 := by
    linear_combination (-1 / 2) * hPXsq + (-1 / 2) * huxnorm + (1 / 2) * hvnorm
  have hsuv : (ux + vx) * (ux - vx) + (uy + vy) * (uy - vy) = 0 := by
    linear_combination hvnorm - huxnorm
  have hpoint_eq_of_coords {A C : ℝ²}
      (h0 : A 0 = C 0) (h1 : A 1 = C 1) : A = C := by
    ext i
    fin_cases i
    · simpa using h0
    · simpa using h1
  have hdelta_cases : dx * (uy + vy) - dy * (ux + vx) = 0 := by
    by_cases hdx : ux = vx
    · have hdy : uy ≠ vy := by
        intro h
        have hXY0 : X 0 = Y 0 := by
          dsimp [ux, vx] at hdx
          linarith only [hdx]
        have hXY1 : X 1 = Y 1 := by
          dsimp [uy, vy] at h
          linarith only [h]
        apply hne
        exact hpoint_eq_of_coords hXY0 hXY1
      have hdy0 : dy = 0 := by
        have hprod : dy * (uy - vy) = 0 := by
          simpa [hdx] using hduv
        exact (mul_eq_zero.mp hprod).resolve_right (sub_ne_zero.mpr hdy)
      have hsy0 : uy + vy = 0 := by
        have hprod : (uy + vy) * (uy - vy) = 0 := by
          simpa [hdx] using hsuv
        exact (mul_eq_zero.mp hprod).resolve_right (sub_ne_zero.mpr hdy)
      simp [hdy0, hsy0]
    · have hprod :
          (dx * (uy + vy) - dy * (ux + vx)) * (ux - vx) = 0 := by
        linear_combination (uy + vy) * hduv - dy * hsuv
      exact (mul_eq_zero.mp hprod).resolve_right (sub_ne_zero.mpr hdx)
  have hcoord_eq_of_zero
      (hux0 : ux = 0) (huy0 : uy = 0)
      (hvx0 : vx = 0) (hvy0 : vy = 0) : X = Y := by
    have hX0 : X 0 = B 0 := by
      dsimp [ux] at hux0
      linarith only [hux0]
    have hY0 : Y 0 = B 0 := by
      dsimp [vx] at hvx0
      linarith only [hvx0]
    have hX1 : X 1 = B 1 := by
      dsimp [uy] at huy0
      linarith only [huy0]
    have hY1 : Y 1 = B 1 := by
      dsimp [vy] at hvy0
      linarith only [hvy0]
    exact hpoint_eq_of_coords (hX0.trans hY0.symm) (hX1.trans hY1.symm)
  have hdpos : 0 < dx ^ 2 + dy ^ 2 := by
    by_contra hnot
    have hzero : dx ^ 2 + dy ^ 2 = 0 := by
      nlinarith only [hnot, sq_nonneg dx, sq_nonneg dy]
    have hdx0 : dx = 0 := by nlinarith only [hzero, sq_nonneg dx, sq_nonneg dy]
    have hdy0 : dy = 0 := by nlinarith only [hzero, sq_nonneg dx, sq_nonneg dy]
    have hux0 : ux = 0 := by
      nlinarith only [huxnorm, hzero, sq_nonneg ux, sq_nonneg uy]
    have huy0 : uy = 0 := by
      nlinarith only [huxnorm, hzero, sq_nonneg ux, sq_nonneg uy]
    have hvx0 : vx = 0 := by
      nlinarith only [hvnorm, hzero, sq_nonneg vx, sq_nonneg vy]
    have hvy0 : vy = 0 := by
      nlinarith only [hvnorm, hzero, sq_nonneg vx, sq_nonneg vy]
    exact hne (hcoord_eq_of_zero hux0 huy0 hvx0 hvy0)
  have hdotU : dx * ux + dy * uy ≤ dx ^ 2 + dy ^ 2 := by
    have hidentity :
        (dx * ux + dy * uy) ^ 2 + (dx * uy - dy * ux) ^ 2 =
          (dx ^ 2 + dy ^ 2) * (ux ^ 2 + uy ^ 2) := by ring
    have hsq : (dx * ux + dy * uy) ^ 2 ≤ (dx ^ 2 + dy ^ 2) ^ 2 := by
      nlinarith only [hidentity, sq_nonneg (dx * uy - dy * ux), huxnorm]
    by_contra hnot
    have hgt : dx ^ 2 + dy ^ 2 < dx * ux + dy * uy := lt_of_not_ge hnot
    have hsum : 0 < dx * ux + dy * uy + (dx ^ 2 + dy ^ 2) := by
      nlinarith only [hdpos, hgt]
    have hprod : 0 <
        (dx * ux + dy * uy - (dx ^ 2 + dy ^ 2)) *
          (dx * ux + dy * uy + (dx ^ 2 + dy ^ 2)) :=
      mul_pos (sub_pos.mpr hgt) hsum
    nlinarith only [hprod, hsq]
  have hdotV : dx * vx + dy * vy ≤ dx ^ 2 + dy ^ 2 := by
    have hidentity :
        (dx * vx + dy * vy) ^ 2 + (dx * vy - dy * vx) ^ 2 =
          (dx ^ 2 + dy ^ 2) * (vx ^ 2 + vy ^ 2) := by ring
    have hsq : (dx * vx + dy * vy) ^ 2 ≤ (dx ^ 2 + dy ^ 2) ^ 2 := by
      nlinarith only [hidentity, sq_nonneg (dx * vy - dy * vx), hvnorm]
    by_contra hnot
    have hgt : dx ^ 2 + dy ^ 2 < dx * vx + dy * vy := lt_of_not_ge hnot
    have hsum : 0 < dx * vx + dy * vy + (dx ^ 2 + dy ^ 2) := by
      nlinarith only [hdpos, hgt]
    have hprod : 0 <
        (dx * vx + dy * vy - (dx ^ 2 + dy ^ 2)) *
          (dx * vx + dy * vy + (dx ^ 2 + dy ^ 2)) :=
      mul_pos (sub_pos.mpr hgt) hsum
    nlinarith only [hprod, hsq]
  have hdsupper :
      dx * (ux + vx) + dy * (uy + vy) ≤ 2 * (dx ^ 2 + dy ^ 2) := by
    nlinarith only [hdotU, hdotV]
  have hXinter :
      (ux - cx) ^ 2 + (uy - cy) ^ 2 ≤ cx ^ 2 + cy ^ 2 := by
    dsimp [ux, uy, cx, cy]
    nlinarith only [hXsq', hBsq]
  have hYinter :
      (vx - cx) ^ 2 + (vy - cy) ^ 2 ≤ cx ^ 2 + cy ^ 2 := by
    dsimp [vx, vy, cx, cy]
    nlinarith only [hYsq', hBsq]
  have hcsLower :
      dx ^ 2 + dy ^ 2 ≤ cx * (ux + vx) + cy * (uy + vy) := by
    nlinarith only [hXinter, hYinter, huxnorm, hvnorm]
  have hkey :
      (dx ^ 2 + dy ^ 2) * (cx * (ux + vx) + cy * (uy + vy)) =
        (cx * dx + cy * dy) * (dx * (ux + vx) + dy * (uy + vy)) := by
    calc
      (dx ^ 2 + dy ^ 2) * (cx * (ux + vx) + cy * (uy + vy)) =
          (cx * dx + cy * dy) * (dx * (ux + vx) + dy * (uy + vy)) +
            (dx * cy - dy * cx) *
              (dx * (uy + vy) - dy * (ux + vx)) := by ring
      _ = (cx * dx + cy * dy) * (dx * (ux + vx) + dy * (uy + vy)) := by
        rw [hdelta_cases]
        ring
  have hcsUpper :
      cx * (ux + vx) + cy * (uy + vy) ≤ dx ^ 2 + dy ^ 2 := by
    have hcd' : cx * dx + cy * dy = (dx ^ 2 + dy ^ 2) / 2 := by
      nlinarith only [hcd]
    by_contra hnot
    have hgt : dx ^ 2 + dy ^ 2 < cx * (ux + vx) + cy * (uy + vy) :=
      lt_of_not_ge hnot
    have hleft :
        (dx ^ 2 + dy ^ 2) * (dx ^ 2 + dy ^ 2) <
          (dx ^ 2 + dy ^ 2) * (cx * (ux + vx) + cy * (uy + vy)) :=
      mul_lt_mul_of_pos_left hgt hdpos
    have hright :
        (dx ^ 2 + dy ^ 2) * (cx * (ux + vx) + cy * (uy + vy)) ≤
          (dx ^ 2 + dy ^ 2) * (dx ^ 2 + dy ^ 2) := by
      calc
        (dx ^ 2 + dy ^ 2) * (cx * (ux + vx) + cy * (uy + vy)) =
            (cx * dx + cy * dy) * (dx * (ux + vx) + dy * (uy + vy)) := hkey
        _ = ((dx ^ 2 + dy ^ 2) / 2) *
            (dx * (ux + vx) + dy * (uy + vy)) := by rw [hcd']
        _ ≤ ((dx ^ 2 + dy ^ 2) / 2) * (2 * (dx ^ 2 + dy ^ 2)) := by
          exact mul_le_mul_of_nonneg_left hdsupper
            (div_nonneg (by positivity) (by norm_num))
        _ = (dx ^ 2 + dy ^ 2) * (dx ^ 2 + dy ^ 2) := by ring
    exact (not_lt_of_ge hright) hleft
  have hcsEq :
      cx * (ux + vx) + cy * (uy + vy) = dx ^ 2 + dy ^ 2 :=
    le_antisymm hcsUpper hcsLower
  have hdsEq :
      dx * (ux + vx) + dy * (uy + vy) = 2 * (dx ^ 2 + dy ^ 2) := by
    nlinarith only [hkey, hcd, hcsEq, hdpos]
  have hdotUEq : dx * ux + dy * uy = dx ^ 2 + dy ^ 2 := by
    nlinarith only [hdsEq, hdotU, hdotV]
  have hdotVEq : dx * vx + dy * vy = dx ^ 2 + dy ^ 2 := by
    nlinarith only [hdsEq, hdotU, hdotV]
  have huxEq : ux = dx := by
    have hnorm : (ux - dx) ^ 2 + (uy - dy) ^ 2 = 0 := by
      nlinarith only [huxnorm, hdotUEq]
    nlinarith only [hnorm, sq_nonneg (ux - dx), sq_nonneg (uy - dy)]
  have huyEq : uy = dy := by
    have hnorm : (ux - dx) ^ 2 + (uy - dy) ^ 2 = 0 := by
      nlinarith only [huxnorm, hdotUEq]
    nlinarith only [hnorm, sq_nonneg (ux - dx), sq_nonneg (uy - dy)]
  have hvxEq : vx = dx := by
    have hnorm : (vx - dx) ^ 2 + (vy - dy) ^ 2 = 0 := by
      nlinarith only [hvnorm, hdotVEq]
    nlinarith only [hnorm, sq_nonneg (vx - dx), sq_nonneg (vy - dy)]
  have hvyEq : vy = dy := by
    have hnorm : (vx - dx) ^ 2 + (vy - dy) ^ 2 = 0 := by
      nlinarith only [hvnorm, hdotVEq]
    nlinarith only [hnorm, sq_nonneg (vx - dx), sq_nonneg (vy - dy)]
  apply hne
  have hX0 : X 0 = P 0 := by
    dsimp [ux, dx] at huxEq
    linarith
  have hY0 : Y 0 = P 0 := by
    dsimp [vx, dx] at hvxEq
    linarith
  have hX1 : X 1 = P 1 := by
    dsimp [uy, dy] at huyEq
    linarith
  have hY1 : Y 1 = P 1 := by
    dsimp [vy, dy] at hvyEq
    linarith
  exact hpoint_eq_of_coords (hX0.trans hY0.symm) (hX1.trans hY1.symm)

end Erdos9796Proof.Geometry
