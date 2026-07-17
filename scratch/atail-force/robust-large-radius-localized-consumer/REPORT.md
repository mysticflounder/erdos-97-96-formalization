# Robust large-radius localized-consumer checkpoint

Date: 2026-07-16

Status: **kernel-checked reduction; shared-pair residual eliminated; no direct
`False`**.

Owned lane:

- `scratch/atail-force/robust-large-radius-localized-consumer/`

No production source, shared closure document, proof-blueprint state, or
sibling scratch lane was changed.

## Result

The `SharedCriticalPairAtLargeSecondApex` arm is not a genuinely new
mathematical frontier.  At the parent boundary, its physical-apex radius class
still has cardinality at least five.  Its fresh critical shell has cardinality
exactly four.  Therefore some point on the physical-apex radius is outside the
fresh shell.

Deleting that point preserves K4 at both centers:

- the fresh center retains its exact four-shell because the deleted point is
  outside its support; and
- the physical second apex retains at least four members of its original
  radius class because the class had at least five.

Consequently the shared-pair branch constructs the existing continuation

```lean
CommonDeletionTwoCenterPacket
  D H deleted packet.center S.oppApex2
```

without any new geometric producer.

The previous center-localization results remain valid and are retained in a
localized packaging theorem, but they are not load-bearing for this stronger
cardinality collapse.  In particular, mining the two outside fresh-shell
members for a new direct contradiction would have attacked a redundant
residual.

## Bank and indexed-corpus preflight

Before adding the reduction, this lane checked the required registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also ran targeted `nthdegree docs search --lean` queries for:

- a critical four-shell with exactly two points in the center's cap;
- two same-cap centers equidistant from an outside pair;
- deletion criticality for two same-cap shell members; and
- the two-large-cap metric obstruction.

The closest banked geometric result was again
`CapSelectedRowCounting.outsidePair_unique_capCenter`, already consumed by
the predecessor localization lane.  The U5 three-common-point and
`u1TwoLargeCapObstruction` consumers require additional incidences absent from
the shared packet.  No banked theorem directly refutes the packet.

The load-bearing reuse found here is instead the current scratch continuation
constructor

```lean
ATailContinuationBankMatchScratch.nonempty_commonDeletionTwoCenterPacket
```

followed by the already checked physical-second-apex consumer

```lean
ATailCommonDeletionUniformConsumerScratch.
  physicalSecondApex_commonDeletion_robust_or_swappedUniqueFour
```

## Kernel declarations

### Exact extra-point extraction

```lean
theorem exists_physicalRadius_point_not_mem_sharedCriticalShell
    (packet : SharedCriticalPairAtLargeSecondApex D S radius)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 radius).card) :
    ∃ deleted,
      deleted ∈ SelectedClass D.A S.oppApex2 radius ∧
      deleted ∉ packet.shell.toCriticalFourShell.support
```

This is the exact `5 > 4` pigeonhole statement.  It uses no cap geometry or
minimality after the packet is supplied.

### Shared pair to common deletion

```lean
theorem nonempty_commonDeletionTwoCenterPacket_of_sharedCriticalPair
    (H : CriticalShellSystem D.A)
    (hradius : 0 < radius)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 radius).card)
    (packet : SharedCriticalPairAtLargeSecondApex D S radius) :
    ∃ deleted,
      deleted ∈ SelectedClass D.A S.oppApex2 radius ∧
      deleted ∉ packet.shell.toCriticalFourShell.support ∧
      Nonempty (CommonDeletionTwoCenterPacket
        D H deleted packet.center S.oppApex2)
```

This theorem eliminates the shared-pair residual.  It is a reduction to an
existing continuation, not a direct contradiction.

### Localized packaging

`nonempty_localizedSharedPairCommonDeletionReduction` additionally retains:

- `packet.center ∈ S.capInteriorByIndex S.oppIndex2`; and
- the exact equality
  `packet.shell.toCriticalFourShell.support ∩ S.capByIndex S.oppIndex2 =
   {packet.source, packet.partner}`.

These facts remain available to any provenance-sensitive downstream consumer.

### Strongest shared-pair consumer

```lean
theorem sharedCriticalPair_robust_or_swappedUniqueFour ... :
    Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
      Nonempty (SwappedFirstApexUniqueFourFrontier D S H)
```

This composes the new common-deletion construction with the current uniform
physical-second-apex consumer.  Thus the shared pair reaches only established
robust or protected `FA-UNIQ4` frontiers.

### Strongest parent reduction

```lean
theorem nonempty_knownFrontierOutcome_of_largeSecondApexRadius
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) :
    Nonempty (RobustLargeRadiusKnownFrontierOutcome D S H)
```

The output has exactly three constructors:

1. `FullyDeletionRobustAt D S.oppApex2`;
2. `SwappedFirstApexUniqueFourFrontier D S H`; or
3. `LargeCapUniqueFiveSecondApexRadius D S`.

Neither `SharedCriticalPairAtLargeSecondApex` nor a generic
`CommonDeletionTwoCenterPacket` remains in this normal form.  This replaces
the previous large-radius three-way transition with the exact known-frontier
surface needed by the parent closure plan.

## Epistemic status and remaining work

This lane proves no direct `False` and closes no production `sorry` by itself.
It does, however, retire one of the two residual consumers previously recorded
for the large-radius transition.

The remaining endpoints are now exact:

- swapped `FA-UNIQ4` is the existing protected frontier;
- the physical-apex robust branch remains the global robust coupling target;
  and
- `LargeCapUniqueFiveSecondApexRadius` remains the distinct large-cap
  exact-five target and must use the unused sixth cap point or a full-filter
  argument.

The shared pair should no longer receive an independent rank-decrease,
outside-shell, Kalmanson, or CEGAR mining lane.  Its strongest current
consumer is the checked common-deletion collapse above.

## Validation

The file was freshly elaborated with Lean 4.27 and an explicit 16 GiB memory
cap.  The output olean is:

```text
/private/tmp/p97-robust-large-radius-localized-consumer/
  RobustLargeRadiusLocalizedConsumer.olean
```

Every printed declaration reports exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx` or custom axiom.  A focused textual safety scan found no
`sorry`, `admit`, declared `axiom`, `native_decide`, `unsafe` declaration, or
heartbeat override.  The optional `lean4-skills-sorry-analyzer` wrapper was
not installed on this host, so the explicit source scan and kernel axiom
prints are the validation boundary.  No full `lake-build` was run for this
isolated scratch lane.
