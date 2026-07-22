# Guarded source-subset refinement protocol

Date: 2026-07-22

Status: **ENGINEERING PATH SMOKE-TESTED.  NO NEW UNSAT VERDICT IS CLAIMED BY
THIS DOCUMENT.**

This protocol refines a saved source core without confusing a Tseitin clause
core with a source-level core.  It has two independently checked SAT stages:

1. solve and DRAT-check a source-guarded encoding, then use its checked clause
   core only to select marker units; and
2. rebuild the selected source assertions without guards, solve that new CNF,
   and DRAT-check the new proof.

Only the second checked UNSAT establishes that the projected source subset is
itself inconsistent.  A list of marker units extracted from a trimmed guarded
proof is an intermediate candidate, not a verdict.

## Exporter invariant

`bitblast_guarded_source_subset_cnf.py` takes a saved source-core JSON and:

- rebuilds the current orbit source formula;
- rejects an out-of-range or duplicate source index;
- compares every rebuilt assertion s-expression to the saved one and fails on
  drift;
- assigns one marker to each selected assertion;
- bit-blasts `marker -> assertion` through a marker-safe pipeline that omits
  `propagate-values` and `solve-eqs`;
- requires every named marker to survive as a distinct DIMACS variable;
- appends exactly one positive marker unit and no negative marker unit; and
- writes `marker_sources`, a complete position/name/variable/source-index/
  assertion map, plus the input and output SHA-256 hashes.

The omission of `propagate-values` and `solve-eqs` is deliberate.  Those
tactics are useful for an ordinary unguarded CNF, but applying them while the
activation variables are free can eliminate information needed when marker
units are added later.

## Deterministic smoke gate

Run:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --no-project python \
  scratch/atail-force/exact5-all-one-ordinal-rank/smoke_guarded_source_subset.py
```

The checked 2026-07-22 run used the middle orbit, seed 17, and source indices
0 through 7.  Z3 found the original eight-assertion source subset SAT;
CaDiCaL found the emitted guarded CNF SAT; all eight marker units and source
associations passed the structural audit.  Two consecutive runs emitted the
same CNF hash:

```text
c5d6142eea745619624a4906cdb51c5178c177a78d863c30d4e38ca61fc030cf
```

This is an encoder smoke test, not evidence about the full saved core.

## Stage 1: guarded solve and marker projection

The following example refines `middle.source-core.from-drat.json`.  Use a
bounded solver time appropriate to the active run; `3600` is illustrative,
not a recorded result.

### 1. Export the guarded saved core

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --no-project python \
  scratch/atail-force/exact5-all-one-ordinal-rank/bitblast_guarded_source_subset_cnf.py \
  --core scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-core.from-drat.json \
  --seed 17 \
  --output-cnf scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.cnf \
  --output-map scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.map.json
```

Before solving, retain the map JSON.  It is the authoritative association
between a positive marker unit and the saved source assertion.

### 2. Run CaDiCaL with a proof output

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --no-project python \
  scratch/atail-force/exact5-all-one-ordinal-rank/run_cadical.py \
  --cnf scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.cnf \
  --proof scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.drat \
  --log scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.cadical.log \
  --output scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.cadical.json \
  --seconds 3600 \
  --default-options
```

Stop if this is `SAT` or `UNKNOWN`.  Neither status permits core projection.

### 3. Independently check the DRAT proof

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --no-project python \
  scratch/atail-force/exact5-all-one-ordinal-rank/check_drat.py \
  --cnf scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.cnf \
  --proof scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.drat \
  --log scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.drat-check.log \
  --output scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.drat-check.json \
  --timeout-seconds 1800
```

Require both exit code zero and `s VERIFIED` in the checker log.

### 4. Trim the verified proof to a clause core

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --no-project python \
  scratch/atail-force/exact5-all-one-ordinal-rank/trim_to_lrat.py \
  --cnf scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.cnf \
  --proof scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.drat \
  --core scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.core.cnf \
  --lrat scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.lrat \
  --log scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.trim.log \
  --output scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.trim.json \
  --timeout-seconds 3600
```

Again require `s VERIFIED` and the recorded hashes.  Do not project from an
unchecked core CNF.

### 5. Project retained positive marker units

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --no-project python \
  scratch/atail-force/exact5-all-one-ordinal-rank/extract_guarded_source_core.py \
  --map scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.map.json \
  --core-cnf scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.core.cnf \
  --output scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.projected-source-core.json
```

The extractor cross-checks the compact `marker_sources` table against the
compatibility `marker_variables` map and rejects a guarded-subset core with no
retained positive marker unit.

At this point the output is only a **projected source-core candidate**.

## Stage 2: unguarded rebuild and independent refutation

### 6. Rebuild exactly the projected assertions without guards

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --no-project python \
  scratch/atail-force/exact5-all-one-ordinal-rank/bitblast_source_subset_cnf.py \
  --core scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.guarded.projected-source-core.json \
  --seed 17 \
  --output-cnf scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.refined.cnf \
  --output-metadata scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.refined.cnf.json
```

This rebuild repeats the s-expression drift check against the current source.
It does not reuse guarded Tseitin clauses or the guarded proof.

### 7. Re-solve and emit a fresh proof

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --no-project python \
  scratch/atail-force/exact5-all-one-ordinal-rank/run_cadical.py \
  --cnf scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.refined.cnf \
  --proof scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.refined.drat \
  --log scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.refined.cadical.log \
  --output scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.refined.cadical.json \
  --seconds 3600 \
  --default-options
```

Stop on `SAT` or `UNKNOWN`.  If UNSAT, check the new proof:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --no-project python \
  scratch/atail-force/exact5-all-one-ordinal-rank/check_drat.py \
  --cnf scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.refined.cnf \
  --proof scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.refined.drat \
  --log scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.refined.drat-check.log \
  --output scratch/atail-force/exact5-all-one-ordinal-rank/middle.source-subset.refined.drat-check.json \
  --timeout-seconds 1800
```

Only after this second `s VERIFIED` may the projected source subset be labeled
**DRAT-VERIFIED EXTERNAL UNSAT**.  It is still not a Lean theorem: the final
step is to generate the Lean Boolean ingress for those exact source indices
and replay a checked certificate in the kernel.

## Failure policy

- Any assertion drift, missing marker, duplicate marker variable, DIMACS count
  mismatch, or hash mismatch is a hard exporter failure.
- `SAT` must be treated as a candidate model and checked against the source
  assertions before drawing a mathematical conclusion.
- `UNKNOWN` is unresolved under the stated budget.
- An unchecked CaDiCaL `UNSAT` is not bankable.
- A guarded DRAT core alone is not a source contradiction.
- No result transfers between left, middle, and right orbits merely because
  source indices coincide; each transported source list must be rebuilt and
  drift-checked in its target orbit.
