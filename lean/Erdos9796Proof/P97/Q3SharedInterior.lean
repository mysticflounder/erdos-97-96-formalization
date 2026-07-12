/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.CircumscribedMECPacket
import Erdos9796Proof.P97.SurplusM44Packet
import Erdos9796Proof.P97.U2.SimilarityNormalization

/-!
# Normalized shared-interior Q3 kernel

This file formalizes the coordinate algebra behind the K-Q3-5 exclusion.
After a similarity sends the two Moser vertices to `(0, 0)` and `(1, 0)`, a
point shared by their two selected radius classes cannot lie in the strict
interior of the third cap.  The packet-level normalization and cap-membership
adapters are intentionally separate: the lemmas here expose their exact
scalar obligations without assuming a particular selected-class interface.

The normalized MEC-disk transport below discharges the scalar `hdisk` premise
from an arbitrary two-boundary-point disk.  It is deliberately independent of
any particular Moser-triangle or selected-class packet.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem q3_dist_sq_coord (x c : ℝ²) :
    dist x c ^ 2 = (x 0 - c 0) ^ 2 + (x 1 - c 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

private theorem normSim_base_sq_pos {p₁ p₂ : ℝ²} (hp : p₁ ≠ p₂) :
    0 < (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := by
  rw [← q3_dist_sq_coord p₂ p₁]
  exact sq_pos_of_pos (dist_pos.mpr hp.symm)

private theorem signedArea2_normSim_base_eq_snd
    (p₁ p₂ u : ℝ²) (hp : p₁ ≠ p₂) :
    signedArea2 (normSim p₁ p₂ p₁) (normSim p₁ p₂ p₂)
      (normSim p₁ p₂ u) = normSim p₁ p₂ u 1 := by
  rw [normSim_fst, normSim_snd p₁ p₂ hp]
  simp [signedArea2, pt]

/-- After normalizing two distinct equidistant boundary points to `(0,0)` and
`(1,0)`, the disk center has first coordinate `1 / 2`. -/
theorem normSim_center_fst_eq_half_of_equidistant
    {p₁ p₂ center : ℝ²} (hp : p₁ ≠ p₂)
    (hboundary : dist p₁ center = dist p₂ center) :
    normSim p₁ p₂ center 0 = 1 / 2 := by
  have h₁ := normSim_dist_image p₁ p₂ hp p₁ center
  have h₂ := normSim_dist_image p₁ p₂ hp p₂ center
  rw [normSim_fst] at h₁
  rw [normSim_snd p₁ p₂ hp] at h₂
  rw [hboundary] at h₁
  have heq :
      dist (pt 0 0) (normSim p₁ p₂ center) =
        dist (pt 1 0) (normSim p₁ p₂ center) := by
    exact h₁.trans h₂.symm
  have hsq :
      dist (pt 0 0) (normSim p₁ p₂ center) ^ 2 =
        dist (pt 1 0) (normSim p₁ p₂ center) ^ 2 := by
    exact congrArg (fun r : ℝ => r ^ 2) heq
  rw [q3_dist_sq_coord, q3_dist_sq_coord] at hsq
  simp [pt] at hsq
  nlinarith

/-- A normalizing similarity transports a disk through two equal-boundary
points to the scalar disk inequality used by the K-Q3-5 core. -/
theorem normSim_mec_disk_normalized
    {p₁ p₂ center x : ℝ²} (hp : p₁ ≠ p₂)
    (hboundary : dist p₁ center = dist p₂ center)
    (hxdisk : dist x center ≤ dist p₁ center) :
    (normSim p₁ p₂ x 0 - 1 / 2) ^ 2 +
        (normSim p₁ p₂ x 1 - normSim p₁ p₂ center 1) ^ 2 ≤
      1 / 4 + (normSim p₁ p₂ center 1) ^ 2 := by
  have h₁ := normSim_dist_image p₁ p₂ hp p₁ center
  have hx := normSim_dist_image p₁ p₂ hp x center
  rw [normSim_fst] at h₁
  have hscale_nonneg : 0 ≤ (dist p₁ p₂)⁻¹ := inv_nonneg.mpr dist_nonneg
  have hdist :
      dist (normSim p₁ p₂ x) (normSim p₁ p₂ center) ≤
        dist (pt 0 0) (normSim p₁ p₂ center) := by
    rw [hx, h₁]
    exact mul_le_mul_of_nonneg_left hxdisk hscale_nonneg
  have hsq :
      dist (normSim p₁ p₂ x) (normSim p₁ p₂ center) ^ 2 ≤
        dist (pt 0 0) (normSim p₁ p₂ center) ^ 2 := by
    have hdiff :
        0 ≤ dist (pt 0 0) (normSim p₁ p₂ center) -
          dist (normSim p₁ p₂ x) (normSim p₁ p₂ center) :=
      sub_nonneg.mpr hdist
    have hsum :
        0 ≤ dist (pt 0 0) (normSim p₁ p₂ center) +
          dist (normSim p₁ p₂ x) (normSim p₁ p₂ center) :=
      add_nonneg dist_nonneg dist_nonneg
    nlinarith [mul_nonneg hdiff hsum]
  rw [q3_dist_sq_coord, q3_dist_sq_coord] at hsq
  have hsq' :
      (normSim p₁ p₂ x 0 - normSim p₁ p₂ center 0) ^ 2 +
          (normSim p₁ p₂ x 1 - normSim p₁ p₂ center 1) ^ 2 ≤
        normSim p₁ p₂ center 0 ^ 2 + normSim p₁ p₂ center 1 ^ 2 := by
    simpa only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub, neg_sq]
      using hsq
  rw [normSim_center_fst_eq_half_of_equidistant hp hboundary] at hsq'
  nlinarith

/-- A circumscribed MEC packet supplies the normalized disk inequality for
every ambient point. -/
theorem CircumscribedMECPacket.normSim_mec_disk_normalized
    {A : Finset ℝ²} {M : MoserTriangle A}
    (P : CircumscribedMECPacket A M) {x : ℝ²} (hx : x ∈ A) :
    (normSim M.v1 M.v2 x 0 - 1 / 2) ^ 2 +
        (normSim M.v1 M.v2 x 1 - normSim M.v1 M.v2 P.center 1) ^ 2 ≤
      1 / 4 + (normSim M.v1 M.v2 P.center 1) ^ 2 := by
  have hboundary : dist M.v1 P.center = dist M.v2 P.center := by
    calc
      dist M.v1 P.center = P.radius := by
        simpa only [dist_eq_norm] using P.moser_on_boundary_1
      _ = dist M.v2 P.center := by
        symm
        simpa only [dist_eq_norm] using P.moser_on_boundary_2
  have hxdisk : dist x P.center ≤ dist M.v1 P.center := by
    calc
      dist x P.center ≤ P.radius := by
        simpa only [dist_eq_norm] using P.disk_contains_A x hx
      _ = dist M.v1 P.center := by
        symm
        simpa only [dist_eq_norm] using P.moser_on_boundary_1
  exact Problem97.normSim_mec_disk_normalized M.v12_ne hboundary hxdisk

/-- Squared distances under `normSim`, cleared by the positive base-length
square. -/
theorem normSim_sqdist_mul_base_sq
    (p₁ p₂ a b : ℝ²) (hp : p₁ ≠ p₂) :
    dist p₁ p₂ ^ 2 *
        dist (normSim p₁ p₂ a) (normSim p₁ p₂ b) ^ 2 =
      dist a b ^ 2 := by
  rw [normSim_dist_image p₁ p₂ hp]
  have hbase_ne : dist p₁ p₂ ≠ 0 := ne_of_gt (dist_pos.mpr hp)
  field_simp [hbase_ne]

/-- Equal distances from the first normalizing base point give equal squared
normalized coordinate distances to `(0, 0)`. -/
theorem normSim_sqdist_from_fst_eq_of_dist_eq
    {p₁ p₂ x y : ℝ²} (hp : p₁ ≠ p₂)
    (hxy : dist p₁ x = dist p₁ y) :
    (normSim p₁ p₂ x 0) ^ 2 + (normSim p₁ p₂ x 1) ^ 2 =
      (normSim p₁ p₂ y 0) ^ 2 + (normSim p₁ p₂ y 1) ^ 2 := by
  have hx := normSim_dist_image p₁ p₂ hp p₁ x
  have hy := normSim_dist_image p₁ p₂ hp p₁ y
  rw [normSim_fst] at hx hy
  have hdist :
      dist (pt 0 0) (normSim p₁ p₂ x) =
        dist (pt 0 0) (normSim p₁ p₂ y) := by
    calc
      dist (pt 0 0) (normSim p₁ p₂ x) = (dist p₁ p₂)⁻¹ * dist p₁ x := hx
      _ = (dist p₁ p₂)⁻¹ * dist p₁ y := by rw [hxy]
      _ = dist (pt 0 0) (normSim p₁ p₂ y) := hy.symm
  have hsq := congrArg (fun r : ℝ => r ^ 2) hdist
  change dist (pt 0 0) (normSim p₁ p₂ x) ^ 2 =
    dist (pt 0 0) (normSim p₁ p₂ y) ^ 2 at hsq
  rw [q3_dist_sq_coord, q3_dist_sq_coord] at hsq
  simpa only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub, neg_sq]
    using hsq

/-- Equal distances from the second normalizing base point give equal squared
normalized coordinate distances to `(1, 0)`. -/
theorem normSim_sqdist_from_snd_eq_of_dist_eq
    {p₁ p₂ x y : ℝ²} (hp : p₁ ≠ p₂)
    (hxy : dist p₂ x = dist p₂ y) :
    (normSim p₁ p₂ x 0 - 1) ^ 2 + (normSim p₁ p₂ x 1) ^ 2 =
      (normSim p₁ p₂ y 0 - 1) ^ 2 + (normSim p₁ p₂ y 1) ^ 2 := by
  have hx := normSim_dist_image p₁ p₂ hp p₂ x
  have hy := normSim_dist_image p₁ p₂ hp p₂ y
  rw [normSim_snd p₁ p₂ hp] at hx hy
  have hdist :
      dist (pt 1 0) (normSim p₁ p₂ x) =
        dist (pt 1 0) (normSim p₁ p₂ y) := by
    calc
      dist (pt 1 0) (normSim p₁ p₂ x) = (dist p₁ p₂)⁻¹ * dist p₂ x := hx
      _ = (dist p₁ p₂)⁻¹ * dist p₂ y := by rw [hxy]
      _ = dist (pt 1 0) (normSim p₁ p₂ y) := hy.symm
  have hsq := congrArg (fun r : ℝ => r ^ 2) hdist
  change dist (pt 1 0) (normSim p₁ p₂ x) ^ 2 =
    dist (pt 1 0) (normSim p₁ p₂ y) ^ 2 at hsq
  rw [q3_dist_sq_coord, q3_dist_sq_coord] at hsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub, neg_sq] at hsq
  nlinarith

/-- Nonobtuseness at the first normalized base vertex forces the third point's
first coordinate to be nonnegative. -/
theorem normSim_fst_nonneg_of_nonobtuse_at_fst
    {p₁ p₂ u : ℝ²} (hp : p₁ ≠ p₂)
    (hinner : 0 ≤ inner ℝ (p₂ - p₁) (u - p₁)) :
    0 ≤ normSim p₁ p₂ u 0 := by
  have hpolar :
      dist p₂ u ^ 2 =
        dist p₁ p₂ ^ 2 - 2 * inner ℝ (p₂ - p₁) (u - p₁) +
          dist u p₁ ^ 2 := by
    have hsub : (p₂ - p₁) - (u - p₁) = p₂ - u := by abel
    simpa [dist_eq_norm, hsub, norm_sub_rev] using
      (norm_sub_sq_real (p₂ - p₁) (u - p₁))
  have hpolar' :
      dist p₂ u ^ 2 =
        dist p₁ p₂ ^ 2 - 2 * inner ℝ (p₂ - p₁) (u - p₁) +
          dist p₁ u ^ 2 := by
    rw [dist_comm u p₁] at hpolar
    exact hpolar
  have hraw : dist p₂ u ^ 2 ≤ dist p₁ p₂ ^ 2 + dist p₁ u ^ 2 := by
    nlinarith [hpolar']
  have h₁ := normSim_sqdist_mul_base_sq p₁ p₂ p₁ u hp
  have h₂ := normSim_sqdist_mul_base_sq p₁ p₂ p₂ u hp
  rw [normSim_fst] at h₁
  rw [normSim_snd p₁ p₂ hp] at h₂
  have hbase_sq_pos : 0 < dist p₁ p₂ ^ 2 :=
    sq_pos_of_pos (dist_pos.mpr hp)
  have hnorm :
      dist (pt 1 0) (normSim p₁ p₂ u) ^ 2 ≤
        1 + dist (pt 0 0) (normSim p₁ p₂ u) ^ 2 := by
    by_contra hnot
    have hstrict :
        1 + dist (pt 0 0) (normSim p₁ p₂ u) ^ 2 <
          dist (pt 1 0) (normSim p₁ p₂ u) ^ 2 :=
      lt_of_not_ge hnot
    have hscaled_strict := mul_lt_mul_of_pos_left hstrict hbase_sq_pos
    nlinarith [h₁, h₂]
  have hnorm' :
      dist (normSim p₁ p₂ u) (pt 1 0) ^ 2 ≤
        1 + dist (normSim p₁ p₂ u) (pt 0 0) ^ 2 := by
    simpa only [dist_comm] using hnorm
  rw [q3_dist_sq_coord, q3_dist_sq_coord] at hnorm'
  have hcoord :
      (normSim p₁ p₂ u 0 - 1) ^ 2 + (normSim p₁ p₂ u 1) ^ 2 ≤
        1 + ((normSim p₁ p₂ u 0) ^ 2 + (normSim p₁ p₂ u 1) ^ 2) := by
    simpa only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero]
      using hnorm'
  nlinarith

/-- Nonobtuseness at the second normalized base vertex bounds the third
point's first coordinate above by one. -/
theorem normSim_fst_le_one_of_nonobtuse_at_snd
    {p₁ p₂ u : ℝ²} (hp : p₁ ≠ p₂)
    (hinner : 0 ≤ inner ℝ (u - p₂) (p₁ - p₂)) :
    normSim p₁ p₂ u 0 ≤ 1 := by
  have hpolar :
      dist p₁ u ^ 2 =
        dist p₂ u ^ 2 - 2 * inner ℝ (u - p₂) (p₁ - p₂) +
          dist p₁ p₂ ^ 2 := by
    have hsub : (u - p₂) - (p₁ - p₂) = u - p₁ := by abel
    simpa [dist_eq_norm, hsub, norm_sub_rev] using
      (norm_sub_sq_real (u - p₂) (p₁ - p₂))
  have hraw' : dist p₁ u ^ 2 ≤ dist p₂ u ^ 2 + dist p₁ p₂ ^ 2 := by
    nlinarith [hpolar]
  have hraw : dist p₁ u ^ 2 ≤ dist p₁ p₂ ^ 2 + dist p₂ u ^ 2 := by
    nlinarith [hraw']
  have h₁ := normSim_sqdist_mul_base_sq p₁ p₂ p₁ u hp
  have h₂ := normSim_sqdist_mul_base_sq p₁ p₂ p₂ u hp
  rw [normSim_fst] at h₁
  rw [normSim_snd p₁ p₂ hp] at h₂
  have hbase_sq_pos : 0 < dist p₁ p₂ ^ 2 :=
    sq_pos_of_pos (dist_pos.mpr hp)
  have hnorm :
      dist (pt 0 0) (normSim p₁ p₂ u) ^ 2 ≤
        1 + dist (pt 1 0) (normSim p₁ p₂ u) ^ 2 := by
    by_contra hnot
    have hstrict :
        1 + dist (pt 1 0) (normSim p₁ p₂ u) ^ 2 <
          dist (pt 0 0) (normSim p₁ p₂ u) ^ 2 :=
      lt_of_not_ge hnot
    have hscaled_strict := mul_lt_mul_of_pos_left hstrict hbase_sq_pos
    nlinarith [h₁, h₂]
  have hnorm' :
      dist (normSim p₁ p₂ u) (pt 0 0) ^ 2 ≤
        1 + dist (normSim p₁ p₂ u) (pt 1 0) ^ 2 := by
    simpa only [dist_comm] using hnorm
  rw [q3_dist_sq_coord, q3_dist_sq_coord] at hnorm'
  have hcoord :
      (normSim p₁ p₂ u 0) ^ 2 + (normSim p₁ p₂ u 1) ^ 2 ≤
        1 +
          ((normSim p₁ p₂ u 0 - 1) ^ 2 + (normSim p₁ p₂ u 1) ^ 2) := by
    simpa only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero]
      using hnorm'
  nlinarith

/-- A circumscribed MEC packet supplies both base-vertex nonobtuse coordinate
bounds for its third Moser vertex. -/
theorem CircumscribedMECPacket.normSim_v3_fst_bounds
    {A : Finset ℝ²} {M : MoserTriangle A}
    (P : CircumscribedMECPacket A M) :
    0 ≤ normSim M.v1 M.v2 M.v3 0 ∧ normSim M.v1 M.v2 M.v3 0 ≤ 1 := by
  constructor
  · exact Problem97.normSim_fst_nonneg_of_nonobtuse_at_fst M.v12_ne P.inner_at_v1
  · exact Problem97.normSim_fst_le_one_of_nonobtuse_at_snd M.v12_ne P.inner_at_v2

/-- A positive orientation of an ordered base triangle makes the third
normalized coordinate positive. -/
theorem normSim_snd_pos_of_signedArea2_pos
    {p₁ p₂ u : ℝ²} (hp : p₁ ≠ p₂)
    (hori : 0 < signedArea2 p₁ p₂ u) :
    0 < normSim p₁ p₂ u 1 := by
  have hscale_pos :
      0 < ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2)⁻¹ :=
    inv_pos.mpr (normSim_base_sq_pos hp)
  have himage :
      0 < signedArea2 (normSim p₁ p₂ p₁) (normSim p₁ p₂ p₂)
        (normSim p₁ p₂ u) := by
    rw [signedArea2_normSim p₁ p₂ hp p₁ p₂ u]
    exact mul_pos hscale_pos hori
  rw [signedArea2_normSim_base_eq_snd p₁ p₂ u hp] at himage
  exact himage

/-- A negative orientation of an ordered base triangle makes the third
normalized coordinate negative. -/
theorem normSim_snd_neg_of_signedArea2_neg
    {p₁ p₂ u : ℝ²} (hp : p₁ ≠ p₂)
    (hori : signedArea2 p₁ p₂ u < 0) :
    normSim p₁ p₂ u 1 < 0 := by
  have hscale_pos :
      0 < ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2)⁻¹ :=
    inv_pos.mpr (normSim_base_sq_pos hp)
  have himage :
      signedArea2 (normSim p₁ p₂ p₁) (normSim p₁ p₂ p₂)
        (normSim p₁ p₂ u) < 0 := by
    rw [signedArea2_normSim p₁ p₂ hp p₁ p₂ u]
    exact mul_neg_of_pos_of_neg hscale_pos hori
  rw [signedArea2_normSim_base_eq_snd p₁ p₂ u hp] at himage
  exact himage

/-- A positively oriented indexed cap sends each strict interior point below
its normalized support chord. -/
theorem SurplusCapPacket.normSim_capInterior_snd_neg
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {x : ℝ²} (hxI : x ∈ S.capInteriorByIndex i)
    (hori : 0 < signedArea2 (S.triangleByIndex i).v1
      (S.triangleByIndex i).v2 (S.triangleByIndex i).v3) :
    normSim (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 x 1 < 0 := by
  apply Problem97.normSim_snd_neg_of_signedArea2_neg (S.triangleByIndex i).v23_ne
  have hcyclic :
      signedArea2 (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 x =
        signedArea2 x (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 := by
    unfold signedArea2
    ring
  rw [hcyclic]
  exact S.signedArea2_neg_of_mem_capInteriorByIndex_of_oriented hconv i hxI hori

private theorem signedArea2_normSim_mul_neg
    (p₁ p₂ a b c d e f : ℝ²) (hp : p₁ ≠ p₂)
    (hprod : signedArea2 a b c * signedArea2 d e f < 0) :
    signedArea2 (normSim p₁ p₂ a) (normSim p₁ p₂ b) (normSim p₁ p₂ c) *
      signedArea2 (normSim p₁ p₂ d) (normSim p₁ p₂ e) (normSim p₁ p₂ f) < 0 := by
  let scale : ℝ := ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2)⁻¹
  have hscale : 0 < scale := by
    dsimp [scale]
    exact inv_pos.mpr (normSim_base_sq_pos hp)
  rw [signedArea2_normSim p₁ p₂ hp a b c,
    signedArea2_normSim p₁ p₂ hp d e f]
  change (scale * signedArea2 a b c) * (scale * signedArea2 d e f) < 0
  calc
    (scale * signedArea2 a b c) * (scale * signedArea2 d e f) =
        (scale * scale) * (signedArea2 a b c * signedArea2 d e f) := by ring
    _ < 0 := mul_neg_of_pos_of_neg (mul_pos hscale hscale) hprod

/-- A strict cap-side signed-area product transports to the left strict side
inequality of the normalized K-Q3-5 kernel. -/
theorem normSim_left_cap_side_of_signedArea2_mul_neg
    {v w u p : ℝ²} (hvw : v ≠ w)
    (hside : signedArea2 p w u * signedArea2 v w u < 0) :
    ((1 - normSim v w p 0) * (normSim v w u 1 - normSim v w p 1) -
        (normSim v w u 0 - normSim v w p 0) * (0 - normSim v w p 1)) *
      normSim v w u 1 < 0 := by
  have h := signedArea2_normSim_mul_neg v w p w u v w u hvw hside
  rw [normSim_fst, normSim_snd v w hvw] at h
  simpa [signedArea2, pt] using h

/-- A strict cap-side signed-area product transports to the right strict side
inequality of the normalized K-Q3-5 kernel. -/
theorem normSim_right_cap_side_of_signedArea2_mul_neg
    {v w u q : ℝ²} (hvw : v ≠ w)
    (hside : signedArea2 q u v * signedArea2 w u v < 0) :
    ((normSim v w u 0 - normSim v w q 0) * (0 - normSim v w q 1) -
        (0 - normSim v w q 0) * (normSim v w u 1 - normSim v w q 1)) *
      normSim v w u 1 < 0 := by
  have h := signedArea2_normSim_mul_neg v w q u v w u v hvw hside
  rw [normSim_fst, normSim_snd v w hvw] at h
  simpa [signedArea2, pt] using h

/-- A normalizing similarity transports nonobtuseness at a third point to the
scalar apex inequality used by the K-Q3-5 core. -/
theorem normSim_nonobtuse_apex_normalized
    {p₁ p₂ u : ℝ²} (hp : p₁ ≠ p₂)
    (hinner : 0 ≤ inner ℝ (p₁ - u) (p₂ - u)) :
    0 ≤ (normSim p₁ p₂ u 0) ^ 2 - normSim p₁ p₂ u 0 +
      (normSim p₁ p₂ u 1) ^ 2 := by
  have hpolar :
      dist p₁ p₂ ^ 2 =
        dist p₁ u ^ 2 - 2 * inner ℝ (p₁ - u) (p₂ - u) + dist p₂ u ^ 2 := by
    have hsub : (p₁ - u) - (p₂ - u) = p₁ - p₂ := by abel
    simpa [dist_eq_norm, hsub, norm_sub_rev] using
      (norm_sub_sq_real (p₁ - u) (p₂ - u))
  have hraw : dist p₁ p₂ ^ 2 ≤ dist p₁ u ^ 2 + dist p₂ u ^ 2 := by
    nlinarith [hpolar]
  have h₁ := normSim_dist_image p₁ p₂ hp p₁ u
  have h₂ := normSim_dist_image p₁ p₂ hp p₂ u
  rw [normSim_fst] at h₁
  rw [normSim_snd p₁ p₂ hp] at h₂
  have hbase_pos : 0 < dist p₁ p₂ := dist_pos.mpr hp
  have hbase_ne : dist p₁ p₂ ≠ 0 := ne_of_gt hbase_pos
  have hscaled :
      dist p₁ p₂ ^ 2 *
          (dist (pt 0 0) (normSim p₁ p₂ u) ^ 2 +
            dist (pt 1 0) (normSim p₁ p₂ u) ^ 2) =
        dist p₁ u ^ 2 + dist p₂ u ^ 2 := by
    rw [h₁, h₂]
    field_simp [hbase_ne]
  have hnorm :
      1 ≤ dist (pt 0 0) (normSim p₁ p₂ u) ^ 2 +
        dist (pt 1 0) (normSim p₁ p₂ u) ^ 2 := by
    have hbase_sq_pos : 0 < dist p₁ p₂ ^ 2 := sq_pos_of_pos hbase_pos
    nlinarith [hscaled]
  have hnorm' :
      1 ≤ dist (normSim p₁ p₂ u) (pt 0 0) ^ 2 +
        dist (normSim p₁ p₂ u) (pt 1 0) ^ 2 := by
    simpa only [dist_comm] using hnorm
  rw [q3_dist_sq_coord, q3_dist_sq_coord] at hnorm'
  have hcoord :
      1 ≤ (normSim p₁ p₂ u 0) ^ 2 + (normSim p₁ p₂ u 1) ^ 2 +
        (normSim p₁ p₂ u 0 - 1) ^ 2 + (normSim p₁ p₂ u 1) ^ 2 := by
    simpa only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero, add_assoc]
      using hnorm'
  nlinarith

/-- A circumscribed MEC packet transports its nonobtuse condition at the
third Moser vertex to the K-Q3-5 scalar apex inequality. -/
theorem CircumscribedMECPacket.normSim_nonobtuse_at_v3_normalized
    {A : Finset ℝ²} {M : MoserTriangle A}
    (P : CircumscribedMECPacket A M) :
    0 ≤ (normSim M.v1 M.v2 M.v3 0) ^ 2 - normSim M.v1 M.v2 M.v3 0 +
      (normSim M.v1 M.v2 M.v3 1) ^ 2 :=
  Problem97.normSim_nonobtuse_apex_normalized M.v12_ne P.inner_at_v3

/-- A normalized circumcenter through the ordered nonobtuse base triangle has
nonnegative second coordinate. -/
theorem normSim_center_snd_nonneg_of_nonobtuse
    {p₁ p₂ u center : ℝ²} (hp : p₁ ≠ p₂)
    (hboundary12 : dist p₁ center = dist p₂ center)
    (hboundary13 : dist p₁ center = dist u center)
    (hori : 0 < signedArea2 p₁ p₂ u)
    (hinner : 0 ≤ inner ℝ (p₁ - u) (p₂ - u)) :
    0 ≤ normSim p₁ p₂ center 1 := by
  have hcenterx := normSim_center_fst_eq_half_of_equidistant hp hboundary12
  have huy : 0 < normSim p₁ p₂ u 1 :=
    normSim_snd_pos_of_signedArea2_pos hp hori
  have hapex :
      0 ≤ (normSim p₁ p₂ u 0) ^ 2 - normSim p₁ p₂ u 0 +
        (normSim p₁ p₂ u 1) ^ 2 :=
    normSim_nonobtuse_apex_normalized hp hinner
  have h₁ := normSim_dist_image p₁ p₂ hp p₁ center
  have h₃ := normSim_dist_image p₁ p₂ hp u center
  rw [normSim_fst] at h₁
  have hdist :
      dist (pt 0 0) (normSim p₁ p₂ center) =
        dist (normSim p₁ p₂ u) (normSim p₁ p₂ center) := by
    calc
      dist (pt 0 0) (normSim p₁ p₂ center) =
          (dist p₁ p₂)⁻¹ * dist p₁ center := h₁
      _ = (dist p₁ p₂)⁻¹ * dist u center := by rw [hboundary13]
      _ = dist (normSim p₁ p₂ u) (normSim p₁ p₂ center) := h₃.symm
  have hsq := congrArg (fun r : ℝ => r ^ 2) hdist
  dsimp only at hsq
  rw [q3_dist_sq_coord, q3_dist_sq_coord] at hsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hsq
  rw [hcenterx] at hsq
  by_contra hnot
  have hcenter_neg : normSim p₁ p₂ center 1 < 0 := lt_of_not_ge hnot
  have hcoef : 0 < 2 * normSim p₁ p₂ u 1 := by positivity
  have hproduct_neg :
      2 * normSim p₁ p₂ u 1 * normSim p₁ p₂ center 1 < 0 :=
    mul_neg_of_pos_of_neg hcoef hcenter_neg
  nlinarith [hsq, hapex]

/-- A circumscribed MEC packet has nonnegative normalized center height once
the Moser vertices are oriented positively. -/
theorem CircumscribedMECPacket.normSim_center_snd_nonneg
    {A : Finset ℝ²} {M : MoserTriangle A}
    (P : CircumscribedMECPacket A M)
    (hori : 0 < signedArea2 M.v1 M.v2 M.v3) :
    0 ≤ normSim M.v1 M.v2 P.center 1 := by
  have hboundary12 : dist M.v1 P.center = dist M.v2 P.center := by
    calc
      dist M.v1 P.center = P.radius := by
        simpa only [dist_eq_norm] using P.moser_on_boundary_1
      _ = dist M.v2 P.center := by
        symm
        simpa only [dist_eq_norm] using P.moser_on_boundary_2
  have hboundary13 : dist M.v1 P.center = dist M.v3 P.center := by
    calc
      dist M.v1 P.center = P.radius := by
        simpa only [dist_eq_norm] using P.moser_on_boundary_1
      _ = dist M.v3 P.center := by
        symm
        simpa only [dist_eq_norm] using P.moser_on_boundary_3
  exact Problem97.normSim_center_snd_nonneg_of_nonobtuse M.v12_ne hboundary12
    hboundary13 hori P.inner_at_v3

/-- A point below the base chord and inside the normalized MEC disk has total
squared distance at most one from the two base vertices. -/
theorem q3_shared_sum_sq_le_one
    {omega zx zy : ℝ}
    (homega : 0 ≤ omega) (hbelow : zy < 0)
    (hdisk : (zx - 1 / 2) ^ 2 + (zy - omega) ^ 2 ≤ 1 / 4 + omega ^ 2) :
    zx ^ 2 + zy ^ 2 + (zx - 1) ^ 2 + zy ^ 2 ≤ 1 := by
  have hproduct : omega * zy ≤ 0 :=
    mul_nonpos_of_nonneg_of_nonpos homega (le_of_lt hbelow)
  nlinarith

/-- In the normalized nonobtuse triangle with apex `(ux, uy)`, the squared
distances from the base vertices to their opposite chords have sum at least
one after clearing positive denominators. -/
theorem q3_nonobtuse_chord_product_le
    {ux uy : ℝ}
    (hux0 : 0 ≤ ux) (hux1 : ux ≤ 1)
    (hapex : 0 ≤ ux ^ 2 - ux + uy ^ 2) :
    ((1 - ux) ^ 2 + uy ^ 2) * (ux ^ 2 + uy ^ 2) ≤
      uy ^ 2 * (((1 - ux) ^ 2 + uy ^ 2) + (ux ^ 2 + uy ^ 2)) := by
  let t : ℝ := ux * (1 - ux)
  have ht : 0 ≤ t := by
    exact mul_nonneg hux0 (sub_nonneg.mpr hux1)
  have ht_le : t ≤ uy ^ 2 := by
    dsimp [t]
    nlinarith
  have hfactor :
      uy ^ 2 * (((1 - ux) ^ 2 + uy ^ 2) + (ux ^ 2 + uy ^ 2)) -
          ((1 - ux) ^ 2 + uy ^ 2) * (ux ^ 2 + uy ^ 2) =
        (uy ^ 2 - t) * (uy ^ 2 + t) := by
    dsimp [t]
    ring
  have hnonneg : 0 ≤ (uy ^ 2 - t) * (uy ^ 2 + t) :=
    mul_nonneg (sub_nonneg.mpr ht_le) (add_nonneg (sq_nonneg uy) ht)
  linarith

/-- A point strictly beyond the chord from `(1, 0)` to `(ux, uy)` is strictly
farther from `(0, 0)` than that base vertex's perpendicular chord distance. -/
theorem q3_left_cap_strict_lower_sq
    {ux uy px py : ℝ}
    (huy : 0 < uy)
    (hside :
      ((1 - px) * (uy - py) - (ux - px) * (0 - py)) * uy < 0) :
    uy ^ 2 < (px ^ 2 + py ^ 2) * ((1 - ux) ^ 2 + uy ^ 2) := by
  let c : ℝ := (1 - px) * (uy - py) - (ux - px) * (0 - py)
  have hc_neg : c < 0 := by
    by_contra hnot
    have hc : 0 ≤ c := le_of_not_gt hnot
    have hnonneg : 0 ≤ c * uy := mul_nonneg hc (le_of_lt huy)
    exact (not_lt_of_ge hnonneg) (by simpa [c] using hside)
  have hc_two : c - 2 * uy < 0 := by
    linarith
  have hsq_gap : 0 < c * (c - 2 * uy) :=
    mul_pos_of_neg_of_neg hc_neg hc_two
  have hcross :
      (px ^ 2 + py ^ 2) * ((1 - ux) ^ 2 + uy ^ 2) =
        (c - uy) ^ 2 + (px * (ux - 1) + py * uy) ^ 2 := by
    dsimp [c]
    ring
  have hsq : uy ^ 2 < (c - uy) ^ 2 := by
    nlinarith
  rw [hcross]
  nlinarith [sq_nonneg (px * (ux - 1) + py * uy)]

/-- The mirror of `q3_left_cap_strict_lower_sq` for the chord from `(ux, uy)`
to `(0, 0)`. -/
theorem q3_right_cap_strict_lower_sq
    {ux uy qx qy : ℝ}
    (huy : 0 < uy)
    (hside :
      ((ux - qx) * (0 - qy) - (0 - qx) * (uy - qy)) * uy < 0) :
    uy ^ 2 < ((qx - 1) ^ 2 + qy ^ 2) * (ux ^ 2 + uy ^ 2) := by
  let c : ℝ := (ux - qx) * (0 - qy) - (0 - qx) * (uy - qy)
  have hc_neg : c < 0 := by
    by_contra hnot
    have hc : 0 ≤ c := le_of_not_gt hnot
    have hnonneg : 0 ≤ c * uy := mul_nonneg hc (le_of_lt huy)
    exact (not_lt_of_ge hnonneg) (by simpa [c] using hside)
  have hc_two : c - 2 * uy < 0 := by
    linarith
  have hsq_gap : 0 < c * (c - 2 * uy) :=
    mul_pos_of_neg_of_neg hc_neg hc_two
  have hcross :
      ((qx - 1) ^ 2 + qy ^ 2) * (ux ^ 2 + uy ^ 2) =
        (c - uy) ^ 2 + ((qx - 1) * ux + qy * uy) ^ 2 := by
    dsimp [c]
    ring
  have hsq : uy ^ 2 < (c - uy) ^ 2 := by
    nlinarith
  rw [hcross]
  nlinarith [sq_nonneg ((qx - 1) * ux + qy * uy)]

/-- Normalized K-Q3-5 contradiction from the two strict cap-distance lower
bounds.  The two radius-square variables are the squared distances of a shared
point from `(0, 0)` and `(1, 0)`. -/
theorem q3_shared_interior_false_of_lower_bounds_normalized
    {omega zx zy ux uy rhoV2 rhoW2 : ℝ}
    (homega : 0 ≤ omega) (hbelow : zy < 0)
    (hdisk : (zx - 1 / 2) ^ 2 + (zy - omega) ^ 2 ≤ 1 / 4 + omega ^ 2)
    (huy : 0 < uy) (hux0 : 0 ≤ ux) (hux1 : ux ≤ 1)
    (hapex : 0 ≤ ux ^ 2 - ux + uy ^ 2)
    (hrhoV : rhoV2 = zx ^ 2 + zy ^ 2)
    (hrhoW : rhoW2 = (zx - 1) ^ 2 + zy ^ 2)
    (hleft : uy ^ 2 < rhoV2 * ((1 - ux) ^ 2 + uy ^ 2))
    (hright : uy ^ 2 < rhoW2 * (ux ^ 2 + uy ^ 2)) :
    False := by
  let a2 : ℝ := (1 - ux) ^ 2 + uy ^ 2
  let b2 : ℝ := ux ^ 2 + uy ^ 2
  have huy_sq : 0 < uy ^ 2 := sq_pos_of_pos huy
  have ha2_pos : 0 < a2 := by
    dsimp [a2]
    nlinarith [sq_nonneg (1 - ux), huy_sq]
  have hb2_pos : 0 < b2 := by
    dsimp [b2]
    nlinarith [sq_nonneg ux, huy_sq]
  have hdenom_pos : 0 < a2 * b2 := mul_pos ha2_pos hb2_pos
  have hsum : rhoV2 + rhoW2 ≤ 1 := by
    rw [hrhoV, hrhoW]
    simpa only [add_assoc] using q3_shared_sum_sq_le_one homega hbelow hdisk
  have hchord : a2 * b2 ≤ uy ^ 2 * (a2 + b2) := by
    simpa [a2, b2] using
      q3_nonobtuse_chord_product_le hux0 hux1 hapex
  have hleft_mul : uy ^ 2 * b2 < rhoV2 * a2 * b2 := by
    exact mul_lt_mul_of_pos_right (by simpa [a2] using hleft) hb2_pos
  have hright_mul : uy ^ 2 * a2 < rhoW2 * b2 * a2 := by
    exact mul_lt_mul_of_pos_right (by simpa [b2] using hright) ha2_pos
  have hstrict : uy ^ 2 * (a2 + b2) < (rhoV2 + rhoW2) * (a2 * b2) := by
    nlinarith [hleft_mul, hright_mul]
  have hscaled : a2 * b2 < (rhoV2 + rhoW2) * (a2 * b2) :=
    lt_of_le_of_lt hchord hstrict
  have hone : 1 < rhoV2 + rhoW2 := by
    exact lt_of_mul_lt_mul_right (by simpa only [one_mul] using hscaled)
      hdenom_pos.le
  linarith

/-- Normalized K-Q3-5 contradiction with the two cap-side conditions and
radius-square equalities stated directly.  This is the packet-facing scalar
kernel after an affine-normalization adapter has supplied its coordinates. -/
theorem q3_shared_interior_false_normalized
    {omega zx zy ux uy px py qx qy rhoV2 rhoW2 : ℝ}
    (homega : 0 ≤ omega) (hbelow : zy < 0)
    (hdisk : (zx - 1 / 2) ^ 2 + (zy - omega) ^ 2 ≤ 1 / 4 + omega ^ 2)
    (huy : 0 < uy) (hux0 : 0 ≤ ux) (hux1 : ux ≤ 1)
    (hapex : 0 ≤ ux ^ 2 - ux + uy ^ 2)
    (hrhoV_z : rhoV2 = zx ^ 2 + zy ^ 2)
    (hrhoW_z : rhoW2 = (zx - 1) ^ 2 + zy ^ 2)
    (hrhoV_p : rhoV2 = px ^ 2 + py ^ 2)
    (hrhoW_q : rhoW2 = (qx - 1) ^ 2 + qy ^ 2)
    (hleft_side :
      ((1 - px) * (uy - py) - (ux - px) * (0 - py)) * uy < 0)
    (hright_side :
      ((ux - qx) * (0 - qy) - (0 - qx) * (uy - qy)) * uy < 0) :
    False := by
  refine q3_shared_interior_false_of_lower_bounds_normalized
    homega hbelow hdisk huy hux0 hux1 hapex hrhoV_z hrhoW_z ?_ ?_
  · rw [hrhoV_p]
    exact q3_left_cap_strict_lower_sq huy hleft_side
  · rw [hrhoW_q]
    exact q3_right_cap_strict_lower_sq huy hright_side

/-- The K-Q3-5 contradiction stated directly in a positively oriented
support-chord frame. -/
theorem q3_shared_interior_false_of_cap_frame
    {A : Finset ℝ²} {M : MoserTriangle A}
    (P : CircumscribedMECPacket A M) {z p q : ℝ²} (hz : z ∈ A)
    (hori : 0 < signedArea2 M.v1 M.v2 M.v3)
    (hbelow : normSim M.v1 M.v2 z 1 < 0)
    (hV : dist M.v1 z = dist M.v1 p)
    (hW : dist M.v2 z = dist M.v2 q)
    (hleft : signedArea2 p M.v2 M.v3 *
      signedArea2 M.v1 M.v2 M.v3 < 0)
    (hright : signedArea2 q M.v3 M.v1 *
      signedArea2 M.v2 M.v3 M.v1 < 0) :
    False := by
  refine q3_shared_interior_false_normalized
    (omega := normSim M.v1 M.v2 P.center 1)
    (zx := normSim M.v1 M.v2 z 0)
    (zy := normSim M.v1 M.v2 z 1)
    (ux := normSim M.v1 M.v2 M.v3 0)
    (uy := normSim M.v1 M.v2 M.v3 1)
    (px := normSim M.v1 M.v2 p 0)
    (py := normSim M.v1 M.v2 p 1)
    (qx := normSim M.v1 M.v2 q 0)
    (qy := normSim M.v1 M.v2 q 1)
    (rhoV2 := (normSim M.v1 M.v2 z 0) ^ 2 +
      (normSim M.v1 M.v2 z 1) ^ 2)
    (rhoW2 := (normSim M.v1 M.v2 z 0 - 1) ^ 2 +
      (normSim M.v1 M.v2 z 1) ^ 2)
    (P.normSim_center_snd_nonneg hori) hbelow
    (P.normSim_mec_disk_normalized hz)
    (normSim_snd_pos_of_signedArea2_pos M.v12_ne hori)
    (P.normSim_v3_fst_bounds).1 (P.normSim_v3_fst_bounds).2
    P.normSim_nonobtuse_at_v3_normalized rfl rfl
    (normSim_sqdist_from_fst_eq_of_dist_eq M.v12_ne hV)
    (normSim_sqdist_from_snd_eq_of_dist_eq M.v12_ne hW)
    (normSim_left_cap_side_of_signedArea2_mul_neg M.v12_ne hleft)
    (normSim_right_cap_side_of_signedArea2_mul_neg M.v12_ne hright)

/-- An indexed surplus cap instantiates the K-Q3-5 cap-frame theorem once the
two selected-circle equalities and adjacent strict side products are supplied. -/
theorem SurplusCapPacket.q3_shared_interior_false_of_indexed_cap
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {z p q : ℝ²} (hzI : z ∈ S.capInteriorByIndex i)
    (hori : 0 < signedArea2 (S.triangleByIndex i).v1
      (S.triangleByIndex i).v2 (S.triangleByIndex i).v3)
    (hV : dist (S.triangleByIndex i).v2 z =
      dist (S.triangleByIndex i).v2 p)
    (hW : dist (S.triangleByIndex i).v3 z =
      dist (S.triangleByIndex i).v3 q)
    (hleft : signedArea2 p (S.triangleByIndex i).v3
      (S.triangleByIndex i).v1 *
        signedArea2 (S.triangleByIndex i).v2
          (S.triangleByIndex i).v3 (S.triangleByIndex i).v1 < 0)
    (hright : signedArea2 q (S.triangleByIndex i).v1
      (S.triangleByIndex i).v2 *
        signedArea2 (S.triangleByIndex i).v3
          (S.triangleByIndex i).v1 (S.triangleByIndex i).v2 < 0) :
    False := by
  apply q3_shared_interior_false_of_cap_frame (S.capFramePacketByIndex i)
  · exact S.capInteriorByIndex_subset i hzI
  · change 0 < signedArea2 (S.triangleByIndex i).v2
      (S.triangleByIndex i).v3 (S.triangleByIndex i).v1
    have hcyclic :
        signedArea2 (S.triangleByIndex i).v2
          (S.triangleByIndex i).v3 (S.triangleByIndex i).v1 =
        signedArea2 (S.triangleByIndex i).v1
          (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 := by
      unfold signedArea2
      ring
    rw [hcyclic]
    exact hori
  · simpa [SurplusCapPacket.capFrameByIndex, MoserTriangle.rotate] using
      S.normSim_capInterior_snd_neg hconv i hzI hori
  · simpa [SurplusCapPacket.capFrameByIndex, MoserTriangle.rotate] using hV
  · simpa [SurplusCapPacket.capFrameByIndex, MoserTriangle.rotate] using hW
  · simpa [SurplusCapPacket.capFrameByIndex, MoserTriangle.rotate] using hleft
  · simpa [SurplusCapPacket.capFrameByIndex, MoserTriangle.rotate] using hright

/-- The indexed K-Q3-5 adapter does not need a source-side orientation choice:
the negative branch reverses the support-chord frame and swaps the two
selected-circle roles. -/
theorem SurplusCapPacket.q3_shared_interior_false_of_indexed_cap_unoriented
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {z p q : ℝ²} (hzI : z ∈ S.capInteriorByIndex i)
    (hV : dist (S.triangleByIndex i).v2 z =
      dist (S.triangleByIndex i).v2 p)
    (hW : dist (S.triangleByIndex i).v3 z =
      dist (S.triangleByIndex i).v3 q)
    (hleft : signedArea2 p (S.triangleByIndex i).v3
      (S.triangleByIndex i).v1 *
        signedArea2 (S.triangleByIndex i).v2
          (S.triangleByIndex i).v3 (S.triangleByIndex i).v1 < 0)
    (hright : signedArea2 q (S.triangleByIndex i).v1
      (S.triangleByIndex i).v2 *
        signedArea2 (S.triangleByIndex i).v3
          (S.triangleByIndex i).v1 (S.triangleByIndex i).v2 < 0) :
    False := by
  have harea_ne :
      signedArea2 (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 ≠ 0 := by
    intro hzero
    exact hconv.not_three_collinear (S.triangleByIndex i).v1_mem
      (S.triangleByIndex i).v2_mem (S.triangleByIndex i).v3_mem
      (S.triangleByIndex i).v12_ne (S.triangleByIndex i).v13_ne
      (S.triangleByIndex i).v23_ne
      (collinear_of_signedArea2_eq_zero (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 hzero)
  rcases lt_or_gt_of_ne harea_ne with hneg | hpos
  · apply q3_shared_interior_false_of_cap_frame
      (S.reversedCapFramePacketByIndex i)
    · exact S.capInteriorByIndex_subset i hzI
    · change 0 < signedArea2 (S.triangleByIndex i).v3
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v1
      have hreverse :
          signedArea2 (S.triangleByIndex i).v3
            (S.triangleByIndex i).v2 (S.triangleByIndex i).v1 =
          -signedArea2 (S.triangleByIndex i).v1
            (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 := by
        unfold signedArea2
        ring
      rw [hreverse]
      linarith
    · change normSim (S.triangleByIndex i).v3
        (S.triangleByIndex i).v2 z 1 < 0
      apply normSim_snd_neg_of_signedArea2_neg
        (S.triangleByIndex i).v23_ne.symm
      have hprod :=
        S.signedArea2_mul_neg_of_mem_capInteriorByIndex hconv i hzI
      have hside_pos :
          0 < signedArea2 z (S.triangleByIndex i).v2
            (S.triangleByIndex i).v3 := by
        by_contra hnot
        have hside_nonpos :
            signedArea2 z (S.triangleByIndex i).v2
                (S.triangleByIndex i).v3 ≤ 0 :=
          le_of_not_gt hnot
        have hprod_nonneg :
            0 ≤ signedArea2 z (S.triangleByIndex i).v2
                  (S.triangleByIndex i).v3 *
                signedArea2 (S.triangleByIndex i).v1
                  (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 :=
          mul_nonneg_of_nonpos_of_nonpos hside_nonpos hneg.le
        exact (not_lt_of_ge hprod_nonneg) hprod
      have hswap :
          signedArea2 (S.triangleByIndex i).v3
            (S.triangleByIndex i).v2 z =
          -signedArea2 z (S.triangleByIndex i).v2
            (S.triangleByIndex i).v3 := by
        unfold signedArea2
        ring
      rw [hswap]
      linarith
    · change dist (S.triangleByIndex i).v3 z =
        dist (S.triangleByIndex i).v3 q
      exact hW
    · change dist (S.triangleByIndex i).v2 z =
        dist (S.triangleByIndex i).v2 p
      exact hV
    · change signedArea2 q (S.triangleByIndex i).v2
          (S.triangleByIndex i).v1 *
        signedArea2 (S.triangleByIndex i).v3
          (S.triangleByIndex i).v2 (S.triangleByIndex i).v1 < 0
      have hrewrite :
          signedArea2 q (S.triangleByIndex i).v2
              (S.triangleByIndex i).v1 *
            signedArea2 (S.triangleByIndex i).v3
              (S.triangleByIndex i).v2 (S.triangleByIndex i).v1 =
          signedArea2 q (S.triangleByIndex i).v1
              (S.triangleByIndex i).v2 *
            signedArea2 (S.triangleByIndex i).v3
              (S.triangleByIndex i).v1 (S.triangleByIndex i).v2 := by
        unfold signedArea2
        ring
      rw [hrewrite]
      exact hright
    · change signedArea2 p (S.triangleByIndex i).v1
          (S.triangleByIndex i).v3 *
        signedArea2 (S.triangleByIndex i).v2
          (S.triangleByIndex i).v1 (S.triangleByIndex i).v3 < 0
      have hrewrite :
          signedArea2 p (S.triangleByIndex i).v1
              (S.triangleByIndex i).v3 *
            signedArea2 (S.triangleByIndex i).v2
              (S.triangleByIndex i).v1 (S.triangleByIndex i).v3 =
          signedArea2 p (S.triangleByIndex i).v3
              (S.triangleByIndex i).v1 *
            signedArea2 (S.triangleByIndex i).v2
              (S.triangleByIndex i).v3 (S.triangleByIndex i).v1 := by
        unfold signedArea2
        ring
      rw [hrewrite]
      exact hleft
  · exact S.q3_shared_interior_false_of_indexed_cap hconv i hzI
      hpos hV hW hleft hright

/-- Strict interior membership in the left adjacent cap supplies the first
signed-area product required by the indexed K-Q3-5 adapter. -/
theorem SurplusCapPacket.signedArea2_mul_neg_of_mem_leftAdjacentInterior
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {p : ℝ²}
    (hpI : p ∈ S.capInteriorByIndex (leftAdjacentIndex i)) :
    signedArea2 p (S.triangleByIndex i).v3
        (S.triangleByIndex i).v1 *
      signedArea2 (S.triangleByIndex i).v2
        (S.triangleByIndex i).v3 (S.triangleByIndex i).v1 < 0 := by
  have h := S.signedArea2_mul_neg_of_mem_capInteriorByIndex hconv
    (leftAdjacentIndex i) hpI
  fin_cases i <;>
    simpa [leftAdjacentIndex, triangleByIndex] using h

/-- Strict interior membership in the right adjacent cap supplies the second
signed-area product required by the indexed K-Q3-5 adapter. -/
theorem SurplusCapPacket.signedArea2_mul_neg_of_mem_rightAdjacentInterior
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {q : ℝ²}
    (hqI : q ∈ S.capInteriorByIndex (rightAdjacentIndex i)) :
    signedArea2 q (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 *
      signedArea2 (S.triangleByIndex i).v3
        (S.triangleByIndex i).v1 (S.triangleByIndex i).v2 < 0 := by
  have h := S.signedArea2_mul_neg_of_mem_capInteriorByIndex hconv
    (rightAdjacentIndex i) hqI
  fin_cases i <;>
    simpa [rightAdjacentIndex, triangleByIndex] using h

/-- K-Q3-5 with both strict side products supplied by adjacent-cap interiors. -/
theorem SurplusCapPacket.q3_shared_interior_false_of_adjacent_interiors
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {z p q : ℝ²}
    (hzI : z ∈ S.capInteriorByIndex i)
    (hpI : p ∈ S.capInteriorByIndex (leftAdjacentIndex i))
    (hqI : q ∈ S.capInteriorByIndex (rightAdjacentIndex i))
    (hV : dist (S.triangleByIndex i).v2 z =
      dist (S.triangleByIndex i).v2 p)
    (hW : dist (S.triangleByIndex i).v3 z =
      dist (S.triangleByIndex i).v3 q) :
    False := by
  exact S.q3_shared_interior_false_of_indexed_cap_unoriented hconv i hzI
    hV hW
    (S.signedArea2_mul_neg_of_mem_leftAdjacentInterior hconv i hpI)
    (S.signedArea2_mul_neg_of_mem_rightAdjacentInterior hconv i hqI)

/-- Source-facing K-Q3-5 wrapper: shared `SelectedClass` radii provide the two
equal-distance hypotheses, while the three points are placed in the indexed
cap and its two adjacent strict interiors. -/
theorem SurplusCapPacket.q3_shared_interior_false_of_adjacent_selectedClass_membership
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {z p q : ℝ²} {rhoV rhoW : ℝ}
    (hzI : z ∈ S.capInteriorByIndex i)
    (hpI : p ∈ S.capInteriorByIndex (leftAdjacentIndex i))
    (hqI : q ∈ S.capInteriorByIndex (rightAdjacentIndex i))
    (hzV : z ∈ SelectedClass A (S.triangleByIndex i).v2 rhoV)
    (hpV : p ∈ SelectedClass A (S.triangleByIndex i).v2 rhoV)
    (hzW : z ∈ SelectedClass A (S.triangleByIndex i).v3 rhoW)
    (hqW : q ∈ SelectedClass A (S.triangleByIndex i).v3 rhoW) :
    False := by
  have hV : dist (S.triangleByIndex i).v2 z =
      dist (S.triangleByIndex i).v2 p := by
    calc
      dist (S.triangleByIndex i).v2 z = rhoV :=
        (mem_selectedClass.mp hzV).2
      _ = dist (S.triangleByIndex i).v2 p :=
        (mem_selectedClass.mp hpV).2.symm
  have hW : dist (S.triangleByIndex i).v3 z =
      dist (S.triangleByIndex i).v3 q := by
    calc
      dist (S.triangleByIndex i).v3 z = rhoW :=
        (mem_selectedClass.mp hzW).2
      _ = dist (S.triangleByIndex i).v3 q :=
        (mem_selectedClass.mp hqW).2.symm
  exact S.q3_shared_interior_false_of_adjacent_interiors hconv i
    hzI hpI hqI hV hW

/-- If the surplus point of a right-pinned row also lies in a selected class
at the other non-surplus Moser apex, Q3 prevents that second class from
meeting its own short-cap interior. -/
theorem SurplusCapPacket.pinnedRight_oppositeClass_disjoint_oppInterior
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    {radius rho : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x)
    (hxOpp : x ∈ SelectedClass A
      (S.oppositeVertexByIndex S.oppIndex2) rho) :
    SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho ∩
        S.capInteriorByIndex S.oppIndex2 = ∅ := by
  classical
  have hxSurplus : x ∈ S.capInteriorByIndex S.surplusIdx :=
    S.mem_surplusInterior_of_oppIndex1_right_surplus
      (S.pinnedRightSurplusResidual_radius_pos hpinned)
      (S.pinnedRightSurplusResidual_mem_selectedClass hpinned)
      (S.pinnedRightSurplusResidual_mem_right_surplus hpinned)
  rcases hpinned with
    ⟨p₁, _p₂, _hpne, hpair, _hcard, hsub, _hleft, hxPinned,
      _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
  have hp₁Interior : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [hpair]
    simp
  have hp₁Pinned : p₁ ∈ SelectedClass A
      (S.oppositeVertexByIndex S.oppIndex1) radius :=
    hsub hp₁Interior
  ext q
  constructor
  · intro hq
    rcases Finset.mem_inter.mp hq with ⟨hqOpp, hqInterior⟩
    exfalso
    have hp₁Left :
        p₁ ∈ S.leftAdjacentInteriorByIndex S.surplusIdx := by
      rw [S.leftAdjacentInteriorByIndex_surplusIdx_eq_oppInterior1]
      simpa [SurplusCapPacket.oppInterior1] using hp₁Interior
    have hqRight :
        q ∈ S.rightAdjacentInteriorByIndex S.surplusIdx := by
      rw [S.rightAdjacentInteriorByIndex_surplusIdx_eq_oppInterior2]
      simpa [SurplusCapPacket.oppInterior2] using hqInterior
    have hp₁Left' :
        p₁ ∈ S.capInteriorByIndex (leftAdjacentIndex S.surplusIdx) := by
      rw [← S.leftAdjacentInteriorByIndex_eq_capInteriorByIndex]
      exact hp₁Left
    have hqRight' :
        q ∈ S.capInteriorByIndex (rightAdjacentIndex S.surplusIdx) := by
      rw [← S.rightAdjacentInteriorByIndex_eq_capInteriorByIndex]
      exact hqRight
    exact S.q3_shared_interior_false_of_adjacent_selectedClass_membership
      hconv S.surplusIdx hxSurplus hp₁Left' hqRight'
      (by
        simpa [S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1]
          using hxPinned)
      (by
        simpa [S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1]
          using hp₁Pinned)
      (by
        simpa [S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2]
          using hxOpp)
      (by
        simpa [S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2]
          using hqOpp)
  · intro hq
    simpa using hq

/-- Consequently, the surplus point of a right-pinned row cannot occur in any
K4-sized positive-radius class at the opposite non-surplus Moser apex. -/
theorem SurplusCapPacket.IsM44.pinnedRight_not_mem_oppositeK4Class
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius rho : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x)
    (hrho : 0 < rho)
    (hcard : 4 ≤ (SelectedClass A
      (S.oppositeVertexByIndex S.oppIndex2) rho).card) :
    x ∉ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho := by
  intro hx
  have hdisjoint := S.pinnedRight_oppositeClass_disjoint_oppInterior
    hconv hpinned hx
  have hsub := (S.moserCapCoreSelectorAt hconv S.oppIndex2 hrho
    hM44.oppIndex2_cap_card_eq_four hcard).2.1
  have hcardInterior :
      (S.capInteriorByIndex S.oppIndex2).card = 2 :=
    S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four S.oppIndex2
      hM44.oppIndex2_cap_card_eq_four
  have hnonempty : (S.capInteriorByIndex S.oppIndex2).Nonempty := by
    rw [← Finset.card_pos, hcardInterior]
    norm_num
  rcases hnonempty with ⟨q, hq⟩
  have hqInter :
      q ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho ∩
        S.capInteriorByIndex S.oppIndex2 :=
    Finset.mem_inter.mpr ⟨hsub hq, hq⟩
  rw [hdisjoint] at hqInter
  simpa using hqInter

/-- Mirror Q3 exclusion for a left-pinned row. -/
theorem SurplusCapPacket.pinnedLeft_oppositeClass_disjoint_oppInterior
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    {radius rho : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x)
    (hxOpp : x ∈ SelectedClass A
      (S.oppositeVertexByIndex S.oppIndex1) rho) :
    SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho ∩
        S.capInteriorByIndex S.oppIndex1 = ∅ := by
  classical
  have hxSurplus : x ∈ S.capInteriorByIndex S.surplusIdx :=
    S.mem_surplusInterior_of_oppIndex2_left_surplus
      (S.pinnedLeftSurplusResidual_radius_pos hpinned)
      (S.pinnedLeftSurplusResidual_mem_selectedClass hpinned)
      (S.pinnedLeftSurplusResidual_mem_left_surplus hpinned)
  rcases hpinned with
    ⟨p₁, _p₂, _hpne, hpair, _hcard, hsub, _hright, hxPinned,
      _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
  have hp₁Interior : p₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hpair]
    simp
  have hp₁Pinned : p₁ ∈ SelectedClass A
      (S.oppositeVertexByIndex S.oppIndex2) radius :=
    hsub hp₁Interior
  ext q
  constructor
  · intro hq
    rcases Finset.mem_inter.mp hq with ⟨hqOpp, hqInterior⟩
    exfalso
    have hqLeft :
        q ∈ S.leftAdjacentInteriorByIndex S.surplusIdx := by
      rw [S.leftAdjacentInteriorByIndex_surplusIdx_eq_oppInterior1]
      simpa [SurplusCapPacket.oppInterior1] using hqInterior
    have hp₁Right :
        p₁ ∈ S.rightAdjacentInteriorByIndex S.surplusIdx := by
      rw [S.rightAdjacentInteriorByIndex_surplusIdx_eq_oppInterior2]
      simpa [SurplusCapPacket.oppInterior2] using hp₁Interior
    have hqLeft' :
        q ∈ S.capInteriorByIndex (leftAdjacentIndex S.surplusIdx) := by
      rw [← S.leftAdjacentInteriorByIndex_eq_capInteriorByIndex]
      exact hqLeft
    have hp₁Right' :
        p₁ ∈ S.capInteriorByIndex (rightAdjacentIndex S.surplusIdx) := by
      rw [← S.rightAdjacentInteriorByIndex_eq_capInteriorByIndex]
      exact hp₁Right
    exact S.q3_shared_interior_false_of_adjacent_selectedClass_membership
      hconv S.surplusIdx hxSurplus hqLeft' hp₁Right'
      (by
        simpa [S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1]
          using hxOpp)
      (by
        simpa [S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1]
          using hqOpp)
      (by
        simpa [S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2]
          using hxPinned)
      (by
        simpa [S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2]
          using hp₁Pinned)
  · intro hq
    simpa using hq

/-- Mirror exclusion of a left-pinned surplus point from every opposite-apex
K4 class. -/
theorem SurplusCapPacket.IsM44.pinnedLeft_not_mem_oppositeK4Class
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius rho : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x)
    (hrho : 0 < rho)
    (hcard : 4 ≤ (SelectedClass A
      (S.oppositeVertexByIndex S.oppIndex1) rho).card) :
    x ∉ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho := by
  intro hx
  have hdisjoint := S.pinnedLeft_oppositeClass_disjoint_oppInterior
    hconv hpinned hx
  have hsub := (S.moserCapCoreSelectorAt hconv S.oppIndex1 hrho
    hM44.oppIndex1_cap_card_eq_four hcard).2.1
  have hcardInterior :
      (S.capInteriorByIndex S.oppIndex1).card = 2 :=
    S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four S.oppIndex1
      hM44.oppIndex1_cap_card_eq_four
  have hnonempty : (S.capInteriorByIndex S.oppIndex1).Nonempty := by
    rw [← Finset.card_pos, hcardInterior]
    norm_num
  rcases hnonempty with ⟨q, hq⟩
  have hqInter :
      q ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho ∩
        S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr ⟨hsub hq, hq⟩
  rw [hdisjoint] at hqInter
  simpa using hqInter

/-- The K4 row at the opposite short-cap apex of a right-pinned residual has
one of three concrete shapes: the exact opposite cap, a mirror pinned residual
at a different surplus point, or an endpoint escape. -/
theorem SurplusCapPacket.IsM44.exists_oppositeK4Class_cases_of_pinnedRight
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x) :
    ∃ rho : ℝ, 0 < rho ∧
      x ∉ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho ∧
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho =
          S.capByIndex S.oppIndex2 ∨
       (∃ y : ℝ², y ≠ x ∧ S.PinnedLeftSurplusResidualAt rho y) ∨
       ∃ p : ℝ²,
          S.EndpointEscapeRightAt S.oppIndex2 rho radius p) := by
  classical
  have hcenterA : S.oppositeVertexByIndex S.oppIndex2 ∈ A :=
    S.oppositeVertexByIndex_mem S.oppIndex2
  rcases exists_selectedClass_card_ge_four_of_hasNEquidistantProperty
      hK4 hcenterA with ⟨rho, hrho, hcard⟩
  have hxNot :
      x ∉ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho :=
    hM44.pinnedRight_not_mem_oppositeK4Class hconv hpinned hrho hcard
  refine ⟨rho, hrho, hxNot, ?_⟩
  have hradius : 0 < radius :=
    S.pinnedRightSurplusResidual_radius_pos hpinned
  have hpinnedCard :
      (SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex1) radius).card = 4 := by
    rcases hpinned with
      ⟨_p₁, _p₂, _hpne, _hpair, hcard', _hsub, _hleft, _hx,
        _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
    exact hcard'
  rcases S.containment_or_strictAdjacentEscapeAt_of_convexIndep
      hconv S.oppIndex2 hrho hM44.oppIndex2_cap_card_eq_four hcard with
    hcontain | ⟨y, hyT, hyLeft | hyRight⟩
  · apply Or.inl
    have hTcard :
        (SelectedClass A
          (S.oppositeVertexByIndex S.oppIndex2) rho).card = 4 :=
      (S.moserCapCoreSelectorAt hconv S.oppIndex2 hrho
        hM44.oppIndex2_cap_card_eq_four hcard).1
    exact Finset.eq_of_subset_of_card_le hcontain (by
      rw [hM44.oppIndex2_cap_card_eq_four, hTcard])
  · by_cases hexactEndpoint :
        ∃ p : ℝ², S.EndpointEscapeRightAt S.oppIndex2 rho radius p
    · exact Or.inr (Or.inr hexactEndpoint)
    · have hnoEndpoint :
          ∀ {sigma : ℝ} {z : ℝ²},
            S.EndpointEscapeRightAt S.oppIndex2 rho sigma z → False := by
        intro sigma z hres
        have hres' := hres
        rcases hres with
          ⟨_hrho, hsigma, _hfirstCard, _hzT, _hzEsc, hsecondCard,
            _hzSigma, _hshared, _hne⟩
        have hsecondCard' :
            4 ≤ (SelectedClass A
              (S.oppositeVertexByIndex S.oppIndex1) sigma).card := by
          simpa [
            S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
            using hsecondCard
        have hsigmaEq : sigma = radius :=
          hM44.pinnedRightSurplusResidual_k4Radius_eq
            hconv hpinned hsigma hsecondCard'
        exact hexactEndpoint ⟨z, by simpa [hsigmaEq] using hres'⟩
      have hyPinned : S.PinnedLeftSurplusResidualAt rho y :=
        hM44.oppIndex2_pinnedLeftSurplusResidual_of_left_surplus
          hK4 hconv hrho hcard hnoEndpoint hyT hyLeft
      have hyne : y ≠ x := by
        intro hyx
        subst y
        exact hxNot hyT
      exact Or.inr (Or.inl ⟨y, hyne, hyPinned⟩)
  · apply Or.inr
    apply Or.inr
    apply Classical.byContradiction
    intro hnone
    have hcapRight :
        (S.rightAdjacentCapByIndex S.oppIndex2).card = 4 := by
      rw [S.rightAdjacentCapByIndex_oppIndex2_eq_capByIndex_oppIndex1]
      exact hM44.oppIndex1_cap_card_eq_four
    have hsecondCard :
        4 ≤ (SelectedClass A
          (S.leftOuterVertexByIndex S.oppIndex2) radius).card := by
      simpa [
        S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
        using hpinnedCard.ge
    exact S.rightStrictEscape_endpointData_elim hconv S.oppIndex2
      hrho hradius hM44.oppIndex2_cap_card_eq_four hcapRight
      hcard hyT hyRight hsecondCard
      (fun hres => hnone ⟨y, hres⟩)

/-- Mirror opposite-apex split for a left-pinned residual. -/
theorem SurplusCapPacket.IsM44.exists_oppositeK4Class_cases_of_pinnedLeft
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x) :
    ∃ rho : ℝ, 0 < rho ∧
      x ∉ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho ∧
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho =
          S.capByIndex S.oppIndex1 ∨
       (∃ y : ℝ², y ≠ x ∧ S.PinnedRightSurplusResidualAt rho y) ∨
       ∃ p : ℝ²,
          S.EndpointEscapeLeftAt S.oppIndex1 rho radius p) := by
  classical
  have hcenterA : S.oppositeVertexByIndex S.oppIndex1 ∈ A :=
    S.oppositeVertexByIndex_mem S.oppIndex1
  rcases exists_selectedClass_card_ge_four_of_hasNEquidistantProperty
      hK4 hcenterA with ⟨rho, hrho, hcard⟩
  have hxNot :
      x ∉ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho :=
    hM44.pinnedLeft_not_mem_oppositeK4Class hconv hpinned hrho hcard
  refine ⟨rho, hrho, hxNot, ?_⟩
  have hradius : 0 < radius :=
    S.pinnedLeftSurplusResidual_radius_pos hpinned
  have hpinnedCard :
      (SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex2) radius).card = 4 := by
    rcases hpinned with
      ⟨_p₁, _p₂, _hpne, _hpair, hcard', _hsub, _hright, _hx,
        _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
    exact hcard'
  rcases S.containment_or_strictAdjacentEscapeAt_of_convexIndep
      hconv S.oppIndex1 hrho hM44.oppIndex1_cap_card_eq_four hcard with
    hcontain | ⟨y, hyT, hyLeft | hyRight⟩
  · apply Or.inl
    have hTcard :
        (SelectedClass A
          (S.oppositeVertexByIndex S.oppIndex1) rho).card = 4 :=
      (S.moserCapCoreSelectorAt hconv S.oppIndex1 hrho
        hM44.oppIndex1_cap_card_eq_four hcard).1
    exact Finset.eq_of_subset_of_card_le hcontain (by
      rw [hM44.oppIndex1_cap_card_eq_four, hTcard])
  · apply Or.inr
    apply Or.inr
    apply Classical.byContradiction
    intro hnone
    have hcapLeft :
        (S.leftAdjacentCapByIndex S.oppIndex1).card = 4 := by
      rw [S.leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2]
      exact hM44.oppIndex2_cap_card_eq_four
    have hsecondCard :
        4 ≤ (SelectedClass A
          (S.rightOuterVertexByIndex S.oppIndex1) radius).card := by
      simpa [
        S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
        using hpinnedCard.ge
    exact S.leftStrictEscape_endpointData_elim hconv S.oppIndex1
      hrho hradius hM44.oppIndex1_cap_card_eq_four hcapLeft
      hcard hyT hyLeft hsecondCard
      (fun hres => hnone ⟨y, hres⟩)
  · by_cases hexactEndpoint :
        ∃ p : ℝ², S.EndpointEscapeLeftAt S.oppIndex1 rho radius p
    · exact Or.inr (Or.inr hexactEndpoint)
    · have hnoEndpoint :
          ∀ {sigma : ℝ} {z : ℝ²},
            S.EndpointEscapeLeftAt S.oppIndex1 rho sigma z → False := by
        intro sigma z hres
        have hres' := hres
        rcases hres with
          ⟨_hrho, hsigma, _hfirstCard, _hzT, _hzEsc, hsecondCard,
            _hzSigma, _hshared, _hne⟩
        have hsecondCard' :
            4 ≤ (SelectedClass A
              (S.oppositeVertexByIndex S.oppIndex2) sigma).card := by
          simpa [
            S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
            using hsecondCard
        have hsigmaEq : sigma = radius :=
          hM44.pinnedLeftSurplusResidual_k4Radius_eq
            hconv hpinned hsigma hsecondCard'
        exact hexactEndpoint ⟨z, by simpa [hsigmaEq] using hres'⟩
      have hyPinned : S.PinnedRightSurplusResidualAt rho y :=
        hM44.oppIndex1_pinnedRightSurplusResidual_of_right_surplus
          hK4 hconv hrho hcard hnoEndpoint hyT hyRight
      have hyne : y ≠ x := by
        intro hyx
        subst y
        exact hxNot hyT
      exact Or.inr (Or.inl ⟨y, hyne, hyPinned⟩)

end Problem97
