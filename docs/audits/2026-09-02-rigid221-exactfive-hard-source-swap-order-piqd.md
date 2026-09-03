# Rigid221 exact-five hard source-swap order PIQD audit

Status: producer preflight and current PIQD-interface tests passed; repaired
run-0002 controls and canary pending.

## Scope

This lane executes the complete abstract order/equality census recommended in
the 2026-09-02 rank-3 consult.  It covers the 2,798 source-compatible alias
profiles emitted by `exactfive_hard_source_swap_grid.py`, then existentially
selects a cyclic order for each quotient rather than enumerating raw
permutations.

Each profile binds the four row-equality packets, the old/replacement radius
disequality, the Lean-proved strict inequality `d(e,d) < d(e,a)`, the direct or
reflected cap skeleton, and both strict Kalmanson comparisons for the unique
crossing matching of every four quotient classes.

## Preflight evidence

- The corrected profile stream contains 2,798 unique profiles: 961 with
  `c1 = U` and 1,837 with `c1 != U`.
- All 41 focused grid and order-producer tests pass.  The complete shared SMT
  adapter test target also passes, for 135 combined tests.
- Ruff and `git diff --check` pass for the producer, tests, runner, and spec.
- The worker limit is capped at 20 and both engines run through PIQD.
- SAT results require complete exact-rational local replay of ranks, distances,
  rows, the cap skeleton, the source strict form, and every Kalmanson form.
- The first run-0001 positive-control submission reached PIQD and returned SAT,
  but the repository adapter rejected the daemon's new `model_replay` field
  before local semantic acceptance.  No profile was submitted.  The adapter
  now validates that field's exact schema and binds its solver digest; run-0001
  remains immutable and run-0002 is the repaired successor.

## Claim boundary

This is conditional diagnostic computation.  The alias rules have not yet
been proved exhaustive for live Lean source instances.  A SAT result is an
unresolved abstract model until source realization is proved.  Discovery
UNSAT concerns only the authenticated SMT formula; it is not a checked proof
or a Lean closure result.

## Next checkpoint

Run both controls through PIQD, execute a small authenticated canary, measure
wall and CPU cost, and only then launch or revise the full 2,798-profile run.
