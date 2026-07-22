# Exact-five cap-redesignation closure audit

Date: 2026-07-22

## Result

The exact-five second-cap residual admits a source-valid rerouting that bypasses
the complete exact-five outcome/mining tree.  The proof has now been promoted
to `ATail/FrontierLiveClosure.lean` and removes the production textual `sorry`
from `false_of_frontierBiApexRobustExactFiveGlobalCoverStarResidual`.

The checked scratch theorem is:

```lean
false_of_exactFiveSecondCap_via_firstOppCapRedesignation
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B) :
    False
```

It is proved in `ExactFiveCapRedesignation.lean` without a local `sorry`.  Its
only production `sorryAx` dependency is the already-existing theorem

```lean
false_of_originalFrontierUniqueRadiusArm
```

It does **not** depend on
`false_of_frontierBiApexRobustExactFiveGlobalCoverStarResidual`, the exact-five
profile, a `ExactFiveGlobalCoverStarOutcome`, the large-opposite-cap terminal,
or a card-≥14 assumption.

This closes the exact-five source theorem modulo the unique-radius frontier
theorem. It removes exact-five as an independent mathematical blocker, but it
does not make the resulting theorem unconditional until the unique-radius
terminal is also source-clean.

## Construction

The exact-five packet provides

```text
old surplus cap:        card > 4
old first opposite cap: card >= 6
old second opposite cap: card = 5
```

Keep the MEC triangle and cap partition unchanged, and designate the **old
first opposite cap** as the new surplus cap. The scratch definition is

```lean
redesignateFirstOppCapAsSurplus
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B) :
    SurplusCapPacket D.A
```

It is a valid `SurplusCapPacket` because the newly designated surplus cap has
cardinality at least six. A complete three-index check proves:

```lean
T.surplusCap = S.oppCap1
T.oppCap1    = S.oppCap2
T.oppCap2    = S.surplusCap
```

In particular,

```lean
T.oppCap1.card = 5.
```

No triangle vertex, cap set, MEC witness, convexity datum, or carrier point is
changed. Only `surplusIdx` is changed.

## Contradiction route

For the redesigned packet `T`, use global K4 and the same arbitrary critical
system `H` to extract a fresh frontier:

```lean
exists_criticalPairFrontier_of_K4 D T H
```

Dispatch that fresh frontier with

```lean
CriticalPairFrontier.false_of_parentResidualConsumers
```

using the original parent's geometric hypotheses

```lean
R.minimal
R.noM44
R.carrier_card_gt_nine.
```

The two branches are:

1. `OriginalFrontierUniqueRadiusArm freshFrontier`.
   This is discharged by the existing
   `false_of_originalFrontierUniqueRadiusArm`.
2. `FrontierCommonDeletionParentResidual freshFrontier`.
   The source-clean theorem `first_oppCap_card_ge_six freshParent` gives
   `6 ≤ T.oppCap1.card`, contradicting `T.oppCap1.card = 5`.

The common-deletion branch is therefore closed outright. There is no physical
second-apex split, exact-five recurrence, robust/critical split, or
large-opposite-cap invocation.

## Circularity audit

The scratch file imports `FrontierLiveClosure.lean` because the unique-radius
terminal is declared there. Module import is not a theorem dependency. The
proof term directly calls only:

- `exists_criticalPairFrontier_of_K4`;
- `CriticalPairFrontier.false_of_parentResidualConsumers`;
- `first_oppCap_card_ge_six`;
- `false_of_originalFrontierUniqueRadiusArm`.

The warning-as-error axiom audit reports:

```text
exists_criticalPairFrontier_of_K4
  [propext, Classical.choice, Quot.sound]

CriticalPairFrontier.false_of_parentResidualConsumers
  [propext, Classical.choice, Quot.sound]

first_oppCap_card_ge_six
  [propext, Classical.choice, Quot.sound]

false_of_originalFrontierUniqueRadiusArm
  [propext, sorryAx, Classical.choice, Quot.sound]

false_of_exactFiveSecondCap_via_firstOppCapRedesignation
  [propext, sorryAx, Classical.choice, Quot.sound]
```

Thus the only `sorryAx` imported by the new proof is exactly the unique-radius
terminal. The existing exact-five `sorry` is not used recursively.

## Source-contract audit

- The new packet is valid from `Q.firstOppCap_card_ge_six`; no unproved cap
  inequality is introduced.
- `D.K4` applies to the unchanged carrier and to every new physical apex, so a
  fresh frontier may be extracted for `T`.
- `R.minimal` and `R.carrier_card_gt_nine` depend only on `D`.
- `R.noM44` quantifies over every `SurplusCapPacket D.A`, so it applies to the
  redesigned packet without transport.
- The same `H` can be used because `CriticalShellSystem D.A` depends only on
  the carrier, not on the cap designation.
- No fields of the old `F`, common-deletion packet, or robust residual are
  transported to the new packet. A genuinely fresh frontier is extracted,
  avoiding invalid apex/pair identification.
- The proof does not use the old frontier's retained pair, exact-five radius
  profile, selected rows, global cover star, or outcome.

## Consequence for the live source

The existing source `sorry`

```lean
false_of_frontierBiApexRobustExactFiveGlobalCoverStarResidual
```

is filled by the cap-redesignation proof while ignoring its `profile` and
`outcome` arguments. That makes all wrappers below it source-clean and leaves
their axiom closure dependent only on the unique-radius terminal.

Alternatively, the lower
`false_of_frontierBiApexRobustExactFiveSecondCapResidual` wrapper can call the
new proof directly, but doing only that would leave the exported global-cover
theorem's textual `sorry` in place. For complete source cleanup, fill or remove
the global-cover theorem as well and then prune now-unused exact-five outcome
plumbing only after reference mining.

The earlier card-arithmetic split

```text
old surplus >= 6
or old surplus = 5 and old first opposite >= 7
```

is true under card ≥14, but it is no longer load-bearing. The redesignation
argument closes both sides uniformly and needs no carrier-card strengthening.

## Validation

Run from the Lake root `lean/`:

```bash
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/cardge14-global-occurrence/ExactFiveCapRedesignation.lean
```

Result: exit code 0. The displayed `#print axioms` output is reproduced in the
circularity audit above.

The promoted production target also passed:

```bash
lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure
```

The build completed successfully and the refreshed proof-blueprint spine for
`Problem97.u1_largeCap_routeB_tail_liveData_false` reports only two remaining
source obligations:

```text
false_of_originalFrontierUniqueRadiusArm
false_of_frontierLargeOppositeCapsBiApexRobustResidual
```

`proof-blueprint axioms` on the promoted exact-five theorem reports exactly
`propext`, `sorryAx`, `Classical.choice`, and `Quot.sound`; the sole
`sorryAx` edge is the unique-radius terminal documented above. No
`SurplusM44`, exact-seven, or protected user-owned file was changed.
