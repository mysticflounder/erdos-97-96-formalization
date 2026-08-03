# P97 counterexample search -- Phase 3 specification

Version 0.2, 2026-08-01.  This is the soundness contract for SAT-backed
per-cell generation over the Phase-1/2 census core.  It implements the
Phase-3 item in `scratch/p97-search-lane/HANDOFF-2026-07-28.md`.

Revision 0.2 records the pinned-multiplicity boundary. It changes no
existing CNF clause: selected support remains distinct from a complete
physical distance class.

The immediate deliverable is a fail-closed SAT generator with gate-scale
enumeration and a combined cap+blocker iterator mode.  A production
`n >= 9` coverage claim is explicitly out of scope until the gates below
pass and a bounded run actually reaches a DRAT-checked terminal UNSAT.

## 1. Claims and trust boundary

There are three distinct outcomes.

- `PARTIAL`: at least one decoded model was processed, but the model limit or
  an external interruption occurred before terminal UNSAT.  This is candidate
  generation only.  A solver timeout or solver `UNKNOWN` remains `UNKNOWN`,
  even after earlier valid models, because it is not a controlled enumeration
  boundary.
- `COMPLETE`: every raw labelled semantic assignment satisfying the emitted
  CNF was decoded and processed, and the final CNF obtained by adding one
  exact semantic blocking clause per decoded assignment was UNSAT with a
  `drat-trim`-verified proof.  Completeness is relative to the exact cell CNF
  and its audited clauses.
- `UNKNOWN`: the solver returned neither SAT nor DRAT-verified UNSAT, a model
  failed decoding/revalidation, or an artifact was missing or inconsistent.
  No non-existence claim may be published.

Canonical banking is deduplication only.  It is not the enumeration proof.
The first implementation blocks raw semantic assignments, not canonical
orbits.  Orbit blocking is forbidden until a separate proof and independent
tiny-scale partition gate show that every blocked assignment is related by
an automorphism preserving the full combined annotation.

SAT models are structural candidates, not geometric realizations.  A numeric
realization failure never prunes a model.  A counterexample claim requires
exact coordinates and independent exact checks of distinctness, strict convex
position, and the K_k equal-distance property.

## 2. Cell scope

The SAT generator accepts `Cell(k, n, profile, exact=True)` only.

- FRAMELESS cells encode exact shell systems and R-CIRC2.
- Profiled cells require the existing `Cell` conditions `k = 4`, `n > 9`,
  and a valid closed-cap profile.  They encode a cap annotation.
- A profiled Phase-3 search intended for Theorem C range coverage also
  encodes a total B1 blocker annotation.  This requires the combined
  cap+blocker mode in sections 3 and 4.

Exact-k is a reduction at the shell level: from a class of size at least k
one may select k witnesses.  It is not a license to shrink an already chosen
blocker annotation arbitrarily, since B1 can be destroyed by shrinking.
Theorem C instead supplies the exact-four witness system and its B1 annotation
in the minimal-counterexample argument.  Accordingly:

- a FRAMELESS exact cell is complete only for exact shell systems;
- a blocker-annotated exact cell is complete only for B1-annotatable exact
  shell systems;
- unconditional finite-range closure is obtained only by composing complete
  coverage with Theorem C.  Per-cell claims remain annotation-conditional.

Cap annotations are a complete frame for convex K4 configurations at `n > 9`
by the already audited frame theorem.  The annotation data by itself does not
encode convex geometry or any relationship between caps and shells beyond
the clauses of an explicitly admitted rule.

### Pinned-multiplicity scope

The kernel-checked pinned-multiplicity equivalence supplies the generic
K4 consequence `4 ≤ pinnedMultiplicity A p` for each center. In this
encoding that consequence is exactly the selected four-witness support in
`(S-EXACT)`. It must not be strengthened to physical-shell exactness: the
remaining points at the same radius are not represented, and
`MetricRow.exact = false` remains intentional in the realization layer.

The current generic profile is restricted to the already justified
`k = 4, n > 9` range; the `n = 10` `counterexample_card_ge_ten`/
`S-MINCUT` scope is the only pinned-multiplicity-side cardinality reduction
admitted here. No clause may forbid a fifth or sixth co-radial point or
encode `NoQFreeAfterDeletion` without a new producer and a revised contract.

The MEC-boundary, `iCount`, and ATAIL blocker-fiber consequences are
consumer-specific and are not generic cell clauses. A future
pinned-multiplicity schema may add full radius partitions, named cap/deletion
roles, and off-support disequalities only after it separately specifies and
passes producer, decoding, replay/blocking, and tiny-cell acceptance gates.
The projected-static-v3 name does not waive this requirement; that
implementation still uses selected supports and `MetricRow.exact = false`.

In particular, the ATAIL disjunction
`CollisionCrossHit P Pρ ∨ GeometricMultiplicityResidual P Pρ` must remain in
named `CriticalShellSystem` packets with its row, vertex, blocker/cap, and
omission provenance. It is not a generic learned clause. A source-clean
coordinator is not closure, and generic Phase 3 must not infer its negative
membership or named-source finite-completeness consequences.

## 3. Combined annotations and exact canonicalization

`AnnotatedNode(node, blocker, caps)` with both fields non-`None` is the
`"cap+blocker-annotated"` mode.

The current Phase-2 canonicalizer is sufficient when at most one annotation
is present, but not for the combined mode: minimizing the blocker and cap
parts under different node automorphisms forgets their relative alignment.
Before the iterator accepts combined objects, `canonical_annotated` must take
one joint minimum:

1. compute the canonical node form and all node labelings `sigma` attaining
   it (`canonical_perms`);
2. for each single `sigma`, transport the blocker map;
3. for that same `sigma`, transport the cap annotation under every cap-index
   permutation `tau in S3`;
4. minimize the pair `(transported_blocker, transported_cap)` jointly.

When either annotation is absent, this definition must reproduce the existing
single-annotation canonical form.

The iterator must:

- classify the new mode explicitly;
- require a cap-bearing mode for a profiled cell and reject every cap-bearing
  mode from a FRAMELESS cell;
- apply annotated-node rules whenever a blocker is present;
- add `"blocker-annotated"` to published hypotheses whenever a blocker is
  present;
- use the joint canonical form for banking;
- reject a generator that mixes object modes within one cell run.

No rule admission changes in Phase 3.

## 4. Semantic SAT variables

For labels `p,q,d in {0,...,n-1}`:

- `s[p,q]`: `q in S[p]`.  Allocate only for `p != q`; the diagonal is
  definitionally false.
- `b[x,d]` in blocker mode: `c(x) = d`.  Allocate only for `x != d`.
- `f[x,i]` in cap mode, for non-Moser `x` and `i in {0,1,2}`:
  `f(x) = i`.
- profile-selector variables may be used to assign the sorted profile's
  three strict sizes to cap indices.  They are auxiliary, not semantic.

For cap mode the first implementation fixes `M = {0,1,2}`.  This is a
sound labelled symmetry choice: every three-element Moser set can be sent to
that set by a label permutation.  It does not fix the cap-index order.
For a closed profile `(h0,h1,h2)`, the strict cap sizes are
`(h0-2,h1-2,h2-2)` as a multiset.  The encoding must allow every distinct
permutation of those three values across cap indices.

The semantic assignment used by model blocking consists of all `s`, all `b`
when present, and all `f` when present.  Auxiliary counter and selector
variables are omitted from blocking clauses.

## 5. Hard clauses

Every emitted clause block carries one of these tags in code and in the
manifest.

- `(S-D1)`: no diagonal `s[p,p]` variable exists.
- `(S-EXACT)`: for every p, exactly k of `s[p,q]`, `q != p`, are true.
- `(S-CIRC2)`: for every distinct centers `p < q` and every three-element
  label set `{a,b,c}`, forbid all six memberships
  `s[p,a],s[p,b],s[p,c],s[q,a],s[q,b],s[q,c]`.  Terms equal to a center
  are definitionally false and may make the clause tautological; emit only
  nontrivial instances.  This is exactly R-CIRC2.
- `(B-TOTAL)`: for every x, exactly one `b[x,d]`, `d != x`, is true.
- `(B-MEM)`: `b[x,d] -> s[d,x]`.  This is exactly B1.
- `(CAP-TOTAL)`: for every `x notin M`, exactly one `f[x,i]` is true.
- `(CAP-PROFILE)`: the three strict fiber sizes form the multiset
  `(h0-2,h1-2,h2-2)`.

R-FIBER4 emits no additional hard clause: it is derived from `(B-MEM)` and
exact shells, and remains a defensive decoded-model check.

R-CAPGE4 emits no model clause after `Cell` validation; a profiled cell whose
profile contains a part below four is pruned at the cell/rule layer, not
silently strengthened by the SAT encoder.

R-P1, R-P2, R-P3, and R-P4 are cut-matrix-domain rules.  There is currently
no certified producer mapping a shell assignment or cap partition to the
same-distance C2-read matrix required by those rules.  Phase 3 must not emit
their forbidden-pattern clauses.  Adding them requires a new spec revision
that states and gates that producer's semantics contract.

No convexity, distance transitivity, exact-five, minimality, no-M44, or
finite-universe clause may be inferred merely from the node data.

## 6. Solver loop and artifacts

Use CaDiCaL with a finite timeout for each call.

For each SAT result:

1. decode semantic variables;
2. construct `Node`, `BlockerAnnotation`, `CapAnnotation`, and
   `AnnotatedNode` through their validating constructors;
3. independently verify exact row sizes, R-CIRC2, cell/profile match, B1,
   and the expected semantic truth value of every blocking literal;
4. feed the object through `iterate_cell` and its canonical bank;
5. append one raw-model JSONL record;
6. add the clause negating that complete semantic assignment.

If any validation fails, stop with `UNKNOWN`.  Never skip the model.

If the configured model limit is reached after a valid model, stop
`PARTIAL`.  If CaDiCaL times out or reports unknown, stop `UNKNOWN`.  If it
reports UNSAT, save the DRAT proof, verify it with `drat-trim` against the
final CNF, and publish `COMPLETE` only on checker success.

Each run directory contains:

- `manifest.json`: cell, mode, clause tags/counts, semantic variable count,
  total variable/clause counts, solver/checker versions, timeout, model
  limit, rule-bank hash, status, raw/canonical counts, and artifact hashes;
- `base.cnf`;
- `models.jsonl`;
- `bank.jsonl`;
- `terminal.cnf` and `terminal.drat` only when terminal UNSAT is attempted;
- `terminal.drat.check` or an equivalent bounded checker log.

Artifacts are written atomically.  A resumed run must verify the manifest,
CNF hash, and every prior model/blocking clause before continuing.

The successor projected-static-v3 runtime may maintain an in-memory
prospective manifest state, but this is an explicitly gated publication mode,
not a change to the mathematical acceptance boundary.  Enabling
`manifest_fast_path` requires a positive `manifest_audit_every` value.  The
runtime performs a complete recount at startup/resume, checkpoint, terminal,
failure, and clean-shutdown boundaries, and at every configured number of
RUNNING publications.  Before each hot projection it checks the prospective
state against the authenticated stream ledgers; disagreement is fail-closed
to `UNKNOWN` and a full recount.

### Projected-static-v3 discovery and terminal proof protocol

The projected-static-v3 successor separates proof-free discovery from terminal
proof production. Sequential and cube-local discovery solver calls receive no
DRAT destination. A cube-local UNSAT is a scheduling result only and is not a
terminal claim.

For a sequential discovery UNSAT, the coordinator freezes the exact terminal
CNF, writes `terminal.cnf`, rereads it and rejects any byte drift, then runs a
fresh proof-producing solver on that exact path. The rerun must return UNSAT
and produce a nonempty `terminal.drat`; only then does the existing
`drat-trim` checker run. A proof-rerun SAT/UNKNOWN/exception, missing/empty
DRAT, terminal CNF drift, or checker disagreement publishes `UNKNOWN` and an
authenticated failure record. This successor contract does not alter the
frozen v2 driver or the mathematical meaning of `COMPLETE`.

Manifest generations are published in this order: durable generation file,
directory sync, atomic pointer replacement, directory sync.  A failure before
pointer replacement leaves the prior pointer selected.  A failure after
pointer replacement is treated as an indeterminate publication by the caller;
restart accepts only a pointer whose generation and bytes pass the normal
manifest-generation validation.  The 40k accounting benchmark and filesystem
fault matrix are diagnostic gates only; neither is a solver, DRAT, exhaustion,
or Lean-closure result.  The benchmark harness also provides a bounded
`runtime-ab` command that runs the same fake SAT/UNSAT transcript through full
and prospective-manifest modes in fresh worker processes, checks
semantic-manifest and non-manifest artifact identity, and records end-to-end
wall p95 and peak RSS.  Its 2026-08-02 measurement preserved
semantic/artifact identity and RSS (fast/full `0.9887x`) but measured wall p95
at `1.2499x`, above the provisional `1.10x` limit.  This leaves the fast path
opt-in and blocks a production canary; the result remains diagnostic and does
not authorize a solver or proof claim.

An expanded diagnostic at
`scratch/p97-distinct-distance-lane/phase3-cegar-runtime-ab-multipub-20260802-final/report.json`
used four distinct SAT records (`0,8,11,18`), three fresh workers, one warm
replay, and manifest audit cadence two.  It again preserved semantic and
non-manifest artifact identity, with RSS ratio `1.0259x`; wall p95 was
`1.1238x` while the median was `0.9953x`.  Fresh stage timing showed no
sustained manifest/hash regression; the failed p95 gate is attributable to a
single fresh-process outlier in this bounded sample.  The fast path therefore
remains opt-in and the production canary remains closed.  This is diagnostic
runtime evidence only, not a solver, DRAT, finite-exhaustion, or Lean-closure
claim.

### Projected-static-v3 fixed-shard local simplification

The successor's `--shard-local-simplification` flag is an opt-in optimization
for a top-level fixed shard in sequential mode.  Let `F` be the authenticated
source clause sequence for the current iteration and let `C` be the fixed
shard's unit-literal assignment.  The simplifier emits a residual CNF `R`
such that `F ∧ C` and `R` have the same satisfying assignments: clauses
satisfied by `C` are dropped, literals falsified by `C` are removed,
tautologies and duplicate residuals are removed, and strict supersets are
subsumed deterministically.  The literals in `C` are retained explicitly as
unit clauses in `R`, so the downstream plain-DIMACS solver does not rely on
an unrecorded assumption interface.  An empty residual clause is retained
and reported explicitly.

Each base snapshot and solver attempt records the source and residual clause
counts and hashes, the retained-source-index hash, the transform hash, and
the simplification counters under schema
`p97-phase3-shard-local-simplification-v1`.  The manifest authenticates these
attempt records and the terminal artifact hash.  The source clause sequence
and transform metadata remain replay authorities; this optimization supplies
no new mathematical cuts and cannot promote an unchecked solver verdict.

The terminal proof boundary is unchanged: a discovery UNSAT freezes the exact
residual `terminal.cnf`, then a fresh proof-producing solver and the existing
checker validate that exact file.  The current cube-batch path does not accept
this option.  Fixed cube partitioning remains deterministic and exhaustive;
adaptive pilot splitting is implemented only as a separate authenticated plan
contract.  The fixed `run_driver` cube-batch path remains unchanged until a
later wave wires that contract into an epoch-bound scheduler.

### P6b authenticated adaptive cube plans

`census/p97_search/phase3_adaptive_cubing.py` defines the successor-only P6b
plan boundary.  It binds a deterministic false-before-true prefix tree to one
authenticated immutable bank epoch and a bounded pilot budget.  SAT and UNSAT
pilot outcomes retain a leaf as discovery work; UNKNOWN, interruption,
exception, budget exhaustion, and a reached pilot cap are recorded explicitly
and either split canonically or become an explicit unresolved leaf at the
maximum depth.  No result is inferred for an absent node.

`verify_plan` independently checks the plan hash, semantic-variable/literal
identity, parent/child links, pilot budget accounting, bank-epoch hash, and
the expansion of variable-length leaves to the complete root assignment set.
Thus leaf pairwise disjointness and exact parent coverage are replayed from
the published artifact rather than assumed from the scheduler.  `write_plan`
publishes the authenticated JSON atomically.  Pilot SAT/UNSAT is discovery
evidence only; terminal acceptance still requires a fresh exact-CNF proof
rerun and the existing checker.  `build_adaptive_cube_plan` is the thin live
encoding adapter, but `run_driver` does not consume adaptive plans yet.

### P6c epoch-bound adaptive wave consumption

The successor-only `run_plan_wave` consumer now consumes one published P6b
plan in its authenticated canonical leaf order.  `write_wave_state`,
`load_wave_state`, and `verify_wave_state` define the durable wave-state
boundary under `p97-phase3-adaptive-cube-wave-v1`; the live encoding adapter
is `run_adaptive_cube_wave` in projected-static-v3.

The consumer writes an authenticated RUNNING checkpoint before the first
leaf and atomically checkpoints after every completed leaf.  Each state is
bound to both the plan hash and the exact immutable bank-epoch hash.  A stale
plan or bank epoch is rejected before leaf consumption.  A bounded
`max_leaves` call records BUDGET and resumes from `next_leaf_index`; an
ordinary runner exception is recorded as an explicit EXCEPTION result and
leaves the completed wave UNKNOWN.  A process crash before the post-leaf
checkpoint leaves the prior checkpoint authoritative, so resume reruns only
the uncommitted leaf.  Terminal statuses are COMPLETE only when all leaves
are explicit EASY SAT/UNSAT outcomes; UNKNOWN, interruption, and exception
outcomes remain unresolved discovery evidence.

This is a scheduling and durability contract, not a solver or proof claim.
`run_driver` and its fixed cube-batch path remain unchanged.  The successor
test suite differentially checks that the wave's canonical leaf literals and
order agree with the existing fixed partition when adaptive execution is
disabled.  Fresh exact-CNF terminal replay and the existing DRAT checker
remain the only terminal proof authority.

### P7 persistent incremental discovery oracle

The successor-only `--persistent-discovery` option retains one incremental
IPASIR solver across monotone sequential discovery iterations.  The first
call loads the complete DIMACS clause stream; later calls must have the same
variable count and an identical prior clause prefix, and only the appended
suffix is added to the live solver.  Non-append-only changes fail closed.
The option is currently restricted to sequential, unsimplified discovery so
that the authenticated source CNF remains the append-only authority.

The live solver is disposable state.  Resume or restart creates a new adapter
and rebuilds from the complete authenticated CNF and journals; no opaque
solver snapshot is accepted.  Discovery calls are proof-free.  A proof call
never uses the incremental object: it delegates to the existing fresh
proof-producing solver, and the exact terminal CNF still must pass the normal
DRAT checker before any verified terminal status is published.

The optional native backend is loaded only from the explicit
`P97_CADICAL_IPASIR_LIB` path and records its IPASIR signature, library hash,
solve/rebuild counts, clause-frontier hash, and trust-boundary policies in the
manifest.  The adapter and restart/proof-boundary tests are contract evidence
only; no P97 closure or throughput-promotion claim follows until a
production-shaped hard-shard canary meets the P7 benchmark gate.

## 7. Mandatory gates

All Phase-1 and Phase-2 controls remain mandatory after any edit under
`census/p97_search/`.

- `G-P1-REGRESS`, `G-P2-REGRESS`: both existing control scripts pass.
- `G-CANON-JOINT-INVAR`: random combined annotations agree under random
  label permutations; include a node with nontrivial automorphisms.
- `G-CANON-JOINT-EXACT`: at tiny scale, joint canonical equality agrees
  with independent brute-force combined-annotation isomorphism.  This
  prevents over-merging that invariance alone cannot detect.
- `G-ITER-COMBINED`: a satisfiable `n=10,k=4,profile=(4,4,5)` combined
  annotation is admitted, banks OPEN, and publishes both frame hypotheses
  and `"blocker-annotated"`.  Use cyclic shells
  `S[p] = p + {1,2,3,5} mod 10`, a valid cyclic blocker choice, and strict
  cap fibers of sizes `(2,2,3)`.
- `G-SAT-K3-SEED`: constrain the SAT encoding to S-K3-9's exact shell
  assignment; CaDiCaL returns SAT and decoding reproduces that node.
- `G-SAT-COMBINED`: constrain the combined encoding to the preceding
  n=10 fixture; SAT and decoding reproduce all three semantic components.
- `G-SAT-CARD-UNSAT`: force k+1 members in one exact-k row; UNSAT and
  DRAT verified.
- `G-SAT-CIRC2-UNSAT`: force a three-point intersection for two centers;
  UNSAT and DRAT verified.
- `G-SAT-B1-UNSAT`: force `b[x,d]` and `not s[d,x]`; UNSAT and DRAT
  verified.
- `G-SAT-PROFILE-UNSAT`: force a cap fiber size outside every permutation
  of the requested profile; UNSAT and DRAT verified.
- `G-SAT-TINY-COMPLETE`: enumerate an independently brute-forceable exact
  FRAMELESS cell, compare the full raw semantic assignment set in both
  directions, then DRAT-verify the terminal UNSAT.
- `G-FAIL-CLOSED`: injected solver unknown, malformed model, missing DRAT,
  and failed `drat-trim` each produce `UNKNOWN`, never `COMPLETE`.
- `G-RESUME-TAMPER`: resume a verified `PARTIAL` tiny run to `COMPLETE`,
  then confirm that altered base-CNF and model artifacts are rejected.
- `G-ATOMIC-INTERRUPT`: interrupt only after a valid decoded model and verify
  that the atomically published `PARTIAL` artifacts can be revalidated.

Known satisfiable fixtures are mandatory before trusting an UNSAT result.
Every UNSAT gate is proof-checked, not accepted from solver exit status.

## 8. First production sequence

After every gate passes:

1. run S-K3-9 as a constrained end-to-end positive control;
2. run a small unconstrained FRAMELESS exact cell to exercise model
   enumeration and terminal certification;
3. run bounded, explicitly `PARTIAL` exploratory enumeration at
   `(k,n)=(3,9)` and at the first k=4 cell;
4. only then schedule complete profiled+blocker cells for `k=4,n>9`.

The `n=9,k=4` case is FRAMELESS and belongs to the separate D9 theorem lane;
Phase 3 does not duplicate that formalization.  The first profiled K4 size is
`n=10`, whose only profile is `(4,4,5)`.

The realization arm consumes OPEN model records.  Its initial interface is
JSONL input plus result values `EXACT_REALIZED`, `PROVED_INFEASIBLE`, or
`UNRESOLVED`.  Only the first two may change bank status, and each requires
an independently checkable certificate.  Numeric probes attach diagnostics
while leaving status OPEN.

## 9. Acceptance criterion for a finite range

A claimed range `[10,N]` is computationally covered only if, for every
`n` in the range and every `profile in profiles_for(n,4)`:

1. the combined cell run is `COMPLETE`;
2. every terminal UNSAT proof checks;
3. every decoded model was passed through the current admitted rule bank;
4. every OPEN canonical survivor has either a proved infeasibility
   certificate or remains explicitly OPEN;
5. the frame theorem and Theorem C composition used for the final claim are
   kernel-checked at the consumer.

Thus complete enumeration alone is not non-existence when OPEN survivors
remain.  It is a complete survivor census.  Exact realization of any survivor
is instead a counterexample candidate and takes priority for direct checking.
