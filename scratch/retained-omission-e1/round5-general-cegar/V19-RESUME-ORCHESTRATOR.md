# V19 authenticated resume orchestrator

`run_v19_retry_matrix.py` resumes an incomplete one-case v17 or v19 exact-n15
artifact without treating solver output as a proof. It is preflight-only unless
`matrix --launch` is supplied.

## Admission boundary

A source is named as `summary.json::SHA256`. Before a child can run, the
orchestrator checks the outer digest, v17/v19 provenance, the exact embedded
result, frozen-formula blob, sorted 825-Bool universe, every replay record, and
all blockers in their original order. For the production v17 checkpoint this
reconstructs 64 blockers (45 equality-closure and 19 complete-assignment) and
requires the cumulative hash
`f5d7cd9cd5aee94e251777a9eb4ca39c0ba7327fbcdf56b4e4c51f7596bdb35c`.

The reconstructed blockers enter the Boolean master before its first check.
The v19 static equality-triangle bank is installed by v19 before proposals are
consumed. The first full proposal is audited against both banks. Children run
with niceness increment 10 and the matrix rejects worker counts above 24.

## Journal and recursive continuation

V19 writes immutable six-digit assignment-journal records. The resume validator
checks filename contiguity, sequence numbers, the previous-record chain,
payload and record hashes, exact proposal/outcome pairing, complete ordered
assignments, frozen-formula identity, and UNSAT blocker reconstruction. Every
completed outcome must agree with the incremental trace, including the full
check and blocker hashes.

A final proposed record without an outcome is an authenticated pending
assignment. A continuation exposes its full assignment and source journal head
in both `result.json` and the composed trace. On the next resume it is forced as
a temporary Boolean-master assumption before any fresh proposal; the proposal
guard independently checks that the full-theory call receives the same ordered
assignment. Assignments completed by the new journal are removed, and a newly
pending tail is appended. Thus imported blockers, new blockers, cumulative
hashes, and pending work survive repeated v19 continuations.

V19 normalized QF_LRA replays use a compositional identity rather than a hash of
serialized normalized SMT. Admission requires the exact identity scheme and
component set, current normalizer/specification hashes, formula and assignment
binding, nonnegative inventory counts, and equality between primary and fresh
replay identities.

## Checks

Focused tests are solver-local only and never launch a production child:

```bash
uv run --with pytest pytest -q test_run_v19_retry_matrix.py
```

The production v17 artifact can be checked without launching a solver:

```bash
uv run python run_v19_retry_matrix.py matrix \
  --workers 1 \
  --resume artifacts-v17-production1/20260802T142433.875648Z-case-pid61508/summary.json::$(sha256sum artifacts-v17-production1/20260802T142433.875648Z-case-pid61508/summary.json | cut -d' ' -f1)
```

Successful preflight or exhausted external search is not Lean closure. This
lane only authenticates and preserves finite CEGAR work for the stated exact-n15
case.
