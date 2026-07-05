import Erdos9796Proof.P97.Foundation
import Erdos9796Proof.P97.TwoCircleCrossing
import Erdos9796Proof.P97.ArcBlockContiguity
import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Geometry.Euclidean.PerpBisector

/-!
# U2 witness reflection/projection kernels

Reusable planar-geometry kernels behind the U2 exact-side K4 witness
classification leaf `U2a2-1a3d2c2d4c` of
`docs/97-uniform-theorem-closure-plan.md` (prose kernels `c5d0`–`c5d3`,
`docs/97-full-prose-proof-draft.md` lines ~11994–12742).

The U2 exact-side rows split into four fixed shapes: endpoint-mirror
transport, two-circle equal-projection/reflection, cap-side exclusion, and
cross-cap record + `N8c2b` order reversal.  This file discharges the
*two-circle* shape — the part that is genuinely independent of the
arc-angle / `U1k-b1a1M` foundation:

* `inner_sub_centers_eq_zero` — the **equal-projection** primitive
  (`c5d2b1a` / `c5d1d1-algebraic` / `c5d3e1a`): two points equidistant from
  the same two centers have equal orthogonal projection onto the line through
  the centers.  Unconditional.
* `two_circle_third_point_eq` — the **two-circle endpoint reduction** engine
  (`c5d2a2` / `c5d0` terminal): a common point of two distinct circles,
  distinct from one known crossing, *is* the other.  Unconditional; the
  `dist · centre = radius` repackaging of `two_circle_common_point_eq_endpoint`.
* `c5b3c_crossSide_contradiction` — closes the shared-large cross-side row
  `c5b3c` (`U2a2-1a3d2c2d4c5d2a2`): the strict large-cap witness `u` would be a
  *third* common point of the two distinct equilateral-packet circles, distinct
  from both crossings `v₁`, `q*` by cap-disjointness — impossible.
* `c5d0_qstar_outside_disk` / `c5d0_contradiction` — the **q\*-outside-disk**
  analytic core closing the `C₃` endpoint-mate kernel `c5d0`
  (`U2a2-1a3d2c2d4c5d0`): in the MEC-unit-circle frame the second equilateral
  apex `q*` (reflection of `v₁` across line `q v₃`) has `‖q*‖² > R² = 1` once the
  isoceles equality `|v₃v₂|=|v₃v₁|` + Moser non-obtuseness pin `h ≥ π/4`, so `q*`
  cannot be the interior point `q* ∈ int(C₃)` the packet asserts.  Frame-fixed,
  same bridge status as `c5d2_dominance`.

What this file does **not** do: it does not close the U2 leaf.  The reflection
rows additionally need a **cap-side exclusion** lemma (`c5d2c0a/c0b`, `c5d3e2`,
convex cap geometry, still prose-only), and the same-side / opposite-side rows
route into the open `U1k-b1a1M` cap-order monotonicity (degree-6 SOS) and the
not-yet-formalized `N8c2b` reverse-order rule.  `c5b3c_crossSide_contradiction`
closes one of fourteen open two-endpoint rows *given its row packet*; the packet
itself is produced upstream by the equilateral-packet identification.

All declarations are axiom-clean (`{propext, Classical.choice, Quot.sound}`).
-/

open scoped EuclideanGeometry InnerProductSpace
open EuclideanGeometry

namespace Problem97

/-- **Equal-projection lemma** (`c5d2b1a` / `c5d1d1-algebraic` / `c5d3e1a`).
If `u` and `y` are each equidistant from two centres `a` and `b`, then `u - y`
is orthogonal to `a - b`: `u` and `y` have equal orthogonal projection onto the
line through the centres. -/
theorem inner_sub_centers_eq_zero
    {a b u y : ℝ²} (hua : dist u a = dist y a) (hub : dist u b = dist y b) :
    ⟪u - y, a - b⟫_ℝ = 0 := by
  have h := EuclideanGeometry.inner_vsub_vsub_of_dist_eq_of_dist_eq
    (c₁ := b) (c₂ := a) (p₁ := y) (p₂ := u) (by rw [hub]) (by rw [hua])
  simpa only [vsub_eq_sub, real_inner_comm] using h

/-- **Two-circle midpoint collinearity** (`c5d2b1b` / `c5d3e1b` — the `hmid` producer).
If `u` and `y` are each equidistant from two circle centres `q` (radius `rq`) and
`v2` (radius `rv`), then the midpoint of the segment `y–u` is collinear with `q`
and `v2`: `signedArea2 (midpoint ℝ y u) q v2 = 0`.  This produces the `hmid`
hypothesis consumed by `signedArea2_reflection_neg`, completing the reflection chain
started by `inner_sub_centers_eq_zero`. -/
theorem twoCircle_midpoint_collinear {q v2 u y : ℝ²} {rq rv : ℝ}
    (huq : dist u q = rq) (hyq : dist y q = rq)
    (huv : dist u v2 = rv) (hyv : dist y v2 = rv)
    (hne : u ≠ y) :
    signedArea2 (midpoint ℝ y u) q v2 = 0 := by
  have huqyq : dist u q = dist y q := huq.trans hyq.symm
  have huvyv : dist u v2 = dist y v2 := huv.trans hyv.symm
  -- The midpoint of y and u is equidistant from y and u
  have hum : dist u (midpoint ℝ y u) = dist y (midpoint ℝ y u) := by
    rw [dist_comm u, dist_comm y]; rw [dist_midpoint_left, dist_midpoint_right]
  -- u - y is perpendicular to q - v2 (two-circle perpendicular bisector) and to q - midpoint
  have hperp1 : ⟪u - y, q - v2⟫_ℝ = 0 := inner_sub_centers_eq_zero huqyq huvyv
  have hperp2 : ⟪u - y, q - midpoint ℝ y u⟫_ℝ = 0 :=
    inner_sub_centers_eq_zero huqyq hum
  -- Extract scalar perpendicularity conditions via coordinate expansion
  have h1 : (u 0 - y 0) * (q 0 - v2 0) + (u 1 - y 1) * (q 1 - v2 1) = 0 := by
    simp [EuclideanSpace.inner_eq_star_dotProduct] at hperp1; linarith
  have h2 : (u 0 - y 0) * (q 0 - (y 0 + u 0) / 2) +
            (u 1 - y 1) * (q 1 - (y 1 + u 1) / 2) = 0 := by
    simp [EuclideanSpace.inner_eq_star_dotProduct, midpoint, AffineMap.lineMap_apply] at hperp2
    linarith
  -- u ≠ y implies w = u - y has at least one nonzero coordinate
  have hw : u 0 ≠ y 0 ∨ u 1 ≠ y 1 := by
    by_contra hc; push_neg at hc
    exact hne (by ext i; fin_cases i <;> [exact hc.1; exact hc.2])
  -- Abbreviations for the perpendicular-component pairs
  set w0 := u 0 - y 0; set w1 := u 1 - y 1
  set p0 := q 0 - v2 0; set p1 := q 1 - v2 1
  set p'0 := q 0 - (y 0 + u 0) / 2; set p'1 := q 1 - (y 1 + u 1) / 2
  -- Two vectors both perpendicular to a nonzero w in ℝ² have zero cross product
  have key2 : w0 * (p0 * p'1 - p1 * p'0) = 0 := by linear_combination p'1 * h1 - p1 * h2
  have key1 : w1 * (p0 * p'1 - p1 * p'0) = 0 := by linear_combination p0 * h2 - p'0 * h1
  have hcross : p0 * p'1 - p1 * p'0 = 0 := by
    rcases hw with h | h
    · exact (mul_eq_zero.mp key2).resolve_left (sub_ne_zero.mpr h)
    · exact (mul_eq_zero.mp key1).resolve_left (sub_ne_zero.mpr h)
  -- Expand signedArea2 at the midpoint and conclude
  have hm0 : (midpoint ℝ y u) 0 = (y 0 + u 0) / 2 := by
    simp [midpoint, AffineMap.lineMap_apply]; ring
  have hm1 : (midpoint ℝ y u) 1 = (y 1 + u 1) / 2 := by
    simp [midpoint, AffineMap.lineMap_apply]; ring
  simp only [signedArea2, hm0, hm1]
  simp only [p0, p1, p'0, p'1] at hcross
  linarith

/-- **Two-circle endpoint reduction** (`c5d2a2` / `c5d0` terminal).  Two distinct
circles (centres `a`, `b`) share two distinct points `p₁`, `p₂`.  Any common
point `w` distinct from `p₁` must equal `p₂`.  Stated in the project's
`dist · centre = radius` vocabulary. -/
theorem two_circle_third_point_eq
    {a b p₁ p₂ w : ℝ²} {ra rb : ℝ}
    (hcirc : (⟨a, ra⟩ : Sphere ℝ²) ≠ ⟨b, rb⟩) (hp : p₁ ≠ p₂)
    (hp₁a : dist p₁ a = ra) (hp₂a : dist p₂ a = ra)
    (hp₁b : dist p₁ b = rb) (hp₂b : dist p₂ b = rb)
    (hwa : dist w a = ra) (hwb : dist w b = rb) (hwp₁ : w ≠ p₁) : w = p₂ := by
  rcases two_circle_common_point_eq_endpoint hcirc hp
    (mem_sphere.mpr hp₁a) (mem_sphere.mpr hp₂a)
    (mem_sphere.mpr hp₁b) (mem_sphere.mpr hp₂b)
    (mem_sphere.mpr hwa) (mem_sphere.mpr hwb) with h | h
  · exact absurd h hwp₁
  · exact h

/-- **c5b3c cross-side row contradiction** (`U2a2-1a3d2c2d4c5d2a2`).  In the
shared-large cross-side row `c5b3c`, the strict large-cap witness `u` satisfies
`|qu| = |qv₃|` and `|v₃u| = |v₃q|` (the `c5d2a1` packet), so `u` is a common
point of the two distinct circles `B(q, |qv₃|)` and `B(v₃, |v₃q|)`, which meet
exactly at `v₁` and `q*` (the equilateral packet identifies both as common
points).  Since `u ≠ v₁` and `u ≠ q*` (cap disjointness — `u ∈ int(C₁)` but
`v₁` is an endpoint and `q* ∈ S₃`), this is impossible. -/
theorem c5b3c_crossSide_contradiction
    {q v₁ v₃ qs u : ℝ²}
    (hcirc : (⟨q, dist v₃ q⟩ : Sphere ℝ²) ≠ ⟨v₃, dist v₃ q⟩)
    (hv₁qs : v₁ ≠ qs)
    (hv₁q : dist v₁ q = dist v₃ q) (hv₁v₃ : dist v₁ v₃ = dist v₃ q)
    (hqsq : dist qs q = dist v₃ q) (hqsv₃ : dist qs v₃ = dist v₃ q)
    (huq : dist u q = dist v₃ q) (huv₃ : dist u v₃ = dist v₃ q)
    (huv₁ : u ≠ v₁) (huqs : u ≠ qs) : False :=
  huqs (two_circle_third_point_eq hcirc hv₁qs
    hv₁q hqsq hv₁v₃ hqsv₃ huq huv₃ huv₁)

/-- **c5d3b same-circle row contradiction** (`U2a2-1a3d2c2d4c5d3b0a` / the
same-circle branch of the c5d3b payload adapter).  In the same vesica packet as
`c5b3c`, if the selected witness `u` is forced onto both circles
`B(q, |qv₃|)` and `B(v₃, |v₃q|)`, then the two-circle endpoint reduction
forces `u` to equal one of the known crossings `v₁` or `q*`, contradicting the
strict-cap exclusions.  This is the consumer-side contradiction; the
producer/payload theorem remains open. -/
theorem c5d3b_sameCircle_contradiction
    {q v₁ v₃ qs u : ℝ²}
    (hcirc : (⟨q, dist v₃ q⟩ : Sphere ℝ²) ≠ ⟨v₃, dist v₃ q⟩)
    (hv₁qs : v₁ ≠ qs)
    (hv₁q : dist v₁ q = dist v₃ q) (hv₁v₃ : dist v₁ v₃ = dist v₃ q)
    (hqsq : dist qs q = dist v₃ q) (hqsv₃ : dist qs v₃ = dist v₃ q)
    (huq : dist u q = dist v₃ q) (huv₃ : dist u v₃ = dist v₃ q)
    (huv₁ : u ≠ v₁) (huqs : u ≠ qs) : False :=
  huqs (two_circle_third_point_eq hcirc hv₁qs
    hv₁q hqsq hv₁v₃ hqsv₃ huq huv₃ huv₁)

/-- **Affine midpoint identity for the apex slot.** `signedArea2 · q v₂` is
affine in its apex argument, so the value at a midpoint is the average. -/
theorem signedArea2_apex_midpoint (q v2 y u : ℝ²) :
    2 * signedArea2 (midpoint ℝ y u) q v2 = signedArea2 y q v2 + signedArea2 u q v2 := by
  have hm0 : (midpoint ℝ y u) 0 = (y 0 + u 0) / 2 := by
    rw [midpoint_eq_smul_add]; simp; ring
  have hm1 : (midpoint ℝ y u) 1 = (y 1 + u 1) / 2 := by
    rw [midpoint_eq_smul_add]; simp; ring
  simp only [signedArea2, hm0, hm1]; ring

/-- **Reflection flips the signed area at the apex** (`c5d2c0b` / `c5d3e2`
algebraic core).  If the midpoint of `y` and `u` lies on the chord line
`q v₂` (i.e. `u` is the reflection of `y` across that line, as produced by
`c5d2b1b` / `c5d3e1b`), then `signedArea2 u q v₂ = − signedArea2 y q v₂`. -/
theorem signedArea2_reflection_neg {q v2 y u : ℝ²}
    (hmid : signedArea2 (midpoint ℝ y u) q v2 = 0) :
    signedArea2 u q v2 = - signedArea2 y q v2 := by
  have h := signedArea2_apex_midpoint q v2 y u
  rw [hmid] at h; linarith

/-- **Two-circle same-side reflection contradiction.**  Two distinct points on
the same two centered circles cannot both lie strictly on the same side of the
chord joining the two centers, expressed relative to a fixed test apex.

The two-circle equal-radius hypotheses put the midpoint of `y` and `u` on the
chord line `q v₂`; `signedArea2_reflection_neg` flips their signed areas, while
the two strict same-side hypotheses force the products with the apex signed area
to have the same positive sign. -/
theorem twoCircle_sameSide_reflection_false {q v2 apex y u : ℝ²} {rq rv : ℝ}
    (huq : dist u q = rq) (hyq : dist y q = rq)
    (huv : dist u v2 = rv) (hyv : dist y v2 = rv)
    (hne : u ≠ y)
    (huside : 0 < signedArea2 u q v2 * signedArea2 apex q v2)
    (hyside : 0 < signedArea2 y q v2 * signedArea2 apex q v2) :
    False := by
  have hmid : signedArea2 (midpoint ℝ y u) q v2 = 0 :=
    twoCircle_midpoint_collinear huq hyq huv hyv hne
  have hflip : signedArea2 u q v2 = - signedArea2 y q v2 :=
    signedArea2_reflection_neg hmid
  have hkey :
      signedArea2 u q v2 * signedArea2 apex q v2 =
        -(signedArea2 y q v2 * signedArea2 apex q v2) := by
    rw [hflip]
    ring
  linarith [huside, hyside, hkey]

/-- **`c5d2c0a` exact (convex-position core).**  In a CCW convex polygon `φ`,
with chord endpoints `q = φ iq`, `v₂ = φ iv2`, `iq < iv2`, a short-cap witness
`y = φ iy` (`int(C₂)`, index `> iv2`) and a large-cap witness `x = φ ix`
(`int(C₁)`, index `> iv2`) lie strictly on the *same* (negative) side of the
chord `q v₂`.

Note (load-bearing prose correction): the prose phrasing "`int(C₁)` on the
opposite side from `y`" is false; `int(C₁)` and `int(C₂)` are on the *same*
strict side.  The exclusion in `capSide_reflection_excluded` comes from the
reflection landing on the *other* side, not from `C₁` being opposite `y`. -/
theorem capSide_same_side {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ) (hφ : Function.Injective φ)
    {iq iv2 iy ix : Fin n} (hqv : iq < iv2) (hy : iv2 < iy) (hx : iv2 < ix) :
    signedArea2 (φ iy) (φ iq) (φ iv2) < 0 ∧ signedArea2 (φ ix) (φ iq) (φ iv2) < 0 :=
  ⟨signedArea2_neg_of_outside hccw hφ hqv (Or.inr hy),
   signedArea2_neg_of_outside hccw hφ hqv (Or.inr hx)⟩

/-- **Cap-side exclusion of the reflected point** (`c5d2c0b` / `c5d3e2`).
In a CCW convex polygon `φ` with chord endpoints `q = φ iq`, `v₂ = φ iv2`,
`iq < iv2`: let `y = φ iy` be the `int(C₂)` short-cap witness (`iv2 < iy`)
and let `u` be the reflection of `y` across line `q v₂` (its midpoint with `y`
is on the line: `hmid`).  Then `u` cannot be any vertex `x = φ ix` with
`iv2 < ix` — in particular no `int(C₁)` witness — because `x` is strictly on the
negative side while `u` is strictly on the positive side. -/
theorem capSide_reflection_excluded {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ) (hφ : Function.Injective φ)
    {iq iv2 iy ix : Fin n} {u : ℝ²}
    (hqv : iq < iv2) (hy : iv2 < iy) (hx : iv2 < ix)
    (hmid : signedArea2 (midpoint ℝ (φ iy) u) (φ iq) (φ iv2) = 0) :
    u ≠ φ ix := by
  have hyneg : signedArea2 (φ iy) (φ iq) (φ iv2) < 0 :=
    signedArea2_neg_of_outside hccw hφ hqv (Or.inr hy)
  have hupos : signedArea2 u (φ iq) (φ iv2) > 0 := by
    rw [signedArea2_reflection_neg hmid]; linarith
  have hxneg : signedArea2 (φ ix) (φ iq) (φ iv2) < 0 :=
    signedArea2_neg_of_outside hccw hφ hqv (Or.inr hx)
  intro hux; rw [hux] at hupos; linarith

/-- **c5d2 dominance inequality** (`c5d2c0a`, MEC-disk transport route).

Frame-fixed analytic core of the cap-side exclusion. With the MEC the unit
circle centred at `O`, the selected equilateral triangle `q v₁ v₃` having
`v₁, v₃` on the MEC symmetric about the `y`-axis and apex `q = (0, Q)`,
`Q = 2 cos (A + π/6)` (`A ∈ (π/6, π/3)`, so `Q ∈ (0,1)`, `q` strictly inside),
and `v₂ = (cos t, sin t)` the opposite Moser apex, the reflected two-circle
point `u` lies outside the open MEC disk (`|Ou|² ≥ R² = 1`) iff
`Q² − Q sin t + √3 Q |cos t| ≥ 0`.

For the relevant `cos t ≥ 0` branch (`t ∈ [−π/2, π/2]`, cap-`C₂` angular range)
this is the inequality below.  It holds exactly when `t ≤ 2π/3 − A`, i.e. when
`v₂` lies outside the open arc `(v₁, v₃)`: the boundary `t = 2π/3 − A` is the
polar angle of `v₁`.  That bound is the **strict cap order on `C₂`/`C₃`**
hypothesis sanctioned by the c5d2 kernel `Input` block (prose L12507).  The
inequality is **tight** (equality at `t = 2π/3 − A`, i.e. `v₂ = v₁`), so it is
genuinely conditional on `hbound` — it is *false* without it.

This is the MEC-disk justification of the side fact that
`capSide_reflection_excluded` proves combinatorially from the convex-polygon
vertex order; the load-bearing `hbound` here is the same cap-order content as
the index hypotheses `iq < iv2 < iy` there.  Closing the c5d2 kernel still
requires the cap-order bridge that supplies either form. -/
theorem c5d2_dominance (A t : ℝ)
    (hA : A ∈ Set.Ioo (Real.pi / 6) (Real.pi / 3))
    (ht : t ∈ Set.Icc (-(Real.pi / 2)) (Real.pi / 2))
    (hbound : t ≤ 2 * Real.pi / 3 - A) :
    0 ≤ (2 * Real.cos (A + Real.pi / 6)) ^ 2
        - (2 * Real.cos (A + Real.pi / 6)) * Real.sin t
        + Real.sqrt 3 * ((2 * Real.cos (A + Real.pi / 6)) * Real.cos t) := by
  obtain ⟨hA1, hA2⟩ := hA
  obtain ⟨ht1, ht2⟩ := ht
  set Q := 2 * Real.cos (A + Real.pi / 6) with hQdef
  have hQpos : 0 < Q := by
    have hcos : 0 < Real.cos (A + Real.pi / 6) :=
      Real.cos_pos_of_mem_Ioo ⟨by linarith [Real.pi_pos], by linarith⟩
    rw [hQdef]; linarith
  have key : 0 ≤ Q - Real.sin t + Real.sqrt 3 * Real.cos t := by
    have hQ : Q = 2 * Real.sin (Real.pi / 3 - A) := by
      rw [hQdef, show Real.pi / 3 - A = Real.pi / 2 - (A + Real.pi / 6) by ring,
        Real.sin_pi_div_two_sub]
    have hexp : Real.sin (t - Real.pi / 3)
        = 1 / 2 * Real.sin t - Real.sqrt 3 / 2 * Real.cos t := by
      rw [Real.sin_sub, Real.sin_pi_div_three, Real.cos_pi_div_three]; ring
    have hprod : 0 ≤ Real.sin (Real.pi / 3 - A) - Real.sin (t - Real.pi / 3) := by
      rw [Real.sin_sub_sin]
      have hs : 0 ≤ Real.sin ((Real.pi / 3 - A - (t - Real.pi / 3)) / 2) := by
        apply Real.sin_nonneg_of_nonneg_of_le_pi <;> linarith [Real.pi_pos]
      have hcz : 0 ≤ Real.cos ((Real.pi / 3 - A + (t - Real.pi / 3)) / 2) :=
        Real.cos_nonneg_of_mem_Icc ⟨by linarith [Real.pi_pos], by linarith [Real.pi_pos]⟩
      exact mul_nonneg (mul_nonneg (by norm_num) hs) hcz
    rw [hexp] at hprod
    rw [hQ]; linarith [hprod]
  have factored : Q ^ 2 - Q * Real.sin t + Real.sqrt 3 * (Q * Real.cos t)
      = Q * (Q - Real.sin t + Real.sqrt 3 * Real.cos t) := by ring
  rw [factored]
  exact mul_nonneg (le_of_lt hQpos) key

/-- **c5d0 q\*-outside-disk core** (`U2a2-1a3d2c2d4c5d0` terminal, MEC-disk route).

Frame-fixed analytic core closing the `C₃` endpoint-mate kernel `c5d0`
(`docs/u-lane/97-section5-u-lane-prose.md`, kernel `U2a2-1a3d2c2d4c5d0`).

Normalize the MEC to the unit circle centred at `O = 0`, with the shared cap
endpoints `v₁ = (cos h, −sin h)`, `v₃ = (cos h, sin h)` symmetric about the
`x`-axis (chord half-angle `h`).  The equilateral packet `q v₁ v₃` (`c5d0b1`)
puts the disk-side apex at `q = (cos h − √3 sin h, 0)`, and the second
equilateral apex `q*` — the second intersection of `B(q, |qv₁|)` and
`B(v₃, |v₃v₁|)`, i.e. the reflection of `v₁` across line `q v₃` (`c5d0b1`) — is

    q* = (cos h − √3 sin h, 2 sin h),    ‖q*‖² = 1 + 4√3 · sin h · sin(h − π/6).

The selected `C₃` circle equality `|v₃v₂| = |v₃v₁|` (`c5d0b0`) forces the Moser
apex `v₂` to polar angle `3h`, so the support-triangle angle at `v₃` is `π − 2h`;
the Moser triangle is **non-obtuse** (`MoserTriangleNonObtuse`), giving the
hypothesis `hnonobtuse : π − 2h ≤ π/2` (equivalently `h ≥ π/4`).  With the cap
half-angle bound `hcap : h < π/3` (which makes `q` strictly inside the disk),
`sin h > 0` and `sin(h − π/6) > 0`, so the left side below — `‖q*‖²` for the
explicit reflected apex — strictly exceeds `R² = 1`.  Hence `q*` lies strictly
**outside** the closed MEC disk, contradicting `q* ∈ int(C₃) ⊆` open disk
(`c5d0a0`); see `c5d0_contradiction`.

The `hnonobtuse`/`hcap` hypotheses carry the same frame-reduction (cap-order /
non-obtuse) bridge status as `hbound` in `c5d2_dominance`; the inequality is the
load-bearing computational content of the c5d0 closure. -/
theorem c5d0_qstar_outside_disk (h : ℝ)
    (hnonobtuse : Real.pi - 2 * h ≤ Real.pi / 2)
    (hcap : h < Real.pi / 3) :
    1 < (Real.cos h - Real.sqrt 3 * Real.sin h) ^ 2 + (2 * Real.sin h) ^ 2 := by
  have hlo : Real.pi / 4 ≤ h := by linarith
  have hsin6 : Real.sin (h - Real.pi / 6)
      = Real.sqrt 3 / 2 * Real.sin h - 1 / 2 * Real.cos h := by
    rw [Real.sin_sub, Real.sin_pi_div_six, Real.cos_pi_div_six]; ring
  have hsq3 : Real.sqrt 3 ^ 2 = 3 := Real.sq_sqrt (by norm_num)
  have hpyth : Real.sin h ^ 2 + Real.cos h ^ 2 = 1 := Real.sin_sq_add_cos_sq h
  -- ‖q*‖² − 1 = 4√3 · sin h · sin(h − π/6)  (cos² = 1 − sin², (√3)² = 3)
  have hid : (Real.cos h - Real.sqrt 3 * Real.sin h) ^ 2 + (2 * Real.sin h) ^ 2 - 1
      = 4 * Real.sqrt 3 * Real.sin h * Real.sin (h - Real.pi / 6) := by
    rw [hsin6]; linear_combination (-(Real.sin h ^ 2)) * hsq3 + hpyth
  have hpi : 0 < Real.pi := Real.pi_pos
  have h3 : 0 < Real.sqrt 3 := Real.sqrt_pos.mpr (by norm_num)
  have hsh : 0 < Real.sin h :=
    Real.sin_pos_of_pos_of_lt_pi (by linarith) (by linarith)
  have hsh6 : 0 < Real.sin (h - Real.pi / 6) :=
    Real.sin_pos_of_pos_of_lt_pi (by linarith) (by linarith)
  have hpos : 0 < 4 * Real.sqrt 3 * Real.sin h * Real.sin (h - Real.pi / 6) :=
    mul_pos (mul_pos (mul_pos (by norm_num) h3) hsh) hsh6
  linarith [hid, hpos]

/-- **c5d0 kernel contradiction** (`U2a2-1a3d2c2d4c5d0`, Output `False`).
The reflected equilateral apex `q*` cannot be strictly inside the MEC disk: its
squared norm exceeds `R² = 1` (`c5d0_qstar_outside_disk`), contradicting
`q* ∈ int(C₃)` (`c5d0a0`), which forces squared norm `< 1`. -/
theorem c5d0_contradiction (h : ℝ)
    (hnonobtuse : Real.pi - 2 * h ≤ Real.pi / 2)
    (hcap : h < Real.pi / 3)
    (hinterior :
      (Real.cos h - Real.sqrt 3 * Real.sin h) ^ 2 + (2 * Real.sin h) ^ 2 < 1) :
    False := by
  linarith [c5d0_qstar_outside_disk h hnonobtuse hcap, hinterior]

end Problem97
