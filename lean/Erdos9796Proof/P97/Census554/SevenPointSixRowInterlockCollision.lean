/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Seven-point six-row interlock collision core

This file proves that a particular eleven-relation distance-equality system on seven
arbitrary labels is inconsistent when its two anchor labels are distinct. It also packages
the system as an equality-closure core for finite row patterns.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem sevenPointSixRowInterlockCollision_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 :=
  Problem97.dist_sq_coord x y

set_option maxHeartbeats 12000000 in
-- The kernel-checked Groebner certificate eliminates all eleven equations together.
/-- The normalized eleven-relation distance system is inconsistent. -/
private theorem normalized_sevenPointSixRowInterlockCollision_incompatible
    {T U V A B : ℝ²}
    (hPQ_PU : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) U)
    (hQP_QT : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) T)
    (hQP_QB : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) B)
    (hTP_TQ : dist T (pt 0 0) = dist T (pt 1 0))
    (hUP_UT : dist U (pt 0 0) = dist U T)
    (hUP_UV : dist U (pt 0 0) = dist U V)
    (hUP_UA : dist U (pt 0 0) = dist U A)
    (hVQ_VA : dist V (pt 1 0) = dist V A)
    (hVQ_VB : dist V (pt 1 0) = dist V B)
    (hAP_AV : dist A (pt 0 0) = dist A V)
    (hAP_AB : dist A (pt 0 0) = dist A B) : False := by
  have hPQ_PU_sq := congrArg (fun r : ℝ ↦ r ^ 2) hPQ_PU
  have hQP_QT_sq := congrArg (fun r : ℝ ↦ r ^ 2) hQP_QT
  have hQP_QB_sq := congrArg (fun r : ℝ ↦ r ^ 2) hQP_QB
  have hTP_TQ_sq := congrArg (fun r : ℝ ↦ r ^ 2) hTP_TQ
  have hUP_UT_sq := congrArg (fun r : ℝ ↦ r ^ 2) hUP_UT
  have hUP_UV_sq := congrArg (fun r : ℝ ↦ r ^ 2) hUP_UV
  have hUP_UA_sq := congrArg (fun r : ℝ ↦ r ^ 2) hUP_UA
  have hVQ_VA_sq := congrArg (fun r : ℝ ↦ r ^ 2) hVQ_VA
  have hVQ_VB_sq := congrArg (fun r : ℝ ↦ r ^ 2) hVQ_VB
  have hAP_AV_sq := congrArg (fun r : ℝ ↦ r ^ 2) hAP_AV
  have hAP_AB_sq := congrArg (fun r : ℝ ↦ r ^ 2) hAP_AB
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) U ^ 2 at hPQ_PU_sq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) T ^ 2 at hQP_QT_sq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) B ^ 2 at hQP_QB_sq
  change dist T (pt 0 0) ^ 2 = dist T (pt 1 0) ^ 2 at hTP_TQ_sq
  change dist U (pt 0 0) ^ 2 = dist U T ^ 2 at hUP_UT_sq
  change dist U (pt 0 0) ^ 2 = dist U V ^ 2 at hUP_UV_sq
  change dist U (pt 0 0) ^ 2 = dist U A ^ 2 at hUP_UA_sq
  change dist V (pt 1 0) ^ 2 = dist V A ^ 2 at hVQ_VA_sq
  change dist V (pt 1 0) ^ 2 = dist V B ^ 2 at hVQ_VB_sq
  change dist A (pt 0 0) ^ 2 = dist A V ^ 2 at hAP_AV_sq
  change dist A (pt 0 0) ^ 2 = dist A B ^ 2 at hAP_AB_sq
  rw [sevenPointSixRowInterlockCollision_dist_sq_coord,
    sevenPointSixRowInterlockCollision_dist_sq_coord]
    at hPQ_PU_sq hQP_QT_sq hQP_QB_sq hTP_TQ_sq hUP_UT_sq hUP_UV_sq hUP_UA_sq
      hVQ_VA_sq hVQ_VB_sq hAP_AV_sq hAP_AB_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hPQ_PU_sq hQP_QT_sq hQP_QB_sq hTP_TQ_sq hUP_UT_sq hUP_UV_sq hUP_UA_sq
      hVQ_VA_sq hVQ_VB_sq hAP_AV_sq hAP_AB_sq
  grobner (ringSteps := 100000)

/-- The eleven distance relations are inconsistent when the two anchors are distinct. -/
theorem seven_point_six_row_interlock_collision
    {p q t u v a b : ℝ²}
    (h_pq : p ≠ q)
    (hPQ_PU : dist p q = dist p u)
    (hQP_QT : dist q p = dist q t)
    (hQP_QB : dist q p = dist q b)
    (hTP_TQ : dist t p = dist t q)
    (hUP_UT : dist u p = dist u t)
    (hUP_UV : dist u p = dist u v)
    (hUP_UA : dist u p = dist u a)
    (hVQ_VA : dist v q = dist v a)
    (hVQ_VB : dist v q = dist v b)
    (hAP_AV : dist a p = dist a v)
    (hAP_AB : dist a p = dist a b) : False := by
  let N : ℝ² → ℝ² := normSim p q
  let tn := N t
  let un := N u
  let vn := N v
  let an := N a
  let bn := N b
  have hdist (X Y : ℝ²) :
      dist (N X) (N Y) = (dist p q)⁻¹ * dist X Y := by
    simpa [N] using normSim_dist_image p q h_pq X Y
  have hN0 : N p = pt 0 0 := by
    simpa [N] using normSim_fst p q
  have hN1 : N q = pt 1 0 := by
    simpa [N] using normSim_snd p q h_pq
  have map_dist_eq {X Y Z R : ℝ²} (h : dist X Y = dist Z R) :
      dist (N X) (N Y) = dist (N Z) (N R) := by
    rw [hdist, hdist, h]
  apply normalized_sevenPointSixRowInterlockCollision_incompatible
      (T := tn) (U := un) (V := vn) (A := an) (B := bn)
  · simpa [un, hN0, hN1] using map_dist_eq hPQ_PU
  · simpa [tn, hN0, hN1] using map_dist_eq hQP_QT
  · simpa [bn, hN0, hN1] using map_dist_eq hQP_QB
  · simpa [tn, hN0, hN1] using map_dist_eq hTP_TQ
  · simpa [tn, un, hN0] using map_dist_eq hUP_UT
  · simpa [un, vn, hN0] using map_dist_eq hUP_UV
  · simpa [an, un, hN0] using map_dist_eq hUP_UA
  · simpa [an, vn, hN1] using map_dist_eq hVQ_VA
  · simpa [bn, vn, hN1] using map_dist_eq hVQ_VB
  · simpa [an, vn, hN0] using map_dist_eq hAP_AV
  · simpa [an, bn, hN0] using map_dist_eq hAP_AB

/-- Equality-closure form of the seven-point six-row interlock collision. -/
structure SevenPointSixRowInterlockCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  p : alpha
  q : alpha
  t : alpha
  u : alpha
  v : alpha
  a : alpha
  b : alpha
  h_pq : p ≠ q
  pq_pu : EdgeClosure P (p, q) (p, u)
  qp_qt : EdgeClosure P (q, p) (q, t)
  qp_qb : EdgeClosure P (q, p) (q, b)
  tp_tq : EdgeClosure P (t, p) (t, q)
  up_ut : EdgeClosure P (u, p) (u, t)
  up_uv : EdgeClosure P (u, p) (u, v)
  up_ua : EdgeClosure P (u, p) (u, a)
  vq_va : EdgeClosure P (v, q) (v, a)
  vq_vb : EdgeClosure P (v, q) (v, b)
  ap_av : EdgeClosure P (a, p) (a, v)
  ap_ab : EdgeClosure P (a, p) (a, b)

/-- A seven-point six-row interlock collision core has no injective planar realization. -/
theorem not_realizes_of_sevenPointSixRowInterlockCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : SevenPointSixRowInterlockCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  exact seven_point_six_row_interlock_collision
    (fun hcollision ↦ core.h_pq (hreal.injective hcollision))
    (by simpa [edgeDist] using sound core.pq_pu)
    (by simpa [edgeDist] using sound core.qp_qt)
    (by simpa [edgeDist] using sound core.qp_qb)
    (by simpa [edgeDist] using sound core.tp_tq)
    (by simpa [edgeDist] using sound core.up_ut)
    (by simpa [edgeDist] using sound core.up_uv)
    (by simpa [edgeDist] using sound core.up_ua)
    (by simpa [edgeDist] using sound core.vq_va)
    (by simpa [edgeDist] using sound core.vq_vb)
    (by simpa [edgeDist] using sound core.ap_av)
    (by simpa [edgeDist] using sound core.ap_ab)

end EqualityCore
end Census554
end Problem97
