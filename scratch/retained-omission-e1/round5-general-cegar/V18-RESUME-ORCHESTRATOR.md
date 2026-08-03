# Authenticated v18 resumable continuation

`run_v18_retry_matrix.py` resumes one or more incomplete v17/v18 exact-n15
cases without discarding their replay-authenticated CEGAR blockers. It is a
solver orchestrator and audit artifact, not a Lean proof and not a universal
P97 closure.

## Current production source

The focused source used during development is:

```text
artifacts-v17-production1/20260802T142433.875648Z-case-pid61508/summary.json
case: fresh_DDD_k0_d2_f1
blockers: 64 (45 equality-closure cores, 19 complete assignments)
cumulative blocker SHA-256: f5d7cd9cd5aee94e251777a9eb4ca39c0ba7327fbcdf56b4e4c51f7596bdb35c
```

The summary itself must be supplied as `PATH::SHA256`; an unpinned path is
rejected. The driver derives the case from that authenticated artifact and
cross-checks it against the ordered 67-case UNKNOWN projection of the pinned
v8 -> v10 source chain. It does not accept a caller-provided case identifier.

## What is authenticated before continuation

The preflight rejects any mismatch in:

- the outer summary digest and current v17/v18 provenance;
- invocation, embedded result, trace, and frozen-formula blob digests;
- exact case payload, frozen formula hash, sorted 825-Bool universe, and its
  digest;
- every signed assignment and projected core;
- every raw equality-core replay and both QF_LRA checks for each complete
  assignment;
- reconstructed blocker SMT, ordered blocker hashes, and the cumulative hash.

Blockers are reconstructed from their signed cores. Stored SMT text is checked
against that reconstruction but is never trusted as the executable clause.
The 64 clauses are installed in their original order after the inherited
Boolean prepass and before v18 installs its static triangle bank or performs
the first Boolean-master check. The frozen full-theory formula is not modified.

The first full-theory proposal, if one exists, is independently audited before
the theory solver sees it. It must satisfy all imported blockers and every v18
static triangle cut. A violation aborts the child rather than silently
rechecking an old assignment.

## Preflight (no solver production run)

From this directory:

```bash
SUMMARY=artifacts-v17-production1/20260802T142433.875648Z-case-pid61508/summary.json
SUMMARY_SHA=$(shasum -a 256 "$SUMMARY" | awk '{print $1}')
uv run python run_v18_retry_matrix.py matrix \
  --resume "$SUMMARY::$SUMMARY_SHA"
```

`matrix` is preflight-only unless `--launch` is present. The preflight prints
the exact selected case, resume blocker count, frozen input hashes, budget, and
worker policy.

The focused unit gate is also solver-production-free:

```bash
uv run --with pytest pytest -q test_run_v18_retry_matrix.py
```

It validates the production artifact, rejects trace/replay tampering, checks
all 64 runtime imports without calling `master.check()`, and exercises the
first-proposal guard with a deterministic assignment outside both banks.

## Authorized launch shape

Only after an explicit decision to spend solver time:

```bash
uv run python run_v18_retry_matrix.py matrix --launch \
  --workers 24 \
  --resume "$SUMMARY::$SUMMARY_SHA"
```

Each selected artifact produces exactly one child. Children are launched via
`nice -n 10`; the process pool rejects values outside `1..24`. The current
single resume therefore launches one child even when the global cap is 24.
Multiple independently authenticated resume summaries may be supplied by
repeating `--resume`, still under the same total cap.

Child and aggregate manifests are written atomically. A child is attested only
when its provenance, budgets, result hash, imported-blocker cumulative hash,
first-proposal audit, and combined continuation trace all agree. Any child
error, timeout, UNKNOWN, drift, malformed artifact, or missing attestation
keeps the aggregate fail-closed and incomplete.

The child's `cegar_trace_file` is the standard-schema combined trace, not just
the incremental suffix. It contains the authenticated imported blockers first,
then the newly replayed blockers in order, with cumulative hashes recomputed
over the whole sequence. A final SAT/UNKNOWN check is retained only at the end.
The raw incremental trace is preserved separately. Consequently an incomplete
v18 result can itself be supplied as the next pinned resume source without
forgetting the original 64 blockers.

## Trust boundary

SAT/UNSAT/UNKNOWN here is external computational evidence. Replay records and
hashes make continuation auditable and prevent lost work; they do not promote
the result to kernel-checked Lean. Any mathematical closure still needs the
project's normal certificate/Lean banking and transitive axiom audit.
