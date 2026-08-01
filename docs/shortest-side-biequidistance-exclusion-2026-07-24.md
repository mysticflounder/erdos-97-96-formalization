# Shortest-side bi-equidistance exclusion

Date: 2026-07-24. A general-n, cardinality-free candidate for Problem 97, not
present in any mined bank or indexed Lean corpus. Status: CONJECTURED /
EMPIRICALLY VERIFIED. The normalized algebraic core is kernel-checked in
`lean/Erdos9796Proof/Geometry/ShortestSideBiEquidistance.lean`, and the first
reusable adapters are now kernel-checked in
`lean/Erdos9796Proof/Geometry/SimilarityFrame.lean`,
`lean/Erdos9796Proof/Geometry/ConvexIndepHull.lean`, and
`lean/Erdos9796Proof/P97/MEC/ShortestSideDiskAdapter.lean`. The full
arbitrary-configuration assembly remains open.

**Audit correction (2026-08-01).** The coordinate argument has a genuine
endpoint gap in Step 4: `ConvexIndep` does not by itself exclude `w = v₃`, and
that case lies on the triangle boundary at `t = q`. The clean repair is to
prove the Step-5 height inequality `q > R - h` first; this rules out every
`t ≥ q`, including the endpoint, before the strict cross-section argument is
used for `0 < t < q`. The coordinate estimates and their combined
disk-versus-triangle contradiction are now formalized. The similarity,
convex-hull, and MEC closed-disk interfaces are also formalized one-way; the
remaining gap is composing them with the non-obtuse shortest-side triangle
hypotheses in an arbitrary configuration. The statement therefore remains a
conjectural research target rather than a proved general lemma.

## Statement

**Conjecture.** Let `A ⊂ ℝ²` be finite and in strictly convex position
(`ConvexIndep`). Let the minimum enclosing circle of `A` have centre `O` and
radius `R`, and let `v₁, v₂, v₃ ∈ A` lie on that circle with the triangle
`T = v₁v₂v₃` non-obtuse (equivalently `O ∈ T`). If `v₁v₂` is a **shortest side**
of `T` — that is `|v₁v₂| ≤ |v₁v₃|` and `|v₁v₂| ≤ |v₂v₃|` — then there is no pair
`u ≠ w` in `A` with

    d(v₁,u) = d(v₁,w)   and   d(v₂,u) = d(v₂,w).

Equivalently: `x ↦ (d(v₁,x), d(v₂,x))` is injective on `A`, so the partition of
`A` by distance to `v₁` and the partition by distance to `v₂` are transverse —
every `v₁`-class meets every `v₂`-class in at most one point.

Write `γᵢ` for the angle of `T` at `vᵢ`. The shortest-side hypothesis is
`γ₃ ≤ min(γ₁, γ₂)`.

## Proof

**Step 1 — the pair is a reflection pair.** Both `v₁` and `v₂` are equidistant
from `u` and `w`, so both lie on the perpendicular bisector of `uw`. Since
`v₁ ≠ v₂`, that bisector is exactly `L = line(v₁,v₂)`, and `w = σ_L(u)` with
`u, w` strictly on opposite sides of `L`.

**Step 2 — coordinates.** Take `L` as the x-axis. Then `O = (0,h)` with
`h = R cos γ₃ ≥ 0` by non-obtuseness, `a = R sin γ₃`, `v₁ = (-a,0)`,
`v₂ = (a,0)`, and `v₃ = (p,q)` with `q = 2R sin γ₁ sin γ₂ > 0` and
`p = R sin(γ₂ - γ₁)`. Orient so `q > 0`; then `T ⊆ {y ≥ 0}`. Note
`a² + h² = R²`.

**Step 3 — the disk constraint.** Write `w = (ξ, t)` and `u = (ξ, -t)` with
`t > 0`, taking `w` on the same side as `v₃`. Both lie in the closed disk
`D(O,R)`; the binding constraint is the one from `u`, the point further from
`O`: `ξ² + (t+h)² ≤ R²`, i.e.

    |ξ| ≤ D(t) := √(a² − 2ht − t²),        t ≤ R − h.

**Step 4 — the triangle constraint.** `ConvexIndep` forces
`A ∩ T ⊆ {v₁,v₂,v₃}`: a non-vertex point of `T` would fail to be a hull
vertex. Thus, for `0 < t < q`, `w ∉ T` (it is not any of the three vertices).
The endpoint `t = q`, where `w` could equal `v₃`, is not excluded here; Step 5
must be established before this strict cross-section argument is used. For
`0 < t < q` the cross-section of `T` at height `t` is the interval
`[−a + t(p+a)/q, a + t(p−a)/q]`, whose endpoints are `−(a − t(a+p)/q)` and
`a − t(a−p)/q`. Being outside it gives, taking the weaker of the two bounds,

    |ξ| > a − k t,        k := (a + |p|)/q.

For `t ≥ q` the point `w` is above `v₃` and automatically outside `T`.

**Step 5 — the case `t ≥ q` is impossible.** This should be proved before
using the strict conclusion in Step 4. It needs `q ≤ R − h`, i.e.
`2 sin γ₁ sin γ₂ ≤ 1 − cos γ₃`. Using
`2 sin γ₁ sin γ₂ = cos(γ₁−γ₂) + cos γ₃` (from `γ₁ + γ₂ = π − γ₃`), this is
`cos(γ₁−γ₂) + 2 cos γ₃ ≤ 1`. The shortest-side hypothesis gives
`γ₃ ≤ π/3`, hence `2 cos γ₃ ≥ 1`, so we would need `cos(γ₁−γ₂) ≤ 0`, i.e.
`|γ₁ − γ₂| ≥ π/2`. But non-obtuseness gives `max(γ₁,γ₂) ≤ π/2` while
`γ₁ + γ₂ = π − γ₃` gives `min(γ₁,γ₂) ≥ π/2 − γ₃`, so
`|γ₁ − γ₂| ≤ γ₃ ≤ π/3 < π/2`. Contradiction.

**Step 6 — the case `0 < t < q` is impossible.** Compute

    D(t)² − (a − kt)² = 2t(ak − h) − t²(1 + k²).

The key identity is

    a(a + |p|) > h q   ⟺   cos 2γ₃ < cos 2·min(γ₁,γ₂)   ⟺   γ₃ > min(γ₁,γ₂),

using `2 sin γ₁ sin γ₂ = cos(γ₁−γ₂) + cos γ₃` and
`γ₃ + |γ₁ − γ₂| = π − 2 min(γ₁,γ₂)`. Under the shortest-side hypothesis the
inequality fails, so `ak ≤ h`, and then `D(t)² − (a − kt)² ≤ −t²(1+k²) < 0` for
every `t > 0`.

It remains that `a − kt > 0` on the whole admissible range. From
`a(a+|p|) ≤ hq` we get `a/k = aq/(a+|p|) ≥ a²/h = (R−h)(R+h)/h > R − h ≥ t`.
So `|ξ| ≤ D(t) < a − kt < |ξ|` — contradiction, once the missing ordering
of the endpoint cases has been repaired as above.

## Corollaries

**At most two of the three Moser chords can carry a bi-equidistant pair**, and
if `T` is equilateral none can — since then `γ₃ = min(γ₁,γ₂)` for every
labelling.

**Localization on the non-excluded chords.** When `γ₃ > min(γ₁,γ₂)` the same
computation bounds any mirror pair across `v₁v₂` by
`t < 2(ak − h)/(1 + k²)` together with `|ξ| > a − kt`, confining `u` and `w` to
two narrow windows adjacent to `v₁` and to `v₂`.

**Branch consequence.** On the all-large-caps branch every cap has at least six
points, so `4 < cap.card` holds for all three indices and every rotation of
`surplusIdx` is legal. The two opposite apices are the endpoints of the surplus
cap, so rotating `surplusIdx` moves the opposite-apex chord onto any chosen
Moser side. Rotate it onto a shortest side: then no two carrier points at all
are bi-equidistant at the two opposite apices, and
`CommonDeletionTwoCenterPacket.overlap_le_two` sharpens from `≤ 2` to `≤ 1`.

## Relation to what already exists

`Problem97.U2NonSurplusSqueeze.oppCap2_escape_gen`
(`lean/Erdos9796Proof/P97/U2NonSurplusOneHit.lean:273`, IMPORTED and proved) is
the **same-side half**: two carrier points *outside the surplus cap* cannot be
bi-equidistant at the two apices. By Step 1 that is exactly the statement that
such a pair must straddle the surplus chord. This theorem is the complementary
**straddling half**, and it needs no non-surplus hypothesis. Together they give
the branch consequence above.

The four `false_of_two_centers_equidistant_pair_{after,enclosed,split,before}`
terminals (`.../P97/ATail/TwoCenterBisectorParity.lean:53,74,112,134`) are the
same-side arrangements. A search of the indexed Lean corpus and of the six
`certificates/*_mining.{md,json}` registries found no MEC-disk / shortest-side
exclusion, so this is not a restatement of a banked law.

It is also outside the language of the lane's certificate machinery. The
support-local axiom family used by `schema_mine.decide_schema` and
`metric_oracle.py` — positivity, strict triangle, strict Kalmanson per cyclic
4-subset — does not model the minimum enclosing circle or the support triangle,
so this law cannot be expressed as a pure-equality schema over that family. It
remains a candidate law of the shape the general-n covering step was found to
need.

## Independent validation

Run by the orchestrator, independently of the derivation, at
`.../scratchpad/validate_shortest_side.py`:

- **10,373** random non-obtuse inscribed triangles. Three formulations compared
  pairwise: the algebraic criterion `a(a+|p|) > hq ∨ q ≤ R−h`, the angle
  criterion `γ₃ > min(γ₁,γ₂)`, and a direct 4,000-step grid search for an
  admissible `(ξ,t)` satisfying the disk, triangle-avoidance and height
  constraints. **Zero mismatches** in both comparisons.
- **20,000** direct Euclidean configurations, bypassing the coordinate
  reduction entirely: sample a non-obtuse inscribed triangle, relabel so `v₃`
  carries the smallest angle (hence `v₁v₂` is a shortest side), sample a
  reflection pair across `line(v₁,v₂)` inside the unit disk with both points
  outside the triangle, require all five points in strictly convex position,
  and test the two distance equalities. **Zero counterexamples.**

The second check is what guards against an error in the reduction of Steps 2–4
rather than in the trigonometry.

## What this does not do

It does not close `false_of_frontierAllLargeCapsBiApexRobustResidual`. It
sharpens a hypothesis. Cap-size lower bounds remain non-contradictory because
`|surplusCap| + |oppCap1| + |oppCap2| = |A| + 3` means they only raise `|A|`,
and the injectivity conclusion is a rigidity statement rather than a counting
obstruction: if a `v₁`-class has `c` points then `v₂` must have at least `c`
distinct radii, which is satisfiable.

It is therefore **off-spine** until a consumer inside the terminal exists, and
should not be landed standalone.
