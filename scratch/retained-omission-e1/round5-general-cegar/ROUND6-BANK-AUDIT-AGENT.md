# Round-6 theorem-bank and FreshThird residual audit

Date: 2026-08-03.  Read-only audit; no Lean files changed.

## Registry coverage

I rechecked the six required registry groups (the prose bank plus the three
`.md`/`.json` census pairs):

* `docs/general-n-certificate-bank-mining-2026-07-09.md`
* `certificates/p97_rvol_general_n_mining.{md,json}`
* `certificates/erdos97_legacy_general_n_mining.{md,json}`
* `certificates/erdos_general_theorem_p97_mining.{md,json}`

An exhaustive recursive scan of the three JSON objects (2,148, 285, and 297
candidate declarations) found zero values matching `FreshThird`,
`firstNonHit`, `secondNonHit`, equal-center, exact-four, endpoint omission,
`sourceRowOmission`, `sameBlocker`, or `collisionFiveCenter`.  The prose files
have no matching packet terms; the only `exact four` hit is the unrelated
`(m,4,4)` equilateral-frame note at line 606.  Thus no registry declaration,
source path, or `source_reachable` record can consume this residual.

## Indexed Lean corpus

The focused query

```text
nthdegree docs search --lean "FreshThirdEqualCenterExactFourRow_of_hits allCollisionEndpointsOmitted_of_equalCenterHits false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual"
```

returns only the two local producers and the unresolved residual target.  A
broader search returns the following nearby declarations:

* `allCollisionEndpointsOmitted_of_equalCenterHits` and
  `freshThirdEqualCenterExactFourRow_of_hits` — source-clean producers (once
  the current source is rebuilt), not contradictions;
* `false_of_twoCapSources_sameBlockerAllEndpointOmission` and
  `false_of_capSource_firstFiber_collisionFiveCenterDeletion` — first-fiber
  terminals requiring `FreshOutsideFirstBlockerFiber`, complete
  `FirstFiberCapSourceWitness` data, shared radius/cap-interior data, mutual
  cross-membership, and exact shell∩cap equality; these hypotheses are absent
  from the normalized FreshThird arm;
* `collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted` — a deletion
  producer for that same first-fiber packet, not a FreshThird adapter;
* `false_of_freshCanonicalRowOverride` — compatibility-only and requires a
  `FirstFiberCapSourceWitness`; the module explicitly says the live coordinator
  no longer uses it.

`nonHit_of_not_crossRowHit` only converts a failed hit into
`sameBlocker`/`sourceRowOmission`; no indexed theorem consumes either
constructor to `False`.  The only direct contradiction consumer for the
normalized residual is
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`, whose
body remains `by sorry` (current source around lines 10767--10775).

## Probe trust boundary and verdict

`artifacts-n17-generic/equal-center-endpoint-omission/result.json` is SAT for a
bounded N17 Boolean/metric profile (`external_solver_only`, no coordinates or
Lean kernel); `result-cyclic.json` is UNKNOWN.  Neither closes the theorem.

**NO-GO:** the global bank search is complete, and no source-faithful,
source-clean theorem/consumer currently closes `firstNonHit`, `secondNonHit`,
or `equalCrossRowCenters`.  The equal-center producers are useful inputs for a
future adapter, but exact-four support plus all-endpoint omission does not
construct the first-fiber terminal's missing data.
