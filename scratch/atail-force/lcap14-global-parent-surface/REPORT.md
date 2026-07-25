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

## Profile realignment (2026-07-25): this lane's target profile is dispatched

`FrontierLiveClosure.lean` now derives `6 ≤ S.surplusCap.card` on the
large-opposite-caps branch, by redesignating the **second** opposite cap as
surplus (legal because `L.secondOppCap_card_ge_six` gives it more than four
points). Cap indices rotate, so the old surplus cap becomes the fresh first
opposite cap; a fresh common-deletion parent then forces six points there via
the packet-generic `first_oppCap_card_ge_six`, and the other fresh-frontier arm
is the protected unique-radius terminal. This is the mirror of the existing
exact-five dispatch at the same file's `redesignateFirstOppCapAsSurplus`.

Consequence, since the cap cardinalities sum to `D.A.card + 3`: **every profile
with a five-point cap is dispatched, which is all of cardinality fourteen —
whose only profile is (5, 6, 6).** The least surviving profile is `(6, 6, 6)` at
cardinality fifteen.

Status of this lane in light of that: the 802 schemas and their Farkas
certificates remain valid, because each is support-local UNSAT and therefore a
cardinality-free lemma. What is superseded is the **surface** they were mined
against — a card-14 `(5, 6, 6)` structure that the branch no longer has to
refute. Any continuation of the certificate route must re-target the surface at
`(6, 6, 6)` and cardinality at least fifteen, and must be general in `n` rather
than fixed-cardinality.

Caveat: the dispatch routes through `false_of_originalFrontierUniqueRadiusArm`,
which is itself an open sorry (owned by the p5 exact-two lanes), exactly as the
pre-existing exact-five dispatch already does. So the spine's total sorry count
is unchanged; what changed is that the anchored theorem is `[closed]` and its
residual is strictly narrower.

## Complete small-support enumeration (`enumerate_schemas.py`)

10. The CEGAR bank is **not** the small-support family; it is a sample of
    it.  `enumerate_schemas.py` enumerates *every* minimal support-local
    UNSAT positive-equality schema at a fixed support k by increasing atom
    count: candidates are one-atom extensions of the level-below
    *satisfiable* representatives (every proper subset of a minimal UNSAT
    set is satisfiable, so this is complete and subsumes superset
    pruning), deduplicated by the canonical form under the dihedral group
    of the k-cycle acting inside the fixed k-point universe, decided in
    batched z3 (`push`/`check-sat`/`pop`) over the axiom block taken
    verbatim from `schema_mine.schema_smt` — a start-up gate asserts the
    batched per-candidate text equals `schema_mine.schema_smt(k, atoms)`
    character for character — and minimality is settled by looking every
    single-atom deletion up in the complete level-below satisfiable table,
    then re-verified by explicit `decide_schema` calls.  Only schemas whose
    support is *exactly* `{0,…,k-1}` are recorded at k; smaller-support
    minimal sets are reported separately and must reappear in their own
    support's family.  Output: `complete-schemas.json`, plus
    `complete-bank.json` in the `avoid_probe` bank shape.

    | k | complete family | CEGAR bank | bank reproduced | absent from bank | atom counts | stop |
    |---|---|---|---|---|---|---|
    | 4 | **7** | 1 | 1/1 | 6 | 2:1, 3:2, 4:4 | exhausted (no satisfiable 9-atom set) — complete at every atom count |
    | 5 | **405** | 20 | 20/20 | 385 | 3:6, 4:50, 5:154, 6:188, 7:7 | exhausted (no satisfiable 15-atom set) — complete at every atom count |
    | 6 | **11,245** | 151 | 146/151 | 11,099 | 3:4, 4:148, 5:1646, 6:9447 | `--max-atoms 6` cutoff — complete **only up to 6 atoms** |

    The five bank k=6 schemas not reproduced are exactly the five with
    seven atoms, i.e. beyond the cutoff; within the cutoff nothing is
    missing in either direction, and the k=4/k=5 families are complete
    unconditionally.  Cost (jobs=8, z3 batches of 20k): 0.1 s at k=4,
    1.3 s at k=6-atom k=5 (12.6 s exhaustive), 138.8 s at k=6 — 4.02 M z3
    decisions, 14.85 M generated children, 10.82 M canonical cache hits.
    Gates, all clean: every recorded schema re-decided UNSAT; every
    single-atom deletion satisfiable in both the ambient-k and the
    re-ranked support-local reading, with the two readings agreeing
    everywhere (plus 200-schema samples per k through the unbatched
    `schema_mine.decide_schema` path, and 200 sampled sub-support sets per
    k); all 2,023 smaller-support minimal sets found inside the k=6
    universe and all 23 inside the k=5 universe land in their own
    support's complete family.

    Smallest schema of all, absent from the bank: `{d(0,1)=d(0,2),
    d(3,1)=d(3,2)}` on cyclic 0,1,2,3 — two atoms, killed by one strict
    Kalmanson inequality.  It is an instance of the bisector-capacity
    family, which is exactly why a bank mined from a surface that already
    contains the geometric families never had to produce it.

11. Covering probe with the complete family
    (`avoid_probe.py --bank complete-bank.json --max-support 6 --cover
    --geometry --n 8 9 10 11 --timeout 400`, 11,650 schemas): **n = 8
    UNSAT** (4,011,576 clauses), **n = 9 UNSAT** (11,858,760 clauses).
    Control at identical flags with the incomplete 172-schema bank: n = 8
    UNSAT, n = 9 UNSAT.  So at these n the flip against the SAT rows above
    is produced by `--geometry`, not by the bank's incompleteness: the
    geometric families were the missing content, and completing the
    small-support family does not change the verdict where the control is
    already UNSAT.  At n = 10 **neither** run decides inside the 400 s
    budget: complete family TIMEOUT at 29,388,260 clauses, control TIMEOUT
    at 468,740 clauses — so n >= 10 is open at this budget and no
    comparison can be drawn there.  (The first n = 10 attempts of both runs
    were killed externally mid-build and were relaunched.)

    Scaling datum for k = 7 (105-atom universe, jobs=6, `--max-atoms 5`):
    **5,858** minimal schemas of support exactly 7 with at most 5 atoms
    (plus 13,962 of smaller support), 335.8 s, 7.08 M z3 decisions, 29.2 M
    generated children — all gates clean.  The 6-atom level would be
    ~4.5 M satisfiable 5-atom classes x 100 extensions, i.e. two orders of
    magnitude more work than all of k = 6: a k = 7 run at the 6-atom cutoff
    is a session-scale job, and the bank's k = 7 schemas peak at 6 atoms
    with 72 of 316 lying above that cutoff.

## Mirror-antitonicity: independent audit (2026-07-25)

A general-n law offered by the covering analysis, re-verified here against
this lane's own oracle rather than taken on report:

> Let `z1, z2` be two centers, with the two open arcs between them `A1`,
> `A2`. Let `{u_i, v_i}` be disjoint pairs with `u_i in A1`, `v_i in A2`,
> each pair equidistant from **both** centers. Then `i -> (u_i, v_i)` must
> be **antitone**: `u_i` before `u_j` in `A1` forces `v_i` after `v_j`.

Verified with `schema_mine.decide_schema` (positivity + strict triangle +
both strict Kalmanson on the support):

- two pairs, support 6: the antitone placement is SAT, the order-preserving
  placement is UNSAT;
- three pairs, support 8: of the six pairings, only the fully antitone one
  (slots `v3, v2, v1`) is SAT; all five with at least one ascent are UNSAT,
  including both single-ascent cases.

So the law is exactly antitonicity — not merely a bound on inversions.

It is strictly beyond the interleaving family by construction: each pair
has one endpoint in each arc, so every pair on its own separates `z1` from
`z2` and satisfies interleaving. The constraint is on how the pairs are
matched *across* the arcs, which no single-pair family can express.

Relevance: this is a **forced-order** law on equalities, cardinality-free,
and it applies at the live `(6, 6, 6)`, `n >= 15` residual rather than the
dispatched card-14 profile. Per the covering analysis, laws of a shape the
pure-equality bank cannot express are what the general-n covering step
appears to need.
