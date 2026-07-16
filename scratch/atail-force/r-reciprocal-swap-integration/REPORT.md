# Reciprocal swap integration

Date: 2026-07-16

Status: **KERNEL-CHECKED COORDINATOR REDUCTION; NO PRODUCTION SORRY CLOSED.**

`ReciprocalSwapIntegration.lean` removes the obsolete
distinct-second-apex-radius intermediate from the coherent R coordinator.

For every `ReciprocalDirectedCrossResidual R`, the checked theorem

```text
reciprocalDirectedCross_commonDeletion_or_swappedFirstApexUniqueFour
```

returns exactly:

```text
(exists z,
  Nonempty
    (CommonDeletionTwoCenterPacket
      D H z R.firstCenter S.oppApex2))
or
Nonempty (SwappedFirstApexUniqueFourFrontier D S H).
```

The first arm remains a source-faithful R common-deletion obligation. The
second arm is the protected `FA-UNIQ4` dependency after fixed-surplus
reorientation. There is no remaining distinct-radius producer between the
reciprocal critical branch and `FA-UNIQ4`.

The file also defines:

```text
ResolvedCoherentFixedSingleRadiusContinuation
ResolvedCurrentFirstApexFixedRadiusNormalForm
```

and proves conversions from the source-current coordinator. Thus a chosen
frontier can be exposed directly as:

1. the original first-apex `FA-UNIQ4` / `FA-UNIQ5` arm;
2. an anchored coherent transition;
3. a fresh reciprocal common-deletion packet;
4. a swapped `FA-UNIQ4` frontier; or
5. the generic spent-at-entry common-deletion packet.

`fullParent_extracts_dangerousRetainingResolvedNormalForm` carries this
conversion through the complete live parent telescope while retaining the
second-large-cap witness, the dangerous-retaining critical system, physical
surplus membership, radius, and chosen frontier.

This is a coordinator cleanup, not a contradiction. Closure still requires
the swap-stable `FA-UNIQ4` eliminator and consumers for the two
common-deletion roles.

Direct single-file validation exited `0`. Every printed declaration depends
only on:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`.
