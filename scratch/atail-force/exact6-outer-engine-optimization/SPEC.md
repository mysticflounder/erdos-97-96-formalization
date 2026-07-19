# Exact-six outer-engine optimization specification

Date: 2026-07-18

Status: **BOUNDED IMPLEMENTATION CHECKPOINT COMPLETE — LOGICAL DECISION
`NONCONVERGENT_UNDER_OPTIMIZED_ENGINE`.  SEE `REPORT.md`.  THIS DOCUMENT DOES
NOT CLAIM A MATHEMATICAL CLOSURE, AN EXHAUSTED CENSUS, OR A CLOSED LEAN
`sorry`.**

## 1. Purpose

This work will determine whether the corrected exact-six mutual search can be
made fast enough, observable enough, and certificate-safe enough to serve as a
bounded proof-discovery and finite-coverage engine.

The immediate engineering target is the n=14 `(5,6,6)` seven-orbit surface in

```text
scratch/atail-force/exact6-allcenter-capaware-gate/allcenter_gate.py
```

The live proof anchor is

```text
Problem97.u1_largeCap_routeB_tail_liveData_false
```

The exact-six mutual surface is only one residual branch below that parent.
Even a successful seven-orbit terminal certificate would prove only the
corrected finite abstraction encoded here.  It would still need a checked
encoding-to-Lean bridge and an on-spine consumer before it could contribute to
closing a production `sorry`.  It would not by itself prove the
variable-cardinality parent theorem.

The primary proof strategy remains the direct parent contradiction.  This
optimization lane is a bounded auxiliary lane: it may supply a finite branch
certificate, expose an aggregate theorem, or establish that this abstraction
is not a productive closure route.

## 2. Current proof and ownership boundary

### 2.1 Retained mathematical surface

The authoritative retained and omitted assumptions are the ones recorded in
`../exact6-allcenter-capaware-gate/REPORT.md`.  In particular, the current
surface retains selected K4 rows, the global blocker table, the exact
`(5,6,6)` cap blocks, the exact-five second-apex shell, the seven corrected
mutual role orbits, selected-witness strong connectivity, strict triangle
inequalities, and both strict Kalmanson inequalities.

It omits, among other things:

- rank-two Euclidean realization beyond the equality ideal;
- MEC containment and the nonobtuse support-triangle inequalities;
- `noM44` alternate-support-triangle quantification;
- full first-apex robustness and its retained double-deletion rows;
- most global minimality; and
- the variable-cardinality reduction needed by the parent theorem.

Those omissions must remain machine-readable in every result artifact.  An
optimized implementation must not silently strengthen the formula and must
not rename a finite verdict into a full-parent verdict.

### 2.2 Files outside this lane

This lane owns only

```text
scratch/atail-force/exact6-outer-engine-optimization/
```

It may read and import scratch code from the existing exact-six lanes.  It must
not edit production Lean or the following concurrently owned or generated
surfaces:

- `SurplusM44` files;
- `U1LargeCapRouteBTail.lean`;
- `docs/live-blueprint.md`;
- production or scratch `ShellCurvature` files; or
- another lane's stored results in place.

If a reusable implementation change is eventually needed in an existing
scratch driver, first land and validate it in this lane as an adapter or
prototype.  Promotion is a separate checkpoint.

## 3. Baseline evidence

Two `cProfile` measurements were taken on 2026-07-18 against the current
`continuationOrder` driver.  These are diagnostic profiles, so their absolute
times include profiler overhead.  Acceptance benchmarking must repeat the
runs without `cProfile`.

### 3.1 Full-bank startup profile

Command shape:

```text
allcenter_gate.py
  --orbit continuationOrder
  --outer-engine qffd
  --preload-transported-schemas
  --learned-schema-bank combined_round1_round2_minimized_schema_bank.json
  --learned-max-k 8
  --wall-seconds 30
```

Observed result:

| measurement | value |
| --- | ---: |
| concrete membership cuts | 213,860 |
| Python calls | 480,283,527 |
| actual elapsed time | 88.1 s |
| attempts reached | 1 |
| `add_membership_cut_closure` cumulative time | 50.6 s |
| `preload_transported_schema_closure` cumulative time | 34.5 s |

Most of the time was Python-to-Z3 AST construction: millions of `cast`,
`Not`, `Or`, `as_ast`, reference-count, and wrapper-object calls.  The
30-second logical deadline was first observed only after non-preemptible setup,
so the process overran its requested wall budget by approximately 58 seconds.

This is an encoding/materialization bottleneck, not evidence that Z3 spent 88
seconds searching the Boolean formula.

### 3.2 Lazy-bank hot-loop profile

The same orbit without full preloading ran for 30 seconds and produced:

| measurement | value |
| --- | ---: |
| attempts | 453 |
| lazily asserted transported cuts | 12,484 |
| Z3 outer checks | 452 calls / 10.3 s cumulative |
| schema matching | 452 calls / 9.8 s cumulative |
| cut construction/assertion | 4.4 s cumulative |
| model decoding | 1.8 s cumulative |

The current matcher repeatedly scans candidate applications and executed
roughly 35 million generator membership checks in this 30-second profile.
This is a second CPU-side bottleneck independent of the full-bank AST startup
cost.

### 3.3 Search-convergence evidence

Performance is not the only blocker:

- the verified starting bank has 20 schemas and 102,102 concrete transports;
- two exact deletion-mining rounds produced 30 compact schemas and 111,758
  additional concrete transports;
- the union has 213,860 applications;
- round one exposed 8 compact families and round two exposed 22 new compact
  families, so the compact frontier was growing rather than saturating;
- the deterministic combined CNFs remain SAT in all seven orbits after the
  current theorem-level constraints and 572 shell/row alternation clauses;
- 7,000 exact CEGAR cuts replay independently, with 6,891 unique merged cuts
  and 186,404 validated D14 transports, but no terminal structural UNSAT; and
- direct exact Z3 runs returned `unknown` after approximately 656 seconds per
  orbit rather than SAT or UNSAT.

Accordingly, faster enumeration is useful only if it exposes a coverage
theorem, a genuinely realizable residual, or a terminal finite certificate.
Raw cut count is not a success metric.

## 4. Goals and non-goals

### 4.1 Goals

1. Make every material phase observable with stable timers, counters, memory
   measurements, and fail-closed terminal statuses.
2. Remove Python/Z3 AST construction from the propositional bank-loading hot
   path.
3. Replace repeated literal-schema scans with a compact indexed or bitset
   matcher.
4. Reuse the static exact-LRA base instead of reconstructing thousands of
   constraints and fresh solvers for every candidate.
5. Preserve a byte-reconstructible, independently replayable certificate path
   for every banked cut and any terminal UNSAT.
6. Benchmark the optimized engine under fixed inputs, hashes, seeds, and
   budgets.
7. Stop or redirect the lane at an explicit checkpoint if faster execution
   does not improve logical convergence.

### 4.2 Non-goals

- Rewriting the complete search stack in Rust before a prototype benchmark.
- Using CUDA merely because GPUs are available.
- Adding a third broad literal-schema mining round.
- Treating a Z3/CaDiCaL/MILP verdict as a Lean proof.
- Treating an exact n=14 result as the arbitrary-cardinality parent theorem.
- Enlarging the finite abstraction without a named missing parent hypothesis
  and an immediate proof consumer.
- Editing production Lean during the performance prototype.

## 5. Required architecture

The optimized system is divided into four independently testable layers.

```text
source-faithful finite instance
        |
        v
canonical Boolean IR + manifest
        |
        +--> incremental CNF outer engine ------+
        |                                       |
        |                                    candidate
        |                                       |
        +--> independent model validator <------+
                                                |
                                                v
                                  persistent exact-LRA oracle
                                                |
                          +---------------------+-------------------+
                          |                                         |
                    exact dead cut                        exact survivor
                          |                                         |
                          v                                         v
               independent cut replay                  semantic/CAS/rank gate
                          |
                          v
                 append-only certified bank
```

The search engine is untrusted discovery infrastructure.  Only independently
replayed cuts may enter the certified bank.  A terminal outer UNSAT must be
reconstructed as a deterministic CNF and verified with a DRAT/LRAT checker.

### 5.1 Canonical Boolean intermediate representation

Introduce a solver-neutral IR whose only semantics are finite Boolean,
finite-domain, cardinality, and implication constraints.  The IR must record:

- named variables and deterministic integer IDs;
- one clause/constraint category for every source-level assumption;
- the seven role-orbit constraints;
- row-membership, shell, blocker, and named-role variables;
- exact-one, exact-four, and at-most cardinality constraints;
- every theorem-level alternation constraint;
- each certified learned schema application, with certificate provenance; and
- a manifest containing all input hashes and per-category counts.

Finite-domain role and blocker variables should be encoded one-hot in the
first proof-capable implementation.  A binary encoding may be added only
after equivalence testing because one-hot models are easier to audit, decode,
and connect to the current source-level semantics.

Do not maintain separate hand-written semantic encoders for Z3 and CaDiCaL.
Either factor the existing
`exact6-allcenter-coverage-certificate/encode.py` into the common IR path or
derive both backends from one serialized IR.  The encoding-to-claim map is the
main trust boundary.

### 5.2 Propositional backend

The preferred exact backend is incremental CaDiCaL through IPASIR or the
CaDiCaL C API.  The prototype may begin with deterministic DIMACS plus a
standalone CaDiCaL process, but the full loop must retain learned clauses
across CEGAR iterations.

Required operations:

```text
add_clause(integer literals)
solve(assumptions, timeout_or_supervisor_budget)
model_value(variable_id)
reason/status
export_deterministic_cnf()
```

All membership nogoods must remain integer literal arrays from construction
through assertion.  They must not be converted into Z3 `BoolRef` trees.

The outer engine must distinguish:

```text
SAT_CANDIDATE
UNSAT_STRUCTURAL_CEGAR_EXHAUSTED
UNKNOWN_TIMEOUT
BUDGET
LIMIT
ENCODING_ERROR
VALIDATION_ERROR
CERTFAIL
```

Only the first two are solver verdicts.  Only a DRAT/LRAT-verified instance of
the second is a publishable finite-coverage result.

### 5.3 Bitset schema matching

Represent the 182 possible directed off-diagonal membership atoms
`(center, point)` by stable bit positions.  A decoded row table becomes one
fixed-width bitset.  Each schema application becomes a required-membership
bitset.

At minimum, matching is:

```text
(candidate_bits & required_bits) == required_bits
```

The implementation must also retain the existing rare-pivot index or replace
it with an index that is demonstrably better on the stored bank.  Reasonable
choices include:

- rarest required atom to application list;
- two-level rare-atom pairs;
- required-bitset buckets by schema cardinality; or
- a trie over sorted required atoms.

The matcher must return the same canonical application keys as the current
Python function.  It must not infer new symmetry transports.

### 5.4 Persistent exact-LRA oracle

The current `linear_metric_check` rebuilds 91 positive-distance constraints,
1,092 strict triangle constraints, 2,002 Kalmanson constraints, row
equalities, shell equalities, and fresh minimization solvers for each
candidate.

Replace this with one persistent solver per worker/orbit:

1. Assert the positivity, triangle, and Kalmanson base once.
2. Predeclare activation literals for every possible row-radius equality and
   physical-apex shell equality.
3. Classify a candidate using `check(assumptions)` over exactly its selected
   equalities.
4. Extract an assumption core containing only candidate equalities.
5. Perform bounded online shrinking on the same persistent solver.
6. Defer full deletion-minimality and rational Farkas certificate production
   to the existing offline exact replay/minimization stage.

The persistent-base refactor must prove by test that the permanent base alone
is SAT and that candidate classifications agree with the current oracle.
`UNKNOWN` must stop fail-closed and must never create a cut.

## 6. Observability contract

Before changing solver architecture, add stage instrumentation.  Every run
must produce JSONL events and one terminal JSON record with the following
minimum fields.

### 6.1 Run identity

```text
schema_version
git_commit_or_dirty_source_hash
command_line
host
solver_versions
python_or_rust_version
orbit
seed
requested_wall_seconds
input artifact paths and SHA-256 hashes
retained assumptions
omitted assumptions
```

### 6.2 Timers

Record cumulative seconds and call counts for:

```text
load_inputs
expand_transports
build_boolean_base
materialize_bank
outer_check
decode_model
validate_model
connectivity_check
schema_match
assert_cuts
build_lra_base
lra_check
extract_core
shrink_core_online
certify_core_offline
semantic_check
cas_check
serialize_results
```

Also record process CPU time, peak resident memory, requested wall time,
actual elapsed time, and `deadline_overrun_seconds`.

### 6.3 Progress counters

```text
attempts
outer_sat_candidates
connectivity_cuts
matched_schema_applications
new_schema_cuts
duplicate_schema_cuts
lra_unsat
lra_sat
lra_unknown
online_core_shrink_calls
bankable_exact_cuts
certificate_failures
semantic_sat/unsat/unknown
```

Each event must identify both the current attempt and the cumulative values.
Logs must be append-only and flushed after every terminal or bank mutation.

### 6.4 Hard wall-budget enforcement

The logical deadline must be checked during bank materialization and transport
expansion, not only before a solver call.  In addition, the benchmark runner
must supervise each worker as a subprocess and terminate it after a small,
recorded grace interval.  A requested 30-second run must not silently take 88
seconds.

## 7. Correctness and trust gates

### 7.1 Encoding smoke tests

Before benchmarking performance:

1. Build tiny hand-auditable row/cardinality fixtures with known SAT and UNSAT
   outcomes.
2. Verify exact-one, exact-four, at-most-two, implication, one-hot role, and
   blocker-selection encodings independently.
3. Verify that a DIMACS model decodes and substitutes into the pre-encoding
   constraints.
4. Deliberately flip or remove one clause in each category and confirm that
   the verifier rejects the mutated artifact or model.

### 7.2 Differential equivalence tests

For every orbit and fixed seed:

- compare old and new base satisfiability;
- validate every new-backend model with the old source-level predicate;
- validate old stored models with the new IR predicate;
- check that the original closure has exactly 102,102 applications;
- check that the compact closure has exactly 111,758 applications;
- check that their union has exactly 213,860 applications and zero unintended
  overlap;
- compare lazy matcher outputs exactly on stored and randomized valid row
  tables; and
- compare current and persistent-LRA classifications on a representative set
  containing SAT, UNSAT, shell-conditioned, and timeout cases.

Model identity is not required because different solvers may choose different
witnesses.  Semantic substitution and verdict agreement are required.

### 7.3 Certified-cut boundary

A solver-derived core is discovery evidence only.  It may enter the permanent
bank only when the existing independent exact checker confirms:

- the source candidate satisfies the retained surface;
- every required membership actually occurs;
- every symmetry transport is valid for its role orbit;
- the rational linear certificate cancels exactly; and
- the canonical key and input hashes match at commit time.

Bank updates must be transactional, append-only, deduplicated by canonical
key, and protected by one-writer locking.

### 7.4 Terminal UNSAT package

A terminal finite-coverage package must contain:

```text
canonical IR manifest
deterministic DIMACS CNF
per-category clause counts and hashes
complete certified-cut bank manifest
CaDiCaL solver transcript
DRAT proof
drat-trim verification transcript
independent CNF reconstruction result
encoding/model smoke-test report
seven-orbit summary
```

The verifier must reconstruct the CNF byte-for-byte and reject truncated logs,
missing terminal events, `UNKNOWN`, `LIMIT`, or a proof paired with a different
CNF.

## 8. Implementation phases

### Phase 0 — freeze the benchmark corpus

Create a manifest naming and hashing:

- the 20-schema transported bank;
- the combined 263-schema minimized bank;
- the 6,891-cut merged exact bank;
- its 186,404 D14 transports;
- the seven current orbit definitions;
- the current driver source; and
- stored representative candidates and exact core replays.

No benchmark is comparable unless this manifest matches.

### Phase 1 — instrument the current Python/Z3 driver

Implement the observability contract without changing semantics.  Re-run the
two baseline scenarios unprofiled three times each and store raw JSONL plus a
summary containing median, minimum, maximum, and peak RSS.

This phase is complete only when setup time, solving time, and deadline
overrun can be read directly from the output without `cProfile`.

### Phase 2 — bitset matcher prototype

Implement a solver-independent membership bitset and indexed matcher.  Run
exact differential tests against `matching_schema_applications`.  Benchmark
the 453-candidate lazy trace and one larger stored trace.

Do not change canonicalization, reflection, or embedding rules in this phase.

### Phase 3 — direct-CNF outer prototype

Reuse the proof-capable encoder in
`exact6-allcenter-coverage-certificate/encode.py` where possible.  Emit
deterministic DIMACS for each orbit and compare model substitution against the
current `Outer` semantics.

Start with a standalone CaDiCaL solve to establish encoding equivalence and
bank-load cost.  Then add a persistent incremental interface for the CEGAR
loop.  The complete preloaded bank must remain integer clauses throughout.

### Phase 4 — persistent exact-LRA oracle

Factor the static linear metric base and activation-literal surface.  Validate
classification and core extraction against the current implementation.  Keep
the old exact replay/minimizer as the banking authority.

### Phase 5 — end-to-end bounded benchmark

Run the seven orbits under the frozen corpus and the same seeds/budgets as the
baseline.  Use at most seven workers for one portfolio because the individual
solver jobs are effectively single-threaded.  With 24 CPU cores, up to three
seed portfolios may run concurrently only after the one-portfolio equivalence
gate passes.

No production builds or unrelated miners should be included in benchmark
measurements.

### Phase 6 — convergence review and decision

Review after every 5–10 newly bankable canonical cores and at every terminal
or budget stop.  Record:

- whether new cores instantiate an existing schema;
- whether a parametric aggregate theorem is emerging;
- whether the number of new families is decreasing;
- whether candidate throughput is translating into covered-orbit progress;
  and
- whether the remaining candidates require omitted Euclidean/MEC/minimality
  information.

The review must choose one of the terminal decisions in Section 10.  It must
not automatically authorize another literal-schema round.

## 9. Rust and CUDA decision

### 9.1 Rust

Rust is authorized only as a focused implementation of the Boolean IR,
bitset matcher, and persistent CaDiCaL interface.  It is not an authorization
to rewrite the exact algebra, certificate verifier, or Lean interface.

Use Rust if either:

- the Python direct-CNF prototype cannot meet the performance gates because
  of interpreter overhead; or
- a stable CaDiCaL C-API/IPASIR binding is materially simpler and safer in a
  small Rust crate.

The Rust binary must consume and emit the same versioned JSON/IR artifacts as
the Python reference and must pass the differential suite.  Performance does
not excuse a second semantics implementation without equivalence tests.

### 9.2 CUDA/GPU

CUDA is explicitly out of scope for the exact outer engine.  CDCL SAT, exact
rational LRA, branch-heavy core minimization, DRAT production, and the current
small n=14 bitset matching problem are not dense GPU workloads.  Moving them to
a GPU would add an unverified backend and certificate integration work without
addressing the logical hard core.

GPU use may be reconsidered only for a separately labeled discovery oracle,
such as large batches of floating-point coordinate feasibility, homotopy
starts, or dense SOS relaxations.  A GPU result from such an oracle is never
bankable directly: it must be reconstructed exactly and pass the existing
certificate/Lean trust ladder.

## 10. Acceptance and stop criteria

### 10.1 Engineering acceptance gates

All of the following are required:

1. Exact differential tests pass for all seven orbits.
2. The new engine reproduces all frozen application counts and validates every
   emitted candidate against the source-level predicate.
3. Full-bank materialization falls from the profiled 85-second class to at
   most 10 seconds median, excluding solver search.
4. Lazy schema matching is at least 3x faster on the frozen trace.
5. A requested 30-second benchmark terminates within 35 seconds including
   setup and shutdown.
6. End-to-end candidate throughput improves by at least 2x on a fixed
   180-second, full-bank orbit benchmark, or the engine reaches a stronger
   exact terminal result.
7. Peak memory remains bounded and reported; the default cap is 8 GiB per
   worker unless a benchmark manifest explicitly justifies more.
8. Every permanent cut passes independent exact replay.

If gates 3–6 fail, stop the compiled-engine work and retain only the useful
instrumentation.

### 10.2 Logical terminal decisions

The lane must end in exactly one of:

#### A. `FINITE_COVERAGE_CERTIFIED`

All seven corrected orbits are propositionally exhausted by independently
certified cuts; deterministic CNFs and DRAT/LRAT checks pass.  Next action:
state and implement the exact finite coverage theorem/consumer.  Do not claim
the parent `sorry` closed until the kernel-mined spine actually closes.

#### B. `EXACT_RETAINED_SURVIVOR`

An outer candidate survives the exact LRA and semantic filters.  Persist it,
substitute-check it, and send it to the existing Euclidean/MEC/rank-two gate.
Do not mine around it with guessed cuts.

#### C. `AGGREGATE_THEOREM_EXPOSED`

The bank reveals a uniform Kalmanson/strong-connectivity or related aggregate
statement that subsumes the residual family.  Stop enumeration and move the
precise theorem through exact checking and Lean formalization.

#### D. `NONCONVERGENT_UNDER_OPTIMIZED_ENGINE`

The implementation is materially faster, but new canonical families do not
saturate or the combined abstraction remains SAT/UNKNOWN.  Stop literal CEGAR
and record the exact omitted geometric or parent-level information required.

#### E. `OPTIMIZATION_NOT_COST_EFFECTIVE`

The performance acceptance gates fail.  Preserve instrumentation and the
benchmark report, but do not continue the Rust/CUDA work.

## 11. Compute plan

Use CPU parallelism across independent orbits and seeds:

- one standard seven-orbit 180-second round costs about 21 CPU-minutes and can
  finish in roughly 3–5 minutes wall time on seven free cores;
- one current direct exact portfolio costs about 1.3 CPU-hours and takes about
  11 minutes wall time when seven orbits run concurrently;
- a 10x per-orbit timeout costs about 13 CPU-hours and still takes roughly 1.8
  hours wall time because one orbit cannot automatically consume several
  cores; and
- the remaining cores may be used for independent seeds only after semantic
  equivalence is established.

There is no honest compute estimate for literal exhaustion because the bank
has not shown a saturation trend.  Higher timeouts must therefore be justified
by a measured convergence signal, not by available hardware.

## 12. Deliverables

The implementation checkpoint should contain:

```text
SPEC.md                         this specification
baseline-manifest.json         frozen source/input hashes
profiles/                      raw instrumented baseline summaries
ir/                            versioned Boolean IR fixtures
tests/                         smoke and differential tests
bench.py                       bounded reproducible benchmark runner
prototype/                     Python or focused Rust/CaDiCaL engine
verify.py                      independent model/artifact verifier
REPORT.md                      results and logical terminal decision
```

The report must lead with the logical result, not the speedup.  It must state
whether any production `sorry` closed, name the exact on-spine consumer if a
certificate is ready for Lean, and repeat the retained/omitted hypothesis
boundary.

## 13. Immediate implementation order

1. Bank the two current profile summaries and freeze the exact input hashes.
2. Add stage logging and hard budget supervision to a wrapper around the
   current driver.
3. Implement and differential-test the bitset matcher.
4. Reuse/factor the existing deterministic CNF encoder for a static CaDiCaL
   comparison.
5. Run the first performance and semantic equivalence checkpoint.
6. Only if that checkpoint passes, add incremental CaDiCaL and the persistent
   LRA oracle.
7. Run one seven-orbit bounded portfolio, perform the mandatory convergence
   review, and choose one Section 10 terminal decision.
