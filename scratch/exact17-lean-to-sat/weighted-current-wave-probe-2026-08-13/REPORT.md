# Child43 weighted-Kalmanson current-wave probe

Status: `PASS` for the bounded finite-model probe; no solver, PIQD job, Lean
build, or production edit was performed.  The reproducible script is
[`probe.py`](probe.py), and its complete machine-readable result is
[`analysis.json`](analysis.json).

## Authentication and replay

The probe authenticated the Child43 custody model/final and CNF, then replayed
the assignment independently: `308` variables and `5,848,592` clauses,
`satisfies_all=true`, CNF SHA256
`dbfbd84473cfe86a0e596322c0c0af8a077fc830ab5a9976c5efa7ea80a96c76`.

Inputs were model SHA256
`5a68926a32d5406ffdea187dc4e4c18330799160a4e8596fc463fcc3160530ce`, final
SHA256 `8585ed1a1d997ff16c305514d6640b12ada876ef9cc4d2d737bd596ecb97505b`,
manifest SHA256
`6805434e1cf96526d93d4fc2eb291e1cab9ac6b7cc9417b5010c8f8a1b038171`, and
job `9a1a3903-6ba3-4f41-8e74-0d11ee8ba7eb`.  The selected order was
`(0,6,8,11,10,12,9,7,2,15,16,3,4,5,1,13,14)`.  This is not a hard-coded
assumption: the probe now requires next-center selector `0`, order selector
`1`, and exact agreement with Child43's authenticated order constant before
performing the metric scan.

The existing legacy weighted replayer was fail-closed as incompatible: it
requires source-faithful `results/status/journal/atoms` records, while Child43
custody supplies a total SAT assignment.  The probe therefore used the
read-only `census/atail_force/producer_bank.py` weighted checker directly,
which independently reconstructs all equality paths and names the existing
consumer
`Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_weightedKalmansonCancellationData_of_check`.

## Result

All `4,760` positive-weight-one Kalmanson terms (2 forms over all 4-subsets)
were enumerated.  There were `4,543` equality-closure delta classes and two
terms with zero delta individually.  Both zero-delta terms passed exact
`certify_weighted_kalmanson_cancellation`; neither support is exact or
strictly subsumed by the authenticated Child38--42 parent bank of `632`
oriented supports.

The strongest candidate is the one-term certificate

```text
quad (6,8,10,5), form adjacentSides, weight 1
```

in the selected cyclic order.  It is the strict inequality
`d(6,8)+d(10,5) < d(6,10)+d(8,5)`.  The exact row-equality paths use only

```text
d(8,6)=d(8,5),  d(5,6)=d(5,10),  d(6,5)=d(6,10),
```

with support
`[(5,6),(5,10),(6,5),(6,10),(8,5),(8,6)]`.
The second independent occurrence is `(2,3,4,14), innerOuter`, with support
`[(2,12),(2,14),(3,4),(3,14),(4,2),(4,12),(12,2),(12,4)]`.
Full pairings, indexed paths, and source records are in `analysis.json`.

## Classification and limitation

This is a `SOURCE-VALID` finite producer-bank occurrence and is genuinely
broader than the already banked two-Kalmanson occurrence family: it has one
Kalmanson term, not two, and its support is absent from the parent bank.  The
refreshed Child33--44 meta artifact (SHA256
`9a1ca9190dded34fcb4d9dcac311c83d86ca2b94f7668895728d66784fe8f3d1`) contains
`358` source-valid records, all in the existing
`equality-convex-two-kalmanson-cancellation` family and none in a weighted
family.  Thus this is a new current-model weighted occurrence, not a repeated
meta-report clause.

The result does **not** establish a universal `SourceRealization` producer or
exact-17 closure.  It shows that, after decoding this SAT survivor's finite
rows, the existing weighted Lean consumer can consume a new one-term
certificate.  A reusable source theorem would still need to derive the three
row equalities and the named cyclic order from `SourceRealization`; that bridge
is not present in this probe.
