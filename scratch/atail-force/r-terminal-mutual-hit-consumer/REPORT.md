# Spent-entry terminal mutual-hit consumer

Date: 2026-07-15

Status: **kernel-checked scratch result; no production or closure document was
changed**.

## Result

The result is stronger than consumption of the exact
`SpentEntryTerminalOriginalPairMutualHitPacket`: the entire spent branch
collapses at frontier entry.  The spent-entry context already supplies:

- first-apex K4 after deleting both original frontier points, via
  `FrontierRadiusSpentAtEntry.firstApexDouble`; and
- second-apex K4 after deleting both original frontier points, via
  `CriticalPairFrontier.secondApexDouble`.

Monotonicity from double deletion to either single deletion therefore gives,
for each of the original points `q` and `w`, K4 survival at both prescribed
opposite apices.  Since those apices are distinct carrier points, the existing
constructor `nonempty_commonDeletionTwoCenterPacket` yields common-deletion
packets for both `q` and `w`.

The consumer is:

```lean
FrontierRadiusSpentAtEntry.exists_commonDeletion
```

The stronger entry-level theorem

```lean
FrontierRadiusSpentAtEntry.both_originalPoints_commonDeletion
```

produces both original deletions simultaneously.

The packet-level theorem

```lean
SpentEntryTerminalOriginalPairMutualHitPacket.exists_commonDeletion
```

is retained as the direct adapter requested by this lane, but it merely
delegates to the entry-level result.

The end-to-end integration theorem

```lean
AmbientRobustHistoryPair.spentEntryOrbit_exists_commonDeletion
```

therefore removes the terminal mutual-hit disjunct from the complete spent
actual-blocker orbit: every terminal-hit or cycle arm reaches the existing
common-deletion continuation.

No alternate-radius terminal, blocker orbit, mutual-hit field, cap order,
terminal-carrier classification, `IsM44`, or new producer premise is needed.
The whole spent-entry branch therefore has no remaining mathematical field
before the common-deletion continuation.

## Required bank preflight

Before proving the consumer, the following registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries found the existing
critical-pair/common-deletion interfaces but no banked theorem with this exact
spent-entry monotonicity packaging.

## Scope

Only new scratch files were added.  No production file, protected file,
closure document, or `IsM44` assumption was touched.

## Validation

The scratch file was checked in isolation with the already-validated
`SpentEntryOriginalPairResidualReduction.olean` dependency chain:

```text
SpentEntryTerminalMutualHitConsumer.lean  PASS
```

Every printed theorem depends only on the standard Mathlib axioms
`propext`, `Classical.choice`, and `Quot.sound`.  There is no `sorryAx`,
custom axiom, `admit`, or `unsafe` declaration.
