# Exact-13 witnessed-Key root correction (2026-09-06)

Lane: `exact13-witnessed-key-root-correction-20260906`

Base HEAD: `ef64cac6654674282e5be2484fe134e581259089`

## Correction

The root producer committed at `0c60d03ae` encoded each blocker condition
`bᵢ ≠ 0 ∧ bᵢ ≠ 1` as one binary clause. That clause only excluded assigning a
blocker both labels simultaneously, which the one-hot encoding had already
excluded. It therefore did not enforce either source condition.

The producer now emits the four intended unit clauses, excluding raw labels
zero and one separately for each blocker. This is the same correction used and
independently replayed by CEGAR wave 1 at `ef64cac66`.

The earlier positive smoke witness remains valid: its blockers were already
non-apex. The correction withdraws only the earlier universal claim that every
model of the uncorrected root replayed `Key.Valid`.

The corrected root has 432 variables and 29,468 clauses. It retains the two
historical redundant binaries so its clause body is byte-for-byte identical to
the authenticated wave-1 effective root. With the original three producer
comments, its emitted DIMACS is 894,103 bytes with SHA-256
`f27294e2666b1171fc741a53bd035a89ea546e0daee09b7ef3ebb24faf338de2`.
Removing exactly those comments and the `p cnf` header yields an 893,927-byte
PIQD clause journal with SHA-256
`b9de440ef5a6856a6b0cebbe5f7e5e3b66ad983019c3cfaabf5774a3fb696080`.

## Verification

The focused tests pin all four unit clauses, the corrected clause count, the
deterministic PIQD normalization identity, and retained-receipt custody. The
root and wave-1 test suites, Ruff, diff checks, and exact-path staged hygiene
are required before commit.
