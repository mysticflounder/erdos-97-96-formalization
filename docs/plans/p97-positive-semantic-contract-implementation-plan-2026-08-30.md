# P97 positive semantic contract implementation plan

Status: implementation plan; no semantic, source-level, or theorem-closure claim

Date: 2026-08-30

Governing specifications:

- [`p97-cegar-semantic-contract-v1`](../specs/p97-cegar-semantic-contract-v1.md)
- [`p97-cegar-semantic-contract-v2`](../specs/p97-cegar-semantic-contract-v2.md)

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
solver-reported SAT assignment
  |--fails totality, replay, decode, or validity--> INVALID_ENCODING_MODEL
  `--passes exact model validation
       --R3--> valid decoded abstract target
              |--R4 source witness--> CONCRETE_COUNTEREXAMPLE
              |--universal invalidation + F1-F7--> SPURIOUS_WITH_REFINEMENT
              `--otherwise--> UNRESOLVED_ABSTRACT_MODEL
```

Every positive authority result must be computed from validated artifacts. A
producer-supplied `verified: true`, `supports_*`, or promotion flag is never
evidence.

For P97 production campaigns, only the new v4 profile may emit accepted
semantic-assessment, refinement, survivor, terminal, or promotion receipts.
V3 may emit authenticated shadow candidates, but every semantic claim remains
false. Registered Phase 3 controls remain separate diagnostic fixtures.

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
   validation. Build a new semantic-enabled profile beside v3 only after its
   Python and Lean domains are exactly aligned; do not replace or reinterpret
   completed v3 runs.

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

Production choice: introduce a new profile, provisionally
`projected-static-v4`, beside v3. Generate it from, or check it byte-for-byte
against, one frozen Lean encoding descriptor. Retrofitting v3 remains possible
only after proving a typed bridge between the two current domains.

Phase 0 freezes a reviewed contract-input record, marked
`DRAFT_NOT_AUTHORITATIVE`, whose source, formula, projection, decoder, scope,
and intended consumer identities are exact. It is not yet a
`p97-cegar-semantic-contract/v2` receipt: that schema requires accepted R1--R3
producer references, which are Phase 4 outputs.

The frozen draft schema is `p97-cegar-semantic-contract-input/v1`, implemented
by `census/p97_search/cegar_semantic_contract.py` and specified in Section 8
of the v2 contract specification. It has a closed one-arm shape, permits only
`CANONICAL_PROJECTION_FUNCTION`, forbids aggregate coverage, and derives the
exact input-digest list for each producer role from a closed dependency matrix.
Its R1--R3 records state the quantified obligations and desired producer
identities; they do not claim that a producer has been resolved, run, or
accepted. The future accepted producer reference's `input_digests` must equal
the draft requirement's derived `dependency_bindings`.

`contract_id` hashes the complete draft identity excluding only the two
top-level hash fields. `contract_input_sha256` hashes that same object with the
derived `contract_id` present, excluding only itself. Requirement and root-
obligation self-hashes exclude only their respective self-hash fields. All
structured preimages use canonical JSON without the storage newline; stored
artifacts use canonical JSON with exactly one final newline and create-once,
no-follow regular-file custody.

Production instantiation is separate from implementing this schema and requires
the selected v4 source/encoding descriptor plus real producer requirements.
The Phase-0 module provides no authoritative v2 builder, validator, or
publisher.

Exit criterion: the draft identity is immutable and sufficient to state the
R1--R3 obligations without circularity. The authoritative v2 receipt is issued
only at the end of Phase 4.

## 4. Phase 1: artifact and verifier library

Add focused modules under `census/p97_search/`. The producer-reference, Lean
declaration-export, and Phase-0 contract-input modules now exist; the remaining
names are planned.

- `cegar_producer_ref.py`
- `cegar_lean_declaration_export.py`
- `cegar_semantic_contract.py`
- `cegar_counterexample_assessment.py`
- `cegar_semantic_refinement.py`
- `cegar_survivor_discharge.py`
- `cegar_terminal_promotion.py`
- `cegar_semantic_verifier.py`

Implement these schemas. `p97-cegar-semantic-contract/v2` is already used as a
governing identifier by the decoder and authority modules. The separate
Phase-0 input schema is implemented first so draft identity cannot be confused
with accepted v2 evidence. The authoritative v2 parser, builder, validator,
and publisher are added only with the Phase-4 resolver and accepted R1--R3
producer references.

- `p97-cegar-producer-ref/v1`;
- `p97-cegar-lean-declaration-receipt/v1`;
- `p97-cegar-semantic-contract-input/v1`;
- `p97-cegar-semantic-contract/v2`;
- `p97-cegar-counterexample-assessment/v2`;
- `p97-cegar-semantic-refinement/v2`;
- proposed `p97-cegar-survivor-discharge/v2`;
- `p97-cegar-terminal-promotion/v2`;
- proposed `p97-cegar-semantic-bundle-index/v1`; and
- a new `p97-cegar-semantic-authority-gate/v2` without changing the meaning of
  the current v1 gate.

`p97-cegar-terminal-promotion/v2` is the v2 successor to the historical
`p97-cegar-semantic-terminal/v1` schema. Keep the v1 schema unchanged and record
the successor relation in v2 and the wave-contract documentation. The
survivor-discharge and bundle-index schema names remain unfrozen design inputs
until their owning phases are reviewed.

Phase 1 may parse and build the immutable Phase 0 draft input, but its
authoritative contract machinery must not exist as a draft-only shortcut and
must reject issuance until accepted R1--R3 producer references are present.
The counterexample-assessment schema
enumerates exactly `INVALID_ENCODING_MODEL`, `CONCRETE_COUNTEREXAMPLE`,
`SPURIOUS_WITH_REFINEMENT`, and `UNRESOLVED_ABSTRACT_MODEL`.

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

Lean producer validation uses the closed-registry
`cegar_lean_declaration_export.py` driver and a pinned `lake env lean`
toolchain, not a theorem-name string. The exporter elaborates the fully
qualified declaration and emits
`p97-cegar-lean-declaration-receipt/v1`, whose versioned canonical payload
serializes the elaborated type, universe levels, constants, hypotheses, and
imports. The receipt binds the serializer source, exact Lean/Lake toolchain,
and output digest. Its trust boundary is the Lean kernel, pinned toolchain, and
the small canonical serializer; the independent verifier invokes that exact
registry entry rather than accepting producer-supplied output. Stability is
required within the pinned toolchain, not across unrelated toolchains. A
separate proof-blueprint check establishes declaration existence,
final-consumer reachability, spine freshness, and axiom closure.
`proof-blueprint verify-publish` is a publication gate; it is not itself the
statement-receipt generator.

Use a closed checker registry. Certified finite UNSAT must bind the exact
formula, proof, solver, trimming steps, checker binary and version, checker
arguments, output bytes, exit status, and trust classification.

PIQD's `piqd_checked` receipt remains solver/proof custody. The P97 verifier
replays the proof through its own closed checker registry before granting finite
UNSAT authority.

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

This control is the first end-to-end positive receipt graph. Put its Lean module
off the publication spine and register it as deliberate diagnostic
infrastructure. It proves that the schema and verifier work; it does not make a
P97 theorem claim.

### 6.2 Exact17 partial control

Use the base Exact17 `extendedCnf` route only as a larger off-spine integration
control. It provides useful source-CNF custody and some source-to-assignment and
source-preservation producers. That base route currently lacks a committed R1
producer, R3, R4, F5, F6, survivor discharge, a terminal
`extendedCnf_unsat` artifact, and live-spine consumption. Other Exact17 child
routes have separate terminal adapters and must not be collapsed into this
claim. Base-route receipts report the missing obligations as unavailable.

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

`DecodeSem` must be a total function on every complete authenticated semantic
projection. The recommended interface reconstructs a raw abstract object for
every projection and lets `AbstractValid` reject malformed objects; R3 then
proves that projections of satisfying assignments decode to valid targets. A
proof-parameterized decoder such as the current `decodeBase` is not the public
canonical decoder. Using a well-formed-projection subtype instead requires an
explicit successor contract and projection producer.

Strict assignment totality and exact formula replay precede canonical decode.
A malformed assignment or projection produces `INVALID_ENCODING_MODEL`; it is
never evidence for a refinement or survivor.

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

Before v2 issuance, an independent resolver receives the expected Phase-0
`contract_id` and `contract_input_sha256` from the authenticated lane manifest;
loading a self-consistent draft from a path is not enough. For every role, it
must resolve one accepted `p97-cegar-producer-ref/v1` and compare the complete
requirement: typed producer identity, normalized statement, hypothesis,
imports, transitive source, repository-policy result, toolchain, trust-registry
entry, validation-receipt schema and digest, and reachability-policy result.
The producer reference's sorted `input_digests` must equal the requirement's
derived `dependency_bindings` by both name and digest, with no added, omitted,
or renamed input. Matching only a role name, declaration name, or dependency
name set is insufficient.

Record each accepted declaration through `p97-cegar-producer-ref/v1`. Run
targeted Lean builds, axiom audits, producer/consumer searches, and
`proof-blueprint verify-publish`. These declarations may contain no `sorry` and
may depend only on approved trust.

Exit criterion: R1--R3 validate for the exact contract identity. R4 is either
validated or explicitly unavailable; without R4, SAT remains unresolved rather
than concrete. The verifier then emits the first authoritative
`p97-cegar-semantic-contract/v2` receipt from the frozen Phase 0 identity and
these accepted producers. Card18 bridge modules remain off-spine until a named
aggregate import and consumer reach `Problem97.erdos97_rhs`.

## 8. Phase 5: shadow SAT assessment

Extend `phase3_structural_cegar_projected_static_v3.py` in shadow mode with:

- `semantic-contract.json`;
- `sat-assessments.jsonl`;
- `semantic-refinements.jsonl`;
- `survivor-discharges.jsonl`; and
- `semantic-index.json`.

When a semantic sidecar is present, the canonical decoder contract, projection
block contract, semantic-contract digest, and authority-gate receipt are all
mandatory. Their absence remains allowed only on the explicit legacy v3 replay
path, where every semantic claim stays false.

Integration order:

1. Construct or load the semantic sidecar after the existing canonical decoder
   contract.
2. For every solver-reported SAT result, first enforce one Boolean value for
   every formula variable and reject missing, duplicate, conflicting, or
   out-of-range literals. Emit `INVALID_ENCODING_MODEL` on any totality,
   formula-replay, decode, or abstract-validity failure; do not run detectors or
   learn a clause from that result.
3. After successful model validation and canonical decoding, emit exactly one of
   the other three assessments.
4. Validate every receipt stream on resume.
5. Bind stream heads and counts into the run manifest.
6. Recompute all assessments during offline replay.

An invalid-encoding assessment terminates processing of that solver result and
never enters a refinement or survivor stream. V3 shadow files may record
authenticated candidate assessments, but only v4 can receive accepted semantic
receipts.

Current detector results must default to `UNRESOLVED_ABSTRACT_MODEL`. Existing
learned clauses remain `LEARNED_CANDIDATE`; projection blocks remain
`ENUMERATION_CONTROL`. Shadow mode leaves every positive authority claim false.

Exit criterion: historical v3 runs replay byte-for-byte, every sidecar binds the
exact existing wave-manifest digest, and any shadow mismatch blocks promotion.

## 9. Phase 6: contract-aligned production profile

Build `projected-static-v4` beside the frozen v3 profile. V3 remains available
for byte-identical custody replay and diagnostic comparison; it is never
reinterpreted as the typed production profile and cannot acquire positive
semantic authority through a sidecar alone.

The v4 builder must:

- consume the exact Phase 0 contract identity and the authoritative Phase 4
  `p97-cegar-semantic-contract/v2` receipt;
- produce DIMACS bytes from the declared Lean `armCnf a` export, or emit an
  independently checked translation receipt proving those bytes identical to
  the declared export;
- bind the complete variable map to `encodeBase` and the total canonical
  `DecodeSem` chosen in Phase 4;
- preserve the semantic projection, auxiliary-completion family, and arm
  identity in the run manifest; and
- reject every solver model that does not assign each formula variable exactly
  once or that fails formula replay, decoding, or abstract validity.

Do not accept a v4 campaign that merely wraps a v3 CNF and decoder contract in
new metadata. The profile boundary is the checked Lean encoding, variable map,
total decoder, and authoritative contract receipt together.

Exit criterion: for one production root formula, checked round trips validate
both source-to-model and valid-model-to-abstract directions against the same
bytes and variable map. The campaign may then enter refinement, but positive
authority remains disabled.

## 10. Phase 7: F1--F7 semantic refinement

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
Measure every acceptance criterion on v4. Legacy v3 candidates remain
diagnostic or custody-only and cannot be promoted by the v4 verifier.

Exit criterion: at least one real refinement is accepted, excludes its
triggering model, preserves every source target in scope, and has a checked
child bridge.

## 11. Phase 8: survivor accounting and discharge

Every unresolved assignment creates an immutable survivor entry binding:

- contract, arm, parent formula, model, and decoded-object digests;
- complete semantic projection;
- included and omitted variables;
- the whole auxiliary-completion family represented by the projection block;
- enumeration clause; and
- journal position.

Authoritative survivor accounting is a v4 operation. A v3 survivor sidecar may
be replayed for diagnostics, but cannot discharge a v4 family or positive
claim.

Only a valid, canonically decoded `UNRESOLVED_ABSTRACT_MODEL` may create a
survivor entry. `INVALID_ENCODING_MODEL` is terminal evidence of a broken
solver/encoding boundary, not a represented auxiliary-completion family.

Discharge is append-only:

- `SOURCE_DISCHARGE` proves no source target reaches the complete blocked family.
- `ABSTRACT_DISCHARGE` proves no valid child abstract target is encoded in that
  family, or links an accepted F1--F7 refinement covering the whole family.

Reject a source discharge when abstract-level promotion is requested.

Exit criterion: the verifier accounts for every survivor exactly once and
rejects missing, crossed, duplicate, or incorrectly scoped discharges.

## 12. Phase 9: terminal and aggregate promotion

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

Inventory every consumer capable of reporting terminal, aggregate, or theorem
promotion. On the v4 path, each such consumer must require and independently
validate the v2 authority-gate receipt and its exact receipt-root digest before
emitting a positive status.
Benchmark, replay, and other diagnostic consumers may omit the gate only when
their output schema is structurally limited to custody or finite-local claims.
Legacy v3 support is optional compatibility and is never an accepted promotion
route.

Exit criterion: certified finite UNSAT, abstract-scope closure, source-scope
closure, and theorem closure are reported as distinct derived claims.

## 13. Phase 10: enable positive authority

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

Reject any positive result when a promotion-capable consumer bypasses,
substitutes, or only copies the authority gate. Consumer validators are
versioned members of the accepted receipt graph.
Draft identities, v3 custody, invalid encoding results, and missing evidence
are structurally incapable of deriving positive authority.

## 14. Test plan

Required adversarial mutations include:

- the Phase-0 input's fixed draft status, schema pointers, paired Lean-consumer
  requirements, and one-arm aggregate prohibition;
- every Phase-0 producer requirement at its exact role location, including the
  closed dependency-name matrix and its future `input_digests` conversion;
- requirement, root-obligation, contract-identity, and stored-input hash
  preimages, including role swaps and forbidden hash cycles;
- every contract, hash, arm, scope, model, map, decoder, producer, and consumer
  field;
- cross-contract, cross-arm, cross-wave, and cross-cardinality swaps;
- partial assignments, duplicate or conflicting literals, out-of-range
  variables, and auxiliary substitutions;
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
- caller-controlled verifier results or success booleans;
- a changed Lean declaration, serializer version, or pinned toolchain under an
  otherwise unchanged producer reference;
- a missing, copied, replaced, or unvalidated authority-gate receipt at every
  promotion-capable consumer; and
- a legacy or diagnostic consumer attempting to emit a v4 positive claim.

CI tiers:

1. Every PR: schema, hashing, canonical decoder, migration, and mutation tests.
2. Every PR: offline journal replay and synthetic PIQD fixtures.
3. Protected semantic gate: tiny R1--R4/F1--F7 controls and independent
   verifier tests.
4. Nightly or release: historical bundle replay, exact source-manifest
   validation, DRAT replay, and shadow comparison.
5. Promotion-only: production Lean bridge, aggregate lift, consumer
   reachability, and complete terminal receipt validation.

## 15. Migration and rollout

1. Preserve every existing v1/v3 artifact byte-for-byte.
2. Authenticate the complete legacy chain before writing a v2 sidecar.
3. Bind the legacy manifest digest and new semantic-contract digest in an
   explicit cross-record.
4. Never infer missing v2 evidence from legacy custody fields.
5. Publish sidecars and migrated receipts to fresh create-once paths. Create a
   fresh v4 campaign and authoritative receipt; never mutate a draft or legacy
   custody record into one.
6. Run legacy and semantic replay over the same authenticated offline bundle.
7. Record `SHADOW_MISMATCH` and block promotion on any divergence.
8. Inventory and gate every promotion-capable consumer; constrain all ungated
   consumers to custody or finite-local output schemas.
9. Build and validate the v4 production profile while v3 remains the replay
   baseline.
10. Enable accepted v4 semantic assessments while authority remains blocked.
11. Enable one explicitly scoped positive v4 production pilot.
12. Run historical replay and a rollback drill before making the new profile
    the default.

Rollback disables v2 authority without rewriting or deleting published
artifacts. Legacy replay remains available and byte-identical. A failed pilot
uses a fresh campaign identity rather than repairing an existing receipt.

## 16. Workstreams and dependency order

The implementation can proceed in parallel across five owned workstreams:

1. Python schemas, receipt graph, and independent verifier.
2. Lean source/abstract/encoding bridge and producer publication.
3. Runner shadow integration, assessment, and migration replay.
4. V4 production encoder, checked variable map, model parser, refinement, and
   survivor journals.
5. Terminal proof validation, consumer gating, aggregate coverage, Lean
   ingress, and CI.

Workstreams 1 and 2 start first. Workstream 3 depends on stable schemas from
workstream 1. Workstream 4 depends on both stable schemas and accepted Lean
producers. Workstream 5 may inventory consumers early, but terminal promotion
depends on the first four workstreams. Positive authority is the last change.

## 17. Definition of done

The positive semantic contract is implemented for a claim only when:

1. its exact semantic-contract identity is frozen;
2. its v4 formula bytes, variable map, and total canonical decoder validate
   against the accepted Lean encoding producer;
3. all claim-relevant R1--R4 and F1--F7 producers validate;
4. each SAT result has exactly one justified disposition, including strict
   `INVALID_ENCODING_MODEL` handling;
5. every learned semantic clause has an accepted refinement receipt;
6. every unresolved survivor has the discharge required by the promoted claim;
7. the terminal CNF and proof independently replay;
8. every arm and aggregate case is covered where the claim is split;
9. the named Lean lift and consumer validate and are on the live publication
   path;
10. every promotion-capable consumer validates the v2 authority gate, which
    derives the exact positive claim from the accepted receipt graph; and
11. historical replay, adversarial mutations, and rollback tests all pass.

Until all applicable conditions hold, the strongest honest result remains the
appropriate finite-local, custody-only, unresolved, or off-spine status.
