# Scratch pattern bank (2026-08-16)

A durable SQLite bank for candidate patterns mined out of the `scratch/` solver
corpus, at `data/p97-pattern-bank.db`, managed by `scripts/pattern_bank.py`.

**Nothing in this bank is a theorem.** Every row is an observation about solver
output plus a *candidate* universal statement someone might try to prove. The
`confidence` and `verdict` columns record how much scepticism has been applied,
not how true the statement is. Promotion still requires a source-level producer
and a kernel-checked consumer, per the
[closure evidence status ledger](closure-evidence-status-ledger-2026-08-05.md).

## Why it exists

Every prior mining pass over `scratch/` was a fixed-pattern Python script: it
searched for a shape its author already suspected, wrote a one-off report, and
left no queryable residue. Two costs followed. Structure nobody thought to look
for was never found, and each new wave re-derived the same encoder artifacts
because no record said "this was already checked and it was a property of the
generator, not the geometry".

The bank fixes the second cost. Open-ended LLM mining addresses the first.

## Scope of the corpus

`scratch/` holds roughly 655 GB across ~968,000 files. Most is not mineable:
build output under `.lake/`, vendored trees, and whole duplicate repository
copies under `rigid221-sourceheavy-anchor/exact-sha-worktrees/` and
`*-source/scratch/`. After excluding those and capping file size at 4 MB, the
mineable layer is about **68,800 files** — jsonl ledgers, journals, markdown
reports, tsv censuses, and logs.

## Schema

| Table | Holds |
|---|---|
| `mine_run` | one row per mining wave: run id, workflow, source path, ingest time |
| `cluster` | one row per lane cluster within a run, plus its `dead_patterns` note |
| `pattern` | a candidate: observation, candidate statement, evidence, sample size, encoder check, obstruction bucket, falsification test, confidence |
| `verdict` | the adversarial result for a pattern: killed or survived, and why |
| `obstruction` | the seven live proof-frontier obstructions, seeded at `init` |
| `v_live_pattern` | view: patterns no verdict has killed, with a `tested` flag |

Two columns carry most of the weight.

`encoder_check` is mandatory content, not decoration. The dominant failure mode
in this corpus is mistaking a property of the generating Python for a property
of the geometry: if a script can only emit records where a field is zero, then
"that field is always zero" is a fact about the script. A candidate whose
`encoder_check` does not name a generator that was actually read is worthless.

`obstruction_bucket` links a candidate to the live frontier. The buckets come
from the 2026-08-16 triage of the 36 open on-spine obligations:

| Bucket | Obstruction |
|---|---|
| 0 | speaks to no currently open obstruction |
| 1 | pentagon / off-class bisector saturation |
| 2 | missing six-centre / cross-row incidence producer |
| 3 | missing global cyclic-order / full-row metric classifier |
| 4 | missing centre-carrier coincidence or K4-survival-square exclusion |
| 5 | missing endpoint-parametric card≥13 incidence producer |
| 6 | missing global B1 centre-transport producer |
| 7 | missing unbounded-n counting/incidence argument |

## Usage

```bash
uv run python scripts/pattern_bank.py init
uv run python scripts/pattern_bank.py ingest \
    --run-output <workflow-output.json> --run-id <run-id>
uv run python scripts/pattern_bank.py stats
uv run python scripts/pattern_bank.py list --live --bucket 5
uv run python scripts/pattern_bank.py list --min-confidence plausible-invariant
uv run python scripts/pattern_bank.py show <handle>
uv run python scripts/pattern_bank.py export --format md --out <path>
```

`ingest` accepts either a raw workflow task-output file or its inner `result`
object. Re-ingesting the same `--run-id` replaces that run rather than
duplicating it, so a re-run after editing post-processing is safe. Verdicts are
matched to candidates by handle; a verdict naming an unknown handle is counted
as an orphan and reported on stderr rather than silently dropped.

A killed pattern stays in the bank. That is the point: the record of *why* a
pattern died is what stops the next wave from re-proposing it.

## Lane

Owned by lane `scratch-pattern-bank-20260816`
(`.codex/worktree-checkpoints/scratch-pattern-bank-20260816.json`). Owned paths
are `scripts/pattern_bank.py`, `scripts/test_pattern_bank.py`, and this
document; `data/p97-pattern-bank.db` is the declared durable artifact.

Tests: `uv run pytest scripts/test_pattern_bank.py`.
