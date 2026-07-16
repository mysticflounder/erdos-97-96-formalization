/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Seven selected four-row anchor collision

This scratch file isolates the seven-row metric obstruction found in the
current fixed `(5,5,5)` continuation shadow.  The theorem is invariant: the
twenty-one row equalities force labels `0` and `1` to denote the same point.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSevenRowScratch

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

set_option maxHeartbeats 20000000 in
set_option maxRecDepth 100000 in
/-- The normalized twenty-one-equality system is inconsistent. -/
private theorem normalized_seven_row_incompatible
    {P2 P3 P5 P6 P7 P8 P9 P10 P11 : ℝ²}
    (h1_02 : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) P2)
    (h1_06 : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) P6)
    (h1_07 : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) P7)
    (h2_01 : dist P2 (pt 0 0) = dist P2 (pt 1 0))
    (h2_09 : dist P2 (pt 0 0) = dist P2 P9)
    (h2_0a : dist P2 (pt 0 0) = dist P2 P10)
    (h7_25 : dist P7 P2 = dist P7 P5)
    (h7_29 : dist P7 P2 = dist P7 P9)
    (h7_2b : dist P7 P2 = dist P7 P11)
    (h8_03 : dist P8 (pt 0 0) = dist P8 P3)
    (h8_05 : dist P8 (pt 0 0) = dist P8 P5)
    (h8_07 : dist P8 (pt 0 0) = dist P8 P7)
    (h9_36 : dist P9 P3 = dist P9 P6)
    (h9_38 : dist P9 P3 = dist P9 P8)
    (h9_3b : dist P9 P3 = dist P9 P11)
    (h10_17 : dist P10 (pt 1 0) = dist P10 P7)
    (h10_18 : dist P10 (pt 1 0) = dist P10 P8)
    (h10_19 : dist P10 (pt 1 0) = dist P10 P9)
    (h11_15 : dist P11 (pt 1 0) = dist P11 P5)
    (h11_16 : dist P11 (pt 1 0) = dist P11 P6)
    (h11_1a : dist P11 (pt 1 0) = dist P11 P10) : False := by
  have h1_02sq := congrArg (fun r : ℝ => r ^ 2) h1_02
  have h1_06sq := congrArg (fun r : ℝ => r ^ 2) h1_06
  have h1_07sq := congrArg (fun r : ℝ => r ^ 2) h1_07
  have h2_01sq := congrArg (fun r : ℝ => r ^ 2) h2_01
  have h2_09sq := congrArg (fun r : ℝ => r ^ 2) h2_09
  have h2_0asq := congrArg (fun r : ℝ => r ^ 2) h2_0a
  have h7_25sq := congrArg (fun r : ℝ => r ^ 2) h7_25
  have h7_29sq := congrArg (fun r : ℝ => r ^ 2) h7_29
  have h7_2bsq := congrArg (fun r : ℝ => r ^ 2) h7_2b
  have h8_03sq := congrArg (fun r : ℝ => r ^ 2) h8_03
  have h8_05sq := congrArg (fun r : ℝ => r ^ 2) h8_05
  have h8_07sq := congrArg (fun r : ℝ => r ^ 2) h8_07
  have h9_36sq := congrArg (fun r : ℝ => r ^ 2) h9_36
  have h9_38sq := congrArg (fun r : ℝ => r ^ 2) h9_38
  have h9_3bsq := congrArg (fun r : ℝ => r ^ 2) h9_3b
  have h10_17sq := congrArg (fun r : ℝ => r ^ 2) h10_17
  have h10_18sq := congrArg (fun r : ℝ => r ^ 2) h10_18
  have h10_19sq := congrArg (fun r : ℝ => r ^ 2) h10_19
  have h11_15sq := congrArg (fun r : ℝ => r ^ 2) h11_15
  have h11_16sq := congrArg (fun r : ℝ => r ^ 2) h11_16
  have h11_1asq := congrArg (fun r : ℝ => r ^ 2) h11_1a
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) P2 ^ 2 at h1_02sq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) P6 ^ 2 at h1_06sq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) P7 ^ 2 at h1_07sq
  change dist P2 (pt 0 0) ^ 2 = dist P2 (pt 1 0) ^ 2 at h2_01sq
  change dist P2 (pt 0 0) ^ 2 = dist P2 P9 ^ 2 at h2_09sq
  change dist P2 (pt 0 0) ^ 2 = dist P2 P10 ^ 2 at h2_0asq
  change dist P7 P2 ^ 2 = dist P7 P5 ^ 2 at h7_25sq
  change dist P7 P2 ^ 2 = dist P7 P9 ^ 2 at h7_29sq
  change dist P7 P2 ^ 2 = dist P7 P11 ^ 2 at h7_2bsq
  change dist P8 (pt 0 0) ^ 2 = dist P8 P3 ^ 2 at h8_03sq
  change dist P8 (pt 0 0) ^ 2 = dist P8 P5 ^ 2 at h8_05sq
  change dist P8 (pt 0 0) ^ 2 = dist P8 P7 ^ 2 at h8_07sq
  change dist P9 P3 ^ 2 = dist P9 P6 ^ 2 at h9_36sq
  change dist P9 P3 ^ 2 = dist P9 P8 ^ 2 at h9_38sq
  change dist P9 P3 ^ 2 = dist P9 P11 ^ 2 at h9_3bsq
  change dist P10 (pt 1 0) ^ 2 = dist P10 P7 ^ 2 at h10_17sq
  change dist P10 (pt 1 0) ^ 2 = dist P10 P8 ^ 2 at h10_18sq
  change dist P10 (pt 1 0) ^ 2 = dist P10 P9 ^ 2 at h10_19sq
  change dist P11 (pt 1 0) ^ 2 = dist P11 P5 ^ 2 at h11_15sq
  change dist P11 (pt 1 0) ^ 2 = dist P11 P6 ^ 2 at h11_16sq
  change dist P11 (pt 1 0) ^ 2 = dist P11 P10 ^ 2 at h11_1asq
  rw [dist_sq_coord, dist_sq_coord]
    at h1_02sq h1_06sq h1_07sq h2_01sq h2_09sq h2_0asq h7_25sq h7_29sq
      h7_2bsq h8_03sq h8_05sq h8_07sq h9_36sq h9_38sq h9_3bsq h10_17sq
      h10_18sq h10_19sq h11_15sq h11_16sq h11_1asq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at h1_02sq h1_06sq h1_07sq h2_01sq h2_09sq h2_0asq h7_25sq h7_29sq
      h7_2bsq h8_03sq h8_05sq h8_07sq h9_36sq h9_38sq h9_3bsq h10_17sq
      h10_18sq h10_19sq h11_15sq h11_16sq h11_1asq
  grobner (ringSteps := 1000000)

/-- The seven selected four-rows force their two anchor labels to collide. -/
theorem seven_row_anchor_collision
    {P0 P1 P2 P3 P5 P6 P7 P8 P9 P10 P11 : ℝ²}
    (h1_02 : dist P1 P0 = dist P1 P2)
    (h1_06 : dist P1 P0 = dist P1 P6)
    (h1_07 : dist P1 P0 = dist P1 P7)
    (h2_01 : dist P2 P0 = dist P2 P1)
    (h2_09 : dist P2 P0 = dist P2 P9)
    (h2_0a : dist P2 P0 = dist P2 P10)
    (h7_25 : dist P7 P2 = dist P7 P5)
    (h7_29 : dist P7 P2 = dist P7 P9)
    (h7_2b : dist P7 P2 = dist P7 P11)
    (h8_03 : dist P8 P0 = dist P8 P3)
    (h8_05 : dist P8 P0 = dist P8 P5)
    (h8_07 : dist P8 P0 = dist P8 P7)
    (h9_36 : dist P9 P3 = dist P9 P6)
    (h9_38 : dist P9 P3 = dist P9 P8)
    (h9_3b : dist P9 P3 = dist P9 P11)
    (h10_17 : dist P10 P1 = dist P10 P7)
    (h10_18 : dist P10 P1 = dist P10 P8)
    (h10_19 : dist P10 P1 = dist P10 P9)
    (h11_15 : dist P11 P1 = dist P11 P5)
    (h11_16 : dist P11 P1 = dist P11 P6)
    (h11_1a : dist P11 P1 = dist P11 P10) : P0 = P1 := by
  by_contra h01
  let T : ℝ² → ℝ² := normSim P0 P1
  let p2 := T P2
  let p3 := T P3
  let p5 := T P5
  let p6 := T P6
  let p7 := T P7
  let p8 := T P8
  let p9 := T P9
  let p10 := T P10
  let p11 := T P11
  have hdist (X Y : ℝ²) :
      dist (T X) (T Y) = (dist P0 P1)⁻¹ * dist X Y := by
    simpa [T] using normSim_dist_image P0 P1 h01 X Y
  have hT0 : T P0 = pt 0 0 := by
    simpa [T] using normSim_fst P0 P1
  have hT1 : T P1 = pt 1 0 := by
    simpa [T] using normSim_snd P0 P1 h01
  have map_dist_eq {X Y Z R : ℝ²} (h : dist X Y = dist Z R) :
      dist (T X) (T Y) = dist (T Z) (T R) := by
    rw [hdist, hdist, h]
  apply normalized_seven_row_incompatible
      (P2 := p2) (P3 := p3) (P5 := p5) (P6 := p6)
      (P7 := p7) (P8 := p8) (P9 := p9) (P10 := p10) (P11 := p11)
  · simpa [p2, hT0, hT1] using map_dist_eq h1_02
  · simpa [p6, hT0, hT1] using map_dist_eq h1_06
  · simpa [p7, hT0, hT1] using map_dist_eq h1_07
  · simpa [p2, hT0, hT1] using map_dist_eq h2_01
  · simpa [p2, p9, hT0] using map_dist_eq h2_09
  · simpa [p2, p10, hT0] using map_dist_eq h2_0a
  · simpa [p2, p5, p7] using map_dist_eq h7_25
  · simpa [p2, p7, p9] using map_dist_eq h7_29
  · simpa [p2, p7, p11] using map_dist_eq h7_2b
  · simpa [p3, p8, hT0] using map_dist_eq h8_03
  · simpa [p5, p8, hT0] using map_dist_eq h8_05
  · simpa [p7, p8, hT0] using map_dist_eq h8_07
  · simpa [p3, p6, p9] using map_dist_eq h9_36
  · simpa [p3, p8, p9] using map_dist_eq h9_38
  · simpa [p3, p9, p11] using map_dist_eq h9_3b
  · simpa [p7, p10, hT1] using map_dist_eq h10_17
  · simpa [p8, p10, hT1] using map_dist_eq h10_18
  · simpa [p9, p10, hT1] using map_dist_eq h10_19
  · simpa [p5, p11, hT1] using map_dist_eq h11_15
  · simpa [p6, p11, hT1] using map_dist_eq h11_16
  · simpa [p10, p11, hT1] using map_dist_eq h11_1a

/-- Nondegenerate form consumed by a row-pattern producer. -/
theorem false_of_seven_rows
    {P0 P1 P2 P3 P5 P6 P7 P8 P9 P10 P11 : ℝ²}
    (h01 : P0 ≠ P1)
    (h1_02 : dist P1 P0 = dist P1 P2)
    (h1_06 : dist P1 P0 = dist P1 P6)
    (h1_07 : dist P1 P0 = dist P1 P7)
    (h2_01 : dist P2 P0 = dist P2 P1)
    (h2_09 : dist P2 P0 = dist P2 P9)
    (h2_0a : dist P2 P0 = dist P2 P10)
    (h7_25 : dist P7 P2 = dist P7 P5)
    (h7_29 : dist P7 P2 = dist P7 P9)
    (h7_2b : dist P7 P2 = dist P7 P11)
    (h8_03 : dist P8 P0 = dist P8 P3)
    (h8_05 : dist P8 P0 = dist P8 P5)
    (h8_07 : dist P8 P0 = dist P8 P7)
    (h9_36 : dist P9 P3 = dist P9 P6)
    (h9_38 : dist P9 P3 = dist P9 P8)
    (h9_3b : dist P9 P3 = dist P9 P11)
    (h10_17 : dist P10 P1 = dist P10 P7)
    (h10_18 : dist P10 P1 = dist P10 P8)
    (h10_19 : dist P10 P1 = dist P10 P9)
    (h11_15 : dist P11 P1 = dist P11 P5)
    (h11_16 : dist P11 P1 = dist P11 P6)
    (h11_1a : dist P11 P1 = dist P11 P10) : False := by
  exact h01 (seven_row_anchor_collision h1_02 h1_06 h1_07 h2_01 h2_09 h2_0a
    h7_25 h7_29 h7_2b h8_03 h8_05 h8_07 h9_36 h9_38 h9_3b h10_17 h10_18
    h10_19 h11_15 h11_16 h11_1a)

#print axioms seven_row_anchor_collision
#print axioms false_of_seven_rows

end ATailSevenRowScratch
end Problem97
