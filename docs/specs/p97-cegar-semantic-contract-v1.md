# P97 CEGAR semantic contract v1

Status: design contract; no implementation or mathematical closure claim.

Date: 2026-08-28

This specification gives P97 a semantic meaning for a CEGAR wave. Existing
wave manifests, journals, solver receipts, and source snapshots establish
custody. They do not by themselves establish the abstract-to-source claims
defined here.

The contract is adapted from the counterexample validation and good-refinement
obligations in Chadha and Viswanathan, arXiv:0807.1173. Their setting is a
finite Markov decision process. P97 instead has source configurations, finite
abstract packets, Boolean encodings, and source-backed learned clauses. The
domain objects differ, but the required directions remain: an abstract proof
must cover every source object, a concrete counterexample must be realized by
the source, and a refinement must preserve every source-derived assignment
while removing a named spurious abstract model.

This is a P97-specific replacement interface, not an application of the
paper's MDP theorem. The paper validates counterexamples through simulation
relations and defines good refinement through a finer state partition and an
exact relation projection. P97 replaces those objects with source realization,
child abstract predicates, encode/decode bridges, and source-preserving
clauses. No result from the paper transfers until the corresponding P97
obligation below is proved.

## 1. Claim boundary

Adopting this document establishes only the intended semantic interface. It
does not establish that any current P97 encoding satisfies the interface.

In particular, this document does not establish:

- source coverage;
- source realizability of a SAT model;
- soundness of an existing learned clause;
- completeness of a detector family;
- finite or aggregate case coverage;
- a universal lift;
- Lean theorem closure; or
- P97 or P96.

Each implementation must discharge the obligations below for one named source
contract, abstract domain, encoding, and consumer. Results from another wave or
cardinality do not inherit those discharges through a shared schema name.

## 2. Semantic objects

One semantic contract fixes the following data.

### 2.1 Source domain

`Source Γ` is the class of concrete P97 configurations satisfying the named
hypothesis packet `Γ`. The contract binds:

- the source theorem or constructor that produces the configuration;
- every hypothesis used by that theorem;
- the cardinality and case scope;
- the source/import revision and exact transitive source digest; and
- the intended Lean consumer.

Changing any item creates a new semantic contract identity.

If the contract begins at the geometric source, `Source Γ` includes the exact
labeled points or coordinates, injectivity, strict convexity, the `K₄`
condition, cardinality, and every case hypothesis used downstream. If it begins
at a checked Lean source packet, the named source theorem must prove that the
geometric source enters that packet. A selected support is only a proved subset
of the relevant physical distance fiber unless a separate theorem supplies
fiber completeness.

### 2.2 Abstract domain

`Abstract` is a finite semantic object such as a checked packet, support
system, order cell, or decoded selector structure. Its validity predicate is
`AbstractValid`.

The abstraction relation is written `Represents c a`, where `c : Source Γ`
and `a : Abstract`. This relation records exactly which source facts the
abstract object retains. Facts omitted from `Abstract` cannot later be assumed
by a detector or consumer.

### 2.3 Boolean domain

For wave `k`, `Formula k` is the authenticated Boolean formula over a fixed
variable map. A total assignment `m` satisfies it when
`Satisfies (Formula k) m` holds. The decode relation is `Decodes m a`.

The contract distinguishes the reviewed root formula from later control
clauses:

- semantic refinement clauses may contribute to a source-level UNSAT result;
- enumeration-control clauses may only prevent repeated model enumeration;
- diagnostic assumptions may only select a finite cell.

These clause classes must remain separate in manifests, receipts, summaries,
and terminal promotion.

### 2.4 Query and arm scope

The contract names a source predicate `SourceTarget` and an abstract predicate
`AbstractTarget`. The root formula encodes `AbstractTarget`; it is not merely a
well-formedness checker for `Abstract`.

One semantic contract covers one arm unless it carries an explicit aggregate
coverage producer. For an arm-scoped contract, every root bridge, model
assessment, refinement, and terminal receipt binds the same `arm_id`.

An aggregate source conclusion additionally requires a checked case-coverage
producer showing that every source target enters at least one named arm. Every
named arm must then have its own accepted terminal receipt. Exhausting one arm
does not establish aggregate coverage.

## 3. Root bridge obligations

The root bridge is accepted only when all applicable directions below have a
named producer and an independently checkable validation route.

### R1. Source coverage

For every `c : Source Γ` satisfying `SourceTarget c`, the producer constructs
an `a : Abstract` such that `AbstractValid a`, `AbstractTarget a`, and
`Represents c a`.

This direction is required before abstract UNSAT can constrain the source.

### R2. Abstract encoding

For every valid abstract target in the admitted arm and scope, the producer
constructs a total assignment satisfying the root formula and decoding to that
object.

This direction is required before root UNSAT can rule out all valid root
abstract targets in the scope. Refined UNSAT uses the repaired child encoding
direction required by F5.

### R3. Assignment decoding

Every total assignment satisfying the root formula decodes to a valid abstract
target in the admitted arm and scope.

This direction is required before a SAT assignment may be described as a
genuine abstract model. A clause-satisfying bit vector without this result is
only an encoding model.

### R4. Concrete realization

A SAT assignment is a concrete counterexample only when it decodes to `a` and
the evidence constructs `c : Source Γ` with `SourceTarget c` and
`Represents c a`, or constructs the corresponding exact source witness
accepted by the named consumer.

Assignment decoding alone does not establish this direction. A valid abstract
packet may still be a relaxation that has no source realization.

## 4. Counterexample assessment

Every accepted SAT result receives exactly one disposition.

### `CONCRETE_COUNTEREXAMPLE`

Required evidence:

- total model replay against the exact formula;
- assignment decoding and abstract validity;
- a source witness satisfying `Γ` and `SourceTarget`;
- a checked `Represents` witness; and
- the named consumer that turns the source witness into the exact query
  conclusion.

This is the only SAT disposition that may refute the source claim.

### `SPURIOUS_WITH_REFINEMENT`

Required evidence:

- total model replay and assignment decoding;
- a named invalidating witness proving that no `c : Source Γ` satisfying
  `SourceTarget c` can represent the decoded object in the claimed scope;
- a semantic refinement receipt satisfying Section 5; and
- exact parent/child formula custody.

The invalidating witness must identify the first source obligation that fails.
A detector label or absence of a known template is insufficient.

In logical form, the accepted witness supplies the direction
`∀ c : Source Γ, SourceTarget c → ¬ Represents c a` for the named decoded
object `a`, or a stronger statement from which this direction is obtained by
the recorded consumer.

### `UNRESOLVED_ABSTRACT_MODEL`

The model is valid for the current Boolean abstraction, but neither a source
witness nor a source-backed invalidating witness is available.

It may be retained as a survivor and blocked for enumeration. Its blocking
clause is an enumeration-control clause. A later finite UNSAT result means only
that the unblocked Boolean search space is exhausted; every retained survivor
must be discharged separately before promotion.

### `INVALID_ENCODING_MODEL`

The assignment fails totality, formula replay, decode, or abstract validity.
This is an encoder, solver-adapter, or custody failure. It does not authorize a
semantic refinement.

## 5. Semantic refinement obligation

Let `m` be the current spurious assignment, `P` the authenticated parent
formula, `r` the proposed refinement clause or clause fragment, and
`C = P ∧ r` the child formula. The parent has abstract target
`ParentTarget`; the child must define `ChildTarget` and a checked projection
from child abstract objects to parent abstract objects.

A source-preserving refinement must establish all of the following.

### F1. Parent exactness

The receipt binds the exact parent formula bytes, variable map, source
contract, semantic contract, model, and decoder used to derive the witness.

### F2. Child exactness

The child formula has one of two admitted constructions:

1. a literal append-only sequence consisting of the parent clauses followed by
   `r`; or
2. an authenticated canonical reconstruction whose semantic-clause inventory
   is the parent inventory plus `r`, and whose enumeration-control inventory is
   tracked separately.

The reconstruction route binds bucket order, clause multiplicity, exact output
bytes, and a checked producer showing that no parent semantic clause was
deleted or changed. It also records any reordering needed by the runner. There
is no variable-universe drift or unrecorded preprocessing.

The current structural runner rebuilds formulas from shard, learned, and
survivor buckets. Its artifacts satisfy F2 only after a validator authenticates
that bucketed reconstruction; they are not a literal append-only stream.

### F3. Current-model elimination

The current assignment does not satisfy `r`.

This gives local progress but does not establish source preservation.

### F4. Source preservation

For every `c : Source Γ` satisfying `SourceTarget c`, every abstract target
produced from `c`, and every assignment produced from that abstract target by
the accepted root bridge, the assignment satisfies `r`.

This direction is the semantic entitlement for adding `r` to a formula whose
UNSAT result may later constrain the source.

The evidence must name one of:

- a Lean theorem proving the direction;
- a checked finite theorem instance plus the proved finite-normal-form and
  placement route that covers the complete contract scope; or
- a stronger approved proof object with a named checker and trust boundary.

A Python detector replay, a clause false on `m`, source-file hashing, or theorem
search receipt does not by itself establish F4.

F4 supports a source-level conclusion only. It does not show that every valid
parent abstract target satisfies `r`; abstract-level claims require the child
target and repaired child bridge in F5.

### F5. Child semantic bridge

The child repairs the semantic bridge instead of strengthening only the
external formula.

For same-domain clause refinement, the contract defines the new source-derived
consequence on abstract objects and sets `ChildTarget` to the parent target
conjoined with that consequence. It then checks three directions:

1. every source target produces a child abstract target;
2. every valid child abstract target produces an assignment satisfying `C`;
3. every assignment satisfying `C` decodes to a valid child abstract target.

The child-to-parent projection is identity on the retained abstract object and
variable map in this case.

Changing the abstract data, variable universe, decode relation, or source scope
requires a successor semantic contract with a named projection producer and
new root-bridge discharges. It is not a clause-only refinement.

Source preservation under F4 can support a separately checked source-to-CNF
argument, but without F5 the step is not a complete semantic CEGAR refinement
under this contract.

### F6. Witness connection

The invalidating witness that rejects `m` supplies the antecedent used by the
source-preservation producer. The compiled clause must bind that exact
antecedent, theorem instance, variable map, and assignment.

The witness identifies the candidate consequence; it does not prove F4 by
itself. F4 still requires an independently checked producer universally
quantifying over the source object, hypotheses, retained abstract target, and
root assignment. The invalidating witness may not enter that producer as an
unproved premise.

### F7. Strict progress

The child excludes at least `m`. If the refinement claims to remove a larger
family, the receipt also gives a checked description of that family and proves
that every member violates `r`.

For a fixed finite variable universe, repeated source-preserving refinements
that satisfy F3 and forbid duplicate assignments make strict finite progress.
Budget, timeout, unknown, and pivot stops remain inconclusive.

## 6. Enumeration control is not semantic refinement

A blocking clause for an unresolved assignment is useful for census and
diversity. It is not entitled by F4 unless the assignment has also received a
source-backed invalidating witness.

Current structural encodings may block only the semantic-variable projection
of a total assignment while omitting auxiliary variables. Such an artifact is
a projection block, not an exact total-assignment block. Its receipt binds the
included semantic variables, omitted variables, projection digest, and one of:

- a checked result that every satisfying total assignment is determined by the
  blocked projection; or
- an explicit claim that the block excludes the whole projected family for
  census purposes only.

Therefore:

1. enumeration-control clauses must have a separate artifact stream and count;
2. terminal proof replay must identify whether those clauses were present;
3. a terminal result with unresolved blocked survivors is an enumeration
   checkpoint, not source UNSAT;
4. survivor records must remain available after terminal solver completion;
5. promotion must list the discharge receipt for every survivor; and
6. a pivot decision may change the next abstraction or source packet, but it
   makes no mathematical claim about the current one.

`ENUMERATION_COMPLETE_WITH_SURVIVORS` is never a semantic terminal status by
itself, even when the terminal Boolean proof is checked. Promotion rejects it
unless every retained survivor has an accepted claim-scoped discharge.

Every survivor discharge declares one claim scope:

- `SOURCE_DISCHARGE` proves that no source target maps to the blocked
  projection. It is admissible only for source-level promotion.
- `ABSTRACT_DISCHARGE` proves that the projected family contains no valid
  child abstract target, or supplies an F1--F7 semantic refinement excluding
  that family. It is required for abstract-level promotion.

A projection block carrying only `SOURCE_DISCHARGE` does not support a claim
that no valid terminal child abstract target remains.

## 7. Terminal result semantics

### SAT

SAT establishes only the disposition recorded under Section 4. A structural
or assumption SAT result does not become a concrete counterexample through a
query-polarity label.

### Discovery UNSAT

Solver-reported UNSAT without an independently checked proof is a discovery
result. It does not establish finite formula UNSAT.

### Certified finite UNSAT

A checked proof establishes that the exact terminal Boolean formula has no
satisfying assignment. To derive that no valid terminal child abstract target
remains, promotion must additionally bind the final child encoding direction
from F5 and show that every added clause was a semantic refinement satisfying
F1--F7. Every projection-blocked survivor also requires an
`ABSTRACT_DISCHARGE`.

The proof receipt binds the exact terminal formula bytes, proof bytes, proof
format, solver identity, trimming steps, checker binary and version, checker
arguments, checker source or binary digest, replay output, exit status, and
trust classification. The checker is selected by a closed reviewed registry.
A caller-supplied `verified` boolean or unchecked callback result is
finite-local evidence, not certified finite UNSAT under this contract.

For a source-level conclusion, the required contradiction chain is more
specific: a source target produces a root abstract target by R1, that target
produces a root assignment by R2, F4 preserves the produced assignment through
every refinement, and the certified terminal UNSAT proof rules it out.

Enumeration-control clauses are permitted only when all blocked survivors have
separate `SOURCE_DISCHARGE` or `ABSTRACT_DISCHARGE` receipts, according to the
promoted claim.

### Source-level conclusion

To derive that no `c : Source Γ` satisfies `SourceTarget c`, promotion must
bind:

- R1, mapping every source object to a valid abstract object;
- R2, mapping every valid abstract object to a root assignment;
- the certified finite UNSAT proof;
- the complete source-preserving refinement chain;
- every survivor discharge; and
- the named Lean lift and consumer.

If the source claim was divided into arms, promotion also binds the aggregate
case-coverage producer and an accepted terminal receipt for every arm.

Failure of any link leaves the result finite-local.

## 8. Required contract artifacts

Future implementation should introduce new schema versions rather than add
meaning to existing v1 fields.

### 8.1 Semantic contract

Schema: `p97-cegar-semantic-contract/v1`.

Required identities:

```json
{
  "schema": "p97-cegar-semantic-contract/v1",
  "contract_id": "lane-and-scope-specific-id",
  "arm_id": "one reviewed source arm",
  "source": {
    "hypothesis_digest": "sha256",
    "scope": "named finite or universal scope",
    "source_producer": {"producer_ref_sha256": "sha256"},
    "source_revision": "repository commit plus dirty-state classification",
    "source_digest": "exact transitive source digest"
  },
  "query": {
    "source_target": {"producer_ref_sha256": "sha256"},
    "abstract_target": {"producer_ref_sha256": "sha256"},
    "aggregate_coverage_producer": null
  },
  "abstract_domain": {
    "schema": "named abstract schema",
    "schema_digest": "sha256",
    "validity_producer": {"producer_ref_sha256": "sha256"},
    "representation_producer": {"producer_ref_sha256": "sha256"}
  },
  "encoding": {
    "formula_schema": "named root-formula schema",
    "root_formula_producer": {"producer_ref_sha256": "sha256"},
    "variable_map_digest": "sha256",
    "source_coverage_producer": {"producer_ref_sha256": "sha256"},
    "abstract_encoding_producer": {"producer_ref_sha256": "sha256"},
    "assignment_decoding_producer": {"producer_ref_sha256": "sha256"}
  },
  "consumer": {
    "query_polarity": "SAT_MEANS_COUNTEREXAMPLE or UNSAT_MEANS_OBSTRUCTION",
    "lean_lift": null,
    "lean_consumer": null
  }
}
```

Null lift or consumer fields force theorem-promotion claims to remain false.

Producer-reference schema: `p97-cegar-producer-ref/v1`.

Every predicate, field ending in `_producer`, `lean_lift`, or `lean_consumer`
is bound by a typed producer reference, not a declaration-name string. A
producer reference binds:

- declaration or checker identity;
- normalized statement digest;
- hypothesis digest;
- import and transitive source digests;
- repository revision and dirty-state classification;
- Lean or external toolchain identity;
- trust classification; and
- a receipt showing that the declaration is reachable and was checked in that
  exact environment.

The canonical semantic contract has a self-hash over its unsigned payload. A
future authoritative wave-manifest schema binds that digest directly. During a
shadow migration, an explicit typed cross-record binds the existing v1 wave
manifest digest to the semantic-contract digest; path adjacency is not a
binding.

### 8.2 Counterexample assessment

Schema: `p97-cegar-counterexample-assessment/v1`.

It binds the semantic-contract digest, wave and attempt identities, formula and
model digests, decoded abstract object, disposition, source witness or
invalidating witness, and any resulting refinement receipt.

### 8.3 Refinement receipt

Schema: `p97-cegar-semantic-refinement/v1`.

It binds the semantic contract; parent, fragment, and child formula digests;
parent and child abstract-target identities; child-to-parent projection;
model and decoded-object digests; invalidating witness; source-preservation and
child-bridge producers; compiled clause; F1--F7 validation results; and clause
class `SEMANTIC_REFINEMENT`.

Each F1--F7 result is a typed evidence reference with exact inputs, checker or
producer identity, and a validation receipt. Caller-supplied success booleans
do not discharge these obligations.

Enumeration blocks use a different schema and may not populate the
source-preservation producer field.

### 8.4 Terminal promotion receipt

Schema: `p97-cegar-semantic-terminal/v1`.

It binds the complete parent/child chain, checked proof, root bridge producers,
refinement receipts, survivor ledger and claim-scoped discharges, lift,
consumer, and exact claim classification. The checked-proof object carries the
complete solver, trimmer, checker, proof-byte, replay, and trust identity
required by Section 7.

## 9. Relationship to current P97 contracts

Current artifacts provide useful inputs but do not silently satisfy this
contract.

| Current artifact | What it establishes | Missing semantic link |
|---|---|---|
| `p97-cegar-wave/v1` manifest | source, encoding, execution, and promotion custody | R1--R4 and F4 producers |
| attempt journal and seal | exact ordered solver history and artifacts | counterexample disposition |
| SAT model replay | total model satisfies one exact formula | R3 and R4 unless separately supplied |
| structural certificate | checked local detector result and clause compilation | source preservation under `Γ` |
| unresolved survivor block | one semantic projection or projected family will not repeat | projection scope and survivor discharge |
| structural runner terminal formula | authenticated root-static, assumption-control, learned-candidate, and enumeration-control inventory bound to exact solver and terminal CNF bytes | F1--F7 evidence for any learned candidate, an assumption contract where applicable, and semantic parent/child F2 receipts |
| campaign classifier receipt | one finite source-derived diagnostic family under its recorded packet | F4 producer over the exact `Source Γ` scope |
| `PIVOT_REQUIRED` | three adjacent finite-local survivors triggered the configured stop | source preservation, coverage, or terminal evidence |
| post-wave theorem-search receipt | authenticated human review and named source-backed candidate | checked semantic producer for F4 |
| certified finite UNSAT | exact terminal formula has no model | root bridge, refinement chain, survivor discharges, and lift |
| `LOCAL_CERTIFICATE` | finite-local evidence | uniform source producer and consumer |
| `UNIFORM_PRODUCER` | named producer over its stated scope | placement or lift into the live source context |
| `LIFTED_CONSUMER` | named producer, lift, and consumer custody | proof that their hypotheses and digests match this chain |

The checked-search correspondence pattern is the preferred root-bridge model:
prove the source-to-assignment direction needed by UNSAT, and separately prove
the assignment-to-valid-abstract-object direction needed to interpret SAT.

The maintained projected-static-v3 runner emits
`p97-cegar-solver-formula-clause-contract/v1` records. These authenticate the
four custody classes above and explicitly report finite-Boolean-formula scope
with source and abstract promotion disabled. `LEARNED_CANDIDATE` is not
`SEMANTIC_REFINEMENT`; only a receipt carrying accepted typed F1--F7 evidence
may use the latter class. This checkpoint supplies formula custody, not F2 or a
semantic terminal receipt.

## 10. Validation and adoption plan

### S0. Specification checkpoint

- review this contract against arXiv:0807.1173;
- review R1--R4 and F1--F7 against one existing source-faithful lane;
- select one abstract-positive SAT control for R3, one separately
  source-realizable control for R4, and one known-UNSAT finite control; and
- make no new solver or Lean claim.

### S1. Shadow receipts

- emit semantic-contract, counterexample-assessment, and refinement receipts
  beside existing v1 artifacts;
- classify every clause as root static, assumption control, learned candidate,
  enumeration control, or accepted semantic refinement; reserve the last class
  for clauses carrying typed F1--F7 evidence;
- reject crossed contract, formula, model, source, or variable-map digests; and
- keep all mathematical claims false.

### S2. Independent finite validation

- replay the abstract-positive control through R3;
- replay the independently source-realizable control through R4 and its exact
  query consumer;
- replay a known spurious model through its invalidating witness;
- prove or independently check F3 and F4 for one refinement family;
- repair and check all three child-bridge directions in F5;
- verify exact parent/child reconstruction; and
- show that an unresolved survivor blocks terminal promotion and that source
  and abstract discharge scopes cannot be crossed.

### S3. Lean promotion

- prove the root bridge in both required directions;
- prove the source-preservation theorem for each admitted refinement family;
- check the finite UNSAT certificate;
- discharge every retained survivor; and
- consume the result through the named lift and live theorem.

Only S3 may change a theorem-closure claim.

## 11. Review questions

Before implementing a new lane, answer all of the following:

1. What exact source objects are covered by `Γ`?
2. Which source facts are retained by `Abstract`?
3. Which direction supports UNSAT, and where is it proved?
4. Which direction makes SAT a genuine abstract model, and where is it proved?
5. What additional witness makes SAT concrete?
6. What exact source obligation invalidates a spurious model?
7. Why does the learned clause preserve every source-derived assignment?
8. Where are the child abstract predicate and all child-bridge directions
   checked?
9. Is the clause semantic refinement or enumeration control?
10. Which strict progress fact is checked?
11. What remains unresolved at budget, timeout, pivot, or discovery UNSAT?
12. Which receipt discharges every retained survivor?
13. Which lift and consumer can use the terminal result?

Any unanswered question is a promotion blocker, not permission to infer the
missing link from solver success or artifact custody.

## 12. References

- Rohit Chadha and Mahesh Viswanathan, *A Counterexample Guided
  Abstraction-Refinement Framework for Markov Decision Processes*,
  <https://arxiv.org/abs/0807.1173>, especially Sections 4 and 5.
- `docs/specs/p97-cegar-wave-v1.md`, the existing wave custody contract.
- `docs/specs/p97-cegar-campaign-v1.md`, the bounded campaign custody and pivot
  contract.
- `docs/specs/p97-rigid221-card18-checked-search-correspondence-v1.md`, the
  checked two-direction root-bridge pattern and source-first refinement rule.
- `docs/specs/p97-exact17-cap9-lean-to-sat-route-v1.md`, the current checked
  finite-normal-form, export, replay, and source landing route.
- `docs/specs/p97-piqd-postwave-theorem-search-v1.md`, the current human-review
  seam for source-backed refinement candidates.
