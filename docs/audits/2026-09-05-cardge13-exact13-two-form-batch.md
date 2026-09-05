# CardGeThirteen exact-13 two-form batch

Date: 2026-09-05

Target:
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`.

## Scope

The source event is the final replayed SAT abstraction from the cumulative
3,000-refinement direct cell-0 wave.  The producer projects all 1,430 strict
Kalmanson forms through the equality closure of that decoded provider-row
assignment.  It enumerates every unordered pair of nonzero opposite projected
vectors and replaces each vector cancellation by four explicit
provider-incidence paths accepted by `ProviderRowNogoodCertificate`.

The model exposes 447 opposite-form pairs.  Their explicit paths induce 317
distinct Boolean clauses after equal atom sets are deduplicated.  This is a
materially stronger batch than the four one-form clauses exposed by the same
model.

The compact event has canonical self-hash
`4e6ed8ecad6b1bbae497466314e62b3ea6ce40e4ac89b071e5ee856d3c0907dd`
and file SHA-256
`e33b5f04ec9a2957abd70313f4dde95e238250f4bd3f7bea1015677a535290f2`.
Its run-manifest self-hash is
`f7a22d35f009a841d09742d635bce69438ef231574ae2d38d4a2af749a1aea58`.

## Validation and claim boundary

Three focused tests check complete deterministic opposite-vector pairing,
explicit source-true atoms for every provider path, event self-hashing, and
compatibility with the cumulative resume loader.  The tests and Ruff pass.

The result is a formula-scoped seed bank from one replayed abstraction.  It is
not an UNSAT result, does not classify any coarse cell, and does not claim that
the abstraction is source-realizable.  The next experiment must add these 317
clauses to the authenticated cumulative PIQD journal and inspect the resulting
terminal state.
