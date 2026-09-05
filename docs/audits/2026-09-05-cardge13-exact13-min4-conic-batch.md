# Exact-13 four-support cone audit (2026-09-05)

## Scope

This lane asks whether the replayed exact-13 cell-0 model has a positive
Kalmanson dependence using at least four nonzero projected forms.  Zero
projected forms are excluded.  The Boolean support-cardinality guard prevents
PIQD from returning a one-, two-, or three-form witness, but does not optimize
the resulting support.

The producer uses mixed Boolean/linear-real logic only for discovery.  Every
returned rational weight is parsed exactly, normalized, scaled to primitive
natural weights, and replayed against every projected coordinate before any
provider paths or clause are emitted.  Nine focused tests and Ruff passed.

## Authenticated run

- Lane base: `9dcb55190afe3f4c740fb82c320bb278985406ed`
- Run manifest self-hash:
  `4a8b6b43b54efafbda8999600d634ee562a796d4e006f8d9ef8fbcaaf89d9012`
- Run manifest file SHA-256:
  `e84922e56c9b8a3883a2f5554d005f9e934d1906e022daaa274ea2a848908858`
- Source Boolean event SHA-256:
  `c04594d844603f9a7935c9f6b4f337f01bd3655f3be853b0f15ae24b0cc1c5fd`
- Journal SHA-256:
  `831192993233fb1c2c47d6961b50c017f97aadffc75d9a9b21d0e9aa6b7165d1`
- Event self-hash:
  `a80c7ee3943a0ede9fb9ccb883a1f890ee41337a219843d48e61c5219cac7419`
- Event file SHA-256:
  `7f3fe36b977c778c2bfee802dbde41b455c9b3b945f6f3752b7815c475177ffb`

The query retained 1,126 nonzero projected form representatives.  PIQD's Z3
4.17.0 session returned a replayed SAT cone model satisfying the minimum-four
support guard.  Exact scaling produced:

- 940 positive weighted terms;
- total primitive natural weight 2,236;
- 4,472 multiplicity-preserving provider edge pairings;
- a 58-atom source clause.

The result proves that this decoded model has a higher-support positive
Kalmanson dependence.  It is not compact enough for practical Lean emission
and does not close the Boolean cell.

## Required compaction

The dense witness can be reduced without changing its conclusion.  Augment
each active projected vector by a final normalization coordinate.  Whenever
the active augmented columns are linearly dependent, exact Gaussian
elimination yields a rational null direction.  Move along that direction to
the nearest boundary of the nonnegative cone, zeroing at least one weight,
and replay the invariant.  Repetition terminates with at most quotient rank
plus one active terms, here at most 79.

That deterministic exact support reduction is the next checkpoint.  The
original PIQD model and the reduced rational/natural weights must both remain
bound in its event so the compaction step is independently replayable.
