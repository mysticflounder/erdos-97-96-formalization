# Census-554 structural-first scheduling experiment

Date: 2026-07-12

## Question and result

The experiment tested two distinct ideas against the frozen Census-554
separation oracle:

1. run the theorem-backed structural detector before algebra-bank embedding
   expansion; and
2. preseed every candidate-row-feasible instance of the
   perpendicular-bisector template.

The evidence supports the first change and rejects the second.  Structural
first was faster in both a clean-start run and two mature-frontier repeats.  A
bulk preseed made the structural-first run slower because 23,214 extra clauses
saved only 131 dynamic cuts in 100 iterations.

This is an **EMPIRICAL search-policy result**, not a closure result or a
time-to-closure estimate.  Every experiment stopped normally at its iteration
cap with status `budget`; none reached a solver frontier or verified UNSAT.

## Preservation and controls

The live run was never paused, signalled, or mutated.  The mature experiments
used the offline iteration-920 snapshot

```text
scratch/census-554/separation_probe_runs/
  experiment-source-20260712T0648Z
```

whose checkpoint contains 1,906,754 ordered dynamic records.  The source bank
has 5,836 rows and SHA-256
`36348d35397a494bee5ac0ab9e423c20802e7aff45fa12f0530df36a57cfc43a`.
The source snapshot, private experiment arms, and all completed arm databases
returned `PRAGMA integrity_check = ok`.  Source artifact hashes were unchanged
after the experiments.

The clean-start comparison used

```text
scratch/census-554/separation_probe_runs/
  experiment-clean-source-20260712T0733Z
```

at iteration 0 with zero checkpointed dynamic records and the common 156,278
static formula instances.  All arms used the same bank, seed, probe hash, and
runtime dependency fingerprints.  Their trajectories diverge after the first
different refinement, so equal iteration counts are not equal frontier
progress.

## Clean-start three-arm result

Manifest:

```text
scratch/census-554/separation_experiments/
  experiment-20260712T073359Z-39424-4c4f2503/experiment_manifest.json
```

| Policy | Wall, 100 iterations | Solver | Refinement | Dynamic cuts | Final formula instances |
|---|---:|---:|---:|---:|---:|
| bank first | 331.075 s | 156.974 s | 141.989 s algebra | 78,820 | 235,098 |
| structural first | 216.074 s | 174.915 s | 11.277 s structural | 3,365 | 159,643 |
| structural first plus preseed | 253.236 s | 206.859 s | 14.915 s structural | 3,234 | 182,726 |

Structural first reduced wall time by 34.74% (1.532x throughput) and dynamic
cuts by 95.73%.  It found a safe structural contradiction for all 100
candidates and made no algebra call.  The solver was actually 11.43% slower;
the net gain came from replacing 141.989 seconds of algebra expansion with
11.277 seconds of structural detection.

The preseed enumerates exactly 23,250 candidate-row-feasible patterns.  Of
these, 36 were already among the static seeds and 23,214 were newly installed.
It saved only 131 dynamic cuts relative to plain structural first, carried
23,143 more clauses in the iteration-100 CNF, and increased wall time by
17.20%.  It should not be enabled.

The decisive structural family by clean-start candidate was:

| Family | Candidates |
|---|---:|
| duplicate center | 91 |
| perpendicular bisector | 5 |
| equilateral-bisector collision | 2 |
| convex five-point | 1 |
| three-triad collision | 1 |

This explains why preloading the perpendicular-bisector family was a poor
trade: it was not the dominant clean-start residual.

## Mature-frontier repeats

The same iteration-920 source was tested twice.  Each policy learned the same
number of cuts in both repeats, confirming deterministic replay and scheduling
under the pinned seed.

| Repeat | Structural first | Bank first | End-to-end gain |
|---|---:|---:|---:|
| first | 363.586 s | 381.175 s | 4.61% |
| second | 353.313 s | 368.834 s | 4.21% |

The second repeat is a single manifest with both arms:

```text
scratch/census-554/separation_experiments/
  experiment-20260712T075225Z-72377-d1f036b7/experiment_manifest.json
```

In that repeat, structural first used 91.880 seconds of solver time and 7.408
seconds of structural refinement; bank first used 89.071 seconds of solver
time and 26.526 seconds of algebra refinement.  Excluding the common replay
cost, structural first reduced active solver-plus-refinement time by 14.11%.
It added 939 cuts rather than 6,234, an 84.94% reduction.

The 939 mature structural records were distributed as follows:

| Family | Records |
|---|---:|
| convex five-point | 360 |
| duplicate center | 336 |
| perpendicular bisector | 117 |
| equilateral-bisector collision | 72 |
| three-triad collision | 54 |

There were 579 unconditional records and 360 all-valid-orders records.  No arm
emitted an unsafe order-conditional record, deferred a conditional core without
an algebra fallback, or published a false frontier.

The smaller mature end-to-end gain is explained by restart replay: about 254
seconds was common startup and other non-refinement work in each 20-iteration
arm.  This fixed cost dominates a short mature experiment but is amortized by
a long-lived oracle.

## Exact phase isolation

After correcting the experiment harness to time the actual `_prepare_formula`
path, a one-iteration run from the same iteration-920 snapshot produced:

```text
scratch/census-554/separation_experiments/
  experiment-20260712T080933Z-3017-60b30c53/experiment_manifest.json
```

| Phase | Seconds |
|---|---:|
| checkpoint/formula reconstruction | 202.691 |
| CaDiCaL search | 5.683 |
| already-seen model backstop | 1.761 |
| DIMACS generation | 1.010 |
| atomic `current.cnf` write | 0.011 |
| structural refinement | 0.106 |
| remaining process/status overhead | 2.733 |
| **total** | **213.995** |

Formula reconstruction is therefore 94.7% of the first mature iteration.
Source review found that each checkpoint row is currently validated twice in
`_prepare_formula`, including redundant canonicalization on the algebra path.
The smallest next speed experiment is a one-pass validated-record replay on
this offline snapshot, requiring byte-identical CNF, equal formula and seen-set
counts, and the same first witness/refinement under the pinned seed.

## Safety and trust boundary

Structural-first scheduling only skips algebra when it has an unconditional
cut or a cut proved across all valid boundary orders.  A merely
order-conditional hit is deferred to algebra; a conditional-only candidate
fail-stops because the v1 checkpoint keys patterns without cut scope.  The
selected refinement policy and preseed setting are persisted, and incompatible
resume attempts are rejected.

The structural records carry replayable finite equality paths and exact Lean
theorem/source provenance.  The pinned oracle snapshot has prior focused build
and axiom-audit evidence, but Python detection records are not themselves Lean
proof terms.  No new Lean build was needed for this scheduling experiment.
Final mixed-source publication still requires checked Lean replay.  Likewise,
no DRAT claim arises here: all measured runs remained SAT-progress/budget runs.

## Operational decision

- Keep the structural-first implementation and its algebra fallback.
- Do not enable the bulk perpendicular-bisector preseed.
- The reversible production switch is complete.  The bank-first source stopped
  cleanly at iteration 1,873 with all 2,215,432 dynamic records preserved.
  Transition replay imported every record with zero collisions and zero
  inherited order-conditional cuts into
  `run-20260712T091653Z-structural-first-iter1873`; strict ordinary replay and
  SQLite integrity passed before launch.  The old source, a pre-stop backup,
  and an exact stopped clone/runtime remain available for rollback.  See
  `scratch/census-554/transition_snapshots/20260712T091653Z-bank-first-stopped/README.md`.
- Do not infer a finish date from these results.  Structural cuts are cheaper
  and much fewer, but the experiment does not determine whether fewer cuts
  require more iterations to reach a terminal frontier.
- Before larger cache or incremental-solver work, test the trust-neutral
  one-pass replay refactor; it attacks the measured 202.691-second restart
  bottleneck directly.

Validation after the implementation and accounting changes:

```text
Ran 100 tests in 71.801s
OK
```
