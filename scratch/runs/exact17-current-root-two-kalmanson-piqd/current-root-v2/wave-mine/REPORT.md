# Exact17 current-root two-Kalmanson wave mine

Status: **PASS**. This report covers only the authenticated SAT survivor from
job `33126a9f-df16-4380-8fdb-07d2fe151f0a`; it does not claim exact-17 closure.

## Authentication and independent replay

- Root: `scratch/exact17-current-root-two-kalmanson-package-v2/exact17-current-root-two-kalmanson.cnf`
- Root SHA-256: `7787c58442a276f0247efec8d1a3bec3df34aeb47b5896c54c9cbd9d08978698`
- Dimensions: `308` variables, `7,037,176` clauses
- Model SHA-256: `2b89686b54bd9b93041ad54b68a2b823b3271954f8040b69a17d1d535daaee43`
- Terminal SHA-256: `db9a91fdcb29292d340446c5f103a22c696bbe9582eefc8c9b7454c9542190cf`
- Journal seal: `1f65321673bd8d5077c1f0b04650bf4af648aabdf6c8b12ad08ac9b1c6e34209`, 436 records

Independent DIMACS replay checked all `7,037,176` clauses. The decoded
survivor has next center `14`, named-order selector `1`, and exact-four
off-center rows. The complete assignment and rows are retained in
`analysis.json`.

The immediately prior two-triple wave differs at 13 of 17 row centers. Its
analysis hash and job identity are recorded in `analysis.json`.

## Existing parent export and theorem-bank coverage

The independent current-root export validator passed. It replayed the
serialized parent package's 54 supports × 2 named orders × 2 orientations =
216 clauses. No serialized parent support is positively realized by this SAT
model, and no parent clause was omitted.

The established source-valid generic two-Kalmanson matcher found:

- 291 producer records;
- 160 distinct forward supports;
- 81 subset-minimal supports, sizes `6:6`, `8:7`, `10:12`, `12:18`,
  `14:20`, `16:14`, `18:3`, `20:1`;
- 0 exact-parent supports and 0 strict-bank-subsumed supports;
- 81 genuinely new finite source-valid occurrences.

Every candidate has independently checked forward and reflected producers and
passes `lean_occurrence_check`. The exact `(center, point)` supports,
producers, source checks, and first Lean consumer are serialized in
`analysis.json`. The immediate consumer is
`Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_twoKalmansonCancellationData_of_check`.

These are 81 new finite occurrences of the existing generic family, yielding
324 potential clauses if promoted. No new cardinality-independent theorem
schema was found.

## Other source-valid scanners

- Formalized two-row/related-core scan: 7 diagnostic shapes, 0 source-valid new candidates; each is retained with its missing `SourceRealization` antecedent.
- Three-row-cycle/equality/rhombus/point-sum scan: 2 rhombus identities, 0 disjoint 3+3 point-sum candidates, 0 universal targets.
- Direct two-triple-row scan: 0 hits for `false_of_six_ccw_two_triple_row_equalities`.
- Conditional paper interlacing scan: 0 hits; no chart ingress is assumed.
- No registered affine or other exact-linear source-valid matcher exists in the established wave scanners; no candidate is claimed for that class.

Because all surviving candidates belong to the already-known generic
two-Kalmanson family and no concrete new general candidate emerged, the Lean
corpus search was not run.

Conclusion: the current root remains SAT; exact-17 closure is not established.
The next missing producer is a source-valid obstruction outside the generic
two-Kalmanson cancellation family.

Machine-readable result: `analysis.json`

Reproducer: `replay_and_mine.py`

Focused tests: `test_replay_and_mine.py`
