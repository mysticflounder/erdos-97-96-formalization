# Retained-matching endpoint/path continuation audit

Date: 2026-07-17

Status: **KERNEL-CHECKED SOURCE-VALID CONTINUATION; THE NAIVE COLLISION-CONSUMER
FACTOR DOES NOT CONNECT; NO DIRECT `False` AND NO PRODUCTION `sorry` CLOSED.**

## Route correction

The production endpoint split in
`ATailRetainedMatchingCommonDeletionCycle` leaves:

1. an endpoint critical fiber with a forced first-apex `RowHit`; or
2. a two-edge path whose three actual blockers are pairwise distinct.

The suggested next step was to factor
`RetainedCollisionDifferentPairConsumer` over

```text
FrontierCommonDeletionCriticalFiber + RowHit.
```

That factoring is mathematically valid, but it does not by itself connect the
matching endpoint to the consumer.  For the source-tagged choice

```text
C = walk.first,
J = walk.second,
K = walk.next,
```

the first-apex equality `OJ = OC` is available because `first` and `second`
are both on the retained radius.  However the two-step walk already proves

```text
K not in H.selectedAt J.
```

This is exactly the negation of the different-pair consumer's required
`K_mem_J_shell`.  The checked theorem
`endpoint_next_not_mem_middle_shell` records this implication.  Therefore the
middle source must not be relabeled as the missing cross-hit producer.

## Exact endpoint-collision continuation

`MatchingEndpointPathTerminal.lean` makes a stronger, source-valid choice.
From the endpoint fiber's forced `RowHit`, it chooses

```text
J in the selected first-apex row
```

with `J` different from:

- both critical-fiber endpoints; and
- the middle source of the original two-step walk.

The existence theorem is:

```lean
nonempty_endpointFreshFirstApexRowSource
```

The support has cardinality four, while only three points are forbidden, so
this is unconditional.  In particular, `J` is a genuinely fourth source; it
does not replay either of the two stored walk edges.

The actual critical row sourced at this new `J` has the exact split:

```lean
EndpointFreshCrossOrCommonDeletion.crossHit
  (K_mem_J_shell : K in H.selectedAt J)

EndpointFreshCrossOrCommonDeletion.freshCommonDeletion
  (K_not_mem_J_shell : K not in H.selectedAt J)
  (packet : CommonDeletionTwoCenterPacket D H K
    S.oppApex1 (H.centerAt J ...))
```

and

```lean
nonempty_endpointFreshCrossOrCommonDeletion
```

proves the split without any new hypothesis.

The positive arm supplies precisely the previously missing source-indexed
cross incidence.  The negative arm is not an anonymous fallback: exact-shell
semantics turn the omission into survival of deleting `K` at `blocker(J)`,
while first-apex full deletion robustness supplies the other center.  Thus it
produces a new common-deletion edge whose source `J` is different from all
three original walk sources.

## Exact three-distinct-blocker continuation

For the `threeDistinctBlockers` endpoint, the file splits the closing relation
between `next` and `first`:

```lean
ThreeDistinctEndpointCrossOrCycle.crossHit
  (first_mem_next_shell : first in H.selectedAt next)

ThreeDistinctEndpointCrossOrCycle.threeStepCycle
  (first_not_mem_next_shell : first not in H.selectedAt next)
  (thirdPacket : CommonDeletionTwoCenterPacket D H first
    S.oppApex1 (H.centerAt next ...))
```

The theorem

```lean
nonempty_threeDistinctEndpointCrossOrCycle
```

is kernel-checked.  In the omission arm, `thirdPacket` is the source-exact
third edge

```text
first -> second -> next -> first.
```

This is a real three-cycle with its actual blocker origins retained, not a
cycle in an anonymous packet graph.

## What this does and does not close

No endpoint arm is contradictory from these facts alone.

- On the endpoint-fiber `crossHit` arm, the row equalities now match the
  generic critical-fiber Kalmanson consumer, but a compatible full-boundary
  order is still required.  No current theorem derives that order from the
  endpoint packet.
- On the endpoint-fiber `freshCommonDeletion` arm, the walk has a genuinely
  new fourth source.  Termination needs a full-geometric nonreturn/rank theorem
  or a cap-local consumer retaining this provenance.
- On the three-distinct `crossHit` arm, the exact new cross incidence must be
  coupled to cap/order data.
- On the `threeStepCycle` arm, existing exact regressions show that a
  geometry-free common-deletion cycle is not contradictory.  A consumer must
  visibly use convex/MEC placement, the full critical map, or cumulative
  deletion/minimality beyond the local packets.
- The `sourceReturn` arm remains the already-audited source-exact two-cycle.

The narrowed parent-facing research surface is therefore:

```text
endpoint fiber:
  fresh actual cross hit at a genuinely fourth source
  or a genuinely new common-deletion edge

three distinct blockers:
  closing actual cross hit
  or a source-exact three-cycle.
```

This is stronger than merely factoring a consumer signature, and it avoids
introducing an unproduced cross-incidence abstraction.

## Theorem-bank preflight

Before deriving the continuation, this lane checked the required registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` banks;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered:

```text
common deletion two center packet critical fiber row hit distinct blockers
two source-exact common deletion edges three pairwise-distinct blockers
frontier common deletion critical fiber row hit cross incidence cyclic order
selected four class preserving two prescribed radius-class points
cross deletion survives iff not in selected support
```

The closest current theorems are:

- `CriticalFiberClosingCore.OrderedCrossRowCore.false`;
- the two production retained-collision different-pair Kalmanson terminals;
- `cross_deletion_survives_iff_not_mem_selected_support`; and
- the common-deletion constructor.

No banked theorem consumes only the endpoint fiber plus `RowHit`, nor only the
three source-exact cycle edges.  The sibling U5 and U1 contradiction consumers
still require additional named incidence, slot, or metric producers.

## Validation

The scratch file was elaborated from the Lake root with the repository's
direct single-file scratch exception:

```text
cd lean
lake env lean -s 65536 \
  ../scratch/atail-force/matching-endpoint-path-terminal/\
MatchingEndpointPathTerminal.lean
```

The command exited zero.  The four explicit axiom queries report exactly:

```text
propext
Classical.choice
Quot.sound
```

The file contains no `sorry`, `admit`, declaration-level `axiom`,
`native_decide`, or `unsafe` declaration.  No production file, plan document,
generated blueprint, protected `SurplusM44`, shell-curvature file, or adjacent
scratch lane was modified.
