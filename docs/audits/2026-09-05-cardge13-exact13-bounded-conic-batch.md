# Exact-13 bounded-support cone audit (2026-09-05)

## Scope

This lane asks whether the replayed exact-13 cell-0 Boolean model has a
positive Kalmanson dependence using between four and 79 nonzero projected
forms. Zero projected forms are excluded. The upper bound is the
Carathéodory-scale support target identified after the earlier 940-term cone
witness; the mixed Boolean/linear-real query does not optimize the resulting
support or total weight.

The producer parses every returned rational weight exactly, scales the result
to primitive natural weights, and replays every projected coordinate before
emitting provider paths or a Boolean conflict clause. Ten focused tests and
Ruff passed.

## Authenticated run

- Lane base: `4b4cb487f0360d91421c15f4397deef8b07bcb84`
- Run manifest self-hash:
  `a7fd6700e62b697ff141fdf5589b49d2ad3303fe3d0fba98b716816f8b4fa511`
- Run manifest file SHA-256:
  `2c7c889ee8e01a566f299d431020cba73c7b7cd599a9bbac794370a2edb67514`
- Source Boolean event SHA-256:
  `c04594d844603f9a7935c9f6b4f337f01bd3655f3be853b0f15ae24b0cc1c5fd`
- Journal SHA-256:
  `0574bec2ef60f136853e765e71727ba35a425d026f9abfd71b43ecdde87f9244`
- Event self-hash:
  `cc859af415dc612e10514a6c39dc3cb25415928ad04543841ac61904e1bf89c1`
- Event file SHA-256:
  `3b1e95b9ccae9bd8ce5fabfb6dd99d7f3a8d08991d2e03c6fdafc7155e3fe390`
- PIQD session: `00941143-314c-4d5d-a788-7d3a1004eee2`
- Solver: Z3 4.17.0, binary SHA-256
  `b7a02cb75cccb7f35385c551c10453f32c12da23a7656e24233bc4b25d0f5a9a`

The query retained 1,126 nonzero projected form representatives. PIQD returned
SAT after 5,254 ms, and independent model replay reported `SATISFIED`. Exact
scaling produced:

- 24 positive weighted terms;
- total primitive natural weight 2,388;
- 4,776 multiplicity-preserving provider edge pairings; and
- a 38-atom source conflict clause.

This is a substantial support reduction from the prior 940-term witness and
meets the requested at-most-79 support bound. It remains a result about one
replayed abstract model in one coarse cell. The event explicitly records
`source_coverage: false` and `theorem_promotion: false`.

## Closure consequence

The 24-term witness is small enough to compile as generated Lean term data,
but its 4,776 expanded pairings may still be expensive. The next exact-13
checkpoint is to emit this event through
`ProviderWeightedKalmansonCancellationData`, prove its executable `check` by
kernel reduction, and connect it to the source-realizing provider pattern.
That closes only this learned Boolean conflict. Full exact-13 closure still
requires checked terminal coverage for every source-reachable coarse cell and
every retained survivor.
