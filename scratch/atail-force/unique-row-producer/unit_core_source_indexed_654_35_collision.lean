/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import unit_core_source_indexed_654_35_scalar_certificate
import Erdos9796Proof.P97.Census554.EqualityCore

/-!
Generated invariant distance-equality wrapper around an independently
replayed exact QQ unit certificate.  This is isolated, unbuilt scratch
input until a Lean check is authorized.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueRowProducerScratch

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem sourceIndexed_654_35_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

/-- The normalized active equality subsystem is inconsistent. -/
private theorem normalized_sourceIndexed_654_35_incompatible
    {P2 P3 P4 P5 P7 P10 P11 : ℝ²}
    (h02 : dist (pt 0 0) P2 = dist (pt 0 0) P10)
    (h03 : dist (pt 0 0) P2 = dist (pt 0 0) P11)
    (h04 : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) P2)
    (h05 : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) P3)
    (h06 : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) P7)
    (h07 : dist P2 (pt 1 0) = dist P2 P4)
    (h08 : dist P2 (pt 1 0) = dist P2 P7)
    (h09 : dist P2 (pt 1 0) = dist P2 P10)
    (h10 : dist P3 (pt 1 0) = dist P3 P5)
    (h12 : dist P3 (pt 1 0) = dist P3 P11)
    (h13 : dist P4 P3 = dist P4 P5)
    (h14 : dist P4 P3 = dist P4 P7)
    (h15 : dist P4 P3 = dist P4 P10)
    (h16 : dist P5 (pt 0 0) = dist P5 (pt 1 0))
    (h18 : dist P5 (pt 0 0) = dist P5 P10)
    : False := by
  have h02sq := congrArg (fun r : ℝ => r ^ 2) h02
  have h03sq := congrArg (fun r : ℝ => r ^ 2) h03
  have h04sq := congrArg (fun r : ℝ => r ^ 2) h04
  have h05sq := congrArg (fun r : ℝ => r ^ 2) h05
  have h06sq := congrArg (fun r : ℝ => r ^ 2) h06
  have h07sq := congrArg (fun r : ℝ => r ^ 2) h07
  have h08sq := congrArg (fun r : ℝ => r ^ 2) h08
  have h09sq := congrArg (fun r : ℝ => r ^ 2) h09
  have h10sq := congrArg (fun r : ℝ => r ^ 2) h10
  have h12sq := congrArg (fun r : ℝ => r ^ 2) h12
  have h13sq := congrArg (fun r : ℝ => r ^ 2) h13
  have h14sq := congrArg (fun r : ℝ => r ^ 2) h14
  have h15sq := congrArg (fun r : ℝ => r ^ 2) h15
  have h16sq := congrArg (fun r : ℝ => r ^ 2) h16
  have h18sq := congrArg (fun r : ℝ => r ^ 2) h18
  change dist (pt 0 0) P2 ^ 2 = dist (pt 0 0) P10 ^ 2 at h02sq
  change dist (pt 0 0) P2 ^ 2 = dist (pt 0 0) P11 ^ 2 at h03sq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) P2 ^ 2 at h04sq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) P3 ^ 2 at h05sq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) P7 ^ 2 at h06sq
  change dist P2 (pt 1 0) ^ 2 = dist P2 P4 ^ 2 at h07sq
  change dist P2 (pt 1 0) ^ 2 = dist P2 P7 ^ 2 at h08sq
  change dist P2 (pt 1 0) ^ 2 = dist P2 P10 ^ 2 at h09sq
  change dist P3 (pt 1 0) ^ 2 = dist P3 P5 ^ 2 at h10sq
  change dist P3 (pt 1 0) ^ 2 = dist P3 P11 ^ 2 at h12sq
  change dist P4 P3 ^ 2 = dist P4 P5 ^ 2 at h13sq
  change dist P4 P3 ^ 2 = dist P4 P7 ^ 2 at h14sq
  change dist P4 P3 ^ 2 = dist P4 P10 ^ 2 at h15sq
  change dist P5 (pt 0 0) ^ 2 = dist P5 (pt 1 0) ^ 2 at h16sq
  change dist P5 (pt 0 0) ^ 2 = dist P5 P10 ^ 2 at h18sq
  rw [sourceIndexed_654_35_dist_sq_coord, sourceIndexed_654_35_dist_sq_coord] at h02sq h03sq h04sq h05sq h06sq h07sq h08sq h09sq h10sq h12sq h13sq h14sq h15sq h16sq h18sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at
    h02sq h03sq h04sq h05sq h06sq h07sq h08sq h09sq h10sq h12sq h13sq h14sq h15sq h16sq h18sq
  apply normalizedUnitCoreSourceIndexed65435Certificate
    (P2 0) (P2 1) (P3 0) (P3 1) (P4 0) (P4 1) (P5 0) (P5 1) (P7 0) (P7 1) (P10 0) (P10 1) (P11 0) (P11 1)
  · nlinarith [h02sq]
  · nlinarith [h03sq]
  · nlinarith [h04sq]
  · nlinarith [h05sq]
  · nlinarith [h06sq]
  · nlinarith [h07sq]
  · nlinarith [h08sq]
  · nlinarith [h09sq]
  · nlinarith [h10sq]
  · nlinarith [h12sq]
  · nlinarith [h13sq]
  · nlinarith [h14sq]
  · nlinarith [h15sq]
  · nlinarith [h16sq]
  · nlinarith [h18sq]

/-- The metric subsystem forces its two normalization anchors to collide. -/
theorem sourceIndexed_654_35_anchor_collision
    {P0 P1 P2 P3 P4 P5 P7 P10 P11 : ℝ²}
    (h02 : dist P0 P2 = dist P0 P10)
    (h03 : dist P0 P2 = dist P0 P11)
    (h04 : dist P1 P0 = dist P1 P2)
    (h05 : dist P1 P0 = dist P1 P3)
    (h06 : dist P1 P0 = dist P1 P7)
    (h07 : dist P2 P1 = dist P2 P4)
    (h08 : dist P2 P1 = dist P2 P7)
    (h09 : dist P2 P1 = dist P2 P10)
    (h10 : dist P3 P1 = dist P3 P5)
    (h12 : dist P3 P1 = dist P3 P11)
    (h13 : dist P4 P3 = dist P4 P5)
    (h14 : dist P4 P3 = dist P4 P7)
    (h15 : dist P4 P3 = dist P4 P10)
    (h16 : dist P5 P0 = dist P5 P1)
    (h18 : dist P5 P0 = dist P5 P10)
    : P0 = P1 := by
  by_contra h01ne
  let T : ℝ² → ℝ² := normSim P0 P1
  let p2 := T P2
  let p3 := T P3
  let p4 := T P4
  let p5 := T P5
  let p7 := T P7
  let p10 := T P10
  let p11 := T P11
  have hdist (X Y : ℝ²) :
      dist (T X) (T Y) = (dist P0 P1)⁻¹ * dist X Y := by
    simpa [T] using normSim_dist_image P0 P1 h01ne X Y
  have hT0 : T P0 = pt 0 0 := by
    simpa [T] using normSim_fst P0 P1
  have hT1 : T P1 = pt 1 0 := by
    simpa [T] using normSim_snd P0 P1 h01ne
  have map_dist_eq {X Y Z R : ℝ²} (h : dist X Y = dist Z R) :
      dist (T X) (T Y) = dist (T Z) (T R) := by
    rw [hdist, hdist, h]
  apply normalized_sourceIndexed_654_35_incompatible
      (P2 := p2) (P3 := p3) (P4 := p4) (P5 := p5) (P7 := p7) (P10 := p10) (P11 := p11)
  · simpa [p2, p3, p4, p5, p7, p10, p11, hT0, hT1] using map_dist_eq h02
  · simpa [p2, p3, p4, p5, p7, p10, p11, hT0, hT1] using map_dist_eq h03
  · simpa [p2, p3, p4, p5, p7, p10, p11, hT0, hT1] using map_dist_eq h04
  · simpa [p2, p3, p4, p5, p7, p10, p11, hT0, hT1] using map_dist_eq h05
  · simpa [p2, p3, p4, p5, p7, p10, p11, hT0, hT1] using map_dist_eq h06
  · simpa [p2, p3, p4, p5, p7, p10, p11, hT0, hT1] using map_dist_eq h07
  · simpa [p2, p3, p4, p5, p7, p10, p11, hT0, hT1] using map_dist_eq h08
  · simpa [p2, p3, p4, p5, p7, p10, p11, hT0, hT1] using map_dist_eq h09
  · simpa [p2, p3, p4, p5, p7, p10, p11, hT0, hT1] using map_dist_eq h10
  · simpa [p2, p3, p4, p5, p7, p10, p11, hT0, hT1] using map_dist_eq h12
  · simpa [p2, p3, p4, p5, p7, p10, p11, hT0, hT1] using map_dist_eq h13
  · simpa [p2, p3, p4, p5, p7, p10, p11, hT0, hT1] using map_dist_eq h14
  · simpa [p2, p3, p4, p5, p7, p10, p11, hT0, hT1] using map_dist_eq h15
  · simpa [p2, p3, p4, p5, p7, p10, p11, hT0, hT1] using map_dist_eq h16
  · simpa [p2, p3, p4, p5, p7, p10, p11, hT0, hT1] using map_dist_eq h18

/-- Equality-closure form of the generated anchor collision. -/
structure UnitCoreSourceIndexed65435CollisionCore {alpha : Type*}
    (P : Census554.EqualityCore.RowPattern alpha) where
  P0 : alpha
  P1 : alpha
  P2 : alpha
  P3 : alpha
  P4 : alpha
  P5 : alpha
  P7 : alpha
  P10 : alpha
  P11 : alpha
  h01ne : P0 ≠ P1
  h02 : Census554.EqualityCore.EdgeClosure P (P0, P2) (P0, P10)
  h03 : Census554.EqualityCore.EdgeClosure P (P0, P2) (P0, P11)
  h04 : Census554.EqualityCore.EdgeClosure P (P1, P0) (P1, P2)
  h05 : Census554.EqualityCore.EdgeClosure P (P1, P0) (P1, P3)
  h06 : Census554.EqualityCore.EdgeClosure P (P1, P0) (P1, P7)
  h07 : Census554.EqualityCore.EdgeClosure P (P2, P1) (P2, P4)
  h08 : Census554.EqualityCore.EdgeClosure P (P2, P1) (P2, P7)
  h09 : Census554.EqualityCore.EdgeClosure P (P2, P1) (P2, P10)
  h10 : Census554.EqualityCore.EdgeClosure P (P3, P1) (P3, P5)
  h12 : Census554.EqualityCore.EdgeClosure P (P3, P1) (P3, P11)
  h13 : Census554.EqualityCore.EdgeClosure P (P4, P3) (P4, P5)
  h14 : Census554.EqualityCore.EdgeClosure P (P4, P3) (P4, P7)
  h15 : Census554.EqualityCore.EdgeClosure P (P4, P3) (P4, P10)
  h16 : Census554.EqualityCore.EdgeClosure P (P5, P0) (P5, P1)
  h18 : Census554.EqualityCore.EdgeClosure P (P5, P0) (P5, P10)

/-- A matching equality-closure core has no injective planar realization. -/
theorem not_realizes_of_unitCoreSourceIndexed65435CollisionCore
    {alpha : Type*} {P : Census554.EqualityCore.RowPattern alpha}
    (core : UnitCoreSourceIndexed65435CollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Census554.EqualityCore.Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Census554.EqualityCore.Edge alpha}
      (h : Census554.EqualityCore.EdgeClosure P e f) :
      Census554.EqualityCore.edgeDist pointOf e =
        Census554.EqualityCore.edgeDist pointOf f :=
    Census554.EqualityCore.EdgeClosure.sound hreal h
  have hcollision := sourceIndexed_654_35_anchor_collision
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h02)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h03)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h04)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h05)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h06)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h07)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h08)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h09)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h10)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h12)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h13)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h14)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h15)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h16)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h18)
  exact core.h01ne (hreal.injective hcollision)

#print axioms normalizedUnitCoreSourceIndexed65435Certificate
#print axioms sourceIndexed_654_35_anchor_collision
#print axioms not_realizes_of_unitCoreSourceIndexed65435CollisionCore

end ATailUniqueRowProducerScratch
end Problem97
