# Round7 post-round global theorem-bank audit

Date: 2026-08-03

## Scope and provenance

The bounded indexed search was:

```text
nthdegree docs search --lean "FreshThird normalized residual triple-center multiplicity cut" --current-project
```

It returned no direct `FreshThird`/triple-center residual declaration.  The
non-FreshThird hits were generic Hesse/`IsCut`/multiplicity results and the
unrelated P4 Kalmanson declaration
`schema5ForwardCutSat_mirror` in
`lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/Unique4P4PrefixedClosures/P4OccurrenceClosure/Kalmanson/KalmansonCore.lean:177`.
That Kalmanson module is not imported by `FrontierLiveClosure.lean`.

The three local theorem-bank JSON registries contain no `FreshThird` names.
The P97 RVOL registry does contain the following source-proved candidates:

| declaration | registry path | current import reachability | interface fit |
|---|---|---|---|
| `Problem97.eq_of_equidistant_three_noncollinear` | `lean/RVOL/P97/U5GlobalIncidenceBasic.lean:129` | yes, transitively through `ATail/CommonDeletionTwoCenter` → `U5GlobalIncidenceSupport` | only two centers sharing one non-collinear triple |
| `Problem97.U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility` | `lean/RVOL/P97/U5GlobalIncidenceKernels.lean:377` | no (`U5GlobalIncidenceKernels` is not on the Frontier import graph) | U5 dangerous-triple/class payload, not FreshThird |
| `Problem97.U5QCriticalTripleClass.two_triple_centers_third_common_incompatibility` | `lean/RVOL/P97/U5GlobalIncidenceKernels.lean:421` | no | U5 dangerous-triple/class payload, not FreshThird |

The current-tree equivalents are
`lean/Erdos9796Proof/P97/U5GlobalIncidenceBasic.lean:129` and
`U5GlobalIncidenceKernels.lean:376,420`.  No adapter converts those U5
payloads to `FreshThirdBlockerFiber` or
`FreshThirdNormalizedResidualRemainingCase`.

The existing source-clean FreshThird consumer
`false_of_two_freshThirdCrossRowHits_distinctCenters`
(`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:10994-11002`),
dispatched by `false_of_hasDistinctCrossRows` (`:11307-11317`), already closes
the distinct-center arm.  The remaining normalized leaf
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
starts at `:11323` and remains open.

## Round7 smoke status

The available artifact is:

```text
artifacts/20260803T115038.828163Z-caplocal-pid20999/
  fresh_DDD_k0_d1_f2/result.json
```

`result.json:4-23` records one finite Z3 4.16.0 case (`arm=fresh`,
`profiles=DDD`, `deleted=1`, `fresh=2`, `kept=0`) with status `unsat`, targeting
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.
The per-case record says `schema_version: 6` (`:14`), while the wrapper summary
reports `schema_version: 7`, `case_count: 1`, and `statuses.unsat: 1`
(`summary.json:4-5,35-40`).  Thus this is provenance-fixed wrapper metadata
over a reused v6 per-case record, not a new Lean certificate.

The v7 script adds finite Boolean constraints for every triple of frozen
carrier points (`run_full_multiplicity_triple_center.py:39-52`), but does not
quantify over or construct FreshThird residual data.  Consequently this single
external smoke `UNSAT` does not generalize to the FreshThird normalized residual,
general cardinality, or kernel-checked Lean closure.

## Provenance correction

The artifact above is the earlier run and remains in the audit trail as
evidence of the worker-metadata bug.  After moving the v6 overrides to wrapper
import time, a fresh run at
`artifacts-v7-provenance-fixed/20260803T115803.415989Z-caplocal-pid51077/`
reports schema 7 and the v7 script hash in `source_authentication.json`, the
per-case `result.json`, and `summary.json`.  Its status is again one finite
external Z3 `unsat` case with the same non-promotional scope; this correction
does not change the theorem-bank or closure conclusions above.
