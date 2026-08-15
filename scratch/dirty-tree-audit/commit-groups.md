# Remaining commit-group audit

Date: 2026-08-14

This is a read-only ownership pass after `eb282a2b`, `f434aa6e`, and the
cleanup commits through `a3213111` (`HEAD`). It excludes scratch artifacts and
the active Rigid221, FreshThird FirstNonHit, Exact17, and Child45 lanes. The
checkout is concurrent: the status sample during this pass was 51 modified and
2,098 untracked paths, and the index changed concurrently. The only staged
path observed was:

```text
M docs/computational-closure-plan-2026-07-28.md
```

That staged path belongs to the active FirstNonHit lane and must be left alone.
Re-run status immediately before any owner stages a group.

## Candidate groups

### G1 — frontier overflow specification documentation

**Paths**

```text
census/frontier-packages/A-CORE-ENCODING-SPEC.md
census/frontier-packages/E-ENCODING-SPEC.md
```

These are the remaining substantive package-spec changes: both document the
exact buckets plus `GE25` overflow abstraction. The corresponding package
source/output repair is already in `a3213111`; do not pull the generated output
trees into this commit.

**Owner/conflict:** frontier-package family owner confirmation required; no
current roster entry claims these two docs. This is the cleanest independent
candidate.

**Minimum validation:**

```bash
git diff --check -- census/frontier-packages/A-CORE-ENCODING-SPEC.md census/frontier-packages/E-ENCODING-SPEC.md
uv run python census/frontier-packages/a_core/smoke.py
uv run python census/frontier-packages/e_core/smoke.py
```

The smoke commands regenerate local output; run them only in the owner’s
validation pass and do not stage their timing/model artifacts automatically.

### G2 — ATAIL SMT one-shot pilot source and tests

**Paths currently modified**

```text
census/atail_force/piqd_cvc5_adapter.py
census/atail_force/tests/test_piqd_cvc5_adapter.py
```

The adapter adds the named semantic-verifier identity and the one-shot query
validation gate. The focused test exercises both additions.

**Blocking shared dependencies / owner conflict**

The test imports the shared, still-untracked engine and modified adapter layer:

```text
census/p97_search/phase3_smt_oneshot_engine.py
census/p97_search/tests/test_phase3_smt_oneshot_engine.py
census/p97_search/phase3_piqd_smt_source_adapter.py
census/p97_search/tests/test_phase3_piqd_smt_source_adapter.py
```

Those paths are part of the active CEGAR/SMT shared lane and are deliberately
not proposed for an independent commit. The ATAIL pair is therefore a
candidate only after that owner publishes a stable API or explicitly hands off
the dependency.

**Minimum validation after handoff:**

```bash
uv run --with sympy --with pytest pytest -q census/atail_force/tests/test_piqd_cvc5_adapter.py
uv run --with ruff ruff check census/atail_force/piqd_cvc5_adapter.py census/atail_force/tests/test_piqd_cvc5_adapter.py
git diff --check -- census/atail_force/piqd_cvc5_adapter.py census/atail_force/tests/test_piqd_cvc5_adapter.py
```

### G3 — ATAIL/SMT contract documentation

**Path**

```text
docs/p97-cegar-wave-framework-consolidation-plan-2026-08-13.md
```

The diff documents the SMT one-shot tranche and explicitly names ATAIL as the
pilot. It must follow G2, not precede the shared engine/API handoff.

**Owner/conflict:** active CEGAR-framework/Twelvefold promotion work owns the
contract wording. Hold for owner review, even though the change is prose.

**Minimum validation:**

```bash
git diff --check -- docs/p97-cegar-wave-framework-consolidation-plan-2026-08-13.md
rg -n "SMT_ONESHOT|ATail|one-shot|aggregate" docs/p97-cegar-wave-framework-consolidation-plan-2026-08-13.md
```

### G4 — completed project-audit and policy documentation

**Paths**

```text
docs/audits/2026-08-06-spine-refactor-audit.md
docs/audits/2026-08-06-p97-cegar-case-split-promotion-audit.md
docs/search-to-action-policy-audit-2026-08-12.md
docs/specs/p97-piqd-global-confinement-metric-core-miner-v1.md
```

These are documentation/status updates with no source or generated-artifact
payload. The spine audit records a landed refactor; the case-split and search
policy files are review artifacts; the metric-miner spec corrects the shipped
label/digest transport qualification.

**Owner/conflict:** G4 is plausible as one docs-only chore, but the CEGAR
policy and metric-miner wording is project-shared. Require a reviewer to
confirm that its claims match the source commits before staging.

**Minimum validation:**

```bash
git diff --check -- docs/audits/2026-08-06-spine-refactor-audit.md docs/audits/2026-08-06-p97-cegar-case-split-promotion-audit.md docs/search-to-action-policy-audit-2026-08-12.md docs/specs/p97-piqd-global-confinement-metric-core-miner-v1.md
rg -n "NEEDS_PROOF|UNVALIDATED|Status:|shipped|blocked" docs/audits/2026-08-06-spine-refactor-audit.md docs/audits/2026-08-06-p97-cegar-case-split-promotion-audit.md docs/search-to-action-policy-audit-2026-08-12.md docs/specs/p97-piqd-global-confinement-metric-core-miner-v1.md
```

The second command is a review aid, not a proof of the documented claims.

### G5 — project governance/configuration (hold)

**Paths**

```text
.blueprint.toml
CLAUDE.md
```

`.blueprint.toml` adds a skip rule for standalone `ATail.*Export` modules;
`CLAUDE.md` records the project’s nthdegree memory and docs-search workflow.
Both are shared root policy files and should be a separate owner-reviewed
chore, never bundled with package outputs or active Lean edits.

**Minimum validation:**

```bash
git diff --check -- .blueprint.toml CLAUDE.md
```

The blueprint change additionally needs the owner’s normal proof-blueprint
audit/index check; do not infer that from a text diff.

## Explicitly held out

Do not include these in any group above:

- all `scratch/**` paths;
- all `lean/**` paths;
- all `census/p97_search/**` paths, because the remaining files are shared
  CEGAR/SMT/FirstNonHit work rather than an independently owned chore;
- `census/card_head/**` exact-12 common-five files (active Rigid221);
- `census/endpoint_confinement/metric_realizability_probe.py` (shared by the
  active Rigid221 geometry consumers);
- `.gitignore` (the current Exact17/generated-artifact cleanup lane);
- the active docs: `docs/computational-closure-plan-2026-07-28.md`,
  `docs/exact-twelve-rigid221-*`,
  `docs/false_of_capSourceThirdCanonicalRowSurface_refactor-plan-07-31-2026.md`,
  `docs/live-blueprint.md`, `docs/p97-exact17-*`,
  `docs/p97-spine-closure-audit-2026-08-03.md`,
  `docs/specs/p97-exact12-next-row-static-equality-v1.md`,
  `docs/audits/2026-08-13-p97-cegar-global-constraint-seed-coverage-audit.md`,
  `docs/audits/p97-exact17-cegar-piqd-soundness-audit-2026-08-12.md`, and the
  FirstNonHit/Rigid221 solve-prompt files.

`census/frontier-packages/dr_core/out/smoke/smoke_report.json` is not a
candidate: its diff changes only wall-clock timing decimals. Keep it out of a
source/documentation commit.

## Recommended order

1. Wait for the current staged FirstNonHit path to be committed or unstaged by
   its owner; do not touch the shared index.
2. Owner-review and commit G1 alone, if its smoke reruns reproduce the existing
   manifest/verdicts.
3. Obtain the shared SMT engine handoff, then validate and commit G2; commit G3
   immediately afterward so the contract docs match the API.
4. Review and commit G4 as a docs-only chore if every status claim is backed by
   an existing source commit or receipt.
5. Handle G5 last, with the proof-blueprint owner reviewing the skip rule.

No group above is authorized for staging by this audit; each requires the
owner’s exact-path confirmation and a fresh diff immediately before commit.

