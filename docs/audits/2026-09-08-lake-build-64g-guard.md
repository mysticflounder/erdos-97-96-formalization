# `lake-build` 64 GiB compiler guard

Status: **installed; Lean builds remain paused pending a wrapper-only smoke
check.**

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

This gate applies only to invocations through the installed wrapper. It does
not constrain manually started Lean processes or legacy scripts that call
`lake env lean` directly. It is a compiler-concurrency and internal-memory
bound, not a proof of whole-machine resident-memory usage. No new Lean build
should start until a wrapper-only target smoke check is deliberately scheduled.
