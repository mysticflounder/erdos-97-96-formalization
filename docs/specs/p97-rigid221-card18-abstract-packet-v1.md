# P97 Rigid221 card-18 abstract packet contract (v1)

**Status: COMPLETE AND PUBLISHABLE; SOLVER GATE CLOSED.**

Lane: `rigid221-card18-abstract-packet-v1-20260827`.

Lane base: `9abb3417c06fd973dfa502009d5f517f0b25c24c`.

## 1. Purpose and architectural boundary

The source-heavy exact-card-eighteen lane now exposes source-linked `Fin 18`
roles, labeled supports, a crossed five-incidence profile, the reviewed common
enrichment, and bi-survival blocker separations. Those declarations still
retain dependent geometric source objects and are not the state space for a
finite contradiction search.

`Rigid221Card18AbstractPacket` is the required pure finite boundary. Its state
contains only `Fin 18` labels and `Finset (Fin 18)` supports. Its decidable
`Valid` predicate is a finite over-approximation: every exact-card-eighteen
source alternative maps to a valid packet, while a valid packet need not
reconstruct a geometric source.

This direction is sufficient for contradiction. A future theorem that no
abstract packet is valid composes with `source_to_abstract_packet`; no
source-witness serializer or reverse reconstruction theorem is required.

## 2. Reuse preflight

The bounded current-project Lean-corpus search found the finite-data,
labeled-projection, crossed-incidence, and labeled-enrichment modules, but no
existing Rigid221 pure abstract packet. Generic `Valid`/`check` declarations
elsewhere provide a pattern only; their packet shapes are not reusable.

The concrete candidate is a constructor-indexed exact-card-eighteen packet.
Its immediate consumer is a future arm-separated checked finite search. Before
the labeled-enrichment commit, the first missing antecedents for the reviewed
stronger surface were the selected-`xv` row, physical-five identity,
deleted-center intersection bound, and bi blocker separations. Commit
`2d6eb3ef92ea381990c12b2633a7bfd015e28174` supplies them without circularity.

The import revision for this checkpoint is
`9abb3417c06fd973dfa502009d5f517f0b25c24c`, which also freezes the isolated
coverage-v3 ledger. Coverage metadata is audit evidence, not an input to the
Lean proof.

## 3. Pure finite state

The packet is constructor-indexed rather than a record with an independent arm
tag, so an arm/payload mismatch is unrepresentable.

### 3.1 Common state

The common role record contains ten `Fin 18` labels:

```text
u, v, xu, xv, deleted,
source1, source2, deletedCenter,
actualCenter1, actualCenter2
```

The common support record contains only:

```text
selectedXvRow, deletedCenterRow : Finset (Fin 18)
```

The physical five-class is derived definitionally as

```text
{deleted, u, xu, v, xv}.
```

It is not stored redundantly.

### 3.2 Crossed state

The crossed payload contains the crossed-only `oppApex2` role and the three
exact supports `K1`, `K2`, and `BO`. The five-incidence profile is recomputed
from these finite memberships in the same semantic order as
`Rigid221FiveIncidenceProfile`; no independent mask is stored.

### 3.3 Bi-survival state

The bi payload contains the four supports `uB1`, `uB2`, `xvB1`, and `xvB2`.
The actual blockers are not stored: the source theorem identifies them with
the common roles `xv` for deletion of `u` and `v` for deletion of `xv`.

The arm and four-cell deletion profile are derived from the packet
constructor. There is no independent arm tag or status table.

All component types and the total packet expose decidable equality and a
finite enumeration interface. This checkpoint does not invoke that
enumeration.

## 4. Exact decidable `Valid` surface

### 4.1 Twelve common atoms

Every packet requires:

1. `source1 ≠ source2`;
2. `actualCenter1 ≠ actualCenter2`;
3. `selectedXvRow.card = 4`;
4. `xv ∈ selectedXvRow`;
5. `u ∈ selectedXvRow`;
6. `source1 ∉ selectedXvRow`;
7. `source2 ∉ selectedXvRow`;
8. `physicalFive.card = 5`;
9. `deletedCenterRow.card = 4`;
10. `deletedCenter ∈ deletedCenterRow`;
11. `deletedCenter ∉ physicalFive`;
12. `(deletedCenterRow ∩ physicalFive).card ≤ 1`.

The four source non-alias facts against `u` and `xv`, and the pairwise
distinctness of the five physical roles, are consequences of these atoms and
are not duplicated in `Valid`.

### 4.2 Twelve crossed-arm atoms

Each crossed constructor additionally requires:

- `K1.card = K2.card = BO.card = 4`;
- the deleted endpoint absent from all three supports;
- the retained endpoint present in all three supports;
- `source1 ∈ K1` and `source2 ∈ K2`; and
- the recomputed five-incidence profile has
  `conjunctionHasFalse = true`.

For constructor `u`, the deleted endpoint is `u` and retained endpoint is
`xv`. For constructor `xv`, the deleted endpoint is `xv` and retained endpoint
is `u`. Each crossed packet therefore has 24 atoms including common validity.

### 4.3 Fourteen bi-survival atoms

The bi constructor additionally requires:

- all four support cards equal four;
- `u` absent from `uB1` and `uB2`;
- `xv` absent from `xvB1` and `xvB2`;
- both same-deletion support intersections have cardinality at most two;
- `xv` differs from both actual centers; and
- `v` differs from both actual centers.

The final four atoms are the source-identified blocker separations. A bi packet
therefore has 26 atoms including common validity.

`check` is exactly `decide p.Valid`, with a theorem identifying Boolean truth
with `Valid`. It is not an external solver or certificate checker.

## 5. Source-to-abstraction theorem

The total proof path is:

```text
Rigid221ExactCardEighteenAlternative
  -> rigid221ExactCardEighteenAlternativeToData
  -> rigid221ExactCardEighteenDataAlternativeToLabeled
  -> rigid221ExactCardEighteenLabeledAlternativeToIncidence
  -> rigid221ExactCardEighteenIncidenceAlternativeToEnriched
  -> enrichedAlternativeToAbstractPacket
```

`enrichedAlternativeToAbstractPacket` returns the subtype

```text
{p : Rigid221Card18AbstractPacket // p.Valid}
```

by constructor-total pattern matching and projection-only proofs.
`source_to_abstract_packet` wraps the composed subtype value in `Nonempty`.
It does not invoke `exists_rigid221ExactCardEighteenAlternative`, a contradiction
leaf, or a reverse reconstruction theorem.

The source conversion is noncomputable because the upstream exact-cardinality
labeling is noncomputable. Its proof term therefore inherits ordinary
`Classical.choice` from that upstream conversion. The resulting abstract state,
`Valid`, and `check` contain no real point, radius, carrier equivalence,
dependent source record, or choice operation.

## 6. Scope and nonclaims

This checkpoint does not provide or authorize:

- naïve exhaustive enumeration of the derived `Fintype`;
- a SAT/SMT/CNF encoding or external search run;
- a `Valid`-to-formula, formula-to-CNF, or certificate correspondence;
- a model, UNSAT result, checked certificate, or `no_valid_abstract_packet`;
- symmetry normalization without a preservation theorem;
- serialization of a geometric source witness; or
- a lift from exact cardinality eighteen to `18 ≤ D.A.card`.

The pure state contains five support sets in each crossed arm and six in the
bi arm. Blind enumeration is not expected to be tractable. A future armwise
encoding or exact-four-support subtype must prove correspondence with this
`Valid` surface before an UNSAT claim can enter Lean.

## 7. Acceptance gates

This checkpoint is publishable only after:

1. the governed module build succeeds;
2. the focused forbidden-mechanism scan is clean;
3. declaration-level axiom reports for the pure check theorem, total enriched
   conversion, and source theorem contain no `sorryAx` or native/external
   evidence;
4. independent review checks all 12/12/14 clauses, arm parameterization,
   recomputed incidence semantics, blocker association, and theorem chain;
5. the generated live-blueprint update is exact; and
6. exact-path staged hygiene passes.

Passing these gates establishes only the source-to-over-approximation theorem.
The solver gate remains closed.

### Verification evidence on 2026-08-27

- The governed module replay completed all 11,033 jobs.
- The focused forbidden-mechanism scan was clean.
- `check_eq_true_iff` reports only `propext` and `Quot.sound`.
- `enrichedAlternativeToAbstractPacket` and `source_to_abstract_packet` report
  only `propext`, `Classical.choice`, and `Quot.sound`.
- Independent semantic review returned GO for the exact 12/12/14 clauses,
  constructor orientation, incidence-profile transport, blocker association,
  theorem chain, and scope claims.
- The generated live blueprint changed only from 1,232 files and 9,528 symbols
  to 1,233 files and 9,570 symbols in the unimported-file census.
- The Lean module has SHA-256
  `457d944e0d9b0dbeb8871f984ccd7f5873875289bf47b93e570b59fc627dae48`.
- Exact-path staged hygiene passed with zero issues and no foreign staged paths.

## 8. Next boundary

After this theorem, add the dedicated off-spine Rigid221 CEGAR aggregate/build
target so the projection, enrichment, abstract packet, custody tests, and
coverage tests cannot silently rot. Then design an arm-separated checked
search correspondence. Do not run the search before that correspondence gate.
