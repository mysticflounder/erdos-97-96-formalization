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

Schema mining record (`schema_mine.py`, output `schemas.json`):

4. Across both banks (182 lane cores + 812 probe cores at mining time),
   994 cores canonicalize to 641 distinct order-isomorphism schemas
   (dihedral canonical form; supports 4–12, mode 7), and **all 641 are
   support-local UNSAT**: each is jointly infeasible with only
   positivity + strict triangle + strict Kalmanson on its own induced
   cyclic suborder, hence a cardinality-free refutation-lemma shape.
   Zero cores depend on ambient points.
5. `run_cegar2.py` upgrades the loop to schema-generalized blocking:
   each core is deletion-minimized at rank level (re-verified UNSAT per
   deletion) and its full dihedral-embedding orbit into the 14-cycle is
   blocked at once (incremental CaDiCaL via pysat).  Trial: 40 raw cores
   → 28 minimal schemas → 1.17M orbit clauses in 8 s, with the Q(sqrt(3))
   ground-truth gate (a genuine carrier must satisfy every instantiated
   clause) passing on all of them.

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

## Farkas certificates (`farkas.py`, output `farkas.json`)

6. **All 802 schemas carry an exact rational Farkas certificate**, each
   verified independently in `Fraction` arithmetic (every distance-variable
   coefficient cancels to zero; strict multipliers sum to one): 802/802
   certified, 0 failures, certificate sizes 4–23 with median 9. Full
   extraction costs seconds. Each certificate is directly a Lean `linarith`
   hint list, so the leaf lemmas are mechanically generatable rather than
   hand-written. Self-test gates both directions (a satisfiable isoceles
   pattern must admit no certificate; schema 0 must admit one).

## Outer decision: monolithic CNF is the wrong lever

7. Scaling ladder via `emit_bank_cnf.py` (instance construction separated
   from solving). `bank100.cnf` = surface + the 100 smallest-orbit schemas,
   3.74M clauses: **no result in 900 s under default CaDiCaL, and no result
   in 900 s with `--no-elim --no-vivify --no-subsume --no-probe`.** The
   working hypothesis that the earlier 5.5 h stall was bounded variable
   elimination on dense occurrence lists is therefore **refuted** — memory
   is unremarkable at these sizes (1.4–2.2 GB) and both configurations fail
   alike, so this is CDCL search hardness on the orbit-blocked surface.
   Support-≤6 orbits over the full surface (6.34M clauses) likewise did not
   return in 600 s.

## Covering step probes (`avoid_probe.py`)

Because the schemas are support-local UNSAT they are cardinality-free, so
their embedding orbits can be blocked at **any** n. This probe asks the
covering question directly: can a structure with a complete radius
partition at every point and all-center K4 avoid every schema of support
≤ s? UNSAT would mean a general-n covering lemma over a small family; SAT
means the remaining global fields are load-bearing. Results (Boolean
abstraction only, not Euclidean realizability):

| constraints | schemas | n | verdict |
|---|---|---|---|
| all-center K4 | 21 (supp ≤5) | 6, 7 | UNSAT |
| all-center K4 | 21 (supp ≤5) | 8, 9, 10 | SAT |
| + shell cover | 21 (supp ≤5) | 8–12 | SAT |
| + shell cover | 172 (supp ≤6) | 8–11 | SAT |
| + shell cover + geometry | 172 (supp ≤6) | 8, 9 | **UNSAT** |
| + shell cover + geometry | 172 (supp ≤6) | 10, 11 | timeout (400 s) |
| + shell cover + geometry | 172 (supp ≤6) | 12 | **SAT** |

Correction to the reading of the first four rows: they omit the
partition-level geometric families. The lcap14 surface already contains
those families, so mined cores never needed to rediscover them and the
bank omits their patterns; a probe lacking them tests a strictly weaker
constraint set than the one that produced the schemas. With `--geometry`
supplying bisector capacity, alternation, and the two-circle bound (all
cardinality-free), avoidance is **impossible at n = 8, 9** — so the
geometric families are load-bearing, not incidental.

Net verdict for the branch is nevertheless unchanged, because the target
cardinality is n ≥ 14 and avoidance is already possible at n = 12: **the
mined small-support family does not carry the covering step at the
cardinalities that matter.** Where the transition happens (n = 10, 11 are
unresolved at a 400 s budget) is worth pinning, since a sharp threshold
would say something about the mechanism.

Open caveat on this negative result: the 172 schemas are what CEGAR
sampling happened to hit, and the complete minimal family at support ≤ 6
is not known. If it is substantially larger, the n = 12 SAT verdict is an
artifact of an incomplete bank rather than a fact about the geometry. A
complete enumeration at supports 4, 5, 6 is in progress to settle that.

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
