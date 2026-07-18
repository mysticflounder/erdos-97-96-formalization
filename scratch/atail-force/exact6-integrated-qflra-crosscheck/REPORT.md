# Exact-six integrated QF_LRA cross-check

Date: 2026-07-18

Status: **14 bounded cvc5 runs completed without a verdict.**  The seven full
QF_LRA orbits and the seven weaker Kalmanson-only orbits all reached the exact
300 second cvc5 limit.  They are `TIMEOUT`, not `ERROR`, `UNKNOWN`, `SAT`, or
`UNSAT`.  This lane therefore closes no Lean `sorry` and proves no coverage
claim.

## Purpose

This is an independent direct SMT cross-check of the corrected exact-six
all-center outer.  It does not use the active Z3 CEGAR loop.  It imports the
deterministic structural encoder methods, emits one combined Boolean/linear
SMT-LIB formula per role orbit, and calls cvc5 1.3.3.

The cross-check deliberately omits both the transported 20-schema bank and the
learned 30-schema bank.  Their intended metric force is represented directly:

- one guarded equality for every pair in every selected row;
- one guarded equality for every pair in the exact-five physical-apex shell;
- both strict Kalmanson inequalities for all cyclic quadruples;
- on the full surface, positivity and all strict triangle inequalities.

The source-structural layer includes selected-row strong connectivity and the
new complete-shell/selected-row perpendicular-bisector alternation family.

## Encoding provenance

The generated manifests pin these source hashes:

- `exact6-allcenter-capaware-gate/allcenter_gate.py`:
  `2af4ebe69459f371f25100a80de1a092e81cae75bd62ad87175c1d4c19a5f27b`;
- `exact6-allcenter-coverage-certificate/encode.py`:
  `1d31c875afa50ea03d825d6ddc34ea41928438dddd5f0b50918c4b448ef599d5`.

Each formula has 476 Boolean variables and 91 real distance variables.  The
continuation orbit has 117,347 structural clauses, including:

- 16,382 selected-row strong-connectivity clauses;
- 4,004 selected-row/selected-row alternation clauses;
- 572 complete-shell/selected-row alternation clauses;
- 33,124 center-pair intersection clauses;
- 33,124 target-pair center-multiplicity clauses;
- the exact-five shell, cap bounds, role orbit, blocker map, and critical-row
  constraints recorded category-by-category in the manifest.

No structural category is a transported or learned metric-schema cut.

The Kalmanson-only linear surface has exactly 3,172 assertions:

- 1,092 guarded selected-row pair equalities;
- 78 guarded exact-five apex-shell pair equalities;
- 1,001 Kalmanson-1 inequalities;
- 1,001 Kalmanson-2 inequalities.

The full surface adds 91 positive-distance and 1,092 strict-triangle
assertions, for 4,355 linear assertions.  Strict homogeneous inequalities are
normalized to slack at least one.  This is equisatisfiable with the strict
surface: any strict finite solution can be positively scaled so that its
minimum slack is at least one.

## Orbit ledger

| Orbit | Structural | Full assertions | K-only assertions | Full | K-only |
|---|---:|---:|---:|---|---|
| `continuationOrder` | 117,347 | 121,702 | 120,519 | TIMEOUT 300 s | TIMEOUT 300 s |
| `reverseContinuationOrder` | 117,347 | 121,702 | 120,519 | TIMEOUT 300 s | TIMEOUT 300 s |
| `sharesFirstAtSource` | 117,333 | 121,688 | 120,505 | TIMEOUT 300 s | TIMEOUT 300 s |
| `sharesFirstAtTarget` | 117,333 | 121,688 | 120,505 | TIMEOUT 300 s | TIMEOUT 300 s |
| `sharesSecondAtSource` | 117,347 | 121,702 | 120,519 | TIMEOUT 300 s | TIMEOUT 300 s |
| `sharesSecondAtTarget` | 117,347 | 121,702 | 120,519 | TIMEOUT 300 s | TIMEOUT 300 s |
| `fourDistinct` | 117,373 | 121,728 | 120,545 | TIMEOUT 300 s | TIMEOUT 300 s |

Every stderr log contains the exact cvc5 marker
`cvc5 interrupted by timeout.` and a `global::totalTime` between 300,002 ms and
300,010 ms.  The wrapper originally classified cvc5's signal-terminated
timeout as `ERROR`; `integrated_qflra.py` now recognizes the solver marker, and
`timeout-repair.result.json` records the exact 14-artifact replay to
`BOUNDED_CVC5_NO_VERDICT` / `TIMEOUT`.

The Kalmanson-only surface did generate substantially more theory progress
within the same bound: its arithmetic conflict counts were 5,347--7,922 per
orbit (black-box plus simplex), versus 56--1,696 on the full surface.  That is
performance evidence only; it is not convergence or a verdict.

## Smoke and verification gates

The hand-checkable four-point smoke pair passed:

- retaining only `d(0,1) = d(0,2)` is SAT;
- adding `d(3,1) = d(3,2)` is UNSAT by Kalmanson-1 for cyclic
  `0 < 1 < 2 < 3`.

This validates the strict normalization, equality orientation, cvc5 parser,
and expected SAT/UNSAT distinction on the local kernel of the new alternation
clause.  It does not validate the entire source-to-encoding correspondence.

Reproduction:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/exact6-integrated-qflra-crosscheck/integrated_qflra.py \
  --smoke \
  --output-dir scratch/atail-force/exact6-integrated-qflra-crosscheck/artifacts

UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/exact6-integrated-qflra-crosscheck/integrated_qflra.py \
  --orbit continuationOrder \
  --surface kalmanson-only \
  --timeout-seconds 300 \
  --output-dir scratch/atail-force/exact6-integrated-qflra-crosscheck/artifacts

UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/exact6-integrated-qflra-crosscheck/verify.py
```

The verifier independently replays:

- the smoke answers and SMT hashes;
- all 14 result-to-manifest SMT hashes, local SMT bytes when present, and all
  manifest hashes;
- all 14 exact timeout markers and no-verdict labels;
- the seven-orbit coverage of both surfaces;
- the exact variable, alternation, connectivity, and linear category counts;
- absence of transported/learned cut-bank categories.

## Rigor boundary and consequence

These runs establish only that a direct, unpartitioned cvc5 decision does not
settle either integrated surface within five minutes per orbit.  In
particular:

- there is no SAT model to replay;
- there is no UNSAT proof or solver verdict;
- the result neither supports nor refutes the all-center coverage conjecture;
- extending the same monolithic runs without a new decomposition is not a
  closure strategy.

The weaker Kalmanson-only conflict rate confirms that triangle and positivity
are not helping search.  The next computational move, if this surface remains
load-bearing, should preserve the Kalmanson-only formula but add a proof-facing
decomposition or a uniform positive dual; it should not be reported as a
continuation of a decided integrated census.
