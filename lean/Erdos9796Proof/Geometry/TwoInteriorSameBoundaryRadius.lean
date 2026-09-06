/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Foundation
import Erdos9796Proof.Geometry.SimilarityFrame
import Erdos9796Proof.Geometry.ConvexIndepHull
import Mathlib.Analysis.Convex.Topology
import Mathlib.Analysis.LocallyConvex.Separation
import Mathlib.Analysis.InnerProductSpace.Dual

/-!
# Two distinct interior points cannot share the boundary-radius metric pattern

This is the source-independent planar metric obstruction requested by the
two-interior same-boundary-radius audit.  The proof uses coordinates only for
the final affine algebra; it does not depend on a convex polygon, an MEC
construction, or a closure-layer import.
-/

namespace Erdos9796Proof.Geometry

open scoped EuclideanGeometry InnerProductSpace

/-- The real inner product in the Euclidean plane is the sum of the two
coordinatewise products. -/
private theorem oneBoundary_inner_eq_coords (u w : ℝ²) :
    ⟪u, w⟫_ℝ = u 0 * w 0 + u 1 * w 1 := by
  rw [PiLp.inner_apply]
  simp [Fin.sum_univ_two, mul_comm (u _) (w _)]

/-- A point outside the convex hull of a finite planar set admits a vector
which points strictly from every hull point toward the excluded point. -/
theorem exists_strict_separating_vector_from_finite_convexHull
    {S : Set ℝ²} (hS : S.Finite) {p : ℝ²}
    (hp : p ∉ convexHull ℝ S) :
    ∃ w : ℝ², ∀ q ∈ convexHull ℝ S, 0 < ⟪w, p - q⟫_ℝ := by
  have hcompact : IsCompact (convexHull ℝ S) := hS.isCompact_convexHull
  have hconvex : Convex ℝ (convexHull ℝ S) := convex_convexHull ℝ S
  obtain ⟨f, u, v, hfp, huv, hfS⟩ :=
    geometric_hahn_banach_compact_closed
      (s := ({p} : Set ℝ²)) (t := convexHull ℝ S)
      (convex_singleton p) isCompact_singleton hconvex hcompact.isClosed
      (Set.disjoint_singleton_left.2 hp)
  let z : ℝ² := (InnerProductSpace.toDual ℝ ℝ²).symm f
  refine ⟨-z, ?_⟩
  intro q hq
  have hpq : f p < f q :=
    (hfp p (by simp)).trans (huv.trans (hfS q hq))
  have hfq : f q = ⟪z, q⟫_ℝ := by
    symm
    exact InnerProductSpace.toDual_symm_apply
  have hfp' : f p = ⟪z, p⟫_ℝ := by
    symm
    exact InnerProductSpace.toDual_symm_apply
  have hdiff : 0 < ⟪z, q⟫_ℝ - ⟪z, p⟫_ℝ := by
    rw [← hfq, ← hfp']
    exact sub_pos.mpr hpq
  simp only [inner_neg_left, inner_sub_right]
  nlinarith [hdiff]

/-- The scalar contradiction behind the one-boundary reflected-pair theorem.
The normalized base endpoints are `(-1, 0)` and `(1, 0)`; the two candidate
points are `(x, y)` and `(x, -y)`. -/
theorem false_of_normalized_one_boundary_reflected_pair
    {h k x y u v : ℝ}
    (hy : y ≠ 0)
    (hxplus : 0 < x + 1)
    (hradius : 4 ≤ (x - 1) ^ 2 + y ^ 2)
    (hXdisk : (x - h) ^ 2 + (y - k) ^ 2 ≤ (-1 - h) ^ 2 + k ^ 2)
    (hYdisk : (x - h) ^ 2 + (-y - k) ^ 2 ≤ (-1 - h) ^ 2 + k ^ 2)
    (hu : 0 < u)
    (hsepX : 0 < u * (1 - x) - v * y)
    (hsepY : 0 < u * (1 - x) + v * y)
    (hsepC : 0 < u * (1 - h) - v * k) : False := by
  have hy2 : 0 < y ^ 2 := sq_pos_of_ne_zero hy
  have hDplus : 0 ≤ (h - 1) * (x + 1) + k * y := by
    nlinarith [hXdisk, hradius]
  have hDminus : 0 ≤ (h - 1) * (x + 1) - k * y := by
    nlinarith [hYdisk, hradius]
  have hax : 0 ≤ (h - 1) * (x + 1) := by
    nlinarith [hDplus, hDminus]
  have ha : 0 ≤ h - 1 := nonneg_of_mul_nonneg_left hax hxplus
  have hfirst : 0 < 2 * y ^ 2 * (u * (1 - h) - v * k) :=
    mul_pos (mul_pos (by norm_num) hy2) hsepC
  have hsecond :
      0 ≤ (u * (1 - x) - v * y) * ((h - 1) * (x + 1) - k * y) :=
    mul_nonneg hsepX.le hDminus
  have hthird :
      0 ≤ (u * (1 - x) + v * y) * ((h - 1) * (x + 1) + k * y) :=
    mul_nonneg hsepY.le hDplus
  have hfourth : 0 ≤ 4 * u * (h - 1) * (x + 1) := by positivity
  have hid :
      2 * y ^ 2 * (u * (1 - h) - v * k) +
          (u * (1 - x) - v * y) * ((h - 1) * (x + 1) - k * y) +
          (u * (1 - x) + v * y) * ((h - 1) * (x + 1) + k * y) +
          4 * u * (h - 1) * (x + 1) ≤ 0 := by
    nlinarith [hradius]
  nlinarith

/-- In the normalized frame, a nontrivial reflected pair lying in the disk
through `(-1, 0)` forces `(1, 0)` to lie strictly inside that disk. -/
theorem normalized_second_endpoint_strictly_inside
    {h k x y : ℝ}
    (hxplus : 0 < x + 1)
    (hradius : 4 ≤ (x - 1) ^ 2 + y ^ 2)
    (hXdisk : (x - h) ^ 2 + (y - k) ^ 2 ≤ (-1 - h) ^ 2 + k ^ 2)
    (hYdisk : (x - h) ^ 2 + (-y - k) ^ 2 ≤ (-1 - h) ^ 2 + k ^ 2) :
    (1 - h) ^ 2 + k ^ 2 < (-1 - h) ^ 2 + k ^ 2 := by
  have hDplus : 0 ≤ (h - 1) * (x + 1) + k * y := by
    nlinarith [hXdisk, hradius]
  have hDminus : 0 ≤ (h - 1) * (x + 1) - k * y := by
    nlinarith [hYdisk, hradius]
  have hax : 0 ≤ (h - 1) * (x + 1) := by
    nlinarith [hDplus, hDminus]
  have ha : 0 ≤ h - 1 := nonneg_of_mul_nonneg_left hax hxplus
  nlinarith

set_option maxHeartbeats 2000000 in
-- Elaborating the two finite-hull separation witnesses and their normalized
-- coordinate consequences exceeds the default deterministic heartbeat budget.
/-- Two distinct common equidistant points force their radius about `B` to be
strictly smaller than `BP` when `P` is on a genuinely center-supported
enclosing circle.  No boundary hypothesis on `B` is required. -/
theorem dist_lt_base_of_one_boundary_reflected_pair
    {A : Finset ℝ²} {C B P X Y : ℝ²} {R : ℝ}
    (hconv : EuclideanGeometry.ConvexIndep (A : Set ℝ²))
    (hcontain : ∀ q ∈ A, dist q C ≤ R)
    (hcenter : C ∈ convexHull ℝ {q : ℝ² | q ∈ A ∧ dist q C = R})
    (hBmem : B ∈ A) (hPmem : P ∈ A) (hXmem : X ∈ A) (hYmem : Y ∈ A)
    (hPB : P ≠ B) (hXY : X ≠ Y)
    (hPboundary : dist P C = R)
    (hPX : dist P X = dist P Y)
    (hBXY : dist B X = dist B Y) :
    dist B X < dist B P := by
  by_contra hnot
  have hBPleX : dist B P ≤ dist B X := le_of_not_gt hnot
  let F : SimilarityFrame P B := ofDistinct hPB
  let x := F X 0
  let y := F X 1
  let xY := F Y 0
  let yY := F Y 1
  let h := F C 0
  let k := F C 1
  have hFBXY : dist (F B) (F X) = dist (F B) (F Y) :=
    (F.dist_eq_iff B X Y).2 hBXY
  have hFPXY : dist (F P) (F X) = dist (F P) (F Y) :=
    (F.dist_eq_iff P X Y).2 hPX
  have hFBXYsq := congrArg (fun t : ℝ ↦ t ^ 2) hFBXY
  have hFPXYsq := congrArg (fun t : ℝ ↦ t ^ 2) hFPXY
  simp only [Problem97.dist_sq_coord] at hFBXYsq hFPXYsq
  have hBcoord : (1 - x) ^ 2 + y ^ 2 = (1 - xY) ^ 2 + yY ^ 2 := by
    simpa [x, y, xY, yY, F, planePoint, EuclideanSpace.single_apply] using hFBXYsq
  have hPcoord : (-1 - x) ^ 2 + y ^ 2 = (-1 - xY) ^ 2 + yY ^ 2 := by
    simpa [x, y, xY, yY, F, planePoint, EuclideanSpace.single_apply] using hFPXYsq
  have hxEq : x = xY := by
    nlinarith only [hBcoord, hPcoord]
  have hySq : y ^ 2 = yY ^ 2 := by
    rw [hxEq] at hBcoord
    nlinarith only [hBcoord]
  have hyNeY : y ≠ yY := by
    intro heq
    apply hXY
    apply F.injective
    ext i
    fin_cases i
    · simpa [x, xY] using hxEq
    · simpa [y, yY] using heq
  have hyY : yY = -y := by
    rcases sq_eq_sq_iff_eq_or_eq_neg.mp hySq with heq | hneg
    · exact False.elim (hyNeY heq)
    · nlinarith only [hneg]
  have hy : y ≠ 0 := by
    intro hy0
    apply hyNeY
    nlinarith only [hy0, hyY]
  have hFBPleX : dist (F B) (F P) ≤ dist (F B) (F X) := by
    rw [F.dist_map, F.dist_map]
    exact mul_le_mul_of_nonneg_left hBPleX F.scale_pos.le
  have hFBPleXsq : dist (F B) (F P) ^ 2 ≤ dist (F B) (F X) ^ 2 :=
    (sq_le_sq₀ dist_nonneg dist_nonneg).2 hFBPleX
  simp only [Problem97.dist_sq_coord] at hFBPleXsq
  have hradius : 4 ≤ (x - 1) ^ 2 + y ^ 2 := by
    dsimp [x, y]
    have hraw := hFBPleXsq
    simp [F, planePoint, EuclideanSpace.single_apply] at hraw
    nlinarith only [hraw]
  have hXinside : dist X C ≤ dist P C := by
    calc
      dist X C ≤ R := hcontain X hXmem
      _ = dist P C := hPboundary.symm
  have hYinside : dist Y C ≤ dist P C := by
    calc
      dist Y C ≤ R := hcontain Y hYmem
      _ = dist P C := hPboundary.symm
  have hFXinside : dist (F X) (F C) ≤ dist (F P) (F C) := by
    rw [F.dist_map, F.dist_map]
    exact mul_le_mul_of_nonneg_left hXinside F.scale_pos.le
  have hFYinside : dist (F Y) (F C) ≤ dist (F P) (F C) := by
    rw [F.dist_map, F.dist_map]
    exact mul_le_mul_of_nonneg_left hYinside F.scale_pos.le
  have hFXinsideSq : dist (F X) (F C) ^ 2 ≤ dist (F P) (F C) ^ 2 :=
    (sq_le_sq₀ dist_nonneg dist_nonneg).2 hFXinside
  have hFYinsideSq : dist (F Y) (F C) ^ 2 ≤ dist (F P) (F C) ^ 2 :=
    (sq_le_sq₀ dist_nonneg dist_nonneg).2 hFYinside
  simp only [Problem97.dist_sq_coord] at hFXinsideSq hFYinsideSq
  have hXdisk : (x - h) ^ 2 + (y - k) ^ 2 ≤ (-1 - h) ^ 2 + k ^ 2 := by
    simpa [x, y, h, k, F, planePoint, EuclideanSpace.single_apply] using hFXinsideSq
  have hYdisk : (x - h) ^ 2 + (-y - k) ^ 2 ≤ (-1 - h) ^ 2 + k ^ 2 := by
    have hraw : (xY - h) ^ 2 + (yY - k) ^ 2 ≤ (-1 - h) ^ 2 + k ^ 2 := by
      simpa [xY, yY, h, k, F, planePoint, EuclideanSpace.single_apply] using hFYinsideSq
    rw [← hxEq, hyY] at hraw
    exact hraw
  have hsepMappedHull : ∀ q ∈ A, ∃ w : ℝ²,
      ∀ z ∈ convexHull ℝ (F '' (((A.erase q : Finset ℝ²) : Set ℝ²))),
        0 < ⟪w, F q - z⟫_ℝ := by
    intro q hq
    have hqNot : q ∉ convexHull ℝ (((A.erase q : Finset ℝ²) : Set ℝ²) : Set ℝ²) := by
      apply convexIndep_not_mem_convexHull_of_finset_subset_diff hconv hq
      intro z hz
      have hzA : z ∈ A := Finset.mem_of_mem_erase hz
      have hzne : z ≠ q := Finset.ne_of_mem_erase hz
      exact ⟨hzA, by simp [hzne]⟩
    have hqNotMap :
        F q ∉ convexHull ℝ (F '' (((A.erase q : Finset ℝ²) : Set ℝ²)) ) := by
      intro hmem
      exact hqNot ((F.convexHull_mem_iff).mp hmem)
    exact exists_strict_separating_vector_from_finite_convexHull
      ((A.erase q).finite_toSet.image F) hqNotMap
  have hXneP : X ≠ P := by
    intro hXP
    have hPY0 : dist P Y = 0 := by
      rw [← hPX, hXP]
      simp
    have hYP : Y = P := (dist_eq_zero.mp hPY0).symm
    exact hXY (hXP.trans hYP.symm)
  have hYneP : Y ≠ P := by
    intro hYP
    have hPX0 : dist P X = 0 := by
      rw [hPX, hYP]
      simp
    have hXP : X = P := (dist_eq_zero.mp hPX0).symm
    exact hXY (hXP.trans hYP.symm)
  obtain ⟨wP, hwP⟩ := hsepMappedHull P hPmem
  have hBmemEraseP : B ∈ A.erase P := Finset.mem_erase.mpr ⟨hPB.symm, hBmem⟩
  have hXmemEraseP : X ∈ A.erase P := Finset.mem_erase.mpr ⟨hXneP, hXmem⟩
  have hYmemEraseP : Y ∈ A.erase P := Finset.mem_erase.mpr ⟨hYneP, hYmem⟩
  have hsepPB := hwP (F B)
    (subset_convexHull ℝ _ ⟨B, hBmemEraseP, rfl⟩)
  have hsepPX := hwP (F X)
    (subset_convexHull ℝ _ ⟨X, hXmemEraseP, rfl⟩)
  have hsepPY := hwP (F Y)
    (subset_convexHull ℝ _ ⟨Y, hYmemEraseP, rfl⟩)
  let a := wP 0
  let b := wP 1
  have hsepPBcoord : 0 < -2 * a := by
    dsimp [a]
    simp [oneBoundary_inner_eq_coords, F, planePoint,
      EuclideanSpace.single_apply, PiLp.sub_apply] at hsepPB
    nlinarith only [hsepPB]
  have hsepPXcoord : 0 < a * (-1 - x) - b * y := by
    dsimp [a, b, x, y]
    simp [oneBoundary_inner_eq_coords, F, planePoint,
      EuclideanSpace.single_apply, PiLp.sub_apply] at hsepPX
    nlinarith only [hsepPX]
  have hsepPYcoord : 0 < a * (-1 - xY) - b * yY := by
    dsimp [a, b, xY, yY]
    simp [oneBoundary_inner_eq_coords, F, planePoint,
      EuclideanSpace.single_apply, PiLp.sub_apply] at hsepPY
    nlinarith only [hsepPY]
  have haNeg : a < 0 := by nlinarith only [hsepPBcoord]
  have haxNeg : a * (x + 1) < 0 := by
    rw [← hxEq, hyY] at hsepPYcoord
    nlinarith only [hsepPXcoord, hsepPYcoord]
  have haxNeg' : (x + 1) * a < 0 := by nlinarith only [haxNeg]
  have hxplus : 0 < x + 1 := pos_of_mul_neg_left haxNeg' haNeg.le
  have hBinsideCoord :
      (1 - h) ^ 2 + k ^ 2 < (-1 - h) ^ 2 + k ^ 2 :=
    normalized_second_endpoint_strictly_inside hxplus hradius hXdisk hYdisk
  have hBinsideSq : dist (F B) (F C) ^ 2 < dist (F P) (F C) ^ 2 := by
    rw [Problem97.dist_sq_coord, Problem97.dist_sq_coord]
    simpa [h, k, F, planePoint, EuclideanSpace.single_apply] using hBinsideCoord
  have hBinsideMap : dist (F B) (F C) < dist (F P) (F C) :=
    (sq_lt_sq₀ dist_nonneg dist_nonneg).mp hBinsideSq
  have hBinside : dist B C < dist P C := by
    rw [F.dist_map, F.dist_map] at hBinsideMap
    exact lt_of_mul_lt_mul_left hBinsideMap F.scale_pos.le
  have hBstrict : dist B C < R := by simpa [hPboundary] using hBinside
  have hsupportErase :
      {q : ℝ² | q ∈ A ∧ dist q C = R} ⊆ ((A.erase B : Finset ℝ²) : Set ℝ²) := by
    rintro q ⟨hqA, hqR⟩
    have hqne : q ≠ B := by
      intro hqB
      subst q
      exact (ne_of_lt hBstrict) hqR
    exact Finset.mem_erase.mpr ⟨hqne, hqA⟩
  have hcenterErase :
      C ∈ convexHull ℝ (((A.erase B : Finset ℝ²) : Set ℝ²)) :=
    convexHull_mono hsupportErase hcenter
  obtain ⟨w, hw⟩ := hsepMappedHull B hBmem
  have hXneB : X ≠ B := by
    intro hXB
    have hBY0 : dist B Y = 0 := by
      rw [← hBXY, hXB]
      simp
    have hYB : Y = B := (dist_eq_zero.mp hBY0).symm
    exact hXY (hXB.trans hYB.symm)
  have hYneB : Y ≠ B := by
    intro hYB
    have hBX0 : dist B X = 0 := by
      rw [hBXY, hYB]
      simp
    have hXB : X = B := (dist_eq_zero.mp hBX0).symm
    exact hXY (hXB.trans hYB.symm)
  have hPmemEraseB : P ∈ A.erase B := Finset.mem_erase.mpr ⟨hPB, hPmem⟩
  have hXmemEraseB : X ∈ A.erase B := Finset.mem_erase.mpr ⟨hXneB, hXmem⟩
  have hYmemEraseB : Y ∈ A.erase B := Finset.mem_erase.mpr ⟨hYneB, hYmem⟩
  have hcenterMap :
      F C ∈ convexHull ℝ (F '' (((A.erase B : Finset ℝ²) : Set ℝ²))) :=
    (F.convexHull_mem_iff).2 hcenterErase
  have hsepBP := hw (F P)
    (subset_convexHull ℝ _ ⟨P, hPmemEraseB, rfl⟩)
  have hsepBX := hw (F X)
    (subset_convexHull ℝ _ ⟨X, hXmemEraseB, rfl⟩)
  have hsepBY := hw (F Y)
    (subset_convexHull ℝ _ ⟨Y, hYmemEraseB, rfl⟩)
  have hsepBC := hw (F C) hcenterMap
  let u := w 0
  let v := w 1
  have hu : 0 < u := by
    dsimp [u]
    simp [oneBoundary_inner_eq_coords, F, planePoint,
      EuclideanSpace.single_apply, PiLp.sub_apply] at hsepBP
    nlinarith only [hsepBP]
  have hsepXcoord : 0 < u * (1 - x) - v * y := by
    dsimp [u, v, x, y]
    simp [oneBoundary_inner_eq_coords, F, planePoint,
      EuclideanSpace.single_apply, PiLp.sub_apply] at hsepBX
    nlinarith only [hsepBX]
  have hsepYcoord : 0 < u * (1 - x) + v * y := by
    have hraw : 0 < u * (1 - xY) - v * yY := by
      dsimp [u, v, xY, yY]
      simp [oneBoundary_inner_eq_coords, F, planePoint,
        EuclideanSpace.single_apply, PiLp.sub_apply] at hsepBY
      nlinarith only [hsepBY]
    rw [← hxEq, hyY] at hraw
    nlinarith only [hraw]
  have hsepCcoord : 0 < u * (1 - h) - v * k := by
    dsimp [u, v, h, k]
    simp [oneBoundary_inner_eq_coords, F, planePoint,
      EuclideanSpace.single_apply, PiLp.sub_apply] at hsepBC
    nlinarith only [hsepBC]
  exact false_of_normalized_one_boundary_reflected_pair
    hy hxplus hradius hXdisk hYdisk hu hsepXcoord hsepYcoord hsepCcoord

/-- Equality in the one-boundary radius comparison is impossible: two carrier
points in the same selected row about `B` and the same row about boundary point
`P` must coincide. -/
theorem eq_of_one_boundary_same_radius_pair
    {A : Finset ℝ²} {C B P X Y : ℝ²} {R : ℝ}
    (hconv : EuclideanGeometry.ConvexIndep (A : Set ℝ²))
    (hcontain : ∀ q ∈ A, dist q C ≤ R)
    (hcenter : C ∈ convexHull ℝ {q : ℝ² | q ∈ A ∧ dist q C = R})
    (hBmem : B ∈ A) (hPmem : P ∈ A) (hXmem : X ∈ A) (hYmem : Y ∈ A)
    (hPboundary : dist P C = R)
    (hBP : dist B P = dist B X)
    (hBY : dist B P = dist B Y)
    (hPX : dist P X = dist P Y) : X = Y := by
  by_contra hXY
  have hPB : P ≠ B := by
    intro hPB
    have hBX0 : dist B X = 0 := by
      rw [← hBP, ← hPB]
      simp
    have hBY0 : dist B Y = 0 := by
      rw [← hBY, ← hPB]
      simp
    exact hXY ((dist_eq_zero.mp hBX0).symm.trans (dist_eq_zero.mp hBY0))
  have hBXY : dist B X = dist B Y := hBP.symm.trans hBY
  have hlt := dist_lt_base_of_one_boundary_reflected_pair
    hconv hcontain hcenter hBmem hPmem hXmem hYmem hPB hXY
      hPboundary hPX hBXY
  nlinarith only [hlt, hBP]

#print axioms dist_lt_base_of_one_boundary_reflected_pair
#print axioms eq_of_one_boundary_same_radius_pair

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
