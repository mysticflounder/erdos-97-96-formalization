/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import unit_core_source_indexed_654_24_scalar_certificate
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
private theorem unit_core_sourceIndexed_654_24_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

/-- The normalized active equality subsystem is inconsistent. -/
private theorem normalized_unit_core_sourceIndexed_654_24_incompatible
    {P3 P4 P5 P6 P7 P8 P11 : ℝ²}
    (h02 : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) P4)
    (h03 : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) P5)
    (h04 : dist (pt 1 0) P4 = dist (pt 1 0) P7)
    (h05 : dist (pt 1 0) P4 = dist (pt 1 0) P8)
    (h08 : dist P3 (pt 1 0) = dist P3 P5)
    (h09 : dist P3 (pt 1 0) = dist P3 P6)
    (h10 : dist P3 (pt 1 0) = dist P3 P8)
    (h11 : dist P4 (pt 0 0) = dist P4 P3)
    (h12 : dist P4 (pt 0 0) = dist P4 P6)
    (h14 : dist P5 P3 = dist P5 P4)
    (h15 : dist P5 P3 = dist P5 P7)
    (h16 : dist P5 P3 = dist P5 P11)
    (h17 : dist P7 (pt 0 0) = dist P7 P4)
    (h18 : dist P7 (pt 0 0) = dist P7 P6)
    (h19 : dist P7 (pt 0 0) = dist P7 P8)
    : False := by
  have h02sq := congrArg (fun r : ℝ => r ^ 2) h02
  have h03sq := congrArg (fun r : ℝ => r ^ 2) h03
  have h04sq := congrArg (fun r : ℝ => r ^ 2) h04
  have h05sq := congrArg (fun r : ℝ => r ^ 2) h05
  have h08sq := congrArg (fun r : ℝ => r ^ 2) h08
  have h09sq := congrArg (fun r : ℝ => r ^ 2) h09
  have h10sq := congrArg (fun r : ℝ => r ^ 2) h10
  have h11sq := congrArg (fun r : ℝ => r ^ 2) h11
  have h12sq := congrArg (fun r : ℝ => r ^ 2) h12
  have h14sq := congrArg (fun r : ℝ => r ^ 2) h14
  have h15sq := congrArg (fun r : ℝ => r ^ 2) h15
  have h16sq := congrArg (fun r : ℝ => r ^ 2) h16
  have h17sq := congrArg (fun r : ℝ => r ^ 2) h17
  have h18sq := congrArg (fun r : ℝ => r ^ 2) h18
  have h19sq := congrArg (fun r : ℝ => r ^ 2) h19
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) P4 ^ 2 at h02sq
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) P5 ^ 2 at h03sq
  change dist (pt 1 0) P4 ^ 2 = dist (pt 1 0) P7 ^ 2 at h04sq
  change dist (pt 1 0) P4 ^ 2 = dist (pt 1 0) P8 ^ 2 at h05sq
  change dist P3 (pt 1 0) ^ 2 = dist P3 P5 ^ 2 at h08sq
  change dist P3 (pt 1 0) ^ 2 = dist P3 P6 ^ 2 at h09sq
  change dist P3 (pt 1 0) ^ 2 = dist P3 P8 ^ 2 at h10sq
  change dist P4 (pt 0 0) ^ 2 = dist P4 P3 ^ 2 at h11sq
  change dist P4 (pt 0 0) ^ 2 = dist P4 P6 ^ 2 at h12sq
  change dist P5 P3 ^ 2 = dist P5 P4 ^ 2 at h14sq
  change dist P5 P3 ^ 2 = dist P5 P7 ^ 2 at h15sq
  change dist P5 P3 ^ 2 = dist P5 P11 ^ 2 at h16sq
  change dist P7 (pt 0 0) ^ 2 = dist P7 P4 ^ 2 at h17sq
  change dist P7 (pt 0 0) ^ 2 = dist P7 P6 ^ 2 at h18sq
  change dist P7 (pt 0 0) ^ 2 = dist P7 P8 ^ 2 at h19sq
  rw [unit_core_sourceIndexed_654_24_dist_sq_coord, unit_core_sourceIndexed_654_24_dist_sq_coord] at h02sq h03sq h04sq h05sq h08sq h09sq h10sq h11sq h12sq h14sq h15sq h16sq h17sq h18sq h19sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at
    h02sq h03sq h04sq h05sq h08sq h09sq h10sq h11sq h12sq h14sq h15sq h16sq h17sq h18sq h19sq
  apply normalizedUnitCoreSourceIndexed65424Certificate
    (P3 0) (P3 1) (P4 0) (P4 1) (P5 0) (P5 1) (P6 0) (P6 1) (P7 0) (P7 1) (P8 0) (P8 1) (P11 0) (P11 1)
  · nlinarith [h02sq]
  · nlinarith [h03sq]
  · nlinarith [h04sq]
  · nlinarith [h05sq]
  · nlinarith [h08sq]
  · nlinarith [h09sq]
  · nlinarith [h10sq]
  · nlinarith [h11sq]
  · nlinarith [h12sq]
  · nlinarith [h14sq]
  · nlinarith [h15sq]
  · nlinarith [h16sq]
  · nlinarith [h17sq]
  · nlinarith [h18sq]
  · nlinarith [h19sq]

/-- The metric subsystem forces its two normalization anchors to collide. -/
theorem unit_core_sourceIndexed_654_24_anchor_collision
    {P0 P1 P3 P4 P5 P6 P7 P8 P11 : ℝ²}
    (h02 : dist P0 P1 = dist P0 P4)
    (h03 : dist P0 P1 = dist P0 P5)
    (h04 : dist P1 P4 = dist P1 P7)
    (h05 : dist P1 P4 = dist P1 P8)
    (h08 : dist P3 P1 = dist P3 P5)
    (h09 : dist P3 P1 = dist P3 P6)
    (h10 : dist P3 P1 = dist P3 P8)
    (h11 : dist P4 P0 = dist P4 P3)
    (h12 : dist P4 P0 = dist P4 P6)
    (h14 : dist P5 P3 = dist P5 P4)
    (h15 : dist P5 P3 = dist P5 P7)
    (h16 : dist P5 P3 = dist P5 P11)
    (h17 : dist P7 P0 = dist P7 P4)
    (h18 : dist P7 P0 = dist P7 P6)
    (h19 : dist P7 P0 = dist P7 P8)
    : P0 = P1 := by
  by_contra h01ne
  let T : ℝ² → ℝ² := normSim P0 P1
  let p3 := T P3
  let p4 := T P4
  let p5 := T P5
  let p6 := T P6
  let p7 := T P7
  let p8 := T P8
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
  apply normalized_unit_core_sourceIndexed_654_24_incompatible
      (P3 := p3) (P4 := p4) (P5 := p5) (P6 := p6) (P7 := p7) (P8 := p8) (P11 := p11)
  · simpa [p3, p4, p5, p6, p7, p8, p11, hT0, hT1] using map_dist_eq h02
  · simpa [p3, p4, p5, p6, p7, p8, p11, hT0, hT1] using map_dist_eq h03
  · simpa [p3, p4, p5, p6, p7, p8, p11, hT0, hT1] using map_dist_eq h04
  · simpa [p3, p4, p5, p6, p7, p8, p11, hT0, hT1] using map_dist_eq h05
  · simpa [p3, p4, p5, p6, p7, p8, p11, hT0, hT1] using map_dist_eq h08
  · simpa [p3, p4, p5, p6, p7, p8, p11, hT0, hT1] using map_dist_eq h09
  · simpa [p3, p4, p5, p6, p7, p8, p11, hT0, hT1] using map_dist_eq h10
  · simpa [p3, p4, p5, p6, p7, p8, p11, hT0, hT1] using map_dist_eq h11
  · simpa [p3, p4, p5, p6, p7, p8, p11, hT0, hT1] using map_dist_eq h12
  · simpa [p3, p4, p5, p6, p7, p8, p11, hT0, hT1] using map_dist_eq h14
  · simpa [p3, p4, p5, p6, p7, p8, p11, hT0, hT1] using map_dist_eq h15
  · simpa [p3, p4, p5, p6, p7, p8, p11, hT0, hT1] using map_dist_eq h16
  · simpa [p3, p4, p5, p6, p7, p8, p11, hT0, hT1] using map_dist_eq h17
  · simpa [p3, p4, p5, p6, p7, p8, p11, hT0, hT1] using map_dist_eq h18
  · simpa [p3, p4, p5, p6, p7, p8, p11, hT0, hT1] using map_dist_eq h19

/-- Equality-closure form of the generated anchor collision. -/
structure UnitCoreSourceIndexed65424CollisionCore {alpha : Type*}
    (P : Census554.EqualityCore.RowPattern alpha) where
  P0 : alpha
  P1 : alpha
  P3 : alpha
  P4 : alpha
  P5 : alpha
  P6 : alpha
  P7 : alpha
  P8 : alpha
  P11 : alpha
  h01ne : P0 ≠ P1
  h02 : Census554.EqualityCore.EdgeClosure P (P0, P1) (P0, P4)
  h03 : Census554.EqualityCore.EdgeClosure P (P0, P1) (P0, P5)
  h04 : Census554.EqualityCore.EdgeClosure P (P1, P4) (P1, P7)
  h05 : Census554.EqualityCore.EdgeClosure P (P1, P4) (P1, P8)
  h08 : Census554.EqualityCore.EdgeClosure P (P3, P1) (P3, P5)
  h09 : Census554.EqualityCore.EdgeClosure P (P3, P1) (P3, P6)
  h10 : Census554.EqualityCore.EdgeClosure P (P3, P1) (P3, P8)
  h11 : Census554.EqualityCore.EdgeClosure P (P4, P0) (P4, P3)
  h12 : Census554.EqualityCore.EdgeClosure P (P4, P0) (P4, P6)
  h14 : Census554.EqualityCore.EdgeClosure P (P5, P3) (P5, P4)
  h15 : Census554.EqualityCore.EdgeClosure P (P5, P3) (P5, P7)
  h16 : Census554.EqualityCore.EdgeClosure P (P5, P3) (P5, P11)
  h17 : Census554.EqualityCore.EdgeClosure P (P7, P0) (P7, P4)
  h18 : Census554.EqualityCore.EdgeClosure P (P7, P0) (P7, P6)
  h19 : Census554.EqualityCore.EdgeClosure P (P7, P0) (P7, P8)

/-- A matching equality-closure core has no injective planar realization. -/
theorem not_realizes_of_unitCoreSourceIndexed65424CollisionCore
    {alpha : Type*} {P : Census554.EqualityCore.RowPattern alpha}
    (core : UnitCoreSourceIndexed65424CollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Census554.EqualityCore.Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Census554.EqualityCore.Edge alpha}
      (h : Census554.EqualityCore.EdgeClosure P e f) :
      Census554.EqualityCore.edgeDist pointOf e =
        Census554.EqualityCore.edgeDist pointOf f :=
    Census554.EqualityCore.EdgeClosure.sound hreal h
  have hcollision := unit_core_sourceIndexed_654_24_anchor_collision
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h02)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h03)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h04)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h05)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h08)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h09)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h10)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h11)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h12)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h14)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h15)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h16)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h17)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h18)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h19)
  exact core.h01ne (hreal.injective hcollision)

#print axioms normalizedUnitCoreSourceIndexed65424Certificate
#print axioms unit_core_sourceIndexed_654_24_anchor_collision
#print axioms not_realizes_of_unitCoreSourceIndexed65424CollisionCore

end ATailUniqueRowProducerScratch
end Problem97
