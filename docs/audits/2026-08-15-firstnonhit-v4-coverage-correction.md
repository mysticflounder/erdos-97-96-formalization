# FirstNonHit v4 Coverage Correction

Date: 2026-08-15

Active leaf:
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_freshThird_firstNonHit`

## Governed wave result

The replacement run
`scratch/runs/freshthird-source-complete-static-v4/canary-20260815-0002`
is terminal and reentry-clean at source revision `91565c83`. Its four
boundary-index cells each replay as `SAT_ABSTRACTION`; the authenticated
source aggregate is
`33d79e16b6559392e8a0a4c22830a4246328ee576ec9f25710555d2ba3a5b3dd`
and the complete content aggregate is
`b3243efebdacf0e7f7d1e4a2b05555a306fa56624381278b4bc7f498f60825f5`.
Every model passed the complete CNF, source, and independent readback gates,
and terminal reentry made no solver call.

The mandatory wave-only mine found one boundary-symmetric survivor family:
the pinned fan meets the `Q` row in exactly one point. It produced no
cardinality-independent synchronization theorem, core, invariant, or source
clause.

## Coverage correction

The run is valid for its declared query, but it is not a source-total
projection of the active FirstNonHit leaf. Its Lean view starts from:

- a `CommonRadiusTwoCapSourceThirdCanonicalRowSurface`;
- a `FreshThirdPinnedEndpointOutsideSeedQueryPacket`; and
- an exact-three `FreshThirdQFiberThreeBoundary`.

In particular, `Packet.exactRow` is a
`FreshThirdEqualCenterExactFourRow`: it is the equal-center branch in which
both `Q` endpoints occur in the canonical source row. The open theorem instead
has `FreshThirdCapSourceNonHit C.firstSource Q`, whose two constructors give
either the `Q` blocker center or an omitted `Q` endpoint. Moreover, the
common-radius witness in `hingress` is existential and its `.surface` is not
identified with the live `C`. The v4 source row therefore cannot be relabeled
as the live first-nonhit row.

This distinction is observable in all four accepted models. Under that
invalid relabeling, every model has distinct source and `Q` centers while both
`Q` endpoints lie in the source row, so it falsifies the source-clean raw
non-hit clause:

```text
sourceCenter = qCenter
  or Q.source1 is absent from sourceRow
  or Q.source2 is absent from sourceRow.
```

Adding this clause to v4 would expose the provenance mismatch; it would not
close the live theorem. The accepted result is source-complete only for the
downstream exact-three pinned-endpoint query.

## Correct live projection boundary

A faithful local FirstNonHit projection has sixteen tagged products:

- two ingress arms;
- two `FreshThirdCapSourceNonHit` constructors; and
- four `FreshThirdCapSourceInteraction` constructors.

It must keep two distinct canonical source centers, both complete
`CapSourceThirdCanonicalRowWitness` packets, the retained deletion cores or
independent common-radius witness, and the four retained endpoints. The v4
boundary fan, exact-three boundary, and pinned-endpoint rows are downstream
premises and require a separate producer.

Because `CounterexampleData.A` has arbitrary cardinality, this local
sixteen-cell projection has no source-entitled finite carrier cover or
general-cardinality lift. `UNSAT` over only its named rows would not prove the
target.

## Seven-circle terminal audit

The new seven-circle obstruction is not an ingress shortcut. The exact-three
boundary supplies only the `Q` row and one distinct boundary row. It does not
construct the remaining five rows, an injective role embedding, or even the
smaller positive synchronization packet placing the boundary source and two
fiber-image points in one pinned fan row. Promoting another terminal without
that producer would leave an equivalent or stronger open leaf.

## Next proof boundary

No further local carrier wave is authorized from this result. The active proof
must split at its actual top-level ingress:

1. derive a direct source-clean contradiction from the aligned retained
   packet; and
2. independently normalize the common-radius surface against the same `Q` and
   derive a source-clean contradiction there.

Only a proved cardinality-independent producer from one of those live packets
may re-enter the synchronization or metric terminals. This checkpoint closes
no load-bearing `sorry`.
