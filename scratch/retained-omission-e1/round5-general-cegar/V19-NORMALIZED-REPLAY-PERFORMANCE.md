# Round-5 v19 normalized-replay performance and provenance

Date: 2026-08-02

Target:
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`

## Result

v19 removes the pathological normalized-formula SMT serialization exposed by
the interrupted v18 production run.  It does **not** remove or weaken a solver
check:

- v18's complete profile-specific static equality bank is inherited unchanged;
- v17's equality-closure lane still requires fresh raw-formula UNSAT replay;
- a theory UNSAT still requires an audited primary QF_LRA check and a second
  normalization/check from raw assertions translated into a fresh Z3 context;
- the admitted theory blocker is still the complete 825-literal semantic
  assignment; and
- UNKNOWN remains terminal incomplete and admits no blocker.

No production CEGAR search was run for this change.

## Why the v17/v18 identity step was removed

`round5_cegar_v17._fixed_normalized_formula` computed
`sha256("\n".join(assertion.sexpr() ...))` over 39,448 normalized assertions.
The v18 production worker reached its first new fixed QF_LRA assignment and
spent more than ten minutes in this Python/Z3 serialization step before it was
interrupted.  The solver checks themselves were not the observed stall.

The serialized normalized SHA was also context-sensitive bookkeeping, not the
raw frozen-formula identity.  In the frozen v17 iteration 45 record, the
primary and fresh-context normalized SHA values differ even though both exact
checks are UNSAT.  v17 therefore did not use equality of these hashes as its
soundness condition.

## v19 compositional identity

Each primary and replay normalization now records a canonical SHA-256 over:

1. the frozen full raw-formula SHA-256;
2. the canonical complete-assignment SHA-256;
3. the deterministic normalization-specification SHA-256;
4. a source SHA-256 covering the v19 normalizer and inherited weighted-PB
   rewrite/logic-audit functions;
5. source and normalized assertion counts;
6. tracker count; and
7. raw and post-assignment PB counts.

The record explicitly states `is_raw_formula_sha256: false`.  It is a
compositional replay identity, not a claim that the normalized SMT formula was
serialized or hashed.  Any primary/replay component mismatch or hash tamper is
rejected before blocker admission.

## Durable assignment journal

Each case receives `assignment-journal-v19/`.  Every proposed assignment is
fsynced before the theory check.  A second record is fsynced after the outcome
and, for UNSAT only, includes the exact projected core and blocker text/hash.

Records are immutable consecutive JSON files.  Each is written to a unique
temporary file, fsynced, atomically renamed, and followed by a directory fsync.
The records form a SHA-256 chain over canonical payload hashes.  Recovery fails
closed on malformed JSON, gaps, altered payloads, broken links, duplicate
pending assignments, or outcomes without proposals.  An interruption during a
theory check therefore leaves an authenticated pending assignment instead of
losing all evidence of the proposal.

## Bounded frozen comparison

The focused test replays exactly one already frozen v17 fixed assignment:

- artifact: `artifacts-v17-production1/20260802T142433.875648Z-case-pid61508/`
  `fresh_DDD_k0_d2_f1`;
- iteration: 45;
- assignment size: 825;
- v17 result: UNSAT, primary and fresh replay both UNSAT;
- v19 result: UNSAT, primary and fresh replay both UNSAT;
- v19 admitted core size: 825; and
- isolated pytest wall time: 16.62 seconds with a 5,000 ms timeout on each
  QF_LRA solver call.

For comparison, the frozen v17 record reports 9.073 seconds and 9.099 seconds
inside its two normalization calls, plus 0.084 seconds and 0.086 seconds in the
two QF_LRA solver checks.  The exact wall times are machine/load dependent; the
important result is that v19 completed both independent checks without calling
`sexpr()` on a normalized assertion.

## Focused verification

Command:

```text
uv run --with pytest pytest -q test_round5_cegar_v19.py
```

Result recorded in `focused-tests-v19.log`:

```text
11 passed in 21.91s
```

The tests cover:

- rejection of every normalized-assertion `sexpr()` call;
- compositional-identity tamper rejection;
- primary/fresh-replay agreement;
- exact full 825-literal blocker semantics;
- unchanged v18 static-bank inheritance;
- atomic journal recovery and tamper rejection;
- UNKNOWN's no-blocker contract;
- one-case-only execution; and
- the bounded frozen v17 UNSAT comparison above.

## Trust boundary

This is external Z3 evidence for the exact-n15 finite encoding.  It is not a
Lean theorem, a kernel certificate, or a universal closure of the P97 leaf.
