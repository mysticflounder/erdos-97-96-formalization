/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Six-point circle-chain collision core

This file isolates the nine-equality obstruction extracted from the
formalized-core-clean ATAIL card-12 shadow.  The finite search only discovered
the pattern; the theorem below is independent of that search and proves that
the two anchor labels must coincide.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem sixPointCircleChain_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

set_option maxHeartbeats 8000000 in
-- The kernel-checked Groebner certificate simultaneously eliminates all nine distance equations.
/-- The normalized nine-equality circle-chain system is inconsistent. -/
private theorem normalized_sixPointCircleChain_incompatible
    {C D E F : ℝ²}
    (hBA_BC : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) C)
    (hBA_BD : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) D)
    (hCA_CB : dist C (pt 0 0) = dist C (pt 1 0))
    (hCA_CE : dist C (pt 0 0) = dist C E)
    (hCA_CF : dist C (pt 0 0) = dist C F)
    (hDC_DE : dist D C = dist D E)
    (hEA_EF : dist E (pt 0 0) = dist E F)
    (hFB_FD : dist F (pt 1 0) = dist F D)
    (hFB_FE : dist F (pt 1 0) = dist F E) : False := by
  have hBA_BCsq := congrArg (fun r : ℝ => r ^ 2) hBA_BC
  have hBA_BDsq := congrArg (fun r : ℝ => r ^ 2) hBA_BD
  have hCA_CBsq := congrArg (fun r : ℝ => r ^ 2) hCA_CB
  have hCA_CEsq := congrArg (fun r : ℝ => r ^ 2) hCA_CE
  have hCA_CFsq := congrArg (fun r : ℝ => r ^ 2) hCA_CF
  have hDC_DEsq := congrArg (fun r : ℝ => r ^ 2) hDC_DE
  have hEA_EFsq := congrArg (fun r : ℝ => r ^ 2) hEA_EF
  have hFB_FDsq := congrArg (fun r : ℝ => r ^ 2) hFB_FD
  have hFB_FEsq := congrArg (fun r : ℝ => r ^ 2) hFB_FE
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) C ^ 2 at hBA_BCsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) D ^ 2 at hBA_BDsq
  change dist C (pt 0 0) ^ 2 = dist C (pt 1 0) ^ 2 at hCA_CBsq
  change dist C (pt 0 0) ^ 2 = dist C E ^ 2 at hCA_CEsq
  change dist C (pt 0 0) ^ 2 = dist C F ^ 2 at hCA_CFsq
  change dist D C ^ 2 = dist D E ^ 2 at hDC_DEsq
  change dist E (pt 0 0) ^ 2 = dist E F ^ 2 at hEA_EFsq
  change dist F (pt 1 0) ^ 2 = dist F D ^ 2 at hFB_FDsq
  change dist F (pt 1 0) ^ 2 = dist F E ^ 2 at hFB_FEsq
  rw [sixPointCircleChain_dist_sq_coord, sixPointCircleChain_dist_sq_coord]
    at hBA_BCsq hBA_BDsq hCA_CBsq hCA_CEsq hCA_CFsq hDC_DEsq hEA_EFsq hFB_FDsq
      hFB_FEsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hBA_BCsq hBA_BDsq hCA_CBsq hCA_CEsq hCA_CFsq hDC_DEsq hEA_EFsq hFB_FDsq
      hFB_FEsq
  grobner (ringSteps := 100000)

/-- The six-point circle-chain equalities force the anchor labels to collide. -/
theorem six_point_circle_chain_collision
    {A B C D E F : ℝ²}
    (hBA_BC : dist B A = dist B C)
    (hBA_BD : dist B A = dist B D)
    (hCA_CB : dist C A = dist C B)
    (hCA_CE : dist C A = dist C E)
    (hCA_CF : dist C A = dist C F)
    (hDC_DE : dist D C = dist D E)
    (hEA_EF : dist E A = dist E F)
    (hFB_FD : dist F B = dist F D)
    (hFB_FE : dist F B = dist F E) : A = B := by
  by_contra hAB
  let T : ℝ² → ℝ² := normSim A B
  let c := T C
  let d := T D
  let e := T E
  let f := T F
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
  apply normalized_sixPointCircleChain_incompatible
      (C := c) (D := d) (E := e) (F := f)
  · simpa [c, hT0, hT1] using map_dist_eq hBA_BC
  · simpa [d, hT0, hT1] using map_dist_eq hBA_BD
  · simpa [c, hT0, hT1] using map_dist_eq hCA_CB
  · simpa [c, e, hT0] using map_dist_eq hCA_CE
  · simpa [c, f, hT0] using map_dist_eq hCA_CF
  · simpa [c, d, e] using map_dist_eq hDC_DE
  · simpa [e, f, hT0] using map_dist_eq hEA_EF
  · simpa [d, f, hT1] using map_dist_eq hFB_FD
  · simpa [e, f, hT1] using map_dist_eq hFB_FE

/-- Equality-closure form of the six-point circle-chain collision. -/
structure SixPointCircleChainCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  A : alpha
  B : alpha
  C : alpha
  D : alpha
  E : alpha
  F : alpha
  hAB : A ≠ B
  BA_BC : EdgeClosure P (B, A) (B, C)
  BA_BD : EdgeClosure P (B, A) (B, D)
  CA_CB : EdgeClosure P (C, A) (C, B)
  CA_CE : EdgeClosure P (C, A) (C, E)
  CA_CF : EdgeClosure P (C, A) (C, F)
  DC_DE : EdgeClosure P (D, C) (D, E)
  EA_EF : EdgeClosure P (E, A) (E, F)
  FB_FD : EdgeClosure P (F, B) (F, D)
  FB_FE : EdgeClosure P (F, B) (F, E)

/-- A six-point circle-chain collision core has no injective planar realization. -/
theorem not_realizes_of_sixPointCircleChainCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : SixPointCircleChainCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  have hcollision := six_point_circle_chain_collision
    (by simpa [edgeDist] using sound core.BA_BC)
    (by simpa [edgeDist] using sound core.BA_BD)
    (by simpa [edgeDist] using sound core.CA_CB)
    (by simpa [edgeDist] using sound core.CA_CE)
    (by simpa [edgeDist] using sound core.CA_CF)
    (by simpa [edgeDist] using sound core.DC_DE)
    (by simpa [edgeDist] using sound core.EA_EF)
    (by simpa [edgeDist] using sound core.FB_FD)
    (by simpa [edgeDist] using sound core.FB_FE)
  exact core.hAB (hreal.injective hcollision)

end EqualityCore
end Census554
end Problem97
