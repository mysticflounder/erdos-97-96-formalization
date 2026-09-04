# Math Skeptic Audit: Strict-Kalmanson n=11 remainder forensics

**Target**: `docs/audits/2026-09-04-strict-kalmanson-n11-remainder-forensics.md`

**Date**: 2026-09-04

**Verdict**: CERTIFIED

**Claims audited**: 15 grouped mathematical and computational claims

## Summary

The corrected target resolves all five findings from the prior audit. It now
distinguishes pen-and-paper arithmetic, finite empirical checks, Lean proofs,
and HEURISTIC external or unaudited reports. It also states the finite n=11
scope, separates raw whole-block count sums from deduplicated unions, and gives
the missing bank custody boundary explicitly.

The focused audit tests pass (7 tests), the reproducer and Ruff checks pass, and
source re-elaboration of both cited Lean theorems reports only the core axioms
`{propext, Classical.choice, Quot.sound}`. No claim is promoted beyond its
available evidence.

## Findings

No findings. Prior findings F1–F5 are resolved as follows:

- F1: the arithmetic identity is explicitly **PROVEN (pen-and-paper
  arithmetic)** at target:30-31.
- F2: the announced bank counts and case-20 UNSAT are explicitly **HEURISTIC,
  external report** at target:51-53.
- F3: the planar chain is explicitly **PROVEN, Lean-formalized**, with its
  theorem name and axiom set at target:55 and target:161-164.
- F4: the auxiliary source searches are explicitly **HEURISTIC** and assigned
  no exclusion weight at target:131-153.
- F5: the subset statement explicitly says it sums whole-block arithmetic
  counts and is not a subfamily-pattern search at target:111-116.

## Weasel words

No automatic proof-context weasel words were found. The target contains no
unsupported probabilistic hedge in a proof explanation and uses
HEURISTIC/UNVERIFIED-style boundaries
to prevent informal search notes from carrying proof weight.

## Scope conflation

No scope conflation remains. The target restricts the reconstructed clauses and
survivor to the finite n=11 all-center row abstraction, keeps the Euclidean
Lean obstruction separate from bank ingress, and states that the announced
finite bank plus motif does not have a locally verified exhaustive closure.

## Lean sorry graph

The inspected theorem sources contain no `sorry`, `native_decide`, `unsafe`,
`@[implemented_by]`, or `@[extern]`. Re-elaboration and `#print axioms` give:

- `Problem97.false_of_realizes_three_equilateral_chain` —
  `{propext, Classical.choice, Quot.sound}`;
- `Problem97.FourRoleThreeRowK2Collapse.false_of_three_selected_rows_four_role_K2_collapse` —
  `{propext, Classical.choice, Quot.sound}`.

These are Lean-formalized theorem results under their stated hypotheses. The
target correctly does not infer finite-bank ingress or exhaustive search
closure from them.

## Upgrade drift

No base commit was supplied. There is no unsupported label upgrade in the
corrected target: locally reproduced counts are EMPIRICALLY VERIFIED at n=11,
the arithmetic identity is PROVEN by the displayed calculation, Lean results
are separately identified as Lean-formalized, and external announcements and
unreplayed searches remain HEURISTIC.

## Validation

The following checks were run against the cited evidence:

- `UV_CACHE_DIR=.uv-cache uv run pytest -q scripts/test_audit_strict_kalmanson_n11_remainder.py scripts/test_verify_strict_kalmanson_n11_wave4_survivor.py` — **7 passed**.
- `UV_CACHE_DIR=.uv-cache uv run --with ruff ruff check scripts/audit_strict_kalmanson_n11_remainder.py scripts/test_audit_strict_kalmanson_n11_remainder.py` — **All checks passed**.
- `scripts/audit_strict_kalmanson_n11_remainder.py` — reproduced 19,844 baseline clauses, 29,018 known union clauses, remainder 22,660, C–M union 46,266, and no matching whole-block count sum.
- Lean source re-elaboration — both cited theorem axiom closures are core-only as listed above.

## Required before CERTIFIED

None for this audit target. The separate 42,504-clause bank and case-20
exhaustive UNSAT remain intentionally outside certification, as the target
states at target:166-169 and target:183-188.
