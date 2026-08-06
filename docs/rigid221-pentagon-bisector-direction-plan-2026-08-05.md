# Rigid221 pentagon — bisector-direction closure plan (2026-08-05)

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

## 3. Proposed lane: positive bisector directions (linear algebra, no angles)

Write `Z q := q - P` for a class point `q`, so `‖Z q‖ = rho` for all five.

### 3.1 The half-plane step {{NEEDS_PROOF}}

`ConvexIndep` gives `P ∉ convexHull (class)` (the class is a set of carrier
points not containing `P`, since every class point is at distance
`rho > 0` from `P`). Strict separation of a point from the compact convex
hull of a finite set yields a direction `w` with

    0 < ⟪Z q, w⟫   for every class point q.

Mathlib route: `Set.Finite.isCompact_convexHull` /
`convex_convexHull` plus `geometric_hahn_banach_point_closed`. This is the
general form of what the three-point equilateral kill computes by hand.

### 3.2 The bisector direction is `Z p + Z q` {{NEEDS_PROOF}}

For class points `p, q, z`, expanding `dist z p = dist z q` with
`‖Z z‖ = ‖Z p‖ = ‖Z q‖ = rho` gives the exact equivalence

    dist z p = dist z q  ↔  ⟪Z z, Z p - Z q⟫ = 0.

In `ℝ²`, `‖Z p‖ = ‖Z q‖` makes `Z p + Z q ⊥ Z p - Z q`, and `p ≠ q` makes
`Z p - Z q ≠ 0`, so the orthogonal complement of `Z p - Z q` is the line
spanned by `Z p + Z q` — provided `Z p + Z q ≠ 0`, which §3.1 supplies
(`0 < ⟪Z p, w⟫` and `0 < ⟪Z q, w⟫` exclude `Z q = -Z p`). Hence

    dist z p = dist z q  →  ∃ t : ℝ, Z z = t • (Z p + Z q),

and §3.1 forces `0 < t`, since `⟪Z z, w⟫ > 0` and `⟪Z p + Z q, w⟫ > 0`.

### 3.3 Distinct class points are linearly independent {{NEEDS_PROOF}}

If `Z p = lam • Z q` with `‖Z p‖ = ‖Z q‖ = rho > 0` then `lam = ±1`;
`lam = -1` contradicts §3.1 and `lam = 1` gives `p = q`. So any two
distinct class points give linearly independent vectors from `P`.

### 3.4 What that buys

Each "the blocker of row `q` is the class point `z`" identification
becomes `Z z = t • (Z q + Z (next q))` with `t > 0`. The branch kills are
then pure module arithmetic against §3.3 — no angles, no trigonometry.

Always available (`centerAt u = xv`):

    Z xv = a • (Z u + Z xu),  a > 0.

**`BlockerV`, sub-case `centerAt v = u`.** Adds
`Z v = b • (Z xv + Z u)` and `Z u = c • (Z v + Z xv)`, `b, c > 0`.
Substituting the first into the second,

    Z u = c • (b • (Z xv + Z u) + Z xv) = c*(b+1) • Z xv + c*b • Z u,

so `(1 - c*b) • Z u = c*(b+1) • Z xv`. By §3.3 the coefficient
`c*(b+1)` must vanish, contradicting `c > 0`.
(This sub-case is also an equilateral triple `{u, v, xv}`, so it is
already closable by the generic kernel of §4.)

**`BlockerDeleted`, sub-case `centerAt xu = u`.** Adds
`Z deleted = b • (Z xv + Z u)` and `Z u = c • (Z xu + Z deleted)`.
Substituting `Z xv = a • (Z u + Z xu)`,

    Z deleted = b*(a+1) • Z u + b*a • Z xu,
    Z u = c*(1 + b*a) • Z xu + c*b*(a+1) • Z u,

so `(1 - c*b*(a+1)) • Z u = c*(1 + b*a) • Z xu`, and §3.3 forces
`c*(1 + b*a) = 0`, contradicting `a, b, c > 0`.
This one is **not** an equilateral triple — it is the first kill that
needs §3.1–§3.3.

### 3.5 Machinery already in the tree

- `Dumitrescu.convex_order_implies_perpBisector_side`
  (`P97/Dumitrescu/Lc1Strict.lean:444`, proved) — convex-position
  half-plane bridge for a single perpendicular bisector.
- `mem_convexHull_three_of_equidistant_nonobtuse` — the three-point
  special case of §3.1 plus §3.2, already consumed by the equilateral
  kernel.
- `Problem97.arcAngle` (`P97/MEC/ArcAngle.lean:242`),
  `Problem97.ConvexCyclicOrder.*` and `Problem97.ShellCurvatureRows`
  provide an angular coordinate for a convex carrier. Not needed for
  §3.2–§3.4 as stated, but they are the fallback if the vector route
  hits a case split on `Z p + Z q = 0` that §3.1 cannot discharge.

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

## 5. Where the real residual is (assessment, 2026-08-05)

Working §3 through every branch shows what it can and cannot do, and the
answer bounds the lane's value. Record it before implementing.

**What §3 reaches.** Only an identification "the centre of row `q` is the
class point `z`" produces a vector equation. Each such equation is a
positive-multiple relation `Z z = t • (Z q + Z (next q))`, and two or
three of them collapse by §3.3. So §3 is exactly a tool for the *on-class*
blocker branches.

**What it does not reach.** Splitting a leaf on the identity of one more
row centre produces five class alternatives plus one off-class
alternative. §3 (with the equilateral kernel) kills most of the class
alternatives, but the off-class alternative always survives, and so does
at least one class alternative in each split worked so far:

| leaf | split on | dies | survives |
| --- | --- | --- | --- |
| `BlockerDeleted` | `centerAt xu` | `xu`, `deleted`, `xv`, `u` | `v`, off-class |
| `BlockerV` | `centerAt v` | `v`, `xv`, `u` | `deleted`, off-class |

So each split trades one leaf for two. The frontier grows 3 → 5 while
every new leaf is strictly narrower. That is a legitimate narrowing under
the promotion rules but it is not closure.

**The actual obstruction.** Nothing in the pinned pentagon forces any row
centre other than `centerAt u = xv` to be a class point. A configuration
in which the other four centres are all off-class satisfies every
incidence and metric fact currently proved about the pentagon. Therefore
the pentagon **cannot** be closed by row-trace incidence plus
apex-circle metric alone — a closure must use something else about the
rows: their K4/deletion semantics, the second-cap interior structure and
its cardinality, or a global count of four-point equidistant shells.

**Consequence for sequencing.** Implement §3.1–§3.3 only when a split
that consumes it is landed in the same change, so the machinery does not
sit unconsumed. The higher-value target is the off-class blocker branch:
a carrier point in the strict second-cap interior, off the physical
class, carrying a four-point shell whose class trace is exactly
`{xv, u}`. Candidate tools, none of them tried yet: cap-interior
cardinality against `6 ≤ S.oppCap2.card`, the joint-deletion semantics of
`P.jointDeletion`, and exact-oracle mining of the pinned pattern.

## 6. Bank cross-check and cap-cardinality lead — both negative (2026-08-05)

**Mined banks: clean negative.** A cross-check of
`docs/general-n-certificate-bank-mining-2026-07-09.md`, the three
`certificates/*_mining.{md,json}` inventories, and the sibling checkouts
(`p97-rvol`, `~/projects/math-projects/erdos/97`,
`~/erdos-general-theorem/97`) found no general-`n` family that refutes the
pinned five-cycle, and none of the §3 sub-lemmas.

The closest cousins are the U5 kernels
`Problem97.u5_unit_triangle_on_p_circle_incompatibility`
(`lean/Erdos9796Proof/P97/U5GlobalIncidenceKernels.lean:318`) and the
`u5_equilateral_bisector_*` / `equilateral_bisector_collision` /
`three_triad_collision` family. All of them are fixed-named-point Gram
determinant kernels and all require the apex radius `r` to equal the
triple's own side length — six equal pairwise distances. Our pentagon
supplies no such coincidence: `rho` and the equilateral side length are
independent, so those kernels only fire on a degenerate sub-case. They
are also not import-reachable from `Rigid221SourceHeavy.lean`. The
project's own `..._equilateral_class_triple_false` is the correct
generalisation and is already in place.

Note `p97-rvol` is not an independent source: its lakefile path-depends
on this repo's `lean` package, so its U5 kernels are a fork of the
canonical `U5GlobalIncidenceKernels.lean`, not external content.

**Cap-cardinality lead: negative.** `P97/ATail/CapApexRadiusRigidity.lean`
carries `oppositeVertex_selectedClass_card_le_cap_card` (class card ≤ cap
card) and lower bounds `selectedClass_capInteriorByIndex_card_ge_two`,
`..._force_capInterior_card_ge_four`. With class card 5 and
`6 ≤ S.oppCap2.card` these are all satisfied. There is no upper bound on
`SelectedClass ∩ capInterior` in the tree, so the fact that at least
three pentagon class points (`u`, `xu`, `xv`) are strict-interior does
not conflict with anything. Cap cardinality alone does not close the
pentagon.

Remaining untried tools for the off-class blocker branch, in the order
they look most likely: the joint-deletion semantics of `P.jointDeletion`
(what deleting that point does to the rows), a global count of four-point
equidistant shells, and exact-oracle mining of the pinned pattern.

## 7. Joint-deletion semantics — what is actually there (2026-08-05)

First inspection of the top-ranked untried tool. `P.jointDeletion :
ExactFourMutualOmissionJointDeletion R P.rho P.u P.v`
(`FrontierLiveClosure/JointDeletionCore.lean:101`) carries, besides the
fields already consumed (`deleted_mem_class`, `deleted_ne_u`,
`deleted_ne_v`, `deleted_not_mem_uRow`, `deleted_not_mem_vRow`,
`blockers_ne`), two `CommonDeletionTwoCenterPacket`s
(`ATail/CommonDeletionTwoCenter.lean:29`):

    uPacket : CommonDeletionTwoCenterPacket D (lateFirstApexSystem R)
                deleted (centerAt u) S.oppApex2
    vPacket : CommonDeletionTwoCenterPacket D (lateFirstApexSystem R)
                deleted (centerAt v) S.oppApex2

Each packet's `actual_blocker_ne_center₁` / `actual_blocker_ne_center₂`
field says the **deleted point's own actual blocker** differs from each
surviving centre — it comes from `H.no_qfree_at`, so it is a genuine
system axiom, not bookkeeping. Instantiated in the pentagon, where
`centerAt u = xv`, this gives two facts that no current proof uses:

    centerAt deleted ≠ xv
    centerAt deleted ≠ centerAt v

together with the already-known `centerAt deleted ≠ S.oppApex2`.

Two more unconsumed fields per packet:

- `survives₁ : HasNEquidistantPointsAt 4 (D.A.erase deleted) (centerAt u)`
  — automatic here, since `deleted` is off the `u` row.
- `overlap_le_two : (B₁ ∩ B₂).card ≤ 2` for four-point `deleted`-deleted
  K4 classes `B₁` at `centerAt u = xv` and `B₂` at `S.oppApex2`. Note
  `B₂` is **not** forced to be `{u, xu, v, xv}`: `U5QDeletedK4Class` only
  requires four points equidistant from the apex, at no prescribed
  radius, and the tree explicitly allows an apex to carry two distinct K4
  radii (`oppositeVertex_distinct_K4_radii_force_capInterior_card_ge_four`
  — they force cap interior ≥ 4, which `6 ≤ S.oppCap2.card` permits).
  The bound becomes usable only after pinning `B₂`, i.e. after proving
  the second apex has a unique K4 radius in this context
  {{NEEDS_PROOF}}. With `B₂` pinned it would say that any four-point
  shell centred at the *blocker* `xv` inside `D.A.erase deleted` meets
  the rho-class in at most two points — a bound at a blocker rather than
  at a class point, which is the layer §5 says the off-class residual
  needs.

None of these closes a leaf on its own. `centerAt deleted ≠ xv` is the
concrete gain: it pre-kills one alternative of any future split on
`centerAt deleted`. The `overlap_le_two` route is gated on apex radius
uniqueness and is not available as stated.

### 7.1 The apex-radius gate, checked (2026-08-05)

`P.surface.radiusClassification : DeletionRobustRadiusClassification D
S.oppApex2` (`ATail/ExactFourRobustCapExpansion.lean:123`) has exactly two
constructors:

- `fivePointRadius` — some positive radius carries ≥ 5 class points;
- `twoDistinctRadii` — two positive radii each carrying ≥ 4, **plus**
  `all_positive_radius_class_card_lt_five`.

In the pentagon the `rho` class has card exactly 5, so instantiating
`all_positive_radius_class_card_lt_five` at `rho` refutes the second
constructor: the classification is always `fivePointRadius` here. That is
a free case elimination, but it is **not** the pin §7 needs — it only
asserts existence of a ≥ 5 radius, which we already have, and says
nothing about whether the apex carries a second four-point radius. So
`B₂` stays unpinned and the `overlap_le_two` route stays gated.

Pinning it would need "the second apex has no four-point radius other
than `rho`" {{NEEDS_PROOF}}, which nothing in the tree supplies:
`oppositeVertex_distinct_K4_radii_force_capInterior_card_ge_four` and
`oppositeVertex_selectedClass_card_le_cap_card` are both satisfied by a
five-point `rho` class plus a hypothetical four-point second radius when
`6 ≤ S.oppCap2.card`.

## 8. Exact-oracle mining of the pinned five-cycle (2026-08-05)

Reproduce with `PYTHONPATH=. uv run python census/rigid221_pentagon_oracle.py`.

The oracle is `census/endpoint_confinement/metric_realizability_probe.py`, an
exact QF_NRA (Z3) realizability probe: it asserts strict convex position in a
given cyclic order, pairwise distinctness, per-row equidistance and per-row
exactness, and reports SAT / UNSAT / UNKNOWN.

**Encoding validated first**, per the project solver rule: the probe's built-in
smoke pair passes — the known-SAT system is SAT with `all_z3_assertions_true`,
the known-UNSAT system is UNSAT. Downstream results are reported only because
this gate passed.

Labels: `0 = u`, `1 = xu`, `2 = deleted`, `3 = v`, `4 = xv`, `5 = A`
(`A = S.oppApex2`).

### 8.0 What the verdicts mean

- **UNSAT is decisive.** At `n = 6` every asserted fact is proved: the six
  labels are pairwise distinct (the five-cycle enumeration, plus
  `dist q A = rho > 0` for the apex), the carrier is in strict convex position
  (`D.convex`), `dist q A = rho` for all five class points, and each row
  equality is the row's class trace. The apex row's `exact` clause is
  **vacuous** at `n = 6` (it quantifies over labels outside the support, and
  there are none), so nothing unproved is smuggled in.
- **SAT is not a counterexample.** It says only that this row-level relaxation
  is realizable — each shell contributes just its two *class* points, not all
  four support points — hence the branch is not closable by the encoded facts.
- **UNKNOWN is a timeout and settles nothing.** Counted separately below and
  never folded into UNSAT.

### 8.1 Convex-position freedom per leaf (`n = 6`, 60 orders)

| system | SAT | UNSAT |
|---|---|---|
| baseline (apex circle + row `u` only) | 20 | 40 |
| leaf `pentagonBlockerDeleted` | 5 | 55 |
| leaf `pentagonBlockerV` | 5 | 55 |

Each leaf hypothesis cuts the surviving convex orders by a factor of four.
`xv` is never convex-adjacent to `A` in any survivor, in either leaf.

### 8.2 Next-split fan-out

For each leaf, one extra row `centerAt q = cand` was added and swept over that
leaf's surviving orders. Cells read `SAT/total`, with `(?n)` marking `n`
timeouts — a cell with `(?n)` is **not** decisive.

    leaf BlockerDeleted (centerAt xv = deleted)
      centerAt xu      -> u:0/5     v:0/5(?4)         xv:0/5        A:5/5
      centerAt deleted -> u:0/5(?5) xu:0/5(?5)        xv:0/5(?4)    A:5/5
      centerAt v       -> u:1/5(?1) xu:1/5(?1)        deleted:0/5   A:5/5

    leaf BlockerV (centerAt xv = v)
      centerAt xu      -> u:1/5     v:1/5(?1)         xv:0/5        A:4/5(?1)
      centerAt deleted -> u:0/5(?5) xu:0/5(?5)        xv:0/5(?3)    A:5/5
      centerAt v       -> u:0/5     xu:0/5(?2)        deleted:1/5(?2) A:5/5

The `A` column is an artefact of the relaxation, not a live branch:
`centerAt q = A` gives row `q` radius `rho`, so all four of its support points
are class points, contradicting the row trace's exactly-two. That is killable
in Lean from shell cardinality alone and needs no oracle.

Decisive (all-UNSAT, zero timeouts) exclusions mined:

1. unconditional — `centerAt xu ≠ xv`;
2. leaf `BlockerDeleted` — `centerAt xu ≠ u` {{NEEDS_PROOF}};
3. leaf `BlockerDeleted` — `centerAt v ≠ deleted`;
4. leaf `BlockerV` — `centerAt v ≠ u`.

### 8.3 The duplicate-centre kernel

Items 1, 3 above share one mechanism, and the probe reports item 1 at its
`equality-duplicate-center` stage — refuted from the equality structure alone,
with no geometry search and no leaf hypothesis. Swept over **all 60** convex
orders:

| candidate | UNSAT | SAT | UNKNOWN | decisive stage |
|---|---|---|---|---|
| `centerAt xu = xv` | 60 | 0 | 0 | `equality-duplicate-center` |
| `centerAt deleted = xv` | 54 | 4 | 2 | `full-convex` |

The asymmetry is exact and worth stating, because it bounds the kernel's reach.
Rows `u` and `xu` have class traces `{u, xu}` and `{xu, deleted}`, which **share
`xu`**; a common centre therefore forces a single radius, so `xv` would be
equidistant from the three distinct class points `u, xu, deleted`. Rows `u` and
`deleted` have **disjoint** traces `{u, xu}` and `{deleted, v}`, so `xv` may
centre both at two different radii and nothing is contradicted.

So the kernel is:

> **No class point is equidistant from three distinct class points.**
> The apex `A` is equidistant from all of them (`rho`), any class point `z`
> satisfies `dist z A = rho > 0` so `z ≠ A`, and two distinct points equidistant
> from the same three points force those three to be collinear — contradicting
> `D.convex.not_three_collinear`.

Equivalently: **a class point cannot centre two rows whose class traces share a
class point.** In the five-cycle those are exactly the consecutive edge pairs.

Where it fires, given `centerAt u = xv`:

- `centerAt xu ≠ xv` — unconditional, new;
- `centerAt v ≠ deleted` under `BlockerDeleted`, since that leaf already makes
  `deleted` the centre of row `xv` (trace `{xv, u}`) and row `v`'s trace
  `{v, xv}` shares `xv`;
- `centerAt v ≠ u` under `BlockerV` is the equilateral triple `{u, v, xv}` and
  is already closed by the landed kernel
  `exactFourRigid221_sourceHeavy_equilateral_class_triple_false`.

What it does **not** give: `centerAt deleted ≠ xv`. The oracle explicitly leaves
that branch SAT, so the §7 joint-deletion gain (`actual_blocker_ne_center₁`)
remains the only source for it and is not subsumed.

### 8.4 Lean route for the kernel

`Problem97.MEC.not_collinear_of_three_dist_eq`
(`lean/Erdos9796Proof/P97/Moser/NonDeg.lean:144`) already supplies "three
distinct points equidistant from a common centre are not collinear". The
missing step was "two distinct centres equidistant from the same three points
coincide". It is now **proved**, as

    Problem97.eq_of_two_centers_equidistant_three
      {p₁ p₂ p₃ c₁ c₂ : ℝ²} {r s : ℝ}
      (h₁₁ : dist p₁ c₁ = r) (h₂₁ : dist p₂ c₁ = r) (h₃₁ : dist p₃ c₁ = r)
      (h₁₂ : dist p₁ c₂ = s) (h₂₂ : dist p₂ c₂ = s) (h₃₂ : dist p₃ c₂ = s)
      (h12 : p₁ ≠ p₂) (h23 : p₂ ≠ p₃) (h13 : p₁ ≠ p₃) :
      c₁ = c₂

in `lean/scratch/DuplicateCircumcenter.lean`. Subtracting the two radius
equations after `Problem97.dist_sq_coord` leaves every `pᵢ` on one common
affine relation; differencing across the three points kills the constant, so
`c₂ - c₁` lies in the kernel of the 2×2 matrix with rows `p₂ - p₁`, `p₃ - p₁`.
That determinant is exactly `Problem97.signedArea2 p₁ p₂ p₃`, so it vanishes
when `c₁ ≠ c₂`, and `Problem97.collinear_of_signedArea2_eq_zero` contradicts
non-collinearity. Both coordinate branches close by `linear_combination` — the
determinant identity is linear in the two relations, so no nonlinear search is
needed.

Verified: `lake env lean scratch/DuplicateCircumcenter.lean` exits 0 with no
diagnostics, and `#print axioms` gives `[propext, Classical.choice, Quot.sound]`
— kernel-pure, no `sorryAx`.

It is **parked in `scratch/`, deliberately unwired**: it is a proved lemma with
no consumer, and landing it on the spine is worth doing only in the same change
as the split that uses it (§8.5). The sibling `p97-rvol` has the same statement
as `RVOL.P97.U5GlobalIncidenceBasic.eq_of_equidistant_three_noncollinear`; that
project is a path-dependent fork and is not import-reachable, so this is a local
proof rather than a citation.

### 8.5 Assessment

The mining does **not** close a leaf, and is consistent with §5: both live
on-class leaves remain SAT at `n = 6`, so neither is refutable from the apex
circle plus row-trace equidistance. What it buys is the fan-out of the next
split. Splitting `BlockerV` on `centerAt v` has six alternatives, of which
`u` (equilateral kernel), `xv` (duplicate centre) and `A` (shell cardinality)
are killable outright, leaving `xu`, `deleted` and off-class — three leaves in
place of one. Splitting `BlockerDeleted` on `centerAt v` likewise kills
`deleted`, `xv` and `A`, leaving `u`, `xu` and off-class.

Either split therefore grows the frontier 27 → 29 on-spine. That is the same
trade §5 identified, now measured rather than estimated, and it is the reason no
split was landed in this pass. The duplicate-centre kernel is worth landing only
together with the split that consumes it.
