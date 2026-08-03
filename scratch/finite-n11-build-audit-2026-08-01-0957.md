# FiniteN11 build outcome audit

Final audit: 2026-08-01 10:53:13 -0700 (PDT)

## Outcome

**SUCCESS.** The invocation

`./scripts/lake-build.sh Erdos9796Proof.P97.FiniteN11`

completed with caller status `BUILD_EXIT=0`. The original caller PID 76139, wrapper PID/PGID 76883, and Lake PID 76970 had all exited by the final audit.

## Exact authoritative evidence

Captured caller output:

`/private/tmp/claude-1000/-Users-adam-projects-math-projects-erdos-97-96-formalization/281ec28c-723e-49c0-bb6d-1a22552c5d26/tasks/b142i2ttg.output`

Terminal lines 39--41 are:

```text
✔ [11957/11957] Built Erdos9796Proof.P97.FiniteN11 (6.2s)
Build completed successfully (11957 jobs).
BUILD_EXIT=0
```

The output file mtime is 2026-08-01 10:52:05 -0700 and its size is 2309 bytes.

The successful target artifacts were rewritten at the same terminal time:

- `lean/.lake/build/lib/lean/Erdos9796Proof/P97/FiniteN11.olean`: 2026-08-01 10:52:05 -0700, 108488 bytes.
- `lean/.lake/build/lib/lean/Erdos9796Proof/P97/FiniteN11.ilean`: 2026-08-01 10:52:05 -0700, 6730 bytes.

`Phase3MetricCertificateBank` was accepted from its existing current Lake artifact rather than rebuilt in the final step:

- source: 2026-07-31 15:21:47 -0700;
- `.olean` and `.ilean`: 2026-07-31 16:08:51 -0700.

The project-local `scripts/lake-build.sh` directly invokes `lake build` and does **not** write Lean-usage JSONL stats. Accordingly, `/Users/adam/.local/state/lean-usage/build-stats.jsonl` and `module-build-stats.jsonl` remained at 2026-08-01 07:25:27 -0700 and contain no record for PID 76883. Their absence is not contrary evidence; the caller's `BUILD_EXIT=0` and Lake's terminal success line are authoritative for this invocation.

## Concurrency note

At 10:52:10, five seconds after this run finished, a different wrapper PID 33781 acquired `lean/.lake/lake-build.lock` for `./scripts/lake-build.sh Challenge Solution`. The current lock containing `33781` belongs to that later invocation, not to PID 76883. No process was signalled or started by this audit.

## LSP diagnostic refresh

Now refresh/re-request file diagnostics for:

`lean/Erdos9796Proof/P97/Phase3MetricCertificateBank.lean`

The FiniteN11 build establishes that Lake accepted this module in the target's dependency closure, but the captured `tail -40` contains no file-local Phase3 diagnostic block because that module was not rebuilt. The LSP refresh should therefore verify the editor buffer against the completed dependency graph; expect no build error, while treating any displayed file-local warnings as separate diagnostics to report exactly.
