# ATAIL-FORCE three-center surface — formulation

## Purpose and epistemic boundary

This directory is the first geometric successor to the negative
`census/q3_two_center/` result. Q3 coupled one selected-four class at two Moser
vertices. The present surface couples the selected-four classes at all three
Moser vertices through the same physical support points and one global convex
order.

The source alphabet is the pinned 3,375-row L2/full-participant inventory in
`certificates/multi_center/reports/l2_class_inventory_certificate.json`.
Each row records:

- which Moser anchors lie in each of `K(U)`, `K(V)`, and `K(W)`;
- for every non-Moser support point, its cap and its membership mask in those
  three classes; and
- the finite LOCAL cuts already used by the multi-center census.

The row forgets the order of support points inside each cap. A real convex
configuration supplies such an order. The surface therefore expands a row by
all distinct permutations of its membership-mask multiset in each cap. Points
with equal masks are interchangeable in this window and are quotient out.

This is a **preflight and decision surface**, not a proof of ATAIL-FORCE:

- no geometric solver sweep has been run here;
- no SAT window is a full configuration;
- no UNSAT result is a Lean theorem without exact certificate replay and an
  extraction theorem from the live leaf to this inventory; and
- even an exhaustive exclusion of selected-four supports would still have to
  be connected carefully to the required full-filter overlap.

The exact theorem-facing target remains the off-surplus full-filter
intersection of cardinality at least two in
`docs/atail-force-producer-plan-2026-07-13.md`.

## Coordinates and membership equalities

Use the same similarity gauge as Q3:

```text
V = (0,0),  W = (1,0),  U = (ux,uy),  O = (1/2,oy).
```

The variables are `ux`, `uy`, `oy`, the MEC squared radius `R2`, the three
class squared radii `ru2`, `rv2`, `rw2`, and two coordinates for each interior
support point.

For every order-decorated row the exact equations are:

1. `dist2(U,O) = R2` and `dist2(V,O) = R2`; the `W` equation is redundant in
   this gauge.
2. If a Moser anchor or an interior support point has membership bit `c`, its
   squared distance from center `c` equals that center's class radius.

Every valid row has four selected members at each of the three centers, hence
exactly 12 membership equations and 14 equations total.

## Leaf-implied inequalities

For `m` interior support points the system also contains:

- positivity of `R2`, `ru2`, `rv2`, and `rw2`;
- MEC-disk containment for every interior support point;
- the three nonobtuse-triangle inner-product inequalities;
- the strict three-chord cap signs for every interior point; and
- every positive cyclic triple in the single global order

  ```text
  (V, S-block, W, O1-block, U, O2-block).
  ```

Thus the system dimensions are:

```text
variables            = 7 + 2m
equalities           = 14
weak inequalities    = m + 3
strict inequalities  = 4 + 3m + choose(m + 3, 3).
```

The equality-only solver boundary additionally exposes all pairwise squared
distances plus the Moser-triangle signed area as Rabinowitsch separators.

## Fail-closed inventory replay

Before a row can emit a system, `three_center_surface.py` replays:

- the canonical class-key length and SHA-256;
- three selected-four cardinalities and the own-center exclusion;
- H1 in both caps containing each Moser center;
- pairwise selected-class overlap at most two;
- the three-center consequence of C4 (at most one mask-7 point); and
- K-Q3-1 and K-Q3-5 for all three pairs.

It also recomputes the complete sorted-key inventory digest
`888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40`.
The checkpoint counts the full order surface combinatorially and materializes
representative systems only as a construction smoke gate.

## Exact finite reductions

`reduction.py` applies all six simultaneous relabelings of the three Moser
vertices and the three class centers. It transforms anchor masks, cap labels,
point masks, and the complete cyclic decoration; odd permutations reverse the
cycle before it is normalized back to the standard CCW gauge. All 20,250
class/permutation edges stay inside the pinned inventory, and the canonical
decoration round-trips on every edge.

This gives two distinct reductions:

- the 3,375 joint classes form 590 S3 orbits; retaining the complete order
  menu of one class representative leaves 30,997 decorated cases; and
- after omitting cap location and order, the 14-equation layer has 343 raw
  equality skeletons and 70 S3 orbits.

The second number is an equality-ideal triage surface only. A kill there
transfers to every cap/order refinement of the same raw skeleton; a surviving
equality skeleton says nothing about its inequalities. The checkpoint verifies
the finite group action and its order bijection exactly. It does not yet emit
an independent algebraic certificate for the similarity/reflection step used
to restore the fixed `V=(0,0), W=(1,0)` gauge after relabeling; that standard
geometric transfer is recorded in the Q3 formulation and remains an explicit
acceptance item before a representative-only solver verdict is promoted.

## Bare equality layer is a proved negative terminal

There is no reason to run an emptiness engine on the unsaturated 14-equation
ideals. Every one of the 343 raw equality skeletons has the same exact
collapsed solution over `Q(sqrt(3))`:

```text
U = (1/2, sqrt(3)/2),  V = (0,0),  W = (1,0),
O = (1/2, sqrt(3)/6),  R2 = 1/3,
ru2 = rv2 = rw2 = 1.
```

For an interior point with membership mask `m`, choose any Moser vertex whose
bit is omitted by `m`. Such a vertex exists because the replayed Q3 cuts leave
no mask-7 point. The unit equilateral triangle then puts that point at squared
distance one from every selected center in its mask.

The checkpoint substitutes this witness into the generators of one
representative of every raw skeleton, verifies all 4,802 equations exactly,
and rejects all 1,029 single-radius mutations. The support points collide with
Moser anchors, so the witness deliberately fails distinctness separators and
the strict geometric inequalities.

## Separator-saturated equality layer is also a negative terminal

The first bounded separator-saturated `msolve` pilot selected one immutable S3
orbit representative in each interior-support stratum from 6 through 12. All
seven cases hit their 20-second limit, emitted no output, and consumed 141.357
seconds in total. This is a negative tractability result only: it gives no
emptiness, dimension, or mathematical verdict, and does not justify a larger
run of the same encoding.

The exact constructive replay then settles the underlying equality question.
`distinct_equality_checkpoint.py` constructs one separator-satisfying real
algebraic witness for each of the 343 raw equality skeletons. It independently
checks all 4,802 membership/MEC equations, all 19,978 pairwise-distinctness and
nondegenerate-Moser-triangle separators, and the reality of every coordinate.
There are no complex fallback rows.

Consequently both bare and separator-saturated equality-only impossibility are
**DONE-NEGATIVE**, even over real algebraic coordinates. This is not a full
geometric realization: the constructive checkpoint checks no MEC-disk,
nonobtuse, cap-sign, or global-order inequality and no full-filter pair. Any
useful successor must consume those inequalities or the live full-filter and
critical-row hypotheses.

Run the permanent preflight with:

```bash
UV_CACHE_DIR=/tmp/codex-uv-cache \
  uv run --with sympy python -m census.atail_force.checkpoint --check
```

No decision engine is invoked by that command.

## Bounded full-inequality pilot

`inequality_pilot.py` freezes the same seven representatives used by the
separator pilot, one in every interior-support stratum 6 through 12, but emits
the complete disk, nonobtuse, cap-sign, and global-order constraint set. The
manifest permits one sequential Z3 4.16.0 QF_NRA/NLSAT process, 30 seconds per
case, and a 240-second aggregate wall. It promotes SAT only when every model
coordinate is rational and an independent exact SymPy replay verifies every
generator; UNSAT remains a proposal without an independently replayed
certificate.

The immutable run is **DONE-NEGATIVE-TRACTABILITY**: all seven cases returned
`TIMEOUT` and consumed 219.901 seconds in total. It produced no model, no UNSAT
proposal, and no mathematical classification. The artifact therefore rejects
an immediate budget increase or bulk sweep, not any geometric row.

## Bounded cvc5 cross-engine checkpoint

After Census-554 stopped and released compute to ATAIL, `cvc5_pilot.py`
translated exactly those same seven immutable full-inequality systems to
SMT-LIB and submitted them sequentially to cvc5 1.3.3 `QF_NRA --nl-cov`.
The V2 manifest required one process, effective nice at least 10, 30 seconds
per case, and a 240-second aggregate wall. A fail-closed priority preflight
verified effective nice 10 before either smoke query or a case ran.

The terminal checkpoint is again **DONE-NEGATIVE-TRACTABILITY**: all seven
queries reached cvc5's internal timeout in 219.217 seconds, with no SAT status,
no UNSAT status, and no model. cvc5 terminates this timeout path by signal after
printing `cvc5 interrupted by timeout.` without a status line. The immutable
raw V2 result retained that evidence but the first parser labeled it `ERROR`;
`cvc5_pilot_checkpoint.py` binds the raw result, manifest, nice/smoke gates,
system digests, SMT2 digests, constraint ledgers, return code, elapsed bounds,
and exact diagnostic, then normalizes only that shape to 7/7 `TIMEOUT`.
Mutation tests reject any diagnostic drift. No solver rerun was used for the
normalization.

The result/checkpoint artifacts are:

- `cvc5_pilot_manifest_v2.json`;
- `cvc5_pilot_results_v2.json`; and
- `cvc5_pilot_checkpoint.json`.

The earlier V1 launch was aborted when a live process audit found sandbox
`setpriority` denial and effective nice 0. It wrote no result and carries no
verdict. Neither cvc5 artifact classifies a row or changes the rejection of a
blind nonlinear surface sweep.

## First bounded order-fan kernel

The next diagnostic shrank the frozen six-interior-point system instead of
raising a solver budget. Its equality, disk, nonobtuse, and cap-side base is
SAT. Adding only the first seven cyclic-order inequalities, the fan based at
the oriented edge `v2 -> s1`, gives a repeatable Z3 UNSAT proposal. The
conservative deletion script `scratch/atail-force/order_fan_minimize.py`
retains 15 scalar constraints.

That proposal no longer depends on solver trust: the explicit theorem
`Problem97.ATAILForceScratch.orderFanKernel` in
`scratch/atail-force/order_fan_kernel.lean` proves the retained implication in
Lean. Geometrically, it excludes one order pattern containing two surplus
points shared with the adjacent apex classes and an indicated opposite-cap
member of the second class. No generated SAT/UNSAT certificate is imported by
the proof.

The exact simultaneous-S3 matcher `order_fan_coverage.py` scans all 167,782
order decorations and finds 39 matches in 21 joint classes. Its claim is only
combinatorial coverage of this selected-four surface: there is no live-leaf
inventory bridge, full exact-radius-filter conclusion, or on-spine Lean
consumer. `edge_fan_strata.py` also gives only `UNKNOWN` at five seconds for
each of the other six frozen strata. Thus this is a checked narrow cut and a
theorem-extraction template, not ATAIL-FORCE.

## Future solver verdicts

A later controlled sweep must use these labels:

- `EXCLUDED-CERTIFIED`: exact UNSAT certificate independently replayed against
  the emitted generators;
- `REALIZED-EXACT-WINDOW`: exact model passes every equality and inequality;
- `SAT-UNVERIFIED`, `UNKNOWN`, `TIMEOUT`, or `ERROR`: no mathematical claim.

An exhaustive `EXCLUDED-CERTIFIED` surface would be a strong geometric
obstruction, but still needs the missing Lean extraction/coverage bridge. A
realized window only identifies which additional full-filter, critical-row, or
unselected-point information ATAIL-FORCE must use.
