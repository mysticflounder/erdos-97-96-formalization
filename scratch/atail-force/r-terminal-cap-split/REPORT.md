# Terminal reciprocal-cross cap split

Status: **implemented and focused-Lean validated**.

This scratch lane strengthens the live
`ReciprocalDirectedCrossResidual` without adding a new producer hypothesis.

The endpoint theorem is:

```lean
ReciprocalDirectedCrossResidual.endpoint_cap_split
```

It returns exactly two packet types.

## Both-strict packet

`BothStrictBlockerCapPacket X` proves:

- the source and deleted endpoint are both in strict `oppCap1`;
- the deleted endpoint's actual blocker is also in strict `oppCap1`;
- the deleted endpoint's selected row meets `oppCap1` in exactly
  `{deleted, source}`;
- the other two row-support points lie outside `oppCap1`;
- no third distinct strict-`oppCap1` point belongs to that row; and
- the endpoint distances from `oppApex2` are unequal.

The blocker localization does not assume that the ambient first-apex class
has cardinality five.  The old strict-cross classifier used card five only to
show that the blocker differs from `oppApex1`.  Here the residual's
`deleted_survives_firstApex` field proves that separation directly through
`actual_blocker_ne_of_deletion_survives`.

The support count is saturated, not contradictory.

## Cross-cap boundary packet

`CrossCapOrderedBoundaryPacket X` retains:

- one endpoint in strict `oppCap1`;
- the other endpoint in `oppCap2`, either at the shared Moser endpoint
  `surplusApex` or in strict `oppCap2`;
- the latter as the exact singleton intersection of the fixed first-apex
  radius fiber with `oppCap2`;
- the already-forced unequal second-apex distances;
- a concrete `CGN.OrderedCap` realization of `oppCap2`;
- concrete distinct ranks for the exceptional endpoint and `oppApex1`; and
- proof that the strict-`oppCap1` endpoint lies outside that ordered cap.

This is an exact boundary packet, not a contradiction.  A future consumer
must add a genuine ordered-cap or global-row coupling; the singleton and
strict-distance fields alone realize existing upper bounds.

## Overlap with the global-boundary continuation

The concurrently landed
`r-full-parent-entry/ReciprocalDirectedCrossGlobalBoundary.lean` is the more
load-bearing continuation theorem.  It proves:

- `fixedClass ∩ deletedRow = {deleted, source}`;
- exactly two deleted-row points lie outside that fixed class; and
- one such fresh point yields either a new two-center common-deletion packet
  or an exact second-apex critical row.

The present both-strict packet overlaps in two ingredients: it also uses
`deleted_survives_firstApex` to separate the deleted blocker from
`oppApex1`, and it also obtains a two-plus-two decomposition of the deleted
row.  Its distinct contribution is cap-local:

```text
deletedRow ∩ oppCap1 = {deleted, source}
card (deletedRow \ oppCap1) = 2.
```

The ordered `oppCap2` endpoint packet is not supplied by the global-boundary
file.  Thus this file is an orthogonal localization refinement, not a
replacement for that continuation and not an independent closure.

## Validation

Focused elaboration from `lean/` succeeded:

```bash
BASE_LEAN_PATH="$(lake env printenv LEAN_PATH)"
lake env env \
  LEAN_PATH="/private/tmp/p97-r-orbit-entry-oleans:${BASE_LEAN_PATH}" \
  lean -M 16384 \
  -R ../scratch/atail-force/r-terminal-cap-split \
  -o /private/tmp/TerminalCapSplit.olean \
  ../scratch/atail-force/r-terminal-cap-split/TerminalCapSplit.lean
```

Both printed dependency sets are exactly:

```text
[propext, Classical.choice, Quot.sound]
```

The Lean source has no `sorry`, `admit`, declared `axiom`, `native_decide`,
or `unsafe` declaration, and no line exceeds 100 characters.

No production file, protected scratch file, shared closure document, or
other-agent file was edited.
