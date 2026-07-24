# lcap14 global parent surface

Date: 2026-07-24

Status: **STRUCTURAL LAYER DECIDED SAT; EXACT METRIC ORACLE VALIDATED;
CEGAR IN PROGRESS. NOT A EUCLIDEAN REALIZABILITY RESULT, A LEAN PROOF, OR
CLOSURE OF ANY `sorry`.**

Decision record:

1. `surface.cnf` (full surface, all fields) is **SAT** (CaDiCaL, 1.4 s);
   the decoded model passes the `verify_model.py` independent semantic
   replay (`surface.replay.json`).  The Boolean/structural layer alone
   does not close the branch; the exact metric layer is load-bearing.
2. `metric_oracle.py --self-test` passes both directions: the exact
   `Q(sqrt(3))` carrier's complete eq/neq pattern is metric-SAT (43
   equalities, 1049 disequalities), and the first core of the independent
   cover14 CEGAR implementation (professor probe, same vertex convention)
   is metric-UNSAT — the two oracles cross-validate.
3. `run_cegar.py` (CaDiCaL outer, per-iteration semantic replay, z3
   unsat-core blocking, cores logged to `cores.jsonl`): every witness of
   the full production surface tested so far is strict-Kalmanson
   metric-infeasible with pure small cores (3–8 atoms) — the same picture
   as the professor probe's independent weaker encoding (0 survivors past
   590 iterations there).  Run in progress; tally recorded at the next
   checkpoint.

The math-professor aggregate analysis (verbatim in
`professor-probe/aggregate-analysis-2026-07-24.md`, probe scripts and a
588-core bank snapshot alongside) frames this lane as the L5 decision
computation: combinatorially satisfiable, conjecturally
metric-infeasible, with the certificate pipeline
(schema mining → family cover → single UNSAT CNF → LRAT → Lean) as the
closure vehicle on exhaustion, and Euclidean escalation on any survivor.

## Scope

Source-indexed finite decision surface for the open production theorem

```lean
Problem97.ATailFrontierLiveClosure.
  false_of_frontierLargeOppositeCapsBiApexRobustResidual
```

at the exact least live profile: card 14, cap profile `(5,6,6)`, Moser
vertices `0,4,9`, first apex `O1 = 0`, physical second apex `O2 = 4`
(orientation fixed WLOG up to reflection).

This is the successor prescribed by the closure plan after the
`n14-cap-aware-kalmanson` anonymous probe: it is source-indexed by the
frontier pair, the physical-apex deletion rows, and the common critical
map, and it adds the global fields the 2026-07-22 `cardge14-*` audits
proved indispensable:

- complete per-center radius partitions (`eq` atoms with transitivity);
- all-center K4 (one selected four-row inside one class at every center);
- the total critical map (exactly one blocker per source, blocker image
  omitting both robust apices, per-source criticality: no four-clique at
  the blocker avoids its source);
- both-apex full deletion robustness in its proven two-mode normal form
  (five-class or two disjoint K4 classes);
- the frontier pair with all six production survival/double-deletion
  witnesses, the retained row `T0 ∋ q,w`, double row `T1`, two
  strict-cap hits in each, and `one_frontier_source_strict`;
- full pair-deletion minimality (every 12-point subcarrier fails
  all-center K4 at a named witness center) plus weak selected-row escape
  for every proper subset (singleton minimality is subsumed by blocker
  totality);
- partition-level geometric theorem families: bisector at most two
  centers per pair, cyclic alternation of shared pairs, two circles meet
  in at most two points, cap incidence bounds
  (`selectedFourClass_inter_capByIndex_card_le_two`,
  `Card11SelectedCube.support_inter_capByIndex_card_le_one`) lifted to
  4-cliques, and `CapSelectedRowCounting.outsidePair_unique_capCenter`.

Omitted fields are listed in the emitted metadata (planarity beyond the
triangle/Kalmanson relaxation, MEC-disk bounds, alternative-triangle
`noM44` content, cardinalities other than 14, deeper subset minimality).

## Files

- `encode.py` — CNF builder; `surface.cnf` (2,685 vars, 558,764 clauses,
  SHA-256 `ae185d52b4f96a1a59b2c5f65053372c64b9b17766234fa024d42697b971f462`).
- `verify_model.py` — encoder-independent semantic replay of decoded
  models (rebuilds partitions by union-find, re-derives every field).
- `smoke_test.py` — validation gates.
- `metric_oracle.py` — exact QF_LRA strict-Kalmanson oracle (z3; 91
  distance vars; positivity, strict triangles, both strict Kalmanson
  inequalities per cyclic 4-subset; named eq/neq assertions for unsat
  cores); `--self-test` runs the two cross-validation gates.
- `run_cegar.py` — CEGAR driver (outer CaDiCaL + semantic replay + oracle
  + core blocking); cores accumulate in `cores.jsonl`.
- `professor-probe/` — preserved math-professor aggregate analysis, its
  independent probe scripts, and its core-bank snapshot.

## Validation

```bash
UV_CACHE_DIR=/private/tmp/lcap14-uv-cache uv run --no-project python \
  scratch/atail-force/lcap14-global-parent-surface/smoke_test.py
```

All gates pass:

1. Ground truth: the exact `Q(sqrt(3))` carrier of
   `cardge14-nonlinear-escape-geometry` fails all-center K4 exactly
   outside `{A,B,C}` (so the global block excludes it), while every
   partition-level constraint family holds on its exact distance classes
   with respect to its own convex order and caps.
2. Wiring: three-bisector-owner, both-sources-nonstrict,
   endpoint-two-hit, and no-pair-minimality-witness corruptions are each
   UNSAT.

## Next steps

1. ~~Decide `surface.cnf`~~ — SAT; replay passed.
2. ~~Exact metric oracle~~ — built and cross-validated; CEGAR running.
3. On a metric survivor: Euclidean escalation (the survivor names the
   missing fact beyond strict Kalmanson).
4. On exhaustion or slow divergence: industrialize per the professor's L5
   flag — enumerate bounded-support equality patterns, LP-decide each
   once, emit schema clauses into one global CNF, `drat-trim`, kernel
   bridge (unique4-exact-two architecture); mine recurring schemas for
   the human argument feeding the general-n covering lemma (L6).
