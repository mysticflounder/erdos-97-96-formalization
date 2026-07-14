/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MEC.ArcAngle
import Erdos9796Proof.P97.OangleBridge
import Erdos9796Proof.P97.Census554.EqualityCore
import residual_555_round19_mec_scalar_core

/-!
# Round-19 five-row geometry lift

This file turns the exact five-row metric equalities and the strict cyclic
order of the saved round-19 `(5,5,5)` residual into the three scalar chord
inequalities consumed by `Residual555Round19MECScalarCore`.

The important strengthening is that the proof does not use a minimum
enclosing circle or a nonobtuse-MEC hypothesis.  The common `O`-circle,
the equilateral triangle `OAC`, and the cyclic subsequence `O,A,D,E,C`
already force the required minor-arc parametrisation.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace Residual555Round19MECGeometryLift

/-- A positively oriented equilateral triangle has central oriented angle
`pi / 3`.  This local adapter keeps the orientation explicit, so it agrees
definitionally with `arcAngle`'s `stdOrientation`. -/
private theorem equilateral_oangle_toReal_eq_pi_div_three
    {o a c : ℝ²} {r : ℝ}
    (hr : 0 < r)
    (ha : dist a o = r) (hc : dist c o = r) (hac : dist a c = r)
    (hpos : 0 < signedArea2 o a c) :
    (stdOrientation.oangle (a - o) (c - o)).toReal = Real.pi / 3 := by
  have hncol : ¬ Collinear ℝ ({o, a, c} : Set ℝ²) := by
    intro hcol
    have hz := (signedArea2_eq_zero_iff_collinear o a c).2 hcol
    linarith
  have hAI : AffineIndependent ℝ ![o, a, c] :=
    affineIndependent_iff_not_collinear_set.2 hncol
  let t : Affine.Triangle ℝ ℝ² := ⟨![o, a, c], hAI⟩
  have hEq : t.Equilateral := by
    refine ⟨r, ?_⟩
    intro i j hij
    rw [show t.points = ![o, a, c] from rfl]
    fin_cases i <;> fin_cases j <;> simp_all [dist_comm]
  have hAng : EuclideanGeometry.angle a o c = Real.pi / 3 := by
    have h := hEq.angle_eq_pi_div_three
      (i₁ := 1) (i₂ := 0) (i₃ := 2)
      (by decide) (by decide) (by decide)
    simpa [t] using h
  have hao : a ≠ o := by
    intro h
    rw [h, dist_self] at ha
    linarith
  have hco : c ≠ o := by
    intro h
    rw [h, dist_self] at hc
    linarith
  have hsign : (stdOrientation.oangle (a - o) (c - o)).sign = 1 := by
    rw [← signedArea2_sign_eq_oangle_sign o a c hao hco]
    exact sign_pos hpos
  have hoangle : stdOrientation.oangle (a - o) (c - o) =
      (Real.pi / 3 : ℝ) := by
    rw [stdOrientation.oangle_eq_angle_of_sign_eq_one hsign]
    change (EuclideanGeometry.angle a o c : Real.Angle) =
      (Real.pi / 3 : ℝ)
    rw [hAng]
  rw [hoangle]
  exact Real.Angle.toReal_coe_eq_self_iff.mpr
    ⟨by linarith [Real.pi_pos], by linarith [Real.pi_pos]⟩

/-- Exact metric/order data extracted from the five saved rows.  The six
signed-area hypotheses are precisely the center-apex triples needed to read
the four consecutive chord gaps inside the equilateral arc `A--C`. -/
theorem false_of_five_row_metric_data
    {o a c d e x5 x6 x9 : ℝ²} {r : ℝ}
    (hr : 0 < r)
    (ha : dist a o = r) (hc : dist c o = r)
    (hd : dist d o = r) (he : dist e o = r)
    (hac : dist a c = r)
    (hd5 : dist d x5 = dist d a) (he5 : dist e x5 = r)
    (ha6 : dist a x6 = r) (hd6 : dist d x6 = dist d a)
    (hc9 : dist c x9 = dist c d) (he9 : dist e x9 = r)
    (hOAC : 0 < signedArea2 o a c)
    (hOAD : 0 < signedArea2 o a d)
    (hOAE : 0 < signedArea2 o a e)
    (hODE : 0 < signedArea2 o d e)
    (hODC : 0 < signedArea2 o d c)
    (hOEC : 0 < signedArea2 o e c) : False := by
  have hne : a ≠ o ∧ c ≠ o ∧ d ≠ o ∧ e ≠ o := by
    constructor
    · intro h
      rw [h, dist_self] at ha
      linarith
    constructor
    · intro h
      rw [h, dist_self] at hc
      linarith
    constructor
    · intro h
      rw [h, dist_self] at hd
      linarith
    · intro h
      rw [h, dist_self] at he
      linarith
  rcases hne with ⟨hao, hco, hdo, heo⟩
  let θAD := stdOrientation.oangle (a - o) (d - o)
  let θAE := stdOrientation.oangle (a - o) (e - o)
  let θDE := stdOrientation.oangle (d - o) (e - o)
  let θDC := stdOrientation.oangle (d - o) (c - o)
  let θEC := stdOrientation.oangle (e - o) (c - o)
  let θAC := stdOrientation.oangle (a - o) (c - o)
  have hsAD : θAD.sign = 1 := by
    dsimp [θAD]
    rw [← signedArea2_sign_eq_oangle_sign o a d hao hdo]
    exact sign_pos hOAD
  have hsAE : θAE.sign = 1 := by
    dsimp [θAE]
    rw [← signedArea2_sign_eq_oangle_sign o a e hao heo]
    exact sign_pos hOAE
  have hsDE : θDE.sign = 1 := by
    dsimp [θDE]
    rw [← signedArea2_sign_eq_oangle_sign o d e hdo heo]
    exact sign_pos hODE
  have hsDC : θDC.sign = 1 := by
    dsimp [θDC]
    rw [← signedArea2_sign_eq_oangle_sign o d c hdo hco]
    exact sign_pos hODC
  have hsEC : θEC.sign = 1 := by
    dsimp [θEC]
    rw [← signedArea2_sign_eq_oangle_sign o e c heo hco]
    exact sign_pos hOEC
  have hsAC : θAC.sign = 1 := by
    dsimp [θAC]
    rw [← signedArea2_sign_eq_oangle_sign o a c hao hco]
    exact sign_pos hOAC
  have hsumADE : θAD + θDE = θAE := by
    dsimp [θAD, θDE, θAE]
    exact stdOrientation.oangle_add (sub_ne_zero.mpr hao)
      (sub_ne_zero.mpr hdo) (sub_ne_zero.mpr heo)
  have hsumADC : θAD + θDC = θAC := by
    dsimp [θAD, θDC, θAC]
    exact stdOrientation.oangle_add (sub_ne_zero.mpr hao)
      (sub_ne_zero.mpr hdo) (sub_ne_zero.mpr hco)
  have hsumAEC : θAE + θEC = θAC := by
    dsimp [θAE, θEC, θAC]
    exact stdOrientation.oangle_add (sub_ne_zero.mpr hao)
      (sub_ne_zero.mpr heo) (sub_ne_zero.mpr hco)
  have hrealADE : θAE.toReal = θAD.toReal + θDE.toReal := by
    rw [← hsumADE]
    apply Real.Angle.toReal_add_eq_toReal_add_toReal
    · intro h
      have := congrArg Real.Angle.sign h
      simp [hsAD] at this
    · intro h
      have := congrArg Real.Angle.sign h
      simp [hsDE] at this
    · exact Or.inr (hsAD.trans (hsAE.symm.trans (congrArg Real.Angle.sign hsumADE.symm)))
  have hrealADC : θAC.toReal = θAD.toReal + θDC.toReal := by
    rw [← hsumADC]
    apply Real.Angle.toReal_add_eq_toReal_add_toReal
    · intro h
      have := congrArg Real.Angle.sign h
      simp [hsAD] at this
    · intro h
      have := congrArg Real.Angle.sign h
      simp [hsDC] at this
    · exact Or.inr (hsAD.trans (hsAC.symm.trans (congrArg Real.Angle.sign hsumADC.symm)))
  have hrealAEC : θAC.toReal = θAE.toReal + θEC.toReal := by
    rw [← hsumAEC]
    apply Real.Angle.toReal_add_eq_toReal_add_toReal
    · intro h
      have := congrArg Real.Angle.sign h
      simp [hsAE] at this
    · intro h
      have := congrArg Real.Angle.sign h
      simp [hsEC] at this
    · exact Or.inr (hsAE.trans (hsAC.symm.trans (congrArg Real.Angle.sign hsumAEC.symm)))
  have hACreal : θAC.toReal = Real.pi / 3 := by
    dsimp [θAC]
    exact equilateral_oangle_toReal_eq_pi_div_three hr ha hc hac hOAC
  let α := θAD.toReal
  let β := θAE.toReal
  have hαmem : α ∈ Set.Ioo (0 : ℝ) Real.pi := by
    dsimp [α]
    exact Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsAD
  have hβmem : β ∈ Set.Ioo (0 : ℝ) Real.pi := by
    dsimp [β]
    exact Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsAE
  have hDEmem : θDE.toReal ∈ Set.Ioo (0 : ℝ) Real.pi :=
    Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsDE
  have hDCmem : θDC.toReal ∈ Set.Ioo (0 : ℝ) Real.pi :=
    Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsDC
  have hECmem : θEC.toReal ∈ Set.Ioo (0 : ℝ) Real.pi :=
    Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsEC
  have hDEreal : θDE.toReal = β - α := by
    dsimp [α, β]
    linarith
  have hDCreal : θDC.toReal = Real.pi / 3 - α := by
    dsimp [α]
    linarith
  have hECreal : θEC.toReal = Real.pi / 3 - β := by
    dsimp [β]
    linarith
  have hαβ : α ≤ β := by
    dsimp [α, β]
    linarith [hDEmem.1]
  have hβpi : β ≤ Real.pi / 3 := by
    dsimp [β]
    linarith [hECmem.1]

  have hAD : dist a d = 2 * r * Real.sin (α / 2) := by
    have h := arcAngle_chord_length o r hr d a hd ha
    have hbridge : arcAngle o d - arcAngle o a = θAD := by
      simpa [θAD] using arcAngle_sub_arcAngle o d a hdo hao
    rw [hbridge] at h
    have hsin : 0 ≤ Real.sin (α / 2) :=
      Real.sin_nonneg_of_nonneg_of_le_pi (by linarith [hαmem.1])
        (by linarith [hαmem.2, Real.pi_pos])
    rw [abs_of_nonneg (by simpa [α] using hsin)] at h
    simpa [dist_comm, α] using h
  have hDE : dist d e = 2 * r * Real.sin ((β - α) / 2) := by
    have h := arcAngle_chord_length o r hr e d he hd
    have hbridge : arcAngle o e - arcAngle o d = θDE := by
      simpa [θDE] using arcAngle_sub_arcAngle o e d heo hdo
    rw [hbridge, hDEreal] at h
    have hsin : 0 ≤ Real.sin ((β - α) / 2) :=
      Real.sin_nonneg_of_nonneg_of_le_pi (by linarith [hαβ])
        (by linarith [hαmem.1, hβpi, Real.pi_pos])
    rw [abs_of_nonneg hsin] at h
    simpa [dist_comm] using h
  have hCD : dist c d = 2 * r * Real.sin ((Real.pi / 3 - α) / 2) := by
    have h := arcAngle_chord_length o r hr c d hc hd
    have hbridge : arcAngle o c - arcAngle o d = θDC := by
      simpa [θDC] using arcAngle_sub_arcAngle o c d hco hdo
    rw [hbridge, hDCreal] at h
    have hsin : 0 ≤ Real.sin ((Real.pi / 3 - α) / 2) :=
      Real.sin_nonneg_of_nonneg_of_le_pi
        (by linarith [hαβ, hβpi])
        (by linarith [hαmem.1, Real.pi_pos])
    rw [abs_of_nonneg hsin] at h
    exact h
  have hCE : dist c e = 2 * r * Real.sin ((Real.pi / 3 - β) / 2) := by
    have h := arcAngle_chord_length o r hr c e hc he
    have hbridge : arcAngle o c - arcAngle o e = θEC := by
      simpa [θEC] using arcAngle_sub_arcAngle o c e hco heo
    rw [hbridge, hECreal] at h
    have hsin : 0 ≤ Real.sin ((Real.pi / 3 - β) / 2) :=
      Real.sin_nonneg_of_nonneg_of_le_pi (by linarith [hβpi])
        (by linarith [hβmem.1, Real.pi_pos])
    rw [abs_of_nonneg hsin] at h
    exact h

  have h5raw : r - dist a d ≤ dist d e := by
    have htri := abs_dist_sub_le e d x5
    have hone : dist e x5 - dist d x5 ≤ dist e d :=
      (le_abs_self _).trans htri
    rw [he5, hd5, dist_comm e d] at hone
    simpa [dist_comm d a] using hone
  have h6raw : r - dist a d ≤ dist a d := by
    have htri := abs_dist_sub_le a d x6
    have hone : dist a x6 - dist d x6 ≤ dist a d :=
      (le_abs_self _).trans htri
    rw [ha6, hd6] at hone
    simpa [dist_comm d a] using hone
  have h9raw : r - dist c d ≤ dist c e := by
    have htri := abs_dist_sub_le e c x9
    have hone : dist e x9 - dist c x9 ≤ dist e c :=
      (le_abs_self _).trans htri
    rw [he9, hc9] at hone
    simpa [dist_comm e c] using hone
  have h5 : 1 - 2 * Real.sin (α / 2) ≤
      2 * Real.sin ((β - α) / 2) := by
    refine le_of_mul_le_mul_left ?_ hr
    calc
      r * (1 - 2 * Real.sin (α / 2)) = r - dist a d := by rw [hAD]; ring
      _ ≤ dist d e := h5raw
      _ = r * (2 * Real.sin ((β - α) / 2)) := by rw [hDE]; ring
  have h6 : 1 - 2 * Real.sin (α / 2) ≤ 2 * Real.sin (α / 2) := by
    refine le_of_mul_le_mul_left ?_ hr
    calc
      r * (1 - 2 * Real.sin (α / 2)) = r - dist a d := by rw [hAD]; ring
      _ ≤ dist a d := h6raw
      _ = r * (2 * Real.sin (α / 2)) := by rw [hAD]; ring
  have h9 : 1 - 2 * Real.sin ((Real.pi / 3 - α) / 2) ≤
      2 * Real.sin ((Real.pi / 3 - β) / 2) := by
    refine le_of_mul_le_mul_left ?_ hr
    calc
      r * (1 - 2 * Real.sin ((Real.pi / 3 - α) / 2)) = r - dist c d := by
        rw [hCD]
        ring
      _ ≤ dist c e := h9raw
      _ = r * (2 * Real.sin ((Real.pi / 3 - β) / 2)) := by rw [hCE]; ring
  exact
    Residual555Round19MECScalarCore.angle_lower_chord_margins_incompatible
      hαmem.1.le hαβ hβpi h5 h6 h9

/-- Reflection adapter for the clockwise / negative-signed-area convention
used by `BoundaryIndexing`.  Reflection preserves every row distance and
negates every signed area, reducing immediately to
`false_of_five_row_metric_data`. -/
theorem false_of_five_row_metric_data_neg
    {o a c d e x5 x6 x9 : ℝ²} {r : ℝ}
    (hr : 0 < r)
    (ha : dist a o = r) (hc : dist c o = r)
    (hd : dist d o = r) (he : dist e o = r)
    (hac : dist a c = r)
    (hd5 : dist d x5 = dist d a) (he5 : dist e x5 = r)
    (ha6 : dist a x6 = r) (hd6 : dist d x6 = dist d a)
    (hc9 : dist c x9 = dist c d) (he9 : dist e x9 = r)
    (hOAC : signedArea2 o a c < 0)
    (hOAD : signedArea2 o a d < 0)
    (hOAE : signedArea2 o a e < 0)
    (hODE : signedArea2 o d e < 0)
    (hODC : signedArea2 o d c < 0)
    (hOEC : signedArea2 o e c < 0) : False := by
  apply false_of_five_row_metric_data
    (o := EqualityCore.reflectXAxis o)
    (a := EqualityCore.reflectXAxis a)
    (c := EqualityCore.reflectXAxis c)
    (d := EqualityCore.reflectXAxis d)
    (e := EqualityCore.reflectXAxis e)
    (x5 := EqualityCore.reflectXAxis x5)
    (x6 := EqualityCore.reflectXAxis x6)
    (x9 := EqualityCore.reflectXAxis x9)
    (r := r) hr
  · simpa only [EqualityCore.dist_reflectXAxis] using ha
  · simpa only [EqualityCore.dist_reflectXAxis] using hc
  · simpa only [EqualityCore.dist_reflectXAxis] using hd
  · simpa only [EqualityCore.dist_reflectXAxis] using he
  · simpa only [EqualityCore.dist_reflectXAxis] using hac
  · simpa only [EqualityCore.dist_reflectXAxis] using hd5
  · simpa only [EqualityCore.dist_reflectXAxis] using he5
  · simpa only [EqualityCore.dist_reflectXAxis] using ha6
  · simpa only [EqualityCore.dist_reflectXAxis] using hd6
  · simpa only [EqualityCore.dist_reflectXAxis] using hc9
  · simpa only [EqualityCore.dist_reflectXAxis] using he9
  · rw [EqualityCore.signedArea2_reflectXAxis]
    linarith
  · rw [EqualityCore.signedArea2_reflectXAxis]
    linarith
  · rw [EqualityCore.signedArea2_reflectXAxis]
    linarith
  · rw [EqualityCore.signedArea2_reflectXAxis]
    linarith
  · rw [EqualityCore.signedArea2_reflectXAxis]
    linarith
  · rw [EqualityCore.signedArea2_reflectXAxis]
    linarith

#print axioms equilateral_oangle_toReal_eq_pi_div_three
#print axioms false_of_five_row_metric_data
#print axioms false_of_five_row_metric_data_neg

end Residual555Round19MECGeometryLift
end Census554
end Problem97
