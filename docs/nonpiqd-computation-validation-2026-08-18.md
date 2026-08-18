# Non-piqd computation validation campaign (2026-08-18)

Status: Stages 1 and 2 complete. Stage 3 not started. This document makes no
mathematical closure claim.

Almost all solver and census work now routes through the piqd daemon, which
gives a result a content-addressed CNF blob, a recorded solver invocation, an
idempotent identity hash, and a byte-identical DRAT replay for a terminal
UNSAT. Output written before or outside that route has none of it.
`p97-piqd-remaining-solver-onboarding-plan-2026-08-09.md` classifies every
active *caller*; this campaign validates the *output* those callers wrote.

Scope: the git-tracked durable artifacts under `scratch/`, `census/` and
`certificates/` — 22,340 files, 3.42 GB — plus the untracked inputs they name
by hash. Tracked scope is deduplicated by construction; the whole-repository
copies that inflate filesystem counts are not tracked.

## Tools

### `scripts/audit_nonpiqd_custody.py` — Tier 0, custody survey

```bash
uv run python scripts/audit_nonpiqd_custody.py survey \
  --repo-root . --root scratch --root census --root certificates \
  --out <run-root>/artifacts/custody-survey.jsonl \
  --summary-out <run-root>/artifacts/custody-summary.json
uv run python scripts/audit_nonpiqd_custody.py links --repo-root .
uv run python scripts/audit_nonpiqd_custody.py writer-index --repo-root . --out <path>
```

Read-only; reports, never gates. Bounded reads, no symlink following,
duplicate-JSON-key rejection and JSON shape bounds follow
`census/card_head/exact12_next_row_arm_static_v24_validator.py`. Reference
resolution is an ordered strategy — repo-root-relative, manifest-relative,
ancestor up to four levels, absolute — and the winning strategy is recorded
per reference, because a root-only resolver reports many false missing files.
Writer attribution uses a schema-literal reverse map, with `producer`,
`command`, `argv`, `script`, `module` as fallbacks. `generator` is never used:
in `certificates/` it holds polynomial strings, not a producer name.

Durable output: `docs/audits/2026-08-18-nonpiqd-custody-survey.json`.

### `scripts/classify_writer_fields.py` — Tier 1, field provenance

```bash
uv run python scripts/classify_writer_fields.py index --repo-root . \
  --out <run-root>/artifacts/field-provenance.jsonl \
  --summary-out <run-root>/artifacts/field-provenance-summary.json
uv run python scripts/classify_writer_fields.py classify \
  --module <path.py> [--field <name>]
```

Parses with `ast`; never executes a writer. Classes by trust: `LITERAL`,
`FLAG_ECHO` and `UNKNOWN` carry none; `COMPUTED` is provisional; `GUARDED` is
trustworthy. A field's aggregate is the least trustworthy class over its
sites. Fields on the pre-registered non-result list cannot be promoted: the
AST verdict is kept as `raw_aggregate` while `aggregate` falls back to
`UNKNOWN` and `trust_capped` is set.

Durable output: `docs/audits/2026-08-18-nonpiqd-field-provenance.json`.

### `scripts/test-nonpiqd-validation.sh` — lane runner

Pinned environment, explicit file list, `uv run pytest -q`, then `ruff check`
and `ruff format --check`. 40 tests.

## Corrections this campaign establishes

- **The documented dedup preflight is incomplete.** A `scratch/**/*-source/`
  directory is a whole repository checkout, so excluding only its `scratch/`
  subtree leaves a 6.8x residual inflation (`*.lean`: 130,533 raw, 77,441
  under the documented rule, 11,363 excluding `*-source/` entirely). Exclude
  the whole tree. Also treat `scratch/exact12-overlay-20260810/` as build
  output.
- **Reverse-link checks must match a full extension.** An alternation on
  `json` truncates `bank.jsonl` to `bank.json` and invents dangling links.
- **A raise-guarded comparison is not always a guard.** A nested raise under
  `if status == CONST:` is a dispatch. And `record["x"] != CONST` is circular
  when the field read was stamped with that constant.

## Findings so far

Tier 0, over 22,340 artifacts and 36,366 references:

- Lean names 307 artifact path tokens; 302 present, 5 missing, and all 5 are
  named only from `lean/scratch/`, which is not a `lean_lib` root, so every
  dangling link is off-spine.
- **Zero of the 254 Lean-named certificates carry any Tier-0 defect.**
- 32,083 references match. 2,300 mismatch across 476 records, but only 119
  distinct drifted target files — generator modules edited after a record
  pinned them. 12 are committed certificates
  (`certificates/p97_exact12_next_row/cell00*-clause-delta.json`), none named
  by Lean. The files are clean against HEAD, so these are stale pins, not
  uncommitted edits. A stale pin breaks replay provenance; it does not by
  itself impugn the recorded mathematics.
- 18 records fail bounded JSON parse: 9 zero-byte files, 4 concatenated
  JSONL, 4 non-finite numbers, 1 over the checker's 64 MiB bound.

Tier 1, over 3,277 writer modules and 99,504 (module, field) pairs:

| Class | Count |
|---|---|
| COMPUTED | 56,505 |
| LITERAL | 29,484 |
| UNKNOWN | 10,612 |
| FLAG_ECHO | 2,348 |
| GUARDED | 555 |

42,444 fields — 42.7 % — carry no trust; 0.56 % reach `GUARDED`.

## Remaining stages

3. Exact rational recheck of the Lean-named algebraic certificates, plus the
   JSON-to-Lean transcription diff. **Scope correction found while probing:
   the 254 Lean-named certificates are not uniformly algebraic.** Only the 117
   `certificates/endpoint/` records carry the explicit
   `sum_i coefficients[i] * generators[i] = 1` identity string; the 135
   `surplus/relaxed_split_singleton/` records carry `generators` and
   `coefficients` with no `identity` field (sampled ones do expand to exactly
   1); and the 2 `multi_center/reports/` records are inventory and incidence
   certificates with `rows`/`class_count`/`*_sha256` fields and no polynomial
   payload at all. They need a separate check, not the algebraic one.
4. DRAT/LRAT recheck, bank chain re-verification, generator reruns.
5. Lean build and axiom-budget confirmation, then ledger assembly.

## What this campaign does not establish

It validates computation. It closes no proof obligation, promotes no leaf, and
moves no spine anchor.
