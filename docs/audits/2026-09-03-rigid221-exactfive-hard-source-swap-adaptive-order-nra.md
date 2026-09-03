# Adaptive order/NRA lane implementation audit — 2026-09-03

Status: implementation only; no solver run has been launched.

## Scope completed

The new wrapper is implemented at
`census/card_head/exactfive_hard_source_swap_adaptive_order_nra_piqd.py`, with
its CLI entry point, focused tests, and versioned specification. The frozen
structural order producer and frozen fixed-order NRA producer were imported
without modification.

The implementation provides:

- authenticated profile-1697 loading;
- the two prior NRA orders as exact full-permutation `ENUMERATION_CONTROL`
  blocks appended to the old structural formula;
- exact old-formula replay plus explicit blocked-order rejection;
- verified-result-only fresh-order extraction, deterministic deduplication, and
  a two-order cap;
- dynamic reconstruction and current-system validation of the coordinate
  QF_NRA query;
- self-hashed linear-origin records binding query, result, engine, semantic
  replay, model, values, and order digests into each planar query;
- structural and planar positive/negative controls;
- strict integral-millisecond timeouts and worker bound `1..2`;
- checkpoint-bound immutable manifest, launch, and terminal records;
- complete adapter-artifact replay, including session identity/frontier,
  exported journal, pre/post receipts, solve/model-replay schema, receipt/result
  digest binding, reconciliation, close state, and semantic artifact binding,
  with structural `UNDETERMINED` allowance and planar `SATISFIED` requirement;
  and
- no-solver completed resume with partial/unbound-output rejection.

An adversarial custody review found and the implementation repaired six
pre-run defects: opaque PIQD artifacts were only hashed, solve/model-replay
schema was underchecked, checkpoint self-authentication was not enforced,
extra `events/` and `tmp/` output was accepted, the alias-grid producer was
absent from the run manifest, and an explicitly supplied empty structural
system selected the default target. Regression tests now exercise those
boundaries. Re-audit found one remaining semantic-replay schema gap; exact
verifier/model/value binding and a both-copies tamper regression now close it.

## Claim audit

All public claim flags remain false. The implementation labels the two initial
blocks as enumeration controls and records zero semantic refinements. Terminal
statuses separate no fresh SAT, target results, structural/planar UNKNOWN, and
structural/planar cross-engine disagreement. The terminal claim boundary is
`diagnostic fixed order cells only`.

The full ENCODED / OMITTED ledger and CEGAR boundary are recorded in
`docs/specs/p97-exactfive-hard-source-swap-adaptive-order-nra-v1.md`.

## Execution state

No PIQD transport was constructed for this audit and no solver call was made.
The checkpoint-bound `run-0001` directory and its self-hashed
`worktree-run-manifest/v1` were initialized solely to satisfy the declared-root
hygiene contract. There is no launch record, adapter query artifact, terminal
record, or durable computation summary. The first permitted execution remains
bounded to that initialized `run-0001` namespace.

The focused producer/adapter suite passes (`154 passed`) and Ruff passes on the
new producer, tests, and runner. Those static checks do not constitute a solver
run or mathematical result. Lane hygiene reports zero owned-path issues after
removing the nonexistent pre-run summary from this implementation checkpoint;
the real post-run summary will be governed by a separate publication
checkpoint.
