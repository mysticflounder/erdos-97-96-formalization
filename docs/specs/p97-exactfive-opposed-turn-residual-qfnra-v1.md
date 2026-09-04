# Exact-five opposed-turn residual QF_NRA lane

This lane is a bounded formula experiment over the six residual profiles
360, 363, 376, 467, 470, and 483 from the authenticated deterministic mine.
It consumes the authenticated 2,798-profile order run and the deterministic
mine run-0002.  The profile hashes, predecessor digests, quotient classes,
and fixed cyclic orders are recorded in the producer's semantic descriptor.

For each profile, the system uses the exact `B=c1` gauge

`c1=(0,0)`, `O=(1,0)`, `a=(1/2,-r)`, `c2=(3/2,-r)`, with `4*r^2=3` and
`r>0`.  Every remaining quotient class gets two free real coordinates.  The
source ledger retains all 13 row equalities, the radius disequality
`dist(c2,O)^2 != dist(c2,d)^2`, the strict source comparison
`dist(e,d)^2 < dist(e,a)^2`, and every strict positive signed area for every
increasing triple in the authenticated order.  Thus the area counts are 220
for 12 classes and 286 for 13 classes.

Queries are state-only QF_NRA journals.  They contain no solver assumptions.
Each query is sent through the maintained PIQD adapter with fresh Z3 and cvc5
sessions, exact readback, and semantic replay.  The descriptor is state-only:
`named_atoms` is empty, while the complete assertion ledger is retained in the
immutable state journal and semantic input.  UNKNOWN and transport loss
remain immutable inconclusive custody.  Resume rechecks the exact descriptor,
SMT and source payloads, artifact labels, create/append/solve/receipt/close
session records, reconciled solve when present, solver signatures, PIQD result
digest, effective outcome, and complete flat file inventory.  SAT replay is
rerun from the retained exact values.  A completed terminal is reconstructed
from all eight verified result trees before it is accepted, without creating a
transport object.  Result replay also requires the exact top-level and engine
key sets emitted by the pinned adapter; undeclared extension fields fail
closed.

The positive and negative controls belong to the lane design.  Runtime phases
have exact inventories: initialized, launched/partial, failed, and terminal.
Failures bind the exact retained result/tombstone inventory and cannot coexist
with a terminal.  Single-file event publication removes its own inode after an
exceptional write or sync only after rebinding that inode, and never unlinks a
substituted path.  `--init-only` creates and authenticates the run manifest
without contacting PIQD.  Timeouts are exact milliseconds in `(0, 3600]`.
The default CLI is silent on success and prints only errors to stderr;
`--verbose` emits compact JSON.

The experiment makes no claim of Euclidean source realizability, profile
coverage, Lean reachability, theorem closure, or promotion.  The previously
observed six-role projection is SAT, so this lane deliberately retains the
full quotient classes and source-ledger constraints rather than testing that
projection alone.
Its pristine governed output is run-0005.  Superseded initialized runs are
retained under the lane quarantine tree with custody receipts.  The run-0001
receipt explicitly marks its original bytes, scan commands, and move timestamp
unavailable; the run-0002 receipt rejects its old internally inconsistent
reference-scan record rather than reconstructing an outcome.  Run-0004 was
preserved move-only after fresh reference and process scans when the final
independent-audit repairs changed source and test bytes.
