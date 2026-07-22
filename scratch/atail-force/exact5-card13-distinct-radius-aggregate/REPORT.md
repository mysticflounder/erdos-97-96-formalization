# Exact-five card-13 distinct-radius aggregate gate

Date: 2026-07-22

Status: **ONE BOUNDED RECURSIVE CUBE REFINEMENT COMPLETE.  NO SAT WITNESS;
OVERALL STATUS REMAINS UNKNOWN.**

This isolated scratch lane encodes the two asymmetric spoke orientations of
the exact-five, card-13, distinct-first-apex-radius branch.  It retains the
fixed critical map, both independent global-cover row families, both retained
parent rows, the exact-five second-apex profile, and the complete source
two-hit normal form.

Unlike the closed same-radius lane, it does not assume a six-point first-apex
class.  Its first-apex contract is the kernel-checked distinct normal form:

- two disjoint complete exact-four classes;
- a `2+2` partition of the four strict first-opposite-cap points; and
- equality of the retained q-deleted first row with the double-deletion class.

`surface.py` adds a finite ordinal-distance necessary condition, exact-class
and unique-K4 rank exclusions, and a static bounded-reachability encoding of
strong connectivity for all three selected-witness digraphs.  It deliberately
does not encode planar coordinates, MEC geometry, `noM44`, or full subset
minimality.

Run both orientations with:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run --no-project python \
  scratch/atail-force/exact5-card13-distinct-radius-aggregate/run_both.py \
  --timeout-seconds 60
```

The driver runs a hand-known SAT/UNSAT/DRAT smoke test, exports each orbit in
two fresh processes and requires byte-identical CNFs, then runs bounded
CaDiCaL.  All build logs, clause counts, hashes, and SAT/UNSAT/UNKNOWN results
are saved under `artifacts/`.

## Smoke result

The hand-known rank/CNF pipeline gate passes:

- `x < 3`, `y < 3`, `y > x` is Z3-SAT and CaDiCaL-SAT;
- `x < 3`, `y < 3`, `x = y`, `x > y` is Z3-UNSAT and
  CaDiCaL-UNSAT; and
- `drat-trim` verifies the hand-known UNSAT proof.

`source_smoke.py` separately checks the static strong-connectivity encoding on
a hand-fixed directed 13-cycle (SAT) and two disjoint directed cycles (UNSAT),
then probes the finite source projection before adding ordinal ranks.

Both finite source projections are SAT and independently decode through the
existing solver-independent verifier:

| Orbit | Source assertions | Z3 result | Decoded verification |
| --- | ---: | --- | --- |
| `asymmetricSourceLeft` | 41,316 | SAT (5.94 s) | PASS |
| `asymmetricSourceRight` | 41,316 | SAT (5.49 s) | PASS |

This is an important smoke result: the new `B1 = double` and distinct-class
contracts do not make the finite incidence surface inconsistent by
themselves.  The 60-second UNKNOWN results arise only after the exact-class
rank exclusions and ordinal Kalmanson layer are added.

Both full formulas were exported twice in fresh processes.  Each repeated CNF
was byte-identical to its first export.

| Orientation | Normalized orbit | Variables | Clauses | SHA-256 prefix | 60 s CaDiCaL |
| --- | --- | ---: | ---: | --- | --- |
| direct | `asymmetricSourceLeft` | 73,190 | 677,677 | `1669221a2e879125` | UNKNOWN |
| mirror | `asymmetricSourceRight` | 73,190 | 677,662 | `347a6a6bcd207be3` | UNKNOWN |

CaDiCaL terminated normally at its internal wall limit in both cells (exit
code zero, printed `UNKNOWN`).  The partial DRAT streams are not certificates
and are retained only as replay/debug artifacts.  No SAT or UNSAT claim is
made.

## Assumption-block ablation

`surface.build` accepts an optional set of enabled formula blocks.  The
default still enables every block and reproduces the original direct CNF hash
exactly.  The 8-worker, 20-second-per-cell ablation is recorded in
`artifacts/ablation/summary.json`.

Removing connectivity, complete-class constraints, any one unique-K4 block,
or all three unique-K4 blocks left both orientations UNKNOWN.  Removing the
entire Kalmanson block made both orientations SAT in under three seconds, and
the independent decoder checked every CNF clause:

| Profile | Direct | Mirror |
| --- | --- | --- |
| full | UNKNOWN | UNKNOWN |
| no connectivity | UNKNOWN | UNKNOWN |
| no complete classes | UNKNOWN | UNKNOWN |
| no unique-K4 second/first/critical | UNKNOWN | UNKNOWN |
| no all unique-K4 blocks | UNKNOWN | UNKNOWN |
| no Kalmanson | SAT, verified (2.66 s) | SAT, verified (2.80 s) |

A complementary composition run retained Kalmanson while disabling all or
selected auxiliary blocks.  Every such profile remained UNKNOWN.  Thus the
only decisive block boundary under this budget is the interaction between
the selected-row equalities and strict Kalmanson cancellation.  This does not
prove that the full formula is UNSAT, nor that the other blocks are logically
redundant.

## Portfolio and preprocessing profile

An 8-process, 90-second CaDiCaL portfolio on the two unmodified deterministic
CNFs returned eight UNKNOWN verdicts.  The exact configurations and conflict
counts are in `artifacts/portfolio/summary.json`.

Raw `march_cu` did not finish a depth-8, limit-64 partition within 120 seconds.
CaDiCaL `-P3` preprocessing, with an extension stack retained for SAT model
reconstruction, reduced the formulas as follows:

| Orientation | Original clauses | Simplified clauses | Simplified SHA-256 prefix |
| --- | ---: | ---: | --- |
| direct | 677,677 | 375,841 | `7ae2f7de798b22a6` |
| mirror | 677,662 | 375,863 | `21e87780e8303e8` |

`march_cu` then produced a complete 64-cube, maximum-width-8 partition for
each simplified orientation in about 73 seconds.  Four whole-partition
CaDiCaL configurations per orientation were still UNKNOWN after 90 seconds.

Solving the 128 parent cubes independently for 15 seconds each gave:

| Orientation | UNSAT, not yet proof-backed | UNKNOWN | SAT |
| --- | ---: | ---: | ---: |
| direct | 32 | 32 | 0 |
| mirror | 23 | 41 | 0 |

This parent pass is a profile only.  Its 55 UNSAT cells were not emitted with
replayable proofs and therefore are not counted as certified eliminations.

## One-level recursive refinement

`recursive_recube.py` refines exactly the 73 UNKNOWN parent cubes and stops
after one level:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run --no-project python \
  scratch/atail-force/exact5-card13-distinct-radius-aggregate/recursive_recube.py \
  --workers 8 --child-depth 3 --child-limit 8 \
  --recube-timeout-seconds 60 --solve-timeout-seconds 15 \
  --proof-timeout-seconds 120
```

All 73 parents produced bounded child partitions.  Parent orientation/index,
parent assumptions, child assumptions, original and simplified CNF hashes,
the preprocessing extension-stack hash, and each `march_cu` partition hash
are recorded in `artifacts/recursive-recubing/summary.json`.

The 575 children split as follows:

| Result | Count | Acceptance rule |
| --- | ---: | --- |
| UNSAT | 338 | CaDiCaL UNSAT and `drat-trim` replay PASS |
| UNKNOWN | 237 | timeout or no independently accepted verdict |
| SAT | 0 | none found |

The 338 retained gzip-compressed DRAT artifacts total 1,514,891,556 bytes.
No CaDiCaL UNSAT verdict failed replay.  A future SAT child would count only
after its simplified model was checked, extended through the matching
CaDiCaL stack, and checked against the original deterministic CNF; that path
was not exercised because no SAT child occurred.

Eight formerly UNKNOWN parent subtrees are completely covered by verified
UNSAT child proofs:

| Orientation | Parent cube indices |
| --- | --- |
| direct | 0, 37, 42, 46 |
| mirror | 32, 33, 42, 56 |

The remaining frontier is 65 parent subtrees: 28 direct and 37 mirror.  This
run intentionally does not recurse into their 237 UNKNOWN children.

The overall status is still UNKNOWN.  In addition to those live children,
the 55 first-pass UNSAT parents have no retained proof artifacts.  Even a
complete external UNSAT result would remain conditional on the source-to-CNF
ingress audit and would not itself be a kernel-checked Lean proof.

## Formula block counts

The block counts are identical in both orientations:

| Block | Count |
| --- | ---: |
| audited base parent/global-cover assertions | 37,363 |
| retained-role assertions | 2,847 |
| distinct parent coupling assertions | 14 |
| static connectivity assertions | 1,092 |
| connectivity auxiliary variables | 1,014 |
| rank atoms / bit width | 78 / 7 |
| selected-row rank equalities | 2,838 |
| complete-class rank inequalities | 1,056 |
| unique-K4 rank exclusions | 7,425 |
| strict-Kalmanson cancellation implications | 5,720 |
| total pre-bitblast assertions | 58,433 |

The source-to-formula map is not yet kernel-checked, so even a future
DRAT-verified UNSAT result would remain conditional on that ingress audit.
Conversely, a future SAT assignment would be only an ordinal necessary-
condition witness and would still require planar/MEC validation.
