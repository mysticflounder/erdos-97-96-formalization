# Theorem-bank preflight

This scratch analysis followed the repository bank-search contract before
building a new matcher.

## Registries read

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially
  “Sibling `p97-rvol` banks” and the unimported U1 source-unit section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The JSON scan sees the following complete syntactic inventory:

| registry | metric-point-uniform | `: False` |
|---|---:|---:|
| sibling `p97-rvol` | 137 | 133 |
| legacy `erdos/97` | 98 | 3 |
| `erdos-general-theorem/97` | 98 | 3 |

After deduplicating by fully-qualified name plus exact statement, there are
136 `False` declarations.  The supported simple grammar parses 131.  The five
deliberate skips are two opaque packet wrappers and the three nonmetric Radon
partition consumers.  The previously skipped off-radius theorem
`u5_equilateral_circumcenter_on_p_circle_metric_incompatibility` is parsed here,
including its positive-distance and `dist p x ≠ r` hypotheses.

The registry SHA-256 values are pinned in `bank_deficits.py` and repeated in
`checkpoint.json`.

## Indexed Lean searches

The following searches were run from the repository root:

```bash
nthdegree docs list
nthdegree docs search --lean --name '*u1TwoLargeCapObstruction*' \
  'two large cap obstruction equal distances inequality' --limit 10
nthdegree docs search --lean \
  'seven point circle collision equal distance contradiction' --limit 20
nthdegree docs search --lean \
  'metric point uniform false shared radius equalities' --limit 20
```

The first search returned handle `GF5X6C` for
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`.
The collision search also returned the current seven-point five-/six-circle,
orbit, twin-four-circle, and circle-network kernels.  None supersedes the
six-frontier equality-closure scan.  At search time the relevant Lean corpora
were indexed at 2026-07-15 03:29 UTC; the footer reported source commits
`3380775` for `p97-rvol-lean`, `10b0c7a` for `erdos-97-96-lean`, and `e442825c`
for `erdos-97-96-formalization-lean`.

`nthdegree docs show GF5X6C --lean --source` could not open the sibling source
through the current worktree path, so the exact statement used by the matcher
comes from the exhaustive pinned sibling JSON registry.  This is source-census
evidence, not an import-reachability or fresh kernel-closure claim.
