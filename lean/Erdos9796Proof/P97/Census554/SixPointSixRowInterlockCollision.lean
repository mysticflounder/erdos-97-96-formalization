/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Six-point six-row interlock collision core

This file proves that a particular nine-relation distance-equality system on six
arbitrary labels is inconsistent when its two anchor labels are distinct. It also packages
the system as an equality-closure core for finite row patterns.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem sixPointSixRowInterlockCollision_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 :=
  Problem97.dist_sq_coord x y

/-- The determinant of the Gram matrix of three vectors in `ℝ²` vanishes. -/
private theorem sixPointSixRowInterlockCollision_gram₃
    (x0 x1 y0 y1 z0 z1 : ℝ) :
    (x0 ^ 2 + x1 ^ 2) * (y0 ^ 2 + y1 ^ 2) * (z0 ^ 2 + z1 ^ 2) +
        2 * (x0 * y0 + x1 * y1) * (y0 * z0 + y1 * z1) *
          (z0 * x0 + z1 * x1) -
        (x0 ^ 2 + x1 ^ 2) * (y0 * z0 + y1 * z1) ^ 2 -
        (y0 ^ 2 + y1 ^ 2) * (z0 * x0 + z1 * x1) ^ 2 -
        (z0 ^ 2 + z1 ^ 2) * (x0 * y0 + x1 * y1) ^ 2 = 0 := by
  ring

/-- The two scalar invariants produced by the Gram identities are incompatible. -/
private theorem sixPointSixRowInterlockCollision_scalar_incompatible
    {X S : ℝ}
    (hchain : 2 * X ^ 2 + X - 1 = 0)
    (hbasis : S ^ 2 - 4 * S + 1 = 0)
    (hlink : S = 2 - 2 * X) : False := by
  rw [hlink] at hbasis
  have hbasis' : 4 * X ^ 2 - 3 = 0 := by
    linear_combination hbasis
  have hx : 2 * X + 1 = 0 := by
    linear_combination 2 * hchain - hbasis'
  have hone : (1 : ℝ) = 0 := by
    linear_combination -hchain + X * hx
  norm_num at hone

-- The coordinate proof uses only three low-degree Gram identities and exact combinations.
/-- The normalized nine-relation distance system is inconsistent. -/
private theorem normalized_sixPointSixRowInterlockCollision_incompatible
    {T U A B : ℝ²}
    (hQP_QA : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) A)
    (hQP_QT : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) T)
    (hPQ_PU : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) U)
    (hUQ_UP : dist U (pt 0 0) = dist U (pt 1 0))
    (hAQ_AU : dist A (pt 0 0) = dist A U)
    (hAQ_AT : dist A (pt 0 0) = dist A T)
    (hAQ_AB : dist A (pt 0 0) = dist A B)
    (hTP_TB : dist T (pt 1 0) = dist T B)
    (hBQ_BT : dist B (pt 0 0) = dist B T) : False := by
  have hQP_QA_sq := congrArg (fun r : ℝ ↦ r ^ 2) hQP_QA
  have hQP_QT_sq := congrArg (fun r : ℝ ↦ r ^ 2) hQP_QT
  have hPQ_PU_sq := congrArg (fun r : ℝ ↦ r ^ 2) hPQ_PU
  have hUQ_UP_sq := congrArg (fun r : ℝ ↦ r ^ 2) hUQ_UP
  have hAQ_AU_sq := congrArg (fun r : ℝ ↦ r ^ 2) hAQ_AU
  have hAQ_AT_sq := congrArg (fun r : ℝ ↦ r ^ 2) hAQ_AT
  have hAQ_AB_sq := congrArg (fun r : ℝ ↦ r ^ 2) hAQ_AB
  have hTP_TB_sq := congrArg (fun r : ℝ ↦ r ^ 2) hTP_TB
  have hBQ_BT_sq := congrArg (fun r : ℝ ↦ r ^ 2) hBQ_BT
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) A ^ 2 at hQP_QA_sq
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) T ^ 2 at hQP_QT_sq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) U ^ 2 at hPQ_PU_sq
  change dist U (pt 0 0) ^ 2 = dist U (pt 1 0) ^ 2 at hUQ_UP_sq
  change dist A (pt 0 0) ^ 2 = dist A U ^ 2 at hAQ_AU_sq
  change dist A (pt 0 0) ^ 2 = dist A T ^ 2 at hAQ_AT_sq
  change dist A (pt 0 0) ^ 2 = dist A B ^ 2 at hAQ_AB_sq
  change dist T (pt 1 0) ^ 2 = dist T B ^ 2 at hTP_TB_sq
  change dist B (pt 0 0) ^ 2 = dist B T ^ 2 at hBQ_BT_sq
  rw [sixPointSixRowInterlockCollision_dist_sq_coord,
    sixPointSixRowInterlockCollision_dist_sq_coord]
    at hQP_QA_sq hQP_QT_sq hPQ_PU_sq hUQ_UP_sq hAQ_AU_sq hAQ_AT_sq hAQ_AB_sq
      hTP_TB_sq hBQ_BT_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hQP_QA_sq hQP_QT_sq hPQ_PU_sq hUQ_UP_sq hAQ_AU_sq hAQ_AT_sq hAQ_AB_sq
      hTP_TB_sq hBQ_BT_sq
  set u0 := U 0
  set u1 := U 1
  set a0 := A 0
  set a1 := A 1
  set t0 := T 0
  set t1 := T 1
  set b0 := B 0
  set b1 := B 1
  set S := b0 ^ 2 + b1 ^ 2
  have hu0 : 2 * u0 = 1 := by
    dsimp only [u0]
    linear_combination hUQ_UP_sq
  have hu : u0 ^ 2 + u1 ^ 2 = 1 := by
    dsimp only [u0, u1]
    linear_combination -hPQ_PU_sq + hu0
  have ha : a0 ^ 2 + a1 ^ 2 = 1 := by
    dsimp only [a0, a1]
    linear_combination -hQP_QA_sq
  have ht : t0 ^ 2 + t1 ^ 2 = 1 := by
    dsimp only [t0, t1]
    linear_combination -hQP_QT_sq
  have hua : 2 * (u0 * a0 + u1 * a1) = 1 := by
    dsimp only [u0, u1, a0, a1]
    linear_combination hAQ_AU_sq + hu
  have hat : 2 * (a0 * t0 + a1 * t1) = 1 := by
    dsimp only [a0, a1, t0, t1]
    linear_combination hAQ_AT_sq + ht
  have hba : 2 * (b0 * a0 + b1 * a1) = S := by
    dsimp only [a0, a1, b0, b1, S]
    linear_combination hAQ_AB_sq
  have htb : 2 * (t0 * b0 + t1 * b1) = 1 := by
    dsimp only [t0, t1, b0, b1]
    linear_combination hBQ_BT_sq + ht
  have hlink : S = 2 - 2 * t0 := by
    dsimp only [t0, b0, b1, S]
    linear_combination hBQ_BT_sq - hTP_TB_sq + ht
  have hu0' : u0 = 1 / 2 := by
    linarith only [hu0]
  have hua' : u0 * a0 + u1 * a1 = 1 / 2 := by
    linarith only [hua]
  have hat' : a0 * t0 + a1 * t1 = 1 / 2 := by
    linarith only [hat]
  have hba' : b0 * a0 + b1 * a1 = S / 2 := by
    linarith only [hba]
  have htb' : t0 * b0 + t1 * b1 = 1 / 2 := by
    linarith only [htb]
  have gEUA := sixPointSixRowInterlockCollision_gram₃ 1 0 u0 u1 a0 a1
  norm_num at gEUA
  rw [hu, ha, hua', hu0'] at gEUA
  have hA : (a0 - 1) * (2 * a0 + 1) = 0 := by
    linear_combination -2 * gEUA
  have gEAT := sixPointSixRowInterlockCollision_gram₃ 1 0 a0 a1 t0 t1
  norm_num at gEAT
  rw [ha, ht, hat'] at gEAT
  have hAT : 4 * t0 ^ 2 - 4 * a0 * t0 + 4 * a0 ^ 2 - 3 = 0 := by
    linear_combination -4 * gEAT
  have hchain : 2 * t0 ^ 2 + t0 - 1 = 0 := by
    rcases mul_eq_zero.mp hA with ha0 | ha0
    · have hsquare : (2 * t0 - 1) * (2 * t0 - 1) = 0 := by
        linear_combination hAT - 4 * (a0 - t0 + 1) * ha0
      rcases mul_eq_zero.mp hsquare with ht0 | ht0
      · linear_combination (t0 + 1) * ht0
      · linear_combination (t0 + 1) * ht0
    · linear_combination (1 / 2 : ℝ) * hAT -
        ((2 * a0 - 2 * t0 - 1) / 2) * ha0
  have hS : b0 ^ 2 + b1 ^ 2 = S := rfl
  have gATB := sixPointSixRowInterlockCollision_gram₃ a0 a1 t0 t1 b0 b1
  rw [ha, ht, hS, hat', htb', hba'] at gATB
  have hbasis : S ^ 2 - 4 * S + 1 = 0 := by
    linear_combination -4 * gATB
  exact sixPointSixRowInterlockCollision_scalar_incompatible hchain hbasis hlink

/-- The nine distance relations are inconsistent when the two anchors are distinct. -/
theorem six_point_six_row_interlock_collision
    {p q t u a b : ℝ²}
    (h_pq : p ≠ q)
    (hQP_QA : dist q p = dist q a)
    (hQP_QT : dist q p = dist q t)
    (hPQ_PU : dist p q = dist p u)
    (hUQ_UP : dist u q = dist u p)
    (hAQ_AU : dist a q = dist a u)
    (hAQ_AT : dist a q = dist a t)
    (hAQ_AB : dist a q = dist a b)
    (hTP_TB : dist t p = dist t b)
    (hBQ_BT : dist b q = dist b t) : False := by
  have h_qp : q ≠ p := by
    intro h
    exact h_pq h.symm
  let N : ℝ² → ℝ² := normSim q p
  let tn := N t
  let un := N u
  let an := N a
  let bn := N b
  have hdist (X Y : ℝ²) :
      dist (N X) (N Y) = (dist q p)⁻¹ * dist X Y := by
    simpa [N] using normSim_dist_image q p h_qp X Y
  have hN0 : N q = pt 0 0 := by
    simpa [N] using normSim_fst q p
  have hN1 : N p = pt 1 0 := by
    simpa [N] using normSim_snd q p h_qp
  have map_dist_eq {X Y Z R : ℝ²} (h : dist X Y = dist Z R) :
      dist (N X) (N Y) = dist (N Z) (N R) := by
    rw [hdist, hdist, h]
  apply normalized_sixPointSixRowInterlockCollision_incompatible
      (T := tn) (U := un) (A := an) (B := bn)
  · simpa [an, hN0, hN1] using map_dist_eq hQP_QA
  · simpa [tn, hN0, hN1] using map_dist_eq hQP_QT
  · simpa [un, hN0, hN1] using map_dist_eq hPQ_PU
  · simpa [un, hN0, hN1] using map_dist_eq hUQ_UP
  · simpa [an, un, hN0] using map_dist_eq hAQ_AU
  · simpa [an, tn, hN0] using map_dist_eq hAQ_AT
  · simpa [an, bn, hN0] using map_dist_eq hAQ_AB
  · simpa [bn, tn, hN1] using map_dist_eq hTP_TB
  · simpa [bn, tn, hN0] using map_dist_eq hBQ_BT

/-- Equality-closure form of the six-point six-row interlock collision. -/
structure SixPointSixRowInterlockCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  p : alpha
  q : alpha
  t : alpha
  u : alpha
  a : alpha
  b : alpha
  h_pq : p ≠ q
  qp_qa : EdgeClosure P (q, p) (q, a)
  qp_qt : EdgeClosure P (q, p) (q, t)
  pq_pu : EdgeClosure P (p, q) (p, u)
  uq_up : EdgeClosure P (u, q) (u, p)
  aq_au : EdgeClosure P (a, q) (a, u)
  aq_at : EdgeClosure P (a, q) (a, t)
  aq_ab : EdgeClosure P (a, q) (a, b)
  tp_tb : EdgeClosure P (t, p) (t, b)
  bq_bt : EdgeClosure P (b, q) (b, t)

/-- A six-point six-row interlock collision core has no injective planar realization. -/
theorem not_realizes_of_sixPointSixRowInterlockCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : SixPointSixRowInterlockCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  exact six_point_six_row_interlock_collision
    (fun hcollision ↦ core.h_pq (hreal.injective hcollision))
    (by simpa [edgeDist] using sound core.qp_qa)
    (by simpa [edgeDist] using sound core.qp_qt)
    (by simpa [edgeDist] using sound core.pq_pu)
    (by simpa [edgeDist] using sound core.uq_up)
    (by simpa [edgeDist] using sound core.aq_au)
    (by simpa [edgeDist] using sound core.aq_at)
    (by simpa [edgeDist] using sound core.aq_ab)
    (by simpa [edgeDist] using sound core.tp_tb)
    (by simpa [edgeDist] using sound core.bq_bt)

end EqualityCore
end Census554
end Problem97
