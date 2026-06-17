import Erdos9796Proof.P97.U2OneHitRealization

/-!
# U2.B one-hit realization — the normalizing similarity (gap `R-A1`, construction)

This module builds the explicit **normalizing similarity** onto the E3-L13 frame
(`docs/u-lane/97-u2b-realization-interface-plan.md`, the `R-A1` construction residual,
build-step 1).  It is the structure-independent core of the vocabulary bridge:
once it lands, the residual is only the *image identities* (centre `↦ capU1 α`,
chain vertices `↦ capU2`/`capU3`) and the `arcAngle`-ordering, all consumed through
the raw distance-scaling primitive `n8a3_of_distScalingToCapU{2,3}`.

## The map

In the `ℝ² ≃ ℂ` model the normalizing similarity is complex division by the base
vector: `normSim p₁ p₂ x = (x − p₁) / (p₂ − p₁)`, which sends `p₁ ↦ 0` and `p₂ ↦ 1`
and scales every distance by `(dist p₁ p₂)⁻¹`.  It is written here directly in real
coordinates (`d = p₂ − p₁`, `ℓ² = d₀² + d₁²`):

```text
normSim p₁ p₂ x = ( ((x₀−p₁₀)d₀ + (x₁−p₁₁)d₁) / ℓ² ,
                    ((x₁−p₁₁)d₀ − (x₀−p₁₀)d₁) / ℓ² )
```

## What this module proves

* `OnArcInterior` — the strict (open-arc) interior predicate: closed-arc membership
  plus `signedArea2 ≠ 0` (off the chord).  The reusable interior-centre predicate
  (decision D2).
* `normSim_dist_image` — `dist (normSim p₁ p₂ a) (normSim p₁ p₂ b)
  = (dist p₁ p₂)⁻¹ * dist a b` (`p₁ ≠ p₂`): the only fact the transport primitive
  needs, together with positivity of the scale.
* `normSim_fst` / `normSim_snd` — the two orientation-free anchor identities
  `normSim p₁ p₂ p₁ = (0,0)` and `normSim p₁ p₂ p₂ = (1,0)`.

## What this module now closes (construction build-steps 1–3 complete)

Build-steps 1–2 (the map + the three anchors + the centre image) and build-step 3 (the
chain image identities `normSim_chainImage_capU{2,3}` and the **ordering bridge**) are all
in place.  The ordering bridge (`normSim_capU{2,3}_..._of_orient` and the `..._oriented`
assemblies) derives the chain-angle monotonicity `StrictMono γ` / `StrictAnti δ` from a
self-contained **real-frame orientation hypothesis** (`signedArea2 (apex) Lᵢ Lⱼ` has a
fixed sign along the chain), via the trig identity `signedArea2 vₖ (capUₖ a) (capUₖ b)
= sin (b − a)` and `signedArea2_normSim` transport — no `arcAngle`/`oangle` machinery.

So `n8a3_normSimChain_capU{2,3}_oriented` discharge `N8a3AdjacentCapDistanceStrict` from
purely geometric, real-frame hypotheses; the only remaining wiring is the G4/G5 adapter
that supplies the orientation hypothesis from the `SurplusCapPacket`/`SelectedClass`
convex-boundary order.

All declarations are axiom-clean (`{propext, Classical.choice, Quot.sound}`).
-/

open Real Set
open scoped EuclideanGeometry

namespace Problem97

/-- **Strict (open-arc) interior of a cap.**  `v` lies on the open arc opposite `vᵢ`
cut by the chord `vⱼ vₖ`: it is on the closed arc (`OnArcOpposite`) and strictly off the
chord (`signedArea2 v vⱼ vₖ ≠ 0`).  This is the reusable interior-centre predicate
(decision D2) refining the closed-arc `OnArcOpposite`. -/
def OnArcInterior (vi vj vk v : ℝ²) : Prop :=
  OnArcOpposite vi vj vk v ∧ signedArea2 v vj vk ≠ 0

theorem OnArcInterior.onArcOpposite {vi vj vk v : ℝ²}
    (h : OnArcInterior vi vj vk v) : OnArcOpposite vi vj vk v := h.1

/-- The normalizing similarity onto the E3-L13 frame: complex division by `p₂ − p₁`
written in real coordinates.  Sends `p₁ ↦ (0,0)`, `p₂ ↦ (1,0)`, and scales distances by
`(dist p₁ p₂)⁻¹`. -/
noncomputable def normSim (p₁ p₂ x : ℝ²) : ℝ² :=
  pt (((x 0 - p₁ 0) * (p₂ 0 - p₁ 0) + (x 1 - p₁ 1) * (p₂ 1 - p₁ 1))
        / ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2))
     (((x 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (x 0 - p₁ 0) * (p₂ 1 - p₁ 1))
        / ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2))

/-- Coordinatewise squared-distance helper for `ℝ² = EuclideanSpace ℝ (Fin 2)`. -/
private theorem normSq_sub (u v : ℝ²) :
    dist u v ^ 2 = (u 0 - v 0) ^ 2 + (u 1 - v 1) ^ 2 := by
  rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]

/-- The base-length square `ℓ² = (p₂₀−p₁₀)² + (p₂₁−p₁₁)²` is positive when `p₁ ≠ p₂`. -/
private theorem normSim_ℓ2_pos {p₁ p₂ : ℝ²} (hp : p₁ ≠ p₂) :
    0 < (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := by
  have hd : 0 < dist p₁ p₂ := dist_pos.mpr hp
  have hsq : dist p₁ p₂ ^ 2 = (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := by
    rw [normSq_sub]; ring
  nlinarith [hsq, hd]

/-- **Distance-scaling law of the normalizing similarity.**  `normSim p₁ p₂` scales every
distance by the positive factor `(dist p₁ p₂)⁻¹`.  This (with `scale_pos`) is exactly the
raw hypothesis consumed by `n8a3_of_distScalingToCapU{2,3}`. -/
theorem normSim_dist_image (p₁ p₂ : ℝ²) (hp : p₁ ≠ p₂) (a b : ℝ²) :
    dist (normSim p₁ p₂ a) (normSim p₁ p₂ b) = (dist p₁ p₂)⁻¹ * dist a b := by
  have hℓ2 : (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 ≠ 0 := ne_of_gt (normSim_ℓ2_pos hp)
  have hD : 0 < dist p₁ p₂ := dist_pos.mpr hp
  have hX : 0 ≤ dist (normSim p₁ p₂ a) (normSim p₁ p₂ b) := dist_nonneg
  have h2 : 0 ≤ (dist p₁ p₂)⁻¹ * dist a b :=
    mul_nonneg (inv_nonneg.mpr hD.le) dist_nonneg
  -- `X² · D² = Y²`, proved by clearing denominators and `ring`.
  have hkey : dist (normSim p₁ p₂ a) (normSim p₁ p₂ b) ^ 2 * dist p₁ p₂ ^ 2
      = dist a b ^ 2 := by
    rw [normSq_sub (normSim p₁ p₂ a) (normSim p₁ p₂ b), normSq_sub p₁ p₂, normSq_sub a b]
    simp only [normSim, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    field_simp
    ring
  -- promote to `X² = (D⁻¹ Y)²`, then take nonnegative square roots.
  have hsq : dist (normSim p₁ p₂ a) (normSim p₁ p₂ b) ^ 2
      = ((dist p₁ p₂)⁻¹ * dist a b) ^ 2 := by
    rw [mul_pow, inv_pow]
    field_simp
    linear_combination hkey
  rw [← Real.sqrt_sq hX, hsq, Real.sqrt_sq h2]

/-- Anchor identity: `normSim p₁ p₂ p₁ = (0, 0)`. -/
theorem normSim_fst (p₁ p₂ : ℝ²) : normSim p₁ p₂ p₁ = pt 0 0 := by
  simp only [normSim, pt, sub_self, zero_mul, add_zero, zero_div]

/-- Anchor identity: `normSim p₁ p₂ p₂ = (1, 0)` (for `p₁ ≠ p₂`). -/
theorem normSim_snd (p₁ p₂ : ℝ²) (hp : p₁ ≠ p₂) : normSim p₁ p₂ p₂ = pt 1 0 := by
  have hℓ2 : (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 ≠ 0 := ne_of_gt (normSim_ℓ2_pos hp)
  have e1 : ((p₂ 0 - p₁ 0) * (p₂ 0 - p₁ 0) + (p₂ 1 - p₁ 1) * (p₂ 1 - p₁ 1))
      / ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2) = 1 := by
    rw [div_eq_iff hℓ2]; ring
  have e2 : ((p₂ 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (p₂ 0 - p₁ 0) * (p₂ 1 - p₁ 1))
      / ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2) = 0 := by
    rw [div_eq_iff hℓ2]; ring
  rw [normSim, e1, e2]

/-- **Oriented anchor identity.**  For a positively-oriented equilateral triangle
`p₁ p₂ p₃` — equal side lengths `dist p₁ p₂ = dist p₃ p₁ = dist p₂ p₃` and orientation
`signedArea2 p₁ p₂ p₃ > 0` — the normalizing similarity sends `p₃ ↦ (1/2, √3/2)`.
This is the third E3-L13 frame anchor (build-step 1b); the side lengths force the
real part to `1/2` and the orientation selects the `+√3/2` root of the imaginary part. -/
theorem normSim_thd (p₁ p₂ p₃ : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃) :
    normSim p₁ p₂ p₃ = pt (1 / 2) (Real.sqrt 3 / 2) := by
  have hℓ2 : 0 < (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := normSim_ℓ2_pos hp
  have hℓ2' : (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 ≠ 0 := ne_of_gt hℓ2
  -- Coordinate squared-distance equalities from the two equal sides.
  have eqA : (p₃ 0 - p₁ 0) ^ 2 + (p₃ 1 - p₁ 1) ^ 2
      = (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := by
    have h : dist p₃ p₁ ^ 2 = dist p₁ p₂ ^ 2 := by rw [h31]
    rw [normSq_sub p₃ p₁, normSq_sub p₁ p₂] at h; linear_combination h
  have eqB : (p₃ 0 - p₂ 0) ^ 2 + (p₃ 1 - p₂ 1) ^ 2
      = (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := by
    have h : dist p₂ p₃ ^ 2 = dist p₁ p₂ ^ 2 := by rw [h23]
    rw [normSq_sub p₂ p₃, normSq_sub p₁ p₂] at h; linear_combination h
  -- The real-part numerator equals `ℓ²/2`.
  have hNX : 2 * ((p₃ 0 - p₁ 0) * (p₂ 0 - p₁ 0) + (p₃ 1 - p₁ 1) * (p₂ 1 - p₁ 1))
      = (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := by linear_combination eqA - eqB
  -- The imaginary-part numerator squares to `(3/4)·ℓ⁴`.
  have hNY2 : ((p₃ 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (p₃ 0 - p₁ 0) * (p₂ 1 - p₁ 1)) ^ 2
      = 3 / 4 * ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2) ^ 2 := by
    have ringid : ((p₃ 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (p₃ 0 - p₁ 0) * (p₂ 1 - p₁ 1)) ^ 2
        = ((p₃ 0 - p₁ 0) ^ 2 + (p₃ 1 - p₁ 1) ^ 2)
            * ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2)
          - ((p₃ 0 - p₁ 0) * (p₂ 0 - p₁ 0) + (p₃ 1 - p₁ 1) * (p₂ 1 - p₁ 1)) ^ 2 := by ring
    have hNXhalf : (p₃ 0 - p₁ 0) * (p₂ 0 - p₁ 0) + (p₃ 1 - p₁ 1) * (p₂ 1 - p₁ 1)
        = ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2) / 2 := by linarith [hNX]
    rw [ringid, eqA, hNXhalf]; ring
  -- Real part `= 1/2`.
  have hX : ((p₃ 0 - p₁ 0) * (p₂ 0 - p₁ 0) + (p₃ 1 - p₁ 1) * (p₂ 1 - p₁ 1))
      / ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2) = 1 / 2 := by
    rw [div_eq_iff hℓ2']; linarith [hNX]
  -- Imaginary-part numerator is positive (it is `signedArea2`).
  have hNYpos : 0 < (p₃ 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (p₃ 0 - p₁ 0) * (p₂ 1 - p₁ 1) := by
    have heq : signedArea2 p₁ p₂ p₃
        = (p₃ 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (p₃ 0 - p₁ 0) * (p₂ 1 - p₁ 1) := by
      simp only [signedArea2]; ring
    rw [← heq]; exact hori
  -- Imaginary part `= √3/2`.
  have hsqrt3sq : Real.sqrt 3 ^ 2 = 3 := Real.sq_sqrt (by norm_num)
  have hRHS : (0 : ℝ) ≤ Real.sqrt 3 / 2 * ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2) := by
    positivity
  have hNYval : (p₃ 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (p₃ 0 - p₁ 0) * (p₂ 1 - p₁ 1)
      = Real.sqrt 3 / 2 * ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2) := by
    have hsq : ((p₃ 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (p₃ 0 - p₁ 0) * (p₂ 1 - p₁ 1)) ^ 2
        = (Real.sqrt 3 / 2 * ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2)) ^ 2 := by
      rw [hNY2, mul_pow, div_pow, hsqrt3sq]; ring
    have := congrArg Real.sqrt hsq
    rwa [Real.sqrt_sq hNYpos.le, Real.sqrt_sq hRHS] at this
  have hY : ((p₃ 1 - p₁ 1) * (p₂ 0 - p₁ 0) - (p₃ 0 - p₁ 0) * (p₂ 1 - p₁ 1))
      / ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2) = Real.sqrt 3 / 2 := by
    rw [div_eq_iff hℓ2', hNYval]
  simp only [normSim]
  rw [hX, hY]

/-- Distance from a normalized image to the frame origin `(0,0) = normSim p₁ p₂ p₁`:
`(dist p₁ p₂)⁻¹ · dist s p₁`.  In particular the centre image lands on the unit circle
about the origin (`= capU1 α` for some `α`) exactly when `dist s p₁ = dist p₁ p₂`. -/
theorem normSim_dist_fst (p₁ p₂ s : ℝ²) (hp : p₁ ≠ p₂) :
    dist (normSim p₁ p₂ s) (pt 0 0) = (dist p₁ p₂)⁻¹ * dist s p₁ := by
  rw [← normSim_fst p₁ p₂, normSim_dist_image p₁ p₂ hp s p₁]

/-- Distance from a normalized image to the frame point `(1,0) = normSim p₁ p₂ p₂`:
`(dist p₁ p₂)⁻¹ · dist s p₂`. -/
theorem normSim_dist_snd (p₁ p₂ s : ℝ²) (hp : p₁ ≠ p₂) :
    dist (normSim p₁ p₂ s) (pt 1 0) = (dist p₁ p₂)⁻¹ * dist s p₂ := by
  rw [← normSim_snd p₁ p₂ hp, normSim_dist_image p₁ p₂ hp s p₂]

/-- A point at distance `1` from the frame origin `(0,0)` is `capU1` of its argument:
`dist q (0,0) = 1 ⟹ ∃ α, q = capU1 α`.  This is the unit-circle membership half of the
centre-image identity (build-step 2): once `normSim_dist_fst` gives `dist (T s) (0,0) = 1`
(equivalently `dist s p₁ = dist p₁ p₂`), the image equals `capU1 α` for some angle `α`. -/
theorem exists_capU1_of_dist_origin_one (q : ℝ²) (hq : dist q (pt 0 0) = 1) :
    ∃ α : ℝ, -π < α ∧ α ≤ π ∧ q = capU1 α := by
  have hcoord : (q 0) ^ 2 + (q 1) ^ 2 = 1 := by
    have h := normSq_sub q (pt 0 0)
    rw [hq] at h
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at h
    nlinarith [h]
  set z : ℂ := ⟨q 0, q 1⟩ with hz
  have hnsq : Complex.normSq z = 1 := by
    rw [hz, Complex.normSq_mk]; nlinarith [hcoord]
  have habs : ‖z‖ = 1 := by rw [Complex.norm_def, hnsq, Real.sqrt_one]
  have hzne : z ≠ 0 := by
    intro h; rw [h, norm_zero] at habs; exact one_ne_zero habs.symm
  refine ⟨z.arg, Complex.neg_pi_lt_arg z, Complex.arg_le_pi z, ?_⟩
  have hcos : Real.cos z.arg = q 0 := by
    rw [Complex.cos_arg hzne, habs, div_one]
  have hsin : Real.sin z.arg = q 1 := by
    rw [Complex.sin_arg, habs, div_one]
  rw [capU1, hcos, hsin]
  ext i
  fin_cases i <;> rfl

/-- **Orientation-scaling law of the normalizing similarity.**  `normSim p₁ p₂` scales the
signed area of every triangle by the *positive* factor `L⁻¹ = (dist p₁ p₂)⁻²` (where
`L = (p₂₀−p₁₀)² + (p₂₁−p₁₁)²`).  In particular it preserves the sign of `signedArea2`, so
every side/arc condition (`OnArcOpposite`, `OnArcInterior`) transfers from a point to its
image.  Proved by the coordinate identity `image-cross · L² = L · signedArea2 a b c`. -/
theorem signedArea2_normSim (p₁ p₂ : ℝ²) (hp : p₁ ≠ p₂) (a b c : ℝ²) :
    signedArea2 (normSim p₁ p₂ a) (normSim p₁ p₂ b) (normSim p₁ p₂ c)
      = ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2)⁻¹ * signedArea2 a b c := by
  have hL : (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 ≠ 0 := ne_of_gt (normSim_ℓ2_pos hp)
  simp only [signedArea2, normSim, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
  field_simp
  ring

/-- **Open-arc angle range of cap `C₁`.**  In the normalized E3-L13 frame, a unit-circle
point `capU1 α` (with `α` taken as a principal argument, `-π < α ≤ π`) that lies strictly
inside the wedge `∠ v₂ v₁ v₃` at the apex `v₁ = (0,0)` — i.e. strictly on the `v₃`-side of
edge `v₁v₂` (`hA`) and strictly on the `v₂`-side of edge `v₁v₃` (`hB`) — has angle
`α ∈ (0, π/3)`.  These two `signedArea2` conditions are exactly what `signedArea2_normSim`
transports from `OnArcInterior` of the real cap `C₁`.  The first condition reads off as
`sin α > 0` (so `α ∈ (0,π)`); the second as `cos (α + π/6) > 0` (so `α < π/3`). -/
theorem capU1_arg_range (α : ℝ) (hlo : -π < α) (hhi : α ≤ π)
    (hC : signedArea2 (capU1 α) (pt 1 0) (pt (1 / 2) (Real.sqrt 3 / 2)) < 0) :
    0 < α ∧ α < π / 3 := by
  -- The single cap-`C₁` chord condition `signedArea2 (capU1 α) v₂ v₃ < 0` is the
  -- orientation-positive image of `OnArcInterior`; it equals `√3/2 − cos (α − π/6)`,
  -- so it pins `cos (α − π/6) > cos (π/6)`, i.e. the open arc `α ∈ (0, π/3)`.
  have hCeq : signedArea2 (capU1 α) (pt 1 0) (pt (1 / 2) (Real.sqrt 3 / 2))
      = Real.sqrt 3 / 2 - Real.cos (α - π / 6) := by
    simp only [signedArea2, capU1, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
      Real.cos_sub, Real.cos_pi_div_six, Real.sin_pi_div_six]; ring
  rw [hCeq] at hC
  have hcos : Real.cos (π / 6) < Real.cos (α - π / 6) := by
    rw [Real.cos_pi_div_six]; linarith
  have h0 : (0 : ℝ) ≤ π / 6 := by positivity
  refine ⟨?_, ?_⟩
  · by_contra h
    push_neg at h  -- α ≤ 0, so π/6 − α ≥ π/6 ≥ 0
    rw [show α - π / 6 = -(π / 6 - α) by ring, Real.cos_neg] at hcos
    by_cases hb : π / 6 - α ≤ π
    · have hle : π / 6 ≤ π / 6 - α := by linarith
      have := Real.cos_le_cos_of_nonneg_of_le_pi h0 hb hle
      linarith
    · push_neg at hb
      have h1 : π / 2 ≤ π / 6 - α := by linarith [Real.pi_pos]
      have h2 : π / 6 - α ≤ π + π / 2 := by linarith
      have hnp := Real.cos_nonpos_of_pi_div_two_le_of_le h1 h2
      have hp6 : (0 : ℝ) < Real.cos (π / 6) := by rw [Real.cos_pi_div_six]; positivity
      linarith
  · by_contra h
    push_neg at h  -- π/3 ≤ α, so π/6 ≤ α − π/6 ≤ π
    have h2 : α - π / 6 ≤ π := by linarith
    have hle : π / 6 ≤ α - π / 6 := by linarith
    have := Real.cos_le_cos_of_nonneg_of_le_pi h0 h2 hle
    linarith

/-- **Centre image (build-step 2, chord-condition form).**  For a positively-oriented
equilateral apex triangle `p₁ p₂ p₃` and an interior centre `s` that lies on the
equal-radius circle through the apex (`dist s p₁ = dist p₁ p₂`, the U2.B distance half /
N7 Apollonius rigidity) and strictly beyond the cap chord `p₂p₃` from `p₁`
(`signedArea2 s p₂ p₃ < 0`), the normalizing similarity sends `s` to `capU1 α` for a
unique open-arc angle `α ∈ (0, π/3)`.

The single `signedArea2 s p₂ p₃ < 0` hypothesis is the orientation-positive form of
cap-`C₁` membership: with `hori : 0 < signedArea2 p₁ p₂ p₃`, the `OnArcOpposite`
definition gives `signedArea2 s p₂ p₃ · signedArea2 p₁ p₂ p₃ ≤ 0`, and the
`OnArcInterior` strictness (`≠ 0`) sharpens it to `< 0`. -/
theorem normSim_centre_image (p₁ p₂ p₃ s : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃)
    (hs1 : dist s p₁ = dist p₁ p₂)
    (hchord : signedArea2 s p₂ p₃ < 0) :
    ∃ α : ℝ, normSim p₁ p₂ s = capU1 α ∧ 0 < α ∧ α < π / 3 := by
  have hLpos : 0 < (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := normSim_ℓ2_pos hp
  have h3img : normSim p₁ p₂ p₃ = pt (1 / 2) (Real.sqrt 3 / 2) :=
    normSim_thd p₁ p₂ p₃ hp h31 h23 hori
  -- The centre image lies on the unit circle about the origin.
  have hone : dist (normSim p₁ p₂ s) (pt 0 0) = 1 := by
    rw [normSim_dist_fst p₁ p₂ s hp, hs1, inv_mul_cancel₀ (dist_ne_zero.mpr hp)]
  obtain ⟨α, hαlo, hαhi, hαeq⟩ := exists_capU1_of_dist_origin_one _ hone
  -- Transport the single cap chord condition to the image triangle.
  have hC : signedArea2 (capU1 α) (pt 1 0) (pt (1 / 2) (Real.sqrt 3 / 2)) < 0 := by
    have ht := signedArea2_normSim p₁ p₂ hp s p₂ p₃
    rw [hαeq, normSim_snd p₁ p₂ hp, h3img] at ht
    rw [ht]; exact mul_neg_of_pos_of_neg (inv_pos.mpr hLpos) hchord
  obtain ⟨hα0, hα1⟩ := capU1_arg_range α hαlo hαhi hC
  exact ⟨α, hαeq, hα0, hα1⟩

/-- **Unit-circle membership about `v₂ = (1,0)`.**  A point `q` at distance `1` from
`pt 1 0` is `capU2 γ` for a principal-shifted angle `γ ∈ (-5π/3, π/3]`.  The proof mirrors
`exists_capU1_of_dist_origin_one` on the translated complex coordinate `z = ⟨q₀−1, q₁⟩`,
identifying the `capU2` angular offset `2π/3 + γ` with `arg z`. -/
theorem exists_capU2_of_dist_v2_one (q : ℝ²) (hq : dist q (pt 1 0) = 1) :
    ∃ γ : ℝ, -(5 * π / 3) < γ ∧ γ ≤ π / 3 ∧ q = capU2 γ := by
  have hcoord : (q 0 - 1) ^ 2 + (q 1) ^ 2 = 1 := by
    have h := normSq_sub q (pt 1 0)
    rw [hq] at h
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at h
    nlinarith [h]
  set z : ℂ := ⟨q 0 - 1, q 1⟩ with hz
  have hnsq : Complex.normSq z = 1 := by
    rw [hz, Complex.normSq_mk]; nlinarith [hcoord]
  have habs : ‖z‖ = 1 := by rw [Complex.norm_def, hnsq, Real.sqrt_one]
  have hzne : z ≠ 0 := by
    intro h; rw [h, norm_zero] at habs; exact one_ne_zero habs.symm
  refine ⟨z.arg - 2 * π / 3, by have := Complex.neg_pi_lt_arg z; linarith,
    by have := Complex.arg_le_pi z; linarith, ?_⟩
  have hcos : Real.cos z.arg = q 0 - 1 := by rw [Complex.cos_arg hzne, habs, div_one]
  have hsin : Real.sin z.arg = q 1 := by rw [Complex.sin_arg, habs, div_one]
  have hq0 : q 0 = 1 + Real.cos (2 * π / 3 + (z.arg - 2 * π / 3)) := by
    rw [show 2 * π / 3 + (z.arg - 2 * π / 3) = z.arg by ring, hcos]; ring
  have hq1 : q 1 = Real.sin (2 * π / 3 + (z.arg - 2 * π / 3)) := by
    rw [show 2 * π / 3 + (z.arg - 2 * π / 3) = z.arg by ring, hsin]
  rw [capU2]
  ext i
  fin_cases i
  · simpa only [pt, Matrix.cons_val_zero] using hq0
  · simpa only [pt, Matrix.cons_val_one] using hq1

/-- **Open-arc angle range of cap `C₂`.**  In the normalized frame, a unit-circle point
`capU2 γ` about `v₂ = (1,0)` (with `γ` the principal-shifted argument, `-5π/3 < γ ≤ π/3`)
that lies strictly beyond the cap chord `v₃v₁` from `v₂` — i.e.
`signedArea2 (capU2 γ) v₃ v₁ < 0`, the orientation-positive image of cap-`C₂` membership —
has angle `γ ∈ (0, π/3)`.  The chord cross-term equals `√3/2 + cos (5π/6 + γ)`, so the
condition reads `cos (5π/6 + γ) < −√3/2 = cos (5π/6)`, pinning `5π/6 + γ ∈ (5π/6, 7π/6)`. -/
theorem capU2_arg_range (γ : ℝ) (hlo : -(5 * π / 3) < γ) (hhi : γ ≤ π / 3)
    (hC : signedArea2 (capU2 γ) (pt (1 / 2) (Real.sqrt 3 / 2)) (pt 0 0) < 0) :
    0 < γ ∧ γ < π / 3 := by
  have hCeq : signedArea2 (capU2 γ) (pt (1 / 2) (Real.sqrt 3 / 2)) (pt 0 0)
      = Real.sqrt 3 / 2 + Real.cos (5 * π / 6 + γ) := by
    rw [show (5 : ℝ) * π / 6 + γ = (2 * π / 3 + γ) + π / 6 by ring,
      Real.cos_add, Real.cos_pi_div_six, Real.sin_pi_div_six]
    simp only [signedArea2, capU2, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    ring
  rw [hCeq] at hC
  have hcos2 : Real.cos (5 * π / 6 + γ) < -(Real.sqrt 3 / 2) := by linarith
  have c56 : Real.cos (5 * π / 6) = -(Real.sqrt 3 / 2) := by
    rw [show (5 : ℝ) * π / 6 = π - π / 6 by ring, Real.cos_sub, Real.cos_pi, Real.sin_pi,
      Real.cos_pi_div_six]; ring
  refine ⟨?_, ?_⟩
  · by_contra h
    push_neg at h  -- γ ≤ 0
    have hθhi : 5 * π / 6 + γ ≤ 5 * π / 6 := by linarith
    have habs : |5 * π / 6 + γ| ≤ 5 * π / 6 := by rw [abs_le]; constructor <;> linarith
    have hpi : 5 * π / 6 ≤ π := by linarith [Real.pi_pos]
    have := Real.cos_le_cos_of_nonneg_of_le_pi (abs_nonneg _) hpi habs
    rw [Real.cos_abs, c56] at this
    linarith
  · by_contra h
    push_neg at h  -- π/3 ≤ γ
    have hγ : γ = π / 3 := le_antisymm hhi h
    rw [hγ] at hcos2
    have c76 : Real.cos (5 * π / 6 + π / 3) = -(Real.sqrt 3 / 2) := by
      rw [show (5 : ℝ) * π / 6 + π / 3 = π + π / 6 by ring, Real.cos_add, Real.cos_pi,
        Real.sin_pi, Real.cos_pi_div_six]; ring
    rw [c76] at hcos2
    linarith

/-- **Chain-vertex image (build-step 3, cap `C₂` increasing branch).**  For a
positively-oriented equilateral apex triangle `p₁ p₂ p₃` and an adjacent-cap-`C₂` vertex
`w` on the equal-radius circle through `p₂` (`dist w p₂ = dist p₁ p₂`, the U2.B distance
half / N7 Apollonius rigidity) lying strictly beyond the cap chord `p₃p₁` from `p₂`
(`signedArea2 w p₃ p₁ < 0`), the normalizing similarity sends `w` to `capU2 γ` for a unique
open-arc angle `γ ∈ (0, π/3)`.  This is the per-vertex image identity feeding
`n8a3_of_distScalingToCapU2`; strict monotonicity of `γ` along the chain (the
`OrderedSideChain` ordering) is the separate ordering step. -/
theorem normSim_chainImage_capU2 (p₁ p₂ p₃ w : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃)
    (hw2 : dist w p₂ = dist p₁ p₂)
    (hchord : signedArea2 w p₃ p₁ < 0) :
    ∃ γ : ℝ, normSim p₁ p₂ w = capU2 γ ∧ 0 < γ ∧ γ < π / 3 := by
  have hLpos : 0 < (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := normSim_ℓ2_pos hp
  have h3img : normSim p₁ p₂ p₃ = pt (1 / 2) (Real.sqrt 3 / 2) :=
    normSim_thd p₁ p₂ p₃ hp h31 h23 hori
  -- The chain-vertex image lies on the unit circle about `pt 1 0` (the image of `p₂`).
  have hone : dist (normSim p₁ p₂ w) (pt 1 0) = 1 := by
    rw [← normSim_snd p₁ p₂ hp, normSim_dist_image p₁ p₂ hp w p₂, hw2,
      inv_mul_cancel₀ (dist_ne_zero.mpr hp)]
  obtain ⟨γ, hγlo, hγhi, hγeq⟩ := exists_capU2_of_dist_v2_one _ hone
  -- Transport the single cap chord condition to the image triangle.
  have hC : signedArea2 (capU2 γ) (pt (1 / 2) (Real.sqrt 3 / 2)) (pt 0 0) < 0 := by
    have ht := signedArea2_normSim p₁ p₂ hp w p₃ p₁
    rw [hγeq, h3img, normSim_fst p₁ p₂] at ht
    rw [ht]; exact mul_neg_of_pos_of_neg (inv_pos.mpr hLpos) hchord
  obtain ⟨hγ0, hγ1⟩ := capU2_arg_range γ hγlo hγhi hC
  exact ⟨γ, hγeq, hγ0, hγ1⟩

/-- **Unit-circle membership about `v₃ = (1/2, √3/2)`.**  A point `q` at distance `1` from
`pt (1/2) (√3/2)` is `capU3 δ` for `δ ∈ (-π/3, 5π/3]`.  Mirrors
`exists_capU2_of_dist_v2_one` on the translated coordinate `z = ⟨q₀−1/2, q₁−√3/2⟩`; because
the `capU3` offset `4π/3 + δ` exceeds `π`, the principal argument is matched modulo `2π`
(`δ = arg z + 2π/3`, so `4π/3 + δ = arg z + 2π`). -/
theorem exists_capU3_of_dist_v3_one (q : ℝ²) (hq : dist q (pt (1 / 2) (Real.sqrt 3 / 2)) = 1) :
    ∃ δ : ℝ, -(π / 3) < δ ∧ δ ≤ 5 * π / 3 ∧ q = capU3 δ := by
  have hcoord : (q 0 - 1 / 2) ^ 2 + (q 1 - Real.sqrt 3 / 2) ^ 2 = 1 := by
    have h := normSq_sub q (pt (1 / 2) (Real.sqrt 3 / 2))
    rw [hq] at h
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at h
    nlinarith [h]
  set z : ℂ := ⟨q 0 - 1 / 2, q 1 - Real.sqrt 3 / 2⟩ with hz
  have hnsq : Complex.normSq z = 1 := by rw [hz, Complex.normSq_mk]; nlinarith [hcoord]
  have habs : ‖z‖ = 1 := by rw [Complex.norm_def, hnsq, Real.sqrt_one]
  have hzne : z ≠ 0 := by
    intro h; rw [h, norm_zero] at habs; exact one_ne_zero habs.symm
  refine ⟨z.arg + 2 * π / 3, by have := Complex.neg_pi_lt_arg z; linarith,
    by have := Complex.arg_le_pi z; linarith, ?_⟩
  have hcos : Real.cos z.arg = q 0 - 1 / 2 := by rw [Complex.cos_arg hzne, habs, div_one]
  have hsin : Real.sin z.arg = q 1 - Real.sqrt 3 / 2 := by rw [Complex.sin_arg, habs, div_one]
  have key : (4 : ℝ) * π / 3 + (z.arg + 2 * π / 3) = z.arg + 2 * π := by ring
  have hq0 : q 0 = 1 / 2 + Real.cos (4 * π / 3 + (z.arg + 2 * π / 3)) := by
    rw [key, Real.cos_add_two_pi, hcos]; ring
  have hq1 : q 1 = Real.sqrt 3 / 2 + Real.sin (4 * π / 3 + (z.arg + 2 * π / 3)) := by
    rw [key, Real.sin_add_two_pi, hsin]; ring
  rw [capU3]
  ext i
  fin_cases i
  · simpa only [pt, Matrix.cons_val_zero] using hq0
  · simpa only [pt, Matrix.cons_val_one] using hq1

/-- **Open-arc angle range of cap `C₃`.**  A unit-circle point `capU3 δ` about
`v₃ = (1/2, √3/2)` (with `δ ∈ (-π/3, 5π/3]`) lying strictly beyond the cap chord `v₁v₂`
from `v₃` — i.e. `signedArea2 (capU3 δ) v₁ v₂ < 0`, the orientation-positive image of
cap-`C₃` membership — has angle `δ ∈ (0, π/3)`.  The chord cross-term equals
`√3/2 − cos (δ − π/6)` (same shape as cap `C₁`), so the condition reads
`cos (δ − π/6) > cos (π/6)`. -/
theorem capU3_arg_range (δ : ℝ) (hlo : -(π / 3) < δ) (hhi : δ ≤ 5 * π / 3)
    (hC : signedArea2 (capU3 δ) (pt 0 0) (pt 1 0) < 0) :
    0 < δ ∧ δ < π / 3 := by
  have hc32 : Real.cos (3 * π / 2) = 0 := by
    rw [show (3 : ℝ) * π / 2 = π + π / 2 by ring, Real.cos_add, Real.cos_pi, Real.sin_pi,
      Real.cos_pi_div_two, Real.sin_pi_div_two]; ring
  have hs32 : Real.sin (3 * π / 2) = -1 := by
    rw [show (3 : ℝ) * π / 2 = π + π / 2 by ring, Real.sin_add, Real.cos_pi, Real.sin_pi,
      Real.cos_pi_div_two, Real.sin_pi_div_two]; ring
  have hsc : Real.cos (δ - π / 6) = -Real.sin (4 * π / 3 + δ) := by
    rw [show δ - π / 6 = (4 * π / 3 + δ) - 3 * π / 2 by ring, Real.cos_sub, hc32, hs32]; ring
  have hCeq : signedArea2 (capU3 δ) (pt 0 0) (pt 1 0)
      = Real.sqrt 3 / 2 - Real.cos (δ - π / 6) := by
    rw [hsc]
    simp only [signedArea2, capU3, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    ring
  rw [hCeq] at hC
  have hcosgt : Real.cos (π / 6) < Real.cos (δ - π / 6) := by rw [Real.cos_pi_div_six]; linarith
  have h0 : (0 : ℝ) ≤ π / 6 := by positivity
  refine ⟨?_, ?_⟩
  · by_contra h
    push_neg at h  -- δ ≤ 0, so δ−π/6 ≤ −π/6 and (from hlo) δ−π/6 > −π/2
    have hnp : δ - π / 6 ≤ 0 := by linarith
    have hge : π / 6 ≤ |δ - π / 6| := by rw [abs_of_nonpos hnp]; linarith
    have hle : |δ - π / 6| ≤ π := by rw [abs_of_nonpos hnp]; linarith [Real.pi_pos]
    have := Real.cos_le_cos_of_nonneg_of_le_pi h0 hle hge
    rw [Real.cos_abs] at this
    linarith
  · by_contra h
    push_neg at h  -- π/3 ≤ δ, so δ−π/6 ≥ π/6
    have hp_ge : π / 6 ≤ δ - π / 6 := by linarith
    by_cases hpi : δ - π / 6 ≤ π
    · have := Real.cos_le_cos_of_nonneg_of_le_pi h0 hpi hp_ge
      linarith
    · push_neg at hpi
      have h1 : π / 2 ≤ δ - π / 6 := by linarith [Real.pi_pos]
      have h2 : δ - π / 6 ≤ π + π / 2 := by linarith
      have hnp := Real.cos_nonpos_of_pi_div_two_le_of_le h1 h2
      have hp6 : (0 : ℝ) < Real.cos (π / 6) := by rw [Real.cos_pi_div_six]; positivity
      linarith

/-- **Chain-vertex image (build-step 3, cap `C₃` decreasing branch).**  For a
positively-oriented equilateral apex triangle `p₁ p₂ p₃` and an adjacent-cap-`C₃` vertex
`w` on the equal-radius circle through `p₃` (`dist w p₃ = dist p₁ p₂`) lying strictly beyond
the cap chord `p₁p₂` from `p₃` (`signedArea2 w p₁ p₂ < 0`), the normalizing similarity sends
`w` to `capU3 δ` for a unique open-arc angle `δ ∈ (0, π/3)`.  This is the per-vertex image
identity feeding `n8a3_of_distScalingToCapU3`. -/
theorem normSim_chainImage_capU3 (p₁ p₂ p₃ w : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃)
    (hw3 : dist w p₃ = dist p₁ p₂)
    (hchord : signedArea2 w p₁ p₂ < 0) :
    ∃ δ : ℝ, normSim p₁ p₂ w = capU3 δ ∧ 0 < δ ∧ δ < π / 3 := by
  have hLpos : 0 < (p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2 := normSim_ℓ2_pos hp
  have h3img : normSim p₁ p₂ p₃ = pt (1 / 2) (Real.sqrt 3 / 2) :=
    normSim_thd p₁ p₂ p₃ hp h31 h23 hori
  -- The chain-vertex image lies on the unit circle about `pt (1/2) (√3/2)` (image of `p₃`).
  have hone : dist (normSim p₁ p₂ w) (pt (1 / 2) (Real.sqrt 3 / 2)) = 1 := by
    rw [← h3img, normSim_dist_image p₁ p₂ hp w p₃, hw3, inv_mul_cancel₀ (dist_ne_zero.mpr hp)]
  obtain ⟨δ, hδlo, hδhi, hδeq⟩ := exists_capU3_of_dist_v3_one _ hone
  -- Transport the single cap chord condition to the image triangle.
  have hC : signedArea2 (capU3 δ) (pt 0 0) (pt 1 0) < 0 := by
    have ht := signedArea2_normSim p₁ p₂ hp w p₁ p₂
    rw [hδeq, normSim_fst p₁ p₂, normSim_snd p₁ p₂ hp] at ht
    rw [ht]; exact mul_neg_of_pos_of_neg (inv_pos.mpr hLpos) hchord
  obtain ⟨hδ0, hδ1⟩ := capU3_arg_range δ hδlo hδhi hC
  exact ⟨δ, hδeq, hδ0, hδ1⟩

/-- **Option-A assembly — cap `C₂` increasing branch.**  The normalizing-similarity
packaging of `n8a3_of_distScalingToCapU2`: from the geometric centre-in-cap-`C₁` data
(`hs1`, `hschord`) plus a chain-angle parametrisation `γ` (membership `hγmem`, strict
monotonicity `hγmono`, image identity `hL`), the pinned one-hit interface holds. The
`StrictMono γ` is taken as an explicit hypothesis (its provenance — the real chain
ordering — is supplied by the G4/G5 layer). -/
theorem n8a3_normSimChain_capU2 (p₁ p₂ p₃ s : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃)
    (hs1 : dist s p₁ = dist p₁ p₂) (hschord : signedArea2 s p₂ p₃ < 0)
    {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) (γ : Fin m → ℝ)
    (hγmem : ∀ i, γ i ∈ Set.Icc (0 : ℝ) (π / 3)) (hγmono : StrictMono γ)
    (hL : ∀ i, normSim p₁ p₂ (L.points i) = capU2 (γ i)) :
    N8a3AdjacentCapDistanceStrict s L := by
  obtain ⟨α, hsα, hα0, hα1⟩ := normSim_centre_image p₁ p₂ p₃ s hp h31 h23 hori hs1 hschord
  exact n8a3_of_distScalingToCapU2 (inv_pos.mpr (dist_pos.mpr hp))
    (normSim_dist_image p₁ p₂ hp) L hα0 hα1 γ hγmem hγmono hsα hL

/-- **Option-A assembly — cap `C₃` decreasing branch.**  As `n8a3_normSimChain_capU2`,
with a strictly *antitone* arc angle `δ` for the `C₃` decreasing radial profile. -/
theorem n8a3_normSimChain_capU3 (p₁ p₂ p₃ s : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃)
    (hs1 : dist s p₁ = dist p₁ p₂) (hschord : signedArea2 s p₂ p₃ < 0)
    {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) (δ : Fin m → ℝ)
    (hδmem : ∀ i, δ i ∈ Set.Icc (0 : ℝ) (π / 3)) (hδanti : StrictAnti δ)
    (hL : ∀ i, normSim p₁ p₂ (L.points i) = capU3 (δ i)) :
    N8a3AdjacentCapDistanceStrict s L := by
  obtain ⟨α, hsα, hα0, hα1⟩ := normSim_centre_image p₁ p₂ p₃ s hp h31 h23 hori hs1 hschord
  exact n8a3_of_distScalingToCapU3 (inv_pos.mpr (dist_pos.mpr hp))
    (normSim_dist_image p₁ p₂ hp) L hα0 hα1 δ hδmem hδanti hsα hL

/- ## The ordering bridge (gap `R-A1`, build-step 3 — `StrictMono`/`StrictAnti` provenance)

The option-A assemblies above take the chain-angle monotonicity (`StrictMono γ` /
`StrictAnti δ`) as an explicit hypothesis.  This block discharges that hypothesis from a
**purely real-frame orientation hypothesis** on the chain — `signedArea2 (apex) (Lᵢ) (Lⱼ)`
has a fixed sign for `i < j`, i.e. the chain winds consistently as seen from the cap's
circle-centre apex.  No `arcAngle`/`oangle`/`Real.Angle` machinery is needed: the cap
parametrisations satisfy the exact trig identity `signedArea2 vₖ (capUₖ a) (capUₖ b)
= sin (b − a)`, and `signedArea2_normSim` transports the real orientation onto the image.
The orientation hypothesis is in `signedArea2` terms, matching the convex-cyclic-order
machinery's output (`ConvexCyclicOrderConstruct.signedArea2_neg_of_cut_sorted`), so it is
the directly-composable G4/G5 input. -/

/-- **Cap-`C₂` signed-area is a sine.**  About the canonical vertex `v₂ = (1,0)`, the
oriented area of two adjacent-cap points is `signedArea2 v₂ (capU2 a) (capU2 b)
= sin (b − a)` — the `2π/3` phase offset and the `+1` translation cancel, leaving the
chord sine. -/
theorem signedArea2_capU2_eq_sin (a b : ℝ) :
    signedArea2 (pt 1 0) (capU2 a) (capU2 b) = Real.sin (b - a) := by
  simp only [signedArea2, capU2, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
  rw [show b - a = (2 * π / 3 + b) - (2 * π / 3 + a) by ring, Real.sin_sub]
  ring

/-- **Cap-`C₃` signed-area is a sine.**  About the canonical vertex `v₃ = (1/2, √3/2)`,
`signedArea2 v₃ (capU3 a) (capU3 b) = sin (b − a)` — as `signedArea2_capU2_eq_sin`, the
`4π/3` offset and the `(1/2, √3/2)` translation cancel. -/
theorem signedArea2_capU3_eq_sin (a b : ℝ) :
    signedArea2 (pt (1 / 2) (Real.sqrt 3 / 2)) (capU3 a) (capU3 b) = Real.sin (b - a) := by
  simp only [signedArea2, capU3, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
  rw [show b - a = (4 * π / 3 + b) - (4 * π / 3 + a) by ring, Real.sin_sub]
  ring

/-- **Sign-faithfulness on the lower arc.**  For `x ∈ [−π, 0]`, `sin x ≤ 0`.  The helper
used by the cap-`C₂` ordering bridge to convert `sin (γⱼ − γᵢ) > 0` into `γᵢ < γⱼ`. -/
private theorem sin_nonpos_of_nonpos_of_neg_pi_le {x : ℝ} (hge : -π ≤ x) (hle : x ≤ 0) :
    Real.sin x ≤ 0 := by
  rw [show x = -(-x) by ring, Real.sin_neg]
  have : 0 ≤ Real.sin (-x) :=
    Real.sin_nonneg_of_nonneg_of_le_pi (by linarith) (by linarith)
  linarith

/-- **Ordering bridge — cap `C₂` (increasing).**  From a positively-oriented chain as seen
from the apex `p₂` (`horient`), the chain-angle `γ` of the normalized images is strictly
monotone.  Reduces `signedArea2 p₂ Lᵢ Lⱼ > 0` (transported to the image and read as
`sin (γⱼ − γᵢ) > 0` via `signedArea2_capU2_eq_sin`) to `γᵢ < γⱼ` using `γ ∈ [0, π/3]`. -/
theorem normSim_capU2_strictMono_of_orient (p₁ p₂ : ℝ²) (hp : p₁ ≠ p₂)
    {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) (γ : Fin m → ℝ)
    (hγmem : ∀ i, γ i ∈ Set.Icc (0 : ℝ) (π / 3))
    (hL : ∀ i, normSim p₁ p₂ (L.points i) = capU2 (γ i))
    (horient : ∀ i j, i < j → 0 < signedArea2 p₂ (L.points i) (L.points j)) :
    StrictMono γ := by
  intro i j hij
  have hconst : 0 < ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2)⁻¹ :=
    inv_pos.mpr (normSim_ℓ2_pos hp)
  have hpos : 0 < signedArea2 (normSim p₁ p₂ p₂) (normSim p₁ p₂ (L.points i))
      (normSim p₁ p₂ (L.points j)) := by
    rw [signedArea2_normSim p₁ p₂ hp p₂ (L.points i) (L.points j)]
    exact mul_pos hconst (horient i j hij)
  rw [normSim_snd p₁ p₂ hp, hL i, hL j, signedArea2_capU2_eq_sin] at hpos
  by_contra hcon
  push_neg at hcon
  have hle : γ i - γ j ≤ π := by
    have := (hγmem i).2; have := (hγmem j).1; linarith [Real.pi_pos]
  have hsin : Real.sin (γ j - γ i) ≤ 0 :=
    sin_nonpos_of_nonpos_of_neg_pi_le (x := γ j - γ i) (by linarith) (by linarith)
  linarith

/-- **Ordering bridge — cap `C₃` (decreasing).**  From a negatively-oriented chain as seen
from the apex `p₃` (`horient`), the chain-angle `δ` of the normalized images is strictly
*antitone*.  As `normSim_capU2_strictMono_of_orient`, but the third anchor `v₃ = normSim p₃`
needs the equilateral-frame hypotheses, and `sin (δⱼ − δᵢ) < 0` gives `δⱼ < δᵢ`. -/
theorem normSim_capU3_strictAnti_of_orient (p₁ p₂ p₃ : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃)
    {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) (δ : Fin m → ℝ)
    (hδmem : ∀ i, δ i ∈ Set.Icc (0 : ℝ) (π / 3))
    (hL : ∀ i, normSim p₁ p₂ (L.points i) = capU3 (δ i))
    (horient : ∀ i j, i < j → signedArea2 p₃ (L.points i) (L.points j) < 0) :
    StrictAnti δ := by
  intro i j hij
  have hconst : 0 < ((p₂ 0 - p₁ 0) ^ 2 + (p₂ 1 - p₁ 1) ^ 2)⁻¹ :=
    inv_pos.mpr (normSim_ℓ2_pos hp)
  have hneg : signedArea2 (normSim p₁ p₂ p₃) (normSim p₁ p₂ (L.points i))
      (normSim p₁ p₂ (L.points j)) < 0 := by
    rw [signedArea2_normSim p₁ p₂ hp p₃ (L.points i) (L.points j)]
    exact mul_neg_of_pos_of_neg hconst (horient i j hij)
  rw [normSim_thd p₁ p₂ p₃ hp h31 h23 hori, hL i, hL j, signedArea2_capU3_eq_sin] at hneg
  by_contra hcon
  push_neg at hcon
  have hge : 0 ≤ δ j - δ i := by linarith
  have hle : δ j - δ i ≤ π := by
    have := (hδmem j).2; have := (hδmem i).1; linarith [Real.pi_pos]
  have : 0 ≤ Real.sin (δ j - δ i) := Real.sin_nonneg_of_nonneg_of_le_pi hge hle
  linarith

/-- **Option-B assembly — cap `C₂` increasing branch.**  As `n8a3_normSimChain_capU2`, but
the chain-angle monotonicity is *derived* from the self-contained real-frame orientation
hypothesis `horient` (the chain winds positively as seen from the apex `p₂`) via
`normSim_capU2_strictMono_of_orient`, rather than assumed. -/
theorem n8a3_normSimChain_capU2_oriented (p₁ p₂ p₃ s : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃)
    (hs1 : dist s p₁ = dist p₁ p₂) (hschord : signedArea2 s p₂ p₃ < 0)
    {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) (γ : Fin m → ℝ)
    (hγmem : ∀ i, γ i ∈ Set.Icc (0 : ℝ) (π / 3))
    (hL : ∀ i, normSim p₁ p₂ (L.points i) = capU2 (γ i))
    (horient : ∀ i j, i < j → 0 < signedArea2 p₂ (L.points i) (L.points j)) :
    N8a3AdjacentCapDistanceStrict s L :=
  n8a3_normSimChain_capU2 p₁ p₂ p₃ s hp h31 h23 hori hs1 hschord L γ hγmem
    (normSim_capU2_strictMono_of_orient p₁ p₂ hp L γ hγmem hL horient) hL

/-- **Option-B assembly — cap `C₃` decreasing branch.**  As `n8a3_normSimChain_capU2_oriented`,
with the strictly *antitone* `δ` derived from a negatively-oriented chain seen from `p₃`. -/
theorem n8a3_normSimChain_capU3_oriented (p₁ p₂ p₃ s : ℝ²) (hp : p₁ ≠ p₂)
    (h31 : dist p₁ p₂ = dist p₃ p₁) (h23 : dist p₁ p₂ = dist p₂ p₃)
    (hori : 0 < signedArea2 p₁ p₂ p₃)
    (hs1 : dist s p₁ = dist p₁ p₂) (hschord : signedArea2 s p₂ p₃ < 0)
    {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) (δ : Fin m → ℝ)
    (hδmem : ∀ i, δ i ∈ Set.Icc (0 : ℝ) (π / 3))
    (hL : ∀ i, normSim p₁ p₂ (L.points i) = capU3 (δ i))
    (horient : ∀ i j, i < j → signedArea2 p₃ (L.points i) (L.points j) < 0) :
    N8a3AdjacentCapDistanceStrict s L :=
  n8a3_normSimChain_capU3 p₁ p₂ p₃ s hp h31 h23 hori hs1 hschord L δ hδmem
    (normSim_capU3_strictAnti_of_orient p₁ p₂ p₃ hp h31 h23 hori L δ hδmem hL horient) hL

end Problem97
