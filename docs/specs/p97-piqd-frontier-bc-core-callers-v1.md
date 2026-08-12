# P97 PIQD frontier B/C-core callers v1

Status: implemented finite/local caller contract. This specification governs
only the B- and C-core Python callers under `census/frontier-packages/`; it does
not promote a Lean theorem or establish a universal P97 result.

## Solver selection and execution

All four callers (`b_core/run.py`, `b_core/smoke.py`, `c_core/run.py`, and
`c_core/smoke.py`) default to `--solver-backend piqd`. The only local-solver
route is the explicit `--solver-backend legacy-local` choice. There is no
automatic PIQD-to-local fallback. `--workers` accepts only `1`, and every gate
is submitted sequentially.

Each solver invocation authenticates a fresh package from the exact effective
DIMACS passed to that invocation. Thus caller-supplied extra clauses, the
DIMACS variable header, and unused-but-allocated auxiliary IDs are covered by
the package. The wrapper continues to return `CadicalResult`; the callers keep
their existing `RunInstance`, extra-clause, model-decoding, and SAT-cube paths.

## Finite/local package custody

The package captures the caller, encoder, encoding specification, and the
minimal existing finite-frontier sources named by the caller profile. A B run
also captures its producer contract. C packages capture the A-core dependency,
physical-apex boundary specification, and the two finite-frontier Lean source
files referenced by the live leaves. These snapshots establish source custody,
not source entitlement: a profile whose query has no theorem entitlement says
so explicitly.

The build ledger is chronological. B records its allocation watermark before
the query. C records the applicable prefix of base, DEL3 auxiliary, and C2
fresh-P/final-dimension allocations. The final query-materialization phase
binds the exact DIMACS hash and header. A complete variable map covers every ID
from `1` through the DIMACS header, including declared-but-unused DEL3 IDs.

The lane profile binds lane, unique query ID, wave ID, live leaf, finite schema,
cardinality scope, source theorem or explicit lack of entitlement, UNSAT query
polarity, and the closed finite/local claim.

## Proof artifacts and gates

Under PIQD, a requested `*.drat` path is a compatibility input only and is not
created, overwritten, or hashed as proof output. An UNSAT record instead binds
the fetched LRAT proof, kept CNF, proof clause map, generated Lean replay
source, replay receipt, and certified PIQD receipt. `proof_verified` is true
only after the concrete `LeanLratReplayer` succeeds.

Expected-UNSAT gates fail unless both the verdict is `UNSAT` and
`proof_verified is True`:

- B smoke: the full third-bisector obstruction;
- B run: every UNSAT record in the named-local production matrix;
- C smoke: the source-unit clash, DEL3 clash, C6.9 exclusions, and all named
  UNSAT probes;
- C run: C1 and C2. The process succeeds only when the base is SAT and both C1
  and C2 are verified UNSAT.

SAT gates do not require a proof certificate. No gate result by itself upgrades
the finite/local schema, source theorem, or Lean proof status.

## Offline verification

Run `scripts/test-p97-piqd-bc-core.sh`. It caps numerical and Rayon thread
counts at one, disables third-party pytest plugin autoload, uses one pytest
process, compiles the four caller modules, and runs only fake transport/replayer
tests plus Ruff checks. It does not contact a PIQD daemon or invoke a SAT
solver, Lean, Git, or a publication workflow.
