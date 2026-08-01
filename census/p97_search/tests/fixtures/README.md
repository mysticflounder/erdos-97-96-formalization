# Phase-3 replay fixtures

These fixtures make the Phase-3 regression tests independent of ignored
`census/p97_search/out/` run directories.

- `phase3_legacy_bounded100_current` is the authenticated legacy bounded SAT
  prefix used by realization tests.
- `phase3_legacy_bounded100_stale_rule_bank` is the intentional stale-hash
  negative control.
- `phase3_structural_survivors_100_current` is the authenticated current-code
  checkpoint of 100 structurally unresolved survivors.
- `phase3_survivor_metric_100_current` is generated from that structural
  checkpoint and records the complete bounded metric screen used by the Z3 and
  cvc5 driver tests.

The structural manifest's `bootstrap` paths are repository-relative provenance
labels paired with content hashes.  The fixture loaders do not dereference
those paths; all runtime inputs are present under this directory.

Regenerate the metric fixture from the repository root with:

```bash
uv run python -m census.p97_search.phase3_survivor_metric_driver \
  --source census/p97_search/tests/fixtures/phase3_structural_survivors_100_current \
  --out census/p97_search/tests/fixtures/phase3_survivor_metric_100_current \
  --expected-count 100 --workers 24 --timeout 2
```

These are bounded external-computation fixtures.  They make no census
completeness, Euclidean-realizability, Problem 97, or Lean-kernel closure
claim.
