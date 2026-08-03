# Phase-3 P3 Class-A cap/order bitset benchmark

Date: 2026-08-02

Status: the Class-A Boolean-coverage slice passes its artifact-identity gate and
its bounded fixed-corpus minimizer gate. This is diagnostic infrastructure
evidence only. The solver and DRAT checker were fakes, no production search was
run, and this result is not mathematical or Lean closure.

## Subject and modes

Both modes used record 0 of
`phase3_structural_cegar_algebraic_100000_20260729/survivors.jsonl` in
nonprojected v3 mode. The source file SHA-256 is
`c9b9ae427c0bbe254c9e5a84ff70f755c73bc881930a0131ffbb1f058bda4407` and
the canonical record SHA-256 is
`ee9681dc043c7e34b3b2b51b1ec9c372da85b04e465894cb0a22d5d7e05badf6`.
Each mode used three spawned-process/new-copy repetitions followed by five
same-process/same-copy repetitions. Operating-system caches and machine load
were not controlled.

The disabled command added `--legacy-order-coverage`; the enabled command
omitted it. Both otherwise ran:

```text
uv run python -m census.p97_search.benchmarks.phase3_cegar_benchmark \
  mock-transcript \
  --assignment-jsonl scratch/p97-distinct-distance-lane/phase3_structural_cegar_algebraic_100000_20260729/survivors.jsonl \
  --assignment-index 0 --fresh 3 --warm 5 --nonprojected
```

Retained outputs:

- disabled: `p3-class-a-order-bitset-v3-disabled-20260802/`;
- enabled: `p3-class-a-order-bitset-v3-enabled-20260802/`.

## Artifact differential

`diff -qr` over the complete `runs/` directories produced no differences.
Every fresh and warm subject had status `STRUCTURAL_UNSAT_VERIFIED`, run
manifest SHA-256
`77b1718b4744316e4c378d11aefd867295ec2edd824d1b6749d0e50da80b9d83`,
and tree SHA-256
`23234da2e7ad31ef78995036ccee9ba1828db5bf71407bd0457348b59e97248b`.
The benchmark manifests intentionally differ because they authenticate the
feature mode.

| Mode | Benchmark manifest SHA-256 | Report SHA-256 |
| --- | --- | --- |
| Legacy | `6ddc176e7d56c36889a1277f716bdc72d2b7f0f917e8edc18cb84fe674ea6598` | `adbe249c4b01ca5b0aea90d050315194568529220a8e79af0f6eae4f3cf9904a` |
| Bitset | `914c36f59362a827ac5d0c3a61c3400518d8c8d88846cc9969a6eee3304113b3` | `a0aacef678cd6acb739712409213463951e4d9883d0dd8bae66bccbb1f6e7ec8` |

## Diagnostic timings

Wall-clock medians from the authenticated reports:

| Timed boundary | Legacy | Bitset | Legacy / bitset |
| --- | ---: | ---: | ---: |
| cap-fact minimizer | 100.042 ms | 20.373 ms | 4.91x |
| classifier/minimizer commit | 464.154 ms | 254.191 ms | 1.83x |
| bounded transcript | 513.362 ms | 313.673 ms | 1.64x |
| replay startup-to-ready | 672.890 ms | 272.497 ms | 2.47x |

The targeted cap-fact minimizer clears the provisional 3x fixed-corpus gate,
and the bounded transcript does not regress. These numbers do not establish a
general production-search speedup: the corpus has one Class-A assignment, the
backend transcript is fake, and only three fresh timing samples are available.

An earlier retained pair, `p3-class-a-order-bitset-v2-{disabled,enabled}-20260802`,
showed that a naive growing-integer/predicate compiler added overhead. The
promoted implementation instead builds fixed byte vectors from precomputed
forward/reverse positions, converts once to integer masks, and caches masks by
role tuple. The negative pair is retained to make that optimization decision
auditable.

## Correctness gate

The final targeted suite reported `44 passed` and Ruff reported no violations.
The suite includes:

- exact construction of all 630 annotations and 15,120 annotation/order pairs;
- exhaustive compatibility comparison for all `630 * 128 = 80,640`
  source/subset cases;
- forward/reverse cyclic-subsequence mask comparison, including malformed and
  degenerate role tuples;
- independent reconstruction of the real descriptor coverage mask; and
- a feature-disabled/enabled real Class-A fake transcript with complete
  directory-tree identity.

Frozen projected-static-v2 remains byte-identical at SHA-256
`8d09e3fb72522a7e9ed111cab8a33b56afcf739434fe54e79619c00290358e9d`.
