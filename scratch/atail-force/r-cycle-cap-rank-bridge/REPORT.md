# R minimal-cycle cap-rank bridge audit

Date: 2026-07-15

Status: **SOURCE/BANK AUDIT; NO RANK PRODUCER DERIVED; NO LEAN FILE ADDED.**

This audit concerns the source-exact actual-blocker minimal cycle in
`r-actual-blocker-transition/ActualBlockerMinimalCycle.lean`. It does not
touch production source, `SurplusM44`, `SevenPointTwinFourCircleCollision`,
the protected unique-row lane, or `docs/live-blueprint.md`.

## Verdict

The current exposed cycle data does not instantiate any existing cap-rank or
strict-lap producer. The missing datum is not the existence of a global convex
boundary order: `CGN4g0_globalBoundaryOrder_of_convexIndep` already supplies
one. The missing datum is a **coherently oriented edge realization** in that
order.

For a canonical cycle source `q`, its actual blocker `b`, and the next blocker
`c`, the live critical shell proves only that `q` lies in the exact row centered
at `b`. It does not prove that either endpoint of a cap containing `q,b` lies in
that row. Therefore it cannot construct `SameCapIncompatibleEdge`, whose
`endpoint_radius_eq` field is exactly the endpoint-incidence equality. Cap
membership alone also gives no direction for `q -> b` in a global boundary
enumeration.

Even a directed cyclic advance is not by itself a well-founded rank. A global
CCW enumeration has an arbitrary cyclic cut, so a walk may wrap once. The
sibling `StrictLapPacket` avoids this only by already carrying all three strict
linear pushes, including the no-wrap return inequality. No current theorem
produces that packet or retained no-wrap history from the blocker cycle.

Consequently the proposed pointwise theorem

```text
every cycle edge is an existing HIT/OMISSION terminal
or strictly decreases one global cap/boundary rank
```

would itself contain the missing geometric closure theorem. It is not an
adapter consequence of the current cycle structure.

## Exact bank map

The required registries and exhaustive inventories were checked, followed by
focused `nthdegree docs search --lean` queries for blocker cycles, endpoint
spending, source pushout, rank intervals, strict laps, and global boundary
orders.

The closest checked results are all downstream consumers:

- `source_pushout_left/right` assume a constructed
  `SameCapIncompatibleEdge`, a minor-cap model, endpoint exclusions, and the
  chosen endpoint side;
- `rank_drop` assumes a strict inclusion of two concrete `RankInterval`s;
- `strictLapPacket_nonreturn` assumes the complete globally glued strict lap;
- `endpoint_spending_cycle.lean` closes a periodic blocker orbit only when
  every row spends one fixed endpoint; and
- `ArcBlockContiguity` and `CGN4g0_globalBoundaryOrder_of_convexIndep` provide
  boundary/order transport, not a row endpoint or edge direction.

The current some-HIT/all-OMISSION classifier does not repair this mismatch.
Its robust mate and first-apex radius are chosen independently at every cycle
source. The next blocker is not known to be that mate or to share its
first-apex radius. Hence a two-step blocker incidence cannot silently be
reinterpreted as a HIT terminal.

## Metric extremality does not supply the rank

`ActualBlockerCycleMetricRigidity.lean` isolates the strongest immediate
two-edge metric consequence. For consecutive edges `q -> b -> c`:

```text
dist b c = dist b q
  iff c belongs to the exact source shell at q;

otherwise the radius class at b through c has cardinality at most three.
```

Taking a shortest or longest edge therefore yields either one two-step shell
incidence or one small outgoing radius class. It does not orient every edge,
make the independently chosen robust mate equal `c`, force a cap endpoint, or
give a monotone sequence around the cycle. Edge lengths may decrease and then
increase around a finite cycle. The pinned 33-point exact-integer Euclidean
regression is sharper still: it contains genuine equal-length blocker
two-cycles with disjoint exact-shell supports. Thus the equal-length arm is not
a metric terminal without an additional first-apex-radius or mate-coherence
field.

## Exact obstruction boundary

Three existing regressions locate the missing coupling.

1. `endpoint-continuation/finite_countermodel.lean` is Lean-kernel checked and
   has a cap-contained blocker three-cycle whose rows all omit both cap
   endpoints. It refutes endpoint/rank production from the incidence/order
   surface alone.
2. `r-complement-blocker-map/FiniteBlockerCycleBoundary.lean` is Lean-kernel
   checked and has a robust mutual-blocker two-cycle, a total exact four-row
   table, cap cover, and both cross omissions. It refutes production from the
   robust-history/total-CSS incidence surface alone.
3. The exact Euclidean regressions form a complementary sandwich:
   `global-critical-continuation/verify_total_css_completion.py` has strict
   convexity, MEC/caps, no-`IsM44`, and total CSS but fails all-center K4;
   `blocker_graph/euclidean_countermodel.py` has Euclidean all-center K4,
   deletion criticality, and blocker cycles but is not convex independent.

Thus neither side separately supplies a rank. Any positive theorem must
visibly couple all-center K4 to convex/MEC cap order or to the named live row
data. These regressions are not counterexamples to the complete live parent.

## Full-parent coupling boundary

The complete parent telescope retains the named `p,q,t1,t2,t3,u` rows and
live-data packet, but its current frontier extractor does not align them with
the orbit. In
`fullParent_extracts_criticalPairFrontier_firstApexSplit`, the frontier is
obtained from `D.K4` and an arbitrary witness of `CriticalShellSystem D.A`;
the proof does not use the named rows, live packet, no-`IsM44` field, or
second-large-cap witness. The orbit anchor is only

```text
P.x = F.pair.q,
```

where `F.pair.q` is the newly selected frontier source, not the parent binder
also named `q`. In fact the two roles have opposite placement: `hqCap` puts
the parent `q` in the cap used to define `S.surplusCap`, whereas
`F.pair.q_mem_marginal` puts the frontier source outside `S.surplusCap`.
Therefore they cannot be equal. A theorem claiming that the named live rows
orient the minimal cycle must first prove a different explicit role alignment
or a choice-invariant global statement. Silently identifying the two `q`
roles would be unsound.

The cycle type does retain `D.convex`, all-center `D.K4`, the derived surplus
packet, the total CSS, and the robust-history pair. A direct theorem may use
that combined surface. The audit does not show that such a theorem is false;
it shows that proving it is the new load-bearing geometry, not existing
rank-interface plumbing.

## Smallest honest next producer

A cycle-closing producer must be cycle-wide, not a bare one-edge rank claim.
For every nonterminal edge it must construct one of:

1. a same-cap edge with a concrete spent endpoint in the actual row, a
   source-exact successor, and a strict inclusion of concrete rank intervals;
2. a cross-cap edge with a common global-boundary lift plus retained cut/no-wrap
   history sufficient to build `StrictLapPacket`; or
3. an existing HIT/OMISSION terminal with all of its missing incidences
   produced (third common point for HIT, or the named dangerous-triple/common-
   bisector input for OMISSION).

A weaker theorem which merely chooses a local cap rank, an endpoint side, or
an arbitrary boundary index at each edge cannot compose around the minimal
cycle.

## Epistemic status

- **PROVEN/SOURCE-AUDITED:** the exact contracts above and the absence of a
  banked producer matching the current cycle interface.
- **KERNEL-CHECKED FINITE BOUNDARY:** the two cited Lean countermodels, within
  their stated non-Euclidean abstractions.
- **EXACT COMPUTATIONAL BOUNDARY:** the two cited Euclidean/strict-convex
  regressions, within their pinned models.
- **NOT PROVEN:** logical independence from the complete full-parent telescope.
- **OPEN:** a theorem coupling all-center K4 with cap/global order strongly
  enough to produce one of the three cycle-wide outcomes above.
