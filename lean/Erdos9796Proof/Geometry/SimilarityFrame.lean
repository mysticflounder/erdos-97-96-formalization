/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna.
-/

import Erdos9796Proof.Geometry.FivePointCircleIsosceles

/-!
# Similarity frames in the Euclidean plane

This file provides the elementary similarity chart which sends two distinct
points to `(-1, 0)` and `(1, 0)`.  The chart is affine, has positive scale,
and transports distances and convex-hull membership exactly.
-/

open scoped InnerProductSpace

namespace Erdos9796Proof
namespace Geometry

/-- The point with coordinates `(x, y)` in `Plane`. -/
noncomputable def planePoint (x y : ℝ) : Plane :=
  EuclideanSpace.single 0 x + EuclideanSpace.single 1 y

/-- The linear part of the similarity frame based at `q₁`, `q₂`. -/
noncomputable def similarityFrameLinear (q₁ q₂ : Plane) : Plane →ₗ[ℝ] Plane :=
  let dx := q₂ 0 - q₁ 0
  let dy := q₂ 1 - q₁ 1
  let den := dx ^ 2 + dy ^ 2
  { toFun := fun v =>
      planePoint ((2 / den) * (v 0 * dx + v 1 * dy))
        ((2 / den) * (v 0 * (-dy) + v 1 * dx))
    map_add' := by
      intro v w
      ext i
      fin_cases i
      all_goals simp [planePoint, EuclideanSpace.single_apply, PiLp.add_apply]
      all_goals ring
    map_smul' := by
      intro a v
      ext i
      fin_cases i
      all_goals simp [planePoint, EuclideanSpace.single_apply, PiLp.smul_apply]
      all_goals ring }

/-- The normalized point map associated to two endpoints. -/
noncomputable def similarityFrameMap (q₁ q₂ : Plane) (q : Plane) : Plane :=
  similarityFrameLinear q₁ q₂ (q - q₁) + planePoint (-1) 0

/-- The affine form of `similarityFrameMap`. -/
noncomputable def similarityFrameAffine (q₁ q₂ : Plane) : Plane →ᵃ[ℝ] Plane :=
  AffineMap.mk' (similarityFrameMap q₁ q₂) (similarityFrameLinear q₁ q₂)
    (planePoint (-1) 0) (by
      intro q
      simp [similarityFrameMap]
      module)

/-- A positive-scale affine frame with normalized endpoints and metric transport. -/
structure SimilarityFrame (q₁ q₂ : Plane) where
  /-- The affine normalization map. -/
  map : Plane →ᵃ[ℝ] Plane
  /-- The positive distance scale. -/
  scale : ℝ
  /-- Positivity of the scale. -/
  scale_pos : 0 < scale
  /-- The first endpoint is sent to `(-1, 0)`. -/
  map_q₁ : map q₁ = planePoint (-1) 0
  /-- The second endpoint is sent to `(1, 0)`. -/
  map_q₂ : map q₂ = planePoint 1 0
  /-- Every distance is multiplied by `scale`. -/
  dist_map : ∀ p r : Plane, dist (map p) (map r) = scale * dist p r

namespace SimilarityFrame

instance {q₁ q₂ : Plane} : CoeFun (SimilarityFrame q₁ q₂) (fun _ => Plane → Plane) :=
  ⟨fun F => F.map⟩

@[simp] theorem map_apply {q₁ q₂ : Plane} (F : SimilarityFrame q₁ q₂) (p : Plane) :
    F p = F.map p := rfl

theorem dist_eq_iff {q₁ q₂ : Plane} (F : SimilarityFrame q₁ q₂)
    (p r s : Plane) :
    dist (F p) (F r) = dist (F p) (F s) ↔ dist p r = dist p s := by
  have hs : F.scale ≠ 0 := ne_of_gt F.scale_pos
  constructor
  · intro h
    rw [F.dist_map, F.dist_map] at h
    exact mul_left_cancel₀ hs h
  · intro h
    rw [F.dist_map, F.dist_map]
    rw [h]

theorem injective {q₁ q₂ : Plane} (F : SimilarityFrame q₁ q₂) :
    Function.Injective F := by
  intro p r h
  have hdist : dist (F p) (F r) = 0 := by simp [h]
  rw [F.dist_map] at hdist
  have : dist p r = 0 := by
    exact (mul_eq_zero.mp hdist).resolve_left (ne_of_gt F.scale_pos)
  exact dist_eq_zero.mp this

theorem convexHull_mem_iff {q₁ q₂ : Plane} (F : SimilarityFrame q₁ q₂)
    {S : Set Plane} {p : Plane} :
    F p ∈ convexHull ℝ (F '' S) ↔ p ∈ convexHull ℝ S := by
  let T : Plane →ᵃ[ℝ] Plane := F.map
  have hmap : T '' convexHull ℝ S = convexHull ℝ (T '' S) :=
    AffineMap.image_convexHull T S
  constructor
  · intro hp
    rw [← hmap] at hp
    obtain ⟨r, hr, hTr⟩ := hp
    have : r = p := F.injective hTr
    simpa [T, this] using hr
  · intro hp
    rw [← hmap]
    exact ⟨p, hp, rfl⟩

end SimilarityFrame

private theorem dist_sq_coord (p r : Plane) :
    dist p r ^ 2 = (p 0 - r 0) ^ 2 + (p 1 - r 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

private theorem similarityFrame_den_pos {q₁ q₂ : Plane} (h : q₁ ≠ q₂) :
    0 < (q₂ 0 - q₁ 0) ^ 2 + (q₂ 1 - q₁ 1) ^ 2 := by
  have hdist : 0 < dist q₁ q₂ := dist_pos.mpr h
  have hdist_sq : 0 < dist q₁ q₂ ^ 2 := sq_pos_of_pos hdist
  rw [dist_sq_coord] at hdist_sq
  nlinarith

private theorem similarityFrame_map_dist {q₁ q₂ : Plane} (h : q₁ ≠ q₂) (p r : Plane) :
    dist (similarityFrameMap q₁ q₂ p) (similarityFrameMap q₁ q₂ r) =
      (2 / dist q₁ q₂) * dist p r := by
  let dx := q₂ 0 - q₁ 0
  let dy := q₂ 1 - q₁ 1
  let den := dx ^ 2 + dy ^ 2
  have hden : 0 < den := by
    dsimp [dx, dy, den]
    exact similarityFrame_den_pos h
  have hden_ne : den ≠ 0 := ne_of_gt hden
  have hden_dist : den = dist q₁ q₂ ^ 2 := by
    dsimp [den, dx, dy]
    simpa [dist_comm] using (dist_sq_coord q₂ q₁).symm
  have hdiff :
      similarityFrameMap q₁ q₂ p - similarityFrameMap q₁ q₂ r =
        (2 / den) •
        planePoint ((p 0 - r 0) * dx + (p 1 - r 1) * dy)
          ((p 0 - r 0) * (-dy) + (p 1 - r 1) * dx) := by
    ext i
    fin_cases i
    all_goals simp [similarityFrameMap, similarityFrameLinear, planePoint, dx, dy, den,
      EuclideanSpace.single_apply, PiLp.sub_apply, PiLp.smul_apply, PiLp.add_apply]
    all_goals ring
  have hsq :
      ‖similarityFrameMap q₁ q₂ p - similarityFrameMap q₁ q₂ r‖ ^ 2 =
        ((2 / dist q₁ q₂) * dist p r) ^ 2 := by
    rw [hdiff, norm_smul, Real.norm_of_nonneg (by positivity)]
    have hpoint_sq :
        ‖planePoint ((p 0 - r 0) * dx + (p 1 - r 1) * dy)
            ((p 0 - r 0) * (-dy) + (p 1 - r 1) * dx)‖ ^ 2 =
          den * dist p r ^ 2 := by
      rw [EuclideanSpace.norm_sq_eq]
      simp [planePoint, EuclideanSpace.single_apply, Fin.sum_univ_two, sq_abs,
        Real.norm_eq_abs]
      rw [dist_sq_coord]
      dsimp [dx, dy, den]
      ring
    calc
      (2 / den * ‖planePoint ((p 0 - r 0) * dx + (p 1 - r 1) * dy)
          ((p 0 - r 0) * (-dy) + (p 1 - r 1) * dx)‖) ^ 2 =
          (2 / den) ^ 2 *
            ‖planePoint ((p 0 - r 0) * dx + (p 1 - r 1) * dy)
              ((p 0 - r 0) * (-dy) + (p 1 - r 1) * dx)‖ ^ 2 := by ring
      _ = (2 / den) ^ 2 * (den * dist p r ^ 2) := by rw [hpoint_sq]
      _ = ((2 / dist q₁ q₂) * dist p r) ^ 2 := by
        rw [hden_dist]
        field_simp [ne_of_gt (dist_pos.mpr h)]
  have hsq' :
      dist (similarityFrameMap q₁ q₂ p) (similarityFrameMap q₁ q₂ r) ^ 2 =
        ((2 / dist q₁ q₂) * dist p r) ^ 2 := by
    simpa [dist_eq_norm] using hsq
  have hnonneg₁ : 0 ≤ dist (similarityFrameMap q₁ q₂ p) (similarityFrameMap q₁ q₂ r) :=
    dist_nonneg
  have hnonneg₂ : 0 ≤ (2 / dist q₁ q₂) * dist p r := by positivity
  nlinarith

/-- The canonical frame sending distinct `q₁`, `q₂` to `(-1, 0)`, `(1, 0)`. -/
noncomputable def ofDistinct {q₁ q₂ : Plane} (h : q₁ ≠ q₂) : SimilarityFrame q₁ q₂ := by
  let T := similarityFrameAffine q₁ q₂
  have hden : 0 < (q₂ 0 - q₁ 0) ^ 2 + (q₂ 1 - q₁ 1) ^ 2 :=
    similarityFrame_den_pos h
  refine
    { map := T
      scale := 2 / dist q₁ q₂
      scale_pos := div_pos (by norm_num) (dist_pos.mpr h)
      map_q₁ := ?_
      map_q₂ := ?_
      dist_map := ?_ }
  · ext i
    fin_cases i
    all_goals simp [T, similarityFrameAffine, similarityFrameMap, similarityFrameLinear,
      planePoint, EuclideanSpace.single_apply]
  · ext i
    fin_cases i
    · simp [T, similarityFrameAffine, similarityFrameMap, similarityFrameLinear, planePoint,
        EuclideanSpace.single_apply]
      field_simp [ne_of_gt hden]
      all_goals ring
    · simp [T, similarityFrameAffine, similarityFrameMap, similarityFrameLinear, planePoint,
        EuclideanSpace.single_apply]
      field_simp [ne_of_gt hden]
      all_goals ring_nf
      all_goals simp
  · intro p r
    exact similarityFrame_map_dist h p r

@[simp] theorem ofDistinct_map_q₁ {q₁ q₂ : Plane} (h : q₁ ≠ q₂) :
    ofDistinct h q₁ = planePoint (-1) 0 := (ofDistinct h).map_q₁

@[simp] theorem ofDistinct_map_q₂ {q₁ q₂ : Plane} (h : q₁ ≠ q₂) :
    ofDistinct h q₂ = planePoint 1 0 := (ofDistinct h).map_q₂

theorem ofDistinct_dist_map {q₁ q₂ : Plane} (h : q₁ ≠ q₂) (p r : Plane) :
    dist (ofDistinct h p) (ofDistinct h r) =
      (2 / dist q₁ q₂) * dist p r := (ofDistinct h).dist_map p r

theorem ofDistinct_convexHull_mem_iff {q₁ q₂ : Plane} (h : q₁ ≠ q₂)
    {S : Set Plane} {p : Plane} :
    ofDistinct h p ∈ convexHull ℝ (ofDistinct h '' S) ↔ p ∈ convexHull ℝ S := by
  exact (ofDistinct h).convexHull_mem_iff

/-- A closed-ball inequality transported through a similarity frame. -/
theorem closedBall_coord_sq_le {q₁ q₂ : Plane} (F : SimilarityFrame q₁ q₂)
    {p c : Plane} {r : ℝ} (hr : 0 ≤ r) (hpc : dist p c ≤ r) :
    (F p 0 - F c 0) ^ 2 + (F p 1 - F c 1) ^ 2 ≤ (F.scale * r) ^ 2 := by
  have hscaled : dist (F p) (F c) ≤ F.scale * r := by
    rw [F.dist_map]
    exact mul_le_mul_of_nonneg_left hpc F.scale_pos.le
  have hsq : dist (F p) (F c) ^ 2 ≤ (F.scale * r) ^ 2 := by
    exact (sq_le_sq₀ dist_nonneg (mul_nonneg F.scale_pos.le hr)).2 hscaled
  rw [dist_sq_coord] at hsq
  exact hsq

end Geometry
end Erdos9796Proof
