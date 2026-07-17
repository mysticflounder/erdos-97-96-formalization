# Problem 97 full prose proof — the RVOL route (2026-07-13)

Status: current full prose proof of the Problem 97 formalization target,
written against kernel ground truth of the working tree on `main` (spine
build `71f0def4c892`, refreshed 2026-07-17; counts cross-checked against the
generated `docs/live-blueprint.md` and the source).

**RVOL** = `RemovableVertexOfLarge`, the removable-vertex theorem for large
counterexamples (`lean/Erdos9796Proof/P97/RemovableVertexAxiom/Base.lean:54`).
It is the descent engine of the Problem 97 proof, and it is where every
remaining unproved obligation lives. This document gives the end-to-end
argument for the published theorem; each component carries its statement and
its status (proved or open), with kernel evidence for the proved ones.

**Overall status: OPEN.** The published claim reaches `sorryAx` through
exactly 12 named obligations (32 textual holes), all in
`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean`, all inside the branch of
RVOL in which no (m,4,4) cap decomposition exists (Part IV.c). Every other
layer is kernel-closed. The open content is exactly Part V.

Evidential basis for every "proved" below: the kernel-mined dependency spine
of the published theorem (51/2263 nodes open — every spine node not
descending from the 12 open obligations is sorry-free) plus the
`#print axioms` checks reproduced in the trust-boundary section.

---

## Preamble: the exact target

Formal Conjectures poses Erdős Problem 97 as:

> Does every convex polygon have a vertex with no other 4 vertices
> equidistant from it?

The upstream formal statement (pinned `formal-conjectures` revision;
`FormalConjectures/ErdosProblems/97.lean:72`):

```lean
theorem erdos_97 :
    answer(sorry) ↔ ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
      ¬HasNEquidistantProperty 4 A
```

The theorem this repository publishes is the right-hand side of that
equivalence, verbatim
(`lean/Erdos9796Proof/P97/UpstreamBridge.lean:30`):

```lean
theorem erdos97_rhs :
    ∀ A : Finset ℝ², A.Nonempty → EuclideanGeometry.ConvexIndep (A : Set ℝ²) →
      ¬ Erdos97.HasNEquidistantProperty 4 A
```

There is no interface gap between the two: the local statement is
definitionally equal to the upstream RHS — the bridge
`Problem97.upstream_iff` (`UpstreamBridge.lean:22`) is `Iff.rfl`, because
`Foundation.lean` defines every `Problem97.*` predicate as an abbreviation
over the upstream `Erdos97.*` definitions. So the proof is checked against
the upstream vocabulary, not a private restatement. The reduction from the
quoted polygon wording to the finite convex-independent-set statement is the
upstream formalization's own convention (a convex polygon identified with its
set of extreme vertices in strict convex position); this proof targets the
upstream formal statement exactly, neither strengthened nor weakened.

In prose, the target is:

> **Target.** For every nonempty finite set A of points in the Euclidean
> plane, if A is convex-independent (every point of A is an extreme point of
> its convex hull), then it is not the case that every point of A has four
> other points of A equidistant from it.

A nonempty convex-independent finite set in which every point does have four
other points at a common positive distance is called a **counterexample**
throughout; the proof shows no counterexample exists.

Scope notes.

- This document covers Problem 97 only. The repo's second published theorem,
  `Problem96.erdos96_rhs` (unit distances in convex position, explicit
  constant 3), consumes `Problem97.UniversalProblem97` through its peeling
  step (`P96/EuclideanPeeling.lean`), so the same 12 open obligations gate
  both targets. Problem 96's own layer is otherwise closed and is not
  treated here.
- Terminology: "Moser triangle" and "Moser cap" are project shorthand, not
  standard terms. Here a Moser triangle is the labelled three-vertex frame
  cutting the convex set into three closed opposite caps; the structural Lean
  object records only three distinct member vertices, and the circumscribed
  minimum-enclosing-circle refinement is a separate structure used where
  justified.

---

## Notation and standing vocabulary

Throughout, ℝ² means `EuclideanSpace ℝ (Fin 2)`, A is a `Finset ℝ²`, and
n = |A|. All point sets are finite; finiteness is load-bearing everywhere and
is carried by the `Finset` type.

**Convex independence** (upstream,
`FormalConjecturesForMathlib/Geometry/2d.lean:73`):

```lean
def ConvexIndep (S : Set ℝ²) : Prop :=
  ∀ a ∈ S, a ∉ convexHull ℝ (S \ {a})
```

i.e. S is in strict convex position: no point lies in the convex hull of the
others. (This is the formal-conjectures `Set`-level predicate, not mathlib's
indexed `ConvexIndependent`.)

**The per-vertex property** (upstream, `ErdosProblems/97.lean:34`):

```lean
def HasNEquidistantPointsAt (n : ℕ) (A : Finset ℝ²) (p : ℝ²) : Prop :=
  ∃ r : ℝ, r > 0 ∧ (A.filter fun q ↦ dist p q = r).card ≥ n

def HasNEquidistantProperty (n : ℕ) (A : Finset ℝ²) : Prop :=
  ∀ p ∈ A, HasNEquidistantPointsAt n A p
```

`HasNEquidistantProperty 4 A` says: every p ∈ A admits a radius r > 0 with at
least 4 points of A on the circle of radius r about p (r > 0 excludes p
itself). This is abbreviated **PerVertexK4**, or "K4", in prose. A **counterexample** is a nonempty convex-independent A with
PerVertexK4.

**Isosceles count** (`IsoscelesCount.lean:32`): for p ∈ A,
`IsoscelesPairsAt A p` is the set of unordered pairs {q, r} ⊆ A \ {p} with
|pq| = |pr|; `iCount A` — written I(A) — is the sum of these counts over all
apices p ∈ A. Equilateral triangles are counted three times, once per apex
(Dumitrescu's convention).

**Signed area and arcs** (`Foundation.lean:49`): `signedArea2 v vⱼ vₖ` is
twice the oriented area of the triangle (v, vⱼ, vₖ);
`OnArcOpposite vᵢ vⱼ vₖ v` says v and vᵢ lie on weakly opposite sides of the
chord vⱼvₖ — the algebraic encoding of "v lies on the closed arc from vⱼ to
vₖ not through vᵢ". No circular-order typeclass is used.

**Minimum enclosing circle** (`MEC/Basic.lean:66`): the MEC of a finite
nonempty A exists (compactness) and is unique (parallelogram-law midpoint
argument); provenance Sylvester 1857 / Welzl 1991. `MEC.mec A hne` extracts
it.

**Moser triangle and caps** (`Cap/Structure.lean:98,161`): a structural
`MoserTriangle A` is a labelled triple of pairwise-distinct vertices
v₁, v₂, v₃ ∈ A. A `CapTriple A M` decomposes A into three **closed caps**
C₁, C₂, C₃ ⊆ A, where Cᵢ is characterized by the arc-membership invariant
(v ∈ C₁ ↔ `OnArcOpposite v₁ v₂ v₃ v`, and cyclically). The closed-cap
convention:

- adjacent caps share their endpoint Moser vertices;
- each Moser vertex lies in exactly two caps;
- each non-Moser vertex lies in exactly one cap.

The **cap-sum identity** (`CapTriple.cap_sum_identity`) is

    |C₁| + |C₂| + |C₃| = n + 3.

A **surplus cap** is a cap with more than 4 points. The **(m,4,4) regime**
is the case where the two caps opposite the surplus cap have exactly 4
points each; formally `SurplusCapPacket.IsM44`
(`Cap/PartitionFromMEC.lean:443`): `S.oppCap1.card = 4 ∧ S.oppCap2.card = 4`.

**Removable vertex** (`SmallerCounterexample.lean:25`):

```lean
def IsRemovableVertex (A : Finset ℝ²) (x : ℝ²) : Prop :=
  x ∈ A ∧ HasNEquidistantProperty 4 (A.erase x)
```

Deleting a removable vertex from a counterexample yields a strictly smaller
counterexample, since convex independence is inherited by subsets.

---

## The spine: proof architecture

The proof is a single strong induction on n = |A|, assembled by the wrapper
`UniversalProblem97_of_reduction` (`UniversalProblem97.lean:60`) from two
engines and a base case, bundled as
(`UniversalProblem97.lean:37`):

```lean
structure UniversalReductionHypotheses : Prop where
  counting :
    ∀ A : Finset ℝ²,
      A.Nonempty → ConvexIndep A → HasNEquidistantProperty 4 A → 9 ≤ A.card
  descent :
    ∀ A : Finset ℝ²,
      A.Nonempty → ConvexIndep A → HasNEquidistantProperty 4 A → 9 < A.card →
      (∀ B : Finset ℝ², B.card < A.card →
        B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
        False
```

The trichotomy:

- n < 9 is impossible (counting engine, Part I);
- n = 9 is impossible (base case `FiniteN9Closure`, Part II);
- n > 9 contradicts minimality (descent engine, Parts III–IV).

The instantiation `UniversalProblem97` (`UniversalLocal.lean:36`) supplies
`counterexample_card_ge_nine` for `counting` and
`descent_contradicts_minimality` for `descent`; `erdos97_rhs` is that theorem
under the definitional bridge.

Kernel state (working tree, spine build `4305dbbef395`, 2026-07-14):

- the spine of `erdos97_rhs` has 2263 nodes over 2271 declarations
  (72,099 lines of Lean);
- 51 nodes are open, all descending from 12 sorry-carrying symbols in
  `U1LargeCapRouteBTail.lean`;
- 20 trusted certificate-shard leaves are excluded from mining but covered
  by `#print axioms` on the target.

Layer-by-layer kernel closures (checked 2026-07-13):

| Layer | Declaration | Axiom closure |
|---|---|---|
| Counting engine | `counterexample_card_ge_nine` | `propext, Classical.choice, Quot.sound` |
| Base case n = 9 | `FiniteN9Closure` | `propext, Classical.choice, Quot.sound` |
| RVOL (m,4,4) branch | `removableVertexOfLarge_of_isM44PinnedSurplus` | core + `Lean.ofReduceBool`, `Lean.trustCompiler` |
| RVOL remaining branch | `u1_largeCap_routeB_tail_false` | core + `sorryAx` |
| Published target | `erdos97_rhs` | core + `Lean.ofReduceBool`, `Lean.trustCompiler` + **`sorryAx`** |

---

## Part I — Counting engine: every counterexample has n ≥ 9

**Status: PROVED.** `Problem97.counterexample_card_ge_nine`
(`Counting.lean:95`), kernel closure core axioms only.

> **Theorem I.** If A is a counterexample, then |A| ≥ 9.

The argument is the exact K4-conditional counting incompatibility (the full
arbitrary-set isosceles upper bound is not proved and not needed). Provenance
for the route is Dumitrescu, *On Distinct Distances from a Vertex of a Convex
Polygon*, DCG 36 (2006), and Nivasch–Pach–Pinchasi–Zerbib, JoCG 4 (2013);
these are provenance only — every step below is proved internally in Lean.

**Lower bound.** Fix p ∈ A. PerVertexK4 gives r > 0 with at least four
points of A \ {p} on the circle of radius r about p. Every unordered pair of
those points is an isosceles pair at apex p, so p contributes at least
C(4,2) = 6 to I(A). Summing:

    I(A) ≥ 6n        (`six_mul_card_le_iCount_of_K4`, IsoscelesCount.lean:153)

Also n ≥ 5 (each vertex needs 4 others; `card_ge_five_of_K4`), and A is not
collinear (`not_collinear_of_K4`).

**Branch split (D1).** The MEC of A is supported either by a diameter pair
or by at least three boundary vertices whose triangle is non-obtuse and
contains the center; in the latter case every other vertex of A lies in one
of the three closed caps cut off by the triangle's sides, and — because the
center lies inside the non-obtuse support triangle — each cap arc is at most
a semicircle. This minor-arc property is stated here because it is the
standing hypothesis of the cap-witness lemma (D5).

**Diameter branch excluded (D2).** If the MEC were supported by a diameter
pair, K4 at a diameter endpoint places four same-radius points inside the
diameter disk, and the disk/order geometry forces one of them into the convex
hull of the others — contradicting convex independence. Hence a
counterexample's MEC has at least three boundary support points
(`boundary_card_ge_three_of_K4`).

**Cap decomposition (D3).** In the circumscribed branch, the three closed
caps satisfy |C₁| + |C₂| + |C₃| = n + 3, writing mᵢ = |Cᵢ|
(`Dumitrescu.three_cap_decomposition`, L4): each support vertex lies in
exactly two closed caps, every other vertex in exactly one.

**Base-apex bound (D4).** For every unordered pair {x, y} ⊆ A, at most two
points of A are equidistant from x and y: all such apices lie on the
perpendicular bisector of xy, and a line meets a strict-convex finite set in
at most two points (`Dumitrescu.perpBisector_apex_bound`, L1; corollary in
L3). Double-counting by base pair gives the global bound I(A) ≤ n(n−1) (L2)
— strict convexity is the load-bearing hypothesis here.

**Cap witness lemma (D5).** Let Q = {p₁, …, p_m} be a closed MEC cap in cap
order, with all of A \ Q on the opposite side of the cap chord. The cap-angle
characterization — for i < j < k the angle ∠pᵢpⱼpₖ is non-acute, proved by a
similarity normalization of the cap chord to (−1,0),(1,0) and a secant-slope
weighted-average argument (the CGN6 stack) — yields three facts:

1. distances from a fixed pⱼ to the vertices after it in cap order are
   pairwise distinct (and symmetrically before it);
2. an edge {x, y} of Q that is the base of two isosceles triangles in A has a
   unique **cap-side witness** — an apex in Q itself (two apices on the far
   side of the chord would violate strict convexity via the
   bisector-ray/triangle argument, and all far-side points are outside Q by
   hypothesis);
3. a witness pⱼ for an edge has one endpoint before and one after pⱼ in cap
   order.

**Good-edge count (D6).** By D5(1) the edges witnessed by a fixed pⱼ form a
partial matching between the j−1 earlier and m−j later vertices, so pⱼ
witnesses at most min(j−1, m−j) edges; summing gives at most (m−1)²/4
witnessed edges per cap. All remaining intra-cap edges are the base of at
most one isosceles triangle in A (CGN7c).

**Savings (D7–D8).** Reindexing I(A) by base pairs
(`Dumitrescu.iCount_eq_sum_capPairApexes`, L10) and subtracting one from the
two-apex bound for every unwitnessed intra-cap edge — the three intra-cap
pair families are disjoint since two closed caps share only a single support
vertex — gives

    I(A) ≤ 2·C(n,2) − Σᵢ (mᵢ² − 1)/4.

**Cauchy–Schwarz finalization (D9).** From m₁ + m₂ + m₃ = n + 3 and the
power-mean inequality (L9, L10c): Σᵢ(mᵢ² − 1)/4 ≥ (n² + 6n)/12, hence

    I(A) ≤ (11n² − 18n)/12        (`CGN8_circumscribed_iCount_upper_bound`).

**Arithmetic.** 6n ≤ (11n² − 18n)/12 with n > 0 gives 72 ≤ 11n − 18, so
n ≥ 90/11, and integrality forces n ≥ 9 (`Counting.lean` +
`CountingArithmetic.lean`).

The Lean decomposition is the `Dumitrescu/` chain (L1–Lc3) plus the `CGN/`
cap-witness counting bridge topped by CGN8.

---

## Part II — Base case: no counterexample has n = 9

**Status: PROVED.** `Problem97.FiniteN9Closure`
(`N9Endpoint/Closure.lean:56`), kernel closure core axioms only — no
`sorryAx`, no compiler axioms.

> **Theorem II.** No 9-point convex-independent set has PerVertexK4.

The proof threads a fixed nine-point shell through form exclusions and a
single-apex exhaustion. The shell `FiniteEndpointShell`
(`N9Endpoint/Shell.lean:39`) packages what Part I's machinery already yields
for a hypothetical 9-point counterexample:

- non-collinearity;
- at least 3 MEC boundary points (diameter branch excluded by K4 as in D2);
- a non-obtuse circumscribed Moser triangle and its cap triple;
- the exact cap sum |C₁| + |C₂| + |C₃| = 12.

With each cap containing its two endpoint Moser vertices, the counting is
tight and the configuration is rigidly constrained.

The route (module docstring, `N9Endpoint/Closure.lean`):

1. **N4c — classification.** Any "escaped" 4-class at a Moser apex v₁ (a
   witness class not contained in the opposite cap C₁) meets the two side
   caps in one of three exact patterns (`N9Endpoint/N4e.lean:413`):
   - **Form a**: one interior point from each side chain
     (class ∩ C₂ = {x}, class ∩ C₃ = {y}, x, y interior);
   - **Form b**: the Moser vertex v₂ plus one interior point of the C₂ side;
   - **Form c**: the mirror of b through C₂ ↔ C₃, v₂ ↔ v₃.
2. **N4d — exclusion.** Each form is impossible at v₁:
   `N4dExcludesFormA_v1_proof` (interior–interior branch by a radical-axis
   reflection argument; endpoint-column branches through the endpoint-pair
   sieve), `…FormB…`, `…FormC…` (mirror of b under the side-chain swap). The
   v₂/v₃ versions are produced by pure cyclic relabelling
   (`N4d/CyclicTransport.lean`), so the three v₁ exclusions are the only
   geometric producers.
3. **N4e — cap containment.** With every escape form excluded at every apex,
   each Moser-apex 4-class is contained in its opposite cap.
4. **N6/N7 — rigid packet.** Cap containment at the tight (4,4,4) cap count
   forces the equilateral / Apollonius-rigid common-radius packet
   (`N9Endpoint/N67.lean`): the three apex classes share the rigid radius
   structure `d`.
5. **N8 — single-apex exhaustion.** For any non-Moser apex x in cap i with a
   selected 4-class, classify the class's distribution (m, s, l, r) among
   Moser vertices / same-cap / left / right groups; the additive budget
   4 ≤ m + s + l + r routes every case to a proved primitive — adjacent
   one-hit (W7), endpoint-pair split (W8), or the same-cap endpoint/Moser and
   cap-center full-width kills (W9) — each ending in `False`
   (`N8k_single_apex_false`, `N8/N8kDistribution.lean:1110`).

Since some vertex of a 9-point counterexample must be a non-Moser apex with a
selected class, every branch terminates in a contradiction, closing n = 9.

---

## Part III — Cap-sum bridge: n > 9 forces a surplus cap

**Status: PROVED.** From the cap-sum identity: if n > 9 then
|C₁| + |C₂| + |C₃| = n + 3 > 12, so some cap has more than 4 points
(`exists_surplus_cap_of_card_gt_nine`, pigeonhole). This bridge is
elementary and independent of everything in Part IV; it only produces the
surplus cap, it does not explain removability.

---

## Part IV — Descent: the RVOL theorem

The descent engine (`Descent.lean:27`, `descent_contradicts_minimality`) is:
given a counterexample A with n > 9 that is **minimal** (the strong-induction
hypothesis says no strictly smaller counterexample exists), derive `False`.
It composes two pieces:

- **RVOL** (`RemovableVertexOfLarge`, statement at
  `RemovableVertexAxiom/Base.lean:54`):

  > **Theorem IV (RVOL).** Every counterexample A with |A| > 9 that is
  > minimal under the strong-induction hypothesis contains a removable
  > vertex x — that is, x ∈ A with `A.erase x` still PerVertexK4.

- **Glue** (`smaller_counterexample_of_removable`,
  `SmallerCounterexample.lean:30`) — PROVED: erasing a removable vertex
  yields a strictly smaller counterexample (convex independence passes to
  subsets), contradicting minimality.

RVOL is assembled by a three-way split
(`RemovableVertexOfLarge_from_threeWaySplit`, applied at
`RemovableVertexAxiom/Continuation.lean:798`):

### IV.a Surplus-cap packet extraction — PROVED

> **Statement.** Every minimal counterexample with |A| > 9 carries a
> surplus-cap packet: the surplus cap from Part III together with its two
> opposite caps and the selected-apex data.

`largeK4SurplusCapPacket`; closed on the kernel spine.

### IV.b The (m,4,4) branch — PROVED

> **Statement.** If the two caps opposite the surplus cap have exactly 4
> points each, then A contains a removable vertex.

`removableVertexOfLarge_of_isM44PinnedSurplus`
(`RemovableVertexAxiom/Continuation.lean:723`). Kernel closure: core axioms
plus `Lean.ofReduceBool` and `Lean.trustCompiler`, no `sorryAx` (checked
2026-07-13); the compiler axioms enter only through the finite enumeration
and certificate evaluations described below.

Write m = |surplus cap| (closed-cap convention, Moser endpoints included).
The cap-sum identity specializes under (m,4,4) to m + 5 = n
(`IsM44.surplus_card_eq`, `Cap/PartitionFromMEC.lean:448`), and m ≥ 5
because the cap is surplus. So the branch hypothesis a priori covers every
n > 9. It closes by a trichotomy on m:

- **m ≥ 7 (n ≥ 12)** is impossible outright — one counting theorem kills
  the entire regime (the card-≥12 part below);
- **m = 5 (n = 10)** is label-complete and closes by fixed finite seed
  banks (the card-10 arm);
- **m = 6 (n = 11)** closes by the card-11 classifier chains (the card-11
  arm).

**Branch shape.** The assembly
(`removableVertexOfLarge_of_isM44PinnedSurplus_from_residualSplit`,
`Continuation.lean:708`) composes three residual exclusions, each of which
is itself discharged through the trichotomy:

1. **Endpoint escapes excluded** (`isM44EndpointResidualsExcluded`,
   `RemovableVertexAxiom/Base.lean:9526`): no selected 4-class at a Moser
   apex opposite a non-surplus cap escapes into an adjacent cap through the
   shared-endpoint configuration (`EndpointEscapeLeftAt`/`…RightAt`,
   `SurplusM44Packet.lean:2800`).
2. **Pinned surplus residuals excluded**
   (`isM44PinnedSurplusResidualsExcluded`,
   `RemovableVertexAxiom/PinnedSurplusBank.lean:26`): no such class is
   pinned to the two interior points of its own 4-cap plus one shared Moser
   endpoint plus one surplus escapee
   (`PinnedRightSurplusResidualAt`/`…Left…`, `SurplusM44Packet.lean:4499`).
3. **Containment → removable vertex**
   (`isM44NonSurplusContainmentRemovable`, `Continuation.lean:698`).
   Exclusions 1 and 2 force N4e-style containment at both non-surplus Moser
   apices (`NonSurplusMoserCapContainment`): every ≥4 selected class there
   lies inside its opposite cap. From containment, a vertex x in the
   surplus-cap interior is removable. The only obstruction to removability
   is the **erased-pin triple** (`ErasedPinTriple A x p`,
   `WitnessPacketInterface.lean:198`): a center p all of whose 4-point
   witness classes pass through x, so that exactly three co-radial points
   survive x's deletion. These are excluded for every possible location of
   p in the cap frame — the Moser apex opposite the surplus cap (the P4-U
   family), the surplus-cap interior (P4-S), and the two non-surplus cap
   interiors (the P2 count rows, classified by their exact
   Moser/same-cap/left/right occupancy counts,
   `RemovableVertexAxiom/ErasedPinRowResiduals.lean`) — while the two
   Moser endpoints of the surplus cap carry direct containment-derived
   erase witnesses.

**The card-≥12 part: no (m,4,4) counterexample has n ≥ 12.**
`SurplusCapPacket.surplus_card_le_six_of_convexIndep_K4`
(`CapSelectedRowCounting.lean:765`) proves m ≤ 6 — equivalently n ≤ 11 —
from convex independence and K4 alone, by a pair-incidence double count on
the ordered surplus cap:

- The complement B = A ∖ (surplus cap) has exactly n − m = 5 points: the
  Moser apex opposite the surplus cap and the two interior points of each
  opposite 4-cap.
- K4 fixes one selected 4-class per point of A (a faithful carrier
  pattern, `exists_faithfulCarrierPattern_of_globalK4`); order the surplus
  cap along its arc, which is minor because the MEC support triangle is
  non-obtuse (Part I, D1).
- By the CGN6 one-sided distance injectivity transported to the cap
  (`oneSidedDistanceInjective_of_mecCapPacket`,
  `CapSelectedRowCounting.lean:29`), distances from a cap point to the cap
  points after it in cap order are pairwise distinct, and likewise before
  it. A 4-class centered at a cap point is co-radial, so it contains at
  most one cap point on each side of its center: at least 2 of its 4
  points land in B. At the two extreme points of the cap order one side is
  empty, so their classes meet the cap in at most one point and place at
  least 3 points in B.
- Each cap center therefore marks at least C(2,2) = 1 unordered pair of
  B-points on its circle, and each of the two extreme centers at least
  C(3,2) = 3.
- Marked pairs are private to their center
  (`outsidePair_unique_capCenter`, `CapSelectedRowCounting.lean:283`): if
  two distinct cap centers were both equidistant from the same pair
  {a, b} ⊆ B, both centers would lie on the perpendicular bisector of ab,
  so the cap subchord through them **is** that bisector and a, b are
  mirror images across it — strictly on opposite sides. But every point of
  A off the cap lies strictly on the outer side of every cap subchord: the
  strict cap order places any A-point strictly on the inner side between
  the two chord endpoints in cap order
  (`StrictCapOrder.subchord_open_side_iff_A`), and a point on the chord
  line would give three collinear points of a strictly convex set.
- Summing the disjoint pair families
  (`orderedCap_card_add_four_le_choose_outside`,
  `CapSelectedRowCounting.lean:579`): m + 4 ≤ C(5,2) = 10, so m ≤ 6.

Consequently the non-label-complete regime is forced to the single value
m = 6, i.e. n = 11 exactly (`card_eq_eleven_of_surplus_card_gt_five`,
`CapSelectedRowCounting.lean:813`). This is the entire card-≥12 part:
there is nothing to classify at n ≥ 12 because no (m,4,4) decomposition
survives the count there.

**The card-10 arm (m = 5, n = 10).** The frame is label-complete: the ten
roles — three Moser vertices, three surplus-interior points, and two
interior points in each opposite cap — name every point of A. Each residual
family then reduces to finitely many labelled row shapes with exact bucket
counts, refuted by generated fixed banks: the ten-label endpoint producers
(both ambient CCW orientations,
`EndpointCertificate/GeometryProducer.lean`), the row-zero bank for the
pinned residuals (`SurplusCertificate/RowZeros/Bank.lean`, consumed through
the COMP-G metric-shadow bridge), and the 330-seed fixed-seed DFS bank for
the erased-pin rows (`ErasedPinFixedSeedDFS.lean`, P2 rows;
`ErasedCertificate/CardTenProducer.lean`, P4 direct triples). Bank
membership and DFS checks are compiler-evaluated; the metric leaves are
refuted by exact polynomial infeasibility certificates.

**The card-11 arm (m = 6, n = 11).** With n = 11 forced, the configuration
is compressed to a finite object and classified:

- **Canonical labeling.** Every (6,4,4) configuration carries a bijection
  A ↔ Fin 11 with fixed roles
  (`exists_canonicalLabeling_of_isM44_surplus_card_eq_six`,
  `Census554/CapSelectedGeometry.lean:685`): label 0 is the Moser apex
  opposite the surplus cap, labels 1, 2 its two Moser endpoints, 3–6 the
  surplus-cap interior, 7–8 and 9–10 the opposite-cap interiors, with the
  CCW hull order fixed.
- **Pattern code.** The faithful carrier pattern transports to an 11 × 11
  Boolean incidence matrix — for each label, the label set of its selected
  4-class (`patternCode`, `Census554/CapSelectedCarrierBridge.lean:33`).
  The soundness bridge proves the real configuration's code satisfies
  `IncidenceOK` (`Census554/CapSelectedFiniteCode.lean:209`): center-free
  four-point rows; at most two cap hits per non-Moser center and the
  one-hit constraints at the Moser centers (the CGN6 counting above);
  pairwise row intersections of size at most two and every pair selected
  at no more than two centers (the D4 bisector bound); and the cyclic
  hull-alternation constraints from convex position. Each residual family
  adds its own finite shell predicate recording the hypothesis under
  refutation (`PinnedShellOK`, `EndpointLeftShellOK`/`…Right…`,
  `ErasedRowShellOK`).
- **Finite refutation.** A native classifier
  (`Census554/CapSelectedNativeClassifier.lean` and its endpoint/erased
  forks) runs a DFS over the candidate rows of the ten non-seed centers,
  maintaining a bounded union-find equality closure over the 121 oriented
  edge codes, and drives every completion of every admissible seed
  placement into one of **twelve finite obstruction families**
  (`ClosureCoreAlternative`, `Census554/CapSelectedFiniteCode.lean:472`):
  duplicate-center, exact-row off-circle, equal-K4, convex
  perpendicular-bisector, order-sensitive five-point and convex-rhombus
  cores, and six collision cores (equilateral-bisector, three-triad,
  seven-role surplus-source, six-row anchor, seven-point orbit,
  seven-point circle network). Each family has a separately proved
  geometric refutation under the canonical labeling, so the classifier
  verdict closes the configuration in `False`
  (the twelve-branch consumers, e.g.
  `false_of_closureCoreAlternative_of_canonical`,
  `EndpointCertificate/BridgeAssembly.lean`).
- **Per-family closures.** The pinned residuals close through twelve
  native placement theorems, one per ordered choice of pinned and deleted
  surplus-interior labels (`placementCheck_of_interior`,
  `Census554/CapSelectedNativeClosureSound.lean:836`, consumed by
  `isM44PinnedSurplusGeneralMResidualsExcluded`,
  `RemovableVertexAxiom/PinnedSurplusGeneralM.lean:706`). The endpoint
  escapes close through the endpoint native classifier
  (`false_of_endpointEscapeLeft_cardEleven`/`…Right…`,
  `EndpointCertificate/BridgeAssembly.lean:376`). The erased-pin families
  close through the ERASE fleets: one native theorem over all 47
  admissible seed supports for P4-U
  (`ErasedCertificate/P4UClosure.lean:60`), and 128 independently compiled
  native leaves each for P4-S (`ErasedCertificate/P4SClosure.lean:57`) and
  the P2 rows.

The native evaluations in both finite arms are the sole source of the two
compiler axioms, and they satisfy the `bv_decide`-standard policy: the
evaluated closure is ordinary verified Lean — no `unsafe`, no
`@[implemented_by]`, no `@[extern]`.

### IV.c The remaining branch (no (m,4,4) decomposition) — blocked on Part V

> **Statement.** If no surplus-cap decomposition puts exactly 4 points in
> both opposite caps, then A contains a removable vertex.

`removableVertexOfLarge_of_nonIsM44`
(`RemovableVertexAxiom/Continuation.lean:743`). The proof descends through
the route-B tail (the `U1*` and `RVOL` prefixes in declaration names are
historical labels of this workstream). The wiring is complete Lean code:

1. build a `CounterexampleData` D on the carrier A;
2. minimality yields both "no removable vertex" (`hnoRem` — else Theorem IV
   closes immediately) and a critical shell system (`hcritical`);
3. take the circumscribed cap triple and split by
   `exactPair_or_nonExactSurplusBranch_of_card_gt_nine`;
4. the exact-pair branch produces an (m,4,4) packet, contradicting the
   branch hypothesis;
5. the remaining branch — a surplus cap whose opposite pair is **not**
   exact — is closed by `u1_largeCap_routeB_tail_false`
   (`U1LargeCapRouteBTail.lean:9212`).

**The route-B tail.** Terminology, as carried by the declaration names:

- "Route B" is the branch in which the surplus cap's opposite pair is not
  exact (the hypothesis `hnotOppExact`);
- the "tail" is the residual case analysis remaining after the exact-pair
  branch is discharged.

`u1_largeCap_routeB_tail_false` reduces (complete Lean, no own holes) to the
structural bridge `u1_largeCap_routeB_tail_liveData_false`
(`U1LargeCapRouteBTail.lean:7776`), whose inputs are the **live data** of the
configuration (`U1LargeCapRouteBTailLiveData`, `:256`):

```lean
structure U1LargeCapRouteBTailLiveData
    (D : CounterexampleData) (p q t1 t2 t3 u : ℝ²) : Prop where
  dangerous : U5DangerousTriple D q p ({t1, t2, t3} : Finset ℝ²)
  exactQDeletedRadius :
    (((D.skeleton q).erase p).filter fun y => dist p y = dist p q).card = 3
  selected : U5SelectedCandidateSkeleton D q p ({t1, t2, t3} : Finset ℝ²) u
```

Semantics:

- q is the candidate vertex in the surplus cap whose deletion is being
  tested;
- p is the localized replacement center;
- {t₁, t₂, t₃} is the dangerous triple on the p-circle through q, which
  carries exactly three co-radial skeleton points after q's deletion;
- u is the selected candidate off that circle.

Alongside the live data, the bridge receives the five **critical source
rows** (`U1Depth5.CriticalSourceRows D q t₁ t₂ t₃ u`) — for each source point
among {q, t₁, t₂, t₃, u}, a critical row: a center with an exact selected
4-class — plus the depth-5 row packet `f2CriticalRow` centred on the
t₂-row's slot-0 point (written t₂₀ below).

The bridge's proof is a complete finite case analysis on where
`f2CriticalRow`'s center and labels can sit; its leaves are the open
obligations of Part V.

---

## Part V — The open obligations

**Status: OPEN.** All remaining `sorry`s: 12 symbols / 32 textual holes in
`U1LargeCapRouteBTail.lean`. (The twelve LIVE-T1 helpers, formerly 24
further holes, are now source-sorry-free: they are production-wired through
the orbit adapter below and remain open only transitively, through V.2.)

**Closure strategy, refreshed 2026-07-17.** These 12 declarations are the
literal source inventory, not 12 independently dispatched mathematical
problems. The parent theorem
`false_of_twoLargeCaps_commonCriticalMap` is the final assembler and is
called before the LIVE slot split. Its active inputs are two smaller,
source-faithful surfaces plus the protected original/swapped
`FA-UNIQ4/FA-UNIQ5` consumers. The exact-five ingress is now proved: its
actual unused-source row has at most one physical strict-cap hit, so two
distinct omitted physical points give two origin-tagged common deletions at
the same blocker/physical-apex center pair. Their first rows are forced to the
same actual support, their physical rows are the two exact-five erasures, and
the shared three-point physical core contains a third common-deletion source.
At every physical strict-cap source, the actual critical support contains at
most two physical members, so a distinct omitted source survives deletion at
that source's actual blocker. Production has already lifted this
fixed-point-free recurrence to a source-exact period-two-through-five cycle,
and can start the transition orbit at a prescribed physical source. The parent
adapter uses the first origin-tagged continuation source and retains the
physical radius, blocker rows, cap placement, failed deletions, full frontier,
and concrete critical map. The remaining consumers are now exact: the reverse
period-three-through-five arm needs a repeated outside-cap support pair (or an
equivalent U5 alignment), while the mutual-omission arm needs an ordered-cap/MEC
contradiction to its at-most-two-source off-cap exceptional blocker fiber.
Local rank/nonreturn is not available: exact finite-metric and Euclidean cap
regressions permit the corresponding marginal normal forms.

This keeps the full parent minimality, critical-map, MEC, cap-order, and
no-`IsM44` hypotheses. It decomposes the proof; it does not weaken the
theorem. Once the parent contradiction is assembled, the K-A compatibility
endpoint and LIVE-Q/C tree are bypassed and reference-mined rather than
proved leaf by leaf.

### V.1 Branch algebra

`u1_largeCap_routeB_tail_liveData_false` splits on the value of
`f2CriticalRow.center` (proved exhaustive by
`f2CriticalRow_center_baseSix_or_fresh`):

- **center ≠ p** — seven cases (q, t₁, t₂-named, t₂-rowFailure, t₃, u,
  fresh vertex): the seven **LIVE-C** helpers
  `liveData_C_center_*_false`, one hole each (7 holes).
- **center = p** — the orbit splits by which base point coincides with t₂₀:
  - q = t₂₀: **LIVE-Q**, four helpers `liveData_Q_l{1..4}_false` by q's
    label slot, each holding the six orderings of the remaining labels onto
    {t₁, t₂, t₃} (24 holes);
  - t₁ = t₂₀: **LIVE-T1**, twelve helpers `liveData_T1_ql{i}_srcl{j}_false`
    (q at label i, source at label j ≠ i), two orderings each —
    **source-sorry-free (0 holes)**: every case now calls the orbit adapter
    `U1LargeCapRouteBTailRelabel.false_of_center_p_t1_t20_via_pair`
    (`U1LargeCapRouteBTail.lean:3481`), which permutes the dangerous triple
    so the collided row is the t₂ row and lands in the t₂ chain below; the
    family is open only through V.2;
  - t₂ = t₂₀: **blocked on V.2** — the chain `false_of_center_p_t2_t20 →
    false_of_largeCap_pCentered_t2Source_exactDangerousRow →
    false_of_twoLargeCaps_pCentered_t2Source →
    exists_removableVertex_of_twoLargeCaps` is complete Lean whose sole open
    dependency is `DoubleApexOffSurplusSharedRadiusPair` (1 hole);
  - t₃ = t₂₀: **LIVE-T3**, twelve helpers, two orderings each —
    **source-sorry-free (0 holes)**: the production T3 relabel adapter is
    wired through both orderings of every helper and, like T1, reaches only
    the shared V.2 obligation.

The live direct inventory is now 12 `sorry`-carrying symbols: V.2 itself,
four LIVE-Q declarations, and seven LIVE-C declarations.  LIVE-T1 and
LIVE-T3 have no direct source holes and inherit openness only through V.2.

### V.2 The shared-radius pair compatibility obligation — OPEN IN SOURCE

`U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`
(`U1LargeCapRouteBTail.lean:2516`, hole at `:2561`).

> **Statement.** In the two-large-cap configuration —
>
> - a surplus cap (> 4 points) at index i containing q,
> - a second cap with ≥ 5 points at j ≠ i (which exists because no (m,4,4)
>   decomposition does),
> - n > 9, a critical shell system, the live data, and
> - the t₂-row centred at p with support {q, t₁, t₂, t₃}
>
> — there exist two distinct carrier points x, w′ ∈ A, both off the surplus
> cap, and radii r, ρ with
>
>     dist(x, a₁) = dist(w′, a₁) = r  and  dist(x, a₂) = dist(w′, a₂) = ρ,
>
> where a₁, a₂ are the two Moser apices opposite the surplus cap. That is: a
> pair co-radial from **both** opposite apices simultaneously.

The downstream implication is PROVED (core axioms): given such a pair,
`exists_removableVertex_of_twoLargeCaps` (`:2585`) produces a removable
vertex — the off-surplus membership fixes the pair's side of the surplus
chord, and the two-circle reflection argument
(`U2NonSurplusSqueeze.oppCap2_escape_gen`) derives the contradiction. The
conclusion is unsatisfiable over ℝ², so the existential is an artificial
ex-falso endpoint. It remains one of the 12 source holes, but it is no longer
the theorem-discovery target. The closure route derives `False` directly at
the parent boundary from the frontier-coupled exact-five cycle consumer,
its explicit common-deletion sibling, and the protected unique arms above,
then
deletes or trivializes this compatibility chain.

**Cardinality scope.** The declaration assumes only 9 < |A|. In the
two-large-cap configuration 11 ≤ |A| is PROVED
(`Census554.card_ge_eleven_of_twoLargeCaps`), and nothing currently excludes
|A| = 11. So the statement must be proved for every |A| ≥ 11; a proof that
works only for |A| ≥ 12 would additionally require a separate card-11
exclusion (open; row O14 below).

### V.3 The liveData obligations

All share the full tail hypothesis bundle of the bridge (the live data, the
five critical source rows, the `f2CriticalRow` packet, and the label
bookkeeping); each asserts that its branch of the case analysis is
contradictory.

- **LIVE-Q (4 declarations, 24 cases) — OPEN.**

  > **Statement.** The tail configuration with the f₂ row centred at p is
  > contradictory when q is itself the f₂ source point (q = t₂₀), q occupies
  > selected label lᵢ (i ∈ {1,…,4}), and the remaining three labels carry
  > {t₁, t₂, t₃} in any of the six orders.

- **LIVE-T1 / LIVE-T3 (24 declarations, 48 cases) — blocked on V.2.**

  > **Statement.** The tail configuration with the f₂ row centred at p is
  > contradictory when the f₂ source point is t₁ (respectively t₃), q
  > occupies label lᵢ, the source occupies label lⱼ (j ≠ i), and the
  > leftover label pair carries the two remaining base points in either
  > order.

  Both orbits reduce to the shared-radius pair statement (V.2) by production
  relabel adapters that permute the dangerous triple onto the t₂ chain.  All
  twelve LIVE-T1 and all twelve LIVE-T3 declarations carry no source holes
  and inherit `sorryAx` only through V.2.  In both cases the mathematical
  content is exactly V.2.

- **LIVE-C (7 declarations, 7 cases) — OPEN.**

  > **Statement.** The tail configuration is contradictory when the f₂
  > row's centre is **not** p — the seven cases being centre = q, t₁, t₂
  > (two sub-cases: named placement and row failure), t₃, u, or a fresh
  > vertex of A distinct from all six base points.

With the t₂ = t₂₀ branch and the T1/T3 orbit both blocked only on V.2, the
literal open source inventory is **V.2, LIVE-Q, and LIVE-C**. The active
mathematical content is instead the frontier-coupled exact-five cycle
consumer, its common-deletion sibling, the oriented-ingress/complement split,
and the protected unique-arm consumers described at the start of Part V; the
exact-five renewal, per-source successor, period-two-through-five cycle, and
reverse-incidence split are proved.

---

## Trust boundary and axiom audit

Checked 2026-07-13, symbol counts refreshed 2026-07-16 (reproducible via
`#print axioms` after `lake build`):

- `Problem97.erdos97_rhs` today: `propext, Classical.choice, Quot.sound,
  Lean.ofReduceBool, Lean.trustCompiler, sorryAx` — the `sorryAx` traces
  exactly to the 12 Part-V symbols.
- After the 12 obligations close, the closure becomes the Lean core axioms
  plus `Lean.ofReduceBool` and `Lean.trustCompiler`, which enter only
  through the certificate evaluation in the (m,4,4) branch (Part IV.b).
- The counting engine and the n = 9 base case individually close on
  `propext, Classical.choice, Quot.sound` alone — no compiler trust.

---

## Completion matrix

Status: proved / open / blocked (blocked = complete except for its
dependence on open rows). The statement column is the exact proposition each
row must (or does) discharge.

| # | Obligation | Status | Statement |
|---|---|---|---|
| O1 | Upstream bridge | proved | The published statement is definitionally the right-hand side of the upstream `erdos_97`. |
| O2 | Induction wrapper | proved | If counting (O3), the base case (O4), and descent (O6) hold, no counterexample exists — strong induction on n. |
| O3 | Counting engine | proved | Every counterexample has n ≥ 9. |
| O4 | Base case | proved | No 9-point counterexample exists. |
| O5 | Cap-sum bridge | proved | If n > 9, some cap of the Moser decomposition has more than 4 points. |
| O6 | Descent glue | proved | A removable vertex in a minimal counterexample yields a strictly smaller counterexample, hence a contradiction. |
| O7 | RVOL packet extraction | proved | Every minimal counterexample with n > 9 carries a surplus-cap packet. |
| O8 | RVOL (m,4,4) branch | proved | If both caps opposite the surplus cap have exactly 4 points, a removable vertex exists. |
| O9 | RVOL remaining branch | blocked (O18–O20) | If no (m,4,4) decomposition exists, a removable vertex exists. The existing LIVE case tree is complete Lean source inventory, but the preferred closure bypasses it through the parent assembler O20. |
| O10 | Shared-radius pair | open source compatibility endpoint | The current source asks for an impossible double-apex pair (V.2). It is bypassed once O20 lands and is not an active producer target. |
| O11 | LIVE-Q | open source inventory; pending parent bypass | The current tail tree contains four Q helpers / 24 holes. They are not independently dispatched while O20 is active. |
| O12 | LIVE-T1/T3 | blocked (O10) | The tail configuration with t₁ (resp. t₃) as the f₂ source point is contradictory, for each placement of q and the source and each leftover ordering. Both orbit adapters are production-wired; neither family has direct source holes, and both remain open only through O10 (V.3). |
| O13 | LIVE-C | open source inventory; pending parent bypass | The current tail tree contains seven non-p-center helpers / seven holes. They are not independently dispatched while O20 is active. |
| O14 | Card-11 slice | open scope gate | O20 should be uniform from card 11. Any higher-cardinality theorem must carry the missing lower-cardinality consumer in the same plan. |
| O15 | Compiler-axiom boundary | proved | The certificate layers of O8 contribute exactly `Lean.ofReduceBool` and `Lean.trustCompiler` to the kernel closure, and nothing else does. |
| O16 | Upstream library | proved | All library facts come from the pinned mathlib / formal-conjectures revisions. |
| O17 | Exact-five low-hit and recurrence reduction | proved | Two positive physical strict-cap hits in the unused source's actual critical row are impossible. Therefore at least two distinct physical strict-cap points omit that row. Production turns them into two common-deletion packets, proves their first supports equal the actual row and their physical supports are the two exact-five erasures, and extracts a third common-deletion source from the shared three-point physical core. At every physical strict-cap source, its actual critical row contains at most two physical members, so a distinct omitted source survives deletion at that source's actual blocker. Production further chooses a total fixed-point-free transition and normalizes it to an injective source-exact cycle of period two through five, retaining the common radius/cap class, actual blocker rows, edge omissions, and deletion-survival facts. The constructor can start the transition orbit at a prescribed physical source; the parent adapter anchors it at the first origin-tagged continuation source. These theorems use only the three core axioms. |
| O18 | Frontier-coupled exact-five physical-cycle residual | open | Prove `false_of_frontierCoupledExactFivePhysicalCycleParentResidual`. The parent adapter retains the full `RobustLargeRadiusParentSurface`, reconstructed `CriticalPairFrontier`, origin-tagged two-source continuation, parent-radius identity, and source-anchored production cycle under the same `H`; bare cycle-`False` is only an optional stronger shortcut. In the reverse arm, period two is impossible, every edge row is its adjacent physical pair plus exactly two outside-cap points, and a repeated outside pair is terminal; force that collision or an equivalent U5 alignment. In the mutual arm, two crossed common-deletion packets are canonical and all blockers preserve one deletion except possibly one double-blocking center with an off-cap source fiber of card at most two; eliminate this one-exception residual by ordered-cap/MEC coupling. The pinned regressions realize both local normal forms, so the proof must consume retained global K4, convex/MEC/cap, critical-map, and frontier fields. |
| O19 | Protected unique arms | open external dependency | The original/swapped `FA-UNIQ4/FA-UNIQ5` residuals close through their protected consumers. |
| O20 | Parent direct-`False` assembler | blocked (O18–O19 plus ingress/common-deletion complement) | First produce the oriented `oppCap2 ≥ 6` and physical-radius-class-cardinality-at-least-five ingress or route its complement; close the explicit common-deletion sibling; then assemble `false_of_twoLargeCaps_commonCriticalMap` from O18 and the O19 protected unique arms under the full parent hypotheses. Call it before LIVE row construction, then remove or trivialize O10–O13 by reference mining. |

The literal source holes are O10, O11, and O13. The active closure work is
O18–O19, with O14 as its cardinality-scope gate and O20 as routine final
assembly. **Overall: `erdos97_rhs` is OPEN.**

---

## Conclusion: what is proven today

Unconditionally PROVED (Lean, kernel-checked):

1. Every counterexample has at least 9 points (core axioms only).
2. No 9-point counterexample exists (core axioms only).
3. Every minimal counterexample with more than 9 points whose surplus-cap
   decomposition has both opposite caps of size exactly 4 contains a
   removable vertex (core axioms plus the two compiler axioms).
4. In the remaining case, the current source is reduced — by complete,
   kernel-checked case analysis — to the 12 declarations of Part V. The
   T1/T3 helpers carry no source holes of their own. The preferred closure
   path keeps the full parent data, uses the proved exact-five low-hit ingress,
   closes the origin-tagged common-deletion consumer plus the protected unique
   arms, and assembles a direct parent contradiction before that case split.

Conditionally: if the obligations of Part V are discharged, then
`erdos97_rhs` — and with it the Problem 96 target — closes with axiom set
{`propext`, `Classical.choice`, `Quot.sound`, `Lean.ofReduceBool`,
`Lean.trustCompiler`}.

Nothing stronger is claimed. The 12 current source declarations remain open;
the source-exact omission-cycle normal form is proved, but its joint geometric
consumer and the protected unique arms have not yet been proved.

---

## Appendix — the posted conditional reduction vs. RVOL as built

### The original post

An earlier conditional reduction was posted to the Problem 97 page:

> **The claim.** The following three statements together reduce Problem 97
> to the case |P| = 9.
>
> 1. **Counting obstruction.** Any counterexample P has |P| ≥ 9.
> 2. **Surplus removable-vertex package.** Suppose P is a counterexample
>    with |P| ≥ 10. Fix a Moser triangle T ⊆ P and its three opposite caps
>    C₁, C₂, C₃. A closed cap-sum identity gives
>    |C₁| + |C₂| + |C₃| = |P| + 3 ≥ 13, so some opposite cap has size ≥ 5.
>    From any opposite cap of size ≥ 5 one can extract a vertex v ∈ P whose
>    deletion preserves the counterexample property.
> 3. **Strict-convex convention.** Read "convex polygon" as "finite set of
>    extreme vertices in strict convex position." (The alternative reading
>    that allows redundant 180° boundary vertices needs a separate, routine
>    degenerate-interface reduction.)
>
> **Theorem (conditional).** Under (1), (2) and (3), Problem 97 is
> equivalent to the single finite statement: no 9-point set in strict
> convex position is a counterexample.

Status of each piece against the development as it stands.

**The conditional theorem itself — PROVED.** It is this document's
induction wrapper, verbatim: `UniversalReductionHypotheses` packages (1)
as `counting` and (2) as `descent`, and `UniversalProblem97_of_reduction`
(`UniversalProblem97.lean:60`) derives the full statement from them plus
the n = 9 base case. The reduction was never the exposed part; the exposed
part was premise (2).

**Item 1 — PROVED** as stated (Part I), core axioms only.

**Item 3 — dissolved at the interface.** The upstream formal statement
already fixes the strict reading: `ConvexIndep` is strict convex position,
and the published theorem is definitionally the upstream right-hand side
(Preamble). No degenerate-interface reduction is needed for the formal
target; the 180°-vertex reading concerns only the informal polygon
wording, which the upstream formalization resolves by convention.

**The n = 9 finite statement — PROVED** (Part II). The "computational
results" pending at posting time were replaced by the N4c → N4d → N4e →
N6/N7 → N8 chain; the closure is kernel-checked on core axioms alone — no
compiler axioms and no residual computation.

**Item 2 — this is RVOL, and it is where the posted account and the built
proof diverge.** Three changes:

1. **The pigeonhole survives; the extraction claim does not.** The cap-sum
   pigeonhole is Part III, proved as posted. But "from any opposite cap of
   size ≥ 5 one can extract a removable vertex" is not a theorem of the
   development. Removability is a global property — the deleted vertex
   must leave a 4-class at every remaining vertex — and no cap-local
   extraction argument materialized. What is actually proved splits on the
   sizes of the two caps opposite the surplus cap, not on the surplus cap
   alone.

2. **The proved branch closes by finite classification, not by a short
   deletion argument.** When both opposite caps have exactly 4 points —
   the (m,4,4) regime, Part IV.b — a removable vertex does exist in the
   surplus-cap interior, but establishing it takes the full residual
   machinery (endpoint-escape and pinned-residual exclusions, N4e-style
   containment, erased-pin-triple exclusions) and the cardinality
   trichotomy (card-10 banks, card-11 classifier fleets, the card-≥12
   counting exclusion), with the two compiler axioms entering through the
   evaluated certificates.

3. **The open branch inverts the quantifier: contradiction, not
   construction.** When no (m,4,4) decomposition exists — two caps of size
   ≥ 5 — no extraction is known. The built proof instead consumes
   minimality twice: a minimal counterexample has no removable vertex at
   all (`not_isRemovableVertex_of_minimal`) and carries a critical shell
   system, and the route-B tail must derive `False` from that data
   (Part IV.c). This branch is exactly the open content of the proof — the
   12 obligations of Part V, with the shared-radius pair statement (V.2)
   at the bottom. The configuration the posted package treated uniformly
   ("any opposite cap of size ≥ 5") is precisely the configuration that
   remains open.

Net effect: the posted reduction's conclusion — Problem 97 is equivalent
to the finite n = 9 statement — is proved conditional on (1) and (2),
exactly as claimed; (1) and the n = 9 statement are now unconditionally
closed; and the entire remaining difficulty of Problem 97 sits inside
premise (2), in the two-large-cap branch that its wording did not
distinguish from the rest.

### The followup post

A followup posted to the same page restated the state of the development:

> Proved unconditionally (formalized in Lean): (1) the counting
> obstruction; (2) the cap-sum bridge — |A| > 9 ⇒ some opposite cap is
> surplus; (3) the finite N9 closure — no 9-point counterexample exists.
>
> Open frontier, both in the "descent" part:
>
> 1. **Removable-Vertex Existence Theorem (conjectured).** Let A be a
>    nonempty, strictly convex (convex-independent), finite point set in
>    ℝ² with |A| > 9, satisfying PerVertexK4, such that no strictly
>    smaller set with these properties exists (minimality induction
>    hypothesis). Then A contains a removable vertex: a point x ∈ A whose
>    deletion preserves PerVertexK4 on the erased set.
> 2. **Uniform surplus-cap removability (conjectured).** Let P be a
>    cardinality-minimal strict-convex PerVertexK4 counterexample. Choose
>    a Moser triangle, later promoted to the equilateral MEC-boundary
>    packet, with its three closed opposite caps C₁, C₂, C₃. If some cap
>    Cᵢ has |Cᵢ| > 4, then Cᵢ contains a removable vertex.

Status of each piece against the development as it stands.

**The unconditional list — unchanged.** Items (1), (2), (3) are Parts I,
III, and II of this document respectively; all three remain proved on core
axioms alone.

**Conjecture 1 is RVOL verbatim** (Theorem IV, including the minimality
hypothesis — the correction the followup made to the original post's
cap-local package). Its status has since split: the (m,4,4) branch is
PROVED (Part IV.b, core plus the two compiler axioms), and the open
remainder is exactly the branch with no (m,4,4) decomposition
(Part IV.c), reduced by complete kernel-checked case analysis to the 12
obligations of Part V. The frontier posted as "all of descent" is today
V.2, LIVE-Q, and LIVE-C.

**Conjecture 2 is a strengthening the spine does not consume.** In the
(m,4,4) branch it holds as proved: the removable vertex is produced in the
surplus-cap interior (Part IV.b, containment arm). In the two-large-cap
branch the wiring needs only conjecture 1's conclusion — in fact only its
collision with minimality: the tail consumes "no removable vertex"
(`hnoRem`) and derives `False`. The branch's removable-vertex producer
(`exists_removableVertex_of_twoLargeCaps`, `U1LargeCapRouteBTail.lean:2585`)
concludes bare existence with no cap-membership constraint. Closing
conjecture 1's residual branch closes the problem; conjecture 2 is not
load-bearing beyond its proved (m,4,4) instance.

One vocabulary correction to the followup's wording: the general-n Moser
triangle is promoted to the **non-obtuse** circumscribed MEC support
triangle (`NonObtuseCircumscribedMoserTriangle`; Part I, D1). The
equilateral rigidity belongs to the n = 9 endpoint packet (N6/N7,
Part II), not to the general-n promotion.

## References

1. Adrian Dumitrescu, *On Distinct Distances from a Vertex of a Convex
   Polygon*, Discrete & Computational Geometry 36 (2006), 503–509.
   (Provenance for Part I; proved internally.)
2. Gabriel Nivasch, János Pach, Rom Pinchasi, Shira Zerbib, *The number of
   distinct distances from a vertex of a convex polygon*, Journal of
   Computational Geometry 4 (2013), 1–12; arXiv:1207.1266. (Provenance.)
3. `formal-conjectures`, pinned revision (upstream problem statement and
   vocabulary).
