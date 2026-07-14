/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.Q3SharedInterior

/-!
# MEC straddling-row obstruction

A circle centered at `s` passes through a boundary point `o` of a circumdisk.
If two further points `x,y` on that circle lie strictly on opposite sides of
the ray `o-s`, then they cannot both lie in the disk when the boundary triangle
`o,a,p` is nonobtuse at `a` and `oa = ap = os`.

The proof normalizes `o,a` to `(0,0),(1,0)`.  On the circle centered at `s`,
the circumdisk power becomes a linear form.  The lower and upper orientations
force the same scalar determinant to have opposite strict signs.

This is the metric/MEC consumer isolated by the ATAIL card-12 `(4,5,6)`
residual.  It is independent of that finite label assignment.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace Census554
namespace MECStraddlingRowCore

open EqualityCore

private theorem scalar_incompatibility
    (a b c d u v w z k : ℝ)
    (hp : (a - 1) ^ 2 + b ^ 2 = 1)
    (hs : c ^ 2 + d ^ 2 = 1)
    (hx : (u - c) ^ 2 + (v - d) ^ 2 = 1)
    (hy : (w - c) ^ 2 + (z - d) ^ 2 = 1)
    (hcenter : (a - 1 / 2) ^ 2 + (b - k) ^ 2 = 1 / 4 + k ^ 2)
    (hdiskx : (u - 1 / 2) ^ 2 + (v - k) ^ 2 ≤ 1 / 4 + k ^ 2)
    (hdisky : (w - 1 / 2) ^ 2 + (z - k) ^ 2 ≤ 1 / 4 + k ^ 2)
    (ha : a ≤ 1)
    (hb : 0 < b)
    (hd : 0 < d)
    (hrx : 0 < u * d - v * c)
    (hry : 0 < c * z - d * w) : False := by
  have haPos : 0 < a := by
    nlinarith only [hp, hb, sq_nonneg (a - 1), sq_nonneg b]
  have hbGeA : a ≤ b := by
    have hbaSq : a ^ 2 ≤ b ^ 2 := by
      nlinarith only [hp, ha, haPos]
    nlinarith only [hbaSq, haPos, hb]
  have hcd : c + d < 2 := by
    nlinarith only [hs, sq_nonneg (c - d)]
  let ell := b * (2 - c) - a * d
  have hell : 0 < ell := by
    have hgap : 0 < 2 - c - d := by linarith only [hcd]
    have hfirst : 0 < b * (2 - c - d) := mul_pos hb hgap
    have hsecond : 0 ≤ (b - a) * d :=
      mul_nonneg (sub_nonneg.mpr hbGeA) (le_of_lt hd)
    dsimp [ell]
    nlinarith only [hfirst, hsecond]
  have habk : a = 2 * b * k := by
    nlinarith only [hp, hcenter]
  have hxCircle : u ^ 2 + v ^ 2 = 2 * (c * u + d * v) := by
    nlinarith only [hs, hx]
  have hyCircle : w ^ 2 + z ^ 2 = 2 * (c * w + d * z) := by
    nlinarith only [hs, hy]
  have hsxPos : 0 < c * u + d * v := by
    have hnormPos : 0 < u ^ 2 + v ^ 2 := by
      by_contra hnot
      have hnonpos : u ^ 2 + v ^ 2 ≤ 0 := le_of_not_gt hnot
      have hu : u = 0 := by nlinarith only [hnonpos, sq_nonneg u, sq_nonneg v]
      have hv : v = 0 := by nlinarith only [hnonpos, sq_nonneg u, sq_nonneg v]
      rw [hu, hv] at hrx
      norm_num at hrx
    nlinarith only [hxCircle, hnormPos]
  have hsyPos : 0 < c * w + d * z := by
    have hnormPos : 0 < w ^ 2 + z ^ 2 := by
      by_contra hnot
      have hnonpos : w ^ 2 + z ^ 2 ≤ 0 := le_of_not_gt hnot
      have hw : w = 0 := by nlinarith only [hnonpos, sq_nonneg w, sq_nonneg z]
      have hz : z = 0 := by nlinarith only [hnonpos, sq_nonneg w, sq_nonneg z]
      rw [hw, hz] at hry
      norm_num at hry
    nlinarith only [hyCircle, hnormPos]
  have hpowerX : b * (u ^ 2 + v ^ 2 - u) - a * v ≤ 0 := by
    have hraw : u ^ 2 + v ^ 2 - u - 2 * k * v ≤ 0 := by
      nlinarith only [hdiskx]
    have hscaled : b * (u ^ 2 + v ^ 2 - u - 2 * k * v) ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos (le_of_lt hb) hraw
    rw [habk]
    nlinarith only [hscaled]
  have hpowerY : b * (w ^ 2 + z ^ 2 - w) - a * z ≤ 0 := by
    have hraw : w ^ 2 + z ^ 2 - w - 2 * k * z ≤ 0 := by
      nlinarith only [hdisky]
    have hscaled : b * (w ^ 2 + z ^ 2 - w - 2 * k * z) ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos (le_of_lt hb) hraw
    rw [habk]
    nlinarith only [hscaled]
  let q := a * c - b * d
  have hdecompX :
      b * (u ^ 2 + v ^ 2 - u) - a * v =
        (c * u + d * v) * ell + (d * u - c * v) * q := by
    rw [hxCircle]
    dsimp [ell, q]
    linear_combination (b * u + a * v) * hs
  have hdecompY :
      b * (w ^ 2 + z ^ 2 - w) - a * z =
        (c * w + d * z) * ell + (d * w - c * z) * q := by
    rw [hyCircle]
    dsimp [ell, q]
    linear_combination (b * w + a * z) * hs
  have hqNeg : q < 0 := by
    by_contra hnot
    have hqNonneg : 0 ≤ q := le_of_not_gt hnot
    have hfirst : 0 < (c * u + d * v) * ell := mul_pos hsxPos hell
    have hrx' : 0 < d * u - c * v := by
      simpa only [mul_comm] using hrx
    have hsecond : 0 ≤ (d * u - c * v) * q :=
      mul_nonneg (le_of_lt hrx') hqNonneg
    nlinarith only [hpowerX, hdecompX, hfirst, hsecond]
  have hqPos : 0 < q := by
    by_contra hnot
    have hqNonpos : q ≤ 0 := le_of_not_gt hnot
    have hfirst : 0 < (c * w + d * z) * ell := mul_pos hsyPos hell
    have hry' : d * w - c * z < 0 := by linarith only [hry]
    have hsecond : 0 ≤ (d * w - c * z) * q :=
      mul_nonneg_of_nonpos_of_nonpos (le_of_lt hry') hqNonpos
    nlinarith only [hpowerY, hdecompY, hfirst, hsecond]
  linarith

private theorem dist_sq_coords (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

private theorem normSim_dist_sq_eq_one
    {o a p q : ℝ²} (hoa : o ≠ a) (h : dist o a = dist p q) :
    (normSim o a p 0 - normSim o a q 0) ^ 2 +
        (normSim o a p 1 - normSim o a q 1) ^ 2 = 1 := by
  have hT : dist (normSim o a o) (normSim o a a) =
      dist (normSim o a p) (normSim o a q) := by
    rw [normSim_dist_image o a hoa, normSim_dist_image o a hoa, h]
  have hSq := congrArg (fun r : ℝ => r ^ 2) hT
  change dist (normSim o a o) (normSim o a a) ^ 2 =
    dist (normSim o a p) (normSim o a q) ^ 2 at hSq
  rw [dist_sq_coords, dist_sq_coords] at hSq
  rw [normSim_fst, normSim_snd o a hoa] at hSq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero,
    zero_sub, one_pow, neg_sq] at hSq
  nlinarith only [hSq]

private theorem normSim_signedArea_pos
    {o a p q r : ℝ²} (hoa : o ≠ a) (h : 0 < signedArea2 p q r) :
    0 < signedArea2 (normSim o a p) (normSim o a q) (normSim o a r) := by
  rw [signedArea2_normSim o a hoa]
  apply mul_pos _ h
  apply inv_pos.mpr
  rw [← dist_sq_coords a o]
  exact sq_pos_of_pos (dist_pos.mpr hoa.symm)

/-- A circle through a boundary point of a nonobtuse three-point circumdisk
cannot have in-disk points strictly on both sides of its center ray. -/
theorem metric_orientation_incompatibility
    {o a p s x y center : ℝ²}
    (hoa : o ≠ a)
    (hoa_ap : dist o a = dist a p)
    (hoa_os : dist o a = dist o s)
    (hoa_sx : dist o a = dist s x)
    (hoa_sy : dist o a = dist s y)
    (hboundary_oa : dist o center = dist a center)
    (hboundary_op : dist o center = dist p center)
    (hxdisk : dist x center ≤ dist o center)
    (hydisk : dist y center ≤ dist o center)
    (hnonobtuse_a : 0 ≤ inner ℝ (p - a) (o - a))
    (hoap : 0 < signedArea2 o a p)
    (hoas : 0 < signedArea2 o a s)
    (hoxs : 0 < signedArea2 o x s)
    (hosy : 0 < signedArea2 o s y) : False := by
  let T := normSim o a
  let A := T p 0
  let B := T p 1
  let C := T s 0
  let D := T s 1
  let U := T x 0
  let V := T x 1
  let W := T y 0
  let Z := T y 1
  let K := T center 1
  have hTo : T o = pt 0 0 := normSim_fst o a
  have hTa : T a = pt 1 0 := normSim_snd o a hoa
  have hp : (A - 1) ^ 2 + B ^ 2 = 1 := by
    have h := normSim_dist_sq_eq_one hoa hoa_ap
    change (T a 0 - T p 0) ^ 2 + (T a 1 - T p 1) ^ 2 = 1 at h
    rw [hTa] at h
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
      neg_sq] at h
    nlinarith only [h]
  have hs : C ^ 2 + D ^ 2 = 1 := by
    have h := normSim_dist_sq_eq_one hoa hoa_os
    change (T o 0 - T s 0) ^ 2 + (T o 1 - T s 1) ^ 2 = 1 at h
    rw [hTo] at h
    simpa only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
      neg_sq] using h
  have hx : (U - C) ^ 2 + (V - D) ^ 2 = 1 := by
    apply normSim_dist_sq_eq_one hoa
    simpa only [dist_comm] using hoa_sx
  have hy : (W - C) ^ 2 + (Z - D) ^ 2 = 1 := by
    apply normSim_dist_sq_eq_one hoa
    simpa only [dist_comm] using hoa_sy
  have hcenterFst : T center 0 = 1 / 2 :=
    normSim_center_fst_eq_half_of_equidistant hoa hboundary_oa
  have hcenter : (A - 1 / 2) ^ 2 + (B - K) ^ 2 = 1 / 4 + K ^ 2 := by
    have ho := normSim_dist_image o a hoa o center
    have hp' := normSim_dist_image o a hoa p center
    rw [hboundary_op] at ho
    have heq : dist (T p) (T center) = dist (T o) (T center) := by
      simpa only [T] using hp'.trans ho.symm
    have hsq := congrArg (fun r : ℝ => r ^ 2) heq
    change dist (T p) (T center) ^ 2 = dist (T o) (T center) ^ 2 at hsq
    rw [dist_sq_coords, dist_sq_coords] at hsq
    rw [hTo, hcenterFst] at hsq
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
      neg_sq] at hsq
    nlinarith only [hsq]
  have hdiskx : (U - 1 / 2) ^ 2 + (V - K) ^ 2 ≤ 1 / 4 + K ^ 2 := by
    simpa only [T, U, V, K] using
      normSim_mec_disk_normalized hoa hboundary_oa hxdisk
  have hdisky : (W - 1 / 2) ^ 2 + (Z - K) ^ 2 ≤ 1 / 4 + K ^ 2 := by
    simpa only [T, W, Z, K] using
      normSim_mec_disk_normalized hoa hboundary_oa hydisk
  have ha : A ≤ 1 := by
    simpa only [T, A] using
      normSim_fst_le_one_of_nonobtuse_at_snd hoa hnonobtuse_a
  have hbT := normSim_signedArea_pos hoa hoap
  have hb : 0 < B := by
    change 0 < signedArea2 (T o) (T a) (T p) at hbT
    rw [hTo, hTa] at hbT
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
      sub_zero, one_mul] at hbT
    change 0 < B - A * 0 at hbT
    simpa only [mul_zero, sub_zero] using hbT
  have hdT := normSim_signedArea_pos hoa hoas
  have hd : 0 < D := by
    change 0 < signedArea2 (T o) (T a) (T s) at hdT
    rw [hTo, hTa] at hdT
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
      sub_zero, one_mul] at hdT
    change 0 < D - C * 0 at hdT
    simpa only [mul_zero, sub_zero] using hdT
  have hrxT := normSim_signedArea_pos hoa hoxs
  have hrx : 0 < U * D - V * C := by
    change 0 < signedArea2 (T o) (T x) (T s) at hrxT
    rw [hTo] at hrxT
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
      sub_zero] at hrxT
    change 0 < U * D - C * V at hrxT
    nlinarith only [hrxT]
  have hryT := normSim_signedArea_pos hoa hosy
  have hry : 0 < C * Z - D * W := by
    change 0 < signedArea2 (T o) (T s) (T y) at hryT
    rw [hTo] at hryT
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
      sub_zero] at hryT
    change 0 < C * Z - W * D at hryT
    nlinarith only [hryT]
  exact scalar_incompatibility A B C D U V W Z K hp hs hx hy hcenter
    hdiskx hdisky ha hb hd hrx hry

private theorem inner_reflectXAxis_sub (p a o : ℝ²) :
    inner ℝ (reflectXAxis p - reflectXAxis a)
        (reflectXAxis o - reflectXAxis a) =
      inner ℝ (p - a) (o - a) := by
  rw [PiLp.inner_apply, PiLp.inner_apply]
  simp [Fin.sum_univ_two, reflectXAxis, PiLp.sub_apply]
  ring

/-- Negative-orientation form, for boundary indexings whose increasing cyclic
order carries negative signed area. -/
theorem metric_orientation_incompatibility_of_neg
    {o a p s x y center : ℝ²}
    (hoa : o ≠ a)
    (hoa_ap : dist o a = dist a p)
    (hoa_os : dist o a = dist o s)
    (hoa_sx : dist o a = dist s x)
    (hoa_sy : dist o a = dist s y)
    (hboundary_oa : dist o center = dist a center)
    (hboundary_op : dist o center = dist p center)
    (hxdisk : dist x center ≤ dist o center)
    (hydisk : dist y center ≤ dist o center)
    (hnonobtuse_a : 0 ≤ inner ℝ (p - a) (o - a))
    (hoap : signedArea2 o a p < 0)
    (hoas : signedArea2 o a s < 0)
    (hoxs : signedArea2 o x s < 0)
    (hosy : signedArea2 o s y < 0) : False := by
  apply metric_orientation_incompatibility
      (o := reflectXAxis o) (a := reflectXAxis a)
      (p := reflectXAxis p) (s := reflectXAxis s)
      (x := reflectXAxis x) (y := reflectXAxis y)
      (center := reflectXAxis center)
  · exact fun h => hoa (reflectXAxis_injective h)
  · simpa only [dist_reflectXAxis] using hoa_ap
  · simpa only [dist_reflectXAxis] using hoa_os
  · simpa only [dist_reflectXAxis] using hoa_sx
  · simpa only [dist_reflectXAxis] using hoa_sy
  · simpa only [dist_reflectXAxis] using hboundary_oa
  · simpa only [dist_reflectXAxis] using hboundary_op
  · simpa only [dist_reflectXAxis] using hxdisk
  · simpa only [dist_reflectXAxis] using hydisk
  · rw [inner_reflectXAxis_sub]
    exact hnonobtuse_a
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith

/-- Equality-closure part of the MEC straddling-row obstruction.  The four
edges all carry the radius of `o-a`; their origin may be direct rows or longer
closure paths. -/
structure Core {α : Type*} (P : RowPattern α) where
  o : α
  a : α
  p : α
  s : α
  x : α
  y : α
  hoa : o ≠ a
  oa_ap : EdgeClosure P (o, a) (a, p)
  oa_os : EdgeClosure P (o, a) (o, s)
  oa_sx : EdgeClosure P (o, a) (s, x)
  oa_sy : EdgeClosure P (o, a) (s, y)

/-- MEC, nonobtuse, and cyclic-order data paired with one realized equality
core.  Keeping these fields separate makes the finite incidence producer and
the ambient geometry producer explicit. -/
structure Geometry {α : Type*} {P : RowPattern α}
    (pointOf : α → ℝ²) (core : Core P) where
  center : ℝ²
  boundary_oa : dist (pointOf core.o) center = dist (pointOf core.a) center
  boundary_op : dist (pointOf core.o) center = dist (pointOf core.p) center
  x_disk : dist (pointOf core.x) center ≤ dist (pointOf core.o) center
  y_disk : dist (pointOf core.y) center ≤ dist (pointOf core.o) center
  nonobtuse_a :
    0 ≤ inner ℝ (pointOf core.p - pointOf core.a)
      (pointOf core.o - pointOf core.a)
  orient_oap :
    0 < signedArea2 (pointOf core.o) (pointOf core.a) (pointOf core.p)
  orient_oas :
    0 < signedArea2 (pointOf core.o) (pointOf core.a) (pointOf core.s)
  orient_oxs :
    0 < signedArea2 (pointOf core.o) (pointOf core.x) (pointOf core.s)
  orient_osy :
    0 < signedArea2 (pointOf core.o) (pointOf core.s) (pointOf core.y)

/-- Negative-orientation analogue of `Geometry`. -/
structure NegativeGeometry {α : Type*} {P : RowPattern α}
    (pointOf : α → ℝ²) (core : Core P) where
  center : ℝ²
  boundary_oa : dist (pointOf core.o) center = dist (pointOf core.a) center
  boundary_op : dist (pointOf core.o) center = dist (pointOf core.p) center
  x_disk : dist (pointOf core.x) center ≤ dist (pointOf core.o) center
  y_disk : dist (pointOf core.y) center ≤ dist (pointOf core.o) center
  nonobtuse_a :
    0 ≤ inner ℝ (pointOf core.p - pointOf core.a)
      (pointOf core.o - pointOf core.a)
  orient_oap :
    signedArea2 (pointOf core.o) (pointOf core.a) (pointOf core.p) < 0
  orient_oas :
    signedArea2 (pointOf core.o) (pointOf core.a) (pointOf core.s) < 0
  orient_oxs :
    signedArea2 (pointOf core.o) (pointOf core.x) (pointOf core.s) < 0
  orient_osy :
    signedArea2 (pointOf core.o) (pointOf core.s) (pointOf core.y) < 0

/-- A realized equality core with the matching MEC geometry is impossible. -/
theorem false_of_core
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes P pointOf) (core : Core P)
    (geometry : Geometry pointOf core) : False := by
  apply metric_orientation_incompatibility (hreal.injective.ne core.hoa)
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.oa_ap
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.oa_os
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.oa_sx
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.oa_sy
  · exact geometry.boundary_oa
  · exact geometry.boundary_op
  · exact geometry.x_disk
  · exact geometry.y_disk
  · exact geometry.nonobtuse_a
  · exact geometry.orient_oap
  · exact geometry.orient_oas
  · exact geometry.orient_oxs
  · exact geometry.orient_osy

/-- Negative-orientation consumer for the same equality core. -/
theorem false_of_core_of_neg
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes P pointOf) (core : Core P)
    (geometry : NegativeGeometry pointOf core) : False := by
  apply metric_orientation_incompatibility_of_neg (hreal.injective.ne core.hoa)
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.oa_ap
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.oa_os
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.oa_sx
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.oa_sy
  · exact geometry.boundary_oa
  · exact geometry.boundary_op
  · exact geometry.x_disk
  · exact geometry.y_disk
  · exact geometry.nonobtuse_a
  · exact geometry.orient_oap
  · exact geometry.orient_oas
  · exact geometry.orient_oxs
  · exact geometry.orient_osy

end MECStraddlingRowCore
end Census554
end Problem97
