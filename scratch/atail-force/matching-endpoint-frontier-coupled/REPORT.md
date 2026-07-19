<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Matching-endpoint/frontier coupling audit

## Route correction

The matching endpoint and three-distinct-blocker leaves do not need their own
consumer before the parent is reduced further.  Every
`FrontierCommonDeletionParentResidual F` already stores

```text
R.common.packet :
  CommonDeletionTwoCenterPacket D H F.pair.q S.oppApex1 S.oppApex2.
```

The second center is definitionally the physical second apex.  The older
uniform-consumer scratch lane duplicated both `CommonDeletionTwoCenterPacket`
and `FullyDeletionRobustAt`, so its theorem is not literally a one-line
application to current production data.  This audit ports the short uniform
argument to the production packet and robustness types as
`productionPhysicalSecondApex_commonDeletion_robust_or_critical`.  Its output
is entirely production-typed:

```text
FullyDeletionRobustAt D S.oppApex2
  or
PhysicalSecondApexCriticalResidual D S.
```

It is therefore promotable independently of the protected swap lane.  The
scratch corollary
`productionPhysicalSecondApex_commonDeletion_robust_or_swappedUniqueFour`
then applies `secondApexCritical_reorients_to_firstApexUniqueFour` to its
critical arm.  The frontier adapter is then genuinely one line, before strict-interior source
selection, and gives

```text
FullyDeletionRobustAt D S.oppApex2
  or
SwappedFirstApexUniqueFourFrontier D S H.
```

`FrontierParentPhysicalSecondApexReduction.lean` records the exact adapter and
a direct parent assembler.  The assembler shows that the entire common-
deletion side now has only two mathematical consumers:

1. `FullyDeletionRobustAt D S.oppApex2 -> False`;
2. `SwappedFirstApexUniqueFourFrontier D S H -> False`.

Together with the protected original unique-radius consumer, these suffice to
close the critical-pair frontier.  The four strict-interior constructors and
seven nested leaves are therefore fallback diagnostics, not required inputs
to the primary parent reduction.

## Consequence for the old endpoint lane

No equality classification between the endpoint walk sources and the original
frontier pair is load-bearing on the corrected route.  Such a classification
would only refine data that the stored physical-second-apex packet already
bypasses.  The endpoint lane should be paused unless one of its rows is later
needed inside the robust physical-second-apex consumer.

## Theorem-bank preflight

The required general-n registries and the indexed Lean corpus were checked
before writing the adapter.  Searches found the existing physical-second-apex
uniform consumer, Kalmanson kernels, common-deletion packets, and U5 families,
but no theorem that eliminates either final robust or swapped-unique-four
frontier without their existing protected consumers.

## Epistemic status

The reduction is a proof-interface improvement, not a closed `sorry`.  It is
decisive for route selection because it removes the matching endpoint,
three-cycle, collision, and source-return leaves from the primary dependency
chain.  Full closure still requires the robust physical-second-apex theorem
and the original/swapped protected unique-frontier theorems.

## Validation

The production-typed core is isolated in
`ProductionPhysicalSecondApexCore.lean`.  It imports only production modules
and checks directly under the project toolchain:

```text
Lean 4.27.0, commit db93fe1608548721853390a10cd40580fe7d22ae
```

From `lean/`, the successful core check was:

```sh
lake env lean -M 16384 \
  ../scratch/atail-force/matching-endpoint-frontier-coupled/ProductionPhysicalSecondApexCore.lean
```

For the protected swap corollary, the core was emitted to a temporary olean
and checked with the current swap dependency cache:

```sh
lake env lean -M 16384 -R .. \
  -o /private/tmp/p97-frontier-parent-physical-second-apex-current/ProductionPhysicalSecondApexCore.olean \
  ../scratch/atail-force/matching-endpoint-frontier-coupled/ProductionPhysicalSecondApexCore.lean

LEAN_PATH=/private/tmp/p97-frontier-parent-physical-second-apex-current:/private/tmp/p97-two-radius-deps-427-v2 \
  lake env lean -M 16384 -R .. \
  ../scratch/atail-force/matching-endpoint-frontier-coupled/FrontierParentPhysicalSecondApexReduction.lean
```

Every printed declaration reports only:

```text
propext, Classical.choice, Quot.sound
```

Both Lean files are source-clean: no `sorry`, `admit`, declared axiom,
`native_decide`, `unsafe`, or heartbeat override occurs.
