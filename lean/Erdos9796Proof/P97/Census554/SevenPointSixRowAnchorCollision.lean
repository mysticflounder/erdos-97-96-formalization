/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Seven-point six-row anchor collision core

This file proves that a particular eleven-relation distance-equality system on seven
arbitrary labels forces its two anchor labels to coincide. It also packages the system
as an equality-closure core for finite row patterns.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem sevenPointSixRowAnchorCollision_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 :=
  Problem97.dist_sq_coord x y

set_option maxHeartbeats 12000000 in
-- The kernel-checked Groebner certificate eliminates all eleven equations together.
/-- The normalized eleven-relation distance system is inconsistent. -/
private theorem normalized_sevenPointSixRowAnchorCollision_incompatible
    {T U V A B : ℝ²}
    (hPU_PQ : dist (pt 0 0) U = dist (pt 0 0) (pt 1 0))
    (hPV_PQ : dist (pt 0 0) V = dist (pt 0 0) (pt 1 0))
    (hPA_PQ : dist (pt 0 0) A = dist (pt 0 0) (pt 1 0))
    (hQT_QP : dist (pt 1 0) T = dist (pt 1 0) (pt 0 0))
    (hQA_QP : dist (pt 1 0) A = dist (pt 1 0) (pt 0 0))
    (hQB_QP : dist (pt 1 0) B = dist (pt 1 0) (pt 0 0))
    (hTQ_TP : dist T (pt 1 0) = dist T (pt 0 0))
    (hUT_UP : dist U T = dist U (pt 0 0))
    (hUV_UP : dist U V = dist U (pt 0 0))
    (hVB_VQ : dist V B = dist V (pt 1 0))
    (hBA_BP : dist B A = dist B (pt 0 0)) : False := by
  have hPU_PQ_sq := congrArg (fun r : ℝ ↦ r ^ 2) hPU_PQ
  have hPV_PQ_sq := congrArg (fun r : ℝ ↦ r ^ 2) hPV_PQ
  have hPA_PQ_sq := congrArg (fun r : ℝ ↦ r ^ 2) hPA_PQ
  have hQT_QP_sq := congrArg (fun r : ℝ ↦ r ^ 2) hQT_QP
  have hQA_QP_sq := congrArg (fun r : ℝ ↦ r ^ 2) hQA_QP
  have hQB_QP_sq := congrArg (fun r : ℝ ↦ r ^ 2) hQB_QP
  have hTQ_TP_sq := congrArg (fun r : ℝ ↦ r ^ 2) hTQ_TP
  have hUT_UP_sq := congrArg (fun r : ℝ ↦ r ^ 2) hUT_UP
  have hUV_UP_sq := congrArg (fun r : ℝ ↦ r ^ 2) hUV_UP
  have hVB_VQ_sq := congrArg (fun r : ℝ ↦ r ^ 2) hVB_VQ
  have hBA_BP_sq := congrArg (fun r : ℝ ↦ r ^ 2) hBA_BP
  change dist (pt 0 0) U ^ 2 = dist (pt 0 0) (pt 1 0) ^ 2 at hPU_PQ_sq
  change dist (pt 0 0) V ^ 2 = dist (pt 0 0) (pt 1 0) ^ 2 at hPV_PQ_sq
  change dist (pt 0 0) A ^ 2 = dist (pt 0 0) (pt 1 0) ^ 2 at hPA_PQ_sq
  change dist (pt 1 0) T ^ 2 = dist (pt 1 0) (pt 0 0) ^ 2 at hQT_QP_sq
  change dist (pt 1 0) A ^ 2 = dist (pt 1 0) (pt 0 0) ^ 2 at hQA_QP_sq
  change dist (pt 1 0) B ^ 2 = dist (pt 1 0) (pt 0 0) ^ 2 at hQB_QP_sq
  change dist T (pt 1 0) ^ 2 = dist T (pt 0 0) ^ 2 at hTQ_TP_sq
  change dist U T ^ 2 = dist U (pt 0 0) ^ 2 at hUT_UP_sq
  change dist U V ^ 2 = dist U (pt 0 0) ^ 2 at hUV_UP_sq
  change dist V B ^ 2 = dist V (pt 1 0) ^ 2 at hVB_VQ_sq
  change dist B A ^ 2 = dist B (pt 0 0) ^ 2 at hBA_BP_sq
  rw [sevenPointSixRowAnchorCollision_dist_sq_coord,
    sevenPointSixRowAnchorCollision_dist_sq_coord]
    at hPU_PQ_sq hPV_PQ_sq hPA_PQ_sq hQT_QP_sq hQA_QP_sq hQB_QP_sq hTQ_TP_sq
      hUT_UP_sq hUV_UP_sq hVB_VQ_sq hBA_BP_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hPU_PQ_sq hPV_PQ_sq hPA_PQ_sq hQT_QP_sq hQA_QP_sq hQB_QP_sq hTQ_TP_sq
      hUT_UP_sq hUV_UP_sq hVB_VQ_sq hBA_BP_sq
  grobner (ringSteps := 100000)

/-- The eleven distance relations force the two anchor points to coincide. -/
theorem seven_point_six_row_anchor_collision
    {p q t u v a b : ℝ²}
    (hPU_PQ : dist p u = dist p q)
    (hPV_PQ : dist p v = dist p q)
    (hPA_PQ : dist p a = dist p q)
    (hQT_QP : dist q t = dist q p)
    (hQA_QP : dist q a = dist q p)
    (hQB_QP : dist q b = dist q p)
    (hTQ_TP : dist t q = dist t p)
    (hUT_UP : dist u t = dist u p)
    (hUV_UP : dist u v = dist u p)
    (hVB_VQ : dist v b = dist v q)
    (hBA_BP : dist b a = dist b p) : p = q := by
  by_contra hpq
  let N : ℝ² → ℝ² := normSim p q
  let tn := N t
  let un := N u
  let vn := N v
  let an := N a
  let bn := N b
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
  apply normalized_sevenPointSixRowAnchorCollision_incompatible
      (T := tn) (U := un) (V := vn) (A := an) (B := bn)
  · simpa [un, hN0, hN1] using map_dist_eq hPU_PQ
  · simpa [vn, hN0, hN1] using map_dist_eq hPV_PQ
  · simpa [an, hN0, hN1] using map_dist_eq hPA_PQ
  · simpa [tn, hN0, hN1] using map_dist_eq hQT_QP
  · simpa [an, hN0, hN1] using map_dist_eq hQA_QP
  · simpa [bn, hN0, hN1] using map_dist_eq hQB_QP
  · simpa [tn, hN0, hN1] using map_dist_eq hTQ_TP
  · simpa [tn, un, hN0] using map_dist_eq hUT_UP
  · simpa [un, vn, hN0] using map_dist_eq hUV_UP
  · simpa [vn, bn, hN1] using map_dist_eq hVB_VQ
  · simpa [an, bn, hN0] using map_dist_eq hBA_BP

/-- Equality-closure form of the seven-point six-row anchor collision. -/
structure SevenPointSixRowAnchorCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  p : alpha
  q : alpha
  t : alpha
  u : alpha
  v : alpha
  a : alpha
  b : alpha
  h_pq : p ≠ q
  pu_pq : EdgeClosure P (p, u) (p, q)
  pv_pq : EdgeClosure P (p, v) (p, q)
  pa_pq : EdgeClosure P (p, a) (p, q)
  qt_qp : EdgeClosure P (q, t) (q, p)
  qa_qp : EdgeClosure P (q, a) (q, p)
  qb_qp : EdgeClosure P (q, b) (q, p)
  tq_tp : EdgeClosure P (t, q) (t, p)
  ut_up : EdgeClosure P (u, t) (u, p)
  uv_up : EdgeClosure P (u, v) (u, p)
  vb_vq : EdgeClosure P (v, b) (v, q)
  ba_bp : EdgeClosure P (b, a) (b, p)

/-- A seven-point six-row anchor collision core has no injective planar realization. -/
theorem not_realizes_of_sevenPointSixRowAnchorCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : SevenPointSixRowAnchorCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  have hcollision := seven_point_six_row_anchor_collision
    (by simpa [edgeDist] using sound core.pu_pq)
    (by simpa [edgeDist] using sound core.pv_pq)
    (by simpa [edgeDist] using sound core.pa_pq)
    (by simpa [edgeDist] using sound core.qt_qp)
    (by simpa [edgeDist] using sound core.qa_qp)
    (by simpa [edgeDist] using sound core.qb_qp)
    (by simpa [edgeDist] using sound core.tq_tp)
    (by simpa [edgeDist] using sound core.ut_up)
    (by simpa [edgeDist] using sound core.uv_up)
    (by simpa [edgeDist] using sound core.vb_vq)
    (by simpa [edgeDist] using sound core.ba_bp)
  exact core.h_pq (hreal.injective hcollision)

end EqualityCore
end Census554
end Problem97
