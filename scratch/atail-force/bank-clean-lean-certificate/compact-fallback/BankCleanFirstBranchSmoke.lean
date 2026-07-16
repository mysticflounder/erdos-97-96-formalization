import Mathlib

/-!
# Compact algebra smoke for the first bank-clean circle-intersection split

This scratch file proves the exact two-branch factorization supplied by the
three `A/G/K/O` rows, then closes the `G = O` branch through a six-variable,
seven-equation Groebner call.  It is deliberately independent of production
source and is not itself a geometry-facing consumer.
-/

namespace Problem97.ATailBankCleanCompactScratch

/-- The first three circle equations say that `G` is either the origin or the
reflection of the origin across the normalized line through `A=(1,0)` and K. -/
theorem first_circle_intersection_split
    {Gx Gy Kx Ky : ℝ}
    (hG : -Gx ^ 2 + 2 * Gx - Gy ^ 2 = 0)
    (hK : -Kx ^ 2 + 2 * Kx - Ky ^ 2 = 0)
    (hKG : -Gx ^ 2 + 2 * Gx * Kx - Gy ^ 2 + 2 * Gy * Ky = 0) :
    (Gx = 0 ∧ Gy = 0) ∨
      (Gx = 2 * Ky ^ 2 ∧ Gy = 2 * Ky * (1 - Kx)) := by
  let delta : ℝ := (Kx - 1) * Gy - Ky * Gx
  have hunit : (Kx - 1) ^ 2 + Ky ^ 2 = 1 := by
    nlinarith [hK]
  have hdot : (Kx - 1) * Gx + Ky * Gy = 0 := by
    nlinarith [hG, hKG]
  have hx : Gx = -delta * Ky := by
    dsimp [delta]
    linear_combination (Kx - 1) * hdot - Gx * hunit
  have hy : Gy = delta * (Kx - 1) := by
    dsimp [delta]
    linear_combination Ky * hdot - Gy * hunit
  have hnorm : Gx ^ 2 + Gy ^ 2 = delta ^ 2 := by
    rw [hx, hy]
    nlinarith [hunit]
  have hfactor : delta * (delta + 2 * Ky) = 0 := by
    nlinarith [hG, hnorm, hx]
  rcases mul_eq_zero.mp hfactor with hzero | hreflected
  · left
    constructor <;> nlinarith [hx, hy]
  · right
    constructor <;> nlinarith [hx, hy, hreflected]

/-- Two points on the same two circles either coincide, the two centers
coincide, or the points are the two reflected intersections.  The final arm
is kept in denominator-free form so that it remains a polynomial identity. -/
theorem second_circle_intersection_split
    {Gx Gy Kx Ky Yx Yy Zx Zy : ℝ}
    (hK : (Gx - Kx) ^ 2 + (Gy - Ky) ^ 2 =
      (Yx - Kx) ^ 2 + (Yy - Ky) ^ 2)
    (hZ : (Gx - Zx) ^ 2 + (Gy - Zy) ^ 2 =
      (Yx - Zx) ^ 2 + (Yy - Zy) ^ 2) :
    (Kx = Zx ∧ Ky = Zy) ∨
      (Yx = Gx ∧ Yy = Gy) ∨
      ((((Zx - Kx) ^ 2 + (Zy - Ky) ^ 2) * (Yx - Gx) =
          2 * (-(Gx - Kx) * (Zy - Ky) + (Gy - Ky) * (Zx - Kx)) *
            (Zy - Ky)) ∧
        (((Zx - Kx) ^ 2 + (Zy - Ky) ^ 2) * (Yy - Gy) =
          -2 * (-(Gx - Kx) * (Zy - Ky) + (Gy - Ky) * (Zx - Kx)) *
            (Zx - Kx))) := by
  let ux : ℝ := Zx - Kx
  let uy : ℝ := Zy - Ky
  let dx : ℝ := Yx - Gx
  let dy : ℝ := Yy - Gy
  let D : ℝ := ux ^ 2 + uy ^ 2
  let delta : ℝ := ux * dy - uy * dx
  let q : ℝ := -(Gx - Kx) * uy + (Gy - Ky) * ux
  have hdot : ux * dx + uy * dy = 0 := by
    dsimp [ux, uy, dx, dy]
    nlinarith only [hK, hZ]
  have hdx : D * dx = -delta * uy := by
    have hidentity : D * dx + delta * uy = ux * (ux * dx + uy * dy) := by
      dsimp [D, delta]
      ring
    rw [hdot] at hidentity
    nlinarith only [hidentity]
  have hdy : D * dy = delta * ux := by
    have hidentity : D * dy - delta * ux = uy * (ux * dx + uy * dy) := by
      dsimp [D, delta]
      ring
    rw [hdot] at hidentity
    nlinarith only [hidentity]
  have hnorm : D * (dx ^ 2 + dy ^ 2) = delta ^ 2 := by
    calc
      D * (dx ^ 2 + dy ^ 2) =
          (ux * dx + uy * dy) ^ 2 + delta ^ 2 := by
            dsimp [D, delta]
            ring
      _ = delta ^ 2 := by rw [hdot]; ring
  have hcircle :
      2 * (Gx - Kx) * dx + 2 * (Gy - Ky) * dy + dx ^ 2 + dy ^ 2 = 0 := by
    dsimp [dx, dy]
    nlinarith only [hK]
  have hgd :
      D * ((Gx - Kx) * dx + (Gy - Ky) * dy) = delta * q := by
    calc
      D * ((Gx - Kx) * dx + (Gy - Ky) * dy) =
          (Gx - Kx) * (D * dx) + (Gy - Ky) * (D * dy) := by ring
      _ = (Gx - Kx) * (-delta * uy) +
          (Gy - Ky) * (delta * ux) := by rw [hdx, hdy]
      _ = delta * q := by dsimp [q]; ring
  have hscaled :
      2 * D * ((Gx - Kx) * dx + (Gy - Ky) * dy) +
          D * (dx ^ 2 + dy ^ 2) = 0 := by
    calc
      2 * D * ((Gx - Kx) * dx + (Gy - Ky) * dy) +
          D * (dx ^ 2 + dy ^ 2) = D *
            (2 * (Gx - Kx) * dx + 2 * (Gy - Ky) * dy +
              dx ^ 2 + dy ^ 2) := by ring
      _ = 0 := by rw [hcircle]; ring
  have hfactor : delta * (delta + 2 * q) = 0 := by
    nlinarith only [hscaled, hgd, hnorm]
  by_cases hD : D = 0
  · left
    have hux : ux = 0 := by
      dsimp [D] at hD
      nlinarith only [hD, sq_nonneg ux, sq_nonneg uy]
    have huy : uy = 0 := by
      dsimp [D] at hD
      nlinarith only [hD, sq_nonneg ux, sq_nonneg uy]
    constructor
    · dsimp [ux] at hux
      linarith only [hux]
    · dsimp [uy] at huy
      linarith only [huy]
  · right
    rcases mul_eq_zero.mp hfactor with hdelta | hreflected
    · left
      have hDdx : D * dx = 0 := by rw [hdx, hdelta]; ring
      have hDdy : D * dy = 0 := by rw [hdy, hdelta]; ring
      have hdxzero : dx = 0 := (mul_eq_zero.mp hDdx).resolve_left hD
      have hdyzero : dy = 0 := (mul_eq_zero.mp hDdy).resolve_left hD
      constructor
      · dsimp [dx] at hdxzero
        linarith only [hdxzero]
      · dsimp [dy] at hdyzero
        linarith only [hdyzero]
    · right
      have hdelta' : delta = -2 * q := by linarith only [hreflected]
      rw [hdelta'] at hdx hdy
      constructor
      · dsimp [D, dx, q, ux, uy] at hdx ⊢
        nlinarith only [hdx]
      · dsimp [D, dy, q, ux, uy] at hdy ⊢
        nlinarith only [hdy]

set_option maxHeartbeats 2000000 in
/-- The seven-row scalar core left when the first split is reflected and the
second split has coincident centers `Z=K`. -/
theorem reflected_centers_coincident_reduced_incompatible
    {Kx Ky Xx Xy Yx Yy : ℝ}
    (hGXK : -Kx ^ 2 + 4 * Kx * Ky * Xy - 4 * Ky ^ 2 * Xx +
      3 * Ky ^ 2 - 4 * Ky * Xy + Xx ^ 2 + Xy ^ 2 = 0)
    (hKOG : -4 * Kx ^ 2 * Ky ^ 2 + 8 * Kx * Ky ^ 2 - 4 * Ky ^ 4 = 0)
    (hXZG : -4 * Kx ^ 2 * Ky ^ 2 + Kx ^ 2 + 8 * Kx * Ky ^ 2 -
      4 * Kx * Ky * Xy - 2 * Kx * Xx - 4 * Ky ^ 4 +
      4 * Ky ^ 2 * Xx - 3 * Ky ^ 2 + 2 * Ky * Xy = 0)
    (hYOX : -Xx ^ 2 + 2 * Xx * Yx - Xy ^ 2 + 2 * Xy * Yy = 0)
    (hYOZ : -Kx ^ 2 + 2 * Kx * Yx - Ky ^ 2 + 2 * Ky * Yy = 0)
    (hZAY : 2 * Kx * Yx - 2 * Kx + 2 * Ky * Yy -
      Yx ^ 2 - Yy ^ 2 + 1 = 0)
    (hZAG : -4 * Kx ^ 2 * Ky ^ 2 + 8 * Kx * Ky ^ 2 - 2 * Kx -
      4 * Ky ^ 4 + 1 = 0) : False := by
  grobner

/-- Adapter from seven of the original normalized rows, after choosing the
reflected `G` arm and the coincident-center `Z=K` arm. -/
theorem reflected_centers_coincident_incompatible
    {Gx Gy Kx Ky Xx Xy Yx Yy Zx Zy : ℝ}
    (hGx : Gx = 2 * Ky ^ 2)
    (hGy : Gy = 2 * Ky * (1 - Kx))
    (hZx : Zx = Kx)
    (hZy : Zy = Ky)
    (hGXK : 2 * Gx * Kx - 2 * Gx * Xx + 2 * Gy * Ky -
      2 * Gy * Xy - Kx ^ 2 - Ky ^ 2 + Xx ^ 2 + Xy ^ 2 = 0)
    (hKOG : -Gx ^ 2 + 2 * Gx * Kx - Gy ^ 2 + 2 * Gy * Ky = 0)
    (hXZG : -Gx ^ 2 + 2 * Gx * Xx - Gy ^ 2 + 2 * Gy * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hYOX : -Xx ^ 2 + 2 * Xx * Yx - Xy ^ 2 + 2 * Xy * Yy = 0)
    (hYOZ : 2 * Yx * Zx + 2 * Yy * Zy - Zx ^ 2 - Zy ^ 2 = 0)
    (hZAY : -Yx ^ 2 + 2 * Yx * Zx - Yy ^ 2 + 2 * Yy * Zy -
      2 * Zx + 1 = 0)
    (hZAG : -Gx ^ 2 + 2 * Gx * Zx - Gy ^ 2 + 2 * Gy * Zy -
      2 * Zx + 1 = 0) : False := by
  rw [hGx, hGy] at hGXK hKOG hXZG hZAG
  rw [hZx, hZy] at hXZG hYOZ hZAY hZAG
  apply reflected_centers_coincident_reduced_incompatible
    (Kx := Kx) (Ky := Ky) (Xx := Xx) (Xy := Xy) (Yx := Yx) (Yy := Yy)
  · ring_nf at hGXK ⊢
    exact hGXK
  · ring_nf at hKOG ⊢
    exact hKOG
  · ring_nf at hXZG ⊢
    exact hXZG
  · exact hYOX
  · ring_nf at hYOZ ⊢
    exact hYOZ
  · ring_nf at hZAY ⊢
    exact hZAY
  · ring_nf at hZAG ⊢
    exact hZAG

/-- On the reflected first arm, the additional `Y=G` rows already force the
remaining center `K` to be either the origin or one of the two normalized
equilateral coordinates `(3/2, ±√3/2)`. -/
theorem reflected_points_coincident_K_split
    {Kx Ky Xx Xy : ℝ}
    (hGXK : -Kx ^ 2 + 4 * Kx * Ky * Xy - 4 * Ky ^ 2 * Xx +
      3 * Ky ^ 2 - 4 * Ky * Xy + Xx ^ 2 + Xy ^ 2 = 0)
    (hYOX : -4 * Kx * Ky * Xy + 4 * Ky ^ 2 * Xx + 4 * Ky * Xy -
      Xx ^ 2 - Xy ^ 2 = 0)
    (hKOG : -4 * Kx ^ 2 * Ky ^ 2 + 8 * Kx * Ky ^ 2 - 4 * Ky ^ 4 = 0) :
    (Kx = 0 ∧ Ky = 0) ∨ (Kx = (3 : ℝ) / 2 ∧ 4 * Ky ^ 2 = 3) := by
  have hshape : Kx ^ 2 = 3 * Ky ^ 2 := by
    linarith only [hGXK, hYOX]
  have hfactor : Ky ^ 2 * (Kx - 2 * Ky ^ 2) = 0 := by
    linear_combination (1 / 8 : ℝ) * hKOG + (1 / 2 : ℝ) * Ky ^ 2 * hshape
  rcases mul_eq_zero.mp hfactor with hKySq | hKxRelation
  · left
    constructor <;> nlinarith only [hshape, hKySq, sq_nonneg Kx, sq_nonneg Ky]
  · by_cases hKySq : Ky ^ 2 = 0
    · left
      constructor <;> nlinarith only [hshape, hKySq, sq_nonneg Kx, sq_nonneg Ky]
    · right
      have hKx : Kx = 2 * Ky ^ 2 := by linarith only [hKxRelation]
      have hquartic : 4 * Ky ^ 4 = 3 * Ky ^ 2 := by
        rw [hKx] at hshape
        nlinarith only [hshape]
      have hfactor' : Ky ^ 2 * (4 * Ky ^ 2 - 3) = 0 := by
        calc
          Ky ^ 2 * (4 * Ky ^ 2 - 3) = 4 * Ky ^ 4 - 3 * Ky ^ 2 := by ring
          _ = 0 := by linarith only [hquartic]
      have hKyCircle : 4 * Ky ^ 2 = 3 := by
        have := (mul_eq_zero.mp hfactor').resolve_left hKySq
        linarith only [this]
      constructor
      · nlinarith only [hKx, hKyCircle]
      · exact hKyCircle

set_option maxHeartbeats 2000000 in
/-- After the nonzero arm of `reflected_points_coincident_K_split`, msolve
minimizes the remaining `Y=G` contradiction to these eight equations in seven
effective variables. -/
theorem reflected_points_coincident_fixed_K_reduced_incompatible
    {Fx Fy Ky Xx Xy Zx Zy : ℝ}
    (hFAZ : 2 * Fx * Zx - 2 * Fx + 2 * Fy * Zy - Zx ^ 2 - Zy ^ 2 + 1 = 0)
    (hFAK : Fx + 2 * Fy * Ky - Ky ^ 2 - (5 : ℝ) / 4 = 0)
    (hXZG : -4 * Ky ^ 4 + 4 * Ky ^ 2 * Xx - Ky ^ 2 - 2 * Ky * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hXZF : -Fx ^ 2 + 2 * Fx * Xx - Fy ^ 2 + 2 * Fy * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hYOX : 4 * Ky ^ 2 * Xx - 2 * Ky * Xy - Xx ^ 2 - Xy ^ 2 = 0)
    (hYOZ : 4 * Ky ^ 2 * Zx - 2 * Ky * Zy - Zx ^ 2 - Zy ^ 2 = 0)
    (hZAG : -4 * Ky ^ 4 + 4 * Ky ^ 2 * Zx - Ky ^ 2 - 2 * Ky * Zy -
      2 * Zx + 1 = 0)
    (hKy : 4 * Ky ^ 2 - 3 = 0) : False := by
  grobner

/-- Adapter from the original rows for the fixed nonzero coordinate arm of
`Y=G`. -/
theorem reflected_points_coincident_fixed_K_incompatible
    {Fx Fy Gx Gy Kx Ky Xx Xy Yx Yy Zx Zy : ℝ}
    (hGx : Gx = 2 * Ky ^ 2)
    (hGy : Gy = 2 * Ky * (1 - Kx))
    (hYx : Yx = Gx)
    (hYy : Yy = Gy)
    (hKx : Kx = (3 : ℝ) / 2)
    (hKy : 4 * Ky ^ 2 = 3)
    (hFAZ : 2 * Fx * Zx - 2 * Fx + 2 * Fy * Zy - Zx ^ 2 - Zy ^ 2 + 1 = 0)
    (hFAK : 2 * Fx * Kx - 2 * Fx + 2 * Fy * Ky - Kx ^ 2 - Ky ^ 2 + 1 = 0)
    (hXZG : -Gx ^ 2 + 2 * Gx * Xx - Gy ^ 2 + 2 * Gy * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hXZF : -Fx ^ 2 + 2 * Fx * Xx - Fy ^ 2 + 2 * Fy * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hYOX : -Xx ^ 2 + 2 * Xx * Yx - Xy ^ 2 + 2 * Xy * Yy = 0)
    (hYOZ : 2 * Yx * Zx + 2 * Yy * Zy - Zx ^ 2 - Zy ^ 2 = 0)
    (hZAG : -Gx ^ 2 + 2 * Gx * Zx - Gy ^ 2 + 2 * Gy * Zy -
      2 * Zx + 1 = 0) : False := by
  rw [hGx, hGy] at hXZG hZAG
  rw [hYx, hYy, hGx, hGy] at hYOX hYOZ
  rw [hKx] at hFAK hXZG hYOX hYOZ hZAG
  apply reflected_points_coincident_fixed_K_reduced_incompatible
    (Fx := Fx) (Fy := Fy) (Ky := Ky) (Xx := Xx) (Xy := Xy) (Zx := Zx) (Zy := Zy)
  · exact hFAZ
  · ring_nf at hFAK ⊢
    exact hFAK
  · ring_nf at hXZG ⊢
    exact hXZG
  · exact hXZF
  · ring_nf at hYOX ⊢
    exact hYOX
  · ring_nf at hYOZ ⊢
    exact hYOZ
  · ring_nf at hZAG ⊢
    exact hZAG
  · linarith only [hKy]

set_option maxHeartbeats 2000000 in
/-- Reduced scalar contradiction for the `G = O` branch. -/
private theorem coincident_reduced_incompatible
    {Ky Xx Xy Yx Yy Zy : ℝ}
    (hK : 4 * Ky ^ 2 = 3)
    (hX : Xx ^ 2 + Xy ^ 2 = 1)
    (hKY : Yx ^ 2 + Yy ^ 2 = Yx + 2 * Ky * Yy)
    (hXY : 2 * Xx * Yx + 2 * Xy * Yy = 1)
    (hXZ : (1 : ℝ) / 4 + Zy ^ 2 = Xx + 2 * Xy * Zy)
    (hYZ : (1 : ℝ) / 4 + Zy ^ 2 = Yx + 2 * Yy * Zy)
    (hNorm : Yx ^ 2 + Yy ^ 2 = (1 : ℝ) / 4 + Zy ^ 2) : False := by
  grobner

/-- The ten retained normalized row polynomials are inconsistent after
substituting `G=(0,0)`. -/
theorem coincident_branch_incompatible
    {Ex Ey Kx Ky Xx Xy Yx Yy Zx Zy : ℝ}
    (hKcircle : -Kx ^ 2 + 2 * Kx - Ky ^ 2 = 0)
    (hXE : -Ex ^ 2 - Ey ^ 2 + Xx ^ 2 + Xy ^ 2 = 0)
    (hXK : -Kx ^ 2 - Ky ^ 2 + Xx ^ 2 + Xy ^ 2 = 0)
    (hKY : 2 * Kx * Yx + 2 * Ky * Yy - Yx ^ 2 - Yy ^ 2 = 0)
    (hE : -Ex ^ 2 - Ey ^ 2 + 1 = 0)
    (hXZ : -2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hYX : -Xx ^ 2 + 2 * Xx * Yx - Xy ^ 2 + 2 * Xy * Yy = 0)
    (hYZ : 2 * Yx * Zx + 2 * Yy * Zy - Zx ^ 2 - Zy ^ 2 = 0)
    (hZAY : -Yx ^ 2 + 2 * Yx * Zx - Yy ^ 2 + 2 * Yy * Zy - 2 * Zx + 1 = 0)
    (hZx : 1 - 2 * Zx = 0) : False := by
  have hXnorm : Xx ^ 2 + Xy ^ 2 = 1 := by
    linarith only [hXE, hE]
  have hKnorm : Kx ^ 2 + Ky ^ 2 = 1 := by
    linarith only [hXK, hXnorm]
  have hKx : Kx = (1 : ℝ) / 2 := by
    linarith only [hKcircle, hKnorm]
  have hZx' : Zx = (1 : ℝ) / 2 := by
    linarith only [hZx]
  have hK' : 4 * Ky ^ 2 = 3 := by
    have hKnorm' := hKnorm
    rw [hKx] at hKnorm'
    norm_num at hKnorm' ⊢
    linarith only [hKnorm']
  rw [hKx] at hKY
  norm_num at hKY
  have hKY' : Yx ^ 2 + Yy ^ 2 = Yx + 2 * Ky * Yy := by
    linarith only [hKY]
  have hXY' : 2 * Xx * Yx + 2 * Xy * Yy = 1 := by
    linarith only [hYX, hXnorm]
  rw [hZx'] at hXZ hYZ hZAY
  norm_num at hXZ hYZ hZAY
  have hXZ' : (1 : ℝ) / 4 + Zy ^ 2 = Xx + 2 * Xy * Zy := by
    linarith only [hXZ]
  have hYZ' : (1 : ℝ) / 4 + Zy ^ 2 = Yx + 2 * Yy * Zy := by
    linarith only [hYZ]
  have hNorm : Yx ^ 2 + Yy ^ 2 = (1 : ℝ) / 4 + Zy ^ 2 := by
    linarith only [hYZ, hZAY]
  exact coincident_reduced_incompatible hK' hXnorm hKY' hXY' hXZ' hYZ' hNorm

/-- The complete `Y=G` arm of the second circle-intersection split, assembled
from the origin and fixed-equilateral-coordinate subproofs above. -/
theorem reflected_points_coincident_incompatible
    {Ex Ey Fx Fy Gx Gy Kx Ky Xx Xy Yx Yy Zx Zy : ℝ}
    (hGx : Gx = 2 * Ky ^ 2)
    (hGy : Gy = 2 * Ky * (1 - Kx))
    (hYx : Yx = Gx)
    (hYy : Yy = Gy)
    (hAOK : -Kx ^ 2 + 2 * Kx - Ky ^ 2 = 0)
    (hFAZ : 2 * Fx * Zx - 2 * Fx + 2 * Fy * Zy - Zx ^ 2 - Zy ^ 2 + 1 = 0)
    (hFAK : 2 * Fx * Kx - 2 * Fx + 2 * Fy * Ky - Kx ^ 2 - Ky ^ 2 + 1 = 0)
    (hGXE : -Ex ^ 2 + 2 * Ex * Gx - Ey ^ 2 + 2 * Ey * Gy -
      2 * Gx * Xx - 2 * Gy * Xy + Xx ^ 2 + Xy ^ 2 = 0)
    (hGXK : 2 * Gx * Kx - 2 * Gx * Xx + 2 * Gy * Ky -
      2 * Gy * Xy - Kx ^ 2 - Ky ^ 2 + Xx ^ 2 + Xy ^ 2 = 0)
    (hKOY : 2 * Kx * Yx + 2 * Ky * Yy - Yx ^ 2 - Yy ^ 2 = 0)
    (hKOG : -Gx ^ 2 + 2 * Gx * Kx - Gy ^ 2 + 2 * Gy * Ky = 0)
    (hOAE : -Ex ^ 2 - Ey ^ 2 + 1 = 0)
    (hXZG : -Gx ^ 2 + 2 * Gx * Xx - Gy ^ 2 + 2 * Gy * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hXZF : -Fx ^ 2 + 2 * Fx * Xx - Fy ^ 2 + 2 * Fy * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hYOX : -Xx ^ 2 + 2 * Xx * Yx - Xy ^ 2 + 2 * Xy * Yy = 0)
    (hYOZ : 2 * Yx * Zx + 2 * Yy * Zy - Zx ^ 2 - Zy ^ 2 = 0)
    (hZAY : -Yx ^ 2 + 2 * Yx * Zx - Yy ^ 2 + 2 * Yy * Zy -
      2 * Zx + 1 = 0)
    (hZAG : -Gx ^ 2 + 2 * Gx * Zx - Gy ^ 2 + 2 * Gy * Zy -
      2 * Zx + 1 = 0) : False := by
  have hGXK' := hGXK
  rw [hGx, hGy] at hGXK'
  have hYOX' := hYOX
  rw [hYx, hYy, hGx, hGy] at hYOX'
  have hKOG' := hKOG
  rw [hGx, hGy] at hKOG'
  have hsplit := reflected_points_coincident_K_split
    (Kx := Kx) (Ky := Ky) (Xx := Xx) (Xy := Xy)
    (by ring_nf at hGXK' ⊢; exact hGXK')
    (by ring_nf at hYOX' ⊢; exact hYOX')
    (by ring_nf at hKOG' ⊢; exact hKOG')
  rcases hsplit with ⟨hKx0, hKy0⟩ | ⟨hKxFixed, hKyFixed⟩
  · have hGx0 : Gx = 0 := by rw [hGx, hKy0]; norm_num
    have hGy0 : Gy = 0 := by rw [hGy, hKy0]; norm_num
    apply coincident_branch_incompatible
      (Ex := Ex) (Ey := Ey) (Kx := Kx) (Ky := Ky)
      (Xx := Xx) (Xy := Xy) (Yx := Yx) (Yy := Yy) (Zx := Zx) (Zy := Zy)
    · exact hAOK
    · rw [hGx0, hGy0] at hGXE
      ring_nf at hGXE ⊢
      exact hGXE
    · rw [hGx0, hGy0] at hGXK
      ring_nf at hGXK ⊢
      exact hGXK
    · exact hKOY
    · exact hOAE
    · rw [hGx0, hGy0] at hXZG
      ring_nf at hXZG ⊢
      exact hXZG
    · exact hYOX
    · exact hYOZ
    · exact hZAY
    · rw [hGx0, hGy0] at hZAG
      ring_nf at hZAG ⊢
      exact hZAG
  · exact reflected_points_coincident_fixed_K_incompatible
      hGx hGy hYx hYy hKxFixed hKyFixed hFAZ hFAK hXZG hXZF hYOX hYOZ hZAG

/-- All non-generic arms of the fifteen-row core are contradictory.  Hence a
hypothetical solution must lie on the explicit double-reflection residual. -/
theorem bank_clean_core_forces_generic_double_reflection
    {Ex Ey Fx Fy Gx Gy Kx Ky Xx Xy Yx Yy Zx Zy : ℝ}
    (hAOG : -Gx ^ 2 + 2 * Gx - Gy ^ 2 = 0)
    (hAOK : -Kx ^ 2 + 2 * Kx - Ky ^ 2 = 0)
    (hFAZ : 2 * Fx * Zx - 2 * Fx + 2 * Fy * Zy - Zx ^ 2 - Zy ^ 2 + 1 = 0)
    (hFAK : 2 * Fx * Kx - 2 * Fx + 2 * Fy * Ky - Kx ^ 2 - Ky ^ 2 + 1 = 0)
    (hGXE : -Ex ^ 2 + 2 * Ex * Gx - Ey ^ 2 + 2 * Ey * Gy -
      2 * Gx * Xx - 2 * Gy * Xy + Xx ^ 2 + Xy ^ 2 = 0)
    (hGXK : 2 * Gx * Kx - 2 * Gx * Xx + 2 * Gy * Ky -
      2 * Gy * Xy - Kx ^ 2 - Ky ^ 2 + Xx ^ 2 + Xy ^ 2 = 0)
    (hKOY : 2 * Kx * Yx + 2 * Ky * Yy - Yx ^ 2 - Yy ^ 2 = 0)
    (hKOG : -Gx ^ 2 + 2 * Gx * Kx - Gy ^ 2 + 2 * Gy * Ky = 0)
    (hOAE : -Ex ^ 2 - Ey ^ 2 + 1 = 0)
    (hXZG : -Gx ^ 2 + 2 * Gx * Xx - Gy ^ 2 + 2 * Gy * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hXZF : -Fx ^ 2 + 2 * Fx * Xx - Fy ^ 2 + 2 * Fy * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hYOX : -Xx ^ 2 + 2 * Xx * Yx - Xy ^ 2 + 2 * Xy * Yy = 0)
    (hYOZ : 2 * Yx * Zx + 2 * Yy * Zy - Zx ^ 2 - Zy ^ 2 = 0)
    (hZAY : -Yx ^ 2 + 2 * Yx * Zx - Yy ^ 2 + 2 * Yy * Zy -
      2 * Zx + 1 = 0)
    (hZAG : -Gx ^ 2 + 2 * Gx * Zx - Gy ^ 2 + 2 * Gy * Zy -
      2 * Zx + 1 = 0) :
    Gx = 2 * Ky ^ 2 ∧ Gy = 2 * Ky * (1 - Kx) ∧
      ¬ (Kx = Zx ∧ Ky = Zy) ∧ ¬ (Yx = Gx ∧ Yy = Gy) ∧
      (((Zx - Kx) ^ 2 + (Zy - Ky) ^ 2) * (Yx - Gx) =
        2 * (-(Gx - Kx) * (Zy - Ky) + (Gy - Ky) * (Zx - Kx)) *
          (Zy - Ky)) ∧
      (((Zx - Kx) ^ 2 + (Zy - Ky) ^ 2) * (Yy - Gy) =
        -2 * (-(Gx - Kx) * (Zy - Ky) + (Gy - Ky) * (Zx - Kx)) *
          (Zx - Kx)) := by
  rcases first_circle_intersection_split hAOG hAOK hKOG with
    ⟨hGx0, hGy0⟩ | ⟨hGx, hGy⟩
  · exfalso
    apply coincident_branch_incompatible
      (Ex := Ex) (Ey := Ey) (Kx := Kx) (Ky := Ky)
      (Xx := Xx) (Xy := Xy) (Yx := Yx) (Yy := Yy) (Zx := Zx) (Zy := Zy)
    · exact hAOK
    · rw [hGx0, hGy0] at hGXE
      ring_nf at hGXE ⊢
      exact hGXE
    · rw [hGx0, hGy0] at hGXK
      ring_nf at hGXK ⊢
      exact hGXK
    · exact hKOY
    · exact hOAE
    · rw [hGx0, hGy0] at hXZG
      ring_nf at hXZG ⊢
      exact hXZG
    · exact hYOX
    · exact hYOZ
    · exact hZAY
    · rw [hGx0, hGy0] at hZAG
      ring_nf at hZAG ⊢
      exact hZAG
  · have hKcircles :
        (Gx - Kx) ^ 2 + (Gy - Ky) ^ 2 =
          (Yx - Kx) ^ 2 + (Yy - Ky) ^ 2 := by
      nlinarith only [hKOG, hKOY]
    have hZcircles :
        (Gx - Zx) ^ 2 + (Gy - Zy) ^ 2 =
          (Yx - Zx) ^ 2 + (Yy - Zy) ^ 2 := by
      nlinarith only [hZAG, hZAY]
    rcases second_circle_intersection_split hKcircles hZcircles with
      hKZ | hYG | hreflected
    · exfalso
      exact reflected_centers_coincident_incompatible
        hGx hGy hKZ.1.symm hKZ.2.symm hGXK hKOG hXZG hYOX hYOZ hZAY hZAG
    · exfalso
      exact reflected_points_coincident_incompatible
        hGx hGy hYG.1 hYG.2 hAOK hFAZ hFAK hGXE hGXK hKOY hKOG
        hOAE hXZG hXZF hYOX hYOZ hZAY hZAG
    · have hKZne : ¬ (Kx = Zx ∧ Ky = Zy) := by
        intro hKZ
        exact reflected_centers_coincident_incompatible
          hGx hGy hKZ.1.symm hKZ.2.symm hGXK hKOG hXZG hYOX hYOZ hZAY hZAG
      have hYGne : ¬ (Yx = Gx ∧ Yy = Gy) := by
        intro hYG
        exact reflected_points_coincident_incompatible
          hGx hGy hYG.1 hYG.2 hAOK hFAZ hFAK hGXE hGXK hKOY hKOG
          hOAE hXZG hXZF hYOX hYOZ hZAY hZAG
      exact ⟨hGx, hGy, hKZne, hYGne, hreflected⟩

#print axioms first_circle_intersection_split
#print axioms second_circle_intersection_split
#print axioms reflected_centers_coincident_reduced_incompatible
#print axioms reflected_centers_coincident_incompatible
#print axioms reflected_points_coincident_K_split
#print axioms reflected_points_coincident_fixed_K_reduced_incompatible
#print axioms reflected_points_coincident_fixed_K_incompatible
#print axioms coincident_branch_incompatible
#print axioms reflected_points_coincident_incompatible
#print axioms bank_clean_core_forces_generic_double_reflection

end Problem97.ATailBankCleanCompactScratch
