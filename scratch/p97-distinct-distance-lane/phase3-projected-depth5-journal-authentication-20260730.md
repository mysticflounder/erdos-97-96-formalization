# Phase-3 projected depth-5 journal authentication — 2026-07-30

## Verdict

`PASS` for all nine frozen projected-static-v2 journals.

This audit authenticates the journals as safe inputs to the corrected
canonical-bank builder.  It does **not** execute that builder, establish a
Lean-kernel result, provide semantic ingress from a live P97 carrier, or
constitute a terminal P97 certificate.

## Checks performed

Each journal was replayed through the current production `_load_learned`
implementation with:

- its exact depth-5 shard literals;
- all seven default algebraic templates;
- assignment, structural, five-point-cap, rhombus, and shared-pair certificate
  checks enabled.

Every journal is:

- newline-complete strict JSONL;
- record-index and hash-chain valid;
- schema `p97-phase3-structural-cegar-learned-projected-static-v2`;
- free of blocker variables, semantic blocker keys, and raw `b[...]`
  occurrences; and
- accepted by the current production replay path.

Origin abbreviations below are `B` bootstrap structural, `S` dynamic
structural, `C` five-point cap, `R` rhombus, and `P` shared pair.

| Shard | Exact literals | Records / retained | Bytes | Origins `B/S/C/R/P` | SHA-256 |
|---:|---|---:|---:|---|---|
| 4 | `[-91,-92,93,-94,-95]` | 23,837 / 23,365 | 104,913,888 | `472/23262/45/1/57` | `74fcb3f1d3b2bb7897fd61c744268272074cd4d0bea081327f042708a149aaed` |
| 5 | `[-91,-92,93,-94,95]` | 23,054 / 22,582 | 105,022,330 | `472/22263/209/1/109` | `9173a3ac1c280b98d8c9b29318253a71ad1388ba7aca374a2d419c29e1e0300b` |
| 6 | `[-91,-92,93,94,-95]` | 24,147 / 23,675 | 105,104,582 | `472/23627/23/0/25` | `f3fd9505fa6f71010ec28da826884bf3cd29490d2afdd8f76ff5c0403f2fe502` |
| 8 | `[-91,92,-93,-94,-95]` | 23,379 / 22,907 | 104,200,800 | `472/22721/86/1/99` | `9a3f58c7805c82bfebe581013978997ec29b990cb2cd485565ac69059051ab79` |
| 9 | `[-91,92,-93,-94,95]` | 23,449 / 22,977 | 104,180,975 | `472/22773/118/0/86` | `8281add041e961d68d5a5811ddb7a25f49df6e21522ca2cbb7b6226109d1dc70` |
| 10 | `[-91,92,-93,94,-95]` | 24,099 / 23,627 | 105,329,940 | `472/23565/38/0/24` | `df7ec509fe0e7924e5cfd6af2383eabc142da3c65ba958eca35a5b63a4ef2088` |
| 16 | `[91,-92,-93,-94,-95]` | 23,165 / 22,693 | 103,893,835 | `472/22431/149/0/113` | `e962ff058adf09636b1e96ee1e6f345683d7032d6b60b771a50e0e51b9bec10b` |
| 17 | `[91,-92,-93,-94,95]` | 23,478 / 23,006 | 104,485,764 | `472/22815/115/0/76` | `9e03faac348ed88cea141a6893d9ac5d093370485b7a9ed817f39d11d5b1c7f7` |
| 18 | `[91,-92,-93,94,-95]` | 23,964 / 23,492 | 105,908,786 | `472/23373/69/0/50` | `7650a97dfd029fba5d64aa2ec24e7ae2f27418f56c9fa89436067a4438062a35` |

Aggregate:

- 212,572 records;
- 943,040,900 bytes;
- origin histogram `B=4,248`, `S=206,830`, `C=852`, `R=3`, `P=639`;
- 208,324 dynamic records retained by the builder.

The 4,248 repeated bootstrap records are intentionally excluded and replaced
by the separately authenticated frozen bank.

## Code and bank identities

- production loader:
  `8d09e3fb72522a7e9ed111cab8a33b56afcf739434fe54e79619c00290358e9d`;
- corrected builder:
  `1c8f4f363b968cf2b59a48d8c27d016230c4d980faedca388d5eb852e4d7ad49`;
- frozen 508-record bank:
  `29ce8b7574cfd66cb128c969157476c75a6c83e1b8a03f918c2ae171f4bf7d50`.

## Correct builder invocation

```bash
.venv/bin/python3 \
  scratch/p97-distinct-distance-lane/build_phase3_canonical_bootstrap_bank_20260729.py \
  --frozen-bank scratch/p97-distinct-distance-lane/phase3_projected_cube19_cheap_structural_bootstrap_508_20260729/learned-certificates.jsonl \
  --journal '5:4=scratch/p97-distinct-distance-lane/phase3_projected_static_v2_shared_pair_depth5_hard_journal_snapshot1_20260729/shard-04.learned-certificates.jsonl' \
  --journal '5:5=scratch/p97-distinct-distance-lane/phase3_projected_static_v2_shared_pair_depth5_hard_journal_snapshot1_20260729/shard-05.learned-certificates.jsonl' \
  --journal '5:6=scratch/p97-distinct-distance-lane/phase3_projected_static_v2_shared_pair_depth5_hard_journal_snapshot1_20260729/shard-06.learned-certificates.jsonl' \
  --journal '5:8=scratch/p97-distinct-distance-lane/phase3_projected_static_v2_shared_pair_depth5_hard_journal_snapshot1_20260729/shard-08.learned-certificates.jsonl' \
  --journal '5:9=scratch/p97-distinct-distance-lane/phase3_projected_static_v2_shared_pair_depth5_hard_journal_snapshot1_20260729/shard-09.learned-certificates.jsonl' \
  --journal '5:10=scratch/p97-distinct-distance-lane/phase3_projected_static_v2_shared_pair_depth5_hard_journal_snapshot1_20260729/shard-10.learned-certificates.jsonl' \
  --journal '5:16=scratch/p97-distinct-distance-lane/phase3_projected_static_v2_shared_pair_depth5_hard_journal_snapshot1_20260729/shard-16.learned-certificates.jsonl' \
  --journal '5:17=scratch/p97-distinct-distance-lane/phase3_projected_static_v2_shared_pair_depth5_hard_journal_snapshot1_20260729/shard-17.learned-certificates.jsonl' \
  --journal '5:18=scratch/p97-distinct-distance-lane/phase3_projected_static_v2_shared_pair_depth5_hard_journal_snapshot1_20260729/shard-18.learned-certificates.jsonl' \
  --out-dir scratch/p97-distinct-distance-lane/phase3_projected_static_v2_shared_pair_depth5_hard_journal_snapshot1_canonical_bootstrap_20260729
```

Omitting `--algebraic-bootstrap` intentionally selects the four production
default banks.  At audit time the output directory was absent, satisfying the
builder's fresh-output precondition.
