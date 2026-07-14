/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Six-point five-circle collision cores

This file formalizes the three non-isomorphic nine-equality systems mined from
the five-row exact frontier cores.  The census supplies only the motifs; each
theorem below is a standalone Euclidean statement forcing the same two anchor
labels to coincide.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem sixPointFiveCircle_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

set_option maxHeartbeats 4000000 in
-- The exact frontier certificate gives a compact nine-polynomial UNIT ideal.
/-- Normalized form of six-point five-circle collision A. -/
private theorem normalized_sixPointFiveCircleA_incompatible
    {O B C F : ℝ²}
    (hOA_OB : dist O (pt 0 0) = dist O B)
    (hAO_AB : dist (pt 0 0) O = dist (pt 0 0) B)
    (hAO_AC : dist (pt 0 0) O = dist (pt 0 0) C)
    (hAO_AE : dist (pt 0 0) O = dist (pt 0 0) (pt 1 0))
    (hCB_CE : dist C B = dist C (pt 1 0))
    (hCB_CF : dist C B = dist C F)
    (hEO_EC : dist (pt 1 0) O = dist (pt 1 0) C)
    (hEO_EF : dist (pt 1 0) O = dist (pt 1 0) F)
    (hFO_FA : dist F O = dist F (pt 0 0)) : False := by
  have hOA_OBsq := congrArg (fun r : ℝ => r ^ 2) hOA_OB
  have hAO_ABsq := congrArg (fun r : ℝ => r ^ 2) hAO_AB
  have hAO_ACsq := congrArg (fun r : ℝ => r ^ 2) hAO_AC
  have hAO_AEsq := congrArg (fun r : ℝ => r ^ 2) hAO_AE
  have hCB_CEsq := congrArg (fun r : ℝ => r ^ 2) hCB_CE
  have hCB_CFsq := congrArg (fun r : ℝ => r ^ 2) hCB_CF
  have hEO_ECsq := congrArg (fun r : ℝ => r ^ 2) hEO_EC
  have hEO_EFsq := congrArg (fun r : ℝ => r ^ 2) hEO_EF
  have hFO_FAsq := congrArg (fun r : ℝ => r ^ 2) hFO_FA
  change dist O (pt 0 0) ^ 2 = dist O B ^ 2 at hOA_OBsq
  change dist (pt 0 0) O ^ 2 = dist (pt 0 0) B ^ 2 at hAO_ABsq
  change dist (pt 0 0) O ^ 2 = dist (pt 0 0) C ^ 2 at hAO_ACsq
  change dist (pt 0 0) O ^ 2 = dist (pt 0 0) (pt 1 0) ^ 2 at hAO_AEsq
  change dist C B ^ 2 = dist C (pt 1 0) ^ 2 at hCB_CEsq
  change dist C B ^ 2 = dist C F ^ 2 at hCB_CFsq
  change dist (pt 1 0) O ^ 2 = dist (pt 1 0) C ^ 2 at hEO_ECsq
  change dist (pt 1 0) O ^ 2 = dist (pt 1 0) F ^ 2 at hEO_EFsq
  change dist F O ^ 2 = dist F (pt 0 0) ^ 2 at hFO_FAsq
  rw [sixPointFiveCircle_dist_sq_coord, sixPointFiveCircle_dist_sq_coord]
    at hOA_OBsq hAO_ABsq hAO_ACsq hAO_AEsq hCB_CEsq hCB_CFsq hEO_ECsq
      hEO_EFsq hFO_FAsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hOA_OBsq hAO_ABsq hAO_ACsq hAO_AEsq hCB_CEsq hCB_CFsq hEO_ECsq
      hEO_EFsq hFO_FAsq
  grobner (ringSteps := 100000)

/-- Collision A: a four-point `A`-circle linked to two three-point circles. -/
theorem six_point_five_circle_collision_a
    {O A B C E F : ℝ²}
    (hOA_OB : dist O A = dist O B)
    (hAO_AB : dist A O = dist A B)
    (hAO_AC : dist A O = dist A C)
    (hAO_AE : dist A O = dist A E)
    (hCB_CE : dist C B = dist C E)
    (hCB_CF : dist C B = dist C F)
    (hEO_EC : dist E O = dist E C)
    (hEO_EF : dist E O = dist E F)
    (hFO_FA : dist F O = dist F A) : A = E := by
  by_contra hAE
  let T : ℝ² → ℝ² := normSim A E
  let o := T O
  let b := T B
  let c := T C
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
  apply normalized_sixPointFiveCircleA_incompatible
      (O := o) (B := b) (C := c) (F := f)
  · simpa [b, o, hT0] using map_dist_eq hOA_OB
  · simpa [b, o, hT0] using map_dist_eq hAO_AB
  · simpa [c, o, hT0] using map_dist_eq hAO_AC
  · simpa [o, hT0, hT1] using map_dist_eq hAO_AE
  · simpa [b, c, hT1] using map_dist_eq hCB_CE
  · simpa [b, c, f] using map_dist_eq hCB_CF
  · simpa [c, o, hT1] using map_dist_eq hEO_EC
  · simpa [f, o, hT1] using map_dist_eq hEO_EF
  · simpa [f, o, hT0] using map_dist_eq hFO_FA

set_option maxHeartbeats 4000000 in
-- The best normalization reduces the exact lift to roughly three thousand characters.
/-- Normalized form of six-point five-circle collision B. -/
private theorem normalized_sixPointFiveCircleB_incompatible
    {O B C F : ℝ²}
    (hAO_AB : dist (pt 0 0) O = dist (pt 0 0) B)
    (hAO_AE : dist (pt 0 0) O = dist (pt 0 0) (pt 1 0))
    (hBO_BA : dist B O = dist B (pt 0 0))
    (hBO_BC : dist B O = dist B C)
    (hBO_BF : dist B O = dist B F)
    (hEO_EB : dist (pt 1 0) O = dist (pt 1 0) B)
    (hCO_CF : dist C O = dist C F)
    (hFA_FE : dist F (pt 0 0) = dist F (pt 1 0))
    (hFA_FC : dist F (pt 0 0) = dist F C) : False := by
  have hAO_ABsq := congrArg (fun r : ℝ => r ^ 2) hAO_AB
  have hAO_AEsq := congrArg (fun r : ℝ => r ^ 2) hAO_AE
  have hBO_BAsq := congrArg (fun r : ℝ => r ^ 2) hBO_BA
  have hBO_BCsq := congrArg (fun r : ℝ => r ^ 2) hBO_BC
  have hBO_BFsq := congrArg (fun r : ℝ => r ^ 2) hBO_BF
  have hEO_EBsq := congrArg (fun r : ℝ => r ^ 2) hEO_EB
  have hCO_CFsq := congrArg (fun r : ℝ => r ^ 2) hCO_CF
  have hFA_FEsq := congrArg (fun r : ℝ => r ^ 2) hFA_FE
  have hFA_FCsq := congrArg (fun r : ℝ => r ^ 2) hFA_FC
  change dist (pt 0 0) O ^ 2 = dist (pt 0 0) B ^ 2 at hAO_ABsq
  change dist (pt 0 0) O ^ 2 = dist (pt 0 0) (pt 1 0) ^ 2 at hAO_AEsq
  change dist B O ^ 2 = dist B (pt 0 0) ^ 2 at hBO_BAsq
  change dist B O ^ 2 = dist B C ^ 2 at hBO_BCsq
  change dist B O ^ 2 = dist B F ^ 2 at hBO_BFsq
  change dist (pt 1 0) O ^ 2 = dist (pt 1 0) B ^ 2 at hEO_EBsq
  change dist C O ^ 2 = dist C F ^ 2 at hCO_CFsq
  change dist F (pt 0 0) ^ 2 = dist F (pt 1 0) ^ 2 at hFA_FEsq
  change dist F (pt 0 0) ^ 2 = dist F C ^ 2 at hFA_FCsq
  rw [sixPointFiveCircle_dist_sq_coord, sixPointFiveCircle_dist_sq_coord]
    at hAO_ABsq hAO_AEsq hBO_BAsq hBO_BCsq hBO_BFsq hEO_EBsq hCO_CFsq
      hFA_FEsq hFA_FCsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hAO_ABsq hAO_AEsq hBO_BAsq hBO_BCsq hBO_BFsq hEO_EBsq hCO_CFsq
      hFA_FEsq hFA_FCsq
  grobner (ringSteps := 100000)

/-- Collision B: two short bisectors join the two three-point circle constraints. -/
theorem six_point_five_circle_collision_b
    {O A B C E F : ℝ²}
    (hAO_AB : dist A O = dist A B)
    (hAO_AE : dist A O = dist A E)
    (hBO_BA : dist B O = dist B A)
    (hBO_BC : dist B O = dist B C)
    (hBO_BF : dist B O = dist B F)
    (hEO_EB : dist E O = dist E B)
    (hCO_CF : dist C O = dist C F)
    (hFA_FE : dist F A = dist F E)
    (hFA_FC : dist F A = dist F C) : A = E := by
  by_contra hAE
  let T : ℝ² → ℝ² := normSim A E
  let o := T O
  let b := T B
  let c := T C
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
  apply normalized_sixPointFiveCircleB_incompatible
      (O := o) (B := b) (C := c) (F := f)
  · simpa [b, o, hT0] using map_dist_eq hAO_AB
  · simpa [o, hT0, hT1] using map_dist_eq hAO_AE
  · simpa [b, o, hT0] using map_dist_eq hBO_BA
  · simpa [b, c, o] using map_dist_eq hBO_BC
  · simpa [b, f, o] using map_dist_eq hBO_BF
  · simpa [b, o, hT1] using map_dist_eq hEO_EB
  · simpa [c, f, o] using map_dist_eq hCO_CF
  · simpa [f, hT0, hT1] using map_dist_eq hFA_FE
  · simpa [c, f, hT0] using map_dist_eq hFA_FC

set_option maxHeartbeats 4000000 in
-- The exact frontier certificate gives a compact nine-polynomial UNIT ideal.
/-- Normalized form of six-point five-circle collision C. -/
private theorem normalized_sixPointFiveCircleC_incompatible
    {O B C F : ℝ²}
    (hAO_AB : dist (pt 0 0) O = dist (pt 0 0) B)
    (hAO_AE : dist (pt 0 0) O = dist (pt 0 0) (pt 1 0))
    (hAO_AC : dist (pt 0 0) O = dist (pt 0 0) C)
    (hBO_BA : dist B O = dist B (pt 0 0))
    (hBO_BF : dist B O = dist B F)
    (hEB_EC : dist (pt 1 0) B = dist (pt 1 0) C)
    (hEB_EF : dist (pt 1 0) B = dist (pt 1 0) F)
    (hCO_CE : dist C O = dist C (pt 1 0))
    (hFA_FE : dist F (pt 0 0) = dist F (pt 1 0)) : False := by
  have hAO_ABsq := congrArg (fun r : ℝ => r ^ 2) hAO_AB
  have hAO_AEsq := congrArg (fun r : ℝ => r ^ 2) hAO_AE
  have hAO_ACsq := congrArg (fun r : ℝ => r ^ 2) hAO_AC
  have hBO_BAsq := congrArg (fun r : ℝ => r ^ 2) hBO_BA
  have hBO_BFsq := congrArg (fun r : ℝ => r ^ 2) hBO_BF
  have hEB_ECsq := congrArg (fun r : ℝ => r ^ 2) hEB_EC
  have hEB_EFsq := congrArg (fun r : ℝ => r ^ 2) hEB_EF
  have hCO_CEsq := congrArg (fun r : ℝ => r ^ 2) hCO_CE
  have hFA_FEsq := congrArg (fun r : ℝ => r ^ 2) hFA_FE
  change dist (pt 0 0) O ^ 2 = dist (pt 0 0) B ^ 2 at hAO_ABsq
  change dist (pt 0 0) O ^ 2 = dist (pt 0 0) (pt 1 0) ^ 2 at hAO_AEsq
  change dist (pt 0 0) O ^ 2 = dist (pt 0 0) C ^ 2 at hAO_ACsq
  change dist B O ^ 2 = dist B (pt 0 0) ^ 2 at hBO_BAsq
  change dist B O ^ 2 = dist B F ^ 2 at hBO_BFsq
  change dist (pt 1 0) B ^ 2 = dist (pt 1 0) C ^ 2 at hEB_ECsq
  change dist (pt 1 0) B ^ 2 = dist (pt 1 0) F ^ 2 at hEB_EFsq
  change dist C O ^ 2 = dist C (pt 1 0) ^ 2 at hCO_CEsq
  change dist F (pt 0 0) ^ 2 = dist F (pt 1 0) ^ 2 at hFA_FEsq
  rw [sixPointFiveCircle_dist_sq_coord, sixPointFiveCircle_dist_sq_coord]
    at hAO_ABsq hAO_AEsq hAO_ACsq hBO_BAsq hBO_BFsq hEB_ECsq hEB_EFsq
      hCO_CEsq hFA_FEsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hAO_ABsq hAO_AEsq hAO_ACsq hBO_BAsq hBO_BFsq hEB_ECsq hEB_EFsq
      hCO_CEsq hFA_FEsq
  grobner (ringSteps := 100000)

/-- Collision C: the four-point `A`-circle is closed by two terminal bisectors. -/
theorem six_point_five_circle_collision_c
    {O A B C E F : ℝ²}
    (hAO_AB : dist A O = dist A B)
    (hAO_AE : dist A O = dist A E)
    (hAO_AC : dist A O = dist A C)
    (hBO_BA : dist B O = dist B A)
    (hBO_BF : dist B O = dist B F)
    (hEB_EC : dist E B = dist E C)
    (hEB_EF : dist E B = dist E F)
    (hCO_CE : dist C O = dist C E)
    (hFA_FE : dist F A = dist F E) : A = E := by
  by_contra hAE
  let T : ℝ² → ℝ² := normSim A E
  let o := T O
  let b := T B
  let c := T C
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
  apply normalized_sixPointFiveCircleC_incompatible
      (O := o) (B := b) (C := c) (F := f)
  · simpa [b, o, hT0] using map_dist_eq hAO_AB
  · simpa [o, hT0, hT1] using map_dist_eq hAO_AE
  · simpa [c, o, hT0] using map_dist_eq hAO_AC
  · simpa [b, o, hT0] using map_dist_eq hBO_BA
  · simpa [b, f, o] using map_dist_eq hBO_BF
  · simpa [b, c, hT1] using map_dist_eq hEB_EC
  · simpa [b, f, hT1] using map_dist_eq hEB_EF
  · simpa [c, o, hT1] using map_dist_eq hCO_CE
  · simpa [f, hT0, hT1] using map_dist_eq hFA_FE

/-- Equality-closure form of six-point five-circle collision A. -/
structure SixPointFiveCircleCollisionCoreA {alpha : Type*} (P : RowPattern alpha) where
  O : alpha
  A : alpha
  B : alpha
  C : alpha
  E : alpha
  F : alpha
  hAE : A ≠ E
  OA_OB : EdgeClosure P (O, A) (O, B)
  AO_AB : EdgeClosure P (A, O) (A, B)
  AO_AC : EdgeClosure P (A, O) (A, C)
  AO_AE : EdgeClosure P (A, O) (A, E)
  CB_CE : EdgeClosure P (C, B) (C, E)
  CB_CF : EdgeClosure P (C, B) (C, F)
  EO_EC : EdgeClosure P (E, O) (E, C)
  EO_EF : EdgeClosure P (E, O) (E, F)
  FO_FA : EdgeClosure P (F, O) (F, A)

/-- Equality-closure form of six-point five-circle collision B. -/
structure SixPointFiveCircleCollisionCoreB {alpha : Type*} (P : RowPattern alpha) where
  O : alpha
  A : alpha
  B : alpha
  C : alpha
  E : alpha
  F : alpha
  hAE : A ≠ E
  AO_AB : EdgeClosure P (A, O) (A, B)
  AO_AE : EdgeClosure P (A, O) (A, E)
  BO_BA : EdgeClosure P (B, O) (B, A)
  BO_BC : EdgeClosure P (B, O) (B, C)
  BO_BF : EdgeClosure P (B, O) (B, F)
  EO_EB : EdgeClosure P (E, O) (E, B)
  CO_CF : EdgeClosure P (C, O) (C, F)
  FA_FE : EdgeClosure P (F, A) (F, E)
  FA_FC : EdgeClosure P (F, A) (F, C)

/-- Equality-closure form of six-point five-circle collision C. -/
structure SixPointFiveCircleCollisionCoreC {alpha : Type*} (P : RowPattern alpha) where
  O : alpha
  A : alpha
  B : alpha
  C : alpha
  E : alpha
  F : alpha
  hAE : A ≠ E
  AO_AB : EdgeClosure P (A, O) (A, B)
  AO_AE : EdgeClosure P (A, O) (A, E)
  AO_AC : EdgeClosure P (A, O) (A, C)
  BO_BA : EdgeClosure P (B, O) (B, A)
  BO_BF : EdgeClosure P (B, O) (B, F)
  EB_EC : EdgeClosure P (E, B) (E, C)
  EB_EF : EdgeClosure P (E, B) (E, F)
  CO_CE : EdgeClosure P (C, O) (C, E)
  FA_FE : EdgeClosure P (F, A) (F, E)

private theorem collision_of_coreA
    {alpha : Type*} {P : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes P pointOf) (core : SixPointFiveCircleCollisionCoreA P) :
    pointOf core.A = pointOf core.E := by
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f := EdgeClosure.sound hreal h
  exact six_point_five_circle_collision_a
    (by simpa [edgeDist] using sound core.OA_OB)
    (by simpa [edgeDist] using sound core.AO_AB)
    (by simpa [edgeDist] using sound core.AO_AC)
    (by simpa [edgeDist] using sound core.AO_AE)
    (by simpa [edgeDist] using sound core.CB_CE)
    (by simpa [edgeDist] using sound core.CB_CF)
    (by simpa [edgeDist] using sound core.EO_EC)
    (by simpa [edgeDist] using sound core.EO_EF)
    (by simpa [edgeDist] using sound core.FO_FA)

private theorem collision_of_coreB
    {alpha : Type*} {P : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes P pointOf) (core : SixPointFiveCircleCollisionCoreB P) :
    pointOf core.A = pointOf core.E := by
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f := EdgeClosure.sound hreal h
  exact six_point_five_circle_collision_b
    (by simpa [edgeDist] using sound core.AO_AB)
    (by simpa [edgeDist] using sound core.AO_AE)
    (by simpa [edgeDist] using sound core.BO_BA)
    (by simpa [edgeDist] using sound core.BO_BC)
    (by simpa [edgeDist] using sound core.BO_BF)
    (by simpa [edgeDist] using sound core.EO_EB)
    (by simpa [edgeDist] using sound core.CO_CF)
    (by simpa [edgeDist] using sound core.FA_FE)
    (by simpa [edgeDist] using sound core.FA_FC)

private theorem collision_of_coreC
    {alpha : Type*} {P : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes P pointOf) (core : SixPointFiveCircleCollisionCoreC P) :
    pointOf core.A = pointOf core.E := by
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f := EdgeClosure.sound hreal h
  exact six_point_five_circle_collision_c
    (by simpa [edgeDist] using sound core.AO_AB)
    (by simpa [edgeDist] using sound core.AO_AE)
    (by simpa [edgeDist] using sound core.AO_AC)
    (by simpa [edgeDist] using sound core.BO_BA)
    (by simpa [edgeDist] using sound core.BO_BF)
    (by simpa [edgeDist] using sound core.EB_EC)
    (by simpa [edgeDist] using sound core.EB_EF)
    (by simpa [edgeDist] using sound core.CO_CE)
    (by simpa [edgeDist] using sound core.FA_FE)

/-- Collision-A cores have no injective planar realization. -/
theorem not_realizes_of_sixPointFiveCircleCollisionCoreA
    {alpha : Type*} {P : RowPattern alpha}
    (core : SixPointFiveCircleCollisionCoreA P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  exact core.hAE (hreal.injective (collision_of_coreA hreal core))

/-- Collision-B cores have no injective planar realization. -/
theorem not_realizes_of_sixPointFiveCircleCollisionCoreB
    {alpha : Type*} {P : RowPattern alpha}
    (core : SixPointFiveCircleCollisionCoreB P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  exact core.hAE (hreal.injective (collision_of_coreB hreal core))

/-- Collision-C cores have no injective planar realization. -/
theorem not_realizes_of_sixPointFiveCircleCollisionCoreC
    {alpha : Type*} {P : RowPattern alpha}
    (core : SixPointFiveCircleCollisionCoreC P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  exact core.hAE (hreal.injective (collision_of_coreC hreal core))

end EqualityCore
end Census554
end Problem97
