# Phase-3 CEGAR optimization implementation plan

Date: 2026-08-02

Status: active implementation. The bounded P0 benchmark commands, P1
terminal/sequential-solver seam, P2 Class-A learned-stream shadow ledger,
P2 Class-B all-stream ledger and durable-generation core, and P3 Class-A
Boolean-coverage plus reusable-classification-context slices are implemented.
The P4 discovery/terminal proof separation is implemented in the projected-
static-v3 successor; the initial P5 cache/index tranche is implemented in the
successor, while its performance and checkpoint acceptance gates remain open.
The first P6 fixed-shard local-simplification tranche is now implemented in
the successor as an opt-in exact transformation.  The P6b authenticated
adaptive-plan contract and P6c epoch-bound wave consumer are now implemented
as successor-only scheduling artifacts; the fixed cube-batch path remains
unchanged and live performance consumption remains separately gated.
The P7 persistent CaDiCaL discovery contract is now implemented as a
successor-only opt-in adapter with a fresh terminal-proof fallback; its
hard-shard throughput promotion gate remains open.
The P2 accounting and injected
durability-boundary gates are now complete; the end-to-end canary gate remains
open. The plan now also contains a
downstream CEGAR lemma-productivity and detector-portfolio tranche; it is not
yet implemented. The expanded multi-publication runtime diagnostic is now
complete, but the fast-manifest production canary remains blocked by the
end-to-end p95 gate. The gates include
spawned-process fresh repetitions, full-directory effect differentials, strict
streaming/tamper tests, exhaustive finite-universe comparison, and an
authoritative recount comparison at every mocked publication. No production
solver, generator, journal, active output namespace, Lean source, or installed
skill has been run or modified by this tranche.

## 1. Decision and scope

Proceed with a side-by-side Phase-3 CEGAR successor, not an in-place rewrite
of the current projected-static-v2 runner.

The optimization program has four goals:

1. remove repeated Python, certificate-search, serialization, hashing, and
   loader work from SAT iterations;
2. retain the current fail-closed certificate and terminal-DRAT boundary;
3. make performance and restart claims reproducible from authenticated
   artifacts rather than process snapshots; and
4. maximize sound, reusable lemma yield per certificate cost without confusing
   local learned cuts or exploratory invariant candidates with closure.

This is an infrastructure lane. It may accelerate discovery and finite
exhaustion, but it does not by itself close a Lean `sorry`, prove the
source-to-CNF bridge, or establish Problem 97. A terminal externally verified
DRAT remains finite external evidence until the corresponding encoding bridge,
certificate ingress, headline consumer, and transitive Lean axiom audit are
complete.

The current v2 implementation must remain byte-identical while any v2 run may
need a fresh-process resume. Its dependency manifest hashes the driver source,
and the projected-static-v3 compatibility suite pins v2 source identities.
New code and artifacts therefore use a new schema and output namespace.

### 1.1 Implementation ledger

As of 2026-08-02:

| Slice | Status | Evidence and remaining gate |
| --- | --- | --- |
| P0a timing contract and bounded commands | Implemented | Injectable wall/CPU clocks, canonical hash-chained diagnostic JSONL, final-subject binding, deterministic median/p95 summaries, spawned-worker peak-RSS capture, solver/checker wrapping, benchmark-copy guards, and executable `loader`/`mock-transcript`/`runtime-ab` commands are under `census/p97_search/benchmarks/`. Large-corpus drivers, I/O counters, malformed-corpus matrix, and finer parse/chain/flush timing remain open. |
| P1a runtime protocols | Implemented | `phase3_cegar_runtime.py` defines callable solver/checker protocols and a filesystem terminal publisher. Projected-static-v3 routes its sequential solver call and terminal CNF/DRAT/check effects through that seam while retaining coordinator-owned statuses, failure records, journals, manifests, cubes, and resume. |
| P1 Class-A effect promotion | Implemented with provenance limit | A test-local frozen inline terminal publisher, mechanically matching the tracked v2 effect order, and the extracted runtime produce identical complete directory trees for verified, missing-proof, empty-proof, checker-exception, rejected-proof, and solver-exception transcripts. There is no authentic pre-extraction v3 source snapshot: v3 and the runtime entered this worktree untracked. Therefore this establishes current effect equivalence, not historical old-v3 source identity. |
| P2 Class-A learned-stream seam | Implemented | The learned-certificate loader now streams strict JSONL while preserving authenticated replay. A shadow ledger tracks count, bytes, terminal record hash, rolling file digest, origin/stage counts, and canonical clause membership. It initializes from the one replay, advances only after append/flush/`fsync`, and is compared with the independent recount before every manifest publication. This remains the compatibility baseline for the successor durability core. |
| P3 Class-A Boolean coverage | Implemented | The immutable universe contains exactly 630 annotations and 15,120 legacy-ordered annotation/order pairs. Bitsets decide only candidate coverage; the legacy traversal still selects and emits the witness, orientation, certificate, stream, and hashes. All 80,640 source/subset cases agree, complete feature-off/on run trees agree, and the fixed-corpus cap-fact minimizer median improved 4.91x. See `phase3-p3-class-a-order-bitset-benchmark-20260802.md`. |
| P3 Class-B reusable classification context | Implemented selectively as an exact successor acceleration layer; Kalmanson lazy-query gate passed; provisional context-only 3x gate remains open | `ClassificationContext` now shares normalized rows, row/support/equality data, row-mask closure results, selected-row closure graphs, order positions, and canonical order hashes across the successor's structural, cap-order, rhombus, shared-pair, and Kalmanson paths. Differential results are exact: 40 cap-order certificates, 1,500 x 9 closure paths, all 128 shared-pair subsets, and the residual rhombus/Kalmanson certificates. Measured speedups are 2.096x for cap-order certificates, 248.683x for repeated closure paths, 2.756x for rhombus, 1.182x for shared-pair coverage, 26.896x for Kalmanson cap minimization, and 1.218x for the complete Kalmanson certificate. The eager full-universe Kalmanson mask remains diagnostic; production uses the lazy compatible-order query. See `phase3-p3-classification-context-benchmark-20260802.md`. |
| P4 discovery/terminal proof separation | Implemented in successor v3; proof and performance gates scoped separately | Sequential and cube-local discovery calls are proof-free. A discovery UNSAT freezes the exact terminal CNF, byte-checks the written artifact, performs a fresh proof-producing rerun, requires UNSAT and a nonempty DRAT, and then uses the existing checker. CNF drift, proof-rerun SAT/UNKNOWN/exception, missing/empty DRAT, and checker disagreement fail closed. Cube-local UNSAT remains a non-terminal scheduling result. The 53-test runtime/successor suite and the P4 failure matrix pass; see `phase3-p4-discovery-terminal-proof-benchmark-20260802.md`. |
| P5 authenticated loader cache and indexed antichain — initial tranche | Implemented in successor v3, opt-in; performance/checkpoint gates open | `phase3_loader_cache.py` adds source dense-index/hash-chain/file-identity validation, cache schema/configuration/driver/cache-module/order binding, atomic authenticated writes, and an indexed antichain whose subset/superset queries preserve legacy ordering. `--compiled-loader-cache` is successor-only; cache hits are accelerators, while terminal/completed-resume paths replay the source and compare ordered records, clauses, and active bank state. Focused cache/runtime/v3 verification is 58 tests; no warm-start speedup or checkpoint claim is made yet. |
| P2 Class-B durability core and fast-manifest tranche | Implemented, opt-in; promotion blocked by bounded p95 gate | Successor v3 ledger-authenticates all four growing streams and publishes immutable generations with parent-directory durability. `manifest_fast_path=True` now requires an explicit positive `manifest_audit_every`; periodic RUNNING publications and all restart/terminal/checkpoint boundaries retain independent full recounts. The final 40k synthetic accounting report is byte-equivalent and passes the 5x gate (776.1x single projection; 17.9x sampled cumulative). The append/write, flush, fsync, generation-write, pointer-replace, and both directory-sync fault cases pass in `fault-matrix` (including the post-pointer-sync indeterminate state). The expanded four-publication A/B preserved semantic and non-manifest artifact identity and passed RSS (1.026x), but fast end-to-end wall p95 was 1.124x of full and failed the 1.10x gate. Its median was 0.995x; stage timing showed no sustained manifest/hash hot spot, so the fast path remains opt-in and no production canary is authorized. |
| P6 fixed-shard simplification, P6b plan, and P6c wave consumer | Implemented in successor v3, opt-in; live performance gates open | `phase3_shard_optimization.py` preserves the exact fixed-shard source/residual contract. `phase3_adaptive_cubing.py` adds bounded deterministic pilots, authenticated parent/child plans, exact-cover replay, immutable bank-epoch transitions, and authenticated atomic wave checkpoints with crash/resume and stale-epoch rejection. The successor adapter preserves the fixed partition order; 12 adaptive tests, 36 successor tests, and the fixed P6a driver/resume suite pass. No production solver, scheduler, throughput, or memory claim is made. |
| P5 cache/index promotion | Contract complete; performance/checkpoint gates open | Warm-start, cold-replay, large-journal, peak-RSS, and periodic-checkpoint gates remain open. The cache remains an opt-in accelerator and source replay remains authoritative. |
| P7 persistent incremental CaDiCaL discovery | Contract complete; real three-family canary running; throughput promotion gate open | The append-only IPASIR adapter, restart rebuild, fresh proof fallback, manifest frontier metadata, differential tests, and native smoke are complete. `phase3_cegar_benchmark persistent-ab` now runs isolated real subprocess/persistent arms and records authenticated run hashes, models/hour, combined worker/solver RSS, status/count agreement, and terminal-branch coverage. Promotion still requires the 1.5x models/hour, terminal-agreement, and RSS gates. |
| P8 alternate encodings and symmetry lifting | Planned; gated on P7/P0 profiles | Evaluate only after the lower-risk runtime and discovery gates; any change gets a new encoding/proof schema and fresh output namespace. |
| P10 lemma productivity and detector portfolio | Planned, downstream | This is a learning/analytics plane, not an IC3/PDR replacement: first add authenticated productivity telemetry and read-only proof-core/schema mining; then evaluate deterministic detector selection and invariant-like lemma producers. No schema is promoted without replayable certification and a direct consumer. It remains downstream of P2 durability and the relevant P3/P5/P6 indexing work. |

Earlier verification through P2 Class A: 45 focused tests passed across the P2/runtime
suite (the later P3-only targeted suite is 44 tests). Ruff passed on the
runtime, timing harness, benchmark CLI, v3 adapter, and affected tests. The
P2 mocked-transcript report has 212 timing records and report SHA-256
`8f690a1354772faf830eab93e295d3c62e50bebb77edd35efb2703dea1082508`;
the P2 loader report has 168 timing records and report SHA-256
`e2be91415d95c6b701ad0aa8d68fe4962434f19eb08059cc10eb0c681f823644`.
Each contains three spawned-process/new-copy and five same-process/same-copy
runs. All fresh transcript trees agree, and every loader tree is unchanged by
replay. All solver and checker processes were injected fakes; this is not a
SAT, DRAT, finite-exhaustion, performance, or Lean closure result.

Current P2 Class-B verification includes the focused runtime/v3 and benchmark
tests, the adjacent order-universe suite, `py_compile`, and Ruff. It covers all
four stream ledgers, authenticated generation publication and collision
handling, pointer-replacement failure with the prior generation retained,
append/flush/fsync failures, both pre- and post-pointer directory-sync
failures, tamper detection, completed-resume replay, legacy manifest rejection,
streaming loaders, the cached/prospective RUNNING path, full checkpoint replay
equivalence, deliberate prospective-state drift to `UNKNOWN`, and the
existing Class-A durability gates. The retained reports are
`scratch/p97-distinct-distance-lane/phase3-cegar-accounting-40k-20260802-final2/report.json`
and
`scratch/p97-distinct-distance-lane/phase3-cegar-fault-matrix-20260802-final2/report.json`,
and the bounded A/B report is
`scratch/p97-distinct-distance-lane/phase3-cegar-runtime-ab-20260802-run3/report.json`.
That A/B report records semantic-manifest and non-manifest-artifact equality,
fast/full RSS p95 ratio `0.9887`, and fast/full end-to-end wall p95 ratio
`1.2499`; the 10% end-to-end gate therefore fails closed rather than promoting
the fast path.
No production solver, DRAT checker, active corpus, or frozen v2 namespace was
run or modified.

## 2. Current baseline

The implementation has four distinct sources of avoidable cumulative work:

- `_manifest` and `_artifact_hashes` repeatedly rescan and rehash growing
  artifacts; the opt-in successor fast path now caches immutable inputs and
  maintains prospective aggregates, while the default/replay path deliberately
  retains the old authoritative recount.
- `_strict_json_lines` and several loaders materialize complete JSONL files;
  authenticated bank replay reparses and revalidates all records at startup.
- cap/order and certificate minimizers repeatedly enumerate a fixed universe
  using Python tuples, dictionaries, combinations, and reconstructed closure
  graphs.
- every refinement iteration serializes the complete CNF and starts a fresh
  CaDiCaL process with proof tracing, even though a SAT proof is discarded.

The Phase-3 cap/order universe is fixed:

- seven non-Moser labels;
- cap-fibre sizes `(2, 2, 3)`;
- 630 labelled cap annotations; and
- 24 induced orders per annotation, hence 15,120 annotation/order pairs.

Existing measurements establish scale, not projected speedup:

- authenticated depth-5 journals contain 212,572 records and 943,040,900
  bytes in total;
- one recorded load of a 42,702-clause projected-sequential antichain took
  418.384 seconds; and
- the cached classification-accounting microbenchmark was much faster than a
  full recount, but that result measures only the accounting operation and is
  not an end-to-end CEGAR speedup.

The checked-in implementation has broad functional tests but no stable
stage-level performance harness. The first implementation milestone is
therefore measurement and contract capture, not an unprofiled rewrite.

## 3. Non-negotiable trust and restart invariants

Every work package must preserve these invariants.

### 3.1 Classification and cut admission

- Every SAT assignment is either classified exactly once into one learned cut
  or one survivor, never both and never neither.
- Every learned clause is reproduced by independent certificate replay before
  it can enter a solver or published bank.
- `UNKNOWN`, malformed output, certificate disagreement, cache disagreement,
  or solver disagreement fails closed and contributes no cut.
- A solver core, MARCO core, detector match, or relaxation-UNSAT result is
  discovery evidence until the appropriate exact certificate admits it.

### 3.2 Terminal acceptance

- Discovery UNSAT is not terminal acceptance.
- Terminal acceptance requires a freshly materialized exact final CNF, a
  nonempty DRAT from a fresh proof-producing CaDiCaL process, and exact
  `drat-trim` verification.
- Sharded terminality additionally requires an authenticated, exhaustive,
  pairwise-disjoint partition and independent aggregate replay.
- The final CNF must include only independently replayed bank clauses. A DRAT
  proves UNSAT of the augmented CNF; it does not prove that learned cuts were
  valid consequences of the intended geometry.

### 3.3 Runtime state and crash recovery

- In-memory counters, rolling hashes, bitsets, indexes, incremental solver
  state, and compiled caches are disposable accelerators, never authorities.
- Resume reconstructs authoritative state from authenticated durable records.
- A partial JSONL tail is never silently truncated. Quarantine the namespace,
  or recover from an immutable authenticated checkpoint into a new namespace
  with an explicit recovery record.
- Successor v3 now has parent-directory `fsync` and explicit generation/pointer
  semantics for the published manifest transaction. The injected append and
  generation fault matrix passes, including the post-pointer-sync crash
  window, but this remains a bounded fault test rather than a claim of
  arbitrary-crash safety.
- A namespace containing `failure.json`, a malformed chain, schema mixing,
  or unexplained artifact drift remains closed. Preserve it for diagnosis;
  do not repair evidence in place.

## 4. Compatibility classes and acceptance gates

Every change must be assigned one of these classes before implementation.

| Class | Typical changes | Required gate |
|---|---|---|
| A: byte-identical refactor | streaming reads, cached immutable bytes, rolling accounting, precomputed predicates that preserve selection order | Given identical inputs and mocked solver transcripts, byte-identical CNFs, journals, selected witnesses, learned clauses, coverage hashes, certificate hashes, chain heads, and terminal inputs. Only explicitly listed driver/provenance hashes may differ. |
| B: semantic-equivalent orchestration | proof-free discovery plus terminal rerun, persistent discovery solver, fixed sharding, compact artifact retention | Identical classifications and regenerated final CNF semantics, fail-closed negative tests, independently verified terminal artifacts, and a fresh schema/namespace where bytes intentionally differ. |
| C: new semantics | encoding, literal namespace, detector, canonicalization, ordering, bootstrap, prefix-bank, or symmetry changes | New specification and schema version, fresh output namespace, strict mixed-schema rejection, independently replayed source-bank translation, overlap fixtures, and differential agreement on the unchanged semantic surface. |

Class A is the default. If a proposed optimization cannot preserve current
witness or ordering choices, it is not silently downgraded to “equivalent”; it
moves to Class B or C with an explicit migration argument.

## 5. Target architecture and coordinator frontier

### Before

The v2 and projected-static-v3 modules each own a nearly complete engine:
loading, certificate replay, classification, manifest generation, CNF
materialization, solver lifecycle, cube coordination, and publication.

### After

Keep v2 frozen. Make projected-static-v3 a thin adapter over shared successor
components:

```text
projected-static-v3 adapter
  -> phase3_cegar_runtime.py
       -> RunLedger / authenticated journal writer
       -> ClassificationContext / order universe
       -> SolverBackend
       -> TerminalPublisher
  -> phase3_order_universe.py
  -> phase3_loader_cache.py
  -> phase3_solver_backend.py
```

The adapter supplies the encoding, schema, classifier hooks, cube policy, and
artifact-retention policy. The shared runtime owns orchestration and one
single-writer commit protocol. This removes duplicated hot-loop mechanics
without forcing detector or encoding semantics into one generic abstraction.

The later P10 learning plane consumes authenticated records emitted by this
runtime but does not participate in cut admission until its own replay gate
passes. It may measure bounded assignment elimination, core size, clause
volume, detector cost, and subsumption; it may propose normalized lemma
schemas; and it may schedule existing detectors. It must not silently change
Class-A witness order or turn an exploratory invariant into a trusted cut.

Immediate constructor fan-out is deliberately limited to four cohesive
components. Do not create a framework of one-method wrappers around every
existing helper.

### Source touch map

| Path | Policy |
|---|---|
| `census/p97_search/phase3_structural_cegar.py` | Frozen v2 reference and compatibility oracle. Do not edit while a v2 namespace may need fresh-process resume. |
| `census/p97_search/phase3_structural_cegar_projected_static_v3.py` | Successor adapter to be thinned behind the shared runtime. Capture its pre-refactor source/config hashes first. |
| `census/p97_search/phase3_cegar_runtime.py` | Additive successor effect boundaries. P1a currently owns solver/checker protocols and terminal publication only; coordinator policy remains in v3. |
| `census/p97_search/benchmarks/phase3_cegar_timing.py` | Non-authoritative timing records and benchmark-copy helpers. Timing output must remain outside measured run namespaces. |
| `census/p97_search/sat_generate.py` | Keep the current encoding and literal identities frozen through P7. Reuse its optional no-proof solver path and split DIMACS header/body APIs. |
| `census/p97_search/phase3_ordered_metric_rules.py` | Reference semantics and legacy witness order for P3 differential tests. |
| `census/global_confinement/cap_selected_nogood_certificate_probe.py` | Closure and `_NogoodBank` reference implementation for row-mask memoization and indexed antichains. |
| `census/p97_search/tests/test_phase3_structural_cegar.py` and projected-static-v3 tests | Extend with transcript identity, fault injection, cache corruption, and backend differential suites. |
| `census/p97_search/PHASE3-SPEC.md` | Update only when a successor contract is implemented and accepted; do not document a planned gate as passed. |
| `scratch/p97-distinct-distance-lane/` | Benchmark manifests/reports and canary status. Important generated corpora stay here, not in `/tmp`. |

## 6. Work packages

### P0. Freeze contracts and add a benchmark harness

Objective: obtain reproducible stage evidence and a differential corpus before
changing runtime behavior.

Implementation:

- Freeze `phase3_structural_cegar.py` and its current schemas.
- Add a benchmark-only harness under `census/p97_search/benchmarks/` or the
  existing test tooling. Benchmark copies of artifacts, never active output
  directories.
- Add monotonic timing and counters for:
  - base encoding and immutable DIMACS-body generation;
  - loader I/O, JSON parse, chain validation, certificate replay, antichain
    reconstruction, and startup-to-solver-ready;
  - CNF rendering and write time/bytes;
  - solver wall/CPU time and result;
  - each classifier and minimizer;
  - journal append, flush, `fsync`, manifest construction, and hashing;
  - terminal rerun, DRAT size, and DRAT verification; and
  - peak RSS, records/second, models/hour, and cuts/model.
- Write timings to an append-only, schema-versioned JSONL stream tied to the
  run manifest and chain head. Timings are diagnostic and never trusted for
  mathematical acceptance.
- Use an injectable clock and fake subprocesses in unit tests so timing
  instrumentation cannot perturb deterministic transcript tests.

Benchmark corpus:

- checked-in 100-record learned/survivor/metric fixtures;
- frozen 35k, 45k, and 65k banks used by the loader comparison;
- authenticated copies of representative depth-5 journals, including an
  aggregate 212,572-record replay when available;
- representative easy, medium, and hard shard checkpoints; and
- malformed controls: truncation, duplicate/reordered records, bad chain
  hash, stale dependency hash, schema mix, missing cube artifact, and cache
  corruption.

Run at least three fresh-cache and five warm-cache repetitions. Record median
and p95 wall time, CPU time, RSS, bytes read/written, and all output hashes.
Retain niceness in the manifest; keep the current default of low-priority
miners and change it only from live contention evidence.

Acceptance:

- Harness results are reproducible and source/config/artifact hashes are
  recorded.
- Instrumented mocked runs produce the same artifacts as uninstrumented runs.
- No performance claim is promoted from a process snapshot alone.

### P1. Extract shared successor runtime without changing semantics

Objective: create one implementation seam for later optimization while v2
remains frozen.

Implementation:

- Introduce `phase3_cegar_runtime.py` with typed protocols for encoding,
  classification, solver invocation, artifact policy, and terminal
  publication.
- Redirect projected-static-v3 through the runtime one slice at a time:
  publication, then sequential solve, then cube batches, then resume.
- Keep the coordinator as the only journal writer. Workers return immutable
  result envelopes; completion order cannot affect commit order.
- Capture a golden mocked solver transcript and compare old-v3/new-runtime
  output after every extraction slice.

Acceptance:

- Class-A byte-identity gate passes for all unchanged semantics.
- Existing v3 schema-separation, tamper, cube, compact-artifact, and terminal
  tests remain green.
- No v2 file or active artifact namespace is modified.

### P2. Streaming journals, `RunLedger`, and durable generations

Objective: make hot-loop publication O(1) in accumulated record count while
improving, rather than weakening, restart semantics.

Implementation:

- Replace whole-file `read_bytes().splitlines()` with strict streaming JSONL
  iteration that preserves exact validation and line-number diagnostics.
- Add a `RunLedger` containing, per stream:
  - record and byte counts;
  - terminal record hash and copied rolling digest;
  - origin/stage/active-stage counters;
  - dense raw-index frontier and classified-index set/bitmap;
  - survivor/cube counts; and
  - canonical learned-clause membership set.
- Initialize the ledger from one complete authenticated replay. During a run,
  use a prospective-state transaction:
  1. serialize the record once;
  2. append, flush, and `fsync` the stream;
  3. compute the prospective ledger without changing committed in-memory
     state;
  4. atomically publish and sync the manifest generation; and
  5. swap the prospective ledger into memory.
- Cache immutable hashes and bytes (`base.cnf`, smoke/config/bootstrap inputs,
  common DIMACS body). Build manifests from the ledger.
- Preserve an independent full-recount path. Run it at startup, checkpoint,
  terminal publication, clean shutdown, and a configurable audit cadence—not
  on every SAT classification.
- Add a generation/transaction record binding journal heads, artifact hashes,
  and manifest generation. `fsync` newly written files and their parent
  directory before publishing a generation.
- Never serialize Python hash-object internals. On restart either rehash once,
  or load an authenticated chunk checkpoint and replay its suffix.

Acceptance:

- First land a Class-A shadow mode that updates the ledger but retains the
  current per-publication recount and proves exact agreement. Disabling the
  per-iteration recount is a separate Class-B successor-schema change, with
  full replay still mandatory at resume, checkpoint, terminal publication,
  and clean shutdown.
- Byte identity for all logical streams and CNFs in both modes; only the
  explicitly versioned manifest/provenance fields may differ in fast mode.
- Fault injection at every append/flush/file-replace/directory-sync boundary
  either resumes from the last committed generation or fails closed without
  silent tail repair.
- A deliberately corrupted ledger or cache is detected by independent replay.
- Default provisional performance gate: at least 5x reduction in manifest and
  accounting wall time at 40k records, with no end-to-end p95 or RSS regression
  over 10%. Revise this threshold only after P0 records a better baseline.

Current P2 boundary (2026-08-02): the Class-A learned-stream seam remains the
compatibility baseline, and successor v3 now extends the same authenticated
shadow accounting to the survivor, solver-log, and cube-batch JSONL streams.
Strict streaming preserves the existing validation and replay diagnostics,
with the intentional v3 fail-closed rejection of a truncated final JSONL line.
Each stream ledger advances only after its append/flush/`fsync` returns.

Every v3 publication is serialized as an authenticated, immutable
`manifest.gNNNNNNNN.json` generation. The generation is written and its parent
directory synced before the `manifest.json` pointer is replaced and synced
again. Resume validates both byte identities and all stream-ledger snapshots;
legacy manifests, missing/mismatched generations, orphaned tails, and
generation collisions fail closed. Completed/checkpoint resume replays the
committed generation exactly, without silently repairing a stream tail.

The opt-in fast path caches immutable artifact hashes once at startup and
maintains a prospective state transaction after each durable log,
classification, and cube-batch append. RUNNING publications use that state
and the authenticated stream-ledger snapshots without rescanning the complete
growing artifacts. The initial publication, checkpoint/status transition,
terminal/failure publication, cube-batch audit boundary, and resume/completed
replay still use the independent full recount. A deliberate missed state hook
is converted to a fail-closed `UNKNOWN`, and the fast RUNNING generation is
differentially compared with the following full checkpoint generation.

The fast path is opt-in and requires an explicit positive audit cadence. The
40k accounting gate and bounded append/flush/replace/directory-sync matrix
pass. The bounded A/B canary passes semantic/artifact/RSS checks but fails the
10% wall-p95 gate on this transcript, so no production canary is authorized by
this tranche. Therefore this tranche makes no arbitrary-crash-safe,
end-to-end-speedup, SAT, DRAT, finite-exhaustion, or Lean-closure claim.

### P3. Compile the fixed cap/order and closure universes

Objective: replace repeated Python search over small fixed universes with
bitset predicates while retaining exact certificate selection.

Implementation:

- Add immutable `Phase3OrderUniverse` data for all 630 annotations and 15,120
  annotation/order pairs.
- Assign stable integer IDs and precompute:
  - fact-to-compatible-order masks;
  - descriptor/core-to-covered-order masks;
  - forward/reverse position arrays; and
  - stable mappings back to current JSON descriptors.
- Represent a 15,120-element set as a Python integer or fixed word vector.
- Use bitsets only to answer whether a candidate retained-fact/core subset
  succeeds. Continue enumerating candidate subsets in current
  cardinality-then-lexicographic order.
- After finding the first winning candidate, replay the existing ordered
  descriptor and forward-before-reverse traversal once to generate the exact
  current witness, coverage stream, JSON, and hash.
- Give each assignment a `ClassificationContext` with normalized metric rows,
  row/support masks, equality edges, row-mask closure memo, cap masks, and
  order-position arrays. The completed successor tranche reuses it across
  structural, cap-order, rhombus, and shared-pair stages; profile and extend
  the same interface to Kalmanson only after its measured hot path is
  replaced by a compiled detector index.
- Memoize equality closure over the at-most-ten-row universe by row mask. Once
  minimum rows are selected, build one graph and derive all obligation paths
  from it.

Acceptance:

- Exhaustive differential test over all 630 annotations and all relevant
  candidate masks.
- For a fixed classification corpus, exact retained subset, core,
  orientation, first witness, learned clause, coverage hash, certificate hash,
  and journal record hash match the legacy implementation.
- Property tests compare bitset and tuple predicates on random subsets.
- Default provisional gate: at least 3x classifier/minimizer speedup on the
  fixed corpus and no end-to-end regression over 5%.

Implemented Class-A slice (2026-08-02):

- `phase3_order_universe.py` assigns stable legacy-order IDs, compatible-fact
  masks, annotation masks, forward/reverse positions, and cached cyclic-role
  masks for all 15,120 order records;
- bitsets reject losing retained-fact candidates, but every winning candidate
  is still replayed through the unchanged descriptor-major,
  forward-before-reverse legacy traversal;
- exhaustive tests cover all 80,640 source/subset cases, independently rebuild
  the real Class-A descriptor mask, and compare complete disabled/enabled run
  directories;
- the retained fixed-corpus diagnostic reports a 4.91x cap-fact minimizer
  median improvement and a 1.64x bounded-transcript median improvement, with
  identical subject trees; and
- the reusable `ClassificationContext` and equality-closure tranche is now
  implemented selectively in the successor and has its own exact differential
  report; rhombus and the lazy Kalmanson query are promoted to the context
  path, while the eager Kalmanson compiled-mask run remains diagnostic after
  measuring 0.697x on the fixed first-model diagnostic; and
- neither slice is a production solver claim.

### P4. Separate discovery solving from terminal proof production

Objective: stop producing discarded proof traces during SAT iterations.

Implementation:

- Call discovery CaDiCaL with `proof_path=None` in sequential and cube-local
  iterations.
- On discovery SAT, classify and continue exactly as today.
- On discovery UNSAT, freeze the authenticated journal heads, materialize the
  exact final CNF into a terminal generation, and launch a fresh CaDiCaL
  process with proof tracing.
- Require the proof-producing rerun to return UNSAT, emit a nonempty DRAT, and
  pass the existing verifier. SAT, UNKNOWN, timeout, missing proof, CNF drift,
  or verifier disagreement becomes `UNKNOWN`/failure; it is never terminal.
- Do not claim a cube-local discovery UNSAT as terminal unless the complete
  aggregate partition and proof protocol requires and verifies it.

Acceptance:

- Scripted SAT→UNSAT, UNSAT→SAT, UNSAT→UNKNOWN, missing-proof, empty-proof,
  and changed-CNF tests all fail at the intended boundary.
- Terminal CNF bytes are reread and compared with the coordinator's frozen
  final-CNF bytes before the proof-producing solver is called; the proof solver
  receives that exact `terminal.cnf` path.
- Existing terminal DRAT and manifest verification remains unchanged in
  strength.

### P5. Authenticated compiled loader cache and antichain indexes

Objective: pay full certificate replay once per source snapshot, while keeping
the cache outside the trust boundary.

Implementation:

- After a successful full replay, write a compact cache containing:
  - canonical clause vectors and clause-order metadata;
  - structural row keys and detector-specific indexes;
  - antichain bitsets/postings and stage summaries;
  - source byte length, terminal chain hash, and source SHA-256; and
  - cache schema, encoding/configuration identity, and loader source/version
    identity.
- Validate the source hash and all cache-key fields before warm loading.
- At terminal publication and explicit audit mode, independently replay source
  journals and compare exact ordered clauses and final CNF hash.
- Add periodic immutable authenticated checkpoints for growing journals; replay
  only the suffix after the newest valid checkpoint.
- Intern row keys and represent nogoods as compact integer bitsets. Maintain
  size buckets and `postings[row_id] -> nogood_ids` so subset/superset queries
  inspect plausible candidates instead of all active nogoods.
- Keep deterministic insertion and output ordering independent of index layout.

Acceptance:

- Cold cache creation is semantically identical to legacy replay.
- Warm load reproduces exact clause order, counts, chain head, and final CNF.
- Bit flips, truncation, stale source/config/loader identity, and checkpoint
  suffix mismatch reject the cache and fall back to full replay or fail closed.
- Default provisional gate: warm startup at least 5x faster on both 45k and 65k
  banks; cold replay no more than 10% slower; 212k replay at least 1.5x faster
  when suffix checkpoints are applicable; peak RSS no more than 10% worse.

Initial tranche delivered 2026-08-02:

- `census/p97_search/phase3_loader_cache.py` provides the authenticated cache
  envelope, source identity scan, atomic write, and indexed antichain state.
- Projected-static-v3 accepts `compiled_loader_cache=True` (and the CLI flag),
  writes `compiled-loader-cache.json` at completed/terminal publication, and
  propagates the setting through shard replay.
- A cache hit still triggers first-principles replay at terminal and completed
  resume boundaries; disagreement fails closed. The cache is not a proof or a
  substitute for source replay.
- Differential, invalidation, torn-source, cache round-trip, and resume tests
  pass in the focused successor suite. Periodic suffix checkpoints and the
  large-bank performance gates are not implemented or measured yet.

### P6. Shard-local simplification and deterministic adaptive cubing

Objective: reduce per-shard formula and scheduling waste without changing
coverage.

Implementation:

- The completed P6a tranche simplifies every source clause under fixed shard
  units in top-level sequential successor runs:
  - drop clauses satisfied by the cube;
  - remove literals falsified by the cube;
  - detect an empty residual immediately; and
  - deterministically deduplicate/subsume residual clauses.
- Record original and residual source hashes, counts, retained-index hashes,
  counters, and the exact transform in each shard manifest and solver log.
  The residual retains the shard literals as unit clauses, and the terminal
  proof path consumes the exact residual CNF.  The pure tests exhaustively
  compare the source and residual formulas on a bounded assignment universe;
  the driver/resume canary checks the authenticated metadata and terminal
  artifact hash.
- The completed P6b contract adds an authenticated adaptive cube plan:
  1. produce a shallow deterministic partition;
  2. run each leaf under a fixed pilot conflict or wall budget;
  3. retain completed/easy leaves;
  4. split only unresolved hard leaves; and
  5. publish the resulting decision tree before the next wave.
- `verify_plan` checks leaf pairwise disjointness and exact parent coverage
  independently of the pilot runner, including explicit UNKNOWN and
  interruption/cap leaves.  The plan hash binds the tree, budget, semantic
  variables, and bank epoch.
- `make_bank_epoch` and `validate_bank_epoch_transition` make the wave
  boundary immutable: a batch is bound to `E_i`; later cuts must be audited,
  canonicalized, and published as `E_(i+1)` before unresolved leaves restart.
  P6c adds successor-only `run_plan_wave` and the live-encoding
  `run_adaptive_cube_wave` adapter.  They consume the published leaves in
  canonical order, checkpoint atomically after each completed leaf, bind
  state to the plan and bank epoch, reject stale inputs, and resume from the
  last committed leaf after a crash or budget stop.  Asynchronous live clause
  mutation remains prohibited.
- Benchmark bank variants as a portfolio; a larger union is not presumed
  faster.

Acceptance:

- P6a fixed-shard simplification satisfies the source/residual
  semantic-equivalence gate, rejects contradictory shard assumptions, and
  preserves the fresh terminal proof boundary.  The option is currently
  sequential fixed-shard only; cube-batch scheduling is unchanged.
- P6b's authenticated plan contract passes exact cover/disjointness tests,
  including interrupted, exception, pilot-cap, and UNKNOWN leaves, before any
  scheduler claim is made.
- The implementation and verification record is
  `phase3-p6b-adaptive-cube-plan-20260802.md`.
- P6c's wave-consumption gate passes canonical leaf-order consumption,
  authenticated atomic checkpoints, simulated crash/resume from the last
  committed leaf, budget-stop/resume, explicit exception-to-UNKNOWN handling,
  stale bank-epoch rejection before consumption, and a differential check
  against the fixed cube partition.  The implementation and verification
  record is `phase3-p6c-adaptive-wave-consumer-20260802.md`.
- P6c is contract-complete but not performance-promoted.  No throughput
  canary is authorized until a future performance profile and first-principles
  replay acceptance are complete; the fixed `run_driver` path remains the
  compatibility baseline.
- Canary at 1, 2, 4, 8, then 16 external shard processes; keep one worker per
  shard initially and respect a global, not per-wave, core lease.
- Promote only if steady-state models/hour improves on at least two of three
  representative hard shard families, aggregate throughput does not regress
  over 5%, and memory/I/O contention remains within P0 bounds.

### P7. Persistent incremental CaDiCaL as a discovery oracle

Status as of 2026-08-02: the successor contract is implemented and
verified; the throughput-promotion gate remains open.

Objective: retain learned clauses, phases, activities, and parsed base state
across monotone refinement iterations.

Implementation:

- `census/p97_search/phase3_incremental_cadical.py` supplies the optional
  `PersistentDiscoveryRunner` and native IPASIR/CaDiCaL factory.
- `phase3_structural_cegar_projected_static_v3.py` wires it behind
  `--persistent-discovery` (or the callable factory seam), restricted to the
  sequential unsimplified append-only path.  The frozen v2 runner remains the
  reference and rollback path.
- The adapter adds the first complete CNF once and only appends a verified
  suffix on later discovery calls.  A new process rebuilds from the complete
  authenticated CNF; no opaque solver snapshot is resumable.
- Any proof-requesting call bypasses the incremental object and delegates to
  the fresh proof-producing solver and existing DRAT checker.
- Manifest metadata records the adapter schema, backend/API identity and
  library hash, solve/rebuild counts, solve statistics, clause frontier and
  canonical frontier hash, plus the resume and terminal policies.
- `census/p97_search/benchmarks/phase3_cegar_benchmark.py persistent-ab` is the
  bounded real-discovery gate.  It requires at least three explicitly named
  fixed-shard families, runs each arm in a fresh spawned process and namespace,
  and authenticates the prefix-bank pins and resulting v3 manifests.  The
  worker's RSS includes the subprocess solver for the baseline arm and the
  native IPASIR solver for the persistent arm.  A checkpoint-only run reports
  terminal proof coverage as incomplete and cannot open production promotion.

Acceptance:

- Four successor tests cover strict DIMACS parsing, append-only reuse and
  rejection, restart reconstruction, and v3 integration with a fresh proof
  terminal call.  The existing v3 suite remains green, including the frozen
  v2/source-generator byte-identity guard.
- A local native smoke test against CaDiCaL 3.0.0's shared IPASIR library
  returned SAT, then UNSAT after an appended clause, and released the native
  handle cleanly.
- Fresh terminal rerun and DRAT verification remain mandatory; this adapter
  is a discovery oracle only.
- Performance promotion is pending: require at least 1.5x models/hour on two
  of three hard shard families, no terminal-status disagreement, and no RSS
  regression over 25% without a separately approved tradeoff.
- The first current-hash prefix-bank canary is running in
  `scratch/p97-distinct-distance-lane/p7-canary-20260803/hard-shard-ab` over
  shard indices 4, 12, and 24 with a two-model checkpoint cap.  These are
  v3-successor measurements backed by the authenticated source prefix; they
  are not v2 replay or closure evidence.  The outcome must be recorded before
  any production opt-in or P8 encoding work.

### P8. Alternate cardinality encodings and symmetry lifting

Objective: evaluate higher-risk semantic changes only after runtime hot spots
are removed.

Implementation:

- Build a separate encoding benchmark matrix for direct combinations,
  sequential counters, totalizers, and cardinality networks.
- Compare end-to-end models/hour, conflicts, decisions, propagations, CEGAR
  iterations, proof size, terminal verification time, and memory—not base CNF
  size alone.
- Version every encoding, auxiliary-variable namespace, CNF schema, and proof
  artifact. No old journal resumes under a new encoding.
- Before symmetry lifting, compute and independently verify the exact
  automorphism group preserving the Moser frame, cap profile, literal
  semantics, fixed bank, and shard.
- Replay every symmetry image of a certificate independently before adding its
  clause. Prefer verified lifted cuts to unverified symmetry-breaking axioms.

Acceptance:

- Class-C gate, new specification, fresh output namespace, and independent
  source-to-encoding review.
- At least one representative hard corpus shows material end-to-end benefit;
  otherwise retain the current encoding.

### P9. Future `card_head` lane

The current `census/card_head/runner.py` remains deliberately fail-closed with
execution disabled. Treat it as a protocol/adapter design source, not as an
operational Phase-3 worker.

Before enabling a permanent worker:

- use a canonical-orbit containment index instead of eagerly expanding every
  pattern orbit;
- use an append-only transaction log plus periodic authenticated compaction
  rather than rewriting the whole bank per commit;
- import the successor runtime's durable-generation, measurement, cache, and
  terminal-publication contracts; and
- add an explicit worker implementation and end-to-end fail-closed test before
  removing `PREFLIGHT_VALID_EXECUTION_DISABLED`.

This package is deferred until P0–P6 identify and remove the measured Phase-3
bottlenecks. Do not unify `card_head` and Phase-3 merely to share names.

### P10. Lemma productivity, invariant mining, and detector portfolios

Objective: make each failed candidate produce the broadest sound,
replayable, and measurable refinement available, while treating PDR/IC3 as a
lesson about inductive generalization rather than as a drop-in replacement for
this static finite CEGAR problem.

This package is deliberately split into discovery analytics, certified
generalization, and scheduling. The first two can begin after P2 and the
relevant P3 certificate interfaces; portfolio promotion should wait until the
P5/P6 indexes and immutable bank epochs are available.

Implementation:

- Add a versioned productivity record to the successor namespace. Record the
  producer/detector, exact source assignment and certificate identifiers,
  retained row/fact/incidence/core sizes, learned-clause size, replay and
  minimization costs, antichain/subsumption outcome, and the number of
  candidates eliminated in any explicitly bounded audit universe.
- Keep bounded elimination counts honest: where no finite assignment universe
  is available, report exact structural lower bounds and observed
  subsumption, not extrapolated “millions blocked” claims.
- Build a read-only proof-core miner over authenticated certificates. Mine
  repeated normalized row, incidence, cap/order, equality, inequality, and
  detector signatures, with unused-fact and label-erasure probes where the
  certificate contract permits them.
- For each proposed schema, retain its parent certificates, normalization
  recipe, hypotheses, exact replay result, and intended consumer. Mark a
  schema `PARKED-SPEC` until a replayable finite consumer or kernel-checked
  theorem consumes it; a conditional contradiction package is bookkeeping,
  not closure.
- Add a deterministic portfolio scheduler using only an authenticated feature
  vector and fixed tie-break order. Compare the chosen detector against the
  fixed cascade on held-out hard shards, and record skipped detectors and
  UNKNOWNs explicitly. Do not alter Class-A output order; Class-B changes need
  the semantic-equivalence gate.
- Add an optional invariant-like producer that searches for compact families
  of cuts subsuming many local certificates. Keep it outside the trusted bank
  until every generated cut is independently replayed and its source-to-CNF
  meaning is audited.

Acceptance:

- Telemetry is append-only, authenticated, schema-versioned, and has no effect
  on classification, clause admission, witness selection, or terminal proof
  production.
- Differential runs preserve the existing certificate, learned clause,
  coverage stream, and terminal artifacts for Class A; Class-B schedules
  preserve exact semantic outcomes and fail closed on missing data.
- Core-minimization and schema-mining results reproduce from a frozen journal,
  including negative controls in which an unused fact cannot be removed.
- A promoted schema has a replayable certificate, an explicit finite or Lean
  consumer, and a recorded coordinator-interface frontier. No schema count,
  portfolio win, or bounded elimination result is reported as Problem 97
  closure.
- Portfolio promotion requires a held-out end-to-end improvement in
  assignments eliminated per certificate cost or models/hour, with no
  terminal-status disagreement, trust-boundary weakening, or unacceptable
  replay/RSS regression.

## 7. CEGAR and MARCO skill updates

Ownership note: S1-S7 are excluded from this runtime implementation because a
separate agent has already handled the skill update at the user's direction.
This plan retains the requirements as the review contract, but this lane must
not edit, version, reinstall, or claim verification of those skill files.

The installed guidance lives in the math-toolchain SAT-solvers skill:

- `skills/sat-solvers/SKILL.md`; and
- `skills/sat-solvers/references/cegar-and-marco.md`.

It already correctly requires certified cuts, monotone MARCO surfaces,
fail-closed UNKNOWN, four-valued oracle semantics, wave manifests, general
theorem searches, and separate publication gates. Preserve those sections.
Add the following focused supplement in the authoritative plugin source, then
version/reinstall the plugin; do not directly patch the generated cache copy.

### S1. Add a performance-engineering decision tree

Before tuning a solver encoding:

1. instrument serialization, journal I/O, hashing, loader replay,
   certification/minimization, solver, and publication separately;
2. distinguish startup, SAT-iteration, terminal-proof, and restart costs;
3. report end-to-end throughput alongside microbenchmarks; and
4. optimize the measured dominant stage.

Call out cumulative rescans, complete-file reads, whole-bank rewrites, repeated
fixed-universe enumeration, per-iteration solver startup, and discarded proof
tracing as common anti-patterns.

### S2. Add the three compatibility classes

Document Class A byte identity, Class B semantic-equivalent orchestration, and
Class C new semantics. Require a fresh schema/output namespace whenever
ordering, encoding, detector, literal identity, or canonicalization changes.

For precomputed/bitset minimizers, require exact legacy candidate order and
ordered witness replay. A faster truth predicate is not permission to change
the selected certificate.

### S3. Add discovery/publication solver separation

Recommend proof-free discovery solves and a fresh proof-producing terminal
rerun over the exact authenticated final CNF. Persistent incremental solvers
may be used only as disposable discovery oracles unless their proof protocol is
independently integrated. Any discovery/terminal disagreement is UNKNOWN.

Explicitly state that terminal UNSAT of an augmented CNF does not certify the
soundness of its learned cuts; publication must replay cut certificates and
reconstruct the exact clause list.

### S4. Add durable-ledger and authenticated-cache rules

Specify the safe append order: serialize once, durably append/flush/sync,
publish a generation, then advance in-memory state. Require parent-directory
sync where arbitrary-crash durability is claimed.

Rolling hashes, counters, compiled loader caches, suffix indexes, antichain
indexes, and opaque solver state are accelerators only. On resume, validate
them against source length/hash, chain head, schema/configuration, and canonical
ordering; at publication, independently replay authoritative records.

Never silently truncate a torn tail.

### S5. Add deterministic sharding and bank-epoch guidance

Require an authenticated partition tree, exact cover/disjointness verification,
explicit UNKNOWN leaves, shard-local clause simplification proofs, and immutable
bank epochs. Recommend adaptive splitting only after a deterministic pilot
budget; avoid live asynchronous mutation of a trusted bank.

### S6. Strengthen the MARCO performance subsection

Add MARCO-specific optimizations that preserve its soundness contract:

- represent atom sets and the map frontier as stable bitsets;
- memoize exact oracle calls and use monotonic closure carefully:
  known semantic-UNSAT subsets imply semantic-UNSAT supersets; a positive
  satisfiable verdict supports downward closure only when the oracle contract
  explicitly makes that verdict sound and monotone;
- never promote an inference through UNKNOWN, relaxation-UNSAT, or
  SAT-abstraction to a semantic verdict. If SAT-abstraction is used to prune
  an abstraction-only map, label that map and prove its separate monotonicity;
- retain a persistent map solver across iterations;
- cache shrink/grow probes by exact atom mask;
- index known MUSes/MSSes for subset/superset queries; and
- report oracle calls, cache hits, inferred verdicts, shrink/grow calls, map
  iterations, core-size distribution, and time by stage at every wave.

Make clear that these caches must not alter fixed atom order, deterministic
maximal seed selection, minimal-core choice, or emitted discovery order when a
run claims byte identity.

### S7. Correct implementation-status wording

Label `census/card_head` as a fail-closed adapter/protocol example until its
worker is enabled and tested. Do not imply that it currently provides a live
mining harness or commit loop.

Add one complete worked example showing:

1. a certified CEGAR cut;
2. a MARCO semantic-UNSAT core;
3. a relaxation-UNSAT that is recorded but not banked;
4. UNKNOWN stopping without a map clause;
5. restart from an authenticated journal/checkpoint; and
6. discovery UNSAT followed by fresh terminal proof production.

Skill-update acceptance:

- every referenced path exists in the released plugin or is clearly labelled
  project-specific;
- examples exercise all terminal statuses and do not turn solver evidence into
  theorem claims;
- the SAT-solvers entrypoint links the new performance/restart subsection;
- CEGAR and MARCO rules remain general rather than P97-specific; and
- plugin version/cachebuster and reinstall checks confirm users receive the
  updated source rather than a stale cache.

## 8. Rollout sequence

Use small independently reviewable changes:

1. **PR A — P0:** benchmark harness, timing schema, fixed corpus manifest.
2. **PR B — P1:** shared successor runtime extraction, no behavior change.
3. **PR C — P2:** streaming loader, `RunLedger`, durable generations.
4. **PR D — P3:** cap/order bitsets and reusable classification context.
5. **PR E — P4:** proof-free discovery and fresh terminal proof rerun.
6. **PR F — P5:** authenticated compiled loader cache and antichain indexes.
7. **PR G — P6:** shard-local simplification, then adaptive cubing.
8. **PR H — P7:** experimental persistent CaDiCaL backend (contract complete;
   hard-shard throughput canary pending).
9. **PR I — P8:** separately versioned encoding/symmetry experiments, only if
   P0–P7 leave solver propagation as a material bottleneck.
10. **PR J — P10A:** authenticated productivity telemetry and read-only
    proof-core/schema mining after P2/P3 interfaces are stable.
11. **PR K — P10B:** deterministic detector portfolio and invariant-like lemma
    producer after P5/P6 epochs and indexes are available.
12. **External plugin lane:** S1–S7 are owned separately and are not part of
    these runtime changes. Reconcile released guidance after P0/P2/P4 provide
    one real implementation, without editing skill files from this lane.

Each runtime PR follows the same promotion ladder:

1. deterministic mocked A/B;
2. differential fixture corpus;
3. tamper and crash-point injection;
4. replay of a frozen production checkpoint;
5. bounded fresh-namespace canary; and
6. production opt-in, with the old backend retained for rollback.

Do not migrate, rewrite, or resume an old namespace under new code. Preserve
failed canary namespaces and publish the reason for rollback.

## 9. Exact next implementation target

P4 is complete and the P5 initial cache/index tranche is implemented in the
projected-static-v3 successor.  P6a fixed-shard local simplification, the P6b
authenticated adaptive-plan contract, P6c epoch-bound wave consumption, and
the P7 persistent incremental CaDiCaL discovery contract are implemented and
verified as opt-in successor infrastructure.  The exact current target is the
P7 hard-shard A/B throughput canary, kept outside the terminal proof trust
boundary; its three-family run is in progress.  Full first-principles replay
remains the authority at every terminal and explicit audit boundary.

The bounded P0/P1 promotion gate and first P2 Class-A learned-stream seam are
complete at the current effect boundary:

- `python -m census.p97_search.benchmarks.phase3_cegar_benchmark` exposes
  `loader` and `mock-transcript` commands;
- both retained reports contain three spawned-process/new-copy and five
  same-process/same-copy repetitions, with operating-system caches explicitly
  uncontrolled;
- the transcript records aggregate encoding, classifier/minimizer, minimizer,
  CNF, fake solver, journal, manifest/hash, and terminal stages; its chosen
  assignment does not invoke the standalone `_combined_detection` wrapper, so
  that stage is honestly listed as unobserved;
- complete relative directory trees are byte-identical across the frozen-inline
  and extracted-runtime effect tests, with no provenance allowlist; and
- the unavailable historical pre-extraction-v3 snapshot is recorded as a
  provenance limitation rather than reconstructed or claimed;
- the learned stream is parsed incrementally without `Path.read_bytes`, and
  the shadow ledger/recount gate runs before every mocked manifest write;
- the P2 transcript's three fresh trees are identical, and loader replay leaves
  all eight fresh/warm subjects byte-identical; and
- the frozen v2 source remains unchanged at SHA-256
  `8d09e3fb72522a7e9ed111cab8a33b56afcf739434fe54e79619c00290358e9d`.

The first **P3 Class-A Boolean-coverage slice is complete**:

> Construct the immutable 630-annotation/15,120-order universe and replace only
> the compatible/covered Boolean decision with a bitset predicate, while the
> legacy traversal still chooses and emits every witness and certificate.

Concrete completion criteria for that slice:

- stable IDs and masks cover all 630 annotations and 15,120 annotation/order
  pairs exactly once;
- exhaustive tests prove the bitset compatibility and coverage predicates
  agree with the legacy tuple implementation for every annotation and relevant
  fact/core candidate;
- the old cardinality-then-lexicographic candidate enumeration, descriptor
  order, forward-before-reverse preference, witness construction, learned
  clause, coverage stream, and hashes remain untouched;
- a fixed mocked classification corpus produces byte-identical complete run
  trees with the predicate enabled and disabled; and
- retained timing reports remain diagnostic, but the targeted fixed-corpus
  cap-fact minimizer gate passes at 4.91x and the bounded transcript improves
  from 513.362 ms to 313.673 ms median;
- the final P3-only targeted suite reports 44 passing tests; and
- the retained report is
  `phase3-p3-class-a-order-bitset-benchmark-20260802.md`.

The P2 Class-B durability core and opt-in fast-manifest tranche are now
implemented in successor v3:

> Extend ledger accounting to survivor, log, and cube streams; introduce an
> authenticated manifest-generation transaction with parent-directory
> durability and crash-point tests.

The opt-in fast path caches immutable inputs and replaces only RUNNING
publication rescans with a prospective ledger transaction. Full replay remains
the acceptance oracle at startup, resume, checkpoint/status transitions,
terminal/failure publication, cube-batch audit boundaries, and clean shutdown
where a final status is published. The 40k accounting benchmark and fault
matrix gates now pass. The expanded diagnostic
`phase3-cegar-runtime-ab-multipub-20260802-final/report.json` used four
distinct source records, three fresh workers, and one warm replay. It reports
semantic and non-manifest artifact equality, RSS ratio `1.0259x`, wall-p95
ratio `1.1238x`, and median wall ratio `0.9953x`; the single fast outlier is
why the provisional `1.10x` p95 gate still fails. The report hash is
`6c838099f9eafc7fe597a02f40e5a3c3be76deaafe00183f3b2fbf70a0c9a4d5`.
Fresh stage timing does not show a sustained manifest/hash regression, so the
production canary remains closed.

The reusable `ClassificationContext` and row-mask closure tranche is now
implemented selectively in the successor. Its exact differential report
records 2.096x cap-order speedup, 248.683x repeated closure-graph speedup,
2.756x rhombus speedup, 1.182x shared-pair speedup, 26.896x Kalmanson
cap-minimization speedup, and 1.218x complete Kalmanson-certificate speedup.
The lazy Kalmanson query is exact and promoted; the eager full-universe mask
remains diagnostic after measuring 0.697x on the fixed first-model diagnostic.
Because the general cap-order result is below the provisional 3x context-only
gate, this remains a selective acceleration layer rather than a fully
promoted performance claim. There is no remaining P3 implementation target.

P4's discovery/terminal proof boundary is now implemented in successor v3:
discovery calls never request DRAT output; only a fresh rerun on the exact
published `terminal.cnf` may produce the proof consumed by the existing
`drat-trim` checker. The protocol is fail-closed on terminal-CNF drift,
proof-rerun SAT/UNKNOWN/exception, missing or empty proof, and checker
disagreement. Cube-local UNSAT remains explicitly non-terminal. The focused
P4 matrix and the complete runtime/successor suite report 53 passing tests;
the detailed contract and negative controls are in
`phase3-p4-discovery-terminal-proof-benchmark-20260802.md`.

The first P6 fixed-shard tranche is now implemented in successor v3.  The
opt-in `--shard-local-simplification` path simplifies the authenticated
encoding-plus-shard source under the fixed shard assignment, retains shard
units explicitly, and records source/residual/transform hashes, counts, and
replay metadata in solver logs and manifests.  The focused P6 file reports
four pure tests plus the slow driver/resume canary; together with the
successor regression suite the final focused run reports 41 passing tests.
The exact fixed cube partition test confirms the existing deterministic
partition remains exhaustive.  This establishes an exact optimization
contract, not a speedup claim, and does not change cube-batch mode.

Adaptive cubing is deliberately not performance-promoted in this tranche.  The
P6b authenticated parent/leaf decision-tree schema and P6c wave consumer now
provide pilot-budget outcomes, UNKNOWN/interruption replay rules, atomic
crash/resume checkpoints, stale bank-epoch rejection, and independent
exact-cover verification.  The fixed cube-batch artifacts and `run_driver`
path remain the compatibility baseline; any adaptive throughput canary still
requires a separate measured profile and replay gate.

Retain the fast-manifest path as an opt-in diagnostic while P5's authenticated
cache identities consume this durability substrate. P7's discovery contract
is complete, but its hard-shard throughput promotion remains gated by measured
profiles; P8 remains gated on those profiles and fresh encoding/proof schemas.
P10 is a downstream learning plane: its telemetry may be added
earlier, but schema promotion and portfolio scheduling wait for the
durability, replay, and epoch contracts above.

## 10. Documentation and publication updates

When the relevant implementation lands:

- update `census/p97_search/PHASE3-SPEC.md` with the new schema, generation,
  cache, discovery/terminal, and partition contracts;
- add benchmark reports under `scratch/p97-distinct-distance-lane/`, including
  exact commands, hashes, repetition counts, and negative controls;
- record the coordinator-interface frontier before and after the runtime
  extraction;
- record every route or bank-epoch change in the shared project conversation;
- publish P10 productivity/schema reports with bounded-universe definitions,
  certificate lineage, held-out comparisons, and explicit `PARKED-SPEC` or
  consumer status; and
- keep performance status separate from mathematical closure status.

No claim should say “optimized,” “resume-safe,” “complete,” or “closed” unless
the corresponding benchmark, crash model, finite replay, and Lean/trust gate
above has actually passed.
