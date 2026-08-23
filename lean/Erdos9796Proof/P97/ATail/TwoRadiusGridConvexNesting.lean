/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna.
-/

import Erdos9796Proof.Geometry.ConvexIndepHull
import Erdos9796Proof.Geometry.SimilarityFrame
import Erdos9796Proof.P97.ATail.TwoRadiusGridCoordinateGeometry

/-!
# Convex nesting for two reflected pairs

This is the source-independent convex-hull kernel for the two-radius grid
configuration.  The frame sends the directed blocker axis `o a` to the
horizontal axis with endpoints `(-1, 0)` and `(1, 0)`.  The parameters below
are the corresponding affine-normalized longitudinal and transverse
coordinates of the two reflected pairs.
-/

open scoped EuclideanGeometry

namespace Erdos9796Proof
namespace Geometry

open Problem97.ATailTwoRadiusGridCoordinateGeometry

private lemma ofDistinct_coord_eq_scaled
    {o a p : Plane} (hoa : o ≠ a) :
    ofDistinct hoa p =
      planePoint
        (2 * scaledLongitudinalCoord o a p / ‖a - o‖ ^ 2 - 1)
        (2 * scaledTransverseCoord o a p / ‖a - o‖ ^ 2) := by
  have hden : ‖a - o‖ ^ 2 ≠ 0 := by
    exact ne_of_gt (sq_pos_of_pos (norm_pos_iff.mpr (sub_ne_zero.mpr hoa.symm)))
  change similarityFrameMap o a p = _
  ext i
  fin_cases i
  · simp [similarityFrameMap, similarityFrameLinear, planePoint,
      scaledLongitudinalCoord, scaledTransverseCoord, signedArea2,
      Problem97.signedArea2,
      EuclideanSpace.single_apply, PiLp.sub_apply, PiLp.smul_apply,
      PiLp.add_apply, PiLp.inner_apply, Fin.sum_univ_two,
      EuclideanSpace.norm_sq_eq, sq_abs, Real.norm_eq_abs]
    field_simp [hden]
    ring_nf
  · simp [similarityFrameMap, similarityFrameLinear, planePoint,
      scaledLongitudinalCoord, scaledTransverseCoord, signedArea2,
      Problem97.signedArea2,
      EuclideanSpace.single_apply, PiLp.sub_apply, PiLp.smul_apply,
      PiLp.add_apply, PiLp.inner_apply, Fin.sum_univ_two,
      EuclideanSpace.norm_sq_eq, sq_abs, Real.norm_eq_abs]
    field_simp [hden]
    ring_nf

private lemma frame_dist_sq_coord (F : SimilarityFrame q₁ q₂) (p r : Plane) :
    dist (F p) (F r) ^ 2 = (F p 0 - F r 0) ^ 2 + (F p 1 - F r 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

private lemma frame_triangle_mem
    (F : SimilarityFrame q₁ q₂) {p r t z : Plane}
    {α β γ : ℝ}
    (hα : 0 ≤ α) (hβ : 0 ≤ β) (hγ : 0 ≤ γ)
    (hsum : α + β + γ = 1)
    (hcombo : α • F p + β • F r + γ • F t = F z) :
    F z ∈ convexHull ℝ (F '' ({p, r, t} : Set Plane)) := by
  have hmem : F z ∈ convexHull ℝ ({F p, F r, F t} : Set Plane) := by
    refine mem_convexHull_of_exists_fintype (ι := Fin 3)
      (fun i => ![α, β, γ] i) (fun i => ![F p, F r, F t] i) ?_ ?_ ?_ ?_
    · intro i
      fin_cases i <;> simp [hα, hβ, hγ]
    · simpa [Fin.sum_univ_three] using hsum
    · intro i
      fin_cases i <;> simp
    · simpa [Fin.sum_univ_three] using hcombo
  have himage : F '' ({p, r, t} : Set Plane) = {F p, F r, F t} := by
    ext z
    constructor
    · rintro ⟨u, hu, rfl⟩
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hu ⊢
      rcases hu with rfl | rfl | rfl <;> simp
    · intro hz
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hz
      rcases hz with rfl | rfl | rfl
      · exact ⟨p, by simp, rfl⟩
      · exact ⟨r, by simp, rfl⟩
      · exact ⟨t, by simp, rfl⟩
  rw [himage]
  exact hmem

set_option maxHeartbeats 800000 in
-- The explicit three-point barycentric witnesses elaborate through affine hull transport.
theorem twoRadiusGrid_convex_nesting
    {A : Set Plane} {o a s sMinus L LMinus : Plane} {x y X Y : ℝ}
    (hA : EuclideanGeometry.ConvexIndep A)
    (ho : o ∈ A) (ha : a ∈ A) (hs : s ∈ A) (hsMinus : sMinus ∈ A)
    (hL : L ∈ A) (hLMinus : LMinus ∈ A)
    (hoa : o ≠ a)
    (hos : o ≠ s) (hosMinus : o ≠ sMinus)
    (hssMinus : s ≠ sMinus)
    (haL : a ≠ L) (haLMinus : a ≠ LMinus)
    (hLLMinus : L ≠ LMinus)
    (hsL : s ≠ L) (hsLMinus : s ≠ LMinus)
    (hsCoord : ofDistinct hoa s = planePoint (2 * x - 1) (2 * y))
    (hsMinusCoord :
      ofDistinct hoa sMinus = planePoint (2 * x - 1) (-2 * y))
    (hLCoord : ofDistinct hoa L = planePoint (2 * X - 1) (2 * Y))
    (hLMinusCoord :
      ofDistinct hoa LMinus = planePoint (2 * X - 1) (-2 * Y))
    (hy_nonneg : 0 ≤ y) (hY_nonneg : 0 ≤ Y)
    (hRadius : dist o s < dist o L)
    (hCommonBlocker : dist a s = dist a L) :
    0 < x ∧ 0 < y ∧ y < Y ∧ 0 < X * y - Y * x := by
  let F : SimilarityFrame o a := ofDistinct hoa
  have hoCoord : F o = planePoint (-1) 0 := by
    simpa [F] using ofDistinct_map_q₁ hoa
  have haCoord : F a = planePoint 1 0 := by
    simpa [F] using ofDistinct_map_q₂ hoa
  have hsCoord' : F s = planePoint (2 * x - 1) (2 * y) := by
    simpa [F] using hsCoord
  have hsMinusCoord' : F sMinus = planePoint (2 * x - 1) (-2 * y) := by
    simpa [F] using hsMinusCoord
  have hLCoord' : F L = planePoint (2 * X - 1) (2 * Y) := by
    simpa [F] using hLCoord
  have hLMinusCoord' : F LMinus = planePoint (2 * X - 1) (-2 * Y) := by
    simpa [F] using hLMinusCoord
  have hRadius' : dist (F o) (F s) < dist (F o) (F L) := by
    rw [F.dist_map, F.dist_map]
    exact mul_lt_mul_of_pos_left hRadius F.scale_pos
  have hCommonBlocker' : dist (F a) (F s) = dist (F a) (F L) := by
    rw [F.dist_map, F.dist_map, hCommonBlocker]
  have hRadiusSq : dist (F o) (F s) ^ 2 < dist (F o) (F L) ^ 2 := by
    have hs_nonneg : 0 ≤ dist (F o) (F s) := dist_nonneg
    have hL_nonneg : 0 ≤ dist (F o) (F L) := dist_nonneg
    nlinarith
  have hCommonBlockerSq := congrArg (fun t : ℝ ↦ t ^ 2) hCommonBlocker'
  change dist (F a) (F s) ^ 2 = dist (F a) (F L) ^ 2 at hCommonBlockerSq
  rw [frame_dist_sq_coord F, frame_dist_sq_coord F] at hRadiusSq
  rw [frame_dist_sq_coord F, frame_dist_sq_coord F] at hCommonBlockerSq
  rw [hoCoord, hsCoord', hLCoord'] at hRadiusSq
  rw [haCoord, hsCoord', hLCoord'] at hCommonBlockerSq
  simp [planePoint, EuclideanSpace.single_apply, Fin.isValue, sub_neg_eq_add] at hRadiusSq hCommonBlockerSq
  ring_nf at hRadiusSq hCommonBlockerSq
  have hXL : x < X := by
    linarith [hRadiusSq, hCommonBlockerSq]
  have hXY : Y ^ 2 - y ^ 2 = (X - x) * (2 - X - x) := by
    ring_nf
    linarith [hCommonBlockerSq]
  have hX_lt_one : X < 1 := by
    by_contra hX
    have hX' : 1 ≤ X := le_of_not_gt hX
    let α : ℝ := (X - 1) / X
    let β : ℝ := 1 / (2 * X)
    let γ : ℝ := 1 / (2 * X)
    have hXpos : 0 < X := lt_of_lt_of_le zero_lt_one hX'
    have hα_nonneg : 0 ≤ α := by
      dsimp [α]
      exact div_nonneg (sub_nonneg.mpr hX') hXpos.le
    have hβ_nonneg : 0 ≤ β := by
      dsimp [β]
      exact div_nonneg (by norm_num) (by positivity)
    have hγ_nonneg : 0 ≤ γ := by
      dsimp [γ]
      exact div_nonneg (by norm_num) (by positivity)
    have hsum : α + β + γ = 1 := by
      dsimp [α, β, γ]
      field_simp
      ring
    have hcombo : α • F o + β • F L + γ • F LMinus = F a := by
      rw [hoCoord, hLCoord', hLMinusCoord', haCoord]
      ext i
      fin_cases i <;> simp [planePoint]
      · dsimp [α, β, γ]
        field_simp
        ring
      · dsimp [α, β, γ]
        ring
    have haHull : a ∈ convexHull ℝ ({o, L, LMinus} : Set Plane) := by
      have hmem := frame_triangle_mem F (p := o) (r := L) (t := LMinus) (z := a)
        (α := α) (β := β) (γ := γ)
        hα_nonneg hβ_nonneg hγ_nonneg hsum hcombo
      exact (F.convexHull_mem_iff).mp hmem
    have hsubset : ({o, L, LMinus} : Set Plane) ⊆ A \ {a} := by
      intro p hp
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hp
      rcases hp with rfl | rfl | rfl
      · exact ⟨ho, hoa⟩
      · exact ⟨hL, Ne.symm haL⟩
      · exact ⟨hLMinus, Ne.symm haLMinus⟩
    exact (convexIndep_not_mem_convexHull_of_subset_diff hA ha hsubset) haHull
  have hx : 0 < x := by
    by_contra hx
    have hx' : x ≤ 0 := le_of_not_gt hx
    let α : ℝ := -x / (1 - x)
    let β : ℝ := 1 / (2 * (1 - x))
    let γ : ℝ := 1 / (2 * (1 - x))
    have hden : 0 < 1 - x := by nlinarith
    have hα_nonneg : 0 ≤ α := by
      dsimp [α]
      exact div_nonneg (neg_nonneg.mpr hx') hden.le
    have hβ_nonneg : 0 ≤ β := by
      dsimp [β]
      exact div_nonneg (by norm_num) (by positivity)
    have hγ_nonneg : 0 ≤ γ := by
      dsimp [γ]
      exact div_nonneg (by norm_num) (by positivity)
    have hsum : α + β + γ = 1 := by
      dsimp [α, β, γ]
      field_simp
      ring
    have hcombo : α • F a + β • F s + γ • F sMinus = F o := by
      rw [haCoord, hsCoord', hsMinusCoord', hoCoord]
      ext i
      fin_cases i <;> simp [planePoint]
      · dsimp [α, β, γ]
        field_simp
        ring
      · dsimp [α, β, γ]
        ring
    have hoHull : o ∈ convexHull ℝ ({a, s, sMinus} : Set Plane) := by
      have hmem := frame_triangle_mem F (p := a) (r := s) (t := sMinus) (z := o)
        (α := α) (β := β) (γ := γ)
        hα_nonneg hβ_nonneg hγ_nonneg hsum hcombo
      exact (F.convexHull_mem_iff).mp hmem
    have hsubset : ({a, s, sMinus} : Set Plane) ⊆ A \ {o} := by
      intro p hp
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hp
      rcases hp with rfl | rfl | rfl
      · exact ⟨ha, Ne.symm hoa⟩
      · exact ⟨hs, Ne.symm hos⟩
      · exact ⟨hsMinus, Ne.symm hosMinus⟩
    exact (convexIndep_not_mem_convexHull_of_subset_diff hA ho hsubset) hoHull
  have hy : 0 < y := by
    rcases hy_nonneg.eq_or_lt with rfl | hy
    · have heq : F s = F sMinus := by
        rw [hsCoord', hsMinusCoord']
        congr 1 <;> ring
      exact (hssMinus (F.injective heq)).elim
    · exact hy
  have hY : 0 < Y := by
    rcases hY_nonneg.eq_or_lt with rfl | hY
    · have heq : F L = F LMinus := by
        rw [hLCoord', hLMinusCoord']
        congr 1 <;> ring
      exact (hLLMinus (F.injective heq)).elim
    · exact hY
  have hYsq : 0 < Y ^ 2 - y ^ 2 := by
    have hfactor : 0 < (X - x) * (2 - X - x) := by
      have h₁ : 0 < X - x := sub_pos.mpr hXL
      have h₂ : 0 < 2 - X - x := by linarith [hx, hX_lt_one]
      exact mul_pos h₁ h₂
    rw [hXY]
    exact hfactor
  have hprod : 0 < (Y - y) * (Y + y) := by
    calc
      0 < Y ^ 2 - y ^ 2 := hYsq
      _ = (Y - y) * (Y + y) := by ring
  have hyY : y < Y := by
    rcases (mul_pos_iff.mp hprod) with h | h
    · exact sub_pos.mp h.1
    · exact False.elim ((not_lt_of_ge (le_of_lt (add_pos hY hy))) h.2)
  have hNest : 0 < X * y - Y * x := by
    by_contra hNest
    have hNest' : X * y ≤ Y * x := by
      apply le_of_not_gt
      intro h
      exact hNest (sub_pos.mpr h)
    let α : ℝ := 1 - x / X
    let β : ℝ := (x * Y + X * y) / (2 * X * Y)
    let γ : ℝ := (x * Y - X * y) / (2 * X * Y)
    have hXpos : 0 < X := lt_trans hx hXL
    have hα_nonneg : 0 ≤ α := by
      dsimp [α]
      exact sub_nonneg.mpr ((div_lt_one hXpos).2 hXL).le
    have hβ_nonneg : 0 ≤ β := by
      dsimp [β]
      exact div_nonneg (by positivity) (by positivity)
    have hγ_nonneg : 0 ≤ γ := by
      dsimp [γ]
      have hnum : 0 ≤ x * Y - X * y := by
        have h' : X * y ≤ x * Y := by simpa [mul_comm] using hNest'
        exact sub_nonneg.mpr h'
      exact div_nonneg hnum (by positivity)
    have hsum : α + β + γ = 1 := by
      dsimp [α, β, γ]
      field_simp
      ring
    have hcombo : α • F o + β • F L + γ • F LMinus = F s := by
      rw [hoCoord, hLCoord', hLMinusCoord', hsCoord']
      ext i
      fin_cases i <;> simp [planePoint]
      · dsimp [α, β, γ]
        field_simp
        ring
      · dsimp [α, β, γ]
        field_simp
        ring
    have hsHull : s ∈ convexHull ℝ ({o, L, LMinus} : Set Plane) := by
      have hmem := frame_triangle_mem F (p := o) (r := L) (t := LMinus) (z := s)
        (α := α) (β := β) (γ := γ)
        hα_nonneg hβ_nonneg hγ_nonneg hsum hcombo
      exact (F.convexHull_mem_iff).mp hmem
    have hsubset : ({o, L, LMinus} : Set Plane) ⊆ A \ {s} := by
      intro p hp
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hp
      rcases hp with rfl | rfl | rfl
      · exact ⟨ho, hos⟩
      · exact ⟨hL, Ne.symm hsL⟩
      · exact ⟨hLMinus, Ne.symm hsLMinus⟩
    exact (convexIndep_not_mem_convexHull_of_subset_diff hA hs hsubset) hsHull
  exact ⟨hx, hy, hyY, hNest⟩

set_option maxHeartbeats 800000 in
-- The adapter expands four affine coordinate conversions before reusing the kernel above.
theorem twoRadiusGrid_scaled_convex_nesting
    {A : Set Plane} {o a s sMinus L LMinus : Plane}
    (hA : EuclideanGeometry.ConvexIndep A)
    (ho : o ∈ A) (ha : a ∈ A) (hs : s ∈ A) (hsMinus : sMinus ∈ A)
    (hL : L ∈ A) (hLMinus : LMinus ∈ A)
    (hoa : o ≠ a)
    (hos : o ≠ s) (hosMinus : o ≠ sMinus)
    (hssMinus : s ≠ sMinus)
    (haL : a ≠ L) (haLMinus : a ≠ LMinus)
    (hLLMinus : L ≠ LMinus)
    (hsL : s ≠ L) (hsLMinus : s ≠ LMinus)
    (hsReflect :
      scaledLongitudinalCoord o a s = scaledLongitudinalCoord o a sMinus ∧
        scaledTransverseCoord o a s = -scaledTransverseCoord o a sMinus)
    (hLReflect :
      scaledLongitudinalCoord o a L = scaledLongitudinalCoord o a LMinus ∧
        scaledTransverseCoord o a L = -scaledTransverseCoord o a LMinus)
    (hsTrans_nonneg : 0 ≤ scaledTransverseCoord o a s)
    (hLTrans_nonneg : 0 ≤ scaledTransverseCoord o a L)
    (hRadius : dist o s < dist o L)
    (hCommonBlocker : dist a s = dist a L) :
    0 < scaledLongitudinalCoord o a s ∧
      0 < scaledTransverseCoord o a s ∧
      scaledTransverseCoord o a s < scaledTransverseCoord o a L ∧
      0 < scaledLongitudinalCoord o a L * scaledTransverseCoord o a s -
        scaledTransverseCoord o a L * scaledLongitudinalCoord o a s := by
  let N : ℝ := ‖a - o‖ ^ 2
  have hN : 0 < N := by
    dsimp [N]
    exact sq_pos_of_pos (norm_pos_iff.mpr (sub_ne_zero.mpr hoa.symm))
  let x : ℝ := scaledLongitudinalCoord o a s / N
  let y : ℝ := scaledTransverseCoord o a s / N
  let X : ℝ := scaledLongitudinalCoord o a L / N
  let Y : ℝ := scaledTransverseCoord o a L / N
  have hsCoord : ofDistinct hoa s = planePoint (2 * x - 1) (2 * y) := by
    dsimp [x, y, N]
    convert (ofDistinct_coord_eq_scaled (p := s) hoa) using 1 <;> ring
  have hsMinusCoord : ofDistinct hoa sMinus = planePoint (2 * x - 1) (-2 * y) := by
    have htransMinus : scaledTransverseCoord o a sMinus =
        -scaledTransverseCoord o a s := by
      linarith [hsReflect.2]
    have hcoord := ofDistinct_coord_eq_scaled (p := sMinus) hoa
    rw [← hsReflect.1, htransMinus] at hcoord
    dsimp [x, y, N]
    convert hcoord using 1 <;> ring
  have hLCoord : ofDistinct hoa L = planePoint (2 * X - 1) (2 * Y) := by
    dsimp [X, Y, N]
    convert (ofDistinct_coord_eq_scaled (p := L) hoa) using 1 <;> ring
  have hLMinusCoord : ofDistinct hoa LMinus = planePoint (2 * X - 1) (-2 * Y) := by
    have htransMinus : scaledTransverseCoord o a LMinus =
        -scaledTransverseCoord o a L := by
      linarith [hLReflect.2]
    have hcoord := ofDistinct_coord_eq_scaled (p := LMinus) hoa
    rw [← hLReflect.1, htransMinus] at hcoord
    dsimp [X, Y, N]
    convert hcoord using 1 <;> ring
  have hnorm := twoRadiusGrid_convex_nesting
    (A := A) (o := o) (a := a) (s := s) (sMinus := sMinus) (L := L)
    (LMinus := LMinus) (x := x) (y := y) (X := X) (Y := Y)
    hA ho ha hs hsMinus hL hLMinus hoa hos hosMinus hssMinus haL haLMinus
    hLLMinus hsL hsLMinus hsCoord hsMinusCoord hLCoord hLMinusCoord
    (div_nonneg hsTrans_nonneg hN.le) (div_nonneg hLTrans_nonneg hN.le)
    hRadius hCommonBlocker
  have hlong : 0 < scaledLongitudinalCoord o a s := by
    have hx := hnorm.1
    dsimp [x] at hx
    rcases (div_pos_iff.mp hx) with h | h
    · exact h.1
    · exact False.elim ((not_lt_of_ge hN.le) h.2)
  have htrans : 0 < scaledTransverseCoord o a s := by
    have hy := hnorm.2.1
    dsimp [y] at hy
    rcases (div_pos_iff.mp hy) with h | h
    · exact h.1
    · exact False.elim ((not_lt_of_ge hN.le) h.2)
  have htrans_lt : scaledTransverseCoord o a s < scaledTransverseCoord o a L := by
    have hyY := hnorm.2.2.1
    dsimp [y, Y] at hyY
    exact (div_lt_div_iff_of_pos_right hN).mp hyY
  have hdet : 0 < scaledLongitudinalCoord o a L * scaledTransverseCoord o a s -
      scaledTransverseCoord o a L * scaledLongitudinalCoord o a s := by
    have hdet' := hnorm.2.2.2
    dsimp [x, y, X, Y] at hdet'
    have hdet_eq :
        scaledLongitudinalCoord o a L / N * (scaledTransverseCoord o a s / N) -
            scaledTransverseCoord o a L / N * (scaledLongitudinalCoord o a s / N) =
          (scaledLongitudinalCoord o a L * scaledTransverseCoord o a s -
            scaledTransverseCoord o a L * scaledLongitudinalCoord o a s) / N ^ 2 := by
      field_simp [ne_of_gt hN]
    rw [hdet_eq] at hdet'
    rcases (div_pos_iff.mp hdet') with h | h
    · exact h.1
    · exact False.elim ((not_lt_of_ge (sq_nonneg N)) h.2)
  exact ⟨hlong, htrans, htrans_lt, hdet⟩

end Geometry
end Erdos9796Proof
