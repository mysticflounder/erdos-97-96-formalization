# Problem 97 full prose proof — the RVOL route (2026-07-13)

Status: current full prose proof of the Problem 97 formalization target,
written against kernel ground truth of the working tree on `main` (spine
build `a0ba98b8849e`, refreshed 2026-07-17; counts cross-checked against the
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
problems. The parent theorem `false_of_twoLargeCaps_commonCriticalMap` remains
the final assembler before the LIVE slot split. The source-verified combined
dispatcher is cap-first and has five terminal arms:

```text
physical-apex ingress
  -> OriginalFirstApexSmallCapResidual
  -> PhysicalSecondCapSmallResidual
  -> PhysicalSecondApexCriticalResidual
  -> both opposite caps have card at least six
       -> extract CriticalPairFrontier
       -> original unique arm
       -> common deletion -> R -> B -> L
            -> false_of_largeOppositeCapsBiApexRobust L
```

The frontier is selected only after the original-first small-cap,
physical-second small-cap, and physical-second critical exits have run. On
the remaining robust branch, `R.firstApexFullyDeletionRobust` supplies
robustness at the first physical apex and `B` stores robustness at the second;
`L : FrontierLargeOppositeCapsBiApexRobustResidual B` additionally retains
both cap-six bounds. The theorem must keep `L`, rather than project to bare
second-apex robustness or bare `B`, so it can use the original frontier pair
and radius, minimality, non-`IsM44`, cap/MEC order, both cap bounds, and both
blocker-map image omissions. The current public mathematical target is
therefore `false_of_largeOppositeCapsBiApexRobust L`; the original and swapped
unique consumers remain protected dependencies in their respective arms.

`CriticalFiberClosingCore` is an optional implementation detail, not the
public target. If that consumer is reused, the honest helper chooses a
favorable `Hfav : CriticalShellSystem D.A` late and produces a core for the
fully rebased common-deletion residual. Production already has the frontier
rebase and scratch has a common-deletion rebase; the `R`/`B`/`L` rebase ladder
must be added before using that route. A fixed-initial-`H` theorem from `L` to
a core is sufficient but operationally overconstrained and must not guide
mining.

The corrected 101-survivor run is only a fixed fourteen-role
`PROFILE = (8,4,5)` theorem-discovery surface. Retrospective replay with both
omissions rejects its stored shadows, but no theorem extracts this profile
from an arbitrary live residual. In fact its physical second opposite cap has
cardinality four, while the live robust endpoint is already in the
cap-at-least-six regime. Its fresh `UNKNOWN` run therefore cannot be promoted
to a live coverage gate.

Production `ATail/BiApexBlockerMultiplicity.lean` proves what the two
omissions force without a census: either two distinct blocker values have
nontrivial fibers or one blocker fiber contains at least three sources. The
proposed `Fin 12` regression does not survive the correct equality-quotiented
ordinal audit. In its pinned order `0 < 1 < 2 < 3`, rows 0 and 1 share
`{2,3}`; the row-0 strict comparison becomes a self-loop because row 1 equates
its endpoints. A full linear audit finds the same two row equalities plus one
Kalmanson inequality as a deletion-minimal UNSAT core. Production
`false_of_two_selected_rows_shared_late_pair` now proves this cancellation
directly. The corrected search must quantify over every vertex of the whole
cyclic carrier, include equality quotienting and this two-row terminal, and
retain the two blocker omissions and minimality connectivity. Fixed-profile
UNSAT remains theorem discovery until a faithful extraction and checked
coverage certificate exist.

The faithful extraction now kernel-checks in scratch for every live
`FrontierBiApexRobustResidual`. It supplies the complete CCW boundary, one
selected row at every center, the common blocker map with both omissions,
strong connectivity, exact blocker rows, the circle/bisector incidence bounds,
and both strict Kalmanson inequalities. The corrected audit below shows that
these linear fields are still insufficient; the remaining issue is a live
Euclidean/exact-shell strengthening, not a fixed-profile role map.

The first uniform candidate is now ruled out. An independently verified
card-11 shadow retains the two incidence bounds, cyclic shared-pair
separation, strong connectivity, and both blocker omissions while satisfying
all 285 active one-row ordinal Kalmanson implications. Hence a producer using
only local one-row cancellations is false on the encoded live prefix. Exact
replay rejects that table with one Kalmanson inequality and a six-center
equality chain. A second verified live-card model survives every single
inequality after global equality quotienting, but four strict inequalities
with three row-equality packets add to an all-weights-one Farkas contradiction.
The corresponding size-independent terminal kernel-checks. Full multi-
inequality Kalmanson/Farkas coverage was then tested as the stronger decision
surface.

The bounded audit is now computationally cheap enough to iterate: direct CNF
models receive independent structural replay, and every rejection receives an
exact rational Farkas replay. The first runs also exposed a bank-normalization
defect. Oracle cores retained unused ambient gap vertices, causing the same
active theorem type to reappear at different spacings. Thus the raw counts
`231 -> 262 -> 435` are sound-cut history, not distinct mathematical progress.
Rank-normalization collapses the 262 checkpoint to 215 active-role types; the
checked interlocking shared-pair additions give a corrected 217-type bank.

That corrected view yields a compact consumer language. In the audited
checkpoint, 87 of 88 full-LRA schemas contain a Kalmanson-infeasible simple
equality cycle of length at most seven; the remaining ordered type is a
coupled pair of shared-pair rows with a direct two-inequality contradiction.
Looking back at the full row tables sharpens this further: all 203 independently
verified card-11 models admit a five-constraint proof with two strict
Kalmanson inequalities and three row equalities. One three-pair cancellation
lemma covers the arithmetic endpoint. The 203 certificates reduce to 20
reflection-canonical six-membership cuts, which subsume 156/435 raw schemas.
But the corrected 217-type outer problem has an independently verified card-11
survivor with none of those patterns. Exhaustive scanning finds no infeasible
simple equality cycle of lengths three through seven among 64,753 normalized
types. More strongly, an independently substitution-checked rational metric
satisfies all selected-row equalities, positivity, triangle inequalities, and
strict Kalmanson inequalities for that row table. Thus pure Kalmanson/Farkas
closure is false on that historical bare-`B`, card-11 structural surface. It
does not decide the corrected live robust branch: the two cap-six hypotheses
force carrier cardinality at least fourteen, with `(5,6,6)` the first cap
profile. In that minimal profile the physical apices occupy cyclic indices
`0` and `4` up to reversal. A card-14 full-linear run may therefore be useful
as a bounded regression for `L`, provided its missing cap/MEC fields are
listed explicitly; the card-11 survivor is not evidence against that test.

The bounded regression has now been strengthened by the exact finite cap
data. The no-bank successor at normalized apices `0,4,9` adds all seventeen
proved center-cap bounds and the six valid endpoint bounds, and its semantic
smoke gates pass. It learns 73 distinct metric-dead order schemas in 30
seconds and 169 in 60 seconds, but both runs terminate `UNKNOWN` under their
wall budgets. These are discovery checkpoints only: they neither exhibit a
Kalmanson shadow nor exclude the cap-aware abstraction. Because the learned
anonymous schema stream has not stabilized, the next object must keep the
named frontier pair, the actual physical-apex deletion rows, and their common
critical-map provenance rather than merely extending the wall budget.

The next theorem-bank audit finds that planar Euclidean realizability is
already the missing field for this row cell. Independent canonical outer
replay finds three embeddings of
the five-role pattern `WF = WX = WZ`, `PZ = XZ`; its generic core and
convex-boundary bridge are production theorems registered with
`GeneralCarrierBridge`. Independently, five of its rows instantiate the banked
`u5_qcritical_aux_base_collision_metric_incompatibility`, whose exact-name
local port also kernel-checks. The front-before pattern accounts for all 230
stored 555/654 cores in the current general-theorem report. Consequently broad
literal 555/654 mining is stopped: both fixed profiles have carrier
cardinality twelve and cannot occur on `L`. The compact schema supplies bounded card-11
coverage and a checked consumer, but—as the higher-cardinality gate below
shows—not a uniform outer producer. This is proof progress but has not yet
closed any of the 12 source obligations.

The augmented 218-schema card-11 problem is now terminal. The exhaustive
210-way split over row zero's four-element support is independently verified
as exhaustive and disjoint; every cube is UNSAT, every raw DRAT checks, and
the retained compact proofs independently recheck. This is exact card-11
coverage, not a source theorem.

The analogous claim for the current bank fails: independently checked SAT
carriers at cards 12 and 13 avoid all 218 schemas. Neither is a geometric
survivor, however: card 12 contains a previously omitted eight-role transport
of the production two-cycle Kalmanson consumer, and card 13 contains a distinct
six-role transport. Both have two exact linear UNSAT checks and an independent
Farkas replay; neither schema embeds in the other carrier. A theorem-faithful
quotient audit then located the exact omission: the 218/262 checkpoints were
mined inventories, not closed under cyclic-cut transport of the production
two-cycle theorem, and one six-role orbit had only five of six cuts. A scoped
292-schema checkpoint adds 74 records and hits these saved carriers 4 and 14
times. The repair is exact for those carriers, but literal schemas vary with
carrier path length; no finite all-cardinality bank or arbitrary-card live
closure follows.

The exact reflection-canonical schema adapter is already kernel-checked in
scratch and consumes the live whole-carrier rows and CCW boundary directly.
What remains is a geometric parent producer using information absent from the
outer carriers. The preferred exact public statement is
`false_of_largeOppositeCapsBiApexRobust L`. It may choose its fiber, rows, and
favorable rebased critical system internally; the broader metric route needs
only existentially chosen rows, not coverage of every arbitrary selection.
Higher-cardinality witnesses are regression gates for planar Euclidean
selected-row realization and convex order, MEC/cap placement, exact radius
filters, and common critical-map coupling. The authoritative `/opt/nfs`
ledger does not already supply this step: O17--O19 remain open beyond bounded
five/six-center reductions.

The latest source-indexed audit gives the precise next reduction. If `Z` is
the common blocker of a repeated fiber with sources `P,X`, then the complete
`Z`-row already contains `P,X`, and the row sourced by `Z` already contains
`Z`. Lemma 81 needs one further return incidence into that latter row and a
separate cyclic placement. A card-14 incidence fixture realizes the return
hit but not the order, so neither condition is a formal consequence of the
current finite prefix.

The live survival cover is already a completed reduction, not the next open
producer. Its card-at-least-fourteen theorem constructs a source-faithful
common-deletion packet with the physical second apex as one center. The
uniform consumer then returns swapped `FA-UNIQ4` or
`FullyDeletionRobustAt D S.oppApex2`. On `L`, the robust result is already an
input, so repeating that reduction does not shrink the branch.

The true residual is the exact robust second-apex radius classification. One
positive radius class has at least five carrier points, or two distinct
positive K4 radii have support-disjoint selected four-classes. Cap four is
impossible and cap five routes to protected swapped `FA-UNIQ5`; both arms fit
the present marginal cap/MEC bounds when the opposite cap has cardinality at
least six. The missing proof must couple these arms to the original frontier,
first-apex robustness, the global critical map, minimality, `noM44`, and full
cap/MEC order, and conclude `False` directly or produce an immediately
consumed prescribed-pair row.

The current production-and-scratch DAG refines the large-radius side of this
statement to a finite, source-exact geometric leaf. The exact-five continuation
constructs a total physical actual-critical omission transition and then an
eventual cycle. The named continuation sources need not lie on that normalized
cycle: `K.start` can be transient when `K.entryTime > 0`. Therefore the
parent-facing mutual/all-reverse split must be made on the total transition.
Its global all-reverse arm gives a source-exact row at every physical source,
including both named continuation sources; the cycle remains available for
period-three-through-five counting. All generic
common-deletion, shared-pair, singleton, and bare fresh-robust outputs return to
an already visited robust state unless a separate nonreturn theorem is added.
The exact rational, kernel-checked `DirectedCycleCountermodel` shows why the
remaining input matters: three co-radial physical-cap sources and three
distinct cap-straddling bisector centers already coexist on a strict-convex
nonobtuse MEC carrier. What that model omits is each row's two outside targets,
the total critical map, minimality, and the retained parent coupling.

Accordingly the public proof is direct contradiction from the full-parent
all-reverse transition, and its immediate internal producer is one aggregate
occurrence rather than another bare existential packet: some transition-level
reverse outside pair must be co-radial from `S.oppApex1` (or equal the retained
frontier pair). Production `outsidePair_unique_capCenter` then closes. The
proof may instead aggregate the three-to-five cap-straddling rows into an
equivalent complete named U5 incidence or common cap/curvature impossibility,
but it must remain inside the full `L` parent. The active
`ShellCurvature` analytic work may supply per-row inequalities, but an exact
QF_LRA model already satisfies all current turn budgets on the audited 25-role
word. The load-bearing step must therefore be a stronger quantitative
cross-row or full-parent coupling. The mutual-omission transition arm, unequal two-radius
core, localized nonreturn, and retained-parent branches remain after this
leaf, so this checkpoint does not yet close the public theorem.

The first aggregate-curvature attempt is now decisively excluded. There is an
exact rational common turn ledger of total `2*pi` in which three distinct
outside intervals are strictly nested and all current per-row quarter-turn and
middle-plus-center inequalities hold. Hence those marginal inequalities do
not imply the required packing collision. Conversely, a bounded deformable
period-three coordinate search found no example in which even one outside-cap
point on an actual blocker circle is both inside the nonobtuse Moser circumdisk
and a new convex-hull vertex. Exact rational replay refutes that proposed
obstruction: a ten-point model retains all three co-radial sources, all three
cap-straddling blockers, one legal outside target, the nonobtuse Moser disk,
and strict convexity. The no-hit run was therefore a sampling artifact at that
strength. An exact rational eleven-point extension also supplies the second
distinct target, giving one complete `2 + 2` row on the unchanged full cycle
core while preserving strict convexity and the nonobtuse Moser disk. The next
exact local question is simultaneous completion of the other two rows; periods
four and five still require additional global force.

Even the complete-one-row surface is compatible with the entire linear
distance theory currently available: for both complementary-chain order
types, exact rational ledgers satisfy all triangles, all strict Kalmanson
inequalities, the equal-radius identities, and the named-class exclusions.
The same-side ledger is accompanied by the exact planar/MEC construction just
described. Thus this checkpoint retires one complete row as a local obstruction
and isolates simultaneous-row or global-parent coupling, rather than a missing
ordinal or Farkas consequence.

The simultaneous-row packet does not automatically contain six different
outside points. The proved injectivity says only that no two unordered outside
pairs are equal; two rows may share one target. Hence a complete local
enumeration must include these overlap patterns and the corresponding point
lying on both blocker circles.

After those identifications are included, there are 2,214 quotient distance
cases with three through six actual outside targets. Strict ordinal/Kalmanson
closure rejects 1,224 of them, while the remaining 990 possess exact rational
solutions to the full triangle-and-Kalmanson linear system. Therefore the
linear theory genuinely reduces the simultaneous-row surface but cannot close
it. The missing force on the survivors is planar Euclidean/MEC geometry or the
global critical/deletion parent packet.

The rejected cases provide a sharp conditional finite reduction. In the fixed
anchored chiral order used by the audit, the outside-pair union has at least
five vertices; if it has five, the single shared vertex can only join rows `0`
and `1`. The 1,224 cases compress to two strict-Kalmanson disjointness lemmas
and `Finset` arithmetic. Yet the live period-three packet currently supplies
three separate row cuts, not the one common boundary order assumed here. One
shared cap block exists, but its honest order theorem splits into forward and
reflected orientations, with a different exceptional overlap pair in the two
branches. The block interface also lacks the global CCW evidence required by
the current Kalmanson wrapper. Those orientation branches need a pointwise
strict-cap consumer before this reduction becomes a Lean coverage theorem.
The pointwise proof for both orientations is now complete on paper; Lean only
needs a pointwise wrapper of an existing hull-line intersection result. It
proves one outside pair disjoint from both others, so it is pruning rather than
closure.

A bounded coordinate search then tested the Euclidean simultaneous-row surface,
conditional on that shared order, for every outside-pair graph with union
cardinality three through six. Its parameterizations impose the blocker-
bisector and row-circle
equalities exactly, but every branch ended `UNKNOWN_NO_HIT`; no witness reached
rational reconstruction and no infeasibility or coverage certificate exists.
The best broad six-distinct signed margin, about `-4.09e-5`, is not a distance
to feasibility. Consequently this search is only evidence that the three-row
surface merits an exact decision. The fixed-order systems remain generically
positive-dimensional, so equality-only Gröbner mining cannot decide them. The
local path must first prove the shared order and then use interval/CAD or an
equivalent exact semialgebraic reduction, not more open-ended search.

The fixed-forward linear system also cannot force the desired first-apex
return. After correcting the identification to `right = S.oppApex1`, every one
of the 990 exact rational LRA survivors makes all three reverse pairs
non-co-radial from `right`, and exact representatives cover all eight strict
direction patterns. Thus the missing force is not another Kalmanson consequence.

The retained parent gives a more direct OPEN terminal. If one reverse outside
pair returns to the original frontier pair—or merely becomes co-radial from the
first physical apex—then the row blocker and first apex are distinct same-cap
centers through the same two outside points. The existing
`outsidePair_unique_capCenter` theorem yields `False`. No current global K4,
minimality, `noM44`, or period-four/five theorem forces this return occurrence,
but it is nonrecursive and closes the branch immediately if proved. It cannot
be obtained from the current marginals alone: an exact finite incidence model
retains the CSS-support, fiber, bi-apex robustness, cap-size, frontier, and
reverse-row marginals with all reverse pairs split across first-apex radius
colors. An exact rational convex/MEC model also retains both cap bounds, the
retained pair marginal, and one complete reverse row without a return. The
finite model already contains first-apex K4/double deletion and a support-
locked total critical system abstractly. Thus the proof must cross-couple those
global critical/deletion facts to Euclidean/MEC/all-row order or minimality;
neither layer alone forces the occurrence.

The parent supplies a source-faithful next packet with two first-apex rows.
One radius-`r` row contains the retained pair `q,w`; a second row of radius
`rho`, obtained after deleting both, avoids `q,w`. If `rho = r`, their union
exhibits six distinct co-radial points; if `rho ≠ r`, the two four-supports are
disjoint. The pair `q,w` has three legal cap-role cases, and none of the unnamed
completion points has a fixed common-order slot or reverse-target identity.
That complete role domain, not a guessed fixed schema, is the next cross-system
surface.

The radius split is now sharper.  The two rows are selected four-point classes,
not exact CSS shells.  In the equal-radius arm the six named points imply K4
after every two-point deletion at the first apex, but global CSS and minimality
only return a singleton critical shell, a pair-minimal exact-five class, or two
pair-minimal disjoint exact-four shells.  An exact 25-point metric regression
retains those abstract global/deletion properties while keeping every critical
support from containing two named six-class points; it is not Euclidean/MEC.
The original unequal-radius fixture violates the live two-circle intersection
bound and is retired.  The corrected dynamic audit supplies one exact SAT
representative in each of the six coarse radius/role cells, with every reverse
pair avoiding both named rows.  Those six witnesses are not a source-exhaustive
census of the 31 labelled same-radius role assignments or both boundary
orientations.  Each representative retains the total CSS, K4,
source-by-source deletion failure, exact period-three reverse rows,
injectivity/straddling, common cap order, triangles, and displayed
circle-intersection bounds.  It omits the full strict Kalmanson/Euclidean
crossing system, planar/MEC realization, and `noM44`.  Thus a reverse pair
wholly contained in either named row remains an exact conditional terminal.
It is retired only as a consequence of this weak marginal surface and is the
active aggregate producer from the complete `L` parent.  One pinned blocker
map is already Kalmanson-UNSAT before target negation.  A bounded internal
period-three contradiction may derive common order from the live cap, but it
is not the public mining boundary and cannot follow from the linear quotient
alone.  Shared order is not an extra geometric assumption.  The diagnostic
coverage quotient includes not
only all 31 labelled same-radius assignments and both orientations, but also
T0/T1 overlaps with fresh completions, every unequal-radius row profile, all
3/4/5-strict physical exact-five profiles, legal F0/exact-five/blocker
identifications, fresh reverse targets and sharing partitions, and
blocker/source cross-identifications.  The current fixed-cell solver is
therefore SAT-first diagnostic only.  The exact fully disjoint QF_LRA-SAT cell
blocks further enlargement of this linear quotient.  The next proof input
must be nonlinear Euclidean/MEC geometry, full-fiber provenance, or global
minimality, and must feed the aggregate full-parent occurrence.

The required common order is constructible from the live packet.  A
period-parametric scratch proof draft chooses one strict block for the
physical cap, indexes all cycle sources and actual reverse blockers in it, and
derives every row straddle from cap-side distance injectivity.  It preserves
both orientations and legal blocker/nonincident-source identities.  The draft
is `sorry`-free but has not yet been Lean-elaborated under the active build
gate.

For those present loops, the exact run is complete: 1,728 generated forward
orders times six representatives give 10,368 rational cells, all UNSAT and
none `unknown`.  The result does not exercise the intended packet.  Every
fixed representative identifies a first-apex row pair with a pair on the
independent physical five-circle; their two owner centers do not alternate,
so one Kalmanson inequality and those two row equalities already contradict.
No reverse row or period-three fact is used.  This is an encoding-artifact
audit, not evidence that the full source quotient is UNSAT.

The first corrected cell, with the first-apex rows, physical exact-five row,
blockers, and all reverse outside targets fully disjoint, is exact-QF_LRA SAT.
It satisfies all strict triangle and Kalmanson inequalities, all named row
equalities, the common order, and two-owner alternation.  Hence the linear
strict-distance closure is compatible on a source-faithful identity cell.
This ledger is not asserted to be planar, MEC-realizable, or globally
minimal; it identifies nonlinear Euclidean/MEC, full-fiber, or minimality
coupling as the first possible new force.

The corresponding fixed-cell planar query remains unresolved.  Its audited
Cartesian encoding has 46 free reals, 19 shell equalities, 79 named exact-
support exclusions, and 575 fixed convex-order inequalities.  Z3 and cvc5
both timed out at 120 seconds, and the same happened after removing all exact
exclusions and at every short row-family prefix.  These are `UNKNOWN` results,
not negative evidence.  The formula is only a named projection and omits at
least one required surplus-cap vertex plus the whole-carrier K4, MEC/cap,
total-critical-map, minimality, and `noM44` fields.  The next discovery method
must be witness-directed numerical/homotopy continuation followed by exact
substitution or certification, rather than a longer blind QF_NRA run.

Two subsequent 24-core numerical campaigns likewise produced no verdict.
They tested 384 hard-constrained starts across two source-legal exact-QF_LRA-
SAT words: the original word with an exact nine-point cycle seed, and a second
audited word containing the exact rational complete-`b0`-row witness.  No
candidate passed the full row/convexity/separation/exact-support substitution
gate.  This is bounded `NO-HIT`, not an infeasibility theorem.  Any further
local attempt must change to an interior-point/support-line or homotopy
instrument; repeating SLSQP starts has no proof status.

The exact-row interior-point successor also completed without a verified
point.  Its 27 parameters construct all 19 row equalities identically; 96
starts cover all four radius-gap sign components and hard-test strict convex
order and pair separation.  The durable ledger accounts for every start, but
the best hard slack remains about `-1.18e-3` on the convex-orientation surface.
This is bounded numerical `NO-HIT`, not infeasibility.  Further tuning of this
fixed projection is retired; the load-bearing work is the full-parent
co-radial reverse-pair occurrence.

The latest prose pair-reuse handoff adds that every reverse critical support
omits the physical opposite apex and places its outside pair in the union of
the two complementary open blocks.  It is a valid mathematical refinement,
not a contradiction, and the existing `rho = radius`, `IO` witness already
satisfies it.  The same backup does not bridge T0/T1 to any reverse support:
its Lemma 202 lacks a shared target, Corollary 203 requires the opposite row
type, and Lemma 237 requires a whole block of exact transverse rows.

The same pointwise geometry has a period-parametric local form.  Whenever a
cycle source is a strict local extremum in the common cap order, the two
incident reverse outside pairs are disjoint.  Exact exhaustive finite-order
enumeration shows why the period-three global consequence is special: period
4 retains 2 of 6 normalized source orders and period 5 retains 6 of 24, all
with exactly two nonadjacent extrema.  Once source-faithful blocker
identifications are restored, 34 and 228 order/map cells remain.  This is an
exact reduction within the order model, not a proof that either longer cycle
is impossible.

The source-return joint-deletion constructor is only fallback evidence. It
makes one named source deletable at four distinct centers, but no named pair
is forced into one of the corresponding rows. The other retained-terminal
constructors likewise do not currently reach a proved `False` consumer, and
no production `sorry` has closed at this checkpoint.

The two multiplicity arms have also been normalized in checked scratch. Each
reaches one actual critical row containing two sources and an external source
whose blocker is different; a triple blocker fiber is one exact four-shell,
not three independent rows. Cap localization sharpens that packet but does
not supply the ambient-apex equality, cyclic placement, or cross membership
needed for a terminal. Consequently this reduction guides interpretation of a
genuine corrected survivor; it does not bypass the coverage requirement.

The retained-radius and strict-interior collision/matching development below
is a superseded but valid fallback record. Its lemmas may be used inside the
bi-apex proof, but its terminal leaves are not separate primary obligations.

**Superseded refined-common-deletion route.** Production
`CriticalPairFrontier.originalUnique_or_commonDeletionParent` splits the
concrete first-apex frontier directly. Its unique side is exactly the
protected original card-four/card-five radius arm. On the other side,
first-apex double-deletion survival and the frontier's unconditional
second-apex double-deletion survival give a source-faithful common deletion:
the deleted point is the actual frontier source `F.pair.q`, the centers are
the two opposite Moser apices, and the radius, pair, cap/MEC, and common
critical-map provenance and the four-point full frontier-radius class lower
bound remain available. The next mathematical theorem is direct `False` for
the resulting `FrontierCommonDeletionRefinedNormalForm`, not for a generic
common-deletion projection.

The first checked consumer reduction is constructive rather than terminal.
The stored second-apex four-row meets the off-surplus first-apex marginal in
at most one point and the deleted source's actual critical support in at most
two. Hence it contains a point outside both sets. Deleting that point preserves
K4 at the deleted source's actual blocker, and the point lies either inside
the surplus cap or off the frontier radius. This rules out marginal two-hit
and one-row confinement as producer targets.

The same production normal form also retains the companion-source directed
split. Either the companion lies in the deleted source's actual shell, which
forces that actual blocker outside the surplus cap by ordered-cap uniqueness,
or deleting the companion preserves K4 at both the first apex and that
blocker. `FrontierCommonDeletionConsumerNormalForm` keeps this split and the
escape together.

The parent residual also retains the lower bound of four on the complete
first-apex frontier-radius class. Consequently, an off-radius escape cannot
remove any point of that class: deletion preserves K4 at the first apex as
well as at the actual blocker, giving an origin-tagged common-deletion packet
without another row producer. If the first escape is instead on-radius and in
the surplus cap, endpoint one-hit makes it the unique surplus point of the
stored second row. A second point omitted from the actual support is therefore
either the sole possible `FirstApexMarginalCompanion` or a distinct off-radius
source, which again gives common deletion. The marginal companion itself
always preserves K4 at the first apex: at exact frontier-class cardinality
four the retained double-deletion witness must use another radius. Thus the
on-radius surplus escape and marginal companion are two distinct
common-deletion sources at the same centers. Production packages this as
`FrontierCommonDeletionRefinedNormalForm`, preserving the three-way
common-deletion outcome and the directed blocker outcome together. The live content theorem
must consume these joint origin-tagged cases with the full parent geometry;
generic common-deletion recursion and further anonymous row mining discard
the force just retained. The production theorem
`false_of_frontierRefinedNormalFormConsumers` already assembles that consumer
with the protected original unique arm into a contradiction for the extracted
frontier.

No existing theorem-bank declaration consumes a refined branch to `False`.
The exact off/on-radius audit is now complete: its endpoints are reverse
omission, a two-source omission fork, an allowed mixed reflection pair,
physical-second-apex return, or another third-center common deletion. In
particular the stored second-apex row does not produce the legacy shared-radius
pair.

There is nevertheless a stronger common consequence. Production proves that
the first apex survives deletion of every carrier point, including the exact
card-four frontier case, and therefore is absent from the complete critical-
map image. Since the blocker map is a finite self-map, two distinct sources
must have the same blocker. Equal-center rigidity then puts both sources in one
common exact four-point critical shell, with deletion of either source critical
at that blocker. This is not yet contradictory: the sources and common support
have no forced cap, boundary-order, or frontier-radius placement.

The next ablation audit changes how this fact may be consumed. The checked
three-row Kalmanson core is a valid contradiction, but its proof treats the
common blocker as an arbitrary selected-row center and does not use either
source's deletion-critical provenance. The arbitrary outside-pair extraction
from the common shell is equally non-specific. Therefore those antecedents
are conditional terminals, not the primary producer or mining target.

The consumer audit corrects the quantifier on the active content theorem. A
direct contradiction for an arbitrary preselected collision fiber is not the
primary contract. The checked adaptive next split restricts the actual
blocker map to the retained first-apex radius class: either two retained
sources share a blocker, or the blocker map is injective on the whole retained
class. A retained collision packages a complete
`FrontierCommonDeletionCriticalFiber R` and makes the first apex a second
equidistant center for its two sources. The injective arm retains at least four
distinct source-to-blocker assignments.

`CriticalFiberClosingCore R` remains a sufficient terminal interface, not a
proved exhaustive classifier. Its ordered constructor retains the actual
`C,K -> A` fiber, a critical source `J`, `X = H.centerAt J`, the actual
`J`-critical cross incidence, an actual first-apex row through `J,C`, and
cyclic order `O < A < X < J < C < K`. Its same-cap constructor retains the
collision pair outside one ordered cap and two distinct, source-realized cap
centers. The routine consumer `false_of_criticalFiberClosingCore` closes
either packet. The two retained-radius selector arms may instead be proved
false directly.

Production `ATail/FirstApexCriticalFiber.lean` now enforces this boundary:
`nonempty_frontierCommonDeletionCriticalFiber` packages the two distinct
sources, equal blocker vertices, equal exact supports/radii, mutual support
membership, and both deletion-critical facts while remaining indexed by the
original parent residual.

For any fixed diagnostic fiber, the source-faithful first-apex-row audit gives
the exact initial split: either
both collision sources lie off the retained first-apex radius class, or a
first-apex selected row contains one collision source and another point. A
checked finite regression realizes the both-off arm with the total
fixed-point-free critical map, exact support locking, first-apex robustness,
and row-closure minimality. The row-hit arm still lacks the cross incidence
and cyclic order. Actual-blocker analysis of the shell complement likewise
ends in common-blocker pinning, an outside-cap cross-bisector, or mutual
omission rather than a same-cap second center. Hence this split does not
justify an arbitrary-fiber contradiction. It is used inside the existential
producer: a row hit supplies the actual first-apex equality, while a both-off
choice must be replaced by a more suitable fiber or routed to the same-cap
constructor using full cap/MEC/frontier geometry. Plain strong connectivity,
LIVE row-name casework, a raw six-role scan, and anonymous common-deletion
recursion are exhausted.

Production `ATail/FirstApexCriticalFiberRow.lean` makes this split
source-stable: `Outcome P` is indexed by the already chosen production
critical fiber, so both the `BothOff` and `RowHit` arms retain the two
deletion-critical sources without re-running finite pigeonhole. It remains a
nonterminal diagnostic, not the primary closure theorem.

The same module now proves the Euclidean two-circle gate
`criticalShell_inter_frontierRadiusClass_card_le_two`: every actual critical
row meets the retained first-apex radius class in at most two points because
its center differs from the first apex. This invalidates the first `Fin 12`
injective-matching regression, whose displayed rows have a three-point
intersection; the same triple also violates cyclic shared-pair separation.
A repaired `Fin 12` regression enforces the intersection bound and every
generated compatible cyclic-order constraint while retaining injectivity on
the robust card-five class. It is exact within that finite abstraction, not a
Euclidean realization. A full formalized metric-bank replay now rejects it by
`DuplicateCenterCore`: transitive selected-row equalities give two distinct
centers through the same triple. The Lean fixture kernel-checks the core and
its no-realization theorem. Hence it is not evidence for a surviving injective
arm; a source-valid full-bank/ordinal coverage audit comes before any new
cap/MEC, complete-filter, or no-`IsM44` producer.

The live injective arm now has a production continuation independent of the
refuted fixture. `RetainedMatchingGeometricReduction` selects two actual
retained-radius sources in the strict first-opposite-cap interior, proves
their actual blockers distinct, orients one absent cross membership, and
turns it into deletion survival at that blocker. Together with first-apex
robustness this yields an existing `CommonDeletionTwoCenterPacket`. The packet
also retains the `noM44` disjunction that one opposite cap has cardinality at
least five. This is the new matching consumer boundary; it is not yet a
contradiction.

`RetainedMatchingLargeCapConsumer` now consumes that boundary in production.
Reverse omission gives paired source-faithful common deletions. Reverse hit
localizes the reverse blocker and its exact two-point shell/cap intersection;
when the first cap is large, a third strict-cap point outside the shell gives
a fresh common deletion.

`RetainedMatchingCommonDeletionNormalization` completes the same renewal when
the other opposite cap is large.  The reverse shell has only two points
outside the first cap, but the large second cap has at least three
strict-interior points there, so one is absent from the shell and its deletion
preserves both required centers.  All retained matching outcomes now reach a
source-valid common-deletion packet.  That packet is still not a contradiction:
the exact successor-cycle regression survives in the geometry-free
abstraction.  The remaining matching theorem must therefore preserve the
matching/large-cap origin and consume full parent geometry to terminate the
common deletion.

The current parent route now makes a stronger choice before that older split.
Production `RetainedStrictInteriorPairSelector` selects the two guaranteed
retained sources in the strict first opposite-cap interior before comparing
actual blockers. Equal blockers are therefore cap-localized: both sources and
their common blocker lie in the strict cap, and their exact common shell meets
the cap in exactly those sources. The blocker is distinct from both sources,
so the three strict-interior points force that cap to have cardinality at least
five. A third strict-cap point outside the shell therefore gives an
origin-tagged fresh common deletion unconditionally. Distinct blockers feed the
existing omission and large-cap pipeline without a global injectivity
hypothesis.

Production `LocalizedCollisionMutualOmissionCycle` then selects one collision
source omitted by the fresh source's actual row. The collision shell already
omits the fresh source, so the two sources mutually omit one another, have
distinct actual blockers, and carry both source-exact common-deletion packets.
The checked cap-order continuation then splits on the fresh actual blocker.
If it is on the first cap, the collision and fresh complete critical rows
have disjoint banks of outside pairs and contribute at least two distinct
pair incidences; if it is off the cap, its cross-cap location remains to be
coupled. Neither conclusion is itself contradictory.

Production `RetainedMatchingCommonDeletionCycle` preserves two consecutive
source-exact deletion edges and classifies the endpoint as source return, an
origin-tagged critical fiber with forced `RowHit`, or three pairwise-distinct
consecutive blockers. `RetainedStrictInteriorParentNormalForm` is the exact
parent-facing assembly of the collision mutual-omission cycle and that
matching normal form. `RetainedMatchingSourceReturnRadiusSplit` refines source
return to joint three-center deletion or an exact-four radius partition and
builds concrete U5 ingress on both arms. `RetainedMatchingEndpointContinuation`
chooses a genuinely fourth endpoint-row source, yielding a cross hit or fresh
common deletion, and splits the three-distinct path into a closing cross hit
or a source-exact three-cycle. The old arbitrary retained-collision order analysis remains a
terminal/regression library. In particular, all five acyclic orders admit
kernel-checked exact rational models satisfying the strict cap-chain nonacute
inequalities, so those orders are not the current cap-only mining object.
The flat theorem `nonempty_retainedStrictInteriorTerminalSurface` exposes four
top-level constructors and seven concrete nested leaves directly to the
eventual parent assembler.

The production module `FrontierCoupledStrictInteriorNormalForm` strengthens
that handoff without adding a hypothesis.  For the same concrete parent
residual it constructs both the flat strict-interior surface and the refined
frontier-escape normal form.  Hence every remaining leaf may use the original
frontier pair, its retained second-apex row, and the off-radius/on-radius/
companion escape split at the same time.  This coupled object, via
`nonempty_frontierCoupledStrictInteriorNormalForm`, is the exact input to the
future direct parent contradiction; the flat surface alone is no longer the
documented assembler boundary.

The source-return U5 audit rules out a shortcut through the current bank. The
joint actual q-critical row meets its dangerous triple in at most one point.
On either exact-four side, the q-critical intersection is a singleton, the
opposite q-deleted intersection is the other pair, and the remaining triple
point is forced absent by the source-return omission. Existing two-hit and
common-bisector consumers therefore ask for structurally unavailable
incidences. Any U5 continuation must first prove new blocker-center and
cross-support confinement; the primary route remains full geometry with the
retained second apex and original frontier pair visible.

The first coupled audits make that requirement concrete.  When the collision
fresh blocker is off the first cap, it lies strictly in the surplus or second
opposite cap and yields a named U5 ingress; its collision q-critical row has
exactly one named dangerous incidence and its fresh actual q-deleted row has
intersection exactly empty, one dangerous point, or two distinct dangerous
points with the dangerous circle, never the deleted source. Global K4 also
gives an exact q-deleted/q-critical row centered at the other collision
source, and both blockers are classified into named-dangerous and
selected-candidate roles. Existing sinks still lack `p` memberships and a
second named directed incidence. When the fresh blocker is
on the first cap, all but one serial cap order (up to reversal) are linearly
infeasible, but that serial residual has a kernel-checked exact metric model
satisfying every triangle, strict-Kalmanson, cap-nonacute, and general
Ptolemy inequality.  The model has negative planar Gram determinant, so true
concyclic row equality or planar rank is the first missing force.

Source return also retains more physical information than the flat row packet
suggested.  At least one selected source survives deletion at both physical
apices and at the companion blocker; the second-apex endpoint is exactly one
of two critical cases, joint double deletion, or disjoint exact shells.  The
same proof shows the two selected sources have unequal second-apex radii, so
they cannot instantiate the obsolete K-A shared-radius existential.  A second
checked reduction consumes the whole four-way endpoint: critical cases become
protected swapped FA-UNIQ4, disjoint exact shells give full physical
second-apex robustness, and joint double deletion splits on robustness with
the nonrobust side again producing swapped FA-UNIQ4.  Source return therefore
adds no new terminal family beyond the existing robust and protected-unique
consumers; neither consumer is proved false here.

The constructor audits identify, without hiding any new producer. Every
retained collision has a production `RowHit`, but its mandatory two-center
alternation refutes the old ordered subsequence `O,A,X,J,C,K`; the ordered
constructor is not a valid target for this selector arm. The same-cap target
also collapses: its first-apex cap placement is directly inconsistent with
alternation, while an actual same-cap row through the pair has the common
blocker center. `RetainedCollisionCapLocalization` now carries these results
in production, plus strict-cap localization of the common blocker and the
exact two-source cap intersection of its shell. The next proof therefore uses
an alternation-compatible cross-fiber collision consumer and audits the
injective arm against the complete proved bank before seeking new geometry.

Another critical row through the collision pair cannot supply that consumer:
production `RetainedCollisionCapLocalization` forces its center to be the
existing common blocker. Moreover an exact rational convex eight-point model realizes
the complete local two-shell/overlap/alternation marginal. Collision closure
must therefore couple a second fiber on a different equality pair into an
ordinal cycle, or consume full-parent MEC/filter/deletion/no-`IsM44` data.

The first different-pair continuation is now production in
`RetainedCollisionDifferentPairConsumer`.  A fresh point
`J` on the first-apex row through one oriented collision source `C` supplies
`OJ = OC`.  If the actual critical shell at `J`, centered at `X`, contains the
other source `K`, then `XJ = XK`, while the collision gives `AC = AK`.  In the
compatible boundary order `O < J < C < A < X < K`, strict quadrilateral
inequalities yield `AC < AJ` from the first-apex equality and `AJ < AC` from
the other two equalities.  The actual `J`-row also forces `J,K` to alternate
across its centers `O,X`.  Together with the collision alternation of `C,K`
across `O,A`, exactly seven live order types remain, and this ordinal argument
closes two.
It is not yet the full collision proof: exact rational strictly convex local
models realize all five acyclic orders, and Lean independently kernel-checks
the first, `O < J < X < C < A < K`, with all three equality pairs.  Full
closure must therefore force a cyclic placement,
exclude those five placements using the retained parent geometry, or obtain
one more source-valid cross equality.

Checked fixed-fiber audits explain why the existential choice is necessary.
Cap localization of `BothOff` yields strong endpoint/interior shell counts but
no matching consumer. Global cardinal-minimal deletion can return the old
common blocker with either singleton source, and this literal stutter persists
when the deletion universe is the whole common shell. Neither route forces a
new center or closing row for an arbitrary `P`.

The exact-five omission cycle, its injective reverse outside-pair normal form
and cap-straddling bridge, and its mutual same-cap/equal-blocker split remain
kernel-checked fallback refinements. The oriented physical-apex ingress is
also exhaustively classified in production, and its two-exact-four complement
has a checked route to the same protected unique/common-deletion outputs. None
of these longer decompositions is load-bearing unless the direct frontier
common-deletion consumer needs their extra provenance.

The shell-curvature continuation is presently blocked at its interface, not
at the cyclic-role adapter: the role placement kernel-checks, but the current
`CounterclockwiseAngleChart` combines an unrestricted orientation-sign law
with a periodic endpoint equality, making the wrapper inconsistent. It must be
repaired to state the sign law only on non-wrapping open-window triples (or to
require distinct endpoints) and revalidated before any curvature theorem can
serve as a consumer. No conclusion obtained through the existing vacuous
wrapper counts toward closure.

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
the parent boundary from the source-faithful
`FrontierCommonDeletionRefinedNormalForm` consumer and the protected original
unique arm, then
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
mathematical content is instead the refined frontier common-deletion consumer
and the protected original unique-arm consumer described at the start of Part
V. Exact-five renewal/cycle and oriented-ingress/complement work are proved or
checked fallback refinements, not current parent dependencies.

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
| O9 | RVOL remaining branch | blocked (`P97-O18`–`P97-O20`) | If no (m,4,4) decomposition exists, a removable vertex exists. The existing LIVE case tree is complete Lean source inventory, but the preferred closure bypasses it through parent assembler `P97-O20`. |
| O10 | Shared-radius pair | open source compatibility endpoint | The current source asks for an impossible double-apex pair (V.2). It is bypassed once `P97-O20` lands and is not an active producer target. |
| O11 | LIVE-Q | open source inventory; pending parent bypass | The current tail tree contains four Q helpers / 24 holes. They are not independently dispatched while `P97-O20` is active. |
| O12 | LIVE-T1/T3 | blocked (O10) | The tail configuration with t₁ (resp. t₃) as the f₂ source point is contradictory, for each placement of q and the source and each leftover ordering. Both orbit adapters are production-wired; neither family has direct source holes, and both remain open only through O10 (V.3). |
| O13 | LIVE-C | open source inventory; pending parent bypass | The current tail tree contains seven non-p-center helpers / seven holes. They are not independently dispatched while `P97-O20` is active. |
| O14 | Card-11 slice | open scope gate | `P97-O20` should be uniform from card 11. Any higher-cardinality theorem must carry the missing lower-cardinality consumer in the same plan. |
| O15 | Compiler-axiom boundary | proved | The certificate layers of O8 contribute exactly `Lean.ofReduceBool` and `Lean.trustCompiler` to the kernel closure, and nothing else does. |
| O16 | Upstream library | proved | All library facts come from the pinned mathlib / formal-conjectures revisions. |
| P97-O17 | Exact-five and strict-interior source library | proved reductions; historical dispatcher superseded | The exact-five low-hit, common-deletion, recurrence, and strict-interior modules remain source-clean inputs to the full-parent proof. They are not dispatched as seven separate final leaves. |
| P97-O18 | Large-opposite-caps bi-apex direct contradiction | open primary mathematics | Prove `false_of_largeOppositeCapsBiApexRobust (L : FrontierLargeOppositeCapsBiApexRobustResidual B)` from the full parent geometry. `L` retains both cap-six bounds and both physical-apex blocker-image omissions; bare-`B` and fixed-initial-`H` core producers are overconstrained public targets. If the production core consumer is used internally, choose a favorable `Hfav` late and rebase the complete `R`/`B`/`L` packet before producing `CriticalFiberClosingCore`. The endpoint/PG136 branch is nonterminal fallback infrastructure. |
| P97-O19 | Protected unique arms | open external dependency | The original/swapped `FA-UNIQ4/FA-UNIQ5` residuals close through their protected consumers. |
| P97-O20 | Parent direct-`False` assembler | blocked only on `P97-O18`–`P97-O19` | Run the three cap-first exits before frontier extraction. On the large-cap robust branch extract one production `CriticalPairFrontier`, apply `originalUnique_or_commonDeletionParent`, dispatch the protected original unique arm, or construct `R`, `B`, and `L` and apply `false_of_largeOppositeCapsBiApexRobust L`. Assemble `false_of_twoLargeCaps_commonCriticalMap` before LIVE row construction. Whole-carrier banks are regression evidence, not assembly dependencies. Then remove or trivialize O10–O13 by reference mining. |

The literal source holes are O10, O11, and O13. The active closure work is
`P97-O18`–`P97-O19`, with O14 as its cardinality-scope gate and `P97-O20` as routine final
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
   path keeps the full parent data, uses the direct parent frontier split,
   closes the refined joint common-deletion consumer plus the protected
   original unique arm, and assembles a direct parent contradiction before
   that case split.

Conditionally: if the obligations of Part V are discharged, then
`erdos97_rhs` — and with it the Problem 96 target — closes with axiom set
{`propext`, `Classical.choice`, `Quot.sound`, `Lean.ofReduceBool`,
`Lean.trustCompiler`}.

Nothing stronger is claimed. The 12 current source declarations remain open;
`FrontierCommonDeletionRefinedNormalForm` is proved as a reduction, but its
joint consumer and the protected original unique arms have not yet been
proved. The exact-five total omission transition is now the immediate
source-exact consumer surface for the large-radius arm. The eventual cycle
remains useful for periodic counting, but its start may lie in a transient
tail, so it cannot by itself transport the two named continuation sources into
the all-reverse rows. The transition-global all-reverse leaf and its
full-parent co-radial outside-pair producer are open; closing that leaf alone
would not discharge the remaining robust residuals.

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
