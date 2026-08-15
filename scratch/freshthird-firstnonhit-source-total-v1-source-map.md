# FreshThird FirstNonHit full-carrier `B_n` source map

Date: 2026-08-15

Status: **kernel ingress landed; finite formula still design/dry-run only**.
Commit `813aeae8` adds the axiom-clean
`FirstNonHitSourceTotalFiniteAssignment.ofPacket` contract on the complete
carrier.  This checkpoint still emits no SMT/CNF, invokes no solver, and makes
no source-total, formula-coverage, generic-lift, live-leaf-closure, or
terminal-UNSAT claim.  The retired 24-role packet is not imported.

## Scope and landing contract

The live leaf is
`false_of_freshThird_firstNonHit` in
`TwoSourceFreshThirdResidual.lean:3053-3062`.  Its carrier is the arbitrary
finite set `D.A`; no source theorem gives a fixed upper bound.  The active
branch gives `17 ≤ D.A.card` from the weaker exact `C/L/N` ingress; `T` is not
needed.  This is now proved by
`firstNonHit_sourceTotal_carrier_card_ge_seventeen` in the landed finite
assignment module, using
`card_ge_seventeen_of_one_cap_card_ge_eight`
and the three cap-cardinality margins already carried by `L` and `N`.  This is
a lower bound, not a cutoff.
Therefore `B_17` is the first diagnostic instance, not a reduction of the
universal leaf.

For each `n ≥ 17`, the intended discovery query is:

```text
  all source hypotheses on the full carrier Fin n
+ negation of a carrier-wide distinct-center row with Q-row overlap ≥ 3.
```

An UNSAT result for one `B_n` would remain fixed-cardinality discovery data.
Closing the Lean leaf would additionally require a generic-cardinality lift or
a source theorem producing a bounded obstruction.

## Representation invariant

`CriticalFourShell.center_mem` (`U1CarrierInjection.lean:638-652`) proves that
every chosen critical-shell center is a carrier point distinct from its source.
Consequently the full theory can represent:

- `centerAt`/`blockerVertex` by a total fixed-point-free map
  `blocker_map : Fin n → Fin n`;
- distance classes by `radius_eq[c,x,y]` for every carrier center `c` and
  unordered carrier pair `{x,y}`;
- the selected row of source `q` as the complete equivalence class of `q`
  around `blocker_map[q]`;
- `HasNEquidistantPointsAt 4` after a deletion by cardinality constraints on
  the surviving equivalence classes.

The zero-radius class is forced to be a singleton:
`radius_eq[c,c,x]` is false whenever `x ≠ c`.  Otherwise a relational model
could incorrectly count the center itself in a positive-radius `Has4` witness.

The landed Lean contract already exposes the complete `BoundaryIndexing`, all
eleven typed role indices, the fixed-point-free blocker map, exact radius
equality, exact selected rows, one-deletion `Has4`, cap/interior membership,
the Direct/Mirror boundary blocks, the exact typed ingress/constructor
payloads, and the independent escape witness.  It also proves pullback image,
cardinality, and erase transport.  Typed source payloads are not yet the same
thing as Boolean constructor clauses; the coverage table below records that
distinction explicitly.

## Landed kernel assignment

Commit `813aeae8` lands
`FirstNonHitSourceTotalFiniteAssignment.ofPacket` with:

1. one complete `BoundaryIndexing` and Direct/Mirror boundary blocks;
2. `17 ≤ boundary.n` from `L`, `N`, and `C`;
3. eleven typed role indices and point bridges;
4. a total fixed-point-free blocker map;
5. exact radius equality, four-point rows, row membership, and `no_qfree`;
6. exact one-deletion `Has4` semantics;
7. cap and strict-cap-interior membership predicates; and
8. typed `hingress`, `firstNonHit`, `secondInteraction`, and escape fields.

It intentionally contains no query target, `False`, `secondNonHit`, retained
core in the common arm, or global three-phase/no-alternation theorem.

The v2 dry-run manifest binds that ingress to both commit
`813aeae8d03cf56e77968d636086fff15bdf1e37` and source SHA-256
`676fae430d4f9b53246be42ccee71fe15b8fbefc3450e56737f984d74333707f`;
live byte drift fails closed.

This remains the governing finite-formula requirement: selected rows, deletion
survival, and any later minimal-core projection must be computed from one total
carrier relation, never asserted as unrelated truth flags.

## Exact source map

| Contract | Lean source | Quantifier scope | `B_n` representation |
|---|---|---|---|
| Finite carrier and counterexample properties | `U1TwoShortCapReduction.lean:83-93`, `CounterexampleData` | all of `D.A` | identify the carrier with `Fin n`; geometric/convex ingress remains an explicit future bridge |
| Three caps and cap sum | `Cap/PartitionFromMEC.lean:332-354,397-398`, `SurplusCapPacket` | all carrier points, three caps | landed cap/interior predicates and Direct/Mirror blocks; the planned finite phase state remains opaque |
| Boundary indexing | `Census554/GeneralCarrierBridge.lean:62-71` | every carrier point | identify `Fin n` with one fixed convex boundary order; all cap/order constraints use this indexing |
| Landed finite ingress | `FirstNonHitSourceTotalFiniteAssignment.ofPacket` at commit `813aeae8` | complete actual carrier under `C/L/N`, `hingress`, first `NonHit`, and second `Interaction` | exact `Fin boundary.n` source contract; no query or contradiction field |
| Live cardinality floor | `firstNonHit_sourceTotal_carrier_card_ge_seventeen` | active `C/L/N` ingress | require `n ≥ 17`; no upper bound or generic lift is implied |
| Critical shell system | `U1CarrierInjection.lean:1116-1125`, `CriticalShellSystem` | every `q ∈ D.A` | total blocker map, exact four-point row through every source, computed `no_qfree` |
| Exact selected shell | `U1CarrierInjection.lean:638-652`, `CriticalFourShell` | every chosen row | complete radius-equivalence class, not a selected four-subset |
| Two cap sources | `TwoSourceCanonicalSurface.lean:112-144` | two selected carrier sources | role selectors plus cap, blocker, exact-row, and cross-deletion constraints |
| Retained frontier context | `TwoSourceFreshThirdResidual.lean:78-110` | the two retained classes and four endpoints | source facts exist, but pair-disjointness and cross-pair radius inequalities still need a cycle-safe finite bridge |
| Cross-pair deletion view | `TwoCollisionGlobalProducer.lean:515-531` | each source and retained endpoint pair | pending finite mirror of the **OR** of the two one-point deletion survivals; never strengthen it to both |
| Fresh blocker fiber | `BlockerMultiplicityGeometry.lean:70-111` | two selected carrier sources | `Q` and role indices are landed; the exact finite blocker/freshness/mutual-row payload remains opaque |
| Retained radii | `TwoSourceFreshThirdFiber.lean:1129-1136` | every real radius | guarded opaque aligned-arm payload; needs an exact finite realized-radius iff |
| Fixed deletion packet | `TwoSourceFreshThirdRetainedProducer.lean:656-672` | each aligned source and one endpoint from each retained pair | guarded opaque aligned-arm payload; needs two-delete `Has4` and core transport |
| Minimal deletion core | `MinimalDeletionCore.lean:34-43` | the two members of `U = {x,y}` in this branch | guarded opaque payload, not an unconditional assignment field |
| Retained/common ingress | `TwoSourceFreshThirdRetainedProducer.lean:909-924,1175-1179` | both retained sources or one common-radius witness | exact typed disjunction is landed; its Boolean guards/payloads are not finitely mirrored |
| First-source NonHit | `TwoSourceFreshThirdFiber.lean:2094-2113` | first cap source | exact typed constructor is landed; its two Boolean constructor payloads remain opaque |
| Second-source Interaction | `TwoSourceFreshThirdFiber.lean:2006-2068` | second cap source | exact typed constructor is landed; its four Boolean constructor payloads remain opaque |
| Carrier-wide query cut | external discovery query motivated by `TwoSourceFreshThirdResidual.lean:3071-3084`; the positive producer is still missing | every source in `Fin n` | negate existence of a distinct-center source row with Q-row overlap at least three; never classify this negation as source ingress |
| Independent escape producer | `TwoSourceTripleShellEscape.lean:342-356` | one globally produced row | yields an escaping selected row with Q-row overlap at most two; it is not the overlap-at-least-three target |

The source map intentionally treats `FreshThirdCapSourceNonHit` as positive
constructor data, not definitionally as `¬ FreshThirdCrossRowHit`.  It also
treats `MinimalDeletionCore` as a two-source core in this branch, not as a core
over the whole carrier.

## Kernel-to-schema coverage at `n = 17`

The dry-run manifest now contains one authenticated row for every variable and
obligation family.  The 29 rows cover all 2,974 planned vocabulary entries and
all 41,752 planned logical obligations; coverage of the *design inventory* is
not formula coverage.

| Classification | Families | Instances | Meaning |
|---|---:|---:|---|
| directly landed | 8 | 7,661 | an exact field/iff theorem is already in `ofPacket` |
| derivable from landed fields | 5 | 35,479 | the finite clause is mathematically implied, but its adapter theorem is not yet written |
| missing finite bridge | 2 | 8 | the live source has retained-pair/radius facts that the cycle-safe minimal ingress does not expose |
| opaque source payload | 13 | 1,561 | an exact typed source proposition is preserved, but its guarded constructors/cap blocks are not reindexed into finite clauses |
| query only | 1 | 17 | the negated third-row target is external to source satisfaction |

The five derivable families are the blocker/role exact-one graphs, radius
transitivity, zero-radius singleton, and strict-interior-subset-cap.  The two
missing bridges are retained pair-disjointness and cross-pair radius
inequality.  The thirteen opaque families include the cap phase/cardinality
layer and the guarded retained/common, canonical, Q-fiber, deletion-core,
first-`NonHit`, second-`Interaction`, and escape payloads.

Consequently `source_total=false` is still mandatory.  The landed structure is
a genuine kernel ingress, but it does not authorize treating an opaque typed
payload as if all of the proposed Boolean clauses had already been proved.

## Dry-run output at `n = 17`

The implementation is
`census/p97_search/freshthird_firstnonhit_source_total_v1.py`.

It reports:

- 2,974 pre-CNF Boolean vocabulary entries;
- 41,752 logical obligation instances before Tseitin/cardinality lowering;
- 21 source bindings and a hash/size manifest for all 16 source files,
  including the landed finite-assignment module;
- `cnf_variables = null`, `cnf_clauses = null` rather than fabricated clause
  counts;
- `launch_eligible = false` and every promotion claim false.

The dominant families are 34,680 radius-equivalence transitivity obligations
and 4,913 carrier-wide `no_qfree` obligations.  These counts are deterministic
and exactly replayed, but they are design counts—not solver complexity claims.

## Required next checkpoint

The minimal kernel assignment is complete.  The next checkpoint is a
**finite-mirror adapter layer**, not another source-assignment rewrite.  The
designated aggregate target is
`FirstNonHitCompleteFiniteSourceTheory.lean`:

1. prove finite adapters for radius transitivity, zero-radius singleton,
   strict-interior subset, and cap cardinality/sum from the landed iff fields;
2. either extract an indexed cap-phase state from `capBlocks`, or delete the
   unsupported phase variables and monotonicity family from the first formula;
3. reindex the retained/common disjunction and the first-`NonHit` and
   second-`Interaction` constructors with exact guarded iff theorems;
4. add exact two-deletion `Has4`/minimal-core transport only in the aligned arm;
5. add a cycle-safe adapter for retained pair disjointness and cross-pair
   radius inequalities, or omit those families until such an adapter exists.

The carrier-wide third-row negation remains a separate discovery query.  The
eventual source-level closure target is its positive producer; it must not be
added to `FirstNonHitSourceTotalFiniteAssignment` as an assumption.

Only after every retained formula family is classified as directly landed or
proved by a checked adapter may `source_total` become true and CNF/SMT emission
begin.  Fixed-`n` solving would still be discovery-only pending a
generic-cardinality lift.
