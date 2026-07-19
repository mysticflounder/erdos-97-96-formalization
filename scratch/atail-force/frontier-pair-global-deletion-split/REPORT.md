# Frontier-pair global deletion split

Date: 2026-07-19

Status: **SCRATCH KERNEL-CHECK TARGET. NO PRODUCTION SORRY CLOSED.**

`FrontierPairGlobalDeletionSplit.lean` applies the existing global minimality
bridge to the actual retained `CriticalPairFrontier.pair`, using the
large-opposite-cap parent’s certified `14 ≤ D.A.card` bound.  It preserves the
complete source-indexed deletion core and classifies the core as either a
singleton or the full frontier pair `{q,w}`.

This is the first source-faithful reduction after the audited local replay. It
does not assert that either arm is contradictory. The singleton arm needs a
consumer that turns one frontier-source deletion failure into progress or a
known terminal. The pair arm is the current global minimal-deletion survival
surface; it still needs the total `CriticalShellSystem`/MEC/progress consumer
identified in the parent route audit.

## Current downstream boundary

The production-typed physical-second-apex consumer has been rechecked from
current source in
`scratch/atail-force/matching-endpoint-frontier-coupled/ProductionPhysicalSecondApexCore.lean`.
Its endpoint is:

```text
CommonDeletionTwoCenterPacket D H deleted center S.oppApex2
  -> FullyDeletionRobustAt D S.oppApex2
     or PhysicalSecondApexCriticalResidual D S
```

This is the correct consumer for a companion packet, but it is not a direct
contradiction.  The scratch card-14 survival-cover adapter can produce such a
packet source-faithfully from the cross-survival branch, while retaining the
total blocker map and the frontier deletion.  Its robust arm still needs the
large-cap robust consumer; its critical arm routes through the protected swap
frontier.  Therefore the next theorem must consume the complete `L` packet
and the cross split together; it must not promote the common-deletion packet
as an anonymous recursive successor.

The card-≥14 producer is now also ported into production at
`lean/Erdos9796Proof/P97/ATail/SurvivalCover.lean`.  The theorem
`exists_sourceFaithful_secondApexCommonDeletionPacket_of_card_ge_fourteen`
uses only the production anchored deletion cover, exact support locking, and
the four-point actual-blocker fiber bound.  Its companion
`sourceFaithful_card_ge_fourteen_physicalSecondApex_consumer` immediately
feeds `physicalSecondApex_commonDeletion_robust_or_critical`.  Both focused
declarations are source-clean with axioms exactly
`propext`, `Classical.choice`, and `Quot.sound`.

This promotion removes the producer/interface gap but does **not** close a
sorry: the theorem still requires the non-exact-card-four branch and the
`w ∈ selectedAt(q)` cross-hit field, and its output is the existing robust or
physical-critical residual.  The next load-bearing task is the complete
`L`-indexed consumer for those two residuals, with the exact-card-four branch
kept separate.

Acceptance gate: `cd lean && lake env lean ../scratch/atail-force/frontier-pair-global-deletion-split/FrontierPairGlobalDeletionSplit.lean`
must pass with no `sorry` and no `sorryAx` in the declaration’s transitive
axioms.  The focused check passes; the declaration has axioms exactly
`propext`, `Classical.choice`, and `Quot.sound`.
