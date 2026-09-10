import Erdos9796Proof.P97.N8.N8aArcTwoCircle
import Erdos9796Proof.P97.N8.N8bEndpointPair
import Erdos9796Proof.P97.U2.SimilarityNormalization

/-!
# Interior-apex E3-L13 cap-coordinate normalization (the W8 / W10 convergent blocker)

This file lands the **single convergent blocker** shared by W8 (`N8b` endpoint-pair
split), W10 adj-L, W10 adj-R, and W10 N8h: for an interior cap apex `x`, producing the
pinned monotonicity export `N8a3AdjacentCapDistanceStrict x chain` along an adjacent
cap chain.

All four downstream gates need the *same* object: strict radial monotonicity from the
*interior* apex `x` along an adjacent cap's ordered chain
(`U2OneHitBound.lean:49–62`, `N8bEndpointPair.lean:182–194`,
`N8kDistribution.lean:107/128/205`).  The heavy normalized-frame analysis is already
proved in `U2SimilarityNormalization.lean` (`normSim_centre_image`,
`n8a3_normSimChain_capU{2,3}_oriented`): once the real configuration is carried onto the
E3-L13 frame by the normalizing similarity `normSim v₁ v₂`, the apex lands on `capU1 α`
(`α ∈ (0, π/3)`), the adjacent-cap chain on `capU2 γ` / `capU3 δ`, and the distance
monotonicity transports back verbatim.

## What this file proves (composition core — axiom-clean, no `sorry`)

* `InteriorApexCapU2Frame` / `InteriorApexCapU3Frame` — the bundle of E3-L13 hypotheses
  that the proven `normSim` machinery consumes: the positively-oriented equilateral apex
  triangle `(v₁,v₂,v₃)`, the N7 Apollonius rigidity of the apex (`dist x v₁ = dist v₁ v₂`)
  and its strict cap-`C₁` chord side, the adjacent-cap chain image identities, the chain
  arc-angle membership, and the chain orientation seen from the adjacent apex.
* `normSim_interiorApex_capU1` — the **primary lemma**: from an `InteriorApexCapU2Frame`
  (equivalently `InteriorApexCapU3Frame`; both carry the apex sub-bundle) the normalizing
  similarity sends `x ↦ capU1 α` for a *unique open-arc* angle `α ∈ (0, π/3)`.  Fully
  proved via `normSim_centre_image`.
* `n8a3_interiorApex_capU2` / `n8a3_interiorApex_capU3` — the two adjacent-cap producers:
  `N8a3AdjacentCapDistanceStrict x chain`, fully proved by composing
  `n8a3_normSimChain_capU{2,3}_oriented`.  These are exactly
  `n8a3_of_distScalingToCapU{2,3}` packaged through `normSim` and consumed by W8/W10.

## Shell-facing frame producers (now CLOSED — the former G3 / N7 SORRY-GATE)

The shell producers `exists_interiorApexCapU{2,3}Frame` build an `InteriorApexCapU{2,3}Frame`
directly from a `FiniteEndpointShell` (with its `N4eCapContainment` packet) and an interior
apex `x ∈ S.capInteriorByIndex i`.  These were the single convergent G3 / N7 blocker shared
by W8 (`N8b`), W10 adj-L, W10 adj-R, and W10 N8h; they are now discharged with no `sorry`.

The closure routes through the apex sub-bundle producer `exists_apexFrameData`: for the cap
opposite Moser vertex `vₖ`, `n7_circle_placement` supplies the common equilateral side `d`,
the apex Apollonius radius `dist vₖ x = d`, and the equilateral identities;
`CapTriple.arc_membership` supplies the closed-arc membership `OnArcOpposite`; and
`exists_apex_frame` resolves the triangle orientation (swapping the two adjacent vertices in
the negatively-oriented case) to deliver the positively-oriented frame plus the strict
cap-`C₁` chord side, with strictness from `signedArea2_ne_zero_of_three_dist_eq` (three
distinct points on the radius-`d` circle about `vₖ` are never collinear).  The existential
chain is the trivial `m = 0` empty chain, on which every per-vertex chain field is vacuous —
the heavy chain analysis is already discharged by the `n8a3_interiorApex_capU{2,3}` producers
above, which a caller holding a non-trivial frame invokes directly.

All declarations in this file are axiom-clean (`{propext, Classical.choice, Quot.sound}`).
-/

open Real Set
open scoped EuclideanGeometry
open scoped RealInnerProductSpace
open EuclideanGeometry
open Finset

namespace Problem97

/- ## Equilateral / apex orientation helpers (G3 / N7 frame production) -/

/-- The `signedArea2` form swaps sign under transposing the last two vertices. -/
theorem signedArea2_swap23 (a b c : ℝ²) :
    signedArea2 a b c = - signedArea2 a c b := by
  simp only [signedArea2]; ring

/-- `OnArcOpposite` is symmetric in the two chord endpoints `vj`, `vk`: transposing them
negates both signed-area factors, leaving the chord-separation product invariant. -/
theorem onArcOpposite_swap (vi vj vk v : ℝ²) :
    OnArcOpposite vi vj vk v ↔ OnArcOpposite vi vk vj v := by
  unfold OnArcOpposite
  rw [signedArea2_swap23 v vk vj, signedArea2_swap23 vi vk vj]
  constructor <;> intro h <;> nlinarith [h]

/-- An equilateral triangle with positive side length is nondegenerate: its signed
area is nonzero.  If the three equal-side vertices were collinear, one would be strictly
between the other two, forcing a distance strictly below the common side `d`. -/
theorem signedArea2_ne_zero_of_equilateral
    {v₁ v₂ v₃ : ℝ²} {d : ℝ} (hd : 0 < d)
    (e12 : dist v₁ v₂ = d) (e13 : dist v₁ v₃ = d) (e23 : dist v₂ v₃ = d)
    (hp12 : v₁ ≠ v₂) (hp23 : v₂ ≠ v₃) (hp13 : v₁ ≠ v₃) :
    signedArea2 v₁ v₂ v₃ ≠ 0 := by
  intro hz
  have hcol : Collinear ℝ ({v₁, v₂, v₃} : Set ℝ²) :=
    collinear_of_signedArea2_eq_zero v₁ v₂ v₃ hz
  have e21 : dist v₂ v₁ = d := by rw [dist_comm]; exact e12
  have e31 : dist v₃ v₁ = d := by rw [dist_comm]; exact e13
  have e32 : dist v₃ v₂ = d := by rw [dist_comm]; exact e23
  rcases hcol.wbtw_or_wbtw_or_wbtw with hw | hw | hw
  · have hs : Sbtw ℝ v₁ v₂ v₃ := ⟨hw, hp12.symm, hp23⟩
    have hd' := hs.dist_lt_max_dist v₁
    rw [dist_self, e21, e31, max_eq_right hd.le] at hd'; exact lt_irrefl d hd'
  · have hs : Sbtw ℝ v₂ v₃ v₁ := ⟨hw, hp23.symm, hp13.symm⟩
    have hd' := hs.dist_lt_max_dist v₂
    rw [dist_self, e32, e12, max_eq_right hd.le] at hd'; exact lt_irrefl d hd'
  · have hs : Sbtw ℝ v₃ v₁ v₂ := ⟨hw, hp13, hp12⟩
    have hd' := hs.dist_lt_max_dist v₃
    rw [dist_self, e13, e23, max_eq_right hd.le] at hd'; exact lt_irrefl d hd'

/-- **Generic E3-L13 apex sub-bundle producer.**  From an equilateral triangle
`(v₁,v₂,v₃)` of common side `d > 0`, an apex `x` at distance `d` from `v₁` lying on the
closed MEC arc opposite `v₁` (`OnArcOpposite v₁ v₂ v₃ x`) and strictly off the two
adjacent Moser vertices (`x ≠ v₂`, `x ≠ v₃`), produce a *positively-oriented* equilateral
apex frame `(v₁, a₂, a₃)` carrying the full `normSim_centre_image` input bundle: the
chord-side strictness `signedArea2 x a₂ a₃ < 0` and the Apollonius rigidity
`dist x v₁ = dist v₁ a₂`.

The frame `(a₂, a₃)` is `(v₂, v₃)` when the natural triangle is positively oriented and
`(v₃, v₂)` otherwise; the swap negates `signedArea2`, restoring positive orientation while
flipping the apex chord sign to strictly negative.  Strictness comes from
`signedArea2_ne_zero_of_three_dist_eq`: `x, v₂, v₃` are three distinct points on the
circle of radius `d` about `v₁`, hence never collinear. -/
theorem exists_apex_frame
    {v₁ v₂ v₃ x : ℝ²} {d : ℝ} (hd : 0 < d)
    (hp12 : v₁ ≠ v₂) (hp23 : v₂ ≠ v₃) (hp13 : v₁ ≠ v₃)
    (e12 : dist v₁ v₂ = d) (e13 : dist v₁ v₃ = d) (e23 : dist v₂ v₃ = d)
    (hx1 : dist v₁ x = d)
    (harc : OnArcOpposite v₁ v₂ v₃ x)
    (hxv2 : x ≠ v₂) (hxv3 : x ≠ v₃) :
    ∃ a₂ a₃ : ℝ²,
      v₁ ≠ a₂ ∧
      dist v₁ a₂ = dist a₃ v₁ ∧ dist v₁ a₂ = dist a₂ a₃ ∧
      0 < signedArea2 v₁ a₂ a₃ ∧
      dist x v₁ = dist v₁ a₂ ∧
      signedArea2 x a₂ a₃ < 0 := by
  have hxv1 : dist x v₁ = d := by rw [dist_comm]; exact hx1
  have e21 : dist v₂ v₁ = d := by rw [dist_comm]; exact e12
  have e31 : dist v₃ v₁ = d := by rw [dist_comm]; exact e13
  have e32 : dist v₃ v₂ = d := by rw [dist_comm]; exact e23
  have hxchord_ne : signedArea2 x v₂ v₃ ≠ 0 :=
    Problem97.MEC.signedArea2_ne_zero_of_three_dist_eq hxv1 e21 e31 hxv2 hp23 hxv3
  have htri_ne : signedArea2 v₁ v₂ v₃ ≠ 0 :=
    signedArea2_ne_zero_of_equilateral hd e12 e13 e23 hp12 hp23 hp13
  have harc' : signedArea2 x v₂ v₃ * signedArea2 v₁ v₂ v₃ ≤ 0 := harc
  rcases lt_or_gt_of_ne htri_ne with hneg | hpos
  · -- negative orientation: swapped frame `(v₁, v₃, v₂)`
    have hpos_swap : 0 < signedArea2 v₁ v₃ v₂ := by
      rw [signedArea2_swap23 v₁ v₃ v₂]; linarith
    have hxpos : 0 < signedArea2 x v₂ v₃ := by
      rcases lt_or_gt_of_ne hxchord_ne with hc | hc
      · exfalso; nlinarith [harc']
      · exact hc
    refine ⟨v₃, v₂, hp13, ?_, ?_, hpos_swap, ?_, ?_⟩
    · rw [e13, e21]
    · rw [e13, e32]
    · rw [hxv1, e13]
    · rw [signedArea2_swap23 x v₃ v₂]; linarith
  · -- positive orientation: natural frame `(v₁, v₂, v₃)`
    have hxneg : signedArea2 x v₂ v₃ < 0 := by
      rcases lt_or_gt_of_ne hxchord_ne with hc | hc
      · exact hc
      · exfalso; nlinarith [harc']
    refine ⟨v₂, v₃, hp12, ?_, ?_, hpos, ?_, hxneg⟩
    · rw [e12, e31]
    · rw [e12, e23]
    · rw [hxv1, e12]

/-- The empty ordered side chain, the trivial `m = 0` carrier on which every per-vertex
chain field of the interior-apex frame bundles is vacuous. -/
noncomputable def FiniteEndpoint.emptyOrderedSideChain :
    FiniteEndpoint.OrderedSideChain 0 where
  points := fun i => Fin.elim0 i
  injective := fun i => Fin.elim0 i

/- ## The E3-L13 interior-apex frame bundles -/

/-- **Interior-apex cap-`C₂` frame** (increasing branch).  The bundle of E3-L13 geometric
hypotheses that the proven normalized-frame machinery consumes to discharge the
interior-apex adjacent-cap monotonicity along the cap-`C₂` chain.

The apex sub-bundle (`hp`, `h31`, `h23`, `hori`, `hx1`, `hxchord`) is exactly the input of
`normSim_centre_image`: a positively-oriented equilateral apex triangle `(v₁,v₂,v₃)`, the
N7 Apollonius rigidity `dist x v₁ = dist v₁ v₂`, and the strict cap-`C₁` chord side
`signedArea2 x v₂ v₃ < 0`.  The chain sub-bundle (`hγmem`, `hL`, `horient`) is the input of
`n8a3_normSimChain_capU2_oriented`: the chain images are `capU2 (γ i)` with arc angle in
`[0, π/3]`, ordered positively as seen from the adjacent apex `v₂`. -/
structure InteriorApexCapU2Frame
    (v₁ v₂ v₃ x : ℝ²) {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) where
  /-- The frame base side is nondegenerate. -/
  hp : v₁ ≠ v₂
  /-- Equilateral: `|v₁v₂| = |v₃v₁|`. -/
  h31 : dist v₁ v₂ = dist v₃ v₁
  /-- Equilateral: `|v₁v₂| = |v₂v₃|`. -/
  h23 : dist v₁ v₂ = dist v₂ v₃
  /-- The apex triangle is positively oriented. -/
  hori : 0 < signedArea2 v₁ v₂ v₃
  /-- N7 Apollonius rigidity: the interior apex lies on the equal-radius circle at `v₁`. -/
  hx1 : dist x v₁ = dist v₁ v₂
  /-- The interior apex is strictly beyond the cap-`C₁` chord `v₂v₃` from `v₁`. -/
  hxchord : signedArea2 x v₂ v₃ < 0
  /-- The cap-`C₂` arc angle of each chain vertex. -/
  γ : Fin m → ℝ
  /-- Each chain arc angle lies in the closed open-cap range. -/
  hγmem : ∀ i, γ i ∈ Set.Icc (0 : ℝ) (π / 3)
  /-- Each chain vertex normalizes to its `capU2` coordinate. -/
  hL : ∀ i, normSim v₁ v₂ (L.points i) = capU2 (γ i)
  /-- The chain winds positively as seen from the adjacent apex `v₂`. -/
  horient : ∀ i j, i < j → 0 < signedArea2 v₂ (L.points i) (L.points j)

/-- **Interior-apex cap-`C₃` frame** (decreasing branch).  As `InteriorApexCapU2Frame`,
for the other adjacent cap `C₃`: the chain images are `capU3 (δ i)` and the chain winds
*negatively* as seen from the adjacent apex `v₃` (so the radial distance increases). -/
structure InteriorApexCapU3Frame
    (v₁ v₂ v₃ x : ℝ²) {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) where
  /-- The frame base side is nondegenerate. -/
  hp : v₁ ≠ v₂
  /-- Equilateral: `|v₁v₂| = |v₃v₁|`. -/
  h31 : dist v₁ v₂ = dist v₃ v₁
  /-- Equilateral: `|v₁v₂| = |v₂v₃|`. -/
  h23 : dist v₁ v₂ = dist v₂ v₃
  /-- The apex triangle is positively oriented. -/
  hori : 0 < signedArea2 v₁ v₂ v₃
  /-- N7 Apollonius rigidity: the interior apex lies on the equal-radius circle at `v₁`. -/
  hx1 : dist x v₁ = dist v₁ v₂
  /-- The interior apex is strictly beyond the cap-`C₁` chord `v₂v₃` from `v₁`. -/
  hxchord : signedArea2 x v₂ v₃ < 0
  /-- The cap-`C₃` arc angle of each chain vertex. -/
  δ : Fin m → ℝ
  /-- Each chain arc angle lies in the closed open-cap range. -/
  hδmem : ∀ i, δ i ∈ Set.Icc (0 : ℝ) (π / 3)
  /-- Each chain vertex normalizes to its `capU3` coordinate. -/
  hL : ∀ i, normSim v₁ v₂ (L.points i) = capU3 (δ i)
  /-- The chain winds negatively as seen from the adjacent apex `v₃`. -/
  horient : ∀ i j, i < j → signedArea2 v₃ (L.points i) (L.points j) < 0

/- ## The primary lemma: interior apex normalizes to `capU1 α`, `α ∈ (0, π/3)` -/

/-- **Primary lemma — interior-apex E3-L13 coordinate existence.**  From an interior-apex
cap-`C₂` frame the normalizing similarity `normSim v₁ v₂` sends the interior apex `x` to
`capU1 α` for a unique *open-arc* angle `α ∈ (0, π/3)`.

This is the "interior-apex E3-L13 coordinate existence" lemma, the W8 / W10 convergent
unlock.  It is the apex half of the normalization (`normSim_centre_image`): the equilateral
frame fixes `v₁ ↦ (0,0)`, `v₂ ↦ (1,0)`, `v₃ ↦ (1/2,√3/2)`, the Apollonius rigidity places
`x` on the unit circle about the origin, and the cap-`C₁` chord side pins the angle into the
open `(0, π/3)` wedge. -/
theorem normSim_interiorApex_capU1
    {v₁ v₂ v₃ x : ℝ²} {m : ℕ} {L : FiniteEndpoint.OrderedSideChain m}
    (F : InteriorApexCapU2Frame v₁ v₂ v₃ x L) :
    ∃ α : ℝ, normSim v₁ v₂ x = capU1 α ∧ 0 < α ∧ α < π / 3 :=
  normSim_centre_image v₁ v₂ v₃ x F.hp F.h31 F.h23 F.hori F.hx1 F.hxchord

/-- The cap-`C₃` frame carries the same apex sub-bundle, so it equally produces the
interior-apex `capU1 α` coordinate. -/
theorem normSim_interiorApex_capU1'
    {v₁ v₂ v₃ x : ℝ²} {m : ℕ} {L : FiniteEndpoint.OrderedSideChain m}
    (F : InteriorApexCapU3Frame v₁ v₂ v₃ x L) :
    ∃ α : ℝ, normSim v₁ v₂ x = capU1 α ∧ 0 < α ∧ α < π / 3 :=
  normSim_centre_image v₁ v₂ v₃ x F.hp F.h31 F.h23 F.hori F.hx1 F.hxchord

/- ## The two adjacent-cap monotonicity producers -/

/-- **Interior-apex adjacent-cap monotonicity — cap `C₂` (increasing branch).**  From an
interior-apex cap-`C₂` frame, the pinned export `N8a3AdjacentCapDistanceStrict x L` holds:
the distance from the interior apex `x` to the adjacent-cap chain vertices is strictly
increasing along the chain.

Fully proved by composing `n8a3_normSimChain_capU2_oriented` (which itself routes through
`n8a3_of_distScalingToCapU2`): the apex sub-bundle gives `x ↦ capU1 α`, the chain
sub-bundle gives `L.points i ↦ capU2 (γ i)` with positively-oriented winding, and the
normalized-frame strict monotonicity transports back. -/
theorem n8a3_interiorApex_capU2
    {v₁ v₂ v₃ x : ℝ²} {m : ℕ} {L : FiniteEndpoint.OrderedSideChain m}
    (F : InteriorApexCapU2Frame v₁ v₂ v₃ x L) :
    N8a3AdjacentCapDistanceStrict x L :=
  n8a3_normSimChain_capU2_oriented v₁ v₂ v₃ x F.hp F.h31 F.h23 F.hori F.hx1 F.hxchord
    L F.γ F.hγmem F.hL F.horient

/-- **Interior-apex adjacent-cap monotonicity — cap `C₃` (decreasing branch).**  As
`n8a3_interiorApex_capU2`, for the other adjacent cap `C₃`: the chain arc angle `δ` is
strictly antitone (negatively-oriented winding from `v₃`), so the radial distance still
strictly increases along the chain.  Fully proved by composing
`n8a3_normSimChain_capU3_oriented`. -/
theorem n8a3_interiorApex_capU3
    {v₁ v₂ v₃ x : ℝ²} {m : ℕ} {L : FiniteEndpoint.OrderedSideChain m}
    (F : InteriorApexCapU3Frame v₁ v₂ v₃ x L) :
    N8a3AdjacentCapDistanceStrict x L :=
  n8a3_normSimChain_capU3_oriented v₁ v₂ v₃ x F.hp F.h31 F.h23 F.hori F.hx1 F.hxchord
    L F.δ F.hδmem F.hL F.horient

/- ## Shell-facing witness assembly (the W8 / W10 consumer surface)

The four downstream gates (`N8bEndpointPair` W8, `N8kDistribution` W10 adj-L / adj-R /
N8h) consume an `N8AdjacentArcWitness` whose `monotone` field is exactly
`N8a3AdjacentCapDistanceStrict x chain` for the interior apex `x` — the object the two
producers above deliver in full.  The assembly below packages a producer-built witness;
the *only* remaining open data are the non-monotonicity witness fields (the arc circle,
the chain covering, and the two-circle distinctness), plus the geometric frame whose
fields are the load-bearing G3 / N7 inputs.  The convergent monotonicity blocker itself is
discharged here with no `sorry`. -/

/-- **Interior-apex adjacent-cap witness — cap `C₂` branch.**  Assemble the
`N8AdjacentArcWitness` consumed by W8 / W10 from a producer-proved monotonicity
(`n8a3_interiorApex_capU2`) together with the remaining (non-monotonicity) packet data:
the apex/radius, the arc circle over the adjacent-cap support, the two-circle distinctness,
and an ordered chain covering the support.

This wires the convergent blocker (`monotone`) to the fully-proved
`n8a3_interiorApex_capU2`; the caller still supplies the arc/chain incidence data, but the
strict radial monotonicity — the genuinely-open field every prior gate isolated — is now
closed. -/
def interiorApexAdjacentArcWitness_capU2
    {v₁ v₂ v₃ x : ℝ²} {m : ℕ} {L : FiniteEndpoint.OrderedSideChain m}
    (F : InteriorApexCapU2Frame v₁ v₂ v₃ x L)
    (selectedRadius : ℝ) (arc : N8ArcCircle)
    (circles_ne : (⟨x, selectedRadius⟩ : Sphere ℝ²) ≠
      ⟨arc.circleCenter, arc.circleRadius⟩)
    (chain_covers : arc.support ⊆ L.support) :
    N8AdjacentArcWitness :=
  { base :=
      { apex := x
        selectedRadius := selectedRadius
        arc := arc
        circles_ne := circles_ne }
    m := m
    chain := L
    chain_covers := chain_covers
    monotone := n8a3_interiorApex_capU2 F }

/-- **Interior-apex adjacent-cap witness — cap `C₃` branch.**  As
`interiorApexAdjacentArcWitness_capU2`, with the decreasing-branch producer
`n8a3_interiorApex_capU3`. -/
def interiorApexAdjacentArcWitness_capU3
    {v₁ v₂ v₃ x : ℝ²} {m : ℕ} {L : FiniteEndpoint.OrderedSideChain m}
    (F : InteriorApexCapU3Frame v₁ v₂ v₃ x L)
    (selectedRadius : ℝ) (arc : N8ArcCircle)
    (circles_ne : (⟨x, selectedRadius⟩ : Sphere ℝ²) ≠
      ⟨arc.circleCenter, arc.circleRadius⟩)
    (chain_covers : arc.support ⊆ L.support) :
    N8AdjacentArcWitness :=
  { base :=
      { apex := x
        selectedRadius := selectedRadius
        arc := arc
        circles_ne := circles_ne }
    m := m
    chain := L
    chain_covers := chain_covers
    monotone := n8a3_interiorApex_capU3 F }

/-- The assembled cap-`C₂` witness carries the intended apex, radius, and arc support, so it
plugs directly into the W10 `∃ W, W.base.apex = x ∧ W.base.selectedRadius = r ∧
W.base.arc.support = <adjacent interior>` shape. -/
@[simp] theorem interiorApexAdjacentArcWitness_capU2_base
    {v₁ v₂ v₃ x : ℝ²} {m : ℕ} {L : FiniteEndpoint.OrderedSideChain m}
    (F : InteriorApexCapU2Frame v₁ v₂ v₃ x L)
    (selectedRadius : ℝ) (arc : N8ArcCircle)
    (circles_ne : (⟨x, selectedRadius⟩ : Sphere ℝ²) ≠
      ⟨arc.circleCenter, arc.circleRadius⟩)
    (chain_covers : arc.support ⊆ L.support) :
    (interiorApexAdjacentArcWitness_capU2 F selectedRadius arc circles_ne
        chain_covers).base.apex = x ∧
      (interiorApexAdjacentArcWitness_capU2 F selectedRadius arc circles_ne
        chain_covers).base.selectedRadius = selectedRadius ∧
      (interiorApexAdjacentArcWitness_capU2 F selectedRadius arc circles_ne
        chain_covers).base.arc.support = arc.support :=
  ⟨rfl, rfl, rfl⟩

/-- The assembled cap-`C₃` witness likewise carries the intended apex, radius, and arc
support. -/
@[simp] theorem interiorApexAdjacentArcWitness_capU3_base
    {v₁ v₂ v₃ x : ℝ²} {m : ℕ} {L : FiniteEndpoint.OrderedSideChain m}
    (F : InteriorApexCapU3Frame v₁ v₂ v₃ x L)
    (selectedRadius : ℝ) (arc : N8ArcCircle)
    (circles_ne : (⟨x, selectedRadius⟩ : Sphere ℝ²) ≠
      ⟨arc.circleCenter, arc.circleRadius⟩)
    (chain_covers : arc.support ⊆ L.support) :
    (interiorApexAdjacentArcWitness_capU3 F selectedRadius arc circles_ne
        chain_covers).base.apex = x ∧
      (interiorApexAdjacentArcWitness_capU3 F selectedRadius arc circles_ne
        chain_covers).base.selectedRadius = selectedRadius ∧
      (interiorApexAdjacentArcWitness_capU3 F selectedRadius arc circles_ne
        chain_covers).base.arc.support = arc.support :=
  ⟨rfl, rfl, rfl⟩

/- ## Two-point adjacent-cap monotone chain (W10 adj-L / adj-R closure)

Each opposite cap interior has cardinality *exactly* two
(`n4b_n5_exact_cap_vector_of_interior_lower_bounds`), so the W10 adjacent-arc witness — which
demands `arc.support ⊆ chain.support` for `arc.support` the *whole* adjacent cap interior —
needs a genuine two-point ordered chain (the trivial `m = 0` empty chain forces an empty
support and cannot cover a two-point cap).  The producers below build that chain and supply
its strict radial monotonicity `N8a3AdjacentCapDistanceStrict x chain` from the proven
`n8a3_normSimChain_capU{2,3}_oriented` machinery, with both the apex-triangle orientation and
the chain-vertex order resolved by case split. -/

/-- A two-point ordered side chain from two distinct points. -/
noncomputable def twoPointChain (w₁ w₂ : ℝ²) (hne : w₁ ≠ w₂) :
    FiniteEndpoint.OrderedSideChain 2 where
  points := ![w₁, w₂]
  injective := by intro i j hij; fin_cases i <;> fin_cases j <;> simp_all

/-- P97 N8 theorem. -/
@[simp] theorem twoPointChain_points_zero (w₁ w₂ : ℝ²) (hne : w₁ ≠ w₂) :
    (twoPointChain w₁ w₂ hne).points 0 = w₁ := rfl

/-- P97 N8 theorem. -/
@[simp] theorem twoPointChain_points_one (w₁ w₂ : ℝ²) (hne : w₁ ≠ w₂) :
    (twoPointChain w₁ w₂ hne).points 1 = w₂ := rfl

/-- The two-point chain's support is exactly the pair `{w₁, w₂}`. -/
theorem twoPointChain_support (w₁ w₂ : ℝ²) (hne : w₁ ≠ w₂) :
    (twoPointChain w₁ w₂ hne).support = ({w₁, w₂} : Finset ℝ²) := by
  ext z
  simp only [FiniteEndpoint.OrderedSideChain.mem_support_iff, twoPointChain, Finset.mem_insert,
    Finset.mem_singleton]
  refine ⟨?_, ?_⟩
  · rintro ⟨i, rfl⟩; fin_cases i <;> simp
  · rintro (rfl | rfl); exacts [⟨0, rfl⟩, ⟨1, rfl⟩]

/-- **Two-point cap-`C₂` increasing branch.**  For a *positively-oriented* equilateral apex
triangle `(v₁, v₂, v₃)`, an interior apex `x` (on the radius-`d` circle at `v₁`, strictly
beyond the cap chord), and two distinct adjacent-cap-`C₂` vertices `w₁, w₂` (each at distance
`d` from `v₂`, strictly beyond the `v₃v₁` chord) ordered positively as seen from `v₂`, the
strict radial monotonicity `N8a3AdjacentCapDistanceStrict x` holds along `(w₁, w₂)`. -/
theorem n8a3_twoPoint_capU2pos {v₁ v₂ v₃ x w₁ w₂ : ℝ²} {d : ℝ} (hne : w₁ ≠ w₂)
    (hp12 : v₁ ≠ v₂)
    (e12 : dist v₁ v₂ = d) (e13 : dist v₁ v₃ = d) (e23 : dist v₂ v₃ = d)
    (hpos : 0 < signedArea2 v₁ v₂ v₃)
    (hx1 : dist v₁ x = d) (hxchord : signedArea2 x v₂ v₃ < 0)
    (hw1d : dist w₁ v₂ = d) (hw2d : dist w₂ v₂ = d)
    (hw1chord : signedArea2 w₁ v₃ v₁ < 0) (hw2chord : signedArea2 w₂ v₃ v₁ < 0)
    (horient01 : 0 < signedArea2 v₂ w₁ w₂) :
    N8a3AdjacentCapDistanceStrict x (twoPointChain w₁ w₂ hne) := by
  have h31 : dist v₁ v₂ = dist v₃ v₁ := by rw [e12, dist_comm, e13]
  have h23 : dist v₁ v₂ = dist v₂ v₃ := by rw [e12, e23]
  obtain ⟨γ₁, hγ1eq, hγ10, hγ11⟩ :=
    normSim_chainImage_capU2 v₁ v₂ v₃ w₁ hp12 h31 h23 hpos (by rw [hw1d, e12]) hw1chord
  obtain ⟨γ₂, hγ2eq, hγ20, hγ21⟩ :=
    normSim_chainImage_capU2 v₁ v₂ v₃ w₂ hp12 h31 h23 hpos (by rw [hw2d, e12]) hw2chord
  apply n8a3_normSimChain_capU2_oriented v₁ v₂ v₃ x hp12 h31 h23 hpos
    (by rw [dist_comm, hx1, e12]) hxchord (twoPointChain w₁ w₂ hne) ![γ₁, γ₂]
  · intro i; fin_cases i
    · exact ⟨hγ10.le, hγ11.le⟩
    · exact ⟨hγ20.le, hγ21.le⟩
  · intro i; fin_cases i
    · exact hγ1eq
    · exact hγ2eq
  · intro i j hij; fin_cases i <;> fin_cases j <;> simp_all [twoPointChain]

/-- **Two-point cap-`C₃` decreasing branch.**  As `n8a3_twoPoint_capU2pos`, on the
*negatively-oriented* natural triangle: the frame `(v₁, v₃, v₂)` is positively oriented, the
adjacent cap is the `capU3` side of that frame, and the chain winds negatively as seen from
`v₂`.  Both the apex and chain chord conditions are read off the swapped frame. -/
theorem n8a3_twoPoint_capU3neg {v₁ v₂ v₃ x w₁ w₂ : ℝ²} {d : ℝ} (hne : w₁ ≠ w₂)
    (hp13 : v₁ ≠ v₃)
    (e12 : dist v₁ v₂ = d) (e13 : dist v₁ v₃ = d) (e23 : dist v₂ v₃ = d)
    (hneg : signedArea2 v₁ v₂ v₃ < 0)
    (hx1 : dist v₁ x = d) (hxchord3 : signedArea2 x v₃ v₂ < 0)
    (hw1d : dist w₁ v₂ = d) (hw2d : dist w₂ v₂ = d)
    (hw1chord3 : signedArea2 w₁ v₁ v₃ < 0) (hw2chord3 : signedArea2 w₂ v₁ v₃ < 0)
    (horient01 : signedArea2 v₂ w₁ w₂ < 0) :
    N8a3AdjacentCapDistanceStrict x (twoPointChain w₁ w₂ hne) := by
  have hposF : 0 < signedArea2 v₁ v₃ v₂ := by rw [signedArea2_swap23 v₁ v₃ v₂]; linarith
  have h31 : dist v₁ v₃ = dist v₂ v₁ := by rw [e13, dist_comm, e12]
  have h23 : dist v₁ v₃ = dist v₃ v₂ := by rw [e13, dist_comm, e23]
  obtain ⟨δ₁, hδ1eq, hδ10, hδ11⟩ :=
    normSim_chainImage_capU3 v₁ v₃ v₂ w₁ hp13 h31 h23 hposF (by rw [hw1d, e13]) hw1chord3
  obtain ⟨δ₂, hδ2eq, hδ20, hδ21⟩ :=
    normSim_chainImage_capU3 v₁ v₃ v₂ w₂ hp13 h31 h23 hposF (by rw [hw2d, e13]) hw2chord3
  apply n8a3_normSimChain_capU3_oriented v₁ v₃ v₂ x hp13 h31 h23 hposF
    (by rw [dist_comm, hx1, e13]) hxchord3 (twoPointChain w₁ w₂ hne) ![δ₁, δ₂]
  · intro i; fin_cases i
    · exact ⟨hδ10.le, hδ11.le⟩
    · exact ⟨hδ20.le, hδ21.le⟩
  · intro i; fin_cases i
    · exact hδ1eq
    · exact hδ2eq
  · intro i j hij; fin_cases i <;> fin_cases j <;> simp_all [twoPointChain]

/-- **Adjacent-cap monotone two-point chain (orientation-free combiner).**  From the raw
equilateral / apex / two-cap-vertex geometry (with the three relevant non-degeneracies as
`signedArea2 ≠ 0` side conditions), produce a two-point ordered chain covering exactly the
pair `{w₁, w₂}` and carrying `N8a3AdjacentCapDistanceStrict x`.  Internally case-splits on
the apex-triangle orientation (`n8a3_twoPoint_capU2pos` / `n8a3_twoPoint_capU3neg`) and on
the chain-vertex order. -/
theorem exists_adjacentMonotoneChain {v₁ v₂ v₃ x w₁ w₂ : ℝ²} {d : ℝ}
    (hne : w₁ ≠ w₂) (hp12 : v₁ ≠ v₂) (hp13 : v₁ ≠ v₃)
    (e12 : dist v₁ v₂ = d) (e13 : dist v₁ v₃ = d) (e23 : dist v₂ v₃ = d)
    (htri_ne : signedArea2 v₁ v₂ v₃ ≠ 0)
    (hx1 : dist v₁ x = d) (harcx : OnArcOpposite v₁ v₂ v₃ x)
    (hxchord_ne : signedArea2 x v₂ v₃ ≠ 0)
    (hw1d : dist w₁ v₂ = d) (hw2d : dist w₂ v₂ = d)
    (harcw1 : OnArcOpposite v₂ v₃ v₁ w₁) (harcw2 : OnArcOpposite v₂ v₃ v₁ w₂)
    (hw1cn : signedArea2 w₁ v₃ v₁ ≠ 0) (hw2cn : signedArea2 w₂ v₃ v₁ ≠ 0)
    (horient_ne : signedArea2 v₂ w₁ w₂ ≠ 0) :
    ∃ (chain : FiniteEndpoint.OrderedSideChain 2),
      chain.support = ({w₁, w₂} : Finset ℝ²) ∧ N8a3AdjacentCapDistanceStrict x chain := by
  have hcyc : signedArea2 v₂ v₃ v₁ = signedArea2 v₁ v₂ v₃ := by simp only [signedArea2]; ring
  rcases lt_or_gt_of_ne htri_ne with hneg | hpos
  · -- negatively-oriented apex triangle
    have hxchord3 : signedArea2 x v₃ v₂ < 0 := by
      have hprod : signedArea2 x v₂ v₃ * signedArea2 v₁ v₂ v₃ ≤ 0 := harcx
      have hxpos : 0 < signedArea2 x v₂ v₃ := by
        rcases lt_or_gt_of_ne hxchord_ne with hc | hc
        · exfalso; nlinarith
        · exact hc
      rw [signedArea2_swap23 x v₃ v₂]; linarith
    have hw1c3 : signedArea2 w₁ v₁ v₃ < 0 := by
      have hprod : signedArea2 w₁ v₃ v₁ * signedArea2 v₂ v₃ v₁ ≤ 0 := harcw1
      rw [hcyc] at hprod
      have : 0 < signedArea2 w₁ v₃ v₁ := by
        rcases lt_or_gt_of_ne hw1cn with hc | hc
        · exfalso; nlinarith
        · exact hc
      rw [signedArea2_swap23 w₁ v₁ v₃]; linarith
    have hw2c3 : signedArea2 w₂ v₁ v₃ < 0 := by
      have hprod : signedArea2 w₂ v₃ v₁ * signedArea2 v₂ v₃ v₁ ≤ 0 := harcw2
      rw [hcyc] at hprod
      have : 0 < signedArea2 w₂ v₃ v₁ := by
        rcases lt_or_gt_of_ne hw2cn with hc | hc
        · exfalso; nlinarith
        · exact hc
      rw [signedArea2_swap23 w₂ v₁ v₃]; linarith
    rcases lt_or_gt_of_ne horient_ne with hwlt | hwgt
    · exact ⟨twoPointChain w₁ w₂ hne, twoPointChain_support w₁ w₂ hne,
        n8a3_twoPoint_capU3neg hne hp13 e12 e13 e23 hneg hx1 hxchord3 hw1d hw2d hw1c3 hw2c3 hwlt⟩
    · have hswap : signedArea2 v₂ w₂ w₁ < 0 := by
        rw [signedArea2_swap23 v₂ w₂ w₁]; linarith
      refine ⟨twoPointChain w₂ w₁ hne.symm, ?_, ?_⟩
      · rw [twoPointChain_support, Finset.pair_comm]
      · exact @n8a3_twoPoint_capU3neg v₁ v₂ v₃ x w₂ w₁ d hne.symm hp13 e12 e13 e23 hneg
          hx1 hxchord3 hw2d hw1d hw2c3 hw1c3 hswap
  · -- positively-oriented apex triangle
    have hxchord : signedArea2 x v₂ v₃ < 0 := by
      have hprod : signedArea2 x v₂ v₃ * signedArea2 v₁ v₂ v₃ ≤ 0 := harcx
      rcases lt_or_gt_of_ne hxchord_ne with hc | hc
      · exact hc
      · exfalso; nlinarith
    have hposcyc : 0 < signedArea2 v₂ v₃ v₁ := by rw [hcyc]; exact hpos
    have hw1c : signedArea2 w₁ v₃ v₁ < 0 := by
      have hprod : signedArea2 w₁ v₃ v₁ * signedArea2 v₂ v₃ v₁ ≤ 0 := harcw1
      rcases lt_or_gt_of_ne hw1cn with hc | hc
      · exact hc
      · exfalso; nlinarith
    have hw2c : signedArea2 w₂ v₃ v₁ < 0 := by
      have hprod : signedArea2 w₂ v₃ v₁ * signedArea2 v₂ v₃ v₁ ≤ 0 := harcw2
      rcases lt_or_gt_of_ne hw2cn with hc | hc
      · exact hc
      · exfalso; nlinarith
    rcases lt_or_gt_of_ne horient_ne with hwlt | hwgt
    · have hswap : 0 < signedArea2 v₂ w₂ w₁ := by
        rw [signedArea2_swap23 v₂ w₂ w₁]; linarith
      refine ⟨twoPointChain w₂ w₁ hne.symm, ?_, ?_⟩
      · rw [twoPointChain_support, Finset.pair_comm]
      · exact @n8a3_twoPoint_capU2pos v₁ v₂ v₃ x w₂ w₁ d hne.symm hp12 e12 e13 e23 hpos
          hx1 hxchord hw2d hw1d hw2c hw1c hswap
    · exact ⟨twoPointChain w₁ w₂ hne, twoPointChain_support w₁ w₂ hne,
        n8a3_twoPoint_capU2pos hne hp12 e12 e13 e23 hpos hx1 hxchord hw1d hw2d hw1c hw2c hwgt⟩

/-- **Adjacent-arc witness assembler.**  Package the monotone two-point chain from
`exists_adjacentMonotoneChain` with the adjacent Moser-vertex arc circle (centre `v₂`, radius
`d`) into a full `N8AdjacentArcWitness` over the apex `x` at the (arbitrary) selected radius
`r`, with arc support the given two-point cap `capPts = {w₁, w₂}`.  The two-circle
distinctness `circles_ne` reduces to the distinct centres `x ≠ v₂`. -/
theorem build_adjacentArcWitness {v₁ v₂ v₃ x w₁ w₂ : ℝ²} {d r : ℝ}
    (hne : w₁ ≠ w₂) (hp12 : v₁ ≠ v₂) (hp13 : v₁ ≠ v₃)
    (e12 : dist v₁ v₂ = d) (e13 : dist v₁ v₃ = d) (e23 : dist v₂ v₃ = d)
    (htri_ne : signedArea2 v₁ v₂ v₃ ≠ 0)
    (hx1 : dist v₁ x = d) (harcx : OnArcOpposite v₁ v₂ v₃ x)
    (hxv2 : x ≠ v₂)
    (hxchord_ne : signedArea2 x v₂ v₃ ≠ 0)
    (hw1d : dist w₁ v₂ = d) (hw2d : dist w₂ v₂ = d)
    (harcw1 : OnArcOpposite v₂ v₃ v₁ w₁) (harcw2 : OnArcOpposite v₂ v₃ v₁ w₂)
    (hw1cn : signedArea2 w₁ v₃ v₁ ≠ 0) (hw2cn : signedArea2 w₂ v₃ v₁ ≠ 0)
    (horient_ne : signedArea2 v₂ w₁ w₂ ≠ 0)
    (capPts : Finset ℝ²) (hcap : capPts = ({w₁, w₂} : Finset ℝ²))
    (hcapdist : ∀ z ∈ capPts, dist v₂ z = d) :
    ∃ W : N8AdjacentArcWitness,
      W.base.apex = x ∧ W.base.selectedRadius = r ∧ W.base.arc.support = capPts := by
  obtain ⟨chain, hchainsupp, hmono⟩ :=
    exists_adjacentMonotoneChain hne hp12 hp13 e12 e13 e23 htri_ne hx1 harcx hxchord_ne
      hw1d hw2d harcw1 harcw2 hw1cn hw2cn horient_ne
  let arc : N8ArcCircle :=
    { support := capPts, circleCenter := v₂, circleRadius := d, on_circle := hcapdist }
  have hcircles_ne : (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨arc.circleCenter, arc.circleRadius⟩ := by
    intro h; exact hxv2 (congrArg EuclideanGeometry.Sphere.center h)
  have hcovers : arc.support ⊆ chain.support := by
    change capPts ⊆ chain.support; rw [hchainsupp, hcap]
  exact ⟨{ base := { apex := x, selectedRadius := r, arc := arc, circles_ne := hcircles_ne }
           m := 2, chain := chain, chain_covers := hcovers, monotone := hmono }, rfl, rfl, rfl⟩

/-- **No equidistant apex at the side length** (plane circumradius obstruction).
No point `x` is equidistant — at the *side length* `D` — from all three vertices of an
equilateral triangle of side `D`.  (Geometrically: the circumradius of an equilateral
triangle is `D/√3 < D`.)  Formalised as a Gram-rank obstruction in the plane: the three
difference vectors `a-x, b-x, c-x` have squared norm `D²` and pairwise inner product `D²/2`,
making them linearly independent, which exceeds `finrank ℝ (EuclideanSpace ℝ (Fin 2)) = 2`.

This is the GATE-1 core for the W10 own-pair branch: if all three Moser vertices lay in the
selected class about an interior apex `x`, they would all be at distance `r` from `x`, while
the apex-opposite vertex is at distance `d` (the side length), forcing `r = d` and hence this
impossible all-vertices-at-side-length configuration. -/
theorem no_equidistant_apex_at_side
    (a b c x : ℝ²) (D : ℝ) (hD : 0 < D)
    (hab : dist a b = D) (hbc : dist b c = D) (hca : dist c a = D)
    (hxa : dist x a = D) (hxb : dist x b = D) (hxc : dist x c = D) : False := by
  set u := a - x with hu
  set v := b - x with hv
  set w := c - x with hw
  have nu : ‖u‖ = D := by rw [hu, ← dist_eq_norm, dist_comm]; exact hxa
  have nv : ‖v‖ = D := by rw [hv, ← dist_eq_norm, dist_comm]; exact hxb
  have nw : ‖w‖ = D := by rw [hw, ← dist_eq_norm, dist_comm]; exact hxc
  have iuv : ⟪u, v⟫ = D ^ 2 / 2 := by
    have h1 : ‖u - v‖ = D := by
      have huv : u - v = a - b := by rw [hu, hv]; abel
      rw [huv, ← dist_eq_norm]; exact hab
    have e := norm_sub_sq_real u v; rw [h1, nu, nv] at e; nlinarith [e]
  have ivw : ⟪v, w⟫ = D ^ 2 / 2 := by
    have h1 : ‖v - w‖ = D := by
      have hvw : v - w = b - c := by rw [hv, hw]; abel
      rw [hvw, ← dist_eq_norm]; exact hbc
    have e := norm_sub_sq_real v w; rw [h1, nv, nw] at e; nlinarith [e]
  have iuw : ⟪u, w⟫ = D ^ 2 / 2 := by
    have h1 : ‖u - w‖ = D := by
      have huw : u - w = a - c := by rw [hu, hw]; abel
      rw [huw, ← dist_eq_norm, dist_comm]; exact hca
    have e := norm_sub_sq_real u w; rw [h1, nu, nw] at e; nlinarith [e]
  have iuu : ⟪u, u⟫ = D ^ 2 := by rw [real_inner_self_eq_norm_sq, nu]
  have ivv : ⟪v, v⟫ = D ^ 2 := by rw [real_inner_self_eq_norm_sq, nv]
  have iww : ⟪w, w⟫ = D ^ 2 := by rw [real_inner_self_eq_norm_sq, nw]
  have hLI : LinearIndependent ℝ ![u, v, w] := by
    rw [Fintype.linearIndependent_iff]
    intro g hg
    have hsum : g 0 • u + g 1 • v + g 2 • w = 0 := by
      have hg' := hg; simp [Fin.sum_univ_three] at hg'
      convert hg' using 2
    have eu : g 0 * ⟪u, u⟫ + g 1 * ⟪u, v⟫ + g 2 * ⟪u, w⟫ = 0 := by
      have h := congrArg (fun z => ⟪u, z⟫) hsum
      simpa only [inner_add_right, inner_smul_right, inner_zero_right] using h
    have ev : g 0 * ⟪v, u⟫ + g 1 * ⟪v, v⟫ + g 2 * ⟪v, w⟫ = 0 := by
      have h := congrArg (fun z => ⟪v, z⟫) hsum
      simpa only [inner_add_right, inner_smul_right, inner_zero_right] using h
    have ew : g 0 * ⟪w, u⟫ + g 1 * ⟪w, v⟫ + g 2 * ⟪w, w⟫ = 0 := by
      have h := congrArg (fun z => ⟪w, z⟫) hsum
      simpa only [inner_add_right, inner_smul_right, inner_zero_right] using h
    rw [real_inner_comm u v, iuv, ivv, ivw] at ev
    rw [real_inner_comm u w, real_inner_comm v w, iuw, ivw, iww] at ew
    rw [iuu, iuv, iuw] at eu
    -- The Gram system is `g0·D² + (g1+g2)·D²/2 = 0` (and permutations); `D² > 0` forces
    -- `g0 = g1 = g2 = 0` by a purely linear elimination (avoiding `nlinarith` search).
    have hD2 : (0 : ℝ) < D ^ 2 := by positivity
    have hsum : (g 0 + g 1 + g 2) * (2 * D ^ 2) = 0 := by linear_combination eu + ev + ew
    have hs : g 0 + g 1 + g 2 = 0 := by
      rcases mul_eq_zero.mp hsum with h | h
      · exact h
      · exfalso; linarith
    have h0 : g 0 * D ^ 2 = 0 := by linear_combination 2 * eu - D ^ 2 * hs
    have h1 : g 1 * D ^ 2 = 0 := by linear_combination 2 * ev - D ^ 2 * hs
    have h2 : g 2 * D ^ 2 = 0 := by linear_combination 2 * ew - D ^ 2 * hs
    intro i; fin_cases i
    · exact (mul_eq_zero.mp h0).resolve_right (by linarith)
    · exact (mul_eq_zero.mp h1).resolve_right (by linarith)
    · exact (mul_eq_zero.mp h2).resolve_right (by linarith)
  have hcard := hLI.fintype_card_le_finrank
  simp [finrank_euclideanSpace] at hcard

/- ## Shell-internal frame producers (CLOSED — the former residual G3 / N7 geometry)

Everything above is axiom-clean and `sorry`-free.  For a *fully shell-internal* call
(apex `x ∈ S.capInteriorByIndex i`, no externally-supplied frame) the producers below
*construct* the `InteriorApexCapU{2,3}Frame` from the raw `FiniteEndpointShell` plus its
`N4eCapContainment` packet.  This was the single convergent G3 / N7 blocker; it is now
discharged via `exists_apexFrameData` (apex sub-bundle from N6/N7 + arc membership, with
the orientation case split) and the trivial `m = 0` empty chain (vacuous chain fields). -/

namespace FiniteEndpointShell

/-- **G3 / N7 apex sub-bundle producer.**  From `N4e` containment and an interior apex
`x ∈ S.capInteriorByIndex i`, produce the positively-oriented equilateral apex frame
`(v₁, v₂, v₃)` carrying the entire `normSim_centre_image` input bundle: the equilateral
identities (`h31`, `h23`), positive orientation (`hori`), the N7 Apollonius rigidity
`dist x v₁ = dist v₁ v₂` (`hx1`), and the strict cap-`C₁` chord side `signedArea2 x v₂ v₃ <
0` (`hxchord`).

The three indices route through `exists_apex_frame` on the cyclic rotation of the shell
triangle opposite cap `i`: `n7_circle_placement` supplies the common side `d`, the apex
radius, and the equilateral sides; `CapTriple.arc_membership` supplies the closed-arc
membership `OnArcOpposite`; and the cap-interior erases supply `x ≠ vⱼ`, `x ≠ vₖ`. -/
theorem exists_apexFrameData
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (hN4e : S.N4eCapContainment)
    (i : Fin 3) {x : ℝ²} (hx : x ∈ S.capInteriorByIndex i) :
    ∃ v₁ v₂ v₃ : ℝ²,
      v₁ ≠ v₂ ∧
      dist v₁ v₂ = dist v₃ v₁ ∧ dist v₁ v₂ = dist v₂ v₃ ∧
      0 < signedArea2 v₁ v₂ v₃ ∧
      dist x v₁ = dist v₁ v₂ ∧
      signedArea2 x v₂ v₃ < 0 := by
  classical
  obtain ⟨d, hdpos, hC1, hC2, hC3⟩ := S.n7_circle_placement hN4e
  have hp12 : S.triangle.v1 ≠ S.triangle.v2 := S.triangle.v12_ne
  have hp23 : S.triangle.v2 ≠ S.triangle.v3 := S.triangle.v23_ne
  have hp13 : S.triangle.v1 ≠ S.triangle.v3 := S.triangle.v13_ne
  have e12 : dist S.triangle.v1 S.triangle.v2 = d := hC1 _ S.CP.v2_mem_C1
  have e13 : dist S.triangle.v1 S.triangle.v3 = d := hC1 _ S.CP.v3_mem_C1
  have e23 : dist S.triangle.v2 S.triangle.v3 = d := hC2 _ S.CP.v3_mem_C2
  fin_cases i
  · -- cap C₁, opposite vertex v₁
    simp only [capInteriorByIndex] at hx
    unfold FiniteEndpointShell.I1 at hx
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv3, hxv2, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C1_subset hxC
    have harc : OnArcOpposite S.triangle.v1 S.triangle.v2 S.triangle.v3 x :=
      ((S.CP.arc_membership x hxA).1).mp hxC
    have hx1 : dist S.triangle.v1 x = d := hC1 _ hxC
    obtain ⟨a₂, a₃, hne, h31, h23', hori, hxd, hchord⟩ :=
      exists_apex_frame hdpos hp12 hp23 hp13 e12 e13 e23 hx1 harc hxv2 hxv3
    exact ⟨S.triangle.v1, a₂, a₃, hne, h31, h23', hori, hxd, hchord⟩
  · -- cap C₂, opposite vertex v₂; cyclic frame (v₂, v₃, v₁)
    simp only [capInteriorByIndex] at hx
    unfold FiniteEndpointShell.I2 at hx
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv1, hxv3, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C2_subset hxC
    have harc : OnArcOpposite S.triangle.v2 S.triangle.v3 S.triangle.v1 x :=
      ((S.CP.arc_membership x hxA).2.1).mp hxC
    have hx1 : dist S.triangle.v2 x = d := hC2 _ hxC
    obtain ⟨a₂, a₃, hne, h31, h23', hori, hxd, hchord⟩ :=
      exists_apex_frame hdpos hp23 hp13.symm hp12.symm e23
        (by rw [dist_comm]; exact e12) (by rw [dist_comm]; exact e13) hx1 harc hxv3 hxv1
    exact ⟨S.triangle.v2, a₂, a₃, hne, h31, h23', hori, hxd, hchord⟩
  · -- cap C₃, opposite vertex v₃; cyclic frame (v₃, v₁, v₂)
    simp only [capInteriorByIndex] at hx
    unfold FiniteEndpointShell.I3 at hx
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv2, hxv1, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C3_subset hxC
    have harc : OnArcOpposite S.triangle.v3 S.triangle.v1 S.triangle.v2 x :=
      ((S.CP.arc_membership x hxA).2.2).mp hxC
    have hx1 : dist S.triangle.v3 x = d := hC3 _ hxC
    obtain ⟨a₂, a₃, hne, h31, h23', hori, hxd, hchord⟩ :=
      exists_apex_frame hdpos hp13.symm hp12 hp23.symm
        (by rw [dist_comm]; exact e13) (by rw [dist_comm]; exact e23) e12 hx1 harc hxv1 hxv2
    exact ⟨S.triangle.v3, a₂, a₃, hne, h31, h23', hori, hxd, hchord⟩

/-- **Generic shell adjacent-arc-witness producer (cyclic-role form).**  Abstracting over the
cyclic Moser frame `(va, vb, vc)` (apex-cap-opposite, adjacent-cap-opposite, third vertex),
the apex `x` on the radius-`d` circle at `va` and on the arc opposite `va`, and the adjacent
cap interior `Iadj` (cardinality two, each vertex on the radius-`d` circle at `vb` and on the
arc opposite `vb`), build the full `N8AdjacentArcWitness` over `x` at the selected radius `r`
with arc support `Iadj`.  The three non-degeneracy side conditions every `signedArea2`
producer needs are discharged from `ConvexIndep A` (no three distinct points collinear).

This is the shell shape behind each of the six `fin_cases i × {left, right}` W10 branches;
the per-branch producers below just supply the cyclic rotation and unpack the cap membership
into `hunpack`. -/
theorem build_shell_adjacentArcWitness {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {va vb vc x : ℝ²} {d r : ℝ} (hdpos : 0 < d)
    (hab : va ≠ vb) (hac : va ≠ vc) (hbc : vb ≠ vc)
    (haA : va ∈ A) (hbA : vb ∈ A) (hcA : vc ∈ A)
    (eab : dist va vb = d) (eac : dist va vc = d) (ebc : dist vb vc = d)
    (hxA : x ∈ A) (hxb : x ≠ vb) (hxc : x ≠ vc)
    (harcx : OnArcOpposite va vb vc x) (hx1 : dist va x = d)
    (Iadj : Finset ℝ²) (hadjcard : Iadj.card = 2) (hadjsub : Iadj ⊆ A)
    (hunpack : ∀ w ∈ Iadj, w ≠ vc ∧ w ≠ va ∧ OnArcOpposite vb vc va w ∧ dist vb w = d) :
    ∃ W : N8AdjacentArcWitness,
      W.base.apex = x ∧ W.base.selectedRadius = r ∧ W.base.arc.support = Iadj := by
  classical
  have htri_ne : signedArea2 va vb vc ≠ 0 :=
    signedArea2_ne_zero_of_equilateral hdpos eab eac ebc hab hbc hac
  have hncoll : ∀ {a b c : ℝ²}, a ∈ A → b ∈ A → c ∈ A → a ≠ b → a ≠ c → b ≠ c →
      signedArea2 a b c ≠ 0 := by
    intro a b c ha hb hc hab' hac' hbc' hz
    exact ConvexIndep.not_three_collinear S.hconv ha hb hc hab' hac' hbc'
      (collinear_of_signedArea2_eq_zero a b c hz)
  have hxchord_ne : signedArea2 x vb vc ≠ 0 := hncoll hxA hbA hcA hxb hxc hbc
  obtain ⟨w₁, w₂, hw12ne, hIeq⟩ := Finset.card_eq_two.mp hadjcard
  have hw1mem : w₁ ∈ Iadj := by rw [hIeq]; simp
  have hw2mem : w₂ ∈ Iadj := by rw [hIeq]; simp
  obtain ⟨hw1c, hw1a, harcw1, hw1d⟩ := hunpack w₁ hw1mem
  obtain ⟨hw2c, hw2a, harcw2, hw2d⟩ := hunpack w₂ hw2mem
  have hw1A : w₁ ∈ A := hadjsub hw1mem
  have hw2A : w₂ ∈ A := hadjsub hw2mem
  have hw1cn : signedArea2 w₁ vc va ≠ 0 := hncoll hw1A hcA haA hw1c hw1a hac.symm
  have hw2cn : signedArea2 w₂ vc va ≠ 0 := hncoll hw2A hcA haA hw2c hw2a hac.symm
  have hv_b_w1 : vb ≠ w₁ := by intro h; rw [← h, dist_self] at hw1d; linarith
  have hv_b_w2 : vb ≠ w₂ := by intro h; rw [← h, dist_self] at hw2d; linarith
  have horient_ne : signedArea2 vb w₁ w₂ ≠ 0 := hncoll hbA hw1A hw2A hv_b_w1 hv_b_w2 hw12ne
  refine build_adjacentArcWitness (r := r) hw12ne hab hac eab eac ebc htri_ne hx1 harcx hxb
    hxchord_ne (by rw [dist_comm]; exact hw1d) (by rw [dist_comm]; exact hw2d)
    harcw1 harcw2 hw1cn hw2cn horient_ne Iadj hIeq ?_
  intro z hz
  exact (hunpack z hz).2.2.2

/-- **Shell producer (CLOSED) — interior-apex cap-`C₂` frame.**  From `N4e` containment and
an interior apex `x ∈ S.capInteriorByIndex i`, produce an `InteriorApexCapU2Frame`.  The
apex sub-bundle (the load-bearing G3 / N7 geometry) is supplied by `exists_apexFrameData`:

* the equilateral-frame transfer of the non-obtuse circumscribed Moser triangle
  (`h31`, `h23`, `hori`), from `n6_equilateral_moser_triangle` / `n7_circle_placement`;
* the N7 Apollonius distance rigidity of the interior apex (`hx1`) and its strict cap-`C₁`
  chord side (`hxchord`, from `CapTriple.arc_membership` + the equilateral non-degeneracy).

The chain data is the trivial `m = 0` empty chain, whose per-vertex fields (`γ`, `hγmem`,
`hL`, `horient`) are vacuous.  This was the load-bearing blocker pinned open at
`U2OneHitBound.lean:49–62` and `N8bEndpointPair.lean:182–194`; the monotonicity such a
frame feeds is closed by `n8a3_interiorApex_capU2`. -/
theorem exists_interiorApexCapU2Frame
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (hN4e : S.N4eCapContainment)
    (i : Fin 3) {x : ℝ²} (hx : x ∈ S.capInteriorByIndex i) :
    ∃ (v₁ v₂ v₃ : ℝ²) (m : ℕ) (L : FiniteEndpoint.OrderedSideChain m),
      Nonempty (InteriorApexCapU2Frame v₁ v₂ v₃ x L) := by
  obtain ⟨v₁, v₂, v₃, hne, h31, h23, hori, hx1, hxchord⟩ :=
    S.exists_apexFrameData hN4e i hx
  refine ⟨v₁, v₂, v₃, 0, FiniteEndpoint.emptyOrderedSideChain, ⟨?_⟩⟩
  -- The `m = 0` empty chain makes every per-vertex chain field vacuous.
  exact
    { hp := hne
      h31 := h31
      h23 := h23
      hori := hori
      hx1 := hx1
      hxchord := hxchord
      γ := fun i => Fin.elim0 i
      hγmem := fun i => Fin.elim0 i
      hL := fun i => Fin.elim0 i
      horient := fun i _ _ => Fin.elim0 i }

/-- **Shell producer (CLOSED) — interior-apex cap-`C₃` frame.**  As
`exists_interiorApexCapU2Frame`, building an `InteriorApexCapU3Frame` from the same apex
sub-bundle (`exists_apexFrameData`) and the trivial `m = 0` empty chain. -/
theorem exists_interiorApexCapU3Frame
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (hN4e : S.N4eCapContainment)
    (i : Fin 3) {x : ℝ²} (hx : x ∈ S.capInteriorByIndex i) :
    ∃ (v₁ v₂ v₃ : ℝ²) (m : ℕ) (L : FiniteEndpoint.OrderedSideChain m),
      Nonempty (InteriorApexCapU3Frame v₁ v₂ v₃ x L) := by
  obtain ⟨v₁, v₂, v₃, hne, h31, h23, hori, hx1, hxchord⟩ :=
    S.exists_apexFrameData hN4e i hx
  refine ⟨v₁, v₂, v₃, 0, FiniteEndpoint.emptyOrderedSideChain, ⟨?_⟩⟩
  -- The `m = 0` empty chain makes every per-vertex chain field vacuous.
  exact
    { hp := hne
      h31 := h31
      h23 := h23
      hori := hori
      hx1 := hx1
      hxchord := hxchord
      δ := fun i => Fin.elim0 i
      hδmem := fun i => Fin.elim0 i
      hL := fun i => Fin.elim0 i
      horient := fun i _ _ => Fin.elim0 i }

/- ## W10 adjacent-arc-witness producers (the adj-L / adj-R closure surface)

These are the shell-facing producers W10 (`N8kDistribution`) consumes directly: for an
interior apex `x ∈ S.capInteriorByIndex i` and any selected radius `r`, build the full
`N8AdjacentArcWitness` whose arc support is exactly the left- (resp. right-) adjacent cap
interior.  The two-point cap (`n4b_n5_exact_cap_vector_of_interior_lower_bounds`: every cap
interior has cardinality two) makes the trivial empty chain insufficient, so these route
through `build_shell_adjacentArcWitness` and the genuine two-point monotone chain. -/

/-- **W10 left-adjacent-arc witness producer.**  For an interior apex `x ∈
S.capInteriorByIndex i` and selected radius `r`, produce an `N8AdjacentArcWitness` over `x`
whose arc support is exactly `S.leftAdjacentInteriorByIndex i`, the adjacent Moser-vertex
arc circle, and whose strict radial monotonicity is the closed `n8a3` export.  The three
cap indices are the cyclic rotations `(v₁,v₂,v₃)`, `(v₂,v₃,v₁)`, `(v₃,v₁,v₂)`. -/
theorem exists_leftAdjacentArcWitness {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment) (i : Fin 3) {x : ℝ²} (hx : x ∈ S.capInteriorByIndex i)
    (r : ℝ) :
    ∃ W : N8AdjacentArcWitness,
      W.base.apex = x ∧ W.base.selectedRadius = r ∧
        W.base.arc.support = S.leftAdjacentInteriorByIndex i := by
  classical
  obtain ⟨d, hdpos, hC1, hC2, hC3⟩ := S.n7_circle_placement hN4e
  have hp12 : S.triangle.v1 ≠ S.triangle.v2 := S.triangle.v12_ne
  have hp23 : S.triangle.v2 ≠ S.triangle.v3 := S.triangle.v23_ne
  have hp13 : S.triangle.v1 ≠ S.triangle.v3 := S.triangle.v13_ne
  have e12 : dist S.triangle.v1 S.triangle.v2 = d := hC1 _ S.CP.v2_mem_C1
  have e13 : dist S.triangle.v1 S.triangle.v3 = d := hC1 _ S.CP.v3_mem_C1
  have e23 : dist S.triangle.v2 S.triangle.v3 = d := hC2 _ S.CP.v3_mem_C2
  have hcards := S.n4b_n5_exact_cap_vector_of_interior_lower_bounds
    S.I1_card_ge_two S.I2_card_ge_two S.I3_card_ge_two
  have hv1A := S.triangle.v1_mem
  have hv2A := S.triangle.v2_mem
  have hv3A := S.triangle.v3_mem
  fin_cases i
  · -- i=0: apex I1 (opp v1), left adj = I2 (opp v2), third v3
    simp only [capInteriorByIndex] at hx
    rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv3, hxv2, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C1_subset hxC
    have harcx : OnArcOpposite S.triangle.v1 S.triangle.v2 S.triangle.v3 x :=
      ((S.CP.arc_membership x hxA).1).mp hxC
    have hx1 : dist S.triangle.v1 x = d := hC1 _ hxC
    show ∃ W : N8AdjacentArcWitness, W.base.apex = x ∧ W.base.selectedRadius = r ∧
      W.base.arc.support = S.I2
    refine build_shell_adjacentArcWitness S (r := r) hdpos hp12 hp13 hp23 hv1A hv2A hv3A
      e12 e13 e23 hxA hxv2 hxv3 harcx hx1 S.I2 hcards.2.2.2.2.1 ?_ ?_
    · intro w hw; rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hw
      exact S.CP.C2_subset hw.2.2
    · intro w hw
      rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hw
      obtain ⟨hwv1, hwv3, hwC2⟩ := hw
      exact ⟨hwv3, hwv1, ((S.CP.arc_membership w (S.CP.C2_subset hwC2)).2.1).mp hwC2, hC2 _ hwC2⟩
  · -- i=1: apex I2 (opp v2), left adj = I3 (opp v3), third v1
    simp only [capInteriorByIndex] at hx
    rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv1, hxv3, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C2_subset hxC
    have harcx : OnArcOpposite S.triangle.v2 S.triangle.v3 S.triangle.v1 x :=
      ((S.CP.arc_membership x hxA).2.1).mp hxC
    have hx1 : dist S.triangle.v2 x = d := hC2 _ hxC
    show ∃ W : N8AdjacentArcWitness, W.base.apex = x ∧ W.base.selectedRadius = r ∧
      W.base.arc.support = S.I3
    refine build_shell_adjacentArcWitness S (r := r) hdpos hp23 hp12.symm hp13.symm hv2A hv3A hv1A
      e23 (by rw [dist_comm]; exact e12) (by rw [dist_comm]; exact e13)
      hxA hxv3 hxv1 harcx hx1 S.I3 hcards.2.2.2.2.2 ?_ ?_
    · intro w hw; rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hw
      exact S.CP.C3_subset hw.2.2
    · intro w hw
      rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hw
      obtain ⟨hwv2, hwv1, hwC3⟩ := hw
      exact ⟨hwv1, hwv2, ((S.CP.arc_membership w (S.CP.C3_subset hwC3)).2.2).mp hwC3, hC3 _ hwC3⟩
  · -- i=2: apex I3 (opp v3), left adj = I1 (opp v1), third v2
    simp only [capInteriorByIndex] at hx
    rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv2, hxv1, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C3_subset hxC
    have harcx : OnArcOpposite S.triangle.v3 S.triangle.v1 S.triangle.v2 x :=
      ((S.CP.arc_membership x hxA).2.2).mp hxC
    have hx1 : dist S.triangle.v3 x = d := hC3 _ hxC
    show ∃ W : N8AdjacentArcWitness, W.base.apex = x ∧ W.base.selectedRadius = r ∧
      W.base.arc.support = S.I1
    refine build_shell_adjacentArcWitness S (r := r) hdpos hp13.symm hp23.symm hp12 hv3A hv1A hv2A
      (by rw [dist_comm]; exact e13) (by rw [dist_comm]; exact e23) e12
      hxA hxv1 hxv2 harcx hx1 S.I1 hcards.2.2.2.1 ?_ ?_
    · intro w hw; rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hw
      exact S.CP.C1_subset hw.2.2
    · intro w hw
      rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hw
      obtain ⟨hwv3, hwv2, hwC1⟩ := hw
      exact ⟨hwv2, hwv3, ((S.CP.arc_membership w (S.CP.C1_subset hwC1)).1).mp hwC1, hC1 _ hwC1⟩

/-- **W10 right-adjacent-arc witness producer.**  As `exists_leftAdjacentArcWitness`, with the
right-adjacent cap interior `S.rightAdjacentInteriorByIndex i` as the arc support.  The
apex's own-cap arc membership is transported to the right-adjacent cyclic frame by
`onArcOpposite_swap` (the right-adjacent frame transposes the two chord vertices relative to
the canonical `arc_membership` form). -/
theorem exists_rightAdjacentArcWitness {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment) (i : Fin 3) {x : ℝ²} (hx : x ∈ S.capInteriorByIndex i)
    (r : ℝ) :
    ∃ W : N8AdjacentArcWitness,
      W.base.apex = x ∧ W.base.selectedRadius = r ∧
        W.base.arc.support = S.rightAdjacentInteriorByIndex i := by
  classical
  obtain ⟨d, hdpos, hC1, hC2, hC3⟩ := S.n7_circle_placement hN4e
  have hp12 : S.triangle.v1 ≠ S.triangle.v2 := S.triangle.v12_ne
  have hp23 : S.triangle.v2 ≠ S.triangle.v3 := S.triangle.v23_ne
  have hp13 : S.triangle.v1 ≠ S.triangle.v3 := S.triangle.v13_ne
  have e12 : dist S.triangle.v1 S.triangle.v2 = d := hC1 _ S.CP.v2_mem_C1
  have e13 : dist S.triangle.v1 S.triangle.v3 = d := hC1 _ S.CP.v3_mem_C1
  have e23 : dist S.triangle.v2 S.triangle.v3 = d := hC2 _ S.CP.v3_mem_C2
  have hcards := S.n4b_n5_exact_cap_vector_of_interior_lower_bounds
    S.I1_card_ge_two S.I2_card_ge_two S.I3_card_ge_two
  have hv1A := S.triangle.v1_mem
  have hv2A := S.triangle.v2_mem
  have hv3A := S.triangle.v3_mem
  fin_cases i
  · -- i=0: apex I1 (opp v1), right adj = I3 (opp v3), third v2.  va=v1, vb=v3, vc=v2
    simp only [capInteriorByIndex] at hx
    rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv3, hxv2, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C1_subset hxC
    have harcx : OnArcOpposite S.triangle.v1 S.triangle.v3 S.triangle.v2 x :=
      (onArcOpposite_swap _ _ _ _).mp (((S.CP.arc_membership x hxA).1).mp hxC)
    have hx1 : dist S.triangle.v1 x = d := hC1 _ hxC
    show ∃ W : N8AdjacentArcWitness, W.base.apex = x ∧ W.base.selectedRadius = r ∧
      W.base.arc.support = S.I3
    refine build_shell_adjacentArcWitness S (r := r) hdpos hp13 hp12 hp23.symm hv1A hv3A hv2A
      e13 e12 (by rw [dist_comm]; exact e23) hxA hxv3 hxv2 harcx hx1 S.I3 hcards.2.2.2.2.2 ?_ ?_
    · intro w hw; rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hw
      exact S.CP.C3_subset hw.2.2
    · intro w hw
      rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hw
      obtain ⟨hwv2, hwv1, hwC3⟩ := hw
      exact ⟨hwv2, hwv1,
        (onArcOpposite_swap _ _ _ _).mp
          (((S.CP.arc_membership w (S.CP.C3_subset hwC3)).2.2).mp hwC3),
        hC3 _ hwC3⟩
  · -- i=1: apex I2 (opp v2), right adj = I1 (opp v1), third v3.  va=v2, vb=v1, vc=v3
    simp only [capInteriorByIndex] at hx
    rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv1, hxv3, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C2_subset hxC
    have harcx : OnArcOpposite S.triangle.v2 S.triangle.v1 S.triangle.v3 x :=
      (onArcOpposite_swap _ _ _ _).mp (((S.CP.arc_membership x hxA).2.1).mp hxC)
    have hx1 : dist S.triangle.v2 x = d := hC2 _ hxC
    show ∃ W : N8AdjacentArcWitness, W.base.apex = x ∧ W.base.selectedRadius = r ∧
      W.base.arc.support = S.I1
    refine build_shell_adjacentArcWitness S (r := r) hdpos hp12.symm hp23 hp13 hv2A hv1A hv3A
      (by rw [dist_comm]; exact e12) e23 e13
      hxA hxv1 hxv3 harcx hx1 S.I1 hcards.2.2.2.1 ?_ ?_
    · intro w hw; rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hw
      exact S.CP.C1_subset hw.2.2
    · intro w hw
      rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hw
      obtain ⟨hwv3, hwv2, hwC1⟩ := hw
      exact ⟨hwv3, hwv2,
        (onArcOpposite_swap _ _ _ _).mp
          (((S.CP.arc_membership w (S.CP.C1_subset hwC1)).1).mp hwC1),
        hC1 _ hwC1⟩
  · -- i=2: apex I3 (opp v3), right adj = I2 (opp v2), third v1.  va=v3, vb=v2, vc=v1
    simp only [capInteriorByIndex] at hx
    rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hx
    obtain ⟨hxv2, hxv1, hxC⟩ := hx
    have hxA : x ∈ A := S.CP.C3_subset hxC
    have harcx : OnArcOpposite S.triangle.v3 S.triangle.v2 S.triangle.v1 x :=
      (onArcOpposite_swap _ _ _ _).mp (((S.CP.arc_membership x hxA).2.2).mp hxC)
    have hx1 : dist S.triangle.v3 x = d := hC3 _ hxC
    show ∃ W : N8AdjacentArcWitness, W.base.apex = x ∧ W.base.selectedRadius = r ∧
      W.base.arc.support = S.I2
    refine build_shell_adjacentArcWitness S (r := r) hdpos hp23.symm hp13.symm hp12.symm hv3A hv2A hv1A
      (by rw [dist_comm]; exact e23) (by rw [dist_comm]; exact e13) (by rw [dist_comm]; exact e12)
      hxA hxv2 hxv1 harcx hx1 S.I2 hcards.2.2.2.2.1 ?_ ?_
    · intro w hw; rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hw
      exact S.CP.C2_subset hw.2.2
    · intro w hw
      rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hw
      obtain ⟨hwv1, hwv3, hwC2⟩ := hw
      exact ⟨hwv1, hwv3,
        (onArcOpposite_swap _ _ _ _).mp
          (((S.CP.arc_membership w (S.CP.C2_subset hwC2)).2.1).mp hwC2),
        hC2 _ hwC2⟩

end FiniteEndpointShell

end Problem97
