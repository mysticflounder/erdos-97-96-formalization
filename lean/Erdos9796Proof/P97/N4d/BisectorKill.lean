import Erdos9796Proof.P97.N9Endpoint.Shell

/-!
# Boundary-anchored bisector kill lemma (`c5d0_qstar_outside_disk` idiom)

This module banks the reusable analytic spine of the SPEC-B `q'=a₂` W2-row
closure (the joint-K4 census of
`docs/n-lane/97-n4d-qeqe-spec-b-jointK4-census-2026-06-10.md`,
hand-proven in
`docs/n-lane/97-n4d-qeqe-spec-b-residual-handproofs-2026-06-10.md` §3 and
independently corroborated in `…-falsification-2026-06-10.md` §5).

**The lemma (faithful frame).** Let `B` be a point on the MEC circle
(centre `O`, radius `R = dist B O`) with `B`-`y`-coordinate `0` (an endpoint
anchor: `v₁` or `v₂` in the normalized frame). Let `P ≠ Q` lie on a common
circle centred at `B` (`dist B P = dist B Q`). If a point `X` in the closed
MEC disk (`dist X O ≤ dist B O`) with `X`-`y`-coordinate `≤ 0` (cap-`C₃`
side) and `X ≠ B` is equidistant from `P` and `Q`, then — with the bisector
direction `d = (P−B)+(Q−B)` satisfying `d_y > 0` and `⟨d, B−O⟩ < 0` — we get
`False`.

**Mechanism.** `X` equidistant from `P, Q` lies on the perpendicular bisector
of `PQ`, which (since `dist B P = dist B Q`) passes through `B` with direction
`d`; so `X = B + u·d`. Because `‖B−O‖ = R`, the disk margin factors as
`‖X−O‖² − R² = u·(u‖d‖² + 2⟨d, B−O⟩)`. The cap-`C₃` sign `X_y ≤ 0` with
`d_y > 0` forces `u ≤ 0`; `u = 0` gives `X = B` (excluded); `u < 0` with
`⟨d, B−O⟩ < 0` makes the margin `> 0`, i.e. `X` strictly outside the disk —
contradiction. This is the same frame-fixed analytic idiom as the banked
`c5d0_qstar_outside_disk` (`U2WitnessReflectionKernel.lean`).

The factoring identity is verified in `scripts/spec_b_spof_handproof.py`
(checks A1/A2 → residual 0).
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

/-- Squared distance in `ℝ²` coordinates. -/
private theorem bisectorKill_dist_sq_coords (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]

/-- Scalar core of the boundary-anchored bisector kill.

`B = (bx, 0)` on the MEC (anchor, `y = 0`), `O = (ox, oy)` the centre,
`P = (px, py)`, `Q = (qx, qy)`, `X = (xx, xy)`. The perpendicularity inputs
`hXperp` (`(X−B)·(P−Q) = 0`) and `hdperp` (`d·(P−Q) = 0`, where
`d = (px+qx−2bx, py+qy)`) encode "`X` on the perp-bisector through `B`". With
`P ≠ Q` (`hPQ`), `X` in the closed disk (`hdisk`), `X_y ≤ 0` (`hXy`),
`d_y > 0` (`hdy`), `⟨d, B−O⟩ < 0` (`hinner`), and `X ≠ B` (`hXne`): `False`. -/
private theorem bisectorKill_scalar (bx ox oy px py qx qy xx xy : ℝ)
    (hXperp : (xx - bx) * (px - qx) + xy * (py - qy) = 0)
    (hdperp : (px + qx - 2 * bx) * (px - qx) + (py + qy) * (py - qy) = 0)
    (hPQ : (px - qx) ^ 2 + (py - qy) ^ 2 > 0)
    (hdisk : (xx - ox) ^ 2 + (xy - oy) ^ 2 ≤ (bx - ox) ^ 2 + oy ^ 2)
    (hXy : xy ≤ 0) (hdy : 0 < py + qy)
    (hinner : (px + qx - 2 * bx) * (bx - ox) + (py + qy) * (-oy) < 0)
    (hXne : ¬ (xx = bx ∧ xy = 0)) : False := by
  set dx := px + qx - 2 * bx with hdx
  set dy := py + qy with hdy_def
  set e1 := px - qx with he1
  set e2 := py - qy with he2
  set wx := xx - bx with hwx
  -- `X−B` and `d` are both ⟂ `(P−Q)`, hence parallel (in 2D): cross product 0.
  have hcross : (wx * dy - xy * dx) * (e1 ^ 2 + e2 ^ 2) = 0 := by
    have h1 : wx * e1 + xy * e2 = 0 := hXperp
    have h2 : dx * e1 + dy * e2 = 0 := hdperp
    linear_combination (dy * e1 - dx * e2) * h1 + (wx * e2 - xy * e1) * h2
  have hcross' : wx * dy - xy * dx = 0 := by
    rcases mul_eq_zero.mp hcross with h | h
    · exact h
    · exfalso; nlinarith [hPQ]
  have hdy_ne : dy ≠ 0 := ne_of_gt hdy
  -- `X = B + u·d` with `u = X_y / d_y`.
  set u := xy / dy with hu
  have hxy_eq : xy = u * dy := by rw [hu]; field_simp
  have hwx_eq : wx = u * dx := by
    rw [hu, div_mul_eq_mul_div, eq_div_iff hdy_ne]; linarith [hcross']
  have hu_le : u ≤ 0 := by
    by_contra h; push_neg at h
    have : 0 < u * dy := mul_pos h hdy
    rw [← hxy_eq] at this; linarith [hXy]
  have hu_ne : u ≠ 0 := by
    intro h0; apply hXne
    refine ⟨?_, ?_⟩
    · have : wx = 0 := by rw [hwx_eq, h0]; ring
      simp only [hwx] at this; linarith
    · have : xy = 0 := by rw [hxy_eq, h0]; ring
      linarith
  have hu_lt : u < 0 := lt_of_le_of_ne hu_le hu_ne
  have hxx : xx = bx + u * dx := by
    have := hwx_eq; simp only [hwx] at this; linarith
  -- disk margin factoring: `‖X−O‖² − R² = u·(u‖d‖² + 2⟨d,B−O⟩)`.
  have hmargin :
      (xx - ox) ^ 2 + (xy - oy) ^ 2 - ((bx - ox) ^ 2 + oy ^ 2)
        = u * (u * (dx ^ 2 + dy ^ 2) + 2 * (dx * (bx - ox) + dy * (-oy))) := by
    rw [hxx, hxy_eq]; ring
  have hsecond : u * (dx ^ 2 + dy ^ 2) + 2 * (dx * (bx - ox) + dy * (-oy)) < 0 := by
    have h1 : u * (dx ^ 2 + dy ^ 2) ≤ 0 :=
      mul_nonpos_of_nonpos_of_nonneg (le_of_lt hu_lt) (by positivity)
    nlinarith [hinner]
  have hprod : 0 < u * (u * (dx ^ 2 + dy ^ 2) + 2 * (dx * (bx - ox) + dy * (-oy))) :=
    mul_pos_of_neg_of_neg hu_lt hsecond
  linarith [hmargin, hprod, hdisk]

set_option maxHeartbeats 1000000 in
-- The chart over the nine `EuclideanSpace ℝ (Fin 2)` coordinate projections
-- (`set`/`clear_value`) plus the `nlinarith` discharges push the elaborator
-- past the default heartbeat budget; the underlying algebra is light.
/-- **Boundary-anchored bisector kill** (`ℝ²` form).

`B` is on the MEC circle (centre `O`, radius `dist B O`) with `B 1 = 0`
(endpoint anchor in the normalized frame). `X` lies in the closed MEC disk
(`dist X O ≤ dist B O`) with `X 1 ≤ 0` (cap-`C₃` side) and is equidistant from
`P` and `Q`; `B` is too (`B` is the common circle centre / bisector anchor).
With direction `d = (P−B)+(Q−B)`: if `d`'s `y`-component `> 0`, the inner
product `⟨d, B−O⟩ < 0`, `P ≠ Q`, and `X ≠ B`, then `False`.

This is the reusable spine for the SPEC-B `q'=a₂` row's a₃/b₃ joint-K4 kill:
instantiate `B := v₂` (or `v₁`), `(P, Q)` the dead pair, `X := a₃` (or `b₃`).
Same idiom as `c5d0_qstar_outside_disk`. -/
theorem bisectorKill (B O P Q X : ℝ²)
    (hXdisk : dist X O ≤ dist B O)
    (hXeq : dist X P = dist X Q)
    (hBeq : dist B P = dist B Q)
    (hBy0 : B 1 = 0)
    (hXy : X 1 ≤ 0)
    (hdy : 0 < (P 1 - B 1) + (Q 1 - B 1))
    (hinner : ((P 0 - B 0) + (Q 0 - B 0)) * (B 0 - O 0)
       + ((P 1 - B 1) + (Q 1 - B 1)) * (B 1 - O 1) < 0)
    (hPQ : P ≠ Q) (hXne : X ≠ B) : False := by
  have hXsq : dist X P ^ 2 = dist X Q ^ 2 := by rw [hXeq]
  have hBsq : dist B P ^ 2 = dist B Q ^ 2 := by rw [hBeq]
  have hdsq : dist X O ^ 2 ≤ dist B O ^ 2 := pow_le_pow_left₀ dist_nonneg hXdisk 2
  rw [bisectorKill_dist_sq_coords, bisectorKill_dist_sq_coords] at hXsq hBsq hdsq
  have hPQne : (P 0 - Q 0) ^ 2 + (P 1 - Q 1) ^ 2 > 0 := by
    rcases lt_or_eq_of_le
        (show (0 : ℝ) ≤ (P 0 - Q 0) ^ 2 + (P 1 - Q 1) ^ 2 by positivity) with h | h
    · exact h
    · exfalso; apply hPQ
      ext i; fin_cases i
      · change P 0 = Q 0; nlinarith [sq_nonneg (P 0 - Q 0), sq_nonneg (P 1 - Q 1)]
      · change P 1 = Q 1; nlinarith [sq_nonneg (P 0 - Q 0), sq_nonneg (P 1 - Q 1)]
  have hXneq : ¬ (X 0 = B 0 ∧ X 1 = 0) := by
    rintro ⟨he0, he1⟩; apply hXne
    ext i; fin_cases i
    · exact he0
    · change X 1 = B 1; rw [he1, hBy0]
  rw [hBy0] at hBsq hdsq hdy hinner
  set bx := B 0; clear_value bx
  set ox := O 0; clear_value ox
  set oy := O 1; clear_value oy
  set px := P 0; clear_value px
  set py := P 1; clear_value py
  set qx := Q 0; clear_value qx
  set qy := Q 1; clear_value qy
  set xx := X 0; clear_value xx
  set xy := X 1; clear_value xy
  apply bisectorKill_scalar bx ox oy px py qx qy xx xy
  · nlinarith [hXsq, hBsq]
  · nlinarith [hBsq]
  · exact hPQne
  · nlinarith [hdsq]
  · exact hXy
  · linarith [hdy]
  · nlinarith [hinner]
  · exact hXneq

end Problem97
