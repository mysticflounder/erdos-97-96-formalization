# Exact17 child34 wave-only theorem mine

Status: `PASS` (read-only diagnostic mine; no Lean declarations promoted).

## Provenance and replay

`replay_and_scan.py` independently authenticated and replayed the complete
child34 DIMACS assignment:

* child CNF SHA-256:
  `ea8311540af709cf991c932c38e52f9767227cf55781508f2791b1dc42c4a819`
* parent prefix SHA-256:
  `775eb42db7bdac52eb7e5609a1cf33111c953d26f4cee9c8d95bde3b468563b9`
* model SHA-256:
  `2a77785a2bc9e4822c576cb1b210b2c874d69c30382cc688732cae90dc8cb1d8`
* replay: 308 variables, 5,847,256/5,847,256 clauses satisfied; exact final
  eight-clause suffix verified.

The two source orders were scanned, and each scan included the bank's forward
and reverse cyclic orientations.  Both orders gave the same five semantic
families.  The full decoded rows and scanner records are in
`child34-wave-mine.json`.

## Wave-only candidate inventory

Here “source-valid orbit clauses” counts only clauses backed by a named
child34 source producer, not a diagnostic matcher hit.  “Child34 bank” means
exact-support subsumption by the source family appended in this wave.

| candidate (exact support) | producer / Lean consumer | child34 bank? | source-valid orbit clauses |
|---|---|---:|---:|
| `equality-convex-two-kalmanson-cancellation`: `first_quad=(0,2,3,10)`, `second_quad=(0,3,8,9)`, both `adjacentSides`; paths `[(0,2)->(0,8),(3,10)->(2,10),(0,3)->(0,3),(8,9)->(3,9)]` | producer-bank equality closure; `Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_twoKalmansonCancellationData_of_check`; direct source theorem `ATailBlockerVExactSeventeenThirtyThirdKalmansonRefinement.sourceAssign_pairedKalmansonClauses` | YES (exact paired occurrence) | 4 |
| `equality-perpendicular-bisector-convex`: foci `(3,13)`, witnesses `(1,4,12)` | metric-bank; `Problem97.Census554.false_of_metricCoreAlternative`; missing source-valid bridge for this exact witness triple (the child34 source bank has the distinct `(2,4,12)` occurrence) | NO | 0 |
| `equality-convex-five-point`: `(a,b,c,x,y)=(15,4,13,3,12)` | metric-bank; `Problem97.Census554.ConvexFivePointCore.false_of_core`; no child34 source-clause producer for this exact support | NO | 0 |
| `equality-convex-four-point-two-circle-bisector-order` (forward): `(Q,U,V,Y)=(1,13,4,3)` | common-system bank; `Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core`; no child34 source-clause bridge for this exact support | NO | 0 |
| reverse companion: `(Q,U,V,Y)=(4,3,1,13)` | common-system bank; `Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg`; no child34 source-clause bridge for this exact support | NO | 0 |

The Kalmanson core is also recognized in the parent model (so it is not a
new semantic family), but this wave's exact source-valid producer is the
paired occurrence and its four-clause orbit.  The perpendicular-bisector
source family is present in the child34 suffix but is not a positive motif in
the decoded child34 model: its source-valid producer is
`child33PerpBisectorClauses`, with four clauses, for witnesses `(2,4,12)`.
It therefore contributes four source-valid clauses to the wave bank but no
additional child34 model candidate.

Conclusion: no new source-valid theorem candidate was exposed beyond the
already-formalized paired Kalmanson producer; the other four scanner hits are
diagnostic exact supports with existing geometric consumers but no named
source-valid orbit bridge.  Total source-valid child34 suffix coverage is
`4 + 4 = 8` clauses (`pairedKalmansonClauses` plus
`child33PerpBisectorClauses`).
