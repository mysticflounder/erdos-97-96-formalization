# Reciprocal critical-arm swap reduction

Date: 2026-07-16

Status: **KERNEL-CHECKED REDUCTION OF THE RECIPROCAL CRITICAL ARM TO
`FA-UNIQ4`; NO DISTINCT-SECOND-APEX-RADIUS PRODUCER IS NEEDED ON THIS ARM.**

This scratch lane tests whether the reciprocal critical second-apex endpoint
is genuinely a separate producer obligation or can be reclassified through
the fixed-surplus non-surplus swap as the protected `FA-UNIQ4` branch.

## Result

`ReciprocalSwapReduction.lean` proves:

```text
secondApexCritical_reorients_to_firstApexUniqueFour
reciprocalCriticalArm_reorients_to_firstApexUniqueFour
```

The general theorem assumes only:

```text
C : CriticalSelectedFourClass D.A z S.oppApex2
not HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex2.
```

It returns a fresh packet and frontier with:

```text
new oppApex1 = old S.oppApex2
new oppApex2 = old S.oppApex1
new oppCap1  = old S.oppCap2
new oppCap2  = old S.oppCap1
new surplusCap = old S.surplusCap
```

and:

```text
CriticalPairFrontier D newPacket radius H
(SelectedClass D.A newPacket.oppApex1 radius).card = 4
forall tau > 0, card (SelectedClass D.A newPacket.oppApex1 tau) >= 4
  -> tau = radius
not HasNEquidistantPointsAt 4
  ((D.A.erase frontier.pair.q).erase frontier.pair.w)
  newPacket.oppApex1.
```

This is exactly the first-apex unique-card-four deletion polarity denoted
`FA-UNIQ4`.

## Why the reduction works

The critical shell is the whole ambient row, not a selected subset. Its
support therefore proves that the old second-apex class has cardinality
exactly four. The deletion failure makes that shell radius the unique positive
four-capable ambient radius by the already checked theorem
`criticalRadius_unique_of_blocked`.

The fixed-surplus non-surplus swap preserves the carrier and surplus cap while
exchanging the two non-surplus apex/cap roles. Rather than transporting the
old reciprocal pair, the proof applies
`exists_criticalPairFrontier_of_K4` to the swapped packet and the same original
`D` and `H`. Radius uniqueness forces the fresh frontier's first-apex radius
to be the critical-shell radius, so its full first-apex class has cardinality
four. Deleting the two distinct frontier members then leaves only two points
on the unique possible row, proving the double-deletion failure.

The exact support equality

```text
C.toCriticalFourShell.support = R.secondApexRow.support
```

retained by the reciprocal branch is not needed for this reduction. The
prescribed critical shell and deletion failure are already sufficient.

## Same-pair transport is neither used nor possible

`CriticalPairFrontierSwapAudit.lean` proves that the old reciprocal pair has
distinct radii about the old second apex, which becomes the swapped first
apex. Hence the old ordered pair cannot be reused by a swapped frontier.

This is not an obstruction. `FA-UNIQ4` is a branch classification of a
frontier on the full packet geometry; it does not require the swapped frontier
to reuse the predecessor pair. A fresh frontier is the honest construction.

## Parent integration boundary

The proof deliberately keeps the original `CounterexampleData D` and
`CriticalShellSystem H`. Only the `SurplusCapPacket D.A` is reoriented. Thus
all full-parent hypotheses indexed by `D`, all dangerous-row data in `H`, and
the global no-`IsM44` hypothesis remain available without dependent transport.
The surplus cap is definitionally replaced by an equal physical set, so
off-surplus and surplus-cap placement arguments carry across.

The eventual user-owned `FA-UNIQ4` eliminator must therefore be stated in one
of these equivalent swap-stable forms:

1. polymorphic in an arbitrary `S' : SurplusCapPacket D.A`; or
2. accepting the five displayed apex/cap/surplus transport equalities.

If it is definitionally pinned only to the original
`leafSurplusPacket`, a small packet-reorientation adapter will still be
needed. That is an interface issue, not a new geometric producer. The checked
card-four terminal consumer
`false_of_existsSurplusPairCriticalBlocker` is already packet-generic.

## Closure consequence

The reciprocal endpoint should now be classified as:

```text
fresh common deletion
or
swapped FA-UNIQ4.
```

Accordingly, remove the “distinct positive four-capable second-apex radius”
from the independent R-producer queue. Once the protected `FA-UNIQ4`
eliminator is available on the swap-stable packet surface, the critical
alternative closes through that theorem. The reciprocal common-deletion
alternative remains open.

This scratch theorem closes no production `sorry` by itself because the
`FA-UNIQ4` producer is still open. It removes one genuinely redundant producer
obligation and replaces it with a checked dependency edge to the existing
owner lane.

## Theorem-bank preflight

Before formalizing the adapter, the required current, sibling, and legacy
registries were searched for:

- `NonSurplusSwap` and packet-role transport;
- critical-pair frontier reorientation;
- unique positive four-capable radii;
- selected-class cardinality four; and
- card-four first-apex consumers.

Focused `nthdegree docs search --lean` queries found the existing
`NonSurplusSwap`, `exists_nonSurplusSwap`,
`exists_criticalPairFrontier`, and
`sameRadius_double_erase_survives_or_unique_class_card_four_or_five`
declarations. No bank theorem supplied a same-pair transport; the existing
swap audit proves that transport impossible. The implementation therefore
reuses the existing swap and fresh-frontier constructor rather than deriving a
new finite-pattern theorem.

## Validation

Direct single-file validation:

```text
env LEAN_PATH=/private/tmp/p97-r-reciprocal-swap-reduction-oleans:
  /private/tmp/p97-joint-transition-oleans:
  /private/tmp/p97-r-orbit-entry-oleans
lake env lean -R .. -M 16384
  -o /private/tmp/p97-r-reciprocal-swap-reduction-oleans/ReciprocalSwapReduction.olean
  ../scratch/atail-force/r-reciprocal-swap-reduction/ReciprocalSwapReduction.lean
```

Exit status: `0`.

Every printed theorem depends only on:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, declared axiom, `sorry`, `admit`, or `native_decide`.
No production target, full `lake-build`, proof-blueprint refresh, or
publication gate was run.
