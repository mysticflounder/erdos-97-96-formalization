# Spent-entry common-deletion reduction

Date: 2026-07-15

## Result

The spent-at-entry alternate-radius orbit now has a kernel-checked reduction
to the existing `CommonDeletionTwoCenterPacket` interface, with exactly two
explicit original-pair return residuals.

The implementation is
`scratch/atail-force/r-full-parent-entry/SpentEntryCommonDeletionReduction.lean`.
Its consumer-facing endpoint is
`SpentEntryAlternateRadiusTerminal.exists_alternateRadiusOrbit_originalPairHit_or_commonDeletion`.
Starting from any point erased after the frontier entry, it produces the
source-faithful alternate-radius orbit and proves one of:

1. the least terminal-hit predecessor is an original frontier endpoint and
   its exact actual-blocker classifier is HIT;
2. a canonical minimal-cycle source is an original frontier endpoint; or
3. an existing `CommonDeletionTwoCenterPacket`.

The terminal residual is named
`SpentEntryTerminalPredecessorHitsOriginalPairAndActualBlockerHit`.  It is
sharper than merely returning to the original pair: an OMISSION outcome is
already enough for common deletion by deleting the robust mate.

The cycle residual remains exactly the existing
`SpentEntryCycleHitsOriginalPair`.  On its complementary arm, where every
canonical source lies in the alternate class, the first actual-blocker
successor is reconstructed as the robust mate.  The resulting classifier is
OMISSION, so deleting that successor preserves K4 both at the successor
itself and at `S.oppApex2`, producing
`CommonDeletionTwoCenterPacket D H deleted deleted S.oppApex2`.

Thus the all-alternate-source cycle arm is fully reduced to common deletion.
The terminal-hit arm is also reduced except for the named original-pair HIT
state.  No production `sorry` is closed by this scratch adapter alone; the
two named original-pair states and the downstream common-deletion consumer
remain the load-bearing frontier.

## Reusable intermediate theorems

- `AmbientRobustHistoryPair.exists_commonDeletionTwoCenterPacket_of_actualBlockerOmission`
  turns any exact OMISSION robust pair into common deletion.
- `LeastPositiveTerminalHitPredecessor.exists_commonDeletionTwoCenterPacket_of_fixedClass`
  generalizes the terminal-endpoint omission argument to a terminal history
  over an arbitrary subcarrier `B ⊆ D.A`.
- `LeastPositiveTerminalHitPredecessor.hitsOriginalPairAndActualBlockerHit_or_exists_commonDeletionTwoCenterPacket`
  gives the sharp spent terminal split.
- `SourceExactMinimalActualBlockerCycle.exists_alternateRadius_successorMate_omission`
  reconstructs the actual blocker successor as an alternate-radius mate.
- `SourceExactMinimalActualBlockerCycle.hitsSpentEntryPair_or_exists_commonDeletionTwoCenterPacket`
  gives the sharp spent cycle split.
- `AmbientRobustHistoryPair.spentEntryOrbit_originalPairHit_or_commonDeletion`
  combines the terminal and cycle reductions.

## Bank preflight

The required registries were checked before deriving the adapters:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` bank section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The indexed Lean corpus was searched for common-deletion, fixed-radius cycle,
erased-source blocker, and two-center survival shapes.  The nearest hits were
generic q-deleted K4-class constructors and existing actual-blocker deletion
facts.  No banked theorem supplied the spent-entry terminal or all-alternate
cycle reduction proved here.

## Validation

The complete scratch dependency chain and the new file were freshly compiled
to isolated oleans under `/tmp/p97-spent-common`.  The final focused command
was run from `lean/`:

```text
env LEAN_PATH=/tmp/p97-spent-common lake env lean -R .. -M 8192 \
  -o /tmp/p97-spent-common/SpentEntryCommonDeletionReduction.olean \
  ../scratch/atail-force/r-full-parent-entry/SpentEntryCommonDeletionReduction.lean
```

It exited `0`.  Every printed theorem depends only on:

```text
propext, Classical.choice, Quot.sound
```

The file contains no `sorry`, `admit`, custom `axiom`, `native_decide`, or
`unsafe` declaration.  No full Lake build was run.
