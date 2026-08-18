# FirstFiber metric-core piqd wave

Date: 2026-08-18

## Scope

This was a bounded diagnostic run of the existing source-frozen metric frontier
through piqd.  It is a route and theorem-mining check for the planned
`MetricCoreAlternative` consumer; it is not a FirstFiber coverage theorem.
The current repository has no input artifact that combines the
`FirstFiberOutsidePairFiveCenterExactRows` provenance with a faithful metric
system, so the four eligible systems below are the nearest authenticated
frontier inputs.

Input: `census/global_confinement/metric_realizability_cvc5.json`

Systems selected: `0b12b25bf5daa7566f98`, `61441fb2d7ae397e1df6`,
`66d08a69dde4db909815`, and `e5cea0bced9ad6e37aff`.

The run used one sequential piqd cvc5 session and one sequential z3
cross-check per system.  Deletion requests used a 5-second deadline and
validation requests a 30-second deadline.  The immutable bundle is under
`scratch/runs/firstfiber-metric-piqd-20260818/canary-v1/artifacts/four-system-wave`.
Its validator replay passes and retains the classification
`PIQD_AUTHENTICATED_DIAGNOSTIC_NOT_P97_CLOSURE`.

## Results and wave-only mine

| system | minimized rows | cross-check | structural family |
|---|---:|---|---|
| `0b12b25bf5daa7566f98` | 6 | cvc5 UNSAT / z3 UNSAT | perpendicular-bisector convex core |
| `61441fb2d7ae397e1df6` | 11 | cvc5 UNSAT / z3 UNKNOWN | perpendicular-bisector convex core |
| `66d08a69dde4db909815` | 12 | both validation stages UNKNOWN | equilateral-bisector collision candidate |
| `e5cea0bced9ad6e37aff` | 12 | both validation stages UNKNOWN | equilateral-bisector collision candidate |

The first system's six-row core is classified by the existing deterministic
core detector as foci `(1, 9)` with points `(0, 5, 6)`.  The second is the
same existing family with foci `(3, 7)` and points `(0, 5, 10)`.  The two
equilateral-bisector classifications are not promotion candidates because
neither solver validation reached a cross-checked UNSAT result.

## Consequence for the target

This wave adds no new theorem and does not close
`false_of_capSource_firstFiber_outsidePairDeletionExactRows`.  It does confirm
that the existing piqd metric miner can authenticate and minimize the generic
core families that the planned consumer already accepts.  The next
computational prerequisite is a producer that maps the five outside-pair
rows, their cyclic order, exactness, and source provenance into the miner's
metric-system schema.  Running larger bounded waves before that producer
exists would repeat the same off-target census rather than test the live
FirstFiber ingress.
