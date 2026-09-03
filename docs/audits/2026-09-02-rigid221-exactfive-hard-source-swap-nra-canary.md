# Fixed-order QF_NRA canary audit (implementation checkpoint)

Lane: `exactfive-hard-source-swap-nra-canary-20260902`  
Run root: `scratch/runs/exactfive-hard-source-swap-nra-canary-20260902/run-0001`

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
or non-finite readback numerals are rejected.  The canary has not been
launched from this implementation lane; solver status and runtime belong in a
post-run update after PIQD custody verification.

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

The focused suite currently passes 12 tests, including deterministic bytes,
triple and row inventories, exact readback, semantic/journal tampering,
duplicate and zero-denominator rejection, artifact digest tampering, bounded
launch inputs, and checkpoint-manifest validation.

The implementation checkpoint also pins server, timeout, and worker settings
in the launch hash, validates source and checkpoint digests before creating a
query, and permits resume only for complete adapter trees whose per-file
digests and solver result records revalidate exactly.
