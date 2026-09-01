<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Documentation sweep — 2026-09-01

18 documents archived, all from `docs/audits/`. Predecessor sweep:
[`docs/archive/2026-08-30-doc-sweep/`](../2026-08-30-doc-sweep/).

These are historical records, not current obligations or dispatch surfaces.
Nothing was deleted. Every file keeps its original name under a subdirectory
that mirrors where it came from. Moving them changes no Lean source and
establishes no proof closure.

## Criterion

A document was archived only when both conditions held:

1. Its target obligations are absent from the live open-obligation list for
   publish target `Problem97.erdos97_rhs`, verified against
   `proof-blueprint spine` on 2026-08-31 (19 open obligations: 12 `sorry`
   theorems and 7 stale entries, `sorryAx` total 12).
2. It is not an operative contract, index, or authority that live code,
   scripts, receipts, or the current README and plans depend on.

Audits that record dead ends, refutations, or negative results were **kept**
even when old, per the project rule. That rule preserved the whole
2026-07-08 through 2026-07-15 ATAIL-force / Route-B / K-A-PAIR line, whose
negative findings are recorded nowhere else. 88 audits remain in
`docs/audits/`.

Live status comes from `proof-blueprint spine`, snapshotted in
`docs/live-blueprint.md`. The obligation roster is
[`proof-status/README.md`](../../../proof-status/README.md).

## Superseded closure-plan and proof-state records (6)

- `2026-07-09-full-closure-plan-audit.md` and
  `2026-07-11-closure-plan-freshness-audit.md` — both audit
  `docs/closure-plan-full-spec-2026-07-09.md`, which is itself marked
  HISTORICAL STRATEGY LEDGER and superseded by
  `docs/computational-closure-plan-2026-07-28.md`.
- `2026-07-09-risk-mitigation-implementation-checkpoint.md` — bookkeeping for
  risk items since closed (ERASE, Endpoint, PinnedSurplus).
- `2026-07-11-lean-codebase-analysis.md` — whole-project proof-state snapshot;
  the inventory it reports has since changed.
- `2026-08-06-spine-refactor-audit.md` and
  `2026-08-09-lean-codebase-refactor-audit.md` — superseded within the same
  refactor-audit family by `docs/audits/2026-08-23-consolidation-refactor-audit.md`,
  which is retained.

## Retired census-554 and multi-center pipeline records (4)

Engineering bookkeeping for a closed subsystem. None records a mathematical
dead end.

- `2026-07-08-multi-center-joint-census-results-audit.md`
- `2026-07-09-census-554-parallel-work-audit.md`
- `2026-07-12-census-554-perpendicular-core-replacement-experiment.md`
- `2026-07-12-census-554-structural-first-experiment.md`

## Content absorbed into a live authority (3)

- `2026-08-16-scratch-computational-output-pattern-audit.md` and
  `2026-08-16-scratch-pattern-audit-verification.md` — both are reproduced
  under the explicit "2026-08-16 operator set — WITHDRAWN" section of
  `docs/computational-closure-plan-2026-07-28.md`, which corrects their counts.
  The root `README.md` citation and the comment at
  `scripts/audit_nonpiqd_custody.py:53` were repointed here in the same commit.
- `search-to-action-policy-audit-2026-08-12.md` — its recommended wording is
  now standing policy in this repository's `CLAUDE.md`. A compatibility
  pointer remains at `docs/search-to-action-policy-audit-2026-08-12.md`.

## Process and policy snapshots (4)

Dated reviews of tooling and instructions, not of proof obligations.

- `2026-07-25-sorry-promotion-policy-recommendations.md` — promotion and sorry
  policy is now governed by the `lean-usage` skill.
- `2026-08-12-codex-session-log-error-pattern-review.md` — covers the closed
  2026-07-01..2026-08-12 period.
- `2026-08-13-math-project-instruction-audit.md` — the instruction stack has
  moved past this snapshot.
- `sorry-bank-audit-2026-08-07.md` — census against a superseded
  30-declaration roster.

## Superseded canary (1)

- `p97-piqd-projected-v3-live-canary-2026-08-10.md` — self-described as the
  historical shard/v2 canary, and explicitly not a qualification of the
  current global-unsharded authority-v3 production route.
