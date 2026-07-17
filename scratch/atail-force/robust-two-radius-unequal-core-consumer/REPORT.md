# Unequal two-radius core consumer

Date: 2026-07-16

Status: **KERNEL-CHECKED SOURCE-FACING TWO-PAIR AND LOCAL-COUNT CONSEQUENCES;
SHELL-CURVATURE ROUTE NONTERMINAL.**

## Checked source-facing result

`RobustTwoRadiusUnequalCoreConsumer.lean` consumes exactly

```lean
StrictPairUnequalCoreEndpoint D S firstRow
```

and does not iterate its `FullyDeletionRobustAt` field.

The theorem

```lean
StrictPairUnequalCoreEndpoint.exists_offPhysicalTwoPairPacket
```

uses the two core sources and their pairwise-disjoint exact fresh-center
shells.  Each fresh shell meets the physical exact shell in at most two
points because their centers are distinct.  Since each fresh shell has four
points, each supplies a two-point subset outside `firstRow.support`.

The resulting `UnequalCoreOffPhysicalTwoPairPacket` records:

- two distinct core sources;
- one two-point fiber from each fresh shell;
- both fibers disjoint from the physical exact shell;
- the fibers disjoint from one another, so their union has cardinality four;
- equality of the two fresh-center distances within each fiber; and
- inequality of the two fiber radii.

The companion theorem

```lean
StrictPairUnequalCoreEndpoint.deleted_source_dist_ne
```

states explicitly that the two deleted strict-cap sources cannot themselves
serve as one of the equal-radius endpoint pairs.

Finally, the two full four-point fresh shells contribute disjoint two-subsets
to `IsoscelesPairsAt`.  The strongest checked local counting consequence is

```lean
StrictPairUnequalCoreEndpoint.twelve_le_iCountAt
```

with the weaker bank-facing `seven_le_iCountAt` also available.

These are positive, non-looping consequences of the unequal core.  They do
not prove `False`.

## ShellCurvature applicability audit

The read-only `shell-curvature/ShellCurvature.lean` endpoint needs four
targets in one cyclic lift around a center, with the first two and last two
forming equal-radius pairs, plus a compatible `LiftedPolygonAngleChart` and
positive orientation signs.

The unequal core supplies the metric targets in two ways:

1. every one of its fresh exact shells already has four targets at one
   radius; and
2. the new off-physical packet supplies two disjoint equal-radius pairs at
   distinct radii.

It does **not** supply the remaining source-facing inputs:

- the project still has no adapter constructing `LiftedPolygonAngleChart`
  from `D.convex` / `BoundaryIndexing D.A`;
- for the two-pair packet, the two color pairs may alternate in cyclic order,
  while the shell-curvature interface needs them grouped as the first and
  last pair; and
- the physical row is centered at `S.oppApex2`, not at the fresh center, so
  its radius equality cannot be substituted into a fresh-center
  shell-curvature hypothesis.

Using all four targets of one fresh shell avoids the pair-alternation issue,
but still leaves the lifted-chart adapter.

## Why curvature plus packing is not terminal

Even after supplying a compatible chart, the checked shell-curvature theorem
returns local lower bounds on the two complementary boundary-curvature arcs,
or equivalently an upper bound below `pi` on one closed middle arc plus the
center turn.  `FreshSecondApexCorePacking` instead returns a cardinal
inequality for the complement of one cap, or a nonphysical Moser vertex
opposite a cap of cardinality at least six.  No current theorem compares
these quantities.

In particular:

- curvature does not identify which cap contains the next center;
- packing does not preserve one fixed boundary interval across a transition;
- neither conclusion makes a strict measure smaller; and
- the existing three-cycle regression already forbids interpreting
  independently chosen local intervals as a global rank.

The local isosceles excess is also nonterminal.  The known general upper
bound `iCount(A) <= |A|(|A|-1)` is far above the resulting lower bound in the
live cardinal range.

## Exact convex regression

`check.py` gives an exact rational nine-point configuration consisting of a
center and two disjoint four-point shells of squared radii `81/25` and `1`.
For the displayed boundary order it checks, using `fractions.Fraction`, that
every one of the 63 edge-versus-other-vertex signed areas is strictly
positive.  The minimum exact slack is

```text
648/333125
```

Thus two distinct-radius four-shells at one vertex are compatible with strict
convex position.  This is not a countermodel to the full endpoint: it does
not construct its minimal-deletion criticality, physical row, or MEC cap
packet.  It is a decisive regression against claiming that the two fresh
shells plus ordinary convex shell-curvature are contradictory by themselves.

Audited command:

```text
UV_CACHE_DIR=/private/tmp/uv-cache uv run python \
  scratch/atail-force/robust-two-radius-unequal-core-consumer/check.py
```

## Bank preflight

The required local, sibling `p97-rvol`, legacy `erdos/97`, and older
`erdos-general-theorem/97` registries were checked before deriving the
packet.  Targeted `nthdegree docs search --lean` queries covered:

- unequal-radius minimal-deletion cores and disjoint shells;
- four cyclic equal-radius shell-curvature targets;
- support-disjoint fresh and physical exact shells; and
- ordered-cap nonreturn/rank interfaces.

The useful existing theorems were:

- `SelectedFourClass.inter_card_le_two`;
- `MinimalDeletionCore.supports_pairwise_disjoint`;
- `MinimalDeletionCore.shellAt_radius_eq`;
- the `IsoscelesCount` equidistant-subset consumer; and
- the read-only ShellCurvature equal-radius endpoints.

No bank theorem supplies the lifted chart, a grouped cyclic pairing for the
two extracted fibers, a curvature-versus-cap-packing contradiction, or a
nested/nonreturn measure.

## Exact remaining ingredient

A further shell-curvature attack must prove more than the current local
inequalities.  It needs one source-valid theorem that either:

1. constructs the lifted chart and proves that the two disjoint fresh shells
   force incompatible middle-arc budgets; or
2. retains one fixed boundary interval across the successor construction and
   proves strict containment/nonreturn.

Without one of those couplings, the endpoint remains a genuine unequal-core
residual rather than a terminal contradiction.

## Validation

The source file and the read-only ShellCurvature predecessor were compiled
with the project-pinned Lean 4.27 toolchain.  The consumer emitted:

```text
/private/tmp/p97-two-radius-unequal-core-consumer-427/
  RobustTwoRadiusUnequalCoreConsumer.olean
```

Every printed declaration has axiom closure exactly:

```text
propext, Classical.choice, Quot.sound
```

No `sorry`, `admit`, declared axiom, native computation, unsafe definition,
or heartbeat override is present.  No production source, closure document,
proof-blueprint state, stopped lane, or read-only shell-curvature artifact was
modified.  This checkpoint does not close a production `sorry`.
