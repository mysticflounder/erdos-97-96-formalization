import Erdos9796Proof.P97.U2.OneHitBound

/-!
# U2.B one-hit geometry — the E3-L13 interior-centre monotonicity (`N8a3`, Route A)

This module proves the **genuine open geometry** behind the U2.B one-hit bound
(`docs/u-lane/97-u2b-realization-interface-plan.md`, gap **G3**): strict radial
monotonicity from an interior cap-centre along an *adjacent* cap arc.  It is the
content the pinned interface `N8a3AdjacentCapDistanceStrict`
(`U2OneHitBound.lean`) was isolating.

## Route choice (recorded `dead-ends.md` 2026-05-29(b))

Two plausible discharge routes are **closed by proven obstructions**: composing
`b1a1M_metric` with the cap-region inscribed-angle lemmas (the required turn
inequality fails — secant- vs tangent-driven; and there is no common sphere), and
reusing the CGN6 endpoint machinery (`CGN6b` is intrinsically on-chain, the centre
must be a chain vertex).  The surviving route is **Route A**: the E3-L13
coordinate model.  N8a3 is a rigid-frame, single-variable calculus fact (the only
free reals are the two arc angles on a fixed equilateral triangle), so it has no
closure-collapse degeneracy and is honestly provable.

## The normalized coordinate model (E3-L13)

Equilateral Moser side `1`, `v₁ = (0,0)`, `v₂ = (1,0)`.  The strict open Apollonius
cap arcs are unit circles centred at the Moser vertices:

* `capU1 α = v₁ + (cos α, sin α)` — the interior centre `c` on its own cap (`C₁`),
  `α ∈ (0, π/3)`;
* `capU2 γ = v₂ + (cos(2π/3+γ), sin(2π/3+γ))` — a vertex of the **adjacent** cap
  `C₂`, `γ ∈ (0, π/3)`.

## What this module proves

* `capU1U2_dist_sq` — the squared-distance closed form
  `dist (capU1 α) (capU2 γ)² = 3 − 2cos α − 2cos(α−2π/3−γ) + 2cos(2π/3+γ)`
  (the prose `F₂(γ)`).
* `capU2_dist_strictMonoOn` — `γ ↦ dist (capU1 α) (capU2 γ)` is **strictly
  increasing** on `Icc 0 (π/3)` for `α ∈ (0, π/3)`, via the positive derivative
  `F₂'(γ) = −4 sin(α/2) cos(2π/3+γ−α/2) > 0` (`strictMonoOn_of_deriv_pos`).
* `n8a3_of_capCoordChain` — discharges the pinned interface
  `N8a3AdjacentCapDistanceStrict (capU1 α) L` for any ordered chain `L` whose
  vertices are `capU2 (γ i)` with `γ` strictly increasing into `(0, π/3)`.  This
  is the increasing-branch instance.
* `capU1U3_dist_sq` / `capU1U3_dist_sq_strictAntiOn` / `capU3_dist_strictAntiOn` /
  `n8a3_of_capCoordChainRev` — the **cap-`C₃` branch** (the mirror image): the
  squared-distance closed form
  `dist (capU1 α) (capU3 δ)² = 3 − cos α − √3·sin α − 2cos(α−4π/3−δ) + cos(4π/3+δ)
  + √3·sin(4π/3+δ)`, its strict **decrease** via the negative derivative
  `F₃'(δ) = 4 cos(α/2−2π/3) sin(2π/3+δ−α/2) < 0` (`strictAntiOn_of_deriv_neg`), and
  the interface discharge for a chain whose `C₃` arc angle `δ` is strictly
  *antitone* (the distances then increase along the chain — the
  `FiniteEndpoint.OrderedSideChain.ofOrderedCapRev` reversal, `N9EndpointN4a.lean`).

## What remains (gap R-A1)

The vocabulary bridge: producing such a `capU2`- / `capU3`-coordinate chain from a
general `CapTriple` / `SelectedClass` cap, by similarity-normalising the
equilateral packet to this side-1 frame (the proven similarity-transport pattern
at `N9EndpointN4a.lean:205`) and identifying the arc angle with `γ` / `δ`.  It is
staged behind the `hL`/`γ` (resp. `hL`/`δ`) hypotheses of `n8a3_of_capCoordChain`
(resp. `n8a3_of_capCoordChainRev`), so this module lands axiom-clean with **both**
adjacent-cap branches discharged and the bridge is the lone, clearly-scoped
follow-up.

All declarations are axiom-clean (`{propext, Classical.choice, Quot.sound}`).
-/

open Real Set
open scoped EuclideanGeometry

namespace Problem97

/-- A point of `ℝ² = EuclideanSpace ℝ (Fin 2)` from its two coordinates. -/
noncomputable def pt (x y : ℝ) : ℝ² := !₂[x, y]

/-- The interior centre `c = capU1 α` on its own cap `C₁`: the unit-circle point at
angle `α` about `v₁ = (0,0)` (E3-L13 normalized frame). -/
noncomputable def capU1 (α : ℝ) : ℝ² := pt (Real.cos α) (Real.sin α)

/-- A vertex `capU2 γ` of the adjacent cap `C₂`: the unit-circle point at angle
`2π/3 + γ` about `v₂ = (1,0)` (E3-L13 normalized frame). -/
noncomputable def capU2 (γ : ℝ) : ℝ² := pt (1 + Real.cos (2*π/3 + γ)) (Real.sin (2*π/3 + γ))

/-- **`F₂(γ)` — squared-distance closed form** (E3-L13).  The squared distance from
the interior centre `capU1 α` to the adjacent-cap vertex `capU2 γ` is
`3 − 2cos α − 2cos(α − 2π/3 − γ) + 2cos(2π/3 + γ)`. -/
theorem capU1U2_dist_sq (α γ : ℝ) :
    dist (capU1 α) (capU2 γ) ^ 2
      = 3 - 2 * Real.cos α - 2 * Real.cos (α - 2*π/3 - γ) + 2 * Real.cos (2*π/3 + γ) := by
  have norm_sub_sq : ∀ (a b : ℝ²),
      dist a b ^ 2 = (a 0 - b 0) ^ 2 + (a 1 - b 1) ^ 2 := fun a b => by
    rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
    simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]
  rw [norm_sub_sq]
  simp only [capU1, capU2, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
  have hcos_sub : Real.cos (α - 2*π/3 - γ)
      = Real.cos α * Real.cos (2*π/3 + γ) + Real.sin α * Real.sin (2*π/3 + γ) := by
    rw [show α - 2*π/3 - γ = α - (2*π/3 + γ) by ring, Real.cos_sub]
  rw [hcos_sub]
  nlinarith [Real.sin_sq_add_cos_sq α, Real.sin_sq_add_cos_sq (2*π/3 + γ)]

/-- The squared distance `γ ↦ dist (capU1 α) (capU2 γ)²` is strictly increasing on
`Icc 0 (π/3)` for `α ∈ (0, π/3)`.  Proved from the closed form `capU1U2_dist_sq`
via the positive derivative `F₂'(γ) = −4 sin(α/2) cos(2π/3+γ−α/2)` (`sin(α/2) > 0`,
`cos(2π/3+γ−α/2) < 0` because its argument lies in `(π/2, π)`). -/
theorem capU1U2_dist_sq_strictMonoOn {α : ℝ} (hα0 : 0 < α) (hα1 : α < π/3) :
    StrictMonoOn (fun γ => dist (capU1 α) (capU2 γ) ^ 2) (Set.Icc 0 (π/3)) := by
  have key : (fun γ => dist (capU1 α) (capU2 γ) ^ 2)
      = (fun γ => 3 - 2 * Real.cos α - 2 * Real.cos (α - 2*π/3 - γ)
          + 2 * Real.cos (2*π/3 + γ)) := by
    funext γ; exact capU1U2_dist_sq α γ
  rw [key]
  apply strictMonoOn_of_deriv_pos (convex_Icc 0 (π/3))
  · fun_prop
  · intro γ hγ
    rw [interior_Icc] at hγ
    obtain ⟨hγ0, hγ1⟩ := hγ
    have hd : HasDerivAt
        (fun γ => 3 - 2 * Real.cos α - 2 * Real.cos (α - 2*π/3 - γ)
          + 2 * Real.cos (2*π/3 + γ))
        (-2 * Real.sin (α - 2*π/3 - γ) - 2 * Real.sin (2*π/3 + γ)) γ := by
      have h1 : HasDerivAt (fun γ : ℝ => α - 2*π/3 - γ) (-1) γ := by
        simpa using (hasDerivAt_id γ).const_sub (α - 2*π/3)
      have h2 : HasDerivAt (fun γ : ℝ => 2*π/3 + γ) (1) γ := by
        simpa using (hasDerivAt_id γ).const_add (2*π/3)
      have c1 := (h1.cos).const_mul (2 : ℝ)
      have c2 := (h2.cos).const_mul (2 : ℝ)
      have := ((hasDerivAt_const γ (3 - 2 * Real.cos α)).sub c1).add c2
      convert this using 1; ring
    rw [hd.deriv]
    have hprod : -2 * Real.sin (α - 2*π/3 - γ) - 2 * Real.sin (2*π/3 + γ)
        = -4 * Real.sin (α/2) * Real.cos (2*π/3 + γ - α/2) := by
      have hsum := Real.sin_add_sin (α - 2*π/3 - γ) (2*π/3 + γ)
      have e1 : (α - 2*π/3 - γ + (2*π/3 + γ)) / 2 = α/2 := by ring
      have e2 : (α - 2*π/3 - γ - (2*π/3 + γ)) / 2 = -(2*π/3 + γ - α/2) := by ring
      rw [e1, e2, Real.cos_neg] at hsum; nlinarith [hsum]
    rw [hprod]
    have hsin : 0 < Real.sin (α/2) :=
      Real.sin_pos_of_pos_of_lt_pi (by linarith) (by linarith [Real.pi_pos])
    have hcos : Real.cos (2*π/3 + γ - α/2) < 0 :=
      Real.cos_neg_of_pi_div_two_lt_of_lt (by linarith) (by linarith [Real.pi_pos])
    nlinarith [hsin, hcos]

/-- **N8a3 increasing branch (cap `C₂`).**  `γ ↦ dist (capU1 α) (capU2 γ)` is
strictly increasing on `Icc 0 (π/3)` for `α ∈ (0, π/3)`.  Drops the square from
`capU1U2_dist_sq_strictMonoOn` (distances are nonnegative). -/
theorem capU2_dist_strictMonoOn {α : ℝ} (hα0 : 0 < α) (hα1 : α < π/3) :
    StrictMonoOn (fun γ => dist (capU1 α) (capU2 γ)) (Set.Icc 0 (π/3)) := by
  intro a ha b hb hab
  exact lt_of_pow_lt_pow_left₀ 2 dist_nonneg (capU1U2_dist_sq_strictMonoOn hα0 hα1 ha hb hab)

/-- **N8a3 interface discharge (increasing branch).**  Given an ordered chain `L`
whose vertices are the adjacent-cap coordinates `capU2 (γ i)` with `γ` strictly
increasing into `(0, π/3)`, and an interior centre `capU1 α` with `α ∈ (0, π/3)`,
the pinned monotonicity export `N8a3AdjacentCapDistanceStrict` holds.

This is the end-to-end Route-A discharge of the U2.B one-hit primitive in the
normalized frame; composing it with `u2_selectedClass_one_hit_of_mono`
(`U2OneHitBound.lean`) gives `|SelectedClass ∩ adjacent-cap| ≤ 1`.  The cap-`C₃`
branch is the mirror image (decreasing; reverse the chain order). -/
theorem n8a3_of_capCoordChain {α : ℝ} (hα0 : 0 < α) (hα1 : α < π/3)
    {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) (γ : Fin m → ℝ)
    (hγmem : ∀ i, γ i ∈ Set.Icc (0:ℝ) (π/3))
    (hγmono : StrictMono γ)
    (hL : ∀ i, L.points i = capU2 (γ i)) :
    N8a3AdjacentCapDistanceStrict (capU1 α) L := by
  intro i j hij
  rw [hL i, hL j]
  exact capU2_dist_strictMonoOn hα0 hα1 (hγmem i) (hγmem j) (hγmono hij)

/-! ## The cap-`C₃` branch (decreasing / mirror image)

The interior centre `capU1 α` on `C₁` has a *second* adjacent cap, `C₃`, a unit circle
about `v₃ = (1/2, √3/2)` at base angle `φ₃ = 4π/3`.  Here the radial distance is strictly
*decreasing* in the arc angle (`F₃'(δ) < 0`), the mirror of the cap-`C₂` branch above.  The
machinery is identical (closed form → signed derivative → drop the square); only the sign
of the derivative — and hence the chain ordering needed to discharge the interface — flips.
-/

/-- A vertex `capU3 δ` of the **other** adjacent cap `C₃`: the unit-circle point at angle
`4π/3 + δ` about `v₃ = (1/2, √3/2)` (E3-L13 normalized frame). -/
noncomputable def capU3 (δ : ℝ) : ℝ² :=
  pt (1/2 + Real.cos (4*π/3 + δ)) (Real.sqrt 3 / 2 + Real.sin (4*π/3 + δ))

/-- **`F₃(δ)` — squared-distance closed form** (E3-L13, cap `C₃`).  The squared distance
from the interior centre `capU1 α` to the adjacent-cap vertex `capU3 δ` is
`3 − cos α − √3·sin α − 2cos(α − 4π/3 − δ) + cos(4π/3 + δ) + √3·sin(4π/3 + δ)`. -/
theorem capU1U3_dist_sq (α δ : ℝ) :
    dist (capU1 α) (capU3 δ) ^ 2
      = 3 - Real.cos α - Real.sqrt 3 * Real.sin α
          - 2 * Real.cos (α - 4*π/3 - δ) + Real.cos (4*π/3 + δ)
          + Real.sqrt 3 * Real.sin (4*π/3 + δ) := by
  have norm_sub_sq : ∀ (a b : ℝ²),
      dist a b ^ 2 = (a 0 - b 0) ^ 2 + (a 1 - b 1) ^ 2 := fun a b => by
    rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
    simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]
  rw [norm_sub_sq]
  simp only [capU1, capU3, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
  have hcos_sub : Real.cos (α - 4*π/3 - δ)
      = Real.cos α * Real.cos (4*π/3 + δ) + Real.sin α * Real.sin (4*π/3 + δ) := by
    rw [show α - 4*π/3 - δ = α - (4*π/3 + δ) by ring, Real.cos_sub]
  rw [hcos_sub]
  linear_combination Real.sin_sq_add_cos_sq α + Real.sin_sq_add_cos_sq (4*π/3 + δ)
    + (1/4) * Real.sq_sqrt (show (0:ℝ) ≤ 3 by norm_num)

/-- The squared distance `δ ↦ dist (capU1 α) (capU3 δ)²` is strictly **decreasing** on
`Icc 0 (π/3)` for `α ∈ (0, π/3)`.  Proved from the closed form `capU1U3_dist_sq` via the
negative derivative `F₃'(δ) = 4 cos(α/2 − 2π/3) sin(2π/3 + δ − α/2)` (`cos(α/2−2π/3) < 0`
because its argument lies in `(−2π/3, −π/2)`; `sin(2π/3+δ−α/2) > 0` because its argument
lies in `(π/2, π)`). -/
theorem capU1U3_dist_sq_strictAntiOn {α : ℝ} (hα0 : 0 < α) (hα1 : α < π/3) :
    StrictAntiOn (fun δ => dist (capU1 α) (capU3 δ) ^ 2) (Set.Icc 0 (π/3)) := by
  have key : (fun δ => dist (capU1 α) (capU3 δ) ^ 2)
      = (fun δ => 3 - Real.cos α - Real.sqrt 3 * Real.sin α
          - 2 * Real.cos (α - 4*π/3 - δ) + Real.cos (4*π/3 + δ)
          + Real.sqrt 3 * Real.sin (4*π/3 + δ)) := by
    funext δ; exact capU1U3_dist_sq α δ
  rw [key]
  apply strictAntiOn_of_deriv_neg (convex_Icc 0 (π/3))
  · fun_prop
  · intro δ hδ
    rw [interior_Icc] at hδ
    obtain ⟨hδ0, hδ1⟩ := hδ
    have hd : HasDerivAt
        (fun δ => 3 - Real.cos α - Real.sqrt 3 * Real.sin α
          - 2 * Real.cos (α - 4*π/3 - δ) + Real.cos (4*π/3 + δ)
          + Real.sqrt 3 * Real.sin (4*π/3 + δ))
        (-2 * Real.sin (α - 4*π/3 - δ) - Real.sin (4*π/3 + δ)
          + Real.sqrt 3 * Real.cos (4*π/3 + δ)) δ := by
      have h1 : HasDerivAt (fun δ : ℝ => α - 4*π/3 - δ) (-1) δ := by
        simpa using (hasDerivAt_id δ).const_sub (α - 4*π/3)
      have h2 : HasDerivAt (fun δ : ℝ => 4*π/3 + δ) (1) δ := by
        simpa using (hasDerivAt_id δ).const_add (4*π/3)
      have hbase : HasDerivAt
          (fun _ : ℝ => (3:ℝ) - Real.cos α - Real.sqrt 3 * Real.sin α) 0 δ :=
        hasDerivAt_const δ _
      have t1 := (h1.cos).const_mul (2 : ℝ)
      have t2 := h2.cos
      have t3 := (h2.sin).const_mul (Real.sqrt 3)
      have := ((hbase.sub t1).add t2).add t3
      convert this using 1
      ring
    rw [hd.deriv]
    have hsp := Real.sin_sub_sin δ (α - 4*π/3 - δ)
    rw [show (δ - (α - 4*π/3 - δ)) / 2 = 2*π/3 + δ - α/2 by ring,
        show (δ + (α - 4*π/3 - δ)) / 2 = α/2 - 2*π/3 by ring] at hsp
    have hstep : -Real.sin (4*π/3 + δ) + Real.sqrt 3 * Real.cos (4*π/3 + δ)
        = 2 * Real.sin δ := by
      have hc43 : Real.cos (4*π/3) = -(1/2) := by
        rw [show (4:ℝ)*π/3 = π + π/3 by ring, Real.cos_add, Real.cos_pi, Real.sin_pi,
            Real.cos_pi_div_three]; ring
      have hs43 : Real.sin (4*π/3) = -(Real.sqrt 3 / 2) := by
        rw [show (4:ℝ)*π/3 = π + π/3 by ring, Real.sin_add, Real.cos_pi, Real.sin_pi,
            Real.sin_pi_div_three]; ring
      rw [Real.sin_add, Real.cos_add, hc43, hs43]
      linear_combination (Real.sin δ / 2) * Real.mul_self_sqrt (show (0:ℝ) ≤ 3 by norm_num)
    have hD : -2 * Real.sin (α - 4*π/3 - δ) - Real.sin (4*π/3 + δ)
          + Real.sqrt 3 * Real.cos (4*π/3 + δ)
        = 4 * Real.cos (α/2 - 2*π/3) * Real.sin (2*π/3 + δ - α/2) := by
      linear_combination 2 * hsp + hstep
    rw [hD]
    have hcos : Real.cos (α/2 - 2*π/3) < 0 := by
      rw [show α/2 - 2*π/3 = -(2*π/3 - α/2) by ring, Real.cos_neg]
      exact Real.cos_neg_of_pi_div_two_lt_of_lt (by linarith) (by linarith [Real.pi_pos])
    have hsin : 0 < Real.sin (2*π/3 + δ - α/2) :=
      Real.sin_pos_of_pos_of_lt_pi (by linarith) (by linarith [Real.pi_pos])
    nlinarith [hcos, hsin]

/-- **N8a3 decreasing branch (cap `C₃`).**  `δ ↦ dist (capU1 α) (capU3 δ)` is strictly
decreasing on `Icc 0 (π/3)` for `α ∈ (0, π/3)`.  Drops the square from
`capU1U3_dist_sq_strictAntiOn` (distances are nonnegative). -/
theorem capU3_dist_strictAntiOn {α : ℝ} (hα0 : 0 < α) (hα1 : α < π/3) :
    StrictAntiOn (fun δ => dist (capU1 α) (capU3 δ)) (Set.Icc 0 (π/3)) := by
  intro a ha b hb hab
  exact lt_of_pow_lt_pow_left₀ 2 dist_nonneg
    (capU1U3_dist_sq_strictAntiOn hα0 hα1 ha hb hab)

/-- **N8a3 interface discharge (decreasing branch, cap `C₃`).**  Given an ordered chain
`L` whose vertices are the adjacent-cap coordinates `capU3 (δ i)` with `δ` strictly
*decreasing* into `(0, π/3)`, and an interior centre `capU1 α` with `α ∈ (0, π/3)`, the
pinned monotonicity export `N8a3AdjacentCapDistanceStrict` holds.

This is the mirror of `n8a3_of_capCoordChain`: because the radial distance is strictly
*decreasing* in the `C₃` arc angle (`capU3_dist_strictAntiOn`), the chain must be indexed
by a *reversed* (strictly antitone) arc angle for the distances to increase along it —
the `FiniteEndpoint.OrderedSideChain.ofOrderedCapRev` reversal pattern
(`N9EndpointN4a.lean`).  Composing it with `u2_selectedClass_one_hit_of_mono`
(`U2OneHitBound.lean`) gives `|SelectedClass ∩ adjacent-cap C₃| ≤ 1`. -/
theorem n8a3_of_capCoordChainRev {α : ℝ} (hα0 : 0 < α) (hα1 : α < π/3)
    {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) (δ : Fin m → ℝ)
    (hδmem : ∀ i, δ i ∈ Set.Icc (0:ℝ) (π/3))
    (hδanti : StrictAnti δ)
    (hL : ∀ i, L.points i = capU3 (δ i)) :
    N8a3AdjacentCapDistanceStrict (capU1 α) L := by
  intro i j hij
  rw [hL i, hL j]
  exact capU3_dist_strictAntiOn hα0 hα1 (hδmem j) (hδmem i) (hδanti hij)

end Problem97
