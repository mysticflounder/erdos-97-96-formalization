/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Seven-point equilateral-median interlock collision core

This file proves that a particular eleven-relation distance-equality system on seven
arbitrary labels forces its two anchor labels to coincide. It also packages the system
as an equality-closure core for finite row patterns.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem sevenPointEquilateralMedianInterlockCollision_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 :=
  Problem97.dist_sq_coord x y

/-- The six normalized scalar equations are inconsistent. -/
private theorem sevenPointEquilateralMedianInterlockCollision_scalar_incompatible
    {β υ x z w : ℝ}
    (g0 : -8 * β * υ + 4 * υ ^ 2 - 1 = 0)
    (g1 : β ^ 2 - 2 * β * υ - 3 * υ ^ 2 + 4 * x ^ 2 - 4 * x = 0)
    (g2 : -3 * β ^ 2 + 2 * β * υ + υ ^ 2 + 4 * x ^ 2 - 1 = 0)
    (g3 : -4 * β ^ 2 + 4 * w ^ 2 + 4 * z ^ 2 - 1 = 0)
    (g4 : w ^ 2 + z ^ 2 - 2 * z = 0)
    (g5 : β ^ 2 + β * υ - (β + υ) * w - 2 * x * z + x = 0) : False := by
  set H := 4 * x ^ 2 - 2 * x - 1
  have hproduct : 64 * x * (2 * x - 1) * H = 0 := by
    dsimp only [H]
    linear_combination
      (-20 * β * υ - 16 * x ^ 2 + 4 * x + 5) * g0 +
      (20 * υ ^ 2 + 96 * x ^ 2 - 24 * x - 15) * g1 +
      (60 * υ ^ 2 + 32 * x ^ 2 - 8 * x - 5) * g2
  rcases mul_eq_zero.mp hproduct with hx | hH
  · rcases mul_eq_zero.mp hx with h64x | h2x
    · have hx0 : x = 0 := by norm_num at h64x ⊢; exact h64x
      have hR : 20 * υ ^ 2 - 32 * x ^ 2 + 24 * x + 1 = 0 := by
        linear_combination g0 - 6 * g1 - 2 * g2
      rw [hx0] at hR
      linarith only [hR, sq_nonneg υ]
    · have hxhalf : x = 1 / 2 := by linarith only [h2x]
      have hR : 20 * υ ^ 2 - 32 * x ^ 2 + 24 * x + 1 = 0 := by
        linear_combination g0 - 6 * g1 - 2 * g2
      rw [hxhalf] at hR
      norm_num at hR
      linarith only [hR, sq_nonneg υ]
  · have hHzero : H = 0 := hH
    have hU : 20 * υ ^ 2 + 8 * x - 7 = 0 := by
      dsimp only [H] at hHzero
      linear_combination g0 - 6 * g1 - 2 * g2 + 8 * hHzero
    have hB0 : β + (4 * x + 1) * υ = 0 := by
      linear_combination -β * g0 + υ * g1 + 3 * υ * g2 - 4 * υ * hHzero
    have hZ0 : 8 * z - 4 * β ^ 2 - 1 = 0 := by
      linear_combination g3 - 4 * g4
    have hZ : 5 * z - x - 1 = 0 := by
      linear_combination (10 * υ ^ 2 - 4) * hHzero +
        (2 * x + 5 / 8) * hU +
        (-10 * υ * x + 5 * β / 2 - 5 * υ / 2) * hB0 + (5 / 8) * hZ0
    have hW : 40 * υ * w * x + 6 * x + 1 = 0 := by
      linear_combination (-40 * υ ^ 2 + 13) * hHzero + (-6 * x - 2) * hU +
        (40 * υ * x - 10 * β + 10 * w) * hB0 + 4 * x * hZ + 10 * g5
    have hS : 1600 * υ ^ 2 * w ^ 2 * x ^ 2 - (6 * x + 1) ^ 2 = 0 := by
      linear_combination (40 * υ * w * x - (6 * x + 1)) * hW
    have hS1 : (-640 * x ^ 3 + 560 * x ^ 2) * w ^ 2 - (6 * x + 1) ^ 2 = 0 := by
      linear_combination hS - 80 * w ^ 2 * x ^ 2 * hU
    have hW2 : 2 * (2 * x - 3) * w ^ 2 + 3 * x + 1 = 0 := by
      linear_combination (-1 / 10 : ℝ) *
        (hS1 - (-20 * (8 * x - 3) * w ^ 2 - 9) * hHzero)
    have hP : 2 * (2 * x - 3) * (2 * z - z ^ 2) + 3 * x + 1 = 0 := by
      linear_combination hW2 - 2 * (2 * x - 3) * g4
    have hxquarter : 4 * x - 1 = 0 := by
      linear_combination (1 / 20 : ℝ) *
        (25 * hP + 2 * (2 * x - 3) * (x + 5 * z - 9) * hZ -
          (9 - x) * hHzero)
    have hfalse : (-5 / 4 : ℝ) = 0 := by
      linear_combination hHzero - (x - 1 / 4) * hxquarter
    norm_num at hfalse

/-- The normalized nine-relation subsystem is inconsistent. -/
private theorem normalized_sevenPointEquilateralMedianInterlockCollision_incompatible
    {T U V B : ℝ²}
    (hQT_QV : dist (pt 0 0) T = dist (pt 0 0) V)
    (hQT_QB : dist (pt 0 0) T = dist (pt 0 0) B)
    (hAT_AQ : dist (pt 1 0) T = dist (pt 1 0) (pt 0 0))
    (hVT_VB : dist V T = dist V B)
    (hVT_VU : dist V T = dist V U)
    (hBQ_BA : dist B (pt 0 0) = dist B (pt 1 0))
    (hBQ_BU : dist B (pt 0 0) = dist B U)
    (hUQ_UA : dist U (pt 0 0) = dist U (pt 1 0))
    (hUQ_UV : dist U (pt 0 0) = dist U V) : False := by
  have hQT_QV_sq := congrArg (fun r : ℝ ↦ r ^ 2) hQT_QV
  have hQT_QB_sq := congrArg (fun r : ℝ ↦ r ^ 2) hQT_QB
  have hAT_AQ_sq := congrArg (fun r : ℝ ↦ r ^ 2) hAT_AQ
  have hVT_VB_sq := congrArg (fun r : ℝ ↦ r ^ 2) hVT_VB
  have hVT_VU_sq := congrArg (fun r : ℝ ↦ r ^ 2) hVT_VU
  have hBQ_BA_sq := congrArg (fun r : ℝ ↦ r ^ 2) hBQ_BA
  have hBQ_BU_sq := congrArg (fun r : ℝ ↦ r ^ 2) hBQ_BU
  have hUQ_UA_sq := congrArg (fun r : ℝ ↦ r ^ 2) hUQ_UA
  have hUQ_UV_sq := congrArg (fun r : ℝ ↦ r ^ 2) hUQ_UV
  change dist (pt 0 0) T ^ 2 = dist (pt 0 0) V ^ 2 at hQT_QV_sq
  change dist (pt 0 0) T ^ 2 = dist (pt 0 0) B ^ 2 at hQT_QB_sq
  change dist (pt 1 0) T ^ 2 = dist (pt 1 0) (pt 0 0) ^ 2 at hAT_AQ_sq
  change dist V T ^ 2 = dist V B ^ 2 at hVT_VB_sq
  change dist V T ^ 2 = dist V U ^ 2 at hVT_VU_sq
  change dist B (pt 0 0) ^ 2 = dist B (pt 1 0) ^ 2 at hBQ_BA_sq
  change dist B (pt 0 0) ^ 2 = dist B U ^ 2 at hBQ_BU_sq
  change dist U (pt 0 0) ^ 2 = dist U (pt 1 0) ^ 2 at hUQ_UA_sq
  change dist U (pt 0 0) ^ 2 = dist U V ^ 2 at hUQ_UV_sq
  rw [sevenPointEquilateralMedianInterlockCollision_dist_sq_coord,
    sevenPointEquilateralMedianInterlockCollision_dist_sq_coord]
    at hQT_QV_sq hQT_QB_sq hAT_AQ_sq hVT_VB_sq hVT_VU_sq hBQ_BA_sq
      hBQ_BU_sq hUQ_UA_sq hUQ_UV_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hQT_QV_sq hQT_QB_sq hAT_AQ_sq hVT_VB_sq hVT_VU_sq hBQ_BA_sq
      hBQ_BU_sq hUQ_UA_sq hUQ_UV_sq
  set β := B 1
  set υ := U 1
  set x := V 0
  set y := V 1
  set z := T 0
  set w := T 1
  set b0 := B 0
  set u0 := U 0
  have hb0 : b0 = 1 / 2 := by
    dsimp only [b0]
    linear_combination (1 / 2 : ℝ) * hBQ_BA_sq
  have hu0 : u0 = 1 / 2 := by
    dsimp only [u0]
    linear_combination (1 / 2 : ℝ) * hUQ_UA_sq
  have hVB_VU_sq :
      (x - b0) ^ 2 + (y - β) ^ 2 = (x - u0) ^ 2 + (y - υ) ^ 2 := by
    linear_combination -hVT_VB_sq + hVT_VU_sq
  rw [hb0, hu0] at hVB_VU_sq
  rw [hb0, hu0] at hBQ_BU_sq
  have g0 : -8 * β * υ + 4 * υ ^ 2 - 1 = 0 := by
    linear_combination -4 * hBQ_BU_sq
  have hfactor : (β - υ) * (β + υ - 2 * y) = 0 := by
    linear_combination hVB_VU_sq
  have hy : β + υ - 2 * y = 0 := by
    rcases mul_eq_zero.mp hfactor with hβυ | hy
    · have hbad : 4 * υ ^ 2 + 1 = 0 := by
        linear_combination -g0 - 8 * υ * hβυ
      linarith only [hbad, sq_nonneg υ]
    · exact hy
  rw [hu0] at hUQ_UV_sq
  rw [hb0] at hQT_QB_sq hVT_VB_sq
  have g1 : β ^ 2 - 2 * β * υ - 3 * υ ^ 2 + 4 * x ^ 2 - 4 * x = 0 := by
    linear_combination -4 * hUQ_UV_sq + (2 * y + β - 3 * υ) * hy
  have g2 : -3 * β ^ 2 + 2 * β * υ + υ ^ 2 + 4 * x ^ 2 - 1 = 0 := by
    linear_combination 4 * hQT_QB_sq - 4 * hQT_QV_sq + (β + υ + 2 * y) * hy
  have g3 : -4 * β ^ 2 + 4 * w ^ 2 + 4 * z ^ 2 - 1 = 0 := by
    linear_combination 4 * hQT_QB_sq
  have g4 : w ^ 2 + z ^ 2 - 2 * z = 0 := by
    dsimp only [w, z]
    linear_combination hAT_AQ_sq
  have g5 :
      β ^ 2 + β * υ - (β + υ) * w - 2 * x * z + x = 0 := by
    linear_combination hVT_VB_sq - hQT_QB_sq + (β - w) * hy
  exact sevenPointEquilateralMedianInterlockCollision_scalar_incompatible
    g0 g1 g2 g3 g4 g5

/-- The eleven distance relations force the two anchors to coincide. -/
theorem seven_point_equilateral_median_interlock_collision
    {p q t u v a b : ℝ²}
    (_hTP_TQ : dist t p = dist t q)
    (hQP_QT : dist q p = dist q t)
    (hQP_QV : dist q p = dist q v)
    (hQP_QB : dist q p = dist q b)
    (hAT_AQ : dist a t = dist a q)
    (hVT_VB : dist v t = dist v b)
    (hVT_VU : dist v t = dist v u)
    (hBQ_BA : dist b q = dist b a)
    (hBQ_BU : dist b q = dist b u)
    (hUQ_UA : dist u q = dist u a)
    (hUQ_UV : dist u q = dist u v) : p = q := by
  by_contra h_pq
  have h_qa : q ≠ a := by
    intro hqa
    have hat_zero : dist a t = 0 := by simpa [hqa] using hAT_AQ
    have hat : a = t := dist_eq_zero.mp hat_zero
    have hqp_zero : dist q p = 0 := by simpa [hqa, hat] using hQP_QT
    exact h_pq (dist_eq_zero.mp hqp_zero).symm
  let N : ℝ² → ℝ² := normSim q a
  let tn := N t
  let un := N u
  let vn := N v
  let bn := N b
  have hdist (X Y : ℝ²) :
      dist (N X) (N Y) = (dist q a)⁻¹ * dist X Y := by
    simpa [N] using normSim_dist_image q a h_qa X Y
  have hN0 : N q = pt 0 0 := by
    simpa [N] using normSim_fst q a
  have hN1 : N a = pt 1 0 := by
    simpa [N] using normSim_snd q a h_qa
  have map_dist_eq {X Y Z R : ℝ²} (h : dist X Y = dist Z R) :
      dist (N X) (N Y) = dist (N Z) (N R) := by
    rw [hdist, hdist, h]
  apply normalized_sevenPointEquilateralMedianInterlockCollision_incompatible
      (T := tn) (U := un) (V := vn) (B := bn)
  · simpa [tn, vn, hN0] using (map_dist_eq hQP_QT).symm.trans (map_dist_eq hQP_QV)
  · simpa [tn, bn, hN0] using (map_dist_eq hQP_QT).symm.trans (map_dist_eq hQP_QB)
  · simpa [tn, hN0, hN1] using map_dist_eq hAT_AQ
  · simpa [tn, vn, bn] using map_dist_eq hVT_VB
  · simpa [tn, vn, un] using map_dist_eq hVT_VU
  · simpa [bn, hN0, hN1] using map_dist_eq hBQ_BA
  · simpa [bn, un, hN0] using map_dist_eq hBQ_BU
  · simpa [un, hN0, hN1] using map_dist_eq hUQ_UA
  · simpa [un, vn, hN0] using map_dist_eq hUQ_UV

/-- Equality-closure form of the seven-point equilateral-median interlock collision. -/
structure SevenPointEquilateralMedianInterlockCollisionCore {alpha : Type*}
    (P : RowPattern alpha) where
  p : alpha
  q : alpha
  t : alpha
  u : alpha
  v : alpha
  a : alpha
  b : alpha
  h_pq : p ≠ q
  tp_tq : EdgeClosure P (t, p) (t, q)
  qp_qt : EdgeClosure P (q, p) (q, t)
  qp_qv : EdgeClosure P (q, p) (q, v)
  qp_qb : EdgeClosure P (q, p) (q, b)
  at_aq : EdgeClosure P (a, t) (a, q)
  vt_vb : EdgeClosure P (v, t) (v, b)
  vt_vu : EdgeClosure P (v, t) (v, u)
  bq_ba : EdgeClosure P (b, q) (b, a)
  bq_bu : EdgeClosure P (b, q) (b, u)
  uq_ua : EdgeClosure P (u, q) (u, a)
  uq_uv : EdgeClosure P (u, q) (u, v)

/-- A seven-point equilateral-median interlock core has no injective planar realization. -/
theorem not_realizes_of_sevenPointEquilateralMedianInterlockCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : SevenPointEquilateralMedianInterlockCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  have hpq : pointOf core.p = pointOf core.q :=
    seven_point_equilateral_median_interlock_collision
      (by simpa [edgeDist] using sound core.tp_tq)
      (by simpa [edgeDist] using sound core.qp_qt)
      (by simpa [edgeDist] using sound core.qp_qv)
      (by simpa [edgeDist] using sound core.qp_qb)
      (by simpa [edgeDist] using sound core.at_aq)
      (by simpa [edgeDist] using sound core.vt_vb)
      (by simpa [edgeDist] using sound core.vt_vu)
      (by simpa [edgeDist] using sound core.bq_ba)
      (by simpa [edgeDist] using sound core.bq_bu)
      (by simpa [edgeDist] using sound core.uq_ua)
      (by simpa [edgeDist] using sound core.uq_uv)
  exact core.h_pq (hreal.injective hpq)

end EqualityCore
end Census554
end Problem97
