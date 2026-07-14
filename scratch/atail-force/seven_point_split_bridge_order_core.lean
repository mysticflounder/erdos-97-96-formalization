/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.SixPointCircleChainOrderCore

/-!
# Seven-point split-bridge order core

The equal-distance spine

`OA = OC = AC = OD = OE`, `DA = DE`

together with bridges `AU = AO`, `DU = DA`, `CW = CD`, and `EW = EA`
is incompatible with the four orientations `OAC`, `OAD`, `OAE`, and `OEC`.
The proof normalizes `O,A` to `(0,0),(1,0)`.  The first bridge bounds the
normalized first coordinate of `D`; the second bridge then violates the
triangle inequality between `E`, `C`, and `W`.

This scratch theorem is independent of the finite residual which exposed the
pattern.  It is kept outside the production import tree until its adapter is
reviewed and promoted.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace SevenPointSplitBridgeOrderCore

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

/-- Algebraic bounds forced by the normalized five-point spine and the first
split bridge.  The three conclusions are the squared lower bound for `EA`
and squared upper bounds for `CD` and `CE` used by the second bridge. -/
private theorem normalized_split_bridge_bounds
    {c h x y w z : ℝ}
    (hCunit : c ^ 2 + h ^ 2 = 1)
    (hACunit : (c - 1) ^ 2 + h ^ 2 = 1)
    (hDunit : x ^ 2 + y ^ 2 = 1)
    (hEunit : w ^ 2 + z ^ 2 = 1)
    (hDA_DE : (x - 1) ^ 2 + y ^ 2 = (x - w) ^ 2 + (y - z) ^ 2)
    (hCpos : 0 < h)
    (hDpos : 0 < y)
    (hEpos : 0 < z)
    (hOEC : 0 < w * h - z * c)
    (hxUpper : x ≤ 7 / 8) :
    (24 / 25 : ℝ) ^ 2 < (w - 1) ^ 2 + z ^ 2 ∧
      (c - x) ^ 2 + (h - y) ^ 2 < (3 / 5 : ℝ) ^ 2 ∧
      (c - w) ^ 2 + (h - z) ^ 2 < (1 / 4 : ℝ) ^ 2 := by
  have hc : c = 1 / 2 := by
    nlinarith only [hCunit, hACunit]
  have hhsq : h ^ 2 = 3 / 4 := by
    rw [hc] at hCunit
    nlinarith only [hCunit]
  have heDot : x = x * w + y * z := by
    nlinarith only [hDunit, hEunit, hDA_DE]
  have hxOneMinusW : x * (1 - w) = y * z := by
    nlinarith only [heDot]
  have hzSq : z ^ 2 = (1 - w) * (1 + w) := by
    nlinarith only [hEunit]
  have hcrossProduct : z * (x * z - y * (1 + w)) = 0 := by
    calc
      z * (x * z - y * (1 + w)) =
          x * z ^ 2 - (y * z) * (1 + w) := by ring
      _ = x * ((1 - w) * (1 + w)) -
          (x * (1 - w)) * (1 + w) := by
            rw [hzSq, hxOneMinusW]
      _ = 0 := by ring
  have hzne : z ≠ 0 := ne_of_gt hEpos
  have hcrossZero : x * z - y * (1 + w) = 0 :=
    (mul_eq_zero.mp hcrossProduct).resolve_left hzne
  have hcrossLinear : x * z - y * w = y := by
    nlinarith only [hcrossZero]
  have hwxy : w = x ^ 2 - y ^ 2 := by
    calc
      w = (x ^ 2 + y ^ 2) * w := by rw [hDunit]; ring
      _ = x * (x * w + y * z) - y * (x * z - y * w) := by ring
      _ = x * x - y * y := by rw [← heDot, hcrossLinear]
      _ = x ^ 2 - y ^ 2 := by ring
  have hw : w = 2 * x ^ 2 - 1 := by
    nlinarith only [hDunit, hwxy]
  have hzxy : z = 2 * x * y := by
    calc
      z = (x ^ 2 + y ^ 2) * z := by rw [hDunit]; ring
      _ = y * (x * w + y * z) + x * (x * z - y * w) := by ring
      _ = y * x + x * y := by rw [← heDot, hcrossLinear]
      _ = 2 * x * y := by ring
  have hxyPos : 0 < x * y := by
    nlinarith only [hzxy, hEpos]
  have hxPos : 0 < x := pos_of_mul_pos_left hxyPos hDpos.le
  have hdiffIneq : x * y < h * (x ^ 2 - y ^ 2) := by
    rw [hc, hw, hzxy] at hOEC
    have hwDiff : 2 * x ^ 2 - 1 = x ^ 2 - y ^ 2 := by
      nlinarith only [hDunit]
    rw [hwDiff] at hOEC
    nlinarith only [hOEC]
  have hdiffPos : 0 < x ^ 2 - y ^ 2 := by
    have hprod : 0 < h * (x ^ 2 - y ^ 2) :=
      lt_trans hxyPos hdiffIneq
    exact pos_of_mul_pos_right hprod hCpos.le
  have hxGtH : h < x := by
    by_contra hn
    have hxLeH : x ≤ h := le_of_not_gt hn
    have hxSqLe : x ^ 2 ≤ h ^ 2 :=
      (sq_le_sq₀ hxPos.le hCpos.le).2 hxLeH
    have hySqLower : 1 / 4 ≤ y ^ 2 := by
      nlinarith only [hDunit, hhsq, hxSqLe]
    have hySqLtHalf : y ^ 2 < 1 / 2 := by
      nlinarith only [hDunit, hdiffPos]
    have hleftPos : 0 < h * (x ^ 2 - y ^ 2) :=
      mul_pos hCpos hdiffPos
    have hsqGap :
        (x * y) ^ 2 < (h * (x ^ 2 - y ^ 2)) ^ 2 :=
      (sq_lt_sq₀ hxyPos.le hleftPos.le).2 hdiffIneq
    have hfactorOne : 0 ≤ 4 * y ^ 2 - 1 := by
      nlinarith only [hySqLower]
    have hfactorTwo : 4 * y ^ 2 - 3 ≤ 0 := by
      nlinarith only [hySqLtHalf]
    have hproduct : (4 * y ^ 2 - 1) * (4 * y ^ 2 - 3) ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos hfactorOne hfactorTwo
    have hxsq : x ^ 2 = 1 - y ^ 2 := by
      nlinarith only [hDunit]
    have hgapIdentity :
        (h * (x ^ 2 - y ^ 2)) ^ 2 - (x * y) ^ 2 =
          ((4 * y ^ 2 - 1) * (4 * y ^ 2 - 3)) / 4 := by
      calc
        (h * (x ^ 2 - y ^ 2)) ^ 2 - (x * y) ^ 2 =
            (3 / 4) * (x ^ 2 - y ^ 2) ^ 2 - x ^ 2 * y ^ 2 := by
              rw [mul_pow, hhsq, mul_pow]
        _ = ((4 * y ^ 2 - 1) * (4 * y ^ 2 - 3)) / 4 := by
              rw [hxsq]
              ring
    nlinarith only [hsqGap, hgapIdentity, hproduct]
  have hxSqUpper : x ^ 2 ≤ (7 / 8 : ℝ) ^ 2 :=
    (sq_le_sq₀ hxPos.le (by norm_num)).2 hxUpper
  have hySqLower : 15 / 64 ≤ y ^ 2 := by
    nlinarith only [hDunit, hxSqUpper]
  have hyLowerSq : (12 / 25 : ℝ) ^ 2 < y ^ 2 := by
    nlinarith only [hySqLower]
  have hyLower : (12 / 25 : ℝ) < y :=
    (sq_lt_sq₀ (by norm_num) hDpos.le).1 hyLowerSq
  have hhLowerSq : (41 / 49 : ℝ) ^ 2 < h ^ 2 := by
    rw [hhsq]
    norm_num
  have hhLower : (41 / 49 : ℝ) < h :=
    (sq_lt_sq₀ (by norm_num) hCpos.le).1 hhLowerSq
  have hEASq : (w - 1) ^ 2 + z ^ 2 = 4 * y ^ 2 := by
    rw [hw, hzxy]
    have hxsq : x ^ 2 = 1 - y ^ 2 := by
      nlinarith only [hDunit]
    calc
      (2 * x ^ 2 - 1 - 1) ^ 2 + (2 * x * y) ^ 2 =
          4 * (x ^ 2 - 1) ^ 2 + 4 * x ^ 2 * y ^ 2 := by ring
      _ = 4 * y ^ 2 := by rw [hxsq]; ring
  have hEA : (24 / 25 : ℝ) ^ 2 < (w - 1) ^ 2 + z ^ 2 := by
    rw [hEASq]
    have hsq : (12 / 25 : ℝ) ^ 2 < y ^ 2 :=
      (sq_lt_sq₀ (by norm_num) hDpos.le).2 hyLower
    nlinarith only [hsq]
  have hhyLower : 24 * h / 25 < 2 * h * y := by
    have hprod := mul_pos hCpos (sub_pos.mpr hyLower)
    nlinarith only [hprod]
  have hxhyLower : 41 / 25 < x + 2 * h * y := by
    nlinarith only [hxGtH, hhyLower, hhLower]
  have hCDSq : (c - x) ^ 2 + (h - y) ^ 2 = 2 - x - 2 * h * y := by
    rw [hc]
    nlinarith only [hDunit, hhsq]
  have hCD : (c - x) ^ 2 + (h - y) ^ 2 < (3 / 5 : ℝ) ^ 2 := by
    rw [hCDSq]
    nlinarith only [hxhyLower]
  have hxSqGt : h ^ 2 < x ^ 2 :=
    (sq_lt_sq₀ hCpos.le hxPos.le).2 hxGtH
  have hwLower : 1 / 2 < w := by
    rw [hw]
    nlinarith only [hxSqGt, hhsq]
  have hxyGt : h * y < x * y :=
    mul_lt_mul_of_pos_right hxGtH hDpos
  have hzLower : 24 * h / 25 < z := by
    rw [hzxy]
    have hhy : 12 * h / 25 < h * y := by
      have hprod := mul_pos hCpos (sub_pos.mpr hyLower)
      nlinarith only [hprod]
    nlinarith only [hhy, hxyGt]
  have hhzLower : 48 * h ^ 2 / 25 < 2 * h * z := by
    have hprod := mul_pos hCpos (sub_pos.mpr hzLower)
    nlinarith only [hprod]
  have hwhzLower : 97 / 50 < w + 2 * h * z := by
    nlinarith only [hwLower, hhzLower, hhsq]
  have hCESq : (c - w) ^ 2 + (h - z) ^ 2 = 2 - w - 2 * h * z := by
    rw [hc]
    nlinarith only [hhsq, hEunit]
  have hCE : (c - w) ^ 2 + (h - z) ^ 2 < (1 / 4 : ℝ) ^ 2 := by
    rw [hCESq]
    nlinarith only [hwhzLower]
  exact ⟨hEA, hCD, hCE⟩

/-- The split-bridge distance equalities are incompatible with the four
positive orientation signs inherited from cyclic order `O,A,D,E,C`. -/
theorem metric_orientation_incompatibility
    {O A C D E U W : ℝ²}
    (hOA : O ≠ A)
    (hOA_OC : dist O A = dist O C)
    (hOA_AC : dist O A = dist A C)
    (hOA_OD : dist O A = dist O D)
    (hOA_OE : dist O A = dist O E)
    (hDA_DE : dist D A = dist D E)
    (hDA_DU : dist D A = dist D U)
    (hAO_AU : dist A O = dist A U)
    (hCD_CW : dist C D = dist C W)
    (hEA_EW : dist E A = dist E W)
    (hOAC : 0 < signedArea2 O A C)
    (hOAD : 0 < signedArea2 O A D)
    (hOAE : 0 < signedArea2 O A E)
    (hOEC : 0 < signedArea2 O E C) : False := by
  let T := normSim O A
  let c := T C 0
  let h := T C 1
  let x := T D 0
  let y := T D 1
  let w := T E 0
  let z := T E 1
  have hTO : T O = pt 0 0 := by
    simpa [T] using normSim_fst O A
  have hTA : T A = pt 1 0 := by
    simpa [T] using normSim_snd O A hOA
  have map_dist_eq {P Q R S : ℝ²} (heq : dist P Q = dist R S) :
      dist (T P) (T Q) = dist (T R) (T S) := by
    simp only [T, normSim_dist_image O A hOA]
    rw [heq]
  have hCunitRaw := normSim_dist_sq_eq_one hOA hOA_OC
  change (T O 0 - T C 0) ^ 2 + (T O 1 - T C 1) ^ 2 = 1 at hCunitRaw
  rw [hTO] at hCunitRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hCunitRaw
  have hCunit : c ^ 2 + h ^ 2 = 1 := by
    simpa [c, h] using hCunitRaw
  have hACunitRaw := normSim_dist_sq_eq_one hOA hOA_AC
  change (T A 0 - T C 0) ^ 2 + (T A 1 - T C 1) ^ 2 = 1 at hACunitRaw
  rw [hTA] at hACunitRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hACunitRaw
  have hACunit : (c - 1) ^ 2 + h ^ 2 = 1 := by
    dsimp [c, h]
    nlinarith only [hACunitRaw]
  have hDunitRaw := normSim_dist_sq_eq_one hOA hOA_OD
  change (T O 0 - T D 0) ^ 2 + (T O 1 - T D 1) ^ 2 = 1 at hDunitRaw
  rw [hTO] at hDunitRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hDunitRaw
  have hDunit : x ^ 2 + y ^ 2 = 1 := by
    simpa [x, y] using hDunitRaw
  have hEunitRaw := normSim_dist_sq_eq_one hOA hOA_OE
  change (T O 0 - T E 0) ^ 2 + (T O 1 - T E 1) ^ 2 = 1 at hEunitRaw
  rw [hTO] at hEunitRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hEunitRaw
  have hEunit : w ^ 2 + z ^ 2 = 1 := by
    simpa [w, z] using hEunitRaw
  have hDADE := congrArg (fun t : ℝ => t ^ 2) (map_dist_eq hDA_DE)
  change dist (T D) (T A) ^ 2 = dist (T D) (T E) ^ 2 at hDADE
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hDADE
  rw [hTA] at hDADE
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at hDADE
  have hDADEscalar : (x - 1) ^ 2 + y ^ 2 =
      (x - w) ^ 2 + (y - z) ^ 2 := by
    simpa [x, y, w, z] using hDADE
  have hOAC' := normSim_signedArea_pos hOA hOAC
  change 0 < signedArea2 (T O) (T A) (T C) at hOAC'
  rw [hTO, hTA] at hOAC'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero, one_mul] at hOAC'
  have hCpos : 0 < h := by simpa [h] using hOAC'
  have hOAD' := normSim_signedArea_pos hOA hOAD
  change 0 < signedArea2 (T O) (T A) (T D) at hOAD'
  rw [hTO, hTA] at hOAD'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero, one_mul] at hOAD'
  have hDpos : 0 < y := by simpa [y] using hOAD'
  have hOAE' := normSim_signedArea_pos hOA hOAE
  change 0 < signedArea2 (T O) (T A) (T E) at hOAE'
  rw [hTO, hTA] at hOAE'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero, one_mul] at hOAE'
  have hEpos : 0 < z := by simpa [z] using hOAE'
  have hOEC' := normSim_signedArea_pos hOA hOEC
  change 0 < signedArea2 (T O) (T E) (T C) at hOEC'
  rw [hTO] at hOEC'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero] at hOEC'
  have hOECscalar : 0 < w * h - z * c := by
    simpa [c, h, w, z, mul_comm] using hOEC'
  have hAUT : dist (T A) (T U) = dist (T A) (T O) := by
    exact (map_dist_eq hAO_AU).symm
  have hDUT : dist (T D) (T U) = dist (T D) (T A) := by
    exact (map_dist_eq hDA_DU).symm
  have hbaseSqRaw := normSim_dist_sq_eq_one (x := A) (y := O) hOA
    (dist_comm O A)
  change (T A 0 - T O 0) ^ 2 + (T A 1 - T O 1) ^ 2 = 1 at hbaseSqRaw
  have hbaseSq : dist (T A) (T O) ^ 2 = 1 := by
    rw [SurplusCOMPGBank.dist_sq_coord]
    exact hbaseSqRaw
  have hbase : dist (T A) (T O) = 1 := by
    nlinarith only [hbaseSq,
      (dist_nonneg : 0 ≤ dist (T A) (T O))]
  have htri := dist_triangle (T A) (T D) (T U)
  rw [hAUT, hDUT, hbase] at htri
  have hADLower : 1 / 2 ≤ dist (T A) (T D) := by
    rw [dist_comm (T A) (T D)] at htri
    have hADLower' : 1 / 2 ≤ dist (T D) (T A) := by
      linarith only [htri]
    simpa [dist_comm] using hADLower'
  have hADSqLower : (1 / 2 : ℝ) ^ 2 ≤ dist (T D) (T A) ^ 2 :=
    (sq_le_sq₀ (by norm_num) dist_nonneg).2 (by
      simpa [dist_comm] using hADLower)
  have hADSq : dist (T D) (T A) ^ 2 = (x - 1) ^ 2 + y ^ 2 := by
    rw [SurplusCOMPGBank.dist_sq_coord, hTA]
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero]
    rfl
  have hxUpper : x ≤ 7 / 8 := by
    rw [hADSq] at hADSqLower
    nlinarith only [hADSqLower, hDunit]
  obtain ⟨hEASqBound, hCDSqBound, hCESqBound⟩ :=
    normalized_split_bridge_bounds hCunit hACunit hDunit hEunit hDADEscalar
      hCpos hDpos hEpos hOECscalar hxUpper
  have hEASq : dist (T E) (T A) ^ 2 = (w - 1) ^ 2 + z ^ 2 := by
    rw [SurplusCOMPGBank.dist_sq_coord, hTA]
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero]
    rfl
  have hCDSq : dist (T C) (T D) ^ 2 =
      (c - x) ^ 2 + (h - y) ^ 2 := by
    rw [SurplusCOMPGBank.dist_sq_coord]
  have hCESq : dist (T C) (T E) ^ 2 =
      (c - w) ^ 2 + (h - z) ^ 2 := by
    rw [SurplusCOMPGBank.dist_sq_coord]
  have hEA : (24 / 25 : ℝ) < dist (T E) (T A) := by
    apply (sq_lt_sq₀ (by norm_num) dist_nonneg).1
    rwa [hEASq]
  have hCD : dist (T C) (T D) < (3 / 5 : ℝ) := by
    apply (sq_lt_sq₀ dist_nonneg (by norm_num)).1
    rwa [hCDSq]
  have hCE : dist (T C) (T E) < (1 / 4 : ℝ) := by
    apply (sq_lt_sq₀ dist_nonneg (by norm_num)).1
    rwa [hCESq]
  have hCWT : dist (T C) (T W) = dist (T C) (T D) :=
    (map_dist_eq hCD_CW).symm
  have hEWT : dist (T E) (T W) = dist (T E) (T A) :=
    (map_dist_eq hEA_EW).symm
  have htriW := dist_triangle (T E) (T C) (T W)
  rw [hEWT, hCWT, dist_comm (T E) (T C)] at htriW
  nlinarith only [hEA, hCD, hCE, htriW]

/-- Equality-closure form of the seven-point split-bridge obstruction. -/
structure Core {alpha : Type*} (R : RowPattern alpha) where
  O : alpha
  A : alpha
  C : alpha
  D : alpha
  E : alpha
  U : alpha
  W : alpha
  hOA : O ≠ A
  OA_OC : EdgeClosure R (O, A) (O, C)
  OA_AC : EdgeClosure R (O, A) (A, C)
  OA_OD : EdgeClosure R (O, A) (O, D)
  OA_OE : EdgeClosure R (O, A) (O, E)
  DA_DE : EdgeClosure R (D, A) (D, E)
  DA_DU : EdgeClosure R (D, A) (D, U)
  AO_AU : EdgeClosure R (A, O) (A, U)
  CD_CW : EdgeClosure R (C, D) (C, W)
  EA_EW : EdgeClosure R (E, A) (E, W)

/-- A realized split-bridge core cannot have the four positive orientations. -/
theorem false_of_core
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hOAC : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.C))
    (hOAD : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.D))
    (hOAE : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.E))
    (hOEC : 0 < signedArea2 (pointOf core.O) (pointOf core.E) (pointOf core.C)) :
    False := by
  apply metric_orientation_incompatibility
      (fun h => core.hOA (hreal.injective h))
  · simpa [edgeDist] using EdgeClosure.sound hreal core.OA_OC
  · simpa [edgeDist] using EdgeClosure.sound hreal core.OA_AC
  · simpa [edgeDist] using EdgeClosure.sound hreal core.OA_OD
  · simpa [edgeDist] using EdgeClosure.sound hreal core.OA_OE
  · simpa [edgeDist] using EdgeClosure.sound hreal core.DA_DE
  · simpa [edgeDist] using EdgeClosure.sound hreal core.DA_DU
  · simpa [edgeDist] using EdgeClosure.sound hreal core.AO_AU
  · simpa [edgeDist] using EdgeClosure.sound hreal core.CD_CW
  · simpa [edgeDist] using EdgeClosure.sound hreal core.EA_EW
  · exact hOAC
  · exact hOAD
  · exact hOAE
  · exact hOEC

/-- Reversed cyclic orientation form, obtained by reflecting the realization. -/
theorem false_of_core_of_neg
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hOAC : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.C) < 0)
    (hOAD : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.D) < 0)
    (hOAE : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.E) < 0)
    (hOEC : signedArea2 (pointOf core.O) (pointOf core.E) (pointOf core.C) < 0) :
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
  · change 0 < signedArea2 (reflectXAxis (pointOf core.O))
      (reflectXAxis (pointOf core.A)) (reflectXAxis (pointOf core.E))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.O))
      (reflectXAxis (pointOf core.E)) (reflectXAxis (pointOf core.C))
    rw [signedArea2_reflectXAxis]
    linarith

#print axioms normalized_split_bridge_bounds
#print axioms metric_orientation_incompatibility
#print axioms false_of_core
#print axioms false_of_core_of_neg

end SevenPointSplitBridgeOrderCore
end Census554
end Problem97
