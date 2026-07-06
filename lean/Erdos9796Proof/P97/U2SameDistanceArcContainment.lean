/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Foundation
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Same-distance disk containment for U2.B

This module proves the local geometric containment used by the U2.B reverse
cap-containment route.  If the apex and two chord endpoints lie on a circle
centered at `O`, the endpoints and a point `p` are all at the same distance
from the apex, and `p` lies in the closed disk, then `p` is on the closed
opposite arc cut by the chord.

The proof does not identify signed area directly with a half-plane functional.
It first shows that the chord endpoints lie on the radical axis and uses the
resulting proportionality between signed area to the chord and the radical-axis
half-plane functional.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97

private theorem coord_line_ratio_identity
    (ax ay e1x e1y e2x e2y px py C : ℝ)
    (he1 : e1x * ax + e1y * ay = C)
    (he2 : e2x * ax + e2y * ay = C) :
    (((e1x - px) * (e2y - py) - (e2x - px) * (e1y - py)) *
        (ax * ax + ay * ay - C))
      = (((e1x - ax) * (e2y - ay) - (e2x - ax) * (e1y - ay)) *
        (px * ax + py * ay - C)) := by
  subst C
  linear_combination (norm := ring_nf)
    (-(ax * e1y - ax * py - ay * e1x + ay * px + e1x * py - e1y * px)) * he2

private theorem sameDist_disk_onArcOpposite_coord_centered
    (ax ay e1x e1y e2x e2y px py R d : ℝ)
    (hdpos : 0 < d)
    (hA : ax ^ 2 + ay ^ 2 = R ^ 2)
    (hE1 : e1x ^ 2 + e1y ^ 2 = R ^ 2)
    (hE2 : e2x ^ 2 + e2y ^ 2 = R ^ 2)
    (hE1A : (e1x - ax) ^ 2 + (e1y - ay) ^ 2 = d ^ 2)
    (hE2A : (e2x - ax) ^ 2 + (e2y - ay) ^ 2 = d ^ 2)
    (hPA : (px - ax) ^ 2 + (py - ay) ^ 2 = d ^ 2)
    (hPDisk : px ^ 2 + py ^ 2 ≤ R ^ 2) :
    (((e1x - px) * (e2y - py) - (e2x - px) * (e1y - py)) *
      ((e1x - ax) * (e2y - ay) - (e2x - ax) * (e1y - ay))) ≤ 0 := by
  let C : ℝ := R ^ 2 - d ^ 2 / 2
  let pHP : ℝ := px * ax + py * ay - C
  let aHP : ℝ := ax * ax + ay * ay - C
  let sp : ℝ := (e1x - px) * (e2y - py) - (e2x - px) * (e1y - py)
  let sa : ℝ := (e1x - ax) * (e2y - ay) - (e2x - ax) * (e1y - ay)
  have hpHP_nonpos : pHP ≤ 0 := by
    have hfact : px ^ 2 + py ^ 2 - R ^ 2 = 2 * pHP := by
      dsimp [pHP, C]
      linear_combination (norm := ring_nf) hPA - hA
    nlinarith [hPDisk, hfact]
  have haHP_pos : 0 < aHP := by
    have hsq : 0 < d ^ 2 / 2 := by positivity
    dsimp [aHP, C]
    nlinarith [hA, hsq]
  have he1HP_zero : e1x * ax + e1y * ay = C := by
    dsimp [C]
    linear_combination (norm := ring_nf)
      (1 / 2) * hA + (1 / 2) * hE1 - (1 / 2) * hE1A
  have he2HP_zero : e2x * ax + e2y * ay = C := by
    dsimp [C]
    linear_combination (norm := ring_nf)
      (1 / 2) * hA + (1 / 2) * hE2 - (1 / 2) * hE2A
  have hratio : sp * aHP = sa * pHP := by
    dsimp [sp, sa, pHP, aHP]
    exact coord_line_ratio_identity ax ay e1x e1y e2x e2y px py C
      he1HP_zero he2HP_zero
  have hprod_aHP : (sp * sa) * aHP ≤ 0 := by
    have hEq : (sp * sa) * aHP = sa ^ 2 * pHP := by
      calc
        (sp * sa) * aHP = sa * (sp * aHP) := by ring
        _ = sa * (sa * pHP) := by rw [hratio]
        _ = sa ^ 2 * pHP := by ring
    have hsq_nonneg : 0 ≤ sa ^ 2 := sq_nonneg sa
    have hRight : sa ^ 2 * pHP ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos hsq_nonneg hpHP_nonpos
    rw [hEq]
    exact hRight
  have hprod : sp * sa ≤ 0 := by
    have hle : (sp * sa) * aHP ≤ 0 * aHP := by simpa using hprod_aHP
    exact (mul_le_mul_iff_of_pos_right haHP_pos).mp hle
  simpa [sp, sa] using hprod

private theorem dist_sq_coord (u v : ℝ²) :
    dist u v ^ 2 = (u 0 - v 0) ^ 2 + (u 1 - v 1) ^ 2 := by
  rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]

/-- Same-distance points in the MEC disk lie on the closed arc opposite the
apex.  This is the local U2.B containment step: the chord endpoints and apex
are on the boundary circle centered at `O`, `e₁`, `e₂`, and `p` are at the
same distance `d` from the apex, and `p` is in the closed disk. -/
theorem onArcOpposite_of_sameDist_apex_of_mem_mecDisk
    {O apex e₁ e₂ p : ℝ²} {R d : ℝ}
    (hRpos : 0 < R) (hdpos : 0 < d)
    (hapexO : dist apex O = R)
    (he₁O : dist e₁ O = R)
    (he₂O : dist e₂ O = R)
    (he₁A : dist e₁ apex = d)
    (he₂A : dist e₂ apex = d)
    (hpA : dist p apex = d)
    (hpDisk : dist p O ≤ R) :
    OnArcOpposite apex e₁ e₂ p := by
  have hapexO_sq : (apex 0 - O 0) ^ 2 + (apex 1 - O 1) ^ 2 = R ^ 2 := by
    have h : dist apex O ^ 2 = R ^ 2 := by rw [hapexO]
    rwa [dist_sq_coord] at h
  have he₁O_sq : (e₁ 0 - O 0) ^ 2 + (e₁ 1 - O 1) ^ 2 = R ^ 2 := by
    have h : dist e₁ O ^ 2 = R ^ 2 := by rw [he₁O]
    rwa [dist_sq_coord] at h
  have he₂O_sq : (e₂ 0 - O 0) ^ 2 + (e₂ 1 - O 1) ^ 2 = R ^ 2 := by
    have h : dist e₂ O ^ 2 = R ^ 2 := by rw [he₂O]
    rwa [dist_sq_coord] at h
  have he₁A_sq : ((e₁ 0 - O 0) - (apex 0 - O 0)) ^ 2 +
      ((e₁ 1 - O 1) - (apex 1 - O 1)) ^ 2 = d ^ 2 := by
    have h : dist e₁ apex ^ 2 = d ^ 2 := by rw [he₁A]
    rw [dist_sq_coord] at h
    linear_combination (norm := ring_nf) h
  have he₂A_sq : ((e₂ 0 - O 0) - (apex 0 - O 0)) ^ 2 +
      ((e₂ 1 - O 1) - (apex 1 - O 1)) ^ 2 = d ^ 2 := by
    have h : dist e₂ apex ^ 2 = d ^ 2 := by rw [he₂A]
    rw [dist_sq_coord] at h
    linear_combination (norm := ring_nf) h
  have hpA_sq : ((p 0 - O 0) - (apex 0 - O 0)) ^ 2 +
      ((p 1 - O 1) - (apex 1 - O 1)) ^ 2 = d ^ 2 := by
    have h : dist p apex ^ 2 = d ^ 2 := by rw [hpA]
    rw [dist_sq_coord] at h
    linear_combination (norm := ring_nf) h
  have hpDisk_sq_dist : dist p O ^ 2 ≤ R ^ 2 := by
    have hdist_nonneg : 0 ≤ dist p O := dist_nonneg
    nlinarith [hRpos, hpDisk, hdist_nonneg]
  have hpDisk_sq : (p 0 - O 0) ^ 2 + (p 1 - O 1) ^ 2 ≤ R ^ 2 := by
    rwa [dist_sq_coord] at hpDisk_sq_dist
  have hcoord := sameDist_disk_onArcOpposite_coord_centered
    (apex 0 - O 0) (apex 1 - O 1)
    (e₁ 0 - O 0) (e₁ 1 - O 1)
    (e₂ 0 - O 0) (e₂ 1 - O 1)
    (p 0 - O 0) (p 1 - O 1) R d
    hdpos hapexO_sq he₁O_sq he₂O_sq he₁A_sq he₂A_sq hpA_sq hpDisk_sq
  unfold OnArcOpposite signedArea2
  linear_combination (norm := ring_nf) hcoord
  norm_num

end Problem97
