# P97 Rigid221 card-18 predicate-coverage manifest (v1)

**Status: COVERAGE MANIFEST COMPLETE / NO SERIALIZER OR SOLVER AUTHORIZED.**

Lane: `rigid221-card18-predicate-coverage-20260827`.

Lane base: `f209fb40954447bacc944c4ba8ea56b7cabccb82`.

## 1. Purpose

The candidate packet validator accepts a finite relational object, while the
Lean labeled projection exposes only part of that object's intended source
semantics. This checkpoint freezes both universes and records the gap without
promoting candidate checks into Lean provenance.

It creates no source-faithful serializer, solver clauses, canary run, model,
UNSAT certificate, or P97 proof claim.

## 2. Two independent coverage axes

Every candidate predicate records how the current Python validator obtains its
value:

- `CALLER_ASSERTION`: the caller supplies a truth-like literal or status;
- `CALLER_DATA`: the caller supplies a label, support, or role reference; or
- `LOCALLY_RECOMPUTED`: Python derives a relation from caller data.

That origin does not say whether Lean entitles the predicate. A separate Lean
source universe records:

- `LABEL_DATA_AVAILABLE`: a concrete `Fin 18` label/support/profile datum or
  field is reachable under the labeled-projection custody root;
- `PROP_AVAILABLE_NOT_EMITTED`: the source retains a theorem or proposition,
  but no finite external representation is emitted; or
- `ABSENT_FROM_LABELED_EXPORT`: the required finite statement has no labeled
  declaration.

Local recomputation is never Lean provenance. Even a predicate associated with
`LABEL_DATA_AVAILABLE` remains externally unbound until a separately audited
adapter and reconstruction check exists.

## 3. Exact candidate universe

The v1 candidate universe has exactly 188 canonical semantic IDs:

| Origin | Count |
|---|---:|
| `CALLER_ASSERTION` | 42 |
| `CALLER_DATA` | 39 |
| `LOCALLY_RECOMPUTED` | 107 |

The independent grammar expands:

- three diagnostic boundary flags;
- exact-cardinality, carrier-label, eleven-role, and role-relation checks;
- all seventeen Blocker-V residual facts;
- five live-parent facts;
- two source/actual-center links and two outside-row facts;
- four deletion-status cells and the arm-selection relation;
- two crossed arms, each with its exact deletion/blocker/common-member roles,
  three support records, support guards and positive memberships, five
  incidence atoms, and the missing-conjunction relation; and
- two bi-survival endpoint packets, each with exact roles, two support records,
  carrier/distinctness/blocker guards and overlap, plus endpoint coverage.

Schema names, theorem-name metadata, materialization guards, canonical JSON
rules, packet identifiers, and source-boundary hashes are tracked as bindings
or validation policy rather than counted as mathematical predicate IDs.

The ordered 188-ID set and its SHA-256 are frozen. Tests regenerate the set
independently instead of importing the implementation's generated list.
Counts alone are never sufficient: omission, replacement, duplication,
reordering, or aliasing of an ID is a validation failure.

## 4. Exact Lean source universe

The source universe has exactly 37 canonical bundle IDs:

### Thirteen labeled-data IDs

```text
arm.constructor
arm.deletion_profile
carrier.card_eq_18
carrier.fin18_labeling
carrier.point_mem
roles.distinctness
roles.label_values
roles.point_equalities
support.bi_intersection
support.bi_overlap
support.crossed_membership
support.four_support_record
support.q_exclusion
```

### Seventeen Prop-only IDs

```text
bi.common_deletion_packet
cap.interior_facts
cap.partition_arc
k4.minimality
k4.radius_classification
parent.blocker_v_residual
parent.p_context
parent.source_heavy_packet
profile.crossed_missing_incidence
profile.deletion_survival
radius.selected_shell
radius.u5_same_radius
row.selected_shell
row.u5_q_deleted_k4
selected_row.origin_and_trace
source.live_parent_facts
source.neutral_origin
```

### Seven absent blocker IDs

```text
cap.fin18_membership_table
k4.fin18_predicate_table
minimality.fin18_clause_projection
order.fin18_cyclic
radius.cross_row_equalities
radius.physical_link
selected_row.fin18_order_table
```

The ordered set, per-status counts, and set hash are frozen. Labeled and
Prop-only rows bind qualified module/declaration/kind anchors under the labeled
projection custody digest. Absent rows have no declaration anchor. Line
numbers may be audit hints only; they are not identity.

A candidate row's Lean status is derived from its referenced immutable source
row, never supplied independently. `LABEL_DATA_AVAILABLE` requires a concrete
data-kind declaration anchor. `PROP_AVAILABLE_NOT_EMITTED` requires a
theorem/Prop-only anchor and cannot claim an executable representation.
`ABSENT_FROM_LABELED_EXPORT` has no declaration anchor and cannot be attested.

## 5. Candidate row contract

Each of the 188 rows has exact fields for:

- canonical predicate ID and origin;
- representation and validation/recomputation algorithm;
- candidate JSON/validator anchor;
- a nonempty, sorted, exact arm-applicability list;
- sorted, unique predicate dependencies;
- references to known Lean source-universe IDs and their coverage status; and
- strict Boolean fields `source_entitled` and `hard_clause_admission`.

Both Boolean fields are `false` for every row in v1. The manifest validator
rejects any escalation to proof, executable source binding, serializer-ready,
hard-clause, or solver-ready status.

The only arm identifiers, in canonical order, are:

```text
BI_SURVIVAL_COMMON_DELETION_RECTANGLE
U_DELETION_MISSING_INCIDENCE
XV_DELETION_MISSING_INCIDENCE
```

Dependencies must be known, non-self-referential, and acyclic. A locally
recomputed row must name its exact inputs and algorithm. Caller assertions and
caller data cannot be upgraded through a recomputed alias. The schema permits
no alias rows. A dependency must apply to every arm on which its dependent row
applies; cross-arm-invalid dependency edges are rejected.

## 6. Frozen bindings and live attestation

The manifest binds, by canonical metadata and content hashes:

- `census/p97_search/rigid221_card18_source_packet.py` (35,567 bytes at the
  lane base, SHA-256
  `a7f0f9b63ffd35b4c97e58a0021cf25a7336bf8c75c33e7ca64f67cb1412169f`),
  its schema `p97-rigid221-card18-source-packet/v1`, and the exact
  candidate-schema snapshot digest;
- `census/p97_search/rigid221_card18_predicate_coverage.py`, whose path and
  live byte count/SHA-256 are recorded in the durable manifest and recomputed
  during attestation without a self-referential source-hash literal;
- the labeled-projection Lean module and its axiom receipt;
- the labeled-projection source-custody schema, root, configuration digest,
  source-manifest digest, durable receipt path, file hash, and receipt
  self-hash; and
- the exact candidate and Lean-universe set hashes.

Live attestation uses no-follow, single-link reads of every bound artifact and
invokes the committed labeled-projection custody attestation against the fresh
Lean source tree. Unknown or stale paths, hashes, roots, schemas, anchors, or
configuration values fail closed.

The axiom artifact is exactly
`certificates/rigid221_card18_labeled_projection_axioms_20260827.json`.
Validation binds its exact 1,405 committed bytes and file SHA-256, rejects
duplicate or malformed JSON, recomputes its body self-hash, and checks its
schema, command, source path, and source digest against the custody manifest.
This establishes receipt integrity and cross-artifact consistency; hashing the
receipt does not independently authenticate its axiom claims.

## 7. Canonical manifest

The durable artifact is

```text
certificates/rigid221_card18_predicate_coverage_v1.json
```

It uses exact keys, strict JSON types and Booleans, sorted duplicate-free rows,
compact canonical UTF-8 bytes, an immutable configuration digest, and a body
self-hash. Parsing rejects duplicate keys, NaN/infinity, noncanonical bytes,
omissions, replacements, reordering, unknown enums, dependency cycles, stale
bindings, and all claim escalation.

Mutation tests independently regenerate both exact ordered ID sets and their
hashes and exercise omissions, replacements, duplicates, reorderings, aliases,
origin/status escalation, caller-truth smuggling, arm changes, dependency
cycles and cross-arm edges, stale hashes and anchors, wrong custody/axiom
receipts, and local-to-Lean provenance escalation.

## 8. Admission result

The only valid v1 result is:

```text
source_faithful_serializer = false
hard_clause_count = 0
solver_admission = false
canary_authorized = false
```

The manifest is a gap ledger, not a solver interface. The seven absent source
IDs and seventeen Prop-only IDs remain blocking even if the candidate validator
can recompute a superficially similar relation from caller data.

## 9. Acceptance gates

This checkpoint is complete only after:

1. independent expansion confirms the exact 188 candidate IDs and 37 Lean
   source IDs, their hashes, and all origin/status counts;
2. every row passes the cross-field, arm, dependency, anchor, and no-escalation
   rules;
3. the full mutation suite and Ruff pass;
4. canonical encode/decode/readback is byte-identical;
5. separate live attestation verifies every frozen binding and the complete
   labeled-projection custody receipt;
6. independent adversarial review confirms completeness and zero hard-clause
   admission;
7. staged worktree hygiene reports no blocker; and
8. exact owned and durable paths are committed and pushed.

Passing these gates authorizes prioritizing the missing Lean projections. It
does not authorize serialization or a solver canary. `CANARY AUTHORIZED`
remains false.

## 10. Completion evidence

On 2026-08-27, the canonical durable manifest was independently audited and
accepted with verdict `GO`. Its exact size is 134,343 bytes, its file SHA-256
is `4031a8ce6d67c5b2d4f10c30753e5fe1aa615d544f679a5dcb303eea5dac69dc`,
and its body self-hash is
`23bb018c8fb625dbd2e7f936322d7df5fc98a7ad87915b68a9684a3f10357e2e`.

The focused mutation suite reports 67 passing tests; the combined candidate,
custody, and coverage suites report 147 passing tests; and Ruff reports no
issues. Fresh live attestation confirms the exact 188/37 universes and their
42/39/107 and 13/17/7 partitions. Every candidate row retains
`source_entitled = false` and `hard_clause_admission = false`; global
`hard_clause_count` is zero, and serializer, solver, and canary admission all
remain false.
