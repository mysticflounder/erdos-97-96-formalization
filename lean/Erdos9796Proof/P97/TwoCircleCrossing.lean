import Erdos9796Proof.P97.Foundation
import Mathlib.Geometry.Euclidean.Sphere.Basic

/-!
# Two-circle crossing kernel (radical-axis intersection bound)

The reusable planar geometry kernel behind the prose leaf
`U1m-c1a1` ("opposed-order contradiction") of
`docs/97-uniform-theorem-closure-plan.md`, and the U2 two-circle
witness-classification kernels.

The mathematical content — *two distinct circles meet in at most two
points* — is already available in Mathlib v4.27.0 as
`EuclideanGeometry.eq_of_mem_sphere_of_mem_sphere_of_finrank_eq_two`.
This file specializes it to the project plane `ℝ² = EuclideanSpace ℝ (Fin 2)`
and packages the *opposed-order* form the surplus-cap argument actually
consumes: a third common point of two distinct cap-circles whose
orientation against the shared chord is strict (nonzero `signedArea2`)
is impossible.

It does **not** discharge `U1m-c1a1` itself: producing such a
strictly-oriented common point from the ordered cap configuration is the
order argument's job and depends on the (still prose-only) cap interface.
This file provides the geometric heart that argument plugs into.

Both declarations are axiom-clean (`{propext, Classical.choice, Quot.sound}`).
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97

/-- **Two-circle crossing-cardinality kernel.**  In the plane `ℝ²`, two
*distinct* spheres through two *distinct* common points `p₁`, `p₂` admit no
third common point: any common point `q` equals `p₁` or `p₂`.  A thin
specialization of Mathlib's
`eq_of_mem_sphere_of_mem_sphere_of_finrank_eq_two` to the `finrank ℝ ℝ² = 2`
planar setting. -/
theorem two_circle_common_point_eq_endpoint
    {s₁ s₂ : Sphere ℝ²} (hs : s₁ ≠ s₂) {p₁ p₂ q : ℝ²} (hp : p₁ ≠ p₂)
    (hp₁s₁ : p₁ ∈ s₁) (hp₂s₁ : p₂ ∈ s₁) (hp₁s₂ : p₁ ∈ s₂) (hp₂s₂ : p₂ ∈ s₂)
    (hqs₁ : q ∈ s₁) (hqs₂ : q ∈ s₂) : q = p₁ ∨ q = p₂ :=
  eq_of_mem_sphere_of_mem_sphere_of_finrank_eq_two
    finrank_euclideanSpace_fin hs hp hp₁s₁ hp₂s₁ hqs₁ hp₁s₂ hp₂s₂ hqs₂

/-- **Two-circle opposed-order crossing exclusion** — the geometric kernel the
prose leaf `U1m-c1a1` consumes.  Two distinct cap-circles `s₁`, `s₂` share two
distinct endpoints `p₁`, `p₂`.  A third common point `q` whose orientation
against the chord `p₁`–`p₂` is *strict* (`signedArea2 p₁ p₂ q ≠ 0`, i.e. `q`
lies off the line through the endpoints) is impossible.

This is exactly the "opposed-order contradiction" geometric heart: the order
argument's job is to *produce* such a strictly-oriented common `q`; this lemma
discharges the contradiction once it is produced.  It consumes both the Mathlib
`≤ 2`-points bound (via `two_circle_common_point_eq_endpoint`) and the in-repo
`signedArea2` orientation primitive (`Foundation.lean`). -/
theorem two_circle_noncollinear_common_point_elim
    {s₁ s₂ : Sphere ℝ²} (hs : s₁ ≠ s₂) {p₁ p₂ q : ℝ²} (hp : p₁ ≠ p₂)
    (hp₁s₁ : p₁ ∈ s₁) (hp₂s₁ : p₂ ∈ s₁) (hp₁s₂ : p₁ ∈ s₂) (hp₂s₂ : p₂ ∈ s₂)
    (hqs₁ : q ∈ s₁) (hqs₂ : q ∈ s₂) (hori : signedArea2 p₁ p₂ q ≠ 0) : False := by
  have hqp₁ : q ≠ p₁ := by rintro rfl; exact hori (by simp [signedArea2])
  have hqp₂ : q ≠ p₂ := by rintro rfl; exact hori (by simp [signedArea2])
  rcases two_circle_common_point_eq_endpoint hs hp hp₁s₁ hp₂s₁ hp₁s₂ hp₂s₂ hqs₁ hqs₂ with h | h
  · exact hqp₁ h
  · exact hqp₂ h

/- ### U1m-c1a1 opposed-order crossing ledger

The structure and reduction below are the theorem-facing form of the
`U1m-c1a1c1`/`U1m-c1a1c2` micro-stack of `docs/97-uniform-theorem-closure-plan.md`
(prose at `docs/97-full-prose-proof-draft.md`, "U1m-c1a1").  They home the
opposed-order crossing ledger named in `U1m-c1a1b` and discharge its
contradiction via the kernel above. -/

/-- **Opposed-order crossing ledger** — `U1m-c1a1c1` ("crossing-ledger
normalization") in theorem-facing form.  The two-circle crossing ledger named
in `U1m-c1a1b` consists of a source blocker circle (centre `cₛ`, radius `rₛ`)
and a target blocker circle (centre `cₜ`, radius `rₜ`); in the opposed row they
are *distinct*, share two *distinct* endpoints `e₁`, `e₂` (the spent source and
target endpoint directions), and the opposed-order push exhibits a third common
point `w` lying *strictly off* the shared chord (`signedArea2 e₁ e₂ w ≠ 0`).

The membership fields use the project's `dist · centre = radius` circle
vocabulary — the same form as `U1EndpointEquality` in
`U1TwoShortCapReduction.lean` — which is exactly the "endpoint-radius data" the
prose ledger carries.

This structure encodes the *post-normalization* shape only.  *Producing* a
ledger of this shape from the opposed cap configuration — i.e. showing the
source/target pushes toward opposite cap ends force a strictly-oriented third
common point — is the still-open derivation inside `U1m-c1a1c2`; this file does
**not** discharge that derivation. -/
structure OpposedOrderCrossingLedger where
  /-- Source blocker-circle centre. -/
  cₛ : ℝ²
  /-- Source blocker-circle radius. -/
  rₛ : ℝ
  /-- Target blocker-circle centre. -/
  cₜ : ℝ²
  /-- Target blocker-circle radius. -/
  rₜ : ℝ
  /-- First shared endpoint of the two circles. -/
  e₁ : ℝ²
  /-- Second shared endpoint of the two circles. -/
  e₂ : ℝ²
  /-- The opposed-order third common point. -/
  w : ℝ²
  /-- The source and target circles are distinct. -/
  circles_ne : (⟨cₛ, rₛ⟩ : Sphere ℝ²) ≠ ⟨cₜ, rₜ⟩
  /-- The two shared endpoints are distinct. -/
  endpoints_ne : e₁ ≠ e₂
  /-- `e₁` lies on the source circle. -/
  e₁_src : dist e₁ cₛ = rₛ
  /-- `e₂` lies on the source circle. -/
  e₂_src : dist e₂ cₛ = rₛ
  /-- `e₁` lies on the target circle. -/
  e₁_tgt : dist e₁ cₜ = rₜ
  /-- `e₂` lies on the target circle. -/
  e₂_tgt : dist e₂ cₜ = rₜ
  /-- The third common point `w` lies on the source circle. -/
  w_src : dist w cₛ = rₛ
  /-- The third common point `w` lies on the target circle. -/
  w_tgt : dist w cₜ = rₜ
  /-- `w` lies strictly off the chord `e₁`–`e₂` (opposed-order strict push). -/
  w_oriented : signedArea2 e₁ e₂ w ≠ 0

/-- **Opposed-order crossing contradiction** — the reduction `U1m-c1a1c2`
consumes (and the `U1m-c1a1c3` assembly packages).  A normalized opposed-order
crossing ledger is impossible: its source and target blocker circles are two
distinct circles sharing two distinct endpoints `e₁`, `e₂`, so by the
two-circle crossing bound they admit no third common point lying strictly off
the chord `e₁`–`e₂` — yet the ledger records exactly such a point `w`.

This closes the opposed-order row *given* a normalized ledger; obtaining that
ledger from the cap push is the open derivation (see
`OpposedOrderCrossingLedger`).  The proof is a thin specialization of
`two_circle_noncollinear_common_point_elim`, bridging the `dist · = r` circle
fields to `Sphere` membership via `EuclideanGeometry.mem_sphere`. -/
theorem opposedOrderCrossingLedger_contradiction
    (L : OpposedOrderCrossingLedger) : False :=
  two_circle_noncollinear_common_point_elim
    (s₁ := ⟨L.cₛ, L.rₛ⟩) (s₂ := ⟨L.cₜ, L.rₜ⟩)
    L.circles_ne L.endpoints_ne
    (mem_sphere.mpr L.e₁_src) (mem_sphere.mpr L.e₂_src)
    (mem_sphere.mpr L.e₁_tgt) (mem_sphere.mpr L.e₂_tgt)
    (mem_sphere.mpr L.w_src) (mem_sphere.mpr L.w_tgt)
    L.w_oriented

/- ### U2a2-1b4c2e2d3f1 shared-base witness exclusion

The lemma below is the theorem-facing form of the `U2a2-1b4c2e2d3f1c`
("center-separation contradiction") leaf in the U2 strict large-member K4
witness classification (`docs/97-full-prose-proof-draft.md`, "U2a2-1b4c2e2d3f").
It is a thin specialization of the kernel into U2's shared-base vocabulary
(centres `v₁` and `s`, base chord `v₂`–`v₃`), naming the `d3f1a` packet inline
rather than cloning a structure. -/

/-- **U2 shared-base strict-witness exclusion** — `U2a2-1b4c2e2d3f1c`.  The
exact `v₁`-centred cap class (radius `r₁`) and the selected `s`-class
(radius `rₛ`) are two *distinct* circles both meeting the common base chord
`v₂`–`v₃`.  A strict-interior witness `w` common to both classes and lying
*off* the base chord (`signedArea2 v₂ v₃ w ≠ 0`) is impossible.

This is the U2 instantiation of `two_circle_noncollinear_common_point_elim`:
two distinct circles through two distinct shared points admit no third common
point off the shared chord.  Establishing that the relevant witness lies on
*both* circles — the `d3f1b` "strict interior witness count" step — needs the
`T_s` selected-class vocabulary and is the open input this lemma consumes, not
discharges. -/
theorem u2_sharedBase_strictWitness_elim
    {v₁ s v₂ v₃ w : ℝ²} {r₁ rₛ : ℝ}
    (hcirc : (⟨v₁, r₁⟩ : Sphere ℝ²) ≠ ⟨s, rₛ⟩) (hbase : v₂ ≠ v₃)
    (hv₂1 : dist v₂ v₁ = r₁) (hv₃1 : dist v₃ v₁ = r₁)
    (hv₂s : dist v₂ s = rₛ) (hv₃s : dist v₃ s = rₛ)
    (hw1 : dist w v₁ = r₁) (hws : dist w s = rₛ)
    (hwoff : signedArea2 v₂ v₃ w ≠ 0) : False :=
  two_circle_noncollinear_common_point_elim
    (s₁ := ⟨v₁, r₁⟩) (s₂ := ⟨s, rₛ⟩) hcirc hbase
    (mem_sphere.mpr hv₂1) (mem_sphere.mpr hv₃1)
    (mem_sphere.mpr hv₂s) (mem_sphere.mpr hv₃s)
    (mem_sphere.mpr hw1) (mem_sphere.mpr hws) hwoff

end Problem97
