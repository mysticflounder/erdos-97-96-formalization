/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import unit_core_source_indexed_654_22_scalar_certificate
import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Source-indexed ATAIL core-22 anchor collision

Invariant distance-equality wrapper around the independently replayed exact QQ
certificate in `unit_core_source_indexed_654_22_scalar_certificate.lean`.  The
thirteen active equalities from the row-deletion-minimal six-row core force the
two normalization anchors to coincide.  This remains isolated, unbuilt scratch
input until a Lean check is authorized.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueRowProducerScratch

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem unitCoreSourceIndexed65422_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

/-- The normalized thirteen-equality subsystem is inconsistent. -/
private theorem normalized_unitCoreSourceIndexed65422_incompatible
    {P2 P3 P4 P7 P9 P10 : ℝ²}
    (h01 : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) P4)
    (h03 : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) P10)
    (h04 : dist P2 (pt 1 0) = dist P2 P3)
    (h07 : dist P3 (pt 1 0) = dist P3 P4)
    (h08 : dist P3 (pt 1 0) = dist P3 P9)
    (h11 : dist P4 P2 = dist P4 P7)
    (h12 : dist P4 P2 = dist P4 P9)
    (h13 : dist P7 (pt 1 0) = dist P7 P2)
    (h14 : dist P7 (pt 1 0) = dist P7 P3)
    (h15 : dist P7 (pt 1 0) = dist P7 P4)
    (h16 : dist P7 (pt 1 0) = dist P7 P10)
    (h17 : dist P10 (pt 0 0) = dist P10 (pt 1 0))
    (h19 : dist P10 (pt 0 0) = dist P10 P9) : False := by
  have h01sq := congrArg (fun r : ℝ => r ^ 2) h01
  have h03sq := congrArg (fun r : ℝ => r ^ 2) h03
  have h04sq := congrArg (fun r : ℝ => r ^ 2) h04
  have h07sq := congrArg (fun r : ℝ => r ^ 2) h07
  have h08sq := congrArg (fun r : ℝ => r ^ 2) h08
  have h11sq := congrArg (fun r : ℝ => r ^ 2) h11
  have h12sq := congrArg (fun r : ℝ => r ^ 2) h12
  have h13sq := congrArg (fun r : ℝ => r ^ 2) h13
  have h14sq := congrArg (fun r : ℝ => r ^ 2) h14
  have h15sq := congrArg (fun r : ℝ => r ^ 2) h15
  have h16sq := congrArg (fun r : ℝ => r ^ 2) h16
  have h17sq := congrArg (fun r : ℝ => r ^ 2) h17
  have h19sq := congrArg (fun r : ℝ => r ^ 2) h19
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) P4 ^ 2 at h01sq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) P10 ^ 2 at h03sq
  change dist P2 (pt 1 0) ^ 2 = dist P2 P3 ^ 2 at h04sq
  change dist P3 (pt 1 0) ^ 2 = dist P3 P4 ^ 2 at h07sq
  change dist P3 (pt 1 0) ^ 2 = dist P3 P9 ^ 2 at h08sq
  change dist P4 P2 ^ 2 = dist P4 P7 ^ 2 at h11sq
  change dist P4 P2 ^ 2 = dist P4 P9 ^ 2 at h12sq
  change dist P7 (pt 1 0) ^ 2 = dist P7 P2 ^ 2 at h13sq
  change dist P7 (pt 1 0) ^ 2 = dist P7 P3 ^ 2 at h14sq
  change dist P7 (pt 1 0) ^ 2 = dist P7 P4 ^ 2 at h15sq
  change dist P7 (pt 1 0) ^ 2 = dist P7 P10 ^ 2 at h16sq
  change dist P10 (pt 0 0) ^ 2 = dist P10 (pt 1 0) ^ 2 at h17sq
  change dist P10 (pt 0 0) ^ 2 = dist P10 P9 ^ 2 at h19sq
  rw [unitCoreSourceIndexed65422_dist_sq_coord,
      unitCoreSourceIndexed65422_dist_sq_coord]
    at h01sq h03sq h04sq h07sq h08sq h11sq h12sq h13sq h14sq h15sq
      h16sq h17sq h19sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at h01sq h03sq h04sq h07sq h08sq h11sq h12sq h13sq h14sq h15sq
      h16sq h17sq h19sq
  apply normalizedUnitCoreSourceIndexed65422Certificate
    (P2 0) (P2 1) (P3 0) (P3 1) (P4 0) (P4 1)
    (P7 0) (P7 1) (P9 0) (P9 1) (P10 0) (P10 1)
  · nlinarith [h01sq]
  · nlinarith [h03sq]
  · nlinarith [h04sq]
  · nlinarith [h07sq]
  · nlinarith [h08sq]
  · nlinarith [h11sq]
  · nlinarith [h12sq]
  · nlinarith [h13sq]
  · nlinarith [h14sq]
  · nlinarith [h15sq]
  · nlinarith [h16sq]
  · nlinarith [h17sq]
  · nlinarith [h19sq]

/-- The source-indexed core-22 metric subsystem forces its anchors to collide. -/
theorem unit_core_sourceIndexed_654_22_anchor_collision
    {P0 P1 P2 P3 P4 P7 P9 P10 : ℝ²}
    (h01 : dist P1 P0 = dist P1 P4)
    (h03 : dist P1 P0 = dist P1 P10)
    (h04 : dist P2 P1 = dist P2 P3)
    (h07 : dist P3 P1 = dist P3 P4)
    (h08 : dist P3 P1 = dist P3 P9)
    (h11 : dist P4 P2 = dist P4 P7)
    (h12 : dist P4 P2 = dist P4 P9)
    (h13 : dist P7 P1 = dist P7 P2)
    (h14 : dist P7 P1 = dist P7 P3)
    (h15 : dist P7 P1 = dist P7 P4)
    (h16 : dist P7 P1 = dist P7 P10)
    (h17 : dist P10 P0 = dist P10 P1)
    (h19 : dist P10 P0 = dist P10 P9) : P0 = P1 := by
  by_contra h01ne
  let T : ℝ² → ℝ² := normSim P0 P1
  let p2 := T P2
  let p3 := T P3
  let p4 := T P4
  let p7 := T P7
  let p9 := T P9
  let p10 := T P10
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
  apply normalized_unitCoreSourceIndexed65422_incompatible
      (P2 := p2) (P3 := p3) (P4 := p4) (P7 := p7) (P9 := p9) (P10 := p10)
  · simpa [p4, hT0, hT1] using map_dist_eq h01
  · simpa [p10, hT0, hT1] using map_dist_eq h03
  · simpa [p2, p3, hT1] using map_dist_eq h04
  · simpa [p3, p4, hT1] using map_dist_eq h07
  · simpa [p3, p9, hT1] using map_dist_eq h08
  · simpa [p2, p4, p7] using map_dist_eq h11
  · simpa [p2, p4, p9] using map_dist_eq h12
  · simpa [p2, p7, hT1] using map_dist_eq h13
  · simpa [p3, p7, hT1] using map_dist_eq h14
  · simpa [p4, p7, hT1] using map_dist_eq h15
  · simpa [p7, p10, hT1] using map_dist_eq h16
  · simpa [p10, hT0, hT1] using map_dist_eq h17
  · simpa [p9, p10, hT0] using map_dist_eq h19

/-- Equality-closure form of the source-indexed core-22 anchor collision. -/
structure UnitCoreSourceIndexed65422CollisionCore {alpha : Type*}
    (P : Census554.EqualityCore.RowPattern alpha) where
  P0 : alpha
  P1 : alpha
  P2 : alpha
  P3 : alpha
  P4 : alpha
  P7 : alpha
  P9 : alpha
  P10 : alpha
  h01ne : P0 ≠ P1
  h01 : Census554.EqualityCore.EdgeClosure P (P1, P0) (P1, P4)
  h03 : Census554.EqualityCore.EdgeClosure P (P1, P0) (P1, P10)
  h04 : Census554.EqualityCore.EdgeClosure P (P2, P1) (P2, P3)
  h07 : Census554.EqualityCore.EdgeClosure P (P3, P1) (P3, P4)
  h08 : Census554.EqualityCore.EdgeClosure P (P3, P1) (P3, P9)
  h11 : Census554.EqualityCore.EdgeClosure P (P4, P2) (P4, P7)
  h12 : Census554.EqualityCore.EdgeClosure P (P4, P2) (P4, P9)
  h13 : Census554.EqualityCore.EdgeClosure P (P7, P1) (P7, P2)
  h14 : Census554.EqualityCore.EdgeClosure P (P7, P1) (P7, P3)
  h15 : Census554.EqualityCore.EdgeClosure P (P7, P1) (P7, P4)
  h16 : Census554.EqualityCore.EdgeClosure P (P7, P1) (P7, P10)
  h17 : Census554.EqualityCore.EdgeClosure P (P10, P0) (P10, P1)
  h19 : Census554.EqualityCore.EdgeClosure P (P10, P0) (P10, P9)

/-- A matching equality-closure core has no injective planar realization. -/
theorem not_realizes_of_unitCoreSourceIndexed65422CollisionCore
    {alpha : Type*} {P : Census554.EqualityCore.RowPattern alpha}
    (core : UnitCoreSourceIndexed65422CollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Census554.EqualityCore.Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Census554.EqualityCore.Edge alpha}
      (h : Census554.EqualityCore.EdgeClosure P e f) :
      Census554.EqualityCore.edgeDist pointOf e =
        Census554.EqualityCore.edgeDist pointOf f :=
    Census554.EqualityCore.EdgeClosure.sound hreal h
  have hcollision := unit_core_sourceIndexed_654_22_anchor_collision
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h01)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h03)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h04)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h07)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h08)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h11)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h12)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h13)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h14)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h15)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h16)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h17)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h19)
  exact core.h01ne (hreal.injective hcollision)

#print axioms normalizedUnitCoreSourceIndexed65422Certificate
#print axioms unit_core_sourceIndexed_654_22_anchor_collision
#print axioms not_realizes_of_unitCoreSourceIndexed65422CollisionCore

end ATailUniqueRowProducerScratch
end Problem97
