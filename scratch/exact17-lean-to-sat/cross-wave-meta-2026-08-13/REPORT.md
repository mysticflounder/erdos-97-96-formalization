# Exact-17 cross-wave meta-analysis: Child33--Child44

Status: `PASS_WITH_EXPLICIT_GAPS`.  [`analyze.py`](analyze.py) is an
artifact-only, reproducible analyzer: it reads JSON/Lean-bank metadata, never
opens DIMACS, runs a solver, or builds Lean.  Its output is
[`cross-wave-meta.json`](cross-wave-meta.json).

## Scope and authentication

The normalized occurrence tables contain independently authenticated SAT mines
from Child39--Child43.  Earlier durable artifacts are retained with their
known limitations.  Child44 is represented only as a source-checked Lean
promotion of Child43 and is not counted as a second SAT assignment.

| wave | durable mine input | result / mine count |
|---|---|---|
| 33 | `child33-postwave-inventory-candidates-v2-2026-08-13.json` | 5 diagnostic, core-only |
| 34 | `child34-wave-mine/child34-wave-mine.json` | 6 core-only records |
| 35 | `child35-wave-mine/child35-wave-mine.json` | 6 core-only records |
| 36 | `child36-wave-mine-summary.json` | 2 new + 5 locally lost, core-only |
| 37 | no durable mine report | authenticated custody, mine missing (not zero) |
| 38 | `child38-wave-mine/child38-cancellation-bank-ledger.json` | 28 bank entries / 112 clauses; hit indices only |
| 39 | `child39-wave-mine/child39-analysis.json` | 49 source-valid occurrences |
| 40 | `child40-wave-mine/child40-analysis.json` | 84 source-valid occurrences |
| 41 | `child41-wave-mine/child41-analysis.json` | 133 source-valid occurrences |
| 42 | `child42-wave-mine/child42-analysis.json` | 35 source-valid occurrences |
| 43 | `child43-wave-mine/child43-analysis.json` | 57 source-valid occurrences |
| 44 | `BlockerVExactSeventeenFortyThirdModelRefinements.lean` | promotion only: 57 supports / 228 clauses |

For Child41/42/43, the analyzer checks `status=PASS`, custody final
`result=SAT`, custody model SHA = analysis provenance model SHA, and
`independent_replay.satisfies_all=true`.  The authenticated mine inputs have
these hashes:

* Child41 CNF `fc19386fdd9703f5313e1bf49b164d87c5905c56c727cfea6408dc7d01e78d24`;
  model `cf1cb831223700ebc376a50048260fc280a32aed7c91723c262b8a1274b5896a`.
* Child42 CNF `375b7bc42381175119545627ab55c6bacb285fa35e4486f0b11193300620921f`;
  model `9df868b2160c2e3b1f37cee35212c4cc405f63b3ad2f8671eacd2b6b52419bad`.
* Child43 CNF `dbfbd84473cfe86a0e596322c0c0af8a077fc830ab5a9976c5efa7ea80a96c76`;
  model `5a68926a32d5406ffdea187dc4e4c18330799160a4e8596fc463fcc3160530ce`.

Independent replay checked respectively 5,847,920, 5,848,452, and 5,848,592
clauses over 308 variables, with all clauses satisfied.  The durable mine JSON
hashes are Child41 `f1861dff33d8412e0bd8b4bfec311c7aa0c7d35b088126a0dfc69edd21e6d354`,
Child42 `1a93c64bd9b5cbe6d0431b3fd801dba57c515cf1e2423894132dd4d052635c68`,
and Child43 `c3ed03bc91979563804328675784be47dab81271daf7eeb7c6d5f07e59cd156e`.

## Structural normalization and counts

For every explicit source support, labels are first mapped to its recorded
named order and canonicalized under cyclic rotations and reversal, retaining
center/point roles.  In addition, the analyzer computes a label-independent,
role-preserving incidence WL fingerprint: this is an isomorphism invariant,
not a complete graph-isomorphism decision procedure.  Thus raw labels are not
used for structural recurrence, while cyclic order remains available for the
order-sensitive theorem consumer.

The combined source-valid table has 358 occurrences, 345 distinct raw supports,
355 cyclic structural classes, and 29 incidence fingerprints.  There are no
repeated cyclic structural supports across waves (three duplicate classes are
within Child39 only), but 10 incidence fingerprints recur across waves.  The
recurring fingerprints are empirical shape recurrence, not theorem recurrence;
the largest are size-6 (110 occurrences) and size-8 (40), with size-10 (48)
also present in every mined wave.  The exact source-valid size histograms are:

```
Child39 {4:1, 6:33, 8:8, 10:7}
Child40 {6:11, 8:8, 10:9, 11:1, 12:22, 14:14, 16:8, 17:2, 18:7, 20:2}
Child41 {6:19, 8:9, 10:12, 12:21, 13:2, 14:31, 16:20, 17:1, 18:10, 19:3, 20:3, 22:2}
Child42 {6:18, 8:5, 10:9, 12:1, 14:1, 16:1}
Child43 {6:29, 8:10, 10:11, 12:4, 14:3}
```

All 358 source-valid occurrences are instances of the already source-checked
`equality-convex-two-kalmanson-cancellation` producer family and feed the
existing `GenericRowNogoodCertificate.false_of_twoKalmansonCancellationData_of_check`
consumer.  No mined occurrence supplied a new general producer theorem.

## Recurrence, disappearance, and coverage

The source-valid family appears in every independently mined wave 39--43, but
support-level recurrence is not evidence that one support is unavoidable.  The
earlier two-circle-bisector, convex-five, perpendicular-bisector, and related
diagnostics remain diagnostic-only where their support labels are absent or no
`SourceRealization` bridge is present.  Child36's `lost_records` are only local
post-clause disappearance.  Child37 has no durable mine, and Child38 has only
hit-index pairs; neither may be treated as zero or normalized labelled support.

Across the 358 source records, 135 distinct center/point incidences occur in
the union of supports.  The most frequent incidences are concentrated in the
model's selected rows, but this is a finite empirical coverage statistic, not a
universal hitting result.  The analyzer therefore records:

`NO_PROOF: finite observed supports do not establish a universal SourceRealization hitting theorem`.

The strongest concrete uniform theorem candidate remains the conjectural
coverage statement that every admissible exact-17 `SourceRealization` contains
at least one checked two-Kalmanson cancellation occurrence (and hence can use
the existing generic consumer).  Current source hypotheses prove the local
producer clauses once the selected occurrence's finite row/equality/order
antecedents are supplied; they do not prove the global “some occurrence exists”
antecedent.  No finite motif list extracted here changes that gap.

## Fail-closed conclusion

The latest cumulative CNF carries prior clauses, but not prior SAT assignments,
raw supports, diagnostic scans, normalized identities, frequencies, or failed
candidate records.  Child44 carries a Lean bank, not a new model.  Consequently
this refresh adds Child41--43 evidence and the Child44 promotion distinction,
but does not claim exact-17 closure, UNSAT, or an on-spine proof.  Missing
Child37 mining and core/index-only Child33--38 artifacts remain explicit gaps.

Analyzer SHA256: `cacea024cae72f23215ea92c0336aa776de8e5924afb883bec483924c4b17ca2`.
