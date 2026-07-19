/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import unit_core_source_indexed_654_scalar_certificate
import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Source-indexed ATAIL five-row unit-core collision

Invariant distance-equality wrapper around the independently replayed exact QQ
certificate in `unit_core_source_indexed_654_scalar_certificate.lean`.  The ten
active equalities from the deletion-minimal five-row core force the two
normalization anchors to coincide.  This remains isolated, unbuilt scratch
input until a Lean check is authorized.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueRowProducerScratch

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem unitCoreSourceIndexed654_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

/-- The normalized ten-equality subsystem is inconsistent. -/
private theorem normalized_unitCoreSourceIndexed654_incompatible
    {P2 P5 P9 P10 P11 : ℝ²}
    (h01 : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) P2)
    (h04 : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) P9)
    (h05 : dist P2 (pt 0 0) = dist P2 (pt 1 0))
    (h06 : dist P2 (pt 0 0) = dist P2 P10)
    (h07 : dist P2 (pt 0 0) = dist P2 P11)
    (h08 : dist P9 (pt 0 0) = dist P9 P2)
    (h12 : dist P10 P5 = dist P10 P9)
    (h13 : dist P10 P5 = dist P10 P11)
    (h15 : dist P11 (pt 1 0) = dist P11 P9)
    (h16 : dist P11 (pt 1 0) = dist P11 P10) : False := by
  have h01sq := congrArg (fun r : ℝ => r ^ 2) h01
  have h04sq := congrArg (fun r : ℝ => r ^ 2) h04
  have h05sq := congrArg (fun r : ℝ => r ^ 2) h05
  have h06sq := congrArg (fun r : ℝ => r ^ 2) h06
  have h07sq := congrArg (fun r : ℝ => r ^ 2) h07
  have h08sq := congrArg (fun r : ℝ => r ^ 2) h08
  have h12sq := congrArg (fun r : ℝ => r ^ 2) h12
  have h13sq := congrArg (fun r : ℝ => r ^ 2) h13
  have h15sq := congrArg (fun r : ℝ => r ^ 2) h15
  have h16sq := congrArg (fun r : ℝ => r ^ 2) h16
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) P2 ^ 2 at h01sq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) P9 ^ 2 at h04sq
  change dist P2 (pt 0 0) ^ 2 = dist P2 (pt 1 0) ^ 2 at h05sq
  change dist P2 (pt 0 0) ^ 2 = dist P2 P10 ^ 2 at h06sq
  change dist P2 (pt 0 0) ^ 2 = dist P2 P11 ^ 2 at h07sq
  change dist P9 (pt 0 0) ^ 2 = dist P9 P2 ^ 2 at h08sq
  change dist P10 P5 ^ 2 = dist P10 P9 ^ 2 at h12sq
  change dist P10 P5 ^ 2 = dist P10 P11 ^ 2 at h13sq
  change dist P11 (pt 1 0) ^ 2 = dist P11 P9 ^ 2 at h15sq
  change dist P11 (pt 1 0) ^ 2 = dist P11 P10 ^ 2 at h16sq
  rw [unitCoreSourceIndexed654_dist_sq_coord,
      unitCoreSourceIndexed654_dist_sq_coord]
    at h01sq h04sq h05sq h06sq h07sq h08sq h12sq h13sq h15sq h16sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at h01sq h04sq h05sq h06sq h07sq h08sq h12sq h13sq h15sq h16sq
  apply normalizedUnitCoreSourceIndexed654Certificate
    (P2 0) (P2 1) (P5 0) (P5 1) (P9 0) (P9 1)
    (P10 0) (P10 1) (P11 0) (P11 1)
  · nlinarith [h01sq]
  · nlinarith [h04sq]
  · nlinarith [h05sq]
  · nlinarith [h06sq]
  · nlinarith [h07sq]
  · nlinarith [h08sq]
  · nlinarith [h12sq]
  · nlinarith [h13sq]
  · nlinarith [h15sq]
  · nlinarith [h16sq]

/-- The source-indexed five-row metric subsystem forces its anchors to collide. -/
theorem unit_core_sourceIndexed_654_anchor_collision
    {P0 P1 P2 P5 P9 P10 P11 : ℝ²}
    (h01 : dist P1 P0 = dist P1 P2)
    (h04 : dist P1 P0 = dist P1 P9)
    (h05 : dist P2 P0 = dist P2 P1)
    (h06 : dist P2 P0 = dist P2 P10)
    (h07 : dist P2 P0 = dist P2 P11)
    (h08 : dist P9 P0 = dist P9 P2)
    (h12 : dist P10 P5 = dist P10 P9)
    (h13 : dist P10 P5 = dist P10 P11)
    (h15 : dist P11 P1 = dist P11 P9)
    (h16 : dist P11 P1 = dist P11 P10) : P0 = P1 := by
  by_contra h01ne
  let T : ℝ² → ℝ² := normSim P0 P1
  let p2 := T P2
  let p5 := T P5
  let p9 := T P9
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
  apply normalized_unitCoreSourceIndexed654_incompatible
      (P2 := p2) (P5 := p5) (P9 := p9) (P10 := p10) (P11 := p11)
  · simpa [p2, hT0, hT1] using map_dist_eq h01
  · simpa [p9, hT0, hT1] using map_dist_eq h04
  · simpa [p2, hT0, hT1] using map_dist_eq h05
  · simpa [p2, p10, hT0] using map_dist_eq h06
  · simpa [p2, p11, hT0] using map_dist_eq h07
  · simpa [p2, p9, hT0] using map_dist_eq h08
  · simpa [p5, p9, p10] using map_dist_eq h12
  · simpa [p5, p10, p11] using map_dist_eq h13
  · simpa [p9, p11, hT1] using map_dist_eq h15
  · simpa [p10, p11, hT1] using map_dist_eq h16

/-- Equality-closure form of the source-indexed five-row anchor collision. -/
structure UnitCoreSourceIndexed654CollisionCore {alpha : Type*}
    (P : Census554.EqualityCore.RowPattern alpha) where
  P0 : alpha
  P1 : alpha
  P2 : alpha
  P5 : alpha
  P9 : alpha
  P10 : alpha
  P11 : alpha
  h01ne : P0 ≠ P1
  h01 : Census554.EqualityCore.EdgeClosure P (P1, P0) (P1, P2)
  h04 : Census554.EqualityCore.EdgeClosure P (P1, P0) (P1, P9)
  h05 : Census554.EqualityCore.EdgeClosure P (P2, P0) (P2, P1)
  h06 : Census554.EqualityCore.EdgeClosure P (P2, P0) (P2, P10)
  h07 : Census554.EqualityCore.EdgeClosure P (P2, P0) (P2, P11)
  h08 : Census554.EqualityCore.EdgeClosure P (P9, P0) (P9, P2)
  h12 : Census554.EqualityCore.EdgeClosure P (P10, P5) (P10, P9)
  h13 : Census554.EqualityCore.EdgeClosure P (P10, P5) (P10, P11)
  h15 : Census554.EqualityCore.EdgeClosure P (P11, P1) (P11, P9)
  h16 : Census554.EqualityCore.EdgeClosure P (P11, P1) (P11, P10)

/-- A matching equality-closure core has no injective planar realization. -/
theorem not_realizes_of_unitCoreSourceIndexed654CollisionCore
    {alpha : Type*} {P : Census554.EqualityCore.RowPattern alpha}
    (core : UnitCoreSourceIndexed654CollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Census554.EqualityCore.Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Census554.EqualityCore.Edge alpha}
      (h : Census554.EqualityCore.EdgeClosure P e f) :
      Census554.EqualityCore.edgeDist pointOf e =
        Census554.EqualityCore.edgeDist pointOf f :=
    Census554.EqualityCore.EdgeClosure.sound hreal h
  have hcollision := unit_core_sourceIndexed_654_anchor_collision
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h01)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h04)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h05)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h06)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h07)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h08)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h12)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h13)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h15)
    (by simpa [Census554.EqualityCore.edgeDist] using sound core.h16)
  exact core.h01ne (hreal.injective hcollision)

#print axioms normalizedUnitCoreSourceIndexed654Certificate
#print axioms unit_core_sourceIndexed_654_anchor_collision
#print axioms not_realizes_of_unitCoreSourceIndexed654CollisionCore

end ATailUniqueRowProducerScratch
end Problem97
