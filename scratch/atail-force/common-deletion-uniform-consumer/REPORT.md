<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Uniform common-deletion consumer audit

## Outcome

The card-at-least-fourteen survival-cover packet no longer needs its arbitrary
actual-blocker center identified with the live center `p`.  Once the other
center is retained as the physical second apex, the packet has a one-step,
kernel-checked reduction.  Its exact source-faithful form is:

```text
CommonDeletionTwoCenterPacket D H deleted arbitraryCenter S.oppApex2
  -> SecondRowCommonDeletionSuccessor C
   or SwappedFirstApexUniqueFourFrontier D S H.
```

The successor retains its source in the old second row, its absence from the
old first row, the entire next packet, and the same-radius-overflow versus
alternate-radius-disjoint split.  Its coarser geometric projection is:

```text
CommonDeletionTwoCenterPacket D H deleted arbitraryCenter S.oppApex2
  -> FullyDeletionRobustAt D S.oppApex2
   or SwappedFirstApexUniqueFourFrontier D S H.
```

The proof chooses a point of the second exact row outside the first.  Such a
point exists because both rows have cardinality four and intersect in at most
two points.  The first row survives deleting it.  At the physical second apex:

- if deletion also survives, the successor second row either has the old
  radius, giving a fifth point on that radius, or has a different radius and
  is support-disjoint from the old row; either case is fully deletion-robust;
- if deletion is critical, the resulting critical shell is exactly the input
  to `secondApexCritical_reorients_to_firstApexUniqueFour`.

`SourceFaithfulCardFourteenSecondApexReduction` additionally retains the
deleted frontier point, the original source outside `qBlockerFiber`, its
actual-blocker identity, and the exact initial packet around that output.

This bypasses `CommonDeletionCriticalExpansion` and
`CommonDeletionSuccessorCycle`; the arbitrary-center recursion is unnecessary
on the physical-second-apex surface.

## Exact remaining consumer

`card_ge_fourteen_survivalCover_false` shows the narrow uniform statement
needed for `False`.  It takes only:

1. a consumer of `FullyDeletionRobustAt D S.oppApex2`; and
2. a consumer of `SwappedFirstApexUniqueFourFrontier D S H`.

The second branch is the protected swapped FA-UNIQ4 frontier.  The first is a
genuine robust-apex branch, not a renamed common-deletion packet.  Current
interfaces do not eliminate it: feeding it back through the R machinery is a
same-level apex-role transition with no decreasing measure.  Therefore the
old generic expansion genuinely permits cycles, while the corrected physical
consumer reduces the lane to the existing robust/FA-UNIQ4 frontiers.

The later checked audit in `../robust-second-apex-geometry/` sharpens the
robust branch.  Cap four is impossible and cap five routes to protected
swapped FA-UNIQ5.  On the actual cap-at-least-six surface it is equivalent to
one radius class of size at least five or two distinct K4 radii with disjoint
four-point supports.  Current marginal cap/MEC facts exclude neither arm.
`../physical-apex-criticality/` proves that physical-apex criticality is
exactly the negation of robustness and that a retained-map preimage is
therefore impossible on this arm.  Genuinely global coupling that directly
excludes both radius alternatives is still needed.

No production `sorry` is closed by this scratch reduction.

## Theorem-bank preflight

The required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries found the existing U5
incidence consumers and current critical-frontier results, but no theorem that
eliminates an arbitrary common-deletion packet or the robust physical-second-
apex endpoint.  The banked consumers require additional named row incidence,
cap placement, or fixed live-center roles.

## Kernel declarations

`CommonDeletionUniformConsumer.lean` proves:

- `CommonDeletionTwoCenterPacket.firstRowSelectedFourClass`;
- `SecondRowCommonDeletionSuccessor.ofPacket`;
- `SecondRowCommonDeletionSuccessor.secondCenterFullyDeletionRobust`;
- `secondRowSuccessor_or_secondCenterCritical`;
- `physicalSecondApex_commonDeletion_successor_or_swappedUniqueFour`;
- `physicalSecondApex_commonDeletion_robust_or_swappedUniqueFour`;
- `nonempty_sourceFaithfulCardFourteenSecondApexReduction`;
- `card_ge_fourteen_survivalCover_robust_or_swappedUniqueFour`; and
- `card_ge_fourteen_survivalCover_false`.

The final theorem is an interface audit, not a claim that its two consumer
hypotheses are already available.

## Validation

The current source was compiled directly with a 16 GiB Lean cap against a
freshly compiled `SurvivalCoverBankMatch.olean` and the current R-handler
scratch olean stack.  Every printed declaration reports only:

```text
propext, Classical.choice, Quot.sound
```

The Lean source contains no `sorry`, `admit`, declared axiom,
`native_decide`, `unsafe`, heartbeat override, or lint suppression.  No full
`lake-build` was run for this isolated scratch audit.
