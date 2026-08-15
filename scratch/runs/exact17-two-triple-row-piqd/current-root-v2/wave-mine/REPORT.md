# Current-root-v2 exact-17 wave-only theorem mine

Status: **PASS**. This report covers only the authenticated SAT survivor from
job `7090efd2-a289-476d-a61b-323c4aaf34a5`; it does not claim exact-17 closure.

## Authentication and replay

- Root CNF: `scratch/exact17-two-triple-row-package-v2/exact17-two-triple-row.cnf`
- Root SHA-256: `e9cc97f4e0c6d954902717ecb98e25a772bd54c1199a3bff0190ae2941e5ed51`
- Dimensions: `308` variables, `7,036,960` clauses
- Sealed model SHA-256: `3c003726c09ae688fa3828177842533b38045e588fad75579177ae9e9d28173c`
- Terminal status: `PASS / SAT`, with the receipt and custody seal bound to the
  same job, root, and model.

Independent DIMACS replay checked all `7,036,960` clauses and satisfied every
clause. The decoded survivor has next center `6`, named-order selector `1`,
and exact-four off-center rows. The complete assignment and row witnesses are
retained in `analysis.json`.

## Established theorem-bank scan

The existing exact17 producer-bank scanner found:

- 303 two-Kalmanson producer records;
- 151 distinct supports;
- 54 subset-minimal supports, with sizes
  `6:5`, `8:10`, `10:19`, `12:9`, `14:6`, `16:2`, `17:2`, `18:1`;
- 54 forward and 54 reflected source checks replayed through
  `lean_occurrence_check`.

The inherited oriented support bank (Child38--Child43 plus the authenticated
Child45 ledger) contains 764 supports. Every one of this wave's 54 minimal
supports is new as a finite occurrence: exact-parent `0`, strict-subsumed `0`,
new `54`. Each candidate is therefore source-valid evidence for the existing
generic two-Kalmanson cancellation family, not a new cardinality-independent
theorem schema. Each candidate records its exact `(center, point)` support,
forward/reflected producer path, source replay result, consumer, and theorem
bank relation in `analysis.json`.

The immediate consumer is
`Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_twoKalmansonCancellationData_of_check`.
The indexed theorem-bank preflight for the concrete candidate returned the
existing generic occurrence/cancellation modules at source revision `0ce7786a`.

## Cross-wave motif scan

The established read-only interlacing/motif scanner reports, for this survivor:

- 4 equality-closure rhombus identities;
- 2 disjoint 3+3 point-sum candidates, both conditional chart/interlacing;
- 0 universal hull-rejection targets;
- 0 direct witnesses for
  `false_of_six_ccw_two_triple_row_equalities`;
- 0 conditional paper-interlacing hits.

Thus the new two-triple-row theorem is not instantiated by this survivor. The
two conditional rhombus motifs are not source-valid without chart ingress and
are explicitly excluded from the producer bank.

The formalized-core scan found six diagnostic shapes (two-circle forward and
reverse, convex-five forward and reverse, exact-off-circle, and
perpendicular-bisector-convex). They remain source-invalid in this wave for
the missing `SourceRealization` antecedents listed individually in
`analysis.json`; no circular theorem reuse was admitted.

## Conclusion and next missing producer

This wave contributes **54 new finite occurrences / 216 potential clauses** of
the already-banked generic cancellation family and no new general theorem.
The current root remains SAT. The next missing producer is a source-valid
cardinality-independent obstruction outside that generic family; this survivor
has no direct two-triple-row obstruction witness.

Machine-readable result: `analysis.json`
Reproducer: `replay_and_mine.py`
Focused tests: `test_replay_and_mine.py`
