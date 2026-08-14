# Child41 exact-17 wave-only theorem mine

Status: **PASS / SAT replay**, with no new cardinality-independent theorem
schema.  This report is restricted to the finalized Child41 model.

## Authentication and replay

- Job: `038ded12-0e98-4c93-b666-2ca2ac06da5e`, result `SAT`.
- DIMACS: `scratch/exact17-lean-to-sat/exact17-forty-first-root-fortieth-model-refinements.cnf`, SHA-256
  `fc19386fdd9703f5313e1bf49b164d87c5905c56c727cfea6408dc7d01e78d24`.
- Custody model: `piqd-child41-core1-custody-model.json`, SHA-256
  `cf1cb831223700ebc376a50048260fc280a32aed7c91723c262b8a1274b5896a`.
- Custody final: `piqd-child41-core1-custody-final.json`, SHA-256
  `21880b47dc8d1bb55ecfee96c675d03796e0223503f9e2b4a193808ece53af0f`.
- Independent command: `uv run python scratch/exact17-lean-to-sat/child41-wave-mine/replay_and_mine.py`.
  It checked all `5,847,920` clauses over `308` variables and satisfied every clause.

The complete reproducible result is
`scratch/exact17-lean-to-sat/child41-wave-mine/child41-analysis.json`.
The model selected named order `1` only, with cyclic order
`[0,6,8,11,10,12,9,7,2,15,16,3,4,5,1,13,14]`, and next center `0`.
The decoded exact-four rows are recorded in `decoded_model.rows` in that JSON.

The old `child41-export-receipt.json`, `child41-ingress-validation.json`, and
`piqd-ingress-manifest-forty-first-model-refinements-core1.json` identify the
motivating Child40 model, not this finalized Child41 model.  They are therefore
not used as Child41 model identity evidence.  The custody model/final and exact
CNF binding above agree; this stale-receipt mismatch is retained as a provenance
caveat.

## Producer-bank mine

The selected-order scan produced `1,282` Kalmanson producer records, `433`
distinct supports, and `133` subset-minimal occurrences.  The comparison bank
contains both orientations from the authenticated Child38 ledger and Child39/
Child40 analyses (`296` supports; see `prior_source_bank` in the JSON).  Child41
has `0` exact and `0` strict-subsumed supports against that bank: all `133` are
new occurrences of the already-banked generic family, not a new theorem schema.

All 133 records are forward-oriented in the selected named order.  Their exact
supports and producer certificates (including equality-chain paths, cyclic
boundary labels, and forward/reverse forms) are in
`two_kalmanson_occurrences[0].candidates` in the JSON.  Representative supports:

```
[(0,3),(0,16),(3,2),(3,16),(10,2),(10,3)]
[(0,14),(0,16),(3,2),(3,16),(16,2),(16,14)]
[(0,14),(0,16),(3,15),(3,16),(11,14),(11,15)]
[(0,14),(0,16),(13,5),(13,16),(16,5),(16,14)]
[(1,4),(1,8),(12,4),(12,9),(14,8),(14,9)]
```

Minimal-support size counts are: 6:19, 8:9, 10:12, 12:21, 13:2,
14:31, 16:20, 17:1, 18:10, 19:3, 20:3, 22:2.  The existing source-valid
consumer is
`Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_twoKalmansonCancellationData_of_check`
from `Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate`.
If promoted as occurrence clauses, these yield `133 × 4 = 532` clauses.

## Formalized-core scan and bridge status

The existing formalized-core scanner found 12 records: the Kalmanson family
above plus the following 11 diagnostic-only records.  The listed Lean theorem
is the immediate core consumer; none has a Child41-specific source clause.

| orientation | exact core labels | immediate consumer | source status / first missing input |
|---|---|---|---|
| reverse | SixPointTwoCircle: `A=2,B=1,C=15,D=4,P=11,Q=6` | `SixPointTwoCircleOrderCore.false_of_core_of_neg` | Diagnostic: needs the five `EdgeClosure` equalities (`AB_AC`, `AB_AD`, `AB_BC`, `CD_CP`, `DA_DQ`) plus seven cyclic sign antecedents transported from `SourceRealization`; no tuple-specific bridge found. |
| reverse | Two-circle: `q=1,u=3,v=12,y=2` | `FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg` | Diagnostic: needs `u≠y`, two shared-pair equalities, and both negative same-side area signs; existing source bridge is only for the older fixed `bisectorOrderHits` pattern in `BlockerVExactSeventeenFourPointTwoCircleBisectorRows.lean`. |
| forward | Two-circle: `q=6,u=10,v=4,y=2` | `FourPointTwoCircleBisectorOrderCore.false_of_core` | Same missing source-to-hit transport for this tuple; generic core theorem exists, fixed-pattern bridge does not cover it. |
| forward | Convex-five: `a=0,b=2,c=15,x=11,y=4` | `ConvexFivePointCore.false_of_core` | Needs `a≠b`, `x≠y`, four specified `EdgeClosure`s, and two positive signed-area facts. Existing `ConvexFivePointFourthRows`/`GeneralCarrierBridge` bridges cover named earlier patterns only; this Child41 row tuple is not instantiated. |
| invariant | Six-circle collision: `a=1,b=2,c=11,d=12,e=9,f=2,o=15` | `false_of_metricCoreAlternative` | Diagnostic incidence only; no source theorem converting these labels to a `MetricCoreAlternative` branch. |
| invariant | Five-circle collision: `a=15,b=11,c=2,d=1,e=2,f=12,g=9` | `false_of_metricCoreAlternative` | Same missing metric-core producer/transport lemma. |
| invariant | Nested equal chords: `o=12,a=2,b=3,c=13,d=11` | `NestedEqualChordCore.false_of_core` | Needs five `EdgeClosure`s, `o≠a`, and four cyclic signed-area antecedents; no `SourceRealization` bridge was found in the live ATail source. |
| reverse | Convex-five: `a=6,b=15,c=2,x=4,y=9` | `ConvexFivePointCore.false_of_core_of_neg` | Same four equality and two negative-area antecedents; only older fixed-pattern bridge exists. |
| invariant | Exact off-circle: `center=1, off=0, support=[2,3,14,15]` | `false_of_metricCoreAlternative` | Needs a source-realized exact-off-circle branch and blocker-center transport; not supplied by the scanner. |
| invariant | Duplicate center: `centers=[1,4], triple=[0,2,15]` | `false_of_metricCoreAlternative` | Needs a source-realized duplicate-center branch; no direct producer. |
| invariant | Perpendicular bisector: `foci=[0,2], points=[1,4,11]` | `false_of_metricCoreAlternative` | Needs a source-realized perpendicular-bisector branch; no direct Child41 bridge. |

These diagnostics are model-specific witnesses, not source-valid general
theorem candidates.  The existing generic source theorem is the Kalmanson
cancellation family only.  The ranked next refinement is therefore to bank the
133 new Kalmanson occurrences (532 clauses), subject to the parent runner's
independent clause/provenance check; no diagnostic bridge should be promoted
from this wave.  Exact-17 is not closed: the authenticated Child41 SAT model
survives.
