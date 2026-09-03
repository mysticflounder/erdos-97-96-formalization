# Fixed-order QF_NRA canary audit (implementation checkpoint)

Lane: `exactfive-hard-source-swap-nra-canary-r2-20260902`
Run root: `scratch/runs/exactfive-hard-source-swap-nra-canary-r2-20260902/run-0001`

## Scope

The implementation targets only authenticated survivor profile 1697
(`59131cdcdaa474ab022dffd6ab990276ad1893caf70eb55940be3ec75a62ad5e`) and
the two fixed orders recorded in the specification.  It is not a census of
all profile orders and does not claim source realization or closure.

## Encoding audit

The query declares 2×11 real coordinates, four gauge constraints, 165 strict
signed-area constraints (`C(11,3)`), 13 row equalities, one radius
disequality, and one source strict inequality.  The formula uses direct
coordinate squared distances and inline arithmetic; there are no helper
distance definitions or independently asserted Kalmanson clauses.

The four-class controls are required to return SAT/SAT (positive) and
UNSAT/UNSAT (negative); SAT additionally requires PIQD's daemon
`model_replay.outcome = SATISFIED` and local exact-rational replay.  Duplicate
or non-finite readback numerals are rejected.

## Run result

Successor `run-0001` completed in 332.76 seconds with a 300-second requested
per-solver timeout (PIQD effective deadline 330 seconds):

```text
cell              Z3       cvc5      overall
positive control  SAT       SAT       complete
negative control  UNSAT     UNSAT     complete
Z3 survivor order UNSAT     UNKNOWN   inconclusive
cvc5 survivor     UNSAT     UNKNOWN   inconclusive
```

Both SAT controls passed PIQD model replay and exact local rational replay.
Z3 rejected each fixed target order in 87 ms and 83 ms respectively; cvc5
reached its effective deadline on both.  The result is therefore a useful
order-cell rejection but not a cross-solver result and not an elimination of
profile 1697.  A fresh no-solver resume revalidated every bound artifact and
reproduced terminal self-hash
`4ca0f89bf9ca93ea6a02443eb361ad53e9b0b4f13358aa3d53161a1e538591d2`.
The run-manifest and launch bindings are
`e939e7cc70f6d47b5c5d1b3f3a84dda6682478f543ed589b2e0608a01ed9c0a5`
and `70174e9781e8a27144a7db09fe8fad355d69d5abf3ff2791b97346908cb8ebff`.

## Trust boundary

All future solver calls must use the existing authenticated source-semantic
adapter, with exact coordinate readback and total replay.  The run manifest is
bound to the lane checkpoint and current producer/source digests.  Launch and
terminal records are create-once and self-hashed; a resume first revalidates
all four adapter output directories and their immutable artifacts.  Partial
trees are resumed only when their adapter result is complete and validates;
otherwise the run fails closed without resubmission.  UNKNOWN and transport
loss remain inconclusive.  Any terminal result remains fixed-order diagnostic
evidence.

The canary and shared adapter suite currently passes 108 tests, including deterministic bytes,
triple and row inventories, exact readback, semantic/journal tampering,
duplicate and zero-denominator rejection, artifact digest tampering, bounded
launch inputs, and checkpoint-manifest validation.

The implementation checkpoint also pins server, timeout, and worker settings
in the launch hash, validates source and checkpoint digests before creating a
query, and permits resume only for complete adapter trees whose per-file
digests and solver result records revalidate exactly.

## Preserved pre-submit failure

The original lane `exactfive-hard-source-swap-nra-canary-20260902/run-0001`
created an immutable launch record but submitted no query.  Its timeout was a
JSON float (`300.0`), which the strict custody reader rejected on resume.  The
successor lane stores `timeout_ms` as an integer and adds a focused strict-JSON
regression test; the failed launch is preserved rather than rewritten.

## Next experiment

The highest-leverage continuation is adaptive order reselection on profile
1697.  Block the two tested linear permutations, ask the authenticated linear
system for fresh order witnesses through PIQD, and submit each fresh order to
the same planar QF_NRA checker.  A planar SAT witness would trigger the
MEC/minimality/blocker layer; exhaustion would require a separately checked
finite order-cover argument before it could support Lean work.
