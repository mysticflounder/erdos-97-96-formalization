# Rigid221 exact-five hard source-swap order PIQD audit

Status: complete conditional census; abstract SAT survivors remain.

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
  remains immutable.  The repaired successor is lane
  `exactfive-hard-source-swap-order-piqd-r2-20260902`, run-0001.

## Terminal result

Both controls passed in Z3 and cvc5.  The full 2,798-profile run completed in
1,103.60 seconds at 20 workers:

| Z3 / cvc5 | profiles |
|---|---:|
| `SAT / SAT` | 122 |
| `SAT / UNKNOWN` | 80 |
| `UNSAT / UNKNOWN` | 10 |
| `UNSAT / UNSAT` | 2,586 |

There was no SAT/UNSAT disagreement.  The terminal self-hash is
`6baab84ed88abc816965447f9b4f5ce90f62a7c90c8c4e777aa6496e6e62d9e2`.
A complete resume verification of all controls, formulas, source snapshots,
engine artifacts, and exact SAT replays reproduced that hash in 129.13
seconds without a solver call.

The daemon recorded 18,478.160 seconds of aggregate per-solve wall time
(about 5 hours 8 minutes before 20-way overlap).  This is the best available
CPU proxy because the daemon owns the solver children; it is not an exact
process-rusage total.  The launching client used 294.85 user seconds and 72.65
system seconds and peaked at 288 MB resident memory.

All 202 Z3 SAT readbacks and all 122 cvc5 SAT readbacks passed complete exact
local replay.  PIQD's additional model replay was retained as `UNDETERMINED`
because its fresh replay script does not reproduce the journal's helper
`define-fun` declarations; no daemon model-replay pass is claimed.

## Completed-wave mine

The order/equality-only terminal sought by the consult is false: 202 profiles
have abstract SAT countermodels, and 10 more remain unresolved.  All 312
ten-class profiles are eliminated, but survivors occur at every class count
from 11 through 15.

Six collision patterns occur in the input stream but in no unresolved profile:
`p=u`, `p=v`, `q=u`, `q=v` (313 input profiles each) and `t=x`, `t=y` (451
each).  These are concrete candidates for small selected-row/Kalmanson Lean
lemmas.  A bounded current-project theorem-bank search found the exact-grid
role and radial-order APIs but no theorem already proving these six
distinctness facts.

## Claim boundary

This is conditional diagnostic computation.  The alias rules have not yet
been proved exhaustive for live Lean source instances.  A SAT result is an
unresolved abstract model until source realization is proved.  Discovery
UNSAT concerns only the authenticated SMT formula; it is not a checked proof
or a Lean closure result.

## Next checkpoint

Preserve a `SAT/SAT` witness as a durable abstract countermodel.  Then test a
smallest 11-class survivor with genuine planar coordinates: squared Euclidean
row equalities, the source strict comparison, and strict signed-area
orientation for every ordered triple.  A planar survivor advances the lane to
MEC/minimality/blocker provenance; fixed-order UNSAT only rejects that one
order and cannot eliminate the profile without all-order coverage.
