# Critical-frontier continuation dispatcher

Status: **kernel-green bridge and branch-complete parent interface; all three
content arms remain open.**

This scratch directory closes the source-level bookkeeping gap from the concrete parent
`CriticalPairFrontier` to the existing continuation geometry.  It does not
claim A-TAIL or K-A-PAIR closure, and it does not describe cross survival or
the non-equilateral residual as already consumed.

## Exact construction

[`FrontierContinuationDispatcher.lean`](./FrontierContinuationDispatcher.lean)
proves the following source-current chain.

```text
F : CriticalPairFrontier D S r Hcritical
  |
  | F.secondApexDouble
  v
K : SelectedFourClass D.A S.oppApex2
    with F.pair.q,F.pair.w absent from K.support
  |
  | continuation geometry over rebasePacket D S
  v
P : TwoContinuationRows (rebasePacket D S) K
  |
  v
CrossSurvivalOutput P
or NonEquilateralOutput Hcritical P
or P.EquilateralResidual
```

The first step is not an unrelated global-K4 choice.  The selected row is
trimmed from the actual twice-erased second-apex witness stored in `F`, then
lifted to the original carrier.  Consequently both continuation centers are
proved distinct from both retained frontier sources.

No equality `D.packet = S` is assumed.  The continuation classifier runs on
the explicit rebased datum `{ D with packet := S }`, while its carrier,
convexity, and K4 fields remain definitionally those of `D`.

## Branch routing

The classifier output is refined without asserting a contradiction.

| Branch | Checked routed output | Current status |
|---|---|---|
| K4 at `z1` survives deletion of `z2`, or conversely | Original survival fact plus an exact `U5QDeletedK4Class`, packaged as `QDeletedFourRow` | **OPEN**: no current consumer closes one such row |
| Non-equilateral `MetricResidual` | Full residual metric data plus `CommonDeletionTwoCenterPacket` for common deletion `S.oppApex2` at centers `z1,z2` | **OPEN**: the two-center packet is a bank-ready normal form, not a terminal |
| `EquilateralResidual` | Existing `JointTransitionCoreEliminator D S Hcritical` interface | **OPEN**: the paired joint eliminator is the new geometry theorem isolated in the sibling scratch directory |

The non-equilateral routing is stronger than merely preserving the original
disjunction.  Its residual says `S.oppApex2` is absent from both continuation
supports, so each selected four-row survives deletion of that same apex.
`nonempty_commonDeletionTwoCenterPacket` then supplies two exact q-deleted
rows with distinct centers and the retained actual-blocker avoidance facts.

## Exact missing parent content

`FrontierContinuationEliminators F` contains exactly three fields:

```lean
crossSurvival :
  forall K P, CrossSurvivalOutput P -> False

nonEquilateral :
  forall K P, NonEquilateralOutput Hcritical P -> False

equilateralJoint :
  JointTransitionCoreEliminator D S Hcritical
```

These are proof fields in a `Prop` structure.  The file does not construct
them, declare them as axioms, or hide them behind a `True` placeholder.

`false_of_criticalPairFrontier_of_continuationEliminators` proves that those
three fields close any concrete frontier.  At the full parent level,
`CommonCriticalMapContinuationContent` mirrors the exact quantifier order and
all hypotheses of `CommonCriticalMapClosingProducer`, but returns a
`FrontierContinuationEliminators F` at each retained frontier.

Finally,

```lean
commonCriticalMapClosingProducer_of_continuationContent
```

kernel-checks the conversion from that explicit content contract to
the existing direct-`False` parent producer.  Thus a future proof can use the
full MEC/cap/no-M44/cardinality/live-data context independently in each of the
three fields; the interface does not accidentally demand a geometry-free
`D,S,Hcritical -> False` theorem.

## What remains mathematical

The bridge itself is complete.  The remaining task is not more transport:

1. eliminate the single q-deleted continuation-row arm using additional
   parent geometry or strengthen it to a known terminal packet;
2. eliminate `CommonDeletionTwoCenterPacket` while retaining the
   non-equilateral metric inequalities; and
3. prove the joint transition eliminator on the equilateral arm.

The exact `Q(sqrt(3))` paired-profile audit currently informs only item 3.
It does not close items 1 or 2 and is not used in this Lean file.

## Bank preflight

The mandated current and archived theorem-bank summaries were searched before
adding the adapters:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed searches covered one q-deleted continuation row, two exact
rows with a common deleted source, non-equilateral continuation centers, and
the equilateral continuation residual.  The current reusable endpoints are:

- `U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton`;
- `U5QDeletedK4Class.inter_card_le_two`;
- `nonempty_commonDeletionTwoCenterPacket`;
- `TwoContinuationRows.cross_survival_or_metricResidual`; and
- `JointTransitionCoreEliminator` plus its checked consumer adapter.

No indexed theorem turns either the single-row cross-survival output or the
two-center common-deletion output into `False`.  They therefore remain
separate parent content fields.

## Validation

The local scratch dependencies were compiled to temporary oleans, then the
dispatcher was checked directly:

```bash
cd lean
LEAN_PATH=/tmp/p97-joint-transition-oleans lake env lean \
  -R ../scratch/atail-force/frontier-continuation-dispatcher -M 16384 \
  -o /tmp/p97-joint-transition-oleans/FrontierContinuationDispatcher.olean \
  ../scratch/atail-force/frontier-continuation-dispatcher/FrontierContinuationDispatcher.lean
```

The check exits `0`.  Every exported proof reports exactly the accepted core
axioms `propext`, `Classical.choice`, and `Quot.sound`.  The Lean source has no
`sorry`, `admit`, declared axiom, or `native_decide`.

No full Lake build was run.  No production source, closure document,
`SurplusM44`, unique-row, census, or other scratch lane was edited.
