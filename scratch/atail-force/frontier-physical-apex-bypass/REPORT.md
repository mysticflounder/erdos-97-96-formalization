# Direct frontier physical-apex bypass

Date: 2026-07-17

Status: **adapter pending direct validation**.

`FrontierCommonDeletionParentResidual F` already stores
`R.common.packet : CommonDeletionTwoCenterPacket D H F.pair.q
S.oppApex1 S.oppApex2`.  Therefore the checked scratch theorem
`physicalSecondApex_commonDeletion_robust_or_swappedUniqueFour` applies
without entering the strict-interior collision/matching normal form.

The exact resulting parent boundary is:

```text
FullyDeletionRobustAt D S.oppApex2
or
SwappedFirstApexUniqueFourFrontier D S H.
```

If direct validation succeeds, the seven strict-interior leaves are fallback
consumers inside the robust branch, not primary parent obligations.  The
remaining primary work is the physical-second-apex robust consumer plus the
protected original/swapped unique-four/five consumers.
