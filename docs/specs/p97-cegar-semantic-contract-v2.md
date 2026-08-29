# P97 CEGAR semantic contract v2

Status: design contract plus canonical-decoder custody; no R1--R3, F1--F7,
source-realization, abstract-closure, or theorem-closure claim.

Date: 2026-08-29

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
