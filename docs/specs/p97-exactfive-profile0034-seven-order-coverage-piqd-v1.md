# Exact-five profile 0034 seven-order coverage probe

Status: launch-ready implementation; no campaign has been launched in this
lane. The default command is a read-only readiness check.

## Input custody

The producer reads only
`scratch/runs/exactfive-hard-source-swap-order-piqd-r2-20260902/run-0001`.
It checks the parent run-manifest self-hash and every recorded source/input
digest, then checks the parent terminal self-hash. Each selected profile is
replayed through the parent producer's terminal verifier before selection.
The accepted unresolved set is exactly 212 profiles: 202 with a Z3 SAT rank
witness (regardless of the cvc5 status) and 10 with Z3 UNSAT plus cvc5 UNKNOWN.

## Formula

For each selected alias quotient, the parent abstract rows, radius
disequality, source strict inequality, positive distances, rank skeleton, and
strict Kalmanson cases are retained. For each `pChoice ∈ {p,q}` and
`sChoice ∈ {s,t}`, the producer maps

`(c1, pChoice, sChoice, a, d, c2, O)`

through the quotient classes. If the seven classes are distinct, it asserts
that neither this cyclic order nor its reversal occurs. If aliases collapse
two roles, that pattern is impossible and no strict-order avoidance atom is
added.

The SAT callback checks the coverage system bytes, system digest, journal bytes,
and then delegates the arithmetic and distance replay to the parent's exact
rational checker. It additionally evaluates every admissible direct and
reversed avoidance atom against the returned ranks. Terminal verification
reuses the parent's immutable artifact checker with this coverage callback.

All solver transport is through PIQD. `--launch` creates immutable launch and
terminal records, uses fresh sessions and one solve per session for z3 and
cvc5, runs positive/negative controls, and bounds parallelism at 20 workers.
An existing output tree is accepted only after exact resume verification.
`--verify` rechecks the launch, terminal, controls, and every profile without
submitting jobs. The default command and `--check-parent` are silent on
success; `--verbose` emits one compact readiness/completion line.

## Claim boundary

An UNSAT result would concern only the finite encoded abstraction and selected
parent profiles. It would not establish Lean source coverage, source
exhaustiveness, Euclidean realization, a theorem, promotion, or live closure.

## Validation

Focused tests cover cyclic wraparound, reversed order, alias collapse,
avoidance encoding, accepted/rejected SAT replay, parent selection and custody
failure, controls, terminal false claims, deterministic descriptors, launch
gating/silence, and the 20-worker cap. The lane checkpoint owns
`run-0001/run_manifest.json`; this work session did not submit a solver job.
