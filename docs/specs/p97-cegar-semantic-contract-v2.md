# P97 CEGAR semantic contract v2

Status: design contract, canonical-decoder custody, and frozen
non-authoritative Phase-0 input schema; no R1--R3, F1--F7,
source-realization, abstract-closure, or theorem-closure claim.

Date: 2026-08-29

Phase-0 input-schema amendment: 2026-08-31

This successor retains the claim boundary and every obligation of
`p97-cegar-semantic-contract/v1`, except where this document replaces decoder
semantics, model disposition, child decoding, survivor discharge, and receipt
fields. The change prevents one Boolean assignment from being classified by a
selected member of an incompletely specified decode relation.

## 1. Decoder modes

Each semantic contract selects exactly one decoder mode and binds the mode,
producer, input domain, output identity, and required evidence into its digest.

### 1.1 `CANONICAL_PROJECTION_FUNCTION`

Let `m` be a total assignment of the authenticated formula and let `q(m)` be
its complete projection onto the contract's semantic variables. The contract
defines one function

```text
DecodeSem : CompleteSemanticProjection -> Abstract
Decode m := DecodeSem (q(m)).
```

The projection map is part of the contract identity. Two total assignments
with the same semantic projection produce the same abstract object. Auxiliary
variables may admit several satisfying completions; they do not select among
abstract objects.

If a compatibility relation `Decodes m a` is exposed, the contract supplies a
checked producer for

```text
Decodes m a exactly when a = Decode m.
```

`DecodeSem` may be implemented only on complete semantic projections, but R3
is quantified over total formula assignments and applies it after `q`.

### 1.2 `RELATIONAL_ALL_DECODINGS`

`Decodes m a` denotes the complete decode relation. R3 supplies both a decoded
object for each admitted satisfying assignment and the required property for
every related object. Downstream obligations cannot select one related object
unless their conclusion is existential and the selected object carries its
own checked witness.

## 2. Replacement R3

For every total assignment `m` satisfying the formula in the admitted arm and
scope, the selected decoder mode discharges one branch.

For `CANONICAL_PROJECTION_FUNCTION`:

```text
AbstractValid (Decode m)
AbstractTarget (Decode m).
```

For `RELATIONAL_ALL_DECODINGS`:

```text
there exists a with Decodes m a;
for every a, Decodes m a implies AbstractValid a and AbstractTarget a.
```

Decoder functionality custody does not discharge R3. R3 additionally proves
that every admitted satisfying assignment produces a valid target object.

## 3. Counterexample assessment

`CONCRETE_COUNTEREXAMPLE` requires a decoded object `a`, a source witness `c`,
and the named query consumer, with

```text
Decodes m a
Source Γ c
SourceTarget c
Represents c a.
```

In canonical mode, `a` is `Decode m`. In relational mode, the concrete result
may select one `a` because its source witness is checked for that object.

`SPURIOUS_WITH_REFINEMENT` is assignment-wide. In canonical mode, the
invalidating witness proves

```text
for every c : Source Γ,
  SourceTarget c implies not Represents c (Decode m).
```

In relational mode, it proves the same source invalidation for every `a` with
`Decodes m a`. Evidence covering only one relational decoding leaves the
assignment unresolved.

## 4. Replacement F5

For every valid child abstract target `a`, the child producer constructs a
total assignment `m` satisfying the child formula and connects that assignment
back to the same `a`:

```text
CANONICAL_PROJECTION_FUNCTION: DecodeChild m = a
RELATIONAL_ALL_DECODINGS:      DecodesChild m a.
```

For every total assignment satisfying the child formula, canonical mode proves
that `DecodeChild m` is valid and satisfies `ChildTarget`. Relational mode
proves that at least one child object is decoded and that every decoded child
object is valid and satisfies `ChildTarget`.

Any child-to-parent projection is checked for the canonical child object or
for every child object in the relational decode set. Changing decoder mode,
semantic projection, reconstruction policy, or output identity creates a new
semantic-contract identity and requires new root-bridge evidence.

## 5. Survivor discharge

Let `B(q)` be the complete assignment family represented by a stored
projection block, including every admitted auxiliary completion.

`SOURCE_DISCHARGE` proves that no source target can enter `B(q)` through the
accepted source-to-abstract-to-assignment bridge. In relational mode its
evidence covers every `m` in `B(q)` and every `a` with `DecodesChild m a`.

`ABSTRACT_DISCHARGE` proves that no valid child abstract target has an accepted
encoding in `B(q)`, or supplies an F1--F7 refinement whose exclusion proof
covers the complete blocked family. In relational mode the direct form covers
every `m` in `B(q)` and every related child object. A source-only discharge
does not support abstract-level promotion.

## 6. Required v2 receipt fields

Schema `p97-cegar-semantic-contract/v2` adds these required encoding fields to
the v1 payload:

```json
{
  "decoder_mode": "CANONICAL_PROJECTION_FUNCTION or RELATIONAL_ALL_DECODINGS",
  "decoder_input_domain": "typed domain",
  "formula_to_decoder_projection": {"producer_ref_sha256": "sha256"},
  "decoder_producer": {"producer_ref_sha256": "sha256"},
  "decoder_evidence": {"producer_ref_sha256": "sha256"},
  "decoded_object_identity": {"identity_policy_sha256": "sha256"}
}
```

Schema `p97-cegar-counterexample-assessment/v2` records one decoded-object
digest in canonical mode. Relational mode records a complete decoded-object-set
digest or a universal relation proof; a sample is not completeness evidence.

Schema `p97-cegar-semantic-refinement/v2` binds the child decoder mode,
producer, evidence, and F5 connection to the child object. Schema
`p97-cegar-terminal-promotion/v2` binds survivor receipts whose quantifier
scope covers the complete blocked family and every relational decoding.

## 7. Current projected-static-v3 enforcement

Current maintained runs publish `p97-cegar-canonical-decoder/v1` in every run
manifest. The receipt binds the semantic and auxiliary variable maps and the
following reconstruction:

- shells from the `s[p,q]` semantic variables;
- projected blocker center `c[x]` as the least incoming shell center;
- fixed cap carrier `M = {0,1,2}` and cap map from `f[x,i]`; and
- node or annotated-node content digest as output identity.

The projection, reconstruction, and independent comparison checker each carry
a typed Python custody-producer reference binding the callable, statement
digest, source digest, and toolchain. These external runtime references support
custody replay only and explicitly support no semantic discharge.

Every live and replayed SAT classification independently reconstructs this
object, compares it with the implementation decoder, and validates semantic
readback. PIQD model and canonical-bank replay uses the same boundary. The
receipt states that auxiliary values are ignored and that one complete
semantic projection produces one object.

This is decoder-functionality custody only. The receipt carries null R3, F5,
source-realization, and survivor-discharge evidence, and the semantic authority
gate continues to block source, abstract, and theorem promotion.

## 8. Frozen Phase-0 contract input

Phase 0 uses the separate schema
`p97-cegar-semantic-contract-input/v1`. Its only permitted status is
`DRAFT_NOT_AUTHORITATIVE`. It names
`p97-cegar-semantic-contract/v2` in `authoritative_schema`, but it is not a v2
receipt, an accepted producer reference, or evidence for R1--R3. No validator
or consumer may treat successful parsing of this input as semantic authority.
The executable schema is
`census/p97_search/cegar_semantic_contract.py`.

### 8.1 Exact closed shape

The top-level object has exactly these fields:

| Field | Required value or type |
| --- | --- |
| `schema` | `p97-cegar-semantic-contract-input/v1` |
| `status` | `DRAFT_NOT_AUTHORITATIVE` |
| `authoritative_schema` | `p97-cegar-semantic-contract/v2` |
| `producer_ref_schema` | `p97-cegar-producer-ref/v1` |
| `contract_id` | derived lowercase SHA-256 |
| `arm_id` | one canonical arm identifier |
| `source` | exact source object below |
| `query` | exact query object below |
| `abstract_domain` | exact abstract-domain object below |
| `encoding` | exact encoding object below |
| `consumer` | exact consumer object below |
| `root_obligations` | exact `r1`, `r2`, and `r3` objects |
| `contract_input_sha256` | derived lowercase SHA-256 |

The nested objects have exactly these fields; no omitted or additional field
is accepted:

| Object | Fields |
| --- | --- |
| `source` | `hypothesis_artifact_sha256`, `scope`, `repository`, `transitive_source_sha256`, `source_requirement` |
| `source.scope` | `scope_id`, `kind`, `cardinality` |
| `source.repository` | `revision`, `dirty_state`, `dirty_state_sha256` |
| `query` | `query_id`, `aggregate_arm_ids`, `source_target_requirement`, `abstract_target_requirement`, `aggregate_coverage_requirement` |
| `abstract_domain` | `schema`, `schema_artifact_sha256`, `validity_requirement`, `representation_requirement` |
| `encoding` | `formula_schema`, `root_formula_sha256`, `variable_map_sha256`, `decoder_mode`, `decoder_input_domain`, `semantic_projection_sha256`, `decoded_object_identity`, `root_formula_requirement`, `formula_to_decoder_projection_requirement`, `decoder_requirement`, `decoder_evidence_requirement` |
| `encoding.decoder_input_domain` | `schema`, `schema_artifact_sha256` |
| `encoding.decoded_object_identity` | `identity_policy_sha256` |
| `consumer` | `query_polarity`, `lean_lift_requirement`, `lean_consumer_requirement` |

`scope.kind` is `FINITE_CARDINALITY` with a positive integer `cardinality`, or
`UNIVERSAL` with null `cardinality`. `repository.revision` is a lowercase
40- or 64-hex revision. `CLEAN` requires a null dirty-state digest; `DIRTY`
requires a lowercase SHA-256 digest. Query polarity is exactly
`SAT_MEANS_COUNTEREXAMPLE` or `UNSAT_MEANS_OBSTRUCTION`.

Input v1 freezes one arm only. `query.aggregate_arm_ids` is the empty list and
`query.aggregate_coverage_requirement` is null. Aggregate coverage requires a
future schema. The only decoder mode is `CANONICAL_PROJECTION_FUNCTION`.
`lean_lift_requirement` and `lean_consumer_requirement` are either both null
or both present.

### 8.2 Producer requirements and closed role placement

A producer requirement states what future evidence must bind; it is not that
evidence. Every non-null requirement has exactly:

```text
role
producer
normalized_statement_sha256
hypothesis_sha256
import_sha256
transitive_source_sha256
repository_policy_sha256
toolchain
trust_classification
validation_receipt_schema
reachability_policy_sha256
dependency_bindings
requirement_sha256
```

`producer` is either `{kind: LEAN_DECLARATION, qualified_name}` with toolchain
kind `LEAN`, or `{kind: EXTERNAL_CHECKER, registry_id, executable_sha256}` with
toolchain kind `EXTERNAL`. `toolchain` also contains `identity_sha256`.
`validation_receipt_schema` names a versioned future receipt schema; it is not
a validation receipt. `trust_classification` is an uppercase token and may not
contain `ACCEPTED`, `AUTHORITY`, `PROMOTION`, `SUCCESS`, or `VERIFIED`.
The Phase-0 validator performs no trust-registry lookup and never interprets
that token as a validation or promotion result.

The role locations are closed:

| Role | Location |
| --- | --- |
| `SOURCE_DOMAIN` | `source.source_requirement` |
| `SOURCE_TARGET` | `query.source_target_requirement` |
| `ABSTRACT_TARGET` | `query.abstract_target_requirement` |
| `ABSTRACT_VALIDITY` | `abstract_domain.validity_requirement` |
| `REPRESENTATION` | `abstract_domain.representation_requirement` |
| `ROOT_FORMULA` | `encoding.root_formula_requirement` |
| `FORMULA_TO_DECODER_PROJECTION` | `encoding.formula_to_decoder_projection_requirement` |
| `DECODER` | `encoding.decoder_requirement` |
| `DECODER_EVIDENCE` | `encoding.decoder_evidence_requirement` |
| `R1_SOURCE_COVERAGE` | `root_obligations.r1.producer_requirement` |
| `R2_ABSTRACT_ENCODING` | `root_obligations.r2.producer_requirement` |
| `R3_ASSIGNMENT_DECODING` | `root_obligations.r3.producer_requirement` |
| `LEAN_LIFT` | `consumer.lean_lift_requirement` |
| `LEAN_CONSUMER` | `consumer.lean_consumer_requirement` |

All roles except `LEAN_LIFT` and `LEAN_CONSUMER` are mandatory. Those two Lean
consumer roles obey the paired-null rule above. Each `dependency_bindings`
list is sorted by `name`, contains no duplicates, and equals the following
closed role matrix exactly:

When a requirement is resolved after Phase 0, the accepted
`p97-cegar-producer-ref/v1` record's `input_digests` must equal this derived
`dependency_bindings` list exactly. The draft deliberately has no second,
caller-supplied `input_digests` list that could disagree with the role matrix.

| Role | Bound digest names |
| --- | --- |
| `SOURCE_DOMAIN` | `arm_id_sha256`, `source_hypothesis_artifact_sha256`, `source_repository_sha256`, `source_scope_sha256`, `source_transitive_source_sha256` |
| `SOURCE_TARGET` | `arm_id_sha256`, `query_id_sha256`, `source_domain_statement_sha256`, `source_hypothesis_artifact_sha256`, `source_scope_sha256` |
| `ABSTRACT_TARGET` | `abstract_schema_artifact_sha256`, `arm_id_sha256`, `query_id_sha256` |
| `ABSTRACT_VALIDITY` | `abstract_schema_artifact_sha256`, `arm_id_sha256` |
| `REPRESENTATION` | `abstract_schema_artifact_sha256`, `arm_id_sha256`, `source_domain_statement_sha256`, `source_scope_sha256` |
| `ROOT_FORMULA` | `abstract_schema_artifact_sha256`, `abstract_target_statement_sha256`, `arm_id_sha256`, `formula_schema_sha256`, `root_formula_sha256`, `variable_map_sha256` |
| `FORMULA_TO_DECODER_PROJECTION` | `arm_id_sha256`, `formula_schema_sha256`, `root_formula_sha256`, `semantic_projection_sha256`, `variable_map_sha256` |
| `DECODER` | `arm_id_sha256`, `decoded_object_identity_sha256`, `decoder_input_domain_schema_artifact_sha256`, `semantic_projection_sha256` |
| `DECODER_EVIDENCE` | `arm_id_sha256`, `decoded_object_identity_sha256`, `decoder_input_domain_schema_artifact_sha256`, `decoder_statement_sha256`, `semantic_projection_sha256` |
| `R1_SOURCE_COVERAGE` | `abstract_schema_artifact_sha256`, `abstract_target_statement_sha256`, `abstract_validity_statement_sha256`, `arm_id_sha256`, `representation_statement_sha256`, `source_domain_statement_sha256`, `source_hypothesis_artifact_sha256`, `source_scope_sha256`, `source_target_statement_sha256` |
| `R2_ABSTRACT_ENCODING` | `abstract_schema_artifact_sha256`, `abstract_target_statement_sha256`, `abstract_validity_statement_sha256`, `arm_id_sha256`, `decoded_object_identity_sha256`, `decoder_input_domain_schema_artifact_sha256`, `decoder_statement_sha256`, `formula_schema_sha256`, `root_formula_sha256`, `semantic_projection_sha256`, `variable_map_sha256` |
| `R3_ASSIGNMENT_DECODING` | `abstract_schema_artifact_sha256`, `abstract_target_statement_sha256`, `abstract_validity_statement_sha256`, `arm_id_sha256`, `decoded_object_identity_sha256`, `decoder_evidence_statement_sha256`, `decoder_input_domain_schema_artifact_sha256`, `decoder_statement_sha256`, `formula_schema_sha256`, `root_formula_sha256`, `semantic_projection_sha256`, `variable_map_sha256` |
| `LEAN_LIFT` | `arm_id_sha256`, `decoded_object_identity_sha256`, `formula_schema_sha256`, `r1_statement_sha256`, `r2_statement_sha256`, `r3_statement_sha256`, `root_formula_sha256`, `source_scope_sha256` |
| `LEAN_CONSUMER` | `arm_id_sha256`, `lean_lift_statement_sha256`, `query_polarity_sha256`, `source_target_statement_sha256` |

### 8.3 Exact root obligations

Each root obligation has schema `p97-cegar-root-obligation/v1` and exactly
`schema`, `role`, `quantifier`, `conclusion`, `producer_requirement`,
`bindings`, and `obligation_sha256`. The bindings duplicate the corresponding
closed role bindings so a role or pointer swap cannot silently change the
obligation.

| Key | Role | Quantifier | Conclusion |
| --- | --- | --- | --- |
| `r1` | `R1_SOURCE_COVERAGE` | `FOR_EVERY_SOURCE_TARGET` | `VALID_ABSTRACT_TARGET_WITH_REPRESENTS` |
| `r2` | `R2_ABSTRACT_ENCODING` | `FOR_EVERY_VALID_ABSTRACT_TARGET` | `TOTAL_ROOT_ASSIGNMENT_SATISFYING_FORMULA_AND_DECODING_SAME_OBJECT` |
| `r3` | `R3_ASSIGNMENT_DECODING` | `FOR_EVERY_TOTAL_SATISFYING_ROOT_ASSIGNMENT` | `CANONICAL_DECODE_IS_VALID_ABSTRACT_TARGET` |

These tokens state obligations only. Their presence and self-hashes do not
show that any producer exists, was resolved, ran, or was accepted.

### 8.4 Digest preimages and custody

Let `H(x)` be SHA-256 of the repository's canonical UTF-8 JSON encoding of
`x`, with sorted object keys, minimal separators, and no trailing newline.
Raw-artifact digest fields bind the retained exact bytes named by the field;
they are not re-hashed as JSON. Derived scalar and structured identities such
as `arm_id_sha256`, `source_scope_sha256`, and `source_repository_sha256` use
`H` on the stated scalar or object.

- `requirement_sha256 = H(requirement without requirement_sha256)`.
- `obligation_sha256 = H(obligation without obligation_sha256)`.
- `contract_id = H(top-level object without contract_id and without contract_input_sha256)`.
- `contract_input_sha256 = H(top-level object without contract_input_sha256)`;
  this preimage includes `contract_id`.

The `contract_id` preimage therefore includes the schema, draft status,
authoritative-schema and producer-reference-schema identifiers, every semantic
identity, every requirement, and all three obligations. A nested digest may
not equal `contract_id` or `contract_input_sha256`; the closed dependency
matrix prevents pointer substitution. Each self-hash excludes only its own
field.

Stored artifacts are at most 1 MiB and use the canonical JSON encoding plus
exactly one final LF. Parsing rejects duplicate keys, unknown fields,
noncanonical bytes, and malformed hashes. Publication is create-once through a
no-follow path and requires a stable single-link regular file; load rejects
symlinks, hard links, FIFOs, replacements, and noncanonical or tampered bytes.
Loading proves only that the bytes are a self-consistent draft. Any Phase-4
resolver must obtain the expected `contract_id` and `contract_input_sha256`
from an authenticated external lane identity and compare both; a pathname is
not that identity. Publishing this draft never publishes an authoritative v2
receipt.
