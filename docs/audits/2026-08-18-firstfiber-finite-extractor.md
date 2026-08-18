# FirstFiber finite packet extractor

Status: **source-side extractor completed; concrete packet materialization
still requires a live finite witness** (2026-08-18).

`FirstFiberFinitePacket.lean` defines
`FiveSurvivorExactRowsBoundary.toIndexedPacket`.  Given a genuine
`FiveSurvivorExactRowsBoundary`, a `BoundaryIndexing`, the five distinct
center memberships, and a nonempty source profile, it produces an indexed
finite packet containing:

- the deleted point and five row centers as `Fin n` labels;
- each exact four-point support reindexed by the boundary indexing;
- explicit order `id : Fin n → Fin n`; and
- proofs of center distinctness, support cardinality, center exclusion, and
  deleted-point omission.

The focused Lean check succeeds.  The extractor's transitive axioms are
`propext`, `Classical.choice`, and `Quot.sound`; it introduces no `sorry` or
custom axiom.

This supplies the source-side ingress function but does not manufacture a
concrete `CounterexampleData` witness.  The live FirstFiber theorem is
universally quantified over arbitrary finite `A`, and no current artifact
instantiates its five-row boundary.  Therefore the strict Python adapter and
piqd lane must remain fail-closed until an actual witness is supplied and
serialized.  Existing `Fin 10` and generic metric systems remain diagnostic
only.
