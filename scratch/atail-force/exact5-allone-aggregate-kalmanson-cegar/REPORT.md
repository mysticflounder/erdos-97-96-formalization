# Exact-five all-one aggregate Kalmanson audit

Date: 2026-07-21

Status: **CARD-13 THEOREM-DISCOVERY ONLY. NO SOURCE `sorry` IS CLOSED. THE
INTEGRATED DECISIONS ARE `UNKNOWN`, AND THE CORE BANK IS NOT A COVERAGE
CERTIFICATE.**

## Question

This lane tests the three exact-five all-one B0 orbits from
`exact5-global-cover-parent-gate` against one shared convex-boundary distance
order. It combines every represented `m`, `g0`, `g1`, and `b1` selected-row
equality, the complete exact-five second-apex shell equalities, and the strict
Kalmanson inequalities. It is an aggregate consumer test, not another local
row producer.

The B0 outer is only a card-13 necessary-condition shadow of the live robust
parent. Even an exact B0 decision would not by itself prove the uniform
production theorem.

## Integrated ordinal decision

`integrated_ordinal_cycle_decision.py` adds to the B0 outer:

- exact Floyd-Warshall strong connectivity for all three row families;
- 78 unordered distance-rank atoms;
- 2,706 guarded row/shell rank equalities; and
- all 5,720 one-term Kalmanson cancellation implications.

A satisfying rank assignment is independently replayed by rebuilding the
equality quotient and checking that its strict comparison graph is acyclic.
An `UNSAT` result would still be only an external bounded solver result until
converted to a checked finite certificate or Lean theorem.

All three 600-second QF_FD runs ended `UNKNOWN (timeout)`:

| Orbit | SAT conflicts | Decisions | Result |
|---|---:|---:|---|
| `allOneHitHubLeft` | 3,018,044 | 6,579,950 | `UNKNOWN` |
| `allOneHitHubMiddle` | 2,996,708 | 6,145,181 | `UNKNOWN` |
| `allOneHitHubRight` | 3,098,236 | 6,562,701 | `UNKNOWN` |

This is strong engineering evidence against another longer monolithic rank
run. It is not mathematical evidence for SAT or UNSAT.

## Replayable CEGAR

`ordinal_cycle_cegar.py` instead decodes a structural model, independently
verifies B0, quotients all represented equal-radius facts, extracts a shortest
strict Kalmanson cycle, recovers exact row-membership reasons for every
cancellation and quotient connector, and blocks that sufficient conjunction.

It also contains two sound extensions:

- the missing two-center shared-pair parity cuts between the complete
  second-apex shell and every represented row source, including `b1`; and
- a full linear Kalmanson fallback for an ordinal-acyclic model. The fallback
  keeps all 1,430 Kalmanson inequalities untracked, deletion-minimizes only
  the contingent row equalities, and replays the resulting exact LRA core
  before using its membership dependencies.

The full-linear fallback deliberately omits triangle inequalities,
positivity, MEC geometry, Euclidean realizability, and parent metric fields
beyond the decoded rows and shell. Therefore Kalmanson `UNSAT` is useful, but
Kalmanson `SAT` would only be a linear-shadow survivor.

The three previously stored B0 witnesses independently replay as quotient
self-cycles. Short runs continue to find only replayed self-cycles, but no
orbit has reached coverage `UNSAT` or a verified acyclic/full-Kalmanson
survivor. Every budget stop remains `UNKNOWN`.

## Bank classification and generalization limit

The three current long-wave checkpoints contain 2,729 deletion-minimal LRA
cores. Exact replay classifies them as:

- 2,529 quotient one-term-cancellation cycles; and
- 200 ordinal-acyclic cores that are still Kalmanson-only `UNSAT`.

The split by orbit is:

| Orbit | Quotient cycle | Kalmanson-only residual |
|---|---:|---:|
| Left | 839 | 75 |
| Middle | 856 | 70 |
| Right | 834 | 55 |

`measure_ordinal_schemas.py` removes numeric gaps and quotients by cyclic
rotation. The 2,529 quotient-cycle cores still yield 1,337 distinct schemas;
the 2,309 m-only cores yield 1,156 distinct schemas. The most frequent schema
covers 97 cores, and the top eight cover 408. Thus the current bank does not
collapse to one small missing local theorem.

Eagerly expanding 187,110 embeddings of the existing five-role/three-row
consumer plus 99,164 embeddings of 23 high-yield mined schemas made the first
structural solve time out at 45 seconds. The default CEGAR therefore preloads
the 2,529 concrete proved cores cheaply and leaves generalized embedding
expansion opt-in. This is a solver-engineering decision, not a claim that the
concrete bank covers the B0 surface.

## Current conclusion

The aggregate Kalmanson route remains mathematically plausible, but the
present finite implementation has not closed exact five. The useful durable
result is the corrected normal form:

1. quotient ordinal cycles explain 92.67% of the banked cores;
2. the remaining 7.33% require genuine multi-term Kalmanson/Farkas
   cancellation, not triangle inequalities; and
3. literal or fully expanded schema CEGAR is not converging to coverage.

The next proof-facing step is a compact cut/gap circulation theorem or a
checkable branch-and-bound/Farkas coverage tree over named structural
variables. Another unpartitioned monolithic run or another literal-core queue
is not justified by these results.

## Reproduction

The scripts use the repository's `uv` environment:

```bash
UV_CACHE_DIR=/private/tmp/p97-exact5-aggregate-uv uv run python \
  scratch/atail-force/exact5-allone-aggregate-kalmanson-cegar/integrated_ordinal_cycle_decision.py \
  --orbit allOneHitHubLeft --timeout-ms 600000
```

Repository paths are derived from each script's location; there are no
machine-specific repository paths. The mined bank is disabled by default.
Enabling it requires an explicit `--classification` argument and repeated
explicit `--bank-checkpoint` arguments. Supplying only one side is a CLI
error. With neither supplied, the result records `available: false` and the
live cycle replay still runs.

A bank-free two-iteration smoke completed with independently replayed ordinal
self-cycles and then returned `UNKNOWN (iteration budget)` as required:

```bash
UV_CACHE_DIR=/private/tmp/p97-exact5-aggregate-uv uv run python \
  scratch/atail-force/exact5-allone-aggregate-kalmanson-cegar/ordinal_cycle_cegar.py \
  --orbit allOneHitHubLeft --seconds 10 --max-iterations 2
```

The schema measurement tool likewise accepts only explicit inputs:

```bash
UV_CACHE_DIR=/private/tmp/p97-exact5-aggregate-uv uv run python \
  scratch/atail-force/exact5-allone-aggregate-kalmanson-cegar/measure_ordinal_schemas.py \
  --classification /path/to/classification.json \
  --checkpoint /path/to/left.json \
  --checkpoint /path/to/middle.json \
  --checkpoint /path/to/right.json \
  --output /path/to/measurement.json
```

Syntax verification:

```bash
UV_CACHE_DIR=/private/tmp/p97-exact5-aggregate-uv uv run python -m py_compile \
  scratch/atail-force/exact5-allone-aggregate-kalmanson-cegar/*.py
```
