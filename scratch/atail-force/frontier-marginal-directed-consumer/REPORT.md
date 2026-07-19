# Frontier marginal/direct consumer audit

Date: 2026-07-17

Scope: `FirstApexMarginalCompanion` coupled to the exact
`FrontierCommonDeletionConsumerNormalForm.directed` carried by the same parent
frontier.  This lane does not edit production, plans, or sibling scratch.

## Theorem-bank preflight

The required registries were checked before deriving a new packet:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- semantic `nthdegree docs search --lean` queries for marginal companions,
  paired/common deletions, directed blockers, and cap-center uniqueness.

There is no banked theorem consuming this exact frontier-coupled surface.
The standalone `u1TwoLargeCapObstruction` needs a seven-equality five-point
metric pattern not produced here.  The U5 certificate families likewise need
additional row-slot placements.  The applicable existing theorem is instead
`frontierDeletionSurvival_or_actualBlocker_eq_knownCenter` from
`ATail/ThirdCenterCommonPair.lean`; this report uses it after producing the
missing source-faithful common-deletion packet.

## Kernel-checked reductions

The scratch proof is
`MarginalDirectedConsumer.lean`.  It contains no `sorry` or `admit`.

### 1. The marginal companion survives at the first apex

```lean
firstApex_survives_deleting_marginalCompanion :
  HasNEquidistantPointsAt 4 (D.A.erase hit.point) S.oppApex1
```

The proof is exhaustive:

- if the frontier radius class has at least five points, deleting any one
  point leaves four;
- otherwise the retained lower bound makes that class exact-card-four.  The
  stored witness after deleting both frontier sources cannot use the frontier
  radius, because both sources lie in that exact four-class.  Its radius is
  therefore different, and deleting the marginal companion does not change
  that witness class.

This is the key new mathematical fact.  It uses the retained
`firstApexDouble` and `frontierRadius_class_card_ge_four` fields; neither may
be dropped from the producer boundary.

### 2. The companion is an origin-tagged common deletion

```lean
nonempty_marginalCompanionCommonDeletion :
  Nonempty (MarginalCompanionCommonDeletion hit)
```

The packet deletes `hit.point` and keeps K4 at the exact centers

```text
S.oppApex1
H.centerAt F.pair.q F.pair.q_mem_A.
```

The second survival is the already-retained
`hit.actualBlocker_survives_deleting_point`; the first is item 1.  The packet
retains `hit.point`, its membership, its inequality from the original deleted
source, the whole `CriticalPairFrontier`, and the original critical map.

### 3. The on-radius surplus escape is a second source at the same centers

On the genuine `onRadiusSurplus` arm, the same exact-card-four/different-radius
argument applies to `E.normal.escape.point`.  Hence:

```lean
nonempty_onRadiusSurplusMarginalCommonDeletion :
  Nonempty (OnRadiusSurplusMarginalCommonDeletion E hit)
```

This packet retains two distinct sources:

- the surplus-cap escape; and
- the off-surplus marginal companion.

Deleting either preserves K4 at both the physical first apex and `q`'s actual
blocker.  This is stronger than returning two anonymous
`CommonDeletionTwoCenterPacket`s because their common origin and distinctness
are stored together.

### 4. Directed cross membership now produces another survival edge

On `FrontierDirectedBlockerOutcome.crossMembership`, the exact
`MarginalCrossMetricPacket` records:

- four first-apex radius equalities for the surplus escape, marginal hit,
  deleted source, and companion source;
- the second-apex equality between the surplus escape and marginal hit;
- the actual-blocker equality between the frontier source pair;
- all required surplus/off-surplus memberships and source distinctions;
- the two-source common-deletion packet from item 3; and
- a new cross-row consequence:

```lean
HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
    (H.centerAt hit.point hitCommonDeletion.packet.q_mem_A) ∨
HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
    (H.centerAt hit.point hitCommonDeletion.packet.q_mem_A)
```

Reason: the marginal hit's actual blocker is distinct from both known
common-pair centers by its own common-deletion packet.  The total-map
classifier therefore cannot put that blocker at either known center and must
return survival of one frontier deletion there.

### 5. The full coupled outcome is exhaustive

```lean
nonempty_firstApexMarginalDirectedOutcome :
  Nonempty (FirstApexMarginalDirectedOutcome E hit)
```

It has four origin-preserving branches:

1. the original surplus escape was actually off-radius and already carries
   its common-deletion packet;
2. on-radius plus directed cross membership yields the exact metric/cross-row
   packet above;
3. on-radius plus companion common deletion, with the marginal hit equal to
   the frontier companion source; or
4. on-radius plus companion common deletion, with two distinct marginal /
   frontier-companion common-deletion sources.

The equality branch is necessary: current hypotheses do not prove that the
new marginal hit differs from `F.pair.w`.

## Important provenance defect found

`ParentSurplusEscape` stores

```lean
point_mem_surplusCap : normal.escape.point ∈ S.surplusCap
```

but does not store the `point_mem_frontierRadius` equality from the
`FrontierEscapeLocationOutcome.onRadiusSurplus` constructor.  Consequently,
an arbitrary inhabitant of `ParentSurplusEscape` need not be on-radius even
though the production theorem constructs it from that arm.  The scratch
consumer avoids an unsound strengthening by re-casing
`E.normal.escapeLocation` before using the radius equality.

If this material is promoted, either:

- keep the re-case exactly as in the scratch theorem; or
- strengthen the production surplus packet so its on-radius origin is a
  field/index of the type.

Do not assume the radius equality merely from `ParentSurplusEscape`.

## What this does not close

No direct `False` follows from the current theorem bank.

- The cross-metric packet does not yet instantiate
  `u1TwoLargeCapObstruction`; it lacks the remaining cross-row equalities.
- `outsidePair_unique_capCenter` cannot consume the surplus/marginal pair
  because one member lies in the cap, and it cannot consume the frontier pair
  at the actual blocker because that blocker is already proved outside the
  surplus cap.
- Two or three common-deletion packets are not contradictory without a
  theorem coupling their retained critical rows, cap order, or full exact
  radius filters.

Thus this is a real producer/reduction advance, not a closed sorry.  The next
honest consumer target is the exact `MarginalCrossMetricPacket`, especially
its newly forced actual-blocker survival edge, together with the paired
common-deletion packet.  It should not be weakened to a generic recursive
`CommonDeletionTwoCenterPacket` target.

## Validation

Focused command, run from `lean/`:

```bash
lake env lean \
  ../scratch/atail-force/frontier-marginal-directed-consumer/MarginalDirectedConsumer.lean
```

Result: pass.  The reported axiom closures for all headline theorems are
exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`.
