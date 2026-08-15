# FreshThird schema-v6 theorem-bank audit

Date: 2026-08-06. Read-only audit of the four `schema-v6-*survives.json`
artifacts (`n = 17`, `(6,8,6)` cap profile). The exact live consumer being
audited is
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`.

## Survivor motifs (empirical only)

All four queries are `SAT`; both the canonical-source deletion and the other
endpoint deletion survive in every model. Repeated features are:

* `canonical_source = q2`, `c_source_1 = q2`, `c_source_2 = q1`, and
  cap profile `(6,8,6)` in all four models.
* The source-order mapping is always `q1-outside`; arms 2 (selected `q1`) and
  1 (selected `q2`) both occur. Thus endpoint selection is not the issue.
* The surviving deleted rows are exact four-point supports in three cases,
  with full radius-class cards `4,4,4`; one `q1/other-survives` model has a
  full class of card `9` while only a four-point support is selected.
* In the exact-four cases the same row can survive both deletions (e.g.
  `{a1,p1,q1,s3}` or `{t2,p1,p2,a3}`), so deletion survival is not removed by
  the existing cap-localization and endpoint clauses. In the q2/canonical
  model, the two deletion rows differ (`{p1,p2,s1,s4}` versus
  `{t4,q1,q2,s3}`), showing that canonical support equality is not forced.

These are bounded external Z3 incidence/radius-partition witnesses only:
cyclic order, Euclidean realizability, arbitrary-cardinality lifting, and Lean
ingress are absent. They are therefore empirical diagnostics, not producers.

## First missing source bridge

The first missing constraint for the recurring equal-center/noncanonical
survivors is a **branch-preserving strict cyclic boundary order** (an explicit
`ConvexCyclicOrder`/increasing boundary quadruple for the two selected rows and
the two shared Q points), together with the row-to-boundary-index conversion.
Schema-v6 records source-order arm labels but deliberately does not re-encode
the geometric cyclic order. Cap-interior membership and exact support overlap
do not imply this order. Without it, the Kalmanson row consumer cannot fire.

For the `firstNonHit`/`secondNonHit` residual constructors, the analogous
first missing producer is a cap-wide same-cap alignment/two-hit fibre; no such
positive alignment is present in the packet or the four models.

## Bank/corpus check and candidate mapping

The required registries were inspected first. Recursive string scans of
`p97_rvol_general_n_mining.json`, `erdos97_legacy_general_n_mining.json`, and
`erdos_general_theorem_p97_mining.json` found no `FreshThird`, residual,
equal-center, endpoint-omission, `sourceRowOmission`, or `twoCapSources`
declaration. The prose bank has no matching FreshThird packet. One
`nthdegree docs search --lean --agentic` query for the normalized residual and
FreshThird blocker fibre returned no additional indexed candidate.

Candidates and their status relative to the exact consumer above:

* `freshThirdEqualCenterExactFourRow_of_hits` (source-clean producer) gives
  exact support `{C.firstSource,C.secondSource,Q.source₁,Q.source₂}`; it does
  not prove `False`.
* `allCollisionEndpointsOmitted_of_equalCenterHits` (source-clean producer)
  derives omission of the retained collision endpoints from that exact row;
  it likewise does not close the consumer and is not a boundary-order adapter.
* `selectedSupports_inter_eq_sources_of_mutualCrossMembership_distinctBlockers`
  (source-clean incidence lemma) proves support intersection equals the two
  source points under distinct blockers; it is only a producer.
* `CapCrossingKalmanson.false_of_two_selected_rows_shared_late_pair` is a
  source-proved contradiction consumer that would map to the target, but it
  requires `ConvexIndep`, injective/image/CCW boundary data, and four strict
  indices. No indexed theorem or required bank supplies the FreshThird adapter
  deriving those hypotheses.
* `Problem97.selectedFourClass_shared_pair_separated` can prove alternation
  after a boundary/index adapter, but is unimported here and is not itself a
  contradiction. The stronger first-fibre terminal
  `false_of_twoCapSources_sameBlockerAllEndpointOmission` requires a strictly
  stronger `FreshOutsideFirstBlockerFiber` packet and cannot consume generic
  FreshThird data.

**Verdict:** no existing theorem-bank declaration provides the first missing
source bridge or closes
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`. The
survivors identify a new geometric/order producer (and, for non-hit arms, a
cap-wide alignment producer) as the next proof obligation.

## Post-audit source correction

A direct trace of `TwoSourceCanonicalSurface.lean` after this bank audit found
that the cyclic-order ingress is already substantially complete in production:
`freshThird_canonicalDifferentCap_boundary`,
`freshThird_canonicalDifferentCap_endpointPlacement`,
`freshThird_canonicalDifferentCap_sourceSupportPlacement`, and
`freshThird_canonicalDifferentCap_fivePointKalmansonOrder` provide the boundary
indexing and the exact cardinality-free five-point order for the
canonical-different-cap constructor.  The report's claim that the order
adapter itself is absent is therefore stale for that branch.

The corrected first missing bridge is downstream **positive row incidence**:
the order-selected surviving row currently records only a selected four-class
avoiding one deletion, its center cap, and a `≤ 2`/`≥ 2` cap split.  It does not
identify two later boundary witnesses shared with a known row, so
`false_of_two_selected_rows_shared_late_pair` still cannot consume it.  The
next computation should add the Kalmanson exclusions entitled by the existing
five-point order and census which survivor-row incidences remain; it must not
postulate the missing memberships.
