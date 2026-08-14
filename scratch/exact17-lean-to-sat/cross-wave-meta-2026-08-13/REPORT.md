# Exact-17 Child33--Child40 normalized wave meta-analysis

Status: `PASS_WITH_EXPLICIT_GAPS`.  The reproducible analyzer is
[`analyze.py`](analyze.py); its complete normalized data is
[`cross-wave-meta.json`](cross-wave-meta.json).  It reads only durable
artifacts and performs no DIMACS, solver, or Lean operation.

## Authentication and coverage

All Child33--Child40 custody model/final pairs are present and each final says
`SAT`; the analyzer checks the custody model SHA against the final.  Reports
whose own provenance carries a model SHA are checked against that custody SHA.
The principal inputs are:

| wave | authenticated mine input | durable result |
|---|---|---|
| 33 | `child33-postwave-inventory-candidates-v2-2026-08-13.json` | 5 replay-complete diagnostic candidates; core-only |
| 34 | `child34-wave-mine/child34-wave-mine.json` | 6 records; core-only |
| 35 | `child35-wave-mine/child35-wave-mine.json` | 6 records; core-only |
| 36 | `child36-wave-mine-summary.json` | 2 new and 5 lost records; core-only summary |
| 37 | no wave-mine report | custody exists, but mining data is missing (not zero) |
| 38 | `child38-wave-mine/child38-cancellation-bank-ledger.json` | 28 bank entries, 112 clauses; hit-index pairs, not raw supports |
| 39 | `child39-wave-mine/child39-analysis.json` | replay PASS; 49 explicit source-valid supports, 2 diagnostic records |
| 40 | `child40-wave-mine/child40-analysis.json` | replay PASS; 84 explicit source-valid supports, 8 formalized scans |

The custody lineage is independently evidenced by the per-wave
`piqd-childNN-core1-custody-{model,final}.json` files.  Child39 replay checks
5,847,388 clauses; Child40 replay checks 5,847,584 clauses.  Child41 is not in
scope and was not mined.

## Normalization and recurrence

For each explicit `(center, point)` support, the analyzer maps labels to the
recorded named order and takes the lexicographically least representative over
all cyclic rotations and cyclic reversals.  Center/point roles remain
distinct.  This produces 133 explicit producer occurrences and 130 normalized
support classes.  There are three duplicate normalized classes, all twice
within Child39; there are **zero cross-wave recurring normalized supports**.
The explicit supports are all forward-oriented producer records (133 forward,
0 reverse); Child38's reflected hit indices cannot be counted as labelled
reverse supports.

Minimal-support sizes are:

* Child39: 49 total — `{4: 1, 6: 33, 8: 8, 10: 7}` across its two orders.
* Child40: 84 total — `{6: 11, 8: 8, 10: 9, 11: 1, 12: 22, 14: 14,
  16: 8, 17: 2, 18: 7, 20: 2}`.

The explicit-support records are all the existing
`equality-convex-two-kalmanson-cancellation` family.  Its first available
occurrence is Child39 at raw-support resolution (earlier waves have only
core-level records); its last is Child40.  Two-circle-bisector, convex-five,
and perpendicular-bisector families recur in the available Child33--Child36
and Child39--Child40 diagnostic/core-only records, but no source-labelled
support is available for them here.

## Disappearance and failed candidates

Child36 records five Child35 records as `lost_records` and two new records;
this is a local post-clause disappearance, not a claim of global absence.
Child37's missing mine and Child38's index-only ledger prevent stronger
disappearance claims.  The report retains rather than suppresses these gaps.

Unpromoted/diagnostic material is preserved separately: Child33 has five
diagnostic candidates (one each from convex-five, two-circle forward/reverse,
two-Kalmanson, and perpendicular-bisector); Child39 has two diagnostic-only
two-circle records; Child40 has eight formalized scans (including convex-five,
two-circle, perpendicular-bisector, exact-off-circle, and duplicate-center).
These are not counted as source-valid support occurrences.

Conclusion: the only normalized support-level recurrence analysis possible from
authenticated durable data finds no cross-wave repeated support and no new
uniform producer beyond the already-banked two-Kalmanson family.  A future
retrospective using recovered Child34--Child38 raw producer records could
change the support-level result; this report does not invent those missing
inputs.
