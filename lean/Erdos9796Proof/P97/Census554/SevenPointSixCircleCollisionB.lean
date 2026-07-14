/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificate

/-!
# Second seven-point six-circle collision core

This is the smallest equality subsystem in the next exact shard frontier after
all five-row motifs have been removed.  The finite search only discovered the
motif; the theorem below is a standalone Euclidean collision statement.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem sevenPointSixCircleB_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

-- The best normalization pair has an exact eleven-polynomial UNIT certificate.
/-- The normalized second eleven-equality six-circle system is inconsistent. -/
private theorem normalized_sevenPointSixCircleB_incompatible
    {B C D F G : ℝ²}
    (hAE_AB : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) B)
    (hEA_EC : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) C)
    (hCA_CB : dist C (pt 0 0) = dist C B)
    (hCA_CD : dist C (pt 0 0) = dist C D)
    (hFE_FC : dist F (pt 1 0) = dist F C)
    (hFE_FG : dist F (pt 1 0) = dist F G)
    (hFE_FD : dist F (pt 1 0) = dist F D)
    (hGA_GE : dist G (pt 0 0) = dist G (pt 1 0))
    (hGA_GF : dist G (pt 0 0) = dist G F)
    (hDA_DB : dist D (pt 0 0) = dist D B)
    (hDA_DG : dist D (pt 0 0) = dist D G) : False := by
  have hAE_ABsq := congrArg (fun r : ℝ => r ^ 2) hAE_AB
  have hEA_ECsq := congrArg (fun r : ℝ => r ^ 2) hEA_EC
  have hCA_CBsq := congrArg (fun r : ℝ => r ^ 2) hCA_CB
  have hCA_CDsq := congrArg (fun r : ℝ => r ^ 2) hCA_CD
  have hFE_FCsq := congrArg (fun r : ℝ => r ^ 2) hFE_FC
  have hFE_FGsq := congrArg (fun r : ℝ => r ^ 2) hFE_FG
  have hFE_FDsq := congrArg (fun r : ℝ => r ^ 2) hFE_FD
  have hGA_GEsq := congrArg (fun r : ℝ => r ^ 2) hGA_GE
  have hGA_GFsq := congrArg (fun r : ℝ => r ^ 2) hGA_GF
  have hDA_DBsq := congrArg (fun r : ℝ => r ^ 2) hDA_DB
  have hDA_DGsq := congrArg (fun r : ℝ => r ^ 2) hDA_DG
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) B ^ 2 at hAE_ABsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) C ^ 2 at hEA_ECsq
  change dist C (pt 0 0) ^ 2 = dist C B ^ 2 at hCA_CBsq
  change dist C (pt 0 0) ^ 2 = dist C D ^ 2 at hCA_CDsq
  change dist F (pt 1 0) ^ 2 = dist F C ^ 2 at hFE_FCsq
  change dist F (pt 1 0) ^ 2 = dist F G ^ 2 at hFE_FGsq
  change dist F (pt 1 0) ^ 2 = dist F D ^ 2 at hFE_FDsq
  change dist G (pt 0 0) ^ 2 = dist G (pt 1 0) ^ 2 at hGA_GEsq
  change dist G (pt 0 0) ^ 2 = dist G F ^ 2 at hGA_GFsq
  change dist D (pt 0 0) ^ 2 = dist D B ^ 2 at hDA_DBsq
  change dist D (pt 0 0) ^ 2 = dist D G ^ 2 at hDA_DGsq
  rw [sevenPointSixCircleB_dist_sq_coord, sevenPointSixCircleB_dist_sq_coord]
    at hAE_ABsq hEA_ECsq hCA_CBsq hCA_CDsq hFE_FCsq hFE_FGsq hFE_FDsq
      hGA_GEsq hGA_GFsq hDA_DBsq hDA_DGsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hAE_ABsq hEA_ECsq hCA_CBsq hCA_CDsq hFE_FCsq hFE_FGsq hFE_FDsq
      hGA_GEsq hGA_GFsq hDA_DBsq hDA_DGsq
  have hp1 : -(B 0) ^ 2 - (B 1) ^ 2 + 1 = 0 := by
    nlinarith only [hAE_ABsq]
  have hp2 : -(C 0) ^ 2 + 2 * C 0 - (C 1) ^ 2 = 0 := by
    nlinarith only [hEA_ECsq]
  have hp3 :
      -(B 0) ^ 2 + 2 * B 0 * C 0 - (B 1) ^ 2 + 2 * B 1 * C 1 = 0 := by
    nlinarith only [hCA_CBsq]
  have hp4 :
      2 * C 0 * D 0 + 2 * C 1 * D 1 - (D 0) ^ 2 - (D 1) ^ 2 = 0 := by
    nlinarith only [hCA_CDsq]
  have hp5 :
      -(C 0) ^ 2 + 2 * C 0 * F 0 - (C 1) ^ 2 + 2 * C 1 * F 1
        - 2 * F 0 + 1 = 0 := by
    nlinarith only [hFE_FCsq]
  have hp6 :
      2 * F 0 * G 0 - 2 * F 0 + 2 * F 1 * G 1
        - (G 0) ^ 2 - (G 1) ^ 2 + 1 = 0 := by
    nlinarith only [hFE_FGsq]
  have hp7 :
      2 * F 0 * D 0 - 2 * F 0 + 2 * F 1 * D 1
        - (D 0) ^ 2 - (D 1) ^ 2 + 1 = 0 := by
    nlinarith only [hFE_FDsq]
  have hp8 : 2 * G 0 - 1 = 0 := by
    nlinarith only [hGA_GEsq]
  have hp9 :
      -(F 0) ^ 2 + 2 * F 0 * G 0 - (F 1) ^ 2 + 2 * F 1 * G 1 = 0 := by
    nlinarith only [hGA_GFsq]
  have hp10 :
      -(B 0) ^ 2 + 2 * B 0 * D 0 - (B 1) ^ 2 + 2 * B 1 * D 1 = 0 := by
    nlinarith only [hDA_DBsq]
  have hp11 :
      -(G 0) ^ 2 + 2 * G 0 * D 0 - (G 1) ^ 2 + 2 * G 1 * D 1 = 0 := by
    nlinarith only [hDA_DGsq]
  exact normalizedSevenPointSixCircleBUnitCertificate
    (B 0) (B 1) (C 0) (C 1) (F 0) (F 1) (G 0) (G 1) (D 0) (D 1)
    hp1 hp2 hp3 hp4 hp5 hp6 hp7 hp8 hp9 hp10 hp11

/-- The second seven-point six-circle motif forces `A = E`. -/
theorem seven_point_six_circle_collision_b
    {A B C D E F G : ℝ²}
    (hAE_AB : dist A E = dist A B)
    (hEA_EC : dist E A = dist E C)
    (hCA_CB : dist C A = dist C B)
    (hCA_CD : dist C A = dist C D)
    (hFE_FC : dist F E = dist F C)
    (hFE_FG : dist F E = dist F G)
    (hFE_FD : dist F E = dist F D)
    (hGA_GE : dist G A = dist G E)
    (hGA_GF : dist G A = dist G F)
    (hDA_DB : dist D A = dist D B)
    (hDA_DG : dist D A = dist D G) : A = E := by
  by_contra hAE
  let T : ℝ² → ℝ² := normSim A E
  let b := T B
  let c := T C
  let d := T D
  let f := T F
  let g := T G
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
  apply normalized_sevenPointSixCircleB_incompatible
      (B := b) (C := c) (D := d) (F := f) (G := g)
  · simpa [b, hT0, hT1] using map_dist_eq hAE_AB
  · simpa [c, hT0, hT1] using map_dist_eq hEA_EC
  · simpa [b, c, hT0] using map_dist_eq hCA_CB
  · simpa [c, d, hT0] using map_dist_eq hCA_CD
  · simpa [c, f, hT1] using map_dist_eq hFE_FC
  · simpa [f, g, hT1] using map_dist_eq hFE_FG
  · simpa [d, f, hT1] using map_dist_eq hFE_FD
  · simpa [g, hT0, hT1] using map_dist_eq hGA_GE
  · simpa [f, g, hT0] using map_dist_eq hGA_GF
  · simpa [b, d, hT0] using map_dist_eq hDA_DB
  · simpa [d, g, hT0] using map_dist_eq hDA_DG

/-- Equality-closure form of the second seven-point six-circle collision. -/
structure SevenPointSixCircleCollisionCoreB {alpha : Type*} (P : RowPattern alpha) where
  A : alpha
  B : alpha
  C : alpha
  D : alpha
  E : alpha
  F : alpha
  G : alpha
  hAE : A ≠ E
  AE_AB : EdgeClosure P (A, E) (A, B)
  EA_EC : EdgeClosure P (E, A) (E, C)
  CA_CB : EdgeClosure P (C, A) (C, B)
  CA_CD : EdgeClosure P (C, A) (C, D)
  FE_FC : EdgeClosure P (F, E) (F, C)
  FE_FG : EdgeClosure P (F, E) (F, G)
  FE_FD : EdgeClosure P (F, E) (F, D)
  GA_GE : EdgeClosure P (G, A) (G, E)
  GA_GF : EdgeClosure P (G, A) (G, F)
  DA_DB : EdgeClosure P (D, A) (D, B)
  DA_DG : EdgeClosure P (D, A) (D, G)

/-- A second seven-point six-circle core has no injective planar realization. -/
theorem not_realizes_of_sevenPointSixCircleCollisionCoreB
    {alpha : Type*} {P : RowPattern alpha}
    (core : SevenPointSixCircleCollisionCoreB P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  have hcollision := seven_point_six_circle_collision_b
    (by simpa [edgeDist] using sound core.AE_AB)
    (by simpa [edgeDist] using sound core.EA_EC)
    (by simpa [edgeDist] using sound core.CA_CB)
    (by simpa [edgeDist] using sound core.CA_CD)
    (by simpa [edgeDist] using sound core.FE_FC)
    (by simpa [edgeDist] using sound core.FE_FG)
    (by simpa [edgeDist] using sound core.FE_FD)
    (by simpa [edgeDist] using sound core.GA_GE)
    (by simpa [edgeDist] using sound core.GA_GF)
    (by simpa [edgeDist] using sound core.DA_DB)
    (by simpa [edgeDist] using sound core.DA_DG)
  exact core.hAE (hreal.injective hcollision)

end EqualityCore
end Census554
end Problem97
