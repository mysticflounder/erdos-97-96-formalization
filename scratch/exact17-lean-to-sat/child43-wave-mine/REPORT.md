# Child43 exact-17 wave-only theorem mine

Status: **PASS**.  This report mines only the authenticated Child43 SAT model;
it does not claim exact-17 closure.

## Authentication and independent replay

- Job: `9a1a3903-6ba3-4f41-8e74-0d11ee8ba7eb`, terminal result `SAT`.
- CNF: `scratch/exact17-lean-to-sat/exact17-forty-third-root-forty-second-model-refinements.cnf`;
  SHA-256 `dbfbd84473cfe86a0e596322c0c0af8a077fc830ab5a9976c5efa7ea80a96c76`.
- Custody model SHA-256:
  `5a68926a32d5406ffdea187dc4e4c18330799160a4e8596fc463fcc3160530ce`.
- Custody final SHA-256:
  `8585ed1a1d997ff16c305514d6640b12ada876ef9cc4d2d737bd596ecb97505b`.
- Canonical assignment SHA-256:
  `9e613d516c92b818a1b37bfa2c416e448b5e7919169345b6fff954a3325f72c2`.
- Reproducer: `uv run python scratch/exact17-lean-to-sat/child43-wave-mine/replay_and_mine.py`.

The replay independently checked all `5,848,592` clauses over `308` variables
and satisfied every clause.  The model selects named order `1` (the only valid
order) and next center `0`.  Custody bytes are hashed and parsed before an
immutable temporary snapshot is passed to the established scanner.

The parent bank is pinned to the Child38 ledger and Child39--Child42 analyses;
their authenticated oriented-support union contains `632` supports.  Their
individual SHA-256 values and schemas are recorded in
`child43-analysis.json` under `provenance.parent_analysis_sha256`.

## Source-valid producer result

The selected-order scan produced `155` two-Kalmanson producer records, `100`
distinct supports, and `57` subset-minimal supports.  Every one of the `57`
minimal supports is new against the pinned Child38--Child42 bank: exact matches
`0`, strict parent-bank subsumptions `0`.  Each is a finite occurrence of the
already banked generic two-Kalmanson cancellation family, not a new theorem
schema.  The paired forward/reflected source checks replayed `57/57` producers
in each direction through `lean_occurrence_check`, yielding `57 × 4 = 228`
source clauses if promoted (two named orders times two orientations).

Subset-minimal support sizes are `6:29`, `8:10`, `10:11`, `12:4`, and `14:3`.

The immediate existing consumer is
`Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_twoKalmansonCancellationData_of_check`,
via the existing `sourceAssign_cancellationOccurrenceClause` adapter.  The
exact supports, cyclic paths, row choices, reflected producer digests, and
classification are all in `child43-analysis.json`.

## Formalized-core diagnostics (excluded)

The source-aware scan found five records; one is the accepted Kalmanson record
and four are diagnostic-only.  No diagnostic entered the 228-clause bank.

| orientation | core | existing consumer | first missing source bridge |
|---|---|---|---|
| forward | two-circle `Q=10,U=5,V=8,Y=6` | `Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core` | SourceRealization transport proving the two `EdgeClosure` equalities `(Q,U)~(Q,Y)` and `(U,V)~(Y,V)`, distinctness `U ≠ Y`, and the two positive signed-area antecedents. |
| reverse | two-circle `Q=2,U=14,V=3,Y=4` | `Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg` | The corresponding two closure/equality transports, distinctness, and two negative signed-area antecedents for the reverse orientation. |
| forward | convex-five `a=4,b=8,c=11,x=13,y=10` | `Problem97.Census554.ConvexFivePointCore.false_of_core` | Source construction of `a ≠ b`, `x ≠ y`, the four required `EdgeClosure` equalities, and the two positive orientation signs. |
| invariant | exact-off-circle `center=2, off_support=4, support=[5,7,12,14]` | `Problem97.Census554.false_of_metricCoreAlternative` | A source-realized `ExactOffCircleCore` (member/excluded membership plus closure) together with `ExactAt` for the selected row; the scanner supplies only the finite model pattern. |

These are diagnostic shape matches, not source-valid theorem candidates.  The
current `SourceRealization` API does not discharge the listed bridges from this
decoded model, and no already-banked theorem was used circularly to do so.

## Conclusion

Child43 is an independently authenticated SAT survivor.  It adds `57` new
finite source-valid occurrences / `228` potential clauses of the existing
two-Kalmanson consumer and identifies no new cardinality-independent producer
theorem.  The four other formalized-core hits remain bridge work; exact-17 is
not closed.

Machine-readable result: `scratch/exact17-lean-to-sat/child43-wave-mine/child43-analysis.json`.
