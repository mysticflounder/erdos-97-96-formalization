/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Six-point two-pair collision core

This file formalizes the six-label equality motif recovered from Census-554
frontier iteration 1203.  The theorem is independent of that finite census:
nine distance equalities force one of two adjacent label pairs to collide.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem sixPointTwoPair_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

set_option maxHeartbeats 8000000 in
-- The two inverse-distance equations are the Rabinowitsch witnesses from the
-- independently verified exact Census-554 certificate.
/-- After normalizing `A` and `B`, the nine equalities are incompatible with
both prospective collision pairs remaining distinct. -/
private theorem normalized_sixPointTwoPair_incompatible
    {C D E F : ℝ²}
    (hAB_AC : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) C)
    (hAB_AE : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) E)
    (hFA_FC : dist F (pt 0 0) = dist F C)
    (hFA_FD : dist F (pt 0 0) = dist F D)
    (hFA_FE : dist F (pt 0 0) = dist F E)
    (hBD_BF : dist (pt 1 0) D = dist (pt 1 0) F)
    (hCB_CD : dist C (pt 1 0) = dist C D)
    (hEB_EC : dist E (pt 1 0) = dist E C)
    (hEB_ED : dist E (pt 1 0) = dist E D)
    (hDE : D ≠ E) (hEF : E ≠ F) : False := by
  have hABCsq := congrArg (fun r : ℝ => r ^ 2) hAB_AC
  have hABEsq := congrArg (fun r : ℝ => r ^ 2) hAB_AE
  have hFACsq := congrArg (fun r : ℝ => r ^ 2) hFA_FC
  have hFADsq := congrArg (fun r : ℝ => r ^ 2) hFA_FD
  have hFAEsq := congrArg (fun r : ℝ => r ^ 2) hFA_FE
  have hBDFsq := congrArg (fun r : ℝ => r ^ 2) hBD_BF
  have hCBDsq := congrArg (fun r : ℝ => r ^ 2) hCB_CD
  have hEBCsq := congrArg (fun r : ℝ => r ^ 2) hEB_EC
  have hEBDsq := congrArg (fun r : ℝ => r ^ 2) hEB_ED
  have hDEdist : dist D E ≠ 0 := dist_ne_zero.mpr hDE
  have hEFdist : dist E F ≠ 0 := dist_ne_zero.mpr hEF
  have hDErab : (dist D E ^ 2)⁻¹ * dist D E ^ 2 = 1 :=
    inv_mul_cancel₀ (pow_ne_zero 2 hDEdist)
  have hEFrab : (dist E F ^ 2)⁻¹ * dist E F ^ 2 = 1 :=
    inv_mul_cancel₀ (pow_ne_zero 2 hEFdist)
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) C ^ 2 at hABCsq
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) E ^ 2 at hABEsq
  change dist F (pt 0 0) ^ 2 = dist F C ^ 2 at hFACsq
  change dist F (pt 0 0) ^ 2 = dist F D ^ 2 at hFADsq
  change dist F (pt 0 0) ^ 2 = dist F E ^ 2 at hFAEsq
  change dist (pt 1 0) D ^ 2 = dist (pt 1 0) F ^ 2 at hBDFsq
  change dist C (pt 1 0) ^ 2 = dist C D ^ 2 at hCBDsq
  change dist E (pt 1 0) ^ 2 = dist E C ^ 2 at hEBCsq
  change dist E (pt 1 0) ^ 2 = dist E D ^ 2 at hEBDsq
  rw [sixPointTwoPair_dist_sq_coord, sixPointTwoPair_dist_sq_coord] at hABCsq
  rw [sixPointTwoPair_dist_sq_coord, sixPointTwoPair_dist_sq_coord] at hABEsq
  rw [sixPointTwoPair_dist_sq_coord, sixPointTwoPair_dist_sq_coord] at hFACsq
  rw [sixPointTwoPair_dist_sq_coord, sixPointTwoPair_dist_sq_coord] at hFADsq
  rw [sixPointTwoPair_dist_sq_coord, sixPointTwoPair_dist_sq_coord] at hFAEsq
  rw [sixPointTwoPair_dist_sq_coord, sixPointTwoPair_dist_sq_coord] at hBDFsq
  rw [sixPointTwoPair_dist_sq_coord, sixPointTwoPair_dist_sq_coord] at hCBDsq
  rw [sixPointTwoPair_dist_sq_coord, sixPointTwoPair_dist_sq_coord] at hEBCsq
  rw [sixPointTwoPair_dist_sq_coord, sixPointTwoPair_dist_sq_coord] at hEBDsq
  rw [sixPointTwoPair_dist_sq_coord] at hDErab hEFrab
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hABCsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hABEsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hFACsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hFADsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hFAEsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hBDFsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hCBDsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hEBCsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hEBDsq
  grobner (ringSteps := 100000)

/-- The six-point equality motif forces `D = E` or `E = F`. -/
theorem six_point_two_pair_collision
    {A B C D E F : ℝ²}
    (hAB : A ≠ B)
    (hAB_AC : dist A B = dist A C)
    (hAB_AE : dist A B = dist A E)
    (hFA_FC : dist F A = dist F C)
    (hFA_FD : dist F A = dist F D)
    (hFA_FE : dist F A = dist F E)
    (hBD_BF : dist B D = dist B F)
    (hCB_CD : dist C B = dist C D)
    (hEB_EC : dist E B = dist E C)
    (hEB_ED : dist E B = dist E D) : D = E ∨ E = F := by
  by_contra hcollision
  rcases not_or.mp hcollision with ⟨hDE, hEF⟩
  let T : ℝ² → ℝ² := normSim A B
  have hdist (X Y : ℝ²) :
      dist (T X) (T Y) = (dist A B)⁻¹ * dist X Y := by
    simpa [T] using normSim_dist_image A B hAB X Y
  have hT0 : T A = pt 0 0 := by
    simpa [T] using normSim_fst A B
  have hT1 : T B = pt 1 0 := by
    simpa [T] using normSim_snd A B hAB
  have hscale : (dist A B)⁻¹ ≠ 0 :=
    inv_ne_zero (dist_ne_zero.mpr hAB)
  have hTinj : Function.Injective T := by
    intro X Y hXY
    apply dist_eq_zero.mp
    have himage : dist (T X) (T Y) = 0 := dist_eq_zero.mpr hXY
    rw [hdist] at himage
    exact (mul_eq_zero.mp himage).resolve_left hscale
  have map_dist_eq {X Y Z R : ℝ²} (h : dist X Y = dist Z R) :
      dist (T X) (T Y) = dist (T Z) (T R) := by
    rw [hdist, hdist, h]
  apply normalized_sixPointTwoPair_incompatible
      (C := T C) (D := T D) (E := T E) (F := T F)
  · simpa [hT0, hT1] using map_dist_eq hAB_AC
  · simpa [hT0, hT1] using map_dist_eq hAB_AE
  · simpa [hT0] using map_dist_eq hFA_FC
  · simpa [hT0] using map_dist_eq hFA_FD
  · simpa [hT0] using map_dist_eq hFA_FE
  · simpa [hT1] using map_dist_eq hBD_BF
  · simpa [hT1] using map_dist_eq hCB_CD
  · simpa [hT1] using map_dist_eq hEB_EC
  · simpa [hT1] using map_dist_eq hEB_ED
  · exact fun h => hDE (hTinj h)
  · exact fun h => hEF (hTinj h)

/-- Equality-closure form of the six-point two-pair collision. -/
structure SixPointTwoPairCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  A : alpha
  B : alpha
  C : alpha
  D : alpha
  E : alpha
  F : alpha
  hAB : A ≠ B
  hDE : D ≠ E
  hEF : E ≠ F
  AB_AC : EdgeClosure P (A, B) (A, C)
  AB_AE : EdgeClosure P (A, B) (A, E)
  FA_FC : EdgeClosure P (F, A) (F, C)
  FA_FD : EdgeClosure P (F, A) (F, D)
  FA_FE : EdgeClosure P (F, A) (F, E)
  BD_BF : EdgeClosure P (B, D) (B, F)
  CB_CD : EdgeClosure P (C, B) (C, D)
  EB_EC : EdgeClosure P (E, B) (E, C)
  EB_ED : EdgeClosure P (E, B) (E, D)

/-- A six-point two-pair collision core has no injective planar realization. -/
theorem not_realizes_of_sixPointTwoPairCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : SixPointTwoPairCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  rcases six_point_two_pair_collision
      (fun h => core.hAB (hreal.injective h))
      (by simpa [edgeDist] using sound core.AB_AC)
      (by simpa [edgeDist] using sound core.AB_AE)
      (by simpa [edgeDist] using sound core.FA_FC)
      (by simpa [edgeDist] using sound core.FA_FD)
      (by simpa [edgeDist] using sound core.FA_FE)
      (by simpa [edgeDist] using sound core.BD_BF)
      (by simpa [edgeDist] using sound core.CB_CD)
      (by simpa [edgeDist] using sound core.EB_EC)
      (by simpa [edgeDist] using sound core.EB_ED) with hDE | hEF
  · exact core.hDE (hreal.injective hDE)
  · exact core.hEF (hreal.injective hEF)

end EqualityCore
end Census554
end Problem97
