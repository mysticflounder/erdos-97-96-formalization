# P7 persistent CaDiCaL discovery adapter

Date: 2026-08-02

## Outcome

The P7 successor contract is implemented and verified.  It is an optional
discovery accelerator for projected-static-v3, not a replacement for the
authenticated subprocess and proof path.  The hard-shard throughput gate is
still open; this report makes no performance or closure claim.

## Implementation

`census/p97_search/phase3_incremental_cadical.py` adds:

- strict ordered-DIMACS parsing with exact header and clause-count checks;
- `PersistentDiscoveryRunner`, which creates one incremental solver, adds the
  first complete formula, and accepts only append-only formula extensions;
- restart semantics that rebuild from the complete CNF rather than loading an
  opaque solver snapshot;
- an optional ctypes IPASIR factory for a shared CaDiCaL library, including
  explicit API/signature/library-hash metadata;
- deterministic model completion for IPASIR don't-care variables;
- manifest metadata for the schema, backend, solve/rebuild counts, clause
  frontier, frontier hash, and resume/terminal policies.

`census/p97_search/phase3_structural_cegar_projected_static_v3.py` adds the
`persistent_discovery` feature flag and CLI option.  The option is restricted
to sequential, unsimplified discovery.  Proof-requesting calls bypass the
incremental solver and delegate to the existing fresh proof-producing solver.

The frozen v2 driver and `sat_generate.py` were not modified.

## Trust boundary

Incremental SAT results are discovery evidence only.  A sequential discovery
UNSAT still freezes the exact terminal CNF and invokes a fresh proof-producing
solver followed by the existing DRAT checker.  A fresh adapter on resume must
replay the authenticated formula and journals.  Solver state, phases,
activities, and native handles are not authenticated resume artifacts.

## Verification

Contract and integration tests:

```text
uv run --with pytest python -m pytest -q \
  census/p97_search/tests/test_phase3_incremental_cadical.py
4 passed in 0.70s

uv run --with pytest python -m pytest -q \
  census/p97_search/tests/test_phase3_structural_cegar_projected_static_v3.py
36 passed in 8.62s
```

The second suite includes the frozen-v2/source-generator byte-identity guard.
The native CaDiCaL 3.0.0 shared IPASIR library was built in the existing
`/Users/adam/cadical/build` checkout.  A two-formula smoke test returned SAT
for the initial formula, then UNSAT after an appended clause, and released the
native handle cleanly.

## Remaining gate

Run a production-shaped A/B canary on three representative hard shard
families.  Promote only if persistent discovery reaches the planned 1.5x
models/hour threshold on at least two families, has no terminal-status
disagreement, and stays within the 25% RSS allowance.  Until then the
subprocess backend remains the operational baseline.
