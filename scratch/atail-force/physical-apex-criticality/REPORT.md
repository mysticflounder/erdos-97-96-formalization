# Physical-apex criticality audit

Date: 2026-07-16

Status: **KERNEL-CHECKED ROUTE CORRECTION AND CARD-14 FIXED-POINT
REDUCTION. THE ROBUST LARGE-CAP ENDPOINT IS NOT CLOSED. NO PRODUCTION
`sorry` IS CLOSED.**

## Question

The live card-at-least-fourteen route reaches

```lean
FullyDeletionRobustAt D S.oppApex2
```

after producing a source-faithful common-deletion packet at the physical
second apex. This audit tested whether the retained full parent surface could
then produce either

```lean
HasCriticalDeletionAt D S.oppApex2
```

or a source whose retained critical blocker is `S.oppApex2`.

## Required theorem-bank preflight

The audit inspected the required registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also ran targeted `nthdegree docs search --lean` queries for deletion
robustness, critical deletion at a prescribed center, critical-map images and
surjectivity, opposite-apex blocker alignment, and opposite-apex radius-class
geometry.

No banked theorem makes the chosen critical-center map hit the physical
second apex. The banked U5 results remain consumers after several named
cross-incidences; they do not produce the needed physical blocker alignment.
The closest current theorem is `FullyDeletionRobustAt.centerAt_ne`, which
points in the opposite direction.

## Decisive logical correction

`PhysicalApexCriticality.lean` proves

```lean
HasCriticalDeletionAt D center ↔
  ¬ FullyDeletionRobustAt D center
```

This is not a heuristic relation. It follows by unfolding the two definitions:

- robustness says every carrier deletion preserves a K4 witness at `center`;
- criticality says some carrier deletion does not preserve one.

The same file proves

```lean
H.centerAt source hsource = center →
  HasCriticalDeletionAt D center
```

because `H.no_qfree_at source hsource` is exactly the failed-deletion witness
at the chosen blocker. Consequently a critical-map preimage is not a second,
independent producer. It is a stronger way of producing the same negation of
robustness.

Therefore, while retaining

```lean
R : FullyDeletionRobustAt D S.oppApex2
```

both proposed outputs are impossible:

```lean
¬ HasCriticalDeletionAt D S.oppApex2

¬ ∃ source hsource,
    H.centerAt source hsource = S.oppApex2
```

Any derivation of either output from the robust parent surface would already
be the missing direct contradiction. Closure planning must not list
`centerAt` alignment as a separate intermediate producer after entering the
robust arm.

## Exact card-at-least-fourteen fixed point

The full card-at-least-fourteen reduction retains more than the coarse robust
projection. It carries the original frontier deletion, actual blocker source,
physical-second-apex common-deletion packet, and exact successor-or-swapped
outcome.

The checked theorem

```lean
nonempty_sourceFaithfulCardFourteenRobustSuccessor
```

shows that, after assuming physical-apex robustness, the swapped unique-four
arm is impossible by
`false_of_fullyDeletionRobustAt_secondApex_and_swappedUniqueFour`. Hence the
exact source-faithful successor arm is forced. Its successor source lies in
the retained physical-second-apex row, while its chosen critical blocker is
again different from `S.oppApex2`.

This is the true recurrence boundary:

```text
card >= 14 parent surface
  + robust physical second apex
  -> source-faithful common-deletion successor
  -> successor source lies on a second-apex row
  -> retained critical blocker is not the second apex
```

The fixed point is a reduction of the exact branch surface, not a
contradiction.

## Exact remaining live target

The sibling kernel-checked audit
`../robust-second-apex-geometry/RobustSecondApexGeometry.lean` has already
exhausted the cap/MEC consequences of robustness. After the small-cap routes,
the live parent has `6 ≤ S.oppCap2.card` and two possible radius forms:

1. one positive second-apex radius class has cardinality at least five; or
2. two distinct positive K4 radii have support-disjoint selected four-classes.

Both alternatives are compatible with the available cap one-hit and capacity
bounds once the opposite cap has cardinality at least six. The exact live
mathematical target is therefore a **direct exclusion of both cap-at-least-six
radius arms using new source-indexed/global coupling information**. It is not
the production of `HasCriticalDeletionAt` or a blocker-map preimage as a
separate step.

## Kernel validation

Focused compilation from `lean/` succeeded:

```bash
env LEAN_PATH=<checked scratch olean paths> \
  lake env lean -R ../scratch/atail-force/physical-apex-criticality \
  -M 16384 \
  -o /private/tmp/p97-physical-apex-criticality-oleans/PhysicalApexCriticality.olean \
  ../scratch/atail-force/physical-apex-criticality/PhysicalApexCriticality.lean
```

All five printed declarations depend only on:

```text
propext
Classical.choice
Quot.sound
```

The owned directory contains no `sorry`, `admit`, declared `axiom`,
`native_decide`, `unsafe`, heartbeat override, or linter suppression. No full
project build was run.
