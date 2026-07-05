import Erdos9796Proof.P97.TwoCircleCrossing

/-!
# Witness-packet interfaces for the two-circle leaves

This module formalizes the *input-side* interfaces that the two-circle crossing
reductions in `TwoCircleCrossing.lean` consume.  It introduces the **selected
class** vocabulary (`T_s` of the prose `docs/97-full-prose-proof-draft.md`) — the
`K4` equidistance class of a centre — and packages, over that vocabulary, the
two configurations the reductions reject:

* the **U2 base-chord witness packet** (`U2a2-1b4c2e2d3f0`/`d3f1a`) and its
  contradiction (`d3f1c`/`d3f1d`);
* the **U1 opposed-order blocker configuration** (`U1m-c1a1a`/`b`/`c1`) and its
  contradiction, built through `OpposedOrderCrossingLedger`.

What is **proved** here is the *contradiction-given-configuration* direction:
once the relevant points are exhibited as members of two distinct selected
classes sharing two endpoints plus a strict off-chord third point, the kernel
forecloses it.  This is exactly the bridge that was missing — it ties the
abstract `Sphere` circles of `TwoCircleCrossing.lean` to genuine `K4`
equidistance classes inside the point set `A`.

What is **not** proved here is the *production* direction — that the cap/witness
configuration actually yields a packet/config of the required shape:

* U2 (`d3f1b`, "strict interior witness count"): that the strict member of the
  selected class `T_s` also lies on the exact opposite-cap class.
* U1 (`U1m-c1a1c2` derivation): that the opposed endpoint-order row of the
  cross-cap blocker ping-pong produces the strict off-chord common point.  This
  needs the ordered-cap endpoint machinery (`EndpointUsed`, `RankInterval`, the
  source/target push toward opposite cap ends) from `U1k-b`/`U1m-b0`/`U1m-b1c`/
  `U1m-c1a0`, which is not yet formalized in Lean.

Those production steps remain prose-only obligations; this module does not state
their antecedents (doing so faithfully requires the unformalized machinery
above) and does not discharge them.  See `docs/97-uniform-theorem-closure-plan.md`.

All declarations are axiom-clean (`{propext, Classical.choice, Quot.sound}`).
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97

/-- The **selected class** centred at `s` with radius `d`: the points of `A` at
distance `d` from `s`.  When its cardinality is at least `4` it is a `K4`
equidistance witness at `s` (`HasNEquidistantPointsAt 4 A s` with this radius).
This is the "selected class centred at `s`" / `T_s` of the prose
`docs/97-full-prose-proof-draft.md`, and — at a blocker centre — the
"selected-class circle" the two-circle leaves intersect. -/
noncomputable def SelectedClass (A : Finset ℝ²) (s : ℝ²) (d : ℝ) : Finset ℝ² :=
  A.filter (fun q => dist s q = d)

@[simp] theorem mem_selectedClass {A : Finset ℝ²} {s : ℝ²} {d : ℝ} {q : ℝ²} :
    q ∈ SelectedClass A s d ↔ q ∈ A ∧ dist s q = d := by
  simp [SelectedClass]

/-- Extract the `SelectedClass` radius and cardinality bound from the upstream
equidistant-points-at predicate. -/
theorem exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
    {n : ℕ} {A : Finset ℝ²} {p : ℝ²}
    (h : HasNEquidistantPointsAt n A p) :
    ∃ r : ℝ, 0 < r ∧ n ≤ (SelectedClass A p r).card := by
  rcases h with ⟨r, hr, hcard⟩
  exact ⟨r, hr, by simpa [SelectedClass] using hcard⟩

/-- A `K4` set supplies a positive selected radius with at least four selected
classmates at every point of the set. -/
theorem exists_selectedClass_card_ge_four_of_hasNEquidistantProperty
    {A : Finset ℝ²} {p : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A) (hp : p ∈ A) :
    ∃ r : ℝ, 0 < r ∧ 4 ≤ (SelectedClass A p r).card :=
  exists_selectedClass_card_ge_of_hasNEquidistantPointsAt (hK4 p hp)

/-- A member of the selected class centred at `s` of radius `d` lies on the
sphere `⟨s, d⟩` — the bridge from the `K4` equidistance class to the `Sphere`
vocabulary the kernel consumes (point-first `dist` orientation). -/
theorem dist_self_of_mem_selectedClass {A : Finset ℝ²} {s q : ℝ²} {d : ℝ}
    (hq : q ∈ SelectedClass A s d) : dist q s = d :=
  (dist_comm q s).trans (mem_selectedClass.mp hq).2

/-- **Sphere distinctness from distinct centres** (gap `G1`).  Two spheres with
different centres are different spheres, irrespective of their radii.  This is the
reusable primitive that produces the witness packet's `circles_ne` field: the exact
cap class `⟨v₁, r₁⟩` and the selected class `⟨s, rₛ⟩` are distinct circles because the
Moser apex `v₁` and the strict cap-interior centre `s` are distinct points
(`v₁ ≠ s`). -/
theorem sphere_ne_of_center_ne {v s : ℝ²} (r₁ rₛ : ℝ) (h : v ≠ s) :
    (⟨v, r₁⟩ : Sphere ℝ²) ≠ ⟨s, rₛ⟩ :=
  fun he => h (congrArg Sphere.center he)

/- ### U2 base-chord witness interface (`U2a2-1b4c2e2d3f`) -/

/-- **U2 base-chord witness packet** — `U2a2-1b4c2e2d3f0`/`d3f1a`.  The
shared-base two-circle configuration on point set `A`: the exact `v₁`-centred
cap class (`SelectedClass A v₁ r₁`) and a selected `s`-class
(`SelectedClass A s rₛ`) are *distinct* circles; the two base endpoints `e₁`,
`e₂` (distinct, the shared chord) lie in *both* classes; and a strict
large-member witness `w` lies in both classes while sitting *off* the chord
(`signedArea2 e₁ e₂ w ≠ 0`). -/
structure U2BaseChordWitnessPacket (A : Finset ℝ²) where
  /-- Exact opposite-cap class centre. -/
  v₁ : ℝ²
  /-- Exact opposite-cap class radius. -/
  r₁ : ℝ
  /-- Selected-class centre. -/
  s : ℝ²
  /-- Selected-class radius. -/
  rₛ : ℝ
  /-- First shared base endpoint. -/
  e₁ : ℝ²
  /-- Second shared base endpoint. -/
  e₂ : ℝ²
  /-- Strict large-member witness. -/
  w : ℝ²
  /-- The exact cap class and the selected class are distinct circles. -/
  circles_ne : (⟨v₁, r₁⟩ : Sphere ℝ²) ≠ ⟨s, rₛ⟩
  /-- The two base endpoints are distinct. -/
  endpoints_ne : e₁ ≠ e₂
  /-- `e₁` lies on the exact cap class. -/
  e₁_exact : e₁ ∈ SelectedClass A v₁ r₁
  /-- `e₂` lies on the exact cap class. -/
  e₂_exact : e₂ ∈ SelectedClass A v₁ r₁
  /-- `e₁` lies on the selected class. -/
  e₁_sel : e₁ ∈ SelectedClass A s rₛ
  /-- `e₂` lies on the selected class. -/
  e₂_sel : e₂ ∈ SelectedClass A s rₛ
  /-- The witness lies on the exact cap class (`d3f1b` content, supplied here). -/
  w_exact : w ∈ SelectedClass A v₁ r₁
  /-- The witness lies on the selected class. -/
  w_sel : w ∈ SelectedClass A s rₛ
  /-- The witness lies strictly off the base chord. -/
  w_oriented : signedArea2 e₁ e₂ w ≠ 0

/-- **U2 base-chord contradiction** — `U2a2-1b4c2e2d3f1c`/`d3f1d`.  A base-chord
witness packet is impossible: its exact cap class and selected class are two
distinct circles sharing the base chord `e₁`–`e₂`, so they admit no third common
point off the chord, yet the packet records exactly such a witness `w`.
Specializes `u2_sharedBase_strictWitness_elim`. -/
theorem u2BaseChordWitnessPacket_contradiction {A : Finset ℝ²}
    (P : U2BaseChordWitnessPacket A) : False :=
  u2_sharedBase_strictWitness_elim P.circles_ne P.endpoints_ne
    (dist_self_of_mem_selectedClass P.e₁_exact)
    (dist_self_of_mem_selectedClass P.e₂_exact)
    (dist_self_of_mem_selectedClass P.e₁_sel)
    (dist_self_of_mem_selectedClass P.e₂_sel)
    (dist_self_of_mem_selectedClass P.w_exact)
    (dist_self_of_mem_selectedClass P.w_sel)
    P.w_oriented

/- ### U1 opposed-order blocker interface (`U1m-c1a1`) -/

/-- **U1 opposed-order blocker configuration** — `U1m-c1a1a`/`b`/`c1`.  Two
*distinct* selected (blocker) classes — the source class `T_cₛ` and the target
class `T_cₜ` — share two *distinct* endpoints `e₁`, `e₂`, and the opposed-order
push exhibits a third common point `w` strictly off the chord.  This is the
opposed-order crossing ledger expressed over genuine `K4` selected classes in
`A`. -/
structure U1OpposedOrderConfig (A : Finset ℝ²) where
  /-- Source blocker-class centre. -/
  cₛ : ℝ²
  /-- Source blocker-class radius. -/
  rₛ : ℝ
  /-- Target blocker-class centre. -/
  cₜ : ℝ²
  /-- Target blocker-class radius. -/
  rₜ : ℝ
  /-- First shared endpoint. -/
  e₁ : ℝ²
  /-- Second shared endpoint. -/
  e₂ : ℝ²
  /-- The opposed-order third common point. -/
  w : ℝ²
  /-- The source and target blocker classes are distinct circles. -/
  circles_ne : (⟨cₛ, rₛ⟩ : Sphere ℝ²) ≠ ⟨cₜ, rₜ⟩
  /-- The two shared endpoints are distinct. -/
  endpoints_ne : e₁ ≠ e₂
  /-- `e₁` lies on the source class. -/
  e₁_src : e₁ ∈ SelectedClass A cₛ rₛ
  /-- `e₂` lies on the source class. -/
  e₂_src : e₂ ∈ SelectedClass A cₛ rₛ
  /-- `e₁` lies on the target class. -/
  e₁_tgt : e₁ ∈ SelectedClass A cₜ rₜ
  /-- `e₂` lies on the target class. -/
  e₂_tgt : e₂ ∈ SelectedClass A cₜ rₜ
  /-- The third common point lies on the source class. -/
  w_src : w ∈ SelectedClass A cₛ rₛ
  /-- The third common point lies on the target class. -/
  w_tgt : w ∈ SelectedClass A cₜ rₜ
  /-- The third common point lies strictly off the chord (opposed-order push). -/
  w_oriented : signedArea2 e₁ e₂ w ≠ 0

/-- The opposed-order blocker configuration is a normalized opposed-order
crossing ledger (`U1m-c1a1c1`), with the `dist · = r` fields supplied by
`SelectedClass` membership. -/
def U1OpposedOrderConfig.toLedger {A : Finset ℝ²} (C : U1OpposedOrderConfig A) :
    OpposedOrderCrossingLedger where
  cₛ := C.cₛ
  rₛ := C.rₛ
  cₜ := C.cₜ
  rₜ := C.rₜ
  e₁ := C.e₁
  e₂ := C.e₂
  w := C.w
  circles_ne := C.circles_ne
  endpoints_ne := C.endpoints_ne
  e₁_src := dist_self_of_mem_selectedClass C.e₁_src
  e₂_src := dist_self_of_mem_selectedClass C.e₂_src
  e₁_tgt := dist_self_of_mem_selectedClass C.e₁_tgt
  e₂_tgt := dist_self_of_mem_selectedClass C.e₂_tgt
  w_src := dist_self_of_mem_selectedClass C.w_src
  w_tgt := dist_self_of_mem_selectedClass C.w_tgt
  w_oriented := C.w_oriented

/-- **U1 opposed-order contradiction** — `U1m-c1a1c2`/`c3` over selected
classes.  An opposed-order blocker configuration is impossible.  Routes through
`U1OpposedOrderConfig.toLedger` and `opposedOrderCrossingLedger_contradiction`. -/
theorem u1OpposedOrderConfig_contradiction {A : Finset ℝ²}
    (C : U1OpposedOrderConfig A) : False :=
  opposedOrderCrossingLedger_contradiction C.toLedger

end Problem97
