# Rigid221 S0 B3 opposite-row next-blocker edge

**Date:** 2026-08-31
**Lane:** `rigid221-s0-b3-opposite-row-edge-20260831`
**Base:** `ff935411514804caf003171164807f79d16a341e`
**Status:** source-entitled edge formalized; B3 remains open

## Result

`Rigid221Placement.lean` now contains
`exactFourRigid221_sourceEqU_oppositeRowPartner`.  For every
`ExactFourRigid221PhysicalApexSourceEqUContext P`, it produces a point `xv`
such that

```text
xv ≠ v,
selectedAt(v).support ∩ SelectedClass(A, oppApex2, rho) = {v, xv},
dist(centerAt(v), v) = dist(centerAt(v), xv).
```

This is the second source-entitled equal-distance edge available in the
literal-blocker B3 branch.  Its direct on-spine consumer is
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy`,
which now extracts the witness before its still-open residual goal.

## Derivation

Let `Kv` be the selected shell at `v`, let `C` be the physical second-apex
class, and let `Iv = Kv.support ∩ C`.

- The rigid `2+2+1` cover gives `Iv.card = 2`.
- `v ∈ Iv` follows from `Kv.q_mem_support` and `P.hvClass`.
- The second member of a two-point finset gives `xv ≠ v` and `Iv = {v, xv}`.
- Both points are in `Kv.support`, so `Kv.support_eq_radius` gives the stated
  distance equality at `centerAt(v)`.

The proof uses only fields already retained in `P.globalDeletion.rigid` and
the selected-row shell API.  It adds no hypothesis to the B3 context.

## Remaining boundary

The result gives physical-class membership and an equal-distance edge for
`xv`, but not `xv`'s strict second-cap membership.  It also does not place
`centerAt(v)` in the physical class or strict cap.  The existing ordered-cap
cycle terminal needs those further placement facts, so the B3 target is not
closed by this lemma.

The joint-deletion provenance audit found no current import-reachable producer
for either missing placement.  A new theorem asserting one would add geometry
not present in the current source interface.

## Validation

The production module was rebuilt with the locked project wrapper:

```text
LAKE_BUILD_NO_REFRESH=1 lake-build \
  Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement
```

It completed successfully; Lake reports a 29.0-second build for the target
module.  The retained scratch elaboration check also exited successfully in
7.8 seconds.  Existing `sorry` warnings in `Rigid221Placement.lean` remain
pre-existing open proof obligations; this lane adds no new admitted theorem.

No PiQD run was launched.  The new edge is source-faithful, but the missing
strict-cap placement still prevents a complete finite B3 contract with a
kernel-checked consumer.
