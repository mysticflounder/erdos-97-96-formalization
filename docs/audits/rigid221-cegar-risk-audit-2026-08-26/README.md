# Rigid221 CEGAR risk-audit bundle

This bundle answers the 2026-08-26 audit specification for the live
`card_ge_eighteen` Rigid221 residual.

The primary verdict is `CROSS_CARDINALITY_EVIDENCE_INSUFFICIENT`, with
`ENCODING_TOO_WEAK` and `ONLY_RELAXED_SURVIVORS_FOUND` as secondary verdicts.
Start with `EXECUTIVE-SUMMARY.md`; use `REPORT.md` for the source audit and
argument. The theorem-facing work order incorporates the post-audit decision
review: neutral large-pair ingress first, crossed/bi-survival consumers second.

## Contents

| Path | Purpose |
|---|---|
| `REPORT.md` | Full source-audited synthesis and decision |
| `EXECUTIVE-SUMMARY.md` | Four required decision answers |
| `run_inventory.csv` | One row per retained campaign wave/aggregate wave |
| `predicate_crosswalk.csv` | Encoded predicates against current Lean fields/producers |
| `canonical_models.jsonl` | All canonical assignment content retained by available in-scope artifacts |
| `model_features.csv` | Required structural, provenance, order, and potential features |
| `symmetry_and_canonicalization.md` | Identity-group policy and validation rules |
| `containment_extension_dag.csv` | Audited extension/projection proposals |
| `refinement_effects.csv` | CEGAR/refinement history |
| `unsat_cores_or_ablations.jsonl` | Authenticated finite cores and linear-oracle aggregates |
| `survivor_family_history.md` | Family chronology and invariant/obstruction mining |
| `candidate_lemmas.md` | Three theorem targets with exact boundaries and reuse preflights |
| `representative-models/` | Adversarial regression cards |
| `evidence_manifest.csv` | Repository-relative evidence paths, sizes, and SHA-256 hashes |
| `scripts/build_bundle.py` | Deterministic extractor/generator; invokes no solver |
| `scripts/validate_bundle.py` | Schema/count/hash/invariant validation |
| `SHA256SUMS` | Digests for every bundle file except itself |

## Rebuild and validate

From the repository root:

```bash
uv run python docs/audits/rigid221-cegar-risk-audit-2026-08-26/scripts/build_bundle.py
uv run python docs/audits/rigid221-cegar-risk-audit-2026-08-26/scripts/validate_bundle.py
```

To reproduce the slower diagnostic inequality search cited in the report, add
`--check-small-coefficients` to the builder command. It enumerates every
nonzero coefficient vector in `[-3,3]^6` and should report zero strict
separators.

The builder reads existing bounded artifacts only. It does not run Lean, SAT,
SMT, PIQD, a metric oracle, or network commands. The validator is likewise
read-only apart from ordinary interpreter caches outside the bundle.

## Interpretation guardrails

- A canonical line retains every assignment field available in its source
  object; it is not thereby a full Lean-packet assignment.
- Every canonical record explicitly sets
  `full_source_faithful_model=false`.
- SAT in an incidence/order relaxation is not a P97 counterexample.
- A finite UNSAT cell is not an aggregate leaf theorem without coverage.
- An exact-17 theorem or certificate does not reach `n >= 18` without a checked
  lift.
- A carrier point unused by selected rows is not thereby removable.

The shared-worktree head advanced during the audit, but the three Lean authority
files were byte-identical at the initial and endpoint heads. Their hashes and
all other evidence hashes are recorded in the report and manifest.
