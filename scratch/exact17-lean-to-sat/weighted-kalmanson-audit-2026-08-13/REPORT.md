# Weighted-Kalmanson exact-17 audit (2026-08-13)

## Verdict

**BLOCK / REJECT for source-valid promotion.**  The historical replay is a
useful Python discovery replay, but it is not an authenticated exact-17
source certificate.  In particular, it hard-codes named order 0 while the
authenticated current Child43/44 SAT source selects named order 1.  The
historical 483/609 counts must not be used to add clauses or claim a
`SourceRealization` contradiction until they are recomputed with a pinned
source/order and a Lean-side positive-row bridge.

## What is actually authenticated

`scratch/rigid221-blockerv-exact17-20260806/weighted-kalmanson-consumer-replay.json`
reports `status=complete`, `records=matched=483`, and records these input
bytes/SHA-256 values:

| input | bytes | SHA-256 |
|---|---:|---|
| `unmatched-linear-classification.json` | 314,779 | `2655142a34a44fbcb826acf34273e6604e7c4c477f501f73af1cf78a0001309f` |
| `tracked-supports-minboth-all.json` | 5,310,088 | `34d9e45ac612b5c8b4e7312774c2c5b07e71899b2f5090f11600009cf3a87303` |

It also snapshots each referenced journal and includes canonical hashes for
each selected record/support.  The Python producer and generic Lean source
are recorded as `producer_bank.py` SHA
`faba6bb029067e19f3f5d3cb26b14139d2c01dc933f0c525be65bb76d1081002` and
`GenericRowNogoodCertificate.lean` SHA
`7abfcb6e3d0982dc504a29b3771cb634873d995724fd8c87f4811e412b39e84d`.

These are run-output observations, not trust anchors.  The replay never
records or checks the requested current SourceRealization source pin
`763bb4774a4d148ca35a4d33ecce06c158a8f941c3e5fb272f534cb2b9637527`, a
source-module revision, the selected named-order index, or a source-model
identity.

The two source input ledgers explicitly classify themselves as discovery
evidence: `unmatched-linear-classification.json` says “not Lean proof or
exact-17 coverage” and has 483 `pure_kalmanson`/positive-rational records;
`tracked-supports-minboth-all.json` has 609 `unsat` QF_LRA records and says
“not a Lean proof.”  The 609 records are not 609 weighted certificates.

## Order and source-semantics defect

The replay constant at
`replay_weighted_kalmanson_consumer.py:26` is

```text
[0,6,8,11,10,9,12,7,2,15,16,3,4,5,1,13,14]
```

The current source normal form has two legitimate named orders, but its order
1 table is `…10,12,9,7…` (`BlockerVExactSeventeenSourceNormalForm.lean:67-113`).
The authenticated current Child43 replay pins `order_index = 1` and the
order-1 list `…10,12,9,7…` (`scratch/exact17-lean-to-sat/child43-wave-mine/replay_and_mine.py:37-40, 282-285`).
Its analysis also records the same selected order in `selected_order`.

Thus order 0 is not intrinsically an invalid source order; it is a valid
alternative in the Lean table.  The defect is that the historical weighted
run unconditionally uses order 0 and has no order-index/source-model binding.
All 483 output certificates carry the order-0 boundary labels; none can be
identified with the current authenticated order-1 source realization.  This
is the status of the old order bug: **unreconciled in the weighted lane**,
even though later Child43/44 miners pin order 1.

## Replay/encoding weaknesses

The replay invokes only the Python checker
`producer_bank.certify_weighted_kalmanson_cancellation` at lines 137-146;
it does not construct a Lean `WeightedKalmansonCancellationData`, prove its
`check`, or instantiate the theorem with a source realization.

There are also fail-closed gaps in the historical script:

* `snapshot_journal` (`:46-64`) stops at the first malformed JSONL line,
  accepts duplicate iteration keys with last-write-wins, and does not require
  complete parsing or a unique expected record.
* The support map (`:97-100`) likewise silently overwrites duplicate
  `(journal, iteration)` keys.  Paths and iteration values are not validated
  against an authenticated manifest.
* `bool(row.get("exact", False))` (`:137-143`) accepts strings and numbers as
  Boolean row flags and treats a missing field as false.  Row cardinality,
  distinctness, center exclusion, and exact schema/version are not enforced
  here.
* The classification/support JSON is parsed without duplicate-key rejection,
  schema/version validation, or a same-byte post-read check.  Journals are
  read separately and are not re-hashed after all certificates are produced.
* `:189` writes the output directly, with no no-overwrite/atomic publication
  or ledger-last record.  The output's self-reported source hashes therefore
  do not authenticate the inputs used by a later consumer.

## Existing Lean consumer and bridge

The generic consumer is real and cardinality-independent:
`GenericRowNogoodCertificate.false_of_weightedKalmansonCancellationData_of_check`
(`GenericRowNogoodCertificate.lean:720-754`).  Its checked data requires a
nonempty list of positive terms, both pairing permutations, and a checked
positive-row path (`:621-665`); its contradiction additionally requires
`ConvexIndep`, boundary image/CCW facts, `Realizes P boundary`, and
`PositiveRowsMatch P choices` (`:721-730`).

There is an exact-17 adapter in
`BlockerVExactSeventeenWeightedKalmansonSourceBridge.lean:39-88`, including
`WeightedSourceOccurrence` and
`sourceAssign_weightedOccurrenceClause`.  It intentionally leaves
`hpositive : PositiveRowsMatch ... occurrence.choices` explicit.  No concrete
weighted occurrence, weighted clause bank, or exact-17 theorem-bank
instantiation was found: the only `WeightedSourceOccurrence` declarations are
the generic adapter itself.  The older finite theorem in
`KalmansonFourEqualitySchemas.lean:2251-2300` is not a weighted source clause
bank.

Therefore the **first missing bridge** is an occurrence-specific,
source-faithful construction of the weighted `choices`/`data` from the current
`SourceRealization` (including order-1 reindexing), with a proved
`PositiveRowsMatch` antecedent and a checked `WeightedSourceOccurrence`; only
then can `sourceAssign_weightedOccurrenceClause` feed a Lean CNF bank.

## Minimal safe repair before mining Child43/44 survivors

1. Replace the unconditional order constant with an authenticated source
   manifest containing source SHA `763bb...`, `NamedOrder` index, orientation,
   exact canonical label permutation, and selected-order binding; reject order
   drift.  Recompute the 483 candidates under order 1 (and separately label
   any order-0 results) rather than relabeling old output.
2. Give classification, supports, and journals strict versioned schemas;
   reject duplicate keys/iterations, malformed or trailing JSONL, missing or
   non-Boolean `exact`, invalid row domains/cardinalities, duplicate supports,
   and unpinned paths.  Hash every input before and after replay.
3. Publish atomically/no-overwrite with an authenticated manifest and
   ledger-last receipt binding all input hashes, source hashes, order,
   producer revision, and output hash.
4. For each retained survivor, independently construct Lean weighted data,
   prove `data.check = true` and `PositiveRowsMatch` from the current source
   realization, and emit only the resulting source-checked clause.  Keep the
   old 483/609 artifacts labeled empirical discovery until that gate passes.

