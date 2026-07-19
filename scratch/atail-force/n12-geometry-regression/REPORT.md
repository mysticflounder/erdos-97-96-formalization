# n=12 and n=13 outer-carrier geometry regression

Date: 2026-07-17

Status: **THE INDEPENDENTLY VERIFIED `n = 12` AND `n = 13` OUTER SAT
CARRIERS BOTH FAIL AT THE FIRST GEOMETRIC LAYER.  THEIR SELECTED
EQUAL-DISTANCE ROWS ARE INCOMPATIBLE WITH THEIR STORED STRICT CONVEX CYCLIC
ORDERS.  EACH HAS A TWO-INEQUALITY EXACT KALMANSON CERTIFICATE ALREADY
CONSUMABLE BY PRODUCTION
`ATailOrdinalKalmansonCycle.false_of_two_cycle`.  MEC/CAP AND COMMON-CRITICAL-
MAP LAYERS ARE NOT REACHED.  THESE ARE TWO PER-CARRIER ELIMINATIONS, NOT
UNIFORM LIVE COVERAGE, AND THEY CLOSE NO SOURCE `sorry`.**

## Scope and source

This lane owns only `scratch/atail-force/n12-geometry-regression/`.  It does
not edit production Lean, shared plans, `surplusM44`, `ShellCurvature`, or the
protected five-point/card-654 work.  No Lean or Lake build was run.

The input is the saved carrier

```text
scratch/atail-force/uniform-cycle-coverage-audit/
  front-before-isosceles-cegar/higher_n/n12_a1_front218.result.json
```

with SHA-256

```text
af1033d55cec83f8242efa4e4c92eac8cfe1c5456fefa4627e1ef2f55a2eb64d
```

This is the same hash recorded by `higher_n/checkpoint.json`.  The source
payload records a CaDiCaL SAT assignment whose CNF clauses were substitution-
checked by the encoder.  The sibling `n12_a1_front218.verify.json` independently
replays the complete Boolean outer specification and all 352,572 embeddings of
the 218 preloaded schema cuts.

`carrier.json` is a compact export of the exact decoded object: cyclic order
`0,1,...,11`, twelve four-member rows, and the total blocker map.  The fresh
`run_regression.py` replay independently checks:

- four distinct nonself members in every row;
- pairwise row intersection at most two;
- pair codegree at most two;
- alternation of every shared pair across its two centers;
- strong connectivity of the selected witness digraph; and
- the total blocker map, apex avoidance, and source membership in the blocker
  row.

The replay status is `VERIFIED` in `check_results.json`.

The identical replay was also run on the independently verified `n = 13`
source payload (SHA-256
`d0bb8ff3ef1c2c13a7dc41741699661a38a620b9c5c9b550fc037840a75a917f`).
Its compact export and all derived artifacts are under `n13/`.

## Required theorem-bank preflight

Before deriving a local metric contradiction, this lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed searches included:

```text
nthdegree docs search --lean
  "strictly convex cyclic order equal distance rows twelve point carrier realizability critical shell blocker"

nthdegree docs search --lean
  "two strict Kalmanson inequalities selected shell equalities contradiction distance cycle"
```

The decisive existing consumers are already in production:

```text
Problem97.CapCrossingKalmansonBridge
  .dist_add_dist_lt_diagonal_sum_of_ccw

Problem97.CapCrossingKalmansonBridge
  .complementary_dist_add_dist_lt_diagonal_sum_of_ccw

Problem97.ATailOrdinalKalmansonCycle.false_of_two_cycle
```

The extracted eight-role membership schema is absent from both the active
218-schema bank and the broader 262-schema direct-CNF bank.  The checks and
bank hashes are in `schema_bank_check.json` and
`schema_full_bank_check.json`.  Thus the mathematics is not a new consumer;
the new object is a missed transported incidence schema for an existing
consumer.

## Layer-one decision

Any planar realization by distinct points in the stored strict convex cyclic
order satisfies, for every `a < b < c < d`, both strict Kalmanson inequalities

```text
d(a,b) + d(c,d) < d(a,c) + d(b,d)
d(a,d) + d(b,c) < d(a,c) + d(b,d).
```

The selected row at each center identifies its four incident distance terms.
These are necessary consequences of the requested first layer; no MEC,
nonobtuse support triangle, cap placement, critical blocker, or deletion fact
is encoded.

Two independently generated exact QF_LRA encodings were checked:

| encoding | variables | row equalities | strict Kalmanson constraints | Z3 4.17.0 | cvc5 1.3.3 |
|---|---:|---:|---:|---|---|
| direct unordered distances | 66 | 36 | 990 | UNSAT | UNSAT |
| independently quotient by all row equalities | 34 | substituted | 990 | UNSAT | UNSAT |

The strict homogeneous system is normalized by requiring every strict slack
to be at least one.  This is equivalence-preserving: a realization of the
finite strict homogeneous system has a positive minimum slack and can be
scaled to meet the normalization; a normalized solution is immediately
strict.

The solver verdict is not the endpoint.  Z3's quotient unsat core identifies
only two inequalities, and `verify_two_cycle.py` replays the resulting
certificate directly from `carrier.json`, without calling either solver or
importing the QF_LRA encoder.

## Exact two-cycle certificate

Only the cyclic subsequence

```text
0 < 1 < 2 < 3 < 5 < 6 < 7 < 8
```

is used.  Six row equalities give

```text
row 5: d05 = d58
row 0: d07 = d02
row 2: d02 = d23
row 7: d78 = d67
row 6: d67 = d26
row 1: d13 = d16.
```

The complementary Kalmanson inequality on `0 < 5 < 7 < 8` is

```text
d05 + d78 < d07 + d58.
```

After the row-5 cancellation and the two equality paths, this says

```text
d26 < d23.
```

The other Kalmanson inequality on `1 < 2 < 3 < 6` is

```text
d16 + d23 < d13 + d26.
```

After the row-1 cancellation, this says

```text
d23 < d26.
```

This is the two-edge strict cycle consumed by
`ATailOrdinalKalmansonCycle.false_of_two_cycle`.  In normalized linear form,
the two inequalities are

```text
left - right >= 1
right - left >= 1.
```

Unit Farkas multipliers sum them to `0 >= 2`.  The independently replayed
machine certificate is `minimal_two_cycle.json`; its verification result is
`minimal_two_cycle.verify.json` with status `VERIFIED`, twelve checked row
memberships, six checked row equalities, two increasing quadruples, zero
uncancelled coefficients, and summed right-hand side two.

The reflection-canonical transported schema is

```json
[[0,2],[0,6],[1,3],[1,5],[2,0],[2,3],
 [4,0],[4,7],[5,2],[5,6],[6,5],[6,7]]
```

on eight increasing roles.

## Exact conclusion and route implication

The first failed live field is:

```text
PLANAR_STRICT_CONVEX_CYCLIC_REALIZATION
```

More precisely, the carrier violates a theorem-backed necessary linear
consequence of that field.  Therefore it cannot be a planar Euclidean strict-
convex realization, and it is unnecessary to test:

1. MEC/nonobtuse cap placement; or
2. common `CriticalShellSystem`/blocker coupling.

This result does **not** show that the outer encoding is wrong.  It shows that
the 218-schema preload is incomplete: it admitted a Boolean carrier containing
an eight-role schema already refutable by the generic production ordinal-cycle
consumer.  Adding this canonical schema is a sound next CEGAR refinement.

It also does **not** prove that every arbitrary-cardinality live carrier
contains this schema, decide the strengthened outer problem after adding the
cut, or close a source `sorry`.  Any such statement still needs a checked
coverage theorem or a terminal exhaustive certificate.

## Independent `n = 13` regression

The same exact test gives:

| encoding | variables | row equalities | strict Kalmanson constraints | Z3 4.17.0 | cvc5 1.3.3 |
|---|---:|---:|---:|---|---|
| direct unordered distances | 78 | 39 | 1,430 | UNSAT | UNSAT |
| independently quotient by all row equalities | 40 | substituted | 1,430 | UNSAT | UNSAT |

The new `n = 12` eight-role schema does **not** embed in the `n = 13`
carrier; `n13/n12_schema_embedding.json` reports `ABSENT`.  Z3's quotient
core instead exposes a smaller existing-consumer match on

```text
0 < 1 < 3 < 6 < 11 < 12.
```

Four row equalities give

```text
row 1:  d1,12 = d1,3
row 6:  d0,6  = d6,11
row 12: d0,12 = d11,12
row 11: d11,12 = d3,11.
```

The Kalmanson inequality on `0 < 1 < 3 < 12`, after the row-1
cancellation, gives

```text
d0,12 < d0,3.
```

The complementary inequality on `0 < 3 < 6 < 11`, after the row-6
cancellation and the row-12/row-11 equality path, gives

```text
d0,3 < d0,12.
```

Again, unit Farkas multipliers give `0 >= 2` after slack normalization, and
the exact endpoint is production `ATailOrdinalKalmansonCycle.false_of_two_cycle`.
`n13/minimal_two_cycle.verify.json` independently checks eight memberships,
four equalities, two increasing quadruples, and exact coefficient
cancellation.

Its reflection-canonical six-role schema is

```json
[[0,1],[0,5],[1,0],[1,3],[2,1],[2,5],[4,0],[4,3]]
```

and is absent from both the 218- and 262-schema banks.  This second carrier
therefore reinforces the same diagnosis: the outer Boolean abstraction is
admitting theorem-refutable Kalmanson cycles that the preloaded literal bank
does not yet cover.  It does **not** establish uniform occurrence of either
the six-role or eight-role pattern.  Conversely, the six-role `n = 13`
schema does not embed in the `n = 12` carrier; the two eliminations are
genuinely distinct literal refinements.

## Reproduction

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-n12 uv run python \
  scratch/atail-force/n12-geometry-regression/run_regression.py \
  --source scratch/atail-force/uniform-cycle-coverage-audit/front-before-isosceles-cegar/higher_n/n12_a1_front218.result.json \
  --output-dir scratch/atail-force/n12-geometry-regression \
  --timeout 60

UV_CACHE_DIR=/tmp/uv-cache-n12 uv run python \
  scratch/atail-force/n12-geometry-regression/extract_two_cycle.py \
  --carrier scratch/atail-force/n12-geometry-regression/carrier.json \
  --output scratch/atail-force/n12-geometry-regression/minimal_two_cycle.json

UV_CACHE_DIR=/tmp/uv-cache-n12 uv run python \
  scratch/atail-force/n12-geometry-regression/verify_two_cycle.py \
  --carrier scratch/atail-force/n12-geometry-regression/carrier.json \
  --certificate scratch/atail-force/n12-geometry-regression/minimal_two_cycle.json \
  --output scratch/atail-force/n12-geometry-regression/minimal_two_cycle.verify.json

UV_CACHE_DIR=/tmp/uv-cache-n12 uv run python \
  scratch/atail-force/n12-geometry-regression/run_regression.py \
  --source scratch/atail-force/uniform-cycle-coverage-audit/front-before-isosceles-cegar/higher_n/n13_a1_front218.result.json \
  --output-dir scratch/atail-force/n12-geometry-regression/n13 \
  --timeout 60

UV_CACHE_DIR=/tmp/uv-cache-n12 uv run python \
  scratch/atail-force/n12-geometry-regression/extract_n13_two_cycle.py \
  --carrier scratch/atail-force/n12-geometry-regression/n13/carrier.json \
  --output scratch/atail-force/n12-geometry-regression/n13/minimal_two_cycle.json
```

## Artifacts

- `carrier.json`: exact compact carrier export and source hash;
- `checkpoint.json`: fail-closed combined `n = 12`/`n = 13` summary with
  artifact hashes and the explicit per-carrier scope warning;
- `check_results.json`: layer ledger, both encodings, four solver verdicts,
  and outer replay;
- `strict_kalmanson_direct.smt2`: direct 66-distance QF_LRA instance;
- `strict_kalmanson_quotient.smt2`: independent equality-quotient instance;
- `minimal_two_cycle.json`: exact two-inequality/Farkas certificate and
  canonical schema;
- `minimal_two_cycle.verify.json`: independent semantic/certificate replay;
- `schema_bank_check.json`: absence from `bank_218.json`;
- `schema_full_bank_check.json`: absence from the 262-schema direct-CNF bank;
- `run_regression.py`, `extract_two_cycle.py`, `verify_two_cycle.py`, and
  `check_schema_bank.py`: reproducible drivers;
- `n13/`: independent `n = 13` carrier, QF_LRA encodings/results, schema
  embedding check, exact six-role two-cycle, and bank-absence checks; and
- `extract_n13_two_cycle.py` and `find_schema_embedding.py`: the additional
  `n = 13` extraction and cross-carrier schema check; and
- `make_checkpoint.py`: validates and emits the combined checkpoint.
