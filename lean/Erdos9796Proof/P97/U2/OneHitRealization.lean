import Erdos9796Proof.P97.U2.OneHitMonotone

/-!
# U2.B one-hit realization — the similarity-transport bridge (gap `R-A1`)

This module is the **vocabulary bridge** of the U2.B one-hit programme
(`docs/u-lane/97-u2b-realization-interface-plan.md`, gap `R-A1`).  It connects the
rigid-frame Route-A analysis core of `U2OneHitMonotone.lean` (strict radial
monotonicity from an interior cap-centre `capU1 α` along an adjacent cap arc
`capU2`/`capU3`) to a *general* cap configuration sitting anywhere in the plane.

## Why a bridge is needed

The Route-A core proves the monotonicity only in the **normalized E3-L13 frame**
(equilateral side `1`, `v₁ = (0,0)`, `v₂ = (1,0)`, `v₃ = (1/2, √3/2)`, unit-circle
cap arcs).  A real Section-3 configuration has its interior centre `s` and its
adjacent-cap side chain `L` at arbitrary positions.  CGN6's normalization
(`CGN6norm_minorCapChainModel_of_mecCapPacket`) does *not* land on this frame — it
produces a generic chord-aligned model — so the connection cannot be reused; it
must be made through an **explicit similarity** `T : ℝ² → ℝ²` carrying the real
configuration onto the E3-L13 frame.

The mechanism is exactly the similarity transport already used for the
endpoint-centred one-hit (`N9EndpointN4a.lean`, the `tau.dist_image` pattern): a
`Problem97.CGN.SimilarityTransportData T` scales all distances by a fixed positive
factor, so strict distance *inequalities* are preserved and reflected by `T`.  Once
`T` carries `s ↦ capU1 α` and the chain vertices `L.points i ↦ capU2 (γ i)`
(resp. `capU3 (δ i)`) with the arc angle in `(0, π/3)` and ordered, the abstract
interface `N8a3AdjacentCapDistanceStrict s L` follows from the rigid-frame core.

## What this module proves

* `n8a3_of_similarityToCapU2` — the **increasing** (cap `C₂`) bridge.
* `n8a3_of_similarityToCapU3` — the **decreasing** (cap `C₃`) bridge, taking a
  strictly *antitone* arc angle (the chain is then radially increasing).

Both discharge the pinned interface `N8a3AdjacentCapDistanceStrict`
(`U2OneHitBound.lean`), so composing with `u2_selectedClass_one_hit_of_mono`
gives `|SelectedClass ∩ adjacent-cap| ≤ 1` for a real configuration, once the
similarity `T` and arc-angle parametrisation `γ`/`δ` are exhibited.

## What remains (residual of `R-A1`)

Constructing the specific `(T, τ, α, γ)` from the Section-3 cap data — the explicit
similarity from the real equilateral Moser triangle + interior centre onto the
E3-L13 frame, and the identification of `Problem97.arcAngle`-measured positions with
`γ`/`δ ∈ (0, π/3)`.  That construction is now *all* that stands between the U2.B
one-hit bound and a real configuration; the distance-monotonicity geometry is done.

All declarations are axiom-clean (`{propext, Classical.choice, Quot.sound}`).
-/

open Real Set
open scoped EuclideanGeometry

namespace Problem97

/-! ### Minimal transport data

The bridge needs *only* that `T` scales every distance by a fixed positive factor
(`hscale : 0 < scale`, `hdist : ∀ a b, dist (T a) (T b) = scale * dist a b`) — none of
the orientation / convex-hull machinery of `Problem97.CGN.SimilarityTransportData`.
Taking these raw facts as the primitive hypothesis minimises what the residual
*construction* must produce: an explicit map plus its distance law, not a full
`SimilarityTransportData`.  The `SimilarityTransportData` corollaries below recover the
original interface for callers that already hold one (e.g. via the CGN6 normalization). -/

/-- **R-A1 transport primitive — cap `C₂` (increasing branch), raw distance-scaling.**
Given a map `T` scaling all distances by a fixed positive factor (`hscale`, `hdist`)
that carries the interior centre `s ↦ capU1 α` (`α ∈ (0, π/3)`) and the adjacent-cap
side chain `L.points i ↦ capU2 (γ i)` with `γ` strictly increasing into `(0, π/3)`, the
pinned monotonicity export `N8a3AdjacentCapDistanceStrict s L` holds: the strict radial
monotonicity proved in the normalized frame (`capU2_dist_strictMonoOn`) transports back
verbatim. -/
theorem n8a3_of_distScalingToCapU2
    {T : ℝ² → ℝ²} {scale : ℝ} (hscale : 0 < scale)
    (hdist : ∀ a b : ℝ², dist (T a) (T b) = scale * dist a b)
    {s : ℝ²} {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m)
    {α : ℝ} (hα0 : 0 < α) (hα1 : α < π/3)
    (γ : Fin m → ℝ) (hγmem : ∀ i, γ i ∈ Set.Icc (0:ℝ) (π/3)) (hγmono : StrictMono γ)
    (hs : T s = capU1 α)
    (hL : ∀ i, T (L.points i) = capU2 (γ i)) :
    N8a3AdjacentCapDistanceStrict s L := by
  intro i j hij
  have hmono := capU2_dist_strictMonoOn hα0 hα1 (hγmem i) (hγmem j) (hγmono hij)
  simp only [] at hmono
  rw [← hs, ← hL i, ← hL j, hdist, hdist] at hmono
  nlinarith [hmono, hscale]

/-- **R-A1 transport primitive — cap `C₃` (decreasing branch), raw distance-scaling.**
As `n8a3_of_distScalingToCapU2`, for the other adjacent cap `C₃` and its decreasing
radial profile (`capU3_dist_strictAntiOn`); the arc angle `δ` is taken strictly
*antitone* so the chain is radially increasing. -/
theorem n8a3_of_distScalingToCapU3
    {T : ℝ² → ℝ²} {scale : ℝ} (hscale : 0 < scale)
    (hdist : ∀ a b : ℝ², dist (T a) (T b) = scale * dist a b)
    {s : ℝ²} {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m)
    {α : ℝ} (hα0 : 0 < α) (hα1 : α < π/3)
    (δ : Fin m → ℝ) (hδmem : ∀ i, δ i ∈ Set.Icc (0:ℝ) (π/3)) (hδanti : StrictAnti δ)
    (hs : T s = capU1 α)
    (hL : ∀ i, T (L.points i) = capU3 (δ i)) :
    N8a3AdjacentCapDistanceStrict s L := by
  intro i j hij
  have hmono := capU3_dist_strictAntiOn hα0 hα1 (hδmem j) (hδmem i) (hδanti hij)
  simp only [] at hmono
  rw [← hs, ← hL i, ← hL j, hdist, hdist] at hmono
  nlinarith [hmono, hscale]

/-- **R-A1 transport bridge — cap `C₂` (increasing branch).**  The
`Problem97.CGN.SimilarityTransportData` packaging of `n8a3_of_distScalingToCapU2`, for
callers holding a full similarity transport (e.g. from the CGN6 normalization). -/
theorem n8a3_of_similarityToCapU2
    {T : ℝ² → ℝ²} (τ : Problem97.CGN.SimilarityTransportData T)
    {s : ℝ²} {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m)
    {α : ℝ} (hα0 : 0 < α) (hα1 : α < π/3)
    (γ : Fin m → ℝ) (hγmem : ∀ i, γ i ∈ Set.Icc (0:ℝ) (π/3)) (hγmono : StrictMono γ)
    (hs : T s = capU1 α)
    (hL : ∀ i, T (L.points i) = capU2 (γ i)) :
    N8a3AdjacentCapDistanceStrict s L :=
  n8a3_of_distScalingToCapU2 τ.scale_pos τ.dist_image L hα0 hα1 γ hγmem hγmono hs hL

/-- **R-A1 transport bridge — cap `C₃` (decreasing branch).**  The
`Problem97.CGN.SimilarityTransportData` packaging of `n8a3_of_distScalingToCapU3`. -/
theorem n8a3_of_similarityToCapU3
    {T : ℝ² → ℝ²} (τ : Problem97.CGN.SimilarityTransportData T)
    {s : ℝ²} {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m)
    {α : ℝ} (hα0 : 0 < α) (hα1 : α < π/3)
    (δ : Fin m → ℝ) (hδmem : ∀ i, δ i ∈ Set.Icc (0:ℝ) (π/3)) (hδanti : StrictAnti δ)
    (hs : T s = capU1 α)
    (hL : ∀ i, T (L.points i) = capU3 (δ i)) :
    N8a3AdjacentCapDistanceStrict s L :=
  n8a3_of_distScalingToCapU3 τ.scale_pos τ.dist_image L hα0 hα1 δ hδmem hδanti hs hL

end Problem97
