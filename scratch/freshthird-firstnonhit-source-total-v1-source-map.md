# FreshThird FirstNonHit full-carrier `B_n` source map

Date: 2026-08-15

Status: **design/dry-run only**.  This checkpoint emits no SMT/CNF, invokes no
solver, and makes no source-total, coverage, generic-lift, theorem, Lean, or
terminal-UNSAT claim.  The retired 24-role packet is not imported.

## Scope and landing contract

The live leaf is
`false_of_freshThird_firstNonHit` in
`TwoSourceFreshThirdResidual.lean:3053-3062`.  Its carrier is the arbitrary
finite set `D.A`; no source theorem gives a fixed upper bound.  The active
branch does give `17 ≤ D.A.card`, conditional on its exact `C/L/N/T` ingress.
This is proved by `twoCapSourceSurface_carrier_card_ge_seventeen`
(`TwoSourceClosure.lean:159-169`), using
`card_ge_seventeen_of_one_cap_card_ge_eight`
(`ExactFifteenApexProfile.lean:74-83`) and the all-large cap context from
`TriApexEndpointRetainedOmission.lean`.  This is a lower bound, not a cutoff.
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

This is the crucial difference from the named-role packet: selected rows,
deletion survival, and minimal-core shells are computed from one total carrier
relation, never asserted as unrelated truth flags.

## Exact source map

| Contract | Lean source | Quantifier scope | `B_n` representation |
|---|---|---|---|
| Finite carrier and counterexample properties | `U1TwoShortCapReduction.lean:83-93`, `CounterexampleData` | all of `D.A` | identify the carrier with `Fin n`; geometric/convex ingress remains an explicit future bridge |
| Three caps and cap sum | `Cap/PartitionFromMEC.lean:332-354,397-398`, `SurplusCapPacket` | all carrier points, three caps | total cap and strict-interior predicates, fixed cyclic order, three-phase no-alternation schema |
| Boundary indexing | `Census554/GeneralCarrierBridge.lean:62-71` | every carrier point | identify `Fin n` with one fixed convex boundary order; all cap/order constraints use this indexing |
| Live cardinality floor | `TwoSourceClosure.lean:159-169`; `ExactFifteenApexProfile.lean:74-83` | active `C/L/N/T` ingress | require `n ≥ 17`; no upper bound or generic lift is implied |
| Critical shell system | `U1CarrierInjection.lean:1116-1125`, `CriticalShellSystem` | every `q ∈ D.A` | total blocker map, exact four-point row through every source, computed `no_qfree` |
| Exact selected shell | `U1CarrierInjection.lean:638-652`, `CriticalFourShell` | every chosen row | complete radius-equivalence class, not a selected four-subset |
| Two cap sources | `TwoSourceCanonicalSurface.lean:112-144` | two selected carrier sources | role selectors plus cap, blocker, exact-row, and cross-deletion constraints |
| Retained frontier context | `TwoSourceFreshThirdResidual.lean:78-110` | the two retained classes and four endpoints | exact four-point classes, exact strict-cap pairs, pair disjointness, blocker inequality, and all four cross-pair first-apex radius inequivalences derived from `ρ ≠ radius` |
| Cross-pair deletion view | `TwoCollisionGlobalProducer.lean:515-531` | each source and retained endpoint pair | **OR** of the two computed one-point deletion survivals; never strengthened to both |
| Fresh blocker fiber | `BlockerMultiplicityGeometry.lean:70-111` | two selected carrier sources | common blocker, named blocker inequalities, freshness, mutual row incidence |
| Retained radii | `TwoSourceFreshThirdFiber.lean:1129-1136` | every real radius | finite realized-radius form: every same-radius strict-cap pair belongs to one of the two retained classes; needs a Lean equivalence lemma |
| Fixed deletion packet | `TwoSourceFreshThirdRetainedProducer.lean:656-672` | each aligned source and one endpoint from each retained pair | computed omissions, Has4 after two deletions, first-apex non-Has4, and two-point core |
| Minimal deletion core | `MinimalDeletionCore.lean:34-43` | the two members of `U = {x,y}` in this branch | exact first-apex classes through `x`,`y`, with disjoint supports; blocking/minimality stays in the enclosing fixed packet |
| Retained/common ingress | `TwoSourceFreshThirdRetainedProducer.lean:909-924,1175-1179` | both retained sources or one common-radius witness | guarded two-arm disjunction with all payloads computed from carrier relations |
| First-source NonHit | `TwoSourceFreshThirdFiber.lean:2094-2113` | first cap source | both constructors and exact payload: same blocker/support, or one omitted Q endpoint plus computed deletion survival |
| Second-source Interaction | `TwoSourceFreshThirdFiber.lean:2006-2068` | second cap source | all four constructors with exact centers, overlaps, caps, and deletion payloads |
| Carrier-wide query cut | query-only schema from `TwoSourceFreshThirdResidual.lean:3071-3084`; that compatibility theorem depends on the still-open direct residual | every source in `Fin n` | negate existence of a distinct-center source row with Q-row overlap at least three |
| Independent escape producer | `TwoSourceTripleShellEscape.lean:342-356` | one globally produced row | yields an escaping selected row with Q-row overlap at most two; it is not the overlap-at-least-three target |

The source map intentionally treats `FreshThirdCapSourceNonHit` as positive
constructor data, not definitionally as `¬ FreshThirdCrossRowHit`.  It also
treats `MinimalDeletionCore` as a two-source core in this branch, not as a core
over the whole carrier.

## Dry-run output at `n = 17`

The implementation is
`census/p97_search/freshthird_firstnonhit_source_total_v1.py`.

It reports:

- 2,974 pre-CNF Boolean vocabulary entries;
- 41,752 logical obligation instances before Tseitin/cardinality lowering;
- 20 source bindings and a hash/size manifest for all 15 source files;
- `cnf_variables = null`, `cnf_clauses = null` rather than fabricated clause
  counts;
- `launch_eligible = false` and every promotion claim false.

The dominant families are 34,680 radius-equivalence transitivity obligations
and 4,913 carrier-wide `no_qfree` obligations.  These counts are deterministic
and exactly replayed, but they are design counts—not solver complexity claims.

## Required next checkpoint

Before any formula emission, Lean must define a
`FirstNonHitSourceTotalFiniteAssignment` over the actual carrier subtype and
prove an axiom-clean `ofPacket` theorem from the live FirstNonHit inputs.  The
contract must expose:

1. the total blocker map and complete per-center radius-equivalence classes;
2. computed exact rows and `no_qfree` for every source;
3. finite realized-radius data equivalent to
   `FirstCapMultiPointRadiiRetained`;
4. exact one- and two-deletion `Has4` predicates and two-point minimal cores;
5. cap membership, one boundary indexing, and three-phase cap data;
6. all `2 × 4` NonHit/Interaction constructors and both ingress arms;
7. the Q fiber and a separate query interface.

Only after that theorem lands may Python choose a bijection from the carrier to
`Fin n` and be audited field-by-field against the kernel-checked contract.  No
CNF/SMT emission or solving is authorized by this checkpoint.
