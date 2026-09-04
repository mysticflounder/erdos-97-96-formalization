# Exact-five opposed-turn residual QF_NRA prelaunch audit

## Verdict

NOT CERTIFIED. The six target formulas pass the mathematical encoding audit,
and no PIQD session exists for this lane. Launch remains blocked by a reused
run root and several fail-closed custody gaps.

The implementation audited here has SHA-256
`774f93bd3c413f31f4a6df2f924f3bf862ba4cf63c7bcd045643c0d323db2a9c`.

## Mathematical encoding: pass

All six selected cells are authenticated against the completed 2,798-profile
order run and the completed deterministic profile mine. Each selected Z3 cell
is SAT, semantically replayed, nonmatching, and has the exact frozen cyclic
order recorded by the producer.

The profile-local role map is correct in every target: `B=c1=c002`,
`O=c001`, `c2=c003`, `a=c004`, `u=c008`, `v=c009`, and `U=c000`. Profiles
360 and 467 have 12 quotient classes and 220 increasing-triple area
constraints. Profiles 363, 376, 470, and 483 have 13 classes and 286 area
constraints. Every frozen order is an exact permutation of its quotient
classes.

The orientation and gauge are source-valid:

```text
c1 = (0,0)
O  = (1,0)
a  = (1/2,-r)
c2 = (3/2,-r)
4*r^2 = 3
r > 0
```

For every target, the authenticated order places `c2 < O < c1`, and every
increasing triple is emitted with strictly positive signed area. No emitted
area polynomial is identically zero.

The complete 13-entry source row ledger is present:

- `T0`: replacements `d`, `c1`, `p`, `q`;
- `K1`: replacements `a`, `s`, `t`;
- `K2`: replacements `a`, `u`, `v`; and
- `L`: replacements `e`, `x`, `y`.

The remaining source constraints have the right directions:
`dist(c2,O)^2 != dist(c2,d)^2` and
`dist(e,d)^2 < dist(e,a)^2`. Fresh SAT handling requests both engines' full
coordinate readback. Rational readback is substituted through the original
row, area, normalization, radius, and strict-comparison ledgers. Unsupported
algebraic readback is rejected and remains inconclusive.

The positive square control passes exact replay. The reflected negative
control violates its required positive order and is designed to be UNSAT.

## Transport and current runtime state

The target code contains no direct solver process invocation. Its only solver
transport is the maintained `UrllibPiqdTransport`, with pinned engine order
`z3`, then `cvc5`. The maintained adapter treats UNKNOWN, rejected SAT replay,
and unreconciled transport loss as inconclusive.

A read-only PIQD `/sessions` inventory found zero sessions matching the exact
16 labels for the two controls and six targets. The current run root contains
only the root, `artifacts`, `events`, `tmp`, and `run_manifest.json`; no launch,
result, failure, or terminal record exists. An init-only replay exited zero,
printed nothing, and left both content and metadata unchanged.

## Blocking defects

1. **`run-0001` has lost create-once provenance.** The directory birth time is
   2026-09-03 15:49:29 local, while the current manifest was created at
   16:00:06. The first reported manifest self-hash was
   `764277114b141b9f2ea7951c14085de068a19fb48744b58c29c3da8e18c2bd82`;
   the current manifest self-hash is
   `a6d221404021510a911e22d9050bd890e47560252297902d353786e05753ef2f`.
   No quarantine receipt or retained first manifest was found. The current
   root therefore cannot be certified. Quarantine it only after fresh
   reference and writer scans with a durable receipt, then rotate every
   root/checkpoint/spec/code pin to pristine `run-0002`.

2. **The implementation checkpoint is invalid for the hygiene schema.** Its
   `owned_paths` array is not sorted. The checkpoint must be repaired and
   rehashed as part of the `run-0002` rotation.

3. **Resume can accept an unauthenticated SAT result.** At lines 482-489, an
   existing result directory is loaded and passed to `_validate_result`.
   That validator, at lines 444-450, checks only engine order, raw-status
   membership, and control raw statuses. It does not require the result
   schema and custody map, exact source-manifest binding, effective status,
   or accepted semantic replay. A target result containing bare Z3/cvc5 SAT
   engine rows passes this validator. Resume must invoke the adapter's full
   immutable result verifier and reject any SAT cell without accepted exact
   replay.

4. **Terminal resume does not require the exact eight-query inventory.** At
   lines 475-481, a self-hashed terminal with the correct launch hash may omit
   result keys and still return successfully. Stored results are checked only
   by file hash; they are not fully revalidated. Require exactly the two
   controls plus six targets, validate each complete result, recheck engine
   identity and outcome custody, and reject any extra or missing artifact.

5. **Runtime inventory is type-safe but not exact.** `_inventory` rejects
   symlinks and hardlinked regular files but accepts arbitrary nested files and
   directories. Define strict phase-specific inventories for init, launch,
   partial/failure, and terminal states. Reject failure/terminal coexistence
   and all undeclared entries.

6. **Failure custody is not immutable-verifying.** `_write_failure` silently
   returns when `failure.json` already exists, without checking its schema,
   hash, manifest link, or contents. `main` catches only selected exception
   classes, so an ordinary exception can escape without a failure record.
   Validate any existing failure, capture ordinary exceptions after
   `BaseException` exclusions, and make terminal publication incompatible
   with a retained failure state.

7. **Outer publications lack an open-file post-write check.** `_publish_once`
   uses `O_EXCL`, flush, and `fsync`, then closes before `lstat` and reread. It
   does not `fstat` the still-open descriptor. Add open-descriptor type,
   link-count, mode, and size checks before close, followed by path reread.

8. **Per-query source custody omits execution-critical files.** `_snapshots`
   includes predecessors, dependencies, and the spec, but omits the lane
   producer, test, runner, and current run manifest. The outer manifest pins
   those sources, but the adapter's per-result source manifest does not. Add
   the execution-critical snapshots so an independently inspected SAT replay
   binds the exact verifier and run custody.

9. **Timeouts have no upper bound.** `run_campaign` rejects nonpositive and
   nonfinite values but accepts arbitrarily large timeouts. Add a documented
   hard maximum, and mutation-test both CLI and API bounds.

10. **The specification overstates assertion custody.** It says the descriptor
    retains sorted named assertion records, while `named_atoms` is deliberately
    empty. The formula does remain in the immutable state journal and semantic
    input, but the prose must state that actual mechanism.

## Validation performed

```text
PYTHONDONTWRITEBYTECODE=1 UV_NO_SYNC=1 uv run pytest -p no:cacheprovider -q census/card_head/tests/test_exactfive_opposed_turn_residual_qfnra_piqd.py
UV_NO_SYNC=1 uv run --with ruff ruff check --no-cache census/card_head/exactfive_opposed_turn_residual_qfnra_piqd.py census/card_head/tests/test_exactfive_opposed_turn_residual_qfnra_piqd.py scripts/run_exactfive_opposed_turn_residual_qfnra.py
PYTHONDONTWRITEBYTECODE=1 UV_NO_SYNC=1 uv run python scripts/run_exactfive_opposed_turn_residual_qfnra.py --init-only
```

Results: 9 focused tests passed; Ruff passed; init-only was silent and did not
mutate the existing tree. These checks do not discharge the blockers above.

## Audit lane

Audit lane:
`exactfive-opposed-turn-residual-qfnra-prelaunch-audit-20260903`.
Checkpoint self-hash:
`36db971d8b2b016799b2cfecdda465985f614a51e68d7eacfa18e1ea71ce8478`.
The sparse hygiene report validated this audit checkpoint with zero issues.
Its overall blocking state comes from unrelated shared-worktree state.

## Final re-audit certification — 2026-09-03, run-0005

**CERTIFIED FOR LAUNCH.** This section supersedes the historical prelaunch
verdict above for the pristine `run-0005` implementation. Certification is
limited to the two controls and six authenticated residual fixed-order
formulas; it makes no source-realization, theorem, Lean-closure, or promotion
claim. No target query or PIQD session was launched during this audit.

The certified producer has SHA-256
`47a1fbb12d337877197c0293694dcb1d38796b564161f491cef9b209db81a856`;
the focused test file has SHA-256
`17bcdad87e2f12dd3ff0226316daab6bf2d85b6dd74af6d7c36ab4d393bc1261`;
and the run manifest self-hash is
`c93b7bcf02abb8b90676470863aa8a60210652d6a2edea3ea5e70d93463c2deb`.
The audited repository revision was
`bdf0d8b4e4728aad8abf6c6d6c6dfc757b162d5c`.

The final re-audit independently checked the complete prior matrix:

- fresh `run_query` output is absent when handed to the adapter, and immutable
  resume performs no transport operation;
- descriptor, SMT, source payload, engine labels, session lifecycle, receipts,
  solve digest, solver signature, response-loss reconciliation, exact SAT
  replay, effective outcome, overall outcome, and flat result inventory are
  all reconstructed from retained bytes;
- extra result-object and engine-object keys are rejected;
- terminal resume reconstructs all eight adapter trees before any transport
  object can be created;
- initialized, launched, failure, and terminal inventories are exact, `tmp`
  must be empty, and failure custody cannot coexist with terminal custody;
- create-once publication handles short writes, fsyncs file and parent, removes
  only its own created inode after an exceptional write, and preserves a path
  substituted by another inode;
- timeout and worker bounds, execution-critical source snapshots, checkpoint
  ordering, predecessor custody, and quarantine history all pass; and
- all ten checkpoint, run-manifest, and quarantine self-hashes pass, and all
  40 current source/input digest pins match their files.

The genuine-adapter fixture suite passed all 32 focused tests in 10.74 seconds,
and Ruff passed. Manual mutations confirmed that extra result and engine keys
are rejected. The exceptional-write cleanup and substituted-path probes also
passed. A silent `--init-only` replay left the five-entry run tree byte- and
metadata-identical, with snapshot digest
`892430b1c5c7255e554363de5f4885ed873a8cecfe2d5840943ceb240cf61b38`.
A read-only PIQD inventory found zero sessions matching the 16 exact current
query labels.

The implementation-lane sparse hygiene report found zero lane issues. Its
overall blocking flag reflects foreign shared-worktree entries, not a defect in
this lane.
