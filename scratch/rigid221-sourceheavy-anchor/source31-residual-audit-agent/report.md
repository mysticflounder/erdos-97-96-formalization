# Source31 residual audit: exact12-v14 static all-cells r2

## Scope and normalization

Read-only audit of:

`scratch/rigid221-sourceheavy-anchor/exact12-v14-source31-static-all-cells-r2/`

The 12 `survivor-cube.json` files were normalized as a 12-tuple in center
order `0..11`; every support was sorted numerically.  Each normalized row
`(center, support)` was mapped to its exact positive choice variable using
`SourceFaithfulCoverInstance(build_model(12, (5, 6, 4)))`, the same candidate
surface used by the source-order bank.  No SAT solve was run.

Each cell is SAT in its summary (`returncode: 10`), with
`proof_verified: false`, and the summaries explicitly scope the artifacts to a
finite discovery accelerator.  The source bank is the 31-entry
`PROOF_BACKED_CUBE_BINDINGS` registry in
`census/card_head/exact12_v14_ordered_coverage.py`.

## Normalized survivors and positive choice variables

Rows are shown as `center:[support]`; the following `positive variables` are
the corresponding 12 choice-variable IDs in center order.

| cell | normalized selected rows | positive variables |
|---:|---|---|
| 0 | 0:[3,4,7,11] 1:[0,2,6,8] 2:[0,1,10,11] 3:[1,4,9,11] 4:[2,6,7,11] 5:[0,3,7,9] 6:[2,4,5,9] 7:[1,3,6,8] 8:[3,5,6,9] 9:[1,2,4,8] 10:[0,2,3,11] 11:[1,5,6,7] | 33,55,155,334,732,887,1358,1605,2034,2204,2431,2895 |
| 1 | 0:[2,3,4,11] 1:[0,2,6,8] 2:[1,7,10,11] 3:[0,4,6,9] 4:[1,2,5,8] 5:[0,1,3,10] 6:[0,2,5,7] 7:[1,3,6,8] 8:[5,6,9,11] 9:[1,4,5,6] 10:[0,1,9,11] 11:[3,4,5,7] | 19,55,160,239,618,824,1182,1605,2074,2243,2424,2972 |
| 2 | 0:[3,4,5,11] 1:[0,2,6,8] 2:[5,7,10,11] 3:[1,2,4,7] 4:[1,2,6,9] 5:[0,1,3,7] 6:[0,3,4,9] 7:[1,3,6,8] 8:[3,6,9,11] 9:[0,1,8,11] 10:[0,2,4,11] 11:[2,7,8,10] | 29,55,172,289,624,821,1200,1605,2046,2109,2437,2968 |
| 3 | 0:[1,2,3,4] 1:[0,2,6,8] 2:[0,1,10,11] 3:[5,6,7,10] 4:[1,2,6,7] 5:[0,6,9,10] 6:[2,4,8,10] 7:[1,3,6,8] 8:[3,5,6,9] 9:[0,2,3,11] 10:[0,4,7,8] 11:[0,1,7,9] | 1,55,155,464,622,918,1366,1605,2034,2117,2483,2742 |
| 4 | 0:[1,2,3,4] 1:[0,2,6,8] 2:[0,1,10,11] 3:[0,1,4,5] 4:[0,3,5,7] 5:[1,6,7,10] 6:[0,2,7,10] 7:[1,6,8,11] 8:[3,5,6,9] 9:[1,2,5,8] 10:[0,4,9,11] 11:[3,7,8,9] | 1,55,155,175,554,997,1189,1641,2034,2209,2488,3002 |
| 5 | identical to cell 1 | 19,55,160,239,618,824,1182,1605,2074,2243,2424,2972 |
| 6 | 0:[3,4,7,11] 1:[0,2,6,8] 2:[1,6,10,11] 3:[1,4,5,8] 4:[0,1,7,9] 5:[0,2,4,10] 6:[1,2,3,8] 7:[3,6,8,11] 8:[1,4,6,9] 9:[5,7,10,11] 10:[1,3,5,7] 11:[3,4,5,9] | 33,55,159,317,516,858,1255,1730,1935,2392,2544,2974 |
| 7 | 0:[2,3,4,10] 1:[0,2,6,8] 2:[1,7,10,11] 3:[0,1,6,10] 4:[2,5,6,9] 5:[1,2,3,9] 6:[0,2,5,11] 7:[3,5,6,8] 8:[3,4,6,9] 9:[2,8,10,11] 10:[1,4,6,7] 11:[0,4,5,9] | 18,55,160,191,716,935,1186,1719,2024,2331,2563,2799 |
| 8 | 0:[2,3,4,11] 1:[0,2,6,8] 2:[4,7,10,11] 3:[1,2,9,10] 4:[1,5,6,11] 5:[0,1,7,9] 6:[3,5,7,11] 7:[1,3,6,8] 8:[4,5,6,9] 9:[0,2,3,7] 10:[0,1,4,5] 11:[1,2,7,8] | 19,55,168,312,662,838,1408,1605,2053,2114,2404,2853 |
| 9 | 0:[3,4,7,11] 1:[0,2,6,8] 2:[0,3,10,11] 3:[2,6,9,10] 4:[1,2,3,10] 5:[0,3,7,9] 6:[0,2,5,11] 7:[1,3,6,8] 8:[1,5,6,9] 9:[2,4,8,11] 10:[0,4,5,6] 11:[4,5,7,8] | 33,55,156,414,614,887,1186,1605,1945,2311,2474,3010 |
| 10 | 0:[2,3,4,10] 1:[0,2,6,8] 2:[1,7,10,11] 3:[2,6,9,10] 4:[1,2,5,8] 5:[0,3,8,11] 6:[0,2,5,7] 7:[1,3,6,8] 8:[3,5,6,9] 9:[0,1,3,4] 10:[0,1,5,11] 11:[0,4,7,9] | 18,55,160,414,618,892,1182,1605,2034,2083,2414,2806 |
| 11 | 0:[2,3,5,10] 1:[0,2,6,8] 2:[3,7,10,11] 3:[1,4,5,7] 4:[0,1,5,8] 5:[2,4,8,11] 6:[0,2,5,7] 7:[1,3,6,8] 8:[4,5,6,9] 9:[0,1,10,11] 10:[1,2,3,4] 11:[0,4,9,10] | 20,55,164,316,506,1047,1182,1605,2053,2110,2509,2810 |

Cross-cell facts:

- Cells 1 and 5 are exact duplicates (all 12 rows and all 12 variables).
- Center 1 is identical in every cell: `[0,2,6,8]`, variable `55`.
- Center 7 is `[1,3,6,8]`, variable `1605`, in 9/12 cells (all except 4, 6,
  and 7).
- Other high-frequency exact rows are center 8 `[3,5,6,9]` / variable `2034`
  in 4/12, center 2 `[1,7,10,11]` / variable `160` in 4/12, and center 6
  `[0,2,5,7]` / variable `1182` in 4/12.
- The intersection of all 12 positive-variable sets is exactly `{55}`; the
  union has 96 variables.

## Comparison with all 31 source-order entries

For each bank entry, `max overlap` is the largest number of its normalized
selected rows that occur in one survivor cube; `cells` lists the attaining
cells.  Positive-variable overlap is identical because the mapping from a
normalized row to a choice variable is injective here.

| id | binding | arity | max overlap | cells |
|---:|---|---:|---:|---|
| 0 | frozenV8 | 11 | 3 | 8 |
| 1 | mixedV3-c2 | 3 | 1 | 0-11 |
| 2 | mixedV3-c4 | 4 | 1 | 8,11 |
| 3 | mixedV3-c5 | 5 | 1 | 2 |
| 4 | mixedV3-c7 | 5 | 2 | 2 |
| 5 | mixedV3-c8 | 3 | 1 | 0-11 |
| 6 | mixedV4-c4 | 5 | 2 | 0,1,2,3,5,6,8,9,10,11 |
| 7 | mixedV4-c1 | 3 | 1 | 11 |
| 8 | mixedV4-c1-second | 3 | 1 | 1,5,7,10 |
| 9 | mixedV4-c1-third | 3 | 1 | 1,5,7,10 |
| 10 | mixedV4-c10 | 6 | 1 | 0,3,4,10 |
| 11 | mixedV4-c2 | 3 | 0 | all |
| 12 | mixedV4-c5 | 3 | 0 | all |
| 13 | mixedV4-c8 | 3 | 1 | 1,5,7,10 |
| 14 | mixedV4-c11 | 3 | 0 | all |
| 15 | mixedV4-c1-fourth | 3 | 1 | 8 |
| 16 | mixedV4-c2-second | 3 | 1 | 0-11 |
| 17 | mixedV4-c10-second | 5 | 1 | 0,2,3,4,10 |
| 18 | mixedV5-c4 | 5 | 2 | 2 |
| 19 | mixedV5-c9 | 5 | 1 | 0-11 |
| 20 | mixedV5-c0 | 5 | 0 | all |
| 21 | mixedV5-c3 | 3 | 0 | all |
| 22 | mixedV5-c11 | 5 | 1 | 0-11 |
| 23 | mixedV6-c9 | 3 | 1 | 0-11 |
| 24 | mixedV6-c6 | 4 | 0 | all |
| 25 | mixedV6-c9-second | 4 | 2 | 0,1,3,4,5,10 |
| 26 | mixedV6-c2 | 3 | 1 | 0,1,2,3,5,8,9,10,11 |
| 27 | mixedV6-c8 | 3 | 2 | 10 |
| 28 | mixedV6-c0 | 3 | 1 | 0 |
| 29 | mixedV6-c6-second | 6 | 2 | 0,1,2,3,5,8,9,10,11 |
| 30 | mixedV6-c10 | 3 | 1 | 0-11 |

Bank arities are 17 entries of 3 rows, 3 of 4 rows, 8 of 5 rows, 2 of 6
rows, and the frozen V8 entry of 11 rows.  No bank entry is a subset of any
survivor cube, so no existing source-backed clause is redundantly falsified by
one of these survivors.  The largest positive overlap is 3/11 (entry 0 in
cell 8); among the shorter entries the largest is 2 rows.

The repeated source-bank-compatible rows are:

- `(center 1, [0,2,6,8], var 55)`: in 13/31 bank entries and all 12 survivors.
- `(center 7, [1,3,6,8], var 1605)`: in entries 0, 6, 26, and 29 and 9/12
  survivors.
- The pair `{55,1605}` occurs in 9/12 survivors and is jointly present in
  entries 0, 6, and 29 (but each of those entries has additional required
  rows).

## Candidate reusable cores

1. **Primary candidate:** the two-row positive core
   `center 1:[0,2,6,8]` + `center 7:[1,3,6,8]`, i.e. variables
   `{55,1605}`.  It is the only small recurring core directly shared with
   multiple bank entries and occurs in 9/12 cells.  A two-row source-backed
   predicate/cut would be high leverage, but it is **not currently proved by
   the registry**: entries 0, 6, and 29 prove only their larger conjunctions.

2. **Universal anchor:** variable `55` alone is present in all 12 survivors
   and 13 bank entries.  It is a useful source-order normalization anchor,
   but a one-row cut cannot be inferred from the existing multi-row nogoods.

3. **Secondary three-row probe:** `{55,1605,1182}` (centers 1, 7, 6 with
   supports `[0,2,6,8]`, `[1,3,6,8]`, `[0,2,5,7]`) occurs in 4/12 cells.
   It is less source-backed than the pair because the center-6 row is not in
   the recurring bank entries 0/6/29.  Treat it as a structural probe, not a
   promotion target.

The exact next proof target is therefore a source-level two-row theorem for
the `{55,1605}` pattern (or a theorem that forces one of the residual rows in
entries 0, 6, or 29).  The present data alone supplies only finite empirical
evidence and does not justify adding that cut.

## Evidence files

- Survivor cubes and SAT summaries:
  `scratch/rigid221-sourceheavy-anchor/exact12-v14-source31-static-all-cells-r2/cell-{0..11}/`
- Source-order registry and positive-variable compiler:
  `census/card_head/exact12_v14_ordered_coverage.py` and
  `census/card_head/exact12_v14_source_order_bank.py`
- Candidate surface and choice-variable numbering:
  `census/card_head/source_faithful_candidate_surface.py`,
  `census/card_head/sat_encoding.py`

