import Erdos9796Proof.P97.WitnessPacketInterface
import Erdos9796Proof.P97.N9Endpoint.N4a

/-!
# U2.B one-hit bound — interior-centre adjacent-cap selected-class count (`d4c1`)

This module lands the **consumer side** of the U2.B one-hit bound
(`docs/u-lane/97-u2b-realization-interface-plan.md`, interface-plan gap **G3**) over the
`SelectedClass` vocabulary, and **pins the one genuinely-open geometric export**
it consumes.

## The prose result (`d4c1` / N8a3 / E3-L13)

In the E2 residual packet (`U2a2-1a3d2c2d4c1`), the selected centre `c` is a
*strict interior* point of one exact short cap `C₃`, and the two caps `C₁`, `C₂`
adjacent to `C₃` are bounded by

```text
n₁ ≤ 1,   n₂ ≤ 1,
```

i.e. the selected class `T_c = SelectedClass A c d` meets the strict interior of
each adjacent cap in at most one vertex.  The pen-and-paper proof (PROVEN, prose
`S5-O2a2-1a3d2c2d4c1`) is the **E3-L13 monotonicity** used by the Section 3
one-hit lemma N8a3: a fixed-radius circle centred at the interior point `c` meets
the strict interior of each adjacent arc in at most one point, because the
distance from `c` to a point of the adjacent arc is strictly monotone in the
arc's angular coordinate (the `F₂'(γ) > 0`, `F₃'(δ) < 0` sign computation).

## What this module proves vs. leaves open

The **abstract reduction is free**: the existing finite-endpoint core
`FiniteEndpoint.OrderedSideChain.card_le_one_of_subset_sameRadius`
(`N9EndpointN4a.lean`) already turns *strict distance-monotonicity from any
centre along an ordered chain* into a `card ≤ 1` bound on any fixed-radius
subset.  This module instantiates that core over `SelectedClass` (so the caller
gets `hrad` discharged automatically from `mem_selectedClass`):

* `u2_selectedClass_one_hit_of_mono` — one adjacent cap;
* `u2_selectedClass_adjacentCaps_one_hit` — the `d4c1` two-bound shape
  (`n₁ ≤ 1 ∧ n₂ ≤ 1`), the joint consumer mirroring
  `FiniteEndpoint.n4a_weakTwoChainConcentration_of_E3L20`.

The **single genuinely-open geometric input** is pinned as the interface
`N8a3AdjacentCapDistanceStrict`: strict radial monotonicity from the
interior centre `c` along an adjacent-cap ordered chain.  This mirrors exactly
how `N9EndpointN4a.lean` pinned the *endpoint*-centre exports
`E3L20a/b_leftEndpoint_capDistance_strict` before their geometry was proved —
except here the centre is a strict cap-*interior* point and the chain is an
*adjacent* cap, so it is a genuinely distinct export (the proven
`E3L20a/b_of_cgnCapData` are endpoint-centred and do **not** discharge it).

Producing `N8a3AdjacentCapDistanceStrict` from the equilateral-packet geometry —
the E3-L13 coordinate model and the `F₂'`/`F₃'` monotonicity, or a cheaper
composition via the proven cap-region inscribed-angle/turn lemmas in
`CapArcInteriorPoints.lean` — is the load-bearing remaining geometry of G3 and is
not attempted here.

All declarations in this module are axiom-clean
(`{propext, Classical.choice, Quot.sound}`).
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97

/-- **Pinned interior-centre adjacent-cap monotonicity export** (`N8a3` / E3-L13).
Strict radial monotonicity from the selected interior centre `center` along an
adjacent-cap ordered chain `L`: as the chain index increases, the distance from
`center` to the chain vertex strictly increases.

This is the *only* genuinely-open geometric input to the U2.B one-hit bound.  Its
`Prop` shape coincides with the endpoint-centred exports
`FiniteEndpoint.E3L20a/b_leftEndpoint_capDistance_strict`, but its intended
*content* differs: `center` is a strict cap-**interior** point and `L` enumerates
an **adjacent** cap's interior, so it is the N8a3 export — distinct from the
proven endpoint exports `E3L20a/b_of_cgnCapData`. -/
abbrev N8a3AdjacentCapDistanceStrict
    (center : ℝ²) {m : ℕ} (L : FiniteEndpoint.OrderedSideChain m) : Prop :=
  ∀ {i j : Fin m}, i < j → dist center (L.points i) < dist center (L.points j)

/-- **U2.B one-hit consumer** (`d4c1`, single adjacent cap).  Given the
interior-centre monotonicity along an adjacent-cap chain `L` whose support
contains the relevant part of the cap, the selected class `SelectedClass A s d`
meets `Cint` in at most one point.

The radius hypothesis the finite-endpoint core needs (`dist s · = d`) is supplied
automatically here from `mem_selectedClass`, so a caller only owes the chain, the
monotonicity, and the containment `SelectedClass A s d ∩ Cint ⊆ L.support`. -/
theorem u2_selectedClass_one_hit_of_mono
    {A : Finset ℝ²} (s : ℝ²) (d : ℝ) {m : ℕ}
    (L : FiniteEndpoint.OrderedSideChain m)
    (hmono : N8a3AdjacentCapDistanceStrict s L)
    {Cint : Finset ℝ²}
    (hsub : (SelectedClass A s d ∩ Cint) ⊆ L.support) :
    (SelectedClass A s d ∩ Cint).card ≤ 1 :=
  FiniteEndpoint.OrderedSideChain.card_le_one_of_subset_sameRadius s L hmono d hsub
    (fun _ hx => (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hx)).2)

/-- **U2.B one-hit bound — the `d4c1` two-bound shape** (`n₁ ≤ 1 ∧ n₂ ≤ 1`).  In
the E2 residual packet the selected interior centre `s` is monotone along each of
the two caps `C₁`, `C₂` adjacent to its own cap; hence the selected class
`SelectedClass A s d` meets each adjacent cap interior in at most one point.

This is the joint consumer the U2a2 leaves call, mirroring
`FiniteEndpoint.n4a_weakTwoChainConcentration_of_E3L20` over the `SelectedClass`
vocabulary.  Both monotonicity inputs are instances of the open export
`N8a3AdjacentCapDistanceStrict`. -/
theorem u2_selectedClass_adjacentCaps_one_hit
    {A : Finset ℝ²} (s : ℝ²) (d : ℝ) {m₁ m₂ : ℕ}
    (L₁ : FiniteEndpoint.OrderedSideChain m₁) (L₂ : FiniteEndpoint.OrderedSideChain m₂)
    (hmono₁ : N8a3AdjacentCapDistanceStrict s L₁)
    (hmono₂ : N8a3AdjacentCapDistanceStrict s L₂)
    {C₁ C₂ : Finset ℝ²}
    (hsub₁ : (SelectedClass A s d ∩ C₁) ⊆ L₁.support)
    (hsub₂ : (SelectedClass A s d ∩ C₂) ⊆ L₂.support) :
    (SelectedClass A s d ∩ C₁).card ≤ 1 ∧ (SelectedClass A s d ∩ C₂).card ≤ 1 :=
  ⟨u2_selectedClass_one_hit_of_mono s d L₁ hmono₁ hsub₁,
   u2_selectedClass_one_hit_of_mono s d L₂ hmono₂ hsub₂⟩

end Problem97
