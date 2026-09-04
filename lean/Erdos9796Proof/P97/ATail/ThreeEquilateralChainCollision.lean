/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EquilateralHingeCollisions

/-!
# Collision at the end of three equilateral triangles

Four triples of equal distances form a chain of three equilateral triangles. If
the two possible apexes differ at each of the first two steps, the two circles at
the last step are tangent, so their displayed common point is unique.

The in-project reuse search `proof-blueprint search "equilateral collision"`
at source revision `efea19c3344db55b4bc4a083c4a66af501625574` used the
69,563-declaration index from build `fe7ab9efec12`; the index reported six new
and three changed source files. The nearby reflection and collision theorems do
not state this four-triple conclusion. The intended eventual consumer is the
`n = 11` planar-survivor motif. Its first missing source antecedent is a proof
that the four row memberships produce the eight distance equalities below.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- In the unit-base normalization, three successive noncollapsed equilateral
triangles force the last common point to be the terminal midpoint. -/
private theorem normalized_f_eq_c_of_three_equilateral_chain
    {B D E F : ℝ²}
    (hAB_AC : dist (pt 0 0) B = dist (pt 0 0) (pt 1 0))
    (hAB_AD : dist (pt 0 0) B = dist (pt 0 0) D)
    (hBA_BC : dist B (pt 0 0) = dist B (pt 1 0))
    (hBA_BF : dist B (pt 0 0) = dist B F)
    (hCA_CD : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) D)
    (hCA_CE : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) E)
    (hEC_ED : dist E (pt 1 0) = dist E D)
    (hEC_EF : dist E (pt 1 0) = dist E F)
    (hBD_ne : B ≠ D)
    (hAE_ne : pt 0 0 ≠ E) :
    F = pt 1 0 := by
  have hAB_AC_sq : dist (pt 0 0) B ^ 2 = dist (pt 0 0) (pt 1 0) ^ 2 :=
    congrArg (fun r : ℝ ↦ r ^ 2) hAB_AC
  have hAB_AD_sq : dist (pt 0 0) B ^ 2 = dist (pt 0 0) D ^ 2 :=
    congrArg (fun r : ℝ ↦ r ^ 2) hAB_AD
  have hBA_BC_sq : dist B (pt 0 0) ^ 2 = dist B (pt 1 0) ^ 2 :=
    congrArg (fun r : ℝ ↦ r ^ 2) hBA_BC
  have hBA_BF_sq : dist B (pt 0 0) ^ 2 = dist B F ^ 2 :=
    congrArg (fun r : ℝ ↦ r ^ 2) hBA_BF
  have hCA_CD_sq : dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) D ^ 2 :=
    congrArg (fun r : ℝ ↦ r ^ 2) hCA_CD
  have hCA_CE_sq : dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) E ^ 2 :=
    congrArg (fun r : ℝ ↦ r ^ 2) hCA_CE
  have hEC_ED_sq : dist E (pt 1 0) ^ 2 = dist E D ^ 2 :=
    congrArg (fun r : ℝ ↦ r ^ 2) hEC_ED
  have hEC_EF_sq : dist E (pt 1 0) ^ 2 = dist E F ^ 2 :=
    congrArg (fun r : ℝ ↦ r ^ 2) hEC_EF
  rw [dist_sq_coord, dist_sq_coord]
    at hAB_AC_sq hAB_AD_sq hBA_BC_sq hBA_BF_sq hCA_CD_sq hCA_CE_sq
      hEC_ED_sq hEC_EF_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hAB_AC_sq hAB_AD_sq hBA_BC_sq hBA_BF_sq hCA_CD_sq hCA_CE_sq
      hEC_ED_sq hEC_EF_sq
  have hBx : B 0 = 1 / 2 := by
    nlinarith only [hAB_AC_sq, hBA_BC_sq]
  have hBy_sq : B 1 ^ 2 = 3 / 4 := by
    nlinarith only [hAB_AC_sq, hBx]
  have hDx : D 0 = 1 / 2 := by
    nlinarith only [hAB_AC_sq, hAB_AD_sq, hCA_CD_sq]
  have hDy_sq : D 1 ^ 2 = 3 / 4 := by
    nlinarith only [hAB_AC_sq, hAB_AD_sq, hDx]
  have hBy_ne_Dy : B 1 ≠ D 1 := by
    intro h
    apply hBD_ne
    apply PiLp.ext
    intro i
    fin_cases i
    · exact hBx.trans hDx.symm
    · exact h
  have hDy_neg_By : D 1 = -B 1 := by
    have hfactor : (D 1 - B 1) * (D 1 + B 1) = 0 := by
      nlinarith only [hBy_sq, hDy_sq]
    rcases mul_eq_zero.mp hfactor with hsame | hopp
    · exact (hBy_ne_Dy (by linarith)).elim
    · linarith
  have hElinear : E 0 = 2 * E 1 * D 1 := by
    rw [hDx] at hEC_ED_sq
    nlinarith only [hCA_CE_sq, hEC_ED_sq, hDy_sq]
  have hEfactor : E 1 * (E 1 - D 1) = 0 := by
    rw [hDx] at hEC_ED_sq
    grobner
  have hEy : E 1 = D 1 := by
    rcases mul_eq_zero.mp hEfactor with hzero | heq
    · have hEx_zero : E 0 = 0 := by
        rw [hzero] at hElinear
        simpa using hElinear
      exfalso
      apply hAE_ne
      apply PiLp.ext
      intro i
      fin_cases i
      · simpa [pt] using hEx_zero.symm
      · simpa [pt] using hzero.symm
    · linarith
  have hEx : E 0 = 3 / 2 := by
    rw [hEy] at hElinear
    nlinarith only [hElinear, hDy_sq]
  simp only [hBx, hEx, hEy, hDy_neg_By] at hBA_BF_sq hEC_EF_sq
  have hFlinear : F 0 - 1 = 2 * B 1 * F 1 := by
    nlinarith only [hBA_BF_sq, hEC_EF_sq]
  have hFsquares : (F 0 - 1) ^ 2 + F 1 ^ 2 = 0 := by
    nlinarith only [hBA_BF_sq, hBy_sq, hFlinear]
  have hFx : F 0 = 1 := by
    nlinarith only [hFsquares, sq_nonneg (F 0 - 1), sq_nonneg (F 1)]
  have hFy : F 1 = 0 := by
    nlinarith only [hFsquares, sq_nonneg (F 0 - 1), sq_nonneg (F 1)]
  apply PiLp.ext
  intro i
  fin_cases i
  · simpa [pt] using hFx
  · simpa [pt] using hFy

/-- Let `A,B,C,D,E,F` be planar points. Suppose the three points named in
each of the four triples centered at `A`, `B`, `C`, and `E` have the same
distance from that center. If `B ≠ D` and `A ≠ E`, then `F = C`. -/
theorem f_eq_c_of_three_equilateral_chain
    {A B C D E F : ℝ²}
    (hAB_AC : dist A B = dist A C)
    (hAB_AD : dist A B = dist A D)
    (hBA_BC : dist B A = dist B C)
    (hBA_BF : dist B A = dist B F)
    (hCA_CD : dist C A = dist C D)
    (hCA_CE : dist C A = dist C E)
    (hEC_ED : dist E C = dist E D)
    (hEC_EF : dist E C = dist E F)
    (hBD_ne : B ≠ D)
    (hAE_ne : A ≠ E) :
    F = C := by
  have hAC_ne : A ≠ C := by
    intro hAC
    have hAB_zero : dist A B = 0 := by
      rw [hAB_AC, hAC, dist_self]
    have hAD_zero : dist A D = 0 := by
      rw [← hAB_AD, hAB_zero]
    have hAB : A = B := dist_eq_zero.mp hAB_zero
    have hAD : A = D := dist_eq_zero.mp hAD_zero
    exact hBD_ne (hAB.symm.trans hAD)
  let N : ℝ² → ℝ² := normSim A C
  have hdist (X Y : ℝ²) :
      dist (N X) (N Y) = (dist A C)⁻¹ * dist X Y := by
    simpa [N] using normSim_dist_image A C hAC_ne X Y
  have hN_A : N A = pt 0 0 := by
    simpa [N] using normSim_fst A C
  have hN_C : N C = pt 1 0 := by
    simpa [N] using normSim_snd A C hAC_ne
  have map_dist_eq {W X Y Z : ℝ²} (h : dist W X = dist Y Z) :
      dist (N W) (N X) = dist (N Y) (N Z) := by
    rw [hdist, hdist, h]
  have map_ne {X Y : ℝ²} (hXY : X ≠ Y) : N X ≠ N Y := by
    intro hNXY
    have hzero : (dist A C)⁻¹ * dist X Y = 0 := by
      rw [← hdist]
      exact dist_eq_zero.mpr hNXY
    have hscale_ne : (dist A C)⁻¹ ≠ 0 :=
      inv_ne_zero (ne_of_gt (dist_pos.mpr hAC_ne))
    exact hXY (dist_eq_zero.mp ((mul_eq_zero.mp hzero).resolve_left hscale_ne))
  have hNF : N F = pt 1 0 := by
    apply normalized_f_eq_c_of_three_equilateral_chain
    · simpa only [hN_A, hN_C] using map_dist_eq hAB_AC
    · simpa only [hN_A] using map_dist_eq hAB_AD
    · simpa only [hN_A, hN_C] using map_dist_eq hBA_BC
    · simpa only [hN_A] using map_dist_eq hBA_BF
    · simpa only [hN_A, hN_C] using map_dist_eq hCA_CD
    · simpa only [hN_A, hN_C] using map_dist_eq hCA_CE
    · simpa only [hN_C] using map_dist_eq hEC_ED
    · simpa only [hN_C] using map_dist_eq hEC_EF
    · exact map_ne hBD_ne
    · simpa only [hN_A] using map_ne hAE_ne
  by_contra hFC
  exact map_ne hFC (by simpa only [hN_C] using hNF)

/-- The four equilateral triples are incompatible with `F ≠ C` when their
first two choices of apex are noncollapsed. -/
theorem false_of_three_equilateral_chain_and_f_ne_c
    {A B C D E F : ℝ²}
    (hAB_AC : dist A B = dist A C)
    (hAB_AD : dist A B = dist A D)
    (hBA_BC : dist B A = dist B C)
    (hBA_BF : dist B A = dist B F)
    (hCA_CD : dist C A = dist C D)
    (hCA_CE : dist C A = dist C E)
    (hEC_ED : dist E C = dist E D)
    (hEC_EF : dist E C = dist E F)
    (hBD_ne : B ≠ D)
    (hAE_ne : A ≠ E)
    (hFC_ne : F ≠ C) : False := by
  exact hFC_ne <|
    f_eq_c_of_three_equilateral_chain hAB_AC hAB_AD hBA_BC hBA_BF
      hCA_CD hCA_CE hEC_ED hEC_EF hBD_ne hAE_ne

/-- A realized row pattern containing the four equilateral triples above is
incompatible with distinct first two apex choices and a distinct terminal
point. -/
theorem false_of_realizes_three_equilateral_chain
    {α : Type*}
    {P : Census554.EqualityCore.RowPattern α}
    {pointOf : α → ℝ²}
    (hreal : Census554.EqualityCore.Realizes P pointOf)
    {a b c d e f : α}
    (hbd : b ≠ d) (hae : a ≠ e) (hfc : f ≠ c)
    (hbA : b ∈ P a) (hcA : c ∈ P a) (hdA : d ∈ P a)
    (haB : a ∈ P b) (hcB : c ∈ P b) (hfB : f ∈ P b)
    (haC : a ∈ P c) (hdC : d ∈ P c) (heC : e ∈ P c)
    (hcE : c ∈ P e) (hdE : d ∈ P e) (hfE : f ∈ P e) : False := by
  have hbd' : pointOf b ≠ pointOf d := by
    intro h
    exact hbd (hreal.injective h)
  have hae' : pointOf a ≠ pointOf e := by
    intro h
    exact hae (hreal.injective h)
  have hfc' : pointOf f ≠ pointOf c := by
    intro h
    exact hfc (hreal.injective h)
  exact false_of_three_equilateral_chain_and_f_ne_c
    (hreal.equidist a b hbA c hcA)
    (hreal.equidist a b hbA d hdA)
    (hreal.equidist b a haB c hcB)
    (hreal.equidist b a haB f hfB)
    (hreal.equidist c a haC d hdC)
    (hreal.equidist c a haC e heC)
    (hreal.equidist e c hcE d hdE)
    (hreal.equidist e c hcE f hfE)
    hbd' hae' hfc'

end Problem97
