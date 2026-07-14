/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.Q3SharedInterior
import Erdos9796Proof.P97.SurplusCOMPGBankSep

/-!
# Six-point nested-center order core

For six points in cyclic order `O,A,D,E,X,C`, the equalities

`OA = OC = AC = OD = OE`, `DA = DE = DX`, and `EO = EX`

are incompatible with strict convexity.  The proof needs only five of the
signed-area inequalities forced by that cyclic order.  It is independent of
the finite residual in which the pattern was discovered.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace SixPointNestedCenterOrderCore

open EqualityCore

private lemma normSim_dist_sq_eq_one
    {o a x y : ℝ²} (hoa : o ≠ a) (h : dist o a = dist x y) :
    (normSim o a x 0 - normSim o a y 0) ^ 2 +
        (normSim o a x 1 - normSim o a y 1) ^ 2 = 1 := by
  have hT : dist (normSim o a o) (normSim o a a) =
      dist (normSim o a x) (normSim o a y) := by
    rw [normSim_dist_image o a hoa, normSim_dist_image o a hoa, h]
  have hSq := congrArg (fun t : ℝ => t ^ 2) hT
  change dist (normSim o a o) (normSim o a a) ^ 2 =
    dist (normSim o a x) (normSim o a y) ^ 2 at hSq
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hSq
  rw [normSim_fst, normSim_snd o a hoa] at hSq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero,
    zero_sub, one_pow, neg_sq] at hSq
  simpa using hSq.symm

private lemma normSim_signedArea_pos
    {o a x y z : ℝ²} (hoa : o ≠ a) (h : 0 < signedArea2 x y z) :
    0 < signedArea2 (normSim o a x) (normSim o a y) (normSim o a z) := by
  rw [signedArea2_normSim o a hoa]
  apply mul_pos _ h
  apply inv_pos.mpr
  rw [← SurplusCOMPGBank.dist_sq_coord a o]
  exact sq_pos_of_pos (dist_pos.mpr hoa.symm)

private theorem normalized_order_incompatible
    {h u v w z r s : ℝ}
    (hhsq : h ^ 2 = 3 / 4)
    (hhpos : 0 < h)
    (hDunit : u ^ 2 + v ^ 2 = 1)
    (hEunit : w ^ 2 + z ^ 2 = 1)
    (hDA_DE : (u - 1) ^ 2 + v ^ 2 = (u - w) ^ 2 + (v - z) ^ 2)
    (hDA_DX : (u - 1) ^ 2 + v ^ 2 = (u - r) ^ 2 + (v - s) ^ 2)
    (hEXunit : (w - r) ^ 2 + (z - s) ^ 2 = 1)
    (hOAD : 0 < v)
    (hADC : 0 < (u - 1) * h + v / 2)
    (hODE : 0 < u * z - v * w)
    (hOEX : 0 < w * s - z * r) : False := by
  have huLtOne : u < 1 := by
    nlinarith only [hDunit, sq_pos_of_pos hOAD]
  have honeSubU : 0 < 1 - u := sub_pos.mpr huLtOne
  have hvBound : 2 * h * (1 - u) < v := by
    nlinarith only [hADC]
  have htwicePos : 0 < 2 * h * (1 - u) := by positivity
  have hvSqBound : (2 * h * (1 - u)) ^ 2 < v ^ 2 :=
    (sq_lt_sq₀ htwicePos.le hOAD.le).2 hvBound
  have huHalf : 1 / 2 < u := by
    nlinarith only [hhsq, hDunit, hvSqBound]
  have hdot : u * w + v * z = u := by
    nlinarith only [hDunit, hEunit, hDA_DE]
  have hlagrange :
      (u * w + v * z) ^ 2 + (u * z - v * w) ^ 2 =
        (u ^ 2 + v ^ 2) * (w ^ 2 + z ^ 2) := by
    ring
  have hcrossSq : (u * z - v * w) ^ 2 = v ^ 2 := by
    rw [hdot, hDunit, hEunit] at hlagrange
    nlinarith only [hlagrange, hDunit]
  have hcross : u * z - v * w = v := by
    nlinarith only [hcrossSq, hODE, hOAD]
  let alpha := w * r + z * s
  let beta := w * s - z * r
  have hXnorm : r ^ 2 + s ^ 2 = 2 * alpha := by
    dsimp [alpha]
    nlinarith only [hEXunit, hEunit]
  have halpha : 0 ≤ alpha := by
    nlinarith only [hXnorm, sq_nonneg r, sq_nonneg s]
  have hbeta : 0 < beta := by
    simpa [beta] using hOEX
  have hdotIdentity :
      (u * w + v * z) * (w * r + z * s) -
          (u * z - v * w) * (w * s - z * r) =
        (w ^ 2 + z ^ 2) * (u * r + v * s) := by
    ring
  have hdotDX : u * r + v * s = u * alpha - v * beta := by
    rw [hdot, hcross, hEunit] at hdotIdentity
    dsimp [alpha, beta]
    nlinarith only [hdotIdentity]
  have hDXExpanded :
      r ^ 2 + s ^ 2 - 2 * (u * r + v * s) - 1 + 2 * u = 0 := by
    nlinarith only [hDA_DX, hDunit]
  have hlinear :
      2 * (1 - u) * alpha + 2 * v * beta = 1 - 2 * u := by
    nlinarith only [hXnorm, hdotDX, hDXExpanded]
  have hfirstNonneg : 0 ≤ 2 * (1 - u) * alpha := by positivity
  have hsecondPos : 0 < 2 * v * beta := by positivity
  nlinarith only [hlinear, hfirstNonneg, hsecondPos, huHalf]

/-- The four-row metric linkage is incompatible with the five displayed
orientations inherited from cyclic order `O,A,D,E,X,C`. -/
theorem metric_orientation_incompatibility
    {O A D E X C : ℝ²}
    (hOA : O ≠ A)
    (hOA_OC : dist O A = dist O C)
    (hOA_AC : dist O A = dist A C)
    (hOA_OD : dist O A = dist O D)
    (hOA_OE : dist O A = dist O E)
    (hDA_DE : dist D A = dist D E)
    (hDA_DX : dist D A = dist D X)
    (hEO_EX : dist E O = dist E X)
    (hOAC : 0 < signedArea2 O A C)
    (hOAD : 0 < signedArea2 O A D)
    (hADC : 0 < signedArea2 A D C)
    (hODE : 0 < signedArea2 O D E)
    (hOEX : 0 < signedArea2 O E X) : False := by
  let T := normSim O A
  let H := T C 1
  let u := T D 0
  let v := T D 1
  let w := T E 0
  let z := T E 1
  let r := T X 0
  let s := T X 1
  have hTO : T O = pt 0 0 := by
    simpa [T] using normSim_fst O A
  have hTA : T A = pt 1 0 := by
    simpa [T] using normSim_snd O A hOA
  have map_dist_eq {P Q R S : ℝ²} (heq : dist P Q = dist R S) :
      dist (T P) (T Q) = dist (T R) (T S) := by
    simp only [T, normSim_dist_image O A hOA]
    rw [heq]
  have hCfst : T C 0 = 1 / 2 := by
    apply normSim_center_fst_eq_half_of_equidistant hOA
    exact hOA_OC.symm.trans hOA_AC
  have hCunit := normSim_dist_sq_eq_one hOA hOA_OC
  change (T O 0 - T C 0) ^ 2 + (T O 1 - T C 1) ^ 2 = 1 at hCunit
  rw [hTO] at hCunit
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hCunit
  have hHsq : H ^ 2 = 3 / 4 := by
    dsimp [H]
    rw [hCfst] at hCunit
    nlinarith only [hCunit]
  have hDunit := normSim_dist_sq_eq_one hOA hOA_OD
  change (T O 0 - T D 0) ^ 2 + (T O 1 - T D 1) ^ 2 = 1 at hDunit
  rw [hTO] at hDunit
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hDunit
  have huv : u ^ 2 + v ^ 2 = 1 := by
    simpa [u, v] using hDunit
  have hEunit := normSim_dist_sq_eq_one hOA hOA_OE
  change (T O 0 - T E 0) ^ 2 + (T O 1 - T E 1) ^ 2 = 1 at hEunit
  rw [hTO] at hEunit
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hEunit
  have hwz : w ^ 2 + z ^ 2 = 1 := by
    simpa [w, z] using hEunit
  have hDADE := congrArg (fun t : ℝ => t ^ 2) (map_dist_eq hDA_DE)
  change dist (T D) (T A) ^ 2 = dist (T D) (T E) ^ 2 at hDADE
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hDADE
  rw [hTA] at hDADE
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at hDADE
  have hDADEscalar :
      (u - 1) ^ 2 + v ^ 2 = (u - w) ^ 2 + (v - z) ^ 2 := by
    simpa [u, v, w, z] using hDADE
  have hDADX := congrArg (fun t : ℝ => t ^ 2) (map_dist_eq hDA_DX)
  change dist (T D) (T A) ^ 2 = dist (T D) (T X) ^ 2 at hDADX
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hDADX
  rw [hTA] at hDADX
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at hDADX
  have hDADXscalar :
      (u - 1) ^ 2 + v ^ 2 = (u - r) ^ 2 + (v - s) ^ 2 := by
    simpa [u, v, r, s] using hDADX
  have hOA_EX : dist O A = dist E X := by
    calc
      dist O A = dist O E := hOA_OE
      _ = dist E O := dist_comm O E
      _ = dist E X := hEO_EX
  have hEXunit := normSim_dist_sq_eq_one hOA hOA_EX
  have hEXscalar : (w - r) ^ 2 + (z - s) ^ 2 = 1 := by
    simpa [w, z, r, s] using hEXunit
  have hOAC' := normSim_signedArea_pos hOA hOAC
  change 0 < signedArea2 (T O) (T A) (T C) at hOAC'
  rw [hTO, hTA] at hOAC'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero, one_mul] at hOAC'
  have hHpos : 0 < H := by simpa [H] using hOAC'
  have hOAD' := normSim_signedArea_pos hOA hOAD
  change 0 < signedArea2 (T O) (T A) (T D) at hOAD'
  rw [hTO, hTA] at hOAD'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero, one_mul] at hOAD'
  have hvPos : 0 < v := by simpa [v] using hOAD'
  have hADC' := normSim_signedArea_pos hOA hADC
  change 0 < signedArea2 (T A) (T D) (T C) at hADC'
  rw [hTA] at hADC'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero] at hADC'
  have hADCscalar : 0 < (u - 1) * H + v / 2 := by
    dsimp [u, v, H]
    rw [hCfst] at hADC'
    nlinarith only [hADC']
  have hODE' := normSim_signedArea_pos hOA hODE
  change 0 < signedArea2 (T O) (T D) (T E) at hODE'
  rw [hTO] at hODE'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero] at hODE'
  have hODEscalar : 0 < u * z - v * w := by
    dsimp [u, v, w, z]
    nlinarith only [hODE']
  have hOEX' := normSim_signedArea_pos hOA hOEX
  change 0 < signedArea2 (T O) (T E) (T X) at hOEX'
  rw [hTO] at hOEX'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero] at hOEX'
  have hOEXscalar : 0 < w * s - z * r := by
    dsimp [w, z, r, s]
    nlinarith only [hOEX']
  exact normalized_order_incompatible hHsq hHpos huv hwz hDADEscalar
    hDADXscalar hEXscalar hvPos hADCscalar hODEscalar hOEXscalar

/-- Equality-closure form of the round-14 four-row obstruction. -/
structure Core {alpha : Type*} (R : RowPattern alpha) where
  O : alpha
  A : alpha
  D : alpha
  E : alpha
  X : alpha
  C : alpha
  hOA : O ≠ A
  OA_OC : EdgeClosure R (O, A) (O, C)
  OA_AC : EdgeClosure R (O, A) (A, C)
  OA_OD : EdgeClosure R (O, A) (O, D)
  OA_OE : EdgeClosure R (O, A) (O, E)
  DA_DE : EdgeClosure R (D, A) (D, E)
  DA_DX : EdgeClosure R (D, A) (D, X)
  EO_EX : EdgeClosure R (E, O) (E, X)

/-- A realized core cannot have the five positive cyclic-order signs. -/
theorem false_of_core
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hOAC : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.C))
    (hOAD : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.D))
    (hADC : 0 < signedArea2 (pointOf core.A) (pointOf core.D) (pointOf core.C))
    (hODE : 0 < signedArea2 (pointOf core.O) (pointOf core.D) (pointOf core.E))
    (hOEX : 0 < signedArea2 (pointOf core.O) (pointOf core.E) (pointOf core.X)) :
    False := by
  apply metric_orientation_incompatibility
      (fun h => core.hOA (hreal.injective h))
  · simpa [edgeDist] using EdgeClosure.sound hreal core.OA_OC
  · simpa [edgeDist] using EdgeClosure.sound hreal core.OA_AC
  · simpa [edgeDist] using EdgeClosure.sound hreal core.OA_OD
  · simpa [edgeDist] using EdgeClosure.sound hreal core.OA_OE
  · simpa [edgeDist] using EdgeClosure.sound hreal core.DA_DE
  · simpa [edgeDist] using EdgeClosure.sound hreal core.DA_DX
  · simpa [edgeDist] using EdgeClosure.sound hreal core.EO_EX
  · exact hOAC
  · exact hOAD
  · exact hADC
  · exact hODE
  · exact hOEX

/-- Reversed cyclic orientation form, obtained by reflecting the realization. -/
theorem false_of_core_of_neg
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hOAC : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.C) < 0)
    (hOAD : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.D) < 0)
    (hADC : signedArea2 (pointOf core.A) (pointOf core.D) (pointOf core.C) < 0)
    (hODE : signedArea2 (pointOf core.O) (pointOf core.D) (pointOf core.E) < 0)
    (hOEX : signedArea2 (pointOf core.O) (pointOf core.E) (pointOf core.X) < 0) :
    False := by
  let reflectedPointOf := fun label => reflectXAxis (pointOf label)
  have hrealReflected : Realizes R reflectedPointOf := hreal.reflectXAxis
  apply false_of_core hrealReflected core
  · change 0 < signedArea2 (reflectXAxis (pointOf core.O))
      (reflectXAxis (pointOf core.A)) (reflectXAxis (pointOf core.C))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.O))
      (reflectXAxis (pointOf core.A)) (reflectXAxis (pointOf core.D))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.A))
      (reflectXAxis (pointOf core.D)) (reflectXAxis (pointOf core.C))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.O))
      (reflectXAxis (pointOf core.D)) (reflectXAxis (pointOf core.E))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.O))
      (reflectXAxis (pointOf core.E)) (reflectXAxis (pointOf core.X))
    rw [signedArea2_reflectXAxis]
    linarith

#print axioms normalized_order_incompatible
#print axioms metric_orientation_incompatibility
#print axioms false_of_core
#print axioms false_of_core_of_neg

end SixPointNestedCenterOrderCore
end Census554
end Problem97
