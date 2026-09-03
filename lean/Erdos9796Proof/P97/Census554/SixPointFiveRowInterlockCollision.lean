/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Six-point five-row interlock collision core

This file proves that a particular nine-relation distance-equality system on six
arbitrary labels forces its two anchor labels to coincide. It also packages the system
as an equality-closure core for finite row patterns.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem sixPointFiveRowInterlockCollision_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 :=
  Problem97.dist_sq_coord x y

set_option maxHeartbeats 12000000 in
-- The kernel-checked Groebner certificate eliminates all nine equations together.
/-- The normalized nine-relation distance system is inconsistent. -/
private theorem normalized_sixPointFiveRowInterlockCollision_incompatible
    {T U V A : ℝ²}
    (hQP_QT : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) T)
    (hTP_TQ : dist T (pt 0 0) = dist T (pt 1 0))
    (hTP_TV : dist T (pt 0 0) = dist T V)
    (hTP_TA : dist T (pt 0 0) = dist T A)
    (hUQ_UT : dist U (pt 1 0) = dist U T)
    (hUQ_UV : dist U (pt 1 0) = dist U V)
    (hVQ_VU : dist V (pt 1 0) = dist V U)
    (hVQ_VA : dist V (pt 1 0) = dist V A)
    (hAT_AU : dist A T = dist A U) : False := by
  have hQP_QT_sq := congrArg (fun r : ℝ ↦ r ^ 2) hQP_QT
  have hTP_TQ_sq := congrArg (fun r : ℝ ↦ r ^ 2) hTP_TQ
  have hTP_TV_sq := congrArg (fun r : ℝ ↦ r ^ 2) hTP_TV
  have hTP_TA_sq := congrArg (fun r : ℝ ↦ r ^ 2) hTP_TA
  have hUQ_UT_sq := congrArg (fun r : ℝ ↦ r ^ 2) hUQ_UT
  have hUQ_UV_sq := congrArg (fun r : ℝ ↦ r ^ 2) hUQ_UV
  have hVQ_VU_sq := congrArg (fun r : ℝ ↦ r ^ 2) hVQ_VU
  have hVQ_VA_sq := congrArg (fun r : ℝ ↦ r ^ 2) hVQ_VA
  have hAT_AU_sq := congrArg (fun r : ℝ ↦ r ^ 2) hAT_AU
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) T ^ 2 at hQP_QT_sq
  change dist T (pt 0 0) ^ 2 = dist T (pt 1 0) ^ 2 at hTP_TQ_sq
  change dist T (pt 0 0) ^ 2 = dist T V ^ 2 at hTP_TV_sq
  change dist T (pt 0 0) ^ 2 = dist T A ^ 2 at hTP_TA_sq
  change dist U (pt 1 0) ^ 2 = dist U T ^ 2 at hUQ_UT_sq
  change dist U (pt 1 0) ^ 2 = dist U V ^ 2 at hUQ_UV_sq
  change dist V (pt 1 0) ^ 2 = dist V U ^ 2 at hVQ_VU_sq
  change dist V (pt 1 0) ^ 2 = dist V A ^ 2 at hVQ_VA_sq
  change dist A T ^ 2 = dist A U ^ 2 at hAT_AU_sq
  rw [sixPointFiveRowInterlockCollision_dist_sq_coord,
    sixPointFiveRowInterlockCollision_dist_sq_coord]
    at hQP_QT_sq hTP_TQ_sq hTP_TV_sq hTP_TA_sq hUQ_UT_sq hUQ_UV_sq hVQ_VU_sq
      hVQ_VA_sq hAT_AU_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hQP_QT_sq hTP_TQ_sq hTP_TV_sq hTP_TA_sq hUQ_UT_sq hUQ_UV_sq hVQ_VU_sq
      hVQ_VA_sq hAT_AU_sq
  grobner (ringSteps := 100000)

/-- The nine distance relations force the two anchor points to coincide. -/
theorem six_point_five_row_interlock_collision
    {p q t u v a : ℝ²}
    (hQP_QT : dist q p = dist q t)
    (hTP_TQ : dist t p = dist t q)
    (hTP_TV : dist t p = dist t v)
    (hTP_TA : dist t p = dist t a)
    (hUQ_UT : dist u q = dist u t)
    (hUQ_UV : dist u q = dist u v)
    (hVQ_VU : dist v q = dist v u)
    (hVQ_VA : dist v q = dist v a)
    (hAT_AU : dist a t = dist a u) : p = q := by
  by_contra hpq
  let N : ℝ² → ℝ² := normSim p q
  let tn := N t
  let un := N u
  let vn := N v
  let an := N a
  have hdist (X Y : ℝ²) :
      dist (N X) (N Y) = (dist p q)⁻¹ * dist X Y := by
    simpa [N] using normSim_dist_image p q hpq X Y
  have hN0 : N p = pt 0 0 := by
    simpa [N] using normSim_fst p q
  have hN1 : N q = pt 1 0 := by
    simpa [N] using normSim_snd p q hpq
  have map_dist_eq {X Y Z R : ℝ²} (h : dist X Y = dist Z R) :
      dist (N X) (N Y) = dist (N Z) (N R) := by
    rw [hdist, hdist, h]
  apply normalized_sixPointFiveRowInterlockCollision_incompatible
      (T := tn) (U := un) (V := vn) (A := an)
  · simpa [tn, hN0, hN1] using map_dist_eq hQP_QT
  · simpa [tn, hN0, hN1] using map_dist_eq hTP_TQ
  · simpa [tn, vn, hN0] using map_dist_eq hTP_TV
  · simpa [an, tn, hN0] using map_dist_eq hTP_TA
  · simpa [tn, un, hN1] using map_dist_eq hUQ_UT
  · simpa [un, vn, hN1] using map_dist_eq hUQ_UV
  · simpa [un, vn, hN1] using map_dist_eq hVQ_VU
  · simpa [an, vn, hN1] using map_dist_eq hVQ_VA
  · simpa [an, tn, un] using map_dist_eq hAT_AU

/-- Equality-closure form of the six-point five-row interlock collision. -/
structure SixPointFiveRowInterlockCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  p : alpha
  q : alpha
  t : alpha
  u : alpha
  v : alpha
  a : alpha
  h_pq : p ≠ q
  qp_qt : EdgeClosure P (q, p) (q, t)
  tp_tq : EdgeClosure P (t, p) (t, q)
  tp_tv : EdgeClosure P (t, p) (t, v)
  tp_ta : EdgeClosure P (t, p) (t, a)
  uq_ut : EdgeClosure P (u, q) (u, t)
  uq_uv : EdgeClosure P (u, q) (u, v)
  vq_vu : EdgeClosure P (v, q) (v, u)
  vq_va : EdgeClosure P (v, q) (v, a)
  at_au : EdgeClosure P (a, t) (a, u)

/-- A six-point five-row interlock collision core has no injective planar realization. -/
theorem not_realizes_of_sixPointFiveRowInterlockCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : SixPointFiveRowInterlockCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  have hcollision := six_point_five_row_interlock_collision
    (by simpa [edgeDist] using sound core.qp_qt)
    (by simpa [edgeDist] using sound core.tp_tq)
    (by simpa [edgeDist] using sound core.tp_tv)
    (by simpa [edgeDist] using sound core.tp_ta)
    (by simpa [edgeDist] using sound core.uq_ut)
    (by simpa [edgeDist] using sound core.uq_uv)
    (by simpa [edgeDist] using sound core.vq_vu)
    (by simpa [edgeDist] using sound core.vq_va)
    (by simpa [edgeDist] using sound core.at_au)
  exact core.h_pq (hreal.injective hcollision)

end EqualityCore
end Census554
end Problem97
