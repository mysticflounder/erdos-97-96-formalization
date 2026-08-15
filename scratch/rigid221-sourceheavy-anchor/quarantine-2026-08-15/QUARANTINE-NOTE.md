# Quarantine note — 2026-08-15

Owner: terminal-custodian (exact-12 Rigid221 all-order-common-five lane).

## What

- `phase3_piqd_structural_seed.py` (moved from `census/p97_search/`)
- `test_phase3_piqd_structural_seed.py` (moved from `census/p97_search/tests/`)

Both files were untracked; this is a move-only quarantine, no history
rewrite and no deletion.

## Why

The pair admits one source-derived PIQD classifier as a replayable
structural seed. Its fixtures pin `source_job_sha256` to a bound job
that is no longer the canonical Exact12 bound job; the focused test run
is 10 failed / 10 passed for that reason (cleanup finding, convo #6719).
No live code imports the pair; the only other references are the dated
audit `docs/audits/p97-cegar-process-audit-2026-08-08.md` and two
scratch search dumps.

No PIQD canary, successor formula, or solver wave is authorized on the
exact-12 lane. Reauthenticating the fixtures now would prepare an
unauthorized wave and the pin would drift again before use.

## Reauthentication condition

If a PIQD canary or wave is later authorized for this lane, regenerate
the fixture pins against the then-current canonical Exact12 bound job
and rerun the focused test file before moving the pair back under
`census/p97_search/`.
