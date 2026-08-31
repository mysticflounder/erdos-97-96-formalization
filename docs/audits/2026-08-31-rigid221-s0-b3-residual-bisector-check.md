# Rigid221 B3 residual-bisector check

**Date:** 2026-08-31
**Lane:** `rigid221-s0-b3-residual-bisector-check-20260831`
**Status:** Lean-elaborated source relation; no B3 closure claim.

## Checked relation

In the source-row-heavy literal-blocker leaf
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy`,
write `q = R.interior_q` and `w = R.interior_w`.  The live inputs yield

```text
dist P.v q ≠ dist P.v w.
```

The derivation uses only `P` and the leaf's strict second-cap membership of
`P.v`; the blocker identity and the source-row count are retained in the
scratch example only to match the B3 interface.

1. `P.v` lies in `S.capInteriorByIndex S.oppIndex2`.
2. A strict indexed-cap interior point differs from every opposite Moser
   endpoint.  In particular, `P.v ≠ S.oppApex1`.
3. If `dist P.v q = dist P.v w`,
   `R.bisector_center_mem_interior` places `P.v` in
   `S.capInteriorByIndex S.oppIndex1`.
4. The strict first-cap interior is outside the closed second cap because
   `S.oppIndex1 ≠ S.oppIndex2`.  This conflicts with step 1.

The relevant source declarations are:

- `OriginalUniqueFourResidual.bisector_center_mem_interior` in
  `OriginalUniqueResidualDispatch.lean:66`;
- `SurplusCapPacket.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem` in
  `SurplusM44Packet/Shard02.lean:190`;
- `SurplusCapPacket.capInteriorByIndex_not_mem_capByIndex_of_ne` in
  `SurplusM44Packet/Shard02.lean:201`; and
- the literal-blocker B3 leaf in `Rigid221Placement.lean:903`.

The source-outside-fiber route also separates the actual source blocker from
the first apex, but the strict second-cap membership gives the shorter route
inside this leaf.

## Lean check

The no-`sorry` scratch example is retained at
`scratch/runs/rigid221-s0-b3-residual-bisector-check-20260831/lean-verify-v1/ResidualBisectorCheck.lean`.
It elaborated successfully in 6.36 seconds from the nested `lean/` project
root.  A governed build of
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement` also
completed successfully in 4.58 seconds.

The governed build reports the pre-existing `sorry` declarations in the
target and its import cone.  It establishes import coherence for this check;
it does not remove those obligations or establish B3.

The full command dispositions and authenticated source inputs are in the
[run receipt](../../scratch/runs/rigid221-s0-b3-residual-bisector-check-20260831/lean-verify-v1/receipt.json).

## Consumer and computation boundary

No current B3 terminal consumes the residual distance inequality.  The live
source-survival field gives a cross-omission at the source blocker, but it
does not identify either residual point with a physical-row role or force a
second common-radius relation.  Consequently, this result should remain a
local fact until such a relation has a named B3 consumer.

The current C3 two-row PiQD probe has no roles for the first-apex residual
pair.  Adding this single inequality without a source-backed connection to
its named rows would test an enlarged formula with no new B3 consequence, so
this lane starts no new PiQD job.  A later solver run needs a source-entitled
link from `R.interior_q` or `R.interior_w` to a physical row, deletion packet,
or terminal case split.
