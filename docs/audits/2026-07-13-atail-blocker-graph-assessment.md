# ATAIL blocker-graph assessment (2026-07-13)

## Verdict

`CriticalShellSystem.blockerVertex` and
`CriticalShellSystem.exists_blocker_cycle`, even together with ambient global
K4 and cardinality at least 12, do **not** force the two fixed opposite-apex
joint-radius collision required by K-A-PAIR.  The route is insufficient at
that abstraction boundary.

Two exact finite witnesses make the separation explicit:

1. a 12-vertex symmetric distance-equality model has one exact four-class at
   every center, a spanning 12-cycle of genuine deletion blockers, the
   distinct-center support-overlap ceiling `<= 2`, and no two-point joint
   distance fiber at the two fixed centers; and
2. a 33-point integer-coordinate Euclidean set has global K4 at every carrier
   point and loses global K4 after every single deletion, hence directly
   supports a `CriticalShellSystem` and blocker cycles, while the two-center
   squared-distance map is injective for one fixed pair of carrier centers.

The Euclidean witness is intentionally non-convex and has no Moser/cap packet.
It is therefore **not** a counterexample to K-A-PAIR.  It proves the narrower
and useful statement: any successful blocker-based proof must consume new
convex/Moser/cap/full-filter localization.  The functional cycle itself does
not supply that ingredient.

## Exact live target and consumer

The open declaration is

```lean
Problem97.U1LargeCapRouteBTailMetricResidualTarget
  .DoubleApexOffSurplusSharedRadiusPair
```

in `lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2516`.  With

```text
S := leafSurplusPacket ...,
```

it asks for distinct `x,w' in D.A`, both outside `S.surplusCap`, and radii
`r,rho` such that both points have radius `r` from `S.oppApex1` and radius
`rho` from `S.oppApex2`.

The immediate geometric sink is already proved:

```lean
Problem97.U1LargeCapRouteBTailMetricResidualTarget
  .U2NonSurplusSqueeze.oppCap2_escape_gen
```

at `U1LargeCapRouteBTail.lean:2373`.  It turns exactly that pair into `False`
by the two-circle reflection and same-side sign argument.  The problem is a
producer, not a missing consumer.

The routine last step is also already kernel-checked in scratch:

```lean
Problem97.SurplusCapPacket
  .exists_doubleApex_pair_of_joint_filter_card_ge_two
```

in `scratch/atail-force/critical_row_coupling.lean:93`.  Thus the exact
content-bearing target remains

```lean
exists r rho,
  2 <= (((D.A.filter (fun x => dist x S.oppApex1 = r)) inter
          (D.A.filter (fun x => dist x S.oppApex2 = rho))) \
        S.surplusCap).card.
```

## Kernel-checked joint-fiber and marginal boundary

The unimported scratch module

```text
scratch/atail-force/apex_filters/joint_fiber_upper_bound.lean
```

kernel-checks the sink in the exact finite-set form needed by producer design:

```lean
doubleApexJointFiber_sdiff_surplus_card_le_one
```

For every fixed `r,rho`, the intersection of the two full opposite-apex radius
filters outside `S.surplusCap` has cardinality at most one. The module also
proves the symmetric marginal facts:

- some K4 radius at either opposite apex has at least three representatives
  outside the surplus cap;
- some such radius has at least two representatives in the strict interior of
  its own opposite cap; and
- on each three-point off-surplus marginal, distance to the other opposite
  apex has image cardinality at least three, equivalently it is injective on
  that marginal.

This rules out the naive marginal pigeonhole strategy. Large separate radius
classes at the two apices do not create a repeated ordered radius pair; the
existing geometry forces the opposite behavior. The missing producer must use
the other live hypotheses to correlate the two radius partitions strongly
enough to contradict this upper bound.

## Theorem-bank and source preflight

Before analyzing the graph route, this audit read the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md` and its JSON inventory;
- `certificates/erdos97_legacy_general_n_mining.md` and its JSON inventory; and
- `certificates/erdos_general_theorem_p97_mining.md` and its JSON inventory.

The indexed Lean corpora were searched for:

```text
critical shell blocker vertex cycle opposite apices shared radius
blocker cycle exact distance class two centers off surplus
CriticalShellSystem blockerVertex exists_blocker_cycle selectedFourClass support
```

The relevant hits are the current local blocker API, selected-shell uniqueness,
the already-known two-center sinks, and sibling re-exports.  No bank theorem
localizes a blocker cycle to the two Moser opposite apices or forces two
off-surplus common companions in their full exact-radius classes.

The negative conclusion is consistent with the older project record in
`docs/dead-ends.md` under `blocker-digraph-cardinality`: a functional blocker
cycle reaches only the local cycle/vesica layer; upgrading it to a global
contradiction reintroduces the original global incidence problem.

## What the blocker API actually gives

For `H : CriticalShellSystem A`, the imported source proves:

- `H.blockerVertex q` is the chosen center of an exact four-point full shell
  containing the source `q`;
- `H.blockerVertex q != q`;
- after deleting `q`, the chosen center has no K4 class at any radius;
- every selected four-class at that blocker center contains `q`; and
- every such selected support equals the chosen exact shell support.

Finiteness then gives

```lean
exists q k, 2 <= k and Function.IsPeriodicPt H.blockerVertex k q.
```

That periodicity statement contains no assertion that:

1. the cycle contains either `S.oppApex1` or `S.oppApex2`;
2. the two opposite apices are blocker centers for any source;
3. a cycle source belongs to exact-radius classes at two centers;
4. any shell companion lies outside `S.surplusCap`;
5. the independently supplied `CriticalSourceRows` in K-A-PAIR came from this
   witness `H`; or
6. two full filters at the opposite apices overlap at all.

The functional orientation is especially important.  Source membership gives
one edge `q -> blockerVertex q`.  It cannot, by itself, put the same source in
the guaranteed shells at two distinct centers.  The other three members of a
critical shell are companion incidence, not blocker-map incidence.

For a 2-cycle `q <-> p`, the two shell radii are both `dist p q`.  The two
circles therefore have the usual equilateral intersection locations, but the
cycle does not put either location in `A`.  It also does not identify `p,q`
with the fixed opposite Moser apices.  For a cycle of length at least three,
even the adjacent shell radii need not agree.

## Exact 12-vertex equality model

The checker

```text
scratch/atail-force/blocker_graph/countermodel.py
```

uses vertices `Z/12Z`, selected/full supports

```text
E_c = c + {1,2,3,5},
```

and blocker map

```text
f(q) = q - 1.
```

It assigns symmetric distance-equality labels to unordered pairs.  At every
center, `E_c` is the unique class of cardinality four and every other class is
a singleton.  Since `q in E_(q-1)`, deleting `q` destroys the unique K4 at
`f(q)`.  The map is one spanning 12-cycle.  Every two supports at distinct
centers intersect in at most two vertices.

For the fixed centers `0` and `4`, however,

```text
E_0 inter E_4 = {5},
```

and every full two-center joint distance fiber has cardinality one.  Removing
an arbitrary five-vertex `surplus` subset cannot increase a fiber.

Replay:

```bash
UV_CACHE_DIR=/tmp/codex-uv-cache \
  uv run python scratch/atail-force/blocker_graph/countermodel.py
```

The current exact output is:

```text
cardinality                                  12
blocker-cycle length                         12
maximum distinct-center support intersection 2
maximum fixed-center joint fiber              1
maximum fixed-center off-surplus joint fiber  1
```

Classification: **EMPIRICALLY VERIFIED, exhaustive exact finite check within
the symmetric distance-equality abstraction**.  It is not claimed to be a
Euclidean metric realization.

This witness is stronger than merely exhibiting some blocker cycle: its cycle
is spanning, so both fixed centers lie on it, yet the desired common companion
pair is still absent.

## Exact Euclidean global-K4 witness

The checker

```text
scratch/atail-force/blocker_graph/euclidean_countermodel.py
```

contains a fixed set `A` of 33 integer-coordinate points.  All checks use
integer squared distances.  It exhaustively verifies:

1. every `c in A` has at least four other points at one common positive
   distance;
2. for every `q in A`, `A \ {q}` fails that global-K4 property;
3. a surviving blocker center can be selected for every `q`;
4. at the selected center there is one exact four-point radius class
   containing `q`, and after deleting `q` every radius class has cardinality
   at most three;
5. the chosen blocker map has three genuine 2-cycles;
6. exact critical shells at distinct chosen centers overlap in at most two
   points; and
7. for

   ```text
   apex1 = (3,4),  apex2 = (5,1),
   ```

   the map

   ```text
   x |-> (sqdist(apex1,x), sqdist(apex2,x))
   ```

   is injective on all 33 carrier points.

Therefore no two distinct carrier points are co-radial from both fixed
centers, before any surplus-cap deletion.

Replay:

```bash
UV_CACHE_DIR=/tmp/codex-uv-cache \
  uv run python scratch/atail-force/blocker_graph/euclidean_countermodel.py
```

The current output records:

```text
construction SHA-256                    a78922fbf1a30e7642019a65859c93d34d45f668e06e0f60310bf780b45c55c5
cardinality                            33
global K4                              true
every single deletion breaks global K4 true
chosen blocker-cycle lengths            [2,2,2]
maximum two-center joint fiber           1
```

Classification: **EMPIRICALLY VERIFIED by an exhaustive exact-integer
computation; not Lean-kernel checked**.

The limitation is explicit and load-bearing: the set is not convex
independent.  For example, `(3,3)` is the midpoint of the two other carrier
points `(3,1)` and `(3,5)`.  Hence the witness does not satisfy
`CounterexampleData.convex`, does not define the live Moser/cap packet, and
does not refute K-A-PAIR.  It isolates exactly what the graph abstraction has
forgotten.

The script pins the ordered 33-point coordinate tuple and the two fixed
centers by the construction digest above, asserts that digest before doing any
mathematical check, and then runs the exhaustive gate.  A mutation of the
points or centers therefore fails before it can silently replace this witness.

### K-A-PAIR hypothesis map and regression rule

The Euclidean construction realizes the following weakened K-A data exactly:

- finite nonempty carrier with `33 >= 12`;
- genuine Euclidean distances and noncollinearity;
- global `HasNEquidistantProperty 4` at every carrier center;
- failure of the global property after every single deletion;
- an explicit exact-four deletion-blocker choice for every source, hence the
  fields of a `CriticalShellSystem`; and
- genuine blocker cycles plus the distinct-center two-circle overlap ceiling.

It does **not** realize these live K-A hypotheses:

- `D.convex`: this fails by the displayed midpoint witness;
- the minimum-enclosing-circle nonobtuse Moser triangle `MT` or `hCirc`;
- `M`, `CP`, `hM`, `hqCap`, the `>4` surplus-cap bound, the second-cap `>=5`
  bound, or `hNoM44`;
- identification of `(3,4)` and `(5,1)` with
  `leafSurplusPacket.oppApex1` and `.oppApex2`;
- the dangerous p-centered `t2` critical row `rows`, `hcenter`, and
  `hsupport = {q,t1,t2,t3}`;
- `hlocalNoQFree`, `hfixed`, the six-point `hbase` packet, or the live-data
  payload `H`; and
- any surplus-cap membership or off-surplus statement.

This gives a precise regression rule for future relaxed producer lemmas.  Any
candidate whose hypotheses are implied by the first list and whose conclusion
is a two-center shared-radius pair is false on the pinned witness.  A candidate
that is supposed to evade the gate must name at least one fact from the second
list and explain where it is used.  In particular, merely restating global K4,
deletion criticality, cycle length, cycle spanning, shell exactness, or the
two-circle overlap ceiling does not evade the witness.

## Precise missing extra hypothesis

Even the following substantial strengthening is insufficient:

```text
the blocker cycle is spanning, so both opposite-apex vertices lie on it.
```

The 12-vertex model satisfies that statement and still has no joint pair.
Likewise, merely proving that each opposite apex lies in the image of
`blockerVertex` gives only one guaranteed source in each of two different
shells.

The first actually sufficient blocker-shell statement is an apex-localized
off-surplus overlap theorem of the following shape:

```lean
exists qa qb hqa hqb,
  H.centerAt qa hqa = S.oppApex1 and
  H.centerAt qb hqb = S.oppApex2 and
  2 <= ((((H.selectedAt qa hqa).toCriticalFourShell.support inter
           (H.selectedAt qb hqb).toCriticalFourShell.support) \
         S.surplusCap).card).
```

Exact-shell support equations then rewrite this to the full-filter lower
bound, the checked extractor supplies `x,w'`, and `oppCap2_escape_gen` closes
the branch.

This statement is not a routine consequence of `exists_blocker_cycle`; it is
essentially the K-A producer localized to two critical shells.  Calling it a
"blocker-cycle lemma" without deriving it from convex order, cap sizes,
no-M44, or the actual critical-row packet would merely rename the open
obligation.

The missing ingredient must therefore be one of:

1. a convex-cap theorem forcing two off-surplus common companions in exact
   shells centered at the two fixed Moser apices;
2. a full-filter counting theorem that directly gives the joint-fiber lower
   bound; or
3. a critical-row/cap-order contradiction that avoids producing the pair and
   yields `False` directly.

## Circularity check and recommendation

- **PROVEN from current Lean source:** the blocker-map fields, no-fixed-point
  theorem, cycle theorem, source membership, exact support uniqueness, and the
  downstream two-circle contradiction.
- **EMPIRICALLY VERIFIED EXACTLY:** the two finite countermodels above, within
  their stated trust boundaries.
- **REFUTED at the abstraction boundary:** cardinality + global K4 + a
  `CriticalShellSystem`/blocker cycle alone force the fixed-apex pair.
- **CONJECTURED direction:** convex/Moser/cap/full-filter localization can
  force the missing overlap or a direct contradiction.

Do not spend another lane classifying blocker-cycle lengths or trying to force
surjectivity/spanning.  Those strengthenings do not reach the fixed-apex
joint fiber.  Reuse the blocker system only if a new theorem explicitly ties
its exact shell centers and companion supports to `S.oppApex1`,
`S.oppApex2`, and `S.surplusCap`; otherwise move directly to the full-filter or
cap/order producer.
