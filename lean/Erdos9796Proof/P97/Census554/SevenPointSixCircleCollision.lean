/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Seven-point six-circle collision core

This file isolates the smallest new equality subsystem found by the exact
formalized-core-clean shard oracle.  The finite search only discovered the
motif; the theorem below is a standalone Euclidean statement forcing the two
anchor labels to coincide.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem sevenPointSixCircle_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

set_option maxHeartbeats 12000000 in
-- The kernel-checked Groebner certificate eliminates all eleven equations together.
/-- The normalized eleven-equality six-circle system is inconsistent. -/
private theorem normalized_sevenPointSixCircle_incompatible
    {B C D E F : ℝ²}
    (hOA_OB : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) B)
    (hBO_BA : dist B (pt 0 0) = dist B (pt 1 0))
    (hBO_BD : dist B (pt 0 0) = dist B D)
    (hBO_BE : dist B (pt 0 0) = dist B E)
    (hCO_CB : dist C (pt 0 0) = dist C B)
    (hCO_CF : dist C (pt 0 0) = dist C F)
    (hDB_DC : dist D B = dist D C)
    (hDB_DE : dist D B = dist D E)
    (hEO_EA : dist E (pt 0 0) = dist E (pt 1 0))
    (hFA_FC : dist F (pt 1 0) = dist F C)
    (hFA_FE : dist F (pt 1 0) = dist F E) : False := by
  have hOA_OBsq := congrArg (fun r : ℝ => r ^ 2) hOA_OB
  have hBO_BAsq := congrArg (fun r : ℝ => r ^ 2) hBO_BA
  have hBO_BDsq := congrArg (fun r : ℝ => r ^ 2) hBO_BD
  have hBO_BEsq := congrArg (fun r : ℝ => r ^ 2) hBO_BE
  have hCO_CBsq := congrArg (fun r : ℝ => r ^ 2) hCO_CB
  have hCO_CFsq := congrArg (fun r : ℝ => r ^ 2) hCO_CF
  have hDB_DCsq := congrArg (fun r : ℝ => r ^ 2) hDB_DC
  have hDB_DEsq := congrArg (fun r : ℝ => r ^ 2) hDB_DE
  have hEO_EAsq := congrArg (fun r : ℝ => r ^ 2) hEO_EA
  have hFA_FCsq := congrArg (fun r : ℝ => r ^ 2) hFA_FC
  have hFA_FEsq := congrArg (fun r : ℝ => r ^ 2) hFA_FE
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) B ^ 2 at hOA_OBsq
  change dist B (pt 0 0) ^ 2 = dist B (pt 1 0) ^ 2 at hBO_BAsq
  change dist B (pt 0 0) ^ 2 = dist B D ^ 2 at hBO_BDsq
  change dist B (pt 0 0) ^ 2 = dist B E ^ 2 at hBO_BEsq
  change dist C (pt 0 0) ^ 2 = dist C B ^ 2 at hCO_CBsq
  change dist C (pt 0 0) ^ 2 = dist C F ^ 2 at hCO_CFsq
  change dist D B ^ 2 = dist D C ^ 2 at hDB_DCsq
  change dist D B ^ 2 = dist D E ^ 2 at hDB_DEsq
  change dist E (pt 0 0) ^ 2 = dist E (pt 1 0) ^ 2 at hEO_EAsq
  change dist F (pt 1 0) ^ 2 = dist F C ^ 2 at hFA_FCsq
  change dist F (pt 1 0) ^ 2 = dist F E ^ 2 at hFA_FEsq
  rw [sevenPointSixCircle_dist_sq_coord, sevenPointSixCircle_dist_sq_coord]
    at hOA_OBsq hBO_BAsq hBO_BDsq hBO_BEsq hCO_CBsq hCO_CFsq hDB_DCsq hDB_DEsq
      hEO_EAsq hFA_FCsq hFA_FEsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hOA_OBsq hBO_BAsq hBO_BDsq hBO_BEsq hCO_CBsq hCO_CFsq hDB_DCsq hDB_DEsq
      hEO_EAsq hFA_FCsq hFA_FEsq
  grobner (ringSteps := 100000)

/-- The seven-point six-circle equalities force the anchor labels to collide. -/
theorem seven_point_six_circle_collision
    {O A B C D E F : ℝ²}
    (hOA_OB : dist O A = dist O B)
    (hBO_BA : dist B O = dist B A)
    (hBO_BD : dist B O = dist B D)
    (hBO_BE : dist B O = dist B E)
    (hCO_CB : dist C O = dist C B)
    (hCO_CF : dist C O = dist C F)
    (hDB_DC : dist D B = dist D C)
    (hDB_DE : dist D B = dist D E)
    (hEO_EA : dist E O = dist E A)
    (hFA_FC : dist F A = dist F C)
    (hFA_FE : dist F A = dist F E) : O = A := by
  by_contra hOA
  let T : ℝ² → ℝ² := normSim O A
  let b := T B
  let c := T C
  let d := T D
  let e := T E
  let f := T F
  have hdist (X Y : ℝ²) :
      dist (T X) (T Y) = (dist O A)⁻¹ * dist X Y := by
    simpa [T] using normSim_dist_image O A hOA X Y
  have hT0 : T O = pt 0 0 := by
    simpa [T] using normSim_fst O A
  have hT1 : T A = pt 1 0 := by
    simpa [T] using normSim_snd O A hOA
  have map_dist_eq {X Y Z R : ℝ²} (h : dist X Y = dist Z R) :
      dist (T X) (T Y) = dist (T Z) (T R) := by
    rw [hdist, hdist, h]
  apply normalized_sevenPointSixCircle_incompatible
      (B := b) (C := c) (D := d) (E := e) (F := f)
  · simpa [b, hT0, hT1] using map_dist_eq hOA_OB
  · simpa [b, hT0, hT1] using map_dist_eq hBO_BA
  · simpa [b, d, hT0] using map_dist_eq hBO_BD
  · simpa [b, e, hT0] using map_dist_eq hBO_BE
  · simpa [b, c, hT0] using map_dist_eq hCO_CB
  · simpa [c, f, hT0] using map_dist_eq hCO_CF
  · simpa [b, c, d] using map_dist_eq hDB_DC
  · simpa [b, d, e] using map_dist_eq hDB_DE
  · simpa [e, hT0, hT1] using map_dist_eq hEO_EA
  · simpa [c, f, hT1] using map_dist_eq hFA_FC
  · simpa [e, f, hT1] using map_dist_eq hFA_FE

/-- Equality-closure form of the seven-point six-circle collision. -/
structure SevenPointSixCircleCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  O : alpha
  A : alpha
  B : alpha
  C : alpha
  D : alpha
  E : alpha
  F : alpha
  hOA : O ≠ A
  OA_OB : EdgeClosure P (O, A) (O, B)
  BO_BA : EdgeClosure P (B, O) (B, A)
  BO_BD : EdgeClosure P (B, O) (B, D)
  BO_BE : EdgeClosure P (B, O) (B, E)
  CO_CB : EdgeClosure P (C, O) (C, B)
  CO_CF : EdgeClosure P (C, O) (C, F)
  DB_DC : EdgeClosure P (D, B) (D, C)
  DB_DE : EdgeClosure P (D, B) (D, E)
  EO_EA : EdgeClosure P (E, O) (E, A)
  FA_FC : EdgeClosure P (F, A) (F, C)
  FA_FE : EdgeClosure P (F, A) (F, E)

/-- A seven-point six-circle collision core has no injective planar realization. -/
theorem not_realizes_of_sevenPointSixCircleCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : SevenPointSixCircleCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  have hcollision := seven_point_six_circle_collision
    (by simpa [edgeDist] using sound core.OA_OB)
    (by simpa [edgeDist] using sound core.BO_BA)
    (by simpa [edgeDist] using sound core.BO_BD)
    (by simpa [edgeDist] using sound core.BO_BE)
    (by simpa [edgeDist] using sound core.CO_CB)
    (by simpa [edgeDist] using sound core.CO_CF)
    (by simpa [edgeDist] using sound core.DB_DC)
    (by simpa [edgeDist] using sound core.DB_DE)
    (by simpa [edgeDist] using sound core.EO_EA)
    (by simpa [edgeDist] using sound core.FA_FC)
    (by simpa [edgeDist] using sound core.FA_FE)
  exact core.hOA (hreal.injective hcollision)

end EqualityCore
end Census554
end Problem97
