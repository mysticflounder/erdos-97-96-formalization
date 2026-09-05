# CardGeThirteen exact-13 three-form batch

Date: 2026-09-05

Target:
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`.

## Finite certificate batch

The final replayed model from the iterative two-form wave has 1,066 distinct
projected strict-form vectors, of which 1,065 are nonzero.  The producer keeps
one stable raw strict-form representative per vector and enumerates every
canonical equal-weight triple of nonzero vectors whose sum is zero.

There are 1,637 such triples.  All admit six explicit provider-incidence paths,
and exact atom-set deduplication leaves 648 Boolean clauses.  Relative to the
14,488 unique one/two-form clauses in the corrected cumulative loader, 407
three-form clauses are new and 241 have an already-seen atom set.

Exactly one candidate repeats a strict form.  The event preserves three term
occurrences and six paired-edge occurrences, so multiplicity is not lost.

The authenticated run-0002 event has canonical self-hash
`d105c57d19483c58e4d5e60ce3796ddf7e16cd8896a7bafc84e2003a9be8caad`
and file SHA-256
`a9fc0d0196d84fda94f87f06d1d194d2a8f139d7a6ea2d1a80f6ad45feac960a`.
Its run-manifest self-hash is
`36dcef2d4bfa9ef1a866d21ba6a7548ea5288c74f84a2839f7d52281cb5b7f7a`.

## Validation and Lean compiler contract

Three focused tests verify deterministic nonzero vector triples, exact zero
sums, six provider paths per certificate, source-true clause atoms, event
self-hashing, and corrected seed-loader compatibility.  The tests and Ruff
pass.  An independent Luna audit confirmed the mathematical construction.

Promotion to `ProviderWeightedKalmansonCancellationData` must obey these
additional checked rules:

- Python stores diagonal-to-side paths, while Lean lists sides on the left and
  diagonals on the right.  The compiler must swap endpoints and reverse every
  path.
- Raw labels must be transported through the selected direct or reflected
  `P.idx` order before constructing ordered quads.
- Canonical Python distance edges require explicit Lean flip steps around a
  provider row whenever the oriented endpoints differ.
- Terms, paired edges, and repeated forms remain multiplicity-sensitive.
- Provider tags and every path membership or blocker-role atom must remain
  distinct; choices use only source-supported labels.

No generated theorem may be called Lean-checked until the emitted
`ProviderWeightedKalmansonCancellationData.check` reduces to `true`.

## Claim boundary

This is a formula-scoped batch from one replayed Boolean model.  It is not an
UNSAT result, does not classify cell 0, and does not claim that the model is a
source configuration.  It supplies compact higher-order certificates for the
next PIQD wave and a precise contract for a later Lean compiler.
