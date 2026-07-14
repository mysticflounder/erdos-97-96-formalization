/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Seven-point twin-four-circle collision core

This file isolates the second seven-point equality subsystem found by the exact
formalized-core-clean shard oracle.  The finite search only discovered the
motif; the theorem below is a standalone Euclidean statement forcing the two
normalization anchors to coincide.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem sevenPointTwinFourCircle_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

set_option maxHeartbeats 12000000 in
-- The kernel-checked Groebner certificate eliminates all eleven equations together.
/-- The normalized eleven-equality twin-four-circle system is inconsistent. -/
private theorem normalized_sevenPointTwinFourCircle_incompatible
    {O B C D F : ℝ²}
    (hOA_OB : dist O (pt 0 0) = dist O B)
    (hAO_AC : dist (pt 0 0) O = dist (pt 0 0) C)
    (hBA_BC : dist B (pt 0 0) = dist B C)
    (hBA_BE : dist B (pt 0 0) = dist B (pt 1 0))
    (hDO_DB : dist D O = dist D B)
    (hDO_DE : dist D O = dist D (pt 1 0))
    (hDO_DF : dist D O = dist D F)
    (hEA_EC : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) C)
    (hEA_ED : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) D)
    (hEA_EF : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) F)
    (hFO_FA : dist F O = dist F (pt 0 0)) : False := by
  have hOA_OBsq := congrArg (fun r : ℝ => r ^ 2) hOA_OB
  have hAO_ACsq := congrArg (fun r : ℝ => r ^ 2) hAO_AC
  have hBA_BCsq := congrArg (fun r : ℝ => r ^ 2) hBA_BC
  have hBA_BEsq := congrArg (fun r : ℝ => r ^ 2) hBA_BE
  have hDO_DBsq := congrArg (fun r : ℝ => r ^ 2) hDO_DB
  have hDO_DEsq := congrArg (fun r : ℝ => r ^ 2) hDO_DE
  have hDO_DFsq := congrArg (fun r : ℝ => r ^ 2) hDO_DF
  have hEA_ECsq := congrArg (fun r : ℝ => r ^ 2) hEA_EC
  have hEA_EDsq := congrArg (fun r : ℝ => r ^ 2) hEA_ED
  have hEA_EFsq := congrArg (fun r : ℝ => r ^ 2) hEA_EF
  have hFO_FAsq := congrArg (fun r : ℝ => r ^ 2) hFO_FA
  change dist O (pt 0 0) ^ 2 = dist O B ^ 2 at hOA_OBsq
  change dist (pt 0 0) O ^ 2 = dist (pt 0 0) C ^ 2 at hAO_ACsq
  change dist B (pt 0 0) ^ 2 = dist B C ^ 2 at hBA_BCsq
  change dist B (pt 0 0) ^ 2 = dist B (pt 1 0) ^ 2 at hBA_BEsq
  change dist D O ^ 2 = dist D B ^ 2 at hDO_DBsq
  change dist D O ^ 2 = dist D (pt 1 0) ^ 2 at hDO_DEsq
  change dist D O ^ 2 = dist D F ^ 2 at hDO_DFsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) C ^ 2 at hEA_ECsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) D ^ 2 at hEA_EDsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) F ^ 2 at hEA_EFsq
  change dist F O ^ 2 = dist F (pt 0 0) ^ 2 at hFO_FAsq
  rw [sevenPointTwinFourCircle_dist_sq_coord, sevenPointTwinFourCircle_dist_sq_coord]
    at hOA_OBsq hAO_ACsq hBA_BCsq hBA_BEsq hDO_DBsq hDO_DEsq hDO_DFsq
      hEA_ECsq hEA_EDsq hEA_EFsq hFO_FAsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hOA_OBsq hAO_ACsq hBA_BCsq hBA_BEsq hDO_DBsq hDO_DEsq hDO_DFsq
      hEA_ECsq hEA_EDsq hEA_EFsq hFO_FAsq
  grobner (ringSteps := 100000)

/-- The seven-point twin-four-circle equalities force the anchors `A` and `E` to collide. -/
theorem seven_point_twin_four_circle_collision
    {O A B C D E F : ℝ²}
    (hOA_OB : dist O A = dist O B)
    (hAO_AC : dist A O = dist A C)
    (hBA_BC : dist B A = dist B C)
    (hBA_BE : dist B A = dist B E)
    (hDO_DB : dist D O = dist D B)
    (hDO_DE : dist D O = dist D E)
    (hDO_DF : dist D O = dist D F)
    (hEA_EC : dist E A = dist E C)
    (hEA_ED : dist E A = dist E D)
    (hEA_EF : dist E A = dist E F)
    (hFO_FA : dist F O = dist F A) : A = E := by
  by_contra hAE
  let T : ℝ² → ℝ² := normSim A E
  let o := T O
  let b := T B
  let c := T C
  let d := T D
  let f := T F
  have hdist (X Y : ℝ²) :
      dist (T X) (T Y) = (dist A E)⁻¹ * dist X Y := by
    simpa [T] using normSim_dist_image A E hAE X Y
  have hT0 : T A = pt 0 0 := by
    simpa [T] using normSim_fst A E
  have hT1 : T E = pt 1 0 := by
    simpa [T] using normSim_snd A E hAE
  have map_dist_eq {X Y Z R : ℝ²} (h : dist X Y = dist Z R) :
      dist (T X) (T Y) = dist (T Z) (T R) := by
    rw [hdist, hdist, h]
  apply normalized_sevenPointTwinFourCircle_incompatible
      (O := o) (B := b) (C := c) (D := d) (F := f)
  · simpa [b, o, hT0] using map_dist_eq hOA_OB
  · simpa [c, o, hT0] using map_dist_eq hAO_AC
  · simpa [b, c, hT0] using map_dist_eq hBA_BC
  · simpa [b, hT0, hT1] using map_dist_eq hBA_BE
  · simpa [b, d, o] using map_dist_eq hDO_DB
  · simpa [d, o, hT1] using map_dist_eq hDO_DE
  · simpa [d, f, o] using map_dist_eq hDO_DF
  · simpa [c, hT0, hT1] using map_dist_eq hEA_EC
  · simpa [d, hT0, hT1] using map_dist_eq hEA_ED
  · simpa [f, hT0, hT1] using map_dist_eq hEA_EF
  · simpa [f, o, hT0] using map_dist_eq hFO_FA

/-- Equality-closure form of the seven-point twin-four-circle collision. -/
structure SevenPointTwinFourCircleCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  O : alpha
  A : alpha
  B : alpha
  C : alpha
  D : alpha
  E : alpha
  F : alpha
  hAE : A ≠ E
  OA_OB : EdgeClosure P (O, A) (O, B)
  AO_AC : EdgeClosure P (A, O) (A, C)
  BA_BC : EdgeClosure P (B, A) (B, C)
  BA_BE : EdgeClosure P (B, A) (B, E)
  DO_DB : EdgeClosure P (D, O) (D, B)
  DO_DE : EdgeClosure P (D, O) (D, E)
  DO_DF : EdgeClosure P (D, O) (D, F)
  EA_EC : EdgeClosure P (E, A) (E, C)
  EA_ED : EdgeClosure P (E, A) (E, D)
  EA_EF : EdgeClosure P (E, A) (E, F)
  FO_FA : EdgeClosure P (F, O) (F, A)

/-- A seven-point twin-four-circle collision core has no injective planar realization. -/
theorem not_realizes_of_sevenPointTwinFourCircleCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : SevenPointTwinFourCircleCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  have hcollision := seven_point_twin_four_circle_collision
    (by simpa [edgeDist] using sound core.OA_OB)
    (by simpa [edgeDist] using sound core.AO_AC)
    (by simpa [edgeDist] using sound core.BA_BC)
    (by simpa [edgeDist] using sound core.BA_BE)
    (by simpa [edgeDist] using sound core.DO_DB)
    (by simpa [edgeDist] using sound core.DO_DE)
    (by simpa [edgeDist] using sound core.DO_DF)
    (by simpa [edgeDist] using sound core.EA_EC)
    (by simpa [edgeDist] using sound core.EA_ED)
    (by simpa [edgeDist] using sound core.EA_EF)
    (by simpa [edgeDist] using sound core.FO_FA)
  exact core.hAE (hreal.injective hcollision)

end EqualityCore
end Census554
end Problem97
