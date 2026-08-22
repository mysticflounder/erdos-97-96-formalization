# Rigid221 pentagon — bisector-direction closure plan (2026-08-05)

Evidence-status terms in this plan follow the
[closure evidence status ledger](closure-evidence-status-ledger-2026-08-05.md).

Status: IMPLEMENTED UPDATE IN §13. The configuration facts in §1 are proved in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`
at commit `32719ca9`. The `{{NEEDS_PROOF}}` labels in §3 record the state of
the original 2026-08-05 proposal; §13 records the 2026-08-19 Lean landings.

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
in which the other four centres are all off-class therefore survives this
particular split analysis. This is a residual, not an impossibility theorem:
it does not prove that the full Lean leaf is realizable, or that every richer
incidence/metric argument must fail. The exact subsystem tested in §9 likewise
omits the rows' K4/deletion semantics, the second-cap interior structure and
its cardinality, and the two unnamed support points of each shell.

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

- **DIAGNOSTIC-ONLY, not KERNEL-CLOSED.** These are external-solver verdicts;
  no solver certificate is replayed into Lean.
- **UNSAT is decisive only for the exact encoded subsystem.** At `n = 6` every
  asserted fact is proved: the six
  labels are pairwise distinct (the five-cycle enumeration, plus
  `dist q A = rho > 0` for the apex), the carrier is in strict convex position
  (`D.convex`), `dist q A = rho` for all five class points, and each row
  equality is the row's class trace. The apex row's `exact` clause is
  **vacuous** at `n = 6` (it quantifies over labels outside the support, and
  there are none), so nothing unproved is smuggled in.
- **SAT is not a counterexample.** It supplies a model only for this exact
  row-level subsystem — each shell contributes just its two *class* points,
  not all four support points. Thus the encoded conjunction itself is
  consistent; this says neither that the full Lean leaf is realizable nor that
  richer incidence/metric arguments cannot refute it.
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
  is already **KERNEL-CLOSED** by the landed theorem
  `exactFourRigid221_sourceHeavy_equilateral_class_triple_false`.

What it does **not** give: `centerAt deleted ≠ xv`. The oracle explicitly leaves
that branch SAT, so the §7 joint-deletion gain (`actual_blocker_ne_center₁`)
remains the only source for it and is not subsumed.

### 8.4 Lean route for the kernel

**Both halves already exist in this repo. Nothing needs proving.**

    Problem97.eq_of_equidistant_three_noncollinear
      {a b c x y : ℝ²}
      (harea : signedArea2 a b c ≠ 0)
      (hxab : dist x a = dist x b) (hxac : dist x a = dist x c)
      (hyab : dist y a = dist y b) (hyac : dist y a = dist y c) :
      x = y
    -- lean/Erdos9796Proof/P97/U5GlobalIncidenceBasic.lean:129

    Problem97.MEC.not_collinear_of_three_dist_eq
      {p₁ p₂ p₃ c : ℝ²} {r : ℝ}
      (h1 : dist p₁ c = r) (h2 : dist p₂ c = r) (h3 : dist p₃ c = r)
      (h12 : p₁ ≠ p₂) (h23 : p₂ ≠ p₃) (h13 : p₁ ≠ p₃) :
      ¬ Collinear ℝ ({p₁, p₂, p₃} : Set ℝ²)
    -- lean/Erdos9796Proof/P97/Moser/NonDeg.lean:144

The second discharges the first's `harea` for any three distinct class points,
since all of them are at distance `rho` from the apex. So the kernel is a direct
two-lemma composition at the use site, with `x := A`, `y := z`, and `A ≠ z` from
`dist z A = rho > 0`.

**Correction.** An earlier revision of this section claimed the "two centres
coincide" step existed only in the sibling `p97-rvol` and was not
import-reachable, and a local proof of it was committed at `e317d561` as
`lean/scratch/DuplicateCircumcenter.lean`. That was wrong on both counts: the
lemma is in this repo under the same name, in an already-imported module. The
scratch file was a wrapper over machinery that is already available and has been
deleted. This is the second time in this lane that hand-derived work was
subsumed by an existing bank lemma — check
`nthdegree docs search --lean` and the `certificates/*_mining.json` inventories
*before* dispatching a proof, not after.

### 8.5 Assessment

The mining does **not** close a leaf. Both live on-class encoded subsystems
remain SAT at `n = 6`; this is consistency of those exact subsystems, not a
realizability result for either full leaf. What it buys is the fan-out of the
next split. Splitting `BlockerV` on `centerAt v` has six alternatives, of which
`u` (equilateral kernel), `xv` (duplicate centre) and `A` (shell cardinality)
are killable outright, leaving `xu`, `deleted` and off-class — three leaves in
place of one. Splitting `BlockerDeleted` on `centerAt v` likewise kills
`deleted`, `xv` and `A`, leaving `u`, `xu` and off-class.

Either split therefore grows the frontier 27 → 29 on-spine. That is the same
trade §5 identified, now measured rather than estimated, and it is the reason no
split was landed in this pass. The duplicate-centre kernel is worth landing only
together with the split that consumes it.

## 9. Stage-4 off-class-blocker subsystem model — DIAGNOSTIC-ONLY (2026-08-05)

`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker`
(`Rigid221SourceHeavy.lean:3591`) mined directly, as stage 4 of
`census/rigid221_pentagon_oracle.py`. Label 6 is `w = centerAt xv`.

SAT of the primary, all-exact variant witnesses consistency of the atoms that
variant actually encodes. Because it strengthens some of the encoded row
constraints, its model also witnesses consistency of the weaker encoded
row-trace/apex-circle subsystem. It does **not** extend to a model of the full
Lean leaf: cap-interior membership and each shell's two unnamed off-class
support points are omitted. The weaker variants remain useful for diagnosing
which encoded atoms drive an UNSAT result.

At `n = 7` the apex row's `exact` clause stops being vacuous and becomes exactly
this leaf's off-class hypothesis: it forces `w` off the class circle. Rows `u`
and `xv` carry their exact class traces `{u, xu}` and `{xv, u}`.

| variant | SAT | Z3 assertions re-evaluated true | UNSAT | UNKNOWN |
|---|---|---|---|---|
| **all-exact** (primary) | **29** | 29 | 330 | 1 |
| rows-open | 28 | 28 | 328 | 4 |
| u-open | 27 | 27 | 330 | 3 |

**Verdict: DIAGNOSTIC-ONLY.** Every reported SAT model in the primary variant
was re-evaluated against the encoded Z3 assertions. Therefore the all-exact
encoded subsystem has a model. This is not realizability of the full Lean leaf,
not KERNEL-CLOSED, and not an impossibility result for richer incidence/metric
arguments involving facts absent from the encoding.

Consequence for planning, and it is a real narrowing of the option set:

- The specific §3 on-class vector mechanism does not apply directly to this
  leaf. It converts "row centre *is* a class point" into a linear equation;
  this leaf is the hypothesis that it is not. This says nothing about other
  vector or incidence mechanisms.
- Any next attempt must add information absent from this exact subsystem. Two
  named sources are the cap and deletion mechanisms; this is not a claim that
  they exhaust a whole proof layer. Untouched by the verdict: `w` lies in the
  strict second-cap interior, each shell carries two further off-class support
  points, and `6 ≤ S.oppCap2.card`.
- The most concrete untried route is the two-sided cap-interior squeeze that
  the E1 paired-grid lane assembled from existing lemmas
  (`SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two` from below;
  `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two` and
  `criticalShell_inter_otherRichCapSlice_card_le_one` from above). It transfers
  verbatim if the pentagon supplies a covering statement of the shape "these
  rows are contained in the union of these apex classes" {{NEEDS_RESEARCH}} —
  whether it does is unchecked.

## 10. The cap-interior squeeze: one named prose exclusion, two open gaps (2026-08-05)

Partially investigates the `{{NEEDS_RESEARCH}}` marker following §9. **This section
was rewritten after a rigor re-audit; the original version overclaimed in three
places and drew one invalid inference. §10.5 records what changed.** Only
§10.2's first bullet pair is PROSE-EXCLUDED for the two named rows; §10.2's
second bullet and §10.3 are OPEN on this partial search. Nothing here is
KERNEL-CLOSED.

Two corrections to how §9 posed the question, both from checking the Lean rather
than the summary:

1. §9 asked for one input (the covering statement). The squeeze needs **three**,
   and the covering statement is only the third. This is the E1 paired-grid
   lane's own account of its mechanism (convo #3104).
2. §9 named `selectedClass_capInteriorByIndex_card_ge_two`
   (`CapInteriorRadiusCounting.lean:27`), which wants `4 ≤ card`. The general
   form is `..._card_ge_card_sub_two` (`CapInteriorRadiusCounting.lean:84`).

### 10.1 Input (1), lower bound — AVAILABLE, and stronger than the grid's

`SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_card_sub_two`
(`CapInteriorRadiusCounting.lean:84`) needs only `ConvexIndep A` and
`0 < radius`, and gives `card − 2 ≤ |class ∩ capInteriorByIndex i|`. At
`i = S.oppIndex2` the pentagon class has card `5`, so **at least three** of
`{u, xu, deleted, v, xv}` lie in the strict second-cap interior — against the
grid's `≥ 2` from a four-point class.

The card-5 fact is `P.hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5`,
a **field of the context structure** `ExactFourRigid221PhysicalApexSourceEqUContext`
(`Rigid221Placement.lean:735`). It is *not* the leaf hypothesis `_hclassFive`,
which is only the containment `∀ q ∈ class, q = u ∨ … ∨ q = xv` and therefore
gives `card ≤ 5`. The first draft of this section cited the wrong one; the
conclusion is unaffected because the context field is in scope at the leaf.

Needs the index bridge `oppositeVertexByIndex S.oppIndex2 = S.oppApex2`. It
exists — `FiniteN10.lean:101` — but is `private`; it is a three-line
`interval_cases`/`simp` to re-derive locally.

### 10.2 Input (2), per-row upper bound — INERT on the two located rows

The grid's prerequisite `TriApexAllLargeContext` (`∀ i, 6 ≤ (S.capByIndex i).card`,
`TriApexEndpointRetainedOmission.lean:799`) is **not** available: the
`secondOppositeLarge` constructor (`Rigid221SourceHeavy.lean:363`) supplies only
`6 ≤ S.oppCap2.card`, nothing about the other two caps. That turns out not to
matter — the grid uses `exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge`
only to *obtain* a strict cap for the blocker, and this leaf already carries that
as the hypothesis `_hblockerInterior`.

What actually fails is the bound itself.

- `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two:278`
  **does** apply, to two rows: row `xv` by `_hblockerInterior`, and row `u`
  because `centerAt u = xv` and `_hxvInterior` puts `xv` in the same strict
  interior (`capInteriorByIndex_subset_capByIndex`). But each of those rows
  already has a *proved* two-point class trace — `{u, xu}` and `{xv, u}`. The
  `≤ 2` bound is therefore **saturated by facts already in hand**; all it adds
  is that the two remaining support points of each row avoid cap `oppIndex2`,
  and nothing else in the leaf constrains those points.
- `criticalShell_inter_otherRichCapSlice_card_le_one`
  (`TriApexEndpointRetainedOmission.lean:394`) is the sharp `≤ 1` bound that
  makes the grid's squeeze bite, and it **does not apply**. It requires
  `hij : i ≠ j`, where `i` indexes the cap holding the row's centre and `j` the
  apex carrying the class. The pentagon has `i = j = S.oppIndex2`: the blocker
  sits in the strict interior of the cap opposite the very apex carrying the
  class. The hypothesis is not bookkeeping — the proof routes through
  `false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap`
  (line 411), whose content is that a row centre in one cap cannot be
  equidistant from two points of a *different* cap. At `i = j` the best
  available bound degrades to the `≤ 2` of the previous bullet.

**Scope of that second bullet — this is a gap, not a closure.** `i = j` is
established only for the two rows whose centres this leaf locates: row `u` (via
`centerAt u = xv` and `_hxvInterior`) and row `xv` (via `_hblockerInterior`).
Rows `xu`, `deleted` and `v` have centres the leaf does not place anywhere. If
any one of them sits in the strict interior of a cap other than `oppIndex2`,
then `i ≠ j` **does** hold for that row and the `≤ 1` bound applies against the
pentagon class, whose trace on that row is two points. That is a live route, not
a refuted one. Closing it needs two things, both {{NEEDS_RESEARCH}}:

1. locate — or prove unlocatable — the centres of rows `xu`, `deleted`, `v`;
2. supply `ApexRichClassStructure D.A (S.oppositeVertexByIndex S.oppIndex2)`,
   which the grid gets from `TriApexAllLargeContext.apex_rich` and which this
   leaf does **not** carry.

### 10.3 Input (3), the covering statement — no analogue found (partial search)

The grid's `shells_union_eq_classes_union`
(`PairedCommonDeletionNormalForm.lean:222`) is an **equality**: the union of two
shell supports equals the union of two classes at one apex. It holds there
because each four-point shell splits `2 + 2` across the two radii, so *every*
shell point is a class point, and the two counts are forced to meet.

No analogue was found. What the pentagon supplies is per-row class **traces** —
`shell ∩ class = {two points}`, plus the trace bounds `_htraceBound` /
`_htraceBoundXu` at `Rigid221SourceHeavy.lean:3591`. Each of the five rows
carries two further support points that these hypotheses do not place in any
class, so even the containment form `shell ⊆ class ∪ class` (the grid's
`keptShell_subset_union`) was not found, let alone the equality.

**Search scope, stated so it can be extended rather than repeated.** This is a
grep of `Rigid221SourceHeavy.lean` for `∪` / `subset_union` and a read of the
packet and leaf hypotheses. `Rigid221Placement.lean` — where the context
structure actually lives — was **not** swept, and it does carry adjacent
machinery: `ExactFourRigid221PhysicalApexSourceEqUContext.sourceRowInteriorCount`
(`:762`) counts the source row's strict-second-cap-interior class members, with
a docstring asserting the rigid `2+2+1` packet bounds that count by two. That is
one row's half of a squeeze and it was already in the tree. Absence of a covering
statement is therefore CONJECTURED, not established.

### 10.4 Verdict

One named PROSE-EXCLUDED mechanism, two open gaps.

- **PROSE-EXCLUDED (two-row scope).** For rows `u` and `xv`, the sharp `≤ 1`
  bound is unavailable
  because the blocker and the class share the index `oppIndex2`, and the
  surviving `≤ 2` bound is saturated by their already-proved two-point traces.
  The grid arm's mechanism depends on blocker and class living at *different*
  indices; on these two rows the pentagon is the degenerate coincident case.
- **OPEN.** Rows `xu`, `deleted`, `v` (§10.2 scope note) and the unswept
  covering search (§10.3).

**Retraction.** The first draft of this section argued that §9's realizability
result made the whole squeeze moot — "the configuration is realizable, so no
combination of these counting bounds could have closed it". **That inference is
invalid and is withdrawn.** The §9 oracle encodes row-trace incidence and
apex-circle metric; cap membership, adjacent caps and cap-interior structure are
*not in the encoding at all*. A model of the encoded system therefore carries no
information about whether a cap-counting argument closes the leaf. §9 and §10
are independent results and neither confirms the other.

Consequently the claim that "both named routes out of this leaf are now closed"
is withdrawn as well. The specific §3 on-class vector mechanism is inapplicable
by the off-class leaf hypothesis itself, not by the §9 oracle; the squeeze is
obstructed on two rows of five. Still untouched by either section: the
deletion/K4 layer, the unplaced off-class support points per shell, and any
global carrier count.

### 10.5 What the re-audit changed

Four items, recorded so the reasoning can be checked rather than re-trusted:

1. **Invalid inference, withdrawn** — §10.4's appeal to §9 (above). This was the
   substantive error: it presented an unrelated result as confirmation.
2. **Wrong citation, conclusion intact** — the card-5 fact was attributed to the
   leaf's `_hclassFive`, which gives only `card ≤ 5`. It holds via the context
   field `P.hclassFive` (§10.1).
3. **Overstated scope** — "the `≤ 1` bound does not apply" was checked on two of
   five rows and stated unconditionally (§10.2 scope note).
4. **Overstated search** — "absent, and not for want of searching" rested on a
   grep of one file, with the context's own file unswept (§10.3).

## 11. Gap 1 — PROSE-EXCLUDED: the named `≤ 1` route (2026-08-05)

The pen-and-paper argument below excludes the named `≤ 1` route for all five
rows rather than only the two whose centres the leaf locates. This retires that
specific workstream; it is not kernel closure of the leaf or of a cap-counting
layer.

Status: **PROSE-EXCLUDED / RETIRED-AS-WORKSTREAM**, not KERNEL-CLOSED. The
argument is not formalized and closes no `sorry`. The one step with no named
lemma yet is §11.2.

### 11.1 Two facts §10 missed

- `packet.source_pair_interior` is a **proved packet field**: it gives
  `{u, xu} ∩ capInteriorByIndex oppIndex2 = {u, xu}`, i.e. `u` and `xu` both lie
  in the strict second-cap interior. With
  `exactFourRigid221_sourceHeavy_xv_mem_secondCapInterior`
  (`Rigid221SourceHeavy.lean:189`) adding `xv`, three of the five class points
  are **named** in the interior. §10.1's counting bound gave `≥ 3` without
  saying which; this is strictly better and was already in the packet.
- `ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_secondCapInterior`
  (`TwoCenterCapLocalization.lean:191`) is the bisector localization **at
  `oppIndex2`**. §10 only found the `oppIndex1` form
  (`card_five_interior_bisector_localization.lean:66`) and wrongly treated the
  index specialization as a limitation. Hypotheses: `center ∈ D.A`,
  `center ≠ S.oppApex2`, both of `source`/`partner` in
  `capInteriorByIndex oppIndex2`, `source ≠ partner`,
  `dist center source = dist center partner`, and
  `dist oppApex2 source = dist oppApex2 partner`.

### 11.2 Cap interiors at distinct indices are disjoint

Not a named lemma; a short derivation. `capInteriorByIndex i` is `Cᵢ` with its
two Moser vertices erased (`PartitionFromMEC.lean:474`), and the third vertex is
excluded by `CapTriple.vₖ_notin_Cₖ`, so every member is a **non-Moser** vertex of
`Cᵢ`. `CapTriple.nonmoser_in_one` (`Cap/Structure.lean:190`) says a non-Moser
vertex lies in exactly one cap. Hence `i ≠ j` forces
`capInteriorByIndex i ∩ capInteriorByIndex j = ∅`. The closed-cap pairwise forms
of exactly this argument already exist, `private`, at `U2SqueezePort.lean:63`,
`:70`, `:77`.

### 11.3 The argument

Let `x` be any pentagon row. Suppose `criticalShell_inter_otherRichCapSlice_card_le_one`
is to yield a contradiction against the pentagon class, i.e. with `j = oppIndex2`.
Then both of the following must hold:

- **(a)** `centerAt x ∈ capInteriorByIndex i` for some `i ≠ oppIndex2` — the
  lemma's `hcenter` and `hij`;
- **(c)** at least two points `q ≠ w` of row `x`'s support lie in
  `SelectedClass D.A oppApex2 rho ∩ capInteriorByIndex oppIndex2` — otherwise
  the `≤ 1` conclusion is satisfied and there is nothing to contradict.

But **(c) forces `i = oppIndex2`**. From (c): `q, w` are in row `x`'s support, so
`dist (centerAt x) q = dist (centerAt x) w` by `support_eq_radius`; they are both
class points, so `dist oppApex2 q = dist oppApex2 w = rho`; they are both in
`capInteriorByIndex oppIndex2`; `centerAt x ∈ D.A`; and
`centerAt x ≠ oppApex2` via `P.surface.secondApex_robust.centerAt_ne` (used this
way at `Rigid221SourceHeavy.lean:2196`, general in the row). These are exactly
the hypotheses of §11.1's localization, which yields
`centerAt x ∈ capInteriorByIndex oppIndex2`. With §11.2 that contradicts (a).

So (a) and (c) are jointly unsatisfiable: **the `≤ 1` bound can never bite
against the pentagon class, for any row.**

### 11.4 Scope, stated exactly

- The argument needs **no** knowledge of where `deleted` and `v` sit, and no
  `ApexRichClassStructure`. Both prerequisites §10.2 listed as blockers are
  dissolved rather than satisfied.
- It is scoped to `j = oppIndex2`, the pentagon class. It says nothing about
  applying the same lemma to a class at `oppApex1` or at the surplus apex —
  those are different classes and are not what the squeeze needs.
- The mechanism is now precisely identified, and it is not "the pentagon happens
  to be degenerate". Any two class points in a common cap interior pull the row
  centre into that same cap interior. The `≤ 1` bound needs the centre *outside*
  the cap holding the hits. Those two demands are contradictory whenever the
  hits are co-interior class points — which is the only configuration in which
  the bound has anything to say.

**Net effect on §10.4.** Gap 1's named `≤ 1` route is PROSE-EXCLUDED for the
whole pentagon, not just rows `u` and `xv`; no Lean obligation is discharged.
Gap 2 (the covering-statement sweep of `Rigid221Placement.lean`) remains open at
this point. The §10.4 retraction stands unchanged — none of this rests on the
§9 oracle.

## 12. Gap 2 — DIAGNOSTIC-ONLY: the named covering route is uninformative (2026-08-05)

Classifies §10's second named route by source audit and prose counting; it does
not kernel-close a theorem or the leaf. The reported sweep covered
`Rigid221Placement.lean` (read in full), `Rigid221SourceHeavy.lean`, and the four
structure-definition files
`JointDeletionCore.lean`, `ExactFourRobustCapExpansion.lean`,
`OriginalUniqueResidualDispatch.lean`.

### 12.1 The searched scope lacks the grid's shape — and contains the dual shape

No declaration or field matching a shell support on the left of `⊆`/`=` with a
union of `SelectedClass` terms on the right was found in the searched Rigid221
files. That upgrades §10.3 from CONJECTURED to a negative source-audit result
**for the searched snapshot and scope**, not to a mathematical theorem.

But §10.3 asked the wrong question. The pentagon *does* carry a covering
equality; it simply runs the other way. `physical_class`, a packet field at
`Rigid221SourceHeavy.lean:70`:

    SelectedClass D.A S.oppApex2 P.rho = insert deleted ({u, xu} ∪ {v, xv})

and its ancestor `ExactFourMutualOmissionRigid221GlobalDeletion.rigid`
(`Rigid221Placement.lean:59`) says the same with `Iu`, `Iv` the two row traces,
plus `Iu.card = 2`, `Iv.card = 2`, `Disjoint Iu Iv`.

**Why that direction is inert for the squeeze, which is the real content of this
section.** The grid's `shells_union_eq_classes_union` constrains *shell supports*
— it forces the two non-class points of each four-point shell to be class points,
which is exactly the information the counting needs. The pentagon's equality
constrains the *class*, which `_hclassFive` and `P.hclassFive` already enumerate
completely. It is a restatement of what is known, not a new restriction, so it
contributes nothing to an upper bound. Worked through: the covering gives
`class ∩ interior ⊆ ({u,xu} ∪ {v,xv} ∪ {deleted}) ∩ interior`, which is an
identity. Against §10.1's `≥ 3` from below it yields no contradiction.

So the correct statement is not "the pentagon lacks a covering statement" but
**"the pentagon's covering statement constrains the wrong side of the count"**.

One reachable statement does relate a class to a union of shell supports —
`B1Live.lean:1129`, third disjunct of
`b1_live_interior_joint_deletion_or_small_cover`:
`class ∩ capInteriorByIndex oppIndex2 ⊆ {first.deleted, second.deleted} ∪
(row_u.support ∪ row_v.support)`. Combined with the per-row `≤ 2` this bounds
`|class ∩ interior| ≤ 6`, against `≥ 3` from below. No bite. It is also one
disjunct of three, so selecting it is separate work.

### 12.2 Two corrections to earlier sections

- **§10.3 overstated what `sourceRowInteriorCount` proves.** I wrote that its
  docstring "asserts" the rigid `2+2+1` packet bounds the count by two. In fact
  **no lemma anywhere states anything about it** — every one of its eleven
  occurrences is a hypothesis or a `by_cases` scrutineee. The docstring records
  unproved intent. The bound is nonetheless real and available two ways: from
  `globalDeletion.rigid.1 : Iu.card = 2` by `Finset.card_le_card`, or directly
  as `actualLateRow_secondClassInterior_card_le_two`
  (`ExactFourRobustCapExpansion.lean:296`), which *is* `sourceRowInteriorCount ≤ 2`
  modulo `P.huSource` and `∩`-reassociation.
- **`_hblockerInterior` is a redundant hypothesis of the anchored leaf.**
  `exactFourRigid221_sourceHeavy_pentagon_blocker_mem_secondCapInterior`
  (`Rigid221SourceHeavy.lean:3355`) proves it outright from `P`, `packet`,
  `hxvA` and the single incidence `_huXvRow`, bottoming out in
  `commonPhysicalPair_center_mem_secondCapInterior` exactly as §11.3 does.

### 12.3 Where §10–§12 leave the leaf — stated at the right scope

Both routes **§10 named** are PROSE-EXCLUDED, not KERNEL-CLOSED: the `≤ 1`
mechanism cannot bite by the argument in §11, and the particular covering
statement examined in §12.1 constrains the side of that count that carries no
information.

**That is two named routes, not a layer.** An earlier draft of this section said
"the cap-counting layer as a whole is non-closing on this leaf". **Withdrawn** —
that generalizes from two instances. No enumeration of cap-counting arguments was
performed, and §12.1's own sweep surfaced further cap-counting machinery in scope
whose bearing on this leaf is unexamined: `actualLateRow_secondClass_card_le_two`
(`ExactFourRobustCapExpansion.lean:383`, no side hypotheses),
`actualLateRow_secondClassInterior_card_le_two` (`:296`), and the `B1Live.lean:1129`
third disjunct. §12.1's inertness computation likewise checked one count —
`class ∩ interior` — not every count the covering could feed.

Untouched, and the named levers: the deletion/K4 semantics, the two off-class
support points per shell that nothing places, and any argument counting the
carrier globally rather than inside cap `oppIndex2`.

### 12.4 Provenance of §12, recorded because it bears on how much to trust it

§12.1's sweep was performed by a subagent. It was committed **before** being
validated, contrary to the project rule that agent output is checked first. The
validation was then run and consists of four spot-checks, all passing:

- `physical_class` at `Rigid221SourceHeavy.lean:70` — statement confirmed verbatim;
- `..._pentagon_blocker_mem_secondCapInterior` at `:3355` — hypotheses confirmed
  as exactly `P`, `packet`, `hxvA`, `huXvRow`, so `_hblockerInterior` is redundant;
- `sourceRowInteriorCount` — 11 occurrences repo-wide, 0 of them declarations,
  confirming no lemma bounds it;
- the target shape repo-wide — 5 hits on `toCriticalFourShell.support ⊆`, of which
  3 have a union-of-classes RHS (2 in the grid, 1 out-of-chain in
  `TriApexEndpointRetainedOmission.lean:1083`). The remaining 2,
  `U1LargeCapRouteBTail.lean:826` and `:1943`, were **not** in the subagent's
  report; both are `support ⊆ {q, t1, t2, t3}`, an explicit finset, so the
  negative survives.

The exhaustive negative in §12.1 is therefore spot-checked, not independently
re-derived. Exhaustive-absence claims are the kind most likely to be wrong, and
this one has been verified at four points rather than end to end.

## 13. Cocircular-fan formalization and exact-17 order cut — 2026-08-19

The vector route is now banked without angle coordinates.

- `ConvexCocircularHalfPlane.lean` proves the strict separating vector for a
  finite cocircular class in a convex-independent carrier, excludes antipodal
  class pairs, and records open-half-plane membership. This discharges the
  geometric content of §§3.1 and 3.3.
- `CocircularPerpendicularBisector.lean` proves that an equidistant witness is
  a scalar multiple of the sum direction, that a non-apex witness has nonzero
  parameter, and that opposite signed sides of the chord force the parameter
  past one half. This discharges the reusable content of §§3.2 and the
  off-arc placement step.
- `CocircularPentagonOrder.lean` proves the angle-free fan identity used by the
  terminal consumer: the three nested positive sum directions preserve the
  signed-area side from the first class chord to the final blocker direction.
- `CocircularPentagonDistanceLadder.lean` proves the strongest unconditional
  coordinate-free coefficient ladder available from these hypotheses:
  `0 < tv < 1`, `0 < td < 1`, and `0 < td * tv < tv`. It deliberately does
  not claim `tx < 1`; a class pair can span an obtuse angle while remaining in
  one open half-plane.
- `BlockerVExactSeventeenCocircularPentagonOrder.lean` packages the increasing
  and decreasing boundary forms as source-clean contradiction theorems.

The exact-17 ingress is also complete. Inside
`exists_exactSeventeenSourceRealization_of_exactCover`, the exact nine-point
cap pullback identifies the physical apex with an outside label. The order-one
position table then supplies the six strict boundary comparisons needed by the
fan consumer, in either orientation. Consequently the constructor now returns

    ∃ source, source.model.order = 0.

`BlockerVExactSeventeenCocircularPentagonOrderPromotion.lean` promotes this as
the single unit `[pos (.namedOrder 0)]` on top of the current cumulative root.
The remaining exact-17 obligation after this source reduction is the UNSAT
claim for that extended CNF; the order-one half of the finite search is no
longer a source-valid branch.

The on-spine `hunsat` placeholder stays OPEN. The exact 7,198,853-clause Lean
export was authenticated and run, but PIQD returned a replayed `SAT` model,
not a proof-bearing `UNSAT`. Therefore the currently written premise for that
root is false and cannot be discharged; after CEGAR reaches a later
source-valid terminal child, `Rigid221SourceHeavy` must be rewired to that
child's source adapter and independently replayed certificate.

The terminal preflight also exposed a process error: the authenticated V9
parent model already selected order zero, so the order-zero unit could not cut
it. Future unit/split runs must first replay the exact parent model and require
a falsified suffix clause. Mining the returned model produced a new checked
eight-hit two-Kalmanson occurrence, now promoted as four clauses in
`BlockerVExactSeventeenCocircularPentagonOrderSatRefinementSchemas.lean`.
That cut passed the new preflight but its 7,198,857-clause child was also SAT.
The next model contains a smaller unbanked seven-hit reverse convex-five core;
the next proof task is a reusable checked exact-17 convex-five occurrence
adapter, not another circumfan lemma or an unreviewed solver launch.

That adapter and the first concrete occurrence are now banked. Their
four-clause orbit produces the exact 7,198,861-clause Lean root with SHA-256
`8f6b60e8715d00e5bbc24e2ad30db6c62f95d9b44aafa3bc8b58184644130516`;
the prior `e520c77...` model falsifies exactly its first suffix clause. The
single one-core run was again `STRUCTURAL_SAT`, job
`4cd6adc1-e4b1-4016-bfbd-b273ff27fa7b`, model SHA-256
`886314a18665085f28a2ea52e219f3547bdd434762de181edd5afdaa2e0cf201`.
Its source mine found a second seven-hit reverse convex-five occurrence with
core `(15,7,12,2,9)` and guarded order-zero clause
`[-307,-50,-42,-169,-161,-212,-207,-214]`. The reusable bridge already covers
it. That occurrence was first generalized to every five-tuple increasing
relative to the fixed cut at zero. The resulting 12,376-clause bank was
source-clean and cut the motivating model, but PIQD returned another replayed
SAT model. Its mandatory mine exposed two wrapping occurrences of the same
convex-five theorem. Thus the fixed-cut bank was valid but not cyclically
complete.

The corrected bank cuts the boundary order at `y` and enumerates all positive
offsets `0 < c < b < x < a`, in both orientations. It contains 61,880 clauses
in total, of which 49,504 were absent from the fixed-cut root. The Lean-owned
successor has 7,260,741 clauses and SHA-256
`f4b94e454967b6912be24c10490fc49201510e40aded58a45b72850922d607fc`.
The prior SAT model falsifies exactly two new clauses. Authenticated PIQD job
`1627d026-10d5-4960-af8d-28427071101c` nevertheless returned another replayed
SAT model. The complete cyclic convex-five family therefore does not cover
the exact-17 source root.

The new model contains eleven distinct cyclic occurrences of the already
proved sparse six-point Euclidean obstruction. The complete source-clean bank
for that family adds 148,512 clauses. Its 7,409,253-clause Lean-owned root has
SHA-256
`ff41a77a3e6376583b52d378efc268203ad6bb400ed049d05488d6bdf3aef2ac`;
the motivating model falsifies all eleven mined clauses. Its authenticated
PIQD job `38cd372e-bd52-4d85-877f-2a69892f96ff` timed out after its 3,600-second
CaDiCaL budget and returned `UNKNOWN`. It supplied neither a model nor an UNSAT
certificate. The current execution route is therefore the source-covered
thirteen-cell split by the next-row center, with one Lean-defined unit per
cell. This remains finite CEGAR work until every cell has a checked terminal
result and the Lean coverage coordinator consumes them. The bank modules are
not imported by the current publish-spine leaf; they become load-bearing only
when that checked finite result is wired into the leaf.

The bisector-exhaustion kernel is separately banked in
`ConvexPerpendicularBisectorSides.lean`, with a parameterized exact-17 source
adapter in `BlockerVExactSeventeenPerpendicularBisectorExhaustion.lean`.
It is not counted as an unconditional clause family: the current finite source
interface must first supply the concrete cross-row memberships and
distinctness premises for a chosen edge.

`ConvexPerpendicularBisectorArcSides.lean` supplies the generic strict
closer-side propagation on both boundary arcs. Its vacuity-free wrappers take
an explicit anchor carrier on the arc; bisector exhaustion by itself does not
produce such an anchor. This records the exact ingress still needed before the
comparison family from Theorem C can be promoted.

## 2026-08-20 next-center coverage execution

The cumulative cocircular-order, cyclic convex-five, and sparse six-point
families still leave the unsplit exact-17 root solver-`UNKNOWN`. The current
production route is therefore the complete source-proved split on the next
selected-row center, not another unscoped motif append.

`BlockerVExactSeventeenSparseSixPointNextCenterCoverage.lean` proves that the
thirteen legal center labels are exhaustive and that an order-zero source
assignment satisfies its matching parent-plus-unit cell. Its coverage
coordinator needs one checked UNSAT theorem per cell. The direct cell exporter
and the preparation script agree byte for byte on the checked center-zero
package; all other packages share the same parent body and vary only in that
unit. The prepared campaign manifest is
`99cbff60f0276dee96bc458e6d2421a8b839eddddd20585d0a47586f7719df95`.

The thirteen PIQD jobs run with at most twelve one-core solvers in parallel.
The outcomes decide the next step without overstating closure: certified
UNSAT for every cell feeds the existing Lean coverage consumer; any replayed
SAT cell becomes the sole input to the next source-valid theorem mine;
timeouts require a finer source-covered split. The on-spine leaf is unchanged
until one of those routes supplies a complete checked argument.

The first twelve center jobs reached their 3,600-second limits and returned
solver `UNKNOWN`; center `16` is the queued final job. Those outcomes do not
close any center cell. The active successor is therefore the source-total
physical-hit split proved in
`BlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage.lean`:
for each fixed center, the next row has either no hit in `{6,7,8,9,10}` or one
unique non-self hit there. This gives 76 cells. The coverage coordinator,
direct exporter, and focused preparer tests are green, and an independent live
preflight authenticated all thirteen parent packages. The refined CNFs are
being prepared for a PIQD campaign with the same twelve-core aggregate cap.

Before submission, the unique-hit arm was strengthened from a lone positive
unit to the complete source-proved physical slice: the selected physical point
is positive and all four other physical points are negative. The no-hit arm
already contains five negative units. The weaker prepared package is
superseded and will not be submitted; the full-multiplicity package is the
production root.

The first batch also found and repaired a shared-driver bottleneck: journal
sealing authenticated a repeated content-addressed CNF once per poll record.
The audit now hashes each unique referenced artifact once under the preexisting
immutable-store contract. This changes no recorded solver outcome and reduces
terminal sealing from repeated 333 MB reads to one read per unique artifact.

The production package has now passed its complete 76-cell audit. Its
campaign manifest SHA-256 is
`8563223a41c85ebb8979038f4a1b39183f751b1bc96ea60f10d159faac78bb8e`,
and a direct Lean export of center zero with unique physical hit six matched
the prepared bytes at SHA-256
`55ee9d0cad927d88c730920988f93931459c340f1ebc5629af88ba193b0561e9`.
The 70 children of the twelve timed-out centers are running through PIQD with
twelve one-core jobs at a time and 3,600-second solver/replay limits. Center
16 has now also returned sealed solver `UNKNOWN`; all thirteen parent cells
therefore require the physical refinement. Its six children are prepared and
queued behind the active batch so the campaign remains within the twelve-core
aggregate cap.

For promotion, each terminal UNSAT cell must yield a checked theorem for its
exact DIMACS bytes. A 76-case finite coordinator supplies the abstract cell
contradiction required by
`false_of_all_sparseSixPointNextCenterPhysicalSliceCells`. The live cap-nine
branch already constructs the matching source realization and has already
proved its named order is zero, so that coordinator is the final finite
consumer needed to replace the current exact-17 placeholder.

The certificate ingress module is now implemented and target-built. It fixes
the LRAT relabelling once for the whole 76-cell family and exposes a single
all-certificate theorem with the exact hypothesis required by the source
coverage consumer. Thus terminal solver work no longer has an unimplemented
Lean representation bridge behind it.

The first refined terminal model is source-structural SAT in the center-zero,
physical-none cell. Exact replay validates the model against its 7,409,259-clause
cell, but no metric witness exists. A wave-local mine identifies an existing
four-row two-circle bisector contradiction with order-zero incidences

```text
6 : {10, 12},  2 : {10, 7},  7 : {2, 12},  12 : {7, 2}.
```

`FourPointTwoCircleBisectorOrderCore.false_of_core` already proves the geometric
contradiction. The only remaining ingress is the exact-17 source adapter and its
four guarded order/orientation clauses. These clauses will be appended to the
current cumulative root before regenerating the physical-cell family; the live
leaf stays unchanged until checked terminal certificates cover every refined
source category.

The predecessor seventy-cell launch is terminal with that one structural SAT
model and sixty-nine solver `UNKNOWN` results. Its six unlaunched center-16
cells are subsumed by the corrected 76-cell successor campaign.

That adapter and its source-total physical-slice coordinator are now banked at
commit `9bf6bd2c`; the governed preparer's next-center unit correction is banked
at `8965fe83`. The four orbit clauses extend the cumulative root to
7,409,257 clauses; every one of the 76 exact physical cells has 7,409,263
clauses. Targeted Lean builds and independent axiom audits pass, with no new
custom axiom or `sorryAx`.

The independently audited successor package is now live in PIQD. Its root
SHA-256 is
`f829bbaf0bd92490e8d6627b9f0271bd8491e9555ebf3042e5e99efdcf1e6747`;
its campaign SHA-256 is
`5e00a9a5206cbf35393e065a5b43e9daee2ae1a6c0e1eca4ee44a1cbf809ba33`.
The launch uses eleven concurrent one-core drivers and the existing one-hour
solver/replay limits.

The exact successor-certificate ingress is banked at `981218e4`; it provides
the zero-based LRAT relabelling, typed-cell UNSAT transport, and the all-76
certificate coordinator required by the source coverage theorem.

The first eleven jobs in the corrected campaign have now returned
authenticated solver `UNKNOWN` after their full 3,600-second `unsat`-profile
limits. They prove no cell contradiction. The next eleven one-core jobs are
still running under the same governed campaign, so the source-total 76-cell
route remains active.

To test solver phase bias without changing the formula, a separately
identified `sat`-profile portfolio has been prepared for the six physical
categories at `nextCenter = 2`. It references the existing Lean-exported CNFs
byte for byte and supplies new authenticated producer, wave, and raw-DIMACS
identities. Two independent adversarial audits rejected and then verified the
launcher after fresh-job, descriptor-custody, canary-result aggregation, and
exact-inventory repairs. Offline `static-check` now authenticates all six
distinct identities; the first production action is the one-cell
physical-`none` canary, followed by the other five only if its sealed custody
validates. This auxiliary profile is a solver-discovery lane, not a new
mathematical assumption or a closure claim.

An audit of the current atomic prose proof found no new exact-17 cap-nine lemma.
The latest A5 additions require cardinality twelve. The A2 splitter continues to
produce the exact-cover source realization, while A3 and A4 remain open and are
not available as computational assumptions.

## 2026-08-20 SAT-profile canary and theorem-mine checkpoint

The corrected 76-cell UNSAT-profile campaign is source-authenticated under
root `f829bbaf0bd92490e8d6627b9f0271bd8491e9555ebf3042e5e99efdcf1e6747` and
campaign `5e00a9a5206cbf35393e065a5b43e9daee2ae1a6c0e1eca4ee44a1cbf809ba33`.
The first 22 jobs are authenticated `SOLVER_UNKNOWN`; no cell is closed by
those timeouts.

The SAT-profile canary, PIQD job
`48275627-f0f5-4f13-b50d-f0ca53a6b4ad`, is sealed `STRUCTURAL_SAT`. This is a
finite Boolean SAT assignment, not a Euclidean counterexample and not an
exact-17 closure. Independent replay checked its exact CNF
`227005eefeec723b2b0a04d4f8d75341a64ed3e2f5060c1ee1deef91f9763817` with 308
variables and 7,409,263 clauses, with zero failures.

The mandatory wave-only theorem mine found no new general theorem. Its first
report claimed 20 paired occurrences, including a size-four occurrence. That
interpretation was wrong: predecessor job
`48275627-f0f5-4f13-b50d-f0ca53a6b4ad` and successor `96551f95` both select
`NamedOrder = 0` (`var307 = true`, `var308 = false`), while the predecessor
miner hardcoded `NamedOrder = 1`. The reported size-four occurrence was already
present once in the predecessor CNF; the successor duplicated each of its four
clauses. The Lean commits `7c2f271c` and `722f56df` are valid, but this finite
CEGAR step was a no-op. The SAT outcomes and encoding remain valid; only the
mine's progress interpretation was wrong.

## 2026-08-20/21 exact-17 two-Kalmanson promotion checkpoint

The canary occurrence is promoted in `7c2f271c`, with the source-total
physical successor and certificate-ingress modules in `722f56df`. The
source-authoritative row data is:

```text
forward:  5 -> {6, 7},  11 -> {6, 7}
reverse:  Fin.rev 5 -> {Fin.rev 9, Fin.rev 10},
          Fin.rev 11 -> {Fin.rev 9, Fin.rev 10}
```

Correction to earlier transposed prose: reverse uses `Fin.rev` on both the
center and support labels; it is not a center/support coordinate transpose.
The four guarded clauses are the order-0 forward and reverse clauses and the
order-1 forward and reverse clauses, with checked DIMACS forms
`[-307,-166,-161,-64,-59]`, `[-307,-68,-67,-170,-169]`,
`[-308,-214,-212,-61,-59]`, and `[-308,-68,-67,-221,-220]`.

The cumulative root now has 7,409,261 clauses; each of the 76 source-total
physical cells has 7,409,267 clauses. Independent audit and the governed
certificate-ingress build both passed. No new theorem was found, and exact-17
is not closed: the first 22 UNSAT-profile cells are authenticated
`SOLVER_UNKNOWN`, while the canary is only a finite Boolean SAT assignment.

The preparer audit initially found pathname and TOCTOU custody gaps inherited
from its predecessor. Commit `83f958d0` replaces them with retained no-follow
descriptors, a private export workspace, inode-bound no-replace publication,
and pre/post input identity checks. The adversarial re-audit passed, and a
fresh governed skeleton records the repaired preparer digest. Production
export may now proceed; solver submission remains gated on the authenticated
76-cell preparation result.

## 2026-08-21 correction: selector-driven theorem mine

The canary/successor comparison exposed a mine bug, not a SAT or encoding bug.
Both predecessor job `48275627-f0f5-4f13-b50d-f0ca53a6b4ad` and successor
`96551f95` select `NamedOrder = 0` (`var307 = true`, `var308 = false`), but the
predecessor miner assumed `NamedOrder = 1`. The promoted size-four occurrence
was already present once in the predecessor CNF; the successor merely
duplicated each of its four clauses. Commits `7c2f271c` and `722f56df` remain
valid Lean landings, but this finite CEGAR step was a no-op. Existing SAT
results and the encoding remain valid; only the mine interpretation and
progress claim were wrong.

The corrected selector-driven actual-CNF scan finds 11 paired, source-valid
model-cutting occurrences of the existing generic two-Kalmanson theorem:
sizes 8 (six occurrences), 10 (two), 12 (two), and 14 (one). The smallest
support is
`{(0,1),(0,3),(3,9),(3,16),(8,3),(8,16),(16,1),(16,9)}` with active clause
`[-307,-254,-245,-203,-202,-49,-46,-12,-7]`. True eight-hit promotion is in
progress from the original four-row root.

The mine now requires three guards before promotion: decode the selected
order; scan the actual CNF for exact, subsuming, and multiplicity changes; and
falsify the active selector before accepting a pattern. A finite occurrence
that does not cut the selected model and change the formula is not progress.

## 2026-08-22 center-2 survivor refinement

The complete center-2 physical portfolio is now authenticated SAT and fully
replayed for all six categories. The five source-valid clauses committed at
`f3a0cc82` form a 7,409,301-clause root. They cut the `unique-06`, `unique-09`,
and `unique-10` predecessor assignments; `none`, `unique-07`, and `unique-08`
remain exact satisfying assignments of the corresponding successor cells.

Mandatory wave-only mining found 49, 15, and 15 uninstalled occurrences of
the existing generic two-Kalmanson theorem in those three surviving models.
Commit `69fc5c4f` banks one minimal checked occurrence from each survivor,
giving a 7,409,304-clause root and 7,409,310-clause physical cells. No UNSAT
certificate was produced, the stop condition did not fire, and exact 17
remains open. The preparer is being retargeted to the new Lean-owned root.

The next miner-hardening target is full equality-component coverage. The
`none` assignment contains foci `(4,9)` and witnesses `{6,10,15}`, but the
supporting equalities require five-step paths through the selected-row
component. The shared metric probe finds the component, but the source-valid
family scanner does not yet turn arbitrary component witnesses into replayable
paths. The revised miner must enumerate every qualifying component witness and
emit deterministic, bounded, source-replayable path certificates.

Finally, the current audit of `docs/erdos-97-descent-prose-proof-atomic.md`
found no new source-clean drop-in lemma for this packet. The prose descent
library does not presently supply the missing consumer or close this branch.
