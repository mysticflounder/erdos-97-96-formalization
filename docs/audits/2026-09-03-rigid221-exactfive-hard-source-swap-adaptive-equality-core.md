# Adaptive equality-core lane audit — 2026-09-03

Status: implementation audit; no PIQD or Singular query was launched.

## Implemented scope

The lane implements a sequential PIQD-only Singular diagnostic for the 13
pivoted squared-distance row equalities of adaptive survivor profile 1697. It
replays the completed predecessor run without transport, reconstructs the exact
current 11-class map and row records, and uses the two predecessor orders only
to select two distinct affine gauges. Both targets bind the same
order-independent equality template.

Four mandatory unit/nonunit controls precede the targets. Each query binds its
variables, polynomials, script, predecessor custody, gauge provenance, omitted
ledger, and false claims. Backend output is create-once and is independently
revalidated before interpretation. Completed resume constructs no PIQD runner.

## Claim audit

Every mathematical, source, Lean, theorem, and promotion claim is false. A
future `UNIT` result will remain a one-engine discovery about one fixed
equality ideal. A future `NONUNIT` result will not establish a real point.
Neither result uses or authenticates signed-area, radius-disequality,
source-strict, distinctness, or source-realization conditions.

## Verification state

The focused suite passes with `24 passed`. The combined new-producer, PIQD
Singular backend, equality-probe, and predecessor-adaptive suite passes with
`79 passed, 9 subtests passed`. Ruff reports no findings on the new producer,
tests, and runner.

An independent adversarial review found that the first implementation copied
three durable-summary planar fields while checking that summary. The repaired
validator pins all four predecessor file hashes and their internal self-hashes,
then derives each summarized planar status and result digest from the replayed
terminal. Rehashed-field tampering and malformed-summary regressions now pass;
the re-review found both issues closed.

A final partial-resume review added explicit rejection for a terminal whose
immutable launch record is missing. The regression confirms that this state is
not repaired in place and no runner is constructed.

After the producer, runner, and specification stabilized, the governed
`run-0001` root was initialized with only its three empty output-class
directories and `worktree-run-manifest/v1`. The manifest repeats checkpoint
base head `0e8431336b2a0713621877829ba9570effc2c67e`, has internal self-hash
`f296d49688c4563b1f1b81214e87229dfcd288db63bba59ad1cb3958f23451b7`,
and file SHA-256
`b0561b77ab463275a3ba9dae17df45a001f95fb6de1f0d1c26a9eb9fb07cc6e5`.
It binds nine governing source files and six input files. Initialization is not
a solver run: `artifacts/`, `events/`, and `tmp/` remain empty, with no launch
or terminal record.
