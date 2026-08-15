/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.SixPointEuclideanObstruction

/-!
# Two triple-row six-point Euclidean obstruction

This is the exact metric schema emitted by the aligned-singleton CEGAR lane:
for six points in cyclic order `A < B < C < D < E < F`,

```text
B : {A,C,D},    F : {A,D,E}.
```

The theorem below is stated in signed-area form so it is reusable before a
particular boundary-index adapter is chosen.  It uses only the two equal-radius
triples and the seven cyclic-order signs needed by the coordinate elimination.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace TwoTripleRowSixPointEuclideanObstruction

open Census554.EqualityCore

private lemma normSim_dist_sq_eq_one
    {a b x y : ℝ²} (hab : a ≠ b) (h : dist a b = dist x y) :
    (normSim a b x 0 - normSim a b y 0) ^ 2 +
        (normSim a b x 1 - normSim a b y 1) ^ 2 = 1 := by
  have hT : dist (normSim a b a) (normSim a b b) =
      dist (normSim a b x) (normSim a b y) := by
    rw [normSim_dist_image a b hab, normSim_dist_image a b hab, h]
  have hSq := congrArg (fun t : ℝ => t ^ 2) hT
  change dist (normSim a b a) (normSim a b b) ^ 2 =
    dist (normSim a b x) (normSim a b y) ^ 2 at hSq
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hSq
  rw [normSim_fst, normSim_snd a b hab] at hSq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero,
    zero_sub, one_pow, neg_sq] at hSq
  simpa using hSq.symm

private lemma normSim_signedArea_neg
    {a b x y z : ℝ²} (hab : a ≠ b) (h : signedArea2 x y z < 0) :
    signedArea2 (normSim a b x) (normSim a b y) (normSim a b z) < 0 := by
  rw [signedArea2_normSim a b hab]
  apply mul_neg_of_pos_of_neg _ h
  apply inv_pos.mpr
  rw [← SurplusCOMPGBank.dist_sq_coord b a]
  exact sq_pos_of_pos (dist_pos.mpr hab.symm)

private lemma sq_dist_eq_coord
    {X Y : ℝ²} :
    dist X Y ^ 2 = (X 0 - Y 0) ^ 2 + (X 1 - Y 1) ^ 2 := by
  exact SurplusCOMPGBank.dist_sq_coord X Y

set_option maxHeartbeats 1200000 in
-- The coordinate normalization and nonlinear sign elimination need this budget.
theorem metric_orientation_incompatibility
    {A B C D E F : ℝ²}
    (hAD : A ≠ D)
    (hBA_BC : dist B A = dist B C)
    (hBA_BD : dist B A = dist B D)
    (hFA_FD : dist F A = dist F D)
    (hFA_FE : dist F A = dist F E)
    (hABC : signedArea2 A B C < 0)
    (hABD : signedArea2 A B D < 0)
    (hACD : signedArea2 A C D < 0)
    (hADE : signedArea2 A D E < 0)
    (hADF : signedArea2 A D F < 0)
    (hEFA : signedArea2 E F A < 0)
    (hCDE : signedArea2 C D E < 0) :
    False := by
  let T := normSim A D
  let u := T B 1
  let v := T F 1
  let x := T C 0
  let y := T C 1
  let r := T E 0
  let s := T E 1
  have hTA : T A = pt 0 0 := by
    simpa [T] using normSim_fst A D
  have hTD : T D = pt 1 0 := by
    simpa [T] using normSim_snd A D hAD
  have map_dist_eq {X Y Z W : ℝ²} (heq : dist X Y = dist Z W) :
      dist (T X) (T Y) = dist (T Z) (T W) := by
    simp only [T, normSim_dist_image A D hAD]
    rw [heq]
  have hBhalf : T B 0 = 1 / 2 := by
    have h := congrArg (fun z : ℝ => z ^ 2) (map_dist_eq hBA_BD)
    change dist (T B) (T A) ^ 2 = dist (T B) (T D) ^ 2 at h
    rw [sq_dist_eq_coord, sq_dist_eq_coord, hTA, hTD] at h
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at h
    nlinarith only [h]
  have hFhalf : T F 0 = 1 / 2 := by
    have h := congrArg (fun z : ℝ => z ^ 2) (map_dist_eq hFA_FD)
    change dist (T F) (T A) ^ 2 = dist (T F) (T D) ^ 2 at h
    rw [sq_dist_eq_coord, sq_dist_eq_coord, hTA, hTD] at h
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at h
    nlinarith only [h]
  have hu : 0 < u := by
    have h := normSim_signedArea_neg hAD hABD
    change signedArea2 (T A) (T B) (T D) < 0 at h
    rw [hTA, hTD] at h
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at h
    dsimp [u]
    nlinarith only [h]
  have hv : v < 0 := by
    have h := normSim_signedArea_neg hAD hADF
    change signedArea2 (T A) (T D) (T F) < 0 at h
    rw [hTA, hTD] at h
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at h
    dsimp [v]
    nlinarith only [h]
  have hy : 0 < y := by
    have h := normSim_signedArea_neg hAD hACD
    change signedArea2 (T A) (T C) (T D) < 0 at h
    rw [hTA, hTD] at h
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at h
    dsimp [y]
    nlinarith only [h]
  have hs : s < 0 := by
    have h := normSim_signedArea_neg hAD hADE
    change signedArea2 (T A) (T D) (T E) < 0 at h
    rw [hTA, hTD] at h
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at h
    dsimp [s]
    nlinarith only [h]
  have hCcircle : x ^ 2 - x + y ^ 2 - 2 * u * y = 0 := by
    have h := congrArg (fun z : ℝ => z ^ 2) (map_dist_eq hBA_BC)
    change dist (T B) (T A) ^ 2 = dist (T B) (T C) ^ 2 at h
    rw [sq_dist_eq_coord, sq_dist_eq_coord, hTA] at h
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at h
    dsimp [u, x, y]
    nlinarith only [h, hBhalf]
  have hEcircle : r ^ 2 - r + s ^ 2 - 2 * v * s = 0 := by
    have h := congrArg (fun z : ℝ => z ^ 2) (map_dist_eq hFA_FE)
    change dist (T F) (T A) ^ 2 = dist (T F) (T E) ^ 2 at h
    rw [sq_dist_eq_coord, sq_dist_eq_coord, hTA] at h
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at h
    dsimp [v, r, s]
    nlinarith only [h, hFhalf]
  have hABC' := normSim_signedArea_neg hAD hABC
  change signedArea2 (T A) (T B) (T C) < 0 at hABC'
  rw [hTA] at hABC'
  have hABCscalar : y / 2 - u * x < 0 := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hABC'
    rw [hBhalf] at hABC'
    dsimp [u, x, y]
    nlinarith only [hABC']
  have hEFA' := normSim_signedArea_neg hAD hEFA
  change signedArea2 (T E) (T F) (T A) < 0 at hEFA'
  rw [hTA] at hEFA'
  have hEFAscalar : r * v - s / 2 < 0 := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hEFA'
    rw [hFhalf] at hEFA'
    dsimp [v, r, s]
    nlinarith only [hEFA']
  have hxpos : 0 < x := by
    nlinarith only [hABCscalar, hu, hy]
  have hxy_sq_pos : 0 < x ^ 2 + y ^ 2 := by positivity
  have hxy_prod : 0 < (x - 1) * (x ^ 2 + y ^ 2) := by
    have hmul : y ^ 2 < 2 * u * x * y := by
      have := mul_lt_mul_of_pos_right hABCscalar (show 0 < 2 * y by positivity)
      nlinarith only [this]
    have hid : x * (x ^ 2 - x + y ^ 2) - y ^ 2 =
        (x - 1) * (x ^ 2 + y ^ 2) := by ring
    have hCcircle_mul :
        x * (x ^ 2 - x + y ^ 2 - 2 * u * y) = 0 := by
      rw [hCcircle]
      ring
    nlinarith only [hCcircle_mul, hmul, hid]
  have hxgt : 1 < x := by
    rcases (mul_pos_iff.mp hxy_prod) with hpos | hneg
    · exact sub_pos.mp hpos.1
    · nlinarith only [hneg.2, hxy_sq_pos]
  have hrpos : 0 < r := by
    by_contra hnot
    have hrnonpos : r ≤ 0 := le_of_not_gt hnot
    have hrvnonneg : 0 ≤ r * v := mul_nonneg_of_nonpos_of_nonpos hrnonpos hv.le
    linarith only [hEFAscalar, hrvnonneg, hs]
  have hrs_prod : 0 < (r - 1) * (r ^ 2 + s ^ 2) := by
    have hEFArv : r * v < s / 2 := by linarith only [hEFAscalar]
    have hmul0 := mul_lt_mul_of_neg_left hEFArv (show 2 * s < 0 by linarith)
    have hmul : r * (r ^ 2 - r + s ^ 2) > s ^ 2 := by
      have hEcircle_mul :
          r * (r ^ 2 - r + s ^ 2 - 2 * v * s) = 0 := by
        rw [hEcircle]
        ring
      nlinarith only [hEcircle_mul, hmul0]
    have hid : r * (r ^ 2 - r + s ^ 2) - s ^ 2 =
        (r - 1) * (r ^ 2 + s ^ 2) := by ring
    nlinarith only [hmul, hid]
  have hrgt : 1 < r := by
    have hrsq_pos : 0 < r ^ 2 + s ^ 2 := by positivity
    rcases (mul_pos_iff.mp hrs_prod) with hpos | hneg
    · exact sub_pos.mp hpos.1
    · nlinarith only [hneg.2, hrsq_pos]
  have hCDE' := normSim_signedArea_neg hAD hCDE
  change signedArea2 (T C) (T D) (T E) < 0 at hCDE'
  rw [hTD] at hCDE'
  have hCDEscalar : (1 - x) * s + y * (r - 1) < 0 := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hCDE'
    dsimp [x, y, r, s]
    nlinarith only [hCDE']
  have hterm1 : 0 < (1 - x) * s :=
    mul_pos_of_neg_of_neg (sub_neg.mpr hxgt) hs
  have hterm2 : 0 < y * (r - 1) :=
    mul_pos hy (sub_pos.mpr hrgt)
  linarith only [hCDEscalar, hterm1, hterm2]

/-- Reversed-orientation form of `metric_orientation_incompatibility`.
Reflection preserves the four metric equalities and negates all seven signed
areas. -/
theorem metric_orientation_incompatibility_of_pos
    {A B C D E F : ℝ²}
    (hAD : A ≠ D)
    (hBA_BC : dist B A = dist B C)
    (hBA_BD : dist B A = dist B D)
    (hFA_FD : dist F A = dist F D)
    (hFA_FE : dist F A = dist F E)
    (hABC : 0 < signedArea2 A B C)
    (hABD : 0 < signedArea2 A B D)
    (hACD : 0 < signedArea2 A C D)
    (hADE : 0 < signedArea2 A D E)
    (hADF : 0 < signedArea2 A D F)
    (hEFA : 0 < signedArea2 E F A)
    (hCDE : 0 < signedArea2 C D E) :
    False := by
  open Census554.EqualityCore in
    apply metric_orientation_incompatibility
      (A := reflectXAxis A) (B := reflectXAxis B)
      (C := reflectXAxis C) (D := reflectXAxis D)
      (E := reflectXAxis E) (F := reflectXAxis F)
  · exact fun h => hAD (reflectXAxis_injective h)
  · simpa only [dist_reflectXAxis] using hBA_BC
  · simpa only [dist_reflectXAxis] using hBA_BD
  · simpa only [dist_reflectXAxis] using hFA_FD
  · simpa only [dist_reflectXAxis] using hFA_FE
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith

/-- Boundary-order adapter for the two-triple-row six-point CEGAR cut.

The CEGAR schema is indexed by `A < B < C < D < E < F`; the two rows are
centered at `B` and `F`, with supports `{A,C,D}` and `{A,D,E}`.  The
non-wrapping order signs are supplied by `hneg_of_ccw`; the one cyclic sign
`E,F,A` is obtained by rotating the ordered triangle `A,E,F`.
-/
theorem false_of_six_ccw_two_triple_row_equalities
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id ie iff : Fin n}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (hide : id < ie) (hief : ie < iff)
    (hBA_BC :
      dist (boundary ib) (boundary ia) =
        dist (boundary ib) (boundary ic))
    (hBA_BD :
      dist (boundary ib) (boundary ia) =
        dist (boundary ib) (boundary id))
    (hFA_FD :
      dist (boundary iff) (boundary ia) =
        dist (boundary iff) (boundary id))
    (hFA_FE :
      dist (boundary iff) (boundary ia) =
        dist (boundary iff) (boundary ie)) :
    False := by
  have cyclic_area (X Y Z : ℝ²) :
      signedArea2 X Y Z = signedArea2 Y Z X := by
    simp only [signedArea2]
    ring
  have hABC :
      signedArea2 (boundary ia) (boundary ib) (boundary ic) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw hiab hibc
  have hABD :
      signedArea2 (boundary ia) (boundary ib) (boundary id) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw hiab
      (hibc.trans hicd)
  have hACD :
      signedArea2 (boundary ia) (boundary ic) (boundary id) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw
      (hiab.trans hibc) hicd
  have hADE :
      signedArea2 (boundary ia) (boundary id) (boundary ie) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw
      (hiab.trans (hibc.trans hicd)) hide
  have hADF :
      signedArea2 (boundary ia) (boundary id) (boundary iff) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw
      (hiab.trans (hibc.trans hicd)) (hide.trans hief)
  have hEFA0 :
      signedArea2 (boundary ia) (boundary ie) (boundary iff) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw
      (hiab.trans (hibc.trans (hicd.trans hide))) hief
  have hEFA :
      signedArea2 (boundary ie) (boundary iff) (boundary ia) < 0 := by
    have hrot := cyclic_area (boundary ia) (boundary ie) (boundary iff)
    rw [← hrot]
    exact hEFA0
  have hCDE :
      signedArea2 (boundary ic) (boundary id) (boundary ie) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw hicd hide
  exact metric_orientation_incompatibility
    (A := boundary ia) (B := boundary ib) (C := boundary ic)
    (D := boundary id) (E := boundary ie) (F := boundary iff)
    (hboundary_injective.ne
      (hiab.trans (hibc.trans hicd)).ne)
    hBA_BC hBA_BD hFA_FD hFA_FE hABC hABD hACD hADE hADF hEFA hCDE

private theorem signedArea2_swap12 (a b c : ℝ²) :
    signedArea2 b a c = -signedArea2 a b c := by
  simp only [signedArea2]
  ring

private theorem signedArea2_swap13 (a b c : ℝ²) :
    signedArea2 c b a = -signedArea2 a b c := by
  simp only [signedArea2]
  ring

set_option maxHeartbeats 1200000 in
-- The reversed boundary adapter expands seven signed-area transports before
-- specializing the nonlinear metric contradiction.
/-- Decreasing-index boundary adapter for the two-triple-row obstruction. -/
theorem false_of_six_ccw_two_triple_row_equalities_of_decreasing
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id ie iff : Fin n}
    (hbia : ib < ia) (hcib : ic < ib) (hdic : id < ic)
    (heid : ie < id) (hfie : iff < ie)
    (hBA_BC :
      dist (boundary ib) (boundary ia) =
        dist (boundary ib) (boundary ic))
    (hBA_BD :
      dist (boundary ib) (boundary ia) =
        dist (boundary ib) (boundary id))
    (hFA_FD :
      dist (boundary iff) (boundary ia) =
        dist (boundary iff) (boundary id))
    (hFA_FE :
      dist (boundary iff) (boundary ia) =
        dist (boundary iff) (boundary ie)) :
    False := by
  have hABC0 := hneg_of_ccw hboundary_injective hboundary_ccw hcib hbia
  have hABC : 0 < signedArea2 (boundary ia) (boundary ib) (boundary ic) := by
    rw [signedArea2_swap13] at hABC0
    linarith
  have hABD0 := hneg_of_ccw hboundary_injective hboundary_ccw
    (hdic.trans hcib) hbia
  have hABD : 0 < signedArea2 (boundary ia) (boundary ib) (boundary id) := by
    rw [signedArea2_swap13] at hABD0
    linarith
  have hACD0 := hneg_of_ccw hboundary_injective hboundary_ccw hdic
    (hcib.trans hbia)
  have hACD : 0 < signedArea2 (boundary ia) (boundary ic) (boundary id) := by
    rw [signedArea2_swap13] at hACD0
    linarith
  have hADE0 := hneg_of_ccw hboundary_injective hboundary_ccw heid
    (hdic.trans (hcib.trans hbia))
  have hADE : 0 < signedArea2 (boundary ia) (boundary id) (boundary ie) := by
    rw [signedArea2_swap13] at hADE0
    linarith
  have hADF0 := hneg_of_ccw hboundary_injective hboundary_ccw
    (hfie.trans heid) (hdic.trans (hcib.trans hbia))
  have hADF : 0 < signedArea2 (boundary ia) (boundary id) (boundary iff) := by
    rw [signedArea2_swap13] at hADF0
    linarith
  have hEFA0 := hneg_of_ccw hboundary_injective hboundary_ccw hfie
    (heid.trans (hdic.trans (hcib.trans hbia)))
  have hEFA : 0 < signedArea2 (boundary ie) (boundary iff) (boundary ia) := by
    rw [signedArea2_swap12] at hEFA0
    linarith
  have hCDE0 := hneg_of_ccw hboundary_injective hboundary_ccw heid hdic
  have hCDE : 0 < signedArea2 (boundary ic) (boundary id) (boundary ie) := by
    rw [signedArea2_swap13] at hCDE0
    linarith
  exact metric_orientation_incompatibility_of_pos
    (A := boundary ia) (B := boundary ib) (C := boundary ic)
    (D := boundary id) (E := boundary ie) (F := boundary iff)
    (hboundary_injective.ne (hdic.trans (hcib.trans hbia)).ne')
    hBA_BC hBA_BD hFA_FD hFA_FE hABC hABD hACD hADE hADF hEFA hCDE

/-- Cyclic-shift selected-row form of the increasing two-triple obstruction. -/
theorem false_of_two_selected_rows_triple_support_cyclicShift
    {carrier : Finset ℝ²} {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (BRow : SelectedFourClass carrier (boundary (b + cut)))
    (FRow : SelectedFourClass carrier (boundary (f + cut)))
    (ha_mem_BRow : boundary (a + cut) ∈ BRow.support)
    (hc_mem_BRow : boundary (c + cut) ∈ BRow.support)
    (hd_mem_BRow : boundary (d + cut) ∈ BRow.support)
    (ha_mem_FRow : boundary (a + cut) ∈ FRow.support)
    (hd_mem_FRow : boundary (d + cut) ∈ FRow.support)
    (he_mem_FRow : boundary (e + cut) ∈ FRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  apply false_of_six_ccw_two_triple_row_equalities
    (boundary := shifted)
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by simpa only [shifted] using
      isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hab hbc hcd hde hef
  · exact (BRow.support_eq_radius _ ha_mem_BRow).trans
      (BRow.support_eq_radius _ hc_mem_BRow).symm
  · exact (BRow.support_eq_radius _ ha_mem_BRow).trans
      (BRow.support_eq_radius _ hd_mem_BRow).symm
  · exact (FRow.support_eq_radius _ ha_mem_FRow).trans
      (FRow.support_eq_radius _ hd_mem_FRow).symm
  · exact (FRow.support_eq_radius _ ha_mem_FRow).trans
      (FRow.support_eq_radius _ he_mem_FRow).symm

/-- Cyclic-shift selected-row form of the decreasing two-triple obstruction. -/
theorem false_of_two_selected_rows_triple_support_cyclicShift_of_decreasing
    {carrier : Finset ℝ²} {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (BRow : SelectedFourClass carrier (boundary (b + cut)))
    (FRow : SelectedFourClass carrier (boundary (f + cut)))
    (ha_mem_BRow : boundary (a + cut) ∈ BRow.support)
    (hc_mem_BRow : boundary (c + cut) ∈ BRow.support)
    (hd_mem_BRow : boundary (d + cut) ∈ BRow.support)
    (ha_mem_FRow : boundary (a + cut) ∈ FRow.support)
    (hd_mem_FRow : boundary (d + cut) ∈ FRow.support)
    (he_mem_FRow : boundary (e + cut) ∈ FRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  apply false_of_six_ccw_two_triple_row_equalities_of_decreasing
    (boundary := shifted)
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by simpa only [shifted] using
      isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hba hcb hdc hed hfe
  · exact (BRow.support_eq_radius _ ha_mem_BRow).trans
      (BRow.support_eq_radius _ hc_mem_BRow).symm
  · exact (BRow.support_eq_radius _ ha_mem_BRow).trans
      (BRow.support_eq_radius _ hd_mem_BRow).symm
  · exact (FRow.support_eq_radius _ ha_mem_FRow).trans
      (FRow.support_eq_radius _ hd_mem_FRow).symm
  · exact (FRow.support_eq_radius _ ha_mem_FRow).trans
      (FRow.support_eq_radius _ he_mem_FRow).symm

end TwoTripleRowSixPointEuclideanObstruction
end Problem97
