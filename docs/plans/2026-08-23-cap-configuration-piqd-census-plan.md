<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# PIQD cap-configuration census implementation plan

Date: 2026-08-23

Updated: 2026-08-23

Status: proposed implementation plan; no census, geometric exhaustiveness, proof,
or Lean-promotion claim.

## Decision

Implement the first cap-configuration census as a P97-owned, proof-directed
campaign over PIQD's existing authenticated SMT-session boundary. Keep the
finite universe, symmetry reduction, geometric semantics, exact SAT replay,
coverage accounting, CEGAR policy, and Lean ingress in this repository. Use
PIQD for solver execution, solver identity, session persistence, receipts,
exports, and artifact custody.

Phases 0--3 require no PIQD daemon change. Do not add a generic raw-SMT upload
route, and do not move the evolving P97 geometry semantics into
`piqd-encoder`. Reconsider a typed PIQD encoder only after the cell schema and
finite-universe contract have survived a bounded live campaign without semantic
revision.

## Outcome

The first complete implementation checkpoint should provide:

1. a deterministic, symmetry-reduced finite cell universe for one explicitly
   selected theorem-backed P97 target;
2. canonical named QF_NRA atoms and byte-stable SMT journals for every cell;
3. authenticated one-cell PIQD executions through cvc5 or Z3;
4. exact rational replay for every **accepted** SAT result, while retaining raw
   SAT results with rejected replay as inconclusive outcomes;
5. append-only attempt histories, crash-safe resume, and a fail-closed coverage
   manifest over the declared universe;
6. the existing shared-adapter classifications, including
   `SAT_SEMANTICALLY_REPLAYED`, `UNSAT_DISCOVERY_ONLY`, and the distinct
   `INCONCLUSIVE_*` outcomes, plus explicit pre-adapter infrastructure failures;
7. a CEGAR and obstruction-mining path that never learns from an unvalidated
   model; and
8. a separate promotion gate requiring a proved finite reduction, proved
   symmetry reduction, source-semantic bindings, and checked certificates or
   Lean proofs at the named final consumer.

The diagnostic implementation is complete when items 1--7 pass their gates.
Item 8 is a separate proof-promotion milestone and is not implied by a complete
diagnostic result table.

## Scope

This plan covers finite classification of **combinatorial and semialgebraic
cells**, not enumeration of coordinate tuples. A cell records a bounded tuple
such as

```text
(target, n, cap profile, incidence pattern, cyclic order,
 symmetry representative, metric atom choices, polarity)
```

and asks whether the associated exact polynomial equalities and inequalities
have a real realization.

The first implementation is deliberately target-parametric. Before a live
mathematical campaign, Gate T0 below must name the source theorem, finite
ingress, immediate Lean consumer, final published consumer, and the frontier
measure that the campaign is intended to reduce. This plan does not silently
select `n = 10`, `n = 15`, `n = 17`, ATAIL, FreshThird, or Exact17 as the live
target.

### Non-goals

- Enumerating the continuum of coordinate realizations.
- Enumerating every planar order type at `n = 15` or `n = 17`.
- Treating the existing token census as a metric-feasibility census.
- Treating a PIQD receipt as geometric source validation.
- Treating cvc5 or Z3 `UNSAT` as a Lean proof.
- Treating a complete finite abstraction as a proof of the ambient theorem
  without a checked reduction into that abstraction.
- Adding a new daemon backend before the project-side contract exposes a
  concrete missing PIQD capability.
- Launching a bulk sweep before the bounded tractability gates pass.

## Current baseline

### Incidence census

The existing escape census is exhaustive only for its stated token model. It
does not decide metric feasibility or Euclidean realizability. The generated
tables extend through `n = 729`; this is useful structural input, not the target
metric census. See:

- [`docs/census/n10-escape-census.md`](../census/n10-escape-census.md);
- [`docs/census/n9-n729-incidence-table.md`](../census/n9-n729-incidence-table.md);
- [`docs/census/incidence-census-lemma-leads.md`](../census/incidence-census-lemma-leads.md); and
- [`docs/census/incidence-deduplication.md`](../census/incidence-deduplication.md).

At the token layer, `namedWLOG` is already `10,615` at `n = 15` and `48,035`
at `n = 17`. These counts do not include cyclic-order, exact-distance, or
realizability refinements.

### Existing geometric surface

The ATAIL producer is the closest current full-inequality prototype. For its
recorded surface it has:

- `167,782` selected-four decorations;
- `30,997` decorated cases after simultaneous `S3` reduction;
- `343` raw equality skeletons and `70` `S3` skeleton orbits; and
- for `m = 6`, `19` variables, `14` equations, `9` weak inequalities, and
  `106` strict inequalities per full-order case.

Its seven-case, 30-second full-inequality pilot returned seven timeouts and no
classification. This is a tractability warning: a census must apply structural
filters before bulk QF_NRA solving. See
[`census/atail_force/formulation.md`](../../census/atail_force/formulation.md).

### Existing PIQD boundary

The current project already has the required diagnostic execution seam:

- `census/p97_search/phase3_piqd_smt_source_adapter.py` authenticates source
  snapshots, session journals, receipts, exports, transport-loss reconciliation,
  and a caller-supplied semantic verifier;
- `census/atail_force/piqd_cvc5_adapter.py` supplies canonical sparse
  polynomial ledgers and exact rational SAT replay for one ATAIL geometry
  system;
- `census/global_confinement/metric_realizability_piqd_core_miner.py` supplies
  guarded deletion/minimization and receipt-bound repeated solves; and
- PIQD already supports persistent Z3/cvc5 sessions and, on a separate route,
  static SMT jobs with configurable concurrent workers; and
- PIQD's existing immutable campaign universe, exact-once branch record, and
  aggregate-receipt API is CNF/branch-oriented. It is a design reference for
  the project-side SMT coverage controller, not a drop-in cap-cell campaign
  API.

The Rust `MetricRealizability` encoder and `piqc sweep metric` command remain a
useful design reference, but their current typed problem is the pinned `n = 9`,
`mec_card = 3` cap-concentration lane. They are not the general P97 cap census
defined here.

### Current trust boundary

PIQD establishes what bytes and journal it ran, under which solver identity and
limits, and what result it retained. P97 remains responsible for:

- the source theorem and finite ingress;
- the complete cell universe and symmetry argument;
- polynomial meaning and variable maps;
- exact model replay against source-level predicates;
- campaign coverage meaning;
- CEGAR cut soundness;
- proof or certificate checking; and
- the final Lean consumer and publication gate.

The existing cvc5 and Z3 routes do not return an independently checked QF_NRA
UNSAT proof. Therefore every metric `UNSAT` remains
`UNSAT_DISCOVERY_ONLY` until another checked path discharges the same source
obligation.

## Claim ledger

| Artifact or event | Permitted claim | Forbidden inference |
| --- | --- | --- |
| Token census row | Exact within the stated token abstraction | Euclidean realizability or impossibility |
| Canonical cell manifest | Exact ordered universe emitted by the recorded generator | Every source geometry maps to a cell |
| Symmetry orbit ledger | Recorded action and representative choice passed the validators | The action preserves every source predicate unless proved |
| PIQD receipt/export | PIQD ran the recorded session journal and retained the recorded response | The journal formalizes the intended P97 theorem |
| Exact rational SAT replay | The recorded rational assignment satisfies every retained polynomial atom | The assignment satisfies omitted source facts |
| cvc5/Z3 UNSAT | Diagnostic solver evidence for the recorded QF_NRA journal | Proof, Lean closure, universal theorem, or source entitlement |
| `INCONCLUSIVE_UNKNOWN` or timeout | The declared attempt was inconclusive | SAT, UNSAT, or permission to omit the cell |
| Complete coverage manifest | Every declared cell has the required terminal record | The declared cells cover the ambient geometry |
| Checked CNF/LRAT branch | The bound Boolean encoding is UNSAT under its checked bridge | Metric UNSAT beyond the encoded Boolean claim |
| Lean ingress and final-consumer audit | Exactly the checked statement reaches the named consumer under the recorded trust profile | Any broader statement or unstated branch coverage |

## Architecture

```text
Lean/source hypotheses and target
            |
            v
P97 finite-ingress + cell-universe generator
            |
            +--> symmetry/orbit ledger
            +--> canonical polynomial atom ledger
            +--> immutable campaign manifest
            |
            v
P97 PIQD adapter -----> PIQD SMT session/job
            |                 |
            |                 +--> solver execution
            |                 +--> journal/export/receipt custody
            |                 +--> persisted model/core/status
            v
P97 independent semantic replay
            |
            +--> SAT_SEMANTICALLY_REPLAYED
            +--> UNSAT_DISCOVERY_ONLY
            +--> INCONCLUSIVE_* / infrastructure failure
            |
            v
coverage ledger + CEGAR/core mining
            |
            +--> next bounded wave
            +--> general-lemma candidate
            +--> checked CNF/LRAT subclaim
            +--> future real-algebraic certificate
            |
            v
Lean ingress gate -> immediate consumer -> named final consumer
```

### Responsibility split

| P97 owns | PIQD owns |
| --- | --- |
| Source theorem and target selection | Exact submitted journal/blob custody |
| Cell generator and universe completeness claim | Solver executable/profile identity |
| Symmetry action and representative justification | Persistent session/job lifecycle |
| QF_NRA atom meaning and variable map | Bounded solver execution |
| SAT semantic replay | Result, log, model/core, export, and receipt storage |
| Retry and CEGAR semantics | Idempotent identities and restart recovery |
| Coverage meaning and theorem lift | Queueing, concurrency, and campaign row custody |
| Lean certificate consumer and publication | External evidence storage without theorem claims |

## Artifact schemas

Strict JSON validators reject unknown keys, duplicate keys, noncanonical
integers, unsafe relative-path spellings, and hash disagreement. Filesystem
custody is a separate runtime layer: it must use descriptor-relative no-follow
opens, regular-file and link-count checks, immutable source snapshots,
descriptor rebinding, create-once staging, atomic publication, directory
`fsync`, locks, and final recapture. A schema alone makes no symlink, hard-link,
or mutation claim. Canonical JSON is UTF-8, sorted-key, compact JSON with one
terminal newline where the surrounding contract requires a file
representation.

### `cap-configuration-census-manifest/v1`

Required fields:

- `schema`, `campaign_id`, and `created_utc`;
- repository source revision and exact generator/validator source manifests;
- target identifier, source theorem, immediate consumer, final consumer, and
  explicit claim flags;
- finite-ingress schema/version and its payload hash;
- raw cell count, canonical cell count, orbit count, and ordered cell IDs;
- symmetry group/action version and orbit-ledger hash;
- solver/backend/profile identities and declared resource limits;
- ordered source, variable-map, atom-ledger, and omitted-fact inventories;
- retry policy and result-classification policy;
- expected per-cell artifact schemas;
- campaign self-hash; and
- all theorem, source-entitlement, universal-lift, and Lean-closure claims set
  false for diagnostic campaigns.

The manifest is immutable after admission. A changed timeout, solver profile,
source revision, generator, atom ledger, or retry policy creates a new campaign
identity.

### `cap-configuration-cell/v1`

Required fields:

- stable cell ID and ordinal;
- target and finite-ingress identity;
- raw representative and canonical representative;
- orbit witness and stabilizer data needed by the validator;
- cap profile, incidence mask, cyclic order, metric choices, and polarity;
- complete variable order;
- canonical named polynomial atoms over `QQ`;
- enabled and omitted atom ledgers;
- source-provenance string for every atom;
- canonical SMT journal hash; and
- cell self-hash.

### `cap-configuration-attempt/v1`

This schema is a tagged union by execution route and result status. Every arm
has these common fields:

- campaign and cell identities;
- monotone attempt index and parent-attempt link;
- solver/backend/profile/version, exact limits, and the external CPU/memory
  supervisor and telemetry identities;
- start/end timestamps and measured wall/resource data;
- raw solver status and project classification;
- transport reconciliation record;
- explicit false claim flags for every unearned promotion claim.

The `execution` arm is exactly one of `not_started`, `smt_session`, or
`static_smt_job`. Each started route carries an append-only artifact map rather
than pretending that every artifact exists on every outcome:

- `smt_session`: session ID and solve index; journal hash after journal
  construction; export hash after export; receipt hash only after a receipt is
  returned or reconciled; close record only when close was attempted, with an
  explicit close status; and durable-session identity when established; or
- `static_smt_job`: job ID; input-blob hash after input materialization; log and
  job-receipt hashes when captured; and model-blob hash only when a model was
  returned, reserved for a future typed static encoder.

An `UNSAT` or `UNKNOWN` route does not require a model blob. Transport loss or
an earlier failure requires only the artifacts captured before the recorded
failure stage. A close artifact is evidence only of the close operation it
records, never a prerequisite retroactively imposed on an otherwise retained
attempt.

The `outcome` arm is exactly one of:

- `sat`: model/value hashes, complete declared-variable readback inventory,
  semantic verifier identity, replay classification, and replay-artifact hash;
- `unsat`: terminal-UNSAT flag, raw assumption-core ledger when present,
  explicit source-named-core binding status, and optional independently checked
  certificate reference;
- `unknown`: raw reason and timeout/deadline record; or
- `failed`: failure stage and retained infrastructure evidence.

A PIQD assumption core is not a source-named polynomial core. The latter claim
requires an exact caller-owned label-to-source binding and independent semantic
replay.

An inconclusive outcome, timeout, failure, or changed limit is never
overwritten. A retry is a new append-only attempt with a new identity.

### `cap-configuration-cell-result/v1`

This immutable projection selects one admitted attempt for the logical cell.
For an adapter-classified result, `adapter_classification` preserves the shared
adapter vocabulary verbatim:

- `SAT_SEMANTICALLY_REPLAYED`;
- `UNSAT_DISCOVERY_ONLY`;
- `INCONCLUSIVE_UNKNOWN`;
- `INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED`;
- `INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE`;
- `INCONCLUSIVE_TRANSPORT_LOSS`; or
- `INCONCLUSIVE_CROSS_SOLVER_DISAGREEMENT`.

`FINITE_DIAGNOSTIC_COMPLETE` may be recorded only at the shared adapter's
cross-solver aggregate boundary. A result that fails before adapter
classification has a separate tagged `failed` record with its failure stage
and a null `adapter_classification`; it is not renamed mathematical `UNKNOWN`.

Certificate evidence is orthogonal to adapter classification. Every result has
`certificate_status` in `NOT_REQUESTED`, `NOT_AVAILABLE`, `CHECKED_UNSAT`, or
`CHECK_FAILED`, plus a `certificate_ref` exactly when the checker produced a
durable record. In particular, a checked certificate leaves the underlying
`adapter_classification` equal to `UNSAT_DISCOVERY_ONLY`; coverage reports count
adapter classifications and certificate statuses independently.

Promotion admissibility is target- and polarity-dependent. A replayed SAT result
may be the required witness or a counterexample to the intended claim; a
certified UNSAT result may close a negative branch or be irrelevant to a
positive target. The result schema therefore carries no universal
`promotion_admissible` flag.

### `cap-configuration-coverage/v1`

Required fields:

- manifest and complete ordered-cell-universe hashes;
- every expected cell mapped to exactly one admitted cell result;
- counts by classification;
- missing, duplicate, nonterminal, stale, and identity-mismatch inventories;
- coverage status `COMPLETE` or `INCOMPLETE`;
- a `diagnostic_coverage` boolean and optional external
  `promotion_verifier_record` reference;
- aggregate resource totals and solver-version inventory; and
- coverage self-hash.

`diagnostic_coverage` requires a retained adapter classification for every
declared cell and no pre-adapter infrastructure failures. The campaign does not
compute `promotion_coverage`. A separate independent promotion verifier must
consume the diagnostic coverage record plus every Phase 8 source-entitlement,
hypothesis-binding, atom-bridge, certificate, typed-ingress, direct-consumer,
final-reachability, and transitive-trust requirement. Its authenticated verifier
record must bind the verifier source manifest, exact input and output hashes,
commands and tool versions, and independent rerun evidence. That record is the
only promotion-status input.

### `cap-configuration-refinement/v1`

Each learned cut records:

```text
parent cell/formula
  -> exact replayed model hash
  -> source-level defect predicate, evaluator/source manifests, and evaluation
  -> learned cut with provenance
  -> child formula and identity
```

Every refinement binds the evaluator's exact source bytes, revision, version,
semantic contract, and immutable source snapshot so standalone replay can
reconstruct the defect from retained bytes. No cut may be learned from
`INCONCLUSIVE_UNKNOWN`, a malformed or partial model, an
approximate/algebraic value that the replay contract rejects, or a model that
fails any retained atom.

## Proposed repository layout

The initial implementation should use a new P97-side package:

```text
census/cap_configuration/
  __init__.py
  schema.py             strict schemas, canonical JSON, self-hashes
  universe.py           finite cell generation and ordered universe
  symmetry.py           group action, canonical representatives, orbit ledger
  encode.py             named QQ polynomial atoms and SMT journal
  replay.py             exact rational SAT replay
  piqd_adapter.py       authenticated fresh-session execution
  campaign.py           bounded scheduling, resume, attempts, coverage
  refine.py             model-defect cuts and core-mining records
  validate.py           standalone offline validation
  tests/

docs/specs/
  p97-piqd-cap-configuration-census-v1.md   # added only when schemas freeze

scripts/
  test-p97-piqd-cap-configuration-census.sh
```

Every implementation or live campaign must first create
`.codex/worktree-checkpoints/<lane-id>.json` with schema
`worktree-lane-checkpoint/v1`, exact `owned_paths`, exact retained
`durable_paths`, and every `generated_roots` entry. Runtime payloads belong below
`scratch/runs/<lane-id>/<run-id>/`, whose `run_manifest.json` uses schema
`worktree-run-manifest/v1` and repeats the lane checkpoint's `base_head`. Run the
lane hygiene report before handoff and the staged hygiene check before commit.
Only authenticated manifests, receipts, validators, compact reports, and unique
replay sources should be considered for durable promotion.

Do not create a new plan-specific result directory under the repository root,
`lean/`, or beside source files.

## Implementation phases and gates

### T0 — select and bind the mathematical target

Before implementation is described as proof-facing, record:

- exact source theorem or anchored residual;
- source/import revision;
- finite-ingress statement;
- immediate Lean consumer and named final consumer;
- all hypotheses that must reach the encoder;
- first omitted antecedent, if any;
- well-founded frontier measure;
- expected strict reduction if the campaign succeeds; and
- active-plan authorization.

Run one bounded project theorem-bank reuse preflight for the concrete finite
reduction candidate. Do not repeat it while the search key and source revision
remain unchanged.

Acceptance gate:

- the target record exists in the active closure plan or the campaign remains
  explicitly diagnostic and off-spine; and
- no source, coverage, or Lean claim is inferred from the implementation plan.

### Phase 0 — freeze the diagnostic model and controls

Implement the smallest independently enumerable fixture universe before any
large P97 target. It must include:

- at least one exact rational SAT cell;
- at least one syntactically contradictory UNSAT control;
- at least one forced `INCONCLUSIVE_UNKNOWN` or timeout control;
- a nontrivial symmetry orbit; and
- a deliberately omitted source fact that the validator exposes.

Acceptance gate:

- independent brute-force enumeration agrees with the primary generator;
- two runs emit byte-identical manifests, cells, orbit ledgers, and SMT
  journals;
- all self-hashes and cross-artifact references validate offline;
- mutation tests reject missing, duplicate, reordered, relabeled, and stale
  cells; and
- no daemon or solver is used by the offline test gate.

### Phase 1 — implement the producer-neutral package

Implement `schema.py`, `universe.py`, `symmetry.py`, `encode.py`, `replay.py`,
and `validate.py`. Base source custody and exact session mechanics on the shared
P97 SMT adapter, but keep all cap semantics in the new package.

The encoder must:

- use a complete declared variable order;
- serialize sparse polynomials over exact rationals;
- attach source provenance to every named atom;
- retain an explicit omitted-fact ledger;
- distinguish `eq`, `ge`, `gt`, `ne`, and supported disjunction forms;
- reject unused/undeclared variables and identifier collisions; and
- reconstruct the journal independently at the execution boundary.

The replay verifier must reject missing, duplicate, extra, approximate,
floating, or unsupported algebraic values. Exact algebraic-number support is a
future schema change, not a permissive parser extension.

An accepted SAT result must provide readback IDs covering the complete declared
variable map exactly once. A raw SAT response with partial, unsupported, or
rejected values remains a retained inconclusive result; it is never discarded
or counted as replayed SAT.

Acceptance gate:

- positive and negative fixtures cover every relation;
- independent replay catches every one-atom mutation;
- the validator needs neither PIQD nor a solver;
- all tests are deterministic under fixed Python hash seeding and one-thread
  native-library limits; and
- three fixture producer families use the same package API without copying
  custody or replay logic.

### Phase 2 — add the authenticated PIQD cell adapter

Use `run_authenticated_single_solver_query` from the shared SMT adapter. The
initial route uses one fresh SMT session and one solve per cell:

1. capture and validate immutable source and cell bytes;
2. create a fresh cvc5 or Z3 session with the manifest's solver profile;
3. append the canonical state journal;
4. export and compare the journal bytes;
5. solve once with complete model/readback requests;
6. fetch and authenticate the receipt and result;
7. reconcile a committed response after transport loss;
8. close the session exactly once; and
9. atomically publish the immutable attempt directory.

Classification is fail-closed:

| PIQD/solver event | Project classification |
| --- | --- |
| SAT plus complete exact replay | `SAT_SEMANTICALLY_REPLAYED` |
| SAT plus missing or rejected replay | `INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED` |
| SAT semantic verifier exception or invalid evidence | `INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE` |
| QF_NRA UNSAT without checked certificate | `UNSAT_DISCOVERY_ONLY` |
| Solver UNKNOWN or timeout | `INCONCLUSIVE_UNKNOWN` |
| Lost solve response without a receipt | `INCONCLUSIVE_TRANSPORT_LOSS` |
| Decisive raw solvers disagree | `INCONCLUSIVE_CROSS_SOLVER_DISAGREEMENT` |
| Malformed packet or custody/identity/protocol failure | fail closed before mathematical classification |

Acceptance gate:

- fake-transport tests cover every classification and lifecycle fault;
- a bounded live canary produces one replayed SAT result and one contradictory
  diagnostic UNSAT result;
- the standalone validator reconstructs both from disk without daemon access;
- solver, daemon, session, receipt, and source identities are bound; and
- no fallback solver or second solve occurs unless the manifest declares a
  separate cross-check attempt.

### Phase 3 — add the resumable campaign controller

Implement a project-side controller above PIQD. Reuse the repository's CEGAR
manifest/receipt vocabulary where it fits; do not introduce competing spellings
for jobs, waves, sources, models, receipts, or result classes.

The controller must:

- admit an immutable ordered universe before solving;
- bound prepared, active, and retained sessions;
- maintain one append-only attempt chain per logical cell;
- reconcile already-committed requests after restart;
- avoid duplicate logical attempts;
- never overwrite inconclusive or failed attempts;
- require a new attempt identity for changed limits or solver profiles;
- publish per-cell results atomically;
- derive coverage only from revalidated artifacts; and
- refuse aggregate completion for missing, duplicate, nonterminal, stale, or
  crossed-identity cells.

Acceptance gate:

- a mixed SAT/UNSAT/`INCONCLUSIVE_UNKNOWN` fixture survives controller crash
  and restart;
- no cell is solved twice under one attempt identity;
- the controller resumes from the authenticated manifest and attempt journal,
  not a directory listing;
- deleting or swapping any result makes coverage `INCOMPLETE`;
- a partial campaign cannot mint a complete coverage receipt; and
- interruption leaves PIQD sessions/jobs and project artifacts in a documented,
  recoverable state.

### Phase 4 — qualify resource behavior

PIQD's configurable `max_workers` controls the static queued-job lane. SMT
session solves are separate and require project-side admission control over the
number of live solver processes. cvc5 1.3.3 provides the global wall limit used
by PIQD but no solver memory-limit option. A production SMT-session sweep
therefore requires an external OS/process CPU and memory supervisor plus
telemetry whose identity and policy are included in the campaign identity.

On the current session route, a daemon deadline kills the solver process; a
later request revives the durable session from its journal. There is no public
session-cancel route. The controller must record this lifecycle and cannot
describe deadline termination as an auditable user cancellation.

Use three explicit resource tiers:

| Tier | Max in flight | Per-cell wall | Aggregate wall | Purpose |
| --- | ---: | ---: | ---: | --- |
| fixture | 1 | 30 s | 240 s | Lifecycle and semantic gates |
| tractability pilot | 4 | 60 s | 1 h | Representative orbit-stratified sample |
| production | project-side cap, never above 24 live solver processes | manifest-specific | manifest-specific | Only after the pilot gate and external resource enforcement |

Every campaign manifest must also bind disk and OS-enforced CPU/memory budgets,
the supervisor version/configuration, and the telemetry source. Do not claim a
memory ceiling merely from cvc5's abstract resource counter or a PIQD
`max_workers` setting that does not govern session solves.

The tractability sample is chosen deterministically by orbit stratum and
polynomial-system size. Before the run, record provisional stop/go thresholds.
The initial thresholds are:

- **go:** zero custody/replay failures, raw SAT or raw UNSAT on at least 80% of
  all sampled cells within the declared wall limit, at most 20% inconclusive
  cells, and projected CPU/disk use within the proposed production envelope;
- **pivot:** inconclusive outcomes on more than 20% of all sampled cells, any
  repeatable semantic-replay rejection, or a projected production envelope
  above the authorized resource budget; and
- **stop:** identity/custody failure, uncontrolled memory growth, inconsistent
  independent solver results, or evidence that the cell universe omits a
  source-permitted case.

A pivot returns to structural filtering, variable elimination, smaller local
subsystems, or theorem discovery. It does not authorize a bulk timeout increase.

Acceptance gate:

- the resource report gives counts and wall-time/RSS/disk distributions by
  orbit stratum;
- the project-side SMT-process ceiling is explicit and external telemetry shows
  that no backend oversubscribes it;
- the campaign runs in reserved capacity or an isolated window; no scheduler
  fairness or non-starvation claim is made for the current session lane; and
- the recorded stop/go decision follows the predeclared thresholds.

### Phase 5 — run one bounded mathematical pilot

After Gate T0, choose a small theorem-backed surface that exercises the real
producer without attempting the full target. Prefer a surface whose universe
can be independently counted and whose source facts already have named Lean
declarations.

The pilot report must record:

- raw/canonical/orbit counts;
- solver-status and project-classification counts;
- wall-time, RSS, and disk distributions;
- exact SAT replay statistics;
- unknown and failure inventory;
- repeated obstruction signatures;
- omitted-source-fact inventory;
- first missing source antecedent for any attempted lift; and
- explicit diagnostic-only claim scope.

Acceptance gate:

- the complete declared pilot universe has diagnostic coverage;
- all positive witnesses replay exactly;
- every unknown/failure remains visible;
- the run passes its `worktree-run-manifest/v1` and lane hygiene reports; and
- the result justifies either a larger wave or a named structural/theorem pivot.

### Phase 6 — add CEGAR and obstruction mining

CEGAR operates only on semantically replayed models. Each model defect must be a
source-level predicate with a deterministic evaluator and a recorded theorem or
proof obligation explaining why its cut is sound.

For Boolean structural subproblems, materialize immutable CNF and use PIQD's
CaDiCaL discovery plus DRAT/LRAT replay route. Keep the clause map and Lean
consumer caller-owned. For QF_NRA, treat named cores and minimized UNSAT subsets
as lemma candidates only.

At the end of each completed wave:

1. mine only that wave's new solver data for repeated general obstructions;
2. record candidate, immediate consumer, first missing antecedent, and source
   revision;
3. search the project Lean corpus only when the mined candidate or reuse key is
   materially new; and
4. either promote a checked general lemma or begin the next bounded refinement
   wave.

Acceptance gate:

- parent/model/defect/cut/child hashes form an authenticated replayable chain;
- no cut derives from an unvalidated model;
- replaying the wave reconstructs every child journal byte for byte;
- structural certified branches have checked LRAT and a checked source bridge;
  and
- metric discovery branches retain no unearned proof claim.

### Phase 7 — freeze the protocol and consider PIQD encoder support

Only after a successful bounded mathematical campaign should the schemas move
into `docs/specs/p97-piqd-cap-configuration-census-v1.md`.

At that checkpoint, compare two routes:

1. retain the P97-owned session adapter; or
2. add a typed `MetricProblem::CapConfiguration` input and a
   `piqc sweep cap-config` command for static queued SMT jobs.

The typed PIQD route is justified only if it preserves the exact P97 source
manifest and semantic replay contract, improves measured scheduling or
deduplication, and does not make PIQD authoritative for theorem meaning.

Do not add a generic raw-SMT upload endpoint. The existing raw-DIMACS lane is
intentionally CNF-specific and has a distinct proof/certificate path.

Acceptance gate:

- the schema has no unresolved semantic fields or omitted-ledger ambiguity;
- encoder determinism pins and versioning rules are specified;
- project-side validators remain authoritative for semantic claims; and
- any Rust change has its own repository-local plan, tests, and commit in the
  PIQD repository.

### Phase 8 — Lean ingress and promotion

Promotion is separate from diagnostic completion. Before any census theorem is
called promoted, require:

1. a Lean theorem mapping every source-permitted geometry into the finite cell
   universe;
2. a Lean theorem that the recorded symmetry action preserves the source
   predicates and that the representatives cover all cells;
3. a checked semantic bridge from each encoded atom to the Lean statement;
4. a promotion-admissible result for every required representative;
5. checked UNSAT certificates for Boolean branches and a checked path for every
   metric-negative branch;
6. exact SAT witnesses when the intended theorem consumes positive
   realizability;
7. a typed Lean ingress record with exact source, producer, certificate, and
   consumer custody;
8. a direct on-spine immediate consumer and named final consumer; and
9. an independent promotion verifier that rechecks statement fidelity,
   reachability, build, axiom closure, external trust, and fresh blueprint state.

Until a checked real-algebraic certificate path exists, QF_NRA
`UNSAT_DISCOVERY_ONLY` branches cannot satisfy item 5. Their proper output is a
smaller Lean lemma candidate, a structural CNF reduction, an exact algebraic
certificate candidate, or a remaining open branch.

Acceptance gate:

- the finite reduction strictly decreases the active plan's recorded frontier
  measure;
- every new obligation is load-bearing and directly consumed;
- `lake-build` passes the smallest target and authorized broader gate;
- `proof-blueprint spine` shows the intended on-spine reduction;
- the named final consumer's transitive axiom/external-evidence closure matches
  repository policy; and
- the independent promotion audit passes. Otherwise report
  `candidate verified by author only — NOT PROMOTED`.

## Test matrix

### Pure generator and schema tests

- Canonical JSON and self-hash pins.
- Duplicate/unknown-key and integer/bool ambiguity rejection.
- Independent small-universe counts.
- Deterministic cell order and IDs.
- Symmetry action closure, orbit membership, canonical representative, and
  stabilizer checks.
- One-field mutation rejection for every cell and manifest field.
- Unsafe path, symlink, hard-link, replacement, and source-mutation rejection.

### Encoding tests

- Complete variable ledger and no unused/undeclared variables.
- Unique safe identifiers and collision rejection.
- Stable sparse `QQ` polynomial order.
- Stable SMT journal bytes and assertion names.
- Positive/negative fixtures for `eq`, `ge`, `gt`, `ne`, and disjunction atoms.
- Omitted-fact ledger completeness.
- Cross-check of the sparse ledger against direct `Fraction` evaluation.

### SAT replay tests

- Complete rational model acceptance.
- Missing, duplicate, extra, malformed, approximate, and unsupported algebraic
  value rejection.
- Model/readback disagreement rejection.
- Every retained-atom mutation detected.
- Nonzero denominator and structural token-budget enforcement.

### PIQD transport and lifecycle tests

- SAT, UNSAT, `INCONCLUSIVE_UNKNOWN`, timeout, and failed solver responses.
- Stale solver/session identity.
- Journal/export/receipt disagreement.
- Response loss before and after PIQD commits the solve.
- Duplicate close and close failure.
- Daemon restart and session reconciliation.
- No implicit fallback or second solve.
- Immutable-output replacement and post-write mutation attacks.

### Campaign tests

- Mixed result classes with bounded concurrency.
- Crash/restart at admission, solve, publish, and coverage boundaries.
- Duplicate attempt and changed-limit retry identities.
- Missing, duplicate, stale, relabeled, and crossed-cell coverage rejection.
- Partial campaign refusal.
- Resource limit and starvation canaries.

### CEGAR and promotion tests

- Parent/child refinement chain replay from immutable evaluator, source,
  semantic-contract, and formula bytes.
- Learned-cut semantic evaluator mutation.
- Refusal to learn from rejected or incomplete models.
- CNF/clause-map/LRAT cross-binding.
- Lean ingress source, declaration, import-edge, aggregate, and self-hash
  mutations.
- Final-consumer reachability and transitive trust audit.

## Observability

Every campaign report should include:

- raw, canonical, and orbit cell counts;
- prepared, active, completed, retried, and reconciled attempts;
- result-classification distribution;
- wall-time percentiles and totals by solver/profile/orbit stratum;
- peak RSS and disk consumption under the external resource boundary;
- exact SAT replay successes and failures;
- number and size of repeated/minimized obstruction signatures;
- coverage gaps and their exact reasons;
- source/generator/validator/solver version inventory; and
- current claim flags.

Large raw logs, solver streams, caches, and model dumps remain below the declared
generated root. Reports must print aggregates and bounded examples rather than
embedding full solver output.

## Failure and retry policy

- Never overwrite a terminal or inconclusive attempt.
- Never retry a mutating request after transport loss until the PIQD request
  identity and committed state are reconciled.
- A changed solver, profile, timeout, memory boundary, source revision, or
  encoded journal creates a new attempt identity.
- `INCONCLUSIVE_UNKNOWN` does not trigger automatic fallback.
- Cross-solver checking is a separately declared attempt, not reinterpretation
  of the primary result.
- A solver disagreement stops the affected campaign stratum and preserves both
  artifacts.
- An exact SAT replay failure is an infrastructure/semantic defect, not a SAT
  witness.
- A coverage defect blocks aggregate publication even when every observed
  solver verdict is favorable.

## Sequencing and ownership

Recommended coherent checkpoints:

1. **Schemas and fixtures:** manifest/cell/result schemas, independent tiny
   universe, validators, and tests.
2. **Geometry producer:** deterministic universe, symmetry, exact polynomial
   ledger, and replay.
3. **PIQD adapter:** fake transport, live canaries, immutable attempts, and
   standalone validation.
4. **Campaign controller:** crash-safe resume, coverage, retry identities, and
   resource gates.
5. **Bounded mathematical pilot:** target binding, complete pilot report, and
   stop/go decision.
6. **CEGAR/core mining:** authenticated refinements and checked Boolean
   certificates where available.
7. **Protocol freeze:** stable specification and optional typed PIQD encoder
   decision.
8. **Lean promotion:** finite reduction, symmetry theorem, certificate ingress,
   on-spine consumer, and independent audit.

Each implementation lane must declare exact owned paths. Do not let a campaign
controller, encoder, and Lean promotion worker edit the same source files in
parallel. PIQD repository changes, if later justified, need a separate session
in that repository; this project must not perform cross-repository git
operations.

## Completion criteria

### Diagnostic census complete

All of the following must hold:

- the immutable finite universe validates independently;
- every declared cell has a retained diagnostic classification;
- every **accepted** SAT witness passes exact semantic replay, while every raw
  SAT with rejected replay remains a distinct retained inconclusive outcome;
- every inconclusive adapter outcome, pre-adapter failure, and diagnostic-only
  UNSAT cell remains explicitly visible;
- the controller survives restart and mints a complete diagnostic coverage
  record;
- resource and hygiene gates pass; and
- the report states the exact abstraction and omitted-source-fact boundary.

### Promotion-grade census complete

All diagnostic criteria plus:

- the finite-universe and symmetry reductions are proved and reach the named
  consumer;
- every required negative branch has a checked certificate or Lean proof;
- every certificate passes the Lean-ingress publication gate;
- the result strictly reduces the active on-spine frontier measure;
- the named final consumer builds with accepted transitive trust closure; and
- an independent verifier approves publication.

These two completion states must never share one undifferentiated `complete`
flag.

## Dependencies and deferred PIQD work

No daemon change is required for Phases 0--3. Possible later PIQD work is limited
to demonstrated operational gaps such as:

- public session cancellation with auditable terminal state;
- weighted scheduling and campaign-aware resource accounting;
- richer batch/session metadata;
- first-class checked real-algebraic certificate transport; or
- a stable typed cap-configuration encoder and `piqc` sweep command.

Open one of these only after a project-side canary demonstrates the missing
contract. Do not treat convenience or duplicated client code as sufficient
reason to enlarge PIQD's trust boundary.

## Related documents

- [`docs/computational-closure-plan-2026-07-28.md`](../computational-closure-plan-2026-07-28.md)
- [`docs/p97-piqd-remaining-solver-onboarding-plan-2026-08-09.md`](../p97-piqd-remaining-solver-onboarding-plan-2026-08-09.md)
- [`docs/piqd-sat-cegar-adoption-gaps-2026-08-08.md`](../piqd-sat-cegar-adoption-gaps-2026-08-08.md)
- [`docs/p97-cegar-wave-framework-consolidation-plan-2026-08-13.md`](../p97-cegar-wave-framework-consolidation-plan-2026-08-13.md)
- [`docs/specs/p97-cegar-wave-v1.md`](../specs/p97-cegar-wave-v1.md)
- [`docs/specs/p97-cegar-campaign-v1.md`](../specs/p97-cegar-campaign-v1.md)
- [`docs/specs/atail-piqd-cvc5-geometry-v1.md`](../specs/atail-piqd-cvc5-geometry-v1.md)
- [`docs/specs/p97-piqd-global-confinement-metric-cvc5-v1.md`](../specs/p97-piqd-global-confinement-metric-cvc5-v1.md)
- [`docs/specs/p97-phase3-survivor-metric-piqd-v1.md`](../specs/p97-phase3-survivor-metric-piqd-v1.md)
- [`docs/false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow_refactor_plan_2026-07-31.md`](../false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow_refactor_plan_2026-07-31.md)

## Change control

This document is a plan, not a protocol specification. Schema names, result
classes, resource thresholds, and module paths become stable only when the
corresponding phase acceptance gate passes and the contract moves to
`docs/specs/`. Update this plan when a gate changes, but record completed run
status in authenticated reports and commit messages rather than appending
solver logs here.
