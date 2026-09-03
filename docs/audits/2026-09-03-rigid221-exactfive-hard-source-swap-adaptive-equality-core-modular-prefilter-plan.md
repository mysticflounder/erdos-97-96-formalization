# Adaptive equality-core modular prefilter plan — 2026-09-03

Status: implementation and launch plan. No target computation has been
launched.

## Objective

Build a fresh PIQD-only Singular lane over `GF(32003)` that compares `slimgb`
and `std` on the unchanged 18-variable, 13-polynomial equality systems for both
authenticated affine gauges. The result may select a later basis route; it
does not support a `QQ`, source, theorem, or Lean conclusion.

## Preconditions

- Revalidate the completed characteristic-zero equality-core run and durable
  summary by exact file and self-hashes.
- Require its completed local replay to instantiate no transport.
- Reconstruct both target systems through the current characteristic-zero
  producer and preserve the shared template.
- Bind the existing lane checkpoint with base head
  `24f982d5e1d56525719cc6b499e044451ea921ac`.

## Execution plan

1. Run four `slimgb` controls sequentially with expected diagnostics
   `UNIT`, `NONUNIT`, `UNIT`, `NONUNIT`.
2. Run gauge `z3` with `slimgb`, then `std`.
3. Require agreement when both gauge `z3` runs complete.
4. Run gauge `cvc5` with `slimgb`, then `std`.
5. Require agreement when both gauge `cvc5` runs complete.
6. Select a completed command per gauge by lower authenticated `wall_ms`, then
   smaller basis size.
7. Fail without a terminal on any control defect, transcript defect, or
   within-gauge disagreement; record four target timeouts as
   `MOD_ALL_TIMEOUT`.
8. Publish an immutable terminal only after exact artifact-inventory replay.

All queries use `GF(32003)`, `dp`, one PIQD worker, deterministic request IDs,
and no inequalities, saturation, local solver, fallback, `lp`, or elimination.

## Verification before launch

- Focused tests cover transcript tampering, invalid UTF-8, stderr, truncation,
  predecessor hash drift, source-context drift, control failure, timeout
  handling, algorithm disagreement, route selection, canonical event bytes,
  parent-directory symlinks, bounded marker integers, immutable inventories,
  and completed no-transport replay.
- Ruff must pass on the producer, tests, and CLI wrapper.
- The read-only worktree hygiene report must accept the lane checkpoint.
- Sandbox loopback restrictions, if observed in backend integration tests, are
  reported as environment failures and do not justify weakening a test.

## Stop boundary

This checkpoint ends after implementation, local verification, and manifest-only
initialization of the governed run root. The run manifest has internal hash
`825ea7ab1da5d3471af460027dca52fc8e010af2f60730be225a100d77b5f9e3` and
file SHA-256
`0cac96a2c73548ff1fdfa2eb55f249c9be8ef1f9ce2cd9fe3a06a3dc0cacd129`.
The `artifacts`, `events`, and `tmp` directories are empty. No launch record,
terminal record, PIQD request, or Singular computation was created.
