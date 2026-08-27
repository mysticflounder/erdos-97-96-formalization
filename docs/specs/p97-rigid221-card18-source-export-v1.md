# P97 Rigid221 card-18 Lean source-export contract (v1)

**Status: LEAN EXPORT AND SOURCE CUSTODY IN PROGRESS / NO SOLVER
AUTHORIZED.**

Lane: `rigid221-card18-source-export-20260827`.

Lane base: `9988aa98197a2e2d235243d8acc8503dde5bad2c`.

## 1. Purpose

The candidate JSON contract in
`p97-rigid221-card18-source-packet-v1.md` checks syntax and finite relational
consistency. It deliberately does not show that a packet was produced from the
live Lean residual. This contract defines the next trust boundary: a typed Lean
export of the three exact residual arms, followed by narrow custody of the Lean
source and dependencies on which that export rests.

This checkpoint still creates no CNF, SMT instance, PIQD job, certificate or
general-cardinality lift.

## 2. Exact-cardinality boundary

The live leaf assumes only `18 ≤ D.A.card`. The diagnostic export instead takes
an explicit hypothesis

```lean
hcard : D.A.card = 18
```

and packages an equivalence between the carrier subtype and `Fin 18`. The
export must never derive equality from the live lower bound. Its theorem is
therefore conditional exact-cardinality ingress, not a reduction of the
unbounded leaf.

## 3. Common typed source data

Each exported arm retains, in its Lean type or fields:

- `P : ExactFourRigid221PhysicalApexSourceEqUContext R`;
- the complete
  `ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P`;
- `Q : ExactFourRigid221PentagonBlockerVResidual P packet`;
- exact-cardinality evidence and the `Fin 18` carrier labeling;
- the four live parent hypotheses: `centerAt v = deleted`, deleted-row centre
  in the second-cap interior, that centre outside the physical class, and the
  next selected row's physical-class hit bound at most one;
- the two sources returned by the residual-neutral large-pair producer, both
  outside the `xv` row, with distinct actual centres; and
- the full ambient `D`, `S`, radius, critical system, frontier and residual
  context, so radius, cap/order, selected-row, K4 and minimality projections are
  not replaced by unrelated Boolean attestations.

Retaining a nested Lean context is source entitlement inside Lean. A later
finite serializer must still project every hard predicate explicitly; it may
not cite the nested context as an opaque substitute.

## 4. Exact arm payloads

The export is a disjoint three-constructor type.

### `xv`-deletion crossed arm

It retains failure after deleting `u` at both actual centres, survival after
deleting `xv` at both, all three exact `xv`-deleted
`U5QDeletedK4Class` witnesses and their memberships, and the negation of the
five ordered consumer incidences.

### `u`-deletion crossed arm

It retains the symmetric survival/failure profile, the three exact
`u`-deleted witnesses and memberships, and the same ordered missing-incidence
boundary.

### Bi-survival arm

It retains survival after both deletions at both actual centres and both
source-exact `CommonDeletionTwoCenterPacket`s, one for `q = u` and one for
`q = xv`.

The crossed exporters may eliminate the all-five-incidences case using the
already checked tetrahedron terminal. They must not call any of the three open
`False` leaves. The bi exporter uses the neutral common-deletion rectangle
producer and likewise stops at the packet boundary.

## 5. Trust and custody boundary

The first custody implementation must:

1. authenticate single-link regular files below the resolved repository root
   without following a symlink out of that root or accepting an outside
   hardlink alias;
2. pin the new export module and the exact Lean modules its exported existence
   theorem reaches, using kernel-mined dependency evidence rather than the full
   transitive import closure;
3. record byte counts and SHA-256 digests in a canonical, duplicate-free
   manifest;
4. distinguish source bytes, repository revision metadata, successful Lean
   build, and declaration-level axiom audit as separate facts;
5. reject missing, extra, reordered, changed or escaping manifest entries; and
6. expose no solver, proof-promotion or universal-closure interface.

A source manifest authenticates code identity. It does not by itself prove a
Python serialization equivalent to the Lean export.

## 6. Acceptance gate

This checkpoint is acceptable only when:

- the new Lean module builds without adding `sorry`;
- its export theorem reaches exactly the three intended arm constructors and
  does not depend on the three open residual leaves;
- declaration-level axiom output is recorded in
  `certificates/rigid221_card18_leaf_export_axioms_20260827.json` and
  independently reviewed;
- focused custody tests cover source drift, dependency drift, path escape,
  duplicate keys/paths and canonical round trips;
- the candidate JSON schema is cross-checked field by field against the Lean
  export, with every omitted radius/order/cap/K4/minimality projection still
  listed as a blocker; and
- staged worktree hygiene passes for exact owned paths.

Passing this gate authorizes design and review of a finite serializer. It does
not authorize a solver canary. Canary authorization still requires a complete
object-origin/representation/guard audit, encode/decode readback, a known-answer
smoke instance, and proof-bearing or fully audited model output policy.

Checkpoint evidence (2026-08-27):

- `lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LeafExport`
  completed 11,028 jobs;
- kernel dependency mining reached 27,792 declarations from 133 root
  declarations and froze 30 repository-local source modules; a fresh
  `--compare` reported `UNCHANGED 30 modules`;
- the export source is 18,159 bytes with SHA-256
  `8de5492a0d41833932413092b7de7eb2ea224494873e7058286412d2e75a791e`;
- the declaration-level axiom receipt reports only `propext`,
  `Classical.choice`, and `Quot.sound`, with no `sorryAx`;
- 39 focused custody tests and Ruff pass; and
- independent adversarial review is **GO** for this Lean source/custody
  checkpoint after closing mutable-configuration, strict-Boolean,
  malformed-list, symlink, nonregular-file and outside-hardlink bypasses.

The same review keeps finite serialization and solver admission **BLOCKED**:
crossed row witnesses remain Prop-valued Lean existentials, and the candidate
JSON has no checked projection for the radius/order/cap/K4/minimality data.

## 7. Current JSON cross-check

The committed candidate schema is intentionally weaker than this Lean export:

| Required source object | Candidate JSON status | Remaining source-faithful work |
|---|---|---|
| exact 18-label carrier | represented | bind labels to the Lean carrier equivalence |
| named physical/source/blocker roles | represented as labels | prove every binding is the projection of the typed export |
| `Q` and four live facts | named Boolean attestations | serialize checked projections rather than accept caller truth |
| neutral-producer source pair | source/centre labels and attestations | bind to the sources carried by the Lean existence theorem |
| deletion profile | total finite status matrix | derive it from the selected Lean arm constructor |
| crossed supports/incidences | concrete supports; memberships recomputed | export the Prop-valued row witnesses as data and certify their selected-row/radius realization |
| bi-survival supports | concrete supports; exclusions/overlap recomputed | export both `CommonDeletionTwoCenterPacket` witnesses as data |
| physical radius and required equalities | absent | add explicit finite radius-class predicates and checked projections |
| cyclic order and cap membership | absent except isolated parent attestations | add the ordered-cap carrier projection and all used cap predicates |
| K4/minimality consequences | opaque Lean/type names only | enumerate exactly the consequences admitted as hard clauses |
| dependency and declaration trust | single leaf-source byte hash only | use the narrow custody manifest and axiom receipt defined here |

Until every row in the last column is discharged, the JSON packet remains a
candidate-schema test object and `CANARY AUTHORIZED` is false.
