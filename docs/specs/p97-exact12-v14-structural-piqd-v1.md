# P97 Exact12 v14 structural PIQD route v1

This route is a finite, local-discovery boundary for one normalized v14 cell.
It carries no source-entitlement, theorem-coverage, universal-lift, or Lean-
closure claim.

The maintained public static runner receives the exact current DIMACS bytes
through its public `Path, timeout, proof_path` callable. The discovery adapter
must pass literal `proof_path=None`, install a content-addressed descriptor,
authenticate the source and producer manifests, and retain the runner's
receipt/custody artifacts. At this adapter boundary, the receipt is required to
be the exact canonical static-runner schema and hash, with matching CNF,
source/producer, backend/job identity, terminal, and false-claim fields. The
maintained custody validator then authenticates the receipt file, driver seal,
inode inventory, and content-addressed CNF/source/producer artifacts; a
receipt, artifact, or custody mismatch is rejected. SAT assignments are
replayed against the complete current CNF before a cube is decoded. PIQD
`UNKNOWN`, transport failure, receipt/custody failure, or malformed output is
fail-closed and cannot invoke a local solver.

The descriptor is content-addressed and immutable for the call. The adapter
captures its regular-file device/inode and bytes before invoking the runner,
then recaptures both after runner completion; rewrite, replacement, symlink,
or byte changes are rejected before any verdict is accepted.

The only proof-producing boundary is caller-owned: an observational PIQD
`UNSAT` permits exactly one fresh local CaDiCaL run with a DRAT path. The
coordinator accepts that terminal result only when the proof is verified and
the terminal CNF bytes hash identically to the discovery CNF bytes. The local
rerun is not PIQD fallback and does not promote the finite result to a theorem.

Execution is one worker in sequential mode. The command-line default is
`--solver-backend piqd`; `--solver-backend legacy-local` is an explicit
diagnostic route. Offline tests use injected fake runner/transport objects and
never contact a daemon or execute a solver.
