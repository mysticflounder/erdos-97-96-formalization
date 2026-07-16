# Double-survivor consumer audit

Date: 2026-07-14

Status: **PROVEN SHARPER BRANCH REDUCER; NO K-A-PAIR CLOSURE.**

## Checked result

`DoubleSurvivorConsumer.lean` consumes the stronger second-apex pair
selection on the actual production `CriticalPairFrontier` surface.

The main consequences are:

- `exists_pair_double_deletion_survives_secondApex_on_subset` extends the
  selector to every subcarrier `B ⊆ D.A` carrying local K4 at
  `S.oppApex2`;
- `exists_doubleSecondApexFrontier_of_K4` constructs a production survivor
  packet whose second-apex split is forced to double survival, eliminating
  the entire disjoint-two-shell / exact-eight alternative;
- `firstApex_trichotomy_with_secondApex_double_survival` reduces the live
  first-apex surface to exactly three branches:
  1. K4 survives both deletions at both opposite apices;
  2. the first-apex row is uniquely card four, deleting either source blocks
     K4 there, and the second-apex double deletion survives; or
  3. the first-apex row is uniquely card five, either single deletion
     preserves K4 there, the double deletion blocks it, and the second-apex
     double deletion survives;
- `biApex_double_survival_step_or_firstApex_terminal` proves the same robust
  reduction on an arbitrary subcarrier with only local K4 at the two fixed
  apices; and
- `exists_firstApex_terminal_subcarrier` kernel-checks the well-founded
  iteration. Every robust step erases two distinct points, so iteration
  terminates at a subcarrier with a unique card-four/card-five first-apex row
  while retaining second-apex double survival.

Thus the new selector is stronger than the old production frontier: the
second-apex exact-eight branch is not a genuine residual once the pair is
chosen adaptively.

## Why this does not close a branch

The terminal exactness is relative to the cumulatively erased subcarrier
`C`, not to `D.A`. Deleted points may:

- enlarge the terminal radius class when lifted back to `D.A`; or
- restore a different ambient K4 radius absent from `C`.

Consequently the terminal packet does not produce an ambient
`CriticalSelectedFourClass D.A`, does not constrain the supplied ambient
`CriticalShellSystem`, and does not meet an existing metric/incidence
consumer. The first missing bridge is an ambient-lift or deletion-core
theorem showing that the accumulated deleted set neither augments the
terminal row nor supplies another ambient K4 class, or else a new consumer
stated directly on the cumulative subcarrier packet.

The concurrently checked strict-`oppCap1` classifier does not remove this
obstruction. A directed cross hit localizes its blocker into strict
`oppCap1`, where the blocker row has exactly the selected pair as its two cap
hits. This saturates the selected-row cap bound rather than contradicting it.

## Theorem-bank preflight

Before proving the reducer, the required sibling, legacy, and older P97 bank
registries were searched, together with indexed Lean searches for
simultaneous deletion survival, two exact disjoint shells, critical-pair
frontiers, and subcarrier K4 descent. The closest reusable declarations were

- `sameRadius_double_erase_survives_or_unique_class_card_four_or_five`;
- `double_erase_survives_or_two_disjoint_exact_shells`;
- `SelectedFourClass.inter_card_le_two`; and
- the U5 deleted-class intersection kernels.

None lifts a unique selected class from a cumulatively erased carrier to the
ambient carrier or consumes the resulting local bi-apex terminal.

## Validation

The permitted direct single-file check from `lean/` exited successfully:

```text
lake env lean -M 16384 \
  ../scratch/atail-force/double-survivor-consumer/DoubleSurvivorConsumer.lean
```

Every printed declaration depends exactly on

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx` or custom axiom. Source SHA-256:
`ee65c29bde3d2750f3429f52e4e16af6e6dda00d15f92416f4863826462fb26b`.

The source-current recheck on 2026-07-15 also repaired the
`DoubleSecondApexFrontier.toCriticalPairFrontier` adapter after production
added the explicit `secondApexDouble` field.  The adapter now copies that
field as well as selecting the corresponding `secondApexSplit` arm; the
direct check above passes against the current production structure.
