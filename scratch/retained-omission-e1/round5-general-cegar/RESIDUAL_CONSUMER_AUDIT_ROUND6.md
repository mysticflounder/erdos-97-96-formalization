# Fresh-third normalized residual consumer audit (round 6)

Date: 2026-08-02
Scope: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`

## Verdict

The normalized split is source-clean bookkeeping, but only the distinct-center
arm currently has a source-clean contradiction consumer.  Both non-hit arms
and the equal-center arm still require a new bridge into a terminal theorem;
the latter does have a useful, source-clean all-endpoint-omission producer.

## (a) `firstNonHit` / `secondNonHit`

`FreshThirdCapSourceNonHit` (lines 9151--9170) has exactly two positive
constructors: `sameBlocker` (center and selected-support equality with
`Q.source₁`) and `sourceRowOmission` (one fresh source is omitted from the
source row while deletion preserves `HasNEquidistantPointsAt 4`).
`nonHit_of_not_crossRowHit` (9179--9196) only normalizes an interaction; it
does not derive `False` or invoke a residual consumer.  A search of the ATail
sources found no theorem consuming `FreshThirdCapSourceNonHit`,
`.sameBlocker`, or `.sourceRowOmission` into a contradiction.  The omission
survival fact can feed generic blocker-distinctness helpers, but no terminal
that closes either normalized non-hit arm.

The constructor split (`firstNonHit` / `secondNonHit`) at 9203--9209 and its
normalizer at 9221--9242 therefore leave both branches unresolved.

## (b) `equalCrossRowCenters`

This arm is source-clean through the following chain:

* `freshThirdEqualCenterExactFourRow_of_hits` (9269--9277) proves both rows
  have the exact support `{C.firstSource, C.secondSource, Q.source₁, Q.source₂}`.
* `allCollisionEndpointsOmitted_of_equalCenterHits` (9436--9444) derives
  `AllCollisionEndpointsOmitted P Pρ C.firstSource C.secondSource`, using the
  exact-four support and freshness of `Q`.  Direct import/check after compiling
  the module reports only `[propext, Classical.choice, Quot.sound]` (no
  `sorryAx`).

There is no direct source-clean consumer from this FreshThird packet to
`False`.  The nearby deletion producer (9824--9845) and terminal
`false_of_twoCapSources_sameBlockerAllEndpointOmission` (11171--11224) are
first-fiber theorems requiring `FreshOutsideFirstBlockerFiber`, complete
`FirstFiberCapSourceWitness` data, mutual cross-membership, a common blocker,
cap-interior membership, and exact shell∩cap equality.  The FreshThird theorem
supplies `FreshThirdBlockerFiber` and exact-four/all-omission data, but no
source-clean adapter to that first-fiber packet was found; exact-four support
alone also does not provide the terminal's shell∩cap equality and other
hypotheses.

## Frontier status

`false_of_two_freshThirdCrossRowHits_distinctCenters` (9788--9798) closes the
distinct-center arm source-clean.  The load-bearing target
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`
(9806--9815) remains `sorry`: `firstNonHit`, `secondNonHit`, and
`equalCrossRowCenters` all still reach that unresolved leaf.  The equal-center
all-endpoint theorem is a reusable producer, not closure.
