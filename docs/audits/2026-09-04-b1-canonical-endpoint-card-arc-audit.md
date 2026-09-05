# B1 canonical endpoint card-arc producer audit

Date: 2026-09-04  
Lane: `luna-swarm-slice-ingress-b1-canonical-endpoint-card-arc-audit-20260904`  
Base head: `0512b464a6e6100bbca6281ade93d166149e9205`

## Verdict

`B1GoodCanonicalEndpointCardArc C W R` cannot be derived soundly from
`B1GoodCanonicalDeletionEndpointResidual C W.escape` with the current
hypotheses.  No Lean source was changed, no new `sorry` or wrapper was added,
and no governed build was run.  Adding the requested producer now would assert
the missing geometric order fact rather than prove it.

The existing consumer is already correctly factored:

```lean
false_of_b1GoodCanonicalEndpointCardArc
false_of_b1PhysicalClassFiveSixNormalForm_of_escapeSource_and_goodCanonicalEndpointCardArc
```

The first consumes a card-specific `B1SliceSameBoundaryArc` packet and turns
it into the existing two-circle contradiction.  The second only dispatches the
source branch and that consumer.  Thus the producer, not the consumer, is the
open obligation.

## Indexed theorem-bank preflight

One exact indexed preflight was run against the repository Lean corpus for the
producer and its immediate consumer.  The relevant indexed handles were:

- `HB11QQ`: `B1GoodCanonicalEndpointCardArc`; records that the residual has no
  source-context branch and that its missing input is the card-specific arc
  packet.
- `F53ZTC`: `false_of_b1GoodCanonicalEndpointCardArc`; records that the
  explicit arc antecedent is sufficient for the existing contradiction.
- `2VXF68`: `B1GoodCanonicalDeletionResidual.toEndpointResidual`; supplies the
  zero-cut endpoint order but not a live-slice arc.
- `SZJV9Z`: `B1CardFiveEndpointOrderResidual`.
- `KPXVAR`: `nonempty_b1CardFiveEndpointOrderResidual`.

The preflight found no producer theorem whose hypotheses are only the current
canonical endpoint residual and `W.cardCase`.  The five handles are stale
candidates indexed at source commit `01971801e` with target-file SHA
`a606028e`.  Their claims were rechecked directly against the current target
module at SHA `d6853a3439c5168f99b7d8e60b708a4fb4b4801d11ce82a2b2569f9ae3c68d97`.
The handles remain useful as search pointers, but they are not current-source
authentication.

## Hypothesis-by-hypothesis audit

### `R.endpoint`

`B1GoodCanonicalDeletionEndpointResidual.endpoint` (in
`B1WinningSliceOrderOutcome.lean:1987`) gives one of two alternatives: one
deleted point is strict interior and the other is adjacent, or the deleted
points straddle the canonical blocker of the relevant deleted source.  All
three order points are the deleted sources and the canonical blocker.  The
packet does not mention either `b1USlice` or `b1VSlice`, the physical apex, or
the live row blockers.  It therefore cannot establish that a live pair lies on
one side of the required apex/blocker cut.

### `R.omittedPeer`

The `omittedPeer` field (at `B1WinningSliceOrderOutcome.lean:1977`) supplies a
single peer in one of the original live slices, together with strict-cap
membership, omission from one selected support, and a distinct center.  It
does not place the second live endpoint, does not identify a common cut for the
pair, and does not imply a same-boundary-arc relation.  A one-point omission
cannot feed the existing shared-pair separation theorem into a two-point
same-arc conclusion.

### `W.cardCase`: card five

`B1CardFiveWinningSliceArc` (at
`B1WinningSliceOrderOutcome.lean:1374`) is itself the missing statement: it
requires a boundary indexing and either a two-point `U` slice or a two-point
`V` slice satisfying `B1SliceSameBoundaryArc`.  The live card-five role packet
provides the shape/cardinality branch, but no order of the two live points on
the physical apex/blocker cut.  The endpoint residual does not add that order.

### `W.cardCase`: card six

`B1CardSixWinningSliceArc` (at
`B1WinningSliceOrderOutcome.lean:1107`) requires a boundary indexing and a
same-arc relation for either live slice.  The available
`b1_cardSix_liveSlices_card_two` theorem supplies the two cardinalities used by
the consumer, but not the order relation.  The separate
`B1CardSixRawOrderBridge.b1LiveSlicesSameBoundaryArc_of_rawCardSixGood`
requires `rawCardSixGood`, whose two bicondition order equalities are not a
field of the canonical endpoint residual.

## Earliest loss site and exact missing fact

The earliest loss is the construction of `B1EscapeRowProvenanceStar` in
`B1WinningLiveSliceIngress.lean:137`: its own comment says that no boundary
order of the live pair is assumed.  Its `winning_slice_card` field records only
that one live slice has cardinality two.  The subsequent
`B1GoodCanonicalDeletionResidual.toEndpointResidual` (at
`B1WinningSliceOrderOutcome.lean:2011`) adds endpoint order for the deleted
pair, but never adds order for that live pair.

The first missing order/incidence fact is therefore exactly one of the
following card-specific conclusions, with a common boundary indexing `B`:

```lean
-- card five
B1CardFiveWinningSliceArc C

-- card six
B1CardSixWinningSliceArc C
```

Unpacked, this is a `B1SliceSameBoundaryArc` relation for a cardinality-two
`b1USlice C` or `b1VSlice C`, using the physical apex `S.oppApex2` and the
corresponding late row blocker.  A proof must force both live endpoints to
have the same truth value for the `btw` predicate with that apex and blocker;
a stronger global cap/order lemma must supply this common-cut direction.

The retained negative control
`docs/audits/2026-09-03-b1-endpoint-order-negative-control.md` (SHA-256
`a23ed8b79b9370df74f39d7e5dd3d9af1694401ba4ef8a67a8904a038f3cdec3`)
exhibits endpoint facts compatible with both live pairs alternating across
their respective cuts.  `separated_matching_unique` cannot apply because the
cuts differ.  The convex helper
`B1EscapeRowProvenanceStar.sliceSameBoundaryArc_of_subset_secondCapInterior`
also cannot close the gap: the residual does not prove that an entire live
slice is contained in the required strict cap with the blocker outside it.

Accordingly, the requested wiring to
`false_of_b1PhysicalClassFiveSixNormalForm_of_escapeSource_and_goodCanonicalEndpointCardArc`
is deferred pending this stronger order/incidence input.

## Source provenance

The audited producer/consumer module is
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1WinningSliceOrderOutcome.lean`,
2689 lines, SHA-256
`d6853a3439c5168f99b7d8e60b708a4fb4b4801d11ce82a2b2569f9ae3c68d97`.
This lane made no source edit and generated no runtime tree.
