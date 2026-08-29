# First-fiber consumer bridge audit

> **Status refresh (2026-08-28): DATED CONTRACT SNAPSHOT.** The producer/consumer
> mismatch remains relevant, but the owner/checkpoint and source anchors below
> are historical rather than current authority.

Status: **contract audit complete; no closure claim** (2026-08-18).

## Target

The active target is
`false_of_capSource_firstFiber_outsidePairDeletionExactRows` in
`TwoSourceFirstFiberCollision.lean:2652` (proof body at line 2686).  Its
outside-pair deletion input is a five-row boundary for deleting either
`Q.source.1` or `Q.otherOutsidePoint`, with centers

```text
source blocker, Pρ.source₁ blocker, oppApex1, oppApex2, surplusApex.
```

## Bridge test

The obvious finite adapter is:

```lean
deleted = Q.source.1     ↦ Or.inl ⟨outsideExactRows⟩
deleted = Q.otherOutsidePoint
                         ↦ Or.inr (Or.inl ⟨outsideExactRows⟩)
```

This does typecheck as a construction of the first two arms of
`FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual`.

It does **not** close the target.  The downstream theorem
`false_of_capSource_firstFiber_collisionFiveCenterDeletion` at line 2825
consumes exactly that residual, but its exact-row arms call the target back.
The attempted direct call is also unavailable at the target's source position
because Lean declarations are not forward-referenced.  More importantly, its
transitive axiom audit is

```text
[propext, sorryAx, Classical.choice, Quot.sound]
```

so using it would be a circular reuse of the live `sorry`, not a proof.

## What is genuinely reusable

`collisionFiveCenterDeletion_to_sixCenterAcyclicFaithfulResidual` in
`FirstFiberAcyclicFaithfulIngress.lean` is source-clean:

```text
[propext, Classical.choice, Quot.sound]
```

However, it consumes a collision-endpoint deletion residual, not the outside
point deletion boundary of this target, and it produces only a positive
six-center faithful packet.  There is no source-clean `False` consumer for
that packet in the current import graph.

Likewise, `TwoSourceU3Ingress.exists_exactRadiusAuditObstruction` and the
`SixSurvivorExactRowsBoundary` U3 adapters produce audit obstructions, but
their terminal step still requires a new universal rowwise-confinement
producer.  They are not a closure bridge by themselves.

## Consequence for the plan

The target cannot be closed by a wrapper or by importing the positive
six-center adapter.  The next legitimate theorem must be one of:

1. a source-clean contradiction for the outside-point five-row boundary;
2. a general rowwise-confinement theorem feeding the existing U3 terminal; or
3. a metric/order theorem that turns the combined outside-row and retained
   exact-row data into a contradiction.

No CEGAR successor is justified until one of these producer contracts exists.

## Execution checkpoint (2026-08-18)

The active owner is the `firstfiber-consumer-bridge-20260818` lane. The target
remains open, and the focused reuse search over
`FiveSurvivorExactRowsBoundary`, `SixCenterFaithfulCarrierBoundary`, and the
U3/Kalmanson consumers found no source-clean contradiction consumer accepting
this exact-row packet. The faithful six-center adapters are ingress producers
only; U3 reaches contradiction only after the missing universal
`RowwiseConfinedQDeletedClasses` producer; Kalmanson requires an ordered
boundary and metric equalities not present in this residual. No Lean body
change is justified until one of those missing producers or a direct
metric/order contradiction is proved.

## Pair-cover consumer check

The closure matrix's global-pair-cover route was checked as the next
consumer-first candidate. `ATailMinimalUniqueFourCover.card_le_four_mul_notRobustCenters`
is only a cardinality inequality; it does not identify any of the four
retained-pair inclusions needed by this leaf. The source-clean pinned cut
`SixSurvivorExactRowsBoundary.physicalRows_inter_retainedPairs_card_le_one`
has a stronger pointwise shape, but its ingress requires a six-row boundary
whose `B₁` is exactly the full first-fiber shell
`{P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint}` and whose `B₀`
contains the opposite retained pair. The outside-point boundary supplied to
the target has only a deleted-point row packet; it provides neither that
`B₁` equality nor the required opposite-pair membership. Therefore this
consumer cannot be applied by a wrapper or by the existing
`toActualBlockerSixCenterBoundary` adapter.

The concrete missing contract is now narrow: produce either the required
first-fiber-shell row identity/opposite-pair membership, or a different
source-clean contradiction consuming the outside-point exact rows. Until
that producer exists, adding another pair-cover lemma would be producer-only
work and is deliberately not being added.

## U3 consumer check

The second candidate also has a strict ingress mismatch. The U3 terminal's
`RowwiseConfinedQDeletedClasses` quantifies over six generated audit centers
`{u, a0, a1, t₁, t₂, t₃}` and requires every q-deleted four-row support to be
contained in the generated `U5BoundedSupport`. `outsideExactRows` supplies only
five q-deleted rows at the named source/Pρ/apex centers. The generic
five-to-six adapter adds an arbitrary selected class for a sixth center; it
does not create the `SixSurvivorExactRowsBoundary` fields (`B₅`, its exact
four-cardinality, and actual-blocker separation) required by the U3 ingress.
Moreover, `hexactRows` deletes a P/Pρ collision endpoint, whereas
`outsideExactRows` deletes a Q outside point, so the two packets cannot be
combined into one same-q six-row boundary. No theorem identifies the named
centers with the six generated audit centers or their bounded support.

Thus the U3 route needs both a same-q sixth deleted row and a
generated-frame/support identification, followed by the universal confinement
theorem; none is currently available.

## Recommended consumer route

The repository already has the right generic consumer:
`Census554.GeneralCarrierBridge.false_of_metricCoreAlternative`, together
with the source-clean five-row adapter
`false_of_fiveSurvivorFaithfulCarrierBoundary_metricCore` in
`ExactTwelveRigid221SourceSafeIngress.lean`. The practical route is to move
or duplicate only this import-safe adapter into a module reachable from the
FirstFiber target, then convert `outsideExactRows` with
`toFaithfulCarrierBoundary` and pass a `MetricCoreAlternative` for the
resulting carrier pattern.

That separates the work correctly:

1. the consumer is a kernel-checked generic metric contradiction already in
   the theorem bank;
2. the remaining mathematical/computational task is a source-faithful
   coverage theorem that produces `MetricCoreAlternative` for every allowed
   outside-pair pattern; and
3. if that coverage is satisfiable, its model becomes a smaller metric-core
   mining target rather than another unconditional producer.

This is preferable to adding a conditional theorem in the target file: it
gives the finite search an immediate Lean landing and avoids another orphan
packet.
