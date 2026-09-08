# `lake-build` crash-safety audit

Status: **builds paused**.

The latest two-target native-certificate invocation used global
`/Users/adam/.local/bin/lake-build` (PID 26250). Its Lake log ends at job
9004 of 9010, after replay messages and before a `Building`, `Built`, or
`lake build exited` record. The lock survived and no matching wrapper stats
record exists. No Python, Lake, or Lean process remains alive.

This does not prove that `lake-build` crashed the host. It does prove that the
wrapper did not receive a normal completion path and cannot account for the
interruption from its own retained record.

Two verified safety defects make further native builds unsafe:

1. The wrapper's PATH-based memory shim does not affect Lean workers: Lake
   launches the compiler through its absolute toolchain path.
2. On a signal the wrapper terminates only its direct Lake child. It neither
   creates an isolated Lake process group nor kills and reaps compiler
   descendants. A terminated wrapper can therefore leave worker processes
   behind.

The retained run contains a minimal process-lifecycle repair: the Lake child
becomes its own session leader; on interruption the wrapper signals only that
verified process group, waits, then uses SIGKILL only if it remains alive. The
candidate passed a no-Lean test that launched and reaped a shell with one
descendant.

The repair was atomically installed into the global wrapper after verifying the
pre-image SHA-256 `562337218ad35c07983aac34b94cf56449e2af82d8ab63eecdcf9ed9c46f7717`.
The installed wrapper SHA-256 is
`2550c2a19af515015ea203a1851bbf05e01c756112b3c11b7c062951d6ae28e7`.

This repair does not enforce a memory or compiler-concurrency cap. Lake 4.33
lacks a supported hard job-count control, so native-certificate builds remain
paused until a separate resource policy is in place.
