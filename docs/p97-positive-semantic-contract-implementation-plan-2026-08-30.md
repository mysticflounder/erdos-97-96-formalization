# P97 positive semantic contract implementation plan

Status: implementation plan; no semantic, source-level, or theorem-closure claim

Date: 2026-08-30

Governing specifications:

- [`p97-cegar-semantic-contract-v1`](specs/p97-cegar-semantic-contract-v1.md)
- [`p97-cegar-semantic-contract-v2`](specs/p97-cegar-semantic-contract-v2.md)

## 1. Outcome

Implement the positive semantic contract as a new, independently verified
receipt chain. Do not reinterpret current `projected-static-v3` artifacts as
positive semantic evidence: its global `n = 10`, `k = 4`
`Node | AnnotatedNode` domain and variable map are not currently aligned with
the available arm-indexed Lean CNF domains.

The source-level UNSAT chain is:

```text
source target
  --R1--> valid root abstract target
  --R2--> satisfying root assignment
  --F4/F5 for every refinement--> satisfying terminal assignment
  --checked terminal UNSAT--> contradiction
  --Lean lift and consumer--> exact promoted claim
```

The SAT branch is:

```text
total satisfying assignment
  --R3--> valid decoded abstract target
        |--R4 source witness--> CONCRETE_COUNTEREXAMPLE
        |--universal invalidation + F1-F7--> SPURIOUS_WITH_REFINEMENT
        `--otherwise--> UNRESOLVED_ABSTRACT_MODEL
```

Every positive authority result must be computed from validated artifacts. A
producer-supplied `verified: true`, `supports_*`, or promotion flag is never
evidence.

## 2. Fixed design decisions

1. Use `CANONICAL_PROJECTION_FUNCTION` for the first implementation. A later
   relational mode requires its own complete decoded-object-set and universal
   relation evidence.
2. Give each semantic contract one exact arm, cardinality, source scope,
   formula, decoder, variable map, query, and consumer. Do not inherit evidence
   across waves, arms, cardinalities, or decoder identities.
3. Keep semantic refinements and enumeration-control clauses in separate
   artifact streams and formula buckets.
4. Treat unresolved models as unresolved. A detector label, missing template,
   or model-elimination check cannot classify a model as spurious.
5. Keep PIQD at the raw solver boundary. PIQD owns exact CNF, model, proof,
   execution, and lifecycle custody; the P97 repository owns decoding, source
   realization, F1--F7, survivor discharge, Lean evidence, and promotion.
6. Freeze `projected-static-v3` as custody-only. Use sidecars for shadow
   validation, then introduce a new semantic-enabled profile only after its
   Python and Lean domains are exactly aligned.

## 3. Phase 0: freeze one production scope

Define one lane-specific contract containing:

- `Source` and the exact source hypotheses;
- `SourceTarget`;
- `Abstract`, `AbstractValid`, and `AbstractTarget`;
- `Represents`;
- exact query and polarity;
- one arm, cardinality, and finite or universal scope;
- exact root CNF bytes and variable map;
- canonical semantic projection and decoder; and
- intended Lean lift and consumer.

Do not arbitrarily describe the current projected-static runner as the `xv`,
`bi`, or `u` Card18 arm. The current Python runner has no such arm selector and
its formula domain differs from `Rigid221Card18`.

Recommended production choice: introduce a new profile, provisionally
`projected-static-v4`, generated from or checked against one frozen Lean
encoding descriptor. Retrofitting v3 remains possible only after proving a
typed bridge between the two current domains.

Exit criterion: a reviewed `p97-cegar-semantic-contract/v2` fixture whose
source, formula, projection, decoder, scope, and consumer identities are exact
and immutable.

## 4. Phase 1: artifact and verifier library

Add focused modules under `census/p97_search/`. These names are proposed; they
do not exist at the time of this plan.

- `cegar_producer_ref.py`
- `cegar_semantic_contract.py`
- `cegar_counterexample_assessment.py`
- `cegar_semantic_refinement.py`
- `cegar_survivor_discharge.py`
- `cegar_terminal_promotion.py`
- `cegar_semantic_verifier.py`

Implement these schemas:

- `p97-cegar-producer-ref/v1`;
- `p97-cegar-semantic-contract/v2`;
- `p97-cegar-counterexample-assessment/v2`;
- `p97-cegar-semantic-refinement/v2`;
- proposed `p97-cegar-survivor-discharge/v2`;
- `p97-cegar-terminal-promotion/v2`;
- proposed `p97-cegar-semantic-bundle-index/v1`; and
- a new `p97-cegar-semantic-authority-gate/v2` without changing the meaning of
  the current v1 gate.

Every producer reference must bind:

- Lean declaration or external checker identity;
- normalized statement and hypothesis digests;
- transitive source and import digests;
- repository revision and dirty-state classification;
- toolchain and trust classification;
- exact input digests;
- validation-receipt digest; and
- checked consumer reachability when publication is claimed.

Use strict canonical JSON, exact-key validation, create-once output, and a
digest-addressed receipt graph rooted at the semantic contract. Reject duplicate
JSON keys, unknown fields, malformed hashes, noncanonical serialization,
oversized input, and non-regular or aliased paths.

Exit criterion: every schema has positive construction tests and field-by-field
tamper tests, and no accepted receipt depends on an unvalidated path or caller
boolean.

## 5. Phase 2: independent verification

The structural runner writes candidate artifacts. A separate verifier validates
them and emits create-once accepted receipts. The verifier must independently:

- parse and hash exact bytes;
- replay CNF assignments;
- reconstruct the canonical decoded object;
- validate parent/child formula construction;
- validate the registered Lean or external evidence; and
- recompute the receipt graph and claim classification.

Use a closed checker registry. Certified finite UNSAT must bind the exact
formula, proof, solver, trimming steps, checker binary and version, checker
arguments, output bytes, exit status, and trust classification.

The verifier may consume authenticated producer references, but it must not call
the producer to decide whether that producer was correct. Existing independent
exact-12 validators are the implementation pattern to follow.

Exit criterion: corrupting or monkeypatching the producer cannot cause malformed
evidence to pass the independent verifier.

## 6. Phase 3: positive controls

### 6.1 Tiny complete control

Create a small Lean-backed domain exercising every obligation:

- a valid source and abstract object;
- a canonical encoder and decoder;
- one source-realizable SAT model;
- one valid abstract model with no source realization;
- one universally source-preserving refinement;
- a repaired child bridge;
- one small independently checked terminal UNSAT case; and
- source and abstract survivor-discharge examples.

This control is the first end-to-end positive receipt graph. It proves that the
schema and verifier work; it does not make a P97 theorem claim.

### 6.2 Exact17 partial control

Use Exact17 only as a larger off-spine integration control. Its existing route
provides useful source-CNF custody and some source-to-assignment and
source-preservation producers. It currently lacks a committed R1 producer,
R3, R4, F5, F6, survivor discharge, a terminal `extendedCnf_unsat` artifact,
and live-spine consumption. Its receipts must report those obligations as
unavailable.

### 6.3 Exact-12 finite-proof control

Use the existing exact-12 terminal cells to exercise finite proof custody and
Lean ingress. They do not yet provide aggregate case coverage or a live
aggregate consumer and therefore cannot demonstrate source or theorem closure.

Exit criterion: the tiny control passes end to end, while Exact17 and exact-12
controls report their intentionally limited claim scopes accurately.

## 7. Phase 4: production Lean root bridge

For the frozen production scope, add a public Lean semantic-bridge module that
defines:

- `Source` and `SourceTarget`;
- `Abstract`, `AbstractValid`, and `AbstractTarget`;
- `Represents`;
- `Encode` and `DecodeSem`;
- complete semantic projection; and
- exact formula satisfaction.

Prove public producers for:

- R1: every source target constructs a valid target abstract object and a
  `Represents` witness;
- R2: every valid abstract target constructs a total root assignment satisfying
  the exact formula and decoding back to that object;
- R3: every satisfying total assignment's canonical decode is valid and
  satisfies `AbstractTarget`; and
- R4: only where justified, a concrete SAT assessment constructs an exact source
  witness represented by the decoded object.

Existing Card18 candidates include `source_to_abstract_packet`,
`valid_extends_to_model`, and `model_decodes_to_valid`, but they do not yet
discharge this interface. The source theorem lacks a public `Represents`
result, and the decoder theorem returns an existential packet instead of the
required public canonical decode result.

Record each accepted declaration through `p97-cegar-producer-ref/v1`. Run
targeted Lean builds, axiom audits, producer/consumer searches, and
`proof-blueprint verify-publish`. These declarations may contain no `sorry` and
may depend only on approved trust.

Exit criterion: R1--R3 validate for the exact contract identity. R4 is either
validated or explicitly unavailable; without R4, SAT remains unresolved rather
than concrete.

## 8. Phase 5: shadow SAT assessment

Extend `phase3_structural_cegar_projected_static_v3.py` in shadow mode with:

- `semantic-contract.json`;
- `sat-assessments.jsonl`;
- `semantic-refinements.jsonl`;
- `survivor-discharges.jsonl`; and
- `semantic-index.json`.

Integration order:

1. Construct or load the semantic sidecar after the existing canonical decoder
   contract.
2. After total model replay and canonical decoding, emit exactly one assessment.
3. Validate every receipt stream on resume.
4. Bind stream heads and counts into the run manifest.
5. Recompute all assessments during offline replay.

Current detector results must default to `UNRESOLVED_ABSTRACT_MODEL`. Existing
learned clauses remain `LEARNED_CANDIDATE`; projection blocks remain
`ENUMERATION_CONTROL`. Shadow mode leaves every positive authority claim false.

Exit criterion: historical v3 runs replay byte-for-byte, every sidecar binds the
exact existing wave-manifest digest, and any shadow mismatch blocks promotion.

## 9. Phase 6: F1--F7 semantic refinement

For a proposed refinement `r`, validate every obligation independently.

| Obligation | Required result |
|---|---|
| F1 | Exact parent formula, variable map, semantic contract, model, and decoder custody |
| F2 | Exact append or authenticated reconstruction; semantic and enumeration buckets remain separate |
| F3 | The current total model falsifies `r` |
| F4 | A checked producer proves every admitted source-derived assignment satisfies `r` |
| F5 | Repaired child target plus source-to-child, child-to-assignment, and assignment-to-valid-child producers |
| F6 | Invalidating witness, theorem instance, variable map, model, and compiled clause are the same objects |
| F7 | Strict progress; any larger excluded family has a checked description and coverage proof |

The existing `phase3_piqd_postwave_gate.py` can supply much of the F1--F3
custody, but it cannot supply F4 or F5.

Only an independently accepted receipt may classify a candidate clause as
`SEMANTIC_REFINEMENT`. Preserve the original candidate journal unchanged.

Exit criterion: at least one real refinement is accepted, excludes its
triggering model, preserves every source target in scope, and has a checked
child bridge.

## 10. Phase 7: survivor accounting and discharge

Every unresolved assignment creates an immutable survivor entry binding:

- contract, arm, parent formula, model, and decoded-object digests;
- complete semantic projection;
- included and omitted variables;
- the whole auxiliary-completion family represented by the projection block;
- enumeration clause; and
- journal position.

Discharge is append-only:

- `SOURCE_DISCHARGE` proves no source target reaches the complete blocked family.
- `ABSTRACT_DISCHARGE` proves no valid child abstract target is encoded in that
  family, or links an accepted F1--F7 refinement covering the whole family.

Reject a source discharge when abstract-level promotion is requested.

Exit criterion: the verifier accounts for every survivor exactly once and
rejects missing, crossed, duplicate, or incorrectly scoped discharges.

## 11. Phase 8: terminal and aggregate promotion

Build the terminal receipt only after solver completion. It must bind:

- exact terminal CNF;
- independently checked UNSAT proof;
- root semantic contract and bridge producers;
- ordered F1--F7 refinement chain;
- complete survivor ledger and appropriate discharges;
- exact arm identity;
- lift theorem and final consumer; and
- exact promoted claim classification.

For split searches, add an aggregate coverage producer proving that every
admitted source target enters a named arm. The aggregate receipt binds every
required arm exactly once and rejects missing, duplicate, or crossed receipts.

The existing exact-12 six-arm ingress is a useful prerequisite but is not
complete aggregate coverage. A new aggregate Lean module must consume the arm
terminal facts and be imported by the live `FrontierLiveClosure` chain. Final
theorem promotion must reach `Problem97.erdos97_rhs`, not merely create a
standalone finite theorem.

Exit criterion: certified finite UNSAT, abstract-scope closure, source-scope
closure, and theorem closure are reported as distinct derived claims.

## 12. Phase 9: enable positive authority

Update semantic authority only after the independent verifier can traverse the
complete receipt graph. The v2 authority gate derives separate statuses for:

- valid abstract SAT model;
- concrete source counterexample;
- accepted semantic refinement;
- certified finite UNSAT;
- no valid terminal abstract target;
- no source target in the exact contract scope; and
- named Lean consumer reached.

Positive booleans are permitted as derived output accompanied by the receipt
root that establishes them. They are never accepted as input.

## 13. Test plan

Required adversarial mutations include:

- every contract, hash, arm, scope, model, map, decoder, producer, and consumer
  field;
- cross-contract, cross-arm, cross-wave, and cross-cardinality swaps;
- partial assignments and auxiliary substitutions;
- parent-clause deletion, reordering, preprocessing, and duplicate drift;
- a refinement clause still satisfied by the triggering model;
- detector evidence substituted for universal F4 evidence;
- F5 connection to a different decoded object;
- witness, theorem-instance, or compiled-clause mismatch under F6;
- claimed family progress without checked family coverage;
- enumeration blocks presented as semantic refinements;
- source discharge used for abstract promotion;
- missing, duplicate, or crossed survivor receipts;
- missing, duplicate, or crossed aggregate arms;
- duplicate JSON keys, unknown fields, noncanonical JSON, and malformed hashes;
- symlink, hardlink, path replacement, FIFO, and source-mutation races;
- stale CNF, model, proof, checker, lift, or consumer bytes; and
- caller-controlled verifier results or success booleans.

CI tiers:

1. Every PR: schema, hashing, canonical decoder, migration, and mutation tests.
2. Every PR: offline journal replay and synthetic PIQD fixtures.
3. Protected semantic gate: tiny R1--R4/F1--F7 controls and independent
   verifier tests.
4. Nightly or release: historical bundle replay, exact source-manifest
   validation, DRAT replay, and shadow comparison.
5. Promotion-only: production Lean bridge, aggregate lift, consumer
   reachability, and complete terminal receipt validation.

## 14. Migration and rollout

1. Preserve every existing v1/v3 artifact byte-for-byte.
2. Authenticate the complete legacy chain before writing a v2 sidecar.
3. Bind the legacy manifest digest and new semantic-contract digest in an
   explicit cross-record.
4. Never infer missing v2 evidence from legacy custody fields.
5. Publish sidecars and migrated receipts to fresh create-once paths.
6. Run legacy and semantic replay over the same authenticated offline bundle.
7. Record `SHADOW_MISMATCH` and block promotion on any divergence.
8. Enable accepted semantic assessments while authority remains blocked.
9. Enable one explicitly scoped positive production pilot.
10. Run historical replay and a rollback drill before making the new profile
    the default.

Rollback disables v2 authority without rewriting or deleting published
artifacts. Legacy replay remains available and byte-identical. A failed pilot
uses a fresh campaign identity rather than repairing an existing receipt.

## 15. Workstreams and dependency order

The implementation can proceed in parallel across four owned workstreams:

1. Python schemas, receipt graph, and independent verifier.
2. Lean source/abstract/encoding bridge and producer publication.
3. Runner shadow integration, assessment, refinement, and survivor journals.
4. Terminal proof validation, aggregate coverage, Lean ingress, and CI.

Workstreams 1 and 2 start first. Workstream 3 depends on the stable schemas from
workstream 1. Semantic refinement activation depends on the Lean producers from
workstream 2. Terminal promotion depends on all three. Positive authority is the
last change.

## 16. Definition of done

The positive semantic contract is implemented for a claim only when:

1. its exact semantic-contract identity is frozen;
2. all claim-relevant R1--R4 and F1--F7 producers validate;
3. each SAT result has exactly one justified disposition;
4. every learned semantic clause has an accepted refinement receipt;
5. every unresolved survivor has the discharge required by the promoted claim;
6. the terminal CNF and proof independently replay;
7. every arm and aggregate case is covered where the claim is split;
8. the named Lean lift and consumer validate and are on the live publication
   path;
9. the v2 authority gate derives the exact positive claim from the accepted
   receipt graph; and
10. historical replay, adversarial mutations, and rollback tests all pass.

Until all applicable conditions hold, the strongest honest result remains the
appropriate finite-local, custody-only, unresolved, or off-spine status.
