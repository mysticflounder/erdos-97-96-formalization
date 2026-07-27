# P4 compact atom binding ingress

## Result

`BindingData.lean` is a generated, typed binding table for every one of the
2,557 dense variables of the retained P4 compact formula.  A binding records
its dense index, original source-core variable ID, source-map name, one of the
seven retained semantic families, and typed parameters.

This is ingress only.  It neither supplies a Boolean valuation nor proves
source satisfaction, compact-formula satisfaction, UNSAT, or a global P4
claim.

## Authentication

`generate.py` refuses to render if any of these locks drift:

| input | SHA-256 |
| --- | --- |
| `p4.input-core-map.json` | `af829a7c99e0f969f410d398d7c32c2ba5dd945f3a7ebb2ef3f8d7679633d64b` |
| `p4-seed0-compact-manifest.json` | `61efb4c99512ef3cff6968f1513ebb8e3c9009ad3fcc7bb013da70a5d3f37305` |
| compact occurrence ledger | `b1c159058e659cbd06c4540e72e2ca94eef0ef27602733db0bc44122dcdb4aac` |
| manifest stable digest | `8d5b8f5adf40cda367e7e7f72f6afc58e75201011e140ff198ace1c836521dd1` |

It joins the manifest's `old_to_new` map against named literal provenance,
checks consistent source-variable metadata across occurrences, checks dense
coverage of the ledger, and rejects every non-retained family.  `--check`
re-renders and byte-checks the generated Lean source.

## Checked data facts (native compiler trust)

`Main.lean` proves with `native_decide` that the table has exact dense coverage
`1..2557`, unique source IDs, family/parameter constructor agreement, and this
family census:

| family | count |
| --- | ---: |
| membership | 110 |
| radius equality | 495 |
| first-apex class | 11 |
| blocker choice | 21 |
| critical support | 68 |
| row support | 1,716 |
| outer arc | 136 |

`bindingAt_functional` gives the functional dense-to-full-binding property;
therefore each dense variable has a unique source ID, family, and typed
parameter packet.

## Source adapter seam

`DirectSourceAdapter` asks a later direct-source ingress to interpret exactly
the seven typed constructors.  The membership, row-support, and outer-arc
parameter shapes align with the existing
`unique4-p4-source-bridge/P4DirectOuterArcAdapter.lean` atom structures; this
module does not assert an index-to-`Label` conversion or instantiate that
adapter.  Radius equality, first-apex class, blocker, and critical-support
also remain explicit obligations to the corresponding direct source bridge.

Remaining work is therefore a source-index adapter (including `Nat`-to-source
label bounds), seven semantic interpretation lemmas, and a clause-by-clause
connection from the compact occurrence ledger.  None is assumed here.

## Validation and native trust audit

The generator was re-rendered with `--check`.  `AtomBinding.lean`, all ten
payload chunks, `BindingData.lean`, `Main.lean`, and `AxiomAudit.lean` built
with the pinned Lean 4.27 compiler and `-DwarningAsError=true`; their oleans
are retained under `olean-427/`.

The fresh `#print axioms` result is exact:

| theorem | axiom closure |
| --- | --- |
| `exact_binding_data` | `propext`, `Lean.ofReduceBool`, `Lean.trustCompiler` |
| `dense_coverage` | `propext`, `Lean.ofReduceBool`, `Lean.trustCompiler` |
| `family_counts` | `Lean.ofReduceBool`, `Lean.trustCompiler` |
| `bindingAt_functional` | none |

There is no `sorryAx` and no project-defined axiom.  A source scan of this
ingress finds no `unsafe`, `@[implemented_by]`, or `@[extern]` declaration.
The transitive native evaluator does use Lean core `Array` primitives, whose
implementation is marked `@[extern]`; consequently `Lean.trustCompiler` is a
real, explicit compiler-trust boundary, not a kernel-only closure.  This is
acceptable as the requested native-decision ingress check, but it is rejected
as a no-compiler-trust production proof route.  Any production consumer must
either explicitly approve that boundary or replace these scale checks with a
kernel-reduced/generated proof.
