# v26 exact PB-lowering/source-core pilot

## Terminal status

`AUTHENTICATED UNSAT` for the bounded v22 55-fix projection. The projected
raw-source formula was parsed afresh in two independent Z3 contexts and was
`unsat` in both. This is an external Z3 result only: it has no proof
certificate and no Lean/kernel ingress.

No production run was launched and no v19--v25 or live Lean source was
modified.

## Authenticated input

- Z3: `4.16.0`, one thread, process priority `nice -n 15`.
- Raw blob SHA-256: `699807aa782a9083ebec185444b483f7e9da53b4f7a43e45ae923aa82f363067`.
- Raw formula SHA-256: `bce451bab18921a6c0d0d29d5307c8aab59be1c1fc937d991c6b40a8d7ca2720`.
- v22 assignment: 55 fixes, SHA-256
  `6236b55111ff75c45e6b7a2823bbd2ecf40cbbb03b19e6a64a6fd47cc09e9ac1`.

## Exact lowering and audit

Each of the 26 authenticated raw source assertions was lowered separately
after substituting the v22 fixes and its source tracker. PB atoms were replaced
by named Boolean proxies with explicit equivalences. Theory-valued PB children
received their own Boolean equivalences. The authenticated weighted PB shape
(thirteen unit weights and one weight two) was first rewritten exactly to unit
cardinalities. The Boolean side was then lowered by
`card2bv,pb2bv,bit-blast,tseitin-cnf`. Every fresh Boolean was deterministically
renamed and mapped to its source group and PB definition.

The final guarded formula has 216,671 assertions, 105 PB definitions, and
2,520 mapped auxiliaries. Its SHA-256 is
`6d4cff11741fb0a12248e227665ff6d45c8acc6bb9a31f698beca755d869ea76`.
The recursive syntax/sort audit classifies all 579,816 visited nodes as
QF_LRA, with exactly zero PB nodes, integer nodes, bit-vector nodes, nonlinear
nodes, ITEs, quantifiers, arrays, or uninterpreted-function applications.

## Returned source core and exact pattern

Z3 returned three source selectors (core SHA-256
`6fa2c6a75e6b53e61ae594a7a7839608d5f0b4550db5b76149e89c0d6f6e55a1`):

1. `track_cyclic_alternation_cut` (raw source 7; 60,810 lowered assertions),
2. `track_exact_rich_profiles` (raw source 9; 3,495 lowered assertions), and
3. `track_strict_kalmanson` (raw source 23; 2,730 lowered assertions).

The exact-rich group supports all 55 fixed rich-profile Booleans, so source
projection does not shrink the v22 assignment. Its 14 true Booleans are:

```text
rich_1_0_6 rich_1_0_7
rich_1_1_3 rich_1_1_4 rich_1_1_5 rich_1_1_8
rich_2_0_2 rich_2_0_6 rich_2_0_8 rich_2_0_10
rich_2_1_4 rich_2_1_9 rich_2_1_11 rich_2_1_12
```

Semantically, both fixed apices use profile D: two distinct, disjoint radius
classes, each of support cardinality four and containing exactly two interior
points; their interior supports cover the relevant interior, and the exact-n15
third-K4 cap is imposed. Strict Kalmanson constraints plus the explicit cyclic
alternation cuts make this fixed incidence pattern inconsistent. The source
documents the cyclic cuts as consequences already implied by strict
Kalmanson; this run requested a solver core but did not deletion-minimize it,
so the three-group result must not be advertised as an irredundant core.

## Independent raw replay

Both fresh parses selected exactly the three tracker groups above and all 55
fixes. Both returned `unsat`, with identical derived-formula SHA-256
`80d7b73d4a16784ca0880285b3b2f279ac0c07fa751aeb962b29100f00f6b3d0`
and selected-source SHA-256
`0c32d1f16e30e22d67bdc2177d7401e792aefb128db01f062784146fd166213a`.
The two solve times were approximately 0.74 seconds each.

## Global theorem-bank audit

The required current-project prose search and all four named P97 bank
registries were checked. They contain related cyclic-separation and five-point
Kalmanson consumers, but no declaration matching this exact n=15 two-apex
rich-profile contradiction.

Exactly one indexed Lean search was used. The closest concrete declaration was
`false_of_retainedOccurrence` in
`RetainedKalmansonDecoder.lean`; it consumes a card-11 boundary labeling,
faithful carrier pattern, and `RetainedOccurrence`. It is not directly
applicable to the v26 n=15 assignment. The first missing reuse bridge is a
proved transformation from the v26 exact-rich/cyclic pattern to that card-11
`RetainedOccurrence` representation (including the required carrier and
boundary labeling). Therefore this audit establishes an analogy and a bridge
target, not Lean closure or theorem reuse.

## Reproduction

```bash
nice -n 15 uv run python \
  scratch/retained-omission-e1/round5-general-cegar/round5_pb_lowering_core_v26.py \
  --timeout-ms 180000 --replay-timeout-ms 120000
```

The executable JSON artifact is `v26-pb-lowering-source-core.json`. Direct
invocation of the three test functions passed; this repository environment did
not expose a `pytest` executable through `uv run`.
