/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import unit_core_source_indexed_654_51_scalar_certificate
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
private theorem sourceIndexed_654_51_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

/-- The normalized active equality subsystem is inconsistent. -/
private theorem normalized_sourceIndexed_654_51_incompatible
    {P3 P4 P5 P6 P7 P8 P9 P11 : ℝ²}
    (h02 : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) P6)
    (h03 : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) P7)
    (h04 : dist P5 P3 = dist P5 P6)
    (h05 : dist P5 P3 = dist P5 P9)
    (h06 : dist P5 P3 = dist P5 P11)
    (h08 : dist P6 (pt 0 0) = dist P6 P5)
    (h09 : dist P6 (pt 0 0) = dist P6 P11)
    (h11 : dist P7 (pt 1 0) = dist P7 P8)
    (h12 : dist P7 (pt 1 0) = dist P7 P11)
    (h13 : dist P8 P4 = dist P8 P5)
    (h14 : dist P8 P4 = dist P8 P6)
    (h15 : dist P8 P4 = dist P8 P9)
    (h17 : dist P9 (pt 1 0) = dist P9 P6)
    (h18 : dist P9 (pt 1 0) = dist P9 P7)
    (h21 : dist P11 (pt 1 0) = dist P11 P9)
    : False := by
  have h02sq := congrArg (fun r : ℝ => r ^ 2) h02
  have h03sq := congrArg (fun r : ℝ => r ^ 2) h03
  have h04sq := congrArg (fun r : ℝ => r ^ 2) h04
  have h05sq := congrArg (fun r : ℝ => r ^ 2) h05
  have h06sq := congrArg (fun r : ℝ => r ^ 2) h06
  have h08sq := congrArg (fun r : ℝ => r ^ 2) h08
  have h09sq := congrArg (fun r : ℝ => r ^ 2) h09
  have h11sq := congrArg (fun r : ℝ => r ^ 2) h11
  have h12sq := congrArg (fun r : ℝ => r ^ 2) h12
  have h13sq := congrArg (fun r : ℝ => r ^ 2) h13
  have h14sq := congrArg (fun r : ℝ => r ^ 2) h14
  have h15sq := congrArg (fun r : ℝ => r ^ 2) h15
  have h17sq := congrArg (fun r : ℝ => r ^ 2) h17
  have h18sq := congrArg (fun r : ℝ => r ^ 2) h18
  have h21sq := congrArg (fun r : ℝ => r ^ 2) h21
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) P6 ^ 2 at h02sq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) P7 ^ 2 at h03sq
  change dist P5 P3 ^ 2 = dist P5 P6 ^ 2 at h04sq
  change dist P5 P3 ^ 2 = dist P5 P9 ^ 2 at h05sq
  change dist P5 P3 ^ 2 = dist P5 P11 ^ 2 at h06sq
  change dist P6 (pt 0 0) ^ 2 = dist P6 P5 ^ 2 at h08sq
  change dist P6 (pt 0 0) ^ 2 = dist P6 P11 ^ 2 at h09sq
  change dist P7 (pt 1 0) ^ 2 = dist P7 P8 ^ 2 at h11sq
  change dist P7 (pt 1 0) ^ 2 = dist P7 P11 ^ 2 at h12sq
  change dist P8 P4 ^ 2 = dist P8 P5 ^ 2 at h13sq
  change dist P8 P4 ^ 2 = dist P8 P6 ^ 2 at h14sq
  change dist P8 P4 ^ 2 = dist P8 P9 ^ 2 at h15sq
  change dist P9 (pt 1 0) ^ 2 = dist P9 P6 ^ 2 at h17sq
  change dist P9 (pt 1 0) ^ 2 = dist P9 P7 ^ 2 at h18sq
  change dist P11 (pt 1 0) ^ 2 = dist P11 P9 ^ 2 at h21sq
  rw [sourceIndexed_654_51_dist_sq_coord, sourceIndexed_654_51_dist_sq_coord] at h02sq h03sq h04sq h05sq h06sq h08sq h09sq h11sq h12sq h13sq h14sq h15sq h17sq h18sq h21sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at
    h02sq h03sq h04sq h05sq h06sq h08sq h09sq h11sq h12sq h13sq h14sq h15sq h17sq h18sq h21sq
  apply normalizedUnitCoreSourceIndexed65451Certificate
    (P3 0) (P3 1) (P4 0) (P4 1) (P5 0) (P5 1) (P6 0) (P6 1) (P7 0) (P7 1) (P8 0) (P8 1) (P9 0) (P9 1) (P11 0) (P11 1)
  · nlinarith [h02sq]
  · nlinarith [h03sq]
  · nlinarith [h04sq]
  · nlinarith [h05sq]
  · nlinarith [h06sq]
  · nlinarith [h08sq]
  · nlinarith [h09sq]
  · nlinarith [h11sq]
  · nlinarith [h12sq]
  · nlinarith [h13sq]
  · nlinarith [h14sq]
  · nlinarith [h15sq]
  · nlinarith [h17sq]
  · nlinarith [h18sq]
  · nlinarith [h21sq]

/-- The metric subsystem forces its two normalization anchors to collide. -/
theorem sourceIndexed_654_51_anchor_collision
    {P0 P1 P3 P4 P5 P6 P7 P8 P9 P11 : ℝ²}
    (h02 : dist P1 P0 = dist P1 P6)
    (h03 : dist P1 P0 = dist P1 P7)
    (h04 : dist P5 P3 = dist P5 P6)
    (h05 : dist P5 P3 = dist P5 P9)
    (h06 : dist P5 P3 = dist P5 P11)
    (h08 : dist P6 P0 = dist P6 P5)
    (h09 : dist P6 P0 = dist P6 P11)
    (h11 : dist P7 P1 = dist P7 P8)
    (h12 : dist P7 P1 = dist P7 P11)
    (h13 : dist P8 P4 = dist P8 P5)
    (h14 : dist P8 P4 = dist P8 P6)
    (h15 : dist P8 P4 = dist P8 P9)
    (h17 : dist P9 P1 = dist P9 P6)
    (h18 : dist P9 P1 = dist P9 P7)
    (h21 : dist P11 P1 = dist P11 P9)
    : P0 = P1 := by
  by_contra h01ne
  let T : ℝ² → ℝ² := normSim P0 P1
  let p3 := T P3
  let p4 := T P4
  let p5 := T P5
  let p6 := T P6
  let p7 := T P7
  let p8 := T P8
  let p9 := T P9
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
  apply normalized_sourceIndexed_654_51_incompatible
      (P3 := p3) (P4 := p4) (P5 := p5) (P6 := p6) (P7 := p7) (P8 := p8) (P9 := p9) (P11 := p11)
  · simpa [p3, p4, p5, p6, p7, p8, p9, p11, hT0, hT1] using map_dist_eq h02
  · simpa [p3, p4, p5, p6, p7, p8, p9, p11, hT0, hT1] using map_dist_eq h03
  · simpa [p3, p4, p5, p6, p7, p8, p9, p11, hT0, hT1] using map_dist_eq h04
  · simpa [p3, p4, p5, p6, p7, p8, p9, p11, hT0, hT1] using map_dist_eq h05
  · simpa [p3, p4, p5, p6, p7, p8, p9, p11, hT0, hT1] using map_dist_eq h06
  · simpa [p3, p4, p5, p6, p7, p8, p9, p11, hT0, hT1] using map_dist_eq h08
  · simpa [p3, p4, p5, p6, p7, p8, p9, p11, hT0, hT1] using map_dist_eq h09
  · simpa [p3, p4, p5, p6, p7, p8, p9, p11, hT0, hT1] using map_dist_eq h11
  · simpa [p3, p4, p5, p6, p7, p8, p9, p11, hT0, hT1] using map_dist_eq h12
  · simpa [p3, p4, p5, p6, p7, p8, p9, p11, hT0, hT1] using map_dist_eq h13
  · simpa [p3, p4, p5, p6, p7, p8, p9, p11, hT0, hT1] using map_dist_eq h14
  · simpa [p3, p4, p5, p6, p7, p8, p9, p11, hT0, hT1] using map_dist_eq h15
  · simpa [p3, p4, p5, p6, p7, p8, p9, p11, hT0, hT1] using map_dist_eq h17
  · simpa [p3, p4, p5, p6, p7, p8, p9, p11, hT0, hT1] using map_dist_eq h18
  · simpa [p3, p4, p5, p6, p7, p8, p9, p11, hT0, hT1] using map_dist_eq h21

/-- Equality-closure form of the generated anchor collision. -/
structure UnitCoreSourceIndexed65451CollisionCore {alpha : Type*}
    (P : Census554.EqualityCore.RowPattern alpha) where
  P0 : alpha
  P1 : alpha
  P3 : alpha
  P4 : alpha
  P5 : alpha
  P6 : alpha
  P7 : alpha
  P8 : alpha
  P9 : alpha
  P11 : alpha
  h01ne : P0 ≠ P1
  h02 : Census554.EqualityCore.EdgeClosure P (P1, P0) (P1, P6)
  h03 : Census554.EqualityCore.EdgeClosure P (P1, P0) (P1, P7)
  h04 : Census554.EqualityCore.EdgeClosure P (P5, P3) (P5, P6)
  h05 : Census554.EqualityCore.EdgeClosure P (P5, P3) (P5, P9)
  h06 : Census554.EqualityCore.EdgeClosure P (P5, P3) (P5, P11)
  h08 : Census554.EqualityCore.EdgeClosure P (P6, P0) (P6, P5)
  h09 : Census554.EqualityCore.EdgeClosure P (P6, P0) (P6, P11)
  h11 : Census554.EqualityCore.EdgeClosure P (P7, P1) (P7, P8)
  h12 : Census554.EqualityCore.EdgeClosure P (P7, P1) (P7, P11)
  h13 : Census554.EqualityCore.EdgeClosure P (P8, P4) (P8, P5)
  h14 : Census554.EqualityCore.EdgeClosure P (P8, P4) (P8, P6)
  h15 : Census554.EqualityCore.EdgeClosure P (P8, P4) (P8, P9)
  h17 : Census554.EqualityCore.EdgeClosure P (P9, P1) (P9, P6)
  h18 : Census554.EqualityCore.EdgeClosure P (P9, P1) (P9, P7)
  h21 : Census554.EqualityCore.EdgeClosure P (P11, P1) (P11, P9)

/-- A matching equality-closure core has no injective planar realization. -/
theorem not_realizes_of_unitCoreSourceIndexed65451CollisionCore
    {alpha : Type*} {P : Census554.EqualityCore.RowPattern alpha}
    (core : UnitCoreSourceIndexed65451CollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Census554.EqualityCore.Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Census554.EqualityCore.Edge alpha}
      (h : Census554.EqualityCore.EdgeClosure P e f) :
      Census554.EqualityCore.edgeDist pointOf e =
        Census554.EqualityCore.edgeDist pointOf f :=
    Census554.EqualityCore.EdgeClosure.sound hreal h
  have hcollision := sourceIndexed_654_51_anchor_collision
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h02)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h03)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h04)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h05)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h06)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h08)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h09)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h11)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h12)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h13)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h14)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h15)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h17)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h18)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h21)
  exact core.h01ne (hreal.injective hcollision)

#print axioms normalizedUnitCoreSourceIndexed65451Certificate
#print axioms sourceIndexed_654_51_anchor_collision
#print axioms not_realizes_of_unitCoreSourceIndexed65451CollisionCore

end ATailUniqueRowProducerScratch
end Problem97
