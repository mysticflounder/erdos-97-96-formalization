# Schema-7 FreshThird theorem-bank audit

Date: 2026-08-06.  Scope is the 16 files `schema-v7-*.json`, the round
summary, the four theorem-bank registries named by `AGENTS.md`, and the live
FreshThird/Kalmanson modules.  No production Lean or probe files were changed.

## Evidence and trust boundary

The round has 16/16 SAT artifacts at `n = 17` (two endpoint maps, four order
arms, and canonical/other deletion queries), with no timeout or `unknown`.
Every artifact has schema version 7, `live-equal-common-dual` scope,
`cap_profile = [6,8,6]`, the dynamic deletion query, the cap-class `<= 2`
bound, the four-point equal-center support clause, and one selected support of
cardinality four for each deletion.  This is bounded solver evidence only: it
does not establish Euclidean realizability, arbitrary-cardinality lifting, or
a Lean contradiction.

The required bank scan (`docs/general-n-certificate-bank-mining-2026-07-09.md`
and the three `certificates/erdos*`/`p97_rvol*` registries) found no
FreshThird, normalized-residual, first/second-non-hit, equal-center, or
surviving-row declaration.  The single permitted `nthdegree docs search
--agentic` query produced no usable output (`scratch/schema-v7-agentic-search.txt`
is empty); local source tracing below is therefore the operative evidence.

## Does an existing theorem consume every survivor?

No source-clean consumer consumes the schema-7 survivors.

* `TwoSourceFreshThirdFiber.lean:351-424`,
  `false_of_freshThird_orderSelectedEndpointDeletionObstructions`, is checked
  and lands in `CapCrossingKalmansonBridge.false_of_freshThird_four_order_arms`.
  Its input is one of four **both-deletions-blocked** obstruction packets.  A
  schema-7 artifact instead has a surviving row for the queried deletion, so
  this consumer cannot apply.
* `CapCrossingKalmanson.lean:427-454`,
  `false_of_two_selected_rows_shared_late_pair`, is the exact strict-Kalmanson
  consumer for two selected rows `ARow`/`BRow` and two later boundary points in
  both supports.  Schema 7 records only a single selected survivor and cap
  composition; it supplies neither the second row nor those four memberships.
* `TwoSourceFreshThirdResidual.lean:529-538`,
  `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`, has the
  right residual shape but its proof is still `sorry`.  The wrappers at
  `:818+` transitively depend on it, so they are not a source-clean closure.
* The existing source-clean producers
  `freshThird_canonicalDifferentCap_endpointPlacement`
  (`TwoSourceCanonicalSurface.lean:1500+`),
  `freshThird_canonicalDifferentCap_fivePointKalmansonOrder`
  (`:1830+`), and
  `freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow`
  (`TwoSourceFreshThirdFiber.lean:2826+`) provide endpoint/order data and a
  cap-split surviving row, not a contradiction.

Thus the status is **diagnostic/producers and an unfilled consumer bridge, not
closure**.  This agrees with the live closure-plan correction: the missing
bridge is positive incidence, not cyclic order
(`docs/computational-closure-plan-2026-07-28.md:3471-3485`).

## Forced versus accidental survivor structure

Forced in all 16 artifacts:

* both `canonical_deletion_survives` and `other_endpoint_deletion_survives`;
* selected support card exactly four;
* equal source-row centers and exact named-four support for the two C rows;
* one of the four source-proved five-point order arms, dynamic endpoint
  deletion, and the selected-endpoint cap-class bound;
* the deleted point is avoided by the selected row.

Frequent but not universal:

* the canonical- and other-deletion selected supports are identical in 14/16
  artifacts (the two q2 arm-3/arm-4 cases differ);
* full radius class has card four in 15/16 cases; one q2 arm-4 case has cards
  seven (canonical query) and six (other query);
* the canonical source, selected endpoint, and `c_source_1` are absent from
  every selected support.  Both collision-source points are absent in 13/16
  row records; `c_source_2`, source-center, and fresh-center memberships occur
  only in a few records and are not invariant.

Accidental witness choices include all concrete four-point labels (the 16
support sets are not one common set), q1/q2 endpoint naming, radius anchors,
and cap-count vectors.  They must not be promoted as a universal theorem.

## Weakest plausible uniform producer/lift

The minimal source-level strengthening is a **shared-late-pair incidence
producer** for the order-selected surviving row.  Starting from the live
`FreshThirdAcyclicCanonicalConsumerPacket`, the canonical-different-cap
five-point order, and the row produced by
`freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow`,
prove an incidence packet yielding a second selected row `BRow` and indices
`ia < ib < ic < id` such that `boundary ic` and `boundary id` lie in both
`ARow.support` and `BRow.support`.  This is exactly the hypothesis shape of
`false_of_two_selected_rows_shared_late_pair`; the first missing bridge is the
universal second-row construction plus the two shared-late memberships (and
index conversion), not another order lemma.

An alternative `firstNonHit`/`secondNonHit` route would require a separate
source-clean cap-wide same-cap alignment producer, which schema 7 does not
encode.  A clause saying merely “a survivor contains a collision source” is
not source-entitled and is empirically false for most row records.

## Schema-8 recommendation

Schema 8 should test a new clause only if it is accompanied by (or explicitly
labelled as awaiting) the source-level producer above.  The exact consumer
matching clause is the dynamic shared-late-pair disjunction: for every
order-selected survivor `A`, there is a second named row `B` and an ordered
quadruple `ia < ib < ic < id` with

```text
boundary(ic), boundary(id) ∈ A.support ∩ B.support.
```

In a finite encoder this may be represented as the disjunction over dynamic
row/point selectors, but it must not be hard-coded to the accidental labels
seen in the 16 SAT witnesses.  Until Lean proves that producer, a schema-8
run is a hypothesis probe, not a closure claim.

