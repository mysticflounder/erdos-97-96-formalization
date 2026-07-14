/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Seven-point five-circle collision core

This file isolates an eleven-equality obstruction from the metric-CEGAR cut
bank.  The finite run only discovered the motif; the theorem below is a
standalone Euclidean statement forcing the two anchor labels to coincide.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem sevenPointFiveCircle_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

set_option maxHeartbeats 12000000 in
-- The kernel-checked Groebner certificate eliminates all eleven distance equations together.
/-- The normalized eleven-equality five-circle system is inconsistent. -/
private theorem normalized_sevenPointFiveCircle_incompatible
    {C D E F G : ℝ²}
    (hBA_BC : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) C)
    (hBA_BD : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) D)
    (hCA_CB : dist C (pt 0 0) = dist C (pt 1 0))
    (hCA_CE : dist C (pt 0 0) = dist C E)
    (hCA_CF : dist C (pt 0 0) = dist C F)
    (hDC_DG : dist D C = dist D G)
    (hDC_DF : dist D C = dist D F)
    (hEA_EG : dist E (pt 0 0) = dist E G)
    (hEA_EF : dist E (pt 0 0) = dist E F)
    (hFB_FD : dist F (pt 1 0) = dist F D)
    (hFB_FG : dist F (pt 1 0) = dist F G) : False := by
  have hBA_BCsq := congrArg (fun r : ℝ => r ^ 2) hBA_BC
  have hBA_BDsq := congrArg (fun r : ℝ => r ^ 2) hBA_BD
  have hCA_CBsq := congrArg (fun r : ℝ => r ^ 2) hCA_CB
  have hCA_CEsq := congrArg (fun r : ℝ => r ^ 2) hCA_CE
  have hCA_CFsq := congrArg (fun r : ℝ => r ^ 2) hCA_CF
  have hDC_DGsq := congrArg (fun r : ℝ => r ^ 2) hDC_DG
  have hDC_DFsq := congrArg (fun r : ℝ => r ^ 2) hDC_DF
  have hEA_EGsq := congrArg (fun r : ℝ => r ^ 2) hEA_EG
  have hEA_EFsq := congrArg (fun r : ℝ => r ^ 2) hEA_EF
  have hFB_FDsq := congrArg (fun r : ℝ => r ^ 2) hFB_FD
  have hFB_FGsq := congrArg (fun r : ℝ => r ^ 2) hFB_FG
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) C ^ 2 at hBA_BCsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) D ^ 2 at hBA_BDsq
  change dist C (pt 0 0) ^ 2 = dist C (pt 1 0) ^ 2 at hCA_CBsq
  change dist C (pt 0 0) ^ 2 = dist C E ^ 2 at hCA_CEsq
  change dist C (pt 0 0) ^ 2 = dist C F ^ 2 at hCA_CFsq
  change dist D C ^ 2 = dist D G ^ 2 at hDC_DGsq
  change dist D C ^ 2 = dist D F ^ 2 at hDC_DFsq
  change dist E (pt 0 0) ^ 2 = dist E G ^ 2 at hEA_EGsq
  change dist E (pt 0 0) ^ 2 = dist E F ^ 2 at hEA_EFsq
  change dist F (pt 1 0) ^ 2 = dist F D ^ 2 at hFB_FDsq
  change dist F (pt 1 0) ^ 2 = dist F G ^ 2 at hFB_FGsq
  rw [sevenPointFiveCircle_dist_sq_coord, sevenPointFiveCircle_dist_sq_coord]
    at hBA_BCsq hBA_BDsq hCA_CBsq hCA_CEsq hCA_CFsq hDC_DGsq hDC_DFsq hEA_EGsq
      hEA_EFsq hFB_FDsq hFB_FGsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hBA_BCsq hBA_BDsq hCA_CBsq hCA_CEsq hCA_CFsq hDC_DGsq hDC_DFsq hEA_EGsq
      hEA_EFsq hFB_FDsq hFB_FGsq
  let t : ℝ := (F 0 - 1) ^ 2 + F 1 ^ 2
  have htdef : t = (F 0 - 1) ^ 2 + F 1 ^ 2 := rfl
  have ht_nonneg : 0 ≤ t := by
    dsimp [t]
    positivity
  have hbase : (t + 1) * (t ^ 2 - 3 * t + 1) = 0 := by
    clear hCA_CEsq hDC_DGsq hEA_EGsq hEA_EFsq hFB_FGsq
    grobner (ringSteps := 100000)
  have htplus : t + 1 ≠ 0 := by
    nlinarith only [ht_nonneg]
  have hgolden : t ^ 2 - 3 * t + 1 = 0 :=
    (mul_eq_zero.mp hbase).resolve_left htplus
  have hother :
      4 * t ^ 12 + 7 * t ^ 11 - 146 * t ^ 10 - 20 * t ^ 9
        + 1678 * t ^ 8 - 3284 * t ^ 7 + 2669 * t ^ 6 - 1204 * t ^ 5
        + 371 * t ^ 4 - 88 * t ^ 3 + 14 * t ^ 2 - t = 0 := by
    clear hBA_BDsq hbase ht_nonneg htplus hgolden
    grobner (ringSteps := 100000)
  have hlinear : 13441 * t - 5134 = 0 := by
    clear hBA_BCsq hBA_BDsq hCA_CBsq hCA_CEsq hCA_CFsq hDC_DGsq hDC_DFsq
      hEA_EGsq hEA_EFsq hFB_FDsq hFB_FGsq htdef hbase ht_nonneg htplus
    grobner (ringSteps := 100000)
  nlinarith only [hgolden, hlinear]

/-- The seven-point five-circle equalities force the anchor labels to collide. -/
theorem seven_point_five_circle_collision
    {A B C D E F G : ℝ²}
    (hBA_BC : dist B A = dist B C)
    (hBA_BD : dist B A = dist B D)
    (hCA_CB : dist C A = dist C B)
    (hCA_CE : dist C A = dist C E)
    (hCA_CF : dist C A = dist C F)
    (hDC_DG : dist D C = dist D G)
    (hDC_DF : dist D C = dist D F)
    (hEA_EG : dist E A = dist E G)
    (hEA_EF : dist E A = dist E F)
    (hFB_FD : dist F B = dist F D)
    (hFB_FG : dist F B = dist F G) : A = B := by
  by_contra hAB
  let T : ℝ² → ℝ² := normSim A B
  let c := T C
  let d := T D
  let e := T E
  let f := T F
  let g := T G
  have hdist (X Y : ℝ²) :
      dist (T X) (T Y) = (dist A B)⁻¹ * dist X Y := by
    simpa [T] using normSim_dist_image A B hAB X Y
  have hT0 : T A = pt 0 0 := by
    simpa [T] using normSim_fst A B
  have hT1 : T B = pt 1 0 := by
    simpa [T] using normSim_snd A B hAB
  have map_dist_eq {X Y Z R : ℝ²} (h : dist X Y = dist Z R) :
      dist (T X) (T Y) = dist (T Z) (T R) := by
    rw [hdist, hdist, h]
  apply normalized_sevenPointFiveCircle_incompatible
      (C := c) (D := d) (E := e) (F := f) (G := g)
  · simpa [c, hT0, hT1] using map_dist_eq hBA_BC
  · simpa [d, hT0, hT1] using map_dist_eq hBA_BD
  · simpa [c, hT0, hT1] using map_dist_eq hCA_CB
  · simpa [c, e, hT0] using map_dist_eq hCA_CE
  · simpa [c, f, hT0] using map_dist_eq hCA_CF
  · simpa [c, d, g] using map_dist_eq hDC_DG
  · simpa [c, d, f] using map_dist_eq hDC_DF
  · simpa [e, g, hT0] using map_dist_eq hEA_EG
  · simpa [e, f, hT0] using map_dist_eq hEA_EF
  · simpa [d, f, hT1] using map_dist_eq hFB_FD
  · simpa [f, g, hT1] using map_dist_eq hFB_FG

/-- Equality-closure form of the seven-point five-circle collision. -/
structure SevenPointFiveCircleCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  A : alpha
  B : alpha
  C : alpha
  D : alpha
  E : alpha
  F : alpha
  G : alpha
  hAB : A ≠ B
  BA_BC : EdgeClosure P (B, A) (B, C)
  BA_BD : EdgeClosure P (B, A) (B, D)
  CA_CB : EdgeClosure P (C, A) (C, B)
  CA_CE : EdgeClosure P (C, A) (C, E)
  CA_CF : EdgeClosure P (C, A) (C, F)
  DC_DG : EdgeClosure P (D, C) (D, G)
  DC_DF : EdgeClosure P (D, C) (D, F)
  EA_EG : EdgeClosure P (E, A) (E, G)
  EA_EF : EdgeClosure P (E, A) (E, F)
  FB_FD : EdgeClosure P (F, B) (F, D)
  FB_FG : EdgeClosure P (F, B) (F, G)

/-- A seven-point five-circle collision core has no injective planar realization. -/
theorem not_realizes_of_sevenPointFiveCircleCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : SevenPointFiveCircleCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  have hcollision := seven_point_five_circle_collision
    (by simpa [edgeDist] using sound core.BA_BC)
    (by simpa [edgeDist] using sound core.BA_BD)
    (by simpa [edgeDist] using sound core.CA_CB)
    (by simpa [edgeDist] using sound core.CA_CE)
    (by simpa [edgeDist] using sound core.CA_CF)
    (by simpa [edgeDist] using sound core.DC_DG)
    (by simpa [edgeDist] using sound core.DC_DF)
    (by simpa [edgeDist] using sound core.EA_EG)
    (by simpa [edgeDist] using sound core.EA_EF)
    (by simpa [edgeDist] using sound core.FB_FD)
    (by simpa [edgeDist] using sound core.FB_FG)
  exact core.hAB (hreal.injective hcollision)

end EqualityCore
end Census554
end Problem97
