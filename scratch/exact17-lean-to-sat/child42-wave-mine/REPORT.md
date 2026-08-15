# Child42 exact-17 wave-only theorem mine

Status: **PASS / independent SAT replay**.  This mine is restricted to the
finalized Child42 custody model and compares only against the established
Child38--Child41 producer bank.

## Authentication and replay

- Job: `283f5c21-de62-4318-8a11-bcb4632a5f76`, result `SAT`.
- DIMACS: `scratch/exact17-lean-to-sat/exact17-forty-second-root-forty-first-model-refinements.cnf`, SHA-256
  `375b7bc42381175119545627ab55c6bacb285fa35e4486f0b11193300620921f`.
- Custody model: `piqd-child42-core1-custody-model.json`, artifact SHA-256
  `9df868b2160c2e3b1f37cee35212c4cc405f63b3ad2f8671eacd2b6b52419bad`;
  canonical assignment SHA `21f8b5732e8d31d711ad61bfa95b2cf6d3b9fed51767a879a1a145d321f2a105`.
- Custody final SHA-256:
  `53e6f847c1541840e9cbb2c2503d49553a0e8a90489afae6ea99770c55159e45`.
- Reproducer: `uv run python scratch/exact17-lean-to-sat/child42-wave-mine/replay_and_mine.py`.
- Custody JSON is hashed and parsed from one byte snapshot; the imported Child41
  replay consumes temporary immutable copies of those same authenticated bytes.
  It checked all `5,848,452` clauses over `308` variables and satisfied every
  clause.  The model selects named order `1` and next center `0`; the decoded
  order and rows are in `child42-analysis.json`.
- The runner now fails closed on the pinned model/final bytes, terminal
  identity and epoch, SAT model-check row, canonical assignment digest, and
  exact assignment shape (308 unique nonzero in-range literals).
- Child38's ledger and Child39--Child41 analyses are accepted only at their
  pinned SHA-256 bytes, schemas, PASS status, replay counts, and expected
  occurrence counts; the resulting parent bank has `562` oriented supports.

## Producer-bank result

The selected-order scan found `83` producer records, `45` distinct supports,
and `35` subset-minimal supports.  Size counts are `6:18, 8:5, 10:9, 12:1,
14:1, 16:1`.  All 35 are **SOURCE-VALID** finite occurrences of the existing
generic two-Kalmanson cancellation family; none is exact or strictly
subsumed by the Child38--Child41 bank, so the finite yield is `35 × 4 = 140`
new clauses.  There is no new cardinality-independent theorem schema.

Representative new supports (the complete list and certificates are in the
JSON):

```text
[(0,3),(0,15),(3,2),(3,15),(10,2),(10,3)]
[(1,4),(1,8),(13,4),(13,5),(16,5),(16,8)]
[(4,6),(4,10),(12,5),(12,10),(13,5),(13,6)]
[(0,12),(0,14),(7,9),(7,13),(9,10),(9,14),(11,9),(11,12),
 (12,0),(12,10),(14,0),(14,13)]
```

The comparison bank contains `562` oriented supports from:
`child38-cancellation-bank-ledger.json`, `child39-analysis.json`,
`child40-analysis.json`, and `child41-analysis.json`.

For each accepted support, the runner independently replays both the forward
and reflected producer through the source-aware `lean_occurrence_check` after
the deterministic path-row projection.  The result records `35/35` paired
checks, `4` clauses per occurrence (`2` named orders × `2` orientations), and
`140` clauses if banked.  Four formalized-core diagnostics remain excluded
from the accepted list.

## Formalized-core diagnostics and source bridge

The core scan found five records: one Kalmanson record plus four
**DIAGNOSTIC** records, all lacking a general `SourceRealization` producer:

| orientation | core | immediate consumer | first missing source bridge |
|---|---|---|---|
| reverse | two-circle `Q=2,U=12,V=4,Y=0` | `FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg` | source transport of shared-pair equalities and negative same-side signs |
| forward | two-circle `Q=4,U=0,V=2,Y=12` | `FourPointTwoCircleBisectorOrderCore.false_of_core` | same equality/sign transport for this tuple |
| reverse | convex-five `a=4,b=9,c=10,x=3,y=8` | `ConvexFivePointCore.false_of_core_of_neg` | four `EdgeClosure`s and two negative signed-area facts |
| invariant | exact off-circle `center=2, off=12, support=[0,3,7,14]` | `false_of_metricCoreAlternative` | source-realized off-circle branch and center transport |

For the source-valid records, the exact consumer is
`Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_twoKalmansonCancellationData_of_check`, reached through
`sourceAssign_cancellationOccurrenceClause` in
`BlockerVExactSeventeenTwentyEighthModelRefinements.lean`.  The existing
`SourceRealization` API supplies the boundary geometry and `Realizes` fact;
the occurrence certificate supplies checked orders, permutation, closure
paths, and selected-hit antecedents.  No new producer/transport bridge was
found.

## Uniform-theorem assessment

The strongest reusable conjecture remains a finite coverage theorem: every
admissible exact-17 `SourceRealization` contains at least one checked
two-Kalmanson occurrence whose oriented support is selected.  This is
**CONJECTURED**, not implied by current source hypotheses; proving it would be
exact-17 closure, not a local Child42 refinement.  Child42 itself remains
SAT, so exact-17 is not closed.

The complete machine-readable classification, every support, producer path,
orientation, bank relation, and diagnostic record is in
`scratch/exact17-lean-to-sat/child42-wave-mine/child42-analysis.json`.
