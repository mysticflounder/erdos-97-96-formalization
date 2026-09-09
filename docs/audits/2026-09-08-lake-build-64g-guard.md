# `lake-build` 64 GiB compiler guard

Status: **installed 2026-09-08 18:06 PDT; native-build gate evidence pending.**

Correction: the earlier audit did not inspect the live executable before
claiming installation. Until 18:06 PDT, `/Users/adam/.local/bin/lake-build`
was a symlink created at 17:07:59 PDT to the Sep 5 legacy plugin wrapper at
`/Users/adam/projects/claude-plugins/local-plugins/plugins/lean-usage/bin/lake-build`
(SHA-256 `562337218ad35c07983aac34b94cf56449e2af82d8ab63eecdcf9ed9c46f7717`).
That wrapper only has a per-worktree PID lock and no compiler gate. The
verified candidate was atomically installed as a regular global executable at
18:06 PDT with SHA-256
`820eb148ddcf615398c43781c4e75ba57339f01f9944489c2d734cbd3eca9623`; its
`--help` check succeeded immediately afterward. The current wrapper preserves
the old per-worktree top-level lock, so another worktree does not receive a
PID-lock notice; the host-wide two-slot compiler gate provides the resource
bound instead.

The host recorded four Lean crash reports on 2026-09-08 between 01:55 and
02:15 PDT. Each was a Lake child that aborted with `SIGABRT`; its crashing
frames are `lean::check_memory`, `lean::check_system`, and
`lean::ir::interpreter::check_system`. This is evidence of Lean reaching its
configured internal memory limit, not evidence of a Python heap leak. The
project's `lean/lakefile.toml` gives every module `-M16384` and a 2 GiB thread
stack. Lake may schedule several module compilers, while the old wrapper's
PATH shim could not affect them because Lake invokes Lean by absolute path.

The installed `/Users/adam/.local/bin/lake-build` has SHA-256
`820eb148ddcf615398c43781c4e75ba57339f01f9944489c2d734cbd3eca9623`.
The exact patch from the prior process-group-safe wrapper is retained as
base64 at `docs/audits/2026-09-08-lake-build-64g-guard.patch.b64` for a later
atomic restore; base64 decoding preserves the wrapper's significant whitespace.
It creates a disposable shadow Lean sysroot, tells Lake to resolve Lean through
it (`LAKE_OVERRIDE_LEAN=true`), and makes `shadow/bin/lean` acquire one of two
shared POSIX `fcntl` locks before it `exec`s the real compiler. The descriptors
survive `exec` and release when a compiler exits or is killed. The fixed
per-user lock directory is shared by wrapper invocations from every worktree.
The gate appends a final `-j1` and caps any wrapper-supplied `MEMORY_MB` at
16384 MiB. Thus wrapper-launched Lean compilers have at most two active slots,
or 32 GiB of configured Lean-memory budget, leaving substantial headroom under
the 64 GiB operational boundary.

The wrapper also starts Lake in its own session and retains the verified PGID.
On interruption or an unhandled output-draining exception it stops the complete
group, including descendants. If the Lake leader exits first, cleanup verifies
that the original group still exists before using the cached PGID; otherwise it
refuses the group signal.

Validation used no Lean or Lake build:

- the candidate wrapper AST parsed successfully;
- the installed wrapper matches the reviewed candidate byte-for-byte;
- `lake-build --help` exited successfully; and
- four inert shell stand-ins passed through the installed-byte candidate with
  an observed peak of exactly two active stand-ins. The retained result is
  `scratch/runs/lake-build-64g-guard-20260908/run-0001/artifacts/gate-inert-shell-test.json`
  (SHA-256 `ecfa901486118064499217b2e08075bb820496e45c4fcbb6c033b43764fac7a4`).
- decoding the retained replay patch and applying it to the prior
  process-group-safe wrapper reproduced the installed wrapper SHA-256. The
  retained result is
  `scratch/runs/lake-build-64g-guard-20260908/run-0001/artifacts/gate-replay-patch-test.txt`.
- a smoke check that was previously labeled guarded, but actually used the
  legacy wrapper, for
  `Erdos9796Proof.P97.Census554.CapSelectedNativeClosureSound:olean` exited
  successfully after recompiling 113 modules in 32 seconds. It validates the
  target but not the gate. Its wrapper build ID is
  `70725-1788908519592108000`; retained output is
  `scratch/runs/lake-build-64g-guard-20260908/run-0001/artifacts/guarded-wrapper-smoke-003.log`.
- the formerly outer-timeout-bound native leaf
  `Erdos9796Proof.P97.ErasedCertificate.P2Placement10AFirstPart1Native:olean`
  built through the legacy wrapper in 2,189 seconds (36m32s), exit 0,
  recompiling one module without `check_memory` failure. It validates that
  migration target, but not the gate. Its wrapper build ID is
  `78253-1788908603696729000`; retained output is
  `scratch/runs/mathlib-v4331-takeover-20260908/run-0001/artifacts/native-p2-firstpart1-guarded-001.log`.
- its paired native leaf
  `Erdos9796Proof.P97.ErasedCertificate.P2Placement10AFirstPart2Native:olean`
  also built through the legacy wrapper in 2,214 seconds (36m54s), exit 0,
  recompiling one module without a `check_memory` failure. It validates that
  migration target, but not the gate. Its wrapper build ID is
  `11869-1788910844479872000`; retained output is
  `scratch/runs/mathlib-v4331-takeover-20260908/run-0001/artifacts/native-p2-firstpart2-guarded-001.log`.

This gate applies only to invocations through the installed wrapper. It does
not constrain manually started Lean processes or legacy scripts that call
`lake env lean` directly. It is a compiler-concurrency and internal-memory
bound, not a proof of whole-machine resident-memory usage. No new Lean build
should bypass this wrapper.
