# Pentagon circumfan schemas — completing the bisector-direction lane

Date: 2026-08-19. Status: PLAN + PROOFS. External review draft for the
`rigid221-pentagon-bisector-direction-plan-2026-08-05.md` lane and the
exact-17 cap-nine Lean-to-SAT route.

Evidence-status labels follow the closure evidence status ledger:
{{PROVED-HERE}} = complete prose proof in this document, Lean pending;
{{NEEDS-LEAN}} = statement fixed, proof routine, formalization outstanding;
{{NEEDS-BANK-DEDUP}} = possibly subsumed by an existing banked motif — diff
before promoting; {{USED-LEAF-FACT}} = consumed as a leaf hypothesis exactly
as pinned in §1 of the 08-05 plan / the exact-17 `SourceRealization`; read
in-repo but not kernel-replayed by the author of this draft.

Headline: the five pentagon-edge bisectors all pass through the apex `P`,
because `P` is the circumcenter of the class. Treating them as a *fan at `P`*
and exploiting the fact that the three on-class blockers are forced to be
**arc midpoints** of the class circle rigidifies the entire seven-point
cap-interior order. In particular:

1. §3.1–§3.3 of the 08-05 plan ({{NEEDS_PROOF}} there) are proved below
   (K0, K2, K5), plus a strengthening: **the class lies in an open
   half-circle** (K1), which removes every antipodal/branch degeneracy
   downstream.
2. The class acquires forced arc coordinates `(0, a, 1.5a, 2a, 4a)` with
   `4a < π` (Theorem A), a **total strict order on all ten class distances**
   (Theorem B), and exact localization of the off-class witnesses `c`, `e`
   on their bisector rays beyond the chord midpoints (K3).
3. The derived cap-interior boundary order is exactly
   `u, v, c, deleted, xv, e, xu` (Theorem D). Consequence: **the second
   source-forced named order (`NamedOrder = 1`, the `…, deleted, e, xv, …`
   order) is infeasible.** This is a single unit cut on the exact-17 CNF's
   order block and retires the O2 half of every family/order orbit.
4. Each pentagon-edge bisector carries exactly the two carriers
   `{witness, P}` (their proved `Dumitrescu.perpBisector_apex_bound`), and
   the two `(witness, P)` boundary arcs are exactly the strict
   closer-to-`p` / closer-to-`q` sides (Theorem C) — an order-coupled
   comparison family plus a directly Booleanizable membership-nogood family.

None of this closes the leaf: the residual freedom (the next-row center `d`,
its support, and the outside points) is untouched, exactly as the 08-05
response predicted ("the actual research gap is the final fan consumer").
What it does is (i) discharge the lane's three open steps, (ii) delete half
of the CNF's order space by theorem rather than by search, and (iii) supply
clause families that are provably outside the Kalmanson/metric-cone closure,
i.e. of the kind twenty-one consecutive `SAT` children cannot have mined.

---

## 0. Dedup checklist ({{NEEDS-BANK-DEDUP}})

Before banking, diff against:

- `TwoCenterBisectorParity.lean` — the pairwise interleaving kill. K5/Theorem
  C(a) below strictly contains its configuration but the *fan* content
  (five lines concurrent at `P`, Theorem D) is a different mechanism.
- The root-20 mined motif "two-center bisector order". If that motif already
  orders two witnesses on distinct bisectors through a shared carrier, part
  of Theorem D may be represented; the full seven-point rigidity and the O2
  unit cut are not, since the 08-11 route spec still generates *both*
  source-forced named orders through child 21.
- `PerpBisectorEqualityChainSchemas.lean` — the three-on-a-bisector kill.
  Theorem C(b)'s membership nogoods may partially overlap its orbit; the
  `P`-as-first-witness instantiations (free, from the class row) may not.
- `Census554.ConvexFivePointCore` and the "convex-five order" motif — these
  are model-cut clause banks (e.g. `ConvexFivePointThirdRows` adds four
  clauses from a specific terminal model); no overlap with the circumcenter
  mechanism was visible on inspection, but the name collision warrants a
  check.
- `Dumitrescu.perpBisector_apex_bound` — used here as an ingredient (≤ 2
  carriers equidistant from a pair), not reproved.

Liveness evidence for the O2 cut: `p97-exact17-cap9-lean-to-sat-route-v1.md`
(2026-08-11) states the extended C–G bank "generates both source-forced
named orders, both cyclic directions, all 17 cuts"; if O2 had been refuted
the order block would be unit already. Hence the cut is believed new.

---

## 1. Leaf hypotheses consumed ({{USED-LEAF-FACT}})

All facts are pinned in §1 of
`rigid221-pentagon-bisector-direction-plan-2026-08-05.md` (proved at commit
`32719ca9` per that plan) or in the exact-17 `SourceRealization`
(`BlockerVExactSeventeenSourceNormalForm.lean`), under the ambient leaf
hypotheses of `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge`
and its `pentagonBlockerV` / exact-17 cap-nine descendants:

- H1. `D.convex : ConvexIndep D.A` — the carrier set is in strictly convex
  position. Corollary used freely: **no three carriers are collinear**
  (a middle collinear point lies in the hull of the other two).
- H2. The physical apex `P := S.oppApex2 ∈ D.A` and the class
  `C = {u, xu, deleted, v, xv}` of five pairwise-distinct carriers with
  `dist P q = ρ > 0` for all `q ∈ C`, and `|C| = 5` exactly. Write
  `Γ := sphere P ρ`, so `C ⊆ Γ`. `P ∉ C` (ρ > 0).
- H3. The five pentagon-edge equalities, i.e. each cycle edge's bisector
  carries its blocker: `dist xv u = dist xv xu` (row `u`, `centerAt u = xv`),
  `dist v xv = dist v u` (row `xv`, `centerAt xv = v` — the BlockerV branch),
  `dist deleted v = dist deleted xv` (row `v`), `dist c v = dist c deleted`
  (row `deleted`, `c := centerAt deleted`), `dist e deleted = dist e xu`
  (row `xu`, `e := centerAt xu`). All centers are carriers distinct from `P`
  (`secondApex_robust.centerAt_ne`).
- H4. Exact-17 order data (`position` tables, orders 0 and 1): the class
  suborder along the cap is `u, v, deleted, xv, xu` in both named orders;
  `c` lies strictly between `v` and `deleted`, and `e` strictly between
  `deleted` and `xu`, in both; `P` is not in the nine-point cap, so the
  cap-interior arcs used below do not contain `P`. Label dictionary
  (order-0 positions): `ℓ=0, u=6, v=8, c=11, deleted=10, xv=9, e=12, xu=7,
  r=2`; outside `{1,3,4,5,13,14,15,16}`.
- H5. `Dumitrescu.perpBisector_apex_bound`: at most two carrier points are
  equidistant from any two distinct carrier points (proved bank).

Everything below is a consequence of H1–H5 alone, so every schema is
gate-A eligible for the exact-17 route ("its only inputs are hypotheses of
the live cap-nine leaf") and cardinality-generic where stated.

Notation, following the plan: `Z x := x − P`; for `q ∈ C`, `‖Z q‖ = ρ`.
`cross(a, b)` denotes the scalar 2D cross product (their `signedArea2` up to
the factor ½ and a base point).

---

## 2. Kernel lemmas

### K0 (half-plane; = plan §3.1). {{PROVED-HERE}}

There is `w : ℝ²` with `⟪Z q, w⟫ > 0` for every `q ∈ C`.

*Proof.* `C ⊆ D.A \ {P}`, so H1 gives `P ∉ convexHull ℝ (C : Set ℝ²)`
(ConvexIndep excludes `P` from the hull of the other carriers, a fortiori
from the hull of `C`). `convexHull` of a finite set is compact hence closed
and it is convex and nonempty; strict separation of the point `P` from it
(`geometric_hahn_banach_point_closed`) yields `w` and `c₀` with
`⟪w, P⟫ < c₀ < ⟪w, q⟫` for all `q ∈ C`; subtract. ∎

### K1 (open half-circle). {{PROVED-HERE}} New.

The five class points lie in an **open half-circle of Γ**: their directions
`Z q / ρ` lie in the open half-plane `{x : ⟪x, w⟫ > 0}`. Consequences used
throughout: no class pair is antipodal (`Z p + Z q ≠ 0` for all
`p ≠ q ∈ C`); the class's angular span about `P` is `< π`; every
"near arc midpoint" and every sum-direction formula below is
branch-free.

*Proof.* Immediate from K0. If `Z q = −Z p` then `⟪Z q, w⟫ = −⟪Z p, w⟫ < 0`,
contradiction. Choosing angle coordinates `α(q) := ∠(Z q)` inside the open
half-plane, the five angles lie in an open interval of length `< π`. ∎

Remark (general schema, cardinality-generic): *any* exact-`k` class about a
carrier apex in a ConvexIndep set lies in an open half-circle of its
circle. This is bankable on its own and is what silently powers §3.2–§3.4
of the plan.

### K2 (bisector direction and on-class witnesses; = plan §3.2 + §3.3). {{PROVED-HERE}}

Let `p ≠ q ∈ C` and let `z ∈ D.A`, `z ≠ P`, with `dist z p = dist z q`.
Then:

1. `⟪Z z, Z p − Z q⟫ = ½(‖Z p‖² − ‖Z q‖²) = 0`, so `Z z` lies in the line
   `(Z p − Z q)^⊥ = ℝ • (Z p + Z q)` (the span is one-dimensional and
   contains `Z p + Z q ≠ 0` by K1, and
   `⟪Z p + Z q, Z p − Z q⟫ = ‖Z p‖² − ‖Z q‖² = 0`). Hence
   `Z z = t • (Z p + Z q)` for a unique `t ≠ 0`. Equivalently, the full
   perpendicular bisector of `p q` is the line `P + ℝ • (Z p + Z q)` — it
   passes through `P` because `P` is equidistant from `p, q` (H2).
2. If moreover `z ∈ C` (an on-class witness), then `t > 0` and
   `t = ρ / ‖Z p + Z q‖`; in angle coordinates (K1),
   `α(z) = (α(p) + α(q))/2` — `z` is the **near arc midpoint** of the class
   pair. *(Plan §3.3 falls out: `t > 0` from `⟪Z z, w⟫ > 0` and
   `⟪Z p + Z q, w⟫ > 0`; the norm pins `|t|`; and
   `Z p + Z q = 2ρ cos((α(q)−α(p))/2) · e((α(p)+α(q))/2)` with the cosine
   positive by K1, so the direction is the mid-angle direction.)*
3. Linear independence (plan §3.3): distinct class points give linearly
   independent `Z`-vectors — `Z p = λ • Z q` with equal norms forces
   `λ = ±1`; `λ = −1` is K1-excluded, `λ = 1` forces `p = q`. ∎

### K3 (off-arc witness parameter `t > ½`). {{PROVED-HERE}} New; covers `c` and `e`.

Let `p ≠ q ∈ C`, and let `z ∈ D.A \ {P}` with `dist z p = dist z q`, lying
(in the cyclic order of the carriers) **on the open `p`–`q` boundary arc
that does not contain `P`**. Then in the K2 parametrization
`Z z = t • (Z p + Z q)` one has `t > ½`; i.e. `z` lies on the positive
bisector ray strictly beyond the chord midpoint `(p+q)/2`. In angle
coordinates, `α(z) = (α(p)+α(q))/2` — the same mid-angle as the near arc
midpoint, with `‖Z z‖ = t‖Z p + Z q‖` free.

*Proof.* By H1 no carrier other than `p, q` lies on line `p q`; the two
open boundary arcs determined by the chord `p q` lie in the two open
half-planes of that line, and `P` lies in the one containing its own arc.
So `z` and `P` are strictly on opposite sides of line `p q`. The bisector
`L = P + ℝ • (Z p + Z q)` is perpendicular to `p − q = Z p − Z q`, hence
meets line `p q` in exactly one point, namely the midpoint
`M = (p+q)/2 = P + ½ • (Z p + Z q)`. The affine side function
`f(x) = ⟪x − M, Z p + Z q⟫` satisfies
`f(P + s • (Z p + Z q)) = (s − ½)‖Z p + Z q‖²` and vanishes exactly on line
`p q` along `L`; `f(P) < 0`, and `z` on the opposite side gives `f(z) > 0`,
i.e. `t > ½`. ∎

### K4 (vertex fan order). {{NEEDS-LEAN}} Standard convexity.

Cut the carrier cyclic order at `P`. For carriers `y ≠ y′`, both `≠ P`:
`y` precedes `y′` in the cut order iff the triple `(P, y, y′)` is
positively oriented, i.e. `cross(Z y, Z y′) > 0` (this is the fan property
of a convex polygon from any vertex; in the repo's vocabulary it is the
`IsCcwConvexPolygon` triple condition specialized to triples containing
`P`, with strictness from no-three-collinear). When additionally all the
compared directions lie within a common open half-plane — as all seven
directions below do, by K1 for the class and by K2/K3 mid-angle formulas
for `c, e`, whose angles lie inside the class's angular hull — cross-sign
order coincides with angle order.

### K5 (bisector exhaustion + constant-side arcs). {{PROVED-HERE}} (from H5)

For each pentagon edge `{p, q}` with blocker `z` (H3):
`{x ∈ D.A : dist x p = dist x q} = {z, P}` (H5, since `z ≠ P` and both are
equidistant carriers). Moreover the bisector line `L` meets the polygon
boundary in exactly two points — it contains the interior point `M` — and
those two crossings are `z` and `P` themselves (both are boundary points on
`L`, and a third boundary point of `L` is impossible for a line meeting the
interior of a convex region). Hence each of the two open `(z, P)` boundary
arcs lies strictly on one side of `L`: one arc consists entirely of points
strictly closer to `p`, the other entirely of points strictly closer to
`q` (the arc containing `p` is the `p`-closer one). ∎

---

## 3. Theorem A (forced arc coordinates). {{PROVED-HERE}}

Under H1–H4 there is `a` with `0 < 4a < π` such that, in angle coordinates
about `P` normalized by `α(u) = 0` and oriented along the class order,

    α(u) = 0,  α(v) = a,  α(deleted) = 1.5a,  α(xv) = 2a,  α(xu) = 4a.

*Proof.* By H2 the class lies on `Γ`; by K1 its angles fit in an open
interval of length `< π`; by K4 the angular order equals the boundary
order `u, v, deleted, xv, xu` (H4). The three on-class blockers (H3) are
near arc midpoints by K2(2):

    α(v)       = (α(u) + α(xv)) / 2        (centerAt xv = v)
    α(deleted) = (α(v) + α(xv)) / 2        (centerAt v = deleted)
    α(xv)      = (α(u) + α(xu)) / 2        (centerAt u = xv)

Setting `α(xu) =: 4a` and solving: `α(xv) = 2a`, `α(v) = a`,
`α(deleted) = 1.5a`; the half-circle bound gives `4a < π`. ∎

The one-parameter rigidity (`a`, plus the global similarity) is exactly the
"pure module arithmetic" §3.4 of the plan asked for, done.

## 4. Theorem B (total strict order of the ten class distances). {{PROVED-HERE}}

With `chord(β) = 2ρ sin(β/2)` strictly increasing on `(0, π)` and all class
gaps `< π` (Theorem A), the ten pairwise class distances are **totally
ordered with two forced equalities**, independent of `a`:

    dist v deleted = dist deleted xv                     (= ρ_deleted, gap ½a)
      <  dist u v = dist v xv                            (= ρ_v, gap a)
      <  dist u deleted                                  (gap 1.5a)
      <  dist u xv = dist xv xu                          (= ρ_xv, gap 2a)
      <  dist deleted xu                                 (gap 2.5a)
      <  dist v xu                                       (gap 3a)
      <  dist u xu                                       (gap 4a).

In particular the three blocker radii are forced:
`ρ_deleted < ρ_v < ρ_xv`, with `dist u deleted` strictly between the last
two, and `dist u xu` is the strict class diameter. All strict, no branch
cases. ∎

Booleanization: each comparison is a radius/distance-order atom. If the
308-variable dictionary carries comparison atoms (cf. the
`KalmansonRadiusOrderReversal` vocabulary) these are direct unit/binary
clauses; otherwise they are theorem-bank facts for the mining lane and for
the Lean side of any future `UNSAT` composition.

## 5. Theorem C (the circumfan: exhausted bisectors and side splits). {{PROVED-HERE}}

For each pentagon edge `{p, q}` with blocker `z ∈ {xv, v, deleted, c, e}`:

(a) *(exhaustion nogood, directly Booleanizable)* For every carrier
`x ∉ {z, P}`: **no circle centered at `x` contains both `p` and `q`** —
in row atoms, `¬(p ∈ R_x ∧ q ∈ R_x)`. Five edges × all carriers ≈ 75 binary
membership clauses before orbit closure. (From K5; likely partially
represented via the perp-bisector chain family — dedup — but the
`P`-as-second-witness instantiations come for free from the class row and
may be absent.)

(b) *(side split, order-coupled)* The two open `(z, P)` boundary arcs are
exactly the strict `p`-closer and `q`-closer sets (K5). With Theorem D's
derived order this yields concrete pins; branch-free examples:
along the `c → deleted` direction, `deleted, xv, e, xu, r` and every
outside carrier up to `P` are strictly closer to `deleted` than to `v`,
and along `c → v` the points `v, u, ℓ` and the remaining outside carriers
are strictly closer to `v`; along `e → xu`, everything up to `P` is
strictly `xu`-closer for the pair `{deleted, xu}`, and along `e → xv` the
points `xv, deleted, c, v, u, ℓ` are strictly `deleted`-closer (consistent
with Theorem B: `dist xv deleted < dist xv xu`). These are comparison
atoms coupled to `P`'s slot in the outside order — clause material if
comparison atoms exist, mining fodder otherwise.

## 6. Theorem D (cap-interior order rigidity; the O2 kill). {{PROVED-HERE}}

Under H1–H4 the boundary order of the seven cap-interior points, cut at
`P`, is exactly

    u, v, c, deleted, xv, e, xu     (up to global reversal),

i.e. `α(c) = 1.25a` and `α(e) = 2.75a` in Theorem A's coordinates.
Consequently **`xv` lies strictly between `deleted` and `e`**, so the
second source-forced named order — which places `e` strictly between
`deleted` and `xv` — is infeasible:

> **Corollary (unit cut).** In the exact-17 cap-nine CNF, the
> `NamedOrder = 1` branch is refutable by a source-clean theorem; the order
> block may be unit-asserted to `NamedOrder = 0`, and the O2 half of every
> family/order orbit (both cyclic directions, all cuts) retires.

*Proof.* `c` is equidistant from the edge `{v, deleted}` (H3) and lies
strictly between them on the cap arc, which does not contain `P` (H4).
K2(1) + K3 give `Z c = t_c • (Z v + Z deleted)` with `t_c > ½`; by K2(2)'s
sum-to-mid-angle formula (cosine positive since the gap `½a < π`),
`α(c) = (a + 1.5a)/2 = 1.25a`. Identically for `e` with the edge
`{deleted, xu}` (gap `2.5a < π` by Theorem A): `α(e) = (1.5a + 4a)/2
= 2.75a`. The seven angles `0 < a < 1.25a < 1.5a < 2a < 2.75a < 4a` are
strictly ordered and all lie in a common open half-plane, so K4 converts
angular order into boundary order cut at `P`. Betweenness statements are
reversal-invariant, so orientation is immaterial. The O2 position table
asserts the contrary betweenness for `e` and `xv`; contradiction. ∎

*Numeric sanity witness* (for eyeballing, not part of the proof):
`P = (0,0)`, `ρ = 1`, `a = 0.35`; class at angles
`(0, 0.35, 0.525, 0.7, 1.4)`; `c = 1.05·e(0.4375)`, `e = 1.03·e(0.9625)`.
All five H3 equalities hold exactly; the induced order is
`u, v, c, deleted, xv, e, xu`. No convex completion is claimed or needed —
the theorem is a conditional consequence of the leaf hypotheses.

*Scope note.* Theorem D consumes the class suborder and the two
betweenness facts common to both named orders (H4), so it applies verbatim
to both O1 and O2 hypothesis sets and refutes only O2. At the
`pentagonBlockerV` parent, before the order data exists, Theorems A–D
still hold relative to whatever class order the branch fixes; the orbit
generator's two-orders × two-orientations × cuts plumbing (as in the C–G
families) covers the instantiation.

## 7. What this does *not* do

- It does not close any of the twenty leaves. `d := centerAt c`, its
  support, the one-hit bound, and the eight outside carriers remain free;
  the fan says nothing new about a row constrained by a single membership.
- For the sibling `pentagonBlockerDeleted` branch (`centerAt xv = deleted`)
  the same kernels give the normalization `α(deleted) = α(xv)/2` relative
  to `u` (two nested midpoints), a strong constraint but no contradiction
  from the pinned facts alone.
- The `SwappedDE` generalization already banked concerns unordered center
  roles inside a schema, not the named-order selection; no interaction.

## 8. Why this is outside the Kalmanson closure

Every clause family banked through child 21 (Kalmanson kernels and chains,
bisector parity, two-circle, equality chains) is valid on the
circular-decomposable metric cone — parity even literally proves itself
from "one strict Kalmanson kernel plus two radius equalities". The cone
strictly contains planar convex Euclidean metrics: the 4-cycle graph
metric is a circular split metric yet violates the Ptolemy inequality
(`d₁₃·d₂₄ = 4 > 2 = d₁₂·d₃₄ + d₁₄·d₂₃`). The circumfan schemas use
circumcenter rigidity — concyclicity, arc midpoints, reflection across a
chord's bisector — which is Ptolemy-grade structure with no cone
counterpart. Concretely, Theorem A implies Ptolemy *equalities* on class
quadruples (e.g. `dist u xv · dist v xu = dist u v · dist xv xu +
dist u xu · dist v xv`), which no split-metric family satisfies
generically. This is exactly the "exact metric/global geometry beyond the
current clause set" the Session-3 triage names as the missing bridge, and
it is why 21 `SAT` children could not have surfaced these cuts: their
models need only be cone-consistent, and O2 is cone-consistent.

## 9. Lean skeleton ({{NEEDS-LEAN}})

Vocabulary as in `TwoCenterBisectorParity.lean` /
`Rigid221SourceHeavy.lean`; `ℝ² := EuclideanSpace ℝ (Fin 2)`.

```lean
namespace Problem97
namespace PentagonCircumfan

/-- K0/K1: separation direction and the open half-circle. -/
theorem exists_halfplane_of_class
    {A : Finset ℝ²} (hA : ConvexIndep A) {P : ℝ²} (hP : P ∈ A)
    {C : Finset ℝ²} (hC : ↑C ⊆ (A : Set ℝ²) \ {P}) {ρ : ℝ} (hρ : 0 < ρ)
    (hdist : ∀ q ∈ C, dist P q = ρ) :
    ∃ w : ℝ², ∀ q ∈ C, 0 < ⟪q - P, w⟫_ℝ := by
  -- P ∉ convexHull ↑C from ConvexIndep; convexHull of a finite set is
  -- compact (Set.Finite.isCompact_convexHull) hence closed; apply
  -- geometric_hahn_banach_point_closed and normalize.
  sorry

/-- K2: the bisector of a class chord is the line P + ℝ • (Zp + Zq);
an equidistant carrier is `t • (Zp + Zq)` with `t ≠ 0`. -/
theorem witness_smul_sum
    {P p q z : ℝ²} {ρ : ℝ} (hp : dist P p = ρ) (hq : dist P q = ρ)
    (hpq : p ≠ q) (hz : dist z p = dist z q) (hzP : z ≠ P)
    (hsum : p - P + (q - P) ≠ 0) :
    ∃ t : ℝ, t ≠ 0 ∧ z - P = t • (p - P + (q - P)) := by
  -- Expand dist² via norm_sub_sq_real; ⟪Z z, Z p − Z q⟫ = 0; the
  -- orthogonal complement of a nonzero vector in ℝ² is spanned by any
  -- nonzero orthogonal vector, and Z p + Z q qualifies.
  sorry

/-- K3: an off-arc witness sits beyond the chord midpoint. Side data is
supplied as the two strict-side signedArea2 facts the CCW enumeration
provides for `z` and `P` against the chord `p q`. -/
theorem offArc_witness_param_gt_half
    {P p q z : ℝ²} {t : ℝ}
    (hrepr : z - P = t • (p - P + (q - P)))
    (hside : 0 < signedArea2 p q z ∧ signedArea2 p q P < 0) :
    (1 : ℝ)/2 < t := by
  -- The affine side function along the bisector is (s − ½)·‖Zp+Zq‖²;
  -- translate the signedArea2 signs into its signs at z and P.
  sorry

/-- Theorem D, O2 pattern, one linear cut, one orientation.  The orbit
generator supplies the cut/orientation closure as in the C–G families. -/
theorem false_of_pentagon_swappedOrder
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²} (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {iP iu iv ic idel ie ixv ixu : Fin A.card} {ρ : ℝ} (hρ : 0 < ρ)
    -- O2 cap block, P outside it:
    (h1 : iu < iv) (h2 : iv < ic) (h3 : ic < idel) (h4 : idel < ie)
    (h5 : ie < ixv) (h6 : ixv < ixu) (h7 : ixu < iP)
    -- class row:
    (hu : dist (phi iP) (phi iu) = ρ) (hv : dist (phi iP) (phi iv) = ρ)
    (hd : dist (phi iP) (phi idel) = ρ) (hx : dist (phi iP) (phi ixv) = ρ)
    (hxu : dist (phi iP) (phi ixu) = ρ)
    -- pentagon-edge equalities:
    (e1 : dist (phi ixv) (phi iu) = dist (phi ixv) (phi ixu))
    (e2 : dist (phi iv) (phi ixv) = dist (phi iv) (phi iu))
    (e3 : dist (phi idel) (phi iv) = dist (phi idel) (phi ixv))
    (e4 : dist (phi ic) (phi iv) = dist (phi ic) (phi idel))
    (e5 : dist (phi ie) (phi idel) = dist (phi ie) (phi ixu)) : False := by
  -- K0 → w; K2 on e1,e2,e3 with norm ρ → the three mid-angle identities;
  -- K2+K3 on e4,e5 with the side facts from hccw → α(c), α(e);
  -- K4 (hccw triples through iP) → angular order = index order;
  -- α(e) = 2.75a > 2a = α(xv) contradicts h5.
  sorry

end PentagonCircumfan
end Problem97
```

Mathlib ingredients believed sufficient: `geometric_hahn_banach_point_closed`,
compactness/closedness of finite convex hulls, `norm_sub_sq_real` /
`real_inner_self_eq_norm_sq`, 2-D orthogonal-complement dimension facts, and
the repo's own `signedArea2` / `SignedAreaOangle` bridge for K4 in place of
any angle API. An angle-free variant of the Theorem A/D algebra is possible
(cross-product identities on the three sum relations, per the plan's "no
angles" preference) at the cost of longer case algebra; the half-circle
lemma K1 is what makes either route branch-free.

## 10. Suggested sequencing

1. Dedup per §0; in particular diff the O2 cut against the root-20 motifs.
2. Formalize K0–K3 (small, self-contained) and
   `false_of_pentagon_swappedOrder`; bank the O2 orbit; unit-assert the
   order block in the next Lean-owned root (child 22) — this halves the
   formula before the pending child-21 terminal rerun is even needed, and
   is a clean test: if the recovered single-run child-21 model uses
   `NamedOrder = 1`, the cut alone advances the chain.
3. If comparison atoms exist, bank Theorem B's ladder and Theorem C(b)'s
   pins as the following child; otherwise register them in the theorem
   bank for the mining scan.
4. Theorem C(a)'s exhaustion nogoods: emit only the instantiations the
   perp-bisector chain family does not already cover.
5. Independently valuable, outside this lane: K1 as a cardinality-generic
   bank ("every pinned exact class lies in an open half-circle"), usable
   wherever a surplus class appears (the D-R "universal no-five/no-M44"
   bridge hunts in adjacent territory).

## 11. Author's verification statement

Proved here by hand: K0, K1, K2, K3, K5, Theorems A, B, C, D, and the
numeric witness. Read in-repo but not kernel-checked: the H1–H5 pins (the
pentagon packet, the trace table, `centerAt` identities, the exact-17
position tables, `perpBisector_apex_bound`). Not claimed: leaf closure,
novelty beyond the §0 checklist, or any statement about the outside
carriers. The single highest-value, lowest-risk item is the Theorem D unit
cut: one theorem, one clause, half the search space.
