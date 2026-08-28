<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# PIQD cap-configuration census implementation plan

Date: 2026-08-23

Updated: 2026-08-25

Status: revised standalone implementation plan; no live target has passed T0 or
T1, and no census, geometric exhaustiveness, proof, or Lean-promotion claim is
made.

## Document authority

This is the standalone implementation plan for the cap-configuration
counterexample-search campaign. It gathers the mathematical target contract,
finite-universe design, PIQD lifecycle, resource gates, CEGAR rules, and Lean
promotion contract in one place. Related closure plans remain authoritative for
the live proof frontier and for lane-specific authorization; this document does
not authorize a solver run or change the active goal by itself.

The plan is intentionally pre-protocol. A field or schema name below is a design
obligation until its phase gate passes and the frozen contract moves to
`docs/specs/`. Completed run state belongs in authenticated reports and commit
messages, not in this plan.

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

Only the target-neutral offline fixtures in Phase 0 may precede T0. A
target-specific probe, mathematical live canary, campaign controller, or
proof-facing claim requires T0. Before full target implementation, T1a freezes
the source-oracle contract. Only the minimum schema, producer, replay, and
adapter slices needed to discharge T1b may precede the complete T1 gate; a broad
implementation wave requires both T1a and T1b. The default live progression is
one authorized canary at a time; this plan never authorizes an unchanged or
bulk successor wave.

## Outcome

The first complete implementation checkpoint should provide:

1. a frozen target contract naming the proposition, target mode, polarity,
   required per-branch outcomes, hypotheses, finite ingress, and consumers;
2. a deterministic, symmetry-reduced finite cell universe for that explicitly
   selected theorem-backed P97 target;
3. canonical named QF_NRA atoms and byte-stable SMT journals for every cell;
4. authenticated one-cell PIQD executions through cvc5 or Z3;
5. exact rational replay for every **accepted** SAT result, while retaining raw
   SAT results with rejected replay as inconclusive outcomes;
6. append-only attempt histories, crash-safe resume, and a fail-closed coverage
   manifest over the declared universe;
7. the existing shared-adapter classifications, including
   `SAT_SEMANTICALLY_REPLAYED`, `UNSAT_DISCOVERY_ONLY`, and the distinct
   `INCONCLUSIVE_*` outcomes, plus explicit pre-adapter infrastructure failures;
8. a CEGAR and obstruction-mining path that never learns from an unvalidated
   model and never prunes with an unproved cut; and
9. a separate promotion gate requiring a proved finite reduction, proved
   symmetry reduction, source-semantic bindings, and checked certificates or
   Lean proofs at the named final consumer.

The diagnostic implementation is complete when items 1--8 pass their gates.
Item 9 is a separate proof-promotion milestone and is not implied by a complete
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

T0 chooses exactly one target mode:

- `COUNTEREXAMPLE_WITNESS`: a source-valid replayed SAT assignment is intended
  to produce an exact witness refuting the named statement;
- `NEGATIVE_BRANCH_CLOSURE`: every source-permitted geometry must map to a
  required cell, and every required negative branch needs a checked certificate
  or Lean proof; or
- `DIAGNOSTIC_OBSTRUCTION_MINING`: solver output may propose lemmas or smaller
  targets but earns no ambient-coverage or theorem claim.

Raw SAT/UNSAT rates are operational tractability data only. They never satisfy a
branch obligation without the target-mode-specific source bridge and promotion
gate.

T0 also freezes the termination policy. `NEGATIVE_BRANCH_CLOSURE` requires an
exhaustive declared universe. `COUNTEREXAMPLE_WITNESS` may use either
`EXHAUSTIVE` or `FIRST_VALID_WITNESS`; the latter stops only after a checked
source-level witness is retained. Such an early stop leaves census coverage
`INCOMPLETE`, inventories every unattempted cell, and can support only the
authorized terminal refutation claim. `DIAGNOSTIC_OBSTRUCTION_MINING` uses a
predeclared bounded scope and has no theorem-completion state.

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

### Required bridge directions

The phrase "semantic bridge" is never direction-free. The target contract must
name and prove the direction consumed by each conclusion.

For `NEGATIVE_BRANCH_CLOSURE`, the required lift is:

```text
source-permitted geometry under every T0 hypothesis
  -> one declared raw cell
  -> one covered canonical representative
  -> every enabled encoded atom for that representative.
```

An over-strengthened atom system cannot support a negative source conclusion.
The finite-universe theorem, symmetry theorem, and atom-entitlement theorem are
separate obligations and must all point in the displayed direction.
Canonicalization additionally requires a checked transport theorem: the finite
ingress, variable map, and enabled atom ledger commute with every recorded
symmetry action. It is also acceptable for the atom-entitlement theorem to
consume the symmetry witness directly and conclude the canonical
representative's exact enabled atoms; source-predicate preservation by itself is
not enough.

For `COUNTEREXAMPLE_WITNESS`, the required construction is:

```text
replayed exact assignment
  + every retained source predicate needed by the target
  -> a typed source-level geometry
  -> the exact witness theorem that refutes the named statement.
```

A reverse implication may be useful, but it carries no claim unless it is
separately proved. An omitted source hypothesis is not merely an omitted atom:
the manifest must inventory omitted source hypotheses and predicates separately,
and any such omission forces source-entitlement and promotion flags false.

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
| Logical attempt identities, retry selection, and CEGAR semantics | Session/job request identities, request-digest replay, and daemon restart recovery |
| Coverage meaning and theorem lift | Queueing, concurrency, and campaign row custody |
| Lean certificate consumer and publication | External evidence storage without theorem claims |

PIQD owns whether a repeated transport request names the same daemon operation.
P97 owns whether that daemon operation is the same logical campaign attempt and
whether an attempt may be selected for a cell result. Both identities must be
bound; neither substitutes for the other.

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

Structured identities and self-hashes use one exact helper:

```text
structured_hash(domain, value) = SHA256(
  UTF8(domain ++ "\n") ++ canonical_json(value)
)
```

The canonical JSON in this preimage has no terminal newline. A stored structured
artifact has exactly one terminal newline, which is not part of its structured
hash. Raw-byte fields such as source, SMT-LIB, journal, CNF, model, proof, and log
hashes instead use `SHA256(exact retained bytes)` and must say that they are raw
byte hashes. The initial schemas freeze these domains and projections:

| Field | Domain | Hashed value |
| --- | --- | --- |
| `campaign_id` | `cap-configuration-campaign-identity/v1` | manifest `identity` |
| `manifest_sha256` | `cap-configuration-census-manifest/v1` | manifest without `manifest_sha256` |
| `cell_sha256` | `cap-configuration-cell/v1` | cell without `cell_sha256` |
| `attempt_id` | `cap-configuration-attempt-identity/v1` | admission `identity` |
| `admission_sha256` | `cap-configuration-attempt-admission/v1` | admission without `admission_sha256` |
| `stage_sha256` | `cap-configuration-attempt-stage/v1` | stage without `stage_sha256` |
| `outcome_sha256` | `cap-configuration-attempt-outcome/v1` | outcome without `outcome_sha256` |
| `cell_result_sha256` | `cap-configuration-cell-result/v1` | cell result without `cell_result_sha256` |
| `coverage_sha256` | `cap-configuration-coverage/v1` | coverage without `coverage_sha256` |
| `refinement_sha256` | `cap-configuration-refinement/v1` | refinement without `refinement_sha256` |
| `authorization_sha256` | `cap-configuration-wave-authorization/v1` | authorization without `authorization_sha256` |
| `authorization_consumption_sha256` | `cap-configuration-wave-authorization-consumption/v1` | consumption without `authorization_consumption_sha256` |

Changing a domain, projection, canonical-JSON rule, or stored-newline rule is a
schema-version change. Validators recompute the exact preimage rather than
accepting a caller-supplied digest description.
Where a schema bullet below uses “hash” descriptively, the frozen field must
end in `_sha256` and be classified as one of these structured hashes or as an
exact retained-byte hash before its phase gate passes.

### `cap-configuration-census-manifest/v1`

The manifest separates semantic identity from publication metadata. Required
top-level fields are `schema`, `identity`, `campaign_id`, `publication`, and
`manifest_sha256`.

The `identity` object contains:

- repository source revision and exact generator/validator source manifests;
- target kind and identifier, target mode, target proposition and polarity, required
  per-branch result and termination policies, source theorem, immediate
  consumer, final consumer, and explicit claim flags;
- finite-ingress schema/version and payload hash;
- ordered source-hypothesis inventory and a separate ordered
  omitted-source-hypothesis/predicate inventory;
- raw cell count, canonical cell count, orbit count, and ordered cell IDs;
- symmetry group/action version and orbit-ledger hash;
- solver/backend/profile identities and declared resource limits;
- ordered variable-map, atom-ledger, enabled-atom, omitted-atom, and source
  provenance inventories;
- retry, result-admission, and classification policy versions; and
- expected per-cell artifact schemas.

A fixture campaign uses `target_kind = "fixture"`, null immediate/final
consumers, and explicit false source-entitlement, universal-lift,
theorem-coverage, and Lean-closure flags. A mathematical campaign must not use
fixture nullability.

The `publication` object contains the operator-declared `created_utc` and any
nonsemantic report metadata. The emitter receives this object as frozen input;
it never reads the current clock while rebuilding campaign identity.

Hashing is domain-separated and noncircular:

```text
campaign_id = structured_hash(
  "cap-configuration-campaign-identity/v1", identity
)
manifest_sha256 = structured_hash(
  "cap-configuration-census-manifest/v1",
  manifest without manifest_sha256
)
```

Determinism tests compare the identity projection byte for byte;
whole-manifest equality additionally requires the same frozen publication
object.

The manifest is immutable after admission. A changed limit, solver profile,
source revision, generator, atom ledger, target contract, or retry/admission
policy creates a new campaign identity.

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
- source-provenance record for every atom;
- separate omitted-source-hypothesis/predicate inventory;
- exact original SMT-LIB bytes hash;
- normalization algorithm/schema/version;
- canonical SMT journal bytes hash; and
- `cell_sha256` under the structured-hash table above.

### `cap-configuration-attempt/v1`

An attempt is an append-only directory, not one mutable state object. Its
admission record is written before any transport mutation and never contains
fields that exist only after execution.

The immutable admission record contains an `identity` object with:

- campaign/cell identities, monotone attempt index, and optional parent-attempt
  identity;
- execution route, solver/backend/profile/version, exact requested limits, and
  external CPU/memory supervisor and telemetry identities;
- canonical request payload hashes and the expected source/journal identity;
- retry reason and admission-policy/version hash;
- explicit false claim flags for every unearned promotion claim.

Outside `identity`, the record contains `attempt_id`, `admitted_utc`,
`admission_sha256`, and no post-execution field. The first stage chains from
`admission_sha256`.

`attempt_id` is the structured hash of `identity` defined above;
timestamps and later artifacts do not change it. A changed solver, profile,
timeout, core limit, memory boundary, source revision, or encoded journal creates
a new P97 attempt identity even when PIQD would deduplicate the transport job.

Each lifecycle transition is an immutable
`cap-configuration-attempt-stage/v1` record with `stage_sha256`, chained to the
previous stage hash. The terminal outcome has `outcome_sha256` under the same
structured-hash rules. The route is exactly one of:

- `smt_session`: before `POST /solve`, persist the canonical UUID spelling of
  PIQD `request_id`; the exact canonical request object containing assumptions,
  ordered assumption labels, timeout, model flag, and ordered `get_values`; the
  exact journal-frontier fields used by PIQD; the request-digest
  algorithm/schema and pinned source-manifest hash; and the caller-computed
  expected digest. Retain the daemon-produced digest with the receipt and
  compare it. Same-ID/same-digest replay is admissible; the same ID with a
  different digest fails closed. Session creation, append, export,
  solve/receipt reconciliation, and close remain distinct stages;
- `static_smt_job`: reserved for a future typed static encoder; bind the exact
  input blob, job ID, returned job record, actual stored limits, log, model when
  present, and proof/checker artifacts when produced; or
- `raw_dimacs_job`: a deferred Phase 6 arm that reuses the existing shared
  raw-DIMACS machinery and binds verbatim CNF bytes, CNF blob hash, PIQD identity
  hash, exact producer-manifest bytes/hash, backend/profile, requested core
  limit, requested `timeout_s` and `march_timeout_s`, actual stored limits, job
  record, model/proof/log blobs, and baked-in assumption inventory. The P97 arm
  is deliberately stricter than PIQD's optional-manifest API:
  `manifest_present` must be true, and an absent producer manifest fails closed.

Solve request IDs do not protect session creation or journal append. PIQD has no
create idempotency key, so before creation the caller persists a unique
attempt-derived session label and expected solver/profile identity. After a lost
create response, it authenticates `GET /sessions`: exactly one matching
label/identity may be reconciled to its returned session ID; zero matches seals a
failed attempt; multiple matches, identity drift, or unavailable listing records
an orphan and stops the campaign for manual reconciliation. The caller never
guesses an ID or silently creates a replacement. Before append, persist exact
pre- and expected post-append journal frontiers and bytes. After append-response
loss, export and compare: exact post-state is reconciled, exact pre-state permits
only a separately recorded `expect_commands`-guarded retry when policy allows
it, and every other state fails closed.

After a lost close response, query the known session ID. Proven absent/closed
state completes reconciliation; a still-live session receives one recorded
authenticated `DELETE` cleanup and another status check. If closed state cannot
be proved, retain the session in the orphan inventory and stop the campaign.

PIQD static-job identity does not by itself promise that a newly requested
timeout produced a new job. On `existing = true`, the adapter must compare every
actual returned/stored limit with the P97 admission record and fail closed on a
mismatch. The raw-DIMACS path must also bind the requested core limit and reject
missing source blobs rather than regenerate them. PIQD raw-DIMACS identity also
omits its timeout limits; on reuse, the P97 adapter must compare both stored
`timeout_s` and `march_timeout_s` with the admission record. The deferred static
and raw-DIMACS arms do not block completion of the SMT-session implementation
through Phase 5; their activation gates own their tests.

The terminal `cap-configuration-attempt-outcome/v1` is exactly one of:

- `sat`: start/end/resource data, raw status, model/value hashes, complete
  declared-variable readback inventory, semantic verifier identity, replay
  classification, and replay-artifact hash;
- `unsat`: start/end/resource data, terminal-UNSAT flag, raw assumption-core
  ledger when present, explicit source-named-core binding status, and optional
  independently checked certificate reference;
- `unknown`: start/end/resource data, raw reason, and timeout/deadline record; or
- `failed`: failure stage, retained infrastructure evidence, reconciliation
  status, and explicit close status.

The caller must atomically publish a failure seal even when the shared adapter
raises, transport is lost, close fails, or only a prefix of the stage ledger
exists. A missing terminal outcome leaves an admitted nonterminal attempt; it is
visible to coverage and restart logic rather than silently discarded.

A PIQD assumption core is not a source-named polynomial core. The latter claim
requires an exact caller-owned label-to-source binding and independent semantic
replay.

An inconclusive outcome, timeout, failure, or changed limit is never
overwritten. A retry is a new append-only attempt with a new identity.

### `cap-configuration-cell-result/v1`

This immutable projection selects evidence for the logical cell under the
manifest's fixed admission policy. Its `selection` is exactly one of:

- `single_attempt`, binding `selected_attempt_id`, admission and outcome hashes,
  selection reason, and admission-policy/version hash; or
- `cross_solver_aggregate`, binding an ordered nonempty set of selected attempt
  IDs/hashes and the shared adapter's aggregate record.

The validator rejects a selected attempt that is stale, ineligible, orphaned,
superseded under policy, or inconsistent with any other decisive admitted
attempt. Unselected attempts remain visible. Selection cannot cherry-pick a
favorable retry or silently discard solver disagreement.

The v1 manifest freezes this total selection rule. Order attempts by monotone
`attempt_index`, breaking an impossible duplicate index by rejecting the cell.
Inspect every eligible terminal attempt: conflicting decisive classes produce
`INCONCLUSIVE_CROSS_SOLVER_DISAGREEMENT`; consistent decisive attempts select
the lowest-index decisive attempt unless the manifest declared a cross-solver
aggregate, in which case all decisive IDs are ordered by
`(attempt_index, attempt_id)`. If no attempt is decisive, select the
highest-index eligible terminal attempt. Any admitted nonterminal or orphan
still blocks complete coverage. A schema-versioned policy change is required to
alter this ordering or tie-break.

For an adapter-classified result, `adapter_classification` preserves the shared
adapter vocabulary verbatim:

- `SAT_SEMANTICALLY_REPLAYED`;
- `UNSAT_DISCOVERY_ONLY`;
- `INCONCLUSIVE_UNKNOWN`;
- `INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED`;
- `INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE`;
- `INCONCLUSIVE_TRANSPORT_LOSS`; or
- `INCONCLUSIVE_CROSS_SOLVER_DISAGREEMENT`.

`FINITE_DIAGNOSTIC_COMPLETE` may be recorded only by a
`cross_solver_aggregate` that binds the shared adapter's aggregate boundary. A
result that fails before adapter classification has a separate tagged `failed`
record with its failure stage and a null `adapter_classification`; it is not
renamed mathematical `UNKNOWN`.

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

Every cell result carries `cell_result_sha256` under the structured-hash table
above.

### `cap-configuration-coverage/v1`

Required fields:

- manifest and complete ordered-cell-universe hashes;
- every expected cell mapped to exactly one selected cell result or one explicit
  missing/nonterminal reason, plus the ordered selected-result map;
- counts by classification;
- missing, duplicate, nonterminal, orphan-attempt, conflicting-decisive,
  stale, and identity-mismatch inventories;
- coverage status `COMPLETE` or `INCOMPLETE`;
- target termination policy/reason, any terminal witness result, and the exact
  unattempted-cell inventory;
- a `diagnostic_coverage` boolean and optional external
  `promotion_verifier_record` reference;
- aggregate resource totals and solver-version inventory; and
- `coverage_sha256` under the structured-hash table above.

`diagnostic_coverage` requires a retained adapter classification for every
declared cell and no pre-adapter infrastructure failures. The campaign does not
compute `promotion_coverage`. A separate independent promotion verifier must
consume the coverage snapshot—complete for negative closure, possibly
incomplete under a valid first-witness termination—plus every target-applicable
Phase 8 source-entitlement, hypothesis-binding, atom-bridge, certificate or
witness, typed-ingress, direct-consumer, final-reachability, and transitive-trust
requirement. Its authenticated verifier record must bind the verifier source
manifest, exact input and output hashes, commands and tool versions, and
independent rerun evidence. That record is the only promotion-status input.

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

Every refinement has status `CANDIDATE` or `ADMITTED`. A candidate may be mined,
reported, or sent to theorem search, but it cannot change an admitted universe,
remove a parent cell, contribute to coverage, or authorize another production
wave. Admission requires a proved source-preservation implication under the
exact T0 hypotheses, a named immediate consumer, and an independently checked
binding from that proof to the cut bytes. A merely recorded proof obligation is
not cut entitlement. The required direction is explicit: every source-valid
geometry satisfying the parent formula must satisfy the learned cut and hence
the child formula, after every admitted orbit/canonicalization transport. Every
refinement carries `refinement_sha256` under the structured-hash table above.

### `cap-configuration-wave-authorization/v1`

A successor canary consumes an immutable authorization written by the active
plan authority, never by the campaign controller or child wave. It binds:

- target/campaign identity, active-plan path and digest, and authorizing
  checkpoint/revision;
- parent wave/campaign/result hashes and the exact allowed child cell set;
- solver/profile/resource envelope and expiration or revocation policy;
- `max_children = 1`, issue time, issuer identity, and
  `authorization_sha256`.

The authorization never changes. A separate append-only
`cap-configuration-wave-authorization-consumption/v1` record carries the child
attempt ID, consumption time, authorization hash, and
`authorization_consumption_sha256`. A derived consumed/unconsumed view may read
both records but may not rewrite either.

Admission atomically checks that no prior consumption record exists and binds
the authorization to the child. A child cannot authorize itself or another
child, and unused authority does not roll forward. After the child result, any
further canary requires a fresh active-plan decision and authorization.

## Proposed repository layout

The initial implementation should use a new P97-side package for the genuinely
new cap/QF_NRA semantic boundary, while reusing shared execution and custody
machinery:

```text
census/cap_configuration/
  __init__.py
  schema.py             strict schemas, canonical JSON, self-hashes
  universe.py           finite cell generation and ordered universe
  symmetry.py           group action, canonical representatives, orbit ledger
  encode.py             named QQ polynomial atoms and SMT journal
  replay.py             exact rational SAT replay
  piqd_adapter.py       thin allowlisted adapter to shared SMT custody
  campaign.py           cap policy over shared attempt/coverage primitives
  refine.py             model-defect cuts and core-mining records
  validate.py           standalone offline validation
  tests/

docs/specs/
  p97-piqd-cap-configuration-census-v1.md   # added only when schemas freeze

scripts/
  test-p97-piqd-cap-configuration-census.sh
```

The package must not copy a PIQD launcher, receipt parser, source-custody layer,
publication helper, or generic campaign state machine already supplied by the
shared P97 adapters. Before implementation, write an explicit compatibility map
from every proposed schema/result/lifecycle term to the existing CEGAR and SMT
vocabulary. A new helper is admitted only when the map identifies a cap-specific
semantic or trust boundary that the shared component cannot represent.

Every implementation or live campaign must first create
`.codex/worktree-checkpoints/<lane-id>.json` with schema
`worktree-lane-checkpoint/v1`, exact `owned_paths`, exact retained
`durable_paths`, and every `generated_roots` entry. Runtime payloads belong below
`scratch/runs/<lane-id>/<run-id>/`, whose `run_manifest.json` uses schema
`worktree-run-manifest/v1` and repeats the lane checkpoint's `base_head`. Run the
lane hygiene report before handoff and the staged hygiene check before commit.
Only authenticated manifests, receipts, validators, compact reports, and unique
replay sources should be considered for durable promotion.

Every declared generated root has exactly one `run_manifest.json`. The current
hygiene checker is authoritative for its schema; at minimum the record binds the
lane/run/root/owner identities, output classes, source and input digests,
`created_utc`, the lane `base_head`, and its self-hash. Publication requires both
`report --lane <lane-id>` and the exact-path staged check
`check --lane <lane-id> --staged`.

Do not create a new plan-specific result directory under the repository root,
`lean/`, or beside source files.

## Implementation phases and gates

### T0 — select and bind the mathematical target

Before target-specific implementation or any mathematical live canary, record:

- exact source/problem locator and version or digest;
- exact qualified Lean source theorem or anchored residual and its elaborated
  proposition;
- source/import revision;
- target mode and proposition polarity;
- target termination policy and the exact evidence permitted to stop the run;
- finite-ingress statement;
- immediate Lean consumer and named final consumer;
- all hypotheses, quantifiers, constants, bounds, and conclusions that must
  reach the encoder, with deliberate semantic deltas;
- the required outcome and theorem consequence for every representative or
  branch;
- the source-to-cell, symmetry, atom-entitlement, and witness-construction
  bridge obligations in the direction each conclusion consumes;
- first omitted antecedent, if any;
- ordered omitted-source-hypothesis/predicate inventory;
- for proof-lane work, the current coordinator-interface frontier,
  well-founded frontier measure, expected strict reduction, and constructor
  fan-out;
- for counterexample work, the exact terminal witness theorem and explicit
  authorization for the resulting goal/status transition;
- active-plan authorization.

Run one bounded project theorem-bank reuse preflight for the concrete finite
reduction candidate. Do not repeat it while the search key and source revision
remain unchanged.

Acceptance gate:

- the target record exists in the active closure plan or the campaign remains
  explicitly diagnostic and off-spine; and
- target mode, polarity, termination policy, per-branch required outcomes, and
  every bridge direction required by that target mode are unambiguous;
- every omitted antecedent forces the corresponding source-entitlement and
  promotion flags false;
- proof-facing work names a strict frontier reduction, while counterexample
  work names the authorized terminal refutation effect; and
- no source, coverage, or Lean claim is inferred from the implementation plan.

### T1a — freeze the source-oracle contract

Before full target implementation, identify independent evidence capable of
catching a mistranslated ingress, symmetry action, atom ledger, or target
polarity. The oracle hierarchy is target-mode-dependent:

1. use an independently known source-valid realization satisfying the exact T0
   hypotheses when one exists without already deciding the search target;
2. otherwise use independently enumerated small instances or a proved
   satisfiable weakened/adjacent source subdomain that exercises the same
   ingress, symmetry, variable-map, and atom families; and
3. add differential source evaluators and exact rational transport fixtures for
   components not covered above.

For a target whose intended claim is emptiness, or whose first source-valid
realization would itself be the sought counterexample, record
`FULL_TARGET_POSITIVE_CONTROL_UNAVAILABLE` rather than assuming the witness.
Still require an independently justified source-level negative or vacuity
control, not merely a syntactically false SMT formula. If the strongest source
control needs an unsupported algebraic value, add a separate exact-rational
transport/replay fixture and keep the value-schema limitation explicit.

T1a also freezes a named structural filter or smaller local system and a
deterministic orbit-stratified sample contract with caps on cells, variables,
atoms, `or_ne` atoms, strict inequalities, input bytes, and wall time.

Acceptance gate:

- the selected oracle hierarchy is independent of the producer under test and
  covers every ingress/symmetry/atom family used by the sample;
- each positive, negative, weakened, or differential control has a source-level
  expected-result justification and exact source locator;
- absence of a full target-positive control is explicit and earns no
  end-to-end positive-source claim;
- the structural filter and complexity caps are fixed before sample selection;
  and
- if no adequate independent oracle covers the target semantics, the status is
  `T1_BLOCKED_NO_ORACLE` and no live target sample is authorized.

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
- two runs emit byte-identical identity projections, cells, orbit ledgers, and
  SMT journals; whole manifests are byte-identical when supplied the same
  frozen publication object;
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
- retain separate omitted-atom and omitted-source-hypothesis/predicate ledgers;
- implement the frozen v1 relation grammar `eq`, `ge`, `gt`, `ne`, and
  `or_ne`; the first four take exactly one polynomial, while `or_ne` takes
  exactly two and means that at least one is nonzero; reject every other arity
  or Boolean shape;
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
- the frozen relation grammar accepts only the five named forms and exact
  arities above;
- independent replay catches every one-atom mutation;
- the validator needs neither PIQD nor a solver;
- all tests are deterministic under fixed Python hash seeding and one-thread
  native-library limits; and
- the tiny fixture producer and the T0 target pilot producer use the same
  package API without copying custody or replay logic. A third producer is not
  required without a demonstrated reuse need.

### Phase 2 — add the authenticated PIQD cell adapter

Use `run_authenticated_single_solver_query` from the shared SMT adapter. The
current helper does not transmit a caller-owned solve `request_id`; Phase 2 must
first add that allowlisted parameter and exact request-object/digest binding to
the shared project-side seam, with its existing callers and tests preserved. A
plan record alone does not create PIQD replay protection. The initial route then
uses one fresh SMT session and one solve per cell:

1. capture and validate immutable source and cell bytes;
2. atomically publish the attempt admission record;
3. persist the attempt-derived unique label, create a fresh cvc5 or Z3 session,
   and reconcile a lost create response only through authenticated session
   listing and exact label/solver/profile identity;
4. persist the exact pre/post journal bytes and frontiers, append with
   `expect_commands`, and reconcile response loss only by exact export;
5. export and compare the journal bytes;
6. persist the canonical solve `request_id`, exact request object, digest
   algorithm/source pin, caller-computed digest, and journal frontier before
   transport;
7. solve once with complete model/readback requests;
8. fetch and authenticate the receipt and result, replaying only the same
   request ID/digest after response loss;
9. attempt one authenticated close operation, reconciling response loss by
   authenticated status lookup and bounded `DELETE` cleanup, and record its
   exact status; and
10. atomically publish the terminal outcome or failure seal.

The current shared adapter does not by itself publish every pre-adapter or
exceptional failure prefix. The cap caller must retain its own admission and
stage ledger and must seal failure evidence when the shared call raises.

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
- request-ID replay tests cover same-ID/same-payload success,
  same-ID/different-payload rejection, response loss, process restart, and
  daemon restart;
- create-response-loss tests cover zero, one exact, multiple, identity-mismatched,
  and unqueryable label matches without guessed/replacement sessions;
- append-response-loss tests distinguish exact pre-state, exact post-state, and
  divergent state, while close-response-loss tests prove closed state or stop
  with an orphan inventory;
- a bounded one-process target-neutral fixture canary produces one replayed SAT
  result and one independently justified diagnostic UNSAT result;
- the standalone validator reconstructs both from disk without daemon access;
- solver, daemon, session, request, receipt, source, supervisor, and telemetry
  identities are bound;
- a failure at every lifecycle stage leaves a validated durable failure seal;
  and
- no fallback solver or second solve occurs unless the manifest declares a
  separate cross-check attempt.

### T1b — run the bounded target feasibility preflight

After the minimum Phase 1 producer/replay slice and Phase 2 session adapter pass
their fixture gates, but before the generic controller or mathematical pilot,
run the T1a target sample through one live solver process with exact
source/solver/resource identities and no fallback.

The existing seven-case ATAIL full-inequality pilot timed out in every case at
30 seconds. T1b therefore uses the frozen structural filter or smaller local
system; plumbing success alone does not discharge tractability.

Acceptance gate:

- every applicable source oracle survives generation and symmetry reduction,
  and encoded atoms agree with the independent source evaluator;
- when a full target-positive control is unavailable, the weaker/differential
  controls cover every used semantic component and the report preserves that
  limitation;
- the negative control has its independent expected-result justification;
- every sample cell satisfies the predeclared complexity caps;
- custody and replay have zero failures;
- status is `PASSED` only when the filtered sample produces its predeclared
  useful-decision rate within the authorized envelope;
- a sound but underpowered sample records `PIVOT_REQUIRED` with a named
  structural/theorem pivot and does not pass T1; and
- an inadequate oracle, timeout-dominated sample, or semantic drift records a
  failed/blocked T1 status and forbids Phase 3, a generic controller, or a bulk
  timeout increase.

The complete T1 gate passes only when T1a and a `PASSED` T1b bind the same T0
target, source revision, oracle records, filter, and sample contract.

### Phase 3 — add the resumable campaign controller

Implement a project-side controller above PIQD. Reuse the repository's CEGAR
manifest/receipt vocabulary where it fits; do not introduce competing spellings
for jobs, waves, sources, models, receipts, or result classes.

The controller must:

- admit an immutable ordered universe before solving;
- bound prepared, active, and retained sessions;
- maintain one append-only attempt chain per logical cell;
- persist solve-request identity/digest before the solve mutation and reconcile
  only an exact already-committed solve after restart;
- avoid duplicate logical attempts;
- never overwrite inconclusive or failed attempts;
- require a new attempt identity for changed limits or solver profiles;
- for any later-enabled static or raw-DIMACS arm, compare returned PIQD limits
  with requested limits and reject a deduplicated mismatch;
- publish per-cell results atomically;
- apply one deterministic attempt-selection policy and retain every unselected
  attempt;
- derive coverage only from revalidated artifacts;
- stop early only under the manifest's target termination policy, retaining an
  exact terminal-witness reference and unattempted-cell inventory; and
- refuse aggregate completion for missing, duplicate, nonterminal, orphan,
  conflicting-decisive, stale, or crossed-identity cells.

Acceptance gate:

- a mixed SAT/UNSAT/`INCONCLUSIVE_UNKNOWN` fixture survives controller crash
  and restart;
- no cell is solved twice under one attempt identity;
- the same PIQD request ID with a changed digest is rejected across restart;
- when a deferred static or raw-DIMACS arm is activated, changed-limit tests
  cannot silently select an existing job with different stored limits;
- the controller resumes from the authenticated manifest and attempt journal,
  not a directory listing;
- deterministic selection rejects favorable-retry cherry-picking and preserves
  cross-solver disagreement;
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
mid-solve cancellation route. PIQD does expose authenticated `DELETE` for
closing/stopping a known session outside that solve boundary; creation/close
reconciliation must use it as specified above. The controller must record this
lifecycle and cannot describe deadline termination as an auditable user
cancellation.

Use four explicit resource tiers. One live solver process remains the default
until the concurrency qualification itself passes:

| Tier | Max in flight | Per-cell wall | Aggregate wall | Purpose |
| --- | ---: | ---: | ---: | --- |
| fixture | 1 | 30 s | 240 s | Lifecycle and semantic gates |
| initial tractability | 1 | 60 s | 1 h | Filtered representative orbit-stratified sample |
| concurrency qualification | 2, then at most 4 | 60 s | predeclared | Process/RSS/restart admission canary only |
| production | measured project-side cap; default 1 and never above 24 | manifest-specific | manifest-specific | Only after every preceding gate and external enforcement |

Every campaign manifest must also bind disk and OS-enforced CPU/memory budgets,
the supervisor version/configuration, and the telemetry source. Do not claim a
memory ceiling merely from cvc5's abstract resource counter or a PIQD
`max_workers` setting that does not govern session solves.

Before authorizing more than one live session solve, name the concrete OS
enforcement mechanism, demonstrate per-solver-process attribution, and run a
bounded 2-process then 4-process canary covering deadline kill, daemon restart,
session revival, RSS accounting, and process-count enforcement. A controller
semaphore without OS evidence is not a concurrency qualification.

The tractability sample is chosen deterministically by orbit stratum and
polynomial-system size after the T1 structural filter. Before the run, record
sample-size and complexity caps plus provisional stop/go thresholds.
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

The 80% threshold is an operational go signal only. It does not discharge any
branch obligation or make inconclusive cells omissible.

A pivot returns to structural filtering, variable elimination, smaller local
subsystems, or theorem discovery. It does not authorize a bulk timeout increase.

Acceptance gate:

- the resource report gives counts and wall-time/RSS/disk distributions by
  orbit stratum;
- the project-side SMT-process ceiling is explicit and external telemetry shows
  that no backend oversubscribes it;
- concurrency above one has its own successful qualification record rather than
  being inferred from the static-job `max_workers` setting;
- the campaign runs in reserved capacity or an isolated window; no scheduler
  fairness or non-starvation claim is made for the current session lane; and
- the recorded stop/go decision follows the predeclared thresholds.

### Phase 5 — run one bounded mathematical pilot

After Gates T0 and T1, choose a small theorem-backed surface that exercises the
real producer without attempting the full target. Its target ID, finite-ingress
schema/hash, source revision, hypotheses, atom semantics, and symmetry action
must match T0. A deliberately different surface is fixture/operational evidence
only and cannot authorize a target campaign. Prefer a surface whose universe can
be independently counted and whose source facts already have named Lean
declarations.

The pilot report must record:

- raw/canonical/orbit counts;
- solver-status and project-classification counts;
- wall-time, RSS, and disk distributions;
- exact SAT replay statistics;
- unknown and failure inventory;
- repeated obstruction signatures;
- omitted-atom and omitted-source-hypothesis/predicate inventories;
- first missing source antecedent for any attempted lift; and
- explicit diagnostic-only claim scope.

Acceptance gate:

- the complete declared pilot universe has diagnostic coverage;
- all positive witnesses replay exactly;
- every unknown/failure remains visible;
- the run passes its `worktree-run-manifest/v1` and lane hygiene reports; and
- the result justifies either exactly one authorized successor canary or a named
  structural/theorem pivot. It never authorizes an unchanged or bulk wave.

### Phase 6 — add CEGAR and obstruction mining

CEGAR operates only on semantically replayed models. Each model defect must be a
source-level predicate with a deterministic evaluator. A proved
source-preservation theorem is required before the resulting cut becomes
`ADMITTED`; an unresolved proof obligation leaves it `CANDIDATE` and unusable
for pruning or coverage.

Only when a concrete Boolean structural subproblem exists, activate the deferred
`raw_dimacs_job` arm by reusing PIQD's existing shared raw-DIMACS machinery.
Materialize immutable CNF and use CaDiCaL discovery plus DRAT/LRAT replay while
keeping the producer manifest, clause map, and Lean consumer caller-owned. The
raw-DIMACS schema and timeout-deduplication tests are a Phase 6 gate, not a
Phase 0--5 dependency. For QF_NRA, treat named cores and minimized UNSAT subsets
as lemma candidates only.

At the end of each completed wave:

1. mine only that wave's new solver data for repeated general obstructions;
2. record candidate, immediate consumer, first missing antecedent, and source
   revision;
3. search the project Lean corpus only when the mined candidate or reuse key is
   materially new; and
4. either promote a checked general lemma, admit one proof-backed cut, or stop
   with a named open candidate; and
5. launch at most one successor canary only by atomically consuming a valid
   `cap-configuration-wave-authorization/v1` record bound to the parent result.
   An unchanged wave, bulk successor, child self-authorization, or reused
   authorization is forbidden.

Acceptance gate:

- parent/model/defect/cut/child hashes form an authenticated replayable chain;
- no cut derives from an unvalidated model;
- every cut used by an admitted child has a checked source-preservation theorem
  proving that each source-valid parent geometry satisfies the exact cut and
  child formula under the T0 hypotheses, after canonicalization, with a
  byte-bound immediate consumer;
- candidate cuts are absent from admitted universes and coverage calculations;
- the one child canary consumes a parent-bound authorization, and any further
  child requires a fresh active-plan decision;
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

Promotion is separate from diagnostic completion. T0 and complete T1 must have
passed for the same non-diagnostic target contract and source revision;
target-neutral fixtures and `DIAGNOSTIC_OBSTRUCTION_MINING` are ineligible.
Every target-applicable claim flag must be true before publication. Negative
closure requires true source-entitlement, universal-lift, theorem-coverage, and
Lean-closure flags. Counterexample publication requires true witness-source,
witness-construction, theorem-refutation, and Lean-closure flags; its
omitted-source-hypothesis/predicate inventory must be empty unless the exact
witness theorem independently proves and binds every listed omission.
Before any source theorem or terminal refutation is called promoted, require:

1. a typed Lean finite-universe record for negative closure, or a typed selected
   cell/decoder for counterexample work, whose ordered IDs and payload hash are
   bound to the exact admitted generator output;
2. for negative closure, a Lean theorem mapping every source-permitted geometry
   under every T0 hypothesis into that exact finite universe;
3. for negative closure, a Lean theorem that the recorded symmetry action
   preserves every source predicate, that the representatives cover the typed
   universe, and that the finite ingress, variable map, and enabled atom ledger
   commute with the recorded action, unless item 4 directly consumes the
   symmetry witness and proves the exact canonical-representative atoms;
4. for every required negative branch, a checked theorem that the source
   geometry entails every enabled encoded atom; an atom-to-source direction is
   claimed only when separately proved;
5. target-mode-admissible evidence: every required representative for
   `NEGATIVE_BRANCH_CLOSURE`, or one retained terminal witness result under a
   `COUNTEREXAMPLE_WITNESS` termination policy;
6. for negative closure, checked UNSAT certificates for Boolean branches and a
   checked path for every metric-negative branch;
7. for a counterexample or other positive-realizability consumer, an exact
   witness-construction theorem from the replayed assignment and retained
   source predicates to the source-level geometry;
8. a typed Lean ingress record binding the exact source locator/version/digest,
   qualified declaration and elaborated proposition, hypothesis/quantifier map,
   deliberate semantic deltas, source and ingress bytes, producer, universe,
   certificate, immediate consumer, named final aggregate, repository-local
   transitive import-closure digest, pinned Lean/Lake/toolchain identity,
   repository trust-profile revision, and exact toolchain/import identity used
   for the final build and axiom audit;
9. a rebuild of the named final aggregate after ingress capture, followed by
   recapture of ingress, aggregate, and transitive-closure bytes after replay
   and immediately before atomic publication; any mutation fails closed;
10. a direct on-spine immediate consumer and named final consumer for proof-lane
   work, or the explicitly authorized terminal refutation consumer for
   counterexample work; and
11. an independent promotion verifier, not the author/generator, that rechecks
    statement fidelity, reachability, build, literal axiom closure,
    implementation/external trust, fresh blueprint state, and publication
    integrity.

Until a checked real-algebraic certificate path exists, QF_NRA
`UNSAT_DISCOVERY_ONLY` branches cannot satisfy the negative-closure evidence in
items 5--6. Their proper output is a smaller Lean lemma candidate, a structural
CNF reduction, an exact algebraic certificate candidate, or a remaining open
branch.

Acceptance gate:

- proof-lane promotion records the coordinator-interface frontier before and
  after, immediate constructor fan-out, named residual, and a strict decrease
  of the active plan's well-founded measure;
- counterexample promotion produces a checked exact witness theorem that
  directly refutes the T0 proposition and uses the user-authorized terminal
  goal/status transition; diagnostic mining satisfies neither promotion path;
- every new obligation is load-bearing and directly consumed;
- `lake-build` passes the smallest target and authorized broader gate;
- fresh `proof-blueprint` source/kernel state shows the intended on-spine
  reduction or named terminal refutation consumer;
- the named final consumer's transitive axiom/external-evidence closure matches
  repository policy;
- the final aggregate was rebuilt after ingress capture and the immediately
  pre-publication recapture matches every bound ingress/aggregate/closure byte;
- ingress mutation tests reject ingress bytes, named aggregate bytes,
  declaration/source-path substitution, aggregate import edge, transitive
  import-closure digest, typed parent link, every symmetry/sign/parity branch,
  and post-replay mutation; and
- the durable independent-verifier record binds verifier identity,
  non-authorship, source revision, exact commands/artifacts checked, and final
  verdict. Otherwise report
  `candidate verified by author only — NOT PROMOTED`.

## Test matrix

### Pure generator and schema tests

- Canonical JSON, every structured-hash domain/projection, raw-byte hash
  distinction, exact preimage, stored-newline rule, and self-hash pins.
- Identity determinism under changed runtime clock and whole-manifest
  determinism under a frozen publication object.
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
- Stable original SMT-LIB and normalized journal bytes, normalization version,
  and assertion names.
- Positive/negative fixtures for one-polynomial `eq`, `ge`, `gt`, `ne`, and
  exactly-two-polynomial `or_ne` atoms.
- Frozen relation-grammar rejection for unsupported shapes.
- Separate omitted-atom and omitted-source-hypothesis/predicate ledger
  completeness.
- Source-valid positive and independently justified negative oracle controls.
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
- Lost session-create response reconciliation for zero, one exact, multiple,
  mismatched, and unavailable-listing cases; append-response reconciliation for
  exact pre-state, exact post-state, and divergent state.
- PIQD request-ID same-payload replay and changed-payload conflict across
  process and daemon restart.
- Durable failure seals at every pre-adapter and lifecycle failure stage.
- Duplicate close, close-response loss, authenticated status reconciliation,
  bounded `DELETE` cleanup, and explicit orphan-stop behavior.
- Daemon restart and session reconciliation.
- Conditional static-arm `existing = true` rejection when stored timeout/limits
  differ from the admitted P97 attempt.
- No implicit fallback or second solve.
- Immutable-output replacement and post-write mutation attacks.

### Campaign tests

- Mixed result classes with bounded concurrency.
- Crash/restart at admission, solve, publish, and coverage boundaries.
- Duplicate attempt and changed-limit retry identities.
- Exact attempt-index selection/tie rejection, ordered aggregate IDs, retained
  unselected attempts, and rejection of favorable-retry cherry-picking.
- Missing, duplicate, nonterminal, orphan, conflicting-decisive, stale,
  relabeled, and crossed-cell coverage rejection.
- Partial campaign refusal.
- One-process default plus explicit 2-then-4-process resource/restart canaries.

### CEGAR and promotion tests

- Parent/child refinement chain replay from immutable evaluator, source,
  semantic-contract, and formula bytes.
- Learned-cut semantic evaluator mutation.
- Refusal to learn from rejected or incomplete models.
- Candidate-cut refusal in admitted universes, child waves, and coverage.
- Admitted-cut source-preservation theorem and byte-binding mutations.
- Parent-bound, single-use successor-authorization admission, consumption,
  replay, reuse, revocation, and child-self-authorization tests.
- When the Phase 6 Boolean arm is activated: raw-DIMACS verbatim CNF/manifest
  replay; `timeout_s`/`march_timeout_s` reuse mismatch; requested-core-limit
  identity; malformed-CNF rejection; baked-assumption identity; and absent or
  missing manifest/blob failure.
- CNF/clause-map/LRAT cross-binding.
- Lean ingress source, declaration/source-path, typed-parent, import-edge,
  transitive-closure, aggregate, symmetry/sign/parity branch, toolchain/trust
  profile, post-ingress aggregate rebuild, final-recapture, and self-hash
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
- Never retry a solve after transport loss until the PIQD request ID, expected
  digest, journal frontier, and committed state are reconciled.
- Reconcile a lost session creation only through the attempt-derived unique
  label and authenticated session listing. Zero matches seals failure; one
  exact match recovers its ID; multiple/mismatched/unqueryable matches enter the
  orphan inventory and stop the campaign. Never create a blind replacement.
- Reconcile a lost append only from the persisted pre/post frontier and exact
  exported journal, using a state-guarded append retry solely from exact
  pre-state. Reconcile lost close through known-ID status and bounded `DELETE`;
  unproved cleanup stops the campaign with an orphan record.
- A changed solver, profile, timeout, memory boundary, source revision, or
  encoded journal creates a new attempt identity.
- `INCONCLUSIVE_UNKNOWN` does not trigger automatic fallback.
- Cross-solver checking is a separately declared attempt, not reinterpretation
  of the primary result.
- Static job reuse is rejected when PIQD's stored limits differ from the P97
  admission record, even if PIQD returns the existing job successfully.
- Raw-DIMACS reuse is rejected when either stored timeout differs from the P97
  admission record, even if PIQD returns the existing job successfully.
- A solver disagreement stops the affected campaign stratum and preserves both
  artifacts.
- An exact SAT replay failure is an infrastructure/semantic defect, not a SAT
  witness.
- A coverage defect blocks aggregate publication even when every observed
  solver verdict is favorable.

## Sequencing and ownership

Recommended coherent checkpoints:

1. **T0 target contract:** target mode/polarity, exact statement, hypotheses,
   termination policy, bridge directions, per-branch outcomes, consumers, and
   active authorization.
2. **T1a source-oracle contract:** mode-appropriate independent controls,
   oracle limitations, structural filter, and sample caps.
3. **Schemas and fixtures:** manifest/cell/attempt/result schemas, independent
   tiny universe, validators, and tests.
4. **Geometry producer:** deterministic universe, symmetry, exact polynomial
   ledger, and replay.
5. **PIQD adapter:** fake transport, request-id replay, failure seals, live
   one-process fixture canaries, immutable attempts, and standalone validation.
6. **T1b target feasibility:** the frozen target sample through the minimum
   producer/replay/adapter path with one solver process.
7. **Campaign controller and resource gate:** crash-safe resume, deterministic
   result selection, coverage, retry identities, one-process default, and
   separately qualified concurrency.
8. **Bounded mathematical pilot:** target-matching complete pilot report and
   stop/go decision.
9. **CEGAR/core mining:** authenticated candidate refinements, proof-backed
   admitted cuts, single-use successor authority, and checked Boolean
   certificates where available.
10. **Protocol freeze:** stable specification and optional typed PIQD encoder
   decision.
11. **Lean promotion:** typed finite ingress, directional semantic bridges,
    certificate or exact-witness ingress, named consumer, and independent audit.

Each implementation lane must declare exact owned paths. Do not let a campaign
controller, encoder, and Lean promotion worker edit the same source files in
parallel. PIQD repository changes, if later justified, need a separate session
in that repository; this project must not perform cross-repository git
operations.

## Completion criteria

### Diagnostic census complete

All of the following must hold:

- T0 and T1 pass for a mathematical campaign, or the campaign is explicitly a
  target-neutral fixture with every promotion flag false;
- the immutable finite universe validates independently;
- every declared cell has a retained diagnostic classification;
- every **accepted** SAT witness passes exact semantic replay, while every raw
  SAT with rejected replay remains a distinct retained inconclusive outcome;
- every inconclusive adapter outcome, pre-adapter failure, and diagnostic-only
  UNSAT cell remains explicitly visible;
- every admitted attempt has a complete append-only stage chain or a durable
  nonterminal/failure record, and deterministic result selection preserves all
  unselected attempts;
- the controller survives restart and mints a complete diagnostic coverage
  record;
- resource and hygiene gates pass; and
- the report states the exact abstraction plus separate omitted-atom and
  omitted-source-hypothesis/predicate boundaries.

### Target conclusion complete

Both target modes require T0 and complete T1 for the same non-diagnostic target,
proved directional source bridges, the Phase 8 Lean-ingress/publication gate, a
named final or terminal consumer with accepted transitive trust closure, and an
independent verifier.

For `NEGATIVE_BRANCH_CLOSURE`, all diagnostic-census criteria must also hold:
the universe is exhaustive, every required negative branch has a checked
certificate or Lean proof, and the result strictly reduces the recorded
on-spine frontier measure.

For `COUNTEREXAMPLE_WITNESS`, one retained exact witness theorem may directly
refute the T0 proposition under the authorized terminal goal/status transition.
Under `EXHAUSTIVE`, target conclusion completion also requires complete
diagnostic coverage and an empty unattempted-cell inventory.
Under `FIRST_VALID_WITNESS`, this does **not** require exhaustive diagnostic
coverage: the coverage record remains `INCOMPLETE`, every unattempted cell stays
visible, and no census-completeness claim is made.

`DIAGNOSTIC_OBSTRUCTION_MINING` and target-neutral fixtures have no target
conclusion state. Diagnostic-census and target-mode conclusion states must never
share one undifferentiated `complete` flag.

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

- [`docs/p97-counterexample-search-design-2026-07-28.md`](../p97-counterexample-search-design-2026-07-28.md)
- [`docs/computational-closure-plan-2026-07-28.md`](../computational-closure-plan-2026-07-28.md)
- [`docs/p97-piqd-remaining-solver-onboarding-plan-2026-08-09.md`](../p97-piqd-remaining-solver-onboarding-plan-2026-08-09.md)
- [`docs/piqd-sat-cegar-adoption-gaps-2026-08-08.md`](../piqd-sat-cegar-adoption-gaps-2026-08-08.md)
- [`docs/p97-cegar-wave-framework-consolidation-plan-2026-08-13.md`](../p97-cegar-wave-framework-consolidation-plan-2026-08-13.md)
- [`docs/specs/p97-cegar-wave-v1.md`](../specs/p97-cegar-wave-v1.md)
- [`docs/specs/p97-cegar-campaign-v1.md`](../specs/p97-cegar-campaign-v1.md)
- [`docs/specs/atail-piqd-cvc5-geometry-v1.md`](../specs/atail-piqd-cvc5-geometry-v1.md)
- [`docs/specs/p97-piqd-global-confinement-metric-cvc5-v1.md`](../specs/p97-piqd-global-confinement-metric-cvc5-v1.md)
- [`docs/specs/p97-phase3-survivor-metric-piqd-v1.md`](../specs/p97-phase3-survivor-metric-piqd-v1.md)
- [`false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow_refactor_plan_2026-07-31.md`](../../attic/docs-sweep-2026-08-28/docs/false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow_refactor_plan_2026-07-31.md)

## Change control

This document is a plan, not a protocol specification. Schema names, result
classes, resource thresholds, and module paths become stable only when the
corresponding phase acceptance gate passes and the contract moves to
`docs/specs/`. Update this plan when a gate changes, but record completed run
status in authenticated reports and commit messages rather than appending
solver logs here.
