# Census-554 targeted perpendicular-core replacement experiment

Date: 2026-07-12

## Decision

The digest-pinned cached replacement **passes the predeclared CPU and integrity
acceptance gate**. Across two order-swapped repeats:

- mean search-solver CPU fell from 188.825 to 178.786 seconds, a 5.32% gain;
- mean total worker CPU fell from 236.764 to 230.306 seconds, a 2.73% gain.

The original on-startup-discovery wrapper remains rejected: it improved solver
CPU but regressed total CPU by 2.36%. The cached v2 policy is the measured
successor for this exact frozen bank. No live or stopped oracle was modified by
the experiment itself. The later operational transition copied the cache into
a private workdir and bound resume metadata to that snapshot; the production
run does not depend on a mutable repository-side cache file.

This is an **EMPIRICALLY VERIFIED performance result for this bounded search
model and exact 5,836-row bank**. It is not a closure result, an
iteration-to-completion estimate, or a claim that the replacement search
trajectory is globally better.

## Change tested

The ordinary arm seeds every orbit image of all 5,836 frozen algebra-bank
motifs. The replacement arm identifies the 1,207 bank source motifs containing
the proved unordered
`equality-perpendicular-bisector-convex` core, minimizes each to that structural
core, and seeds the minimized orbit in place of the larger motif. The complete
bank remains available for provenance and later algebra fallback.

This is not the previously rejected bulk preseed of all 23,250 row-feasible
perpendicular templates. It is a targeted substitution inside bank motifs that
already carry the proved core.

The replacement inventory was identical in both repeats:

| Inventory item | Count |
|---|---:|
| frozen bank rows | 5,836 |
| targeted source rows | 1,207 |
| ordinary bank-orbit instances | 156,242 |
| replacement bank-orbit instances | 143,464 |
| removed ordinary instances | 27,529 |
| added minimized structural instances | 14,751 |
| net static reduction | 12,778 |

The bank SHA-256 was
`36348d35397a494bee5ac0ab9e423c20802e7aff45fa12f0530df36a57cfc43a`.
The supporting `EqualityCore.lean` snapshot had SHA-256
`d69d734942d6dfcfd7341a5d84c254f388e7be7be4fccf26926caf47100c4d82`.

## CPU measurement

CPU time, not wall time, is the primary metric:

- Python/orchestration CPU is `time.process_time()`, which includes user and
  system CPU for the worker process.
- Completed child CPU is `RUSAGE_CHILDREN.ru_utime + ru_stime`.
- Per-search solver CPU is the self-plus-child CPU delta around the exact
  `_run_command` invocation that writes `search_solver.stdout`.
- Total worker CPU is worker self CPU plus completed-child CPU.
- Wall limits remain hard safety bounds and wall measurements are secondary
  diagnostics only.

The classified phase counters account for more than 99.5% of total worker CPU
in every arm. CaDiCaL is a direct completed child, so its user-plus-system CPU
is included even though `time.process_time()` alone would omit it.

The harness and its regression test now preserve both CPU and explicitly named
wall counters. The focused validation passed:

```text
Ran 9 tests in 0.602s
OK
```

A real one-iteration canary captured nonzero solver-child CPU and reconciled
worker total CPU to self plus child CPU before the long runs.

## Controls

Both repeats began from independently validated private clones of the same
iteration-zero snapshot:

```text
scratch/census-554/separation_experiments/
  experiment-20260712T073359Z-39424-4c4f2503/source_snapshot
```

The common seed was `1618033988`; each arm ran 100 iterations under the same
structural-first candidate schedule, 120-second per-solver cap, 600-second
probe wall guard, and 900-second harness wall guard. Arms ran sequentially.
The second repeat reversed the treatment order.

Primary manifests:

```text
scratch/census-554/separation_experiments/
  experiment-20260712T231416Z-52961-941d7131/experiment_manifest.json
  experiment-20260712T232551Z-80515-b646697c/experiment_manifest.json
```

The earlier completed wall-only comparison at
`experiment-20260712T225444Z-2317-b8d38281` is retained as a secondary
diagnostic but excluded from the primary result. The interrupted wall-only
order repeat at `experiment-20260712T230635Z-34660-035e11dc` is preserved as a
partial artifact and likewise excluded.

## Result

| Arm order | Ordinary total CPU | Replacement total CPU | Total delta | Ordinary solver CPU | Replacement solver CPU | Solver delta |
|---|---:|---:|---:|---:|---:|---:|
| ordinary, replacement | 233.653 s | 238.938 s | +2.26% | 186.775 s | 175.905 s | -5.82% |
| replacement, ordinary | 235.873 s | 241.645 s | +2.45% | 188.502 s | 177.812 s | -5.67% |
| **two-run mean** | **234.763 s** | **240.292 s** | **+2.36%** | **187.639 s** | **176.858 s** | **-5.75%** |

Per-iteration solver CPU shows the same effect. Ordinary medians were 1.916
and 1.922 seconds; replacement medians were 1.570 and 1.584 seconds. The
replacement therefore improved the solver in both order positions rather than
benefiting from one anomalous aggregate.

The mean total-CPU delta decomposes as follows:

| Phase | Ordinary mean CPU | Replacement mean CPU | Replacement minus ordinary |
|---|---:|---:|---:|
| search solver | 187.639 s | 176.858 s | **-10.780 s** |
| formula construction | 3.901 s | 11.400 s | +7.499 s |
| structural refinement | 11.627 s | 17.325 s | +5.699 s |
| already-seen backstop | 12.072 s | 14.483 s | +2.410 s |
| DIMACS generation | 18.257 s | 18.940 s | +0.683 s |
| `current.cnf` writes | 0.216 s | 0.216 s | +0.000 s |
| unclassified worker CPU | 1.051 s | 1.069 s | +0.017 s |
| **total worker CPU** | **234.763 s** | **240.292 s** | **+5.529 s** |

The smaller seed did reduce the final CNF from 568,671 to 556,204 clauses,
from 31,274 to 31,230 variables, and from 12,992,707 to 12,463,005 bytes.
However, the changed trajectory learned 3,720 structural cuts rather than
3,365 over the same 100-iteration budget. The current wrapper also performs
full theorem detection, minimization, orbit enumeration, and inventory-set
construction at every formula build. Those costs exceed the measured solver
saving.

If the replacement map and its audit inventory were available at startup at
ordinary formula-build cost, the phase measurements project a small net CPU
gain. That is only a hypothesis motivating the cache experiment; it is not a
measured optimization result.

## Determinism, integrity, and trust boundary

All four primary arms:

- completed exactly 100 iterations with probe exit 2 and bounded `budget`
  status;
- emitted no algebra record, unsafe order-conditional record, deferred
  conditional scan, or hard timeout;
- used the same source bank, seed, theorem snapshots, and iteration-zero
  checkpoint.

The two ordinary databases were compared by `(pattern_key, record_json)` in
both `EXCEPT` directions and differed by zero rows. The two replacement
databases also differed by zero rows. Their final progress rows matched within
each treatment. Thus arm order changed timing but not either treatment's
search trajectory.

The replacement's structural theorem is already part of the frozen formalized
catalog, but this experiment does not create Lean proof terms for the entire
search. Any eventual terminal mixed-source cover still requires the closure
plan's checked structural replay, frozen-manifest, SAT-proof, and Lean
publication gates.

## Follow-up acceptance gate

The only supported next experiment is a digest-pinned precomputed replacement
artifact containing the source-pattern key, minimized core, family/theorem ID,
bank digest, theorem-source digest, policy version, and complete orbit
inventory. It must fail closed on any digest or count mismatch.

Re-run the same two-order, 100-iteration CPU experiment. Promote the policy
only if:

1. total worker CPU improves in both arm orders;
2. the solver CPU gain persists;
3. formula, seed, and orbit inventories reproduce exactly;
4. same-treatment databases remain byte-content equivalent across repeats;
5. all unsafe/deferred/provenance counters remain zero.

## Cached follow-up implementation

The follow-up is implemented by:

```text
scratch/census-554/perp_subsumption_cache.py
scratch/census-554/generate_perp_subsumption_cache.py
scratch/census-554/perp_subsumption_cache.json
scratch/census-554/perp_subsumption_cached_probe.py
```

The 6,739,581-byte canonical cache has SHA-256
`0a24950c5feeb41e4a214a7deebd69865e1eca662b08dcc5e338391e82b3b9ff`.
It records all 1,207 targeted source patterns, their minimized structural
cores, their complete ordered replacement orbits, ordinary/effective global
orbit hashes, all inventory counts, and the exact theorem contract. A second
full-bank generation was byte-identical.

Runtime loading fails closed on:

- whole-cache SHA-256 or canonical-JSON drift;
- exact bank SHA-256 or row-count drift;
- theorem family, theorem ID, theorem-source path, or theorem-source hash drift;
- policy-version drift;
- combinatorics source, formalized-oracle source, or automorphism-inventory
  drift;
- cached bank-row/source mismatch, duplicate source, malformed/nonordered
  orbit, compact inventory hash mismatch, or final formula-count mismatch.

The full cache takes about 15 CPU/wall seconds to generate on this host, but
generation is an offline bank-freeze operation, not a probe-startup operation.
Any changed bank requires a newly generated and re-audited cache with a new
pinned digest.

Focused validation passed:

```text
Ran 12 tests in 0.643s
OK
```

All five SAT encoding smoke gates also passed. The one-iteration cached canary
produced byte-identical CNF to the uncached replacement
(`eea87a6c5de5fc5933e7c595ac4f7efc225d503cabf69a44b1ffc44fb4011b89`)
and zero checkpoint-record differences in both directions. Formula-build CPU
fell from about 11.4 seconds in the uncached experiment to 3.89 seconds, the
same scale as the ordinary formula build.

## Cached follow-up CPU result

Primary manifests:

```text
scratch/census-554/separation_experiments/
  experiment-20260712T235755Z-70377-c4031447/experiment_manifest.json
  experiment-20260713T000904Z-94799-906f85b1/experiment_manifest.json
```

| Arm order | Ordinary total CPU | Cached total CPU | Total delta | Ordinary solver CPU | Cached solver CPU | Solver delta |
|---|---:|---:|---:|---:|---:|---:|
| ordinary, cached | 237.693 s | 231.858 s | -2.45% | 189.635 s | 180.020 s | -5.07% |
| cached, ordinary | 235.835 s | 228.754 s | -3.00% | 188.015 s | 177.553 s | -5.56% |
| **two-run mean** | **236.764 s** | **230.306 s** | **-2.73%** | **188.825 s** | **178.786 s** | **-5.32%** |

The solver effect is also present per iteration. Ordinary median solver CPU
was 1.919 and 1.927 seconds; cached median solver CPU was 1.601 and 1.566
seconds.

Mean CPU decomposes as follows:

| Phase | Ordinary mean CPU | Cached mean CPU | Cached minus ordinary |
|---|---:|---:|---:|
| search solver | 188.825 s | 178.786 s | **-10.039 s** |
| formula construction | 3.870 s | 3.828 s | -0.042 s |
| structural refinement | 11.591 s | 16.909 s | +5.318 s |
| already-seen backstop | 12.590 s | 11.453 s | -1.137 s |
| DIMACS generation | 18.518 s | 17.929 s | -0.589 s |
| `current.cnf` writes | 0.244 s | 0.241 s | -0.004 s |
| unclassified worker CPU | 1.125 s | 1.160 s | +0.035 s |
| **total worker CPU** | **236.764 s** | **230.306 s** | **-6.458 s** |

Caching removes the old 7.499-second formula-construction penalty. The cached
trajectory still spends 5.318 extra seconds in structural refinement, but the
solver, DIMACS, and seen-backstop savings now exceed that cost.

## Cached follow-up acceptance audit

All five predeclared conditions pass:

1. total worker CPU improved in both arm orders (2.45% and 3.00%);
2. solver CPU improved in both arm orders (5.07% and 5.56%);
3. seed counts, final formula counts, source/replacement inventories, and
   ordinary/effective orbit hashes reproduced exactly;
4. the two cached databases and the two ordinary databases differed by zero
   `(pattern_key, record_json)` rows in both directions; the cached database
   also differed by zero rows from the prior uncached replacement trajectory;
5. all four arms had zero algebra records, unsafe order-conditional records,
   deferred conditional scans, unsafe fallback events, and hard timeouts.

Both cached final CNFs and the prior uncached final CNF have SHA-256
`836fbd913e9f9b63d35ddfd0c842381202137e0362921551b1546c2b0d189824`.
Thus caching changes CPU cost without changing the replacement policy's
formula or deterministic search result.

The cached v2 policy therefore passed the CPU gate for the exact frozen bank.

## Production transition result

The rollback-safe production transition completed on 2026-07-13 UTC. It
published the private successor:

```text
scratch/census-554/separation_probe_runs/
  run-20260713T015318Z-cached-perp-bank5836-from-iter1179
```

The transition held the stopped source lock, copied and migrated its SQLite,
WAL, and SHM state privately, and atomically published only after validation.
All 2,263,978 source exclusions reconciled: 2,261,836 were imported as dynamic
records and 2,142 collided exactly with the cached successor's 143,500 static
seed instances. The target kept the exact 5,836-row bank and bound cache
SHA-256
`0a24950c5feeb41e4a214a7deebd69865e1eca662b08dcc5e338391e82b3b9ff`
to its run metadata. Bank/cache digest checks, `PRAGMA integrity_check`, exact
reopen count, transition tests, source post-publication hash checks, and live
checkpointing all passed. The stopped source remains untouched as rollback;
the exact record is
`scratch/census-554/transition_snapshots/20260713T015318Z-cached-perp-bank5836/README.md`.

At the dated 2026-07-12 19:51 PDT checkpoint, the successor had committed 101
iterations with 2,410,433 total exclusions. Every committed refinement was
structural and no algebra fallback occurred. This upgrades the policy to
**TRANSITIONED / LIVE-EXERCISED ON THE FROZEN BANK**, but not to a theorem
result: the run remained `SAT-progress`, with no checked UNSAT, alive
candidate, completion marker, or Lean closure.

A mutable-bank successor still needs a newly generated cache and fresh audit;
this result cannot be transferred by assumption.
