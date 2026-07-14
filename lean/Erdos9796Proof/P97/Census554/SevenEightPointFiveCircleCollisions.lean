/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Seven- and eight-point five-circle collision cores

These are the two remaining five-row equality motifs after the three
six-point five-circle collisions are removed from the exact shard frontier.
The finite census supplies only the motifs; both results below are standalone
Euclidean collision theorems.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem largeFiveCircle_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

set_option maxHeartbeats 6000000 in
-- The best anchor pair gives a compact exact eleven-polynomial UNIT certificate.
/-- Normalized seven-point five-circle system. -/
private theorem normalized_sevenPointFiveCircle_incompatible
    {B C D F G : ℝ²}
    (hAB_AC : dist (pt 0 0) B = dist (pt 0 0) C)
    (hAB_AD : dist (pt 0 0) B = dist (pt 0 0) D)
    (hBA_BC : dist B (pt 0 0) = dist B C)
    (hBA_BF : dist B (pt 0 0) = dist B F)
    (hBA_BE : dist B (pt 0 0) = dist B (pt 1 0))
    (hFC_FE : dist F C = dist F (pt 1 0))
    (hFC_FG : dist F C = dist F G)
    (hEA_ED : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) D)
    (hEA_EF : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) F)
    (hEA_EG : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) G)
    (hGA_GD : dist G (pt 0 0) = dist G D) : False := by
  have hAB_ACsq := congrArg (fun r : ℝ => r ^ 2) hAB_AC
  have hAB_ADsq := congrArg (fun r : ℝ => r ^ 2) hAB_AD
  have hBA_BCsq := congrArg (fun r : ℝ => r ^ 2) hBA_BC
  have hBA_BFsq := congrArg (fun r : ℝ => r ^ 2) hBA_BF
  have hBA_BEsq := congrArg (fun r : ℝ => r ^ 2) hBA_BE
  have hFC_FEsq := congrArg (fun r : ℝ => r ^ 2) hFC_FE
  have hFC_FGsq := congrArg (fun r : ℝ => r ^ 2) hFC_FG
  have hEA_EDsq := congrArg (fun r : ℝ => r ^ 2) hEA_ED
  have hEA_EFsq := congrArg (fun r : ℝ => r ^ 2) hEA_EF
  have hEA_EGsq := congrArg (fun r : ℝ => r ^ 2) hEA_EG
  have hGA_GDsq := congrArg (fun r : ℝ => r ^ 2) hGA_GD
  change dist (pt 0 0) B ^ 2 = dist (pt 0 0) C ^ 2 at hAB_ACsq
  change dist (pt 0 0) B ^ 2 = dist (pt 0 0) D ^ 2 at hAB_ADsq
  change dist B (pt 0 0) ^ 2 = dist B C ^ 2 at hBA_BCsq
  change dist B (pt 0 0) ^ 2 = dist B F ^ 2 at hBA_BFsq
  change dist B (pt 0 0) ^ 2 = dist B (pt 1 0) ^ 2 at hBA_BEsq
  change dist F C ^ 2 = dist F (pt 1 0) ^ 2 at hFC_FEsq
  change dist F C ^ 2 = dist F G ^ 2 at hFC_FGsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) D ^ 2 at hEA_EDsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) F ^ 2 at hEA_EFsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) G ^ 2 at hEA_EGsq
  change dist G (pt 0 0) ^ 2 = dist G D ^ 2 at hGA_GDsq
  rw [largeFiveCircle_dist_sq_coord, largeFiveCircle_dist_sq_coord]
    at hAB_ACsq hAB_ADsq hBA_BCsq hBA_BFsq hBA_BEsq hFC_FEsq hFC_FGsq
      hEA_EDsq hEA_EFsq hEA_EGsq hGA_GDsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hAB_ACsq hAB_ADsq hBA_BCsq hBA_BFsq hBA_BEsq hFC_FEsq hFC_FGsq
      hEA_EDsq hEA_EFsq hEA_EGsq hGA_GDsq
  grobner (ringSteps := 100000)

/-- The seven-point five-circle equalities force `A = E`. -/
theorem seven_point_five_circle_collision
    {A B C D E F G : ℝ²}
    (hAB_AC : dist A B = dist A C)
    (hAB_AD : dist A B = dist A D)
    (hBA_BC : dist B A = dist B C)
    (hBA_BF : dist B A = dist B F)
    (hBA_BE : dist B A = dist B E)
    (hFC_FE : dist F C = dist F E)
    (hFC_FG : dist F C = dist F G)
    (hEA_ED : dist E A = dist E D)
    (hEA_EF : dist E A = dist E F)
    (hEA_EG : dist E A = dist E G)
    (hGA_GD : dist G A = dist G D) : A = E := by
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
  apply normalized_sevenPointFiveCircle_incompatible
      (B := b) (C := c) (D := d) (F := f) (G := g)
  · simpa [b, c, hT0] using map_dist_eq hAB_AC
  · simpa [b, d, hT0] using map_dist_eq hAB_AD
  · simpa [b, c, hT0] using map_dist_eq hBA_BC
  · simpa [b, f, hT0] using map_dist_eq hBA_BF
  · simpa [b, hT0, hT1] using map_dist_eq hBA_BE
  · simpa [c, f, hT1] using map_dist_eq hFC_FE
  · simpa [c, f, g] using map_dist_eq hFC_FG
  · simpa [d, hT0, hT1] using map_dist_eq hEA_ED
  · simpa [f, hT0, hT1] using map_dist_eq hEA_EF
  · simpa [g, hT0, hT1] using map_dist_eq hEA_EG
  · simpa [d, g, hT0] using map_dist_eq hGA_GD

set_option maxHeartbeats 6000000 in
-- The best anchor pair gives a compact exact twelve-polynomial UNIT certificate.
/-- Normalized eight-point five-circle system. -/
private theorem normalized_eightPointFiveCircle_incompatible
    {O B C D F G : ℝ²}
    (hAO_AB : dist (pt 0 0) O = dist (pt 0 0) B)
    (hAO_AE : dist (pt 0 0) O = dist (pt 0 0) (pt 1 0))
    (hAO_AD : dist (pt 0 0) O = dist (pt 0 0) D)
    (hBO_BA : dist B O = dist B (pt 0 0))
    (hBO_BF : dist B O = dist B F)
    (hBO_BG : dist B O = dist B G)
    (hEB_ED : dist (pt 1 0) B = dist (pt 1 0) D)
    (hEB_EF : dist (pt 1 0) B = dist (pt 1 0) F)
    (hFC_FD : dist F C = dist F D)
    (hFC_FG : dist F C = dist F G)
    (hGA_GE : dist G (pt 0 0) = dist G (pt 1 0))
    (hGA_GF : dist G (pt 0 0) = dist G F) : False := by
  have hAO_ABsq := congrArg (fun r : ℝ => r ^ 2) hAO_AB
  have hAO_AEsq := congrArg (fun r : ℝ => r ^ 2) hAO_AE
  have hAO_ADsq := congrArg (fun r : ℝ => r ^ 2) hAO_AD
  have hBO_BAsq := congrArg (fun r : ℝ => r ^ 2) hBO_BA
  have hBO_BFsq := congrArg (fun r : ℝ => r ^ 2) hBO_BF
  have hBO_BGsq := congrArg (fun r : ℝ => r ^ 2) hBO_BG
  have hEB_EDsq := congrArg (fun r : ℝ => r ^ 2) hEB_ED
  have hEB_EFsq := congrArg (fun r : ℝ => r ^ 2) hEB_EF
  have hFC_FDsq := congrArg (fun r : ℝ => r ^ 2) hFC_FD
  have hFC_FGsq := congrArg (fun r : ℝ => r ^ 2) hFC_FG
  have hGA_GEsq := congrArg (fun r : ℝ => r ^ 2) hGA_GE
  have hGA_GFsq := congrArg (fun r : ℝ => r ^ 2) hGA_GF
  change dist (pt 0 0) O ^ 2 = dist (pt 0 0) B ^ 2 at hAO_ABsq
  change dist (pt 0 0) O ^ 2 = dist (pt 0 0) (pt 1 0) ^ 2 at hAO_AEsq
  change dist (pt 0 0) O ^ 2 = dist (pt 0 0) D ^ 2 at hAO_ADsq
  change dist B O ^ 2 = dist B (pt 0 0) ^ 2 at hBO_BAsq
  change dist B O ^ 2 = dist B F ^ 2 at hBO_BFsq
  change dist B O ^ 2 = dist B G ^ 2 at hBO_BGsq
  change dist (pt 1 0) B ^ 2 = dist (pt 1 0) D ^ 2 at hEB_EDsq
  change dist (pt 1 0) B ^ 2 = dist (pt 1 0) F ^ 2 at hEB_EFsq
  change dist F C ^ 2 = dist F D ^ 2 at hFC_FDsq
  change dist F C ^ 2 = dist F G ^ 2 at hFC_FGsq
  change dist G (pt 0 0) ^ 2 = dist G (pt 1 0) ^ 2 at hGA_GEsq
  change dist G (pt 0 0) ^ 2 = dist G F ^ 2 at hGA_GFsq
  rw [largeFiveCircle_dist_sq_coord, largeFiveCircle_dist_sq_coord]
    at hAO_ABsq hAO_AEsq hAO_ADsq hBO_BAsq hBO_BFsq hBO_BGsq hEB_EDsq
      hEB_EFsq hFC_FDsq hFC_FGsq hGA_GEsq hGA_GFsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hAO_ABsq hAO_AEsq hAO_ADsq hBO_BAsq hBO_BFsq hBO_BGsq hEB_EDsq
      hEB_EFsq hFC_FDsq hFC_FGsq hGA_GEsq hGA_GFsq
  grobner (ringSteps := 100000)

/-- The eight-point five-circle equalities force `A = E`. -/
theorem eight_point_five_circle_collision
    {O A B C D E F G : ℝ²}
    (hAO_AB : dist A O = dist A B)
    (hAO_AE : dist A O = dist A E)
    (hAO_AD : dist A O = dist A D)
    (hBO_BA : dist B O = dist B A)
    (hBO_BF : dist B O = dist B F)
    (hBO_BG : dist B O = dist B G)
    (hEB_ED : dist E B = dist E D)
    (hEB_EF : dist E B = dist E F)
    (hFC_FD : dist F C = dist F D)
    (hFC_FG : dist F C = dist F G)
    (hGA_GE : dist G A = dist G E)
    (hGA_GF : dist G A = dist G F) : A = E := by
  by_contra hAE
  let T : ℝ² → ℝ² := normSim A E
  let o := T O
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
  apply normalized_eightPointFiveCircle_incompatible
      (O := o) (B := b) (C := c) (D := d) (F := f) (G := g)
  · simpa [b, o, hT0] using map_dist_eq hAO_AB
  · simpa [o, hT0, hT1] using map_dist_eq hAO_AE
  · simpa [d, o, hT0] using map_dist_eq hAO_AD
  · simpa [b, o, hT0] using map_dist_eq hBO_BA
  · simpa [b, f, o] using map_dist_eq hBO_BF
  · simpa [b, g, o] using map_dist_eq hBO_BG
  · simpa [b, d, hT1] using map_dist_eq hEB_ED
  · simpa [b, f, hT1] using map_dist_eq hEB_EF
  · simpa [c, d, f] using map_dist_eq hFC_FD
  · simpa [c, f, g] using map_dist_eq hFC_FG
  · simpa [g, hT0, hT1] using map_dist_eq hGA_GE
  · simpa [f, g, hT0] using map_dist_eq hGA_GF

/-- Equality-closure form of the seven-point five-circle collision. -/
structure SevenPointFiveCircleCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  A : alpha
  B : alpha
  C : alpha
  D : alpha
  E : alpha
  F : alpha
  G : alpha
  hAE : A ≠ E
  AB_AC : EdgeClosure P (A, B) (A, C)
  AB_AD : EdgeClosure P (A, B) (A, D)
  BA_BC : EdgeClosure P (B, A) (B, C)
  BA_BF : EdgeClosure P (B, A) (B, F)
  BA_BE : EdgeClosure P (B, A) (B, E)
  FC_FE : EdgeClosure P (F, C) (F, E)
  FC_FG : EdgeClosure P (F, C) (F, G)
  EA_ED : EdgeClosure P (E, A) (E, D)
  EA_EF : EdgeClosure P (E, A) (E, F)
  EA_EG : EdgeClosure P (E, A) (E, G)
  GA_GD : EdgeClosure P (G, A) (G, D)

/-- Equality-closure form of the eight-point five-circle collision. -/
structure EightPointFiveCircleCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  O : alpha
  A : alpha
  B : alpha
  C : alpha
  D : alpha
  E : alpha
  F : alpha
  G : alpha
  hAE : A ≠ E
  AO_AB : EdgeClosure P (A, O) (A, B)
  AO_AE : EdgeClosure P (A, O) (A, E)
  AO_AD : EdgeClosure P (A, O) (A, D)
  BO_BA : EdgeClosure P (B, O) (B, A)
  BO_BF : EdgeClosure P (B, O) (B, F)
  BO_BG : EdgeClosure P (B, O) (B, G)
  EB_ED : EdgeClosure P (E, B) (E, D)
  EB_EF : EdgeClosure P (E, B) (E, F)
  FC_FD : EdgeClosure P (F, C) (F, D)
  FC_FG : EdgeClosure P (F, C) (F, G)
  GA_GE : EdgeClosure P (G, A) (G, E)
  GA_GF : EdgeClosure P (G, A) (G, F)

/-- Seven-point five-circle cores have no injective planar realization. -/
theorem not_realizes_of_sevenPointFiveCircleCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : SevenPointFiveCircleCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f := EdgeClosure.sound hreal h
  have hcollision := seven_point_five_circle_collision
    (by simpa [edgeDist] using sound core.AB_AC)
    (by simpa [edgeDist] using sound core.AB_AD)
    (by simpa [edgeDist] using sound core.BA_BC)
    (by simpa [edgeDist] using sound core.BA_BF)
    (by simpa [edgeDist] using sound core.BA_BE)
    (by simpa [edgeDist] using sound core.FC_FE)
    (by simpa [edgeDist] using sound core.FC_FG)
    (by simpa [edgeDist] using sound core.EA_ED)
    (by simpa [edgeDist] using sound core.EA_EF)
    (by simpa [edgeDist] using sound core.EA_EG)
    (by simpa [edgeDist] using sound core.GA_GD)
  exact core.hAE (hreal.injective hcollision)

/-- Eight-point five-circle cores have no injective planar realization. -/
theorem not_realizes_of_eightPointFiveCircleCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : EightPointFiveCircleCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f := EdgeClosure.sound hreal h
  have hcollision := eight_point_five_circle_collision
    (by simpa [edgeDist] using sound core.AO_AB)
    (by simpa [edgeDist] using sound core.AO_AE)
    (by simpa [edgeDist] using sound core.AO_AD)
    (by simpa [edgeDist] using sound core.BO_BA)
    (by simpa [edgeDist] using sound core.BO_BF)
    (by simpa [edgeDist] using sound core.BO_BG)
    (by simpa [edgeDist] using sound core.EB_ED)
    (by simpa [edgeDist] using sound core.EB_EF)
    (by simpa [edgeDist] using sound core.FC_FD)
    (by simpa [edgeDist] using sound core.FC_FG)
    (by simpa [edgeDist] using sound core.GA_GE)
    (by simpa [edgeDist] using sound core.GA_GF)
  exact core.hAE (hreal.injective hcollision)

end EqualityCore
end Census554
end Problem97
