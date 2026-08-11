# P97 PIQD projected-static-v3 production launcher v1

## Status and boundary

This specification defines the qualification-v2 gate used by
`scripts/run-p97-piqd-projected-v3-production.py`.  A complete, internally
consistent, sealed authority profile is validated before the launcher delegates
the unchanged argument vector to the existing projected-static-v3 driver.  A
missing, malformed, stale, or unsafe profile fails closed before output,
transport, or solver work.

This is adapter qualification infrastructure, not a P97 proof result.  It does
not establish that a live PIQD/solver/local-proof deployment has been
onboarded.  The existing direct CLI and Python API remain legacy/diagnostic
interfaces with local discovery defaults; they are not production entry
points.

## Command contract

```text
python scripts/run-p97-piqd-projected-v3-production.py \
  --out OUT \
  --workers 1 \
  --parallel-mode sequential \
  --projected-static-v3 \
  --persistent-discovery \
  --piqd-base-url URL \
  --piqd-journal-root OUT \
  --piqd-source-manifest SOURCE_MANIFEST \
  --piqd-producer-manifest PRODUCER_MANIFEST \
  --piqd-producer-job-id PRODUCER_JOB_ID \
  --piqd-solver-name SOLVER_NAME \
  --piqd-qualification-authority AUTHORITY_V2
```

All displayed inputs are mandatory.  `--piqd-journal-root` must equal
`--out`, so the driver CNF, incremental journal, and qualification evidence
share one authenticated custody root.  The launcher requires exactly one
worker, sequential scheduling, projected-static-v3, and persistent discovery.
It rejects local-only discovery, resume, cube batching, fixed-shard runs,
shard verification, and shard-local simplification.

Token-shape rejection happens before filesystem reads.  For a complete shape,
the launcher parses the underlying CLI and reads only the authority plus the
two static manifests needed for offline authority validation.  Those bounded
captures reject symlinks and non-single-link inputs.  It does not create `OUT`,
contact PIQD, or invoke a solver before that validation succeeds.  It then
delegates the exact original argument vector.

## Sealed authority

The canonical `p97-piqd-projected-static-v3-production-authority/v2` object
binds:

- its own canonical SHA-256;
- daemon URL and the SHA-256 of the authenticated pre-run `/version` bytes;
- source-manifest and producer-manifest bytes;
- stable base-CNF SHA-256 and the raw-DIMACS identity at core limit one;
- producer job UUID;
- solver name, SHA-256, signature, backend, and lane; and
- the exact immutable production policy.

The daemon binary identity is not a repository-wide hard-coded value.  It is
the identity in the sealed authority and must match the captured pre-run
version object.  Finalization requires byte-for-byte equality of the complete
post-run version object with that pre-run object.

The exact policy requires one worker, sequential projected-static-v3,
persistent discovery, a fresh one-session run, dense solve indices,
append/solve event order, and literal `proof_path=None` for PIQD discovery.
Resume, shards, cube batching, and every proof or closure claim are false.

## Qualified lifecycle

Before opening a session, qualification-v2 authenticates the static manifest
pair, stable `base.cnf`, raw-DIMACS identity, producer job and base-CNF blob,
solver registry identity, and pre-run daemon version.  It writes canonical
preflight custody only after all bindings agree.  The runtime `.solver.cnf`
must be an append-only extension of `base.cnf`.

The qualified transport permits one fresh session and an arbitrary finite
sequence of nonempty clause appends and assumption-free `SAT`, `UNSAT`, or
`UNKNOWN` solves with dense indices.  Its event sequence must exactly match the
hash-chained driver journal, and every journal event must have its exact schema
with no unknown fields.  Finalization reparses that journal from the stable
base, reconstructs the final frontier, and requires the runtime CNF to equal it
exactly.

The driver performs one public close.  If the DELETE response is lost, the
existing generic recovery first observes the session; it accepts an already
closed session, or retries the idempotent DELETE only if the session remains
live.  Qualification accepts exactly one confirmed closed-state observation.

Only a successful driver status whose final PIQD observation is terminal,
assumption-free `UNSAT` can produce a consumable seal.  After close,
finalization records the exact solve count, ordered statuses, final frontier,
runtime CNF hash, close evidence, driver status, and post-run version.  The
session result is written before the qualification seal; the seal is installed
atomically last.  `UNKNOWN`, errors, interrupted or incomplete runs, version
drift, custody drift, and journal/runtime disagreement preserve existing
forensic files but emit no qualification seal.

## Solver and proof semantics

PIQD remains observational discovery and always receives literal
`proof_path=None`.  An observational PIQD `UNSAT` may invoke exactly one fresh
local terminal rerun on the exact terminal CNF.  Only the existing local DRAT
production and verification path supplies the terminal proof boundary.
`UNKNOWN`, transport failures, and solver errors have no local discovery
fallback.

The projected-v3 normalization seam independently enforces the exact receipt
key allowlist and exact builtin scalar/container types.  It receives the
authenticated frontier variable count and clause sequence from the live
generic runner, recomputes both the raw journal identity and the distinct
frontier identity, and then recomputes the status-specific result digest.  A
`SAT` result must carry a total model that replays every frontier clause; an
observational `UNSAT` must have empty assumptions, an exact empty core, and no
interruption; `UNKNOWN` must carry neither a model nor a core and may only name
a nonempty builtin interruption reason.  Missing, extra, crossed, malformed,
or re-signed receipt evidence fails closed at this P97 adapter boundary.  This
is defense-in-depth over the generic PIQD adapter, not a PIQD daemon change.

Every PIQD/session/journal/seal claim records proof verification and closure as
false.  A qualification seal is evidence that the adapter lifecycle matched
its authority; it is not a solver proof, Lean proof, global obstruction, or
universal theorem entitlement.  This work does not claim that the local
terminal-proof deployment has been onboarded or live-qualified.

## Historical canary compatibility

The canary remains its frozen policy, not a generalized production run: the
historical first observation is `SAT`, then the exact clause `(91)` is
appended, followed by one assumption-free terminal `UNSAT`.  Its existing
canary schemas, artifacts, two-solve finalizer, and direct test API are
unchanged.  Qualification-v2 is a separate authority and seal namespace.

## Proof-frontier relevance

Proof-blueprint session `019fdf9c` remains anchored at
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier`.  The anchor
is unchanged, open, and off-spine.  This implementation discharges no Lean
obligation and proves no P97 theorem.

## Verification

Focused tests use one pytest process and capped numerical-library threads.
They use fake transports only and run no live daemon, solver, Lean, or Git
operation:

```text
env OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1 \
  NUMEXPR_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1 PYTHONPATH=. \
  uv run --with pytest pytest -q \
  census/p97_search/tests/test_phase3_piqd_projected_v3_qualification.py \
  census/p97_search/tests/test_phase3_piqd_incremental_v3.py \
  census/p97_search/tests/test_phase3_structural_cegar_projected_static_v3.py \
  census/p97_search/tests/test_phase3_piqd_projected_v3_production_launcher.py

uv run --with ruff ruff check \
  census/p97_search/phase3_piqd_projected_v3_qualification.py \
  census/p97_search/phase3_piqd_incremental_v3.py \
  census/p97_search/phase3_structural_cegar_projected_static_v3.py \
  scripts/run-p97-piqd-projected-v3-production.py \
  census/p97_search/tests/test_phase3_piqd_projected_v3_qualification.py \
  census/p97_search/tests/test_phase3_piqd_incremental_v3.py \
  census/p97_search/tests/test_phase3_structural_cegar_projected_static_v3.py \
  census/p97_search/tests/test_phase3_piqd_projected_v3_production_launcher.py
```
