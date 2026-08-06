# Rigid221 pentagon — arc-coordinate closure plan (2026-08-05)

Status: PLAN. The configuration facts in §1 are proved in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`
at commit `32719ca9`. Everything in §3 is {{NEEDS_PROOF}} — it is the
proposed next lane, not a result.

## 1. What is pinned (proved)

The `secondOppositeLarge` pentagon of the Rigid221 source-heavy arm sits in
a carrier `D.A ⊂ ℝ²` in strictly convex position (`D.convex :
ConvexIndep`), with physical apex `P := S.oppApex2 ∈ D.A` and physical
class

    SelectedClass D.A S.oppApex2 P.rho = {u, xu, deleted, v, xv}

— five pairwise distinct carrier points, each at distance `P.rho > 0` from
`P`, and the class is exactly these five (`_hclassFive` plus
`hclassFive : class.card = 5`).

Each class point `q` carries an actual late row: the four-point shell
`(lateFirstApexSystem R).selectedAt q hq`, centred at `centerAt q hq`,
with `support.card = 4`, `q ∈ support`, `centerAt q ∉ support`, and
`centerAt q ≠ P` (`secondApex_robust.centerAt_ne`).

The class trace of every row is pinned into the directed five-cycle
`u → xu → deleted → v → xv → u`:

| row | class trace | source |
| --- | --- | --- |
| `u` | `{u, xu}` | packet `source_row_trace` |
| `v` | `{v, xv}` | packet `opposite_row_trace` |
| `xu` | `{xu, deleted}` | `..._pentagon_xuRow_trace_bound` |
| `deleted` | `{deleted, v}` | leaf hypotheses |
| `xv` | `{xv, u}` | `..._pentagon_xvRow_trace_bound` |

Both trace producers rest on the mined bank bound
`ATailExactFourRobustCapExpansion.actualLateRow_secondClass_card_le_two`
(every actual late row meets the physical class in at most two points).

One blocker is identified with a class point: `centerAt u = xv`
(packet `blocker_eq_xv`), i.e. `xv` is equidistant from `u` and `xu`.

Two further proved tools:

- `Dumitrescu.perpBisector_apex_bound` — at most two carrier points are
  equidistant from any two distinct carrier points. Since `P` and
  `centerAt q` are both equidistant from `q` and its cycle successor, and
  are distinct carrier points, the pair `{P, centerAt q}` **exhausts** the
  perpendicular bisector of each cycle edge inside the carrier.
- `exactFourRigid221_sourceHeavy_pentagon_equilateralXu_false` — if
  `{u, xu, xv}` is equilateral then `P` lies in its convex hull, against
  `ConvexIndep`. Currently specialised to those three names; the argument
  uses only that the three points are distinct carrier points, pairwise
  equidistant, and all at distance `rho` from `P`.

Current frontier (three leaves, all in the same module):

| leaf | extra hypothesis |
| --- | --- |
| `..._pentagonBlockerDeleted` | `centerAt xv = deleted` |
| `..._pentagonBlockerV` | `centerAt xv = v` |
| `..._pentagonOffClassBlocker` | blocker interior, off the class |

## 2. Why the present tools stall

Both on-class leaves add one more "class point equidistant from a pinned
class edge" fact. Bisector saturation cannot extract a third one: the pair
`{P, centerAt q}` already exhausts each cycle edge's bisector, so no
further carrier point can be placed on it, and no pinned row carries a new
class pair. The `deleted` and `v` alternatives survive because nothing
metric distinguishes them from the surviving geometry.

## 3. Proposed lane: a linear arc coordinate on the class

### 3.1 The separation step {{NEEDS_PROOF}}

`ConvexIndep` gives `P ∉ convexHull (class \ {P})`, and the class lies on
the circle of radius `rho` centred at `P`. For points on a circle,
`P ∈ convexHull` of them fails exactly when they lie in one open
half-plane through `P`. So there is a direction `w` with
`⟪z - P, w⟫ > 0` for all five class points.

This is the same fact the equilateral kill already uses in the
three-point case; the general form needs a separation lemma
(`convexHull` / `SeparatingHyperplane` in Mathlib) rather than the
three-point non-obtuse computation.

### 3.2 The coordinate {{NEEDS_PROOF}}

Inside an open half-plane through `P`, `Problem97.arcAngle P ·`
(`lean/Erdos9796Proof/P97/MEC/ArcAngle.lean:242`) lifts to a **real**
coordinate `θ : class → (θ₀, θ₀ + π)` with no wrap-around, so the
`Real.Angle` quotient stops mattering and `linarith` becomes available.

### 3.3 The arc-midpoint characterisation {{NEEDS_PROOF}}

For class points `p, q, z` (all at distance `rho` from `P`):

    dist z p = dist z q  ↔  θ z = (θ p + θ q) / 2

The forward direction is the one used below. The mod-`π` ambiguity of the
bisector direction is killed by §3.1: `(θ p + θ q)/2` lies strictly
between `θ p` and `θ q`, hence inside the same open interval of length
`π`, so the antipodal solution is excluded.

### 3.4 What that buys

Every blocker identification becomes one linear equation. Writing
`a = θ u`, `b = θ xu`, `c = θ deleted`, `d = θ v`, `e = θ xv`:

- always available (`centerAt u = xv`): `2e = a + b`;
- leaf `BlockerV` (`centerAt xv = v`): `2d = e + a`;
- leaf `BlockerDeleted` (`centerAt xv = deleted`): `2c = e + a`.

Two worked branch kills, both ending in `a = e`, i.e. `u = xv`, which the
module already refutes:

**`BlockerV`, sub-case `centerAt v = u`.** Adds `2a = d + e`. With
`2d = e + a`: `4a = 2d + 2e = (e + a) + 2e`, so `3a = 3e`.
(This sub-case is also an equilateral triple `{u, v, xv}`, so it can be
killed without the coordinate — see §4.)

**`BlockerDeleted`, sub-case `centerAt xu = u`.** Adds `2a = b + c`.
With `b = 2e - a` and `2c = e + a`: `2a = (2e - a) + c` gives
`c = 3a - 2e`, and `2(3a - 2e) = e + a` gives `5a = 5e`.
This one is **not** an equilateral triple — it is a genuine three-equation
kill that only the arc coordinate reaches.

### 3.5 Machinery already in the tree

- `Problem97.arcAngle` — `P97/MEC/ArcAngle.lean:242`.
- `Problem97.ConvexCyclicOrder.*` — cyclic-order wrapper and polar-sort
  construction (`Construct.lean` is partial).
- `Problem97.ShellCurvatureRows` — builds one global cyclic boundary
  indexing for a convex-independent carrier and re-cuts it at each row
  centre, applied to five actual rows. Closest existing precedent for the
  indexing work in §3.2.
- `Dumitrescu.convex_order_implies_perpBisector_side`
  (`P97/Dumitrescu/Lc1Strict.lean:444`, proved) — convex-position
  half-plane bridge for a perpendicular bisector.
- `mem_convexHull_three_of_equidistant_nonobtuse` — the three-point
  version of §3.1.

## 4. Cheaper step, landed

`exactFourRigid221_sourceHeavy_equilateral_class_triple_false` (private,
same module) is the generic form: three distinct carrier points, all in
the physical class, pairwise equidistant, give `False`. The old named
lemma `..._pentagon_equilateralXu_false` is now a thin specialisation of
it that supplies the packet's distinctness and class-membership facts.
The generic kernel closes every sub-case whose two blocker
identifications happen to share a point (the `BlockerV` /
`centerAt v = u` case above), with no arc coordinate.

It does not close a leaf on its own: splitting `BlockerV` on `centerAt v`
kills three of five alternatives (`v` by `centerAt_ne_source`, `xv`
because `xv` is on the `v` row, `u` by the equilateral kernel) and leaves
`centerAt v = deleted` and off-class, so the frontier would grow 1 → 2.
Only §3 closes branches faster than it opens them.
