# Phase-3 frozen bootstrap-bank comparison (2026-07-29)

Loader path: `census/p97_search/phase3_structural_cegar.py`,
`_bootstrap_certificates`.

The recommended bank was rerun after the concurrent loader-file update.  The
loader file was stable throughout that rerun:

- loader file SHA256:
  `af87693d1ff05f556c967237704edd447d3800486bdb530e4b1ebefd5897e33a`
- `_bootstrap_certificates` source SHA256:
  `083b5b9e0591c6c61cc0eb5fc7925176fa90b0acba316e78cb7108bcd8c2526a`

## Authenticated replay and projection

| bank | authenticated records / unique certificates | structural row antichain | projected unique structural clauses | kept structural clauses | kept ordered clauses | final kept antichain |
|---|---:|---:|---:|---:|---:|---:|
| `cube22_frozen` | 35,424 | 34,616 | 34,616 | 34,497 | 35 | 34,532 |
| `projected_sequential_frozen` | 45,316 | 42,977 | 42,977 | 42,696 | 6 | 42,702 |
| `kalmanson_sequential_frozen` | 65,679 | 54,815 | 22,790 | 22,319 | 0 | 22,319 |

The Kalmanson-sequential source is a legacy structural bank.  Projection
collapses 32,025 row-antichain entries to duplicate clauses, then subsumes 471
more clauses.  Its large record count therefore does not make it the strongest
bootstrap under the current projected-clause loader.

The projected-sequential source has zero projected duplicates.  It loses 281
structural clauses to clause subsumption and retains five convex-five-point
cuts plus one selected-row Kalmanson cut.  In total, 2,614 of its 45,316 unique
source certificates are subsumed by its 42,702-cut final antichain.

## Exact overlap of returned bootstrap clauses

| pair | shared | left only | right only |
|---|---:|---:|---:|
| cube22 / projected sequential | 23,357 | 11,175 | 19,345 |
| cube22 / Kalmanson sequential | 12,130 | 22,402 | 10,189 |
| projected sequential / Kalmanson sequential | 12,238 | 30,464 | 10,081 |

The exact union of all three returned antichains contains 63,783 clauses.

## Source provenance

| bank | file SHA256 | terminal record-chain SHA256 |
|---|---|---|
| cube22 | `2671cd588cebe6f685b6e245fe54b9c646a98b77f483f9895c13220ef86ff08a` | `84bd0710e29d77d61c9a842ae2160543940abb44f525b4c5e90cede4edbe4aa0` |
| projected sequential | `dd3855e39757a6128d2ee92de2c4256aa133e7fdbab0916b6f375ea64aa1420c` | `e857f6780e70235c788ae01cebb241b0110cd60359de01933879bc14e00adbb8` |
| Kalmanson sequential | `303e29bac70ca7291438ee0b02ea43bfeeb7b5cf2900e31896b0438c857a036c` | `e8ccc054b96b5e9ce99e1d5b6190e6d757a6996357efc5b5fe8c72fae462256d` |

The projected-sequential current-loader rerun took 418.384 seconds inside the
loader (419.53 seconds wall).

## Recommendation and launch pattern

Use:

`scratch/p97-distinct-distance-lane/phase3_projected_sequential_frozen_learned_20260729/learned-certificates.jsonl`

for all sixteen fresh depth-4 shards.  It has the largest current projected
antichain and retains both modern structural-path and ordered cuts.

Run one external process per shard index `I` in `0..15`, with a fresh,
nonexistent output directory:

```bash
uv run python census/p97_search/phase3_structural_cegar.py \
  --out "scratch/p97-distinct-distance-lane/<fresh-run>/shard-${I}" \
  --timeout <seconds> \
  --learned-core-limit 100000 \
  --survivor-limit 1000 \
  --workers 1 \
  --parallel-mode sequential \
  --shard-depth 4 \
  --shard-index "${I}" \
  --bootstrap-results \
    scratch/p97-distinct-distance-lane/phase3_projected_sequential_frozen_learned_20260729/learned-certificates.jsonl
```

Fixed top-level shards require `--parallel-mode sequential`; parallelism is the
external 16-process fan-out.  Leave the typed algebraic bootstrap at its
current default unless the launch intentionally tests a different algebraic
configuration.

The machine-readable full comparison is
`phase3_frozen_bank_loader_comparison_20260729.json`.
