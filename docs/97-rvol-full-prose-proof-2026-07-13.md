# Problem 97 full prose proof — the RVOL route (2026-07-13)

Status: current full prose proof of the Problem 97 formalization target,
written against kernel ground truth at commit `fd9f062f` (spine build
`1e7682fe7015`, mined 2026-07-13). This document supersedes the archived
2026-06-27 draft `p97-rvol/docs/archive/2026-06-27-stale-route-docs/97-full-prose-proof-draft.md`;
that draft predates the repo migration and the current frontier and must not
be used for proof-state guidance.

**RVOL** = `RemovableVertexOfLarge`, the removable-vertex theorem for large
counterexamples (`lean/Erdos9796Proof/P97/RemovableVertexAxiom/Base.lean:54`).
It is the descent engine of the Problem 97 proof, and it is where every
remaining unproved obligation lives. This document gives the end-to-end
argument for the published theorem, states which components are proven (with
kernel evidence), and records the exact current state of what is not.

**Overall status: NOT PROVEN.** The published claim reaches `sorryAx` through
exactly 36 named obligations (80 textual holes), all in
`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean`, all inside the non-`IsM44`
branch of RVOL. Every other layer is kernel-closed. Under the weakest-label
rule the theorem is currently CONJECTURED, with the conjecture content
localized to Part V below.

Authority note: the authoritative open-obligation list is `proof-blueprint
spine`, and the authoritative task register is
`docs/closure-matrix-2026-07-09.md` with strategy in
`docs/closure-plan-full-spec-2026-07-09.md`. This document does not replace
them; it is the mathematical narrative aligned to them as of 2026-07-13.

Rigor labels used below: **PROVEN** (pen-and-paper or Lean-formalized,
sorry-free), **CONJECTURED**, **EMPIRICALLY VERIFIED** (finite scope stated),
**HEURISTIC**. A Lean claim labeled PROVEN cites its declaration; the
evidential basis is the kernel-mined spine (49/2390 nodes open — every spine
node not descending from the 36 open obligations is sorry-free) plus the
`#print axioms` checks reproduced in the trust-boundary section.

---

## Preamble: the exact target

Formal Conjectures poses Erdős Problem 97 as:

> Does every convex polygon have a vertex with no other 4 vertices
> equidistant from it?

The upstream formal statement (pinned `formal-conjectures` revision, see
`lake-manifest.json`; `FormalConjectures/ErdosProblems/97.lean:72`):

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
  step (`P96/EuclideanPeeling.lean`), so the same 36 open obligations gate
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
itself). Following the archived draft this is abbreviated **PerVertexK4**, or
"K4", in prose. A **counterexample** is a nonempty convex-independent A with
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
(v ∈ C₁ ↔ `OnArcOpposite v₁ v₂ v₃ v`, and cyclically). Closed-cap
convention: adjacent caps share their endpoint Moser vertices, each Moser
vertex lies in exactly two caps, each non-Moser vertex in exactly one. The
**cap-sum identity** (`CapTriple.cap_sum_identity`) is

    |C₁| + |C₂| + |C₃| = n + 3.

A **surplus cap** is a cap with more than 4 points. The **(m,4,4) regime**
is the case where the two non-surplus caps have exactly 4 points each;
formally `SurplusCapPacket.IsM44` (`Cap/PartitionFromMEC.lean:443`):
`S.oppCap1.card = 4 ∧ S.oppCap2.card = 4`.

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

The trichotomy: n < 9 is impossible (counting engine, Part I); n = 9 is
impossible (base case `FiniteN9Closure`, Part II); n > 9 contradicts
minimality (descent engine, Parts III–IV). The instantiation
`UniversalProblem97` (`UniversalLocal.lean:36`) supplies
`counterexample_card_ge_nine` for `counting` and
`descent_contradicts_minimality` for `descent`; `erdos97_rhs` is that theorem
under the definitional bridge.

Kernel state at commit `fd9f062f`: the spine of `erdos97_rhs` has 2390 nodes
over 2398 declarations (72,860 lines of Lean); 49 nodes are open, all
descending from 36 sorry-carrying symbols in `U1LargeCapRouteBTail.lean`;
20 trusted certificate-shard leaves are excluded from mining but covered by
`#print axioms` on the target.

Layer-by-layer kernel closures (checked 2026-07-13 via
`proof-blueprint axioms`):

| Layer | Declaration | Axiom closure |
|---|---|---|
| Counting engine | `counterexample_card_ge_nine` | `propext, Classical.choice, Quot.sound` |
| Base case n = 9 | `FiniteN9Closure` | `propext, Classical.choice, Quot.sound` |
| RVOL pinned-surplus branch | `removableVertexOfLarge_of_isM44PinnedSurplus` | core + `Lean.ofReduceBool`, `Lean.trustCompiler` (approved) |
| RVOL non-IsM44 branch | `u1_largeCap_routeB_tail_false` | core + `sorryAx` |
| Published target | `erdos97_rhs` | core + `Lean.ofReduceBool`, `Lean.trustCompiler` + **`sorryAx`** |

---

## Part I — Counting engine: every counterexample has n ≥ 9

**Status: PROVEN (Lean).** `Problem97.counterexample_card_ge_nine`
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
cap-witness counting bridge topped by CGN8; the 2026-05-23 adversarial audit
of this route (D2 diameter exit, D6 matching count, D8 disjointness, D9
arithmetic, lower bound) passed and its requested D5 minor-arc edit is
incorporated above.

---

## Part II — Base case: no counterexample has n = 9

**Status: PROVEN (Lean).** `Problem97.FiniteN9Closure`
(`N9Endpoint/Closure.lean:56`), kernel closure core axioms only — no
`sorryAx`, no compiler axioms, no generated-certificate trust.

> **Theorem II.** No 9-point convex-independent set has PerVertexK4.

The proof threads a fixed nine-point shell through form exclusions and a
single-apex exhaustion. The shell `FiniteEndpointShell`
(`N9Endpoint/Shell.lean:39`) packages what Parts I's machinery already
yields for a hypothetical 9-point counterexample: non-collinearity, at least
3 MEC boundary points (diameter branch excluded by K4 as in D2), a non-obtuse
circumscribed Moser triangle, its cap triple, and the exact cap sum
|C₁| + |C₂| + |C₃| = 12 — so with each cap containing its two endpoint Moser
vertices, the counting is tight and the configuration is rigidly constrained.

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

**Status: PROVEN (Lean).** From the cap-sum identity: if n > 9 then
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
  `SmallerCounterexample.lean:30`) — PROVEN: erasing a removable vertex
  yields a strictly smaller counterexample (convex independence passes to
  subsets), contradicting minimality.

RVOL is assembled by a three-way split
(`RemovableVertexOfLarge_from_threeWaySplit`, applied at
`RemovableVertexAxiom/Continuation.lean:798`):

### IV.a Surplus-cap packet extraction — PROVEN

`largeK4SurplusCapPacket` extracts, from any minimal counterexample with
n > 9, a `SurplusCapPacket`: the surplus cap from Part III together with its
two opposite caps and the selected-apex vocabulary the branches consume.
Closed on the kernel spine.

### IV.b The IsM44 (pinned-surplus) branch — PROVEN under the native_decide policy

`removableVertexOfLarge_of_isM44PinnedSurplus`: if the packet is in the
(m,4,4) regime (both opposite caps exactly 4), a removable vertex exists.
Kernel closure: core + `Lean.ofReduceBool` + `Lean.trustCompiler` — the
project's approved `native_decide` trust boundary, and nothing else (no
`sorryAx`; checked 2026-07-13).

This branch is where the finite certificate infrastructure lives:

- **Pinned-surplus COMP-G bank.** The geometric residual constructs a
  finite incidence **shadow** (ten 4-element incidence masks over the ten
  labels u, v, w, s₁, s₂, s₃, P_w, P_u, Q₁, Q₂); the generated predicate
  `isValidPinnedFragment` checks the pinned-fragment side conditions, and the
  bridge `pinnedSurplusCOMPGBankBridge` (`RemovableVertexAxiom/Base.lean:71`)
  transports any valid pinned fragment into membership in the generated bank
  of 135 pinned COMP-G rows (`SurplusCOMPGBank.lean`, `rows_length = 135`)
  via a DFS-completeness argument. The finite facts (row count, mask shape,
  validity of all rows, key uniqueness, DFS-prefix bounds) are discharged by
  `native_decide`.
- **Endpoint polynomial certificates.** Each banked pattern that must be
  metrically impossible carries a Nullstellensatz-style certificate: exact
  rational polynomials with `checkCertificate` verifying the identity
  Σᵢ cᵢ·gᵢ = 1 over the pattern's generator system {gᵢ = 0}
  (`EndpointCertificate/Checker.lean:189`), which certifies infeasibility of
  the corresponding real configuration; semantic soundness of the evaluator
  is proved in `EndpointCertificate/Soundness.lean`. The evaluated checkers
  are ordinary verified Lean — no `unsafe`, no `@[implemented_by]`, no
  `@[extern]` — satisfying both conditions of the project `native_decide`
  policy.
- **ERASE classifier.** The erased-set (post-deletion) analogue is the
  `ErasedCertificate/` family — the card-{10,11} native classifier with
  soundness and coverage layers (`ErasedClassifierSound.lean` et al.),
  committed closed at `652fdfcb`; the downstream exact-pin ERASE target is
  0/1376 open and passes target-specific `proof-blueprint verify-publish`.

The former Front-B residuals of this branch —
`isM44EndpointResidualsExcluded`, `isM44PinnedSurplusResidualsExcluded`,
`isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` — are all closed
and kernel-connected (2026-07-11..13).

### IV.c The non-IsM44 branch — assembled; open through its leaves

`removableVertexOfLarge_of_nonIsM44`
(`RemovableVertexAxiom/Continuation.lean:743`): if **no** (m,4,4) packet
exists, descend through the U-lane route-B tail. The wiring is complete Lean
code: build a `CounterexampleData` D on the carrier A; minimality yields both
"no removable vertex" (`hnoRem` — else IV closes immediately) and a critical
shell system (`hcritical`); take the circumscribed cap triple; split by
`exactPair_or_nonExactSurplusBranch_of_card_gt_nine`. The exact-pair branch
produces an (m,4,4) packet, contradicting the branch hypothesis. The
remaining branch — a surplus cap whose opposite pair is **not** exact — is
closed by `u1_largeCap_routeB_tail_false` (`U1LargeCapRouteBTail.lean:9200`),
the imported p97-rvol U-lane route-B tail (58 modules, `RVOL.P97.*` →
`Erdos9796Proof.P97.*`, imported 2026-07-05).

**The route-B tail.** "U1" is the U-lane spine node discharging RVOL; "Route
B" is the branch after the exact-pair fast path is peeled off (the
non-exactness hypothesis `hnotOppExact`); the "tail" is the residual leaf.
`u1_largeCap_routeB_tail_false` reduces (complete Lean, no own holes) to the
structural bridge `u1_largeCap_routeB_tail_liveData_false`
(`U1LargeCapRouteBTail.lean:7764`), whose inputs are the **live data** of the
configuration (`U1LargeCapRouteBTailLiveData`, `:256`):

```lean
structure U1LargeCapRouteBTailLiveData
    (D : CounterexampleData) (p q t1 t2 t3 u : ℝ²) : Prop where
  dangerous : U5DangerousTriple D q p ({t1, t2, t3} : Finset ℝ²)
  exactQDeletedRadius :
    (((D.skeleton q).erase p).filter fun y => dist p y = dist p q).card = 3
  selected : U5SelectedCandidateSkeleton D q p ({t1, t2, t3} : Finset ℝ²) u
```

Semantics: q is the candidate vertex in the surplus cap whose deletion is
being tested; p is the localized replacement center; {t₁, t₂, t₃} is the U5
dangerous triple on the p-circle through q, which carries exactly three
co-radial skeleton points after q's deletion; u is the selected candidate off
that circle. Alongside the live data, the bridge receives the five
**critical source rows** (`U1Depth5.CriticalSourceRows D q t₁ t₂ t₃ u`) — for
each source point among {q, t₁, t₂, t₃, u}, a critical row: a center with an
exact selected 4-class — plus the depth-5 row packet `f2CriticalRow` centred
on the t₂-row's slot-0 point (written t₂₀ below).

The bridge's proof is a complete finite case analysis on where
`f2CriticalRow`'s center and labels can sit; its leaves are the open
obligations of Part V.

---

## Part V — The open frontier: 36 obligations

**Status: OPEN.** All remaining `sorry`s: 36 symbols / 80 textual holes in
`U1LargeCapRouteBTail.lean` (matrix reconcile table; `proof-blueprint symbols
--with-sorry` reports exactly these). Everything in this part is stated with
the closure-matrix labels as of 2026-07-13; do not upgrade any of them.

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
    (q at label i, source at label j ≠ i), two orderings each (24 holes);
  - t₂ = t₂₀: **closed** — the chain `false_of_center_p_t2_t20 →
    false_of_largeCap_pCentered_t2Source_exactDangerousRow →
    false_of_twoLargeCaps_pCentered_t2Source →
    exists_removableVertex_of_twoLargeCaps` is complete Lean whose sole open
    dependency is `DoubleApexOffSurplusSharedRadiusPair` (1 hole);
  - t₃ = t₂₀: **LIVE-T3**, twelve helpers, two orderings each (24 holes).

Total: 7 + 24 + 24 + 1 + 24 = 80 holes across 36 symbols.

### V.2 The shared-radius pair obligation (K-A-PAIR)

`U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`
(`U1LargeCapRouteBTail.lean:2516`, hole at `:2561`). Matrix label:
**OPEN-RESEARCH (actual surface card ≥ 11; selected-four/equality/blocker
routes negative)**.

Statement (conclusion, prose): under the full two-large-cap leaf hypotheses —
surplus cap > 4 at index i containing q, a second cap ≥ 5 at j ≠ i (supplied
by `exists_secondLargeCap_of_noM44`, PROVEN), no (m,4,4) packet, n > 9,
critical shell system, the live data, and the t₂-row centred at p with
support {q, t₁, t₂, t₃} — there exist two distinct carrier points x, w′ ∈ A,
both **off the surplus cap**, and radii r, ρ with

    dist(x, a₁) = dist(w′, a₁) = r  and  dist(x, a₂) = dist(w′, a₂) = ρ,

where a₁, a₂ are the two opposite Moser apices of the leaf's surplus packet
(`leafSurplusPacket`). That is: a pair co-radial from **both** opposite
apices simultaneously.

The downstream is fully PROVEN (core axioms): such a pair fires
`U2NonSurplusSqueeze.oppCap2_escape_gen` — the off-surplus membership
supplies the same-side sign via
`signedArea2_mul_pos_of_not_mem_surplusCap_gen`, and the two-circle
reflection kernel contradicts it — so
`exists_removableVertex_of_twoLargeCaps` (`:2585`) closes the t₂ branch with
no other input. The conclusion is unsatisfiable over ℝ², so proving the
obligation means deriving the leaf contradiction: the open content is the
counting/metric question

> does (≥5, ≥5, 4) + center-K4 + the critical shell **force** the two ≥5
> caps to overflow the apex exact-radius classes into a double-apex
> coincidence?

**Cardinality contract (load-bearing).** The declaration carries only
`9 < |A|`. The two-large-cap arithmetic gives 11 ≤ |A|
(`Census554.card_ge_eleven_of_twoLargeCaps`, PROVEN), and **no card-11 kill
exists**: `Census554.false_of_cardEleven_twoLargeCaps` (A11-CONSUME) was
never built (matrix: OPEN-PROOF, CONDITIONAL CRITICAL). A producer uniform
only from card ≥ 12 therefore cannot by itself remove this sorry; it would
additionally need A11-CONSUME plus the source-visible card split (A11-WIRE,
OPEN-PROOF). The earlier claim that card 11 was closed independently was
found circular and retracted (audit `2026-07-13-closure-plan-audit.md`,
AUDIT-1); current plans treat card 11 as open.

### V.3 The liveData families (K-A-LIVE)

Matrix label: **OPEN-RESEARCH (actual surface card ≥ 11; T1/T3 reduction
checked; LIVE-C incidence route negative)**.

- **LIVE-T1 / LIVE-T3 (48 holes):** reduced. `triple_relabel_adapters.lean`
  kernel-checks orbit adapters replacing all 48 leaves with two K-A-PAIR
  calls (CHECKED-REDUCTION 2026-07-13). This is dependency reduction, not
  closure — the adapters intentionally inherit K-A-PAIR's `sorryAx` and the
  wiring is pending; the 48 holes close if and only if K-A-PAIR closes.
- **LIVE-Q (24 holes):** OPEN-RESEARCH. Needs one consumer invariant under
  the 24 support-label permutations; not reduced to K-A-PAIR.
- **LIVE-C (7 holes):** OPEN-RESEARCH, one per center branch. The
  incidence-only route is DONE-NEGATIVE (`ATAIL-LIVE-INCIDENCE`: all seven
  branches satisfiable at the incidence level — incidence-only forcing is
  terminal at this interface). The retained-provenance route is
  positive-but-insufficient (`ATAIL-LIVE-PROVENANCE`, CHECKED-SCRATCH):
  `live_critical_provenance.lean` forces
  2 ≤ |f2Row.support \ {q, t₁, t₂, t₃}| in all seven helpers, but that is a
  one-center off-dangerous pair, not the two-center off-surplus pair K-A-PAIR
  needs.
- **LIVE-BANK-MATCH:** DONE 2026-07-12, NEGATIVE terminal — 1,422
  (leaf, consumer) pairs against the mined theorem banks produced 0 matches.
  No existing bank lemma wires any liveData leaf; a new producer is required.

Both clusters therefore reduce to the **same missing producer**
(LIVE-SHARED-PRODUCER / ATAIL-ROW-PRODUCER, both OPEN-RESEARCH, PRIMARY).

### V.4 What is PROVEN around the gap

Consumer/sink side, all kernel-checked with core axioms and target-built:

- `outsidePair_unique_capCenter` and the scratch
  `DangerousRowSameCapSecondCenter` consumers
  (`same_cap_second_center.lean`): the routine dangerous-row outside-cap
  pair and u-row separation are closed; a second distinct same-cap
  equidistant center closes the leaf immediately.
- The five-row metric core (`normalized_fiveRow_metric_core_false`,
  `false_of_five_selectedFourClasses`).
- Production cores `NestedEqualChordCore`, `MECStraddlingRowCore`,
  `SixPointTwoCircleOrderCore`, `SixPointNestedCenterOrderCore`,
  `SixPointCircleChainOrderCore` (all PROVEN, production targets built
  2026-07-13).
- The fiber extractor `exists_doubleApex_pair_of_joint_filter_card_ge_two`
  (sorry-free, unimported scratch).
- ATAIL-SUB2 (PROVEN, audited, landed as `Sub2Certificate.lean` — no QE, no
  `native_decide`), supplying three reusable cuts: m ≤ 2, vertex-pair packets
  s = 0, and s = 2 straddle-only.

Three viable producer interfaces are named, each with its kernel-checked
consumer already closed: (i) a same-cap bisector hit feeding
`URowCapMultiplicityFields` → `outsidePair_unique_capCenter`; (ii) four
global-row memberships feeding `HasGlobalNestedPairProducer` →
`NestedEqualChordCore`; (iii) sixteen selected-K4 memberships feeding
`false_of_five_selectedFourClasses`. In every case the **producer** —
deriving the interface's fields from the live hypotheses — is the open part
(CONJECTURED; the bounded evidence does not yet prove which interface is
forced).

### V.5 Routes ruled out (PROVEN-NEGATIVE / DONE-NEGATIVE)

- Marginal radius counting cannot force the pair: apex classes keep ≥ 3
  off-surplus points with distinct opposite radii
  (`doubleApexJointFiber_sdiff_surplus_card_le_one` — the joint fiber
  off-surplus has card ≤ 1, so marginal K4 counting is provably
  insufficient).
- Blocker cycles / global-K4 graphs: refuted by a 12-vertex abstract and a
  33-point Euclidean (non-convex) countermodel.
- Global ordered-cap counting at card 12: per-cap budget m + 4 leaves slack;
  DONE-NEGATIVE.
- Dangerous-source blocker collapse: all four dangerous sources can be
  overridden to `centerAt = p`; CHECKED-NEGATIVE.
- Equality-only replay: all 343 skeletons admit real-algebraic
  separator-satisfying witnesses; DONE-NEGATIVE.
- Q3 selected-four / two-center window: DONE-NEGATIVE 2026-07-13. The sweep
  classifies 87 mirror-reduced joint classes — 72 realized exactly (68 over
  ℚ, 4 over ℚ(√3)) and 15 reported killed (hand/Z3 provenance; the
  checkpoint does **not** independently replay those 15 kill proofs). Even
  applying all joint kills at all three Moser pairs simultaneously, a
  token-level assignment survives for every one of the 22 unordered cap
  profiles at cards 12–16, before and after the SUB2 cuts. Conclusion: a
  single selected-four two-center window is terminal as a closure mechanism;
  `hcritical` is load-bearing, and cross-center coupling beyond
  independently-selected four-point windows is required.
- Incidence-only forcing at the LIVE-C interface: 7/7 satisfiable;
  terminal.
- Direct solver attack on the full system: msolve / Z3 / cvc5 pilots all
  DONE-NEGATIVE-TRACTABILITY (7/7 timeouts each).

### V.6 Bounded/CAS evidence (not proofs)

- CARD-EQ-12 shadows (4,5,6) and (5,5,5): the full 36-equality ideals give
  Singular + msolve `UNIT` — labeled **TRUSTED EXACT-CAS, NONEXHAUSTIVE**
  (exact computer algebra on two fixed profiles; not a theorem, not a cover).
- Common-system CEGAR: 128/128 cross-checked UNIT rounds, but stopped on
  round budget, not exhaustion.
- The card-12 placement surface has 367,206 representatives; blind
  per-representative CAS is ruled out as a route.
- These are evidence that the pair-forcing statement is plausible on the
  card-12 slices tested; none of them bounds the general case.

### V.7 Census-554 and the card-11 slice

The card-11 census infrastructure (A11-GEO/MOTIF/EMBED/COVER-REL rows) is
DONE, sorry-free, core axioms. The exhaustive run A11-RUN is
**TERMINAL-COMBINED-FRONTIER** (2026-07-13): the oracle-13 successor exited
cleanly at iteration 316 with 2,464,637 learned exclusions and
status = combined-frontier — explicitly the bounded oracle's terminal
residual, **not** UNSAT and not Lean closure. The residual motif bank is
paused at 5,939 rows (structural audit passed; the full 141 GB exact replay
was not run). Census-554 is the paused conditional card-11 alternate: it
returns to the critical path only if the eventual producer starts at
card ≥ 12.

### V.8 The card ≥ 12 tail regimes

- **Card ≥ 15 uniform tail: FALSIFIED.** The relaxed uniform pattern-cover /
  ideal-theoretic lemma is false at every separator level for n ≥ 15, with
  exact-integer/50-digit falsifiers (W15, W16 variants, concentric octagons
  n = 16, decagon pair n = 20). All falsifiers are **non-convex**, so the
  `ConvexIndep` leaf itself is untouched — but no dead-pattern bank can cover
  the tail uniformly. The row-decorated remnant (Candidate B) is also false.
- **Cards 12–14: nonconvergent.** Sampled profiles are dead (n = 13:
  300/300; n = 14: 160/160; kills localize to ≤ 8-point windows) but the
  sole n = 12 profile run did not converge and omitted two labeled profiles;
  the AHEAD lane is authorized but software-gated, and dead samples are not
  coverage. EMPIRICALLY VERIFIED within the sampled scope only.
- **Only non-excluded route: convexity-coupled Candidate D** — synthetic
  convexity-coupled forcing of the shared-radius pair. Its smallest object
  (the Q3 two-center window) is now exhausted negatively, so what remains is
  exactly the live producer question of V.4: cross-center coupling that
  actually uses `hcritical` and convexity.

### V.9 Structural blockers on the current surface

Named for future producers (all DONE-AUDIT / PROVEN at the current
declaration surface):

- **Provenance erasure:** the pair target receives `rows` and the critical
  shell system independently, with no shared-system provenance — erasing the
  mechanism by which `hcritical` could constrain the specific u-row.
- **Sixth-row scope:** the pair surface carries only the five abstract
  critical source rows (q, t₁, t₂, t₃, u); it does not receive
  `f2CriticalRow` or the two comparison maps. A closing producer must either
  add a sixth critical row plus a theorem consuming it, the (Q)_C5 fragment,
  an equivalent incidence theorem, or a complete branch split feeding the
  metric-residual sink (COMP-1 obstruction, recorded in the LiveData
  docstring).

Dead-end log: see `docs/dead-ends.md` — in particular
`doubleapex-card12up-uniform-pattern-lemma` (falsified),
`doubleapex-card12up-per-type-window-kills` (closed),
`blocker-digraph-cardinality` (collapses to (Q)), global isosceles counting
(route a, closed-negative), decorated order-type encoding (no-go: chirotopes
carry no metric), continuous SMT (exhausted), and
`u2-oppcap2-escape-rvol-vocabulary` (attic; do not resurrect rvol-era
escape-branch statements off-spine).

---

## Trust boundary and axiom audit

Checked 2026-07-13 (`proof-blueprint axioms`, reproducible via
`#print axioms` after `lake build`):

- `Problem97.erdos97_rhs` today: `propext, Classical.choice, Quot.sound,
  Lean.ofReduceBool, Lean.trustCompiler, sorryAx` — the `sorryAx` traces
  exactly to the 36 Part-V symbols.
- After the 36 obligations close, the closure becomes the Lean core axioms
  plus `Lean.ofReduceBool` and `Lean.trustCompiler`, from `native_decide` in
  the generated certificate shards (`SurplusCOMPGBank*`,
  `EndpointCertificate/*`). This complies with the project `native_decide`
  policy (2026-06-05): the compiler-trust cost is explicit and kernel-
  reported, and every evaluated decision procedure is ordinary verified Lean
  with no `unsafe`, `@[implemented_by]`, or `@[extern]` in its closure.
- The counting engine and the n = 9 base case individually close on
  `propext, Classical.choice, Quot.sound` alone — no compiler trust.

---

## Completion matrix

Statuses: ✅ done (PROVEN only) / 🟡 partial / ⬜ open. The theorem's overall
label is the weakest among load-bearing rows.

| # | Obligation | Statement | Label | Status | Evidence |
|---|---|---|---|---|---|
| O1 | Upstream bridge | local statement = RHS of `erdos_97` | PROVEN (Lean) | ✅ | `upstream_iff` is `Iff.rfl`; pinned formal-conjectures |
| O2 | Induction wrapper | trichotomy assembly by strong induction | PROVEN (Lean) | ✅ | `UniversalProblem97_of_reduction` |
| O3 | Counting engine | counterexample ⇒ n ≥ 9 | PROVEN (Lean) | ✅ | `counterexample_card_ge_nine`; core axioms (checked 2026-07-13) |
| O4 | Base case | no n = 9 counterexample | PROVEN (Lean) | ✅ | `FiniteN9Closure`; core axioms (checked 2026-07-13) |
| O5 | Cap-sum bridge | n > 9 ⇒ surplus cap | PROVEN (Lean) | ✅ | `cap_sum_identity`, `exists_surplus_cap_of_card_gt_nine` |
| O6 | Descent glue | removable vertex ⇒ smaller counterexample | PROVEN (Lean) | ✅ | `smaller_counterexample_of_removable`, `descent_contradicts_minimality` |
| O7 | RVOL packet extraction | minimal, n > 9 ⇒ `SurplusCapPacket` | PROVEN (Lean) | ✅ | `largeK4SurplusCapPacket`; closed on spine |
| O8 | RVOL IsM44 branch | (m,4,4) packet ⇒ removable vertex | PROVEN (Lean, native_decide policy) | ✅ | `removableVertexOfLarge_of_isM44PinnedSurplus`; core + 2 compiler axioms (checked 2026-07-13) |
| O9 | RVOL non-IsM44 assembly | no-(m,4,4) ⇒ removable vertex, via tail | CONJECTURED (inherits O10–O14) | 🟡 | `removableVertexOfLarge_of_nonIsM44` → `u1_largeCap_routeB_tail_false`; assembly is complete kernel-checked Lean, leaves open |
| O10 | K-A-PAIR | double-apex off-surplus shared-radius pair | CONJECTURED | ⬜ | `DoubleApexOffSurplusSharedRadiusPair`; OPEN-RESEARCH, surface card ≥ 11; {{NEEDS_PROOF}} |
| O11 | LIVE-Q | 4 helpers × 6 label orderings | CONJECTURED | ⬜ | OPEN-RESEARCH; 24 holes; {{NEEDS_PROOF}} |
| O12 | LIVE-T1/T3 | 24 helpers × 2 orderings | CONJECTURED (reduced to O10) | ⬜ | CHECKED-REDUCTION 2026-07-13; inherits `sorryAx`; wiring pending |
| O13 | LIVE-C | 7 center branches | CONJECTURED | ⬜ | OPEN-RESEARCH; incidence-only route DONE-NEGATIVE; {{NEEDS_PROOF}} |
| O14 | Card-11 slice | kill card 11 in the two-large-cap regime, or produce uniformly from card 11 | CONJECTURED | ⬜ | A11-CONSUME never built (OPEN-PROOF, CONDITIONAL CRITICAL); census bound 11 ≤ card PROVEN |
| O15 | Certificate trust | `native_decide` shards within policy | PROVEN (Lean + policy) | ✅ | kernel-reported `ofReduceBool`/`trustCompiler`; verified checkers |
| O16 | mathlib / formal-conjectures | upstream library | PROVEN (Lean) | ✅ | pinned revisions in `lake-manifest.json` |

Load-bearing open rows: O10–O14. **Overall: the target `erdos97_rhs` is
currently CONJECTURED**, with the entire conjectural content equal to the
Part-V producer question (O11 and O13 are additionally not yet reduced to
O10).

---

## Conclusion: what is proven today

Unconditionally PROVEN (Lean, kernel-checked):

1. Every counterexample has at least 9 points (core axioms only).
2. No 9-point counterexample exists (core axioms only).
3. Every minimal counterexample with more than 9 points that admits an
   (m,4,4) surplus-cap packet contains a removable vertex (core + approved
   compiler axioms).
4. In the remaining case (no (m,4,4) packet), the configuration is reduced —
   by complete, kernel-checked case analysis — to 36 named finite-branch
   obligations about the depth-5 critical-row configuration of a single
   surplus-cap candidate, of which 25 (the T1/T3 orbit plus the t₂ branch)
   further reduce to the single shared-radius pair producer K-A-PAIR.

Conditionally: if the 36 obligations of Part V are discharged, then
`erdos97_rhs` — and with it the Problem 96 target — closes with axiom set
{`propext`, `Classical.choice`, `Quot.sound`, `Lean.ofReduceBool`,
`Lean.trustCompiler`}.

Not proven, and not claimed: any statement that the two ≥5 caps force the
double-apex coincidence (K-A-PAIR), any card-11 kill, any uniform card ≥ 12
pattern cover (falsified as stated), and any closure value for the bounded
census/CAS evidence beyond its stated finite scope.

## What next

The ranked directions are owned by
`docs/atail-force-producer-plan-2026-07-13.md` and the closure matrix; in
summary: (1) the uniform live producer for one of the three named consumer
interfaces (V.4), preferably uniform from card 11; (2) failing uniformity,
A11-CONSUME plus the source-visible card split to cover card 11 separately;
(3) LIVE-Q and LIVE-C consumer invariants (or their reduction to K-A-PAIR),
which are required even after K-A-PAIR closes.

## References

1. Adrian Dumitrescu, *On Distinct Distances from a Vertex of a Convex
   Polygon*, Discrete & Computational Geometry 36 (2006), 503–509.
   (Provenance for Part I; proved internally.)
2. Gabriel Nivasch, János Pach, Rom Pinchasi, Shira Zerbib, *The number of
   distinct distances from a vertex of a convex polygon*, Journal of
   Computational Geometry 4 (2013), 1–12; arXiv:1207.1266. (Provenance.)
3. `formal-conjectures`, pinned revision per `lake-manifest.json` (upstream
   problem statement and vocabulary).
4. Project documents: `docs/closure-plan-full-spec-2026-07-09.md`,
   `docs/closure-matrix-2026-07-09.md`,
   `docs/atail-force-producer-plan-2026-07-13.md`, `docs/audits/2026-07-13-*`,
   `docs/dead-ends.md`.
